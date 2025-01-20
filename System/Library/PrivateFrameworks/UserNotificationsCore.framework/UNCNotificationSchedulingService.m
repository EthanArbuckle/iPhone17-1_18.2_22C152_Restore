@interface UNCNotificationSchedulingService
- (UNCNotificationSchedulingService)initWithNotificationRepository:(id)a3 pendingNotificationRepository:(id)a4 notificationScheduleRepository:(id)a5 locationMonitor:(id)a6;
- (id)_queue_addClientForBundleIdentifier:(id)a3;
- (id)_queue_clientForBundleIdentifier:(id)a3;
- (id)_queue_pendingNotificationRecordsForBundleIdentifier:(id)a3;
- (id)_queue_undeliveredNotificationRequestsForBundleIdentifier:(id)a3;
- (id)pendingNotificationRecordsForBundleIdentifier:(id)a3;
- (id)undeliveredNotificationRecordsForBundleIdentifier:(id)a3;
- (void)_queue_addPendingNotificationRecords:(id)a3 forBundleIdentifier:(id)a4;
- (void)_queue_applicationStateDidRestore;
- (void)_queue_didChangeNotificationSettings:(id)a3 forBundleIdentifier:(id)a4;
- (void)_queue_localeDidChange;
- (void)_queue_notificationSourcesDidUninstall:(id)a3;
- (void)_queue_removeAllPendingNotificationRecordsForBundleIdentifier:(id)a3;
- (void)_queue_removeClientForBundleIdentifier:(id)a3;
- (void)_queue_removePendingNotificationRecordsWithIdentifiers:(id)a3 forBundleIdentifier:(id)a4;
- (void)_queue_removeSimilarPendingNotificationRecords:(id)a3 forBundleIdentifier:(id)a4;
- (void)_queue_setPendingNotificationRecords:(id)a3 forBundleIdentifier:(id)a4;
- (void)_queue_timeDidChangeSignificantly;
- (void)addPendingNotificationRecords:(id)a3 forBundleIdentifier:(id)a4 withCompletionHandler:(id)a5;
- (void)applicationStateDidRestore;
- (void)didChangeNotificationSettings:(id)a3 forBundleIdentifier:(id)a4;
- (void)localeDidChange;
- (void)notificationSourcesDidUninstall:(id)a3;
- (void)removeAllPendingNotificationRecordsForBundleIdentifier:(id)a3 withCompletionHandler:(id)a4;
- (void)removePendingNotificationRecordsWithIdentifiers:(id)a3 forBundleIdentifier:(id)a4 withCompletionHandler:(id)a5;
- (void)removeSimilarPendingNotificationRecords:(id)a3 forBundleIdentifier:(id)a4;
- (void)setPendingNotificationRecords:(id)a3 forBundleIdentifier:(id)a4;
- (void)timeDidChangeSignificantly;
@end

@implementation UNCNotificationSchedulingService

- (UNCNotificationSchedulingService)initWithNotificationRepository:(id)a3 pendingNotificationRepository:(id)a4 notificationScheduleRepository:(id)a5 locationMonitor:(id)a6
{
  id v11 = a3;
  id v12 = a4;
  id v13 = a5;
  id v14 = a6;
  v22.receiver = self;
  v22.super_class = (Class)UNCNotificationSchedulingService;
  v15 = [(UNCNotificationSchedulingService *)&v22 init];
  if (v15)
  {
    v16 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    dispatch_queue_t v17 = dispatch_queue_create("com.apple.usernotificationsserver.NotificationSchedulingService", v16);
    queue = v15->_queue;
    v15->_queue = (OS_dispatch_queue *)v17;

    v19 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x263EFF9A0]);
    clients = v15->_clients;
    v15->_clients = v19;

    objc_storeStrong((id *)&v15->_notificationRepository, a3);
    objc_storeStrong((id *)&v15->_notificationScheduleRepository, a5);
    objc_storeStrong((id *)&v15->_pendingNotificationRepository, a4);
    objc_storeStrong((id *)&v15->_locationMonitor, a6);
  }

  return v15;
}

- (void)addPendingNotificationRecords:(id)a3 forBundleIdentifier:(id)a4 withCompletionHandler:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  queue = self->_queue;
  v15[0] = MEMORY[0x263EF8330];
  v15[1] = 3221225472;
  v15[2] = __108__UNCNotificationSchedulingService_addPendingNotificationRecords_forBundleIdentifier_withCompletionHandler___block_invoke;
  v15[3] = &unk_265567F50;
  v15[4] = self;
  id v16 = v8;
  id v17 = v9;
  id v18 = v10;
  id v12 = v10;
  id v13 = v9;
  id v14 = v8;
  dispatch_async(queue, v15);
}

