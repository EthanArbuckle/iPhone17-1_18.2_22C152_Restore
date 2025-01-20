@interface WBSLeadImageCache
- (BOOL)canHandleRequest:(id)a3;
- (WBSLeadImageCache)initWithImageDirectoryURL:(id)a3;
- (WBSLeadImageCache)initWithoutDiskCache;
- (WBSSiteMetadataProviderDelegate)providerDelegate;
- (id)responseForRequest:(id)a3 willProvideUpdates:(BOOL *)a4;
- (void)_addRequest:(id)a3;
- (void)emptyCaches;
- (void)prepareResponseForRequest:(id)a3 allowDelayedResponse:(BOOL)a4;
- (void)purgeUnneededCacheEntries;
- (void)saveImage:(id)a3 forURL:(id)a4 completionHandler:(id)a5;
- (void)savePendingChangesBeforeTermination;
- (void)setProviderDelegate:(id)a3;
- (void)siteMetadataImageCacheDidEmptyCache:(id)a3;
- (void)stopWatchingUpdatesForRequest:(id)a3;
@end

@implementation WBSLeadImageCache

- (void)setProviderDelegate:(id)a3
{
}

- (WBSLeadImageCache)initWithImageDirectoryURL:(id)a3
{
  id v4 = a3;
  v19.receiver = self;
  v19.super_class = (Class)WBSLeadImageCache;
  v5 = [(WBSLeadImageCache *)&v19 init];
  if (v5)
  {
    v6 = NSString;
    v7 = (objc_class *)objc_opt_class();
    v8 = NSStringFromClass(v7);
    id v9 = [v6 stringWithFormat:@"com.apple.Safari.%@.%p.internalQueue", v8, v5];
    v10 = (const char *)[v9 UTF8String];
    dispatch_queue_t v11 = dispatch_queue_create(v10, MEMORY[0x1E4F14430]);
    internalQueue = v5->_internalQueue;
    v5->_internalQueue = (OS_dispatch_queue *)v11;

    v13 = [[WBSSiteMetadataImageCache alloc] initWithImageDirectoryURL:v4 imageType:1];
    imageCache = v5->_imageCache;
    v5->_imageCache = v13;

    [(WBSSiteMetadataImageCache *)v5->_imageCache setDelegate:v5];
    [(WBSSiteMetadataImageCache *)v5->_imageCache setUpImageCache];
    uint64_t v15 = [MEMORY[0x1E4F1CA60] dictionary];
    urlStringToRequestSets = v5->_urlStringToRequestSets;
    v5->_urlStringToRequestSets = (NSMutableDictionary *)v15;

    v17 = v5;
  }

  return v5;
}

- (WBSLeadImageCache)initWithoutDiskCache
{
  return [(WBSLeadImageCache *)self initWithImageDirectoryURL:0];
}

- (void)saveImage:(id)a3 forURL:(id)a4 completionHandler:(id)a5
{
  imageCache = self->_imageCache;
  id v8 = a5;
  id v9 = a3;
  id v10 = [a4 absoluteString];
  [(WBSSiteMetadataImageCache *)imageCache saveImageToDisk:v9 forKeyString:v10 completionHandler:v8];
}

- (void)prepareResponseForRequest:(id)a3 allowDelayedResponse:(BOOL)a4
{
  id v5 = a3;
  objc_initWeak(&location, self);
  internalQueue = self->_internalQueue;
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __68__WBSLeadImageCache_prepareResponseForRequest_allowDelayedResponse___block_invoke;
  v8[3] = &unk_1E5E434E8;
  v8[4] = self;
  id v9 = v5;
  id v7 = v5;
  objc_copyWeak(&v10, &location);
  dispatch_barrier_async(internalQueue, v8);
  objc_destroyWeak(&v10);

  objc_destroyWeak(&location);
}

void __68__WBSLeadImageCache_prepareResponseForRequest_allowDelayedResponse___block_invoke(id *a1)
{
  [a1[4] _addRequest:a1[5]];
  v2 = [a1[5] url];
  v3 = (void *)*((void *)a1[4] + 1);
  id v4 = [v2 absoluteString];
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __68__WBSLeadImageCache_prepareResponseForRequest_allowDelayedResponse___block_invoke_2;
  v8[3] = &unk_1E5E434C0;
  id v5 = v2;
  id v6 = a1[4];
  id v7 = a1[5];
  id v9 = v5;
  id v10 = v6;
  id v11 = v7;
  objc_copyWeak(&v12, a1 + 6);
  [v3 getImageForKeyString:v4 completionHandler:v8];

  objc_destroyWeak(&v12);
}

