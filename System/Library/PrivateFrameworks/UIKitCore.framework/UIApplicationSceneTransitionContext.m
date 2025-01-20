@interface UIApplicationSceneTransitionContext
- (BOOL)disableTouchCancellationOnRotation;
- (BOOL)forTesting;
- (BOOL)isUISubclass;
- (BOOL)safeMode;
- (BOOL)shouldTakeKeyboardFocus;
- (BOOL)waitForBackgroundTaskCompletion;
- (NSDictionary)payload;
- (OS_xpc_object)launchMetricsPayload;
- (UISClickAttribution)clickAttribution;
- (UISPasteSharingToken)pasteSharingToken;
- (double)execTime;
- (double)userLaunchEventTime;
- (id)keyDescriptionForSetting:(unint64_t)a3;
- (id)valueDescriptionForFlag:(int64_t)a3 object:(id)a4 ofSetting:(unint64_t)a5;
- (int64_t)statusBarAnimation;
- (unint64_t)_lifecycleActionType;
- (unint64_t)signpostID;
- (void)_setLifecycleActionType:(unint64_t)a3;
- (void)setClickAttribution:(id)a3;
- (void)setDisableTouchCancellationOnRotation:(BOOL)a3;
- (void)setExecTime:(double)a3;
- (void)setForTesting:(BOOL)a3;
- (void)setLaunchMetricsPayload:(id)a3;
- (void)setPasteSharingToken:(id)a3;
- (void)setPayload:(id)a3;
- (void)setSafeMode:(BOOL)a3;
- (void)setShouldTakeKeyboardFocus:(BOOL)a3;
- (void)setSignpostID:(unint64_t)a3;
- (void)setStatusBarAnimation:(int64_t)a3;
- (void)setUserLaunchEventTime:(double)a3;
- (void)setWaitForBackgroundTaskCompletion:(BOOL)a3;
@end

@implementation UIApplicationSceneTransitionContext

- (void)setExecTime:(double)a3
{
  id v5 = [(FBSSettings *)self otherSettings];
  v4 = [NSNumber numberWithDouble:a3];
  [v5 setObject:v4 forSetting:4];
}

- (BOOL)isUISubclass
{
  return 1;
}

- (NSDictionary)payload
{
  v3 = [(FBSSettings *)self otherSettings];
  v4 = [v3 objectForSetting:1];

  id v5 = [(UIApplicationSceneTransitionContext *)self clickAttribution];
  if (v5)
  {
    v6 = (void *)[v4 mutableCopy];
    v7 = v6;
    if (v6) {
      id v8 = v6;
    }
    else {
      id v8 = (id)objc_opt_new();
    }
    v9 = v8;

    [v9 setObject:v5 forKey:@"UIApplicationLaunchOptionsEventAttributionKey"];
  }
  else
  {
    v9 = 0;
  }
  v10 = [(UIApplicationSceneTransitionContext *)self pasteSharingToken];
  if (v10)
  {
    if (!v9)
    {
      v11 = (void *)[v4 mutableCopy];
      v12 = v11;
      if (v11) {
        id v13 = v11;
      }
      else {
        id v13 = (id)objc_opt_new();
      }
      v9 = v13;
    }
    [v9 setObject:v10 forKey:@"UIApplicationLaunchOptionsPasteSharingTokenKey"];
  }
  if (v9) {
    v14 = v9;
  }
  else {
    v14 = v4;
  }
  v15 = v14;

  return v15;
}

- (UISPasteSharingToken)pasteSharingToken
{
  v2 = (void *)MEMORY[0x1E4FB3410];
  v3 = [(FBSSettings *)self otherSettings];
  v4 = [v3 objectForSetting:14];
  id v5 = objc_msgSend(v2, "bs_secureDecodedFromData:", v4);

  return (UISPasteSharingToken *)v5;
}

