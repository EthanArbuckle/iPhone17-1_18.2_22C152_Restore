@interface MSVDistributedNotificationObserver
+ (id)observerWithDistributedName:(id)a3 localName:(id)a4 queue:(id)a5;
- (MSVDistributedNotificationObserver)init;
- (MSVDistributedNotificationObserver)initWithDistributedName:(id)a3 localName:(id)a4 queue:(id)a5;
- (MSVDistributedNotificationObserverDelegate)delegate;
- (NSDictionary)userInfoForLocalNotification;
- (NSString)distributedName;
- (NSString)localName;
- (OS_dispatch_queue)queue;
- (int)notifyToken;
- (void)_handleDistributedNotificationWithNotifyToken:(int)a3;
- (void)dealloc;
- (void)setDelegate:(id)a3;
- (void)setUserInfoForLocalNotification:(id)a3;
@end

@implementation MSVDistributedNotificationObserver

- (void)setDelegate:(id)a3
{
}

+ (id)observerWithDistributedName:(id)a3 localName:(id)a4 queue:(id)a5
{
  id v7 = a5;
  id v8 = a4;
  id v9 = a3;
  v10 = (void *)[objc_alloc((Class)objc_opt_class()) initWithDistributedName:v9 localName:v8 queue:v7];

  return v10;
}

- (MSVDistributedNotificationObserver)initWithDistributedName:(id)a3 localName:(id)a4 queue:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  v30.receiver = self;
  v30.super_class = (Class)MSVDistributedNotificationObserver;
  v11 = [(MSVDistributedNotificationObserver *)&v30 init];
  if (v11)
  {
    uint64_t v12 = [v8 copy];
    distributedName = v11->_distributedName;
    v11->_distributedName = (NSString *)v12;

    uint64_t v14 = [v9 copy];
    localName = v11->_localName;
    v11->_localName = (NSString *)v14;

    if (v10)
    {
      v16 = (OS_dispatch_queue *)v10;
      queue = v11->_queue;
      v11->_queue = v16;
    }
    else
    {
      v18 = (OS_dispatch_queue *)MEMORY[0x1E4F14428];
      id v19 = MEMORY[0x1E4F14428];
      queue = v11->_queue;
      v11->_queue = v18;
    }

    objc_initWeak(&location, v11);
    v20 = [(NSString *)v11->_distributedName UTF8String];
    v21 = v11->_queue;
    uint64_t handler = MEMORY[0x1E4F143A8];
    uint64_t v25 = 3221225472;
    v26 = __78__MSVDistributedNotificationObserver_initWithDistributedName_localName_queue___block_invoke;
    v27 = &unk_1E5AD9828;
    objc_copyWeak(&v28, &location);
    uint64_t v22 = notify_register_dispatch(v20, &v11->_notifyToken, v21, &handler);
    if (v22) {
      NSLog(&cfstr_ErrorRegisteri.isa, v11->_distributedName, v22, handler, v25, v26, v27);
    }
    objc_destroyWeak(&v28);
    objc_destroyWeak(&location);
  }

  return v11;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_userInfoForLocalNotification, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_queue, 0);
  objc_storeStrong((id *)&self->_localName, 0);
  objc_storeStrong((id *)&self->_distributedName, 0);
}

- (void)setUserInfoForLocalNotification:(id)a3
{
}

- (NSDictionary)userInfoForLocalNotification
{
  return self->_userInfoForLocalNotification;
}

- (MSVDistributedNotificationObserverDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  return (MSVDistributedNotificationObserverDelegate *)WeakRetained;
}

- (OS_dispatch_queue)queue
{
  return self->_queue;
}

- (NSString)localName
{
  return self->_localName;
}

- (NSString)distributedName
{
  return self->_distributedName;
}

- (void)_handleDistributedNotificationWithNotifyToken:(int)a3
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  if ((objc_opt_respondsToSelector() & 1) == 0
    || [WeakRetained observerShouldForwardDistributedNotification:self])
  {
    v4 = [MEMORY[0x1E4F28EB8] defaultCenter];
    v5 = [(MSVDistributedNotificationObserver *)self userInfoForLocalNotification];
    [v4 postNotificationName:self->_localName object:self userInfo:v5];
  }
}

- (int)notifyToken
{
  return self->_notifyToken;
}

- (void)dealloc
{
  notify_cancel(self->_notifyToken);
  v3.receiver = self;
  v3.super_class = (Class)MSVDistributedNotificationObserver;
  [(MSVDistributedNotificationObserver *)&v3 dealloc];
}

- (MSVDistributedNotificationObserver)init
{
  objc_super v3 = (void *)MEMORY[0x1E4F1CA00];
  uint64_t v4 = *MEMORY[0x1E4F1C3A8];
  v5 = NSStringFromSelector(a2);
  v6 = NSStringFromSelector(sel_initWithDistributedName_localName_queue_);
  [v3 raise:v4, @"%@ is invalid. Use %@ instead.", v5, v6 format];

  return 0;
}

void __78__MSVDistributedNotificationObserver_initWithDistributedName_localName_queue___block_invoke(uint64_t a1, uint64_t a2)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    id v4 = WeakRetained;
    [WeakRetained _handleDistributedNotificationWithNotifyToken:a2];
    id WeakRetained = v4;
  }
}

@end