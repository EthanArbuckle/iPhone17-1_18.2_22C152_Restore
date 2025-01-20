@interface TRAuthenticationOperationHandler
- (TRAuthenticationOperationHandler)initWithCompanionAuthHandler:(id)a3 proxyAuthHandler:(id)a4;
- (TRAuthenticationOperationHandler)initWithCompanionAuthHandlerWithError:(id)a3 proxyAuthHandler:(id)a4;
- (TRCompanionAuthOperationHandler)companionAuthHandler;
- (TRProxyAuthOperationHandler)proxyAuthHandler;
- (void)registerMessageHandlersForSession:(id)a3;
- (void)setCompanionAuthHandler:(id)a3;
- (void)setProxyAuthHandler:(id)a3;
@end

@implementation TRAuthenticationOperationHandler

- (TRAuthenticationOperationHandler)initWithCompanionAuthHandler:(id)a3 proxyAuthHandler:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v20.receiver = self;
  v20.super_class = (Class)TRAuthenticationOperationHandler;
  v8 = [(TRAuthenticationOperationHandler *)&v20 init];
  if (v8)
  {
    v9 = [TRCompanionAuthOperationHandler alloc];
    v18[0] = MEMORY[0x263EF8330];
    v18[1] = 3221225472;
    v18[2] = __82__TRAuthenticationOperationHandler_initWithCompanionAuthHandler_proxyAuthHandler___block_invoke;
    v18[3] = &unk_264221070;
    id v19 = v6;
    uint64_t v10 = [(TRCompanionAuthOperationHandler *)v9 initWithCompanionAuthHandler:v18];
    companionAuthHandler = v8->_companionAuthHandler;
    v8->_companionAuthHandler = (TRCompanionAuthOperationHandler *)v10;

    v12 = [TRProxyAuthOperationHandler alloc];
    v16[0] = MEMORY[0x263EF8330];
    v16[1] = 3221225472;
    v16[2] = __82__TRAuthenticationOperationHandler_initWithCompanionAuthHandler_proxyAuthHandler___block_invoke_2;
    v16[3] = &unk_264221070;
    id v17 = v7;
    uint64_t v13 = [(TRProxyAuthOperationHandler *)v12 initWithProxyAuthHandler:v16];
    proxyAuthHandler = v8->_proxyAuthHandler;
    v8->_proxyAuthHandler = (TRProxyAuthOperationHandler *)v13;
  }
  return v8;
}

uint64_t __82__TRAuthenticationOperationHandler_initWithCompanionAuthHandler_proxyAuthHandler___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

uint64_t __82__TRAuthenticationOperationHandler_initWithCompanionAuthHandler_proxyAuthHandler___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (TRAuthenticationOperationHandler)initWithCompanionAuthHandlerWithError:(id)a3 proxyAuthHandler:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v20.receiver = self;
  v20.super_class = (Class)TRAuthenticationOperationHandler;
  v8 = [(TRAuthenticationOperationHandler *)&v20 init];
  if (v8)
  {
    v9 = [TRCompanionAuthOperationHandler alloc];
    v18[0] = MEMORY[0x263EF8330];
    v18[1] = 3221225472;
    v18[2] = __91__TRAuthenticationOperationHandler_initWithCompanionAuthHandlerWithError_proxyAuthHandler___block_invoke;
    v18[3] = &unk_264221098;
    id v19 = v6;
    uint64_t v10 = [(TRCompanionAuthOperationHandler *)v9 initWithCompanionAuthHandlerWithError:v18];
    companionAuthHandler = v8->_companionAuthHandler;
    v8->_companionAuthHandler = (TRCompanionAuthOperationHandler *)v10;

    v12 = [TRProxyAuthOperationHandler alloc];
    v16[0] = MEMORY[0x263EF8330];
    v16[1] = 3221225472;
    v16[2] = __91__TRAuthenticationOperationHandler_initWithCompanionAuthHandlerWithError_proxyAuthHandler___block_invoke_2;
    v16[3] = &unk_264221098;
    id v17 = v7;
    uint64_t v13 = [(TRProxyAuthOperationHandler *)v12 initWithProxyAuthHandlerWithError:v16];
    proxyAuthHandler = v8->_proxyAuthHandler;
    v8->_proxyAuthHandler = (TRProxyAuthOperationHandler *)v13;
  }
  return v8;
}

uint64_t __91__TRAuthenticationOperationHandler_initWithCompanionAuthHandlerWithError_proxyAuthHandler___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

uint64_t __91__TRAuthenticationOperationHandler_initWithCompanionAuthHandlerWithError_proxyAuthHandler___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)registerMessageHandlersForSession:(id)a3
{
  companionAuthHandler = self->_companionAuthHandler;
  id v5 = a3;
  [(TRCompanionAuthOperationHandler *)companionAuthHandler registerMessageHandlersForSession:v5];
  [(TRProxyAuthOperationHandler *)self->_proxyAuthHandler registerMessageHandlersForSession:v5];
}

- (TRCompanionAuthOperationHandler)companionAuthHandler
{
  return self->_companionAuthHandler;
}

- (void)setCompanionAuthHandler:(id)a3
{
}

- (TRProxyAuthOperationHandler)proxyAuthHandler
{
  return self->_proxyAuthHandler;
}

- (void)setProxyAuthHandler:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_proxyAuthHandler, 0);
  objc_storeStrong((id *)&self->_companionAuthHandler, 0);
}

@end