//
//  FirstTableViewController.m
//  MultiViewsTest
//
//  Created by Richard Critz on 2/27/13.
//  Copyright (c) 2013 Richard Critz. All rights reserved.
//

#import "FirstTableViewController.h"

@interface FirstTableViewController ()
@end

@implementation FirstTableViewController

#pragma mark - table view data source

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 3;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:(indexPath.row == 0) ? @"SubTableCell" : @"FirstTableCell"];
    
    switch (indexPath.row) {
        case 0:
            cell.textLabel.text = @"Options list 2";
            break;
            
        case 1:
            cell.textLabel.text = @"First Detail View";
            break;
            
        case 2:
            cell.textLabel.text = @"Second Detail View";
            break;
            
        default:
            break;
    }
    
    return cell;
}

#pragma mark - Segue

// Modified to call transferSplitViewBarButtonItemToViewController:

-(void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    if ([sender isKindOfClass:[UITableViewCell class]]) {
        NSIndexPath *indexPath = [self.tableView indexPathForCell:sender];
        if (indexPath) {
            if ([segue.identifier isEqualToString:@"ShowFirstDetail"]) {
                [self transferSplitViewBarButtonItemToViewController:segue.destinationViewController];
                [segue.destinationViewController setTitle:((UITableViewCell *)sender).textLabel.text];
                
            }
        }
    }
}
@end
