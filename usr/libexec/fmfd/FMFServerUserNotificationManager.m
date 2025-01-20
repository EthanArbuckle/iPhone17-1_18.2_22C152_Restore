@interface FMFServerUserNotificationManager
+ (id)sharedInstance;
- (FMFServerUserNotificationManager)init;
- (NSMutableDictionary)activeCFNotificationsByCategory;
- (NSMutableDictionary)activeUserNotifications;
- (id)_xpcTransactionNameFor:(id)a3;
- (id)initSingleton;
- (void)activateNotification:(id)a3;
- (void)dealloc;
- (void)setActiveCFNotificationsByCategory:(id)a3;
- (void)setActiveUserNotifications:(id)a3;
@end

@implementation FMFServerUserNotificationManager

+ (id)sharedInstance
{
  if (qword_1000BB848 != -1) {
    dispatch_once(&qword_1000BB848, &stru_1000A2BE0);
  }
  v2 = (void *)qword_1000BB840;
  if (!qword_1000BB840)
  {
    v3 = sub_100005560();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR)) {
      sub_10006C420(v3);
    }

    v2 = (void *)qword_1000BB840;
  }

  return v2;
}

- (FMFServerUserNotificationManager)init
{
  v3 = sub_100005560();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR)) {
    sub_10006C464(v3);
  }

  return 0;
}

- (id)initSingleton
{
  v8.receiver = self;
  v8.super_class = (Class)FMFServerUserNotificationManager;
  v2 = [(FMFServerUserNotificationManager *)&v8 init];
  if (v2)
  {
    v3 = sub_100005560();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v7 = 0;
      _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "AOSUserNotificationMgr_iOS: initialize", v7, 2u);
    }

    v4 = +[NSMutableDictionary dictionary];
    [(FMFServerUserNotificationManager *)v2 setActiveUserNotifications:v4];

    v5 = +[NSMutableDictionary dictionary];
    [(FMFServerUserNotificationManager *)v2 setActiveCFNotificationsByCategory:v5];

    objc_storeStrong((id *)&qword_1000BB840, v2);
  }
  return v2;
}

- (void)dealloc
{
  v3 = (void *)qword_1000BB840;
  qword_1000BB840 = 0;

  v4.receiver = self;
  v4.super_class = (Class)FMFServerUserNotificationManager;
  [(FMFServerUserNotificationManager *)&v4 dealloc];
}

