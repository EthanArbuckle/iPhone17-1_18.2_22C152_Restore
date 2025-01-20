@interface PHANotificationController
- (BOOL)shouldFireNotificationForMemoriesWithScores:(id)a3 withCreationReason:(unint64_t)a4;
- (BOOL)userFeedbackScoreIsAcceptableForAssetCollection:(id)a3 memoryFeatures:(id)a4 userFeedbackCalculator:(id)a5;
- (BOOL)userIsActivelyUsingPhotos;
- (PHANotificationController)initWithGraphManager:(id)a3;
- (PHANotificationController)initWithGraphManager:(id)a3 userFeedbackCalculator:(id)a4;
- (id)_userFeedbackCalculatorWithPhotoLibrary:(id)a3;
- (id)bestDateForDeliveringNotification;
- (void)fireNotificationForMemoryIdentifiers:(id)a3 withCreationReason:(unint64_t)a4;
- (void)fireNotificationForSuggestionIdentifiers:(id)a3;
- (void)postNotificationForMemory:(id)a3 withCreationReason:(unint64_t)a4 forceImmediateDelivery:(BOOL)a5;
- (void)postNotificationForSuggestion:(id)a3 deliveryDate:(id)a4;
@end

@implementation PHANotificationController

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_userFeedbackCalculator, 0);
  objc_storeStrong((id *)&self->_graphManager, 0);
  objc_storeStrong((id *)&self->_analytics, 0);
  objc_storeStrong((id *)&self->_photoLibrary, 0);

  objc_storeStrong((id *)&self->_loggingConnection, 0);
}

- (BOOL)userFeedbackScoreIsAcceptableForAssetCollection:(id)a3 memoryFeatures:(id)a4 userFeedbackCalculator:(id)a5
{
  v53[1] = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v42 = a4;
  id v9 = a5;
  v10 = [(PHPhotoLibrary *)self->_photoLibrary librarySpecificFetchOptions];
  v53[0] = *MEMORY[0x1E4F394A8];
  v11 = [MEMORY[0x1E4F1C978] arrayWithObjects:v53 count:1];
  [v10 setFetchPropertySets:v11];

  v40 = v10;
  v41 = v8;
  v12 = [MEMORY[0x1E4F38EB8] fetchKeyAssetsInAssetCollection:v8 options:v10];
  v13 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA48]), "initWithCapacity:", objc_msgSend(v12, "count"));
  long long v47 = 0u;
  long long v48 = 0u;
  long long v49 = 0u;
  long long v50 = 0u;
  id v14 = v12;
  uint64_t v15 = [v14 countByEnumeratingWithState:&v47 objects:v52 count:16];
  if (v15)
  {
    uint64_t v16 = v15;
    uint64_t v17 = *(void *)v48;
    do
    {
      for (uint64_t i = 0; i != v16; ++i)
      {
        if (*(void *)v48 != v17) {
          objc_enumerationMutation(v14);
        }
        v19 = [*(id *)(*((void *)&v47 + 1) + 8 * i) uuid];
        [v13 addObject:v19];
      }
      uint64_t v16 = [v14 countByEnumeratingWithState:&v47 objects:v52 count:16];
    }
    while (v16);
  }
  v39 = v14;

  v20 = [(PHPhotoLibrary *)self->_photoLibrary librarySpecificFetchOptions];
  [v20 setIncludedDetectionTypes:&unk_1F291AD80];
  v38 = v20;
  v21 = [MEMORY[0x1E4F391F0] fetchPersonUUIDsGroupedByAssetUUIDForAssetUUIDs:v13 options:v20];
  double v22 = *MEMORY[0x1E4F39858];
  long long v43 = 0u;
  long long v44 = 0u;
  long long v45 = 0u;
  long long v46 = 0u;
  id v23 = v13;
  uint64_t v24 = [v23 countByEnumeratingWithState:&v43 objects:v51 count:16];
  if (v24)
  {
    uint64_t v25 = v24;
    uint64_t v26 = *(void *)v44;
    v27 = (void *)MEMORY[0x1E4F1CBF0];
    do
    {
      for (uint64_t j = 0; j != v25; ++j)
      {
        if (*(void *)v44 != v26) {
          objc_enumerationMutation(v23);
        }
        uint64_t v29 = *(void *)(*((void *)&v43 + 1) + 8 * j);
        uint64_t v30 = [v21 objectForKeyedSubscript:v29];
        v31 = (void *)v30;
        if (v30) {
          v32 = (void *)v30;
        }
        else {
          v32 = v27;
        }
        id v33 = v32;

        [v9 scoreForKeyAssetUUID:v29 personsUUIDsInKeyAsset:v33 memoryFeatures:v42];
        double v35 = v34;

        if (v35 < v22) {
          double v22 = v35;
        }
      }
      uint64_t v25 = [v23 countByEnumeratingWithState:&v43 objects:v51 count:16];
    }
    while (v25);
  }

  char v36 = [MEMORY[0x1E4F39338] score:v22 meetsScoreThreshold:*MEMORY[0x1E4F39848]];
  return v36;
}

