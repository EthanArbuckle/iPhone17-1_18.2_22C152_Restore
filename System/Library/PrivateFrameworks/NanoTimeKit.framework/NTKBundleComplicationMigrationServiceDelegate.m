@interface NTKBundleComplicationMigrationServiceDelegate
- (BOOL)listener:(id)a3 shouldAcceptNewConnection:(id)a4;
- (BOOL)requireEntitlement;
- (void)setRequireEntitlement:(BOOL)a3;
@end

@implementation NTKBundleComplicationMigrationServiceDelegate

- (BOOL)listener:(id)a3 shouldAcceptNewConnection:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v8 = v7;
  if (self->_requireEntitlement
    && ([v7 valueForEntitlement:@"com.apple.nanotimekit.BundleComplicationMigrationService"],
        v9 = objc_claimAutoreleasedReturnValue(),
        int v10 = [v9 BOOLValue],
        v9,
        !v10))
  {
    BOOL v13 = 0;
  }
  else
  {
    v11 = [MEMORY[0x1E4F29280] interfaceWithProtocol:&unk_1FCDD0EB8];
    [v8 setExportedInterface:v11];

    v12 = objc_opt_new();
    [v8 setExportedObject:v12];
    [v8 resume];

    BOOL v13 = 1;
  }

  return v13;
}

- (BOOL)requireEntitlement
{
  return self->_requireEntitlement;
}

- (void)setRequireEntitlement:(BOOL)a3
{
  self->_requireEntitlement = a3;
}

@end