uint64_t __108__UNCNotificationSchedulingService_addPendingNotificationRecords_forBundleIdentifier_withCompletionHandler___block_invoke(uint64_t a1)
{
  objc_msgSend(*(id *)(a1 + 32), "_queue_addPendingNotificationRecords:forBundleIdentifier:", *(void *)(a1 + 40), *(void *)(a1 + 48));
  uint64_t result = *(void *)(a1 + 56);
  if (result)
  {
    v3 = *(uint64_t (**)(void))(result + 16);
    return v3();
  }
  return result;
}

- (void)setPendingNotificationRecords:(id)a3 forBundleIdentifier:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  queue = self->_queue;
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __86__UNCNotificationSchedulingService_setPendingNotificationRecords_forBundleIdentifier___block_invoke;
  block[3] = &unk_2655676D8;
  block[4] = self;
  id v12 = v6;
  id v13 = v7;
  id v9 = v7;
  id v10 = v6;
  dispatch_async(queue, block);
}

uint64_t __86__UNCNotificationSchedulingService_setPendingNotificationRecords_forBundleIdentifier___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_queue_setPendingNotificationRecords:forBundleIdentifier:", *(void *)(a1 + 40), *(void *)(a1 + 48));
}

- (void)removePendingNotificationRecordsWithIdentifiers:(id)a3 forBundleIdentifier:(id)a4 withCompletionHandler:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  queue = self->_queue;
  v15[0] = MEMORY[0x263EF8330];
  v15[1] = 3221225472;
  v15[2] = __126__UNCNotificationSchedulingService_removePendingNotificationRecordsWithIdentifiers_forBundleIdentifier_withCompletionHandler___block_invoke;
  v15[3] = &unk_265567F50;
  v15[4] = self;
  id v16 = v8;
  id v17 = v9;
  id v18 = v10;
  id v12 = v10;
  id v13 = v9;
  id v14 = v8;
  dispatch_async(queue, v15);
}

uint64_t __126__UNCNotificationSchedulingService_removePendingNotificationRecordsWithIdentifiers_forBundleIdentifier_withCompletionHandler___block_invoke(uint64_t a1)
{
  objc_msgSend(*(id *)(a1 + 32), "_queue_removePendingNotificationRecordsWithIdentifiers:forBundleIdentifier:", *(void *)(a1 + 40), *(void *)(a1 + 48));
  uint64_t result = *(void *)(a1 + 56);
  if (result)
  {
    v3 = *(uint64_t (**)(void))(result + 16);
    return v3();
  }
  return result;
}

- (void)removeSimilarPendingNotificationRecords:(id)a3 forBundleIdentifier:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  queue = self->_queue;
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __96__UNCNotificationSchedulingService_removeSimilarPendingNotificationRecords_forBundleIdentifier___block_invoke;
  block[3] = &unk_2655676D8;
  block[4] = self;
  id v12 = v6;
  id v13 = v7;
  id v9 = v7;
  id v10 = v6;
  dispatch_async(queue, block);
}

uint64_t __96__UNCNotificationSchedulingService_removeSimilarPendingNotificationRecords_forBundleIdentifier___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_queue_removeSimilarPendingNotificationRecords:forBundleIdentifier:", *(void *)(a1 + 40), *(void *)(a1 + 48));
}

- (void)removeAllPendingNotificationRecordsForBundleIdentifier:(id)a3 withCompletionHandler:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  queue = self->_queue;
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __113__UNCNotificationSchedulingService_removeAllPendingNotificationRecordsForBundleIdentifier_withCompletionHandler___block_invoke;
  block[3] = &unk_265567AE0;
  block[4] = self;
  id v12 = v6;
  id v13 = v7;
  id v9 = v7;
  id v10 = v6;
  dispatch_async(queue, block);
}

uint64_t __113__UNCNotificationSchedulingService_removeAllPendingNotificationRecordsForBundleIdentifier_withCompletionHandler___block_invoke(uint64_t a1)
{
  objc_msgSend(*(id *)(a1 + 32), "_queue_removeAllPendingNotificationRecordsForBundleIdentifier:", *(void *)(a1 + 40));
  uint64_t result = *(void *)(a1 + 48);
  if (result)
  {
    v3 = *(uint64_t (**)(void))(result + 16);
    return v3();
  }
  return result;
}

