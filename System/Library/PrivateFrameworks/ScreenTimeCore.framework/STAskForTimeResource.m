@interface STAskForTimeResource
- (STAskForTimeClient)askForTimeClient;
- (STAskForTimeRequest)request;
- (STAskForTimeResource)initWithResourceIdentifier:(id)a3 resourceDisplayName:(id)a4 usageType:(int64_t)a5 changeHandler:(id)a6;
- (id)changeHandler;
- (int)notificationToken;
- (void)_approveExceptionForRequest:(id)a3 withCompletionHandler:(id)a4;
- (void)approveAdditionalTime:(double)a3 completionHandler:(id)a4;
- (void)approveOneMoreMinuteWithCompletionHandler:(id)a3;
- (void)cancelOutstandingRequestsWithCompletion:(id)a3;
- (void)checkRequestForAdditionalTimeWithResponseHandler:(id)a3;
- (void)dealloc;
- (void)requestAdditionalTime:(double)a3 completionHandler:(id)a4;
- (void)setAskForTimeClient:(id)a3;
@end

@implementation STAskForTimeResource

- (STAskForTimeResource)initWithResourceIdentifier:(id)a3 resourceDisplayName:(id)a4 usageType:(int64_t)a5 changeHandler:(id)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a6;
  v32.receiver = self;
  v32.super_class = (Class)STAskForTimeResource;
  v13 = [(STAskForTimeResource *)&v32 init];
  if (v13)
  {
    uint64_t v14 = objc_opt_new();
    askForTimeClient = v13->_askForTimeClient;
    v13->_askForTimeClient = (STAskForTimeClient *)v14;

    v16 = [[STAskForTimeRequest alloc] initWithUsageType:a5 requestedResourceIdentifier:v10];
    request = v13->_request;
    v13->_request = v16;

    [(STAskForTimeRequest *)v13->_request setResourceDisplayName:v11];
    v18 = dispatch_queue_attr_make_with_autorelease_frequency(MEMORY[0x1E4F14430], DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    v19 = dispatch_queue_attr_make_with_qos_class(v18, QOS_CLASS_USER_INITIATED, 0);

    v20 = dispatch_queue_create("com.apple.ScreenTimeAgent.ask-callback", v19);
    int out_token = 0;
    objc_initWeak(&location, v13);
    v21 = (const char *)[@"AskForTimeMessageReceived" UTF8String];
    handler[0] = MEMORY[0x1E4F143A8];
    handler[1] = 3221225472;
    handler[2] = __95__STAskForTimeResource_initWithResourceIdentifier_resourceDisplayName_usageType_changeHandler___block_invoke;
    handler[3] = &unk_1E6BC7168;
    objc_copyWeak(&v29, &location);
    id v27 = v10;
    id v22 = v12;
    id v28 = v22;
    notify_register_dispatch(v21, &out_token, v20, handler);
    v23 = _Block_copy(v22);
    id changeHandler = v13->_changeHandler;
    v13->_id changeHandler = v23;

    v13->_notificationToken = out_token;
    objc_destroyWeak(&v29);
    objc_destroyWeak(&location);
  }
  return v13;
}

void __95__STAskForTimeResource_initWithResourceIdentifier_resourceDisplayName_usageType_changeHandler___block_invoke(uint64_t a1)
{
  uint64_t v7 = *MEMORY[0x1E4F143B8];
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  v3 = +[STLog ask];
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v4 = *(void *)(a1 + 32);
    int v5 = 138543362;
    uint64_t v6 = v4;
    _os_log_impl(&dword_1DA519000, v3, OS_LOG_TYPE_DEFAULT, "Received callback for ask for time resource %{public}@", (uint8_t *)&v5, 0xCu);
  }

  [WeakRetained checkRequestForAdditionalTimeWithResponseHandler:*(void *)(a1 + 40)];
}

- (void)dealloc
{
  notify_cancel(self->_notificationToken);
  v3.receiver = self;
  v3.super_class = (Class)STAskForTimeResource;
  [(STAskForTimeResource *)&v3 dealloc];
}

- (void)requestAdditionalTime:(double)a3 completionHandler:(id)a4
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  id v6 = a4;
  uint64_t v7 = +[STLog ask];
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    v15 = self;
    _os_log_impl(&dword_1DA519000, v7, OS_LOG_TYPE_DEFAULT, "Requesting additional time %@", buf, 0xCu);
  }

  v8 = [(STAskForTimeResource *)self request];
  v9 = [NSNumber numberWithDouble:a3];
  [v8 setTimeRequested:v9];

  id v10 = [(STAskForTimeResource *)self askForTimeClient];
  v12[0] = MEMORY[0x1E4F143A8];
  v12[1] = 3221225472;
  v12[2] = __64__STAskForTimeResource_requestAdditionalTime_completionHandler___block_invoke;
  v12[3] = &unk_1E6BC7058;
  id v13 = v6;
  id v11 = v6;
  [v10 sendAskForTimeRequest:v8 completionHandler:v12];
}

void __64__STAskForTimeResource_requestAdditionalTime_completionHandler___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  uint64_t v4 = +[STLog ask];
  int v5 = v4;
  if (v3)
  {
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
      __64__STAskForTimeResource_requestAdditionalTime_completionHandler___block_invoke_cold_1((uint64_t)v3, v5);
    }
  }
  else if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)uint64_t v7 = 0;
    _os_log_impl(&dword_1DA519000, v5, OS_LOG_TYPE_DEFAULT, "Send ask for time request succeeded", v7, 2u);
  }

  uint64_t v6 = *(void *)(a1 + 32);
  if (v6) {
    (*(void (**)(uint64_t, id))(v6 + 16))(v6, v3);
  }
}

