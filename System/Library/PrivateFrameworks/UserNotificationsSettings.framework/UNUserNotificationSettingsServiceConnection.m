@interface UNUserNotificationSettingsServiceConnection
+ (id)sharedInstance;
- (NSXPCConnection)connection;
- (OS_dispatch_queue)callOutQueue;
- (OS_dispatch_queue)queue;
- (UNUserNotificationSettingsServiceConnection)init;
- (id)_queue_ensureConnection;
- (id)notificationSourceWithIdentifier:(id)a3;
- (id)notificationSourcesWithFilter:(id)a3;
- (id)notificationSourcesWithIdentifiers:(id)a3;
- (id)notificationSystemSettings;
- (void)_invalidate;
- (void)_queue_addObserver:(id)a3;
- (void)_queue_interruptedConnection;
- (void)_queue_invalidatedConnection;
- (void)_queue_removeObserver:(id)a3;
- (void)addObserver:(id)a3;
- (void)authorizationWithOptions:(unint64_t)a3 forNotificationSourceIdentifier:(id)a4 withCompletionHandler:(id)a5;
- (void)removeObserver:(id)a3;
- (void)replaceNotificationSettings:(id)a3 forNotificationSourceIdentifier:(id)a4;
- (void)replaceNotificationTopicSettings:(id)a3 forNotificationSourceIdentifier:(id)a4 topicIdentifier:(id)a5;
- (void)resetScheduledDeliverySetting;
- (void)setCallOutQueue:(id)a3;
- (void)setConnection:(id)a3;
- (void)setNotificationSystemSettings:(id)a3;
- (void)setQueue:(id)a3;
- (void)updateNotificationSourcesWithBundleIdentifiers:(id)a3;
- (void)updateNotificationSystemSettings:(id)a3;
@end

@implementation UNUserNotificationSettingsServiceConnection

- (void)updateNotificationSourcesWithBundleIdentifiers:(id)a3
{
  uint64_t v15 = *MEMORY[0x263EF8340];
  id v4 = a3;
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  v5 = self->_observers;
  uint64_t v6 = [(NSMutableArray *)v5 countByEnumeratingWithState:&v10 objects:v14 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v11;
    do
    {
      uint64_t v9 = 0;
      do
      {
        if (*(void *)v11 != v8) {
          objc_enumerationMutation(v5);
        }
        objc_msgSend(*(id *)(*((void *)&v10 + 1) + 8 * v9++), "settingsServiceConnection:didUpdateNotificationSourcesWithIdentifiers:", self, v4, (void)v10);
      }
      while (v7 != v9);
      uint64_t v7 = [(NSMutableArray *)v5 countByEnumeratingWithState:&v10 objects:v14 count:16];
    }
    while (v7);
  }
}

+ (id)sharedInstance
{
  if (sharedInstance_onceToken != -1) {
    dispatch_once(&sharedInstance_onceToken, &__block_literal_global_1);
  }
  v2 = (void *)sharedInstance___sharedInstance;
  return v2;
}

uint64_t __61__UNUserNotificationSettingsServiceConnection_sharedInstance__block_invoke()
{
  sharedInstance___sharedInstance = objc_alloc_init(UNUserNotificationSettingsServiceConnection);
  return MEMORY[0x270F9A758]();
}

- (UNUserNotificationSettingsServiceConnection)init
{
  v12.receiver = self;
  v12.super_class = (Class)UNUserNotificationSettingsServiceConnection;
  v2 = [(UNUserNotificationSettingsServiceConnection *)&v12 init];
  if (v2)
  {
    v3 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    dispatch_queue_t v4 = dispatch_queue_create("com.apple.usernotifications.UNUserNotificationSettingsServiceConnection", v3);
    queue = v2->_queue;
    v2->_queue = (OS_dispatch_queue *)v4;

    uint64_t v6 = (NSMutableArray *)objc_alloc_init(MEMORY[0x263EFF980]);
    observers = v2->_observers;
    v2->_observers = v6;

    uint64_t v8 = v2->_queue;
    block[0] = MEMORY[0x263EF8330];
    block[1] = 3221225472;
    block[2] = __51__UNUserNotificationSettingsServiceConnection_init__block_invoke;
    block[3] = &unk_2642529A8;
    long long v11 = v2;
    dispatch_async(v8, block);
  }
  return v2;
}

id __51__UNUserNotificationSettingsServiceConnection_init__block_invoke(uint64_t a1)
{
  return (id)objc_msgSend(*(id *)(a1 + 32), "_queue_ensureConnection");
}

- (void)addObserver:(id)a3
{
  id v4 = a3;
  queue = self->_queue;
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __59__UNUserNotificationSettingsServiceConnection_addObserver___block_invoke;
  v7[3] = &unk_264252958;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_sync(queue, v7);
}

