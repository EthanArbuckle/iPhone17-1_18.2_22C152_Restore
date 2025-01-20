@interface PSCNAutocompleteFeedbackTracker
@end

@implementation PSCNAutocompleteFeedbackTracker

void __66___PSCNAutocompleteFeedbackTracker_logImpressionsFromAccumulator___block_invoke(uint64_t a1, void *a2)
{
  id v16 = a2;
  id v21 = (id)objc_opt_class();
  v20 = [*(id *)(a1 + 40) vendedSuggestionEvents];
  v19 = [v20 objectAtIndexedSubscript:*(void *)(a1 + 48)];
  v3 = [v19 vendedSuggestions];
  v18 = [*(id *)(a1 + 40) vendedSuggestionEvents];
  v17 = [v18 objectAtIndexedSubscript:*(void *)(a1 + 48)];
  v4 = [v17 bundleIdentifier];
  v5 = [*(id *)(a1 + 40) vendedSuggestionEvents];
  v6 = [v5 objectAtIndexedSubscript:*(void *)(a1 + 48)];
  v7 = [v6 vendedSuggestions];
  v8 = [v7 suggestions];
  v9 = [v8 firstObject];
  v10 = [v9 trialID];
  v11 = [v21 defaultSubmodelImpressionWithFeedback:v3 submodel:v16 bundleID:v4 trialID:v10 isImplicit:*(unsigned __int8 *)(*(void *)(a1 + 32) + 56)];
  id v22 = (id)[v11 mutableCopy];

  v12 = *(void **)(a1 + 32);
  v13 = [*(id *)(a1 + 40) metricsForSubmodelImpressions];
  v14 = [v13 objectAtIndexedSubscript:*(void *)(a1 + 48)];
  v15 = [v14 objectForKeyedSubscript:v16];

  [v12 annotateImpression:v22 withStatistics:v15];
  (*(void (**)(void))(*(void *)(*(void *)(a1 + 32) + 40) + 16))();
}

@end