//
//  MasterViewController.h
//  TroyStory4
//
//  Created by Nicolas Semenas on 12/08/14.
//  Copyright (c) 2014 Nicolas Semenas. All rights reserved.
//

#import <UIKit/UIKit.h>

#import <CoreData/CoreData.h>

@interface MasterViewController : UITableViewController <NSFetchedResultsControllerDelegate>

@property (strong, nonatomic) NSManagedObjectContext *managedObjectContext;

@end
