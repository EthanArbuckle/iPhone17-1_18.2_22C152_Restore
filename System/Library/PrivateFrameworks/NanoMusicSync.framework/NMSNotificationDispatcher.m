@interface NMSNotificationDispatcher
- (NMSNotificationDispatcher)initWithNotificationName:(id)a3;
- (NMSNotificationDispatcherDelegate)delegate;
- (NSString)baseNotificationName;
- (void)_handleLocalNotificationIgnoringSenderPID:(BOOL)a3;
- (void)_handleRemoteNotification;
- (void)_postLocalDarwinNotification;
- (void)beginWaitingForUpdates;
- (void)dealloc;
- (void)endWaitingForUpdates;
- (void)scheduleLocalDarwinNotification;
- (void)setDelegate:(id)a3;
@end

@implementation NMSNotificationDispatcher

- (NMSNotificationDispatcher)initWithNotificationName:(id)a3
{
  id v5 = a3;
  v25.receiver = self;
  v25.super_class = (Class)NMSNotificationDispatcher;
  v6 = [(NMSNotificationDispatcher *)&v25 init];
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_baseNotificationName, a3);
    uint64_t v8 = [v5 stringByAppendingString:@".local"];
    localDarwinNotificationName = v7->_localDarwinNotificationName;
    v7->_localDarwinNotificationName = (NSString *)v8;

    uint64_t v10 = [v5 stringByAppendingString:@".remote"];
    remoteDarwinNotificationName = v7->_remoteDarwinNotificationName;
    v7->_remoteDarwinNotificationName = (NSString *)v10;

    v12 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    dispatch_queue_t v13 = dispatch_queue_create("com.apple.NanoMusicSync.NotificationDispatcher", v12);
    queue = v7->_queue;
    v7->_queue = (OS_dispatch_queue *)v13;

    objc_initWeak(&location, v7);
    v7->_localNotifyToken = -1;
    v15 = [(NSString *)v7->_localDarwinNotificationName UTF8String];
    v16 = v7->_queue;
    handler[0] = MEMORY[0x263EF8330];
    handler[1] = 3221225472;
    handler[2] = __54__NMSNotificationDispatcher_initWithNotificationName___block_invoke;
    handler[3] = &unk_264634138;
    objc_copyWeak(&v23, &location);
    notify_register_dispatch(v15, &v7->_localNotifyToken, v16, handler);
    v7->_remoteNotifyToken = -1;
    v17 = [(NSString *)v7->_remoteDarwinNotificationName UTF8String];
    v18 = v7->_queue;
    v20[0] = MEMORY[0x263EF8330];
    v20[1] = 3221225472;
    v20[2] = __54__NMSNotificationDispatcher_initWithNotificationName___block_invoke_2;
    v20[3] = &unk_264634138;
    objc_copyWeak(&v21, &location);
    notify_register_dispatch(v17, &v7->_remoteNotifyToken, v18, v20);
    objc_destroyWeak(&v21);
    objc_destroyWeak(&v23);
    objc_destroyWeak(&location);
  }

  return v7;
}

void __54__NMSNotificationDispatcher_initWithNotificationName___block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained _handleLocalNotificationIgnoringSenderPID:0];
}

void __54__NMSNotificationDispatcher_initWithNotificationName___block_invoke_2(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained _handleRemoteNotification];
}

- (void)dealloc
{
  if (notify_is_valid_token(self->_localNotifyToken)) {
    notify_cancel(self->_localNotifyToken);
  }
  if (notify_is_valid_token(self->_remoteNotifyToken)) {
    notify_cancel(self->_remoteNotifyToken);
  }
  v3.receiver = self;
  v3.super_class = (Class)NMSNotificationDispatcher;
  [(NMSNotificationDispatcher *)&v3 dealloc];
}

- (void)scheduleLocalDarwinNotification
{
  queue = self->_queue;
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __60__NMSNotificationDispatcher_scheduleLocalDarwinNotification__block_invoke;
  block[3] = &unk_264633B20;
  block[4] = self;
  dispatch_async(queue, block);
}

uint64_t __60__NMSNotificationDispatcher_scheduleLocalDarwinNotification__block_invoke(uint64_t a1)
{
  uint64_t result = *(void *)(a1 + 32);
  if (!*(void *)(result + 32)) {
    return [(id)result _postLocalDarwinNotification];
  }
  *(unsigned char *)(result + 40) = 1;
  return result;
}

- (void)beginWaitingForUpdates
{
  queue = self->_queue;
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __51__NMSNotificationDispatcher_beginWaitingForUpdates__block_invoke;
  block[3] = &unk_264633B20;
  block[4] = self;
  dispatch_async(queue, block);
}

uint64_t __51__NMSNotificationDispatcher_beginWaitingForUpdates__block_invoke(uint64_t result)
{
  return result;
}

- (void)endWaitingForUpdates
{
  queue = self->_queue;
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __49__NMSNotificationDispatcher_endWaitingForUpdates__block_invoke;
  block[3] = &unk_264633B20;
  block[4] = self;
  dispatch_async(queue, block);
}

uint64_t __49__NMSNotificationDispatcher_endWaitingForUpdates__block_invoke(uint64_t result)
{
  --*(void *)(*(void *)(result + 32) + 32);
  uint64_t v1 = *(void *)(result + 32);
  if (!*(void *)(v1 + 32))
  {
    if (*(unsigned char *)(v1 + 40))
    {
      *(unsigned char *)(v1 + 40) = 0;
      return [*(id *)(result + 32) _postLocalDarwinNotification];
    }
  }
  return result;
}

