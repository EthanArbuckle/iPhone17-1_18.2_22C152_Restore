@interface CRWiFiCarManager
- (BOOL)hasCredentialsForCarPlayUUID:(id)a3;
- (BOOL)isPowered;
- (BOOL)removeNetworkCredentialsForCarPlayUUID:(id)a3;
- (BOOL)saveNetworkCredentials:(id)a3 forCarPlayUUID:(id)a4;
- (CRWiFiCarManager)init;
- (__WiFiManagerClient)_lock_wifiManager;
- (__WiFiNetwork)firstNetworkPassingTest:(id)a3;
- (__WiFiNetwork)networkForCarPlayUUID:(id)a3;
- (__WiFiNetwork)networkForSSID:(id)a3;
- (id)_getSecurityTypeForNetwork:(__WiFiNetwork *)a3;
- (id)_uuidForNetwork:(__WiFiNetwork *)a3;
- (void)_lock_setWiFiDevice:(__WiFiDeviceClient *)a3;
- (void)_powerStateDidChange;
- (void)_setSecurityType:(id)a3 forNetwork:(__WiFiNetwork *)a4;
- (void)_updateWiFiDevice;
- (void)dealloc;
- (void)invalidate;
- (void)removeNetworkCredentialsForCarPlayNetwork:(__WiFiNetwork *)a3;
- (void)setInCar:(BOOL)a3 carPlayUUID:(id)a4;
- (void)setPowered:(BOOL)a3;
- (void)updateExistingNetwork:(__WiFiNetwork *)a3 password:(id)a4 securityType:(id)a5 channel:(id)a6 carPlayUUID:(id)a7;
@end

@implementation CRWiFiCarManager

- (CRWiFiCarManager)init
{
  v6.receiver = self;
  v6.super_class = (Class)CRWiFiCarManager;
  v2 = [(CRWiFiCarManager *)&v6 init];
  if (v2)
  {
    v3 = (NSRecursiveLock *)objc_alloc_init((Class)NSRecursiveLock);
    lock = v2->_lock;
    v2->_lock = v3;

    [(NSRecursiveLock *)v2->_lock lock];
    [(CRWiFiCarManager *)v2 _lock_wifiManager];
    [(NSRecursiveLock *)v2->_lock unlock];
  }
  return v2;
}

- (void)dealloc
{
  [(CRWiFiCarManager *)self invalidate];
  v3.receiver = self;
  v3.super_class = (Class)CRWiFiCarManager;
  [(CRWiFiCarManager *)&v3 dealloc];
}

- (void)invalidate
{
  [(NSRecursiveLock *)self->_lock lock];
  if (self->_wifiManager)
  {
    WiFiManagerClientRegisterServerRestartCallback();
    WiFiManagerClientRegisterDeviceAttachmentCallback();
    CFRelease(self->_wifiManager);
    self->_wifiManager = 0;
  }
  if (self->_device)
  {
    WiFiDeviceClientRegisterPowerCallback();
    CFRelease(self->_device);
    self->_device = 0;
  }
  lock = self->_lock;

  [(NSRecursiveLock *)lock unlock];
}

- (BOOL)isPowered
{
  [(NSRecursiveLock *)self->_lock lock];
  if (!self->_poweredHasBeenSet) {
    self->_poweredHasBeenSet = 1;
  }
  BOOL powered = self->_powered;
  [(NSRecursiveLock *)self->_lock unlock];
  return powered;
}

- (void)setPowered:(BOOL)a3
{
  [(NSRecursiveLock *)self->_lock lock];
  if (!self->_poweredHasBeenSet) {
    self->_poweredHasBeenSet = 1;
  }
  if ([(CRWiFiCarManager *)self _lock_wifiManager]) {
    WiFiManagerClientSetPower();
  }
  lock = self->_lock;

  [(NSRecursiveLock *)lock unlock];
}

- (BOOL)hasCredentialsForCarPlayUUID:(id)a3
{
  return [(CRWiFiCarManager *)self networkForCarPlayUUID:a3] != 0;
}

- (id)_uuidForNetwork:(__WiFiNetwork *)a3
{
  return (id)WiFiNetworkGetProperty();
}

