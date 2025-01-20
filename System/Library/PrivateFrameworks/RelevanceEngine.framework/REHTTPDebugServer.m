@interface REHTTPDebugServer
- (BOOL)_isReservedFilePath:(id)a3;
- (NSArray)availableEngines;
- (NSString)processName;
- (REHTTPDebugServer)initWithPort:(unsigned __int16)a3 dataSource:(id)a4;
- (REHTTPDebugServerDataSource)dataSource;
- (SEL)_serverMethod:(id)a3;
- (id)_aboutPage;
- (id)_create404Element;
- (id)_createContentItemWithTitle:(id)a3 content:(id)a4;
- (id)_engineList;
- (id)_enginesPage;
- (id)_landPageFileName;
- (id)_landingPage;
- (id)_pageMap;
- (id)_pageTitle;
- (id)_radarLinkWithTitle:(id)a3;
- (unsigned)port;
- (void)_availableEngineInstancesForProcess:(id)a3 completion:(id)a4;
- (void)_handleFileRequest:(id)a3 completion:(id)a4;
- (void)_loadAvailableEngines:(id)a3;
- (void)_loadEngineListWithRequest:(id)a3 completion:(id)a4;
- (void)_loadPageForReservedPath:(id)a3 completion:(id)a4;
- (void)httpServer:(id)a3 handleRequest:(id)a4 completion:(id)a5;
- (void)setAvailableEngines:(id)a3;
- (void)setProcessName:(id)a3;
@end

@implementation REHTTPDebugServer

- (REHTTPDebugServer)initWithPort:(unsigned __int16)a3 dataSource:(id)a4
{
  uint64_t v4 = a3;
  id v6 = a4;
  v22.receiver = self;
  v22.super_class = (Class)REHTTPDebugServer;
  v7 = [(REHTTPDebugServer *)&v22 init];
  v8 = v7;
  if (v7)
  {
    id v9 = objc_storeWeak((id *)&v7->_dataSource, v6);
    *(unsigned char *)&v8->_dataSourceCallbacks = *(unsigned char *)&v8->_dataSourceCallbacks & 0xFE | objc_opt_respondsToSelector() & 1;

    id WeakRetained = objc_loadWeakRetained((id *)&v8->_dataSource);
    if (objc_opt_respondsToSelector()) {
      char v11 = 2;
    }
    else {
      char v11 = 0;
    }
    *(unsigned char *)&v8->_dataSourceCallbacks = *(unsigned char *)&v8->_dataSourceCallbacks & 0xFD | v11;

    v12 = [MEMORY[0x263F086E0] bundleWithPath:@"/AppleInternal/Library/RelevanceEngine/Debugger/RelevanceEngineDebuggerServer.bundle"];
    v13 = [v12 pathForResource:@"Debugger" ofType:0];
    v14 = [[REHTTPFileCache alloc] initWithRootDirectory:v13];
    cache = v8->_cache;
    v8->_cache = v14;

    v16 = objc_alloc_init(REHTMLPageBuilder);
    pageBuilder = v8->_pageBuilder;
    v8->_pageBuilder = v16;

    [(REHTMLPageBuilder *)v8->_pageBuilder setStylesheets:&unk_26CFCD710];
    [(REHTMLPageBuilder *)v8->_pageBuilder setLoadingScripts:&unk_26CFCD728];
    [(REHTMLPageBuilder *)v8->_pageBuilder setPageDescription:@"A tool to debug issues and interacting with Relevance Engine."];
    uint64_t v18 = MEMORY[0x263EFFA68];
    [(REHTTPDebugServer *)v8 setAvailableEngines:MEMORY[0x263EFFA68]];
    [(REHTTPDebugServer *)v8 _loadAvailableEngines:v18];
    v19 = [[REHTTPServer alloc] initWithPort:v4 delegate:v8];
    server = v8->_server;
    v8->_server = v19;
  }
  return v8;
}

- (unsigned)port
{
  return [(REHTTPServer *)self->_server port];
}

