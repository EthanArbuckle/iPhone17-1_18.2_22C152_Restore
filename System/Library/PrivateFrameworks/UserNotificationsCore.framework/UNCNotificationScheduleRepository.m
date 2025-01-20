@interface UNCNotificationScheduleRepository
- (UNCNotificationScheduleRepository)initWithDirectory:(id)a3 librarian:(id)a4;
- (id)_dateFormatter;
- (id)_queue_scheduleForBundleIdentifier:(id)a3;
- (id)allBundleIdentifiers;
- (id)scheduleForBundleIdentifier:(id)a3;
- (void)_queue_removeScheduleForBundleIdentifier:(id)a3;
- (void)_queue_setSchedule:(id)a3 forBundleIdentifier:(id)a4;
- (void)notificationSourcesDidUninstall:(id)a3;
- (void)removeScheduleForBundleIdentifier:(id)a3;
- (void)setSchedule:(id)a3 forBundleIdentifier:(id)a4;
@end

@implementation UNCNotificationScheduleRepository

- (id)_dateFormatter
{
  if (_dateFormatter___once_0 != -1) {
    dispatch_once(&_dateFormatter___once_0, &__block_literal_global_17);
  }
  v2 = (void *)_dateFormatter___dateFormatter_0;

  return v2;
}

uint64_t __51__UNCNotificationScheduleRepository__dateFormatter__block_invoke()
{
  id v0 = objc_alloc_init(MEMORY[0x263F08790]);
  v1 = (void *)_dateFormatter___dateFormatter_0;
  _dateFormatter___dateFormatter_0 = (uint64_t)v0;

  v2 = (void *)_dateFormatter___dateFormatter_0;

  return [v2 setDateFormat:@"yyyy-MM-dd HH:mm:ss'.'SSS Z"];
}

- (UNCNotificationScheduleRepository)initWithDirectory:(id)a3 librarian:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  v8 = [[UNCKeyedDictionaryRepository alloc] initWithDirectory:v7 fileName:@"Schedule" pathExtension:@"plist" librarian:v6];

  v14.receiver = self;
  v14.super_class = (Class)UNCNotificationScheduleRepository;
  v9 = [(UNCNotificationScheduleRepository *)&v14 init];
  if (v9)
  {
    v10 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    dispatch_queue_t v11 = dispatch_queue_create("com.apple.usernotificationsserver.ScheduleRepository", v10);
    queue = v9->_queue;
    v9->_queue = (OS_dispatch_queue *)v11;

    objc_storeStrong((id *)&v9->_repository, v8);
  }

  return v9;
}

- (id)allBundleIdentifiers
{
  uint64_t v6 = 0;
  id v7 = &v6;
  uint64_t v8 = 0x3032000000;
  v9 = __Block_byref_object_copy__10;
  v10 = __Block_byref_object_dispose__10;
  id v11 = 0;
  queue = self->_queue;
  v5[0] = MEMORY[0x263EF8330];
  v5[1] = 3221225472;
  v5[2] = __57__UNCNotificationScheduleRepository_allBundleIdentifiers__block_invoke;
  v5[3] = &unk_265567600;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(queue, v5);
  id v3 = (id)v7[5];
  _Block_object_dispose(&v6, 8);

  return v3;
}

uint64_t __57__UNCNotificationScheduleRepository_allBundleIdentifiers__block_invoke(uint64_t a1)
{
  *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 40) = [*(id *)(*(void *)(a1 + 32) + 8) allKeys];

  return MEMORY[0x270F9A758]();
}

- (id)scheduleForBundleIdentifier:(id)a3
{
  id v4 = a3;
  uint64_t v12 = 0;
  v13 = &v12;
  uint64_t v14 = 0x3032000000;
  v15 = __Block_byref_object_copy__10;
  v16 = __Block_byref_object_dispose__10;
  id v17 = 0;
  queue = self->_queue;
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __65__UNCNotificationScheduleRepository_scheduleForBundleIdentifier___block_invoke;
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

uint64_t __65__UNCNotificationScheduleRepository_scheduleForBundleIdentifier___block_invoke(uint64_t a1)
{
  *(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 40) = objc_msgSend(*(id *)(a1 + 32), "_queue_scheduleForBundleIdentifier:", *(void *)(a1 + 40));

  return MEMORY[0x270F9A758]();
}

- (void)setSchedule:(id)a3 forBundleIdentifier:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  queue = self->_queue;
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __69__UNCNotificationScheduleRepository_setSchedule_forBundleIdentifier___block_invoke;
  block[3] = &unk_2655676D8;
  block[4] = self;
  id v12 = v6;
  id v13 = v7;
  id v9 = v7;
  id v10 = v6;
  dispatch_async(queue, block);
}