uint64_t __59__UNUserNotificationSettingsServiceConnection_addObserver___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_queue_addObserver:", *(void *)(a1 + 40));
}

- (void)removeObserver:(id)a3
{
  id v4 = a3;
  queue = self->_queue;
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __62__UNUserNotificationSettingsServiceConnection_removeObserver___block_invoke;
  v7[3] = &unk_264252958;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_sync(queue, v7);
}

uint64_t __62__UNUserNotificationSettingsServiceConnection_removeObserver___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_queue_removeObserver:", *(void *)(a1 + 40));
}

- (id)notificationSourceWithIdentifier:(id)a3
{
  uint64_t v21 = *MEMORY[0x263EF8340];
  id v4 = a3;
  uint64_t v13 = 0;
  v14 = &v13;
  uint64_t v15 = 0x3032000000;
  v16 = __Block_byref_object_copy_;
  v17 = __Block_byref_object_dispose_;
  id v18 = 0;
  v5 = *MEMORY[0x263F1E010];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x263F1E010], OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543362;
    id v20 = v4;
    _os_log_impl(&dword_215600000, v5, OS_LOG_TYPE_DEFAULT, "Getting notification source %{public}@ (sync)", buf, 0xCu);
  }
  queue = self->_queue;
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __80__UNUserNotificationSettingsServiceConnection_notificationSourceWithIdentifier___block_invoke;
  block[3] = &unk_264252A20;
  void block[4] = self;
  id v11 = v4;
  objc_super v12 = &v13;
  id v7 = v4;
  dispatch_sync(queue, block);
  id v8 = (id)v14[5];

  _Block_object_dispose(&v13, 8);
  return v8;
}

void __80__UNUserNotificationSettingsServiceConnection_notificationSourceWithIdentifier___block_invoke(uint64_t a1)
{
  v2 = objc_msgSend(*(id *)(a1 + 32), "_queue_ensureConnection");
  v6[0] = MEMORY[0x263EF8330];
  v6[1] = 3221225472;
  v6[2] = __80__UNUserNotificationSettingsServiceConnection_notificationSourceWithIdentifier___block_invoke_2;
  v6[3] = &unk_2642529D0;
  id v7 = *(id *)(a1 + 40);
  v3 = [v2 synchronousRemoteObjectProxyWithErrorHandler:v6];
  v5[0] = MEMORY[0x263EF8330];
  v5[1] = 3221225472;
  v5[2] = __80__UNUserNotificationSettingsServiceConnection_notificationSourceWithIdentifier___block_invoke_4;
  v5[3] = &unk_2642529F8;
  uint64_t v4 = *(void *)(a1 + 40);
  v5[4] = *(void *)(a1 + 48);
  [v3 getNotificationSource:v4 withCompletionHandler:v5];
}

void __80__UNUserNotificationSettingsServiceConnection_notificationSourceWithIdentifier___block_invoke_2(uint64_t a1, void *a2)
{
  id v2 = a2;
  if (os_log_type_enabled((os_log_t)*MEMORY[0x263F1E010], OS_LOG_TYPE_ERROR)) {
    __80__UNUserNotificationSettingsServiceConnection_notificationSourceWithIdentifier___block_invoke_2_cold_1();
  }
}

void __80__UNUserNotificationSettingsServiceConnection_notificationSourceWithIdentifier___block_invoke_4(uint64_t a1, void *a2)
{
  uint64_t v9 = *MEMORY[0x263EF8340];
  id v4 = a2;
  objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 32) + 8) + 40), a2);
  v5 = *MEMORY[0x263F1E010];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x263F1E010], OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v6 = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 40);
    int v7 = 138543362;
    uint64_t v8 = v6;
    _os_log_impl(&dword_215600000, v5, OS_LOG_TYPE_DEFAULT, "Got notification source %{public}@", (uint8_t *)&v7, 0xCu);
  }
}

- (id)notificationSourcesWithIdentifiers:(id)a3
{
  uint64_t v21 = *MEMORY[0x263EF8340];
  id v4 = a3;
  uint64_t v13 = 0;
  v14 = &v13;
  uint64_t v15 = 0x3032000000;
  v16 = __Block_byref_object_copy_;
  v17 = __Block_byref_object_dispose_;
  id v18 = 0;
  v5 = *MEMORY[0x263F1E010];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x263F1E010], OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543362;
    id v20 = v4;
    _os_log_impl(&dword_215600000, v5, OS_LOG_TYPE_DEFAULT, "Getting notification sources %{public}@ (sync)", buf, 0xCu);
  }
  queue = self->_queue;
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __82__UNUserNotificationSettingsServiceConnection_notificationSourcesWithIdentifiers___block_invoke;
  block[3] = &unk_264252A20;
  void block[4] = self;
  id v11 = v4;
  objc_super v12 = &v13;
  id v7 = v4;
  dispatch_sync(queue, block);
  id v8 = (id)v14[5];

  _Block_object_dispose(&v13, 8);
  return v8;
}

