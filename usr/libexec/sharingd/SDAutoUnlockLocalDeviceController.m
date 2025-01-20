@interface SDAutoUnlockLocalDeviceController
- (BKDevicePearl)pearlDevice;
- (BOOL)faceIDEnabled;
- (BOOL)lastUnlockUsedMask;
- (BOOL)shouldPrewarmAttempt;
- (BOOL)supportsPeriocular;
- (NSArray)wakeGestureDates;
- (OS_dispatch_queue)queue;
- (SDAutoUnlockLocalDeviceController)init;
- (SDAutoUnlockLocalDeviceController)initWithQueue:(id)a3;
- (id)deviceEnteredBioLockoutHandler;
- (void)deviceUnlockedWithMask:(BOOL)a3;
- (void)handleBioLockoutStateChanged:(unint64_t)a3;
- (void)lockDevice;
- (void)lockWithBioLockOut;
- (void)setDeviceEnteredBioLockoutHandler:(id)a3;
- (void)setLastUnlockUsedMask:(BOOL)a3;
- (void)setWakeGestureDates:(id)a3;
@end

@implementation SDAutoUnlockLocalDeviceController

- (SDAutoUnlockLocalDeviceController)init
{
  return [(SDAutoUnlockLocalDeviceController *)self initWithQueue:&_dispatch_main_q];
}

- (SDAutoUnlockLocalDeviceController)initWithQueue:(id)a3
{
  id v5 = a3;
  v33.receiver = self;
  v33.super_class = (Class)SDAutoUnlockLocalDeviceController;
  v6 = [(SDAutoUnlockLocalDeviceController *)&v33 init];
  objc_storeStrong((id *)&v6->_queue, a3);
  if (SFDeviceSupportsAutoUnlock())
  {
    +[BKDeviceManager availableDevices];
    long long v31 = 0u;
    long long v32 = 0u;
    long long v29 = 0u;
    long long v30 = 0u;
    id v7 = (id)objc_claimAutoreleasedReturnValue();
    id v8 = [v7 countByEnumeratingWithState:&v29 objects:v34 count:16];
    if (v8)
    {
      uint64_t v9 = *(void *)v30;
      while (2)
      {
        for (i = 0; i != v8; i = (char *)i + 1)
        {
          if (*(void *)v30 != v9) {
            objc_enumerationMutation(v7);
          }
          uint64_t v11 = *(void *)(*((void *)&v29 + 1) + 8 * i);
          id v28 = 0;
          v12 = +[BKDevice deviceWithDescriptor:v11 error:&v28];
          id v13 = v28;
          objc_opt_class();
          if (objc_opt_isKindOfClass())
          {
            pearlDevice = v6->_pearlDevice;
            v6->_pearlDevice = v12;

            goto LABEL_12;
          }
        }
        id v8 = [v7 countByEnumeratingWithState:&v29 objects:v34 count:16];
        if (v8) {
          continue;
        }
        break;
      }
    }
LABEL_12:

    if (!v6->_pearlDevice)
    {
      v15 = auto_unlock_log();
      if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR)) {
        sub_100018D50((uint64_t)v7, v15, v16, v17, v18, v19, v20, v21);
      }
    }
    id location = 0;
    objc_initWeak(&location, v6);
    int out_token = 0;
    queue = v6->_queue;
    v24[0] = _NSConcreteStackBlock;
    v24[1] = 3221225472;
    v24[2] = sub_100018800;
    v24[3] = &unk_1008CA370;
    objc_copyWeak(&v25, &location);
    notify_register_dispatch("com.apple.BiometricKit.lockoutStateChanged", &out_token, queue, v24);
    objc_destroyWeak(&v25);
    objc_destroyWeak(&location);
  }
  return v6;
}

