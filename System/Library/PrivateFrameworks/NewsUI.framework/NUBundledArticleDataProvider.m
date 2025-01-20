@interface NUBundledArticleDataProvider
- (FCArticle)article;
- (NSArray)linkedContentProviders;
- (NSString)articleID;
- (NUBundledArticleDataProvider)initWithArticle:(id)a3 embedDataManager:(id)a4 linkedContentManager:(id)a5;
- (NUEmbedDataManager)embedDataManager;
- (NULinkedContentManager)linkedContentManager;
- (id)embedForType:(id)a3;
- (id)fileURLForBundleURL:(id)a3;
- (id)loadImagesForImageRequest:(id)a3 completionBlock:(id)a4;
- (int64_t)relativePriority;
- (void)fileURLForURL:(id)a3 onCompletion:(id)a4 onError:(id)a5;
- (void)loadContextWithCompletionBlock:(id)a3;
- (void)performBlockForFontsInBundle:(id)a3;
- (void)registerFontsWithCompletion:(id)a3;
- (void)setRelativePriority:(int64_t)a3;
@end

@implementation NUBundledArticleDataProvider

- (NUBundledArticleDataProvider)initWithArticle:(id)a3 embedDataManager:(id)a4 linkedContentManager:(id)a5
{
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  v17.receiver = self;
  v17.super_class = (Class)NUBundledArticleDataProvider;
  v12 = [(NUBundledArticleDataProvider *)&v17 init];
  v13 = v12;
  if (v12)
  {
    objc_storeStrong((id *)&v12->_article, a3);
    objc_storeStrong((id *)&v13->_embedDataManager, a4);
    objc_storeStrong((id *)&v13->_linkedContentManager, a5);
    uint64_t v14 = [v11 linkedContentProviders];
    linkedContentProviders = v13->_linkedContentProviders;
    v13->_linkedContentProviders = (NSArray *)v14;
  }
  return v13;
}

- (void)performBlockForFontsInBundle:(id)a3
{
  uint64_t v29 = *MEMORY[0x263EF8340];
  v4 = (void (**)(id, void *))a3;
  v5 = [MEMORY[0x263F08850] defaultManager];
  v23 = self;
  v6 = [(NUBundledArticleDataProvider *)self article];
  v7 = [v6 headline];
  v8 = [v7 localDraftPath];
  id v9 = [v5 contentsOfDirectoryAtPath:v8 error:0];

  long long v26 = 0u;
  long long v27 = 0u;
  long long v24 = 0u;
  long long v25 = 0u;
  id obj = v9;
  uint64_t v10 = [obj countByEnumeratingWithState:&v24 objects:v28 count:16];
  if (v10)
  {
    uint64_t v11 = v10;
    uint64_t v12 = *(void *)v25;
    do
    {
      for (uint64_t i = 0; i != v11; ++i)
      {
        if (*(void *)v25 != v12) {
          objc_enumerationMutation(obj);
        }
        uint64_t v14 = *(void **)(*((void *)&v24 + 1) + 8 * i);
        v15 = [v14 pathExtension];
        if (([v15 isEqualToString:@"ttf"] & 1) != 0
          || [v15 isEqualToString:@"otf"])
        {
          v16 = NSURL;
          objc_super v17 = [(NUBundledArticleDataProvider *)v23 article];
          v18 = [v17 headline];
          v19 = [v18 localDraftPath];
          v20 = [v19 stringByAppendingPathComponent:v14];
          v21 = [v16 fileURLWithPath:v20 isDirectory:0];

          v4[2](v4, v21);
        }
      }
      uint64_t v11 = [obj countByEnumeratingWithState:&v24 objects:v28 count:16];
    }
    while (v11);
  }
}

- (void)loadContextWithCompletionBlock:(id)a3
{
  id v4 = a3;
  v5 = [(NUBundledArticleDataProvider *)self embedDataManager];
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __63__NUBundledArticleDataProvider_loadContextWithCompletionBlock___block_invoke;
  v7[3] = &unk_2645FE750;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  [v5 loadEmbedDataWithCompletion:v7];
}

void __63__NUBundledArticleDataProvider_loadContextWithCompletionBlock___block_invoke(uint64_t a1)
{
  v2 = dispatch_get_global_queue(-2, 0);
  v4[0] = MEMORY[0x263EF8330];
  v4[1] = 3221225472;
  v4[2] = __63__NUBundledArticleDataProvider_loadContextWithCompletionBlock___block_invoke_2;
  v4[3] = &unk_2645FE750;
  v3 = *(void **)(a1 + 40);
  v4[4] = *(void *)(a1 + 32);
  id v5 = v3;
  dispatch_async(v2, v4);
}

