@interface STConcretePasscodeProviderService
- (NSXPCListenerEndpoint)clientListenerEndpoint;
- (STConcretePasscodeProviderService)initWithClientListenerEndpoint:(id)a3;
- (id)description;
- (id)pendingProvidePasscodeCompletionHandler;
- (void)collectPasscodeWithSetupServiceProxy:(id)a3 completionHandler:(id)a4;
- (void)receivePasscode:(id)a3 completionHandler:(id)a4;
- (void)setPendingProvidePasscodeCompletionHandler:(id)a3;
@end

@implementation STConcretePasscodeProviderService

- (id)description
{
  v3 = NSString;
  uint64_t v4 = objc_opt_class();
  v5 = [(STConcretePasscodeProviderService *)self pendingProvidePasscodeCompletionHandler];
  v6 = [v3 stringWithFormat:@"<%@ { Pending: %ld }>", v4, v5 != 0];

  return v6;
}

- (STConcretePasscodeProviderService)initWithClientListenerEndpoint:(id)a3
{
  uint64_t v4 = (NSXPCListenerEndpoint *)a3;
  v8.receiver = self;
  v8.super_class = (Class)STConcretePasscodeProviderService;
  v5 = [(STConcretePasscodeProviderService *)&v8 init];
  clientListenerEndpoint = v5->_clientListenerEndpoint;
  v5->_clientListenerEndpoint = v4;

  return v5;
}

- (void)collectPasscodeWithSetupServiceProxy:(id)a3 completionHandler:(id)a4
{
  id v6 = a3;
  [(STConcretePasscodeProviderService *)self setPendingProvidePasscodeCompletionHandler:a4];
  id v7 = [(STConcretePasscodeProviderService *)self clientListenerEndpoint];
  [v6 promptForPasscodeFromUserWithEndpoint:v7 completionHandler:&__block_literal_global_7];
}

void __92__STConcretePasscodeProviderService_collectPasscodeWithSetupServiceProxy_completionHandler___block_invoke()
{
  v0 = +[STLog passcodeProviderService];
  if (os_log_type_enabled(v0, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v1 = 0;
    _os_log_impl(&dword_1DA519000, v0, OS_LOG_TYPE_DEFAULT, "Prompted for passcode collection", v1, 2u);
  }
}

- (void)receivePasscode:(id)a3 completionHandler:(id)a4
{
  id v6 = a3;
  id v7 = (void (**)(id, void))a4;
  objc_super v8 = [(STConcretePasscodeProviderService *)self pendingProvidePasscodeCompletionHandler];
  if (v8)
  {
    v9 = +[STLog passcodeProviderService];
    v10 = v9;
    if (v6)
    {
      if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)v14 = 0;
        _os_log_impl(&dword_1DA519000, v10, OS_LOG_TYPE_DEFAULT, "Resolving pending completion with passcode", v14, 2u);
      }

      ((void (**)(void, id, void))v8)[2](v8, v6, 0);
    }
    else
    {
      if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR)) {
        -[STConcretePasscodeAuthenticationProviderService receivePasscodeAuthenticationResult:completionHandler:](v10);
      }

      v13 = (void *)[objc_alloc(MEMORY[0x1E4F28C58]) initWithDomain:@"STErrorDomain" code:48 userInfo:0];
      ((void (**)(void, void, void *))v8)[2](v8, 0, v13);
    }
    [(STConcretePasscodeProviderService *)self setPendingProvidePasscodeCompletionHandler:0];
    v7[2](v7, 0);
  }
  else
  {
    v11 = +[STLog passcodeProviderService];
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR)) {
      -[STConcretePasscodeProviderService receivePasscode:completionHandler:](v11);
    }

    uint64_t v12 = [objc_alloc(MEMORY[0x1E4F28C58]) initWithDomain:@"STErrorDomain" code:1 userInfo:0];
    v7[2](v7, v12);

    id v7 = (void (**)(id, void))v12;
  }
}

- (NSXPCListenerEndpoint)clientListenerEndpoint
{
  return (NSXPCListenerEndpoint *)objc_getProperty(self, a2, 8, 1);
}

- (id)pendingProvidePasscodeCompletionHandler
{
  return objc_getProperty(self, a2, 16, 1);
}

- (void)setPendingProvidePasscodeCompletionHandler:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_pendingProvidePasscodeCompletionHandler, 0);
  objc_storeStrong((id *)&self->_clientListenerEndpoint, 0);
}

- (void)receivePasscode:(os_log_t)log completionHandler:.cold.1(os_log_t log)
{
  *(_WORD *)v1 = 0;
  _os_log_error_impl(&dword_1DA519000, log, OS_LOG_TYPE_ERROR, "No pending completion handler to resolve with passcode", v1, 2u);
}

@end