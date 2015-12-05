//
//  Array+CoreDataProperties.h
//  CoreDataWithArray
//
//  Created by NguyenTheQuan on 2015/12/05.
//  Copyright © 2015年 Kid. All rights reserved.
//
//  Choose "Create NSManagedObject Subclass…" from the Core Data editor menu
//  to delete and recreate this implementation file for your updated model.
//

#import "Array.h"

NS_ASSUME_NONNULL_BEGIN

@interface Array (CoreDataProperties)

@property (nullable, nonatomic, retain) id arrayData;
@property (nullable, nonatomic, retain) NSString *name;

@end

NS_ASSUME_NONNULL_END
