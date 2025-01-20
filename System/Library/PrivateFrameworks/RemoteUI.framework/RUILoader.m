@interface RUILoader
- (BOOL)allowNonSecureHTTP;
- (BOOL)anyWebViewLoading;
- (BOOL)receivedValidResponse:(id)a3 forRequest:(id)a4;
- (NSMutableArray)pendingRefreshPageIDs;
- (RUIDecodingUserInfo)decodingUserInfo;
- (RUILoader)init;
- (RUIParserDelegate)parserDelegate;
- (RUIStyle)style;
- (id)URL;
- (id)sessionConfiguration;
- (id)urlSessionDelegate;
- (int64_t)userInterfaceStyle;
- (void)URLSession:(id)a3 didReceiveChallenge:(id)a4 completionHandler:(id)a5;
- (void)URLSession:(id)a3 task:(id)a4 willPerformHTTPRedirection:(id)a5 newRequest:(id)a6 completionHandler:(id)a7;
- (void)_finishLoadWithObjectModel:(id)a3 url:(id)a4 actionSignal:(id)a5 error:(id)a6;
- (void)_handleShouldLoadRequestResult:(id)a3 completionHandler:(id)a4;
- (void)_loadResourcesWithURL:(id)a3;
- (void)_showPrimaryAlertForObjectModel:(id)a3 completion:(id)a4;
- (void)cancel;
- (void)completePendingPageRefresh;
- (void)dealloc;
- (void)didParseData;
- (void)failWithError:(id)a3 forRequest:(id)a4;
- (void)initializeSwift;
- (void)loadRequest:(id)a3;
- (void)loadXMLUIWithData:(id)a3 baseURL:(id)a4;
- (void)loadXMLUIWithRequest:(id)a3;
- (void)loadXMLUIWithURL:(id)a3;
- (void)parseData:(id)a3;
- (void)parseData:(id)a3 completion:(id)a4;
- (void)setAllowNonSecureHTTP:(BOOL)a3;
- (void)setParserDelegate:(id)a3;
- (void)setPendingRefreshPageIDs:(id)a3;
- (void)setStyle:(id)a3;
- (void)setUserInterfaceStyle:(int64_t)a3;
- (void)shouldLoadRequest:(id)a3 completionHandler:(id)a4;
- (void)webViewFinishedLoadingWithURL:(id)a3;
@end

@implementation RUILoader

- (RUILoader)init
{
  v6.receiver = self;
  v6.super_class = (Class)RUILoader;
  v2 = [(RUIHTTPRequest *)&v6 init];
  if (v2)
  {
    v3 = (NSMutableArray *)objc_alloc_init(MEMORY[0x263EFF980]);
    pendingRefreshPageIDs = v2->_pendingRefreshPageIDs;
    v2->_pendingRefreshPageIDs = v3;

    [(RUILoader *)v2 initializeSwift];
  }
  return v2;
}

- (void)dealloc
{
  v3 = [MEMORY[0x263F08A00] defaultCenter];
  [v3 removeObserver:self];

  v4.receiver = self;
  v4.super_class = (Class)RUILoader;
  [(RUIHTTPRequest *)&v4 dealloc];
}

- (void)cancel
{
  uint64_t v9 = *MEMORY[0x263EF8340];
  if (_isInternalInstall() && _isInternalInstall())
  {
    v3 = _RUILoggingFacility();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
    {
      objc_super v4 = [MEMORY[0x263F08B88] callStackSymbols];
      *(_DWORD *)buf = 138412290;
      v8 = v4;
      _os_log_impl(&dword_2144F2000, v3, OS_LOG_TYPE_DEFAULT, "RemoteUILoader cancel %@", buf, 0xCu);
    }
  }
  url = self->_url;
  self->_url = 0;

  v6.receiver = self;
  v6.super_class = (Class)RUILoader;
  [(RUIHTTPRequest *)&v6 cancel];
}

