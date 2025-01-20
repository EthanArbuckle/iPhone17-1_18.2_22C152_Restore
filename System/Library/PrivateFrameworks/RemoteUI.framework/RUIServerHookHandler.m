@interface RUIServerHookHandler
- (BOOL)isUserCancelError:(id)a3;
- (NSArray)serverHooks;
- (RUIServerHookHandler)initWithRemoteUIController:(id)a3;
- (RUIServerHookHandler)initWithRemoteUIController:(id)a3 hooks:(id)a4;
- (RUIServerHookHandlerDelegate)delegate;
- (id)_refreshRequestWithInfo:(id)a3 initiatingObjectModel:(id)a4 attributes:(id)a5;
- (id)_responseDataForResult:(BOOL)a3 withError:(id)a4;
- (id)currentPresenter;
- (void)_handleResponseForHook:(id)a3 success:(BOOL)a4 error:(id)a5 attributes:(id)a6 objectModel:(id)a7 completion:(id)a8;
- (void)_rebuildServerHookHandlers;
- (void)_reloadUIWithInfo:(id)a3 attributes:(id)a4 initiatingObjectModel:(id)a5 completion:(id)a6;
- (void)dismissObjectModelsAnimated:(BOOL)a3 completion:(id)a4;
- (void)processObjectModel:(id)a3 isModal:(BOOL)a4;
- (void)processObjectModel:(id)a3 isModal:(BOOL)a4 completion:(id)a5;
- (void)processServerResponse:(id)a3;
- (void)refreshWithRequest:(id)a3 completion:(id)a4;
- (void)setDelegate:(id)a3;
- (void)setServerHooks:(id)a3;
@end

@implementation RUIServerHookHandler

- (RUIServerHookHandler)initWithRemoteUIController:(id)a3
{
  return [(RUIServerHookHandler *)self initWithRemoteUIController:a3 hooks:MEMORY[0x263EFFA68]];
}

- (RUIServerHookHandler)initWithRemoteUIController:(id)a3 hooks:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v8 = [(RUIServerHookHandler *)self init];
  v9 = v8;
  if (v8)
  {
    objc_storeWeak((id *)&v8->_remoteUIController, v6);
    uint64_t v10 = [v7 copy];
    serverHooks = v9->_serverHooks;
    v9->_serverHooks = (NSArray *)v10;

    uint64_t v12 = objc_msgSend(MEMORY[0x263EFF980], "arrayWithCapacity:", -[NSArray count](v9->_serverHooks, "count"));
    hookIdentifiers = v9->_hookIdentifiers;
    v9->_hookIdentifiers = (NSMutableArray *)v12;

    [(RUIServerHookHandler *)v9 _rebuildServerHookHandlers];
  }

  return v9;
}