- (void)_loadAvailableEngines:(id)a3
{
  uint64_t v80 = *MEMORY[0x263EF8340];
  id v4 = a3;
  [(REHTTPDebugServer *)self setAvailableEngines:v4];
  v5 = [MEMORY[0x263EFF980] array];
  long long v73 = 0u;
  long long v74 = 0u;
  long long v75 = 0u;
  long long v76 = 0u;
  obuint64_t j = [(REHTTPDebugServer *)self _pageMap];
  uint64_t v6 = [obj countByEnumeratingWithState:&v73 objects:v79 count:16];
  v64 = self;
  v59 = v5;
  id v61 = v4;
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v74;
    while (2)
    {
      for (uint64_t i = 0; i != v7; ++i)
      {
        if (*(void *)v74 != v8) {
          objc_enumerationMutation(obj);
        }
        uint64_t v10 = *(void *)(*((void *)&v73 + 1) + 8 * i);
        char v11 = [(REHTTPDebugServer *)self _pageMap];
        v12 = [v11 objectForKeyedSubscript:v10];

        v13 = [v12 attributes];
        v14 = [v13 objectForKeyedSubscript:@"re-display-name"];
        v15 = v14;
        if (v14)
        {
          id v16 = v14;
        }
        else
        {
          id v16 = [(REHTTPDebugServer *)self _pageTitle];
        }
        v17 = v16;

        uint64_t v18 = [(REHTTPDebugServer *)self _pageTitle];
        int v19 = [v17 isEqualToString:v18];

        if (v19)
        {
          v21 = [REHTMLPageNavigationLink alloc];
          objc_super v22 = [@"/" stringByAppendingPathComponent:v10];
          v20 = [(REHTMLPageNavigationLink *)v21 initWithLocation:v22 title:v17];

          v5 = v59;
          [v59 addObject:v20];

          self = v64;
          goto LABEL_14;
        }

        self = v64;
      }
      uint64_t v7 = [obj countByEnumeratingWithState:&v73 objects:v79 count:16];
      if (v7) {
        continue;
      }
      break;
    }
    v20 = 0;
    v5 = v59;
LABEL_14:
    id v4 = v61;
  }
  else
  {
    v20 = 0;
  }

  if ([v4 count])
  {
    v23 = [v4 sortedArrayUsingComparator:&__block_literal_global_28];

    v24 = [REHTMLPageNavigationLink alloc];
    uint64_t v25 = [(REHTTPDebugServer *)self processName];
    v26 = (void *)v25;
    if (v25) {
      v27 = (__CFString *)v25;
    }
    else {
      v27 = &stru_26CFA57D0;
    }
    v28 = -[REHTMLPageNavigationLink initWithLocation:title:](v24, "initWithLocation:title:", &stru_26CFA57D0, v27, v59);
    [v5 addObject:v28];

    long long v71 = 0u;
    long long v72 = 0u;
    long long v69 = 0u;
    long long v70 = 0u;
    id v29 = v23;
    uint64_t v30 = [v29 countByEnumeratingWithState:&v69 objects:v78 count:16];
    id v61 = v29;
    if (v30)
    {
      uint64_t v31 = v30;
      uint64_t v32 = *(void *)v70;
      do
      {
        for (uint64_t j = 0; j != v31; ++j)
        {
          if (*(void *)v70 != v32) {
            objc_enumerationMutation(v61);
          }
          v34 = *(void **)(*((void *)&v69 + 1) + 8 * j);
          v35 = [REHTMLPageNavigationLink alloc];
          v36 = [v34 stringByAppendingPathComponent:@"/"];
          v37 = [@"/" stringByAppendingPathComponent:v36];
          v38 = [(REHTMLPageNavigationLink *)v35 initWithLocation:v37 title:v34];

          [v5 addObject:v38];
        }
        id v29 = v61;
        uint64_t v31 = [v61 countByEnumeratingWithState:&v69 objects:v78 count:16];
      }
      while (v31);
    }

    self = v64;
  }
  v39 = objc_msgSend(MEMORY[0x263EFF980], "array", v59);
  long long v65 = 0u;
  long long v66 = 0u;
  long long v67 = 0u;
  long long v68 = 0u;
  id obja = [(REHTTPDebugServer *)self _pageMap];
  uint64_t v40 = [obja countByEnumeratingWithState:&v65 objects:v77 count:16];
  if (v40)
  {
    uint64_t v41 = v40;
    uint64_t v42 = *(void *)v66;
    do
    {
      for (uint64_t k = 0; k != v41; ++k)
      {
        if (*(void *)v66 != v42) {
          objc_enumerationMutation(obja);
        }
        v44 = *(void **)(*((void *)&v65 + 1) + 8 * k);
        if (v20)
        {
          v45 = [(REHTMLPageNavigationLink *)v20 location];
          v46 = [v45 lastPathComponent];
          char v47 = [v44 isEqualToString:v46];

          if (v47) {
            continue;
          }
        }
        v48 = [(REHTTPDebugServer *)v64 _pageMap];
        v49 = [v48 objectForKeyedSubscript:v44];

        v50 = [v49 attributes];
        v51 = [v50 objectForKeyedSubscript:@"re-display-name"];
        v52 = v51;
        if (v51)
        {
          id v53 = v51;
        }
        else
        {
          id v53 = [(REHTTPDebugServer *)v64 _pageTitle];
        }
        v54 = v53;

        v55 = [REHTMLPageNavigationLink alloc];
        v56 = [@"/" stringByAppendingPathComponent:v44];
        v57 = [(REHTMLPageNavigationLink *)v55 initWithLocation:v56 title:v54];

        [v39 addObject:v57];
      }
      uint64_t v41 = [obja countByEnumeratingWithState:&v65 objects:v77 count:16];
    }
    while (v41);
  }

  if ([v39 count])
  {
    [v39 sortUsingComparator:&__block_literal_global_36];
    v58 = [[REHTMLPageNavigationLink alloc] initWithLocation:&stru_26CFA57D0 title:&stru_26CFA57D0];
    [v60 addObject:v58];

    [v60 addObjectsFromArray:v39];
  }
  [(REHTMLPageBuilder *)v64->_pageBuilder setLinks:v60];
}

