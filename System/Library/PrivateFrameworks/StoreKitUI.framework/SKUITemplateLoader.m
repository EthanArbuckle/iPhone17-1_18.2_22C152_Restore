@interface SKUITemplateLoader
- (NSArray)URLs;
- (NSMutableArray)errors;
- (NSMutableDictionary)templateStrings;
- (NSOperationQueue)operationQueue;
- (NSRegularExpression)templateParsingRegularExpression;
- (SKUITemplateLoader)initWithURLs:(id)a3 completionBlock:(id)a4;
- (id)_operationWithURL:(id)a3;
- (id)completionBlock;
- (int64_t)pendingOperationCount;
- (void)_operation:(id)a3 didCompleteWithOutput:(id)a4;
- (void)_operation:(id)a3 didFailWithError:(id)a4;
- (void)_operationDidFinish:(id)a3;
- (void)load;
- (void)setPendingOperationCount:(int64_t)a3;
@end

@implementation SKUITemplateLoader

- (SKUITemplateLoader)initWithURLs:(id)a3 completionBlock:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if (os_variant_has_internal_content())
  {
    if (_os_feature_enabled_impl())
    {
      BOOL v8 = os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_FAULT);
      if (v8) {
        -[SKUITemplateLoader initWithURLs:completionBlock:](v8, v9, v10, v11, v12, v13, v14, v15);
      }
    }
  }
  v30.receiver = self;
  v30.super_class = (Class)SKUITemplateLoader;
  v16 = [(SKUITemplateLoader *)&v30 init];
  if (v16)
  {
    uint64_t v17 = [v6 copy];
    URLs = v16->_URLs;
    v16->_URLs = (NSArray *)v17;

    uint64_t v19 = [v7 copy];
    id completionBlock = v16->_completionBlock;
    v16->_id completionBlock = (id)v19;

    v21 = (NSOperationQueue *)objc_alloc_init(MEMORY[0x1E4F28F08]);
    operationQueue = v16->_operationQueue;
    v16->_operationQueue = v21;

    [(NSOperationQueue *)v16->_operationQueue setName:@"com.apple.StoreKit.SKUITemplateLoader"];
    [(NSOperationQueue *)v16->_operationQueue setMaxConcurrentOperationCount:4];
    uint64_t v23 = +[SKUITemplateParsingDataProvider templateParsingRegularExpression];
    templateParsingRegularExpression = v16->_templateParsingRegularExpression;
    v16->_templateParsingRegularExpression = (NSRegularExpression *)v23;

    v25 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E4F1CA48]);
    errors = v16->_errors;
    v16->_errors = v25;

    v27 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E4F1CA60]);
    templateStrings = v16->_templateStrings;
    v16->_templateStrings = v27;
  }
  return v16;
}

- (id)_operationWithURL:(id)a3
{
  id v4 = a3;
  v5 = (void *)[objc_alloc(MEMORY[0x1E4FA8268]) initWithURL:v4];
  [v5 setAllowedRetryCount:1];
  id v6 = (void *)[objc_alloc(MEMORY[0x1E4FA8338]) initWithURLRequestProperties:v5];
  [v6 setRecordsMetrics:1];
  [v6 setITunesStoreRequest:1];
  id v7 = [SKUITemplateParsingDataProvider alloc];
  BOOL v8 = [(SKUITemplateLoader *)self templateParsingRegularExpression];
  uint64_t v9 = [(SKUITemplateParsingDataProvider *)v7 initWithRegularExpression:v8];
  [v6 setDataConsumer:v9];

  objc_initWeak(&location, self);
  objc_initWeak(&from, v6);
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = __40__SKUITemplateLoader__operationWithURL___block_invoke;
  v11[3] = &unk_1E6427E48;
  objc_copyWeak(&v12, &location);
  objc_copyWeak(&v13, &from);
  [v6 setOutputBlock:v11];
  objc_destroyWeak(&v13);
  objc_destroyWeak(&v12);
  objc_destroyWeak(&from);
  objc_destroyWeak(&location);

  return v6;
}

void __40__SKUITemplateLoader__operationWithURL___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  id v8 = objc_loadWeakRetained((id *)(a1 + 40));
  v12[0] = MEMORY[0x1E4F143A8];
  v12[1] = 3221225472;
  v12[2] = __40__SKUITemplateLoader__operationWithURL___block_invoke_2;
  v12[3] = &unk_1E6423618;
  id v13 = v6;
  id v14 = v5;
  id v15 = WeakRetained;
  id v16 = v8;
  id v9 = v8;
  id v10 = v5;
  id v11 = v6;
  dispatch_async(MEMORY[0x1E4F14428], v12);
}

uint64_t __40__SKUITemplateLoader__operationWithURL___block_invoke_2(uint64_t a1)
{
  if (*(void *)(a1 + 32)) {
    return objc_msgSend(*(id *)(a1 + 48), "_operation:didFailWithError:", *(void *)(a1 + 56));
  }
  uint64_t v2 = *(void *)(a1 + 40);
  if (!v2) {
    return objc_msgSend(*(id *)(a1 + 48), "_operation:didFailWithError:", *(void *)(a1 + 56));
  }
  else {
    return [*(id *)(a1 + 48) _operation:*(void *)(a1 + 56) didCompleteWithOutput:v2];
  }
}

- (void)_operation:(id)a3 didCompleteWithOutput:(id)a4
{
  id v6 = a3;
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __55__SKUITemplateLoader__operation_didCompleteWithOutput___block_invoke;
  v10[3] = &unk_1E6427818;
  id v11 = v6;
  id v7 = v6;
  id v8 = a4;
  +[SKUIMetricsAppLaunchEvent withPendingLaunchEvent:v10];
  id v9 = [(SKUITemplateLoader *)self templateStrings];
  [v9 addEntriesFromDictionary:v8];

  [(SKUITemplateLoader *)self _operationDidFinish:v7];
}

