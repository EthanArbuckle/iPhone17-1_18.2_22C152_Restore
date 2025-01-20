@interface TPSTipsManager
+ (BOOL)deviceLocalesContainLanguage:(id)a3;
+ (BOOL)needImmediateNotificationForType:(unint64_t)a3;
+ (BOOL)setTipKitContentProcessFlagIfNeeded;
+ (BOOL)supportsFeaturedCollection;
+ (id)experiment;
+ (id)immediateNotificationIdentifierForType:(unint64_t)a3;
+ (id)rulesVersion;
+ (void)removeExperimentCache;
+ (void)removeWelcomeDocumentCache;
+ (void)removeWidgetUpdateDate;
+ (void)resetTipKitContentProcessingFlag;
- (BOOL)checklistCollectionHasMinSuggestedTips:(id)a3 tipMap:(id)a4;
- (BOOL)contextualTipsInactive;
- (BOOL)hasWidgetDocument;
- (BOOL)isContentIdentifierHoldoutCamp:(id)a3;
- (BOOL)isHardwareWelcome;
- (BOOL)isPreconditionValidForIdentifier:(id)a3 preconditionDictionary:(id)a4;
- (BOOL)shouldPerformWidgetUpdate;
- (BOOL)widgetController:(id)a3 validForDocument:(id)a4 documentDeliveryInfoMap:(id)a5 deliveryInfoMap:(id)a6;
- (NSArray)collections;
- (NSArray)tips;
- (NSDictionary)cachedUserGuideMap;
- (NSDictionary)collectionsMap;
- (NSDictionary)tipsMap;
- (NSMutableArray)sessionItems;
- (NSString)lastFetchedLanguage;
- (NSString)rulesVersion;
- (OS_dispatch_queue)syncQueue;
- (TPSExperiment)experiment;
- (TPSMetadata)metadata;
- (TPSNotificationController)notificationController;
- (TPSTipStatusController)tipStatusController;
- (TPSTipsManager)initWithTipStatusController:(id)a3;
- (TPSTipsManagerDelegate)delegate;
- (TPSWidgetController)widgetController;
- (id)collectionSectionMapWithCollections:(id)a3 availableCollectionSections:(id)a4 collectionIdToCollectionLabelMap:(id)a5;
- (id)collectionSectionsFromCollectionMap:(id)a3 exclude:(id)a4;
- (id)collectionSectionsWithEligibleCollectionSections:(id)a3 collectionSectionMap:(id)a4 featuredCollection:(id)a5;
- (id)collectionStatusForCollection:(id)a3;
- (id)featureCollectionFromCollectionMap:(id)a3 collectionOrder:(id)a4 tipMap:(id)a5;
- (id)processUserGuidesFromContentPackage:(id)a3;
- (id)updateDocumentContent:(id)a3 withClientConditions:(id)a4 checklistCompletedConditions:(id)a5 usingDictionary:(id)a6;
- (id)welcomeCollectionFromContentPackage:(id)a3;
- (id)welcomeDocumentFromContentPackage:(id)a3;
- (void)_updateExperimentCache;
- (void)_updatePauseStatus:(BOOL)a3;
- (void)clearCachedUserGuides;
- (void)contentForVariantIdentifiers:(id)a3 completionHandler:(id)a4;
- (void)contentFromOrigin:(BOOL)a3 processTipKitContent:(BOOL)a4 contextualEligibility:(BOOL)a5 widgetEligibility:(BOOL)a6 notificationEligibility:(BOOL)a7 preferredNotificationIdentifiers:(id)a8 shouldDeferBlock:(id)a9 completionHandler:(id)a10;
- (void)contentWithMetaDictionary:(id)a3 documents:(id)a4 isRemote:(BOOL)a5 processTipKitContent:(BOOL)a6 contextualEligibility:(BOOL)a7 widgetEligibility:(BOOL)a8 notificationEligibility:(BOOL)a9 preferredNotificationIdentifiers:(id)a10 completionHandler:(id)a11;
- (void)deleteAllSearchableItemsWithCompletionHandler:(id)a3;
- (void)finalEligibleContentWithCollections:(id)a3 collectionsMap:(id)a4 collectionDeliveryInfoMap:(id)a5 eligibleTipIdentifiers:(id)a6 eligibleContextualTipIdentifiers:(id)a7 allFullTipsMap:(id)a8 allMiniTipsMap:(id)a9 tipDeliveryInfoMap:(id)a10 deliveryInfoMap:(id)a11 completionHandler:(id)a12;
- (void)processClientConditions:(id)a3 targetingCache:(id)a4 completionHandler:(id)a5;
- (void)processCollection:(id)a3 collectionsMap:(id)a4 ignoreSection:(BOOL)a5 completionHandler:(id)a6;
- (void)processTipDocumentsDictionary:(id)a3 completionHandler:(id)a4;
- (void)processTipsDeliveryInfo:(id)a3 deliveryInfoMap:(id)a4 targetingCache:(id)a5 completionHandler:(id)a6;
- (void)reindexAllSearchableItemsWithCompletionHandler:(id)a3;
- (void)reindexSearchableItemsWithIdentifiers:(id)a3 completionHandler:(id)a4;
- (void)setCachedUserGuideMap:(id)a3;
- (void)setCollections:(id)a3;
- (void)setCollectionsMap:(id)a3;
- (void)setContextualTipsInactive:(BOOL)a3;
- (void)setDelegate:(id)a3;
- (void)setExperiment:(id)a3;
- (void)setLastFetchedLanguage:(id)a3;
- (void)setMetadata:(id)a3;
- (void)setNotificationController:(id)a3;
- (void)setRulesVersion:(id)a3;
- (void)setSessionItems:(id)a3;
- (void)setSyncQueue:(id)a3;
- (void)setTipStatusController:(id)a3;
- (void)setTips:(id)a3;
- (void)setTipsMap:(id)a3;
- (void)setWidgetController:(id)a3;
- (void)updateContentIfOverrideImmediately:(BOOL)a3;
- (void)updateSupplementalIdentifiersForIdentifier:(id)a3 fromDictionary:(id)a4;
@end

@implementation TPSTipsManager

void __91__TPSTipsManager_processTipsDeliveryInfo_deliveryInfoMap_targetingCache_completionHandler___block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  id v5 = a2;
  v6 = [MEMORY[0x1E4FAF4B8] deliveryInfoIdForDictionary:a3];
  v7 = [*(id *)(a1 + 32) TPSSafeDictionaryForKey:v6];
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 80));
  v9 = [v7 TPSSafeArrayForKey:@"displayBundleIds"];
  v10 = [v9 firstObject];

  if (v10) {
    goto LABEL_28;
  }
  uint64_t v11 = [v7 TPSSafeBoolForKey:@"overrideHoldout"];
  v12 = [WeakRetained tipStatusController];
  [v12 updateOverrideHoldoutForIdentifier:v5 value:v11];

  uint64_t v13 = [v7 TPSSafeBoolForKey:@"overrideFrequencyControl"];
  v14 = [WeakRetained tipStatusController];
  [v14 updateOverrideFrequencyControlForIdentifier:v5 value:v13];

  v15 = [v7 TPSSafeObjectForKey:@"triggers"];
  v45 = v6;
  if (v15)
  {
  }
  else
  {
    v16 = [v7 TPSSafeObjectForKey:@"desiredOutcome"];

    if (!v16)
    {
      int v20 = 0;
      int v18 = 1;
      goto LABEL_9;
    }
  }
  v17 = [WeakRetained tipStatusController];
  if ([v17 isContentNeverVisibleForIdentifier:v5])
  {
    int v18 = 1;
  }
  else
  {
    v19 = [MEMORY[0x1E4FAF4A8] sharedInstance];
    int v18 = [v19 isSavedWithTipIdentifier:v5] ^ 1;
  }
  int v20 = 1;
LABEL_9:
  uint64_t v21 = [v7 TPSSafeDictionaryForKey:@"preconditions"];
  v47 = (void *)v21;
  if (v18) {
    v22 = [[TPSDeliveryPrecondition alloc] initWithDictionary:v21];
  }
  else {
    v22 = 0;
  }
  aBlock[0] = MEMORY[0x1E4F143A8];
  aBlock[1] = 3221225472;
  aBlock[2] = __91__TPSTipsManager_processTipsDeliveryInfo_deliveryInfoMap_targetingCache_completionHandler___block_invoke_2;
  aBlock[3] = &unk_1E6E6B730;
  char v64 = v11;
  uint64_t v23 = *(void *)(a1 + 56);
  aBlock[4] = WeakRetained;
  uint64_t v63 = v23;
  id v44 = v5;
  id v24 = v5;
  id v62 = v24;
  v25 = _Block_copy(aBlock);
  v26 = [(TPSDeliveryPrecondition *)v22 conditions];
  uint64_t v27 = [v26 count];

  v46 = v22;
  if (v27)
  {
    id v28 = objc_alloc(MEMORY[0x1E4FAF3C8]);
    v53[0] = MEMORY[0x1E4F143A8];
    v53[1] = 3221225472;
    v53[2] = __91__TPSTipsManager_processTipsDeliveryInfo_deliveryInfoMap_targetingCache_completionHandler___block_invoke_227;
    v53[3] = &unk_1E6E6B7A8;
    v43 = &v54;
    v29 = v24;
    id v30 = v24;
    id v54 = v30;
    v55 = v22;
    id v56 = *(id *)(a1 + 40);
    id v57 = WeakRetained;
    int v31 = v20;
    char v60 = v20;
    id v32 = v25;
    uint64_t v33 = *(void *)(a1 + 64);
    id v58 = v32;
    uint64_t v59 = v33;
    v34 = (void *)[v28 initWithAsyncBlock:v53];
    v35 = [NSString stringWithFormat:@"precondition-%@", v30];
    [v34 setName:v35];

    [*(id *)(a1 + 48) addOperation:v34];
    p_super = &v55->super.super;
    v37 = (unsigned int (**)(void, void))v25;
    v10 = 0;
    v6 = v45;
  }
  else
  {
    int v31 = v20;
    int v38 = v20 ^ 1 | v18;
    v37 = (unsigned int (**)(void, void))v25;
    v10 = 0;
    v6 = v45;
    v29 = v24;
    if (v38 == 1)
    {
      v39 = [MEMORY[0x1E4FAF480] targeting];
      if (os_log_type_enabled(v39, OS_LOG_TYPE_DEBUG)) {
        __91__TPSTipsManager_processTipsDeliveryInfo_deliveryInfoMap_targetingCache_completionHandler___block_invoke_cold_1();
      }

      v40 = [WeakRetained tipStatusController];
      [v40 updatePreconditionMatchedForIdentifier:v24 value:1];
    }
    if (v47) {
      int v41 = 0;
    }
    else {
      int v41 = v31;
    }
    if (v41 == 1 && !((unsigned int (**)(void, id))v37)[2](v37, v24)) {
      goto LABEL_25;
    }
    p_super = [WeakRetained syncQueue];
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __91__TPSTipsManager_processTipsDeliveryInfo_deliveryInfoMap_targetingCache_completionHandler___block_invoke_240;
    block[3] = &unk_1E6E6B758;
    v52[1] = *(void *)(a1 + 64);
    v43 = (id *)v52;
    v52[0] = v24;
    dispatch_async(p_super, block);
  }

LABEL_25:
  if (v31)
  {
    v42 = [WeakRetained syncQueue];
    v48[0] = MEMORY[0x1E4F143A8];
    v48[1] = 3221225472;
    v48[2] = __91__TPSTipsManager_processTipsDeliveryInfo_deliveryInfoMap_targetingCache_completionHandler___block_invoke_2_241;
    v48[3] = &unk_1E6E6B758;
    uint64_t v50 = *(void *)(a1 + 72);
    id v49 = v29;
    dispatch_async(v42, v48);
  }
  id v5 = v44;
LABEL_28:
}

- (void)updateSupplementalIdentifiersForIdentifier:(id)a3 fromDictionary:(id)a4
{
  uint64_t v6 = *MEMORY[0x1E4FAF560];
  id v7 = a4;
  id v8 = a3;
  id v15 = [v7 TPSSafeStringForKey:v6];
  v9 = [(TPSTipsManager *)self tipStatusController];
  [v9 updateVariantIdentifierForIdentifier:v8 value:v15];

  v10 = [v7 TPSSafeDictionaryForKey:*MEMORY[0x1E4FAF558]];

  uint64_t v11 = [v10 TPSSafeStringForKey:*MEMORY[0x1E4FAF540]];
  v12 = [(TPSTipsManager *)self tipStatusController];
  [v12 updateCorrelationIdentifierForIdentifier:v8 value:v11];

  uint64_t v13 = [v10 TPSSafeStringForKey:*MEMORY[0x1E4FAF538]];
  v14 = [(TPSTipsManager *)self tipStatusController];
  [v14 updateClonedFromIdentifierForIdentifier:v8 value:v13];
}

- (TPSTipStatusController)tipStatusController
{
  return self->_tipStatusController;
}

- (OS_dispatch_queue)syncQueue
{
  return self->_syncQueue;
}

void __234__TPSTipsManager_finalEligibleContentWithCollections_collectionsMap_collectionDeliveryInfoMap_eligibleTipIdentifiers_eligibleContextualTipIdentifiers_allFullTipsMap_allMiniTipsMap_tipDeliveryInfoMap_deliveryInfoMap_completionHandler___block_invoke_3(uint64_t a1, void *a2, uint64_t a3)
{
  id v5 = *(void **)(a1 + 32);
  id v6 = a2;
  [v5 updateSupplementalIdentifiersForIdentifier:v6 fromDictionary:a3];
  id v7 = [*(id *)(a1 + 32) tipStatusController];
  [v7 updateDisplayTypeForIdentifier:v6 value:2];

  id v8 = [*(id *)(a1 + 32) tipStatusController];
  [v8 updateLastUsedVersionForIdentifier:v6 value:*(void *)(a1 + 40)];

  id v10 = [*(id *)(a1 + 48) TPSSafeDictionaryForKey:v6];
  v9 = [MEMORY[0x1E4FAF460] deliveryInfoIdForDictionary:v10];
  [*(id *)(a1 + 56) setObject:v9 forKeyedSubscript:v6];
}

void __106__TPSTipsManager_updateDocumentContent_withClientConditions_checklistCompletedConditions_usingDictionary___block_invoke(uint64_t a1, void *a2)
{
  id v15 = a2;
  v3 = [v15 identifier];
  v4 = [*(id *)(a1 + 32) objectForKeyedSubscript:v3];
  uint64_t v5 = [MEMORY[0x1E4FAF460] contentDictionaryForDictionary:v4 fromMatchingClientConditions:*(void *)(a1 + 40)];
  id v6 = (void *)v5;
  if (v5
    || ([MEMORY[0x1E4FAF460] contentDictionaryForDictionary:v4 fromMatchingClientConditions:*(void *)(a1 + 48)], (id v6 = objc_claimAutoreleasedReturnValue()) != 0))
  {
    id v7 = (void *)[v4 mutableCopy];
    id v8 = [v6 allValues];
    v9 = [v8 firstObject];
    [v7 setObject:v9 forKeyedSubscript:*MEMORY[0x1E4FAF520]];

    [v7 setObject:0 forKeyedSubscript:*MEMORY[0x1E4FAF518]];
    [*(id *)(a1 + 56) setObject:v7 forKeyedSubscript:v3];
  }
  id v10 = [v6 allKeys];
  uint64_t v11 = [v10 firstObject];

  v12 = [v6 objectForKeyedSubscript:v11];
  if (v12)
  {
    uint64_t v13 = [MEMORY[0x1E4FAF460] fileIdMapForDictionary:v4];
    v14 = [*(id *)(a1 + 64) metadata];
    [v15 updateWithContentDictionary:v12 metadata:v14 clientConditionIdentifier:v11 fileIdMap:v13 clientConditions:*(void *)(a1 + 48)];
  }
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    [v15 setContentStatus:v5 != 0];
  }
}

void __234__TPSTipsManager_finalEligibleContentWithCollections_collectionsMap_collectionDeliveryInfoMap_eligibleTipIdentifiers_eligibleContextualTipIdentifiers_allFullTipsMap_allMiniTipsMap_tipDeliveryInfoMap_deliveryInfoMap_completionHandler___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v14 = a2;
  id v5 = a3;
  id v6 = [*(id *)(a1 + 32) TPSSafeDictionaryForKey:v14];
  id v7 = [MEMORY[0x1E4FAF460] deliveryInfoIdForDictionary:v6];
  [*(id *)(a1 + 40) setObject:v7 forKeyedSubscript:v14];
  if (([*(id *)(a1 + 48) containsObject:v14] & 1) == 0)
  {
    if ([*(id *)(a1 + 56) containsObject:v14])
    {
      id v8 = [*(id *)(a1 + 64) objectForKeyedSubscript:v14];
      if (v8)
      {
        v9 = [*(id *)(a1 + 72) objectForKeyedSubscript:v7];
        id v10 = [v9 TPSSafeObjectForKey:@"triggers"];
        [v8 setSiriSuggestion:v10 != 0];
      }
      uint64_t v11 = 1;
    }
    else
    {
      uint64_t v11 = 0;
    }
    [*(id *)(a1 + 80) updateSupplementalIdentifiersForIdentifier:v14 fromDictionary:v5];
    v12 = [*(id *)(a1 + 80) tipStatusController];
    [v12 updateDisplayTypeForIdentifier:v14 value:v11];

    uint64_t v13 = [*(id *)(a1 + 80) tipStatusController];
    [v13 updateLastUsedVersionForIdentifier:v14 value:*(void *)(a1 + 88)];
  }
}

void __66__TPSTipsManager_processTipDocumentsDictionary_completionHandler___block_invoke(uint64_t a1, void *a2)
{
  id v4 = a2;
  v3 = [MEMORY[0x1E4FAF4B8] tipIdFromDictionary:v4];
  if (([MEMORY[0x1E4FAF4B8] contentTypeForDictionary:v4] & 2) != 0) {
    [*(id *)(a1 + 32) setObject:v4 forKeyedSubscript:v3];
  }
}

void __234__TPSTipsManager_finalEligibleContentWithCollections_collectionsMap_collectionDeliveryInfoMap_eligibleTipIdentifiers_eligibleContextualTipIdentifiers_allFullTipsMap_allMiniTipsMap_tipDeliveryInfoMap_deliveryInfoMap_completionHandler___block_invoke(uint64_t a1, void *a2)
{
  id v22 = a2;
  if (!v22) {
    goto LABEL_8;
  }
  if (![*(id *)(a1 + 32) containsObject:v22]) {
    goto LABEL_8;
  }
  if (![*(id *)(a1 + 40) containsObject:v22]) {
    goto LABEL_8;
  }
  int v3 = [*(id *)(a1 + 48) containsObject:v22];
  id v4 = v22;
  if (!v3
    || ([*(id *)(a1 + 56) tipStatusController],
        id v5 = objc_claimAutoreleasedReturnValue(),
        [v5 hintEligibleDateForIdentifier:v22],
        id v6 = objc_claimAutoreleasedReturnValue(),
        v6,
        v5,
        id v4 = v22,
        v6))
  {
    id v7 = [*(id *)(a1 + 72) objectForKeyedSubscript:v4];
    if (v7)
    {
      id v8 = v7;
      [v7 addCollectionIdentifier:*(void *)(a1 + 80)];
    }
    else
    {
      v9 = [*(id *)(a1 + 88) objectForKeyedSubscript:v22];
      id v10 = objc_alloc(MEMORY[0x1E4FAF4B8]);
      uint64_t v11 = [*(id *)(a1 + 56) metadata];
      id v8 = (void *)[v10 initWithDictionary:v9 metadata:v11];

      [v8 addCollectionIdentifier:*(void *)(a1 + 80)];
      if ([v8 hasWidgetContent])
      {
        v12 = *(void **)(a1 + 96);
        uint64_t v13 = [v8 identifier];
        id v14 = [v12 TPSSafeDictionaryForKey:v13];

        id v15 = [MEMORY[0x1E4FAF460] deliveryInfoIdForDictionary:v14];
        v16 = [*(id *)(a1 + 104) TPSSafeDictionaryForKey:v15];
        v17 = [v16 objectForKeyedSubscript:@"notification"];
        if ([v8 isWelcome])
        {
          uint64_t v18 = 4;
        }
        else if ([v17 TPSSafeBoolForKey:@"overrideOptOut"])
        {
          uint64_t v18 = 3;
        }
        else
        {
          v19 = [v16 TPSSafeObjectForKey:@"triggers"];

          if (v19) {
            uint64_t v18 = 2;
          }
          else {
            uint64_t v18 = v17 != 0;
          }
        }
        int v20 = [v8 widgetContent];
        [v20 setPriority:v18];
      }
      [*(id *)(a1 + 72) setObject:v8 forKeyedSubscript:v22];
    }
    if ([v8 isIntro]) {
      uint64_t v21 = *(void *)(a1 + 112);
    }
    else {
      uint64_t v21 = *(void *)(a1 + 120);
    }
    *(unsigned char *)(*(void *)(v21 + 8) + 24) = 1;
    if ([v8 isOutro]) {
      *(unsigned char *)(*(void *)(*(void *)(a1 + 128) + 8) + 24) = 1;
    }
  }
  else
  {
LABEL_8:
    [*(id *)(a1 + 64) addObject:v22];
  }
}

- (TPSMetadata)metadata
{
  return self->_metadata;
}

void __75__TPSTipsManager_processClientConditions_targetingCache_completionHandler___block_invoke_3(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = [MEMORY[0x1E4FAF480] targeting];
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG)) {
    __75__TPSTipsManager_processClientConditions_targetingCache_completionHandler___block_invoke_3_cold_1(a1, v4, v5, v6, v7, v8, v9, v10);
  }

  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 80));
  v12 = [*(id *)(a1 + 40) conditions];
  uint64_t v13 = [*(id *)(a1 + 40) joinType];
  uint64_t v14 = *(void *)(a1 + 32);
  uint64_t v15 = *(void *)(a1 + 48);
  v16 = [WeakRetained syncQueue];
  v18[0] = MEMORY[0x1E4F143A8];
  v18[1] = 3221225472;
  v18[2] = __75__TPSTipsManager_processClientConditions_targetingCache_completionHandler___block_invoke_243;
  v18[3] = &unk_1E6E6B870;
  id v19 = *(id *)(a1 + 32);
  id v20 = *(id *)(a1 + 56);
  id v21 = *(id *)(a1 + 64);
  id v22 = *(id *)(a1 + 40);
  id v23 = *(id *)(a1 + 72);
  id v24 = v3;
  id v17 = v3;
  +[TPSTargetingValidator validateConditions:v12 joinType:v13 context:v14 cache:v15 completionQueue:v16 completionHandler:v18];
}

uint64_t __91__TPSTipsManager_processTipsDeliveryInfo_deliveryInfoMap_targetingCache_completionHandler___block_invoke_2(uint64_t a1, void *a2)
{
  id v3 = a2;
  if ([MEMORY[0x1E4FAF450] ignoreTargetingValidator]) {
    goto LABEL_6;
  }
  id v4 = [*(id *)(a1 + 32) tipStatusController];
  int v5 = [v4 isTipAppDisplayEligibleForIdentifier:v3];

  if (!v5)
  {
    uint64_t v11 = [MEMORY[0x1E4FAF480] targeting];
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG)) {
      __91__TPSTipsManager_processTipsDeliveryInfo_deliveryInfoMap_targetingCache_completionHandler___block_invoke_2_cold_2(a1, v11, v12, v13, v14, v15, v16, v17);
    }
    goto LABEL_9;
  }
  if (!*(unsigned char *)(a1 + 56) && *(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) != 1)
  {
    uint64_t v6 = [*(id *)(a1 + 32) tipStatusController];
    uint64_t v8 = *(void *)(a1 + 40);
    uint64_t v7 = a1 + 40;
    char v9 = [v6 isContentViewedForIdentifier:v8];

    if ((v9 & 1) == 0)
    {
      uint64_t v11 = [MEMORY[0x1E4FAF480] default];
      if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG)) {
        __91__TPSTipsManager_processTipsDeliveryInfo_deliveryInfoMap_targetingCache_completionHandler___block_invoke_2_cold_1(v7, v11, v19, v20, v21, v22, v23, v24);
      }