void __82__UNUserNotificationSettingsServiceConnection_notificationSourcesWithIdentifiers___block_invoke(uint64_t a1)
{
  id v2 = objc_msgSend(*(id *)(a1 + 32), "_queue_ensureConnection");
  v6[0] = MEMORY[0x263EF8330];
  v6[1] = 3221225472;
  v6[2] = __82__UNUserNotificationSettingsServiceConnection_notificationSourcesWithIdentifiers___block_invoke_2;
  v6[3] = &unk_2642529D0;
  id v7 = *(id *)(a1 + 40);
  v3 = [v2 synchronousRemoteObjectProxyWithErrorHandler:v6];
  v5[0] = MEMORY[0x263EF8330];
  v5[1] = 3221225472;
  v5[2] = __82__UNUserNotificationSettingsServiceConnection_notificationSourcesWithIdentifiers___block_invoke_6;
  v5[3] = &unk_264252A48;
  uint64_t v4 = *(void *)(a1 + 40);
  v5[4] = *(void *)(a1 + 48);
  [v3 getNotificationSources:v4 withCompletionHandler:v5];
}

void __82__UNUserNotificationSettingsServiceConnection_notificationSourcesWithIdentifiers___block_invoke_2(uint64_t a1, void *a2)
{
  id v2 = a2;
  if (os_log_type_enabled((os_log_t)*MEMORY[0x263F1E010], OS_LOG_TYPE_ERROR)) {
    __82__UNUserNotificationSettingsServiceConnection_notificationSourcesWithIdentifiers___block_invoke_2_cold_1();
  }
}

void __82__UNUserNotificationSettingsServiceConnection_notificationSourcesWithIdentifiers___block_invoke_6(uint64_t a1, void *a2)
{
  uint64_t v9 = *MEMORY[0x263EF8340];
  id v4 = a2;
  objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 32) + 8) + 40), a2);
  v5 = *MEMORY[0x263F1E010];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x263F1E010], OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v6 = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 40);
    int v7 = 138543362;
    uint64_t v8 = v6;
    _os_log_impl(&dword_215600000, v5, OS_LOG_TYPE_DEFAULT, "Got notification sources %{public}@", (uint8_t *)&v7, 0xCu);
  }
}

- (id)notificationSourcesWithFilter:(id)a3
{
  id v4 = a3;
  uint64_t v14 = 0;
  uint64_t v15 = &v14;
  uint64_t v16 = 0x3032000000;
  v17 = __Block_byref_object_copy_;
  id v18 = __Block_byref_object_dispose_;
  id v19 = 0;
  v5 = *MEMORY[0x263F1E010];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x263F1E010], OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_215600000, v5, OS_LOG_TYPE_DEFAULT, "Getting all notification sources (sync)", buf, 2u);
  }
  queue = self->_queue;
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __77__UNUserNotificationSettingsServiceConnection_notificationSourcesWithFilter___block_invoke;
  block[3] = &unk_264252A20;
  void block[4] = self;
  id v11 = v4;
  objc_super v12 = &v14;
  id v7 = v4;
  dispatch_sync(queue, block);
  id v8 = (id)v15[5];

  _Block_object_dispose(&v14, 8);
  return v8;
}

void __77__UNUserNotificationSettingsServiceConnection_notificationSourcesWithFilter___block_invoke(uint64_t a1)
{
  id v2 = objc_msgSend(*(id *)(a1 + 32), "_queue_ensureConnection");
  v3 = [v2 synchronousRemoteObjectProxyWithErrorHandler:&__block_literal_global_9];
  v5[0] = MEMORY[0x263EF8330];
  v5[1] = 3221225472;
  v5[2] = __77__UNUserNotificationSettingsServiceConnection_notificationSourcesWithFilter___block_invoke_10;
  v5[3] = &unk_264252A48;
  uint64_t v4 = *(void *)(a1 + 40);
  v5[4] = *(void *)(a1 + 48);
  [v3 getNotificationSourcesWithFilter:v4 completionHandler:v5];
}

void __77__UNUserNotificationSettingsServiceConnection_notificationSourcesWithFilter___block_invoke_2(uint64_t a1, void *a2)
{
  id v2 = a2;
  if (os_log_type_enabled((os_log_t)*MEMORY[0x263F1E010], OS_LOG_TYPE_ERROR)) {
    __77__UNUserNotificationSettingsServiceConnection_notificationSourcesWithFilter___block_invoke_2_cold_1();
  }
}

