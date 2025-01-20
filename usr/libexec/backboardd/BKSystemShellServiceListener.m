@interface BKSystemShellServiceListener
- (BKSystemShellServiceListener)initWithSentinel:(id)a3;
- (BOOL)_remoteProcessIsAlreadyConnected:(id)a3;
- (BOOL)_validateConnection:(id)a3 withContext:(id)a4 forListenerLabel:(id)a5;
- (void)_activateConnection:(id)a3 withContext:(id)a4;
- (void)_dataMigrationCheckInListener:(id)a3 didReceiveConnection:(id)a4 withContext:(id)a5;
- (void)_shellListener:(id)a3 didReceiveConnection:(id)a4 withContext:(id)a5;
- (void)activate;
- (void)activateForDataMigration;
- (void)listener:(id)a3 didReceiveConnection:(id)a4 withContext:(id)a5;
@end

@implementation BKSystemShellServiceListener

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_queue, 0);
  objc_storeStrong((id *)&self->_systemShellSentinel, 0);
  objc_storeStrong((id *)&self->_dataMigrationCheckInListener, 0);

  objc_storeStrong((id *)&self->_connectionListener, 0);
}

- (void)_shellListener:(id)a3 didReceiveConnection:(id)a4 withContext:(id)a5
{
  id v7 = a4;
  id v8 = a5;
  if ([(BKSystemShellServiceListener *)self _validateConnection:v7 withContext:v8 forListenerLabel:@"Shell"])
  {
    v10 = _NSConcreteStackBlock;
    uint64_t v11 = 3221225472;
    v12 = sub_100023A40;
    v13 = &unk_1000F5D58;
    id v9 = v7;
    id v14 = v9;
    v15 = self;
    [v9 configureConnection:&v10];
    -[BKSystemShellServiceListener _activateConnection:withContext:](self, "_activateConnection:withContext:", v9, v8, v10, v11, v12, v13);
  }
  else
  {
    [v7 invalidate];
  }
}

- (void)_dataMigrationCheckInListener:(id)a3 didReceiveConnection:(id)a4 withContext:(id)a5
{
  id v6 = a4;
  id v7 = [v6 remoteProcess];
  unsigned int v8 = [(BKSystemShellServiceListener *)self _remoteProcessIsAlreadyConnected:v7];

  if (v8)
  {
    v12 = _NSConcreteStackBlock;
    uint64_t v13 = 3221225472;
    id v14 = sub_100023F8C;
    v15 = &unk_1000F5D58;
    id v9 = v6;
    id v16 = v9;
    v17 = self;
    [v9 configureConnection:&v12];
    [v9 activate:v12, v13, v14, v15];
  }
  else
  {
    v10 = BKLogSystemShell();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
    {
      uint64_t v11 = [v6 remoteProcess];
      *(_DWORD *)buf = 138543362;
      v19 = v11;
      _os_log_error_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_ERROR, "[DataMigrationCheckIn] unknown system shell:'%{public}@'", buf, 0xCu);
    }
    [v6 invalidate];
  }
}

- (BOOL)_validateConnection:(id)a3 withContext:(id)a4 forListenerLabel:(id)a5
{
  id v6 = a3;
  id v7 = a5;
  unsigned int v8 = [v6 remoteProcess];
  int v9 = [v8 pid];
  v10 = BKLogSystemShell();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG))
  {
    int v15 = 138543874;
    id v16 = v7;
    __int16 v17 = 2114;
    *(void *)v18 = v6;
    *(_WORD *)&v18[8] = 1024;
    *(_DWORD *)&v18[10] = v9;
    _os_log_debug_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEBUG, "[%{public}@] received connection -- %{public}@ pid:%d", (uint8_t *)&v15, 0x1Cu);
  }

  if (v9 <= 0)
  {
    v12 = BKLogSystemShell();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
    {
      int v15 = 138543874;
      id v16 = v7;
      __int16 v17 = 1024;
      *(_DWORD *)v18 = v9;
      *(_WORD *)&v18[4] = 2114;
      *(void *)&v18[6] = v6;
      _os_log_error_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_ERROR, "[%{public}@] dropping connection with junk pid (%d) -- %{public}@, ", (uint8_t *)&v15, 0x1Cu);
    }

    [v6 invalidate];
    goto LABEL_12;
  }
  if (([v8 hasEntitlement:BKBackBoardClientEntitlement] & 1) == 0)
  {
    uint64_t v13 = BKLogSystemShell();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
    {
      int v15 = 138543618;
      id v16 = v7;
      __int16 v17 = 2114;
      *(void *)v18 = v8;
      _os_log_error_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_ERROR, "[%{public}@] '%{public}@' is not a system shell", (uint8_t *)&v15, 0x16u);
    }

