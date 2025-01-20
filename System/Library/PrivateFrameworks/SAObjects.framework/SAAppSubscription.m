@interface SAAppSubscription
+ (id)appSubscription;
- (NSArray)subscriptionTiers;
- (NSString)bundleId;
- (id)encodedClassName;
- (id)groupIdentifier;
- (void)setBundleId:(id)a3;
- (void)setSubscriptionTiers:(id)a3;
@end

@implementation SAAppSubscription

- (id)groupIdentifier
{
  return @"com.apple.ace.system";
}

- (id)encodedClassName
{
  return @"AppSubscription";
}

+ (id)appSubscription
{
  id v2 = objc_alloc_init((Class)a1);
  return v2;
}

- (NSString)bundleId
{
  return (NSString *)[(AceObject *)self propertyForKey:@"bundleId"];
}

- (void)setBundleId:(id)a3
{
}

- (NSArray)subscriptionTiers
{
  return (NSArray *)[(AceObject *)self propertyForKey:@"subscriptionTiers"];
}

- (void)setSubscriptionTiers:(id)a3
{
}

@end