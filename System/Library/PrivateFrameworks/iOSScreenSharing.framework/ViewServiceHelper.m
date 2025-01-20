@interface ViewServiceHelper
- (BOOL)listener:(id)a3 shouldAcceptNewConnection:(id)a4;
- (NSMutableArray)connections;
- (NSXPCListener)listener;
- (ViewServiceHelper)init;
- (ViewServiceHelperDelegate)delegate;
- (void)handleStatusBarTap;
- (void)pauseResumeResponse:(id)a3;
- (void)pidNotification:(id)a3;
- (void)run;
- (void)sendSessionInfoToClient;
- (void)setConnections:(id)a3;
- (void)setDelegate:(id)a3;
- (void)setListener:(id)a3;
- (void)termsAndConditionsResponse:(id)a3;
@end

@implementation ViewServiceHelper

- (ViewServiceHelper)init
{
  v7.receiver = self;
  v7.super_class = (Class)ViewServiceHelper;
  v2 = [(ViewServiceHelper *)&v7 init];
  if (v2)
  {
    v3 = [MEMORY[0x263EFF980] arrayWithCapacity:1];
    [(ViewServiceHelper *)v2 setConnections:v3];

    uint64_t v4 = [objc_alloc(MEMORY[0x263F08D88]) initWithMachServiceName:@"com.apple.ScreenSharingViewServiceHelper"];
    listener = v2->_listener;
    v2->_listener = (NSXPCListener *)v4;

    [(NSXPCListener *)v2->_listener setDelegate:v2];
  }
  return v2;
}

- (void)run
{
  v3 = dispatch_get_global_queue(9, 0);
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __24__ViewServiceHelper_run__block_invoke;
  block[3] = &unk_2645E6858;
  block[4] = self;
  dispatch_async(v3, block);
}

uint64_t __24__ViewServiceHelper_run__block_invoke(uint64_t a1)
{
  return [*(id *)(*(void *)(a1 + 32) + 16) resume];
}

- (BOOL)listener:(id)a3 shouldAcceptNewConnection:(id)a4
{
  uint64_t v29 = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v7 = a4;
  if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_DEFAULT))
  {
    LOWORD(buf.val[0]) = 0;
    _os_log_impl(&dword_221C9F000, &_os_log_internal, OS_LOG_TYPE_DEFAULT, "start listener:shouldAcceptNewConnection:", (uint8_t *)&buf, 2u);
  }
  memset(&buf, 0, sizeof(buf));
  if (v7) {
    [v7 auditToken];
  }
  audit_token_t token = buf;
  v8 = SecTaskCreateWithAuditToken(0, &token);
  v9 = v8;
  if (!v8)
  {
    if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR)) {
      -[ViewServiceHelper listener:shouldAcceptNewConnection:]();
    }
    goto LABEL_29;
  }
  CFErrorRef error = 0;
  CFTypeRef v10 = SecTaskCopyValueForEntitlement(v8, @"com.apple.private.screensharing.xpcaccepted", &error);
  if (error)
  {
    if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_DEFAULT))
    {
      token.val[0] = 138412290;
      *(void *)&token.val[1] = error;
      _os_log_impl(&dword_221C9F000, &_os_log_internal, OS_LOG_TYPE_DEFAULT, "Unable to get entitlement (com.apple.private.screensharing.xpcaccepted) for client task. Error: %@", (uint8_t *)&token, 0xCu);
    }
    CFRelease(error);
    CFErrorRef error = 0;
  }
  if (!v10)
  {
LABEL_17:
    CFStringRef v13 = CFStringCreateWithCString((CFAllocatorRef)*MEMORY[0x263EFFB08], "com.apple.springboard.activateawayviewplugins", 0x8000100u);
    CFTypeRef v14 = SecTaskCopyValueForEntitlement(v9, v13, &error);
    if (error)
    {
      if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_DEFAULT))
      {
        token.val[0] = 138412546;
        *(void *)&token.val[1] = v13;
        LOWORD(token.val[3]) = 2112;
        *(void *)((char *)&token.val[3] + 2) = error;
        _os_log_impl(&dword_221C9F000, &_os_log_internal, OS_LOG_TYPE_DEFAULT, "Unable to get entitlement %@ for client task. Error: %@", (uint8_t *)&token, 0x16u);
      }
      CFRelease(error);
      CFErrorRef error = 0;
    }
    CFRelease(v13);
    if (v14)
    {
      CFTypeID v15 = CFGetTypeID(v14);
      if (v15 == CFBooleanGetTypeID())
      {
        BOOL v16 = CFBooleanGetValue((CFBooleanRef)v14) == 0;
        CFRelease(v14);
        CFRelease(v9);
        if (!v16) {
          goto LABEL_24;
        }
      }
      else
      {
        CFRelease(v14);
        CFRelease(v9);
      }
    }
    else
    {
      CFRelease(v9);
    }
