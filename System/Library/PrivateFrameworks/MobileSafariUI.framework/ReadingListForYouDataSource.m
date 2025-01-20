@interface ReadingListForYouDataSource
- (ReadingListForYouDataSource)initWithBookmarkProvider:(id)a3 accessQueue:(id)a4 imageCache:(id)a5;
- (void)_readingListContentsDidChange:(id)a3;
- (void)dealloc;
- (void)retrieveRecommendationsMatchingTopic:(id)a3 withCompletionHandler:(id)a4;
@end

@implementation ReadingListForYouDataSource

- (ReadingListForYouDataSource)initWithBookmarkProvider:(id)a3 accessQueue:(id)a4 imageCache:(id)a5
{
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  v17.receiver = self;
  v17.super_class = (Class)ReadingListForYouDataSource;
  v12 = [(ReadingListForYouDataSource *)&v17 init];
  v13 = v12;
  if (v12)
  {
    objc_storeStrong((id *)&v12->_bookmarkProvider, a3);
    objc_storeStrong((id *)&v13->_bookmarkProviderAccessQueue, a4);
    objc_storeStrong((id *)&v13->_leadImageCache, a5);
    v14 = [MEMORY[0x1E4F28EB8] defaultCenter];
    [v14 addObserver:v13 selector:sel__readingListContentsDidChange_ name:@"ReadingListBookmarkDidUpdateNotification" object:0];
    [v14 addObserver:v13 selector:sel__readingListContentsDidChange_ name:*MEMORY[0x1E4FB6148] object:0];
    [v14 addObserver:v13 selector:sel__readingListContentsDidChange_ name:@"ReadingListBookmarkAddedNotification" object:0];
    [v14 addObserver:v13 selector:sel__readingListContentsDidChange_ name:@"bookmarkCollectionHasBecomeAvailableNotification" object:0];
    v15 = v13;
  }
  return v13;
}

- (void)dealloc
{
  v3 = [MEMORY[0x1E4F28EB8] defaultCenter];
  [v3 removeObserver:self];

  v4.receiver = self;
  v4.super_class = (Class)ReadingListForYouDataSource;
  [(ReadingListForYouDataSource *)&v4 dealloc];
}

- (void)retrieveRecommendationsMatchingTopic:(id)a3 withCompletionHandler:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v14.receiver = self;
  v14.super_class = (Class)ReadingListForYouDataSource;
  [(WBSForYouRecommendationMediatorDataSource *)&v14 emitStartRetrievingRecommendationsPerformanceMarker];
  if (v7)
  {
    v8 = [v6 title];
    if ([v8 length])
    {
      bookmarkProviderAccessQueue = self->_bookmarkProviderAccessQueue;
      v10[0] = MEMORY[0x1E4F143A8];
      v10[1] = 3221225472;
      v10[2] = __90__ReadingListForYouDataSource_retrieveRecommendationsMatchingTopic_withCompletionHandler___block_invoke;
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

void __90__ReadingListForYouDataSource_retrieveRecommendationsMatchingTopic_withCompletionHandler___block_invoke(uint64_t a1)
{
  v2 = [*(id *)(*(void *)(a1 + 32) + 8) readingListWithUnreadOnly:1 filteredUsingString:*(void *)(a1 + 40)];
  v3 = [v2 bookmarkArray];
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __90__ReadingListForYouDataSource_retrieveRecommendationsMatchingTopic_withCompletionHandler___block_invoke_2;
  v7[3] = &unk_1E6D78460;
  id v8 = v3;
  id v4 = *(id *)(a1 + 48);
  uint64_t v5 = *(void *)(a1 + 32);
  id v9 = v4;
  uint64_t v10 = v5;
  id v11 = *(id *)(a1 + 56);
  id v6 = v3;
  dispatch_async(MEMORY[0x1E4F14428], v7);
}

void __90__ReadingListForYouDataSource_retrieveRecommendationsMatchingTopic_withCompletionHandler___block_invoke_2(uint64_t a1)
{
  uint64_t v33 = *MEMORY[0x1E4F143B8];
  v26 = [MEMORY[0x1E4F1CA48] array];
  uint64_t v27 = a1;
  long long v28 = 0u;
  long long v29 = 0u;
  long long v30 = 0u;
  long long v31 = 0u;
  id v2 = *(id *)(a1 + 32);
  uint64_t v3 = [v2 countByEnumeratingWithState:&v28 objects:v32 count:16];
  if (v3)
  {
    uint64_t v4 = v3;
    uint64_t v5 = *(void *)v29;
    id v25 = v2;
    do
    {
      for (uint64_t i = 0; i != v4; ++i)
      {
        if (*(void *)v29 != v5) {
          objc_enumerationMutation(v2);
        }
        id v7 = *(void **)(*((void *)&v28 + 1) + 8 * i);
        id v8 = [v7 title];
        id v9 = objc_msgSend(v8, "safari_userVisibleTitleIgnoringFullURLString");

        if ([v9 length])
        {
          uint64_t v10 = [v7 address];
          if ([v10 length])
          {
            id v11 = [MEMORY[0x1E4F1CB10] URLWithString:v10];
            if (v11)
            {
              id v12 = objc_alloc(MEMORY[0x1E4F98B18]);
              id v13 = [v7 dateAdded];
              objc_super v14 = objc_msgSend(v12, "initWithTitle:url:lastSeenDate:source:topicSource:", v9, v11, v13, 1, objc_msgSend(*(id *)(v27 + 40), "source"));

              v15 = _WBSLocalizedString();
              [v14 setFootnote:v15];

              v16 = [v7 UUID];
              [v14 setSourceID:v16];

              objc_super v17 = (void *)MEMORY[0x1E4F1CAD0];
              v18 = [*(id *)(v27 + 40) title];
              v19 = [v17 setWithObject:v18];
              [v14 addOriginalQueries:v19];

              v20 = [v7 readingListIconURL];
              if ([v20 length])
              {
                v21 = [MEMORY[0x1E4F1CB10] URLWithString:v20];
                [v14 setImageURL:v21];
              }
              v22 = *(void **)(*(void *)(v27 + 48) + 24);
              v23 = [v7 readingListIconUUID];
              v24 = [v22 loadImageSynchronouslyForIconUUID:v23];
              [v14 setImage:v24];

              [v26 addObject:v14];
              id v2 = v25;
            }
          }
        }
      }
      uint64_t v4 = [v2 countByEnumeratingWithState:&v28 objects:v32 count:16];
    }
    while (v4);
  }

  (*(void (**)(void))(*(void *)(v27 + 56) + 16))();
}

- (void)_readingListContentsDidChange:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_leadImageCache, 0);
  objc_storeStrong((id *)&self->_bookmarkProviderAccessQueue, 0);
  objc_storeStrong((id *)&self->_bookmarkProvider, 0);
}

@end