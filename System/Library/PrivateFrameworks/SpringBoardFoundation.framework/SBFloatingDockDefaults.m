@interface SBFloatingDockDefaults
- (void)_bindAndRegisterDefaults;
@end

@implementation SBFloatingDockDefaults

- (void)_bindAndRegisterDefaults
{
  v3 = [NSString stringWithUTF8String:"appLibraryEnabled"];
  uint64_t v4 = MEMORY[0x1E4F1CC38];
  [(BSAbstractDefaultDomain *)self _bindProperty:v3 withDefaultKey:@"SBAppLibraryInDockEnabled" toDefaultValue:MEMORY[0x1E4F1CC38] options:1];

  id v5 = [NSString stringWithUTF8String:"recentsEnabled"];
  [(BSAbstractDefaultDomain *)self _bindProperty:v5 withDefaultKey:@"SBRecentsEnabled" toDefaultValue:v4 options:1];
}

@end