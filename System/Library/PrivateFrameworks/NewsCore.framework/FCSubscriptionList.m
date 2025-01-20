@interface FCSubscriptionList
+ (BOOL)requiresBatchedSync;
+ (BOOL)requiresHighPriorityFirstSync;
+ (BOOL)requiresPushNotificationSupport;
+ (id)backingRecordIDs;
+ (id)backingRecordZoneIDs;
+ (id)commandStoreFileName;
+ (id)commandsToMergeLocalDataToCloud:(id)a3 privateDataDirectory:(id)a4;
+ (id)desiredKeys;
+ (id)localStoreFilename;
+ (id)subscriptionIDForTagID:(id)a3 type:(unint64_t)a4;
+ (int64_t)commandQueueUrgency;
+ (unint64_t)localStoreVersion;
+ (void)configureKeyValueStoreForJSONHandling:(id)a3;
- (BOOL)addSubscriptionForTagID:(id)a3 type:(unint64_t)a4;
- (BOOL)addSubscriptionForTagID:(id)a3 type:(unint64_t)a4 origin:(unint64_t)a5;
- (BOOL)addSubscriptionForTagID:(id)a3 type:(unint64_t)a4 origin:(unint64_t)a5 groupID:(id)a6;
- (BOOL)addSubscriptionForTagID:(id)a3 type:(unint64_t)a4 origin:(unint64_t)a5 groupID:(id)a6 notificationsEnabled:(BOOL)a7;
- (BOOL)appendSubscriptionForTagID:(id)a3 type:(unint64_t)a4;
- (BOOL)canAddSubscription;
- (BOOL)canHelpRestoreZoneName:(id)a3;
- (BOOL)hasAutoFavoriteSubscriptionForTagID:(id)a3;
- (BOOL)hasIgnoredSubscriptionForTagID:(id)a3;
- (BOOL)hasMutedSubscriptionForTagID:(id)a3;
- (BOOL)hasNotificationsEnabledForTagID:(id)a3;
- (BOOL)hasSubscriptionForTagID:(id)a3;
- (BOOL)moveSubscriptionForTagID:(id)a3 toIndex:(unint64_t)a4;
- (BOOL)setNotificationsEnabled:(BOOL)a3 forTagID:(id)a4;
- (FCSubscriptionList)initWithContext:(id)a3 pushNotificationCenter:(id)a4 storeDirectory:(id)a5;
- (FCTagRanking)subscribedTagRanker;
- (NSDictionary)subscriptionsBySubscriptionID;
- (NSOrderedSet)orderedSubscribedTagIDs;
- (NSSet)allSubscribedTagIDs;
- (NSSet)autoFavoriteTagIDs;
- (NSSet)groupableTagIDs;
- (NSSet)ignoredTagIDs;
- (NSSet)mutedTagIDs;
- (NSSet)subscribedTagIDs;
- (id)_reconcileSubscriptions:(uint64_t)a1;
- (id)allKnownRecordNamesWithinRecordZoneWithID:(id)a3;
- (id)recordsForRestoringZoneName:(id)a3;
- (id)subscriptionForTagID:(id)a3;
- (id)subscriptionForTagID:(id)a3 type:(unint64_t)a4;
- (id)subscriptionForTagIDOfAnyType:(id)a3;
- (id)subscriptionsForType:(unint64_t)a3;
- (id)t_reconcileSubscriptions:(id)a3;
- (void)_localAddSubscriptions:(void *)a3 changeSubscriptions:(void *)a4 removeSubscriptions:;
- (void)_modifyRemoteSubscriptions:(void *)a1;
- (void)_newSubscriptionOrder;
- (void)_regenerateSortedSubscriptions;
- (void)addObserver:(id)a3;
- (void)addSubscriptionsForTagIDs:(id)a3 typeProvider:(id)a4 originProvider:(id)a5 completion:(id)a6;
- (void)assignOrderToTagSubscriptionsIfNeeded;
- (void)handleSyncDidResetLocalDataForRecordZoneWithID:(id)a3;
- (void)handleSyncWithChangedRecords:(id)a3 deletedRecordNames:(id)a4;
- (void)loadLocalCachesFromStore;
- (void)removeObserver:(id)a3;
- (void)removeSubscriptionForTagID:(id)a3 type:(unint64_t)a4;
- (void)removeSubscriptionsForTagIDs:(id)a3 typeProvider:(id)a4 completion:(id)a5;
- (void)reorderSubscriptionOrderForOrderedIdentifiers:(id)a3;
- (void)setMutableSubscriptionsBySubscriptionID:(uint64_t)a1;
- (void)setSubscribedTagRanker:(id)a3;
@end

@implementation FCSubscriptionList

uint64_t __59__FCSubscriptionList_assignOrderToTagSubscriptionsIfNeeded__block_invoke(uint64_t a1, void *a2)
{
  return [a2 asReorderableTagSubscription];
}

void __48__FCSubscriptionList_subscriptionForTagID_type___block_invoke(void *a1)
{
  v2 = (void *)a1[4];
  if (v2) {
    v2 = (void *)v2[19];
  }
  uint64_t v3 = a1[5];
  v7 = v2;
  uint64_t v4 = [v7 objectForKeyedSubscript:v3];
  uint64_t v5 = *(void *)(a1[6] + 8);
  v6 = *(void **)(v5 + 40);
  *(void *)(v5 + 40) = v4;
}

void __33__FCSubscriptionList_mutedTagIDs__block_invoke(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 32);
  if (v1) {
    v2 = *(void **)(v1 + 120);
  }
  else {
    v2 = 0;
  }
  objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40), v2);
}

void __38__FCSubscriptionList_subscribedTagIDs__block_invoke(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 32);
  if (v1) {
    v2 = *(void **)(v1 + 112);
  }
  else {
    v2 = 0;
  }
  objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40), v2);
}

void __51__FCSubscriptionList_subscriptionsBySubscriptionID__block_invoke(uint64_t a1)
{
  v2 = *(void **)(a1 + 32);
  if (v2) {
    v2 = (void *)v2[19];
  }
  v6 = v2;
  uint64_t v3 = [v6 copy];
  uint64_t v4 = *(void *)(*(void *)(a1 + 40) + 8);
  uint64_t v5 = *(void **)(v4 + 40);
  *(void *)(v4 + 40) = v3;
}

void __45__FCSubscriptionList_orderedSubscribedTagIDs__block_invoke(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 32);
  if (v1) {
    v2 = *(void **)(v1 + 104);
  }
  else {
    v2 = 0;
  }
  objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40), v2);
}

void __40__FCSubscriptionList_autoFavoriteTagIDs__block_invoke(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 32);
  if (v1) {
    v2 = *(void **)(v1 + 128);
  }
  else {
    v2 = 0;
  }
  objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40), v2);
}

void __37__FCSubscriptionList_groupableTagIDs__block_invoke(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 32);
  if (v1) {
    v2 = *(void **)(v1 + 136);
  }
  else {
    v2 = 0;
  }
  objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40), v2);
}

void __46__FCSubscriptionList_loadLocalCachesFromStore__block_invoke(uint64_t a1)
{
  -[FCSubscriptionList setMutableSubscriptionsBySubscriptionID:](*(void *)(a1 + 32), *(void **)(a1 + 40));
  v2 = *(id **)(a1 + 32);
  -[FCSubscriptionList _regenerateSortedSubscriptions](v2);
}

- (void)setMutableSubscriptionsBySubscriptionID:(uint64_t)a1
{
  if (a1) {
    objc_storeStrong((id *)(a1 + 152), a2);
  }
}

void __35__FCSubscriptionList_ignoredTagIDs__block_invoke(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 32);
  if (v1) {
    v2 = *(void **)(v1 + 144);
  }
  else {
    v2 = 0;
  }
  objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40), v2);
}

+ (unint64_t)localStoreVersion
{
  return 8;
}

+ (id)localStoreFilename
{
  return @"subscriptions";
}

+ (void)configureKeyValueStoreForJSONHandling:(id)a3
{
}

+ (id)commandStoreFileName
{
  return @"subscriptions-commands";
}

+ (int64_t)commandQueueUrgency
{
  return 1;
}

- (id)subscriptionForTagID:(id)a3 type:(unint64_t)a4
{
  id v6 = a3;
  v7 = +[FCSubscriptionList subscriptionIDForTagID:v6 type:a4];
  uint64_t v16 = 0;
  v17 = &v16;
  uint64_t v18 = 0x3032000000;
  v19 = __Block_byref_object_copy__40;
  v20 = __Block_byref_object_dispose__40;
  id v21 = 0;
  if (self) {
    itemsLock = self->_itemsLock;
  }
  else {
    itemsLock = 0;
  }
  v9 = itemsLock;
  v13[0] = MEMORY[0x1E4F143A8];
  v13[1] = 3221225472;
  v13[2] = __48__FCSubscriptionList_subscriptionForTagID_type___block_invoke;
  v13[3] = &unk_1E5B4C230;
  v15 = &v16;
  v13[4] = self;
  id v10 = v7;
  id v14 = v10;
  [(FCMTWriterLock *)v9 performReadSync:v13];

  id v11 = (id)v17[5];
  _Block_object_dispose(&v16, 8);

  return v11;
}

+ (id)subscriptionIDForTagID:(id)a3 type:(unint64_t)a4
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  switch(a4)
  {
    case 0uLL:
      [NSString stringWithFormat:@"%@-%@-%@", @"tag", v5, @"subscription"];
      goto LABEL_11;
    case 2uLL:
      v7 = NSString;
      v8 = FCCKSubscriptionTypeMutedTag;
      goto LABEL_10;
    case 3uLL:
      v7 = NSString;
      v8 = FCCKSubscriptionTypeAutoFavoriteTag;
      goto LABEL_10;
    case 4uLL:
      v7 = NSString;
      v8 = FCCKSubscriptionTypeGroupableTag;
      goto LABEL_10;
    case 5uLL:
      v7 = NSString;
      v8 = FCCKSubscriptionTypeIgnoredTag;
LABEL_10:
      [v7 stringWithFormat:@"%@-%@", *v8, v5, v11];
      id v6 = LABEL_11:;
      break;
    default:
      if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
      {
        id v10 = (void *)[[NSString alloc] initWithFormat:@"Unsupported Tag Type"];
        *(_DWORD *)buf = 136315906;
        v13 = "+[FCSubscriptionList subscriptionIDForTagID:type:]";
        __int16 v14 = 2080;
        v15 = "FCSubscriptionList.m";
        __int16 v16 = 1024;
        int v17 = 391;
        __int16 v18 = 2114;
        v19 = v10;
        _os_log_error_impl(&dword_1A460D000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", buf, 0x26u);
      }
      id v6 = 0;
      break;
  }

  return v6;
}

+ (BOOL)requiresHighPriorityFirstSync
{
  return 1;
}

- (void)loadLocalCachesFromStore
{
  uint64_t v38 = *MEMORY[0x1E4F143B8];
  v26 = [MEMORY[0x1E4F1CA60] dictionary];
  uint64_t v3 = [(FCPrivateDataController *)self localStore];
  long long v29 = 0u;
  long long v30 = 0u;
  long long v31 = 0u;
  long long v32 = 0u;
  uint64_t v4 = [v3 allKeys];
  uint64_t v5 = [v4 countByEnumeratingWithState:&v29 objects:v37 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v30;
    do
    {
      for (uint64_t i = 0; i != v6; ++i)
      {
        if (*(void *)v30 != v7) {
          objc_enumerationMutation(v4);
        }
        v9 = *(void **)(*((void *)&v29 + 1) + 8 * i);
        if (([(id)objc_opt_class() isLocalStoreKeyInternal:v9] & 1) == 0)
        {
          id v10 = v9;
          objc_opt_class();
          uint64_t v11 = [v3 objectForKey:v10];
          if (v11)
          {
            if (objc_opt_isKindOfClass()) {
              v12 = v11;
            }
            else {
              v12 = 0;
            }
          }
          else
          {
            v12 = 0;
          }
          id v13 = v12;

          if (v13
            && ([v13 allKeys],
                __int16 v14 = objc_claimAutoreleasedReturnValue(),
                uint64_t v15 = [v14 count],
                v14,
                v15))
          {
            __int16 v16 = +[FCSubscription subscriptionWithSubscriptionID:v10 dictionaryRepresentation:v13];
            int v17 = v16;
            if (v16 && v10 && ([v16 isDeprecated] & 1) == 0) {
              [v26 setObject:v17 forKey:v10];
            }
          }
          else
          {
            __int16 v18 = (void *)FCDefaultLog;
            if (os_log_type_enabled((os_log_t)FCDefaultLog, OS_LOG_TYPE_ERROR))
            {
              v19 = v18;
              uint64_t v20 = (objc_class *)objc_opt_class();
              id v21 = NSStringFromClass(v20);
              *(_DWORD *)buf = 138543618;
              v34 = v21;
              __int16 v35 = 2114;
              id v36 = v10;
              _os_log_error_impl(&dword_1A460D000, v19, OS_LOG_TYPE_ERROR, "ERROR: %{public}@ is not a valid dictionary for key %{public}@", buf, 0x16u);
            }
          }
        }
      }
      uint64_t v6 = [v4 countByEnumeratingWithState:&v29 objects:v37 count:16];
    }
    while (v6);
  }

  v22 = [v26 allValues];
  v23 = -[FCSubscriptionList _reconcileSubscriptions:]((uint64_t)self, v22);

  if (self) {
    itemsLock = self->_itemsLock;
  }
  else {
    itemsLock = 0;
  }
  v27[0] = MEMORY[0x1E4F143A8];
  v27[1] = 3221225472;
  v27[2] = __46__FCSubscriptionList_loadLocalCachesFromStore__block_invoke;
  v27[3] = &unk_1E5B4BE70;
  v27[4] = self;
  id v28 = v23;
  id v25 = v23;
  [(FCMTWriterLock *)itemsLock performWriteSync:v27];
}

