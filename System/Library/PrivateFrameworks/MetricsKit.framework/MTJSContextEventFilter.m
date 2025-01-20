@interface MTJSContextEventFilter
- (JSContext)jsContext;
- (MTJSContextEventFilter)initWithJSContext:(id)a3 functionName:(id)a4 operationQueue:(id)a5;
- (MTJSContextEventFilter)initWithScript:(id)a3 functionName:(id)a4 operationQueue:(id)a5;
- (NSError)lastError;
- (NSOperationQueue)operationQueue;
- (NSString)functionName;
- (NSString)script;
- (id)apply:(id)a3;
- (void)_applyFilter:(id)a3 promise:(id)a4;
- (void)setFunctionName:(id)a3;
- (void)setJsContext:(id)a3;
- (void)setLastError:(id)a3;
- (void)setOperationQueue:(id)a3;
- (void)setScript:(id)a3;
@end

@implementation MTJSContextEventFilter

- (MTJSContextEventFilter)initWithScript:(id)a3 functionName:(id)a4 operationQueue:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  v14.receiver = self;
  v14.super_class = (Class)MTJSContextEventFilter;
  v11 = [(MTJSContextEventFilter *)&v14 init];
  v12 = v11;
  if (v11)
  {
    [(MTJSContextEventFilter *)v11 setScript:v8];
    [(MTJSContextEventFilter *)v12 setFunctionName:v9];
    [(MTJSContextEventFilter *)v12 setOperationQueue:v10];
  }

  return v12;
}

- (MTJSContextEventFilter)initWithJSContext:(id)a3 functionName:(id)a4 operationQueue:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  v14.receiver = self;
  v14.super_class = (Class)MTJSContextEventFilter;
  v11 = [(MTJSContextEventFilter *)&v14 init];
  v12 = v11;
  if (v11)
  {
    [(MTJSContextEventFilter *)v11 setJsContext:v8];
    [(MTJSContextEventFilter *)v12 setFunctionName:v9];
    [(MTJSContextEventFilter *)v12 setOperationQueue:v10];
  }

  return v12;
}

- (JSContext)jsContext
{
  jsContext = self->_jsContext;
  if (!jsContext)
  {
    v4 = (JSContext *)objc_alloc_init(MEMORY[0x263F10380]);
    v5 = self->_jsContext;
    self->_jsContext = v4;

    objc_initWeak(&location, self);
    v6 = self->_jsContext;
    uint64_t v15 = MEMORY[0x263EF8330];
    uint64_t v16 = 3221225472;
    v17 = __35__MTJSContextEventFilter_jsContext__block_invoke;
    v18 = &unk_2643110B8;
    objc_copyWeak(&v19, &location);
    [(JSContext *)v6 setExceptionHandler:&v15];
    id v7 = [(JSContext *)self->_jsContext evaluateScript:@"var console = {}", v15, v16, v17, v18];
    id v8 = [(JSContext *)self->_jsContext objectForKeyedSubscript:@"console"];
    [v8 setObject:&__block_literal_global_24 forKeyedSubscript:@"warn"];
    id v9 = [(JSContext *)self->_jsContext objectForKeyedSubscript:@"console"];
    [v9 setObject:&__block_literal_global_24 forKeyedSubscript:@"error"];
    id v10 = [(JSContext *)self->_jsContext objectForKeyedSubscript:@"console"];
    [v10 setObject:&__block_literal_global_24 forKeyedSubscript:@"log"];

    v11 = self->_jsContext;
    v12 = [(MTJSContextEventFilter *)self script];
    id v13 = [(JSContext *)v11 evaluateScript:v12];

    objc_destroyWeak(&v19);
    objc_destroyWeak(&location);
    jsContext = self->_jsContext;
  }

  return jsContext;
}

void __35__MTJSContextEventFilter_jsContext__block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  uint64_t v16 = *MEMORY[0x263EF8340];
  id v4 = a3;
  v11 = MTError(200, @"JS Exception: %@", v5, v6, v7, v8, v9, v10, (uint64_t)v4);
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained setLastError:v11];

  id v13 = MTMetricsKitOSLog();
  if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 138412290;
    id v15 = v4;
    _os_log_impl(&dword_218211000, v13, OS_LOG_TYPE_ERROR, "MetricsKit: MTJSContextBridge error: %@", buf, 0xCu);
  }
}

