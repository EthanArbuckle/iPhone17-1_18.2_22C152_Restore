@interface RCOperationNotificationRetrySignal
- (NSString)description;
- (RCOperationNotificationRetrySignal)initWithNotificationName:(id)a3 timeout:(double)a4;
- (void)dealloc;
- (void)onQueue:(id)a3 signal:(id)a4;
@end

@implementation RCOperationNotificationRetrySignal

- (RCOperationNotificationRetrySignal)initWithNotificationName:(id)a3 timeout:(double)a4
{
  id v7 = a3;
  v21.receiver = self;
  v21.super_class = (Class)RCOperationNotificationRetrySignal;
  v8 = [(RCOperationNotificationRetrySignal *)&v21 init];
  v9 = v8;
  if (v8)
  {
    objc_storeStrong((id *)&v8->_notificationName, a3);
    v9->_timeout = a4;
    v10 = dispatch_group_create();
    dispatch_group_enter(v10);
    objc_storeStrong((id *)&v9->_group, v10);
    v9->_timeoutTime = dispatch_time(0, (uint64_t)(a4 * 1000000000.0));
    v11 = [[RCOnce alloc] initWithOptions:1];
    v12 = [MEMORY[0x1E4F28EB8] defaultCenter];
    v18[0] = MEMORY[0x1E4F143A8];
    v18[1] = 3221225472;
    v18[2] = __71__RCOperationNotificationRetrySignal_initWithNotificationName_timeout___block_invoke;
    v18[3] = &unk_1E5B76150;
    v19 = v11;
    v20 = v10;
    v13 = v10;
    v14 = v11;
    uint64_t v15 = [v12 addObserverForName:v7 object:0 queue:0 usingBlock:v18];
    notificationObserver = v9->_notificationObserver;
    v9->_notificationObserver = v15;
  }
  return v9;
}

void __71__RCOperationNotificationRetrySignal_initWithNotificationName_timeout___block_invoke(uint64_t a1)
{
  v2[0] = MEMORY[0x1E4F143A8];
  v2[1] = 3221225472;
  v2[2] = __71__RCOperationNotificationRetrySignal_initWithNotificationName_timeout___block_invoke_2;
  v2[3] = &unk_1E5B76100;
  v1 = *(void **)(a1 + 32);
  id v3 = *(id *)(a1 + 40);
  [v1 executeOnce:v2];
}

void __71__RCOperationNotificationRetrySignal_initWithNotificationName_timeout___block_invoke_2(uint64_t a1)
{
}

- (void)dealloc
{
  id v3 = [MEMORY[0x1E4F28EB8] defaultCenter];
  [v3 removeObserver:self->_notificationObserver];

  v4.receiver = self;
  v4.super_class = (Class)RCOperationNotificationRetrySignal;
  [(RCOperationNotificationRetrySignal *)&v4 dealloc];
}

- (void)onQueue:(id)a3 signal:(id)a4
{
  id v6 = a4;
  group = self->_group;
  dispatch_time_t timeoutTime = self->_timeoutTime;
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __53__RCOperationNotificationRetrySignal_onQueue_signal___block_invoke;
  v10[3] = &unk_1E5B76178;
  id v11 = v6;
  id v9 = v6;
  RCDispatchGroupNotifyWithTimeout(group, a3, timeoutTime, v10);
}

uint64_t __53__RCOperationNotificationRetrySignal_onQueue_signal___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (NSString)description
{
  return (NSString *)[NSString stringWithFormat:@"{%p notification=%@, timeout=%.2f}", self, self->_notificationName, *(void *)&self->_timeout];
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_notificationName, 0);
  objc_storeStrong((id *)&self->_notificationObserver, 0);

  objc_storeStrong((id *)&self->_group, 0);
}

@end