void __55__SKUITemplateLoader__operation_didCompleteWithOutput___block_invoke(uint64_t a1, void *a2)
{
  id v7 = a2;
  v3 = [*(id *)(a1 + 32) metricsPageEvent];
  if (v3)
  {
    id v4 = objc_alloc_init(SKUIMetricsTemplateLoad);
    [v3 requestStartTime];
    -[SKUIMetricsTemplateLoad setRequestStartTime:](v4, "setRequestStartTime:");
    [v3 responseStartTime];
    -[SKUIMetricsTemplateLoad setResponseStartTime:](v4, "setResponseStartTime:");
    [v3 responseEndTime];
    -[SKUIMetricsTemplateLoad setResponseEndTime:](v4, "setResponseEndTime:");
    -[SKUIMetricsTemplateLoad setResponseWasCached:](v4, "setResponseWasCached:", [v3 isCachedResponse]);
    id v5 = [*(id *)(a1 + 32) URLRequest];
    id v6 = [v5 URL];
    [v7 addTemplateLoadTimingMetric:v4 forURL:v6];
  }
}

- (void)_operation:(id)a3 didFailWithError:(id)a4
{
  id v6 = a4;
  id v8 = a3;
  id v7 = [(SKUITemplateLoader *)self errors];
  [v7 addObject:v6];

  [(SKUITemplateLoader *)self _operationDidFinish:v8];
}

- (void)_operationDidFinish:(id)a3
{
  v16[1] = *MEMORY[0x1E4F143B8];
  [(SKUITemplateLoader *)self setPendingOperationCount:[(SKUITemplateLoader *)self pendingOperationCount] - 1];
  if (![(SKUITemplateLoader *)self pendingOperationCount])
  {
    id v4 = [(SKUITemplateLoader *)self errors];
    uint64_t v5 = [v4 count];

    id v6 = [(SKUITemplateLoader *)self errors];
    id v7 = v6;
    if (v5 == 1)
    {
      id v8 = [v6 firstObject];
    }
    else
    {
      unint64_t v9 = [v6 count];

      if (v9 < 2)
      {
        id v8 = 0;
        goto LABEL_8;
      }
      id v10 = (void *)MEMORY[0x1E4F28C58];
      id v15 = @"SKUITemplateLoaderErrorUnderlyingErrorsKey";
      id v7 = [(SKUITemplateLoader *)self errors];
      v16[0] = v7;
      id v11 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v16 forKeys:&v15 count:1];
      id v8 = [v10 errorWithDomain:@"SKUITemplateLoaderErrorDomain" code:561278320 userInfo:v11];
    }
LABEL_8:
    id v12 = [(SKUITemplateLoader *)self completionBlock];
    id v13 = [(SKUITemplateLoader *)self templateStrings];
    ((void (**)(void, void *, void *))v12)[2](v12, v13, v8);

    retainSelf = self->_retainSelf;
    self->_retainSelf = 0;
  }
}

- (void)load
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  id v3 = objc_alloc(MEMORY[0x1E4F1CA48]);
  id v4 = [(SKUITemplateLoader *)self URLs];
  uint64_t v5 = objc_msgSend(v3, "initWithCapacity:", objc_msgSend(v4, "count"));

  long long v15 = 0u;
  long long v16 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  id v6 = [(SKUITemplateLoader *)self URLs];
  uint64_t v7 = [v6 countByEnumeratingWithState:&v13 objects:v17 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v9 = *(void *)v14;
    do
    {
      uint64_t v10 = 0;
      do
      {
        if (*(void *)v14 != v9) {
          objc_enumerationMutation(v6);
        }
        id v11 = [(SKUITemplateLoader *)self _operationWithURL:*(void *)(*((void *)&v13 + 1) + 8 * v10)];
        [v5 addObject:v11];

        ++v10;
      }
      while (v8 != v10);
      uint64_t v8 = [v6 countByEnumeratingWithState:&v13 objects:v17 count:16];
    }
    while (v8);
  }

  -[SKUITemplateLoader setPendingOperationCount:](self, "setPendingOperationCount:", [v5 count]);
  id v12 = [(SKUITemplateLoader *)self operationQueue];
  [v12 addOperations:v5 waitUntilFinished:0];

  objc_storeStrong((id *)&self->_retainSelf, self);
}

- (NSArray)URLs
{
  return self->_URLs;
}

- (id)completionBlock
{
  return self->_completionBlock;
}

- (NSOperationQueue)operationQueue
{
  return self->_operationQueue;
}

- (NSRegularExpression)templateParsingRegularExpression
{
  return self->_templateParsingRegularExpression;
}

- (NSMutableArray)errors
{
  return self->_errors;
}

- (NSMutableDictionary)templateStrings
{
  return self->_templateStrings;
}

- (int64_t)pendingOperationCount
{
  return self->_pendingOperationCount;
}

- (void)setPendingOperationCount:(int64_t)a3
{
  self->_pendingOperationCount = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_templateStrings, 0);
  objc_storeStrong((id *)&self->_errors, 0);
  objc_storeStrong((id *)&self->_templateParsingRegularExpression, 0);
  objc_storeStrong((id *)&self->_operationQueue, 0);
  objc_storeStrong(&self->_completionBlock, 0);
  objc_storeStrong((id *)&self->_URLs, 0);

  objc_storeStrong((id *)&self->_retainSelf, 0);
}

- (void)initWithURLs:(uint64_t)a3 completionBlock:(uint64_t)a4 .cold.1(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

@end