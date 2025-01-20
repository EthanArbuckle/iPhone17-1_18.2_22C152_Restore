@interface WBSFrequentlyVisitedSitesController
+ (id)newRadarProblemURLForHistoryItem:(id)a3;
- (BOOL)recomputeFrequentlyVisitedSitesIfNecessary;
- (NSArray)frequentlyVisitedSites;
- (NSString)profileIdentifier;
- (WBSFrequentlyVisitedSitesController)initWithHistory:(id)a3 bannedURLStore:(id)a4 profileIdentifier:(id)a5;
- (id)_canonicalizedFavoritesURLStringSet;
- (id)_frequentlyVisitedSitesURLStringSet;
- (id)_historyItemForFrequentlyVisitedItem:(id)a3;
- (void)_postFrequentlyVisitedSitesDidChangeNotification;
- (void)_recomputeFrequentlyVisitedSitesNow;
- (void)_saveFrequentlyVisitedSites:(id)a3 completionHandler:(id)a4;
- (void)clearFrequentlyVisitedSites;
- (void)sendAnalyticsIfNecessaryForURLNavigation:(id)a3;
@end

@implementation WBSFrequentlyVisitedSitesController

- (NSString)profileIdentifier
{
  return self->_profileIdentifier;
}

- (void)_postFrequentlyVisitedSitesDidChangeNotification
{
  id v3 = [MEMORY[0x1E4F28EB8] defaultCenter];
  [v3 postNotificationName:@"FrequentlyVisitedSitesDidChange" object:self];
}

- (WBSFrequentlyVisitedSitesController)initWithHistory:(id)a3 bannedURLStore:(id)a4 profileIdentifier:(id)a5
{
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  v16.receiver = self;
  v16.super_class = (Class)WBSFrequentlyVisitedSitesController;
  v12 = [(WBSFrequentlyVisitedSitesController *)&v16 init];
  v13 = v12;
  if (v12)
  {
    objc_storeStrong((id *)&v12->_history, a3);
    objc_storeStrong((id *)&v13->_bannedURLStore, a4);
    objc_storeStrong((id *)&v13->_profileIdentifier, a5);
    v14 = v13;
  }

  return v13;
}

- (NSArray)frequentlyVisitedSites
{
  return 0;
}

- (BOOL)recomputeFrequentlyVisitedSitesIfNecessary
{
  [MEMORY[0x1E4F1C9C8] timeIntervalSinceReferenceDate];
  double v4 = v3 - self->_timeOfLastFrequentlyVisitedSitesComputation;
  if (v4 >= 300.0) {
    [(WBSFrequentlyVisitedSitesController *)self _recomputeFrequentlyVisitedSitesNow];
  }
  return v4 >= 300.0;
}

- (void)clearFrequentlyVisitedSites
{
  self->_timeOfLastFrequentlyVisitedSitesComputation = 0.0;
}

- (void)sendAnalyticsIfNecessaryForURLNavigation:(id)a3
{
  id v16 = a3;
  double v4 = [(WBSFrequentlyVisitedSitesController *)self frequentlyVisitedSites];
  for (unint64_t i = 0; i < [v4 count]; ++i)
  {
    v6 = [v4 objectAtIndexedSubscript:i];
    v7 = [v6 address];
    v8 = [v16 absoluteString];
    int v9 = [v7 isEqual:v8];

    if (v9)
    {
      id v10 = objc_alloc(MEMORY[0x1E4F98328]);
      id v11 = [(WBSFrequentlyVisitedSitesController *)self _historyItemForFrequentlyVisitedItem:v6];
      v12 = [v11 lastVisitedDate];
      v13 = [v6 frequentlyVisitedSiteScore];
      v14 = (void *)[v10 initWithItemPosition:i lastVisitedDate:v12 score:v13];

      v15 = [MEMORY[0x1E4F98290] sharedLogger];
      [v15 didNavigateToFrequentlyVisitedSiteByAnyMeansWithAnalyticsPayload:v14];

      break;
    }
  }
}

- (id)_historyItemForFrequentlyVisitedItem:(id)a3
{
  history = self->_history;
  double v4 = (void *)MEMORY[0x1E4F1CB10];
  v5 = [a3 address];
  v6 = [v4 URLWithString:v5];
  v7 = [(WBSHistory *)history itemForURL:v6];

  return v7;
}

