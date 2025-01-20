@interface ICSetParentalControlRequestOperation
- (BOOL)allowsExplicitContent;
- (BOOL)isAutomatic;
- (ICSetParentalControlRequestOperation)initWithRequestContext:(id)a3 allowsExplicitContent:(BOOL)a4 isAutomatic:(BOOL)a5;
- (ICStoreRequestContext)requestContext;
- (ICStoreURLRequest)storeURLRequest;
- (void)_buildAndSendRequestForURL:(id)a3;
- (void)_getURLFromBagAndSendRequest;
- (void)cancel;
- (void)execute;
- (void)setAllowsExplicitContent:(BOOL)a3;
- (void)setAutomatic:(BOOL)a3;
- (void)setRequestContext:(id)a3;
- (void)setStoreURLRequest:(id)a3;
@end

@implementation ICSetParentalControlRequestOperation

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_storeURLRequest, 0);

  objc_storeStrong((id *)&self->_requestContext, 0);
}

- (void)setStoreURLRequest:(id)a3
{
}

- (ICStoreURLRequest)storeURLRequest
{
  return self->_storeURLRequest;
}

- (void)setRequestContext:(id)a3
{
}

- (ICStoreRequestContext)requestContext
{
  return self->_requestContext;
}

- (void)setAutomatic:(BOOL)a3
{
  self->_automatic = a3;
}

- (BOOL)isAutomatic
{
  return self->_automatic;
}

- (void)setAllowsExplicitContent:(BOOL)a3
{
  self->_allowsExplicitContent = a3;
}

- (BOOL)allowsExplicitContent
{
  return self->_allowsExplicitContent;
}

- (void)_getURLFromBagAndSendRequest
{
  v3 = +[ICURLBagProvider sharedBagProvider];
  requestContext = self->_requestContext;
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __68__ICSetParentalControlRequestOperation__getURLFromBagAndSendRequest__block_invoke;
  v5[3] = &unk_1E5ACD950;
  v5[4] = self;
  [v3 getBagForRequestContext:requestContext withCompletionHandler:v5];
}

void __68__ICSetParentalControlRequestOperation__getURLFromBagAndSendRequest__block_invoke(uint64_t a1, void *a2, void *a3)
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  if (v5)
  {
    v6 = os_log_create("com.apple.amp.iTunesCloud", "Default");
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v7 = *(void *)(a1 + 32);
      int v13 = 138543618;
      uint64_t v14 = v7;
      __int16 v15 = 2114;
      id v16 = v5;
      _os_log_impl(&dword_1A2D01000, v6, OS_LOG_TYPE_DEFAULT, "%{public}@ Failed to load url bag. err=%{public}@", (uint8_t *)&v13, 0x16u);
    }

    [*(id *)(a1 + 32) finishWithError:v5];
  }
  else
  {
    v8 = [a2 urlForBagKey:@"push-notification-allowexplicit"];
    if (v8)
    {
      [*(id *)(a1 + 32) _buildAndSendRequestForURL:v8];
    }
    else
    {
      v9 = os_log_create("com.apple.amp.iTunesCloud", "Default");
      if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
      {
        uint64_t v10 = *(void *)(a1 + 32);
        int v13 = 138543362;
        uint64_t v14 = v10;
        _os_log_impl(&dword_1A2D01000, v9, OS_LOG_TYPE_DEFAULT, "%{public}@ Missing setParentalControl url in bag - skipping", (uint8_t *)&v13, 0xCu);
      }

      v11 = *(void **)(a1 + 32);
      v12 = [MEMORY[0x1E4F28C58] errorWithDomain:@"ICError" code:-7201 userInfo:0];
      [v11 finishWithError:v12];
    }
  }
}

- (void)_buildAndSendRequestForURL:(id)a3
{
  v22[2] = *MEMORY[0x1E4F143B8];
  v4 = [MEMORY[0x1E4F18D50] requestWithURL:a3];
  [v4 setHTTPMethod:@"POST"];
  id v5 = objc_alloc(MEMORY[0x1E4F290C8]);
  if (self->_allowsExplicitContent) {
    v6 = @"true";
  }
  else {
    v6 = @"false";
  }
  uint64_t v7 = (void *)[v5 initWithName:@"enabled" value:v6];
  id v8 = objc_alloc(MEMORY[0x1E4F290C8]);
  if (self->_automatic) {
    v9 = @"2";
  }
  else {
    v9 = @"1";
  }
  uint64_t v10 = (void *)[v8 initWithName:@"manual" value:v9];
  id v11 = objc_alloc_init(MEMORY[0x1E4F29088]);
  v22[0] = v7;
  v22[1] = v10;
  v12 = [MEMORY[0x1E4F1C978] arrayWithObjects:v22 count:2];
  [v11 setQueryItems:v12];

  int v13 = [v11 query];
  uint64_t v14 = [v13 dataUsingEncoding:4];

  [v4 setHTTPBody:v14];
  __int16 v15 = [[ICStoreURLRequest alloc] initWithURLRequest:v4 requestContext:self->_requestContext];
  storeURLRequest = self->_storeURLRequest;
  self->_storeURLRequest = v15;

  uint64_t v17 = [(ICRequestOperation *)self progress];
  v18 = [(ICURLRequest *)self->_storeURLRequest progress];
  [v17 addChild:v18 withPendingUnitCount:100];

  v19 = +[ICURLSessionManager defaultSession];
  v20 = self->_storeURLRequest;
  v21[0] = MEMORY[0x1E4F143A8];
  v21[1] = 3221225472;
  v21[2] = __67__ICSetParentalControlRequestOperation__buildAndSendRequestForURL___block_invoke;
  v21[3] = &unk_1E5ACD928;
  v21[4] = self;
  [v19 enqueueDataRequest:v20 withCompletionHandler:v21];
}

