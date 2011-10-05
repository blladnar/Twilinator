//
//  TwilioAppDelegate.m
//  Twilio
//
//  Created by Randall Brown on 10/4/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import "TwilioAppDelegate.h"
#import "ASIFormDataRequest.h"
#import "Twilinator.h"
#import "SBJSON.h"

@implementation TwilioAppDelegate

@synthesize window;

- (void)applicationDidFinishLaunching:(NSNotification *)aNotification
{
   phoneNumberField.stringValue = [[NSUserDefaults standardUserDefaults] stringForKey:@"PhoneNumber"];
}

- (IBAction)sendText:(id)sender 
{
   if( [phoneNumberField.stringValue length] )
   {
      [[NSUserDefaults standardUserDefaults] setValue:phoneNumberField.stringValue forKey:@"PhoneNumber"];
      [[NSUserDefaults standardUserDefaults] synchronize];
   }
   
   Twilinator *twilio = [[Twilinator alloc] initWithSID:@"YOUR_SID" authToken:@"YOUR_AUTH_TOKEN" fromNumber:@"4155992671"];
   
   [twilio sendTextMessage:textField.stringValue toPhoneNumber:phoneNumberField.stringValue completionHandler:^(NSDictionary *responseDictionary, NSError *error){
      NSLog(@"%@", responseDictionary);
      NSLog(@"%@", error);

      
   }];
   
   
}
@end
