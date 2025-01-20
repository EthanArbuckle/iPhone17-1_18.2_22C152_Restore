@interface PSSpecifier(TelephonyPreferences)
- (id)tps_subscriptionContext;
- (id)tps_subscriptions;
@end

@implementation PSSpecifier(TelephonyPreferences)

- (id)tps_subscriptionContext
{
  v1 = [a1 propertyForKey:*MEMORY[0x1E4F93210]];
  if (v1 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0)) {
    id v2 = v1;
  }
  else {
    id v2 = 0;
  }

  return v2;
}

- (id)tps_subscriptions
{
  v1 = [a1 propertyForKey:@"TPSSpecifierSubscriptionsKey"];
  if (v1 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0)) {
    id v2 = v1;
  }
  else {
    id v2 = 0;
  }

  return v2;
}

@end