- (__WiFiNetwork)firstNetworkPassingTest:(id)a3
{
  id v4 = a3;
  uint64_t v13 = 0;
  v14 = &v13;
  uint64_t v15 = 0x2020000000;
  uint64_t v16 = 0;
  [(NSRecursiveLock *)self->_lock lock];
  [(CRWiFiCarManager *)self _lock_wifiManager];
  v5 = (void *)WiFiManagerClientCopyNetworks();
  [(NSRecursiveLock *)self->_lock unlock];
  v10[0] = _NSConcreteStackBlock;
  v10[1] = 3221225472;
  v10[2] = sub_100067F2C;
  v10[3] = &unk_1000BF9A8;
  id v6 = v4;
  id v11 = v6;
  v12 = &v13;
  [v5 enumerateObjectsUsingBlock:v10];
  v7 = (const void *)v14[3];
  if (v7)
  {
    CFAutorelease(v7);
    v8 = (__WiFiNetwork *)v14[3];
  }
  else
  {
    v8 = 0;
  }

  _Block_object_dispose(&v13, 8);
  return v8;
}

- (__WiFiNetwork)networkForCarPlayUUID:(id)a3
{
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472;
  v6[2] = sub_10006806C;
  v6[3] = &unk_1000BF9D0;
  v7 = self;
  id v8 = a3;
  id v3 = v8;
  id v4 = [(CRWiFiCarManager *)v7 firstNetworkPassingTest:v6];

  return v4;
}

- (__WiFiNetwork)networkForSSID:(id)a3
{
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_100068154;
  v7[3] = &unk_1000BF9F8;
  id v8 = a3;
  id v4 = v8;
  v5 = [(CRWiFiCarManager *)self firstNetworkPassingTest:v7];

  return v5;
}

- (void)updateExistingNetwork:(__WiFiNetwork *)a3 password:(id)a4 securityType:(id)a5 channel:(id)a6 carPlayUUID:(id)a7
{
  id v12 = a4;
  id v13 = a5;
  id v14 = a6;
  id v15 = a7;
  uint64_t v16 = (void *)WiFiNetworkCopyPassword();
  v30 = v16;
  if (v12 && v16)
  {
    if ([v16 isEqual:v12])
    {
LABEL_4:
      int v17 = 0;
      goto LABEL_9;
    }
  }
  else if (!v12)
  {
    goto LABEL_4;
  }
  v18 = CarGeneralLogging();
  if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    id v32 = v15;
    _os_log_impl((void *)&_mh_execute_header, v18, OS_LOG_TYPE_DEFAULT, "updating password for existing network %@", buf, 0xCu);
  }

  WiFiNetworkSetProperty();
  int v17 = 1;
LABEL_9:
  v19 = [(CRWiFiCarManager *)self _getSecurityTypeForNetwork:a3];
  v20 = v19;
  if (v13 && v19)
  {
    if ([v19 isEqual:v13]) {
      goto LABEL_17;
    }
  }
  else if (!v13)
  {
    goto LABEL_17;
  }
  v21 = CarGeneralLogging();
  if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412802;
    id v32 = v20;
    __int16 v33 = 2112;
    id v34 = v13;
    __int16 v35 = 2112;
    id v36 = v15;
    _os_log_impl((void *)&_mh_execute_header, v21, OS_LOG_TYPE_DEFAULT, "updating securityType from %@ to %@ for existing network %@", buf, 0x20u);
  }

  [(CRWiFiCarManager *)self _setSecurityType:v13 forNetwork:a3];
  int v17 = 1;
