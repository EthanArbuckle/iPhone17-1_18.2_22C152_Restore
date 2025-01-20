@interface FCSubscriptionController
- (BOOL)addIgnoredSubscriptionForTagID:(id)a3;
- (BOOL)addIgnoredSubscriptionForTagID:(id)a3 groupID:(id)a4;
- (BOOL)addMutedSubscriptionForTagID:(id)a3;
- (BOOL)addMutedSubscriptionForTagID:(id)a3 groupID:(id)a4;
- (BOOL)addSubscriptionToTag:(id)a3 error:(id *)a4;
- (BOOL)addSubscriptionToTag:(id)a3 notificationsEnabled:(BOOL)a4 error:(id *)a5;
- (BOOL)addSubscriptionToTag:(id)a3 options:(int64_t)a4 error:(id *)a5;
- (BOOL)appendSubscriptionToTag:(id)a3 notificationsEnabled:(BOOL)a4 error:(id *)a5;
- (BOOL)canAddSubscription;
- (BOOL)canAddSubscriptionWithError:(id *)a3;
- (BOOL)hasAutoFavoriteSubscriptionForTagID:(id)a3;
- (BOOL)hasIgnoredSubscriptionForTagID:(id)a3;
- (BOOL)hasMutedSubscriptionForTagID:(id)a3;
- (BOOL)hasNotificationsEnabledForTag:(id)a3;
- (BOOL)hasSubscriptionToTag:(id)a3;
- (BOOL)hasSubscriptionToTagID:(id)a3;
- (BOOL)isAppleNewsNotificationForTagID:(id)a3;
- (BOOL)isChannelPermanentForTagID:(id)a3;
- (BOOL)moveSubscriptionForTagID:(id)a3 beforeTagID:(id)a4;
- (BOOL)removeIgnoredSubscriptionForTagID:(id)a3;
- (BOOL)removeIgnoredSubscriptionForTagID:(id)a3 groupID:(id)a4;
- (BOOL)setNotificationsEnabled:(BOOL)a3 forTag:(id)a4 error:(id *)a5;
- (BOOL)setNotificationsEnabled:(BOOL)a3 forTagID:(id)a4 error:(id *)a5;
- (FCLocalChannelsProvider)localChannelsProvider;
- (FCSubscriptionController)init;
- (FCSubscriptionController)initWithSubscriptionList:(id)a3 tagController:(id)a4 puzzleTypeController:(id)a5 notificationController:(id)a6 purchaseProvider:(id)a7 configurationManager:(id)a8 appConfigurationManager:(id)a9 appActivityMonitor:(id)a10 userInfo:(id)a11;
- (id)allSubscribedTagIDs;
- (id)appleNewsNotificationChannelIDs;
- (id)autoFavoriteTagIDs;
- (id)cachedSubscribedTags;
- (id)groupableTagIDs;
- (id)ignoredTagIDs;
- (id)mutedTagIDs;
- (id)newlySubscribedTagIDsInDateRange:(id)a3;
- (id)orderedCachedSubscribedTags;
- (id)orderedSubscribedTagIDs;
- (id)permanentChannelIDs;
- (id)portraitExcludedAutoFavoriteTagIDs;
- (id)subscribedTagForTagID:(id)a3;
- (id)subscribedTagIDs;
- (id)subscribedTagIDsWithNotificationsEnabled;
- (id)subscriptionForTag:(id)a3;
- (id)subscriptionForTagID:(id)a3;
- (id)subscriptionSurfacingHeadline:(id)a3;
- (id)subscriptions;
- (id)subscriptionsWithType:(unint64_t)a3;
- (id)tagIDsWithType:(unint64_t)a3;
- (void)_fetchMissingTagsWithCompletion:(uint64_t)a1;
- (void)_fetchTagsForIDs:(void *)a3 cachePolicy:(uint64_t)a4 qualityOfService:(void *)a5 completion:;
- (void)_handleNonTagSubscriptionType:(void *)a3 addedSubscriptionsByType:(void *)a4 removedSubscriptionsByType:(void *)a5 changedSubscriptionsByType:;
- (void)_integrateTags:(uint64_t)a1;
- (void)_notifyOfTagsAdded:(void *)a3 tagsChanged:(void *)a4 tagsMoved:(void *)a5 tagsRemoved:(uint64_t)a6 subscriptionType:;
- (void)_purchaseListDidAddTagIDs:(id)a3;
- (void)_purchaseListDidRemoveTagIDs:(id)a3;
- (void)_updateNotificationsForPurchaseTagIDs:(uint64_t)a3 isPaid:;
- (void)activityObservingApplicationDidEnterBackground;
- (void)addAutoFavoriteSubscriptionForTagIDs:(id)a3 groupableSubscriptionForTagIDs:(id)a4 originProvider:(id)a5 completion:(id)a6;
- (void)addObserver:(id)a3;
- (void)fetchAllTagsWithCallbackQueue:(id)a3 maximumCachedAge:(double)a4 qualityOfService:(int64_t)a5 completion:(id)a6;
- (void)fetchSubscribedTagsWithCallbackQueue:(id)a3 preferCache:(BOOL)a4 completion:(id)a5;
- (void)prewarmFromCacheWithCallbackQueue:(id)a3 completion:(id)a4;
- (void)refreshAndNotifyAboutSubscribedTags;
- (void)removeAllAutoFavoriteSubscriptions:(id)a3;
- (void)removeObserver:(id)a3;
- (void)removeSubscriptionForTagID:(id)a3 type:(unint64_t)a4;
- (void)removeSubscriptionToTag:(id)a3;
- (void)reorderSubscriptionOrderForOrderedIdentifiers:(id)a3;
- (void)setLocalChannelsProvider:(id)a3;
- (void)subscriptionList:(id)a3 didAddSubscriptions:(id)a4 changeSubscriptions:(id)a5 moveSubscriptions:(id)a6 removeSubscriptions:(id)a7;
- (void)subscriptionListDidResetToEmpty:(id)a3;
- (void)subscriptionListDidStopSyncingRemoteChanges:(id)a3;
- (void)subscriptionListWillStartSyncingRemoteChanges:(id)a3;
- (void)subscriptionsWithCompletion:(id)a3;
@end

@implementation FCSubscriptionController

void __103__FCSubscriptionController_fetchAllTagsWithCallbackQueue_maximumCachedAge_qualityOfService_completion___block_invoke_3(uint64_t a1, void *a2)
{
  uint64_t v3 = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 40);
  id v4 = a2;
  [v4 addEntriesFromDictionary:v3];
  [v4 addEntriesFromDictionary:*(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 40)];
}

id __68__FCSubscriptionController_subscribedTagIDsWithNotificationsEnabled__block_invoke(uint64_t a1, void *a2)
{
  id v2 = a2;
  if ([v2 notificationsEnabled])
  {
    uint64_t v3 = [v2 tagID];
  }
  else
  {
    uint64_t v3 = 0;
  }

  return v3;
}

id __62__FCSubscriptionController_portraitExcludedAutoFavoriteTagIDs__block_invoke(uint64_t a1, void *a2)
{
  id v2 = a2;
  if ([v2 subscriptionOrigin] == 8)
  {
    uint64_t v3 = 0;
  }
  else
  {
    uint64_t v3 = [v2 tagID];
  }

  return v3;
}

uint64_t __46__FCSubscriptionController_autoFavoriteTagIDs__block_invoke(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 32) containsObject:a2] ^ 1;
}

- (void)fetchSubscribedTagsWithCallbackQueue:(id)a3 preferCache:(BOOL)a4 completion:(id)a5
{
  BOOL v6 = a4;
  v8 = a3;
  id v9 = a5;
  v10 = [(FCSubscriptionController *)self cachedSubscribedTags];
  if (![v10 count] || !v6)
  {
    if (self) {
      subscriptionList = self->_subscriptionList;
    }
    else {
      subscriptionList = 0;
    }
    v13[0] = MEMORY[0x1E4F143A8];
    v13[1] = 3221225472;
    v13[2] = __88__FCSubscriptionController_fetchSubscribedTagsWithCallbackQueue_preferCache_completion___block_invoke_2;
    v13[3] = &unk_1E5B4EFB8;
    v13[4] = self;
    id v15 = v9;
    v14 = v8;
    [(FCPrivateDataController *)subscriptionList performFirstSyncWithCompletion:v13];

    v11 = v15;
    goto LABEL_8;
  }
  if (v9)
  {
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __88__FCSubscriptionController_fetchSubscribedTagsWithCallbackQueue_preferCache_completion___block_invoke;
    block[3] = &unk_1E5B4C7C0;
    id v18 = v9;
    id v17 = v10;
    dispatch_async(v8, block);

    v11 = v18;
LABEL_8:
  }
}

void __88__FCSubscriptionController_fetchSubscribedTagsWithCallbackQueue_preferCache_completion___block_invoke_4(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 40);
  id v2 = [*(id *)(a1 + 32) cachedSubscribedTags];
  (*(void (**)(uint64_t, id, void))(v1 + 16))(v1, v2, 0);
}

- (id)cachedSubscribedTags
{
  if (self) {
    self = (FCSubscriptionController *)self->_subscribedTagsByTagID;
  }
  return (id)[(FCSubscriptionController *)self allValues];
}

uint64_t __50__FCSubscriptionController_subscriptionsWithType___block_invoke(uint64_t a1, uint64_t a2)
{
  id v2 = *(void **)(a1 + 32);
  if (v2) {
    id v2 = (void *)v2[2];
  }
  return [v2 subscriptionForTagID:a2 type:*(void *)(a1 + 40)];
}

void __88__FCSubscriptionController_fetchSubscribedTagsWithCallbackQueue_preferCache_completion___block_invoke_2(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 32);
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __88__FCSubscriptionController_fetchSubscribedTagsWithCallbackQueue_preferCache_completion___block_invoke_3;
  v5[3] = &unk_1E5B4F080;
  id v8 = *(id *)(a1 + 48);
  id v3 = *(id *)(a1 + 40);
  uint64_t v4 = *(void *)(a1 + 32);
  id v6 = v3;
  uint64_t v7 = v4;
  -[FCSubscriptionController _fetchMissingTagsWithCompletion:](v2, v5);
}

void __103__FCSubscriptionController_fetchAllTagsWithCallbackQueue_maximumCachedAge_qualityOfService_completion___block_invoke_2_396(uint64_t a1)
{
  if (*(void *)(a1 + 40))
  {
    v14[0] = MEMORY[0x1E4F143A8];
    v14[1] = 3221225472;
    v14[2] = __103__FCSubscriptionController_fetchAllTagsWithCallbackQueue_maximumCachedAge_qualityOfService_completion___block_invoke_3;
    v14[3] = &unk_1E5B50F80;
    long long v15 = *(_OWORD *)(a1 + 48);
    uint64_t v2 = objc_msgSend(MEMORY[0x1E4F1C9E8], "fc_dictionary:", v14);
    id v3 = [FCSubscribedTags alloc];
    v13 = -[FCSubscriptionController orderedSubscribedTagIDs](*(void *)(a1 + 32));
    uint64_t v4 = objc_msgSend(v2, "nf_objectsForKeysWithoutMarker:", v13);
    v5 = [*(id *)(a1 + 32) mutedTagIDs];
    id v6 = objc_msgSend(v2, "nf_objectsForKeysWithoutMarker:", v5);
    uint64_t v7 = [*(id *)(a1 + 32) autoFavoriteTagIDs];
    id v8 = objc_msgSend(v2, "nf_objectsForKeysWithoutMarker:", v7);
    id v9 = [*(id *)(a1 + 32) groupableTagIDs];
    v10 = objc_msgSend(v2, "nf_objectsForKeysWithoutMarker:", v9);
    v11 = [(FCSubscribedTags *)v3 initWithSubscribedTags:v4 mutedTags:v6 autoFavoriteTags:v8 groupableTags:v10];

    uint64_t v12 = *(void *)(*(void *)(*(void *)(a1 + 64) + 8) + 40);
    if (!v12) {
      uint64_t v12 = *(void *)(*(void *)(*(void *)(a1 + 72) + 8) + 40);
    }
    (*(void (**)(void, FCSubscribedTags *, uint64_t))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40), v11, v12);
  }
}

- (id)orderedCachedSubscribedTags
{
  uint64_t v2 = self;
  if (self) {
    self = (FCSubscriptionController *)self->_subscribedTagsByTagID;
  }
  id v3 = [(FCSubscriptionController *)self readOnlyDictionary];
  uint64_t v4 = -[FCSubscriptionController orderedSubscribedTagIDs]((uint64_t)v2);
  v5 = objc_msgSend(v3, "nf_objectsForKeysWithoutMarker:", v4);

  return v5;
}

- (id)orderedSubscribedTagIDs
{
  if (a1)
  {
    uint64_t v1 = [*(id *)(a1 + 16) orderedSubscribedTagIDs];
    uint64_t v2 = [v1 array];
  }
  else
  {
    uint64_t v2 = 0;
  }
  return v2;
}

void __103__FCSubscriptionController_fetchAllTagsWithCallbackQueue_maximumCachedAge_qualityOfService_completion___block_invoke(uint64_t a1, void *a2)
{
  id v3 = *(void **)(a1 + 32);
  id v4 = a2;
  v5 = [v3 subscribedTagIDs];
  objc_msgSend(v4, "fc_safelyAddObjectsFromArray:", v5);

  id v6 = [*(id *)(a1 + 32) mutedTagIDs];
  objc_msgSend(v4, "fc_safelyAddObjectsFromArray:", v6);

  uint64_t v7 = [*(id *)(a1 + 32) autoFavoriteTagIDs];
  objc_msgSend(v4, "fc_safelyAddObjectsFromArray:", v7);

  id v8 = [*(id *)(a1 + 32) groupableTagIDs];
  objc_msgSend(v4, "fc_safelyAddObjectsFromArray:", v8);
}

- (id)mutedTagIDs
{
  if (self) {
    self = (FCSubscriptionController *)self->_subscriptionList;
  }
  uint64_t v2 = [(FCSubscriptionController *)self mutedTagIDs];
  id v3 = [v2 allObjects];

  return v3;
}

- (id)subscribedTagIDs
{
  if (self) {
    self = (FCSubscriptionController *)self->_subscriptionList;
  }
  uint64_t v2 = [(FCSubscriptionController *)self subscribedTagIDs];
  id v3 = [v2 allObjects];

  return v3;
}

- (id)groupableTagIDs
{
  if (self) {
    self = (FCSubscriptionController *)self->_subscriptionList;
  }
  uint64_t v2 = [(FCSubscriptionController *)self groupableTagIDs];
  id v3 = [v2 allObjects];

  return v3;
}

- (void)fetchAllTagsWithCallbackQueue:(id)a3 maximumCachedAge:(double)a4 qualityOfService:(int64_t)a5 completion:(id)a6
{
  id v10 = a3;
  id v11 = a6;
  uint64_t v12 = dispatch_group_create();
  v49[0] = MEMORY[0x1E4F143A8];
  v49[1] = 3221225472;
  v49[2] = __103__FCSubscriptionController_fetchAllTagsWithCallbackQueue_maximumCachedAge_qualityOfService_completion___block_invoke;
  v49[3] = &unk_1E5B4BF30;
  v49[4] = self;
  v13 = objc_msgSend(MEMORY[0x1E4F1C978], "fc_array:", v49);
  v14 = objc_opt_new();
  long long v15 = objc_opt_new();
  v46[0] = MEMORY[0x1E4F143A8];
  v46[1] = 3221225472;
  v46[2] = __103__FCSubscriptionController_fetchAllTagsWithCallbackQueue_maximumCachedAge_qualityOfService_completion___block_invoke_2;
  v46[3] = &unk_1E5B50F30;
  id v16 = v14;
  id v47 = v16;
  id v17 = v15;
  id v48 = v17;
  [v13 enumerateObjectsUsingBlock:v46];
  v44[0] = 0;
  v44[1] = v44;
  v44[2] = 0x3032000000;
  v44[3] = __Block_byref_object_copy__24;
  v44[4] = __Block_byref_object_dispose__24;
  id v45 = 0;
  v42[0] = 0;
  v42[1] = v42;
  v42[2] = 0x3032000000;
  v42[3] = __Block_byref_object_copy__24;
  v42[4] = __Block_byref_object_dispose__24;
  id v43 = 0;
  v40[0] = 0;
  v40[1] = v40;
  v40[2] = 0x3032000000;
  v40[3] = __Block_byref_object_copy__24;
  v40[4] = __Block_byref_object_dispose__24;
  id v41 = 0;
  v38[0] = 0;
  v38[1] = v38;
  v38[2] = 0x3032000000;
  v38[3] = __Block_byref_object_copy__24;
  v38[4] = __Block_byref_object_dispose__24;
  id v39 = 0;
  if ([v16 count])
  {
    dispatch_group_enter(v12);
    if (self) {
      puzzleTypeController = self->_puzzleTypeController;
    }
    else {
      puzzleTypeController = 0;
    }
    v19 = puzzleTypeController;
    v34[0] = MEMORY[0x1E4F143A8];
    v34[1] = 3221225472;
    v34[2] = __103__FCSubscriptionController_fetchAllTagsWithCallbackQueue_maximumCachedAge_qualityOfService_completion___block_invoke_393;
    v34[3] = &unk_1E5B50F58;
    v36 = v44;
    v37 = v42;
    v35 = v12;
    [(FCPuzzleTypeController *)v19 fetchPuzzleTypesForPuzzleTypeIDs:v16 cachePolicy:0 qualityOfService:a5 callbackQueue:v10 completionHandler:v34];
  }
  if ([v17 count])
  {
    dispatch_group_enter(v12);
    if (self) {
      tagController = self->_tagController;
    }
    else {
      tagController = 0;
    }
    v21 = tagController;
    v30[0] = MEMORY[0x1E4F143A8];
    v30[1] = 3221225472;
    v30[2] = __103__FCSubscriptionController_fetchAllTagsWithCallbackQueue_maximumCachedAge_qualityOfService_completion___block_invoke_395;
    v30[3] = &unk_1E5B50F58;
    v32 = v40;
    v33 = v38;
    v31 = v12;
    [(FCTagController *)v21 fetchTagsForTagIDs:v17 maximumCachedAge:a5 qualityOfService:v30 completionHandler:a4];
  }
  v22 = FCDispatchQueueForQualityOfService(a5);
  v24[0] = MEMORY[0x1E4F143A8];
  v24[1] = 3221225472;
  v24[2] = __103__FCSubscriptionController_fetchAllTagsWithCallbackQueue_maximumCachedAge_qualityOfService_completion___block_invoke_2_396;
  v24[3] = &unk_1E5B511C0;
  v26 = v44;
  v27 = v40;
  v24[4] = self;
  id v25 = v11;
  v28 = v38;
  v29 = v42;
  id v23 = v11;
  dispatch_group_notify(v12, v22, v24);

  _Block_object_dispose(v38, 8);
  _Block_object_dispose(v40, 8);

  _Block_object_dispose(v42, 8);
  _Block_object_dispose(v44, 8);
}

- (void)_fetchMissingTagsWithCompletion:(uint64_t)a1
{
  id v3 = a2;
  if (a1)
  {
    id v4 = [*(id *)(a1 + 16) subscribedTagIDs];
    v5 = (void *)[v4 mutableCopy];

    id v6 = (void *)MEMORY[0x1E4F1CAD0];
    uint64_t v7 = [*(id *)(a1 + 40) allKeys];
    id v8 = [v6 setWithArray:v7];
    [v5 minusSet:v8];

    if ((unint64_t)[*(id *)(a1 + 40) count] >= 5) {
      uint64_t v9 = 17;
    }
    else {
      uint64_t v9 = 25;
    }
    id v10 = +[FCCachePolicy cachePolicyWithSoftMaxAge:1.79769313e308];
    id v11 = [v5 allObjects];
    v12[0] = MEMORY[0x1E4F143A8];
    v12[1] = 3221225472;
    v12[2] = __60__FCSubscriptionController__fetchMissingTagsWithCompletion___block_invoke;
    v12[3] = &unk_1E5B4DDF8;
    id v13 = v3;
    -[FCSubscriptionController _fetchTagsForIDs:cachePolicy:qualityOfService:completion:](a1, v11, v10, v9, v12);
  }
}

