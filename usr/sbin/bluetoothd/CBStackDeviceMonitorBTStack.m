@interface CBStackDeviceMonitorBTStack
- (CBStackDeviceMonitorBTStack)init;
- (OS_dispatch_queue)dispatchQueue;
- (id)description;
- (id)descriptionWithLevel:(int)a3;
- (id)deviceFoundHandler;
- (id)deviceLostHandler;
- (id)invalidationHandler;
- (int)_updatePowerSources;
- (unint64_t)discoveryFlags;
- (void)_invalidated;
- (void)_updateDeviceBLE:(id)a3 flags:(unint64_t)a4;
- (void)_updateDeviceClassic:(void *)a3 flags:(unint64_t)a4;
- (void)_updateDevicesConnected;
- (void)_updateDevicesPaired;
- (void)activate;
- (void)invalidate;
- (void)localDeviceEvent:(int)a3;
- (void)setDeviceFoundHandler:(id)a3;
- (void)setDeviceLostHandler:(id)a3;
- (void)setDiscoveryFlags:(unint64_t)a3;
- (void)setDispatchQueue:(id)a3;
- (void)setInvalidationHandler:(id)a3;
- (void)updateDevices;
@end

@implementation CBStackDeviceMonitorBTStack

- (unint64_t)discoveryFlags
{
  return self->_discoveryFlags;
}

- (CBStackDeviceMonitorBTStack)init
{
  v6.receiver = self;
  v6.super_class = (Class)CBStackDeviceMonitorBTStack;
  v2 = [(CBStackDeviceMonitorBTStack *)&v6 init];
  v3 = v2;
  if (v2)
  {
    v2->_powerTimeRemainingToken = -1;
    v4 = v2;
  }

  return v3;
}

- (id)description
{
  return [(CBStackDeviceMonitorBTStack *)self descriptionWithLevel:50];
}

- (id)descriptionWithLevel:(int)a3
{
  unsigned int v4 = a3;
  id v5 = [(NSMutableDictionary *)self->_deviceMap count];
  if (v4 < 0x15)
  {
    uint64_t v20 = 0;
    v21 = (id *)&v20;
    uint64_t v22 = 0x3032000000;
    v23 = sub_10004CEAC;
    v24 = sub_10004CD28;
    id v25 = 0;
    uint64_t v19 = 0;
    v11 = CUPrintFlags64();
    NSAppendPrintF_safe();
    objc_storeStrong(&v25, 0);

    uint64_t v15 = 0;
    v16 = &v15;
    uint64_t v17 = 0x2020000000;
    uint64_t v18 = 0;
    deviceMap = self->_deviceMap;
    v13[0] = _NSConcreteStackBlock;
    v13[1] = 3221225472;
    v13[2] = sub_10005E568;
    v13[3] = &unk_100997428;
    v13[4] = &v20;
    v13[5] = &v15;
    unsigned int v14 = v4;
    -[NSMutableDictionary enumerateKeysAndObjectsUsingBlock:](deviceMap, "enumerateKeysAndObjectsUsingBlock:", v13, v11, v5);
    if ((unint64_t)v5 > v16[3])
    {
      v8 = v21;
      id obj = v21[5];
      NSAppendPrintF_safe();
      objc_storeStrong(v8 + 5, obj);
    }
    id v6 = v21[5];
    _Block_object_dispose(&v15, 8);
    _Block_object_dispose(&v20, 8);
  }
  else
  {
    v10 = CUPrintFlags64();
    NSPrintF_safe();
    id v6 = (id)objc_claimAutoreleasedReturnValue();
  }

  return v6;
}

