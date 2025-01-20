@interface MFWKWebViewFactory
+ (OS_os_log)log;
+ (id)sharedWebViewFactory;
+ (id)sharedWebViewFactoryFuture;
+ (void)setDaemonInterface:(id)a3 URLCacheWithMemoryCapacity:(unint64_t)a4;
- (EFQueue)preallocatedWebViews;
- (EMRemoteContentURLSession)urlSession;
- (MFWKWebViewFactory)init;
- (MFWKWebViewFactory)initWithRemoteContentURLCache:(id)a3;
- (NSHashTable)configurations;
- (WKProcessPool)processPool;
- (id)_createConfiguration:(BOOL)a3;
- (id)_instantiateWebView:(BOOL)a3;
- (id)webView;
- (void)_didReceiveMemoryWarning:(id)a3;
- (void)contentRuleListManager:(id)a3 didAddRuleList:(id)a4;
- (void)contentRuleListManager:(id)a3 didRemoveRuleList:(id)a4;
- (void)contentRuleListManager:(id)a3 didUpdateContentRuleList:(id)a4 oldContentRuleList:(id)a5;
- (void)dealloc;
- (void)preallocateWebViewIfNeeded;
- (void)preallocateWebViews;
- (void)setConfigurations:(id)a3;
- (void)setContentRuleListManager:(id)a3;
- (void)setPreallocatedWebViews:(id)a3;
- (void)setProcessPool:(id)a3;
@end

@implementation MFWKWebViewFactory

+ (void)setDaemonInterface:(id)a3 URLCacheWithMemoryCapacity:(unint64_t)a4
{
  id v5 = a3;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __68__MFWKWebViewFactory_setDaemonInterface_URLCacheWithMemoryCapacity___block_invoke;
  block[3] = &unk_1E6D1AB40;
  id v6 = v5;
  id v9 = v6;
  if (setDaemonInterface_URLCacheWithMemoryCapacity__onceToken != -1) {
    dispatch_once(&setDaemonInterface_URLCacheWithMemoryCapacity__onceToken, block);
  }
  v7 = [(id)daemonInterface messageRepository];
  [v7 setUpURLCacheWithMemoryCapacity:a4];
}

void __68__MFWKWebViewFactory_setDaemonInterface_URLCacheWithMemoryCapacity___block_invoke(uint64_t a1)
{
}

+ (OS_os_log)log
{
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __25__MFWKWebViewFactory_log__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  void block[4] = a1;
  if (log_onceToken_8 != -1) {
    dispatch_once(&log_onceToken_8, block);
  }
  v2 = (void *)log_log_8;
  return (OS_os_log *)v2;
}

void __25__MFWKWebViewFactory_log__block_invoke(uint64_t a1)
{
  NSStringFromClass(*(Class *)(a1 + 32));
  id v3 = objc_claimAutoreleasedReturnValue();
  os_log_t v1 = os_log_create("com.apple.email", (const char *)[v3 UTF8String]);
  v2 = (void *)log_log_8;
  log_log_8 = (uint64_t)v1;
}

+ (id)sharedWebViewFactoryFuture
{
  if (!daemonInterface)
  {
    id v6 = [MEMORY[0x1E4F28B00] currentHandler];
    [v6 handleFailureInMethod:a2 object:a1 file:@"MFWKWebViewFactory.m" lineNumber:82 description:@"daemonInterface is not set"];
  }
  if (sharedWebViewFactoryFuture_onceToken != -1) {
    dispatch_once(&sharedWebViewFactoryFuture_onceToken, &__block_literal_global_12);
  }
  v2 = (void *)sharedWebViewFactoryFuture_sFactoryFuture;
  return v2;
}

void __48__MFWKWebViewFactory_sharedWebViewFactoryFuture__block_invoke()
{
  v0 = [(id)daemonInterface messageRepository];
  id v3 = [v0 remoteContentURLCache];

  uint64_t v1 = [v3 then:&__block_literal_global_56];
  v2 = (void *)sharedWebViewFactoryFuture_sFactoryFuture;
  sharedWebViewFactoryFuture_sFactoryFuture = v1;
}