- (void)_rebuildServerHookHandlers
{
  uint64_t v31 = *MEMORY[0x263EF8340];
  id WeakRetained = objc_loadWeakRetained((id *)&self->_remoteUIController);
  if (_isInternalInstall())
  {
    v3 = _RUILoggingFacility();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_2144F2000, v3, OS_LOG_TYPE_DEFAULT, "Rebuilding server hook handlers", buf, 2u);
    }
  }
  if ([(NSMutableArray *)self->_hookIdentifiers count])
  {
    hookIdentifiers = self->_hookIdentifiers;
    v24[0] = MEMORY[0x263EF8330];
    v24[1] = 3221225472;
    v24[2] = __50__RUIServerHookHandler__rebuildServerHookHandlers__block_invoke;
    v24[3] = &unk_264211370;
    id v25 = WeakRetained;
    [(NSMutableArray *)hookIdentifiers enumerateObjectsUsingBlock:v24];
    [(NSMutableArray *)self->_hookIdentifiers removeAllObjects];
    if (_isInternalInstall())
    {
      v5 = _RUILoggingFacility();
      if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_2144F2000, v5, OS_LOG_TYPE_DEFAULT, "Cleared existing server hook handlers", buf, 2u);
      }
    }
  }
  objc_initWeak(&location, self);
  long long v22 = 0u;
  long long v20 = 0u;
  long long v21 = 0u;
  long long v19 = 0u;
  obj = self->_serverHooks;
  uint64_t v6 = [(NSArray *)obj countByEnumeratingWithState:&v19 objects:v30 count:16];
  if (v6)
  {
    uint64_t v8 = *(void *)v20;
    *(void *)&long long v7 = 138412546;
    long long v13 = v7;
    do
    {
      for (uint64_t i = 0; i != v6; ++i)
      {
        if (*(void *)v20 != v8) {
          objc_enumerationMutation(obj);
        }
        uint64_t v10 = *(void **)(*((void *)&v19 + 1) + 8 * i);
        objc_msgSend(v10, "setDelegate:", self, v13);
        v18[0] = MEMORY[0x263EF8330];
        v18[1] = 3221225472;
        v18[2] = __50__RUIServerHookHandler__rebuildServerHookHandlers__block_invoke_38;
        v18[3] = &unk_264211398;
        v18[4] = v10;
        v16[0] = MEMORY[0x263EF8330];
        v16[1] = 3221225472;
        v16[2] = __50__RUIServerHookHandler__rebuildServerHookHandlers__block_invoke_2;
        v16[3] = &unk_264211410;
        v16[4] = v10;
        objc_copyWeak(&v17, &location);
        v11 = [WeakRetained setHandlerForElementsMatching:v18 handler:v16];
        [(NSMutableArray *)self->_hookIdentifiers addObject:v11];
        if (_isInternalInstall())
        {
          uint64_t v12 = _RUILoggingFacility();
          if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = v13;
            v27 = v10;
            __int16 v28 = 2112;
            v29 = v11;
            _os_log_impl(&dword_2144F2000, v12, OS_LOG_TYPE_DEFAULT, "Created a handler for hook: %@ with identifier %@", buf, 0x16u);
          }
        }
        objc_destroyWeak(&v17);
      }
      uint64_t v6 = [(NSArray *)obj countByEnumeratingWithState:&v19 objects:v30 count:16];
    }
    while (v6);
  }

  objc_destroyWeak(&location);
}

uint64_t __50__RUIServerHookHandler__rebuildServerHookHandlers__block_invoke(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 32) removeHandlerForKey:a2];
}

uint64_t __50__RUIServerHookHandler__rebuildServerHookHandlers__block_invoke_38(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 32) shouldMatchElement:a2];
}

void __50__RUIServerHookHandler__rebuildServerHookHandlers__block_invoke_2(uint64_t a1, void *a2, void *a3, void *a4)
{
  uint64_t v27 = *MEMORY[0x263EF8340];
  id v7 = a2;
  id v8 = a3;
  id v9 = a4;
  if (_isInternalInstall())
  {
    uint64_t v10 = _RUILoggingFacility();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      v11 = [v8 name];
      *(_DWORD *)buf = 138412546;
      v24 = v11;
      __int16 v25 = 2112;
      id v26 = v9;
      _os_log_impl(&dword_2144F2000, v10, OS_LOG_TYPE_DEFAULT, "Starting to process element %@ with attributes: %@", buf, 0x16u);
    }
  }
  if (objc_opt_respondsToSelector()) {
    [*(id *)(a1 + 32) setObjectModel:v7];
  }
  long long v13 = *(void **)(a1 + 32);
  uint64_t v12 = (id *)(a1 + 32);
  v17[0] = MEMORY[0x263EF8330];
  v17[1] = 3221225472;
  v17[2] = __50__RUIServerHookHandler__rebuildServerHookHandlers__block_invoke_40;
  v17[3] = &unk_2642113E8;
  id v14 = v8;
  id v18 = v14;
  objc_copyWeak(&v22, v12 + 1);
  id v19 = *v12;
  id v15 = v9;
  id v20 = v15;
  id v16 = v7;
  id v21 = v16;
  [v13 processElement:v14 attributes:v15 objectModel:v16 completion:v17];

  objc_destroyWeak(&v22);
}

