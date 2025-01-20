@interface NEAgentServer
- (BOOL)listener:(id)a3 shouldAcceptNewConnection:(id)a4;
- (NEAgentServer)init;
- (void)applicationInstallsDidStart:(id)a3;
- (void)applicationsWillInstall:(id)a3;
- (void)applicationsWillUninstall:(id)a3;
- (void)pluginsDidInstall:(id)a3;
- (void)pluginsWillUninstall:(id)a3;
@end

@implementation NEAgentServer

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_activeLSSessions, 0);
  objc_storeStrong((id *)&self->_activeSessions, 0);

  objc_storeStrong((id *)&self->_listener, 0);
}

- (void)applicationsWillUninstall:(id)a3
{
}

- (void)pluginsDidInstall:(id)a3
{
}

- (void)pluginsWillUninstall:(id)a3
{
}

- (void)applicationsWillInstall:(id)a3
{
}

- (void)applicationInstallsDidStart:(id)a3
{
}

- (BOOL)listener:(id)a3 shouldAcceptNewConnection:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v8 = [v7 valueForEntitlement:@"com.apple.private.neagent-client"];
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0 || ([v8 BOOLValue] & 1) == 0)
  {
    v24 = ne_log_obj();
    if (os_log_type_enabled(v24, OS_LOG_TYPE_ERROR))
    {
      LOWORD(v26) = 0;
      _os_log_error_impl((void *)&_mh_execute_header, v24, OS_LOG_TYPE_ERROR, "Rejecting un-entitled XPC client", (uint8_t *)&v26, 2u);
    }

    goto LABEL_15;
  }
  if (self) {
    id Property = objc_getProperty(self, v9, 16, 1);
  }
  else {
    id Property = 0;
  }
  if (Property != v6)
  {
LABEL_15:
    BOOL v23 = 0;
    goto LABEL_16;
  }
  kdebug_trace();
  v11 = [NEAgentSession alloc];
  id v12 = v7;
  if (v11)
  {
    v31.receiver = v11;
    v31.super_class = (Class)NEAgentSession;
    v11 = [(NEAgentServer *)&v31 init];
    if (v11)
    {
      v13 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
      dispatch_queue_t v14 = dispatch_queue_create("NEAgentSession queue", v13);
      queue = v11->_queue;
      v11->_queue = (OS_dispatch_queue *)v14;

      v26 = _NSConcreteStackBlock;
      uint64_t v27 = 3221225472;
      v28 = sub_1000084C8;
      v29 = &unk_10000C420;
      v11 = v11;
      v30 = v11;
      v16 = objc_retainBlock(&v26);
      v17 = +[NSXPCInterface interfaceWithProtocol:](NSXPCInterface, "interfaceWithProtocol:", &OBJC_PROTOCOL___NEAgentControl, v26, v27, v28, v29);
      [v12 setExportedInterface:v17];

      [v12 setExportedObject:v11];
      [v12 setInvalidationHandler:v16];
      [v12 setInterruptionHandler:v16];
      uint64_t v18 = os_transaction_create();
      transaction = v11->_transaction;
      v11->_transaction = (OS_os_transaction *)v18;

      objc_storeStrong((id *)&v11->_connection, a4);
      [v12 resume];
      v20 = +[NSXPCListener anonymousListener];
      [(NSXPCListener *)v20 setDelegate:v11];
      [(NSXPCListener *)v20 resume];
      delegateListener = v11->_delegateListener;
      v11->_delegateListener = v20;
    }
  }

  os_unfair_lock_lock(&self->_lock);
  if (self) {
    activeSessions = self->_activeSessions;
  }
  else {
    activeSessions = 0;
  }
  [(NSMutableArray *)activeSessions addObject:v11];
  os_unfair_lock_unlock(&self->_lock);

  BOOL v23 = 1;
LABEL_16:

  return v23;
}

- (NEAgentServer)init
{
}

@end