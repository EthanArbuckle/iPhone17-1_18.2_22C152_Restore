@interface ICStoreURLRequest
+ (BOOL)_shouldPersonalizeRequestForRequestContext:(id)a3 personalizationStyle:(int64_t)a4;
+ (Class)_responseHandlerClass;
+ (NSString)currentConnectionTypeHeader;
+ (unint64_t)_defaultMaxRetryCountForReason:(id)a3;
- (BOOL)_isPersonalizationRestricted;
- (BOOL)shouldParseBodyData;
- (BOOL)shouldRequireURLBag;
- (BOOL)shouldUseMescalSigning;
- (ICJSSignConfiguration)JSSignConfiguration;
- (ICStoreURLRequest)initWithURL:(id)a3 requestContext:(id)a4;
- (ICStoreURLRequest)initWithURLRequest:(id)a3 requestContext:(id)a4;
- (ICStoreURLRequest)initWithURLRequest:(id)a3 requestContext:(id)a4 resumeData:(id)a5;
- (NSArray)additionalQueryItems;
- (NSDictionary)additionalHTTPCookies;
- (NSString)machineDataSyncState;
- (id)_stringForCachePolicy:(unint64_t)a3;
- (id)description;
- (int64_t)anisetteVersion;
- (void)_getSignatureDataForRequest:(id)a3 urlBag:(id)a4 completionHandler:(id)a5;
- (void)buildStoreURLRequestWithURLRequest:(id)a3 builderProperties:(id)a4 completionHandler:(id)a5;
- (void)buildURLRequestWithCompletionHandler:(id)a3;
- (void)setAdditionalHTTPCookies:(id)a3;
- (void)setAdditionalQueryItems:(id)a3;
- (void)setAnisetteVersion:(int64_t)a3;
- (void)setJSSignConfiguration:(id)a3;
- (void)setMachineDataSyncState:(id)a3;
- (void)setShouldParseBodyData:(BOOL)a3;
- (void)setShouldRequireURLBag:(BOOL)a3;
- (void)setShouldUseMescalSigning:(BOOL)a3;
@end

@implementation ICStoreURLRequest

- (id)description
{
  v7.receiver = self;
  v7.super_class = (Class)ICStoreURLRequest;
  v3 = [(ICURLRequest *)&v7 description];
  v4 = [(ICStoreURLRequest *)self storeRequestContext];
  v5 = [v3 stringByAppendingFormat:@"[requestContext=%@]", v4];

  return v5;
}

- (BOOL)shouldParseBodyData
{
  return self->_shouldParseBodyData;
}

void __92__ICStoreURLRequest_buildStoreURLRequestWithURLRequest_builderProperties_completionHandler___block_invoke_247(uint64_t a1)
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  if (*(unsigned char *)(a1 + 40))
  {
    v2 = +[ICAuthenticationUtilities sharedAuthKitSession];
    v3 = [v2 appleIDHeadersForRequest:*(void *)(a1 + 32)];
    long long v11 = 0u;
    long long v12 = 0u;
    long long v13 = 0u;
    long long v14 = 0u;
    uint64_t v4 = [v3 countByEnumeratingWithState:&v11 objects:v15 count:16];
    if (v4)
    {
      uint64_t v5 = v4;
      uint64_t v6 = *(void *)v12;
      do
      {
        for (uint64_t i = 0; i != v5; ++i)
        {
          if (*(void *)v12 != v6) {
            objc_enumerationMutation(v3);
          }
          uint64_t v8 = *(void *)(*((void *)&v11 + 1) + 8 * i);
          v9 = *(void **)(a1 + 32);
          v10 = [v3 objectForKeyedSubscript:v8];
          [v9 setValue:v10 forHTTPHeaderField:v8];
        }
        uint64_t v5 = [v3 countByEnumeratingWithState:&v11 objects:v15 count:16];
      }
      while (v5);
    }
  }
}

- (ICStoreURLRequest)initWithURLRequest:(id)a3 requestContext:(id)a4 resumeData:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    long long v13 = [MEMORY[0x1E4F28B00] currentHandler];
    [v13 handleFailureInMethod:a2, self, @"ICStoreURLRequest.m", 128, @"Invalid parameter not satisfying: %@", @"[requestContext isKindOfClass:[ICStoreRequestContext class]]" object file lineNumber description];
  }
  v14.receiver = self;
  v14.super_class = (Class)ICStoreURLRequest;
  v10 = [(ICURLRequest *)&v14 initWithURLRequest:v8 requestContext:v9 resumeData:0];
  long long v11 = v10;
  if (v10)
  {
    v10->_shouldRequireURLBag = 1;
    v10->_anisetteVersion = -1;
    v10->_shouldUseMescalSigning = 1;
    v10->_shouldParseBodyData = 1;
    [(ICURLRequest *)v10 setCancelOnHTTPErrors:0];
  }

  return v11;
}

+ (Class)_responseHandlerClass
{
  return (Class)objc_opt_class();
}

- (ICStoreURLRequest)initWithURL:(id)a3 requestContext:(id)a4
{
  uint64_t v6 = (void *)MEMORY[0x1E4F18DA8];
  id v7 = a4;
  id v8 = [v6 requestWithURL:a3];
  id v9 = [(ICStoreURLRequest *)self initWithURLRequest:v8 requestContext:v7 resumeData:0];

  return v9;
}

- (void)setShouldUseMescalSigning:(BOOL)a3
{
  self->_shouldUseMescalSigning = a3;
}

- (ICStoreURLRequest)initWithURLRequest:(id)a3 requestContext:(id)a4
{
  return [(ICStoreURLRequest *)self initWithURLRequest:a3 requestContext:a4 resumeData:0];
}

void __58__ICStoreURLRequest_buildURLRequestWithCompletionHandler___block_invoke_185(uint64_t a1)
{
  uint64_t v42 = *MEMORY[0x1E4F143B8];
  v2 = [*(id *)(a1 + 32) identity];
  if ([v2 isEqualToIdentity:*(void *)(a1 + 40) inStore:*(void *)(a1 + 48)])
  {
    v3 = [*(id *)(a1 + 56) iCloudIdentityProperties];
    uint64_t v4 = *(void **)(a1 + 64);
    uint64_t v5 = [v3 iCloudPersonID];
    [v4 setICloudPersonID:v5];

    uint64_t v6 = [*(id *)(a1 + 56) identityProperties];
    id v7 = *(void **)(a1 + 64);
    id v8 = [v6 DSID];
    [v7 setDSID:v8];

    id v9 = *(void **)(a1 + 64);
    v10 = [v6 storefrontIdentifier];
    [v9 setStorefrontIdentifier:v10];
  }
  uint64_t v11 = *(void *)(a1 + 72);
  if (v11 && [v2 isEqualToIdentity:v11 inStore:*(void *)(a1 + 48)])
  {
    long long v12 = [*(id *)(a1 + 56) identityProperties];
    if ([v12 isDelegated])
    {
      long long v13 = *(void **)(a1 + 64);
      objc_super v14 = [v12 DSID];
      [v13 setDelegatedDSID:v14];

      v15 = *(void **)(a1 + 64);
      uint64_t v16 = [v12 delegateToken];
      [v15 setDelegateToken:v16];

      v17 = *(void **)(a1 + 64);
      v18 = [v12 storefrontIdentifier];
      [v17 setDelegatedStorefrontIdentifier:v18];

      v19 = os_log_create("com.apple.amp.iTunesCloud", "Delegation");
      if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
      {
        uint64_t v20 = *(void *)(a1 + 80);
        v21 = [*(id *)(a1 + 64) delegatedDSID];
        v22 = [*(id *)(a1 + 64) delegateToken];
        *(_DWORD *)buf = 138543874;
        uint64_t v37 = v20;
        __int16 v38 = 2112;
        v39 = v21;
        __int16 v40 = 2112;
        v41 = v22;
        _os_log_impl(&dword_1A2D01000, v19, OS_LOG_TYPE_DEFAULT, "%{public}@ - buildURLRequestWithCompletionHandler - Adding delegation info to builder - delegatedDSID=%@ - delegatedToken=%@", buf, 0x20u);
      }
    }
  }
  if (*(unsigned char *)(a1 + 120))
  {
    v23 = *(unsigned char **)(a1 + 80);
    if (v23[274])
    {
      v24 = +[ICURLBagProvider sharedBagProvider];
      uint64_t v25 = *(void *)(a1 + 88);
      v29[0] = MEMORY[0x1E4F143A8];
      v29[1] = 3221225472;
      v29[2] = __58__ICStoreURLRequest_buildURLRequestWithCompletionHandler___block_invoke_187;
      v29[3] = &unk_1E5AC9840;
      v26 = *(void **)(a1 + 104);
      uint64_t v35 = *(void *)(a1 + 112);
      id v27 = v26;
      uint64_t v28 = *(void *)(a1 + 80);
      id v34 = v27;
      v29[4] = v28;
      id v30 = *(id *)(a1 + 64);
      id v31 = *(id *)(a1 + 96);
      id v32 = *(id *)(a1 + 72);
      id v33 = *(id *)(a1 + 88);
      [v24 getBagForRequestContext:v25 withCompletionHandler:v29];
    }
    else
    {
      [v23 buildStoreURLRequestWithURLRequest:*(void *)(a1 + 96) builderProperties:*(void *)(a1 + 64) completionHandler:*(void *)(a1 + 104)];
    }
  }
}

