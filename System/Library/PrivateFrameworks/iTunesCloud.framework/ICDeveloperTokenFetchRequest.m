@interface ICDeveloperTokenFetchRequest
+ (BOOL)supportsSecureCoding;
+ (id)_createMediaTokenServiceForClientInfo:(id)a3 clientType:(int64_t)a4 requester:(id)a5;
+ (void)_invalidateCachedDeveloperTokenForClientInfo:(id)a3 requester:(id)a4 usingMediaTokenService:(id)a5;
+ (void)invalidateCachedDeveloperTokenForClientInfo:(id)a3 clientType:(int64_t)a4 requester:(id)a5 completionHandler:(id)a6;
- (ICDeveloperTokenFetchRequest)initWithClientInfo:(id)a3;
- (ICDeveloperTokenFetchRequest)initWithClientInfo:(id)a3 options:(unint64_t)a4;
- (ICDeveloperTokenFetchRequest)initWithCoder:(id)a3;
- (int64_t)clientType;
- (void)_didFetchMediaToken:(id)a3 withError:(id)a4;
- (void)encodeWithCoder:(id)a3;
- (void)execute;
- (void)performRequestOnOperationQueue:(id)a3 withResponseHandler:(id)a4;
- (void)performRequestWithResponseHandler:(id)a3;
- (void)setClientType:(int64_t)a3;
@end

@implementation ICDeveloperTokenFetchRequest

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_mediaTokenService, 0);

  objc_storeStrong((id *)&self->_clientInfo, 0);
}

- (void)setClientType:(int64_t)a3
{
  self->_clientType = a3;
}

- (int64_t)clientType
{
  return self->_clientType;
}

- (void)_didFetchMediaToken:(id)a3 withError:(id)a4
{
  uint64_t v33 = *MEMORY[0x1E4F143B8];
  id v6 = a4;
  v7 = [a3 tokenString];
  [(ICRemoteRequestOperation *)self setResponse:v7];
  if (!v6)
  {
    v21 = 0;
    goto LABEL_17;
  }
  id v8 = v6;
  v9 = [v8 domain];
  uint64_t v10 = *MEMORY[0x1E4F4DA40];
  if ([v9 isEqualToString:*MEMORY[0x1E4F4DA40]])
  {
    uint64_t v11 = [v8 code];

    if (v11 == 301)
    {
      v12 = objc_msgSend(v8, "msv_underlyingError");
      v13 = [v12 domain];
      if ([v13 isEqualToString:v10])
      {
        uint64_t v14 = [v12 code];

        if (v14 != 301) {
          goto LABEL_8;
        }
        v13 = v8;
        id v8 = v12;
      }

LABEL_8:
      v15 = [v8 userInfo];
      v16 = [v15 objectForKey:*MEMORY[0x1E4F4DA58]];
      uint64_t v17 = [v16 integerValue];

      v18 = ICURLResponseStatusCodeGetExtendedDescription(v17);
      if (v17)
      {
        if (v17 == 404)
        {
          v19 = (void *)MEMORY[0x1E4F28C58];
          v20 = [(ICClientInfo *)self->_clientInfo clientIdentifier];
          v21 = objc_msgSend(v19, "msv_errorWithDomain:code:underlyingError:debugDescription:", @"ICError", -8200, v8, @"Media API Token Service responded with status code: %@. This suggests that \"%@\" was likely not registered as a valid client identifier.", v18, v20);

          goto LABEL_21;
        }
        v26 = (void *)MEMORY[0x1E4F28C58];
        v27 = @"Media API Token Service's response was invalid (status code: %@).";
        v28 = v18;
      }
      else
      {
        v26 = (void *)MEMORY[0x1E4F28C58];
        v27 = @"Media API Token Service's response was invalid.";
      }
      v21 = objc_msgSend(v26, "msv_errorWithDomain:code:underlyingError:debugDescription:", @"ICError", -8200, v8, v27, v28);
LABEL_21:

      if (v21) {
        goto LABEL_14;
      }
    }
  }
  else
  {
  }
  v21 = objc_msgSend(MEMORY[0x1E4F28C58], "msv_errorWithDomain:code:underlyingError:debugDescription:", @"ICError", -8200, v8, @"Failed to fetch media token from %@.", self->_mediaTokenService);
LABEL_14:
  v22 = os_log_create("com.apple.amp.iTunesCloud", "Default");
  if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR))
  {
    v23 = objc_msgSend(v21, "msv_description");
    *(_DWORD *)buf = 138543618;
    v30 = self;
    __int16 v31 = 2114;
    v32 = v23;
    _os_log_impl(&dword_1A2D01000, v22, OS_LOG_TYPE_ERROR, "%{public}@: %{public}@", buf, 0x16u);
  }
LABEL_17:
  mediaTokenService = self->_mediaTokenService;
  self->_mediaTokenService = 0;

  v25 = objc_msgSend(v21, "msv_errorByRemovingUnsafeUserInfo");
  [(ICRequestOperation *)self finishWithError:v25];
}

