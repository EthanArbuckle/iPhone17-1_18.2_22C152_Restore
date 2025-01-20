@interface WBSSiriIntelligenceDonor
+ (WBSSiriIntelligenceDonor)sharedInstance;
+ (id)_bookmarkItemIdentifierForURLString:(id)a3;
+ (id)_coreSpotlightItemIdentifierForURLString:(id)a3;
+ (id)_coreSpotlightTabDonationIdentifierForProfileWithIdentifier:(id)a3;
+ (id)_historyItemIdentifierForURLString:(id)a3 profileIdentifier:(id)a4;
+ (id)coreSpotlightBookmarkIsVistedForProfileIDsAttributeKey;
+ (id)coreSpotlightBookmarkTitleAttributeKey;
+ (id)coreSpotlightHistoryItemIsSTPAttributeKey;
+ (id)coreSpotlightPageDonationIdentifierForProfileWithIdentifier:(id)a3;
+ (id)coreSpotlightProfileIDKey;
+ (id)coreSpotlightTabTabGroupAttributeKey;
+ (id)historyItemIdentifierForURL:(id)a3 profileIdentifier:(id)a4;
- (BOOL)donateTextInWebView:(id)a3 extractedReaderText:(id)a4 canDonateFullPageText:(BOOL)a5 profileIdentifier:(id)a6 personalizationData:(id)a7 extractInnerText:(id)a8;
- (WBSSiriIntelligenceDonor)init;
- (id)_arrayByFilteringDeletedHistoryItems:(id)a3;
- (id)_computeCoreSpotlightIDsForBookmarks:(id)a3;
- (id)_contentDescriptionForURL:(id)a3;
- (id)_coreSpotlightItemsSubarrays:(id)a3;
- (id)_searchableItemsForIDs:(id)a3 allBookmarks:(id)a4;
- (void)_computeCoreSpotlightIndexingRequirementsForAllIDs:(id)a3 indexedIDs:(id)a4 outIndexIDs:(id *)a5 outRemoveIDs:(id *)a6;
- (void)_donateDataForPageWithURL:(id)a3 history:(id)a4 fullPageText:(id)a5 readerText:(id)a6 autocompleteTriggers:(id)a7 profileIdentifier:(id)a8 personalizationData:(id)a9;
- (void)_donateHistoryItemsToCoreSpotlightCreatedAfterDate:(id)a3 beforeDate:(id)a4 historiesForProfiles:(id)a5 withCompletionHandler:(id)a6;
- (void)_getIndexedBookmarksIDsToAttributesWithCompletionHandler:(id)a3;
- (void)_getIndexedIDsForSearchQueryString:(id)a3 completionHandler:(id)a4;
- (void)_getIndexedItemsForSearchQueryString:(id)a3 attributes:(id)a4 completionHandler:(id)a5;
- (void)_indexCoreSpotlightData:(id)a3 filterDeletedHistoryItems:(BOOL)a4 completionHandler:(id)a5;
- (void)_indexCoreSpotlightData:(id)a3 filterDeletedHistoryItems:(BOOL)a4 onDispatchQueue:(id)a5 completionHandler:(id)a6;
- (void)_indexHistoryItemsToCoreSpotlight:(id)a3 filterDeletedHistoryItems:(BOOL)a4 completionHandler:(id)a5;
- (void)_indexTabData:(id)a3 withCompletionHandler:(id)a4;
- (void)_removeCoreSpotlightDataWithIDs:(id)a3 onDispatchQueue:(id)a4 completionHandler:(id)a5;
- (void)_sanitizeAttributeSet:(id)a3;
- (void)_scheduleTabBatchDonationTimerIfNeeded;
- (void)donateAllHistoryToCoreSpotlightForProfiles:(id)a3 completionHandler:(id)a4;
- (void)donateDataForPageWithURL:(id)a3 fullPageText:(id)a4 readerText:(id)a5 profileIdentifier:(id)a6 personalizationData:(id)a7;
- (void)donatePendingTabDataNowWithCompletionHandler:(id)a3;
- (void)donateSafariBookmarksToCoreSpotlight:(id)a3 withCompletionHandler:(id)a4;
- (void)export30DaysWorthOfHistoryToCoreSpotlightForProfiles:(id)a3 completionHandler:(id)a4;
- (void)reindexAllBookmarkAndHistoryItems:(id)a3 historiesForProfiles:(id)a4 withAcknowledgementHandler:(id)a5;
- (void)reindexBookmarkAndHistoryItemsWithIdentifiers:(id)a3 allBookmarks:(id)a4 historiesForProfiles:(id)a5 withAcknowledgementHandler:(id)a6;
- (void)removeAllCoreSpotlightHistoryDataDonatedBySafariForProfileWithIdentifier:(id)a3;
- (void)removeCoreSpotlightDataWithIDs:(id)a3 completionHandler:(id)a4;
- (void)setTabNeedsSpotlightDeletion:(id)a3;
- (void)setTabNeedsSpotlightDonation:(id)a3;
- (void)updateCoreSpotlightReadingListDataAfterUpgrade:(id)a3;
@end

@implementation WBSSiriIntelligenceDonor

void __94__WBSSiriIntelligenceDonor__getIndexedItemsForSearchQueryString_attributes_completionHandler___block_invoke_2(uint64_t a1, void *a2)
{
  id v6 = a2;
  id v3 = *(id *)(a1 + 32);
  objc_sync_enter(v3);
  v4 = [v6 attributeSet];
  v5 = [v4 uniqueIdentifier];

  if (v5) {
    [*(id *)(a1 + 32) addObject:v6];
  }

  objc_sync_exit(v3);
}

void __85__WBSSiriIntelligenceDonor__getIndexedBookmarksIDsToAttributesWithCompletionHandler___block_invoke(uint64_t a1, void *a2, void *a3)
{
  uint64_t v35 = *MEMORY[0x1E4F143B8];
  id v4 = a2;
  id v23 = a3;
  v5 = [MEMORY[0x1E4F1CA60] dictionary];
  long long v30 = 0u;
  long long v31 = 0u;
  long long v32 = 0u;
  long long v33 = 0u;
  id v6 = v4;
  uint64_t v7 = [v6 countByEnumeratingWithState:&v30 objects:v34 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v9 = *(void *)v31;
    do
    {
      for (uint64_t i = 0; i != v8; ++i)
      {
        if (*(void *)v31 != v9) {
          objc_enumerationMutation(v6);
        }
        v11 = *(void **)(*((void *)&v30 + 1) + 8 * i);
        v12 = [v11 attributeSet];
        v13 = [v12 uniqueIdentifier];

        if ([v13 length])
        {
          v14 = [v11 attributeSet];
          v15 = [v14 weakRelatedUniqueIdentifier];

          v16 = [v11 attributeSet];
          v17 = [v16 title];

          if ([(__CFString *)v15 length])
          {
            if (!v17) {
              goto LABEL_15;
            }
          }
          else
          {
            v19 = WBS_LOG_CHANNEL_PREFIXSiriIntelligence();
            if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR)) {
              __85__WBSSiriIntelligenceDonor__getIndexedBookmarksIDsToAttributesWithCompletionHandler___block_invoke_cold_3(&v26, v27);
            }

            v15 = &stru_1EFBE3CF8;
            if (!v17)
            {
LABEL_15:
              v20 = WBS_LOG_CHANNEL_PREFIXSiriIntelligence();
              v17 = &stru_1EFBE3CF8;
              if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR)) {
                __85__WBSSiriIntelligenceDonor__getIndexedBookmarksIDsToAttributesWithCompletionHandler___block_invoke_cold_2(&v24, v25);
              }
            }
          }
          v21 = [MEMORY[0x1E4F1CA60] dictionary];
          [v21 setObject:v15 forKey:@"weakRelatedUniqueIdentifier"];
          [v21 setObject:v17 forKey:@"title"];
          [v5 setObject:v21 forKey:v13];

          goto LABEL_18;
        }
        v18 = WBS_LOG_CHANNEL_PREFIXSiriIntelligence();
        if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR)) {
          __85__WBSSiriIntelligenceDonor__getIndexedBookmarksIDsToAttributesWithCompletionHandler___block_invoke_cold_1(&v28, v29);
        }
LABEL_18:
      }
      uint64_t v8 = [v6 countByEnumeratingWithState:&v30 objects:v34 count:16];
    }
    while (v8);
  }

  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
}

void __87__WBSSiriIntelligenceDonor_donateSafariBookmarksToCoreSpotlight_withCompletionHandler___block_invoke(uint64_t a1, void *a2, void *a3)
{
  v51[1] = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  id v6 = a3;
  if (v6)
  {
    uint64_t v7 = WBS_LOG_CHANNEL_PREFIXSiriIntelligence();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR)) {
      __87__WBSSiriIntelligenceDonor_donateSafariBookmarksToCoreSpotlight_withCompletionHandler___block_invoke_cold_2(v7);
    }
    uint64_t v8 = *(void *)(a1 + 48);
    if (v8) {
      (*(void (**)(uint64_t, void))(v8 + 16))(v8, 0);
    }
  }
  else
  {
    uint64_t v9 = (void *)MEMORY[0x1E4F1CAD0];
    v10 = [v5 allKeys];
    v11 = [v9 setWithArray:v10];

    if (![v11 count])
    {
      v12 = [MEMORY[0x1E4F23838] defaultSearchableIndex];
      v13 = coreSpotlightBookmarksDonationIdentifier();
      v51[0] = v13;
      v14 = [MEMORY[0x1E4F1C978] arrayWithObjects:v51 count:1];
      [v12 deleteSearchableItemsWithDomainIdentifiers:v14 completionHandler:0];
    }
    uint64_t v15 = objc_msgSend(*(id *)(a1 + 32), "safari_setByApplyingBlock:", &__block_literal_global_206_1);
    v16 = *(void **)(a1 + 40);
    id v48 = 0;
    id v49 = 0;
    v37 = (void *)v15;
    v38 = v11;
    objc_msgSend(v16, "_computeCoreSpotlightIndexingRequirementsForAllIDs:indexedIDs:outIndexIDs:outRemoveIDs:");
    id v17 = v49;
    id v36 = v48;
    long long v44 = 0u;
    long long v45 = 0u;
    long long v46 = 0u;
    long long v47 = 0u;
    uint64_t v39 = a1;
    id obj = *(id *)(a1 + 32);
    uint64_t v18 = [obj countByEnumeratingWithState:&v44 objects:v50 count:16];
    if (v18)
    {
      uint64_t v19 = v18;
      uint64_t v20 = *(void *)v45;
      do
      {
        for (uint64_t i = 0; i != v19; ++i)
        {
          if (*(void *)v45 != v20) {
            objc_enumerationMutation(obj);
          }
          v22 = *(void **)(*((void *)&v44 + 1) + 8 * i);
          id v23 = objc_msgSend(v22, "coreSpotlightID", v36);
          char v24 = [v5 objectForKey:v23];
          v25 = [v24 objectForKey:@"title"];

          char v26 = [v22 bookmarkTitle];
          LOBYTE(v22) = [v25 isEqualToString:v26];

          if ((v22 & 1) == 0)
          {
            uint64_t v27 = [v17 setByAddingObject:v23];

            id v17 = (id)v27;
          }
        }
        uint64_t v19 = [obj countByEnumeratingWithState:&v44 objects:v50 count:16];
      }
      while (v19);
    }

    char v28 = WBS_LOG_CHANNEL_PREFIXSiriIntelligence();
    v29 = v36;
    if (os_log_type_enabled(v28, OS_LOG_TYPE_DEBUG)) {
      __87__WBSSiriIntelligenceDonor_donateSafariBookmarksToCoreSpotlight_withCompletionHandler___block_invoke_cold_1();
    }
    long long v30 = objc_msgSend(*(id *)(v39 + 40), "_searchableItemsForIDs:allBookmarks:", v17, *(void *)(v39 + 32), v36);
    long long v31 = [MEMORY[0x1E4F1CA48] array];
    v41[0] = MEMORY[0x1E4F143A8];
    v41[1] = 3221225472;
    v41[2] = __87__WBSSiriIntelligenceDonor_donateSafariBookmarksToCoreSpotlight_withCompletionHandler___block_invoke_211;
    v41[3] = &unk_1E5C9FCC0;
    id v42 = v29;
    id v43 = v31;
    id v32 = v31;
    id v33 = v29;
    [v5 enumerateKeysAndObjectsUsingBlock:v41];
    v34 = *(void **)(v39 + 40);
    uint64_t v35 = [v33 allObjects];
    [v34 removeCoreSpotlightDataWithIDs:v35 completionHandler:0];

    [*(id *)(v39 + 40) _indexCoreSpotlightData:v30 filterDeletedHistoryItems:0 completionHandler:*(void *)(v39 + 48)];
    id v6 = 0;
  }
}

uint64_t __64__WBSSiriIntelligenceDonor__searchableItemsForIDs_allBookmarks___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = *(void **)(a1 + 32);
  id v5 = [v3 coreSpotlightID];
  uint64_t v6 = [v4 containsObject:v5];

  if (v6)
  {
    uint64_t v7 = *(void **)(*(void *)(a1 + 40) + 16);
    if (v7)
    {
      uint64_t v8 = [v3 coreSpotlightID];
      [v7 removeObject:v8];
    }
  }

  return v6;
}

void __87__WBSSiriIntelligenceDonor_donateSafariBookmarksToCoreSpotlight_withCompletionHandler___block_invoke_211(uint64_t a1, uint64_t a2, void *a3)
{
  id v8 = a3;
  int v5 = [*(id *)(a1 + 32) containsObject:a2];
  uint64_t v6 = v8;
  if (v5)
  {
    uint64_t v7 = [v8 objectForKey:@"weakRelatedUniqueIdentifier"];
    if ([v7 length]) {
      [*(id *)(a1 + 40) addObject:v7];
    }

    uint64_t v6 = v8;
  }
}

void __65__WBSSiriIntelligenceDonor__computeCoreSpotlightIDsForBookmarks___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = objc_opt_class();
  int v5 = [v3 bookmarkURLString];
  uint64_t v6 = [v4 _bookmarkItemIdentifierForURLString:v5];
  [v3 setCoreSpotlightID:v6];

  uint64_t v7 = *(void **)(a1 + 40);
  id v8 = [v3 coreSpotlightID];

  [v7 addObject:v8];
}

+ (id)_bookmarkItemIdentifierForURLString:(id)a3
{
  id v4 = [NSString stringWithFormat:@"bookmark:%@", a3];
  int v5 = [a1 _coreSpotlightItemIdentifierForURLString:v4];

  return v5;
}

+ (id)_coreSpotlightItemIdentifierForURLString:(id)a3
{
  return (id)objc_msgSend(a3, "safari_sha256Hash");
}

- (void)removeCoreSpotlightDataWithIDs:(id)a3 completionHandler:(id)a4
{
}

