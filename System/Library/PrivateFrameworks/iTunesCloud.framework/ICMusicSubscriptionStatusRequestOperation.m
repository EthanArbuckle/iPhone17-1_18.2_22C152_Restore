@interface ICMusicSubscriptionStatusRequestOperation
- (BOOL)_carrierBundleStatusIsValidForCachedSubscriptionStatus:(id)a3;
- (BOOL)allowsFuseHeaderEnrichment;
- (BOOL)shouldRequestLightweightStatus;
- (ICMusicSubscriptionStatusRequest)request;
- (ICMusicSubscriptionStatusRequestOperation)initWithRequest:(id)a3;
- (id)responseHandler;
- (void)_cacheAccountEligibilityWithStatus:(id)a3 requestContext:(id)a4;
- (void)_performSubscriptionStatusURLRequestWithRequestContext:(id)a3 subscriptionStatusURL:(id)a4 allowsAuthentication:(BOOL)a5 completion:(id)a6;
- (void)execute;
- (void)setAllowsFuseHeaderEnrichment:(BOOL)a3;
- (void)setResponseHandler:(id)a3;
- (void)setShouldRequestLightweightStatus:(BOOL)a3;
@end

@implementation ICMusicSubscriptionStatusRequestOperation

void __52__ICMusicSubscriptionStatusRequestOperation_execute__block_invoke_2(uint64_t a1, void *a2)
{
  id v4 = a2;
  v3 = +[ICClientInfo defaultInfo];
  [v4 setClientInfo:v3];

  if ([*(id *)(a1 + 32) shouldBypassEnforcementOfPrivacyAcknowledgement]) {
    [v4 setPersonalizationStyle:2];
  }
}

- (void)execute
{
  uint64_t v41 = *MEMORY[0x1E4F143B8];
  v3 = self->_request;
  id v4 = (void *)MEMORY[0x1A6240BF0](self->_responseHandler);
  BOOL shouldRequestLightweightStatus = self->_shouldRequestLightweightStatus;
  BOOL v6 = [(ICMusicSubscriptionStatusRequest *)v3 shouldIgnoreCache];
  if (!shouldRequestLightweightStatus && self->_allowsFuseHeaderEnrichment)
  {
    v8 = +[ICDeviceInfo currentDeviceInfo];
    int v9 = [v8 isPhoneNumberAccessRestricted];

    if (!v9)
    {
      char v11 = 1;
      goto LABEL_11;
    }
    v10 = os_log_create("com.apple.amp.iTunesCloud", "Subscription");
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138543362;
      v40 = self;
      _os_log_impl(&dword_1A2D01000, v10, OS_LOG_TYPE_DEFAULT, "%{public}@ Loading carrier bundling status is not allowed because phone number access is restricted.", buf, 0xCu);
    }
  }
  char v11 = 0;
LABEL_11:
  BOOL v12 = !v6;
  v37[0] = MEMORY[0x1E4F143A8];
  v37[1] = 3221225472;
  v37[2] = __52__ICMusicSubscriptionStatusRequestOperation_execute__block_invoke;
  v37[3] = &unk_1E5ACB4D8;
  id v13 = v4;
  id v38 = v13;
  v14 = (void *)MEMORY[0x1A6240BF0](v37);
  v15 = [(ICMusicSubscriptionStatusRequest *)v3 storeRequestContext];
  v35[0] = MEMORY[0x1E4F143A8];
  v35[1] = 3221225472;
  v35[2] = __52__ICMusicSubscriptionStatusRequestOperation_execute__block_invoke_2;
  v35[3] = &unk_1E5ACC698;
  v16 = v3;
  v36 = v16;
  v17 = (void *)[v15 copyWithBlock:v35];

  v18 = +[ICMusicSubscriptionStatusCache sharedCache];
  v24[0] = MEMORY[0x1E4F143A8];
  v24[1] = 3221225472;
  v24[2] = __52__ICMusicSubscriptionStatusRequestOperation_execute__block_invoke_3;
  v24[3] = &unk_1E5AC81D8;
  v25 = v16;
  v26 = self;
  id v27 = v17;
  id v28 = v14;
  BOOL v31 = v12;
  BOOL v32 = shouldRequestLightweightStatus;
  char v33 = v11;
  BOOL v34 = !shouldRequestLightweightStatus;
  id v29 = v13;
  SEL v30 = a2;
  id v19 = v13;
  id v20 = v14;
  id v21 = v17;
  v22 = v16;
  [v18 getCachedSubscriptionStatusResponseForRequestContext:v21 completion:v24];
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_responseHandler, 0);

  objc_storeStrong((id *)&self->_request, 0);
}

- (void)setResponseHandler:(id)a3
{
}

- (void)setAllowsFuseHeaderEnrichment:(BOOL)a3
{
  self->_allowsFuseHeaderEnrichment = a3;
}

- (ICMusicSubscriptionStatusRequestOperation)initWithRequest:(id)a3
{
  id v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)ICMusicSubscriptionStatusRequestOperation;
  v5 = [(ICAsyncOperation *)&v9 init];
  if (v5)
  {
    uint64_t v6 = [v4 copy];
    request = v5->_request;
    v5->_request = (ICMusicSubscriptionStatusRequest *)v6;
  }
  return v5;
}

