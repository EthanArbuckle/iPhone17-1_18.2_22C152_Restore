@interface PXPhotoKitAssetCollectionBlacklistMemoryFeatureActionPerformer
+ (BOOL)canPerformOnAssetCollectionReference:(id)a3 withInputs:(id)a4;
+ (id)createActivityWithTitle:(id)a3 actionType:(id)a4 actionSystemImageName:(id)a5;
- (BOOL)isBlockingMemoryFeature;
- (BOOL)suggestLessPeopleHelper:(id)a3 dismissViewController:(id)a4 completionHandler:(id)a5;
- (BOOL)suggestLessPeopleHelper:(id)a3 presentViewController:(id)a4;
- (NSString)userResponse;
- (PXSuggestLessPeopleHelper)suggestLessPeopleHelper;
- (id)_memoryFeatureFromMemory:(id)a3 forActionType:(id)a4;
- (unint64_t)_memoryFeatureTypeFromActionType:(id)a3;
- (void)applyBlacklistFeatureWithActionType:(id)a3;
- (void)confirmBlacklistingUserAction:(id)a3 viewSpec:(id)a4;
- (void)performBackgroundTask;
- (void)performUserInteractionTask;
- (void)setIsBlockingMemoryFeature:(BOOL)a3;
- (void)setSuggestLessPeopleHelper:(id)a3;
- (void)setUserResponse:(id)a3;
- (void)suggestLessPeopleInMemory:(id)a3;
@end

@implementation PXPhotoKitAssetCollectionBlacklistMemoryFeatureActionPerformer

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_suggestLessPeopleHelper, 0);
  objc_storeStrong((id *)&self->_userResponse, 0);
}

- (void)setSuggestLessPeopleHelper:(id)a3
{
}

- (PXSuggestLessPeopleHelper)suggestLessPeopleHelper
{
  return self->_suggestLessPeopleHelper;
}

- (void)setIsBlockingMemoryFeature:(BOOL)a3
{
  self->_isBlockingMemoryFeature = a3;
}

- (BOOL)isBlockingMemoryFeature
{
  return self->_isBlockingMemoryFeature;
}

- (void)setUserResponse:(id)a3
{
}

- (NSString)userResponse
{
  return self->_userResponse;
}

- (void)applyBlacklistFeatureWithActionType:(id)a3
{
  v16[1] = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v5 = [(PXAssetCollectionActionPerformer *)self assetCollection];
  unint64_t v6 = [(PXPhotoKitAssetCollectionBlacklistMemoryFeatureActionPerformer *)self _memoryFeatureTypeFromActionType:v4];

  v7 = [PXRejectMemoriesAction alloc];
  v16[0] = v5;
  v8 = [MEMORY[0x1E4F1C978] arrayWithObjects:v16 count:1];
  v9 = [(PXMemoriesAction *)v7 initWithMemories:v8];

  [(PXRejectMemoriesAction *)v9 setFeatureType:v6];
  [(PXRejectMemoriesAction *)v9 setRejectReason:1];
  v10 = [(PXActionPerformer *)self undoManager];
  v12[0] = MEMORY[0x1E4F143A8];
  v12[1] = 3221225472;
  v12[2] = __102__PXPhotoKitAssetCollectionBlacklistMemoryFeatureActionPerformer_applyBlacklistFeatureWithActionType___block_invoke;
  v12[3] = &unk_1E5DC63E8;
  id v13 = v5;
  v14 = self;
  unint64_t v15 = v6;
  id v11 = v5;
  [(PXAction *)v9 executeWithUndoManager:v10 completionHandler:v12];
}

void __102__PXPhotoKitAssetCollectionBlacklistMemoryFeatureActionPerformer_applyBlacklistFeatureWithActionType___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  v14[2] = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  if (a2)
  {
    uint64_t v6 = *MEMORY[0x1E4F56548];
    v14[0] = *(void *)(a1 + 32);
    uint64_t v7 = *MEMORY[0x1E4F56560];
    v13[0] = v6;
    v13[1] = v7;
    v8 = (objc_class *)objc_opt_class();
    v9 = NSStringFromClass(v8);
    v14[1] = v9;
    v10 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v14 forKeys:v13 count:2];

    [MEMORY[0x1E4F56658] sendEvent:@"com.apple.photos.CPAnalytics.assetCollectionBlocked" withPayload:v10];
    id v11 = (void *)MEMORY[0x1E4F56658];
    v12 = PXAnalyticsEventFromMemoryFeatureType(*(void *)(a1 + 48));
    [v11 sendEvent:v12 withPayload:v10];
  }
  [*(id *)(a1 + 40) completeBackgroundTaskWithSuccess:a2 error:v5];
}