LABEL_9:

      uint64_t v10 = 0;
      goto LABEL_10;
    }
  }
LABEL_6:
  uint64_t v10 = 1;
LABEL_10:

  return v10;
}

- (id)collectionSectionsWithEligibleCollectionSections:(id)a3 collectionSectionMap:(id)a4 featuredCollection:(id)a5
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  uint64_t v8 = objc_msgSend(MEMORY[0x1E4F1CA48], "arrayWithCapacity:", objc_msgSend(v6, "count"));
  long long v17 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  id v9 = v6;
  uint64_t v10 = [v9 countByEnumeratingWithState:&v17 objects:v21 count:16];
  if (v10)
  {
    uint64_t v11 = v10;
    uint64_t v12 = *(void *)v18;
    do
    {
      for (uint64_t i = 0; i != v11; ++i)
      {
        if (*(void *)v18 != v12) {
          objc_enumerationMutation(v9);
        }
        uint64_t v14 = objc_msgSend(v7, "objectForKeyedSubscript:", *(void *)(*((void *)&v17 + 1) + 8 * i), (void)v17);
        if (v14) {
          [v8 addObject:v14];
        }
      }
      uint64_t v11 = [v9 countByEnumeratingWithState:&v17 objects:v21 count:16];
    }
    while (v11);
  }

  if ([v8 count]) {
    uint64_t v15 = (void *)[v8 copy];
  }
  else {
    uint64_t v15 = 0;
  }

  return v15;
}

- (id)collectionSectionMapWithCollections:(id)a3 availableCollectionSections:(id)a4 collectionIdToCollectionLabelMap:(id)a5
{
  uint64_t v41 = *MEMORY[0x1E4F143B8];
  id v7 = a3;
  id v8 = a4;
  id v9 = a5;
  v26 = objc_msgSend(MEMORY[0x1E4F1CA60], "dictionaryWithCapacity:", objc_msgSend(v8, "count"));
  long long v35 = 0u;
  long long v36 = 0u;
  long long v37 = 0u;
  long long v38 = 0u;
  obuint64_t j = v8;
  uint64_t v29 = [obj countByEnumeratingWithState:&v35 objects:v40 count:16];
  if (v29)
  {
    uint64_t v28 = *(void *)v36;
    do
    {
      for (uint64_t i = 0; i != v29; ++i)
      {
        if (*(void *)v36 != v28) {
          objc_enumerationMutation(obj);
        }
        id v30 = *(void **)(*((void *)&v35 + 1) + 8 * i);
        uint64_t v11 = [v30 TPSSafeArrayForKey:@"collectionIds"];
        uint64_t v12 = objc_msgSend(MEMORY[0x1E4F1CA48], "arrayWithCapacity:", objc_msgSend(v11, "count"));
        long long v31 = 0u;
        long long v32 = 0u;
        long long v33 = 0u;
        long long v34 = 0u;
        id v13 = v11;
        uint64_t v14 = [v13 countByEnumeratingWithState:&v31 objects:v39 count:16];
        if (v14)
        {
          uint64_t v15 = v14;
          uint64_t v16 = *(void *)v32;
          do
          {
            for (uint64_t j = 0; j != v15; ++j)
            {
              if (*(void *)v32 != v16) {
                objc_enumerationMutation(v13);
              }
              long long v18 = [v9 objectForKeyedSubscript:*(void *)(*((void *)&v31 + 1) + 8 * j)];
              if (v18)
              {
                uint64_t v19 = [v7 objectForKeyedSubscript:v18];
                if (v19)
                {
                  long long v20 = (void *)v19;
                  [v12 addObject:v19];
                }
              }
            }
            uint64_t v15 = [v13 countByEnumeratingWithState:&v31 objects:v39 count:16];
          }
          while (v15);
        }

        if ([v12 count])
        {
          uint64_t v21 = (void *)[objc_alloc(MEMORY[0x1E4FAF3F0]) initWithDictionary:v30 collections:v12];
          uint64_t v22 = v21;
          if (v21)
          {
            uint64_t v23 = [v21 identifier];
            [v26 setObject:v22 forKeyedSubscript:v23];
          }
        }
      }
      uint64_t v29 = [obj countByEnumeratingWithState:&v35 objects:v40 count:16];
    }
    while (v29);
  }

  if ([v26 count]) {
    uint64_t v24 = (void *)[v26 copy];
  }
  else {
    uint64_t v24 = 0;
  }

  return v24;
}

uint64_t __62__TPSTipsManager_collectionSectionsFromCollectionMap_exclude___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  id v8 = a3;
  if (([*(id *)(a1 + 32) containsObject:a2] & 1) == 0)
  {
    int v5 = [v8 TPSSafeDictionaryForKey:@"collection"];
    id v6 = [v5 TPSSafeStringForKey:@"type"];
    if ([v6 isEqualToString:@"collection-order"]) {
      [*(id *)(a1 + 40) addObject:v5];
    }
  }

  return MEMORY[0x1F41817F8]();
}

void __75__TPSTipsManager_processClientConditions_targetingCache_completionHandler___block_invoke_2(id *a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  id v7 = [[TPSDeliveryPrecondition alloc] initWithDictionary:v6];
  if (v7)
  {
    id v8 = objc_alloc(MEMORY[0x1E4FAF3C8]);
    v10[0] = MEMORY[0x1E4F143A8];
    v10[1] = 3221225472;
    v10[2] = __75__TPSTipsManager_processClientConditions_targetingCache_completionHandler___block_invoke_3;
    v10[3] = &unk_1E6E6B898;
    id v11 = v5;
    objc_copyWeak(&v17, a1 + 9);
    uint64_t v12 = v7;
    id v13 = a1[4];
    id v14 = a1[5];
    id v15 = a1[6];
    id v16 = a1[7];
    id v9 = (void *)[v8 initWithAsyncBlock:v10];
    [a1[8] addOperation:v9];

    objc_destroyWeak(&v17);
  }
}

- (void)processClientConditions:(id)a3 targetingCache:(id)a4 completionHandler:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  uint64_t v10 = (void (**)(id, void *, void *))a5;
  id v11 = [MEMORY[0x1E4FAF480] targeting];
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG)) {
    -[TPSTipsManager processClientConditions:targetingCache:completionHandler:](v8);
  }

  if ([v8 count])
  {
    uint64_t v12 = [MEMORY[0x1E4F1CA80] set];
    id v13 = [MEMORY[0x1E4FAF450] matchedClientConditions];
    if (v13)
    {
      id v14 = [MEMORY[0x1E4F1CA80] setWithArray:v13];
      id v15 = (void *)MEMORY[0x1E4F1CAD0];
      id v16 = [v8 allKeys];
      id v17 = [v15 setWithArray:v16];
      [v14 intersectSet:v17];

      id v18 = (id)[v12 setByAddingObjectsFromSet:v14];
      v41[0] = MEMORY[0x1E4F143A8];
      v41[1] = 3221225472;
      v41[2] = __75__TPSTipsManager_processClientConditions_targetingCache_completionHandler___block_invoke;
      v41[3] = &unk_1E6E6B848;
      id v42 = v8;
      id v19 = v12;
      id v43 = v19;
      [v14 enumerateObjectsUsingBlock:v41];
      long long v20 = (void *)[v14 copy];
      uint64_t v21 = (void *)[v19 copy];
      v10[2](v10, v20, v21);

      id v22 = v42;
    }
    else
    {
      uint64_t v23 = [MEMORY[0x1E4FAF450] matchedClientConditionTargeting];
      uint64_t v24 = objc_msgSend(MEMORY[0x1E4F1CA80], "setWithCapacity:", objc_msgSend(v8, "count"));
      id v25 = objc_alloc_init(MEMORY[0x1E4F28F08]);
      objc_initWeak(&location, self);
      v33[0] = MEMORY[0x1E4F143A8];
      v33[1] = 3221225472;
      v33[2] = __75__TPSTipsManager_processClientConditions_targetingCache_completionHandler___block_invoke_2;
      v33[3] = &unk_1E6E6B8C0;
      objc_copyWeak(&v39, &location);
      id v34 = v9;
      id v14 = v23;
      id v35 = v14;
      id v26 = v24;
      id v36 = v26;
      id v27 = v12;
      id v37 = v27;
      id v28 = v25;
      id v38 = v28;
      [v8 enumerateKeysAndObjectsUsingBlock:v33];
      v29[0] = MEMORY[0x1E4F143A8];
      v29[1] = 3221225472;
      v29[2] = __75__TPSTipsManager_processClientConditions_targetingCache_completionHandler___block_invoke_244;
      v29[3] = &unk_1E6E6B8E8;
      long long v32 = v10;
      id v22 = v26;
      id v30 = v22;
      id v31 = v27;
      [v28 addBarrierBlock:v29];

      objc_destroyWeak(&v39);
      objc_destroyWeak(&location);
    }
  }
  else
  {
    v10[2](v10, 0, 0);
  }
}

void __199__TPSTipsManager_contentWithMetaDictionary_documents_isRemote_processTipKitContent_contextualEligibility_widgetEligibility_notificationEligibility_preferredNotificationIdentifiers_completionHandler___block_invoke_4(uint64_t a1, void *a2)
{
  v19[1] = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  if (*(void *)(a1 + 32))
  {
    id v4 = objc_msgSend(*(id *)(a1 + 40), "TPSSafeDictionaryForKey:");
    id v5 = [v4 TPSSafeDictionaryForKey:@"collection"];
    uint64_t v7 = *(void *)(a1 + 40);
    id v6 = *(void **)(a1 + 48);
    v14[0] = MEMORY[0x1E4F143A8];
    v14[1] = 3221225472;
    v14[2] = __199__TPSTipsManager_contentWithMetaDictionary_documents_isRemote_processTipKitContent_contextualEligibility_widgetEligibility_notificationEligibility_preferredNotificationIdentifiers_completionHandler___block_invoke_5;
    v14[3] = &unk_1E6E6B350;
    long long v16 = *(_OWORD *)(a1 + 56);
    long long v17 = *(_OWORD *)(a1 + 72);
    uint64_t v18 = *(void *)(a1 + 88);
    id v15 = v3;
    [v6 processCollection:v5 collectionsMap:v7 ignoreSection:0 completionHandler:v14];
    if ([*(id *)(*(void *)(*(void *)(a1 + 64) + 8) + 40) count])
    {
      v19[0] = *(void *)(a1 + 32);
      id v8 = [MEMORY[0x1E4F1C978] arrayWithObjects:v19 count:1];
    }
    else
    {
      id v8 = 0;
    }
    uint64_t v10 = [*(id *)(a1 + 48) collectionSectionsFromCollectionMap:*(void *)(a1 + 40) exclude:v8];
    uint64_t v11 = *(void *)(*(void *)(a1 + 96) + 8);
    uint64_t v12 = *(void **)(v11 + 40);
    *(void *)(v11 + 40) = v10;
  }
  else
  {
    id v9 = [MEMORY[0x1E4FAF480] default];
    if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)id v13 = 0;
      _os_log_impl(&dword_1E4492000, v9, OS_LOG_TYPE_INFO, "Root collection ID is missing in payload", v13, 2u);
    }

    (*((void (**)(id, void))v3 + 2))(v3, 0);
  }
}

- (id)collectionSectionsFromCollectionMap:(id)a3 exclude:(id)a4
{
  id v5 = a4;
  id v6 = (void *)MEMORY[0x1E4F1CA48];
  id v7 = a3;
  id v8 = objc_msgSend(v6, "arrayWithCapacity:", objc_msgSend(v7, "count"));
  uint64_t v13 = MEMORY[0x1E4F143A8];
  uint64_t v14 = 3221225472;
  id v15 = __62__TPSTipsManager_collectionSectionsFromCollectionMap_exclude___block_invoke;
  long long v16 = &unk_1E6E6B708;
  id v17 = v5;
  id v9 = v8;
  id v18 = v9;
  id v10 = v5;
  [v7 enumerateKeysAndObjectsUsingBlock:&v13];

  if (objc_msgSend(v9, "count", v13, v14, v15, v16)) {
    uint64_t v11 = (void *)[v9 copy];
  }
  else {
    uint64_t v11 = 0;
  }

  return v11;
}

- (void)finalEligibleContentWithCollections:(id)a3 collectionsMap:(id)a4 collectionDeliveryInfoMap:(id)a5 eligibleTipIdentifiers:(id)a6 eligibleContextualTipIdentifiers:(id)a7 allFullTipsMap:(id)a8 allMiniTipsMap:(id)a9 tipDeliveryInfoMap:(id)a10 deliveryInfoMap:(id)a11 completionHandler:(id)a12
{
  uint64_t v133 = *MEMORY[0x1E4F143B8];
  id v17 = a3;
  id v58 = a4;
  id v65 = a5;
  id v74 = a6;
  id v63 = a7;
  id v83 = a8;
  id v18 = a9;
  id v77 = a10;
  id v79 = a11;
  v61 = (void (**)(id, void *, void *, void *, void *, void *, void *))a12;
  int v70 = [MEMORY[0x1E4FAF450] showAllCollections];
  char v60 = v17;
  uint64_t v19 = [v17 count];
  v68 = objc_opt_new();
  v67 = objc_opt_new();
  v66 = objc_opt_new();
  v75 = objc_opt_new();
  uint64_t v59 = objc_opt_new();
  v81 = objc_opt_new();
  long long v20 = (void *)MEMORY[0x1E4F1CAD0];
  char v64 = v18;
  uint64_t v21 = [v18 allKeys];
  id v62 = [v20 setWithArray:v21];

  v82 = [MEMORY[0x1E4F1CA80] setWithSet:v63];
  [v82 minusSet:v62];
  if (v19 || [v83 count])
  {
    id v22 = (void *)MEMORY[0x1E4F1CAD0];
    uint64_t v23 = [v83 allKeys];
    v72 = [v22 setWithArray:v23];

    uint64_t v24 = (void *)MEMORY[0x1E4F1CAD0];
    id v25 = [v18 allKeys];
    v71 = [v24 setWithArray:v25];

    long long v130 = 0u;
    long long v131 = 0u;
    long long v128 = 0u;
    long long v129 = 0u;
    obuint64_t j = v17;
    uint64_t v87 = [obj countByEnumeratingWithState:&v128 objects:v132 count:16];
    if (v87)
    {
      uint64_t v85 = *(void *)v129;
      do
      {
        for (uint64_t i = 0; i != v87; ++i)
        {
          if (*(void *)v129 != v85) {
            objc_enumerationMutation(obj);
          }
          uint64_t v27 = *(void *)(*((void *)&v128 + 1) + 8 * i);
          uint64_t v124 = 0;
          v125 = &v124;
          uint64_t v126 = 0x2020000000;
          char v127 = 0;
          uint64_t v120 = 0;
          v121 = &v120;
          uint64_t v122 = 0x2020000000;
          char v123 = 0;
          uint64_t v116 = 0;
          v117 = &v116;
          uint64_t v118 = 0x2020000000;
          char v119 = 0;
          id v28 = [MEMORY[0x1E4FAF3E8] collectionLabelForDictionary:v27];
          if (v28)
          {
            uint64_t v29 = [MEMORY[0x1E4FAF3E8] tipIdentifiersForDictionary:v27];
            id v30 = [MEMORY[0x1E4F1CA70] orderedSetWithArray:v29];
            id v31 = [MEMORY[0x1E4F1CA80] set];
            v102[0] = MEMORY[0x1E4F143A8];
            v102[1] = 3221225472;
            v102[2] = __234__TPSTipsManager_finalEligibleContentWithCollections_collectionsMap_collectionDeliveryInfoMap_eligibleTipIdentifiers_eligibleContextualTipIdentifiers_allFullTipsMap_allMiniTipsMap_tipDeliveryInfoMap_deliveryInfoMap_completionHandler___block_invoke;
            v102[3] = &unk_1E6E6B910;
            id v103 = v74;
            id v104 = v72;
            id v105 = v71;
            v106 = self;
            id v32 = v31;
            id v107 = v32;
            id v108 = v75;
            id v109 = v28;
            id v110 = v83;
            id v111 = v77;
            id v112 = v79;
            v113 = &v120;
            v114 = &v124;
            v115 = &v116;
            [v30 enumerateObjectsUsingBlock:v102];
            long long v33 = (void *)MEMORY[0x1E4F1CAD0];
            id v34 = [v30 array];
            id v35 = [v33 setWithArray:v34];

            id v36 = [MEMORY[0x1E4F1CA80] setWithSet:v82];
            [v36 intersectSet:v35];
            if (*((unsigned char *)v125 + 24))
            {
              [v30 minusSet:v32];
            }
            else
            {
              [v30 removeAllObjects];
              *((unsigned char *)v121 + 24) = 0;
              *((unsigned char *)v117 + 24) = 0;
            }
            if ([v30 count]) {
              int v37 = 1;
            }
            else {
              int v37 = v70;
            }
            if (v37 == 1)
            {
              id v38 = objc_alloc(MEMORY[0x1E4FAF3E8]);
              id v39 = [(TPSTipsManager *)self metadata];
              v40 = (void *)[v38 initWithDictionary:v27 metadata:v39];

              uint64_t v41 = [v30 array];
              [v40 setTipIdentifiers:v41];

              [v40 setContainsIntroTip:*((unsigned __int8 *)v121 + 24)];
              [v40 setContainsOutroTip:*((unsigned __int8 *)v117 + 24)];
              if (v40)
              {
                id v42 = [v40 identifier];
                [v68 addObject:v42];
                [v67 setObject:v40 forKeyedSubscript:v42];
                id v43 = [v65 objectForKeyedSubscript:v42];
                [v66 setObject:v43 forKeyedSubscript:v42];
              }
            }
            [v81 unionSet:v36];
          }
          _Block_object_dispose(&v116, 8);
          _Block_object_dispose(&v120, 8);
          _Block_object_dispose(&v124, 8);
        }
        uint64_t v87 = [obj countByEnumeratingWithState:&v128 objects:v132 count:16];
      }
      while (v87);
    }
  }
  id v44 = [MEMORY[0x1E4FAF3F8] sharedInstance];
  v45 = [v44 majorVersion];

  v93[0] = MEMORY[0x1E4F143A8];
  v93[1] = 3221225472;
  v93[2] = __234__TPSTipsManager_finalEligibleContentWithCollections_collectionsMap_collectionDeliveryInfoMap_eligibleTipIdentifiers_eligibleContextualTipIdentifiers_allFullTipsMap_allMiniTipsMap_tipDeliveryInfoMap_deliveryInfoMap_completionHandler___block_invoke_2;
  v93[3] = &unk_1E6E6B938;
  id v46 = v77;
  id v94 = v46;
  id v47 = v59;
  id v95 = v47;
  id v96 = v62;
  id v97 = v63;
  id v98 = v75;
  id v99 = v79;
  v100 = self;
  id v48 = v45;
  id v101 = v48;
  id v73 = v79;
  id v86 = v75;
  id v76 = v63;
  id v88 = v62;
  [v83 enumerateKeysAndObjectsUsingBlock:v93];
  v89[0] = MEMORY[0x1E4F143A8];
  v89[1] = 3221225472;
  v89[2] = __234__TPSTipsManager_finalEligibleContentWithCollections_collectionsMap_collectionDeliveryInfoMap_eligibleTipIdentifiers_eligibleContextualTipIdentifiers_allFullTipsMap_allMiniTipsMap_tipDeliveryInfoMap_deliveryInfoMap_completionHandler___block_invoke_3;
  v89[3] = &unk_1E6E6B960;
  v89[4] = self;
  id v90 = v48;
  id v91 = v46;
  id v92 = v47;
  id v49 = v47;
  id v80 = v46;
  id v78 = v48;
  [v64 enumerateKeysAndObjectsUsingBlock:v89];
  uint64_t v50 = [(TPSTipsManager *)self tipStatusController];
  [v50 updateCacheData];

  v51 = [MEMORY[0x1E4F1CA80] setWithSet:v88];
  [v51 unionSet:v81];
  v52 = (void *)[v68 copy];
  v53 = (void *)[v67 copy];
  id v54 = (void *)[v66 copy];
  v55 = (void *)[v86 copy];
  id v56 = (void *)[v49 copy];
  id v57 = (void *)[v51 copy];
  v61[2](v61, v52, v53, v54, v55, v56, v57);
}

- (void)processCollection:(id)a3 collectionsMap:(id)a4 ignoreSection:(BOOL)a5 completionHandler:(id)a6
{
  uint64_t v53 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = a4;
  id v28 = (void (**)(id, void *, void *, void *, void *, void *))a6;
  id v36 = [MEMORY[0x1E4F1CA48] array];
  id v31 = [MEMORY[0x1E4F1CA48] array];
  id v35 = [MEMORY[0x1E4F1CA60] dictionary];
  id v34 = [MEMORY[0x1E4F1CA60] dictionary];
  long long v33 = [MEMORY[0x1E4F1CA60] dictionary];
  uint64_t v29 = v8;
  [v8 TPSSafeArrayForKey:@"collectionIds"];
  long long v44 = 0u;
  long long v45 = 0u;
  long long v46 = 0u;
  long long v47 = 0u;
  obuint64_t j = (id)objc_claimAutoreleasedReturnValue();
  uint64_t v10 = [obj countByEnumeratingWithState:&v44 objects:v52 count:16];
  if (v10)
  {
    uint64_t v11 = v10;
    uint64_t v12 = *(void *)v45;
    do
    {
      for (uint64_t i = 0; i != v11; ++i)
      {
        if (*(void *)v45 != v12) {
          objc_enumerationMutation(obj);
        }
        uint64_t v14 = *(void *)(*((void *)&v44 + 1) + 8 * i);
        id v15 = [v9 TPSSafeDictionaryForKey:v14];
        long long v16 = [v15 TPSSafeDictionaryForKey:@"collection"];
        id v17 = [v16 TPSSafeStringForKey:@"type"];
        if ([v17 isEqualToString:@"collection-order"])
        {
          uint64_t v18 = [MEMORY[0x1E4FAF3E8] collectionOrderIdentifierForDictionary:v16];
          if (!v18) {
            goto LABEL_12;
          }
          uint64_t v19 = (void *)v18;
          if (a5) {
            goto LABEL_16;
          }
          [v31 addObject:v18];
          v38[0] = MEMORY[0x1E4F143A8];
          v38[1] = 3221225472;
          v38[2] = __83__TPSTipsManager_processCollection_collectionsMap_ignoreSection_completionHandler___block_invoke;
          v38[3] = &unk_1E6E6B6E0;
          id v39 = v36;
          id v40 = v31;
          id v41 = v35;
          id v42 = v34;
          id v43 = v33;
          [(TPSTipsManager *)self processCollection:v16 collectionsMap:v9 ignoreSection:1 completionHandler:v38];

          long long v20 = v39;
        }
        else
        {
          uint64_t v21 = [MEMORY[0x1E4FAF3E8] collectionLabelForDictionary:v16];
          if (!v21)
          {
LABEL_12:
            long long v20 = [MEMORY[0x1E4FAF480] default];
            if (os_log_type_enabled(v20, OS_LOG_TYPE_DEBUG))
            {
              *(_DWORD *)buf = 138412546;
              uint64_t v49 = v14;
              __int16 v50 = 2112;
              v51 = v16;
              _os_log_debug_impl(&dword_1E4492000, v20, OS_LOG_TYPE_DEBUG, "Collection unique id: %@ is missing collectionLabel in the payload %@", buf, 0x16u);
            }
            uint64_t v19 = 0;
            goto LABEL_15;
          }
          uint64_t v19 = (void *)v21;
          [v36 addObject:v16];
          [v35 setObject:v16 forKeyedSubscript:v19];
          id v22 = [MEMORY[0x1E4FAF460] deliveryInfoIdForDictionary:v15];
          [v34 setObject:v22 forKeyedSubscript:v19];

          long long v20 = [MEMORY[0x1E4FAF3E8] collectionOrderIdentifierForDictionary:v16];
          [v33 setObject:v19 forKeyedSubscript:v20];
        }
LABEL_15:

LABEL_16:
      }
      uint64_t v11 = [obj countByEnumeratingWithState:&v44 objects:v52 count:16];
    }
    while (v11);
  }
  uint64_t v23 = (void *)[v36 copy];
  uint64_t v24 = (void *)[v31 copy];
  id v25 = (void *)[v35 copy];
  id v26 = (void *)[v34 copy];
  uint64_t v27 = (void *)[v33 copy];
  v28[2](v28, v23, v24, v25, v26, v27);
}

