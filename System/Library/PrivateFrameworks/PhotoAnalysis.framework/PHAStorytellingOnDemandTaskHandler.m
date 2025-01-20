@interface PHAStorytellingOnDemandTaskHandler
- (BOOL)hasRemainingOperations;
- (BOOL)isQuiescent;
- (BOOL)validateOperation:(id)a3 forConnection:(id)a4;
- (MARootProgressReporter)onDemandTaskProgressReporter;
- (PHAJobTimeHandlerProtocol)jobTimeHandler;
- (PHAStorytellingOnDemandTaskHandler)initWithGraphManager:(id)a3 jobTimeHandler:(id)a4;
- (PHAStorytellingOnDemandTaskHandlerDelegate)delegate;
- (id)nextOperation;
- (void)_runCachingCPAnalyticsTestWithOptions:(id)a3 reply:(id)a4;
- (void)_runEnrichmentTestWithOptions:(id)a3 reply:(id)a4;
- (void)cacheCPAnalyticsPropertiesWithContext:(id)a3 reply:(id)a4;
- (void)cancelCurrentOperation;
- (void)dequeueOperationsIfNeeded;
- (void)forceCancellationIfShutdown;
- (void)generateMemoriesWithOptions:(id)a3 context:(id)a4 reply:(id)a5;
- (void)generateSuggestionsWithOptions:(id)a3 context:(id)a4 reply:(id)a5;
- (void)handleOperation:(id)a3;
- (void)reportMetricsWithOptions:(id)a3 context:(id)a4 reply:(id)a5;
- (void)requestAssetRevGeocodingForAssetLocalIdentifiers:(id)a3 context:(id)a4 reply:(id)a5;
- (void)requestAssetRevGeocodingWithContext:(id)a3 reply:(id)a4;
- (void)requestEnrichmentWithOptions:(id)a3 context:(id)a4 reply:(id)a5;
- (void)requestExternalAssetRelevanceProcessingWithContext:(id)a3 reply:(id)a4;
- (void)requestGenerateQuestionsWithOptions:(id)a3 context:(id)a4 reply:(id)a5;
- (void)requestHighlightCollectionEnrichmentWithOptions:(id)a3 context:(id)a4 reply:(id)a5;
- (void)requestHighlightEnrichmentWithOptions:(id)a3 context:(id)a4 reply:(id)a5;
- (void)requestOnDemandTasksWithOptions:(id)a3 context:(id)a4 reply:(id)a5;
- (void)requestRelationshipInferencesForPersonLocalIdentifiers:(id)a3 context:(id)a4 reply:(id)a5;
- (void)requestRevGeocodingSyndicationLibraryWithContext:(id)a3 reply:(id)a4;
- (void)requestSuggestedContributionsForAssetsMetadata:(id)a3 options:(id)a4 context:(id)a5 reply:(id)a6;
- (void)requestSuggestedPersonsWithOptions:(id)a3 context:(id)a4 reply:(id)a5;
- (void)requestSuggestedRecipientsForAssetLocalIdentifiers:(id)a3 momentLocalIdentifiers:(id)a4 options:(id)a5 context:(id)a6 reply:(id)a7;
- (void)requestSyndicationProcessingWithOptions:(id)a3 context:(id)a4 reply:(id)a5;
- (void)runPerformanceTest:(id)a3 options:(id)a4 context:(id)a5 reply:(id)a6;
- (void)setDelegate:(id)a3;
- (void)shutdown;
@end

@implementation PHAStorytellingOnDemandTaskHandler

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_delegate);
  objc_destroyWeak((id *)&self->_jobTimeHandler);
  objc_storeStrong((id *)&self->_loggingConnection, 0);
  objc_storeStrong((id *)&self->_progressCallChecker, 0);
  objc_storeStrong((id *)&self->_onDemandTaskProgressReporter, 0);
  objc_storeStrong((id *)&self->_operationsToRun, 0);
  objc_storeStrong((id *)&self->_executionQueue, 0);
  objc_storeStrong((id *)&self->_photoLibrary, 0);

  objc_storeStrong((id *)&self->_graphManager, 0);
}

- (void)setDelegate:(id)a3
{
}

- (PHAStorytellingOnDemandTaskHandlerDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  return (PHAStorytellingOnDemandTaskHandlerDelegate *)WeakRetained;
}

- (PHAJobTimeHandlerProtocol)jobTimeHandler
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_jobTimeHandler);

  return (PHAJobTimeHandlerProtocol *)WeakRetained;
}

- (MARootProgressReporter)onDemandTaskProgressReporter
{
  return self->_onDemandTaskProgressReporter;
}

- (void)requestSuggestedPersonsWithOptions:(id)a3 context:(id)a4 reply:(id)a5
{
  id v7 = a3;
  v8 = (void (**)(id, void *, id))a5;
  graphManager = self->_graphManager;
  id v17 = 0;
  char v10 = [(PGManager *)graphManager isReadyWithError:&v17];
  id v11 = v17;
  if (v10)
  {
    v12 = [v7 objectForKey:@"PHPeopleSuggestionClientKey"];
    v13 = v12;
    if (v12)
    {
      switch([v12 unsignedIntegerValue])
      {
        case 0:
        case 2:
        case 3:
          goto LABEL_4;
        case 1:
          uint64_t v16 = [(PGManager *)self->_graphManager suggestedPersonsForHome];
          goto LABEL_10;
        case 4:
          uint64_t v16 = [(PGManager *)self->_graphManager suggestedPersonsForSharedLibraryParticipants];
          goto LABEL_10;
        case 5:
          uint64_t v16 = [(PGManager *)self->_graphManager suggestedPersonsForSharedLibraryContentInclusion];
LABEL_10:
          v15 = (void *)v16;
          break;
        default:
          v15 = 0;
          break;
      }
    }
    else
    {
LABEL_4:
      uint64_t v14 = objc_msgSend(MEMORY[0x1E4F28C58], "pl_analysisErrorWithCode:localizedDescription:", 17, @"-[PHAOnDiskGraphServiceWorker requestSuggestedPersonsWithOptions:context:reply:] does not support the passed in client");

      v15 = 0;
      id v11 = (id)v14;
    }
    v8[2](v8, v15, v11);
  }
  else
  {
    v8[2](v8, 0, v11);
  }
}

- (void)requestRelationshipInferencesForPersonLocalIdentifiers:(id)a3 context:(id)a4 reply:(id)a5
{
  id v7 = a3;
  v8 = (void (**)(id, void *, void))a5;
  graphManager = self->_graphManager;
  id v13 = 0;
  char v10 = [(PGManager *)graphManager isReadyWithError:&v13];
  id v11 = v13;
  if (v10)
  {
    v12 = [(PGManager *)self->_graphManager relationshipInferencesForPersonLocalIdentifiers:v7];
    v8[2](v8, v12, 0);
  }
  else
  {
    ((void (**)(id, void *, id))v8)[2](v8, 0, v11);
  }
}

- (void)requestSuggestedRecipientsForAssetLocalIdentifiers:(id)a3 momentLocalIdentifiers:(id)a4 options:(id)a5 context:(id)a6 reply:(id)a7
{
  uint64_t v42 = *MEMORY[0x1E4F143B8];
  id v11 = a3;
  id v12 = a4;
  id v13 = a5;
  uint64_t v14 = (void (**)(id, void *, void))a7;
  graphManager = self->_graphManager;
  id v40 = 0;
  LOBYTE(a7) = [(PGManager *)graphManager isReadyWithError:&v40];
  id v16 = v40;
  if (a7)
  {
    id v17 = [v13 objectForKey:@"PHPeopleSuggestionClientKey"];
    v18 = v17;
    if (v17) {
      uint64_t v19 = [v17 unsignedIntegerValue];
    }
    else {
      uint64_t v19 = 0;
    }
    v20 = [MEMORY[0x1E4F8D908] optionsForClient:v19];
    v21 = [v13 objectForKey:@"PHSuggestedRecipientsSharingStreamKey"];
    v22 = v21;
    if (v21) {
      objc_msgSend(v20, "setSharingStream:", objc_msgSend(v21, "unsignedIntegerValue"));
    }
    v23 = [(PGManager *)self->_graphManager suggestedRecipientsForAssetLocalIdentifiers:v11 momentLocalIdentifiers:v12 sharingOptions:v20];
    if ([v23 count])
    {
      v31 = v22;
      v32 = v20;
      v33 = v18;
      id v34 = v12;
      id v35 = v11;
      v24 = objc_msgSend(MEMORY[0x1E4F1CA48], "arrayWithCapacity:", objc_msgSend(v23, "count"));
      long long v36 = 0u;
      long long v37 = 0u;
      long long v38 = 0u;
      long long v39 = 0u;
      id v25 = v23;
      uint64_t v26 = [v25 countByEnumeratingWithState:&v36 objects:v41 count:16];
      if (v26)
      {
        uint64_t v27 = v26;
        uint64_t v28 = *(void *)v37;
        do
        {
          for (uint64_t i = 0; i != v27; ++i)
          {
            if (*(void *)v37 != v28) {
              objc_enumerationMutation(v25);
            }
            v30 = [*(id *)(*((void *)&v36 + 1) + 8 * i) dictionaryRepresentation];
            [v24 addObject:v30];
          }
          uint64_t v27 = [v25 countByEnumeratingWithState:&v36 objects:v41 count:16];
        }
        while (v27);
      }

      v14[2](v14, v24, 0);
      id v12 = v34;
      id v11 = v35;
      v20 = v32;
      v18 = v33;
      v22 = v31;
    }
    else
    {
      v14[2](v14, (void *)MEMORY[0x1E4F1CBF0], 0);
    }
  }
  else
  {
    ((void (**)(id, void *, id))v14)[2](v14, 0, v16);
  }
}