void __77__UNUserNotificationSettingsServiceConnection_notificationSourcesWithFilter___block_invoke_10(uint64_t a1, void *a2)
{
  uint64_t v9 = *MEMORY[0x263EF8340];
  id v4 = a2;
  objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 32) + 8) + 40), a2);
  v5 = *MEMORY[0x263F1E010];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x263F1E010], OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v6 = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 40);
    int v7 = 138543362;
    uint64_t v8 = v6;
    _os_log_impl(&dword_215600000, v5, OS_LOG_TYPE_DEFAULT, "Got all notification sources %{public}@", (uint8_t *)&v7, 0xCu);
  }
}

- (void)authorizationWithOptions:(unint64_t)a3 forNotificationSourceIdentifier:(id)a4 withCompletionHandler:(id)a5
{
  uint64_t v22 = *MEMORY[0x263EF8340];
  id v8 = a4;
  id v9 = a5;
  long long v10 = *MEMORY[0x263F1E010];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x263F1E010], OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 134218242;
    unint64_t v19 = a3;
    __int16 v20 = 2114;
    id v21 = v8;
    _os_log_impl(&dword_215600000, v10, OS_LOG_TYPE_DEFAULT, "Authorize notification settings %ld for source %{public}@ (sync)", buf, 0x16u);
  }
  queue = self->_queue;
  v14[0] = MEMORY[0x263EF8330];
  v14[1] = 3221225472;
  v14[2] = __126__UNUserNotificationSettingsServiceConnection_authorizationWithOptions_forNotificationSourceIdentifier_withCompletionHandler___block_invoke;
  v14[3] = &unk_264252AB8;
  v14[4] = self;
  id v15 = v8;
  id v16 = v9;
  unint64_t v17 = a3;
  id v12 = v9;
  id v13 = v8;
  dispatch_sync(queue, v14);
}

void __126__UNUserNotificationSettingsServiceConnection_authorizationWithOptions_forNotificationSourceIdentifier_withCompletionHandler___block_invoke(uint64_t a1)
{
  id v2 = objc_msgSend(*(id *)(a1 + 32), "_queue_ensureConnection");
  v3 = [v2 synchronousRemoteObjectProxyWithErrorHandler:&__block_literal_global_12];
  uint64_t v4 = *(void *)(a1 + 56);
  v5 = *(void **)(a1 + 40);
  v6[0] = MEMORY[0x263EF8330];
  v6[1] = 3221225472;
  v6[2] = __126__UNUserNotificationSettingsServiceConnection_authorizationWithOptions_forNotificationSourceIdentifier_withCompletionHandler___block_invoke_13;
  v6[3] = &unk_264252A90;
  id v7 = v5;
  id v8 = *(id *)(a1 + 48);
  [v3 authorizationWithOptions:v4 forNotificationSourceIdentifier:v7 withCompletionHandler:v6];
}

void __126__UNUserNotificationSettingsServiceConnection_authorizationWithOptions_forNotificationSourceIdentifier_withCompletionHandler___block_invoke_2(uint64_t a1, void *a2)
{
  id v2 = a2;
  if (os_log_type_enabled((os_log_t)*MEMORY[0x263F1E010], OS_LOG_TYPE_ERROR)) {
    __126__UNUserNotificationSettingsServiceConnection_authorizationWithOptions_forNotificationSourceIdentifier_withCompletionHandler___block_invoke_2_cold_1();
  }
}

