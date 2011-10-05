//
//  Twilinator.m
//  Twilio
//
//  Created by Randall Brown on 10/4/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import "Twilinator.h"
#import "ASIFormDataRequest.h"
#import "SBJSON.h"

@implementation Twilinator

- (id)initWithSID:(NSString*)sid authToken:(NSString*)theAuthToken fromNumber:(NSString*)number
{
    self = [super init];
    if (self) {
       accountSID = [sid retain];
       authToken = [theAuthToken retain];
       fromNumber = [number retain];
    }
    
    return self;
   
   
}

-(void)dealloc
{
   [accountSID release];
   [authToken release];
   [fromNumber release];
}

-(void)sendTextMessage:(NSString*)textToSend toPhoneNumber:(NSString*)phoneNumber completionHandler:(void (^)(NSDictionary *responseDictionary, NSError *error))handler;
{
   __block ASIFormDataRequest *request = [[[ASIFormDataRequest alloc] initWithURL:[NSURL URLWithString:[NSString stringWithFormat:@"https://api.twilio.com/2010-04-01/Accounts/%@/SMS/Messages.json", accountSID]]] autorelease];
   
   [request setUsername:accountSID];
   [request setPassword:authToken];
   
   [request addPostValue:fromNumber forKey:@"From"];
   [request addPostValue:phoneNumber forKey:@"To"];
   [request addPostValue:textToSend forKey:@"Body"];
   
   [request setCompletionBlock:^(){
      SBJsonParser *parser = [[[SBJsonParser alloc] init] autorelease];
      NSDictionary *responseDict = [parser objectWithString:request.responseString];
      handler( responseDict, nil );
      
   }];
   
   [request setFailedBlock:^(){
      handler( nil, request.error );
   }];
   
   [request startAsynchronous];
}



@end
