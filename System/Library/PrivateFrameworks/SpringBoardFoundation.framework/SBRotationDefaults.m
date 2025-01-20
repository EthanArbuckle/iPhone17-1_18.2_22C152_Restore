@interface SBRotationDefaults
- (void)_bindAndRegisterDefaults;
@end

@implementation SBRotationDefaults

- (void)_bindAndRegisterDefaults
{
  v3 = [NSString stringWithUTF8String:"lastLockedOrientation"];
  if (__sb__runningInSpringBoard())
  {
    if (SBFEffectiveDeviceClass() == 2) {
      v4 = @"SBLastRotationLockedOrientationiPad";
    }
    else {
      v4 = @"SBLastRotationLockedOrientation";
    }
    [(BSAbstractDefaultDomain *)self _bindProperty:v3 withDefaultKey:v4 toDefaultValue:&unk_1ED89E500 options:1];
  }
  else
  {
    v5 = [MEMORY[0x1E4F42948] currentDevice];
    if ([v5 userInterfaceIdiom] == 1) {
      v6 = @"SBLastRotationLockedOrientationiPad";
    }
    else {
      v6 = @"SBLastRotationLockedOrientation";
    }
    [(BSAbstractDefaultDomain *)self _bindProperty:v3 withDefaultKey:v6 toDefaultValue:&unk_1ED89E500 options:1];
  }
  v7 = [NSString stringWithUTF8String:"videoRotationEnabled"];
  uint64_t v8 = MEMORY[0x1E4F1CC28];
  [(BSAbstractDefaultDomain *)self _bindProperty:v7 withDefaultKey:@"SBEnableVideoRotation" toDefaultValue:MEMORY[0x1E4F1CC28] options:1];

  id v9 = [NSString stringWithUTF8String:"postModernRotationForciblyEnabled"];
  [(BSAbstractDefaultDomain *)self _bindProperty:v9 withDefaultKey:@"SBPostModernRotationForciblyEnabled" toDefaultValue:v8 options:1];
}

@end