@interface SUManagerServerClient
+ (BOOL)_isStateForeground:(unsigned int)a3;
+ (BOOL)_isStateMessagable:(unsigned int)a3;
- (BOOL)hasEntitlement:(id)a3;
- (BOOL)isApplication;
- (BOOL)isExclusiveClient;
- (BOOL)isForeground;
- (BOOL)isMessagable;
- (NSString)identifier;
- (NSXPCConnection)connection;
- (SUManagerClientInterface)proxy;
- (SUManagerServerClient)initWithConnection:(id)a3;
- (id)description;
- (int)pid;
- (int)type;
- (void)_applicationStateChanged:(id)a3;
- (void)_evaluateForegroundness;
- (void)_evaluateMessagability;
- (void)dealloc;
- (void)invalidate;
- (void)setIsExclusiveClient:(BOOL)a3;
- (void)setType:(int)a3;
- (void)wakeupIfNecessary;
@end

@implementation SUManagerServerClient

- (void)setType:(int)a3
{
  obj = self;
  objc_sync_enter(obj);
  if (obj->_type != a3)
  {
    obj->_type = a3;
    [(SUManagerServerClient *)obj _evaluateForegroundness];
  }
  objc_sync_exit(obj);
}

- (void)_applicationStateChanged:(id)a3
{
  id v9 = a3;
  v4 = self;
  objc_sync_enter(v4);
  if (v9 && [v9 count])
  {
    v5 = [v9 objectForKey:*MEMORY[0x263F28158]];
    v6 = [(SUManagerServerClient *)v4 identifier];
    int v7 = [v6 hasPrefix:v5];

    if (v7)
    {
      v8 = [v9 objectForKey:*MEMORY[0x263F28168]];
      v4->_lastAppState = [v8 intValue];

      [(SUManagerServerClient *)v4 _evaluateMessagability];
      [(SUManagerServerClient *)v4 _evaluateForegroundness];
    }
  }
  objc_sync_exit(v4);
}

- (NSString)identifier
{
  return self->_identifier;
}

- (SUManagerServerClient)initWithConnection:(id)a3
{
  id v5 = a3;
  v37.receiver = self;
  v37.super_class = (Class)SUManagerServerClient;
  v6 = [(SUManagerServerClient *)&v37 init];
  int v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_connection, a3);
    v8 = [(NSXPCConnection *)v7->_connection _queue];
    long long v35 = 0u;
    long long v36 = 0u;
    connection = v7->_connection;
    if (connection) {
      [(NSXPCConnection *)connection auditToken];
    }
    uint64_t v10 = CPCopyBundleIdentifierFromAuditToken();
    identifier = v7->_identifier;
    v7->_identifier = (NSString *)v10;

    int v12 = DWORD1(v36);
    v7->_type = 0;
    v7->_pid = v12;
    v7->_isExclusiveClient = 0;
    id v13 = objc_alloc(MEMORY[0x263F28178]);
    v14 = v7->_identifier;
    if (v14)
    {
      v15 = [MEMORY[0x263EFF8C0] arrayWithObject:v7->_identifier];
    }
    else
    {
      v15 = 0;
    }
    uint64_t v16 = [v13 initWithBundleIDs:v15 states:*MEMORY[0x263F28150]];
    appStateMonitor = v7->_appStateMonitor;
    v7->_appStateMonitor = (BKSApplicationStateMonitor *)v16;

    if (v14) {
    uint64_t lastAppState = [(BKSApplicationStateMonitor *)v7->_appStateMonitor mostElevatedApplicationStateForPID:v7->_pid];
    }
    v7->_uint64_t lastAppState = lastAppState;
    v7->_isApplication = (lastAppState & 0xFFFFFFEF) != 0;
    if ((lastAppState & 0xFFFFFFEF) == 0)
    {
      [(BKSApplicationStateMonitor *)v7->_appStateMonitor invalidate];
      v19 = v7->_appStateMonitor;
      v7->_appStateMonitor = 0;

      if (!v7->_isApplication)
      {
        BOOL v20 = 1;
        goto LABEL_13;
      }
      uint64_t lastAppState = v7->_lastAppState;
    }
    BOOL v20 = +[SUManagerServerClient _isStateMessagable:lastAppState];
