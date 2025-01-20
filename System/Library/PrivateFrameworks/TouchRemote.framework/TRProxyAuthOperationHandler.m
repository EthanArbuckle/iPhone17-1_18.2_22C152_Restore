@interface TRProxyAuthOperationHandler
- (TRProxyAuthOperationHandler)initWithProxyAuthHandler:(id)a3;
- (TRProxyAuthOperationHandler)initWithProxyAuthHandlerWithError:(id)a3;
- (id)proxyAuthHandler;
- (id)proxyAuthHandlerWithError;
- (void)_handleProxyAuthenticationRequest:(id)a3 withResponseHandler:(id)a4;
- (void)_handleProxyDeviceRequest:(id)a3 withResponseHandler:(id)a4;
- (void)registerMessageHandlersForSession:(id)a3;
- (void)setProxyAuthHandler:(id)a3;
- (void)setProxyAuthHandlerWithError:(id)a3;
@end

@implementation TRProxyAuthOperationHandler

- (TRProxyAuthOperationHandler)initWithProxyAuthHandler:(id)a3
{
  id v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)TRProxyAuthOperationHandler;
  v5 = [(TRProxyAuthOperationHandler *)&v9 init];
  if (v5)
  {
    uint64_t v6 = [v4 copy];
    id proxyAuthHandler = v5->_proxyAuthHandler;
    v5->_id proxyAuthHandler = (id)v6;
  }
  return v5;
}

- (TRProxyAuthOperationHandler)initWithProxyAuthHandlerWithError:(id)a3
{
  id v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)TRProxyAuthOperationHandler;
  v5 = [(TRProxyAuthOperationHandler *)&v9 init];
  if (v5)
  {
    uint64_t v6 = [v4 copy];
    id proxyAuthHandlerWithError = v5->_proxyAuthHandlerWithError;
    v5->_id proxyAuthHandlerWithError = (id)v6;
  }
  return v5;
}

- (void)registerMessageHandlersForSession:(id)a3
{
  v6[0] = MEMORY[0x263EF8330];
  v6[1] = 3221225472;
  v6[2] = __65__TRProxyAuthOperationHandler_registerMessageHandlersForSession___block_invoke;
  v6[3] = &unk_264220738;
  v6[4] = self;
  id v4 = a3;
  [v4 setRequestHandler:v6 forRequestClass:objc_opt_class()];
  v5[0] = MEMORY[0x263EF8330];
  v5[1] = 3221225472;
  v5[2] = __65__TRProxyAuthOperationHandler_registerMessageHandlersForSession___block_invoke_2;
  v5[3] = &unk_264220738;
  v5[4] = self;
  [v4 setRequestHandler:v5 forRequestClass:objc_opt_class()];
}

uint64_t __65__TRProxyAuthOperationHandler_registerMessageHandlersForSession___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return [*(id *)(a1 + 32) _handleProxyDeviceRequest:a2 withResponseHandler:a3];
}

uint64_t __65__TRProxyAuthOperationHandler_registerMessageHandlersForSession___block_invoke_2(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return [*(id *)(a1 + 32) _handleProxyAuthenticationRequest:a2 withResponseHandler:a3];
}

- (void)_handleProxyDeviceRequest:(id)a3 withResponseHandler:(id)a4
{
  id v4 = (void *)MEMORY[0x263F291C0];
  v5 = (void (**)(id, void, TRSetupProxyDeviceResponse *))a4;
  id v7 = [v4 currentDevice];
  [v7 setLinkType:3];
  uint64_t v6 = objc_alloc_init(TRSetupProxyDeviceResponse);
  [(TRSetupProxyDeviceResponse *)v6 setProxyDevice:v7];
  v5[2](v5, 0, v6);
}

