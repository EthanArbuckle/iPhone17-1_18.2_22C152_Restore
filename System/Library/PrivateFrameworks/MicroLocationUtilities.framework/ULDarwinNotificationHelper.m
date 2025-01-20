@interface ULDarwinNotificationHelper
- (NSMutableDictionary)registrations;
- (OS_dispatch_queue)queue;
- (ULDarwinNotificationHelper)init;
- (unint64_t)stateForNotificationName:(id)a3;
- (void)_handleDarwinNotificationCallback:(id)a3;
- (void)addObserverForNotificationName:(id)a3 handler:(id)a4;
- (void)dealloc;
- (void)removeObserverForNotificationName:(id)a3;
- (void)setQueue:(id)a3;
- (void)setRegistrations:(id)a3;
@end

@implementation ULDarwinNotificationHelper

- (ULDarwinNotificationHelper)init
{
  v7.receiver = self;
  v7.super_class = (Class)ULDarwinNotificationHelper;
  v2 = [(ULDarwinNotificationHelper *)&v7 init];
  if (v2)
  {
    v3 = [MEMORY[0x263EFF9A0] dictionary];
    [(ULDarwinNotificationHelper *)v2 setRegistrations:v3];

    v4 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    dispatch_queue_t v5 = dispatch_queue_create("com.apple.milod.ULDarwinNotificationHelper", v4);
    [(ULDarwinNotificationHelper *)v2 setQueue:v5];
  }
  return v2;
}

- (void)dealloc
{
  uint64_t v16 = *MEMORY[0x263EF8340];
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  v3 = [(ULDarwinNotificationHelper *)self registrations];
  v4 = [v3 allValues];

  uint64_t v5 = [v4 countByEnumeratingWithState:&v11 objects:v15 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v12;
    do
    {
      uint64_t v8 = 0;
      do
      {
        if (*(void *)v12 != v7) {
          objc_enumerationMutation(v4);
        }
        v9 = [*(id *)(*((void *)&v11 + 1) + 8 * v8) notificationName];
        [(ULDarwinNotificationHelper *)self removeObserverForNotificationName:v9];

        ++v8;
      }
      while (v6 != v8);
      uint64_t v6 = [v4 countByEnumeratingWithState:&v11 objects:v15 count:16];
    }
    while (v6);
  }

  v10.receiver = self;
  v10.super_class = (Class)ULDarwinNotificationHelper;
  [(ULDarwinNotificationHelper *)&v10 dealloc];
}

- (void)addObserverForNotificationName:(id)a3 handler:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  uint64_t v8 = [(ULDarwinNotificationHelper *)self queue];
  dispatch_assert_queue_not_V2(v8);

  v9 = [(ULDarwinNotificationHelper *)self queue];
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __69__ULDarwinNotificationHelper_addObserverForNotificationName_handler___block_invoke;
  block[3] = &unk_2653FDBA8;
  block[4] = self;
  id v13 = v6;
  id v14 = v7;
  id v10 = v7;
  id v11 = v6;
  dispatch_sync(v9, block);
}

