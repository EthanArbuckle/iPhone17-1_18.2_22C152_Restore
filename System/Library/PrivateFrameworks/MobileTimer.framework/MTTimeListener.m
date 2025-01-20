@interface MTTimeListener
- (BOOL)handlesNotification:(id)a3 ofType:(int64_t)a4;
- (MTObserverStore)observers;
- (MTTimeListener)init;
- (MTTimeListener)initWithCallbackScheduler:(id)a3;
- (NAScheduler)serializer;
- (OS_dispatch_queue)queue;
- (double)assertionTimeOutForNotification:(id)a3 ofType:(int64_t)a4;
- (void)handleNotification:(id)a3 ofType:(int64_t)a4 completion:(id)a5;
- (void)registerObserver:(id)a3;
- (void)setObservers:(id)a3;
- (void)setQueue:(id)a3;
- (void)setSerializer:(id)a3;
@end

@implementation MTTimeListener

- (MTTimeListener)init
{
  v3 = [MEMORY[0x1E4F7A0F0] mtMainThreadScheduler];
  v4 = [(MTTimeListener *)self initWithCallbackScheduler:v3];

  return v4;
}

- (MTTimeListener)initWithCallbackScheduler:(id)a3
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v12.receiver = self;
  v12.super_class = (Class)MTTimeListener;
  v5 = [(MTTimeListener *)&v12 init];
  if (v5)
  {
    v6 = MTLogForCategory(0);
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138543362;
      v14 = v5;
      _os_log_impl(&dword_19CC95000, v6, OS_LOG_TYPE_DEFAULT, "Initializing %{public}@", buf, 0xCu);
    }

    dispatch_queue_t v7 = dispatch_queue_create("com.apple.MTTimeListener.access-queue", 0);
    queue = v5->_queue;
    v5->_queue = (OS_dispatch_queue *)v7;

    v9 = [[MTObserverStore alloc] initWithCallbackScheduler:v4];
    observers = v5->_observers;
    v5->_observers = v9;
  }
  return v5;
}

- (BOOL)handlesNotification:(id)a3 ofType:(int64_t)a4
{
  return objc_msgSend(a3, "isEqualToString:", @"SignificantTimeChange", a4);
}

- (double)assertionTimeOutForNotification:(id)a3 ofType:(int64_t)a4
{
  int v4 = objc_msgSend(a3, "isEqualToString:", @"SignificantTimeChange", a4);
  double result = 60.0;
  if (!v4) {
    return 0.0;
  }
  return result;
}

- (void)handleNotification:(id)a3 ofType:(int64_t)a4 completion:(id)a5
{
  uint64_t v24 = *MEMORY[0x1E4F143B8];
  id v6 = a5;
  dispatch_queue_t v7 = MTLogForCategory(0);
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543362;
    v21 = self;
    _os_log_impl(&dword_19CC95000, v7, OS_LOG_TYPE_DEFAULT, "%{public}@ received significant time change notification. Notifying observers", buf, 0xCu);
  }

  [MEMORY[0x1E4F1CAF0] resetSystemTimeZone];
  v8 = MTLogForCategory(0);
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    v9 = [MEMORY[0x1E4F1CAF0] systemTimeZone];
    *(_DWORD *)buf = 138543618;
    v21 = self;
    __int16 v22 = 2114;
    v23 = v9;
    _os_log_impl(&dword_19CC95000, v8, OS_LOG_TYPE_DEFAULT, "%{public}@ timeZone: %{public}@", buf, 0x16u);
  }
  dispatch_group_t v10 = dispatch_group_create();
  v11 = [(MTTimeListener *)self observers];
  v17[0] = MEMORY[0x1E4F143A8];
  v17[1] = 3221225472;
  v17[2] = __55__MTTimeListener_handleNotification_ofType_completion___block_invoke;
  v17[3] = &unk_1E5917138;
  dispatch_group_t v18 = v10;
  v19 = self;
  objc_super v12 = v10;
  [v11 enumerateObserversWithBlock:v17];

  queue = self->_queue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __55__MTTimeListener_handleNotification_ofType_completion___block_invoke_3;
  block[3] = &unk_1E5915B68;
  id v16 = v6;
  id v14 = v6;
  dispatch_group_notify(v12, queue, block);
}

void __55__MTTimeListener_handleNotification_ofType_completion___block_invoke(uint64_t a1, void *a2)
{
  v3 = *(NSObject **)(a1 + 32);
  id v4 = a2;
  dispatch_group_enter(v3);
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __55__MTTimeListener_handleNotification_ofType_completion___block_invoke_2;
  v6[3] = &unk_1E59150A8;
  uint64_t v5 = *(void *)(a1 + 40);
  id v7 = *(id *)(a1 + 32);
  [v4 timeListener:v5 didDetectSignificantTimeChangeWithCompletionBlock:v6];
}

void __55__MTTimeListener_handleNotification_ofType_completion___block_invoke_2(uint64_t a1)
{
}

uint64_t __55__MTTimeListener_handleNotification_ofType_completion___block_invoke_3(uint64_t a1)
{
  uint64_t result = *(void *)(a1 + 32);
  if (result) {
    return (*(uint64_t (**)(void))(result + 16))();
  }
  return result;
}

- (void)registerObserver:(id)a3
{
  id v4 = a3;
  id v5 = [(MTTimeListener *)self observers];
  [v5 addObserver:v4];
}

- (NAScheduler)serializer
{
  return self->_serializer;
}

- (void)setSerializer:(id)a3
{
}

- (OS_dispatch_queue)queue
{
  return self->_queue;
}

- (void)setQueue:(id)a3
{
}

- (MTObserverStore)observers
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
  objc_storeStrong((id *)&self->_serializer, 0);
}

@end