@interface PSSharingContactRankerModel
@end

@implementation PSSharingContactRankerModel

uint64_t __180___PSSharingContactRankerModel_suggestionProxiesWithPredictionContext_supportedBundleIDs_behaviorRulesConsideringInTheContext_interactionModelSuggestions_ruleRankingMLModelScores___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v4 = a2;
  id v5 = a3;
  [v4 score];
  double v7 = v6;
  [v5 score];
  if (v7 <= v8)
  {
    [v4 score];
    double v11 = v10;
    [v5 score];
    uint64_t v9 = v11 != v12;
  }
  else
  {
    uint64_t v9 = -1;
  }

  return v9;
}

@end