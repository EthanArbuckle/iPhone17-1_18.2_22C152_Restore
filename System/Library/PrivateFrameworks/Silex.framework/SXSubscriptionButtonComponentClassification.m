@interface SXSubscriptionButtonComponentClassification
+ (id)roleString;
+ (int)role;
- (Class)componentModelClass;
- (id)accessibilityContextualLabel;
@end

@implementation SXSubscriptionButtonComponentClassification

+ (int)role
{
  return 35;
}

+ (id)roleString
{
  return @"subscription_button";
}

- (Class)componentModelClass
{
  return (Class)objc_opt_class();
}

- (id)accessibilityContextualLabel
{
  v2 = SXBundle();
  v3 = [v2 localizedStringForKey:@"Subscription Button" value:&stru_26D5311C0 table:0];

  return v3;
}

@end