@interface BKGSEventSystem
+ (id)sharedInstance;
- (BKGSEventSystem)init;
- (void)_handleEvent:(__GSEvent *)a3;
@end

@implementation BKGSEventSystem

- (void)_handleEvent:(__GSEvent *)a3
{
  int Type = GSEventGetType();
  if (Type == 50)
  {
    id v8 = +[BKHIDSystemInterface sharedInstance];
    [v8 injectGSEvent:a3];
  }
  else
  {
    int v5 = Type;
    if (Type == 100)
    {
      v6 = sub_10005FCE8();
      if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 67109120;
        int SenderPID = GSEventGetSenderPID();
        _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "Ignoring call to deprecated GSEventResetIdleTimer received from %d", buf, 8u);
      }
    }
    else
    {
      v7 = BKLogEventDelivery();
      if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 67109120;
        int SenderPID = v5;
        _os_log_error_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_ERROR, "_handleEvent: Ignoring GSEvent type:%d.", buf, 8u);
      }
    }
  }
}

- (BKGSEventSystem)init
{
  v4.receiver = self;
  v4.super_class = (Class)BKGSEventSystem;
  v2 = [(BKGSEventSystem *)&v4 init];
  if (v2)
  {
    GSEventRegisterEventCallBack();
    GSEventInitializeWorkspaceWithQueue();
  }
  return v2;
}

+ (id)sharedInstance
{
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100047694;
  block[3] = &unk_1000F7D08;
  block[4] = a1;
  if (qword_100122EA0 != -1) {
    dispatch_once(&qword_100122EA0, block);
  }
  v2 = (void *)qword_100122E98;

  return v2;
}

@end