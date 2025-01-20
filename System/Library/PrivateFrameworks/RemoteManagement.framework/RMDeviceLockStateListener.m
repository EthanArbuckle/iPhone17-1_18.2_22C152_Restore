@interface RMDeviceLockStateListener
+ (id)newListenerWithDelegate:(id)a3;
- (RMDebounceTimer)debouncer;
- (RMDeviceLockStateListener)initWithDelegate:(id)a3;
- (RMDeviceLockStateListenerDelegate)delegate;
- (void)didReceiveNotificationForStream:(id)a3 notificationName:(id)a4;
- (void)setDebouncer:(id)a3;
- (void)setDelegate:(id)a3;
- (void)startListening;
- (void)stopListening;
- (void)triggerAggregatingTimerAction;
@end

@implementation RMDeviceLockStateListener

+ (id)newListenerWithDelegate:(id)a3
{
  id v3 = a3;
  v4 = [[RMDeviceLockStateListener alloc] initWithDelegate:v3];

  return v4;
}

- (RMDeviceLockStateListener)initWithDelegate:(id)a3
{
  id v4 = a3;
  v13.receiver = self;
  v13.super_class = (Class)RMDeviceLockStateListener;
  v5 = [(RMDeviceLockStateListener *)&v13 init];
  v6 = v5;
  if (v5)
  {
    objc_storeWeak((id *)&v5->_delegate, v4);
    uint64_t v7 = +[RMDebounceTimer debounceTimerWithMinimumInterval:v6 maximumInterval:@"RMDeviceLockStateListener" delegate:1.0 identifier:5.0];
    debouncer = v6->_debouncer;
    v6->_debouncer = (RMDebounceTimer *)v7;

    uint64_t v9 = objc_opt_new();
    syncLock = v6->_syncLock;
    v6->_syncLock = v9;

    v11 = +[RMDevice currentDevice];
    v6->_previousLockState = [v11 locked];

    v6->_listening = 0;
  }

  return v6;
}

- (void)startListening
{
  if (!self->_listening)
  {
    id v3 = self->_syncLock;
    objc_sync_enter(v3);
    id v4 = +[RMLog deviceLockState];
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG)) {
      sub_10002C344(v4);
    }

    v5 = +[RMDevice currentDevice];
    self->_previousLockState = [v5 locked];

    v6 = +[RMLog deviceLockState];
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG))
    {
      uint64_t v7 = +[NSNumber numberWithBool:self->_previousLockState];
      sub_10002C2EC(v7, v10, v6);
    }

    if (MKBDeviceFormattedForContentProtection())
    {
      id v8 = +[RMXPCEvent newXPCEventForDarwinNotification:@"com.apple.mobile.keybagd.lock_status"];
      uint64_t v9 = +[RMXPCNotifications sharedNotifier];
      [v9 addObserverForEvent:v8 observer:self];
    }
    self->_listening = 1;
    objc_sync_exit(v3);
  }
}

- (void)stopListening
{
  if (self->_listening)
  {
    id v3 = +[RMLog deviceLockState];
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG)) {
      sub_10002C388(v3);
    }

    id v4 = self->_syncLock;
    objc_sync_enter(v4);
    id v5 = +[RMXPCEvent newXPCEventForDarwinNotification:@"com.apple.mobile.keybagd.lock_status"];
    v6 = +[RMXPCNotifications sharedNotifier];
    [v6 removeObserverForEvent:v5];

    self->_listening = 0;
    objc_sync_exit(v4);
  }
}

- (void)didReceiveNotificationForStream:(id)a3 notificationName:(id)a4
{
  id v5 = +[RMLog deviceLockState];
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)uint64_t v7 = 0;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_INFO, "Device lock state notification", v7, 2u);
  }

  v6 = [(RMDeviceLockStateListener *)self debouncer];
  [v6 trigger];
}

- (void)triggerAggregatingTimerAction
{
  id v3 = self->_syncLock;
  objc_sync_enter(v3);
  id v4 = +[RMDevice currentDevice];
  id v5 = [v4 locked];

  if (self->_previousLockState != v5)
  {
    self->_previousLockState = (char)v5;
    v6 = +[RMLog deviceLockState];
    if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
    {
      uint64_t v7 = +[NSNumber numberWithBool:v5];
      int v9 = 138543362;
      v10 = v7;
      _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_INFO, "Device lock state changed to: %{public}@", (uint8_t *)&v9, 0xCu);
    }
    id v8 = [(RMDeviceLockStateListener *)self delegate];
    [v8 lockStateDidChange:v5];
  }
  objc_sync_exit(v3);
}

- (RMDeviceLockStateListenerDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  return (RMDeviceLockStateListenerDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (RMDebounceTimer)debouncer
{
  return self->_debouncer;
}

- (void)setDebouncer:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_debouncer, 0);
  objc_destroyWeak((id *)&self->_delegate);

  objc_storeStrong((id *)&self->_syncLock, 0);
}

@end