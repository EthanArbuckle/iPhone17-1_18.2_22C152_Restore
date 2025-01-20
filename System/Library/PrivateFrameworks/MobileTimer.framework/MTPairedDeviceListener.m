@interface MTPairedDeviceListener
+ (MTPairedDeviceListener)sharedListener;
+ (id)_handledNotifications;
- (BOOL)handlesNotification:(id)a3 ofType:(int64_t)a4;
- (BOOL)hasActivePairedDevice;
- (BOOL)hasActivePairedDeviceCheckSyncing:(BOOL)a3;
- (BOOL)hasActivePairedDeviceSupportingSyncing;
- (BOOL)sleepEnabled;
- (MTObserverStore)observers;
- (MTPairedDeviceListener)init;
- (NAScheduler)serializer;
- (NRDevice)pairedDevice;
- (NSString)pairedDeviceVersion;
- (OS_dispatch_queue)serializerQueue;
- (void)_registerForLocalNotifications;
- (void)didReceiveNotification:(id)a3;
- (void)didReceiveNotificationNamed:(id)a3;
- (void)handleNotification:(id)a3 ofType:(int64_t)a4 completion:(id)a5;
- (void)notifyObserversWithBlock:(id)a3;
- (void)printDiagnostics;
- (void)registerObserver:(id)a3;
- (void)setObservers:(id)a3;
- (void)setPairedDevice:(id)a3;
- (void)setSerializer:(id)a3;
- (void)setSerializerQueue:(id)a3;
- (void)setSleepEnabled:(BOOL)a3;
- (void)updateActiveDeviceInfo;
@end

@implementation MTPairedDeviceListener

void __48__MTPairedDeviceListener_updateActiveDeviceInfo__block_invoke(uint64_t a1)
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  v2 = [MEMORY[0x1E4F79EF0] sharedInstance];
  v3 = [v2 getActivePairedDevice];

  [*(id *)(a1 + 32) setPairedDevice:v3];
  v4 = MTLogForCategory(6);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    v5 = *(void **)(a1 + 32);
    v6 = [v5 pairedDevice];
    v7 = [v6 valueForProperty:*MEMORY[0x1E4F79E08]];
    v8 = [*(id *)(a1 + 32) pairedDevice];
    v9 = [v8 valueForProperty:*MEMORY[0x1E4F79E60]];
    int v10 = 138543874;
    v11 = v5;
    __int16 v12 = 2114;
    v13 = v7;
    __int16 v14 = 2114;
    v15 = v9;
    _os_log_impl(&dword_19CC95000, v4, OS_LOG_TYPE_DEFAULT, "%{public}@ Active Paired Device: %{public}@ (version: %{public}@)", (uint8_t *)&v10, 0x20u);
  }
}

- (NRDevice)pairedDevice
{
  return self->_pairedDevice;
}

- (void)setPairedDevice:(id)a3
{
}

- (void)_registerForLocalNotifications
{
  v3 = [MEMORY[0x1E4F28EB8] defaultCenter];
  [v3 addObserver:self selector:sel_didReceiveNotification_ name:*MEMORY[0x1E4F79EA0] object:0];

  v4 = [MEMORY[0x1E4F28EB8] defaultCenter];
  [v4 addObserver:self selector:sel_didReceiveNotification_ name:*MEMORY[0x1E4F79E88] object:0];

  v5 = [MEMORY[0x1E4F28EB8] defaultCenter];
  [v5 addObserver:self selector:sel_didReceiveNotification_ name:*MEMORY[0x1E4F79EB8] object:0];

  v6 = [MEMORY[0x1E4F28EB8] defaultCenter];
  [v6 addObserver:self selector:sel_didReceiveNotification_ name:*MEMORY[0x1E4F79E90] object:0];

  id v7 = [MEMORY[0x1E4F28EB8] defaultCenter];
  [v7 addObserver:self selector:sel_didReceiveNotification_ name:@"MTPairedDevicePreferencesChanged" object:0];
}