LABEL_17:
  v22 = WiFiNetworkGetChannel();
  v23 = v22;
  if (v14 && v22)
  {
    if ([v22 isEqual:v14]) {
      goto LABEL_25;
    }
  }
  else if (!v14)
  {
    goto LABEL_25;
  }
  v24 = CarGeneralLogging();
  if (os_log_type_enabled(v24, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412802;
    id v32 = v23;
    __int16 v33 = 2112;
    id v34 = v14;
    __int16 v35 = 2112;
    id v36 = v15;
    _os_log_impl((void *)&_mh_execute_header, v24, OS_LOG_TYPE_DEFAULT, "updating channel from %@ to %@ for existing network %@", buf, 0x20u);
  }

  WiFiNetworkSetProperty();
  int v17 = 1;
LABEL_25:
  Property = (const void *)WiFiNetworkGetProperty();
  if (!Property || !CFEqual(Property, kCFBooleanTrue))
  {
    v26 = CarGeneralLogging();
    if (os_log_type_enabled(v26, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v26, OS_LOG_TYPE_DEFAULT, "updating network type to CarPlay for existing network", buf, 2u);
    }

    WiFiNetworkSetProperty();
    int v17 = 1;
  }
  v27 = [(CRWiFiCarManager *)self _uuidForNetwork:a3];
  v28 = v27;
  if (v15 && v27)
  {
    if ([v27 isEqual:v15]) {
      goto LABEL_33;
    }
  }
  else if (!v15)
  {
LABEL_33:
    if (!v17) {
      goto LABEL_40;
    }
    goto LABEL_39;
  }
  v29 = CarGeneralLogging();
  if (os_log_type_enabled(v29, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412546;
    id v32 = v15;
    __int16 v33 = 2112;
    id v34 = v28;
    _os_log_impl((void *)&_mh_execute_header, v29, OS_LOG_TYPE_DEFAULT, "updating CarPlay UUID to %@ for existing network %@", buf, 0x16u);
  }

  WiFiNetworkSetProperty();
LABEL_39:
  [(NSRecursiveLock *)self->_lock lock];
  [(CRWiFiCarManager *)self _lock_wifiManager];
  WiFiManagerClientUpdateNetwork();
  [(NSRecursiveLock *)self->_lock unlock];
LABEL_40:
}

- (BOOL)saveNetworkCredentials:(id)a3 forCarPlayUUID:(id)a4
{
  id v6 = a4;
  if (v6)
  {
    id v7 = a3;
    id v8 = [v7 objectForKey:@"SSID_STR"];
    v9 = [v7 objectForKey:@"password"];
    v10 = [v7 objectForKey:@"CHANNEL"];
    id v11 = [v7 objectForKey:@"securityType"];

    id v12 = +[CARAnalytics sharedInstance];
    [v12 setWifiChannel:v10];

    id v13 = CarGeneralLogging();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
    {
      int v32 = 138412802;
      id v33 = v8;
      __int16 v34 = 2112;
      __int16 v35 = v10;
      __int16 v36 = 2112;
      v37 = v11;
      _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_INFO, "received network credentials SSID: %@, channel: %@, securityType: %@", (uint8_t *)&v32, 0x20u);
    }

    id v14 = [(CRWiFiCarManager *)self networkForCarPlayUUID:v6];
    if (v14)
    {
      id v15 = v14;
      uint64_t v16 = CarGeneralLogging();
      if (os_log_type_enabled(v16, OS_LOG_TYPE_INFO))
      {
        LOWORD(v32) = 0;
        _os_log_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_INFO, "network already exists, checking if updates are required", (uint8_t *)&v32, 2u);
      }

      int v17 = WiFiNetworkGetSSID();
      v18 = v17;
      if (v8 && v17)
      {
        if ([v17 isEqual:v8])
        {
LABEL_10:
          [(CRWiFiCarManager *)self updateExistingNetwork:v15 password:v9 securityType:v11 channel:v10 carPlayUUID:v6];

LABEL_17:
          BOOL v19 = 1;
LABEL_38:

          goto LABEL_39;
        }
      }
      else if (!v8)
      {
        goto LABEL_10;
      }
      v24 = CarGeneralLogging();
      if (os_log_type_enabled(v24, OS_LOG_TYPE_DEFAULT))
      {
        int v32 = 138412290;
        id v33 = v6;
        _os_log_impl((void *)&_mh_execute_header, v24, OS_LOG_TYPE_DEFAULT, "updated SSID, removing network %@, will be re-added", (uint8_t *)&v32, 0xCu);
      }

      [(CRWiFiCarManager *)self removeNetworkCredentialsForCarPlayNetwork:v15];
    }
    else
    {
      v20 = [(CRWiFiCarManager *)self networkForSSID:v8];
      if (v20)
      {
        v21 = v20;
        v22 = [(CRWiFiCarManager *)self _uuidForNetwork:v20];

        if (!v22)
        {
          v23 = CarGeneralLogging();
          if (os_log_type_enabled(v23, OS_LOG_TYPE_INFO))
          {
            LOWORD(v32) = 0;
            _os_log_impl((void *)&_mh_execute_header, v23, OS_LOG_TYPE_INFO, "network already exists as internet-only, updating", (uint8_t *)&v32, 2u);
          }

          [(CRWiFiCarManager *)self updateExistingNetwork:v21 password:v9 securityType:v11 channel:v10 carPlayUUID:v6];
          goto LABEL_17;
        }
      }
    }
    v25 = +[NSMutableDictionary dictionary];
    [v25 setObject:v6 forKey:@"CARPLAY_UUID"];
    [v25 setObject:&__kCFBooleanTrue forKey:@"CARPLAY_NETWORK"];
    v26 = +[NSNumber numberWithInt:2];
    [v25 setObject:v26 forKey:@"AP_MODE"];

    if (v8) {
      [v25 setObject:v8 forKey:@"SSID_STR"];
    }
    if (v10)
    {
      [v25 setValue:v10 forKey:@"CHANNEL"];
    }
    else
    {
      v27 = CarGeneralLogging();
      if (os_log_type_enabled(v27, OS_LOG_TYPE_DEFAULT))
      {
        int v32 = 138412290;
        id v33 = v8;
        _os_log_impl((void *)&_mh_execute_header, v27, OS_LOG_TYPE_DEFAULT, "Channel information not present for CarPlay network %@", (uint8_t *)&v32, 0xCu);
      }
    }
    uint64_t v28 = WiFiNetworkCreate();
    BOOL v19 = v28 != 0;
    if (v28)
    {
      v29 = (const void *)v28;
      if (v9)
      {
        WiFiNetworkSetPasswordSyncable();
        WiFiNetworkSetProperty();
      }
      [(CRWiFiCarManager *)self _setSecurityType:v11 forNetwork:v29];
      if (v10)
      {
        +[NSNumber numberWithInt:0];
        WiFiNetworkSetProperty();
      }
      v30 = CarGeneralLogging();
      if (os_log_type_enabled(v30, OS_LOG_TYPE_DEFAULT))
      {
        int v32 = 138412290;
        id v33 = v6;
        _os_log_impl((void *)&_mh_execute_header, v30, OS_LOG_TYPE_DEFAULT, "adding network %@", (uint8_t *)&v32, 0xCu);
      }

      [(NSRecursiveLock *)self->_lock lock];
      [(CRWiFiCarManager *)self _lock_wifiManager];
      WiFiManagerClientAddNetwork();
      [(NSRecursiveLock *)self->_lock unlock];
      CFRelease(v29);
    }

    goto LABEL_38;
  }
  BOOL v19 = 0;
