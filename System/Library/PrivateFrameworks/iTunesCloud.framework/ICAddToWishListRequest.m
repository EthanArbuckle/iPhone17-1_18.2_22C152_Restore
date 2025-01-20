@interface ICAddToWishListRequest
- (ICAddToWishListRequest)initWithRequestContext:(id)a3 buyParams:(id)a4 storeItemID:(int64_t)a5 itemName:(id)a6 itemKind:(id)a7;
- (ICAddToWishListRequest)initWithRequestContext:(id)a3 platformMetadataItem:(id)a4;
- (void)execute;
- (void)performWithResponseHandler:(id)a3;
@end

@implementation ICAddToWishListRequest

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_response, 0);
  objc_storeStrong((id *)&self->_itemKind, 0);
  objc_storeStrong((id *)&self->_itemName, 0);
  objc_storeStrong((id *)&self->_buyParams, 0);

  objc_storeStrong((id *)&self->_requestContext, 0);
}

- (void)execute
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  v3 = os_log_create("com.apple.amp.iTunesCloud", "Default");
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    int64_t storeItemID = self->_storeItemID;
    itemName = self->_itemName;
    *(_DWORD *)buf = 138543874;
    v10 = self;
    __int16 v11 = 2048;
    int64_t v12 = storeItemID;
    __int16 v13 = 2114;
    v14 = itemName;
    _os_log_impl(&dword_1A2D01000, v3, OS_LOG_TYPE_DEFAULT, "%{public}@ Performing request with storeID=%lld, itemName=%{public}@", buf, 0x20u);
  }

  v6 = +[ICUserIdentityStore defaultIdentityStore];
  v7 = +[ICUserIdentity activeAccount];
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __33__ICAddToWishListRequest_execute__block_invoke;
  v8[3] = &unk_1E5ACAFF0;
  v8[4] = self;
  [v6 getPropertiesForUserIdentity:v7 completionHandler:v8];
}

void __33__ICAddToWishListRequest_execute__block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  if (a2 | a3)
  {
    v5 = +[ICURLBagProvider sharedBagProvider];
    uint64_t v6 = *(void *)(a1 + 32);
    uint64_t v7 = *(void *)(v6 + 304);
    v9[0] = MEMORY[0x1E4F143A8];
    v9[1] = 3221225472;
    v9[2] = __33__ICAddToWishListRequest_execute__block_invoke_2;
    v9[3] = &unk_1E5ACD950;
    v9[4] = v6;
    [v5 getBagForRequestContext:v7 withCompletionHandler:v9];
  }
  else
  {
    v4 = *(void **)(a1 + 32);
    id v8 = [MEMORY[0x1E4F28C58] errorWithDomain:@"ICError" code:-7401 userInfo:0];
    [v4 finishWithError:v8];
  }
}

void __33__ICAddToWishListRequest_execute__block_invoke_2(uint64_t a1, void *a2, uint64_t a3)
{
  if (!a3)
  {
    v18[11] = v3;
    v18[12] = v4;
    uint64_t v6 = [a2 urlForBagKey:@"addToWishlistBaseUrl"];
    id v7 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
    id v8 = [NSNumber numberWithLongLong:*(void *)(*(void *)(a1 + 32) + 320)];
    v9 = [v8 stringValue];
    [v7 setObject:v9 forKey:@"id"];

    v10 = *(void **)(a1 + 32);
    if (v10[39])
    {
      __int16 v11 = objc_msgSend(MEMORY[0x1E4F1CB10], "ic_queryParametersDictionaryFromString:");
      [v7 addEntriesFromDictionary:v11];

      v10 = *(void **)(a1 + 32);
    }
    uint64_t v12 = v10[41];
    if (v12)
    {
      [v7 setObject:v12 forKey:@"wishlistItemName"];
      v10 = *(void **)(a1 + 32);
    }
    uint64_t v13 = v10[42];
    if (v13) {
      [v7 setObject:v13 forKey:@"kind"];
    }
    v14 = objc_msgSend(v6, "ic_URLByAppendingQueryParameters:", v7);

    uint64_t v15 = (void *)[objc_alloc(MEMORY[0x1E4F18D50]) initWithURL:v14];
    [v15 setCachePolicy:1];
    [v15 setValue:@"Software" forHTTPHeaderField:@"X-Mme-Client-Application"];
    v16 = [[ICStoreURLRequest alloc] initWithURLRequest:v15 requestContext:*(void *)(*(void *)(a1 + 32) + 304)];
    v17 = +[ICURLSessionManager defaultSession];
    v18[0] = MEMORY[0x1E4F143A8];
    v18[1] = 3221225472;
    v18[2] = __33__ICAddToWishListRequest_execute__block_invoke_3;
    v18[3] = &unk_1E5ACD928;
    v18[4] = *(void *)(a1 + 32);
    [v17 enqueueDataRequest:v16 withCompletionHandler:v18];
  }
}

