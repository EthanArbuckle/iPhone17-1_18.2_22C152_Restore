@interface SXLegacySubscriptionButtonComponentClassification
+ (id)typeString;
- (Class)componentModelClass;
@end

@implementation SXLegacySubscriptionButtonComponentClassification

+ (id)typeString
{
  return @"subscription_button";
}

- (Class)componentModelClass
{
  return (Class)objc_opt_class();
}

@end