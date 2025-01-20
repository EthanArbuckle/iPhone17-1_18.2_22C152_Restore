@interface ICMusicUserTokenFetchRequest
+ (BOOL)supportsSecureCoding;
- (ICMusicUserTokenFetchRequest)initWithCoder:(id)a3;
- (ICMusicUserTokenFetchRequest)initWithDeveloperToken:(id)a3 clientInfo:(id)a4 options:(unint64_t)a5;
- (void)_executeByPerformingStoreRequestWithContext:(id)a3 qualityOfService:(int64_t)a4;
- (void)encodeWithCoder:(id)a3;
- (void)execute;
- (void)performRequestOnOperationQueue:(id)a3 withResponseHandler:(id)a4;
- (void)performRequestWithResponseHandler:(id)a3;
@end

@implementation ICMusicUserTokenFetchRequest

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_developerToken, 0);

  objc_storeStrong((id *)&self->_clientInfo, 0);
}

- (void)_executeByPerformingStoreRequestWithContext:(id)a3 qualityOfService:(int64_t)a4
{
  id v6 = a3;
  v7 = +[ICURLBagProvider sharedBagProvider];
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __93__ICMusicUserTokenFetchRequest__executeByPerformingStoreRequestWithContext_qualityOfService___block_invoke;
  v9[3] = &unk_1E5AC8CB8;
  v9[4] = self;
  id v10 = v6;
  int64_t v11 = a4;
  id v8 = v6;
  [v7 getBagForRequestContext:v8 withCompletionHandler:v9];
}

void __93__ICMusicUserTokenFetchRequest__executeByPerformingStoreRequestWithContext_qualityOfService___block_invoke(uint64_t a1, void *a2, void *a3)
{
  uint64_t v45 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  id v6 = a3;
  v7 = os_log_create("com.apple.amp.iTunesCloud", "Default");
  id v8 = v7;
  if (!v5 || v6)
  {
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      uint64_t v30 = *(void *)(a1 + 32);
      *(_DWORD *)buf = 138543618;
      uint64_t v42 = v30;
      __int16 v43 = 2114;
      id v44 = v6;
      _os_log_impl(&dword_1A2D01000, v8, OS_LOG_TYPE_ERROR, "%{public}@: Failed to get bag with error %{public}@.", buf, 0x16u);
    }

    [*(id *)(a1 + 32) finishWithError:v6];
  }
  else
  {
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v9 = *(void *)(a1 + 32);
      *(_DWORD *)buf = 138543618;
      uint64_t v42 = v9;
      __int16 v43 = 2114;
      id v44 = v5;
      _os_log_impl(&dword_1A2D01000, v8, OS_LOG_TYPE_DEFAULT, "%{public}@: Got bag with %{public}@.", buf, 0x16u);
    }

    id v10 = [v5 urlForBagKey:@"createMusicToken"];
    if (v10)
    {
      int64_t v11 = [*(id *)(a1 + 40) deviceInfo];
      id v12 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
      v13 = (void *)[objc_alloc(MEMORY[0x1E4F18D50]) initWithURL:v10];
      [v13 setHTTPMethod:@"POST"];
      [v13 setValue:@"application/json" forHTTPHeaderField:@"Content-Type"];
      uint64_t v14 = [v11 deviceGUID];
      if (v14) {
        [v12 setObject:v14 forKey:@"guid"];
      }
      uint64_t v15 = *(void *)(a1 + 32);
      uint64_t v16 = *(void *)(v15 + 328);
      v36 = v11;
      v37 = v10;
      v35 = (void *)v14;
      if (v16)
      {
        [v12 setObject:v16 forKey:@"assertion"];
        uint64_t v15 = *(void *)(a1 + 32);
      }
      v17 = [*(id *)(v15 + 320) requestingBundleIdentifier];
      if (!v17) {
        goto LABEL_12;
      }
      v18 = +[ICDefaults standardDefaults];
      v19 = [v18 mediaLibraryAccessApplicationIdentifiersWithTCCAcceptanceDates];

      v20 = [v19 objectForKey:v17];

      if (!v20)
      {
LABEL_12:
        v20 = [MEMORY[0x1E4F1C9C8] date];
      }
      [v20 timeIntervalSince1970];
      v22 = objc_msgSend(NSString, "stringWithFormat:", @"%lld", llround(v21 * 1000.0));
      [v12 setObject:v22 forKey:@"tcc-acceptance-date"];

      v23 = [MEMORY[0x1E4F28D90] dataWithJSONObject:v12 options:1 error:0];
      [v13 setHTTPBody:v23];
      v24 = [[ICStoreURLRequest alloc] initWithURLRequest:v13 requestContext:*(void *)(a1 + 40)];
      [(ICURLRequest *)v24 setCancelOnHTTPErrors:0];
      +[ICURLSessionManager sharedSessionManager];
      v25 = v34 = v12;
      v26 = [v25 sessionWithQualityOfService:*(void *)(a1 + 48)];

      v38[0] = MEMORY[0x1E4F143A8];
      v38[1] = 3221225472;
      v38[2] = __93__ICMusicUserTokenFetchRequest__executeByPerformingStoreRequestWithContext_qualityOfService___block_invoke_69;
      v38[3] = &unk_1E5AC8C90;
      v27 = *(void **)(a1 + 40);
      v38[4] = *(void *)(a1 + 32);
      id v39 = v27;
      id v40 = v17;
      id v28 = v17;
      [v26 enqueueDataRequest:v24 withCompletionHandler:v38];

      v29 = v36;
      id v10 = v37;
    }
    else
    {
      v29 = objc_msgSend(MEMORY[0x1E4F28C58], "msv_errorWithDomain:code:debugDescription:", @"ICError", -7201, @"Could not find URL to get music user token.");
      v31 = os_log_create("com.apple.amp.iTunesCloud", "Default");
      if (os_log_type_enabled(v31, OS_LOG_TYPE_ERROR))
      {
        uint64_t v32 = *(void *)(a1 + 32);
        v33 = objc_msgSend(v29, "msv_description");
        *(_DWORD *)buf = 138543618;
        uint64_t v42 = v32;
        __int16 v43 = 2114;
        id v44 = v33;
        _os_log_impl(&dword_1A2D01000, v31, OS_LOG_TYPE_ERROR, "%{public}@: %{public}@", buf, 0x16u);
      }
      [*(id *)(a1 + 32) finishWithError:v29];
    }
  }
}