- (void)activate
{
  if (!self->_deviceFoundHandler)
  {
    FatalErrorF();
    goto LABEL_19;
  }
  if (!self->_deviceLostHandler)
  {
LABEL_19:
    FatalErrorF();
    goto LABEL_20;
  }
  dispatchQueue = self->_dispatchQueue;
  if (!dispatchQueue)
  {
LABEL_20:
    FatalErrorF();
LABEL_21:
    v8 = (_Unwind_Exception *)FatalErrorF();

    _Unwind_Resume(v8);
  }
  dispatch_assert_queue_V2(dispatchQueue);
  if (self->_invalidateCalled) {
    goto LABEL_21;
  }
  if (dword_1009F7DD8 <= 30 && (dword_1009F7DD8 != -1 || _LogCategory_Initialize())) {
    LogPrintF_safe();
  }
  if (!self->_addedMonitor)
  {
    os_unfair_lock_lock((os_unfair_lock_t)&unk_1009FC0C0);
    if (!qword_1009FC0C8) {
      operator new();
    }
    sub_10005E99C(qword_1009FC0C8, self);
    os_unfair_lock_unlock((os_unfair_lock_t)&unk_1009FC0C0);
    self->_addedMonitor = 1;
  }
  id v5 = self->_powerTimeRemainingCoalescer;
  if (!v5)
  {
    id v6 = objc_alloc_init((Class)CUCoalescer);
    objc_storeStrong((id *)&self->_powerTimeRemainingCoalescer, v6);
    [v6 setDispatchQueue:self->_dispatchQueue];
    [v6 setMinDelay:1.0];
    [v6 setMaxDelay:5.0];
    [v6 setLeeway:1.0];
    v10[0] = _NSConcreteStackBlock;
    v10[1] = 3221225472;
    v10[2] = sub_10005EC24;
    v10[3] = &unk_100997450;
    v10[4] = self;
    [v6 setActionHandler:v10];
    id v5 = (CUCoalescer *)v6;
  }
  if (self->_powerTimeRemainingToken == -1)
  {
    v7 = self->_dispatchQueue;
    v9[0] = _NSConcreteStackBlock;
    v9[1] = 3221225472;
    v9[2] = sub_10005ECA8;
    v9[3] = &unk_100997478;
    v9[4] = self;
    notify_register_dispatch("com.apple.system.accpowersources.timeremaining", &self->_powerTimeRemainingToken, v7, v9);
  }
  [(CBStackDeviceMonitorBTStack *)self updateDevices];
}

- (void)invalidate
{
  dispatch_assert_queue_V2((dispatch_queue_t)self->_dispatchQueue);
  if (!self->_invalidateCalled)
  {
    self->_invalidateCalled = 1;
    if (dword_1009F7DD8 <= 30 && (dword_1009F7DD8 != -1 || _LogCategory_Initialize())) {
      LogPrintF_safe();
    }
    int powerTimeRemainingToken = self->_powerTimeRemainingToken;
    if (powerTimeRemainingToken != -1)
    {
      notify_cancel(powerTimeRemainingToken);
      self->_int powerTimeRemainingToken = -1;
    }
    [(CUCoalescer *)self->_powerTimeRemainingCoalescer invalidate];
    powerTimeRemainingCoalescer = self->_powerTimeRemainingCoalescer;
    self->_powerTimeRemainingCoalescer = 0;

    if (self->_addedMonitor)
    {
      os_unfair_lock_lock((os_unfair_lock_t)&unk_1009FC0C0);
      if (qword_1009FC0C8) {
        sub_10005EE3C(qword_1009FC0C8, self);
      }
      os_unfair_lock_unlock((os_unfair_lock_t)&unk_1009FC0C0);
      self->_addedMonitor = 0;
    }
    [(CBStackDeviceMonitorBTStack *)self _invalidated];
  }
}

- (void)_invalidated
{
  if (!self->_invalidateDone)
  {
    id deviceFoundHandler = self->_deviceFoundHandler;
    self->_id deviceFoundHandler = 0;

    id deviceLostHandler = self->_deviceLostHandler;
    self->_id deviceLostHandler = 0;

    id v6 = (void (**)(void))objc_retainBlock(self->_invalidationHandler);
    id invalidationHandler = self->_invalidationHandler;
    self->_id invalidationHandler = 0;

    if (v6) {
      v6[2]();
    }
    self->_invalidateDone = 1;
    if (dword_1009F7DD8 <= 30 && (dword_1009F7DD8 != -1 || _LogCategory_Initialize())) {
      LogPrintF_safe();
    }
  }
}

