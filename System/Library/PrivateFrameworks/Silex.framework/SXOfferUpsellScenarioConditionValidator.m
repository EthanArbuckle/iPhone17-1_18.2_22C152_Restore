@interface SXOfferUpsellScenarioConditionValidator
- (BOOL)validateCondition:(id)a3 context:(id)a4;
@end

@implementation SXOfferUpsellScenarioConditionValidator

- (BOOL)validateCondition:(id)a3 context:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  if ([v5 offerUpsellScenario] != 1)
  {
    if ([v5 offerUpsellScenario])
    {
      if ([v5 offerUpsellScenario] == 4)
      {
        if ([v6 offerUpsellScenario] == 5
          || [v6 offerUpsellScenario] == 6
          || [v6 offerUpsellScenario] == 9
          || [v6 offerUpsellScenario] == 8)
        {
          goto LABEL_9;
        }
        uint64_t v8 = [v6 offerUpsellScenario];
        uint64_t v9 = 7;
      }
      else
      {
        uint64_t v8 = [v5 offerUpsellScenario];
        uint64_t v9 = [v6 offerUpsellScenario];
      }
      BOOL v7 = v8 == v9;
      goto LABEL_12;
    }
LABEL_9:
    BOOL v7 = 1;
    goto LABEL_12;
  }
  BOOL v7 = 0;
LABEL_12:

  return v7;
}

@end