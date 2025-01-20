@interface SYItemIndexingManager
+ (id)_coreSpotlightIndexBundleID;
+ (id)_customKeyForKey:(id)a3;
+ (id)_postFilteredItems:(id)a3 matchingUserActivityInfo:(id)a4;
+ (id)_queryStringForMatchingUserActivityInfo:(id)a3;
+ (id)searchableItemLinkingContentItem:(id)a3 toContainerIdentifier:(id)a4 relatedIdentifier:(id)a5 domainIdentifier:(id)a6;
+ (id)searchableItemLinkingContentItem:(id)a3 toContainerIdentifier:(id)a4 uniqueIdentifier:(id)a5 relatedIdentifier:(id)a6 domainIdentifier:(id)a7;
+ (void)_fetchIndexedActivitiesWithActivityType:(id)a3 completion:(id)a4;
+ (void)_fetchIndexedItemsLinkedToUserActivity:(id)a3 extraFetchAttributes:(id)a4 completion:(id)a5;
+ (void)fetchActivitiesWithActivityType:(id)a3 completion:(id)a4;
+ (void)fetchIdentifiersLinkedToUserActivity:(id)a3 completion:(id)a4;
+ (void)fetchLinkContextsDataForUserActivity:(id)a3 completion:(id)a4;
+ (void)indexedContentItemsDidChange;
+ (void)setUseLocalSearchIndex;
@end

@implementation SYItemIndexingManager

+ (id)_customKeyForKey:(id)a3
{
  uint64_t v3 = _customKeyForKey__onceTokenCustomAttributeKeys;
  id v4 = a3;
  if (v3 != -1) {
    dispatch_once(&_customKeyForKey__onceTokenCustomAttributeKeys, &__block_literal_global_9);
  }
  v5 = [(id)_customKeyForKey___customAttributeKeys objectForKeyedSubscript:v4];

  return v5;
}

void __42__SYItemIndexingManager__customKeyForKey___block_invoke()
{
  v9[6] = *MEMORY[0x1E4F143B8];
  v8[0] = @"sy_isLinkItem";
  v0 = (void *)[objc_alloc(MEMORY[0x1E4F237C0]) initWithKeyName:@"sy_isLinkItem" searchable:1 searchableByDefault:0 unique:0 multiValued:0];
  v9[0] = v0;
  v8[1] = @"sy_activityType";
  v1 = (void *)[objc_alloc(MEMORY[0x1E4F237C0]) initWithKeyName:@"sy_activityType" searchable:1 searchableByDefault:0 unique:0 multiValued:0];
  v9[1] = v1;
  v8[2] = @"sy_canonicalURL";
  v2 = (void *)[objc_alloc(MEMORY[0x1E4F237C0]) initWithKeyName:@"sy_canonicalURL" searchable:1 searchableByDefault:0 unique:0 multiValued:0];
  v9[2] = v2;
  v8[3] = @"sy_activityPersistentID";
  uint64_t v3 = (void *)[objc_alloc(MEMORY[0x1E4F237C0]) initWithKeyName:@"sy_activityPersistentID" searchable:1 searchableByDefault:0 unique:0 multiValued:0];
  v9[3] = v3;
  v8[4] = @"sy_activityTargetContentID";
  id v4 = (void *)[objc_alloc(MEMORY[0x1E4F237C0]) initWithKeyName:@"sy_activityTargetContentID" searchable:1 searchableByDefault:0 unique:0 multiValued:0];
  v9[4] = v4;
  v8[5] = @"sy_linkContextInfoData";
  v5 = (void *)[objc_alloc(MEMORY[0x1E4F237C0]) initWithKeyName:@"sy_linkContextInfoData" searchable:0 searchableByDefault:0 unique:0 multiValued:0];
  v9[5] = v5;
  uint64_t v6 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v9 forKeys:v8 count:6];
  v7 = (void *)_customKeyForKey___customAttributeKeys;
  _customKeyForKey___customAttributeKeys = v6;
}