- (id)pendingNotificationRecordsForBundleIdentifier:(id)a3
{
  id v4 = a3;
  uint64_t v12 = 0;
  id v13 = &v12;
  uint64_t v14 = 0x3032000000;
  v15 = __Block_byref_object_copy__8;
  id v16 = __Block_byref_object_dispose__8;
  id v17 = 0;
  queue = self->_queue;
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __82__UNCNotificationSchedulingService_pendingNotificationRecordsForBundleIdentifier___block_invoke;
  block[3] = &unk_265567700;
  id v10 = v4;
  id v11 = &v12;
  block[4] = self;
  id v6 = v4;
  dispatch_sync(queue, block);
  id v7 = (id)v13[5];

  _Block_object_dispose(&v12, 8);

  return v7;
}

uint64_t __82__UNCNotificationSchedulingService_pendingNotificationRecordsForBundleIdentifier___block_invoke(uint64_t a1)
{
  *(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 40) = objc_msgSend(*(id *)(a1 + 32), "_queue_pendingNotificationRecordsForBundleIdentifier:", *(void *)(a1 + 40));

  return MEMORY[0x270F9A758]();
}

- (id)undeliveredNotificationRecordsForBundleIdentifier:(id)a3
{
  id v4 = a3;
  uint64_t v12 = 0;
  id v13 = &v12;
  uint64_t v14 = 0x3032000000;
  v15 = __Block_byref_object_copy__8;
  id v16 = __Block_byref_object_dispose__8;
  id v17 = 0;
  queue = self->_queue;
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __86__UNCNotificationSchedulingService_undeliveredNotificationRecordsForBundleIdentifier___block_invoke;
  block[3] = &unk_265567700;
  id v10 = v4;
  id v11 = &v12;
  block[4] = self;
  id v6 = v4;
  dispatch_sync(queue, block);
  id v7 = (id)v13[5];

  _Block_object_dispose(&v12, 8);

  return v7;
}

uint64_t __86__UNCNotificationSchedulingService_undeliveredNotificationRecordsForBundleIdentifier___block_invoke(uint64_t a1)
{
  *(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 40) = objc_msgSend(*(id *)(a1 + 32), "_queue_undeliveredNotificationRequestsForBundleIdentifier:", *(void *)(a1 + 40));

  return MEMORY[0x270F9A758]();
}

- (void)didChangeNotificationSettings:(id)a3 forBundleIdentifier:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  queue = self->_queue;
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __86__UNCNotificationSchedulingService_didChangeNotificationSettings_forBundleIdentifier___block_invoke;
  block[3] = &unk_2655676D8;
  block[4] = self;
  id v12 = v6;
  id v13 = v7;
  id v9 = v7;
  id v10 = v6;
  dispatch_sync(queue, block);
}

uint64_t __86__UNCNotificationSchedulingService_didChangeNotificationSettings_forBundleIdentifier___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_queue_didChangeNotificationSettings:forBundleIdentifier:", *(void *)(a1 + 40), *(void *)(a1 + 48));
}

- (void)notificationSourcesDidUninstall:(id)a3
{
  id v4 = a3;
  queue = self->_queue;
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __68__UNCNotificationSchedulingService_notificationSourcesDidUninstall___block_invoke;
  v7[3] = &unk_265567628;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_sync(queue, v7);
}

uint64_t __68__UNCNotificationSchedulingService_notificationSourcesDidUninstall___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_queue_notificationSourcesDidUninstall:", *(void *)(a1 + 40));
}

- (void)applicationStateDidRestore
{
  queue = self->_queue;
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __62__UNCNotificationSchedulingService_applicationStateDidRestore__block_invoke;
  block[3] = &unk_265567728;
  block[4] = self;
  dispatch_async(queue, block);
}

uint64_t __62__UNCNotificationSchedulingService_applicationStateDidRestore__block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_queue_applicationStateDidRestore");
}

- (void)localeDidChange
{
  queue = self->_queue;
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __51__UNCNotificationSchedulingService_localeDidChange__block_invoke;
  block[3] = &unk_265567728;
  block[4] = self;
  dispatch_async(queue, block);
}

uint64_t __51__UNCNotificationSchedulingService_localeDidChange__block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_queue_localeDidChange");
}

- (void)timeDidChangeSignificantly
{
  queue = self->_queue;
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __62__UNCNotificationSchedulingService_timeDidChangeSignificantly__block_invoke;
  block[3] = &unk_265567728;
  block[4] = self;
  dispatch_async(queue, block);
}