- (void)_handleLocalNotificationIgnoringSenderPID:(BOOL)a3
{
  uint64_t v15 = *MEMORY[0x263EF8340];
  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  v4 = NMLogForCategory(5);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    localDarwinNotificationName = self->_localDarwinNotificationName;
    *(_DWORD *)buf = 138412290;
    *(void *)&buf[4] = localDarwinNotificationName;
    _os_log_impl(&dword_2228FD000, v4, OS_LOG_TYPE_DEFAULT, "[NMSyncDefaults] Received notification: %@", buf, 0xCu);
  }

  *(void *)buf = 0;
  uint64_t v6 = getpid();
  notify_get_state(self->_localNotifyToken, (uint64_t *)buf);
  uint64_t v7 = *(void *)buf;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  if (v7 == v6)
  {
    char v9 = objc_opt_respondsToSelector();

    if (v9)
    {
      id v10 = objc_loadWeakRetained((id *)&self->_delegate);
      [v10 dispatcherDidReceiveNotificationFromCurrentProcess:self];
LABEL_8:
    }
  }
  else
  {
    char v11 = objc_opt_respondsToSelector();

    if (v11)
    {
      id v10 = objc_loadWeakRetained((id *)&self->_delegate);
      [v10 dispatcherDidReceiveNotificationFromOtherProcess:self];
      goto LABEL_8;
    }
  }
  v12[0] = MEMORY[0x263EF8330];
  v12[1] = 3221225472;
  v12[2] = __71__NMSNotificationDispatcher__handleLocalNotificationIgnoringSenderPID___block_invoke;
  v12[3] = &unk_264634428;
  v12[4] = self;
  BOOL v13 = v7 == v6;
  dispatch_async(MEMORY[0x263EF83A0], v12);
}

void __71__NMSNotificationDispatcher__handleLocalNotificationIgnoringSenderPID___block_invoke(uint64_t a1)
{
  v7[1] = *MEMORY[0x263EF8340];
  v2 = [MEMORY[0x263F08A00] defaultCenter];
  uint64_t v3 = *(void *)(*(void *)(a1 + 32) + 56);
  uint64_t v6 = @"IsInProcessNotification";
  v4 = [NSNumber numberWithBool:*(unsigned __int8 *)(a1 + 40)];
  v7[0] = v4;
  id v5 = [NSDictionary dictionaryWithObjects:v7 forKeys:&v6 count:1];
  [v2 postNotificationName:v3 object:0 userInfo:v5];
}

- (void)_handleRemoteNotification
{
  uint64_t v11 = *MEMORY[0x263EF8340];
  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  uint64_t v3 = NMLogForCategory(5);
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    remoteDarwinNotificationName = self->_remoteDarwinNotificationName;
    *(_DWORD *)buf = 138412290;
    id v10 = remoteDarwinNotificationName;
    _os_log_impl(&dword_2228FD000, v3, OS_LOG_TYPE_DEFAULT, "[NMSyncDefaults] Received notification: %@", buf, 0xCu);
  }

  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  char v6 = objc_opt_respondsToSelector();

  if (v6)
  {
    id v7 = objc_loadWeakRetained((id *)&self->_delegate);
    [v7 dispatcherDidReceiveNotificationFromRemoteDevice:self];
  }
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __54__NMSNotificationDispatcher__handleRemoteNotification__block_invoke;
  block[3] = &unk_264633B20;
  block[4] = self;
  dispatch_async(MEMORY[0x263EF83A0], block);
}

void __54__NMSNotificationDispatcher__handleRemoteNotification__block_invoke(uint64_t a1)
{
  v6[1] = *MEMORY[0x263EF8340];
  v2 = [MEMORY[0x263F08A00] defaultCenter];
  uint64_t v3 = *(void *)(*(void *)(a1 + 32) + 56);
  id v5 = @"IsInProcessNotification";
  v6[0] = MEMORY[0x263EFFA80];
  v4 = [NSDictionary dictionaryWithObjects:v6 forKeys:&v5 count:1];
  [v2 postNotificationName:v3 object:0 userInfo:v4];
}

- (void)_postLocalDarwinNotification
{
  uint64_t v9 = *MEMORY[0x263EF8340];
  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  uint64_t v3 = NMLogForCategory(5);
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    localDarwinNotificationName = self->_localDarwinNotificationName;
    int v7 = 138412290;
    uint64_t v8 = localDarwinNotificationName;
    _os_log_impl(&dword_2228FD000, v3, OS_LOG_TYPE_DEFAULT, "[NMSyncDefaults] Posting notification: %@", (uint8_t *)&v7, 0xCu);
  }

  int localNotifyToken = self->_localNotifyToken;
  pid_t v6 = getpid();
  notify_set_state(localNotifyToken, v6);
  notify_post([(NSString *)self->_localDarwinNotificationName UTF8String]);
}

- (NSString)baseNotificationName
{
  return self->_baseNotificationName;
}

- (NMSNotificationDispatcherDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  return (NMSNotificationDispatcherDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_baseNotificationName, 0);
  objc_storeStrong((id *)&self->_queue, 0);
  objc_storeStrong((id *)&self->_remoteDarwinNotificationName, 0);

  objc_storeStrong((id *)&self->_localDarwinNotificationName, 0);
}

@end