void __83__TPSTipsManager_processCollection_collectionsMap_ignoreSection_completionHandler___block_invoke(id *a1, void *a2, void *a3, void *a4, void *a5, void *a6)
{
  id v15 = a2;
  id v11 = a3;
  id v12 = a4;
  id v13 = a5;
  id v14 = a6;
  if ([v15 count]) {
    [a1[4] addObjectsFromArray:v15];
  }
  if ([v11 count]) {
    [a1[5] addObjectsFromArray:v11];
  }
  if ([v12 count]) {
    [a1[6] addEntriesFromDictionary:v12];
  }
  if ([v13 count]) {
    [a1[7] addEntriesFromDictionary:v13];
  }
  if ([v14 count]) {
    [a1[8] addEntriesFromDictionary:v14];
  }
}

void __91__TPSTipsManager_processTipsDeliveryInfo_deliveryInfoMap_targetingCache_completionHandler___block_invoke_4(uint64_t a1)
{
  v2 = [*(id *)(a1 + 32) tipStatusController];
  id v3 = [*(id *)(*(void *)(*(void *)(a1 + 56) + 8) + 40) setByAddingObjectsFromSet:*(void *)(*(void *)(*(void *)(a1 + 64) + 8) + 40)];
  [v2 syncWithIdentifiers:v3];

  id v4 = [*(id *)(a1 + 32) tipStatusController];
  [v4 updateCacheData];

  [*(id *)(a1 + 40) endTransaction];
  uint64_t v5 = *(void *)(a1 + 48);
  id v7 = (id)[*(id *)(*(void *)(*(void *)(a1 + 56) + 8) + 40) copy];
  id v6 = (void *)[*(id *)(*(void *)(*(void *)(a1 + 64) + 8) + 40) copy];
  (*(void (**)(uint64_t, id, void *))(v5 + 16))(v5, v7, v6);
}

void __199__TPSTipsManager_contentWithMetaDictionary_documents_isRemote_processTipKitContent_contextualEligibility_widgetEligibility_notificationEligibility_preferredNotificationIdentifiers_completionHandler___block_invoke_5(void *a1, void *a2, void *a3, void *a4, void *a5, void *a6)
{
  id v11 = a2;
  id v12 = a3;
  id v13 = a4;
  id v14 = a5;
  id v15 = a6;
  uint64_t v16 = *(void *)(a1[5] + 8);
  id v17 = *(void **)(v16 + 40);
  *(void *)(v16 + 40) = v11;
  id v30 = v11;

  uint64_t v18 = *(void *)(a1[6] + 8);
  uint64_t v19 = *(void **)(v18 + 40);
  *(void *)(v18 + 40) = v12;
  id v20 = v12;

  uint64_t v21 = *(void *)(a1[7] + 8);
  id v22 = *(void **)(v21 + 40);
  *(void *)(v21 + 40) = v13;
  id v23 = v13;

  uint64_t v24 = *(void *)(a1[8] + 8);
  id v25 = *(void **)(v24 + 40);
  *(void *)(v24 + 40) = v14;
  id v26 = v14;

  uint64_t v27 = *(void *)(a1[9] + 8);
  id v28 = *(void **)(v27 + 40);
  *(void *)(v27 + 40) = v15;
  id v29 = v15;

  (*(void (**)(void))(a1[4] + 16))();
}

- (TPSTipsManagerDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  return (TPSTipsManagerDelegate *)WeakRetained;
}

uint64_t __64__TPSTipsManager_checklistCollectionHasMinSuggestedTips_tipMap___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3, unsigned char *a4)
{
  id v6 = [*(id *)(a1 + 32) objectForKeyedSubscript:a2];
  if (v6 && ([v6 isCompleted] & 1) == 0) {
    ++*(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 24);
  }
  *(unsigned char *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) = *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) > 2;
  *a4 = *(unsigned char *)(*(void *)(*(void *)(a1 + 48) + 8) + 24);

  return MEMORY[0x1F41817F8]();
}

- (BOOL)hasWidgetDocument
{
  v2 = [(TPSTipsManager *)self widgetController];
  id v3 = [v2 preferredDocument];
  BOOL v4 = v3 != 0;

  return v4;
}

- (TPSWidgetController)widgetController
{
  return self->_widgetController;
}

- (NSMutableArray)sessionItems
{
  return self->_sessionItems;
}

void __199__TPSTipsManager_contentWithMetaDictionary_documents_isRemote_processTipKitContent_contextualEligibility_widgetEligibility_notificationEligibility_preferredNotificationIdentifiers_completionHandler___block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  [WeakRetained setMetadata:*(void *)(a1 + 32)];
  objc_msgSend(WeakRetained, "_updatePauseStatus:", objc_msgSend(*(id *)(a1 + 32), "contextualTipsInactive"));
  v2 = [*(id *)(a1 + 32) language];
  id v3 = [MEMORY[0x1E4FAF3B8] sharedInstance];
  [v3 setLanguageCode:v2];
}

- (void)setMetadata:(id)a3
{
}

- (void)_updatePauseStatus:(BOOL)a3
{
  if (self->_contextualTipsInactive != a3)
  {
    self->_contextualTipsInactive = a3;
    id v4 = [MEMORY[0x1E4F1CB18] standardUserDefaults];
    if (self->_contextualTipsInactive) {
      [v4 setBool:1 forKey:@"contextualTipsInactive"];
    }
    else {
      [v4 removeObjectForKey:@"contextualTipsInactive"];
    }
    [v4 synchronize];
  }
}

- (void)processTipsDeliveryInfo:(id)a3 deliveryInfoMap:(id)a4 targetingCache:(id)a5 completionHandler:(id)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = (TPSTargetingCache *)a5;
  id v13 = a6;
  uint64_t v48 = 0;
  uint64_t v49 = &v48;
  uint64_t v50 = 0x3032000000;
  v51 = __Block_byref_object_copy__1;
  v52 = __Block_byref_object_dispose__1;
  id v53 = 0;
  uint64_t v42 = 0;
  id v43 = &v42;
  uint64_t v44 = 0x3032000000;
  long long v45 = __Block_byref_object_copy__1;
  long long v46 = __Block_byref_object_dispose__1;
  id v47 = 0;
  uint64_t v14 = [v10 count];
  if (v14)
  {
    uint64_t v15 = [MEMORY[0x1E4F1CA80] setWithCapacity:v14];
    uint64_t v16 = (void *)v49[5];
    v49[5] = v15;

    uint64_t v17 = [MEMORY[0x1E4F1CA80] setWithCapacity:v14];
    uint64_t v18 = (void *)v43[5];
    v43[5] = v17;

    id v19 = objc_alloc_init(MEMORY[0x1E4F28F08]);
    [v19 setMaxConcurrentOperationCount:1];
    v40[0] = 0;
    v40[1] = v40;
    v40[2] = 0x2020000000;
    uint64_t v41 = 0;
    id v20 = [(TPSTipsManager *)self experiment];
    uint64_t v21 = [v20 camp];

    uint64_t v41 = v21;
    objc_initWeak(&location, self);
    if (!v12) {
      id v12 = objc_alloc_init(TPSTargetingCache);
    }
    id v22 = [MEMORY[0x1E4FAF4A0] transactionWithName:@"com.apple.TipsDaemon.precondition-check"];
    v31[0] = MEMORY[0x1E4F143A8];
    v31[1] = 3221225472;
    v31[2] = __91__TPSTipsManager_processTipsDeliveryInfo_deliveryInfoMap_targetingCache_completionHandler___block_invoke;
    v31[3] = &unk_1E6E6B7D0;
    id v32 = v11;
    objc_copyWeak(&v38, &location);
    id v35 = v40;
    id v12 = v12;
    long long v33 = v12;
    id v36 = &v48;
    id v23 = v19;
    id v34 = v23;
    int v37 = &v42;
    [v10 enumerateKeysAndObjectsUsingBlock:v31];
    v25[0] = MEMORY[0x1E4F143A8];
    v25[1] = 3221225472;
    v25[2] = __91__TPSTipsManager_processTipsDeliveryInfo_deliveryInfoMap_targetingCache_completionHandler___block_invoke_3;
    v25[3] = &unk_1E6E6B820;
    objc_copyWeak(&v30, &location);
    id v28 = &v48;
    id v29 = &v42;
    id v24 = v22;
    id v26 = v24;
    id v27 = v13;
    [v23 addOperationWithBlock:v25];

    objc_destroyWeak(&v30);
    objc_destroyWeak(&v38);

    objc_destroyWeak(&location);
    _Block_object_dispose(v40, 8);
  }
  else
  {
    (*((void (**)(id, void, void))v13 + 2))(v13, 0, 0);
  }
  _Block_object_dispose(&v42, 8);

  _Block_object_dispose(&v48, 8);
}

- (void)contentFromOrigin:(BOOL)a3 processTipKitContent:(BOOL)a4 contextualEligibility:(BOOL)a5 widgetEligibility:(BOOL)a6 notificationEligibility:(BOOL)a7 preferredNotificationIdentifiers:(id)a8 shouldDeferBlock:(id)a9 completionHandler:(id)a10
{
  BOOL v10 = a7;
  BOOL v35 = a6;
  BOOL v11 = a5;
  BOOL v13 = a3;
  uint64_t v67 = *MEMORY[0x1E4F143B8];
  id v15 = a8;
  id v16 = a9;
  id v17 = a10;
  if (v15) {
    BOOL v18 = 1;
  }
  else {
    BOOL v18 = +[TPSNotificationController isValidNotificationInterval];
  }
  BOOL v34 = a4;
  long long v33 = v17;
  if (!+[TPSNotificationController supportsNotification]|| !v18)
  {

    id v15 = 0;
    BOOL v10 = 0;
  }
  id v19 = [MEMORY[0x1E4FAF480] daemon];
  if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 67110146;
    *(_DWORD *)&uint8_t buf[4] = v13;
    LOWORD(v64) = 1024;
    *(_DWORD *)((char *)&v64 + 2) = v11;
    HIWORD(v64) = 1024;
    *(_DWORD *)id v65 = v35;
    *(_WORD *)&v65[4] = 1024;
    *(_DWORD *)&v65[6] = v10;
    *(_WORD *)&v65[10] = 2112;
    *(void *)&v65[12] = v15;
    _os_log_impl(&dword_1E4492000, v19, OS_LOG_TYPE_DEFAULT, "update content from origin: %d contextualEligibility:%d widgetEligibility:%d notificationEligibility: %d preferredNotificationIdentifiers: %@", buf, 0x24u);
  }

  objc_initWeak(&location, self);
  *(void *)buf = 0;
  char v64 = buf;
  *(void *)id v65 = 0x3032000000;
  *(void *)&v65[8] = __Block_byref_object_copy__1;
  *(void *)&v65[16] = __Block_byref_object_dispose__1;
  id v66 = 0;
  v60[0] = 0;
  v60[1] = v60;
  v60[2] = 0x3032000000;
  v60[3] = __Block_byref_object_copy__1;
  v60[4] = __Block_byref_object_dispose__1;
  id v61 = 0;
  v58[0] = 0;
  v58[1] = v58;
  v58[2] = 0x3032000000;
  v58[3] = __Block_byref_object_copy__1;
  v58[4] = __Block_byref_object_dispose__1;
  id v59 = 0;
  v56[0] = 0;
  v56[1] = v56;
  v56[2] = 0x3032000000;
  v56[3] = __Block_byref_object_copy__1;
  v56[4] = __Block_byref_object_dispose__1;
  id v20 = @"com.apple.tipsd";
  if (!v13) {
    id v20 = 0;
  }
  id v57 = v20;
  uint64_t v21 = [MEMORY[0x1E4FAF4A0] transactionWithName:@"com.apple.TipsDaemon.updateContent"];
  id v22 = objc_alloc_init(MEMORY[0x1E4F28F08]);
  [v22 setMaxConcurrentOperationCount:1];
  id v23 = objc_alloc(MEMORY[0x1E4FAF3C8]);
  v50[0] = MEMORY[0x1E4F143A8];
  v50[1] = 3221225472;
  v50[2] = __189__TPSTipsManager_contentFromOrigin_processTipKitContent_contextualEligibility_widgetEligibility_notificationEligibility_preferredNotificationIdentifiers_shouldDeferBlock_completionHandler___block_invoke;
  v50[3] = &unk_1E6E6B1E8;
  v52 = v58;
  objc_copyWeak(&v55, &location);
  id v32 = v16;
  id v51 = v32;
  id v53 = v56;
  id v54 = buf;
  id v24 = (void *)[v23 initWithAsyncBlock:v50];
  [v22 addOperation:v24];
  id v25 = objc_alloc(MEMORY[0x1E4FAF3C8]);
  v48[0] = MEMORY[0x1E4F143A8];
  v48[1] = 3221225472;
  v48[2] = __189__TPSTipsManager_contentFromOrigin_processTipKitContent_contextualEligibility_widgetEligibility_notificationEligibility_preferredNotificationIdentifiers_shouldDeferBlock_completionHandler___block_invoke_3;
  v48[3] = &unk_1E6E6B260;
  v48[5] = buf;
  v48[6] = v58;
  v48[7] = v56;
  objc_copyWeak(&v49, &location);
  v48[8] = v60;
  void v48[4] = self;
  id v26 = (void *)[v25 initWithAsyncBlock:v48];
  [v26 addDependency:v24];
  [v22 addOperation:v26];
  id v27 = objc_alloc(MEMORY[0x1E4FAF3C8]);
  v36[0] = MEMORY[0x1E4F143A8];
  v36[1] = 3221225472;
  v36[2] = __189__TPSTipsManager_contentFromOrigin_processTipKitContent_contextualEligibility_widgetEligibility_notificationEligibility_preferredNotificationIdentifiers_shouldDeferBlock_completionHandler___block_invoke_3_140;
  v36[3] = &unk_1E6E6B2B0;
  objc_copyWeak(&v43, &location);
  id v40 = buf;
  uint64_t v41 = v60;
  uint64_t v42 = v58;
  BOOL v44 = v34;
  BOOL v45 = v11;
  BOOL v46 = v35;
  BOOL v47 = v10;
  id v28 = v15;
  id v37 = v28;
  id v29 = v33;
  id v39 = v29;
  id v30 = v21;
  id v38 = v30;
  id v31 = (void *)[v27 initWithAsyncBlock:v36];
  [v31 addDependency:v26];
  [v22 addOperation:v31];

  objc_destroyWeak(&v43);
  objc_destroyWeak(&v49);

  objc_destroyWeak(&v55);
  _Block_object_dispose(v56, 8);

  _Block_object_dispose(v58, 8);
  _Block_object_dispose(v60, 8);

  _Block_object_dispose(buf, 8);
  objc_destroyWeak(&location);
}