- (void)approveAdditionalTime:(double)a3 completionHandler:(id)a4
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  id v6 = a4;
  uint64_t v7 = +[STLog ask];
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    int v10 = 138412290;
    id v11 = self;
    _os_log_impl(&dword_1DA519000, v7, OS_LOG_TYPE_DEFAULT, "Requesting additional time %@", (uint8_t *)&v10, 0xCu);
  }

  v8 = [(STAskForTimeResource *)self request];
  v9 = [NSNumber numberWithDouble:a3];
  [v8 setTimeRequested:v9];

  [(STAskForTimeResource *)self _approveExceptionForRequest:v8 withCompletionHandler:v6];
}

- (void)approveOneMoreMinuteWithCompletionHandler:(id)a3
{
  uint64_t v9 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  int v5 = +[STLog ask];
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    int v7 = 138412290;
    v8 = self;
    _os_log_impl(&dword_1DA519000, v5, OS_LOG_TYPE_DEFAULT, "Requesting one more minute %@", (uint8_t *)&v7, 0xCu);
  }

  id v6 = [(STAskForTimeResource *)self request];
  [v6 setOneMoreMinute:1];
  [(STAskForTimeResource *)self _approveExceptionForRequest:v6 withCompletionHandler:v4];
}

- (void)_approveExceptionForRequest:(id)a3 withCompletionHandler:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v8 = [(STAskForTimeResource *)self askForTimeClient];
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = __74__STAskForTimeResource__approveExceptionForRequest_withCompletionHandler___block_invoke;
  v11[3] = &unk_1E6BC7190;
  id v12 = v6;
  id v13 = v7;
  v11[4] = self;
  id v9 = v6;
  id v10 = v7;
  [v8 approveExceptionForRequest:v9 completionHandler:v11];
}

void __74__STAskForTimeResource__approveExceptionForRequest_withCompletionHandler___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = +[STLog ask];
  int v5 = v4;
  if (v3)
  {
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
      __74__STAskForTimeResource__approveExceptionForRequest_withCompletionHandler___block_invoke_cold_1((uint64_t)v3, v5);
    }
    uint64_t v6 = 3;
  }
  else
  {
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)id v10 = 0;
      _os_log_impl(&dword_1DA519000, v5, OS_LOG_TYPE_DEFAULT, "Approval for more time succeeded", v10, 2u);
    }
    uint64_t v6 = 4;
  }

  uint64_t v7 = *(void *)(a1 + 48);
  if (v7) {
    (*(void (**)(uint64_t, id))(v7 + 16))(v7, v3);
  }
  v8 = [*(id *)(a1 + 32) changeHandler];
  id v9 = [*(id *)(a1 + 40) timeRequested];
  ((void (**)(void, uint64_t, void, void *, id))v8)[2](v8, v6, 0, v9, v3);
}

- (void)checkRequestForAdditionalTimeWithResponseHandler:(id)a3
{
  id v4 = a3;
  int v5 = [(STAskForTimeResource *)self request];
  uint64_t v6 = [(STAskForTimeResource *)self askForTimeClient];
  uint64_t v7 = [v5 requestedResourceIdentifier];
  uint64_t v8 = [v5 usageType];
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __73__STAskForTimeResource_checkRequestForAdditionalTimeWithResponseHandler___block_invoke;
  v10[3] = &unk_1E6BC71B8;
  id v11 = v4;
  id v9 = v4;
  [v6 fetchLastResponseForRequestedResourceIdentifier:v7 usageType:v8 withCompletionHandler:v10];
}

uint64_t __73__STAskForTimeResource_checkRequestForAdditionalTimeWithResponseHandler___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)cancelOutstandingRequestsWithCompletion:(id)a3
{
  if (a3) {
    (*((void (**)(id, void))a3 + 2))(a3, 0);
  }
}

- (STAskForTimeClient)askForTimeClient
{
  return self->_askForTimeClient;
}

- (void)setAskForTimeClient:(id)a3
{
}

- (STAskForTimeRequest)request
{
  return self->_request;
}

- (int)notificationToken
{
  return self->_notificationToken;
}

- (id)changeHandler
{
  return self->_changeHandler;
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_changeHandler, 0);
  objc_storeStrong((id *)&self->_request, 0);
  objc_storeStrong((id *)&self->_askForTimeClient, 0);
}

void __64__STAskForTimeResource_requestAdditionalTime_completionHandler___block_invoke_cold_1(uint64_t a1, NSObject *a2)
{
  uint64_t v4 = *MEMORY[0x1E4F143B8];
  int v2 = 138543362;
  uint64_t v3 = a1;
  _os_log_error_impl(&dword_1DA519000, a2, OS_LOG_TYPE_ERROR, "Send ask for time request failed: %{public}@", (uint8_t *)&v2, 0xCu);
}

void __74__STAskForTimeResource__approveExceptionForRequest_withCompletionHandler___block_invoke_cold_1(uint64_t a1, NSObject *a2)
{
  uint64_t v4 = *MEMORY[0x1E4F143B8];
  int v2 = 138543362;
  uint64_t v3 = a1;
  _os_log_error_impl(&dword_1DA519000, a2, OS_LOG_TYPE_ERROR, "Approval for more time failed: %{public}@", (uint8_t *)&v2, 0xCu);
}

@end