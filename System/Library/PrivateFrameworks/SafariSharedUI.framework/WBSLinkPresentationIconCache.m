@interface WBSLinkPresentationIconCache
- (BOOL)canHandleRequest:(id)a3;
- (WBSLinkPresentationIconCache)initWithImageDirectoryURL:(id)a3;
- (WBSSiteMetadataProviderDelegate)providerDelegate;
- (id)imageForHost:(id)a3;
- (id)responseForRequest:(id)a3 willProvideUpdates:(BOOL *)a4;
- (void)_historyItemsWereRemoved:(id)a3;
- (void)dealloc;
- (void)emptyCaches;
- (void)purgeUnneededCacheEntries;
- (void)saveImage:(id)a3 forHost:(id)a4;
- (void)savePendingChangesBeforeTermination;
- (void)setProviderDelegate:(id)a3;
@end

@implementation WBSLinkPresentationIconCache

- (void)setProviderDelegate:(id)a3
{
}

- (WBSLinkPresentationIconCache)initWithImageDirectoryURL:(id)a3
{
  id v4 = a3;
  v11.receiver = self;
  v11.super_class = (Class)WBSLinkPresentationIconCache;
  v5 = [(WBSLinkPresentationIconCache *)&v11 init];
  if (v5)
  {
    v6 = [[WBSSiteMetadataImageCache alloc] initWithImageDirectoryURL:v4 imageType:0];
    imageCache = v5->_imageCache;
    v5->_imageCache = v6;

    [(WBSSiteMetadataImageCache *)v5->_imageCache setUpImageCache];
    v8 = [MEMORY[0x1E4F28EB8] defaultCenter];
    [v8 addObserver:v5 selector:sel__historyItemsWereRemoved_ name:*MEMORY[0x1E4F98638] object:0];

    v9 = v5;
  }

  return v5;
}

- (id)imageForHost:(id)a3
{
  id v4 = a3;
  v5 = dispatch_group_create();
  dispatch_group_enter(v5);
  uint64_t v14 = 0;
  v15 = &v14;
  uint64_t v16 = 0x3032000000;
  v17 = __Block_byref_object_copy__13;
  v18 = __Block_byref_object_dispose__13;
  id v19 = 0;
  imageCache = self->_imageCache;
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = __45__WBSLinkPresentationIconCache_imageForHost___block_invoke;
  v11[3] = &unk_1E5E435D8;
  v13 = &v14;
  v7 = v5;
  v12 = v7;
  [(WBSSiteMetadataImageCache *)imageCache getImageForKeyString:v4 completionHandler:v11];
  dispatch_time_t v8 = dispatch_time(0, 100000000);
  dispatch_group_wait(v7, v8);
  id v9 = (id)v15[5];

  _Block_object_dispose(&v14, 8);
  return v9;
}

void __45__WBSLinkPresentationIconCache_imageForHost___block_invoke(uint64_t a1, void *a2)
{
  objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40), a2);
  id v4 = a2;
  dispatch_group_leave(*(dispatch_group_t *)(a1 + 32));
}

- (void)saveImage:(id)a3 forHost:(id)a4
{
}

- (void)dealloc
{
  [(WBSSiteMetadataImageCache *)self->_imageCache savePendingChangesBeforeTermination];
  v3.receiver = self;
  v3.super_class = (Class)WBSLinkPresentationIconCache;
  [(WBSLinkPresentationIconCache *)&v3 dealloc];
}

- (void)_historyItemsWereRemoved:(id)a3
{
  id v4 = [a3 userInfo];
  v5 = [v4 objectForKeyedSubscript:*MEMORY[0x1E4F98620]];
  objc_msgSend(v5, "safari_setByApplyingBlock:", &__block_literal_global_23);
  id v8 = (id)objc_claimAutoreleasedReturnValue();

  if ([v8 count])
  {
    imageCache = self->_imageCache;
    v7 = [v8 allObjects];
    [(WBSSiteMetadataImageCache *)imageCache removeImagesFromCacheForKeyStrings:v7];
  }
}

id __57__WBSLinkPresentationIconCache__historyItemsWereRemoved___block_invoke(uint64_t a1, void *a2)
{
  v2 = [a2 url];
  objc_super v3 = [v2 host];

  return v3;
}

- (BOOL)canHandleRequest:(id)a3
{
  return 0;
}

- (id)responseForRequest:(id)a3 willProvideUpdates:(BOOL *)a4
{
  return 0;
}

- (void)emptyCaches
{
}

- (void)savePendingChangesBeforeTermination
{
}

- (void)purgeUnneededCacheEntries
{
}

- (WBSSiteMetadataProviderDelegate)providerDelegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_providerDelegate);
  return (WBSSiteMetadataProviderDelegate *)WeakRetained;
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_providerDelegate);
  objc_storeStrong((id *)&self->_imageCache, 0);
}

@end