- (void)activateNotification:(id)a3
{
  id v4 = a3;
  v5 = +[NSMutableDictionary dictionary];
  if ([v4 alertLevel] == (id)1) {
    CFOptionFlags v6 = 3;
  }
  else {
    CFOptionFlags v6 = 0;
  }
  if ([v4 category])
  {
    v7 = [(FMFServerUserNotificationManager *)self activeCFNotificationsByCategory];
    objc_super v8 = +[NSNumber numberWithInteger:](NSNumber, "numberWithInteger:", [v4 category]);
    v9 = [v7 objectForKeyedSubscript:v8];

    if (v9)
    {
      v10 = [(FMFServerUserNotificationManager *)self activeUserNotifications];
      v11 = [v10 objectForKeyedSubscript:v9];

      v12 = [(FMFServerUserNotificationManager *)self activeCFNotificationsByCategory];
      v13 = +[NSNumber numberWithInteger:](NSNumber, "numberWithInteger:", [v4 category]);
      [v12 removeObjectForKey:v13];

      v14 = [(FMFServerUserNotificationManager *)self activeUserNotifications];
      [v14 removeObjectForKey:v9];

      v15 = +[FMXPCTransactionManager sharedInstance];
      v16 = [(FMFServerUserNotificationManager *)self _xpcTransactionNameFor:v11];
      [v15 endTransaction:v16];

      v17 = (__CFUserNotification *)[v9 unsignedLongValue];
      CFUserNotificationCancel(v17);
      if (v17) {
        CFRelease(v17);
      }
    }
  }
  if ([v4 showMessage])
  {
    v18 = [v4 defaultButtonTitle];
    [v5 safelyMapKey:kCFUserNotificationDefaultButtonTitleKey toObject:v18];

    v19 = [v4 alternateButtonTitle];
    [v5 safelyMapKey:kCFUserNotificationAlternateButtonTitleKey toObject:v19];

    v20 = [v4 msgText];
    [v5 safelyMapKey:kCFUserNotificationAlertMessageKey toObject:v20];

    v21 = [v4 msgTitle];
    [v5 safelyMapKey:kCFUserNotificationAlertHeaderKey toObject:v21];

    v22 = +[NSNumber numberWithBool:](NSNumber, "numberWithBool:", [v4 showMsgInLockScreen]);
    [v5 setObject:v22 forKeyedSubscript:kCFUserNotificationAlertTopMostKey];

    v23 = +[NSNumber numberWithInt:](NSNumber, "numberWithInt:", [v4 dismissMsgOnUnlock] ^ 1);
    [v5 setObject:v23 forKeyedSubscript:SBUserNotificationDontDismissOnUnlock];

    v24 = +[NSNumber numberWithBool:](NSNumber, "numberWithBool:", [v4 dismissMsgOnLock]);
    [v5 setObject:v24 forKeyedSubscript:SBUserNotificationDismissOnLock];

    [v5 setObject:&__kCFBooleanTrue forKeyedSubscript:SBUserNotificationAllowMenuButtonDismissal];
    [v5 setObject:&__kCFBooleanTrue forKeyedSubscript:SBUserNotificationAllowInCarKey];
    SInt32 error = 0;
    [v4 timeout];
    CFUserNotificationRef v26 = CFUserNotificationCreate(kCFAllocatorDefault, v25, v6, &error, (CFDictionaryRef)v5);
    if (v26)
    {
      CFUserNotificationRef v27 = v26;
      v28 = [(FMFServerUserNotificationManager *)self activeUserNotifications];
      v29 = +[NSNumber numberWithUnsignedLong:v27];
      [v28 setObject:v4 forKeyedSubscript:v29];

      if ([v4 category])
      {
        v30 = +[NSNumber numberWithUnsignedLong:v27];
        v31 = [(FMFServerUserNotificationManager *)self activeCFNotificationsByCategory];
        v32 = +[NSNumber numberWithInteger:](NSNumber, "numberWithInteger:", [v4 category]);
        [v31 setObject:v30 forKeyedSubscript:v32];
      }
      v33 = +[FMXPCTransactionManager sharedInstance];
      v34 = [(FMFServerUserNotificationManager *)self _xpcTransactionNameFor:v4];
      [v33 beginTransaction:v34];

      v36[0] = _NSConcreteStackBlock;
      v36[1] = 3221225472;
      v36[2] = sub_10003F7CC;
      v36[3] = &unk_1000A1440;
      v36[4] = v27;
      dispatch_async((dispatch_queue_t)&_dispatch_main_q, v36);
    }
    else
    {
      v35 = sub_100005560();
      if (os_log_type_enabled(v35, OS_LOG_TYPE_ERROR)) {
        sub_10006C4A8(&error, v35);
      }
    }
  }
}

- (id)_xpcTransactionNameFor:(id)a3
{
  return +[NSString stringWithFormat:@"Message-%lX", a3];
}

- (NSMutableDictionary)activeUserNotifications
{
  return self->_activeUserNotifications;
}

- (void)setActiveUserNotifications:(id)a3
{
}

- (NSMutableDictionary)activeCFNotificationsByCategory
{
  return self->_activeCFNotificationsByCategory;
}

- (void)setActiveCFNotificationsByCategory:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_activeCFNotificationsByCategory, 0);

  objc_storeStrong((id *)&self->_activeUserNotifications, 0);
}

@end