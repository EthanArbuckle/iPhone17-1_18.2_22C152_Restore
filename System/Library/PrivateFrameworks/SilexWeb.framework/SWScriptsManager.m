@interface SWScriptsManager
- (BOOL)readyToExecuteScripts;
- (NSMutableArray)queuedExecutableScripts;
- (NSMutableDictionary)scripts;
- (SWLogger)logger;
- (SWScriptsManager)initWithWebView:(id)a3 documentStateProvider:(id)a4 logger:(id)a5;
- (WKWebView)webView;
- (void)_pauseScriptExecution;
- (void)_resumeScriptExecution;
- (void)addScript:(id)a3;
- (void)executeQueuedScripts;
- (void)executeScript:(id)a3 completion:(id)a4;
- (void)queueExecutableScript:(id)a3 scriptExecutionCompletion:(id)a4;
- (void)removeAllScripts;
- (void)removeScript:(id)a3;
- (void)removeScriptByIdentifier:(id)a3;
- (void)setReadyToExecuteScripts:(BOOL)a3;
@end

@implementation SWScriptsManager

- (SWScriptsManager)initWithWebView:(id)a3 documentStateProvider:(id)a4 logger:(id)a5
{
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  v26.receiver = self;
  v26.super_class = (Class)SWScriptsManager;
  v12 = [(SWScriptsManager *)&v26 init];
  v13 = v12;
  if (v12)
  {
    objc_storeStrong((id *)&v12->_webView, a3);
    objc_storeStrong((id *)&v13->_logger, a5);
    uint64_t v14 = [MEMORY[0x263EFF980] array];
    queuedExecutableScripts = v13->_queuedExecutableScripts;
    v13->_queuedExecutableScripts = (NSMutableArray *)v14;

    v16 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x263EFF9A0]);
    scripts = v13->_scripts;
    v13->_scripts = v16;

    objc_initWeak(&location, v13);
    v23[0] = MEMORY[0x263EF8330];
    v23[1] = 3221225472;
    v23[2] = __65__SWScriptsManager_initWithWebView_documentStateProvider_logger___block_invoke;
    v23[3] = &unk_2646FF9C0;
    objc_copyWeak(&v24, &location);
    [v10 onUnload:v23];
    v21[0] = MEMORY[0x263EF8330];
    v21[1] = 3221225472;
    v21[2] = __65__SWScriptsManager_initWithWebView_documentStateProvider_logger___block_invoke_2;
    v21[3] = &unk_2646FF9C0;
    objc_copyWeak(&v22, &location);
    [v10 onLoad:v21];
    v19[0] = MEMORY[0x263EF8330];
    v19[1] = 3221225472;
    v19[2] = __65__SWScriptsManager_initWithWebView_documentStateProvider_logger___block_invoke_3;
    v19[3] = &unk_2646FF9C0;
    objc_copyWeak(&v20, &location);
    [v10 onReady:v19];
    objc_destroyWeak(&v20);
    objc_destroyWeak(&v22);
    objc_destroyWeak(&v24);
    objc_destroyWeak(&location);
  }

  return v13;
}

void __65__SWScriptsManager_initWithWebView_documentStateProvider_logger___block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained _pauseScriptExecution];
}

void __65__SWScriptsManager_initWithWebView_documentStateProvider_logger___block_invoke_2(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained _pauseScriptExecution];
}

void __65__SWScriptsManager_initWithWebView_documentStateProvider_logger___block_invoke_3(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained _resumeScriptExecution];
}

- (void)addScript:(id)a3
{
  id v11 = a3;
  v4 = [v11 userScript];

  if (v4)
  {
    v5 = [(SWScriptsManager *)self scripts];
    v6 = [v11 identifier];
    [v5 setObject:v11 forKey:v6];

    v7 = [(SWScriptsManager *)self webView];
    v8 = [v7 configuration];
    id v9 = [v8 userContentController];
    id v10 = [v11 userScript];
    [v9 addUserScript:v10];
  }
}

- (void)removeAllScripts
{
  v3 = [(SWScriptsManager *)self scripts];
  [v3 removeAllObjects];

  id v6 = [(SWScriptsManager *)self webView];
  v4 = [v6 configuration];
  v5 = [v4 userContentController];
  [v5 removeAllUserScripts];
}

- (void)removeScript:(id)a3
{
  id v11 = a3;
  v4 = [v11 userScript];

  if (v4)
  {
    v5 = [(SWScriptsManager *)self scripts];
    id v6 = [v11 identifier];
    [v5 removeObjectForKey:v6];

    v7 = [(SWScriptsManager *)self webView];
    v8 = [v7 configuration];
    id v9 = [v8 userContentController];
    id v10 = [v11 userScript];
    [v9 _removeUserScript:v10];
  }
}

- (void)removeScriptByIdentifier:(id)a3
{
  id v4 = a3;
  v5 = [(SWScriptsManager *)self scripts];
  id v7 = [v5 objectForKey:v4];

  id v6 = v7;
  if (v7)
  {
    [(SWScriptsManager *)self removeScript:v7];
    id v6 = v7;
  }
}

- (void)_pauseScriptExecution
{
}

- (void)_resumeScriptExecution
{
  [(SWScriptsManager *)self setReadyToExecuteScripts:1];
  [(SWScriptsManager *)self executeQueuedScripts];
}

