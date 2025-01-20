@interface SXSubscriptionActivationEligibilityConditionValidator
- (BOOL)validateCondition:(id)a3 context:(id)a4;
@end

@implementation SXSubscriptionActivationEligibilityConditionValidator

- (BOOL)validateCondition:(id)a3 context:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  if (![v5 subscriptionActivationEligibility]) {
    goto LABEL_4;
  }
  if ([v5 subscriptionActivationEligibility] != 2)
  {
    uint64_t v8 = [v5 subscriptionActivationEligibility];
    uint64_t v9 = [v6 subscriptionActivationEligibility];
LABEL_7:
    BOOL v7 = v8 == v9;
    goto LABEL_8;
  }
  if ([v6 subscriptionActivationEligibility] != 3)
  {
    uint64_t v8 = [v6 subscriptionActivationEligibility];
    uint64_t v9 = 4;
    goto LABEL_7;
  }
LABEL_4:
  BOOL v7 = 1;
LABEL_8:

  return v7;
}

@end