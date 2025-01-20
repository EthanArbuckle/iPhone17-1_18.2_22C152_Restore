@interface WFTask
+ (WFServiceConnection)sharedServiceConnection;
- (BOOL)isCancelled;
- (BOOL)requiresResponse;
- (NSProgress)progress;
- (WFTask)init;
- (WFTask)initWithResponseRequired:(BOOL)a3;
- (WFTaskIdentifier)identifier;
- (void)cancel;
- (void)executeSynchronously;
- (void)setProgress:(id)a3;
- (void)start;
@end

@implementation WFTask

+ (WFServiceConnection)sharedServiceConnection
{
  if (sharedServiceConnection_onceToken != -1) {
    dispatch_once(&sharedServiceConnection_onceToken, &__block_literal_global_26);
  }
  v2 = (void *)sharedServiceConnection_serviceConnection;
  return (WFServiceConnection *)v2;
}

uint64_t __33__WFTask_sharedServiceConnection__block_invoke()
{
  uint64_t v0 = objc_opt_new();
  uint64_t v1 = sharedServiceConnection_serviceConnection;
  sharedServiceConnection_serviceConnection = v0;
  return MEMORY[0x270F9A758](v0, v1);
}

- (WFTask)init
{
  v13.receiver = self;
  v13.super_class = (Class)WFTask;
  v3 = [(WFTask *)&v13 init];
  if (v3 == self)
  {
    v4 = +[WFTaskIdentifier defaultIdentifier];
    objc_storeStrong((id *)&self->_identifier, v4);
    self->_requiresResponse = 1;
    v5 = objc_opt_new();
    [(WFTask *)self setProgress:v5];

    v6 = [(WFTask *)self progress];
    [v6 setUserInfoObject:self->_identifier forKey:@"taskIdentifier"];

    v7 = [(WFTask *)self progress];
    [v7 setCancellable:1];

    v8 = [(WFTask *)self progress];
    v11[0] = MEMORY[0x263EF8330];
    v11[1] = 3221225472;
    v11[2] = __14__WFTask_init__block_invoke;
    v11[3] = &unk_2644305E8;
    id v12 = v4;
    id v9 = v4;
    [v8 setCancellationHandler:v11];
  }
  return v3;
}

void __14__WFTask_init__block_invoke(uint64_t a1)
{
  id v2 = +[WFTask sharedServiceConnection];
  [v2 cancelRequestWithIdentifier:*(void *)(a1 + 32)];
}

- (WFTask)initWithResponseRequired:(BOOL)a3
{
  result = [(WFTask *)self init];
  if (result) {
    result->_requiresResponse = a3;
  }
  return result;
}

- (void)start
{
  id v3 = [(id)objc_opt_class() sharedServiceConnection];
  [v3 enqueueRequest:self];
}

- (void)executeSynchronously
{
  id v3 = [(id)objc_opt_class() sharedServiceConnection];
  [v3 enqueueRequest:self waitUntilDone:1];
}

- (BOOL)isCancelled
{
  id v2 = [(WFTask *)self progress];
  char v3 = [v2 isCancelled];

  return v3;
}

- (void)cancel
{
  if (![(WFTask *)self isCancelled])
  {
    id v3 = [(WFTask *)self progress];
    [v3 cancel];
  }
}

- (WFTaskIdentifier)identifier
{
  return self->_identifier;
}

- (BOOL)requiresResponse
{
  return self->_requiresResponse;
}

- (NSProgress)progress
{
  return self->_progress;
}

- (void)setProgress:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_progress, 0);
  objc_storeStrong((id *)&self->_identifier, 0);
}

@end