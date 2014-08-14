//
//  DetailViewController.h
//  TroyStory4
//
//  Created by Nicolas Semenas on 12/08/14.
//  Copyright (c) 2014 Nicolas Semenas. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface DetailViewController : UIViewController

@property (strong, nonatomic) id detailItem;

@property (weak, nonatomic) IBOutlet UILabel *detailDescriptionLabel;
@end