void __52__ICMusicSubscriptionStatusRequestOperation_execute__block_invoke_3(uint64_t a1, void *a2, void *a3)
{
  uint64_t v44 = *MEMORY[0x1E4F143B8];
  unint64_t v5 = a2;
  id v6 = a3;
  if (v5
    && (([*(id *)(a1 + 32) allowsFallbackToExpiredStatus] & 1) != 0
     || ([(id)v5 isExpired] & 1) == 0))
  {
    if ([*(id *)(a1 + 32) allowsFallbackToStatusNeedingReload]) {
      LOBYTE(v7) = 1;
    }
    else {
      int v7 = [(id)v5 needsReload] ^ 1;
    }
  }
  else
  {
    LOBYTE(v7) = 0;
  }
  if ([*(id *)(a1 + 32) shouldReturnLastKnownStatusOnly])
  {
    uint64_t v8 = (uint64_t)v6;
    if (!(v5 | v8))
    {
      uint64_t v8 = [MEMORY[0x1E4F28C58] errorWithDomain:@"ICError" code:-7008 userInfo:0];
    }
    objc_super v9 = os_log_create("com.apple.amp.iTunesCloud", "Subscription");
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v10 = *(void *)(a1 + 40);
      uint64_t v11 = *(void *)(a1 + 48);
      *(_DWORD *)buf = 138544130;
      uint64_t v37 = v10;
      __int16 v38 = 2114;
      unint64_t v39 = v5;
      __int16 v40 = 2114;
      uint64_t v41 = v8;
      __int16 v42 = 2114;
      uint64_t v43 = v11;
      _os_log_impl(&dword_1A2D01000, v9, OS_LOG_TYPE_DEFAULT, "%{public}@ Returning last known subscription status %{public}@ with error %{public}@ for: %{public}@", buf, 0x2Au);
    }

    BOOL v12 = *(void (**)(void))(*(void *)(a1 + 56) + 16);
LABEL_14:
    v12();
    [*(id *)(a1 + 40) finishWithError:v8];

    goto LABEL_25;
  }
  if (!v5
    || !*(unsigned char *)(a1 + 80)
    || ([(id)v5 isExpired] & 1) != 0
    || ([(id)v5 needsReload] & 1) != 0)
  {
    if (([*(id *)(a1 + 32) shouldBypassEnforcementOfPrivacyAcknowledgement] & 1) != 0
      || ([*(id *)(a1 + 48) identity],
          id v13 = objc_claimAutoreleasedReturnValue(),
          +[ICPrivacyInfo sharedPrivacyInfoForUserIdentity:](ICPrivacyInfo, "sharedPrivacyInfoForUserIdentity:", v13), v14 = objc_claimAutoreleasedReturnValue(), int v15 = [v14 privacyAcknowledgementRequiredForMusic], v14, v13, !v15))
    {
      v18 = +[ICURLBagProvider sharedBagProvider];
      v25[0] = MEMORY[0x1E4F143A8];
      v25[1] = 3221225472;
      v25[2] = __52__ICMusicSubscriptionStatusRequestOperation_execute__block_invoke_7;
      v25[3] = &unk_1E5AC81B0;
      id v19 = *(void **)(a1 + 48);
      v25[4] = *(void *)(a1 + 40);
      id v26 = v19;
      id v29 = *(id *)(a1 + 56);
      char v32 = v7;
      id v20 = (id)v5;
      __int16 v33 = *(_WORD *)(a1 + 81);
      uint64_t v21 = *(void *)(a1 + 72);
      id v27 = v20;
      uint64_t v31 = v21;
      id v28 = *(id *)(a1 + 32);
      char v34 = *(unsigned char *)(a1 + 83);
      id v30 = *(id *)(a1 + 64);
      char v35 = *(unsigned char *)(a1 + 80);
      [v18 getBagForRequestContext:v26 withCompletionHandler:v25];

      goto LABEL_25;
    }
    v16 = os_log_create("com.apple.amp.iTunesCloud", "Subscription");
    if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
    {
      uint64_t v17 = *(void *)(a1 + 40);
      *(_DWORD *)buf = 138543362;
      uint64_t v37 = v17;
      _os_log_impl(&dword_1A2D01000, v16, OS_LOG_TYPE_ERROR, "%{public}@ Aborted fetching subscription status because privacy link needs to be displayed first.", buf, 0xCu);
    }

    uint64_t v8 = [MEMORY[0x1E4F28C58] errorWithDomain:@"ICError" code:-7007 userInfo:0];
    BOOL v12 = *(void (**)(void))(*(void *)(a1 + 56) + 16);
    goto LABEL_14;
  }
  v22 = os_log_create("com.apple.amp.iTunesCloud", "Subscription");
  if (os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v23 = *(void *)(a1 + 40);
    uint64_t v24 = *(void *)(a1 + 48);
    *(_DWORD *)buf = 138543874;
    uint64_t v37 = v23;
    __int16 v38 = 2114;
    unint64_t v39 = v5;
    __int16 v40 = 2114;
    uint64_t v41 = v24;
    _os_log_impl(&dword_1A2D01000, v22, OS_LOG_TYPE_DEFAULT, "%{public}@ Using cached subscription status %{public}@ for: %{public}@", buf, 0x20u);
  }

  (*(void (**)(void))(*(void *)(a1 + 56) + 16))();
  [*(id *)(a1 + 40) finishWithError:v6];