- (id)_searchableItemsForIDs:(id)a3 allBookmarks:(id)a4
{
  uint64_t v48 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  v44[0] = MEMORY[0x1E4F143A8];
  v44[1] = 3221225472;
  v44[2] = __64__WBSSiriIntelligenceDonor__searchableItemsForIDs_allBookmarks___block_invoke;
  v44[3] = &unk_1E5C9FE20;
  id v37 = v6;
  id v45 = v37;
  long long v46 = self;
  uint64_t v7 = objc_msgSend(a4, "safari_filterObjectsUsingBlock:", v44);
  id v39 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  long long v40 = 0u;
  long long v41 = 0u;
  long long v42 = 0u;
  long long v43 = 0u;
  id obj = v7;
  uint64_t v8 = [obj countByEnumeratingWithState:&v40 objects:v47 count:16];
  if (v8)
  {
    uint64_t v9 = v8;
    uint64_t v10 = *(void *)v41;
    do
    {
      for (uint64_t i = 0; i != v9; ++i)
      {
        if (*(void *)v41 != v10) {
          objc_enumerationMutation(obj);
        }
        v12 = *(void **)(*((void *)&v40 + 1) + 8 * i);
        int v13 = [v12 isReadingListItem];
        v14 = @"com.apple.safari.bookmark";
        if (v13) {
          v14 = @"com.apple.safari.readinglist";
        }
        uint64_t v15 = (objc_class *)MEMORY[0x1E4F23850];
        v16 = v14;
        id v17 = (void *)[[v15 alloc] initWithItemContentType:v16];

        uint64_t v18 = [v12 bookmarkTitle];
        [v17 setTitle:v18];

        uint64_t v19 = (void *)MEMORY[0x1E4F1CB10];
        uint64_t v20 = [v12 bookmarkURLString];
        v21 = objc_msgSend(v19, "safari_URLWithDataAsString:", v20);

        [v17 setContentURL:v21];
        v22 = objc_opt_class();
        id v23 = [v12 bookmarkURLString];
        char v24 = [v22 _coreSpotlightItemIdentifierForURLString:v23];
        [v17 setWeakRelatedUniqueIdentifier:v24];

        v25 = [v21 path];
        [v17 setPath:v25];

        char v26 = [v21 host];
        uint64_t v27 = objc_msgSend(v26, "safari_simplifiedUserVisibleURLStringWithSimplifications:forDisplayOnly:simplifiedStringOffset:", 511, 0, 0);
        [v17 setComment:v27];

        [(WBSSiriIntelligenceDonor *)self _sanitizeAttributeSet:v17];
        id v28 = objc_alloc(MEMORY[0x1E4F23840]);
        v29 = [v12 coreSpotlightID];
        long long v30 = coreSpotlightBookmarksDonationIdentifier();
        long long v31 = (void *)[v28 initWithUniqueIdentifier:v29 domainIdentifier:v30 attributeSet:v17];

        id v32 = [MEMORY[0x1E4F1C9C8] distantFuture];
        [v31 setExpirationDate:v32];

        if (v31)
        {
          [v39 addObject:v31];
          entityCorrelator = self->_entityCorrelator;
          v34 = [v12 uuidString];
          [(WBSSpotlightDonationEntityCorrelator *)entityCorrelator correlateBookmarkEntityForItem:v31 withUUIDString:v34];
        }
      }
      uint64_t v9 = [obj countByEnumeratingWithState:&v40 objects:v47 count:16];
    }
    while (v9);
  }

  uint64_t v35 = (void *)[v39 copy];
  return v35;
}

- (void)_removeCoreSpotlightDataWithIDs:(id)a3 onDispatchQueue:(id)a4 completionHandler:(id)a5
{
  id v7 = a3;
  uint64_t v8 = a4;
  id v9 = a5;
  if ([v7 count])
  {
    v10[0] = MEMORY[0x1E4F143A8];
    v10[1] = 3221225472;
    v10[2] = __94__WBSSiriIntelligenceDonor__removeCoreSpotlightDataWithIDs_onDispatchQueue_completionHandler___block_invoke;
    v10[3] = &unk_1E5C8CDF0;
    id v11 = v7;
    id v12 = v9;
    dispatch_async(v8, v10);
  }
  else if (v9)
  {
    (*((void (**)(id, uint64_t))v9 + 2))(v9, 1);
  }
}

- (void)_indexCoreSpotlightData:(id)a3 filterDeletedHistoryItems:(BOOL)a4 onDispatchQueue:(id)a5 completionHandler:(id)a6
{
  id v10 = a3;
  id v11 = a5;
  id v12 = a6;
  if ([v10 count])
  {
    int v13 = [(WBSSiriIntelligenceDonor *)self _coreSpotlightItemsSubarrays:v10];
    v22[0] = 0;
    v22[1] = v22;
    v22[2] = 0x3032000000;
    v22[3] = __Block_byref_object_copy__34;
    v22[4] = __Block_byref_object_dispose__34;
    id v23 = 0;
    v15[0] = MEMORY[0x1E4F143A8];
    v15[1] = 3221225472;
    v15[2] = __112__WBSSiriIntelligenceDonor__indexCoreSpotlightData_filterDeletedHistoryItems_onDispatchQueue_completionHandler___block_invoke;
    v15[3] = &unk_1E5C9FE70;
    BOOL v21 = a4;
    id v16 = v13;
    id v17 = self;
    uint64_t v20 = v22;
    uint64_t v18 = v11;
    id v19 = v12;
    id v14 = v13;
    dispatch_async(v18, v15);

    _Block_object_dispose(v22, 8);
  }
  else if (v12)
  {
    (*((void (**)(id, uint64_t))v12 + 2))(v12, 1);
  }
}

- (void)_indexCoreSpotlightData:(id)a3 filterDeletedHistoryItems:(BOOL)a4 completionHandler:(id)a5
{
}

- (void)_computeCoreSpotlightIndexingRequirementsForAllIDs:(id)a3 indexedIDs:(id)a4 outIndexIDs:(id *)a5 outRemoveIDs:(id *)a6
{
  id v9 = a4;
  id v10 = a3;
  id v12 = (id)[v10 mutableCopy];
  [v12 minusSet:v9];
  *a5 = (id)[v12 copy];
  id v11 = (void *)[v9 mutableCopy];

  [v11 minusSet:v10];
  *a6 = (id)[v11 copy];
}

- (void)donateSafariBookmarksToCoreSpotlight:(id)a3 withCompletionHandler:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  uint64_t v8 = WBS_LOG_CHANNEL_PREFIXSiriIntelligence();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1A6B5F000, v8, OS_LOG_TYPE_INFO, "Indexing bookmarks to CoreSpotlight", buf, 2u);
  }
  id v9 = [(WBSSiriIntelligenceDonor *)self _computeCoreSpotlightIDsForBookmarks:v6];
  v12[0] = MEMORY[0x1E4F143A8];
  v12[1] = 3221225472;
  v12[2] = __87__WBSSiriIntelligenceDonor_donateSafariBookmarksToCoreSpotlight_withCompletionHandler___block_invoke;
  v12[3] = &unk_1E5C9FCE8;
  id v14 = self;
  id v15 = v7;
  id v13 = v6;
  id v10 = v6;
  id v11 = v7;
  [(WBSSiriIntelligenceDonor *)self _getIndexedBookmarksIDsToAttributesWithCompletionHandler:v12];
}

- (void)_getIndexedBookmarksIDsToAttributesWithCompletionHandler:(id)a3
{
  id v4 = a3;
  int v5 = [NSString stringWithFormat:@"contentType == \"%@\" || contentType == \"%@\", @"com.apple.safari.bookmark", @"com.apple.safari.readinglist""];
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __85__WBSSiriIntelligenceDonor__getIndexedBookmarksIDsToAttributesWithCompletionHandler___block_invoke;
  v7[3] = &unk_1E5C9FF38;
  id v8 = v4;
  id v6 = v4;
  [(WBSSiriIntelligenceDonor *)self _getIndexedItemsForSearchQueryString:v5 attributes:&unk_1EFC222E0 completionHandler:v7];
}

- (void)_getIndexedItemsForSearchQueryString:(id)a3 attributes:(id)a4 completionHandler:(id)a5
{
  id v8 = a4;
  id v9 = a3;
  id v10 = (void *)[a5 copy];
  id v11 = [MEMORY[0x1E4F1C978] arrayWithObject:@"uniqueIdentifier"];
  if ([v8 count])
  {
    uint64_t v12 = [v11 arrayByAddingObjectsFromArray:v8];

    id v11 = (void *)v12;
  }
  id v13 = objc_alloc_init(MEMORY[0x1E4F23830]);
  [v13 setPrivateQuery:1];
  [v13 setFetchAttributes:v11];
  id v14 = (void *)[objc_alloc(MEMORY[0x1E4F23828]) initWithQueryString:v9 queryContext:v13];

  id v15 = [MEMORY[0x1E4F1CA80] set];
  v35[0] = MEMORY[0x1E4F143A8];
  v35[1] = 3221225472;
  v35[2] = __94__WBSSiriIntelligenceDonor__getIndexedItemsForSearchQueryString_attributes_completionHandler___block_invoke;
  v35[3] = &unk_1E5C9F218;
  id v16 = v15;
  id v36 = v16;
  [v14 setFoundItemsHandler:v35];
  coreSpotlightDonationSerialQueue = self->_coreSpotlightDonationSerialQueue;
  v32[0] = MEMORY[0x1E4F143A8];
  v32[1] = 3221225472;
  v32[2] = __94__WBSSiriIntelligenceDonor__getIndexedItemsForSearchQueryString_attributes_completionHandler___block_invoke_3;
  v32[3] = &unk_1E5C8CDF0;
  id v33 = v14;
  id v18 = v10;
  id v34 = v18;
  id v19 = v14;
  uint64_t v20 = +[WBSDispatchSourceTimer timerWithInterval:0 repeats:coreSpotlightDonationSerialQueue queue:v32 handler:5000000000.0];
  uint64_t v24 = MEMORY[0x1E4F143A8];
  uint64_t v25 = 3221225472;
  char v26 = __94__WBSSiriIntelligenceDonor__getIndexedItemsForSearchQueryString_attributes_completionHandler___block_invoke_4;
  uint64_t v27 = &unk_1E5C9FF10;
  id v28 = self;
  id v29 = v20;
  id v30 = v16;
  id v31 = v18;
  id v21 = v16;
  id v22 = v18;
  id v23 = v20;
  [v19 setCompletionHandler:&v24];
  objc_msgSend(v19, "start", v24, v25, v26, v27, v28);
}

- (id)_computeCoreSpotlightIDsForBookmarks:(id)a3
{
  id v4 = (void *)MEMORY[0x1E4F1CA80];
  id v5 = a3;
  id v6 = [v4 set];
  uint64_t v10 = MEMORY[0x1E4F143A8];
  uint64_t v11 = 3221225472;
  uint64_t v12 = __65__WBSSiriIntelligenceDonor__computeCoreSpotlightIDsForBookmarks___block_invoke;
  id v13 = &unk_1E5C9FF60;
  id v14 = self;
  id v15 = v6;
  id v7 = v6;
  [v5 enumerateObjectsUsingBlock:&v10];

  id v8 = objc_msgSend(v7, "copy", v10, v11, v12, v13, v14);
  return v8;
}

uint64_t __87__WBSSiriIntelligenceDonor_donateSafariBookmarksToCoreSpotlight_withCompletionHandler___block_invoke_203(uint64_t a1, void *a2)
{
  return [a2 coreSpotlightID];
}

void __94__WBSSiriIntelligenceDonor__getIndexedItemsForSearchQueryString_attributes_completionHandler___block_invoke(uint64_t a1, void *a2)
{
  v3[0] = MEMORY[0x1E4F143A8];
  v3[1] = 3221225472;
  v3[2] = __94__WBSSiriIntelligenceDonor__getIndexedItemsForSearchQueryString_attributes_completionHandler___block_invoke_2;
  v3[3] = &unk_1E5C9FEC0;
  id v4 = *(id *)(a1 + 32);
  [a2 enumerateObjectsUsingBlock:v3];
}

+ (WBSSiriIntelligenceDonor)sharedInstance
{
  if (sharedInstance_onceToken != -1) {
    dispatch_once(&sharedInstance_onceToken, &__block_literal_global_105);
  }
  v2 = (void *)sharedInstance_sharedInstance;
  return (WBSSiriIntelligenceDonor *)v2;
}

void __42__WBSSiriIntelligenceDonor_sharedInstance__block_invoke()
{
  if (NSClassFromString(&cfstr_Cssearchablein.isa))
  {
    v0 = objc_alloc_init(WBSSiriIntelligenceDonor);
    v1 = (void *)sharedInstance_sharedInstance;
    sharedInstance_sharedInstance = (uint64_t)v0;
  }
}

- (WBSSiriIntelligenceDonor)init
{
  v15.receiver = self;
  v15.super_class = (Class)WBSSiriIntelligenceDonor;
  v2 = [(WBSSiriIntelligenceDonor *)&v15 init];
  if (v2)
  {
    id v3 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    id v4 = dispatch_queue_attr_make_with_qos_class(v3, QOS_CLASS_BACKGROUND, 0);

    dispatch_queue_t v5 = dispatch_queue_create("com.apple.SafariShared.CoreSpotlightDonation", v4);
    coreSpotlightDonationSerialQueue = v2->_coreSpotlightDonationSerialQueue;
    v2->_coreSpotlightDonationSerialQueue = (OS_dispatch_queue *)v5;

    dispatch_queue_t v7 = dispatch_queue_create("com.apple.SafariShared.TabDonationQueue", v4);
    tabDonationSerialQueue = v2->_tabDonationSerialQueue;
    v2->_tabDonationSerialQueue = (OS_dispatch_queue *)v7;

    uint64_t v9 = [objc_alloc(MEMORY[0x1E4F97FE8]) initIfAvailable];
    entityCorrelator = v2->_entityCorrelator;
    v2->_entityCorrelator = (WBSSpotlightDonationEntityCorrelator *)v9;

    uint64_t v11 = objc_alloc_init(WBSSpotlightReindexingBackgroundSystemTaskManager);
    reindexingBackgroundSystemTaskManager = v2->_reindexingBackgroundSystemTaskManager;
    v2->_reindexingBackgroundSystemTaskManager = v11;

    id v13 = v2;
  }

  return v2;
}

void __94__WBSSiriIntelligenceDonor__getIndexedItemsForSearchQueryString_attributes_completionHandler___block_invoke_4(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = *(NSObject **)(*(void *)(a1 + 32) + 8);
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __94__WBSSiriIntelligenceDonor__getIndexedItemsForSearchQueryString_attributes_completionHandler___block_invoke_5;
  v6[3] = &unk_1E5C9FEE8;
  id v7 = *(id *)(a1 + 40);
  id v8 = v3;
  id v10 = *(id *)(a1 + 56);
  id v9 = *(id *)(a1 + 48);
  id v5 = v3;
  dispatch_async(v4, v6);
}