- (void)postNotificationForSuggestion:(id)a3 deliveryDate:(id)a4
{
  id v5 = a3;
  v6 = +[PHALocalNotificationInterface localNotificationInterface];
  v7 = [[PHANotificationOptions alloc] initWithType:1];
  id v8 = (void *)MEMORY[0x1E4F39310];
  id v9 = [v5 localIdentifier];
  v10 = [v8 uuidFromLocalIdentifier:v9];

  [(PHANotificationOptions *)v7 setCollectionUUID:v10];
  v11 = [(PHANotificationController *)self bestDateForDeliveringNotification];
  [(PHANotificationOptions *)v7 setDeliveryDate:v11];

  v12 = [MEMORY[0x1E4F38EB8] fetchKeyAssetsInAssetCollection:v5 options:0];

  v13 = [v12 firstObject];
  [(PHANotificationOptions *)v7 setKeyAsset:v13];

  v14[0] = MEMORY[0x1E4F143A8];
  v14[1] = 3221225472;
  v14[2] = __72__PHANotificationController_postNotificationForSuggestion_deliveryDate___block_invoke;
  v14[3] = &unk_1E6918A10;
  v14[4] = self;
  [v6 fireLocalNotificationWithOptions:v7 completionHandler:v14];
}

uint64_t __72__PHANotificationController_postNotificationForSuggestion_deliveryDate___block_invoke(uint64_t result, int a2)
{
  if (a2) {
    return [*(id *)(*(void *)(result + 32) + 24) sendEvent:@"com.apple.Photos.suggestion.notificationSent" withPayload:MEMORY[0x1E4F1CC08]];
  }
  return result;
}

