@interface SUUITemplateLoader
- (NSArray)URLs;
- (NSMutableArray)errors;
- (NSMutableDictionary)templateStrings;
- (NSOperationQueue)operationQueue;
- (NSRegularExpression)templateParsingRegularExpression;
- (SUUITemplateLoader)initWithURLs:(id)a3 completionBlock:(id)a4;
- (id)_operationWithURL:(id)a3;
- (id)completionBlock;
- (int64_t)pendingOperationCount;
- (void)_operation:(id)a3 didCompleteWithOutput:(id)a4;
- (void)_operation:(id)a3 didFailWithError:(id)a4;
- (void)_operationDidFinish:(id)a3;
- (void)load;
- (void)setPendingOperationCount:(int64_t)a3;
@end

@implementation SUUITemplateLoader

- (SUUITemplateLoader)initWithURLs:(id)a3 completionBlock:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v22.receiver = self;
  v22.super_class = (Class)SUUITemplateLoader;
  v8 = [(SUUITemplateLoader *)&v22 init];
  if (v8)
  {
    uint64_t v9 = [v6 copy];
    URLs = v8->_URLs;
    v8->_URLs = (NSArray *)v9;

    uint64_t v11 = [v7 copy];
    id completionBlock = v8->_completionBlock;
    v8->_id completionBlock = (id)v11;

    v13 = (NSOperationQueue *)objc_alloc_init(MEMORY[0x263F08A48]);
    operationQueue = v8->_operationQueue;
    v8->_operationQueue = v13;

    [(NSOperationQueue *)v8->_operationQueue setName:@"com.apple.StoreKit.SUUITemplateLoader"];
    [(NSOperationQueue *)v8->_operationQueue setMaxConcurrentOperationCount:4];
    uint64_t v15 = +[SUUITemplateParsingDataProvider templateParsingRegularExpression];
    templateParsingRegularExpression = v8->_templateParsingRegularExpression;
    v8->_templateParsingRegularExpression = (NSRegularExpression *)v15;

    v17 = (NSMutableArray *)objc_alloc_init(MEMORY[0x263EFF980]);
    errors = v8->_errors;
    v8->_errors = v17;

    v19 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x263EFF9A0]);
    templateStrings = v8->_templateStrings;
    v8->_templateStrings = v19;
  }
  return v8;
}

- (id)_operationWithURL:(id)a3
{
  id v4 = a3;
  v5 = (void *)[objc_alloc(MEMORY[0x263F7B290]) initWithURL:v4];
  [v5 setAllowedRetryCount:1];
  id v6 = (void *)[objc_alloc(MEMORY[0x263F7B3A0]) initWithURLRequestProperties:v5];
  [v6 setRecordsMetrics:1];
  [v6 setITunesStoreRequest:1];
  id v7 = [SUUITemplateParsingDataProvider alloc];
  v8 = [(SUUITemplateLoader *)self templateParsingRegularExpression];
  uint64_t v9 = [(SUUITemplateParsingDataProvider *)v7 initWithRegularExpression:v8];
  [v6 setDataConsumer:v9];

  objc_initWeak(&location, self);
  objc_initWeak(&from, v6);
  v11[0] = MEMORY[0x263EF8330];
  v11[1] = 3221225472;
  v11[2] = __40__SUUITemplateLoader__operationWithURL___block_invoke;
  v11[3] = &unk_265408CF0;
  objc_copyWeak(&v12, &location);
  objc_copyWeak(&v13, &from);
  [v6 setOutputBlock:v11];
  objc_destroyWeak(&v13);
  objc_destroyWeak(&v12);
  objc_destroyWeak(&from);
  objc_destroyWeak(&location);

  return v6;
}

void __40__SUUITemplateLoader__operationWithURL___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  id v8 = objc_loadWeakRetained((id *)(a1 + 40));
  v12[0] = MEMORY[0x263EF8330];
  v12[1] = 3221225472;
  v12[2] = __40__SUUITemplateLoader__operationWithURL___block_invoke_2;
  v12[3] = &unk_265401E78;
  id v13 = v6;
  id v14 = v5;
  id v15 = WeakRetained;
  id v16 = v8;
  id v9 = v8;
  id v10 = v5;
  id v11 = v6;
  dispatch_async(MEMORY[0x263EF83A0], v12);
}

uint64_t __40__SUUITemplateLoader__operationWithURL___block_invoke_2(uint64_t a1)
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
  v10[0] = MEMORY[0x263EF8330];
  v10[1] = 3221225472;
  v10[2] = __55__SUUITemplateLoader__operation_didCompleteWithOutput___block_invoke;
  v10[3] = &unk_265408D18;
  id v11 = v6;
  id v7 = v6;
  id v8 = a4;
  +[SUUIMetricsAppLaunchEvent withPendingLaunchEvent:v10];
  id v9 = [(SUUITemplateLoader *)self templateStrings];
  [v9 addEntriesFromDictionary:v8];

  [(SUUITemplateLoader *)self _operationDidFinish:v7];
}

