@interface SWURLSchemeHandlerManager
- (NSMapTable)handlers;
- (NSMutableDictionary)factories;
- (SWLogger)logger;
- (SWURLSchemeHandlerManager)initWithConfiguration:(id)a3 logger:(id)a4;
- (WKWebViewConfiguration)configuration;
- (void)registerFactory:(id)a3 forScheme:(id)a4;
- (void)webView:(id)a3 startURLSchemeTask:(id)a4;
- (void)webView:(id)a3 stopURLSchemeTask:(id)a4;
@end

@implementation SWURLSchemeHandlerManager

- (SWURLSchemeHandlerManager)initWithConfiguration:(id)a3 logger:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v15.receiver = self;
  v15.super_class = (Class)SWURLSchemeHandlerManager;
  v8 = [(SWURLSchemeHandlerManager *)&v15 init];
  v9 = v8;
  if (v8)
  {
    objc_storeWeak((id *)&v8->_configuration, v6);
    objc_storeStrong((id *)&v9->_logger, a4);
    uint64_t v10 = [MEMORY[0x263EFF9A0] dictionary];
    factories = v9->_factories;
    v9->_factories = (NSMutableDictionary *)v10;

    uint64_t v12 = [MEMORY[0x263F08968] strongToStrongObjectsMapTable];
    handlers = v9->_handlers;
    v9->_handlers = (NSMapTable *)v12;
  }
  return v9;
}

- (void)registerFactory:(id)a3 forScheme:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  v8 = [(SWURLSchemeHandlerManager *)self factories];
  [v8 setObject:v7 forKey:v6];

  uint64_t v12 = [[SWWeakURLSchemeHandler alloc] initWithURLSchemeHandler:self];
  v9 = [(SWURLSchemeHandlerManager *)self configuration];
  [v9 setURLSchemeHandler:v12 forURLScheme:v6];

  uint64_t v10 = [(SWURLSchemeHandlerManager *)self logger];
  v11 = [NSString stringWithFormat:@"Register URL scheme handler factory %@ for scheme %@", v7, v6];

  [v10 log:v11];
}

- (void)webView:(id)a3 startURLSchemeTask:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v8 = [(SWURLSchemeHandlerManager *)self logger];
  v9 = [NSString stringWithFormat:@"Start URL scheme task with %@", v7];
  [v8 log:v9];

  uint64_t v10 = [v7 request];
  v11 = [v10 URL];
  uint64_t v12 = [v11 scheme];

  if (!v12) {
    goto LABEL_6;
  }
  v13 = [(SWURLSchemeHandlerManager *)self factories];
  v14 = [v13 objectForKey:v12];

  objc_super v15 = [(SWURLSchemeHandlerManager *)self logger];
  v16 = [NSString stringWithFormat:@"Found URL scheme handler factory %@ for task %@", v14, v7];
  [v15 log:v16];

  if (!v14) {
    goto LABEL_6;
  }
  v17 = [SWURLSchemeTask alloc];
  v18 = [(SWURLSchemeHandlerManager *)self logger];
  v19 = [(SWURLSchemeTask *)v17 initWithTask:v7 logger:v18];

  v20 = [(SWURLSchemeHandlerManager *)self logger];
  v21 = [NSString stringWithFormat:@"Created wrapping task %@ for task %@", v19, v7];
  [v20 log:v21];

  objc_initWeak(&location, self);
  uint64_t v28 = MEMORY[0x263EF8330];
  uint64_t v29 = 3221225472;
  v30 = __56__SWURLSchemeHandlerManager_webView_startURLSchemeTask___block_invoke;
  v31 = &unk_2646FFF90;
  objc_copyWeak(&v32, &location);
  [(SWURLSchemeTask *)v19 onCompletion:&v28];
  v22 = [v14 createURLSchemeHandlerWithTask:v19];
  if (!v22)
  {
    objc_destroyWeak(&v32);
    objc_destroyWeak(&location);

LABEL_6:
    v26 = [(SWURLSchemeHandlerManager *)self logger];
    v27 = [NSString stringWithFormat:@"Failed to create URL scheme handler for task %@", v7];
    [v26 logError:v27];

    v14 = [MEMORY[0x263F087E8] errorWithDomain:@"web_content" code:3 userInfo:0];
    [v7 didFailWithError:v14];
    v22 = 0;
    goto LABEL_7;
  }
  v23 = [(SWURLSchemeHandlerManager *)self logger];
  v24 = [NSString stringWithFormat:@"Created URL scheme handler %@ for task %@", v22, v7, v28, v29, v30, v31];
  [v23 log:v24];

  v25 = [(SWURLSchemeHandlerManager *)self handlers];
  [v25 setObject:v22 forKey:v7];

  [v22 start];
  objc_destroyWeak(&v32);
  objc_destroyWeak(&location);

LABEL_7:
}

void __56__SWURLSchemeHandlerManager_webView_startURLSchemeTask___block_invoke(uint64_t a1, void *a2)
{
  v2 = (id *)(a1 + 32);
  id v3 = a2;
  id WeakRetained = objc_loadWeakRetained(v2);
  v5 = [WeakRetained logger];
  id v6 = [NSString stringWithFormat:@"Received completion callback for task %@", v3];
  [v5 log:v6];

  id v7 = objc_loadWeakRetained(v2);
  v8 = [v7 handlers];
  id v14 = [v8 objectForKey:v3];

  [v14 finish];
  id v9 = objc_loadWeakRetained(v2);
  uint64_t v10 = [v9 handlers];
  [v10 removeObjectForKey:v3];

  id v11 = objc_loadWeakRetained(v2);
  uint64_t v12 = [v11 logger];
  v13 = [NSString stringWithFormat:@"Finished task handler %@ for task %@", v14, v3];

  [v12 log:v13];
}

- (void)webView:(id)a3 stopURLSchemeTask:(id)a4
{
  id v5 = a4;
  id v6 = [(SWURLSchemeHandlerManager *)self handlers];
  id v10 = [v6 objectForKey:v5];

  [v10 cancel];
  id v7 = [(SWURLSchemeHandlerManager *)self handlers];
  [v7 removeObjectForKey:v5];

  v8 = [(SWURLSchemeHandlerManager *)self logger];
  id v9 = [NSString stringWithFormat:@"Cancel URL scheme handler %@ for task %@", v10, v5];

  [v8 log:v9];
}

- (WKWebViewConfiguration)configuration
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_configuration);

  return (WKWebViewConfiguration *)WeakRetained;
}

- (SWLogger)logger
{
  return self->_logger;
}

- (NSMutableDictionary)factories
{
  return self->_factories;
}

- (NSMapTable)handlers
{
  return self->_handlers;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_handlers, 0);
  objc_storeStrong((id *)&self->_factories, 0);
  objc_storeStrong((id *)&self->_logger, 0);

  objc_destroyWeak((id *)&self->_configuration);
}

@end