void __93__ICMusicUserTokenFetchRequest__executeByPerformingStoreRequestWithContext_qualityOfService___block_invoke_69(uint64_t a1, void *a2, void *a3)
{
  uint64_t v40 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  id v6 = a2;
  v7 = [v6 parsedBodyDictionary];
  id v8 = [v7 objectForKey:@"error_description"];
  if (_NSIsNSString()) {
    uint64_t v9 = v8;
  }
  else {
    uint64_t v9 = 0;
  }
  uint64_t v10 = [v6 statusCode];

  int64_t v11 = ICURLResponseStatusCodeGetExtendedDescription(v10);
  id v12 = os_log_create("com.apple.amp.iTunesCloud", "Default");
  v13 = v12;
  if (v5)
  {
    if (!os_log_type_enabled(v12, OS_LOG_TYPE_ERROR)) {
      goto LABEL_10;
    }
    uint64_t v14 = *(void *)(a1 + 32);
    *(_DWORD *)buf = 138543874;
    *(void *)&uint8_t buf[4] = v14;
    *(_WORD *)&buf[12] = 2114;
    *(void *)&buf[14] = v5;
    *(_WORD *)&buf[22] = 2114;
    v37 = v11;
    uint64_t v15 = "%{public}@: Finished with error %{public}@ and status code %{public}@.";
    uint64_t v16 = v13;
    os_log_type_t v17 = OS_LOG_TYPE_ERROR;
    uint32_t v18 = 32;
  }
  else
  {
    if (!os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT)) {
      goto LABEL_10;
    }
    uint64_t v19 = *(void *)(a1 + 32);
    *(_DWORD *)buf = 138543618;
    *(void *)&uint8_t buf[4] = v19;
    *(_WORD *)&buf[12] = 2114;
    *(void *)&buf[14] = v11;
    uint64_t v15 = "%{public}@: Finished with status code %{public}@.";
    uint64_t v16 = v13;
    os_log_type_t v17 = OS_LOG_TYPE_DEFAULT;
    uint32_t v18 = 22;
  }
  _os_log_impl(&dword_1A2D01000, v16, v17, v15, buf, v18);
