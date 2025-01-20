@interface CDServiceClient
+ (CDServiceClient)currentClient;
- (BOOL)hasAMSDelegatePurchaseEntitlement;
- (BOOL)hasAppSignInOverrideBundleIdentifierEntitlement;
- (BOOL)hasDaemonStatusEntitlement;
- (BOOL)hasDedicatedCameraEntitlement;
- (BOOL)hasRestrictedAccessEntitlement;
- (BOOL)hasStoreAuthenticationEntitlement;
- (BOOL)hasStorePurchaseEntitlement;
- (BOOL)hasSystemAuthenticationEntitlement;
- (BOOL)shouldReceiveDeviceEvents;
- (BSAuditToken)auditToken;
- (CDServiceClient)initWithAuditToken:(id)a3;
- (CDServiceClient)initWithConnection:(id)a3;
- (NSString)bundleIdentifier;
@end

@implementation CDServiceClient

- (CDServiceClient)initWithAuditToken:(id)a3
{
  id v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)CDServiceClient;
  v5 = [(CDServiceClient *)&v9 init];
  if (v5)
  {
    v6 = (BSAuditToken *)[v4 copy];
    auditToken = v5->_auditToken;
    v5->_auditToken = v6;
  }
  return v5;
}

- (CDServiceClient)initWithConnection:(id)a3
{
  id v4 = +[BSAuditToken tokenFromNSXPCConnection:a3];
  v5 = [(CDServiceClient *)self initWithAuditToken:v4];

  return v5;
}

+ (CDServiceClient)currentClient
{
  v2 = +[NSXPCConnection currentConnection];
  if (v2) {
    v3 = [[CDServiceClient alloc] initWithConnection:v2];
  }
  else {
    v3 = 0;
  }

  return v3;
}

- (NSString)bundleIdentifier
{
  return (NSString *)[(BSAuditToken *)self->_auditToken bundleID];
}

- (BOOL)hasDaemonStatusEntitlement
{
  return [(BSAuditToken *)self->_auditToken hasEntitlement:@"com.apple.companion-authentication.daemon-status"];
}

- (BOOL)hasStorePurchaseEntitlement
{
  return [(BSAuditToken *)self->_auditToken hasEntitlement:@"com.apple.companion-authentication.store-purchase"];
}

- (BOOL)hasAppSignInOverrideBundleIdentifierEntitlement
{
  return [(BSAuditToken *)self->_auditToken hasEntitlement:@"com.apple.companion-authentication.app-sign-in.override-bundle-identifier"];
}

- (BOOL)hasAMSDelegatePurchaseEntitlement
{
  return [(BSAuditToken *)self->_auditToken hasEntitlement:@"com.apple.companion-authentication.ams-delegate-purchase"];
}

- (BOOL)hasSystemAuthenticationEntitlement
{
  return [(BSAuditToken *)self->_auditToken hasEntitlement:@"com.apple.companion-authentication.system-service"];
}

- (BOOL)hasRestrictedAccessEntitlement
{
  return [(BSAuditToken *)self->_auditToken hasEntitlement:@"com.apple.companion-authentication.restricted-access"];
}

- (BOOL)hasStoreAuthenticationEntitlement
{
  return [(BSAuditToken *)self->_auditToken hasEntitlement:@"com.apple.companion-authentication.store-authentication"];
}

- (BOOL)hasDedicatedCameraEntitlement
{
  return [(BSAuditToken *)self->_auditToken hasEntitlement:@"com.apple.companion-authentication.dedicated-camera"];
}

- (BOOL)shouldReceiveDeviceEvents
{
  if ([(CDServiceClient *)self hasStorePurchaseEntitlement]) {
    return 1;
  }

  return [(CDServiceClient *)self hasSystemAuthenticationEntitlement];
}

- (BSAuditToken)auditToken
{
  return self->_auditToken;
}

- (void).cxx_destruct
{
}

@end