LABEL_29:
    BOOL v22 = 0;
    goto LABEL_30;
  }
  CFTypeID v11 = CFGetTypeID(v10);
  if (v11 != CFBooleanGetTypeID())
  {
    CFRelease(v10);
    goto LABEL_17;
  }
  BOOL v12 = CFBooleanGetValue((CFBooleanRef)v10) == 0;
  CFRelease(v10);
  if (v12) {
    goto LABEL_17;
  }
  CFRelease(v9);
LABEL_24:
  v17 = [MEMORY[0x263F08D80] interfaceWithProtocol:&unk_26D4327A8];
  [v7 setExportedInterface:v17];

  [v7 setExportedObject:self];
  v18 = [MEMORY[0x263F08D80] interfaceWithProtocol:&unk_26D432BE8];
  [v7 setRemoteObjectInterface:v18];

  v19 = self;
  objc_sync_enter(v19);
  if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_DEFAULT))
  {
    LOWORD(token.val[0]) = 0;
    _os_log_impl(&dword_221C9F000, &_os_log_internal, OS_LOG_TYPE_DEFAULT, "adding connection", (uint8_t *)&token, 2u);
  }
  v20 = [(ViewServiceHelper *)v19 connections];
  v26[0] = @"NSXPCConnection";
  v26[1] = @"bundleIdentifier";
  v27[0] = v7;
  v27[1] = &stru_26D430F00;
  v21 = [NSDictionary dictionaryWithObjects:v27 forKeys:v26 count:2];
  [v20 addObject:v21];

  objc_sync_exit(v19);
  [v7 resume];
  BOOL v22 = 1;
LABEL_30:

  return v22;
}

- (void)handleStatusBarTap
{
  v24[5] = *MEMORY[0x263EF8340];
  if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)audit_token_t buf = 0;
    _os_log_impl(&dword_221C9F000, &_os_log_internal, OS_LOG_TYPE_DEFAULT, "status bar tapped", buf, 2u);
  }
  v3 = [MEMORY[0x263EFF9A0] dictionaryWithCapacity:3];
  uint64_t v4 = [(ViewServiceHelper *)self delegate];
  char v5 = objc_opt_respondsToSelector();

  if (v5)
  {
    id v6 = [(ViewServiceHelper *)self delegate];
    [v6 performSelector:sel_sessionState_ withObject:v3];
  }
  else if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)audit_token_t buf = 0;
    _os_log_impl(&dword_221C9F000, &_os_log_internal, OS_LOG_TYPE_DEFAULT, "sessionState not supported", buf, 2u);
  }
  id v7 = [v3 objectForKeyedSubscript:@"viewerName"];
  v8 = [v3 objectForKeyedSubscript:@"paused"];
  if (v8) {
    [v3 objectForKeyedSubscript:@"paused"];
  }
  else {
  v9 = [NSNumber numberWithBool:0];
  }

  CFTypeRef v10 = [v3 objectForKeyedSubscript:@"screenLocked"];
  if (v10) {
    [v3 objectForKeyedSubscript:@"screenLocked"];
  }
  else {
  CFTypeID v11 = [NSNumber numberWithBool:0];
  }

  uint64_t v12 = *MEMORY[0x263F79568];
  v23[0] = *MEMORY[0x263F79580];
  v23[1] = v12;
  uint64_t v13 = MEMORY[0x263EFFA88];
  v24[0] = @"SSActiveViewController";
  v24[1] = MEMORY[0x263EFFA88];
  v23[2] = *MEMORY[0x263F79570];
  CFTypeRef v14 = [NSNumber numberWithInteger:0];
  uint64_t v15 = *MEMORY[0x263F79560];
  v24[2] = v14;
  v24[3] = v13;
  uint64_t v16 = *MEMORY[0x263F79578];
  v23[3] = v15;
  v23[4] = v16;
  v21[0] = @"isPaused";
  v21[1] = @"isScreenLocked";
  v22[0] = v9;
  v22[1] = v11;
  v21[2] = @"viewerName";
  v22[2] = v7;
  v17 = [NSDictionary dictionaryWithObjects:v22 forKeys:v21 count:3];
  v24[4] = v17;
  v18 = [NSDictionary dictionaryWithObjects:v24 forKeys:v23 count:5];

  int v19 = SBSUIActivateRemoteAlertWithLifecycleNotifications();
  syslog(5, "RemoteAlert: %d", v19);
}

void __39__ViewServiceHelper_handleStatusBarTap__block_invoke(uint64_t a1, int a2)
{
}

