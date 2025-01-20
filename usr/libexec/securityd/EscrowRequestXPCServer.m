@interface EscrowRequestXPCServer
- (BOOL)listener:(id)a3 shouldAcceptNewConnection:(id)a4;
@end

@implementation EscrowRequestXPCServer

- (BOOL)listener:(id)a3 shouldAcceptNewConnection:(id)a4
{
  id v4 = a4;
  v5 = [v4 valueForEntitlement:@"com.apple.private.escrow-update"];
  objc_opt_class();
  if (objc_opt_isKindOfClass() & 1) != 0 && ([v5 BOOLValue])
  {
    v6 = sub_10000B070("escrowrequest");
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      int v13 = 67109376;
      unsigned int v14 = [v4 processIdentifier];
      __int16 v15 = 1024;
      LODWORD(v16) = [v4 effectiveUserIdentifier];
      _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "received connection from client pid %d (euid %u)", (uint8_t *)&v13, 0xEu);
    }

    v7 = +[NSXPCInterface interfaceWithProtocol:&OBJC_PROTOCOL___EscrowRequestXPCProtocol];
    v8 = SecEscrowRequestSetupControlProtocol();
    [v4 setExportedInterface:v8];

    v9 = +[EscrowRequestServer server];
    [v4 setExportedObject:v9];

    [v4 resume];
    BOOL v10 = 1;
  }
  else
  {
    v11 = sub_10000B070("SecError");
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      int v13 = 67109378;
      unsigned int v14 = [v4 processIdentifier];
      __int16 v15 = 2112;
      CFStringRef v16 = @"com.apple.private.escrow-update";
      _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEFAULT, "escrow-update: Client pid: %d doesn't have entitlement: %@", (uint8_t *)&v13, 0x12u);
    }

    BOOL v10 = 0;
  }

  return v10;
}

@end