- (void)requestSuggestedContributionsForAssetsMetadata:(id)a3 options:(id)a4 context:(id)a5 reply:(id)a6
{
  id v8 = a3;
  v9 = (void (**)(id, void *, void))a6;
  graphManager = self->_graphManager;
  id v14 = 0;
  char v11 = [(PGManager *)graphManager isReadyWithError:&v14];
  id v12 = v14;
  if (v11)
  {
    id v13 = [(PGManager *)self->_graphManager suggestedContributionsForAssetsMetadata:v8];
    v9[2](v9, v13, 0);
  }
  else
  {
    ((void (**)(id, void *, id))v9)[2](v9, 0, v12);
  }
}

- (void)_runEnrichmentTestWithOptions:(id)a3 reply:(id)a4
{
  v32[6] = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = (void (**)(id, void, id))a4;
  id v8 = objc_alloc_init(PHAPeopleSuggestionEnrichmentTask);
  v32[0] = v8;
  v9 = objc_alloc_init(PHAHighlightCollectionEnrichmentTask);
  v32[1] = v9;
  char v10 = objc_alloc_init(PHASearchEnrichmentTask);
  v32[2] = v10;
  char v11 = objc_alloc_init(PHAAssetRevGeocodeEnrichmentTask);
  v32[3] = v11;
  id v12 = objc_alloc_init(PHAUserBehaviorEnrichmentTask);
  v32[4] = v12;
  id v13 = objc_alloc_init(PHAPortraitDonationEnrichmentTask);
  v32[5] = v13;
  id v14 = [MEMORY[0x1E4F1C978] arrayWithObjects:v32 count:6];

  long long v29 = 0u;
  long long v30 = 0u;
  long long v27 = 0u;
  long long v28 = 0u;
  id v15 = v14;
  uint64_t v16 = [v15 countByEnumeratingWithState:&v27 objects:v31 count:16];
  if (v16)
  {
    uint64_t v17 = v16;
    v18 = 0;
    uint64_t v19 = *(void *)v28;
    while (2)
    {
      for (uint64_t i = 0; i != v17; ++i)
      {
        if (*(void *)v28 != v19) {
          objc_enumerationMutation(v15);
        }
        v21 = *(void **)(*((void *)&v27 + 1) + 8 * i);
        if ([v21 currentPlatformIsSupported]
          && [v21 shouldRunWithGraphManager:self->_graphManager])
        {
          v22 = [v21 name];
          [(PGProgressCallChecker *)self->_progressCallChecker setTaskName:v22];

          graphManager = self->_graphManager;
          onDemandTaskProgressReporter = self->_onDemandTaskProgressReporter;
          id v26 = v18;
          LODWORD(v22) = [v21 runWithGraphManager:graphManager progressReporter:onDemandTaskProgressReporter error:&v26];
          id v25 = v26;

          if (!v22)
          {
            v7[2](v7, 0, v25);

            goto LABEL_16;
          }
          v18 = v25;
        }
      }
      uint64_t v17 = [v15 countByEnumeratingWithState:&v27 objects:v31 count:16];
      if (v17) {
        continue;
      }
      break;
    }
  }
  else
  {
    v18 = 0;
  }

  v7[2](v7, 1, 0);
  id v25 = v18;
LABEL_16:
}

- (void)_runCachingCPAnalyticsTestWithOptions:(id)a3 reply:(id)a4
{
  v5 = (void (**)(id, uint64_t, id))a4;
  id v6 = objc_alloc_init(PHACachingCPAnalyticsPropertiesTask);
  id v7 = [(PHACachingCPAnalyticsPropertiesTask *)v6 name];
  [(PGProgressCallChecker *)self->_progressCallChecker setTaskName:v7];

  graphManager = self->_graphManager;
  onDemandTaskProgressReporter = self->_onDemandTaskProgressReporter;
  id v12 = 0;
  uint64_t v10 = [(PHACachingCPAnalyticsPropertiesTask *)v6 runWithGraphManager:graphManager progressReporter:onDemandTaskProgressReporter error:&v12];
  id v11 = v12;
  v5[2](v5, v10, v11);
}

- (void)runPerformanceTest:(id)a3 options:(id)a4 context:(id)a5 reply:(id)a6
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  id v9 = a3;
  id v10 = a4;
  id v11 = (void (**)(id, void, void *))a6;
  if ((PFOSVariantHasInternalDiagnostics() & 1) == 0)
  {
    loggingConnection = self->_loggingConnection;
    if (os_log_type_enabled(loggingConnection, OS_LOG_TYPE_ERROR))
    {
      LOWORD(v17) = 0;
      _os_log_error_impl(&dword_1D21F2000, loggingConnection, OS_LOG_TYPE_ERROR, "Performance test is only available on Apple internal.", (uint8_t *)&v17, 2u);
    }
    id v13 = objc_msgSend(MEMORY[0x1E4F28C58], "pl_analysisErrorWithCode:", 3);
    v11[2](v11, 0, v13);
  }
  id v14 = self->_loggingConnection;
  if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
  {
    int v17 = 138412290;
    id v18 = v9;
    _os_log_impl(&dword_1D21F2000, v14, OS_LOG_TYPE_DEFAULT, "Running Performance Test: %@", (uint8_t *)&v17, 0xCu);
  }
  if ([v9 isEqualToString:@"CachingCPAnalytics"])
  {
    [(PHAStorytellingOnDemandTaskHandler *)self _runCachingCPAnalyticsTestWithOptions:v10 reply:v11];
  }
  else if ([v9 isEqualToString:@"Enrichment"])
  {
    [(PHAStorytellingOnDemandTaskHandler *)self _runEnrichmentTestWithOptions:v10 reply:v11];
  }
  else
  {
    id v15 = self->_loggingConnection;
    if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
    {
      int v17 = 138412290;
      id v18 = v9;
    }
    uint64_t v16 = objc_msgSend(MEMORY[0x1E4F28C58], "pl_analysisErrorWithCode:", 3);
    v11[2](v11, 0, v16);
  }
}

- (void)requestRevGeocodingSyndicationLibraryWithContext:(id)a3 reply:(id)a4
{
  v5 = (void (**)(id, uint64_t, id))a4;
  graphManager = self->_graphManager;
  id v19 = 0;
  char v7 = [(PGManager *)graphManager isReadyWithError:&v19];
  id v8 = v19;
  if (v7)
  {
    id v9 = objc_alloc_init(PHARevGeocodeSyndicationTask);
    id v10 = [(PHARevGeocodeSyndicationTask *)v9 name];
    [(PGProgressCallChecker *)self->_progressCallChecker setTaskName:v10];

    id v11 = self->_graphManager;
    onDemandTaskProgressReporter = self->_onDemandTaskProgressReporter;
    id v18 = v8;
    uint64_t v13 = [(PHARevGeocodeSyndicationTask *)v9 runWithGraphManager:v11 progressReporter:onDemandTaskProgressReporter error:&v18];
    id v14 = v18;

    if (v13)
    {
      id WeakRetained = objc_loadWeakRetained((id *)&self->_jobTimeHandler);
      uint64_t v16 = [MEMORY[0x1E4F1C9C8] date];
      int v17 = [(PHARevGeocodeSyndicationTask *)v9 name];
      [WeakRetained setLibraryScopedWorkerPreferencesValue:v16 forKey:v17];
    }
    v5[2](v5, v13, v14);
  }
  else
  {
    v5[2](v5, 0, v8);
    id v14 = v8;
  }
}

