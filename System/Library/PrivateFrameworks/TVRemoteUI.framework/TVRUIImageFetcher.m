@interface TVRUIImageFetcher
+ (TVRUIImageFetcher)imageFetcherWithOptions:(unint64_t)a3;
+ (id)imageFetcher;
- (BOOL)_shouldCache;
- (BOOL)hasPendingCompletionHandlersForIdentifier:(id)a3;
- (NSMutableDictionary)cachedImages;
- (NSMutableDictionary)pendingImageRequestCompletionHandlers;
- (NSURLSession)urlSession;
- (TVRUIImageFetcher)init;
- (TVRUIImageFetcher)initWithOptions:(unint64_t)a3;
- (unint64_t)options;
- (void)addPendingCompletionHandler:(id)a3 identifier:(id)a4;
- (void)fetchImageWithTemplateString:(id)a3 size:(CGSize)a4 identifier:(id)a5 completion:(id)a6;
- (void)fetchImageWithURL:(id)a3 identifier:(id)a4 completion:(id)a5;
- (void)invokeCompletionHandlersForIdentifier:(id)a3 image:(id)a4;
- (void)removePendingCompletionHandlersForIdentifier:(id)a3;
- (void)setCachedImages:(id)a3;
- (void)setPendingImageRequestCompletionHandlers:(id)a3;
- (void)setUrlSession:(id)a3;
@end

@implementation TVRUIImageFetcher

- (TVRUIImageFetcher)init
{
  return [(TVRUIImageFetcher *)self initWithOptions:1];
}

- (TVRUIImageFetcher)initWithOptions:(unint64_t)a3
{
  v14.receiver = self;
  v14.super_class = (Class)TVRUIImageFetcher;
  v4 = [(TVRUIImageFetcher *)&v14 init];
  v5 = v4;
  if (v4)
  {
    v4->_options = a3;
    v6 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x263EFF9A0]);
    cachedImages = v5->_cachedImages;
    v5->_cachedImages = v6;

    v8 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x263EFF9A0]);
    pendingImageRequestCompletionHandlers = v5->_pendingImageRequestCompletionHandlers;
    v5->_pendingImageRequestCompletionHandlers = v8;

    v10 = [MEMORY[0x263F08C00] defaultSessionConfiguration];
    [v10 setHTTPMaximumConnectionsPerHost:30];
    uint64_t v11 = [MEMORY[0x263F08BF8] sessionWithConfiguration:v10];
    urlSession = v5->_urlSession;
    v5->_urlSession = (NSURLSession *)v11;
  }
  return v5;
}

+ (id)imageFetcher
{
  return (id)[a1 imageFetcherWithOptions:1];
}

+ (TVRUIImageFetcher)imageFetcherWithOptions:(unint64_t)a3
{
  v3 = (void *)[objc_alloc((Class)a1) initWithOptions:a3];
  return (TVRUIImageFetcher *)v3;
}

- (void)fetchImageWithTemplateString:(id)a3 size:(CGSize)a4 identifier:(id)a5 completion:(id)a6
{
  double height = a4.height;
  double width = a4.width;
  uint64_t v11 = (void *)MEMORY[0x263F7C9C0];
  id v12 = a6;
  id v13 = a5;
  id v15 = [v11 imageTemplateWithString:a3];
  objc_super v14 = objc_msgSend(v15, "urlForSize:", width, height);
  [(TVRUIImageFetcher *)self fetchImageWithURL:v14 identifier:v13 completion:v12];
}

- (void)fetchImageWithURL:(id)a3 identifier:(id)a4 completion:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  uint64_t v11 = (void (**)(void, void, void))v10;
  if (v8)
  {
    id v12 = [(TVRUIImageFetcher *)self cachedImages];
    id v13 = [v12 objectForKeyedSubscript:v9];

    if (v13)
    {
      ((void (**)(void, id, void *))v11)[2](v11, v9, v13);
    }
    else
    {
      BOOL v14 = [(TVRUIImageFetcher *)self hasPendingCompletionHandlersForIdentifier:v9];
      [(TVRUIImageFetcher *)self addPendingCompletionHandler:v11 identifier:v9];
      if (!v14)
      {
        objc_initWeak(&location, self);
        id v15 = [(TVRUIImageFetcher *)self urlSession];
        v17[0] = MEMORY[0x263EF8330];
        v17[1] = 3221225472;
        v17[2] = __61__TVRUIImageFetcher_fetchImageWithURL_identifier_completion___block_invoke;
        v17[3] = &unk_264800250;
        objc_copyWeak(&v19, &location);
        id v18 = v9;
        v16 = [v15 dataTaskWithURL:v8 completionHandler:v17];

        [v16 resume];
        objc_destroyWeak(&v19);
        objc_destroyWeak(&location);
      }
    }
  }
  else
  {
    (*((void (**)(id, id, void))v10 + 2))(v10, v9, 0);
  }
}