id __48__MFWKWebViewFactory_sharedWebViewFactoryFuture__block_invoke_2(uint64_t a1, void *a2)
{
  id v2 = a2;
  id v3 = [[MFWKWebViewFactory alloc] initWithRemoteContentURLCache:v2];
  v4 = [MEMORY[0x1E4F60D70] futureWithResult:v3];

  return v4;
}

+ (id)sharedWebViewFactory
{
  id v2 = [a1 sharedWebViewFactoryFuture];
  id v3 = [v2 result];

  return v3;
}

- (MFWKWebViewFactory)init
{
  id v3 = [(id)daemonInterface messageRepository];
  v4 = [v3 remoteContentURLCache];
  id v5 = [v4 result];

  id v6 = [(MFWKWebViewFactory *)self initWithRemoteContentURLCache:v5];
  return v6;
}

- (MFWKWebViewFactory)initWithRemoteContentURLCache:(id)a3
{
  id v4 = a3;
  v16.receiver = self;
  v16.super_class = (Class)MFWKWebViewFactory;
  id v5 = [(MFWKWebViewFactory *)&v16 init];
  if (v5)
  {
    uint64_t v6 = [objc_alloc(MEMORY[0x1E4F60440]) initWithCache:v4];
    urlSession = v5->_urlSession;
    v5->_urlSession = (EMRemoteContentURLSession *)v6;

    uint64_t v8 = [objc_alloc(MEMORY[0x1E4F60438]) initWithSession:v5->_urlSession schemePrefix:@"x-apple-mail-proxy-" allowProxying:1];
    proxySchemeHandler = v5->_proxySchemeHandler;
    v5->_proxySchemeHandler = (EMRemoteContentURLSchemeHandler *)v8;

    uint64_t v10 = [objc_alloc(MEMORY[0x1E4F60438]) initWithSession:v5->_urlSession schemePrefix:@"x-apple-mail-noproxy-" allowProxying:0];
    noProxySchemeHandler = v5->_noProxySchemeHandler;
    v5->_noProxySchemeHandler = (EMRemoteContentURLSchemeHandler *)v10;

    uint64_t v12 = [MEMORY[0x1E4F28D30] weakObjectsHashTable];
    configurations = v5->_configurations;
    v5->_configurations = (NSHashTable *)v12;

    v14 = [MEMORY[0x1E4F28EB8] defaultCenter];
    [v14 addObserver:v5 selector:sel__didReceiveMemoryWarning_ name:*MEMORY[0x1E4FB2650] object:0];
  }
  return v5;
}

- (void)dealloc
{
  [(EMRemoteContentURLSession *)self->_urlSession invalidateAndCancel:1];
  v3.receiver = self;
  v3.super_class = (Class)MFWKWebViewFactory;
  [(MFWKWebViewFactory *)&v3 dealloc];
}

- (void)_didReceiveMemoryWarning:(id)a3
{
}

- (WKProcessPool)processPool
{
  v18[3] = *MEMORY[0x1E4F143B8];
  processPool = self->_processPool;
  if (!processPool)
  {
    id v4 = objc_alloc_init(MEMORY[0x1E4F46780]);
    id v5 = [MEMORY[0x1E4F28B50] bundleForClass:objc_opt_class()];
    uint64_t v6 = [v5 URLForResource:@"MailWebProcessBundle" withExtension:@"bundle" subdirectory:@"PlugIns"];
    [v4 setInjectedBundleURL:v6];

    [v4 setShouldTakeUIBackgroundAssertion:0];
    v7 = (WKProcessPool *)[objc_alloc(MEMORY[0x1E4F46690]) _initWithConfiguration:v4];
    uint64_t v8 = self->_processPool;
    self->_processPool = v7;

    id v9 = self->_processPool;
    v17[0] = @"remoteContentProxySchemePrefix";
    uint64_t v10 = [(EMRemoteContentURLSchemeHandler *)self->_proxySchemeHandler schemePrefix];
    v18[0] = v10;
    v17[1] = @"remoteContentNoProxySchemePrefix";
    v11 = [(EMRemoteContentURLSchemeHandler *)self->_noProxySchemeHandler schemePrefix];
    v18[1] = v11;
    v17[2] = @"isMailPrivacyProtectionAllowed";
    uint64_t v12 = NSNumber;
    v13 = [MEMORY[0x1E4F74230] sharedConnection];
    v14 = objc_msgSend(v12, "numberWithBool:", objc_msgSend(v13, "isMailPrivacyProtectionAllowed"));
    v18[2] = v14;
    v15 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v18 forKeys:v17 count:3];
    [(WKProcessPool *)v9 _setObjectsForBundleParametersWithDictionary:v15];

    processPool = self->_processPool;
  }
  return processPool;
}