void __50__RUIServerHookHandler__rebuildServerHookHandlers__block_invoke_40(uint64_t a1, uint64_t a2, void *a3)
{
  uint64_t v16 = *MEMORY[0x263EF8340];
  id v5 = a3;
  if (_isInternalInstall())
  {
    uint64_t v6 = _RUILoggingFacility();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      id v7 = [*(id *)(a1 + 32) name];
      *(_DWORD *)buf = 138412290;
      id v15 = v7;
      _os_log_impl(&dword_2144F2000, v6, OS_LOG_TYPE_DEFAULT, "Finished processing element: %@", buf, 0xCu);
    }
  }
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 64));
  if (WeakRetained)
  {
    uint64_t v9 = *(void *)(a1 + 40);
    uint64_t v10 = *(void *)(a1 + 48);
    uint64_t v11 = *(void *)(a1 + 56);
    v12[0] = MEMORY[0x263EF8330];
    v12[1] = 3221225472;
    v12[2] = __50__RUIServerHookHandler__rebuildServerHookHandlers__block_invoke_41;
    v12[3] = &unk_2642113C0;
    id v13 = *(id *)(a1 + 32);
    [WeakRetained _handleResponseForHook:v9 success:a2 error:v5 attributes:v10 objectModel:v11 completion:v12];
  }
}

void __50__RUIServerHookHandler__rebuildServerHookHandlers__block_invoke_41(uint64_t a1)
{
  uint64_t v6 = *MEMORY[0x263EF8340];
  if (_isInternalInstall())
  {
    v2 = _RUILoggingFacility();
    if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
    {
      v3 = [*(id *)(a1 + 32) name];
      int v4 = 138412290;
      id v5 = v3;
      _os_log_impl(&dword_2144F2000, v2, OS_LOG_TYPE_DEFAULT, "Finished reloading UI in response to element: %@", (uint8_t *)&v4, 0xCu);
    }
  }
}

- (void)setServerHooks:(id)a3
{
  int v4 = (NSArray *)[a3 copy];
  serverHooks = self->_serverHooks;
  self->_serverHooks = v4;

  [(RUIServerHookHandler *)self _rebuildServerHookHandlers];
}

- (void)processObjectModel:(id)a3 isModal:(BOOL)a4
{
}

- (void)_handleResponseForHook:(id)a3 success:(BOOL)a4 error:(id)a5 attributes:(id)a6 objectModel:(id)a7 completion:(id)a8
{
  BOOL v12 = a4;
  uint64_t v29 = *MEMORY[0x263EF8340];
  id v14 = a3;
  id v15 = a5;
  id v16 = a6;
  id v17 = a7;
  id v18 = a8;
  if (objc_opt_respondsToSelector())
  {
    id v19 = [v14 serverHookResponse];
  }
  else
  {
    id v19 = 0;
  }
  if (_isInternalInstall())
  {
    id v20 = _RUILoggingFacility();
    if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
    {
      id v21 = [v17 serverInfo];
      int v25 = 138412546;
      id v26 = v17;
      __int16 v27 = 2112;
      __int16 v28 = v21;
      _os_log_impl(&dword_2144F2000, v20, OS_LOG_TYPE_DEFAULT, "Attempting to reload with originating OM: %@ - %@", (uint8_t *)&v25, 0x16u);
    }
  }
  id v22 = [v19 continuationRequest];

  if (v22)
  {
    v23 = [v19 continuationRequest];
    [(RUIServerHookHandler *)self refreshWithRequest:v23 completion:v18];
  }
  else
  {
    v23 = [(RUIServerHookHandler *)self _responseDataForResult:v12 withError:v15];
    if (v19)
    {
      v24 = [v19 additionalPayload];
      if (v24) {
        [v23 addEntriesFromDictionary:v24];
      }
    }
    [(RUIServerHookHandler *)self _reloadUIWithInfo:v23 attributes:v16 initiatingObjectModel:v17 completion:v18];
  }
}

- (void)processObjectModel:(id)a3 isModal:(BOOL)a4 completion:(id)a5
{
  id v7 = a3;
  id v8 = a5;
  if (_isInternalInstall())
  {
    uint64_t v9 = _RUILoggingFacility();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_2144F2000, v9, OS_LOG_TYPE_DEFAULT, "Processing object model to detect hook handler matches...", buf, 2u);
    }
  }
  objc_initWeak(&location, self);
  *(void *)buf = 0;
  id v19 = buf;
  uint64_t v20 = 0x2020000000;
  char v21 = 0;
  serverHooks = self->_serverHooks;
  v13[0] = MEMORY[0x263EF8330];
  v13[1] = 3221225472;
  v13[2] = __62__RUIServerHookHandler_processObjectModel_isModal_completion___block_invoke;
  v13[3] = &unk_264211488;
  id v11 = v7;
  id v14 = v11;
  id v16 = buf;
  objc_copyWeak(&v17, &location);
  id v12 = v8;
  id v15 = v12;
  [(NSArray *)serverHooks enumerateObjectsUsingBlock:v13];
  if (v12 && !v19[24]) {
    (*((void (**)(id, void, void))v12 + 2))(v12, 0, 0);
  }

  objc_destroyWeak(&v17);
  _Block_object_dispose(buf, 8);
  objc_destroyWeak(&location);
}

