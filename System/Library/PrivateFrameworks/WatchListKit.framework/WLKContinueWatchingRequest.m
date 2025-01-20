@interface WLKContinueWatchingRequest
- (BOOL)allowAuthentication;
- (WLKContinueWatchingRequest)init;
- (WLKContinueWatchingResponse)response;
- (void)makeRequestWithCompletion:(id)a3;
- (void)setAllowAuthentication:(BOOL)a3;
@end

@implementation WLKContinueWatchingRequest

- (WLKContinueWatchingRequest)init
{
  v3.receiver = self;
  v3.super_class = (Class)WLKContinueWatchingRequest;
  result = [(WLKContinueWatchingRequest *)&v3 init];
  if (result) {
    result->_allowAuthentication = 1;
  }
  return result;
}

- (void)makeRequestWithCompletion:(id)a3
{
  id v4 = a3;
  v5 = objc_alloc_init(WLKContinueWatchingRequestOperation);
  objc_initWeak(&location, self);
  objc_initWeak(&from, v5);
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __56__WLKContinueWatchingRequest_makeRequestWithCompletion___block_invoke;
  v8[3] = &unk_1E620A2E8;
  objc_copyWeak(&v10, &location);
  objc_copyWeak(&v11, &from);
  id v6 = v4;
  id v9 = v6;
  [(WLKContinueWatchingRequestOperation *)v5 setCompletionBlock:v8];
  v7 = [MEMORY[0x1E4F28F08] wlkDefaultQueue];
  [v7 addOperation:v5];

  objc_destroyWeak(&v11);
  objc_destroyWeak(&v10);
  objc_destroyWeak(&from);
  objc_destroyWeak(&location);
}

void __56__WLKContinueWatchingRequest_makeRequestWithCompletion___block_invoke(uint64_t a1)
{
  WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 40));
  id v2 = objc_loadWeakRetained((id *)(a1 + 48));
  objc_super v3 = [v2 response];
  if (WeakRetained) {
    objc_storeStrong(WeakRetained + 3, v3);
  }
  if (*(void *)(a1 + 32))
  {
    id v4 = [v2 response];
    BOOL v5 = v4 != 0;

    uint64_t v6 = *(void *)(a1 + 32);
    v7 = [v2 error];
    (*(void (**)(uint64_t, BOOL, void *))(v6 + 16))(v6, v5, v7);
  }
}

- (BOOL)allowAuthentication
{
  return self->_allowAuthentication;
}

- (void)setAllowAuthentication:(BOOL)a3
{
  self->_allowAuthentication = a3;
}

- (WLKContinueWatchingResponse)response
{
  return self->_response;
}

- (void).cxx_destruct
{
}

@end