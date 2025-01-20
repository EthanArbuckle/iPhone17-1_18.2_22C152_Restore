@interface BookmarksForYouDataSource
- (BookmarksForYouDataSource)initWithBookmarkProvider:(id)a3 accessQueue:(id)a4 bookmarkCollection:(id)a5;
- (void)_bookmarksDidChangeWithNotification:(id)a3;
- (void)dealloc;
- (void)retrieveRecommendationsMatchingTopic:(id)a3 withCompletionHandler:(id)a4;
@end

@implementation BookmarksForYouDataSource

- (BookmarksForYouDataSource)initWithBookmarkProvider:(id)a3 accessQueue:(id)a4 bookmarkCollection:(id)a5
{
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  v17.receiver = self;
  v17.super_class = (Class)BookmarksForYouDataSource;
  v12 = [(BookmarksForYouDataSource *)&v17 init];
  v13 = v12;
  if (v12)
  {
    objc_storeStrong((id *)&v12->_bookmarkProvider, a3);
    objc_storeStrong((id *)&v13->_bookmarkProviderAccessQueue, a4);
    v14 = [MEMORY[0x1E4F28EB8] defaultCenter];
    [v14 addObserver:v13 selector:sel__bookmarksDidChangeWithNotification_ name:*MEMORY[0x1E4FB6158] object:v11];
    [v14 addObserver:v13 selector:sel__bookmarksDidChangeWithNotification_ name:*MEMORY[0x1E4FB6148] object:v11];
    v15 = v13;
  }
  return v13;
}

- (void)dealloc
{
  v3 = [MEMORY[0x1E4F28EB8] defaultCenter];
  [v3 removeObserver:self];

  v4.receiver = self;
  v4.super_class = (Class)BookmarksForYouDataSource;
  [(BookmarksForYouDataSource *)&v4 dealloc];
}

- (void)retrieveRecommendationsMatchingTopic:(id)a3 withCompletionHandler:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v14.receiver = self;
  v14.super_class = (Class)BookmarksForYouDataSource;
  [(WBSForYouRecommendationMediatorDataSource *)&v14 emitStartRetrievingRecommendationsPerformanceMarker];
  if (v7)
  {
    v8 = [v6 title];
    if ([v8 length])
    {
      bookmarkProviderAccessQueue = self->_bookmarkProviderAccessQueue;
      v10[0] = MEMORY[0x1E4F143A8];
      v10[1] = 3221225472;
      v10[2] = __88__BookmarksForYouDataSource_retrieveRecommendationsMatchingTopic_withCompletionHandler___block_invoke;
      v10[3] = &unk_1E6D78460;
      v10[4] = self;
      id v11 = v8;
      id v12 = v6;
      id v13 = v7;
      dispatch_async(bookmarkProviderAccessQueue, v10);
    }
    else
    {
      (*((void (**)(id, void))v7 + 2))(v7, 0);
    }
  }
}

void __88__BookmarksForYouDataSource_retrieveRecommendationsMatchingTopic_withCompletionHandler___block_invoke(uint64_t a1)
{
  v2 = [*(id *)(*(void *)(a1 + 32) + 8) bookmarksMatchingString:*(void *)(a1 + 40)];
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __88__BookmarksForYouDataSource_retrieveRecommendationsMatchingTopic_withCompletionHandler___block_invoke_2;
  v9[3] = &unk_1E6D7DF28;
  v9[4] = *(void *)(a1 + 32);
  v3 = objc_msgSend(v2, "safari_filterObjectsUsingBlock:", v9);

  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __88__BookmarksForYouDataSource_retrieveRecommendationsMatchingTopic_withCompletionHandler___block_invoke_3;
  v5[3] = &unk_1E6D78410;
  id v6 = v3;
  id v7 = *(id *)(a1 + 48);
  id v8 = *(id *)(a1 + 56);
  id v4 = v3;
  dispatch_async(MEMORY[0x1E4F14428], v5);
}

uint64_t __88__BookmarksForYouDataSource_retrieveRecommendationsMatchingTopic_withCompletionHandler___block_invoke_2(uint64_t a1, void *a2)
{
  v2 = objc_msgSend(*(id *)(*(void *)(a1 + 32) + 8), "bookmarkWithID:", objc_msgSend(a2, "parentID"));
  if (([v2 isReadingListFolder] & 1) != 0
    || ([v2 isFrequentlyVisitedSitesFolder] & 1) != 0
    || ([v2 isWebFilterAllowedSitesFolder] & 1) != 0)
  {
    uint64_t v3 = 0;
  }
  else
  {
    uint64_t v3 = [v2 isBookmarksBarFolder] ^ 1;
  }

  return v3;
}

