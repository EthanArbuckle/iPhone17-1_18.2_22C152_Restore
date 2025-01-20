@interface _DASDataProtectionMaster
+ (id)sharedInstance;
- (BOOL)deviceFormatedForContentProtection;
- (BOOL)deviceHasBeenUnlockedSinceBoot;
- (BOOL)deviceIsLocked;
- (BOOL)deviceIsPasswordConfigured;
- (BOOL)isDataAvailableFor:(id)a3;
- (BOOL)isDataAvailableForClassA;
- (BOOL)isDataAvailableForClassC;
- (BOOL)notifyEnabled;
- (NSMutableDictionary)availableState;
- (NSMutableDictionary)handlers;
- (OS_dispatch_queue)notifyQueue;
- (OS_dispatch_queue)stateQueue;
- (_DASDataProtectionMaster)init;
- (id)registerStateChangeHandler:(id)a3;
- (int)notifyToken;
- (void)deregisterStateChangeHandler:(id)a3;
- (void)handleKeyBagLockNotification;
@end

@implementation _DASDataProtectionMaster

+ (id)sharedInstance
{
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10003BF38;
  block[3] = &unk_1001753E0;
  block[4] = a1;
  if (qword_1001C3C28 != -1) {
    dispatch_once(&qword_1001C3C28, block);
  }
  v2 = (void *)qword_1001C3C20;

  return v2;
}

- (_DASDataProtectionMaster)init
{
  v31.receiver = self;
  v31.super_class = (Class)_DASDataProtectionMaster;
  v2 = [(_DASDataProtectionMaster *)&v31 init];
  if (v2)
  {
    dispatch_queue_t v3 = dispatch_queue_create("com.apple.DuetActivityScheduler.DataProtection.state", 0);
    stateQueue = v2->_stateQueue;
    v2->_stateQueue = (OS_dispatch_queue *)v3;

    v2->_deviceFormatedForContentProtection = 0;
    uint64_t v5 = +[NSMutableDictionary dictionary];
    handlers = v2->_handlers;
    v2->_handlers = (NSMutableDictionary *)v5;

    uint64_t v7 = +[NSMutableDictionary dictionary];
    availableState = v2->_availableState;
    v2->_availableState = (NSMutableDictionary *)v7;

    v9 = v2->_availableState;
    v10 = +[_DASDataProtectionStateMonitor dataProtectionClassA];
    [(NSMutableDictionary *)v9 setObject:&__kCFBooleanTrue forKeyedSubscript:v10];

    v11 = v2->_availableState;
    v12 = +[_DASDataProtectionStateMonitor dataProtectionClassC];
    [(NSMutableDictionary *)v11 setObject:&__kCFBooleanTrue forKeyedSubscript:v12];

    v13 = v2->_availableState;
    v14 = +[_DASDataProtectionStateMonitor dataProtectionClassD];
    [(NSMutableDictionary *)v13 setObject:&__kCFBooleanTrue forKeyedSubscript:v14];

    int v15 = MKBDeviceFormattedForContentProtection();
    v2->_deviceFormatedForContentProtection = v15 != 0;
    if (v15)
    {
      v16 = +[NSNumber numberWithBool:[(_DASDataProtectionMaster *)v2 isDataAvailableForClassA]];
      v17 = v2->_availableState;
      v18 = +[_DASDataProtectionStateMonitor dataProtectionClassA];
      [(NSMutableDictionary *)v17 setObject:v16 forKeyedSubscript:v18];

      v19 = +[NSNumber numberWithBool:[(_DASDataProtectionMaster *)v2 isDataAvailableForClassC]];
      v20 = v2->_availableState;
      v21 = +[_DASDataProtectionStateMonitor dataProtectionClassC];
      [(NSMutableDictionary *)v20 setObject:v19 forKeyedSubscript:v21];

      v22 = v2->_availableState;
      v23 = +[_DASDataProtectionStateMonitor dataProtectionClassD];
      [(NSMutableDictionary *)v22 setObject:&__kCFBooleanTrue forKeyedSubscript:v23];

      dispatch_queue_t v24 = dispatch_queue_create("com.apple.DuetActivityScheduler.DataProtection.notify", 0);
      notifyQueue = v2->_notifyQueue;
      v2->_notifyQueue = (OS_dispatch_queue *)v24;

      v2->_notifyToken = 0;
      objc_initWeak(&location, v2);
      v26 = v2->_notifyQueue;
      v28[0] = _NSConcreteStackBlock;
      v28[1] = 3221225472;
      v28[2] = sub_10003C254;
      v28[3] = &unk_100175EA8;
      objc_copyWeak(&v29, &location);
      notify_register_dispatch("com.apple.mobile.keybagd.lock_status", &v2->_notifyToken, v26, v28);
      v2->_notifyEnabled = 1;
      objc_destroyWeak(&v29);
      objc_destroyWeak(&location);
    }
  }
  return v2;
}

