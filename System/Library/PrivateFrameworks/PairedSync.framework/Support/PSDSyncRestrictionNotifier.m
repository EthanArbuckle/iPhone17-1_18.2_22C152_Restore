@interface PSDSyncRestrictionNotifier
- (PSDSyncRestrictionNotifier)init;
- (PSDSyncRestrictionNotifier)initWithScheduler:(id)a3;
- (int)notifyTokenWithName:(id)a3;
- (void)dealloc;
- (void)scheduler:(id)a3 didClearSyncSession:(id)a4 withBlock:(id)a5;
- (void)scheduler:(id)a3 willStartSyncSession:(id)a4;
- (void)setNotifyToken:(int)a3 withValue:(unint64_t)a4 withNotificationName:(id)a5;
- (void)setSyncComplete;
@end

@implementation PSDSyncRestrictionNotifier

- (PSDSyncRestrictionNotifier)init
{
  v3 = +[PSDScheduler sharedScheduler];
  v4 = [(PSDSyncRestrictionNotifier *)self initWithScheduler:v3];

  return v4;
}

- (PSDSyncRestrictionNotifier)initWithScheduler:(id)a3
{
  id v4 = a3;
  v10.receiver = self;
  v10.super_class = (Class)PSDSyncRestrictionNotifier;
  v5 = [(PSDSyncRestrictionNotifier *)&v10 init];
  v6 = v5;
  if (v5)
  {
    id v7 = objc_storeWeak((id *)&v5->_scheduler, v4);
    v6->_lastSyncSwitchIDNotifyToken = -1;
    id v8 = v7;
    [v4 addSchedulerObserver:v6];
  }
  return v6;
}

- (void)dealloc
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_scheduler);
  [WeakRetained removeSchedulerObserver:self];

  v4.receiver = self;
  v4.super_class = (Class)PSDSyncRestrictionNotifier;
  [(PSDSyncRestrictionNotifier *)&v4 dealloc];
}

- (void)scheduler:(id)a3 willStartSyncSession:(id)a4
{
  uint64_t lastSyncSwitchIDNotifyToken = self->_lastSyncSwitchIDNotifyToken;
  uint64_t v6 = PSYLastSyncSwitchIDNotification;
  if (lastSyncSwitchIDNotifyToken == -1)
  {
    uint64_t lastSyncSwitchIDNotifyToken = -[PSDSyncRestrictionNotifier notifyTokenWithName:](self, "notifyTokenWithName:", PSYLastSyncSwitchIDNotification, a4);
    self->_uint64_t lastSyncSwitchIDNotifyToken = lastSyncSwitchIDNotifyToken;
  }

  [(PSDSyncRestrictionNotifier *)self setNotifyToken:lastSyncSwitchIDNotifyToken withValue:-1 withNotificationName:v6];
}

- (void)scheduler:(id)a3 didClearSyncSession:(id)a4 withBlock:(id)a5
{
  uint64_t v6 = (void (**)(void))a5;
  [(PSDSyncRestrictionNotifier *)self setSyncComplete];
  v6[2]();
}

- (void)setSyncComplete
{
  v3 = +[PSYRegistrySingleton registry];
  unsigned int v4 = [v3 switchIndex];

  uint64_t lastSyncSwitchIDNotifyToken = self->_lastSyncSwitchIDNotifyToken;
  uint64_t v6 = PSYLastSyncSwitchIDNotification;
  if (lastSyncSwitchIDNotifyToken == -1)
  {
    uint64_t lastSyncSwitchIDNotifyToken = [(PSDSyncRestrictionNotifier *)self notifyTokenWithName:PSYLastSyncSwitchIDNotification];
    self->_uint64_t lastSyncSwitchIDNotifyToken = lastSyncSwitchIDNotifyToken;
  }

  [(PSDSyncRestrictionNotifier *)self setNotifyToken:lastSyncSwitchIDNotifyToken withValue:v4 withNotificationName:v6];
}

- (int)notifyTokenWithName:(id)a3
{
  int out_token = -1;
  id v3 = a3;
  if (notify_register_check((const char *)[v3 UTF8String], &out_token))
  {
    unsigned int v4 = psd_log();
    BOOL v5 = os_log_type_enabled(v4, OS_LOG_TYPE_ERROR);

    if (v5)
    {
      uint64_t v6 = psd_log();
      if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR)) {
        sub_10001C1D8((uint64_t)v3, v6);
      }
    }
  }
  int v7 = out_token;

  return v7;
}

- (void)setNotifyToken:(int)a3 withValue:(unint64_t)a4 withNotificationName:(id)a5
{
  id v7 = a5;
  id v8 = psd_log();
  v9 = v8;
  if (a3 == -1)
  {
    BOOL v12 = os_log_type_enabled(v8, OS_LOG_TYPE_ERROR);

    if (v12)
    {
      v13 = psd_log();
      if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR)) {
        sub_10001C264((uint64_t)v7, v13);
      }
    }
  }
  else
  {
    BOOL v10 = os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT);

    if (v10)
    {
      v11 = psd_log();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
      {
        int v14 = 138543618;
        id v15 = v7;
        __int16 v16 = 2048;
        unint64_t v17 = a4;
        _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEFAULT, "Updating token %{public}@ with value %lld", (uint8_t *)&v14, 0x16u);
      }
    }
    notify_set_state(a3, a4);
    notify_post((const char *)[v7 UTF8String]);
  }
}

- (void).cxx_destruct
{
}

@end