@interface ASKRebootstrapCoordinator
+ (ASKRebootstrapCoordinator)sharedCoordinator;
- (ASKRebootstrapCoordinator)init;
- (ASKStorefrontChangeProvider)changeObserver;
- (BOOL)hasPendingNotification;
- (NSHashTable)handlerTokens;
- (id)appBootstrapHandler;
- (id)registerCleanupHandler:(id)a3;
- (int64_t)delayCount;
- (void)beginDelayingNotifications;
- (void)endDelayingNotifications;
- (void)notify;
- (void)removeCleanupHandler:(id)a3;
- (void)scheduleNotification;
- (void)setAppBootstrapHandler:(id)a3;
- (void)setDelayCount:(int64_t)a3;
- (void)setHasPendingNotification:(BOOL)a3;
@end

@implementation ASKRebootstrapCoordinator

+ (ASKRebootstrapCoordinator)sharedCoordinator
{
  if (sharedCoordinator_onceToken[0] != -1) {
    dispatch_once(sharedCoordinator_onceToken, &__block_literal_global_5);
  }
  v2 = (void *)sharedCoordinator_sharedCoordinator;

  return (ASKRebootstrapCoordinator *)v2;
}

void __46__ASKRebootstrapCoordinator_sharedCoordinator__block_invoke(id a1)
{
  sharedCoordinator_sharedCoordinator = objc_alloc_init(ASKRebootstrapCoordinator);

  _objc_release_x1();
}

- (ASKRebootstrapCoordinator)init
{
  v15.receiver = self;
  v15.super_class = (Class)ASKRebootstrapCoordinator;
  v2 = [(ASKRebootstrapCoordinator *)&v15 init];
  if (v2)
  {
    objc_initWeak(&location, v2);
    v3 = [ASKStorefrontChangeProvider alloc];
    v9 = _NSConcreteStackBlock;
    uint64_t v10 = 3221225472;
    v11 = __33__ASKRebootstrapCoordinator_init__block_invoke;
    v12 = &unk_471070;
    objc_copyWeak(&v13, &location);
    v4 = [(ASKStorefrontChangeProvider *)v3 initWithBlock:&v9];
    changeObserver = v2->_changeObserver;
    v2->_changeObserver = v4;

    uint64_t v6 = +[NSHashTable weakObjectsHashTable];
    handlerTokens = v2->_handlerTokens;
    v2->_handlerTokens = (NSHashTable *)v6;

    objc_destroyWeak(&v13);
    objc_destroyWeak(&location);
  }
  return v2;
}

void __33__ASKRebootstrapCoordinator_init__block_invoke(uint64_t a1)
{
  v2 = +[AMSLogConfig ask_generalLogConfig];
  if (!v2)
  {
    v2 = +[AMSLogConfig sharedConfig];
  }
  v3 = [v2 OSLogObject];
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG))
  {
    *(_WORD *)v5 = 0;
    _os_log_impl(&dword_0, v3, OS_LOG_TYPE_DEBUG, "Storefront change detected", v5, 2u);
  }

  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained performSelectorOnMainThread:"scheduleNotification" withObject:0 waitUntilDone:0];
}

- (void)scheduleNotification
{
  dispatch_assert_queue_V2((dispatch_queue_t)&_dispatch_main_q);
  +[NSObject cancelPreviousPerformRequestsWithTarget:self selector:"notify" object:0];
  if ([(ASKRebootstrapCoordinator *)self delayCount])
  {
    v3 = +[AMSLogConfig ask_generalLogConfig];
    if (!v3)
    {
      v3 = +[AMSLogConfig sharedConfig];
    }
    v4 = [v3 OSLogObject];
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG))
    {
      *(_WORD *)uint64_t v6 = 0;
      _os_log_impl(&dword_0, v4, OS_LOG_TYPE_DEBUG, "Deferring storefront change notification", v6, 2u);
    }

    [(ASKRebootstrapCoordinator *)self setHasPendingNotification:1];
  }
  else
  {
    NSRunLoopMode v7 = NSRunLoopCommonModes;
    v5 = +[NSArray arrayWithObjects:&v7 count:1];
    [(ASKRebootstrapCoordinator *)self performSelector:"notify" withObject:0 afterDelay:v5 inModes:1.0];
  }
}

