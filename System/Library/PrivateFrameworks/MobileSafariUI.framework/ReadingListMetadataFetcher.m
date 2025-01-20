@interface ReadingListMetadataFetcher
+ (BOOL)shouldFetchMetadataForBookmark:(id)a3;
+ (BOOL)shouldFetchThumbnailForBookmark:(id)a3;
+ (id)sharedMetadataFetcher;
- (BOOL)_lockAndSaveBookmark:(id)a3 postNotification:(BOOL)a4;
- (BOOL)_queue:(id)a3 containsBookmark:(id)a4;
- (id)_initWithBookmarkCollection:(id)a3;
- (void)_didFailMetadataFetchForBookmarkWithID:(int)a3;
- (void)_didFinishFetchingMetadataForItem:(id)a3;
- (void)_didFinishFetchingThumbnailForItem:(id)a3;
- (void)_fetchMetadataForPendingItem:(id)a3;
- (void)_fetchMetadataWithDefaultProviderForPendingItem:(id)a3;
- (void)_fetchNextItemMetadata;
- (void)_fetchNextItemThumbnail;
- (void)_fetchThumbnailForPendingItem:(id)a3;
- (void)_fetchThumbnailWithDefaultProviderForPendingItem:(id)a3;
- (void)_setThumbnailImage:(id)a3 fromURL:(id)a4 forBookmarkWithID:(int)a5;
- (void)_setTitle:(id)a3 previewText:(id)a4 thumbnailURLString:(id)a5 thumbnailImage:(id)a6 forItem:(id)a7;
- (void)fetchMetadataForReadingListBookmark:(id)a3 withProvider:(id)a4;
- (void)fetchThumbnailForReadingListBookmark:(id)a3 withProvider:(id)a4;
@end

@implementation ReadingListMetadataFetcher

+ (id)sharedMetadataFetcher
{
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __51__ReadingListMetadataFetcher_sharedMetadataFetcher__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (sharedMetadataFetcher_onceToken != -1) {
    dispatch_once(&sharedMetadataFetcher_onceToken, block);
  }
  v2 = (void *)sharedMetadataFetcher_sharedInstance;
  return v2;
}

void __51__ReadingListMetadataFetcher_sharedMetadataFetcher__block_invoke(uint64_t a1)
{
  id v1 = objc_alloc(*(Class *)(a1 + 32));
  id v4 = [MEMORY[0x1E4FB60E8] mainBookmarkCollection];
  uint64_t v2 = [v1 _initWithBookmarkCollection:v4];
  v3 = (void *)sharedMetadataFetcher_sharedInstance;
  sharedMetadataFetcher_sharedInstance = v2;
}

- (id)_initWithBookmarkCollection:(id)a3
{
  id v5 = a3;
  v16.receiver = self;
  v16.super_class = (Class)ReadingListMetadataFetcher;
  v6 = [(ReadingListMetadataFetcher *)&v16 init];
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_collection, a3);
    dispatch_queue_t v8 = dispatch_queue_create("com.apple.Safari.ReadingListMetadataFetcher", 0);
    metadataSynchronizationQueue = v7->_metadataSynchronizationQueue;
    v7->_metadataSynchronizationQueue = (OS_dispatch_queue *)v8;

    uint64_t v10 = [MEMORY[0x1E4F1CA48] array];
    bookmarksPendingMetadata = v7->_bookmarksPendingMetadata;
    v7->_bookmarksPendingMetadata = (NSMutableArray *)v10;

    uint64_t v12 = [MEMORY[0x1E4F1CA48] array];
    bookmarksPendingThumbnail = v7->_bookmarksPendingThumbnail;
    v7->_bookmarksPendingThumbnail = (NSMutableArray *)v12;

    v14 = v7;
  }

  return v7;
}

