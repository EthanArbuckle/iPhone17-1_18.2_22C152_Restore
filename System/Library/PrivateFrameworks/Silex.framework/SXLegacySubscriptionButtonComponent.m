@interface SXLegacySubscriptionButtonComponent
- (id)action;
- (id)type;
@end

@implementation SXLegacySubscriptionButtonComponent

- (id)action
{
  v2 = objc_alloc_init(SXSubscribeAction);
  return v2;
}

- (id)type
{
  return @"button";
}

@end