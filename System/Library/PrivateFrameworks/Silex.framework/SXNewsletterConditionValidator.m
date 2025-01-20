@interface SXNewsletterConditionValidator
- (BOOL)validateCondition:(id)a3 context:(id)a4;
@end

@implementation SXNewsletterConditionValidator

- (BOOL)validateCondition:(id)a3 context:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  if ([v5 newsletterSubscriptionStatus])
  {
    if ([v5 newsletterSubscriptionStatus] == 1)
    {
      BOOL v7 = 0;
    }
    else
    {
      uint64_t v8 = [v5 newsletterSubscriptionStatus];
      BOOL v7 = v8 == [v6 newsletterSubscriptionStatus];
    }
  }
  else
  {
    BOOL v7 = 1;
  }

  return v7;
}

@end