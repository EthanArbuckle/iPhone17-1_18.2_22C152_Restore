@interface USXPCListenerDelegate
- (BOOL)listener:(id)a3 shouldAcceptNewConnection:(id)a4;
@end

@implementation USXPCListenerDelegate

- (BOOL)listener:(id)a3 shouldAcceptNewConnection:(id)a4
{
  id v4 = a4;
  v5 = [v4 serviceName];
  if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEBUG)) {
    sub_10006C5C0((uint64_t)v5, v4);
  }
  if ([v5 isEqualToString:USMachServiceNameUsageTrackingPrivate])
  {
    v6 = (id *)USTrackingAgentPrivateConnection_ptr;
    if ((+[USTrackingAgentPrivateConnection connectionHasPrivateEntitlement:v4] & 1) == 0)
    {
      if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
        sub_10006C4A8((uint64_t)v4);
      }
LABEL_12:
      BOOL v9 = 0;
      goto LABEL_13;
    }
  }
  else
  {
    if (([v5 isEqualToString:USMachServiceNameUsageTracking] & 1) == 0)
    {
      if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
        sub_10006C540((uint64_t)v5);
      }
      goto LABEL_12;
    }
    v6 = (id *)USTrackingAgentConnection_ptr;
  }
  id v7 = [*v6 newInterface];
  [v4 setExportedInterface:v7];
  v8 = objc_opt_new();
  [v4 setExportedObject:v8];

  [v4 resume];
  BOOL v9 = 1;
LABEL_13:

  return v9;
}

@end