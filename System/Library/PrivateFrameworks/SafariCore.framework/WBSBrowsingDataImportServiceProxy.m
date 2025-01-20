@interface WBSBrowsingDataImportServiceProxy
- (WBSBrowsingDataImportServiceProxy)init;
- (WBSBrowsingDataImportServiceProxy)initWithConnection:(id)a3 proxy:(id)a4;
- (WBSBrowsingDataImportServiceProxy)initWithInterface:(id)a3;
- (id)_defaultProxyErrorHandlerWithReplyHandler:(id)a3;
- (id)_defaultProxyErrorHandlerWithSimpleReplyHandler:(id)a3;
- (void)parseChromeExtensionsFromFileHandle:(id)a3 delegate:(id)a4 completionHandler:(id)a5;
- (void)parseChromeHistoryJSONFromFileHandle:(id)a3 ageLimit:(double)a4 delegate:(id)a5 completionHandler:(id)a6;
- (void)parseCreditCardJSONFromFileHandle:(id)a3 delegate:(id)a4 completionHandler:(id)a5;
- (void)parseExtensionsFromFileHandle:(id)a3 delegate:(id)a4 completionHandler:(id)a5;
- (void)parseHistoryJSONFromFileHandle:(id)a3 ageLimit:(double)a4 delegate:(id)a5 completionHandler:(id)a6;
- (void)parseNetscapeBookmarkFromFileHandle:(id)a3 delegate:(id)a4 completionHandler:(id)a5;
- (void)scanImportURLs:(id)a3 sandboxExtensions:(id)a4 completionHandler:(id)a5;
@end

@implementation WBSBrowsingDataImportServiceProxy

- (WBSBrowsingDataImportServiceProxy)init
{
  v3 = WBSBrowsingDataImportServiceInterface();
  v4 = [(WBSBrowsingDataImportServiceProxy *)self initWithInterface:v3];

  return v4;
}

- (WBSBrowsingDataImportServiceProxy)initWithInterface:(id)a3
{
  uint64_t v4 = initWithInterface__once;
  id v5 = a3;
  if (v4 != -1) {
    dispatch_once(&initWithInterface__once, &__block_literal_global_24);
  }
  v6 = (void *)[objc_alloc(MEMORY[0x1E4F29268]) initWithServiceName:@"com.apple.Safari.BrowsingDataImport"];
  [v6 setRemoteObjectInterface:v5];

  [v6 resume];
  v7 = [v6 remoteObjectProxy];
  v8 = [(WBSBrowsingDataImportServiceProxy *)self initWithConnection:v6 proxy:v7];

  return v8;
}

uint64_t __55__WBSBrowsingDataImportServiceProxy_initWithInterface___block_invoke()
{
  return MEMORY[0x1F40CEA00]("/System/Library/PrivateFrameworks/MobileSafari.framework/XPCServices/BrowsingDataImport.xpc", 2);
}

- (WBSBrowsingDataImportServiceProxy)initWithConnection:(id)a3 proxy:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v13.receiver = self;
  v13.super_class = (Class)WBSBrowsingDataImportServiceProxy;
  v9 = [(WBSBrowsingDataImportServiceProxy *)&v13 init];
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_connection, a3);
    objc_storeStrong((id *)&v10->_proxy, a4);
    v11 = v10;
  }

  return v10;
}

- (id)_defaultProxyErrorHandlerWithReplyHandler:(id)a3
{
  id v4 = a3;
  id v5 = self->_connection;
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __79__WBSBrowsingDataImportServiceProxy__defaultProxyErrorHandlerWithReplyHandler___block_invoke;
  v10[3] = &unk_1E615B808;
  v11 = v5;
  id v12 = v4;
  v6 = v5;
  id v7 = v4;
  id v8 = _Block_copy(v10);

  return v8;
}

void __79__WBSBrowsingDataImportServiceProxy__defaultProxyErrorHandlerWithReplyHandler___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  uint64_t v4 = *(void *)(a1 + 40);
  if (v4)
  {
    (*(void (**)(uint64_t, id))(v4 + 16))(v4, v3);
  }
  else
  {
    id v5 = WBS_LOG_CHANNEL_PREFIXOther();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR)) {
      __79__WBSBrowsingDataImportServiceProxy__defaultProxyErrorHandlerWithReplyHandler___block_invoke_cold_1(v5, v3);
    }
  }
  objc_opt_class();
}

- (id)_defaultProxyErrorHandlerWithSimpleReplyHandler:(id)a3
{
  id v4 = a3;
  id v5 = self->_connection;
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __85__WBSBrowsingDataImportServiceProxy__defaultProxyErrorHandlerWithSimpleReplyHandler___block_invoke;
  v10[3] = &unk_1E615B808;
  v11 = v5;
  id v12 = v4;
  v6 = v5;
  id v7 = v4;
  id v8 = _Block_copy(v10);

  return v8;
}

void __85__WBSBrowsingDataImportServiceProxy__defaultProxyErrorHandlerWithSimpleReplyHandler___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  uint64_t v4 = *(void *)(a1 + 40);
  if (v4)
  {
    (*(void (**)(uint64_t, void, id))(v4 + 16))(v4, 0, v3);
  }
  else
  {
    id v5 = WBS_LOG_CHANNEL_PREFIXOther();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR)) {
      __79__WBSBrowsingDataImportServiceProxy__defaultProxyErrorHandlerWithReplyHandler___block_invoke_cold_1(v5, v3);
    }
  }
  objc_opt_class();
}