void __94__WBSSiriIntelligenceDonor__getIndexedItemsForSearchQueryString_attributes_completionHandler___block_invoke_5(uint64_t a1)
{
  [*(id *)(a1 + 32) invalidate];
  if (*(void *)(a1 + 40))
  {
    id obj = (id)MEMORY[0x1AD0C4F80](*(void *)(a1 + 56));
    objc_sync_enter(obj);
    if ((_WBSRunOnceImpl() & 1) == 0) {
      (*(void (**)(void))(*(void *)(a1 + 56) + 16))();
    }
    objc_sync_exit(obj);
    v2 = obj;
  }
  else
  {
    id objb = *(id *)(a1 + 48);
    objc_sync_enter(objb);
    uint64_t v3 = [*(id *)(a1 + 48) copy];
    objc_sync_exit(objb);

    id obja = (id)MEMORY[0x1AD0C4F80](*(void *)(a1 + 56));
    objc_sync_enter(obja);
    if ((_WBSRunOnceImpl() & 1) == 0) {
      (*(void (**)(void))(*(void *)(a1 + 56) + 16))();
    }
    objc_sync_exit(obja);

    v2 = (void *)v3;
  }
}

+ (id)historyItemIdentifierForURL:(id)a3 profileIdentifier:(id)a4
{
  id v6 = a4;
  id v7 = [a3 absoluteString];
  id v8 = [a1 _historyItemIdentifierForURLString:v7 profileIdentifier:v6];

  return v8;
}

+ (id)_historyItemIdentifierForURLString:(id)a3 profileIdentifier:(id)a4
{
  id v6 = a4;
  id v7 = objc_msgSend(a3, "safari_userVisibleURL");
  id v8 = objc_msgSend(v7, "safari_stringByFoldingWideCharactersAndNormalizing");

  id v9 = [NSString stringWithFormat:@"history:%@", v8];
  id v10 = [a1 _coreSpotlightItemIdentifierForURLString:v9];

  uint64_t v11 = [NSString stringWithFormat:@"%@.%@", v6, v10];

  return v11;
}

+ (id)coreSpotlightPageDonationIdentifierForProfileWithIdentifier:(id)a3
{
  id v3 = a3;
  id v4 = v3;
  if (coreSpotlightPageDonationIdentifierForProfileWithIdentifier__once == -1)
  {
    if (!v3)
    {
LABEL_4:
      id v5 = (id)coreSpotlightPageDonationIdentifierForProfileWithIdentifier__identifier;
      goto LABEL_6;
    }
  }
  else
  {
    dispatch_once(&coreSpotlightPageDonationIdentifierForProfileWithIdentifier__once, &__block_literal_global_168);
    if (!v4) {
      goto LABEL_4;
    }
  }
  if ([v4 isEqualToString:*MEMORY[0x1E4F980C8]]) {
    goto LABEL_4;
  }
  id v5 = [NSString stringWithFormat:@"%@.%@", v4, coreSpotlightPageDonationIdentifierForProfileWithIdentifier__identifier];
LABEL_6:
  id v6 = v5;

  return v6;
}

void __88__WBSSiriIntelligenceDonor_coreSpotlightPageDonationIdentifierForProfileWithIdentifier___block_invoke()
{
  v0 = NSString;
  objc_msgSend(MEMORY[0x1E4F28B50], "safari_safariApplicationPlatformBundleIdentifier");
  id v3 = (id)objc_claimAutoreleasedReturnValue();
  uint64_t v1 = [v0 stringWithFormat:@"%@.PageContentDonation", v3];
  v2 = (void *)coreSpotlightPageDonationIdentifierForProfileWithIdentifier__identifier;
  coreSpotlightPageDonationIdentifierForProfileWithIdentifier__identifier = v1;
}

+ (id)_coreSpotlightTabDonationIdentifierForProfileWithIdentifier:(id)a3
{
  uint64_t v3 = _coreSpotlightTabDonationIdentifierForProfileWithIdentifier__onceToken;
  id v4 = a3;
  if (v3 != -1) {
    dispatch_once(&_coreSpotlightTabDonationIdentifierForProfileWithIdentifier__onceToken, &__block_literal_global_174);
  }
  id v5 = [NSString stringWithFormat:@"%@.%@", v4, _coreSpotlightTabDonationIdentifierForProfileWithIdentifier__identifier];

  return v5;
}

void __88__WBSSiriIntelligenceDonor__coreSpotlightTabDonationIdentifierForProfileWithIdentifier___block_invoke()
{
  v0 = NSString;
  id v4 = [MEMORY[0x1E4F28B50] mainBundle];
  uint64_t v1 = [v4 bundleIdentifier];
  uint64_t v2 = [v0 stringWithFormat:@"%@.TabDonation", v1];
  uint64_t v3 = (void *)_coreSpotlightTabDonationIdentifierForProfileWithIdentifier__identifier;
  _coreSpotlightTabDonationIdentifierForProfileWithIdentifier__identifier = v2;
}

+ (id)coreSpotlightBookmarkIsVistedForProfileIDsAttributeKey
{
  if (coreSpotlightBookmarkIsVistedForProfileIDsAttributeKey_onceToken != -1) {
    dispatch_once(&coreSpotlightBookmarkIsVistedForProfileIDsAttributeKey_onceToken, &__block_literal_global_179);
  }
  uint64_t v2 = (void *)coreSpotlightBookmarkIsVistedForProfileIDsAttributeKey_coreSpotlightBookmarkIsVistedForProfileIDsAttributeKey;
  return v2;
}

void __82__WBSSiriIntelligenceDonor_coreSpotlightBookmarkIsVistedForProfileIDsAttributeKey__block_invoke()
{
  uint64_t v0 = [objc_alloc(MEMORY[0x1E4F237C0]) initWithKeyName:@"bookmarkIsVistedForProfileIDs" searchable:1 searchableByDefault:0 unique:1 multiValued:1];
  uint64_t v1 = (void *)coreSpotlightBookmarkIsVistedForProfileIDsAttributeKey_coreSpotlightBookmarkIsVistedForProfileIDsAttributeKey;
  coreSpotlightBookmarkIsVistedForProfileIDsAttributeKey_coreSpotlightBookmarkIsVistedForProfileIDsAttributeKey = v0;
}

+ (id)coreSpotlightBookmarkTitleAttributeKey
{
  if (coreSpotlightBookmarkTitleAttributeKey_onceToken != -1) {
    dispatch_once(&coreSpotlightBookmarkTitleAttributeKey_onceToken, &__block_literal_global_182);
  }
  uint64_t v2 = (void *)coreSpotlightBookmarkTitleAttributeKey_coreSpotlightBookmarkTitleAttributeKey;
  return v2;
}

void __66__WBSSiriIntelligenceDonor_coreSpotlightBookmarkTitleAttributeKey__block_invoke()
{
  uint64_t v0 = [objc_alloc(MEMORY[0x1E4F237C0]) initWithKeyName:@"bookmarkTitle" searchable:0 searchableByDefault:0 unique:0 multiValued:0];
  uint64_t v1 = (void *)coreSpotlightBookmarkTitleAttributeKey_coreSpotlightBookmarkTitleAttributeKey;
  coreSpotlightBookmarkTitleAttributeKey_coreSpotlightBookmarkTitleAttributeKey = v0;
}

+ (id)coreSpotlightProfileIDKey
{
  if (coreSpotlightProfileIDKey_onceToken != -1) {
    dispatch_once(&coreSpotlightProfileIDKey_onceToken, &__block_literal_global_184);
  }
  uint64_t v2 = (void *)coreSpotlightProfileIDKey_coreSpotlightProfileIDAttributeKey;
  return v2;
}

void __53__WBSSiriIntelligenceDonor_coreSpotlightProfileIDKey__block_invoke()
{
  uint64_t v0 = [objc_alloc(MEMORY[0x1E4F237C0]) initWithKeyName:@"profileIdentifier" searchable:0 searchableByDefault:0 unique:0 multiValued:0];
  uint64_t v1 = (void *)coreSpotlightProfileIDKey_coreSpotlightProfileIDAttributeKey;
  coreSpotlightProfileIDKey_coreSpotlightProfileIDAttributeKey = v0;
}

+ (id)coreSpotlightHistoryItemIsSTPAttributeKey
{
  if (coreSpotlightHistoryItemIsSTPAttributeKey_onceToken != -1) {
    dispatch_once(&coreSpotlightHistoryItemIsSTPAttributeKey_onceToken, &__block_literal_global_186_1);
  }
  uint64_t v2 = (void *)coreSpotlightHistoryItemIsSTPAttributeKey_coreSpotlightHistoryItemIsSTPAttributeKey;
  return v2;
}

void __69__WBSSiriIntelligenceDonor_coreSpotlightHistoryItemIsSTPAttributeKey__block_invoke()
{
  uint64_t v0 = [objc_alloc(MEMORY[0x1E4F237C0]) initWithKeyName:@"itemIsFromSTP" searchable:0 searchableByDefault:0 unique:0 multiValued:0];
  uint64_t v1 = (void *)coreSpotlightHistoryItemIsSTPAttributeKey_coreSpotlightHistoryItemIsSTPAttributeKey;
  coreSpotlightHistoryItemIsSTPAttributeKey_coreSpotlightHistoryItemIsSTPAttributeKey = v0;
}

+ (id)coreSpotlightTabTabGroupAttributeKey
{
  if (coreSpotlightTabTabGroupAttributeKey_onceToken != -1) {
    dispatch_once(&coreSpotlightTabTabGroupAttributeKey_onceToken, &__block_literal_global_188);
  }
  uint64_t v2 = (void *)coreSpotlightTabTabGroupAttributeKey_coreSpotlightTabTabGroupCustomAttributeKey;
  return v2;
}

void __64__WBSSiriIntelligenceDonor_coreSpotlightTabTabGroupAttributeKey__block_invoke()
{
  uint64_t v0 = [objc_alloc(MEMORY[0x1E4F237C0]) initWithKeyName:@"tabGroupUUID" searchable:0 searchableByDefault:0 unique:0 multiValued:0];
  uint64_t v1 = (void *)coreSpotlightTabTabGroupAttributeKey_coreSpotlightTabTabGroupCustomAttributeKey;
  coreSpotlightTabTabGroupAttributeKey_coreSpotlightTabTabGroupCustomAttributeKey = v0;
}

- (BOOL)donateTextInWebView:(id)a3 extractedReaderText:(id)a4 canDonateFullPageText:(BOOL)a5 profileIdentifier:(id)a6 personalizationData:(id)a7 extractInnerText:(id)a8
{
  id v14 = a3;
  id v15 = a4;
  id v16 = a6;
  id v17 = a7;
  id v18 = a8;
  id v19 = [v14 URL];
  if (!v19)
  {
LABEL_7:
    BOOL v20 = 0;
    goto LABEL_8;
  }
  if (![v15 length])
  {
    if (!a5) {
      [(WBSSiriIntelligenceDonor *)self donateDataForPageWithURL:v19 fullPageText:0 readerText:0 profileIdentifier:v16 personalizationData:v17];
    }
    v22[0] = MEMORY[0x1E4F143A8];
    v22[1] = 3221225472;
    v22[2] = __145__WBSSiriIntelligenceDonor_donateTextInWebView_extractedReaderText_canDonateFullPageText_profileIdentifier_personalizationData_extractInnerText___block_invoke;
    v22[3] = &unk_1E5C9FC50;
    BOOL v28 = a5;
    id v23 = v19;
    uint64_t v24 = self;
    id v25 = v16;
    id v26 = v17;
    id v27 = v18;
    [v14 _getContentsAsStringWithCompletionHandler:v22];

    goto LABEL_7;
  }
  [(WBSSiriIntelligenceDonor *)self donateDataForPageWithURL:v19 fullPageText:0 readerText:v15 profileIdentifier:v16 personalizationData:v17];
  BOOL v20 = 1;
LABEL_8:

  return v20;
}

void __145__WBSSiriIntelligenceDonor_donateTextInWebView_extractedReaderText_canDonateFullPageText_profileIdentifier_personalizationData_extractInnerText___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  if (v6)
  {
    id v7 = WBS_LOG_CHANNEL_PREFIXSiriIntelligence();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR)) {
      __145__WBSSiriIntelligenceDonor_donateTextInWebView_extractedReaderText_canDonateFullPageText_profileIdentifier_personalizationData_extractInnerText___block_invoke_cold_2(v7);
    }
  }
  else
  {
    if (![v5 length])
    {
      id v8 = WBS_LOG_CHANNEL_PREFIXSiriIntelligence();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG)) {
        __145__WBSSiriIntelligenceDonor_donateTextInWebView_extractedReaderText_canDonateFullPageText_profileIdentifier_personalizationData_extractInnerText___block_invoke_cold_1(a1, v8);
      }
    }
    if (*(unsigned char *)(a1 + 72)) {
      [*(id *)(a1 + 40) donateDataForPageWithURL:*(void *)(a1 + 32) fullPageText:v5 readerText:0 profileIdentifier:*(void *)(a1 + 48) personalizationData:*(void *)(a1 + 56)];
    }
    (*(void (**)(void))(*(void *)(a1 + 64) + 16))();
  }
}

- (void)donateDataForPageWithURL:(id)a3 fullPageText:(id)a4 readerText:(id)a5 profileIdentifier:(id)a6 personalizationData:(id)a7
{
  id v12 = a3;
  id v13 = a4;
  id v14 = a5;
  id v15 = a6;
  id v16 = a7;
  id v17 = +[WBSHistoryController existingSharedHistoryController];
  id v18 = [v17 historyForProfileIdentifier:v15 loadIfNeeded:1];

  id v19 = objc_msgSend(v12, "safari_originalDataAsString");
  v26[0] = MEMORY[0x1E4F143A8];
  v26[1] = 3221225472;
  v26[2] = __115__WBSSiriIntelligenceDonor_donateDataForPageWithURL_fullPageText_readerText_profileIdentifier_personalizationData___block_invoke;
  v26[3] = &unk_1E5C9FC78;
  v26[4] = self;
  id v27 = v12;
  id v28 = v18;
  id v29 = v13;
  id v30 = v14;
  id v31 = v15;
  id v32 = v16;
  id v20 = v16;
  id v21 = v15;
  id v22 = v14;
  id v23 = v13;
  id v24 = v18;
  id v25 = v12;
  [v24 getAutocompleteTriggersForURLString:v19 completionHandler:v26];
}

uint64_t __115__WBSSiriIntelligenceDonor_donateDataForPageWithURL_fullPageText_readerText_profileIdentifier_personalizationData___block_invoke(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 32) _donateDataForPageWithURL:*(void *)(a1 + 40) history:*(void *)(a1 + 48) fullPageText:*(void *)(a1 + 56) readerText:*(void *)(a1 + 64) autocompleteTriggers:a2 profileIdentifier:*(void *)(a1 + 72) personalizationData:*(void *)(a1 + 80)];
}