void __58__ICStoreURLRequest_buildURLRequestWithCompletionHandler___block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  uint64_t v57 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  if (!v5 || a3)
  {
    (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
  }
  else
  {
    uint64_t v6 = +[ICSecurityInfo sharedSecurityInfo];
    if (![v6 isContentProtectionEnabled]
      || ([v6 isDeviceClassCUnlocked] & 1) != 0)
    {
      __int16 v40 = v6;
      id v7 = [*(id *)(a1 + 32) storeRequestContext];
      id v8 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
      id v9 = [v7 identity];
      v10 = [v7 identityStore];
      v41 = [v7 clientInfo];
      uint64_t v11 = [[ICUserCredentialRequest alloc] initWithIdentity:v9 identityStore:v10 clientInfo:v41];
      [(ICUserCredentialRequest *)v11 setTimeoutInterval:30.0];
      uint64_t v12 = *(void *)(a1 + 48);
      int v13 = [*(id *)(a1 + 32) prioritize];
      uint64_t v14 = 17;
      if (v13) {
        uint64_t v14 = 25;
      }
      if (v12 <= v14) {
        uint64_t v15 = v14;
      }
      else {
        uint64_t v15 = v12;
      }
      [(ICUserCredentialRequest *)v11 setQualityOfService:v15];
      uint64_t v42 = v8;
      [v8 addObject:v11];
      uint64_t v16 = [v7 delegatedIdentity];
      v17 = v16;
      if (v16 && ([v16 isEqualToIdentity:v9 inStore:v10] & 1) == 0)
      {
        v18 = os_log_create("com.apple.amp.iTunesCloud", "Delegation");
        if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
        {
          uint64_t v19 = *(void *)(a1 + 32);
          *(_DWORD *)buf = 138543618;
          uint64_t v54 = v19;
          __int16 v55 = 2112;
          v56 = v17;
          _os_log_impl(&dword_1A2D01000, v18, OS_LOG_TYPE_DEFAULT, "%{public}@ - buildURLRequestWithCompletionHandler [Delegated identity found] - delegatedIdentity=%@", buf, 0x16u);
        }

        uint64_t v20 = [[ICUserCredentialRequest alloc] initWithIdentity:v17 identityStore:v10 clientInfo:v41];
        [(ICUserCredentialRequest *)v11 timeoutInterval];
        [(ICUserCredentialRequest *)v20 setTimeoutInterval:"setTimeoutInterval:"];
        [(ICUserCredentialRequest *)v20 setQualityOfService:v15];
        [v42 addObject:v20];
      }
      v21 = objc_alloc_init(ICStoreURLRequestBuilderProperties);
      uint64_t v22 = *(void *)(a1 + 48);
      if (v22 <= 16)
      {
        if (v22 == 9)
        {
          dispatch_qos_class_t v23 = QOS_CLASS_BACKGROUND;
          goto LABEL_29;
        }
      }
      else
      {
        switch(v22)
        {
          case 17:
            dispatch_qos_class_t v23 = QOS_CLASS_UTILITY;
            goto LABEL_29;
          case 33:
            dispatch_qos_class_t v23 = QOS_CLASS_USER_INTERACTIVE;
            goto LABEL_29;
          case 25:
            dispatch_qos_class_t v23 = QOS_CLASS_USER_INITIATED;
LABEL_29:
            uint64_t v28 = dispatch_queue_attr_make_with_qos_class(0, v23, 0);
            dispatch_queue_t v29 = dispatch_queue_create("com.apple.iTunesCloud.ICStoreURLRequest.serialQueue", v28);

            id v30 = +[ICUserCredentialProvider sharedProvider];
            v43[0] = MEMORY[0x1E4F143A8];
            v43[1] = 3221225472;
            v43[2] = __58__ICStoreURLRequest_buildURLRequestWithCompletionHandler___block_invoke_184;
            v43[3] = &unk_1E5AC9890;
            id v31 = *(void **)(a1 + 40);
            v43[4] = *(void *)(a1 + 32);
            id v32 = v31;
            dispatch_queue_t v44 = v29;
            id v45 = v9;
            id v46 = v10;
            v47 = v21;
            id v48 = v17;
            id v49 = v7;
            uint64_t v33 = *(void *)(a1 + 48);
            id v51 = v32;
            uint64_t v52 = v33;
            id v50 = v5;
            id v34 = v7;
            id v35 = v17;
            v36 = v21;
            id v37 = v10;
            id v38 = v9;
            v39 = v29;
            [v30 performCredentialRequests:v42 withResponseHandler:v43];

            goto LABEL_30;
        }
      }
      dispatch_qos_class_t v23 = QOS_CLASS_UNSPECIFIED;
      goto LABEL_29;
    }
    v24 = os_log_create("com.apple.amp.iTunesCloud", "Default");
    if (os_log_type_enabled(v24, OS_LOG_TYPE_ERROR))
    {
      uint64_t v25 = *(void *)(a1 + 32);
      *(_DWORD *)buf = 138543362;
      uint64_t v54 = v25;
      _os_log_impl(&dword_1A2D01000, v24, OS_LOG_TYPE_ERROR, "Request %{public}@ issued before before first unlock, returning error.", buf, 0xCu);
    }

    uint64_t v26 = *(void *)(a1 + 40);
    id v27 = [MEMORY[0x1E4F28C58] errorWithDomain:@"ICError" code:-7006 userInfo:0];
    (*(void (**)(uint64_t, void, void *))(v26 + 16))(v26, 0, v27);
  }
LABEL_30:
}