- (void)requestAssetRevGeocodingForAssetLocalIdentifiers:(id)a3 context:(id)a4 reply:(id)a5
{
  char v7 = (void *)MEMORY[0x1E4F8D8D8];
  graphManager = self->_graphManager;
  id v9 = (void (**)(id, void))a5;
  id v10 = a3;
  id v11 = [(PGManager *)graphManager workingContext];
  id v12 = [v11 photoLibrary];
  id v19 = [v7 reverseGeoFetchOptionsForPhotoLibrary:v12];

  uint64_t v13 = [MEMORY[0x1E4F38EB8] fetchAssetsWithLocalIdentifiers:v10 options:v19];

  id v14 = objc_alloc(MEMORY[0x1E4F8D8D8]);
  id v15 = [(PGManager *)self->_graphManager photoLibrary];
  loggingConnection = self->_loggingConnection;
  int v17 = [(PGManager *)self->_graphManager locationCache];
  id v18 = (void *)[v14 initWithPhotoLibrary:v15 homeLocations:MEMORY[0x1E4F1CBF0] loggingConnection:loggingConnection locationCache:v17];

  [v18 revGeocodeAssets:v13 progressBlock:&__block_literal_global_419];
  v9[2](v9, 0);
}

- (void)requestAssetRevGeocodingWithContext:(id)a3 reply:(id)a4
{
  v5 = (void (**)(id, id))a4;
  id v6 = objc_alloc_init(PHAAssetRevGeocodeEnrichmentTask);
  char v7 = [(PHAEnrichmentTask *)v6 name];
  [(PGProgressCallChecker *)self->_progressCallChecker setTaskName:v7];

  graphManager = self->_graphManager;
  onDemandTaskProgressReporter = self->_onDemandTaskProgressReporter;
  id v15 = 0;
  BOOL v10 = [(PHAEnrichmentTask *)v6 runWithGraphManager:graphManager progressReporter:onDemandTaskProgressReporter error:&v15];
  id v11 = v15;
  if (v10)
  {
    id WeakRetained = objc_loadWeakRetained((id *)&self->_jobTimeHandler);
    uint64_t v13 = [MEMORY[0x1E4F1C9C8] date];
    id v14 = [(PHAEnrichmentTask *)v6 name];
    [WeakRetained setLibraryScopedWorkerPreferencesValue:v13 forKey:v14];
  }
  v5[2](v5, v11);
}

- (void)requestHighlightCollectionEnrichmentWithOptions:(id)a3 context:(id)a4 reply:(id)a5
{
  char v7 = (void (**)(id, id))a5;
  id v8 = a3;
  id v9 = [[PHAHighlightCollectionEnrichmentTask alloc] initWithOptions:v8];

  BOOL v10 = [(PHAEnrichmentTask *)v9 name];
  [(PGProgressCallChecker *)self->_progressCallChecker setTaskName:v10];

  graphManager = self->_graphManager;
  onDemandTaskProgressReporter = self->_onDemandTaskProgressReporter;
  id v17 = 0;
  LODWORD(v8) = [(PHAEnrichmentTask *)v9 runWithGraphManager:graphManager progressReporter:onDemandTaskProgressReporter error:&v17];
  id v13 = v17;
  if (v8)
  {
    id WeakRetained = objc_loadWeakRetained((id *)&self->_jobTimeHandler);
    id v15 = [MEMORY[0x1E4F1C9C8] date];
    uint64_t v16 = [(PHAEnrichmentTask *)v9 name];
    [WeakRetained setLibraryScopedWorkerPreferencesValue:v15 forKey:v16];
  }
  v7[2](v7, v13);
}

- (void)requestHighlightEnrichmentWithOptions:(id)a3 context:(id)a4 reply:(id)a5
{
  uint64_t v41 = *MEMORY[0x1E4F143B8];
  id v7 = a3;
  id v8 = (void (**)(id, void *))a5;
  id v9 = objc_alloc_init(MEMORY[0x1E4F1CA80]);
  long long v35 = 0u;
  long long v36 = 0u;
  long long v37 = 0u;
  long long v38 = 0u;
  id v10 = v7;
  uint64_t v11 = [v10 countByEnumeratingWithState:&v35 objects:v40 count:16];
  if (!v11)
  {

    uint64_t v19 = 255;
    goto LABEL_35;
  }
  uint64_t v12 = v11;
  v31 = self;
  char v13 = 0;
  uint64_t v14 = 0;
  uint64_t v15 = *(void *)v36;
  do
  {
    uint64_t v16 = 0;
    do
    {
      if (*(void *)v36 != v15) {
        objc_enumerationMutation(v10);
      }
      id v17 = *(void **)(*((void *)&v35 + 1) + 8 * v16);
      if (objc_msgSend(v17, "isEqualToString:", @"force", v31))
      {
        v14 |= 0x40000000uLL;
        goto LABEL_25;
      }
      if ([v17 isEqualToString:@"ignoreRequirements"])
      {
        v14 |= 0xFFFFFFFF80000000;
        goto LABEL_25;
      }
      if ([v17 isEqualToString:@"curation"])
      {
        v14 |= 0x10uLL;
LABEL_24:
        char v13 = 1;
        goto LABEL_25;
      }
      if ([v17 isEqualToString:@"keyAsset"])
      {
        v14 |= 8uLL;
        goto LABEL_24;
      }
      if ([v17 isEqualToString:@"title"])
      {
        v14 |= 6uLL;
        goto LABEL_24;
      }
      if ([v17 isEqualToString:@"promotionScore"])
      {
        v14 |= 1uLL;
        goto LABEL_24;
      }
      if ([v17 isEqualToString:@"momentTitles"])
      {
        v14 |= 0x20uLL;
        goto LABEL_24;
      }
      if ([v17 isEqualToString:@"visibilityScore"])
      {
        v14 |= 0x40uLL;
        goto LABEL_24;
      }
      if ([v17 isEqualToString:@"momentLocations"])
      {
        v14 |= 0x80uLL;
        goto LABEL_24;
      }
      v32 = (void *)[objc_alloc(MEMORY[0x1E4F29128]) initWithUUIDString:v17];

      if (!v32)
      {
        long long v30 = objc_msgSend(MEMORY[0x1E4F28C58], "pl_analysisErrorForInvalidParameterValue:named:", v17, @"option");
        v8[2](v8, v30);

        id v23 = v10;
        goto LABEL_41;
      }
      [v9 addObject:v17];
LABEL_25:
      ++v16;
    }
    while (v12 != v16);
    uint64_t v18 = [v10 countByEnumeratingWithState:&v35 objects:v40 count:16];
    uint64_t v12 = v18;
  }
  while (v18);

  if (v13) {
    uint64_t v19 = v14;
  }
  else {
    uint64_t v19 = v14 | 0xFF;
  }
  self = v31;
LABEL_35:
  if ([v9 count])
  {
    v20 = (void *)[objc_alloc(MEMORY[0x1E4F8D6C8]) initWithHighlightTailorOptions:v19];
    long long v39 = v20;
    v21 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v39 count:1];

    id WeakRetained = (id)[objc_alloc(MEMORY[0x1E4F8D658]) initWithManager:self->_graphManager enrichmentProcessors:v21];
    id v34 = 0;
    [WeakRetained enrichDataModelForHighlightUUIDs:v9 withError:&v34 progressBlock:&__block_literal_global_2897];
    id v23 = v34;
    goto LABEL_39;
  }
  v21 = objc_alloc_init(PHAHighlightEnrichmentTask);
  [(PHAHighlightEnrichmentTask *)v21 setTailorOptions:v19];
  v24 = [(PHAEnrichmentTask *)v21 name];
  [(PGProgressCallChecker *)self->_progressCallChecker setTaskName:v24];

  graphManager = self->_graphManager;
  onDemandTaskProgressReporter = self->_onDemandTaskProgressReporter;
  id v33 = 0;
  BOOL v27 = [(PHAHighlightEnrichmentTask *)v21 runWithGraphManager:graphManager progressReporter:onDemandTaskProgressReporter error:&v33];
  id v23 = v33;
  if (v27)
  {
    id WeakRetained = objc_loadWeakRetained((id *)&self->_jobTimeHandler);
    long long v28 = [MEMORY[0x1E4F1C9C8] date];
    long long v29 = [(PHAEnrichmentTask *)v21 name];
    [WeakRetained setLibraryScopedWorkerPreferencesValue:v28 forKey:v29];

LABEL_39:
  }

  v8[2](v8, v23);
LABEL_41:
}

