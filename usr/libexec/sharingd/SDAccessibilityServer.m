@interface SDAccessibilityServer
- (BOOL)shouldAcceptNewConnection:(id)a3;
- (id)exportedInterface;
- (id)machServiceName;
- (id)remoteObjectInterface;
- (void)activate;
- (void)invalidate;
- (void)requestLabelForActivityWithSlotID:(unsigned int)a3 completionHandler:(id)a4;
@end

@implementation SDAccessibilityServer

- (void)activate
{
  v2.receiver = self;
  v2.super_class = (Class)SDAccessibilityServer;
  [(SDXPCDaemon *)&v2 _activate];
}

- (void)invalidate
{
  v2.receiver = self;
  v2.super_class = (Class)SDAccessibilityServer;
  [(SDXPCDaemon *)&v2 _invalidate];
}

- (id)machServiceName
{
  return SFAccessibilityServiceName;
}

- (BOOL)shouldAcceptNewConnection:(id)a3
{
  id v3 = a3;
  v4 = [v3 valueForEntitlement:@"com.apple.accessibility.api"];
  objc_opt_class();
  if (objc_opt_isKindOfClass() & 1) != 0 && ([v4 BOOLValue])
  {
    v5 = daemon_log();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      int v8 = 67109120;
      unsigned int v9 = [v3 processIdentifier];
      _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "Allowing connection from pid %d to sharingd accessibility server", (uint8_t *)&v8, 8u);
    }
    BOOL v6 = 1;
  }
  else
  {
    v5 = daemon_log();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      int v8 = 67109120;
      unsigned int v9 = [v3 processIdentifier];
      _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "process %d tried to connect to the sharingd accessibility server, but it was not entitled!", (uint8_t *)&v8, 8u);
    }
    BOOL v6 = 0;
  }

  return v6;
}

- (id)exportedInterface
{
  return +[NSXPCInterface interfaceWithProtocol:&OBJC_PROTOCOL___SFAccessibilityInterface];
}

- (id)remoteObjectInterface
{
  return +[NSXPCInterface interfaceWithProtocol:&OBJC_PROTOCOL___SFAccessibilityInterface];
}

- (void)requestLabelForActivityWithSlotID:(unsigned int)a3 completionHandler:(id)a4
{
  if (a4)
  {
    uint64_t v5 = *(void *)&a3;
    id v6 = a4;
    id v8 = +[SDShareSheetSlotManager sharedManager];
    v7 = [v8 accessibilityStringForSlotID:v5];
    (*((void (**)(id, void *))a4 + 2))(v6, v7);
  }
}

@end