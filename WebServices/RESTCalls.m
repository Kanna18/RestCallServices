//
//  RESTCalls.m
//  INCOIS
//
//  Created by Gaian on 2/6/17.
//  Copyright © 2017 Gaian. All rights reserved.
//

#import "RESTCalls.h"

@implementation RESTCalls


{

    NSArray *jsonArray;
    NSDictionary *jsonDictionary;
    
}

-(id)init
{
    self=[super init];
    if(self)
    {
        
    }
    return self;
}


-(void)restCallurl:(NSString*)url parametersDict:(NSDictionary*)paramsDict headers:(NSDictionary*)headersDict
{
    NSMutableURLRequest *request=[[NSMutableURLRequest alloc]initWithURL:[NSURL URLWithString:url]];
    NSURLSession *session=[NSURLSession sessionWithConfiguration:[NSURLSessionConfiguration defaultSessionConfiguration] delegate:self delegateQueue:[NSOperationQueue mainQueue]];

    if(headersDict)
    {
        for (NSString *header in headersDict.allKeys)
        {
            [request setValue:[headersDict valueForKey:header] forHTTPHeaderField:header];
        }
    }
    if(paramsDict)
    {
        NSString *post=@"";
        for (NSString *key in paramsDict.allKeys)
        {
            post=[post stringByAppendingString:[NSString stringWithFormat:@"%@=%@&",key,[paramsDict valueForKey:key]]];
        }
        post=[post substringToIndex:post.length-1];
        NSLog(@"string'%@'",post);
        
        NSData *postData = [post dataUsingEncoding:NSASCIIStringEncoding allowLossyConversion:YES];
        NSString *postLength = [NSString stringWithFormat:@"%lu",(unsigned long)[postData length]];
        [request setHTTPMethod:@"POST"];
        [request setValue:postLength forHTTPHeaderField:@"Content-Length"];
        [request setValue:@"application/x-www-form-urlencoded"  forHTTPHeaderField:@"Content-Type"];
        [request setHTTPBody:postData];
    }
    NSLog(@"POST METHOD--%@",request);

 NSURLSessionTask *dataTask=[session dataTaskWithRequest:request completionHandler:^(NSData * _Nullable data, NSURLResponse * _Nullable response, NSError * _Nullable error) {

        if(data!=NULL)
        {
            jsonArray=[NSJSONSerialization JSONObjectWithData:data options:0 error:nil];
            jsonDictionary=[NSJSONSerialization JSONObjectWithData:data options:0 error:nil];
            NSLog(@"Server is connecting");
            
        }
     [_delegate jsonResponseWithError:jsonArray jsonDictionary:jsonDictionary error:error];
    }];
    [dataTask resume];
}



@end
