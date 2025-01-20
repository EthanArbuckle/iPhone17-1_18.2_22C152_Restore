@interface TVRMSSessionManager
- (TVRMSSessionManager)init;
- (TVRMSSessionManagerDelegate)delegate;
- (id)persistedSessionIdentifiers;
- (id)sessionWithIdentifier:(int)a3;
- (int)_uniqueSessionIdentifier;
- (int)identifierForSession:(id)a3;
- (void)_scheduleSessionExpirationWithIdentifier:(int)a3 timeout:(int)a4;
- (void)_updatePersistedSessionIdentifiers;
- (void)beginSession:(id)a3 timeout:(int)a4 shouldTakePowerAssertion:(BOOL)a5 completionHandler:(id)a6;
- (void)endSessionWithIdentifier:(int)a3 completionHandler:(id)a4;
- (void)refreshSessionWithIdentifier:(int)a3;
- (void)setDelegate:(id)a3;
@end

@implementation TVRMSSessionManager

- (TVRMSSessionManager)init
{
  v8.receiver = self;
  v8.super_class = (Class)TVRMSSessionManager;
  v2 = [(TVRMSSessionManager *)&v8 init];
  if (v2)
  {
    uint64_t v3 = objc_opt_new();
    sessions = v2->_sessions;
    v2->_sessions = (NSMutableDictionary *)v3;

    dispatch_queue_t v5 = dispatch_queue_create("com.apple.rms.sessionqueue", 0);
    sessionManagerQueue = v2->_sessionManagerQueue;
    v2->_sessionManagerQueue = (OS_dispatch_queue *)v5;
  }
  return v2;
}

- (id)sessionWithIdentifier:(int)a3
{
  sessions = self->_sessions;
  v4 = [NSNumber numberWithInt:*(void *)&a3];
  dispatch_queue_t v5 = [(NSMutableDictionary *)sessions objectForKeyedSubscript:v4];
  v6 = [v5 session];

  return v6;
}

- (int)identifierForSession:(id)a3
{
  id v4 = a3;
  uint64_t v11 = 0;
  v12 = &v11;
  uint64_t v13 = 0x2020000000;
  int v14 = 0;
  sessions = self->_sessions;
  v8[0] = MEMORY[0x263EF8330];
  v8[1] = 3221225472;
  v8[2] = __44__TVRMSSessionManager_identifierForSession___block_invoke;
  v8[3] = &unk_2647AF2D8;
  id v6 = v4;
  id v9 = v6;
  v10 = &v11;
  [(NSMutableDictionary *)sessions enumerateKeysAndObjectsUsingBlock:v8];
  LODWORD(sessions) = *((_DWORD *)v12 + 6);

  _Block_object_dispose(&v11, 8);
  return (int)sessions;
}

void __44__TVRMSSessionManager_identifierForSession___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v7 = a2;
  dispatch_queue_t v5 = [a3 session];
  id v6 = *(void **)(a1 + 32);

  if (v5 == v6) {
    *(_DWORD *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = [v7 intValue];
  }
}

- (void)beginSession:(id)a3 timeout:(int)a4 shouldTakePowerAssertion:(BOOL)a5 completionHandler:(id)a6
{
  id v10 = a3;
  id v11 = a6;
  sessionManagerQueue = self->_sessionManagerQueue;
  v15[0] = MEMORY[0x263EF8330];
  v15[1] = 3221225472;
  v15[2] = __87__TVRMSSessionManager_beginSession_timeout_shouldTakePowerAssertion_completionHandler___block_invoke;
  v15[3] = &unk_2647AF300;
  int v18 = a4;
  v15[4] = self;
  id v16 = v10;
  BOOL v19 = a5;
  id v17 = v11;
  id v13 = v11;
  id v14 = v10;
  dispatch_async(sessionManagerQueue, v15);
}