void __63__NUBundledArticleDataProvider_loadContextWithCompletionBlock___block_invoke_2(uint64_t a1)
{
  v2 = (void *)MEMORY[0x263EFF8F8];
  v3 = [*(id *)(a1 + 32) article];
  id v4 = [v3 headline];
  id v5 = [v4 localDraftPath];
  id v6 = [v5 stringByAppendingPathComponent:@"article.json"];
  id v16 = 0;
  v7 = [v2 dataWithContentsOfFile:v6 options:0 error:&v16];
  id v8 = v16;

  v12[0] = MEMORY[0x263EF8330];
  v12[1] = 3221225472;
  v12[2] = __63__NUBundledArticleDataProvider_loadContextWithCompletionBlock___block_invoke_3;
  v12[3] = &unk_2645FE180;
  uint64_t v9 = *(void *)(a1 + 32);
  uint64_t v10 = *(void **)(a1 + 40);
  id v13 = v7;
  uint64_t v14 = v9;
  id v15 = v10;
  id v11 = v7;
  dispatch_async(MEMORY[0x263EF83A0], v12);
}

void __63__NUBundledArticleDataProvider_loadContextWithCompletionBlock___block_invoke_3(uint64_t a1)
{
  if (*(void *)(a1 + 32))
  {
    v2 = NSURL;
    v3 = [*(id *)(a1 + 40) article];
    id v4 = [v3 headline];
    id v5 = [v4 articleID];
    id v6 = objc_msgSend(v2, "nss_NewsURLForArticleID:", v5);

    id v7 = objc_alloc(MEMORY[0x263F6C5F0]);
    id v8 = [*(id *)(a1 + 40) article];
    uint64_t v9 = [v8 articleID];
    uint64_t v10 = (void *)[v7 initWithIdentifier:v9 shareURL:v6 JSONData:*(void *)(a1 + 32) resourceDataSource:*(void *)(a1 + 40) host:0 error:0];

    v21[0] = MEMORY[0x263EF8330];
    v21[1] = 3221225472;
    v21[2] = __63__NUBundledArticleDataProvider_loadContextWithCompletionBlock___block_invoke_4;
    v21[3] = &unk_2645FF888;
    id v24 = *(id *)(a1 + 48);
    id v11 = v10;
    uint64_t v12 = *(void *)(a1 + 40);
    id v22 = v11;
    uint64_t v23 = v12;
    id v13 = (void *)MEMORY[0x223C968A0](v21);
    uint64_t v14 = [*(id *)(a1 + 40) linkedContentManager];
    char v15 = objc_opt_respondsToSelector();

    id v16 = [*(id *)(a1 + 40) linkedContentManager];
    objc_super v17 = [*(id *)(a1 + 40) article];
    v18 = [v17 headline];
    if (v15) {
      id v19 = (id)[v16 loadLinkedContentForHeadline:v18 withContext:v11 priority:0 completion:v13];
    }
    else {
      id v20 = (id)[v16 loadLinkedContentForHeadline:v18 withContext:v11 completion:v13];
    }
  }
}

uint64_t __63__NUBundledArticleDataProvider_loadContextWithCompletionBlock___block_invoke_4(void *a1)
{
  return (*(uint64_t (**)(void, void, void, void))(a1[6] + 16))(a1[6], a1[4], a1[5], 0);
}

- (NSString)articleID
{
  v2 = [(NUBundledArticleDataProvider *)self article];
  v3 = [v2 articleID];

  return (NSString *)v3;
}

- (void)registerFontsWithCompletion:(id)a3
{
  id v4 = (void (**)(void))a3;
  [(NUBundledArticleDataProvider *)self performBlockForFontsInBundle:&__block_literal_global_15];
  v4[2]();
}

BOOL __60__NUBundledArticleDataProvider_registerFontsWithCompletion___block_invoke(int a1, CFURLRef fontURL)
{
  return CTFontManagerRegisterFontsForURL(fontURL, kCTFontManagerScopeProcess, 0);
}