LABEL_25:
}

void __52__ICMusicSubscriptionStatusRequestOperation_execute__block_invoke(uint64_t a1, void *a2, void *a3)
{
  if (*(void *)(a1 + 32))
  {
    id v5 = a3;
    id v6 = (id)[a2 copy];
    [v6 setFinalResponse:1];
    (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
  }
}

- (void)setShouldRequestLightweightStatus:(BOOL)a3
{
  self->_BOOL shouldRequestLightweightStatus = a3;
}

- (BOOL)shouldRequestLightweightStatus
{
  return self->_shouldRequestLightweightStatus;
}

- (id)responseHandler
{
  return self->_responseHandler;
}

- (BOOL)allowsFuseHeaderEnrichment
{
  return self->_allowsFuseHeaderEnrichment;
}

- (ICMusicSubscriptionStatusRequest)request
{
  return self->_request;
}

- (BOOL)_carrierBundleStatusIsValidForCachedSubscriptionStatus:(id)a3
{
  id v5 = a3;
  id v6 = +[ICDeviceInfo currentDeviceInfo];
  int v7 = [v6 isPhoneNumberAccessRestricted];

  if (v7)
  {
    id v13 = [MEMORY[0x1E4F28B00] currentHandler];
    [v13 handleFailureInMethod:a2 object:self file:@"ICMusicSubscriptionStatusRequestOperation.m" lineNumber:417 description:@"Phone number access is restricted."];
  }
  if ((unint64_t)([v5 carrierBundlingStatusType] - 1) > 2)
  {
    char v11 = 0;
  }
  else
  {
    uint64_t v8 = +[ICTelephonyController sharedController];
    objc_super v9 = [v8 phoneNumber];

    uint64_t v10 = [v5 phoneNumber];
    if (v9 == v10) {
      char v11 = 1;
    }
    else {
      char v11 = [v9 isEqualToString:v10];
    }
  }
  return v11;
}

- (void)_cacheAccountEligibilityWithStatus:(id)a3 requestContext:(id)a4
{
  id v5 = a4;
  id v6 = a3;
  int v7 = [v5 identityStore];
  uint64_t v8 = [v5 identity];
  uint64_t v17 = 0;
  objc_super v9 = [v7 getPropertiesForUserIdentity:v8 error:&v17];
  uint64_t v10 = v17;

  uint64_t v11 = [v6 statusType];
  int v12 = v11 == 1;
  if (v10 || v12 != [v9 isSubscriptionStatusEnabled])
  {
    id v13 = +[ICUserIdentityStore defaultIdentityStore];
    v14 = [v5 identity];
    v15[0] = MEMORY[0x1E4F143A8];
    v15[1] = 3221225472;
    v15[2] = __95__ICMusicSubscriptionStatusRequestOperation__cacheAccountEligibilityWithStatus_requestContext___block_invoke;
    v15[3] = &__block_descriptor_33_e41_v16__0__ICMutableUserIdentityProperties_8l;
    char v16 = v12;
    [v13 updatePropertiesForUserIdentity:v14 usingBlock:v15];
  }
}

uint64_t __95__ICMusicSubscriptionStatusRequestOperation__cacheAccountEligibilityWithStatus_requestContext___block_invoke(uint64_t a1, void *a2)
{
  return [a2 setSubscriptionStatusEnabled:*(unsigned __int8 *)(a1 + 32)];
}

- (void)_performSubscriptionStatusURLRequestWithRequestContext:(id)a3 subscriptionStatusURL:(id)a4 allowsAuthentication:(BOOL)a5 completion:(id)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a6;
  id v13 = [[ICStoreURLRequest alloc] initWithURL:v11 requestContext:v10];
  [(ICURLRequest *)v13 setMaxRetryCount:0];
  v14 = +[ICURLSessionManager defaultSession];
  v18[0] = MEMORY[0x1E4F143A8];
  v18[1] = 3221225472;
  v18[2] = __154__ICMusicSubscriptionStatusRequestOperation__performSubscriptionStatusURLRequestWithRequestContext_subscriptionStatusURL_allowsAuthentication_completion___block_invoke;
  v18[3] = &unk_1E5AC8200;
  v18[4] = self;
  id v19 = v10;
  BOOL v22 = a5;
  id v20 = v11;
  id v21 = v12;
  id v15 = v11;
  id v16 = v12;
  id v17 = v10;
  [v14 enqueueDataRequest:v13 withCompletionHandler:v18];
}

