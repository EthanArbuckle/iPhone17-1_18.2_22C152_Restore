@interface SUUIJSImageColorAnalyzer
- (SUUIJSImageColorAnalyzer)initWithAppContext:(id)a3 clientContext:(id)a4;
- (void)analyzeImageAtUrl:(id)a3 :(id)a4;
- (void)artworkRequest:(id)a3 didLoadImage:(id)a4;
- (void)dealloc;
@end

@implementation SUUIJSImageColorAnalyzer

- (SUUIJSImageColorAnalyzer)initWithAppContext:(id)a3 clientContext:(id)a4
{
  id v7 = a4;
  v17.receiver = self;
  v17.super_class = (Class)SUUIJSImageColorAnalyzer;
  v8 = [(IKJSObject *)&v17 initWithAppContext:a3];
  v9 = v8;
  if (v8)
  {
    objc_storeStrong((id *)&v8->_clientContext, a4);
    v10 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x263EFF9A0]);
    artworkRequestIDsToManagedCallbacks = v9->_artworkRequestIDsToManagedCallbacks;
    v9->_artworkRequestIDsToManagedCallbacks = v10;

    v12 = (NSOperationQueue *)objc_alloc_init(MEMORY[0x263F08A48]);
    operationQueue = v9->_operationQueue;
    v9->_operationQueue = v12;

    [(NSOperationQueue *)v9->_operationQueue setMaxConcurrentOperationCount:2];
    v14 = [[SUUIResourceLoader alloc] initWithOperationQueue:v9->_operationQueue clientContext:v9->_clientContext];
    resourceLoader = v9->_resourceLoader;
    v9->_resourceLoader = v14;
  }
  return v9;
}

- (void)dealloc
{
  [(NSOperationQueue *)self->_operationQueue cancelAllOperations];
  v3.receiver = self;
  v3.super_class = (Class)SUUIJSImageColorAnalyzer;
  [(SUUIJSImageColorAnalyzer *)&v3 dealloc];
}

- (void)analyzeImageAtUrl:(id)a3 :(id)a4
{
  v18[1] = *MEMORY[0x263EF8340];
  v6 = NSURL;
  id v7 = a4;
  v8 = [v6 URLWithString:a3];
  v9 = +[SSVURLDataConsumer consumer];
  v10 = objc_alloc_init(SUUIArtworkRequest);
  [(SUUIResourceRequest *)v10 setCacheKey:v8];
  [(SUUIArtworkRequest *)v10 setDataConsumer:v9];
  [(SUUIArtworkRequest *)v10 setURL:v8];
  [(SUUIArtworkRequest *)v10 setDelegate:self];
  v11 = objc_msgSend(objc_alloc(NSNumber), "initWithUnsignedInteger:", -[SUUIResourceRequest requestIdentifier](v10, "requestIdentifier"));
  [(SUUIResourceLoader *)self->_resourceLoader loadResourceWithRequest:v10 reason:1];
  v12 = [MEMORY[0x263F10388] managedValueWithValue:v7];
  v13 = [v7 context];

  v14 = [v13 virtualMachine];

  [v14 addManagedReference:v12 withOwner:self];
  v15 = [(NSMutableDictionary *)self->_artworkRequestIDsToManagedCallbacks objectForKey:v11];
  if (v15)
  {
    v16 = v15;
    objc_super v17 = [v15 arrayByAddingObject:v12];
  }
  else
  {
    v18[0] = v12;
    objc_super v17 = [MEMORY[0x263EFF8C0] arrayWithObjects:v18 count:1];
  }
  [(NSMutableDictionary *)self->_artworkRequestIDsToManagedCallbacks setObject:v17 forKey:v11];
}

- (void)artworkRequest:(id)a3 didLoadImage:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  v8 = [(IKJSObject *)self appContext];
  id v9 = objc_alloc(NSNumber);
  uint64_t v10 = [v7 requestIdentifier];

  v11 = (void *)[v9 initWithUnsignedInteger:v10];
  v12 = [(NSMutableDictionary *)self->_artworkRequestIDsToManagedCallbacks objectForKey:v11];
  [(NSMutableDictionary *)self->_artworkRequestIDsToManagedCallbacks removeObjectForKey:v11];
  [(SUUIResourceLoader *)self->_resourceLoader removeAllCachedResources];
  if (v12)
  {
    if (v6)
    {
      v13 = +[SUUIImageColorAnalyzer analyzeImage:v6];
      v14 = [SUUIJSAnalyzedImageColors alloc];
      v15 = [(IKJSObject *)self appContext];
      v16 = [(SUUIJSAnalyzedImageColors *)v14 initWithAppContext:v15 analyzedImageColors:v13];
    }
    else
    {
      v16 = 0;
    }
    v18[0] = MEMORY[0x263EF8330];
    v18[1] = 3221225472;
    void v18[2] = __56__SUUIJSImageColorAnalyzer_artworkRequest_didLoadImage___block_invoke;
    v18[3] = &unk_265403460;
    id v19 = v12;
    v20 = v16;
    v21 = self;
    objc_super v17 = v16;
    [v8 evaluate:v18 completionBlock:0];
  }
}

void __56__SUUIJSImageColorAnalyzer_artworkRequest_didLoadImage___block_invoke(uint64_t a1)
{
  uint64_t v19 = *MEMORY[0x263EF8340];
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  id v2 = *(id *)(a1 + 32);
  uint64_t v3 = [v2 countByEnumeratingWithState:&v13 objects:v18 count:16];
  if (v3)
  {
    uint64_t v4 = v3;
    uint64_t v5 = *(void *)v14;
    do
    {
      for (uint64_t i = 0; i != v4; ++i)
      {
        if (*(void *)v14 != v5) {
          objc_enumerationMutation(v2);
        }
        id v7 = *(void **)(*((void *)&v13 + 1) + 8 * i);
        v8 = objc_msgSend(v7, "value", (void)v13);
        uint64_t v17 = *(void *)(a1 + 40);
        id v9 = [MEMORY[0x263EFF8C0] arrayWithObjects:&v17 count:1];
        id v10 = (id)[v8 callWithArguments:v9];

        v11 = [v8 context];
        v12 = [v11 virtualMachine];

        [v12 removeManagedReference:v7 withOwner:*(void *)(a1 + 48)];
      }
      uint64_t v4 = [v2 countByEnumeratingWithState:&v13 objects:v18 count:16];
    }
    while (v4);
  }
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_resourceLoader, 0);
  objc_storeStrong((id *)&self->_operationQueue, 0);
  objc_storeStrong((id *)&self->_artworkRequestIDsToManagedCallbacks, 0);
  objc_storeStrong((id *)&self->_clientContext, 0);
}

@end