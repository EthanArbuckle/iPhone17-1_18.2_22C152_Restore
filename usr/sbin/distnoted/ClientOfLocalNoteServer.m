@interface ClientOfLocalNoteServer
+ (ClientOfLocalNoteServer)monitor;
+ (void)setMonitor:(id)a3;
- (BOOL)isLoginWindow;
- (ClientOfLocalNoteServer)initWithClientConnection:(id)a3 configuration:(distnoted_configuration *)a4;
- (NSString)processName;
- (void)addInvalidationHandler:(id)a3;
- (void)dealloc;
- (void)dump;
- (void)enqueuePost:(id)a3;
- (void)flushQueue;
- (void)forward:(id)a3;
- (void)handlePost:(id)a3;
- (void)invalidate;
- (void)postNotification:(__CFString *)a3 object:(__CFString *)a4 token:(unint64_t)a5 options:(unint64_t)a6 immediate:(unsigned __int8)a7 userInfo:(id)a8;
- (void)start:(id)a3;
- (void)startMonitoring;
@end

@implementation ClientOfLocalNoteServer

- (ClientOfLocalNoteServer)initWithClientConnection:(id)a3 configuration:(distnoted_configuration *)a4
{
  v15.receiver = self;
  v15.super_class = (Class)ClientOfLocalNoteServer;
  v6 = [(ClientOfLocalNoteServer *)&v15 init];
  v6->_pid = xpc_connection_get_pid((xpc_connection_t)a3);
  v6->_pid = xpc_connection_get_pid((xpc_connection_t)a3);
  long long v13 = 0u;
  long long v14 = 0u;
  xpc_connection_get_audit_token();
  long long buffer = 0u;
  long long v17 = 0u;
  uint64_t v7 = sandbox_reference_retain_by_audit_token();
  *(void *)&v6->_started = 0;
  v6->_sandboxReference = v7;
  v6->_invalidHandlers = (NSMutableArray *)objc_opt_new();
  v6->_suspended = 0;
  v6->_registrar = (__CFXNotificationRegistrar *)CFXNotificationRegistrarCreate();
  v6->_parent = (_NSDNXPCServer *)a4->var1;
  v6->_queue = (OS_xpc_object *)xpc_array_create(0, 0);
  v6->_client = [[_NSDNXPCConnection alloc] initWithPeerConnection:a3];
  v8 = v6;
  client = v6->_client;
  v12[0] = _NSConcreteStackBlock;
  v12[1] = 3221225472;
  v12[2] = sub_10000395C;
  v12[3] = &unk_100008420;
  v12[4] = v6;
  [(_NSDNXPCConnection *)client addInvalidationHandler:v12];
  [(_NSDNXPCConnection *)v6->_client addTerminationImminentHandler:&stru_100008460];
  snprintf(v18, 0x100uLL, "ClientOfLocalNoteServer.0x%016lx.dq", v6);
  v11[0] = _NSConcreteStackBlock;
  v11[1] = 3221225472;
  v11[2] = sub_100002268;
  v11[3] = &unk_1000084B0;
  v11[4] = v6;
  v11[5] = a4;
  [(_NSDNXPCConnection *)v6->_client setHandleMessage:v11];
  return v6;
}

- (void)start:(id)a3
{
  int started = self->_started;
  self->_int started = started + 1;
  if (!started)
  {
    v5 = self->_client;
    if (v5)
    {
      v6 = v5;
      [(_NSDNXPCConnection *)v5 start:a3];
    }
  }
}

- (void)addInvalidationHandler:(id)a3
{
  id v4 = [a3 copy];
  [(NSMutableArray *)self->_invalidHandlers addObject:v4];
}

- (void)handlePost:(id)a3
{
  xpc_dictionary_get_value(a3, "name");
  id v4 = (const void *)_CFXPCCreateCFObjectFromXPCObject();
  xpc_dictionary_get_value(a3, "object");
  v5 = (const void *)_CFXPCCreateCFObjectFromXPCObject();
  xpc_dictionary_get_value(a3, "userinfo");
  xpc_dictionary_get_uint64(a3, "options");
  if (v4 && v5)
  {
    [+[ClientOfLocalNoteServer monitor] forward:a3];
    bzero(v6, 0x810uLL);
    v6[1] = &v7;
    CFXNotificationRegistrarFind();
    _CFXNotificationRegistrationBufferDestroy();
  }
  if (v4) {
    CFRelease(v4);
  }
  if (v5) {
    CFRelease(v5);
  }
}