+ (id)searchableItemLinkingContentItem:(id)a3 toContainerIdentifier:(id)a4 uniqueIdentifier:(id)a5 relatedIdentifier:(id)a6 domainIdentifier:(id)a7
{
  id v13 = a3;
  id v14 = a4;
  id v15 = a5;
  id v16 = a6;
  id v17 = a7;
  if (v13)
  {
    if (v14) {
      goto LABEL_3;
    }
LABEL_6:
    v20 = [MEMORY[0x1E4F28B00] currentHandler];
    [v20 handleFailureInMethod:a2, a1, @"SYItemIndexingManager.m", 148, @"Invalid parameter not satisfying: %@", @"containerIdentifier" object file lineNumber description];

    if (v15) {
      goto LABEL_4;
    }
    goto LABEL_7;
  }
  v19 = [MEMORY[0x1E4F28B00] currentHandler];
  [v19 handleFailureInMethod:a2, a1, @"SYItemIndexingManager.m", 147, @"Invalid parameter not satisfying: %@", @"contentItem" object file lineNumber description];

  if (!v14) {
    goto LABEL_6;
  }
LABEL_3:
  if (v15)
  {
LABEL_4:
    id v18 = v15;
    goto LABEL_8;
  }
LABEL_7:
  v21 = [v13 itemIdentifier];
  id v18 = [v21 UUIDString];

LABEL_8:
  id v22 = objc_alloc(MEMORY[0x1E4F23850]);
  v23 = (void *)[v22 initWithContentType:*MEMORY[0x1E4F44408]];
  v24 = [v13 displayTitle];
  [v23 setDisplayName:v24];

  [v23 setIdentifier:v18];
  v25 = +[SYItemIndexingManager _customKeyForKey:@"sy_isLinkItem"];
  uint64_t v26 = MEMORY[0x1E4F1CC38];
  [v23 setValue:MEMORY[0x1E4F1CC38] forCustomKey:v25];

  [v23 setTrashed:v26];
  [v23 setContainerIdentifier:v14];
  [v23 setRelatedUniqueIdentifier:v16];
  [v23 setDeletedWithRelatedUniqueIdentifier:v26];
  uint64_t v27 = [v13 activityType];
  v28 = (void *)v27;
  v29 = &stru_1F1E16740;
  if (v27) {
    v29 = (__CFString *)v27;
  }
  v30 = v29;

  v31 = +[SYItemIndexingManager _customKeyForKey:@"sy_activityType"];
  [v23 setValue:v30 forCustomKey:v31];

  v32 = [v13 itemURL];
  [v23 setURL:v32];

  v33 = [v13 activityCanonicalURL];

  if (v33)
  {
    v34 = [v13 activityCanonicalURL];
    v35 = [v34 absoluteString];

    v36 = +[SYItemIndexingManager _customKeyForKey:@"sy_canonicalURL"];
    [v23 setValue:v35 forCustomKey:v36];
  }
  v37 = [v13 activityPersistentIdentifier];
  uint64_t v38 = [v37 length];

  if (v38)
  {
    v39 = [v13 activityPersistentIdentifier];
    v40 = +[SYItemIndexingManager _customKeyForKey:@"sy_activityPersistentID"];
    [v23 setValue:v39 forCustomKey:v40];
  }
  v41 = [v13 activityTargetContentIdentifier];
  uint64_t v42 = [v41 length];

  if (v42)
  {
    v43 = [v13 activityTargetContentIdentifier];
    v44 = +[SYItemIndexingManager _customKeyForKey:@"sy_activityTargetContentID"];
    [v23 setValue:v43 forCustomKey:v44];
  }
  v45 = [v13 userActivity];
  v46 = [v45 _linkContextInfo];

  if (v46)
  {
    id v57 = v18;
    id v58 = 0;
    id v47 = v17;
    id v48 = v14;
    id v49 = v15;
    id v50 = v16;
    v51 = [MEMORY[0x1E4F28DB0] archivedDataWithRootObject:v46 requiringSecureCoding:1 error:&v58];
    id v52 = v58;
    if (v51)
    {
      v53 = +[SYItemIndexingManager _customKeyForKey:@"sy_linkContextInfoData"];
      [v23 setValue:v51 forCustomKey:v53];
    }
    else
    {
      v53 = os_log_create("com.apple.synapse", "ItemIndexing");
      if (os_log_type_enabled(v53, OS_LOG_TYPE_ERROR)) {
        +[SYItemIndexingManager searchableItemLinkingContentItem:toContainerIdentifier:uniqueIdentifier:relatedIdentifier:domainIdentifier:](v13, (uint64_t)v52, v53);
      }
    }
    id v16 = v50;
    id v15 = v49;
    id v14 = v48;
    id v17 = v47;
    id v18 = v57;
  }

  v54 = (void *)[objc_alloc(MEMORY[0x1E4F23840]) initWithUniqueIdentifier:v18 domainIdentifier:v17 attributeSet:v23];
  v55 = [MEMORY[0x1E4F1C9C8] distantFuture];
  [v54 setExpirationDate:v55];

  return v54;
}

