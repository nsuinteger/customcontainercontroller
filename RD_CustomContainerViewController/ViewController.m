//
//  ViewController.m
//  RD_CustomContainerViewController
//
//  Created by Mevan Alles on 16/5/14.
//  Copyright (c) 2014 Home. All rights reserved.
//

#import "ViewController.h"
#import "ChildViewController1.h"

@interface ViewController ()

@property (nonatomic, strong) NSMutableArray *childViewControllers;
@property (weak, nonatomic) IBOutlet UIView *contentView;

@end

@implementation ViewController

- (IBAction)addButtonTapped:(id)sender
{
    ChildViewController1 *vc = [ChildViewController1 new];
    [self.childViewControllers addObject:vc];
    
    [self addChildViewController:vc];
    vc.view.frame = self.contentView.bounds;
    [self.contentView addSubview:vc.view];
    [vc didMoveToParentViewController:self];
   
    /*
     this bottom part is which I need help with
     */
//    ChildViewController1 *vc = [ChildViewController1 new];
//    UINavigationController *nav = [[UINavigationController alloc] initWithRootViewController:vc];
//    [self.childViewControllers addObject:nav];
//    
//    [self addChildViewController:vc];
//    vc.view.frame = self.contentView.bounds;
//    [self.contentView addSubview:vc.view];
//    [vc didMoveToParentViewController:self];
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    self.childViewControllers = [NSMutableArray array];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