uint64_t __43__REHTTPDebugServer__loadAvailableEngines___block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  return [a2 compare:a3 options:1];
}

uint64_t __43__REHTTPDebugServer__loadAvailableEngines___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v4 = a3;
  v5 = [a2 title];
  uint64_t v6 = [v4 title];

  uint64_t v7 = [v5 compare:v6 options:1];
  return v7;
}

- (id)_createContentItemWithTitle:(id)a3 content:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  if (v5)
  {
    uint64_t v7 = +[REHTMLElement div];
    uint64_t v8 = [v7 elementByAddingClass:@"section"];

    id v9 = +[REHTMLElement elementWithHTMLString:v5];
    uint64_t v10 = [v8 addChild:v9];
  }
  else
  {
    uint64_t v10 = 0;
  }
  char v11 = +[REHTMLElement div];
  v12 = [v11 elementByAddingClass:@"content-item"];

  if (v10)
  {
    uint64_t v13 = [v12 addChild:v10];

    v12 = (void *)v13;
  }
  if (v6)
  {
    uint64_t v14 = [v12 addChild:v6];

    v12 = (void *)v14;
  }

  return v12;
}

- (id)_create404Element
{
  v3 = +[REHTMLElement elementWithHTMLString:@"<br><div style=\"display: inline-block text-align: center; font-size: 300%; width: 100%;\">👻</div><br><br>"];;
  id v4 = [(REHTTPDebugServer *)self _createContentItemWithTitle:@"Page not found — 404" content:v3];
  pageBuilder = self->_pageBuilder;
  id v6 = [(REHTTPDebugServer *)self _pageTitle];
  uint64_t v7 = [(REHTMLPageBuilder *)pageBuilder pageWithTitle:v6 content:v4 backLocation:0];

  return v7;
}

- (void)_handleFileRequest:(id)a3 completion:(id)a4
{
  id v9 = a3;
  id v6 = a4;
  if (v6)
  {
    id WeakRetained = objc_loadWeakRetained((id *)&self->_dataSource);
    uint64_t v8 = WeakRetained;
    if (WeakRetained && (*(unsigned char *)&self->_dataSourceCallbacks & 2) != 0) {
      [WeakRetained debugServer:self processName:self->_processName handleFileRequest:v9 completion:v6];
    }
    else {
      (*((void (**)(id, void, void))v6 + 2))(v6, 0, 0);
    }
  }
}