+ (id)searchableItemLinkingContentItem:(id)a3 toContainerIdentifier:(id)a4 relatedIdentifier:(id)a5 domainIdentifier:(id)a6
{
  return (id)[a1 searchableItemLinkingContentItem:a3 toContainerIdentifier:a4 uniqueIdentifier:0 relatedIdentifier:a5 domainIdentifier:a6];
}

+ (void)indexedContentItemsDidChange
{
  v2 = os_log_create("com.apple.synapse", "ItemIndexing");
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)id v4 = 0;
    _os_log_impl(&dword_1C2C5F000, v2, OS_LOG_TYPE_DEFAULT, "IndexingManager: indexedContentItemsDidChange", v4, 2u);
  }

  uint64_t v3 = +[SYActivityObserver sharedInstance];
  [v3 indexedContentItemsDidChange];
}

+ (void)_fetchIndexedItemsLinkedToUserActivity:(id)a3 extraFetchAttributes:(id)a4 completion:(id)a5
{
  v39[7] = *MEMORY[0x1E4F143B8];
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  v12 = (void (**)(void, void))v11;
  if (v9)
  {
    if (v11) {
      goto LABEL_3;
    }
  }
  else
  {
    v29 = [MEMORY[0x1E4F28B00] currentHandler];
    [v29 handleFailureInMethod:a2, a1, @"SYItemIndexingManager.m", 226, @"Invalid parameter not satisfying: %@", @"userActivity" object file lineNumber description];

    if (v12) {
      goto LABEL_3;
    }
  }
  v30 = [MEMORY[0x1E4F28B00] currentHandler];
  [v30 handleFailureInMethod:a2, a1, @"SYItemIndexingManager.m", 227, @"Invalid parameter not satisfying: %@", @"completion" object file lineNumber description];

LABEL_3:
  id v13 = os_log_create("com.apple.synapse", "ItemIndexing");
  if (os_log_type_enabled(v13, OS_LOG_TYPE_DEBUG)) {
    +[SYItemIndexingManager _fetchIndexedItemsLinkedToUserActivity:extraFetchAttributes:completion:]((uint64_t)v9, v10, v13);
  }

  if (SYIsLinkableUserActivity(v9))
  {
    id v14 = [a1 _queryStringForMatchingUserActivityInfo:v9];
    id v15 = NSStringFromSelector(sel_URL);
    v39[0] = v15;
    id v16 = NSStringFromSelector(sel_containerIdentifier);
    v39[1] = v16;
    id v17 = NSStringFromSelector(sel_domainIdentifier);
    v39[2] = v17;
    v39[3] = @"sy_canonicalURL";
    v39[4] = @"sy_activityType";
    v39[5] = @"sy_activityPersistentID";
    v39[6] = @"sy_activityTargetContentID";
    id v18 = [MEMORY[0x1E4F1C978] arrayWithObjects:v39 count:7];

    if (v10)
    {
      uint64_t v19 = [v18 arrayByAddingObjectsFromArray:v10];

      id v18 = (void *)v19;
    }
    id v20 = objc_alloc_init(MEMORY[0x1E4F23830]);
    [v20 setFetchAttributes:v18];
    [v20 setReason:@"System Paper Backlinks"];
    v21 = (void *)[objc_alloc(MEMORY[0x1E4F23828]) initWithQueryString:v14 context:v20];
    if (objc_opt_respondsToSelector()) {
      [v21 setPrivateQuery:1];
    }
    uint64_t v22 = [a1 _coreSpotlightIndexBundleID];
    v23 = (void *)v22;
    if (v22)
    {
      uint64_t v38 = v22;
      v24 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v38 count:1];
      [v21 setBundleIDs:v24];
    }
    v25 = [MEMORY[0x1E4F1CA48] array];
    v34[0] = MEMORY[0x1E4F143A8];
    v34[1] = 3221225472;
    v34[2] = __96__SYItemIndexingManager__fetchIndexedItemsLinkedToUserActivity_extraFetchAttributes_completion___block_invoke;
    v34[3] = &unk_1E6464668;
    id v35 = v9;
    id v37 = a1;
    id v26 = v25;
    id v36 = v26;
    [v21 setFoundItemsHandler:v34];
    v31[0] = MEMORY[0x1E4F143A8];
    v31[1] = 3221225472;
    v31[2] = __96__SYItemIndexingManager__fetchIndexedItemsLinkedToUserActivity_extraFetchAttributes_completion___block_invoke_130;
    v31[3] = &unk_1E6463EC8;
    id v32 = v26;
    v33 = v12;
    id v27 = v26;
    [v21 setCompletionHandler:v31];
    [v21 start];
  }
  else
  {
    v28 = os_log_create("com.apple.synapse", "ItemIndexing");
    if (os_log_type_enabled(v28, OS_LOG_TYPE_DEBUG)) {
      +[SYItemIndexingManager _fetchIndexedItemsLinkedToUserActivity:extraFetchAttributes:completion:]();
    }

    v12[2](v12, MEMORY[0x1E4F1CBF0]);
  }
}

