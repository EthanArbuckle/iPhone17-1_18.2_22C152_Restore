@interface TRSetupHandler
- (TRSetupHandler)initWithDelegate:(id)a3;
- (TRSetupHandlerDelegate)delegate;
- (void)_handleActivationRequest:(id)a3 withResponseHandler:(id)a4;
- (void)_handleCompanionAuthenticationRequest:(id)a3 withResponseHandler:(id)a4;
- (void)_handleCompletionRequest:(id)a3 withResponseHandler:(id)a4;
- (void)_handleConfigurationRequest:(id)a3 withResponseHandler:(id)a4;
- (void)_handleHandshakeRequest:(id)a3 withResponseHandler:(id)a4;
- (void)_handleNetworkRequest:(id)a3 withResponseHandler:(id)a4;
- (void)_handleProxyAuthenticationRequest:(id)a3 withResponseHandler:(id)a4;
- (void)_handleProxyDeviceRequest:(id)a3 withResponseHandler:(id)a4;
- (void)registerMessageHandlersForSession:(id)a3;
- (void)setDelegate:(id)a3;
@end

@implementation TRSetupHandler

- (TRSetupHandler)initWithDelegate:(id)a3
{
  id v4 = a3;
  v8.receiver = self;
  v8.super_class = (Class)TRSetupHandler;
  v5 = [(TRSetupHandler *)&v8 init];
  v6 = v5;
  if (v5) {
    objc_storeWeak((id *)&v5->_delegate, v4);
  }

  return v6;
}

- (void)registerMessageHandlersForSession:(id)a3
{
  v12[0] = MEMORY[0x263EF8330];
  v12[1] = 3221225472;
  v12[2] = __52__TRSetupHandler_registerMessageHandlersForSession___block_invoke;
  v12[3] = &unk_264220738;
  v12[4] = self;
  id v4 = a3;
  [v4 setRequestHandler:v12 forRequestClass:objc_opt_class()];
  v11[0] = MEMORY[0x263EF8330];
  v11[1] = 3221225472;
  v11[2] = __52__TRSetupHandler_registerMessageHandlersForSession___block_invoke_2;
  v11[3] = &unk_264220738;
  v11[4] = self;
  [v4 setRequestHandler:v11 forRequestClass:objc_opt_class()];
  v10[0] = MEMORY[0x263EF8330];
  v10[1] = 3221225472;
  v10[2] = __52__TRSetupHandler_registerMessageHandlersForSession___block_invoke_3;
  v10[3] = &unk_264220738;
  v10[4] = self;
  [v4 setRequestHandler:v10 forRequestClass:objc_opt_class()];
  v9[0] = MEMORY[0x263EF8330];
  v9[1] = 3221225472;
  v9[2] = __52__TRSetupHandler_registerMessageHandlersForSession___block_invoke_4;
  v9[3] = &unk_264220738;
  v9[4] = self;
  [v4 setRequestHandler:v9 forRequestClass:objc_opt_class()];
  v8[0] = MEMORY[0x263EF8330];
  v8[1] = 3221225472;
  v8[2] = __52__TRSetupHandler_registerMessageHandlersForSession___block_invoke_5;
  v8[3] = &unk_264220738;
  v8[4] = self;
  [v4 setRequestHandler:v8 forRequestClass:objc_opt_class()];
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __52__TRSetupHandler_registerMessageHandlersForSession___block_invoke_6;
  v7[3] = &unk_264220738;
  v7[4] = self;
  [v4 setRequestHandler:v7 forRequestClass:objc_opt_class()];
  v6[0] = MEMORY[0x263EF8330];
  v6[1] = 3221225472;
  v6[2] = __52__TRSetupHandler_registerMessageHandlersForSession___block_invoke_7;
  v6[3] = &unk_264220738;
  v6[4] = self;
  [v4 setRequestHandler:v6 forRequestClass:objc_opt_class()];
  v5[0] = MEMORY[0x263EF8330];
  v5[1] = 3221225472;
  v5[2] = __52__TRSetupHandler_registerMessageHandlersForSession___block_invoke_8;
  v5[3] = &unk_264220738;
  v5[4] = self;
  [v4 setRequestHandler:v5 forRequestClass:objc_opt_class()];
}