void __126__UNUserNotificationSettingsServiceConnection_authorizationWithOptions_forNotificationSourceIdentifier_withCompletionHandler___block_invoke_13(uint64_t a1, uint64_t a2, void *a3)
{
  uint64_t v13 = *MEMORY[0x263EF8340];
  id v5 = a3;
  uint64_t v6 = *MEMORY[0x263F1E010];
  if (v5)
  {
    if (os_log_type_enabled((os_log_t)*MEMORY[0x263F1E010], OS_LOG_TYPE_ERROR)) {
      __126__UNUserNotificationSettingsServiceConnection_authorizationWithOptions_forNotificationSourceIdentifier_withCompletionHandler___block_invoke_2_cold_1();
    }
  }
  else if (os_log_type_enabled((os_log_t)*MEMORY[0x263F1E010], OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v7 = *(void *)(a1 + 32);
    int v9 = 138543618;
    uint64_t v10 = v7;
    __int16 v11 = 1024;
    int v12 = a2;
    _os_log_impl(&dword_215600000, v6, OS_LOG_TYPE_DEFAULT, "Authorize notification settings for %{public}@ completed with status granted: %d", (uint8_t *)&v9, 0x12u);
  }
  uint64_t v8 = *(void *)(a1 + 40);
  if (v8) {
    (*(void (**)(uint64_t, uint64_t, id))(v8 + 16))(v8, a2, v5);
  }
}

- (void)replaceNotificationSettings:(id)a3 forNotificationSourceIdentifier:(id)a4
{
  uint64_t v19 = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v7 = a4;
  uint64_t v8 = *MEMORY[0x263F1E010];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x263F1E010], OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543618;
    id v16 = v6;
    __int16 v17 = 2114;
    id v18 = v7;
    _os_log_impl(&dword_215600000, v8, OS_LOG_TYPE_DEFAULT, "Replace notification settings %{public}@ for source %{public}@ (sync)", buf, 0x16u);
  }
  queue = self->_queue;
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __107__UNUserNotificationSettingsServiceConnection_replaceNotificationSettings_forNotificationSourceIdentifier___block_invoke;
  block[3] = &unk_264252AE0;
  void block[4] = self;
  id v13 = v6;
  id v14 = v7;
  id v10 = v7;
  id v11 = v6;
  dispatch_sync(queue, block);
}

void __107__UNUserNotificationSettingsServiceConnection_replaceNotificationSettings_forNotificationSourceIdentifier___block_invoke(uint64_t a1)
{
  objc_msgSend(*(id *)(a1 + 32), "_queue_ensureConnection");
  id v3 = (id)objc_claimAutoreleasedReturnValue();
  id v2 = [v3 synchronousRemoteObjectProxyWithErrorHandler:&__block_literal_global_16];
  [v2 replaceNotificationSettings:*(void *)(a1 + 40) forNotificationSourceIdentifier:*(void *)(a1 + 48)];
}

void __107__UNUserNotificationSettingsServiceConnection_replaceNotificationSettings_forNotificationSourceIdentifier___block_invoke_2(uint64_t a1, void *a2)
{
  id v2 = a2;
  if (os_log_type_enabled((os_log_t)*MEMORY[0x263F1E010], OS_LOG_TYPE_ERROR)) {
    __107__UNUserNotificationSettingsServiceConnection_replaceNotificationSettings_forNotificationSourceIdentifier___block_invoke_2_cold_1();
  }
}

- (void)replaceNotificationTopicSettings:(id)a3 forNotificationSourceIdentifier:(id)a4 topicIdentifier:(id)a5
{
  uint64_t v26 = *MEMORY[0x263EF8340];
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  id v11 = *MEMORY[0x263F1E010];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x263F1E010], OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543874;
    id v21 = v8;
    __int16 v22 = 2114;
    id v23 = v9;
    __int16 v24 = 2114;
    id v25 = v10;
    _os_log_impl(&dword_215600000, v11, OS_LOG_TYPE_DEFAULT, "Replace notification topic settings %{public}@ for source %{public}@ and topic %{public}@ (sync)", buf, 0x20u);
  }
  queue = self->_queue;
  v16[0] = MEMORY[0x263EF8330];
  v16[1] = 3221225472;
  v16[2] = __128__UNUserNotificationSettingsServiceConnection_replaceNotificationTopicSettings_forNotificationSourceIdentifier_topicIdentifier___block_invoke;
  v16[3] = &unk_264252B08;
  v16[4] = self;
  id v17 = v8;
  id v18 = v9;
  id v19 = v10;
  id v13 = v10;
  id v14 = v9;
  id v15 = v8;
  dispatch_sync(queue, v16);
}

void __128__UNUserNotificationSettingsServiceConnection_replaceNotificationTopicSettings_forNotificationSourceIdentifier_topicIdentifier___block_invoke(uint64_t a1)
{
  objc_msgSend(*(id *)(a1 + 32), "_queue_ensureConnection");
  id v3 = (id)objc_claimAutoreleasedReturnValue();
  id v2 = [v3 synchronousRemoteObjectProxyWithErrorHandler:&__block_literal_global_18];
  [v2 replaceNotificationTopicSettings:*(void *)(a1 + 40) forNotificationSourceIdentifier:*(void *)(a1 + 48) topicIdentifier:*(void *)(a1 + 56)];
}

void __128__UNUserNotificationSettingsServiceConnection_replaceNotificationTopicSettings_forNotificationSourceIdentifier_topicIdentifier___block_invoke_2(uint64_t a1, void *a2)
{
  id v2 = a2;
  if (os_log_type_enabled((os_log_t)*MEMORY[0x263F1E010], OS_LOG_TYPE_ERROR)) {
    __128__UNUserNotificationSettingsServiceConnection_replaceNotificationTopicSettings_forNotificationSourceIdentifier_topicIdentifier___block_invoke_2_cold_1();
  }
}

