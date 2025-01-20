@interface UpgradeClient
- (OS_os_log)logHandle;
- (OS_os_transaction)transaction;
- (OS_xpc_object)conn;
- (UpgradeClient)initWithConn:(id)a3 log:(id)a4;
- (_rpc_cred)cred;
- (id)cancelHandler;
- (void)_handleInterfaceLockMessage:(id)a3;
- (void)activate;
- (void)dealloc;
- (void)onCancel:(id)a3;
@end

@implementation UpgradeClient

- (UpgradeClient)initWithConn:(id)a3 log:(id)a4
{
  v7 = (_xpc_connection_s *)a3;
  id v8 = a4;
  long long v31 = 0u;
  memset(v32, 0, sizeof(v32));
  long long v29 = 0u;
  long long v30 = 0u;
  long long v27 = 0u;
  long long v28 = 0u;
  long long v25 = 0u;
  long long v26 = 0u;
  long long v23 = 0u;
  long long v24 = 0u;
  long long v21 = 0u;
  long long v22 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  *(_OWORD *)__str = 0u;
  memset(v16, 0, sizeof(v16));
  v15.receiver = self;
  v15.super_class = (Class)UpgradeClient;
  v9 = [(UpgradeClient *)&v15 init];
  if (v9)
  {
    pid_t pid = xpc_connection_get_pid(v7);
    snprintf(__str, 0xFFuLL, "com.apple.security.cryptexd.upgrade_lock.pid%d", pid);
    uint64_t v11 = os_transaction_create();
    transaction = v9->_transaction;
    v9->_transaction = (OS_os_transaction *)v11;

    objc_storeStrong((id *)&v9->_conn, a3);
    objc_storeStrong((id *)&v9->_logHandle, a4);
    v13 = (_rpc_cred *)malloc_type_calloc(1uLL, 0x20uLL, 0x61D5536CuLL);
    if (!v13) {
      sub_100041008(&v17, v33);
    }
    v9->_cred = v13;
    xpc_connection_get_audit_token();
    sub_10003D1CC(&v9->_cred->var0, v16);
  }

  return v9;
}

- (void)activate
{
  id location = 0;
  objc_initWeak(&location, self);
  v3 = [(UpgradeClient *)self conn];
  v5 = _NSConcreteStackBlock;
  uint64_t v6 = 3221225472;
  v7 = sub_100003C84;
  id v8 = &unk_100059148;
  objc_copyWeak(&v9, &location);
  xpc_connection_set_event_handler(v3, &v5);

  v4 = [(UpgradeClient *)self conn];
  xpc_connection_activate(v4);

  objc_destroyWeak(&v9);
  objc_destroyWeak(&location);
}

- (void)onCancel:(id)a3
{
  self->_cancelHandler = objc_retainBlock(a3);

  _objc_release_x1();
}

- (void)_handleInterfaceLockMessage:(id)a3
{
  id v5 = a3;
  uint64_t v6 = [(UpgradeClient *)self conn];
  v7 = 0;
  BOOL v8 = sub_10002C474((uint64_t)v6, (uint64_t)"com.apple.private.security.cryptex.upgrade");

  if (v8)
  {
    id v9 = xpc_copy_description(v5);
    if (xpc_get_type(v5) == (xpc_type_t)&_xpc_type_error)
    {
      long long v22 = [(UpgradeClient *)self cancelHandler];
      v22[2]();

      transaction = self->_transaction;
      self->_transaction = 0;

      conn = self->_conn;
      self->_conn = 0;
    }
    else
    {
      *(_OWORD *)buffer = *(_OWORD *)"unknown";
      *(_OWORD *)&buffer[16] = *(_OWORD *)&qword_1000485C8;
      v10 = [(UpgradeClient *)self conn];
      pid_t pid = xpc_connection_get_pid(v10);
      proc_name(pid, buffer, 0x20u);

      int v12 = *__error();
      v13 = [(UpgradeClient *)self logHandle];
      if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
      {
        v14 = [(UpgradeClient *)self conn];
        if (v14)
        {
          v3 = [(UpgradeClient *)self conn];
          pid_t v15 = xpc_connection_get_pid(v3);
        }
        else
        {
          pid_t v15 = -1;
        }
        int v27 = 136315906;
        long long v28 = buffer;
        __int16 v29 = 1024;
        pid_t v30 = v15;
        __int16 v31 = 2082;
        v32 = v9;
        __int16 v33 = 1024;
        int v34 = 5;
        _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_ERROR, "XPC client <process=%s pid=%d>: unexpected message: %{public}s: %{darwin.errno}d", (uint8_t *)&v27, 0x22u);
        if (v14) {
      }
        }
      *__error() = v12;
      long long v26 = [(UpgradeClient *)self conn];
      xpc_connection_cancel(v26);
    }
  }
  else
  {
    v16 = [(UpgradeClient *)self conn];
    pid_t v17 = xpc_connection_get_pid(v16);
    proc_name(v17, &v27, 0x20u);

    int v18 = *__error();
    long long v19 = [(UpgradeClient *)self logHandle];
    if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
    {
      long long v20 = [(UpgradeClient *)self conn];
      if (v20)
      {
        v7 = [(UpgradeClient *)self conn];
        pid_t v21 = xpc_connection_get_pid(v7);
      }
      else
      {
        pid_t v21 = -1;
      }
      *(_DWORD *)buffer = 136315650;
      *(void *)&buffer[4] = &v27;
      *(_WORD *)&buffer[12] = 1024;
      *(_DWORD *)&buffer[14] = v21;
      *(_WORD *)&buffer[18] = 1024;
      *(_DWORD *)&buffer[20] = 144;
      _os_log_impl((void *)&_mh_execute_header, v19, OS_LOG_TYPE_ERROR, "XPC client <process=%s pid=%d>: Client lacks entitlement.: %{darwin.errno}d", buffer, 0x18u);
      if (v20) {
    }
      }
    *__error() = v18;
    long long v25 = [(UpgradeClient *)self conn];
    xpc_connection_cancel(v25);

    id v9 = 0;
  }
  free(v9);
}

- (void)dealloc
{
  conn = self->_conn;
  if (conn) {
    xpc_connection_cancel(conn);
  }
  free(self->_cred);
  v4.receiver = self;
  v4.super_class = (Class)UpgradeClient;
  [(UpgradeClient *)&v4 dealloc];
}

- (OS_xpc_object)conn
{
  return (OS_xpc_object *)objc_getProperty(self, a2, 8, 1);
}

- (OS_os_transaction)transaction
{
  return (OS_os_transaction *)objc_getProperty(self, a2, 16, 1);
}

- (id)cancelHandler
{
  return objc_getProperty(self, a2, 24, 1);
}

- (OS_os_log)logHandle
{
  return (OS_os_log *)objc_getProperty(self, a2, 32, 1);
}

- (_rpc_cred)cred
{
  return self->_cred;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_logHandle, 0);
  objc_storeStrong(&self->_cancelHandler, 0);
  objc_storeStrong((id *)&self->_transaction, 0);

  objc_storeStrong((id *)&self->_conn, 0);
}

@end