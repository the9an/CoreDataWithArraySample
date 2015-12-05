//
//  AppDelegate.h
//  CoreDataWithArray
//
//  Created by NguyenTheQuan on 2015/12/05.
//  Copyright © 2015年 Kid. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <CoreData/CoreData.h>

@class CoreDataSaveArrayViewController;

@interface AppDelegate : UIResponder <UIApplicationDelegate>

@property (strong, nonatomic) UIWindow *window;

@property (readonly, strong, nonatomic) NSManagedObjectContext *managedObjectContext;
@property (readonly, strong, nonatomic) NSManagedObjectModel *managedObjectModel;
@property (readonly, strong, nonatomic) NSPersistentStoreCoordinator *persistentStoreCoordinator;

@property (strong, nonatomic) CoreDataSaveArrayViewController *viewController;

- (void)saveContext;
- (NSURL *)applicationDocumentsDirectory;

@end

