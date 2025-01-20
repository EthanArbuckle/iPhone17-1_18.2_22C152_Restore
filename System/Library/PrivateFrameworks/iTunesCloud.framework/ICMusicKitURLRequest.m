@interface ICMusicKitURLRequest
+ (Class)_responseClass;
+ (Class)_responseHandlerClass;
+ (unint64_t)_defaultMaxRetryCountForReason:(id)a3;
- (ICMusicKitRequestContext)requestContext;
- (ICMusicKitURLRequest)initWithURL:(id)a3 requestContext:(id)a4;
- (ICMusicKitURLRequest)initWithURLRequest:(id)a3 requestContext:(id)a4;
- (ICMusicKitURLRequest)initWithURLRequest:(id)a3 requestContext:(id)a4 resumeData:(id)a5;
- (ICStoreURLRequest)_pendingEquivalentStoreURLRequest;
- (NSDictionary)additionalHTTPCookies;
- (NSString)_developerToken;
- (id)_buildStoreURLRequestWithUpdatedDomains:(id)a3 withBag:(id)a4;
- (id)_description;
- (id)description;
- (void)_buildEquivalentStoreURLRequestWithDeveloperToken:(id)a3 completionHandler:(id)a4;
- (void)_buildMusicKitURLRequestWithBaseURLRequest:(id)a3 completionHandler:(id)a4;
- (void)_buildStoreURLRequestWithUpdatedDomains:(id)a3 completionHandler:(id)a4;
- (void)_buildUserTokenBasedMusicKitURLRequestWithBaseURLRequest:(id)a3 developerToken:(id)a4 completionHandler:(id)a5;
- (void)_setDeveloperToken:(id)a3;
- (void)_updateURLSessionManagedPropertiesForEquivalentStoreURLRequest:(id)a3;
- (void)buildURLRequestWithCompletionHandler:(id)a3;
- (void)setAdditionalHTTPCookies:(id)a3;
@end

@implementation ICMusicKitURLRequest

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_additionalHTTPCookies, 0);
  objc_storeStrong((id *)&self->_developerToken, 0);
  objc_storeStrong((id *)&self->_cachedDescription, 0);

  objc_storeStrong((id *)&self->_pendingEquivalentStoreURLRequest, 0);
}

- (void)setAdditionalHTTPCookies:(id)a3
{
}

- (NSString)_developerToken
{
  return self->_developerToken;
}

- (void)_updateURLSessionManagedPropertiesForEquivalentStoreURLRequest:(id)a3
{
  id v7 = a3;
  v4 = [(ICURLRequest *)self currentURLRequest];
  [v7 setCurrentURLRequest:v4];

  objc_msgSend(v7, "setRedirectCount:", -[ICURLRequest redirectCount](self, "redirectCount"));
  objc_msgSend(v7, "setRequestState:", -[ICURLRequest requestState](self, "requestState"));
  v5 = [(ICURLRequest *)self error];
  [v7 setError:v5];

  objc_msgSend(v7, "setHandlingType:", -[ICURLRequest handlingType](self, "handlingType"));
  v6 = [(ICURLRequest *)self retryReason];
  [v7 setRetryReason:v6];

  [(ICURLRequest *)self retryDelay];
  objc_msgSend(v7, "setRetryDelay:");
}

- (void)_buildUserTokenBasedMusicKitURLRequestWithBaseURLRequest:(id)a3 developerToken:(id)a4 completionHandler:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  v11 = (void *)[v8 copy];
  v15[0] = MEMORY[0x1E4F143A8];
  v15[1] = 3221225472;
  v15[2] = __114__ICMusicKitURLRequest__buildUserTokenBasedMusicKitURLRequestWithBaseURLRequest_developerToken_completionHandler___block_invoke;
  v15[3] = &unk_1E5ACC738;
  v15[4] = self;
  id v16 = v9;
  id v17 = v8;
  id v18 = v10;
  id v12 = v8;
  id v13 = v9;
  id v14 = v10;
  [(ICMusicKitURLRequest *)self _buildStoreURLRequestWithUpdatedDomains:v11 completionHandler:v15];
}