- (void)_donateDataForPageWithURL:(id)a3 history:(id)a4 fullPageText:(id)a5 readerText:(id)a6 autocompleteTriggers:(id)a7 profileIdentifier:(id)a8 personalizationData:(id)a9
{
  id v15 = a3;
  id v16 = a4;
  id v17 = a5;
  id v18 = a6;
  id v19 = a7;
  id v20 = a8;
  id v21 = a9;
  if ((objc_msgSend(v15, "safari_isURLTooLongToDisplay") & 1) == 0)
  {
    coreSpotlightDonationSerialQueue = self->_coreSpotlightDonationSerialQueue;
    v23[0] = MEMORY[0x1E4F143A8];
    v23[1] = 3221225472;
    v23[2] = __145__WBSSiriIntelligenceDonor__donateDataForPageWithURL_history_fullPageText_readerText_autocompleteTriggers_profileIdentifier_personalizationData___block_invoke;
    v23[3] = &unk_1E5C8CD48;
    id v24 = v16;
    id v25 = v15;
    id v26 = v17;
    id v27 = v18;
    id v28 = v19;
    id v29 = v21;
    id v30 = v20;
    id v31 = self;
    dispatch_async(coreSpotlightDonationSerialQueue, v23);
  }
}

void __145__WBSSiriIntelligenceDonor__donateDataForPageWithURL_history_fullPageText_readerText_autocompleteTriggers_profileIdentifier_personalizationData___block_invoke(uint64_t a1)
{
  uint64_t v2 = (uint64_t *)(a1 + 40);
  uint64_t v3 = [*(id *)(a1 + 32) itemForURL:*(void *)(a1 + 40)];
  if (v3)
  {
    id v4 = objc_alloc_init(WBSSiriIntelligenceDonorHistoryData);
    [(WBSSiriIntelligenceDonorHistoryData *)v4 setFullPageText:*(void *)(a1 + 48)];
    [(WBSSiriIntelligenceDonorHistoryData *)v4 setPageURL:*(void *)(a1 + 40)];
    id v5 = [v3 title];
    [(WBSSiriIntelligenceDonorHistoryData *)v4 setPageTitle:v5];

    [(WBSSiriIntelligenceDonorHistoryData *)v4 setReaderText:*(void *)(a1 + 56)];
    id v6 = [v3 userVisibleURLString];
    [(WBSSiriIntelligenceDonorHistoryData *)v4 setUserVisibleURLString:v6];

    id v7 = [v3 lastVisitedDate];
    [(WBSSiriIntelligenceDonorHistoryData *)v4 setLastVisitedDate:v7];

    [(WBSSiriIntelligenceDonorHistoryData *)v4 setAutocompleteTriggers:*(void *)(a1 + 64)];
    [(WBSSiriIntelligenceDonorHistoryData *)v4 setPersonalizationData:*(void *)(a1 + 72)];
    [(WBSSiriIntelligenceDonorHistoryData *)v4 setProfileIdentifier:*(void *)(a1 + 80)];
    id v8 = *(void **)(a1 + 88);
    id v9 = [MEMORY[0x1E4F1CAD0] setWithObject:v4];
    [v8 _indexHistoryItemsToCoreSpotlight:v9 filterDeletedHistoryItems:1 completionHandler:0];
  }
  else
  {
    id v10 = WBS_LOG_CHANNEL_PREFIXSiriIntelligence();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR)) {
      __145__WBSSiriIntelligenceDonor__donateDataForPageWithURL_history_fullPageText_readerText_autocompleteTriggers_profileIdentifier_personalizationData___block_invoke_cold_2();
    }
    uint64_t v11 = WBS_LOG_CHANNEL_PREFIXSiriIntelligence();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG)) {
      __145__WBSSiriIntelligenceDonor__donateDataForPageWithURL_history_fullPageText_readerText_autocompleteTriggers_profileIdentifier_personalizationData___block_invoke_cold_1(v2, v11);
    }
  }
}

- (void)donateAllHistoryToCoreSpotlightForProfiles:(id)a3 completionHandler:(id)a4
{
  id v6 = (void *)MEMORY[0x1E4F1C9C8];
  id v7 = a4;
  id v8 = a3;
  id v10 = [v6 distantPast];
  id v9 = [MEMORY[0x1E4F1C9C8] date];
  [(WBSSiriIntelligenceDonor *)self _donateHistoryItemsToCoreSpotlightCreatedAfterDate:v10 beforeDate:v9 historiesForProfiles:v8 withCompletionHandler:v7];
}

- (void)export30DaysWorthOfHistoryToCoreSpotlightForProfiles:(id)a3 completionHandler:(id)a4
{
  id v6 = (void *)MEMORY[0x1E4F1C9A8];
  id v7 = a4;
  id v8 = a3;
  id v12 = [v6 currentCalendar];
  id v9 = [MEMORY[0x1E4F1C9C8] date];
  id v10 = [v12 components:60 fromDate:v9];
  objc_msgSend(v10, "setDay:", objc_msgSend(v10, "day") - 30);
  uint64_t v11 = [v12 dateFromComponents:v10];
  [(WBSSiriIntelligenceDonor *)self _donateHistoryItemsToCoreSpotlightCreatedAfterDate:v11 beforeDate:v9 historiesForProfiles:v8 withCompletionHandler:v7];
}

- (void)updateCoreSpotlightReadingListDataAfterUpgrade:(id)a3
{
  id v4 = objc_msgSend(a3, "safari_filterObjectsUsingBlock:", &__block_literal_global_219);
  coreSpotlightDonationSerialQueue = self->_coreSpotlightDonationSerialQueue;
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __75__WBSSiriIntelligenceDonor_updateCoreSpotlightReadingListDataAfterUpgrade___block_invoke_2;
  v7[3] = &unk_1E5C8C920;
  void v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(coreSpotlightDonationSerialQueue, v7);
}

uint64_t __75__WBSSiriIntelligenceDonor_updateCoreSpotlightReadingListDataAfterUpgrade___block_invoke(uint64_t a1, void *a2)
{
  return [a2 isReadingListItem];
}

void __75__WBSSiriIntelligenceDonor_updateCoreSpotlightReadingListDataAfterUpgrade___block_invoke_2(uint64_t a1)
{
  id v3 = [*(id *)(a1 + 32) _computeCoreSpotlightIDsForBookmarks:*(void *)(a1 + 40)];
  uint64_t v2 = [*(id *)(a1 + 32) _searchableItemsForIDs:v3 allBookmarks:*(void *)(a1 + 40)];
  [*(id *)(a1 + 32) _indexCoreSpotlightData:v2 filterDeletedHistoryItems:0 completionHandler:&__block_literal_global_222];
}

void __75__WBSSiriIntelligenceDonor_updateCoreSpotlightReadingListDataAfterUpgrade___block_invoke_3(uint64_t a1, int a2)
{
  id v3 = WBS_LOG_CHANNEL_PREFIXSiriIntelligence();
  id v4 = v3;
  if (a2)
  {
    if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)id v6 = 0;
      _os_log_impl(&dword_1A6B5F000, v4, OS_LOG_TYPE_INFO, "Successfully indexed reading list items to CoreSpotlight on upgrade", v6, 2u);
    }
    id v5 = [MEMORY[0x1E4F1CB18] standardUserDefaults];
    [v5 setBool:1 forKey:@"DidUpdateCoreSpotlightBookmarksDataOnUpgrade"];
  }
  else if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
  {
    __75__WBSSiriIntelligenceDonor_updateCoreSpotlightReadingListDataAfterUpgrade___block_invoke_3_cold_1();
  }
}

- (void)reindexAllBookmarkAndHistoryItems:(id)a3 historiesForProfiles:(id)a4 withAcknowledgementHandler:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  v22[0] = MEMORY[0x1E4F143A8];
  v22[1] = 3221225472;
  v22[2] = __110__WBSSiriIntelligenceDonor_reindexAllBookmarkAndHistoryItems_historiesForProfiles_withAcknowledgementHandler___block_invoke;
  v22[3] = &unk_1E5C9FD30;
  void v22[4] = self;
  id v23 = v8;
  id v24 = v10;
  id v11 = v10;
  id v12 = v8;
  id v13 = (void *)MEMORY[0x1AD0C4F80](v22);
  id v14 = [MEMORY[0x1E4F1C9A8] currentCalendar];
  id v15 = [MEMORY[0x1E4F1C9C8] date];
  id v16 = [v14 components:60 fromDate:v15];
  objc_msgSend(v16, "setDay:", objc_msgSend(v16, "day") - 7);
  id v17 = [v14 dateFromComponents:v16];
  [(WBSSiriIntelligenceDonor *)self _donateHistoryItemsToCoreSpotlightCreatedAfterDate:v17 beforeDate:v15 historiesForProfiles:v9 withCompletionHandler:v13];

  reindexingBackgroundSystemTaskManager = self->_reindexingBackgroundSystemTaskManager;
  v20[0] = MEMORY[0x1E4F143A8];
  v20[1] = 3221225472;
  v20[2] = __110__WBSSiriIntelligenceDonor_reindexAllBookmarkAndHistoryItems_historiesForProfiles_withAcknowledgementHandler___block_invoke_225;
  v20[3] = &unk_1E5C8C920;
  v20[4] = self;
  id v21 = v9;
  id v19 = v9;
  [(WBSSpotlightReindexingBackgroundSystemTaskManager *)reindexingBackgroundSystemTaskManager registerAndSubmitRequestForTask:v20];
}

void __110__WBSSiriIntelligenceDonor_reindexAllBookmarkAndHistoryItems_historiesForProfiles_withAcknowledgementHandler___block_invoke(uint64_t a1, int a2)
{
  id v4 = WBS_LOG_CHANNEL_PREFIXSiriIntelligence();
  id v5 = v4;
  if (a2)
  {
    if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1A6B5F000, v5, OS_LOG_TYPE_INFO, "Successfully re-indexed last week of searchable history items for CoreSpotlight", buf, 2u);
    }
  }
  else if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
  {
    __110__WBSSiriIntelligenceDonor_reindexAllBookmarkAndHistoryItems_historiesForProfiles_withAcknowledgementHandler___block_invoke_cold_1();
  }
  id v6 = *(void **)(a1 + 32);
  uint64_t v7 = *(void *)(a1 + 40);
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __110__WBSSiriIntelligenceDonor_reindexAllBookmarkAndHistoryItems_historiesForProfiles_withAcknowledgementHandler___block_invoke_224;
  v8[3] = &unk_1E5C9DF10;
  id v9 = *(id *)(a1 + 48);
  [v6 donateSafariBookmarksToCoreSpotlight:v7 withCompletionHandler:v8];
}

uint64_t __110__WBSSiriIntelligenceDonor_reindexAllBookmarkAndHistoryItems_historiesForProfiles_withAcknowledgementHandler___block_invoke_224(uint64_t a1, int a2)
{
  id v4 = WBS_LOG_CHANNEL_PREFIXSiriIntelligence();
  id v5 = v4;
  if (a2)
  {
    if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)uint64_t v7 = 0;
      _os_log_impl(&dword_1A6B5F000, v5, OS_LOG_TYPE_INFO, "Successfully re-indexed all searchable bookmark items for CoreSpotlight", v7, 2u);
    }
  }
  else if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
  {
    __110__WBSSiriIntelligenceDonor_reindexAllBookmarkAndHistoryItems_historiesForProfiles_withAcknowledgementHandler___block_invoke_224_cold_1();
  }
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

uint64_t __110__WBSSiriIntelligenceDonor_reindexAllBookmarkAndHistoryItems_historiesForProfiles_withAcknowledgementHandler___block_invoke_225(uint64_t a1)
{
  return [*(id *)(a1 + 32) donateAllHistoryToCoreSpotlightForProfiles:*(void *)(a1 + 40) completionHandler:&__block_literal_global_227];
}

void __110__WBSSiriIntelligenceDonor_reindexAllBookmarkAndHistoryItems_historiesForProfiles_withAcknowledgementHandler___block_invoke_2(uint64_t a1, int a2)
{
  id v3 = WBS_LOG_CHANNEL_PREFIXSiriIntelligence();
  id v4 = v3;
  if (a2)
  {
    if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)id v5 = 0;
      _os_log_impl(&dword_1A6B5F000, v4, OS_LOG_TYPE_INFO, "Successfully re-indexed all searchable history items for CoreSpotlight", v5, 2u);
    }
  }
  else if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
  {
    __110__WBSSiriIntelligenceDonor_reindexAllBookmarkAndHistoryItems_historiesForProfiles_withAcknowledgementHandler___block_invoke_2_cold_1();
  }
}

- (void)reindexBookmarkAndHistoryItemsWithIdentifiers:(id)a3 allBookmarks:(id)a4 historiesForProfiles:(id)a5 withAcknowledgementHandler:(id)a6
{
  id v10 = a4;
  id v11 = a5;
  id v12 = a6;
  id v13 = v12;
  if (a3)
  {
    id v14 = (NSMutableSet *)[a3 mutableCopy];
    identifiersLeftToReindex = self->_identifiersLeftToReindex;
    self->_identifiersLeftToReindex = v14;

    id v16 = [MEMORY[0x1E4F1C9C8] distantPast];
    id v17 = [MEMORY[0x1E4F1C9C8] date];
    v18[0] = MEMORY[0x1E4F143A8];
    v18[1] = 3221225472;
    v18[2] = __135__WBSSiriIntelligenceDonor_reindexBookmarkAndHistoryItemsWithIdentifiers_allBookmarks_historiesForProfiles_withAcknowledgementHandler___block_invoke;
    v18[3] = &unk_1E5C9FD30;
    v18[4] = self;
    id v19 = v10;
    id v20 = v13;
    [(WBSSiriIntelligenceDonor *)self _donateHistoryItemsToCoreSpotlightCreatedAfterDate:v16 beforeDate:v17 historiesForProfiles:v11 withCompletionHandler:v18];
  }
  else
  {
    (*((void (**)(id))v12 + 2))(v12);
  }
}