void __154__ICMusicSubscriptionStatusRequestOperation__performSubscriptionStatusURLRequestWithRequestContext_subscriptionStatusURL_allowsAuthentication_completion___block_invoke(uint64_t a1, void *a2, void *a3)
{
  uint64_t v50 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  id v6 = a3;
  if (v6)
  {
    int v7 = os_log_create("com.apple.amp.iTunesCloud", "Subscription");
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      uint64_t v8 = *(void *)(a1 + 32);
      uint64_t v9 = *(void *)(a1 + 40);
      *(_DWORD *)buf = 138543874;
      uint64_t v45 = v8;
      __int16 v46 = 2114;
      uint64_t v47 = v9;
      __int16 v48 = 2114;
      id v49 = v6;
      _os_log_impl(&dword_1A2D01000, v7, OS_LOG_TYPE_ERROR, "%{public}@ Subscription status load failed for %{public}@ due to response error: %{public}@", buf, 0x20u);
    }

    id v10 = 0;
    id v11 = v6;
    goto LABEL_25;
  }
  uint64_t v12 = [v5 parsedBodyDictionary];
  if (!v12)
  {
    id v29 = os_log_create("com.apple.amp.iTunesCloud", "Subscription");
    if (os_log_type_enabled(v29, OS_LOG_TYPE_ERROR))
    {
      uint64_t v30 = *(void *)(a1 + 32);
      uint64_t v31 = *(void *)(a1 + 40);
      *(_DWORD *)buf = 138543618;
      uint64_t v45 = v30;
      __int16 v46 = 2114;
      uint64_t v47 = v31;
      _os_log_impl(&dword_1A2D01000, v29, OS_LOG_TYPE_ERROR, "%{public}@ Subscription status load failed for %{public}@ due to invalid response.", buf, 0x16u);
    }

    id v11 = [MEMORY[0x1E4F28C58] errorWithDomain:@"ICError" code:-7102 userInfo:0];
    goto LABEL_23;
  }
  id v13 = (void *)v12;
  v14 = os_log_create("com.apple.amp.iTunesCloud", "Subscription_Oversize");
  if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v15 = *(void *)(a1 + 32);
    uint64_t v16 = *(void *)(a1 + 40);
    *(_DWORD *)buf = 138543874;
    uint64_t v45 = v15;
    __int16 v46 = 2114;
    uint64_t v47 = v16;
    __int16 v48 = 2114;
    id v49 = v13;
    _os_log_impl(&dword_1A2D01000, v14, OS_LOG_TYPE_DEFAULT, "%{public}@ Received subscription status response for %{public}@: %{public}@", buf, 0x20u);
  }

  id v43 = 0;
  BOOL v17 = +[ICMusicSubscriptionStatusResponse isValidSubscriptionStatusResponseDictionary:v13 error:&v43];
  id v11 = v43;
  if (!v17)
  {
    char v32 = os_log_create("com.apple.amp.iTunesCloud", "Subscription");
    if (os_log_type_enabled(v32, OS_LOG_TYPE_ERROR))
    {
      uint64_t v33 = *(void *)(a1 + 32);
      uint64_t v34 = *(void *)(a1 + 40);
      *(_DWORD *)buf = 138543874;
      uint64_t v45 = v33;
      __int16 v46 = 2114;
      uint64_t v47 = v34;
      __int16 v48 = 2114;
      id v49 = v11;
      _os_log_impl(&dword_1A2D01000, v32, OS_LOG_TYPE_ERROR, "%{public}@ Failed parsing subscription status response for %{public}@ with error: %{public}@.", buf, 0x20u);
    }

LABEL_23:
    id v10 = 0;
    goto LABEL_25;
  }
  id v10 = [[ICMusicSubscriptionStatusResponse alloc] initWithResponseDictionary:v13 expirationDate:0];
  v18 = [(ICMusicSubscriptionStatusResponse *)v10 subscriptionStatus];
  if ([v18 statusType] == 1 || objc_msgSend(v18, "reasonType") != 4)
  {

    id v11 = 0;
LABEL_25:
    uint64_t v35 = *(void *)(a1 + 56);
    if (v35) {
      (*(void (**)(uint64_t, ICMusicSubscriptionStatusResponse *, id))(v35 + 16))(v35, v10, v11);
    }
    goto LABEL_27;
  }
  id v19 = [*(id *)(a1 + 40) authenticationProvider];
  id v20 = v19;
  if (*(unsigned char *)(a1 + 64)
    && ([v19 interactionLevel] != 1
     || ([v18 acceptSilentAuth],
         id v21 = objc_claimAutoreleasedReturnValue(),
         int v22 = [v21 BOOLValue],
         v21,
         v22)))
  {
    uint64_t v23 = _ICLogCategorySubscription();
    if (os_log_type_enabled(v23, OS_LOG_TYPE_ERROR))
    {
      uint64_t v24 = *(void *)(a1 + 32);
      uint64_t v25 = *(void *)(a1 + 40);
      *(_DWORD *)buf = 138543618;
      uint64_t v45 = v24;
      __int16 v46 = 2114;
      uint64_t v47 = v25;
      _os_log_impl(&dword_1A2D01000, v23, OS_LOG_TYPE_ERROR, "%{public}@ Received invalid token response for %{public}@, authenticating...", buf, 0x16u);
    }

    v39[0] = MEMORY[0x1E4F143A8];
    v39[1] = 3221225472;
    v39[2] = __154__ICMusicSubscriptionStatusRequestOperation__performSubscriptionStatusURLRequestWithRequestContext_subscriptionStatusURL_allowsAuthentication_completion___block_invoke_42;
    v39[3] = &unk_1E5ACAB00;
    uint64_t v26 = *(void *)(a1 + 40);
    v39[4] = *(void *)(a1 + 32);
    id v42 = *(id *)(a1 + 56);
    id v40 = *(id *)(a1 + 40);
    id v41 = *(id *)(a1 + 48);
    [v20 performAuthenticationUsingRequestContext:v26 withCompletionHandler:v39];

    uint64_t v27 = 0;
    char v28 = 1;
  }
  else
  {
    v36 = _ICLogCategorySubscription();
    if (os_log_type_enabled(v36, OS_LOG_TYPE_ERROR))
    {
      uint64_t v37 = *(void *)(a1 + 32);
      uint64_t v38 = *(void *)(a1 + 40);
      *(_DWORD *)buf = 138543618;
      uint64_t v45 = v37;
      __int16 v46 = 2114;
      uint64_t v47 = v38;
      _os_log_impl(&dword_1A2D01000, v36, OS_LOG_TYPE_ERROR, "%{public}@ Received invalid token response but not allowed to authenticate for: %{public}@", buf, 0x16u);
    }

    uint64_t v27 = [MEMORY[0x1E4F28C58] errorWithDomain:@"ICError" code:-7901 userInfo:0];

    char v28 = 0;
    id v10 = 0;
  }

  id v11 = (id)v27;
  if ((v28 & 1) == 0) {
    goto LABEL_25;
  }