uint64_t __62__UNCNotificationSchedulingService_timeDidChangeSignificantly__block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_queue_timeDidChangeSignificantly");
}

- (void)_queue_addPendingNotificationRecords:(id)a3 forBundleIdentifier:(id)a4
{
  id v6 = a3;
  id v7 = [(UNCNotificationSchedulingService *)self _queue_clientForBundleIdentifier:a4];
  [v7 addPendingNotificationRecords:v6];
}

- (void)_queue_setPendingNotificationRecords:(id)a3 forBundleIdentifier:(id)a4
{
  id v6 = a3;
  id v7 = [(UNCNotificationSchedulingService *)self _queue_clientForBundleIdentifier:a4];
  [v7 setPendingNotificationRecords:v6];
}

- (void)_queue_removePendingNotificationRecordsWithIdentifiers:(id)a3 forBundleIdentifier:(id)a4
{
  id v6 = a3;
  id v7 = [(UNCNotificationSchedulingService *)self _queue_clientForBundleIdentifier:a4];
  [v7 removePendingNotificationRecordsWithIdentifiers:v6];
}

- (void)_queue_removeSimilarPendingNotificationRecords:(id)a3 forBundleIdentifier:(id)a4
{
  id v6 = a3;
  id v7 = [(UNCNotificationSchedulingService *)self _queue_clientForBundleIdentifier:a4];
  [v7 removePendingNotificationRecords:v6];
}

- (void)_queue_removeAllPendingNotificationRecordsForBundleIdentifier:(id)a3
{
  id v3 = [(UNCNotificationSchedulingService *)self _queue_clientForBundleIdentifier:a3];
  [v3 removeAllPendingNotificationRecords];
}

- (id)_queue_pendingNotificationRecordsForBundleIdentifier:(id)a3
{
  id v3 = [(UNCNotificationSchedulingService *)self _queue_clientForBundleIdentifier:a3];
  id v4 = [v3 pendingNotificationRecords];

  return v4;
}

- (id)_queue_undeliveredNotificationRequestsForBundleIdentifier:(id)a3
{
  id v3 = [(UNCNotificationSchedulingService *)self _queue_clientForBundleIdentifier:a3];
  id v4 = [v3 undeliveredNotificationRecords];

  return v4;
}

- (void)_queue_didChangeNotificationSettings:(id)a3 forBundleIdentifier:(id)a4
{
  id v7 = a4;
  if ([a3 hasEnabledSettings]) {
    id v6 = [(UNCNotificationSchedulingService *)self _queue_addClientForBundleIdentifier:v7];
  }
  else {
    [(UNCNotificationSchedulingService *)self _queue_removeClientForBundleIdentifier:v7];
  }
}

- (void)_queue_notificationSourcesDidUninstall:(id)a3
{
  uint64_t v15 = *MEMORY[0x263EF8340];
  id v4 = a3;
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  uint64_t v5 = [v4 countByEnumeratingWithState:&v10 objects:v14 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v11;
    do
    {
      uint64_t v8 = 0;
      do
      {
        if (*(void *)v11 != v7) {
          objc_enumerationMutation(v4);
        }
        id v9 = [*(id *)(*((void *)&v10 + 1) + 8 * v8) bundleIdentifier];
        [(UNCNotificationSchedulingService *)self _queue_removeClientForBundleIdentifier:v9];

        ++v8;
      }
      while (v6 != v8);
      uint64_t v6 = [v4 countByEnumeratingWithState:&v10 objects:v14 count:16];
    }
    while (v6);
  }
}

- (void)_queue_applicationStateDidRestore
{
  uint64_t v18 = *MEMORY[0x263EF8340];
  id v3 = (void *)*MEMORY[0x263F1E040];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x263F1E040], OS_LOG_TYPE_DEFAULT))
  {
    clients = self->_clients;
    uint64_t v5 = v3;
    *(_DWORD *)buf = 134217984;
    uint64_t v17 = [(NSMutableDictionary *)clients count];
    _os_log_impl(&dword_2608DB000, v5, OS_LOG_TYPE_DEFAULT, "Application state restored for %ld clients", buf, 0xCu);
  }
  long long v13 = 0u;
  long long v14 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  uint64_t v6 = [(NSMutableDictionary *)self->_clients allValues];
  uint64_t v7 = [v6 countByEnumeratingWithState:&v11 objects:v15 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v9 = *(void *)v12;
    do
    {
      uint64_t v10 = 0;
      do
      {
        if (*(void *)v12 != v9) {
          objc_enumerationMutation(v6);
        }
        [*(id *)(*((void *)&v11 + 1) + 8 * v10++) handleApplicationStateRestore];
      }
      while (v8 != v10);
      uint64_t v8 = [v6 countByEnumeratingWithState:&v11 objects:v15 count:16];
    }
    while (v8);
  }
}

