@interface CBStackAccessoryMonitorBTStack
- (CBStackAccessoryMonitorBTStack)init;
- (OS_dispatch_queue)dispatchQueue;
- (id)audioAccessoryEventHandler;
- (id)audioAccessoryInfoChangedHandler;
- (id)getAudioAccessoryDeviceArray;
- (id)invalidationHandler;
- (void)_accessoryContextMessageData:(id)a3 device:(id)a4;
- (void)_accessoryConversationDetectMessageData:(id)a3 device:(id)a4;
- (void)_accessoryPMEConfigData:(id)a3 device:(id)a4;
- (void)_invalidated;
- (void)_updateAudioAccessoryDeviceInfo:(void *)a3 flags:(unint64_t)a4;
- (void)_updateConnectedAudioAccessories;
- (void)activate;
- (void)invalidate;
- (void)localDeviceEvent:(int)a3;
- (void)setAudioAccessoryEventHandler:(id)a3;
- (void)setAudioAccessoryInfoChangedHandler:(id)a3;
- (void)setDispatchQueue:(id)a3;
- (void)setInvalidationHandler:(id)a3;
- (void)updateAccessoryInfo;
@end

@implementation CBStackAccessoryMonitorBTStack

- (CBStackAccessoryMonitorBTStack)init
{
  v6.receiver = self;
  v6.super_class = (Class)CBStackAccessoryMonitorBTStack;
  v2 = [(CBStackAccessoryMonitorBTStack *)&v6 init];
  v3 = v2;
  if (v2) {
    v4 = v2;
  }

  return v3;
}

- (id)getAudioAccessoryDeviceArray
{
  uint64_t v7 = 0;
  v8 = &v7;
  uint64_t v9 = 0x3032000000;
  v10 = sub_10004CF5C;
  v11 = sub_10004CD80;
  id v12 = 0;
  v2 = self;
  objc_sync_enter(v2);
  accessoryDeviceInfoMap = v2->_accessoryDeviceInfoMap;
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472;
  v6[2] = sub_1000D03F4;
  v6[3] = &unk_100999EE8;
  v6[4] = &v7;
  [(NSMutableDictionary *)accessoryDeviceInfoMap enumerateKeysAndObjectsUsingBlock:v6];
  objc_sync_exit(v2);

  id v4 = (id)v8[5];
  _Block_object_dispose(&v7, 8);

  return v4;
}

- (void)activate
{
  if (!self->_audioAccessoryEventHandler)
  {
    FatalErrorF();
    goto LABEL_15;
  }
  if (!self->_audioAccessoryInfoChangedHandler)
  {
LABEL_15:
    FatalErrorF();
    goto LABEL_16;
  }
  dispatchQueue = self->_dispatchQueue;
  if (!dispatchQueue)
  {
LABEL_16:
    FatalErrorF();
    goto LABEL_17;
  }
  dispatch_assert_queue_V2(dispatchQueue);
  if (self->_invalidateCalled)
  {
LABEL_17:
    uint64_t v4 = FatalErrorF();
    sub_1000D064C(v4, v5);
    return;
  }
  if (dword_1009F87B0 <= 30 && (dword_1009F87B0 != -1 || _LogCategory_Initialize())) {
    LogPrintF_safe();
  }
  if (!self->_addedMonitor)
  {
    os_unfair_lock_lock((os_unfair_lock_t)&unk_1009FC190);
    if (!qword_1009FC198) {
      operator new();
    }
    sub_1000D064C(qword_1009FC198, self);
    os_unfair_lock_unlock((os_unfair_lock_t)&unk_1009FC190);
    self->_addedMonitor = 1;
  }
}

- (void)invalidate
{
  dispatch_assert_queue_V2((dispatch_queue_t)self->_dispatchQueue);
  if (!self->_invalidateCalled)
  {
    self->_invalidateCalled = 1;
    if (dword_1009F87B0 <= 30 && (dword_1009F87B0 != -1 || _LogCategory_Initialize())) {
      LogPrintF_safe();
    }
    if (self->_addedMonitor)
    {
      os_unfair_lock_lock((os_unfair_lock_t)&unk_1009FC190);
      if (qword_1009FC198) {
        sub_1000D08C8(qword_1009FC198, self);
      }
      os_unfair_lock_unlock((os_unfair_lock_t)&unk_1009FC190);
      self->_addedMonitor = 0;
    }
    [(CBStackAccessoryMonitorBTStack *)self _invalidated];
  }
}