- (void)requestEnrichmentWithOptions:(id)a3 context:(id)a4 reply:(id)a5
{
  v63[8] = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v47 = a4;
  v49 = (void (**)(id, void *))a5;
  id v9 = objc_alloc_init(PHAPeopleSuggestionEnrichmentTask);
  v63[0] = v9;
  id v10 = objc_alloc_init(PHAForcedHighlightEnrichmentTask);
  v63[1] = v10;
  uint64_t v11 = objc_alloc_init(PHAHighlightCollectionEnrichmentTask);
  v63[2] = v11;
  uint64_t v12 = objc_alloc_init(PHASearchEnrichmentTask);
  v63[3] = v12;
  char v13 = objc_alloc_init(PHAAssetRevGeocodeEnrichmentTask);
  v63[4] = v13;
  uint64_t v14 = objc_alloc_init(PHAUserBehaviorEnrichmentTask);
  v63[5] = v14;
  uint64_t v15 = objc_alloc_init(PHAPortraitDonationEnrichmentTask);
  v63[6] = v15;
  uint64_t v16 = [[PHAMemoriesEnrichmentTask alloc] initWithOptions:v8];
  v63[7] = v16;
  location = [MEMORY[0x1E4F1C978] arrayWithObjects:v63 count:8];

  v48 = v8;
  id v17 = [v8 objectForKeyedSubscript:@"processor"];
  uint64_t v18 = [v17 lowercaseString];

  if (v18)
  {
    if ([v18 isEqualToString:@"force-all"])
    {
      uint64_t v19 = location;
    }
    else
    {
      v20 = [v18 stringByReplacingOccurrencesOfString:@"backgroundjob" withString:&stru_1F2900940];

      v21 = [v20 stringByReplacingOccurrencesOfString:@"background" withString:&stru_1F2900940];

      v22 = [v21 stringByReplacingOccurrencesOfString:@"processor" withString:&stru_1F2900940];

      uint64_t v18 = [v22 stringByReplacingOccurrencesOfString:@"enrichment" withString:&stru_1F2900940];

      long long v58 = 0u;
      long long v59 = 0u;
      long long v56 = 0u;
      long long v57 = 0u;
      id v23 = location;
      uint64_t v24 = [v23 countByEnumeratingWithState:&v56 objects:v62 count:16];
      uint64_t v19 = v23;
      if (v24)
      {
        uint64_t v25 = v24;
        uint64_t v26 = *(void *)v57;
        while (2)
        {
          for (uint64_t i = 0; i != v25; ++i)
          {
            if (*(void *)v57 != v26) {
              objc_enumerationMutation(v23);
            }
            long long v28 = *(void **)(*((void *)&v56 + 1) + 8 * i);
            long long v29 = [v28 name];
            long long v30 = [v29 lowercaseString];

            if ([v30 containsString:v18])
            {
              v61 = v28;
              uint64_t v19 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v61 count:1];

              goto LABEL_15;
            }
          }
          uint64_t v25 = [v23 countByEnumeratingWithState:&v56 objects:v62 count:16];
          if (v25) {
            continue;
          }
          break;
        }
        uint64_t v19 = v23;
      }
LABEL_15:
    }
    if (![v19 count])
    {
      v31 = objc_msgSend(MEMORY[0x1E4F28C58], "pl_analysisErrorWithCode:", 19);
      v49[2](v49, v31);
    }
  }
  else
  {
    uint64_t v19 = location;
  }
  v46 = v18;
  long long v54 = 0u;
  long long v55 = 0u;
  long long v52 = 0u;
  long long v53 = 0u;
  id v32 = v19;
  uint64_t v33 = [v32 countByEnumeratingWithState:&v52 objects:v60 count:16];
  if (v33)
  {
    uint64_t v34 = v33;
    long long v35 = 0;
    uint64_t v36 = *(void *)v53;
    while (2)
    {
      for (uint64_t j = 0; j != v34; ++j)
      {
        if (*(void *)v53 != v36) {
          objc_enumerationMutation(v32);
        }
        long long v38 = *(void **)(*((void *)&v52 + 1) + 8 * j);
        if (objc_msgSend(v38, "currentPlatformIsSupported", v46, v47)
          && [v38 shouldRunWithGraphManager:self->_graphManager])
        {
          long long v39 = [v38 name];
          [(PGProgressCallChecker *)self->_progressCallChecker setTaskName:v39];

          graphManager = self->_graphManager;
          onDemandTaskProgressReporter = self->_onDemandTaskProgressReporter;
          id v51 = v35;
          LODWORD(v39) = [v38 runWithGraphManager:graphManager progressReporter:onDemandTaskProgressReporter error:&v51];
          id v42 = v51;

          if (!v39)
          {
            v49[2](v49, v42);
            long long v35 = v42;
            goto LABEL_32;
          }
          id WeakRetained = objc_loadWeakRetained((id *)&self->_jobTimeHandler);
          v44 = [MEMORY[0x1E4F1C9C8] date];
          v45 = [v38 name];
          [WeakRetained setLibraryScopedWorkerPreferencesValue:v44 forKey:v45];

          long long v35 = v42;
        }
      }
      uint64_t v34 = [v32 countByEnumeratingWithState:&v52 objects:v60 count:16];
      if (v34) {
        continue;
      }
      break;
    }
  }
  else
  {
    long long v35 = 0;
  }
LABEL_32:

  v49[2](v49, 0);
}

- (void)cacheCPAnalyticsPropertiesWithContext:(id)a3 reply:(id)a4
{
  v5 = (void (**)(id, uint64_t, id))a4;
  id v6 = objc_alloc_init(PHACachingCPAnalyticsPropertiesTask);
  id v7 = [(PHACachingCPAnalyticsPropertiesTask *)v6 name];
  [(PGProgressCallChecker *)self->_progressCallChecker setTaskName:v7];

  graphManager = self->_graphManager;
  onDemandTaskProgressReporter = self->_onDemandTaskProgressReporter;
  id v15 = 0;
  uint64_t v10 = [(PHACachingCPAnalyticsPropertiesTask *)v6 runWithGraphManager:graphManager progressReporter:onDemandTaskProgressReporter error:&v15];
  id v11 = v15;
  if (v10)
  {
    id WeakRetained = objc_loadWeakRetained((id *)&self->_jobTimeHandler);
    char v13 = [MEMORY[0x1E4F1C9C8] date];
    uint64_t v14 = [(PHACachingCPAnalyticsPropertiesTask *)v6 name];
    [WeakRetained setLibraryScopedWorkerPreferencesValue:v13 forKey:v14];
  }
  v5[2](v5, v10, v11);
}

- (void)requestExternalAssetRelevanceProcessingWithContext:(id)a3 reply:(id)a4
{
  v5 = (void (**)(id, void *, id))a4;
  graphManager = self->_graphManager;
  id v20 = 0;
  char v7 = [(PGManager *)graphManager isReadyWithError:&v20];
  id v8 = v20;
  if (v7)
  {
    id v9 = objc_alloc_init(PHAExternalAssetsTask);
    uint64_t v10 = [(PHAExternalAssetsTask *)v9 name];
    [(PGProgressCallChecker *)self->_progressCallChecker setTaskName:v10];

    id v11 = self->_graphManager;
    onDemandTaskProgressReporter = self->_onDemandTaskProgressReporter;
    id v19 = v8;
    uint64_t v13 = [(PHAExternalAssetsTask *)v9 runWithGraphManager:v11 progressReporter:onDemandTaskProgressReporter error:&v19];
    id v14 = v19;

    if (v13)
    {
      id WeakRetained = objc_loadWeakRetained((id *)&self->_jobTimeHandler);
      uint64_t v16 = [MEMORY[0x1E4F1C9C8] date];
      id v17 = [(PHAExternalAssetsTask *)v9 name];
      [WeakRetained setLibraryScopedWorkerPreferencesValue:v16 forKey:v17];
    }
    uint64_t v18 = [NSNumber numberWithBool:v13];
    v5[2](v5, v18, v14);
  }
  else
  {
    v5[2](v5, 0, v8);
    id v14 = v8;
  }
}

