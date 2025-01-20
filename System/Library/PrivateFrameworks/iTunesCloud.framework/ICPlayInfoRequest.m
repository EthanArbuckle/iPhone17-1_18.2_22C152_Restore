@interface ICPlayInfoRequest
- (BOOL)_hasRentalInfo;
- (ICPlayInfoRequest)initWithRequestContext:(id)a3;
- (NSArray)sinfs;
- (NSData)SICData;
- (NSNumber)DSID;
- (NSNumber)contentIdentifier;
- (NSString)playerGUID;
- (NSString)subscriptionPlaybackType;
- (id)_getSinfParamValue:(int)a3;
- (void)execute;
- (void)performWithResponseHandler:(id)a3;
- (void)setContentIdentifier:(id)a3;
- (void)setDSID:(id)a3;
- (void)setPlayerGUID:(id)a3;
- (void)setSICData:(id)a3;
- (void)setSinfs:(id)a3;
- (void)setSubscriptionPlaybackType:(id)a3;
@end

@implementation ICPlayInfoRequest

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_subscriptionPlaybackType, 0);
  objc_storeStrong((id *)&self->_contentIdentifier, 0);
  objc_storeStrong((id *)&self->_DSID, 0);
  objc_storeStrong((id *)&self->_sinfs, 0);
  objc_storeStrong((id *)&self->_SICData, 0);
  objc_storeStrong((id *)&self->_playerGUID, 0);
  objc_storeStrong((id *)&self->_response, 0);

  objc_storeStrong((id *)&self->_requestContext, 0);
}

- (void)setSubscriptionPlaybackType:(id)a3
{
}

- (NSString)subscriptionPlaybackType
{
  return self->_subscriptionPlaybackType;
}

- (void)setContentIdentifier:(id)a3
{
}

- (NSNumber)contentIdentifier
{
  return self->_contentIdentifier;
}

- (void)setDSID:(id)a3
{
}

- (NSNumber)DSID
{
  return self->_DSID;
}

- (void)setSinfs:(id)a3
{
}

- (NSArray)sinfs
{
  return self->_sinfs;
}

- (void)setSICData:(id)a3
{
}

- (NSData)SICData
{
  return self->_SICData;
}

- (void)setPlayerGUID:(id)a3
{
}

- (NSString)playerGUID
{
  return self->_playerGUID;
}

- (BOOL)_hasRentalInfo
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  unsigned int v20 = 0;
  id v19 = 0;
  int ContextIdentifierForFolderPath = ICFairPlayGetContextIdentifierForFolderPath(0, &v20, &v19);
  id v4 = v19;
  LOBYTE(v5) = 0;
  if (ContextIdentifierForFolderPath)
  {
    long long v17 = 0u;
    long long v18 = 0u;
    long long v15 = 0u;
    long long v16 = 0u;
    v6 = self->_sinfs;
    uint64_t v5 = [(NSArray *)v6 countByEnumeratingWithState:&v15 objects:v21 count:16];
    if (v5)
    {
      uint64_t v7 = *(void *)v16;
      while (2)
      {
        for (uint64_t i = 0; i != v5; ++i)
        {
          if (*(void *)v16 != v7) {
            objc_enumerationMutation(v6);
          }
          v9 = *(void **)(*((void *)&v15 + 1) + 8 * i);
          v14[0] = 0;
          v14[1] = 0;
          uint64_t v10 = v20;
          id v11 = v9;
          RbFpir(v10, [v11 bytes], objc_msgSend(v11, "length"), (uint64_t)v14);
          if (!v12)
          {
            LOBYTE(v5) = 1;
            goto LABEL_12;
          }
        }
        uint64_t v5 = [(NSArray *)v6 countByEnumeratingWithState:&v15 objects:v21 count:16];
        if (v5) {
          continue;
        }
        break;
      }
    }
LABEL_12:
  }
  return v5;
}

- (id)_getSinfParamValue:(int)a3
{
  uint64_t v3 = *(void *)&a3;
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  id v4 = self->_sinfs;
  uint64_t v5 = [(NSArray *)v4 countByEnumeratingWithState:&v15 objects:v19 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v16;
    while (2)
    {
      for (uint64_t i = 0; i != v6; ++i)
      {
        if (*(void *)v16 != v7) {
          objc_enumerationMutation(v4);
        }
        v9 = *(void **)(*((void *)&v15 + 1) + 8 * i);
        uint64_t v14 = 0;
        id v10 = v9;
        hZZRqgZwI([v10 bytes], objc_msgSend(v10, "length"), v3, (uint64_t)&v14);
        if (!v11)
        {
          int v12 = [NSNumber numberWithUnsignedLongLong:v14];
          goto LABEL_11;
        }
      }
      uint64_t v6 = [(NSArray *)v4 countByEnumeratingWithState:&v15 objects:v19 count:16];
      if (v6) {
        continue;
      }
      break;
    }
  }
  int v12 = 0;
LABEL_11:

  return v12;
}

