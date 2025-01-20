@interface ServiceDelegate
- (BOOL)listener:(id)a3 shouldAcceptNewConnection:(id)a4;
@end

@implementation ServiceDelegate

- (BOOL)listener:(id)a3 shouldAcceptNewConnection:(id)a4
{
  id v4 = a4;
  v5 = [v4 valueForEntitlement:@"com.apple.private.securityuploadd"];
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    unsigned int v6 = [v5 BOOLValue];
  }
  else {
    unsigned int v6 = 0;
  }
  v7 = [v4 valueForEntitlement:@"com.apple.private.trustd.FileHelp"];
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    if (!v6) {
      goto LABEL_15;
    }
LABEL_11:
    v9 = sub_1000106A0("xpc");
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG))
    {
      int v15 = 67109120;
      unsigned int v16 = [v4 processIdentifier];
      _os_log_debug_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEBUG, "Client (pid: %d) properly entitled for supd interface, let's go", (uint8_t *)&v15, 8u);
    }
    v10 = &protocolRef_supdProtocol;
    goto LABEL_14;
  }
  unsigned int v8 = [v7 BOOLValue];
  if (v6) {
    goto LABEL_11;
  }
  if (v8)
  {
    v9 = sub_1000106A0("xpc");
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG))
    {
      int v15 = 67109120;
      unsigned int v16 = [v4 processIdentifier];
      _os_log_debug_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEBUG, "Client (pid: %d) properly entitled for trustd file helper interface, let's go", (uint8_t *)&v15, 8u);
    }
    v10 = &protocolRef_TrustdFileHelper_protocol;
LABEL_14:

    v11 = +[NSXPCInterface interfaceWithProtocol:*v10];
    [v4 setExportedInterface:v11];

    v12 = [[supd alloc] initWithConnection:v4];
    [v4 setExportedObject:v12];
    [v4 resume];
    BOOL v13 = 1;
    goto LABEL_18;
  }
LABEL_15:
  sub_1000106A0("SecError");
  v12 = (supd *)objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(&v12->super, OS_LOG_TYPE_DEFAULT))
  {
    int v15 = 67109120;
    unsigned int v16 = [v4 processIdentifier];
    _os_log_impl((void *)&_mh_execute_header, &v12->super, OS_LOG_TYPE_DEFAULT, "xpc: Client (pid: %d) doesn't have entitlement", (uint8_t *)&v15, 8u);
  }
  BOOL v13 = 0;
LABEL_18:

  return v13;
}

@end