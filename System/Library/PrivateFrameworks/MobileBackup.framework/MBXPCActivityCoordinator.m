@interface MBXPCActivityCoordinator
- (MBXPCActivityCoordinator)initWithDelegate:(id)a3;
- (MBXPCActivityCoordinatorDelegate)delegate;
- (NSMutableDictionary)backupActivities;
- (NSMutableIndexSet)checkedInActivities;
- (OS_dispatch_queue)stateQueue;
- (id)_activityForActivityType:(int)a3;
- (id)checkInBackupActivity:(int)a3;
- (id)xpcActivityForBackupActivity:(int)a3;
- (void)_cancelDeferralTimerForActivity:(int)a3;
- (void)_finishXPCActivityForBackupActivity:(int)a3;
- (void)_handleXPCActivity:(id)a3 type:(int)a4;
- (void)finishBackupActivity:(int)a3;
- (void)pollForBackupActivityDeferrals:(int)a3 block:(id)a4;
- (void)registerBackupActivity:(int)a3 criteria:(id)a4;
- (void)setBackupActivities:(id)a3;
- (void)setCheckedInActivities:(id)a3;
- (void)setDelegate:(id)a3;
- (void)setStateQueue:(id)a3;
@end

@implementation MBXPCActivityCoordinator

- (MBXPCActivityCoordinator)initWithDelegate:(id)a3
{
  id v4 = a3;
  v17.receiver = self;
  v17.super_class = (Class)MBXPCActivityCoordinator;
  v5 = [(MBXPCActivityCoordinator *)&v17 init];
  v6 = v5;
  if (v5)
  {
    objc_storeWeak((id *)&v5->_delegate, v4);
    v7 = (objc_class *)objc_opt_class();
    Name = class_getName(v7);
    v9 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    dispatch_queue_t v10 = dispatch_queue_create(Name, v9);
    stateQueue = v6->_stateQueue;
    v6->_stateQueue = (OS_dispatch_queue *)v10;

    uint64_t v12 = objc_opt_new();
    backupActivities = v6->_backupActivities;
    v6->_backupActivities = (NSMutableDictionary *)v12;

    uint64_t v14 = objc_opt_new();
    checkedInActivities = v6->_checkedInActivities;
    v6->_checkedInActivities = (NSMutableIndexSet *)v14;
  }
  return v6;
}

- (void)registerBackupActivity:(int)a3 criteria:(id)a4
{
  id v6 = a4;
  if (!a3) {
    __assert_rtn("-[MBXPCActivityCoordinator registerBackupActivity:criteria:]", "MBXPCActivityCoordinator.m", 83, "activityType != MBBackupXPCActivityTypeNone");
  }
  v7 = v6;
  dispatch_assert_queue_not_V2((dispatch_queue_t)self->_stateQueue);
  stateQueue = self->_stateQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10024C6A8;
  block[3] = &unk_100416BD0;
  int v12 = a3;
  block[4] = self;
  id v11 = v7;
  id v9 = v7;
  dispatch_sync(stateQueue, block);
}

- (void)finishBackupActivity:(int)a3
{
  stateQueue = self->_stateQueue;
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472;
  v4[2] = sub_10024CA30;
  v4[3] = &unk_1004155F0;
  v4[4] = self;
  int v5 = a3;
  dispatch_async(stateQueue, v4);
}