- (void)contentWithMetaDictionary:(id)a3 documents:(id)a4 isRemote:(BOOL)a5 processTipKitContent:(BOOL)a6 contextualEligibility:(BOOL)a7 widgetEligibility:(BOOL)a8 notificationEligibility:(BOOL)a9 preferredNotificationIdentifiers:(id)a10 completionHandler:(id)a11
{
  BOOL v71 = a6;
  BOOL v72 = a8;
  BOOL v11 = a7;
  uint64_t v226 = *MEMORY[0x1E4F143B8];
  id v14 = a3;
  id v82 = a4;
  id v77 = a10;
  id v81 = a11;
  objc_initWeak(&location, self);
  v84 = [MEMORY[0x1E4FAF488] metadataFromDictionary:v14];
  id v15 = (void *)[objc_alloc(MEMORY[0x1E4FAF488]) initWithDictionary:v84];
  if (v15)
  {
    id v76 = objc_alloc_init(TPSTargetingCache);
    id v73 = v15;
    id v80 = [v84 TPSSafeStringForKey:@"rulesHash"];
    id v16 = [(TPSTipsManager *)self rulesVersion];
    char v17 = [v16 isEqualToString:v80];

    if ((v17 & 1) == 0)
    {
      [(TPSTipsManager *)self setRulesVersion:v80];
      BOOL v18 = [MEMORY[0x1E4F1CB18] standardUserDefaults];
      [v18 setObject:v80 forKey:@"DeliveryInfoVersion"];
      [v18 synchronize];
    }
    id v74 = [v84 TPSSafeDictionaryForKey:@"experiment"];
    id v19 = [(TPSTipsManager *)self experiment];
    uint64_t v20 = [v19 camp];

    uint64_t v21 = [(TPSTipsManager *)self experiment];
    int v22 = [v21 updateWithExperimentDictionary:v74];

    if (v22)
    {
      [(TPSTipsManager *)self _updateExperimentCache];
      id v23 = [MEMORY[0x1E4FAF480] discoverability];
      if (os_log_type_enabled(v23, OS_LOG_TYPE_DEFAULT))
      {
        id v24 = [(TPSTipsManager *)self experiment];
        id v25 = [v24 debugDescription];
        LODWORD(buf) = 138412290;
        *(void *)((char *)&buf + 4) = v25;
        _os_log_impl(&dword_1E4492000, v23, OS_LOG_TYPE_DEFAULT, "Experiment changed %@", (uint8_t *)&buf, 0xCu);
      }
      id v26 = [(TPSTipsManager *)self experiment];
      uint64_t v27 = [v26 camp];

      BOOL v29 = v20 == 2 && v27 == 1;
    }
    else
    {
      BOOL v29 = 0;
    }
    id v30 = [(TPSTipsManager *)self syncQueue];
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __199__TPSTipsManager_contentWithMetaDictionary_documents_isRemote_processTipKitContent_contextualEligibility_widgetEligibility_notificationEligibility_preferredNotificationIdentifiers_completionHandler___block_invoke;
    block[3] = &unk_1E6E6B2D8;
    objc_copyWeak(&v219, &location);
    id v67 = v73;
    id v218 = v67;
    dispatch_async(v30, block);

    id v31 = objc_alloc_init(MEMORY[0x1E4F28F08]);
    [v31 setMaxConcurrentOperationCount:4];
    *(void *)&long long buf = 0;
    *((void *)&buf + 1) = &buf;
    uint64_t v222 = 0x3032000000;
    v223 = __Block_byref_object_copy__1;
    v224 = __Block_byref_object_dispose__1;
    id v225 = 0;
    v215[0] = 0;
    v215[1] = v215;
    v215[2] = 0x3032000000;
    v215[3] = __Block_byref_object_copy__1;
    v215[4] = __Block_byref_object_dispose__1;
    id v216 = 0;
    id v32 = objc_alloc(MEMORY[0x1E4FAF3C8]);
    v212[0] = MEMORY[0x1E4F143A8];
    v212[1] = 3221225472;
    v212[2] = __199__TPSTipsManager_contentWithMetaDictionary_documents_isRemote_processTipKitContent_contextualEligibility_widgetEligibility_notificationEligibility_preferredNotificationIdentifiers_completionHandler___block_invoke_2;
    v212[3] = &unk_1E6E6B328;
    v212[4] = self;
    id v33 = v82;
    id v213 = v33;
    p_long long buf = &buf;
    BOOL v34 = (void *)[v32 initWithAsyncBlock:v212];
    [v34 setName:@"content-fetch"];
    id v78 = v34;
    v210[0] = 0;
    v210[1] = v210;
    v210[2] = 0x3032000000;
    v210[3] = __Block_byref_object_copy__1;
    v210[4] = __Block_byref_object_dispose__1;
    id v211 = 0;
    v208[0] = 0;
    v208[1] = v208;
    v208[2] = 0x3032000000;
    v208[3] = __Block_byref_object_copy__1;
    v208[4] = __Block_byref_object_dispose__1;
    id v209 = 0;
    v206[0] = 0;
    v206[1] = v206;
    v206[2] = 0x3032000000;
    v206[3] = __Block_byref_object_copy__1;
    v206[4] = __Block_byref_object_dispose__1;
    id v207 = 0;
    v204[0] = 0;
    v204[1] = v204;
    v204[2] = 0x3032000000;
    v204[3] = __Block_byref_object_copy__1;
    v204[4] = __Block_byref_object_dispose__1;
    id v205 = 0;
    v202[0] = 0;
    v202[1] = v202;
    v202[2] = 0x3032000000;
    v202[3] = __Block_byref_object_copy__1;
    v202[4] = __Block_byref_object_dispose__1;
    id v203 = 0;
    v200[0] = 0;
    v200[1] = v200;
    v200[2] = 0x3032000000;
    v200[3] = __Block_byref_object_copy__1;
    v200[4] = __Block_byref_object_dispose__1;
    id v201 = 0;
    BOOL v35 = [v14 TPSSafeStringForKey:@"rootCollectionId"];
    id v36 = [v14 TPSSafeDictionaryForKey:@"collectionsMap"];
    id v66 = v33;
    id v37 = [MEMORY[0x1E4FAF460] deliveryInfoForDictionary:v14];
    id v38 = objc_alloc(MEMORY[0x1E4FAF3C8]);
    v190[0] = MEMORY[0x1E4F143A8];
    v190[1] = 3221225472;
    v190[2] = __199__TPSTipsManager_contentWithMetaDictionary_documents_isRemote_processTipKitContent_contextualEligibility_widgetEligibility_notificationEligibility_preferredNotificationIdentifiers_completionHandler___block_invoke_4;
    v190[3] = &unk_1E6E6B378;
    id v69 = v35;
    id v191 = v69;
    id v70 = v36;
    id v192 = v70;
    v193 = self;
    v194 = v210;
    v195 = v208;
    v196 = v204;
    v197 = v202;
    v198 = v200;
    v199 = v206;
    id v39 = (void *)[v38 initWithAsyncBlock:v190];
    [v39 setName:@"process-collection"];
    id v79 = v39;
    v188[0] = 0;
    v188[1] = v188;
    v188[2] = 0x3032000000;
    v188[3] = __Block_byref_object_copy__1;
    v188[4] = __Block_byref_object_dispose__1;
    id v189 = 0;
    v186[0] = 0;
    v186[1] = v186;
    v186[2] = 0x3032000000;
    v186[3] = __Block_byref_object_copy__1;
    v186[4] = __Block_byref_object_dispose__1;
    id v187 = 0;
    id v40 = [v14 TPSSafeDictionaryForKey:@"documentsMap"];
    if ([v40 count])
    {
      id v41 = objc_alloc(MEMORY[0x1E4FAF3C8]);
      v179[0] = MEMORY[0x1E4F143A8];
      v179[1] = 3221225472;
      v179[2] = __199__TPSTipsManager_contentWithMetaDictionary_documents_isRemote_processTipKitContent_contextualEligibility_widgetEligibility_notificationEligibility_preferredNotificationIdentifiers_completionHandler___block_invoke_154;
      v179[3] = &unk_1E6E6B3C8;
      objc_copyWeak(&v185, &location);
      id v180 = v40;
      id v181 = v37;
      v182 = v76;
      v183 = v188;
      v184 = v186;
      id v83 = (void *)[v41 initWithAsyncBlock:v179];
      [v83 setName:@"process-tips"];

      objc_destroyWeak(&v185);
    }
    else
    {
      id v83 = 0;
    }
    v177[0] = 0;
    v177[1] = v177;
    v177[2] = 0x3032000000;
    v177[3] = __Block_byref_object_copy__1;
    v177[4] = __Block_byref_object_dispose__1;
    id v178 = 0;
    v175[0] = 0;
    v175[1] = v175;
    v175[2] = 0x3032000000;
    v175[3] = __Block_byref_object_copy__1;
    v175[4] = __Block_byref_object_dispose__1;
    id v176 = 0;
    v173[0] = 0;
    v173[1] = v173;
    v173[2] = 0x3032000000;
    v173[3] = __Block_byref_object_copy__1;
    v173[4] = __Block_byref_object_dispose__1;
    id v174 = 0;
    v171[0] = 0;
    v171[1] = v171;
    v171[2] = 0x3032000000;
    v171[3] = __Block_byref_object_copy__1;
    v171[4] = __Block_byref_object_dispose__1;
    id v172 = 0;
    v169[0] = 0;
    v169[1] = v169;
    v169[2] = 0x3032000000;
    v169[3] = __Block_byref_object_copy__1;
    v169[4] = __Block_byref_object_dispose__1;
    id v170 = 0;
    v167[0] = 0;
    v167[1] = v167;
    v167[2] = 0x3032000000;
    v167[3] = __Block_byref_object_copy__1;
    v167[4] = __Block_byref_object_dispose__1;
    id v168 = 0;
    v165[0] = 0;
    v165[1] = v165;
    v165[2] = 0x3032000000;
    v165[3] = __Block_byref_object_copy__1;
    v165[4] = __Block_byref_object_dispose__1;
    id v166 = 0;
    id v42 = objc_alloc(MEMORY[0x1E4FAF3C8]);
    v148[0] = MEMORY[0x1E4F143A8];
    v148[1] = 3221225472;
    v148[2] = __199__TPSTipsManager_contentWithMetaDictionary_documents_isRemote_processTipKitContent_contextualEligibility_widgetEligibility_notificationEligibility_preferredNotificationIdentifiers_completionHandler___block_invoke_3_160;
    v148[3] = &unk_1E6E6B418;
    v148[4] = self;
    v151 = v210;
    v152 = v204;
    v153 = v202;
    v154 = v188;
    v155 = v186;
    v156 = &buf;
    v157 = v215;
    id v68 = v40;
    id v149 = v68;
    id v75 = v37;
    id v150 = v75;
    objc_copyWeak(&v164, &location);
    v158 = v177;
    v159 = v175;
    v160 = v173;
    v161 = v171;
    v162 = v169;
    v163 = v167;
    id v43 = (void *)[v42 initWithAsyncBlock:v148];
    [v31 addOperation:v78];
    [v31 addOperation:v79];
    [v43 setName:@"process-eligibility"];
    [v43 addDependency:v78];
    [v43 addDependency:v79];
    if (v83)
    {
      [v31 addOperation:v83];
      [v43 addDependency:v83];
    }
    [v31 addOperation:v43];
    if (v11)
    {
      if ([(TPSTipsManager *)self contextualTipsInactive])
      {
        BOOL v44 = [MEMORY[0x1E4FAF480] discoverability];
        if (os_log_type_enabled(v44, OS_LOG_TYPE_DEFAULT))
        {
          *(_WORD *)v136 = 0;
          _os_log_impl(&dword_1E4492000, v44, OS_LOG_TYPE_DEFAULT, "Contextual tips content inactive, skipping.", v136, 2u);
        }
      }
      else
      {
        id v45 = objc_alloc(MEMORY[0x1E4FAF3C8]);
        v142[0] = MEMORY[0x1E4F143A8];
        v142[1] = 3221225472;
        v142[2] = __199__TPSTipsManager_contentWithMetaDictionary_documents_isRemote_processTipKitContent_contextualEligibility_widgetEligibility_notificationEligibility_preferredNotificationIdentifiers_completionHandler___block_invoke_167;
        v142[3] = &unk_1E6E6B440;
        objc_copyWeak(&v146, &location);
        v144 = v167;
        v145 = v169;
        id v143 = v75;
        BOOL v147 = v29;
        BOOL v46 = (void *)[v45 initWithAsyncBlock:v142];
        [v46 setName:@"contextual-eligibility"];
        [v46 addDependency:v43];
        [v31 addOperation:v46];

        objc_destroyWeak(&v146);
      }
    }
    id v47 = v43;
    *(void *)v136 = 0;
    v137 = v136;
    uint64_t v138 = 0x3032000000;
    v139 = __Block_byref_object_copy__1;
    v140 = __Block_byref_object_dispose__1;
    id v141 = 0;
    uint64_t v48 = [v14 TPSSafeDictionaryForKey:@"globalConditions"];
    id v49 = [v48 TPSSafeDictionaryForKey:@"clientConditions"];
    uint64_t v50 = v47;
    if ([v49 count])
    {
      id v51 = objc_alloc(MEMORY[0x1E4FAF3C8]);
      v127[0] = MEMORY[0x1E4F143A8];
      v127[1] = 3221225472;
      v127[2] = __199__TPSTipsManager_contentWithMetaDictionary_documents_isRemote_processTipKitContent_contextualEligibility_widgetEligibility_notificationEligibility_preferredNotificationIdentifiers_completionHandler___block_invoke_2_171;
      v127[3] = &unk_1E6E6B490;
      objc_copyWeak(&v135, &location);
      id v128 = v49;
      long long v129 = v76;
      long long v130 = v136;
      long long v131 = v204;
      v132 = v175;
      uint64_t v133 = &buf;
      v134 = v171;
      uint64_t v50 = (void *)[v51 initWithAsyncBlock:v127];
      [v50 setName:@"process-client-conditions"];
      [v50 addDependency:v47];
      [v31 addOperation:v50];

      objc_destroyWeak(&v135);
    }
    if (v72)
    {
      id v52 = objc_alloc(MEMORY[0x1E4FAF3C8]);
      v120[0] = MEMORY[0x1E4F143A8];
      v120[1] = 3221225472;
      v120[2] = __199__TPSTipsManager_contentWithMetaDictionary_documents_isRemote_processTipKitContent_contextualEligibility_widgetEligibility_notificationEligibility_preferredNotificationIdentifiers_completionHandler___block_invoke_176;
      v120[3] = &unk_1E6E6B4E0;
      objc_copyWeak(&v126, &location);
      v120[4] = self;
      uint64_t v122 = v175;
      char v123 = v171;
      uint64_t v124 = v173;
      v125 = v169;
      id v121 = v75;
      id v53 = (void *)[v52 initWithAsyncBlock:v120];
      [v53 setName:@"widget-eligibility"];
      [v53 addDependency:v50];
      [v31 addOperation:v53];

      objc_destroyWeak(&v126);
    }
    if (a9)
    {
      id v54 = objc_opt_class();
      id v55 = [v67 language];
      LODWORD(v54) = [v54 deviceLocalesContainLanguage:v55];

      if (v54)
      {
        if (v77)
        {
          id v56 = 0;
        }
        else
        {
          id v57 = objc_alloc(MEMORY[0x1E4FAF3C8]);
          v115[0] = MEMORY[0x1E4F143A8];
          v115[1] = 3221225472;
          v115[2] = __199__TPSTipsManager_contentWithMetaDictionary_documents_isRemote_processTipKitContent_contextualEligibility_widgetEligibility_notificationEligibility_preferredNotificationIdentifiers_completionHandler___block_invoke_184;
          v115[3] = &unk_1E6E6B530;
          objc_copyWeak(&v119, &location);
          v117 = v173;
          uint64_t v118 = v169;
          id v116 = v75;
          id v56 = (void *)[v57 initWithAsyncBlock:v115];
          [v56 setName:@"immediate-notification-eligibility"];
          [v56 addDependency:v50];
          [v31 addOperation:v56];

          objc_destroyWeak(&v119);
        }
        v113[0] = 0;
        v113[1] = v113;
        v113[2] = 0x3032000000;
        v113[3] = __Block_byref_object_copy__1;
        v113[4] = __Block_byref_object_dispose__1;
        id v114 = 0;
        id v58 = objc_alloc(MEMORY[0x1E4FAF3C8]);
        v101[0] = MEMORY[0x1E4F143A8];
        v101[1] = 3221225472;
        v101[2] = __199__TPSTipsManager_contentWithMetaDictionary_documents_isRemote_processTipKitContent_contextualEligibility_widgetEligibility_notificationEligibility_preferredNotificationIdentifiers_completionHandler___block_invoke_3_190;
        v101[3] = &unk_1E6E6B580;
        objc_copyWeak(&v112, &location);
        id v105 = &buf;
        id v102 = v77;
        v106 = v177;
        id v107 = v175;
        id v108 = v173;
        id v109 = v171;
        id v110 = v169;
        id v103 = v75;
        id v104 = v84;
        id v111 = v113;
        id v59 = (void *)[v58 initWithAsyncBlock:v101];
        [v59 setName:@"notification-eligibility"];
        [v59 addDependency:v50];
        if (v56) {
          [v59 addDependency:v56];
        }
        [v31 addOperation:v59];

        objc_destroyWeak(&v112);
        _Block_object_dispose(v113, 8);
      }
    }
    if (v71
      && +[TPSTipsManager setTipKitContentProcessFlagIfNeeded])
    {
      id v60 = objc_alloc(MEMORY[0x1E4FAF3C8]);
      v100[0] = MEMORY[0x1E4F143A8];
      v100[1] = 3221225472;
      v100[2] = __199__TPSTipsManager_contentWithMetaDictionary_documents_isRemote_processTipKitContent_contextualEligibility_widgetEligibility_notificationEligibility_preferredNotificationIdentifiers_completionHandler___block_invoke_5_196;
      v100[3] = &unk_1E6E6B5D0;
      v100[4] = self;
      id v61 = (void *)[v60 initWithAsyncBlock:v100];
      [v61 setName:@"update-tipkit-device-profile"];
      [v61 addDependency:v50];
      [v31 addOperation:v61];
      id v62 = objc_alloc(MEMORY[0x1E4FAF3C8]);
      v96[0] = MEMORY[0x1E4F143A8];
      v96[1] = 3221225472;
      v96[2] = __199__TPSTipsManager_contentWithMetaDictionary_documents_isRemote_processTipKitContent_contextualEligibility_widgetEligibility_notificationEligibility_preferredNotificationIdentifiers_completionHandler___block_invoke_202;
      v96[3] = &unk_1E6E6B328;
      id v97 = v14;
      id v98 = v66;
      id v99 = v136;
      id v63 = (void *)[v62 initWithAsyncBlock:v96];
      [v63 setName:@"process-TipKit-tips"];
      [v63 addDependency:v61];
      [v31 addOperation:v63];
      [v31 addBarrierBlock:&__block_literal_global_0];
    }
    id v64 = objc_alloc(MEMORY[0x1E4FAF3C8]);
    v95[0] = MEMORY[0x1E4F143A8];
    v95[1] = 3221225472;
    v95[2] = __199__TPSTipsManager_contentWithMetaDictionary_documents_isRemote_processTipKitContent_contextualEligibility_widgetEligibility_notificationEligibility_preferredNotificationIdentifiers_completionHandler___block_invoke_2_209;
    v95[3] = &unk_1E6E6B618;
    v95[4] = v165;
    id v65 = (void *)[v64 initWithAsyncBlock:v95];
    [v65 setName:@"user-guides"];
    [v31 addOperation:v65];
    v85[0] = MEMORY[0x1E4F143A8];
    v85[1] = 3221225472;
    v85[2] = __199__TPSTipsManager_contentWithMetaDictionary_documents_isRemote_processTipKitContent_contextualEligibility_widgetEligibility_notificationEligibility_preferredNotificationIdentifiers_completionHandler___block_invoke_3_214;
    v85[3] = &unk_1E6E6B640;
    objc_copyWeak(&v94, &location);
    uint64_t v87 = v177;
    id v88 = v175;
    v89 = v171;
    id v90 = v165;
    id v91 = v206;
    id v92 = v200;
    v93 = v208;
    id v86 = v81;
    [v31 addBarrierBlock:v85];

    objc_destroyWeak(&v94);
    _Block_object_dispose(v136, 8);

    objc_destroyWeak(&v164);
    _Block_object_dispose(v165, 8);

    _Block_object_dispose(v167, 8);
    _Block_object_dispose(v169, 8);

    _Block_object_dispose(v171, 8);
    _Block_object_dispose(v173, 8);

    _Block_object_dispose(v175, 8);
    _Block_object_dispose(v177, 8);

    _Block_object_dispose(v186, 8);
    _Block_object_dispose(v188, 8);

    _Block_object_dispose(v200, 8);
    _Block_object_dispose(v202, 8);

    _Block_object_dispose(v204, 8);
    _Block_object_dispose(v206, 8);

    _Block_object_dispose(v208, 8);
    _Block_object_dispose(v210, 8);

    _Block_object_dispose(v215, 8);
    _Block_object_dispose(&buf, 8);

    objc_destroyWeak(&v219);
    id v15 = v73;
  }

  objc_destroyWeak(&location);
}

- (TPSExperiment)experiment
{
  return self->_experiment;
}

- (NSString)rulesVersion
{
  return self->_rulesVersion;
}

void __189__TPSTipsManager_contentFromOrigin_processTipKitContent_contextualEligibility_widgetEligibility_notificationEligibility_preferredNotificationIdentifiers_shouldDeferBlock_completionHandler___block_invoke_3(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = v3;
  if (*(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 40)) {
    BOOL v5 = *(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 40) == 0;
  }
  else {
    BOOL v5 = 0;
  }
  if (v5)
  {
    id v23 = objc_msgSend(MEMORY[0x1E4FAF488], "metadataFromDictionary:");
    int v22 = [v23 TPSSafeStringForKey:@"contentMapHash"];
    uint64_t v6 = objc_msgSend(MEMORY[0x1E4FAF418], "contentRequestURLWithContentMapHash:");
    uint64_t v21 = (void *)v6;
    if (v6)
    {
      id v7 = objc_msgSend(MEMORY[0x1E4F28E88], "requestWithURL:", v6, v6);
      [v7 setCachePolicy:5];
    }
    else
    {
      id v7 = 0;
    }
    id v8 = v7;
    uint64_t v33 = 0;
    BOOL v34 = &v33;
    uint64_t v35 = 0x3032000000;
    id v36 = __Block_byref_object_copy__1;
    id v37 = __Block_byref_object_dispose__1;
    id v38 = 0;
    id v9 = [MEMORY[0x1E4FAF478] sharedInstance];
    uint64_t v10 = *MEMORY[0x1E4FAF528];
    uint64_t v11 = *(void *)(*(void *)(*(void *)(a1 + 56) + 8) + 40);
    uint64_t v12 = *MEMORY[0x1E4FAF500];
    int v13 = *MEMORY[0x1E4F28A00];
    v26[0] = MEMORY[0x1E4F143A8];
    v26[1] = 3221225472;
    v26[2] = __189__TPSTipsManager_contentFromOrigin_processTipKitContent_contextualEligibility_widgetEligibility_notificationEligibility_preferredNotificationIdentifiers_shouldDeferBlock_completionHandler___block_invoke_4;
    v26[3] = &unk_1E6E6B210;
    id v14 = (id *)(a1 + 72);
    objc_copyWeak(&v32, (id *)(a1 + 72));
    uint64_t v29 = *(void *)(a1 + 48);
    id v15 = v8;
    uint64_t v16 = *(void *)(a1 + 64);
    id v27 = v15;
    uint64_t v30 = v16;
    id v31 = &v33;
    id v28 = v4;
    LODWORD(v17) = v13;
    uint64_t v18 = [v9 formattedDataForRequest:v15 identifier:v10 attributionIdentifier:v11 requestType:v12 priority:v26 completionHandler:v17];
    id v19 = (void *)v34[5];
    v34[5] = v18;

    if (v34[5])
    {
      uint64_t v20 = [*(id *)(a1 + 32) syncQueue];
      block[0] = MEMORY[0x1E4F143A8];
      block[1] = 3221225472;
      block[2] = __189__TPSTipsManager_contentFromOrigin_processTipKitContent_contextualEligibility_widgetEligibility_notificationEligibility_preferredNotificationIdentifiers_shouldDeferBlock_completionHandler___block_invoke_2_139;
      block[3] = &unk_1E6E6B238;
      objc_copyWeak(&v25, v14);
      void block[4] = &v33;
      dispatch_async(v20, block);

      objc_destroyWeak(&v25);
    }
    _Block_object_dispose(&v33, 8);

    objc_destroyWeak(&v32);
  }
  else
  {
    (*((void (**)(id))v3 + 2))(v3);
  }
}

void __189__TPSTipsManager_contentFromOrigin_processTipKitContent_contextualEligibility_widgetEligibility_notificationEligibility_preferredNotificationIdentifiers_shouldDeferBlock_completionHandler___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = [MEMORY[0x1E4FAF418] metaRequestURL];
  BOOL v5 = [MEMORY[0x1E4F28E88] requestWithURL:v4];
  [v5 setCachePolicy:5];
  if (v5)
  {
    id WeakRetained = objc_loadWeakRetained((id *)(a1 + 64));
    uint64_t v7 = *(void *)(a1 + 32);
    if (v7 && (*(unsigned int (**)(void))(v7 + 16))())
    {
      uint64_t v8 = [MEMORY[0x1E4F28C58] errorWithDomain:@"com.apple.tips.TPSTipsManager" code:4 userInfo:0];
      uint64_t v9 = *(void *)(*(void *)(a1 + 40) + 8);
      uint64_t v10 = *(void **)(v9 + 40);
      *(void *)(v9 + 40) = v8;

      v3[2](v3, *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 40));
    }
    else
    {
      uint64_t v36 = 0;
      id v37 = &v36;
      uint64_t v38 = 0x3032000000;
      id v39 = __Block_byref_object_copy__1;
      id v40 = __Block_byref_object_dispose__1;
      id v41 = 0;
      uint64_t v11 = [MEMORY[0x1E4FAF478] sharedInstance];
      uint64_t v12 = *MEMORY[0x1E4FAF530];
      uint64_t v13 = *(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 40);
      uint64_t v14 = *MEMORY[0x1E4FAF4E8];
      int v15 = *MEMORY[0x1E4F28A00];
      v28[0] = MEMORY[0x1E4F143A8];
      v28[1] = 3221225472;
      v28[2] = __189__TPSTipsManager_contentFromOrigin_processTipKitContent_contextualEligibility_widgetEligibility_notificationEligibility_preferredNotificationIdentifiers_shouldDeferBlock_completionHandler___block_invoke_2;
      v28[3] = &unk_1E6E6B1C0;
      id v16 = *(id *)(a1 + 32);
      uint64_t v17 = *(void *)(a1 + 40);
      id v31 = v16;
      uint64_t v33 = v17;
      id v18 = v5;
      uint64_t v19 = *(void *)(a1 + 56);
      id v29 = v18;
      id v30 = WeakRetained;
      uint64_t v34 = v19;
      uint64_t v35 = &v36;
      id v32 = v3;
      LODWORD(v20) = v15;
      uint64_t v21 = [v11 formattedDataForRequest:v18 identifier:v12 attributionIdentifier:v13 requestType:v14 priority:v28 completionHandler:v20];
      int v22 = (void *)v37[5];
      v37[5] = v21;

      if (v37[5])
      {
        id v23 = [WeakRetained syncQueue];
        block[0] = MEMORY[0x1E4F143A8];
        block[1] = 3221225472;
        block[2] = __189__TPSTipsManager_contentFromOrigin_processTipKitContent_contextualEligibility_widgetEligibility_notificationEligibility_preferredNotificationIdentifiers_shouldDeferBlock_completionHandler___block_invoke_2_136;
        block[3] = &unk_1E6E6B148;
        void block[4] = WeakRetained;
        void block[5] = &v36;
        dispatch_async(v23, block);
      }
      _Block_object_dispose(&v36, 8);
    }
  }
  else
  {
    uint64_t v24 = [MEMORY[0x1E4F28C58] errorWithDomain:@"com.apple.TipsDaemon.ContentFetchError" code:1 userInfo:0];
    uint64_t v25 = *(void *)(*(void *)(a1 + 40) + 8);
    id v26 = *(void **)(v25 + 40);
    *(void *)(v25 + 40) = v24;

    v3[2](v3, *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 40));
  }
}