void __96__SYItemIndexingManager__fetchIndexedItemsLinkedToUserActivity_extraFetchAttributes_completion___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = os_log_create("com.apple.synapse", "ItemIndexing");
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG)) {
    __96__SYItemIndexingManager__fetchIndexedItemsLinkedToUserActivity_extraFetchAttributes_completion___block_invoke_cold_1(v3, a1, v4);
  }

  v5 = [*(id *)(a1 + 48) _postFilteredItems:v3 matchingUserActivityInfo:*(void *)(a1 + 32)];
  if (v5) {
    [*(id *)(a1 + 40) addObjectsFromArray:v5];
  }
}

void __96__SYItemIndexingManager__fetchIndexedItemsLinkedToUserActivity_extraFetchAttributes_completion___block_invoke_130(uint64_t a1, void *a2)
{
  id v3 = a2;
  if (v3)
  {
    id v4 = os_log_create("com.apple.synapse", "ItemIndexing");
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
      __96__SYItemIndexingManager__fetchIndexedItemsLinkedToUserActivity_extraFetchAttributes_completion___block_invoke_130_cold_1();
    }
  }
  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
}

+ (void)fetchIdentifiersLinkedToUserActivity:(id)a3 completion:(id)a4
{
  id v6 = a4;
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __73__SYItemIndexingManager_fetchIdentifiersLinkedToUserActivity_completion___block_invoke;
  v8[3] = &unk_1E6463990;
  id v9 = v6;
  id v7 = v6;
  [a1 _fetchIndexedItemsLinkedToUserActivity:a3 extraFetchAttributes:0 completion:v8];
}