- (void)executeScript:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v8 = [v6 executableScript];
  if (v8)
  {
    BOOL v9 = [(SWScriptsManager *)self readyToExecuteScripts];
    id v10 = [(SWScriptsManager *)self logger];
    id v11 = NSString;
    uint64_t v12 = [v6 identifier];
    v13 = (void *)v12;
    if (v9)
    {
      uint64_t v14 = (objc_class *)objc_opt_class();
      v15 = NSStringFromClass(v14);
      objc_msgSend(v11, "stringWithFormat:", @"Script: Executing script with identifier: %@; script: %@",
        v13,
      v16 = v15);
      [v10 log:v16];

      v17 = [(SWScriptsManager *)self webView];
      v19[0] = MEMORY[0x263EF8330];
      v19[1] = 3221225472;
      v19[2] = __45__SWScriptsManager_executeScript_completion___block_invoke;
      v19[3] = &unk_2647001B8;
      void v19[4] = self;
      id v20 = v6;
      id v21 = v8;
      id v22 = v7;
      [v17 evaluateJavaScript:v21 completionHandler:v19];
    }
    else
    {
      v18 = [v11 stringWithFormat:@"Script: Queuing script with identifier: %@", v12];
      [v10 log:v18];

      [(SWScriptsManager *)self queueExecutableScript:v6 scriptExecutionCompletion:v7];
    }
  }
}

void __45__SWScriptsManager_executeScript_completion___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  if (v6)
  {
    id v7 = [*(id *)(a1 + 32) logger];
    v8 = NSString;
    BOOL v9 = [v6 localizedDescription];
    id v10 = (objc_class *)objc_opt_class();
    id v11 = NSStringFromClass(v10);
    objc_msgSend(v8, "stringWithFormat:", @"Failed to evaluate JavaScript with error: %@; script class=%@; script=%@",
      v9,
      v11,
    uint64_t v12 = *(void *)(a1 + 48));
    [v7 logError:v12];
  }
  if (*(void *)(a1 + 56))
  {
    v13 = [*(id *)(a1 + 32) webView];
    v14[0] = MEMORY[0x263EF8330];
    v14[1] = 3221225472;
    v14[2] = __45__SWScriptsManager_executeScript_completion___block_invoke_2;
    v14[3] = &unk_2646FFAE8;
    id v15 = *(id *)(a1 + 56);
    [v13 _doAfterNextPresentationUpdate:v14];
  }
}

uint64_t __45__SWScriptsManager_executeScript_completion___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)queueExecutableScript:(id)a3 scriptExecutionCompletion:(id)a4
{
  uint64_t v29 = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v7 = (void (**)(void))a4;
  if (([v6 queueable] & 1) == 0)
  {
    id v22 = v7;
    v23 = self;
    long long v26 = 0u;
    long long v27 = 0u;
    long long v24 = 0u;
    long long v25 = 0u;
    v8 = [(SWScriptsManager *)self queuedExecutableScripts];
    BOOL v9 = (void *)[v8 copy];

    uint64_t v10 = [v9 countByEnumeratingWithState:&v24 objects:v28 count:16];
    if (v10)
    {
      uint64_t v11 = v10;
      uint64_t v12 = *(void *)v25;
      do
      {
        uint64_t v13 = 0;
        do
        {
          if (*(void *)v25 != v12) {
            objc_enumerationMutation(v9);
          }
          uint64_t v14 = *(void **)(*((void *)&v24 + 1) + 8 * v13);
          id v15 = [v6 identifier];
          v16 = [v14 script];
          v17 = [v16 identifier];
          int v18 = [v15 isEqualToString:v17];

          if (v18)
          {
            v19 = [(SWScriptsManager *)v23 queuedExecutableScripts];
            [v19 removeObject:v14];
          }
          ++v13;
        }
        while (v11 != v13);
        uint64_t v11 = [v9 countByEnumeratingWithState:&v24 objects:v28 count:16];
      }
      while (v11);
    }

    id v7 = v22;
    self = v23;
    if (v22) {
      v22[2](v22);
    }
  }
  id v20 = [[SWQueueableScriptWithCompletion alloc] initWithScript:v6 completion:v7];
  id v21 = [(SWScriptsManager *)self queuedExecutableScripts];
  [v21 addObject:v20];
}

- (void)executeQueuedScripts
{
  uint64_t v18 = *MEMORY[0x263EF8340];
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  v3 = [(SWScriptsManager *)self queuedExecutableScripts];
  id v4 = (void *)[v3 copy];

  uint64_t v5 = [v4 countByEnumeratingWithState:&v13 objects:v17 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v14;
    do
    {
      for (uint64_t i = 0; i != v6; ++i)
      {
        if (*(void *)v14 != v7) {
          objc_enumerationMutation(v4);
        }
        BOOL v9 = *(void **)(*((void *)&v13 + 1) + 8 * i);
        uint64_t v10 = [v9 script];
        uint64_t v11 = [v9 completion];
        [(SWScriptsManager *)self executeScript:v10 completion:v11];
      }
      uint64_t v6 = [v4 countByEnumeratingWithState:&v13 objects:v17 count:16];
    }
    while (v6);
  }

  uint64_t v12 = [(SWScriptsManager *)self queuedExecutableScripts];
  [v12 removeAllObjects];
}

- (WKWebView)webView
{
  return self->_webView;
}

- (SWLogger)logger
{
  return self->_logger;
}

- (NSMutableArray)queuedExecutableScripts
{
  return self->_queuedExecutableScripts;
}

- (BOOL)readyToExecuteScripts
{
  return self->_readyToExecuteScripts;
}

- (void)setReadyToExecuteScripts:(BOOL)a3
{
  self->_readyToExecuteScripts = a3;
}

- (NSMutableDictionary)scripts
{
  return self->_scripts;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_scripts, 0);
  objc_storeStrong((id *)&self->_queuedExecutableScripts, 0);
  objc_storeStrong((id *)&self->_logger, 0);
  objc_storeStrong((id *)&self->_webView, 0);
}

@end