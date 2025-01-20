@interface MODispatcher
- (MODispatcher)initWithNotifier:(id)a3;
- (void)onNotification:(int)a3 withPayload:(id)a4;
- (void)registerForNotification:(int)a3 withHandler:(id)a4;
- (void)unregisterForNotification:(int)a3;
@end

@implementation MODispatcher

- (MODispatcher)initWithNotifier:(id)a3
{
  id v5 = a3;
  v15.receiver = self;
  v15.super_class = (Class)MODispatcher;
  v6 = [(MODispatcher *)&v15 init];
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_notifier, a3);
    uint64_t v8 = objc_opt_new();
    handlerMap = v7->_handlerMap;
    v7->_handlerMap = (NSMutableDictionary *)v8;

    v10 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    dispatch_queue_t v11 = dispatch_queue_create("MODispatcher", v10);
    queue = v7->_queue;
    v7->_queue = (OS_dispatch_queue *)v11;

    v13 = v7;
  }

  return v7;
}

- (void)registerForNotification:(int)a3 withHandler:(id)a4
{
  id v6 = a4;
  objc_initWeak(&location, self);
  queue = self->_queue;
  v9[0] = _NSConcreteStackBlock;
  v9[1] = 3221225472;
  v9[2] = __52__MODispatcher_registerForNotification_withHandler___block_invoke;
  v9[3] = &unk_1002D0E60;
  objc_copyWeak(&v11, &location);
  int v12 = a3;
  id v10 = v6;
  id v8 = v6;
  dispatch_async(queue, v9);

  objc_destroyWeak(&v11);
  objc_destroyWeak(&location);
}

void __52__MODispatcher_registerForNotification_withHandler___block_invoke(uint64_t a1)
{
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  if (WeakRetained)
  {
    id v10 = WeakRetained;
    v3 = (void *)WeakRetained[2];
    v4 = +[NSNumber numberWithInt:*(unsigned int *)(a1 + 48)];
    id v5 = [v3 objectForKey:v4];
    if (v5)
    {
    }
    else
    {
      uint64_t v6 = *(void *)(a1 + 32);

      WeakRetained = v10;
      if (!v6) {
        goto LABEL_7;
      }
      v7 = (void *)*((void *)v10 + 2);
      id v8 = objc_retainBlock(*(id *)(a1 + 32));
      v9 = +[NSNumber numberWithInt:*(unsigned int *)(a1 + 48)];
      [v7 setObject:v8 forKey:v9];

      [*((id *)v10 + 1) registerDispatcher:v10 forNotification:*(unsigned int *)(a1 + 48)];
    }
    WeakRetained = v10;
  }
LABEL_7:
}

- (void)unregisterForNotification:(int)a3
{
  objc_initWeak(&location, self);
  queue = self->_queue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = __42__MODispatcher_unregisterForNotification___block_invoke;
  block[3] = &unk_1002D0E88;
  objc_copyWeak(&v7, &location);
  int v8 = a3;
  dispatch_async(queue, block);
  objc_destroyWeak(&v7);
  objc_destroyWeak(&location);
}

void __42__MODispatcher_unregisterForNotification___block_invoke(uint64_t a1)
{
  WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    id v3 = WeakRetained[2];
    id v5 = WeakRetained;
    v4 = +[NSNumber numberWithInt:*(unsigned int *)(a1 + 40)];
    [v3 removeObjectForKey:v4];

    [v5[1] unregisterDispatcher:v5];
    WeakRetained = v5;
  }
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_queue, 0);
  objc_storeStrong((id *)&self->_handlerMap, 0);

  objc_storeStrong((id *)&self->_notifier, 0);
}

- (void)onNotification:(int)a3 withPayload:(id)a4
{
  id v6 = a4;
  objc_initWeak(&location, self);
  queue = self->_queue;
  v9[0] = _NSConcreteStackBlock;
  v9[1] = 3221225472;
  v9[2] = __62__MODispatcher_MONotifierUtility__onNotification_withPayload___block_invoke;
  v9[3] = &unk_1002D0EB0;
  objc_copyWeak(&v11, &location);
  int v12 = a3;
  id v10 = v6;
  id v8 = v6;
  dispatch_async(queue, v9);

  objc_destroyWeak(&v11);
  objc_destroyWeak(&location);
}

void __62__MODispatcher_MONotifierUtility__onNotification_withPayload___block_invoke(uint64_t a1)
{
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  if (WeakRetained)
  {
    id v6 = WeakRetained;
    id v3 = (void *)WeakRetained[2];
    v4 = +[NSNumber numberWithInt:*(unsigned int *)(a1 + 48)];
    id v5 = [v3 objectForKey:v4];

    if (v5) {
      v5[2](v5, *(unsigned int *)(a1 + 48), *(void *)(a1 + 32));
    }

    WeakRetained = v6;
  }
}

@end