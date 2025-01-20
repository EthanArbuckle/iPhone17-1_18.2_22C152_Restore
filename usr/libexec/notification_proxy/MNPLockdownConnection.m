@interface MNPLockdownConnection
- (MNPLockdownConnection)initWithConnection:(_lockdown_connection *)a3;
- (NSString)description;
- (OS_dispatch_queue)queue;
- (OS_os_transaction)transaction;
- (void)cancel;
- (void)dealloc;
- (void)listen;
- (void)sendMessage:(id)a3;
- (void)setQueue:(id)a3;
- (void)setTransaction:(id)a3;
- (void)shutdown;
@end

@implementation MNPLockdownConnection

- (void)cancel
{
}

- (void)dealloc
{
  lockdown_disconnect();
  v3.receiver = self;
  v3.super_class = (Class)MNPLockdownConnection;
  [(MNPLockdownConnection *)&v3 dealloc];
}

- (MNPLockdownConnection)initWithConnection:(_lockdown_connection *)a3
{
  v12.receiver = self;
  v12.super_class = (Class)MNPLockdownConnection;
  v4 = [(MNPLockdownConnection *)&v12 init];
  if (v4)
  {
    uint64_t v5 = os_transaction_create();
    transaction = v4->_transaction;
    v4->_transaction = (OS_os_transaction *)v5;

    v4->_conn = a3;
    v7 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    dispatch_queue_t v8 = dispatch_queue_create("com.apple.mobile.notification_proxy_io_queue", v7);
    queue = v4->_queue;
    v4->_queue = (OS_dispatch_queue *)v8;

    v10 = v4;
  }

  return v4;
}

- (void)sendMessage:(id)a3
{
  id v4 = a3;
  uint64_t v5 = v4;
  if (v4)
  {
    queue = self->_queue;
    v8[0] = _NSConcreteStackBlock;
    v8[1] = 3221225472;
    v8[2] = sub_100003864;
    v8[3] = &unk_100008330;
    v8[4] = self;
    id v9 = v4;
    dispatch_async((dispatch_queue_t)queue, v8);
  }
  else
  {
    v7 = qword_10000C958;
    if (os_log_type_enabled((os_log_t)qword_10000C958, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "Invalid input.", buf, 2u);
    }
  }
}

- (void)shutdown
{
  queue = self->_queue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_1000039D8;
  block[3] = &unk_100008358;
  block[4] = self;
  dispatch_async((dispatch_queue_t)queue, block);
}

- (void)listen
{
  objc_initWeak(&location, self);
  id v3 = &_os_log_default;
  if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
  {
    int socket = lockdown_get_socket();
    *(_DWORD *)buf = 67109120;
    int v15 = socket;
    _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "Lockdown socket: %d", buf, 8u);
  }

  int v5 = lockdown_get_socket();
  v6 = dispatch_source_create((dispatch_source_type_t)&_dispatch_source_type_read, v5, 0, (dispatch_queue_t)self->_queue);
  handler[0] = _NSConcreteStackBlock;
  handler[1] = 3221225472;
  handler[2] = sub_100003CDC;
  handler[3] = &unk_100008380;
  objc_copyWeak(&v12, &location);
  handler[4] = self;
  dispatch_source_set_event_handler(v6, handler);
  v9[0] = _NSConcreteStackBlock;
  v9[1] = 3221225472;
  v9[2] = sub_100004284;
  v9[3] = &unk_1000083A8;
  objc_copyWeak(&v10, &location);
  dispatch_source_set_cancel_handler(v6, v9);
  source = self->_source;
  self->_source = (OS_dispatch_source *)v6;
  dispatch_queue_t v8 = v6;

  dispatch_resume(v8);
  objc_destroyWeak(&v10);

  objc_destroyWeak(&v12);
  objc_destroyWeak(&location);
}

- (NSString)description
{
  return (NSString *)@"Lockdown";
}

- (OS_os_transaction)transaction
{
  return self->_transaction;
}

- (void)setTransaction:(id)a3
{
}

- (OS_dispatch_queue)queue
{
  return self->_queue;
}

- (void)setQueue:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_queue, 0);
  objc_storeStrong((id *)&self->_transaction, 0);

  objc_storeStrong((id *)&self->_source, 0);
}

@end