- (void)_availableEngineInstancesForProcess:(id)a3 completion:(id)a4
{
  id v9 = a3;
  id v6 = (void (**)(id, void))a4;
  if (v6)
  {
    id WeakRetained = objc_loadWeakRetained((id *)&self->_dataSource);
    uint64_t v8 = WeakRetained;
    if (WeakRetained && (*(unsigned char *)&self->_dataSourceCallbacks & 1) != 0) {
      [WeakRetained debugServer:self availableEngineInstancesForProcess:v9 completion:v6];
    }
    else {
      v6[2](v6, MEMORY[0x263EFFA68]);
    }
  }
}

- (void)httpServer:(id)a3 handleRequest:(id)a4 completion:(id)a5
{
  uint64_t v40 = *MEMORY[0x263EF8340];
  id v7 = a4;
  id v8 = a5;
  id v9 = (void *)MEMORY[0x263F08BA0];
  uint64_t v10 = [v7 url];
  char v11 = [v9 componentsWithURL:v10 resolvingAgainstBaseURL:0];

  [v11 setQuery:0];
  uint64_t v12 = [v11 path];
  if (v12)
  {
    uint64_t v13 = (__CFString *)v12;
    uint64_t v14 = [v7 url];
    int v15 = [v14 hasDirectoryPath];

    if (v15)
    {
      uint64_t v16 = [(__CFString *)v13 stringByAppendingPathComponent:@"index.html"];

      uint64_t v13 = (__CFString *)v16;
    }
  }
  else
  {
    uint64_t v13 = @"index.html";
  }
  uint64_t v30 = MEMORY[0x263EF8330];
  uint64_t v31 = 3221225472;
  uint64_t v32 = __57__REHTTPDebugServer_httpServer_handleRequest_completion___block_invoke;
  v33 = &unk_2644BE790;
  v17 = v13;
  v34 = v17;
  id v18 = v7;
  id v35 = v18;
  v36 = self;
  id v19 = v8;
  id v37 = v19;
  v20 = (void *)MEMORY[0x223C31700](&v30);
  v21 = -[REHTTPDebugServer _serverMethod:](self, "_serverMethod:", v17, v30, v31, v32, v33);
  if (v21)
  {
    objc_super v22 = v21;
    v23 = RELogForDomain(21);
    if (os_log_type_enabled(v23, OS_LOG_TYPE_INFO))
    {
      v24 = NSStringFromSelector(v22);
      *(_DWORD *)buf = 138412290;
      v39 = v24;
      _os_log_impl(&dword_21E6E6000, v23, OS_LOG_TYPE_INFO, "Handling server request with method %@", buf, 0xCu);
    }
    uint64_t v25 = (void *)MEMORY[0x223C31700](v19);
    [(REHTTPDebugServer *)self performSelector:v22 withObject:v18 withObject:v25];
  }
  else if ([(REHTTPDebugServer *)self _isReservedFilePath:v17])
  {
    [(REHTTPDebugServer *)self _loadPageForReservedPath:v17 completion:v20];
  }
  else
  {
    v26 = [(REHTTPFileCache *)self->_cache loadFileAtPath:v17];
    v27 = [v18 url];
    uint64_t v28 = [v27 path];

    if (v26)
    {
      id v29 = [v18 responseWithStatusCode:200];
      [v29 setBody:v26];
      (*((void (**)(id, void *))v19 + 2))(v19, v29);
    }
    else
    {
      [(REHTTPDebugServer *)self _handleFileRequest:v28 completion:v20];
    }

    v17 = (__CFString *)v28;
  }
}

