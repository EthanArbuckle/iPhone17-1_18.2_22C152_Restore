@interface SKIVoiceShortcutsInvocation
+ (id)cleanseTriggerIdIfNeeded:(id)a3;
+ (id)startVoiceShortcutInCarPlayUsingTriggerId:(id)a3 withTriggerName:(id)a4 fromApp:(id)a5;
@end

@implementation SKIVoiceShortcutsInvocation

+ (id)startVoiceShortcutInCarPlayUsingTriggerId:(id)a3 withTriggerName:(id)a4 fromApp:(id)a5
{
  v18[3] = *MEMORY[0x263EF8340];
  id v7 = a5;
  id v8 = a4;
  id v9 = a3;
  v10 = [[SKIDirectInvocationPayload alloc] initWithIdentifier:@"com.apple.siri.directInvocation.RunVoiceShortcut"];
  v17[0] = @"triggerId";
  v11 = +[SKIVoiceShortcutsInvocation cleanseTriggerIdIfNeeded:v9];

  v18[0] = v11;
  v18[1] = v8;
  v17[1] = @"triggerName";
  v17[2] = @"appBundleId";
  v18[2] = v7;
  v12 = [NSDictionary dictionaryWithObjects:v18 forKeys:v17 count:3];
  [(SKIDirectInvocationPayload *)v10 setUserData:v12];

  v13 = +[SKIDirectInvocationContext contextForCarPlayDirectAction];
  v14 = +[SKIDirectInvocation runSiriKitExecutorCommandWithContext:v13 payload:v10];
  v15 = +[SKIDirectInvocation wrapCommandInStartLocalRequest:v14];

  return v15;
}

+ (id)cleanseTriggerIdIfNeeded:(id)a3
{
  id v3 = a3;
  if ([v3 hasPrefix:@"prompt:"])
  {
    id v4 = [v3 substringFromIndex:objc_msgSend(@"prompt:", "length")];
  }
  else
  {
    id v4 = v3;
  }
  v5 = v4;

  return v5;
}

@end