uint64_t __69__UNCNotificationScheduleRepository_setSchedule_forBundleIdentifier___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_queue_setSchedule:forBundleIdentifier:", *(void *)(a1 + 40), *(void *)(a1 + 48));
}

- (void)removeScheduleForBundleIdentifier:(id)a3
{
  id v4 = a3;
  queue = self->_queue;
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __71__UNCNotificationScheduleRepository_removeScheduleForBundleIdentifier___block_invoke;
  v7[3] = &unk_265567628;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(queue, v7);
}

uint64_t __71__UNCNotificationScheduleRepository_removeScheduleForBundleIdentifier___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_queue_removeScheduleForBundleIdentifier:", *(void *)(a1 + 40));
}

- (void)notificationSourcesDidUninstall:(id)a3
{
  id v4 = a3;
  queue = self->_queue;
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __69__UNCNotificationScheduleRepository_notificationSourcesDidUninstall___block_invoke;
  v7[3] = &unk_265567628;
  id v8 = v4;
  id v9 = self;
  id v6 = v4;
  dispatch_sync(queue, v7);
}

void __69__UNCNotificationScheduleRepository_notificationSourcesDidUninstall___block_invoke(uint64_t a1)
{
  uint64_t v14 = *MEMORY[0x263EF8340];
  long long v9 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  id v2 = *(id *)(a1 + 32);
  uint64_t v3 = [v2 countByEnumeratingWithState:&v9 objects:v13 count:16];
  if (v3)
  {
    uint64_t v4 = v3;
    uint64_t v5 = *(void *)v10;
    do
    {
      uint64_t v6 = 0;
      do
      {
        if (*(void *)v10 != v5) {
          objc_enumerationMutation(v2);
        }
        id v7 = *(void **)(a1 + 40);
        id v8 = objc_msgSend(*(id *)(*((void *)&v9 + 1) + 8 * v6), "bundleIdentifier", (void)v9);
        objc_msgSend(v7, "_queue_removeScheduleForBundleIdentifier:", v8);

        ++v6;
      }
      while (v4 != v6);
      uint64_t v4 = [v2 countByEnumeratingWithState:&v9 objects:v13 count:16];
    }
    while (v4);
  }
}

- (id)_queue_scheduleForBundleIdentifier:(id)a3
{
  uint64_t v16 = *MEMORY[0x263EF8340];
  id v4 = a3;
  uint64_t v5 = [(UNCKeyedDictionaryRepository *)self->_repository dictionaryForKey:v4];
  if (v5)
  {
    uint64_t v6 = (*((void (**)(uint64_t, void *))UNSDictionaryToUNCNotificationSchedule + 2))((uint64_t)UNSDictionaryToUNCNotificationSchedule, v5);
  }
  else
  {
    uint64_t v6 = 0;
  }
  id v7 = [v6 previousTriggerDate];
  if (v7)
  {
    id v8 = [(UNCNotificationScheduleRepository *)self _dateFormatter];
    long long v9 = [v8 stringFromDate:v7];
  }
  else
  {
    long long v9 = 0;
  }
  long long v10 = *MEMORY[0x263F1E040];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x263F1E040], OS_LOG_TYPE_DEFAULT))
  {
    int v12 = 138543618;
    id v13 = v4;
    __int16 v14 = 2114;
    v15 = v9;
    _os_log_impl(&dword_2608DB000, v10, OS_LOG_TYPE_DEFAULT, "[%{public}@] Load last local notification fire date: %{public}@", (uint8_t *)&v12, 0x16u);
  }

  return v6;
}

- (void)_queue_setSchedule:(id)a3 forBundleIdentifier:(id)a4
{
  repository = self->_repository;
  uint64_t v6 = UNCNotificationScheduleToDictionary;
  id v7 = (void (*)(uint64_t, void *))*((void *)UNCNotificationScheduleToDictionary + 2);
  id v8 = a4;
  v7((uint64_t)v6, a3);
  id v9 = (id)objc_claimAutoreleasedReturnValue();
  [(UNCKeyedDictionaryRepository *)repository setDictionary:v9 forKey:v8];
}

- (void)_queue_removeScheduleForBundleIdentifier:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_queue, 0);

  objc_storeStrong((id *)&self->_repository, 0);
}

@end