- (void)localDeviceEvent:(int)a3
{
  if (!self->_addedMonitor) {
    return;
  }
  if (a3 == 4)
  {
    if ((self->_discoveryFlags & 0x800000) == 0) {
      return;
    }
    if (dword_1009F7DD8 > 30 || dword_1009F7DD8 == -1 && !_LogCategory_Initialize()) {
      goto LABEL_16;
    }
  }
  else
  {
    if (a3 != 5 || (self->_discoveryFlags & 0x200000) == 0) {
      return;
    }
    if (dword_1009F7DD8 > 30 || dword_1009F7DD8 == -1 && !_LogCategory_Initialize()) {
      goto LABEL_16;
    }
  }
  LogPrintF_safe();
LABEL_16:

  [(CBStackDeviceMonitorBTStack *)self updateDevices];
}

- (void)updateDevices
{
  if (self->_addedMonitor)
  {
    [(NSMutableDictionary *)self->_deviceMap enumerateKeysAndObjectsUsingBlock:&stru_1009974B8];
    unint64_t discoveryFlags = self->_discoveryFlags;
    if ((discoveryFlags & 0x800000) != 0)
    {
      [(CBStackDeviceMonitorBTStack *)self _updateDevicesPaired];
      unint64_t discoveryFlags = self->_discoveryFlags;
    }
    if ((discoveryFlags & 0x200000) != 0) {
      [(CBStackDeviceMonitorBTStack *)self _updateDevicesConnected];
    }
    deviceMap = self->_deviceMap;
    v18[0] = _NSConcreteStackBlock;
    v18[1] = 3221225472;
    v18[2] = sub_10005F538;
    v18[3] = &unk_1009974E0;
    v18[4] = self;
    [(NSMutableDictionary *)deviceMap enumerateKeysAndObjectsUsingBlock:v18];
    long long v16 = 0u;
    long long v17 = 0u;
    long long v14 = 0u;
    long long v15 = 0u;
    id v5 = [(NSMutableDictionary *)self->_deviceMap allKeys];
    id v6 = [v5 countByEnumeratingWithState:&v14 objects:v19 count:16];
    if (v6)
    {
      uint64_t v7 = *(void *)v15;
      do
      {
        for (i = 0; i != v6; i = (char *)i + 1)
        {
          if (*(void *)v15 != v7) {
            objc_enumerationMutation(v5);
          }
          uint64_t v9 = *(void *)(*((void *)&v14 + 1) + 8 * i);
          v10 = -[NSMutableDictionary objectForKeyedSubscript:](self->_deviceMap, "objectForKeyedSubscript:", v9, v13);
          if (((unint64_t)[v10 discoveryFlags] & 0xA00000) == 0)
          {
            [(NSMutableDictionary *)self->_deviceMap setObject:0 forKeyedSubscript:v9];
            if (dword_1009F7DD8 <= 30 && (dword_1009F7DD8 != -1 || _LogCategory_Initialize()))
            {
              v13 = v10;
              LogPrintF_safe();
            }
            id v11 = objc_retainBlock(self->_deviceLostHandler);
            v12 = v11;
            if (v11) {
              (*((void (**)(id, void *))v11 + 2))(v11, v10);
            }
          }
        }
        id v6 = [v5 countByEnumeratingWithState:&v14 objects:v19 count:16];
      }
      while (v6);
    }
  }
}