void __62__RUIServerHookHandler_processObjectModel_isModal_completion___block_invoke(uint64_t a1, void *a2, uint64_t a3, unsigned char *a4)
{
  uint64_t v23 = *MEMORY[0x263EF8340];
  id v6 = a2;
  int v7 = [v6 shouldMatchModel:*(void *)(a1 + 32)];
  int isInternalInstall = _isInternalInstall();
  if (v7)
  {
    if (isInternalInstall)
    {
      uint64_t v9 = _RUILoggingFacility();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412290;
        id v22 = v6;
        _os_log_impl(&dword_2144F2000, v9, OS_LOG_TYPE_DEFAULT, "Matched %@, starting processing...", buf, 0xCu);
      }
    }
    *(unsigned char *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) = 1;
    if (objc_opt_respondsToSelector()) {
      [v6 setObjectModel:*(void *)(a1 + 32)];
    }
    uint64_t v10 = *(void **)(a1 + 32);
    id v11 = [v10 clientInfo];
    id v12 = [v10 elementForActivityIndicatorWithAttributes:v11];

    [v12 startActivityIndicator];
    uint64_t v13 = *(void *)(a1 + 32);
    v15[0] = MEMORY[0x263EF8330];
    v15[1] = 3221225472;
    v15[2] = __62__RUIServerHookHandler_processObjectModel_isModal_completion___block_invoke_46;
    v15[3] = &unk_264211460;
    objc_copyWeak(&v20, (id *)(a1 + 56));
    id v16 = v6;
    id v17 = *(id *)(a1 + 32);
    id v19 = *(id *)(a1 + 40);
    id v14 = v12;
    id v18 = v14;
    [v16 processObjectModel:v13 completion:v15];
    if (a4) {
      *a4 = 1;
    }

    objc_destroyWeak(&v20);
LABEL_14:

    goto LABEL_15;
  }
  if (isInternalInstall)
  {
    id v14 = _RUILoggingFacility();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      id v22 = v6;
      _os_log_impl(&dword_2144F2000, v14, OS_LOG_TYPE_DEFAULT, "Did not match, skipping %@ ...", buf, 0xCu);
    }
    goto LABEL_14;
  }
LABEL_15:
}

void __62__RUIServerHookHandler_processObjectModel_isModal_completion___block_invoke_46(uint64_t a1, uint64_t a2, void *a3)
{
  id v5 = a3;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 64));
  if (WeakRetained)
  {
    uint64_t v7 = *(void *)(a1 + 32);
    id v8 = [*(id *)(a1 + 40) clientInfo];
    uint64_t v9 = *(void *)(a1 + 40);
    v10[0] = MEMORY[0x263EF8330];
    v10[1] = 3221225472;
    v10[2] = __62__RUIServerHookHandler_processObjectModel_isModal_completion___block_invoke_2;
    v10[3] = &unk_264211438;
    id v12 = *(id *)(a1 + 56);
    id v11 = *(id *)(a1 + 48);
    [WeakRetained _handleResponseForHook:v7 success:a2 error:v5 attributes:v8 objectModel:v9 completion:v10];
  }
}

uint64_t __62__RUIServerHookHandler_processObjectModel_isModal_completion___block_invoke_2(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 40);
  if (v2) {
    (*(void (**)(void))(v2 + 16))();
  }
  v3 = *(void **)(a1 + 32);
  return [v3 stopActivityIndicator];
}

- (void)processServerResponse:(id)a3
{
  id v4 = a3;
  if (_isInternalInstall())
  {
    id v5 = _RUILoggingFacility();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_2144F2000, v5, OS_LOG_TYPE_DEFAULT, "Harvesting data from response", buf, 2u);
    }
  }
  serverHooks = self->_serverHooks;
  v8[0] = MEMORY[0x263EF8330];
  v8[1] = 3221225472;
  v8[2] = __46__RUIServerHookHandler_processServerResponse___block_invoke;
  v8[3] = &unk_2642114B0;
  id v9 = v4;
  id v7 = v4;
  [(NSArray *)serverHooks enumerateObjectsUsingBlock:v8];
}