void __57__REHTTPDebugServer_httpServer_handleRequest_completion___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v10 = a2;
  id v5 = a3;
  if (v10)
  {
    id v6 = [*(id *)(a1 + 32) stringByDeletingLastPathComponent];
    id v7 = [*(id *)(a1 + 40) responseWithStatusCode:200];
    id v8 = [*(id *)(*(void *)(a1 + 48) + 16) pageWithTitle:v5 content:v10 backLocation:v6];
    id v9 = [v8 encodedData];
    [v7 setBody:v9];
  }
  else
  {
    id v7 = [*(id *)(a1 + 40) responseWithStatusCode:404];
    id v6 = [*(id *)(a1 + 48) _create404Element];
    id v8 = [v6 encodedData];
    [v7 setBody:v8];
  }

  (*(void (**)(void))(*(void *)(a1 + 56) + 16))();
}

- (id)_pageMap
{
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __29__REHTTPDebugServer__pageMap__block_invoke;
  block[3] = &unk_2644BC660;
  block[4] = self;
  if (_pageMap_onceToken != -1) {
    dispatch_once(&_pageMap_onceToken, block);
  }
  return (id)_pageMap_PageMap;
}

void __29__REHTTPDebugServer__pageMap__block_invoke(uint64_t a1)
{
  v8[3] = *MEMORY[0x263EF8340];
  v7[0] = @"index.html";
  v2 = [*(id *)(a1 + 32) _landingPage];
  v8[0] = v2;
  v7[1] = @"about.html";
  v3 = [*(id *)(a1 + 32) _aboutPage];
  v8[1] = v3;
  v7[2] = @"engines.html";
  id v4 = [*(id *)(a1 + 32) _enginesPage];
  v8[2] = v4;
  uint64_t v5 = [NSDictionary dictionaryWithObjects:v8 forKeys:v7 count:3];
  id v6 = (void *)_pageMap_PageMap;
  _pageMap_PageMap = v5;
}

- (SEL)_serverMethod:(id)a3
{
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __35__REHTTPDebugServer__serverMethod___block_invoke;
  block[3] = &unk_2644BC660;
  block[4] = self;
  uint64_t v3 = _serverMethod__onceToken;
  id v4 = a3;
  if (v3 != -1) {
    dispatch_once(&_serverMethod__onceToken, block);
  }
  uint64_t v5 = [@"/" stringByAppendingPathComponent:v4];

  id v6 = (const char *)[(id)_serverMethod__MethodMap objectForKey:v5];
  return v6;
}

void __35__REHTTPDebugServer__serverMethod___block_invoke(uint64_t a1)
{
  v2 = [MEMORY[0x263F08968] mapTableWithKeyOptions:0 valueOptions:256];
  uint64_t v3 = [*(id *)(a1 + 32) _engineList];
  [v2 setObject:sel__loadEngineListWithRequest_completion_ forKey:v3];

  id v4 = (void *)_serverMethod__MethodMap;
  _serverMethod__MethodMap = (uint64_t)v2;
}

- (BOOL)_isReservedFilePath:(id)a3
{
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __41__REHTTPDebugServer__isReservedFilePath___block_invoke;
  block[3] = &unk_2644BC660;
  block[4] = self;
  uint64_t v3 = _isReservedFilePath__onceToken;
  id v4 = a3;
  if (v3 != -1) {
    dispatch_once(&_isReservedFilePath__onceToken, block);
  }
  uint64_t v5 = [@"/" stringByAppendingPathComponent:v4];

  char v6 = [(id)_isReservedFilePath__Paths containsObject:v5];
  return v6;
}

void __41__REHTTPDebugServer__isReservedFilePath___block_invoke(uint64_t a1)
{
  uint64_t v17 = *MEMORY[0x263EF8340];
  v2 = [MEMORY[0x263EFF9C0] set];
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  uint64_t v3 = objc_msgSend(*(id *)(a1 + 32), "_pageMap", 0);
  uint64_t v4 = [v3 countByEnumeratingWithState:&v12 objects:v16 count:16];
  if (v4)
  {
    uint64_t v5 = v4;
    uint64_t v6 = *(void *)v13;
    do
    {
      uint64_t v7 = 0;
      do
      {
        if (*(void *)v13 != v6) {
          objc_enumerationMutation(v3);
        }
        id v8 = [@"/" stringByAppendingPathComponent:*(void *)(*((void *)&v12 + 1) + 8 * v7)];
        [v2 addObject:v8];

        ++v7;
      }
      while (v5 != v7);
      uint64_t v5 = [v3 countByEnumeratingWithState:&v12 objects:v16 count:16];
    }
    while (v5);
  }

  id v9 = [*(id *)(a1 + 32) _landPageFileName];
  [v2 addObject:v9];

  uint64_t v10 = [v2 copy];
  char v11 = (void *)_isReservedFilePath__Paths;
  _isReservedFilePath__Paths = v10;
}

