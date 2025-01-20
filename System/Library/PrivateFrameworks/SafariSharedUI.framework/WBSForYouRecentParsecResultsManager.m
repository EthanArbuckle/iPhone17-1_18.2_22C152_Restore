@interface WBSForYouRecentParsecResultsManager
+ (id)recommendationsMatchingTopic:(id)a3 fromArray:(id)a4;
- (BOOL)_hasPermissibleResultTypeForResult:(id)a3;
- (NSArray)recentRecommendations;
- (id)_bestAcceptableImageForSFResult:(id)a3;
- (id)_cacheEnsuringExistence;
- (void)_createInternalQueueIfNecessary;
- (void)appendResultsIfApplicable:(id)a3;
- (void)appendResultsIfApplicable:(id)a3 withDelayedExistenceCheck:(BOOL)a4;
- (void)clearAllResults;
- (void)retrieveRecommendationsMatchingTopic:(id)a3 withCompletionHandler:(id)a4;
@end

@implementation WBSForYouRecentParsecResultsManager

- (void)appendResultsIfApplicable:(id)a3
{
}

- (void)appendResultsIfApplicable:(id)a3 withDelayedExistenceCheck:(BOOL)a4
{
  uint64_t v54 = *MEMORY[0x1E4F143B8];
  id v37 = a3;
  if ((unint64_t)[v37 count] <= 2) {
    uint64_t v5 = [v37 count];
  }
  else {
    uint64_t v5 = 2;
  }
  v36 = objc_msgSend(v37, "subarrayWithRange:", 0, v5);
  if ([v36 count])
  {
    objc_initWeak(&location, self);
    long long v50 = 0u;
    long long v51 = 0u;
    long long v49 = 0u;
    long long v48 = 0u;
    id obj = v36;
    uint64_t v6 = [obj countByEnumeratingWithState:&v48 objects:v53 count:16];
    if (!v6) {
      goto LABEL_37;
    }
    uint64_t v7 = *(void *)v49;
    while (1)
    {
      for (uint64_t i = 0; i != v6; ++i)
      {
        if (*(void *)v49 != v7) {
          objc_enumerationMutation(obj);
        }
        v9 = *(void **)(*((void *)&v48 + 1) + 8 * i);
        if ([(WBSForYouRecentParsecResultsManager *)self _hasPermissibleResultTypeForResult:v9])
        {
          v10 = [v9 url];
          v11 = v10;
          if (!v10 || (objc_msgSend(v10, "safari_isHTTPFamilyURL") & 1) == 0) {
            goto LABEL_34;
          }
          id v12 = v9;
          v13 = [v12 sectionBundleIdentifier];
          int v14 = [v13 isEqualToString:@"com.apple.parsec.web_index"];

          if (v14)
          {
            v15 = objc_msgSend(v12, "safari_firstInlineCardSectionOfClass:", objc_opt_class());
            v16 = v15;
            if (v15)
            {
              v17 = [v15 descriptions];
              v18 = [v17 firstObject];
              v19 = [v18 text];

              if (!v19)
              {
                v20 = [v16 title];
                v19 = [v20 text];
              }
              if ([v19 length])
              {
                v21 = [MEMORY[0x1E4F28B88] whitespaceAndNewlineCharacterSet];
                v22 = (void *)[v21 mutableCopy];

                [v22 addCharactersInString:@"—"];
                [v19 stringByTrimmingCharactersInSet:v22];
              }
              else
              {
                v22 = [v12 title];
                [v22 text];
              v25 = };

LABEL_26:
LABEL_28:

              if ([v25 length])
              {
                v27 = [WBSForYouLinkRecommendation alloc];
                v28 = [MEMORY[0x1E4F1C9C8] date];
                v29 = [(WBSForYouLinkRecommendation *)v27 initWithTitle:v25 url:v11 lastSeenDate:v28 source:2 topicSource:0];

                v30 = _WBSLocalizedString();
                [(WBSForYouLinkRecommendation *)v29 setFootnote:v30];

                v31 = [v12 identifier];
                [(WBSForYouLinkRecommendation *)v29 setSourceID:v31];

                v32 = [(WBSForYouRecentParsecResultsManager *)self _bestAcceptableImageForSFResult:v12];
                v45[0] = MEMORY[0x1E4F143A8];
                v45[1] = 3221225472;
                v45[2] = __91__WBSForYouRecentParsecResultsManager_appendResultsIfApplicable_withDelayedExistenceCheck___block_invoke;
                v45[3] = &unk_1E5E42960;
                v33 = v29;
                v46 = v33;
                objc_copyWeak(&v47, &location);
                [v32 loadImageDataWithCompletionHandler:v45];
                if (a4)
                {
                  objc_initWeak(&from, v12);
                  dispatch_time_t v34 = dispatch_time(0, 200000000);
                  block[0] = MEMORY[0x1E4F143A8];
                  block[1] = 3221225472;
                  block[2] = __91__WBSForYouRecentParsecResultsManager_appendResultsIfApplicable_withDelayedExistenceCheck___block_invoke_3;
                  block[3] = &unk_1E5E42988;
                  objc_copyWeak(&v43, &from);
                  block[4] = self;
                  v41 = v33;
                  id v42 = v11;
                  dispatch_after(v34, MEMORY[0x1E4F14428], block);

                  objc_destroyWeak(&v43);
                  objc_destroyWeak(&from);
                }
                else
                {
                  v35 = [(WBSForYouRecentParsecResultsManager *)self _cacheEnsuringExistence];
                  [v35 setObject:v33 forKey:v11];
                }
                objc_destroyWeak(&v47);
              }
LABEL_34:

              continue;
            }
            v23 = objc_msgSend(v12, "safari_firstInlineCardSectionOfClass:", objc_opt_class());
            v16 = v23;
            if (v23)
            {
              v19 = [v23 leadingText];
              uint64_t v24 = [v19 text];
LABEL_25:
              v25 = (void *)v24;
              goto LABEL_26;
            }
            v26 = objc_msgSend(v12, "safari_firstInlineCardSectionOfClass:", objc_opt_class());
            v16 = v26;
            if (v26)
            {
              v19 = [v26 title];
              uint64_t v24 = [v19 text];
              goto LABEL_25;
            }
          }
          v16 = [v12 title];
          v25 = [v16 text];
          goto LABEL_28;
        }
      }
      uint64_t v6 = [obj countByEnumeratingWithState:&v48 objects:v53 count:16];
      if (!v6)
      {
LABEL_37:

        objc_destroyWeak(&location);
        break;
      }
    }
  }
}

