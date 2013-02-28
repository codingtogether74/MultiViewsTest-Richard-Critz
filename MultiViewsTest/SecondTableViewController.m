//
//  SecondTableViewController.m
//  MultiViewsTest
//
//  Created by Richard Critz on 2/27/13.
//  Copyright (c) 2013 Richard Critz. All rights reserved.
//

#import "SecondTableViewController.h"


@interface SecondTableViewController ()

@end

@implementation SecondTableViewController


#pragma mark - Table view data source

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 2;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"SecondTableCell"];
    
    switch (indexPath.row) {
        case 0:
            cell.textLabel.text = @"First Detail View";
            break;
            
        case 1:
            cell.textLabel.text = @"Second Detail View";
            break;
            
        default:
            break;
    }
    
    return cell;
}

- (void)tableView:(UITableView *)tableView willDisplayCell:(UITableViewCell *)cell forRowAtIndexPath:(NSIndexPath *)indexPath
{
    switch (indexPath.row) {
        case 0:
            cell.backgroundColor = [UIColor purpleColor];
            cell.textLabel.textColor = [UIColor whiteColor];
            break;
            
        case 1:
            cell.backgroundColor = [UIColor orangeColor];
            
        default:
            break;
    }
}

// Modified to call transferSplitViewBarButtonItemToViewController:

-(void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    if ([sender isKindOfClass:[UITableViewCell class]]) {
        NSIndexPath *indexPath = [self.tableView indexPathForCell:sender];
        if (indexPath) {
            if ([segue.identifier isEqualToString:@"ShowSecondDetail"]) {
                [self transferSplitViewBarButtonItemToViewController:segue.destinationViewController];
                [segue.destinationViewController setTitle:((UITableViewCell *)sender).textLabel.text];
                UIViewController *dvc = segue.destinationViewController;
                UITableViewCell *cell = sender;
                
                dvc.title = cell.textLabel.text;
                dvc.view.backgroundColor = cell.backgroundColor;
                
            }
        }
    }
}

@end
