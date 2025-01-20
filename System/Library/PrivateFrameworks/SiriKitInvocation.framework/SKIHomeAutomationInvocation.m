@interface SKIHomeAutomationInvocation
+ (id)generateAsyncDialogResponse:(id)a3 reportingDomain:(id)a4;
@end

@implementation SKIHomeAutomationInvocation

+ (id)generateAsyncDialogResponse:(id)a3 reportingDomain:(id)a4
{
  v14[2] = *MEMORY[0x263EF8340];
  id v5 = a4;
  id v6 = a3;
  v7 = [[SKIDirectInvocationPayload alloc] initWithIdentifier:@"com.apple.siri.directInvocation.homeAutomation.async"];
  v13[0] = @"reportingIdentifier";
  v13[1] = @"reportingDomain";
  v14[0] = v6;
  v14[1] = v5;
  v8 = [NSDictionary dictionaryWithObjects:v14 forKeys:v13 count:2];
  [(SKIDirectInvocationPayload *)v7 setUserData:v8];

  v9 = +[SKIDirectInvocationContext contextForAnnounceNotifications];
  v10 = +[SKIDirectInvocation runSiriKitExecutorCommandWithContext:v9 payload:v7];
  v11 = +[SKIDirectInvocation wrapCommandInStartLocalRequest:v10];

  return v11;
}

@end