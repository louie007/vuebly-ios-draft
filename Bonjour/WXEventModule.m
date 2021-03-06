//
//  WXEventModule.m
//  Bonjour
//
//  Created by Vuebly on 15/07/2017.
//  Copyright © 2017 Louie Bao. All rights reserved.
//

#import "WXEventModule.h"
#import "ViewController.h"

#import <WeexSDK/WeexSDK.h>

@implementation WXEventModule

@synthesize weexInstance;

WX_EXPORT_METHOD(@selector(openURL:))

- (void)openURL:(NSString *)url
{
    NSString *newURL = url;
    if ([url hasPrefix:@"//"]) {
        newURL = [NSString stringWithFormat:@"http:%@", url];
    } else if (![url hasPrefix:@"http"]) {
        // relative path
        newURL = [NSURL URLWithString:url relativeToURL:weexInstance.scriptURL].absoluteString;
    }
    
    UIViewController *controller = [[ViewController alloc] init];
    ((ViewController *)controller).url = [NSURL URLWithString:newURL];
    
    [[weexInstance.viewController navigationController] pushViewController:controller animated:YES];
}

@end
