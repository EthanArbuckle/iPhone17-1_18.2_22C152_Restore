@interface SOSControlServer
- (BOOL)listener:(id)a3 shouldAcceptNewConnection:(id)a4;
- (id)internalSOSClient;
@end

@implementation SOSControlServer

- (id)internalSOSClient
{
  id v2 = [[SOSClient alloc] initSOSClientWithAccount:sub_10021C7D8()];

  return v2;
}

- (BOOL)listener:(id)a3 shouldAcceptNewConnection:(id)a4
{
  id v4 = a4;
  v5 = [v4 valueForEntitlement:@"keychain-cloud-circle"];
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0 || ([v5 BOOLValue] & 1) == 0)
  {
    v7 = sub_10000B070("SecError");
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      int v14 = 67109378;
      unsigned int v15 = [v4 processIdentifier];
      __int16 v16 = 2112;
      CFStringRef v17 = @"keychain-cloud-circle";
      _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "sos: Client pid: %d doesn't have entitlement: %@", (uint8_t *)&v14, 0x12u);
    }
    goto LABEL_10;
  }
  uint64_t v6 = sub_10021C7D8();
  if (!v6)
  {
    v12 = sub_10000B070("SecError");
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      int v14 = 67109120;
      unsigned int v15 = [v4 processIdentifier];
      _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_DEFAULT, "sos: SOS have not launched yet, come later, pid: %d", (uint8_t *)&v14, 8u);
    }

    v7 = 0;
LABEL_10:
    BOOL v11 = 0;
    goto LABEL_11;
  }
  v7 = v6;
  id v8 = [[SOSClientRemote alloc] initSOSConnectionWithConnection:v4 account:v6];
  v9 = +[NSXPCInterface interfaceWithProtocol:&OBJC_PROTOCOL___SOSControlProtocol];
  [v4 setExportedInterface:v9];

  v10 = [v4 exportedInterface];
  _SOSControlSetupInterface();

  [v4 setExportedObject:v8];
  [v4 resume];

  BOOL v11 = 1;
LABEL_11:

  return v11;
}

@end