@interface MobileRestoreObserver
- (BOOL)waitingForMobileRestoreToFinish;
- (MobileRestoreObserver)initWithQueue:(id)a3;
- (void)_pollBackupManager:(id)a3;
- (void)manager:(id)a3 didFinishRestoreForPath:(id)a4;
- (void)managerDidFinishRestore:(id)a3;
- (void)managerDidUpdateBackgroundRestoreProgress:(id)a3;
- (void)observeMobileRestore:(id)a3;
@end

@implementation MobileRestoreObserver

- (MobileRestoreObserver)initWithQueue:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)MobileRestoreObserver;
  v6 = [(MobileRestoreObserver *)&v9 init];
  v7 = v6;
  if (v6) {
    objc_storeStrong((id *)&v6->_completionQueue, a3);
  }

  return v7;
}

- (void)_pollBackupManager:(id)a3
{
  v12[0] = _NSConcreteStackBlock;
  v12[1] = 3221225472;
  v12[2] = sub_100008B24;
  v12[3] = &unk_100038958;
  v12[4] = self;
  id v4 = a3;
  id v13 = v4;
  id v5 = objc_retainBlock(v12);
  backupManager = self->_backupManager;
  v9[0] = _NSConcreteStackBlock;
  v9[1] = 3221225472;
  v9[2] = sub_100008BEC;
  v9[3] = &unk_100038980;
  v9[4] = self;
  id v10 = v4;
  id v11 = v5;
  v7 = v5;
  id v8 = v4;
  [(MBManager *)backupManager fetchiCloudRestoreIsCompleteWithCompletion:v9];
}

- (void)observeMobileRestore:(id)a3
{
  id v4 = a3;
  id v5 = (MBManager *)[objc_alloc((Class)MBManager) initWithDelegate:self eventQueue:self->_completionQueue];
  backupManager = self->_backupManager;
  self->_backupManager = v5;

  if (BYSetupAssistantNeedsToRun())
  {
    v7 = OSLogForCategory();
    BOOL v8 = os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG);
    objc_super v9 = (void *)BYSetupAssistantFinishedDarwinNotification;
    if (v8) {
      sub_100022688();
    }

    self->_waitingForMobileRestoreToFinish = 1;
    objc_initWeak(&location, self);
    uint64_t v20 = 0;
    v21 = (int *)&v20;
    uint64_t v22 = 0x2020000000;
    int v23 = 0;
    v16[0] = _NSConcreteStackBlock;
    v16[1] = 3221225472;
    v16[2] = sub_100008FA0;
    v16[3] = &unk_1000389A8;
    v18 = &v20;
    objc_copyWeak(&v19, &location);
    id v17 = v4;
    id v10 = objc_retainBlock(v16);
    id v11 = (const char *)[v9 UTF8String];
    notify_register_dispatch(v11, v21 + 6, (dispatch_queue_t)self->_completionQueue, v10);
    if ((BYSetupAssistantNeedsToRun() & 1) == 0) {
      ((void (*)(void *, void))v10[2])(v10, v21[6]);
    }

    objc_destroyWeak(&v19);
    _Block_object_dispose(&v20, 8);
    objc_destroyWeak(&location);
  }
  else
  {
    v12 = [(MBManager *)self->_backupManager restoreState];
    if ([v12 state] - 1 > 2)
    {
      completionQueue = self->_completionQueue;
      block[0] = _NSConcreteStackBlock;
      block[1] = 3221225472;
      block[2] = sub_100009038;
      block[3] = &unk_1000389D0;
      id v15 = v4;
      dispatch_async((dispatch_queue_t)completionQueue, block);
    }
    else
    {
      self->_waitingForMobileRestoreToFinish = 1;
      [(MobileRestoreObserver *)self _pollBackupManager:v4];
    }
  }
}

- (void)managerDidFinishRestore:(id)a3
{
  v3 = [a3 restoreState];
  id v4 = OSLogForCategory();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG)) {
    sub_10002278C(v3, v4);
  }
}

- (void)manager:(id)a3 didFinishRestoreForPath:(id)a4
{
  id v4 = a4;
  id v5 = OSLogForCategory();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG)) {
    sub_10002282C();
  }
}

- (void)managerDidUpdateBackgroundRestoreProgress:(id)a3
{
  v3 = [a3 restoreState];
  id v4 = OSLogForCategory();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG)) {
    sub_1000228A0(v3, v4);
  }
}

- (BOOL)waitingForMobileRestoreToFinish
{
  return self->_waitingForMobileRestoreToFinish;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_completionQueue, 0);
  objc_storeStrong((id *)&self->_backupManager, 0);
}

@end