void __135__WBSSiriIntelligenceDonor_reindexBookmarkAndHistoryItemsWithIdentifiers_allBookmarks_historiesForProfiles_withAcknowledgementHandler___block_invoke(uint64_t a1, int a2)
{
  id v4 = WBS_LOG_CHANNEL_PREFIXSiriIntelligence();
  id v5 = v4;
  if (a2)
  {
    if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1A6B5F000, v5, OS_LOG_TYPE_INFO, "Successfully re-indexed searchable history items with identifiers to CoreSpotlight", buf, 2u);
    }
  }
  else if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
  {
    __135__WBSSiriIntelligenceDonor_reindexBookmarkAndHistoryItemsWithIdentifiers_allBookmarks_historiesForProfiles_withAcknowledgementHandler___block_invoke_cold_1();
  }
  id v6 = (id)[*(id *)(a1 + 32) _computeCoreSpotlightIDsForBookmarks:*(void *)(a1 + 40)];
  uint64_t v7 = *(id **)(a1 + 32);
  id v8 = (void *)[v7[2] copy];
  id v9 = [v7 _searchableItemsForIDs:v8 allBookmarks:*(void *)(a1 + 40)];

  id v10 = *(void **)(a1 + 32);
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = __135__WBSSiriIntelligenceDonor_reindexBookmarkAndHistoryItemsWithIdentifiers_allBookmarks_historiesForProfiles_withAcknowledgementHandler___block_invoke_228;
  v11[3] = &unk_1E5C9A7F8;
  v11[4] = v10;
  id v12 = *(id *)(a1 + 48);
  [v10 _indexCoreSpotlightData:v9 filterDeletedHistoryItems:0 completionHandler:v11];
}

void __135__WBSSiriIntelligenceDonor_reindexBookmarkAndHistoryItemsWithIdentifiers_allBookmarks_historiesForProfiles_withAcknowledgementHandler___block_invoke_228(uint64_t a1, int a2)
{
  id v4 = WBS_LOG_CHANNEL_PREFIXSiriIntelligence();
  id v5 = v4;
  if (a2)
  {
    if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1A6B5F000, v5, OS_LOG_TYPE_INFO, "Successfully re-indexed searchable bookmark items with identifiers to CoreSpotlight", buf, 2u);
    }
  }
  else if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
  {
    __135__WBSSiriIntelligenceDonor_reindexBookmarkAndHistoryItemsWithIdentifiers_allBookmarks_historiesForProfiles_withAcknowledgementHandler___block_invoke_228_cold_1();
  }
  id v6 = *(id **)(a1 + 32);
  uint64_t v7 = [v6[2] allObjects];
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __135__WBSSiriIntelligenceDonor_reindexBookmarkAndHistoryItemsWithIdentifiers_allBookmarks_historiesForProfiles_withAcknowledgementHandler___block_invoke_229;
  v9[3] = &unk_1E5C9A7F8;
  id v8 = *(void **)(a1 + 40);
  v9[4] = *(void *)(a1 + 32);
  id v10 = v8;
  [v6 removeCoreSpotlightDataWithIDs:v7 completionHandler:v9];
}

uint64_t __135__WBSSiriIntelligenceDonor_reindexBookmarkAndHistoryItemsWithIdentifiers_allBookmarks_historiesForProfiles_withAcknowledgementHandler___block_invoke_229(uint64_t a1, int a2)
{
  id v4 = WBS_LOG_CHANNEL_PREFIXSiriIntelligence();
  id v5 = v4;
  if (a2)
  {
    if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)id v9 = 0;
      _os_log_impl(&dword_1A6B5F000, v5, OS_LOG_TYPE_INFO, "Successfully removed spotlight items that do not map to a current history or bookmark item", v9, 2u);
    }
  }
  else if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
  {
    __135__WBSSiriIntelligenceDonor_reindexBookmarkAndHistoryItemsWithIdentifiers_allBookmarks_historiesForProfiles_withAcknowledgementHandler___block_invoke_229_cold_1();
  }
  uint64_t v6 = *(void *)(a1 + 32);
  uint64_t v7 = *(void **)(v6 + 16);
  *(void *)(v6 + 16) = 0;

  return (*(uint64_t (**)(void))(*(void *)(a1 + 40) + 16))();
}

- (void)_donateHistoryItemsToCoreSpotlightCreatedAfterDate:(id)a3 beforeDate:(id)a4 historiesForProfiles:(id)a5 withCompletionHandler:(id)a6
{
  uint64_t v36 = *MEMORY[0x1E4F143B8];
  id v20 = a3;
  id v19 = a4;
  id v10 = a5;
  id v17 = a6;
  v33[0] = 0;
  v33[1] = v33;
  v33[2] = 0x2020000000;
  char v34 = 0;
  id v11 = dispatch_group_create();
  long long v29 = 0u;
  long long v30 = 0u;
  long long v31 = 0u;
  long long v32 = 0u;
  id obj = v10;
  uint64_t v12 = [obj countByEnumeratingWithState:&v29 objects:v35 count:16];
  if (v12)
  {
    uint64_t v13 = *(void *)v30;
    do
    {
      uint64_t v14 = 0;
      do
      {
        if (*(void *)v30 != v13) {
          objc_enumerationMutation(obj);
        }
        id v15 = *(void **)(*((void *)&v29 + 1) + 8 * v14);
        dispatch_group_enter(v11);
        v24[0] = MEMORY[0x1E4F143A8];
        v24[1] = 3221225472;
        v24[2] = __133__WBSSiriIntelligenceDonor__donateHistoryItemsToCoreSpotlightCreatedAfterDate_beforeDate_historiesForProfiles_withCompletionHandler___block_invoke;
        v24[3] = &unk_1E5C9FDD0;
        id v25 = v11;
        id v26 = self;
        id v27 = v15;
        id v28 = v33;
        [v15 getVisitsCreatedAfterDate:v20 beforeDate:v19 completionHandler:v24];

        ++v14;
      }
      while (v12 != v14);
      uint64_t v12 = [obj countByEnumeratingWithState:&v29 objects:v35 count:16];
    }
    while (v12);
  }

  if (v17)
  {
    coreSpotlightDonationSerialQueue = self->_coreSpotlightDonationSerialQueue;
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __133__WBSSiriIntelligenceDonor__donateHistoryItemsToCoreSpotlightCreatedAfterDate_beforeDate_historiesForProfiles_withCompletionHandler___block_invoke_234;
    block[3] = &unk_1E5C9FDF8;
    id v22 = v17;
    id v23 = v33;
    dispatch_group_notify(v11, coreSpotlightDonationSerialQueue, block);
  }
  _Block_object_dispose(v33, 8);
}

void __133__WBSSiriIntelligenceDonor__donateHistoryItemsToCoreSpotlightCreatedAfterDate_beforeDate_historiesForProfiles_withCompletionHandler___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  if ([v3 count])
  {
    id v4 = *(NSObject **)(*(void *)(a1 + 40) + 8);
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __133__WBSSiriIntelligenceDonor__donateHistoryItemsToCoreSpotlightCreatedAfterDate_beforeDate_historiesForProfiles_withCompletionHandler___block_invoke_2;
    block[3] = &unk_1E5C9FDA8;
    void block[4] = *(void *)(a1 + 48);
    id v5 = v3;
    uint64_t v6 = *(void *)(a1 + 56);
    id v10 = v5;
    uint64_t v13 = v6;
    id v7 = *(id *)(a1 + 32);
    uint64_t v8 = *(void *)(a1 + 40);
    id v11 = v7;
    uint64_t v12 = v8;
    dispatch_async(v4, block);
  }
  else
  {
    dispatch_group_leave(*(dispatch_group_t *)(a1 + 32));
  }
}

void __133__WBSSiriIntelligenceDonor__donateHistoryItemsToCoreSpotlightCreatedAfterDate_beforeDate_historiesForProfiles_withCompletionHandler___block_invoke_2(uint64_t a1)
{
  id v2 = objc_alloc_init(MEMORY[0x1E4F1CA80]);
  id v3 = *(id *)(a1 + 32);
  id v4 = [v3 databaseID];
  id v5 = *(void **)(a1 + 40);
  v14[0] = MEMORY[0x1E4F143A8];
  v14[1] = 3221225472;
  v14[2] = __133__WBSSiriIntelligenceDonor__donateHistoryItemsToCoreSpotlightCreatedAfterDate_beforeDate_historiesForProfiles_withCompletionHandler___block_invoke_3;
  v14[3] = &unk_1E5C9FD58;
  id v6 = v4;
  id v15 = v6;
  id v16 = v2;
  id v7 = v2;
  [v5 enumerateObjectsUsingBlock:v14];
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __133__WBSSiriIntelligenceDonor__donateHistoryItemsToCoreSpotlightCreatedAfterDate_beforeDate_historiesForProfiles_withCompletionHandler___block_invoke_4;
  v10[3] = &unk_1E5C9FD80;
  uint64_t v13 = *(void *)(a1 + 64);
  id v11 = v6;
  id v12 = *(id *)(a1 + 48);
  id v8 = v6;
  id v9 = (void *)MEMORY[0x1AD0C4F80](v10);
  [*(id *)(a1 + 56) _indexHistoryItemsToCoreSpotlight:v7 filterDeletedHistoryItems:1 completionHandler:v9];
}

void __133__WBSSiriIntelligenceDonor__donateHistoryItemsToCoreSpotlightCreatedAfterDate_beforeDate_historiesForProfiles_withCompletionHandler___block_invoke_3(uint64_t a1, void *a2)
{
  id v3 = a2;
  uint64_t v14 = objc_alloc_init(WBSSiriIntelligenceDonorHistoryData);
  id v4 = [v3 item];
  id v5 = (void *)MEMORY[0x1E4F1CB10];
  id v6 = [v4 urlString];
  id v7 = objc_msgSend(v5, "safari_URLWithDataAsString:", v6);
  [(WBSSiriIntelligenceDonorHistoryData *)v14 setPageURL:v7];

  id v8 = [v3 title];

  [(WBSSiriIntelligenceDonorHistoryData *)v14 setPageTitle:v8];
  id v9 = [v4 lastVisitedDate];
  [(WBSSiriIntelligenceDonorHistoryData *)v14 setLastVisitedDate:v9];

  id v10 = [v4 userVisibleURLString];
  [(WBSSiriIntelligenceDonorHistoryData *)v14 setUserVisibleURLString:v10];

  [(WBSSiriIntelligenceDonorHistoryData *)v14 setProfileIdentifier:*(void *)(a1 + 32)];
  uint64_t v11 = [(WBSSiriIntelligenceDonorHistoryData *)v14 pageURL];
  if (v11)
  {
    id v12 = (void *)v11;
    uint64_t v13 = [(WBSSiriIntelligenceDonorHistoryData *)v14 pageTitle];

    if (v13) {
      [*(id *)(a1 + 40) addObject:v14];
    }
  }
}

void __133__WBSSiriIntelligenceDonor__donateHistoryItemsToCoreSpotlightCreatedAfterDate_beforeDate_historiesForProfiles_withCompletionHandler___block_invoke_4(uint64_t a1, char a2)
{
  uint64_t v8 = *MEMORY[0x1E4F143B8];
  if (a2)
  {
    id v3 = WBS_LOG_CHANNEL_PREFIXSiriIntelligence();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
    {
      uint64_t v4 = *(void *)(a1 + 32);
      int v6 = 138412290;
      uint64_t v7 = v4;
      _os_log_impl(&dword_1A6B5F000, v3, OS_LOG_TYPE_INFO, "Successfully re-indexed all searchable history items to CoreSpotlight for profile with ID: %@", (uint8_t *)&v6, 0xCu);
    }
  }
  else
  {
    *(unsigned char *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) = 1;
    id v5 = WBS_LOG_CHANNEL_PREFIXSiriIntelligence();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR)) {
      __133__WBSSiriIntelligenceDonor__donateHistoryItemsToCoreSpotlightCreatedAfterDate_beforeDate_historiesForProfiles_withCompletionHandler___block_invoke_4_cold_1(a1, v5);
    }
  }
  dispatch_group_leave(*(dispatch_group_t *)(a1 + 40));
}

uint64_t __133__WBSSiriIntelligenceDonor__donateHistoryItemsToCoreSpotlightCreatedAfterDate_beforeDate_historiesForProfiles_withCompletionHandler___block_invoke_234(uint64_t a1)
{
  return (*(uint64_t (**)(void, BOOL))(*(void *)(a1 + 32) + 16))(*(void *)(a1 + 32), *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) == 0);
}

- (id)_coreSpotlightItemsSubarrays:(id)a3
{
  id v3 = a3;
  uint64_t v4 = [v3 count];
  if (v4)
  {
    uint64_t v5 = v4;
    int v6 = [MEMORY[0x1E4F1CA48] array];
    uint64_t v7 = v6;
    if (v5 >= 0x8000)
    {
      do
      {
        if (v5 >= 0x7FFF) {
          uint64_t v8 = 0x7FFFLL;
        }
        else {
          uint64_t v8 = v5;
        }
        id v9 = objc_msgSend(v3, "subarrayWithRange:", 0, v8);
        [v7 addObject:v9];
        v5 -= v8;
      }
      while (v5);
    }
    else
    {
      [v6 addObject:v3];
    }
  }
  else
  {
    uint64_t v7 = 0;
  }

  return v7;
}

- (id)_arrayByFilteringDeletedHistoryItems:(id)a3
{
  uint64_t v4 = (void *)MEMORY[0x1E4F1CA60];
  id v5 = a3;
  int v6 = [v4 dictionary];
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __65__WBSSiriIntelligenceDonor__arrayByFilteringDeletedHistoryItems___block_invoke;
  v10[3] = &unk_1E5C9FE48;
  void v10[4] = self;
  id v11 = v6;
  id v7 = v6;
  uint64_t v8 = objc_msgSend(v5, "safari_filterObjectsUsingBlock:", v10);

  return v8;
}

BOOL __65__WBSSiriIntelligenceDonor__arrayByFilteringDeletedHistoryItems___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  uint64_t v4 = [v3 attributeSet];
  id v5 = [v4 contentType];

  if (v5 == @"com.apple.safari.history")
  {
    id v7 = [v3 attributeSet];
    uint64_t v8 = [(id)objc_opt_class() coreSpotlightProfileIDKey];
    id v9 = [v7 valueForCustomKey:v8];

    if (v9)
    {
      id v10 = [*(id *)(a1 + 40) objectForKeyedSubscript:v9];
      if (!v10)
      {
        id v11 = +[WBSHistoryController existingSharedHistoryController];
        id v10 = [v11 historyForProfileIdentifier:v9 loadIfNeeded:1];

        [*(id *)(a1 + 40) setValue:v10 forKey:v9];
      }
      id v12 = [v3 attributeSet];
      uint64_t v13 = [v12 contentURL];
      uint64_t v14 = [v10 itemForURL:v13];
      BOOL v6 = v14 != 0;
    }
    else
    {
      BOOL v6 = 0;
    }
  }
  else
  {
    BOOL v6 = 1;
  }

  return v6;
}

