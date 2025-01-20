@interface BKSystemShellControlServiceListener
- (BKSystemShellControlServiceListener)initWithSentinel:(id)a3;
- (void)activate;
- (void)listener:(id)a3 didReceiveConnection:(id)a4 withContext:(id)a5;
@end

@implementation BKSystemShellControlServiceListener

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_queue, 0);
  objc_storeStrong((id *)&self->_systemShellSentinel, 0);

  objc_storeStrong((id *)&self->_connectionListener, 0);
}

- (void)listener:(id)a3 didReceiveConnection:(id)a4 withContext:(id)a5
{
  id v6 = a4;
  v7 = [v6 remoteProcess];
  int v8 = [v7 pid];
  v9 = BKLogSystemShell();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 138543618;
    *(void *)v16 = v6;
    *(_WORD *)&v16[8] = 1024;
    *(_DWORD *)&v16[10] = v8;
    _os_log_debug_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEBUG, "shell control connection -- %{public}@ pid:%d", buf, 0x12u);
  }

  if (v8 <= 0)
  {
    v10 = BKLogSystemShell();
    if (!os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
    {
LABEL_9:

      [v6 invalidate];
      goto LABEL_10;
    }
    *(_DWORD *)buf = 67109378;
    *(_DWORD *)v16 = v8;
    *(_WORD *)&v16[4] = 2114;
    *(void *)&v16[6] = v6;
    v11 = "dropping connection with junk pid (%d) -- %{public}@, ";
    v12 = v10;
    uint32_t v13 = 18;
LABEL_12:
    _os_log_error_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_ERROR, v11, buf, v13);
    goto LABEL_9;
  }
  if (![v7 hasEntitlement:BKReplaceSystemAppEntitlement])
  {
    v10 = BKLogSystemShell();
    if (!os_log_type_enabled(v10, OS_LOG_TYPE_ERROR)) {
      goto LABEL_9;
    }
    *(_DWORD *)buf = 138543362;
    *(void *)v16 = v7;
    v11 = "'%{public}@' is not appropriately entitled";
    v12 = v10;
    uint32_t v13 = 12;
    goto LABEL_12;
  }
  v14[0] = _NSConcreteStackBlock;
  v14[1] = 3221225472;
  v14[2] = sub_10009EE34;
  v14[3] = &unk_1000F9038;
  v14[4] = self;
  [v6 configureConnection:v14];
  [v6 activate];
LABEL_10:
}

- (void)activate
{
}

- (BKSystemShellControlServiceListener)initWithSentinel:(id)a3
{
  id v5 = a3;
  v17.receiver = self;
  v17.super_class = (Class)BKSystemShellControlServiceListener;
  id v6 = [(BKSystemShellControlServiceListener *)&v17 init];
  if (v6)
  {
    v7 = +[BSDispatchQueueAttributes serial];
    int v8 = [v7 serviceClass:25];
    uint64_t v9 = BSDispatchQueueCreate();
    queue = v6->_queue;
    v6->_queue = (OS_dispatch_queue *)v9;

    objc_storeStrong((id *)&v6->_systemShellSentinel, a3);
    v15[0] = _NSConcreteStackBlock;
    v15[1] = 3221225472;
    v15[2] = sub_10009F0C4;
    v15[3] = &unk_1000F8FB0;
    v11 = v6;
    v16 = v11;
    uint64_t v12 = +[BSServiceConnectionListener listenerWithConfigurator:v15];
    connectionListener = v11->_connectionListener;
    v11->_connectionListener = (BSServiceConnectionListener *)v12;
  }
  return v6;
}

@end