- (void)_updateDevicesConnected
{
  __p = 0;
  long long v16 = 0;
  uint64_t v17 = 0;
  if (qword_1009F7EB0 != -1) {
    dispatch_once(&qword_1009F7EB0, &stru_1009977E0);
  }
  if (sub_1004B55C0((uint64_t)off_1009F7EA8, &__p))
  {
    if (dword_1009F7DD8 > 90) {
      goto LABEL_12;
    }
    if (dword_1009F7DD8 != -1 || _LogCategory_Initialize())
    {
      uint64_t v10 = CUPrintErrorCode();
      LogPrintF_safe();
    }
  }
  if (dword_1009F7DD8 <= 30 && (dword_1009F7DD8 != -1 || _LogCategory_Initialize()))
  {
    uint64_t v10 = (v16 - (unsigned char *)__p) >> 3;
    LogPrintF_safe();
  }
LABEL_12:
  v3 = __p;
  unsigned int v4 = v16;
  while (v3 != v4)
    [(CBStackDeviceMonitorBTStack *)self _updateDeviceClassic:*v3++ flags:0x200000];
  long long v13 = 0u;
  long long v14 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  if (qword_1009F7EC0 != -1) {
    dispatch_once(&qword_1009F7EC0, &stru_100997800);
  }
  id v5 = sub_10004034C((uint64_t)off_1009F7EB8);
  int v6 = 0;
  id v7 = [v5 countByEnumeratingWithState:&v11 objects:v18 count:16];
  if (v7)
  {
    uint64_t v8 = *(void *)v12;
    do
    {
      uint64_t v9 = 0;
      v6 += (int)v7;
      do
      {
        if (*(void *)v12 != v8) {
          objc_enumerationMutation(v5);
        }
        -[CBStackDeviceMonitorBTStack _updateDeviceBLE:flags:](self, "_updateDeviceBLE:flags:", *(void *)(*((void *)&v11 + 1) + 8 * (void)v9), 0x200000, v10);
        uint64_t v9 = (char *)v9 + 1;
      }
      while (v7 != v9);
      id v7 = [v5 countByEnumeratingWithState:&v11 objects:v18 count:16];
    }
    while (v7);
  }

  [(CBStackDeviceMonitorBTStack *)self _updatePowerSources];
  if (dword_1009F7DD8 <= 30 && (dword_1009F7DD8 != -1 || _LogCategory_Initialize())) {
    LogPrintF_safe();
  }
  if (__p)
  {
    long long v16 = __p;
    operator delete(__p);
  }
}

- (void)_updateDevicesPaired
{
  __p = 0;
  long long v16 = 0;
  uint64_t v17 = 0;
  if (qword_1009F7EB0 != -1) {
    dispatch_once(&qword_1009F7EB0, &stru_1009977E0);
  }
  if (sub_1004B54C0((uint64_t)off_1009F7EA8, (uint64_t **)&__p))
  {
    if (dword_1009F7DD8 > 90) {
      goto LABEL_12;
    }
    if (dword_1009F7DD8 != -1 || _LogCategory_Initialize())
    {
      uint64_t v10 = CUPrintErrorCode();
      LogPrintF_safe();
    }
  }
  if (dword_1009F7DD8 <= 30 && (dword_1009F7DD8 != -1 || _LogCategory_Initialize()))
  {
    uint64_t v10 = (v16 - (unsigned char *)__p) >> 3;
    LogPrintF_safe();
  }
LABEL_12:
  v3 = __p;
  unsigned int v4 = v16;
  while (v3 != v4)
    [(CBStackDeviceMonitorBTStack *)self _updateDeviceClassic:*v3++ flags:0x800000];
  long long v13 = 0u;
  long long v14 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  if (qword_1009F7ED0 != -1) {
    dispatch_once(&qword_1009F7ED0, &stru_100997820);
  }
  id v5 = sub_10070CA20(qword_1009F7EC8);
  int v6 = 0;
  id v7 = [v5 countByEnumeratingWithState:&v11 objects:v18 count:16];
  if (v7)
  {
    uint64_t v8 = *(void *)v12;
    do
    {
      uint64_t v9 = 0;
      v6 += (int)v7;
      do
      {
        if (*(void *)v12 != v8) {
          objc_enumerationMutation(v5);
        }
        -[CBStackDeviceMonitorBTStack _updateDeviceBLE:flags:](self, "_updateDeviceBLE:flags:", *(void *)(*((void *)&v11 + 1) + 8 * (void)v9), 0x800000, v10);
        uint64_t v9 = (char *)v9 + 1;
      }
      while (v7 != v9);
      id v7 = [v5 countByEnumeratingWithState:&v11 objects:v18 count:16];
    }
    while (v7);
  }

  if (dword_1009F7DD8 <= 30 && (dword_1009F7DD8 != -1 || _LogCategory_Initialize())) {
    LogPrintF_safe();
  }
  if (__p)
  {
    long long v16 = __p;
    operator delete(__p);
  }
}

