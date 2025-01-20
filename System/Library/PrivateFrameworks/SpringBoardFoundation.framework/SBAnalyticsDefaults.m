@interface SBAnalyticsDefaults
- (void)_bindAndRegisterDefaults;
@end

@implementation SBAnalyticsDefaults

- (void)_bindAndRegisterDefaults
{
  id v3 = [NSString stringWithUTF8String:"engagementPlistRepresentation"];
  [(BSAbstractDefaultDomain *)self _bindProperty:v3 withDefaultKey:@"SBAnalyticsEngagementPlistRepresentation" toDefaultValue:0 options:1];
}

@end