- (void)performBackgroundTask
{
  if ([(PXPhotoKitAssetCollectionBlacklistMemoryFeatureActionPerformer *)self isBlockingMemoryFeature])
  {
    id v3 = [(PXActionPerformer *)self actionType];
    [(PXPhotoKitAssetCollectionBlacklistMemoryFeatureActionPerformer *)self applyBlacklistFeatureWithActionType:v3];
  }
}

- (id)_memoryFeatureFromMemory:(id)a3 forActionType:(id)a4
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  unint64_t v7 = [(PXPhotoKitAssetCollectionBlacklistMemoryFeatureActionPerformer *)self _memoryFeatureTypeFromActionType:a4];
  long long v16 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  v8 = objc_msgSend(v6, "blockableFeatures", 0);
  uint64_t v9 = [v8 countByEnumeratingWithState:&v16 objects:v20 count:16];
  if (v9)
  {
    uint64_t v10 = v9;
    uint64_t v11 = *(void *)v17;
    while (2)
    {
      for (uint64_t i = 0; i != v10; ++i)
      {
        if (*(void *)v17 != v11) {
          objc_enumerationMutation(v8);
        }
        id v13 = *(void **)(*((void *)&v16 + 1) + 8 * i);
        if (([v13 type] & v7) != 0)
        {
          id v14 = v13;
          goto LABEL_11;
        }
      }
      uint64_t v10 = [v8 countByEnumeratingWithState:&v16 objects:v20 count:16];
      if (v10) {
        continue;
      }
      break;
    }
  }
  id v14 = 0;
LABEL_11:

  return v14;
}

- (unint64_t)_memoryFeatureTypeFromActionType:(id)a3
{
  id v3 = a3;
  if (([v3 isEqualToString:@"PXAssetCollectionActionTypeBlockMemoryFeatureTimeDate"] & 1) != 0
    || ([v3 isEqualToString:@"PXAssetCollectionActionTypeBlockMemoryFeatureHoliday"] & 1) != 0
    || ([v3 isEqualToString:@"PXAssetCollectionActionTypeBlockMemoryFeatureTimeDateInterval"] & 1) != 0)
  {
    unint64_t v4 = 1008;
  }
  else if ([v3 isEqualToString:@"PXAssetCollectionActionTypeBlockMemoryFeaturePlace"])
  {
    unint64_t v4 = 520192;
  }
  else if ([v3 isEqualToString:@"PXAssetCollectionActionTypeBlockMemoryFeaturePerson"])
  {
    unint64_t v4 = 3;
  }
  else
  {
    unint64_t v4 = 0;
  }

  return v4;
}