- (void)loadRequest:(id)a3
{
  uint64_t v19 = *MEMORY[0x263EF8340];
  id v4 = a3;
  v5 = v4;
  if (!self->_url)
  {
    objc_super v6 = [v4 URL];
    url = self->_url;
    self->_url = v6;
  }
  v8 = (void *)[v5 mutableCopy];
  uint64_t v9 = [v8 valueForHTTPHeaderField:@"Accept"];

  if (!v9)
  {
    [v8 setValue:@"application/x-buddyml" forHTTPHeaderField:@"Accept"];
    if (!self->_userInterfaceStyle)
    {
      v10 = [MEMORY[0x263F82B60] mainScreen];
      v11 = [v10 traitCollection];
      self->_userInterfaceStyle = [v11 userInterfaceStyle];

      if (_isInternalInstall())
      {
        v12 = _RUILoggingFacility();
        if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
        {
          v13 = [NSNumber numberWithInteger:self->_userInterfaceStyle];
          *(_DWORD *)buf = 138412290;
          v18 = v13;
          _os_log_impl(&dword_2144F2000, v12, OS_LOG_TYPE_DEFAULT, "User interface style unknown, grabbing from mainScreen - %@", buf, 0xCu);
        }
      }
    }
    v14 = [NSNumber numberWithInteger:self->_userInterfaceStyle];
    v15 = [v14 stringValue];
    [v8 setValue:v15 forHTTPHeaderField:@"X-Apple-I-Appearance"];
  }
  v16.receiver = self;
  v16.super_class = (Class)RUILoader;
  [(RUIHTTPRequest *)&v16 loadRequest:v8];
}

- (void)_handleShouldLoadRequestResult:(id)a3 completionHandler:(id)a4
{
  id v6 = a3;
  v7 = (void (**)(id, id, void))a4;
  v8 = [v6 URL];
  url = self->_url;
  self->_url = v8;

  if (!v6
    || [(RUILoader *)self allowNonSecureHTTP]
    || ([v6 URL],
        v10 = objc_claimAutoreleasedReturnValue(),
        [v10 scheme],
        v11 = objc_claimAutoreleasedReturnValue(),
        char v12 = [v11 isEqualToString:@"https"],
        v11,
        v10,
        (v12 & 1) != 0))
  {
    v7[2](v7, v6, 0);
  }
  else
  {
    uint64_t v14 = MEMORY[0x263EF8330];
    uint64_t v15 = 3221225472;
    objc_super v16 = __62__RUILoader__handleShouldLoadRequestResult_completionHandler___block_invoke;
    v17 = &unk_264211888;
    v18 = self;
    id v19 = v6;
    dispatch_async(MEMORY[0x263EF83A0], &v14);
    v13 = +[RUIHTTPRequest nonSecureConnectionNotAllowedError];
    ((void (**)(id, id, void *))v7)[2](v7, 0, v13);
  }
}

void __62__RUILoader__handleShouldLoadRequestResult_completionHandler___block_invoke(uint64_t a1)
{
  v2 = *(void **)(a1 + 32);
  id v3 = +[RUIHTTPRequest nonSecureConnectionNotAllowedError];
  [v2 failWithError:v3 forRequest:*(void *)(a1 + 40)];
}

- (void)shouldLoadRequest:(id)a3 completionHandler:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v8 = [(RUIHTTPRequest *)self delegate];
  char v9 = objc_opt_respondsToSelector();

  if (v9)
  {
    v10 = [(RUIHTTPRequest *)self delegate];
    v16[0] = MEMORY[0x263EF8330];
    v16[1] = 3221225472;
    v16[2] = __49__RUILoader_shouldLoadRequest_completionHandler___block_invoke;
    v16[3] = &unk_264211978;
    v16[4] = self;
    id v17 = v7;
    [v10 loader:self willLoadRequest:v6 redirectResponse:0 completionHandler:v16];
  }
  else
  {
    id v11 = v6;
    char v12 = [(RUIHTTPRequest *)self delegate];
    char v13 = objc_opt_respondsToSelector();

    if (v13)
    {
      uint64_t v14 = [(RUIHTTPRequest *)self delegate];
      uint64_t v15 = [v14 loader:self willLoadRequest:v11 redirectResponse:0];

      id v11 = (id)v15;
    }
    [(RUILoader *)self _handleShouldLoadRequestResult:v11 completionHandler:v7];
  }
}

uint64_t __49__RUILoader_shouldLoadRequest_completionHandler___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  if (a3) {
    return (*(uint64_t (**)(void))(*(void *)(a1 + 40) + 16))();
  }
  else {
    return [*(id *)(a1 + 32) _handleShouldLoadRequestResult:a2 completionHandler:*(void *)(a1 + 40)];
  }
}

- (id)sessionConfiguration
{
  id v3 = [(RUIHTTPRequest *)self delegate];
  char v4 = objc_opt_respondsToSelector();

  if (v4)
  {
    v5 = [(RUIHTTPRequest *)self delegate];
    id v6 = [v5 sessionConfigurationForLoader:self];
  }
  else
  {
    id v6 = 0;
  }
  return v6;
}

- (id)urlSessionDelegate
{
  sessionDelegateAdapter = self->_sessionDelegateAdapter;
  if (!sessionDelegateAdapter)
  {
    char v4 = objc_alloc_init(_RUILoaderSessionDelegateAdapter);
    v5 = self->_sessionDelegateAdapter;
    self->_sessionDelegateAdapter = v4;

    [(_RUILoaderSessionDelegateAdapter *)self->_sessionDelegateAdapter setDelegate:self];
    sessionDelegateAdapter = self->_sessionDelegateAdapter;
  }
  return sessionDelegateAdapter;
}