void __91__WBSForYouRecentParsecResultsManager_appendResultsIfApplicable_withDelayedExistenceCheck___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  if (v3)
  {
    v4 = (void *)[objc_alloc(MEMORY[0x1E4F42A80]) initWithData:v3];
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __91__WBSForYouRecentParsecResultsManager_appendResultsIfApplicable_withDelayedExistenceCheck___block_invoke_2;
    block[3] = &unk_1E5E42938;
    id v7 = *(id *)(a1 + 32);
    id v8 = v4;
    id v5 = v4;
    objc_copyWeak(&v9, (id *)(a1 + 40));
    dispatch_async(MEMORY[0x1E4F14428], block);
    objc_destroyWeak(&v9);
  }
}

void __91__WBSForYouRecentParsecResultsManager_appendResultsIfApplicable_withDelayedExistenceCheck___block_invoke_2(uint64_t a1)
{
  [*(id *)(a1 + 32) setImage:*(void *)(a1 + 40)];
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  [WeakRetained notifyImageWasUpdatedForRecommendation:*(void *)(a1 + 32)];
}

void __91__WBSForYouRecentParsecResultsManager_appendResultsIfApplicable_withDelayedExistenceCheck___block_invoke_3(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 56));

  if (WeakRetained)
  {
    id v3 = [*(id *)(a1 + 32) _cacheEnsuringExistence];
    [v3 setObject:*(void *)(a1 + 40) forKey:*(void *)(a1 + 48)];
  }
}