- (MTPairedDeviceListener)init
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  v12.receiver = self;
  v12.super_class = (Class)MTPairedDeviceListener;
  v2 = [(MTPairedDeviceListener *)&v12 init];
  if (v2)
  {
    v3 = MTLogForCategory(6);
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138543362;
      __int16 v14 = v2;
      _os_log_impl(&dword_19CC95000, v3, OS_LOG_TYPE_DEFAULT, "Initializing %{public}@", buf, 0xCu);
    }

    v4 = dispatch_queue_attr_make_with_qos_class(0, (dispatch_qos_class_t)+[MTScheduler defaultPriority], -1);
    dispatch_queue_t v5 = dispatch_queue_create("com.apple.MTPairedDeviceListener.access-queue", v4);
    serializerQueue = v2->_serializerQueue;
    v2->_serializerQueue = (OS_dispatch_queue *)v5;

    uint64_t v7 = [MEMORY[0x1E4F7A0F0] schedulerWithDispatchQueue:v2->_serializerQueue];
    serializer = v2->_serializer;
    v2->_serializer = (NAScheduler *)v7;

    uint64_t v9 = objc_opt_new();
    observers = v2->_observers;
    v2->_observers = (MTObserverStore *)v9;

    [(MTPairedDeviceListener *)v2 _registerForLocalNotifications];
    [(MTPairedDeviceListener *)v2 updateActiveDeviceInfo];
  }
  return v2;
}

- (void)updateActiveDeviceInfo
{
  v3 = [(MTPairedDeviceListener *)self serializer];
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __48__MTPairedDeviceListener_updateActiveDeviceInfo__block_invoke;
  v4[3] = &unk_1E59150A8;
  v4[4] = self;
  [v3 performBlock:v4];
}

- (NAScheduler)serializer
{
  return self->_serializer;
}

uint64_t __40__MTPairedDeviceListener_sharedListener__block_invoke()
{
  sharedListener___sharedListener = objc_opt_new();
  return MEMORY[0x1F41817F8]();
}

+ (MTPairedDeviceListener)sharedListener
{
  if (sharedListener_onceToken != -1) {
    dispatch_once(&sharedListener_onceToken, &__block_literal_global_8);
  }
  v2 = (void *)sharedListener___sharedListener;
  return (MTPairedDeviceListener *)v2;
}

+ (id)_handledNotifications
{
  if (_handledNotifications_onceToken != -1) {
    dispatch_once(&_handledNotifications_onceToken, &__block_literal_global_9_0);
  }
  v2 = (void *)_handledNotifications___handledNotifications;
  return v2;
}

void __47__MTPairedDeviceListener__handledNotifications__block_invoke()
{
  v6[5] = *MEMORY[0x1E4F143B8];
  v0 = (void *)MEMORY[0x1E4F1CAD0];
  uint64_t v1 = *MEMORY[0x1E4F79EE0];
  v6[0] = *MEMORY[0x1E4F79ED8];
  v6[1] = v1;
  uint64_t v2 = *MEMORY[0x1E4F79E98];
  v6[2] = *MEMORY[0x1E4F79EA8];
  v6[3] = v2;
  v6[4] = *MEMORY[0x1E4F79ED0];
  v3 = [MEMORY[0x1E4F1C978] arrayWithObjects:v6 count:5];
  uint64_t v4 = [v0 setWithArray:v3];
  dispatch_queue_t v5 = (void *)_handledNotifications___handledNotifications;
  _handledNotifications___handledNotifications = v4;
}

- (BOOL)handlesNotification:(id)a3 ofType:(int64_t)a4
{
  id v4 = a3;
  dispatch_queue_t v5 = [(id)objc_opt_class() _handledNotifications];
  char v6 = [v5 containsObject:v4];

  return v6;
}

- (void)handleNotification:(id)a3 ofType:(int64_t)a4 completion:(id)a5
{
  id v8 = a5;
  [(MTPairedDeviceListener *)self didReceiveNotificationNamed:a3];
  uint64_t v7 = v8;
  if (v8)
  {
    (*((void (**)(id))v8 + 2))(v8);
    uint64_t v7 = v8;
  }
}

