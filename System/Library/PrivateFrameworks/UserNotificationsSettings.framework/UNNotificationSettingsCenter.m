@interface UNNotificationSettingsCenter
+ (id)currentNotificationSettingsCenter;
- (NSHashTable)observers;
- (OS_dispatch_queue)queue;
- (UNNotificationSettingsCenter)init;
- (UNNotificationSettingsCenterDelegate)delegate;
- (id)_init;
- (id)allNotificationSources;
- (id)notificationSourceWithIdentifier:(id)a3;
- (id)notificationSourcesWithFilter:(id)a3;
- (id)notificationSourcesWithIdentifiers:(id)a3;
- (id)notificationSystemSettings;
- (id)sourceWithIdentifier:(id)a3;
- (void)addObserver:(id)a3;
- (void)authorizationWithOptions:(unint64_t)a3 forNotificationSourceIdentifier:(id)a4 withCompletionHandler:(id)a5;
- (void)dealloc;
- (void)removeObserver:(id)a3;
- (void)replaceNotificationSettings:(id)a3 forNotificationSourceIdentifier:(id)a4;
- (void)replaceNotificationTopicSettings:(id)a3 forNotificationSourceIdentifier:(id)a4 topicIdentifier:(id)a5;
- (void)resetScheduledDeliverySetting;
- (void)setDelegate:(id)a3;
- (void)setNotificationSystemSettings:(id)a3;
- (void)setObservers:(id)a3;
- (void)setQueue:(id)a3;
- (void)settingsServiceConnection:(id)a3 didUpdateNotificationSourcesWithIdentifiers:(id)a4;
- (void)settingsServiceConnection:(id)a3 didUpdateNotificationSystemSettings:(id)a4;
@end

@implementation UNNotificationSettingsCenter

- (void)settingsServiceConnection:(id)a3 didUpdateNotificationSourcesWithIdentifiers:(id)a4
{
  id v5 = a4;
  queue = self->_queue;
  uint64_t v11 = MEMORY[0x263EF8330];
  uint64_t v12 = 3221225472;
  v13 = __102__UNNotificationSettingsCenter_settingsServiceConnection_didUpdateNotificationSourcesWithIdentifiers___block_invoke;
  v14 = &unk_264252958;
  v15 = self;
  id v7 = v5;
  id v16 = v7;
  dispatch_async(queue, &v11);
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  char v9 = objc_opt_respondsToSelector();

  if (v9)
  {
    id v10 = objc_loadWeakRetained((id *)&self->_delegate);
    objc_msgSend(v10, "userNotificationSettingsCenter:didUpdateNotificationSourceIdentifiers:", self, v7, v11, v12, v13, v14, v15);
  }
}

+ (id)currentNotificationSettingsCenter
{
  if (currentNotificationSettingsCenter_onceToken != -1) {
    dispatch_once(&currentNotificationSettingsCenter_onceToken, &__block_literal_global);
  }
  v2 = (void *)currentNotificationSettingsCenter___sharedInstance;
  return v2;
}

uint64_t __65__UNNotificationSettingsCenter_currentNotificationSettingsCenter__block_invoke()
{
  currentNotificationSettingsCenter___sharedInstance = [[UNNotificationSettingsCenter alloc] _init];
  return MEMORY[0x270F9A758]();
}

- (UNNotificationSettingsCenter)init
{
  return 0;
}

- (id)_init
{
  v10.receiver = self;
  v10.super_class = (Class)UNNotificationSettingsCenter;
  v2 = [(UNNotificationSettingsCenter *)&v10 init];
  v3 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
  dispatch_queue_t v4 = dispatch_queue_create("com.apple.usernotifications.UNNotificationSettingsCenter", v3);
  queue = v2->_queue;
  v2->_queue = (OS_dispatch_queue *)v4;

  uint64_t v6 = [MEMORY[0x263F088B0] weakObjectsHashTable];
  observers = v2->_observers;
  v2->_observers = (NSHashTable *)v6;

  v8 = +[UNUserNotificationSettingsServiceConnection sharedInstance];
  [v8 addObserver:v2];

  return v2;
}

- (void)dealloc
{
  v3 = +[UNUserNotificationSettingsServiceConnection sharedInstance];
  [v3 removeObserver:self];

  v4.receiver = self;
  v4.super_class = (Class)UNNotificationSettingsCenter;
  [(UNNotificationSettingsCenter *)&v4 dealloc];
}