- (void)handleKeyBagLockNotification
{
  v34[0] = 0;
  v34[1] = v34;
  v34[2] = 0x3032000000;
  v34[3] = sub_10003C608;
  v34[4] = sub_10003C618;
  id v35 = 0;
  uint64_t v28 = 0;
  id v29 = &v28;
  uint64_t v30 = 0x3032000000;
  objc_super v31 = sub_10003C608;
  v32 = sub_10003C618;
  id v33 = 0;
  stateQueue = self->_stateQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10003C620;
  block[3] = &unk_100175ED0;
  block[4] = self;
  void block[5] = v34;
  block[6] = &v28;
  dispatch_sync(stateQueue, block);
  v4 = +[NSMutableDictionary dictionary];
  uint64_t v5 = self->_stateQueue;
  v24[0] = _NSConcreteStackBlock;
  v24[1] = 3221225472;
  v24[2] = sub_10003C748;
  v24[3] = &unk_100175B30;
  v26 = v34;
  v24[4] = self;
  id v6 = v4;
  id v25 = v6;
  dispatch_sync(v5, v24);
  long long v22 = 0u;
  long long v23 = 0u;
  long long v20 = 0u;
  long long v21 = 0u;
  id v7 = v6;
  id v8 = [v7 countByEnumeratingWithState:&v20 objects:v37 count:16];
  if (v8)
  {
    uint64_t v9 = *(void *)v21;
    do
    {
      v10 = 0;
      do
      {
        if (*(void *)v21 != v9) {
          objc_enumerationMutation(v7);
        }
        v11 = [v7 objectForKeyedSubscript:*(void *)(*((void *)&v20 + 1) + 8 * (void)v10)];
        [v11 BOOLValue];

        long long v18 = 0u;
        long long v19 = 0u;
        long long v16 = 0u;
        long long v17 = 0u;
        id v12 = (id)v29[5];
        id v13 = [v12 countByEnumeratingWithState:&v16 objects:v36 count:16];
        if (v13)
        {
          uint64_t v14 = *(void *)v17;
          do
          {
            int v15 = 0;
            do
            {
              if (*(void *)v17 != v14) {
                objc_enumerationMutation(v12);
              }
              (*(void (**)(void))(*(void *)(*((void *)&v16 + 1) + 8 * (void)v15) + 16))();
              int v15 = (char *)v15 + 1;
            }
            while (v13 != v15);
            id v13 = [v12 countByEnumeratingWithState:&v16 objects:v36 count:16];
          }
          while (v13);
        }

        v10 = (char *)v10 + 1;
      }
      while (v10 != v8);
      id v8 = [v7 countByEnumeratingWithState:&v20 objects:v37 count:16];
    }
    while (v8);
  }

  _Block_object_dispose(&v28, 8);
  _Block_object_dispose(v34, 8);
}

- (BOOL)deviceHasBeenUnlockedSinceBoot
{
  return MKBDeviceUnlockedSinceBoot() != 0;
}

- (BOOL)deviceIsPasswordConfigured
{
  CFBooleanRef v2 = (const __CFBoolean *)MGCopyAnswer();
  CFBooleanRef v3 = v2;
  if (v2) {
    CFRelease(v2);
  }
  return v3 == kCFBooleanTrue;
}

- (BOOL)deviceIsLocked
{
  CFBooleanRef v2 = (const __CFBoolean *)MGCopyAnswer();
  CFBooleanRef v3 = v2;
  if (v2) {
    CFRelease(v2);
  }
  return v3 == kCFBooleanTrue;
}

- (BOOL)isDataAvailableForClassC
{
  if ([(_DASDataProtectionMaster *)self deviceHasBeenUnlockedSinceBoot]) {
    return 1;
  }
  else {
    return ![(_DASDataProtectionMaster *)self deviceIsPasswordConfigured];
  }
}

- (BOOL)isDataAvailableForClassA
{
  if ([(_DASDataProtectionMaster *)self deviceIsLocked]) {
    return ![(_DASDataProtectionMaster *)self deviceIsPasswordConfigured];
  }
  else {
    return 1;
  }
}

- (BOOL)isDataAvailableFor:(id)a3
{
  id v4 = a3;
  uint64_t v5 = v4;
  if (self->_deviceFormatedForContentProtection)
  {
    uint64_t v12 = 0;
    id v13 = &v12;
    uint64_t v14 = 0x2020000000;
    char v15 = 0;
    stateQueue = self->_stateQueue;
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_10003CAF0;
    block[3] = &unk_100175948;
    block[4] = self;
    id v10 = v4;
    v11 = &v12;
    dispatch_sync(stateQueue, block);
    BOOL v7 = *((unsigned char *)v13 + 24) != 0;

    _Block_object_dispose(&v12, 8);
  }
  else
  {
    BOOL v7 = 1;
  }

  return v7;
}

- (id)registerStateChangeHandler:(id)a3
{
  id v4 = a3;
  if (v4)
  {
    uint64_t v5 = +[NSUUID UUID];
    stateQueue = self->_stateQueue;
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_10003CC58;
    block[3] = &unk_100175EF8;
    block[4] = self;
    id v7 = v5;
    id v12 = v7;
    id v13 = v4;
    dispatch_sync(stateQueue, block);
    id v8 = v13;
    id v9 = v7;
  }
  else
  {
    id v9 = 0;
  }

  return v9;
}

- (void)deregisterStateChangeHandler:(id)a3
{
  id v4 = a3;
  stateQueue = self->_stateQueue;
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_10003CD48;
  v7[3] = &unk_100175570;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_sync(stateQueue, v7);
}

- (OS_dispatch_queue)stateQueue
{
  return self->_stateQueue;
}

- (BOOL)deviceFormatedForContentProtection
{
  return self->_deviceFormatedForContentProtection;
}

- (NSMutableDictionary)handlers
{
  return self->_handlers;
}

- (NSMutableDictionary)availableState
{
  return self->_availableState;
}

- (OS_dispatch_queue)notifyQueue
{
  return self->_notifyQueue;
}

- (int)notifyToken
{
  return self->_notifyToken;
}

- (BOOL)notifyEnabled
{
  return self->_notifyEnabled;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_notifyQueue, 0);
  objc_storeStrong((id *)&self->_availableState, 0);
  objc_storeStrong((id *)&self->_handlers, 0);

  objc_storeStrong((id *)&self->_stateQueue, 0);
}

@end