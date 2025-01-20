@interface ICStoreURLResponseAuthenticationProvider
+ (BOOL)supportsSecureCoding;
- (void)_adjustedAuthenticationPolicyForResponse:(id)a3 withCompletionHandler:(id)a4;
- (void)_performAuthenticationUsingRequestContext:(id)a3 usingVerificationInteractionLevel:(int64_t)a4 withCompletionHandler:(id)a5;
- (void)performAuthenticationToHandleResponse:(id)a3 toRequest:(id)a4 withCompletionHandler:(id)a5;
- (void)performAuthenticationUsingRequestContext:(id)a3 withCompletionHandler:(id)a4;
@end

@implementation ICStoreURLResponseAuthenticationProvider

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)_adjustedAuthenticationPolicyForResponse:(id)a3 withCompletionHandler:(id)a4
{
  v15 = (void (**)(id, BOOL, int64_t))a4;
  id v6 = a3;
  int64_t v7 = [(ICURLResponseAuthenticationProvider *)self interactionLevel];
  v8 = [v6 urlResponse];

  v9 = objc_msgSend(v8, "ic_valueForHTTPHeaderField:", @"X-Apple-Allow-Auth-Types");
  v10 = [MEMORY[0x1E4F28B88] whitespaceAndNewlineCharacterSet];
  v11 = [v9 stringByTrimmingCharactersInSet:v10];

  if (v11)
  {
    v12 = [v11 componentsSeparatedByString:@" "];
    if ([v12 containsObject:@"silent"])
    {
      BOOL v13 = 1;
    }
    else
    {
      int64_t v14 = [(ICURLResponseAuthenticationProvider *)self interactionLevel];
      if (v14 == 2)
      {
        int64_t v7 = 0;
        BOOL v13 = 1;
      }
      else
      {
        BOOL v13 = v14 != 1;
      }
    }
  }
  else
  {
    BOOL v13 = 1;
  }
  v15[2](v15, v13, v7);
}

- (void)_performAuthenticationUsingRequestContext:(id)a3 usingVerificationInteractionLevel:(int64_t)a4 withCompletionHandler:(id)a5
{
  uint64_t v40 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  v9 = (void (**)(id, void, id))a5;
  id v10 = v8;
  if ([v10 personalizationStyle] != 1
    || ([v10 identity],
        v11 = objc_claimAutoreleasedReturnValue(),
        +[ICPrivacyInfo sharedPrivacyInfoForUserIdentity:](ICPrivacyInfo, "sharedPrivacyInfoForUserIdentity:", v11), v12 = objc_claimAutoreleasedReturnValue(), int v13 = [v12 privacyAcknowledgementRequiredForMusic], v12, v11, !v13))
  {
    v16 = os_log_create("com.apple.amp.iTunesCloud", "Default");
    if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
    {
      if ((unint64_t)a4 > 5) {
        v17 = @"unknown";
      }
      else {
        v17 = off_1E5AC7F48[a4];
      }
      v18 = v17;
      *(_DWORD *)buf = 138543874;
      v35 = self;
      __int16 v36 = 2114;
      v37 = v18;
      __int16 v38 = 2114;
      id v39 = v10;
      _os_log_impl(&dword_1A2D01000, v16, OS_LOG_TYPE_DEFAULT, "%{public}@ Performing %{public}@ authentication using request context %{public}@", buf, 0x20u);
    }
    v15 = [v10 identity];
    int v19 = [(__CFString *)v15 allowsAccountEstablishment];
    if (a4 == 1 && v19)
    {
      v20 = [v10 identity];
      uint64_t v21 = [v20 identityAllowingEstablishment:0];

      v15 = (__CFString *)v21;
    }
    v22 = [v10 identityStore];
    id v33 = 0;
    v23 = [v22 getVerificationContextForUserIdentity:v15 error:&v33];
    id v24 = v33;
    if (v24 || !v23)
    {
      v29 = os_log_create("com.apple.amp.iTunesCloud", "Default");
      if (os_log_type_enabled(v29, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138543874;
        v35 = self;
        __int16 v36 = 2114;
        v37 = v15;
        __int16 v38 = 2114;
        id v39 = v24;
        _os_log_impl(&dword_1A2D01000, v29, OS_LOG_TYPE_DEFAULT, "%{public}@ Failed to get verification context for identity %{public}@. error=%{public}@", buf, 0x20u);
      }

      v25 = (ICUserVerificationRequest *)[objc_alloc(MEMORY[0x1E4F1CA60]) initWithCapacity:2];
      [(ICUserVerificationRequest *)v25 setObject:v24 forKeyedSubscript:*MEMORY[0x1E4F28A50]];
      v30 = [NSString stringWithFormat:@"Failed to get verification context for identity %@", v15];
      [(ICUserVerificationRequest *)v25 setObject:v30 forKeyedSubscript:*MEMORY[0x1E4F28228]];

      if (v24)
      {
        v9[2](v9, 0, v24);
LABEL_23:

        goto LABEL_24;
      }
      v28 = [MEMORY[0x1E4F28C58] errorWithDomain:@"ICError" code:-7400 userInfo:v25];
      v9[2](v9, 0, v28);
    }
    else
    {
      [v23 setInteractionLevel:a4];
      [v23 setDebugReason:@"Server requested authentication"];
      v25 = [[ICUserVerificationRequest alloc] initWithVerificationContext:v23];
      v26 = [ICStoreRequestContext alloc];
      v27 = [v10 clientInfo];
      v28 = [(ICStoreRequestContext *)v26 initWithIdentity:v15 identityStore:v22 clientInfo:v27];

      [(ICUserVerificationRequest *)v25 setStoreRequestContext:v28];
      v31[0] = MEMORY[0x1E4F143A8];
      v31[1] = 3221225472;
      v31[2] = __142__ICStoreURLResponseAuthenticationProvider__performAuthenticationUsingRequestContext_usingVerificationInteractionLevel_withCompletionHandler___block_invoke;
      v31[3] = &unk_1E5ACB920;
      v32 = v9;
      [(ICUserVerificationRequest *)v25 performWithResponseHandler:v31];
    }
    goto LABEL_23;
  }
  int64_t v14 = os_log_create("com.apple.amp.iTunesCloud", "Default");
  if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543362;
    v35 = self;
    _os_log_impl(&dword_1A2D01000, v14, OS_LOG_TYPE_DEFAULT, "%{public}@ Skipping automatic re-authentication because the user hasn't accepted the latest privacy link, and personalization is automatic", buf, 0xCu);
  }

  v15 = [MEMORY[0x1E4F28C58] errorWithDomain:@"ICError" code:-7007 userInfo:0];
  v9[2](v9, 0, v15);
LABEL_24:
}

