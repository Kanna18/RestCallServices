//
//  RESTCalls.h
//  INCOIS
//
//  Created by Gaian on 2/6/17.
//  Copyright © 2017 Gaian. All rights reserved.
//

#import <Foundation/Foundation.h>

@protocol JSONResponse <NSObject>

-(void)jsonResponseWithError:(NSArray*)jsonRespArr jsonDictionary:(NSDictionary*)jsonRespDict error:(NSError*)error;

@end

@interface RESTCalls : NSObject<NSURLSessionDelegate,NSURLSessionTaskDelegate,NSURLSessionDataDelegate>

@property id <JSONResponse>delegate;
-(void)restCallurl:(NSString*)url parametersDict:(NSDictionary*)paramsDict headers:(NSDictionary*)headersDict;

@end