void __46__RUIServerHookHandler_processServerResponse___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  if (objc_opt_respondsToSelector()) {
    [v3 harvestDataFromResponse:*(void *)(a1 + 32)];
  }
}

- (id)currentPresenter
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_remoteUIController);
  id v3 = [WeakRetained currentPresentationContext];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v4 = [MEMORY[0x263F82670] currentDevice];
    uint64_t v5 = [v4 userInterfaceIdiom];

    if (!v5)
    {
      if (_isInternalInstall())
      {
        id v6 = _RUILoggingFacility();
        if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
        {
          *(_WORD *)id v8 = 0;
          _os_log_impl(&dword_2144F2000, v6, OS_LOG_TYPE_DEFAULT, "RUI nav controller detected, suppressing rotation views", v8, 2u);
        }
      }
      [v3 setSupportedInterfaceOrientations:2];
    }
  }

  return v3;
}

- (void)dismissObjectModelsAnimated:(BOOL)a3 completion:(id)a4
{
  BOOL v4 = a3;
  id v8 = a4;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_remoteUIController);
  id v7 = (id)[WeakRetained dismissObjectModelsAnimated:v4 completion:v8];
}

- (BOOL)isUserCancelError:(id)a3
{
  if (!a3) {
    return 0;
  }
  id v3 = self;
  p_delegate = &self->_delegate;
  id v5 = a3;
  id WeakRetained = objc_loadWeakRetained((id *)p_delegate);
  LOBYTE(v3) = [WeakRetained serverHookHandler:v3 isUserCancelError:v5];

  return (char)v3;
}

- (id)_responseDataForResult:(BOOL)a3 withError:(id)a4
{
  BOOL v4 = a3;
  id v6 = a4;
  id v7 = [MEMORY[0x263EFF9A0] dictionary];
  id v8 = [v6 domain];

  if (v8)
  {
    id v9 = objc_msgSend(NSNumber, "numberWithInteger:", objc_msgSend(v6, "code"));
    [v7 setObject:v9 forKeyedSubscript:@"errorCode"];

    uint64_t v10 = [v6 domain];
    [v7 setObject:v10 forKeyedSubscript:@"errorDomain"];

    if ([(RUIServerHookHandler *)self isUserCancelError:v6]) {
      [v7 setObject:@"cancel" forKeyedSubscript:@"action"];
    }
  }
  if (v4) {
    id v11 = @"1";
  }
  else {
    id v11 = @"0";
  }
  [v7 setObject:v11 forKeyedSubscript:@"success"];

  return v7;
}

- (void)refreshWithRequest:(id)a3 completion:(id)a4
{
  uint64_t v15 = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v7 = a4;
  if (_isInternalInstall())
  {
    id v8 = _RUILoggingFacility();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      id v14 = v6;
      _os_log_impl(&dword_2144F2000, v8, OS_LOG_TYPE_DEFAULT, "Attempting to refresh with request: %@", buf, 0xCu);
    }
  }
  id WeakRetained = objc_loadWeakRetained((id *)&self->_remoteUIController);
  v11[0] = MEMORY[0x263EF8330];
  v11[1] = 3221225472;
  v11[2] = __54__RUIServerHookHandler_refreshWithRequest_completion___block_invoke;
  v11[3] = &unk_264211500;
  id v12 = v7;
  id v10 = v7;
  [WeakRetained loadRequest:v6 completion:v11];
}

void __54__RUIServerHookHandler_refreshWithRequest_completion___block_invoke(uint64_t a1, char a2, void *a3)
{
  uint64_t v15 = *MEMORY[0x263EF8340];
  id v5 = a3;
  if (_isInternalInstall())
  {
    id v6 = _RUILoggingFacility();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      id v14 = v5;
      _os_log_impl(&dword_2144F2000, v6, OS_LOG_TYPE_DEFAULT, "Finished loading: %@", buf, 0xCu);
    }
  }
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __54__RUIServerHookHandler_refreshWithRequest_completion___block_invoke_60;
  block[3] = &unk_2642114D8;
  id v7 = *(id *)(a1 + 32);
  char v12 = a2;
  id v10 = v5;
  id v11 = v7;
  id v8 = v5;
  dispatch_async(MEMORY[0x263EF83A0], block);
}