- (void)didReceiveNotification:(id)a3
{
  id v4 = [a3 name];
  [(MTPairedDeviceListener *)self didReceiveNotificationNamed:v4];
}

- (void)didReceiveNotificationNamed:(id)a3
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  dispatch_queue_t v5 = MTLogForCategory(6);
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    int v6 = 138543618;
    uint64_t v7 = self;
    __int16 v8 = 2114;
    id v9 = v4;
    _os_log_impl(&dword_19CC95000, v5, OS_LOG_TYPE_DEFAULT, "%{public}@ received %{public}@", (uint8_t *)&v6, 0x16u);
  }

  [(MTPairedDeviceListener *)self updateActiveDeviceInfo];
  [(MTPairedDeviceListener *)self notifyObserversWithBlock:&__block_literal_global_14_0];
}

uint64_t __54__MTPairedDeviceListener_didReceiveNotificationNamed___block_invoke(uint64_t a1, void *a2)
{
  return [a2 activePairedDeviceDidChange];
}

- (NSString)pairedDeviceVersion
{
  uint64_t v6 = 0;
  uint64_t v7 = &v6;
  uint64_t v8 = 0x3032000000;
  id v9 = __Block_byref_object_copy__0;
  uint64_t v10 = __Block_byref_object_dispose__0;
  id v11 = 0;
  serializerQueue = self->_serializerQueue;
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __45__MTPairedDeviceListener_pairedDeviceVersion__block_invoke;
  v5[3] = &unk_1E5915340;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(serializerQueue, v5);
  id v3 = (id)v7[5];
  _Block_object_dispose(&v6, 8);

  return (NSString *)v3;
}

void __45__MTPairedDeviceListener_pairedDeviceVersion__block_invoke(uint64_t a1)
{
  id v5 = [*(id *)(a1 + 32) pairedDevice];
  uint64_t v2 = [v5 valueForProperty:*MEMORY[0x1E4F79E40]];
  uint64_t v3 = *(void *)(*(void *)(a1 + 40) + 8);
  id v4 = *(void **)(v3 + 40);
  *(void *)(v3 + 40) = v2;
}

- (BOOL)hasActivePairedDevice
{
  return [(MTPairedDeviceListener *)self hasActivePairedDeviceCheckSyncing:0];
}

- (BOOL)hasActivePairedDeviceSupportingSyncing
{
  return [(MTPairedDeviceListener *)self hasActivePairedDeviceCheckSyncing:1];
}

- (BOOL)hasActivePairedDeviceCheckSyncing:(BOOL)a3
{
  uint64_t v8 = 0;
  id v9 = &v8;
  uint64_t v10 = 0x2020000000;
  char v11 = 1;
  serializerQueue = self->_serializerQueue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __60__MTPairedDeviceListener_hasActivePairedDeviceCheckSyncing___block_invoke;
  block[3] = &unk_1E5915368;
  block[4] = self;
  block[5] = &v8;
  BOOL v7 = a3;
  dispatch_sync(serializerQueue, block);
  char v4 = *((unsigned char *)v9 + 24);
  _Block_object_dispose(&v8, 8);
  return v4;
}