- (void)execute
{
  uint64_t v32 = *MEMORY[0x1E4F143B8];
  uint64_t v3 = os_log_create("com.apple.amp.iTunesCloud", "Default");
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    requestContext = self->_requestContext;
    *(_DWORD *)buf = 138543618;
    v29 = self;
    __int16 v30 = 2114;
    v31 = requestContext;
    _os_log_impl(&dword_1A2D01000, v3, OS_LOG_TYPE_DEFAULT, "%{public}@ Executing playInfo request with context %{public}@", buf, 0x16u);
  }

  uint64_t v5 = [MEMORY[0x1E4F1CA60] dictionary];
  uint64_t v6 = self->_DSID;
  if (v6
    || ([(ICPlayInfoRequest *)self _getSinfParamValue:1],
        (uint64_t v6 = (NSNumber *)objc_claimAutoreleasedReturnValue()) != 0))
  {
    [v5 setObject:v6 forKey:@"dsid"];
    contentIdentifier = self->_contentIdentifier;
    if (contentIdentifier)
    {
      [v5 setObject:contentIdentifier forKey:@"content-id"];
    }
    else
    {
      v8 = [(ICPlayInfoRequest *)self _getSinfParamValue:2];
      if (v8)
      {
        if ([(ICPlayInfoRequest *)self _hasRentalInfo])
        {
          v27 = v8;
          v9 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v27 count:1];
          id v10 = @"rental-ids";
        }
        else
        {
          v26 = v8;
          v9 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v26 count:1];
          id v10 = @"key-ids";
        }
        [v5 setObject:v9 forKey:v10];
      }
    }
    int v12 = +[ICDeviceInfo currentDeviceInfo];
    v13 = [v12 deviceGUID];
    if (v13) {
      [v5 setObject:v13 forKey:@"guid"];
    }
    uint64_t v14 = [v12 deviceModel];
    if (v14) {
      [v5 setObject:v14 forKey:@"hw.model"];
    }
    subscriptionPlaybackType = self->_subscriptionPlaybackType;
    if (subscriptionPlaybackType) {
      [v5 setObject:subscriptionPlaybackType forKey:@"subPlayType"];
    }
    playerGUID = self->_playerGUID;
    if (playerGUID) {
      [v5 setObject:playerGUID forKey:@"player-guid"];
    }
    SICData = self->_SICData;
    if (SICData) {
      [v5 setObject:SICData forKey:@"sic"];
    }
    id v25 = 0;
    long long v18 = [MEMORY[0x1E4F28F98] dataWithPropertyList:v5 format:100 options:0 error:&v25];
    id v19 = (ICStoreRequestContext *)v25;
    if (v19)
    {
      uint64_t v20 = os_log_create("com.apple.amp.iTunesCloud", "Default");
      if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138543618;
        v29 = self;
        __int16 v30 = 2114;
        v31 = v19;
        _os_log_impl(&dword_1A2D01000, v20, OS_LOG_TYPE_DEFAULT, "%{public}@ Failed to serialize body data. err=%{public}@", buf, 0x16u);
      }

      [(ICRequestOperation *)self finishWithError:v19];
    }
    else
    {
      v21 = +[ICURLBagProvider sharedBagProvider];
      uint64_t v22 = self->_requestContext;
      v23[0] = MEMORY[0x1E4F143A8];
      v23[1] = 3221225472;
      v23[2] = __28__ICPlayInfoRequest_execute__block_invoke;
      v23[3] = &unk_1E5ACAFC8;
      v23[4] = self;
      id v24 = v18;
      [v21 getBagForRequestContext:v22 withCompletionHandler:v23];
    }
  }
  else
  {
    int v11 = os_log_create("com.apple.amp.iTunesCloud", "Default");
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138543618;
      v29 = self;
      __int16 v30 = 2114;
      v31 = 0;
      _os_log_impl(&dword_1A2D01000, v11, OS_LOG_TYPE_DEFAULT, "%{public}@ Failed to extract account DSID. err=%{public}@", buf, 0x16u);
    }

    [(ICRequestOperation *)self finishWithError:0];
  }
}

