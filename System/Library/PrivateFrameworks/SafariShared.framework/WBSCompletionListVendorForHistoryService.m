@interface WBSCompletionListVendorForHistoryService
- (BOOL)listener:(id)a3 shouldAcceptNewConnection:(id)a4;
- (WBSCompletionListVendorForHistoryService)initWithDataSource:(id)a3;
- (WBSCompletionListVendorForHistoryServiceDataSource)dataSource;
- (void)_connect;
@end

@implementation WBSCompletionListVendorForHistoryService

- (WBSCompletionListVendorForHistoryService)initWithDataSource:(id)a3
{
  id v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)WBSCompletionListVendorForHistoryService;
  v5 = [(WBSCompletionListVendorForHistoryService *)&v9 init];
  v6 = v5;
  if (v5)
  {
    objc_storeWeak((id *)&v5->_dataSource, v4);
    [(WBSCompletionListVendorForHistoryService *)v6 _connect];
    v7 = v6;
  }

  return v6;
}

- (void)_connect
{
  v3 = [MEMORY[0x1E4F29290] anonymousListener];
  xpcListener = self->_xpcListener;
  self->_xpcListener = v3;

  [(NSXPCListener *)self->_xpcListener setDelegate:self];
  [(NSXPCListener *)self->_xpcListener resume];
  v5 = objc_alloc_init(WBSHistoryConnectionProxy);
  historyProxy = self->_historyProxy;
  self->_historyProxy = v5;

  v7 = self->_historyProxy;
  id v8 = [(NSXPCListener *)self->_xpcListener endpoint];
  [(WBSHistoryConnectionProxy *)v7 setCompletionListVendorEndpoint:v8 completionHandler:&__block_literal_global_23];
}

void __52__WBSCompletionListVendorForHistoryService__connect__block_invoke(uint64_t a1, void *a2)
{
  id v2 = a2;
  v3 = WBS_LOG_CHANNEL_PREFIXHistory();
  id v4 = v3;
  if (v2)
  {
    if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR)) {
      __52__WBSCompletionListVendorForHistoryService__connect__block_invoke_cold_1(v4, v2);
    }
  }
  else if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)v5 = 0;
    _os_log_impl(&dword_1A6B5F000, v4, OS_LOG_TYPE_INFO, "Successfully sent completion list endpoint to history service.", v5, 2u);
  }
}

- (BOOL)listener:(id)a3 shouldAcceptNewConnection:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = v7;
  if (v7) {
    [v7 auditToken];
  }
  char HasEntitlement = WBSAuditTokenHasEntitlement();
  if (HasEntitlement)
  {
    [(WBSCompletionListVendorForHistoryService *)self _setExportedInterfaceAndObjectForConnection:v8];
    [v8 resume];
  }
  else
  {
    v10 = WBS_LOG_CHANNEL_PREFIXHistory();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR)) {
      -[WBSCompletionListVendorForHistoryService listener:shouldAcceptNewConnection:](v10);
    }
  }

  return HasEntitlement;
}

- (WBSCompletionListVendorForHistoryServiceDataSource)dataSource
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_dataSource);
  return (WBSCompletionListVendorForHistoryServiceDataSource *)WeakRetained;
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_dataSource);
  objc_storeStrong(&self->_completionListItemsCallback, 0);
  objc_storeStrong((id *)&self->_historyProxy, 0);
  objc_storeStrong((id *)&self->_xpcListener, 0);
}

void __52__WBSCompletionListVendorForHistoryService__connect__block_invoke_cold_1(void *a1, void *a2)
{
  uint64_t v7 = *MEMORY[0x1E4F143B8];
  v3 = a1;
  id v4 = objc_msgSend(a2, "safari_privacyPreservingDescription");
  int v5 = 138543362;
  id v6 = v4;
  _os_log_error_impl(&dword_1A6B5F000, v3, OS_LOG_TYPE_ERROR, "Error sending completion list endpoint to history service: %{public}@", (uint8_t *)&v5, 0xCu);
}

- (void)listener:(os_log_t)log shouldAcceptNewConnection:.cold.1(os_log_t log)
{
  *(_WORD *)v1 = 0;
  _os_log_error_impl(&dword_1A6B5F000, log, OS_LOG_TYPE_ERROR, "The completion list vendor has rejected an incoming connection due to missing entitlements.", v1, 2u);
}

@end