void __114__ICMusicKitURLRequest__buildUserTokenBasedMusicKitURLRequestWithBaseURLRequest_developerToken_completionHandler___block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  uint64_t v31 = *MEMORY[0x1E4F143B8];
  if (a3)
  {
    v4 = *(void (**)(void))(*(void *)(a1 + 56) + 16);
    v4();
  }
  else
  {
    v5 = (void *)[a2 mutableCopy];
    if ([*(id *)(*(void *)(a1 + 32) + 296) count]) {
      objc_msgSend(v5, "ic_appendHTTPCookies:", *(void *)(*(void *)(a1 + 32) + 296));
    }
    v6 = [NSString stringWithFormat:@"Bearer %@", *(void *)(a1 + 40)];
    [v5 setValue:v6 forHTTPHeaderField:@"Authorization"];
    id v7 = [*(id *)(a1 + 32) requestContext];
    BOOL v8 = +[ICStoreURLRequest _shouldPersonalizeRequestForRequestContext:personalizationStyle:](ICStoreURLRequest, "_shouldPersonalizeRequestForRequestContext:personalizationStyle:", v7, [v7 _storeRequestPersonalizationStyle]);
    id v9 = os_log_create("com.apple.amp.iTunesCloud", "Default");
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      id v10 = "unpersonalized";
      uint64_t v11 = *(void *)(a1 + 32);
      if (v8) {
        id v10 = "personalized";
      }
      *(_DWORD *)buf = 138543618;
      uint64_t v28 = v11;
      __int16 v29 = 2082;
      v30 = v10;
      _os_log_impl(&dword_1A2D01000, v9, OS_LOG_TYPE_DEFAULT, "%{public}@: Building %{public}s URL request.", buf, 0x16u);
    }

    if (v8)
    {
      id v12 = [v7 clientInfo];
      id v13 = [[ICMusicUserTokenFetchRequest alloc] initWithDeveloperToken:*(void *)(a1 + 40) clientInfo:v12 options:0];
      id v14 = objc_msgSend(MEMORY[0x1E4F28F08], "ic_sharedRequestOperationQueueWithQualityOfService:", 25);
      v20[0] = MEMORY[0x1E4F143A8];
      v20[1] = 3221225472;
      v20[2] = __114__ICMusicKitURLRequest__buildUserTokenBasedMusicKitURLRequestWithBaseURLRequest_developerToken_completionHandler___block_invoke_128;
      v20[3] = &unk_1E5ACC710;
      id v15 = v5;
      uint64_t v16 = *(void *)(a1 + 32);
      id v21 = v15;
      uint64_t v22 = v16;
      id v26 = *(id *)(a1 + 56);
      id v23 = v7;
      id v24 = v12;
      id v25 = *(id *)(a1 + 48);
      id v17 = v12;
      [(ICMusicUserTokenFetchRequest *)v13 performRequestOnOperationQueue:v14 withResponseHandler:v20];
    }
    else
    {
      id v18 = os_log_create("com.apple.amp.iTunesCloud", "Default");
      if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
      {
        uint64_t v19 = *(void *)(a1 + 32);
        *(_DWORD *)buf = 138543618;
        uint64_t v28 = v19;
        __int16 v29 = 2114;
        v30 = (const char *)v5;
        _os_log_impl(&dword_1A2D01000, v18, OS_LOG_TYPE_DEFAULT, "%{public}@: Skipping personalization; issuing request merely decorated with a developer token: %{public}@.",
          buf,
          0x16u);
      }

      (*(void (**)(void))(*(void *)(a1 + 56) + 16))();
    }
  }
}

