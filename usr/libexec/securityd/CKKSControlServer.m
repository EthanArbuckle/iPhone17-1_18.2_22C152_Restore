@interface CKKSControlServer
- (BOOL)listener:(id)a3 shouldAcceptNewConnection:(id)a4;
@end

@implementation CKKSControlServer

- (BOOL)listener:(id)a3 shouldAcceptNewConnection:(id)a4
{
  id v4 = a4;
  v5 = [v4 valueForEntitlement:@"com.apple.private.ckks"];
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0 || ([v5 BOOLValue] & 1) == 0)
  {
    v10 = sub_1000CD884(@"ckks", 0);
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
    {
      int v13 = 67109378;
      unsigned int v14 = [v4 processIdentifier];
      __int16 v15 = 2112;
      CFStringRef v16 = @"com.apple.private.ckks";
      _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_ERROR, "Client pid: %d doesn't have entitlement: %@", (uint8_t *)&v13, 0x12u);
    }

    goto LABEL_8;
  }
  if ((sub_1000B14D4() & 1) == 0)
  {
    v12 = sub_1000CD884(@"ckks", 0);
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
    {
      int v13 = 67109120;
      unsigned int v14 = [v4 processIdentifier];
      _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_ERROR, "Client pid: %d attempted to use CKKS, but CKKS is not enabled.", (uint8_t *)&v13, 8u);
    }

LABEL_8:
    BOOL v9 = 0;
    goto LABEL_9;
  }
  v6 = +[NSXPCInterface interfaceWithProtocol:&OBJC_PROTOCOL___CKKSControlProtocol];
  v7 = CKKSSetupControlProtocol();
  [v4 setExportedInterface:v7];

  v8 = +[CKKSViewManager manager];
  [v4 setExportedObject:v8];

  [v4 resume];
  BOOL v9 = 1;
LABEL_9:

  return v9;
}

@end