void __68__WBSLeadImageCache_prepareResponseForRequest_allowDelayedResponse___block_invoke_2(uint64_t a1, void *a2)
{
  id v3 = a2;
  if (v3)
  {
    id v4 = +[WBSLeadImageCacheResponse responseWithURL:*(void *)(a1 + 32) thumbnail:v3];
    id WeakRetained = objc_loadWeakRetained((id *)(*(void *)(a1 + 40) + 32));
    [WeakRetained siteMetadataProvider:*(void *)(a1 + 40) didReceiveResponse:v4 ofType:0 didReceiveNewData:1 forRequest:*(void *)(a1 + 48)];
  }
  else
  {
    id v6 = +[WBSImageFetchingURLSessionTaskManager sharedManager];
    uint64_t v7 = *(void *)(a1 + 32);
    v8[0] = MEMORY[0x1E4F143A8];
    v8[1] = 3221225472;
    v8[2] = __68__WBSLeadImageCache_prepareResponseForRequest_allowDelayedResponse___block_invoke_3;
    v8[3] = &unk_1E5E43498;
    objc_copyWeak(&v11, (id *)(a1 + 56));
    id v9 = *(id *)(a1 + 32);
    id v10 = *(id *)(a1 + 48);
    [v6 downloadImageWithURL:v7 options:1 completionHandler:v8];

    objc_destroyWeak(&v11);
  }
}

void __68__WBSLeadImageCache_prepareResponseForRequest_allowDelayedResponse___block_invoke_3(id *a1, void *a2)
{
  id v3 = a2;
  id WeakRetained = (NSObject **)objc_loadWeakRetained(a1 + 6);
  id v5 = WeakRetained;
  if (WeakRetained)
  {
    id v6 = WeakRetained[2];
    v7[0] = MEMORY[0x1E4F143A8];
    v7[1] = 3221225472;
    v7[2] = __68__WBSLeadImageCache_prepareResponseForRequest_allowDelayedResponse___block_invoke_4;
    v7[3] = &unk_1E5E412F0;
    v7[4] = WeakRetained;
    id v8 = v3;
    id v9 = a1[4];
    id v10 = a1[5];
    dispatch_async(v6, v7);
  }
}

void __68__WBSLeadImageCache_prepareResponseForRequest_allowDelayedResponse___block_invoke_4(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(*(void *)(a1 + 32) + 32));
  if (*(void *)(a1 + 40))
  {
    v2 = +[WBSImageUtilities squareThumbnailImageFromImage:thumbnailWidthInPixels:](WBSImageUtilities, "squareThumbnailImageFromImage:thumbnailWidthInPixels:", 168.0);
    [*(id *)(a1 + 32) saveImage:v2 forURL:*(void *)(a1 + 48) completionHandler:0];
    id v3 = +[WBSLeadImageCacheResponse responseWithURL:*(void *)(a1 + 48) thumbnail:v2];
    [WeakRetained siteMetadataProvider:*(void *)(a1 + 32) didReceiveResponse:v3 ofType:0 didReceiveNewData:1 forRequest:*(void *)(a1 + 56)];
  }
  else
  {
    v2 = +[WBSLeadImageCacheResponse responseWithURL:*(void *)(a1 + 48) thumbnail:0];
    [WeakRetained siteMetadataProvider:*(void *)(a1 + 32) didReceiveResponse:v2 ofType:0 didReceiveNewData:1 forRequest:*(void *)(a1 + 56)];
  }
}

- (id)responseForRequest:(id)a3 willProvideUpdates:(BOOL *)a4
{
  id v5 = [a3 url];
  if (v5)
  {
    id v6 = 0;
    *a4 = 1;
  }
  else
  {
    *a4 = 0;
    id v6 = +[WBSLeadImageCacheResponse responseWithURL:0 thumbnail:0];
  }

  return v6;
}