- (void)loadXMLUIWithURL:(id)a3
{
  id v6 = a3;
  v5 = objc_msgSend(MEMORY[0x263F08BD8], "requestWithURL:");
  [(RUILoader *)self loadRequest:v5];
  if ([(RUIHTTPRequest *)self isLoading]) {
    objc_storeStrong((id *)&self->_url, a3);
  }
}

- (void)loadXMLUIWithRequest:(id)a3
{
  id v6 = a3;
  -[RUILoader loadRequest:](self, "loadRequest:");
  if ([(RUIHTTPRequest *)self isLoading])
  {
    char v4 = [v6 URL];
    url = self->_url;
    self->_url = v4;
  }
}

- (void)loadXMLUIWithData:(id)a3 baseURL:(id)a4
{
  objc_storeStrong((id *)&self->_url, a4);
  id v6 = a3;
  [(RUILoader *)self parseData:v6];

  [(RUILoader *)self didParseData];
}

- (id)URL
{
  return self->_url;
}

- (void)parseData:(id)a3
{
  id v4 = a3;
  v5 = [RUIParser alloc];
  url = self->_url;
  style = self->_style;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_parserDelegate);
  v8 = [(RUILoader *)self decodingUserInfo];
  char v9 = [(RUIParser *)v5 initWithXML:v4 baseURL:url style:style delegate:WeakRetained decodingUserInfo:v8];

  parser = self->_parser;
  self->_parser = v9;
}

- (void)parseData:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v8 = [RUIParser alloc];
  url = self->_url;
  style = self->_style;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_parserDelegate);
  char v12 = [(RUILoader *)self decodingUserInfo];
  char v13 = [(RUIParser *)v8 initWithBaseURL:url style:style delegate:WeakRetained decodingUserInfo:v12];
  parser = self->_parser;
  self->_parser = v13;

  uint64_t v15 = dispatch_get_global_queue(33, 0);
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __34__RUILoader_parseData_completion___block_invoke;
  block[3] = &unk_2642119A0;
  block[4] = self;
  id v19 = v6;
  id v20 = v7;
  id v16 = v7;
  id v17 = v6;
  dispatch_async(v15, block);
}

void __34__RUILoader_parseData_completion___block_invoke(uint64_t a1)
{
  v2 = [*(id *)(*(void *)(a1 + 32) + 40) parseXML:*(void *)(a1 + 40)];
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __34__RUILoader_parseData_completion___block_invoke_2;
  block[3] = &unk_2642119A0;
  block[4] = *(void *)(a1 + 32);
  id v5 = v2;
  id v6 = *(id *)(a1 + 48);
  id v3 = v2;
  dispatch_async(MEMORY[0x263EF83A0], block);
}

uint64_t __34__RUILoader_parseData_completion___block_invoke_2(void *a1)
{
  [*(id *)(a1[4] + 40) parseObjectModelWithXMLElement:a1[5]];
  v2 = *(uint64_t (**)(void))(a1[6] + 16);
  return v2();
}

- (void)_loadResourcesWithURL:(id)a3
{
  id v4 = a3;
  id v5 = [(RUIHTTPRequest *)self delegate];
  id v6 = [(RUIParser *)self->_parser uiObjectModel];
  id v7 = [(RUIParser *)self->_parser actionSignal];
  BOOL v8 = [(RUIParser *)self->_parser succeeded];
  uint64_t v9 = [(RUIParser *)self->_parser error];
  id v10 = (id)v9;
  if (v8)
  {
    aBlock[0] = MEMORY[0x263EF8330];
    aBlock[1] = 3221225472;
    aBlock[2] = __35__RUILoader__loadResourcesWithURL___block_invoke;
    aBlock[3] = &unk_264211810;
    aBlock[4] = self;
    id v11 = v6;
    id v27 = v11;
    id v12 = v4;
    id v28 = v12;
    id v13 = v7;
    id v29 = v13;
    id v10 = v10;
    id v30 = v10;
    uint64_t v14 = _Block_copy(aBlock);
    if (objc_opt_respondsToSelector())
    {
      v20[0] = MEMORY[0x263EF8330];
      v20[1] = 3221225472;
      v20[2] = __35__RUILoader__loadResourcesWithURL___block_invoke_2;
      v20[3] = &unk_264211810;
      id v21 = v5;
      v22 = self;
      id v23 = v11;
      id v24 = v12;
      id v25 = v13;
      uint64_t v15 = _Block_copy(v20);

      uint64_t v14 = v15;
    }
    id v16 = +[RUIInternalResourceLoader shared];
    v18[0] = MEMORY[0x263EF8330];
    v18[1] = 3221225472;
    v18[2] = __35__RUILoader__loadResourcesWithURL___block_invoke_4;
    v18[3] = &unk_2642119F0;
    id v19 = v14;
    id v17 = v14;
    [v16 loadWithCompletionHandler:v18];
  }
  else
  {
    if (!v9)
    {
      id v10 = +[RUIHTTPRequest errorWithCode:4];
    }
    [(RUILoader *)self _finishLoadWithObjectModel:v6 url:v4 actionSignal:v7 error:v10];
  }
}