- (void)execute
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  v3 = os_log_create("com.apple.amp.iTunesCloud", "Default");
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543362;
    uint64_t v14 = self;
    _os_log_impl(&dword_1A2D01000, v3, OS_LOG_TYPE_DEFAULT, "%{public}@: Performing request.", buf, 0xCu);
  }

  if ([(ICDeveloperTokenFetchRequest *)self isCancelled])
  {
    id v4 = [MEMORY[0x1E4F28C58] errorWithDomain:@"ICError" code:-7004 userInfo:0];
    [(ICRequestOperation *)self finishWithError:v4];
  }
  else
  {
    v5 = [(id)objc_opt_class() _createMediaTokenServiceForClientInfo:self->_clientInfo clientType:self->_clientType requester:self];
    mediaTokenService = self->_mediaTokenService;
    self->_mediaTokenService = v5;

    v7 = [(ICClientInfo *)self->_clientInfo clientIdentifier];
    if (self->_options) {
      [(id)objc_opt_class() _invalidateCachedDeveloperTokenForClientInfo:self->_clientInfo requester:self usingMediaTokenService:self->_mediaTokenService];
    }
    id v8 = os_log_create("com.apple.amp.iTunesCloud", "Default");
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      v9 = self->_mediaTokenService;
      *(_DWORD *)buf = 138543874;
      uint64_t v14 = self;
      __int16 v15 = 2114;
      v16 = v9;
      __int16 v17 = 2114;
      v18 = v7;
      _os_log_impl(&dword_1A2D01000, v8, OS_LOG_TYPE_DEFAULT, "%{public}@: Requesting developer token using %{public}@ with client identifier %{public}@.", buf, 0x20u);
    }

    uint64_t v10 = [(AMSMediaTokenService *)self->_mediaTokenService fetchMediaToken];
    v11[0] = MEMORY[0x1E4F143A8];
    v11[1] = 3221225472;
    v11[2] = __39__ICDeveloperTokenFetchRequest_execute__block_invoke;
    v11[3] = &unk_1E5ACB2B0;
    v11[4] = self;
    id v12 = v7;
    id v4 = v7;
    [v10 addFinishBlock:v11];
  }
}

void __39__ICDeveloperTokenFetchRequest_execute__block_invoke(uint64_t a1, void *a2, void *a3)
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  id v6 = a2;
  v7 = os_log_create("com.apple.amp.iTunesCloud", "Default");
  id v8 = v7;
  if (v5)
  {
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      uint64_t v9 = *(void *)(a1 + 32);
      uint64_t v10 = *(void *)(a1 + 40);
      uint64_t v11 = objc_msgSend(v5, "msv_description");
      int v14 = 138543874;
      uint64_t v15 = v9;
      __int16 v16 = 2114;
      uint64_t v17 = v10;
      __int16 v18 = 2114;
      uint64_t v19 = v11;
      _os_log_impl(&dword_1A2D01000, v8, OS_LOG_TYPE_ERROR, "%{public}@: Media token request finished for client identifier %{public}@. error=%{public}@", (uint8_t *)&v14, 0x20u);
    }
  }
  else if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v12 = *(void *)(a1 + 32);
    uint64_t v13 = *(void *)(a1 + 40);
    int v14 = 138543618;
    uint64_t v15 = v12;
    __int16 v16 = 2114;
    uint64_t v17 = v13;
    _os_log_impl(&dword_1A2D01000, v8, OS_LOG_TYPE_DEFAULT, "%{public}@: Media token request finished for client identifier %{public}@.", (uint8_t *)&v14, 0x16u);
  }

  [*(id *)(a1 + 32) _didFetchMediaToken:v6 withError:v5];
}

- (void)encodeWithCoder:(id)a3
{
  v5.receiver = self;
  v5.super_class = (Class)ICDeveloperTokenFetchRequest;
  id v4 = a3;
  [(ICRemoteRequestOperation *)&v5 encodeWithCoder:v4];
  objc_msgSend(v4, "encodeObject:forKey:", self->_clientInfo, @"clientInfo", v5.receiver, v5.super_class);
  [v4 encodeInteger:self->_clientType forKey:@"clientType"];
  [v4 encodeInteger:self->_options forKey:@"options"];
}

- (ICDeveloperTokenFetchRequest)initWithCoder:(id)a3
{
  id v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)ICDeveloperTokenFetchRequest;
  objc_super v5 = [(ICRemoteRequestOperation *)&v9 initWithCoder:v4];
  if (v5)
  {
    uint64_t v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"clientInfo"];
    clientInfo = v5->_clientInfo;
    v5->_clientInfo = (ICClientInfo *)v6;

    v5->_clientType = [v4 decodeIntegerForKey:@"clientType"];
    v5->_options = [v4 decodeIntegerForKey:@"options"];
  }

  return v5;
}