- (void)_invalidated
{
  if (!self->_invalidateDone)
  {
    id audioAccessoryEventHandler = self->_audioAccessoryEventHandler;
    self->_id audioAccessoryEventHandler = 0;

    id audioAccessoryInfoChangedHandler = self->_audioAccessoryInfoChangedHandler;
    self->_id audioAccessoryInfoChangedHandler = 0;

    objc_super v6 = (void (**)(void))objc_retainBlock(self->_invalidationHandler);
    id invalidationHandler = self->_invalidationHandler;
    self->_id invalidationHandler = 0;

    if (v6) {
      v6[2]();
    }
    self->_invalidateDone = 1;
    if (dword_1009F87B0 <= 30 && (dword_1009F87B0 != -1 || _LogCategory_Initialize())) {
      LogPrintF_safe();
    }
  }
}

- (void)localDeviceEvent:(int)a3
{
  if (a3 == 5 && self->_addedMonitor)
  {
    if (dword_1009F87B0 <= 30 && (dword_1009F87B0 != -1 || _LogCategory_Initialize())) {
      LogPrintF_safe();
    }
    [(CBStackAccessoryMonitorBTStack *)self updateAccessoryInfo];
  }
}

- (void)_accessoryContextMessageData:(id)a3 device:(id)a4
{
  id v9 = a3;
  id v6 = a4;
  id v7 = objc_retainBlock(self->_audioAccessoryEventHandler);
  v8 = v7;
  if (v7) {
    (*((void (**)(id, uint64_t, id, id))v7 + 2))(v7, 4, v9, v6);
  }
}

- (void)_accessoryConversationDetectMessageData:(id)a3 device:(id)a4
{
  id v9 = a3;
  id v6 = a4;
  id v7 = objc_retainBlock(self->_audioAccessoryEventHandler);
  v8 = v7;
  if (v7) {
    (*((void (**)(id, uint64_t, id, id))v7 + 2))(v7, 2, v9, v6);
  }
}

- (void)_accessoryPMEConfigData:(id)a3 device:(id)a4
{
  id v9 = a3;
  id v6 = a4;
  id v7 = objc_retainBlock(self->_audioAccessoryEventHandler);
  v8 = v7;
  if (v7) {
    (*((void (**)(id, uint64_t, id, id))v7 + 2))(v7, 5, v9, v6);
  }
}

- (void)updateAccessoryInfo
{
  if (self->_addedMonitor)
  {
    v2 = self;
    objc_sync_enter(v2);
    [(NSMutableDictionary *)v2->_accessoryDeviceInfoMap enumerateKeysAndObjectsUsingBlock:&stru_100999F28];
    objc_sync_exit(v2);

    [(CBStackAccessoryMonitorBTStack *)v2 _updateConnectedAudioAccessories];
    v3 = v2;
    objc_sync_enter(v3);
    accessoryDeviceInfoMap = v2->_accessoryDeviceInfoMap;
    v17[0] = _NSConcreteStackBlock;
    v17[1] = 3221225472;
    v17[2] = sub_1000D1120;
    v17[3] = &unk_100999F50;
    v17[4] = v3;
    [(NSMutableDictionary *)accessoryDeviceInfoMap enumerateKeysAndObjectsUsingBlock:v17];
    long long v15 = 0u;
    long long v16 = 0u;
    long long v13 = 0u;
    long long v14 = 0u;
    v5 = [(NSMutableDictionary *)v2->_accessoryDeviceInfoMap allKeys];
    id v6 = [v5 countByEnumeratingWithState:&v13 objects:v18 count:16];
    if (v6)
    {
      uint64_t v7 = *(void *)v14;
      do
      {
        for (i = 0; i != v6; i = (char *)i + 1)
        {
          if (*(void *)v14 != v7) {
            objc_enumerationMutation(v5);
          }
          uint64_t v9 = *(void *)(*((void *)&v13 + 1) + 8 * i);
          v10 = -[NSMutableDictionary objectForKeyedSubscript:](v2->_accessoryDeviceInfoMap, "objectForKeyedSubscript:", v9, v12);
          if (([v10 discoveryFlags] & 0x200000) == 0)
          {
            v11 = v3;
            objc_sync_enter(v11);
            [(NSMutableDictionary *)v2->_accessoryDeviceInfoMap setObject:0 forKeyedSubscript:v9];
            objc_sync_exit(v11);

            if (dword_1009F87B0 <= 30 && (dword_1009F87B0 != -1 || _LogCategory_Initialize()))
            {
              id v12 = [v10 identifier];
              LogPrintF_safe();
            }
          }
        }
        id v6 = [v5 countByEnumeratingWithState:&v13 objects:v18 count:16];
      }
      while (v6);
    }

    objc_sync_exit(v3);
  }
}