void __58__ICStoreURLRequest_buildURLRequestWithCompletionHandler___block_invoke_2(uint64_t a1)
{
  uint64_t v29 = *MEMORY[0x1E4F143B8];
  if (*(void *)(a1 + 32))
  {
    v2 = *(void (**)(void))(*(void *)(a1 + 72) + 16);
    v2();
  }
  else
  {
    v3 = *(void **)(a1 + 40);
    if (v3)
    {
      uint64_t v4 = [*(id *)(a1 + 48) urlRequest];
      id v5 = [v4 URL];
      char v6 = [v3 isTrustedHostForURL:v5];

      if (v6)
      {
        [*(id *)(a1 + 56) setURLBag:*(void *)(a1 + 40)];
        id v7 = *(void **)(a1 + 48);
        uint64_t v8 = *(void *)(a1 + 56);
        uint64_t v9 = *(void *)(a1 + 64);
        uint64_t v10 = *(void *)(a1 + 72);
        [v7 buildStoreURLRequestWithURLRequest:v9 builderProperties:v8 completionHandler:v10];
      }
      else
      {
        uint64_t v12 = os_log_create("com.apple.amp.iTunesCloud", "Default");
        if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
        {
          int v13 = *(void **)(a1 + 48);
          uint64_t v14 = [v13 urlRequest];
          uint64_t v15 = [v14 URL];
          *(_DWORD *)buf = 138543618;
          uint64_t v26 = v13;
          __int16 v27 = 2114;
          uint64_t v28 = v15;
          _os_log_impl(&dword_1A2D01000, v12, OS_LOG_TYPE_ERROR, "%{public}@ Using store request for url with untrusted host: '%{public}@'", buf, 0x16u);
        }
        uint64_t v16 = (void *)MEMORY[0x1E4F77950];
        uint64_t v17 = *MEMORY[0x1E4F778D8];
        v18 = NSString;
        uint64_t v19 = [*(id *)(a1 + 48) urlRequest];
        uint64_t v20 = [v19 URL];
        v21 = [v18 stringWithFormat:@"Using store request for url with untrusted host '%@'", v20];
        [v16 snapshotWithDomain:v17 type:@"Bug" subType:@"ICStoreURLRequest" context:v21 triggerThresholdValues:&stru_1EF5F5C40 events:0 completion:0];

        uint64_t v22 = *(void *)(a1 + 72);
        if (*(void *)(a1 + 32))
        {
          (*(void (**)(void, void))(v22 + 16))(*(void *)(a1 + 72), 0);
        }
        else
        {
          dispatch_qos_class_t v23 = [MEMORY[0x1E4F28C58] errorWithDomain:@"ICError" code:-7009 userInfo:0];
          (*(void (**)(uint64_t, void, void *))(v22 + 16))(v22, 0, v23);
        }
      }
    }
    else
    {
      uint64_t v11 = *(void *)(a1 + 72);
      id v24 = [MEMORY[0x1E4F28C58] errorWithDomain:@"ICError" code:-7200 userInfo:0];
      (*(void (**)(uint64_t, void))(v11 + 16))(v11, 0);
    }
  }
}

- (BOOL)shouldUseMescalSigning
{
  return self->_shouldUseMescalSigning;
}