- (id)_bestAcceptableImageForSFResult:(id)a3
{
  uint64_t v31 = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  v4 = [MEMORY[0x1E4F1CA48] array];
  id v5 = [v3 thumbnail];
  if (v5) {
    [v4 addObject:v5];
  }

  uint64_t v6 = [v3 icon];
  if (v6) {
    [v4 addObject:v6];
  }

  id v7 = [v3 completionImage];
  if (v7) {
    [v4 addObject:v7];
  }

  id v8 = [v3 secondaryTitleImage];
  if (v8) {
    [v4 addObject:v8];
  }

  id v9 = [v3 inlineCard];
  v10 = [v9 cardSections];
  v11 = [v10 firstObject];

  if ((objc_opt_respondsToSelector() & 1) == 0) {
    goto LABEL_14;
  }
  id v12 = [v11 performSelector:sel_thumbnail];
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {

LABEL_14:
    id v12 = 0;
    goto LABEL_15;
  }
  if (v12) {
    [v4 addObject:v12];
  }
LABEL_15:
  long long v28 = 0u;
  long long v29 = 0u;
  long long v26 = 0u;
  long long v27 = 0u;
  id v13 = v4;
  uint64_t v14 = [v13 countByEnumeratingWithState:&v26 objects:v30 count:16];
  if (v14)
  {
    v15 = 0;
    uint64_t v16 = *(void *)v27;
    double v17 = 0.0;
    do
    {
      for (uint64_t i = 0; i != v14; ++i)
      {
        if (*(void *)v27 != v16) {
          objc_enumerationMutation(v13);
        }
        v19 = *(void **)(*((void *)&v26 + 1) + 8 * i);
        [v19 size];
        if (v21 >= v20) {
          double v22 = v20;
        }
        else {
          double v22 = v21;
        }
        if (v22 > v17 && v22 >= 60.0)
        {
          id v24 = v19;

          v15 = v24;
          double v17 = v22;
        }
      }
      uint64_t v14 = [v13 countByEnumeratingWithState:&v26 objects:v30 count:16];
    }
    while (v14);
  }
  else
  {
    v15 = 0;
  }

  return v15;
}

- (BOOL)_hasPermissibleResultTypeForResult:(id)a3
{
  id v3 = a3;
  v4 = [v3 identifier];
  char v5 = [v4 hasPrefix:@"wiki:"];

  if (v5)
  {
    LOBYTE(v6) = 0;
  }
  else
  {
    unint64_t v7 = [MEMORY[0x1E4F98370] typeForSFSearchResult:v3];
    if (v7 >= 6) {
      LOBYTE(v6) = 1;
    }
    else {
      unsigned int v6 = (0xAu >> v7) & 1;
    }
  }

  return v6;
}

- (NSArray)recentRecommendations
{
  return (NSArray *)[(NSCache *)self->_cache allObjects];
}

- (void)clearAllResults
{
}

- (id)_cacheEnsuringExistence
{
  cache = self->_cache;
  if (!cache)
  {
    v4 = (NSCache *)objc_alloc_init(MEMORY[0x1E4F1C998]);
    char v5 = self->_cache;
    self->_cache = v4;

    [(NSCache *)self->_cache setCountLimit:200];
    cache = self->_cache;
  }
  return cache;
}

- (void)retrieveRecommendationsMatchingTopic:(id)a3 withCompletionHandler:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v17.receiver = self;
  v17.super_class = (Class)WBSForYouRecentParsecResultsManager;
  [(WBSForYouRecommendationMediatorDataSource *)&v17 emitStartRetrievingRecommendationsPerformanceMarker];
  [(WBSForYouRecentParsecResultsManager *)self _createInternalQueueIfNecessary];
  id v8 = [(WBSForYouRecentParsecResultsManager *)self recentRecommendations];
  internalQueue = self->_internalQueue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __98__WBSForYouRecentParsecResultsManager_retrieveRecommendationsMatchingTopic_withCompletionHandler___block_invoke;
  block[3] = &unk_1E5E40FC8;
  id v15 = v8;
  id v16 = v7;
  id v14 = v6;
  id v10 = v8;
  id v11 = v6;
  id v12 = v7;
  dispatch_async(internalQueue, block);
}

