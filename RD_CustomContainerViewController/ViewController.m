//
//  ViewController.m
//  RD_CustomContainerViewController
//
//  Created by Mevan Alles on 16/5/14.
//  Copyright (c) 2014 Home. All rights reserved.
//

#import "ViewController.h"
#import "ChildViewController1.h"
#import "ChildViewController2.h"
#import "ChildViewController3.h"

@interface ViewController ()
{
struct
    {
        unsigned int activeChildViewControllerTag:3;
    } _controlFlags;
}

@property (nonatomic, strong) UIViewController *childVC1;
@property (nonatomic, strong) UIViewController *childVC2;
@property (nonatomic, strong) UIViewController *childVC3;

@property (nonatomic, strong) NSMutableDictionary *childVCDictionary;
@property (weak, nonatomic) IBOutlet UIView *contentView;

@end

@implementation ViewController

- (IBAction)addButtonTapped:(UIButton *)sender
{
    if (sender.tag == _controlFlags.activeChildViewControllerTag) { NSLog(@"same vc"); return; }
    
    UIViewController *currentVC = [self getVCWithIndex:_controlFlags.activeChildViewControllerTag];
    UIViewController *presentingVC = nil;
    
    if (sender.tag == 2)
    {
        if (!self.childVC2)
        {
            self.childVC2 = [[UINavigationController alloc] initWithRootViewController:[ChildViewController2 new]];
            [self.childVCDictionary setObject:self.childVC2 forKey:@(sender.tag)];
        }
    }
    else if (sender.tag == 3)
    {
        if (!self.childVC3)
        {
            self.childVC3 = [[UINavigationController alloc] initWithRootViewController:[ChildViewController3 new]];
            [self.childVCDictionary setObject:self.childVC3 forKey:@(sender.tag)];
        }
    }
    _controlFlags.activeChildViewControllerTag = (uint)sender.tag;
    presentingVC = [self getVCWithIndex:sender.tag];
    
//    [newVC willMoveToParentViewController:self];
    presentingVC.view.frame = self.contentView.bounds;  //Set a frame or constraints
    
    [presentingVC beginAppearanceTransition:YES animated:YES];

    [self addChildViewController:presentingVC];
    [currentVC willMoveToParentViewController:nil];

    [self.contentView addSubview:presentingVC.view];
    [self.contentView sendSubviewToBack:presentingVC.view];
    
    
    CGRect endFrame = self.contentView.bounds;
    
    
    CGFloat scale = 0.001;
    CGAffineTransform transform = CGAffineTransformMakeScale(1, scale);
    transform = CGAffineTransformTranslate(transform, 0 ,-CGRectGetHeight(endFrame)* (pow(scale, -1)) /2.0);
    presentingVC.view.transform = transform;
    
    
    [self transitionFromViewController:currentVC toViewController:presentingVC   // 3
                              duration:0.6 options:UIViewAnimationOptionCurveEaseInOut
                            animations:^{
                                presentingVC.view.transform = CGAffineTransformIdentity;
                            }
                            completion:^(BOOL finished) {
                                [presentingVC didMoveToParentViewController:self];
                                
                                [currentVC removeFromParentViewController];
                            }];

    
}

- (UIViewController *)getVCWithIndex:(NSUInteger)index
{
    return self.childVCDictionary[@(index)];
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    self.childVCDictionary = [NSMutableDictionary dictionary];
    
    UINavigationController *myNav = [[UINavigationController alloc] initWithRootViewController:[ChildViewController1  new]];
    self.childVC1 = myNav;
    
//    [myNav willMoveToParentViewController:self];
    myNav.view.frame = self.contentView.bounds;  //Set a frame or constraints
    [self.contentView addSubview:myNav.view];
    [self addChildViewController:myNav];
    [myNav didMoveToParentViewController:self];
    
    [self.childVCDictionary setObject:myNav forKey:@(1)];
    _controlFlags.activeChildViewControllerTag = 1;
    
}

@end