- (void)_loadPageForReservedPath:(id)a3 completion:(id)a4
{
  uint64_t v15 = *MEMORY[0x263EF8340];
  uint64_t v6 = (void (**)(id, void *, void *))a4;
  uint64_t v7 = [a3 lastPathComponent];
  id v8 = RELogForDomain(21);
  if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
  {
    int v13 = 138412290;
    long long v14 = v7;
    _os_log_impl(&dword_21E6E6000, v8, OS_LOG_TYPE_INFO, "Vending system page %@", (uint8_t *)&v13, 0xCu);
  }

  id v9 = [(REHTTPDebugServer *)self _pageMap];
  uint64_t v10 = [v9 objectForKeyedSubscript:v7];

  char v11 = [v10 attributes];
  long long v12 = [v11 objectForKeyedSubscript:@"re-display-name"];

  v6[2](v6, v10, v12);
}

- (id)_pageTitle
{
  return @"Relevance Engine";
}

- (id)_radarLinkWithTitle:(id)a3
{
  uint64_t v3 = (__CFString *)a3;
  if (![(__CFString *)v3 length])
  {

    uint64_t v3 = @"Relevance Engine | 2.0";
  }
  uint64_t v4 = +[REHTMLElement link:@"rdar://new/problem/component=Relevance%20Engine&version=2.0" title:v3];

  return v4;
}

- (id)_enginesPage
{
  v2 = [(REHTTPFileCache *)self->_cache loadFileAtPath:@"/engines.html"];
  uint64_t v3 = +[REHTMLElement div];
  uint64_t v4 = +[REHTMLElement elementWithHTMLData:v2];
  uint64_t v5 = [v3 addChild:v4];

  uint64_t v6 = [v5 elementByAddingAtttibute:@"re-display-name" value:@"Select Process"];

  return v6;
}

- (id)_landPageFileName
{
  return @"/land_page.html";
}

- (id)_landingPage
{
  uint64_t v3 = [(REHTTPDebugServer *)self _landPageFileName];
  uint64_t v4 = [(REHTTPFileCache *)self->_cache loadFileAtPath:v3];
  uint64_t v5 = +[REHTMLElement elementWithHTMLData:v4];

  return v5;
}

- (id)_aboutPage
{
  uint64_t v3 = +[REHTMLElement htmlElementWithTag:@"p" content:@"This tool allows introspecting state of Relevance Engine and provides a set of tools for debugging."];
  uint64_t v4 = +[REHTMLElement htmlElementWithTag:@"p" content:@"File any bugs against "];
  uint64_t v5 = [(REHTTPDebugServer *)self _radarLinkWithTitle:0];
  uint64_t v6 = [v4 addChild:v5];

  uint64_t v7 = [v3 append:v6];
  id v8 = [(REHTTPDebugServer *)self _createContentItemWithTitle:0 content:v7];

  id v9 = [v8 elementByAddingAtttibute:@"re-display-name" value:@"About"];

  return v9;
}

- (id)_engineList
{
  return @"/engine-list";
}