+ (BOOL)shouldFetchMetadataForBookmark:(id)a3
{
  id v3 = a3;
  if ([v3 hasFetchedMetadata])
  {
    BOOL v4 = 0;
  }
  else
  {
    id v5 = [v3 title];
    if ([v5 length] && (unint64_t)(WBSUnifiedFieldInputTypeForString() - 1) >= 2)
    {
      v6 = [v3 previewText];
      if ([v6 length])
      {
        v7 = [v3 readingListIconURL];
        BOOL v4 = [v7 length] == 0;
      }
      else
      {
        BOOL v4 = 1;
      }
    }
    else
    {
      BOOL v4 = 1;
    }
  }
  return v4;
}

+ (BOOL)shouldFetchThumbnailForBookmark:(id)a3
{
  id v3 = a3;
  if ([v3 hasFetchedMetadata])
  {
    BOOL v4 = 0;
  }
  else
  {
    id v5 = [v3 readingListIconURL];
    if (v5)
    {
      v6 = [v3 readingListIconUUID];
      BOOL v4 = v6 == 0;
    }
    else
    {
      BOOL v4 = 0;
    }
  }
  return v4;
}

- (void)fetchMetadataForReadingListBookmark:(id)a3 withProvider:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  metadataSynchronizationQueue = self->_metadataSynchronizationQueue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __79__ReadingListMetadataFetcher_fetchMetadataForReadingListBookmark_withProvider___block_invoke;
  block[3] = &unk_1E6D78980;
  block[4] = self;
  id v12 = v6;
  id v13 = v7;
  id v9 = v7;
  id v10 = v6;
  dispatch_async(metadataSynchronizationQueue, block);
}

uint64_t __79__ReadingListMetadataFetcher_fetchMetadataForReadingListBookmark_withProvider___block_invoke(uint64_t a1)
{
  uint64_t result = [*(id *)(a1 + 32) _queue:*(void *)(*(void *)(a1 + 32) + 24) containsBookmark:*(void *)(a1 + 40)];
  if ((result & 1) == 0)
  {
    id v3 = *(void **)(*(void *)(a1 + 32) + 24);
    BOOL v4 = +[PendingReadingListItem itemWithBookmark:*(void *)(a1 + 40) provider:*(void *)(a1 + 48)];
    [v3 addObject:v4];

    uint64_t result = *(void *)(a1 + 32);
    if (!*(unsigned char *)(result + 32))
    {
      return [(id)result _fetchNextItemMetadata];
    }
  }
  return result;
}

- (void)fetchThumbnailForReadingListBookmark:(id)a3 withProvider:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  metadataSynchronizationQueue = self->_metadataSynchronizationQueue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __80__ReadingListMetadataFetcher_fetchThumbnailForReadingListBookmark_withProvider___block_invoke;
  block[3] = &unk_1E6D78980;
  block[4] = self;
  id v12 = v6;
  id v13 = v7;
  id v9 = v7;
  id v10 = v6;
  dispatch_async(metadataSynchronizationQueue, block);
}

uint64_t __80__ReadingListMetadataFetcher_fetchThumbnailForReadingListBookmark_withProvider___block_invoke(uint64_t a1)
{
  uint64_t result = [*(id *)(a1 + 32) _queue:*(void *)(*(void *)(a1 + 32) + 40) containsBookmark:*(void *)(a1 + 40)];
  if ((result & 1) == 0)
  {
    uint64_t result = [*(id *)(a1 + 32) _queue:*(void *)(*(void *)(a1 + 32) + 24) containsBookmark:*(void *)(a1 + 40)];
    if ((result & 1) == 0)
    {
      id v3 = *(void **)(*(void *)(a1 + 32) + 40);
      BOOL v4 = +[PendingReadingListItem itemWithBookmark:*(void *)(a1 + 40) provider:*(void *)(a1 + 48)];
      [v3 addObject:v4];

      uint64_t result = *(void *)(a1 + 32);
      if (!*(unsigned char *)(result + 56))
      {
        return [(id)result _fetchNextItemThumbnail];
      }
    }
  }
  return result;
}

