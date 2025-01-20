@interface WBSCloudHistoryServiceProxy
- (WBSCloudHistoryServiceProxy)initWithProxy:(id)a3;
- (id)_defaultProxyErrorHandlerWithSimpleReplyHandler:(id)a3;
- (void)fetchAndMergeChangesBypassingThrottler:(BOOL)a3 completionHandler:(id)a4;
- (void)fetchDateOfNextPermittedSaveChangesAttemptWithCompletionHandler:(id)a3;
- (void)resetForAccountChangeWithCompletionHandler:(id)a3;
- (void)saveChangesBypassingThrottler:(BOOL)a3 completionHandler:(id)a4;
- (void)updateConfiguration:(id)a3 completionHandler:(id)a4;
- (void)updateProfileLocalIdentifiersToServerIdentifiersMap:(id)a3 completionHandler:(id)a4;
@end

@implementation WBSCloudHistoryServiceProxy

- (WBSCloudHistoryServiceProxy)initWithProxy:(id)a3
{
  id v5 = a3;
  v10.receiver = self;
  v10.super_class = (Class)WBSCloudHistoryServiceProxy;
  v6 = [(WBSCloudHistoryServiceProxy *)&v10 init];
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_proxy, a3);
    v8 = v7;
  }

  return v7;
}

- (id)_defaultProxyErrorHandlerWithSimpleReplyHandler:(id)a3
{
  id v3 = a3;
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __79__WBSCloudHistoryServiceProxy__defaultProxyErrorHandlerWithSimpleReplyHandler___block_invoke;
  v7[3] = &unk_1E5C8DCF8;
  id v8 = v3;
  id v4 = v3;
  id v5 = (void *)MEMORY[0x1AD0C4F80](v7);

  return v5;
}

void __79__WBSCloudHistoryServiceProxy__defaultProxyErrorHandlerWithSimpleReplyHandler___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  uint64_t v4 = *(void *)(a1 + 32);
  if (v4)
  {
    (*(void (**)(uint64_t, void, id))(v4 + 16))(v4, 0, v3);
  }
  else
  {
    id v5 = WBS_LOG_CHANNEL_PREFIXCloudHistory();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR)) {
      __79__WBSCloudHistoryServiceProxy__defaultProxyErrorHandlerWithSimpleReplyHandler___block_invoke_cold_1(v5, v3);
    }
  }
}

- (void)fetchDateOfNextPermittedSaveChangesAttemptWithCompletionHandler:(id)a3
{
  proxy = self->_proxy;
  id v5 = a3;
  v6 = [(WBSCloudHistoryServiceProxy *)self _defaultProxyErrorHandlerWithSimpleReplyHandler:v5];
  id v7 = [(NSXPCProxyCreating *)proxy remoteObjectProxyWithErrorHandler:v6];

  [v7 fetchDateOfNextPermittedSaveChangesAttemptWithCompletionHandler:v5];
}

- (void)updateConfiguration:(id)a3 completionHandler:(id)a4
{
  proxy = self->_proxy;
  id v6 = a4;
  id v7 = a3;
  id v8 = [(NSXPCProxyCreating *)proxy remoteObjectProxyWithErrorHandler:v6];
  [v8 updateConfiguration:v7 completionHandler:v6];
}

- (void)resetForAccountChangeWithCompletionHandler:(id)a3
{
  proxy = self->_proxy;
  id v4 = a3;
  id v5 = [(NSXPCProxyCreating *)proxy remoteObjectProxyWithErrorHandler:v4];
  [v5 resetForAccountChangeWithCompletionHandler:v4];
}

- (void)fetchAndMergeChangesBypassingThrottler:(BOOL)a3 completionHandler:(id)a4
{
  BOOL v4 = a3;
  proxy = self->_proxy;
  id v6 = a4;
  id v7 = [(NSXPCProxyCreating *)proxy remoteObjectProxyWithErrorHandler:v6];
  [v7 fetchAndMergeChangesBypassingThrottler:v4 completionHandler:v6];
}

- (void)saveChangesBypassingThrottler:(BOOL)a3 completionHandler:(id)a4
{
  BOOL v4 = a3;
  proxy = self->_proxy;
  id v6 = a4;
  id v7 = [(NSXPCProxyCreating *)proxy remoteObjectProxyWithErrorHandler:v6];
  [v7 saveChangesBypassingThrottler:v4 completionHandler:v6];
}

- (void)updateProfileLocalIdentifiersToServerIdentifiersMap:(id)a3 completionHandler:(id)a4
{
  proxy = self->_proxy;
  id v6 = a4;
  id v7 = a3;
  id v8 = [(NSXPCProxyCreating *)proxy remoteObjectProxyWithErrorHandler:v6];
  [v8 updateProfileLocalIdentifiersToServerIdentifiersMap:v7 completionHandler:v6];
}

- (void).cxx_destruct
{
}

void __79__WBSCloudHistoryServiceProxy__defaultProxyErrorHandlerWithSimpleReplyHandler___block_invoke_cold_1(void *a1, void *a2)
{
  uint64_t v7 = *MEMORY[0x1E4F143B8];
  id v3 = a1;
  BOOL v4 = objc_msgSend(a2, "safari_privacyPreservingDescription");
  int v5 = 138543362;
  id v6 = v4;
  _os_log_error_impl(&dword_1A6B5F000, v3, OS_LOG_TYPE_ERROR, "XPC Proxy reported: %{public}@", (uint8_t *)&v5, 0xCu);
}

@end