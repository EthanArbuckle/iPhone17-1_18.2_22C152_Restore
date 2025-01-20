@interface PAAccessPruner
+ (id)sharedInstance;
- (NSXPCConnection)connection;
- (OS_dispatch_queue)queue;
- (PAAccessPruner)initWithConnection:(id)a3 queue:(id)a4;
- (PAAccessPruner)initWithQueue:(id)a3;
- (void)dealloc;
- (void)pruneEventsFromStartTime:(double)a3 toEndTime:(double)a4 completionHandler:(id)a5;
@end

@implementation PAAccessPruner

+ (id)sharedInstance
{
  if (sharedInstance_onceToken != -1) {
    dispatch_once(&sharedInstance_onceToken, &__block_literal_global);
  }
  v2 = (void *)sharedInstance_instance;

  return v2;
}

uint64_t __32__PAAccessPruner_sharedInstance__block_invoke()
{
  sharedInstance_instance = [[PAAccessPruner alloc] initWithQueue:0];

  return MEMORY[0x1F41817F8]();
}

- (PAAccessPruner)initWithQueue:(id)a3
{
  id v4 = a3;
  if (_os_feature_enabled_impl()) {
    v5 = (void *)[objc_alloc(MEMORY[0x1E4F29268]) initWithMachServiceName:@"com.apple.privacyaccountingd" options:4096];
  }
  else {
    v5 = 0;
  }
  v6 = [(PAAccessPruner *)self initWithConnection:v5 queue:v4];
  v7 = v6;
  if (v6) {
    [(NSXPCConnection *)v6->_connection resume];
  }

  return v7;
}

- (PAAccessPruner)initWithConnection:(id)a3 queue:(id)a4
{
  id v7 = a3;
  dispatch_queue_t v8 = (dispatch_queue_t)a4;
  v14.receiver = self;
  v14.super_class = (Class)PAAccessPruner;
  v9 = [(PAAccessPruner *)&v14 init];
  if (v9)
  {
    PARegisterUserInfoValueProviderForPAErrorDomain();
    if (!v8)
    {
      v10 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
      v11 = dispatch_get_global_queue(21, 0);
      dispatch_queue_t v8 = dispatch_queue_create_with_target_V2("com.apple.privacyaccounting.PAAccessPruner", v10, v11);
    }
    objc_storeStrong((id *)&v9->_queue, v8);
    [v7 _setQueue:v9->_queue];
    v12 = [MEMORY[0x1E4F29280] interfaceWithProtocol:&unk_1EFF87D48];
    [v7 setRemoteObjectInterface:v12];
    objc_storeStrong((id *)&v9->_connection, a3);
  }
  return v9;
}

- (void)pruneEventsFromStartTime:(double)a3 toEndTime:(double)a4 completionHandler:(id)a5
{
  id v8 = a5;
  v9 = (void (**)(void, void))v8;
  if (self->_connection)
  {
    v11[0] = MEMORY[0x1E4F143A8];
    v11[1] = 3221225472;
    v11[2] = __71__PAAccessPruner_pruneEventsFromStartTime_toEndTime_completionHandler___block_invoke;
    v11[3] = &unk_1E5D70E70;
    v11[4] = self;
    id v12 = v8;
    double v13 = a3;
    double v14 = a4;
    _os_activity_initiate(&dword_1A8FA5000, "PAAccessPruner -pruneEventsFromStartTime:toEndTime:completionHandler:", OS_ACTIVITY_FLAG_DEFAULT, v11);
  }
  else
  {
    v10 = [MEMORY[0x1E4F28C58] errorWithDomain:@"PAErrorDomain" code:1 userInfo:0];
    ((void (**)(void, void *))v9)[2](v9, v10);
  }
}

void __71__PAAccessPruner_pruneEventsFromStartTime_toEndTime_completionHandler___block_invoke(uint64_t a1)
{
  v2 = *(void **)(*(void *)(a1 + 32) + 8);
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __71__PAAccessPruner_pruneEventsFromStartTime_toEndTime_completionHandler___block_invoke_2;
  v4[3] = &unk_1E5D70E48;
  id v5 = *(id *)(a1 + 40);
  v3 = [v2 remoteObjectProxyWithErrorHandler:v4];
  [v3 pruneEventsFromStartTime:*(void *)(a1 + 40) toEndTime:*(double *)(a1 + 48) reply:*(double *)(a1 + 56)];
}

uint64_t __71__PAAccessPruner_pruneEventsFromStartTime_toEndTime_completionHandler___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)dealloc
{
  [(NSXPCConnection *)self->_connection invalidate];
  v3.receiver = self;
  v3.super_class = (Class)PAAccessPruner;
  [(PAAccessPruner *)&v3 dealloc];
}

- (NSXPCConnection)connection
{
  return self->_connection;
}

- (OS_dispatch_queue)queue
{
  return self->_queue;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_queue, 0);

  objc_storeStrong((id *)&self->_connection, 0);
}

@end