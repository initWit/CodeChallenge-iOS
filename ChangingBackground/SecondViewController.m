//
//  SecondViewController.m
//  ChangingBackground
//
//  Created by Jeffrey Camealy on 4/15/13.
//  Copyright (c) 2013 Ora Interactive. All rights reserved.
//

#import "SecondViewController.h"
#import "FirstViewController.h"
#import <QuartzCore/QuartzCore.h>


@implementation SecondViewController


- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];

    // get blue image view
    UIImageView *blueImageView = [self.navigationController.view.subviews objectAtIndex:1];

    // fade out blue image view so the green image view appears and fades in
    [UIView animateWithDuration:1.5 animations:^{
        blueImageView.alpha = 0.0;
    }];
}


- (UIStatusBarStyle)preferredStatusBarStyle
{
    // set the status bar to white
    return UIStatusBarStyleLightContent;
}


- (IBAction)goBackButtonPressed
{
    FirstViewController *firstViewController = FirstViewController.new;

    // create custom transition to replace navigation controller pop animation
    CATransition *transition = [CATransition animation];
    transition.duration = 0.3f;
    transition.timingFunction = [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseInEaseOut];
    transition.type = kCATransitionPush;
    transition.subtype = kCATransitionFromLeft;

    // get the top most subview of nav controller, which is the navigation transition view
    UIView *transitionView = self.navigationController.view.subviews.lastObject;

    // apply the custom transition to the layer of the navigation controller's navigation transition view
    [transitionView.layer addAnimation:transition forKey:nil];

    // push the view controller without animation
    [self.navigationController pushViewController:firstViewController animated:NO];
}

@end
