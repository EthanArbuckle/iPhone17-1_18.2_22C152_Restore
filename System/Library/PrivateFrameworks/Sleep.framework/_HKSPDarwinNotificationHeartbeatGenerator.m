@interface _HKSPDarwinNotificationHeartbeatGenerator
- (NSString)lifecycleNotification;
- (_HKSPDarwinNotificationHeartbeatGenerator)initWithLifecycleNotification:(id)a3;
- (void)sendHeartbeat;
@end

@implementation _HKSPDarwinNotificationHeartbeatGenerator

- (_HKSPDarwinNotificationHeartbeatGenerator)initWithLifecycleNotification:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)_HKSPDarwinNotificationHeartbeatGenerator;
  v6 = [(_HKSPDarwinNotificationHeartbeatGenerator *)&v9 init];
  v7 = v6;
  if (v6) {
    objc_storeStrong((id *)&v6->_lifecycleNotification, a3);
  }

  return v7;
}

- (void)sendHeartbeat
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  if (self->_lifecycleNotification)
  {
    v3 = HKSPLogForCategory(4uLL);
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
    {
      v4 = objc_opt_class();
      lifecycleNotification = self->_lifecycleNotification;
      int v8 = 138543618;
      objc_super v9 = v4;
      __int16 v10 = 2114;
      v11 = lifecycleNotification;
      id v6 = v4;
      _os_log_impl(&dword_1A7E74000, v3, OS_LOG_TYPE_DEFAULT, "[%{public}@] posting lifecycle notification %{public}@", (uint8_t *)&v8, 0x16u);
    }
    DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
    CFNotificationCenterPostNotification(DarwinNotifyCenter, (CFNotificationName)self->_lifecycleNotification, 0, 0, 1u);
  }
}

- (NSString)lifecycleNotification
{
  return self->_lifecycleNotification;
}

- (void).cxx_destruct
{
}

@end