uint64_t __35__RUILoader__loadResourcesWithURL___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _finishLoadWithObjectModel:*(void *)(a1 + 40) url:*(void *)(a1 + 48) actionSignal:*(void *)(a1 + 56) error:*(void *)(a1 + 64)];
}

void __35__RUILoader__loadResourcesWithURL___block_invoke_2(uint64_t a1)
{
  v2 = *(void **)(a1 + 32);
  uint64_t v3 = *(void *)(a1 + 40);
  id v4 = *(void **)(a1 + 48);
  v5[0] = MEMORY[0x263EF8330];
  v5[1] = 3221225472;
  v5[2] = __35__RUILoader__loadResourcesWithURL___block_invoke_3;
  v5[3] = &unk_2642119C8;
  v5[4] = v3;
  id v6 = v4;
  id v7 = *(id *)(a1 + 56);
  id v8 = *(id *)(a1 + 64);
  [v2 loader:v3 loadResourcesForObjectModel:v6 completion:v5];
}

uint64_t __35__RUILoader__loadResourcesWithURL___block_invoke_3(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return [*(id *)(a1 + 32) _finishLoadWithObjectModel:*(void *)(a1 + 40) url:*(void *)(a1 + 48) actionSignal:*(void *)(a1 + 56) error:a3];
}

void __35__RUILoader__loadResourcesWithURL___block_invoke_4(uint64_t a1)
{
}

- (void)_finishLoadWithObjectModel:(id)a3 url:(id)a4 actionSignal:(id)a5 error:(id)a6
{
  uint64_t v41 = *MEMORY[0x263EF8340];
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  id v13 = a6;
  if (_isInternalInstall())
  {
    uint64_t v14 = _RUILoggingFacility();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
    {
      LODWORD(buf) = 138412290;
      *(void *)((char *)&buf + 4) = v11;
      _os_log_impl(&dword_2144F2000, v14, OS_LOG_TYPE_DEFAULT, "Finished load of %@", (uint8_t *)&buf, 0xCu);
    }
  }
  uint64_t v15 = self;
  id v16 = [(RUIHTTPRequest *)v15 delegate];
  if (objc_opt_respondsToSelector())
  {
    id v17 = [(RUIHTTPRequest *)v15 request];
    [v16 loader:v15 didFinishLoadWithError:v13 forRequest:v17];

LABEL_9:
    char v18 = 1;
    goto LABEL_11;
  }
  if (objc_opt_respondsToSelector())
  {
    [v16 loader:v15 didFinishLoadWithError:v13];
    goto LABEL_9;
  }
  char v18 = 0;
LABEL_11:
  *(void *)&long long buf = 0;
  *((void *)&buf + 1) = &buf;
  uint64_t v37 = 0x3032000000;
  v38 = __Block_byref_object_copy_;
  v39 = __Block_byref_object_dispose_;
  id v19 = v12;
  id v40 = v19;
  if (*(void *)(*((void *)&buf + 1) + 40))
  {
    BOOL v20 = 1;
  }
  else
  {
    id v21 = [v10 primaryAlert];
    if (v21)
    {
      BOOL v20 = 1;
    }
    else
    {
      v22 = [v10 clientInfo];
      BOOL v20 = [v22 count] != 0;
    }
  }
  [v10 setSourceURL:v11];
  v28[0] = MEMORY[0x263EF8330];
  v28[1] = 3221225472;
  v28[2] = __63__RUILoader__finishLoadWithObjectModel_url_actionSignal_error___block_invoke;
  v28[3] = &unk_264211A18;
  id v23 = v13;
  BOOL v34 = v20;
  id v29 = v23;
  p_long long buf = &buf;
  id v24 = v10;
  id v30 = v24;
  id v25 = v16;
  id v31 = v25;
  v32 = v15;
  char v35 = v18;
  [(RUILoader *)v15 _showPrimaryAlertForObjectModel:v24 completion:v28];
  parser = v15->_parser;
  v15->_parser = 0;

  url = v15->_url;
  v15->_url = 0;

  _Block_object_dispose(&buf, 8);
}