LABEL_27:
}

void __154__ICMusicSubscriptionStatusRequestOperation__performSubscriptionStatusURLRequestWithRequestContext_subscriptionStatusURL_allowsAuthentication_completion___block_invoke_42(uint64_t a1, char a2, void *a3)
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  if (a2)
  {
    [*(id *)(a1 + 32) _performSubscriptionStatusURLRequestWithRequestContext:*(void *)(a1 + 40) subscriptionStatusURL:*(void *)(a1 + 48) allowsAuthentication:0 completion:*(void *)(a1 + 56)];
  }
  else
  {
    id v6 = os_log_create("com.apple.amp.iTunesCloud", "Subscription");
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    {
      uint64_t v7 = *(void *)(a1 + 32);
      int v9 = 138543618;
      uint64_t v10 = v7;
      __int16 v11 = 2114;
      id v12 = v5;
      _os_log_impl(&dword_1A2D01000, v6, OS_LOG_TYPE_ERROR, "%{public}@ Authentication failed with error: %{public}@", (uint8_t *)&v9, 0x16u);
    }

    if (!v5)
    {
      id v5 = [MEMORY[0x1E4F28C58] errorWithDomain:@"ICError" code:-7901 userInfo:0];
    }
    uint64_t v8 = *(void *)(a1 + 56);
    if (v8) {
      (*(void (**)(uint64_t, void, id))(v8 + 16))(v8, 0, v5);
    }
  }
}

