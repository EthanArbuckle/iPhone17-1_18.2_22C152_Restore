@interface WCDRadarUserNotification
+ (BOOL)showUserNotificationWithTitle:(id)a3 message:(id)a4 defaultButtonTitle:(id)a5 cancelButtonTitle:(id)a6 withCompletionBlock:(id)a7;
+ (void)showTapToRadarAlertWithMessage:(id)a3 forRadarIdentifier:(id)a4 oncePerBuild:(BOOL)a5;
@end

@implementation WCDRadarUserNotification

+ (void)showTapToRadarAlertWithMessage:(id)a3 forRadarIdentifier:(id)a4 oncePerBuild:(BOOL)a5
{
  BOOL v5 = a5;
  id v8 = a3;
  id v9 = a4;
  v10 = +[NSUserDefaults standardUserDefaults];
  v11 = (void *)MGCopyAnswer();
  v12 = +[NSString stringWithFormat:@"rdar_%@", v9];
  if (!v5
    || ([v10 objectForKey:v12],
        v13 = objc_claimAutoreleasedReturnValue(),
        unsigned __int8 v14 = [v13 isEqual:v11],
        v13,
        (v14 & 1) == 0))
  {
    v17[0] = _NSConcreteStackBlock;
    v17[1] = 3221225472;
    v17[2] = sub_10001C148;
    v17[3] = &unk_1000451D0;
    id v18 = v9;
    if ([a1 showUserNotificationWithTitle:@"WatchConnectivity Detected A Problem" message:v8 defaultButtonTitle:@"File a bug" cancelButtonTitle:@"Dismiss" withCompletionBlock:v17])
    {
      v15 = +[NSUserDefaults standardUserDefaults];
      [v15 setObject:v11 forKey:v12];

      v16 = +[NSUserDefaults standardUserDefaults];
      [v16 synchronize];
    }
  }
}

+ (BOOL)showUserNotificationWithTitle:(id)a3 message:(id)a4 defaultButtonTitle:(id)a5 cancelButtonTitle:(id)a6 withCompletionBlock:(id)a7
{
  v22[0] = kCFUserNotificationAlertHeaderKey;
  v22[1] = kCFUserNotificationAlertMessageKey;
  v23[0] = a3;
  v23[1] = a4;
  v22[2] = kCFUserNotificationDefaultButtonTitleKey;
  v22[3] = kCFUserNotificationAlternateButtonTitleKey;
  v23[2] = a5;
  v23[3] = a6;
  v22[4] = kCFUserNotificationAlertTopMostKey;
  v22[5] = @"SBUserNotificationDismissOnLock";
  v23[4] = &__kCFBooleanTrue;
  v23[5] = &__kCFBooleanFalse;
  v22[6] = @"SBUserNotificationDontDismissOnUnlock";
  v22[7] = @"SBUserNotificationAllowLockscreenDismissalKey";
  v23[6] = &__kCFBooleanTrue;
  v23[7] = &__kCFBooleanFalse;
  id v11 = a7;
  id v12 = a6;
  id v13 = a5;
  id v14 = a4;
  id v15 = a3;
  CFDictionaryRef v16 = +[NSDictionary dictionaryWithObjects:v23 forKeys:v22 count:8];

  v17 = (void (**)(id, const void *, CFOptionFlags))[v11 copy];
  id v18 = CFUserNotificationCreate(kCFAllocatorDefault, 0.0, 0, 0, v16);
  v19 = v18;
  if (v18)
  {
    CFOptionFlags v21 = 0;
    CFUserNotificationReceiveResponse(v18, 0.0, &v21);
    if (v17) {
      v17[2](v17, v19, v21);
    }
    CFRelease(v19);
  }

  return v19 != 0;
}

@end