- (id)notificationSystemSettings
{
  uint64_t v9 = 0;
  id v10 = &v9;
  uint64_t v11 = 0x3032000000;
  int v12 = __Block_byref_object_copy_;
  id v13 = __Block_byref_object_dispose_;
  id v14 = 0;
  id v3 = *MEMORY[0x263F1E010];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x263F1E010], OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_215600000, v3, OS_LOG_TYPE_DEFAULT, "Getting system settings (sync)", buf, 2u);
  }
  queue = self->_queue;
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __73__UNUserNotificationSettingsServiceConnection_notificationSystemSettings__block_invoke;
  v7[3] = &unk_264252B58;
  v7[4] = self;
  void v7[5] = &v9;
  dispatch_sync(queue, v7);
  id v5 = (id)v10[5];
  _Block_object_dispose(&v9, 8);

  return v5;
}

void __73__UNUserNotificationSettingsServiceConnection_notificationSystemSettings__block_invoke(uint64_t a1)
{
  id v2 = objc_msgSend(*(id *)(a1 + 32), "_queue_ensureConnection");
  id v3 = [v2 synchronousRemoteObjectProxyWithErrorHandler:&__block_literal_global_20];
  v4[0] = MEMORY[0x263EF8330];
  v4[1] = 3221225472;
  v4[2] = __73__UNUserNotificationSettingsServiceConnection_notificationSystemSettings__block_invoke_21;
  v4[3] = &unk_264252B30;
  v4[4] = *(void *)(a1 + 40);
  [v3 getNotificationSystemSettingsWithCompletionHandler:v4];
}

void __73__UNUserNotificationSettingsServiceConnection_notificationSystemSettings__block_invoke_2(uint64_t a1, void *a2)
{
  id v2 = a2;
  if (os_log_type_enabled((os_log_t)*MEMORY[0x263F1E010], OS_LOG_TYPE_ERROR)) {
    __73__UNUserNotificationSettingsServiceConnection_notificationSystemSettings__block_invoke_2_cold_1();
  }
}

void __73__UNUserNotificationSettingsServiceConnection_notificationSystemSettings__block_invoke_21(uint64_t a1, void *a2)
{
  uint64_t v9 = *MEMORY[0x263EF8340];
  id v4 = a2;
  objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 32) + 8) + 40), a2);
  id v5 = *MEMORY[0x263F1E010];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x263F1E010], OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v6 = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 40);
    int v7 = 138543362;
    uint64_t v8 = v6;
    _os_log_impl(&dword_215600000, v5, OS_LOG_TYPE_DEFAULT, "Got system settings %{public}@", (uint8_t *)&v7, 0xCu);
  }
}

- (void)setNotificationSystemSettings:(id)a3
{
  id v4 = a3;
  id v5 = *MEMORY[0x263F1E010];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x263F1E010], OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_215600000, v5, OS_LOG_TYPE_DEFAULT, "Setting system settings (sync)", buf, 2u);
  }
  queue = self->_queue;
  v8[0] = MEMORY[0x263EF8330];
  v8[1] = 3221225472;
  v8[2] = __77__UNUserNotificationSettingsServiceConnection_setNotificationSystemSettings___block_invoke;
  v8[3] = &unk_264252958;
  v8[4] = self;
  id v9 = v4;
  id v7 = v4;
  dispatch_sync(queue, v8);
}

void __77__UNUserNotificationSettingsServiceConnection_setNotificationSystemSettings___block_invoke(uint64_t a1)
{
  objc_msgSend(*(id *)(a1 + 32), "_queue_ensureConnection");
  id v3 = (id)objc_claimAutoreleasedReturnValue();
  id v2 = [v3 synchronousRemoteObjectProxyWithErrorHandler:&__block_literal_global_24];
  [v2 setNotificationSystemSettings:*(void *)(a1 + 40)];
}

void __77__UNUserNotificationSettingsServiceConnection_setNotificationSystemSettings___block_invoke_2(uint64_t a1, void *a2)
{
  id v2 = a2;
  if (os_log_type_enabled((os_log_t)*MEMORY[0x263F1E010], OS_LOG_TYPE_ERROR)) {
    __77__UNUserNotificationSettingsServiceConnection_setNotificationSystemSettings___block_invoke_2_cold_1();
  }
}

- (void)resetScheduledDeliverySetting
{
  id v3 = *MEMORY[0x263F1E010];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x263F1E010], OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_215600000, v3, OS_LOG_TYPE_DEFAULT, "Resetting scheduled delivery setting (sync)", buf, 2u);
  }
  queue = self->_queue;
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __76__UNUserNotificationSettingsServiceConnection_resetScheduledDeliverySetting__block_invoke;
  block[3] = &unk_2642529A8;
  void block[4] = self;
  dispatch_sync(queue, block);
}

