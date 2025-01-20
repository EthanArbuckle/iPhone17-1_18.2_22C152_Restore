@interface ICLightweightMusicSubscriptionStatusRequest
- (ICLightweightMusicSubscriptionStatusRequest)initWithRequestContext:(id)a3;
- (ICStoreRequestContext)requestContext;
- (void)_finishWithExtendedSubscriptionStatusResponse:(id)a3 error:(id)a4;
- (void)execute;
- (void)performRequestWithResponseHandler:(id)a3;
- (void)setRequestContext:(id)a3;
@end

@implementation ICLightweightMusicSubscriptionStatusRequest

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_response, 0);

  objc_storeStrong((id *)&self->_requestContext, 0);
}

- (void)setRequestContext:(id)a3
{
}

- (ICStoreRequestContext)requestContext
{
  return self->_requestContext;
}

- (void)_finishWithExtendedSubscriptionStatusResponse:(id)a3 error:(id)a4
{
  id v9 = a4;
  if (a3)
  {
    id v6 = a3;
    v7 = [[ICLightweightMusicSubscriptionStatusResponse alloc] _initWithExtendedSubscriptionStatusResponse:v6];

    response = self->_response;
    self->_response = v7;
  }
  [(ICRequestOperation *)self finishWithError:v9];
}

- (void)execute
{
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  v3 = [[ICMusicSubscriptionStatusRequest alloc] initWithStoreRequestContext:self->_requestContext];
  [(ICMusicSubscriptionStatusRequest *)v3 setAllowsFallbackToExpiredStatus:0];
  [(ICMusicSubscriptionStatusRequest *)v3 setAllowsFallbackToStatusNeedingReload:0];
  [(ICMusicSubscriptionStatusRequest *)v3 setShouldIgnoreCache:1];
  [(ICMusicSubscriptionStatusRequest *)v3 setShouldReturnLastKnownStatusOnly:0];
  [(ICMusicSubscriptionStatusRequest *)v3 setShouldBypassEnforcementOfPrivacyAcknowledgement:1];
  v4 = [[ICMusicSubscriptionStatusRequestOperation alloc] initWithRequest:v3];
  [(ICMusicSubscriptionStatusRequestOperation *)v4 setAllowsFuseHeaderEnrichment:0];
  [(ICMusicSubscriptionStatusRequestOperation *)v4 setShouldRequestLightweightStatus:1];
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __54__ICLightweightMusicSubscriptionStatusRequest_execute__block_invoke;
  v6[3] = &unk_1E5AC6DF0;
  v6[4] = self;
  [(ICMusicSubscriptionStatusRequestOperation *)v4 setResponseHandler:v6];
  v5 = os_log_create("com.apple.amp.iTunesCloud", "Subscription");
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543618;
    v8 = self;
    __int16 v9 = 2114;
    v10 = v3;
    _os_log_impl(&dword_1A2D01000, v5, OS_LOG_TYPE_DEFAULT, "%{public}@ Performing lightweight subscription status request. Extended request: %{public}@.", buf, 0x16u);
  }

  [(ICAsyncOperation *)self enqueueChildOperation:v4];
}

uint64_t __54__ICLightweightMusicSubscriptionStatusRequest_execute__block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return [*(id *)(a1 + 32) _finishWithExtendedSubscriptionStatusResponse:a2 error:a3];
}

- (void)performRequestWithResponseHandler:(id)a3
{
  id v4 = a3;
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __81__ICLightweightMusicSubscriptionStatusRequest_performRequestWithResponseHandler___block_invoke;
  v6[3] = &unk_1E5ACD8E0;
  v6[4] = self;
  id v7 = v4;
  id v5 = v4;
  [(ICRequestOperation *)self performRequestWithCompletionHandler:v6];
}

uint64_t __81__ICLightweightMusicSubscriptionStatusRequest_performRequestWithResponseHandler___block_invoke(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(void, void, uint64_t))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40), *(void *)(*(void *)(a1 + 32) + 312), a2);
}

- (ICLightweightMusicSubscriptionStatusRequest)initWithRequestContext:(id)a3
{
  id v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)ICLightweightMusicSubscriptionStatusRequest;
  id v5 = [(ICRequestOperation *)&v9 init];
  if (v5)
  {
    uint64_t v6 = [v4 copy];
    requestContext = v5->_requestContext;
    v5->_requestContext = (ICStoreRequestContext *)v6;
  }
  return v5;
}

@end