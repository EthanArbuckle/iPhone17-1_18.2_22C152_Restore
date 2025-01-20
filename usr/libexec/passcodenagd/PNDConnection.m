@interface PNDConnection
+ (BOOL)isChangingPasscode;
+ (NSObject)statusLock;
+ (unint64_t)_cdpSecretTypeFromUnlockScreenType:(int)a3;
+ (void)_checkPasscodeCompliance;
+ (void)notifyCDPThatPasscodeChangedTo:(id)a3 completion:(id)a4;
+ (void)registerKeepAliveFileDeleteNotification;
+ (void)registerLanguageChangedNotification;
+ (void)registerLockStateChangedNotification;
+ (void)registerSpringboardNotification;
+ (void)setIsChangingPasscode:(BOOL)a3;
+ (void)setPendingKeepAliveDeletion:(BOOL)a3;
+ (void)shutdown;
@end

@implementation PNDConnection

+ (NSObject)statusLock
{
  if (qword_10000C3A8 != -1) {
    dispatch_once(&qword_10000C3A8, &stru_100008368);
  }
  v2 = (void *)qword_10000C3A0;

  return v2;
}

+ (BOOL)isChangingPasscode
{
  v2 = [a1 statusLock];
  objc_sync_enter(v2);
  char v3 = byte_10000C398;
  objc_sync_exit(v2);

  return v3;
}

+ (void)setIsChangingPasscode:(BOOL)a3
{
  v5 = [a1 statusLock];
  objc_sync_enter(v5);
  byte_10000C398 = a3;
  int v6 = byte_10000C399;
  objc_sync_exit(v5);

  if (v6 && !a3)
  {
    v7 = _MCLogObjects[6];
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v8 = 0;
      _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "Handling postponed keep-alive deletion notification", v8, 2u);
    }
    [a1 shutdown];
  }
}

+ (void)setPendingKeepAliveDeletion:(BOOL)a3
{
  id obj = [a1 statusLock];
  objc_sync_enter(obj);
  byte_10000C399 = a3;
  objc_sync_exit(obj);
}

+ (void)registerKeepAliveFileDeleteNotification
{
  MCPasscodeNagKeepAliveFilePath();
  id v3 = objc_claimAutoreleasedReturnValue();
  int v4 = open((const char *)[v3 cStringUsingEncoding:1], 0x8000);

  if (v4 < 0)
  {
    v5 = _MCLogObjects[6];
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_ERROR, "Could not open file at Keep-Alive file!", buf, 2u);
    }
    [a1 shutdown];
  }
  dispatch_source_t v6 = dispatch_source_create((dispatch_source_type_t)&_dispatch_source_type_vnode, v4, 1uLL, (dispatch_queue_t)&_dispatch_main_q);
  v7 = (void *)qword_10000C390;
  qword_10000C390 = (uint64_t)v6;

  handler[0] = _NSConcreteStackBlock;
  handler[1] = 3221225472;
  handler[2] = sub_100005004;
  handler[3] = &unk_100008388;
  handler[4] = a1;
  dispatch_source_set_event_handler((dispatch_source_t)qword_10000C390, handler);
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472;
  v8[2] = sub_1000050D8;
  v8[3] = &unk_1000083A8;
  int v9 = v4;
  dispatch_source_set_cancel_handler((dispatch_source_t)qword_10000C390, v8);
  dispatch_activate((dispatch_object_t)qword_10000C390);
}

+ (void)shutdown
{
  v2 = _MCLogObjects[6];
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v2, OS_LOG_TYPE_DEFAULT, "passcodenagd is shutting down...", buf, 2u);
  }
  if (qword_10000C390)
  {
    id v3 = _MCLogObjects[6];
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v7 = 0;
      _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "Cancelling Keep-Alive observer...", v7, 2u);
    }
    dispatch_source_cancel((dispatch_source_t)qword_10000C390);
  }
  int v4 = _MCLogObjects[6];
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)dispatch_source_t v6 = 0;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "Closing any pending notification...", v6, 2u);
  }
  v5 = +[MCUserNotificationManager sharedManager];
  [v5 cancelNotificationsWithIdentifier:@"passcodenagd-user-notification-id" completionBlock:&stru_1000083C8];
}

+ (void)registerSpringboardNotification
{
  int out_token = 0;
  id v3 = dispatch_get_global_queue(0, 0);
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472;
  v6[2] = sub_10000539C;
  v6[3] = &unk_1000083E8;
  v6[4] = a1;
  uint32_t v4 = notify_register_dispatch("com.apple.springboard.homescreenunlocked", &out_token, v3, v6);

  if (v4)
  {
    v5 = _MCLogObjects[6];
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 67240192;
      uint32_t v9 = v4;
      _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_ERROR, "Could not register for homescreen unlocked darwin notification error %{public}d", buf, 8u);
    }
  }
}

+ (void)registerLockStateChangedNotification
{
  int out_token = 0;
  v2 = dispatch_get_global_queue(0, 0);
  uint32_t v3 = notify_register_dispatch("com.apple.mobile.keybagd.lock_status", &out_token, v2, &stru_100008428);

  if (v3)
  {
    uint32_t v4 = _MCLogObjects[6];
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 67240192;
      uint32_t v7 = v3;
      _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_ERROR, "Could not register for MBK lock state changed darwin notification error %{public}d", buf, 8u);
    }
  }
}

+ (void)registerLanguageChangedNotification
{
  DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();

  CFNotificationCenterAddObserver(DarwinNotifyCenter, 0, (CFNotificationCallback)sub_100005638, @"com.apple.language.changed", 0, CFNotificationSuspensionBehaviorDeliverImmediately);
}

+ (void)_checkPasscodeCompliance
{
  v2 = +[MCProfileConnection sharedConnection];
  uint64_t v3 = qword_10000C388;
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472;
  v5[2] = sub_100005750;
  v5[3] = &unk_100008478;
  id v6 = v2;
  id v4 = v2;
  [v4 getPasscodeComplianceWarningLastLockDate:v3 completionBlock:v5];
}

+ (void)notifyCDPThatPasscodeChangedTo:(id)a3 completion:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  v8 = +[MCProfileConnection sharedConnection];
  id v9 = [v8 unlockScreenTypeForPasscode:v7 outSimplePasscodeType:0];

  id v10 = [a1 _cdpSecretTypeFromUnlockScreenType:v9];
  id v11 = objc_alloc_init((Class)CDPContext);
  [v11 setType:6];
  id v12 = [objc_alloc((Class)CDPStateController) initWithContext:v11];
  v14[0] = _NSConcreteStackBlock;
  v14[1] = 3221225472;
  v14[2] = sub_100005C34;
  v14[3] = &unk_1000084A0;
  id v15 = v6;
  id v13 = v6;
  [v12 localSecretChangedTo:v7 secretType:v10 completion:v14];
}

+ (unint64_t)_cdpSecretTypeFromUnlockScreenType:(int)a3
{
  if ((a3 - 1) >= 2) {
    return 2;
  }
  else {
    return 3;
  }
}

@end