void __76__UNUserNotificationSettingsServiceConnection_resetScheduledDeliverySetting__block_invoke(uint64_t a1)
{
  objc_msgSend(*(id *)(a1 + 32), "_queue_ensureConnection");
  id v2 = (id)objc_claimAutoreleasedReturnValue();
  v1 = [v2 synchronousRemoteObjectProxyWithErrorHandler:&__block_literal_global_26];
  [v1 resetScheduledDeliverySetting];
}

void __76__UNUserNotificationSettingsServiceConnection_resetScheduledDeliverySetting__block_invoke_2(uint64_t a1, void *a2)
{
  id v2 = a2;
  if (os_log_type_enabled((os_log_t)*MEMORY[0x263F1E010], OS_LOG_TYPE_ERROR)) {
    __76__UNUserNotificationSettingsServiceConnection_resetScheduledDeliverySetting__block_invoke_2_cold_1();
  }
}

- (void)_queue_addObserver:(id)a3
{
}

- (void)_queue_removeObserver:(id)a3
{
}

- (void)_invalidate
{
  [(NSXPCConnection *)self->_connection invalidate];
  [(NSXPCConnection *)self->_connection setInterruptionHandler:0];
  [(NSXPCConnection *)self->_connection setInvalidationHandler:0];
  [(NSXPCConnection *)self->_connection setExportedObject:0];
  [(UNUserNotificationSettingsServiceConnection *)self setConnection:0];
}

- (id)_queue_ensureConnection
{
  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  connection = self->_connection;
  if (!connection)
  {
    objc_initWeak(&location, self);
    id v4 = (NSXPCConnection *)[objc_alloc(MEMORY[0x263F08D68]) initWithMachServiceName:@"com.apple.usernotifications.usernotificationsettingsservice" options:0];
    id v5 = self->_connection;
    self->_connection = v4;

    uint64_t v6 = self->_connection;
    id v7 = +[UNUserNotificationSettingsService serverInterface];
    [(NSXPCConnection *)v6 setRemoteObjectInterface:v7];

    uint64_t v8 = self->_connection;
    id v9 = +[UNUserNotificationSettingsService clientInterface];
    [(NSXPCConnection *)v8 setExportedInterface:v9];

    id v10 = self->_connection;
    id v11 = objc_loadWeakRetained(&location);
    [(NSXPCConnection *)v10 setExportedObject:v11];

    objc_initWeak(&from, self->_queue);
    int v12 = self->_connection;
    v21[0] = MEMORY[0x263EF8330];
    v21[1] = 3221225472;
    v21[2] = __70__UNUserNotificationSettingsServiceConnection__queue_ensureConnection__block_invoke;
    v21[3] = &unk_264252BA8;
    objc_copyWeak(&v22, &from);
    objc_copyWeak(&v23, &location);
    [(NSXPCConnection *)v12 setInterruptionHandler:v21];
    id v13 = self->_connection;
    uint64_t v15 = MEMORY[0x263EF8330];
    uint64_t v16 = 3221225472;
    id v17 = __70__UNUserNotificationSettingsServiceConnection__queue_ensureConnection__block_invoke_3;
    id v18 = &unk_264252BA8;
    objc_copyWeak(&v19, &from);
    objc_copyWeak(&v20, &location);
    [(NSXPCConnection *)v13 setInvalidationHandler:&v15];
    [(NSXPCConnection *)self->_connection resume];
    objc_destroyWeak(&v20);
    objc_destroyWeak(&v19);
    objc_destroyWeak(&v23);
    objc_destroyWeak(&v22);
    objc_destroyWeak(&from);
    objc_destroyWeak(&location);
    connection = self->_connection;
  }
  return connection;
}

void __70__UNUserNotificationSettingsServiceConnection__queue_ensureConnection__block_invoke(uint64_t a1)
{
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    block[0] = MEMORY[0x263EF8330];
    block[1] = 3221225472;
    block[2] = __70__UNUserNotificationSettingsServiceConnection__queue_ensureConnection__block_invoke_2;
    block[3] = &unk_264252B80;
    objc_copyWeak(&v4, (id *)(a1 + 40));
    dispatch_async(WeakRetained, block);
    objc_destroyWeak(&v4);
  }
}

void __70__UNUserNotificationSettingsServiceConnection__queue_ensureConnection__block_invoke_2(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "_queue_interruptedConnection");
}