- (id)featureCollectionFromCollectionMap:(id)a3 collectionOrder:(id)a4 tipMap:(id)a5
{
  uint64_t v76 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  id v64 = self;
  if (![(id)objc_opt_class() supportsFeaturedCollection])
  {
    id v33 = 0;
    goto LABEL_54;
  }
  uint64_t v11 = objc_msgSend(MEMORY[0x1E4F1CA48], "arrayWithCapacity:", objc_msgSend(v9, "count"));
  uint64_t v12 = [MEMORY[0x1E4FAF450] featuredCollection];
  long long v70 = 0u;
  long long v71 = 0u;
  long long v72 = 0u;
  long long v73 = 0u;
  id v13 = v9;
  uint64_t v14 = [v13 countByEnumeratingWithState:&v70 objects:v75 count:16];
  id v58 = v11;
  id v59 = v12;
  if (!v14)
  {

    id v65 = 0;
    id v60 = 0;
    uint64_t v34 = 0;
    uint64_t v25 = 0;
    BOOL v26 = 1;
    goto LABEL_38;
  }
  uint64_t v15 = v14;
  id v55 = v9;
  id v56 = v10;
  id v62 = 0;
  id v63 = 0;
  id v60 = 0;
  id v65 = 0;
  uint64_t v16 = *(void *)v71;
  char v57 = 1;
  while (2)
  {
    uint64_t v17 = 0;
    uint64_t v61 = v15;
    do
    {
      if (*(void *)v71 != v16) {
        objc_enumerationMutation(v13);
      }
      id v18 = [v8 objectForKeyedSubscript:*(void *)(*((void *)&v70 + 1) + 8 * v17)];
      if ([v18 priority] == 1)
      {
        [v11 addObject:v18];
        uint64_t v19 = [v18 identifier];
        char v20 = [v19 isEqualToString:v12];

        if (v20)
        {
          [v18 setTopFeatured:1];
          id v33 = v18;

          id v9 = v55;
          id v10 = v56;
          uint64_t v34 = v62;
          uint64_t v25 = v63;
          goto LABEL_53;
        }
        uint64_t v21 = [(TPSTipsManager *)v64 collectionStatusForCollection:v18];
        int v22 = [v21 featuredDate];
        if (v22)
        {
          if (!v63 || [v63 compare:v22] == -1)
          {
            id v23 = v18;

            id v24 = v22;
            id v62 = v23;
            id v63 = v24;
            uint64_t v11 = v58;
            uint64_t v12 = v59;
          }
          uint64_t v15 = v61;
        }
        else
        {
          if (!v60)
          {
            if ([v18 isChecklist]
              && ![(TPSTipsManager *)v64 checklistCollectionHasMinSuggestedTips:v18 tipMap:v56])
            {
              id v60 = 0;
            }
            else
            {
              id v60 = v18;
            }
          }
          char v57 = 0;
        }
        if (!v65) {
          id v65 = v18;
        }
      }
      ++v17;
    }
    while (v15 != v17);
    uint64_t v15 = [v13 countByEnumeratingWithState:&v70 objects:v75 count:16];
    if (v15) {
      continue;
    }
    break;
  }

  uint64_t v25 = v63;
  BOOL v26 = v62 == 0;
  id v10 = v56;
  if (v62)
  {
    [v63 timeIntervalSinceNow];
    if (v27 >= 0.0)
    {
      if (v57)
      {
LABEL_78:
        id v37 = v62;
        id v54 = [MEMORY[0x1E4FAF480] default];
        if (os_log_type_enabled(v54, OS_LOG_TYPE_DEBUG)) {
          -[TPSTipsManager featureCollectionFromCollectionMap:collectionOrder:tipMap:](v37);
        }

        uint64_t v34 = v37;
        id v9 = v55;
        uint64_t v12 = v59;
LABEL_50:
        if (([v37 isEqual:v34] & 1) == 0)
        {
          id v40 = [(TPSTipsManager *)v64 collectionStatusForCollection:v37];
          id v41 = [MEMORY[0x1E4F1C9C8] date];
          [v40 setFeaturedDate:v41];

          id v42 = [MEMORY[0x1E4FAF3F8] sharedInstance];
          [v42 syncCollectionStatusMap];

          uint64_t v11 = v58;
        }
        goto LABEL_52;
      }
    }
    else
    {
      double v28 = v27;
      [MEMORY[0x1E4FAF450] discoverabilitySuppressionInterval];
      if (v29 <= 0.0) {
        double v30 = 604800.0;
      }
      else {
        double v30 = v29;
      }
      double v31 = fabs(v28);
      id v32 = [MEMORY[0x1E4FAF480] default];
      if (os_log_type_enabled(v32, OS_LOG_TYPE_DEBUG)) {
        -[TPSTipsManager featureCollectionFromCollectionMap:collectionOrder:tipMap:].cold.5(v62);
      }

      if ((v30 <= v31) | v57 & 1)
      {
        if (v30 > v31) {
          goto LABEL_78;
        }
        goto LABEL_76;
      }
    }
    if ([v62 isChecklist])
    {
      int v44 = ![(TPSTipsManager *)v64 checklistCollectionHasMinSuggestedTips:v62 tipMap:v56];
    }
    else
    {
      id v45 = [v62 tipIdentifiers];
      BOOL v46 = [MEMORY[0x1E4FAF3F8] sharedInstance];
      id v47 = [v46 tipStatusController];

      long long v68 = 0u;
      long long v69 = 0u;
      long long v66 = 0u;
      long long v67 = 0u;
      id v48 = v45;
      uint64_t v49 = [v48 countByEnumeratingWithState:&v66 objects:v74 count:16];
      if (v49)
      {
        uint64_t v50 = v49;
        uint64_t v51 = *(void *)v67;
        while (2)
        {
          for (uint64_t i = 0; i != v50; ++i)
          {
            if (*(void *)v67 != v51) {
              objc_enumerationMutation(v48);
            }
            if (![v47 isContentViewedForIdentifier:*(void *)(*((void *)&v66 + 1) + 8 * i)])
            {
              int v44 = 0;
              goto LABEL_70;
            }
          }
          uint64_t v50 = [v48 countByEnumeratingWithState:&v66 objects:v74 count:16];
          if (v50) {
            continue;
          }
          break;
        }
        int v44 = 1;
LABEL_70:
        uint64_t v25 = v63;
      }
      else
      {
        int v44 = 1;
      }

      uint64_t v11 = v58;
    }
    id v53 = [MEMORY[0x1E4FAF480] default];
    if (os_log_type_enabled(v53, OS_LOG_TYPE_DEBUG)) {
      -[TPSTipsManager featureCollectionFromCollectionMap:collectionOrder:tipMap:].cold.4(v62);
    }

    if (!v44) {
      goto LABEL_78;
    }
  }
LABEL_76:
  id v9 = v55;
  uint64_t v34 = v62;
  if ((v57 & 1) == 0)
  {
LABEL_44:
    id v38 = v60;
    if (v38)
    {
      id v60 = v38;
      id v37 = v38;
    }
    else
    {
      id v37 = v65;
      id v60 = 0;
      id v65 = v37;
    }
    goto LABEL_47;
  }
LABEL_38:
  uint64_t v35 = [MEMORY[0x1E4FAF480] default];
  if (os_log_type_enabled(v35, OS_LOG_TYPE_DEBUG)) {
    -[TPSTipsManager featureCollectionFromCollectionMap:collectionOrder:tipMap:](v35);
  }

  if (!v26) {
    [v11 removeObject:v34];
  }
  uint64_t v36 = [v11 count];
  if (v36 < 1) {
    goto LABEL_44;
  }
  id v37 = [v11 objectAtIndexedSubscript:(int)arc4random_uniform(v36)];
  if (!v37) {
    goto LABEL_44;
  }
LABEL_47:
  id v39 = [MEMORY[0x1E4FAF480] default];
  if (os_log_type_enabled(v39, OS_LOG_TYPE_DEBUG)) {
    -[TPSTipsManager featureCollectionFromCollectionMap:collectionOrder:tipMap:](v37);
  }

  uint64_t v12 = v59;
  if (v37) {
    goto LABEL_50;
  }
LABEL_52:
  [v37 setTopFeatured:1];
  id v33 = v37;
LABEL_53:

LABEL_54:

  return v33;
}

- (id)collectionStatusForCollection:(id)a3
{
  id v3 = (void *)MEMORY[0x1E4FAF3F8];
  id v4 = a3;
  BOOL v5 = [v3 sharedInstance];
  uint64_t v6 = [v4 identifier];

  uint64_t v7 = [v5 collectionStatusForCollectionIdentifier:v6];

  return v7;
}

- (BOOL)checklistCollectionHasMinSuggestedTips:(id)a3 tipMap:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  uint64_t v15 = 0;
  uint64_t v16 = &v15;
  uint64_t v17 = 0x2020000000;
  char v18 = 0;
  v14[0] = 0;
  v14[1] = v14;
  v14[2] = 0x2020000000;
  v14[3] = 0;
  uint64_t v7 = [v5 tipIdentifiers];
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __64__TPSTipsManager_checklistCollectionHasMinSuggestedTips_tipMap___block_invoke;
  v10[3] = &unk_1E6E6B988;
  id v8 = v6;
  id v11 = v8;
  uint64_t v12 = v14;
  id v13 = &v15;
  [v7 enumerateObjectsUsingBlock:v10];

  LOBYTE(v7) = *((unsigned char *)v16 + 24);
  _Block_object_dispose(v14, 8);
  _Block_object_dispose(&v15, 8);

  return (char)v7;
}

+ (BOOL)supportsFeaturedCollection
{
  return 1;
}

- (id)updateDocumentContent:(id)a3 withClientConditions:(id)a4 checklistCompletedConditions:(id)a5 usingDictionary:(id)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  id v13 = a6;
  if ([v11 count])
  {
    uint64_t v14 = (void *)[v13 mutableCopy];
    v18[0] = MEMORY[0x1E4F143A8];
    v18[1] = 3221225472;
    v18[2] = __106__TPSTipsManager_updateDocumentContent_withClientConditions_checklistCompletedConditions_usingDictionary___block_invoke;
    v18[3] = &unk_1E6E6B668;
    id v19 = v13;
    id v20 = v12;
    id v21 = v11;
    id v22 = v14;
    id v23 = self;
    id v15 = v14;
    id v16 = v13;
    [v10 enumerateObjectsUsingBlock:v18];
    id v13 = (id)[v15 copy];
  }

  return v13;
}

void __66__TPSTipsManager_processTipDocumentsDictionary_completionHandler___block_invoke_2(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 40);
  id v2 = (id)[*(id *)(a1 + 32) copy];
  (*(void (**)(uint64_t, id))(v1 + 16))(v1, v2);
}

void __199__TPSTipsManager_contentWithMetaDictionary_documents_isRemote_processTipKitContent_contextualEligibility_widgetEligibility_notificationEligibility_preferredNotificationIdentifiers_completionHandler___block_invoke_3(uint64_t a1, void *a2)
{
  objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40), a2);
  id v4 = a2;
  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
}

void __199__TPSTipsManager_contentWithMetaDictionary_documents_isRemote_processTipKitContent_contextualEligibility_widgetEligibility_notificationEligibility_preferredNotificationIdentifiers_completionHandler___block_invoke_2(void *a1, void *a2)
{
  id v3 = a2;
  id v4 = (void *)a1[4];
  uint64_t v5 = a1[5];
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __199__TPSTipsManager_contentWithMetaDictionary_documents_isRemote_processTipKitContent_contextualEligibility_widgetEligibility_notificationEligibility_preferredNotificationIdentifiers_completionHandler___block_invoke_3;
  v8[3] = &unk_1E6E6B300;
  uint64_t v6 = a1[6];
  id v9 = v3;
  uint64_t v10 = v6;
  id v7 = v3;
  [v4 processTipDocumentsDictionary:v5 completionHandler:v8];
}

- (void)processTipDocumentsDictionary:(id)a3 completionHandler:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  uint64_t v8 = [v7 count];
  id v9 = [MEMORY[0x1E4F1CA60] dictionaryWithCapacity:v8];
  uint64_t v10 = [MEMORY[0x1E4FAF3E8] documentsForDictionary:v7];

  v18[0] = MEMORY[0x1E4F143A8];
  v18[1] = 3221225472;
  v18[2] = __66__TPSTipsManager_processTipDocumentsDictionary_completionHandler___block_invoke;
  v18[3] = &unk_1E6E6B690;
  id v11 = v9;
  id v19 = v11;
  [v10 enumerateObjectsUsingBlock:v18];
  id v12 = [(TPSTipsManager *)self syncQueue];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __66__TPSTipsManager_processTipDocumentsDictionary_completionHandler___block_invoke_2;
  block[3] = &unk_1E6E6B6B8;
  id v16 = v11;
  id v17 = v6;
  id v13 = v11;
  id v14 = v6;
  dispatch_async(v12, block);
}

void __91__TPSTipsManager_processTipsDeliveryInfo_deliveryInfoMap_targetingCache_completionHandler___block_invoke_3(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 64));
  id v3 = [WeakRetained syncQueue];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __91__TPSTipsManager_processTipsDeliveryInfo_deliveryInfoMap_targetingCache_completionHandler___block_invoke_4;
  block[3] = &unk_1E6E6B7F8;
  void block[4] = WeakRetained;
  long long v7 = *(_OWORD *)(a1 + 48);
  id v5 = *(id *)(a1 + 32);
  id v6 = *(id *)(a1 + 40);
  dispatch_async(v3, block);
}

void __189__TPSTipsManager_contentFromOrigin_processTipKitContent_contextualEligibility_widgetEligibility_notificationEligibility_preferredNotificationIdentifiers_shouldDeferBlock_completionHandler___block_invoke_4(uint64_t a1, uint64_t a2, void *a3, uint64_t a4, uint64_t a5, uint64_t a6, void *a7)
{
  v34[1] = *MEMORY[0x1E4F143B8];
  id v9 = a3;
  id v10 = a7;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 72));
  objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 48) + 8) + 40), a7);
  objc_opt_class();
  char isKindOfClass = objc_opt_isKindOfClass();
  if (!*(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 40))
  {
    if (v9)
    {
      if (isKindOfClass) {
        goto LABEL_7;
      }
      id v13 = (void *)MEMORY[0x1E4F28C58];
      uint64_t v31 = *MEMORY[0x1E4F289B0];
      id v14 = [*(id *)(a1 + 32) URL];
      id v32 = v14;
      id v15 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v32 forKeys:&v31 count:1];
      id v16 = v13;
      uint64_t v17 = 5;
    }
    else
    {
      char v18 = (void *)MEMORY[0x1E4F28C58];
      uint64_t v33 = *MEMORY[0x1E4F289B0];
      id v14 = [*(id *)(a1 + 32) URL];
      v34[0] = v14;
      id v15 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v34 forKeys:&v33 count:1];
      id v16 = v18;
      uint64_t v17 = 6;
    }
    uint64_t v19 = [v16 errorWithDomain:@"com.apple.tips.TPSTipsManager" code:v17 userInfo:v15];
    uint64_t v20 = *(void *)(*(void *)(a1 + 48) + 8);
    id v21 = *(void **)(v20 + 40);
    *(void *)(v20 + 40) = v19;
  }
LABEL_7:
  if (*(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 40))
  {
    id v22 = [MEMORY[0x1E4FAF480] daemon];
    if (os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v23 = *(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 40);
      *(_DWORD *)long long buf = 138412290;
      uint64_t v30 = v23;
      _os_log_impl(&dword_1E4492000, v22, OS_LOG_TYPE_DEFAULT, "Documents call error: %@", buf, 0xCu);
    }
  }
  else
  {
    uint64_t v24 = *(void *)(*(void *)(a1 + 56) + 8);
    id v25 = v9;
    id v22 = *(NSObject **)(v24 + 40);
    *(void *)(v24 + 40) = v25;
  }

  BOOL v26 = [WeakRetained syncQueue];
  v28[0] = MEMORY[0x1E4F143A8];
  v28[1] = 3221225472;
  v28[2] = __189__TPSTipsManager_contentFromOrigin_processTipKitContent_contextualEligibility_widgetEligibility_notificationEligibility_preferredNotificationIdentifiers_shouldDeferBlock_completionHandler___block_invoke_138;
  v28[3] = &unk_1E6E6B148;
  uint64_t v27 = *(void *)(a1 + 64);
  void v28[4] = WeakRetained;
  v28[5] = v27;
  dispatch_async(v26, v28);

  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
}

void __189__TPSTipsManager_contentFromOrigin_processTipKitContent_contextualEligibility_widgetEligibility_notificationEligibility_preferredNotificationIdentifiers_shouldDeferBlock_completionHandler___block_invoke_2(uint64_t a1, void *a2, void *a3, void *a4, uint64_t a5, void *a6, void *a7)
{
  v42[1] = *MEMORY[0x1E4F143B8];
  id v12 = a2;
  id v13 = a3;
  id v14 = a4;
  id v15 = a6;
  id v16 = a7;
  uint64_t v17 = *(void *)(a1 + 48);
  if (v17 && (*(unsigned int (**)(void))(v17 + 16))())
  {
    uint64_t v18 = [MEMORY[0x1E4F28C58] errorWithDomain:@"com.apple.tips.TPSTipsManager" code:4 userInfo:0];
    uint64_t v19 = *(void *)(*(void *)(a1 + 64) + 8);
    uint64_t v20 = *(void **)(v19 + 40);
    *(void *)(v19 + 40) = v18;
  }
  objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 64) + 8) + 40), a7);
  if (!*(void *)(*(void *)(*(void *)(a1 + 64) + 8) + 40))
  {
    if (v13)
    {
      objc_opt_class();
      if (objc_opt_isKindOfClass()) {
        goto LABEL_10;
      }
      id v21 = (void *)MEMORY[0x1E4F28C58];
      uint64_t v39 = *MEMORY[0x1E4F289B0];
      id v22 = [*(id *)(a1 + 32) URL];
      id v40 = v22;
      uint64_t v23 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v40 forKeys:&v39 count:1];
      uint64_t v24 = v21;
      uint64_t v25 = 5;
    }
    else
    {
      BOOL v26 = (void *)MEMORY[0x1E4F28C58];
      uint64_t v41 = *MEMORY[0x1E4F289B0];
      id v22 = [*(id *)(a1 + 32) URL];
      v42[0] = v22;
      uint64_t v23 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v42 forKeys:&v41 count:1];
      uint64_t v24 = v26;
      uint64_t v25 = 6;
    }
    uint64_t v27 = [v24 errorWithDomain:@"com.apple.tips.TPSTipsManager" code:v25 userInfo:v23];
    uint64_t v28 = *(void *)(*(void *)(a1 + 64) + 8);
    double v29 = *(void **)(v28 + 40);
    *(void *)(v28 + 40) = v27;
  }
LABEL_10:
  if (*(void *)(*(void *)(*(void *)(a1 + 64) + 8) + 40))
  {
    uint64_t v30 = [MEMORY[0x1E4FAF480] daemon];
    if (os_log_type_enabled(v30, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v31 = *(void *)(*(void *)(*(void *)(a1 + 64) + 8) + 40);
      *(_DWORD *)long long buf = 138412290;
      uint64_t v38 = v31;
      _os_log_impl(&dword_1E4492000, v30, OS_LOG_TYPE_DEFAULT, "Meta call error: %@", buf, 0xCu);
    }
  }
  else
  {
    uint64_t v32 = *(void *)(*(void *)(a1 + 72) + 8);
    id v33 = v13;
    uint64_t v30 = *(NSObject **)(v32 + 40);
    *(void *)(v32 + 40) = v33;
  }

  uint64_t v34 = [*(id *)(a1 + 40) syncQueue];
  v36[0] = MEMORY[0x1E4F143A8];
  v36[1] = 3221225472;
  v36[2] = __189__TPSTipsManager_contentFromOrigin_processTipKitContent_contextualEligibility_widgetEligibility_notificationEligibility_preferredNotificationIdentifiers_shouldDeferBlock_completionHandler___block_invoke_135;
  v36[3] = &unk_1E6E6B148;
  uint64_t v35 = *(void *)(a1 + 80);
  void v36[4] = *(void *)(a1 + 40);
  v36[5] = v35;
  dispatch_async(v34, v36);

  (*(void (**)(void))(*(void *)(a1 + 56) + 16))();
}

+ (BOOL)needImmediateNotificationForType:(unint64_t)a3
{
  id v3 = [(id)objc_opt_class() immediateNotificationIdentifierForType:a3];
  id v4 = [MEMORY[0x1E4FAF3F8] sharedInstance];
  id v5 = [v4 collectionStatusForCollectionIdentifier:v3];

  if ([v5 canNotify])
  {
    id v6 = [v5 firstViewedDate];
    BOOL v7 = v6 == 0;
  }
  else
  {
    BOOL v7 = 0;
  }

  return v7;
}

+ (BOOL)deviceLocalesContainLanguage:(id)a3
{
  id v3 = (void *)MEMORY[0x1E4FAF418];
  id v4 = a3;
  id v5 = [v3 preferredLocalizationsWithCount:5];
  char v6 = [v5 containsObject:v4];

  return v6;
}

+ (id)immediateNotificationIdentifierForType:(unint64_t)a3
{
  if (a3 > 2) {
    return 0;
  }
  else {
    return *(&off_1E6E6BA70 + a3);
  }
}

+ (void)removeExperimentCache
{
}

+ (void)removeWelcomeDocumentCache
{
  id v2 = [MEMORY[0x1E4FAF480] welcome];
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)id v3 = 0;
    _os_log_impl(&dword_1E4492000, v2, OS_LOG_TYPE_DEFAULT, "Remove welcome document cache", v3, 2u);
  }

  [MEMORY[0x1E4FAF4B0] archivedDataWithRootObject:0 forKey:@"TPSWelcomeDocumentCache"];
}

+ (void)removeWidgetUpdateDate
{
  id v2 = [MEMORY[0x1E4F1CB18] standardUserDefaults];
  [v2 removeObjectForKey:@"TPSWidgetUpdateDate"];
}

+ (id)rulesVersion
{
  id v2 = [MEMORY[0x1E4F1CB18] standardUserDefaults];
  id v3 = [v2 objectForKey:@"DeliveryInfoVersion"];

  return v3;
}

+ (id)experiment
{
  id v2 = (void *)MEMORY[0x1E4FAF4B0];
  uint64_t v3 = objc_opt_class();

  return (id)[v2 unarchivedObjectOfClass:v3 forKey:@"Experiment"];
}

+ (BOOL)setTipKitContentProcessFlagIfNeeded
{
  int v2 = setTipKitContentProcessFlagIfNeeded_expectedValue;
  int v3 = setTipKitContentProcessFlagIfNeeded_expectedValue;
  atomic_compare_exchange_strong((atomic_uint *volatile)tipKitContentProcessingInProgress, (unsigned int *)&v3, 1u);
  BOOL v4 = v3 == v2;
  if (v3 != v2)
  {
    setTipKitContentProcessFlagIfNeeded_expectedValue = v3;
    id v5 = [MEMORY[0x1E4FAF480] daemon];
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)BOOL v7 = 0;
      _os_log_impl(&dword_1E4492000, v5, OS_LOG_TYPE_DEFAULT, "TipKit Content Processing is already in progress", v7, 2u);
    }
  }
  return v4;
}

+ (void)resetTipKitContentProcessingFlag
{
}

- (TPSTipsManager)initWithTipStatusController:(id)a3
{
  uint64_t v27 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  v24.receiver = self;
  v24.super_class = (Class)TPSTipsManager;
  char v6 = [(TPSTipsManager *)&v24 init];
  if (v6)
  {
    BOOL v7 = [MEMORY[0x1E4F1CB18] standardUserDefaults];
    v6->_contextualTipsInactive = [v7 BOOLForKey:@"contextualTipsInactive"];
    uint64_t v8 = +[TPSTipsManager rulesVersion];
    rulesVersion = v6->_rulesVersion;
    v6->_rulesVersion = (NSString *)v8;

    objc_storeStrong((id *)&v6->_tipStatusController, a3);
    uint64_t v10 = +[TPSTipsManager experiment];
    experiment = v6->_experiment;
    v6->_experiment = (TPSExperiment *)v10;

    if (!v6->_experiment)
    {
      id v12 = (TPSExperiment *)objc_alloc_init(MEMORY[0x1E4FAF470]);
      id v13 = v6->_experiment;
      v6->_experiment = v12;
    }
    id v14 = [MEMORY[0x1E4FAF480] discoverability];
    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
    {
      id v15 = [(TPSExperiment *)v6->_experiment debugDescription];
      *(_DWORD *)long long buf = 138412290;
      BOOL v26 = v15;
      _os_log_impl(&dword_1E4492000, v14, OS_LOG_TYPE_DEFAULT, "Current experiment %@", buf, 0xCu);
    }
    uint64_t v16 = [MEMORY[0x1E4F1CA48] array];
    sessionItems = v6->_sessionItems;
    v6->_sessionItems = (NSMutableArray *)v16;

    uint64_t v18 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    dispatch_queue_t v19 = dispatch_queue_create("com.apple.tipsManager.syncQueue", v18);
    syncQueue = v6->_syncQueue;
    v6->_syncQueue = (OS_dispatch_queue *)v19;

    id v21 = (TPSWidgetController *)objc_alloc_init(MEMORY[0x1E4FAF4D0]);
    widgetController = v6->_widgetController;
    v6->_widgetController = v21;

    [(TPSWidgetController *)v6->_widgetController setDelegate:v6];
  }

  return v6;
}

- (BOOL)isContentIdentifierHoldoutCamp:(id)a3
{
  id v4 = a3;
  id v5 = [(TPSTipsManager *)self experiment];
  if ([v5 camp] == 2)
  {
    char v6 = [(TPSTipsManager *)self tipStatusController];
    int v7 = [v6 isOverrideHoldoutForIdentifier:v4] ^ 1;
  }
  else
  {
    LOBYTE(v7) = 0;
  }

  return v7;
}

- (void)_updateExperimentCache
{
}