void __60__MTPairedDeviceListener_hasActivePairedDeviceCheckSyncing___block_invoke(uint64_t a1)
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  uint64_t v2 = [*(id *)(a1 + 32) pairedDevice];

  if (!v2)
  {
    uint64_t v3 = MTLogForCategory(6);
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v4 = *(void *)(a1 + 32);
      int v13 = 138543362;
      uint64_t v14 = v4;
      _os_log_impl(&dword_19CC95000, v3, OS_LOG_TYPE_DEFAULT, "%{public}@ no paired device detected", (uint8_t *)&v13, 0xCu);
    }

    *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = 0;
  }
  if (*(unsigned char *)(a1 + 48))
  {
    if (*(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24))
    {
      id v5 = [*(id *)(a1 + 32) pairedDevice];
      uint64_t v6 = (void *)[objc_alloc(MEMORY[0x1E4F29128]) initWithUUIDString:@"C0F3C2C3-0CDE-4DF9-A95A-789AC9A0348B"];
      char v7 = [v5 supportsCapability:v6];

      if ((v7 & 1) == 0)
      {
        uint64_t v8 = MTLogForCategory(6);
        if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
        {
          uint64_t v9 = *(void *)(a1 + 32);
          int v13 = 138543362;
          uint64_t v14 = v9;
          _os_log_impl(&dword_19CC95000, v8, OS_LOG_TYPE_DEFAULT, "%{public}@ paired watch version is too old for sync", (uint8_t *)&v13, 0xCu);
        }

        *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = 0;
      }
    }
  }
  if (*(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24))
  {
    uint64_t v10 = MTLogForCategory(6);
    if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
    {
      uint64_t v11 = *(void *)(a1 + 32);
      objc_super v12 = @" with sync capability";
      if (!*(unsigned char *)(a1 + 48)) {
        objc_super v12 = &stru_1EEDE16C8;
      }
      int v13 = 138543618;
      uint64_t v14 = v11;
      __int16 v15 = 2114;
      uint64_t v16 = v12;
      _os_log_impl(&dword_19CC95000, v10, OS_LOG_TYPE_INFO, "%{public}@ has active paired watch%{public}@", (uint8_t *)&v13, 0x16u);
    }
  }
}

- (void)registerObserver:(id)a3
{
}

- (void)notifyObserversWithBlock:(id)a3
{
  id v4 = a3;
  id v5 = [(MTPairedDeviceListener *)self observers];
  [v5 enumerateObserversWithBlock:v4];
}

- (void)printDiagnostics
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  uint64_t v3 = MTLogForCategory(6);
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    LOWORD(v13) = 0;
    _os_log_impl(&dword_19CC95000, v3, OS_LOG_TYPE_DEFAULT, "-----MTPairedDeviceListener-----", (uint8_t *)&v13, 2u);
  }

  id v4 = MTLogForCategory(6);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    id v5 = [(MTPairedDeviceListener *)self pairedDevice];
    uint64_t v6 = [v5 valueForProperty:*MEMORY[0x1E4F79D18]];
    char v7 = [(MTPairedDeviceListener *)self pairedDevice];
    uint64_t v8 = [v7 valueForProperty:*MEMORY[0x1E4F79E60]];
    uint64_t v9 = [(MTPairedDeviceListener *)self pairedDevice];
    uint64_t v10 = [v9 valueForProperty:*MEMORY[0x1E4F79E40]];
    int v13 = 138543874;
    uint64_t v14 = v6;
    __int16 v15 = 2114;
    uint64_t v16 = v8;
    __int16 v17 = 2114;
    v18 = v10;
    _os_log_impl(&dword_19CC95000, v4, OS_LOG_TYPE_DEFAULT, "Paired Device: %{public}@ - %{public}@ - %{public}@", (uint8_t *)&v13, 0x20u);
  }
  uint64_t v11 = MTLogForCategory(6);
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    objc_super v12 = [(MTPairedDeviceListener *)self pairedDevice];
    int v13 = 67240192;
    LODWORD(v14) = v12 != 0;
    _os_log_impl(&dword_19CC95000, v11, OS_LOG_TYPE_DEFAULT, "Paired Device Active: %{public}d", (uint8_t *)&v13, 8u);
  }
}

- (OS_dispatch_queue)serializerQueue
{
  return self->_serializerQueue;
}

- (void)setSerializerQueue:(id)a3
{
}

- (void)setSerializer:(id)a3
{
}

- (MTObserverStore)observers
{
  return self->_observers;
}

- (void)setObservers:(id)a3
{
}

- (BOOL)sleepEnabled
{
  return self->_sleepEnabled;
}

- (void)setSleepEnabled:(BOOL)a3
{
  self->_sleepEnabled = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_pairedDevice, 0);
  objc_storeStrong((id *)&self->_observers, 0);
  objc_storeStrong((id *)&self->_serializer, 0);
  objc_storeStrong((id *)&self->_serializerQueue, 0);
}

@end