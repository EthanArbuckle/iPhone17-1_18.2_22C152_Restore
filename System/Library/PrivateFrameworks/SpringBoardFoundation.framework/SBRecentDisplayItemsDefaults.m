@interface SBRecentDisplayItemsDefaults
- (void)_bindAndRegisterDefaults;
@end

@implementation SBRecentDisplayItemsDefaults

- (void)_bindAndRegisterDefaults
{
  v3 = [NSString stringWithUTF8String:"commandTabPlistRepresentation"];
  [(BSAbstractDefaultDomain *)self _bindProperty:v3 withDefaultKey:@"SBDefaultKeyCommandTabPlistRepresentation" toDefaultValue:0 options:1];

  id v4 = [NSString stringWithUTF8String:"dockRecentsPlistRepresentation"];
  [(BSAbstractDefaultDomain *)self _bindProperty:v4 withDefaultKey:@"SBDefaultKeyDockRecentsPlistRepresentation" toDefaultValue:0 options:1];
}

@end