- (void)_fetchMetadataForPendingItem:(id)a3
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  self->_isFetchingMetadata = 1;
  id v5 = [v4 provider];
  if (v5 && (objc_opt_respondsToSelector() & 1) != 0)
  {
    id v6 = WBS_LOG_CHANNEL_PREFIXReadingList();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
    {
      id v7 = v6;
      dispatch_queue_t v8 = (objc_class *)objc_opt_class();
      id v9 = NSStringFromClass(v8);
      *(_DWORD *)buf = 138543362;
      v14 = v9;
      _os_log_impl(&dword_1E102C000, v7, OS_LOG_TYPE_INFO, "Begin fetching metadata for Reading List item with provider %{public}@", buf, 0xCu);
    }
    id v10 = [v4 bookmark];
    v11[0] = MEMORY[0x1E4F143A8];
    v11[1] = 3221225472;
    v11[2] = __59__ReadingListMetadataFetcher__fetchMetadataForPendingItem___block_invoke;
    v11[3] = &unk_1E6D7A820;
    v11[4] = self;
    id v12 = v4;
    [v5 fetchMetadataForBookmark:v10 completion:v11];
  }
  else
  {
    [(ReadingListMetadataFetcher *)self _fetchMetadataWithDefaultProviderForPendingItem:v4];
  }
}

void __59__ReadingListMetadataFetcher__fetchMetadataForPendingItem___block_invoke(uint64_t a1, char a2, void *a3, void *a4, void *a5, void *a6)
{
  id v11 = a3;
  id v12 = a4;
  id v13 = a5;
  id v14 = a6;
  if (a2)
  {
    v18[0] = MEMORY[0x1E4F143A8];
    v18[1] = 3221225472;
    v18[2] = __59__ReadingListMetadataFetcher__fetchMetadataForPendingItem___block_invoke_84;
    v18[3] = &unk_1E6D7A7F8;
    v18[4] = *(void *)(a1 + 32);
    uint64_t v15 = &v19;
    id v19 = v11;
    id v20 = v12;
    id v21 = v13;
    id v22 = v14;
    id v23 = *(id *)(a1 + 40);
    dispatch_async(MEMORY[0x1E4F14428], v18);
  }
  else
  {
    uint64_t v16 = *(void *)(a1 + 32);
    v17 = *(NSObject **)(v16 + 16);
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __59__ReadingListMetadataFetcher__fetchMetadataForPendingItem___block_invoke_2;
    block[3] = &unk_1E6D77D90;
    block[4] = v16;
    uint64_t v15 = &v25;
    id v25 = *(id *)(a1 + 40);
    dispatch_async(v17, block);
  }
}

uint64_t __59__ReadingListMetadataFetcher__fetchMetadataForPendingItem___block_invoke_2(uint64_t a1)
{
  uint64_t v2 = WBS_LOG_CHANNEL_PREFIXReadingList();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_ERROR)) {
    __59__ReadingListMetadataFetcher__fetchMetadataForPendingItem___block_invoke_2_cold_1();
  }
  return [*(id *)(a1 + 32) _fetchMetadataWithDefaultProviderForPendingItem:*(void *)(a1 + 40)];
}

void __59__ReadingListMetadataFetcher__fetchMetadataForPendingItem___block_invoke_84(uint64_t a1)
{
  uint64_t v2 = WBS_LOG_CHANNEL_PREFIXReadingList();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1E102C000, v2, OS_LOG_TYPE_INFO, "Successfully fetched metadata for Reading List item", buf, 2u);
  }
  [*(id *)(a1 + 32) _setTitle:*(void *)(a1 + 40) previewText:*(void *)(a1 + 48) thumbnailURLString:*(void *)(a1 + 56) thumbnailImage:*(void *)(a1 + 64) forItem:*(void *)(a1 + 72)];
  uint64_t v3 = *(void *)(a1 + 32);
  id v4 = *(NSObject **)(v3 + 16);
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __59__ReadingListMetadataFetcher__fetchMetadataForPendingItem___block_invoke_85;
  v5[3] = &unk_1E6D77D90;
  v5[4] = v3;
  id v6 = *(id *)(a1 + 72);
  dispatch_async(v4, v5);
}

uint64_t __59__ReadingListMetadataFetcher__fetchMetadataForPendingItem___block_invoke_85(uint64_t a1)
{
  return [*(id *)(a1 + 32) _didFinishFetchingMetadataForItem:*(void *)(a1 + 40)];
}