void __87__TVRMSSessionManager_beginSession_timeout_shouldTakePowerAssertion_completionHandler___block_invoke(uint64_t a1)
{
  uint64_t v2 = [*(id *)(a1 + 32) _uniqueSessionIdentifier];
  id v10 = (id)objc_opt_new();
  [v10 setRefreshCount:0];
  [v10 setTimeout:*(unsigned int *)(a1 + 56)];
  [v10 setSession:*(void *)(a1 + 40)];
  uint64_t v3 = objc_opt_new();
  [v10 setRunAssertion:v3];

  if (*(unsigned char *)(a1 + 60))
  {
    id v4 = [TVRMSPowerAssertion alloc];
    dispatch_queue_t v5 = (objc_class *)objc_opt_class();
    id v6 = NSStringFromClass(v5);
    id v7 = [(TVRMSPowerAssertion *)v4 initWithName:v6];

    [v10 setPowerAssertion:v7];
  }
  objc_super v8 = *(void **)(*(void *)(a1 + 32) + 8);
  id v9 = [NSNumber numberWithInt:v2];
  [v8 setObject:v10 forKeyedSubscript:v9];

  [*(id *)(a1 + 32) _updatePersistedSessionIdentifiers];
  [*(id *)(a1 + 32) _scheduleSessionExpirationWithIdentifier:v2 timeout:*(unsigned int *)(a1 + 56)];
  (*(void (**)(void))(*(void *)(a1 + 48) + 16))();
}

- (void)endSessionWithIdentifier:(int)a3 completionHandler:(id)a4
{
  id v6 = a4;
  sessionManagerQueue = self->_sessionManagerQueue;
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __66__TVRMSSessionManager_endSessionWithIdentifier_completionHandler___block_invoke;
  block[3] = &unk_2647AF328;
  int v11 = a3;
  block[4] = self;
  id v10 = v6;
  id v8 = v6;
  dispatch_async(sessionManagerQueue, block);
}

void __66__TVRMSSessionManager_endSessionWithIdentifier_completionHandler___block_invoke(uint64_t a1)
{
  uint64_t v14 = *MEMORY[0x263EF8340];
  uint64_t v2 = *(void **)(*(void *)(a1 + 32) + 8);
  uint64_t v3 = [NSNumber numberWithInt:*(unsigned int *)(a1 + 48)];
  id v4 = [v2 objectForKeyedSubscript:v3];

  if (v4)
  {
    dispatch_queue_t v5 = _TVRCRMSLog();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      id v6 = [v4 session];
      int v12 = 138412290;
      id v13 = (id)objc_opt_class();
      id v7 = v13;
      _os_log_impl(&dword_2266D3000, v5, OS_LOG_TYPE_DEFAULT, "Ending session: %@", (uint8_t *)&v12, 0xCu);
    }
    id v8 = *(void **)(*(void *)(a1 + 32) + 8);
    id v9 = [NSNumber numberWithInt:*(unsigned int *)(a1 + 48)];
    [v8 removeObjectForKey:v9];

    [*(id *)(a1 + 32) _updatePersistedSessionIdentifiers];
  }
  uint64_t v10 = *(void *)(a1 + 40);
  if (v10)
  {
    int v11 = [v4 session];
    (*(void (**)(uint64_t, void *))(v10 + 16))(v10, v11);
  }
}

- (void)refreshSessionWithIdentifier:(int)a3
{
  sessionManagerQueue = self->_sessionManagerQueue;
  v4[0] = MEMORY[0x263EF8330];
  v4[1] = 3221225472;
  v4[2] = __52__TVRMSSessionManager_refreshSessionWithIdentifier___block_invoke;
  v4[3] = &unk_2647AF350;
  v4[4] = self;
  int v5 = a3;
  dispatch_async(sessionManagerQueue, v4);
}

void __52__TVRMSSessionManager_refreshSessionWithIdentifier___block_invoke(uint64_t a1)
{
  uint64_t v12 = *MEMORY[0x263EF8340];
  uint64_t v2 = *(void **)(*(void *)(a1 + 32) + 8);
  uint64_t v3 = [NSNumber numberWithInt:*(unsigned int *)(a1 + 40)];
  id v4 = [v2 objectForKeyedSubscript:v3];

  int v5 = _TVRCRMSLog();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    id v6 = [v4 session];
    id v7 = (objc_class *)objc_opt_class();
    id v8 = NSStringFromClass(v7);
    int v10 = 138412290;
    int v11 = v8;
    _os_log_impl(&dword_2266D3000, v5, OS_LOG_TYPE_DEFAULT, "Refreshing session: %@", (uint8_t *)&v10, 0xCu);
  }
  objc_msgSend(v4, "setRefreshCount:", objc_msgSend(v4, "refreshCount") + 1);
  id v9 = [v4 powerAssertion];
  [v9 refresh];
  objc_msgSend(*(id *)(a1 + 32), "_scheduleSessionExpirationWithIdentifier:timeout:", *(unsigned int *)(a1 + 40), objc_msgSend(v4, "timeout"));
}