- (UISClickAttribution)clickAttribution
{
  v2 = (void *)MEMORY[0x1E4FB33C8];
  v3 = [(FBSSettings *)self otherSettings];
  v4 = [v3 objectForSetting:13];
  id v5 = objc_msgSend(v2, "bs_secureDecodedFromData:", v4);

  return (UISClickAttribution *)v5;
}

- (void)setUserLaunchEventTime:(double)a3
{
  id v5 = [(FBSSettings *)self otherSettings];
  v4 = [NSNumber numberWithDouble:a3];
  [v5 setObject:v4 forSetting:5];
}

- (void)setForTesting:(BOOL)a3
{
  id v3 = [(FBSSettings *)self otherSettings];
  [v3 setFlag:BSSettingFlagForBool() forSetting:2];
}

- (void)setStatusBarAnimation:(int64_t)a3
{
  id v5 = [(FBSSettings *)self otherSettings];
  v4 = [NSNumber numberWithInteger:a3];
  [v5 setObject:v4 forSetting:11];
}

- (void)setClickAttribution:(id)a3
{
  id v4 = a3;
  id v6 = [(FBSSettings *)self otherSettings];
  id v5 = objc_msgSend(v4, "bs_secureEncoded");

  [v6 setObject:v5 forSetting:13];
}

- (void)setLaunchMetricsPayload:(id)a3
{
  id v4 = a3;
  id v5 = [(FBSSettings *)self otherSettings];
  [v5 setObject:v4 forSetting:7];
}

- (void)setSignpostID:(unint64_t)a3
{
  id v5 = [(FBSSettings *)self otherSettings];
  id v4 = [NSNumber numberWithUnsignedLongLong:a3];
  [v5 setObject:v4 forSetting:6];
}

- (BOOL)safeMode
{
  v2 = [(FBSSettings *)self otherSettings];
  char v3 = [v2 BOOLForSetting:3];

  return v3;
}

- (OS_xpc_object)launchMetricsPayload
{
  v2 = [(FBSSettings *)self otherSettings];
  char v3 = [v2 objectForSetting:7];

  return (OS_xpc_object *)v3;
}

- (BOOL)disableTouchCancellationOnRotation
{
  v2 = [(FBSSettings *)self otherSettings];
  char v3 = [v2 BOOLForSetting:12];

  return v3;
}

- (void)setPayload:(id)a3
{
  id v4 = a3;
  id v5 = [v4 objectForKey:@"UIApplicationLaunchOptionsEventAttributionKey"];
  if (v5)
  {
    id v6 = (void *)[v4 mutableCopy];
    [v6 removeObjectForKey:@"UIApplicationLaunchOptionsEventAttributionKey"];
    [(UIApplicationSceneTransitionContext *)self setClickAttribution:v5];
  }
  else
  {
    id v6 = 0;
  }
  uint64_t v7 = *MEMORY[0x1E4FB3510];
  id v8 = [v4 objectForKey:*MEMORY[0x1E4FB3510]];
  if (v8)
  {
    if (!v6) {
      id v6 = (void *)[v4 mutableCopy];
    }
    [v6 removeObjectForKey:v7];
    [(UIApplicationSceneTransitionContext *)self setPasteSharingToken:v8];
  }
  if (v6) {
    v9 = v6;
  }
  else {
    v9 = v4;
  }
  id v11 = v9;

  v10 = [(FBSSettings *)self otherSettings];
  [v10 setObject:v11 forSetting:1];
}

- (int64_t)statusBarAnimation
{
  v2 = [(FBSSettings *)self otherSettings];
  char v3 = [v2 objectForSetting:11];
  int64_t v4 = [v3 integerValue];

  return v4;
}

- (BOOL)forTesting
{
  v2 = [(FBSSettings *)self otherSettings];
  char v3 = [v2 BOOLForSetting:2];

  return v3;
}

- (void)setSafeMode:(BOOL)a3
{
  id v3 = [(FBSSettings *)self otherSettings];
  [v3 setFlag:BSSettingFlagForBool() forSetting:3];
}

