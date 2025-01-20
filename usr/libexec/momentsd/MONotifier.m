@interface MONotifier
+ (BOOL)isAvailable;
- (BOOL)isEnabled;
- (MONotifier)initWithName:(id)a3;
- (id)queue;
- (unint64_t)observerCount;
- (void)notify:(int)a3 withPayload:(id)a4;
- (void)notifyAndPersist:(int)a3 withPayload:(id)a4;
- (void)registerDispatcher:(id)a3 forNotification:(int)a4;
- (void)unregisterDispatcher:(id)a3;
@end

@implementation MONotifier

+ (BOOL)isAvailable
{
  if (isAvailable_pred != -1) {
    dispatch_once(&isAvailable_pred, &__block_literal_global_25);
  }
  return isAvailable_available;
}

void __25__MONotifier_isAvailable__block_invoke(id a1)
{
  isAvailable_available = 1;
}

- (id)queue
{
  return self->_queue;
}

- (BOOL)isEnabled
{
  return self->_enabled;
}

- (unint64_t)observerCount
{
  uint64_t v6 = 0;
  v7 = &v6;
  uint64_t v8 = 0x2020000000;
  uint64_t v9 = 0;
  queue = self->_queue;
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472;
  v5[2] = __27__MONotifier_observerCount__block_invoke;
  v5[3] = &unk_1002CEC88;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(queue, v5);
  unint64_t v3 = v7[3];
  _Block_object_dispose(&v6, 8);
  return v3;
}

id __27__MONotifier_observerCount__block_invoke(uint64_t a1)
{
  id result = [*(id *)(*(void *)(a1 + 32) + 16) count];
  *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = result;
  return result;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_persistedPayload, 0);
  objc_storeStrong((id *)&self->_dispatchers, 0);

  objc_storeStrong((id *)&self->_queue, 0);
}

- (MONotifier)initWithName:(id)a3
{
  id v4 = a3;
  v18.receiver = self;
  v18.super_class = (Class)MONotifier;
  v5 = [(MONotifier *)&v18 init];
  if (v5)
  {
    if (v4 && [v4 length])
    {
      uint64_t v6 = +[NSString stringWithFormat:@"com.apple.momentsd:%@", v4];
    }
    else
    {
      uint64_t v6 = @"com.apple.momentsd:anonymous";
    }
    v5->_enabled = 0;
    uint64_t v7 = objc_opt_new();
    dispatchers = v5->_dispatchers;
    v5->_dispatchers = (NSMutableArray *)v7;

    uint64_t v9 = objc_opt_new();
    persistedPayload = v5->_persistedPayload;
    v5->_persistedPayload = (NSMutableDictionary *)v9;

    v11 = v6;
    v12 = (const char *)[(__CFString *)v11 UTF8String];
    v13 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    dispatch_queue_t v14 = dispatch_queue_create(v12, v13);
    queue = v5->_queue;
    v5->_queue = (OS_dispatch_queue *)v14;

    v16 = v5;
  }

  return v5;
}

- (void)notify:(int)a3 withPayload:(id)a4
{
  id v6 = a4;
  queue = self->_queue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = __59__MONotifier_MODerivedNotifierUtility__notify_withPayload___block_invoke;
  block[3] = &unk_1002CECB0;
  block[4] = self;
  id v10 = v6;
  int v11 = a3;
  id v8 = v6;
  dispatch_async(queue, block);
}