- (id)loadImagesForImageRequest:(id)a3 completionBlock:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = [v6 URL];

  if (v8)
  {
    uint64_t v9 = dispatch_get_global_queue(-32768, 0);
    block[0] = MEMORY[0x263EF8330];
    block[1] = 3221225472;
    block[2] = __74__NUBundledArticleDataProvider_loadImagesForImageRequest_completionBlock___block_invoke;
    block[3] = &unk_2645FE180;
    block[4] = self;
    id v14 = v6;
    id v15 = v7;
    dispatch_async(v9, block);
  }
  else
  {
    uint64_t v10 = [v6 loadingBlock];

    if (v10)
    {
      id v11 = [v6 loadingBlock];
      v11[2](v11, 0);
    }
    if (v7) {
      (*((void (**)(id, void))v7 + 2))(v7, 0);
    }
  }

  return 0;
}

void __74__NUBundledArticleDataProvider_loadImagesForImageRequest_completionBlock___block_invoke(uint64_t a1)
{
  v2 = *(void **)(a1 + 32);
  v3 = [*(id *)(a1 + 40) URL];
  id v4 = [v2 fileURLForBundleURL:v3];

  [*(id *)(a1 + 40) size];
  id v5 = +[NUANFImageResolver imageResourceResponseForFileURL:perserveColorSpace:withSize:andQuality:](NUANFImageResolver, "imageResourceResponseForFileURL:perserveColorSpace:withSize:andQuality:", v4, 0, 4);
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __74__NUBundledArticleDataProvider_loadImagesForImageRequest_completionBlock___block_invoke_2;
  block[3] = &unk_2645FE180;
  id v8 = *(id *)(a1 + 40);
  id v9 = v5;
  id v10 = *(id *)(a1 + 48);
  id v6 = v5;
  dispatch_async(MEMORY[0x263EF83A0], block);
}

void __74__NUBundledArticleDataProvider_loadImagesForImageRequest_completionBlock___block_invoke_2(uint64_t a1)
{
  v6[1] = *MEMORY[0x263EF8340];
  v2 = [*(id *)(a1 + 32) loadingBlock];

  if (v2)
  {
    v3 = [*(id *)(a1 + 32) loadingBlock];
    v3[2](v3, *(void *)(a1 + 40));
  }
  uint64_t v4 = *(void *)(a1 + 48);
  if (v4)
  {
    v6[0] = *(void *)(a1 + 40);
    id v5 = [MEMORY[0x263EFF8C0] arrayWithObjects:v6 count:1];
    (*(void (**)(uint64_t, void *))(v4 + 16))(v4, v5);
  }
}

- (void)fileURLForURL:(id)a3 onCompletion:(id)a4 onError:(id)a5
{
  id v7 = a3;
  id v8 = a4;
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __67__NUBundledArticleDataProvider_fileURLForURL_onCompletion_onError___block_invoke;
  block[3] = &unk_2645FF888;
  id v12 = v7;
  id v13 = v8;
  void block[4] = self;
  id v9 = v7;
  id v10 = v8;
  dispatch_async(MEMORY[0x263EF83A0], block);
}

void __67__NUBundledArticleDataProvider_fileURLForURL_onCompletion_onError___block_invoke(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 48);
  id v2 = [*(id *)(a1 + 32) fileURLForBundleURL:*(void *)(a1 + 40)];
  (*(void (**)(uint64_t, id))(v1 + 16))(v1, v2);
}

- (id)embedForType:(id)a3
{
  id v4 = a3;
  id v5 = [(NUBundledArticleDataProvider *)self embedDataManager];
  id v6 = [v5 embedForType:v4];

  return v6;
}

- (id)fileURLForBundleURL:(id)a3
{
  id v4 = a3;
  id v5 = [(NUBundledArticleDataProvider *)self article];
  id v6 = [v5 headline];
  id v7 = [v6 localDraftPath];
  id v8 = [v4 host];

  id v9 = [v7 stringByAppendingPathComponent:v8];

  id v10 = [NSURL fileURLWithPath:v9];

  return v10;
}

- (FCArticle)article
{
  return self->_article;
}

- (NSArray)linkedContentProviders
{
  return self->_linkedContentProviders;
}

- (int64_t)relativePriority
{
  return self->_relativePriority;
}

- (void)setRelativePriority:(int64_t)a3
{
  self->_relativePriority = a3;
}

- (NUEmbedDataManager)embedDataManager
{
  return self->_embedDataManager;
}

- (NULinkedContentManager)linkedContentManager
{
  return self->_linkedContentManager;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_linkedContentManager, 0);
  objc_storeStrong((id *)&self->_embedDataManager, 0);
  objc_storeStrong((id *)&self->_linkedContentProviders, 0);

  objc_storeStrong((id *)&self->_article, 0);
}

@end