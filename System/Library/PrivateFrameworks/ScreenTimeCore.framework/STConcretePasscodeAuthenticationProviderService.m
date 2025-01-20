@interface STConcretePasscodeAuthenticationProviderService
- (NSXPCListenerEndpoint)clientListenerEndpoint;
- (STConcretePasscodeAuthenticationProviderService)initWithClientListenerEndpoint:(id)a3;
- (id)description;
- (id)pendingAuthenticationCompletionHandler;
- (void)authenticatePasscodeWithCommunicationServiceProxy:(id)a3 completionHandler:(id)a4;
- (void)receivePasscodeAuthenticationResult:(id)a3 completionHandler:(id)a4;
- (void)setPendingAuthenticationCompletionHandler:(id)a3;
@end

@implementation STConcretePasscodeAuthenticationProviderService

- (id)description
{
  v3 = NSString;
  uint64_t v4 = objc_opt_class();
  v5 = [(STConcretePasscodeAuthenticationProviderService *)self pendingAuthenticationCompletionHandler];
  v6 = [v3 stringWithFormat:@"<%@ { Pending: %ld }>", v4, v5 != 0];

  return v6;
}

- (STConcretePasscodeAuthenticationProviderService)initWithClientListenerEndpoint:(id)a3
{
  uint64_t v4 = (NSXPCListenerEndpoint *)a3;
  v8.receiver = self;
  v8.super_class = (Class)STConcretePasscodeAuthenticationProviderService;
  v5 = [(STConcretePasscodeAuthenticationProviderService *)&v8 init];
  clientListenerEndpoint = v5->_clientListenerEndpoint;
  v5->_clientListenerEndpoint = v4;

  return v5;
}

- (void)authenticatePasscodeWithCommunicationServiceProxy:(id)a3 completionHandler:(id)a4
{
  id v6 = a3;
  [(STConcretePasscodeAuthenticationProviderService *)self setPendingAuthenticationCompletionHandler:a4];
  id v7 = [(STConcretePasscodeAuthenticationProviderService *)self clientListenerEndpoint];
  [v6 authenticatePasscodeForUserWithEndpoint:v7 completionHandler:&__block_literal_global_6];
}

void __119__STConcretePasscodeAuthenticationProviderService_authenticatePasscodeWithCommunicationServiceProxy_completionHandler___block_invoke()
{
  v0 = +[STLog passcodeAuthenticationProviderService];
  if (os_log_type_enabled(v0, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v1 = 0;
    _os_log_impl(&dword_1DA519000, v0, OS_LOG_TYPE_DEFAULT, "Prompted for passcode authentication", v1, 2u);
  }
}

- (void)receivePasscodeAuthenticationResult:(id)a3 completionHandler:(id)a4
{
  id v6 = a3;
  id v7 = (void (**)(id, void))a4;
  objc_super v8 = [(STConcretePasscodeAuthenticationProviderService *)self pendingAuthenticationCompletionHandler];
  if (v8)
  {
    v9 = +[STLog passcodeAuthenticationProviderService];
    v10 = v9;
    if (v6)
    {
      if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)v14 = 0;
        _os_log_impl(&dword_1DA519000, v10, OS_LOG_TYPE_DEFAULT, "Resolving pending completion with authentication result", v14, 2u);
      }

      ((void (**)(void, id, void))v8)[2](v8, v6, 0);
    }
    else
    {
      if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR)) {
        -[STConcretePasscodeAuthenticationProviderService receivePasscodeAuthenticationResult:completionHandler:](v10);
      }

      v13 = (void *)[objc_alloc(MEMORY[0x1E4F28C58]) initWithDomain:@"STErrorDomain" code:51 userInfo:0];
      ((void (**)(void, void, void *))v8)[2](v8, 0, v13);
    }
    [(STConcretePasscodeAuthenticationProviderService *)self setPendingAuthenticationCompletionHandler:0];
    v7[2](v7, 0);
  }
  else
  {
    v11 = +[STLog passcodeAuthenticationProviderService];
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR)) {
      -[STConcretePasscodeAuthenticationProviderService receivePasscodeAuthenticationResult:completionHandler:](v11);
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

- (id)pendingAuthenticationCompletionHandler
{
  return objc_getProperty(self, a2, 16, 1);
}

- (void)setPendingAuthenticationCompletionHandler:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_pendingAuthenticationCompletionHandler, 0);
  objc_storeStrong((id *)&self->_clientListenerEndpoint, 0);
}

- (void)receivePasscodeAuthenticationResult:(os_log_t)log completionHandler:.cold.1(os_log_t log)
{
  *(_WORD *)v1 = 0;
  _os_log_error_impl(&dword_1DA519000, log, OS_LOG_TYPE_ERROR, "No pending completion handler to resolve with authentication result", v1, 2u);
}

- (void)receivePasscodeAuthenticationResult:(os_log_t)log completionHandler:.cold.2(os_log_t log)
{
  *(_WORD *)v1 = 0;
  _os_log_error_impl(&dword_1DA519000, log, OS_LOG_TYPE_ERROR, "Resolving pending completion with error", v1, 2u);
}

@end