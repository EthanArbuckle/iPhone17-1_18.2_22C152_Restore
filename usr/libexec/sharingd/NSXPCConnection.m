@interface NSXPCConnection
- (BOOL)_connectionHasEntitlement:(id)a3;
- (BOOL)sd_connectionCanShareURL:(id)a3;
- (BOOL)sd_connectionHasEntitlement:(id)a3;
- (NSString)sd_connectionBundleID;
- (NSString)sd_connectionProcessName;
- (NSString)sd_description;
@end

@implementation NSXPCConnection

- (NSString)sd_description
{
  uint64_t v3 = [(NSXPCConnection *)self sd_connectionBundleID];
  v4 = (void *)v3;
  v5 = @"N/A";
  if (v3) {
    v5 = (__CFString *)v3;
  }
  v6 = v5;

  v7 = +[NSString stringWithFormat:@"%@(%d)", v6, [(NSXPCConnection *)self processIdentifier]];

  return (NSString *)v7;
}

- (NSString)sd_connectionBundleID
{
  uint64_t v3 = [(NSXPCConnection *)self _xpcConnection];
  v4 = sub_1001B3F50(v3);

  if (!v4)
  {
    v4 = [(NSXPCConnection *)self valueForEntitlement:@"application-identifier"];
  }

  return (NSString *)v4;
}

- (NSString)sd_connectionProcessName
{
  if (proc_name([(NSXPCConnection *)self processIdentifier], &v4, 0x20u) < 1) {
    id v2 = 0;
  }
  else {
    id v2 = [objc_alloc((Class)NSString) initWithUTF8String:&v4];
  }

  return (NSString *)v2;
}

- (BOOL)sd_connectionHasEntitlement:(id)a3
{
  uint64_t v3 = [(NSXPCConnection *)self valueForEntitlement:a3];
  if (objc_opt_respondsToSelector()) {
    unsigned __int8 v4 = [v3 BOOLValue];
  }
  else {
    unsigned __int8 v4 = 0;
  }

  return v4;
}

- (BOOL)sd_connectionCanShareURL:(id)a3
{
  CFURLRef v4 = (const __CFURL *)a3;
  [(NSXPCConnection *)self auditToken];
  char v5 = sub_1001B2618(v4);
  if ((v5 & 1) == 0)
  {
    v6 = share_sheet_log();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR)) {
      sub_1007134E8(v4, v6);
    }
  }
  return v5;
}

- (BOOL)_connectionHasEntitlement:(id)a3
{
  uint64_t v3 = [(NSXPCConnection *)self valueForEntitlement:a3];
  if (objc_opt_respondsToSelector()) {
    unsigned __int8 v4 = [v3 BOOLValue];
  }
  else {
    unsigned __int8 v4 = 0;
  }

  return v4;
}

@end