LABEL_10:

  if (v10 == 401)
  {
    if (!v9) {
      uint64_t v9 = @"This is most likely due to an expired or otherwise invalid developer token";
    }
    v20 = objc_msgSend(MEMORY[0x1E4F28C58], "msv_errorWithDomain:code:debugDescription:", @"ICError", -8101, @"Failed to fetch music user token with %@ status code. %@.", v11, v9, *(_OWORD *)buf, *(void *)&buf[16], v37);

    v24 = os_log_create("com.apple.amp.iTunesCloud", "Default");
    if (os_log_type_enabled(v24, OS_LOG_TYPE_ERROR))
    {
      uint64_t v27 = *(void *)(a1 + 32);
      id v28 = objc_msgSend(v20, "msv_description");
      *(_DWORD *)buf = 138543618;
      *(void *)&uint8_t buf[4] = v27;
      *(_WORD *)&buf[12] = 2114;
      *(void *)&buf[14] = v28;
      _os_log_impl(&dword_1A2D01000, v24, OS_LOG_TYPE_ERROR, "%{public}@: %{public}@", buf, 0x16u);
    }
    goto LABEL_31;
  }
  if (v10 == 403)
  {
    v20 = objc_msgSend(MEMORY[0x1E4F28C58], "msv_errorWithDomain:code:debugDescription:", @"ICError", -8100, @"Response error: %@", v9);

    double v21 = os_log_create("com.apple.amp.iTunesCloud", "Default");
    if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR))
    {
      uint64_t v22 = *(void *)(a1 + 32);
      *(_DWORD *)buf = 138543618;
      *(void *)&uint8_t buf[4] = v22;
      *(_WORD *)&buf[12] = 2114;
      *(void *)&buf[14] = v9;
      _os_log_impl(&dword_1A2D01000, v21, OS_LOG_TYPE_ERROR, "%{public}@: Music user token was revoked. Error description: %{public}@", buf, 0x16u);
    }

    if (*(void *)(a1 + 48))
    {
      int v23 = TCCAccessSetForBundleId();
      v24 = os_log_create("com.apple.amp.iTunesCloud", "Default");
      if (os_log_type_enabled(v24, OS_LOG_TYPE_DEFAULT))
      {
        uint64_t v25 = *(void *)(a1 + 32);
        uint64_t v26 = *(void *)(a1 + 48);
        *(_DWORD *)buf = 138543874;
        *(void *)&uint8_t buf[4] = v25;
        *(_WORD *)&buf[12] = 2114;
        *(void *)&buf[14] = v26;
        *(_WORD *)&buf[22] = 1024;
        LODWORD(v37) = v23;
        _os_log_impl(&dword_1A2D01000, v24, OS_LOG_TYPE_DEFAULT, "%{public}@: Revoked TCC access for %{public}@ with status %{BOOL}u.", buf, 0x1Cu);
      }
LABEL_31:
    }
  }
  else
  {
    if (!v5 && v10 == 200)
    {
      v24 = [v7 objectForKey:@"music_token"];
      if (_NSIsNSString())
      {
        v24 = v24;
        [*(id *)(a1 + 32) setResponse:v24];
        v29 = os_log_create("com.apple.amp.iTunesCloud", "Default");
        if (os_log_type_enabled(v29, OS_LOG_TYPE_DEFAULT))
        {
          uint64_t v30 = *(void *)(a1 + 32);
          *(_DWORD *)buf = 138543618;
          *(void *)&uint8_t buf[4] = v30;
          *(_WORD *)&buf[12] = 2112;
          *(void *)&buf[14] = v24;
          _os_log_impl(&dword_1A2D01000, v29, OS_LOG_TYPE_DEFAULT, "%{public}@: Music user token: \"%@\".", buf, 0x16u);
        }

        v31 = +[ICMusicUserTokenCache sharedCache];
        [v31 setCachedUserToken:v24 forDeveloperToken:*(void *)(*(void *)(a1 + 32) + 328) requestContext:*(void *)(a1 + 40) completion:0];

        v20 = 0;
      }
      else
      {
        uint64_t v32 = os_log_create("com.apple.amp.iTunesCloud", "Default");
        if (os_log_type_enabled(v32, OS_LOG_TYPE_ERROR))
        {
          uint64_t v33 = *(void *)(a1 + 32);
          v34 = (objc_class *)objc_opt_class();
          v35 = NSStringFromClass(v34);
          *(_DWORD *)buf = 138544130;
          *(void *)&uint8_t buf[4] = v33;
          *(_WORD *)&buf[12] = 2114;
          *(void *)&buf[14] = @"music_token";
          *(_WORD *)&buf[22] = 2114;
          v37 = v24;
          __int16 v38 = 2114;
          id v39 = v35;
          _os_log_impl(&dword_1A2D01000, v32, OS_LOG_TYPE_ERROR, "%{public}@: Server reported success, but %{public}@ was not a string: %{public}@ (of type %{public}@).", buf, 0x2Au);
        }
        v20 = objc_msgSend(MEMORY[0x1E4F28C58], "msv_errorWithDomain:code:debugDescription:", @"ICError", -7102, @"%@ in response is of unexpected type.", @"music_token");
      }
      goto LABEL_31;
    }
    v20 = v5;
  }
  [*(id *)(a1 + 32) finishWithError:v20];
}

