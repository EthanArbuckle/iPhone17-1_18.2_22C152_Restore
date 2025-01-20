@interface SXSubscriptionActivationEligibilityDefaultProvider
- (int64_t)eligibility;
@end

@implementation SXSubscriptionActivationEligibilityDefaultProvider

- (int64_t)eligibility
{
  return 1;
}

@end