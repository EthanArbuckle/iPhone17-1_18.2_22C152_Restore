@interface MBThermalPressureMonitor
+ (id)sharedThermalPressureMonitor;
- (MBThermalPressureMonitor)init;
- (OS_dispatch_queue)queue;
- (int)thermalPressureLevel;
- (void)_cancelThermalPressureNotifications;
- (void)_measureCurrentThermalPressureLevel;
- (void)_registerForThermalPressureNotifications;
- (void)dealloc;
- (void)setQueue:(id)a3;
@end

@implementation MBThermalPressureMonitor

+ (id)sharedThermalPressureMonitor
{
  if (qword_100482830 != -1) {
    dispatch_once(&qword_100482830, &stru_100417B08);
  }
  v2 = (void *)qword_100482828;
  return v2;
}

- (MBThermalPressureMonitor)init
{
  v10.receiver = self;
  v10.super_class = (Class)MBThermalPressureMonitor;
  v2 = [(MBThermalPressureMonitor *)&v10 init];
  v3 = v2;
  if (v2)
  {
    v2->_thermalPressureLevel = kOSThermalPressureLevelUndefined;
    v4 = (objc_class *)objc_opt_class();
    Name = class_getName(v4);
    v6 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    dispatch_queue_t v7 = dispatch_queue_create(Name, v6);
    queue = v3->_queue;
    v3->_queue = (OS_dispatch_queue *)v7;

    v3->_thermalNotificationToken = -1;
    [(MBThermalPressureMonitor *)v3 _registerForThermalPressureNotifications];
  }
  return v3;
}

- (void)dealloc
{
  [(MBThermalPressureMonitor *)self _cancelThermalPressureNotifications];
  v3.receiver = self;
  v3.super_class = (Class)MBThermalPressureMonitor;
  [(MBThermalPressureMonitor *)&v3 dealloc];
}

- (void)_cancelThermalPressureNotifications
{
  int thermalNotificationToken = self->_thermalNotificationToken;
  if (thermalNotificationToken != -1)
  {
    notify_cancel(thermalNotificationToken);
    self->_int thermalNotificationToken = -1;
  }
}

- (void)_registerForThermalPressureNotifications
{
  objc_initWeak(&location, self);
  objc_super v3 = [(MBThermalPressureMonitor *)self queue];
  handler[0] = _NSConcreteStackBlock;
  handler[1] = 3221225472;
  handler[2] = sub_10027EA54;
  handler[3] = &unk_1004167D0;
  objc_copyWeak(&v8, &location);
  uint32_t v4 = notify_register_dispatch(kOSThermalNotificationPressureLevelName, &self->_thermalNotificationToken, v3, handler);

  if (v4)
  {
    v5 = MBGetDefaultLog();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315394;
      v11 = kOSThermalNotificationPressureLevelName;
      __int16 v12 = 2048;
      uint64_t v13 = v4;
      _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_ERROR, "Failed to register for \"%s\" notification: %lu", buf, 0x16u);
      _MBLog();
    }
  }
  else
  {
    v6 = MBGetDefaultLog();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136446210;
      v11 = kOSThermalNotificationPressureLevelName;
      _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "Registered for %{public}s notifications", buf, 0xCu);
      _MBLog();
    }

    [(MBThermalPressureMonitor *)self _measureCurrentThermalPressureLevel];
  }
  objc_destroyWeak(&v8);
  objc_destroyWeak(&location);
}

- (void)_measureCurrentThermalPressureLevel
{
  objc_super v3 = [(MBThermalPressureMonitor *)self queue];
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10027EB30;
  block[3] = &unk_100411128;
  block[4] = self;
  dispatch_async(v3, block);
}

- (int)thermalPressureLevel
{
  v2 = self;
  objc_super v3 = [(MBThermalPressureMonitor *)self queue];
  dispatch_assert_queue_not_V2(v3);

  uint64_t v7 = 0;
  id v8 = &v7;
  uint64_t v9 = 0x2020000000;
  int v10 = kOSThermalPressureLevelUndefined;
  uint32_t v4 = [(MBThermalPressureMonitor *)v2 queue];
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472;
  v6[2] = sub_10027EDCC;
  v6[3] = &unk_100412050;
  v6[4] = v2;
  v6[5] = &v7;
  dispatch_sync(v4, v6);

  LODWORD(v2) = *((_DWORD *)v8 + 6);
  _Block_object_dispose(&v7, 8);
  return (int)v2;
}

- (OS_dispatch_queue)queue
{
  return self->_queue;
}

- (void)setQueue:(id)a3
{
}

- (void).cxx_destruct
{
}

@end