+ (id)newRadarProblemURLForHistoryItem:(id)a3
{
  id v3 = a3;
  if (([MEMORY[0x1E4F98318] isInternalInstall] & 1) == 0) {
    +[WBSFrequentlyVisitedSitesController newRadarProblemURLForHistoryItem:]();
  }
  double v4 = [NSString stringWithFormat:@"Frequently Visited Sites: <add description>"];
  v5 = [MEMORY[0x1E4F98340] safariStartPageIOS];
  uint64_t v31 = 0;
  v32 = &v31;
  uint64_t v33 = 0x3032000000;
  v34 = __Block_byref_object_copy__0;
  v35 = __Block_byref_object_dispose__0;
  id v36 = 0;
  uint64_t v25 = 0;
  v26 = &v25;
  uint64_t v27 = 0x3032000000;
  v28 = __Block_byref_object_copy__0;
  v29 = __Block_byref_object_dispose__0;
  id v30 = 0;
  v6 = *MEMORY[0x1E4F98618];
  uint64_t block = MEMORY[0x1E4F143A8];
  uint64_t v18 = 3221225472;
  v19 = __72__WBSFrequentlyVisitedSitesController_newRadarProblemURLForHistoryItem___block_invoke_58;
  v20 = &unk_1E5E40878;
  id v22 = &__block_literal_global_0;
  v23 = &v31;
  id v7 = v3;
  id v21 = v7;
  v24 = &v25;
  dispatch_sync(v6, &block);
  v8 = [MEMORY[0x1E4F28E78] stringWithString:@"* SUMMARY\nProvide a detailed explanation of the issue, with steps to reproduce if possible.\n\n"];
  [v8 appendString:@"* DIAGNOSTIC INFORMATION\n"];
  [v8 appendFormat:@"Daily visit count scores: %@\n", v32[5]];
  [v8 appendFormat:@"Weekly visit count scores: %@\n", v26[5]];
  int v9 = [v7 lastVisitedDate];
  [v7 lastVisitedTimeInterval];
  [v8 appendFormat:@"Last visited: %@ (time interval: %f)\n", v9, v10, block, v18, v19, v20];

  [MEMORY[0x1E4F1C9C8] timeIntervalSinceReferenceDate];
  objc_msgSend(v8, "appendFormat:", @"Score time interval: %f\n", v11);
  v12 = [MEMORY[0x1E4F28F80] processInfo];
  v13 = [v12 operatingSystemVersionString];
  [v8 appendFormat:@"Operating system: %@", v13];

  v14 = (void *)[objc_alloc(MEMORY[0x1E4F98338]) initWithComponent:v5 title:v4 descriptionTemplate:v8];
  v15 = [v14 continueInTapToRadarURL];

  _Block_object_dispose(&v25, 8);
  _Block_object_dispose(&v31, 8);

  return v15;
}

id __72__WBSFrequentlyVisitedSitesController_newRadarProblemURLForHistoryItem___block_invoke(uint64_t a1, unsigned int *a2, uint64_t a3)
{
  for (unint64_t i = [MEMORY[0x1E4F28E78] string];
  {
    unsigned int v6 = *a2++;
    objc_msgSend(i, "appendFormat:", @"%d", v6);
    if (a3 != 1) {
      [i appendString:@" "];
    }
  }
  return i;
}

void __72__WBSFrequentlyVisitedSitesController_newRadarProblemURLForHistoryItem___block_invoke_58(uint64_t a1)
{
  uint64_t v2 = (*(void (**)(void, uint64_t, uint64_t))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40), [*(id *)(a1 + 32) dailyVisitCountScoresPtrOnSynchronizationQueue], objc_msgSend(*(id *)(a1 + 32), "dailyVisitCountScoresCountOnSynchronizationQueue"));
  uint64_t v3 = *(void *)(*(void *)(a1 + 48) + 8);
  double v4 = *(void **)(v3 + 40);
  *(void *)(v3 + 40) = v2;

  uint64_t v5 = (*(void (**)(void, uint64_t, uint64_t))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40), [*(id *)(a1 + 32) weeklyVisitCountScoresPtrOnSynchronizationQueue], objc_msgSend(*(id *)(a1 + 32), "weeklyVisitCountScoresCountOnSynchronizationQueue"));
  uint64_t v6 = *(void *)(*(void *)(a1 + 56) + 8);
  id v7 = *(void **)(v6 + 40);
  *(void *)(v6 + 40) = v5;
}

