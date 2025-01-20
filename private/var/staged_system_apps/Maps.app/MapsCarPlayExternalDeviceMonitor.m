@interface MapsCarPlayExternalDeviceMonitor
+ (id)sharedInstance;
- (AVExternalDevice)carPlayExternalDevice;
- (MapsCarPlayExternalDeviceMonitor)init;
- (void)_populateExternalDevice;
- (void)dealloc;
@end

@implementation MapsCarPlayExternalDeviceMonitor

- (void)_populateExternalDevice
{
  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  v3 = self->_externalDevice;
  v4 = sub_100044DF4();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "Fetching currentCarPlayExternalDevice", buf, 2u);
  }

  v5 = +[AVExternalDevice currentCarPlayExternalDevice];
  externalDevice = self->_externalDevice;
  self->_externalDevice = v5;

  v7 = sub_100044DF4();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    v8 = self->_externalDevice;
    *(_DWORD *)buf = 138543362;
    v12 = v8;
    _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "Got currentCarPlayExternalDevice: %{public}@", buf, 0xCu);
  }

  if (v3)
  {
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_100C8BB90;
    block[3] = &unk_1012E5D08;
    v10 = v3;
    dispatch_async((dispatch_queue_t)&_dispatch_main_q, block);
  }
}

- (MapsCarPlayExternalDeviceMonitor)init
{
  v17.receiver = self;
  v17.super_class = (Class)MapsCarPlayExternalDeviceMonitor;
  id v2 = [(MapsCarPlayExternalDeviceMonitor *)&v17 init];
  if (v2)
  {
    v3 = sub_100044DF4();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(buf[0]) = 0;
      _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "Initializing", (uint8_t *)buf, 2u);
    }

    v4 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    dispatch_queue_t v5 = dispatch_queue_create("MapsCarPlayExternalDeviceMonitor.queue", v4);
    v6 = (void *)*((void *)v2 + 1);
    *((void *)v2 + 1) = v5;

    objc_initWeak(buf, v2);
    v14[0] = _NSConcreteStackBlock;
    v14[1] = 3221225472;
    v14[2] = sub_100C8BA00;
    v14[3] = &unk_1012F6090;
    objc_copyWeak(&v15, buf);
    v7 = objc_retainBlock(v14);
    if (notify_register_dispatch("com.apple.coremedia.active-endpoint-changed", (int *)v2 + 6, *((dispatch_queue_t *)v2 + 1), v7))
    {
      v8 = sub_100044DF4();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
      {
        *(_WORD *)v13 = 0;
        _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_ERROR, "Failed to register for CarPlay external devices", v13, 2u);
      }
    }
    v9 = *((void *)v2 + 1);
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_100108FDC;
    block[3] = &unk_1012E5D08;
    id v12 = v2;
    dispatch_async(v9, block);

    objc_destroyWeak(&v15);
    objc_destroyWeak(buf);
  }
  return (MapsCarPlayExternalDeviceMonitor *)v2;
}

+ (id)sharedInstance
{
  if (qword_101610D48 != -1) {
    dispatch_once(&qword_101610D48, &stru_10131D758);
  }
  id v2 = (void *)qword_101610D50;

  return v2;
}

- (void)dealloc
{
  notify_cancel(self->_token);
  v3.receiver = self;
  v3.super_class = (Class)MapsCarPlayExternalDeviceMonitor;
  [(MapsCarPlayExternalDeviceMonitor *)&v3 dealloc];
}

- (AVExternalDevice)carPlayExternalDevice
{
  uint64_t v6 = 0;
  v7 = &v6;
  uint64_t v8 = 0x3032000000;
  v9 = sub_1001044A0;
  v10 = sub_100104AC0;
  id v11 = 0;
  queue = self->_queue;
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472;
  v5[2] = sub_100C8BB7C;
  v5[3] = &unk_1012E73F0;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(queue, v5);
  id v3 = (id)v7[5];
  _Block_object_dispose(&v6, 8);

  return (AVExternalDevice *)v3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_externalDevice, 0);

  objc_storeStrong((id *)&self->_queue, 0);
}

@end