uint64_t __52__TRSetupHandler_registerMessageHandlersForSession___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return [*(id *)(a1 + 32) _handleHandshakeRequest:a2 withResponseHandler:a3];
}

uint64_t __52__TRSetupHandler_registerMessageHandlersForSession___block_invoke_2(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return [*(id *)(a1 + 32) _handleConfigurationRequest:a2 withResponseHandler:a3];
}

uint64_t __52__TRSetupHandler_registerMessageHandlersForSession___block_invoke_3(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return [*(id *)(a1 + 32) _handleNetworkRequest:a2 withResponseHandler:a3];
}

uint64_t __52__TRSetupHandler_registerMessageHandlersForSession___block_invoke_4(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return [*(id *)(a1 + 32) _handleActivationRequest:a2 withResponseHandler:a3];
}

uint64_t __52__TRSetupHandler_registerMessageHandlersForSession___block_invoke_5(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return [*(id *)(a1 + 32) _handleCompanionAuthenticationRequest:a2 withResponseHandler:a3];
}

uint64_t __52__TRSetupHandler_registerMessageHandlersForSession___block_invoke_6(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return [*(id *)(a1 + 32) _handleProxyDeviceRequest:a2 withResponseHandler:a3];
}

uint64_t __52__TRSetupHandler_registerMessageHandlersForSession___block_invoke_7(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return [*(id *)(a1 + 32) _handleProxyAuthenticationRequest:a2 withResponseHandler:a3];
}

uint64_t __52__TRSetupHandler_registerMessageHandlersForSession___block_invoke_8(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return [*(id *)(a1 + 32) _handleCompletionRequest:a2 withResponseHandler:a3];
}

- (void)_handleHandshakeRequest:(id)a3 withResponseHandler:(id)a4
{
  id v4 = (void (**)(id, void, TRHandshakeResponse *))a4;
  v5 = objc_alloc_init(TRHandshakeResponse);
  [(TRHandshakeResponse *)v5 setProtocolVersion:0];
  v4[2](v4, 0, v5);
}

- (void)_handleConfigurationRequest:(id)a3 withResponseHandler:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  objc_super v8 = [(TRSetupHandler *)self delegate];
  if (objc_opt_respondsToSelector() & 1) != 0 || (objc_opt_respondsToSelector())
  {
    v9 = [v6 deviceName];
    v10 = [MEMORY[0x263EFF9A0] dictionary];
    v11 = v10;
    if (v9) {
      [v10 setObject:v9 forKey:@"DeviceName"];
    }
    v12 = (void *)[v11 copy];
    if (objc_opt_respondsToSelector())
    {
      [v8 setupHandler:self configurationWithParams:v12 completion:v7];
    }
    else
    {
      v14[0] = MEMORY[0x263EF8330];
      v14[1] = 3221225472;
      v14[2] = __66__TRSetupHandler__handleConfigurationRequest_withResponseHandler___block_invoke;
      v14[3] = &unk_264220900;
      id v15 = v7;
      [v8 setupHandler:self prepareConfigurationWithParams:v12 completion:v14];
    }
  }
  else
  {
    v13 = [MEMORY[0x263F087E8] errorWithDomain:@"TRNearbyDeviceErrorDomain" code:-9001 userInfo:0];
    (*((void (**)(id, void *, void))v7 + 2))(v7, v13, 0);
  }
}