void __63__RUILoader__finishLoadWithObjectModel_url_actionSignal_error___block_invoke(uint64_t a1)
{
  if (*(void *)(a1 + 32) || !*(unsigned char *)(a1 + 72))
  {
    if (_isInternalInstall())
    {
      v2 = _RUILoggingFacility();
      if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
      {
        LOWORD(buf[0]) = 0;
        _os_log_impl(&dword_2144F2000, v2, OS_LOG_TYPE_DEFAULT, "No object model in server response", (uint8_t *)buf, 2u);
      }
    }
    if (!*(unsigned char *)(a1 + 73) && (objc_opt_respondsToSelector() & 1) != 0) {
      [*(id *)(a1 + 48) loader:*(void *)(a1 + 56) didFailWithError:*(void *)(a1 + 32)];
    }
    [*(id *)(a1 + 56) completePendingPageRefresh];
  }
  else
  {
    if (!*(void *)(*(void *)(*(void *)(a1 + 64) + 8) + 40))
    {
      uint64_t v3 = [*(id *)(a1 + 40) primaryAlert];

      if (v3)
      {
        uint64_t v4 = +[RUIActionSignal signalWithType:7];
        uint64_t v5 = *(void *)(*(void *)(a1 + 64) + 8);
        id v6 = *(void **)(v5 + 40);
        *(void *)(v5 + 40) = v4;
      }
    }
    if (objc_opt_respondsToSelector())
    {
      objc_initWeak(buf, *(id *)(a1 + 56));
      uint64_t v8 = *(void *)(a1 + 40);
      id v7 = *(void **)(a1 + 48);
      uint64_t v9 = *(void *)(a1 + 56);
      uint64_t v10 = *(void *)(*(void *)(*(void *)(a1 + 64) + 8) + 40);
      v12[0] = MEMORY[0x263EF8330];
      v12[1] = 3221225472;
      v12[2] = __63__RUILoader__finishLoadWithObjectModel_url_actionSignal_error___block_invoke_2;
      v12[3] = &unk_264211570;
      objc_copyWeak(&v13, buf);
      [v7 loader:v9 receivedObjectModel:v8 topActionSignal:v10 completion:v12];
      objc_destroyWeak(&v13);
      objc_destroyWeak(buf);
    }
    else
    {
      objc_msgSend(*(id *)(a1 + 48), "loader:receivedObjectModel:actionSignal:", *(void *)(a1 + 56), *(void *)(a1 + 40), objc_msgSend(*(id *)(*(void *)(*(void *)(a1 + 64) + 8) + 40), "topSignal"));
      id v11 = *(void **)(a1 + 56);
      [v11 completePendingPageRefresh];
    }
  }
}

void __63__RUILoader__finishLoadWithObjectModel_url_actionSignal_error___block_invoke_2(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained completePendingPageRefresh];
}

- (void)completePendingPageRefresh
{
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __39__RUILoader_completePendingPageRefresh__block_invoke;
  block[3] = &unk_2642112D8;
  block[4] = self;
  dispatch_async(MEMORY[0x263EF83A0], block);
}

void __39__RUILoader_completePendingPageRefresh__block_invoke(uint64_t a1)
{
  uint64_t v15 = *MEMORY[0x263EF8340];
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  v2 = objc_msgSend(*(id *)(a1 + 32), "pendingRefreshPageIDs", 0);
  uint64_t v3 = [v2 countByEnumeratingWithState:&v10 objects:v14 count:16];
  if (v3)
  {
    uint64_t v4 = v3;
    uint64_t v5 = *(void *)v11;
    do
    {
      uint64_t v6 = 0;
      do
      {
        if (*(void *)v11 != v5) {
          objc_enumerationMutation(v2);
        }
        uint64_t v7 = *(void *)(*((void *)&v10 + 1) + 8 * v6);
        uint64_t v8 = [MEMORY[0x263F08A00] defaultCenter];
        [v8 postNotificationName:@"RUIPageRefreshRequestedNotification" object:v7];

        ++v6;
      }
      while (v4 != v6);
      uint64_t v4 = [v2 countByEnumeratingWithState:&v10 objects:v14 count:16];
    }
    while (v4);
  }

  uint64_t v9 = [*(id *)(a1 + 32) pendingRefreshPageIDs];
  [v9 removeAllObjects];
}

