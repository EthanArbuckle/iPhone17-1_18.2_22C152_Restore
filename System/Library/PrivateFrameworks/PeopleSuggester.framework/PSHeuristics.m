@interface PSHeuristics
@end

@implementation PSHeuristics

uint64_t __59___PSHeuristics_prepareRecencyCacheWithSupportedBundleIds___block_invoke(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 32) evaluateWithObject:a2];
}

void *__58___PSHeuristics_seedSuggestionsForChatGuidsAndTransports___block_invoke(uint64_t a1, void *a2)
{
  id v2 = a2;
  if ([v2 mechanism])
  {
    v3 = [v2 recipients];

    if (v3)
    {
      v4 = objc_msgSend(NSNumber, "numberWithInteger:", objc_msgSend(v2, "mechanism"));
      v3 = (void *)[v4 isEqualToNumber:&unk_1EF6753C0];
    }
  }
  else
  {
    v3 = 0;
  }

  return v3;
}

BOOL __91___PSHeuristics_hyperRecentHeuristicSuggestionProxiesForInteractionStatistics_forStatName___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  v4 = [*(id *)(a1 + 32) valueForFeature:@"timeSinceLastOutgoingInteraction" forConversationId:v3];
  if (v4)
  {
    v5 = [*(id *)(a1 + 32) valueOrDefaultValueForFeature:*(void *)(a1 + 40) forConversationId:v3];
    [v5 doubleValue];
    double v7 = v6;
    [*(id *)(a1 + 48) recencyMargin];
    BOOL v9 = v7 < v8;
  }
  else
  {
    BOOL v9 = 0;
  }

  return v9;
}

BOOL __91___PSHeuristics_hyperRecentHeuristicSuggestionProxiesForInteractionStatistics_forStatName___block_invoke_2(uint64_t a1, uint64_t a2, void *a3)
{
  v5 = *(void **)(a1 + 32);
  uint64_t v6 = *(void *)(a1 + 40);
  id v7 = a3;
  double v8 = [v5 valueOrDefaultValueForFeature:v6 forConversationId:a2];
  [v8 doubleValue];
  double v10 = v9;
  v11 = [*(id *)(a1 + 32) valueOrDefaultValueForFeature:*(void *)(a1 + 40) forConversationId:v7];

  [v11 doubleValue];
  BOOL v13 = v10 > v12;

  return v13;
}

_PSSuggestionProxy *__91___PSHeuristics_hyperRecentHeuristicSuggestionProxiesForInteractionStatistics_forStatName___block_invoke_3(uint64_t a1, void *a2)
{
  id v3 = a2;
  v4 = [_PSSuggestionProxy alloc];
  v5 = [*(id *)(a1 + 32) bundleIdForConversationId:v3];
  uint64_t v6 = (void *)[[NSString alloc] initWithFormat:@"Hyper-recent heuristic (%@) - PS Rewrite", *(void *)(a1 + 40)];
  id v7 = (objc_class *)objc_opt_class();
  double v8 = NSStringFromClass(v7);
  double v9 = [(_PSSuggestionProxy *)v4 initWithBundleID:v5 interactionRecipients:v3 contactID:0 reason:v6 reasonType:v8];

  return v9;
}

double __108___PSHeuristics_heuristicsFromInteractionsStatistics_forStatsNames_threshold_maxNumberOfSuggestions_reason___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  if ([v5 count])
  {
    uint64_t v18 = 0;
    v19 = (double *)&v18;
    uint64_t v20 = 0x2020000000;
    uint64_t v21 = 0;
    id v7 = *(void **)(a1 + 32);
    double v8 = [v5 firstObject];
    double v9 = [v7 valueForFeature:v8 forConversationId:v6];
    [v9 doubleValue];
    uint64_t v11 = v10;

    uint64_t v21 = v11;
    v14[0] = MEMORY[0x1E4F143A8];
    v14[1] = 3221225472;
    v14[2] = __108___PSHeuristics_heuristicsFromInteractionsStatistics_forStatsNames_threshold_maxNumberOfSuggestions_reason___block_invoke_2;
    v14[3] = &unk_1E5AE02A8;
    id v15 = *(id *)(a1 + 32);
    id v16 = v6;
    v17 = &v18;
    [v5 enumerateObjectsUsingBlock:v14];
    double v12 = v19[3];

    _Block_object_dispose(&v18, 8);
  }
  else
  {
    double v12 = 0.0;
  }

  return v12;
}

void __108___PSHeuristics_heuristicsFromInteractionsStatistics_forStatsNames_threshold_maxNumberOfSuggestions_reason___block_invoke_2(uint64_t a1, void *a2)
{
  id v9 = a2;
  id v3 = objc_msgSend(*(id *)(a1 + 32), "valueOrDefaultValueForFeature:forConversationId:");
  [v3 doubleValue];
  double v5 = v4;
  double v6 = *(double *)(*(void *)(*(void *)(a1 + 48) + 8) + 24);

  if (v5 > v6)
  {
    id v7 = [*(id *)(a1 + 32) valueOrDefaultValueForFeature:v9 forConversationId:*(void *)(a1 + 40)];
    [v7 doubleValue];
    *(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) = v8;
  }
}

BOOL __108___PSHeuristics_heuristicsFromInteractionsStatistics_forStatsNames_threshold_maxNumberOfSuggestions_reason___block_invoke_3(uint64_t a1)
{
  return (*(double (**)(void))(*(void *)(a1 + 40) + 16))() > *(double *)(a1 + 48);
}

BOOL __108___PSHeuristics_heuristicsFromInteractionsStatistics_forStatsNames_threshold_maxNumberOfSuggestions_reason___block_invoke_4(uint64_t a1, uint64_t a2, void *a3)
{
  uint64_t v6 = *(void *)(a1 + 32);
  uint64_t v5 = *(void *)(a1 + 40);
  id v7 = *(double (**)(uint64_t, uint64_t, uint64_t))(v5 + 16);
  id v8 = a3;
  double v9 = v7(v5, v6, a2);
  double v10 = (*(double (**)(void))(*(void *)(a1 + 40) + 16))();

  return v9 < v10;
}

_PSSuggestionProxy *__108___PSHeuristics_heuristicsFromInteractionsStatistics_forStatsNames_threshold_maxNumberOfSuggestions_reason___block_invoke_5(uint64_t a1, void *a2)
{
  id v3 = a2;
  double v4 = [_PSSuggestionProxy alloc];
  uint64_t v5 = [*(id *)(a1 + 32) bundleIdForConversationId:v3];
  uint64_t v6 = *(void *)(a1 + 40);
  id v7 = (objc_class *)objc_opt_class();
  id v8 = NSStringFromClass(v7);
  double v9 = [(_PSSuggestionProxy *)v4 initWithBundleID:v5 interactionRecipients:v3 contactID:0 reason:v6 reasonType:v8];

  return v9;
}

BOOL __98___PSHeuristics_hyperRecentHeuristicSuggestionProxiesWithReferenceDate_predictionContextBundleId___block_invoke(uint64_t a1, void *a2)
{
  id v3 = [a2 startDate];
  BOOL v4 = [v3 compare:*(void *)(a1 + 32)] != -1;

  return v4;
}

@end