- (void)requestSyndicationProcessingWithOptions:(id)a3 context:(id)a4 reply:(id)a5
{
  id v7 = a3;
  id v8 = (void (**)(id, id, id))a5;
  graphManager = self->_graphManager;
  id v29 = 0;
  char v10 = [(PGManager *)graphManager isReadyWithError:&v29];
  id v11 = v29;
  if (v10)
  {
    uint64_t v12 = objc_alloc_init(PHASyndicationTask);
    uint64_t v13 = (void *)MEMORY[0x1E4F8B128];
    id v14 = (void *)MEMORY[0x1E4F8B120];
    if (v7)
    {
      id v15 = [v7 objectForKeyedSubscript:*MEMORY[0x1E4F8B120]];
      -[PHASyndicationTask setPerformCurationJob:](v12, "setPerformCurationJob:", [v15 BOOLValue]);

      uint64_t v16 = [v7 objectForKeyedSubscript:*v13];
      -[PHASyndicationTask setPerformGuestInferenceJob:](v12, "setPerformGuestInferenceJob:", [v16 BOOLValue]);
    }
    id v17 = [(PHASyndicationTask *)v12 name];
    [(PGProgressCallChecker *)self->_progressCallChecker setTaskName:v17];

    uint64_t v18 = self->_graphManager;
    onDemandTaskProgressReporter = self->_onDemandTaskProgressReporter;
    id v28 = v11;
    uint64_t v20 = [(PHASyndicationTask *)v12 runWithGraphManager:v18 progressReporter:onDemandTaskProgressReporter error:&v28];
    id v21 = v28;

    if (v20)
    {
      id WeakRetained = objc_loadWeakRetained((id *)&self->_jobTimeHandler);
      id v23 = [MEMORY[0x1E4F1C9C8] date];
      uint64_t v24 = [(PHASyndicationTask *)v12 name];
      [WeakRetained setLibraryScopedWorkerPreferencesValue:v23 forKey:v24];
    }
    id v25 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
    if ([(PHASyndicationTask *)v12 performCurationJob])
    {
      uint64_t v26 = [NSNumber numberWithBool:v20];
      [v25 setObject:v26 forKeyedSubscript:*v14];
    }
    if ([(PHASyndicationTask *)v12 performGuestInferenceJob])
    {
      BOOL v27 = [NSNumber numberWithBool:v20];
      [v25 setObject:v27 forKeyedSubscript:*v13];
    }
    v8[2](v8, v25, v21);
  }
  else
  {
    v8[2](v8, 0, v11);
    id v21 = v11;
  }
}

- (void)requestGenerateQuestionsWithOptions:(id)a3 context:(id)a4 reply:(id)a5
{
  v62[1] = *MEMORY[0x1E4F143B8];
  id v7 = a3;
  id v8 = (void (**)(id, void, id))a5;
  graphManager = self->_graphManager;
  id v54 = 0;
  char v10 = [(PGManager *)graphManager isReadyWithError:&v54];
  id v11 = v54;
  if ((v10 & 1) == 0)
  {
    v8[2](v8, 0, v11);
    goto LABEL_7;
  }
  uint64_t v12 = *MEMORY[0x1E4F8B010];
  uint64_t v13 = [v7 objectForKeyedSubscript:*MEMORY[0x1E4F8B010]];
  int v14 = [v13 BOOLValue];

  if (v14)
  {
    id v15 = +[PHAPhotosChallengeTask currentQuestionsKVSDataFromGraphManager:self->_graphManager];
    uint64_t v61 = v12;
    v62[0] = v15;
    uint64_t v16 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v62 forKeys:&v61 count:1];
    ((void (**)(id, void *, id))v8)[2](v8, v16, 0);

    goto LABEL_7;
  }
  id v17 = [v7 objectForKeyedSubscript:*MEMORY[0x1E4F8AFF0]];
  int v18 = [v17 BOOLValue];

  if (v18)
  {
    +[PHAPhotosChallengeTask removeCurrentKVSDataFromGraphManager:self->_graphManager];
    v8[2](v8, MEMORY[0x1E4F1CC08], 0);
    goto LABEL_7;
  }
  id v19 = [v7 objectForKeyedSubscript:*MEMORY[0x1E4F8B028]];
  int v20 = [v19 BOOLValue];

  if (v20)
  {
    id v21 = [v7 objectForKeyedSubscript:*MEMORY[0x1E4F8AFE8]];
    v22 = v21;
    if (v21)
    {
      id v23 = v21;
    }
    else
    {
      id v23 = [MEMORY[0x1E4F1C9C8] date];
    }
    v45 = v23;

    BOOL v46 = +[PHAPhotosChallengeTask postSubmissionNotificationIfNeededWithGraphManager:self->_graphManager notificationDate:v45];
    uint64_t v59 = *MEMORY[0x1E4F8B000];
    id v47 = [NSNumber numberWithBool:v46];
    v60 = v47;
    v48 = (void *)MEMORY[0x1E4F1C9E8];
    v49 = &v60;
    v50 = &v59;
LABEL_25:
    long long v52 = [v48 dictionaryWithObjects:v49 forKeys:v50 count:1];
    ((void (**)(id, void *, id))v8)[2](v8, v52, 0);

    goto LABEL_7;
  }
  uint64_t v24 = [v7 objectForKeyedSubscript:*MEMORY[0x1E4F8B020]];
  int v25 = [v24 BOOLValue];

  if (v25)
  {
    uint64_t v26 = [v7 objectForKeyedSubscript:*MEMORY[0x1E4F8AFE8]];
    BOOL v27 = v26;
    if (v26)
    {
      id v28 = v26;
    }
    else
    {
      id v28 = [MEMORY[0x1E4F1C9C8] date];
    }
    v45 = v28;

    BOOL v51 = +[PHAPhotosChallengeTask postNewQuestionsNotificationIfNeededWithGraphManager:self->_graphManager notificationDate:v45];
    uint64_t v57 = *MEMORY[0x1E4F8AFF8];
    id v47 = [NSNumber numberWithBool:v51];
    long long v58 = v47;
    v48 = (void *)MEMORY[0x1E4F1C9E8];
    v49 = &v58;
    v50 = &v57;
    goto LABEL_25;
  }
  id v29 = [v7 objectForKeyedSubscript:*MEMORY[0x1E4F8B018]];
  uint64_t v30 = [v29 unsignedIntegerValue];

  v31 = [v7 objectForKeyedSubscript:*MEMORY[0x1E4F8AFE0]];
  uint64_t v32 = [v31 integerValue];

  uint64_t v33 = objc_alloc_init(PHAPhotosChallengeTask);
  uint64_t v34 = v33;
  if (v32) {
    [(PHAPhotosChallengeTask *)v33 setLimit:v32];
  }
  if (v30) {
    [(PHAPhotosChallengeTask *)v34 setQuestionOptions:v30];
  }
  long long v35 = [(PHAPhotosChallengeTask *)v34 name];
  [(PGProgressCallChecker *)self->_progressCallChecker setTaskName:v35];

  uint64_t v36 = self->_graphManager;
  onDemandTaskProgressReporter = self->_onDemandTaskProgressReporter;
  id v53 = v11;
  uint64_t v38 = [(PHAPhotosChallengeTask *)v34 runWithGraphManager:v36 progressReporter:onDemandTaskProgressReporter error:&v53];
  id v39 = v53;

  if (v38)
  {
    id WeakRetained = objc_loadWeakRetained((id *)&self->_jobTimeHandler);
    uint64_t v41 = [MEMORY[0x1E4F1C9C8] date];
    id v42 = [(PHAPhotosChallengeTask *)v34 name];
    [WeakRetained setLibraryScopedWorkerPreferencesValue:v41 forKey:v42];
  }
  uint64_t v55 = *MEMORY[0x1E4F8B008];
  v43 = [NSNumber numberWithBool:v38];
  long long v56 = v43;
  v44 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v56 forKeys:&v55 count:1];
  ((void (**)(id, void *, id))v8)[2](v8, v44, v39);

  id v11 = v39;
LABEL_7:
}

- (void)reportMetricsWithOptions:(id)a3 context:(id)a4 reply:(id)a5
{
  id v6 = (void (**)(id, uint64_t, id))a5;
  graphManager = self->_graphManager;
  id v20 = 0;
  char v8 = [(PGManager *)graphManager isReadyWithError:&v20];
  id v9 = v20;
  if (v8)
  {
    char v10 = objc_alloc_init(PHAMetricReportingTask);
    id v11 = [(PHAMetricReportingTask *)v10 name];
    [(PGProgressCallChecker *)self->_progressCallChecker setTaskName:v11];

    uint64_t v12 = self->_graphManager;
    onDemandTaskProgressReporter = self->_onDemandTaskProgressReporter;
    id v19 = v9;
    uint64_t v14 = [(PHAMetricReportingTask *)v10 runWithGraphManager:v12 progressReporter:onDemandTaskProgressReporter error:&v19];
    id v15 = v19;

    if (v14)
    {
      id WeakRetained = objc_loadWeakRetained((id *)&self->_jobTimeHandler);
      id v17 = [MEMORY[0x1E4F1C9C8] date];
      int v18 = [(PHAMetricReportingTask *)v10 name];
      [WeakRetained setLibraryScopedWorkerPreferencesValue:v17 forKey:v18];
    }
    v6[2](v6, v14, v15);
  }
  else
  {
    v6[2](v6, 0, v9);
    id v15 = v9;
  }
}