- (void)buildStoreURLRequestWithURLRequest:(id)a3 builderProperties:(id)a4 completionHandler:(id)a5
{
  uint64_t v200 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = a4;
  uint64_t v10 = (void (**)(id, void *, void *))a5;
  uint64_t v11 = [(ICStoreURLRequest *)self storeRequestContext];
  v165 = [v11 clientInfo];
  uint64_t v12 = [v11 deviceInfo];
  v162 = [v11 identityStore];
  int v13 = (void *)[v8 mutableCopy];
  v168 = [v13 URL];
  v161 = v11;
  uint64_t v14 = [v11 personalizationStyle];
  if (v14 == 1 && [(ICStoreURLRequest *)self _isPersonalizationRestricted])
  {
    uint64_t v15 = v12;
    uint64_t v16 = os_log_create("com.apple.amp.iTunesCloud", "Default");
    if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138543362;
      v195 = self;
      _os_log_impl(&dword_1A2D01000, v16, OS_LOG_TYPE_ERROR, "%{public}@ Automatic personalization is requested but not allowed - failing request", buf, 0xCu);
    }

    uint64_t v17 = (void *)MEMORY[0x1E4F77950];
    uint64_t v18 = *MEMORY[0x1E4F778D8];
    uint64_t v19 = [NSString stringWithFormat:@"Automatic personalization is requested but not allowed. url='%@'", v168];
    [v17 snapshotWithDomain:v18 type:@"Bug" subType:@"ICStoreURLRequest" context:v19 triggerThresholdValues:0 events:0 completion:0];

    uint64_t v20 = [MEMORY[0x1E4F28C58] errorWithDomain:@"ICError" code:-7007 userInfo:0];
    v10[2](v10, v13, v20);
    goto LABEL_186;
  }
  BOOL v157 = v14 != 0;
  v21 = os_log_create("com.apple.amp.iTunesCloud", "Default");
  if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v22 = "unpersonalized";
    if (v14) {
      uint64_t v22 = "personalized";
    }
    *(_DWORD *)buf = 138543618;
    v195 = self;
    __int16 v196 = 2082;
    v197 = (__CFString *)v22;
    _os_log_impl(&dword_1A2D01000, v21, OS_LOG_TYPE_DEFAULT, "%{public}@ Building %{public}s store URL request", buf, 0x16u);
  }

  id v166 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
  dispatch_qos_class_t v23 = [v9 URLBag];
  v160 = v23;
  if (v14 && v23 && [v23 shouldAppendDeviceGUIDForURL:v168])
  {
    id v24 = [v12 deviceGUID];
    if (v24) {
      [v166 setObject:v24 forKey:@"guid"];
    }
  }
  v158 = v12;
  v159 = v10;
  uint64_t v25 = +[ICDefaults standardDefaults];
  int v26 = [v25 isLegacyStoreCacheBusterEnabled];

  if (v26)
  {
    __int16 v27 = [MEMORY[0x1E4F29128] UUID];
    uint64_t v28 = [v27 UUIDString];

    [v166 setObject:v28 forKey:@"buster"];
  }
  if ([v166 count])
  {
    uint64_t v29 = objc_msgSend(v168, "ic_URLByAppendingQueryParameters:", v166);

    [v13 setURL:v29];
    v168 = (void *)v29;
  }
  id v30 = [(ICStoreURLRequest *)self additionalQueryItems];
  v156 = v30;
  if ([v30 count])
  {
    uint64_t v31 = objc_msgSend(v168, "ic_URLByAppendingQueryItems:", v30);

    [v13 setURL:v31];
    v168 = (void *)v31;
  }
  uint64_t v32 = [v9 DSID];
  uint64_t v33 = (void *)v32;
  if (v14)
  {
    id v34 = [v13 valueForHTTPHeaderField:@"X-Dsid"];

    BOOL v154 = v33 != 0;
    if (!v34 && v33)
    {
      id v35 = [v33 stringValue];
      [v13 setValue:v35 forHTTPHeaderField:@"X-Dsid"];
    }
    v36 = [v13 valueForHTTPHeaderField:@"iCloud-DSID"];

    if (!v36)
    {
      id v37 = [v9 iCloudPersonID];
      if (v37) {
        [v13 setValue:v37 forHTTPHeaderField:@"iCloud-DSID"];
      }
    }
  }
  else
  {
    BOOL v154 = v32 != 0;
  }
  id v38 = [v13 valueForHTTPHeaderField:@"X-Apple-Requesting-Bundle-Id"];

  if (!v38)
  {
    v39 = [v165 requestingBundleIdentifier];
    if ([v39 length]) {
      [v13 setValue:v39 forHTTPHeaderField:@"X-Apple-Requesting-Bundle-Id"];
    }
  }
  __int16 v40 = [v13 valueForHTTPHeaderField:@"X-Apple-Requesting-Bundle-Version"];

  if (!v40)
  {
    v41 = [v165 requestingBundleVersion];
    if ([v41 length]) {
      [v13 setValue:v41 forHTTPHeaderField:@"X-Apple-Requesting-Bundle-Version"];
    }
  }
  v164 = v33;
  uint64_t v42 = [v13 valueForHTTPHeaderField:@"X-Enqueuer-DSID"];

  v167 = self;
  if (!v42)
  {
    v43 = [v9 delegatedDSID];
    if (v43)
    {
      dispatch_queue_t v44 = os_log_create("com.apple.amp.iTunesCloud", "Delegation");
      if (os_log_type_enabled(v44, OS_LOG_TYPE_DEBUG))
      {
        id v45 = [v43 stringValue];
        *(_DWORD *)buf = 138543874;
        v195 = v167;
        __int16 v196 = 2112;
        v197 = @"X-Enqueuer-DSID";
        __int16 v198 = 2112;
        v199 = v45;
        _os_log_impl(&dword_1A2D01000, v44, OS_LOG_TYPE_DEBUG, "%{public}@ - buildStoreURLRequestWithURLRequest:properties:completionHandler: - Delegation header [dsid] [%@: %@]", buf, 0x20u);
      }
      id v46 = [v43 stringValue];
      [v13 setValue:v46 forHTTPHeaderField:@"X-Enqueuer-DSID"];
    }
  }
  v47 = [v13 valueForHTTPHeaderField:@"X-Apple-Enqueuer-Store-Front"];

  if (!v47)
  {
    id v48 = [v9 delegatedStorefrontIdentifier];
    if ([v48 length])
    {
      id v49 = [v9 delegatedURLBag];
      id v50 = v49;
      if (v49)
      {
        id v51 = v49;
      }
      else
      {
        id v51 = [v9 URLBag];
      }
      uint64_t v52 = [v51 storefrontHeaderSuffix];
      if ([v52 length])
      {
        uint64_t v53 = [v48 stringByAppendingString:v52];

        id v48 = (void *)v53;
      }
      [v13 setValue:v48 forHTTPHeaderField:@"X-Apple-Enqueuer-Store-Front"];
    }
  }
  uint64_t v54 = [v13 valueForHTTPHeaderField:@"X-WHA-Token"];

  id v163 = v9;
  if (!v54)
  {
    __int16 v55 = [v9 delegateToken];
    if ([v55 type] == 1)
    {
      v56 = [v55 data];
      uint64_t v57 = [v56 base64EncodedStringWithOptions:0];
      if (v57)
      {
        id v58 = v8;
        v59 = os_log_create("com.apple.amp.iTunesCloud", "Delegation");
        if (os_log_type_enabled(v59, OS_LOG_TYPE_DEBUG))
        {
          *(_DWORD *)buf = 138543874;
          v195 = v167;
          __int16 v196 = 2112;
          v197 = @"X-WHA-Token";
          __int16 v198 = 2112;
          v199 = v57;
          _os_log_impl(&dword_1A2D01000, v59, OS_LOG_TYPE_DEBUG, "%{public}@ - buildStoreURLRequestWithURLRequest:properties:completionHandler: - Delegation header [token] [%@: %@]", buf, 0x20u);
        }

        [v13 setValue:v57 forHTTPHeaderField:@"X-WHA-Token"];
        id v8 = v58;
      }

      id v9 = v163;
    }
  }
  v60 = [v13 valueForHTTPHeaderField:@"X-Apple-Tz"];

  if (!v60)
  {
    v61 = [MEMORY[0x1E4F1CAF0] localTimeZone];
    uint64_t v62 = [v61 secondsFromGMT];
    v63 = [NSNumber numberWithDouble:(double)v62];
    v64 = [v63 stringValue];
    [v13 setValue:v64 forHTTPHeaderField:@"X-Apple-Tz"];
  }
  v65 = [v13 valueForHTTPHeaderField:@"X-Apple-I-Client-Time"];

  v66 = v167;
  if (!v65)
  {
    if (buildStoreURLRequestWithURLRequest_builderProperties_completionHandler__sClientTimeDateFormatterOnceToken != -1) {
      dispatch_once(&buildStoreURLRequestWithURLRequest_builderProperties_completionHandler__sClientTimeDateFormatterOnceToken, &__block_literal_global_20273);
    }
    v67 = (void *)buildStoreURLRequestWithURLRequest_builderProperties_completionHandler__sClientTimeDateFormatter;
    v68 = [MEMORY[0x1E4F1C9C8] date];
    v69 = [v67 stringFromDate:v68];

    if ([v69 length]) {
      [v13 setValue:v69 forHTTPHeaderField:@"X-Apple-I-Client-Time"];
    }
  }
  v70 = [v13 valueForHTTPHeaderField:@"X-Apple-Connection-Type"];

  if (!v70)
  {
    v71 = [(id)objc_opt_class() currentConnectionTypeHeader];
    if ([v71 length]) {
      [v13 setValue:v71 forHTTPHeaderField:@"X-Apple-Connection-Type"];
    }
  }
  v72 = [v13 valueForHTTPHeaderField:@"X-Apple-Cuid"];

  if (!v72)
  {
    v73 = +[ICDefaults standardDefaults];
    v74 = [v73 cloudMediaLibraryUID];

    if (v74) {
      [v13 setValue:v74 forHTTPHeaderField:@"X-Apple-Cuid"];
    }
  }
  v75 = [v13 valueForHTTPHeaderField:@"X-Apple-Store-Front"];

  if (!v75)
  {
    v76 = [v9 storefrontIdentifier];
    v77 = v76;
    if (v76)
    {
      id v78 = v76;
    }
    else
    {
      v79 = [v162 localStoreAccountProperties];
      id v78 = [v79 storefrontIdentifier];

      v66 = v167;
    }
    if ([v78 length])
    {
      v80 = [v160 storefrontHeaderSuffix];
      if ([v80 length])
      {
        uint64_t v81 = [v78 stringByAppendingString:v80];

        id v78 = (id)v81;
      }
      [v13 setValue:v78 forHTTPHeaderField:@"X-Apple-Store-Front"];

      v66 = v167;
    }
  }
  v82 = +[ICDeviceInfo currentDeviceInfo];
  int v83 = [v82 isInternalBuild];

  if (v83)
  {
    v84 = [v13 valueForHTTPHeaderField:@"X-Apple-Issuing-Process"];

    if (!v84)
    {
      v85 = [MEMORY[0x1E4F28B50] mainBundle];
      v86 = [v85 bundleIdentifier];
      [v13 setValue:v86 forHTTPHeaderField:@"X-Apple-Issuing-Process"];
    }
    v87 = [v13 valueForHTTPHeaderField:@"X-Apple-Requesting-Process"];

    if (!v87)
    {
      v88 = [v165 _clientIdentifierForUserAgent];
      [v13 setValue:v88 forHTTPHeaderField:@"X-Apple-Requesting-Process"];
    }
    v89 = [v13 valueForHTTPHeaderField:@"X-Apple-NSURLCachePolicy"];

    if (!v89)
    {
      v90 = -[ICStoreURLRequest _stringForCachePolicy:](v66, "_stringForCachePolicy:", [v13 cachePolicy]);
      [v13 setValue:v90 forHTTPHeaderField:@"X-Apple-NSURLCachePolicy"];
    }
  }
  [v13 setHTTPShouldHandleCookies:0];
  v91 = +[ICHTTPCookieStore sharedCookieStore];
  v92 = v91;
  v155 = v91;
  if (v14)
  {
    v93 = [v91 getCookiesHeadersForURL:v168 userIdentifier:v164];
  }
  else
  {
    v94 = +[ICDeviceInfo currentDeviceInfo];
    int v95 = [v94 isInternalBuild];

    if (v95)
    {
      id v153 = v8;
      v96 = [v92 getCookiesForURL:v168 userIdentifier:v164];
      v97 = objc_msgSend(MEMORY[0x1E4F1CAD0], "setWithObjects:", @"itfe", 0);
      v170 = objc_msgSend(MEMORY[0x1E4F1CAD0], "setWithObjects:", @".apple.com", 0);
      v169 = [MEMORY[0x1E4F1CA48] array];
      long long v188 = 0u;
      long long v189 = 0u;
      long long v190 = 0u;
      long long v191 = 0u;
      id v98 = v96;
      uint64_t v99 = [v98 countByEnumeratingWithState:&v188 objects:v193 count:16];
      if (v99)
      {
        uint64_t v100 = v99;
        uint64_t v101 = *(void *)v189;
        do
        {
          for (uint64_t i = 0; i != v100; ++i)
          {
            if (*(void *)v189 != v101) {
              objc_enumerationMutation(v98);
            }
            v103 = *(void **)(*((void *)&v188 + 1) + 8 * i);
            v104 = [v103 name];
            if ([v97 containsObject:v104])
            {
              v105 = [v103 domain];
              int v106 = [v170 containsObject:v105];

              if (v106) {
                [v169 addObject:v103];
              }
            }
            else
            {
            }
          }
          uint64_t v100 = [v98 countByEnumeratingWithState:&v188 objects:v193 count:16];
        }
        while (v100);
      }

      if ([v169 count])
      {
        v93 = [MEMORY[0x1E4F18D28] requestHeaderFieldsWithCookies:v169];
      }
      else
      {
        v93 = 0;
      }
      id v8 = v153;
    }
    else
    {
      v93 = 0;
    }
  }
  long long v186 = 0u;
  long long v187 = 0u;
  long long v184 = 0u;
  long long v185 = 0u;
  id v107 = v93;
  uint64_t v108 = [v107 countByEnumeratingWithState:&v184 objects:v192 count:16];
  if (v108)
  {
    uint64_t v109 = v108;
    uint64_t v110 = *(void *)v185;
    do
    {
      for (uint64_t j = 0; j != v109; ++j)
      {
        if (*(void *)v185 != v110) {
          objc_enumerationMutation(v107);
        }
        uint64_t v112 = *(void *)(*((void *)&v184 + 1) + 8 * j);
        v113 = [v13 valueForHTTPHeaderField:v112];

        if (!v113)
        {
          v114 = [v107 objectForKeyedSubscript:v112];
          [v13 setValue:v114 forHTTPHeaderField:v112];
        }
      }
      uint64_t v109 = [v107 countByEnumeratingWithState:&v184 objects:v192 count:16];
    }
    while (v109);
  }

  v115 = v167;
  if ([(NSDictionary *)v167->_additionalHTTPCookies count]) {
    objc_msgSend(v13, "ic_appendHTTPCookies:", v167->_additionalHTTPCookies);
  }
  v116 = [v13 valueForHTTPHeaderField:@"X-Apple-Device-Model"];

  id v9 = v163;
  if (!v116)
  {
    v117 = +[ICDeviceInfo currentDeviceInfo];
    v118 = [v117 rawDeviceModel];

    if (v118) {
      [v13 setValue:v118 forHTTPHeaderField:@"X-Apple-Device-Model"];
    }
  }
  int64_t anisetteVersion = v167->_anisetteVersion;
  if (anisetteVersion != -1)
  {
    if (anisetteVersion == 1)
    {
      int64_t anisetteVersion = v154;
      v167->_int64_t anisetteVersion = v154;
    }
    if (!anisetteVersion) {
      goto LABEL_169;
    }
LABEL_132:
    id v120 = v8;
    v121 = os_log_create("com.apple.amp.iTunesCloud", "Default");
    if (os_log_type_enabled(v121, OS_LOG_TYPE_DEFAULT))
    {
      int64_t v122 = v167->_anisetteVersion;
      *(_DWORD *)buf = 138543618;
      v195 = v167;
      __int16 v196 = 1024;
      LODWORD(v197) = v122;
      _os_log_impl(&dword_1A2D01000, v121, OS_LOG_TYPE_DEFAULT, "%{public}@ adding MD headers for version %d", buf, 0x12u);
    }

    id v182 = 0;
    id v183 = 0;
    id v181 = 0;
    BOOL v123 = +[ICADIUtilities generateMachineDataForAccountID:returningMachineIDData:otpData:error:](ICADIUtilities, "generateMachineDataForAccountID:returningMachineIDData:otpData:error:", [v164 unsignedLongLongValue], &v183, &v182, &v181);
    id v124 = v183;
    id v125 = v182;
    v126 = (__CFString *)v181;
    if (!v123)
    {
      int64_t v131 = v167->_anisetteVersion;
      if (v131 != 1) {
        goto LABEL_154;
      }
      v127 = os_log_create("com.apple.amp.iTunesCloud", "Default");
      if (os_log_type_enabled(v127, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138543618;
        v195 = v167;
        __int16 v196 = 2114;
        v197 = v126;
        _os_log_impl(&dword_1A2D01000, v127, OS_LOG_TYPE_DEFAULT, "%{public}@ failed to generate MD header data. err=%{public}@", buf, 0x16u);
      }
      goto LABEL_152;
    }
    if (v124)
    {
      v127 = [v124 base64EncodedStringWithOptions:0];

      if (v127) {
        [v13 setValue:v127 forHTTPHeaderField:@"X-Apple-MD-M"];
      }
      if (!v125) {
        goto LABEL_152;
      }
    }
    else
    {
      v127 = 0;
      if (!v125) {
        goto LABEL_152;
      }
    }
    v132 = [v125 base64EncodedStringWithOptions:0];

    if (!v132)
    {
LABEL_153:
      int64_t v131 = v167->_anisetteVersion;
LABEL_154:
      if (v131 == 2)
      {
        id v179 = v125;
        id v180 = v124;
        v178 = v126;
        BOOL v133 = +[ICADIUtilities generateMachineDataForAccountID:-1 returningMachineIDData:&v180 otpData:&v179 error:&v178];
        id v134 = v180;

        id v135 = v179;
        v136 = v178;

        if (!v133)
        {
          v137 = os_log_create("com.apple.amp.iTunesCloud", "Default");
          if (os_log_type_enabled(v137, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = 138543618;
            v195 = v167;
            __int16 v196 = 2114;
            v197 = v136;
            _os_log_impl(&dword_1A2D01000, v137, OS_LOG_TYPE_DEFAULT, "%{public}@ failed to generate AMD header data. err=%{public}@", buf, 0x16u);
          }
          id v8 = v120;
          goto LABEL_167;
        }
        if (v134)
        {
          v137 = [v134 base64EncodedStringWithOptions:0];

          if (v137) {
            [v13 setValue:v137 forHTTPHeaderField:@"X-Apple-AMD-M"];
          }
        }
        else
        {
          v137 = 0;
        }
        id v8 = v120;
        if (!v135)
        {
LABEL_167:

          goto LABEL_168;
        }
        v138 = [v135 base64EncodedStringWithOptions:0];

        if (v138)
        {
          [v13 setValue:v138 forHTTPHeaderField:@"X-Apple-AMD"];
          v137 = v138;
          goto LABEL_167;
        }
      }
      else
      {
        v136 = v126;
        id v134 = v124;
        id v135 = v125;
        id v8 = v120;
      }
LABEL_168:

      id v9 = v163;
      v115 = v167;
      goto LABEL_169;
    }
    [v13 setValue:v132 forHTTPHeaderField:@"X-Apple-MD"];
    v127 = v132;
LABEL_152:

    goto LABEL_153;
  }
  if (v160)
  {
    v128 = [v13 URL];
    int v129 = [v160 shouldAppendMachineDataHeadersForURL:v128];
    uint64_t v130 = 2;
    if (!v129) {
      uint64_t v130 = 0;
    }
    v167->_int64_t anisetteVersion = v130;

    if (!v167->_anisetteVersion) {
      goto LABEL_169;
    }
    goto LABEL_132;
  }
  v167->_int64_t anisetteVersion = 0;
LABEL_169:
  if (v115->_machineDataSyncState)
  {
    if (v115->_anisetteVersion == 1) {
      v139 = @"X-Apple-MD-S";
    }
    else {
      v139 = @"X-Apple-AMD-S";
    }
    v140 = v139;
    [v13 setValue:v115->_machineDataSyncState forHTTPHeaderField:v140];
  }
  uint64_t v10 = v159;
  if (v115->_JSSignConfiguration)
  {
    v141 = [[ICJSSign alloc] initWithConfiguration:v115->_JSSignConfiguration];
    v142 = [(ICJSSign *)v141 signatureDataWithURLRequest:v13];
    v143 = v142;
    if (v142)
    {
      uint64_t v144 = [v142 base64EncodedStringWithOptions:0];
      v145 = v115;
      v146 = (void *)v144;
      v147 = [(ICJSSignConfiguration *)v145->_JSSignConfiguration signatureDataCookieName];
      if ([v147 length]) {
        objc_msgSend(v13, "ic_appendHTTPCookieWithName:value:", v147, v146);
      }
      v148 = [(ICJSSignConfiguration *)v167->_JSSignConfiguration signatureDataHeaderName];
      if ([v148 length]) {
        [v13 setValue:v146 forHTTPHeaderField:v148];
      }

      id v9 = v163;
      v115 = v167;
    }
  }
  v175[0] = MEMORY[0x1E4F143A8];
  v175[1] = 3221225472;
  v175[2] = __92__ICStoreURLRequest_buildStoreURLRequestWithURLRequest_builderProperties_completionHandler___block_invoke_247;
  v175[3] = &unk_1E5ACAD30;
  BOOL v177 = v157;
  id v149 = v13;
  id v176 = v149;
  uint64_t v150 = MEMORY[0x1A6240BF0](v175);
  v151 = (void *)v150;
  if (v115->_shouldUseMescalSigning)
  {
    v171[0] = MEMORY[0x1E4F143A8];
    v171[1] = 3221225472;
    v171[2] = __92__ICStoreURLRequest_buildStoreURLRequestWithURLRequest_builderProperties_completionHandler___block_invoke_2;
    v171[3] = &unk_1E5AC98E0;
    v171[4] = v115;
    id v172 = v149;
    id v173 = v151;
    v174 = v159;
    v152 = v160;
    [(ICStoreURLRequest *)v115 _getSignatureDataForRequest:v172 urlBag:v160 completionHandler:v171];
  }
  else
  {
    (*(void (**)(uint64_t))(v150 + 16))(v150);
    v159[2](v159, v149, 0);
    v152 = v160;
  }

  uint64_t v15 = v158;
  uint64_t v20 = v166;
LABEL_186:
}

- (NSArray)additionalQueryItems
{
  return self->_additionalQueryItems;
}

- (id)_stringForCachePolicy:(unint64_t)a3
{
  if (a3 > 5) {
    return @"Unknown";
  }
  else {
    return off_1E5AC9900[a3];
  }
}

+ (unint64_t)_defaultMaxRetryCountForReason:(id)a3
{
  uint64_t v4 = (__CFString *)a3;
  id v5 = @"machine-data-action-performed";
  if (v4 == @"machine-data-action-performed")
  {
    uint64_t v12 = @"machine-data-action-performed";
LABEL_9:

    goto LABEL_10;
  }
  char v6 = [(__CFString *)v4 isEqual:@"machine-data-action-performed"];

  if (v6)
  {
LABEL_10:
    unint64_t v11 = 1;
    goto LABEL_13;
  }
  id v7 = @"dialog-processed";
  if (v4 == @"dialog-processed")
  {

    goto LABEL_12;
  }
  char v8 = [(__CFString *)v4 isEqual:@"dialog-processed"];

  if (v8)
  {
LABEL_12:
    unint64_t v11 = 2;
    goto LABEL_13;
  }
  id v9 = @"other";
  if (v4 == @"other")
  {
    uint64_t v12 = @"other";
    goto LABEL_9;
  }
  char v10 = [(__CFString *)v4 isEqual:@"other"];

  if (v10) {
    goto LABEL_10;
  }
  v14.receiver = a1;
  v14.super_class = (Class)&OBJC_METACLASS___ICStoreURLRequest;
  unint64_t v11 = (unint64_t)objc_msgSendSuper2(&v14, sel__defaultMaxRetryCountForReason_, v4);
LABEL_13:

  return v11;
}

- (void)buildURLRequestWithCompletionHandler:(id)a3
{
  id v4 = a3;
  id v5 = [MEMORY[0x1E4F29060] currentThread];
  uint64_t v6 = [v5 qualityOfService];

  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __58__ICStoreURLRequest_buildURLRequestWithCompletionHandler___block_invoke;
  v9[3] = &unk_1E5AC98B8;
  v9[4] = self;
  id v10 = v4;
  uint64_t v11 = v6;
  v8.receiver = self;
  v8.super_class = (Class)ICStoreURLRequest;
  id v7 = v4;
  [(ICURLRequest *)&v8 buildURLRequestWithCompletionHandler:v9];
}

+ (NSString)currentConnectionTypeHeader
{
  v2 = +[ICEnvironmentMonitor sharedMonitor];
  uint64_t v3 = [v2 networkType];
  uint64_t v4 = v3;
  id v5 = 0;
  char v6 = 1;
  if (v3 <= 499)
  {
    switch(v3)
    {
      case 1:
        goto LABEL_7;
      case 2:
        goto LABEL_12;
      case 3:
        char v6 = 0;
        id v5 = @"4G";
        break;
      case 4:
        char v6 = 0;
        id v5 = @"5G";
        break;
      case 5:
        char v6 = 0;
        id v5 = @"6G";
        break;
      case 6:
        char v6 = 0;
        id v5 = @"7G";
        break;
      case 7:
        char v6 = 0;
        id v5 = @"8G";
        break;
      case 8:
        char v6 = 0;
        id v5 = @"9G";
        break;
      default:
        if (v3 == 100) {
          goto LABEL_12;
        }
        break;
    }
    goto LABEL_18;
  }
  if (v3 <= 1999)
  {
    if ((unint64_t)(v3 - 1000) >= 2)
    {
      if (v3 == 500)
      {
LABEL_7:
        char v6 = 0;
        id v5 = @"2G";
      }
      goto LABEL_18;
    }
LABEL_10:
    char v6 = 0;
    id v5 = @"WiFi";
    goto LABEL_18;
  }
  if (v3 == 3000)
  {
LABEL_12:
    char v6 = 0;
    id v5 = @"3G";
    goto LABEL_18;
  }
  if (v3 == 2000) {
    goto LABEL_10;
  }
LABEL_18:
  id v7 = [MEMORY[0x1E4F28E78] string];
  objc_super v8 = v7;
  if ((v6 & 1) == 0)
  {
    [v7 appendString:v5];
    if ((unint64_t)(v4 - 1) <= 0x1F2)
    {
      id v9 = [v2 telephonyOperatorName];
      if ([v9 length])
      {
        id v10 = [MEMORY[0x1E4F28B88] URLQueryAllowedCharacterSet];
        uint64_t v11 = [v9 stringByAddingPercentEncodingWithAllowedCharacters:v10];

        [v8 appendFormat:@"/%@", v11];
      }
    }
  }

  return (NSString *)v8;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_JSSignConfiguration, 0);
  objc_storeStrong((id *)&self->_additionalQueryItems, 0);
  objc_storeStrong((id *)&self->_additionalHTTPCookies, 0);

  objc_storeStrong((id *)&self->_machineDataSyncState, 0);
}