- (id)checkInBackupActivity:(int)a3
{
  int v5 = MBBackupXPCActivityNameWithType(a3);
  id v6 = MBGetDefaultLog();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
  {
    LODWORD(buf) = 136446210;
    *(void *)((char *)&buf + 4) = v5;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_INFO, "=XPCActivity= Checking in XPC activity \"%{public}s\" (initial)", (uint8_t *)&buf, 0xCu);
    _MBLog();
  }

  *(void *)&long long buf = 0;
  *((void *)&buf + 1) = &buf;
  uint64_t v18 = 0x3032000000;
  v19 = sub_10024CCB8;
  v20 = sub_10024CCC8;
  id v21 = 0;
  dispatch_semaphore_t v7 = dispatch_semaphore_create(0);
  objc_initWeak(&location, self);
  handler[0] = _NSConcreteStackBlock;
  handler[1] = 3221225472;
  handler[2] = sub_10024CCD0;
  handler[3] = &unk_100417290;
  objc_copyWeak(&v14, &location);
  v8 = v7;
  int v12 = v8;
  p_long long buf = &buf;
  int v15 = a3;
  xpc_activity_register(v5, XPC_ACTIVITY_CHECK_IN, handler);
  MBSemaphoreWaitForever();
  id v9 = *(id *)(*((void *)&buf + 1) + 40);

  objc_destroyWeak(&v14);
  objc_destroyWeak(&location);

  _Block_object_dispose(&buf, 8);
  return v9;
}

- (id)_activityForActivityType:(int)a3
{
  uint64_t v3 = *(void *)&a3;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_stateQueue);
  backupActivities = self->_backupActivities;
  id v6 = +[NSNumber numberWithInt:v3];
  dispatch_semaphore_t v7 = [(NSMutableDictionary *)backupActivities objectForKeyedSubscript:v6];

  if (!v7)
  {
    dispatch_semaphore_t v7 = objc_opt_new();
    v8 = self->_backupActivities;
    id v9 = +[NSNumber numberWithInt:v3];
    [(NSMutableDictionary *)v8 setObject:v7 forKeyedSubscript:v9];
  }
  return v7;
}

- (id)xpcActivityForBackupActivity:(int)a3
{
  dispatch_assert_queue_not_V2((dispatch_queue_t)self->_stateQueue);
  uint64_t v10 = 0;
  id v11 = &v10;
  uint64_t v12 = 0x3032000000;
  v13 = sub_10024CCB8;
  id v14 = sub_10024CCC8;
  id v15 = 0;
  stateQueue = self->_stateQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10024CF74;
  block[3] = &unk_1004172B8;
  block[4] = self;
  void block[5] = &v10;
  int v9 = a3;
  dispatch_sync(stateQueue, block);
  id v6 = (id)v11[5];
  _Block_object_dispose(&v10, 8);

  return v6;
}

- (void)pollForBackupActivityDeferrals:(int)a3 block:(id)a4
{
  id v6 = a4;
  dispatch_semaphore_t v7 = dispatch_source_create((dispatch_source_type_t)&_dispatch_source_type_timer, 0, 0, (dispatch_queue_t)self->_stateQueue);
  dispatch_time_t v8 = dispatch_time(0, 1000000000);
  dispatch_source_set_timer(v7, v8, 0x77359400uLL, 0);
  v22[0] = 0;
  v22[1] = v22;
  v22[2] = 0x2020000000;
  v22[3] = 0;
  int v9 = MBBackupXPCActivityNameWithType(a3);
  handler[0] = _NSConcreteStackBlock;
  handler[1] = 3221225472;
  handler[2] = sub_10024D19C;
  handler[3] = &unk_1004172E0;
  int v21 = a3;
  v19 = v22;
  v20 = v9;
  void handler[4] = self;
  id v18 = v6;
  id v10 = v6;
  dispatch_source_set_event_handler(v7, handler);
  stateQueue = self->_stateQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10024D2EC;
  block[3] = &unk_100417308;
  id v14 = v7;
  id v15 = v9;
  int v16 = a3;
  block[4] = self;
  uint64_t v12 = v7;
  dispatch_async(stateQueue, block);

  _Block_object_dispose(v22, 8);
}