void __52__ICMusicSubscriptionStatusRequestOperation_execute__block_invoke_7(uint64_t a1, void *a2, void *a3)
{
  uint64_t v47 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  id v6 = a3;
  uint64_t v7 = os_log_create("com.apple.amp.iTunesCloud", "Subscription");
  uint64_t v8 = v7;
  if (v6)
  {
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      uint64_t v9 = *(void *)(a1 + 32);
      uint64_t v10 = *(void **)(a1 + 40);
      *(_DWORD *)buf = 138543874;
      uint64_t v40 = v9;
      __int16 v41 = 2114;
      id v42 = v10;
      __int16 v43 = 2114;
      id v44 = v6;
      _os_log_impl(&dword_1A2D01000, v8, OS_LOG_TYPE_ERROR, "%{public}@ Subscription status load failed for %{public}@ due to URL bag load failure: %{public}@", buf, 0x20u);
    }

    if (*(unsigned char *)(a1 + 88)) {
      uint64_t v11 = *(void *)(a1 + 48);
    }
    else {
      uint64_t v11 = 0;
    }
    (*(void (**)(void, uint64_t, id))(*(void *)(a1 + 64) + 16))(*(void *)(a1 + 64), v11, v6);
    [*(id *)(a1 + 32) finishWithError:v6];
  }
  else
  {
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v12 = *(void *)(a1 + 32);
      uint64_t v13 = [v5 serverCorrelationKey];
      v14 = [v5 serverEnvironment];
      *(_DWORD *)buf = 138544130;
      uint64_t v40 = v12;
      __int16 v41 = 2114;
      id v42 = v5;
      __int16 v43 = 2114;
      id v44 = v13;
      __int16 v45 = 2114;
      __int16 v46 = v14;
      _os_log_impl(&dword_1A2D01000, v8, OS_LOG_TYPE_DEFAULT, "%{public}@ Successfully loaded bag: %{public}@ (serverCorrelationKey: %{public}@; serverEnvironment: %{public}@).",
        buf,
        0x2Au);
    }
    uint64_t v15 = [v5 urlForBagKey:@"getSubscriptionStatusSrv"];
    if (*(unsigned char *)(a1 + 89))
    {
      uint64_t v16 = [MEMORY[0x1E4F290C8] queryItemWithName:@"minimal" value:@"true"];
      uint64_t v38 = v16;
      BOOL v17 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v38 count:1];
      uint64_t v18 = objc_msgSend(v15, "ic_URLByAppendingQueryItems:", v17);

      uint64_t v15 = (void *)v18;
    }
    if (v15)
    {
      id v19 = *(void **)(a1 + 32);
      uint64_t v20 = *(void *)(a1 + 40);
      v26[0] = MEMORY[0x1E4F143A8];
      v26[1] = 3221225472;
      v26[2] = __52__ICMusicSubscriptionStatusRequestOperation_execute__block_invoke_14;
      v26[3] = &unk_1E5AC8188;
      uint64_t v33 = *(void *)(a1 + 80);
      v26[4] = v19;
      char v34 = *(unsigned char *)(a1 + 88);
      id v27 = *(id *)(a1 + 48);
      char v35 = *(unsigned char *)(a1 + 90);
      id v28 = *(id *)(a1 + 56);
      id v29 = v5;
      id v30 = *(id *)(a1 + 40);
      char v36 = *(unsigned char *)(a1 + 91);
      id v31 = *(id *)(a1 + 64);
      id v32 = *(id *)(a1 + 72);
      char v37 = *(unsigned char *)(a1 + 92);
      [v19 _performSubscriptionStatusURLRequestWithRequestContext:v20 subscriptionStatusURL:v15 allowsAuthentication:1 completion:v26];
    }
    else
    {
      id v21 = os_log_create("com.apple.amp.iTunesCloud", "Subscription");
      if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR))
      {
        uint64_t v22 = *(void *)(a1 + 32);
        uint64_t v23 = *(void **)(a1 + 40);
        *(_DWORD *)buf = 138543618;
        uint64_t v40 = v22;
        __int16 v41 = 2114;
        id v42 = v23;
        _os_log_impl(&dword_1A2D01000, v21, OS_LOG_TYPE_ERROR, "%{public}@ Subscription status load failed for %{public}@ due to missing the key in the bag.", buf, 0x16u);
      }

      uint64_t v24 = [MEMORY[0x1E4F28C58] errorWithDomain:@"ICError" code:-7201 userInfo:0];
      if (*(unsigned char *)(a1 + 88)) {
        uint64_t v25 = *(void *)(a1 + 48);
      }
      else {
        uint64_t v25 = 0;
      }
      (*(void (**)(void, uint64_t, void *))(*(void *)(a1 + 64) + 16))(*(void *)(a1 + 64), v25, v24);
      [*(id *)(a1 + 32) finishWithError:v24];
    }
  }
}