void __112__WBSSiriIntelligenceDonor__indexCoreSpotlightData_filterDeletedHistoryItems_onDispatchQueue_completionHandler___block_invoke(uint64_t a1)
{
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  long long v18 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  long long v21 = 0u;
  id obj = *(id *)(a1 + 32);
  uint64_t v2 = [obj countByEnumeratingWithState:&v18 objects:v22 count:16];
  if (v2)
  {
    uint64_t v3 = v2;
    uint64_t v4 = *(void *)v19;
    do
    {
      for (uint64_t i = 0; i != v3; ++i)
      {
        if (*(void *)v19 != v4) {
          objc_enumerationMutation(obj);
        }
        BOOL v6 = *(void **)(*((void *)&v18 + 1) + 8 * i);
        if (*(unsigned char *)(a1 + 72))
        {
          id v7 = [*(id *)(a1 + 40) _arrayByFilteringDeletedHistoryItems:v6];
        }
        else
        {
          id v7 = v6;
        }
        uint64_t v8 = v7;
        id v9 = [MEMORY[0x1E4F23838] defaultSearchableIndex];
        v17[0] = MEMORY[0x1E4F143A8];
        v17[1] = 3221225472;
        v17[2] = __112__WBSSiriIntelligenceDonor__indexCoreSpotlightData_filterDeletedHistoryItems_onDispatchQueue_completionHandler___block_invoke_2;
        v17[3] = &unk_1E5C9C638;
        v17[4] = *(void *)(a1 + 64);
        [v9 indexSearchableItems:v8 completionHandler:v17];
      }
      uint64_t v3 = [obj countByEnumeratingWithState:&v18 objects:v22 count:16];
    }
    while (v3);
  }

  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __112__WBSSiriIntelligenceDonor__indexCoreSpotlightData_filterDeletedHistoryItems_onDispatchQueue_completionHandler___block_invoke_240;
  block[3] = &unk_1E5C9FDF8;
  id v10 = *(NSObject **)(a1 + 48);
  id v11 = *(id *)(a1 + 56);
  uint64_t v12 = *(void *)(a1 + 64);
  id v15 = v11;
  uint64_t v16 = v12;
  dispatch_async(v10, block);
}

void __112__WBSSiriIntelligenceDonor__indexCoreSpotlightData_filterDeletedHistoryItems_onDispatchQueue_completionHandler___block_invoke_2(uint64_t a1, void *a2)
{
  id v4 = a2;
  if (v4)
  {
    objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 32) + 8) + 40), a2);
    id v5 = WBS_LOG_CHANNEL_PREFIXSiriIntelligence();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR)) {
      __112__WBSSiriIntelligenceDonor__indexCoreSpotlightData_filterDeletedHistoryItems_onDispatchQueue_completionHandler___block_invoke_2_cold_1(v5);
    }
  }
}

uint64_t __112__WBSSiriIntelligenceDonor__indexCoreSpotlightData_filterDeletedHistoryItems_onDispatchQueue_completionHandler___block_invoke_240(uint64_t a1)
{
  uint64_t result = *(void *)(a1 + 32);
  if (result) {
    return (*(uint64_t (**)(uint64_t, BOOL))(result + 16))(result, *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 40) == 0);
  }
  return result;
}

void __94__WBSSiriIntelligenceDonor__removeCoreSpotlightDataWithIDs_onDispatchQueue_completionHandler___block_invoke(uint64_t a1)
{
  uint64_t v2 = [MEMORY[0x1E4F23838] defaultSearchableIndex];
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __94__WBSSiriIntelligenceDonor__removeCoreSpotlightDataWithIDs_onDispatchQueue_completionHandler___block_invoke_2;
  v4[3] = &unk_1E5C8DCF8;
  uint64_t v3 = *(void *)(a1 + 32);
  id v5 = *(id *)(a1 + 40);
  [v2 deleteSearchableItemsWithIdentifiers:v3 completionHandler:v4];
}

void __94__WBSSiriIntelligenceDonor__removeCoreSpotlightDataWithIDs_onDispatchQueue_completionHandler___block_invoke_2(uint64_t a1, void *a2)
{
  id v3 = a2;
  if (v3)
  {
    id v4 = WBS_LOG_CHANNEL_PREFIXSiriIntelligence();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
      __94__WBSSiriIntelligenceDonor__removeCoreSpotlightDataWithIDs_onDispatchQueue_completionHandler___block_invoke_2_cold_1(v4);
    }
  }
  uint64_t v5 = *(void *)(a1 + 32);
  if (v5) {
    (*(void (**)(uint64_t, BOOL))(v5 + 16))(v5, v3 == 0);
  }
}

- (void)removeAllCoreSpotlightHistoryDataDonatedBySafariForProfileWithIdentifier:(id)a3
{
  id v4 = a3;
  uint64_t v5 = WBS_LOG_CHANNEL_PREFIXSiriIntelligence();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1A6B5F000, v5, OS_LOG_TYPE_INFO, "Removing all CoreSpotlight data donated by Safari", buf, 2u);
  }
  coreSpotlightDonationSerialQueue = self->_coreSpotlightDonationSerialQueue;
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __101__WBSSiriIntelligenceDonor_removeAllCoreSpotlightHistoryDataDonatedBySafariForProfileWithIdentifier___block_invoke;
  v8[3] = &unk_1E5C8C920;
  void v8[4] = self;
  id v9 = v4;
  id v7 = v4;
  dispatch_async(coreSpotlightDonationSerialQueue, v8);
}

void __101__WBSSiriIntelligenceDonor_removeAllCoreSpotlightHistoryDataDonatedBySafariForProfileWithIdentifier___block_invoke(uint64_t a1)
{
  v6[2] = *MEMORY[0x1E4F143B8];
  uint64_t v2 = [(id)objc_opt_class() coreSpotlightPageDonationIdentifierForProfileWithIdentifier:*(void *)(a1 + 40)];
  id v3 = [(id)objc_opt_class() _coreSpotlightTabDonationIdentifierForProfileWithIdentifier:*(void *)(a1 + 40)];
  v6[0] = v2;
  v6[1] = v3;
  id v4 = [MEMORY[0x1E4F1C978] arrayWithObjects:v6 count:2];
  uint64_t v5 = [MEMORY[0x1E4F23838] defaultSearchableIndex];
  [v5 deleteSearchableItemsWithDomainIdentifiers:v4 completionHandler:&__block_literal_global_242];
}

void __101__WBSSiriIntelligenceDonor_removeAllCoreSpotlightHistoryDataDonatedBySafariForProfileWithIdentifier___block_invoke_2(uint64_t a1, void *a2)
{
  id v2 = a2;
  id v3 = WBS_LOG_CHANNEL_PREFIXSiriIntelligence();
  id v4 = v3;
  if (v2)
  {
    if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR)) {
      __101__WBSSiriIntelligenceDonor_removeAllCoreSpotlightHistoryDataDonatedBySafariForProfileWithIdentifier___block_invoke_2_cold_2(v4);
    }
  }
  else if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG))
  {
    __101__WBSSiriIntelligenceDonor_removeAllCoreSpotlightHistoryDataDonatedBySafariForProfileWithIdentifier___block_invoke_2_cold_1();
  }
}

- (void)_indexHistoryItemsToCoreSpotlight:(id)a3 filterDeletedHistoryItems:(BOOL)a4 completionHandler:(id)a5
{
  BOOL v6 = a4;
  id v8 = a3;
  id v9 = (void (**)(id, uint64_t))a5;
  if ([v8 count])
  {
    id v10 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
    uint64_t v12 = MEMORY[0x1E4F143A8];
    uint64_t v13 = 3221225472;
    uint64_t v14 = __106__WBSSiriIntelligenceDonor__indexHistoryItemsToCoreSpotlight_filterDeletedHistoryItems_completionHandler___block_invoke;
    id v15 = &unk_1E5C9FE98;
    uint64_t v16 = self;
    id v17 = v10;
    id v11 = v10;
    [v8 enumerateObjectsUsingBlock:&v12];
    -[WBSSiriIntelligenceDonor _indexCoreSpotlightData:filterDeletedHistoryItems:completionHandler:](self, "_indexCoreSpotlightData:filterDeletedHistoryItems:completionHandler:", v11, v6, v9, v12, v13, v14, v15, v16);
  }
  else if (v9)
  {
    v9[2](v9, 1);
  }
}

void __106__WBSSiriIntelligenceDonor__indexHistoryItemsToCoreSpotlight_filterDeletedHistoryItems_completionHandler___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v54 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  id v4 = objc_opt_class();
  uint64_t v5 = [v3 userVisibleURLString];
  BOOL v6 = [v3 profileIdentifier];
  id v7 = [v4 _historyItemIdentifierForURLString:v5 profileIdentifier:v6];

  id v8 = *(void **)(*(void *)(a1 + 32) + 16);
  if (v8)
  {
    if (![v8 containsObject:v7]) {
      goto LABEL_30;
    }
    id v9 = *(void **)(*(void *)(a1 + 32) + 16);
    if (v9) {
      [v9 removeObject:v7];
    }
  }
  id v10 = [v3 pageURL];

  if (v10)
  {
    id v11 = (void *)[objc_alloc(MEMORY[0x1E4F23850]) initWithItemContentType:@"com.apple.safari.history"];
    uint64_t v12 = [v3 pageURL];
    [v11 setContentURL:v12];

    uint64_t v13 = [v3 pageTitle];
    [v11 setTitle:v13];

    uint64_t v14 = [v3 readerText];
    if (v14)
    {
      [v11 setTextContent:v14];
    }
    else
    {
      uint64_t v16 = [v3 fullPageText];
      [v11 setTextContent:v16];
    }
    id v17 = [v3 readerText];
    if (v17) {
      long long v18 = @"ReaderText";
    }
    else {
      long long v18 = @"FullPageText";
    }
    [v11 setTextContentDataSource:v18];

    long long v19 = [v3 lastVisitedDate];
    [v11 setLastUsedDate:v19];

    long long v20 = [v3 profileIdentifier];
    long long v21 = [(id)objc_opt_class() coreSpotlightProfileIDKey];
    [v11 setValue:v20 forCustomKey:v21];

    id v22 = *(void **)(a1 + 32);
    uint64_t v23 = [v3 pageURL];
    id v24 = [v22 _contentDescriptionForURL:v23];
    [v11 setContentDescription:v24];

    if (objc_opt_respondsToSelector())
    {
      id v25 = [v3 autocompleteTriggers];
      [v11 setAutocompleteTriggers:v25];
    }
    uint64_t v26 = [v3 personalizationData];
    if (v26)
    {
      id v27 = (void *)v26;
      id v28 = [v3 personalizationData];
      long long v29 = [v28 searchQuery];

      if (v29)
      {
        if (objc_opt_respondsToSelector())
        {
          long long v30 = [v3 lastVisitedDate];
          [v11 setLastAppEngagementDate:v30];
        }
        if (objc_opt_respondsToSelector())
        {
          long long v31 = [v3 personalizationData];
          long long v32 = [v31 searchQuery];
          [v11 setLastAppSearchEngagementQuery:v32];
        }
        if (objc_opt_respondsToSelector())
        {
          id v33 = NSNumber;
          char v34 = [v3 personalizationData];
          uint64_t v35 = objc_msgSend(v33, "numberWithInt:", objc_msgSend(v34, "position"));
          [v11 setLastAppSearchEngagementRenderPosition:v35];
        }
      }
    }
    uint64_t v36 = objc_opt_class();
    id v37 = [v3 userVisibleURLString];
    v38 = [v36 _coreSpotlightItemIdentifierForURLString:v37];
    [v11 setWeakRelatedUniqueIdentifier:v38];

    [*(id *)(a1 + 32) _sanitizeAttributeSet:v11];
    id v39 = objc_opt_class();
    long long v40 = [v3 profileIdentifier];
    long long v41 = [v39 coreSpotlightPageDonationIdentifierForProfileWithIdentifier:v40];

    long long v42 = (void *)[objc_alloc(MEMORY[0x1E4F23840]) initWithUniqueIdentifier:v7 domainIdentifier:v41 attributeSet:v11];
    long long v43 = WBS_LOG_CHANNEL_PREFIXSiriIntelligence();
    if (os_log_type_enabled(v43, OS_LOG_TYPE_DEBUG)) {
      __106__WBSSiriIntelligenceDonor__indexHistoryItemsToCoreSpotlight_filterDeletedHistoryItems_completionHandler___block_invoke_cold_1((uint64_t)v7, v43, v11);
    }
    long long v44 = WBS_LOG_CHANNEL_PREFIXSiriIntelligence();
    if (os_log_type_enabled(v44, OS_LOG_TYPE_DEBUG))
    {
      id v45 = v44;
      long long v46 = [v3 pageURL];
      long long v47 = [v11 textContent];
      int v48 = 138478339;
      id v49 = v46;
      __int16 v50 = 2113;
      v51 = v7;
      __int16 v52 = 2048;
      uint64_t v53 = [v47 length];
      _os_log_debug_impl(&dword_1A6B5F000, v45, OS_LOG_TYPE_DEBUG, "Donating history item to CoreSpotlight with URL: %{private}@ ID: %{private}@ text content length: %ld", (uint8_t *)&v48, 0x20u);

      if (!v42) {
        goto LABEL_29;
      }
    }
    else if (!v42)
    {
LABEL_29:

      goto LABEL_30;
    }
    [*(id *)(*(void *)(a1 + 32) + 32) correlateHistoryEntityForItem:v42];
    [*(id *)(a1 + 40) addObject:v42];
    goto LABEL_29;
  }
  id v15 = WBS_LOG_CHANNEL_PREFIXSiriIntelligence();
  if (os_log_type_enabled(v15, OS_LOG_TYPE_INFO))
  {
    LOWORD(v48) = 0;
    _os_log_impl(&dword_1A6B5F000, v15, OS_LOG_TYPE_INFO, "Skipping donation of history item due to nil url.", (uint8_t *)&v48, 2u);
  }
LABEL_30:
}

- (id)_contentDescriptionForURL:(id)a3
{
  id v3 = objc_msgSend(a3, "safari_userVisibleString");
  id v4 = objc_msgSend(v3, "safari_simplifiedUserVisibleURLStringWithSimplifications:forDisplayOnly:simplifiedStringOffset:", 335, 1, 0);

  return v4;
}

void __94__WBSSiriIntelligenceDonor__getIndexedItemsForSearchQueryString_attributes_completionHandler___block_invoke_3(uint64_t a1)
{
  [*(id *)(a1 + 32) cancel];
  id obj = (id)MEMORY[0x1AD0C4F80](*(void *)(a1 + 40));
  objc_sync_enter(obj);
  if ((_WBSRunOnceImpl() & 1) == 0)
  {
    uint64_t v2 = *(void *)(a1 + 40);
    id v3 = [MEMORY[0x1E4F28C58] errorWithDomain:*MEMORY[0x1E4F281F8] code:256 userInfo:0];
    (*(void (**)(uint64_t, void, void *))(v2 + 16))(v2, 0, v3);
  }
  objc_sync_exit(obj);
}