- (void)performRequestOnOperationQueue:(id)a3 withResponseHandler:(id)a4
{
  id v6 = a4;
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __83__ICDeveloperTokenFetchRequest_performRequestOnOperationQueue_withResponseHandler___block_invoke;
  v8[3] = &unk_1E5ACD8E0;
  v8[4] = self;
  id v9 = v6;
  id v7 = v6;
  [(ICRequestOperation *)self performRequestOnOperationQueue:a3 withCompletionHandler:v8];
}

void __83__ICDeveloperTokenFetchRequest_performRequestOnOperationQueue_withResponseHandler___block_invoke(uint64_t a1, void *a2)
{
  if (*(void *)(a1 + 40))
  {
    v3 = *(void **)(a1 + 32);
    id v4 = a2;
    id v5 = [v3 response];
    (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
  }
}

- (void)performRequestWithResponseHandler:(id)a3
{
}

- (ICDeveloperTokenFetchRequest)initWithClientInfo:(id)a3 options:(unint64_t)a4
{
  id v6 = a3;
  v11.receiver = self;
  v11.super_class = (Class)ICDeveloperTokenFetchRequest;
  id v7 = [(ICRequestOperation *)&v11 init];
  if (v7)
  {
    uint64_t v8 = [v6 copy];
    clientInfo = v7->_clientInfo;
    v7->_clientInfo = (ICClientInfo *)v8;

    v7->_clientType = 0;
    v7->_options = a4;
  }

  return v7;
}

- (ICDeveloperTokenFetchRequest)initWithClientInfo:(id)a3
{
  return [(ICDeveloperTokenFetchRequest *)self initWithClientInfo:a3 options:0];
}

+ (void)_invalidateCachedDeveloperTokenForClientInfo:(id)a3 requester:(id)a4 usingMediaTokenService:(id)a5
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  id v7 = a3;
  id v8 = a4;
  id v9 = a5;
  [v9 invalidateMediaToken];
  uint64_t v10 = os_log_create("com.apple.amp.iTunesCloud", "Default");
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    objc_super v11 = [v7 clientIdentifier];
    int v12 = 138543874;
    id v13 = v8;
    __int16 v14 = 2114;
    id v15 = v9;
    __int16 v16 = 2114;
    uint64_t v17 = v11;
    _os_log_impl(&dword_1A2D01000, v10, OS_LOG_TYPE_DEFAULT, "%{public}@: Invalidated cached developer token using %{public}@ with client identifier %{public}@.", (uint8_t *)&v12, 0x20u);
  }
}

+ (id)_createMediaTokenServiceForClientInfo:(id)a3 clientType:(int64_t)a4 requester:(id)a5
{
  uint64_t v26 = *MEMORY[0x1E4F143B8];
  id v7 = a3;
  id v8 = a5;
  id v9 = [v7 bagProfile];
  uint64_t v10 = [v7 bagProfileVersion];
  objc_super v11 = [MEMORY[0x1E4F4DBD8] bagForProfile:v9 profileVersion:v10];
  int v12 = os_log_create("com.apple.amp.iTunesCloud", "Default");
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
  {
    int v18 = 138544130;
    id v19 = v8;
    __int16 v20 = 2114;
    v21 = v9;
    __int16 v22 = 2114;
    v23 = v10;
    __int16 v24 = 2048;
    v25 = v11;
    _os_log_impl(&dword_1A2D01000, v12, OS_LOG_TYPE_DEFAULT, "%{public}@: Instantiated AMSBag with profile %{public}@ and version %{public}@: <AMSBag: %p>.", (uint8_t *)&v18, 0x2Au);
  }

  id v13 = [v7 clientIdentifier];
  __int16 v14 = (void *)[objc_alloc(MEMORY[0x1E4F4DD48]) initWithClientIdentifier:v13 bag:v11];
  id v15 = v14;
  if ((unint64_t)a4 <= 1) {
    [v14 setClientType:a4];
  }
  __int16 v16 = os_log_create("com.apple.amp.iTunesCloud", "Default");
  if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
  {
    int v18 = 138543874;
    id v19 = v8;
    __int16 v20 = 2114;
    v21 = v13;
    __int16 v22 = 2114;
    v23 = v15;
    _os_log_impl(&dword_1A2D01000, v16, OS_LOG_TYPE_DEFAULT, "%{public}@: Instantiated AMSMediaTokenService with client identifier %{public}@: %{public}@.", (uint8_t *)&v18, 0x20u);
  }

  return v15;
}

+ (void)invalidateCachedDeveloperTokenForClientInfo:(id)a3 clientType:(int64_t)a4 requester:(id)a5 completionHandler:(id)a6
{
  uint64_t v10 = (void (**)(id, uint64_t, void))a6;
  id v11 = a5;
  id v12 = a3;
  id v13 = [a1 _createMediaTokenServiceForClientInfo:v12 clientType:a4 requester:v11];
  [a1 _invalidateCachedDeveloperTokenForClientInfo:v12 requester:v11 usingMediaTokenService:v13];

  v10[2](v10, 1, 0);
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end