void __35__MTJSContextEventFilter_jsContext__block_invoke_5(uint64_t a1, void *a2)
{
  uint64_t v6 = *MEMORY[0x263EF8340];
  id v2 = a2;
  v3 = MTMetricsKitOSLog();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG))
  {
    int v4 = 138412290;
    id v5 = v2;
    _os_log_impl(&dword_218211000, v3, OS_LOG_TYPE_DEBUG, "MetricsKit: JSContext console: %@", (uint8_t *)&v4, 0xCu);
  }
}

- (void)_applyFilter:(id)a3 promise:(id)a4
{
  v48[1] = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v7 = a4;
  uint64_t v8 = [(MTJSContextEventFilter *)self jsContext];
  uint64_t v9 = [(MTJSContextEventFilter *)self functionName];
  uint64_t v10 = [v8 objectForKeyedSubscript:v9];

  if ([v10 isObject])
  {
    v48[0] = v6;
    v11 = [MEMORY[0x263EFF8C0] arrayWithObjects:v48 count:1];
    v12 = [v10 callWithArguments:v11];

    if ([v12 isNull])
    {
      id v13 = [(MTJSContextEventFilter *)self functionName];
      v20 = MTError(301, @"The JS function \"%@\" returned a null value.", v14, v15, v16, v17, v18, v19, (uint64_t)v13);

      [v7 finishWithError:v20];
    }
    else
    {
      v29 = [v12 toDictionary];
      v20 = v29;
      if (v29)
      {
        if ([v29 count])
        {
          [v7 finishWithResult:v20];
        }
        else
        {
          v33 = [(MTJSContextEventFilter *)self functionName];
          v40 = MTError(301, @"The JS function \"%@\" returned an empty object.", v34, v35, v36, v37, v38, v39, (uint64_t)v33);

          [v7 finishWithError:v40];
        }
      }
      else
      {
        v30 = [(MTJSContextEventFilter *)self lastError];
        v31 = v30;
        if (v30)
        {
          id v32 = v30;
        }
        else
        {
          v41 = [(MTJSContextEventFilter *)self functionName];
          MTError(200, @"The JS context failed in function named \"%@\".", v42, v43, v44, v45, v46, v47, (uint64_t)v41);
          id v32 = (id)objc_claimAutoreleasedReturnValue();
        }
        [v7 finishWithError:v32];
      }
    }
  }
  else
  {
    v21 = [(MTJSContextEventFilter *)self functionName];
    v28 = MTError(200, @"The JS context doesn't have any global function named \"%@\".", v22, v23, v24, v25, v26, v27, (uint64_t)v21);

    [v7 finishWithError:v28];
  }
}

- (id)apply:(id)a3
{
  v5[0] = MEMORY[0x263EF8330];
  v5[1] = 3221225472;
  v5[2] = __32__MTJSContextEventFilter_apply___block_invoke;
  v5[3] = &unk_26430F898;
  v5[4] = self;
  v3 = [a3 thenWithBlock:v5];

  return v3;
}

id __32__MTJSContextEventFilter_apply___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  int v4 = objc_opt_new();
  id v5 = [*(id *)(a1 + 32) operationQueue];

  id v6 = *(void **)(a1 + 32);
  if (v5)
  {
    id v7 = [v6 operationQueue];
    v9[0] = MEMORY[0x263EF8330];
    v9[1] = 3221225472;
    v9[2] = __32__MTJSContextEventFilter_apply___block_invoke_2;
    v9[3] = &unk_26430FD40;
    v9[4] = *(void *)(a1 + 32);
    id v10 = v3;
    id v11 = v4;
    [v7 addOperationWithBlock:v9];
  }
  else
  {
    [v6 _applyFilter:v3 promise:v4];
  }

  return v4;
}

uint64_t __32__MTJSContextEventFilter_apply___block_invoke_2(uint64_t a1)
{
  return [*(id *)(a1 + 32) _applyFilter:*(void *)(a1 + 40) promise:*(void *)(a1 + 48)];
}

- (NSString)script
{
  return self->_script;
}

- (void)setScript:(id)a3
{
}

- (NSString)functionName
{
  return self->_functionName;
}

- (void)setFunctionName:(id)a3
{
}

- (void)setJsContext:(id)a3
{
}

- (NSError)lastError
{
  return self->_lastError;
}

- (void)setLastError:(id)a3
{
}

- (NSOperationQueue)operationQueue
{
  return self->_operationQueue;
}

- (void)setOperationQueue:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_operationQueue, 0);
  objc_storeStrong((id *)&self->_lastError, 0);
  objc_storeStrong((id *)&self->_jsContext, 0);
  objc_storeStrong((id *)&self->_functionName, 0);

  objc_storeStrong((id *)&self->_script, 0);
}

@end