void __73__SYItemIndexingManager_fetchIdentifiersLinkedToUserActivity_completion___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v26 = *MEMORY[0x1E4F143B8];
  id v2 = a2;
  uint64_t v19 = objc_msgSend(MEMORY[0x1E4F1CA48], "arrayWithCapacity:", objc_msgSend(v2, "count"));
  id v18 = objc_msgSend(MEMORY[0x1E4F1CA48], "arrayWithCapacity:", objc_msgSend(v2, "count"));
  id v3 = objc_msgSend(MEMORY[0x1E4F1CA80], "setWithCapacity:", objc_msgSend(v2, "count"));
  long long v21 = 0u;
  long long v22 = 0u;
  long long v23 = 0u;
  long long v24 = 0u;
  id obj = v2;
  uint64_t v4 = [obj countByEnumeratingWithState:&v21 objects:v25 count:16];
  if (v4)
  {
    uint64_t v5 = v4;
    uint64_t v6 = *(void *)v22;
    do
    {
      for (uint64_t i = 0; i != v5; ++i)
      {
        if (*(void *)v22 != v6) {
          objc_enumerationMutation(obj);
        }
        v8 = *(void **)(*((void *)&v21 + 1) + 8 * i);
        id v9 = [v8 attributeSet];
        id v10 = [v9 domainIdentifier];

        id v11 = [v8 attributeSet];
        v12 = [v11 containerIdentifier];

        if (v10) {
          id v13 = v10;
        }
        else {
          id v13 = &stru_1F1E16740;
        }
        if (v12) {
          id v14 = v12;
        }
        else {
          id v14 = &stru_1F1E16740;
        }
        id v15 = [NSString stringWithFormat:@"%@%@", v13, v14];
        if (v10) {
          BOOL v16 = v12 == 0;
        }
        else {
          BOOL v16 = 1;
        }
        if (!v16 && ([v3 containsObject:v15] & 1) == 0)
        {
          [v19 addObject:v10];
          [v18 addObject:v12];
          [v3 addObject:v15];
        }
      }
      uint64_t v5 = [obj countByEnumeratingWithState:&v21 objects:v25 count:16];
    }
    while (v5);
  }

  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
}

+ (void)_fetchIndexedActivitiesWithActivityType:(id)a3 completion:(id)a4
{
  v33[7] = *MEMORY[0x1E4F143B8];
  id v7 = a3;
  id v8 = a4;
  id v9 = v8;
  if (v7)
  {
    if (v8) {
      goto LABEL_3;
    }
  }
  else
  {
    v25 = [MEMORY[0x1E4F28B00] currentHandler];
    [v25 handleFailureInMethod:a2, a1, @"SYItemIndexingManager.m", 322, @"Invalid parameter not satisfying: %@", @"activityType" object file lineNumber description];

    if (v9) {
      goto LABEL_3;
    }
  }
  uint64_t v26 = [MEMORY[0x1E4F28B00] currentHandler];
  [v26 handleFailureInMethod:a2, a1, @"SYItemIndexingManager.m", 323, @"Invalid parameter not satisfying: %@", @"completion" object file lineNumber description];

LABEL_3:
  id v10 = [MEMORY[0x1E4F28E78] stringWithFormat:@"%@ == 1", @"sy_isLinkItem"];
  if ([v7 length])
  {
    id v11 = _escapedSearchString(v7);
    [v10 appendFormat:@" && (%@ == \"%@\", @"sy_activityType"", v11];
  }
  v12 = NSStringFromSelector(sel_URL);
  v33[0] = v12;
  id v13 = NSStringFromSelector(sel_containerIdentifier);
  v33[1] = v13;
  id v14 = NSStringFromSelector(sel_domainIdentifier);
  v33[2] = v14;
  v33[3] = @"sy_canonicalURL";
  v33[4] = @"sy_activityType";
  v33[5] = @"sy_activityPersistentID";
  v33[6] = @"sy_activityTargetContentID";
  id v15 = [MEMORY[0x1E4F1C978] arrayWithObjects:v33 count:7];

  id v16 = objc_alloc_init(MEMORY[0x1E4F23830]);
  [v16 setFetchAttributes:v15];
  [v16 setReason:@"System Paper Backlinks"];
  id v17 = (void *)[objc_alloc(MEMORY[0x1E4F23828]) initWithQueryString:v10 context:v16];
  if (objc_opt_respondsToSelector()) {
    [v17 setPrivateQuery:1];
  }
  uint64_t v18 = [a1 _coreSpotlightIndexBundleID];
  uint64_t v19 = (void *)v18;
  if (v18)
  {
    uint64_t v32 = v18;
    id v20 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v32 count:1];
    [v17 setBundleIDs:v20];
  }
  long long v21 = [MEMORY[0x1E4F1CA48] array];
  v30[0] = MEMORY[0x1E4F143A8];
  v30[1] = 3221225472;
  v30[2] = __76__SYItemIndexingManager__fetchIndexedActivitiesWithActivityType_completion___block_invoke;
  v30[3] = &unk_1E6463870;
  id v22 = v21;
  id v31 = v22;
  [v17 setFoundItemsHandler:v30];
  v27[0] = MEMORY[0x1E4F143A8];
  v27[1] = 3221225472;
  v27[2] = __76__SYItemIndexingManager__fetchIndexedActivitiesWithActivityType_completion___block_invoke_2;
  v27[3] = &unk_1E6463EC8;
  id v28 = v22;
  id v29 = v9;
  id v23 = v22;
  id v24 = v9;
  [v17 setCompletionHandler:v27];
  [v17 start];
}