- (id)_instantiateWebView:(BOOL)a3
{
  BOOL v3 = a3;
  id v5 = objc_alloc(MEMORY[0x1E4F466F0]);
  uint64_t v6 = [(MFWKWebViewFactory *)self _createConfiguration:v3];
  v7 = objc_msgSend(v5, "initWithFrame:configuration:", v6, *MEMORY[0x1E4F1DB28], *(double *)(MEMORY[0x1E4F1DB28] + 8), *(double *)(MEMORY[0x1E4F1DB28] + 16), *(double *)(MEMORY[0x1E4F1DB28] + 24));

  [v7 setAllowsLinkPreview:1];
  uint64_t v8 = [v7 scrollView];
  [v8 setScrollsToTop:0];

  id v9 = [v7 scrollView];
  [v9 setScrollEnabled:0];

  uint64_t v10 = [v7 scrollView];
  [v10 setBouncesVertically:0];

  v11 = [MEMORY[0x1E4FB1618] clearColor];
  uint64_t v12 = [v7 scrollView];
  [v12 setBackgroundColor:v11];

  v13 = [v7 scrollView];
  [v13 setContentInsetAdjustmentBehavior:2];

  v14 = [v7 scrollView];
  [v14 _setIndicatorInsetAdjustmentBehavior:1];

  objc_msgSend(v7, "_setObservedRenderingProgressEvents:", objc_msgSend(v7, "_observedRenderingProgressEvents") | 0x40);
  return v7;
}

- (id)_createConfiguration:(BOOL)a3
{
  BOOL v3 = a3;
  v24[1] = *MEMORY[0x1E4F143B8];
  id v5 = objc_alloc_init(MEMORY[0x1E4F466F8]);
  [v5 _setAllowsMetaRefresh:0];
  [v5 _setAllowsJavaScriptMarkup:0];
  [v5 _setAttachmentElementEnabled:1];
  if _os_feature_enabled_impl() && (objc_opt_respondsToSelector()) {
    [v5 _setAttachmentWideLayoutEnabled:1];
  }
  [v5 _setWaitsForPaintAfterViewDidMoveToWindow:0];
  [v5 _setColorFilterEnabled:1];
  [v5 setDataDetectorTypes:-1];
  [v5 setSelectionGranularity:1];
  uint64_t v6 = [v5 preferences];
  [v6 _setTextAutosizingEnabled:0];

  v7 = [v5 preferences];
  [v7 _setPunchOutWhiteBackgroundsInDarkMode:1];

  uint64_t v8 = [v5 defaultWebpagePreferences];
  [v8 _setNetworkConnectionIntegrityPolicy:256];

  id v9 = [(MFWKWebViewFactory *)self processPool];
  [v5 setProcessPool:v9];

  [v5 _setDelaysWebProcessLaunchUntilFirstLoad:v3];
  v24[0] = *MEMORY[0x1E4F60CD8];
  uint64_t v10 = [MEMORY[0x1E4F1C978] arrayWithObjects:v24 count:1];
  [v5 _setAdditionalSupportedImageTypes:v10];

  if (objc_opt_respondsToSelector()) {
    [v5 _setMarkedTextInputEnabled:1];
  }
  [(EMRemoteContentURLSchemeHandler *)self->_proxySchemeHandler setOnWebViewConfiguration:v5];
  [(EMRemoteContentURLSchemeHandler *)self->_noProxySchemeHandler setOnWebViewConfiguration:v5];
  v11 = [MEMORY[0x1E4F73E48] sharedHandler];
  [v5 setURLSchemeHandler:v11 forURLScheme:*MEMORY[0x1E4F77AF8]];

  uint64_t v12 = [v5 userContentController];
  long long v21 = 0u;
  long long v22 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  v13 = +[MFUserScriptLibrary userScripts];
  uint64_t v14 = [v13 countByEnumeratingWithState:&v19 objects:v23 count:16];
  if (v14)
  {
    uint64_t v15 = *(void *)v20;
    do
    {
      for (uint64_t i = 0; i != v14; ++i)
      {
        if (*(void *)v20 != v15) {
          objc_enumerationMutation(v13);
        }
        [v12 addUserScript:*(void *)(*((void *)&v19 + 1) + 8 * i)];
      }
      uint64_t v14 = [v13 countByEnumeratingWithState:&v19 objects:v23 count:16];
    }
    while (v14);
  }

  v17 = [(MFWKWebViewFactory *)self configurations];
  [v17 addObject:v5];

  return v5;
}

