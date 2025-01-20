@interface SBWorkspaceDefaults
- (void)_bindAndRegisterDefaults;
@end

@implementation SBWorkspaceDefaults

- (void)_bindAndRegisterDefaults
{
  v3 = [NSString stringWithUTF8String:"medusaDeviceSimulation"];
  [(BSAbstractDefaultDomain *)self _bindProperty:v3 withDefaultKey:@"SBMedusaDeviceSimulation" toDefaultValue:&unk_1ED89E5C0 options:1];

  id v4 = [NSString stringWithUTF8String:"breadcrumbDisabled"];
  [(BSAbstractDefaultDomain *)self _bindProperty:v4 withDefaultKey:@"SBNeverBreadcrumb" toDefaultValue:MEMORY[0x1E4F1CC28] options:1];
}

@end