void __114__ICMusicKitURLRequest__buildUserTokenBasedMusicKitURLRequestWithBaseURLRequest_developerToken_completionHandler___block_invoke_128(uint64_t a1, void *a2, void *a3)
{
  uint64_t v39 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  id v6 = a3;
  id v7 = v6;
  if (!v5 || v6)
  {
    uint64_t v11 = [v6 domain];
    if ([v11 isEqualToString:@"ICError"])
    {
      uint64_t v12 = [v7 code];

      if (v12 == -8101)
      {
        unint64_t v13 = [*(id *)(a1 + 40) _retryCountForReason:@"developer-token-invalidated"];
        unint64_t v14 = [*(id *)(a1 + 40) _maxRetryCountForReason:@"developer-token-invalidated"];
        if (v13 < v14)
        {
          id v15 = os_log_create("com.apple.amp.iTunesCloud", "Default");
          if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
          {
            uint64_t v16 = *(void *)(a1 + 40);
            *(_DWORD *)buf = 138543362;
            uint64_t v30 = v16;
            _os_log_impl(&dword_1A2D01000, v15, OS_LOG_TYPE_ERROR, "%{public}@: Unauthorized to fetch user token. Invalidating developer token.", buf, 0xCu);
          }

          [*(id *)(a1 + 40) _incrementRetryCountForReason:@"developer-token-invalidated"];
          id v17 = [*(id *)(a1 + 48) developerTokenProvider];
          v26[0] = MEMORY[0x1E4F143A8];
          v26[1] = 3221225472;
          v26[2] = __114__ICMusicKitURLRequest__buildUserTokenBasedMusicKitURLRequestWithBaseURLRequest_developerToken_completionHandler___block_invoke_138;
          v26[3] = &unk_1E5ACC6E8;
          v26[4] = *(void *)(a1 + 40);
          uint64_t v18 = *(void *)(a1 + 56);
          id v27 = *(id *)(a1 + 64);
          id v28 = *(id *)(a1 + 72);
          [v17 invalidateCachedDeveloperTokenForClientInfo:v18 completionHandler:v26];

          goto LABEL_17;
        }
        unint64_t v22 = v14;
        id v17 = objc_msgSend(MEMORY[0x1E4F28C58], "msv_errorWithDomain:code:underlyingError:debugDescription:", @"ICError", -8101, v7, @"Unauthorized to fetch user token, but reached maximum retry count for developer token invalidation aborting.");;
        id v23 = os_log_create("com.apple.amp.iTunesCloud", "Default");
        if (os_log_type_enabled(v23, OS_LOG_TYPE_ERROR))
        {
          uint64_t v24 = *(void *)(a1 + 40);
          id v25 = objc_msgSend(v17, "msv_description");
          *(_DWORD *)buf = 138544386;
          uint64_t v30 = v24;
          __int16 v31 = 2114;
          v32 = v25;
          __int16 v33 = 2114;
          v34 = @"developer-token-invalidated";
          __int16 v35 = 2048;
          unint64_t v36 = v13;
          __int16 v37 = 2048;
          unint64_t v38 = v22;
          _os_log_impl(&dword_1A2D01000, v23, OS_LOG_TYPE_ERROR, "%{public}@: %{public}@ (retryReason = %{public}@, retryCount = %lu, maxRetryCount = %lu)", buf, 0x34u);
        }
LABEL_16:
        (*(void (**)(void))(*(void *)(a1 + 72) + 16))();
LABEL_17:

        goto LABEL_18;
      }
    }
    else
    {
    }
    id v17 = objc_msgSend(MEMORY[0x1E4F28C58], "msv_errorWithDomain:code:underlyingError:debugDescription:", @"ICError", -8102, v7, @"Failed to fetch user token.");
    uint64_t v19 = os_log_create("com.apple.amp.iTunesCloud", "Default");
    if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
    {
      uint64_t v20 = *(void *)(a1 + 40);
      id v21 = objc_msgSend(v7, "msv_description");
      *(_DWORD *)buf = 138543618;
      uint64_t v30 = v20;
      __int16 v31 = 2114;
      v32 = v21;
      _os_log_impl(&dword_1A2D01000, v19, OS_LOG_TYPE_ERROR, "%{public}@: %{public}@", buf, 0x16u);
    }
    goto LABEL_16;
  }
  [*(id *)(a1 + 32) setValue:v5 forHTTPHeaderField:@"Music-User-Token"];
  BOOL v8 = os_log_create("com.apple.amp.iTunesCloud", "Default");
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    id v10 = *(void **)(a1 + 32);
    uint64_t v9 = *(void *)(a1 + 40);
    *(_DWORD *)buf = 138543618;
    uint64_t v30 = v9;
    __int16 v31 = 2114;
    v32 = v10;
    _os_log_impl(&dword_1A2D01000, v8, OS_LOG_TYPE_DEFAULT, "%{public}@: Issuing request decorated with both a developer token and a user token: %{public}@.", buf, 0x16u);
  }

  (*(void (**)(void))(*(void *)(a1 + 72) + 16))();
LABEL_18:
}

