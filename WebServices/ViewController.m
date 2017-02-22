//
//  ViewController.m
//  WebServices
//
//  Created by Gaian on 2/18/17.
//  Copyright © 2017 Gaian. All rights reserved.
//

#import "ViewController.h"
#import "RESTCalls.h"


@interface ViewController ()<JSONResponse>

@end

@implementation ViewController{
    
    BOOL isPost;
    BOOL isGet;
    RESTCalls *rest;
    
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    rest=[[RESTCalls alloc]init];
    rest.delegate=self;
    
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)postMethod:(id)sender {
    
    isPost=YES;
    NSDictionary *params=@{};
    NSDictionary *headers=@{};
    [rest restCallurl:@"" parametersDict:params headers:headers];
    
}

- (IBAction)getMethodClick:(id)sender {
    
    isGet=YES;
    NSDictionary *params=@{@"":@""};
    NSDictionary *headers=@{@"":@""};
    
    [rest restCallurl:@"" parametersDict:params headers:headers];
}

-(void)jsonResponseWithError:(NSArray *)jsonRespArr jsonDictionary:(NSDictionary *)jsonRespDict error:(NSError *)error
{
    /*This method return json data in the form of both Dictionary and Array along with Error*/
    
    NSLog(@"Data %@",jsonRespDict);
    
    if(isPost)
    {
        /*Write your code for post Button Click Response*/
    }
    if(isGet)
    {
        /*Write your code for Get Button Click Response*/
    }
    
    isPost=NO;
    isGet=NO;
}
@end