void __69__ULDarwinNotificationHelper_addObserverForNotificationName_handler___block_invoke(uint64_t a1)
{
  uint64_t v37 = *MEMORY[0x263EF8340];
  v2 = [*(id *)(a1 + 32) registrations];
  v3 = [v2 objectForKeyedSubscript:*(void *)(a1 + 40)];

  if (v3)
  {
    if (onceToken_MicroLocation_Default != -1) {
      dispatch_once(&onceToken_MicroLocation_Default, &__block_literal_global_0);
    }
    v4 = logObject_MicroLocation_Default;
    if (os_log_type_enabled((os_log_t)logObject_MicroLocation_Default, OS_LOG_TYPE_FAULT))
    {
      uint64_t v5 = *(void **)(a1 + 40);
      *(_DWORD *)buf = 138412290;
      v32 = v5;
      _os_log_impl(&dword_256570000, v4, OS_LOG_TYPE_FAULT, "Registration already exists for notification name: %@, returning", buf, 0xCu);
    }
  }
  else
  {
    int out_token = -1;
    objc_initWeak(&location, *(id *)(a1 + 32));
    id v6 = (const char *)[*(id *)(a1 + 40) UTF8String];
    id v7 = [*(id *)(a1 + 32) queue];
    uint64_t v23 = MEMORY[0x263EF8330];
    uint64_t v24 = 3221225472;
    v25 = __69__ULDarwinNotificationHelper_addObserverForNotificationName_handler___block_invoke_30;
    v26 = &unk_2653FDB80;
    objc_copyWeak(&v28, &location);
    id v27 = *(id *)(a1 + 40);
    uint64_t v8 = notify_register_dispatch(v6, &out_token, v7, &v23);

    if (v8 || out_token == -1)
    {
      if (onceToken_MicroLocation_Default != -1) {
        dispatch_once(&onceToken_MicroLocation_Default, &__block_literal_global_0);
      }
      long long v12 = (id)logObject_MicroLocation_Default;
      if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
      {
        v20 = *(void **)(a1 + 40);
        v21 = objc_msgSend(NSNumber, "numberWithUnsignedInt:", v8, v23, v24, v25, v26);
        v22 = [NSNumber numberWithInt:out_token];
        *(_DWORD *)buf = 138412802;
        v32 = v20;
        __int16 v33 = 2112;
        v34 = v21;
        __int16 v35 = 2112;
        v36 = v22;
        _os_log_impl(&dword_256570000, v12, OS_LOG_TYPE_ERROR, "Failed to register for darwin notification: %@, status: %@, registration token: %@", buf, 0x20u);
      }
    }
    else
    {
      v9 = [ULDarwinNotificationRecord alloc];
      uint64_t v10 = *(void *)(a1 + 40);
      id v11 = objc_msgSend(NSNumber, "numberWithInt:", out_token, v23, v24, v25, v26);
      long long v12 = [(ULDarwinNotificationRecord *)v9 initWithNotificationName:v10 registrationToken:v11 handler:*(void *)(a1 + 48)];

      if (v12)
      {
        if (onceToken_MicroLocation_Default != -1) {
          dispatch_once(&onceToken_MicroLocation_Default, &__block_literal_global_0);
        }
        id v13 = (id)logObject_MicroLocation_Default;
        if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
        {
          id v14 = [v12 notificationName];
          v15 = [v12 registrationToken];
          uint64_t v16 = [v12 registrationToken];
          BOOL is_valid_token = notify_is_valid_token([v16 intValue]);
          v18 = @"NO";
          *(_DWORD *)buf = 138412802;
          v32 = v14;
          __int16 v33 = 2112;
          if (is_valid_token) {
            v18 = @"YES";
          }
          v34 = v15;
          __int16 v35 = 2112;
          v36 = v18;
          _os_log_impl(&dword_256570000, v13, OS_LOG_TYPE_DEFAULT, "Added registration for for notification name: %@, token: %@, valid: %@", buf, 0x20u);
        }
        v19 = [*(id *)(a1 + 32) registrations];
        [v19 setObject:v12 forKeyedSubscript:*(void *)(a1 + 40)];
      }
    }

    objc_destroyWeak(&v28);
    objc_destroyWeak(&location);
  }
}

void __69__ULDarwinNotificationHelper_addObserverForNotificationName_handler___block_invoke_30(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  if (WeakRetained)
  {
    id v3 = WeakRetained;
    [WeakRetained _handleDarwinNotificationCallback:*(void *)(a1 + 32)];
    id WeakRetained = v3;
  }
}

- (void)removeObserverForNotificationName:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [(ULDarwinNotificationHelper *)self queue];
  dispatch_assert_queue_not_V2(v5);

  id v6 = [(ULDarwinNotificationHelper *)self queue];
  v8[0] = MEMORY[0x263EF8330];
  v8[1] = 3221225472;
  v8[2] = __64__ULDarwinNotificationHelper_removeObserverForNotificationName___block_invoke;
  v8[3] = &unk_2653FDBD0;
  v8[4] = self;
  id v9 = v4;
  id v7 = v4;
  dispatch_sync(v6, v8);
}

void __64__ULDarwinNotificationHelper_removeObserverForNotificationName___block_invoke(uint64_t a1)
{
  uint64_t v21 = *MEMORY[0x263EF8340];
  v2 = [*(id *)(a1 + 32) registrations];
  id v3 = [v2 objectForKeyedSubscript:*(void *)(a1 + 40)];

  if (v3)
  {
    id v4 = [v3 registrationToken];
    int v5 = [v4 intValue];

    uint64_t v6 = notify_cancel(v5);
    if (v6)
    {
      uint64_t v7 = v6;
      if (onceToken_MicroLocation_Default != -1) {
        dispatch_once(&onceToken_MicroLocation_Default, &__block_literal_global_0);
      }
      uint64_t v8 = (void *)logObject_MicroLocation_Default;
      if (os_log_type_enabled((os_log_t)logObject_MicroLocation_Default, OS_LOG_TYPE_ERROR))
      {
        id v9 = v8;
        uint64_t v10 = [v3 notificationName];
        id v11 = [NSNumber numberWithUnsignedInt:v7];
        int v17 = 138412546;
        v18 = v10;
        __int16 v19 = 2112;
        v20 = v11;
        _os_log_impl(&dword_256570000, v9, OS_LOG_TYPE_ERROR, "Failed to cancel registration for darwin notification: %@, status: %@", (uint8_t *)&v17, 0x16u);
      }
    }
    else
    {
      if (onceToken_MicroLocation_Default != -1) {
        dispatch_once(&onceToken_MicroLocation_Default, &__block_literal_global_0);
      }
      id v14 = logObject_MicroLocation_Default;
      if (os_log_type_enabled((os_log_t)logObject_MicroLocation_Default, OS_LOG_TYPE_DEFAULT))
      {
        v15 = *(void **)(a1 + 40);
        int v17 = 138412290;
        v18 = v15;
        _os_log_impl(&dword_256570000, v14, OS_LOG_TYPE_DEFAULT, "removing registration for for notification name: %@", (uint8_t *)&v17, 0xCu);
      }
      uint64_t v16 = [*(id *)(a1 + 32) registrations];
      [v16 removeObjectForKey:*(void *)(a1 + 40)];
    }
  }
  else
  {
    if (onceToken_MicroLocation_Default != -1) {
      dispatch_once(&onceToken_MicroLocation_Default, &__block_literal_global_0);
    }
    long long v12 = logObject_MicroLocation_Default;
    if (os_log_type_enabled((os_log_t)logObject_MicroLocation_Default, OS_LOG_TYPE_ERROR))
    {
      id v13 = *(void **)(a1 + 40);
      int v17 = 138412290;
      v18 = v13;
      _os_log_impl(&dword_256570000, v12, OS_LOG_TYPE_ERROR, "Registration doesn't exist for notification: %@, returning", (uint8_t *)&v17, 0xCu);
    }
  }
}

