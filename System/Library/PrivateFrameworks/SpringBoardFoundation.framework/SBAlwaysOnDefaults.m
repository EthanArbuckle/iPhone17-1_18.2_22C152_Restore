@interface SBAlwaysOnDefaults
- (void)_bindAndRegisterDefaults;
@end

@implementation SBAlwaysOnDefaults

- (void)_bindAndRegisterDefaults
{
  v3 = [NSString stringWithUTF8String:"enableAlwaysOn"];
  uint64_t v4 = MEMORY[0x1E4F1CC38];
  [(BSAbstractDefaultDomain *)self _bindProperty:v3 withDefaultKey:@"SBEnableAlwaysOn" toDefaultValue:MEMORY[0x1E4F1CC38] options:1];

  v5 = [NSString stringWithUTF8String:"enableTapToInteract"];
  uint64_t v6 = MEMORY[0x1E4F1CC28];
  [(BSAbstractDefaultDomain *)self _bindProperty:v5 withDefaultKey:@"SBAlwaysOnTapToInteract" toDefaultValue:MEMORY[0x1E4F1CC28] options:4];

  v7 = [NSString stringWithUTF8String:"enableSwipeToUnlock"];
  [(BSAbstractDefaultDomain *)self _bindProperty:v7 withDefaultKey:@"SBAlwaysOnSwipeToUnlock" toDefaultValue:v4 options:4];

  v8 = [NSString stringWithUTF8String:"forceAndromedaSupport"];
  [(BSAbstractDefaultDomain *)self _bindProperty:v8 withDefaultKey:@"SBForceAndromedaSupport" toDefaultValue:v6 options:4];

  v9 = [NSString stringWithUTF8String:"useAlwaysOnBrightnessCurve"];
  [(BSAbstractDefaultDomain *)self _bindProperty:v9 withDefaultKey:@"SBUseAlwaysOnBrightnessCurve" toDefaultValue:v4 options:4];

  v10 = [NSString stringWithUTF8String:"useDebugColors"];
  [(BSAbstractDefaultDomain *)self _bindProperty:v10 withDefaultKey:@"SBAndromedaDebugColors" toDefaultValue:v6 options:4];

  v11 = [NSString stringWithUTF8String:"enforceOverallAPLLimit"];
  [(BSAbstractDefaultDomain *)self _bindProperty:v11 withDefaultKey:@"SBEnforceOverallAPLLimit" toDefaultValue:v4 options:4];

  v12 = [NSString stringWithUTF8String:"maximumRenderInterval"];
  [(BSAbstractDefaultDomain *)self _bindProperty:v12 withDefaultKey:@"SBAndromedaMaximumFlipbookDuration" toDefaultValue:0 options:1];

  v13 = [NSString stringWithUTF8String:"showWallpaperInAlwaysOn"];
  [(BSAbstractDefaultDomain *)self _bindProperty:v13 withDefaultKey:@"SBShowWallpaperInAlwaysOn" toDefaultValue:v4 options:1];

  id v14 = [NSString stringWithUTF8String:"showNotificationsInAlwaysOn"];
  [(BSAbstractDefaultDomain *)self _bindProperty:v14 withDefaultKey:@"SBShowNotificationsInAlwaysOn" toDefaultValue:v4 options:1];
}

@end