- (void)_handleXPCActivity:(id)a3 type:(int)a4
{
  id v6 = (_xpc_activity_s *)a3;
  unint64_t state = xpc_activity_get_state(v6);
  xpc_object_t v8 = xpc_activity_copy_criteria(v6);
  int v9 = MBGetDefaultLog();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    id v10 = MBBackupXPCActivityNameWithType(a4);
    if (state > 5) {
      id v11 = "???";
    }
    else {
      id v11 = off_100417340[state];
    }
    *(_DWORD *)long long buf = 136446978;
    id v18 = v10;
    __int16 v19 = 2080;
    v20 = v11;
    __int16 v21 = 2048;
    unint64_t v22 = state;
    __int16 v23 = 2114;
    xpc_object_t v24 = v8;
    _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, "=XPCActivity= Handling \"%{public}s\", state:%s(%ld), criteria:%{public}@", buf, 0x2Au);
    MBBackupXPCActivityNameWithType(a4);
    _MBLog();
  }

  if (state)
  {
    if (state == 2)
    {
      xpc_activity_set_state(v6, 4);
      stateQueue = self->_stateQueue;
      block[0] = _NSConcreteStackBlock;
      block[1] = 3221225472;
      block[2] = sub_10024D5F4;
      block[3] = &unk_100417308;
      int v16 = a4;
      block[4] = self;
      uint64_t v15 = 2;
      id v14 = v6;
      dispatch_async(stateQueue, block);
    }
    else
    {
      xpc_activity_set_state(v6, 5);
    }
  }
}

- (void)_finishXPCActivityForBackupActivity:(int)a3
{
  uint64_t v3 = *(void *)&a3;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_stateQueue);
  int v5 = [(MBXPCActivityCoordinator *)self _activityForActivityType:v3];
  id v6 = [v5 runnableXPCActivity];

  if (v6)
  {
    dispatch_semaphore_t v7 = MBBackupXPCActivityNameWithType(v3);
    unint64_t state = xpc_activity_get_state(v6);
    int v9 = MBGetDefaultLog();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      if (state > 5) {
        id v10 = "???";
      }
      else {
        id v10 = off_100417340[state];
      }
      *(_DWORD *)long long buf = 136446722;
      v13 = v7;
      __int16 v14 = 2080;
      uint64_t v15 = v10;
      __int16 v16 = 2048;
      unint64_t v17 = state;
      _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, "=XPCActivity= Finishing XPC activity \"%{public}s\", state:%s(%ld)", buf, 0x20u);
      _MBLog();
    }

    xpc_activity_set_state(v6, 5);
    id v11 = [(MBXPCActivityCoordinator *)self _activityForActivityType:v3];
    [v11 setRunnableXPCActivity:0];
  }
}

- (void)_cancelDeferralTimerForActivity:(int)a3
{
  uint64_t v3 = *(void *)&a3;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_stateQueue);
  int v5 = [(MBXPCActivityCoordinator *)self _activityForActivityType:v3];
  id v6 = [v5 deferralTimer];

  if (v6)
  {
    dispatch_semaphore_t v7 = MBBackupXPCActivityNameWithType(v3);
    xpc_object_t v8 = MBGetDefaultLog();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)long long buf = 136446210;
      id v11 = v7;
      _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_INFO, "=XPCActivity= Cancelling XPC activity timer for \"%{public}s\"", buf, 0xCu);
      _MBLog();
    }

    dispatch_source_cancel(v6);
    int v9 = [(MBXPCActivityCoordinator *)self _activityForActivityType:v3];
    [v9 setDeferralTimer:0];
  }
}

- (MBXPCActivityCoordinatorDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  return (MBXPCActivityCoordinatorDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (OS_dispatch_queue)stateQueue
{
  return self->_stateQueue;
}

- (void)setStateQueue:(id)a3
{
}

- (NSMutableDictionary)backupActivities
{
  return self->_backupActivities;
}

- (void)setBackupActivities:(id)a3
{
}

- (NSMutableIndexSet)checkedInActivities
{
  return self->_checkedInActivities;
}

- (void)setCheckedInActivities:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_checkedInActivities, 0);
  objc_storeStrong((id *)&self->_backupActivities, 0);
  objc_storeStrong((id *)&self->_stateQueue, 0);
  objc_destroyWeak((id *)&self->_delegate);
}

@end