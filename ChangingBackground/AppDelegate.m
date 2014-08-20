//
//  AppDelegate.m
//  ChangingBackground
//
//  Created by Jeffrey Camealy on 4/15/13.
//  Copyright (c) 2013 Ora Interactive. All rights reserved.
//

#import "AppDelegate.h"
#import "FirstViewController.h"

@interface AppDelegate () {
    UIWindow *window;
}
@end


@implementation AppDelegate

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    window = [UIWindow.alloc initWithFrame:UIScreen.mainScreen.bounds];
    [window makeKeyAndVisible];
    
    FirstViewController *firstViewController = FirstViewController.new;
    UINavigationController *navigationController = [UINavigationController.alloc initWithRootViewController:firstViewController];
    [navigationController setNavigationBarHidden:YES];

    // create image view with blue image
    UIImageView *blueImageView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"blue.png"]];
    blueImageView.frame = UIScreen.mainScreen.bounds;
    // add it as a subview to the view of the navigation controller
    [navigationController.view addSubview:blueImageView];
    // send it to the back, behind the content views of the navigation controller
    [navigationController.view sendSubviewToBack:blueImageView];

    // create image view with green image
    UIImageView *greenImageView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"green.png"]];
    greenImageView.frame = UIScreen.mainScreen.bounds;
    // add it as a subview to the view of the navigation controller
    [navigationController.view addSubview:greenImageView];
    // send it to the back, behind the content views of the navigation controller and the blue image view
    [navigationController.view sendSubviewToBack:greenImageView];

    window.rootViewController = navigationController;
    
    return YES;
}

@end