- (void)updateContentIfOverrideImmediately:(BOOL)a3
{
  BOOL v3 = a3;
  id v5 = [MEMORY[0x1E4FAF450] requestInterval];
  char v6 = v5;
  if (v5)
  {
    [v5 doubleValue];
    double v8 = v7;
    if (v7 > 0.0 || (v7 == 0.0 ? (BOOL v9 = TPSNumberOfOverrideFetch == 0) : (BOOL v9 = 0), v9))
    {
      objc_initWeak(&location, self);
      uint64_t v10 = [(TPSTipsManager *)self notificationController];
      char v11 = [v10 isNotificationSettingValid];

      if (v11)
      {
        id v12 = [(TPSTipsManager *)self delegate];
        char v13 = [v12 canCheckForNewTipNotification:self];
      }
      else
      {
        id v12 = [(TPSTipsManager *)self notificationController];
        [v12 clearNotificationCache];
        char v13 = 0;
      }

      aBlock[0] = MEMORY[0x1E4F143A8];
      aBlock[1] = 3221225472;
      aBlock[2] = __53__TPSTipsManager_updateContentIfOverrideImmediately___block_invoke;
      aBlock[3] = &unk_1E6E6B0F8;
      objc_copyWeak(&v22, &location);
      char v23 = v13;
      aBlock[4] = self;
      id v14 = (void (**)(void))_Block_copy(aBlock);
      id v15 = v14;
      ++TPSNumberOfOverrideFetch;
      if (v3)
      {
        v14[2](v14);
      }
      else
      {
        uint64_t v16 = (void *)MEMORY[0x1E4F1CB00];
        v19[0] = MEMORY[0x1E4F143A8];
        v19[1] = 3221225472;
        void v19[2] = __53__TPSTipsManager_updateContentIfOverrideImmediately___block_invoke_2_105;
        v19[3] = &unk_1E6E6B120;
        uint64_t v20 = v14;
        uint64_t v17 = [v16 timerWithTimeInterval:0 repeats:v19 block:v8];
        uint64_t v18 = [MEMORY[0x1E4F1CAC0] currentRunLoop];
        [v18 addTimer:v17 forMode:*MEMORY[0x1E4F1C3A0]];
      }
      objc_destroyWeak(&v22);
      objc_destroyWeak(&location);
    }
  }
}

void __53__TPSTipsManager_updateContentIfOverrideImmediately___block_invoke(uint64_t a1)
{
  int v2 = (id *)(a1 + 40);
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  uint64_t v4 = *(unsigned __int8 *)(a1 + 48);
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __53__TPSTipsManager_updateContentIfOverrideImmediately___block_invoke_2;
  v5[3] = &unk_1E6E6B0D0;
  objc_copyWeak(&v6, v2);
  char v7 = *(unsigned char *)(a1 + 48);
  v5[4] = *(void *)(a1 + 32);
  [WeakRetained contentFromOrigin:1 processTipKitContent:1 contextualEligibility:1 widgetEligibility:1 notificationEligibility:v4 preferredNotificationIdentifiers:0 shouldDeferBlock:0 completionHandler:v5];

  objc_destroyWeak(&v6);
}

void __53__TPSTipsManager_updateContentIfOverrideImmediately___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v5 = (id *)(a1 + 40);
  id v6 = a3;
  id v7 = a2;
  id WeakRetained = objc_loadWeakRetained(v5);
  BOOL v9 = [WeakRetained delegate];
  [v9 tipsManagerContentUpdateOverrideCompleted:WeakRetained contentPackage:v7 shouldUpdateNotification:*(unsigned __int8 *)(a1 + 48) error:v6];

  uint64_t v10 = [MEMORY[0x1E4FAF480] daemon];
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)long long buf = 0;
    _os_log_impl(&dword_1E4492000, v10, OS_LOG_TYPE_DEFAULT, "Scheduling for next update content override...", buf, 2u);
  }

  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __53__TPSTipsManager_updateContentIfOverrideImmediately___block_invoke_101;
  block[3] = &unk_1E6E6B0A8;
  void block[4] = *(void *)(a1 + 32);
  dispatch_async(MEMORY[0x1E4F14428], block);
}

uint64_t __53__TPSTipsManager_updateContentIfOverrideImmediately___block_invoke_101(uint64_t a1)
{
  return [*(id *)(a1 + 32) updateContentIfOverrideImmediately:0];
}

uint64_t __53__TPSTipsManager_updateContentIfOverrideImmediately___block_invoke_2_105(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (BOOL)isPreconditionValidForIdentifier:(id)a3 preconditionDictionary:(id)a4
{
  id v5 = a3;
  if (a4)
  {
    id v6 = a4;
    id v7 = [[TPSDeliveryPrecondition alloc] initWithDictionary:v6];

    if (v7)
    {
      double v8 = [(TPSDeliveryPrecondition *)v7 conditions];
      BOOL v9 = +[TPSTargetingValidator validateConditions:v8 joinType:[(TPSDeliveryPrecondition *)v7 joinType] context:v5 cache:0 completionQueue:0 error:0];
    }
    else
    {
      BOOL v9 = 0;
    }
  }
  else
  {
    BOOL v9 = 1;
  }

  return v9;
}

- (void)contentForVariantIdentifiers:(id)a3 completionHandler:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if ((unint64_t)[v6 count] >= 4)
  {
    uint64_t v8 = objc_msgSend(v6, "subarrayWithRange:", 0, 2);

    id v6 = (id)v8;
  }
  BOOL v9 = [v6 componentsJoinedByString:@","];
  uint64_t v10 = [MEMORY[0x1E4FAF418] contentRequestURLWithContentMapHash:0 variantIdentifiers:v9 useLanguageDefault:0];
  char v11 = [MEMORY[0x1E4F28E88] requestWithURL:v10];
  [v11 setCachePolicy:5];
  objc_initWeak(&location, self);
  id v12 = [(TPSTipsManager *)self syncQueue];
  v17[0] = MEMORY[0x1E4F143A8];
  v17[1] = 3221225472;
  v17[2] = __65__TPSTipsManager_contentForVariantIdentifiers_completionHandler___block_invoke;
  v17[3] = &unk_1E6E6B198;
  objc_copyWeak(&v22, &location);
  id v18 = v11;
  id v19 = v9;
  id v20 = v6;
  id v21 = v7;
  id v13 = v7;
  id v14 = v6;
  id v15 = v9;
  id v16 = v11;
  dispatch_async(v12, v17);

  objc_destroyWeak(&v22);
  objc_destroyWeak(&location);
}

void __65__TPSTipsManager_contentForVariantIdentifiers_completionHandler___block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 64));
  uint64_t v21 = 0;
  id v22 = &v21;
  uint64_t v23 = 0x3032000000;
  objc_super v24 = __Block_byref_object_copy__1;
  uint64_t v25 = __Block_byref_object_dispose__1;
  id v26 = 0;
  BOOL v3 = [MEMORY[0x1E4FAF478] sharedInstance];
  uint64_t v4 = *(void *)(a1 + 32);
  uint64_t v5 = *(void *)(a1 + 40);
  uint64_t v6 = *MEMORY[0x1E4FAF4F8];
  int v7 = *MEMORY[0x1E4F28A00];
  uint64_t v13 = MEMORY[0x1E4F143A8];
  uint64_t v14 = 3221225472;
  id v15 = __65__TPSTipsManager_contentForVariantIdentifiers_completionHandler___block_invoke_123;
  id v16 = &unk_1E6E6B170;
  id v17 = *(id *)(a1 + 48);
  id v8 = *(id *)(a1 + 56);
  id v18 = WeakRetained;
  id v19 = v8;
  id v20 = &v21;
  LODWORD(v9) = v7;
  uint64_t v10 = [v3 formattedDataForRequest:v4 identifier:v5 attributionIdentifier:@"com.apple.tipsd" requestType:v6 priority:&v13 completionHandler:v9];
  char v11 = (void *)v22[5];
  v22[5] = v10;

  if (v22[5])
  {
    id v12 = objc_msgSend(WeakRetained, "sessionItems", v13, v14, v15, v16, v17);
    [v12 addObject:v22[5]];
  }
  _Block_object_dispose(&v21, 8);
}

void __65__TPSTipsManager_contentForVariantIdentifiers_completionHandler___block_invoke_123(uint64_t a1, uint64_t a2, void *a3, uint64_t a4, uint64_t a5, uint64_t a6, void *a7)
{
  uint64_t v36 = *MEMORY[0x1E4F143B8];
  id v9 = a3;
  id v10 = a7;
  objc_opt_class();
  char isKindOfClass = objc_opt_isKindOfClass();
  double v29 = 0;
  if (!v10 && (isKindOfClass & 1) != 0)
  {
    uint64_t v25 = [MEMORY[0x1E4FAF488] metadataFromDictionary:v9];
    uint64_t v28 = (void *)[objc_alloc(MEMORY[0x1E4FAF488]) initWithDictionary:v25];
    double v29 = objc_msgSend(MEMORY[0x1E4F1CA48], "arrayWithCapacity:", objc_msgSend(*(id *)(a1 + 32), "count"));
    id v26 = v9;
    [MEMORY[0x1E4FAF460] documentsForDictionary:v9];
    long long v31 = 0u;
    long long v32 = 0u;
    long long v33 = 0u;
    long long v34 = 0u;
    obuint64_t j = (id)objc_claimAutoreleasedReturnValue();
    uint64_t v12 = [obj countByEnumeratingWithState:&v31 objects:v35 count:16];
    if (v12)
    {
      uint64_t v13 = v12;
      uint64_t v14 = *(void *)v32;
      uint64_t v15 = *MEMORY[0x1E4FAF550];
      uint64_t v16 = *MEMORY[0x1E4FAF548];
      do
      {
        for (uint64_t i = 0; i != v13; ++i)
        {
          if (*(void *)v32 != v14) {
            objc_enumerationMutation(obj);
          }
          id v18 = *(void **)(*((void *)&v31 + 1) + 8 * i);
          id v19 = [v18 TPSSafeDictionaryForKey:v15];
          id v20 = [v18 TPSSafeDictionaryForKey:v16];
          uint64_t v21 = (void *)[objc_alloc(MEMORY[0x1E4FAF458]) initWithDictionary:v19 metadata:v28];
          id v22 = [v20 TPSSafeDictionaryForKey:@"preconditions"];
          [v21 setPreconditions:v22];

          [v29 addObject:v21];
        }
        uint64_t v13 = [obj countByEnumeratingWithState:&v31 objects:v35 count:16];
      }
      while (v13);
    }

    id v10 = 0;
    id v9 = v26;
  }
  (*(void (**)(void))(*(void *)(a1 + 48) + 16))();
  uint64_t v23 = [*(id *)(a1 + 40) syncQueue];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __65__TPSTipsManager_contentForVariantIdentifiers_completionHandler___block_invoke_2;
  block[3] = &unk_1E6E6B148;
  uint64_t v24 = *(void *)(a1 + 56);
  void block[4] = *(void *)(a1 + 40);
  void block[5] = v24;
  dispatch_async(v23, block);
}

void __65__TPSTipsManager_contentForVariantIdentifiers_completionHandler___block_invoke_2(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) sessionItems];
  [v2 removeObject:*(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 40)];
}

void __189__TPSTipsManager_contentFromOrigin_processTipKitContent_contextualEligibility_widgetEligibility_notificationEligibility_preferredNotificationIdentifiers_shouldDeferBlock_completionHandler___block_invoke_135(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) sessionItems];
  [v2 removeObject:*(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 40)];
}

void __189__TPSTipsManager_contentFromOrigin_processTipKitContent_contextualEligibility_widgetEligibility_notificationEligibility_preferredNotificationIdentifiers_shouldDeferBlock_completionHandler___block_invoke_2_136(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) sessionItems];
  [v2 addObject:*(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 40)];
}

void __189__TPSTipsManager_contentFromOrigin_processTipKitContent_contextualEligibility_widgetEligibility_notificationEligibility_preferredNotificationIdentifiers_shouldDeferBlock_completionHandler___block_invoke_138(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) sessionItems];
  [v2 removeObject:*(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 40)];
}

void __189__TPSTipsManager_contentFromOrigin_processTipKitContent_contextualEligibility_widgetEligibility_notificationEligibility_preferredNotificationIdentifiers_shouldDeferBlock_completionHandler___block_invoke_2_139(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  id v2 = [WeakRetained sessionItems];
  [v2 addObject:*(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 40)];
}

void __189__TPSTipsManager_contentFromOrigin_processTipKitContent_contextualEligibility_widgetEligibility_notificationEligibility_preferredNotificationIdentifiers_shouldDeferBlock_completionHandler___block_invoke_3_140(uint64_t a1, void *a2)
{
  id v3 = a2;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 80));
  uint64_t v5 = *(void *)(*(void *)(*(void *)(a1 + 56) + 8) + 40);
  if (v5
    && (uint64_t v6 = *(void *)(*(void *)(*(void *)(a1 + 64) + 8) + 40)) != 0
    && !*(void *)(*(void *)(*(void *)(a1 + 72) + 8) + 40))
  {
    unsigned int v12 = *(unsigned __int8 *)(a1 + 88);
    uint64_t v7 = *(unsigned __int8 *)(a1 + 89);
    uint64_t v8 = *(unsigned __int8 *)(a1 + 90);
    char v9 = *(unsigned char *)(a1 + 91);
    uint64_t v10 = *(void *)(a1 + 32);
    v13[0] = MEMORY[0x1E4F143A8];
    v13[1] = 3221225472;
    v13[2] = __189__TPSTipsManager_contentFromOrigin_processTipKitContent_contextualEligibility_widgetEligibility_notificationEligibility_preferredNotificationIdentifiers_shouldDeferBlock_completionHandler___block_invoke_4_141;
    v13[3] = &unk_1E6E6B288;
    id v15 = *(id *)(a1 + 48);
    id v16 = v3;
    id v14 = *(id *)(a1 + 40);
    LOBYTE(v11) = v9;
    [WeakRetained contentWithMetaDictionary:v5 documents:v6 isRemote:1 processTipKitContent:v12 contextualEligibility:v7 widgetEligibility:v8 notificationEligibility:v11 preferredNotificationIdentifiers:v10 completionHandler:v13];
  }
  else
  {
    (*(void (**)(void))(*(void *)(a1 + 48) + 16))();
    (*((void (**)(id, void))v3 + 2))(v3, 0);
    [*(id *)(a1 + 40) endTransaction];
  }
}

uint64_t __189__TPSTipsManager_contentFromOrigin_processTipKitContent_contextualEligibility_widgetEligibility_notificationEligibility_preferredNotificationIdentifiers_shouldDeferBlock_completionHandler___block_invoke_4_141(void *a1)
{
  (*(void (**)(void))(a1[5] + 16))();
  (*(void (**)(void))(a1[6] + 16))();
  id v2 = (void *)a1[4];

  return [v2 endTransaction];
}

void __199__TPSTipsManager_contentWithMetaDictionary_documents_isRemote_processTipKitContent_contextualEligibility_widgetEligibility_notificationEligibility_preferredNotificationIdentifiers_completionHandler___block_invoke_154(uint64_t a1, void *a2)
{
  id v3 = a2;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 72));
  uint64_t v5 = *(void *)(a1 + 32);
  uint64_t v6 = *(void *)(a1 + 40);
  uint64_t v7 = *(void *)(a1 + 48);
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __199__TPSTipsManager_contentWithMetaDictionary_documents_isRemote_processTipKitContent_contextualEligibility_widgetEligibility_notificationEligibility_preferredNotificationIdentifiers_completionHandler___block_invoke_2_155;
  v9[3] = &unk_1E6E6B3A0;
  long long v11 = *(_OWORD *)(a1 + 56);
  id v10 = v3;
  id v8 = v3;
  [WeakRetained processTipsDeliveryInfo:v5 deliveryInfoMap:v6 targetingCache:v7 completionHandler:v9];
}

void __199__TPSTipsManager_contentWithMetaDictionary_documents_isRemote_processTipKitContent_contextualEligibility_widgetEligibility_notificationEligibility_preferredNotificationIdentifiers_completionHandler___block_invoke_2_155(void *a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  uint64_t v7 = *(void *)(a1[5] + 8);
  id v8 = *(void **)(v7 + 40);
  *(void *)(v7 + 40) = v5;
  id v12 = v5;

  uint64_t v9 = *(void *)(a1[6] + 8);
  id v10 = *(void **)(v9 + 40);
  *(void *)(v9 + 40) = v6;
  id v11 = v6;

  (*(void (**)(void))(a1[4] + 16))();
}

void __199__TPSTipsManager_contentWithMetaDictionary_documents_isRemote_processTipKitContent_contextualEligibility_widgetEligibility_notificationEligibility_preferredNotificationIdentifiers_completionHandler___block_invoke_3_160(uint64_t a1, void *a2)
{
  id v3 = a2;
  uint64_t v4 = *(void *)(a1 + 48);
  uint64_t v14 = *(void *)(*(void *)(*(void *)(a1 + 64) + 8) + 40);
  uint64_t v15 = *(void *)(*(void *)(*(void *)(a1 + 56) + 8) + 40);
  uint64_t v12 = *(void *)(*(void *)(*(void *)(a1 + 80) + 8) + 40);
  uint64_t v13 = *(void *)(*(void *)(*(void *)(a1 + 72) + 8) + 40);
  uint64_t v5 = *(void *)(*(void *)(*(void *)(a1 + 88) + 8) + 40);
  uint64_t v6 = *(void *)(*(void *)(*(void *)(a1 + 96) + 8) + 40);
  uint64_t v7 = *(void *)(*(void *)(*(void *)(a1 + 104) + 8) + 40);
  uint64_t v9 = *(void **)(a1 + 32);
  uint64_t v8 = *(void *)(a1 + 40);
  v16[0] = MEMORY[0x1E4F143A8];
  v16[1] = 3221225472;
  v16[2] = __199__TPSTipsManager_contentWithMetaDictionary_documents_isRemote_processTipKitContent_contextualEligibility_widgetEligibility_notificationEligibility_preferredNotificationIdentifiers_completionHandler___block_invoke_4_161;
  v16[3] = &unk_1E6E6B3F0;
  objc_copyWeak(v22, (id *)(a1 + 160));
  long long v10 = *(_OWORD *)(a1 + 128);
  long long v19 = *(_OWORD *)(a1 + 112);
  long long v20 = v10;
  long long v21 = *(_OWORD *)(a1 + 144);
  id v17 = *(id *)(a1 + 48);
  id v11 = v3;
  id v18 = v11;
  [v9 finalEligibleContentWithCollections:v15 collectionsMap:v14 collectionDeliveryInfoMap:v13 eligibleTipIdentifiers:v12 eligibleContextualTipIdentifiers:v5 allFullTipsMap:v6 allMiniTipsMap:v7 tipDeliveryInfoMap:v8 deliveryInfoMap:v4 completionHandler:v16];

  objc_destroyWeak(v22);
}

void __199__TPSTipsManager_contentWithMetaDictionary_documents_isRemote_processTipKitContent_contextualEligibility_widgetEligibility_notificationEligibility_preferredNotificationIdentifiers_completionHandler___block_invoke_4_161(uint64_t a1, void *a2, void *a3, void *a4, void *a5, void *a6, void *a7)
{
  id v13 = a2;
  id v14 = a3;
  id v15 = a4;
  id v16 = a5;
  id v17 = a6;
  id v18 = a7;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 96));
  uint64_t v19 = *(void *)(*(void *)(a1 + 48) + 8);
  long long v20 = *(void **)(v19 + 40);
  *(void *)(v19 + 40) = v13;
  id v21 = v13;

  uint64_t v22 = *(void *)(*(void *)(a1 + 56) + 8);
  uint64_t v23 = *(void **)(v22 + 40);
  *(void *)(v22 + 40) = v14;
  id v24 = v14;

  uint64_t v25 = *(void *)(*(void *)(a1 + 64) + 8);
  id v26 = *(void **)(v25 + 40);
  *(void *)(v25 + 40) = v15;
  id v27 = v15;

  uint64_t v28 = *(void *)(*(void *)(a1 + 72) + 8);
  double v29 = *(void **)(v28 + 40);
  *(void *)(v28 + 40) = v16;
  id v30 = v16;

  uint64_t v31 = *(void *)(*(void *)(a1 + 80) + 8);
  long long v32 = *(void **)(v31 + 40);
  *(void *)(v31 + 40) = v17;
  id v33 = v17;

  uint64_t v34 = *(void *)(*(void *)(a1 + 88) + 8);
  uint64_t v35 = *(void **)(v34 + 40);
  *(void *)(v34 + 40) = v18;
  id v36 = v18;

  id v37 = [WeakRetained delegate];
  id v38 = objc_alloc(MEMORY[0x1E4F1CAD0]);
  uint64_t v39 = [*(id *)(*(void *)(*(void *)(a1 + 72) + 8) + 40) allKeys];
  id v40 = (void *)[v38 initWithArray:v39];
  [v37 tipsManager:WeakRetained eligibilityCompletedWithTipIdentifiers:v40 contextualTipIdentifiers:*(void *)(*(void *)(*(void *)(a1 + 88) + 8) + 40) tipsDeliveryInfoMap:*(void *)(*(void *)(*(void *)(a1 + 80) + 8) + 40) deliveryInfoMap:*(void *)(a1 + 32)];

  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
}

void __199__TPSTipsManager_contentWithMetaDictionary_documents_isRemote_processTipKitContent_contextualEligibility_widgetEligibility_notificationEligibility_preferredNotificationIdentifiers_completionHandler___block_invoke_167(uint64_t a1, void *a2)
{
  id v3 = (id *)(a1 + 56);
  uint64_t v4 = a2;
  id WeakRetained = objc_loadWeakRetained(v3);
  uint64_t v5 = [WeakRetained delegate];
  [v5 tipsManager:WeakRetained contextualEligibilityWithTipIdentifiers:*(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 40) tipsDeliveryInfoMap:*(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 40) deliveryInfoMap:*(void *)(a1 + 32) experimentCampChangesToAll:*(unsigned __int8 *)(a1 + 64)];

  v4[2](v4, 0);
}

void __199__TPSTipsManager_contentWithMetaDictionary_documents_isRemote_processTipKitContent_contextualEligibility_widgetEligibility_notificationEligibility_preferredNotificationIdentifiers_completionHandler___block_invoke_2_171(uint64_t a1, void *a2)
{
  id v3 = a2;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 88));
  uint64_t v5 = *(void *)(a1 + 32);
  uint64_t v6 = *(void *)(a1 + 40);
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __199__TPSTipsManager_contentWithMetaDictionary_documents_isRemote_processTipKitContent_contextualEligibility_widgetEligibility_notificationEligibility_preferredNotificationIdentifiers_completionHandler___block_invoke_3_172;
  v9[3] = &unk_1E6E6B468;
  long long v7 = *(_OWORD *)(a1 + 64);
  long long v11 = *(_OWORD *)(a1 + 48);
  long long v12 = v7;
  uint64_t v13 = *(void *)(a1 + 80);
  void v9[4] = WeakRetained;
  id v10 = v3;
  id v8 = v3;
  [WeakRetained processClientConditions:v5 targetingCache:v6 completionHandler:v9];
}

void __199__TPSTipsManager_contentWithMetaDictionary_documents_isRemote_processTipKitContent_contextualEligibility_widgetEligibility_notificationEligibility_preferredNotificationIdentifiers_completionHandler___block_invoke_3_172(void *a1, void *a2, void *a3)
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  id v6 = a2;
  objc_storeStrong((id *)(*(void *)(a1[6] + 8) + 40), a2);
  id v7 = a3;
  id v8 = [MEMORY[0x1E4FAF480] targeting];
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v9 = *(void *)(*(void *)(a1[6] + 8) + 40);
    int v20 = 138412290;
    uint64_t v21 = v9;
    _os_log_impl(&dword_1E4492000, v8, OS_LOG_TYPE_DEFAULT, "Matched client conditions: %@", (uint8_t *)&v20, 0xCu);
  }

  id v10 = (void *)a1[4];
  long long v11 = [*(id *)(*(void *)(a1[8] + 8) + 40) allValues];
  uint64_t v12 = [v10 updateDocumentContent:v11 withClientConditions:*(void *)(*(void *)(a1[6] + 8) + 40) checklistCompletedConditions:0 usingDictionary:*(void *)(*(void *)(a1[7] + 8) + 40)];
  uint64_t v13 = *(void *)(a1[7] + 8);
  id v14 = *(void **)(v13 + 40);
  *(void *)(v13 + 40) = v12;

  id v15 = (void *)a1[4];
  id v16 = [*(id *)(*(void *)(a1[10] + 8) + 40) allValues];
  uint64_t v17 = [v15 updateDocumentContent:v16 withClientConditions:*(void *)(*(void *)(a1[6] + 8) + 40) checklistCompletedConditions:v7 usingDictionary:*(void *)(*(void *)(a1[9] + 8) + 40)];

  uint64_t v18 = *(void *)(a1[9] + 8);
  uint64_t v19 = *(void **)(v18 + 40);
  *(void *)(v18 + 40) = v17;

  (*(void (**)(void))(a1[5] + 16))();
}

