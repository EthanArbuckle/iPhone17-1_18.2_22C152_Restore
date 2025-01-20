@interface PSFamilyMLModel
@end

@implementation PSFamilyMLModel

_PSFamilyFeatureExtractor *__30___PSFamilyMLModel_commonInit__block_invoke(uint64_t a1)
{
  v1 = [[_PSFamilyFeatureExtractor alloc] initWithActivity:*(void *)(a1 + 32)];

  return v1;
}

uint64_t __68___PSFamilyMLModel_familiesPredictionForContacts_withMaxSuggestion___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v4 = a3;
  v5 = [a2 lastObject];
  v6 = [v4 lastObject];

  [v5 doubleValue];
  double v8 = v7;
  [v6 doubleValue];
  if (v8 >= v9)
  {
    [v5 doubleValue];
    double v12 = v11;
    [v6 doubleValue];
    if (v12 <= v13) {
      uint64_t v10 = 0;
    }
    else {
      uint64_t v10 = -1;
    }
  }
  else
  {
    uint64_t v10 = 1;
  }

  return v10;
}

@end