- (void)execute
{
  uint64_t v35 = *MEMORY[0x1E4F143B8];
  if (![(ICMusicUserTokenFetchRequest *)self isCancelled])
  {
    if ([(NSString *)self->_developerToken length])
    {
      v3 = [(ICClientInfo *)self->_clientInfo requestingBundleIdentifier];
      uint64_t v4 = [v3 length];

      if (v4)
      {
        id v5 = [(ICClientInfo *)self->_clientInfo requestingBundleVersion];
        uint64_t v6 = [v5 length];

        if (v6)
        {
          v7 = +[ICPrivacyInfo sharedPrivacyInfo];
          int v8 = [v7 privacyAcknowledgementRequiredForMusic];

          if (v8)
          {
            objc_msgSend(MEMORY[0x1E4F28C58], "msv_errorWithDomain:code:debugDescription:", @"ICError", -7007, @"Not getting music user token because privacy acknowledgement is required.");
            uint64_t v9 = (ICStoreRequestContext *)objc_claimAutoreleasedReturnValue();
            uint64_t v10 = os_log_create("com.apple.amp.iTunesCloud", "Default");
            if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
            {
              int64_t v11 = [(ICStoreRequestContext *)v9 msv_description];
              *(_DWORD *)buf = 138543618;
              uint64_t v32 = self;
              __int16 v33 = 2114;
              v34 = v11;
              _os_log_impl(&dword_1A2D01000, v10, OS_LOG_TYPE_ERROR, "%{public}@: %{public}@", buf, 0x16u);
            }
            [(ICRequestOperation *)self finishWithError:v9];
          }
          else
          {
            uint64_t v15 = [ICStoreRequestContext alloc];
            v30[0] = MEMORY[0x1E4F143A8];
            v30[1] = 3221225472;
            v30[2] = __39__ICMusicUserTokenFetchRequest_execute__block_invoke;
            v30[3] = &unk_1E5ACC698;
            v30[4] = self;
            uint64_t v9 = [(ICStoreRequestContext *)v15 initWithBlock:v30];
            uint64_t v16 = [(ICStoreRequestContext *)v9 identityStore];
            os_log_type_t v17 = [(ICStoreRequestContext *)v9 identity];
            id v29 = 0;
            uint64_t v18 = [v16 getPropertiesForUserIdentity:v17 error:&v29];
            unint64_t v19 = (unint64_t)v29;

            if (v18 | v19)
            {
              uint64_t v22 = [MEMORY[0x1E4F29060] currentThread];
              uint64_t v23 = [v22 qualityOfService];

              if (self->_options)
              {
                uint64_t v26 = _ICLogCategoryDefault();
                if (os_log_type_enabled(v26, OS_LOG_TYPE_DEFAULT))
                {
                  *(_DWORD *)buf = 138543362;
                  uint64_t v32 = self;
                  _os_log_impl(&dword_1A2D01000, v26, OS_LOG_TYPE_DEFAULT, "%{public}@: shouldIgnoreCache = YES.", buf, 0xCu);
                }

                [(ICMusicUserTokenFetchRequest *)self _executeByPerformingStoreRequestWithContext:v9 qualityOfService:v23];
              }
              else
              {
                v24 = +[ICMusicUserTokenCache sharedCache];
                developerToken = self->_developerToken;
                v28[0] = MEMORY[0x1E4F143A8];
                v28[1] = 3221225472;
                v28[2] = __39__ICMusicUserTokenFetchRequest_execute__block_invoke_38;
                v28[3] = &unk_1E5AC8C68;
                v28[4] = self;
                v28[5] = v9;
                v28[6] = v23;
                [v24 getCachedUserTokenForDeveloperToken:developerToken requestContext:v9 completion:v28];
              }
            }
            else
            {
              v20 = os_log_create("com.apple.amp.iTunesCloud", "Default");
              if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
              {
                *(_DWORD *)buf = 138543362;
                uint64_t v32 = self;
                _os_log_impl(&dword_1A2D01000, v20, OS_LOG_TYPE_ERROR, "%{public}@: No active account. Failing request.", buf, 0xCu);
              }

              double v21 = objc_msgSend(MEMORY[0x1E4F28C58], "msv_errorWithDomain:code:debugDescription:", @"ICError", -7401, @"No active account.");
              [(ICRequestOperation *)self finishWithError:v21];
            }
          }
LABEL_18:

          return;
        }
        id v12 = @"Missing requesting bundle version for user token request.";
      }
      else
      {
        id v12 = @"Missing requesting bundle identifier for user token request.";
      }
    }
    else
    {
      id v12 = @"Missing developer token for user token request.";
    }
    objc_msgSend(MEMORY[0x1E4F28C58], "msv_errorWithDomain:code:debugDescription:", @"ICError", -7101, @"Invalid request: %@", v12);
    uint64_t v9 = (ICStoreRequestContext *)objc_claimAutoreleasedReturnValue();
    [(ICRequestOperation *)self finishWithError:v9];
    v13 = os_log_create("com.apple.amp.iTunesCloud", "Default");
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
    {
      uint64_t v14 = [(ICStoreRequestContext *)v9 msv_description];
      *(_DWORD *)buf = 138543618;
      uint64_t v32 = self;
      __int16 v33 = 2114;
      v34 = v14;
      _os_log_impl(&dword_1A2D01000, v13, OS_LOG_TYPE_ERROR, "%{public}@: Invalid request. %{public}@", buf, 0x16u);
    }
    goto LABEL_18;
  }
  id v27 = [MEMORY[0x1E4F28C58] errorWithDomain:@"ICError" code:-7004 userInfo:0];
  -[ICRequestOperation finishWithError:](self, "finishWithError:");
}