void __66__TRSetupHandler__handleConfigurationRequest_withResponseHandler___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  id v5 = a3;
  id v6 = objc_alloc_init(TRSetupConfigurationResponse);
  [(TRSetupConfigurationResponse *)v6 setNeedsNetwork:a2];
  [(TRSetupConfigurationResponse *)v6 setUnauthenticatedAccountServices:v5];

  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)_handleNetworkRequest:(id)a3 withResponseHandler:(id)a4
{
  v17[2] = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v7 = a4;
  objc_super v8 = [(TRSetupHandler *)self delegate];
  if (objc_opt_respondsToSelector())
  {
    v9 = [v6 networkSSID];
    v10 = [v6 networkPassword];
    if (v9)
    {
      v11 = [MEMORY[0x263EFF9A0] dictionary];
      [v11 setObject:v9 forKey:@"NetworkSSID"];
      if (v10) {
        [v11 setObject:v10 forKey:@"NetworkPassword"];
      }
      v12 = (void *)[v11 copy];
      v14[0] = MEMORY[0x263EF8330];
      v14[1] = 3221225472;
      v14[2] = __60__TRSetupHandler__handleNetworkRequest_withResponseHandler___block_invoke;
      v14[3] = &unk_264220B00;
      id v15 = v7;
      [v8 setupHandler:self joinNetworkWithParams:v12 completion:v14];
    }
    else
    {
      uint64_t v13 = *MEMORY[0x263F08338];
      v16[0] = *MEMORY[0x263F08320];
      v16[1] = v13;
      v17[0] = @"Invalid Message Parameters";
      v17[1] = @"Missing SSID parameter";
      v11 = [NSDictionary dictionaryWithObjects:v17 forKeys:v16 count:2];
      v12 = [MEMORY[0x263F087E8] errorWithDomain:@"TRNearbyDeviceErrorDomain" code:-9202 userInfo:v11];
      (*((void (**)(id, void *, void))v7 + 2))(v7, v12, 0);
    }
  }
  else
  {
    v9 = [MEMORY[0x263F087E8] errorWithDomain:@"TRNearbyDeviceErrorDomain" code:-9001 userInfo:0];
    (*((void (**)(id, void *, void))v7 + 2))(v7, v9, 0);
  }
}

void __60__TRSetupHandler__handleNetworkRequest_withResponseHandler___block_invoke(uint64_t a1, uint64_t a2)
{
  id v4 = objc_alloc_init(TRSetupNetworkResponse);
  [(TRSetupNetworkResponse *)v4 setHasNetwork:a2];
  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)_handleActivationRequest:(id)a3 withResponseHandler:(id)a4
{
  id v5 = a4;
  id v6 = [(TRSetupHandler *)self delegate];
  if (objc_opt_respondsToSelector() & 1) != 0 || (objc_opt_respondsToSelector())
  {
    if (objc_opt_respondsToSelector())
    {
      v11[0] = MEMORY[0x263EF8330];
      v11[1] = 3221225472;
      v11[2] = __63__TRSetupHandler__handleActivationRequest_withResponseHandler___block_invoke;
      v11[3] = &unk_264220B28;
      id v12 = v5;
      [v6 setupHandler:self activateWithCompletionWithError:v11];
      id v7 = v12;
    }
    else
    {
      v9[0] = MEMORY[0x263EF8330];
      v9[1] = 3221225472;
      v9[2] = __63__TRSetupHandler__handleActivationRequest_withResponseHandler___block_invoke_2;
      v9[3] = &unk_264220B00;
      id v10 = v5;
      [v6 setupHandler:self activateWithCompletion:v9];
      id v7 = v10;
    }
  }
  else
  {
    objc_super v8 = [MEMORY[0x263F087E8] errorWithDomain:@"TRNearbyDeviceErrorDomain" code:-9001 userInfo:0];
    (*((void (**)(id, void *, void))v5 + 2))(v5, v8, 0);
  }
}

void __63__TRSetupHandler__handleActivationRequest_withResponseHandler___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  id v5 = a3;
  id v6 = objc_alloc_init(TRSetupActivationResponse);
  [(TRSetupActivationResponse *)v6 setActivated:a2];
  [(TRSetupActivationResponse *)v6 setError:v5];

  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
}

