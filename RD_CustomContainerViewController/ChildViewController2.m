//
//  ChildViewController2.m
//  RD_CustomContainerViewController
//
//  Created by Mevan 2359  on 16/5/14.
//  Copyright (c) 2014 Home. All rights reserved.
//

#import "ChildViewController2.h"

@interface ChildViewController2 ()

@end

@implementation ChildViewController2

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
    DLog();
    [super viewDidLoad];
    
    self.title = @"Hello I'm root child VC";
    CGFloat hue = ( arc4random() % 256 / 256.0 );  //  0.0 to 1.0
    CGFloat saturation = ( arc4random() % 128 / 256.0 ) + 0.5;  //  0.5 to 1.0, away from white
    CGFloat brightness = ( arc4random() % 128 / 256.0 ) + 0.5;  //  0.5 to 1.0, away from black
    UIColor *color = [UIColor colorWithHue:hue saturation:saturation brightness:brightness alpha:1];
    
    self.view.backgroundColor = color;
}

- (void)viewDidAppear:(BOOL)animated
{
    DLog();
    [super viewDidAppear:animated];
}

- (void)viewDidDisappear:(BOOL)animated
{
    DLog();
    [super viewDidDisappear:animated];
}


@end