- (id)persistedSessionIdentifiers
{
  CFPreferencesAppSynchronize(@"com.apple.TVRemoteMediaServices");
  uint64_t v2 = (void *)CFPreferencesCopyAppValue(@"SessionIdentifiers", @"com.apple.TVRemoteMediaServices");

  return v2;
}

- (void)_scheduleSessionExpirationWithIdentifier:(int)a3 timeout:(int)a4
{
  objc_initWeak(&location, self);
  dispatch_time_t v7 = dispatch_time(0, 1000000000 * a4);
  sessionManagerQueue = self->_sessionManagerQueue;
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __72__TVRMSSessionManager__scheduleSessionExpirationWithIdentifier_timeout___block_invoke;
  block[3] = &unk_2647AF378;
  objc_copyWeak(&v10, &location);
  int v11 = a3;
  dispatch_after(v7, sessionManagerQueue, block);
  objc_destroyWeak(&v10);
  objc_destroyWeak(&location);
}

void __72__TVRMSSessionManager__scheduleSessionExpirationWithIdentifier_timeout___block_invoke(uint64_t a1)
{
  uint64_t v16 = *MEMORY[0x263EF8340];
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  id v3 = WeakRetained;
  if (WeakRetained)
  {
    id v4 = (void *)WeakRetained[1];
    int v5 = [NSNumber numberWithInt:*(unsigned int *)(a1 + 40)];
    id v6 = [v4 objectForKeyedSubscript:v5];

    if (v6)
    {
      if ([v6 refreshCount])
      {
        objc_msgSend(v6, "setRefreshCount:", objc_msgSend(v6, "refreshCount") - 1);
      }
      else
      {
        dispatch_time_t v7 = _TVRCRMSLog();
        if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
        {
          id v8 = [v6 session];
          id v9 = (objc_class *)objc_opt_class();
          id v10 = NSStringFromClass(v9);
          int v14 = 138412290;
          v15 = v10;
          _os_log_impl(&dword_2266D3000, v7, OS_LOG_TYPE_DEFAULT, "Session expired: %@", (uint8_t *)&v14, 0xCu);
        }
        int v11 = (void *)*((void *)v3 + 1);
        uint64_t v12 = [NSNumber numberWithInt:*(unsigned int *)(a1 + 40)];
        [v11 removeObjectForKey:v12];

        id v13 = objc_loadWeakRetained((id *)v3 + 3);
        [v13 sessionManager:v3 sessionDidTimeout:*(unsigned int *)(a1 + 40)];

        [v3 _updatePersistedSessionIdentifiers];
      }
    }
  }
}

- (int)_uniqueSessionIdentifier
{
  do
  {
    do
      uint64_t v3 = arc4random();
    while (!v3);
    int v4 = v3;
    sessions = self->_sessions;
    id v6 = [NSNumber numberWithInt:v3];
    dispatch_time_t v7 = [(NSMutableDictionary *)sessions objectForKey:v6];
  }
  while (v7);
  return v4;
}

- (void)_updatePersistedSessionIdentifiers
{
  id v2 = [(NSMutableDictionary *)self->_sessions allKeys];
  CFPreferencesSetAppValue(@"SessionIdentifiers", v2, @"com.apple.TVRemoteMediaServices");
  CFPreferencesAppSynchronize(@"com.apple.TVRemoteMediaServices");
}

- (TVRMSSessionManagerDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  return (TVRMSSessionManagerDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_sessionManagerQueue, 0);

  objc_storeStrong((id *)&self->_sessions, 0);
}

@end