- (void)generateSuggestionsWithOptions:(id)a3 context:(id)a4 reply:(id)a5
{
  v55[1] = *MEMORY[0x1E4F143B8];
  id v7 = a3;
  id v8 = a5;
  graphManager = self->_graphManager;
  id v51 = 0;
  char v10 = [(PGManager *)graphManager isReadyWithError:&v51];
  id v11 = v51;
  if (v10)
  {
    uint64_t v43 = MEMORY[0x1E4F143A8];
    uint64_t v44 = 3221225472;
    v45 = __83__PHAStorytellingOnDemandTaskHandler_generateSuggestionsWithOptions_context_reply___block_invoke;
    BOOL v46 = &unk_1E6917D90;
    id v12 = v7;
    id v47 = v12;
    v48 = self;
    id v13 = v8;
    id v50 = v13;
    id v11 = v11;
    id v49 = v11;
    uint64_t v14 = (void (**)(void *, id))_Block_copy(&v43);
    id v15 = objc_msgSend(v12, "objectForKeyedSubscript:", *MEMORY[0x1E4F8B108], v43, v44, v45, v46);
    unsigned __int16 v16 = [v15 integerValue];

    if (v16 > 7u)
    {
      if (v16 == 8)
      {
        id v29 = [PHAWallpaperSuggestionGenerationWeeklyTask alloc];
        uint64_t v30 = 8;
LABEL_24:
        uint64_t v41 = [(PHAWallpaperSuggestionGenerationWeeklyTask *)v29 initWithGenerationOptions:v30];
LABEL_27:
        id v42 = v41;
        v14[2](v14, v41);

        goto LABEL_28;
      }
      if (v16 == 11)
      {
        id v23 = objc_alloc_init(PGCameraStyleableSuggestionGenerator);
        uint64_t v24 = self->_graphManager;
        int v25 = [MEMORY[0x1E4F71F08] ignoreProgress];
        uint64_t v26 = [(PGCameraStyleableSuggestionGenerator *)v23 generateSuggestionsWithGraphManager:v24 progressReporter:v25];

        uint64_t v54 = *MEMORY[0x1E4F8B118];
        v55[0] = v26;
        BOOL v27 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v55 forKeys:&v54 count:1];
        (*((void (**)(id, void *, id))v13 + 2))(v13, v27, v11);

LABEL_28:
        goto LABEL_29;
      }
    }
    else
    {
      if (v16 == 1)
      {
        id v28 = PHASharingSuggestionGenerationTask;
        goto LABEL_26;
      }
      if (v16 == 6)
      {
        id v17 = [v12 objectForKeyedSubscript:*MEMORY[0x1E4F8B0F8]];
        unsigned __int16 v18 = [v17 integerValue];

        id v19 = [MEMORY[0x1E4F39310] allTopWallpaperSuggestionSubtypes];
        id v20 = [NSNumber numberWithUnsignedShort:v18];
        char v21 = [v19 containsObject:v20];

        if (v21)
        {
          uint64_t v22 = 2;
        }
        else
        {
          uint64_t v36 = [MEMORY[0x1E4F39310] allShuffleWallpaperSuggestionSubtypes];
          long long v37 = [NSNumber numberWithUnsignedShort:v18];
          char v38 = [v36 containsObject:v37];

          uint64_t v39 = 23;
          if (v18 == 901) {
            uint64_t v39 = 16;
          }
          uint64_t v40 = 4;
          if (v18 != 680) {
            uint64_t v40 = v39;
          }
          if (v38) {
            uint64_t v22 = 1;
          }
          else {
            uint64_t v22 = v40;
          }
        }
        id v29 = [PHAWallpaperSuggestionGenerationWeeklyTask alloc];
        uint64_t v30 = v22;
        goto LABEL_24;
      }
    }
    v31 = [v12 objectForKeyedSubscript:*MEMORY[0x1E4F8B0C0]];
    int v32 = [v31 BOOLValue];

    if (!v16 && !v32)
    {
      uint64_t v33 = (void *)MEMORY[0x1E4F28C58];
      long long v52 = @"Unsupported generate suggestions options";
      id v53 = v12;
      uint64_t v34 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v53 forKeys:&v52 count:1];
      uint64_t v35 = [v33 errorWithDomain:@"com.apple.photoanalysis" code:17 userInfo:v34];

      (*((void (**)(id, void, uint64_t))v13 + 2))(v13, 0, v35);
      id v11 = (id)v35;
      goto LABEL_28;
    }
    id v28 = PHASuggestionGenerationTask;
LABEL_26:
    uint64_t v41 = (PHAWallpaperSuggestionGenerationWeeklyTask *)objc_alloc_init(v28);
    goto LABEL_27;
  }
  (*((void (**)(id, void, id))v8 + 2))(v8, 0, v11);
LABEL_29:
}

void __83__PHAStorytellingOnDemandTaskHandler_generateSuggestionsWithOptions_context_reply___block_invoke(void *a1, void *a2)
{
  uint64_t v3 = a1[4];
  id v4 = a2;
  [v4 setSuggestionOptionsDictionary:v3];
  v5 = [v4 name];
  [*(id *)(a1[5] + 48) setTaskName:v5];

  uint64_t v6 = a1[5];
  uint64_t v7 = *(void *)(v6 + 8);
  uint64_t v8 = *(void *)(v6 + 40);
  id v11 = 0;
  id v9 = [v4 generateSuggestionsWithGraphManager:v7 progressReporter:v8 error:&v11];

  id v10 = v11;
  (*(void (**)(void))(a1[7] + 16))();
}

- (void)generateMemoriesWithOptions:(id)a3 context:(id)a4 reply:(id)a5
{
  id v7 = a3;
  id v8 = a5;
  graphManager = self->_graphManager;
  id v43 = 0;
  char v10 = [(PGManager *)graphManager isReadyWithError:&v43];
  id v11 = v43;
  id v12 = v11;
  if (v10)
  {
    id v40 = v11;
    id v13 = objc_alloc_init(PHAMemoryElectionTask);
    uint64_t v14 = [(PHAMemoryElectionTask *)v13 name];
    [(PGProgressCallChecker *)self->_progressCallChecker setTaskName:v14];

    id v15 = [v7 objectForKeyedSubscript:@"PHMemoryOptionDateKey"];
    if (v15)
    {
      [(PHAMemoryElectionTask *)v13 setUniversalDate:v15];
    }
    else
    {
      unsigned __int16 v16 = [MEMORY[0x1E4F1C9C8] date];
      [(PHAMemoryElectionTask *)v13 setUniversalDate:v16];
    }
    id v17 = [v7 objectForKeyedSubscript:@"PHMemoryOptionLocationKey"];
    [(PHAMemoryElectionTask *)v13 setLocation:v17];

    unsigned __int16 v18 = [v7 objectForKeyedSubscript:@"PHMemoryOptionExtraParametersKey"];
    id v19 = [v18 objectForKeyedSubscript:@"notification"];
    -[PHAMemoryElectionTask setForceNotification:](v13, "setForceNotification:", [v19 BOOLValue]);

    id v20 = [v18 objectForKeyedSubscript:@"PHMemoryOptionRequestedCategoryKey"];
    char v21 = v20;
    if (v20) {
      -[PHAMemoryElectionTask setRequestedCategory:](v13, "setRequestedCategory:", [v20 unsignedIntegerValue]);
    }
    uint64_t v22 = objc_msgSend(v18, "objectForKeyedSubscript:", @"PHMemoryOptionRequestedTriggerKey", v21);
    id v23 = v22;
    if (v22) {
      -[PHAMemoryElectionTask setRequestedTriggerType:](v13, "setRequestedTriggerType:", [v22 unsignedIntegerValue]);
    }
    uint64_t v24 = [v18 objectForKeyedSubscript:@"PHMemoryOptionRequestedFeatureTypeKey"];
    int v25 = v24;
    if (v24)
    {
      uint64_t v26 = (void *)MEMORY[0x1E4F8D3F8];
      uint64_t v27 = [v24 unsignedIntegerValue];
      id v28 = [v18 objectForKeyedSubscript:@"PHMemoryOptionRequestedFeatureIdentifierKey"];
      id v29 = [v26 featureWithType:v27 name:v28];
      [(PHAMemoryElectionTask *)v13 setRequestedFeature:v29];
    }
    uint64_t v30 = [v18 objectForKeyedSubscript:@"PHMemoryOptionRequestedUniqueMemoryIdentifierKey"];
    [(PHAMemoryElectionTask *)v13 setRequestedUniqueMemoryIdentifier:v30];

    v31 = [v7 objectForKeyedSubscript:@"PHMemoryOptionReasonKey"];
    int v32 = v31;
    if (v31) {
      BOOL v33 = [v31 unsignedIntegerValue] == 1;
    }
    else {
      BOOL v33 = 1;
    }
    [(PHAMemoryElectionTask *)v13 setUserInitiated:v33];
    uint64_t v34 = [v7 objectForKeyedSubscript:@"PHMemoryOptionCommitChangesKey"];
    uint64_t v35 = v34;
    if (v34) {
      uint64_t v36 = [v34 BOOLValue] ^ 1;
    }
    else {
      uint64_t v36 = 0;
    }
    [(PHAMemoryElectionTask *)v13 setCreateTransientMemories:v36];
    long long v37 = self->_graphManager;
    onDemandTaskProgressReporter = self->_onDemandTaskProgressReporter;
    v41[0] = MEMORY[0x1E4F143A8];
    v41[1] = 3221225472;
    v41[2] = __80__PHAStorytellingOnDemandTaskHandler_generateMemoriesWithOptions_context_reply___block_invoke;
    v41[3] = &unk_1E6917D68;
    id v42 = v8;
    [(PHAMemoryElectionTask *)v13 runWithGraphManager:v37 progressReporter:onDemandTaskProgressReporter reply:v41];

    id v12 = v40;
  }
  else
  {
    (*((void (**)(id, void, id))v8 + 2))(v8, 0, v11);
  }
}