void __114__ICMusicKitURLRequest__buildUserTokenBasedMusicKitURLRequestWithBaseURLRequest_developerToken_completionHandler___block_invoke_138(uint64_t a1, int a2, uint64_t a3)
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  if (a2)
  {
    v4 = os_log_create("com.apple.amp.iTunesCloud", "Default");
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v5 = *(void *)(a1 + 32);
      int v10 = 138543362;
      uint64_t v11 = v5;
      _os_log_impl(&dword_1A2D01000, v4, OS_LOG_TYPE_DEFAULT, "%{public}@: Successfully invalidated developer token; retrying building URL request.",
        (uint8_t *)&v10,
        0xCu);
    }

    [*(id *)(a1 + 32) _buildMusicKitURLRequestWithBaseURLRequest:*(void *)(a1 + 40) completionHandler:*(void *)(a1 + 48)];
  }
  else
  {
    id v6 = objc_msgSend(MEMORY[0x1E4F28C58], "msv_errorWithDomain:code:underlyingError:debugDescription:", @"ICError", -8101, a3, @"Unauthorized to fetch user token, but developer token invalidation failed aborting.");;
    id v7 = os_log_create("com.apple.amp.iTunesCloud", "Default");
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      uint64_t v8 = *(void *)(a1 + 32);
      uint64_t v9 = objc_msgSend(v6, "msv_description");
      int v10 = 138543618;
      uint64_t v11 = v8;
      __int16 v12 = 2114;
      unint64_t v13 = v9;
      _os_log_impl(&dword_1A2D01000, v7, OS_LOG_TYPE_ERROR, "%{public}@: %{public}@", (uint8_t *)&v10, 0x16u);
    }
    (*(void (**)(void))(*(void *)(a1 + 48) + 16))();
  }
}

- (void)_buildEquivalentStoreURLRequestWithDeveloperToken:(id)a3 completionHandler:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  uint64_t v8 = [(ICURLRequest *)self urlRequest];
  uint64_t v9 = (void *)[v8 copy];
  v12[0] = MEMORY[0x1E4F143A8];
  v12[1] = 3221225472;
  v12[2] = __92__ICMusicKitURLRequest__buildEquivalentStoreURLRequestWithDeveloperToken_completionHandler___block_invoke;
  v12[3] = &unk_1E5ACC6C0;
  uint64_t v14 = self;
  id v15 = v7;
  id v13 = v6;
  id v10 = v6;
  id v11 = v7;
  [(ICMusicKitURLRequest *)self _buildStoreURLRequestWithUpdatedDomains:v9 completionHandler:v12];
}

void __92__ICMusicKitURLRequest__buildEquivalentStoreURLRequestWithDeveloperToken_completionHandler___block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  uint64_t v27 = *MEMORY[0x1E4F143B8];
  if (a3)
  {
    v4 = *(void (**)(void))(*(void *)(a1 + 48) + 16);
    v4();
  }
  else
  {
    uint64_t v5 = (void *)[a2 mutableCopy];
    id v6 = [NSString stringWithFormat:@"Bearer %@", *(void *)(a1 + 32)];
    [v5 setValue:v6 forHTTPHeaderField:@"Authorization"];
    id v7 = [*(id *)(a1 + 40) requestContext];
    uint64_t v8 = [ICStoreRequestContext alloc];
    v21[0] = MEMORY[0x1E4F143A8];
    v21[1] = 3221225472;
    v21[2] = __92__ICMusicKitURLRequest__buildEquivalentStoreURLRequestWithDeveloperToken_completionHandler___block_invoke_2;
    v21[3] = &unk_1E5ACC698;
    id v9 = v7;
    id v22 = v9;
    id v10 = [(ICStoreRequestContext *)v8 initWithBlock:v21];
    id v11 = [ICStoreURLRequest alloc];
    __int16 v12 = [*(id *)(a1 + 40) resumeData];
    id v13 = [(ICStoreURLRequest *)v11 initWithURLRequest:v5 requestContext:v10 resumeData:v12];

    -[ICURLRequest setPrioritize:](v13, "setPrioritize:", [*(id *)(a1 + 40) prioritize]);
    -[ICURLRequest setCancelOnHTTPErrors:](v13, "setCancelOnHTTPErrors:", [*(id *)(a1 + 40) cancelOnHTTPErrors]);
    -[ICURLRequest setMaxRetryCount:](v13, "setMaxRetryCount:", [*(id *)(a1 + 40) maxRetryCount]);
    uint64_t v14 = [*(id *)(a1 + 40) additionalHTTPCookies];
    [(ICStoreURLRequest *)v13 setAdditionalHTTPCookies:v14];

    -[ICURLRequest setType:](v13, "setType:", [*(id *)(a1 + 40) type]);
    id v15 = [*(id *)(a1 + 40) responseDataURL];
    [(ICURLRequest *)v13 setResponseDataURL:v15];

    [*(id *)(a1 + 40) _updateURLSessionManagedPropertiesForEquivalentStoreURLRequest:v13];
    uint64_t v16 = *(void *)(a1 + 40);
    id v17 = *(void **)(v16 + 272);
    if (v17)
    {
      uint64_t v18 = [v17 machineDataSyncState];
      [(ICStoreURLRequest *)v13 setMachineDataSyncState:v18];

      uint64_t v16 = *(void *)(a1 + 40);
    }
    objc_storeStrong((id *)(v16 + 272), v13);
    uint64_t v19 = os_log_create("com.apple.amp.iTunesCloud", "Default");
    if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v20 = *(void *)(a1 + 40);
      *(_DWORD *)buf = 138543618;
      uint64_t v24 = v20;
      __int16 v25 = 2114;
      id v26 = v13;
      _os_log_impl(&dword_1A2D01000, v19, OS_LOG_TYPE_DEFAULT, "%{public}@: Deferring to equivalent store URL request to build the actual URL request: %{public}@.", buf, 0x16u);
    }

    [(ICStoreURLRequest *)v13 buildURLRequestWithCompletionHandler:*(void *)(a1 + 48)];
  }
}