- (void)setContentRuleListManager:(id)a3
{
  id v12 = 0;
  id v4 = [a3 addObserver:self activeRuleLists:&v12];
  id v5 = v12;
  uint64_t v6 = (EFAutoCancelationToken *)objc_alloc_init(MEMORY[0x1E4F60D28]);
  contentRuleListManagerObserverCancelable = self->_contentRuleListManagerObserverCancelable;
  self->_contentRuleListManagerObserverCancelable = v6;

  [(EFAutoCancelationToken *)self->_contentRuleListManagerObserverCancelable addCancelable:v4];
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __48__MFWKWebViewFactory_setContentRuleListManager___block_invoke;
  v10[3] = &unk_1E6D1AB90;
  v10[4] = self;
  id v8 = v5;
  id v11 = v8;
  id v9 = [MEMORY[0x1E4F60F28] mainThreadScheduler];
  [v9 performSyncBlock:v10];
}

void __48__MFWKWebViewFactory_setContentRuleListManager___block_invoke(uint64_t a1)
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  id v2 = [*(id *)(a1 + 32) configurations];
  uint64_t v3 = [v2 countByEnumeratingWithState:&v15 objects:v20 count:16];
  if (v3)
  {
    uint64_t v4 = *(void *)v16;
    do
    {
      uint64_t v5 = 0;
      do
      {
        if (*(void *)v16 != v4) {
          objc_enumerationMutation(v2);
        }
        uint64_t v6 = [*(id *)(*((void *)&v15 + 1) + 8 * v5) userContentController];
        long long v13 = 0u;
        long long v14 = 0u;
        long long v11 = 0u;
        long long v12 = 0u;
        id v7 = *(id *)(a1 + 40);
        uint64_t v8 = [v7 countByEnumeratingWithState:&v11 objects:v19 count:16];
        if (v8)
        {
          uint64_t v9 = *(void *)v12;
          do
          {
            uint64_t v10 = 0;
            do
            {
              if (*(void *)v12 != v9) {
                objc_enumerationMutation(v7);
              }
              [v6 addContentRuleList:*(void *)(*((void *)&v11 + 1) + 8 * v10++)];
            }
            while (v8 != v10);
            uint64_t v8 = [v7 countByEnumeratingWithState:&v11 objects:v19 count:16];
          }
          while (v8);
        }

        ++v5;
      }
      while (v5 != v3);
      uint64_t v3 = [v2 countByEnumeratingWithState:&v15 objects:v20 count:16];
    }
    while (v3);
  }
}