- (void)notify
{
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  v3 = [(ASKRebootstrapCoordinator *)self handlerTokens];
  id v4 = [v3 copy];

  id v5 = [v4 countByEnumeratingWithState:&v12 objects:v16 count:16];
  if (v5)
  {
    id v6 = v5;
    uint64_t v7 = *(void *)v13;
    do
    {
      v8 = 0;
      do
      {
        if (*(void *)v13 != v7) {
          objc_enumerationMutation(v4);
        }
        v9 = [*(id *)(*((void *)&v12 + 1) + 8 * (void)v8) handler];
        v9[2]();

        v8 = (char *)v8 + 1;
      }
      while (v6 != v8);
      id v6 = [v4 countByEnumeratingWithState:&v12 objects:v16 count:16];
    }
    while (v6);
  }

  uint64_t v10 = [(ASKRebootstrapCoordinator *)self appBootstrapHandler];

  if (v10)
  {
    v11 = [(ASKRebootstrapCoordinator *)self appBootstrapHandler];
    v11[2]();
  }
}

- (void)beginDelayingNotifications
{
  v3 = (char *)[(ASKRebootstrapCoordinator *)self delayCount] + 1;

  [(ASKRebootstrapCoordinator *)self setDelayCount:v3];
}

- (void)endDelayingNotifications
{
  if ([(ASKRebootstrapCoordinator *)self delayCount])
  {
    [(ASKRebootstrapCoordinator *)self setDelayCount:(char *)[(ASKRebootstrapCoordinator *)self delayCount] - 1];
    if (![(ASKRebootstrapCoordinator *)self delayCount])
    {
      if ([(ASKRebootstrapCoordinator *)self hasPendingNotification])
      {
        v3 = +[AMSLogConfig ask_generalLogConfig];
        if (!v3)
        {
          v3 = +[AMSLogConfig sharedConfig];
        }
        id v4 = [v3 OSLogObject];
        if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG))
        {
          *(_WORD *)id v5 = 0;
          _os_log_impl(&dword_0, v4, OS_LOG_TYPE_DEBUG, "Flushing deferred storefront change notification", v5, 2u);
        }

        [(ASKRebootstrapCoordinator *)self performSelector:"notify" withObject:0 afterDelay:0.0];
        [(ASKRebootstrapCoordinator *)self setHasPendingNotification:0];
      }
    }
  }
}

- (id)registerCleanupHandler:(id)a3
{
  id v4 = a3;
  id v5 = [[ASKStorefrontChangeHandlerToken alloc] initWithHandler:v4];

  id v6 = [(ASKRebootstrapCoordinator *)self handlerTokens];
  [v6 addObject:v5];

  return v5;
}

- (void)removeCleanupHandler:(id)a3
{
  id v4 = a3;
  id v5 = [(ASKRebootstrapCoordinator *)self handlerTokens];
  [v5 removeObject:v4];
}

- (ASKStorefrontChangeProvider)changeObserver
{
  return self->_changeObserver;
}

- (NSHashTable)handlerTokens
{
  return self->_handlerTokens;
}

- (id)appBootstrapHandler
{
  return self->_appBootstrapHandler;
}

- (void)setAppBootstrapHandler:(id)a3
{
}

- (int64_t)delayCount
{
  return self->_delayCount;
}

- (void)setDelayCount:(int64_t)a3
{
  self->_delayCount = a3;
}

- (BOOL)hasPendingNotification
{
  return self->_hasPendingNotification;
}

- (void)setHasPendingNotification:(BOOL)a3
{
  self->_hasPendingNotification = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_appBootstrapHandler, 0);
  objc_storeStrong((id *)&self->_handlerTokens, 0);

  objc_storeStrong((id *)&self->_changeObserver, 0);
}

@end