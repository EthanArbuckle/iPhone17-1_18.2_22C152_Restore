@interface STAskClient
+ (id)_newConnection;
- (BOOL)respondToAskForTimeRequestWithIdentifier:(id)a3 answer:(int64_t)a4 error:(id *)a5;
- (NSXPCConnection)connection;
- (STAskClient)init;
- (STAskServiceClient)askServiceClient;
- (void)dealloc;
- (void)setAskServiceClient:(id)a3;
@end

@implementation STAskClient

- (STAskClient)init
{
  v8.receiver = self;
  v8.super_class = (Class)STAskClient;
  v2 = [(STAskClient *)&v8 init];
  if (_os_feature_enabled_impl())
  {
    v3 = [[STAskServiceClient alloc] initWithAlternateMachService];
    askServiceClient = v2->_askServiceClient;
    v2->_askServiceClient = v3;
  }
  else
  {
    v5 = +[STAskClient _newConnection];
    connection = v2->_connection;
    v2->_connection = v5;

    [(NSXPCConnection *)v2->_connection resume];
  }
  return v2;
}

- (void)dealloc
{
  if ((_os_feature_enabled_impl() & 1) == 0) {
    [(NSXPCConnection *)self->_connection invalidate];
  }
  v3.receiver = self;
  v3.super_class = (Class)STAskClient;
  [(STAskClient *)&v3 dealloc];
}

+ (id)_newConnection
{
  v2 = (void *)[objc_alloc(MEMORY[0x1E4F29268]) initWithMachServiceName:@"com.apple.ScreenTimeAgent.ask" options:4096];
  objc_super v3 = [MEMORY[0x1E4F29280] interfaceWithProtocol:&unk_1F34B5108];
  [v2 setRemoteObjectInterface:v3];

  return v2;
}

- (BOOL)respondToAskForTimeRequestWithIdentifier:(id)a3 answer:(int64_t)a4 error:(id *)a5
{
  uint64_t v28 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  v9 = +[STLog askClient];
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    if ((unint64_t)(a4 - 1) > 2) {
      v10 = @"Not Approved";
    }
    else {
      v10 = off_1E6BC8280[a4 - 1];
    }
    *(_DWORD *)buf = 138543618;
    *(void *)&buf[4] = v8;
    *(_WORD *)&buf[12] = 2114;
    *(void *)&buf[14] = v10;
    _os_log_impl(&dword_1DA519000, v9, OS_LOG_TYPE_DEFAULT, "Responding to ask for time request: %{public}@ - response: %{public}@", buf, 0x16u);
  }

  *(void *)buf = 0;
  *(void *)&buf[8] = buf;
  *(void *)&buf[16] = 0x3032000000;
  v25 = __Block_byref_object_copy__19;
  v26 = __Block_byref_object_dispose__19;
  id v27 = 0;
  if (_os_feature_enabled_impl())
  {
    v11 = [(STAskClient *)self askServiceClient];
    char v12 = [v11 respondToAskForTimeRequestWithIdentifier:v8 answer:a4 error:a5];
  }
  else
  {
    v13 = [(STAskClient *)self connection];
    v19[0] = MEMORY[0x1E4F143A8];
    v19[1] = 3221225472;
    v19[2] = __69__STAskClient_respondToAskForTimeRequestWithIdentifier_answer_error___block_invoke;
    v19[3] = &unk_1E6BC6F68;
    v19[4] = buf;
    v14 = [v13 synchronousRemoteObjectProxyWithErrorHandler:v19];

    v18[0] = MEMORY[0x1E4F143A8];
    v18[1] = 3221225472;
    v18[2] = __69__STAskClient_respondToAskForTimeRequestWithIdentifier_answer_error___block_invoke_2;
    v18[3] = &unk_1E6BC6F68;
    v18[4] = buf;
    [v14 respondToAskForTimeRequestWithIdentifier:v8 answer:a4 completionHandler:v18];

    v15 = +[STLog askClient];
    if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v16 = *(void *)(*(void *)&buf[8] + 40);
      *(_DWORD *)v20 = 138543618;
      id v21 = v8;
      __int16 v22 = 2114;
      uint64_t v23 = v16;
      _os_log_impl(&dword_1DA519000, v15, OS_LOG_TYPE_DEFAULT, "Responded to ask for time request: %{public}@ - Error: %{public}@", v20, 0x16u);
    }

    if (a5) {
      *a5 = *(id *)(*(void *)&buf[8] + 40);
    }
    char v12 = *(void *)(*(void *)&buf[8] + 40) == 0;
  }
  _Block_object_dispose(buf, 8);

  return v12;
}

void __69__STAskClient_respondToAskForTimeRequestWithIdentifier_answer_error___block_invoke(uint64_t a1, void *a2)
{
}

void __69__STAskClient_respondToAskForTimeRequestWithIdentifier_answer_error___block_invoke_2(uint64_t a1, void *a2)
{
}

- (NSXPCConnection)connection
{
  return (NSXPCConnection *)objc_getProperty(self, a2, 8, 1);
}

- (STAskServiceClient)askServiceClient
{
  return self->_askServiceClient;
}

- (void)setAskServiceClient:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_askServiceClient, 0);
  objc_storeStrong((id *)&self->_connection, 0);
}

@end