- (void)preallocateWebViews
{
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __41__MFWKWebViewFactory_preallocateWebViews__block_invoke;
  block[3] = &unk_1E6D1AB40;
  void block[4] = self;
  if (preallocateWebViews_onceToken != -1) {
    dispatch_once(&preallocateWebViews_onceToken, block);
  }
}

void __41__MFWKWebViewFactory_preallocateWebViews__block_invoke(uint64_t a1)
{
  id v2 = +[MFWKWebViewFactory log];
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)id v7 = 0;
    _os_log_impl(&dword_1DDF5A000, v2, OS_LOG_TYPE_DEFAULT, "Preallocate webViews", v7, 2u);
  }

  uint64_t v3 = [MEMORY[0x1E4F60E30] boundedQueueWithCapacity:3];
  [*(id *)(a1 + 32) setPreallocatedWebViews:v3];

  int v4 = 3;
  do
  {
    uint64_t v5 = [*(id *)(a1 + 32) preallocatedWebViews];
    uint64_t v6 = [*(id *)(a1 + 32) _instantiateWebView:v4 != 3];
    [v5 enqueue:v6];

    --v4;
  }
  while (v4);
}

- (void)preallocateWebViewIfNeeded
{
  uint64_t v3 = [(MFWKWebViewFactory *)self preallocatedWebViews];

  if (v3)
  {
    id v7 = [(MFWKWebViewFactory *)self preallocatedWebViews];
    uint64_t v4 = [v7 count];

    if (!v4)
    {
      id v8 = [(MFWKWebViewFactory *)self preallocatedWebViews];
      uint64_t v5 = [(MFWKWebViewFactory *)self _instantiateWebView:0];
      [v8 enqueue:v5];
    }
  }
  else
  {
    id v6 = [(MFWKWebViewFactory *)self preallocatedWebViews];
  }
}

- (id)webView
{
  uint64_t v3 = [(MFWKWebViewFactory *)self preallocatedWebViews];
  uint64_t v4 = [v3 dequeue];

  if (!v4)
  {
    uint64_t v4 = [(MFWKWebViewFactory *)self _instantiateWebView:0];
  }
  return v4;
}

- (void)contentRuleListManager:(id)a3 didAddRuleList:(id)a4
{
  id v5 = a4;
  uint64_t v8 = MEMORY[0x1E4F143A8];
  uint64_t v9 = self;
  id v6 = v5;
  id v10 = v6;
  id v7 = objc_msgSend(MEMORY[0x1E4F60F28], "mainThreadScheduler", v8, 3221225472, __60__MFWKWebViewFactory_contentRuleListManager_didAddRuleList___block_invoke, &unk_1E6D1AB90, v9);
  [v7 performSyncBlock:&v8];
}

void __60__MFWKWebViewFactory_contentRuleListManager_didAddRuleList___block_invoke(uint64_t a1)
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  long long v7 = 0u;
  long long v8 = 0u;
  long long v9 = 0u;
  long long v10 = 0u;
  id v2 = objc_msgSend(*(id *)(a1 + 32), "configurations", 0);
  uint64_t v3 = [v2 countByEnumeratingWithState:&v7 objects:v11 count:16];
  if (v3)
  {
    uint64_t v4 = *(void *)v8;
    do
    {
      uint64_t v5 = 0;
      do
      {
        if (*(void *)v8 != v4) {
          objc_enumerationMutation(v2);
        }
        id v6 = [*(id *)(*((void *)&v7 + 1) + 8 * v5) userContentController];
        [v6 addContentRuleList:*(void *)(a1 + 40)];

        ++v5;
      }
      while (v3 != v5);
      uint64_t v3 = [v2 countByEnumeratingWithState:&v7 objects:v11 count:16];
    }
    while (v3);
  }
}

- (void)contentRuleListManager:(id)a3 didUpdateContentRuleList:(id)a4 oldContentRuleList:(id)a5
{
  id v7 = a4;
  id v8 = a5;
  v12[0] = MEMORY[0x1E4F143A8];
  v12[1] = 3221225472;
  v12[2] = __89__MFWKWebViewFactory_contentRuleListManager_didUpdateContentRuleList_oldContentRuleList___block_invoke;
  v12[3] = &unk_1E6D1AAF0;
  v12[4] = self;
  id v9 = v8;
  id v13 = v9;
  id v10 = v7;
  id v14 = v10;
  long long v11 = [MEMORY[0x1E4F60F28] mainThreadScheduler];
  [v11 performSyncBlock:v12];
}