LABEL_39:

  return v19;
}

- (id)_getSecurityTypeForNetwork:(__WiFiNetwork *)a3
{
  if (!WiFiNetworkSupportsWPA3()) {
    return &off_1000C6820;
  }
  if (WiFiNetworkSupportsWPA2()) {
    return &off_1000C67F0;
  }
  return &off_1000C6808;
}

- (void)_setSecurityType:(id)a3 forNetwork:(__WiFiNetwork *)a4
{
  id v4 = a3;
  id v5 = v4;
  if (v4
    && ([v4 isEqualToNumber:&off_1000C6808]
     || [v5 isEqualToNumber:&off_1000C67F0]))
  {
    WiFiNetworkSetSAE();
  }
  else
  {
    WiFiNetworkSetWPA();
  }
}

- (BOOL)removeNetworkCredentialsForCarPlayUUID:(id)a3
{
  id v4 = [(CRWiFiCarManager *)self networkForCarPlayUUID:a3];
  if (v4) {
    [(CRWiFiCarManager *)self removeNetworkCredentialsForCarPlayNetwork:v4];
  }
  return v4 != 0;
}

- (void)removeNetworkCredentialsForCarPlayNetwork:(__WiFiNetwork *)a3
{
  if (WiFiNetworkGetType() == 1)
  {
    id v4 = CarGeneralLogging();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)id v5 = 0;
      _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "removing password for CarPlay-only network", v5, 2u);
    }

    WiFiNetworkRemovePassword();
  }
  [(NSRecursiveLock *)self->_lock lock];
  [(CRWiFiCarManager *)self _lock_wifiManager];
  WiFiManagerClientRemoveNetworkWithReason();
  [(NSRecursiveLock *)self->_lock unlock];
}

