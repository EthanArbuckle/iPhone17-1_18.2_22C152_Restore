@interface SKUIJSImageColorAnalyzer
- (SKUIJSImageColorAnalyzer)initWithAppContext:(id)a3 clientContext:(id)a4;
- (void)analyzeImageAtUrl:(id)a3 :(id)a4;
- (void)artworkRequest:(id)a3 didLoadImage:(id)a4;
- (void)dealloc;
@end

@implementation SKUIJSImageColorAnalyzer

- (SKUIJSImageColorAnalyzer)initWithAppContext:(id)a3 clientContext:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if (os_variant_has_internal_content()
    && _os_feature_enabled_impl()
    && os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_DEBUG))
  {
    -[SKUIJSImageColorAnalyzer initWithAppContext:clientContext:]();
  }
  v17.receiver = self;
  v17.super_class = (Class)SKUIJSImageColorAnalyzer;
  v8 = [(IKJSObject *)&v17 initWithAppContext:v6];
  v9 = v8;
  if (v8)
  {
    objc_storeStrong((id *)&v8->_clientContext, a4);
    v10 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E4F1CA60]);
    artworkRequestIDsToManagedCallbacks = v9->_artworkRequestIDsToManagedCallbacks;
    v9->_artworkRequestIDsToManagedCallbacks = v10;

    v12 = (NSOperationQueue *)objc_alloc_init(MEMORY[0x1E4F28F08]);
    operationQueue = v9->_operationQueue;
    v9->_operationQueue = v12;

    [(NSOperationQueue *)v9->_operationQueue setMaxConcurrentOperationCount:2];
    v14 = [[SKUIResourceLoader alloc] initWithOperationQueue:v9->_operationQueue clientContext:v9->_clientContext];
    resourceLoader = v9->_resourceLoader;
    v9->_resourceLoader = v14;
  }
  return v9;
}

- (void)dealloc
{
  [(NSOperationQueue *)self->_operationQueue cancelAllOperations];
  v3.receiver = self;
  v3.super_class = (Class)SKUIJSImageColorAnalyzer;
  [(SKUIJSImageColorAnalyzer *)&v3 dealloc];
}

- (void)analyzeImageAtUrl:(id)a3 :(id)a4
{
  v18[1] = *MEMORY[0x1E4F143B8];
  id v6 = (void *)MEMORY[0x1E4F1CB10];
  id v7 = a4;
  v8 = [v6 URLWithString:a3];
  v9 = +[SSVURLDataConsumer consumer];
  v10 = objc_alloc_init(SKUIArtworkRequest);
  [(SKUIResourceRequest *)v10 setCacheKey:v8];
  [(SKUIArtworkRequest *)v10 setDataConsumer:v9];
  [(SKUIArtworkRequest *)v10 setURL:v8];
  [(SKUIArtworkRequest *)v10 setDelegate:self];
  v11 = objc_msgSend(objc_alloc(NSNumber), "initWithUnsignedInteger:", -[SKUIResourceRequest requestIdentifier](v10, "requestIdentifier"));
  [(SKUIResourceLoader *)self->_resourceLoader loadResourceWithRequest:v10 reason:1];
  v12 = [MEMORY[0x1E4F30928] managedValueWithValue:v7];
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
    objc_super v17 = [MEMORY[0x1E4F1C978] arrayWithObjects:v18 count:1];
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
  [(SKUIResourceLoader *)self->_resourceLoader removeAllCachedResources];
  if (v12)
  {
    if (v6)
    {
      v13 = +[SKUIImageColorAnalyzer analyzeImage:v6];
      v14 = [SKUIJSAnalyzedImageColors alloc];
      v15 = [(IKJSObject *)self appContext];
      v16 = [(SKUIJSAnalyzedImageColors *)v14 initWithAppContext:v15 analyzedImageColors:v13];
    }
    else
    {
      v16 = 0;
    }
    v18[0] = MEMORY[0x1E4F143A8];
    v18[1] = 3221225472;
    void v18[2] = __56__SKUIJSImageColorAnalyzer_artworkRequest_didLoadImage___block_invoke;
    v18[3] = &unk_1E6423DA8;
    id v19 = v12;
    v20 = v16;
    v21 = self;
    objc_super v17 = v16;
    [v8 evaluate:v18 completionBlock:0];
  }
}

void __56__SKUIJSImageColorAnalyzer_artworkRequest_didLoadImage___block_invoke(uint64_t a1)
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
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
        id v9 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v17 count:1];
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

- (void)initWithAppContext:clientContext:.cold.1()
{
  uint64_t v2 = *MEMORY[0x1E4F143B8];
  int v0 = 136446210;
  v1 = "-[SKUIJSImageColorAnalyzer initWithAppContext:clientContext:]";
}

@end