- (BOOL)faceIDEnabled
{
  v3 = +[NSUserDefaults standardUserDefaults];
  if ([v3 BOOLForKey:@"phoneAutoUnlockSkipFaceID"])
  {
    v4 = auto_unlock_log();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "Skipping FaceID check due to default phoneAutoUnlockSkipFaceID", buf, 2u);
    }
    BOOL v5 = 1;
  }
  else
  {
    pearlDevice = self->_pearlDevice;
    id v17 = 0;
    id v7 = [(BKDevicePearl *)pearlDevice identitiesWithError:&v17];
    v4 = v17;
    if (v4) {
      BOOL v8 = 1;
    }
    else {
      BOOL v8 = v7 == 0;
    }
    if (v8)
    {
      uint64_t v9 = auto_unlock_log();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR)) {
        sub_100018DBC((uint64_t)v4, v9, v10, v11, v12, v13, v14, v15);
      }

      BOOL v5 = 0;
    }
    else
    {
      BOOL v5 = [v7 count] != 0;
    }
  }
  return v5;
}

- (BOOL)supportsPeriocular
{
  pearlDevice = self->_pearlDevice;
  id v14 = 0;
  v3 = [(BKDevicePearl *)pearlDevice supportsPeriocularEnrollmentWithError:&v14];
  id v4 = v14;
  if (v4)
  {
    BOOL v5 = auto_unlock_log();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR)) {
      sub_100018E28((uint64_t)v4, v5, v6, v7, v8, v9, v10, v11);
    }
  }
  unsigned __int8 v12 = [v3 BOOLValue];

  return v12;
}

- (void)lockWithBioLockOut
{
  v3 = auto_unlock_log();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "Locking current device and forcing bio lockout", buf, 2u);
  }

  id v4 = [(SDAutoUnlockLocalDeviceController *)self pearlDevice];
  uint64_t v7 = 0;
  [v4 forceBioLockoutForUser:getuid() error:&v7];
  uint64_t v5 = v7;

  if (v5)
  {
    uint64_t v6 = auto_unlock_log();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR)) {
      sub_100018E94(v6);
    }
  }
  [(SDAutoUnlockLocalDeviceController *)self lockDevice];
}

- (void)lockDevice
{
  v2 = auto_unlock_log();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v3 = 0;
    _os_log_impl((void *)&_mh_execute_header, v2, OS_LOG_TYPE_DEFAULT, "Locking current device", v3, 2u);
  }

  sub_1001AC364();
}

- (void)deviceUnlockedWithMask:(BOOL)a3
{
  BOOL v3 = a3;
  uint64_t v5 = auto_unlock_log();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    v6[0] = 67109120;
    v6[1] = v3;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "Stored last unlocked with mask: %d", (uint8_t *)v6, 8u);
  }

  [(SDAutoUnlockLocalDeviceController *)self setLastUnlockUsedMask:v3];
}

- (BOOL)shouldPrewarmAttempt
{
  return [(SDAutoUnlockLocalDeviceController *)self lastUnlockUsedMask];
}

- (void)handleBioLockoutStateChanged:(unint64_t)a3
{
  if (a3 == 3)
  {
    id v4 = [(SDAutoUnlockLocalDeviceController *)self deviceEnteredBioLockoutHandler];

    if (v4)
    {
      uint64_t v5 = [(SDAutoUnlockLocalDeviceController *)self deviceEnteredBioLockoutHandler];
      v5[2]();
    }
  }
}

- (id)deviceEnteredBioLockoutHandler
{
  return self->_deviceEnteredBioLockoutHandler;
}

- (void)setDeviceEnteredBioLockoutHandler:(id)a3
{
}

- (NSArray)wakeGestureDates
{
  return self->_wakeGestureDates;
}

- (void)setWakeGestureDates:(id)a3
{
}

- (OS_dispatch_queue)queue
{
  return self->_queue;
}

- (BKDevicePearl)pearlDevice
{
  return self->_pearlDevice;
}

- (BOOL)lastUnlockUsedMask
{
  return self->_lastUnlockUsedMask;
}

- (void)setLastUnlockUsedMask:(BOOL)a3
{
  self->_lastUnlockUsedMask = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_pearlDevice, 0);
  objc_storeStrong((id *)&self->_queue, 0);
  objc_storeStrong((id *)&self->_wakeGestureDates, 0);

  objc_storeStrong(&self->_deviceEnteredBioLockoutHandler, 0);
}

@end