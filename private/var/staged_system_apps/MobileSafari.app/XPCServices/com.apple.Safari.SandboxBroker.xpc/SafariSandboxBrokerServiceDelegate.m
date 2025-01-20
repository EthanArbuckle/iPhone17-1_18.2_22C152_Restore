@interface SafariSandboxBrokerServiceDelegate
- (BOOL)listener:(id)a3 shouldAcceptNewConnection:(id)a4;
@end

@implementation SafariSandboxBrokerServiceDelegate

- (BOOL)listener:(id)a3 shouldAcceptNewConnection:(id)a4
{
  id v4 = a4;
  v5 = WBSUISafariSandboxBrokerInterface();
  [v4 setExportedInterface:v5];

  id v6 = objc_alloc((Class)WBSUISafariSandboxBroker);
  id v7 = [v4 processIdentifier];
  if (v4) {
    [v4 auditToken];
  }
  else {
    memset(v10, 0, sizeof(v10));
  }
  id v8 = [v6 initWithPID:v7 auditToken:v10];
  [v4 setExportedObject:v8];

  [v4 resume];
  return 1;
}

@end