- (void)_getSignatureDataForRequest:(id)a3 urlBag:(id)a4 completionHandler:(id)a5
{
  uint64_t v60 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  if (v9)
  {
    uint64_t v11 = [v9 mescalConfigurationForRequest:v8];
    if (v11)
    {
      uint64_t v12 = os_log_create("com.apple.amp.iTunesCloud", "Default");
      if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138543618;
        uint64_t v57 = self;
        __int16 v58 = 2114;
        v59 = v11;
        _os_log_impl(&dword_1A2D01000, v12, OS_LOG_TYPE_DEFAULT, "%{public}@ creating mescal signature for request. configuration=%{public}@", buf, 0x16u);
      }

      id v13 = objc_alloc_init(MEMORY[0x1E4F1CA58]);
      if ([v11 shouldSignBody])
      {
        objc_super v14 = [v8 HTTPMethod];
        int v15 = [v14 isEqualToString:@"POST"];

        if (v15)
        {
          uint64_t v16 = [v8 HTTPBody];
          [v13 appendData:v16];
        }
      }
      uint64_t v17 = [v8 HTTPMethod];
      char v18 = [v17 isEqualToString:@"POST"];

      if ((v18 & 1) == 0)
      {
        v43 = self;
        id v44 = v10;
        long long v52 = 0u;
        long long v53 = 0u;
        long long v50 = 0u;
        long long v51 = 0u;
        id v45 = v11;
        uint64_t v19 = [v11 headers];
        uint64_t v20 = [v19 countByEnumeratingWithState:&v50 objects:v55 count:16];
        if (v20)
        {
          uint64_t v21 = v20;
          uint64_t v22 = *(void *)v51;
          do
          {
            for (uint64_t i = 0; i != v21; ++i)
            {
              if (*(void *)v51 != v22) {
                objc_enumerationMutation(v19);
              }
              id v24 = [v8 valueForHTTPHeaderField:*(void *)(*((void *)&v50 + 1) + 8 * i)];
              uint64_t v25 = v24;
              if (v24 && [v24 length])
              {
                int v26 = [v25 dataUsingEncoding:4];
                [v13 appendData:v26];
              }
            }
            uint64_t v21 = [v19 countByEnumeratingWithState:&v50 objects:v55 count:16];
          }
          while (v21);
        }

        long long v48 = 0u;
        long long v49 = 0u;
        long long v46 = 0u;
        long long v47 = 0u;
        __int16 v27 = [v45 fields];
        uint64_t v28 = [v27 countByEnumeratingWithState:&v46 objects:v54 count:16];
        if (v28)
        {
          uint64_t v29 = v28;
          id v30 = 0;
          uint64_t v31 = *(void *)v47;
          do
          {
            for (uint64_t j = 0; j != v29; ++j)
            {
              if (*(void *)v47 != v31) {
                objc_enumerationMutation(v27);
              }
              uint64_t v33 = *(void *)(*((void *)&v46 + 1) + 8 * j);
              if (!v30)
              {
                id v34 = [v8 URL];
                id v30 = objc_msgSend(v34, "ic_queryParametersDictionary");
              }
              id v35 = [v30 objectForKey:v33];
              v36 = v35;
              if (v35 && [v35 length])
              {
                id v37 = [v36 dataUsingEncoding:4];
                [v13 appendData:v37];
              }
            }
            uint64_t v29 = [v27 countByEnumeratingWithState:&v46 objects:v54 count:16];
          }
          while (v29);
        }
        else
        {
          id v30 = 0;
        }

        uint64_t v11 = v45;
        if ([v45 shouldIncludePath])
        {
          id v38 = [v8 URL];
          v39 = [v38 path];

          __int16 v40 = [v39 dataUsingEncoding:4];
          [v13 appendData:v40];
        }
        self = v43;
        id v10 = v44;
      }
      v41 = [(ICStoreURLRequest *)self storeRequestContext];
      uint64_t v42 = +[ICSAPSession sharedSAPSessionWithVersion:200 URLBag:v9 requestContext:v41];

      if (v42) {
        [v42 signData:v13 withCompletionHandler:v10];
      }
      else {
        (*((void (**)(id, void, void))v10 + 2))(v10, 0, 0);
      }
    }
    else
    {
      (*((void (**)(id, void, void))v10 + 2))(v10, 0, 0);
    }
  }
  else
  {
    uint64_t v11 = [MEMORY[0x1E4F28C58] errorWithDomain:@"ICError" code:-7200 userInfo:0];
    (*((void (**)(id, void, void *))v10 + 2))(v10, 0, v11);
  }
}

