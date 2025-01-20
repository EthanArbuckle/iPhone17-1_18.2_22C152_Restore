@interface REAggregateRuleCondition
@end

@implementation REAggregateRuleCondition

uint64_t __74___REAggregateRuleCondition__acceptsFeatureMap_predictionSet_explanation___block_invoke(void *a1, void *a2)
{
  uint64_t v3 = a1[4];
  uint64_t v4 = a1[5];
  id v13 = 0;
  uint64_t v5 = [a2 _acceptsFeatureMap:v3 predictionSet:v4 explanation:&v13];
  id v6 = v13;
  if (v5)
  {
    v7 = *(id **)(*(void *)(a1[6] + 8) + 24);
    if (v7)
    {
      id v8 = *v7;
      v9 = v8;
      if (v8) {
        BOOL v10 = v6 == 0;
      }
      else {
        BOOL v10 = 1;
      }
      if (v10)
      {
        if (!v8) {
          id v8 = v6;
        }
        id v11 = v8;
      }
      else
      {
        id v11 = [v8 explanationByCombiningWithExplanation:v6];
      }
      **(void **)(*(void *)(a1[6] + 8) + 24) = v11;
    }
  }

  return v5;
}

@end