void __92__ICMusicKitURLRequest__buildEquivalentStoreURLRequestWithDeveloperToken_completionHandler___block_invoke_2(uint64_t a1, void *a2)
{
  id v16 = a2;
  v3 = +[ICDeviceInfo currentDeviceInfo];
  int v4 = [v3 isMac];

  if (v4)
  {
    uint64_t v5 = [ICClientInfo alloc];
    id v6 = [*(id *)(a1 + 32) clientInfo];
    id v7 = [v6 bundleIdentifier];
    uint64_t v8 = [(ICClientInfo *)v5 initWithBundleIdentifier:v7];
  }
  else
  {
    uint64_t v8 = [*(id *)(a1 + 32) clientInfo];
  }
  [v16 setClientInfo:v8];

  id v9 = [*(id *)(a1 + 32) deviceInfo];
  [v16 setDeviceInfo:v9];

  id v10 = [*(id *)(a1 + 32) authenticationProvider];
  [v16 setAuthenticationProvider:v10];

  id v11 = [*(id *)(a1 + 32) networkConstraints];
  [v16 setNetworkConstraints:v11];

  __int16 v12 = [*(id *)(a1 + 32) identity];
  [v16 setIdentity:v12];

  id v13 = [*(id *)(a1 + 32) delegatedIdentity];
  [v16 setDelegatedIdentity:v13];

  uint64_t v14 = [*(id *)(a1 + 32) identityStore];
  [v16 setIdentityStore:v14];

  id v15 = [*(id *)(a1 + 32) storeDialogResponseHandler];
  [v16 setStoreDialogResponseHandler:v15];

  objc_msgSend(v16, "setAllowsExpiredBags:", objc_msgSend(*(id *)(a1 + 32), "allowsExpiredBags"));
  objc_msgSend(v16, "setPersonalizationStyle:", objc_msgSend(*(id *)(a1 + 32), "_storeRequestPersonalizationStyle"));
}

