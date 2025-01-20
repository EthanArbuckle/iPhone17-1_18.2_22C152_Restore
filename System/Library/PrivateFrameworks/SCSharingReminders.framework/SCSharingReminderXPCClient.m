@interface SCSharingReminderXPCClient
- (BOOL)hasAccess;
- (BOOL)hasFeatureAccess;
- (NSString)name;
- (NSXPCConnection)xpcConnection;
- (SCSharingReminderXPCClient)initWithConnection:(id)a3;
- (id)clientBundle;
- (void)clientBundle;
- (void)name;
@end

@implementation SCSharingReminderXPCClient

- (SCSharingReminderXPCClient)initWithConnection:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)SCSharingReminderXPCClient;
  v6 = [(SCSharingReminderXPCClient *)&v9 init];
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_xpcConnection, a3);
    v7->_pid = [v5 processIdentifier];
  }

  return v7;
}

- (BOOL)hasAccess
{
  v3 = [(SCSharingReminderXPCClient *)self xpcConnection];
  v4 = [v3 valueForEntitlement:@"com.apple.private.safetycheckd.scsharingreminders"];
  BOOL v5 = ([v4 BOOLValue] & 1) != 0
    || [(SCSharingReminderXPCClient *)self hasFeatureAccess];

  return v5;
}

- (BOOL)hasFeatureAccess
{
  v2 = [(SCSharingReminderXPCClient *)self xpcConnection];
  v3 = [v2 valueForEntitlement:@"com.apple.private.safetycheckd.scsharingreminders.internal"];
  char v4 = [v3 BOOLValue];

  return v4;
}

- (NSString)name
{
  uint64_t v11 = *MEMORY[0x263EF8340];
  if (self->_name) {
    goto LABEL_7;
  }
  v3 = [(SCSharingReminderXPCClient *)self clientBundle];

  if (v3)
  {
    char v4 = [(NSBundle *)self->_clientBundle bundleIdentifier];
LABEL_6:
    name = self->_name;
    self->_name = v4;

LABEL_7:
    v7 = self->_name;
    goto LABEL_8;
  }
  p_pid = &self->_pid;
  if (proc_name(self->_pid, buffer, 0x20u) >= 1)
  {
    char v4 = [NSString stringWithUTF8String:buffer];
    goto LABEL_6;
  }
  objc_super v9 = SCLogger();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR)) {
    [(SCSharingReminderXPCClient *)p_pid name];
  }

  v7 = 0;
LABEL_8:
  return v7;
}

- (id)clientBundle
{
  uint64_t v14 = *MEMORY[0x263EF8340];
  clientBundle = self->_clientBundle;
  if (clientBundle) {
    goto LABEL_4;
  }
  p_pid = &self->_pid;
  if (proc_pidpath(self->_pid, buffer, 0x1000u) >= 1)
  {
    BOOL v5 = (void *)MEMORY[0x263F086E0];
    v6 = [NSString stringWithUTF8String:buffer];
    v7 = [v6 stringByDeletingLastPathComponent];
    v8 = [v5 bundleWithPath:v7];
    objc_super v9 = self->_clientBundle;
    self->_clientBundle = v8;

    clientBundle = self->_clientBundle;
LABEL_4:
    v10 = clientBundle;
    goto LABEL_5;
  }
  v12 = SCLogger();
  if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR)) {
    [(SCSharingReminderXPCClient *)p_pid clientBundle];
  }

  v10 = 0;
LABEL_5:
  return v10;
}

- (NSXPCConnection)xpcConnection
{
  return self->_xpcConnection;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_xpcConnection, 0);
  objc_storeStrong((id *)&self->_clientBundle, 0);
  objc_storeStrong((id *)&self->_name, 0);
}

- (void)name
{
  uint64_t v4 = *MEMORY[0x263EF8340];
  int v2 = *a1;
  v3[0] = 67109120;
  v3[1] = v2;
  _os_log_error_impl(&dword_25B654000, a2, OS_LOG_TYPE_ERROR, "\"proc_name failed for process identifier: %d\"", (uint8_t *)v3, 8u);
}

- (void)clientBundle
{
  uint64_t v4 = *MEMORY[0x263EF8340];
  int v2 = *a1;
  v3[0] = 67109120;
  v3[1] = v2;
  _os_log_error_impl(&dword_25B654000, a2, OS_LOG_TYPE_ERROR, "\"Could not resolve path for process identifier: %d\"", (uint8_t *)v3, 8u);
}

@end