void __199__TPSTipsManager_contentWithMetaDictionary_documents_isRemote_processTipKitContent_contextualEligibility_widgetEligibility_notificationEligibility_preferredNotificationIdentifiers_completionHandler___block_invoke_176(uint64_t a1, void *a2)
{
  id v3 = a2;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 80));
  uint64_t v5 = [*(id *)(a1 + 32) isHardwareWelcome];
  id v6 = [MEMORY[0x1E4F1CA60] dictionaryWithDictionary:*(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 40)];
  [v6 addEntriesFromDictionary:*(void *)(*(void *)(*(void *)(a1 + 56) + 8) + 40)];
  id v7 = [MEMORY[0x1E4F1CA60] dictionaryWithDictionary:*(void *)(*(void *)(*(void *)(a1 + 64) + 8) + 40)];
  [v7 addEntriesFromDictionary:*(void *)(*(void *)(*(void *)(a1 + 72) + 8) + 40)];
  id v8 = [WeakRetained widgetController];
  uint64_t v9 = (void *)[v6 copy];
  id v10 = (void *)[v7 copy];
  uint64_t v11 = *(void *)(a1 + 40);
  v13[0] = MEMORY[0x1E4F143A8];
  v13[1] = 3221225472;
  v13[2] = __199__TPSTipsManager_contentWithMetaDictionary_documents_isRemote_processTipKitContent_contextualEligibility_widgetEligibility_notificationEligibility_preferredNotificationIdentifiers_completionHandler___block_invoke_2_178;
  v13[3] = &unk_1E6E6B4B8;
  id v14 = v3;
  id v12 = v3;
  [v8 updateWidgetDocumentWithDocumentsMap:v9 documentsDeliveryInfoMap:v10 deliveryInfoMap:v11 preferHardwareWelcome:v5 completionHandler:v13];
}

void __199__TPSTipsManager_contentWithMetaDictionary_documents_isRemote_processTipKitContent_contextualEligibility_widgetEligibility_notificationEligibility_preferredNotificationIdentifiers_completionHandler___block_invoke_2_178(uint64_t a1, void *a2, void *a3, void *a4)
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  id v7 = a2;
  id v8 = a3;
  id v9 = a4;
  id v10 = [MEMORY[0x1E4FAF480] widget];
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    int v13 = 138412802;
    id v14 = v7;
    __int16 v15 = 2112;
    id v16 = v8;
    __int16 v17 = 2112;
    id v18 = v9;
    _os_log_impl(&dword_1E4492000, v10, OS_LOG_TYPE_DEFAULT, "Widget found: %@ with light assets %@, dark assets %@", (uint8_t *)&v13, 0x20u);
  }

  uint64_t v11 = [MEMORY[0x1E4F1CB18] standardUserDefaults];
  id v12 = [MEMORY[0x1E4F1C9C8] date];
  [v11 setObject:v12 forKey:@"TPSWidgetUpdateDate"];

  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
}

void __199__TPSTipsManager_contentWithMetaDictionary_documents_isRemote_processTipKitContent_contextualEligibility_widgetEligibility_notificationEligibility_preferredNotificationIdentifiers_completionHandler___block_invoke_184(uint64_t a1, void *a2)
{
  id v3 = a2;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 56));
  uint64_t v5 = [WeakRetained notificationController];
  uint64_t v6 = *(void *)(a1 + 32);
  uint64_t v7 = *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 40);
  uint64_t v8 = *(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 40);
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __199__TPSTipsManager_contentWithMetaDictionary_documents_isRemote_processTipKitContent_contextualEligibility_widgetEligibility_notificationEligibility_preferredNotificationIdentifiers_completionHandler___block_invoke_2_185;
  v10[3] = &unk_1E6E6B508;
  id v11 = v3;
  id v9 = v3;
  [v5 updateNotificationRegistrationEventsWithCollectionDeliveryIdentifierMap:v7 tipsDeliveryIdentifierMap:v8 deliveryInfoMap:v6 completionHandler:v10];
}

uint64_t __199__TPSTipsManager_contentWithMetaDictionary_documents_isRemote_processTipKitContent_contextualEligibility_widgetEligibility_notificationEligibility_preferredNotificationIdentifiers_completionHandler___block_invoke_2_185(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

void __199__TPSTipsManager_contentWithMetaDictionary_documents_isRemote_processTipKitContent_contextualEligibility_widgetEligibility_notificationEligibility_preferredNotificationIdentifiers_completionHandler___block_invoke_3_190(uint64_t a1, void *a2)
{
  id v3 = a2;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 112));
  id v15 = *(id *)(*(void *)(*(void *)(a1 + 56) + 8) + 40);
  uint64_t v4 = [WeakRetained notificationController];
  uint64_t v13 = *(void *)(*(void *)(*(void *)(a1 + 72) + 8) + 40);
  uint64_t v14 = *(void *)(*(void *)(*(void *)(a1 + 64) + 8) + 40);
  uint64_t v5 = *(void *)(*(void *)(*(void *)(a1 + 80) + 8) + 40);
  uint64_t v6 = *(void *)(*(void *)(*(void *)(a1 + 88) + 8) + 40);
  uint64_t v7 = *(void *)(*(void *)(*(void *)(a1 + 96) + 8) + 40);
  uint64_t v8 = *(void *)(a1 + 32);
  uint64_t v9 = *(void *)(a1 + 40);
  uint64_t v10 = *(void *)(a1 + 48);
  v17[0] = MEMORY[0x1E4F143A8];
  v17[1] = 3221225472;
  v17[2] = __199__TPSTipsManager_contentWithMetaDictionary_documents_isRemote_processTipKitContent_contextualEligibility_widgetEligibility_notificationEligibility_preferredNotificationIdentifiers_completionHandler___block_invoke_4_191;
  v17[3] = &unk_1E6E6B558;
  uint64_t v11 = *(void *)(a1 + 104);
  id v18 = v3;
  uint64_t v19 = v11;
  id v12 = v3;
  [v4 updateDocumentToNotifyWithPreferredIdentifiers:v8 collectionOrder:v14 collectionMap:v13 collectionDeliveryIdentifierMap:v5 tipMap:v6 tipsDeliveryIdentifierMap:v7 deliveryInfoMap:v9 documentDictionaryMap:v15 metadataDictionary:v10 completionHandler:v17];
}

void __199__TPSTipsManager_contentWithMetaDictionary_documents_isRemote_processTipKitContent_contextualEligibility_widgetEligibility_notificationEligibility_preferredNotificationIdentifiers_completionHandler___block_invoke_4_191(uint64_t a1, void *a2)
{
  objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40), a2);
  id v4 = a2;
  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
}

void __199__TPSTipsManager_contentWithMetaDictionary_documents_isRemote_processTipKitContent_contextualEligibility_widgetEligibility_notificationEligibility_preferredNotificationIdentifiers_completionHandler___block_invoke_5_196(uint64_t a1, void *a2)
{
  id v3 = a2;
  uint64_t v4 = *(void *)(a1 + 32);
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __199__TPSTipsManager_contentWithMetaDictionary_documents_isRemote_processTipKitContent_contextualEligibility_widgetEligibility_notificationEligibility_preferredNotificationIdentifiers_completionHandler___block_invoke_6;
  v6[3] = &unk_1E6E6B5A8;
  id v7 = v3;
  id v5 = v3;
  +[TPSDeviceProfileExporter updateDeviceProfileWithDataSource:v4 completionHandler:v6];
}

void __199__TPSTipsManager_contentWithMetaDictionary_documents_isRemote_processTipKitContent_contextualEligibility_widgetEligibility_notificationEligibility_preferredNotificationIdentifiers_completionHandler___block_invoke_6(uint64_t a1, uint64_t a2, void *a3)
{
  id v4 = a3;
  id v5 = [MEMORY[0x1E4FAF480] default];
  uint64_t v6 = v5;
  if (v4)
  {
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR)) {
      __199__TPSTipsManager_contentWithMetaDictionary_documents_isRemote_processTipKitContent_contextualEligibility_widgetEligibility_notificationEligibility_preferredNotificationIdentifiers_completionHandler___block_invoke_6_cold_1();
    }
  }
  else if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)id v7 = 0;
    _os_log_impl(&dword_1E4492000, v6, OS_LOG_TYPE_INFO, "Device profile updated successfully.", v7, 2u);
  }

  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
}

void __199__TPSTipsManager_contentWithMetaDictionary_documents_isRemote_processTipKitContent_contextualEligibility_widgetEligibility_notificationEligibility_preferredNotificationIdentifiers_completionHandler___block_invoke_202(void *a1, void *a2)
{
  id v3 = a2;
  uint64_t v4 = a1[4];
  uint64_t v5 = a1[5];
  uint64_t v6 = *(void *)(*(void *)(a1[6] + 8) + 40);
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __199__TPSTipsManager_contentWithMetaDictionary_documents_isRemote_processTipKitContent_contextualEligibility_widgetEligibility_notificationEligibility_preferredNotificationIdentifiers_completionHandler___block_invoke_2_204;
  v8[3] = &unk_1E6E6B5A8;
  id v9 = v3;
  id v7 = v3;
  +[TPSTipKitContentManager updateContentWithMeta:v4 documents:v5 clientConditions:v6 completionHandler:v8];
}

void __199__TPSTipsManager_contentWithMetaDictionary_documents_isRemote_processTipKitContent_contextualEligibility_widgetEligibility_notificationEligibility_preferredNotificationIdentifiers_completionHandler___block_invoke_2_204(uint64_t a1, uint64_t a2, void *a3)
{
  id v4 = a3;
  uint64_t v5 = [MEMORY[0x1E4FAF480] default];
  uint64_t v6 = v5;
  if (v4)
  {
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR)) {
      __199__TPSTipsManager_contentWithMetaDictionary_documents_isRemote_processTipKitContent_contextualEligibility_widgetEligibility_notificationEligibility_preferredNotificationIdentifiers_completionHandler___block_invoke_2_204_cold_1();
    }
  }
  else if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)id v7 = 0;
    _os_log_impl(&dword_1E4492000, v6, OS_LOG_TYPE_INFO, "TipKit content ingested successfully.", v7, 2u);
  }

  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
}

uint64_t __199__TPSTipsManager_contentWithMetaDictionary_documents_isRemote_processTipKitContent_contextualEligibility_widgetEligibility_notificationEligibility_preferredNotificationIdentifiers_completionHandler___block_invoke_208()
{
  return +[TPSTipsManager resetTipKitContentProcessingFlag];
}

void __199__TPSTipsManager_contentWithMetaDictionary_documents_isRemote_processTipKitContent_contextualEligibility_widgetEligibility_notificationEligibility_preferredNotificationIdentifiers_completionHandler___block_invoke_2_209(uint64_t a1, void *a2)
{
  uint64_t v6 = a2;
  uint64_t v3 = +[TPSUserGuideManager userGuides];
  uint64_t v4 = *(void *)(*(void *)(a1 + 32) + 8);
  uint64_t v5 = *(void **)(v4 + 40);
  *(void *)(v4 + 40) = v3;

  v6[2](v6, 0);
}

void __199__TPSTipsManager_contentWithMetaDictionary_documents_isRemote_processTipKitContent_contextualEligibility_widgetEligibility_notificationEligibility_preferredNotificationIdentifiers_completionHandler___block_invoke_3_214(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 96));
  id v2 = objc_alloc_init(MEMORY[0x1E4FAF408]);
  uint64_t v3 = [WeakRetained metadata];
  uint64_t v4 = [v3 language];
  [v2 setLanguage:v4];

  uint64_t v5 = [WeakRetained metadata];
  uint64_t v6 = [v5 assetSizes];
  [v2 setAssetSizes:v6];

  [v2 setOrderedCollectionIdentifiers:*(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 40)];
  [v2 setCollectionMap:*(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 40)];
  [v2 setTipMap:*(void *)(*(void *)(*(void *)(a1 + 56) + 8) + 40)];
  id v7 = [WeakRetained featureCollectionFromCollectionMap:*(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 40) collectionOrder:*(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 40) tipMap:*(void *)(*(void *)(*(void *)(a1 + 56) + 8) + 40)];
  [v2 setFeaturedCollection:v7];

  [v2 setUserGuides:*(void *)(*(void *)(*(void *)(a1 + 64) + 8) + 40)];
  uint64_t v8 = [WeakRetained collectionSectionMapWithCollections:*(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 40) availableCollectionSections:*(void *)(*(void *)(*(void *)(a1 + 72) + 8) + 40) collectionIdToCollectionLabelMap:*(void *)(*(void *)(*(void *)(a1 + 80) + 8) + 40)];
  [v2 setCollectionSectionMap:v8];
  uint64_t v9 = *(void *)(*(void *)(*(void *)(a1 + 88) + 8) + 40);
  uint64_t v10 = [v2 featuredCollection];
  uint64_t v11 = [WeakRetained collectionSectionsWithEligibleCollectionSections:v9 collectionSectionMap:v8 featuredCollection:v10];
  [v2 setCollectionSections:v11];

  id v12 = [v2 language];
  [WeakRetained setLastFetchedLanguage:v12];

  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
}

void __91__TPSTipsManager_processTipsDeliveryInfo_deliveryInfoMap_targetingCache_completionHandler___block_invoke_227(uint64_t a1, void *a2)
{
  id v3 = a2;
  uint64_t v4 = [MEMORY[0x1E4FAF480] targeting];
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG)) {
    __91__TPSTipsManager_processTipsDeliveryInfo_deliveryInfoMap_targetingCache_completionHandler___block_invoke_227_cold_1(a1, v4);
  }

  uint64_t v5 = [*(id *)(a1 + 40) conditions];
  uint64_t v6 = [*(id *)(a1 + 40) joinType];
  id v7 = *(void **)(a1 + 32);
  uint64_t v8 = *(void *)(a1 + 48);
  v15[0] = MEMORY[0x1E4F143A8];
  v15[1] = 3221225472;
  v15[2] = __91__TPSTipsManager_processTipsDeliveryInfo_deliveryInfoMap_targetingCache_completionHandler___block_invoke_228;
  v15[3] = &unk_1E6E6B780;
  id v9 = v7;
  uint64_t v10 = *(void *)(a1 + 56);
  uint64_t v11 = *(void **)(a1 + 64);
  id v16 = v9;
  uint64_t v17 = v10;
  char v21 = *(unsigned char *)(a1 + 80);
  id v12 = v11;
  uint64_t v13 = *(void *)(a1 + 72);
  id v19 = v3;
  uint64_t v20 = v13;
  id v18 = v12;
  id v14 = v3;
  +[TPSTargetingValidator validateConditions:v5 joinType:v6 context:v9 cache:v8 completionQueue:0 completionHandler:v15];
}

void __91__TPSTipsManager_processTipsDeliveryInfo_deliveryInfoMap_targetingCache_completionHandler___block_invoke_228(uint64_t a1, uint64_t a2, void *a3)
{
  id v5 = a3;
  uint64_t v6 = [MEMORY[0x1E4FAF480] targeting];
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG)) {
    __91__TPSTipsManager_processTipsDeliveryInfo_deliveryInfoMap_targetingCache_completionHandler___block_invoke_228_cold_1();
  }

  id v7 = [*(id *)(a1 + 40) tipStatusController];
  [v7 updatePreconditionMatchedForIdentifier:*(void *)(a1 + 32) value:a2];

  if (*(unsigned char *)(a1 + 72) && a2)
  {
    if (((*(uint64_t (**)(void))(*(void *)(a1 + 48) + 16))() & 1) == 0) {
      goto LABEL_9;
    }
    goto LABEL_8;
  }
  if (a2)
  {
LABEL_8:
    uint64_t v10 = [*(id *)(a1 + 40) syncQueue];
    v11[0] = MEMORY[0x1E4F143A8];
    v11[1] = 3221225472;
    v11[2] = __91__TPSTipsManager_processTipsDeliveryInfo_deliveryInfoMap_targetingCache_completionHandler___block_invoke_235;
    v11[3] = &unk_1E6E6B758;
    uint64_t v13 = *(void *)(a1 + 64);
    id v12 = *(id *)(a1 + 32);
    dispatch_async(v10, v11);
  }
LABEL_9:
  (*(void (**)(void, id, uint64_t, uint64_t))(*(void *)(a1 + 56) + 16))(*(void *)(a1 + 56), v5, v8, v9);
}

uint64_t __91__TPSTipsManager_processTipsDeliveryInfo_deliveryInfoMap_targetingCache_completionHandler___block_invoke_235(uint64_t a1)
{
  return [*(id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40) addObject:*(void *)(a1 + 32)];
}

uint64_t __91__TPSTipsManager_processTipsDeliveryInfo_deliveryInfoMap_targetingCache_completionHandler___block_invoke_240(uint64_t a1)
{
  return [*(id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40) addObject:*(void *)(a1 + 32)];
}

uint64_t __91__TPSTipsManager_processTipsDeliveryInfo_deliveryInfoMap_targetingCache_completionHandler___block_invoke_2_241(uint64_t a1)
{
  return [*(id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40) addObject:*(void *)(a1 + 32)];
}

void __75__TPSTipsManager_processClientConditions_targetingCache_completionHandler___block_invoke(uint64_t a1, void *a2)
{
  id v5 = a2;
  id v3 = objc_msgSend(*(id *)(a1 + 32), "objectForKeyedSubscript:");
  uint64_t v4 = [[TPSDeliveryPrecondition alloc] initWithDictionary:v3];
  if ([(TPSDeliveryPrecondition *)v4 statusType] != 1) {
    [*(id *)(a1 + 40) removeObject:v5];
  }
}

void __75__TPSTipsManager_processClientConditions_targetingCache_completionHandler___block_invoke_243(uint64_t a1, int a2, void *a3)
{
  id v5 = a3;
  uint64_t v6 = [MEMORY[0x1E4FAF480] targeting];
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG)) {
    __75__TPSTipsManager_processClientConditions_targetingCache_completionHandler___block_invoke_243_cold_1();
  }

  if (([*(id *)(a1 + 40) containsObject:*(void *)(a1 + 32)] & 1) != 0 || a2)
  {
    [*(id *)(a1 + 48) addObject:*(void *)(a1 + 32)];
    if ([*(id *)(a1 + 56) statusType] == 1) {
      [*(id *)(a1 + 64) addObject:*(void *)(a1 + 32)];
    }
  }
  (*(void (**)(void))(*(void *)(a1 + 72) + 16))();
}

void __75__TPSTipsManager_processClientConditions_targetingCache_completionHandler___block_invoke_244(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 48);
  id v4 = (id)[*(id *)(a1 + 32) copy];
  id v3 = (void *)[*(id *)(a1 + 40) copy];
  (*(void (**)(uint64_t, id, void *))(v2 + 16))(v2, v4, v3);
}

- (void)reindexAllSearchableItemsWithCompletionHandler:(id)a3
{
  id v4 = a3;
  objc_initWeak(&location, self);
  v29[0] = 0;
  v29[1] = v29;
  v29[2] = 0x3032000000;
  v29[3] = __Block_byref_object_copy__1;
  void v29[4] = __Block_byref_object_dispose__1;
  id v30 = 0;
  v27[0] = 0;
  v27[1] = v27;
  v27[2] = 0x3032000000;
  v27[3] = __Block_byref_object_copy__1;
  v27[4] = __Block_byref_object_dispose__1;
  id v28 = 0;
  v25[0] = 0;
  v25[1] = v25;
  v25[2] = 0x3032000000;
  v25[3] = __Block_byref_object_copy__1;
  void v25[4] = __Block_byref_object_dispose__1;
  id v26 = [MEMORY[0x1E4FAF4A0] transactionWithName:@"com.apple.TipsDaemon.reindexAllSearchableItems"];
  id v5 = objc_alloc(MEMORY[0x1E4FAF3C8]);
  v23[0] = MEMORY[0x1E4F143A8];
  v23[1] = 3221225472;
  v23[2] = __65__TPSTipsManager_reindexAllSearchableItemsWithCompletionHandler___block_invoke;
  v23[3] = &unk_1E6E6B9D8;
  objc_copyWeak(&v24, &location);
  v23[4] = v29;
  v23[5] = v27;
  uint64_t v6 = (void *)[v5 initWithAsyncBlock:v23];
  id v7 = objc_alloc(MEMORY[0x1E4FAF3C8]);
  v22[0] = MEMORY[0x1E4F143A8];
  v22[1] = 3221225472;
  id v22[2] = __65__TPSTipsManager_reindexAllSearchableItemsWithCompletionHandler___block_invoke_251;
  v22[3] = &unk_1E6E6BA28;
  v22[4] = v27;
  v22[5] = v29;
  uint64_t v8 = (void *)[v7 initWithAsyncBlock:v22];
  id v9 = objc_alloc(MEMORY[0x1E4FAF3C8]);
  v21[0] = MEMORY[0x1E4F143A8];
  v21[1] = 3221225472;
  v21[2] = __65__TPSTipsManager_reindexAllSearchableItemsWithCompletionHandler___block_invoke_255;
  v21[3] = &unk_1E6E6BA28;
  v21[4] = v27;
  v21[5] = v29;
  uint64_t v10 = (void *)[v9 initWithAsyncBlock:v21];
  id v11 = objc_alloc_init(MEMORY[0x1E4F28F08]);
  [v11 setName:@"com.apple.TipsDaemon.reindexAllSearchableItems"];
  [v11 setMaxConcurrentOperationCount:1];
  [v11 setSuspended:1];
  [v11 addOperation:v6];
  [v8 setName:@"reindexTipsOperation"];
  [v11 addOperation:v8];
  [v10 setName:@"reindexUserGuideOperation"];
  [v11 addOperation:v10];
  v15[0] = MEMORY[0x1E4F143A8];
  v15[1] = 3221225472;
  v15[2] = __65__TPSTipsManager_reindexAllSearchableItemsWithCompletionHandler___block_invoke_263;
  v15[3] = &unk_1E6E6BA50;
  id v12 = v4;
  id v18 = v12;
  id v19 = v27;
  id v13 = v8;
  id v16 = v13;
  id v14 = v10;
  id v17 = v14;
  uint64_t v20 = v25;
  [v11 addBarrierBlock:v15];
  [v11 setSuspended:0];

  objc_destroyWeak(&v24);
  _Block_object_dispose(v25, 8);

  _Block_object_dispose(v27, 8);
  _Block_object_dispose(v29, 8);

  objc_destroyWeak(&location);
}

void __65__TPSTipsManager_reindexAllSearchableItemsWithCompletionHandler___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __65__TPSTipsManager_reindexAllSearchableItemsWithCompletionHandler___block_invoke_2;
  v6[3] = &unk_1E6E6B9B0;
  long long v8 = *(_OWORD *)(a1 + 32);
  id v7 = v3;
  id v5 = v3;
  [WeakRetained contentFromOrigin:0 processTipKitContent:0 contextualEligibility:1 widgetEligibility:0 notificationEligibility:0 preferredNotificationIdentifiers:0 shouldDeferBlock:0 completionHandler:v6];
}

