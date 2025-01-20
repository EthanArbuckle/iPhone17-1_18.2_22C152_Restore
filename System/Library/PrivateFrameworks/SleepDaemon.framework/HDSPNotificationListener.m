@interface HDSPNotificationListener
- (HDSPEnvironment)environment;
- (HDSPNotificationListener)initWithEnvironment:(id)a3;
- (HKSPObserverSet)observers;
- (NSMutableDictionary)launchNotificationRegistrations;
- (os_unfair_lock_s)launchNotificationRegistrationLock;
- (void)_handleNotificationWithName:(id)a3 completion:(id)a4;
- (void)_registerForStream:(id)a3;
- (void)_withLock:(id)a3;
- (void)addObserver:(id)a3;
- (void)registerForLaunchNotificationWithName:(const char *)a3 key:(id)a4;
- (void)removeObserver:(id)a3;
- (void)startListening;
- (void)unregisterForLaunchNotificationWithName:(const char *)a3 key:(id)a4;
@end

@implementation HDSPNotificationListener

- (HDSPNotificationListener)initWithEnvironment:(id)a3
{
  uint64_t v22 = *MEMORY[0x263EF8340];
  id v4 = a3;
  v17.receiver = self;
  v17.super_class = (Class)HDSPNotificationListener;
  v5 = [(HDSPNotificationListener *)&v17 init];
  if (v5)
  {
    v6 = HKSPLogForCategory();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      v7 = objc_opt_class();
      *(_DWORD *)buf = 138543618;
      v19 = v7;
      __int16 v20 = 2048;
      v21 = v5;
      id v8 = v7;
      _os_log_impl(&dword_221A52000, v6, OS_LOG_TYPE_DEFAULT, "[%{public}@.%p] initializing...", buf, 0x16u);
    }
    objc_storeWeak((id *)&v5->_environment, v4);
    id v9 = objc_alloc(MEMORY[0x263F75E20]);
    v10 = [v4 defaultCallbackScheduler];
    uint64_t v11 = [v9 initWithCallbackScheduler:v10];
    observers = v5->_observers;
    v5->_observers = (HKSPObserverSet *)v11;

    v13 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x263EFF9A0]);
    launchNotificationRegistrations = v5->_launchNotificationRegistrations;
    v5->_launchNotificationRegistrations = v13;

    v5->_launchNotificationRegistrationLock._os_unfair_lock_opaque = 0;
    v15 = v5;
  }

  return v5;
}

- (void)_withLock:(id)a3
{
  p_launchNotificationRegistrationLock = &self->_launchNotificationRegistrationLock;
  id v4 = (void (**)(void))a3;
  os_unfair_lock_lock(p_launchNotificationRegistrationLock);
  v4[2](v4);

  os_unfair_lock_unlock(p_launchNotificationRegistrationLock);
}

- (void)addObserver:(id)a3
{
  if (a3) {
    -[HKSPObserverSet addObserver:](self->_observers, "addObserver:");
  }
}

- (void)removeObserver:(id)a3
{
  if (a3) {
    -[HKSPObserverSet removeObserver:](self->_observers, "removeObserver:");
  }
}

- (void)registerForLaunchNotificationWithName:(const char *)a3 key:(id)a4
{
  id v6 = a4;
  uint64_t v17 = 0;
  v18 = &v17;
  uint64_t v19 = 0x2020000000;
  char v20 = 0;
  uint64_t v9 = MEMORY[0x263EF8330];
  uint64_t v10 = 3221225472;
  uint64_t v11 = __70__HDSPNotificationListener_registerForLaunchNotificationWithName_key___block_invoke;
  v12 = &unk_2645DB358;
  v16 = a3;
  v13 = self;
  id v7 = v6;
  id v14 = v7;
  v15 = &v17;
  [(HDSPNotificationListener *)self _withLock:&v9];
  if (*((unsigned char *)v18 + 24))
  {
    xpc_object_t v8 = xpc_dictionary_create(0, 0, 0);
    xpc_dictionary_set_string(v8, "Notification", a3);
    objc_msgSend(@"com.apple.notifyd.matching", "UTF8String", v9, v10, v11, v12, v13);
    xpc_set_event();
  }
  _Block_object_dispose(&v17, 8);
}

void __70__HDSPNotificationListener_registerForLaunchNotificationWithName_key___block_invoke(void *a1)
{
  id v3 = (id)[[NSString alloc] initWithUTF8String:a1[7]];
  v2 = objc_msgSend(*(id *)(a1[4] + 32), "objectForKeyedSubscript:");
  if (!v2)
  {
    v2 = [MEMORY[0x263EFF9C0] set];
    [*(id *)(a1[4] + 32) setObject:v2 forKeyedSubscript:v3];
  }
  [v2 addObject:a1[5]];
  *(unsigned char *)(*(void *)(a1[6] + 8) + 24) = [v2 count] == 1;
}

- (void)unregisterForLaunchNotificationWithName:(const char *)a3 key:(id)a4
{
  id v6 = a4;
  uint64_t v16 = 0;
  uint64_t v17 = &v16;
  uint64_t v18 = 0x2020000000;
  char v19 = 0;
  uint64_t v8 = MEMORY[0x263EF8330];
  uint64_t v9 = 3221225472;
  uint64_t v10 = __72__HDSPNotificationListener_unregisterForLaunchNotificationWithName_key___block_invoke;
  uint64_t v11 = &unk_2645DB358;
  v15 = a3;
  v12 = self;
  id v7 = v6;
  id v13 = v7;
  id v14 = &v16;
  [(HDSPNotificationListener *)self _withLock:&v8];
  if (*((unsigned char *)v17 + 24))
  {
    objc_msgSend(@"com.apple.notifyd.matching", "UTF8String", v8, v9, v10, v11, v12);
    xpc_set_event();
  }

  _Block_object_dispose(&v16, 8);
}

