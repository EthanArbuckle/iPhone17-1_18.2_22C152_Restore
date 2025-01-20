@interface SCSharingReminderDelegate
- (BOOL)listener:(id)a3 shouldAcceptNewConnection:(id)a4;
@end

@implementation SCSharingReminderDelegate

- (BOOL)listener:(id)a3 shouldAcceptNewConnection:(id)a4
{
  uint64_t v21 = *MEMORY[0x263EF8340];
  id v5 = a3;
  id v6 = a4;
  v7 = [[SCSharingReminderXPCClient alloc] initWithConnection:v6];
  BOOL v8 = [(SCSharingReminderXPCClient *)v7 hasAccess];
  v9 = SCLogger();
  BOOL v10 = os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT);
  if (v8)
  {
    if (v10)
    {
      v11 = [v6 serviceName];
      int v17 = 138412546;
      id v18 = v5;
      __int16 v19 = 2112;
      v20 = v11;
      _os_log_impl(&dword_25B654000, v9, OS_LOG_TYPE_DEFAULT, "\"Accepting new connection with listener: %@ for: %@\"", (uint8_t *)&v17, 0x16u);
    }
    BOOL v12 = [(SCSharingReminderXPCClient *)v7 hasFeatureAccess];
    v13 = off_265496B68;
    if (!v12) {
      v13 = off_265496B88;
    }
    v14 = [(__objc2_class *)*v13 interface];
    [v6 setExportedInterface:v14];

    v15 = [[SCSharingReminderXPCService alloc] initWithClient:v7];
    [v6 setExportedObject:v15];

    [v6 resume];
  }
  else
  {
    if (v10)
    {
      int v17 = 67109120;
      LODWORD(v18) = [v6 processIdentifier];
      _os_log_impl(&dword_25B654000, v9, OS_LOG_TYPE_DEFAULT, "\"Rejecting process %d because it is not entitled to use SCSharingReminders\"", (uint8_t *)&v17, 8u);
    }
  }
  return v8;
}

@end