uint64_t __80__PHAStorytellingOnDemandTaskHandler_generateMemoriesWithOptions_context_reply___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)requestOnDemandTasksWithOptions:(id)a3 context:(id)a4 reply:(id)a5
{
  v52[3] = *MEMORY[0x1E4F143B8];
  id v7 = (void (**)(id, void, void *))a5;
  id v8 = [a3 objectForKeyedSubscript:*MEMORY[0x1E4F8AF68]];
  if ([v8 isEqualToString:@"contentGeneration"])
  {
    id v9 = objc_alloc_init(PHAMemoryElectionTask);
    v52[0] = v9;
    char v10 = objc_alloc_init(PHASuggestionGenerationTask);
    v52[1] = v10;
    id v11 = [[PHAWallpaperSuggestionGenerationWeeklyTask alloc] initWithGenerationOptions:31];
    v52[2] = v11;
    id v12 = [MEMORY[0x1E4F1C978] arrayWithObjects:v52 count:3];
  }
  else
  {
    if ([v8 isEqualToString:@"reportActiveUserFeature"])
    {
      id v9 = objc_alloc_init(PHAFeaturesUsageReportingTask);
      id v51 = v9;
      id v13 = (void *)MEMORY[0x1E4F1C978];
      uint64_t v14 = &v51;
    }
    else if ([v8 isEqualToString:@"sharedLibrarySuggestionsDaily"])
    {
      id v9 = [[PHASharedLibrarySuggestionGenerationTask alloc] initWithTaskType:0];
      id v50 = v9;
      id v13 = (void *)MEMORY[0x1E4F1C978];
      uint64_t v14 = &v50;
    }
    else if ([v8 isEqualToString:@"sharedLibrarySuggestionsWeekly"])
    {
      id v9 = [[PHASharedLibrarySuggestionGenerationTask alloc] initWithTaskType:1];
      id v49 = v9;
      id v13 = (void *)MEMORY[0x1E4F1C978];
      uint64_t v14 = &v49;
    }
    else if ([v8 isEqualToString:@"removeFeaturedContent"])
    {
      id v9 = objc_alloc_init(PHARemoveFeaturedContentTask);
      v48 = v9;
      id v13 = (void *)MEMORY[0x1E4F1C978];
      uint64_t v14 = &v48;
    }
    else if ([v8 isEqualToString:@"photosChallenge"])
    {
      id v9 = objc_alloc_init(PHAPhotosChallengeTask);
      id v47 = v9;
      id v13 = (void *)MEMORY[0x1E4F1C978];
      uint64_t v14 = &v47;
    }
    else if ([v8 isEqualToString:@"wallpaperNightly"])
    {
      id v9 = objc_alloc_init(PHAWallpaperSuggestionGenerationNightlyTask);
      BOOL v46 = v9;
      id v13 = (void *)MEMORY[0x1E4F1C978];
      uint64_t v14 = &v46;
    }
    else if ([v8 hasPrefix:@"wallpaperWeekly"])
    {
      if ([v8 isEqualToString:@"wallpaperWeekly"])
      {
        uint64_t v15 = 31;
      }
      else if ([v8 isEqualToString:@"wallpaperWeeklyShuffleOnly"])
      {
        uint64_t v15 = 1;
      }
      else if ([v8 isEqualToString:@"wallpaperWeeklyTopOnly"])
      {
        uint64_t v15 = 2;
      }
      else if ([v8 isEqualToString:@"wallpaperWeeklySettlingEffectOnly"])
      {
        uint64_t v15 = 4;
      }
      else if ([v8 isEqualToString:@"wallpaperWeeklyAmbientOnly"])
      {
        uint64_t v15 = 8;
      }
      else
      {
        if (![v8 isEqualToString:@"wallpaperWeeklyMe"])
        {
          uint64_t v36 = objc_msgSend(MEMORY[0x1E4F28C58], "pl_analysisErrorWithCode:localizedDescription:", 3, @"Task not supported returned NO");
          v7[2](v7, 0, v36);

          goto LABEL_54;
        }
        uint64_t v15 = 16;
      }
      id v9 = [[PHAWallpaperSuggestionGenerationWeeklyTask alloc] initWithGenerationOptions:v15];
      v45 = v9;
      id v13 = (void *)MEMORY[0x1E4F1C978];
      uint64_t v14 = &v45;
    }
    else if ([v8 isEqualToString:@"userAnalyticsBiomeWeekly"])
    {
      id v9 = [[PHAUserAnalyticsBiomeTask alloc] initWithTaskType:1];
      uint64_t v44 = v9;
      id v13 = (void *)MEMORY[0x1E4F1C978];
      uint64_t v14 = &v44;
    }
    else
    {
      if (![v8 isEqualToString:@"userAnalyticsBiomeDaily"])
      {
        id v12 = 0;
        goto LABEL_36;
      }
      id v9 = [[PHAUserAnalyticsBiomeTask alloc] initWithTaskType:0];
      id v43 = v9;
      id v13 = (void *)MEMORY[0x1E4F1C978];
      uint64_t v14 = &v43;
    }
    id v12 = [v13 arrayWithObjects:v14 count:1];
  }

LABEL_36:
  if ([v12 count])
  {
    long long v40 = 0u;
    long long v41 = 0u;
    long long v38 = 0u;
    long long v39 = 0u;
    id v16 = v12;
    uint64_t v17 = [v16 countByEnumeratingWithState:&v38 objects:v42 count:16];
    if (v17)
    {
      uint64_t v18 = v17;
      id v19 = 0;
      uint64_t v20 = *(void *)v39;
      while (2)
      {
        uint64_t v21 = 0;
        uint64_t v22 = v19;
        do
        {
          if (*(void *)v39 != v20) {
            objc_enumerationMutation(v16);
          }
          id v23 = *(void **)(*((void *)&v38 + 1) + 8 * v21);
          if (![v23 shouldRunWithGraphManager:self->_graphManager])
          {
            v31 = (void *)MEMORY[0x1E4F28C58];
            int v32 = NSString;
            BOOL v33 = [v23 name];
            uint64_t v34 = [v32 stringWithFormat:@"%@'s shouldRunWithGraphManager returned NO", v33];
            uint64_t v35 = objc_msgSend(v31, "pl_analysisErrorWithCode:localizedDescription:", 14, v34);
            v7[2](v7, 0, v35);

            goto LABEL_53;
          }
          graphManager = self->_graphManager;
          onDemandTaskProgressReporter = self->_onDemandTaskProgressReporter;
          id v37 = v22;
          int v26 = [v23 runWithGraphManager:graphManager progressReporter:onDemandTaskProgressReporter error:&v37];
          id v19 = v37;

          if (!v26)
          {
            uint64_t v30 = 0;
            goto LABEL_52;
          }
          ++v21;
          uint64_t v22 = v19;
        }
        while (v18 != v21);
        uint64_t v18 = [v16 countByEnumeratingWithState:&v38 objects:v42 count:16];
        if (v18) {
          continue;
        }
        break;
      }
    }
    else
    {
      id v19 = 0;
    }
    uint64_t v30 = 1;
LABEL_52:

    v7[2](v7, v30, v19);
LABEL_53:
  }
  else
  {
    uint64_t v27 = (void *)MEMORY[0x1E4F28C58];
    id v28 = [NSString stringWithFormat:@"No tasks to run for %@", v8];
    id v29 = objc_msgSend(v27, "pl_analysisErrorWithCode:localizedDescription:", 19, v28);
    v7[2](v7, 0, v29);
  }
LABEL_54:
}

