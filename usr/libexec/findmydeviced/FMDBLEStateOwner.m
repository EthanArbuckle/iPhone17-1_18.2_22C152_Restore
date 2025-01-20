@interface FMDBLEStateOwner
+ (id)sharedInstance;
- (FMDBLEStateOwner)init;
- (NSString)blePowerStatus;
- (void)_monitorWatchBLEStatus;
- (void)_updateBLEStatus;
- (void)setBlePowerStatus:(id)a3;
@end

@implementation FMDBLEStateOwner

+ (id)sharedInstance
{
  if (qword_10031E728 != -1) {
    dispatch_once(&qword_10031E728, &stru_1002D98B0);
  }
  v2 = (void *)qword_10031E720;

  return v2;
}

- (FMDBLEStateOwner)init
{
  v9.receiver = self;
  v9.super_class = (Class)FMDBLEStateOwner;
  v2 = [(FMDBLEStateOwner *)&v9 init];
  v3 = v2;
  if (v2)
  {
    blePowerStatus = v2->_blePowerStatus;
    v2->_blePowerStatus = (NSString *)@"unknown";

    objc_initWeak(&location, v3);
    v6[0] = _NSConcreteStackBlock;
    v6[1] = 3221225472;
    v6[2] = sub_100016880;
    v6[3] = &unk_1002D93C8;
    objc_copyWeak(&v7, &location);
    dispatch_async((dispatch_queue_t)&_dispatch_main_q, v6);
    objc_destroyWeak(&v7);
    objc_destroyWeak(&location);
  }
  return v3;
}

- (void)_monitorWatchBLEStatus
{
  v3 = sub_100004238();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    LOWORD(buf[0]) = 0;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "Starting to listen for BluetoothState changes", (uint8_t *)buf, 2u);
  }

  objc_initWeak(buf, self);
  v4 = +[NSNotificationCenter defaultCenter];
  uint64_t v5 = BluetoothAvailabilityChangedNotification;
  v16[0] = _NSConcreteStackBlock;
  v16[1] = 3221225472;
  v16[2] = sub_100016ADC;
  v16[3] = &unk_1002D98D8;
  objc_copyWeak(&v17, buf);
  id v6 = [v4 addObserverForName:v5 object:0 queue:0 usingBlock:v16];

  id v7 = +[NSNotificationCenter defaultCenter];
  uint64_t v8 = BluetoothStateChangedNotification;
  v11 = _NSConcreteStackBlock;
  uint64_t v12 = 3221225472;
  v13 = sub_100016B5C;
  v14 = &unk_1002D98D8;
  objc_copyWeak(&v15, buf);
  id v9 = [v7 addObserverForName:v8 object:0 queue:0 usingBlock:&v11];

  id v10 = +[BluetoothManager sharedInstance];
  objc_destroyWeak(&v15);
  objc_destroyWeak(&v17);
  objc_destroyWeak(buf);
}

- (void)_updateBLEStatus
{
  if (+[NSThread isMainThread])
  {
    v3 = +[BluetoothManager sharedInstance];
    if ([v3 available])
    {
      if ([v3 enabled]) {
        CFStringRef v4 = @"on";
      }
      else {
        CFStringRef v4 = @"off";
      }
      [(FMDBLEStateOwner *)self setBlePowerStatus:v4];
    }
    uint64_t v5 = sub_100004238();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      id v6 = [(FMDBLEStateOwner *)self blePowerStatus];
      *(_DWORD *)buf = 138412290;
      id v10 = v6;
      _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "BluetoothState: %@", buf, 0xCu);
    }
  }
  else
  {
    objc_initWeak((id *)buf, self);
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_100016D78;
    block[3] = &unk_1002D93C8;
    objc_copyWeak(&v8, (id *)buf);
    dispatch_async((dispatch_queue_t)&_dispatch_main_q, block);
    objc_destroyWeak(&v8);
    objc_destroyWeak((id *)buf);
  }
}

- (NSString)blePowerStatus
{
  return self->_blePowerStatus;
}

- (void)setBlePowerStatus:(id)a3
{
}

- (void).cxx_destruct
{
}

@end