- (void)parseChromeExtensionsFromFileHandle:(id)a3 delegate:(id)a4 completionHandler:(id)a5
{
  proxy = self->_proxy;
  id v9 = a5;
  id v10 = a4;
  id v11 = a3;
  id v12 = [(WBSBrowsingDataImportServiceProxy *)self _defaultProxyErrorHandlerWithReplyHandler:v9];
  id v13 = [(NSXPCProxyCreating *)proxy remoteObjectProxyWithErrorHandler:v12];

  [v13 parseChromeExtensionsFromFileHandle:v11 delegate:v10 completionHandler:v9];
}

- (void)parseHistoryJSONFromFileHandle:(id)a3 ageLimit:(double)a4 delegate:(id)a5 completionHandler:(id)a6
{
  proxy = self->_proxy;
  id v11 = a6;
  id v12 = a5;
  id v13 = a3;
  v14 = [(WBSBrowsingDataImportServiceProxy *)self _defaultProxyErrorHandlerWithReplyHandler:v11];
  id v15 = [(NSXPCProxyCreating *)proxy remoteObjectProxyWithErrorHandler:v14];

  [v15 parseHistoryJSONFromFileHandle:v13 ageLimit:v12 delegate:v11 completionHandler:a4];
}

- (void)parseCreditCardJSONFromFileHandle:(id)a3 delegate:(id)a4 completionHandler:(id)a5
{
  proxy = self->_proxy;
  id v9 = a5;
  id v10 = a4;
  id v11 = a3;
  id v12 = [(WBSBrowsingDataImportServiceProxy *)self _defaultProxyErrorHandlerWithReplyHandler:v9];
  id v13 = [(NSXPCProxyCreating *)proxy remoteObjectProxyWithErrorHandler:v12];

  [v13 parseCreditCardJSONFromFileHandle:v11 delegate:v10 completionHandler:v9];
}

- (void)parseNetscapeBookmarkFromFileHandle:(id)a3 delegate:(id)a4 completionHandler:(id)a5
{
  proxy = self->_proxy;
  id v9 = a5;
  id v10 = a4;
  id v11 = a3;
  id v12 = [(WBSBrowsingDataImportServiceProxy *)self _defaultProxyErrorHandlerWithReplyHandler:v9];
  id v13 = [(NSXPCProxyCreating *)proxy remoteObjectProxyWithErrorHandler:v12];

  [v13 parseNetscapeBookmarkFromFileHandle:v11 delegate:v10 completionHandler:v9];
}

- (void)parseExtensionsFromFileHandle:(id)a3 delegate:(id)a4 completionHandler:(id)a5
{
  proxy = self->_proxy;
  id v9 = a5;
  id v10 = a4;
  id v11 = a3;
  id v12 = [(WBSBrowsingDataImportServiceProxy *)self _defaultProxyErrorHandlerWithReplyHandler:v9];
  id v13 = [(NSXPCProxyCreating *)proxy remoteObjectProxyWithErrorHandler:v12];

  [v13 parseExtensionsFromFileHandle:v11 delegate:v10 completionHandler:v9];
}

- (void)parseChromeHistoryJSONFromFileHandle:(id)a3 ageLimit:(double)a4 delegate:(id)a5 completionHandler:(id)a6
{
  proxy = self->_proxy;
  id v11 = a6;
  id v12 = a5;
  id v13 = a3;
  v14 = [(WBSBrowsingDataImportServiceProxy *)self _defaultProxyErrorHandlerWithReplyHandler:v11];
  id v15 = [(NSXPCProxyCreating *)proxy remoteObjectProxyWithErrorHandler:v14];

  [v15 parseChromeHistoryJSONFromFileHandle:v13 ageLimit:v12 delegate:v11 completionHandler:a4];
}

- (void)scanImportURLs:(id)a3 sandboxExtensions:(id)a4 completionHandler:(id)a5
{
  proxy = self->_proxy;
  id v9 = a5;
  id v10 = a4;
  id v11 = a3;
  id v12 = [(WBSBrowsingDataImportServiceProxy *)self _defaultProxyErrorHandlerWithSimpleReplyHandler:v9];
  id v13 = [(NSXPCProxyCreating *)proxy remoteObjectProxyWithErrorHandler:v12];

  [v13 scanImportURLs:v11 sandboxExtensions:v10 completionHandler:v9];
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_proxy, 0);
  objc_storeStrong((id *)&self->_connection, 0);
}

void __79__WBSBrowsingDataImportServiceProxy__defaultProxyErrorHandlerWithReplyHandler___block_invoke_cold_1(void *a1, void *a2)
{
  id v3 = a1;
  uint64_t v4 = objc_msgSend(a2, "safari_privacyPreservingDescription");
  OUTLINED_FUNCTION_0_3(&dword_1B728F000, v5, v6, "XPC Proxy reported: %{public}@", v7, v8, v9, v10, 2u);
}

@end