- (void)suggestLessPeopleInMemory:(id)a3
{
  v32[1] = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v5 = [PXSuggestLessPeopleHelper alloc];
  id v6 = [(PXActionPerformer *)self undoManager];
  unint64_t v7 = [(PXSuggestLessPeopleHelper *)v5 initWithUndoManager:v6];
  [(PXPhotoKitAssetCollectionBlacklistMemoryFeatureActionPerformer *)self setSuggestLessPeopleHelper:v7];

  v8 = [(PXPhotoKitAssetCollectionBlacklistMemoryFeatureActionPerformer *)self suggestLessPeopleHelper];
  [v8 setDelegate:self];

  uint64_t v9 = [v4 photoLibrary];
  uint64_t v10 = [v9 librarySpecificFetchOptions];

  uint64_t v11 = objc_msgSend(MEMORY[0x1E4F390A0], "px_defaultDetectionTypes");
  [v10 setIncludedDetectionTypes:v11];

  v32[0] = *MEMORY[0x1E4F397E0];
  v12 = [MEMORY[0x1E4F1C978] arrayWithObjects:v32 count:1];
  [v10 setFetchPropertySets:v12];

  [v10 setPersonContext:3];
  v29 = [MEMORY[0x1E4F391F0] fetchPersonsForAssetCollection:v4 options:v10];
  id v13 = [v29 fetchedObjects];
  id v14 = +[PXPeopleWidgetUtilities verifiedPersonsFromMergeCandidatesForPersons:v13];

  unint64_t v15 = [v14 allObjects];
  long long v16 = [v4 blockableFeatures];
  long long v17 = +[PXPeopleUtilities sortedPersons:v15 byPersonMemoryFeatures:v16];

  [v10 setFetchLimit:0];
  id v18 = objc_alloc(MEMORY[0x1E4F39150]);
  long long v19 = [v4 photoLibrary];
  v20 = [MEMORY[0x1E4F391F0] fetchType];
  uint64_t v21 = (void *)MEMORY[0x1E4F1CAD0];
  v22 = [v10 fetchPropertySets];
  v23 = [v21 setWithArray:v22];
  v24 = (void *)[v18 initWithObjects:v17 photoLibrary:v19 fetchType:v20 fetchPropertySets:v23 identifier:0 registerIfNeeded:0];

  v25 = [(PXActionPerformer *)self undoManager];
  [v25 beginUndoGrouping];

  v26 = [(PXPhotoKitAssetCollectionBlacklistMemoryFeatureActionPerformer *)self suggestLessPeopleHelper];
  v27 = [v24 fetchedObjects];
  v30[0] = MEMORY[0x1E4F143A8];
  v30[1] = 3221225472;
  v30[2] = __92__PXPhotoKitAssetCollectionBlacklistMemoryFeatureActionPerformer_suggestLessPeopleInMemory___block_invoke;
  v30[3] = &unk_1E5DD2570;
  v30[4] = self;
  id v31 = v4;
  id v28 = v4;
  [v26 suggestLessPeople:v27 completionHandler:v30];
}

void __92__PXPhotoKitAssetCollectionBlacklistMemoryFeatureActionPerformer_suggestLessPeopleInMemory___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  if (!v5 && (a2 & 1) != 0)
  {
    id v6 = [PXRejectMemoriesAction alloc];
    uint64_t v12 = *(void *)(a1 + 40);
    unint64_t v7 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v12 count:1];
    v8 = [(PXMemoriesAction *)v6 initWithMemories:v7];

    *(id *)(a1 + 40);
    uint64_t v9 = v8;
    px_dispatch_on_main_queue();
  }
  uint64_t v10 = PLUIGetLog();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 138412290;
    id v14 = v5;
    _os_log_impl(&dword_1A9AE7000, v10, OS_LOG_TYPE_ERROR, "Could not suggest this person less: %@", buf, 0xCu);
  }

  [*(id *)(a1 + 32) completeUserInteractionTaskWithSuccess:a2 error:v5];
  uint64_t v11 = [*(id *)(a1 + 32) undoManager];
  [v11 endUndoGrouping];
}

void __92__PXPhotoKitAssetCollectionBlacklistMemoryFeatureActionPerformer_suggestLessPeopleInMemory___block_invoke_638(uint64_t a1)
{
  v2 = *(void **)(a1 + 32);
  id v3 = [*(id *)(a1 + 40) undoManager];
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __92__PXPhotoKitAssetCollectionBlacklistMemoryFeatureActionPerformer_suggestLessPeopleInMemory___block_invoke_2;
  v6[3] = &unk_1E5DD2570;
  id v4 = *(id *)(a1 + 48);
  uint64_t v5 = *(void *)(a1 + 40);
  id v7 = v4;
  uint64_t v8 = v5;
  [v2 executeWithUndoManager:v3 completionHandler:v6];
}

