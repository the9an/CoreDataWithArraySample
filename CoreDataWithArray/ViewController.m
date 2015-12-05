//
//  ViewController.m
//  CoreDataWithArray
//
//  Created by NguyenTheQuan on 2015/12/05.
//  Copyright © 2015年 Kid. All rights reserved.
//

#import "ViewController.h"
#import "AppDelegate.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)saveData:(id)sender {
    
    //get instance of app delegate
    AppDelegate *appDelegate = [[UIApplication sharedApplication]delegate];
    //create managed object context
    NSManagedObjectContext *context = [appDelegate managedObjectContext];
    //create a managed object, which will be an instance of your entity Array
    NSManagedObject *newArray;
    //create the instance
    newArray = [NSEntityDescription insertNewObjectForEntityForName:@"Array" inManagedObjectContext:context];
    
    NSArray *sampleArray = @[@"bread", @"butter", @"milk", @"cheese", @"cereal"];
    NSMutableData *data = [NSMutableData data];
    NSKeyedArchiver *encoder = [[NSKeyedArchiver alloc] initForWritingWithMutableData:data];
    [encoder encodeObject:sampleArray forKey:@"array"];
    [encoder finishEncoding];
    
    
    [newArray setValue:data forKey:@"arrayData"];
    [newArray setValue:_arrayNameTextField.text forKey:@"name"];
    //clear the text fields
    _arrayNameTextField.text = @"";
    //save the data
    NSError *error;
    [context save:&error];
    //output message
    _outputLabel.text = @"Array saved";
}

- (IBAction)fetchData:(id)sender {
    //get instance of app delegate
    AppDelegate *appDelegate = [[UIApplication sharedApplication] delegate];
    //create managed object context
    NSManagedObjectContext *context = [appDelegate managedObjectContext];
    //get entity description
    NSEntityDescription *entityDesc = [NSEntityDescription entityForName:@"Array" inManagedObjectContext:context];
    //create a fetch request
    NSFetchRequest *request = [[NSFetchRequest alloc]init];
    [request setEntity:entityDesc];
    //create predicate to filter request. We will be filtering our search by whatever is in the name text field.
    NSPredicate *pred  = [NSPredicate predicateWithFormat:@"(name = %@)", _arrayNameTextField.text];
    [request setPredicate:pred];
    //put the results in a managed object
    NSManagedObject *matches = nil;
    NSError *error;
    NSArray *objects = [context executeFetchRequest:request error:&error];
    //test the results of the search request
    if ([objects count] ==0 ) {
        _outputLabel.text = @"No Array by that name found";
    } else {
        matches = objects[0];
        //get the arrayData (string) and add it to a sting object.
        NSMutableData *data = [matches valueForKey:@"arrayData"];
        NSKeyedUnarchiver *decoder = [[NSKeyedUnarchiver alloc] initForReadingWithData:data];
        NSArray *array = [decoder decodeObjectForKey:@"array"];
        [decoder finishDecoding];
        
        //cast the index as an int
        //output the results
        NSString *arrayString = [array componentsJoinedByString:@","];
        //if there is no index number in the array index, just print the name of array and the string
        _outputLabel.text = [NSString stringWithFormat:@"%@: %@",[matches valueForKey:@"name"],arrayString];
    }
}


@end
