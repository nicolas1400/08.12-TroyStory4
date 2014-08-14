//
//  MasterViewController.m
//  TroyStory4
//
//  Created by Nicolas Semenas on 12/08/14.
//  Copyright (c) 2014 Nicolas Semenas. All rights reserved.
//

#import "MasterViewController.h"

#import "DetailViewController.h"
#import "Trojan.h"

@interface MasterViewController ()

@property NSArray * trojans;
@property BOOL toogle;

@end

@implementation MasterViewController

- (IBAction)onToggleProwess:(id)sender {
    self.toogle = !self.toogle;
    [self loadData];
}

- (void)viewDidLoad{
    [super viewDidLoad];
    [self loadData];
  
    
}

-(void) loadData{
    
    NSSortDescriptor *sortDescriptor1 = [[NSSortDescriptor alloc]initWithKey:@"prowess" ascending:NO];
    NSSortDescriptor *sortDescriptor2 = [[NSSortDescriptor alloc]initWithKey:@"name" ascending:NO];

    NSArray *sortDescriptors =[NSArray arrayWithObjects: sortDescriptor1, sortDescriptor2, nil];
    
    NSFetchRequest *request = [[NSFetchRequest alloc]initWithEntityName:@"Trojan"];
    request.sortDescriptors = sortDescriptors;
    
    if (self.toogle){
        request.predicate = [NSPredicate predicateWithFormat:@"prowess >= %d", 5];

    }else{
        request.predicate = [NSPredicate predicateWithFormat:@"prowess <= %d", 5];

    }
    self.trojans = [self.managedObjectContext executeFetchRequest:request error:nil];
    [self.tableView reloadData];
}

- (IBAction)onNewTreasureConquest:(UITextField *)sender {
    
    Trojan *trojan = [NSEntityDescription insertNewObjectForEntityForName:@"Trojan" inManagedObjectContext:self.managedObjectContext];
    trojan.name = sender.text;
    trojan.prowess = [NSNumber numberWithInt: arc4random_uniform(11)];
    [self.managedObjectContext save:nil];
    [sender resignFirstResponder];
    [self loadData];

    
}

-(UITableViewCell *) tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    UITableViewCell * cell = [tableView dequeueReusableCellWithIdentifier:@"Cell"];
    Trojan *trojan = [self.trojans objectAtIndex:indexPath.row];
    cell.textLabel.text = trojan.name;
    cell.detailTextLabel.text = [NSString stringWithFormat:@"%@", trojan.prowess];
    return cell;
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return self.trojans.count;
}



@end