- (void)_getIndexedIDsForSearchQueryString:(id)a3 completionHandler:(id)a4
{
  id v6 = a3;
  id v7 = (void *)[a4 copy];
  id v8 = objc_alloc_init(MEMORY[0x1E4F23830]);
  [v8 setPrivateQuery:1];
  [v8 setFetchAttributes:&unk_1EFC222C8];
  id v9 = (void *)[objc_alloc(MEMORY[0x1E4F23828]) initWithQueryString:v6 queryContext:v8];

  id v10 = objc_alloc_init(MEMORY[0x1E4F1CA80]);
  v26[0] = MEMORY[0x1E4F143A8];
  v26[1] = 3221225472;
  v26[2] = __81__WBSSiriIntelligenceDonor__getIndexedIDsForSearchQueryString_completionHandler___block_invoke;
  v26[3] = &unk_1E5C9F218;
  id v11 = v10;
  id v27 = v11;
  [v9 setFoundItemsHandler:v26];
  coreSpotlightDonationSerialQueue = self->_coreSpotlightDonationSerialQueue;
  v23[0] = MEMORY[0x1E4F143A8];
  v23[1] = 3221225472;
  v23[2] = __81__WBSSiriIntelligenceDonor__getIndexedIDsForSearchQueryString_completionHandler___block_invoke_3;
  v23[3] = &unk_1E5C8CDF0;
  id v24 = v9;
  id v13 = v7;
  id v25 = v13;
  id v14 = v9;
  id v15 = +[WBSDispatchSourceTimer timerWithInterval:0 repeats:coreSpotlightDonationSerialQueue queue:v23 handler:5000000000.0];
  v19[0] = MEMORY[0x1E4F143A8];
  v19[1] = 3221225472;
  v19[2] = __81__WBSSiriIntelligenceDonor__getIndexedIDsForSearchQueryString_completionHandler___block_invoke_4;
  v19[3] = &unk_1E5C9FF10;
  v19[4] = self;
  id v20 = v15;
  id v21 = v11;
  id v22 = v13;
  id v16 = v11;
  id v17 = v13;
  id v18 = v15;
  [v14 setCompletionHandler:v19];
  [v14 start];
}

void __81__WBSSiriIntelligenceDonor__getIndexedIDsForSearchQueryString_completionHandler___block_invoke(uint64_t a1, void *a2)
{
  v3[0] = MEMORY[0x1E4F143A8];
  v3[1] = 3221225472;
  v3[2] = __81__WBSSiriIntelligenceDonor__getIndexedIDsForSearchQueryString_completionHandler___block_invoke_2;
  v3[3] = &unk_1E5C9FEC0;
  id v4 = *(id *)(a1 + 32);
  [a2 enumerateObjectsUsingBlock:v3];
}

void __81__WBSSiriIntelligenceDonor__getIndexedIDsForSearchQueryString_completionHandler___block_invoke_2(uint64_t a1, void *a2)
{
  id v6 = a2;
  id v3 = *(id *)(a1 + 32);
  objc_sync_enter(v3);
  id v4 = [v6 attributeSet];
  uint64_t v5 = [v4 uniqueIdentifier];

  if (v5) {
    [*(id *)(a1 + 32) addObject:v5];
  }

  objc_sync_exit(v3);
}

void __81__WBSSiriIntelligenceDonor__getIndexedIDsForSearchQueryString_completionHandler___block_invoke_3(uint64_t a1)
{
  [*(id *)(a1 + 32) cancel];
  id obj = (id)MEMORY[0x1AD0C4F80](*(void *)(a1 + 40));
  objc_sync_enter(obj);
  if ((_WBSRunOnceImpl() & 1) == 0)
  {
    uint64_t v2 = *(void *)(a1 + 40);
    id v3 = [MEMORY[0x1E4F28C58] errorWithDomain:*MEMORY[0x1E4F281F8] code:256 userInfo:0];
    (*(void (**)(uint64_t, void, void *))(v2 + 16))(v2, 0, v3);
  }
  objc_sync_exit(obj);
}

void __81__WBSSiriIntelligenceDonor__getIndexedIDsForSearchQueryString_completionHandler___block_invoke_4(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = *(NSObject **)(*(void *)(a1 + 32) + 8);
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __81__WBSSiriIntelligenceDonor__getIndexedIDsForSearchQueryString_completionHandler___block_invoke_5;
  void v6[3] = &unk_1E5C9FEE8;
  id v7 = *(id *)(a1 + 40);
  id v8 = v3;
  id v10 = *(id *)(a1 + 56);
  id v9 = *(id *)(a1 + 48);
  id v5 = v3;
  dispatch_async(v4, v6);
}

void __81__WBSSiriIntelligenceDonor__getIndexedIDsForSearchQueryString_completionHandler___block_invoke_5(uint64_t a1)
{
  [*(id *)(a1 + 32) invalidate];
  if (*(void *)(a1 + 40))
  {
    id obj = (id)MEMORY[0x1AD0C4F80](*(void *)(a1 + 56));
    objc_sync_enter(obj);
    if ((_WBSRunOnceImpl() & 1) == 0) {
      (*(void (**)(void))(*(void *)(a1 + 56) + 16))();
    }
    objc_sync_exit(obj);
    uint64_t v2 = obj;
  }
  else
  {
    id objb = *(id *)(a1 + 48);
    objc_sync_enter(objb);
    uint64_t v3 = [*(id *)(a1 + 48) copy];
    objc_sync_exit(objb);

    id obja = (id)MEMORY[0x1AD0C4F80](*(void *)(a1 + 56));
    objc_sync_enter(obja);
    if ((_WBSRunOnceImpl() & 1) == 0) {
      (*(void (**)(void))(*(void *)(a1 + 56) + 16))();
    }
    objc_sync_exit(obja);

    uint64_t v2 = (void *)v3;
  }
}

- (void)_sanitizeAttributeSet:(id)a3
{
  id v7 = a3;
  uint64_t v3 = [v7 title];
  uint64_t v4 = [v3 length];

  if (!v4)
  {
    id v5 = [v7 contentURL];
    id v6 = objc_msgSend(v5, "safari_userVisibleString");
    [v7 setTitle:v6];
  }
}

- (void)setTabNeedsSpotlightDeletion:(id)a3
{
  uint64_t v4 = [a3 appEntityUUIDString];
  if (v4)
  {
    [(NSMutableDictionary *)self->_tabsToDonate removeObjectForKey:v4];
    unint64_t v5 = [(NSMutableSet *)self->_closedTabsToIndex count];
    closedTabsToIndex = self->_closedTabsToIndex;
    if (v5 > 0x18)
    {
      [(NSMutableSet *)closedTabsToIndex addObject:v4];
      [(WBSSiriIntelligenceDonor *)self donatePendingTabDataNowWithCompletionHandler:0];
    }
    else
    {
      if (!closedTabsToIndex)
      {
        id v7 = [MEMORY[0x1E4F1CA80] set];
        id v8 = self->_closedTabsToIndex;
        self->_closedTabsToIndex = v7;

        closedTabsToIndex = self->_closedTabsToIndex;
      }
      [(NSMutableSet *)closedTabsToIndex addObject:v4];
      [(WBSSiriIntelligenceDonor *)self _scheduleTabBatchDonationTimerIfNeeded];
    }
  }
  else
  {
    id v9 = WBS_LOG_CHANNEL_PREFIXSiriIntelligence();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR)) {
      -[WBSSiriIntelligenceDonor setTabNeedsSpotlightDeletion:]();
    }
  }
}

- (void)setTabNeedsSpotlightDonation:(id)a3
{
  id v4 = a3;
  unint64_t v5 = [v4 appEntityUUIDString];
  if (v5)
  {
    [(NSMutableSet *)self->_closedTabsToIndex removeObject:v5];
    unint64_t v6 = [(NSMutableDictionary *)self->_tabsToDonate count];
    tabsToDonate = self->_tabsToDonate;
    if (v6 > 0x18)
    {
      [(NSMutableDictionary *)tabsToDonate setObject:v4 forKeyedSubscript:v5];
      [(WBSSiriIntelligenceDonor *)self donatePendingTabDataNowWithCompletionHandler:0];
    }
    else
    {
      if (!tabsToDonate)
      {
        id v8 = [MEMORY[0x1E4F1CA60] dictionary];
        id v9 = self->_tabsToDonate;
        self->_tabsToDonate = v8;

        tabsToDonate = self->_tabsToDonate;
      }
      [(NSMutableDictionary *)tabsToDonate setObject:v4 forKeyedSubscript:v5];
      [(WBSSiriIntelligenceDonor *)self _scheduleTabBatchDonationTimerIfNeeded];
    }
  }
  else
  {
    id v10 = WBS_LOG_CHANNEL_PREFIXSiriIntelligence();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR)) {
      -[WBSSiriIntelligenceDonor setTabNeedsSpotlightDonation:]();
    }
  }
}

- (void)donatePendingTabDataNowWithCompletionHandler:(id)a3
{
  id v4 = a3;
  [(WBSDispatchSourceTimer *)self->_tabDonationTimer invalidate];
  tabDonationTimer = self->_tabDonationTimer;
  self->_tabDonationTimer = 0;

  unint64_t v6 = [(NSMutableDictionary *)self->_tabsToDonate allValues];
  id v7 = objc_msgSend(v6, "safari_mapObjectsUsingBlock:", &__block_literal_global_279);

  id v8 = (void *)[(NSMutableSet *)self->_closedTabsToIndex copy];
  tabsToDonate = self->_tabsToDonate;
  self->_tabsToDonate = 0;

  closedTabsToIndex = self->_closedTabsToIndex;
  self->_closedTabsToIndex = 0;

  tabDonationSerialQueue = self->_tabDonationSerialQueue;
  v15[0] = MEMORY[0x1E4F143A8];
  v15[1] = 3221225472;
  v15[2] = __73__WBSSiriIntelligenceDonor_donatePendingTabDataNowWithCompletionHandler___block_invoke_2;
  v15[3] = &unk_1E5C9A780;
  void v15[4] = self;
  id v16 = v7;
  id v17 = v8;
  id v18 = v4;
  id v12 = v4;
  id v13 = v8;
  id v14 = v7;
  dispatch_async(tabDonationSerialQueue, v15);
}

uint64_t __73__WBSSiriIntelligenceDonor_donatePendingTabDataNowWithCompletionHandler___block_invoke(uint64_t a1, void *a2)
{
  return [a2 tabDataForSpotlightDonation];
}

void __73__WBSSiriIntelligenceDonor_donatePendingTabDataNowWithCompletionHandler___block_invoke_2(uint64_t a1)
{
  uint64_t v2 = WBS_LOG_CHANNEL_PREFIXSiriIntelligence();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1A6B5F000, v2, OS_LOG_TYPE_INFO, "Donating Pending Tabs to CoreSpotlight", buf, 2u);
  }
  uint64_t v3 = dispatch_group_create();
  dispatch_group_enter(v3);
  id v4 = *(void **)(a1 + 32);
  uint64_t v5 = *(void *)(a1 + 40);
  v15[0] = MEMORY[0x1E4F143A8];
  v15[1] = 3221225472;
  v15[2] = __73__WBSSiriIntelligenceDonor_donatePendingTabDataNowWithCompletionHandler___block_invoke_280;
  v15[3] = &unk_1E5C8C880;
  unint64_t v6 = v3;
  id v16 = v6;
  [v4 _indexTabData:v5 withCompletionHandler:v15];
  dispatch_group_enter(v6);
  id v7 = *(void **)(a1 + 32);
  id v8 = [*(id *)(a1 + 48) allObjects];
  uint64_t v9 = *(void *)(*(void *)(a1 + 32) + 24);
  v13[0] = MEMORY[0x1E4F143A8];
  v13[1] = 3221225472;
  v13[2] = __73__WBSSiriIntelligenceDonor_donatePendingTabDataNowWithCompletionHandler___block_invoke_2_281;
  v13[3] = &unk_1E5C9DEE8;
  id v10 = v6;
  id v14 = v10;
  [v7 _removeCoreSpotlightDataWithIDs:v8 onDispatchQueue:v9 completionHandler:v13];

  id v11 = *(void **)(a1 + 56);
  if (v11)
  {
    id v12 = v11;
    WBSDispatchGroupNotifyWithTimeout();
  }
}

void __73__WBSSiriIntelligenceDonor_donatePendingTabDataNowWithCompletionHandler___block_invoke_280(uint64_t a1)
{
}

void __73__WBSSiriIntelligenceDonor_donatePendingTabDataNowWithCompletionHandler___block_invoke_2_281(uint64_t a1)
{
}

void __73__WBSSiriIntelligenceDonor_donatePendingTabDataNowWithCompletionHandler___block_invoke_3(uint64_t a1, uint64_t a2)
{
  id v4 = WBS_LOG_CHANNEL_PREFIXSiriIntelligence();
  uint64_t v5 = v4;
  if (a2 == 1)
  {
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
      __73__WBSSiriIntelligenceDonor_donatePendingTabDataNowWithCompletionHandler___block_invoke_3_cold_1();
    }
  }
  else if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1A6B5F000, v5, OS_LOG_TYPE_INFO, "Finished CoreSpotlight tab donations successfully.", buf, 2u);
  }
  id v6 = *(id *)(a1 + 32);
  WBSPerformBlockOnMainRunLoopWithCommonModes();
}

uint64_t __73__WBSSiriIntelligenceDonor_donatePendingTabDataNowWithCompletionHandler___block_invoke_282(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)_scheduleTabBatchDonationTimerIfNeeded
{
  if (!self->_tabDonationTimer)
  {
    v5[0] = MEMORY[0x1E4F143A8];
    v5[1] = 3221225472;
    v5[2] = __66__WBSSiriIntelligenceDonor__scheduleTabBatchDonationTimerIfNeeded__block_invoke;
    v5[3] = &unk_1E5C8C880;
    v5[4] = self;
    uint64_t v3 = +[WBSDispatchSourceTimer scheduledTimerWithInterval:0 repeats:v5 handler:30.0];
    tabDonationTimer = self->_tabDonationTimer;
    self->_tabDonationTimer = v3;
  }
}

uint64_t __66__WBSSiriIntelligenceDonor__scheduleTabBatchDonationTimerIfNeeded__block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) donatePendingTabDataNowWithCompletionHandler:0];
}