void __39__ICMusicUserTokenFetchRequest_execute__block_invoke(uint64_t a1, void *a2)
{
  id v4 = a2;
  v3 = +[ICUserIdentity activeAccount];
  [v4 setIdentity:v3];

  [v4 setClientInfo:*(void *)(*(void *)(a1 + 32) + 320)];
}

uint64_t __39__ICMusicUserTokenFetchRequest_execute__block_invoke_38(uint64_t a1, uint64_t a2)
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  if (a2)
  {
    [*(id *)(a1 + 32) setResponse:a2];
    v3 = os_log_create("com.apple.amp.iTunesCloud", "Default");
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v4 = *(void *)(a1 + 32);
      int v8 = 138543362;
      uint64_t v9 = v4;
      _os_log_impl(&dword_1A2D01000, v3, OS_LOG_TYPE_DEFAULT, "%{public}@: Found music user token in cache.", (uint8_t *)&v8, 0xCu);
    }

    return [*(id *)(a1 + 32) finish];
  }
  else
  {
    uint64_t v6 = os_log_create("com.apple.amp.iTunesCloud", "Default");
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v7 = *(void *)(a1 + 32);
      int v8 = 138543362;
      uint64_t v9 = v7;
      _os_log_impl(&dword_1A2D01000, v6, OS_LOG_TYPE_DEFAULT, "%{public}@: Did not find music user token in cache.", (uint8_t *)&v8, 0xCu);
    }

    return [*(id *)(a1 + 32) _executeByPerformingStoreRequestWithContext:*(void *)(a1 + 40) qualityOfService:*(void *)(a1 + 48)];
  }
}