void __76__SYItemIndexingManager__fetchIndexedActivitiesWithActivityType_completion___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  uint64_t v4 = [v3 countByEnumeratingWithState:&v12 objects:v16 count:16];
  if (v4)
  {
    uint64_t v5 = v4;
    uint64_t v6 = *(void *)v13;
    do
    {
      uint64_t v7 = 0;
      do
      {
        if (*(void *)v13 != v6) {
          objc_enumerationMutation(v3);
        }
        id v8 = *(void **)(*((void *)&v12 + 1) + 8 * v7);
        id v9 = [SYAttributeSetActivityInfo alloc];
        id v10 = [v8 attributeSet];
        id v11 = [(SYAttributeSetActivityInfo *)v9 initWithAttributeSet:v10];

        [*(id *)(a1 + 32) addObject:v11];
        ++v7;
      }
      while (v5 != v7);
      uint64_t v5 = [v3 countByEnumeratingWithState:&v12 objects:v16 count:16];
    }
    while (v5);
  }
}

void __76__SYItemIndexingManager__fetchIndexedActivitiesWithActivityType_completion___block_invoke_2(uint64_t a1, void *a2)
{
  id v3 = a2;
  if (v3)
  {
    uint64_t v4 = os_log_create("com.apple.synapse", "ItemIndexing");
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
      __96__SYItemIndexingManager__fetchIndexedItemsLinkedToUserActivity_extraFetchAttributes_completion___block_invoke_130_cold_1();
    }
  }
  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
}

+ (void)fetchActivitiesWithActivityType:(id)a3 completion:(id)a4
{
  id v6 = a4;
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __68__SYItemIndexingManager_fetchActivitiesWithActivityType_completion___block_invoke;
  v8[3] = &unk_1E6463990;
  id v9 = v6;
  id v7 = v6;
  [a1 _fetchIndexedActivitiesWithActivityType:a3 completion:v8];
}

uint64_t __68__SYItemIndexingManager_fetchActivitiesWithActivityType_completion___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

+ (void)fetchLinkContextsDataForUserActivity:(id)a3 completion:(id)a4
{
  v13[1] = *MEMORY[0x1E4F143B8];
  id v6 = a4;
  v13[0] = @"sy_linkContextInfoData";
  id v7 = (void *)MEMORY[0x1E4F1C978];
  id v8 = a3;
  id v9 = [v7 arrayWithObjects:v13 count:1];
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = __73__SYItemIndexingManager_fetchLinkContextsDataForUserActivity_completion___block_invoke;
  v11[3] = &unk_1E6463990;
  id v12 = v6;
  id v10 = v6;
  [a1 _fetchIndexedItemsLinkedToUserActivity:v8 extraFetchAttributes:v9 completion:v11];
}