- (void)_queue_localeDidChange
{
  uint64_t v18 = *MEMORY[0x263EF8340];
  id v3 = (void *)*MEMORY[0x263F1E040];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x263F1E040], OS_LOG_TYPE_DEFAULT))
  {
    clients = self->_clients;
    uint64_t v5 = v3;
    *(_DWORD *)buf = 134217984;
    uint64_t v17 = [(NSMutableDictionary *)clients count];
    _os_log_impl(&dword_2608DB000, v5, OS_LOG_TYPE_DEFAULT, "Handle locale change for %ld clients", buf, 0xCu);
  }
  long long v13 = 0u;
  long long v14 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  uint64_t v6 = [(NSMutableDictionary *)self->_clients allValues];
  uint64_t v7 = [v6 countByEnumeratingWithState:&v11 objects:v15 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v9 = *(void *)v12;
    do
    {
      uint64_t v10 = 0;
      do
      {
        if (*(void *)v12 != v9) {
          objc_enumerationMutation(v6);
        }
        [*(id *)(*((void *)&v11 + 1) + 8 * v10++) handleLocaleChange];
      }
      while (v8 != v10);
      uint64_t v8 = [v6 countByEnumeratingWithState:&v11 objects:v15 count:16];
    }
    while (v8);
  }
}

- (void)_queue_timeDidChangeSignificantly
{
  uint64_t v18 = *MEMORY[0x263EF8340];
  id v3 = (void *)*MEMORY[0x263F1E040];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x263F1E040], OS_LOG_TYPE_DEFAULT))
  {
    clients = self->_clients;
    uint64_t v5 = v3;
    *(_DWORD *)buf = 134217984;
    uint64_t v17 = [(NSMutableDictionary *)clients count];
    _os_log_impl(&dword_2608DB000, v5, OS_LOG_TYPE_DEFAULT, "Handle significant time change for %ld clients", buf, 0xCu);
  }
  long long v13 = 0u;
  long long v14 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  uint64_t v6 = [(NSMutableDictionary *)self->_clients allValues];
  uint64_t v7 = [v6 countByEnumeratingWithState:&v11 objects:v15 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v9 = *(void *)v12;
    do
    {
      uint64_t v10 = 0;
      do
      {
        if (*(void *)v12 != v9) {
          objc_enumerationMutation(v6);
        }
        [*(id *)(*((void *)&v11 + 1) + 8 * v10++) handleSignificantTimeChange];
      }
      while (v8 != v10);
      uint64_t v8 = [v6 countByEnumeratingWithState:&v11 objects:v15 count:16];
    }
    while (v8);
  }
}

- (id)_queue_addClientForBundleIdentifier:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [(NSMutableDictionary *)self->_clients objectForKey:v4];
  if (!v5)
  {
    uint64_t v5 = [[UNCLocalNotificationClient alloc] initWithNotificationRepository:self->_notificationRepository pendingNotificationRepository:self->_pendingNotificationRepository notificationScheduleRepository:self->_notificationScheduleRepository locationMonitor:self->_locationMonitor bundleIdentifier:v4 queue:self->_queue];
    [(NSMutableDictionary *)self->_clients setObject:v5 forKey:v4];
  }

  return v5;
}

- (void)_queue_removeClientForBundleIdentifier:(id)a3
{
  id v4 = a3;
  id v5 = [(UNCNotificationSchedulingService *)self _queue_clientForBundleIdentifier:v4];
  [v5 invalidate];
  [(NSMutableDictionary *)self->_clients removeObjectForKey:v4];
}

- (id)_queue_clientForBundleIdentifier:(id)a3
{
  return (id)[(NSMutableDictionary *)self->_clients objectForKey:a3];
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_queue, 0);
  objc_storeStrong((id *)&self->_clients, 0);
  objc_storeStrong((id *)&self->_locationMonitor, 0);
  objc_storeStrong((id *)&self->_notificationScheduleRepository, 0);
  objc_storeStrong((id *)&self->_pendingNotificationRepository, 0);

  objc_storeStrong((id *)&self->_notificationRepository, 0);
}

@end