void __55__SUUITemplateLoader__operation_didCompleteWithOutput___block_invoke(uint64_t a1, void *a2)
{
  id v7 = a2;
  v3 = [*(id *)(a1 + 32) metricsPageEvent];
  if (v3)
  {
    id v4 = objc_alloc_init(SUUIMetricsTemplateLoad);
    [v3 requestStartTime];
    -[SUUIMetricsTemplateLoad setRequestStartTime:](v4, "setRequestStartTime:");
    [v3 responseStartTime];
    -[SUUIMetricsTemplateLoad setResponseStartTime:](v4, "setResponseStartTime:");
    [v3 responseEndTime];
    -[SUUIMetricsTemplateLoad setResponseEndTime:](v4, "setResponseEndTime:");
    -[SUUIMetricsTemplateLoad setResponseWasCached:](v4, "setResponseWasCached:", [v3 isCachedResponse]);
    id v5 = [*(id *)(a1 + 32) URLRequest];
    id v6 = [v5 URL];
    [v7 addTemplateLoadTimingMetric:v4 forURL:v6];
  }
}

- (void)_operation:(id)a3 didFailWithError:(id)a4
{
  id v6 = a4;
  id v8 = a3;
  id v7 = [(SUUITemplateLoader *)self errors];
  [v7 addObject:v6];

  [(SUUITemplateLoader *)self _operationDidFinish:v8];
}

- (void)_operationDidFinish:(id)a3
{
  v16[1] = *MEMORY[0x263EF8340];
  [(SUUITemplateLoader *)self setPendingOperationCount:[(SUUITemplateLoader *)self pendingOperationCount] - 1];
  if (![(SUUITemplateLoader *)self pendingOperationCount])
  {
    id v4 = [(SUUITemplateLoader *)self errors];
    uint64_t v5 = [v4 count];

    id v6 = [(SUUITemplateLoader *)self errors];
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
      id v10 = (void *)MEMORY[0x263F087E8];
      id v15 = @"SUUITemplateLoaderErrorUnderlyingErrorsKey";
      id v7 = [(SUUITemplateLoader *)self errors];
      v16[0] = v7;
      id v11 = [NSDictionary dictionaryWithObjects:v16 forKeys:&v15 count:1];
      id v8 = [v10 errorWithDomain:@"SUUITemplateLoaderErrorDomain" code:561278320 userInfo:v11];
    }
LABEL_8:
    id v12 = [(SUUITemplateLoader *)self completionBlock];
    id v13 = [(SUUITemplateLoader *)self templateStrings];
    ((void (**)(void, void *, void *))v12)[2](v12, v13, v8);

    retainSelf = self->_retainSelf;
    self->_retainSelf = 0;
  }
}

- (void)load
{
  uint64_t v20 = *MEMORY[0x263EF8340];
  if ([(SUUITemplateLoader *)self pendingOperationCount])
  {
    id v14 = [MEMORY[0x263F08690] currentHandler];
    [v14 handleFailureInMethod:a2 object:self file:@"SUUITemplateLoader.m" lineNumber:193 description:@"load called more than once"];
  }
  id v4 = objc_alloc(MEMORY[0x263EFF980]);
  uint64_t v5 = [(SUUITemplateLoader *)self URLs];
  id v6 = objc_msgSend(v4, "initWithCapacity:", objc_msgSend(v5, "count"));

  long long v17 = 0u;
  long long v18 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  id v7 = [(SUUITemplateLoader *)self URLs];
  uint64_t v8 = [v7 countByEnumeratingWithState:&v15 objects:v19 count:16];
  if (v8)
  {
    uint64_t v9 = v8;
    uint64_t v10 = *(void *)v16;
    do
    {
      uint64_t v11 = 0;
      do
      {
        if (*(void *)v16 != v10) {
          objc_enumerationMutation(v7);
        }
        id v12 = [(SUUITemplateLoader *)self _operationWithURL:*(void *)(*((void *)&v15 + 1) + 8 * v11)];
        [v6 addObject:v12];

        ++v11;
      }
      while (v9 != v11);
      uint64_t v9 = [v7 countByEnumeratingWithState:&v15 objects:v19 count:16];
    }
    while (v9);
  }

  -[SUUITemplateLoader setPendingOperationCount:](self, "setPendingOperationCount:", [v6 count]);
  id v13 = [(SUUITemplateLoader *)self operationQueue];
  [v13 addOperations:v6 waitUntilFinished:0];

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

@end