- (void)_updateDeviceBLE:(id)a3 flags:(unint64_t)a4
{
  id v6 = a3;
  uint64_t v14 = 0;
  long long v15 = &v14;
  uint64_t v16 = 0x2020000000;
  uint64_t v17 = 0;
  if (qword_1009F7EE0 != -1) {
    dispatch_once(&qword_1009F7EE0, &stru_100997840);
  }
  v13[0] = _NSConcreteStackBlock;
  v13[1] = 3221225472;
  v13[2] = sub_10005FF54;
  v13[3] = &unk_100997508;
  v13[4] = &v14;
  if (sub_1006C4850((uint64_t)off_1009F7ED8, v6, v13) && v15[3])
  {
    id v7 = [v6 UUIDString];
    id v8 = [(NSMutableDictionary *)self->_deviceMap objectForKeyedSubscript:v7];
    if (v8)
    {
      uint64_t v9 = 0;
    }
    else
    {
      id v8 = objc_alloc_init((Class)CBDevice);
      [v8 setIdentifier:v7];
      [v8 setInternalFlags:4];
      deviceMap = self->_deviceMap;
      if (!deviceMap)
      {
        long long v11 = (NSMutableDictionary *)objc_alloc_init((Class)NSMutableDictionary);
        long long v12 = self->_deviceMap;
        self->_deviceMap = v11;

        deviceMap = self->_deviceMap;
      }
      [(NSMutableDictionary *)deviceMap setObject:v8 forKeyedSubscript:v7];
      uint64_t v9 = 0x4000000;
    }
    [v8 setChangeFlags:((unint64_t)[v8 updateWithBLEDevice:v6 btAddr:v15[3]] | v9 | (unint64_t)[v8 changeFlags])];
    [v8 setDiscoveryFlags:((unint64_t)[v8 discoveryFlags] | a4)];
  }
  _Block_object_dispose(&v14, 8);
}

- (void)_updateDeviceClassic:(void *)a3 flags:(unint64_t)a4
{
  uint64_t v7 = *((unsigned __int8 *)a3 + 128);
  uint64_t v8 = *((unsigned __int8 *)a3 + 129);
  uint64_t v9 = *((unsigned __int8 *)a3 + 130);
  uint64_t v10 = *((unsigned __int8 *)a3 + 131);
  uint64_t v11 = *((unsigned __int8 *)a3 + 132);
  uint64_t v12 = *((unsigned __int8 *)a3 + 133);
  if (qword_1009F7EE0 != -1) {
    dispatch_once(&qword_1009F7EE0, &stru_100997840);
  }
  v21[0] = 0;
  v21[1] = 0;
  sub_100014B58((uint64_t)off_1009F7ED8, (v7 << 40) | (v8 << 32) | (v9 << 24) | (v10 << 16) | (v11 << 8) | v12, 1u, 1u, 0, 0, (unsigned __int8 *)v21);
  long long v13 = sub_100031234((const unsigned __int8 *)v21);
  uint64_t v14 = [v13 UUIDString];
  if (v14)
  {
    id v15 = [(NSMutableDictionary *)self->_deviceMap objectForKeyedSubscript:v14];
    if (v15)
    {
      uint64_t v16 = 0;
    }
    else
    {
      id v15 = objc_alloc_init((Class)CBDevice);
      [v15 setIdentifier:v14];
      [v15 setInternalFlags:4];
      deviceMap = self->_deviceMap;
      if (!deviceMap)
      {
        uint64_t v18 = (NSMutableDictionary *)objc_alloc_init((Class)NSMutableDictionary);
        uint64_t v20 = self->_deviceMap;
        p_deviceMap = &self->_deviceMap;
        *p_deviceMap = v18;

        deviceMap = *p_deviceMap;
      }
      [(NSMutableDictionary *)deviceMap setObject:v15 forKeyedSubscript:v14];
      uint64_t v16 = 0x4000000;
    }
    [v15 setChangeFlags:((unint64_t)[v15 updateWithClassicDevice:a3 deviceUUID:v13] | v16 | (unint64_t)[v15 changeFlags])];
    [v15 setDiscoveryFlags:((unint64_t)[v15 discoveryFlags] | a4)];
  }
  else if (dword_1009F7DD8 <= 90 && (dword_1009F7DD8 != -1 || _LogCategory_Initialize()))
  {
    LogPrintF_safe();
  }
}