void __39__ViewServiceHelper_handleStatusBarTap__block_invoke_2(uint64_t a1, int a2)
{
}

- (void)termsAndConditionsResponse:(id)a3
{
  id v8 = a3;
  id v4 = [v8 description];
  syslog(5, "termsAndConditionsResponse %s", (const char *)[v4 UTF8String]);

  char v5 = [(ViewServiceHelper *)self delegate];
  char v6 = objc_opt_respondsToSelector();

  if (v6)
  {
    id v7 = [(ViewServiceHelper *)self delegate];
    [v7 performSelector:sel_termsAndConditionsResult_ withObject:v8];
  }
}

- (void)pauseResumeResponse:(id)a3
{
  id v4 = a3;
  if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)audit_token_t buf = 0;
    _os_log_impl(&dword_221C9F000, &_os_log_internal, OS_LOG_TYPE_DEFAULT, "pauseResumeResponse", buf, 2u);
  }
  char v5 = [(ViewServiceHelper *)self delegate];
  char v6 = objc_opt_respondsToSelector();

  if (v6)
  {
    id v7 = [(ViewServiceHelper *)self delegate];
    [v7 performSelector:sel_pauseResumeResult_ withObject:v4];
  }
  else if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)id v8 = 0;
    _os_log_impl(&dword_221C9F000, &_os_log_internal, OS_LOG_TYPE_DEFAULT, "does not respond", v8, 2u);
  }
}

- (void)pidNotification:(id)a3
{
  id v4 = a3;
  char v5 = [(ViewServiceHelper *)self delegate];
  char v6 = objc_opt_respondsToSelector();

  if (v6)
  {
    id v7 = [(ViewServiceHelper *)self delegate];
    [v7 performSelector:sel_pidNotification_ withObject:v4];
  }
  else if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)id v8 = 0;
    _os_log_impl(&dword_221C9F000, &_os_log_internal, OS_LOG_TYPE_DEFAULT, "pidNotification not supported", v8, 2u);
  }
}

- (void)sendSessionInfoToClient
{
  *(_WORD *)v0 = 0;
  _os_log_error_impl(&dword_221C9F000, &_os_log_internal, OS_LOG_TYPE_ERROR, "viewServerHelper delegate does not support sessionState message", v0, 2u);
}

void __44__ViewServiceHelper_sendSessionInfoToClient__block_invoke(uint64_t a1)
{
  id v14 = (id)objc_opt_new();
  v2 = [*(id *)(a1 + 32) delegate];
  [v2 performSelector:sel_sessionState_ withObject:v14];

  v3 = [v14 objectForKeyedSubscript:@"paused"];
  if (v3) {
    [v14 objectForKeyedSubscript:@"paused"];
  }
  else {
  id v4 = [NSNumber numberWithBool:0];
  }

  char v5 = [v14 objectForKeyedSubscript:@"screenLocked"];
  if (v5) {
    [v14 objectForKeyedSubscript:@"screenLocked"];
  }
  else {
  char v6 = [NSNumber numberWithBool:0];
  }

  id v7 = [v14 objectForKeyedSubscript:@"viewerName"];
  id v8 = [v14 objectForKeyedSubscript:@"isAppleSupportRequest"];
  v9 = objc_opt_new();
  [v9 setObject:v4 forKey:@"isPaused"];
  [v9 setObject:v6 forKey:@"isScreenLocked"];
  if (v7) {
    [v9 setObject:v7 forKey:@"viewerName"];
  }
  [v9 setObject:v8 forKey:@"isAppleSupportRequest"];
  CFTypeRef v10 = [*(id *)(a1 + 32) connections];
  CFTypeID v11 = [v10 lastObject];

  uint64_t v12 = [v11 objectForKey:@"NSXPCConnection"];
  uint64_t v13 = [v12 remoteObjectProxy];
  [v13 setUserInfo:v9];
}

- (ViewServiceHelperDelegate)delegate
{
  return self->_delegate;
}

- (void)setDelegate:(id)a3
{
  self->_delegate = (ViewServiceHelperDelegate *)a3;
}

- (NSXPCListener)listener
{
  return (NSXPCListener *)objc_getProperty(self, a2, 16, 1);
}

- (void)setListener:(id)a3
{
}

- (NSMutableArray)connections
{
  return (NSMutableArray *)objc_getProperty(self, a2, 24, 1);
}

- (void)setConnections:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_connections, 0);
  objc_storeStrong((id *)&self->_listener, 0);
}

- (void)listener:shouldAcceptNewConnection:.cold.1()
{
  *(_WORD *)v0 = 0;
  _os_log_error_impl(&dword_221C9F000, &_os_log_internal, OS_LOG_TYPE_ERROR, "Unable to create security task from audit token", v0, 2u);
}

@end