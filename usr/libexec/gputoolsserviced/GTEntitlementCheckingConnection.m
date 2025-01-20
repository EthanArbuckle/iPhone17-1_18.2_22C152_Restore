@interface GTEntitlementCheckingConnection
- (BOOL)isTrusted;
- (GTEntitlementCheckingConnection)initWithTransactionScopedXPCConnection:(id)a3 messageQueue:(id)a4;
@end

@implementation GTEntitlementCheckingConnection

- (void).cxx_destruct
{
}

- (BOOL)isTrusted
{
  v3 = [(GTLocalXPCConnection *)self connection];
  xpc_connection_get_audit_token();

  memset(&token, 0, sizeof(token));
  SecTaskRef v4 = SecTaskCreateWithAuditToken(0, &token);
  log = self->_log;
  if (v4)
  {
    v6 = v4;
    v7 = log;
    CFErrorRef error = 0;
    CFTypeRef v8 = SecTaskCopyValueForEntitlement(v6, @"com.apple.private.gputools.client", &error);
    CFErrorRef v9 = error;
    if (error)
    {
      if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
      {
        token.val[0] = 138412290;
        *(void *)&token.val[1] = v9;
        _os_log_error_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_ERROR, "Failed to copy com.apple.private.gputools.client entitlement value, %@", (uint8_t *)&token, 0xCu);
        CFErrorRef v9 = error;
      }
      CFErrorRef v10 = v9;
    }
    else
    {
      v16 = (void *)v8;
      if (!v8) {
        goto LABEL_7;
      }
      CFTypeID v17 = CFGetTypeID(v8);
      if (v17 == CFBooleanGetTypeID())
      {
        int v18 = CFEqual(v16, kCFBooleanTrue);
        CFRelease(v16);

        if (v18)
        {
LABEL_17:
          CFRelease(v6);
          LOBYTE(v15) = 1;
          return v15;
        }
LABEL_8:
        v11 = self->_log;
        CFErrorRef error = 0;
        CFStringRef v12 = SecTaskCopySigningIdentifier(v6, &error);
        if (v12)
        {
          CFErrorRef v13 = (CFErrorRef)v12;
          if (CFEqual(v12, @"com.apple.gputoolstransportd"))
          {
            uint32_t v14 = ~SecTaskGetCodeSignStatus(v6) & 0x24000001;
            CFRelease(v13);

            if (v14) {
              goto LABEL_23;
            }
            goto LABEL_17;
          }
        }
        else
        {
          if (os_log_type_enabled((os_log_t)v11, OS_LOG_TYPE_ERROR))
          {
            token.val[0] = 138412290;
            *(void *)&token.val[1] = error;
            _os_log_error_impl((void *)&_mh_execute_header, (os_log_t)v11, OS_LOG_TYPE_ERROR, "Failed to retrieve signing identifier, %@", (uint8_t *)&token, 0xCu);
          }
          CFErrorRef v13 = error;
          if (!error) {
            goto LABEL_22;
          }
        }
        CFRelease(v13);
LABEL_22:

LABEL_23:
        CFRelease(v6);
        goto LABEL_24;
      }
      CFErrorRef v10 = (CFErrorRef)v16;
    }
    CFRelease(v10);
LABEL_7:

    goto LABEL_8;
  }
  BOOL v15 = os_log_type_enabled((os_log_t)self->_log, OS_LOG_TYPE_ERROR);
  if (v15)
  {
    LOWORD(token.val[0]) = 0;
    _os_log_error_impl((void *)&_mh_execute_header, log, OS_LOG_TYPE_ERROR, "Failed to create task from audit token", (uint8_t *)&token, 2u);
LABEL_24:
    LOBYTE(v15) = 0;
  }
  return v15;
}

- (GTEntitlementCheckingConnection)initWithTransactionScopedXPCConnection:(id)a3 messageQueue:(id)a4
{
  v8.receiver = self;
  v8.super_class = (Class)GTEntitlementCheckingConnection;
  SecTaskRef v4 = [(GTLocalXPCConnection *)&v8 initWithTransactionScopedXPCConnection:a3 messageQueue:a4];
  if (v4)
  {
    os_log_t v5 = os_log_create("com.apple.gputools.transport", "EntitlementConnection");
    log = v4->_log;
    v4->_log = (OS_os_log *)v5;
  }
  return v4;
}

@end