- (int)_updatePowerSources
{
  uint64_t v3 = IOPSCopyPowerSourcesByType();
  if (v3)
  {
    unsigned int v4 = (const void *)v3;
    v22[0] = _NSConcreteStackBlock;
    v22[1] = 3221225472;
    v22[2] = sub_100060578;
    v22[3] = &unk_100997528;
    v22[4] = v3;
    id v5 = objc_retainBlock(v22);
    uint64_t v20 = v5;
    CFArrayRef v6 = IOPSCopyPowerSourcesList(v4);
    CFArrayRef v7 = v6;
    if (v6)
    {
      v21[0] = _NSConcreteStackBlock;
      v21[1] = 3221225472;
      void v21[2] = sub_100060580;
      v21[3] = &unk_100997528;
      v21[4] = v6;
      uint64_t v18 = objc_retainBlock(v21);
      CFIndex Count = CFArrayGetCount(v7);
      if (Count < 1)
      {
        int v19 = 0;
      }
      else
      {
        CFIndex v9 = 0;
        int v19 = 0;
        do
        {
          ValueAtIndex = CFArrayGetValueAtIndex(v7, v9);
          uint64_t v11 = IOPSGetPowerSourceDescription(v4, ValueAtIndex);
          uint64_t v12 = v11;
          if (v11)
          {
            long long v13 = [v11 objectForKeyedSubscript:@"Accessory Identifier"];
            if (v13)
            {
              uint64_t v14 = [(NSMutableDictionary *)self->_deviceMap objectForKeyedSubscript:v13];
              id v15 = v14;
              if (v14 && ([v14 connectedServices] & 0x400000) != 0)
              {
                [v15 setChangeFlags:([v15 changeFlags] | [v15 updateWithPowerSourceDescription:v12])];
                ++v19;
              }

              id v5 = v20;
            }
          }
          else if (dword_1009F7DD8 <= 90 && (dword_1009F7DD8 != -1 || _LogCategory_Initialize()))
          {
            LogPrintF_safe();
          }

          ++v9;
        }
        while (Count != v9);
      }
      ((void (*)(void *))v18[2])(v18);

      int v16 = v19;
    }
    else
    {
      if (dword_1009F7DD8 <= 90 && (dword_1009F7DD8 != -1 || _LogCategory_Initialize())) {
        LogPrintF_safe();
      }
      int v16 = 0;
    }
    ((void (*)(void *))v5[2])(v5);
  }
  else
  {
    if (dword_1009F7DD8 <= 90 && (dword_1009F7DD8 != -1 || _LogCategory_Initialize())) {
      LogPrintF_safe();
    }
    return 0;
  }
  return v16;
}

- (id)deviceFoundHandler
{
  return self->_deviceFoundHandler;
}

- (void)setDeviceFoundHandler:(id)a3
{
}

- (id)deviceLostHandler
{
  return self->_deviceLostHandler;
}

- (void)setDeviceLostHandler:(id)a3
{
}

- (void)setDiscoveryFlags:(unint64_t)a3
{
  self->_unint64_t discoveryFlags = a3;
}

- (OS_dispatch_queue)dispatchQueue
{
  return self->_dispatchQueue;
}

- (void)setDispatchQueue:(id)a3
{
}

- (id)invalidationHandler
{
  return self->_invalidationHandler;
}

- (void)setInvalidationHandler:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_invalidationHandler, 0);
  objc_storeStrong((id *)&self->_dispatchQueue, 0);
  objc_storeStrong(&self->_deviceLostHandler, 0);
  objc_storeStrong(&self->_deviceFoundHandler, 0);
  objc_storeStrong((id *)&self->_powerTimeRemainingCoalescer, 0);

  objc_storeStrong((id *)&self->_deviceMap, 0);
}

@end