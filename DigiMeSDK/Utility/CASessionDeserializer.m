//
//  CASessionDeserializer.m
//  CASDK
//
//  Created on 29/01/2018.
//  Copyright © 2018 DigiMe. All rights reserved.
//

#import "CASessionDeserializer.h"
#import "DMEClient.h"

@implementation CASessionDeserializer

+ (CASession *)deserialize:(NSData *)jsonData error:(NSError **)error
{
    NSDictionary *json = [NSJSONSerialization JSONObjectWithData:jsonData options:NSJSONReadingMutableContainers error:error];
    
    NSString *sessionKey = json[@"sessionKey"];
    NSDate *expiry = [NSDate dateWithTimeIntervalSince1970:[json[@"expiry"] doubleValue]/1000];
    
    if (sessionKey && expiry)
    {
        return [[CASession alloc] initWithSessionKey:sessionKey expiryDate:expiry sessionManager:[DMEClient sharedClient].sessionManager];
    }
    
    return nil;
}

@end
