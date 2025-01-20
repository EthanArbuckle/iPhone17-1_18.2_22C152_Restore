@interface NFSecureXPCEventPublisher
- (BOOL)available;
- (NFSecureXPCEventPublisher)initWithMachPort:(id)a3 queue:(id)a4;
- (NSString)serviceName;
- (OS_dispatch_queue)queue;
- (OS_xpc_object)connection;
- (void)dealloc;
- (void)sendEvent:(id)a3;
- (void)setAvailable:(BOOL)a3;
- (void)setConnection:(id)a3;
- (void)setQueue:(id)a3;
- (void)setServiceName:(id)a3;
@end

@implementation NFSecureXPCEventPublisher

- (void)dealloc
{
  if ([(NFSecureXPCEventPublisher *)self available])
  {
    v3 = [(NFSecureXPCEventPublisher *)self connection];
    xpc_connection_cancel(v3);
  }
  v4.receiver = self;
  v4.super_class = (Class)NFSecureXPCEventPublisher;
  [(NFSecureXPCEventPublisher *)&v4 dealloc];
}

- (NFSecureXPCEventPublisher)initWithMachPort:(id)a3 queue:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v25.receiver = self;
  v25.super_class = (Class)NFSecureXPCEventPublisher;
  v9 = [(NFSecureXPCEventPublisher *)&v25 init];
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_serviceName, a3);
    id v11 = v7;
    v12 = (const char *)[v11 UTF8String];
    if (v8)
    {
      v13 = (OS_dispatch_queue *)v8;
      queue = v10->_queue;
      v10->_queue = v13;
    }
    else
    {
      queue = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
      dispatch_queue_t v15 = dispatch_queue_create(v12, queue);
      v16 = v10->_queue;
      v10->_queue = (OS_dispatch_queue *)v15;
    }
    xpc_connection_t mach_service = xpc_connection_create_mach_service(v12, (dispatch_queue_t)v10->_queue, 2uLL);
    connection = v10->_connection;
    v10->_connection = mach_service;

    objc_initWeak(&location, v10);
    v19 = v10->_connection;
    handler[0] = _NSConcreteStackBlock;
    handler[1] = 3221225472;
    handler[2] = sub_100057AD4;
    handler[3] = &unk_10040DB00;
    objc_copyWeak(&v23, &location);
    id v22 = v11;
    xpc_connection_set_event_handler(v19, handler);
    v10->_available = 1;
    xpc_connection_activate(v10->_connection);

    objc_destroyWeak(&v23);
    objc_destroyWeak(&location);
  }

  return v10;
}

- (void)sendEvent:(id)a3
{
  id v4 = a3;
  if ([(NFSecureXPCEventPublisher *)self available])
  {
    xpc_type_t type = xpc_get_type(v4);
    if (type == (xpc_type_t)&_xpc_type_dictionary)
    {
      id v7 = [(NFSecureXPCEventPublisher *)self connection];
      xpc_connection_send_notification();
    }
    else
    {
      v6 = type;
      id v7 = SESDefaultLogObject();
      if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
      {
        int v10 = 136315138;
        name = xpc_type_get_name(v6);
        _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_ERROR, "Invalid event type: %s", (uint8_t *)&v10, 0xCu);
      }
    }
  }
  else
  {
    id v8 = SESDefaultLogObject();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    {
      v9 = [(NFSecureXPCEventPublisher *)self serviceName];
      int v10 = 138412290;
      name = v9;
      _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_ERROR, "Service unavailable: %@", (uint8_t *)&v10, 0xCu);
    }
  }
}

- (NSString)serviceName
{
  return self->_serviceName;
}

- (void)setServiceName:(id)a3
{
}

- (OS_dispatch_queue)queue
{
  return self->_queue;
}

- (void)setQueue:(id)a3
{
}

- (OS_xpc_object)connection
{
  return self->_connection;
}

- (void)setConnection:(id)a3
{
}

- (BOOL)available
{
  return self->_available;
}

- (void)setAvailable:(BOOL)a3
{
  self->_available = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_connection, 0);
  objc_storeStrong((id *)&self->_queue, 0);

  objc_storeStrong((id *)&self->_serviceName, 0);
}

@end