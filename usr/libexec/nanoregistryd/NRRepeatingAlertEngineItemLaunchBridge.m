@interface NRRepeatingAlertEngineItemLaunchBridge
+ (id)launchURL;
- (void)defaultButtonWasPressed;
- (void)launchBridge;
@end

@implementation NRRepeatingAlertEngineItemLaunchBridge

+ (id)launchURL
{
  return @"bridge://";
}

- (void)defaultButtonWasPressed
{
}

- (void)launchBridge
{
  v2 = [(id)objc_opt_class() launchURL];
  v3 = [v2 stringByAppendingString:@"launchedBy=%@"];

  id v13 = 0;
  v4 = +[NSString stringWithValidatedFormat:v3, @"%@", &v13, NRPairedDeviceRegistryLaunchedByNanoRegistryD validFormatSpecifiers error];
  id v5 = v13;
  v6 = [(id)objc_opt_class() launchURL];

  if (v6 && !v5)
  {
    v7 = +[FBSOpenApplicationService serviceWithDefaultShellEndpoint];
    v14[0] = FBSOpenApplicationOptionKeyPayloadURL;
    v8 = +[NSURL URLWithString:v6];
    v14[1] = FBSOpenApplicationOptionKeyIsSensitiveURL;
    v15[0] = v8;
    v15[1] = &__kCFBooleanTrue;
    v9 = +[NSDictionary dictionaryWithObjects:v15 forKeys:v14 count:2];
    v10 = +[FBSOpenApplicationOptions optionsWithDictionary:v9];

    [v7 openApplication:@"com.apple.Bridge" withOptions:v10 completion:&stru_100169740];
LABEL_7:

    goto LABEL_8;
  }
  v11 = nr_daemon_log();
  BOOL v12 = os_log_type_enabled(v11, OS_LOG_TYPE_ERROR);

  if (v12)
  {
    v7 = nr_daemon_log();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR)) {
      sub_1000FBA14();
    }
    goto LABEL_7;
  }
LABEL_8:
}

@end