- (NSOrderedSet)orderedSubscribedTagIDs
{
  uint64_t v8 = 0;
  v9 = &v8;
  uint64_t v10 = 0x3032000000;
  uint64_t v11 = __Block_byref_object_copy__40;
  v12 = __Block_byref_object_dispose__40;
  id v13 = 0;
  if (self) {
    itemsLock = self->_itemsLock;
  }
  else {
    itemsLock = 0;
  }
  uint64_t v4 = itemsLock;
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __45__FCSubscriptionList_orderedSubscribedTagIDs__block_invoke;
  v7[3] = &unk_1E5B4C258;
  v7[4] = self;
  v7[5] = &v8;
  [(FCMTWriterLock *)v4 performReadSync:v7];

  id v5 = (id)v9[5];
  _Block_object_dispose(&v8, 8);

  return (NSOrderedSet *)v5;
}

- (BOOL)hasMutedSubscriptionForTagID:(id)a3
{
  id v4 = a3;
  id v5 = [(FCSubscriptionList *)self mutedTagIDs];
  char v6 = [v5 containsObject:v4];

  return v6;
}

- (NSSet)mutedTagIDs
{
  uint64_t v8 = 0;
  v9 = &v8;
  uint64_t v10 = 0x3032000000;
  uint64_t v11 = __Block_byref_object_copy__40;
  v12 = __Block_byref_object_dispose__40;
  id v13 = 0;
  if (self) {
    itemsLock = self->_itemsLock;
  }
  else {
    itemsLock = 0;
  }
  id v4 = itemsLock;
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __33__FCSubscriptionList_mutedTagIDs__block_invoke;
  v7[3] = &unk_1E5B4C258;
  v7[4] = self;
  v7[5] = &v8;
  [(FCMTWriterLock *)v4 performReadSync:v7];

  id v5 = (id)v9[5];
  _Block_object_dispose(&v8, 8);

  return (NSSet *)v5;
}

- (NSSet)groupableTagIDs
{
  uint64_t v8 = 0;
  v9 = &v8;
  uint64_t v10 = 0x3032000000;
  uint64_t v11 = __Block_byref_object_copy__40;
  v12 = __Block_byref_object_dispose__40;
  id v13 = 0;
  if (self) {
    itemsLock = self->_itemsLock;
  }
  else {
    itemsLock = 0;
  }
  id v4 = itemsLock;
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __37__FCSubscriptionList_groupableTagIDs__block_invoke;
  v7[3] = &unk_1E5B4C258;
  v7[4] = self;
  v7[5] = &v8;
  [(FCMTWriterLock *)v4 performReadSync:v7];

  id v5 = (id)v9[5];
  _Block_object_dispose(&v8, 8);

  return (NSSet *)v5;
}

- (NSSet)subscribedTagIDs
{
  uint64_t v8 = 0;
  v9 = &v8;
  uint64_t v10 = 0x3032000000;
  uint64_t v11 = __Block_byref_object_copy__40;
  v12 = __Block_byref_object_dispose__40;
  id v13 = 0;
  if (self) {
    itemsLock = self->_itemsLock;
  }
  else {
    itemsLock = 0;
  }
  id v4 = itemsLock;
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __38__FCSubscriptionList_subscribedTagIDs__block_invoke;
  v7[3] = &unk_1E5B4C258;
  v7[4] = self;
  v7[5] = &v8;
  [(FCMTWriterLock *)v4 performReadSync:v7];

  id v5 = (id)v9[5];
  _Block_object_dispose(&v8, 8);

  return (NSSet *)v5;
}

