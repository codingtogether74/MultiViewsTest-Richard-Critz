//
//  SecondDetailViewController.m
//  MultiViewsTest
//
//  Created by Richard Critz on 2/27/13.
//  Copyright (c) 2013 Richard Critz. All rights reserved.
//

#import "SecondDetailViewController.h"

@interface SecondDetailViewController ()
@property (weak, nonatomic) IBOutlet UIToolbar *toolbar;
@property (weak, nonatomic) IBOutlet UIBarButtonItem *titleBarButtonItem;
@property (weak, nonatomic) IBOutlet UILabel *label;
@end

@implementation SecondDetailViewController
@synthesize splitViewBarButtonItem = _splitViewBarButtonItem;   // implementation of SplitViewBarButtonItemPresenter protocol

- (void)viewDidLoad
{
    [super viewDidLoad];
    self.label.text = self.title;
    [self handleSplitViewBarButtonItem:self.splitViewBarButtonItem];
}
- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    if (self.view.backgroundColor == [UIColor purpleColor]) {
        self.label.textColor = [UIColor whiteColor];
    }
}

- (void)setTitle:(NSString *)title
{
    super.title = title;
//    self.navigationItem.title = title;
//    self.navigationBar.topItem.title = title;
    self.titleBarButtonItem.title =self.title; 
}


#pragma mark - SplitViewBarButtonItemPresenter protocol

// Puts the splitViewBarButton in our toolbar (and/or removes the old one).
// Must be called when our splitViewBarButtonItem property changes
//  (and also after our view has been loaded from the storyboard (viewDidLoad)).

- (void)handleSplitViewBarButtonItem:(UIBarButtonItem *)splitViewBarButtonItem
{
    NSMutableArray *toolbarItems = [self.toolbar.items mutableCopy];
    if (_splitViewBarButtonItem) [toolbarItems removeObject:_splitViewBarButtonItem];
    if (splitViewBarButtonItem) [toolbarItems insertObject:splitViewBarButtonItem atIndex:0];
    self.toolbar.items = toolbarItems;
    _splitViewBarButtonItem = splitViewBarButtonItem;
}

- (void)setSplitViewBarButtonItem:(UIBarButtonItem *)splitViewBarButtonItem
{
    if (splitViewBarButtonItem != _splitViewBarButtonItem) {
        [self handleSplitViewBarButtonItem:splitViewBarButtonItem];
    }
}

@end