+ (ClientOfLocalNoteServer)monitor
{
  return (ClientOfLocalNoteServer *)qword_10000CDE0;
}

- (BOOL)isLoginWindow
{
  return 0;
}

+ (void)setMonitor:(id)a3
{
  if ((id)qword_10000CDE0 != a3)
  {

    qword_10000CDE0 = (uint64_t)a3;
  }
}

- (NSString)processName
{
  int v2 = proc_pidpath(self->_pid, buffer, 0x1000u);
  if (v2 < 1) {
    return (NSString *)@"(Unknown)";
  }
  CFIndex v3 = v2;
  CFStringEncoding v4 = CFStringFileSystemEncoding();
  return (NSString *)(id)CFStringCreateWithBytes(kCFAllocatorSystemDefault, buffer, v3, v4, 0);
}

- (void)startMonitoring
{
  if (![(_NSDNXPCConnection *)self->_client euid])
  {
    +[ClientOfLocalNoteServer setMonitor:self];
  }
}

- (void)dump
{
  if (![(_NSDNXPCConnection *)self->_client euid])
  {
    xpc_object_t v3 = xpc_array_create(0, 0);
    long long v15 = 0u;
    long long v16 = 0u;
    long long v17 = 0u;
    long long v18 = 0u;
    v12 = self;
    id obj = [(_NSDNXPCServer *)self->_parent allClients];
    id v4 = [obj countByEnumeratingWithState:&v15 objects:v21 count:16];
    if (v4)
    {
      id v5 = v4;
      uint64_t v6 = *(void *)v16;
      do
      {
        for (i = 0; i != v5; i = (char *)i + 1)
        {
          if (*(void *)v16 != v6) {
            objc_enumerationMutation(obj);
          }
          v8 = *(int **)(*((void *)&v15 + 1) + 8 * i);
          xpc_object_t v9 = xpc_dictionary_create(0, 0, 0);
          xpc_dictionary_set_string(v9, "process", (const char *)[objc_msgSend(objc_msgSend(v8, "processName"), "UTF8String") UTF8String]);
          xpc_dictionary_set_int64(v9, "pid", v8[18]);
          xpc_object_t v14 = xpc_array_create(0, 0);
          CFXNotificationRegistrarEnumerate();
          xpc_dictionary_set_value(v9, "registrations", v14);
          xpc_release(v14);
          xpc_array_append_value(v3, v9);
          xpc_release(v9);
        }
        id v5 = [obj countByEnumeratingWithState:&v15 objects:v21 count:16];
      }
      while (v5);
    }
    xpc_object_t v10 = xpc_string_create("dump");
    *(_OWORD *)keys = off_100008408;
    values[0] = v10;
    values[1] = v3;
    xpc_object_t v11 = xpc_dictionary_create((const char *const *)keys, values, 2uLL);
    xpc_release(v10);
    xpc_release(v3);
    [(_NSDNXPCConnection *)v12->_client sendMessage:v11];
    xpc_release(v11);
  }
}

- (void)dealloc
{
  if ((self->_sandboxReference & 0x8000000000000000) == 0) {
    sandbox_reference_release();
  }
  CFRelease(self->_registrar);
  xpc_release(self->_queue);
  v3.receiver = self;
  v3.super_class = (Class)ClientOfLocalNoteServer;
  [(ClientOfLocalNoteServer *)&v3 dealloc];
}

