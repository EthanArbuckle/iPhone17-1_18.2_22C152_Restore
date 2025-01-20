@interface NSXPCConnection
- (BOOL)wc_connectionHasEntitlement:(id)a3;
- (BOOL)wc_connectionIsiOSExtension;
- (NSString)wc_connectionBundleID;
- (NSString)wc_connectionCommunicationID;
@end

@implementation NSXPCConnection

- (BOOL)wc_connectionIsiOSExtension
{
  v2 = [(NSXPCConnection *)self _xpcConnection];
  char is_extension = xpc_connection_is_extension();

  return is_extension;
}

- (NSString)wc_connectionBundleID
{
  [(NSXPCConnection *)self auditToken];
  id v10 = 0;
  v3 = +[LSBundleRecord bundleRecordForAuditToken:v11 error:&v10];
  id v4 = v10;
  if (v4)
  {
    v5 = wc_log();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR)) {
      sub_10002CACC((uint64_t)self, (uint64_t)v4, v5);
    }
  }
  if (!v3 || ([v3 bundleIdentifier], (v6 = objc_claimAutoreleasedReturnValue()) == 0))
  {
    v7 = [(NSXPCConnection *)self _xpcConnection];
    v8 = (void *)xpc_connection_copy_bundle_id();

    if (!v8
      || (+[NSString stringWithUTF8String:v8],
          v6 = objc_claimAutoreleasedReturnValue(),
          free(v8),
          !v6))
    {
      v6 = [(NSXPCConnection *)self valueForEntitlement:@"application-identifier"];
    }
  }

  return (NSString *)v6;
}

- (NSString)wc_connectionCommunicationID
{
  v3 = [(NSXPCConnection *)self wc_connectionBundleID];
  id v4 = +[WCDSystemMonitor sharedSystemMonitor];
  v5 = [v4 applicationWorkspace];
  v6 = [v5 applicationInfoForBundleIdentifier:v3 type:7];

  id v7 = [v6 companionAppBundleIdentifier];
  if (!v7)
  {
    v8 = [(NSXPCConnection *)self _xpcConnection];
    int is_extension = xpc_connection_is_extension();

    if (is_extension)
    {
      id v10 = wc_log();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR)) {
        sub_10002CB54(v10);
      }

      id v7 = 0;
    }
    else
    {
      id v7 = v3;
    }
  }
  id v11 = v7;

  return (NSString *)v11;
}

- (BOOL)wc_connectionHasEntitlement:(id)a3
{
  v3 = [(NSXPCConnection *)self valueForEntitlement:a3];
  if (objc_opt_respondsToSelector()) {
    unsigned __int8 v4 = [v3 BOOLValue];
  }
  else {
    unsigned __int8 v4 = 0;
  }

  return v4;
}

@end