- (void)_fetchTagsForIDs:(void *)a3 cachePolicy:(uint64_t)a4 qualityOfService:(void *)a5 completion:
{
  id v9 = a2;
  id v10 = a3;
  id v11 = a5;
  if (a1)
  {
    uint64_t v12 = dispatch_group_create();
    id v13 = objc_opt_new();
    v14 = objc_opt_new();
    v44[0] = MEMORY[0x1E4F143A8];
    v44[1] = 3221225472;
    v44[2] = __85__FCSubscriptionController__fetchTagsForIDs_cachePolicy_qualityOfService_completion___block_invoke;
    v44[3] = &unk_1E5B50F30;
    id v15 = v13;
    id v45 = v15;
    id v16 = v14;
    id v46 = v16;
    [v9 enumerateObjectsUsingBlock:v44];
    v42[0] = 0;
    v42[1] = v42;
    v42[2] = 0x3032000000;
    v42[3] = __Block_byref_object_copy__24;
    v42[4] = __Block_byref_object_dispose__24;
    id v43 = 0;
    v40[0] = 0;
    v40[1] = v40;
    v40[2] = 0x3032000000;
    v40[3] = __Block_byref_object_copy__24;
    v40[4] = __Block_byref_object_dispose__24;
    id v41 = 0;
    v38[0] = 0;
    v38[1] = v38;
    v38[2] = 0x3032000000;
    v38[3] = __Block_byref_object_copy__24;
    v38[4] = __Block_byref_object_dispose__24;
    id v39 = 0;
    v36[0] = 0;
    v36[1] = v36;
    v36[2] = 0x3032000000;
    v36[3] = __Block_byref_object_copy__24;
    v36[4] = __Block_byref_object_dispose__24;
    id v37 = 0;
    uint64_t v17 = [v15 count];
    if (v17 + [v16 count])
    {
      if ([v15 count])
      {
        dispatch_group_enter(v12);
        id v18 = *(id *)(a1 + 32);
        v19 = FCDispatchQueueForQualityOfService(a4);
        v32[0] = MEMORY[0x1E4F143A8];
        v32[1] = 3221225472;
        v32[2] = __85__FCSubscriptionController__fetchTagsForIDs_cachePolicy_qualityOfService_completion___block_invoke_2;
        v32[3] = &unk_1E5B50F58;
        v34 = v42;
        v35 = v40;
        v33 = v12;
        [v18 fetchPuzzleTypesForPuzzleTypeIDs:v15 cachePolicy:v10 qualityOfService:a4 callbackQueue:v19 completionHandler:v32];
      }
      if ([v16 count])
      {
        dispatch_group_enter(v12);
        id v20 = *(id *)(a1 + 24);
        v28[0] = MEMORY[0x1E4F143A8];
        v28[1] = 3221225472;
        v28[2] = __85__FCSubscriptionController__fetchTagsForIDs_cachePolicy_qualityOfService_completion___block_invoke_3;
        v28[3] = &unk_1E5B50F58;
        v30 = v38;
        v31 = v36;
        v29 = v12;
        [v20 fetchTagsForTagIDs:v16 cachePolicy:v10 qualityOfService:a4 completionHandler:v28];
      }
      v21 = FCDispatchQueueForQualityOfService(a4);
      block[0] = MEMORY[0x1E4F143A8];
      block[1] = 3221225472;
      block[2] = __85__FCSubscriptionController__fetchTagsForIDs_cachePolicy_qualityOfService_completion___block_invoke_4;
      block[3] = &unk_1E5B511C0;
      v24 = v36;
      id v25 = v40;
      void block[4] = a1;
      v26 = v42;
      v27 = v38;
      id v23 = v11;
      dispatch_group_notify(v12, v21, block);
    }
    else if (v11)
    {
      (*((void (**)(id, void))v11 + 2))(v11, MEMORY[0x1E4F1CC08]);
    }
    _Block_object_dispose(v36, 8);

    _Block_object_dispose(v38, 8);
    _Block_object_dispose(v40, 8);

    _Block_object_dispose(v42, 8);
  }
}

uint64_t __60__FCSubscriptionController__fetchMissingTagsWithCompletion___block_invoke(uint64_t a1)
{
  uint64_t result = *(void *)(a1 + 32);
  if (result) {
    return (*(uint64_t (**)(void))(result + 16))();
  }
  return result;
}

void __88__FCSubscriptionController_fetchSubscribedTagsWithCallbackQueue_preferCache_completion___block_invoke_3(void *a1)
{
  uint64_t v1 = (void *)a1[6];
  if (v1)
  {
    id v3 = a1[4];
    v5[0] = MEMORY[0x1E4F143A8];
    v5[1] = 3221225472;
    v5[2] = __88__FCSubscriptionController_fetchSubscribedTagsWithCallbackQueue_preferCache_completion___block_invoke_4;
    v5[3] = &unk_1E5B4C7C0;
    id v4 = v1;
    void v5[4] = a1[5];
    id v6 = v4;
    dispatch_async(v3, v5);
  }
}

void __103__FCSubscriptionController_fetchAllTagsWithCallbackQueue_maximumCachedAge_qualityOfService_completion___block_invoke_2(uint64_t a1, void *a2)
{
  id v5 = a2;
  BOOL v3 = +[FCPuzzleType isPuzzleTypeIdentifier:v5];
  uint64_t v4 = 40;
  if (v3) {
    uint64_t v4 = 32;
  }
  [*(id *)(a1 + v4) addObject:v5];
}

- (id)subscribedTagIDsWithNotificationsEnabled
{
  if (self) {
    self = (FCSubscriptionController *)self->_subscriptionList;
  }
  uint64_t v2 = [(FCSubscriptionController *)self subscriptionsBySubscriptionID];
  BOOL v3 = [v2 allValues];

  uint64_t v4 = objc_msgSend(v3, "fc_arrayByTransformingWithBlock:", &__block_literal_global_41);

  return v4;
}

- (id)subscriptions
{
  if (self) {
    self = (FCSubscriptionController *)self->_subscriptionList;
  }
  uint64_t v2 = [(FCSubscriptionController *)self subscriptionsBySubscriptionID];
  BOOL v3 = [v2 allValues];

  return v3;
}

void __103__FCSubscriptionController_fetchAllTagsWithCallbackQueue_maximumCachedAge_qualityOfService_completion___block_invoke_395(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  uint64_t v7 = *(void *)(*(void *)(a1 + 40) + 8);
  id v8 = *(void **)(v7 + 40);
  *(void *)(v7 + 40) = v5;
  id v12 = v5;

  uint64_t v9 = *(void *)(*(void *)(a1 + 48) + 8);
  id v10 = *(void **)(v9 + 40);
  *(void *)(v9 + 40) = v6;
  id v11 = v6;

  dispatch_group_leave(*(dispatch_group_t *)(a1 + 32));
}

- (void)setLocalChannelsProvider:(id)a3
{
}

- (id)portraitExcludedAutoFavoriteTagIDs
{
  uint64_t v2 = [(FCSubscriptionController *)self subscriptionsWithType:3];
  BOOL v3 = objc_msgSend(v2, "fc_setByTransformingWithBlock:", &__block_literal_global_433);
  uint64_t v4 = [v3 allObjects];

  return v4;
}

- (id)subscriptionsWithType:(unint64_t)a3
{
  if (self) {
    subscriptionList = self->_subscriptionList;
  }
  else {
    subscriptionList = 0;
  }
  id v6 = subscriptionList;
  uint64_t v7 = [(FCSubscriptionList *)v6 subscriptionsForType:a3];
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = __50__FCSubscriptionController_subscriptionsWithType___block_invoke;
  v11[3] = &unk_1E5B50EE0;
  v11[4] = self;
  v11[5] = a3;
  id v8 = objc_msgSend(v7, "fc_setByTransformingWithBlock:", v11);
  uint64_t v9 = [v8 allObjects];

  return v9;
}

- (id)autoFavoriteTagIDs
{
  BOOL v3 = (void *)MEMORY[0x1E4F1CAD0];
  if (self) {
    appConfigurationManager = self->_appConfigurationManager;
  }
  else {
    appConfigurationManager = 0;
  }
  id v5 = appConfigurationManager;
  id v6 = [(FCNewsAppConfigurationManager *)v5 possiblyUnfetchedAppConfiguration];
  uint64_t v7 = [v6 deprecatedSportsTopicTagIds];
  id v8 = (void *)v7;
  if (v7) {
    uint64_t v9 = v7;
  }
  else {
    uint64_t v9 = MEMORY[0x1E4F1CBF0];
  }
  id v10 = [v3 setWithArray:v9];

  if (self)
  {
    id v11 = NewsCoreUserDefaults();
    id v12 = [v11 stringForKey:@"news.demo.autofavorite_channels"];

    id v13 = [v12 componentsSeparatedByString:@","];

    if (v13)
    {
      id v14 = v13;
      id v15 = v14;
      goto LABEL_11;
    }
    subscriptionList = self->_subscriptionList;
  }
  else
  {
    subscriptionList = 0;
  }
  uint64_t v17 = subscriptionList;
  id v18 = [(FCSubscriptionList *)v17 autoFavoriteTagIDs];
  v20[0] = MEMORY[0x1E4F143A8];
  v20[1] = 3221225472;
  v20[2] = __46__FCSubscriptionController_autoFavoriteTagIDs__block_invoke;
  v20[3] = &unk_1E5B4DBB0;
  id v21 = v10;
  id v15 = objc_msgSend(v18, "fc_arrayOfObjectsPassingTest:", v20);

  id v14 = 0;
LABEL_11:

  return v15;
}