void __73__SYItemIndexingManager_fetchLinkContextsDataForUserActivity_completion___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v11 = a1;
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  id v2 = a2;
  id v12 = objc_msgSend(MEMORY[0x1E4F1CA48], "arrayWithCapacity:", objc_msgSend(v2, "count"));
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  id v3 = v2;
  uint64_t v4 = [v3 countByEnumeratingWithState:&v13 objects:v17 count:16];
  if (v4)
  {
    uint64_t v5 = v4;
    uint64_t v6 = *(void *)v14;
    do
    {
      uint64_t v7 = 0;
      do
      {
        if (*(void *)v14 != v6) {
          objc_enumerationMutation(v3);
        }
        id v8 = objc_msgSend(*(id *)(*((void *)&v13 + 1) + 8 * v7), "attributeSet", v11);
        id v9 = +[SYItemIndexingManager _customKeyForKey:@"sy_linkContextInfoData"];
        id v10 = [v8 valueForCustomKey:v9];

        if (v10)
        {
          objc_opt_class();
          if (objc_opt_isKindOfClass()) {
            [v12 addObject:v10];
          }
        }

        ++v7;
      }
      while (v5 != v7);
      uint64_t v5 = [v3 countByEnumeratingWithState:&v13 objects:v17 count:16];
    }
    while (v5);
  }

  (*(void (**)(void))(*(void *)(v11 + 32) + 16))();
}

+ (id)_coreSpotlightIndexBundleID
{
  if (_SYUseLocalSearchIndex == 1)
  {
    id v2 = [MEMORY[0x1E4F28B50] mainBundle];
    id v3 = [v2 bundleIdentifier];
  }
  else
  {
    id v3 = @"com.apple.mobilenotes";
  }
  return v3;
}

+ (id)_queryStringForMatchingUserActivityInfo:(id)a3
{
  id v3 = a3;
  uint64_t v4 = [MEMORY[0x1E4F28E78] stringWithFormat:@"%@ == 1", @"sy_isLinkItem"];
  uint64_t v5 = [v3 activityType];
  uint64_t v6 = [v5 length];

  if (v6)
  {
    uint64_t v7 = [v3 activityType];
    id v8 = _escapedSearchString(v7);

    [v4 appendFormat:@" && (%@ == \"%@\" || %@ == \"\", @"sy_activityType", v8, @"sy_activityType""];
  }
  id v9 = [MEMORY[0x1E4F1CA48] arrayWithCapacity:3];
  id v10 = [v3 webpageURL];
  uint64_t v11 = [v10 host];
  uint64_t v12 = [v11 length];

  if (v12)
  {
    long long v13 = _searchableDomainNameForURL(v10);
    long long v14 = [NSString stringWithFormat:@"URL == \"*%@*\"", v13];
    [v9 addObject:v14];
  }
  long long v15 = [v3 canonicalURL];
  long long v16 = [v15 host];
  uint64_t v17 = [v16 length];

  if (v17)
  {
    uint64_t v18 = _searchableDomainNameForURL(v15);
    uint64_t v19 = [NSString stringWithFormat:@"%@ == \"*%@*\", @"sy_canonicalURL"", v18];
    [v9 addObject:v19];
  }
  id v20 = [v3 persistentIdentifier];
  uint64_t v21 = [v20 length];

  if (v21)
  {
    id v22 = [v3 persistentIdentifier];
    id v23 = _escapedSearchString(v22);

    id v24 = [NSString stringWithFormat:@"%@ == \"%@\", @"sy_activityPersistentID"", v23];
    [v9 addObject:v24];
  }
  v25 = [v3 targetContentIdentifier];
  uint64_t v26 = [v25 length];

  if (v26)
  {
    id v27 = [v3 targetContentIdentifier];
    id v28 = _escapedSearchString(v27);

    id v29 = [NSString stringWithFormat:@"%@ == \"%@\", @"sy_activityTargetContentID"", v28];
    [v9 addObject:v29];
  }
  v30 = [v9 componentsJoinedByString:@" || "];
  [v4 appendFormat:@" && (%@)", v30];

  id v31 = (void *)[v4 copy];
  return v31;
}

