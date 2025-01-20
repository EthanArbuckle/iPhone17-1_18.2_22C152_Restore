@interface _NSDNXPCServer
- (NSString)serviceName;
- (_NSDNXPCServer)initWithConfiguration:(distnoted_configuration *)a3;
- (id)__invalidate;
- (id)allClients;
- (id)createEndpoint;
- (id)makeNewClient;
- (void)addInvalidationHandler:(id)a3;
- (void)dealloc;
- (void)invalidate;
- (void)setMakeNewClient:(id)a3;
- (void)setPrivileged:(BOOL)a3;
- (void)setServiceName:(id)a3;
- (void)start:(id)a3;
@end

@implementation _NSDNXPCServer

- (id)allClients
{
  id v2 = [(NSMutableArray *)self->_clients copy];

  return v2;
}

- (_NSDNXPCServer)initWithConfiguration:(distnoted_configuration *)a3
{
  v6.receiver = self;
  v6.super_class = (Class)_NSDNXPCServer;
  v3 = [(_NSDNXPCServer *)&v6 init];
  v3->_invalidHandlers = (NSMutableArray *)objc_opt_new();
  v3->_clients = (NSMutableArray *)objc_opt_new();
  v4 = v3;
  return v3;
}

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)_NSDNXPCServer;
  [(_NSDNXPCServer *)&v3 dealloc];
}

- (NSString)serviceName
{
  id v2 = self->_serviceName;

  return v2;
}

- (void)setServiceName:(id)a3
{
  if (self->_started || self->_invalid)
  {
    CFLog();
  }
  else
  {
    self->_serviceName = (NSString *)[a3 copy];
    _objc_release_x1();
  }
}

- (id)makeNewClient
{
  id v2 = self->_makeNewClient;

  return v2;
}

- (void)setMakeNewClient:(id)a3
{
  if (self->_started || self->_invalid)
  {
    CFLog();
  }
  else
  {
    self->_makeNewClient = [a3 copy];
    _objc_release_x1();
  }
}

- (void)setPrivileged:(BOOL)a3
{
  self->_priv = a3;
}

- (id)__invalidate
{
  id makeNewClient = self->_makeNewClient;
  self->_id makeNewClient = 0;
  invalidHandlers = self->_invalidHandlers;
  self->_invalidHandlers = 0;

  return invalidHandlers;
}

- (void)invalidate
{
  int invalid = self->_invalid;
  self->_int invalid = invalid + 1;
  if (invalid) {
    goto LABEL_4;
  }
  if (self->_conn)
  {
    xpc_connection_cancel(self->_conn);
LABEL_4:
    id v3 = 0;
    goto LABEL_5;
  }
  id v3 = [(_NSDNXPCServer *)self __invalidate];
LABEL_5:
  long long v10 = 0u;
  long long v11 = 0u;
  long long v8 = 0u;
  long long v9 = 0u;
  id v4 = [v3 countByEnumeratingWithState:&v8 objects:v12 count:16];
  if (v4)
  {
    id v5 = v4;
    uint64_t v6 = *(void *)v9;
    do
    {
      for (i = 0; i != v5; i = (char *)i + 1)
      {
        if (*(void *)v9 != v6) {
          objc_enumerationMutation(v3);
        }
        (*(void (**)(void))(*(void *)(*((void *)&v8 + 1) + 8 * i) + 16))();
      }
      id v5 = [v3 countByEnumeratingWithState:&v8 objects:v12 count:16];
    }
    while (v5);
  }
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
    if (self->_makeNewClient)
    {
      int started = self->_started;
      self->_int started = started + 1;
      if (!started)
      {
        CFStringRef serviceName = (const __CFString *)self->_serviceName;
        if (serviceName)
        {
          maxBufLen[0] = 0;
          v11.length = CFStringGetLength(serviceName);
          v11.location = 0;
          CFStringGetBytes(serviceName, v11, 0x8000100u, 0, 0, 0, 0, maxBufLen);
          id v7 = (UInt8 *)malloc_type_malloc(maxBufLen[0] + 1, 0x12400B2EuLL);
          v12.length = CFStringGetLength(serviceName);
          v12.location = 0;
          CFStringGetBytes(serviceName, v12, 0x8000100u, 0, 0, v7, maxBufLen[0], 0);
          v7[maxBufLen[0]] = 0;
          if (self->_priv) {
            uint64_t v8 = 3;
          }
          else {
            uint64_t v8 = 1;
          }
          mach_service = xpc_connection_create_mach_service((const char *)v7, (dispatch_queue_t)a3, v8);
        }
        else
        {
          mach_service = xpc_connection_create(0, (dispatch_queue_t)a3);
          id v7 = 0;
        }
        self->_conn = mach_service;
        maxBufLen[0] = (CFIndex)_NSConcreteStackBlock;
        maxBufLen[1] = 3221225472;
        maxBufLen[2] = (CFIndex)sub_100001E08;
        maxBufLen[3] = (CFIndex)&unk_100008548;
        maxBufLen[4] = (CFIndex)self;
        maxBufLen[5] = (CFIndex)a3;
        xpc_connection_set_event_handler(mach_service, maxBufLen);
        xpc_connection_activate(self->_conn);
        if (serviceName) {
          free(v7);
        }
      }
    }
    else
    {
      CFLog();
    }
  }
}

- (id)createEndpoint
{
  if (self->_serviceName) {
    return 0;
  }
  else {
    return xpc_endpoint_create(self->_conn);
  }
}

@end