- (void)_regenerateSortedSubscriptions
{
  uint64_t v44 = *MEMORY[0x1E4F143B8];
  if (a1)
  {
    v2 = objc_opt_new();
    uint64_t v3 = objc_opt_new();
    id v4 = objc_opt_new();
    id v5 = objc_opt_new();
    char v6 = objc_opt_new();
    self = a1;
    id v7 = a1[19];
    long long v31 = 0u;
    long long v32 = 0u;
    long long v33 = 0u;
    long long v34 = 0u;
    id v27 = v7;
    uint64_t v8 = [v7 allValues];
    uint64_t v9 = [v8 countByEnumeratingWithState:&v31 objects:v43 count:16];
    if (v9)
    {
      uint64_t v10 = v9;
      uint64_t v11 = *(void *)v32;
      do
      {
        for (uint64_t i = 0; i != v10; ++i)
        {
          if (*(void *)v32 != v11) {
            objc_enumerationMutation(v8);
          }
          id v13 = *(void **)(*((void *)&v31 + 1) + 8 * i);
          switch([v13 subscriptionType])
          {
            case 0:
              __int16 v14 = [v13 tagID];
              uint64_t v15 = v2;
              goto LABEL_15;
            case 1:
              if (!os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR)) {
                continue;
              }
              __int16 v14 = (void *)[[NSString alloc] initWithFormat:@"pending subscriptions are deprecated and should be filtered when loading from the cache"];
              *(_DWORD *)buf = 136315906;
              id v36 = "-[FCSubscriptionList _regenerateSortedSubscriptions]";
              __int16 v37 = 2080;
              uint64_t v38 = "FCSubscriptionList.m";
              __int16 v39 = 1024;
              int v40 = 1270;
              __int16 v41 = 2114;
              v42 = v14;
              _os_log_error_impl(&dword_1A460D000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", buf, 0x26u);
              goto LABEL_16;
            case 2:
              __int16 v14 = [v13 tagID];
              uint64_t v15 = v3;
              goto LABEL_15;
            case 3:
              __int16 v14 = [v13 tagID];
              uint64_t v15 = v4;
              goto LABEL_15;
            case 4:
              __int16 v14 = [v13 tagID];
              uint64_t v15 = v5;
              goto LABEL_15;
            case 5:
              __int16 v14 = [v13 tagID];
              uint64_t v15 = v6;
LABEL_15:
              [v15 addObject:v14];
LABEL_16:

              break;
            default:
              continue;
          }
        }
        uint64_t v10 = [v8 countByEnumeratingWithState:&v31 objects:v43 count:16];
      }
      while (v10);
    }

    __int16 v16 = FCSubscriptionListLog;
    if (os_log_type_enabled((os_log_t)FCSubscriptionListLog, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412546;
      id v36 = (const char *)v2;
      __int16 v37 = 2112;
      uint64_t v38 = (char *)v3;
      _os_log_impl(&dword_1A460D000, v16, OS_LOG_TYPE_DEFAULT, "subscribedTagIDs: %@ mutedTagIDs: %@", buf, 0x16u);
    }
    objc_setProperty_nonatomic_copy(self, v17, v2, 112);
    __int16 v18 = [v2 allObjects];
    v29[0] = MEMORY[0x1E4F143A8];
    v29[1] = 3221225472;
    v29[2] = __52__FCSubscriptionList__regenerateSortedSubscriptions__block_invoke;
    v29[3] = &unk_1E5B54348;
    id v30 = v27;
    id v19 = v27;
    uint64_t v20 = [v18 sortedArrayUsingComparator:v29];

    id v21 = [MEMORY[0x1E4F1CAA0] orderedSetWithArray:v20];
    objc_setProperty_nonatomic_copy(self, v22, v21, 104);

    objc_setProperty_nonatomic_copy(self, v23, v3, 120);
    objc_setProperty_nonatomic_copy(self, v24, v4, 128);
    objc_setProperty_nonatomic_copy(self, v25, v5, 136);
    objc_setProperty_nonatomic_copy(self, v26, v6, 144);
  }
}

- (void)assignOrderToTagSubscriptionsIfNeeded
{
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  uint64_t v3 = [(FCSubscriptionList *)self subscriptionsBySubscriptionID];
  id v4 = [v3 allValues];
  id v5 = objc_msgSend(v4, "fc_arrayByTransformingWithBlock:", &__block_literal_global_95);

  char v6 = [(FCSubscriptionList *)self subscribedTagRanker];

  if (v6)
  {
    uint64_t v14 = MEMORY[0x1E4F143A8];
    uint64_t v15 = 3221225472;
    __int16 v16 = __59__FCSubscriptionList_assignOrderToTagSubscriptionsIfNeeded__block_invoke_2;
    int v17 = &unk_1E5B51718;
    __int16 v18 = self;
    id v7 = v5;
    uint64_t v8 = &v14;
    if (self)
    {
      if (!v7 && os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
      {
        id v11 = [NSString alloc];
        v12 = objc_msgSend(v11, "initWithFormat:", @"Invalid parameter not satisfying %s", "tagSubscriptions", v14, v15, v16, v17, v18);
        *(_DWORD *)buf = 136315906;
        *(void *)&uint8_t buf[4] = "-[FCSubscriptionList _assignOrderToTagSubscriptions:withCompletion:]";
        *(_WORD *)&buf[12] = 2080;
        *(void *)&buf[14] = "FCSubscriptionList.m";
        *(_WORD *)&buf[22] = 1024;
        LODWORD(v20) = 930;
        WORD2(v20) = 2114;
        *(void *)((char *)&v20 + 6) = v12;
        _os_log_error_impl(&dword_1A460D000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", buf, 0x26u);
      }
      uint64_t v9 = [(FCSubscriptionList *)self subscribedTagRanker];
      if (!v9 && os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
      {
        id v13 = objc_msgSend([NSString alloc], "initWithFormat:", @"invalid nil value for '%s'", "tagRanker");
        *(_DWORD *)buf = 136315906;
        *(void *)&uint8_t buf[4] = "-[FCSubscriptionList _assignOrderToTagSubscriptions:withCompletion:]";
        *(_WORD *)&buf[12] = 2080;
        *(void *)&buf[14] = "FCSubscriptionList.m";
        *(_WORD *)&buf[22] = 1024;
        LODWORD(v20) = 934;
        WORD2(v20) = 2114;
        *(void *)((char *)&v20 + 6) = v13;
        _os_log_error_impl(&dword_1A460D000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", buf, 0x26u);
      }
      *(void *)buf = MEMORY[0x1E4F143A8];
      *(void *)&buf[8] = 3221225472;
      *(void *)&buf[16] = __68__FCSubscriptionList__assignOrderToTagSubscriptions_withCompletion___block_invoke;
      *(void *)&long long v20 = &unk_1E5B4E088;
      *((void *)&v20 + 1) = v9;
      id v21 = v7;
      SEL v22 = v8;
      id v10 = v9;
      +[FCTaskScheduler scheduleLowPriorityBlock:buf];
    }
  }
}

- (NSDictionary)subscriptionsBySubscriptionID
{
  uint64_t v8 = 0;
  uint64_t v9 = &v8;
  uint64_t v10 = 0x3032000000;
  id v11 = __Block_byref_object_copy__40;
  v12 = __Block_byref_object_dispose__40;
  id v13 = 0;
  if (self) {
    itemsLock = self->_itemsLock;
  }
  else {
    itemsLock = 0;
  }
  id v4 = itemsLock;
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __51__FCSubscriptionList_subscriptionsBySubscriptionID__block_invoke;
  v7[3] = &unk_1E5B4C258;
  v7[4] = self;
  v7[5] = &v8;
  [(FCMTWriterLock *)v4 performReadSync:v7];

  id v5 = (id)v9[5];
  _Block_object_dispose(&v8, 8);

  return (NSDictionary *)v5;
}

- (FCTagRanking)subscribedTagRanker
{
  return self->_subscribedTagRanker;
}

- (id)subscriptionsForType:(unint64_t)a3
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  switch(a3)
  {
    case 0uLL:
      uint64_t v3 = [(FCSubscriptionList *)self subscribedTagIDs];
      break;
    case 2uLL:
      uint64_t v3 = [(FCSubscriptionList *)self mutedTagIDs];
      break;
    case 3uLL:
      uint64_t v3 = [(FCSubscriptionList *)self autoFavoriteTagIDs];
      break;
    case 4uLL:
      uint64_t v3 = [(FCSubscriptionList *)self groupableTagIDs];
      break;
    case 5uLL:
      uint64_t v3 = [(FCSubscriptionList *)self ignoredTagIDs];
      break;
    default:
      if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
      {
        id v5 = (void *)[[NSString alloc] initWithFormat:@"Unsupported Tag Type"];
        int v6 = 136315906;
        id v7 = "-[FCSubscriptionList subscriptionsForType:]";
        __int16 v8 = 2080;
        uint64_t v9 = "FCSubscriptionList.m";
        __int16 v10 = 1024;
        int v11 = 660;
        __int16 v12 = 2114;
        id v13 = v5;
        _os_log_error_impl(&dword_1A460D000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", (uint8_t *)&v6, 0x26u);
      }
      uint64_t v3 = 0;
      break;
  }
  return v3;
}

- (NSSet)autoFavoriteTagIDs
{
  uint64_t v8 = 0;
  uint64_t v9 = &v8;
  uint64_t v10 = 0x3032000000;
  int v11 = __Block_byref_object_copy__40;
  __int16 v12 = __Block_byref_object_dispose__40;
  id v13 = 0;
  if (self) {
    itemsLock = self->_itemsLock;
  }
  else {
    itemsLock = 0;
  }
  id v4 = itemsLock;
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __40__FCSubscriptionList_autoFavoriteTagIDs__block_invoke;
  v7[3] = &unk_1E5B4C258;
  v7[4] = self;
  v7[5] = &v8;
  [(FCMTWriterLock *)v4 performReadSync:v7];

  id v5 = (id)v9[5];
  _Block_object_dispose(&v8, 8);

  return (NSSet *)v5;
}

- (id)_reconcileSubscriptions:(uint64_t)a1
{
  if (a1)
  {
    v2 = objc_msgSend(a2, "fc_dictionaryOfSortedObjectsWithKeyBlock:", &__block_literal_global_95);
    uint64_t v3 = [MEMORY[0x1E4F1CA60] dictionary];
    v6[0] = MEMORY[0x1E4F143A8];
    v6[1] = 3221225472;
    v6[2] = __46__FCSubscriptionList__reconcileSubscriptions___block_invoke_2;
    v6[3] = &unk_1E5B54648;
    id v4 = v3;
    id v7 = v4;
    [v2 enumerateKeysAndObjectsUsingBlock:v6];
  }
  else
  {
    id v4 = 0;
  }
  return v4;
}

uint64_t __46__FCSubscriptionList__reconcileSubscriptions___block_invoke(uint64_t a1, void *a2)
{
  return [a2 tagID];
}

- (void)setSubscribedTagRanker:(id)a3
{
}

void __46__FCSubscriptionList__reconcileSubscriptions___block_invoke_2(uint64_t a1, uint64_t a2, void *a3)
{
  id v7 = [a3 sortedArrayUsingSelector:sel_comparePriority_];
  id v4 = [v7 firstObject];
  id v5 = *(void **)(a1 + 32);
  int v6 = [v4 subscriptionID];
  [v5 setObject:v4 forKeyedSubscript:v6];
}

- (FCSubscriptionList)initWithContext:(id)a3 pushNotificationCenter:(id)a4 storeDirectory:(id)a5
{
  v9.receiver = self;
  v9.super_class = (Class)FCSubscriptionList;
  id v5 = [(FCPrivateDataController *)&v9 initWithContext:a3 pushNotificationCenter:a4 storeDirectory:a5];
  if (v5)
  {
    int v6 = objc_alloc_init(FCMTWriterLock);
    itemsLock = v5->_itemsLock;
    v5->_itemsLock = v6;
  }
  return v5;
}

- (void)addObserver:(id)a3
{
  v3.receiver = self;
  v3.super_class = (Class)FCSubscriptionList;
  [(FCPrivateDataController *)&v3 addObserver:a3];
}

- (NSSet)ignoredTagIDs
{
  uint64_t v8 = 0;
  objc_super v9 = &v8;
  uint64_t v10 = 0x3032000000;
  int v11 = __Block_byref_object_copy__40;
  __int16 v12 = __Block_byref_object_dispose__40;
  id v13 = 0;
  if (self) {
    itemsLock = self->_itemsLock;
  }
  else {
    itemsLock = 0;
  }
  id v4 = itemsLock;
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __35__FCSubscriptionList_ignoredTagIDs__block_invoke;
  v7[3] = &unk_1E5B4C258;
  v7[4] = self;
  v7[5] = &v8;
  [(FCMTWriterLock *)v4 performReadSync:v7];

  id v5 = (id)v9[5];
  _Block_object_dispose(&v8, 8);

  return (NSSet *)v5;
}

void __59__FCSubscriptionList_assignOrderToTagSubscriptionsIfNeeded__block_invoke_2(uint64_t a1, void *a2)
{
  objc_super v3 = *(id **)(a1 + 32);
  id v4 = a2;
  -[FCSubscriptionList _localAddSubscriptions:changeSubscriptions:removeSubscriptions:](v3, 0, v4, 0);
  -[FCSubscriptionList _modifyRemoteSubscriptions:](*(void **)(a1 + 32), v4);
}

- (void)_localAddSubscriptions:(void *)a3 changeSubscriptions:(void *)a4 removeSubscriptions:
{
  uint64_t v115 = *MEMORY[0x1E4F143B8];
  id v7 = a2;
  id v8 = a3;
  id v9 = a4;
  if (a1)
  {
    [MEMORY[0x1E4F29060] isMainThread];
    v73 = objc_opt_new();
    v72 = objc_opt_new();
    v70 = objc_opt_new();
    if (v9) {
      id v10 = v9;
    }
    else {
      id v10 = (id)MEMORY[0x1E4F1CBF0];
    }
    uint64_t v11 = [MEMORY[0x1E4F1CA80] setWithArray:v10];
    __int16 v12 = [a1 localStore];
    id v13 = (void *)[a1[19] mutableCopy];
    uint64_t v14 = [MEMORY[0x1E4F1CA48] array];
    [v14 addObjectsFromArray:v7];
    [v14 addObjectsFromArray:v8];
    uint64_t v15 = objc_msgSend(v14, "fc_setByTransformingWithBlock:", &__block_literal_global_79_0);
    v100[0] = MEMORY[0x1E4F143A8];
    v100[1] = 3221225472;
    v100[2] = __85__FCSubscriptionList__localAddSubscriptions_changeSubscriptions_removeSubscriptions___block_invoke_2;
    v100[3] = &unk_1E5B56198;
    id v16 = v15;
    id v101 = v16;
    id v17 = v14;
    id v102 = v17;
    [v13 enumerateKeysAndObjectsUsingBlock:v100];
    v67 = a1;
    v62 = v17;
    __int16 v18 = -[FCSubscriptionList _reconcileSubscriptions:]((uint64_t)a1, v17);
    id v63 = v9;
    if ([v9 count])
    {
      id v19 = objc_msgSend(v9, "fc_setByTransformingWithBlock:", &__block_literal_global_82_0);
      long long v20 = (void *)[v19 mutableCopy];
    }
    else
    {
      long long v20 = [MEMORY[0x1E4F1CA80] set];
    }
    v96[0] = MEMORY[0x1E4F143A8];
    v96[1] = 3221225472;
    v96[2] = __85__FCSubscriptionList__localAddSubscriptions_changeSubscriptions_removeSubscriptions___block_invoke_4;
    v96[3] = &unk_1E5B561C0;
    id v61 = v16;
    id v97 = v61;
    id v21 = v18;
    id v98 = v21;
    id v59 = v20;
    id v99 = v59;
    [v13 enumerateKeysAndObjectsUsingBlock:v96];
    aBlock[0] = MEMORY[0x1E4F143A8];
    aBlock[1] = 3221225472;
    aBlock[2] = __85__FCSubscriptionList__localAddSubscriptions_changeSubscriptions_removeSubscriptions___block_invoke_5;
    aBlock[3] = &unk_1E5B561E8;
    aBlock[4] = v67;
    id v60 = v21;
    id v93 = v60;
    id v22 = v12;
    id v94 = v22;
    id v71 = v13;
    id v95 = v71;
    uint64_t v23 = (unsigned int (**)(void *, void))_Block_copy(aBlock);
    long long v88 = 0u;
    long long v89 = 0u;
    long long v90 = 0u;
    long long v91 = 0u;
    id v65 = v7;
    id v24 = v7;
    uint64_t v25 = [v24 countByEnumeratingWithState:&v88 objects:v114 count:16];
    if (v25)
    {
      uint64_t v26 = v25;
      uint64_t v27 = *(void *)v89;
      do
      {
        for (uint64_t i = 0; i != v26; ++i)
        {
          if (*(void *)v89 != v27) {
            objc_enumerationMutation(v24);
          }
          uint64_t v29 = *(void *)(*((void *)&v88 + 1) + 8 * i);
          if (v23[2](v23, v29)) {
            [v73 addObject:v29];
          }
        }
        uint64_t v26 = [v24 countByEnumeratingWithState:&v88 objects:v114 count:16];
      }
      while (v26);
    }
    v66 = v22;
    v68 = (void *)v11;

    long long v86 = 0u;
    long long v87 = 0u;
    long long v84 = 0u;
    long long v85 = 0u;
    id v64 = v8;
    obuint64_t j = v8;
    uint64_t v30 = [obj countByEnumeratingWithState:&v84 objects:v113 count:16];
    if (v30)
    {
      uint64_t v31 = v30;
      uint64_t v32 = *(void *)v85;
      do
      {
        for (uint64_t j = 0; j != v31; ++j)
        {
          if (*(void *)v85 != v32) {
            objc_enumerationMutation(obj);
          }
          long long v34 = *(void **)(*((void *)&v84 + 1) + 8 * j);
          __int16 v35 = [v34 subscriptionID];
          id v36 = [v71 objectForKeyedSubscript:v35];

          if (!v36 && os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
          {
            __int16 v41 = objc_msgSend([NSString alloc], "initWithFormat:", @"invalid nil value for '%s'", "existingSubscription");
            *(_DWORD *)buf = 136315906;
            v106 = "-[FCSubscriptionList _localAddSubscriptions:changeSubscriptions:removeSubscriptions:]";
            __int16 v107 = 2080;
            v108 = "FCSubscriptionList.m";
            __int16 v109 = 1024;
            int v110 = 1187;
            __int16 v111 = 2114;
            v112 = v41;
            _os_log_error_impl(&dword_1A460D000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", buf, 0x26u);
          }
          __int16 v37 = (void *)MEMORY[0x1E4FBA8A8];
          uint64_t v38 = [v36 order];
          __int16 v39 = [v34 order];
          char v40 = objc_msgSend(v37, "nf_object:isEqualToObject:", v38, v39);

          if (((unsigned int (**)(void *, void *))v23)[2](v23, v34))
          {
            [v72 addObject:v34];
            if ((v40 & 1) == 0) {
              [v70 addObject:v34];
            }
          }
        }
        uint64_t v31 = [obj countByEnumeratingWithState:&v84 objects:v113 count:16];
      }
      while (v31);
    }

    long long v82 = 0u;
    long long v83 = 0u;
    long long v80 = 0u;
    long long v81 = 0u;
    id v42 = v59;
    uint64_t v43 = [v42 countByEnumeratingWithState:&v80 objects:v104 count:16];
    if (v43)
    {
      uint64_t v44 = v43;
      uint64_t v45 = *(void *)v81;
      do
      {
        for (uint64_t k = 0; k != v44; ++k)
        {
          if (*(void *)v81 != v45) {
            objc_enumerationMutation(v42);
          }
          uint64_t v47 = *(void *)(*((void *)&v80 + 1) + 8 * k);
          v48 = [v71 objectForKeyedSubscript:v47];
          if (v48) {
            [v68 addObject:v48];
          }
          [v66 removeObjectForKey:v47];
        }
        uint64_t v44 = [v42 countByEnumeratingWithState:&v80 objects:v104 count:16];
      }
      while (v44);
    }

    if ([v42 count])
    {
      v49 = [v42 allObjects];
      [v71 removeObjectsForKeys:v49];
    }
    id v50 = v67[20];
    v78[0] = MEMORY[0x1E4F143A8];
    v78[1] = 3221225472;
    v78[2] = __85__FCSubscriptionList__localAddSubscriptions_changeSubscriptions_removeSubscriptions___block_invoke_85;
    v78[3] = &unk_1E5B4BE70;
    v78[4] = v67;
    id v51 = v71;
    id v79 = v51;
    [v50 performWriteSync:v78];
    long long v76 = 0u;
    long long v77 = 0u;
    long long v74 = 0u;
    long long v75 = 0u;
    v52 = [v67 observers];
    v53 = (void *)[v52 copy];

    uint64_t v54 = [v53 countByEnumeratingWithState:&v74 objects:v103 count:16];
    if (v54)
    {
      uint64_t v55 = v54;
      uint64_t v56 = *(void *)v75;
      do
      {
        for (uint64_t m = 0; m != v55; ++m)
        {
          if (*(void *)v75 != v56) {
            objc_enumerationMutation(v53);
          }
          v58 = *(void **)(*((void *)&v74 + 1) + 8 * m);
          if (objc_opt_respondsToSelector()) {
            [v58 subscriptionList:v67 didAddSubscriptions:v73 changeSubscriptions:v72 moveSubscriptions:v70 removeSubscriptions:v68];
          }
        }
        uint64_t v55 = [v53 countByEnumeratingWithState:&v74 objects:v103 count:16];
      }
      while (v55);
    }

    id v8 = v64;
    id v7 = v65;
    id v9 = v63;
  }
}

- (void)_modifyRemoteSubscriptions:(void *)a1
{
  id v4 = a2;
  if (a1 && [v4 count])
  {
    objc_super v3 = [[FCModifySubscriptionsCommand alloc] initWithSubscriptions:v4 merge:0];
    [a1 addCommandToCommandQueue:v3];
  }
}

- (void)removeObserver:(id)a3
{
  v3.receiver = self;
  v3.super_class = (Class)FCSubscriptionList;
  [(FCPrivateDataController *)&v3 removeObserver:a3];
}

+ (id)desiredKeys
{
  v4[10] = *MEMORY[0x1E4F143B8];
  v4[0] = @"subscriptionType";
  v4[1] = @"subscriptionOrder";
  v4[2] = @"subscriptionOrigin";
  v4[3] = @"dateAdded";
  v4[4] = @"tagID";
  v4[5] = @"groupID";
  v4[6] = @"url";
  v4[7] = @"title";
  v4[8] = @"pollingURL";
  v4[9] = @"notificationsEnabled";
  v2 = [MEMORY[0x1E4F1C978] arrayWithObjects:v4 count:10];
  return v2;
}

- (void)handleSyncWithChangedRecords:(id)a3 deletedRecordNames:(id)a4
{
  uint64_t v124 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v83 = a4;
  [MEMORY[0x1E4F29060] isMainThread];
  long long v108 = 0u;
  long long v109 = 0u;
  long long v110 = 0u;
  long long v111 = 0u;
  id v7 = [(FCPrivateDataController *)self observers];
  id v8 = (void *)[v7 copy];

  uint64_t v9 = [v8 countByEnumeratingWithState:&v108 objects:v115 count:16];
  if (v9)
  {
    uint64_t v10 = v9;
    uint64_t v11 = *(void *)v109;
    do
    {
      for (uint64_t i = 0; i != v10; ++i)
      {
        if (*(void *)v109 != v11) {
          objc_enumerationMutation(v8);
        }
        id v13 = *(void **)(*((void *)&v108 + 1) + 8 * i);
        if (objc_opt_respondsToSelector()) {
          [v13 subscriptionListWillStartSyncingRemoteChanges:self];
        }
      }
      uint64_t v10 = [v8 countByEnumeratingWithState:&v108 objects:v115 count:16];
    }
    while (v10);
  }

  long long v87 = objc_opt_new();
  long long v86 = objc_opt_new();
  long long v89 = objc_opt_new();
  long long v104 = 0u;
  long long v105 = 0u;
  long long v106 = 0u;
  long long v107 = 0u;
  obuint64_t j = v6;
  uint64_t v92 = [obj countByEnumeratingWithState:&v104 objects:v114 count:16];
  if (v92)
  {
    uint64_t v91 = *(void *)v105;
    long long v90 = self;
    do
    {
      uint64_t v14 = 0;
      do
      {
        if (*(void *)v105 != v91) {
          objc_enumerationMutation(obj);
        }
        id v15 = *(id *)(*((void *)&v104 + 1) + 8 * v14);
        id v16 = v15;
        if (!self)
        {
          char v40 = 0;
LABEL_59:

          goto LABEL_61;
        }
        id v17 = [v15 objectForKeyedSubscript:@"subscriptionType"];
        uint64_t v18 = [v16 objectForKeyedSubscript:@"subscriptionOrder"];
        id v19 = [v16 objectForKeyedSubscript:@"subscriptionOrigin"];
        uint64_t v20 = FCSubscriptionOriginFromFCCKSubscriptionOrigin([v19 unsignedIntegerValue]);
        id v21 = [v16 recordID];
        uint64_t v22 = [v21 recordName];

        if (!v17 && os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
        {
          uint64_t v56 = (void *)[[NSString alloc] initWithFormat:@"missing subscription type from record: %@", v16];
          *(_DWORD *)buf = 136315906;
          v117 = "-[FCSubscriptionList _subscriptionFromRecord:]";
          __int16 v118 = 2080;
          v119 = "FCSubscriptionList.m";
          __int16 v120 = 1024;
          int v121 = 985;
          __int16 v122 = 2114;
          v123 = v56;
          _os_log_error_impl(&dword_1A460D000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", buf, 0x26u);
        }
        uint64_t v23 = [v16 objectForKeyedSubscript:@"dateAdded"];
        id v24 = v23;
        id v94 = v19;
        id v95 = (void *)v18;
        uint64_t v25 = (void *)v22;
        if (v23)
        {
          id v26 = v23;
        }
        else
        {
          id v26 = [v16 creationDate];
        }
        id v93 = v26;

        uint64_t v27 = [v16 recordID];
        id v28 = [v27 zoneID];
        uint64_t v29 = [v28 zoneName];
        uint64_t v30 = [v29 isEqualToString:@"SensitiveSubscriptions"];

        if ([v17 isEqualToString:@"tag"])
        {
          uint64_t v31 = [v16 objectForKeyedSubscript:@"tagID"];
          uint64_t v32 = [v31 length];

          if (v32)
          {
            long long v33 = [v16 objectForKeyedSubscript:@"tagID"];
            long long v34 = [v16 objectForKeyedSubscript:@"notificationsEnabled"];
            uint64_t v80 = v30;
            LOBYTE(v79) = [v34 BOOLValue];
            __int16 v35 = v93;
            id v36 = v25;
            __int16 v37 = v95;
            +[FCSubscription subscriptionWithSubscriptionID:v25 tagID:v33 type:0 order:v95 origin:v20 groupID:0 dateAdded:v93 notificationsEnabled:v79 zone:v80];
            char v40 = LABEL_28:;

            goto LABEL_39;
          }
        }
        else if ([v17 isEqualToString:@"mutedTag"])
        {
          uint64_t v38 = [v16 objectForKeyedSubscript:@"tagID"];
          uint64_t v39 = [v38 length];

          if (v39)
          {
            long long v33 = [v16 objectForKeyedSubscript:@"tagID"];
            long long v34 = [v16 objectForKeyedSubscript:@"groupID"];
            uint64_t v81 = v30;
            LOBYTE(v79) = 0;
            __int16 v35 = v93;
            id v36 = v25;
            __int16 v37 = v95;
            +[FCSubscription subscriptionWithSubscriptionID:v25 tagID:v33 type:2 order:v95 origin:v20 groupID:v34 dateAdded:v93 notificationsEnabled:v79 zone:v81];
            goto LABEL_28;
          }
        }
        else if ([v17 isEqualToString:@"autoFavoriteTag"])
        {
          __int16 v41 = [v16 objectForKeyedSubscript:@"tagID"];
          uint64_t v42 = [v41 length];

          if (v42)
          {
            long long v33 = [v16 objectForKeyedSubscript:@"tagID"];
            uint64_t v82 = v30;
            LOBYTE(v79) = 0;
            __int16 v35 = v93;
            id v78 = v93;
            id v36 = v25;
            uint64_t v43 = v25;
            uint64_t v44 = v33;
            uint64_t v45 = 3;
            goto LABEL_38;
          }
        }
        else if ([v17 isEqualToString:@"groupableTag"])
        {
          v46 = [v16 objectForKeyedSubscript:@"tagID"];
          uint64_t v47 = [v46 length];

          if (v47)
          {
            long long v33 = [v16 objectForKeyedSubscript:@"tagID"];
            uint64_t v82 = v30;
            LOBYTE(v79) = 0;
            __int16 v35 = v93;
            id v78 = v93;
            id v36 = v25;
            uint64_t v43 = v25;
            uint64_t v44 = v33;
            uint64_t v45 = 4;
            goto LABEL_38;
          }
        }
        else if ([v17 isEqualToString:@"ignoredTag"])
        {
          v48 = [v16 objectForKeyedSubscript:@"tagID"];
          uint64_t v49 = [v48 length];

          if (v49)
          {
            long long v33 = [v16 objectForKeyedSubscript:@"tagID"];
            uint64_t v82 = v30;
            LOBYTE(v79) = 0;
            __int16 v35 = v93;
            id v78 = v93;
            id v36 = v25;
            uint64_t v43 = v25;
            uint64_t v44 = v33;
            uint64_t v45 = 5;
LABEL_38:
            __int16 v37 = v95;
            char v40 = +[FCSubscription subscriptionWithSubscriptionID:v43 tagID:v44 type:v45 order:v95 origin:v20 groupID:0 dateAdded:v78 notificationsEnabled:v79 zone:v82];
LABEL_39:

LABEL_40:
            id v50 = v94;
            goto LABEL_53;
          }
        }
        else
        {
          if (![v17 isEqualToString:@"pending"])
          {
            v57 = FCSubscriptionListLog;
            id v36 = v25;
            if (os_log_type_enabled((os_log_t)FCSubscriptionListLog, OS_LOG_TYPE_DEFAULT))
            {
              *(_DWORD *)buf = 138543618;
              v117 = v17;
              __int16 v118 = 2112;
              v119 = (char *)v16;
              _os_log_impl(&dword_1A460D000, v57, OS_LOG_TYPE_DEFAULT, "ignoring unrecognized subscription type '%{public}@' from record: %@", buf, 0x16u);
            }
            char v40 = 0;
            id v50 = v94;
            __int16 v37 = v95;
            goto LABEL_52;
          }
          id v51 = [v16 objectForKeyedSubscript:@"pollingURL"];
          v52 = [v16 objectForKeyedSubscript:@"url"];
          if ([v51 length] && objc_msgSend(v52, "length"))
          {
            [MEMORY[0x1E4F1CB10] URLWithString:v51];
            v53 = long long v85 = v51;
            [MEMORY[0x1E4F1CB10] URLWithString:v52];
            uint64_t v54 = v84 = v52;
            uint64_t v55 = [v16 objectForKeyedSubscript:@"title"];
            id v36 = v25;
            __int16 v35 = v93;
            char v40 = +[FCSubscription pendingSubscriptionWithSubscriptionID:v25 url:v54 title:v55 pollingURL:v53 dateAdded:v93];

            __int16 v37 = v95;
            goto LABEL_40;
          }
        }
        if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
        {
          id v61 = (void *)[[NSString alloc] initWithFormat:@"subscription record is missing metadata: %@", v16];
          *(_DWORD *)buf = 136315906;
          v117 = "-[FCSubscriptionList _subscriptionFromRecord:]";
          __int16 v118 = 2080;
          v119 = "FCSubscriptionList.m";
          __int16 v120 = 1024;
          int v121 = 1096;
          __int16 v122 = 2114;
          v123 = v61;
          _os_log_error_impl(&dword_1A460D000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", buf, 0x26u);
        }
        char v40 = 0;
        id v50 = v94;
        __int16 v37 = v95;
        id v36 = v25;
LABEL_52:
        __int16 v35 = v93;
LABEL_53:

        if (v40)
        {
          self = v90;
          if ([v40 isDeprecated]) {
            goto LABEL_61;
          }
          v58 = [v16 recordID];
          id v16 = [v58 recordName];

          id v59 = [(NSMutableDictionary *)v90->_mutableSubscriptionsBySubscriptionID objectForKey:v16];
          if (v59) {
            id v60 = v86;
          }
          else {
            id v60 = v87;
          }
          [v60 addObject:v40];

          goto LABEL_59;
        }
        self = v90;
LABEL_61:

        ++v14;
      }
      while (v92 != v14);
      uint64_t v62 = [obj countByEnumeratingWithState:&v104 objects:v114 count:16];
      uint64_t v92 = v62;
    }
    while (v62);
  }

  long long v102 = 0u;
  long long v103 = 0u;
  long long v100 = 0u;
  long long v101 = 0u;
  id v63 = v83;
  uint64_t v64 = [v63 countByEnumeratingWithState:&v100 objects:v113 count:16];
  if (v64)
  {
    uint64_t v65 = v64;
    uint64_t v66 = *(void *)v101;
    do
    {
      uint64_t v67 = 0;
      do
      {
        if (*(void *)v101 != v66) {
          objc_enumerationMutation(v63);
        }
        if (self) {
          mutableSubscriptionsBySubscriptionID = self->_mutableSubscriptionsBySubscriptionID;
        }
        else {
          mutableSubscriptionsBySubscriptionID = 0;
        }
        v69 = [(NSMutableDictionary *)mutableSubscriptionsBySubscriptionID objectForKey:*(void *)(*((void *)&v100 + 1) + 8 * v67)];
        if (v69) {
          [v89 addObject:v69];
        }

        ++v67;
      }
      while (v65 != v67);
      uint64_t v70 = [v63 countByEnumeratingWithState:&v100 objects:v113 count:16];
      uint64_t v65 = v70;
    }
    while (v70);
  }

  -[FCSubscriptionList _localAddSubscriptions:changeSubscriptions:removeSubscriptions:]((id *)&self->super.super.isa, v87, v86, v89);
  long long v98 = 0u;
  long long v99 = 0u;
  long long v96 = 0u;
  long long v97 = 0u;
  id v71 = [(FCPrivateDataController *)self observers];
  v72 = (void *)[v71 copy];

  uint64_t v73 = [v72 countByEnumeratingWithState:&v96 objects:v112 count:16];
  if (v73)
  {
    uint64_t v74 = v73;
    uint64_t v75 = *(void *)v97;
    do
    {
      for (uint64_t j = 0; j != v74; ++j)
      {
        if (*(void *)v97 != v75) {
          objc_enumerationMutation(v72);
        }
        long long v77 = *(void **)(*((void *)&v96 + 1) + 8 * j);
        if (objc_opt_respondsToSelector()) {
          [v77 subscriptionListDidStopSyncingRemoteChanges:self];
        }
      }
      uint64_t v74 = [v72 countByEnumeratingWithState:&v96 objects:v112 count:16];
    }
    while (v74);
  }
}

- (id)allKnownRecordNamesWithinRecordZoneWithID:(id)a3
{
  id v4 = (void *)MEMORY[0x1E4F29060];
  id v5 = a3;
  [v4 isMainThread];
  id v6 = [v5 zoneName];

  int v7 = [v6 isEqualToString:@"Subscriptions"];
  if (self) {
    mutableSubscriptionsBySubscriptionID = self->_mutableSubscriptionsBySubscriptionID;
  }
  else {
    mutableSubscriptionsBySubscriptionID = 0;
  }
  uint64_t v9 = [(NSMutableDictionary *)mutableSubscriptionsBySubscriptionID allValues];
  v12[0] = MEMORY[0x1E4F143A8];
  v12[1] = 3221225472;
  v12[2] = __64__FCSubscriptionList_allKnownRecordNamesWithinRecordZoneWithID___block_invoke;
  v12[3] = &__block_descriptor_40_e34___NSString_16__0__FCSubscription_8l;
  v12[4] = v7 ^ 1u;
  uint64_t v10 = objc_msgSend(v9, "fc_arrayByTransformingWithBlock:", v12);

  return v10;
}

id __64__FCSubscriptionList_allKnownRecordNamesWithinRecordZoneWithID___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  if ([v3 zone] == *(void *)(a1 + 32))
  {
    id v4 = [v3 subscriptionID];
  }
  else
  {
    id v4 = 0;
  }

  return v4;
}

- (void)handleSyncDidResetLocalDataForRecordZoneWithID:(id)a3
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v5 = [v4 zoneName];
  if (([v5 isEqualToString:@"Subscriptions"] & 1) == 0)
  {
LABEL_12:

    goto LABEL_13;
  }
  id v6 = [(FCSubscriptionList *)self allKnownRecordNamesWithinRecordZoneWithID:v4];
  uint64_t v7 = [v6 count];

  if (!v7)
  {
    long long v16 = 0u;
    long long v17 = 0u;
    long long v14 = 0u;
    long long v15 = 0u;
    id v8 = [(FCPrivateDataController *)self observers];
    id v5 = (void *)[v8 copy];

    uint64_t v9 = [v5 countByEnumeratingWithState:&v14 objects:v18 count:16];
    if (v9)
    {
      uint64_t v10 = v9;
      uint64_t v11 = *(void *)v15;
      do
      {
        uint64_t v12 = 0;
        do
        {
          if (*(void *)v15 != v11) {
            objc_enumerationMutation(v5);
          }
          id v13 = *(void **)(*((void *)&v14 + 1) + 8 * v12);
          if (objc_opt_respondsToSelector()) {
            [v13 subscriptionListDidResetToEmpty:self];
          }
          ++v12;
        }
        while (v10 != v12);
        uint64_t v10 = [v5 countByEnumeratingWithState:&v14 objects:v18 count:16];
      }
      while (v10);
    }
    goto LABEL_12;
  }
LABEL_13:
}

+ (BOOL)requiresPushNotificationSupport
{
  return 1;
}

+ (BOOL)requiresBatchedSync
{
  return 0;
}

+ (id)backingRecordZoneIDs
{
  v8[2] = *MEMORY[0x1E4F143B8];
  id v2 = objc_alloc(MEMORY[0x1E4F1A320]);
  uint64_t v3 = *MEMORY[0x1E4F19C08];
  id v4 = (void *)[v2 initWithZoneName:@"Subscriptions" ownerName:*MEMORY[0x1E4F19C08]];
  v8[0] = v4;
  id v5 = (void *)[objc_alloc(MEMORY[0x1E4F1A320]) initWithZoneName:@"SensitiveSubscriptions" ownerName:v3];
  v8[1] = v5;
  id v6 = [MEMORY[0x1E4F1C978] arrayWithObjects:v8 count:2];

  return v6;
}

+ (id)backingRecordIDs
{
  return (id)MEMORY[0x1E4F1CBF0];
}

+ (id)commandsToMergeLocalDataToCloud:(id)a3 privateDataDirectory:(id)a4
{
  uint64_t v38 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  uint64_t v27 = [MEMORY[0x1E4F1CA48] array];
  long long v28 = 0u;
  long long v29 = 0u;
  long long v30 = 0u;
  long long v31 = 0u;
  id v6 = [v5 allKeys];
  uint64_t v7 = [v6 countByEnumeratingWithState:&v28 objects:v37 count:16];
  if (v7)
  {
    uint64_t v9 = v7;
    uint64_t v10 = *(void *)v29;
    *(void *)&long long v8 = 138543618;
    long long v25 = v8;
    do
    {
      uint64_t v11 = 0;
      do
      {
        if (*(void *)v29 != v10) {
          objc_enumerationMutation(v6);
        }
        uint64_t v12 = *(void *)(*((void *)&v28 + 1) + 8 * v11);
        if ((objc_msgSend(a1, "isLocalStoreKeyInternal:", v12, v25) & 1) == 0)
        {
          objc_opt_class();
          id v13 = [v5 objectForKey:v12];
          if (v13)
          {
            if (objc_opt_isKindOfClass()) {
              long long v14 = v13;
            }
            else {
              long long v14 = 0;
            }
          }
          else
          {
            long long v14 = 0;
          }
          id v15 = v14;

          if (v15)
          {
            long long v16 = +[FCSubscription subscriptionWithSubscriptionID:v12 dictionaryRepresentation:v15];
            long long v17 = v16;
            if (v16 && ([v16 isDeprecated] & 1) == 0) {
              [v27 addObject:v17];
            }
LABEL_16:
          }
          else
          {
            uint64_t v18 = (void *)FCDefaultLog;
            if (os_log_type_enabled((os_log_t)FCDefaultLog, OS_LOG_TYPE_ERROR))
            {
              log = v18;
              uint64_t v19 = (objc_class *)objc_opt_class();
              uint64_t v20 = NSStringFromClass(v19);
              *(_DWORD *)buf = v25;
              long long v34 = v20;
              __int16 v35 = 2114;
              uint64_t v36 = v12;
              long long v17 = log;
              _os_log_error_impl(&dword_1A460D000, log, OS_LOG_TYPE_ERROR, "ERROR: %{public}@ is not a dictionary for key %{public}@", buf, 0x16u);

              goto LABEL_16;
            }
          }
        }
        ++v11;
      }
      while (v9 != v11);
      uint64_t v21 = [v6 countByEnumeratingWithState:&v28 objects:v37 count:16];
      uint64_t v9 = v21;
    }
    while (v21);
  }

  uint64_t v22 = [[FCModifySubscriptionsCommand alloc] initWithSubscriptions:v27 merge:1];
  uint64_t v32 = v22;
  uint64_t v23 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v32 count:1];

  return v23;
}

- (BOOL)canHelpRestoreZoneName:(id)a3
{
  id v3 = a3;
  if ([v3 isEqualToString:@"Subscriptions"]) {
    char v4 = 1;
  }
  else {
    char v4 = [v3 isEqualToString:@"SensitiveSubscriptions"];
  }

  return v4;
}

- (id)recordsForRestoringZoneName:(id)a3
{
  id v4 = a3;
  uint64_t v12 = 0;
  id v13 = &v12;
  uint64_t v14 = 0x3032000000;
  id v15 = __Block_byref_object_copy__40;
  long long v16 = __Block_byref_object_dispose__40;
  id v17 = 0;
  if ([v4 isEqualToString:@"Subscriptions"])
  {
    if (self) {
      itemsLocuint64_t k = self->_itemsLock;
    }
    else {
      itemsLocuint64_t k = 0;
    }
    id v6 = itemsLock;
    v11[0] = MEMORY[0x1E4F143A8];
    v11[1] = 3221225472;
    v11[2] = __50__FCSubscriptionList_recordsForRestoringZoneName___block_invoke;
    v11[3] = &unk_1E5B4C258;
    v11[4] = self;
    v11[5] = &v12;
    [(FCMTWriterLock *)v6 performReadSync:v11];
  }
  else
  {
    if (![v4 isEqualToString:@"SensitiveSubscriptions"]) {
      goto LABEL_10;
    }
    if (self) {
      uint64_t v7 = self->_itemsLock;
    }
    else {
      uint64_t v7 = 0;
    }
    id v6 = v7;
    v10[0] = MEMORY[0x1E4F143A8];
    v10[1] = 3221225472;
    v10[2] = __50__FCSubscriptionList_recordsForRestoringZoneName___block_invoke_3;
    v10[3] = &unk_1E5B4C258;
    v10[4] = self;
    v10[5] = &v12;
    [(FCMTWriterLock *)v6 performReadSync:v10];
  }

LABEL_10:
  long long v8 = objc_msgSend((id)v13[5], "fc_arrayByTransformingWithBlock:", &__block_literal_global_34);
  _Block_object_dispose(&v12, 8);

  return v8;
}

void __50__FCSubscriptionList_recordsForRestoringZoneName___block_invoke(uint64_t a1)
{
  id v2 = *(void **)(a1 + 32);
  if (v2) {
    id v2 = (void *)v2[19];
  }
  id v3 = v2;
  id v7 = [v3 allValues];
  uint64_t v4 = objc_msgSend(v7, "fc_arrayOfObjectsPassingTest:", &__block_literal_global_29_0);
  uint64_t v5 = *(void *)(*(void *)(a1 + 40) + 8);
  id v6 = *(void **)(v5 + 40);
  *(void *)(v5 + 40) = v4;
}

BOOL __50__FCSubscriptionList_recordsForRestoringZoneName___block_invoke_2(uint64_t a1, void *a2)
{
  return [a2 zone] == 0;
}

void __50__FCSubscriptionList_recordsForRestoringZoneName___block_invoke_3(uint64_t a1)
{
  id v2 = *(void **)(a1 + 32);
  if (v2) {
    id v2 = (void *)v2[19];
  }
  id v3 = v2;
  id v7 = [v3 allValues];
  uint64_t v4 = objc_msgSend(v7, "fc_arrayOfObjectsPassingTest:", &__block_literal_global_31_0);
  uint64_t v5 = *(void *)(*(void *)(a1 + 40) + 8);
  id v6 = *(void **)(v5 + 40);
  *(void *)(v5 + 40) = v4;
}

BOOL __50__FCSubscriptionList_recordsForRestoringZoneName___block_invoke_4(uint64_t a1, void *a2)
{
  return [a2 zone] == 1;
}

uint64_t __50__FCSubscriptionList_recordsForRestoringZoneName___block_invoke_5(uint64_t a1, void *a2)
{
  return [a2 asCKRecord];
}

void __116__FCSubscriptionList_addSubscriptionsForTagIDs_typeProvider_originProvider_groupID_notificationsEnabled_completion___block_invoke(uint64_t a1, void *a2)
{
  id v17 = a2;
  id v3 = +[FCSubscriptionList subscriptionIDForTagID:v17 type:(*(uint64_t (**)(void))(*(void *)(a1 + 64) + 16))()];
  uint64_t v4 = *(void *)(a1 + 32);
  if (v4) {
    uint64_t v5 = *(void **)(v4 + 152);
  }
  else {
    uint64_t v5 = 0;
  }
  id v6 = [v5 objectForKey:v3];

  if (v6)
  {
    [*(id *)(a1 + 56) addObject:v17];
  }
  else
  {
    uint64_t v7 = (*(uint64_t (**)(void))(*(void *)(a1 + 64) + 16))();
    long long v8 = -[FCSubscriptionList _newSubscriptionOrder](*(void **)(a1 + 32));
    uint64_t v9 = (*(uint64_t (**)(void))(*(void *)(a1 + 72) + 16))();
    uint64_t v10 = *(void *)(a1 + 40);
    uint64_t v11 = [MEMORY[0x1E4F1C9C8] date];
    uint64_t v12 = (void *)v11;
    BOOL v14 = (unint64_t)(v7 - 3) < 3 && *(void *)(a1 + 32) != 0;
    LOBYTE(v16) = *(unsigned char *)(a1 + 80);
    id v15 = +[FCSubscription subscriptionWithSubscriptionID:v3 tagID:v17 type:v7 order:v8 origin:v9 groupID:v10 dateAdded:v11 notificationsEnabled:v16 zone:v14];

    [*(id *)(a1 + 48) addObject:v15];
  }
}

- (void)_newSubscriptionOrder
{
  if (result)
  {
    uint64_t v1 = result;
    uint64_t v2 = -1000000000000000;
    id v3 = NSNumber;
    uint64_t v4 = [result orderedSubscribedTagIDs];
    uint64_t v5 = [v4 firstObject];

    if (v5)
    {
      uint64_t v6 = +[FCSubscriptionList subscriptionIDForTagID:v5 type:0];
      if (v6)
      {
        uint64_t v7 = (void *)v6;
        long long v8 = [v1 subscriptionsBySubscriptionID];
        uint64_t v9 = [v8 objectForKeyedSubscript:v7];
        uint64_t v10 = [v9 order];
        uint64_t v11 = [v10 longLongValue];

        uint64_t v2 = v11 - 1000000000000000;
      }
    }

    [v3 numberWithLongLong:v2];
    return objc_claimAutoreleasedReturnValue();
  }
  return result;
}

- (BOOL)addSubscriptionForTagID:(id)a3 type:(unint64_t)a4 origin:(unint64_t)a5 groupID:(id)a6 notificationsEnabled:(BOOL)a7
{
  uint64_t v39 = *MEMORY[0x1E4F143B8];
  id v12 = a3;
  id v13 = a6;
  [MEMORY[0x1E4F29060] isMainThread];
  if (!v12 && os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
  {
    uint64_t v27 = objc_msgSend([NSString alloc], "initWithFormat:", @"Invalid parameter not satisfying %s", "tagID != nil");
    *(_DWORD *)buf = 136315906;
    uint64_t v32 = "-[FCSubscriptionList addSubscriptionForTagID:type:origin:groupID:notificationsEnabled:]";
    __int16 v33 = 2080;
    long long v34 = "FCSubscriptionList.m";
    __int16 v35 = 1024;
    int v36 = 450;
    __int16 v37 = 2114;
    uint64_t v38 = v27;
    _os_log_error_impl(&dword_1A460D000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", buf, 0x26u);
  }
  BOOL v14 = +[FCSubscriptionList subscriptionIDForTagID:v12 type:a4];
  if (self) {
    mutableSubscriptionsBySubscriptionID = self->_mutableSubscriptionsBySubscriptionID;
  }
  else {
    mutableSubscriptionsBySubscriptionID = 0;
  }
  uint64_t v16 = [(NSMutableDictionary *)mutableSubscriptionsBySubscriptionID objectForKey:v14];

  if (!v16)
  {
    id v17 = -[FCSubscriptionList _newSubscriptionOrder](self);
    uint64_t v18 = [MEMORY[0x1E4F1C9C8] date];
    unint64_t v19 = a5;
    uint64_t v20 = (void *)v18;
    if (self) {
      BOOL v21 = a4 - 3 >= 3;
    }
    else {
      BOOL v21 = 1;
    }
    uint64_t v22 = !v21;
    LOBYTE(v28) = a7;
    uint64_t v23 = +[FCSubscription subscriptionWithSubscriptionID:v14 tagID:v12 type:a4 order:v17 origin:v19 groupID:v13 dateAdded:v18 notificationsEnabled:v28 zone:v22];

    long long v30 = v23;
    id v24 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v30 count:1];
    -[FCSubscriptionList _localAddSubscriptions:changeSubscriptions:removeSubscriptions:]((id *)&self->super.super.isa, v24, 0, 0);

    long long v29 = v23;
    long long v25 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v29 count:1];
    -[FCSubscriptionList _modifyRemoteSubscriptions:](self, v25);
  }
  return v16 == 0;
}

- (BOOL)addSubscriptionForTagID:(id)a3 type:(unint64_t)a4 origin:(unint64_t)a5 groupID:(id)a6
{
  return [(FCSubscriptionList *)self addSubscriptionForTagID:a3 type:a4 origin:a5 groupID:0 notificationsEnabled:0];
}

- (void)addSubscriptionsForTagIDs:(id)a3 typeProvider:(id)a4 originProvider:(id)a5 completion:(id)a6
{
  uint64_t v27 = *MEMORY[0x1E4F143B8];
  id v10 = a4;
  id v11 = a5;
  id v12 = (void (**)(id, id))a6;
  if (self)
  {
    id v13 = a3;
    BOOL v14 = objc_opt_new();
    [MEMORY[0x1E4F29060] isMainThread];
    if (!v13 && os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
    {
      uint64_t v18 = objc_msgSend([NSString alloc], "initWithFormat:", @"Invalid parameter not satisfying %s", "tagIDs != nil");
      *(_DWORD *)buf = 136315906;
      *(void *)&uint8_t buf[4] = "-[FCSubscriptionList addSubscriptionsForTagIDs:typeProvider:originProvider:groupID:notificati"
                           "onsEnabled:completion:]";
      *(_WORD *)&buf[12] = 2080;
      *(void *)&buf[14] = "FCSubscriptionList.m";
      *(_WORD *)&buf[22] = 1024;
      LODWORD(v20) = 406;
      WORD2(v20) = 2114;
      *(void *)((char *)&v20 + 6) = v18;
      _os_log_error_impl(&dword_1A460D000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", buf, 0x26u);
    }
    id v15 = objc_opt_new();
    *(void *)buf = MEMORY[0x1E4F143A8];
    *(void *)&buf[8] = 3221225472;
    *(void *)&buf[16] = __116__FCSubscriptionList_addSubscriptionsForTagIDs_typeProvider_originProvider_groupID_notificationsEnabled_completion___block_invoke;
    *(void *)&long long v20 = &unk_1E5B560A8;
    id v24 = v10;
    *((void *)&v20 + 1) = self;
    id v25 = v11;
    id v21 = 0;
    char v26 = 0;
    id v16 = v15;
    id v22 = v16;
    id v17 = v14;
    id v23 = v17;
    [v13 enumerateObjectsUsingBlock:buf];

    -[FCSubscriptionList _localAddSubscriptions:changeSubscriptions:removeSubscriptions:]((id *)&self->super.super.isa, v16, 0, 0);
    -[FCSubscriptionList _modifyRemoteSubscriptions:](self, v16);
    if (v12) {
      v12[2](v12, v17);
    }
  }
}

- (BOOL)addSubscriptionForTagID:(id)a3 type:(unint64_t)a4 origin:(unint64_t)a5
{
  return [(FCSubscriptionList *)self addSubscriptionForTagID:a3 type:a4 origin:a5 groupID:0];
}

- (BOOL)addSubscriptionForTagID:(id)a3 type:(unint64_t)a4
{
  return [(FCSubscriptionList *)self addSubscriptionForTagID:a3 type:a4 origin:0];
}

- (BOOL)appendSubscriptionForTagID:(id)a3 type:(unint64_t)a4
{
  uint64_t v41 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  [MEMORY[0x1E4F29060] isMainThread];
  if (!v6 && os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
  {
    char v26 = objc_msgSend([NSString alloc], "initWithFormat:", @"Invalid parameter not satisfying %s", "tagID != nil");
    *(_DWORD *)buf = 136315906;
    long long v34 = "-[FCSubscriptionList appendSubscriptionForTagID:type:]";
    __int16 v35 = 2080;
    int v36 = "FCSubscriptionList.m";
    __int16 v37 = 1024;
    int v38 = 513;
    __int16 v39 = 2114;
    char v40 = v26;
    _os_log_error_impl(&dword_1A460D000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", buf, 0x26u);
  }
  uint64_t v7 = +[FCSubscriptionList subscriptionIDForTagID:v6 type:a4];
  if (self) {
    mutableSubscriptionsBySubscriptionID = self->_mutableSubscriptionsBySubscriptionID;
  }
  else {
    mutableSubscriptionsBySubscriptionID = 0;
  }
  uint64_t v9 = [(NSMutableDictionary *)mutableSubscriptionsBySubscriptionID objectForKey:v7];

  if (!v9)
  {
    if (self)
    {
      uint64_t v10 = 1000000000000000;
      long long v30 = NSNumber;
      id v11 = [(FCSubscriptionList *)self orderedSubscribedTagIDs];
      id v12 = [v11 lastObject];

      if (v12)
      {
        uint64_t v13 = +[FCSubscriptionList subscriptionIDForTagID:v12 type:0];
        if (v13)
        {
          BOOL v14 = (void *)v13;
          long long v29 = [(FCSubscriptionList *)self subscriptionsBySubscriptionID];
          id v15 = [v29 objectForKeyedSubscript:v14];
          id v16 = [v15 order];
          uint64_t v28 = [v16 longLongValue];

          uint64_t v10 = v28 + 1000000000000000;
        }
      }

      id v17 = [v30 numberWithLongLong:v10];
    }
    else
    {
      id v17 = 0;
    }
    uint64_t v18 = [MEMORY[0x1E4F1C9C8] date];
    unint64_t v19 = (void *)v18;
    if (self) {
      BOOL v20 = a4 - 3 >= 3;
    }
    else {
      BOOL v20 = 1;
    }
    uint64_t v21 = !v20;
    LOBYTE(v27) = 0;
    id v22 = +[FCSubscription subscriptionWithSubscriptionID:v7 tagID:v6 type:a4 order:v17 origin:0 groupID:0 dateAdded:v18 notificationsEnabled:v27 zone:v21];

    uint64_t v32 = v22;
    id v23 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v32 count:1];
    -[FCSubscriptionList _localAddSubscriptions:changeSubscriptions:removeSubscriptions:]((id *)&self->super.super.isa, v23, 0, 0);

    long long v31 = v22;
    id v24 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v31 count:1];
    -[FCSubscriptionList _modifyRemoteSubscriptions:](self, v24);
  }
  return v9 == 0;
}

- (void)removeSubscriptionsForTagIDs:(id)a3 typeProvider:(id)a4 completion:(id)a5
{
  uint64_t v31 = *MEMORY[0x1E4F143B8];
  id v8 = a4;
  uint64_t v9 = (void (**)(id, id))a5;
  uint64_t v10 = (void *)MEMORY[0x1E4F29060];
  id v11 = a3;
  [v10 isMainThread];
  if (!v11 && os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
  {
    unint64_t v19 = objc_msgSend([NSString alloc], "initWithFormat:", @"Invalid parameter not satisfying %s", "tagIDs != nil");
    *(_DWORD *)buf = 136315906;
    id v24 = "-[FCSubscriptionList removeSubscriptionsForTagIDs:typeProvider:completion:]";
    __int16 v25 = 2080;
    char v26 = "FCSubscriptionList.m";
    __int16 v27 = 1024;
    int v28 = 541;
    __int16 v29 = 2114;
    long long v30 = v19;
    _os_log_error_impl(&dword_1A460D000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", buf, 0x26u);
  }
  id v12 = objc_opt_new();
  v20[0] = MEMORY[0x1E4F143A8];
  v20[1] = 3221225472;
  v20[2] = __75__FCSubscriptionList_removeSubscriptionsForTagIDs_typeProvider_completion___block_invoke;
  v20[3] = &unk_1E5B560D0;
  id v22 = v8;
  v20[4] = self;
  id v13 = v12;
  id v21 = v13;
  id v14 = v8;
  id v15 = objc_msgSend(v11, "fc_arrayByTransformingWithBlock:", v20);

  if ([v15 count])
  {
    -[FCSubscriptionList _localAddSubscriptions:changeSubscriptions:removeSubscriptions:]((id *)&self->super.super.isa, 0, 0, v15);
    id v16 = v15;
    id v17 = v16;
    if (self && [v16 count])
    {
      uint64_t v18 = [[FCRemoveSubscriptionsCommand alloc] initWithSubscriptions:v17];
      [(FCPrivateDataController *)self addCommandToCommandQueue:v18];
    }
  }
  if (v9) {
    v9[2](v9, v13);
  }
}

id __75__FCSubscriptionList_removeSubscriptionsForTagIDs_typeProvider_completion___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  uint64_t v4 = +[FCSubscriptionList subscriptionIDForTagID:v3 type:(*(uint64_t (**)(void))(*(void *)(a1 + 48) + 16))()];
  if (v4)
  {
    uint64_t v5 = *(void *)(a1 + 32);
    if (v5) {
      id v6 = *(void **)(v5 + 152);
    }
    else {
      id v6 = 0;
    }
    uint64_t v7 = [v6 objectForKey:v4];
  }
  else
  {
    [*(id *)(a1 + 40) addObject:v3];
    uint64_t v7 = 0;
  }

  return v7;
}

- (void)removeSubscriptionForTagID:(id)a3 type:(unint64_t)a4
{
  uint64_t v24 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  [MEMORY[0x1E4F29060] isMainThread];
  if (v6)
  {
    uint64_t v7 = +[FCSubscriptionList subscriptionIDForTagID:v6 type:a4];
    if (self) {
      mutableSubscriptionsBySubscriptionID = self->_mutableSubscriptionsBySubscriptionID;
    }
    else {
      mutableSubscriptionsBySubscriptionID = 0;
    }
    uint64_t v9 = mutableSubscriptionsBySubscriptionID;
    uint64_t v10 = [(NSMutableDictionary *)v9 objectForKey:v7];

    if (v10)
    {
      id v15 = v10;
      id v11 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v15 count:1];
      -[FCSubscriptionList _localAddSubscriptions:changeSubscriptions:removeSubscriptions:]((id *)&self->super.super.isa, 0, 0, v11);

      if (self)
      {
        id v12 = v10;
        id v13 = [[FCRemoveSubscriptionsCommand alloc] initWithSubscription:v12];

        [(FCPrivateDataController *)self addCommandToCommandQueue:v13];
      }
    }
  }
  else if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
  {
    id v14 = objc_msgSend([NSString alloc], "initWithFormat:", @"Invalid parameter not satisfying %s", "tagID != nil");
    *(_DWORD *)buf = 136315906;
    id v17 = "-[FCSubscriptionList removeSubscriptionForTagID:type:]";
    __int16 v18 = 2080;
    unint64_t v19 = "FCSubscriptionList.m";
    __int16 v20 = 1024;
    int v21 = 575;
    __int16 v22 = 2114;
    id v23 = v14;
    _os_log_error_impl(&dword_1A460D000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", buf, 0x26u);
  }
}

- (BOOL)canAddSubscription
{
  uint64_t v2 = [(FCSubscriptionList *)self subscribedTagIDs];
  BOOL v3 = (unint64_t)[v2 count] < 0xFA;

  return v3;
}

- (BOOL)hasSubscriptionForTagID:(id)a3
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if (!v4 && os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
  {
    id v8 = objc_msgSend([NSString alloc], "initWithFormat:", @"Invalid parameter not satisfying %s", "tagID != nil");
    *(_DWORD *)buf = 136315906;
    uint64_t v10 = "-[FCSubscriptionList hasSubscriptionForTagID:]";
    __int16 v11 = 2080;
    id v12 = "FCSubscriptionList.m";
    __int16 v13 = 1024;
    int v14 = 674;
    __int16 v15 = 2114;
    id v16 = v8;
    _os_log_error_impl(&dword_1A460D000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", buf, 0x26u);
  }
  uint64_t v5 = [(FCSubscriptionList *)self subscribedTagIDs];
  char v6 = [v5 containsObject:v4];

  return v6;
}

- (id)subscriptionForTagIDOfAnyType:(id)a3
{
  id v4 = a3;
  uint64_t v14 = 0;
  __int16 v15 = &v14;
  uint64_t v16 = 0x3032000000;
  uint64_t v17 = __Block_byref_object_copy__40;
  __int16 v18 = __Block_byref_object_dispose__40;
  id v19 = 0;
  if (v4)
  {
    if (self) {
      itemsLocuint64_t k = self->_itemsLock;
    }
    else {
      itemsLocuint64_t k = 0;
    }
    char v6 = itemsLock;
    v10[0] = MEMORY[0x1E4F143A8];
    v10[1] = 3221225472;
    v10[2] = __52__FCSubscriptionList_subscriptionForTagIDOfAnyType___block_invoke;
    v10[3] = &unk_1E5B56120;
    id v12 = self;
    __int16 v13 = &v14;
    id v11 = v4;
    [(FCMTWriterLock *)v6 performReadSync:v10];

    uint64_t v7 = (void *)v15[5];
  }
  else
  {
    uint64_t v7 = 0;
  }
  id v8 = v7;
  _Block_object_dispose(&v14, 8);

  return v8;
}

void __52__FCSubscriptionList_subscriptionForTagIDOfAnyType___block_invoke(uint64_t a1)
{
  uint64_t v2 = FCSubscriptionTypes();
  v3[0] = MEMORY[0x1E4F143A8];
  v3[1] = 3221225472;
  v3[2] = __52__FCSubscriptionList_subscriptionForTagIDOfAnyType___block_invoke_2;
  v3[3] = &unk_1E5B560F8;
  id v4 = *(id *)(a1 + 32);
  long long v5 = *(_OWORD *)(a1 + 40);
  [v2 enumerateObjectsUsingBlock:v3];
}

void __52__FCSubscriptionList_subscriptionForTagIDOfAnyType___block_invoke_2(void *a1, void *a2, uint64_t a3, BOOL *a4)
{
  +[FCSubscriptionList subscriptionIDForTagID:type:](FCSubscriptionList, "subscriptionIDForTagID:type:", a1[4], [a2 unsignedIntegerValue]);
  id v11 = (id)objc_claimAutoreleasedReturnValue();
  char v6 = (void *)a1[5];
  if (v6) {
    char v6 = (void *)v6[19];
  }
  uint64_t v7 = v6;
  uint64_t v8 = [v7 objectForKeyedSubscript:v11];
  uint64_t v9 = *(void *)(a1[6] + 8);
  uint64_t v10 = *(void **)(v9 + 40);
  *(void *)(v9 + 40) = v8;

  *a4 = *(void *)(*(void *)(a1[6] + 8) + 40) != 0;
}

- (id)subscriptionForTagID:(id)a3
{
  return [(FCSubscriptionList *)self subscriptionForTagID:a3 type:0];
}

- (NSSet)allSubscribedTagIDs
{
  uint64_t v8 = 0;
  uint64_t v9 = &v8;
  uint64_t v10 = 0x3032000000;
  id v11 = __Block_byref_object_copy__40;
  id v12 = __Block_byref_object_dispose__40;
  id v13 = 0;
  if (self) {
    itemsLocuint64_t k = self->_itemsLock;
  }
  else {
    itemsLocuint64_t k = 0;
  }
  id v4 = itemsLock;
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __41__FCSubscriptionList_allSubscribedTagIDs__block_invoke;
  v7[3] = &unk_1E5B4C258;
  v7[4] = self;
  v7[5] = &v8;
  [(FCMTWriterLock *)v4 performReadSync:v7];

  id v5 = (id)v9[5];
  _Block_object_dispose(&v8, 8);

  return (NSSet *)v5;
}

void __41__FCSubscriptionList_allSubscribedTagIDs__block_invoke(uint64_t a1)
{
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __41__FCSubscriptionList_allSubscribedTagIDs__block_invoke_2;
  v5[3] = &unk_1E5B4C2F0;
  v5[4] = *(void *)(a1 + 32);
  uint64_t v2 = objc_msgSend(MEMORY[0x1E4F1CAD0], "fc_set:", v5);
  uint64_t v3 = *(void *)(*(void *)(a1 + 40) + 8);
  id v4 = *(void **)(v3 + 40);
  *(void *)(v3 + 40) = v2;
}

void __41__FCSubscriptionList_allSubscribedTagIDs__block_invoke_2(uint64_t a1, void *a2)
{
  id v8 = a2;
  uint64_t v3 = *(void *)(a1 + 32);
  if (v3)
  {
    id v4 = *(id *)(v3 + 112);
    if (v4) {
      [v8 unionSet:v4];
    }
    uint64_t v5 = *(void *)(a1 + 32);
    if (v5)
    {
      id v6 = *(id *)(v5 + 128);
      if (v6)
      {
        uint64_t v7 = v6;
        [v8 unionSet:v6];
      }
    }
  }
  else
  {
    id v4 = 0;
  }
}

- (BOOL)hasNotificationsEnabledForTagID:(id)a3
{
  uint64_t v3 = [(FCSubscriptionList *)self subscriptionForTagID:a3];
  char v4 = [v3 notificationsEnabled];

  return v4;
}

- (BOOL)setNotificationsEnabled:(BOOL)a3 forTagID:(id)a4
{
  uint64_t v35 = *MEMORY[0x1E4F143B8];
  id v6 = a4;
  [MEMORY[0x1E4F29060] isMainThread];
  if (v6)
  {
    uint64_t v7 = +[FCSubscriptionList subscriptionIDForTagID:v6 type:0];
    if (self) {
      mutableSubscriptionsBySubscriptionID = self->_mutableSubscriptionsBySubscriptionID;
    }
    else {
      mutableSubscriptionsBySubscriptionID = 0;
    }
    uint64_t v9 = [(NSMutableDictionary *)mutableSubscriptionsBySubscriptionID objectForKey:v7];
    uint64_t v10 = v9;
    BOOL v11 = v9 != 0;
    if (v9)
    {
      id v12 = [v9 subscriptionID];
      id v13 = [v10 tagID];
      uint64_t v14 = [v10 order];
      uint64_t v24 = v7;
      uint64_t v15 = [v10 subscriptionOrigin];
      [v10 dateAdded];
      uint64_t v16 = v23 = v11;
      LOBYTE(v22) = a3;
      uint64_t v17 = +[FCSubscription subscriptionWithSubscriptionID:v12 tagID:v13 type:0 order:v14 origin:v15 groupID:0 dateAdded:v16 notificationsEnabled:v22 zone:0];

      char v26 = v17;
      __int16 v18 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v26 count:1];
      -[FCSubscriptionList _localAddSubscriptions:changeSubscriptions:removeSubscriptions:]((id *)&self->super.super.isa, 0, v18, 0);

      __int16 v25 = v17;
      BOOL v11 = v23;
      id v19 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v25 count:1];
      -[FCSubscriptionList _modifyRemoteSubscriptions:](self, v19);

      uint64_t v7 = v24;
    }
  }
  else
  {
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
    {
      int v21 = objc_msgSend([NSString alloc], "initWithFormat:", @"Invalid parameter not satisfying %s", "tagID != nil");
      *(_DWORD *)buf = 136315906;
      int v28 = "-[FCSubscriptionList setNotificationsEnabled:forTagID:]";
      __int16 v29 = 2080;
      long long v30 = "FCSubscriptionList.m";
      __int16 v31 = 1024;
      int v32 = 749;
      __int16 v33 = 2114;
      long long v34 = v21;
      _os_log_error_impl(&dword_1A460D000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", buf, 0x26u);
    }
    BOOL v11 = 0;
  }

  return v11;
}

- (BOOL)hasIgnoredSubscriptionForTagID:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [(FCSubscriptionList *)self ignoredTagIDs];
  char v6 = [v5 containsObject:v4];

  return v6;
}

- (BOOL)hasAutoFavoriteSubscriptionForTagID:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [(FCSubscriptionList *)self autoFavoriteTagIDs];
  char v6 = [v5 containsObject:v4];

  return v6;
}

- (BOOL)moveSubscriptionForTagID:(id)a3 toIndex:(unint64_t)a4
{
  id v6 = a3;
  [MEMORY[0x1E4F29060] isMainThread];
  uint64_t v7 = [(FCSubscriptionList *)self subscribedTagIDs];
  unint64_t v8 = [v7 count];

  if (v6) {
    BOOL v9 = v8 > a4;
  }
  else {
    BOOL v9 = 0;
  }
  BOOL v10 = v9;
  if (v10)
  {
    BOOL v11 = [(FCSubscriptionList *)self orderedSubscribedTagIDs];
    id v12 = (void *)[v11 mutableCopy];

    id v13 = (void *)MEMORY[0x1E4F1C978];
    v19[0] = MEMORY[0x1E4F143A8];
    v19[1] = 3221225472;
    v19[2] = __55__FCSubscriptionList_moveSubscriptionForTagID_toIndex___block_invoke;
    v19[3] = &unk_1E5B56148;
    id v20 = v12;
    uint64_t v22 = self;
    unint64_t v23 = a4;
    id v21 = v6;
    id v14 = v12;
    uint64_t v15 = objc_msgSend(v13, "fc_array:", v19);
    uint64_t v16 = -[FCTagSubscriptionOrderAssigner initWithInitialOrder:orderSpacing:]([FCTagSubscriptionOrderAssigner alloc], 0, 1000000000000000);
    uint64_t v17 = -[FCTagSubscriptionOrderAssigner assignOrderToTagSubscriptions:](v16, v15);
    -[FCSubscriptionList _localAddSubscriptions:changeSubscriptions:removeSubscriptions:]((id *)&self->super.super.isa, 0, v17, 0);
    -[FCSubscriptionList _modifyRemoteSubscriptions:](self, v17);
  }
  return v10;
}

void __55__FCSubscriptionList_moveSubscriptionForTagID_toIndex___block_invoke(uint64_t a1, void *a2)
{
  id v11 = a2;
  [*(id *)(a1 + 32) removeObject:*(void *)(a1 + 40)];
  [*(id *)(a1 + 32) insertObject:*(void *)(a1 + 40) atIndex:*(void *)(a1 + 56)];
  uint64_t v3 = *(void *)(a1 + 56);
  if (v3)
  {
    id v4 = [*(id *)(a1 + 32) objectAtIndex:v3 - 1];
    uint64_t v5 = [*(id *)(a1 + 48) subscriptionForTagID:v4];
    [v11 addObject:v5];
  }
  id v6 = [*(id *)(a1 + 48) subscriptionForTagID:*(void *)(a1 + 40)];
  uint64_t v7 = (void *)[v6 copyWithOrder:0];
  [v11 addObject:v7];
  uint64_t v8 = *(void *)(a1 + 56) + 1;
  if (v8 != [*(id *)(a1 + 32) count])
  {
    BOOL v9 = [*(id *)(a1 + 32) objectAtIndex:*(void *)(a1 + 56) + 1];
    BOOL v10 = [*(id *)(a1 + 48) subscriptionForTagID:v9];
    [v11 addObject:v10];
  }
}

- (void)reorderSubscriptionOrderForOrderedIdentifiers:(id)a3
{
  id v4 = a3;
  [MEMORY[0x1E4F29060] isMainThread];
  v15[0] = MEMORY[0x1E4F143A8];
  v15[1] = 3221225472;
  v15[2] = __68__FCSubscriptionList_reorderSubscriptionOrderForOrderedIdentifiers___block_invoke;
  v15[3] = &unk_1E5B56170;
  v15[4] = self;
  uint64_t v5 = objc_msgSend(v4, "fc_arrayByTransformingWithBlock:", v15);
  id v6 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  if ([v5 count])
  {
    uint64_t v7 = 0;
    unint64_t v8 = 0;
    do
    {
      BOOL v9 = [v5 objectAtIndexedSubscript:v8];
      BOOL v10 = [v9 order];
      id v11 = [NSNumber numberWithUnsignedInteger:v7];
      char v12 = [v10 isEqualToNumber:v11];

      if ((v12 & 1) == 0)
      {
        id v13 = [NSNumber numberWithUnsignedInteger:v7];
        id v14 = (void *)[v9 copyWithOrder:v13];

        [v6 addObject:v14];
      }

      ++v8;
      v7 += 1000000000000000;
    }
    while (v8 < [v5 count]);
  }
  if ([v6 count])
  {
    -[FCSubscriptionList _localAddSubscriptions:changeSubscriptions:removeSubscriptions:]((id *)&self->super.super.isa, 0, v6, 0);
    -[FCSubscriptionList _modifyRemoteSubscriptions:](self, v6);
  }
}

uint64_t __68__FCSubscriptionList_reorderSubscriptionOrderForOrderedIdentifiers___block_invoke(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 32) subscriptionForTagID:a2];
}

void __68__FCSubscriptionList__assignOrderToTagSubscriptions_withCompletion___block_invoke(uint64_t a1)
{
  uint64_t v2 = *(void **)(a1 + 32);
  v3[0] = MEMORY[0x1E4F143A8];
  v3[1] = 3221225472;
  v3[2] = __68__FCSubscriptionList__assignOrderToTagSubscriptions_withCompletion___block_invoke_2;
  v3[3] = &unk_1E5B4E088;
  id v4 = v2;
  id v5 = *(id *)(a1 + 40);
  id v6 = *(id *)(a1 + 48);
  [v4 prepareForUseWithCompletionHandler:v3];
}

void __68__FCSubscriptionList__assignOrderToTagSubscriptions_withCompletion___block_invoke_2(void **a1)
{
  uint64_t v2 = -[FCTagSubscriptionSorter initWithTagRanker:]((id *)[FCTagSubscriptionSorter alloc], a1[4]);
  uint64_t v3 = -[FCTagSubscriptionSorter sortTagSubscriptions:]((uint64_t)v2, a1[5]);
  id v4 = -[FCTagSubscriptionOrderAssigner initWithInitialOrder:orderSpacing:]([FCTagSubscriptionOrderAssigner alloc], 0, 1000000000000000);
  id v5 = -[FCTagSubscriptionOrderAssigner assignOrderToTagSubscriptions:](v4, v3);
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __68__FCSubscriptionList__assignOrderToTagSubscriptions_withCompletion___block_invoke_3;
  void v8[3] = &unk_1E5B4C7C0;
  id v6 = a1[6];
  id v9 = v5;
  id v10 = v6;
  id v7 = v5;
  FCPerformBlockOnMainThread(v8);
}

uint64_t __68__FCSubscriptionList__assignOrderToTagSubscriptions_withCompletion___block_invoke_3(uint64_t a1)
{
  return (*(uint64_t (**)(void, void))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40), *(void *)(a1 + 32));
}

uint64_t __85__FCSubscriptionList__localAddSubscriptions_changeSubscriptions_removeSubscriptions___block_invoke(uint64_t a1, void *a2)
{
  return [a2 tagID];
}

void __85__FCSubscriptionList__localAddSubscriptions_changeSubscriptions_removeSubscriptions___block_invoke_2(uint64_t a1, uint64_t a2, void *a3)
{
  id v4 = a3;
  id v5 = *(void **)(a1 + 32);
  id v7 = v4;
  id v6 = [v4 tagID];
  LODWORD(v5) = [v5 containsObject:v6];

  if (v5) {
    [*(id *)(a1 + 40) addObject:v7];
  }
}

uint64_t __85__FCSubscriptionList__localAddSubscriptions_changeSubscriptions_removeSubscriptions___block_invoke_3(uint64_t a1, void *a2)
{
  return [a2 subscriptionID];
}

void __85__FCSubscriptionList__localAddSubscriptions_changeSubscriptions_removeSubscriptions___block_invoke_4(uint64_t a1, void *a2, void *a3)
{
  id v10 = a2;
  id v5 = a3;
  id v6 = *(void **)(a1 + 32);
  id v7 = [v5 tagID];
  if ([v6 containsObject:v7])
  {
    unint64_t v8 = [*(id *)(a1 + 40) objectForKeyedSubscript:v10];

    if (v8) {
      goto LABEL_5;
    }
    id v9 = *(void **)(a1 + 48);
    id v7 = [v5 subscriptionID];
    [v9 addObject:v7];
  }

LABEL_5:
}

uint64_t __85__FCSubscriptionList__localAddSubscriptions_changeSubscriptions_removeSubscriptions___block_invoke_5(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = [v3 dictionaryRepresentation];
  id v5 = [v3 subscriptionID];
  if ([v3 subscriptionType] == 1) {
    goto LABEL_5;
  }
  id v6 = objc_opt_class();
  id v7 = [v3 tagID];
  unint64_t v8 = objc_msgSend(v6, "subscriptionIDForTagID:type:", v7, objc_msgSend(v3, "subscriptionType"));
  int v9 = [v5 isEqualToString:v8];

  if (!v9) {
    goto LABEL_5;
  }
  id v10 = *(void **)(a1 + 40);
  id v11 = [v3 subscriptionID];
  char v12 = [v10 objectForKeyedSubscript:v11];

  if (v12)
  {
    [*(id *)(a1 + 48) setObject:v4 forKeyedSubscript:v5];
    [*(id *)(a1 + 56) setObject:v3 forKeyedSubscript:v5];
    uint64_t v13 = 1;
  }
  else
  {
LABEL_5:
    uint64_t v13 = 0;
  }

  return v13;
}

void __85__FCSubscriptionList__localAddSubscriptions_changeSubscriptions_removeSubscriptions___block_invoke_85(uint64_t a1)
{
  -[FCSubscriptionList setMutableSubscriptionsBySubscriptionID:](*(void *)(a1 + 32), *(void **)(a1 + 40));
  uint64_t v2 = *(id **)(a1 + 32);
  -[FCSubscriptionList _regenerateSortedSubscriptions](v2);
}

uint64_t __52__FCSubscriptionList__regenerateSortedSubscriptions__block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  id v5 = *(void **)(a1 + 32);
  id v6 = a3;
  id v7 = +[FCSubscriptionList subscriptionIDForTagID:a2 type:0];
  unint64_t v8 = [v5 objectForKeyedSubscript:v7];

  int v9 = *(void **)(a1 + 32);
  id v10 = +[FCSubscriptionList subscriptionIDForTagID:v6 type:0];

  id v11 = [v9 objectForKeyedSubscript:v10];

  char v12 = [v8 order];
  uint64_t v13 = [v11 order];
  id v14 = (void *)v13;
  if (v12) {
    BOOL v15 = v13 == 0;
  }
  else {
    BOOL v15 = 1;
  }
  if (v15)
  {
    if (v12) {
      uint64_t v16 = -1;
    }
    else {
      uint64_t v16 = 1;
    }
  }
  else
  {
    uint64_t v17 = [v12 compare:v13];
    uint64_t v16 = v17;
    if (!v17)
    {
      __int16 v18 = [v8 tagID];
      id v19 = [v11 tagID];
      uint64_t v16 = [v18 compare:v19];
    }
  }

  return v16;
}

- (id)t_reconcileSubscriptions:(id)a3
{
  return -[FCSubscriptionList _reconcileSubscriptions:]((uint64_t)self, a3);
}

id __60__FCSubscriptionList_configureKeyValueStoreForJSONHandling___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v4 = a2;
  id v5 = a3;
  objc_opt_class();
  if (v4)
  {
    if (objc_opt_isKindOfClass()) {
      id v6 = v4;
    }
    else {
      id v6 = 0;
    }
  }
  else
  {
    id v6 = 0;
  }
  id v7 = v6;
  int v8 = [v7 isEqualToString:@"subscriptionOrigin"];

  if (v8)
  {
    NSStringFromFCSubscriptionOrigin([v5 unsignedIntegerValue]);
    id v9 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    objc_opt_class();
    if (v4)
    {
      if (objc_opt_isKindOfClass()) {
        id v10 = v4;
      }
      else {
        id v10 = 0;
      }
    }
    else
    {
      id v10 = 0;
    }
    id v11 = v10;
    int v12 = [v11 isEqualToString:@"subscriptionType"];

    if (v12)
    {
      NSStringFromFCSubscriptionType([v5 unsignedIntegerValue]);
      id v9 = (id)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      id v9 = v5;
    }
  }
  uint64_t v13 = v9;

  return v13;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_itemsLock, 0);
  objc_storeStrong((id *)&self->_mutableSubscriptionsBySubscriptionID, 0);
  objc_storeStrong((id *)&self->_ignoredTagIDsInternal, 0);
  objc_storeStrong((id *)&self->_groupableTagIDsInternal, 0);
  objc_storeStrong((id *)&self->_autoFavoriteTagIDsInternal, 0);
  objc_storeStrong((id *)&self->_mutedTagIDsInternal, 0);
  objc_storeStrong((id *)&self->_subscribedTagIDsInternal, 0);
  objc_storeStrong((id *)&self->_orderedSubscribedTagIDsInternal, 0);
  objc_storeStrong((id *)&self->_subscribedTagRanker, 0);
}

@end