- (void)_fetchMetadataWithDefaultProviderForPendingItem:(id)a3
{
  id v4 = a3;
  id v5 = WBS_LOG_CHANNEL_PREFIXReadingList();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1E102C000, v5, OS_LOG_TYPE_INFO, "Begin fetching metadata for Reading List item with default provider", buf, 2u);
  }
  id v6 = [v4 bookmark];
  id v7 = objc_alloc_init(ReadingListMetadataProvider);
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __78__ReadingListMetadataFetcher__fetchMetadataWithDefaultProviderForPendingItem___block_invoke;
  v10[3] = &unk_1E6D7A870;
  v10[4] = self;
  id v11 = v4;
  id v12 = v6;
  id v8 = v6;
  id v9 = v4;
  [(ReadingListMetadataProvider *)v7 fetchMetadataForBookmark:v8 completion:v10];
}

void __78__ReadingListMetadataFetcher__fetchMetadataWithDefaultProviderForPendingItem___block_invoke(uint64_t a1, char a2, void *a3, void *a4, void *a5, void *a6)
{
  id v11 = a3;
  id v12 = a4;
  id v13 = a5;
  id v14 = a6;
  v20[0] = MEMORY[0x1E4F143A8];
  v20[1] = 3221225472;
  v20[2] = __78__ReadingListMetadataFetcher__fetchMetadataWithDefaultProviderForPendingItem___block_invoke_2;
  v20[3] = &unk_1E6D7A848;
  char v27 = a2;
  uint64_t v15 = *(void **)(a1 + 40);
  v20[4] = *(void *)(a1 + 32);
  id v21 = v11;
  id v22 = v12;
  id v23 = v13;
  id v24 = v14;
  id v25 = v15;
  id v26 = *(id *)(a1 + 48);
  id v16 = v14;
  id v17 = v13;
  id v18 = v12;
  id v19 = v11;
  dispatch_async(MEMORY[0x1E4F14428], v20);
}

void __78__ReadingListMetadataFetcher__fetchMetadataWithDefaultProviderForPendingItem___block_invoke_2(uint64_t a1)
{
  if (*(unsigned char *)(a1 + 88))
  {
    uint64_t v2 = WBS_LOG_CHANNEL_PREFIXReadingList();
    if (os_log_type_enabled(v2, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1E102C000, v2, OS_LOG_TYPE_INFO, "Successfully fetched metadata for Reading List item with default provider", buf, 2u);
    }
    [*(id *)(a1 + 32) _setTitle:*(void *)(a1 + 40) previewText:*(void *)(a1 + 48) thumbnailURLString:*(void *)(a1 + 56) thumbnailImage:*(void *)(a1 + 64) forItem:*(void *)(a1 + 72)];
  }
  else
  {
    objc_msgSend(*(id *)(a1 + 32), "_didFailMetadataFetchForBookmarkWithID:", objc_msgSend(*(id *)(a1 + 80), "identifier"));
  }
  uint64_t v3 = *(void *)(a1 + 32);
  id v4 = *(NSObject **)(v3 + 16);
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __78__ReadingListMetadataFetcher__fetchMetadataWithDefaultProviderForPendingItem___block_invoke_88;
  v5[3] = &unk_1E6D77D90;
  v5[4] = v3;
  id v6 = *(id *)(a1 + 72);
  dispatch_async(v4, v5);
}

uint64_t __78__ReadingListMetadataFetcher__fetchMetadataWithDefaultProviderForPendingItem___block_invoke_88(uint64_t a1)
{
  return [*(id *)(a1 + 32) _didFinishFetchingMetadataForItem:*(void *)(a1 + 40)];
}