- (void)_showPrimaryAlertForObjectModel:(id)a3 completion:(id)a4
{
  id v6 = a3;
  uint64_t v7 = (void (**)(void))a4;
  uint64_t v8 = [(RUIHTTPRequest *)self delegate];
  char v9 = objc_opt_respondsToSelector();

  long long v10 = [(RUIHTTPRequest *)self delegate];
  long long v11 = v10;
  if (v9)
  {
    uint64_t v12 = [v10 viewControllerForAlertPresentation];
LABEL_5:
    uint64_t v14 = (void *)v12;

    goto LABEL_7;
  }
  char v13 = objc_opt_respondsToSelector();

  if (v13)
  {
    long long v11 = [(RUIHTTPRequest *)self delegate];
    uint64_t v12 = [v11 parentViewControllerForObjectModel:v6];
    goto LABEL_5;
  }
  uint64_t v14 = 0;
LABEL_7:
  uint64_t v15 = [v6 primaryAlert];
  v19[0] = 0;
  v19[1] = v19;
  v19[2] = 0x3032000000;
  v19[3] = __Block_byref_object_copy_;
  v19[4] = __Block_byref_object_dispose_;
  BOOL v20 = self;
  if (v15)
  {
    v16[0] = MEMORY[0x263EF8330];
    v16[1] = 3221225472;
    v16[2] = __56__RUILoader__showPrimaryAlertForObjectModel_completion___block_invoke;
    v16[3] = &unk_264211A40;
    id v17 = v7;
    char v18 = v19;
    [v15 runAlertInController:v14 completion:v16];
  }
  else
  {
    v7[2](v7);
  }
  _Block_object_dispose(v19, 8);
}

void __56__RUILoader__showPrimaryAlertForObjectModel_completion___block_invoke(uint64_t a1)
{
  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
  uint64_t v2 = *(void *)(*(void *)(a1 + 40) + 8);
  uint64_t v3 = *(void **)(v2 + 40);
  *(void *)(v2 + 40) = 0;
}

- (BOOL)anyWebViewLoading
{
  uint64_t v17 = *MEMORY[0x263EF8340];
  uint64_t v2 = [(RUIParser *)self->_parser uiObjectModel];
  [v2 allPages];
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  id v3 = (id)objc_claimAutoreleasedReturnValue();
  uint64_t v4 = [v3 countByEnumeratingWithState:&v12 objects:v16 count:16];
  if (v4)
  {
    uint64_t v5 = *(void *)v13;
    while (2)
    {
      for (uint64_t i = 0; i != v4; ++i)
      {
        if (*(void *)v13 != v5) {
          objc_enumerationMutation(v3);
        }
        uint64_t v7 = *(void **)(*((void *)&v12 + 1) + 8 * i);
        if (objc_msgSend(v7, "hasWebView", (void)v12))
        {
          uint64_t v8 = [v7 webViewOM];
          char v9 = [v8 webView];
          char v10 = [v9 isLoading];

          if (v10)
          {
            LOBYTE(v4) = 1;
            goto LABEL_12;
          }
        }
      }
      uint64_t v4 = [v3 countByEnumeratingWithState:&v12 objects:v16 count:16];
      if (v4) {
        continue;
      }
      break;
    }
  }
LABEL_12:

  return v4;
}

- (void)didParseData
{
  id v3 = self->_url;
  if ([(RUILoader *)self anyWebViewLoading])
  {
    objc_initWeak(&location, self);
    uint64_t v4 = [MEMORY[0x263F08A00] defaultCenter];
    uint64_t v5 = RUIWebViewDidFinishLoadNotification;
    v8[0] = MEMORY[0x263EF8330];
    v8[1] = 3221225472;
    v8[2] = __25__RUILoader_didParseData__block_invoke;
    v8[3] = &unk_264211A68;
    objc_copyWeak(&v10, &location);
    char v9 = v3;
    id v6 = [v4 addObserverForName:v5 object:0 queue:0 usingBlock:v8];
    id webViewLoadNotificationObserver = self->_webViewLoadNotificationObserver;
    self->_id webViewLoadNotificationObserver = v6;

    objc_destroyWeak(&v10);
    objc_destroyWeak(&location);
  }
  else
  {
    [(RUILoader *)self allWebViewsFinishedLoadingWithURL:v3];
  }
}

void __25__RUILoader_didParseData__block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  [WeakRetained webViewFinishedLoadingWithURL:*(void *)(a1 + 32)];
}

- (void)webViewFinishedLoadingWithURL:(id)a3
{
  id v5 = a3;
  if (![(RUILoader *)self anyWebViewLoading])
  {
    uint64_t v4 = [MEMORY[0x263F08A00] defaultCenter];
    [v4 removeObserver:self->_webViewLoadNotificationObserver];

    [(RUILoader *)self allWebViewsFinishedLoadingWithURL:v5];
  }
}