- (void)setDelegate:(id)a3
{
  id obj = a3;
  p_delegate = &self->_delegate;
  id WeakRetained = objc_loadWeakRetained((id *)p_delegate);
  if (obj && WeakRetained)
  {
    id v6 = objc_loadWeakRetained((id *)p_delegate);

    id v7 = obj;
    if (v6 != obj) {
      goto LABEL_7;
    }
  }
  else
  {
  }
  objc_storeWeak((id *)p_delegate, obj);
  id v7 = obj;
LABEL_7:
}

- (UNNotificationSettingsCenterDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  return (UNNotificationSettingsCenterDelegate *)WeakRetained;
}

- (void)addObserver:(id)a3
{
  id v4 = a3;
  queue = self->_queue;
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __44__UNNotificationSettingsCenter_addObserver___block_invoke;
  v7[3] = &unk_264252958;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_sync(queue, v7);
}

uint64_t __44__UNNotificationSettingsCenter_addObserver___block_invoke(uint64_t a1)
{
  return [*(id *)(*(void *)(a1 + 32) + 24) addObject:*(void *)(a1 + 40)];
}

- (void)removeObserver:(id)a3
{
  id v4 = a3;
  queue = self->_queue;
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __47__UNNotificationSettingsCenter_removeObserver___block_invoke;
  v7[3] = &unk_264252958;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_sync(queue, v7);
}

uint64_t __47__UNNotificationSettingsCenter_removeObserver___block_invoke(uint64_t a1)
{
  return [*(id *)(*(void *)(a1 + 32) + 24) removeObject:*(void *)(a1 + 40)];
}

- (id)sourceWithIdentifier:(id)a3
{
  id v3 = a3;
  id v4 = +[UNUserNotificationSettingsServiceConnection sharedInstance];
  id v5 = [v4 notificationSourceWithIdentifier:v3];

  return v5;
}

- (id)notificationSourceWithIdentifier:(id)a3
{
  id v3 = a3;
  id v4 = +[UNUserNotificationSettingsServiceConnection sharedInstance];
  id v5 = [v4 notificationSourceWithIdentifier:v3];

  return v5;
}

- (id)notificationSourcesWithIdentifiers:(id)a3
{
  id v3 = a3;
  id v4 = +[UNUserNotificationSettingsServiceConnection sharedInstance];
  id v5 = [v4 notificationSourcesWithIdentifiers:v3];

  return v5;
}

- (id)allNotificationSources
{
  v2 = +[UNUserNotificationSettingsServiceConnection sharedInstance];
  id v3 = [v2 notificationSourcesWithFilter:@"_UNNotificationSourceFilterAll"];

  return v3;
}

- (id)notificationSourcesWithFilter:(id)a3
{
  id v3 = a3;
  id v4 = +[UNUserNotificationSettingsServiceConnection sharedInstance];
  id v5 = [v4 notificationSourcesWithFilter:v3];

  return v5;
}

- (void)authorizationWithOptions:(unint64_t)a3 forNotificationSourceIdentifier:(id)a4 withCompletionHandler:(id)a5
{
  id v7 = a5;
  id v8 = a4;
  id v9 = +[UNUserNotificationSettingsServiceConnection sharedInstance];
  [v9 authorizationWithOptions:a3 forNotificationSourceIdentifier:v8 withCompletionHandler:v7];
}

- (void)replaceNotificationSettings:(id)a3 forNotificationSourceIdentifier:(id)a4
{
  id v5 = a4;
  id v6 = a3;
  id v7 = +[UNUserNotificationSettingsServiceConnection sharedInstance];
  [v7 replaceNotificationSettings:v6 forNotificationSourceIdentifier:v5];
}

- (void)replaceNotificationTopicSettings:(id)a3 forNotificationSourceIdentifier:(id)a4 topicIdentifier:(id)a5
{
  id v7 = a5;
  id v8 = a4;
  id v9 = a3;
  id v10 = +[UNUserNotificationSettingsServiceConnection sharedInstance];
  [v10 replaceNotificationTopicSettings:v9 forNotificationSourceIdentifier:v8 topicIdentifier:v7];
}

- (id)notificationSystemSettings
{
  v2 = +[UNUserNotificationSettingsServiceConnection sharedInstance];
  id v3 = [v2 notificationSystemSettings];

  return v3;
}

