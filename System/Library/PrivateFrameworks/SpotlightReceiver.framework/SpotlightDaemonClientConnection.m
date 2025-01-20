@interface SpotlightDaemonClientConnection
- (BOOL)addClientConnectionIfAllowedForConnection:(id)a3;
- (BOOL)handleCommand:(const char *)a3 info:(id)a4 connection:(id)a5;
- (BOOL)lostClientConnection:(id)a3 error:(id)a4;
- (SpotlightDaemonClient)spotlightDaemonClient;
- (SpotlightDaemonClientConnection)initWithClient:(id)a3 forServiceName:(id)a4;
@end

@implementation SpotlightDaemonClientConnection

- (SpotlightDaemonClientConnection)initWithClient:(id)a3 forServiceName:(id)a4
{
  id v7 = a3;
  v11.receiver = self;
  v11.super_class = (Class)SpotlightDaemonClientConnection;
  v8 = [(CSXPCConnection *)&v11 initMachServiceListenerWithName:a4];
  v9 = (SpotlightDaemonClientConnection *)v8;
  if (v8) {
    objc_storeStrong(v8 + 7, a3);
  }

  return v9;
}

- (BOOL)addClientConnectionIfAllowedForConnection:(id)a3
{
  uint64_t v17 = *MEMORY[0x263EF8340];
  v3 = (_xpc_connection_s *)a3;
  pid_t pid = xpc_connection_get_pid(v3);
  xpc_connection_get_audit_token();

  CFAllocatorRef v5 = (const __CFAllocator *)*MEMORY[0x263EFFB08];
  memset(&token, 0, sizeof(token));
  v6 = SecTaskCreateWithAuditToken(v5, &token);
  if (v6)
  {
    id v7 = v6;
    v8 = (void *)SecTaskCopyValueForEntitlement(v6, @"com.apple.private.corespotlight.sender", 0);
    int v9 = [v8 BOOLValue];
    v10 = logForCSLogCategoryDefault();
    objc_super v11 = v10;
    if (v9)
    {
      if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
      {
        token.val[0] = 67109120;
        token.val[1] = pid;
        _os_log_impl(&dword_21B5E5000, v11, OS_LOG_TYPE_INFO, "New sender connection for pid: %d", (uint8_t *)&token, 8u);
      }

      v12 = logForCSLogCategoryDaemonClient();
      os_signpost_id_t v13 = os_signpost_id_generate(v12);

      v14 = logForCSLogCategoryDaemonClient();
      objc_super v11 = v14;
      if (v13 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v14))
      {
        token.val[0] = 67109120;
        token.val[1] = pid;
        _os_signpost_emit_with_name_impl(&dword_21B5E5000, v11, OS_SIGNPOST_EVENT, v13, "AddClientConnection", "pid:%d", (uint8_t *)&token, 8u);
      }
    }
    else if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
    {
      -[SpotlightDaemonClientConnection addClientConnectionIfAllowedForConnection:](pid, v11);
    }

    CFRelease(v7);
  }
  else
  {
    LOBYTE(v9) = 0;
  }
  return v9;
}

- (BOOL)lostClientConnection:(id)a3 error:(id)a4
{
  return 0;
}

- (BOOL)handleCommand:(const char *)a3 info:(id)a4 connection:(id)a5
{
  return _SpotlightDaemonClientHandleCommand(a3, a4, self->_spotlightDaemonClient);
}

- (SpotlightDaemonClient)spotlightDaemonClient
{
  return self->_spotlightDaemonClient;
}

- (void).cxx_destruct
{
}

- (void)addClientConnectionIfAllowedForConnection:(int)a1 .cold.1(int a1, NSObject *a2)
{
  uint64_t v3 = *MEMORY[0x263EF8340];
  v2[0] = 67109120;
  v2[1] = a1;
  _os_log_error_impl(&dword_21B5E5000, a2, OS_LOG_TYPE_ERROR, "Error pid: %d missing sender entitlement", (uint8_t *)v2, 8u);
}

@end