void __92__PXPhotoKitAssetCollectionBlacklistMemoryFeatureActionPerformer_suggestLessPeopleInMemory___block_invoke_2(uint64_t a1, uint64_t a2, void *a3)
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  id v6 = PLMemoriesGetLog();
  id v7 = v6;
  if (a2)
  {
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v8 = *(void *)(a1 + 32);
      int v15 = 138412290;
      uint64_t v16 = v8;
      uint64_t v9 = "Did reject memory: %@";
      uint64_t v10 = v7;
      os_log_type_t v11 = OS_LOG_TYPE_DEFAULT;
      uint32_t v12 = 12;
LABEL_6:
      _os_log_impl(&dword_1A9AE7000, v10, v11, v9, (uint8_t *)&v15, v12);
    }
  }
  else if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
  {
    uint64_t v13 = *(void *)(a1 + 32);
    int v15 = 138412546;
    uint64_t v16 = v13;
    __int16 v17 = 2112;
    id v18 = v5;
    uint64_t v9 = "Failed to reject memory: %@, error: %@";
    uint64_t v10 = v7;
    os_log_type_t v11 = OS_LOG_TYPE_ERROR;
    uint32_t v12 = 22;
    goto LABEL_6;
  }

  [*(id *)(a1 + 40) completeUserInteractionTaskWithSuccess:a2 error:v5];
  id v14 = [*(id *)(a1 + 40) undoManager];
  [v14 endUndoGrouping];
}

- (BOOL)suggestLessPeopleHelper:(id)a3 dismissViewController:(id)a4 completionHandler:(id)a5
{
  return [(PXActionPerformer *)self dismissViewController:a4 completionHandler:a5];
}

- (BOOL)suggestLessPeopleHelper:(id)a3 presentViewController:(id)a4
{
  return [(PXActionPerformer *)self presentViewController:a4];
}

- (void)performUserInteractionTask
{
  id v6 = [(PXActionPerformer *)self actionType];
  id v3 = [(PXAssetCollectionActionPerformer *)self assetCollection];
  id v4 = [(PXPhotoKitAssetCollectionBlacklistMemoryFeatureActionPerformer *)self _memoryFeatureFromMemory:v3 forActionType:v6];
  if ([v6 isEqualToString:@"PXAssetCollectionActionTypeBlockMemoryFeaturePerson"])
  {
    [(PXPhotoKitAssetCollectionBlacklistMemoryFeatureActionPerformer *)self suggestLessPeopleInMemory:v3];
  }
  else
  {
    id v5 = +[PXMemoriesBlacklistUtilities accessoryUIViewSpecForBlacklistedFeature:v4];
    [(PXPhotoKitAssetCollectionBlacklistMemoryFeatureActionPerformer *)self confirmBlacklistingUserAction:v6 viewSpec:v5];
  }
}

- (void)confirmBlacklistingUserAction:(id)a3 viewSpec:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  [(PXPhotoKitAssetCollectionBlacklistMemoryFeatureActionPerformer *)self setIsBlockingMemoryFeature:1];
  [(PXPhotoKitAssetCollectionBlacklistMemoryFeatureActionPerformer *)self setUserResponse:v7];
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __105__PXPhotoKitAssetCollectionBlacklistMemoryFeatureActionPerformer_confirmBlacklistingUserAction_viewSpec___block_invoke;
  v8[3] = &unk_1E5DD2188;
  v8[4] = self;
  [(PXPhotoKitAssetCollectionActionPerformer *)self _promptBlacklistingConfirmatonForUserAction:v7 viewSpec:v6 completionHandler:v8];
}

void __105__PXPhotoKitAssetCollectionBlacklistMemoryFeatureActionPerformer_confirmBlacklistingUserAction_viewSpec___block_invoke(uint64_t a1, int a2)
{
  v2 = *(void **)(a1 + 32);
  if (a2)
  {
    id v3 = *(void **)(a1 + 32);
    [v3 completeUserInteractionTaskWithSuccess:1 error:0];
  }
  else
  {
    objc_msgSend(MEMORY[0x1E4F28C58], "px_genericErrorWithDebugDescription:", @"User cancelled confirmation alert");
    id v4 = (id)objc_claimAutoreleasedReturnValue();
    [v2 completeUserInteractionTaskWithSuccess:0 error:v4];
  }
}

+ (id)createActivityWithTitle:(id)a3 actionType:(id)a4 actionSystemImageName:(id)a5
{
  return 0;
}

+ (BOOL)canPerformOnAssetCollectionReference:(id)a3 withInputs:(id)a4
{
  id v4 = [a3 assetCollection];
  objc_opt_class();
  char isKindOfClass = objc_opt_isKindOfClass();

  return isKindOfClass & 1;
}

@end