- (void)_indexTabData:(id)a3 withCompletionHandler:(id)a4
{
  uint64_t v38 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v30 = a4;
  id v7 = objc_msgSend(MEMORY[0x1E4F1CA48], "arrayWithCapacity:", objc_msgSend(v6, "count"));
  long long v33 = 0u;
  long long v34 = 0u;
  long long v35 = 0u;
  long long v36 = 0u;
  id v8 = v6;
  uint64_t v9 = [v8 countByEnumeratingWithState:&v33 objects:v37 count:16];
  if (v9)
  {
    uint64_t v10 = v9;
    uint64_t v11 = *(void *)v34;
    do
    {
      uint64_t v12 = 0;
      do
      {
        if (*(void *)v34 != v11) {
          objc_enumerationMutation(v8);
        }
        id v13 = *(void **)(*((void *)&v33 + 1) + 8 * v12);
        id v14 = objc_alloc_init(MEMORY[0x1E4F23850]);
        [v14 setContentType:@"com.apple.safari.tab"];
        id v15 = [v13 url];
        [v14 setContentURL:v15];

        id v16 = [v13 title];
        [v14 setTitle:v16];

        id v17 = [v13 lastVisitedDate];
        [v14 setLastUsedDate:v17];

        [v14 setDisableSearchInSpotlight:MEMORY[0x1E4F1CC38]];
        id v18 = [v13 profileIdentifier];
        long long v19 = [(id)objc_opt_class() coreSpotlightProfileIDKey];
        [v14 setValue:v18 forCustomKey:v19];

        id v20 = [v13 tabGroupUUID];
        id v21 = [(id)objc_opt_class() coreSpotlightTabTabGroupAttributeKey];
        [v14 setValue:v20 forCustomKey:v21];

        [(WBSSiriIntelligenceDonor *)self _sanitizeAttributeSet:v14];
        id v22 = objc_opt_class();
        uint64_t v23 = [v13 profileIdentifier];
        id v24 = [v22 _coreSpotlightTabDonationIdentifierForProfileWithIdentifier:v23];

        id v25 = objc_alloc(MEMORY[0x1E4F23840]);
        uint64_t v26 = [v13 uuidString];
        id v27 = (void *)[v25 initWithUniqueIdentifier:v26 domainIdentifier:v24 attributeSet:v14];

        [v7 addObject:v27];
        [(WBSSpotlightDonationEntityCorrelator *)self->_entityCorrelator correlateTabEntityForItem:v27];

        ++v12;
      }
      while (v10 != v12);
      uint64_t v10 = [v8 countByEnumeratingWithState:&v33 objects:v37 count:16];
    }
    while (v10);
  }

  tabDonationSerialQueue = self->_tabDonationSerialQueue;
  v31[0] = MEMORY[0x1E4F143A8];
  v31[1] = 3221225472;
  v31[2] = __64__WBSSiriIntelligenceDonor__indexTabData_withCompletionHandler___block_invoke;
  v31[3] = &unk_1E5C9DF10;
  id v32 = v30;
  id v29 = v30;
  [(WBSSiriIntelligenceDonor *)self _indexCoreSpotlightData:v7 filterDeletedHistoryItems:0 onDispatchQueue:tabDonationSerialQueue completionHandler:v31];
}

uint64_t __64__WBSSiriIntelligenceDonor__indexTabData_withCompletionHandler___block_invoke(uint64_t a1)
{
  uint64_t result = *(void *)(a1 + 32);
  if (result) {
    return (*(uint64_t (**)(void))(result + 16))();
  }
  return result;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_reindexingBackgroundSystemTaskManager, 0);
  objc_storeStrong((id *)&self->_closedTabsToIndex, 0);
  objc_storeStrong((id *)&self->_tabsToDonate, 0);
  objc_storeStrong((id *)&self->_tabDonationTimer, 0);
  objc_storeStrong((id *)&self->_entityCorrelator, 0);
  objc_storeStrong((id *)&self->_tabDonationSerialQueue, 0);
  objc_storeStrong((id *)&self->_identifiersLeftToReindex, 0);
  objc_storeStrong((id *)&self->_coreSpotlightDonationSerialQueue, 0);
}

void __145__WBSSiriIntelligenceDonor_donateTextInWebView_extractedReaderText_canDonateFullPageText_profileIdentifier_personalizationData_extractInnerText___block_invoke_cold_1(uint64_t a1, NSObject *a2)
{
  uint64_t v5 = *MEMORY[0x1E4F143B8];
  uint64_t v2 = *(void *)(a1 + 32);
  int v3 = 138477827;
  uint64_t v4 = v2;
  _os_log_debug_impl(&dword_1A6B5F000, a2, OS_LOG_TYPE_DEBUG, "String contents of webpage is empty, but proceeding with donation to CoreSpotlight for page URL: %{private}@", (uint8_t *)&v3, 0xCu);
}

void __145__WBSSiriIntelligenceDonor_donateTextInWebView_extractedReaderText_canDonateFullPageText_profileIdentifier_personalizationData_extractInnerText___block_invoke_cold_2(void *a1)
{
  id v2 = a1;
  int v3 = objc_msgSend((id)OUTLINED_FUNCTION_1_6(), "safari_privacyPreservingDescription");
  OUTLINED_FUNCTION_1_5();
  OUTLINED_FUNCTION_0_0(&dword_1A6B5F000, v4, v5, "Error extracting content of webpage as string: %{public}@; page will not be donated to CoreSpotlight",
    v6,
    v7,
    v8,
    v9,
    v10);
}

void __145__WBSSiriIntelligenceDonor__donateDataForPageWithURL_history_fullPageText_readerText_autocompleteTriggers_profileIdentifier_personalizationData___block_invoke_cold_1(uint64_t *a1, NSObject *a2)
{
  uint64_t v5 = *MEMORY[0x1E4F143B8];
  uint64_t v2 = *a1;
  int v3 = 138477827;
  uint64_t v4 = v2;
  _os_log_debug_impl(&dword_1A6B5F000, a2, OS_LOG_TYPE_DEBUG, "Failed to donate page contents to CoreSpotlight due to missing history item for URL: %{private}@", (uint8_t *)&v3, 0xCu);
}

void __145__WBSSiriIntelligenceDonor__donateDataForPageWithURL_history_fullPageText_readerText_autocompleteTriggers_profileIdentifier_personalizationData___block_invoke_cold_2()
{
  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_1(&dword_1A6B5F000, v0, v1, "Failed to donate page contents to CoreSpotlight due to missing history item", v2, v3, v4, v5, v6);
}

void __87__WBSSiriIntelligenceDonor_donateSafariBookmarksToCoreSpotlight_withCompletionHandler___block_invoke_cold_1()
{
  uint64_t v5 = *MEMORY[0x1E4F143B8];
  OUTLINED_FUNCTION_1_5();
  __int16 v3 = 2112;
  uint64_t v4 = v0;
  _os_log_debug_impl(&dword_1A6B5F000, v1, OS_LOG_TYPE_DEBUG, "Safari will index bookmarks to CoreSpotlight with IDs %@ and remove bookmarks with IDs: %@", v2, 0x16u);
}

void __87__WBSSiriIntelligenceDonor_donateSafariBookmarksToCoreSpotlight_withCompletionHandler___block_invoke_cold_2(void *a1)
{
  id v2 = a1;
  __int16 v3 = objc_msgSend((id)OUTLINED_FUNCTION_1_6(), "safari_privacyPreservingDescription");
  OUTLINED_FUNCTION_1_5();
  OUTLINED_FUNCTION_0_0(&dword_1A6B5F000, v4, v5, "Failed to obtain indexed bookmarks IDs with error: %{public}@", v6, v7, v8, v9, v10);
}

void __75__WBSSiriIntelligenceDonor_updateCoreSpotlightReadingListDataAfterUpgrade___block_invoke_3_cold_1()
{
  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_1(&dword_1A6B5F000, v0, v1, "Failed to index reading list items items to CoreSpotlight on upgrade", v2, v3, v4, v5, v6);
}

void __110__WBSSiriIntelligenceDonor_reindexAllBookmarkAndHistoryItems_historiesForProfiles_withAcknowledgementHandler___block_invoke_cold_1()
{
  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_1(&dword_1A6B5F000, v0, v1, "Failed to re-index last week of searchable items history items for CoreSpotlight", v2, v3, v4, v5, v6);
}

void __110__WBSSiriIntelligenceDonor_reindexAllBookmarkAndHistoryItems_historiesForProfiles_withAcknowledgementHandler___block_invoke_224_cold_1()
{
  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_1(&dword_1A6B5F000, v0, v1, "Failed to re-index all searchable items bookmark items for CoreSpotlight", v2, v3, v4, v5, v6);
}

void __110__WBSSiriIntelligenceDonor_reindexAllBookmarkAndHistoryItems_historiesForProfiles_withAcknowledgementHandler___block_invoke_2_cold_1()
{
  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_1(&dword_1A6B5F000, v0, v1, "Failed to re-index all searchable items history items for CoreSpotlight", v2, v3, v4, v5, v6);
}

void __135__WBSSiriIntelligenceDonor_reindexBookmarkAndHistoryItemsWithIdentifiers_allBookmarks_historiesForProfiles_withAcknowledgementHandler___block_invoke_cold_1()
{
  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_1(&dword_1A6B5F000, v0, v1, "Failed to re-indexed searchable history items with identifiers to CoreSpotlight", v2, v3, v4, v5, v6);
}

void __135__WBSSiriIntelligenceDonor_reindexBookmarkAndHistoryItemsWithIdentifiers_allBookmarks_historiesForProfiles_withAcknowledgementHandler___block_invoke_228_cold_1()
{
  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_1(&dword_1A6B5F000, v0, v1, "Failed to re-indexed searchable bookmark items with identifiers to CoreSpotlight", v2, v3, v4, v5, v6);
}

void __135__WBSSiriIntelligenceDonor_reindexBookmarkAndHistoryItemsWithIdentifiers_allBookmarks_historiesForProfiles_withAcknowledgementHandler___block_invoke_229_cold_1()
{
  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_1(&dword_1A6B5F000, v0, v1, "Failed to removed spotlight items that do not map to a current history or bookmark item", v2, v3, v4, v5, v6);
}

void __133__WBSSiriIntelligenceDonor__donateHistoryItemsToCoreSpotlightCreatedAfterDate_beforeDate_historiesForProfiles_withCompletionHandler___block_invoke_4_cold_1(uint64_t a1, NSObject *a2)
{
  uint64_t v5 = *MEMORY[0x1E4F143B8];
  uint64_t v2 = *(void *)(a1 + 32);
  int v3 = 138412290;
  uint64_t v4 = v2;
  _os_log_error_impl(&dword_1A6B5F000, a2, OS_LOG_TYPE_ERROR, "Failed to re-indexed all searchable history items to CoreSpotlight for profile with ID: %@", (uint8_t *)&v3, 0xCu);
}

void __112__WBSSiriIntelligenceDonor__indexCoreSpotlightData_filterDeletedHistoryItems_onDispatchQueue_completionHandler___block_invoke_2_cold_1(void *a1)
{
  id v2 = a1;
  int v3 = objc_msgSend((id)OUTLINED_FUNCTION_1_6(), "safari_privacyPreservingDescription");
  OUTLINED_FUNCTION_1_5();
  OUTLINED_FUNCTION_0_0(&dword_1A6B5F000, v4, v5, "Failed to index CoreSpotlight searchable items with error: %{public}@", v6, v7, v8, v9, v10);
}

void __94__WBSSiriIntelligenceDonor__removeCoreSpotlightDataWithIDs_onDispatchQueue_completionHandler___block_invoke_2_cold_1(void *a1)
{
  id v2 = a1;
  int v3 = objc_msgSend((id)OUTLINED_FUNCTION_1_6(), "safari_privacyPreservingDescription");
  OUTLINED_FUNCTION_1_5();
  OUTLINED_FUNCTION_0_0(&dword_1A6B5F000, v4, v5, "Failed to remove CoreSpotlight searchable items with error: %{public}@", v6, v7, v8, v9, v10);
}

void __101__WBSSiriIntelligenceDonor_removeAllCoreSpotlightHistoryDataDonatedBySafariForProfileWithIdentifier___block_invoke_2_cold_1()
{
  OUTLINED_FUNCTION_1_0();
  _os_log_debug_impl(&dword_1A6B5F000, v0, OS_LOG_TYPE_DEBUG, "Removed CoreSpotlight data", v1, 2u);
}

void __101__WBSSiriIntelligenceDonor_removeAllCoreSpotlightHistoryDataDonatedBySafariForProfileWithIdentifier___block_invoke_2_cold_2(void *a1)
{
  id v2 = a1;
  int v3 = objc_msgSend((id)OUTLINED_FUNCTION_1_6(), "safari_privacyPreservingDescription");
  OUTLINED_FUNCTION_1_5();
  OUTLINED_FUNCTION_0_0(&dword_1A6B5F000, v4, v5, "Failed to remove CoreSpotlight data with error %{public}@", v6, v7, v8, v9, v10);
}

void __106__WBSSiriIntelligenceDonor__indexHistoryItemsToCoreSpotlight_filterDeletedHistoryItems_completionHandler___block_invoke_cold_1(uint64_t a1, void *a2, void *a3)
{
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  uint64_t v5 = a2;
  uint64_t v6 = [a3 textContent];
  int v7 = 138478083;
  uint64_t v8 = a1;
  __int16 v9 = 2048;
  uint64_t v10 = [v6 length];
  _os_log_debug_impl(&dword_1A6B5F000, v5, OS_LOG_TYPE_DEBUG, "Donating history item to CoreSpotlight with ID: %{private}@ text content length: %ld", (uint8_t *)&v7, 0x16u);
}

void __85__WBSSiriIntelligenceDonor__getIndexedBookmarksIDsToAttributesWithCompletionHandler___block_invoke_cold_1(unsigned char *a1, unsigned char *a2)
{
  OUTLINED_FUNCTION_4_4(a1, a2);
  OUTLINED_FUNCTION_6_0(&dword_1A6B5F000, v2, v3, "Indexed bookmark has nil uniqueID.", v4);
}

void __85__WBSSiriIntelligenceDonor__getIndexedBookmarksIDsToAttributesWithCompletionHandler___block_invoke_cold_2(unsigned char *a1, unsigned char *a2)
{
  OUTLINED_FUNCTION_4_4(a1, a2);
  OUTLINED_FUNCTION_6_0(&dword_1A6B5F000, v2, v3, "Indexed bookmark has nil title.", v4);
}

void __85__WBSSiriIntelligenceDonor__getIndexedBookmarksIDsToAttributesWithCompletionHandler___block_invoke_cold_3(unsigned char *a1, unsigned char *a2)
{
  OUTLINED_FUNCTION_4_4(a1, a2);
  OUTLINED_FUNCTION_6_0(&dword_1A6B5F000, v2, v3, "Indexed bookmark has nil weakIdentifier.", v4);
}

- (void)setTabNeedsSpotlightDeletion:.cold.1()
{
  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_1(&dword_1A6B5F000, v0, v1, "Received nil UUID for tab spotlight deletion request.", v2, v3, v4, v5, v6);
}

- (void)setTabNeedsSpotlightDonation:.cold.1()
{
  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_1(&dword_1A6B5F000, v0, v1, "Received nil UUID for tab spotlight donation request.", v2, v3, v4, v5, v6);
}

void __73__WBSSiriIntelligenceDonor_donatePendingTabDataNowWithCompletionHandler___block_invoke_3_cold_1()
{
  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_1(&dword_1A6B5F000, v0, v1, "Timed out waiting for CoreSpotlight calls to complete", v2, v3, v4, v5, v6);
}

@end