+ (id)_postFilteredItems:(id)a3 matchingUserActivityInfo:(id)a4
{
  uint64_t v25 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  id v6 = a4;
  uint64_t v7 = objc_msgSend(MEMORY[0x1E4F1CA48], "arrayWithCapacity:", objc_msgSend(v5, "count"));
  long long v20 = 0u;
  long long v21 = 0u;
  long long v22 = 0u;
  long long v23 = 0u;
  id v8 = v5;
  uint64_t v9 = [v8 countByEnumeratingWithState:&v20 objects:v24 count:16];
  if (v9)
  {
    uint64_t v10 = v9;
    uint64_t v11 = *(void *)v21;
    do
    {
      for (uint64_t i = 0; i != v10; ++i)
      {
        if (*(void *)v21 != v11) {
          objc_enumerationMutation(v8);
        }
        long long v13 = *(void **)(*((void *)&v20 + 1) + 8 * i);
        long long v14 = objc_msgSend(v13, "attributeSet", (void)v20);
        long long v15 = [v14 URL];

        if (!v15
          || (long long v16 = [SYAttributeSetActivityInfo alloc],
              [v13 attributeSet],
              uint64_t v17 = objc_claimAutoreleasedReturnValue(),
              uint64_t v18 = [(SYAttributeSetActivityInfo *)v16 initWithAttributeSet:v17],
              v17,
              LODWORD(v17) = SYEquivalentUserActivities(v18, v6),
              v18,
              v17))
        {
          [v7 addObject:v13];
        }
      }
      uint64_t v10 = [v8 countByEnumeratingWithState:&v20 objects:v24 count:16];
    }
    while (v10);
  }

  return v7;
}

+ (void)setUseLocalSearchIndex
{
  _SYUseLocalSearchIndex = 1;
}

+ (void)searchableItemLinkingContentItem:(NSObject *)a3 toContainerIdentifier:uniqueIdentifier:relatedIdentifier:domainIdentifier:.cold.1(void *a1, uint64_t a2, NSObject *a3)
{
  uint64_t v9 = *MEMORY[0x1E4F143B8];
  id v5 = [a1 itemIdentifier];
  OUTLINED_FUNCTION_1_0();
  __int16 v7 = 2112;
  uint64_t v8 = a2;
  _os_log_error_impl(&dword_1C2C5F000, a3, OS_LOG_TYPE_ERROR, "Error encoding linkContextInfo dictionary for item %@, ignoring: %@", v6, 0x16u);
}

+ (void)_fetchIndexedItemsLinkedToUserActivity:extraFetchAttributes:completion:.cold.1()
{
  uint64_t v2 = *MEMORY[0x1E4F143B8];
  OUTLINED_FUNCTION_1_0();
  _os_log_debug_impl(&dword_1C2C5F000, v0, OS_LOG_TYPE_DEBUG, "Can't search indexed linked items for invalid activity: %p", v1, 0xCu);
}

+ (void)_fetchIndexedItemsLinkedToUserActivity:(uint64_t)a1 extraFetchAttributes:(void *)a2 completion:(NSObject *)a3 .cold.2(uint64_t a1, void *a2, NSObject *a3)
{
  uint64_t v8 = *MEMORY[0x1E4F143B8];
  int v4 = 134218240;
  uint64_t v5 = a1;
  __int16 v6 = 1024;
  BOOL v7 = [a2 count] != 0;
  _os_log_debug_impl(&dword_1C2C5F000, a3, OS_LOG_TYPE_DEBUG, "Search indexed linked items for activity: %p, has extra fetch attributes: %d", (uint8_t *)&v4, 0x12u);
}

void __96__SYItemIndexingManager__fetchIndexedItemsLinkedToUserActivity_extraFetchAttributes_completion___block_invoke_cold_1(void *a1, uint64_t a2, NSObject *a3)
{
  uint64_t v8 = *MEMORY[0x1E4F143B8];
  [a1 count];
  OUTLINED_FUNCTION_1_0();
  __int16 v6 = 2048;
  uint64_t v7 = v4;
  _os_log_debug_impl(&dword_1C2C5F000, a3, OS_LOG_TYPE_DEBUG, "Process %ld indexed linked item(s) found for activity: %p", v5, 0x16u);
}

void __96__SYItemIndexingManager__fetchIndexedItemsLinkedToUserActivity_extraFetchAttributes_completion___block_invoke_130_cold_1()
{
  uint64_t v2 = *MEMORY[0x1E4F143B8];
  OUTLINED_FUNCTION_1_0();
  _os_log_error_impl(&dword_1C2C5F000, v0, OS_LOG_TYPE_ERROR, "Error executing search query: %@", v1, 0xCu);
}

@end