- (void)invalidate
{
  int invalid = self->_invalid;
  self->_int invalid = invalid + 1;
  if (!invalid)
  {
    client = self->_client;
    self->_client = 0;
    invalidHandlers = self->_invalidHandlers;
    self->_invalidHandlers = 0;
    [(_NSDNXPCConnection *)client invalidate];

    long long v12 = 0u;
    long long v13 = 0u;
    long long v10 = 0u;
    long long v11 = 0u;
    id v6 = [(NSMutableArray *)invalidHandlers countByEnumeratingWithState:&v10 objects:v14 count:16];
    if (v6)
    {
      id v7 = v6;
      uint64_t v8 = *(void *)v11;
      do
      {
        for (i = 0; i != v7; i = (char *)i + 1)
        {
          if (*(void *)v11 != v8) {
            objc_enumerationMutation(invalidHandlers);
          }
          (*(void (**)(void))(*(void *)(*((void *)&v10 + 1) + 8 * i) + 16))();
        }
        id v7 = [(NSMutableArray *)invalidHandlers countByEnumeratingWithState:&v10 objects:v14 count:16];
      }
      while (v7);
    }

    getpid();
  }
  if (+[ClientOfLocalNoteServer monitor] == self) {
    +[ClientOfLocalNoteServer setMonitor:0];
  }
}

- (void)flushQueue
{
  queue = self->_queue;
  applier[0] = _NSConcreteStackBlock;
  applier[1] = 3221225472;
  applier[2] = sub_100003FA0;
  applier[3] = &unk_100008488;
  applier[4] = self;
  xpc_array_apply(queue, applier);
  xpc_release(self->_queue);
  self->_queue = (OS_xpc_object *)xpc_array_create(0, 0);
}

- (void)enqueuePost:(id)a3
{
  xpc_array_append_value(self->_queue, a3);
  if (xpc_array_get_count(self->_queue) >= 0x1F4)
  {
    [(ClientOfLocalNoteServer *)self flushQueue];
  }
}

- (void)postNotification:(__CFString *)a3 object:(__CFString *)a4 token:(unint64_t)a5 options:(unint64_t)a6 immediate:(unsigned __int8)a7 userInfo:(id)a8
{
  if (a3)
  {
    if (a4)
    {
      int v10 = a7;
      CFTypeID v14 = CFGetTypeID(a4);
      if (v14 == CFStringGetTypeID())
      {
        CFTypeID v15 = CFGetTypeID(a4);
        if (v15 == CFStringGetTypeID())
        {
          v28 = 0;
          xpc_object_t v26 = 0;
          keys[0] = "method";
          values[0] = xpc_string_create("post_token");
          keys[1] = "version";
          values[1] = xpc_uint64_create(1uLL);
          keys[2] = "token";
          xpc_object_t values[2] = xpc_uint64_create(a5);
          keys[3] = "name";
          values[3] = (xpc_object_t)_CFXPCCreateXPCObjectFromCFObject();
          keys[4] = "object";
          values[4] = (xpc_object_t)_CFXPCCreateXPCObjectFromCFObject();
          if (a8)
          {
            v28 = "userinfo";
            xpc_object_t v26 = xpc_retain(a8);
            size_t v16 = 6;
          }
          else
          {
            size_t v16 = 5;
          }
          xpc_object_t v17 = xpc_dictionary_create((const char *const *)keys, values, v16);
          unint64_t v18 = 0;
          uint64_t v19 = 8 * v16;
          do
          {
            xpc_release(values[v18 / 8]);
            v18 += 8;
          }
          while (v19 != v18);
          if (v10 || (a6 & 1) != 0 || !self->_suspended)
          {
            if (v10 || (a6 & 1) != 0) {
              [(ClientOfLocalNoteServer *)self flushQueue];
            }
            [(_NSDNXPCConnection *)self->_client sendMessage:v17];
            goto LABEL_24;
          }
          if (a6 != 8)
          {
            if (a6 == 2 || (a6 & 4) == 0) {
              goto LABEL_24;
            }
            v20 = (OS_xpc_object *)xpc_array_create(0, 0);
            string = xpc_dictionary_get_string(v17, "name");
            v22 = xpc_dictionary_get_string(v17, "object");
            queue = self->_queue;
            v24[0] = _NSConcreteStackBlock;
            v24[1] = 3221225472;
            v24[2] = sub_1000043BC;
            v24[3] = &unk_1000084D8;
            v24[6] = a5;
            v24[7] = string;
            v24[8] = v22;
            v24[4] = v17;
            v24[5] = v20;
            xpc_array_apply(queue, v24);
            xpc_release(self->_queue);
            self->_queue = v20;
          }
          [(ClientOfLocalNoteServer *)self enqueuePost:v17];
LABEL_24:
          xpc_release(v17);
        }
      }
    }
  }
}

- (void)forward:(id)a3
{
}

@end