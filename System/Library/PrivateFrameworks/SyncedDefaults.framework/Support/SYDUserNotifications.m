@interface SYDUserNotifications
+ (BOOL)shouldShowNotifications;
+ (id)queue;
+ (id)userNotificationCenter;
+ (void)requestAuthorizationIfNecessary;
+ (void)showNotificationWithTitle:(id)a3 body:(id)a4 threadIdentifier:(id)a5;
+ (void)showUserNotificationIfEnabledForStoreIdentifier:(id)a3 format:(id)a4;
@end

@implementation SYDUserNotifications

+ (void)showUserNotificationIfEnabledForStoreIdentifier:(id)a3 format:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if ([a1 shouldShowNotifications])
  {
    v15 = &v16;
    id v8 = [objc_alloc((Class)NSString) initWithFormat:v7 arguments:&v16];
    v9 = [a1 queue];
    v11[0] = _NSConcreteStackBlock;
    v11[1] = 3221225472;
    v11[2] = sub_1000170B0;
    v11[3] = &unk_100050C90;
    id v13 = v8;
    id v14 = a1;
    id v12 = v6;
    id v10 = v8;
    dispatch_async(v9, v11);
  }
}

+ (void)showNotificationWithTitle:(id)a3 body:(id)a4 threadIdentifier:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  [a1 requestAuthorizationIfNecessary];
  uint64_t v25 = 0;
  v26 = &v25;
  uint64_t v27 = 0x2050000000;
  v11 = (void *)qword_10005BB20;
  uint64_t v28 = qword_10005BB20;
  if (!qword_10005BB20)
  {
    v20 = _NSConcreteStackBlock;
    uint64_t v21 = 3221225472;
    v22 = sub_1000177B8;
    v23 = &unk_100050D98;
    v24 = &v25;
    sub_1000177B8((uint64_t)&v20);
    v11 = (void *)v26[3];
  }
  id v12 = v11;
  _Block_object_dispose(&v25, 8);
  id v13 = objc_alloc_init(v12);
  [v13 setTitle:v8];
  [v13 setBody:v9];
  [v13 setThreadIdentifier:v10];
  uint64_t v25 = 0;
  v26 = &v25;
  uint64_t v27 = 0x2050000000;
  id v14 = (void *)qword_10005BB30;
  uint64_t v28 = qword_10005BB30;
  if (!qword_10005BB30)
  {
    v20 = _NSConcreteStackBlock;
    uint64_t v21 = 3221225472;
    v22 = sub_100017978;
    v23 = &unk_100050D98;
    v24 = &v25;
    sub_100017978((uint64_t)&v20);
    id v14 = (void *)v26[3];
  }
  id v15 = v14;
  _Block_object_dispose(&v25, 8);
  uint64_t v16 = +[NSUUID UUID];
  v17 = [v16 UUIDString];
  v18 = [v15 requestWithIdentifier:v17 content:v13 trigger:0];

  v19 = [a1 userNotificationCenter];
  [v19 addNotificationRequest:v18 withCompletionHandler:&stru_100050CD0];
}

+ (void)requestAuthorizationIfNecessary
{
  if ([a1 shouldShowNotifications])
  {
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_100017480;
    block[3] = &unk_100050D30;
    block[4] = a1;
    if (qword_10005BAF8 != -1) {
      dispatch_once(&qword_10005BAF8, block);
    }
  }
}

+ (id)userNotificationCenter
{
  if (qword_10005BB08 != -1) {
    dispatch_once(&qword_10005BB08, &stru_100050D50);
  }
  v2 = (void *)qword_10005BB00;
  return v2;
}

+ (BOOL)shouldShowNotifications
{
  int v2 = _os_feature_enabled_impl();
  if (v2)
  {
    LOBYTE(v2) = os_variant_has_internal_content();
  }
  return v2;
}

+ (id)queue
{
  if (qword_10005BB18 != -1) {
    dispatch_once(&qword_10005BB18, &stru_100050D70);
  }
  int v2 = (void *)qword_10005BB10;
  return v2;
}

@end