void __98__WBSForYouRecentParsecResultsManager_retrieveRecommendationsMatchingTopic_withCompletionHandler___block_invoke(void *a1)
{
  uint64_t v1 = a1[6];
  id v2 = +[WBSForYouRecentParsecResultsManager recommendationsMatchingTopic:a1[4] fromArray:a1[5]];
  (*(void (**)(uint64_t))(v1 + 16))(v1);
}

- (void)_createInternalQueueIfNecessary
{
  if (!self->_internalQueue)
  {
    id v3 = (OS_dispatch_queue *)dispatch_queue_create("com.apple.Safari.WBSForYouRecentParsecResultsManager.internalQueue", 0);
    internalQueue = self->_internalQueue;
    self->_internalQueue = v3;
  }
}

+ (id)recommendationsMatchingTopic:(id)a3 fromArray:(id)a4
{
  uint64_t v35 = *MEMORY[0x1E4F143B8];
  id v24 = a3;
  id v5 = a4;
  if ([v5 count])
  {
    double v22 = v5;
    v23 = [v24 title];
    id v6 = [MEMORY[0x1E4F1CA48] array];
    id v7 = [MEMORY[0x1E4F28F60] predicateWithFormat:@"title contains[cd] %@", v23];
    [v6 addObject:v7];

    id v8 = [MEMORY[0x1E4F28F60] predicateWithFormat:@"originalQueriesString contains[cd] %@", v23];
    [v6 addObject:v8];

    long long v31 = 0u;
    long long v32 = 0u;
    long long v29 = 0u;
    long long v30 = 0u;
    id v9 = [v24 associatedTopics];
    uint64_t v10 = [v9 countByEnumeratingWithState:&v29 objects:v34 count:16];
    if (v10)
    {
      uint64_t v11 = *(void *)v30;
      do
      {
        for (uint64_t i = 0; i != v10; ++i)
        {
          if (*(void *)v30 != v11) {
            objc_enumerationMutation(v9);
          }
          id v13 = [*(id *)(*((void *)&v29 + 1) + 8 * i) title];
          id v14 = [MEMORY[0x1E4F28F60] predicateWithFormat:@"title contains[cd] %@", v13];
          [v6 addObject:v14];

          id v15 = [MEMORY[0x1E4F28F60] predicateWithFormat:@"originalQueriesString contains[cd] %@", v13];
          [v6 addObject:v15];
        }
        uint64_t v10 = [v9 countByEnumeratingWithState:&v29 objects:v34 count:16];
      }
      while (v10);
    }

    id v16 = [MEMORY[0x1E4F28BA0] orPredicateWithSubpredicates:v6];
    objc_super v17 = [v22 filteredArrayUsingPredicate:v16];

    long long v27 = 0u;
    long long v28 = 0u;
    long long v25 = 0u;
    long long v26 = 0u;
    id v5 = v17;
    uint64_t v18 = [v5 countByEnumeratingWithState:&v25 objects:v33 count:16];
    if (v18)
    {
      uint64_t v19 = *(void *)v26;
      do
      {
        for (uint64_t j = 0; j != v18; ++j)
        {
          if (*(void *)v26 != v19) {
            objc_enumerationMutation(v5);
          }
          objc_msgSend(*(id *)(*((void *)&v25 + 1) + 8 * j), "setTopicSource:", objc_msgSend(v24, "source"));
        }
        uint64_t v18 = [v5 countByEnumeratingWithState:&v25 objects:v33 count:16];
      }
      while (v18);
    }
  }
  return v5;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_internalQueue, 0);
  objc_storeStrong((id *)&self->_cache, 0);
}

@end