LABEL_12:
    BOOL v11 = 0;
    goto LABEL_13;
  }
  BOOL v11 = 1;
LABEL_13:

  return v11;
}

- (void)_activateConnection:(id)a3 withContext:(id)a4
{
  id v6 = a3;
  uint64_t v7 = BKSSystemShellConnectionContextKeyLaunchJobLabel;
  id v8 = a4;
  int v9 = [v8 decodeStringForKey:v7];
  v10 = [v8 decodeStringForKey:BKSSystemShellConnectionContextKeyBundlePath];
  BOOL v11 = [v8 decodeStringForKey:BKSSystemShellConnectionContextKeyBundleID];
  [v8 decodeDoubleForKey:BKSSystemShellConnectionContextKeyIdleSleepInterval];
  uint64_t v13 = v12;
  id v14 = [v8 decodeInt64ForKey:BKSSystemShellConnectionContextKeyWatchdogType];

  if (!v9)
  {
    __int16 v17 = BKLogSystemShell();
    if (!os_log_type_enabled(v17, OS_LOG_TYPE_ERROR)) {
      goto LABEL_13;
    }
    *(_WORD *)buf = 0;
    v18 = "missing jobLabel";
    goto LABEL_12;
  }
  if (!v10)
  {
    __int16 v17 = BKLogSystemShell();
    if (!os_log_type_enabled(v17, OS_LOG_TYPE_ERROR)) {
      goto LABEL_13;
    }
    *(_WORD *)buf = 0;
    v18 = "missing bundlePath";
    goto LABEL_12;
  }
  if (!v11)
  {
    __int16 v17 = BKLogSystemShell();
    if (!os_log_type_enabled(v17, OS_LOG_TYPE_ERROR)) {
      goto LABEL_13;
    }
    *(_WORD *)buf = 0;
    v18 = "missing bundleIdentifier";
LABEL_12:
    _os_log_error_impl((void *)&_mh_execute_header, v17, OS_LOG_TYPE_ERROR, v18, buf, 2u);
LABEL_13:

    if ((unint64_t)v14 < 2)
    {
LABEL_17:
      [v6 invalidate];
      goto LABEL_18;
    }
LABEL_14:
    v19 = BKLogSystemShell();
    if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
    {
      v20 = +[NSString stringWithFormat:@"<unknown:%lX>", v14];
      *(_DWORD *)buf = 138543362;
      v29 = v20;
      _os_log_error_impl((void *)&_mh_execute_header, v19, OS_LOG_TYPE_ERROR, "we don't handle this watchdogType:%{public}@", buf, 0xCu);
    }
    goto LABEL_17;
  }
  if ((unint64_t)v14 >= 2) {
    goto LABEL_14;
  }
  v21[0] = _NSConcreteStackBlock;
  v21[1] = 3221225472;
  v21[2] = sub_1000247F8;
  v21[3] = &unk_1000F5D10;
  id v22 = v11;
  id v23 = v10;
  id v24 = v9;
  uint64_t v26 = v13;
  id v27 = v14;
  id v15 = v6;
  id v25 = v15;
  id v16 = +[BKSystemShellDescriptor build:v21];
  [(BKSystemShellSentinel *)self->_systemShellSentinel systemShellDidConnect:v16 connection:v15];
  [v15 activate];

LABEL_18:
}