- (BOOL)canHandleRequest:(id)a3
{
  id v3 = a3;
  objc_opt_class();
  char isKindOfClass = objc_opt_isKindOfClass();

  return isKindOfClass & 1;
}

- (void)stopWatchingUpdatesForRequest:(id)a3
{
  id v4 = a3;
  internalQueue = self->_internalQueue;
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __51__WBSLeadImageCache_stopWatchingUpdatesForRequest___block_invoke;
  v7[3] = &unk_1E5E40D38;
  id v8 = v4;
  id v9 = self;
  id v6 = v4;
  dispatch_barrier_async(internalQueue, v7);
}

void __51__WBSLeadImageCache_stopWatchingUpdatesForRequest___block_invoke(uint64_t a1)
{
  v2 = [*(id *)(a1 + 32) url];
  id v4 = [v2 absoluteString];

  id v3 = [*(id *)(*(void *)(a1 + 40) + 24) objectForKeyedSubscript:v4];
  [v3 removeObject:*(void *)(a1 + 32)];
  if (![v3 count]) {
    [*(id *)(*(void *)(a1 + 40) + 24) removeObjectForKey:v4];
  }
}

- (void)_addRequest:(id)a3
{
  id v7 = a3;
  id v4 = [v7 url];
  id v5 = [v4 absoluteString];

  id v6 = [(NSMutableDictionary *)self->_urlStringToRequestSets objectForKeyedSubscript:v5];
  if (!v6)
  {
    id v6 = [MEMORY[0x1E4F1CA80] set];
    [(NSMutableDictionary *)self->_urlStringToRequestSets setObject:v6 forKeyedSubscript:v5];
  }
  [v6 addObject:v7];
}

- (void)emptyCaches
{
}

- (void)purgeUnneededCacheEntries
{
}

- (void)savePendingChangesBeforeTermination
{
}

- (void)siteMetadataImageCacheDidEmptyCache:(id)a3
{
  internalQueue = self->_internalQueue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __57__WBSLeadImageCache_siteMetadataImageCacheDidEmptyCache___block_invoke;
  block[3] = &unk_1E5E40968;
  block[4] = self;
  dispatch_async(internalQueue, block);
}

uint64_t __57__WBSLeadImageCache_siteMetadataImageCacheDidEmptyCache___block_invoke(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 32);
  v2 = *(void **)(v1 + 24);
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __57__WBSLeadImageCache_siteMetadataImageCacheDidEmptyCache___block_invoke_2;
  v4[3] = &unk_1E5E43510;
  v4[4] = v1;
  return [v2 enumerateKeysAndObjectsUsingBlock:v4];
}

void __57__WBSLeadImageCache_siteMetadataImageCacheDidEmptyCache___block_invoke_2(uint64_t a1, uint64_t a2, void *a3)
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  [*(id *)(*(void *)(a1 + 32) + 8) setImageState:1 forKeyString:a2];
  long long v18 = 0u;
  long long v19 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  id obj = v5;
  uint64_t v6 = [obj countByEnumeratingWithState:&v16 objects:v20 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v17;
    do
    {
      uint64_t v9 = 0;
      do
      {
        if (*(void *)v17 != v8) {
          objc_enumerationMutation(obj);
        }
        id v10 = *(void **)(*((void *)&v16 + 1) + 8 * v9);
        id WeakRetained = objc_loadWeakRetained((id *)(*(void *)(a1 + 32) + 32));
        uint64_t v12 = *(void *)(a1 + 32);
        v13 = [v10 url];
        v14 = +[WBSLeadImageCacheResponse responseWithURL:v13 thumbnail:0];
        [WeakRetained siteMetadataProvider:v12 didReceiveResponse:v14 ofType:0 didReceiveNewData:0 forRequest:v10];

        ++v9;
      }
      while (v7 != v9);
      uint64_t v7 = [obj countByEnumeratingWithState:&v16 objects:v20 count:16];
    }
    while (v7);
  }
}

- (WBSSiteMetadataProviderDelegate)providerDelegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_providerDelegate);
  return (WBSSiteMetadataProviderDelegate *)WeakRetained;
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_providerDelegate);
  objc_storeStrong((id *)&self->_urlStringToRequestSets, 0);
  objc_storeStrong((id *)&self->_internalQueue, 0);
  objc_storeStrong((id *)&self->_imageCache, 0);
}

@end