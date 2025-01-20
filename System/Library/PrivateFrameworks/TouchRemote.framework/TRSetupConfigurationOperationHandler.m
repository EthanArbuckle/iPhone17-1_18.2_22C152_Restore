@interface TRSetupConfigurationOperationHandler
- (TRSetupConfigurationOperationHandler)initWithConfigurationHandler:(id)a3;
- (id)configurationHandler;
- (void)_handleConfigurationRequest:(id)a3 withResponseHandler:(id)a4;
- (void)registerMessageHandlersForSession:(id)a3;
- (void)setConfigurationHandler:(id)a3;
@end

@implementation TRSetupConfigurationOperationHandler

- (TRSetupConfigurationOperationHandler)initWithConfigurationHandler:(id)a3
{
  id v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)TRSetupConfigurationOperationHandler;
  v5 = [(TRSetupConfigurationOperationHandler *)&v9 init];
  if (v5)
  {
    uint64_t v6 = MEMORY[0x2166AC110](v4);
    id configurationHandler = v5->_configurationHandler;
    v5->_id configurationHandler = (id)v6;
  }
  return v5;
}

- (void)registerMessageHandlersForSession:(id)a3
{
  v4[0] = MEMORY[0x263EF8330];
  v4[1] = 3221225472;
  v4[2] = __74__TRSetupConfigurationOperationHandler_registerMessageHandlersForSession___block_invoke;
  v4[3] = &unk_264220738;
  v4[4] = self;
  id v3 = a3;
  [v3 setRequestHandler:v4 forRequestClass:objc_opt_class()];
}

uint64_t __74__TRSetupConfigurationOperationHandler_registerMessageHandlersForSession___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return [*(id *)(a1 + 32) _handleConfigurationRequest:a2 withResponseHandler:a3];
}

- (void)_handleConfigurationRequest:(id)a3 withResponseHandler:(id)a4
{
  id v6 = a4;
  if (self->_configurationHandler)
  {
    v7 = [a3 deviceName];
    v8 = [MEMORY[0x263EFF9A0] dictionary];
    objc_super v9 = v8;
    if (v7) {
      [v8 setObject:v7 forKey:@"TRSetupConfigurationOperationHandlerParamKeyDeviceName"];
    }
    v10 = (void *)[v9 copy];
    id configurationHandler = (void (**)(id, void *, void *))self->_configurationHandler;
    v12[0] = MEMORY[0x263EF8330];
    v12[1] = 3221225472;
    v12[2] = __88__TRSetupConfigurationOperationHandler__handleConfigurationRequest_withResponseHandler___block_invoke;
    v12[3] = &unk_264220900;
    id v13 = v6;
    configurationHandler[2](configurationHandler, v10, v12);
  }
  else
  {
    v7 = [MEMORY[0x263F087E8] errorWithDomain:@"TRNearbyDeviceErrorDomain" code:-9001 userInfo:0];
    (*((void (**)(id, void *, void))v6 + 2))(v6, v7, 0);
  }
}

void __88__TRSetupConfigurationOperationHandler__handleConfigurationRequest_withResponseHandler___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  id v5 = a3;
  id v6 = objc_alloc_init(TRSetupConfigurationResponse);
  [(TRSetupConfigurationResponse *)v6 setNeedsNetwork:a2];
  [(TRSetupConfigurationResponse *)v6 setUnauthenticatedAccountServices:v5];

  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (id)configurationHandler
{
  return self->_configurationHandler;
}

- (void)setConfigurationHandler:(id)a3
{
}

- (void).cxx_destruct
{
}

@end