@interface STAgentListenerDelegate
- (BOOL)listener:(id)a3 shouldAcceptNewConnection:(id)a4;
- (STAgentListenerDelegate)initWithScreenTimeStateManager:(id)a3;
- (STAgentServer)agentServer;
@end

@implementation STAgentListenerDelegate

- (STAgentListenerDelegate)initWithScreenTimeStateManager:(id)a3
{
  id v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)STAgentListenerDelegate;
  v5 = [(STAgentListenerDelegate *)&v9 init];
  if (v5)
  {
    v6 = [[STAgentServer alloc] initWithScreenTimeStateManager:v4];
    agentServer = v5->_agentServer;
    v5->_agentServer = v6;
  }
  return v5;
}

- (BOOL)listener:(id)a3 shouldAcceptNewConnection:(id)a4
{
  id v6 = a4;
  v7 = [v6 serviceName];
  v8 = +[STLog screentime];
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG)) {
    sub_10025A7C0((uint64_t)v7, v6, v8);
  }

  if ([v7 isEqualToString:STMachServiceNameScreenTimePrivate])
  {
    id v9 = [v6 valueForEntitlement:STEntitlementScreenTimePrivate];
    objc_opt_class();
    if (objc_opt_isKindOfClass() & 1) != 0 && ([v9 BOOLValue])
    {
      if (qword_1003468F0 != -1) {
        dispatch_once(&qword_1003468F0, &stru_1002FB3B0);
      }
      id v10 = (id)qword_1003468F8;
      goto LABEL_25;
    }
    v11 = +[STLog screentime];
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR)) {
      sub_10025A6A8();
    }

LABEL_30:
    BOOL v16 = 0;
    goto LABEL_31;
  }
  if (![v7 isEqualToString:STMachServiceNameScreenTime])
  {
    if (([v7 isEqualToString:STMachServiceNameContacts] & 1) == 0)
    {
      v19 = +[NSAssertionHandler currentHandler];
      [v19 handleFailureInMethod:a2, self, @"STAgentListenerDelegate.m", 67, @"Unexpected Mach service name %@", v7 object file lineNumber description];
    }
    id v9 = [v6 valueForEntitlement:@"com.apple.private.contacts"];
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0 || ([v9 BOOLValue] & 1) == 0)
    {
      v12 = [v6 valueForEntitlement:@"com.apple.private.contactsui"];
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0 || ([v12 BOOLValue] & 1) == 0)
      {
        v13 = [v6 valueForEntitlement:STEntitlementScreenTimePrivate];
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) == 0 || ([v13 BOOLValue] & 1) == 0)
        {
          v17 = +[STLog screentime];
          if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR)) {
            sub_10025A724();
          }

          goto LABEL_30;
        }
      }
    }
    id v10 = +[STScreenTimeAgentPrivateConnection newContactsServiceInterface];
LABEL_25:
    id v14 = v10;

    id v9 = v14;
    goto LABEL_26;
  }
  id v9 = +[STScreenTimeAgentConnection newInterface];
LABEL_26:
  [v6 setExportedInterface:v9];
  v15 = [(STAgentListenerDelegate *)self agentServer];
  [v6 setExportedObject:v15];

  [v6 resume];
  BOOL v16 = 1;
LABEL_31:

  return v16;
}

- (STAgentServer)agentServer
{
  return self->_agentServer;
}

- (void).cxx_destruct
{
}

@end