- (void)setInCar:(BOOL)a3 carPlayUUID:(id)a4
{
  id v5 = a4;
  id v6 = CarGeneralLogging();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    int v7 = 138412290;
    id v8 = v5;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "setting WiFiManager to in-car %@", (uint8_t *)&v7, 0xCu);
  }

  [(NSRecursiveLock *)self->_lock lock];
  [(CRWiFiCarManager *)self _lock_wifiManager];
  WiFiManagerClientSetInCarState();
  [(NSRecursiveLock *)self->_lock unlock];
}

- (void)_updateWiFiDevice
{
  [(NSRecursiveLock *)self->_lock lock];
  [(CRWiFiCarManager *)self _lock_wifiManager];
  CFArrayRef v3 = (const __CFArray *)WiFiManagerClientCopyDevices();
  CFArrayRef v4 = v3;
  if (v3 && CFArrayGetCount(v3) >= 1)
  {
    ValueAtIndex = CFArrayGetValueAtIndex(v4, 0);
    if (ValueAtIndex)
    {
      id v6 = ValueAtIndex;
      device = self->_device;
      if (!device || !CFEqual(ValueAtIndex, device)) {
        [(CRWiFiCarManager *)self _lock_setWiFiDevice:v6];
      }
    }
LABEL_12:
    CFRelease(v4);
    goto LABEL_13;
  }
  if (!self->_device)
  {
    id v8 = CarGeneralLogging();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR)) {
      sub_100076868(v8);
    }
  }
  if (v4) {
    goto LABEL_12;
  }
LABEL_13:
  [(NSRecursiveLock *)self->_lock unlock];
}

- (void)_powerStateDidChange
{
  [(NSRecursiveLock *)self->_lock lock];
  BOOL powered = self->_powered;
  if (self->_device) {
    BOOL v4 = WiFiDeviceClientGetPower() != 0;
  }
  else {
    BOOL v4 = 0;
  }
  self->_BOOL powered = v4;
  self->_poweredHasBeenSet = 1;
  [(NSRecursiveLock *)self->_lock unlock];
  id v5 = CarGeneralLogging();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    v6[0] = 67109376;
    v6[1] = powered;
    __int16 v7 = 1024;
    BOOL v8 = v4;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "WiFi _powerStateDidChange from %d to %d", (uint8_t *)v6, 0xEu);
  }
}

- (__WiFiManagerClient)_lock_wifiManager
{
  result = self->_wifiManager;
  if (!result)
  {
    if (MobileWiFiContainsRadio())
    {
      BOOL v4 = (__WiFiManagerClient *)WiFiManagerClientCreate();
      self->_wifiManager = v4;
      if (v4)
      {
LABEL_4:
        CFRunLoopGetCurrent();
        WiFiManagerClientScheduleWithRunLoop();
        Current = CFRunLoopGetCurrent();
        CFRunLoopWakeUp(Current);
        WiFiManagerClientRegisterServerRestartCallback();
        WiFiManagerClientRegisterDeviceAttachmentCallback();
        [(CRWiFiCarManager *)self _updateWiFiDevice];
        return self->_wifiManager;
      }
    }
    else if (self->_wifiManager)
    {
      goto LABEL_4;
    }
    return 0;
  }
  return result;
}

- (void)_lock_setWiFiDevice:(__WiFiDeviceClient *)a3
{
  if (a3)
  {
    device = self->_device;
    if (device)
    {
      if (CFEqual(a3, device)) {
        return;
      }
      if (self->_device)
      {
        id v6 = CarGeneralLogging();
        if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
        {
          __int16 v7 = self->_device;
          int v8 = 138543618;
          v9 = v7;
          __int16 v10 = 2114;
          id v11 = a3;
          _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_INFO, "Unexpected WiFi device change from %{public}@ -> %{public}@", (uint8_t *)&v8, 0x16u);
        }

        if (self->_device)
        {
          WiFiDeviceClientRegisterPowerCallback();
          CFRelease(self->_device);
          self->_device = 0;
        }
      }
    }
    self->_device = (__WiFiDeviceClient *)CFRetain(a3);
    WiFiDeviceClientRegisterPowerCallback();
    [(CRWiFiCarManager *)self _powerStateDidChange];
  }
}

- (void).cxx_destruct
{
}

@end