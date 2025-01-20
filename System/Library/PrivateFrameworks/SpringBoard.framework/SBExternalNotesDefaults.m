@interface SBExternalNotesDefaults
- (SBExternalNotesDefaults)init;
- (void)_bindAndRegisterDefaults;
@end

@implementation SBExternalNotesDefaults

- (SBExternalNotesDefaults)init
{
  return (SBExternalNotesDefaults *)[(BSAbstractDefaultDomain *)self _initWithDomain:@"com.apple.mobilenotes"];
}

- (void)_bindAndRegisterDefaults
{
  id v3 = [NSString stringWithUTF8String:"quickNotesDisabled"];
  [(BSAbstractDefaultDomain *)self _bindProperty:v3 withDefaultKey:@"DisableOnLockScreen" toDefaultValue:MEMORY[0x1E4F1CC28] options:1];
}

@end