void __59__MONotifier_MODerivedNotifierUtility__notify_withPayload___block_invoke(uint64_t a1)
{
  long long v11 = 0u;
  long long v12 = 0u;
  long long v9 = 0u;
  long long v10 = 0u;
  id v2 = *(id *)(*(void *)(a1 + 32) + 16);
  id v3 = [v2 countByEnumeratingWithState:&v9 objects:v13 count:16];
  if (v3)
  {
    id v4 = v3;
    uint64_t v5 = *(void *)v10;
    do
    {
      id v6 = 0;
      do
      {
        if (*(void *)v10 != v5) {
          objc_enumerationMutation(v2);
        }
        uint64_t v7 = *(void **)(*((void *)&v9 + 1) + 8 * (void)v6);
        id v8 = [[*(id *)(a1 + 40) copy];
        [v7 onNotification:*(unsigned int *)(a1 + 48) withPayload:v8];

        id v6 = (char *)v6 + 1;
      }
      while (v4 != v6);
      id v4 = [v2 countByEnumeratingWithState:&v9 objects:v13 count:16];
    }
    while (v4);
  }
}

- (void)notifyAndPersist:(int)a3 withPayload:(id)a4
{
  id v6 = a4;
  queue = self->_queue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = __69__MONotifier_MODerivedNotifierUtility__notifyAndPersist_withPayload___block_invoke;
  block[3] = &unk_1002CECB0;
  int v11 = a3;
  block[4] = self;
  id v10 = v6;
  id v8 = v6;
  dispatch_async(queue, block);
}

void __69__MONotifier_MODerivedNotifierUtility__notifyAndPersist_withPayload___block_invoke(uint64_t a1)
{
  [*(id *)(a1 + 32) notify:*(unsigned int *)(a1 + 48) withPayload:*(void *)(a1 + 40)];
  id v4 = [*(id *)(a1 + 40) copy];
  id v2 = *(void **)(*(void *)(a1 + 32) + 24);
  id v3 = +[NSNumber numberWithInt:*(unsigned int *)(a1 + 48)];
  [v2 setObject:v4 forKey:v3];
}

- (void)registerDispatcher:(id)a3 forNotification:(int)a4
{
  id v7 = a3;
  queue = self->_queue;
  if (!queue)
  {
    long long v9 = _mo_log_facility_get_os_log(&MOLogFacilityGeneral);
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR)) {
      -[MONotifier(MODispatcherUtility) registerDispatcher:forNotification:]();
    }

    id v10 = +[NSAssertionHandler currentHandler];
    [v10 handleFailureInMethod:a2 object:self file:@"MONotifier.m" lineNumber:117 description:@"Notifier does not have a dispatch queue - did you init with name ? (in %s:%d)", "-[MONotifier(MODispatcherUtility) registerDispatcher:forNotification:]", 117];

    queue = self->_queue;
  }
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = __70__MONotifier_MODispatcherUtility__registerDispatcher_forNotification___block_invoke;
  block[3] = &unk_1002CECB0;
  block[4] = self;
  id v13 = v7;
  int v14 = a4;
  id v11 = v7;
  dispatch_sync(queue, block);
}

void __70__MONotifier_MODispatcherUtility__registerDispatcher_forNotification___block_invoke(uint64_t a1)
{
  unsigned __int8 v2 = [*(id *)(*(void *)(a1 + 32) + 16) containsObject:*(void *)(a1 + 40)];
  uint64_t v3 = *(void *)(a1 + 32);
  if ((v2 & 1) == 0)
  {
    [*(id *)(v3 + 16) addObject:*(void *)(a1 + 40)];
    [*(id *)(a1 + 32) onObserverCountChange:[*(id *)(*(void *)(a1 + 32) + 16) count]];
    id v4 = [*(id *)(*(void *)(a1 + 32) + 16) count];
    uint64_t v3 = *(void *)(a1 + 32);
    if (v4)
    {
      if (!*(unsigned char *)(v3 + 32))
      {
        *(unsigned char *)(v3 + 32) = 1;
        [*(id *)(a1 + 32) onEnable];
        uint64_t v3 = *(void *)(a1 + 32);
      }
    }
  }
  uint64_t v5 = *(void **)(v3 + 24);
  id v6 = +[NSNumber numberWithInt:*(unsigned int *)(a1 + 48)];
  id v9 = [v5 objectForKey:v6];

  id v7 = v9;
  if (v9)
  {
    id v8 = [v9 copy];
    [*(id *)(a1 + 40) onNotification:*(unsigned int *)(a1 + 48) withPayload:v8];

    id v7 = v9;
  }
}

- (void)unregisterDispatcher:(id)a3
{
  id v5 = a3;
  queue = self->_queue;
  if (!queue)
  {
    id v7 = _mo_log_facility_get_os_log(&MOLogFacilityGeneral);
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR)) {
      -[MONotifier(MODispatcherUtility) unregisterDispatcher:]();
    }

    id v8 = +[NSAssertionHandler currentHandler];
    [v8 handleFailureInMethod:a2 object:self file:@"MONotifier.m" lineNumber:137 description:@"Notifier does not have a dispatch queue - did you init with name ? (in %s:%d)", "-[MONotifier(MODispatcherUtility) unregisterDispatcher:]", 137];

    queue = self->_queue;
  }
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = __56__MONotifier_MODispatcherUtility__unregisterDispatcher___block_invoke;
  block[3] = &unk_1002C9518;
  block[4] = self;
  id v11 = v5;
  id v9 = v5;
  dispatch_sync(queue, block);
}

id __56__MONotifier_MODispatcherUtility__unregisterDispatcher___block_invoke(uint64_t a1)
{
  id result = [*(id *)(*(void *)(a1 + 32) + 16) containsObject:*(void *)(a1 + 40)];
  if (result)
  {
    [*(id *)(*(void *)(a1 + 32) + 16) removeObject:*(void *)(a1 + 40)];
    [*(id *)(a1 + 32) onObserverCountChange:[*(id *)(*(void *)(a1 + 32) + 16) count]];
    id result = [*(id *)(*(void *)(a1 + 32) + 16) count];
    if (!result)
    {
      uint64_t v3 = *(void *)(a1 + 32);
      if (*(unsigned char *)(v3 + 32))
      {
        *(unsigned char *)(v3 + 32) = 0;
        id v4 = *(void **)(a1 + 32);
        return [v4 onDisable];
      }
    }
  }
  return result;
}

@end