- (id)_buildStoreURLRequestWithUpdatedDomains:(id)a3 withBag:(id)a4
{
  uint64_t v45 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  uint64_t v8 = (void *)[v6 mutableCopy];
  id v9 = [v7 dictionaryForBagKey:@"ampMusicAPIRegexDomains"];
  if (_os_feature_enabled_impl())
  {
    id v10 = os_log_create("com.apple.amp.iTunesCloud", "Default");
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138543618;
      unint64_t v38 = self;
      __int16 v39 = 2112;
      v40 = v9;
      _os_log_impl(&dword_1A2D01000, v10, OS_LOG_TYPE_DEFAULT, "%{public}@: Overriding Music API Domain Regex Dictionary from %@", buf, 0x16u);
    }

    id v9 = &unk_1EF640D70;
  }
  else if (!v9)
  {
    goto LABEL_23;
  }
  id v11 = objc_msgSend(v9, "ic_dictionaryValueForKey:", @"default");
  uint64_t v12 = objc_msgSend(v11, "ic_stringValueForKey:", @"domain");
  id v13 = (void *)v12;
  if (!v11) {
    goto LABEL_22;
  }
  if (!v12) {
    goto LABEL_22;
  }
  uint64_t v14 = [v6 URL];
  id v15 = [v14 host];
  int v16 = [v15 isEqualToString:v13];

  if (!v16) {
    goto LABEL_22;
  }
  uint64_t v30 = self;
  id v17 = [v6 URL];
  uint64_t v18 = [v17 absoluteString];

  uint64_t v19 = (void *)[objc_alloc(MEMORY[0x1E4F29088]) initWithString:v18];
  unint64_t v36 = v18;
  uint64_t v35 = [v18 length];
  uint64_t v20 = objc_msgSend(v9, "ic_arrayValueForKey:", @"endpoints");
  id v21 = v20;
  if (!v20) {
    goto LABEL_21;
  }
  v32 = v8;
  __int16 v33 = v19;
  id v31 = v7;
  if (![v20 count]) {
    goto LABEL_20;
  }
  uint64_t v22 = 0;
  id v34 = v6;
  while (1)
  {
    id v23 = [v21 objectAtIndex:v22];
    if ([v23 isNSDictionary]) {
      break;
    }
LABEL_19:

    if (++v22 >= (unint64_t)[v21 count]) {
      goto LABEL_20;
    }
  }
  uint64_t v24 = objc_msgSend(v23, "ic_stringValueForKey:", @"domain");
  __int16 v25 = objc_msgSend(v23, "ic_stringValueForKey:", @"pattern");
  if (![v24 length] || !objc_msgSend(v25, "length"))
  {
LABEL_18:

    goto LABEL_19;
  }
  id v26 = (void *)[objc_alloc(MEMORY[0x1E4F28FD8]) initWithPattern:v25 options:1 error:0];
  if (!objc_msgSend(v26, "numberOfMatchesInString:options:range:", v18, 0, 0, v35) || !objc_msgSend(v24, "length"))
  {

    id v6 = v34;
    goto LABEL_18;
  }
  __int16 v29 = _ICLogCategoryDefault();
  if (os_log_type_enabled(v29, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138544130;
    unint64_t v38 = v30;
    __int16 v39 = 2114;
    v40 = v36;
    __int16 v41 = 2114;
    v42 = v24;
    __int16 v43 = 2048;
    uint64_t v44 = v22;
    _os_log_impl(&dword_1A2D01000, v29, OS_LOG_TYPE_DEFAULT, "%{public}@: Updating URL: %{public}@ with matched host %{public}@ from pattern at index %lu", buf, 0x2Au);
  }

  [v33 setHost:v24];
  id v6 = v34;
LABEL_20:
  uint64_t v19 = v33;
  uint64_t v27 = [v33 URL];
  uint64_t v8 = v32;
  [v32 setURL:v27];

  id v7 = v31;
LABEL_21:

LABEL_22:
LABEL_23:

  return v8;
}

- (void)_buildStoreURLRequestWithUpdatedDomains:(id)a3 completionHandler:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if (_os_feature_enabled_impl())
  {
    uint64_t v8 = +[ICURLBagProvider sharedBagProvider];
    id v9 = [(ICMusicKitURLRequest *)self requestContext];
    v10[0] = MEMORY[0x1E4F143A8];
    v10[1] = 3221225472;
    v10[2] = __82__ICMusicKitURLRequest__buildStoreURLRequestWithUpdatedDomains_completionHandler___block_invoke;
    v10[3] = &unk_1E5ACD1D8;
    id v12 = v7;
    v10[4] = self;
    id v11 = v6;
    [v8 getBagForRequestContext:v9 withCompletionHandler:v10];
  }
  else
  {
    (*((void (**)(id, id, void))v7 + 2))(v7, v6, 0);
  }
}

void __82__ICMusicKitURLRequest__buildStoreURLRequestWithUpdatedDomains_completionHandler___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  if (a3)
  {
    int v4 = *(void (**)(void))(*(void *)(a1 + 48) + 16);
    v4();
  }
  else
  {
    uint64_t v5 = [*(id *)(a1 + 32) _buildStoreURLRequestWithUpdatedDomains:*(void *)(a1 + 40) withBag:a2];
    id v6 = (id)[v5 copy];

    (*(void (**)(void))(*(void *)(a1 + 48) + 16))();
  }
}

- (void)_buildMusicKitURLRequestWithBaseURLRequest:(id)a3 completionHandler:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  uint64_t v8 = [(ICMusicKitURLRequest *)self requestContext];
  id v9 = [v8 clientInfo];
  id v10 = [v8 developerTokenProvider];
  v15[0] = MEMORY[0x1E4F143A8];
  v15[1] = 3221225472;
  v15[2] = __85__ICMusicKitURLRequest__buildMusicKitURLRequestWithBaseURLRequest_completionHandler___block_invoke;
  v15[3] = &unk_1E5ACC668;
  id v16 = v10;
  id v17 = self;
  id v19 = v6;
  id v20 = v7;
  id v18 = v8;
  id v11 = v6;
  id v12 = v8;
  id v13 = v7;
  id v14 = v10;
  [v14 fetchDeveloperTokenForClientInfo:v9 completionHandler:v15];
}