- (void)_fetchThumbnailForPendingItem:(id)a3
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  self->_isFetchingThumbnail = 1;
  id v5 = [v4 bookmark];
  id v6 = [v4 provider];
  if (v6 && (objc_opt_respondsToSelector() & 1) != 0)
  {
    id v7 = WBS_LOG_CHANNEL_PREFIXReadingList();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
    {
      id v8 = v7;
      id v9 = (objc_class *)objc_opt_class();
      id v10 = NSStringFromClass(v9);
      *(_DWORD *)buf = 138543362;
      uint64_t v15 = v10;
      _os_log_impl(&dword_1E102C000, v8, OS_LOG_TYPE_INFO, "Begin fetching thumbnail for Reading List item with provider %{public}@", buf, 0xCu);
    }
    v11[0] = MEMORY[0x1E4F143A8];
    v11[1] = 3221225472;
    v11[2] = __60__ReadingListMetadataFetcher__fetchThumbnailForPendingItem___block_invoke;
    v11[3] = &unk_1E6D7A8C0;
    v11[4] = self;
    id v12 = v4;
    id v13 = v5;
    [v6 fetchThumbnailForBookmark:v13 completion:v11];
  }
  else
  {
    [(ReadingListMetadataFetcher *)self _fetchThumbnailWithDefaultProviderForPendingItem:v4];
  }
}

void __60__ReadingListMetadataFetcher__fetchThumbnailForPendingItem___block_invoke(uint64_t a1, char a2, void *a3, void *a4)
{
  id v7 = a3;
  id v8 = a4;
  id v9 = v8;
  if (a2)
  {
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __60__ReadingListMetadataFetcher__fetchThumbnailForPendingItem___block_invoke_90;
    block[3] = &unk_1E6D7A898;
    block[4] = *(void *)(a1 + 32);
    id v10 = &v14;
    id v14 = v8;
    id v15 = v7;
    id v16 = *(id *)(a1 + 48);
    id v17 = *(id *)(a1 + 40);
    dispatch_async(MEMORY[0x1E4F14428], block);
  }
  else
  {
    uint64_t v11 = *(void *)(a1 + 32);
    id v12 = *(NSObject **)(v11 + 16);
    v18[0] = MEMORY[0x1E4F143A8];
    v18[1] = 3221225472;
    v18[2] = __60__ReadingListMetadataFetcher__fetchThumbnailForPendingItem___block_invoke_2;
    v18[3] = &unk_1E6D77D90;
    v18[4] = v11;
    id v10 = &v19;
    id v19 = *(id *)(a1 + 40);
    dispatch_async(v12, v18);
  }
}

uint64_t __60__ReadingListMetadataFetcher__fetchThumbnailForPendingItem___block_invoke_2(uint64_t a1)
{
  uint64_t v2 = WBS_LOG_CHANNEL_PREFIXReadingList();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_ERROR)) {
    __60__ReadingListMetadataFetcher__fetchThumbnailForPendingItem___block_invoke_2_cold_1();
  }
  return [*(id *)(a1 + 32) _fetchThumbnailWithDefaultProviderForPendingItem:*(void *)(a1 + 40)];
}

void __60__ReadingListMetadataFetcher__fetchThumbnailForPendingItem___block_invoke_90(uint64_t a1)
{
  uint64_t v2 = WBS_LOG_CHANNEL_PREFIXReadingList();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1E102C000, v2, OS_LOG_TYPE_INFO, "Successfully fetched thumbnail for Reading List item", buf, 2u);
  }
  objc_msgSend(*(id *)(a1 + 32), "_setThumbnailImage:fromURL:forBookmarkWithID:", *(void *)(a1 + 40), *(void *)(a1 + 48), objc_msgSend(*(id *)(a1 + 56), "identifier"));
  uint64_t v3 = *(void *)(a1 + 32);
  id v4 = *(NSObject **)(v3 + 16);
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __60__ReadingListMetadataFetcher__fetchThumbnailForPendingItem___block_invoke_91;
  v5[3] = &unk_1E6D77D90;
  v5[4] = v3;
  id v6 = *(id *)(a1 + 64);
  dispatch_async(v4, v5);
}

uint64_t __60__ReadingListMetadataFetcher__fetchThumbnailForPendingItem___block_invoke_91(uint64_t a1)
{
  return [*(id *)(a1 + 32) _didFinishFetchingThumbnailForItem:*(void *)(a1 + 40)];
}