void __63__TRSetupHandler__handleActivationRequest_withResponseHandler___block_invoke_2(uint64_t a1, uint64_t a2)
{
  id v4 = objc_alloc_init(TRSetupActivationResponse);
  [(TRSetupActivationResponse *)v4 setActivated:a2];
  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)_handleCompanionAuthenticationRequest:(id)a3 withResponseHandler:(id)a4
{
  v36[2] = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v7 = a4;
  objc_super v8 = [(TRSetupHandler *)self delegate];
  if (objc_opt_respondsToSelector() & 1) != 0 || (objc_opt_respondsToSelector())
  {
    v9 = [v6 account];
    id v10 = [v6 targetedAccountServices];
    v11 = [v6 companionDevice];
    uint64_t v12 = [v6 shouldUseAIDA];
    if (v9)
    {
      if (v10)
      {
        if (v11)
        {
          v29[0] = @"Account";
          v29[1] = @"TargetedAccountServices";
          v30[0] = v9;
          v30[1] = v10;
          v30[2] = v11;
          v29[2] = @"CompanionDevice";
          v29[3] = @"UseAIDA";
          uint64_t v13 = [NSNumber numberWithBool:v12];
          v30[3] = v13;
          v14 = [NSDictionary dictionaryWithObjects:v30 forKeys:v29 count:4];

          if (objc_opt_respondsToSelector())
          {
            v27[0] = MEMORY[0x263EF8330];
            v27[1] = 3221225472;
            v27[2] = __76__TRSetupHandler__handleCompanionAuthenticationRequest_withResponseHandler___block_invoke;
            v27[3] = &unk_264220B50;
            id v15 = &v28;
            id v28 = v7;
            [v8 setupHandler:self performCompanionAuthenticationWithParams:v14 completionWithErrorAuthResults:v27];
          }
          else if (objc_opt_respondsToSelector())
          {
            v25[0] = MEMORY[0x263EF8330];
            v25[1] = 3221225472;
            v25[2] = __76__TRSetupHandler__handleCompanionAuthenticationRequest_withResponseHandler___block_invoke_2;
            v25[3] = &unk_264220978;
            id v15 = &v26;
            id v26 = v7;
            [v8 setupHandler:self performCompanionAuthenticationWithParams:v14 completionWithError:v25];
          }
          else
          {
            v23[0] = MEMORY[0x263EF8330];
            v23[1] = 3221225472;
            v23[2] = __76__TRSetupHandler__handleCompanionAuthenticationRequest_withResponseHandler___block_invoke_3;
            v23[3] = &unk_2642209A0;
            id v15 = &v24;
            id v24 = v7;
            [v8 setupHandler:self performCompanionAuthenticationWithParams:v14 completion:v23];
          }
          v22 = *v15;
          goto LABEL_17;
        }
        uint64_t v21 = *MEMORY[0x263F08338];
        v31[0] = *MEMORY[0x263F08320];
        v31[1] = v21;
        v32[0] = @"Invalid Message Parameters";
        v32[1] = @"Missing companionDevice parameter";
        v17 = NSDictionary;
        v18 = v32;
        v19 = v31;
      }
      else
      {
        uint64_t v20 = *MEMORY[0x263F08338];
        v33[0] = *MEMORY[0x263F08320];
        v33[1] = v20;
        v34[0] = @"Invalid Message Parameters";
        v34[1] = @"Missing targetedAccountServices parameter";
        v17 = NSDictionary;
        v18 = v34;
        v19 = v33;
      }
    }
    else
    {
      uint64_t v16 = *MEMORY[0x263F08338];
      v35[0] = *MEMORY[0x263F08320];
      v35[1] = v16;
      v36[0] = @"Invalid Message Parameters";
      v36[1] = @"Missing account parameter";
      v17 = NSDictionary;
      v18 = v36;
      v19 = v35;
    }
    v14 = [v17 dictionaryWithObjects:v18 forKeys:v19 count:2];
    v22 = [MEMORY[0x263F087E8] errorWithDomain:@"TRNearbyDeviceErrorDomain" code:-9202 userInfo:v14];
    (*((void (**)(id, void *, void))v7 + 2))(v7, v22, 0);
LABEL_17:

    goto LABEL_18;
  }
  v9 = [MEMORY[0x263F087E8] errorWithDomain:@"TRNearbyDeviceErrorDomain" code:-9001 userInfo:0];
  (*((void (**)(id, void *, void))v7 + 2))(v7, v9, 0);
LABEL_18:
}

