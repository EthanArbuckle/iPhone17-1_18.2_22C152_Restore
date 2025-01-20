@interface SXSubscriptionStatusConditionValidator
- (BOOL)validateCondition:(id)a3 context:(id)a4;
@end

@implementation SXSubscriptionStatusConditionValidator

- (BOOL)validateCondition:(id)a3 context:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  v7 = [v5 subscriptionStatus];

  if (v7)
  {
    v8 = [v5 subscriptionStatus];
    int v9 = [v8 isEqualToString:@"bundle"];

    if (v9)
    {
      char v10 = [v6 isBundleSubscriber];
    }
    else
    {
      v12 = [v5 subscriptionStatus];
      int v13 = [v12 isEqualToString:@"subscribed"];

      if (v13)
      {
        char v10 = [v6 isChannelSubscriber];
      }
      else
      {
        v14 = [v5 subscriptionStatus];
        int v15 = [v14 isEqualToString:@"bundle_trial_eligible"];

        if (!v15)
        {
          BOOL v11 = 0;
          goto LABEL_10;
        }
        char v10 = [v6 isBundleTrialEligible];
      }
    }
    BOOL v11 = v10;
  }
  else
  {
    BOOL v11 = 1;
  }
LABEL_10:

  return v11;
}

@end