- (void)_fetchThumbnailWithDefaultProviderForPendingItem:(id)a3
{
  id v4 = a3;
  if (!self->_defaultThumbnailProvider)
  {
    id v5 = [MEMORY[0x1E4F98BC0] sharedManager];
    defaultThumbnailProvider = self->_defaultThumbnailProvider;
    self->_defaultThumbnailProvider = v5;
  }
  id v7 = WBS_LOG_CHANNEL_PREFIXReadingList();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1E102C000, v7, OS_LOG_TYPE_INFO, "Begin fetching thumbnail for Reading List item with default provider", buf, 2u);
  }
  id v8 = [v4 bookmark];
  id v9 = self->_defaultThumbnailProvider;
  id v10 = [v4 bookmark];
  v13[0] = MEMORY[0x1E4F143A8];
  v13[1] = 3221225472;
  v13[2] = __79__ReadingListMetadataFetcher__fetchThumbnailWithDefaultProviderForPendingItem___block_invoke;
  v13[3] = &unk_1E6D7A8C0;
  id v14 = v8;
  id v15 = self;
  id v16 = v4;
  id v11 = v4;
  id v12 = v8;
  [(ReadingListMetadataProvider *)v9 fetchThumbnailForBookmark:v10 completion:v13];
}

void __79__ReadingListMetadataFetcher__fetchThumbnailWithDefaultProviderForPendingItem___block_invoke(uint64_t a1, char a2, void *a3, void *a4)
{
  id v7 = a3;
  id v8 = a4;
  v14[0] = MEMORY[0x1E4F143A8];
  v14[1] = 3221225472;
  v14[2] = __79__ReadingListMetadataFetcher__fetchThumbnailWithDefaultProviderForPendingItem___block_invoke_2;
  v14[3] = &unk_1E6D7A8E8;
  id v9 = *(id *)(a1 + 32);
  char v20 = a2;
  uint64_t v10 = *(void *)(a1 + 40);
  id v11 = *(void **)(a1 + 48);
  id v15 = v9;
  uint64_t v16 = v10;
  id v17 = v8;
  id v18 = v7;
  id v19 = v11;
  id v12 = v7;
  id v13 = v8;
  dispatch_async(MEMORY[0x1E4F14428], v14);
}

void __79__ReadingListMetadataFetcher__fetchThumbnailWithDefaultProviderForPendingItem___block_invoke_2(uint64_t a1)
{
  uint64_t v2 = [*(id *)(a1 + 32) identifier];
  if (*(unsigned char *)(a1 + 72))
  {
    uint64_t v3 = WBS_LOG_CHANNEL_PREFIXReadingList();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1E102C000, v3, OS_LOG_TYPE_INFO, "Successfully fetched thumbnail for Reading List item", buf, 2u);
    }
    [*(id *)(a1 + 40) _setThumbnailImage:*(void *)(a1 + 48) fromURL:*(void *)(a1 + 56) forBookmarkWithID:v2];
  }
  else
  {
    [*(id *)(a1 + 40) _didFailMetadataFetchForBookmarkWithID:v2];
  }
  uint64_t v4 = *(void *)(a1 + 40);
  id v5 = *(NSObject **)(v4 + 16);
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __79__ReadingListMetadataFetcher__fetchThumbnailWithDefaultProviderForPendingItem___block_invoke_94;
  v6[3] = &unk_1E6D77D90;
  v6[4] = v4;
  id v7 = *(id *)(a1 + 64);
  dispatch_async(v5, v6);
}

uint64_t __79__ReadingListMetadataFetcher__fetchThumbnailWithDefaultProviderForPendingItem___block_invoke_94(uint64_t a1)
{
  return [*(id *)(a1 + 32) _didFinishFetchingThumbnailForItem:*(void *)(a1 + 40)];
}

