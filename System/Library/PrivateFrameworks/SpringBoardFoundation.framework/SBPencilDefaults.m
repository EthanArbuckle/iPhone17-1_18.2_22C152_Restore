@interface SBPencilDefaults
- (void)_bindAndRegisterDefaults;
@end

@implementation SBPencilDefaults

- (void)_bindAndRegisterDefaults
{
  id v3 = [NSString stringWithUTF8String:"squeezeConfiguredActionArchive"];
  [(BSAbstractDefaultDomain *)self _bindProperty:v3 withDefaultKey:@"SBPencilSystemShortcutAction" toDefaultValue:0 options:1];
}

@end