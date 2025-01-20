@interface _NSDNXPCConnection
- (NSString)serviceName;
- (OS_xpc_object)XPCConnection;
- (_NSDNXPCConnection)initWithEndpoint:(id)a3;
- (_NSDNXPCConnection)initWithPeerConnection:(id)a3;
- (_NSDNXPCConnection)initWithReceivedConnection:(id)a3;
- (_NSDNXPCConnection)initWithServiceName:(id)a3 privileged:(BOOL)a4;
- (_NSDNXPCConnection)initWithXPCConnection:(id)a3 type:(int)a4;
- (id)__invalidate;
- (id)handleMessage;
- (unsigned)euid;
- (void)__terminationImminent;
- (void)addInvalidationHandler:(id)a3;
- (void)addTerminationImminentHandler:(id)a3;
- (void)dealloc;
- (void)invalidate;
- (void)sendMessage:(id)a3;
- (void)sendMessage:(id)a3 waitForAck:(BOOL)a4;
- (void)setHandleMessage:(id)a3;
- (void)start:(id)a3;
@end

@implementation _NSDNXPCConnection

- (void)setHandleMessage:(id)a3
{
  if (self->_started || self->_invalid)
  {
    __break(1u);
  }
  else
  {
    self->_handleMessage = [a3 copy];
  }
  _objc_release_x1();
}

- (_NSDNXPCConnection)initWithXPCConnection:(id)a3 type:(int)a4
{
  v4 = self;
  if (a3)
  {
    self->_invalidHandlers = (NSMutableArray *)objc_opt_new();
    v4->_termImminentHandlers = (NSMutableArray *)objc_opt_new();
    v4->_flavor = a4;
    v7 = (_xpc_connection_s *)xpc_retain(a3);
    v4->_conn = v7;
    handler[0] = _NSConcreteStackBlock;
    handler[1] = 3221225472;
    handler[2] = sub_100001650;
    handler[3] = &unk_100008650;
    handler[4] = v7;
    handler[5] = v4;
    int v11 = a4;
    xpc_connection_set_event_handler(v7, handler);
    v8 = v4;
  }
  else
  {

    return 0;
  }
  return v4;
}

- (_NSDNXPCConnection)initWithPeerConnection:(id)a3
{
  return [(_NSDNXPCConnection *)self initWithXPCConnection:a3 type:3];
}

- (void)addTerminationImminentHandler:(id)a3
{
  id v4 = [a3 copy];
  [(NSMutableArray *)self->_termImminentHandlers addObject:v4];
}

- (void)addInvalidationHandler:(id)a3
{
  id v5 = [a3 copy];
  invalidHandlers = self->_invalidHandlers;
  id v7 = v5;
  -[NSMutableArray addObject:](invalidHandlers, "addObject:");
  if (!invalidHandlers) {
    (*((void (**)(id))a3 + 2))(a3);
  }
}

- (void)start:(id)a3
{
  if (!self->_invalid)
  {
    int started = self->_started;
    self->_int started = started + 1;
    if (!started)
    {
      if (a3) {
        xpc_connection_set_target_queue(self->_conn, (dispatch_queue_t)a3);
      }
      conn = self->_conn;
      xpc_connection_activate(conn);
    }
  }
}

- (void)dealloc
{
  conn = self->_conn;
  if (conn) {
    xpc_release(conn);
  }
  v4.receiver = self;
  v4.super_class = (Class)_NSDNXPCConnection;
  [(_NSDNXPCConnection *)&v4 dealloc];
}

- (_NSDNXPCConnection)initWithServiceName:(id)a3 privileged:(BOOL)a4
{
  if (a3)
  {
    BOOL v5 = a4;
    CFIndex maxBufLen = 0;
    v14.length = CFStringGetLength((CFStringRef)a3);
    v14.location = 0;
    CFStringGetBytes((CFStringRef)a3, v14, 0x8000100u, 0, 0, 0, 0, &maxBufLen);
    id v7 = (UInt8 *)malloc_type_malloc(maxBufLen + 1, 0x7C7219A6uLL);
    v15.length = CFStringGetLength((CFStringRef)a3);
    v15.location = 0;
    CFStringGetBytes((CFStringRef)a3, v15, 0x8000100u, 0, 0, v7, maxBufLen, 0);
    v7[maxBufLen] = 0;
    if (v5) {
      uint64_t v8 = 2;
    }
    else {
      uint64_t v8 = 0;
    }
    xpc_connection_t mach_service = xpc_connection_create_mach_service((const char *)v7, 0, v8);
    v10 = [(_NSDNXPCConnection *)self initWithXPCConnection:mach_service type:4];
    if (mach_service) {
      xpc_release(mach_service);
    }
    free(v7);
    return v10;
  }
  else
  {
    return -[_NSDNXPCConnection initWithXPCConnection:type:](self, "initWithXPCConnection:type:");
  }
}