- (void)_handleProxyAuthenticationRequest:(id)a3 withResponseHandler:(id)a4
{
  v35[2] = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v7 = a4;
  if (*(_OWORD *)&self->_proxyAuthHandler != 0)
  {
    v20 = [v6 account];
    v8 = [v6 rawPassword];
    objc_super v9 = [v6 targetedAccountServices];
    uint64_t v10 = [v6 shouldUseAIDA];
    if (v20)
    {
      if (v8)
      {
        if (v9)
        {
          v28[0] = @"TRProxyAuthOperationHandlerParamKeyAccount";
          v28[1] = @"TRProxyAuthOperationHandlerParamKeyTargetedAccountServices";
          v29[0] = v20;
          v29[1] = v9;
          v29[2] = v8;
          v28[2] = @"TRProxyAuthOperationHandlerParamKeyAccountRawPassword";
          v28[3] = @"TRProxyAuthOperationHandlerParamKeyUseAIDA";
          v11 = [NSNumber numberWithBool:v10];
          v29[3] = v11;
          v12 = [NSDictionary dictionaryWithObjects:v29 forKeys:v28 count:4];

          id proxyAuthHandlerWithError = (void (**)(id, void *, void *))self->_proxyAuthHandlerWithError;
          if (proxyAuthHandlerWithError)
          {
            v26[0] = MEMORY[0x263EF8330];
            v26[1] = 3221225472;
            v26[2] = __85__TRProxyAuthOperationHandler__handleProxyAuthenticationRequest_withResponseHandler___block_invoke;
            v26[3] = &unk_264220978;
            v14 = &v27;
            id v27 = v7;
            proxyAuthHandlerWithError[2](proxyAuthHandlerWithError, v12, v26);
          }
          else
          {
            id proxyAuthHandler = (void (**)(id, void *, void *))self->_proxyAuthHandler;
            v24[0] = MEMORY[0x263EF8330];
            v24[1] = 3221225472;
            v24[2] = __85__TRProxyAuthOperationHandler__handleProxyAuthenticationRequest_withResponseHandler___block_invoke_2;
            v24[3] = &unk_2642209A0;
            v14 = &v25;
            id v25 = v7;
            proxyAuthHandler[2](proxyAuthHandler, v12, v24);
          }
          v22 = *v14;
          goto LABEL_14;
        }
        uint64_t v21 = *MEMORY[0x263F08338];
        v30[0] = *MEMORY[0x263F08320];
        v30[1] = v21;
        v31[0] = @"Invalid Message Parameters";
        v31[1] = @"Missing targetedAccountServices parameter";
        v16 = NSDictionary;
        v17 = v31;
        v18 = v30;
      }
      else
      {
        uint64_t v19 = *MEMORY[0x263F08338];
        v32[0] = *MEMORY[0x263F08320];
        v32[1] = v19;
        v33[0] = @"Invalid Message Parameters";
        v33[1] = @"Missing accountRawPassword parameter";
        v16 = NSDictionary;
        v17 = v33;
        v18 = v32;
      }
    }
    else
    {
      uint64_t v15 = *MEMORY[0x263F08338];
      v34[0] = *MEMORY[0x263F08320];
      v34[1] = v15;
      v35[0] = @"Invalid Message Parameters";
      v35[1] = @"Missing account parameter";
      v16 = NSDictionary;
      v17 = v35;
      v18 = v34;
    }
    v12 = [v16 dictionaryWithObjects:v17 forKeys:v18 count:2];
    v22 = [MEMORY[0x263F087E8] errorWithDomain:@"TRNearbyDeviceErrorDomain" code:-9202 userInfo:v12];
    (*((void (**)(id, void *, void))v7 + 2))(v7, v22, 0);
LABEL_14:

    goto LABEL_15;
  }
  v20 = [MEMORY[0x263F087E8] errorWithDomain:@"TRNearbyDeviceErrorDomain" code:-9001 userInfo:0];
  (*((void (**)(id, void *, void))v7 + 2))(v7, v20, 0);
LABEL_15:
}

void __85__TRProxyAuthOperationHandler__handleProxyAuthenticationRequest_withResponseHandler___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5 = a3;
  id v6 = a2;
  id v7 = objc_alloc_init(TRSetupAuthenticationResponse);
  [(TRSetupAuthenticationResponse *)v7 setUnauthenticatedAccountServices:v6];

  [(TRSetupAuthenticationResponse *)v7 setError:v5];
  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
}

void __85__TRProxyAuthOperationHandler__handleProxyAuthenticationRequest_withResponseHandler___block_invoke_2(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = objc_alloc_init(TRSetupAuthenticationResponse);
  [(TRSetupAuthenticationResponse *)v4 setUnauthenticatedAccountServices:v3];

  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (id)proxyAuthHandler
{
  return self->_proxyAuthHandler;
}

- (void)setProxyAuthHandler:(id)a3
{
}

- (id)proxyAuthHandlerWithError
{
  return self->_proxyAuthHandlerWithError;
}

- (void)setProxyAuthHandlerWithError:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_proxyAuthHandlerWithError, 0);
  objc_storeStrong(&self->_proxyAuthHandler, 0);
}

@end