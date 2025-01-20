@interface BKAlternateSystemAppManager
+ (BKAlternateSystemAppManager)sharedInstance;
- (BKAlternateSystemApp)alternateSystemApp;
- (BKAlternateSystemAppManager)init;
- (BOOL)isBlockingSystemApp;
- (NSString)alternateSystemAppBundleIdentifier;
- (NSString)openBundleId;
- (OS_dispatch_queue)queue;
- (void)_queue_cleanUpAfterAlternativeSystemApp:(id)a3;
- (void)_setBlockingSystemApp:(BOOL)a3;
- (void)blockSystemAppForAlternateSystemAppWithCompletion:(id)a3;
- (void)openAlternateSystemApp:(id)a3 options:(id)a4 withResult:(id)a5 andExitBlock:(id)a6;
- (void)setAlternateSystemApp:(id)a3;
- (void)setOpenBundleId:(id)a3;
- (void)setQueue:(id)a3;
- (void)terminateAlternateSystemApp:(id)a3 forReason:(int)a4 andReport:(BOOL)a5 withDescription:(id)a6 completion:(id)a7;
- (void)terminateAnyAlternateSystemApp;
- (void)unblockSystemAppForAlternateSystemAppWithCompletion:(id)a3;
@end

@implementation BKAlternateSystemAppManager

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_alternateSystemApp, 0);
  objc_storeStrong((id *)&self->_queue, 0);

  objc_storeStrong((id *)&self->_openBundleId, 0);
}

- (void)setAlternateSystemApp:(id)a3
{
}

- (BKAlternateSystemApp)alternateSystemApp
{
  return self->_alternateSystemApp;
}

- (void)setQueue:(id)a3
{
}

- (OS_dispatch_queue)queue
{
  return self->_queue;
}

- (void)setOpenBundleId:(id)a3
{
}

- (NSString)openBundleId
{
  return self->_openBundleId;
}

- (void)_setBlockingSystemApp:(BOOL)a3
{
  queue = self->_queue;
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472;
  v4[2] = sub_1000623C4;
  v4[3] = &unk_1000F8A48;
  v4[4] = self;
  BOOL v5 = a3;
  dispatch_sync(queue, v4);
}

- (void)_queue_cleanUpAfterAlternativeSystemApp:(id)a3
{
  id v4 = a3;
  id v5 = [(BKAlternateSystemAppManager *)self alternateSystemApp];

  v6 = BKLogAlternateSystemApp();
  BOOL v7 = os_log_type_enabled(v6, OS_LOG_TYPE_ERROR);
  if (v5 == v4)
  {
    if (v7)
    {
      int v9 = 138543362;
      id v10 = v4;
      _os_log_error_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_ERROR, "[Manager] clean up: %{public}@", (uint8_t *)&v9, 0xCu);
    }

    [(BKAlternateSystemAppManager *)self setAlternateSystemApp:0];
  }
  else
  {
    if (v7)
    {
      alternateSystemApp = self->_alternateSystemApp;
      int v9 = 138543618;
      id v10 = v4;
      __int16 v11 = 2114;
      v12 = alternateSystemApp;
      _os_log_error_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_ERROR, "[Manager] clean up: %{public}@, but expected %{public}@", (uint8_t *)&v9, 0x16u);
    }
  }
}

- (void)unblockSystemAppForAlternateSystemAppWithCompletion:(id)a3
{
  id v4 = a3;
  id v5 = BKLogAlternateSystemApp();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)BOOL v7 = 0;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "[Manager] Unblocking the system app", v7, 2u);
  }

  v6 = +[BKSystemShellSentinel sharedInstance];
  [v6 unblockSystemApp];

  [(BKAlternateSystemAppManager *)self _setBlockingSystemApp:0];
  if (v4) {
    dispatch_async((dispatch_queue_t)self->_queue, v4);
  }
}