- (BOOL)_remoteProcessIsAlreadyConnected:(id)a3
{
  v4 = [a3 auditToken];
  v5 = v4;
  long long v8 = 0u;
  long long v9 = 0u;
  if (v4) {
    [v4 realToken:v8, v9];
  }
  BOOL v6 = [(BKSystemShellSentinel *)self->_systemShellSentinel auditTokenRepresentsSystemApp:&v8];

  return v6;
}

- (void)listener:(id)a3 didReceiveConnection:(id)a4 withContext:(id)a5
{
  id v15 = (BSServiceConnectionListener *)a3;
  id v9 = a4;
  id v10 = a5;
  if (self->_connectionListener == v15)
  {
    -[BKSystemShellServiceListener _shellListener:didReceiveConnection:withContext:](self, "_shellListener:didReceiveConnection:withContext:");
    goto LABEL_5;
  }
  if (self->_dataMigrationCheckInListener == v15)
  {
    -[BKSystemShellServiceListener _dataMigrationCheckInListener:didReceiveConnection:withContext:](self, "_dataMigrationCheckInListener:didReceiveConnection:withContext:");
LABEL_5:

    return;
  }
  BOOL v11 = +[NSString stringWithFormat:@"shouldn't be here"];
  if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR))
  {
    uint64_t v12 = NSStringFromSelector(a2);
    uint64_t v13 = (objc_class *)objc_opt_class();
    id v14 = NSStringFromClass(v13);
    *(_DWORD *)buf = 138544642;
    __int16 v17 = v12;
    __int16 v18 = 2114;
    v19 = v14;
    __int16 v20 = 2048;
    v21 = self;
    __int16 v22 = 2114;
    CFStringRef v23 = @"BKSystemShellServiceListener.m";
    __int16 v24 = 1024;
    int v25 = 81;
    __int16 v26 = 2114;
    id v27 = v11;
    _os_log_error_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", buf, 0x3Au);
  }
  [v11 UTF8String];
  _bs_set_crash_log_message();
  __break(0);
}

- (void)activateForDataMigration
{
}

- (void)activate
{
}

- (BKSystemShellServiceListener)initWithSentinel:(id)a3
{
  id v5 = a3;
  v22.receiver = self;
  v22.super_class = (Class)BKSystemShellServiceListener;
  BOOL v6 = [(BKSystemShellServiceListener *)&v22 init];
  if (v6)
  {
    uint64_t v7 = +[BSDispatchQueueAttributes serial];
    long long v8 = [v7 serviceClass:25];
    uint64_t v9 = BSDispatchQueueCreate();
    queue = v6->_queue;
    v6->_queue = (OS_dispatch_queue *)v9;

    objc_storeStrong((id *)&v6->_systemShellSentinel, a3);
    v20[0] = _NSConcreteStackBlock;
    v20[1] = 3221225472;
    v20[2] = sub_100024C94;
    v20[3] = &unk_1000F8FB0;
    BOOL v11 = v6;
    v21 = v11;
    uint64_t v12 = +[BSServiceConnectionListener listenerWithConfigurator:v20];
    connectionListener = v11->_connectionListener;
    v11->_connectionListener = (BSServiceConnectionListener *)v12;

    v18[0] = _NSConcreteStackBlock;
    v18[1] = 3221225472;
    v18[2] = sub_100024D0C;
    v18[3] = &unk_1000F8FB0;
    id v14 = v11;
    v19 = v14;
    uint64_t v15 = +[BSServiceConnectionListener listenerWithConfigurator:v18];
    dataMigrationCheckInListener = v14->_dataMigrationCheckInListener;
    v14->_dataMigrationCheckInListener = (BSServiceConnectionListener *)v15;
  }
  return v6;
}

@end