- (void)failWithError:(id)a3 forRequest:(id)a4
{
  uint64_t v19 = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v7 = a4;
  if (_isInternalInstall())
  {
    uint64_t v8 = _RUILoggingFacility();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      int v17 = 138412290;
      id v18 = v6;
      _os_log_impl(&dword_2144F2000, v8, OS_LOG_TYPE_DEFAULT, "RUILoader failed with error %@", (uint8_t *)&v17, 0xCu);
    }
  }
  char v9 = [(RUIHTTPRequest *)self delegate];
  char v10 = objc_opt_respondsToSelector();

  long long v11 = [(RUIHTTPRequest *)self delegate];
  long long v12 = v11;
  if (v10)
  {
    [v11 loader:self didFinishLoadWithError:v6 forRequest:v7];
LABEL_11:

    goto LABEL_12;
  }
  char v13 = objc_opt_respondsToSelector();

  long long v14 = [(RUIHTTPRequest *)self delegate];
  long long v12 = v14;
  if (v13)
  {
    [v14 loader:self didFinishLoadWithError:v6];
    goto LABEL_11;
  }
  char v15 = objc_opt_respondsToSelector();

  if (v15)
  {
    long long v12 = [(RUIHTTPRequest *)self delegate];
    [v12 loader:self didFailWithError:v6];
    goto LABEL_11;
  }
LABEL_12:
  url = self->_url;
  self->_url = 0;
}

- (BOOL)receivedValidResponse:(id)a3 forRequest:(id)a4
{
  uint64_t v21 = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v7 = a4;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    uint64_t v8 = [v6 allHeaderFields];
    if (_isInternalInstall())
    {
      char v9 = _RUILoggingFacility();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)long long buf = 138412290;
        BOOL v20 = v8;
        _os_log_impl(&dword_2144F2000, v9, OS_LOG_TYPE_DEFAULT, "loader receivedValidResponse. headers: %@", buf, 0xCu);
      }
    }
    v18[0] = MEMORY[0x263EF8330];
    v18[1] = 3221225472;
    v18[2] = __46__RUILoader_receivedValidResponse_forRequest___block_invoke;
    v18[3] = &unk_264211A90;
    void v18[4] = self;
    [v8 enumerateKeysAndObjectsUsingBlock:v18];
    char v10 = [(RUIHTTPRequest *)self delegate];
    char v11 = objc_opt_respondsToSelector();

    long long v12 = [(RUIHTTPRequest *)self delegate];
    char v13 = v12;
    if (v11)
    {
      [v12 loader:self didReceiveHTTPResponse:v6 forRequest:v7];
    }
    else
    {
      char v14 = objc_opt_respondsToSelector();

      if ((v14 & 1) == 0)
      {
LABEL_11:

        goto LABEL_12;
      }
      char v13 = [(RUIHTTPRequest *)self delegate];
      [v13 loader:self didReceiveHTTPResponse:v6];
    }

    goto LABEL_11;
  }
LABEL_12:
  v17.receiver = self;
  v17.super_class = (Class)RUILoader;
  BOOL v15 = [(RUIHTTPRequest *)&v17 receivedValidResponse:v6 forRequest:v7];

  return v15;
}

void __46__RUILoader_receivedValidResponse_forRequest___block_invoke(uint64_t a1, void *a2, void *a3)
{
  uint64_t v14 = *MEMORY[0x263EF8340];
  id v5 = a3;
  id v6 = [a2 lowercaseString];
  int v7 = [v6 isEqualToString:@"x-apple-i-refresh-page"];

  if (v7)
  {
    if (_isInternalInstall())
    {
      uint64_t v8 = _RUILoggingFacility();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
      {
        int v12 = 138412290;
        id v13 = v5;
        _os_log_impl(&dword_2144F2000, v8, OS_LOG_TYPE_DEFAULT, "Posting RUIPageRefreshRequestedNotification for page: %@", (uint8_t *)&v12, 0xCu);
      }
    }
    char v9 = [MEMORY[0x263F08708] whitespaceAndNewlineCharacterSet];
    char v10 = [v5 stringByTrimmingCharactersInSet:v9];

    char v11 = [*(id *)(a1 + 32) pendingRefreshPageIDs];
    [v11 addObject:v10];
  }
}