void __70__UNUserNotificationSettingsServiceConnection__queue_ensureConnection__block_invoke_3(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    block[0] = MEMORY[0x263EF8330];
    block[1] = 3221225472;
    block[2] = __70__UNUserNotificationSettingsServiceConnection__queue_ensureConnection__block_invoke_4;
    block[3] = &unk_264252B80;
    objc_copyWeak(&v4, (id *)(a1 + 40));
    dispatch_async(WeakRetained, block);
    objc_destroyWeak(&v4);
  }
}

void __70__UNUserNotificationSettingsServiceConnection__queue_ensureConnection__block_invoke_4(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "_queue_invalidatedConnection");
}

- (void)_queue_interruptedConnection
{
}

- (void)_queue_invalidatedConnection
{
  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  [(UNUserNotificationSettingsServiceConnection *)self _invalidate];
}

- (void)updateNotificationSystemSettings:(id)a3
{
  uint64_t v15 = *MEMORY[0x263EF8340];
  id v4 = a3;
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  id v5 = self->_observers;
  uint64_t v6 = [(NSMutableArray *)v5 countByEnumeratingWithState:&v10 objects:v14 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v11;
    do
    {
      uint64_t v9 = 0;
      do
      {
        if (*(void *)v11 != v8) {
          objc_enumerationMutation(v5);
        }
        objc_msgSend(*(id *)(*((void *)&v10 + 1) + 8 * v9++), "settingsServiceConnection:didUpdateNotificationSystemSettings:", self, v4, (void)v10);
      }
      while (v7 != v9);
      uint64_t v7 = [(NSMutableArray *)v5 countByEnumeratingWithState:&v10 objects:v14 count:16];
    }
    while (v7);
  }
}

- (NSXPCConnection)connection
{
  return self->_connection;
}

- (void)setConnection:(id)a3
{
}

- (OS_dispatch_queue)queue
{
  return self->_queue;
}

- (void)setQueue:(id)a3
{
}

- (OS_dispatch_queue)callOutQueue
{
  return self->_callOutQueue;
}

- (void)setCallOutQueue:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_callOutQueue, 0);
  objc_storeStrong((id *)&self->_queue, 0);
  objc_storeStrong((id *)&self->_connection, 0);
  objc_storeStrong((id *)&self->_observers, 0);
}

void __80__UNUserNotificationSettingsServiceConnection_notificationSourceWithIdentifier___block_invoke_2_cold_1()
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_3(&dword_215600000, v0, v1, "Getting notification source %{public}@ (sync) failed with error: %{public}@");
}

void __82__UNUserNotificationSettingsServiceConnection_notificationSourcesWithIdentifiers___block_invoke_2_cold_1()
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_3(&dword_215600000, v0, v1, "Getting notification sources %{public}@ (sync) failed with error: %{public}@");
}

void __77__UNUserNotificationSettingsServiceConnection_notificationSourcesWithFilter___block_invoke_2_cold_1()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_215600000, v0, v1, "Getting all notification sources (sync) failed with error: %{public}@", v2, v3, v4, v5, v6);
}

void __126__UNUserNotificationSettingsServiceConnection_authorizationWithOptions_forNotificationSourceIdentifier_withCompletionHandler___block_invoke_2_cold_1()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_215600000, v0, v1, "Authorize notification settings (sync) failed with error: %{public}@", v2, v3, v4, v5, v6);
}

void __107__UNUserNotificationSettingsServiceConnection_replaceNotificationSettings_forNotificationSourceIdentifier___block_invoke_2_cold_1()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_215600000, v0, v1, "Replace notification settings (sync) failed with error: %{public}@", v2, v3, v4, v5, v6);
}

void __128__UNUserNotificationSettingsServiceConnection_replaceNotificationTopicSettings_forNotificationSourceIdentifier_topicIdentifier___block_invoke_2_cold_1()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_215600000, v0, v1, "Replace notification topic settings (sync) failed with error: %{public}@", v2, v3, v4, v5, v6);
}

void __73__UNUserNotificationSettingsServiceConnection_notificationSystemSettings__block_invoke_2_cold_1()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_215600000, v0, v1, "Getting system settings (sync) failed with error: %{public}@", v2, v3, v4, v5, v6);
}

void __77__UNUserNotificationSettingsServiceConnection_setNotificationSystemSettings___block_invoke_2_cold_1()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_215600000, v0, v1, "Setting system settings (sync) failed with error: %{public}@", v2, v3, v4, v5, v6);
}

void __76__UNUserNotificationSettingsServiceConnection_resetScheduledDeliverySetting__block_invoke_2_cold_1()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_215600000, v0, v1, "Resetting scheduled delivery setting (sync) failed with error: %{public}@", v2, v3, v4, v5, v6);
}

@end