- (void)terminateAnyAlternateSystemApp
{
  if (self->_openBundleId)
  {
    v3 = BKLogAlternateSystemApp();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
    {
      openBundleId = self->_openBundleId;
      int v5 = 138543362;
      v6 = openBundleId;
      _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "[Manager] Terminating alternate system app with bundleID: %{public}@", (uint8_t *)&v5, 0xCu);
    }

    [(BKAlternateSystemAppManager *)self terminateAlternateSystemApp:self->_openBundleId forReason:0 andReport:0 withDescription:0 completion:0];
  }
}

- (void)terminateAlternateSystemApp:(id)a3 forReason:(int)a4 andReport:(BOOL)a5 withDescription:(id)a6 completion:(id)a7
{
  id v9 = a3;
  id v10 = a7;
  if ([(NSString *)self->_openBundleId isEqualToString:v9])
  {
    queue = self->_queue;
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_10006278C;
    block[3] = &unk_1000F8130;
    id v14 = v9;
    v15 = self;
    id v16 = v10;
    dispatch_async(queue, block);
    [(BKAlternateSystemAppManager *)self setOpenBundleId:0];
    v12 = +[BKSystemShellSentinel sharedInstance];
    [v12 setActiveAlternateSystemAppBundleIdentifier:0];
  }
}

- (void)openAlternateSystemApp:(id)a3 options:(id)a4 withResult:(id)a5 andExitBlock:(id)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  id v13 = a6;
  queue = self->_queue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100062970;
  block[3] = &unk_1000F7758;
  id v20 = v10;
  id v21 = v11;
  v22 = self;
  id v23 = v12;
  id v24 = v13;
  id v15 = v13;
  id v16 = v12;
  id v17 = v11;
  id v18 = v10;
  dispatch_async(queue, block);
}

- (void)blockSystemAppForAlternateSystemAppWithCompletion:(id)a3
{
  id v4 = a3;
  int v5 = BKLogAlternateSystemApp();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)BOOL v7 = 0;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "[Manager] Blocking the system app", v7, 2u);
  }

  [(BKAlternateSystemAppManager *)self _setBlockingSystemApp:1];
  v6 = +[BKSystemShellSentinel sharedInstance];
  [v6 blockSystemApp];

  if (v4) {
    dispatch_async((dispatch_queue_t)self->_queue, v4);
  }
}

- (NSString)alternateSystemAppBundleIdentifier
{
  uint64_t v6 = 0;
  BOOL v7 = &v6;
  uint64_t v8 = 0x3032000000;
  id v9 = sub_100062E84;
  id v10 = sub_100062E94;
  id v11 = 0;
  queue = self->_queue;
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472;
  v5[2] = sub_100062E9C;
  v5[3] = &unk_1000F8EA0;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(queue, v5);
  id v3 = (id)v7[5];
  _Block_object_dispose(&v6, 8);

  return (NSString *)v3;
}

- (BOOL)isBlockingSystemApp
{
  uint64_t v6 = 0;
  BOOL v7 = &v6;
  uint64_t v8 = 0x2020000000;
  char v9 = 0;
  queue = self->_queue;
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472;
  v5[2] = sub_100062F98;
  v5[3] = &unk_1000F8EA0;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(queue, v5);
  char v3 = *((unsigned char *)v7 + 24);
  _Block_object_dispose(&v6, 8);
  return v3;
}

- (BKAlternateSystemAppManager)init
{
  v6.receiver = self;
  v6.super_class = (Class)BKAlternateSystemAppManager;
  v2 = [(BKAlternateSystemAppManager *)&v6 init];
  if (v2)
  {
    uint64_t Serial = BSDispatchQueueCreateSerial();
    queue = v2->_queue;
    v2->_queue = (OS_dispatch_queue *)Serial;
  }
  return v2;
}

+ (BKAlternateSystemAppManager)sharedInstance
{
  if (qword_100123008 != -1) {
    dispatch_once(&qword_100123008, &stru_1000F76E0);
  }
  v2 = (void *)qword_100123000;

  return (BKAlternateSystemAppManager *)v2;
}

@end