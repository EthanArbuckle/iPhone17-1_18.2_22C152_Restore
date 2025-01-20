@interface DMDUserNotificationManager
+ (DMDUserNotificationManager)sharedManager;
- (DMDUserNotificationManager)init;
- (void)cancelAllNotificationsWithCompletionBlock:(id)a3;
- (void)cancelNotificationEntriesMatchingPredicate:(id)a3 completionBlock:(id)a4;
- (void)dealloc;
- (void)displayUserNotificationWithIdentifier:(id)a3 title:(id)a4 message:(id)a5 defaultButtonText:(id)a6 alternateButtonText:(id)a7 otherButtonText:(id)a8 displayOnLockScreen:(BOOL)a9 displayInAppWhitelistModes:(BOOL)a10 dismissAfterTimeInterval:(double)a11 assertion:(id)a12 completionBlock:(id)a13;
- (void)displayUserNotificationWithTitle:(id)a3 message:(id)a4 defaultButtonText:(id)a5 alternateButtonText:(id)a6 otherButtonText:(id)a7 displayOnLockScreen:(BOOL)a8 displayInAppWhitelistModes:(BOOL)a9 dismissAfterTimeInterval:(double)a10 assertion:(id)a11 completionBlock:(id)a12;
- (void)mainQueueDidReceiveAppWhitelistChangedNotification;
- (void)promptUserToLogIntoiTunesWithTitle:(id)a3 message:(id)a4 assertion:(id)a5 completionBlock:(id)a6;
@end

@implementation DMDUserNotificationManager

+ (DMDUserNotificationManager)sharedManager
{
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100079DB8;
  block[3] = &unk_1000C9F80;
  block[4] = a1;
  if (qword_1000FBD38 != -1) {
    dispatch_once(&qword_1000FBD38, block);
  }
  v2 = (void *)qword_1000FBD30;

  return (DMDUserNotificationManager *)v2;
}

- (DMDUserNotificationManager)init
{
  v10.receiver = self;
  v10.super_class = (Class)DMDUserNotificationManager;
  v2 = [(DMDUserNotificationManager *)&v10 init];
  if (v2)
  {
    v3 = +[NSNotificationCenter defaultCenter];
    uint64_t v4 = MCAppWhitelistDidChangeNotification;
    v5 = objc_opt_new();
    v8[0] = _NSConcreteStackBlock;
    v8[1] = 3221225472;
    v8[2] = sub_100079EF0;
    v8[3] = &unk_1000CBF50;
    v9 = v2;
    id v6 = [v3 addObserverForName:v4 object:0 queue:v5 usingBlock:v8];
  }
  return v2;
}

- (void)dealloc
{
  v3 = +[NSNotificationCenter defaultCenter];
  [v3 removeObserver:self];

  [(DMDUserNotificationManager *)self cancelAllNotificationsWithCompletionBlock:0];
  v4.receiver = self;
  v4.super_class = (Class)DMDUserNotificationManager;
  [(DMDUserNotificationManager *)&v4 dealloc];
}

- (void)mainQueueDidReceiveAppWhitelistChangedNotification
{
  v2 = sub_10007A034();
  dispatch_barrier_sync(v2, &stru_1000CBF70);
}

- (void)cancelAllNotificationsWithCompletionBlock:(id)a3
{
}

- (void)cancelNotificationEntriesMatchingPredicate:(id)a3 completionBlock:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  if (v5)
  {
    v7[0] = _NSConcreteStackBlock;
    v7[1] = 3221225472;
    v7[2] = sub_10007A5AC;
    v7[3] = &unk_1000CC000;
    id v8 = v5;
    id v9 = v6;
    dispatch_async((dispatch_queue_t)&_dispatch_main_q, v7);
  }
}

- (void)displayUserNotificationWithTitle:(id)a3 message:(id)a4 defaultButtonText:(id)a5 alternateButtonText:(id)a6 otherButtonText:(id)a7 displayOnLockScreen:(BOOL)a8 displayInAppWhitelistModes:(BOOL)a9 dismissAfterTimeInterval:(double)a10 assertion:(id)a11 completionBlock:(id)a12
{
}

- (void)displayUserNotificationWithIdentifier:(id)a3 title:(id)a4 message:(id)a5 defaultButtonText:(id)a6 alternateButtonText:(id)a7 otherButtonText:(id)a8 displayOnLockScreen:(BOOL)a9 displayInAppWhitelistModes:(BOOL)a10 dismissAfterTimeInterval:(double)a11 assertion:(id)a12 completionBlock:(id)a13
{
  id v39 = a3;
  id v19 = a4;
  id v20 = a5;
  id v38 = a6;
  id v21 = a7;
  id v22 = a8;
  id v23 = a12;
  id v24 = a13;
  v25 = +[MCProfileConnection sharedConnection];
  unsigned int v26 = [v25 appWhitelistState];

  if (a10 || !v26 || v26 == 6)
  {
    v27 = objc_opt_new();
    [v27 setTitle:v19];
    [v27 setMessage:v20];
    [v27 setDefaultButtonText:v38];
    [v27 setAlternateButtonText:v21];
    [v27 setOtherButtonText:v22];
    [v27 setDisplayOnLockScreen:a9];
    [v27 setDisplayInAppWhitelistModes:a10];
    [v27 setDismissAfterTimeInterval:a11];
    v42[0] = _NSConcreteStackBlock;
    v42[1] = 3221225472;
    v42[2] = sub_10007ACA8;
    v42[3] = &unk_1000CB8B0;
    id v28 = v23;
    id v43 = v28;
    id v44 = v24;
    [v27 setCompletionBlock:v42];
    id v37 = v23;
    id v29 = v19;
    v30 = v39;
    [v27 setIdentifier:v39];
    [v28 park];
    v31 = sub_10007A034();
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_10007AD04;
    block[3] = &unk_1000CA508;
    id v41 = v27;
    id v32 = v27;
    dispatch_barrier_async(v31, block);

    v33 = v20;
    v34 = v29;
    v35 = v38;
    v36 = v37;
  }
  else
  {
    v36 = v23;
    v35 = v38;
    v33 = v20;
    v34 = v19;
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "Not displaying notification in limited apps mode.", buf, 2u);
    }
    v30 = v39;
    if (v24) {
      (*((void (**)(id, uint64_t))v24 + 2))(v24, 3);
    }
  }
}

- (void)promptUserToLogIntoiTunesWithTitle:(id)a3 message:(id)a4 assertion:(id)a5 completionBlock:(id)a6
{
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  id v12 = a6;
  v13 = sub_10007A034();
  v18[0] = _NSConcreteStackBlock;
  v18[1] = 3221225472;
  v18[2] = sub_10007B41C;
  v18[3] = &unk_1000CB530;
  id v19 = v9;
  id v20 = v10;
  id v21 = v11;
  id v22 = v12;
  id v14 = v11;
  id v15 = v10;
  id v16 = v9;
  id v17 = v12;
  dispatch_async(v13, v18);
}

@end