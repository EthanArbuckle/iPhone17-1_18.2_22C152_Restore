@interface WBSHistoryServiceDatabaseDelegateProxy
- (WBSHistoryServiceDatabaseDelegateProxy)init;
- (WBSHistoryServiceDatabaseDelegateProxy)initWithProxy:(id)a3;
- (void)handleEvent:(id)a3 completionHandler:(id)a4;
- (void)reportPermanentIDsForItems:(id)a3 completionHandler:(id)a4;
- (void)reportPermanentIDsForVisits:(id)a3 completionHandler:(id)a4;
- (void)reportSevereError:(id)a3 completionHandler:(id)a4;
@end

@implementation WBSHistoryServiceDatabaseDelegateProxy

- (WBSHistoryServiceDatabaseDelegateProxy)initWithProxy:(id)a3
{
  id v5 = a3;
  v10.receiver = self;
  v10.super_class = (Class)WBSHistoryServiceDatabaseDelegateProxy;
  v6 = [(WBSHistoryServiceDatabaseDelegateProxy *)&v10 init];
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_proxy, a3);
    v8 = v7;
  }

  return v7;
}

- (WBSHistoryServiceDatabaseDelegateProxy)init
{
  return 0;
}

- (void)reportPermanentIDsForItems:(id)a3 completionHandler:(id)a4
{
  proxy = self->_proxy;
  id v6 = a4;
  id v7 = a3;
  id v8 = [(NSXPCProxyCreating *)proxy remoteObjectProxyWithErrorHandler:v6];
  [v8 reportPermanentIDsForItems:v7 completionHandler:v6];
}

- (void)reportPermanentIDsForVisits:(id)a3 completionHandler:(id)a4
{
  proxy = self->_proxy;
  id v6 = a4;
  id v7 = a3;
  id v8 = [(NSXPCProxyCreating *)proxy remoteObjectProxyWithErrorHandler:v6];
  [v8 reportPermanentIDsForVisits:v7 completionHandler:v6];
}

- (void)reportSevereError:(id)a3 completionHandler:(id)a4
{
  id v6 = a4;
  proxy = self->_proxy;
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = __78__WBSHistoryServiceDatabaseDelegateProxy_reportSevereError_completionHandler___block_invoke;
  v11[3] = &unk_1E5C8DCF8;
  id v12 = v6;
  id v8 = v6;
  id v9 = a3;
  objc_super v10 = [(NSXPCProxyCreating *)proxy remoteObjectProxyWithErrorHandler:v11];
  [v10 reportSevereError:v9 completionHandler:v8];
}

uint64_t __78__WBSHistoryServiceDatabaseDelegateProxy_reportSevereError_completionHandler___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)handleEvent:(id)a3 completionHandler:(id)a4
{
  proxy = self->_proxy;
  id v6 = a4;
  id v7 = a3;
  id v8 = [(NSXPCProxyCreating *)proxy remoteObjectProxyWithErrorHandler:v6];
  [v8 handleEvent:v7 completionHandler:v6];
}

- (void).cxx_destruct
{
}

@end