- (void)encodeWithCoder:(id)a3
{
  v5.receiver = self;
  v5.super_class = (Class)ICMusicUserTokenFetchRequest;
  id v4 = a3;
  [(ICRemoteRequestOperation *)&v5 encodeWithCoder:v4];
  objc_msgSend(v4, "encodeObject:forKey:", self->_clientInfo, @"clientInfo", v5.receiver, v5.super_class);
  [v4 encodeObject:self->_developerToken forKey:@"developerToken"];
  [v4 encodeInteger:self->_options forKey:@"options"];
}

- (ICMusicUserTokenFetchRequest)initWithCoder:(id)a3
{
  id v4 = a3;
  v11.receiver = self;
  v11.super_class = (Class)ICMusicUserTokenFetchRequest;
  objc_super v5 = [(ICRemoteRequestOperation *)&v11 initWithCoder:v4];
  if (v5)
  {
    uint64_t v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"clientInfo"];
    clientInfo = v5->_clientInfo;
    v5->_clientInfo = (ICClientInfo *)v6;

    uint64_t v8 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"developerToken"];
    developerToken = v5->_developerToken;
    v5->_developerToken = (NSString *)v8;

    v5->_options = [v4 decodeIntegerForKey:@"options"];
  }

  return v5;
}

- (void)performRequestOnOperationQueue:(id)a3 withResponseHandler:(id)a4
{
  id v6 = a4;
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __83__ICMusicUserTokenFetchRequest_performRequestOnOperationQueue_withResponseHandler___block_invoke;
  v8[3] = &unk_1E5ACD8E0;
  v8[4] = self;
  id v9 = v6;
  id v7 = v6;
  [(ICRequestOperation *)self performRequestOnOperationQueue:a3 withCompletionHandler:v8];
}

void __83__ICMusicUserTokenFetchRequest_performRequestOnOperationQueue_withResponseHandler___block_invoke(uint64_t a1, void *a2)
{
  if (*(void *)(a1 + 40))
  {
    v3 = *(void **)(a1 + 32);
    id v4 = a2;
    id v7 = [v3 response];
    uint64_t v5 = *(void *)(a1 + 40);
    id v6 = objc_msgSend(v4, "msv_errorByRemovingUnsafeUserInfo");

    (*(void (**)(uint64_t, id, void *))(v5 + 16))(v5, v7, v6);
  }
}

- (void)performRequestWithResponseHandler:(id)a3
{
}

- (ICMusicUserTokenFetchRequest)initWithDeveloperToken:(id)a3 clientInfo:(id)a4 options:(unint64_t)a5
{
  id v9 = a3;
  id v10 = a4;
  v14.receiver = self;
  v14.super_class = (Class)ICMusicUserTokenFetchRequest;
  objc_super v11 = [(ICRequestOperation *)&v14 init];
  id v12 = v11;
  if (v11)
  {
    objc_storeStrong((id *)&v11->_developerToken, a3);
    objc_storeStrong((id *)&v12->_clientInfo, a4);
    v12->_options = a5;
  }

  return v12;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end