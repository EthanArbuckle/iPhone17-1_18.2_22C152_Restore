@interface SBApplicationDefaults
- (void)_bindAndRegisterDefaults;
@end

@implementation SBApplicationDefaults

- (void)_bindAndRegisterDefaults
{
  v3 = [NSString stringWithUTF8String:"forcesMedusaAdoption"];
  uint64_t v4 = MEMORY[0x1E4F1CC28];
  [(BSAbstractDefaultDomain *)self _bindProperty:v3 withDefaultKey:@"SBForceMedusaAdoption" toDefaultValue:MEMORY[0x1E4F1CC28] options:1];

  v5 = [NSString stringWithUTF8String:"ignoresDeclaredNetworkUsage"];
  [(BSAbstractDefaultDomain *)self _bindProperty:v5 withDefaultKey:@"SBIgnoreSBUsesNetwork" toDefaultValue:v4 options:1];

  v6 = [NSString stringWithUTF8String:"shouldShowInternalApplications"];
  [(BSAbstractDefaultDomain *)self _bindProperty:v6 withDefaultKey:@"SBShowInternalApps" toDefaultValue:v4 options:1];

  v7 = [NSString stringWithUTF8String:"shouldShowNonDefaultSystemApplications"];
  [(BSAbstractDefaultDomain *)self _bindProperty:v7 withDefaultKey:@"SBShowNonDefaultSystemApps" toDefaultValue:v4 options:1];

  v8 = [NSString stringWithUTF8String:"shouldAllowScreenshotsInLoginWindow"];
  [(BSAbstractDefaultDomain *)self _bindProperty:v8 withDefaultKey:@"SBAllowScreenshotsInLoginWindow" toDefaultValue:v4 options:1];

  v9 = [NSString stringWithUTF8String:"bundleIdentifierToForceHomeAffordanceInset"];
  [(BSAbstractDefaultDomain *)self _bindProperty:v9 withDefaultKey:@"SBBundleIdentifierToForceHomeAffordanceInset" toDefaultValue:0 options:4];

  v10 = [NSString stringWithUTF8String:"shouldAllowUseOfNonRecapPPT"];
  [(BSAbstractDefaultDomain *)self _bindProperty:v10 withDefaultKey:@"SBAllowUseOfNonRecapPPT" toDefaultValue:v4 options:1];

  id v11 = [NSString stringWithUTF8String:"laserForLaunchPPT"];
  [(BSAbstractDefaultDomain *)self _bindProperty:v11 withDefaultKey:@"SBLaserForLaunchPPT" toDefaultValue:v4 options:1];
}

@end