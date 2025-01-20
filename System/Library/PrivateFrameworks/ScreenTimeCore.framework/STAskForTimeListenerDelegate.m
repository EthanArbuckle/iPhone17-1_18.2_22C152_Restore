@interface STAskForTimeListenerDelegate
- (BOOL)listener:(id)a3 shouldAcceptNewConnection:(id)a4;
- (STAskForTimeListenerDelegate)initWithAskForTimeManager:(id)a3;
- (STAskForTimeManager)askForTimeManager;
@end

@implementation STAskForTimeListenerDelegate

- (STAskForTimeListenerDelegate)initWithAskForTimeManager:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)STAskForTimeListenerDelegate;
  v6 = [(STAskForTimeListenerDelegate *)&v9 init];
  v7 = v6;
  if (v6) {
    objc_storeStrong((id *)&v6->_askForTimeManager, a3);
  }

  return v7;
}

- (BOOL)listener:(id)a3 shouldAcceptNewConnection:(id)a4
{
  id v5 = a4;
  v6 = +[STLog screentime];
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG)) {
    sub_10025A92C(v5, v6);
  }

  uint64_t v7 = STEntitlementScreenTimePrivate;
  v8 = [v5 valueForEntitlement:STEntitlementScreenTimePrivate];
  objc_opt_class();
  if (objc_opt_isKindOfClass() & 1) != 0 && ([v8 BOOLValue])
  {
    objc_super v9 = +[NSXPCInterface interfaceWithProtocol:&OBJC_PROTOCOL___STAskForTimeInterface];
    [v5 setExportedInterface:v9];

    v10 = [(STAskForTimeListenerDelegate *)self askForTimeManager];
    [v5 setExportedObject:v10];

    [v5 resume];
    BOOL v11 = 1;
  }
  else
  {
    v12 = +[STLog ask];
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR)) {
      sub_10025A8A4((uint64_t)v5, v7, v12);
    }

    BOOL v11 = 0;
  }

  return v11;
}

- (STAskForTimeManager)askForTimeManager
{
  return self->_askForTimeManager;
}

- (void).cxx_destruct
{
}

@end