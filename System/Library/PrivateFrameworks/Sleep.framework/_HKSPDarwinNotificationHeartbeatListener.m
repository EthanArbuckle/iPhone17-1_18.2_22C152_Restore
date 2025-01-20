@interface _HKSPDarwinNotificationHeartbeatListener
- (HKSPXPCHeartbeatListenerDelegate)delegate;
- (NSString)lifecycleNotification;
- (_HKSPDarwinNotificationHeartbeatListener)initWithLifecycleNotification:(id)a3;
- (void)didReceiveLifecycleNotification;
- (void)setHeartbeatDelegate:(id)a3;
@end

@implementation _HKSPDarwinNotificationHeartbeatListener

- (_HKSPDarwinNotificationHeartbeatListener)initWithLifecycleNotification:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)_HKSPDarwinNotificationHeartbeatListener;
  v6 = [(_HKSPDarwinNotificationHeartbeatListener *)&v9 init];
  v7 = v6;
  if (v6) {
    objc_storeStrong((id *)&v6->_lifecycleNotification, a3);
  }

  return v7;
}

- (void)setHeartbeatDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
  DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
  CFStringRef lifecycleNotification = (const __CFString *)self->_lifecycleNotification;
  CFNotificationCenterAddObserver(DarwinNotifyCenter, self, (CFNotificationCallback)_handleLifeCycleNotification, lifecycleNotification, self, (CFNotificationSuspensionBehavior)1028);
}

- (void)didReceiveLifecycleNotification
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  v3 = HKSPLogForCategory(4uLL);
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    v4 = objc_opt_class();
    CFStringRef lifecycleNotification = self->_lifecycleNotification;
    int v8 = 138543618;
    objc_super v9 = v4;
    __int16 v10 = 2114;
    v11 = lifecycleNotification;
    id v6 = v4;
    _os_log_impl(&dword_1A7E74000, v3, OS_LOG_TYPE_DEFAULT, "[%{public}@] received lifecycle notification %{public}@", (uint8_t *)&v8, 0x16u);
  }
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  [WeakRetained listenerDidReceiveHeartbeat:self];
}

- (NSString)lifecycleNotification
{
  return self->_lifecycleNotification;
}

- (HKSPXPCHeartbeatListenerDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  return (HKSPXPCHeartbeatListenerDelegate *)WeakRetained;
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_lifecycleNotification, 0);
}

@end