void __89__MFWKWebViewFactory_contentRuleListManager_didUpdateContentRuleList_oldContentRuleList___block_invoke(uint64_t a1)
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  long long v7 = 0u;
  long long v8 = 0u;
  long long v9 = 0u;
  long long v10 = 0u;
  id v2 = objc_msgSend(*(id *)(a1 + 32), "configurations", 0);
  uint64_t v3 = [v2 countByEnumeratingWithState:&v7 objects:v11 count:16];
  if (v3)
  {
    uint64_t v4 = *(void *)v8;
    do
    {
      uint64_t v5 = 0;
      do
      {
        if (*(void *)v8 != v4) {
          objc_enumerationMutation(v2);
        }
        id v6 = [*(id *)(*((void *)&v7 + 1) + 8 * v5) userContentController];
        [v6 removeContentRuleList:*(void *)(a1 + 40)];
        [v6 addContentRuleList:*(void *)(a1 + 48)];

        ++v5;
      }
      while (v3 != v5);
      uint64_t v3 = [v2 countByEnumeratingWithState:&v7 objects:v11 count:16];
    }
    while (v3);
  }
}

- (void)contentRuleListManager:(id)a3 didRemoveRuleList:(id)a4
{
  id v5 = a4;
  uint64_t v8 = MEMORY[0x1E4F143A8];
  long long v9 = self;
  id v6 = v5;
  id v10 = v6;
  long long v7 = objc_msgSend(MEMORY[0x1E4F60F28], "mainThreadScheduler", v8, 3221225472, __63__MFWKWebViewFactory_contentRuleListManager_didRemoveRuleList___block_invoke, &unk_1E6D1AB90, v9);
  [v7 performSyncBlock:&v8];
}

void __63__MFWKWebViewFactory_contentRuleListManager_didRemoveRuleList___block_invoke(uint64_t a1)
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  long long v7 = 0u;
  long long v8 = 0u;
  long long v9 = 0u;
  long long v10 = 0u;
  id v2 = objc_msgSend(*(id *)(a1 + 32), "configurations", 0);
  uint64_t v3 = [v2 countByEnumeratingWithState:&v7 objects:v11 count:16];
  if (v3)
  {
    uint64_t v4 = *(void *)v8;
    do
    {
      uint64_t v5 = 0;
      do
      {
        if (*(void *)v8 != v4) {
          objc_enumerationMutation(v2);
        }
        id v6 = [*(id *)(*((void *)&v7 + 1) + 8 * v5) userContentController];
        [v6 removeContentRuleList:*(void *)(a1 + 40)];

        ++v5;
      }
      while (v3 != v5);
      uint64_t v3 = [v2 countByEnumeratingWithState:&v7 objects:v11 count:16];
    }
    while (v3);
  }
}

- (EMRemoteContentURLSession)urlSession
{
  return self->_urlSession;
}

- (NSHashTable)configurations
{
  return self->_configurations;
}

- (void)setConfigurations:(id)a3
{
}

- (EFQueue)preallocatedWebViews
{
  return self->_preallocatedWebViews;
}

- (void)setPreallocatedWebViews:(id)a3
{
}

- (void)setProcessPool:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_processPool, 0);
  objc_storeStrong((id *)&self->_preallocatedWebViews, 0);
  objc_storeStrong((id *)&self->_configurations, 0);
  objc_storeStrong((id *)&self->_urlSession, 0);
  objc_storeStrong((id *)&self->_contentRuleListManagerObserverCancelable, 0);
  objc_storeStrong((id *)&self->_noProxySchemeHandler, 0);
  objc_storeStrong((id *)&self->_proxySchemeHandler, 0);
}

@end