void __76__TRSetupHandler__handleCompanionAuthenticationRequest_withResponseHandler___block_invoke(uint64_t a1, void *a2, void *a3, void *a4)
{
  id v7 = a4;
  id v8 = a3;
  id v9 = a2;
  id v10 = objc_alloc_init(TRSetupAuthenticationResponse);
  [(TRSetupAuthenticationResponse *)v10 setUnauthenticatedAccountServices:v9];

  [(TRSetupAuthenticationResponse *)v10 setError:v8];
  [(TRSetupAuthenticationResponse *)v10 setAuthenticationResults:v7];

  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
}

void __76__TRSetupHandler__handleCompanionAuthenticationRequest_withResponseHandler___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v5 = a3;
  id v6 = a2;
  id v7 = objc_alloc_init(TRSetupAuthenticationResponse);
  [(TRSetupAuthenticationResponse *)v7 setUnauthenticatedAccountServices:v6];

  [(TRSetupAuthenticationResponse *)v7 setError:v5];
  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
}

void __76__TRSetupHandler__handleCompanionAuthenticationRequest_withResponseHandler___block_invoke_3(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = objc_alloc_init(TRSetupAuthenticationResponse);
  [(TRSetupAuthenticationResponse *)v4 setUnauthenticatedAccountServices:v3];

  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)_handleProxyDeviceRequest:(id)a3 withResponseHandler:(id)a4
{
  id v4 = (void *)MEMORY[0x263F291C0];
  id v5 = (void (**)(id, void, TRSetupProxyDeviceResponse *))a4;
  id v7 = [v4 currentDevice];
  [v7 setLinkType:3];
  id v6 = objc_alloc_init(TRSetupProxyDeviceResponse);
  [(TRSetupProxyDeviceResponse *)v6 setProxyDevice:v7];
  v5[2](v5, 0, v6);
}

- (void)_handleProxyAuthenticationRequest:(id)a3 withResponseHandler:(id)a4
{
  v36[2] = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v7 = a4;
  id v8 = [(TRSetupHandler *)self delegate];
  if (objc_opt_respondsToSelector() & 1) != 0 || (objc_opt_respondsToSelector())
  {
    id v9 = [v6 account];
    id v10 = [v6 rawPassword];
    v11 = [v6 targetedAccountServices];
    uint64_t v12 = [v6 shouldUseAIDA];
    if (v9)
    {
      if (v10)
      {
        if (v11)
        {
          v29[0] = @"Account";
          v29[1] = @"TargetedAccountServices";
          v30[0] = v9;
          v30[1] = v11;
          v30[2] = v10;
          v29[2] = @"AccountRawPassword";
          v29[3] = @"UseAIDA";
          uint64_t v13 = [NSNumber numberWithBool:v12];
          v30[3] = v13;
          v14 = [NSDictionary dictionaryWithObjects:v30 forKeys:v29 count:4];

          if (objc_opt_respondsToSelector())
          {
            v27[0] = MEMORY[0x263EF8330];
            v27[1] = 3221225472;
            v27[2] = __72__TRSetupHandler__handleProxyAuthenticationRequest_withResponseHandler___block_invoke;
            v27[3] = &unk_264220B50;
            id v15 = &v28;
            id v28 = v7;
            [v8 setupHandler:self performProxyAuthenticationWithParamsAuthResult:v14 completionWithErrorAuthResults:v27];
          }
          else if (objc_opt_respondsToSelector())
          {
            v25[0] = MEMORY[0x263EF8330];
            v25[1] = 3221225472;
            v25[2] = __72__TRSetupHandler__handleProxyAuthenticationRequest_withResponseHandler___block_invoke_2;
            v25[3] = &unk_264220978;
            id v15 = &v26;
            id v26 = v7;
            [v8 setupHandler:self performProxyAuthenticationWithParams:v14 completionWithError:v25];
          }
          else
          {
            v23[0] = MEMORY[0x263EF8330];
            v23[1] = 3221225472;
            v23[2] = __72__TRSetupHandler__handleProxyAuthenticationRequest_withResponseHandler___block_invoke_3;
            v23[3] = &unk_2642209A0;
            id v15 = &v24;
            id v24 = v7;
            [v8 setupHandler:self performProxyAuthenticationWithParams:v14 completion:v23];
          }
          v22 = *v15;
          goto LABEL_17;
        }
        uint64_t v21 = *MEMORY[0x263F08338];
        v31[0] = *MEMORY[0x263F08320];
        v31[1] = v21;
        v32[0] = @"Invalid Message Parameters";
        v32[1] = @"Missing targetedAccountServices parameter";
        v17 = NSDictionary;
        v18 = v32;
        v19 = v31;
      }
      else
      {
        uint64_t v20 = *MEMORY[0x263F08338];
        v33[0] = *MEMORY[0x263F08320];
        v33[1] = v20;
        v34[0] = @"Invalid Message Parameters";
        v34[1] = @"Missing accountRawPassword parameter";
        v17 = NSDictionary;
        v18 = v34;
        v19 = v33;
      }
    }
    else
    {
      uint64_t v16 = *MEMORY[0x263F08338];
      v35[0] = *MEMORY[0x263F08320];
      v35[1] = v16;
      v36[0] = @"Invalid Message Parameters";
      v36[1] = @"Missing account parameter";
      v17 = NSDictionary;
      v18 = v36;
      v19 = v35;
    }
    v14 = [v17 dictionaryWithObjects:v18 forKeys:v19 count:2];
    v22 = [MEMORY[0x263F087E8] errorWithDomain:@"TRNearbyDeviceErrorDomain" code:-9202 userInfo:v14];
    (*((void (**)(id, void *, void))v7 + 2))(v7, v22, 0);
LABEL_17:

    goto LABEL_18;
  }
  id v9 = [MEMORY[0x263F087E8] errorWithDomain:@"TRNearbyDeviceErrorDomain" code:-9001 userInfo:0];
  (*((void (**)(id, void *, void))v7 + 2))(v7, v9, 0);
LABEL_18:
}

