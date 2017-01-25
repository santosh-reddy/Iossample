//
//  ViewController.m
//  MobiInventory
//
//  Created by Macbookpro-10 on 20/01/17.
//  Copyright © 2017 eTouch Systems. All rights reserved.
//

#import "ViewController.h"
#import <AFNetworking.h>
#import <AFHTTPSessionManager.h>


//#define kParseBaseAPIURL @"http://188.40.74.207:8888/api/customer"
#define kParseBaseAPIURL @"http://188.40.74.207:8888/api/order/"
@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self afnetworkParsing];
    // Do any additional setup after loading the view, typically from a nib.
}

-(void)afnetworkParsing{
    
    NSString *temp = [kParseBaseAPIURL stringByAppendingString:@"WELLI"];
    NSURL *URL = [NSURL URLWithString:temp];
    AFHTTPSessionManager *manager = [AFHTTPSessionManager manager];
    [manager.requestSerializer setAuthorizationHeaderFieldWithUsername:@"admin" password:@"admin"];
   // NSArray *params = @[@"WELI"];
    [manager.requestSerializer setValue:@"19.197" forHTTPHeaderField:@"lat"];
    [manager.requestSerializer setValue:@"72.950" forHTTPHeaderField:@"long"];
   
    
    [manager GET:URL.absoluteString parameters:nil progress:nil success:^(NSURLSessionTask *task, id responseObject) {
        NSLog(@"JSON: %@", responseObject);
    } failure:^(NSURLSessionTask *operation, NSError *error) {
        NSLog(@"Error: %@", error);
    }];
}
-(void)customerDetails{
    
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