uint64_t __54__RUIServerHookHandler_refreshWithRequest_completion___block_invoke_60(uint64_t a1)
{
  uint64_t result = *(void *)(a1 + 40);
  if (result) {
    return (*(uint64_t (**)(uint64_t, void, void))(result + 16))(result, *(unsigned __int8 *)(a1 + 48), *(void *)(a1 + 32));
  }
  return result;
}

- (void)_reloadUIWithInfo:(id)a3 attributes:(id)a4 initiatingObjectModel:(id)a5 completion:(id)a6
{
  id v10 = a6;
  id v11 = [(RUIServerHookHandler *)self _refreshRequestWithInfo:a3 initiatingObjectModel:a5 attributes:a4];
  if (v11)
  {
    [(RUIServerHookHandler *)self refreshWithRequest:v11 completion:v10];
  }
  else
  {
    if (_isInternalInstall())
    {
      char v12 = _RUILoggingFacility();
      if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_2144F2000, v12, OS_LOG_TYPE_DEFAULT, "No refresh URL; skipping reload", buf, 2u);
      }
    }
    block[0] = MEMORY[0x263EF8330];
    block[1] = 3221225472;
    block[2] = __86__RUIServerHookHandler__reloadUIWithInfo_attributes_initiatingObjectModel_completion___block_invoke;
    block[3] = &unk_264211528;
    id v14 = v10;
    dispatch_async(MEMORY[0x263EF83A0], block);
  }
}

uint64_t __86__RUIServerHookHandler__reloadUIWithInfo_attributes_initiatingObjectModel_completion___block_invoke(uint64_t a1)
{
  uint64_t result = *(void *)(a1 + 32);
  if (result) {
    return (*(uint64_t (**)(uint64_t, uint64_t, void))(result + 16))(result, 1, 0);
  }
  return result;
}

- (id)_refreshRequestWithInfo:(id)a3 initiatingObjectModel:(id)a4 attributes:(id)a5
{
  uint64_t v25 = *MEMORY[0x263EF8340];
  id v7 = a3;
  id v8 = a4;
  id v9 = a5;
  if (_isInternalInstall())
  {
    id v10 = _RUILoggingFacility();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      int v23 = 138412290;
      id v24 = v9;
      _os_log_impl(&dword_2144F2000, v10, OS_LOG_TYPE_DEFAULT, "Refreshing server UI with attributes %@", (uint8_t *)&v23, 0xCu);
    }
  }
  id v11 = [v9 objectForKeyedSubscript:@"refreshUrl"];
  char v12 = [v9 objectForKeyedSubscript:@"refreshHttpMethod"];
  if (v11)
  {
    id v13 = objc_alloc(MEMORY[0x263F089E0]);
    id v14 = NSURL;
    uint64_t v15 = [v8 sourceURL];
    id v16 = [v14 URLWithString:v11 relativeToURL:v15];
    id v17 = (void *)[v13 initWithURL:v16];

    if ([v12 isEqualToString:@"POST"])
    {
      id v18 = (void *)[v7 mutableCopy];
      id v19 = [v8 serverInfo];
      if (v19) {
        [v18 addEntriesFromDictionary:v19];
      }
      if (_isInternalInstall())
      {
        id v20 = _RUILoggingFacility();
        if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
        {
          int v23 = 138412290;
          id v24 = v18;
          _os_log_impl(&dword_2144F2000, v20, OS_LOG_TYPE_DEFAULT, "Responding to server with info: %@", (uint8_t *)&v23, 0xCu);
        }
      }
      char v21 = [MEMORY[0x263F08AC0] dataWithPropertyList:v18 format:100 options:0 error:0];
      [v17 setHTTPBody:v21];
      [v17 setHTTPMethod:@"POST"];
      [v17 setValue:@"application/x-plist" forHTTPHeaderField:@"Content-Type"];
    }
  }
  else
  {
    id v17 = 0;
  }

  return v17;
}

- (NSArray)serverHooks
{
  return self->_serverHooks;
}

- (RUIServerHookHandlerDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  return (RUIServerHookHandlerDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_serverHooks, 0);
  objc_destroyWeak((id *)&self->_remoteUIController);
  objc_storeStrong((id *)&self->_hookIdentifiers, 0);
}

@end