- (unint64_t)stateForNotificationName:(id)a3
{
  id v4 = a3;
  int v5 = [(ULDarwinNotificationHelper *)self queue];
  dispatch_assert_queue_not_V2(v5);

  uint64_t v13 = 0;
  id v14 = &v13;
  uint64_t v15 = 0x2020000000;
  uint64_t v16 = 0;
  uint64_t v6 = [(ULDarwinNotificationHelper *)self queue];
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __55__ULDarwinNotificationHelper_stateForNotificationName___block_invoke;
  block[3] = &unk_2653FDBF8;
  block[4] = self;
  id v11 = v4;
  long long v12 = &v13;
  id v7 = v4;
  dispatch_sync(v6, block);

  unint64_t v8 = v14[3];
  _Block_object_dispose(&v13, 8);
  return v8;
}

void __55__ULDarwinNotificationHelper_stateForNotificationName___block_invoke(uint64_t a1)
{
  uint64_t v12 = *MEMORY[0x263EF8340];
  v2 = [*(id *)(a1 + 32) registrations];
  id v3 = [v2 objectForKeyedSubscript:*(void *)(a1 + 40)];

  if (v3)
  {
    id v4 = [*(id *)(a1 + 32) registrations];
    int v5 = [v4 objectForKeyedSubscript:*(void *)(a1 + 40)];
    uint64_t v6 = [v5 registrationToken];
    int v7 = [v6 intValue];

    if (notify_get_state(v7, (uint64_t *)(*(void *)(*(void *)(a1 + 48) + 8) + 24)))
    {
      if (onceToken_MicroLocation_Default != -1) {
        dispatch_once(&onceToken_MicroLocation_Default, &__block_literal_global_0);
      }
      unint64_t v8 = logObject_MicroLocation_Default;
      if (os_log_type_enabled((os_log_t)logObject_MicroLocation_Default, OS_LOG_TYPE_ERROR))
      {
        uint64_t v9 = *(void *)(a1 + 40);
        int v10 = 138412290;
        uint64_t v11 = v9;
        _os_log_impl(&dword_256570000, v8, OS_LOG_TYPE_ERROR, "Could not get state for: %@", (uint8_t *)&v10, 0xCu);
      }
    }
  }
}

- (void)_handleDarwinNotificationCallback:(id)a3
{
  uint64_t v14 = *MEMORY[0x263EF8340];
  id v4 = a3;
  int v5 = [(ULDarwinNotificationHelper *)self queue];
  dispatch_assert_queue_V2(v5);

  if (onceToken_MicroLocation_Default != -1) {
    dispatch_once(&onceToken_MicroLocation_Default, &__block_literal_global_0);
  }
  uint64_t v6 = logObject_MicroLocation_Default;
  if (os_log_type_enabled((os_log_t)logObject_MicroLocation_Default, OS_LOG_TYPE_DEBUG))
  {
    int v12 = 138412290;
    id v13 = v4;
    _os_log_impl(&dword_256570000, v6, OS_LOG_TYPE_DEBUG, "Darwin notification received: %@", (uint8_t *)&v12, 0xCu);
  }
  int v7 = [(ULDarwinNotificationHelper *)self registrations];
  unint64_t v8 = [v7 objectForKeyedSubscript:v4];

  if (v8)
  {
    uint64_t v9 = [v8 handler];
    int v10 = (void *)v9;
    if (v9) {
      (*(void (**)(uint64_t))(v9 + 16))(v9);
    }
  }
  else
  {
    if (onceToken_MicroLocation_Default != -1) {
      dispatch_once(&onceToken_MicroLocation_Default, &__block_literal_global_0);
    }
    uint64_t v11 = logObject_MicroLocation_Default;
    if (os_log_type_enabled((os_log_t)logObject_MicroLocation_Default, OS_LOG_TYPE_ERROR))
    {
      LOWORD(v12) = 0;
      _os_log_impl(&dword_256570000, v11, OS_LOG_TYPE_ERROR, "Failed call darwin notification handler, record nil", (uint8_t *)&v12, 2u);
    }
  }
}

- (NSMutableDictionary)registrations
{
  return self->_registrations;
}

- (void)setRegistrations:(id)a3
{
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
  objc_storeStrong((id *)&self->_queue, 0);

  objc_storeStrong((id *)&self->_registrations, 0);
}

@end