void __92__ICStoreURLRequest_buildStoreURLRequestWithURLRequest_builderProperties_completionHandler___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  id v6 = a3;
  if (v6)
  {
    id v7 = os_log_create("com.apple.amp.iTunesCloud", "Default");
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v8 = *(void *)(a1 + 32);
      int v9 = 138543618;
      uint64_t v10 = v8;
      __int16 v11 = 2114;
      id v12 = v6;
      _os_log_impl(&dword_1A2D01000, v7, OS_LOG_TYPE_DEFAULT, "%{public}@ failed to sign request. err=%{public}@", (uint8_t *)&v9, 0x16u);
    }
    goto LABEL_6;
  }
  if (v5)
  {
    id v7 = [v5 base64EncodedStringWithOptions:0];
    [*(id *)(a1 + 40) setValue:v7 forHTTPHeaderField:@"X-Apple-ActionSignature"];
LABEL_6:
  }
  (*(void (**)(void))(*(void *)(a1 + 48) + 16))();
  (*(void (**)(void))(*(void *)(a1 + 56) + 16))();
}

- (BOOL)_isPersonalizationRestricted
{
  v2 = [(ICStoreURLRequest *)self storeRequestContext];
  uint64_t v3 = [v2 clientInfo];
  uint64_t v4 = [v3 requestingBundleIdentifier];
  id v5 = v4;
  if (v4)
  {
    id v6 = v4;
  }
  else
  {
    id v7 = [MEMORY[0x1E4F28B50] mainBundle];
    id v6 = [v7 bundleIdentifier];
  }
  uint64_t v8 = [v2 identity];
  int v9 = +[ICPrivacyInfo sharedPrivacyInfoForUserIdentity:v8];
  char v10 = [v9 privacyAcknowledgementRequiredForBundleIdentifier:v6];

  return v10;
}