- (void)URLSession:(id)a3 task:(id)a4 willPerformHTTPRedirection:(id)a5 newRequest:(id)a6 completionHandler:(id)a7
{
  uint64_t v28 = *MEMORY[0x263EF8340];
  id v10 = a5;
  id v11 = a6;
  id v12 = a7;
  if (_isInternalInstall())
  {
    id v13 = _RUILoggingFacility();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v14 = [v10 URL];
      BOOL v15 = [v11 URL];
      *(_DWORD *)long long buf = 138412546;
      id v25 = v14;
      __int16 v26 = 2112;
      id v27 = v15;
      _os_log_impl(&dword_2144F2000, v13, OS_LOG_TYPE_DEFAULT, "Loader processing redirect from %@ to %@", buf, 0x16u);
    }
  }
  if (v10)
  {
    aBlock[0] = MEMORY[0x263EF8330];
    aBlock[1] = 3221225472;
    aBlock[2] = __85__RUILoader_URLSession_task_willPerformHTTPRedirection_newRequest_completionHandler___block_invoke;
    aBlock[3] = &unk_264211AB8;
    aBlock[4] = self;
    id v23 = v12;
    id v16 = _Block_copy(aBlock);
    objc_super v17 = [(RUIHTTPRequest *)self delegate];
    char v18 = objc_opt_respondsToSelector();

    if (v18)
    {
      uint64_t v19 = [(RUIHTTPRequest *)self delegate];
      v20[0] = MEMORY[0x263EF8330];
      v20[1] = 3221225472;
      v20[2] = __85__RUILoader_URLSession_task_willPerformHTTPRedirection_newRequest_completionHandler___block_invoke_2;
      v20[3] = &unk_264211AE0;
      id v21 = v16;
      [v19 loader:self willLoadRequest:v11 redirectResponse:v10 completionHandler:v20];
    }
    else
    {
      (*((void (**)(void *, id))v16 + 2))(v16, v11);
    }
  }
  else
  {
    (*((void (**)(id, id))v12 + 2))(v12, v11);
  }
}

void __85__RUILoader_URLSession_task_willPerformHTTPRedirection_newRequest_completionHandler___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v8 = v3;
  if (v3)
  {
    uint64_t v4 = [v3 URL];
    uint64_t v5 = *(void *)(a1 + 32);
    id v6 = *(void **)(v5 + 48);
    *(void *)(v5 + 48) = v4;

    int v7 = (void *)[v8 mutableCopy];
    (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
  }
  else
  {
    [*(id *)(a1 + 32) cancel];
    (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
  }
}

uint64_t __85__RUILoader_URLSession_task_willPerformHTTPRedirection_newRequest_completionHandler___block_invoke_2(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v3 = *(void *)(a1 + 32);
  if (a3) {
    a2 = 0;
  }
  return (*(uint64_t (**)(uint64_t, uint64_t))(v3 + 16))(v3, a2);
}

- (void)URLSession:(id)a3 didReceiveChallenge:(id)a4 completionHandler:(id)a5
{
  id v11 = a4;
  int v7 = (void (**)(id, uint64_t, void))a5;
  id v8 = [(RUIHTTPRequest *)self delegate];
  char v9 = objc_opt_respondsToSelector();

  if (v9)
  {
    id v10 = [(RUIHTTPRequest *)self delegate];
    [v10 loader:self didReceiveChallenge:v11 completionHandler:v7];
  }
  else if (v7)
  {
    v7[2](v7, 1, 0);
  }
}

- (BOOL)allowNonSecureHTTP
{
  return self->_allowNonSecureHTTP;
}

- (void)setAllowNonSecureHTTP:(BOOL)a3
{
  self->_allowNonSecureHTTP = a3;
}

- (RUIParserDelegate)parserDelegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_parserDelegate);
  return (RUIParserDelegate *)WeakRetained;
}

- (void)setParserDelegate:(id)a3
{
}

- (RUIStyle)style
{
  return self->_style;
}

- (void)setStyle:(id)a3
{
}

- (int64_t)userInterfaceStyle
{
  return self->_userInterfaceStyle;
}

- (void)setUserInterfaceStyle:(int64_t)a3
{
  self->_userInterfaceStyle = a3;
}

- (NSMutableArray)pendingRefreshPageIDs
{
  return self->_pendingRefreshPageIDs;
}

- (void)setPendingRefreshPageIDs:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_pendingRefreshPageIDs, 0);
  objc_storeStrong((id *)&self->_style, 0);
  objc_destroyWeak((id *)&self->_parserDelegate);
  objc_storeStrong(&self->_webViewLoadNotificationObserver, 0);
  objc_storeStrong((id *)&self->_sessionDelegateAdapter, 0);
  objc_storeStrong((id *)&self->_url, 0);
  objc_storeStrong((id *)&self->_parser, 0);
}

- (void)initializeSwift
{
  uint64_t v2 = self;
  RUILoader.initializeSwift()();
}

- (RUIDecodingUserInfo)decodingUserInfo
{
  uint64_t v2 = self;
  sub_214557F78((uint64_t)&type metadata for DecodingUserInfoAssociatedKey, (uint64_t)&off_26B4A8778, (uint64_t)&v5);

  id v3 = v5;
  return (RUIDecodingUserInfo *)v3;
}

@end