void __52__ICMusicSubscriptionStatusRequestOperation_execute__block_invoke_14(uint64_t a1, void *a2, void *a3)
{
  uint64_t v70 = *MEMORY[0x1E4F143B8];
  unint64_t v5 = a2;
  unint64_t v6 = a3;
  if (v5 | v6)
  {
    if (v5)
    {
      int v7 = 0;
      goto LABEL_8;
    }
  }
  else
  {
    uint64_t v8 = [MEMORY[0x1E4F28B00] currentHandler];
    objc_msgSend(v8, "handleFailureInMethod:object:file:lineNumber:description:", *(void *)(a1 + 88), *(void *)(a1 + 32));
  }
  if (*(unsigned char *)(a1 + 96))
  {
    unint64_t v5 = (unint64_t)*(id *)(a1 + 40);
    int v7 = 1;
  }
  else
  {
    int v7 = 0;
    unint64_t v5 = 0;
  }
LABEL_8:
  if (!*(unsigned char *)(a1 + 97)) {
    goto LABEL_28;
  }
  if ([*(id *)(a1 + 48) reason] != 1)
  {
    uint64_t v9 = [*(id *)(a1 + 56) stringForBagKey:@"fuseCarrierMccMncList"];
    if (_NSIsNSString())
    {
      id v10 = v9;
      unint64_t v11 = [v10 length];
      unint64_t v12 = v11 - 2;
      if (v11 >= 2
        && [v10 hasPrefix:@"\""]
        && [v10 hasSuffix:@"\""])
      {
        uint64_t v13 = objc_msgSend(v10, "substringWithRange:", 1, v12);

        id v10 = (id)v13;
      }
      v14 = [v10 componentsSeparatedByString:@","];
    }
    else
    {
      v14 = 0;
    }
    if ([v14 count])
    {
      uint64_t v47 = v9;
      unint64_t v48 = v6;
      uint64_t v15 = +[ICTelephonyController sharedController];
      uint64_t v16 = [v15 mobileSubscriberCountryCode];
      BOOL v17 = [v15 mobileSubscriberNetworkCode];
      uint64_t v18 = [NSString stringWithFormat:@"%@%@", v16, v17];
      int v19 = [v14 containsObject:v18];
      if ((v19 & 1) == 0)
      {
        uint64_t v20 = os_log_create("com.apple.amp.iTunesCloud", "Subscription");
        if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
        {
          uint64_t v21 = *(void *)(a1 + 32);
          *(_DWORD *)buf = 138543874;
          uint64_t v65 = v21;
          __int16 v66 = 2114;
          v67 = v16;
          __int16 v68 = 2114;
          v69 = v17;
          _os_log_impl(&dword_1A2D01000, v20, OS_LOG_TYPE_DEFAULT, "%{public}@ Skipping loading of carrier bundling status because the combination (MCC: %{public}@, MNC: %{public}@) for the current active SIM card is not in the allow list.", buf, 0x20u);
        }
      }
      int v22 = v19 ^ 1;

      uint64_t v9 = v47;
      unint64_t v6 = v48;
    }
    else
    {
      int v22 = 0;
    }

    if (((v7 | v22) & 1) == 0) {
      goto LABEL_34;
    }
LABEL_28:
    if (!v5)
    {
LABEL_39:
      uint64_t v24 = 0;
LABEL_40:
      (*(void (**)(void))(*(void *)(a1 + 72) + 16))();
      [*(id *)(a1 + 32) finishWithError:v6];

      goto LABEL_64;
    }
    if ((v7 & 1) == 0)
    {
      uint64_t v23 = [(id)v5 subscriptionStatus];
      [*(id *)(a1 + 32) _cacheAccountEligibilityWithStatus:v23 requestContext:*(void *)(a1 + 64)];
    }
LABEL_31:
    uint64_t v24 = (void *)[(id)v5 copy];
    [v24 setFinalResponse:1];
    if ((v7 & 1) == 0 && *(unsigned char *)(a1 + 98))
    {
      uint64_t v25 = +[ICMusicSubscriptionStatusCache sharedCache];
      [v25 setCachedSubscriptionStatusResponse:v24 forRequestContext:*(void *)(a1 + 64) completion:0];
    }
    goto LABEL_40;
  }
  if (v7)
  {
    if (!v5) {
      goto LABEL_39;
    }
    goto LABEL_31;
  }
LABEL_34:
  if (!v5)
  {
    (*(void (**)(void))(*(void *)(a1 + 72) + 16))();
    [*(id *)(a1 + 32) finishWithError:v6];
    goto LABEL_64;
  }
  v60[0] = MEMORY[0x1E4F143A8];
  v60[1] = 3221225472;
  v60[2] = __52__ICMusicSubscriptionStatusRequestOperation_execute__block_invoke_33;
  v60[3] = &unk_1E5AC8130;
  id v63 = *(id *)(a1 + 80);
  id v26 = (id)v5;
  id v61 = v26;
  id v27 = (id)v6;
  id v62 = v27;
  id v28 = (void (**)(void, void, void))MEMORY[0x1A6240BF0](v60);
  id v29 = [v26 subscriptionStatus];
  id v30 = (void *)[v29 mutableCopy];

  [*(id *)(a1 + 32) _cacheAccountEligibilityWithStatus:v30 requestContext:*(void *)(a1 + 64)];
  id v31 = +[ICDeviceInfo currentDeviceInfo];
  char v32 = [v31 hasCellularDataCapability];

  if ((v32 & 1) == 0)
  {
    [v30 setCarrierBundlingStatusType:3];
    BOOL v36 = 0;
LABEL_60:
    ((void (**)(void, void *, BOOL))v28)[2](v28, v30, !v36);
    char v41 = 0;
    goto LABEL_61;
  }
  unint64_t v33 = [v30 carrierBundlingStatusType] - 1;
  uint64_t v34 = [*(id *)(a1 + 48) carrierBundleProvisioningStyle];
  unint64_t v49 = v6;
  if (v34 == 1)
  {
    BOOL v36 = v33 >= 2 && [v30 statusType] != 1;
    if ([v30 carrierBundlingStatusType] == 2)
    {
      BOOL v35 = [v30 statusType] == 0;
      goto LABEL_50;
    }
  }
  else
  {
    if (v34 == 2)
    {
      BOOL v35 = 0;
      BOOL v36 = 1;
      goto LABEL_50;
    }
    BOOL v36 = 0;
  }
  BOOL v35 = 0;
LABEL_50:
  if (*(unsigned char *)(a1 + 99))
  {
    char v37 = [*(id *)(a1 + 40) subscriptionStatus];
    if (v37
      && [*(id *)(a1 + 32) _carrierBundleStatusIsValidForCachedSubscriptionStatus:v37])
    {
      if (v33 >= 2) {
        objc_msgSend(v30, "setCarrierBundlingStatusType:", objc_msgSend(v37, "carrierBundlingStatusType"));
      }
      uint64_t v38 = [v37 cellularOperatorName];
      [v30 setCellularOperatorName:v38];

      unint64_t v39 = [v37 phoneNumber];
      [v30 setPhoneNumber:v39];

      uint64_t v40 = [v37 sessionIdentifier];
      [v30 setSessionIdentifier:v40];
    }
    if (v35) {
      goto LABEL_57;
    }
    goto LABEL_59;
  }
  if (!v35)
  {
LABEL_59:
    unint64_t v6 = v49;
    goto LABEL_60;
  }
LABEL_57:
  char v41 = 1;
  unint64_t v6 = v49;
LABEL_61:
  id v42 = [[ICMusicSubscriptionCarrierBundlingEligibilityOperation alloc] initWithRequestContext:*(void *)(a1 + 64)];
  if ([*(id *)(a1 + 48) reason] == 1) {
    [(ICMusicSubscriptionCarrierBundlingEligibilityOperation *)v42 setDeepLink:1];
  }
  v50[0] = MEMORY[0x1E4F143A8];
  v50[1] = 3221225472;
  v50[2] = __52__ICMusicSubscriptionStatusRequestOperation_execute__block_invoke_2_36;
  v50[3] = &unk_1E5AC8160;
  char v57 = v41;
  id v56 = v28;
  id v51 = v30;
  BOOL v58 = v36;
  char v59 = *(unsigned char *)(a1 + 98);
  id v52 = v26;
  id v43 = *(id *)(a1 + 64);
  uint64_t v44 = *(void *)(a1 + 32);
  id v53 = v43;
  uint64_t v54 = v44;
  id v55 = v27;
  id v45 = v30;
  __int16 v46 = v28;
  [(ICMusicSubscriptionCarrierBundlingEligibilityOperation *)v42 setResponseHandler:v50];
  [*(id *)(a1 + 32) enqueueChildOperation:v42];

LABEL_64:
}