void __33__ICAddToWishListRequest_execute__block_invoke_3(uint64_t a1, void *a2, void *a3)
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  id v6 = a2;
  id v7 = [ICAddToWishListResponse alloc];
  id v8 = [v6 parsedBodyDictionary];

  uint64_t v9 = [(ICAddToWishListResponse *)v7 initWithResponseDictionary:v8];
  uint64_t v10 = *(void *)(a1 + 32);
  __int16 v11 = *(void **)(v10 + 344);
  *(void *)(v10 + 344) = v9;

  uint64_t v12 = os_log_create("com.apple.amp.iTunesCloud", "Default");
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v13 = *(void *)(a1 + 32);
    uint64_t v14 = *(void *)(v13 + 344);
    int v15 = 138543874;
    uint64_t v16 = v13;
    __int16 v17 = 2114;
    id v18 = v5;
    __int16 v19 = 2114;
    uint64_t v20 = v14;
    _os_log_impl(&dword_1A2D01000, v12, OS_LOG_TYPE_DEFAULT, "%{public}@ Finished with err=%{public}@, response=%{public}@", (uint8_t *)&v15, 0x20u);
  }

  [*(id *)(a1 + 32) finishWithError:v5];
}

- (void)performWithResponseHandler:(id)a3
{
  id v4 = a3;
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __53__ICAddToWishListRequest_performWithResponseHandler___block_invoke;
  v6[3] = &unk_1E5ACD8E0;
  v6[4] = self;
  id v7 = v4;
  id v5 = v4;
  [(ICRequestOperation *)self performRequestWithCompletionHandler:v6];
}

uint64_t __53__ICAddToWishListRequest_performWithResponseHandler___block_invoke(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(void, void, uint64_t))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40), *(void *)(*(void *)(a1 + 32) + 344), a2);
}

- (ICAddToWishListRequest)initWithRequestContext:(id)a3 platformMetadataItem:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  id v8 = [v6 offerWithType:@"buy"];
  uint64_t v9 = [v6 title];
  uint64_t v10 = v9;
  if (v9)
  {
    id v11 = v9;
  }
  else
  {
    id v11 = [v6 name];
  }
  uint64_t v12 = v11;

  uint64_t v13 = [v8 buyParameters];
  uint64_t v14 = [v6 storeAdamID];
  int v15 = [v6 kind];
  uint64_t v16 = [(ICAddToWishListRequest *)self initWithRequestContext:v7 buyParams:v13 storeItemID:v14 itemName:v12 itemKind:v15];

  return v16;
}

- (ICAddToWishListRequest)initWithRequestContext:(id)a3 buyParams:(id)a4 storeItemID:(int64_t)a5 itemName:(id)a6 itemKind:(id)a7
{
  id v13 = a3;
  id v14 = a4;
  id v15 = a6;
  id v16 = a7;
  v22.receiver = self;
  v22.super_class = (Class)ICAddToWishListRequest;
  __int16 v17 = [(ICRequestOperation *)&v22 init];
  id v18 = v17;
  if (v17)
  {
    objc_storeStrong((id *)&v17->_requestContext, a3);
    uint64_t v19 = [v14 copy];
    buyParams = v18->_buyParams;
    v18->_buyParams = (NSString *)v19;

    v18->_int64_t storeItemID = a5;
    objc_storeStrong((id *)&v18->_itemName, a6);
    objc_storeStrong((id *)&v18->_itemKind, a7);
  }

  return v18;
}

@end