LABEL_13:
    v7->_isMessagable = v20;
    v7->_isForeground = 0;
    v21 = v7->_appStateMonitor;
    v32[0] = MEMORY[0x263EF8330];
    v32[1] = 3221225472;
    v32[2] = __44__SUManagerServerClient_initWithConnection___block_invoke;
    v32[3] = &unk_26447DB30;
    id v33 = v8;
    v34 = v7;
    id v22 = v8;
    [(BKSApplicationStateMonitor *)v21 setHandler:v32];
  }
  v23 = [(SUManagerServerClient *)v7 identifier];
  SULogDebug(@"initiated client %@", v24, v25, v26, v27, v28, v29, v30, (uint64_t)v23);

  return v7;
}

- (void)_evaluateMessagability
{
  obj = self;
  objc_sync_enter(obj);
  int v2 = [(SUManagerServerClient *)obj isMessagable];
  int v3 = +[SUManagerServerClient _isStateMessagable:obj->_lastAppState];
  if (v2 != v3)
  {
    obj->_isMessagable = v3;
    SULogDebug(@"Client [%@:<%p>] - messagability changed: isMessagable? %@", (uint64_t)obj, v4, v5, v6, v7, v8, v9, (uint64_t)obj->_identifier);
    uint64_t v10 = [MEMORY[0x263F08A00] defaultCenter];
    [v10 postNotificationName:@"SUClientMessagabilityChangedNotification" object:obj];
  }
  objc_sync_exit(obj);
}

+ (BOOL)_isStateMessagable:(unsigned int)a3
{
  HIDWORD(v3) = a3;
  LODWORD(v3) = a3 - 4;
  return ((v3 >> 2) < 8) & (0x8Bu >> (v3 >> 2));
}

- (BOOL)isMessagable
{
  return self->_isMessagable;
}

uint64_t __44__SUManagerServerClient_initWithConnection___block_invoke_2(uint64_t a1)
{
  return [*(id *)(a1 + 32) _applicationStateChanged:*(void *)(a1 + 40)];
}

- (void)_evaluateForegroundness
{
  obj = self;
  objc_sync_enter(obj);
  BOOL v2 = [(SUManagerServerClient *)obj isForeground];
  if (+[SUManagerServerClient _isStateForeground:obj->_lastAppState])
  {
    uint64_t v10 = (uint64_t *)obj;
    int type = obj->_type;
    if (v2 == (type == 1)) {
      goto LABEL_7;
    }
    obj->_isForeground = type == 1;
  }
  else
  {
    uint64_t v10 = (uint64_t *)obj;
    if (!v2) {
      goto LABEL_7;
    }
    obj->_isForeground = 0;
  }
  SULogDebug(@"Client [%@:<%p>] - foregroundness changed: isForeground? %@", v3, v4, v5, v6, v7, v8, v9, v10[4]);
  int v12 = [MEMORY[0x263F08A00] defaultCenter];
  [v12 postNotificationName:@"SUClientForegroundnessChangedNotification" object:obj];

  uint64_t v10 = (uint64_t *)obj;
LABEL_7:
  objc_sync_exit(v10);
}

- (BOOL)isForeground
{
  return self->_isForeground;
}

+ (BOOL)_isStateForeground:(unsigned int)a3
{
  return a3 == 8;
}

void __44__SUManagerServerClient_initWithConnection___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  v6[0] = MEMORY[0x263EF8330];
  v6[1] = 3221225472;
  v6[2] = __44__SUManagerServerClient_initWithConnection___block_invoke_2;
  v6[3] = &unk_26447C8C8;
  uint64_t v4 = *(NSObject **)(a1 + 32);
  id v7 = *(id *)(a1 + 40);
  id v8 = v3;
  id v5 = v3;
  dispatch_async(v4, v6);
}

- (void)dealloc
{
  [(SUManagerServerClient *)self invalidate];
  v3.receiver = self;
  v3.super_class = (Class)SUManagerServerClient;
  [(SUManagerServerClient *)&v3 dealloc];
}