- (double)userLaunchEventTime
{
  v2 = [(FBSSettings *)self otherSettings];
  id v3 = [v2 objectForSetting:5];
  [v3 doubleValue];
  double v5 = v4;

  return v5;
}

- (unint64_t)signpostID
{
  v2 = [(FBSSettings *)self otherSettings];
  id v3 = [v2 objectForSetting:6];
  unint64_t v4 = [v3 unsignedIntegerValue];

  return v4;
}

- (double)execTime
{
  v2 = [(FBSSettings *)self otherSettings];
  id v3 = [v2 objectForSetting:4];
  [v3 doubleValue];
  double v5 = v4;

  return v5;
}

- (BOOL)shouldTakeKeyboardFocus
{
  v2 = [(FBSSettings *)self otherSettings];
  char v3 = [v2 BOOLForSetting:9];

  return v3;
}

- (void)setShouldTakeKeyboardFocus:(BOOL)a3
{
  id v3 = [(FBSSettings *)self otherSettings];
  [v3 setFlag:BSSettingFlagForBool() forSetting:9];
}

- (BOOL)waitForBackgroundTaskCompletion
{
  v2 = [(FBSSettings *)self otherSettings];
  char v3 = [v2 BOOLForSetting:10];

  return v3;
}

- (void)setWaitForBackgroundTaskCompletion:(BOOL)a3
{
  id v3 = [(FBSSettings *)self otherSettings];
  [v3 setFlag:BSSettingFlagForBool() forSetting:10];
}

- (void)setDisableTouchCancellationOnRotation:(BOOL)a3
{
  id v3 = [(FBSSettings *)self otherSettings];
  [v3 setFlag:BSSettingFlagForBool() forSetting:12];
}

- (void)setPasteSharingToken:(id)a3
{
  id v4 = a3;
  id v6 = [(FBSSettings *)self otherSettings];
  double v5 = objc_msgSend(v4, "bs_secureEncoded");

  [v6 setObject:v5 forSetting:14];
}

- (void)_setLifecycleActionType:(unint64_t)a3
{
  id v5 = [(FBSSettings *)self otherSettings];
  id v4 = [NSNumber numberWithUnsignedInteger:a3];
  [v5 setObject:v4 forSetting:8];
}

- (unint64_t)_lifecycleActionType
{
  v2 = [(FBSSettings *)self otherSettings];
  id v3 = [v2 objectForSetting:8];
  unint64_t v4 = [v3 unsignedIntegerValue];

  return v4;
}

- (id)keyDescriptionForSetting:(unint64_t)a3
{
  if (a3 - 1 > 0xC) {
    return 0;
  }
  else {
    return off_1E52F0218[a3 - 1];
  }
}

- (id)valueDescriptionForFlag:(int64_t)a3 object:(id)a4 ofSetting:(unint64_t)a5
{
  id v6 = a4;
  uint64_t v7 = v6;
  id v8 = 0;
  switch(a5)
  {
    case 2uLL:
    case 3uLL:
    case 9uLL:
    case 0xAuLL:
    case 0xCuLL:
      BSSettingFlagIsYes();
      NSStringFromBOOL();
      v9 = (__CFString *)objc_claimAutoreleasedReturnValue();
      goto LABEL_3;
    case 8uLL:
      _UIApplicationSceneLifecycleActionTypeDescription([v6 integerValue]);
      v9 = (__CFString *)objc_claimAutoreleasedReturnValue();
      goto LABEL_3;
    case 0xBuLL:
      uint64_t v11 = [v6 integerValue];
      v12 = @"none";
      if (v11 == 1) {
        v12 = @"fade";
      }
      if (v11 == 2) {
        v12 = @"slide";
      }
      v9 = v12;
LABEL_3:
      id v8 = v9;
      break;
    default:
      break;
  }

  return v8;
}

@end