void __92__ICStoreURLRequest_buildStoreURLRequestWithURLRequest_builderProperties_completionHandler___block_invoke()
{
  id v4 = (id)[objc_alloc(MEMORY[0x1E4F1CA20]) initWithLocaleIdentifier:@"en_US_POSIX"];
  id v0 = objc_alloc_init(MEMORY[0x1E4F28C10]);
  v1 = (void *)buildStoreURLRequestWithURLRequest_builderProperties_completionHandler__sClientTimeDateFormatter;
  buildStoreURLRequestWithURLRequest_builderProperties_completionHandler__sClientTimeDateFormatter = (uint64_t)v0;

  [(id)buildStoreURLRequestWithURLRequest_builderProperties_completionHandler__sClientTimeDateFormatter setDateFormat:@"yyyy'-'MM'-'dd'T'HH':'mm':'ss'Z'"];
  [(id)buildStoreURLRequestWithURLRequest_builderProperties_completionHandler__sClientTimeDateFormatter setLocale:v4];
  v2 = (void *)buildStoreURLRequestWithURLRequest_builderProperties_completionHandler__sClientTimeDateFormatter;
  uint64_t v3 = [MEMORY[0x1E4F1CAF0] timeZoneForSecondsFromGMT:0];
  [v2 setTimeZone:v3];
}

void __58__ICStoreURLRequest_buildURLRequestWithCompletionHandler___block_invoke_184(uint64_t a1, void *a2, void *a3, void *a4, char a5)
{
  uint64_t v37 = *MEMORY[0x1E4F143B8];
  id v9 = a2;
  id v10 = a3;
  id v11 = a4;
  if (v11)
  {
    id v12 = os_log_create("com.apple.amp.iTunesCloud", "Default");
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
    {
      uint64_t v13 = *(void *)(a1 + 32);
      *(_DWORD *)buf = 138543618;
      uint64_t v34 = v13;
      __int16 v35 = 2114;
      id v36 = v11;
      _os_log_impl(&dword_1A2D01000, v12, OS_LOG_TYPE_ERROR, "Request %{public}@ failed to obtain credentials to form request. err=%{public}@", buf, 0x16u);
    }

    (*(void (**)(void))(*(void *)(a1 + 96) + 16))();
  }
  else
  {
    objc_super v14 = *(NSObject **)(a1 + 40);
    v20[0] = MEMORY[0x1E4F143A8];
    v20[1] = 3221225472;
    v20[2] = __58__ICStoreURLRequest_buildURLRequestWithCompletionHandler___block_invoke_185;
    v20[3] = &unk_1E5AC9868;
    id v21 = v9;
    id v22 = *(id *)(a1 + 48);
    id v23 = *(id *)(a1 + 56);
    id v24 = v10;
    id v25 = *(id *)(a1 + 64);
    id v15 = *(id *)(a1 + 72);
    uint64_t v16 = *(void *)(a1 + 32);
    id v26 = v15;
    uint64_t v27 = v16;
    char v32 = a5;
    id v17 = *(id *)(a1 + 80);
    uint64_t v19 = *(void **)(a1 + 96);
    uint64_t v18 = *(void *)(a1 + 104);
    id v28 = v17;
    uint64_t v31 = v18;
    id v30 = v19;
    id v29 = *(id *)(a1 + 88);
    dispatch_async(v14, v20);
  }
}