- (_NSDNXPCConnection)initWithEndpoint:(id)a3
{
  xpc_connection_t v4 = xpc_connection_create_from_endpoint((xpc_endpoint_t)a3);
  BOOL v5 = [(_NSDNXPCConnection *)self initWithXPCConnection:v4 type:4];
  xpc_release(v4);
  return v5;
}

- (_NSDNXPCConnection)initWithReceivedConnection:(id)a3
{
  return [(_NSDNXPCConnection *)self initWithXPCConnection:a3 type:5];
}

- (NSString)serviceName
{
  v2 = self->_serviceName;

  return v2;
}

- (unsigned)euid
{
  return xpc_connection_get_euid(self->_conn);
}

- (OS_xpc_object)XPCConnection
{
  return self->_conn;
}

- (id)handleMessage
{
  id v2 = self->_handleMessage;

  return v2;
}

- (id)__invalidate
{
  id handleMessage = self->_handleMessage;
  invalidHandlers = self->_invalidHandlers;
  self->_id handleMessage = 0;
  self->_invalidHandlers = 0;

  return invalidHandlers;
}

- (void)__terminationImminent
{
  termImminentHandlers = self->_termImminentHandlers;
  self->_termImminentHandlers = 0;
  long long v7 = 0u;
  long long v8 = 0u;
  long long v9 = 0u;
  long long v10 = 0u;
  id v3 = [(NSMutableArray *)termImminentHandlers countByEnumeratingWithState:&v7 objects:v11 count:16];
  if (v3)
  {
    id v4 = v3;
    uint64_t v5 = *(void *)v8;
    do
    {
      v6 = 0;
      do
      {
        if (*(void *)v8 != v5) {
          objc_enumerationMutation(termImminentHandlers);
        }
        (*(void (**)(void))(*(void *)(*((void *)&v7 + 1) + 8 * (void)v6) + 16))();
        v6 = (char *)v6 + 1;
      }
      while (v4 != v6);
      id v4 = [(NSMutableArray *)termImminentHandlers countByEnumeratingWithState:&v7 objects:v11 count:16];
    }
    while (v4);
  }
}

- (void)invalidate
{
  int invalid = self->_invalid;
  self->_int invalid = invalid + 1;
  if (invalid)
  {
    id v3 = 0;
  }
  else
  {
    id v3 = [(NSMutableArray *)self->_invalidHandlers copy];

    self->_invalidHandlers = 0;
    conn = self->_conn;
    if (conn)
    {
      xpc_connection_cancel(conn);
      int started = self->_started;
      self->_int started = started + 1;
      if (!started) {
        xpc_connection_activate(self->_conn);
      }
    }
  }
  long long v13 = 0u;
  long long v14 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  id v4 = [v3 countByEnumeratingWithState:&v11 objects:v15 count:16];
  if (v4)
  {
    id v5 = v4;
    uint64_t v6 = *(void *)v12;
    do
    {
      for (i = 0; i != v5; i = (char *)i + 1)
      {
        if (*(void *)v12 != v6) {
          objc_enumerationMutation(v3);
        }
        (*(void (**)(void))(*(void *)(*((void *)&v11 + 1) + 8 * i) + 16))();
      }
      id v5 = [v3 countByEnumeratingWithState:&v11 objects:v15 count:16];
    }
    while (v5);
  }
}

- (void)sendMessage:(id)a3
{
  if (a3 && xpc_get_type(a3) == (xpc_type_t)&_xpc_type_dictionary)
  {
    id v4 = self;
    id v5 = self;
    if (self->_conn)
    {
      xpc_transaction_begin();
      xpc_connection_send_message(self->_conn, a3);
      xpc_connection_send_barrier(self->_conn, &stru_100008628);
      id v5 = self;
    }
  }
  else
  {
    __break(1u);
  }
}

- (void)sendMessage:(id)a3 waitForAck:(BOOL)a4
{
  if (a3 && (BOOL v4 = a4, xpc_get_type(a3) == (xpc_type_t)&_xpc_type_dictionary))
  {
    xpc_dictionary_set_BOOL(a3, "com.apple.NSXPC.msg_needs_ack", 1);
    uint64_t v6 = self;
    conn = self->_conn;
    if (conn)
    {
      xpc_retain(self->_conn);
      xpc_transaction_begin();
      if (v4)
      {
        xpc_object_t v8 = xpc_connection_send_message_with_reply_sync(conn, a3);
        if (v8) {
          xpc_release(v8);
        }
      }
      else
      {
        xpc_connection_send_message(conn, a3);
      }
      xpc_transaction_end();
      xpc_release(conn);
    }
    xpc_dictionary_set_value(a3, "com.apple.NSXPC.msg_needs_ack", 0);
  }
  else
  {
    __break(1u);
  }
}

@end