- (void)addObserver:(id)a3
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  [MEMORY[0x1E4F29060] isMainThread];
  if (v4)
  {
    if (self) {
      observers = self->_observers;
    }
    else {
      observers = 0;
    }
    if ([(NSHashTable *)observers containsObject:v4]
      && os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
    {
      id v8 = objc_msgSend([NSString alloc], "initWithFormat:", @"%p is already an observer", v4);
      *(_DWORD *)buf = 136315906;
      id v10 = "-[FCSubscriptionController addObserver:]";
      __int16 v11 = 2080;
      id v12 = "FCSubscriptionController.m";
      __int16 v13 = 1024;
      int v14 = 141;
      __int16 v15 = 2114;
      id v16 = v8;
      _os_log_error_impl(&dword_1A460D000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", buf, 0x26u);

      if (self) {
        goto LABEL_7;
      }
    }
    else if (self)
    {
LABEL_7:
      id v6 = self->_observers;
LABEL_8:
      [(NSHashTable *)v6 addObject:v4];
      goto LABEL_11;
    }
    id v6 = 0;
    goto LABEL_8;
  }
  if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
  {
    uint64_t v7 = objc_msgSend([NSString alloc], "initWithFormat:", @"Invalid parameter not satisfying %s", "observer != nil");
    *(_DWORD *)buf = 136315906;
    id v10 = "-[FCSubscriptionController addObserver:]";
    __int16 v11 = 2080;
    id v12 = "FCSubscriptionController.m";
    __int16 v13 = 1024;
    int v14 = 137;
    __int16 v15 = 2114;
    id v16 = v7;
    _os_log_error_impl(&dword_1A460D000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", buf, 0x26u);
  }
LABEL_11:
}

- (FCSubscriptionController)initWithSubscriptionList:(id)a3 tagController:(id)a4 puzzleTypeController:(id)a5 notificationController:(id)a6 purchaseProvider:(id)a7 configurationManager:(id)a8 appConfigurationManager:(id)a9 appActivityMonitor:(id)a10 userInfo:(id)a11
{
  uint64_t v55 = *MEMORY[0x1E4F143B8];
  id v17 = a3;
  id obj = a4;
  id v18 = a4;
  id v34 = a5;
  id v19 = a5;
  id v35 = a6;
  id v45 = a6;
  id v36 = a7;
  id v44 = a7;
  id v38 = a8;
  id v43 = a8;
  id v37 = a9;
  id v42 = a9;
  id v20 = a10;
  id v39 = a11;
  id v41 = a11;
  if (!v17 && os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
  {
    v29 = objc_msgSend([NSString alloc], "initWithFormat:", @"Invalid parameter not satisfying %s", "subscriptionList != nil", obj, v34, a6, a7, a9, a8, a11);
    *(_DWORD *)buf = 136315906;
    id v48 = "-[FCSubscriptionController initWithSubscriptionList:tagController:puzzleTypeController:notificationController:"
          "purchaseProvider:configurationManager:appConfigurationManager:appActivityMonitor:userInfo:]";
    __int16 v49 = 2080;
    v50 = "FCSubscriptionController.m";
    __int16 v51 = 1024;
    int v52 = 90;
    __int16 v53 = 2114;
    v54 = v29;
    _os_log_error_impl(&dword_1A460D000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", buf, 0x26u);

    if (v18) {
      goto LABEL_6;
    }
  }
  else if (v18)
  {
    goto LABEL_6;
  }
  if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
  {
    v30 = objc_msgSend([NSString alloc], "initWithFormat:", @"Invalid parameter not satisfying %s", "tagController != nil");
    *(_DWORD *)buf = 136315906;
    id v48 = "-[FCSubscriptionController initWithSubscriptionList:tagController:puzzleTypeController:notificationController:"
          "purchaseProvider:configurationManager:appConfigurationManager:appActivityMonitor:userInfo:]";
    __int16 v49 = 2080;
    v50 = "FCSubscriptionController.m";
    __int16 v51 = 1024;
    int v52 = 91;
    __int16 v53 = 2114;
    v54 = v30;
    _os_log_error_impl(&dword_1A460D000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", buf, 0x26u);
  }
LABEL_6:
  if (!v19 && os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
  {
    v31 = objc_msgSend([NSString alloc], "initWithFormat:", @"Invalid parameter not satisfying %s", "puzzleTypeController != nil");
    *(_DWORD *)buf = 136315906;
    id v48 = "-[FCSubscriptionController initWithSubscriptionList:tagController:puzzleTypeController:notificationController:"
          "purchaseProvider:configurationManager:appConfigurationManager:appActivityMonitor:userInfo:]";
    __int16 v49 = 2080;
    v50 = "FCSubscriptionController.m";
    __int16 v51 = 1024;
    int v52 = 92;
    __int16 v53 = 2114;
    v54 = v31;
    _os_log_error_impl(&dword_1A460D000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", buf, 0x26u);

    if (v20) {
      goto LABEL_11;
    }
  }
  else if (v20)
  {
    goto LABEL_11;
  }
  if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
  {
    v32 = objc_msgSend([NSString alloc], "initWithFormat:", @"Invalid parameter not satisfying %s", "appActivityMonitor != nil");
    *(_DWORD *)buf = 136315906;
    id v48 = "-[FCSubscriptionController initWithSubscriptionList:tagController:puzzleTypeController:notificationController:"
          "purchaseProvider:configurationManager:appConfigurationManager:appActivityMonitor:userInfo:]";
    __int16 v49 = 2080;
    v50 = "FCSubscriptionController.m";
    __int16 v51 = 1024;
    int v52 = 93;
    __int16 v53 = 2114;
    v54 = v32;
    _os_log_error_impl(&dword_1A460D000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", buf, 0x26u);
  }
LABEL_11:
  v46.receiver = self;
  v46.super_class = (Class)FCSubscriptionController;
  id v21 = [(FCSubscriptionController *)&v46 init];
  v22 = v21;
  if (v21)
  {
    if (v17 && v18 && v19)
    {
      [v17 addObserver:v21];
      objc_storeStrong((id *)&v22->_subscriptionList, a3);
      objc_storeStrong((id *)&v22->_tagController, obj);
      objc_storeStrong((id *)&v22->_puzzleTypeController, v34);
      objc_storeStrong((id *)&v22->_notificationController, v35);
      objc_storeStrong((id *)&v22->_purchaseProvider, v36);
      objc_storeStrong((id *)&v22->_configurationManager, v38);
      objc_storeStrong((id *)&v22->_appConfigurationManager, v37);
      objc_storeStrong((id *)&v22->_userInfo, v39);
      uint64_t v23 = [MEMORY[0x1E4F28D30] hashTableWithOptions:517];
      observers = v22->_observers;
      v22->_observers = (NSHashTable *)v23;

      id v25 = objc_alloc_init(FCThreadSafeMutableDictionary);
      subscribedTagsByTagID = v22->_subscribedTagsByTagID;
      v22->_subscribedTagsByTagID = v25;

      v27 = [MEMORY[0x1E4F28EB8] defaultCenter];
      [v27 addObserver:v22 selector:sel__purchaseListDidAddTagIDs_ name:FCPurchaseAddedNotificationName object:0];
      [v27 addObserver:v22 selector:sel__purchaseListDidRemoveTagIDs_ name:FCPurchaseRemovedNotificationName object:0];
      [v20 addObserver:v22];
      -[FCSubscriptionController _fetchMissingTagsWithCompletion:]((uint64_t)v22, 0);
    }
    else
    {
      v27 = v21;
      v22 = 0;
    }
  }
  return v22;
}

- (FCSubscriptionController)init
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
  {
    uint64_t v2 = (void *)[[NSString alloc] initWithFormat:@"Do not call method"];
    *(_DWORD *)buf = 136315906;
    id v8 = "-[FCSubscriptionController init]";
    __int16 v9 = 2080;
    id v10 = "FCSubscriptionController.m";
    __int16 v11 = 1024;
    int v12 = 77;
    __int16 v13 = 2114;
    int v14 = v2;
    _os_log_error_impl(&dword_1A460D000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", buf, 0x26u);
  }
  BOOL v3 = (void *)MEMORY[0x1E4F1CA00];
  uint64_t v4 = *MEMORY[0x1E4F1C3B8];
  id v5 = [NSString stringWithFormat:@"%@: %s", @"Do not call method", "-[FCSubscriptionController init]"];
  id v6 = [v3 exceptionWithName:v4 reason:v5 userInfo:0];

  objc_exception_throw(v6);
}

- (void)removeObserver:(id)a3
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  [MEMORY[0x1E4F29060] isMainThread];
  if (v4)
  {
    if (self) {
      observers = self->_observers;
    }
    else {
      observers = 0;
    }
    [(NSHashTable *)observers removeObject:v4];
  }
  else if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
  {
    id v6 = objc_msgSend([NSString alloc], "initWithFormat:", @"Invalid parameter not satisfying %s", "observer != nil");
    *(_DWORD *)buf = 136315906;
    id v8 = "-[FCSubscriptionController removeObserver:]";
    __int16 v9 = 2080;
    id v10 = "FCSubscriptionController.m";
    __int16 v11 = 1024;
    int v12 = 149;
    __int16 v13 = 2114;
    int v14 = v6;
    _os_log_error_impl(&dword_1A460D000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", buf, 0x26u);
  }
}

- (id)subscribedTagForTagID:(id)a3
{
  if (self) {
    self = (FCSubscriptionController *)self->_subscribedTagsByTagID;
  }
  return (id)[(FCSubscriptionController *)self objectForKey:a3];
}

- (void)subscriptionsWithCompletion:(id)a3
{
  id v4 = a3;
  id v5 = [(FCSubscriptionController *)self subscriptions];
  objc_initWeak(&location, self);
  if (self) {
    subscriptionList = self->_subscriptionList;
  }
  else {
    subscriptionList = 0;
  }
  uint64_t v7 = subscriptionList;
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __56__FCSubscriptionController_subscriptionsWithCompletion___block_invoke;
  v10[3] = &unk_1E5B50E98;
  objc_copyWeak(&v13, &location);
  id v8 = v4;
  id v12 = v8;
  id v9 = v5;
  id v11 = v9;
  [(FCPrivateDataController *)v7 syncWithCompletion:v10];

  objc_destroyWeak(&v13);
  objc_destroyWeak(&location);
}

void __56__FCSubscriptionController_subscriptionsWithCompletion___block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  uint64_t v3 = *(void *)(a1 + 40);
  if (WeakRetained)
  {
    if (!v3) {
      goto LABEL_7;
    }
    id v5 = WeakRetained;
    id v4 = [WeakRetained subscriptions];
    (*(void (**)(uint64_t, void *))(v3 + 16))(v3, v4);
  }
  else
  {
    if (!v3) {
      goto LABEL_7;
    }
    id v5 = 0;
    (*(void (**)(uint64_t, void))(v3 + 16))(v3, *(void *)(a1 + 32));
  }
  id WeakRetained = v5;
LABEL_7:
}

- (id)allSubscribedTagIDs
{
  if (self) {
    self = (FCSubscriptionController *)self->_subscriptionList;
  }
  uint64_t v2 = [(FCSubscriptionController *)self allSubscribedTagIDs];
  uint64_t v3 = [v2 allObjects];

  return v3;
}

- (id)permanentChannelIDs
{
  if (self) {
    self = (FCSubscriptionController *)self->_configurationManager;
  }
  uint64_t v2 = [(FCSubscriptionController *)self configuration];
  uint64_t v3 = [v2 permanentChannelIDs];

  return v3;
}

- (id)appleNewsNotificationChannelIDs
{
  if (self) {
    self = (FCSubscriptionController *)self->_configurationManager;
  }
  uint64_t v2 = [(FCSubscriptionController *)self configuration];
  uint64_t v3 = [v2 appleNewsNotificationChannelIDs];

  return v3;
}

- (BOOL)isChannelPermanentForTagID:(id)a3
{
  if (!a3) {
    return 0;
  }
  id v4 = a3;
  id v5 = [(FCSubscriptionController *)self permanentChannelIDs];
  char v6 = [v5 containsObject:v4];

  return v6;
}

- (BOOL)isAppleNewsNotificationForTagID:(id)a3
{
  if (!a3) {
    return 0;
  }
  id v4 = a3;
  id v5 = [(FCSubscriptionController *)self appleNewsNotificationChannelIDs];
  char v6 = [v5 containsObject:v4];

  return v6;
}

- (id)ignoredTagIDs
{
  if (self) {
    self = (FCSubscriptionController *)self->_subscriptionList;
  }
  uint64_t v2 = [(FCSubscriptionController *)self ignoredTagIDs];
  uint64_t v3 = [v2 allObjects];

  return v3;
}

- (id)tagIDsWithType:(unint64_t)a3
{
  if (self) {
    self = (FCSubscriptionController *)self->_subscriptionList;
  }
  uint64_t v3 = [(FCSubscriptionController *)self subscriptionsForType:a3];
  id v4 = [v3 allObjects];

  return v4;
}

- (BOOL)canAddSubscription
{
  [MEMORY[0x1E4F29060] isMainThread];
  if (self) {
    subscriptionList = self->_subscriptionList;
  }
  else {
    subscriptionList = 0;
  }
  return [(FCSubscriptionList *)subscriptionList canAddSubscription];
}

- (BOOL)canAddSubscriptionWithError:(id *)a3
{
  [MEMORY[0x1E4F29060] isMainThread];
  BOOL v5 = [(FCSubscriptionController *)self canAddSubscription];
  BOOL v6 = v5;
  if (a3 && !v5)
  {
    *a3 = [MEMORY[0x1E4F28C58] errorWithDomain:@"FCSubscriptionControllerErrorDomain" code:1 userInfo:0];
  }
  return v6;
}

- (BOOL)hasSubscriptionToTag:(id)a3
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if (!v4 && os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
  {
    id v10 = objc_msgSend([NSString alloc], "initWithFormat:", @"Invalid parameter not satisfying %s", "tag != nil");
    *(_DWORD *)buf = 136315906;
    id v12 = "-[FCSubscriptionController hasSubscriptionToTag:]";
    __int16 v13 = 2080;
    int v14 = "FCSubscriptionController.m";
    __int16 v15 = 1024;
    int v16 = 321;
    __int16 v17 = 2114;
    id v18 = v10;
    _os_log_error_impl(&dword_1A460D000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", buf, 0x26u);

    if (self) {
      goto LABEL_4;
    }
LABEL_7:
    subscribedTagsByTagID = 0;
    goto LABEL_5;
  }
  if (!self) {
    goto LABEL_7;
  }
LABEL_4:
  subscribedTagsByTagID = self->_subscribedTagsByTagID;
LABEL_5:
  BOOL v6 = subscribedTagsByTagID;
  uint64_t v7 = [v4 identifier];
  id v8 = [(FCThreadSafeMutableDictionary *)v6 objectForKeyedSubscript:v7];

  return v8 != 0;
}

- (BOOL)hasSubscriptionToTagID:(id)a3
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if (!v4 && os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
  {
    id v9 = objc_msgSend([NSString alloc], "initWithFormat:", @"Invalid parameter not satisfying %s", "tagID != nil");
    *(_DWORD *)buf = 136315906;
    id v11 = "-[FCSubscriptionController hasSubscriptionToTagID:]";
    __int16 v12 = 2080;
    __int16 v13 = "FCSubscriptionController.m";
    __int16 v14 = 1024;
    int v15 = 327;
    __int16 v16 = 2114;
    __int16 v17 = v9;
    _os_log_error_impl(&dword_1A460D000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", buf, 0x26u);

    if (self) {
      goto LABEL_4;
    }
LABEL_7:
    subscribedTagsByTagID = 0;
    goto LABEL_5;
  }
  if (!self) {
    goto LABEL_7;
  }
LABEL_4:
  subscribedTagsByTagID = self->_subscribedTagsByTagID;
LABEL_5:
  BOOL v6 = [(FCThreadSafeMutableDictionary *)subscribedTagsByTagID objectForKeyedSubscript:v4];
  BOOL v7 = v6 != 0;

  return v7;
}

- (id)subscriptionForTag:(id)a3
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if (!v4 && os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
  {
    id v10 = objc_msgSend([NSString alloc], "initWithFormat:", @"Invalid parameter not satisfying %s", "tag != nil");
    *(_DWORD *)buf = 136315906;
    __int16 v12 = "-[FCSubscriptionController subscriptionForTag:]";
    __int16 v13 = 2080;
    __int16 v14 = "FCSubscriptionController.m";
    __int16 v15 = 1024;
    int v16 = 333;
    __int16 v17 = 2114;
    uint64_t v18 = v10;
    _os_log_error_impl(&dword_1A460D000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", buf, 0x26u);

    if (self) {
      goto LABEL_4;
    }
  }
  else if (self)
  {
LABEL_4:
    subscriptionList = self->_subscriptionList;
    goto LABEL_5;
  }
  subscriptionList = 0;
LABEL_5:
  BOOL v6 = subscriptionList;
  BOOL v7 = [v4 identifier];
  id v8 = [(FCSubscriptionList *)v6 subscriptionForTagID:v7];

  return v8;
}

- (id)subscriptionForTagID:(id)a3
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if (!v4 && os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
  {
    id v8 = objc_msgSend([NSString alloc], "initWithFormat:", @"Invalid parameter not satisfying %s", "tagID != nil");
    *(_DWORD *)buf = 136315906;
    id v10 = "-[FCSubscriptionController subscriptionForTagID:]";
    __int16 v11 = 2080;
    __int16 v12 = "FCSubscriptionController.m";
    __int16 v13 = 1024;
    int v14 = 345;
    __int16 v15 = 2114;
    int v16 = v8;
    _os_log_error_impl(&dword_1A460D000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", buf, 0x26u);

    if (self) {
      goto LABEL_4;
    }
  }
  else if (self)
  {
LABEL_4:
    subscriptionList = self->_subscriptionList;
    goto LABEL_5;
  }
  subscriptionList = 0;
LABEL_5:
  BOOL v6 = [(FCSubscriptionList *)subscriptionList subscriptionForTagIDOfAnyType:v4];

  return v6;
}

- (BOOL)addSubscriptionToTag:(id)a3 error:(id *)a4
{
  return [(FCSubscriptionController *)self addSubscriptionToTag:a3 notificationsEnabled:0 error:a4];
}

- (BOOL)addSubscriptionToTag:(id)a3 notificationsEnabled:(BOOL)a4 error:(id *)a5
{
  return [(FCSubscriptionController *)self addSubscriptionToTag:a3 options:a4 error:a5];
}

- (BOOL)addSubscriptionToTag:(id)a3 options:(int64_t)a4 error:(id *)a5
{
  char v6 = a4;
  uint64_t v39 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  [MEMORY[0x1E4F29060] isMainThread];
  if (!v8 && os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
  {
    v29 = objc_msgSend([NSString alloc], "initWithFormat:", @"Invalid parameter not satisfying %s", "tag != nil");
    *(_DWORD *)buf = 136315906;
    v32 = "-[FCSubscriptionController addSubscriptionToTag:options:error:]";
    __int16 v33 = 2080;
    id v34 = "FCSubscriptionController.m";
    __int16 v35 = 1024;
    int v36 = 370;
    __int16 v37 = 2114;
    id v38 = v29;
    _os_log_error_impl(&dword_1A460D000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", buf, 0x26u);

    if (self) {
      goto LABEL_4;
    }
  }
  else if (self)
  {
LABEL_4:
    subscriptionList = self->_subscriptionList;
    goto LABEL_5;
  }
  subscriptionList = 0;
LABEL_5:
  id v10 = subscriptionList;
  __int16 v11 = [v8 identifier];
  BOOL v12 = [(FCSubscriptionList *)v10 hasMutedSubscriptionForTagID:v11];

  if (v12)
  {
    __int16 v13 = [v8 identifier];
    [(FCSubscriptionController *)self removeSubscriptionForTagID:v13 type:2];
  }
  if (![(FCSubscriptionList *)v10 canAddSubscription]
    || ([v8 identifier],
        int v14 = objc_claimAutoreleasedReturnValue(),
        BOOL v15 = [(FCSubscriptionList *)v10 addSubscriptionForTagID:v14 type:0 origin:0 groupID:0 notificationsEnabled:v6 & 1], v14, !v15))
  {
    if (a5)
    {
      [MEMORY[0x1E4F28C58] errorWithDomain:@"FCSubscriptionControllerErrorDomain" code:1 userInfo:0];
      BOOL v16 = 0;
      *a5 = (id)objc_claimAutoreleasedReturnValue();
      goto LABEL_20;
    }
    goto LABEL_19;
  }
  id v30 = v8;
  BOOL v16 = 1;
  uint64_t v17 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v30 count:1];
  -[FCSubscriptionController _integrateTags:]((uint64_t)self, v17);

  if (v6)
  {
    if (self) {
      purchaseProvider = self->_purchaseProvider;
    }
    else {
      purchaseProvider = 0;
    }
    uint64_t v19 = purchaseProvider;
    id v20 = [v8 identifier];
    id v21 = [(FCPurchaseProviderType *)v19 purchasedTagIDs];

    uint64_t v22 = [v21 containsObject:v20];
    if (self) {
      notificationController = self->_notificationController;
    }
    else {
      notificationController = 0;
    }
    v24 = notificationController;
    id v25 = [v8 identifier];
    BOOL v26 = [(FCNotificationController *)v24 registerNotificationsForChannelID:v25 isPaid:v22];

    if (v26)
    {
      BOOL v16 = 1;
      goto LABEL_20;
    }
    v27 = [v8 identifier];
    [(FCSubscriptionList *)v10 setNotificationsEnabled:0 forTagID:v27];

LABEL_19:
    BOOL v16 = 0;
  }
LABEL_20:

  return v16;
}

- (void)_integrateTags:(uint64_t)a1
{
  id v3 = a2;
  if (a1)
  {
    [MEMORY[0x1E4F29060] isMainThread];
    id v4 = objc_opt_new();
    BOOL v5 = objc_opt_new();
    char v6 = *(void **)(a1 + 40);
    v9[0] = MEMORY[0x1E4F143A8];
    v9[1] = 3221225472;
    v9[2] = __43__FCSubscriptionController__integrateTags___block_invoke;
    v9[3] = &unk_1E5B51198;
    id v10 = v3;
    id v7 = v5;
    id v11 = v7;
    id v8 = v4;
    id v12 = v8;
    [v6 readWriteWithAccessor:v9];
    if ([v7 count] || objc_msgSend(v8, "count")) {
      -[FCSubscriptionController _notifyOfTagsAdded:tagsChanged:tagsMoved:tagsRemoved:subscriptionType:](a1, v7, v8, 0, 0, 0);
    }
  }
}

- (BOOL)appendSubscriptionToTag:(id)a3 notificationsEnabled:(BOOL)a4 error:(id *)a5
{
  uint64_t v25 = *MEMORY[0x1E4F143B8];
  id v7 = a3;
  [MEMORY[0x1E4F29060] isMainThread];
  if (!v7 && os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
  {
    BOOL v15 = objc_msgSend([NSString alloc], "initWithFormat:", @"Invalid parameter not satisfying %s", "tag != nil");
    *(_DWORD *)buf = 136315906;
    uint64_t v18 = "-[FCSubscriptionController appendSubscriptionToTag:notificationsEnabled:error:]";
    __int16 v19 = 2080;
    id v20 = "FCSubscriptionController.m";
    __int16 v21 = 1024;
    int v22 = 428;
    __int16 v23 = 2114;
    v24 = v15;
    _os_log_error_impl(&dword_1A460D000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", buf, 0x26u);

    if (self) {
      goto LABEL_4;
    }
LABEL_13:
    subscriptionList = 0;
    goto LABEL_5;
  }
  if (!self) {
    goto LABEL_13;
  }
LABEL_4:
  subscriptionList = self->_subscriptionList;
LABEL_5:
  id v9 = subscriptionList;
  if ([(FCSubscriptionList *)v9 canAddSubscription]
    && ([v7 identifier],
        id v10 = objc_claimAutoreleasedReturnValue(),
        BOOL v11 = [(FCSubscriptionList *)v9 appendSubscriptionForTagID:v10 type:0],
        v10,
        v11))
  {
    id v16 = v7;
    BOOL v12 = 1;
    __int16 v13 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v16 count:1];
    -[FCSubscriptionController _integrateTags:]((uint64_t)self, v13);
  }
  else if (a5)
  {
    [MEMORY[0x1E4F28C58] errorWithDomain:@"FCSubscriptionControllerErrorDomain" code:1 userInfo:0];
    BOOL v12 = 0;
    *a5 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    BOOL v12 = 0;
  }

  return v12;
}

- (void)removeSubscriptionToTag:(id)a3
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  [MEMORY[0x1E4F29060] isMainThread];
  if (!v4 && os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
  {
    __int16 v13 = objc_msgSend([NSString alloc], "initWithFormat:", @"Invalid parameter not satisfying %s", "tag != nil");
    *(_DWORD *)buf = 136315906;
    BOOL v15 = "-[FCSubscriptionController removeSubscriptionToTag:]";
    __int16 v16 = 2080;
    uint64_t v17 = "FCSubscriptionController.m";
    __int16 v18 = 1024;
    int v19 = 457;
    __int16 v20 = 2114;
    __int16 v21 = v13;
    _os_log_error_impl(&dword_1A460D000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", buf, 0x26u);
  }
  BOOL v5 = [v4 identifier];
  if (self) {
    subscriptionList = self->_subscriptionList;
  }
  else {
    subscriptionList = 0;
  }
  id v7 = [(FCSubscriptionList *)subscriptionList subscriptionForTagID:v5];
  int v8 = [v7 notificationsEnabled];
  if (self)
  {
    [(FCSubscriptionList *)self->_subscriptionList removeSubscriptionForTagID:v5 type:0];
    subscribedTagsByTagID = self->_subscribedTagsByTagID;
  }
  else
  {
    [0 removeSubscriptionForTagID:v5 type:0];
    subscribedTagsByTagID = 0;
  }
  id v10 = [(FCThreadSafeMutableDictionary *)subscribedTagsByTagID objectForKeyedSubscript:v5];

  if (v10 && os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
  {
    BOOL v12 = objc_msgSend([NSString alloc], "initWithFormat:", @"expected nil value for '%s'", "self.subscribedTagsByTagID[identifier]");
    *(_DWORD *)buf = 136315906;
    BOOL v15 = "-[FCSubscriptionController removeSubscriptionToTag:]";
    __int16 v16 = 2080;
    uint64_t v17 = "FCSubscriptionController.m";
    __int16 v18 = 1024;
    int v19 = 465;
    __int16 v20 = 2114;
    __int16 v21 = v12;
    _os_log_error_impl(&dword_1A460D000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", buf, 0x26u);

    if (!v8) {
      goto LABEL_14;
    }
  }
  else if (!v8)
  {
    goto LABEL_14;
  }
  if (self) {
    notificationController = self->_notificationController;
  }
  else {
    notificationController = 0;
  }
  [(FCNotificationController *)notificationController unregisterNotificationsForChannelID:v5];
LABEL_14:
}

- (void)removeSubscriptionForTagID:(id)a3 type:(unint64_t)a4
{
  char v6 = (void *)MEMORY[0x1E4F29060];
  id v8 = a3;
  [v6 isMainThread];
  if (self) {
    subscriptionList = self->_subscriptionList;
  }
  else {
    subscriptionList = 0;
  }
  [(FCSubscriptionList *)subscriptionList removeSubscriptionForTagID:v8 type:a4];
}

- (BOOL)setNotificationsEnabled:(BOOL)a3 forTag:(id)a4 error:(id *)a5
{
  BOOL v6 = a3;
  id v8 = [a4 identifier];
  LOBYTE(a5) = [(FCSubscriptionController *)self setNotificationsEnabled:v6 forTagID:v8 error:a5];

  return (char)a5;
}

- (BOOL)setNotificationsEnabled:(BOOL)a3 forTagID:(id)a4 error:(id *)a5
{
  BOOL v6 = a3;
  uint64_t v30 = *MEMORY[0x1E4F143B8];
  id v8 = a4;
  [MEMORY[0x1E4F29060] isMainThread];
  if (!v8 && os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
  {
    __int16 v21 = objc_msgSend([NSString alloc], "initWithFormat:", @"Invalid parameter not satisfying %s", "tagID != nil");
    *(_DWORD *)buf = 136315906;
    __int16 v23 = "-[FCSubscriptionController setNotificationsEnabled:forTagID:error:]";
    __int16 v24 = 2080;
    uint64_t v25 = "FCSubscriptionController.m";
    __int16 v26 = 1024;
    int v27 = 496;
    __int16 v28 = 2114;
    v29 = v21;
    _os_log_error_impl(&dword_1A460D000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", buf, 0x26u);

    if (self) {
      goto LABEL_4;
    }
LABEL_25:
    subscriptionList = 0;
    goto LABEL_5;
  }
  if (!self) {
    goto LABEL_25;
  }
LABEL_4:
  subscriptionList = self->_subscriptionList;
LABEL_5:
  BOOL v10 = [(FCSubscriptionList *)subscriptionList setNotificationsEnabled:v6 forTagID:v8];
  BOOL v11 = v10;
  if (a5 && !v10)
  {
    *a5 = [MEMORY[0x1E4F28C58] errorWithDomain:@"FCSubscriptionControllerErrorDomain" code:2 userInfo:0];
  }
  if (!v11) {
    goto LABEL_22;
  }
  if (!v6)
  {
    if (self) {
      notificationController = self->_notificationController;
    }
    else {
      notificationController = 0;
    }
    if ([(FCNotificationController *)notificationController unregisterNotificationsForChannelID:v8])
    {
      goto LABEL_15;
    }
    goto LABEL_19;
  }
  if (self) {
    purchaseProvider = self->_purchaseProvider;
  }
  else {
    purchaseProvider = 0;
  }
  id v13 = v8;
  int v14 = [(FCPurchaseProviderType *)purchaseProvider purchasedTagIDs];
  uint64_t v15 = [v14 containsObject:v13];

  if (self) {
    __int16 v16 = self->_notificationController;
  }
  else {
    __int16 v16 = 0;
  }
  if (![(FCNotificationController *)v16 registerNotificationsForChannelID:v13 isPaid:v15])
  {
LABEL_19:
    if (self) {
      int v19 = self->_subscriptionList;
    }
    else {
      int v19 = 0;
    }
    [(FCSubscriptionList *)v19 setNotificationsEnabled:v6 ^ 1 forTagID:v8];
LABEL_22:
    BOOL v17 = 0;
    goto LABEL_23;
  }
LABEL_15:
  BOOL v17 = 1;
LABEL_23:

  return v17;
}

- (BOOL)hasNotificationsEnabledForTag:(id)a3
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if (!v4 && os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
  {
    BOOL v10 = objc_msgSend([NSString alloc], "initWithFormat:", @"Invalid parameter not satisfying %s", "tag != nil");
    *(_DWORD *)buf = 136315906;
    BOOL v12 = "-[FCSubscriptionController hasNotificationsEnabledForTag:]";
    __int16 v13 = 2080;
    int v14 = "FCSubscriptionController.m";
    __int16 v15 = 1024;
    int v16 = 537;
    __int16 v17 = 2114;
    __int16 v18 = v10;
    _os_log_error_impl(&dword_1A460D000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", buf, 0x26u);

    if (self) {
      goto LABEL_4;
    }
LABEL_7:
    subscriptionList = 0;
    goto LABEL_5;
  }
  if (!self) {
    goto LABEL_7;
  }
LABEL_4:
  subscriptionList = self->_subscriptionList;
LABEL_5:
  BOOL v6 = subscriptionList;
  id v7 = [v4 identifier];
  BOOL v8 = [(FCSubscriptionList *)v6 hasNotificationsEnabledForTagID:v7];

  return v8;
}

- (id)subscriptionSurfacingHeadline:(id)a3
{
  id v4 = a3;
  if (self) {
    subscriptionList = self->_subscriptionList;
  }
  else {
    subscriptionList = 0;
  }
  BOOL v6 = subscriptionList;
  id v7 = [v4 surfacedByChannelID];
  if (v7)
  {
    BOOL v8 = [(FCSubscriptionList *)v6 subscriptionForTagIDOfAnyType:v7];
  }
  else
  {
    id v9 = [v4 surfacedByTopicID];
    BOOL v8 = [(FCSubscriptionList *)v6 subscriptionForTagIDOfAnyType:v9];
  }
  return v8;
}

- (void)refreshAndNotifyAboutSubscribedTags
{
  uint64_t v60 = *MEMORY[0x1E4F143B8];
  [MEMORY[0x1E4F29060] isMainThread];
  id v3 = objc_opt_new();
  uint64_t v4 = objc_opt_new();
  BOOL v5 = objc_opt_new();
  __int16 v37 = self;
  if (self) {
    subscribedTagsByTagID = self->_subscribedTagsByTagID;
  }
  else {
    subscribedTagsByTagID = 0;
  }
  v40 = (void *)v4;
  id v7 = subscribedTagsByTagID;
  BOOL v8 = [(FCThreadSafeMutableDictionary *)v7 readOnlyDictionary];

  long long v53 = 0u;
  long long v54 = 0u;
  long long v51 = 0u;
  long long v52 = 0u;
  int v36 = v8;
  id obj = [v8 allValues];
  uint64_t v41 = [obj countByEnumeratingWithState:&v51 objects:v59 count:16];
  if (v41)
  {
    uint64_t v39 = *(void *)v52;
    do
    {
      for (uint64_t i = 0; i != v41; ++i)
      {
        BOOL v10 = v5;
        if (*(void *)v52 != v39) {
          objc_enumerationMutation(obj);
        }
        BOOL v11 = *(void **)(*((void *)&v51 + 1) + 8 * i);
        int v12 = [v11 isNotificationEnabled];
        __int16 v13 = [v11 identifier];
        if (v12) {
          int v14 = v3;
        }
        else {
          int v14 = v40;
        }
        [v14 addObject:v13];

        __int16 v15 = v3;
        int v16 = NSString;
        __int16 v17 = [v11 identifier];
        unsigned int v18 = [v11 isNotificationEnabled];
        uint64_t v19 = [v11 fetchDate];
        __int16 v20 = [v11 lastModifiedDate];
        __int16 v21 = [v11 versionKey];
        uint64_t v22 = [v16 stringWithFormat:@"tagID: %@ notifications: %d fetchedDate: %@ modifiedDate: %@ changeTag: %@", v17, v18, v19, v20, v21];
        __int16 v23 = [v11 identifier];
        BOOL v5 = v10;
        [v10 setObject:v22 forKeyedSubscript:v23];

        id v3 = v15;
      }
      uint64_t v41 = [obj countByEnumeratingWithState:&v51 objects:v59 count:16];
    }
    while (v41);
  }

  __int16 v24 = [(FCSubscriptionController *)v37 subscribedTagIDs];
  v49[0] = MEMORY[0x1E4F143A8];
  v49[1] = 3221225472;
  v49[2] = __63__FCSubscriptionController_refreshAndNotifyAboutSubscribedTags__block_invoke;
  v49[3] = &unk_1E5B4DBB0;
  id v25 = v36;
  id v50 = v25;
  __int16 v26 = objc_msgSend(v24, "fc_arrayOfObjectsPassingTest:", v49);

  int v27 = [(FCSubscriptionController *)v37 autoFavoriteTagIDs];
  v47[0] = MEMORY[0x1E4F143A8];
  v47[1] = 3221225472;
  v47[2] = __63__FCSubscriptionController_refreshAndNotifyAboutSubscribedTags__block_invoke_2;
  v47[3] = &unk_1E5B4DBB0;
  id v28 = v25;
  id v48 = v28;
  v29 = objc_msgSend(v27, "fc_arrayOfObjectsPassingTest:", v47);

  uint64_t v30 = objc_msgSend(MEMORY[0x1E4F1C978], "fc_arrayByAddingObjectsFromArray:toArray:", v26, v29);
  v31 = (void *)FCPushNotificationsLog;
  if (os_log_type_enabled((os_log_t)FCPushNotificationsLog, OS_LOG_TYPE_DEFAULT))
  {
    v32 = v31;
    uint64_t v33 = [v26 count];
    uint64_t v34 = [v29 count];
    *(_DWORD *)buf = 134218240;
    uint64_t v56 = v33;
    __int16 v57 = 2048;
    uint64_t v58 = v34;
    _os_log_impl(&dword_1A460D000, v32, OS_LOG_TYPE_DEFAULT, "About to refresh %lu subscribedTagIDs and %lu autoFavoriteTagIDs", buf, 0x16u);
  }
  if ([v30 count])
  {
    __int16 v35 = +[FCCachePolicy cachePolicyWithSoftMaxAge:60.0];
    v42[0] = MEMORY[0x1E4F143A8];
    v42[1] = 3221225472;
    v42[2] = __63__FCSubscriptionController_refreshAndNotifyAboutSubscribedTags__block_invoke_56;
    v42[3] = &unk_1E5B50F08;
    id v43 = v40;
    id v44 = v5;
    id v45 = v37;
    id v46 = v3;
    -[FCSubscriptionController _fetchTagsForIDs:cachePolicy:qualityOfService:completion:]((uint64_t)v37, v30, v35, 9, v42);
  }
}

BOOL __63__FCSubscriptionController_refreshAndNotifyAboutSubscribedTags__block_invoke(uint64_t a1, uint64_t a2)
{
  uint64_t v2 = [*(id *)(a1 + 32) objectForKey:a2];
  BOOL v3 = v2 != 0;

  return v3;
}

BOOL __63__FCSubscriptionController_refreshAndNotifyAboutSubscribedTags__block_invoke_2(uint64_t a1, uint64_t a2)
{
  uint64_t v2 = [*(id *)(a1 + 32) objectForKey:a2];
  BOOL v3 = v2 != 0;

  return v3;
}

void __63__FCSubscriptionController_refreshAndNotifyAboutSubscribedTags__block_invoke_56(void *a1, void *a2)
{
  uint64_t v99 = *MEMORY[0x1E4F143B8];
  id v2 = a2;
  BOOL v3 = objc_opt_new();
  uint64_t v4 = objc_opt_new();
  long long v84 = 0u;
  long long v85 = 0u;
  long long v86 = 0u;
  long long v87 = 0u;
  v75 = v2;
  BOOL v5 = [v2 allValues];
  uint64_t v6 = [v5 countByEnumeratingWithState:&v84 objects:v94 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v85;
    do
    {
      for (uint64_t i = 0; i != v7; ++i)
      {
        if (*(void *)v85 != v8) {
          objc_enumerationMutation(v5);
        }
        BOOL v10 = *(void **)(*((void *)&v84 + 1) + 8 * i);
        int v11 = [v10 isNotificationEnabled];
        int v12 = [v10 identifier];
        if (v11) {
          __int16 v13 = v3;
        }
        else {
          __int16 v13 = (void *)v4;
        }
        [v13 addObject:v12];
      }
      uint64_t v7 = [v5 countByEnumeratingWithState:&v84 objects:v94 count:16];
    }
    while (v7);
  }
  v67 = (void *)v4;

  [v3 intersectSet:a1[4]];
  v72 = [MEMORY[0x1E4F1CA80] set];
  long long v80 = 0u;
  long long v81 = 0u;
  long long v82 = 0u;
  long long v83 = 0u;
  v66 = v3;
  id obj = [v3 allObjects];
  uint64_t v14 = [obj countByEnumeratingWithState:&v80 objects:v93 count:16];
  if (v14)
  {
    uint64_t v15 = v14;
    uint64_t v73 = *(void *)v81;
    do
    {
      for (uint64_t j = 0; j != v15; ++j)
      {
        if (*(void *)v81 != v73) {
          objc_enumerationMutation(obj);
        }
        uint64_t v17 = *(void *)(*((void *)&v80 + 1) + 8 * j);
        unsigned int v18 = [v75 objectForKey:v17];
        [v72 addObject:v18];
        uint64_t v19 = NSString;
        __int16 v20 = [v18 identifier];
        unsigned int v21 = [v18 isNotificationEnabled];
        uint64_t v22 = [v18 fetchDate];
        __int16 v23 = [v18 lastModifiedDate];
        __int16 v24 = [v18 versionKey];
        id v25 = [v19 stringWithFormat:@"tagID: %@ notifications: %d fetchedDate: %@ modifiedDate: %@ changeTag: %@", v20, v21, v22, v23, v24];

        __int16 v26 = FCPushNotificationsLog;
        if (os_log_type_enabled((os_log_t)FCPushNotificationsLog, OS_LOG_TYPE_DEFAULT))
        {
          int v27 = (void *)a1[5];
          id v28 = v26;
          v29 = [v27 objectForKeyedSubscript:v17];
          *(_DWORD *)buf = 138543362;
          *(void *)&uint8_t buf[4] = v29;
          _os_log_impl(&dword_1A460D000, v28, OS_LOG_TYPE_DEFAULT, "Initial state %{public}@", buf, 0xCu);

          __int16 v26 = FCPushNotificationsLog;
        }
        if (os_log_type_enabled(v26, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 138543362;
          *(void *)&uint8_t buf[4] = v25;
          _os_log_impl(&dword_1A460D000, v26, OS_LOG_TYPE_DEFAULT, "Latest state  %{public}@", buf, 0xCu);
        }
      }
      uint64_t v15 = [obj countByEnumeratingWithState:&v80 objects:v93 count:16];
    }
    while (v15);
  }

  uint64_t v30 = a1;
  if ([v72 count])
  {
    uint64_t v31 = a1[6];
    id v32 = v72;
    if (v31)
    {
      [MEMORY[0x1E4F29060] isMainThread];
      long long v88 = 0u;
      long long v89 = 0u;
      long long v90 = 0u;
      long long v91 = 0u;
      uint64_t v33 = (void *)[*(id *)(v31 + 48) copy];
      uint64_t v34 = [v33 countByEnumeratingWithState:&v88 objects:buf count:16];
      if (v34)
      {
        uint64_t v35 = v34;
        uint64_t v36 = *(void *)v89;
        do
        {
          for (uint64_t k = 0; k != v35; ++k)
          {
            if (*(void *)v89 != v36) {
              objc_enumerationMutation(v33);
            }
            id v38 = *(void **)(*((void *)&v88 + 1) + 8 * k);
            if (objc_opt_respondsToSelector()) {
              [v38 subscriptionController:v31 didFindTagsWithNotificationSupport:v32];
            }
          }
          uint64_t v35 = [v33 countByEnumeratingWithState:&v88 objects:buf count:16];
        }
        while (v35);
      }
    }
    uint64_t v30 = a1;
  }
  [v67 intersectSet:v30[7]];
  long long v78 = 0u;
  long long v79 = 0u;
  long long v76 = 0u;
  long long v77 = 0u;
  id v69 = [v67 allObjects];
  uint64_t v74 = [v69 countByEnumeratingWithState:&v76 objects:v92 count:16];
  if (v74)
  {
    uint64_t v71 = *(void *)v77;
    do
    {
      for (uint64_t m = 0; m != v74; ++m)
      {
        if (*(void *)v77 != v71) {
          objc_enumerationMutation(v69);
        }
        uint64_t v40 = *(void *)(*((void *)&v76 + 1) + 8 * m);
        uint64_t v41 = [v75 objectForKey:v40];
        [(id)v30[6] setNotificationsEnabled:0 forTag:v41 error:0];
        id v42 = NSString;
        id v43 = [v41 identifier];
        unsigned int v44 = [v41 isNotificationEnabled];
        id v45 = [v41 fetchDate];
        id v46 = [v41 lastModifiedDate];
        id v47 = [v41 versionKey];
        id v48 = [v42 stringWithFormat:@"tagID: %@ notifications: %d fetchedDate: %@ modifiedDate: %@ changeTag: %@", v43, v44, v45, v46, v47];

        __int16 v49 = FCPushNotificationsLog;
        if (os_log_type_enabled((os_log_t)FCPushNotificationsLog, OS_LOG_TYPE_DEFAULT))
        {
          id v50 = (void *)v30[5];
          long long v51 = v49;
          long long v52 = [v50 objectForKeyedSubscript:v40];
          *(_DWORD *)buf = 138543362;
          *(void *)&uint8_t buf[4] = v52;
          _os_log_impl(&dword_1A460D000, v51, OS_LOG_TYPE_DEFAULT, "Initial state %{public}@", buf, 0xCu);

          __int16 v49 = FCPushNotificationsLog;
        }
        if (os_log_type_enabled(v49, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 138543362;
          *(void *)&uint8_t buf[4] = v48;
          _os_log_impl(&dword_1A460D000, v49, OS_LOG_TYPE_DEFAULT, "Latest state  %{public}@", buf, 0xCu);
        }
      }
      uint64_t v74 = [v69 countByEnumeratingWithState:&v76 objects:v92 count:16];
    }
    while (v74);
  }

  long long v53 = (void *)FCPushNotificationsLog;
  if (os_log_type_enabled((os_log_t)FCPushNotificationsLog, OS_LOG_TYPE_DEFAULT))
  {
    long long v54 = v53;
    uint64_t v55 = [v72 count];
    uint64_t v56 = [v67 count];
    *(_DWORD *)buf = 134218240;
    *(void *)&uint8_t buf[4] = v55;
    *(_WORD *)&buf[12] = 2048;
    *(void *)&buf[14] = v56;
    _os_log_impl(&dword_1A460D000, v54, OS_LOG_TYPE_DEFAULT, "Found %lu tags with notifications enabled, %lu tags with notifications disabled", buf, 0x16u);
  }
  __int16 v57 = (id *)a1[6];
  id v58 = [v75 allValues];
  if (v57)
  {
    v59 = (void *)MEMORY[0x1E4F1CAD0];
    uint64_t v60 = [v57 localChannelsProvider];
    v61 = [v60 lastKnownChannelIDs];
    v62 = [v59 setWithArray:v61];

    v63 = (void *)MEMORY[0x1E4F1C978];
    *(void *)buf = MEMORY[0x1E4F143A8];
    *(void *)&buf[8] = 3221225472;
    *(void *)&buf[16] = __59__FCSubscriptionController__refreshSectionTagsWhereNeeded___block_invoke;
    v96 = &unk_1E5B501A0;
    id v97 = v58;
    id v98 = v62;
    id v64 = v62;
    v65 = objc_msgSend(v63, "fc_array:", buf);
    [v57[3] fetchTagsForTagIDs:v65 maximumCachedAge:9 qualityOfService:0 completionHandler:60.0];
  }
}

void __59__FCSubscriptionController__refreshSectionTagsWhereNeeded___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  id v4 = *(id *)(a1 + 32);
  uint64_t v5 = [v4 countByEnumeratingWithState:&v15 objects:v19 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v16;
    do
    {
      uint64_t v8 = 0;
      do
      {
        if (*(void *)v16 != v7) {
          objc_enumerationMutation(v4);
        }
        id v9 = *(void **)(*((void *)&v15 + 1) + 8 * v8);
        if (v9)
        {
          if (objc_msgSend(*(id *)(*((void *)&v15 + 1) + 8 * v8), "conformsToProtocol:", &unk_1EF90D488, (void)v15))BOOL v10 = v9; {
          else
          }
            BOOL v10 = 0;
        }
        else
        {
          BOOL v10 = 0;
        }
        id v11 = v10;
        if (([v11 isNewspaper] & 1) != 0
          || ([v11 isLocal] & 1) != 0
          || (int v12 = *(void **)(a1 + 40),
              [v11 identifier],
              __int16 v13 = objc_claimAutoreleasedReturnValue(),
              LODWORD(v12) = [v12 containsObject:v13],
              v13,
              v12))
        {
          uint64_t v14 = objc_msgSend(v11, "sectionIDs", (void)v15);
          [v3 addObjectsFromArray:v14];
        }
        ++v8;
      }
      while (v6 != v8);
      uint64_t v6 = [v4 countByEnumeratingWithState:&v15 objects:v19 count:16];
    }
    while (v6);
  }
}

void __103__FCSubscriptionController_fetchAllTagsWithCallbackQueue_maximumCachedAge_qualityOfService_completion___block_invoke_393(uint64_t a1, void *a2, void *a3)
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  id v6 = a3;
  if (v6)
  {
    uint64_t v7 = FCPuzzleLog;
    if (os_log_type_enabled((os_log_t)FCPuzzleLog, OS_LOG_TYPE_ERROR))
    {
      int v14 = 138543362;
      id v15 = v6;
      _os_log_error_impl(&dword_1A460D000, v7, OS_LOG_TYPE_ERROR, "failed to fetch some subscribed puzzle types with error: %{public}@", (uint8_t *)&v14, 0xCu);
    }
  }
  uint64_t v8 = *(void *)(*(void *)(a1 + 40) + 8);
  id v9 = *(void **)(v8 + 40);
  *(void *)(v8 + 40) = v5;
  id v10 = v5;

  uint64_t v11 = *(void *)(*(void *)(a1 + 48) + 8);
  int v12 = *(void **)(v11 + 40);
  *(void *)(v11 + 40) = v6;
  id v13 = v6;

  dispatch_group_leave(*(dispatch_group_t *)(a1 + 32));
}

- (void)prewarmFromCacheWithCallbackQueue:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  uint64_t v8 = [(FCSubscriptionController *)self cachedSubscribedTags];
  if (![v8 count])
  {
    if (self) {
      subscriptionList = self->_subscriptionList;
    }
    else {
      subscriptionList = 0;
    }
    uint64_t v11 = subscriptionList;
    int v12 = [(FCSubscriptionList *)v11 subscribedTagIDs];
    id v13 = [v12 allObjects];
    int v14 = +[FCCachePolicy cachedOnlyCachePolicy];
    v16[0] = MEMORY[0x1E4F143A8];
    v16[1] = 3221225472;
    v16[2] = __73__FCSubscriptionController_prewarmFromCacheWithCallbackQueue_completion___block_invoke_2;
    v16[3] = &unk_1E5B50FA8;
    id v9 = &v18;
    id v18 = v7;
    id v15 = v6;

    long long v17 = v15;
    -[FCSubscriptionController _fetchTagsForIDs:cachePolicy:qualityOfService:completion:]((uint64_t)self, v13, v14, 25, v16);

    goto LABEL_7;
  }
  if (v7)
  {
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __73__FCSubscriptionController_prewarmFromCacheWithCallbackQueue_completion___block_invoke;
    block[3] = &unk_1E5B4CA88;
    id v9 = &v20;
    id v20 = v7;
    dispatch_async(v6, block);
LABEL_7:
  }
}

uint64_t __73__FCSubscriptionController_prewarmFromCacheWithCallbackQueue_completion___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

void __73__FCSubscriptionController_prewarmFromCacheWithCallbackQueue_completion___block_invoke_2(uint64_t a1)
{
  uint64_t v1 = *(void **)(a1 + 40);
  if (v1)
  {
    id v2 = *(NSObject **)(a1 + 32);
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __73__FCSubscriptionController_prewarmFromCacheWithCallbackQueue_completion___block_invoke_3;
    block[3] = &unk_1E5B4CA88;
    id v4 = v1;
    dispatch_async(v2, block);
  }
}

uint64_t __73__FCSubscriptionController_prewarmFromCacheWithCallbackQueue_completion___block_invoke_3(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

uint64_t __88__FCSubscriptionController_fetchSubscribedTagsWithCallbackQueue_preferCache_completion___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void, void, void))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40), *(void *)(a1 + 32), 0);
}

- (id)newlySubscribedTagIDsInDateRange:(id)a3
{
  uint64_t v29 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v5 = [MEMORY[0x1E4F1CA48] array];
  if (self) {
    subscriptionList = self->_subscriptionList;
  }
  else {
    subscriptionList = 0;
  }
  id v7 = [(FCSubscriptionList *)subscriptionList subscriptionsBySubscriptionID];
  uint64_t v8 = [v7 allValues];
  id v9 = [MEMORY[0x1E4F28F60] predicateWithBlock:&__block_literal_global_404];
  id v10 = [v8 filteredArrayUsingPredicate:v9];

  if ([v10 count])
  {
    __int16 v23 = v10;
    uint64_t v11 = [v10 sortedArrayUsingComparator:&__block_literal_global_407];
    long long v24 = 0u;
    long long v25 = 0u;
    long long v26 = 0u;
    long long v27 = 0u;
    uint64_t v12 = [v11 countByEnumeratingWithState:&v24 objects:v28 count:16];
    if (v12)
    {
      uint64_t v13 = v12;
      uint64_t v14 = *(void *)v25;
      do
      {
        for (uint64_t i = 0; i != v13; ++i)
        {
          if (*(void *)v25 != v14) {
            objc_enumerationMutation(v11);
          }
          uint64_t v16 = *(void **)(*((void *)&v24 + 1) + 8 * i);
          uint64_t v17 = [v16 tagID];
          if (v17)
          {
            id v18 = (void *)v17;
            uint64_t v19 = [v16 dateAdded];
            int v20 = [v4 containsDate:v19];

            if (v20)
            {
              unsigned int v21 = [v16 tagID];
              [v5 addObject:v21];
            }
          }
        }
        uint64_t v13 = [v11 countByEnumeratingWithState:&v24 objects:v28 count:16];
      }
      while (v13);
    }

    id v10 = v23;
  }

  return v5;
}

uint64_t __61__FCSubscriptionController_newlySubscribedTagIDsInDateRange___block_invoke(uint64_t a1, void *a2)
{
  return [a2 isTypeTag];
}

uint64_t __61__FCSubscriptionController_newlySubscribedTagIDsInDateRange___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v4 = a2;
  id v5 = [a3 dateAdded];
  id v6 = [v4 dateAdded];

  uint64_t v7 = [v5 compare:v6];
  return v7;
}

- (BOOL)moveSubscriptionForTagID:(id)a3 beforeTagID:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  [MEMORY[0x1E4F29060] isMainThread];
  BOOL v8 = 0;
  if (v6 && v7)
  {
    if (self) {
      subscriptionList = self->_subscriptionList;
    }
    else {
      subscriptionList = 0;
    }
    id v10 = subscriptionList;
    uint64_t v11 = [(FCSubscriptionList *)v10 orderedSubscribedTagIDs];
    uint64_t v12 = [v11 indexOfObject:v7];

    BOOL v8 = v12 != 0x7FFFFFFFFFFFFFFFLL
      && [(FCSubscriptionList *)v10 moveSubscriptionForTagID:v6 toIndex:v12];
  }
  return v8;
}

- (void)reorderSubscriptionOrderForOrderedIdentifiers:(id)a3
{
  id v4 = (void *)MEMORY[0x1E4F29060];
  id v6 = a3;
  [v4 isMainThread];
  if (self) {
    subscriptionList = self->_subscriptionList;
  }
  else {
    subscriptionList = 0;
  }
  [(FCSubscriptionList *)subscriptionList reorderSubscriptionOrderForOrderedIdentifiers:v6];
}

- (BOOL)hasAutoFavoriteSubscriptionForTagID:(id)a3
{
  if (self) {
    self = (FCSubscriptionController *)self->_subscriptionList;
  }
  return [(FCSubscriptionController *)self hasAutoFavoriteSubscriptionForTagID:a3];
}

- (BOOL)hasMutedSubscriptionForTagID:(id)a3
{
  if (self) {
    self = (FCSubscriptionController *)self->_subscriptionList;
  }
  return [(FCSubscriptionController *)self hasMutedSubscriptionForTagID:a3];
}

- (BOOL)addMutedSubscriptionForTagID:(id)a3
{
  return [(FCSubscriptionController *)self addMutedSubscriptionForTagID:a3 groupID:@"tag"];
}

- (BOOL)addMutedSubscriptionForTagID:(id)a3 groupID:(id)a4
{
  uint64_t v27 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  if (self) {
    subscriptionList = self->_subscriptionList;
  }
  else {
    subscriptionList = 0;
  }
  id v9 = subscriptionList;
  if ([(FCSubscriptionController *)self hasSubscriptionToTagID:v6])
  {
    if (self) {
      tagController = self->_tagController;
    }
    else {
      tagController = 0;
    }
    uint64_t v11 = [(FCTagController *)tagController expectedFastCachedTagForID:v6];
    [(FCSubscriptionController *)self removeSubscriptionToTag:v11];
  }
  if ([(FCSubscriptionController *)self hasAutoFavoriteSubscriptionForTagID:v6])
  {
    if (self) {
      uint64_t v12 = self->_tagController;
    }
    else {
      uint64_t v12 = 0;
    }
    id v13 = [(FCTagController *)v12 expectedFastCachedTagForID:v6];
    if (self)
    {
      [MEMORY[0x1E4F29060] isMainThread];
      if (!v13 && os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
      {
        id v18 = objc_msgSend([NSString alloc], "initWithFormat:", @"Invalid parameter not satisfying %s", "tag != nil");
        *(_DWORD *)buf = 136315906;
        int v20 = "-[FCSubscriptionController removeAutoFavoriteSubscriptionToTag:]";
        __int16 v21 = 2080;
        uint64_t v22 = "FCSubscriptionController.m";
        __int16 v23 = 1024;
        int v24 = 477;
        __int16 v25 = 2114;
        long long v26 = v18;
        _os_log_error_impl(&dword_1A460D000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", buf, 0x26u);
      }
      uint64_t v14 = self->_subscriptionList;
      id v15 = [v13 identifier];
      [(FCSubscriptionList *)v14 removeSubscriptionForTagID:v15 type:3];
    }
  }
  BOOL v16 = [(FCSubscriptionList *)v9 addSubscriptionForTagID:v6 type:2 origin:0 groupID:v7];

  return v16;
}

- (BOOL)hasIgnoredSubscriptionForTagID:(id)a3
{
  if (self) {
    self = (FCSubscriptionController *)self->_subscriptionList;
  }
  return [(FCSubscriptionController *)self hasIgnoredSubscriptionForTagID:a3];
}

- (BOOL)addIgnoredSubscriptionForTagID:(id)a3
{
  return [(FCSubscriptionController *)self addIgnoredSubscriptionForTagID:a3 groupID:@"tag"];
}

- (BOOL)addIgnoredSubscriptionForTagID:(id)a3 groupID:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if ([(FCSubscriptionController *)self hasMutedSubscriptionForTagID:v6])
  {
    BOOL v8 = 0;
  }
  else
  {
    if ([(FCSubscriptionController *)self hasSubscriptionToTagID:v6])
    {
      if (self) {
        tagController = self->_tagController;
      }
      else {
        tagController = 0;
      }
      id v10 = [(FCTagController *)tagController expectedFastCachedTagForID:v6];
      [(FCSubscriptionController *)self removeSubscriptionToTag:v10];
    }
    if (self) {
      subscriptionList = self->_subscriptionList;
    }
    else {
      subscriptionList = 0;
    }
    BOOL v8 = [(FCSubscriptionList *)subscriptionList addSubscriptionForTagID:v6 type:5 origin:0 groupID:v7];
  }

  return v8;
}

- (BOOL)removeIgnoredSubscriptionForTagID:(id)a3
{
  return [(FCSubscriptionController *)self removeIgnoredSubscriptionForTagID:a3 groupID:@"tag"];
}

- (BOOL)removeIgnoredSubscriptionForTagID:(id)a3 groupID:(id)a4
{
  id v5 = a3;
  BOOL v6 = [(FCSubscriptionController *)self hasIgnoredSubscriptionForTagID:v5];
  if (v6)
  {
    if (self) {
      subscriptionList = self->_subscriptionList;
    }
    else {
      subscriptionList = 0;
    }
    [(FCSubscriptionList *)subscriptionList removeSubscriptionForTagID:v5 type:5];
  }

  return v6;
}

- (void)removeAllAutoFavoriteSubscriptions:(id)a3
{
  id v4 = a3;
  id v5 = (void *)MEMORY[0x1E4F1CAD0];
  BOOL v6 = [(FCSubscriptionController *)self autoFavoriteTagIDs];
  id v7 = [v5 setWithArray:v6];
  BOOL v8 = v7;
  if (v7)
  {
    id v9 = v7;
  }
  else
  {
    id v9 = [MEMORY[0x1E4F1CAD0] set];
  }
  id v10 = v9;

  uint64_t v11 = (void *)MEMORY[0x1E4F1CAD0];
  uint64_t v12 = [(FCSubscriptionController *)self groupableTagIDs];
  id v13 = [v11 setWithArray:v12];
  uint64_t v14 = v13;
  if (v13)
  {
    id v15 = v13;
  }
  else
  {
    id v15 = [MEMORY[0x1E4F1CAD0] set];
  }
  BOOL v16 = v15;

  if (self) {
    subscriptionList = self->_subscriptionList;
  }
  else {
    subscriptionList = 0;
  }
  id v18 = subscriptionList;
  uint64_t v19 = [v10 setByAddingObjectsFromSet:v16];
  id v23 = v4;
  v24[0] = MEMORY[0x1E4F143A8];
  v24[1] = 3221225472;
  v24[2] = __63__FCSubscriptionController_removeAllAutoFavoriteSubscriptions___block_invoke;
  v24[3] = &unk_1E5B51010;
  id v25 = v10;
  v22[0] = MEMORY[0x1E4F143A8];
  v22[1] = 3221225472;
  v22[2] = __63__FCSubscriptionController_removeAllAutoFavoriteSubscriptions___block_invoke_2;
  v22[3] = &unk_1E5B51038;
  id v20 = v4;
  id v21 = v10;
  [(FCSubscriptionList *)v18 removeSubscriptionsForTagIDs:v19 typeProvider:v24 completion:v22];
}

uint64_t __63__FCSubscriptionController_removeAllAutoFavoriteSubscriptions___block_invoke(uint64_t a1, uint64_t a2)
{
  if ([*(id *)(a1 + 32) containsObject:a2]) {
    return 3;
  }
  else {
    return 4;
  }
}

uint64_t __63__FCSubscriptionController_removeAllAutoFavoriteSubscriptions___block_invoke_2(uint64_t a1)
{
  uint64_t result = *(void *)(a1 + 32);
  if (result) {
    return (*(uint64_t (**)(void))(result + 16))();
  }
  return result;
}

- (void)addAutoFavoriteSubscriptionForTagIDs:(id)a3 groupableSubscriptionForTagIDs:(id)a4 originProvider:(id)a5 completion:(id)a6
{
  uint64_t v78 = *MEMORY[0x1E4F143B8];
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  id v39 = a6;
  [MEMORY[0x1E4F29060] isMainThread];
  id v13 = objc_opt_new();
  uint64_t v14 = (void *)MEMORY[0x1E4F1CAD0];
  v73[0] = MEMORY[0x1E4F143A8];
  v73[1] = 3221225472;
  v73[2] = __122__FCSubscriptionController_addAutoFavoriteSubscriptionForTagIDs_groupableSubscriptionForTagIDs_originProvider_completion___block_invoke;
  v73[3] = &unk_1E5B4CD98;
  id v15 = v10;
  id v74 = v15;
  id v16 = v11;
  id v75 = v16;
  uint64_t v40 = objc_msgSend(v14, "fc_set:", v73);
  v68[0] = MEMORY[0x1E4F143A8];
  v68[1] = 3221225472;
  v68[2] = __122__FCSubscriptionController_addAutoFavoriteSubscriptionForTagIDs_groupableSubscriptionForTagIDs_originProvider_completion___block_invoke_2;
  v68[3] = &unk_1E5B51060;
  v68[4] = self;
  id v45 = v13;
  id v69 = v45;
  id v41 = v16;
  id v70 = v41;
  id v42 = v15;
  id v71 = v42;
  id v38 = v12;
  id v72 = v38;
  uint64_t v17 = objc_msgSend(v40, "fc_setByTransformingWithBlock:", v68);
  id v18 = [(FCSubscriptionController *)self subscriptionsWithType:3];
  unsigned int v44 = objc_msgSend(v18, "fc_setByTransformingWithBlock:", &__block_literal_global_419);

  uint64_t v19 = [(FCSubscriptionController *)self subscriptionsWithType:4];
  id v43 = objc_msgSend(v19, "fc_setByTransformingWithBlock:", &__block_literal_global_422);

  id v20 = objc_msgSend(v44, "fc_setByMinusingSet:", v42);
  id v21 = objc_msgSend(v43, "fc_setByMinusingSet:", v41);
  uint64_t v22 = [v20 setByAddingObjectsFromSet:v21];

  id v23 = FCProgressivePersonalizationLog;
  if (os_log_type_enabled((os_log_t)FCProgressivePersonalizationLog, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 138412290;
    long long v77 = v17;
    _os_log_impl(&dword_1A460D000, v23, OS_LOG_TYPE_DEBUG, "Subscribing to new tag IDs : %@", buf, 0xCu);
    id v23 = FCProgressivePersonalizationLog;
  }
  if (os_log_type_enabled(v23, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 138412290;
    long long v77 = v22;
    _os_log_impl(&dword_1A460D000, v23, OS_LOG_TYPE_DEBUG, "Unsubscribing from existing tag IDs : %@", buf, 0xCu);
  }
  int v24 = dispatch_group_create();
  if ([v22 count])
  {
    dispatch_group_enter(v24);
    if (self) {
      subscriptionList = self->_subscriptionList;
    }
    else {
      subscriptionList = 0;
    }
    v65[0] = MEMORY[0x1E4F143A8];
    v65[1] = 3221225472;
    v65[2] = __122__FCSubscriptionController_addAutoFavoriteSubscriptionForTagIDs_groupableSubscriptionForTagIDs_originProvider_completion___block_invoke_423;
    v65[3] = &unk_1E5B51088;
    id v66 = v44;
    id v67 = v43;
    v62[0] = MEMORY[0x1E4F143A8];
    v62[1] = 3221225472;
    v62[2] = __122__FCSubscriptionController_addAutoFavoriteSubscriptionForTagIDs_groupableSubscriptionForTagIDs_originProvider_completion___block_invoke_427;
    v62[3] = &unk_1E5B510B0;
    id v63 = v45;
    id v64 = v24;
    [(FCSubscriptionList *)subscriptionList removeSubscriptionsForTagIDs:v22 typeProvider:v65 completion:v62];
  }
  if ([v17 count])
  {
    dispatch_group_enter(v24);
    objc_initWeak((id *)buf, self);
    if (self) {
      long long v26 = self->_subscriptionList;
    }
    else {
      long long v26 = 0;
    }
    uint64_t v27 = v26;
    v59[0] = MEMORY[0x1E4F143A8];
    v59[1] = 3221225472;
    v59[2] = __122__FCSubscriptionController_addAutoFavoriteSubscriptionForTagIDs_groupableSubscriptionForTagIDs_originProvider_completion___block_invoke_2_428;
    v59[3] = &unk_1E5B51088;
    id v60 = v42;
    id v61 = v41;
    v55[0] = MEMORY[0x1E4F143A8];
    v55[1] = 3221225472;
    v55[2] = __122__FCSubscriptionController_addAutoFavoriteSubscriptionForTagIDs_groupableSubscriptionForTagIDs_originProvider_completion___block_invoke_429;
    v55[3] = &unk_1E5B51100;
    objc_copyWeak(&v58, (id *)buf);
    id v56 = v45;
    __int16 v57 = v24;
    [(FCSubscriptionList *)v27 addSubscriptionsForTagIDs:v17 typeProvider:v59 originProvider:v38 completion:v55];

    objc_destroyWeak(&v58);
    objc_destroyWeak((id *)buf);
  }
  if (FCDispatchGroupIsEmpty(v24))
  {
    v50[1] = MEMORY[0x1E4F143A8];
    v50[2] = 3221225472;
    v50[3] = __122__FCSubscriptionController_addAutoFavoriteSubscriptionForTagIDs_groupableSubscriptionForTagIDs_originProvider_completion___block_invoke_3;
    v50[4] = &unk_1E5B4F0D0;
    id v28 = (id *)&v54;
    uint64_t v29 = (void (**)(id, id, id, id))v39;
    long long v54 = v29;
    uint64_t v30 = &v51;
    id v31 = v45;
    id v32 = &v52;
    id v51 = v31;
    long long v52 = v17;
    uint64_t v33 = &v53;
    long long v53 = v22;
    id v34 = v22;
    id v35 = v17;
    if (v29) {
      v29[2](v29, v31, v35, v34);
    }
  }
  else
  {
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __122__FCSubscriptionController_addAutoFavoriteSubscriptionForTagIDs_groupableSubscriptionForTagIDs_originProvider_completion___block_invoke_4;
    block[3] = &unk_1E5B4F0D0;
    id v28 = (id *)v50;
    v50[0] = v39;
    uint64_t v30 = &v47;
    id v32 = &v48;
    id v47 = v45;
    id v48 = v17;
    uint64_t v33 = &v49;
    __int16 v49 = v22;
    id v36 = v22;
    id v37 = v17;
    dispatch_group_notify(v24, MEMORY[0x1E4F14428], block);
  }
}

void __122__FCSubscriptionController_addAutoFavoriteSubscriptionForTagIDs_groupableSubscriptionForTagIDs_originProvider_completion___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v3 = *(void *)(a1 + 32);
  id v4 = a2;
  objc_msgSend(v4, "fc_safelyUnionSet:", v3);
  objc_msgSend(v4, "fc_safelyUnionSet:", *(void *)(a1 + 40));
}

id __122__FCSubscriptionController_addAutoFavoriteSubscriptionForTagIDs_groupableSubscriptionForTagIDs_originProvider_completion___block_invoke_2(uint64_t a1, void *a2)
{
  uint64_t v26 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  id v4 = [*(id *)(a1 + 32) subscriptionForTagID:v3];
  id v5 = [*(id *)(a1 + 32) mutedTagIDs];
  int v6 = [v5 containsObject:v3];

  if (v6)
  {
    [*(id *)(a1 + 40) addObject:v3];
LABEL_10:
    id v8 = 0;
    goto LABEL_21;
  }
  if (v4)
  {
    if ([v4 subscriptionType] != 3
      || [v4 subscriptionType] == 4 && (objc_msgSend(*(id *)(a1 + 48), "containsObject:", v3) & 1) != 0)
    {
      goto LABEL_10;
    }
    if ([v4 subscriptionType] == 3
      && [*(id *)(a1 + 56) containsObject:v3])
    {
      uint64_t v7 = [v4 subscriptionOrigin];
      if (v7 == (*(uint64_t (**)(void))(*(void *)(a1 + 64) + 16))()) {
        goto LABEL_10;
      }
LABEL_16:
      id v11 = *(void **)(a1 + 32);
      id v12 = v3;
      uint64_t v13 = 3;
      goto LABEL_17;
    }
  }
  if ([*(id *)(a1 + 56) containsObject:v3])
  {
    id v9 = [*(id *)(a1 + 32) groupableTagIDs];
    int v10 = [v9 containsObject:v3];

    if (v10)
    {
      id v11 = *(void **)(a1 + 32);
      id v12 = v3;
      uint64_t v13 = 4;
LABEL_17:
      [v11 removeSubscriptionForTagID:v12 type:v13];
    }
  }
  else
  {
    if (![*(id *)(a1 + 48) containsObject:v3])
    {
      if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
      {
        uint64_t v17 = (void *)[[NSString alloc] initWithFormat:@"Unknown tag ID %@, not present in autoFavoriteTagIDs or groupableFavoriteTagIDs", v3];
        *(_DWORD *)buf = 136315906;
        uint64_t v19 = "-[FCSubscriptionController addAutoFavoriteSubscriptionForTagIDs:groupableSubscriptionForTagIDs:originProvi"
              "der:completion:]_block_invoke_2";
        __int16 v20 = 2080;
        id v21 = "FCSubscriptionController.m";
        __int16 v22 = 1024;
        int v23 = 1054;
        __int16 v24 = 2114;
        id v25 = v17;
        _os_log_error_impl(&dword_1A460D000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", buf, 0x26u);
      }
      goto LABEL_20;
    }
    uint64_t v14 = [*(id *)(a1 + 32) autoFavoriteTagIDs];
    int v15 = [v14 containsObject:v3];

    if (v15) {
      goto LABEL_16;
    }
  }
LABEL_20:
  id v8 = v3;
LABEL_21:

  return v8;
}

uint64_t __122__FCSubscriptionController_addAutoFavoriteSubscriptionForTagIDs_groupableSubscriptionForTagIDs_originProvider_completion___block_invoke_417(uint64_t a1, void *a2)
{
  return [a2 tagID];
}

uint64_t __122__FCSubscriptionController_addAutoFavoriteSubscriptionForTagIDs_groupableSubscriptionForTagIDs_originProvider_completion___block_invoke_2_420(uint64_t a1, void *a2)
{
  return [a2 tagID];
}

uint64_t __122__FCSubscriptionController_addAutoFavoriteSubscriptionForTagIDs_groupableSubscriptionForTagIDs_originProvider_completion___block_invoke_423(uint64_t a1, void *a2)
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  if ([*(id *)(a1 + 32) containsObject:v3])
  {
LABEL_6:
    uint64_t v4 = 3;
    goto LABEL_7;
  }
  if (([*(id *)(a1 + 40) containsObject:v3] & 1) == 0)
  {
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
    {
      int v6 = (void *)[[NSString alloc] initWithFormat:@"Didn't find tag ID in either existing auto favorites or groupable favorites"];
      int v7 = 136315906;
      id v8 = "-[FCSubscriptionController addAutoFavoriteSubscriptionForTagIDs:groupableSubscriptionForTagIDs:originProvider"
           ":completion:]_block_invoke";
      __int16 v9 = 2080;
      int v10 = "FCSubscriptionController.m";
      __int16 v11 = 1024;
      int v12 = 1090;
      __int16 v13 = 2114;
      uint64_t v14 = v6;
      _os_log_error_impl(&dword_1A460D000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", (uint8_t *)&v7, 0x26u);
    }
    goto LABEL_6;
  }
  uint64_t v4 = 4;
LABEL_7:

  return v4;
}

void __122__FCSubscriptionController_addAutoFavoriteSubscriptionForTagIDs_groupableSubscriptionForTagIDs_originProvider_completion___block_invoke_427(uint64_t a1, void *a2)
{
  id v3 = *(void **)(a1 + 32);
  uint64_t v4 = [a2 allObjects];
  [v3 addObjectsFromArray:v4];

  id v5 = *(NSObject **)(a1 + 40);
  dispatch_group_leave(v5);
}

uint64_t __122__FCSubscriptionController_addAutoFavoriteSubscriptionForTagIDs_groupableSubscriptionForTagIDs_originProvider_completion___block_invoke_2_428(uint64_t a1, void *a2)
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  if ([*(id *)(a1 + 32) containsObject:v3])
  {
LABEL_6:
    uint64_t v4 = 3;
    goto LABEL_7;
  }
  if (([*(id *)(a1 + 40) containsObject:v3] & 1) == 0)
  {
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
    {
      int v6 = (void *)[[NSString alloc] initWithFormat:@"Unknown tag ID %@, not present in autoFavoriteTagIDs or groupableFavoriteTagIDs", v3];
      *(_DWORD *)buf = 136315906;
      id v8 = "-[FCSubscriptionController addAutoFavoriteSubscriptionForTagIDs:groupableSubscriptionForTagIDs:originProvider"
           ":completion:]_block_invoke_2";
      __int16 v9 = 2080;
      int v10 = "FCSubscriptionController.m";
      __int16 v11 = 1024;
      int v12 = 1116;
      __int16 v13 = 2114;
      uint64_t v14 = v6;
      _os_log_error_impl(&dword_1A460D000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", buf, 0x26u);
    }
    goto LABEL_6;
  }
  uint64_t v4 = 4;
LABEL_7:

  return v4;
}

void __122__FCSubscriptionController_addAutoFavoriteSubscriptionForTagIDs_groupableSubscriptionForTagIDs_originProvider_completion___block_invoke_429(uint64_t a1, void *a2)
{
  id v3 = a2;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __122__FCSubscriptionController_addAutoFavoriteSubscriptionForTagIDs_groupableSubscriptionForTagIDs_originProvider_completion___block_invoke_2_430;
  v6[3] = &unk_1E5B510D8;
  id v7 = *(id *)(a1 + 32);
  id v8 = v3;
  id v5 = v3;
  FCPerformIfNonNil(WeakRetained, v6);

  dispatch_group_leave(*(dispatch_group_t *)(a1 + 40));
}

void __122__FCSubscriptionController_addAutoFavoriteSubscriptionForTagIDs_groupableSubscriptionForTagIDs_originProvider_completion___block_invoke_2_430(uint64_t a1)
{
  uint64_t v1 = *(void **)(a1 + 32);
  id v2 = [*(id *)(a1 + 40) allObjects];
  [v1 addObjectsFromArray:v2];
}

uint64_t __122__FCSubscriptionController_addAutoFavoriteSubscriptionForTagIDs_groupableSubscriptionForTagIDs_originProvider_completion___block_invoke_3(void *a1)
{
  uint64_t result = a1[7];
  if (result) {
    return (*(uint64_t (**)(uint64_t, void, void, void))(result + 16))(result, a1[4], a1[5], a1[6]);
  }
  return result;
}

uint64_t __122__FCSubscriptionController_addAutoFavoriteSubscriptionForTagIDs_groupableSubscriptionForTagIDs_originProvider_completion___block_invoke_4(void *a1)
{
  uint64_t result = a1[7];
  if (result) {
    return (*(uint64_t (**)(uint64_t, void, void, void))(result + 16))(result, a1[4], a1[5], a1[6]);
  }
  return result;
}

- (void)subscriptionList:(id)a3 didAddSubscriptions:(id)a4 changeSubscriptions:(id)a5 moveSubscriptions:(id)a6 removeSubscriptions:(id)a7
{
  id v11 = a6;
  id v12 = a7;
  id v13 = a5;
  uint64_t v14 = objc_msgSend(a4, "fc_dictionaryOfSortedSetsWithKeyBlock:", &__block_literal_global_436);
  uint64_t v15 = objc_msgSend(v13, "fc_dictionaryOfSortedSetsWithKeyBlock:", &__block_literal_global_439);

  id v16 = objc_msgSend(v12, "fc_dictionaryOfSortedSetsWithKeyBlock:", &__block_literal_global_441);

  id v17 = v11;
  id v18 = [v14 objectForKeyedSubscript:&unk_1EF8D7A88];
  uint64_t v19 = [v15 objectForKeyedSubscript:&unk_1EF8D7A88];
  __int16 v20 = [v16 objectForKeyedSubscript:&unk_1EF8D7A88];
  id v21 = v18;
  id v22 = v19;
  id v44 = v17;
  id v23 = v20;
  __int16 v24 = v23;
  if (self)
  {
    uint64_t v76 = 0;
    long long v77 = &v76;
    uint64_t v78 = 0x3032000000;
    long long v79 = __Block_byref_object_copy__24;
    long long v80 = __Block_byref_object_dispose__24;
    id v81 = 0;
    if ([v23 count])
    {
      id v25 = [v24 allObjects];
      uint64_t v26 = objc_msgSend(v25, "fc_arrayByTransformingWithBlock:", &__block_literal_global_465);

      uint64_t v27 = self->_subscribedTagsByTagID;
      v73[0] = MEMORY[0x1E4F143A8];
      v73[1] = 3221225472;
      v73[2] = __127__FCSubscriptionController__handleTagSubscriptionsAdded_tagSubscriptionsChanged_tagSubscriptionsMoved_tagSubscriptionsRemoved___block_invoke_2;
      v73[3] = &unk_1E5B511E8;
      id v75 = &v76;
      id v28 = v26;
      id v74 = v28;
      [(FCThreadSafeMutableDictionary *)v27 readWriteWithAccessor:v73];
    }
    uint64_t v67 = 0;
    v68 = &v67;
    uint64_t v69 = 0x3032000000;
    id v70 = __Block_byref_object_copy__24;
    id v71 = __Block_byref_object_dispose__24;
    id v72 = 0;
    if ([v22 count])
    {
      uint64_t v29 = [v22 allObjects];
      uint64_t v30 = objc_msgSend(v29, "fc_arrayByTransformingWithBlock:", &__block_literal_global_467);

      id v31 = self->_subscribedTagsByTagID;
      v64[0] = MEMORY[0x1E4F143A8];
      v64[1] = 3221225472;
      v64[2] = __127__FCSubscriptionController__handleTagSubscriptionsAdded_tagSubscriptionsChanged_tagSubscriptionsMoved_tagSubscriptionsRemoved___block_invoke_4;
      v64[3] = &unk_1E5B511E8;
      id v66 = &v67;
      id v32 = v30;
      id v65 = v32;
      [(FCThreadSafeMutableDictionary *)v31 readWriteWithAccessor:v64];
    }
    uint64_t v58 = 0;
    v59 = &v58;
    uint64_t v60 = 0x3032000000;
    id v61 = __Block_byref_object_copy__24;
    v62 = __Block_byref_object_dispose__24;
    id v63 = 0;
    if ([v21 count])
    {
      uint64_t v33 = [v21 allObjects];
      id v34 = objc_msgSend(v33, "fc_arrayByTransformingWithBlock:", &__block_literal_global_469);

      id v35 = self->_tagController;
      id v36 = [(FCTagController *)v35 fastCachedTagsForIDs:v34];

      id v37 = self->_subscribedTagsByTagID;
      v54[0] = MEMORY[0x1E4F143A8];
      v54[1] = 3221225472;
      v54[2] = __127__FCSubscriptionController__handleTagSubscriptionsAdded_tagSubscriptionsChanged_tagSubscriptionsMoved_tagSubscriptionsRemoved___block_invoke_6;
      v54[3] = &unk_1E5B51238;
      __int16 v57 = &v58;
      id v38 = v34;
      id v55 = v38;
      id v39 = v36;
      id v56 = v39;
      [(FCThreadSafeMutableDictionary *)v37 readWriteWithAccessor:v54];
    }
    uint64_t v48 = 0;
    __int16 v49 = &v48;
    uint64_t v50 = 0x3032000000;
    id v51 = __Block_byref_object_copy__24;
    long long v52 = __Block_byref_object_dispose__24;
    id v53 = 0;
    if ([v44 count])
    {
      uint64_t v40 = [v44 allObjects];
      id v41 = objc_msgSend(v40, "fc_arrayByTransformingWithBlock:", &__block_literal_global_472);

      id v42 = self->_subscribedTagsByTagID;
      v45[0] = MEMORY[0x1E4F143A8];
      v45[1] = 3221225472;
      v45[2] = __127__FCSubscriptionController__handleTagSubscriptionsAdded_tagSubscriptionsChanged_tagSubscriptionsMoved_tagSubscriptionsRemoved___block_invoke_9;
      v45[3] = &unk_1E5B51260;
      id v47 = &v48;
      id v43 = v41;
      id v46 = v43;
      [(FCThreadSafeMutableDictionary *)v42 readWithAccessor:v45];
    }
    if ([(id)v59[5] count]
      || [(id)v68[5] count]
      || [(id)v49[5] count]
      || [(id)v77[5] count])
    {
      -[FCSubscriptionController _notifyOfTagsAdded:tagsChanged:tagsMoved:tagsRemoved:subscriptionType:]((uint64_t)self, (void *)v59[5], (void *)v68[5], (void *)v49[5], (void *)v77[5], 0);
    }
    -[FCSubscriptionController _fetchMissingTagsWithCompletion:]((uint64_t)self, 0);
    _Block_object_dispose(&v48, 8);

    _Block_object_dispose(&v58, 8);
    _Block_object_dispose(&v67, 8);

    _Block_object_dispose(&v76, 8);
  }

  -[FCSubscriptionController _handleNonTagSubscriptionType:addedSubscriptionsByType:removedSubscriptionsByType:changedSubscriptionsByType:]((uint64_t)self, 2, v14, v16, v15);
  -[FCSubscriptionController _handleNonTagSubscriptionType:addedSubscriptionsByType:removedSubscriptionsByType:changedSubscriptionsByType:]((uint64_t)self, 3, v14, v16, v15);
  -[FCSubscriptionController _handleNonTagSubscriptionType:addedSubscriptionsByType:removedSubscriptionsByType:changedSubscriptionsByType:]((uint64_t)self, 4, v14, v16, v15);
  -[FCSubscriptionController _handleNonTagSubscriptionType:addedSubscriptionsByType:removedSubscriptionsByType:changedSubscriptionsByType:]((uint64_t)self, 5, v14, v16, v15);
}

uint64_t __123__FCSubscriptionController_subscriptionList_didAddSubscriptions_changeSubscriptions_moveSubscriptions_removeSubscriptions___block_invoke(uint64_t a1, void *a2)
{
  id v2 = NSNumber;
  uint64_t v3 = [a2 subscriptionType];
  return [v2 numberWithUnsignedInteger:v3];
}

uint64_t __123__FCSubscriptionController_subscriptionList_didAddSubscriptions_changeSubscriptions_moveSubscriptions_removeSubscriptions___block_invoke_2(uint64_t a1, void *a2)
{
  id v2 = NSNumber;
  uint64_t v3 = [a2 subscriptionType];
  return [v2 numberWithUnsignedInteger:v3];
}

uint64_t __123__FCSubscriptionController_subscriptionList_didAddSubscriptions_changeSubscriptions_moveSubscriptions_removeSubscriptions___block_invoke_3(uint64_t a1, void *a2)
{
  id v2 = NSNumber;
  uint64_t v3 = [a2 subscriptionType];
  return [v2 numberWithUnsignedInteger:v3];
}

- (void)_handleNonTagSubscriptionType:(void *)a3 addedSubscriptionsByType:(void *)a4 removedSubscriptionsByType:(void *)a5 changedSubscriptionsByType:
{
  uint64_t v61 = *MEMORY[0x1E4F143B8];
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  uint64_t v44 = a1;
  if (a1)
  {
    if (a2 == 3)
    {
      id v12 = [v10 objectForKeyedSubscript:&unk_1EF8D7AA0];
      if ([v12 count] == 1)
      {
        id v13 = [v9 objectForKeyedSubscript:&unk_1EF8D7A88];
        uint64_t v14 = [v13 count];

        if (v14 == 1)
        {
          objc_opt_class();
          uint64_t v15 = [v10 allValues];
          id v16 = [v15 firstObject];
          id v17 = [v16 anyObject];
          if (v17)
          {
            if (objc_opt_isKindOfClass()) {
              id v18 = v17;
            }
            else {
              id v18 = 0;
            }
          }
          else
          {
            id v18 = 0;
          }
          id v19 = v18;

          if (!v19 && os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
          {
            id v41 = objc_msgSend([NSString alloc], "initWithFormat:", @"invalid nil value for '%s'", "removedSubscription");
            *(_DWORD *)buf = 136315906;
            long long v54 = "-[FCSubscriptionController _handleNonTagSubscriptionType:addedSubscriptionsByType:removedSubscriptions"
                  "ByType:changedSubscriptionsByType:]";
            __int16 v55 = 2080;
            id v56 = "FCSubscriptionController.m";
            __int16 v57 = 1024;
            int v58 = 1728;
            __int16 v59 = 2114;
            uint64_t v60 = v41;
            _os_log_error_impl(&dword_1A460D000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", buf, 0x26u);
          }
          objc_opt_class();
          __int16 v20 = [v9 allValues];
          id v21 = [v20 firstObject];
          id v22 = [v21 anyObject];
          if (v22)
          {
            if (objc_opt_isKindOfClass()) {
              id v23 = v22;
            }
            else {
              id v23 = 0;
            }
          }
          else
          {
            id v23 = 0;
          }
          id v24 = v23;

          if (!v24 && os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
          {
            id v42 = objc_msgSend([NSString alloc], "initWithFormat:", @"invalid nil value for '%s'", "addedSubscription");
            *(_DWORD *)buf = 136315906;
            long long v54 = "-[FCSubscriptionController _handleNonTagSubscriptionType:addedSubscriptionsByType:removedSubscriptions"
                  "ByType:changedSubscriptionsByType:]";
            __int16 v55 = 2080;
            id v56 = "FCSubscriptionController.m";
            __int16 v57 = 1024;
            int v58 = 1730;
            __int16 v59 = 2114;
            uint64_t v60 = v42;
            _os_log_error_impl(&dword_1A460D000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", buf, 0x26u);
          }
        }
      }
      else
      {
      }
    }
    id v25 = [MEMORY[0x1E4F1CA80] set];
    uint64_t v26 = [NSNumber numberWithUnsignedInteger:a2];
    id v45 = v10;
    uint64_t v27 = [v10 objectForKeyedSubscript:v26];

    id v28 = [NSNumber numberWithUnsignedInteger:a2];
    id v46 = v9;
    uint64_t v29 = [v9 objectForKeyedSubscript:v28];

    uint64_t v30 = [NSNumber numberWithUnsignedInteger:a2];
    id v31 = [v11 objectForKeyedSubscript:v30];

    if ([v27 count])
    {
      id v32 = objc_msgSend(v27, "fc_setByTransformingWithBlock:", &__block_literal_global_483);
      uint64_t v33 = [v32 allObjects];
      [v25 addObjectsFromArray:v33];
    }
    else
    {
      id v32 = 0;
    }
    if ([v29 count])
    {
      id v34 = objc_msgSend(v29, "fc_setByTransformingWithBlock:", &__block_literal_global_485);
      id v35 = [v34 allObjects];
      [v25 addObjectsFromArray:v35];
    }
    else
    {
      id v34 = 0;
    }
    if ([v31 count])
    {
      id v36 = objc_msgSend(v31, "fc_setByTransformingWithBlock:", &__block_literal_global_487);
      id v37 = [v36 allObjects];
      [v25 addObjectsFromArray:v37];
    }
    else
    {
      id v36 = 0;
    }
    if ([v25 count])
    {
      id v38 = *(id *)(v44 + 24);
      [v25 allObjects];
      id v43 = v31;
      v40 = id v39 = v32;
      v47[0] = MEMORY[0x1E4F143A8];
      v47[1] = 3221225472;
      v47[2] = __137__FCSubscriptionController__handleNonTagSubscriptionType_addedSubscriptionsByType_removedSubscriptionsByType_changedSubscriptionsByType___block_invoke_4;
      v47[3] = &unk_1E5B512B0;
      id v48 = v34;
      id v49 = v36;
      id v50 = v39;
      uint64_t v51 = v44;
      uint64_t v52 = a2;
      [v38 fetchTagsForTagIDs:v40 maximumCachedAge:17 qualityOfService:v47 completionHandler:1.79769313e308];

      id v32 = v39;
      id v31 = v43;
    }
    id v10 = v45;
    id v9 = v46;
  }
}

- (void)subscriptionListDidResetToEmpty:(id)a3
{
  uint64_t v3 = self;
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  if (self) {
    self = (FCSubscriptionController *)self->_observers;
  }
  uint64_t v4 = (void *)[(FCSubscriptionController *)self copy];
  uint64_t v5 = [v4 countByEnumeratingWithState:&v10 objects:v14 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v11;
    do
    {
      for (uint64_t i = 0; i != v6; ++i)
      {
        if (*(void *)v11 != v7) {
          objc_enumerationMutation(v4);
        }
        id v9 = *(void **)(*((void *)&v10 + 1) + 8 * i);
        if (objc_opt_respondsToSelector()) {
          [v9 subscriptionControllerDidResetToEmpty:v3];
        }
      }
      uint64_t v6 = [v4 countByEnumeratingWithState:&v10 objects:v14 count:16];
    }
    while (v6);
  }
}

- (void)subscriptionListWillStartSyncingRemoteChanges:(id)a3
{
  uint64_t v3 = self;
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  if (self) {
    self = (FCSubscriptionController *)self->_observers;
  }
  uint64_t v4 = (void *)[(FCSubscriptionController *)self copy];
  uint64_t v5 = [v4 countByEnumeratingWithState:&v10 objects:v14 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v11;
    do
    {
      for (uint64_t i = 0; i != v6; ++i)
      {
        if (*(void *)v11 != v7) {
          objc_enumerationMutation(v4);
        }
        id v9 = *(void **)(*((void *)&v10 + 1) + 8 * i);
        if (objc_opt_respondsToSelector()) {
          [v9 subscriptionControllerWillStartSyncingRemoteChanges:v3];
        }
      }
      uint64_t v6 = [v4 countByEnumeratingWithState:&v10 objects:v14 count:16];
    }
    while (v6);
  }
}

- (void)subscriptionListDidStopSyncingRemoteChanges:(id)a3
{
  uint64_t v3 = self;
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  if (self) {
    self = (FCSubscriptionController *)self->_observers;
  }
  uint64_t v4 = (void *)[(FCSubscriptionController *)self copy];
  uint64_t v5 = [v4 countByEnumeratingWithState:&v10 objects:v14 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v11;
    do
    {
      for (uint64_t i = 0; i != v6; ++i)
      {
        if (*(void *)v11 != v7) {
          objc_enumerationMutation(v4);
        }
        id v9 = *(void **)(*((void *)&v10 + 1) + 8 * i);
        if (objc_opt_respondsToSelector()) {
          [v9 subscriptionControllerDidStopSyncingRemoteChanges:v3];
        }
      }
      uint64_t v6 = [v4 countByEnumeratingWithState:&v10 objects:v14 count:16];
    }
    while (v6);
  }
}

- (void)activityObservingApplicationDidEnterBackground
{
  if (self)
  {
    [MEMORY[0x1E4F29060] isMainThread];
    uint64_t v3 = [MEMORY[0x1E4F1CB18] standardUserDefaults];
    uint64_t v4 = [v3 objectForKey:@"FCSubscriptionControllerNotificationChannelsLastUpdateDateKey"];
    uint64_t v5 = [MEMORY[0x1E4F1C9C8] date];
    if (v4)
    {
      uint64_t v6 = [MEMORY[0x1E4F1CB18] standardUserDefaults];
      uint64_t v7 = [v6 integerForKey:@"notification_channels_refresh_frequency"];

      if (v7 == -1)
      {
        id v8 = [(FCCoreConfigurationManager *)self->_configurationManager configuration];
        uint64_t v7 = [v8 notificationEnabledChannelsRefreshFrequency];
      }
      id v9 = [v4 dateByAddingTimeInterval:(double)v7];
      int v10 = objc_msgSend(v5, "fc_isLaterThan:", v9);

      if (v10)
      {
        objc_initWeak(&location, self);
        long long v11 = self->_subscriptionList;
        blocuint64_t k = MEMORY[0x1E4F143A8];
        uint64_t v15 = 3221225472;
        id v16 = __61__FCSubscriptionController__refreshNotificationRegistrations__block_invoke;
        id v17 = &unk_1E5B51170;
        objc_copyWeak(&v19, &location);
        id v18 = self;
        [(FCPrivateDataController *)v11 forceSyncWithCompletion:&block];

        long long v12 = self->_notificationController;
        [(FCNotificationController *)v12 refreshNotificationsFromAppleNews];

        [v3 setObject:v5 forKey:@"FCSubscriptionControllerNotificationChannelsLastUpdateDateKey"];
        objc_destroyWeak(&v19);
        objc_destroyWeak(&location);
      }
    }
    else
    {
      [v3 setObject:v5 forKey:@"FCSubscriptionControllerNotificationChannelsLastUpdateDateKey"];
    }

    if (NFInternalBuild())
    {
      long long v13 = FCPersistenceQueue();
      blocuint64_t k = MEMORY[0x1E4F143A8];
      uint64_t v15 = 3221225472;
      id v16 = __54__FCSubscriptionController__saveReadableSubscriptions__block_invoke;
      id v17 = &unk_1E5B4C018;
      id v18 = self;
      dispatch_async(v13, &block);
    }
  }
  else
  {
    NFInternalBuild();
  }
}

- (void)_purchaseListDidAddTagIDs:(id)a3
{
  uint64_t v4 = (void *)MEMORY[0x1E4F29060];
  id v5 = a3;
  [v4 isMainThread];
  uint64_t v6 = [v5 userInfo];

  id v7 = [v6 objectForKey:FCPurchaseAddedTagIDsKey];

  -[FCSubscriptionController _updateNotificationsForPurchaseTagIDs:isPaid:]((id *)&self->super.isa, v7, 1);
}

- (void)_updateNotificationsForPurchaseTagIDs:(uint64_t)a3 isPaid:
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  uint64_t v6 = v5;
  if (a1 && v5)
  {
    id v7 = [a1 subscriptions];
    long long v16 = 0u;
    long long v17 = 0u;
    long long v18 = 0u;
    long long v19 = 0u;
    uint64_t v8 = [v7 countByEnumeratingWithState:&v16 objects:v20 count:16];
    if (!v8) {
      goto LABEL_15;
    }
    uint64_t v9 = v8;
    uint64_t v10 = *(void *)v17;
    while (1)
    {
      for (uint64_t i = 0; i != v9; ++i)
      {
        if (*(void *)v17 != v10) {
          objc_enumerationMutation(v7);
        }
        long long v12 = *(void **)(*((void *)&v16 + 1) + 8 * i);
        long long v13 = [v12 tagID];
        if ([v6 containsObject:v13] && !objc_msgSend(v12, "subscriptionType"))
        {
          int v14 = [v12 notificationsEnabled];

          if (!v14) {
            continue;
          }
          id v15 = a1[7];
          long long v13 = [v12 tagID];
          [v15 registerNotificationsForChannelID:v13 isPaid:a3];
        }
      }
      uint64_t v9 = [v7 countByEnumeratingWithState:&v16 objects:v20 count:16];
      if (!v9)
      {
LABEL_15:

        break;
      }
    }
  }
}

- (void)_purchaseListDidRemoveTagIDs:(id)a3
{
  uint64_t v4 = (void *)MEMORY[0x1E4F29060];
  id v5 = a3;
  [v4 isMainThread];
  uint64_t v6 = [v5 userInfo];

  id v7 = [v6 objectForKey:FCPurchaseRemovedTagIDsKey];

  -[FCSubscriptionController _updateNotificationsForPurchaseTagIDs:isPaid:]((id *)&self->super.isa, v7, 0);
}

void __61__FCSubscriptionController__refreshNotificationRegistrations__block_invoke(uint64_t a1, uint64_t a2)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __61__FCSubscriptionController__refreshNotificationRegistrations__block_invoke_2;
  v5[3] = &unk_1E5B51148;
  void v5[4] = *(void *)(a1 + 32);
  void v5[5] = a2;
  FCPerformIfNonNil(WeakRetained, v5);
}

void __61__FCSubscriptionController__refreshNotificationRegistrations__block_invoke_2(uint64_t a1, void *a2)
{
  uint64_t v33 = *MEMORY[0x1E4F143B8];
  uint64_t v3 = a2;
  uint64_t v4 = v3;
  if (*(void *)(a1 + 40) != 2)
  {
    if (v3) {
      id v5 = (void *)v3[8];
    }
    else {
      id v5 = 0;
    }
    uint64_t v6 = [v5 purchasedTagIDs];
    id v7 = (void *)[v6 copy];

    uint64_t v8 = [v4 subscriptions];
    uint64_t v9 = [MEMORY[0x1E4F1CA80] set];
    uint64_t v10 = [MEMORY[0x1E4F1CA80] set];
    long long v28 = 0u;
    long long v29 = 0u;
    long long v30 = 0u;
    long long v31 = 0u;
    id v11 = v8;
    uint64_t v12 = [v11 countByEnumeratingWithState:&v28 objects:v32 count:16];
    if (v12)
    {
      uint64_t v13 = v12;
      uint64_t v14 = *(void *)v29;
      do
      {
        for (uint64_t i = 0; i != v13; ++i)
        {
          if (*(void *)v29 != v14) {
            objc_enumerationMutation(v11);
          }
          long long v16 = *(void **)(*((void *)&v28 + 1) + 8 * i);
          if (!objc_msgSend(v16, "subscriptionType", (void)v28)
            && [v16 notificationsEnabled])
          {
            long long v17 = [v16 tagID];
            if ([v7 containsObject:v17]) {
              long long v18 = v10;
            }
            else {
              long long v18 = v9;
            }
            [v18 addObject:v17];
          }
        }
        uint64_t v13 = [v11 countByEnumeratingWithState:&v28 objects:v32 count:16];
      }
      while (v13);
    }

    uint64_t v19 = *(void *)(a1 + 32);
    id v20 = v9;
    if (v19)
    {
      uint64_t v21 = [*(id *)(v19 + 72) configuration];
      id v22 = [v21 puzzlesConfig];
      id v23 = [v22 puzzleHubTagID];

      if ([v23 length] && objc_msgSend(*(id *)(v19 + 88), "puzzleNotificationsEnabled")) {
        [v20 addObject:v23];
      }
    }
    if (v4) {
      id v24 = (void *)v4[7];
    }
    else {
      id v24 = 0;
    }
    id v25 = v24;
    uint64_t v26 = [v20 allObjects];
    uint64_t v27 = [v10 allObjects];
    [v25 refreshNotificationsForChannelIDs:v26 paidChannelIDs:v27];
  }
}

void __43__FCSubscriptionController__integrateTags___block_invoke(id *a1, void *a2)
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  long long v17 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  id v4 = a1[4];
  uint64_t v5 = [v4 countByEnumeratingWithState:&v17 objects:v21 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v18;
    uint64_t v8 = a1 + 6;
    uint64_t v9 = a1 + 5;
    do
    {
      for (uint64_t i = 0; i != v6; ++i)
      {
        if (*(void *)v18 != v7) {
          objc_enumerationMutation(v4);
        }
        id v11 = *(void **)(*((void *)&v17 + 1) + 8 * i);
        uint64_t v12 = objc_msgSend(v11, "identifier", (void)v17);
        uint64_t v13 = [v3 objectForKeyedSubscript:v12];
        uint64_t v14 = v13;
        id v15 = v9;
        if (!v13 || (v16 = [v13 isEqualToTag:v11], id v15 = v8, (v16 & 1) == 0)) {
          [*v15 addObject:v11];
        }
        [v3 setObject:v11 forKeyedSubscript:v12];
      }
      uint64_t v6 = [v4 countByEnumeratingWithState:&v17 objects:v21 count:16];
    }
    while (v6);
  }
}

- (void)_notifyOfTagsAdded:(void *)a3 tagsChanged:(void *)a4 tagsMoved:(void *)a5 tagsRemoved:(uint64_t)a6 subscriptionType:
{
  uint64_t v26 = *MEMORY[0x1E4F143B8];
  id v20 = a2;
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  if (a1)
  {
    [MEMORY[0x1E4F29060] isMainThread];
    long long v21 = 0u;
    long long v22 = 0u;
    long long v23 = 0u;
    long long v24 = 0u;
    uint64_t v13 = (void *)[*(id *)(a1 + 48) copy];
    uint64_t v14 = [v13 countByEnumeratingWithState:&v21 objects:v25 count:16];
    if (v14)
    {
      uint64_t v15 = v14;
      uint64_t v16 = *(void *)v22;
      do
      {
        uint64_t v17 = 0;
        do
        {
          if (*(void *)v22 != v16) {
            objc_enumerationMutation(v13);
          }
          long long v18 = *(void **)(*((void *)&v21 + 1) + 8 * v17);
          if (objc_opt_respondsToSelector()) {
            [v18 subscriptionController:a1 didAddTags:v20 changeTags:v10 moveTags:v11 removeTags:v12 subscriptionType:a6];
          }
          ++v17;
        }
        while (v15 != v17);
        uint64_t v15 = [v13 countByEnumeratingWithState:&v21 objects:v25 count:16];
      }
      while (v15);
    }
  }
}

void __85__FCSubscriptionController__fetchTagsForIDs_cachePolicy_qualityOfService_completion___block_invoke(uint64_t a1, void *a2)
{
  id v5 = a2;
  BOOL v3 = +[FCPuzzleType isPuzzleTypeIdentifier:v5];
  uint64_t v4 = 40;
  if (v3) {
    uint64_t v4 = 32;
  }
  [*(id *)(a1 + v4) addObject:v5];
}

void __85__FCSubscriptionController__fetchTagsForIDs_cachePolicy_qualityOfService_completion___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  uint64_t v7 = *(void *)(*(void *)(a1 + 40) + 8);
  uint64_t v8 = *(void **)(v7 + 40);
  *(void *)(v7 + 40) = v5;
  id v12 = v5;

  uint64_t v9 = *(void *)(*(void *)(a1 + 48) + 8);
  id v10 = *(void **)(v9 + 40);
  *(void *)(v9 + 40) = v6;
  id v11 = v6;

  dispatch_group_leave(*(dispatch_group_t *)(a1 + 32));
}

void __85__FCSubscriptionController__fetchTagsForIDs_cachePolicy_qualityOfService_completion___block_invoke_3(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  uint64_t v7 = *(void *)(*(void *)(a1 + 40) + 8);
  uint64_t v8 = *(void **)(v7 + 40);
  *(void *)(v7 + 40) = v5;
  id v12 = v5;

  uint64_t v9 = *(void *)(*(void *)(a1 + 48) + 8);
  id v10 = *(void **)(v9 + 40);
  *(void *)(v9 + 40) = v6;
  id v11 = v6;

  dispatch_group_leave(*(dispatch_group_t *)(a1 + 32));
}

void __85__FCSubscriptionController__fetchTagsForIDs_cachePolicy_qualityOfService_completion___block_invoke_4(uint64_t a1)
{
  v3[0] = MEMORY[0x1E4F143A8];
  v3[1] = 3221225472;
  v3[2] = __85__FCSubscriptionController__fetchTagsForIDs_cachePolicy_qualityOfService_completion___block_invoke_5;
  v3[3] = &unk_1E5B511C0;
  v3[4] = *(void *)(a1 + 32);
  long long v5 = *(_OWORD *)(a1 + 56);
  uint64_t v6 = *(void *)(a1 + 72);
  long long v2 = *(_OWORD *)(a1 + 40);
  id v1 = (id)v2;
  long long v4 = v2;
  FCPerformBlockOnMainThread(v3);
}

void __85__FCSubscriptionController__fetchTagsForIDs_cachePolicy_qualityOfService_completion___block_invoke_5(uint64_t a1)
{
  uint64_t v70 = *MEMORY[0x1E4F143B8];
  long long v2 = *(void **)(*(void *)(*(void *)(a1 + 48) + 8) + 40);
  if (v2)
  {
    id v3 = v2;
  }
  else
  {
    id v3 = *(id *)(*(void *)(*(void *)(a1 + 56) + 8) + 40);
    if (!v3) {
      goto LABEL_6;
    }
  }
  long long v4 = FCDefaultLog;
  if (os_log_type_enabled((os_log_t)FCDefaultLog, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 138543362;
    id v69 = v3;
    _os_log_error_impl(&dword_1A460D000, v4, OS_LOG_TYPE_ERROR, "failed to fetch some tags for subscription IDs with error: %{public}@", buf, 0xCu);
  }
LABEL_6:
  long long v5 = *(void **)(a1 + 32);
  uint64_t v52 = v3;
  if (v5) {
    long long v5 = (void *)v5[2];
  }
  uint64_t v6 = v5;
  v64[0] = MEMORY[0x1E4F143A8];
  v64[1] = 3221225472;
  v64[2] = __85__FCSubscriptionController__fetchTagsForIDs_cachePolicy_qualityOfService_completion___block_invoke_451;
  v64[3] = &unk_1E5B50F80;
  long long v65 = *(_OWORD *)(a1 + 64);
  uint64_t v7 = objc_msgSend(MEMORY[0x1E4F1C9E8], "fc_dictionary:", v64);
  uint64_t v8 = [v6 subscribedTagIDs];
  uint64_t v9 = [v8 allObjects];
  uint64_t v51 = v7;
  id v10 = objc_msgSend(v7, "nf_objectsForKeysWithoutMarker:", v9);

  id v47 = objc_msgSend(v10, "fc_arrayOfObjectsPassingTest:", &__block_literal_global_455);
  id v11 = objc_msgSend(v10, "fc_arrayByRemovingObjectsPassingTest:", &__block_literal_global_458);
  id v12 = (void *)MEMORY[0x1E4F1CAD0];
  uint64_t v13 = *(void **)(a1 + 32);
  if (v13) {
    uint64_t v13 = (void *)v13[10];
  }
  uint64_t v14 = v13;
  uint64_t v15 = [v14 possiblyUnfetchedAppConfiguration];
  uint64_t v16 = [v15 deprecatedSportsTopicTagIds];
  uint64_t v17 = (void *)v16;
  if (v16) {
    uint64_t v18 = v16;
  }
  else {
    uint64_t v18 = MEMORY[0x1E4F1CBF0];
  }
  long long v19 = [v12 setWithArray:v18];

  v62[0] = MEMORY[0x1E4F143A8];
  v62[1] = 3221225472;
  v62[2] = __85__FCSubscriptionController__fetchTagsForIDs_cachePolicy_qualityOfService_completion___block_invoke_4_459;
  v62[3] = &unk_1E5B4EE98;
  id v48 = v19;
  id v63 = v48;
  id v50 = v10;
  id v20 = objc_msgSend(v10, "fc_arrayOfObjectsPassingTest:", v62);
  id v49 = v11;
  -[FCSubscriptionController _integrateTags:](*(void *)(a1 + 32), v11);
  long long v60 = 0u;
  long long v61 = 0u;
  long long v58 = 0u;
  long long v59 = 0u;
  id obj = v20;
  uint64_t v21 = [obj countByEnumeratingWithState:&v58 objects:v67 count:16];
  if (v21)
  {
    uint64_t v22 = v21;
    uint64_t v23 = *(void *)v59;
    do
    {
      for (uint64_t i = 0; i != v22; ++i)
      {
        if (*(void *)v59 != v23) {
          objc_enumerationMutation(obj);
        }
        id v25 = *(void **)(*((void *)&v58 + 1) + 8 * i);
        uint64_t v26 = [v25 replacementID];
        uint64_t v27 = [v26 length];
        long long v28 = [v25 identifier];
        int v29 = [v6 hasNotificationsEnabledForTagID:v28];

        long long v30 = [v25 identifier];
        [v6 removeSubscriptionForTagID:v30 type:0];

        if (v27)
        {
          [v6 addSubscriptionForTagID:v26 type:0];
          if (v29)
          {
            long long v31 = *(void **)(a1 + 32);
            id v32 = [v25 identifier];
            [v31 setNotificationsEnabled:0 forTagID:v32 error:0];

            [*(id *)(a1 + 32) setNotificationsEnabled:1 forTagID:v26 error:0];
          }
        }
        else if (v29)
        {
          uint64_t v33 = *(void **)(a1 + 32);
          id v34 = [v25 identifier];
          [v33 setNotificationsEnabled:0 forTagID:v34 error:0];
        }
      }
      uint64_t v22 = [obj countByEnumeratingWithState:&v58 objects:v67 count:16];
    }
    while (v22);
  }

  long long v56 = 0u;
  long long v57 = 0u;
  long long v54 = 0u;
  long long v55 = 0u;
  id v35 = v47;
  uint64_t v36 = [v35 countByEnumeratingWithState:&v54 objects:v66 count:16];
  if (v36)
  {
    uint64_t v37 = v36;
    uint64_t v38 = *(void *)v55;
    do
    {
      for (uint64_t j = 0; j != v37; ++j)
      {
        if (*(void *)v55 != v38) {
          objc_enumerationMutation(v35);
        }
        uint64_t v40 = *(void **)(*((void *)&v54 + 1) + 8 * j);
        id v41 = [v40 identifier];
        int v42 = [v6 hasNotificationsEnabledForTagID:v41];

        id v43 = [v40 identifier];
        [v6 removeSubscriptionForTagID:v43 type:0];

        if (v42)
        {
          uint64_t v44 = *(void **)(a1 + 32);
          id v45 = [v40 identifier];
          [v44 setNotificationsEnabled:0 forTagID:v45 error:0];
        }
      }
      uint64_t v37 = [v35 countByEnumeratingWithState:&v54 objects:v66 count:16];
    }
    while (v37);
  }

  uint64_t v46 = *(void *)(a1 + 40);
  if (v46) {
    (*(void (**)(uint64_t, void *))(v46 + 16))(v46, v51);
  }
}

void __85__FCSubscriptionController__fetchTagsForIDs_cachePolicy_qualityOfService_completion___block_invoke_451(uint64_t a1, void *a2)
{
  uint64_t v3 = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 40);
  id v4 = a2;
  [v4 addEntriesFromDictionary:v3];
  [v4 addEntriesFromDictionary:*(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 40)];
}

uint64_t __85__FCSubscriptionController__fetchTagsForIDs_cachePolicy_qualityOfService_completion___block_invoke_2_452(uint64_t a1, void *a2)
{
  return [a2 isSubscribable] ^ 1;
}

uint64_t __85__FCSubscriptionController__fetchTagsForIDs_cachePolicy_qualityOfService_completion___block_invoke_3_456(uint64_t a1, void *a2)
{
  return [a2 isSubscribable] ^ 1;
}

uint64_t __85__FCSubscriptionController__fetchTagsForIDs_cachePolicy_qualityOfService_completion___block_invoke_4_459(uint64_t a1, void *a2)
{
  id v3 = a2;
  if ([v3 isDeprecated])
  {
    uint64_t v4 = 1;
  }
  else
  {
    long long v5 = *(void **)(a1 + 32);
    uint64_t v6 = [v3 identifier];
    uint64_t v4 = [v5 containsObject:v6];
  }
  return v4;
}

uint64_t __127__FCSubscriptionController__handleTagSubscriptionsAdded_tagSubscriptionsChanged_tagSubscriptionsMoved_tagSubscriptionsRemoved___block_invoke(uint64_t a1, void *a2)
{
  return [a2 tagID];
}

void __127__FCSubscriptionController__handleTagSubscriptionsAdded_tagSubscriptionsChanged_tagSubscriptionsMoved_tagSubscriptionsRemoved___block_invoke_2(uint64_t a1, void *a2)
{
  id v3 = (void *)MEMORY[0x1E4F1CAD0];
  uint64_t v4 = *(void *)(a1 + 32);
  id v9 = a2;
  long long v5 = objc_msgSend(v9, "nf_objectsForKeysWithoutMarker:", v4);
  uint64_t v6 = [v3 setWithArray:v5];
  uint64_t v7 = *(void *)(*(void *)(a1 + 40) + 8);
  uint64_t v8 = *(void **)(v7 + 40);
  *(void *)(v7 + 40) = v6;

  [v9 removeObjectsForKeys:*(void *)(a1 + 32)];
}

uint64_t __127__FCSubscriptionController__handleTagSubscriptionsAdded_tagSubscriptionsChanged_tagSubscriptionsMoved_tagSubscriptionsRemoved___block_invoke_3(uint64_t a1, void *a2)
{
  return [a2 tagID];
}

void __127__FCSubscriptionController__handleTagSubscriptionsAdded_tagSubscriptionsChanged_tagSubscriptionsMoved_tagSubscriptionsRemoved___block_invoke_4(uint64_t a1, void *a2)
{
  id v3 = (void *)MEMORY[0x1E4F1CAD0];
  objc_msgSend(a2, "nf_objectsForKeysWithoutMarker:", *(void *)(a1 + 32));
  id v7 = (id)objc_claimAutoreleasedReturnValue();
  uint64_t v4 = [v3 setWithArray:v7];
  uint64_t v5 = *(void *)(*(void *)(a1 + 40) + 8);
  uint64_t v6 = *(void **)(v5 + 40);
  *(void *)(v5 + 40) = v4;
}

uint64_t __127__FCSubscriptionController__handleTagSubscriptionsAdded_tagSubscriptionsChanged_tagSubscriptionsMoved_tagSubscriptionsRemoved___block_invoke_5(uint64_t a1, void *a2)
{
  return [a2 tagID];
}

void __127__FCSubscriptionController__handleTagSubscriptionsAdded_tagSubscriptionsChanged_tagSubscriptionsMoved_tagSubscriptionsRemoved___block_invoke_6(uint64_t a1, void *a2)
{
  id v3 = a2;
  uint64_t v9 = MEMORY[0x1E4F143A8];
  uint64_t v10 = 3221225472;
  id v11 = __127__FCSubscriptionController__handleTagSubscriptionsAdded_tagSubscriptionsChanged_tagSubscriptionsMoved_tagSubscriptionsRemoved___block_invoke_7;
  id v12 = &unk_1E5B51210;
  id v13 = v3;
  uint64_t v4 = *(void **)(a1 + 32);
  id v14 = *(id *)(a1 + 40);
  id v5 = v3;
  uint64_t v6 = objc_msgSend(v4, "fc_setByTransformingWithBlock:", &v9);
  uint64_t v7 = *(void *)(*(void *)(a1 + 48) + 8);
  uint64_t v8 = *(void **)(v7 + 40);
  *(void *)(v7 + 40) = v6;

  objc_msgSend(v5, "addEntriesFromDictionary:", *(void *)(a1 + 40), v9, v10, v11, v12);
}

id __127__FCSubscriptionController__handleTagSubscriptionsAdded_tagSubscriptionsChanged_tagSubscriptionsMoved_tagSubscriptionsRemoved___block_invoke_7(uint64_t a1, void *a2)
{
  id v3 = a2;
  uint64_t v4 = [*(id *)(a1 + 32) objectForKeyedSubscript:v3];
  if (v4)
  {
    id v5 = 0;
  }
  else
  {
    id v5 = [*(id *)(a1 + 40) objectForKeyedSubscript:v3];
  }

  return v5;
}

uint64_t __127__FCSubscriptionController__handleTagSubscriptionsAdded_tagSubscriptionsChanged_tagSubscriptionsMoved_tagSubscriptionsRemoved___block_invoke_8(uint64_t a1, void *a2)
{
  return [a2 tagID];
}

void __127__FCSubscriptionController__handleTagSubscriptionsAdded_tagSubscriptionsChanged_tagSubscriptionsMoved_tagSubscriptionsRemoved___block_invoke_9(uint64_t a1, void *a2)
{
  id v3 = (void *)MEMORY[0x1E4F1CAD0];
  objc_msgSend(a2, "nf_objectsForKeysWithoutMarker:", *(void *)(a1 + 32));
  id v7 = (id)objc_claimAutoreleasedReturnValue();
  uint64_t v4 = [v3 setWithArray:v7];
  uint64_t v5 = *(void *)(*(void *)(a1 + 40) + 8);
  uint64_t v6 = *(void **)(v5 + 40);
  *(void *)(v5 + 40) = v4;
}

uint64_t __137__FCSubscriptionController__handleNonTagSubscriptionType_addedSubscriptionsByType_removedSubscriptionsByType_changedSubscriptionsByType___block_invoke(uint64_t a1, void *a2)
{
  return [a2 tagID];
}

uint64_t __137__FCSubscriptionController__handleNonTagSubscriptionType_addedSubscriptionsByType_removedSubscriptionsByType_changedSubscriptionsByType___block_invoke_2(uint64_t a1, void *a2)
{
  return [a2 tagID];
}

uint64_t __137__FCSubscriptionController__handleNonTagSubscriptionType_addedSubscriptionsByType_removedSubscriptionsByType_changedSubscriptionsByType___block_invoke_3(uint64_t a1, void *a2)
{
  return [a2 tagID];
}

void __137__FCSubscriptionController__handleNonTagSubscriptionType_addedSubscriptionsByType_removedSubscriptionsByType_changedSubscriptionsByType___block_invoke_4(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  v12[0] = MEMORY[0x1E4F143A8];
  v12[1] = 3221225472;
  v12[2] = __137__FCSubscriptionController__handleNonTagSubscriptionType_addedSubscriptionsByType_removedSubscriptionsByType_changedSubscriptionsByType___block_invoke_5;
  v12[3] = &unk_1E5B51288;
  id v13 = v6;
  id v14 = v5;
  id v15 = *(id *)(a1 + 32);
  id v16 = *(id *)(a1 + 40);
  id v7 = *(id *)(a1 + 48);
  uint64_t v8 = *(void *)(a1 + 56);
  uint64_t v9 = *(void *)(a1 + 64);
  id v17 = v7;
  uint64_t v18 = v8;
  uint64_t v19 = v9;
  id v10 = v5;
  id v11 = v6;
  FCPerformBlockOnMainThread(v12);
}

void __137__FCSubscriptionController__handleNonTagSubscriptionType_addedSubscriptionsByType_removedSubscriptionsByType_changedSubscriptionsByType___block_invoke_5(uint64_t a1)
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  uint64_t v2 = *(void *)(a1 + 32);
  if (v2)
  {
    id v3 = FCDefaultLog;
    if (os_log_type_enabled((os_log_t)FCDefaultLog, OS_LOG_TYPE_ERROR))
    {
      int v19 = 138543362;
      uint64_t v20 = v2;
      _os_log_error_impl(&dword_1A460D000, v3, OS_LOG_TYPE_ERROR, "failed to fetch some tags for muted subscription IDs with error: %{public}@", (uint8_t *)&v19, 0xCu);
    }
  }
  uint64_t v4 = (void *)MEMORY[0x1E4F1CAD0];
  id v5 = *(void **)(a1 + 40);
  id v6 = [*(id *)(a1 + 48) allObjects];
  id v7 = objc_msgSend(v5, "nf_objectsForKeysWithoutMarker:", v6);
  uint64_t v8 = [v4 setWithArray:v7];

  uint64_t v9 = (void *)MEMORY[0x1E4F1CAD0];
  id v10 = *(void **)(a1 + 40);
  id v11 = [*(id *)(a1 + 56) allObjects];
  id v12 = objc_msgSend(v10, "nf_objectsForKeysWithoutMarker:", v11);
  id v13 = [v9 setWithArray:v12];

  id v14 = (void *)MEMORY[0x1E4F1CAD0];
  id v15 = *(void **)(a1 + 40);
  id v16 = [*(id *)(a1 + 64) allObjects];
  id v17 = objc_msgSend(v15, "nf_objectsForKeysWithoutMarker:", v16);
  uint64_t v18 = [v14 setWithArray:v17];

  if ([v8 count] || objc_msgSend(v13, "count") || objc_msgSend(v18, "count")) {
    -[FCSubscriptionController _notifyOfTagsAdded:tagsChanged:tagsMoved:tagsRemoved:subscriptionType:](*(void *)(a1 + 72), v8, v13, 0, v18, *(void *)(a1 + 80));
  }
}

void __54__FCSubscriptionController__saveReadableSubscriptions__block_invoke(uint64_t a1)
{
  uint64_t v48 = *MEMORY[0x1E4F143B8];
  v40[0] = @"subscribed";
  uint64_t v41 = [*(id *)(a1 + 32) subscribedTagIDs];
  v40[1] = @"muted";
  uint64_t v42 = [*(id *)(a1 + 32) mutedTagIDs];
  v40[2] = @"autofavorited";
  uint64_t v2 = [*(id *)(a1 + 32) autoFavoriteTagIDs];
  id v43 = v2;
  v40[3] = @"ignored";
  id v3 = [*(id *)(a1 + 32) ignoredTagIDs];
  uint64_t v44 = v3;
  v40[4] = @"groupable";
  uint64_t v4 = [*(id *)(a1 + 32) groupableTagIDs];
  id v45 = v4;
  void v40[5] = @"purchased";
  id v5 = *(void **)(a1 + 32);
  id v32 = (void *)v42;
  uint64_t v33 = (void *)v41;
  if (v5) {
    id v5 = (void *)v5[8];
  }
  id v6 = v5;
  id v7 = [v6 purchasedTagIDs];
  uint64_t v8 = [v7 allObjects];
  uint64_t v46 = v8;
  v40[6] = @"lastUpdated";
  uint64_t v9 = NSString;
  id v10 = [MEMORY[0x1E4F1C9C8] date];
  [v10 timeIntervalSince1970];
  id v12 = objc_msgSend(v9, "stringWithFormat:", @"%f", v11);
  id v47 = v12;
  id v13 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v41 forKeys:v40 count:7];

  id v37 = 0;
  id v14 = [MEMORY[0x1E4F28D90] dataWithJSONObject:v13 options:1 error:&v37];
  id v15 = v37;
  id v16 = v15;
  if (v14)
  {
    id v17 = (void *)MEMORY[0x1E4F1CB10];
    uint64_t v18 = *(void *)(a1 + 32);
    if (v18) {
      int v19 = *(void **)(v18 + 16);
    }
    else {
      int v19 = 0;
    }
    uint64_t v20 = [v19 localStore];
    uint64_t v21 = [v20 storeDirectory];
    uint64_t v22 = [v17 fileURLWithPath:v21];
    uint64_t v23 = [v22 URLByAppendingPathComponent:@"subscriptions"];
    long long v24 = [v23 URLByAppendingPathExtension:@"json"];

    if (v24)
    {
      id v25 = [v24 path];
      id v34 = v16;
      int v26 = [v14 writeToFile:v25 options:1 error:&v34];
      id v27 = v34;

      long long v28 = FCPersonalizationLog;
      if (v26)
      {
        if (os_log_type_enabled((os_log_t)FCPersonalizationLog, OS_LOG_TYPE_DEBUG))
        {
          int v29 = v28;
          long long v30 = [v24 path];
          *(_DWORD *)buf = 138412290;
          id v39 = v30;
          _os_log_debug_impl(&dword_1A460D000, v29, OS_LOG_TYPE_DEBUG, "Successfully saved readable subscriptions at %@.", buf, 0xCu);
        }
      }
      else if (os_log_type_enabled((os_log_t)FCPersonalizationLog, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138412290;
        id v39 = v27;
        _os_log_error_impl(&dword_1A460D000, v28, OS_LOG_TYPE_ERROR, "Error when saving readable subscriptions: %@", buf, 0xCu);
      }
      id v16 = v27;
    }
    else
    {
      long long v31 = FCPersonalizationLog;
      if (os_log_type_enabled((os_log_t)FCPersonalizationLog, OS_LOG_TYPE_ERROR))
      {
        *(_WORD *)buf = 0;
        _os_log_error_impl(&dword_1A460D000, v31, OS_LOG_TYPE_ERROR, "Failed to construct file URL for saving readable subscriptions", buf, 2u);
      }
      long long v24 = 0;
    }
  }
  else
  {
    v35[0] = MEMORY[0x1E4F143A8];
    v35[1] = 3221225472;
    v35[2] = __54__FCSubscriptionController__saveReadableSubscriptions__block_invoke_2;
    v35[3] = &unk_1E5B4C018;
    id v16 = v15;
    id v36 = v16;
    __54__FCSubscriptionController__saveReadableSubscriptions__block_invoke_2((uint64_t)v35);
    long long v24 = v36;
  }
}

void __54__FCSubscriptionController__saveReadableSubscriptions__block_invoke_2(uint64_t a1)
{
  uint64_t v6 = *MEMORY[0x1E4F143B8];
  uint64_t v2 = FCPersonalizationLog;
  if (os_log_type_enabled((os_log_t)FCPersonalizationLog, OS_LOG_TYPE_ERROR))
  {
    uint64_t v3 = *(void *)(a1 + 32);
    int v4 = 138412290;
    uint64_t v5 = v3;
    _os_log_error_impl(&dword_1A460D000, v2, OS_LOG_TYPE_ERROR, "Error when saving readable subscriptions: %@", (uint8_t *)&v4, 0xCu);
  }
}

- (FCLocalChannelsProvider)localChannelsProvider
{
  return self->_localChannelsProvider;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_userInfo, 0);
  objc_storeStrong((id *)&self->_appConfigurationManager, 0);
  objc_storeStrong((id *)&self->_configurationManager, 0);
  objc_storeStrong((id *)&self->_purchaseProvider, 0);
  objc_storeStrong((id *)&self->_notificationController, 0);
  objc_storeStrong((id *)&self->_observers, 0);
  objc_storeStrong((id *)&self->_subscribedTagsByTagID, 0);
  objc_storeStrong((id *)&self->_puzzleTypeController, 0);
  objc_storeStrong((id *)&self->_tagController, 0);
  objc_storeStrong((id *)&self->_subscriptionList, 0);
  objc_storeStrong((id *)&self->_localChannelsProvider, 0);
}

@end