- (void)_loadEngineListWithRequest:(id)a3 completion:(id)a4
{
  uint64_t v42 = *MEMORY[0x263EF8340];
  id v24 = a3;
  id v6 = a4;
  if (v6)
  {
    uint64_t v33 = 0;
    v34 = &v33;
    uint64_t v35 = 0x3032000000;
    v36 = __Block_byref_object_copy__12;
    id v37 = __Block_byref_object_dispose__12;
    id v38 = 0;
    v29[0] = MEMORY[0x263EF8330];
    v29[1] = 3221225472;
    v29[2] = __59__REHTTPDebugServer__loadEngineListWithRequest_completion___block_invoke;
    v29[3] = &unk_2644BE7B8;
    v29[4] = self;
    uint64_t v32 = &v33;
    id v7 = v24;
    id v30 = v7;
    id v31 = v6;
    objc_super v22 = (void (**)(void, void))MEMORY[0x223C31700](v29);
    id v8 = (void *)MEMORY[0x263F08BA0];
    id v9 = [v7 url];
    v23 = [v8 componentsWithURL:v9 resolvingAgainstBaseURL:0];

    long long v27 = 0u;
    long long v28 = 0u;
    long long v25 = 0u;
    long long v26 = 0u;
    uint64_t v10 = [v23 queryItems];
    uint64_t v11 = [v10 countByEnumeratingWithState:&v25 objects:v41 count:16];
    if (v11)
    {
      uint64_t v12 = *(void *)v26;
      while (2)
      {
        for (uint64_t i = 0; i != v11; ++i)
        {
          if (*(void *)v26 != v12) {
            objc_enumerationMutation(v10);
          }
          long long v14 = *(void **)(*((void *)&v25 + 1) + 8 * i);
          uint64_t v15 = [v14 name];
          int v16 = [v15 isEqualToString:@"engine"];

          if (v16)
          {
            uint64_t v18 = [v14 value];
            id v19 = (void *)v34[5];
            v34[5] = v18;

            v20 = RELogForDomain(21);
            if (os_log_type_enabled(v20, OS_LOG_TYPE_INFO))
            {
              uint64_t v21 = v34[5];
              *(_DWORD *)buf = 138412290;
              uint64_t v40 = v21;
              _os_log_impl(&dword_21E6E6000, v20, OS_LOG_TYPE_INFO, "Vending engines for process %@", buf, 0xCu);
            }

            [(REHTTPDebugServer *)self _availableEngineInstancesForProcess:v34[5] completion:v22];
            goto LABEL_16;
          }
        }
        uint64_t v11 = [v10 countByEnumeratingWithState:&v25 objects:v41 count:16];
        if (v11) {
          continue;
        }
        break;
      }
    }

    uint64_t v17 = RELogForDomain(21);
    if (os_log_type_enabled(v17, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_21E6E6000, v17, OS_LOG_TYPE_INFO, "Unable to load engines for process", buf, 2u);
    }

    v22[2](v22, MEMORY[0x263EFFA68]);
LABEL_16:

    _Block_object_dispose(&v33, 8);
  }
}

void __59__REHTTPDebugServer__loadEngineListWithRequest_completion___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v6 = v3;
  if (v3)
  {
    uint64_t v4 = [MEMORY[0x263F08900] dataWithJSONObject:v3 options:2 error:0];
    [*(id *)(a1 + 32) setProcessName:*(void *)(*(void *)(*(void *)(a1 + 56) + 8) + 40)];
    [*(id *)(a1 + 32) _loadAvailableEngines:v6];
    if (v4)
    {
      uint64_t v5 = [*(id *)(a1 + 40) responseWithStatusCode:200];
      [v5 setBody:v4];

      goto LABEL_6;
    }
  }
  else
  {
    [*(id *)(a1 + 32) setProcessName:0];
    [*(id *)(a1 + 32) _loadAvailableEngines:MEMORY[0x263EFFA68]];
  }
  uint64_t v5 = [*(id *)(a1 + 40) responseWithStatusCode:500];
LABEL_6:
  (*(void (**)(void))(*(void *)(a1 + 48) + 16))();
}

- (REHTTPDebugServerDataSource)dataSource
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_dataSource);
  return (REHTTPDebugServerDataSource *)WeakRetained;
}

- (NSArray)availableEngines
{
  return (NSArray *)objc_getProperty(self, a2, 48, 1);
}

- (void)setAvailableEngines:(id)a3
{
}

- (NSString)processName
{
  return (NSString *)objc_getProperty(self, a2, 56, 1);
}

- (void)setProcessName:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_processName, 0);
  objc_storeStrong((id *)&self->_availableEngines, 0);
  objc_destroyWeak((id *)&self->_dataSource);
  objc_storeStrong((id *)&self->_cache, 0);
  objc_storeStrong((id *)&self->_pageBuilder, 0);
  objc_storeStrong((id *)&self->_server, 0);
}

@end