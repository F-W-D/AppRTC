//
//  ARTCRoomViewController.m
//  AppRTC
//
//  Created by Kelly Chu on 3/7/15.
//  Copyright (c) 2015 ISBX. All rights reserved.
//

#import "ARTCRoomViewController.h"
#import "ARTCVideoChatViewController.h"
#import <FBSDKCoreKit/FBSDKCoreKit.h>
#import <FBSDKLoginKit/FBSDKLoginKit.h>

@implementation ARTCRoomViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    FBSDKLoginButton *loginButton = [[FBSDKLoginButton alloc] init];
    loginButton.readPermissions = @[@"public_profile", @"email"];
    loginButton.center = self.view.center;
    
    [self.view addSubview:loginButton];
    if ([FBSDKAccessToken currentAccessToken]) {
     //User is logged in:
    }
}

- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    [[self navigationController] setNavigationBarHidden:NO animated:YES];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 1;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    if (indexPath.row == 0) {
        ARTCRoomTextInputViewCell *cell = (ARTCRoomTextInputViewCell *)[tableView dequeueReusableCellWithIdentifier:@"RoomInputCell" forIndexPath:indexPath];
        [cell setDelegate:self];
        
        return cell;
    }
    
    return nil;
}



#pragma mark - Navigation

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    ARTCVideoChatViewController *viewController = (ARTCVideoChatViewController *)[segue destinationViewController];
    [viewController setRoomName:sender];
}

#pragma mark - ARTCRoomTextInputViewCellDelegate Methods

- (void)roomTextInputViewCell:(ARTCRoomTextInputViewCell *)cell shouldJoinRoom:(NSString *)room {
    [self performSegueWithIdentifier:@"ARTCVideoChatViewController" sender:room];
}

@end