void __65__TPSTipsManager_reindexAllSearchableItemsWithCompletionHandler___block_invoke_2(void *a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  if (v6)
  {
    id v7 = [MEMORY[0x1E4FAF480] indexing];
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR)) {
      __65__TPSTipsManager_reindexAllSearchableItemsWithCompletionHandler___block_invoke_2_cold_1();
    }
  }
  uint64_t v8 = *(void *)(a1[5] + 8);
  id v9 = *(void **)(v8 + 40);
  *(void *)(v8 + 40) = v5;
  id v10 = v5;

  uint64_t v11 = *(void *)(a1[6] + 8);
  id v12 = *(void **)(v11 + 40);
  *(void *)(v11 + 40) = v6;
  id v13 = v6;

  (*(void (**)(void))(a1[4] + 16))();
}

void __65__TPSTipsManager_reindexAllSearchableItemsWithCompletionHandler___block_invoke_251(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = v3;
  if (*(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 40))
  {
    (*((void (**)(id))v3 + 2))(v3);
  }
  else
  {
    id v5 = +[TPSSearchItemIndexer default];
    id v6 = [*(id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40) tipMap];
    id v7 = [v6 allValues];
    v8[0] = MEMORY[0x1E4F143A8];
    v8[1] = 3221225472;
    v8[2] = __65__TPSTipsManager_reindexAllSearchableItemsWithCompletionHandler___block_invoke_2_253;
    v8[3] = &unk_1E6E6BA00;
    id v9 = v4;
    [v5 reindexTips:v7 qualityOfService:9 completionHandler:v8];
  }
}

void __65__TPSTipsManager_reindexAllSearchableItemsWithCompletionHandler___block_invoke_2_253(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = [MEMORY[0x1E4FAF480] indexing];
  id v5 = v4;
  if (v3)
  {
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
      __65__TPSTipsManager_reindexAllSearchableItemsWithCompletionHandler___block_invoke_2_253_cold_1();
    }
  }
  else if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)id v6 = 0;
    _os_log_impl(&dword_1E4492000, v5, OS_LOG_TYPE_INFO, "Tips re-indexing completed successfully.", v6, 2u);
  }

  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
}

void __65__TPSTipsManager_reindexAllSearchableItemsWithCompletionHandler___block_invoke_255(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = v3;
  if (*(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 40))
  {
    (*((void (**)(id))v3 + 2))(v3);
  }
  else
  {
    id v5 = +[TPSSearchItemIndexer default];
    id v6 = [*(id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40) userGuides];
    v7[0] = MEMORY[0x1E4F143A8];
    v7[1] = 3221225472;
    v7[2] = __65__TPSTipsManager_reindexAllSearchableItemsWithCompletionHandler___block_invoke_2_256;
    v7[3] = &unk_1E6E6BA00;
    id v8 = v4;
    [v5 reindexUserGuides:v6 qualityOfService:9 completionHandler:v7];
  }
}

void __65__TPSTipsManager_reindexAllSearchableItemsWithCompletionHandler___block_invoke_2_256(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = [MEMORY[0x1E4FAF480] indexing];
  id v5 = v4;
  if (v3)
  {
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
      __65__TPSTipsManager_reindexAllSearchableItemsWithCompletionHandler___block_invoke_2_256_cold_1();
    }
  }
  else if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)id v6 = 0;
    _os_log_impl(&dword_1E4492000, v5, OS_LOG_TYPE_INFO, "User Guide re-indexing completed successfully.", v6, 2u);
  }

  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
}

void __65__TPSTipsManager_reindexAllSearchableItemsWithCompletionHandler___block_invoke_263(uint64_t a1)
{
  if (*(void *)(a1 + 48))
  {
    uint64_t v2 = *(void **)(*(void *)(*(void *)(a1 + 56) + 8) + 40);
    if (v2)
    {
      id v3 = v2;
    }
    else
    {
      id v3 = [*(id *)(a1 + 32) error];
      if (!v3)
      {
        id v3 = [*(id *)(a1 + 40) error];
        if (!v3)
        {
          id v16 = 0;
LABEL_9:
          (*(void (**)(void))(*(void *)(a1 + 48) + 16))();

          goto LABEL_10;
        }
      }
    }
    id v4 = [MEMORY[0x1E4F1CA60] dictionary];
    id v5 = [v3 userInfo];
    uint64_t v6 = *MEMORY[0x1E4F28568];
    id v7 = [v5 objectForKeyedSubscript:*MEMORY[0x1E4F28568]];
    [v4 setObject:v7 forKeyedSubscript:v6];

    id v8 = [v3 domain];
    LODWORD(v7) = [v8 isEqualToString:*MEMORY[0x1E4F289A0]];

    if (v7)
    {
      id v9 = [v3 userInfo];
      uint64_t v10 = *MEMORY[0x1E4F289C0];
      uint64_t v11 = [v9 objectForKeyedSubscript:*MEMORY[0x1E4F289C0]];
      [v4 setObject:v11 forKeyedSubscript:v10];
    }
    id v12 = [MEMORY[0x1E4F1CA60] dictionary];
    [v12 setObject:@"Failed to re-index all searchable items." forKeyedSubscript:v6];
    id v13 = (void *)MEMORY[0x1E4F28C58];
    id v14 = [v3 domain];
    id v15 = objc_msgSend(v13, "errorWithDomain:code:userInfo:", v14, objc_msgSend(v3, "code"), v4);
    [v12 setObject:v15 forKeyedSubscript:*MEMORY[0x1E4F28A50]];

    id v16 = [MEMORY[0x1E4F28C58] errorWithDomain:@"com.apple.tips.TPSTipsManager" code:8 userInfo:v12];

    goto LABEL_9;
  }
LABEL_10:
  uint64_t v17 = *(void *)(*(void *)(a1 + 64) + 8);
  id v18 = *(void **)(v17 + 40);
  *(void *)(v17 + 40) = 0;
}

- (void)reindexSearchableItemsWithIdentifiers:(id)a3 completionHandler:(id)a4
{
  if (a4)
  {
    id v5 = (void *)MEMORY[0x1E4F28C58];
    id v6 = a4;
    id v7 = [v5 errorWithDomain:@"com.apple.tips.TPSTipsManager" code:7 userInfo:0];
    (*((void (**)(id, id))a4 + 2))(v6, v7);
  }
}

- (void)deleteAllSearchableItemsWithCompletionHandler:(id)a3
{
  id v3 = a3;
  id v4 = +[TPSSearchItemIndexer default];
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __64__TPSTipsManager_deleteAllSearchableItemsWithCompletionHandler___block_invoke;
  v6[3] = &unk_1E6E6BA00;
  id v7 = v3;
  id v5 = v3;
  [v4 deleteAllItemsWithQualityOfService:9 completionHandler:v6];
}

uint64_t __64__TPSTipsManager_deleteAllSearchableItemsWithCompletionHandler___block_invoke(uint64_t a1)
{
  uint64_t result = *(void *)(a1 + 32);
  if (result) {
    return (*(uint64_t (**)(void))(result + 16))();
  }
  return result;
}

- (BOOL)isHardwareWelcome
{
  uint64_t v2 = [MEMORY[0x1E4FAF3F8] sharedInstance];
  BOOL v3 = [v2 userType] == 0;

  return v3;
}

- (id)welcomeCollectionFromContentPackage:(id)a3
{
  id v3 = a3;
  if (v3)
  {
    id v4 = [MEMORY[0x1E4FAF3F8] sharedInstance];
    id v5 = [v4 collectionIdentifierForCurrentUserType];

    id v6 = [v3 collectionMap];
    id v7 = [v6 objectForKeyedSubscript:v5];

    if (!v7)
    {
      id v8 = [v3 collectionMap];
      id v9 = [MEMORY[0x1E4FAF3F8] softwareWelcomeCollectionIdentifier];
      id v7 = [v8 objectForKeyedSubscript:v9];
    }
  }
  else
  {
    id v7 = 0;
  }

  return v7;
}

- (id)welcomeDocumentFromContentPackage:(id)a3
{
  id v4 = a3;
  uint64_t v25 = 0;
  id v26 = &v25;
  uint64_t v27 = 0x3032000000;
  id v28 = __Block_byref_object_copy__1;
  double v29 = __Block_byref_object_dispose__1;
  id v30 = 0;
  id v5 = [(TPSTipsManager *)self syncQueue];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __52__TPSTipsManager_welcomeDocumentFromContentPackage___block_invoke;
  block[3] = &unk_1E6E6AE20;
  void block[4] = &v25;
  dispatch_sync(v5, block);

  if (v4 || (id v6 = (void *)v26[5]) == 0)
  {
    id v8 = [(TPSTipsManager *)self welcomeCollectionFromContentPackage:v4];
    id v9 = v8;
    if (v8)
    {
      uint64_t v10 = [v8 notification];
      uint64_t v11 = [v10 title];
      id v12 = [v10 text];
      id v13 = objc_alloc_init(MEMORY[0x1E4FAF498]);
      [v13 setTitle:v11];
      [v13 setText:v12];
      id v14 = objc_alloc_init(TPSWelcomeDocument);
      id v15 = (void *)v26[5];
      v26[5] = (uint64_t)v14;

      id v16 = [v9 identifier];
      [(id)v26[5] setIdentifier:v16];

      [(id)v26[5] setNotification:v13];
      uint64_t v17 = [(TPSTipsManager *)self metadata];
      id v18 = [v17 language];
      [(id)v26[5] setLanguage:v18];

      id v19 = [MEMORY[0x1E4FAF3F8] sharedInstance];
      uint64_t v20 = [v19 majorVersion];
      [(id)v26[5] setMajorVersion:v20];

      char v21 = [(TPSTipsManager *)self syncQueue];
      v23[0] = MEMORY[0x1E4F143A8];
      v23[1] = 3221225472;
      v23[2] = __52__TPSTipsManager_welcomeDocumentFromContentPackage___block_invoke_2;
      v23[3] = &unk_1E6E6AE20;
      v23[4] = &v25;
      dispatch_async(v21, v23);

      id v7 = (id)v26[5];
    }
    else
    {
      id v7 = 0;
    }
  }
  else
  {
    id v7 = v6;
  }
  _Block_object_dispose(&v25, 8);

  return v7;
}

uint64_t __52__TPSTipsManager_welcomeDocumentFromContentPackage___block_invoke(uint64_t a1)
{
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 40) = [MEMORY[0x1E4FAF4B0] unarchivedObjectOfClass:objc_opt_class() forKey:@"TPSWelcomeDocumentCache"];

  return MEMORY[0x1F41817F8]();
}

uint64_t __52__TPSTipsManager_welcomeDocumentFromContentPackage___block_invoke_2(uint64_t a1)
{
  return [MEMORY[0x1E4FAF4B0] archivedDataWithRootObject:*(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 40) forKey:@"TPSWelcomeDocumentCache"];
}

- (BOOL)shouldPerformWidgetUpdate
{
  uint64_t v2 = [MEMORY[0x1E4F1CB18] standardUserDefaults];
  id v3 = [v2 objectForKey:@"TPSWidgetUpdateDate"];
  if (v3)
  {
    id v4 = [MEMORY[0x1E4FAF450] requestInterval];
    id v5 = v4;
    if (v4)
    {
      [v4 doubleValue];
      double v7 = v6;
    }
    else
    {
      double v7 = 86400.0;
    }
    id v9 = [MEMORY[0x1E4F1C9C8] date];
    char v8 = [v9 isTimeToDate:v3 withinTimeInterval:v7];
  }
  else
  {
    char v8 = 1;
  }

  return v8;
}

- (BOOL)widgetController:(id)a3 validForDocument:(id)a4 documentDeliveryInfoMap:(id)a5 deliveryInfoMap:(id)a6
{
  id v9 = a4;
  id v10 = a5;
  id v11 = a6;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v12 = [v9 identifier];
    id v13 = [(TPSTipsManager *)self tipStatusController];
    char v14 = [v13 isTipAppDisplayEligibleForIdentifier:v12];

    if (v14)
    {
      LOBYTE(v15) = 1;
    }
    else
    {
      id v16 = [(TPSTipsManager *)self notificationController];
      uint64_t v15 = [v16 preconditionValidForIdentifier:v12 documentDeliveryInfoMap:v10 deliveryInfoMap:v11 overrideOptOutContentOnly:0 ignoreSuppressContent:1];

      uint64_t v17 = [(TPSTipsManager *)self notificationController];
      int v18 = [v17 canUpdateHintEligibilityForIdentifier:v12];

      if (v18)
      {
        id v19 = v9;
        uint64_t v20 = [(TPSTipsManager *)self notificationController];
        [v20 updateHintEligibleForTip:v19 isValid:v15];
      }
    }
  }
  else
  {
    LOBYTE(v15) = 1;
  }

  return v15;
}

- (NSString)lastFetchedLanguage
{
  os_unfair_lock_lock((os_unfair_lock_t)&_sharedLock);
  id v3 = self->_lastFetchedLanguage;
  os_unfair_lock_unlock((os_unfair_lock_t)&_sharedLock);

  return v3;
}

- (void)setLastFetchedLanguage:(id)a3
{
  id v4 = (NSString *)a3;
  os_unfair_lock_lock((os_unfair_lock_t)&_sharedLock);
  lastFetchedLanguage = self->_lastFetchedLanguage;
  self->_lastFetchedLanguage = v4;

  os_unfair_lock_unlock((os_unfair_lock_t)&_sharedLock);
}

- (NSDictionary)cachedUserGuideMap
{
  os_unfair_lock_lock((os_unfair_lock_t)&_sharedLock);
  id v3 = self->_cachedUserGuideMap;
  os_unfair_lock_unlock((os_unfair_lock_t)&_sharedLock);

  return v3;
}

- (void)setCachedUserGuideMap:(id)a3
{
  id v4 = (NSDictionary *)a3;
  os_unfair_lock_lock((os_unfair_lock_t)&_sharedLock);
  cachedUserGuideMap = self->_cachedUserGuideMap;
  self->_cachedUserGuideMap = v4;

  os_unfair_lock_unlock((os_unfair_lock_t)&_sharedLock);
}

- (void)clearCachedUserGuides
{
}

- (id)processUserGuidesFromContentPackage:(id)a3
{
  uint64_t v39 = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  if (v3)
  {
    id v4 = [MEMORY[0x1E4F1CA60] dictionary];
    long long v33 = 0u;
    long long v34 = 0u;
    long long v35 = 0u;
    long long v36 = 0u;
    id v5 = [v3 userGuides];
    uint64_t v6 = [v5 countByEnumeratingWithState:&v33 objects:v38 count:16];
    if (v6)
    {
      uint64_t v7 = v6;
      uint64_t v8 = *(void *)v34;
      do
      {
        for (uint64_t i = 0; i != v7; ++i)
        {
          if (*(void *)v34 != v8) {
            objc_enumerationMutation(v5);
          }
          id v10 = *(void **)(*((void *)&v33 + 1) + 8 * i);
          id v11 = [v10 identifier];
          [v4 setObject:v10 forKeyedSubscript:v11];
        }
        uint64_t v7 = [v5 countByEnumeratingWithState:&v33 objects:v38 count:16];
      }
      while (v7);
    }

    long long v31 = 0u;
    long long v32 = 0u;
    long long v29 = 0u;
    long long v30 = 0u;
    id v28 = v3;
    id v12 = [v3 tipMap];
    id v13 = [v12 allValues];

    uint64_t v14 = [v13 countByEnumeratingWithState:&v29 objects:v37 count:16];
    if (v14)
    {
      uint64_t v15 = v14;
      uint64_t v16 = *(void *)v30;
      do
      {
        for (uint64_t j = 0; j != v15; ++j)
        {
          if (*(void *)v30 != v16) {
            objc_enumerationMutation(v13);
          }
          int v18 = [*(id *)(*((void *)&v29 + 1) + 8 * j) linkedDocument];
          id v19 = [v18 product];
          if ([v19 length])
          {
            uint64_t v20 = [v4 objectForKeyedSubscript:v19];

            if (!v20)
            {
              id v21 = objc_alloc(MEMORY[0x1E4FAF4C8]);
              uint64_t v22 = [v18 productVersion];
              uint64_t v23 = [v18 platform];
              id v24 = (void *)[v21 initWithIdentifier:v19 version:v22 text:0 symbol:&stru_1F4017D10 platform:v23 platformIndependent:0 gradientColorStrings:MEMORY[0x1E4F1CBF0]];

              uint64_t v25 = [v24 identifier];
              [v4 setObject:v24 forKeyedSubscript:v25];
            }
          }
        }
        uint64_t v15 = [v13 countByEnumeratingWithState:&v29 objects:v37 count:16];
      }
      while (v15);
    }

    if ([v4 count]) {
      id v26 = (void *)[v4 copy];
    }
    else {
      id v26 = 0;
    }
    id v3 = v28;
  }
  else
  {
    id v26 = 0;
  }

  return v26;
}

- (void)setDelegate:(id)a3
{
}

- (BOOL)contextualTipsInactive
{
  return self->_contextualTipsInactive;
}

- (void)setContextualTipsInactive:(BOOL)a3
{
  self->_contextualTipsInactive = a3;
}

- (void)setExperiment:(id)a3
{
}

- (void)setRulesVersion:(id)a3
{
}

- (TPSNotificationController)notificationController
{
  return self->_notificationController;
}

- (void)setNotificationController:(id)a3
{
}

- (void)setTipStatusController:(id)a3
{
}

- (void)setSyncQueue:(id)a3
{
}

- (void)setSessionItems:(id)a3
{
}

- (NSArray)collections
{
  return self->_collections;
}

- (void)setCollections:(id)a3
{
}

- (NSArray)tips
{
  return self->_tips;
}

- (void)setTips:(id)a3
{
}

- (NSDictionary)collectionsMap
{
  return self->_collectionsMap;
}

- (void)setCollectionsMap:(id)a3
{
}

- (NSDictionary)tipsMap
{
  return self->_tipsMap;
}

- (void)setTipsMap:(id)a3
{
}

- (void)setWidgetController:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_widgetController, 0);
  objc_storeStrong((id *)&self->_tipsMap, 0);
  objc_storeStrong((id *)&self->_collectionsMap, 0);
  objc_storeStrong((id *)&self->_tips, 0);
  objc_storeStrong((id *)&self->_collections, 0);
  objc_storeStrong((id *)&self->_metadata, 0);
  objc_storeStrong((id *)&self->_sessionItems, 0);
  objc_storeStrong((id *)&self->_syncQueue, 0);
  objc_storeStrong((id *)&self->_tipStatusController, 0);
  objc_storeStrong((id *)&self->_notificationController, 0);
  objc_storeStrong((id *)&self->_rulesVersion, 0);
  objc_storeStrong((id *)&self->_experiment, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_lastFetchedLanguage, 0);

  objc_storeStrong((id *)&self->_cachedUserGuideMap, 0);
}

void __199__TPSTipsManager_contentWithMetaDictionary_documents_isRemote_processTipKitContent_contextualEligibility_widgetEligibility_notificationEligibility_preferredNotificationIdentifiers_completionHandler___block_invoke_6_cold_1()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_1E4492000, v0, v1, "Failed to update device profile with error: %@", v2, v3, v4, v5, v6);
}

void __199__TPSTipsManager_contentWithMetaDictionary_documents_isRemote_processTipKitContent_contextualEligibility_widgetEligibility_notificationEligibility_preferredNotificationIdentifiers_completionHandler___block_invoke_2_204_cold_1()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_1E4492000, v0, v1, "Failed to ingest TipKit content with error: %@", v2, v3, v4, v5, v6);
}

void __91__TPSTipsManager_processTipsDeliveryInfo_deliveryInfoMap_targetingCache_completionHandler___block_invoke_cold_1()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_3(&dword_1E4492000, v0, v1, "Preconditions matched for %@", v2, v3, v4, v5, v6);
}

void __91__TPSTipsManager_processTipsDeliveryInfo_deliveryInfoMap_targetingCache_completionHandler___block_invoke_2_cold_1(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void __91__TPSTipsManager_processTipsDeliveryInfo_deliveryInfoMap_targetingCache_completionHandler___block_invoke_2_cold_2(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void __91__TPSTipsManager_processTipsDeliveryInfo_deliveryInfoMap_targetingCache_completionHandler___block_invoke_227_cold_1(uint64_t a1, NSObject *a2)
{
  uint64_t v9 = *MEMORY[0x1E4F143B8];
  uint64_t v3 = *(void *)(a1 + 32);
  uint64_t v4 = [*(id *)(a1 + 40) debugDescription];
  int v5 = 138412546;
  uint64_t v6 = v3;
  __int16 v7 = 2112;
  uint64_t v8 = v4;
  _os_log_debug_impl(&dword_1E4492000, a2, OS_LOG_TYPE_DEBUG, "Evaluating preconditions for %@: %@", (uint8_t *)&v5, 0x16u);
}

void __91__TPSTipsManager_processTipsDeliveryInfo_deliveryInfoMap_targetingCache_completionHandler___block_invoke_228_cold_1()
{
  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_6(&dword_1E4492000, v0, v1, "Tip (%@) is %@");
}

- (void)processClientConditions:(void *)a1 targetingCache:completionHandler:.cold.1(void *a1)
{
  [a1 count];
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_2(&dword_1E4492000, v1, v2, "Client Conditions Count: %ld", v3, v4, v5, v6, v7);
}

void __75__TPSTipsManager_processClientConditions_targetingCache_completionHandler___block_invoke_3_cold_1(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void __75__TPSTipsManager_processClientConditions_targetingCache_completionHandler___block_invoke_243_cold_1()
{
  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_6(&dword_1E4492000, v0, v1, "Client condition (%@) is %@");
}

- (void)featureCollectionFromCollectionMap:(void *)a1 collectionOrder:tipMap:.cold.1(void *a1)
{
  os_log_t v1 = [a1 identifier];
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_2(&dword_1E4492000, v2, v3, "Update featured collection to %@", v4, v5, v6, v7, v8);
}

- (void)featureCollectionFromCollectionMap:(os_log_t)log collectionOrder:tipMap:.cold.2(os_log_t log)
{
  *(_WORD *)os_log_t v1 = 0;
  _os_log_debug_impl(&dword_1E4492000, log, OS_LOG_TYPE_DEBUG, "All collections has been featured, randomly select a featured collection.", v1, 2u);
}

- (void)featureCollectionFromCollectionMap:(void *)a1 collectionOrder:tipMap:.cold.3(void *a1)
{
  os_log_t v1 = [a1 identifier];
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_2(&dword_1E4492000, v2, v3, "Keeping previous featured collection %@", v4, v5, v6, v7, v8);
}

- (void)featureCollectionFromCollectionMap:(void *)a1 collectionOrder:tipMap:.cold.4(void *a1)
{
  os_log_t v1 = [a1 identifier];
  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_7(&dword_1E4492000, v2, v3, "Current featured collection %@ has been fully read: %d", v4, v5, v6, v7, v8);
}

- (void)featureCollectionFromCollectionMap:(void *)a1 collectionOrder:tipMap:.cold.5(void *a1)
{
  os_log_t v1 = [a1 identifier];
  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_7(&dword_1E4492000, v2, v3, "Current featured collection %@ has been displayed for more than 7 days: %d", v4, v5, v6, v7, v8);
}

void __65__TPSTipsManager_reindexAllSearchableItemsWithCompletionHandler___block_invoke_2_cold_1()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_1E4492000, v0, v1, "Content fetch completed with error: %@", v2, v3, v4, v5, v6);
}

void __65__TPSTipsManager_reindexAllSearchableItemsWithCompletionHandler___block_invoke_2_253_cold_1()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_1E4492000, v0, v1, "Tips re-indexing completed with error: %@", v2, v3, v4, v5, v6);
}

void __65__TPSTipsManager_reindexAllSearchableItemsWithCompletionHandler___block_invoke_2_256_cold_1()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_1E4492000, v0, v1, "User Guide re-indexing completed with error: %@", v2, v3, v4, v5, v6);
}

@end