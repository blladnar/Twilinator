//
//  Twilinator.h
//  Twilio
//
//  Created by Randall Brown on 10/4/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Twilinator : NSObject
{
   NSString *accountSID;
   NSString *authToken;
   NSString *fromNumber;
}

- (id)initWithSID:(NSString*)sid authToken:(NSString*)theAuthToken fromNumber:(NSString*)number;

-(void)sendTextMessage:(NSString*)textToSend toPhoneNumber:(NSString*)phoneNumber completionHandler:(void (^)(NSDictionary *responseDictionary, NSError* error))handler;
@end
