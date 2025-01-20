@interface MobileInstallationServiceDelegate
- (BOOL)listener:(id)a3 shouldAcceptNewConnection:(id)a4;
@end

@implementation MobileInstallationServiceDelegate

- (BOOL)listener:(id)a3 shouldAcceptNewConnection:(id)a4
{
  id v4 = a4;
  v5 = sub_10000B5CC();
  [v4 setExportedInterface:v5];

  v6 = objc_opt_new();
  [v4 setExportedObject:v6];
  v7 = sub_10000B544();
  [v4 setRemoteObjectInterface:v7];

  [v6 setXpcConnection:v4];
  [v4 setInterruptionHandler:&stru_10008D110];
  [v4 setInvalidationHandler:&stru_10008D130];
  [v4 resume];

  return 1;
}

@end