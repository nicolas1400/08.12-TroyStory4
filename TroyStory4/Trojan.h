//
//  Trojan.h
//  TroyStory4
//
//  Created by Nicolas Semenas on 12/08/14.
//  Copyright (c) 2014 Nicolas Semenas. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>


@interface Trojan : NSManagedObject

@property (nonatomic, retain) NSString * name;
@property (nonatomic, retain) NSNumber * prowess;

@end