void __67__ICSetParentalControlRequestOperation__buildAndSendRequestForURL___block_invoke(uint64_t a1, void *a2, void *a3)
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  if (v5)
  {
    v6 = os_log_create("com.apple.amp.iTunesCloud", "Default");
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v7 = *(void *)(a1 + 32);
      int v10 = 138543618;
      uint64_t v11 = v7;
      __int16 v12 = 2114;
      int v13 = v5;
      _os_log_impl(&dword_1A2D01000, v6, OS_LOG_TYPE_DEFAULT, "%{public}@ setParentalControl request failed. err=%{public}@", (uint8_t *)&v10, 0x16u);
    }
  }
  else
  {
    v6 = [a2 parsedBody];
    id v8 = os_log_create("com.apple.amp.iTunesCloud", "Default");
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v9 = *(void *)(a1 + 32);
      int v10 = 138543618;
      uint64_t v11 = v9;
      __int16 v12 = 2114;
      int v13 = v6;
      _os_log_impl(&dword_1A2D01000, v8, OS_LOG_TYPE_DEFAULT, "%{public}@ setParentalControl request returned response %{public}@", (uint8_t *)&v10, 0x16u);
    }
  }
  [*(id *)(a1 + 32) finishWithError:v5];
}

- (void)cancel
{
  v4.receiver = self;
  v4.super_class = (Class)ICSetParentalControlRequestOperation;
  [(ICSetParentalControlRequestOperation *)&v4 cancel];
  v3 = +[ICURLSessionManager defaultSession];
  [v3 cancelRequest:self->_storeURLRequest];
}

- (void)execute
{
  uint64_t v9 = *MEMORY[0x1E4F143B8];
  v3 = os_log_create("com.apple.amp.iTunesCloud", "Default");
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543362;
    id v8 = self;
    _os_log_impl(&dword_1A2D01000, v3, OS_LOG_TYPE_DEFAULT, "%{public}@ Performing setParentalControl request", buf, 0xCu);
  }

  objc_super v4 = [(ICStoreRequestContext *)self->_requestContext identityStore];
  id v5 = [(ICStoreRequestContext *)self->_requestContext identity];
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __47__ICSetParentalControlRequestOperation_execute__block_invoke;
  v6[3] = &unk_1E5ACAFF0;
  v6[4] = self;
  [v4 getPropertiesForUserIdentity:v5 completionHandler:v6];
}

void __47__ICSetParentalControlRequestOperation_execute__block_invoke(uint64_t a1, void *a2)
{
  uint64_t v30 = *MEMORY[0x1E4F143B8];
  if (a2)
  {
    uint64_t v3 = [a2 DSID];
    if (v3)
    {
      objc_super v4 = (void *)v3;
      [*(id *)(a1 + 32) _getURLFromBagAndSendRequest];
    }
    else
    {
      int v13 = os_log_create("com.apple.amp.iTunesCloud", "Default");
      if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
      {
        uint64_t v14 = *(void *)(a1 + 32);
        __int16 v15 = [*(id *)(v14 + 312) identity];
        *(_DWORD *)buf = 138543618;
        uint64_t v27 = v14;
        __int16 v28 = 2114;
        v29 = v15;
        _os_log_impl(&dword_1A2D01000, v13, OS_LOG_TYPE_DEFAULT, "%{public}@ failed - no DSID for account %{public}@", buf, 0x16u);
      }
      uint64_t v22 = *MEMORY[0x1E4F28228];
      id v16 = NSString;
      uint64_t v17 = [*(id *)(*(void *)(a1 + 32) + 312) identity];
      v18 = [v16 stringWithFormat:@"Set parental control failed  [no DSID for user identity] - userIdentity=%@", v17];
      v23 = v18;
      v19 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v23 forKeys:&v22 count:1];

      v20 = *(void **)(a1 + 32);
      v21 = [MEMORY[0x1E4F28C58] errorWithDomain:@"ICError" code:-7400 userInfo:v19];
      [v20 finishWithError:v21];

      objc_super v4 = 0;
    }
  }
  else
  {
    id v5 = os_log_create("com.apple.amp.iTunesCloud", "Default");
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v6 = *(void *)(a1 + 32);
      uint64_t v7 = [*(id *)(v6 + 312) identity];
      *(_DWORD *)buf = 138543618;
      uint64_t v27 = v6;
      __int16 v28 = 2114;
      v29 = v7;
      _os_log_impl(&dword_1A2D01000, v5, OS_LOG_TYPE_DEFAULT, "%{public}@ failed - no properties for account %{public}@", buf, 0x16u);
    }
    uint64_t v24 = *MEMORY[0x1E4F28228];
    id v8 = NSString;
    uint64_t v9 = [*(id *)(*(void *)(a1 + 32) + 312) identity];
    int v10 = [v8 stringWithFormat:@"Set parental control failed [no propertires for user identity]- userIdentity=%@", v9];
    v25 = v10;
    objc_super v4 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v25 forKeys:&v24 count:1];

    uint64_t v11 = *(void **)(a1 + 32);
    __int16 v12 = [MEMORY[0x1E4F28C58] errorWithDomain:@"ICError" code:-7400 userInfo:v4];
    [v11 finishWithError:v12];
  }
}

- (ICSetParentalControlRequestOperation)initWithRequestContext:(id)a3 allowsExplicitContent:(BOOL)a4 isAutomatic:(BOOL)a5
{
  id v9 = a3;
  int v10 = [(ICRequestOperation *)self init];
  uint64_t v11 = v10;
  if (v10)
  {
    objc_storeStrong((id *)&v10->_requestContext, a3);
    v11->_allowsExplicitContent = a4;
    v11->_automatic = a5;
  }

  return v11;
}

@end