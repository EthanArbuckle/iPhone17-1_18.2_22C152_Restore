@interface LocalSocketProxy
- (LocalSocketProxy)initWithLocalSocketPath:(id)a3;
- (void)_cancel;
- (void)_flushWaiters;
- (void)_listenerReady;
- (void)_newConnection:(id)a3;
- (void)_withPort:(id)a3;
- (void)cancel;
- (void)dealloc;
- (void)start;
- (void)withPort:(id)a3;
@end

@implementation LocalSocketProxy

- (LocalSocketProxy)initWithLocalSocketPath:(id)a3
{
  id v5 = a3;
  v13.receiver = self;
  v13.super_class = (Class)LocalSocketProxy;
  v6 = [(LocalSocketProxy *)&v13 init];
  if (v6)
  {
    v7 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    dispatch_queue_t v8 = dispatch_queue_create("LocalSocketProxy", v7);
    queue = v6->_queue;
    v6->_queue = (OS_dispatch_queue *)v8;

    objc_storeStrong((id *)&v6->_path, a3);
    uint64_t v10 = objc_opt_new();
    connections = v6->_connections;
    v6->_connections = (NSMutableSet *)v10;
  }
  return v6;
}

- (void)dealloc
{
  v3 = _PKLogCategory(PKLogCategoryNetwork[0]);
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "LocalSocketProxy: Dealloc", buf, 2u);
  }

  v4.receiver = self;
  v4.super_class = (Class)LocalSocketProxy;
  [(LocalSocketProxy *)&v4 dealloc];
}

- (void)start
{
  v3 = _PKLogCategory(PKLogCategoryNetwork[0]);
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    path = self->_path;
    *(_DWORD *)buf = 138412290;
    v16 = path;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "LocalSocketProxy: Started to path %@", buf, 0xCu);
  }

  secure_tcp = nw_parameters_create_secure_tcp(_nw_parameters_configure_protocol_disable, _nw_parameters_configure_protocol_default_configuration);
  nw_parameters_set_required_interface_type(secure_tcp, nw_interface_type_loopback);
  v6 = (OS_nw_listener *)nw_listener_create(secure_tcp);
  listener = self->_listener;
  self->_listener = v6;

  nw_listener_set_queue((nw_listener_t)self->_listener, (dispatch_queue_t)self->_queue);
  objc_initWeak(&location, self);
  v12[1] = _NSConcreteStackBlock;
  v12[2] = (id)3221225472;
  v12[3] = sub_1000287F8;
  v12[4] = &unk_1000A2248;
  objc_copyWeak(&v13, &location);
  v12[5] = self;
  nw_listener_set_event_handler();
  dispatch_queue_t v8 = self->_listener;
  v11[0] = _NSConcreteStackBlock;
  v11[1] = 3221225472;
  v11[2] = sub_100028894;
  v11[3] = &unk_1000A2270;
  objc_copyWeak(v12, &location);
  nw_listener_set_new_connection_handler(v8, v11);
  v9 = _PKLogCategory(PKLogCategoryNetwork[0]);
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v10 = self->_listener;
    *(_DWORD *)buf = 134218242;
    v16 = v10;
    __int16 v17 = 2112;
    v18 = v10;
    _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, "LocalSocketProxy: Starting listener %p <%@>", buf, 0x16u);
  }

  nw_listener_start((nw_listener_t)self->_listener);
  objc_destroyWeak(v12);
  objc_destroyWeak(&v13);
  objc_destroyWeak(&location);
}

- (void)_newConnection:(id)a3
{
  objc_super v4 = (LocalProxyConnection *)a3;
  id v5 = _PKLogCategory(PKLogCategoryNetwork[0]);
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    id v13 = v4;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "LocalSocketProxy: New connection %@", buf, 0xCu);
  }

  v6 = [[LocalProxyConnection alloc] initWithConnection:v4 path:self->_path queue:self->_queue];
  [(NSMutableSet *)self->_connections addObject:v6];
  v7 = self->_connections;
  v10[0] = _NSConcreteStackBlock;
  v10[1] = 3221225472;
  v10[2] = sub_100028B08;
  v10[3] = &unk_1000A2298;
  dispatch_queue_t v8 = v7;
  v11 = v8;
  [(LocalProxyConnection *)v6 setCleanupBlock:v10];
  [(LocalProxyConnection *)v6 start];
  v9 = _PKLogCategory(PKLogCategoryNetwork[0]);
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    id v13 = v6;
    _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, "LocalSocketProxy: Started proxy %@", buf, 0xCu);
  }
}

- (void)_listenerReady
{
  self->_int port = nw_listener_get_port((nw_listener_t)self->_listener);
  v3 = _PKLogCategory(PKLogCategoryNetwork[0]);
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    listener = self->_listener;
    int port = self->_port;
    int v6 = 138412546;
    v7 = listener;
    __int16 v8 = 1024;
    int v9 = port;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "LocalSocketProxy: Listener %@ ready on port %d", (uint8_t *)&v6, 0x12u);
  }

  [(LocalSocketProxy *)self _flushWaiters];
}

- (void)_flushWaiters
{
  v3 = self->_waiters;
  waiters = self->_waiters;
  self->_waiters = 0;

  if (v3)
  {
    unsigned __int16 port = self->_port;
    v6[0] = _NSConcreteStackBlock;
    v6[1] = 3221225472;
    v6[2] = sub_100028C9C;
    v6[3] = &unk_1000A22B8;
    unsigned __int16 v7 = port;
    [(NSArray *)v3 enumerateObjectsUsingBlock:v6];
  }
}

- (void)withPort:(id)a3
{
  id v4 = a3;
  objc_initWeak(&location, self);
  queue = self->_queue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100028D84;
  block[3] = &unk_1000A22E0;
  objc_copyWeak(&v9, &location);
  id v8 = v4;
  id v6 = v4;
  dispatch_async(queue, block);

  objc_destroyWeak(&v9);
  objc_destroyWeak(&location);
}

- (void)_withPort:(id)a3
{
  id v4 = (void (**)(void))a3;
  id v5 = v4;
  if (!self->_listener || self->_port)
  {
    v4[2](v4);
  }
  else
  {
    waiters = self->_waiters;
    unsigned __int16 v7 = objc_retainBlock(v4);
    id v8 = v7;
    if (waiters)
    {
      id v9 = [(NSArray *)waiters arrayByAddingObject:v7];
      uint64_t v10 = self->_waiters;
      self->_waiters = v9;
    }
    else
    {
      id v13 = v7;
      v11 = +[NSArray arrayWithObjects:&v13 count:1];
      v12 = self->_waiters;
      self->_waiters = v11;
    }
  }
}

- (void)_cancel
{
  listener = self->_listener;
  if (listener)
  {
    nw_listener_cancel(listener);
    id v4 = self->_listener;
    self->_listener = 0;
  }
  self->_unsigned __int16 port = 0;

  [(LocalSocketProxy *)self _flushWaiters];
}

- (void)cancel
{
  objc_initWeak(&location, self);
  queue = self->_queue;
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472;
  v4[2] = sub_100029058;
  v4[3] = &unk_1000A2308;
  objc_copyWeak(&v5, &location);
  dispatch_async(queue, v4);
  objc_destroyWeak(&v5);
  objc_destroyWeak(&location);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_connections, 0);
  objc_storeStrong((id *)&self->_waiters, 0);
  objc_storeStrong((id *)&self->_listener, 0);
  objc_storeStrong((id *)&self->_path, 0);

  objc_storeStrong((id *)&self->_queue, 0);
}

@end