- (void)invalidate
{
  obj = self;
  objc_sync_enter(obj);
  [(BKSApplicationStateMonitor *)obj->_appStateMonitor setHandler:0];
  [(BKSApplicationStateMonitor *)obj->_appStateMonitor invalidate];
  appStateMonitor = obj->_appStateMonitor;
  obj->_appStateMonitor = 0;

  [(NSXPCConnection *)obj->_connection setInterruptionHandler:0];
  [(NSXPCConnection *)obj->_connection setInvalidationHandler:0];
  [(NSXPCConnection *)obj->_connection invalidate];
  connection = obj->_connection;
  obj->_connection = 0;

  objc_sync_exit(obj);
}

- (SUManagerClientInterface)proxy
{
  BOOL v2 = self;
  objc_sync_enter(v2);
  objc_super v3 = [(NSXPCConnection *)v2->_connection remoteObjectProxy];
  objc_sync_exit(v2);

  return (SUManagerClientInterface *)v3;
}

- (void)wakeupIfNecessary
{
  BOOL v2 = self;
  objc_sync_enter(v2);
  if (v2->_isApplication && !v2->_isMessagable)
  {
    SULogDebug(@"Trying to waking up client...: %@", v3, v4, v5, v6, v7, v8, v9, (uint64_t)v2);
    uint64_t v17 = SBSProcessAssertionCreateForPID();
    if (v17)
    {
      dispatch_time_t v18 = dispatch_time(0, 5000000000);
      v19 = dispatch_get_global_queue(0, 0);
      block[0] = MEMORY[0x263EF8330];
      block[1] = 3221225472;
      block[2] = __42__SUManagerServerClient_wakeupIfNecessary__block_invoke;
      block[3] = &__block_descriptor_40_e5_v8__0l;
      block[4] = v17;
      dispatch_after(v18, v19, block);
    }
    else
    {
      SULogInfo(@"Unable to wakeup client: %@", v10, v11, v12, v13, v14, v15, v16, (uint64_t)v2);
    }
  }
  objc_sync_exit(v2);
}

void __42__SUManagerServerClient_wakeupIfNecessary__block_invoke(uint64_t a1)
{
}

- (BOOL)hasEntitlement:(id)a3
{
  id v4 = a3;
  uint64_t v5 = self;
  objc_sync_enter(v5);
  uint64_t v6 = [(SUManagerServerClient *)v5 connection];
  uint64_t v7 = [v6 valueForEntitlement:v4];

  if (v7 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0)) {
    char v8 = [v7 BOOLValue];
  }
  else {
    char v8 = 0;
  }

  objc_sync_exit(v5);
  return v8;
}

- (id)description
{
  BOOL v2 = self;
  objc_sync_enter(v2);
  uint64_t v3 = NSString;
  id v4 = SUStringFromClientType(v2->_type);
  uint64_t v5 = [NSNumber numberWithInt:v2->_pid];
  uint64_t v6 = (void *)v5;
  uint64_t v7 = @"Yes";
  if (v2->_isApplication) {
    char v8 = @"Yes";
  }
  else {
    char v8 = @"No";
  }
  if (v2->_isMessagable) {
    uint64_t v9 = @"Yes";
  }
  else {
    uint64_t v9 = @"No";
  }
  if (v2->_isForeground) {
    uint64_t v10 = @"Yes";
  }
  else {
    uint64_t v10 = @"No";
  }
  if (!v2->_isExclusiveClient) {
    uint64_t v7 = @"No";
  }
  uint64_t v11 = [v3 stringWithFormat:@"Client <%p>:\n            \ttype: %@\n            \tpid: %@\n            \tbundle ID: %@\n            \tapplication? %@\n            \tmessagable? %@\n            \tforeground? %@\n            \tisExclusiveClient? %@", v2, v4, v5, v2->_identifier, v8, v9, v10, v7];

  objc_sync_exit(v2);
  return v11;
}

- (int)type
{
  return self->_type;
}

- (int)pid
{
  return self->_pid;
}

- (BOOL)isApplication
{
  return self->_isApplication;
}

- (NSXPCConnection)connection
{
  return self->_connection;
}

- (BOOL)isExclusiveClient
{
  return self->_isExclusiveClient;
}

- (void)setIsExclusiveClient:(BOOL)a3
{
  self->_isExclusiveClient = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_connection, 0);
  objc_storeStrong((id *)&self->_identifier, 0);
  objc_storeStrong((id *)&self->_appStateMonitor, 0);
}

@end