- (void)_setTitle:(id)a3 previewText:(id)a4 thumbnailURLString:(id)a5 thumbnailImage:(id)a6 forItem:(id)a7
{
  id v23 = a3;
  id v12 = a4;
  id v13 = a5;
  id v14 = a6;
  collection = self->_collection;
  uint64_t v16 = [a7 bookmark];
  id v17 = -[WebBookmarkCollection bookmarkWithID:](collection, "bookmarkWithID:", [v16 identifier]);

  if (v17)
  {
    id v18 = [v17 title];
    if ([v23 length]
      && (![v18 length] || (unint64_t)(WBSUnifiedFieldInputTypeForString() - 1) <= 1))
    {
      [v17 setTitle:v23];
    }
    id v19 = [v17 previewText];
    if ([v19 length])
    {
    }
    else
    {
      uint64_t v20 = [v12 length];

      if (v20) {
        [v17 setPreviewText:v12];
      }
    }
    id v21 = [v17 readingListIconUUID];
    uint64_t v22 = [v21 length];

    if (!v22)
    {
      if (!v14)
      {
        [v17 setReadingListIconURL:v13];
        goto LABEL_14;
      }
      [(WebBookmarkCollection *)self->_collection saveIconWithData:v14 urlString:v13 forBookmark:v17];
    }
    [v17 setHasFetchedMetadata:1];
LABEL_14:
    [(ReadingListMetadataFetcher *)self _lockAndSaveBookmark:v17 postNotification:1];
  }
}

- (void)_setThumbnailImage:(id)a3 fromURL:(id)a4 forBookmarkWithID:(int)a5
{
  uint64_t v5 = *(void *)&a5;
  id v11 = a3;
  id v8 = a4;
  id v9 = [(WebBookmarkCollection *)self->_collection bookmarkWithID:v5];
  uint64_t v10 = v9;
  if (v9)
  {
    [v9 setHasFetchedMetadata:1];
    [(WebBookmarkCollection *)self->_collection saveIconWithData:v11 urlString:v8 forBookmark:v10];
    [(ReadingListMetadataFetcher *)self _lockAndSaveBookmark:v10 postNotification:1];
  }
}

- (void)_didFailMetadataFetchForBookmarkWithID:(int)a3
{
  uint64_t v3 = *(void *)&a3;
  uint64_t v5 = WBS_LOG_CHANNEL_PREFIXReadingList();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR)) {
    -[ReadingListMetadataFetcher _didFailMetadataFetchForBookmarkWithID:]();
  }
  id v6 = [(WebBookmarkCollection *)self->_collection bookmarkWithID:v3];
  id v7 = v6;
  if (v6)
  {
    [v6 setHasFetchedMetadata:1];
    [(ReadingListMetadataFetcher *)self _lockAndSaveBookmark:v7 postNotification:0];
  }
}

- (BOOL)_lockAndSaveBookmark:(id)a3 postNotification:(BOOL)a4
{
  BOOL v4 = a4;
  v15[1] = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  char v7 = [(id)objc_opt_class() isLockedSync];
  if ((v7 & 1) != 0 || [(id)objc_opt_class() lockSync])
  {
    collection = self->_collection;
    v15[0] = v6;
    id v9 = [MEMORY[0x1E4F1C978] arrayWithObjects:v15 count:1];
    int v10 = [(WebBookmarkCollection *)collection saveBookmarks:v9 postNotification:0];

    if (v10) {
      BOOL v11 = !v4;
    }
    else {
      BOOL v11 = 1;
    }
    if (!v11)
    {
      v13[0] = MEMORY[0x1E4F143A8];
      v13[1] = 3221225472;
      v13[2] = __68__ReadingListMetadataFetcher__lockAndSaveBookmark_postNotification___block_invoke;
      v13[3] = &unk_1E6D77D90;
      void v13[4] = self;
      id v14 = v6;
      dispatch_async(MEMORY[0x1E4F14428], v13);
    }
    if ((v7 & 1) == 0) {
      [(id)objc_opt_class() unlockSync];
    }
  }
  else
  {
    LOBYTE(v10) = 0;
  }

  return v10;
}