void __88__BookmarksForYouDataSource_retrieveRecommendationsMatchingTopic_withCompletionHandler___block_invoke_3(uint64_t a1)
{
  uint64_t v37 = *MEMORY[0x1E4F143B8];
  v24 = [MEMORY[0x1E4F1CA48] array];
  group = dispatch_group_create();
  long long v32 = 0u;
  long long v33 = 0u;
  long long v34 = 0u;
  long long v35 = 0u;
  uint64_t v23 = a1;
  id v2 = *(id *)(a1 + 32);
  uint64_t v3 = [v2 countByEnumeratingWithState:&v32 objects:v36 count:16];
  if (v3)
  {
    uint64_t v4 = v3;
    uint64_t v5 = *(void *)v33;
    id v22 = v2;
    do
    {
      for (uint64_t i = 0; i != v4; ++i)
      {
        if (*(void *)v33 != v5) {
          objc_enumerationMutation(v2);
        }
        id v7 = *(void **)(*((void *)&v32 + 1) + 8 * i);
        id v8 = [v7 title];
        id v9 = objc_msgSend(v8, "safari_userVisibleTitleIgnoringFullURLString");

        if ([v9 length])
        {
          id v10 = [v7 address];
          if ([v10 length])
          {
            id v11 = [MEMORY[0x1E4F1CB10] URLWithString:v10];
            if (v11)
            {
              id v12 = objc_alloc(MEMORY[0x1E4F98B18]);
              id v13 = [MEMORY[0x1E4F1C9C8] distantPast];
              objc_super v14 = objc_msgSend(v12, "initWithTitle:url:lastSeenDate:source:topicSource:", v9, v11, v13, 0, objc_msgSend(*(id *)(v23 + 40), "source"));

              v15 = _WBSLocalizedString();
              [v14 setFootnote:v15];

              v16 = (void *)MEMORY[0x1E4F1CAD0];
              objc_super v17 = [*(id *)(v23 + 40) title];
              v18 = [v16 setWithObject:v17];
              [v14 addOriginalQueries:v18];

              block[0] = MEMORY[0x1E4F143A8];
              block[1] = 3221225472;
              block[2] = __88__BookmarksForYouDataSource_retrieveRecommendationsMatchingTopic_withCompletionHandler___block_invoke_4;
              block[3] = &unk_1E6D77D90;
              id v30 = v14;
              v31 = v7;
              id v19 = v14;
              dispatch_group_async(group, MEMORY[0x1E4F14428], block);
              [v24 addObject:v19];

              id v2 = v22;
            }
          }
        }
      }
      uint64_t v4 = [v2 countByEnumeratingWithState:&v32 objects:v36 count:16];
    }
    while (v4);
  }

  v26[0] = MEMORY[0x1E4F143A8];
  v26[1] = 3221225472;
  v26[2] = __88__BookmarksForYouDataSource_retrieveRecommendationsMatchingTopic_withCompletionHandler___block_invoke_5;
  v26[3] = &unk_1E6D78D48;
  id v20 = *(id *)(v23 + 48);
  id v27 = v24;
  id v28 = v20;
  id v21 = v24;
  dispatch_group_notify(group, MEMORY[0x1E4F14428], v26);
}

void __88__BookmarksForYouDataSource_retrieveRecommendationsMatchingTopic_withCompletionHandler___block_invoke_4(uint64_t a1)
{
  +[WebBookmarkCollection leadImageURLForBookmark:](MEMORY[0x1E4FB60E8], *(void **)(a1 + 40));
  id v2 = (id)objc_claimAutoreleasedReturnValue();
  [*(id *)(a1 + 32) setImageURL:v2];
}

uint64_t __88__BookmarksForYouDataSource_retrieveRecommendationsMatchingTopic_withCompletionHandler___block_invoke_5(uint64_t a1)
{
  return (*(uint64_t (**)(void, void))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40), *(void *)(a1 + 32));
}

- (void)_bookmarksDidChangeWithNotification:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_bookmarkProviderAccessQueue, 0);
  objc_storeStrong((id *)&self->_bookmarkProvider, 0);
}

@end