- (void)_recomputeFrequentlyVisitedSitesNow
{
  uint64_t v3 = [(WBSFrequentlyVisitedSitesController *)self _canonicalizedFavoritesURLStringSet];
  double v4 = [(WBSFrequentlyVisitedSitesBannedURLStore *)self->_bannedURLStore urlStrings];
  uint64_t v5 = [v3 setByAddingObjectsFromSet:v4];

  uint64_t v6 = [(WBSFrequentlyVisitedSitesController *)self _frequentlyVisitedSitesURLStringSet];
  history = self->_history;
  [MEMORY[0x1E4F1C9C8] timeIntervalSinceReferenceDate];
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __74__WBSFrequentlyVisitedSitesController__recomputeFrequentlyVisitedSitesNow__block_invoke;
  v8[3] = &unk_1E5E40910;
  v8[4] = self;
  -[WBSHistory computeFrequentlyVisitedSites:minimalVisitCountScore:blockList:allowList:options:currentTime:completionHandler:](history, "computeFrequentlyVisitedSites:minimalVisitCountScore:blockList:allowList:options:currentTime:completionHandler:", 12, 0, v5, v6, 2, v8);
}

void __74__WBSFrequentlyVisitedSitesController__recomputeFrequentlyVisitedSitesNow__block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  if (!v6)
  {
    id v7 = objc_msgSend(v5, "safari_mapObjectsUsingBlock:", &__block_literal_global_85);
    v8 = *(void **)(a1 + 32);
    v9[0] = MEMORY[0x1E4F143A8];
    v9[1] = 3221225472;
    v9[2] = __74__WBSFrequentlyVisitedSitesController__recomputeFrequentlyVisitedSitesNow__block_invoke_3;
    v9[3] = &unk_1E5E408E8;
    v9[4] = v8;
    [v8 _saveFrequentlyVisitedSites:v7 completionHandler:v9];
  }
}

id __74__WBSFrequentlyVisitedSitesController__recomputeFrequentlyVisitedSitesNow__block_invoke_2(uint64_t a1, void *a2)
{
  id v2 = a2;
  id v3 = objc_alloc(MEMORY[0x1E4F98320]);
  double v4 = [v2 url];
  id v5 = [v2 title];
  [v2 topSitesScore];
  id v6 = objc_msgSend(v3, "initWithURLString:title:score:", v4, v5);

  return v6;
}

void __74__WBSFrequentlyVisitedSitesController__recomputeFrequentlyVisitedSitesNow__block_invoke_3(uint64_t a1, int a2)
{
  if (a2)
  {
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __74__WBSFrequentlyVisitedSitesController__recomputeFrequentlyVisitedSitesNow__block_invoke_4;
    block[3] = &unk_1E5E408C0;
    block[4] = *(void *)(a1 + 32);
    dispatch_async(MEMORY[0x1E4F14428], block);
  }
}

uint64_t __74__WBSFrequentlyVisitedSitesController__recomputeFrequentlyVisitedSitesNow__block_invoke_4(uint64_t a1)
{
  [MEMORY[0x1E4F1C9C8] timeIntervalSinceReferenceDate];
  *(void *)(*(void *)(a1 + 32) + 32) = v2;
  id v3 = *(void **)(a1 + 32);
  return [v3 _postFrequentlyVisitedSitesDidChangeNotification];
}

- (id)_canonicalizedFavoritesURLStringSet
{
  return 0;
}

- (id)_frequentlyVisitedSitesURLStringSet
{
  return 0;
}

- (void)_saveFrequentlyVisitedSites:(id)a3 completionHandler:(id)a4
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_history, 0);
  objc_storeStrong((id *)&self->_profileIdentifier, 0);
  objc_storeStrong((id *)&self->_bannedURLStore, 0);
}

+ (void)newRadarProblemURLForHistoryItem:.cold.1()
{
}

@end