void __58__ICStoreURLRequest_buildURLRequestWithCompletionHandler___block_invoke_187(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  uint64_t v7 = *(void *)(a1 + 80);
  if (v7 <= 16)
  {
    if (v7 == 9)
    {
      dispatch_qos_class_t v8 = QOS_CLASS_BACKGROUND;
      goto LABEL_11;
    }
    goto LABEL_8;
  }
  switch(v7)
  {
    case 17:
      dispatch_qos_class_t v8 = QOS_CLASS_UTILITY;
      break;
    case 33:
      dispatch_qos_class_t v8 = QOS_CLASS_USER_INTERACTIVE;
      break;
    case 25:
      dispatch_qos_class_t v8 = QOS_CLASS_USER_INITIATED;
      break;
    default:
LABEL_8:
      dispatch_qos_class_t v8 = QOS_CLASS_UNSPECIFIED;
      break;
  }
LABEL_11:
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __58__ICStoreURLRequest_buildURLRequestWithCompletionHandler___block_invoke_2;
  block[3] = &unk_1E5AC97F0;
  id v9 = v6;
  id v27 = v9;
  id v10 = v5;
  id v28 = v10;
  id v11 = *(id *)(a1 + 72);
  uint64_t v12 = *(void *)(a1 + 32);
  uint64_t v13 = *(void **)(a1 + 40);
  id v32 = v11;
  uint64_t v29 = v12;
  id v30 = v13;
  id v31 = *(id *)(a1 + 48);
  dispatch_block_t v14 = dispatch_block_create_with_qos_class(DISPATCH_BLOCK_ENFORCE_QOS_CLASS|DISPATCH_BLOCK_ASSIGN_CURRENT, v8, 0, block);
  id v15 = v14;
  uint64_t v16 = *(void **)(a1 + 56);
  if (v16)
  {
    id v17 = *(void **)(a1 + 64);
    v24[0] = MEMORY[0x1E4F143A8];
    v24[1] = 3221225472;
    v24[2] = __58__ICStoreURLRequest_buildURLRequestWithCompletionHandler___block_invoke_203;
    v24[3] = &unk_1E5ACC698;
    id v25 = v16;
    uint64_t v18 = (void *)[v17 copyWithBlock:v24];
    uint64_t v19 = +[ICURLBagProvider sharedBagProvider];
    v20[0] = MEMORY[0x1E4F143A8];
    v20[1] = 3221225472;
    v20[2] = __58__ICStoreURLRequest_buildURLRequestWithCompletionHandler___block_invoke_2_205;
    v20[3] = &unk_1E5AC9818;
    uint64_t v23 = *(void *)(a1 + 80);
    id v21 = *(id *)(a1 + 40);
    id v22 = v15;
    [v19 getBagForRequestContext:v18 withCompletionHandler:v20];
  }
  else
  {
    (*((void (**)(dispatch_block_t))v14 + 2))(v14);
  }
}

- (void)setJSSignConfiguration:(id)a3
{
}

- (ICJSSignConfiguration)JSSignConfiguration
{
  return self->_JSSignConfiguration;
}

- (void)setAdditionalQueryItems:(id)a3
{
}

- (void)setAdditionalHTTPCookies:(id)a3
{
}

- (void)setMachineDataSyncState:(id)a3
{
}

- (NSString)machineDataSyncState
{
  return self->_machineDataSyncState;
}

- (void)setShouldRequireURLBag:(BOOL)a3
{
  self->_shouldRequireURLBag = a3;
}

- (BOOL)shouldRequireURLBag
{
  return self->_shouldRequireURLBag;
}

- (void)setShouldParseBodyData:(BOOL)a3
{
  self->_shouldParseBodyData = a3;
}

- (void)setAnisetteVersion:(int64_t)a3
{
  self->_int64_t anisetteVersion = a3;
}

- (int64_t)anisetteVersion
{
  return self->_anisetteVersion;
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

void __58__ICStoreURLRequest_buildURLRequestWithCompletionHandler___block_invoke_203(uint64_t a1, void *a2)
{
  uint64_t v2 = *(void *)(a1 + 32);
  id v3 = a2;
  [v3 setIdentity:v2];
  [v3 setDelegatedIdentity:0];
}

void __58__ICStoreURLRequest_buildURLRequestWithCompletionHandler___block_invoke_2_205(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  uint64_t v7 = v6;
  uint64_t v8 = *(void *)(a1 + 48);
  if (v8 <= 16)
  {
    if (v8 == 9)
    {
      dispatch_qos_class_t v9 = QOS_CLASS_BACKGROUND;
      goto LABEL_11;
    }
LABEL_8:
    dispatch_qos_class_t v9 = QOS_CLASS_UNSPECIFIED;
    goto LABEL_11;
  }
  if (v8 == 17)
  {
    dispatch_qos_class_t v9 = QOS_CLASS_UTILITY;
    goto LABEL_11;
  }
  if (v8 == 33)
  {
    dispatch_qos_class_t v9 = QOS_CLASS_USER_INTERACTIVE;
    goto LABEL_11;
  }
  if (v8 != 25) {
    goto LABEL_8;
  }
  dispatch_qos_class_t v9 = QOS_CLASS_USER_INITIATED;
LABEL_11:
  v16[0] = MEMORY[0x1E4F143A8];
  v16[1] = 3221225472;
  v16[2] = __58__ICStoreURLRequest_buildURLRequestWithCompletionHandler___block_invoke_3;
  v16[3] = &unk_1E5ACD2A0;
  id v17 = v5;
  id v18 = v6;
  id v19 = *(id *)(a1 + 32);
  id v20 = *(id *)(a1 + 40);
  id v10 = v7;
  id v11 = v5;
  uint64_t v12 = (void (**)(dispatch_block_t, uint64_t, uint64_t, uint64_t))dispatch_block_create_with_qos_class(DISPATCH_BLOCK_ENFORCE_QOS_CLASS|DISPATCH_BLOCK_ASSIGN_CURRENT, v9, 0, v16);
  v12[2](v12, v13, v14, v15);
}

uint64_t __58__ICStoreURLRequest_buildURLRequestWithCompletionHandler___block_invoke_3(uint64_t a1)
{
  if (*(void *)(a1 + 32) && !*(void *)(a1 + 40)) {
    objc_msgSend(*(id *)(a1 + 48), "setDelegatedURLBag:");
  }
  uint64_t v2 = *(uint64_t (**)(void))(*(void *)(a1 + 56) + 16);

  return v2();
}

+ (BOOL)_shouldPersonalizeRequestForRequestContext:(id)a3 personalizationStyle:(int64_t)a4
{
  if (a4 != 1) {
    return a4 != 0;
  }
  id v5 = a3;
  id v6 = [v5 clientInfo];
  uint64_t v7 = [v6 requestingBundleIdentifier];
  uint64_t v8 = v7;
  if (v7)
  {
    id v9 = v7;
  }
  else
  {
    id v10 = [MEMORY[0x1E4F28B50] mainBundle];
    id v9 = [v10 bundleIdentifier];
  }
  id v11 = [v5 identity];

  uint64_t v12 = +[ICPrivacyInfo sharedPrivacyInfoForUserIdentity:v11];
  char v13 = [v12 privacyAcknowledgementRequiredForBundleIdentifier:v9];

  char v4 = v13 ^ 1;
  return v4;
}

@end