- (void)_updateConnectedAudioAccessories
{
  id v6 = 0;
  uint64_t v7 = 0;
  uint64_t v8 = 0;
  if (qword_1009F7EB0 != -1) {
    dispatch_once(&qword_1009F7EB0, &stru_10099A040);
  }
  if (sub_1004B55C0((uint64_t)off_1009F7EA8, (void **)&v6)
    && dword_1009F87B0 <= 90
    && (dword_1009F87B0 != -1 || _LogCategory_Initialize()))
  {
    v5 = CUPrintErrorCode();
    LogPrintF_safe();
  }
  v3 = v6;
  uint64_t v4 = v7;
  if (v6 != v7)
  {
    do
      -[CBStackAccessoryMonitorBTStack _updateAudioAccessoryDeviceInfo:flags:](self, "_updateAudioAccessoryDeviceInfo:flags:", *v3++, 0x200000, v5);
    while (v3 != v4);
    v3 = v6;
  }
  if (v3)
  {
    uint64_t v7 = v3;
    operator delete(v3);
  }
}

- (void)_updateAudioAccessoryDeviceInfo:(void *)a3 flags:(unint64_t)a4
{
  id v15 = 0;
  id v7 = [objc_alloc((Class)CBDevice) initWithBTStackDevice:a3 error:&v15];
  id v8 = v15;
  if (v7)
  {
    uint64_t v9 = [v7 identifier];
    v10 = self;
    objc_sync_enter(v10);
    v11 = [(NSMutableDictionary *)v10->_accessoryDeviceInfoMap objectForKeyedSubscript:v9];
    if (!v11)
    {
      v11 = objc_alloc_init(AudioAccessoryDeviceInfo);
      [(AudioAccessoryDeviceInfo *)v11 setIdentifier:v9];
      accessoryDeviceInfoMap = v10->_accessoryDeviceInfoMap;
      if (!accessoryDeviceInfoMap)
      {
        long long v13 = (NSMutableDictionary *)objc_alloc_init((Class)NSMutableDictionary);
        long long v14 = v10->_accessoryDeviceInfoMap;
        v10->_accessoryDeviceInfoMap = v13;

        accessoryDeviceInfoMap = v10->_accessoryDeviceInfoMap;
      }
      [(NSMutableDictionary *)accessoryDeviceInfoMap setObject:v11 forKeyedSubscript:v9];
    }
    [(AudioAccessoryDeviceInfo *)v11 setChangeFlags:[(AudioAccessoryDeviceInfo *)v11 changeFlags] | [(AudioAccessoryDeviceInfo *)v11 updateWithClassicDevice:a3]];
    [(AudioAccessoryDeviceInfo *)v11 setDiscoveryFlags:[(AudioAccessoryDeviceInfo *)v11 discoveryFlags] | a4];

    objc_sync_exit(v10);
    goto LABEL_7;
  }
  if (dword_1009F87B0 <= 90 && (dword_1009F87B0 != -1 || _LogCategory_Initialize()))
  {
    uint64_t v9 = CUPrintNSError();
    LogPrintF_safe();
LABEL_7:
  }
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

- (id)audioAccessoryEventHandler
{
  return self->_audioAccessoryEventHandler;
}

- (void)setAudioAccessoryEventHandler:(id)a3
{
}

- (id)audioAccessoryInfoChangedHandler
{
  return self->_audioAccessoryInfoChangedHandler;
}

- (void)setAudioAccessoryInfoChangedHandler:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_audioAccessoryInfoChangedHandler, 0);
  objc_storeStrong(&self->_audioAccessoryEventHandler, 0);
  objc_storeStrong(&self->_invalidationHandler, 0);
  objc_storeStrong((id *)&self->_dispatchQueue, 0);

  objc_storeStrong((id *)&self->_accessoryDeviceInfoMap, 0);
}

@end