void __28__ICPlayInfoRequest_execute__block_invoke(uint64_t a1, void *a2, void *a3)
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  if (v5)
  {
    uint64_t v6 = os_log_create("com.apple.amp.iTunesCloud", "Default");
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v7 = *(void *)(a1 + 32);
      *(_DWORD *)buf = 138543618;
      uint64_t v17 = v7;
      __int16 v18 = 2114;
      id v19 = v5;
      _os_log_impl(&dword_1A2D01000, v6, OS_LOG_TYPE_DEFAULT, "%{public}@ Failed to load url bag. err=%{public}@", buf, 0x16u);
    }

    [*(id *)(a1 + 32) finishWithError:v5];
  }
  else
  {
    v8 = [a2 urlForBagKey:@"get-play-info"];
    if (v8)
    {
      v9 = [MEMORY[0x1E4F18D50] requestWithURL:v8];
      [v9 setHTTPMethod:@"POST"];
      [v9 setCachePolicy:1];
      [v9 setHTTPBody:*(void *)(a1 + 40)];
      [v9 setValue:@"application/x-apple-plist" forHTTPHeaderField:@"Content-Type"];
      id v10 = [[ICStoreURLRequest alloc] initWithURLRequest:v9 requestContext:*(void *)(*(void *)(a1 + 32) + 304)];
      int v11 = +[ICURLSessionManager defaultSession];
      v15[0] = MEMORY[0x1E4F143A8];
      v15[1] = 3221225472;
      v15[2] = __28__ICPlayInfoRequest_execute__block_invoke_43;
      v15[3] = &unk_1E5ACD928;
      v15[4] = *(void *)(a1 + 32);
      [v11 enqueueDataRequest:v10 withCompletionHandler:v15];
    }
    else
    {
      int v12 = os_log_create("com.apple.amp.iTunesCloud", "Default");
      if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
      {
        uint64_t v13 = *(void *)(a1 + 32);
        *(_DWORD *)buf = 138543362;
        uint64_t v17 = v13;
        _os_log_impl(&dword_1A2D01000, v12, OS_LOG_TYPE_DEFAULT, "%{public}@ Request URL not found - failing request", buf, 0xCu);
      }

      uint64_t v14 = *(void **)(a1 + 32);
      v9 = [MEMORY[0x1E4F28C58] errorWithDomain:@"ICError" code:-7201 userInfo:0];
      [v14 finishWithError:v9];
    }
  }
}

void __28__ICPlayInfoRequest_execute__block_invoke_43(uint64_t a1, void *a2, void *a3)
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  uint64_t v6 = v5;
  if (!v5)
  {
    uint64_t v7 = [a2 parsedBodyDictionary];
    v8 = v7;
    if (v7)
    {
      if (!objc_msgSend(v7, "ic_intValueForKey:", @"status"))
      {
        long long v16 = [[ICPlayInfoResponse alloc] initWithResponseDictionary:v8];
        uint64_t v17 = *(void *)(a1 + 32);
        __int16 v18 = *(void **)(v17 + 312);
        *(void *)(v17 + 312) = v16;

        uint64_t v6 = 0;
        goto LABEL_10;
      }
      v9 = (void *)MEMORY[0x1E4F28C58];
      uint64_t v10 = (int)objc_msgSend(v8, "ic_intValueForKey:", @"status");
      int v11 = @"ICStoreServerError";
      int v12 = v9;
      uint64_t v13 = v8;
    }
    else
    {
      uint64_t v14 = os_log_create("com.apple.amp.iTunesCloud", "Default");
      if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
      {
        uint64_t v15 = *(void *)(a1 + 32);
        int v19 = 138543362;
        uint64_t v20 = v15;
        _os_log_impl(&dword_1A2D01000, v14, OS_LOG_TYPE_ERROR, "%{public}@ failed to parse response", (uint8_t *)&v19, 0xCu);
      }

      int v12 = (void *)MEMORY[0x1E4F28C58];
      int v11 = @"ICError";
      uint64_t v10 = -7102;
      uint64_t v13 = 0;
    }
    uint64_t v6 = [v12 errorWithDomain:v11 code:v10 userInfo:v13];
LABEL_10:
  }
  [*(id *)(a1 + 32) finishWithError:v6];
}

- (void)performWithResponseHandler:(id)a3
{
  id v4 = a3;
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __48__ICPlayInfoRequest_performWithResponseHandler___block_invoke;
  v6[3] = &unk_1E5ACD8E0;
  v6[4] = self;
  id v7 = v4;
  id v5 = v4;
  [(ICRequestOperation *)self performRequestWithCompletionHandler:v6];
}

void __48__ICPlayInfoRequest_performWithResponseHandler___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  id v4 = os_log_create("com.apple.amp.iTunesCloud", "Default");
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v5 = *(void *)(a1 + 32);
    int v6 = 138543618;
    uint64_t v7 = v5;
    __int16 v8 = 2114;
    id v9 = v3;
    _os_log_impl(&dword_1A2D01000, v4, OS_LOG_TYPE_DEFAULT, "%{public}@ Request completed. err=%{public}@", (uint8_t *)&v6, 0x16u);
  }

  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
}

- (ICPlayInfoRequest)initWithRequestContext:(id)a3
{
  id v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)ICPlayInfoRequest;
  uint64_t v5 = [(ICRequestOperation *)&v9 init];
  if (v5)
  {
    uint64_t v6 = [v4 copy];
    requestContext = v5->_requestContext;
    v5->_requestContext = (ICStoreRequestContext *)v6;
  }
  return v5;
}

@end