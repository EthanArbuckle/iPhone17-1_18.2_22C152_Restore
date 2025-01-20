@interface TRNetworkOperationHandler
- (TRNetworkOperationHandler)initWithJoinNetworkHandler:(id)a3;
- (id)joinNetworkHandler;
- (void)_handleNetworkRequest:(id)a3 withResponseHandler:(id)a4;
- (void)registerMessageHandlersForSession:(id)a3;
- (void)setJoinNetworkHandler:(id)a3;
@end

@implementation TRNetworkOperationHandler

- (TRNetworkOperationHandler)initWithJoinNetworkHandler:(id)a3
{
  id v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)TRNetworkOperationHandler;
  v5 = [(TRNetworkOperationHandler *)&v9 init];
  if (v5)
  {
    uint64_t v6 = [v4 copy];
    id joinNetworkHandler = v5->_joinNetworkHandler;
    v5->_id joinNetworkHandler = (id)v6;
  }
  return v5;
}

- (void)registerMessageHandlersForSession:(id)a3
{
  id v4 = a3;
  objc_initWeak(&location, self);
  v5[0] = MEMORY[0x263EF8330];
  v5[1] = 3221225472;
  v5[2] = __63__TRNetworkOperationHandler_registerMessageHandlersForSession___block_invoke;
  v5[3] = &unk_264220E10;
  objc_copyWeak(&v6, &location);
  [v4 setRequestHandler:v5 forRequestClass:objc_opt_class()];
  objc_destroyWeak(&v6);
  objc_destroyWeak(&location);
}

void __63__TRNetworkOperationHandler_registerMessageHandlersForSession___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v7 = a2;
  id v5 = a3;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained _handleNetworkRequest:v7 withResponseHandler:v5];
}

- (void)_handleNetworkRequest:(id)a3 withResponseHandler:(id)a4
{
  v17[2] = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v7 = a4;
  if (self->_joinNetworkHandler)
  {
    v8 = [v6 networkSSID];
    objc_super v9 = [v6 networkPassword];
    if (v8)
    {
      v10 = [MEMORY[0x263EFF9A0] dictionary];
      [v10 setObject:v8 forKey:@"TRNetworkOperationHandlerParamKeyNetworkSSID"];
      if (v9) {
        [v10 setObject:v9 forKey:@"TRNetworkOperationHandlerParamKeyNetworkSSID"];
      }
      v11 = (void *)[v10 copy];
      id joinNetworkHandler = (void (**)(id, void *, void *))self->_joinNetworkHandler;
      v14[0] = MEMORY[0x263EF8330];
      v14[1] = 3221225472;
      v14[2] = __71__TRNetworkOperationHandler__handleNetworkRequest_withResponseHandler___block_invoke;
      v14[3] = &unk_264220B00;
      id v15 = v7;
      joinNetworkHandler[2](joinNetworkHandler, v11, v14);
    }
    else
    {
      uint64_t v13 = *MEMORY[0x263F08338];
      v16[0] = *MEMORY[0x263F08320];
      v16[1] = v13;
      v17[0] = @"Invalid Message Parameters";
      v17[1] = @"Missing SSID parameter";
      v10 = [NSDictionary dictionaryWithObjects:v17 forKeys:v16 count:2];
      v11 = [MEMORY[0x263F087E8] errorWithDomain:@"TRNearbyDeviceErrorDomain" code:-10002 userInfo:v10];
      (*((void (**)(id, void *, void))v7 + 2))(v7, v11, 0);
    }
  }
  else
  {
    v8 = [MEMORY[0x263F087E8] errorWithDomain:@"TRNearbyDeviceErrorDomain" code:-9001 userInfo:0];
    (*((void (**)(id, void *, void))v7 + 2))(v7, v8, 0);
  }
}

void __71__TRNetworkOperationHandler__handleNetworkRequest_withResponseHandler___block_invoke(uint64_t a1, uint64_t a2)
{
  id v4 = objc_alloc_init(TRSetupNetworkResponse);
  [(TRSetupNetworkResponse *)v4 setHasNetwork:a2];
  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (id)joinNetworkHandler
{
  return self->_joinNetworkHandler;
}

- (void)setJoinNetworkHandler:(id)a3
{
}

- (void).cxx_destruct
{
}

@end