void __85__ICMusicKitURLRequest__buildMusicKitURLRequestWithBaseURLRequest_completionHandler___block_invoke(uint64_t a1, void *a2, void *a3)
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  id v6 = a3;
  id v7 = v6;
  if (!v5 || v6)
  {
    id v9 = objc_msgSend(MEMORY[0x1E4F28C58], "msv_errorWithDomain:code:underlyingError:debugDescription:", @"ICError", -8200, v6, @"Failed to fetch developer token from %@.", *(void *)(a1 + 32));
    id v10 = os_log_create("com.apple.amp.iTunesCloud", "Default");
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
    {
      uint64_t v11 = *(void *)(a1 + 40);
      id v12 = objc_msgSend(v9, "msv_description");
      *(_DWORD *)buf = 138543618;
      uint64_t v14 = v11;
      __int16 v15 = 2114;
      id v16 = v12;
      _os_log_impl(&dword_1A2D01000, v10, OS_LOG_TYPE_ERROR, "%{public}@: %{public}@", buf, 0x16u);
    }
    (*(void (**)(void))(*(void *)(a1 + 64) + 16))();
  }
  else
  {
    [*(id *)(a1 + 40) _setDeveloperToken:v5];
    uint64_t v8 = [*(id *)(a1 + 48) personalizationMethod];
    if (v8 == 1)
    {
      [*(id *)(a1 + 40) _buildUserTokenBasedMusicKitURLRequestWithBaseURLRequest:*(void *)(a1 + 56) developerToken:v5 completionHandler:*(void *)(a1 + 64)];
    }
    else if (!v8)
    {
      [*(id *)(a1 + 40) _buildEquivalentStoreURLRequestWithDeveloperToken:v5 completionHandler:*(void *)(a1 + 64)];
    }
  }
}

- (ICMusicKitRequestContext)requestContext
{
  v4.receiver = self;
  v4.super_class = (Class)ICMusicKitURLRequest;
  v2 = [(ICURLRequest *)&v4 requestContext];

  return (ICMusicKitRequestContext *)v2;
}

- (NSDictionary)additionalHTTPCookies
{
  if (self->_additionalHTTPCookies) {
    return self->_additionalHTTPCookies;
  }
  else {
    return (NSDictionary *)MEMORY[0x1E4F1CC08];
  }
}

- (void)buildURLRequestWithCompletionHandler:(id)a3
{
  id v4 = a3;
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __61__ICMusicKitURLRequest_buildURLRequestWithCompletionHandler___block_invoke;
  v7[3] = &unk_1E5ACC638;
  v7[4] = self;
  id v8 = v4;
  v6.receiver = self;
  v6.super_class = (Class)ICMusicKitURLRequest;
  id v5 = v4;
  [(ICURLRequest *)&v6 buildURLRequestWithCompletionHandler:v7];
}

void __61__ICMusicKitURLRequest_buildURLRequestWithCompletionHandler___block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  if (!v5 || a3)
  {
    (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
  }
  else
  {
    objc_super v6 = +[ICSecurityInfo sharedSecurityInfo];
    if ([v6 isContentProtectionEnabled]
      && ([v6 isDeviceClassCUnlocked] & 1) == 0)
    {
      id v7 = os_log_create("com.apple.amp.iTunesCloud", "Default");
      if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
      {
        uint64_t v8 = *(void *)(a1 + 32);
        int v11 = 138543362;
        uint64_t v12 = v8;
        _os_log_impl(&dword_1A2D01000, v7, OS_LOG_TYPE_ERROR, "%{public}@: Request was issued before before first unlock, returning error.", (uint8_t *)&v11, 0xCu);
      }

      uint64_t v9 = *(void *)(a1 + 40);
      id v10 = [MEMORY[0x1E4F28C58] errorWithDomain:@"ICError" code:-7006 userInfo:0];
      (*(void (**)(uint64_t, void, void *))(v9 + 16))(v9, 0, v10);
    }
    else
    {
      [*(id *)(a1 + 32) _buildMusicKitURLRequestWithBaseURLRequest:v5 completionHandler:*(void *)(a1 + 40)];
    }
  }
}

- (id)description
{
  v3 = self->_cachedDescription;
  if (!v3)
  {
    id v4 = [(ICMusicKitURLRequest *)self _description];
    id v5 = (NSString *)[v4 copy];
    cachedDescription = self->_cachedDescription;
    self->_cachedDescription = v5;

    v3 = self->_cachedDescription;
  }

  return v3;
}