void __61__TVRUIImageFetcher_fetchImageWithURL_identifier_completion___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __61__TVRUIImageFetcher_fetchImageWithURL_identifier_completion___block_invoke_2;
  block[3] = &unk_264800228;
  id v6 = v3;
  id v4 = v3;
  objc_copyWeak(&v8, (id *)(a1 + 40));
  id v7 = *(id *)(a1 + 32);
  dispatch_async(MEMORY[0x263EF83A0], block);

  objc_destroyWeak(&v8);
}

void __61__TVRUIImageFetcher_fetchImageWithURL_identifier_completion___block_invoke_2(uint64_t a1)
{
  if ([*(id *)(a1 + 32) length])
  {
    id v3 = [MEMORY[0x263F827E8] imageWithData:*(void *)(a1 + 32)];
  }
  else
  {
    id v3 = 0;
  }
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  [WeakRetained invokeCompletionHandlersForIdentifier:*(void *)(a1 + 40) image:v3];
}

- (BOOL)_shouldCache
{
  return self->_options & 1;
}

- (BOOL)hasPendingCompletionHandlersForIdentifier:(id)a3
{
  id v4 = a3;
  v5 = [(TVRUIImageFetcher *)self pendingImageRequestCompletionHandlers];
  id v6 = [v5 objectForKeyedSubscript:v4];

  LOBYTE(v5) = [v6 count] != 0;
  return (char)v5;
}

- (void)addPendingCompletionHandler:(id)a3 identifier:(id)a4
{
  v13[1] = *MEMORY[0x263EF8340];
  id v6 = a4;
  id v7 = a3;
  id v8 = [(TVRUIImageFetcher *)self pendingImageRequestCompletionHandlers];
  id v9 = [v8 objectForKeyedSubscript:v6];

  id v10 = _Block_copy(v7);
  if (v9)
  {
    uint64_t v11 = [v9 arrayByAddingObject:v10];
  }
  else
  {
    v13[0] = v10;
    uint64_t v11 = [MEMORY[0x263EFF8C0] arrayWithObjects:v13 count:1];
  }

  id v12 = [(TVRUIImageFetcher *)self pendingImageRequestCompletionHandlers];
  [v12 setObject:v11 forKeyedSubscript:v6];
}

- (void)removePendingCompletionHandlersForIdentifier:(id)a3
{
  id v4 = a3;
  id v5 = [(TVRUIImageFetcher *)self pendingImageRequestCompletionHandlers];
  [v5 removeObjectForKey:v4];
}

- (void)invokeCompletionHandlersForIdentifier:(id)a3 image:(id)a4
{
  uint64_t v21 = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v7 = a4;
  if ([v6 length])
  {
    if (v7)
    {
      id v8 = [(TVRUIImageFetcher *)self cachedImages];
      [v8 setObject:v7 forKeyedSubscript:v6];
    }
    id v9 = [(TVRUIImageFetcher *)self pendingImageRequestCompletionHandlers];
    id v10 = [v9 objectForKeyedSubscript:v6];

    if ([v10 count])
    {
      long long v18 = 0u;
      long long v19 = 0u;
      long long v16 = 0u;
      long long v17 = 0u;
      id v11 = v10;
      uint64_t v12 = [v11 countByEnumeratingWithState:&v16 objects:v20 count:16];
      if (v12)
      {
        uint64_t v13 = v12;
        uint64_t v14 = *(void *)v17;
        do
        {
          uint64_t v15 = 0;
          do
          {
            if (*(void *)v17 != v14) {
              objc_enumerationMutation(v11);
            }
            (*(void (**)(void))(*(void *)(*((void *)&v16 + 1) + 8 * v15) + 16))(*(void *)(*((void *)&v16 + 1) + 8 * v15));
            ++v15;
          }
          while (v13 != v15);
          uint64_t v13 = [v11 countByEnumeratingWithState:&v16 objects:v20 count:16];
        }
        while (v13);
      }
    }
    -[TVRUIImageFetcher removePendingCompletionHandlersForIdentifier:](self, "removePendingCompletionHandlersForIdentifier:", v6, (void)v16);
  }
}

- (unint64_t)options
{
  return self->_options;
}

- (NSURLSession)urlSession
{
  return self->_urlSession;
}

- (void)setUrlSession:(id)a3
{
}

- (NSMutableDictionary)cachedImages
{
  return self->_cachedImages;
}

- (void)setCachedImages:(id)a3
{
}

- (NSMutableDictionary)pendingImageRequestCompletionHandlers
{
  return self->_pendingImageRequestCompletionHandlers;
}

- (void)setPendingImageRequestCompletionHandlers:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_pendingImageRequestCompletionHandlers, 0);
  objc_storeStrong((id *)&self->_cachedImages, 0);
  objc_storeStrong((id *)&self->_urlSession, 0);
}

@end