- (void)fireNotificationForSuggestionIdentifiers:(id)a3
{
  v40[1] = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if ([v4 count])
  {
    id v5 = [(PHANotificationController *)self _userFeedbackCalculatorWithPhotoLibrary:self->_photoLibrary];
    v6 = [(PHPhotoLibrary *)self->_photoLibrary librarySpecificFetchOptions];
    v7 = [MEMORY[0x1E4F29008] sortDescriptorWithKey:@"startDate" ascending:0];
    v40[0] = v7;
    id v8 = [MEMORY[0x1E4F1C978] arrayWithObjects:v40 count:1];
    [v6 setSortDescriptors:v8];

    id v28 = v4;
    id v9 = [MEMORY[0x1E4F28F60] predicateWithFormat:@"localIdentifier in %@", v4];
    [v6 setPredicate:v9];

    v27 = v6;
    [MEMORY[0x1E4F39310] fetchSuggestionsWithOptions:v6];
    long long v33 = 0u;
    long long v34 = 0u;
    long long v35 = 0u;
    long long v36 = 0u;
    id v10 = (id)objc_claimAutoreleasedReturnValue();
    uint64_t v11 = [v10 countByEnumeratingWithState:&v33 objects:v39 count:16];
    if (v11)
    {
      uint64_t v12 = v11;
      uint64_t v13 = *(void *)v34;
      uint64_t v14 = MEMORY[0x1E4F1CBF0];
LABEL_4:
      uint64_t v15 = 0;
      while (1)
      {
        if (*(void *)v34 != v13) {
          objc_enumerationMutation(v10);
        }
        uint64_t v16 = *(void **)(*((void *)&v33 + 1) + 8 * v15);
        if ([(PHANotificationController *)self userFeedbackScoreIsAcceptableForAssetCollection:v16 memoryFeatures:v14 userFeedbackCalculator:v5])
        {
          break;
        }
        if (__PXLoggraph_workerOnceToken != -1) {
          dispatch_once(&__PXLoggraph_workerOnceToken, &__block_literal_global_303);
        }
        uint64_t v17 = (void *)__PXLoggraph_workerOSLog;
        if (os_log_type_enabled((os_log_t)__PXLoggraph_workerOSLog, OS_LOG_TYPE_DEFAULT))
        {
          v18 = v17;
          v19 = [v16 localIdentifier];
          *(_DWORD *)buf = 138412290;
          id v38 = v19;
          _os_log_impl(&dword_1D21F2000, v18, OS_LOG_TYPE_DEFAULT, "[Suggestions Notification] Skipping notification for suggestion %@: user feedback score is lower than acceptable.", buf, 0xCu);
        }
        if (v12 == ++v15)
        {
          uint64_t v12 = [v10 countByEnumeratingWithState:&v33 objects:v39 count:16];
          if (v12) {
            goto LABEL_4;
          }
          goto LABEL_14;
        }
      }
      id v20 = v16;

      if (!v20) {
        goto LABEL_18;
      }
      photoLibrary = self->_photoLibrary;
      v30[0] = MEMORY[0x1E4F143A8];
      v30[1] = 3221225472;
      v30[2] = __70__PHANotificationController_fireNotificationForSuggestionIdentifiers___block_invoke_307;
      v30[3] = &unk_1E69189B0;
      id v31 = v10;
      id v22 = v20;
      id v32 = v22;
      id v29 = 0;
      LOBYTE(photoLibrary) = [(PHPhotoLibrary *)photoLibrary performChangesAndWait:v30 error:&v29];
      id v23 = v29;
      if (photoLibrary)
      {
        [(PHANotificationController *)self postNotificationForSuggestion:v22 deliveryDate:0];
        uint64_t v24 = v27;
        id v4 = v28;
      }
      else
      {
        if (__PXLoggraph_workerOnceToken != -1) {
          dispatch_once(&__PXLoggraph_workerOnceToken, &__block_literal_global_310);
        }
        uint64_t v24 = v27;
        id v4 = v28;
        uint64_t v26 = __PXLoggraph_workerOSLog;
        if (os_log_type_enabled((os_log_t)__PXLoggraph_workerOSLog, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 138412290;
          id v38 = v23;
          _os_log_error_impl(&dword_1D21F2000, v26, OS_LOG_TYPE_ERROR, "[Suggestions Notification] Failed to persist suggestions, not firing any notifications: %@", buf, 0xCu);
        }
      }
    }
    else
    {
LABEL_14:

LABEL_18:
      if (__PXLoggraph_workerOnceToken != -1) {
        dispatch_once(&__PXLoggraph_workerOnceToken, &__block_literal_global_306);
      }
      uint64_t v24 = v27;
      id v4 = v28;
      uint64_t v25 = __PXLoggraph_workerOSLog;
      if (os_log_type_enabled((os_log_t)__PXLoggraph_workerOSLog, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412290;
        id v38 = v28;
        _os_log_impl(&dword_1D21F2000, v25, OS_LOG_TYPE_DEFAULT, "[Suggestions Notification] Won't fire notification, bestSuggestionToNotify is nil. %@", buf, 0xCu);
      }
    }
  }
}

void __70__PHANotificationController_fireNotificationForSuggestionIdentifiers___block_invoke_307(uint64_t a1)
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  long long v9 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  id v2 = *(id *)(a1 + 32);
  uint64_t v3 = [v2 countByEnumeratingWithState:&v9 objects:v13 count:16];
  if (v3)
  {
    uint64_t v4 = v3;
    uint64_t v5 = *(void *)v10;
    do
    {
      for (uint64_t i = 0; i != v4; ++i)
      {
        if (*(void *)v10 != v5) {
          objc_enumerationMutation(v2);
        }
        uint64_t v7 = *(void *)(*((void *)&v9 + 1) + 8 * i);
        id v8 = objc_msgSend(MEMORY[0x1E4F39318], "changeRequestForSuggestion:", v7, (void)v9);
        [v8 markActive];
        if (v7 == *(void *)(a1 + 40)) {
          [v8 setNotificationState:1];
        }
      }
      uint64_t v4 = [v2 countByEnumeratingWithState:&v9 objects:v13 count:16];
    }
    while (v4);
  }
}

uint64_t __70__PHANotificationController_fireNotificationForSuggestionIdentifiers___block_invoke_2()
{
  __PXLoggraph_workerOSLog = (uint64_t)os_log_create("com.apple.photoanalysisd.graph", "worker");

  return MEMORY[0x1F41817F8]();
}

uint64_t __70__PHANotificationController_fireNotificationForSuggestionIdentifiers___block_invoke_304()
{
  __PXLoggraph_workerOSLog = (uint64_t)os_log_create("com.apple.photoanalysisd.graph", "worker");

  return MEMORY[0x1F41817F8]();
}

uint64_t __70__PHANotificationController_fireNotificationForSuggestionIdentifiers___block_invoke()
{
  __PXLoggraph_workerOSLog = (uint64_t)os_log_create("com.apple.photoanalysisd.graph", "worker");

  return MEMORY[0x1F41817F8]();
}

- (void)postNotificationForMemory:(id)a3 withCreationReason:(unint64_t)a4 forceImmediateDelivery:(BOOL)a5
{
  id v8 = a3;
  long long v9 = +[PHALocalNotificationInterface localNotificationInterface];
  long long v10 = [[PHANotificationOptions alloc] initWithType:0];
  long long v11 = (void *)MEMORY[0x1E4F39160];
  long long v12 = [v8 localIdentifier];
  uint64_t v13 = [v11 uuidFromLocalIdentifier:v12];

  [(PHANotificationOptions *)v10 setCollectionUUID:v13];
  uint64_t v14 = [MEMORY[0x1E4F1C9C8] date];
  [(PHANotificationOptions *)v10 setDeliveryDate:v14];

  if (a4 == 1) {
    int v15 = [MEMORY[0x1E4F8D968] isMemoriesLivingOnFeedbackEnabled] ^ 1;
  }
  else {
    int v15 = 1;
  }
  if (a4 != 3 && v15 && !a5)
  {
    uint64_t v16 = [(PHANotificationController *)self bestDateForDeliveringNotification];
    [(PHANotificationOptions *)v10 setDeliveryDate:v16];
  }
  uint64_t v17 = [MEMORY[0x1E4F38EB8] fetchKeyCuratedAssetInAssetCollection:v8 referenceAsset:0];
  v18 = [v17 firstObject];
  [(PHANotificationOptions *)v10 setKeyAsset:v18];

  v20[0] = MEMORY[0x1E4F143A8];
  v20[1] = 3221225472;
  v20[2] = __97__PHANotificationController_postNotificationForMemory_withCreationReason_forceImmediateDelivery___block_invoke;
  v20[3] = &unk_1E69189E0;
  v20[4] = self;
  id v21 = v8;
  id v19 = v8;
  [v9 fireLocalNotificationWithOptions:v10 completionHandler:v20];
}

void __97__PHANotificationController_postNotificationForMemory_withCreationReason_forceImmediateDelivery___block_invoke(uint64_t a1, int a2)
{
  if (a2)
  {
    [*(id *)(*(void *)(a1 + 32) + 24) sendEvent:@"com.apple.Photos.memories.notificationSent" withPayload:MEMORY[0x1E4F1CC08]];
    uint64_t v3 = *(void *)(a1 + 40);
    uint64_t v4 = [*(id *)(*(void *)(a1 + 32) + 32) workingContext];
    id v5 = +[PHAMetricsHelper fullMemoryTypeStringForMemory:v3 withWorkingContext:v4];

    +[PHAMemoryElectionTask sendNotifiedMemoriesPipelineAnalyticsEventWithMemoryType:v5 loggingConnection:*(void *)(*(void *)(a1 + 32) + 8) analytics:*(void *)(*(void *)(a1 + 32) + 24)];
  }
}

- (void)fireNotificationForMemoryIdentifiers:(id)a3 withCreationReason:(unint64_t)a4
{
  v48[2] = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  if ([v6 count])
  {
    unint64_t v34 = a4;
    uint64_t v7 = [(PHANotificationController *)self _userFeedbackCalculatorWithPhotoLibrary:self->_photoLibrary];
    id v8 = [(PHPhotoLibrary *)self->_photoLibrary librarySpecificFetchOptions];
    [v8 setIncludePendingMemories:1];
    long long v9 = [MEMORY[0x1E4F29008] sortDescriptorWithKey:@"creationDate" ascending:0];
    v48[0] = v9;
    long long v10 = [MEMORY[0x1E4F29008] sortDescriptorWithKey:@"uuid" ascending:0];
    v48[1] = v10;
    long long v11 = [MEMORY[0x1E4F1C978] arrayWithObjects:v48 count:2];
    [v8 setSortDescriptors:v11];

    long long v36 = v8;
    long long v12 = [MEMORY[0x1E4F38EE8] fetchAssetCollectionsWithLocalIdentifiers:v6 options:v8];
    long long v41 = 0u;
    long long v42 = 0u;
    long long v43 = 0u;
    long long v44 = 0u;
    uint64_t v13 = [v12 countByEnumeratingWithState:&v41 objects:v47 count:16];
    if (!v13) {
      goto LABEL_20;
    }
    uint64_t v14 = v13;
    id v35 = v6;
    int v15 = 0;
    uint64_t v16 = *(void *)v42;
    double v17 = 0.0;
    do
    {
      uint64_t v18 = 0;
      do
      {
        if (*(void *)v42 != v16) {
          objc_enumerationMutation(v12);
        }
        id v19 = *(void **)(*((void *)&v41 + 1) + 8 * v18);
        [v19 score];
        double v21 = v20;
        if (!v15 || v20 > v17)
        {
          id v22 = [v19 blockableFeatures];
          BOOL v23 = [(PHANotificationController *)self userFeedbackScoreIsAcceptableForAssetCollection:v19 memoryFeatures:v22 userFeedbackCalculator:v7];

          if (v23)
          {
            id v24 = v19;

            double v17 = v21;
            int v15 = v24;
          }
          else
          {
            if (__PXLoggraph_workerOnceToken != -1) {
              dispatch_once(&__PXLoggraph_workerOnceToken, &__block_literal_global_282);
            }
            uint64_t v25 = (void *)__PXLoggraph_workerOSLog;
            if (os_log_type_enabled((os_log_t)__PXLoggraph_workerOSLog, OS_LOG_TYPE_DEFAULT))
            {
              uint64_t v26 = v25;
              v27 = [v19 localIdentifier];
              *(_DWORD *)buf = 138412290;
              id v46 = v27;
              _os_log_impl(&dword_1D21F2000, v26, OS_LOG_TYPE_DEFAULT, "[Memories Notification] Skipping notification for memory %@: user feedback score is lower than acceptable.", buf, 0xCu);
            }
          }
        }
        ++v18;
      }
      while (v14 != v18);
      uint64_t v14 = [v12 countByEnumeratingWithState:&v41 objects:v47 count:16];
    }
    while (v14);
    id v6 = v35;
    if (v15)
    {
      photoLibrary = self->_photoLibrary;
      v38[0] = MEMORY[0x1E4F143A8];
      v38[1] = 3221225472;
      v38[2] = __85__PHANotificationController_fireNotificationForMemoryIdentifiers_withCreationReason___block_invoke_286;
      v38[3] = &unk_1E69189B0;
      id v39 = v12;
      id v29 = v15;
      id v40 = v29;
      id v37 = 0;
      LOBYTE(photoLibrary) = [(PHPhotoLibrary *)photoLibrary performChangesAndWait:v38 error:&v37];
      id v30 = v37;
      if (photoLibrary)
      {
        [(PHANotificationController *)self postNotificationForMemory:v29 withCreationReason:v34 forceImmediateDelivery:0];
        id v31 = v36;
      }
      else
      {
        if (__PXLoggraph_workerOnceToken != -1) {
          dispatch_once(&__PXLoggraph_workerOnceToken, &__block_literal_global_289);
        }
        id v31 = v36;
        long long v33 = __PXLoggraph_workerOSLog;
        if (os_log_type_enabled((os_log_t)__PXLoggraph_workerOSLog, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 138412290;
          id v46 = v30;
          _os_log_error_impl(&dword_1D21F2000, v33, OS_LOG_TYPE_ERROR, "[Memories Notification] Failed to persist memories, not firing any notifications: %@", buf, 0xCu);
        }
      }
    }
    else
    {
LABEL_20:
      if (__PXLoggraph_workerOnceToken != -1) {
        dispatch_once(&__PXLoggraph_workerOnceToken, &__block_literal_global_285);
      }
      id v31 = v36;
      id v32 = __PXLoggraph_workerOSLog;
      if (os_log_type_enabled((os_log_t)__PXLoggraph_workerOSLog, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412290;
        id v46 = v6;
        _os_log_impl(&dword_1D21F2000, v32, OS_LOG_TYPE_DEFAULT, "[Memories Notification] Failed to fire, bestMemoryToPersist is nil. %@", buf, 0xCu);
      }
    }
  }
}

void __85__PHANotificationController_fireNotificationForMemoryIdentifiers_withCreationReason___block_invoke_286(uint64_t a1)
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  long long v9 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  id v2 = *(id *)(a1 + 32);
  uint64_t v3 = [v2 countByEnumeratingWithState:&v9 objects:v13 count:16];
  if (v3)
  {
    uint64_t v4 = v3;
    uint64_t v5 = *(void *)v10;
    do
    {
      for (uint64_t i = 0; i != v4; ++i)
      {
        if (*(void *)v10 != v5) {
          objc_enumerationMutation(v2);
        }
        uint64_t v7 = *(void *)(*((void *)&v9 + 1) + 8 * i);
        id v8 = objc_msgSend(MEMORY[0x1E4F39170], "changeRequestForMemory:", v7, (void)v9);
        [v8 setPendingState:0];
        if (v7 == *(void *)(a1 + 40)) {
          [v8 setNotificationState:1];
        }
      }
      uint64_t v4 = [v2 countByEnumeratingWithState:&v9 objects:v13 count:16];
    }
    while (v4);
  }
}

uint64_t __85__PHANotificationController_fireNotificationForMemoryIdentifiers_withCreationReason___block_invoke_2()
{
  __PXLoggraph_workerOSLog = (uint64_t)os_log_create("com.apple.photoanalysisd.graph", "worker");

  return MEMORY[0x1F41817F8]();
}

uint64_t __85__PHANotificationController_fireNotificationForMemoryIdentifiers_withCreationReason___block_invoke_283()
{
  __PXLoggraph_workerOSLog = (uint64_t)os_log_create("com.apple.photoanalysisd.graph", "worker");

  return MEMORY[0x1F41817F8]();
}

uint64_t __85__PHANotificationController_fireNotificationForMemoryIdentifiers_withCreationReason___block_invoke()
{
  __PXLoggraph_workerOSLog = (uint64_t)os_log_create("com.apple.photoanalysisd.graph", "worker");

  return MEMORY[0x1F41817F8]();
}

- (id)_userFeedbackCalculatorWithPhotoLibrary:(id)a3
{
  userFeedbackCalculator = self->_userFeedbackCalculator;
  if (!userFeedbackCalculator)
  {
    uint64_t v5 = (objc_class *)MEMORY[0x1E4F39338];
    id v6 = a3;
    uint64_t v7 = (PHUserFeedbackCalculator *)[[v5 alloc] initWithPhotoLibrary:v6];

    id v8 = self->_userFeedbackCalculator;
    self->_userFeedbackCalculator = v7;

    userFeedbackCalculator = self->_userFeedbackCalculator;
  }

  return userFeedbackCalculator;
}

- (BOOL)shouldFireNotificationForMemoriesWithScores:(id)a3 withCreationReason:(unint64_t)a4
{
  uint64_t v44 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  if (![v6 count])
  {
    if (__PXLoggraph_workerOnceToken != -1) {
      dispatch_once(&__PXLoggraph_workerOnceToken, &__block_literal_global_7606);
    }
    int v15 = __PXLoggraph_workerOSLog;
    if (!os_log_type_enabled((os_log_t)__PXLoggraph_workerOSLog, OS_LOG_TYPE_INFO)) {
      goto LABEL_19;
    }
    *(_WORD *)buf = 0;
    uint64_t v16 = "[Memories Notification] Not firing: No memories";
    goto LABEL_18;
  }
  if (a4 == 1 && [MEMORY[0x1E4F8D968] isMemoriesLivingOnFeedbackEnabled])
  {
    if (__PXLoggraph_workerOnceToken != -1) {
      dispatch_once(&__PXLoggraph_workerOnceToken, &__block_literal_global_254);
    }
    uint64_t v7 = __PXLoggraph_workerOSLog;
    BOOL v8 = 1;
    if (os_log_type_enabled((os_log_t)__PXLoggraph_workerOSLog, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      long long v9 = "[Memories Notification] Forcing notification trigger because of memories living on feedback is enabled.";
      long long v10 = v7;
      uint32_t v11 = 2;
LABEL_13:
      _os_log_impl(&dword_1D21F2000, v10, OS_LOG_TYPE_INFO, v9, buf, v11);
      goto LABEL_52;
    }
    goto LABEL_52;
  }
  long long v12 = [MEMORY[0x1E4F1CB18] standardUserDefaults];
  int v13 = [v12 BOOLForKey:@"PhotoAnalysisShouldForceTriggerNotification"];

  if (!v13)
  {
    long long v39 = 0u;
    long long v40 = 0u;
    long long v37 = 0u;
    long long v38 = 0u;
    id v17 = v6;
    uint64_t v18 = [v17 countByEnumeratingWithState:&v37 objects:v41 count:16];
    if (v18)
    {
      uint64_t v19 = v18;
      char v20 = 0;
      uint64_t v21 = *(void *)v38;
      double v22 = *MEMORY[0x1E4F397A0];
      double v23 = *MEMORY[0x1E4F39798];
      while (2)
      {
        for (uint64_t i = 0; i != v19; ++i)
        {
          if (*(void *)v38 != v21) {
            objc_enumerationMutation(v17);
          }
          objc_msgSend(*(id *)(*((void *)&v37 + 1) + 8 * i), "doubleValue", (void)v37);
          if (v25 > v22)
          {

            goto LABEL_43;
          }
          v20 |= v25 > v23;
        }
        uint64_t v19 = [v17 countByEnumeratingWithState:&v37 objects:v41 count:16];
        if (v19) {
          continue;
        }
        break;
      }
    }
    else
    {
      char v20 = 0;
    }

    uint64_t v26 = [MEMORY[0x1E4F1CB18] standardUserDefaults];
    int v27 = [v26 BOOLForKey:@"PhotoAnalysisShouldTriggerNotificationEveryDay"];

    if (v27)
    {
      if (__PXLoggraph_workerOnceToken != -1) {
        dispatch_once(&__PXLoggraph_workerOnceToken, &__block_literal_global_261);
      }
      id v28 = __PXLoggraph_workerOSLog;
      if (os_log_type_enabled((os_log_t)__PXLoggraph_workerOSLog, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 138412290;
        long long v43 = @"PhotoAnalysisShouldTriggerNotificationEveryDay";
        _os_log_impl(&dword_1D21F2000, v28, OS_LOG_TYPE_INFO, "[Memories Notification] Not checking time interval because of user defaults %@", buf, 0xCu);
      }
    }
    else
    {
      id v29 = [MEMORY[0x1E4F8D7A8] nextPossibleNotificationDateWithPhotoLibrary:self->_photoLibrary];
      id v30 = [MEMORY[0x1E4F1C9C8] date];
      if ([v30 compare:v29] == -1)
      {
        if (__PXLoggraph_workerOnceToken != -1) {
          dispatch_once(&__PXLoggraph_workerOnceToken, &__block_literal_global_266);
        }
        long long v36 = __PXLoggraph_workerOSLog;
        if (os_log_type_enabled((os_log_t)__PXLoggraph_workerOSLog, OS_LOG_TYPE_INFO))
        {
          *(_DWORD *)buf = 138412290;
          long long v43 = v29;
          _os_log_impl(&dword_1D21F2000, v36, OS_LOG_TYPE_INFO, "[Memories Notification] Not firing: Too soon to trigger, will be available on %@", buf, 0xCu);
        }

        goto LABEL_19;
      }
      if (__PXLoggraph_workerOnceToken != -1) {
        dispatch_once(&__PXLoggraph_workerOnceToken, &__block_literal_global_269);
      }
      id v31 = __PXLoggraph_workerOSLog;
      if (os_log_type_enabled((os_log_t)__PXLoggraph_workerOSLog, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 138412290;
        long long v43 = v29;
        _os_log_impl(&dword_1D21F2000, v31, OS_LOG_TYPE_INFO, "[Memories Notification] Next possible date is %@", buf, 0xCu);
      }
    }
    if ((a4 == 3) | v20 & 1)
    {
LABEL_43:
      id v32 = objc_msgSend(MEMORY[0x1E4F1C9A8], "currentCalendar", (void)v37);
      long long v33 = [MEMORY[0x1E4F8D7A8] lastTriggeredNotificationDateWithPhotoLibrary:self->_photoLibrary];
      if (v33 && [v32 isDateInToday:v33])
      {
        if (__PXLoggraph_workerOnceToken != -1) {
          dispatch_once(&__PXLoggraph_workerOnceToken, &__block_literal_global_276);
        }
        unint64_t v34 = __PXLoggraph_workerOSLog;
        if (os_log_type_enabled((os_log_t)__PXLoggraph_workerOSLog, OS_LOG_TYPE_INFO))
        {
          *(_WORD *)buf = 0;
          _os_log_impl(&dword_1D21F2000, v34, OS_LOG_TYPE_INFO, "[Memories Notification] Not firing: User already had a notification today", buf, 2u);
        }
        BOOL v8 = 0;
      }
      else
      {
        BOOL v8 = 1;
      }

      goto LABEL_52;
    }
    if (__PXLoggraph_workerOnceToken != -1) {
      dispatch_once(&__PXLoggraph_workerOnceToken, &__block_literal_global_272_7615);
    }
    int v15 = __PXLoggraph_workerOSLog;
    if (!os_log_type_enabled((os_log_t)__PXLoggraph_workerOSLog, OS_LOG_TYPE_INFO))
    {
LABEL_19:
      BOOL v8 = 0;
      goto LABEL_52;
    }
    *(_WORD *)buf = 0;
    uint64_t v16 = "[Memories Notification] Not firing: Generated memories are not worth a notification";
LABEL_18:
    _os_log_impl(&dword_1D21F2000, v15, OS_LOG_TYPE_INFO, v16, buf, 2u);
    goto LABEL_19;
  }
  if (__PXLoggraph_workerOnceToken != -1) {
    dispatch_once(&__PXLoggraph_workerOnceToken, &__block_literal_global_258);
  }
  uint64_t v14 = __PXLoggraph_workerOSLog;
  BOOL v8 = 1;
  if (os_log_type_enabled((os_log_t)__PXLoggraph_workerOSLog, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 138412290;
    long long v43 = @"PhotoAnalysisShouldForceTriggerNotification";
    long long v9 = "[Memories Notification] Forcing notification trigger because of user defaults %@";
    long long v10 = v14;
    uint32_t v11 = 12;
    goto LABEL_13;
  }
LABEL_52:

  return v8;
}

uint64_t __92__PHANotificationController_shouldFireNotificationForMemoriesWithScores_withCreationReason___block_invoke_274()
{
  __PXLoggraph_workerOSLog = (uint64_t)os_log_create("com.apple.photoanalysisd.graph", "worker");

  return MEMORY[0x1F41817F8]();
}

uint64_t __92__PHANotificationController_shouldFireNotificationForMemoriesWithScores_withCreationReason___block_invoke_270()
{
  __PXLoggraph_workerOSLog = (uint64_t)os_log_create("com.apple.photoanalysisd.graph", "worker");

  return MEMORY[0x1F41817F8]();
}

uint64_t __92__PHANotificationController_shouldFireNotificationForMemoriesWithScores_withCreationReason___block_invoke_267()
{
  __PXLoggraph_workerOSLog = (uint64_t)os_log_create("com.apple.photoanalysisd.graph", "worker");

  return MEMORY[0x1F41817F8]();
}

uint64_t __92__PHANotificationController_shouldFireNotificationForMemoriesWithScores_withCreationReason___block_invoke_264()
{
  __PXLoggraph_workerOSLog = (uint64_t)os_log_create("com.apple.photoanalysisd.graph", "worker");

  return MEMORY[0x1F41817F8]();
}

uint64_t __92__PHANotificationController_shouldFireNotificationForMemoriesWithScores_withCreationReason___block_invoke_259()
{
  __PXLoggraph_workerOSLog = (uint64_t)os_log_create("com.apple.photoanalysisd.graph", "worker");

  return MEMORY[0x1F41817F8]();
}

uint64_t __92__PHANotificationController_shouldFireNotificationForMemoriesWithScores_withCreationReason___block_invoke_256()
{
  __PXLoggraph_workerOSLog = (uint64_t)os_log_create("com.apple.photoanalysisd.graph", "worker");

  return MEMORY[0x1F41817F8]();
}

uint64_t __92__PHANotificationController_shouldFireNotificationForMemoriesWithScores_withCreationReason___block_invoke_252()
{
  __PXLoggraph_workerOSLog = (uint64_t)os_log_create("com.apple.photoanalysisd.graph", "worker");

  return MEMORY[0x1F41817F8]();
}

uint64_t __92__PHANotificationController_shouldFireNotificationForMemoriesWithScores_withCreationReason___block_invoke()
{
  __PXLoggraph_workerOSLog = (uint64_t)os_log_create("com.apple.photoanalysisd.graph", "worker");

  return MEMORY[0x1F41817F8]();
}

- (id)bestDateForDeliveringNotification
{
  return (id)[MEMORY[0x1E4F8A9D8] _notificationDeliveryDate];
}

- (BOOL)userIsActivelyUsingPhotos
{
  if (+[PHANotificationCoreDuetHelper userIsActivelyUsingAppWithName:@"com.apple.mobileslideshow" error:0])
  {
    return 1;
  }

  return +[PHANotificationCoreDuetHelper userIsActivelyUsingAppWithName:@"com.apple.camera" error:0];
}

- (PHANotificationController)initWithGraphManager:(id)a3
{
  id v5 = a3;
  v15.receiver = self;
  v15.super_class = (Class)PHANotificationController;
  id v6 = [(PHANotificationController *)&v15 init];
  uint64_t v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_graphManager, a3);
    uint64_t v8 = [v5 photoLibrary];
    photoLibrary = v7->_photoLibrary;
    v7->_photoLibrary = (PHPhotoLibrary *)v8;

    uint64_t v10 = [v5 analytics];
    analytics = v7->_analytics;
    v7->_analytics = (CPAnalytics *)v10;

    os_log_t v12 = os_log_create("com.apple.photoanalysisd", "notifications");
    loggingConnection = v7->_loggingConnection;
    v7->_loggingConnection = (OS_os_log *)v12;
  }
  return v7;
}

- (PHANotificationController)initWithGraphManager:(id)a3 userFeedbackCalculator:(id)a4
{
  id v7 = a4;
  uint64_t v8 = [(PHANotificationController *)self initWithGraphManager:a3];
  long long v9 = v8;
  if (v8) {
    objc_storeStrong((id *)&v8->_userFeedbackCalculator, a4);
  }

  return v9;
}

@end