- (id)_description
{
  id v3 = objc_alloc(MEMORY[0x1E4F28E78]);
  id v4 = (objc_class *)objc_opt_class();
  id v5 = NSStringFromClass(v4);
  objc_super v6 = (void *)[v3 initWithFormat:@"<%@: %p", v5, self];

  id v7 = [(ICMusicKitURLRequest *)self requestContext];
  [v6 appendFormat:@"; requestContext = %@", v7];
  [v6 appendString:@">"];

  return v6;
}

- (ICStoreURLRequest)_pendingEquivalentStoreURLRequest
{
  [(ICMusicKitURLRequest *)self _updateURLSessionManagedPropertiesForEquivalentStoreURLRequest:self->_pendingEquivalentStoreURLRequest];
  pendingEquivalentStoreURLRequest = self->_pendingEquivalentStoreURLRequest;

  return pendingEquivalentStoreURLRequest;
}

- (void)_setDeveloperToken:(id)a3
{
  uint64_t v9 = (NSString *)a3;
  id v4 = self->_developerToken;
  developerToken = v9;
  if (v4 != v9)
  {
    objc_super v6 = v4;
    char v7 = [(NSString *)v4 isEqual:v9];

    if (v7) {
      goto LABEL_5;
    }
    uint64_t v8 = v9;
    developerToken = self->_developerToken;
    self->_developerToken = v8;
  }

LABEL_5:
}

- (ICMusicKitURLRequest)initWithURLRequest:(id)a3 requestContext:(id)a4 resumeData:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    uint64_t v13 = [MEMORY[0x1E4F28B00] currentHandler];
    [v13 handleFailureInMethod:a2, self, @"ICMusicKitURLRequest.m", 49, @"Invalid parameter not satisfying: %@", @"[requestContext isKindOfClass:[ICMusicKitRequestContext class]]" object file lineNumber description];
  }
  v14.receiver = self;
  v14.super_class = (Class)ICMusicKitURLRequest;
  id v10 = [(ICURLRequest *)&v14 initWithURLRequest:v8 requestContext:v9 resumeData:0];
  int v11 = v10;
  if (v10) {
    [(ICURLRequest *)v10 setCancelOnHTTPErrors:0];
  }

  return v11;
}

- (ICMusicKitURLRequest)initWithURLRequest:(id)a3 requestContext:(id)a4
{
  return [(ICMusicKitURLRequest *)self initWithURLRequest:a3 requestContext:a4 resumeData:0];
}

- (ICMusicKitURLRequest)initWithURL:(id)a3 requestContext:(id)a4
{
  objc_super v6 = (void *)MEMORY[0x1E4F18DA8];
  id v7 = a4;
  id v8 = [v6 requestWithURL:a3];
  id v9 = [(ICMusicKitURLRequest *)self initWithURLRequest:v8 requestContext:v7 resumeData:0];

  return v9;
}

+ (Class)_responseHandlerClass
{
  return (Class)objc_opt_class();
}

+ (Class)_responseClass
{
  return (Class)objc_opt_class();
}

+ (unint64_t)_defaultMaxRetryCountForReason:(id)a3
{
  id v3 = (__CFString *)a3;
  id v4 = @"developer-token-invalidated";
  if (v3 == @"developer-token-invalidated")
  {
    int v11 = @"developer-token-invalidated";
LABEL_11:

    goto LABEL_12;
  }
  char v5 = [(__CFString *)v3 isEqual:@"developer-token-invalidated"];

  if (v5)
  {
LABEL_12:
    unint64_t v10 = 1;
    goto LABEL_13;
  }
  objc_super v6 = @"music-user-token-invalidated";
  if (v3 == @"music-user-token-invalidated")
  {
    int v11 = @"music-user-token-invalidated";
    goto LABEL_11;
  }
  char v7 = [(__CFString *)v3 isEqual:@"music-user-token-invalidated"];

  if (v7) {
    goto LABEL_12;
  }
  id v8 = @"other";
  if (v3 == @"other")
  {
    int v11 = @"other";
    goto LABEL_11;
  }
  char v9 = [(__CFString *)v3 isEqual:@"other"];

  if (v9) {
    goto LABEL_12;
  }
  unint64_t v10 = +[ICStoreURLRequest _defaultMaxRetryCountForReason:v3];
LABEL_13:

  return v10;
}

@end