- (void)shutdown
{
  [(MARootProgressReporter *)self->_onDemandTaskProgressReporter cancelOperation];
  os_unfair_lock_lock(&self->_lock);
  [(NSMutableArray *)self->_operationsToRun removeAllObjects];
  os_unfair_lock_unlock(&self->_lock);
  self->_isShutdown = 1;
  executionQueue = self->_executionQueue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __46__PHAStorytellingOnDemandTaskHandler_shutdown__block_invoke;
  block[3] = &unk_1E6918C50;
  block[4] = self;
  dispatch_sync(executionQueue, block);
}

void __46__PHAStorytellingOnDemandTaskHandler_shutdown__block_invoke(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 32);
  uint64_t v3 = *(void **)(v2 + 8);
  *(void *)(v2 + 8) = 0;

  uint64_t v4 = *(void *)(a1 + 32);
  v5 = *(void **)(v4 + 16);
  *(void *)(v4 + 16) = 0;
}

- (void)forceCancellationIfShutdown
{
  if (self->_isShutdown) {
    [(MARootProgressReporter *)self->_onDemandTaskProgressReporter cancelOperation];
  }
}

- (void)cancelCurrentOperation
{
}

- (BOOL)isQuiescent
{
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  if ([(NSMutableArray *)self->_operationsToRun count]) {
    BOOL v4 = 0;
  }
  else {
    BOOL v4 = self->_onDemandTaskProgressReporter == 0;
  }
  os_unfair_lock_unlock(p_lock);
  return v4;
}

- (void)dequeueOperationsIfNeeded
{
  executionQueue = self->_executionQueue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __63__PHAStorytellingOnDemandTaskHandler_dequeueOperationsIfNeeded__block_invoke;
  block[3] = &unk_1E6918C50;
  block[4] = self;
  dispatch_async(executionQueue, block);
}

void __63__PHAStorytellingOnDemandTaskHandler_dequeueOperationsIfNeeded__block_invoke(uint64_t a1)
{
  uint64_t v32 = *MEMORY[0x1E4F143B8];
  uint64_t v2 = [*(id *)(a1 + 32) nextOperation];
  if (v2)
  {
    objc_initWeak(&location, *(id *)(a1 + 32));
    os_log_t v3 = os_log_create("com.apple.photoanalysisd", "taskProgress");
    BOOL v4 = [v2 progressBlock];
    v5 = (void *)[objc_alloc(MEMORY[0x1E4F8D898]) initWithTaskName:@"OnDemandTask" loggingConnection:v3];
    id v6 = objc_alloc(MEMORY[0x1E4F71F20]);
    v23[0] = MEMORY[0x1E4F143A8];
    v23[1] = 3221225472;
    v23[2] = __63__PHAStorytellingOnDemandTaskHandler_dequeueOperationsIfNeeded__block_invoke_2;
    v23[3] = &unk_1E6917D40;
    id v7 = v4;
    id v25 = v7;
    objc_copyWeak(&v26, &location);
    id v8 = v5;
    id v24 = v8;
    uint64_t v9 = [v6 initWithProgressBlock:v23];
    uint64_t v10 = *(void *)(a1 + 32);
    id v11 = *(void **)(v10 + 40);
    *(void *)(v10 + 40) = v9;

    objc_storeStrong((id *)(*(void *)(a1 + 32) + 48), v5);
    v22[0] = MEMORY[0x1E4F143A8];
    v22[1] = 3221225472;
    v22[2] = __63__PHAStorytellingOnDemandTaskHandler_dequeueOperationsIfNeeded__block_invoke_3;
    v22[3] = &unk_1E6918C50;
    v22[4] = *(void *)(a1 + 32);
    [v2 setCancellationBlock:v22];
    id v12 = *(id *)(*(void *)(a1 + 32) + 64);
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      id v13 = [v2 invocation];
      qos_class_t v14 = qos_class_self();
      uint64_t v15 = PHADescriptionForQoS(v14);
      *(_DWORD *)buf = 138412546;
      id v29 = v13;
      __int16 v30 = 2112;
      v31 = v15;
      _os_log_impl(&dword_1D21F2000, v12, OS_LOG_TYPE_DEFAULT, "Running task '%@' at QoS %@", buf, 0x16u);
    }
    [v2 runOperation];
    uint64_t v16 = *(void *)(a1 + 32);
    uint64_t v17 = *(void **)(v16 + 40);
    *(void *)(v16 + 40) = 0;

    uint64_t v18 = *(void **)(*(void *)(a1 + 32) + 48);
    *(void *)(*(void *)(a1 + 32) + 48) = 0;

    int v19 = [*(id *)(a1 + 32) hasRemainingOperations];
    uint64_t v20 = *(void **)(a1 + 32);
    if (v19)
    {
      [v20 dequeueOperationsIfNeeded];
    }
    else
    {
      uint64_t v21 = [v20 delegate];
      [v21 onDemandTaskHandlerDidFinishOperation:*(void *)(a1 + 32)];
    }
    objc_destroyWeak(&v26);

    objc_destroyWeak(&location);
  }
}

void __63__PHAStorytellingOnDemandTaskHandler_dequeueOperationsIfNeeded__block_invoke_2(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 40);
  if (v2)
  {
    char v5 = 0;
    (*(void (**)(uint64_t, char *))(v2 + 16))(v2, &v5);
    if (v5)
    {
      id WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
      [WeakRetained cancelCurrentOperation];
    }
  }
  else
  {
    objc_msgSend(*(id *)(a1 + 32), "checkCallsWithProgress:stop:", 0);
  }
  id v4 = objc_loadWeakRetained((id *)(a1 + 48));
  [v4 forceCancellationIfShutdown];
}

uint64_t __63__PHAStorytellingOnDemandTaskHandler_dequeueOperationsIfNeeded__block_invoke_3(uint64_t a1)
{
  return [*(id *)(*(void *)(a1 + 32) + 40) cancelOperation];
}

- (BOOL)hasRemainingOperations
{
  uint64_t v2 = self;
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  LOBYTE(v2) = [(NSMutableArray *)v2->_operationsToRun count] != 0;
  os_unfair_lock_unlock(p_lock);
  return (char)v2;
}

- (id)nextOperation
{
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  id v4 = [(NSMutableArray *)self->_operationsToRun firstObject];
  if (v4) {
    [(NSMutableArray *)self->_operationsToRun removeObjectAtIndex:0];
  }
  os_unfair_lock_unlock(p_lock);

  return v4;
}

- (BOOL)validateOperation:(id)a3 forConnection:(id)a4
{
  return 1;
}

- (void)handleOperation:(id)a3
{
  p_lock = &self->_lock;
  id v5 = a3;
  os_unfair_lock_lock(p_lock);
  [(NSMutableArray *)self->_operationsToRun addObject:v5];

  os_unfair_lock_unlock(p_lock);
  id v6 = [(PHAStorytellingOnDemandTaskHandler *)self delegate];
  [v6 onDemandTaskHandlerStartingOperation:self];

  [(PHAStorytellingOnDemandTaskHandler *)self dequeueOperationsIfNeeded];
}

- (PHAStorytellingOnDemandTaskHandler)initWithGraphManager:(id)a3 jobTimeHandler:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v22.receiver = self;
  v22.super_class = (Class)PHAStorytellingOnDemandTaskHandler;
  uint64_t v9 = [(PHAStorytellingOnDemandTaskHandler *)&v22 init];
  uint64_t v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_graphManager, a3);
    id v11 = [(PGManager *)v10->_graphManager workingContext];
    uint64_t v12 = [v11 photoLibrary];
    photoLibrary = v10->_photoLibrary;
    v10->_photoLibrary = (PHPhotoLibrary *)v12;

    qos_class_t v14 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    dispatch_queue_t v15 = dispatch_queue_create("com.apple.photoanalysis.ondemandtask", v14);
    executionQueue = v10->_executionQueue;
    v10->_executionQueue = (OS_dispatch_queue *)v15;

    v10->_isShutdown = 0;
    uint64_t v17 = [MEMORY[0x1E4F1CA48] array];
    operationsToRun = v10->_operationsToRun;
    v10->_operationsToRun = (NSMutableArray *)v17;

    v10->_lock._os_unfair_lock_opaque = 0;
    objc_storeWeak((id *)&v10->_jobTimeHandler, v8);
    os_log_t v19 = os_log_create("com.apple.photoanalysisd", "ondemandtaskhandler");
    loggingConnection = v10->_loggingConnection;
    v10->_loggingConnection = (OS_os_log *)v19;
  }
  return v10;
}

@end