void __68__ReadingListMetadataFetcher__lockAndSaveBookmark_postNotification___block_invoke(uint64_t a1)
{
  v7[1] = *MEMORY[0x1E4F143B8];
  uint64_t v2 = [MEMORY[0x1E4F28EB8] defaultCenter];
  uint64_t v4 = *(void *)(a1 + 32);
  uint64_t v3 = *(void *)(a1 + 40);
  id v6 = @"BookmarkWithUpdatedMetadataKey";
  v7[0] = v3;
  uint64_t v5 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v7 forKeys:&v6 count:1];
  [v2 postNotificationName:@"ReadingListBookmarkMetadataDidUpdateNotification" object:v4 userInfo:v5];
}

- (void)_fetchNextItemMetadata
{
  if ([(NSMutableArray *)self->_bookmarksPendingMetadata count])
  {
    id v3 = [(NSMutableArray *)self->_bookmarksPendingMetadata firstObject];
    [(ReadingListMetadataFetcher *)self _fetchMetadataForPendingItem:v3];
  }
}

- (void)_didFinishFetchingMetadataForItem:(id)a3
{
  self->_isFetchingMetadata = 0;
  [(NSMutableArray *)self->_bookmarksPendingMetadata removeObject:a3];
  [(ReadingListMetadataFetcher *)self _fetchNextItemMetadata];
}

- (void)_fetchNextItemThumbnail
{
  if ([(NSMutableArray *)self->_bookmarksPendingThumbnail count])
  {
    id v3 = [(NSMutableArray *)self->_bookmarksPendingThumbnail firstObject];
    [(ReadingListMetadataFetcher *)self _fetchThumbnailForPendingItem:v3];
  }
}

- (void)_didFinishFetchingThumbnailForItem:(id)a3
{
  self->_isFetchingThumbnail = 0;
  [(NSMutableArray *)self->_bookmarksPendingThumbnail removeObject:a3];
  [(ReadingListMetadataFetcher *)self _fetchNextItemThumbnail];
}

- (BOOL)_queue:(id)a3 containsBookmark:(id)a4
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  int v6 = [a4 identifier];
  long long v16 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  id v7 = v5;
  uint64_t v8 = [v7 countByEnumeratingWithState:&v16 objects:v20 count:16];
  if (v8)
  {
    uint64_t v9 = v8;
    uint64_t v10 = *(void *)v17;
    while (2)
    {
      for (uint64_t i = 0; i != v9; ++i)
      {
        if (*(void *)v17 != v10) {
          objc_enumerationMutation(v7);
        }
        id v12 = objc_msgSend(*(id *)(*((void *)&v16 + 1) + 8 * i), "bookmark", (void)v16);
        int v13 = [v12 identifier];

        if (v13 == v6)
        {
          BOOL v14 = 1;
          goto LABEL_11;
        }
      }
      uint64_t v9 = [v7 countByEnumeratingWithState:&v16 objects:v20 count:16];
      if (v9) {
        continue;
      }
      break;
    }
  }
  BOOL v14 = 0;
LABEL_11:

  return v14;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_defaultThumbnailProvider, 0);
  objc_storeStrong((id *)&self->_bookmarksPendingThumbnail, 0);
  objc_storeStrong((id *)&self->_bookmarksPendingMetadata, 0);
  objc_storeStrong((id *)&self->_metadataSynchronizationQueue, 0);
  objc_storeStrong((id *)&self->_collection, 0);
}

void __59__ReadingListMetadataFetcher__fetchMetadataForPendingItem___block_invoke_2_cold_1()
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_1(&dword_1E102C000, v0, v1, "Failed to fetch metadata for Reading List item. Retrying with default provider", v2, v3, v4, v5, v6);
}

void __60__ReadingListMetadataFetcher__fetchThumbnailForPendingItem___block_invoke_2_cold_1()
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_1(&dword_1E102C000, v0, v1, "Failed to fetch thumbnail for Reading List item. Retrying with default provider", v2, v3, v4, v5, v6);
}

- (void)_didFailMetadataFetchForBookmarkWithID:.cold.1()
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_1(&dword_1E102C000, v0, v1, "Failed to fetch thumbnail for Reading List item", v2, v3, v4, v5, v6);
}

@end