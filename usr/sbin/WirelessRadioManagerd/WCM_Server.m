@interface WCM_Server
+ (id)allocWithZone:(_NSZone *)a3;
+ (id)singleton;
- (WCM_Server)init;
- (id)getQueue;
- (id)getSessionFor:(int)a3;
- (id)getSessionSync:(int)a3;
- (void)addSessionToList:(id)a3;
- (void)dealloc;
- (void)enterTestMode;
- (void)existingSessions;
- (void)exitTestMode;
- (void)handleConnection:(id)a3;
- (void)handleEvent:(id)a3;
- (void)handleXPCEvent:(id)a3;
- (void)removeSessionFromList:(id)a3;
- (void)startService;
@end

@implementation WCM_Server

- (id)getQueue
{
  return self->mQueue;
}

+ (id)singleton
{
  id result = (id)qword_10027D0C0;
  if (!qword_10027D0C0)
  {
    v4.receiver = a1;
    v4.super_class = (Class)&OBJC_METACLASS___WCM_Server;
    id result = [[[objc_msgSendSuper2(&v4, "allocWithZone:", 0) init];
    qword_10027D0C0 = (uint64_t)result;
  }
  return result;
}

+ (id)allocWithZone:(_NSZone *)a3
{
  id v3 = [a1 singleton:a3];

  return v3;
}

- (WCM_Server)init
{
  v5.receiver = self;
  v5.super_class = (Class)WCM_Server;
  v2 = [(WCM_Server *)&v5 init];
  id v3 = v2;
  if (v2)
  {
    v2->mConnection = 0;
    v2->testMode = 0;
    v2->mQueue = (OS_dispatch_queue *)dispatch_queue_create("com.apple.WRMServer", 0);
    v3->mClientSessions = (NSMutableArray *)objc_alloc_init((Class)NSMutableArray);
  }
  return v3;
}

- (void)dealloc
{
  mConnection = self->mConnection;
  if (mConnection) {
    xpc_release(mConnection);
  }
  mQueue = self->mQueue;
  if (mQueue) {
    dispatch_release(mQueue);
  }
  mClientSessions = self->mClientSessions;
  if (mClientSessions) {

  }
  v6.receiver = self;
  v6.super_class = (Class)WCM_Server;
  [(WCM_Server *)&v6 dealloc];
}

- (void)startService
{
  global_queue = dispatch_get_global_queue(0, 0);
  mach_service = xpc_connection_create_mach_service("com.apple.WirelessCoexManager", global_queue, 1uLL);
  self->mConnection = mach_service;
  if (!mach_service)
  {
    +[WCM_Logging logLevel:0 message:@"Failed to create XPC server. Exiting."];
    exit(0);
  }
  handler[0] = _NSConcreteStackBlock;
  handler[1] = 3221225472;
  handler[2] = sub_100086BC8;
  handler[3] = &unk_10020F458;
  handler[4] = self;
  xpc_connection_set_event_handler(mach_service, handler);
  xpc_connection_resume(self->mConnection);
}

- (void)handleEvent:(id)a3
{
  mQueue = self->mQueue;
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472;
  v4[2] = sub_100086C48;
  v4[3] = &unk_10020DAB0;
  v4[4] = self;
  v4[5] = a3;
  dispatch_async(mQueue, v4);
}

- (void)handleXPCEvent:(id)a3
{
  xpc_type_t type = xpc_get_type(a3);
  +[WCM_Logging logLevel:2, @"WCM_Server: Handling XPC Event : %@", a3 message];
  if (type == (xpc_type_t)&_xpc_type_connection)
  {
    +[WCM_Logging logLevel:2 message:@"WCM_Server: Handling XPC Connection Event"];
    [(WCM_Server *)self handleConnection:a3];
  }
  else if (type == (xpc_type_t)&_xpc_type_error)
  {
    +[WCM_Logging logLevel:0, @"WCM_Server: XPC server error: %s", xpc_dictionary_get_string(a3, _xpc_error_key_description) message];
  }
  else if (type == (xpc_type_t)&_xpc_type_dictionary)
  {
    +[WCM_Logging logLevel:2, @"Received new message %@", a3 message];
  }
  else
  {
    objc_super v6 = xpc_copy_description(a3);
    +[WCM_Logging logLevel:0, @"Unexpected XPC server event: %s", v6 message];
    free(v6);
  }
}

- (void)handleConnection:(id)a3
{
  if (!self->testMode)
  {
    objc_super v5 = objc_alloc_init(WCM_Session);
    [(WCM_Session *)v5 initWithConnection:a3];
    [(WCM_Server *)self addSessionToList:v5];
  }
}

- (void)addSessionToList:(id)a3
{
  [(NSMutableArray *)self->mClientSessions addObject:a3];

  [(WCM_Server *)self existingSessions];
}

- (void)removeSessionFromList:(id)a3
{
  [(NSMutableArray *)self->mClientSessions removeObject:a3];

  [(WCM_Server *)self existingSessions];
}

- (id)getSessionFor:(int)a3
{
  uint64_t v8 = 0;
  v9 = &v8;
  uint64_t v10 = 0x3052000000;
  v11 = sub_100086F7C;
  v12 = sub_100086F8C;
  uint64_t v13 = 0;
  mQueue = self->mQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100086F98;
  block[3] = &unk_10020F480;
  int v7 = a3;
  block[4] = self;
  block[5] = &v8;
  dispatch_async(mQueue, block);
  objc_super v4 = (void *)v9[5];
  _Block_object_dispose(&v8, 8);
  return v4;
}

- (id)getSessionSync:(int)a3
{
  [(WCM_Server *)self existingSessions];
  long long v14 = 0u;
  long long v15 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  mClientSessions = self->mClientSessions;
  id v6 = [(NSMutableArray *)mClientSessions countByEnumeratingWithState:&v12 objects:v16 count:16];
  if (!v6) {
    return 0;
  }
  id v7 = v6;
  uint64_t v8 = *(void *)v13;
LABEL_3:
  uint64_t v9 = 0;
  while (1)
  {
    if (*(void *)v13 != v8) {
      objc_enumerationMutation(mClientSessions);
    }
    uint64_t v10 = *(void **)(*((void *)&v12 + 1) + 8 * v9);
    if ([v10 getProcessId] == a3) {
      return v10;
    }
    if (v7 == (id)++v9)
    {
      id v7 = [(NSMutableArray *)mClientSessions countByEnumeratingWithState:&v12 objects:v16 count:16];
      if (v7) {
        goto LABEL_3;
      }
      return 0;
    }
  }
}

- (void)existingSessions
{
  +[WCM_Logging logLevel:2, @"WCM_Server: %d active sessions", [(NSMutableArray *)self->mClientSessions count] message];
  long long v10 = 0u;
  long long v11 = 0u;
  long long v8 = 0u;
  long long v9 = 0u;
  mClientSessions = self->mClientSessions;
  id v4 = [(NSMutableArray *)mClientSessions countByEnumeratingWithState:&v8 objects:v12 count:16];
  if (v4)
  {
    id v5 = v4;
    uint64_t v6 = *(void *)v9;
    do
    {
      id v7 = 0;
      do
      {
        if (*(void *)v9 != v6) {
          objc_enumerationMutation(mClientSessions);
        }
        +[WCM_Logging logLevel:2, @"Session: %@", *(void *)(*((void *)&v8 + 1) + 8 * (void)v7) message];
        id v7 = (char *)v7 + 1;
      }
      while (v5 != v7);
      id v5 = [(NSMutableArray *)mClientSessions countByEnumeratingWithState:&v8 objects:v12 count:16];
    }
    while (v5);
  }
}

- (void)enterTestMode
{
  +[WCM_Logging logLevel:3 message:@"WCM_Server: Entering Test Mode"];
  self->testMode = 1;
  [(WCM_Server *)self existingSessions];
  long long v10 = 0u;
  long long v11 = 0u;
  long long v8 = 0u;
  long long v9 = 0u;
  mClientSessions = self->mClientSessions;
  id v4 = [(NSMutableArray *)mClientSessions countByEnumeratingWithState:&v8 objects:v12 count:16];
  if (v4)
  {
    id v5 = v4;
    uint64_t v6 = *(void *)v9;
    do
    {
      id v7 = 0;
      do
      {
        if (*(void *)v9 != v6) {
          objc_enumerationMutation(mClientSessions);
        }
        [*(id *)(*((void *)&v8 + 1) + 8 * (void)v7) suspendExternalConnection];
        id v7 = (char *)v7 + 1;
      }
      while (v5 != v7);
      id v5 = [(NSMutableArray *)mClientSessions countByEnumeratingWithState:&v8 objects:v12 count:16];
    }
    while (v5);
  }
}

- (void)exitTestMode
{
  +[WCM_Logging logLevel:3 message:@"WCM_Server: Existing Test Mode"];
  self->testMode = 0;
  [(WCM_Server *)self existingSessions];
  long long v10 = 0u;
  long long v11 = 0u;
  long long v8 = 0u;
  long long v9 = 0u;
  mClientSessions = self->mClientSessions;
  id v4 = [(NSMutableArray *)mClientSessions countByEnumeratingWithState:&v8 objects:v12 count:16];
  if (v4)
  {
    id v5 = v4;
    uint64_t v6 = *(void *)v9;
    do
    {
      id v7 = 0;
      do
      {
        if (*(void *)v9 != v6) {
          objc_enumerationMutation(mClientSessions);
        }
        [*(id *)(*((void *)&v8 + 1) + 8 * (void)v7) resumeExternalConnection];
        id v7 = (char *)v7 + 1;
      }
      while (v5 != v7);
      id v5 = [(NSMutableArray *)mClientSessions countByEnumeratingWithState:&v8 objects:v12 count:16];
    }
    while (v5);
  }
}

@end