void __72__HDSPNotificationListener_unregisterForLaunchNotificationWithName_key___block_invoke(void *a1)
{
  id v3 = (id)[[NSString alloc] initWithUTF8String:a1[7]];
  v2 = [*(id *)(a1[4] + 32) objectForKeyedSubscript:v3];
  [v2 removeObject:a1[5]];
  *(unsigned char *)(*(void *)(a1[6] + 8) + 24) = [v2 count] == 0;
}

- (void)startListening
{
  uint64_t v7 = *MEMORY[0x263EF8340];
  id v3 = HKSPLogForCategory();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    int v5 = 138543362;
    id v6 = (id)objc_opt_class();
    id v4 = v6;
    _os_log_impl(&dword_221A52000, v3, OS_LOG_TYPE_DEFAULT, "[%{public}@] startListening", (uint8_t *)&v5, 0xCu);
  }
  [(HDSPNotificationListener *)self _registerForStream:@"com.apple.distnoted.matching"];
  [(HDSPNotificationListener *)self _registerForStream:@"com.apple.notifyd.matching"];
  [(HDSPNotificationListener *)self _registerForStream:@"com.apple.alarm"];
}

- (void)_registerForStream:(id)a3
{
  id v4 = (const char *)[a3 UTF8String];
  handler[0] = MEMORY[0x263EF8330];
  handler[1] = 3221225472;
  handler[2] = __47__HDSPNotificationListener__registerForStream___block_invoke;
  handler[3] = &unk_2645DB380;
  handler[4] = self;
  xpc_set_event_stream_handler(v4, MEMORY[0x263EF83A0], handler);
}

void __47__HDSPNotificationListener__registerForStream___block_invoke(uint64_t a1, xpc_object_t xdict)
{
  uint64_t v16 = *MEMORY[0x263EF8340];
  id v3 = objc_msgSend(NSString, "stringWithCString:encoding:", xpc_dictionary_get_string(xdict, (const char *)*MEMORY[0x263EF86C8]), 1);
  id v4 = HKSPLogForCategory();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543618;
    id v13 = (id)objc_opt_class();
    __int16 v14 = 2114;
    v15 = v3;
    id v5 = v13;
    _os_log_impl(&dword_221A52000, v4, OS_LOG_TYPE_DEFAULT, "[%{public}@] received notification %{public}@, taking assertion", buf, 0x16u);
  }
  id WeakRetained = objc_loadWeakRetained((id *)(*(void *)(a1 + 32) + 16));
  uint64_t v7 = [WeakRetained assertionManager];
  [v7 takeAssertionWithIdentifier:v3 type:2];

  uint64_t v8 = *(void **)(a1 + 32);
  v10[0] = MEMORY[0x263EF8330];
  v10[1] = 3221225472;
  v10[2] = __47__HDSPNotificationListener__registerForStream___block_invoke_291;
  v10[3] = &unk_2645D9288;
  v10[4] = v8;
  id v11 = v3;
  id v9 = v3;
  [v8 _handleNotificationWithName:v9 completion:v10];
}

void __47__HDSPNotificationListener__registerForStream___block_invoke_291(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(*(void *)(a1 + 32) + 16));
  v2 = [WeakRetained assertionManager];
  [v2 releaseAssertionWithIdentifier:*(void *)(a1 + 40)];
}

- (void)_handleNotificationWithName:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_environment);
  v11[0] = MEMORY[0x263EF8330];
  v11[1] = 3221225472;
  v11[2] = __67__HDSPNotificationListener__handleNotificationWithName_completion___block_invoke;
  v11[3] = &unk_2645DB3F8;
  v11[4] = self;
  id v12 = v6;
  id v13 = v7;
  id v9 = v7;
  id v10 = v6;
  [WeakRetained performWhenEnvironmentIsReady:v11];
}

void __67__HDSPNotificationListener__handleNotificationWithName_completion___block_invoke(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 32);
  id v3 = *(void **)(v2 + 24);
  v8[0] = MEMORY[0x263EF8330];
  v8[1] = 3221225472;
  v8[2] = __67__HDSPNotificationListener__handleNotificationWithName_completion___block_invoke_2;
  v8[3] = &unk_2645DB3A8;
  v8[4] = v2;
  id v9 = *(id *)(a1 + 40);
  id v4 = [v3 enumerateObserversWithFutureBlock:v8];
  v6[0] = MEMORY[0x263EF8330];
  v6[1] = 3221225472;
  v6[2] = __67__HDSPNotificationListener__handleNotificationWithName_completion___block_invoke_3;
  v6[3] = &unk_2645DB3D0;
  id v7 = *(id *)(a1 + 48);
  id v5 = (id)[v4 addCompletionBlock:v6];
}

uint64_t __67__HDSPNotificationListener__handleNotificationWithName_completion___block_invoke_2(uint64_t a1, void *a2)
{
  return [a2 notificationListener:*(void *)(a1 + 32) didReceiveNotificationWithName:*(void *)(a1 + 40)];
}

uint64_t __67__HDSPNotificationListener__handleNotificationWithName_completion___block_invoke_3(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (HDSPEnvironment)environment
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_environment);

  return (HDSPEnvironment *)WeakRetained;
}

- (HKSPObserverSet)observers
{
  return self->_observers;
}

- (NSMutableDictionary)launchNotificationRegistrations
{
  return self->_launchNotificationRegistrations;
}

- (os_unfair_lock_s)launchNotificationRegistrationLock
{
  return self->_launchNotificationRegistrationLock;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_launchNotificationRegistrations, 0);
  objc_storeStrong((id *)&self->_observers, 0);

  objc_destroyWeak((id *)&self->_environment);
}

@end