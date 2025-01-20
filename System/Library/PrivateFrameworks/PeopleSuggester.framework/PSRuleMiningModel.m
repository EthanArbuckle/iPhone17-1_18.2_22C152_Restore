@interface PSRuleMiningModel
@end

@implementation PSRuleMiningModel

uint64_t __101___PSRuleMiningModel_suggestionProxiesWithPredictionContext_photoSuggestedPeople_supportedBundleIDs___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  v7 = [v5 antecedent];
  v8 = (void *)[v7 mutableCopy];

  [v8 intersectSet:*(void *)(a1 + 32)];
  v9 = [v6 antecedent];
  v10 = (void *)[v9 mutableCopy];

  [v10 intersectSet:*(void *)(a1 + 32)];
  unint64_t v11 = [v8 count];
  if (v11 < [*(id *)(a1 + 40) _PSRuleMiningModelRegularizingContextOverlapConstraint]
    || (unint64_t v12 = [v10 count],
        v12 < [*(id *)(a1 + 40) _PSRuleMiningModelRegularizingContextOverlapConstraint]))
  {
    unint64_t v13 = [v8 count];
    if (v13 >= [*(id *)(a1 + 40) _PSRuleMiningModelRegularizingContextOverlapConstraint])
    {
      uint64_t v15 = -1;
      goto LABEL_8;
    }
    unint64_t v14 = [v10 count];
    if (v14 >= [*(id *)(a1 + 40) _PSRuleMiningModelRegularizingContextOverlapConstraint])
    {
      uint64_t v15 = 1;
      goto LABEL_8;
    }
  }
  uint64_t v15 = comparisonResult(v5, v6, *(void **)(a1 + 32));
LABEL_8:

  return v15;
}

@end