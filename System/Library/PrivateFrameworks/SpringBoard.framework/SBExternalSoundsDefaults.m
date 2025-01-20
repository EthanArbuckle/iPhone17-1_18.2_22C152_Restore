@interface SBExternalSoundsDefaults
- (SBExternalSoundsDefaults)init;
- (void)_bindAndRegisterDefaults;
@end

@implementation SBExternalSoundsDefaults

- (SBExternalSoundsDefaults)init
{
  return (SBExternalSoundsDefaults *)[(BSAbstractDefaultDomain *)self _initWithDomain:@"com.apple.preferences.sounds"];
}

- (void)_bindAndRegisterDefaults
{
  v3 = [NSString stringWithUTF8String:"keyboardPlaysSounds"];
  uint64_t v4 = MEMORY[0x1E4F1CC38];
  [(BSAbstractDefaultDomain *)self _bindProperty:v3 withDefaultKey:@"keyboard" toDefaultValue:MEMORY[0x1E4F1CC38] options:1];

  v5 = [NSString stringWithUTF8String:"systemHapticsEnabled"];
  [(BSAbstractDefaultDomain *)self _bindProperty:v5 withDefaultKey:@"effects-haptic" toDefaultValue:v4 options:1];

  id v6 = [NSString stringWithUTF8String:"buttonsCanChangeRingerVolume"];
  [(BSAbstractDefaultDomain *)self _bindProperty:v6 withDefaultKey:@"buttons-can-change-ringer-volume" toDefaultValue:MEMORY[0x1E4F1CC28] options:1];
}

@end