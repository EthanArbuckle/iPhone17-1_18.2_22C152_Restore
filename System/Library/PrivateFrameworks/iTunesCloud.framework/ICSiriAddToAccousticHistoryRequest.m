@interface ICSiriAddToAccousticHistoryRequest
- (ICSiriAddToAccousticHistoryRequest)initWithRequestContext:(id)a3 storeItemID:(int64_t)a4 affiliateIdentifier:(id)a5;
- (void)execute;
@end

@implementation ICSiriAddToAccousticHistoryRequest

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_affiliateIdentifier, 0);

  objc_storeStrong((id *)&self->_requestContext, 0);
}

- (void)execute
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  v3 = os_log_create("com.apple.amp.iTunesCloud", "Default");
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    int64_t storeItemID = self->_storeItemID;
    affiliateIdentifier = self->_affiliateIdentifier;
    *(_DWORD *)buf = 138543874;
    v10 = self;
    __int16 v11 = 2048;
    int64_t v12 = storeItemID;
    __int16 v13 = 2114;
    v14 = affiliateIdentifier;
    _os_log_impl(&dword_1A2D01000, v3, OS_LOG_TYPE_DEFAULT, "%{public}@ Performing request with storeID %lld, affiliate %{public}@", buf, 0x20u);
  }

  v6 = [(ICStoreRequestContext *)self->_requestContext identityStore];
  v7 = [(ICStoreRequestContext *)self->_requestContext identity];
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __45__ICSiriAddToAccousticHistoryRequest_execute__block_invoke;
  v8[3] = &unk_1E5ACAFF0;
  v8[4] = self;
  [v6 getPropertiesForUserIdentity:v7 completionHandler:v8];
}

void __45__ICSiriAddToAccousticHistoryRequest_execute__block_invoke(uint64_t a1, uint64_t a2)
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  if (a2)
  {
    v3 = +[ICURLBagProvider sharedBagProvider];
    uint64_t v4 = *(void *)(a1 + 32);
    uint64_t v5 = *(void *)(v4 + 304);
    v9[0] = MEMORY[0x1E4F143A8];
    v9[1] = 3221225472;
    v9[2] = __45__ICSiriAddToAccousticHistoryRequest_execute__block_invoke_2;
    v9[3] = &unk_1E5ACD950;
    v9[4] = v4;
    [v3 getBagForRequestContext:v5 forceRefetch:0 withCompletionHandler:v9];
  }
  else
  {
    v6 = os_log_create("com.apple.amp.iTunesCloud", "Default");
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v7 = *(void *)(a1 + 32);
      *(_DWORD *)buf = 138543362;
      uint64_t v11 = v7;
      _os_log_impl(&dword_1A2D01000, v6, OS_LOG_TYPE_DEFAULT, "%{public}@ No active iTunes account - failing request", buf, 0xCu);
    }

    v8 = *(void **)(a1 + 32);
    v3 = [MEMORY[0x1E4F28C58] errorWithDomain:@"ICError" code:-7401 userInfo:0];
    [v8 finishWithError:v3];
  }
}

void __45__ICSiriAddToAccousticHistoryRequest_execute__block_invoke_2(uint64_t a1, void *a2, uint64_t a3)
{
  v22[1] = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  v6 = v5;
  if (a3)
  {
    uint64_t v7 = *(void **)(a1 + 32);
    v8 = (void *)MEMORY[0x1E4F28C58];
    uint64_t v9 = -7401;
LABEL_3:
    v10 = [v8 errorWithDomain:@"ICError" code:v9 userInfo:0];
    [v7 finishWithError:v10];

    goto LABEL_9;
  }
  uint64_t v11 = [v5 urlForBagKey:@"addToSiriTagHistoryBaseUrl"];
  if (!v11)
  {
    uint64_t v11 = [v6 urlForBagKey:@"addToTRHistoryBaseUrl"];
    if (!v11)
    {
      uint64_t v7 = *(void **)(a1 + 32);
      v8 = (void *)MEMORY[0x1E4F28C58];
      uint64_t v9 = -7201;
      goto LABEL_3;
    }
  }
  uint64_t v12 = objc_msgSend(NSString, "stringWithFormat:", @"%lld", *(void *)(*(void *)(a1 + 32) + 312));
  v21 = @"id";
  v22[0] = v12;
  __int16 v13 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v22 forKeys:&v21 count:1];
  v14 = (void *)[v13 mutableCopy];

  uint64_t v15 = *(void *)(*(void *)(a1 + 32) + 320);
  if (v15) {
    [v14 setObject:v15 forKey:@"affiliateID"];
  }
  v16 = objc_msgSend(v11, "ic_URLByAppendingQueryParameters:", v14);

  v17 = (void *)[objc_alloc(MEMORY[0x1E4F18D50]) initWithURL:v16];
  [v17 setCachePolicy:1];
  [v17 setValue:@"Software" forHTTPHeaderField:@"X-Mme-Client-Application"];
  v18 = [[ICStoreURLRequest alloc] initWithURLRequest:v17 requestContext:*(void *)(*(void *)(a1 + 32) + 304)];
  v19 = +[ICURLSessionManager defaultSession];
  v20[0] = MEMORY[0x1E4F143A8];
  v20[1] = 3221225472;
  v20[2] = __45__ICSiriAddToAccousticHistoryRequest_execute__block_invoke_2;
  v20[3] = &unk_1E5ACD928;
  v20[4] = *(void *)(a1 + 32);
  [v19 enqueueDataRequest:v18 withCompletionHandler:v20];

LABEL_9:
}

void __45__ICSiriAddToAccousticHistoryRequest_execute__block_invoke_2(uint64_t a1, uint64_t a2, void *a3)
{
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v5 = os_log_create("com.apple.amp.iTunesCloud", "Default");
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v6 = *(void *)(a1 + 32);
    int v7 = 138543618;
    uint64_t v8 = v6;
    __int16 v9 = 2114;
    id v10 = v4;
    _os_log_impl(&dword_1A2D01000, v5, OS_LOG_TYPE_DEFAULT, "%{public}@ Finished request with err %{public}@", (uint8_t *)&v7, 0x16u);
  }

  [*(id *)(a1 + 32) finishWithError:v4];
}

- (ICSiriAddToAccousticHistoryRequest)initWithRequestContext:(id)a3 storeItemID:(int64_t)a4 affiliateIdentifier:(id)a5
{
  id v9 = a3;
  id v10 = a5;
  v16.receiver = self;
  v16.super_class = (Class)ICSiriAddToAccousticHistoryRequest;
  uint64_t v11 = [(ICRequestOperation *)&v16 init];
  uint64_t v12 = v11;
  if (v11)
  {
    objc_storeStrong((id *)&v11->_requestContext, a3);
    v12->_int64_t storeItemID = a4;
    uint64_t v13 = [v10 copy];
    affiliateIdentifier = v12->_affiliateIdentifier;
    v12->_affiliateIdentifier = (NSString *)v13;
  }
  return v12;
}

@end