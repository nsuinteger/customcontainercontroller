//
//  ChildViewController1.m
//  RD_CustomContainerViewController
//
//  Created by Mevan Alles on 16/5/14.
//  Copyright (c) 2014 Home. All rights reserved.
//

#import "ChildViewController1.h"

@interface ChildViewController1 ()

@end

@implementation ChildViewController1

- (IBAction)buttonTapped:(id)sender
{
    UIViewController *controller = [UIViewController new];
    [self.navigationController pushViewController:controller animated:YES];
}

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    self.title = @"Hello I'm root child VC";
    self.view.backgroundColor = arc4random()%2 == 0 ? [UIColor redColor] : [UIColor blueColor];
}

@end