uint64_t __142__ICStoreURLResponseAuthenticationProvider__performAuthenticationUsingRequestContext_usingVerificationInteractionLevel_withCompletionHandler___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)performAuthenticationUsingRequestContext:(id)a3 withCompletionHandler:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  [(ICStoreURLResponseAuthenticationProvider *)self _performAuthenticationUsingRequestContext:v7 usingVerificationInteractionLevel:[(ICURLResponseAuthenticationProvider *)self interactionLevel] withCompletionHandler:v6];
}

- (void)performAuthenticationToHandleResponse:(id)a3 toRequest:(id)a4 withCompletionHandler:(id)a5
{
  id v8 = a3;
  id v9 = a5;
  id v10 = a4;
  v11 = [v10 currentURLRequest];
  v12 = [v10 requestContext];

  int v13 = [v12 delegatedIdentity];
  int64_t v14 = objc_msgSend(v11, "ic_valueForHTTPHeaderField:", @"X-WHA-Token");

  if (v14 && v13)
  {
    v15 = [v12 identityStore];
    v22[0] = MEMORY[0x1E4F143A8];
    v22[1] = 3221225472;
    v22[2] = __114__ICStoreURLResponseAuthenticationProvider_performAuthenticationToHandleResponse_toRequest_withCompletionHandler___block_invoke;
    v22[3] = &unk_1E5ACB920;
    id v23 = v9;
    id v16 = v9;
    [v15 removeDelegateTokenForUserIdentity:v13 completionHandler:v22];

    v17 = v23;
  }
  else
  {
    v19[0] = MEMORY[0x1E4F143A8];
    v19[1] = 3221225472;
    v19[2] = __114__ICStoreURLResponseAuthenticationProvider_performAuthenticationToHandleResponse_toRequest_withCompletionHandler___block_invoke_2;
    v19[3] = &unk_1E5ACAEF8;
    v19[4] = self;
    id v21 = v9;
    id v20 = v12;
    id v18 = v9;
    [(ICStoreURLResponseAuthenticationProvider *)self _adjustedAuthenticationPolicyForResponse:v8 withCompletionHandler:v19];

    v17 = v21;
  }
}

uint64_t __114__ICStoreURLResponseAuthenticationProvider_performAuthenticationToHandleResponse_toRequest_withCompletionHandler___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

void __114__ICStoreURLResponseAuthenticationProvider_performAuthenticationToHandleResponse_toRequest_withCompletionHandler___block_invoke_2(void *a1, char a2, uint64_t a3)
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  if (a2)
  {
    v5 = (void *)a1[4];
    uint64_t v6 = a1[5];
    uint64_t v7 = a1[6];
    [v5 _performAuthenticationUsingRequestContext:v6 usingVerificationInteractionLevel:a3 withCompletionHandler:v7];
  }
  else
  {
    id v8 = os_log_create("com.apple.amp.iTunesCloud", "Default");
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      id v9 = (void *)a1[4];
      unint64_t v10 = [v9 interactionLevel];
      if (v10 > 5) {
        v11 = @"unknown";
      }
      else {
        v11 = off_1E5AC7F48[v10];
      }
      v12 = v11;
      int v15 = 138543618;
      id v16 = v9;
      __int16 v17 = 2114;
      id v18 = v12;
      _os_log_impl(&dword_1A2D01000, v8, OS_LOG_TYPE_DEFAULT, "%{public}@ Not authenticating because %{public}@ authentication is not allowed for this response", (uint8_t *)&v15, 0x16u);
    }
    uint64_t v13 = a1[6];
    int64_t v14 = [MEMORY[0x1E4F28C58] errorWithDomain:@"ICError" code:-7402 userInfo:0];
    (*(void (**)(uint64_t, void, void *))(v13 + 16))(v13, 0, v14);
  }
}

@end