void __72__TRSetupHandler__handleProxyAuthenticationRequest_withResponseHandler___block_invoke(uint64_t a1, void *a2, void *a3, void *a4)
{
  id v7 = a4;
  id v8 = a3;
  id v9 = a2;
  id v10 = objc_alloc_init(TRSetupAuthenticationResponse);
  [(TRSetupAuthenticationResponse *)v10 setUnauthenticatedAccountServices:v9];

  [(TRSetupAuthenticationResponse *)v10 setError:v8];
  [(TRSetupAuthenticationResponse *)v10 setAuthenticationResults:v7];

  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
}

void __72__TRSetupHandler__handleProxyAuthenticationRequest_withResponseHandler___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v5 = a3;
  id v6 = a2;
  id v7 = objc_alloc_init(TRSetupAuthenticationResponse);
  [(TRSetupAuthenticationResponse *)v7 setUnauthenticatedAccountServices:v6];

  [(TRSetupAuthenticationResponse *)v7 setError:v5];
  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
}

void __72__TRSetupHandler__handleProxyAuthenticationRequest_withResponseHandler___block_invoke_3(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = objc_alloc_init(TRSetupAuthenticationResponse);
  [(TRSetupAuthenticationResponse *)v4 setUnauthenticatedAccountServices:v3];

  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)_handleCompletionRequest:(id)a3 withResponseHandler:(id)a4
{
  id v9 = a3;
  id v6 = (void (**)(id, void, TRSetupCompletionResponse *))a4;
  id v7 = [(TRSetupHandler *)self delegate];
  if (objc_opt_respondsToSelector())
  {
    id v8 = objc_alloc_init(TRSetupCompletionResponse);
    v6[2](v6, 0, v8);

    objc_msgSend(v7, "setupHandler:didCompleteSuccessfully:errorCode:", self, objc_msgSend(v9, "completedSuccessfully"), objc_msgSend(v9, "errorCode"));
  }
  else
  {
    id v8 = [MEMORY[0x263F087E8] errorWithDomain:@"TRNearbyDeviceErrorDomain" code:-9001 userInfo:0];
    ((void (**)(id, TRSetupCompletionResponse *, TRSetupCompletionResponse *))v6)[2](v6, v8, 0);
  }
}

- (TRSetupHandlerDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  return (TRSetupHandlerDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (void).cxx_destruct
{
}

@end