- (void)setNotificationSystemSettings:(id)a3
{
  id v3 = a3;
  id v4 = +[UNUserNotificationSettingsServiceConnection sharedInstance];
  [v4 setNotificationSystemSettings:v3];
}

- (void)resetScheduledDeliverySetting
{
  id v2 = +[UNUserNotificationSettingsServiceConnection sharedInstance];
  [v2 resetScheduledDeliverySetting];
}

void __102__UNNotificationSettingsCenter_settingsServiceConnection_didUpdateNotificationSourcesWithIdentifiers___block_invoke(uint64_t a1)
{
  uint64_t v13 = *MEMORY[0x263EF8340];
  long long v10 = 0u;
  long long v11 = 0u;
  long long v8 = 0u;
  long long v9 = 0u;
  id v2 = *(id *)(*(void *)(a1 + 32) + 24);
  uint64_t v3 = [v2 countByEnumeratingWithState:&v8 objects:v12 count:16];
  if (v3)
  {
    uint64_t v4 = v3;
    uint64_t v5 = *(void *)v9;
    do
    {
      uint64_t v6 = 0;
      do
      {
        if (*(void *)v9 != v5) {
          objc_enumerationMutation(v2);
        }
        id v7 = *(void **)(*((void *)&v8 + 1) + 8 * v6);
        if (objc_opt_respondsToSelector()) {
          objc_msgSend(v7, "userNotificationSettingsCenter:didUpdateNotificationSourceIdentifiers:", *(void *)(a1 + 32), *(void *)(a1 + 40), (void)v8);
        }
        ++v6;
      }
      while (v4 != v6);
      uint64_t v4 = [v2 countByEnumeratingWithState:&v8 objects:v12 count:16];
    }
    while (v4);
  }
}

- (void)settingsServiceConnection:(id)a3 didUpdateNotificationSystemSettings:(id)a4
{
  id v5 = a4;
  queue = self->_queue;
  uint64_t v11 = MEMORY[0x263EF8330];
  uint64_t v12 = 3221225472;
  uint64_t v13 = __94__UNNotificationSettingsCenter_settingsServiceConnection_didUpdateNotificationSystemSettings___block_invoke;
  v14 = &unk_264252958;
  v15 = self;
  id v7 = v5;
  id v16 = v7;
  dispatch_async(queue, &v11);
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  char v9 = objc_opt_respondsToSelector();

  if (v9)
  {
    id v10 = objc_loadWeakRetained((id *)&self->_delegate);
    objc_msgSend(v10, "userNotificationSettingsCenter:didUpdateNotificationSystemSettings:", self, v7, v11, v12, v13, v14, v15);
  }
}

void __94__UNNotificationSettingsCenter_settingsServiceConnection_didUpdateNotificationSystemSettings___block_invoke(uint64_t a1)
{
  uint64_t v13 = *MEMORY[0x263EF8340];
  long long v10 = 0u;
  long long v11 = 0u;
  long long v8 = 0u;
  long long v9 = 0u;
  id v2 = *(id *)(*(void *)(a1 + 32) + 24);
  uint64_t v3 = [v2 countByEnumeratingWithState:&v8 objects:v12 count:16];
  if (v3)
  {
    uint64_t v4 = v3;
    uint64_t v5 = *(void *)v9;
    do
    {
      uint64_t v6 = 0;
      do
      {
        if (*(void *)v9 != v5) {
          objc_enumerationMutation(v2);
        }
        id v7 = *(void **)(*((void *)&v8 + 1) + 8 * v6);
        if (objc_opt_respondsToSelector()) {
          objc_msgSend(v7, "userNotificationSettingsCenter:didUpdateNotificationSystemSettings:", *(void *)(a1 + 32), *(void *)(a1 + 40), (void)v8);
        }
        ++v6;
      }
      while (v4 != v6);
      uint64_t v4 = [v2 countByEnumeratingWithState:&v8 objects:v12 count:16];
    }
    while (v4);
  }
}

- (OS_dispatch_queue)queue
{
  return self->_queue;
}

- (void)setQueue:(id)a3
{
}

- (NSHashTable)observers
{
  return self->_observers;
}

- (void)setObservers:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_observers, 0);
  objc_storeStrong((id *)&self->_queue, 0);
  objc_destroyWeak((id *)&self->_delegate);
}

@end