void __52__ICMusicSubscriptionStatusRequestOperation_execute__block_invoke_33(uint64_t a1, void *a2, uint64_t a3)
{
  if (*(void *)(a1 + 48))
  {
    unint64_t v5 = *(void **)(a1 + 32);
    id v6 = a2;
    id v7 = (id)[v5 copy];
    [v7 setSubscriptionStatus:v6];

    [v7 setFinalResponse:a3];
    (*(void (**)(void))(*(void *)(a1 + 48) + 16))();
  }
}

void __52__ICMusicSubscriptionStatusRequestOperation_execute__block_invoke_2_36(uint64_t a1, void *a2, void *a3)
{
  id v19 = a2;
  id v5 = a3;
  if (v19)
  {
    uint64_t v6 = [v19 carrierBundlingStatusType];
    uint64_t v7 = v6;
    if (*(unsigned char *)(a1 + 80) && v6 == 1) {
      (*(void (**)(void))(*(void *)(a1 + 72) + 16))();
    }
    uint64_t v8 = *(void **)(a1 + 32);
    uint64_t v9 = [v19 cellularProviderName];
    [v8 setCellularOperatorName:v9];

    id v10 = *(void **)(a1 + 32);
    unint64_t v11 = [v19 phoneNumber];
    [v10 setPhoneNumber:v11];

    if (v7 == 1)
    {
      if (![*(id *)(a1 + 32) statusType] || objc_msgSend(*(id *)(a1 + 32), "statusType") == 2)
      {
        uint64_t v12 = 2;
LABEL_20:
        [*(id *)(a1 + 32) setCarrierBundlingStatusType:v12];
        goto LABEL_21;
      }
      if ([*(id *)(a1 + 32) carrierBundlingStatusType] == 2)
      {
LABEL_21:
        if ([v19 isFamilySubscription]) {
          [*(id *)(a1 + 32) setReasonType:2];
        }
        uint64_t v13 = [v19 SMSSessionIdentifier];
        if (!v13)
        {
          uint64_t v13 = [v19 headerEnrichmentSessionIdentifier];
        }
        [*(id *)(a1 + 32) setSessionIdentifier:v13];
        if (*(unsigned char *)(a1 + 80) && v7 != 1) {
          (*(void (**)(void))(*(void *)(a1 + 72) + 16))();
        }
        goto LABEL_28;
      }
    }
    uint64_t v15 = [v5 domain];
    if ([v15 isEqualToString:@"ICError"])
    {
      uint64_t v16 = [v5 code];

      if (v16 == -7201)
      {
        uint64_t v12 = 3;
        goto LABEL_20;
      }
    }
    else
    {
    }
    uint64_t v12 = v7;
    goto LABEL_20;
  }
  uint64_t v13 = objc_msgSend(v5, "msv_underlyingError");
  v14 = [v13 domain];
  if ([v14 isEqualToString:@"ICMusicSubscriptionCarrierBundlingServerError"]) {
    objc_msgSend(*(id *)(a1 + 32), "setCarrierBundlingErrorCode:", objc_msgSend(v13, "code"));
  }
  [*(id *)(a1 + 32) setCarrierBundlingStatusType:0];
  if (*(unsigned char *)(a1 + 80)) {
    (*(void (**)(void))(*(void *)(a1 + 72) + 16))();
  }

LABEL_28:
  if (*(unsigned char *)(a1 + 81) && !*(unsigned char *)(a1 + 80)) {
    (*(void (**)(void))(*(void *)(a1 + 72) + 16))();
  }
  if (*(unsigned char *)(a1 + 82))
  {
    BOOL v17 = (void *)[*(id *)(a1 + 40) copy];
    [v17 setSubscriptionStatus:*(void *)(a1 + 32)];
    [v17 setFinalResponse:1];
    uint64_t v18 = +[ICMusicSubscriptionStatusCache sharedCache];
    [v18 setCachedSubscriptionStatusResponse:v17 forRequestContext:*(void *)(a1 + 48) completion:0];
  }
  [*(id *)(a1 + 56) finishWithError:*(void *)(a1 + 64)];
}

@end