@interface VSViewServiceRequestPreparationOperation
- ($115C4C562B26FF47E01F9F4EA65B5887)hostAuditToken;
- (BOOL)isAccountModificationAllowed;
- (BOOL)requestAllowsPrivacyUI;
- (BOOL)requestRequiresPrivacyUI;
- (BOOL)shouldInferFeaturedProviders;
- (BOOL)shouldReturnErrorOnTVProviderFeatureUnsupportedByStorefront;
- (NSArray)applicationAccountProviders;
- (NSArray)featuredIdentityProviderIdentifiers;
- (NSArray)supportedIdentityProviderIdentifiers;
- (NSOperationQueue)privateQueue;
- (NSXPCConnection)privacyServiceConnection;
- (VSAuditToken)auditToken;
- (VSIdentityProviderAvailabilityInfoCenter)availabilityInfoCenter;
- (VSOptional)currentAccount;
- (VSOptional)result;
- (VSViewServiceRequestPreparationOperation)init;
- (id)_privacyServiceWithErrorHandler:(id)a3;
- (int)hostProcessIdentifier;
- (void)_checkAvailability;
- (void)_checkEntitlement;
- (void)_checkPrivacy;
- (void)_checkSupportedProviders;
- (void)_continueCheckPrivacyWithAccessStatus:(unint64_t)a3;
- (void)_determineProviderDisplayNameWithUI:(BOOL)a3;
- (void)_finishWithError:(id)a3;
- (void)_finishWithSupportedProviders:(id)a3;
- (void)_promptForPrivacyWithDisplayNameIfRequired:(id)a3 providerID:(id)a4 providerIsSupported:(BOOL)a5 allowUI:(BOOL)a6;
- (void)cancel;
- (void)dealloc;
- (void)setAccountModificationAllowed:(BOOL)a3;
- (void)setApplicationAccountProviders:(id)a3;
- (void)setAuditToken:(id)a3;
- (void)setAvailabilityInfoCenter:(id)a3;
- (void)setCurrentAccount:(id)a3;
- (void)setFeaturedIdentityProviderIdentifiers:(id)a3;
- (void)setHostAuditToken:(id *)a3;
- (void)setHostProcessIdentifier:(int)a3;
- (void)setPrivacyServiceConnection:(id)a3;
- (void)setPrivateQueue:(id)a3;
- (void)setRequestAllowsPrivacyUI:(BOOL)a3;
- (void)setRequestRequiresPrivacyUI:(BOOL)a3;
- (void)setResult:(id)a3;
- (void)setShouldInferFeaturedProviders:(BOOL)a3;
- (void)setShouldReturnErrorOnTVProviderFeatureUnsupportedByStorefront:(BOOL)a3;
- (void)setSupportedIdentityProviderIdentifiers:(id)a3;
@end

@implementation VSViewServiceRequestPreparationOperation

- (VSViewServiceRequestPreparationOperation)init
{
  v19.receiver = self;
  v19.super_class = (Class)VSViewServiceRequestPreparationOperation;
  v2 = [(VSViewServiceRequestPreparationOperation *)&v19 init];
  if (v2)
  {
    v3 = (NSOperationQueue *)objc_alloc_init(MEMORY[0x263F08A48]);
    privateQueue = v2->_privateQueue;
    v2->_privateQueue = v3;

    [(NSOperationQueue *)v2->_privateQueue setName:@"VSViewServiceRequestPreparationOperation"];
    [(NSOperationQueue *)v2->_privateQueue setMaxConcurrentOperationCount:1];
    supportedIdentityProviderIdentifiers = v2->_supportedIdentityProviderIdentifiers;
    v6 = (NSArray *)MEMORY[0x263EFFA68];
    v2->_supportedIdentityProviderIdentifiers = (NSArray *)MEMORY[0x263EFFA68];

    featuredIdentityProviderIdentifiers = v2->_featuredIdentityProviderIdentifiers;
    v2->_featuredIdentityProviderIdentifiers = v6;

    uint64_t v8 = [objc_alloc(MEMORY[0x263F08D68]) initWithServiceName:@"com.apple.VideoSubscriberAccount.PrivacyService"];
    privacyServiceConnection = v2->_privacyServiceConnection;
    v2->_privacyServiceConnection = (NSXPCConnection *)v8;

    v10 = v2->_privacyServiceConnection;
    v11 = VSPrivacyServiceInterface();
    [(NSXPCConnection *)v10 setRemoteObjectInterface:v11];

    [(NSXPCConnection *)v2->_privacyServiceConnection setInterruptionHandler:&__block_literal_global_4];
    [(NSXPCConnection *)v2->_privacyServiceConnection setInvalidationHandler:&__block_literal_global_8];
    [(NSXPCConnection *)v2->_privacyServiceConnection resume];
    uint64_t v12 = [MEMORY[0x263F1E220] defaultCenter];
    availabilityInfoCenter = v2->_availabilityInfoCenter;
    v2->_availabilityInfoCenter = (VSIdentityProviderAvailabilityInfoCenter *)v12;

    v14 = (VSOptional *)objc_alloc_init(MEMORY[0x263F1E250]);
    v15 = v2->_result;
    v2->_result = v14;

    v16 = (VSOptional *)objc_alloc_init(MEMORY[0x263F1E250]);
    currentAccount = v2->_currentAccount;
    v2->_currentAccount = v16;
  }
  return v2;
}

void __48__VSViewServiceRequestPreparationOperation_init__block_invoke()
{
  v0 = VSErrorLogObject();
  if (os_log_type_enabled(v0, OS_LOG_TYPE_ERROR)) {
    __48__VSViewServiceRequestPreparationOperation_init__block_invoke_cold_1(v0);
  }
}

void __48__VSViewServiceRequestPreparationOperation_init__block_invoke_6()
{
  v0 = VSErrorLogObject();
  if (os_log_type_enabled(v0, OS_LOG_TYPE_ERROR)) {
    __48__VSViewServiceRequestPreparationOperation_init__block_invoke_6_cold_1(v0);
  }
}

- (void)dealloc
{
  [(NSXPCConnection *)self->_privacyServiceConnection invalidate];
  v3.receiver = self;
  v3.super_class = (Class)VSViewServiceRequestPreparationOperation;
  [(VSViewServiceRequestPreparationOperation *)&v3 dealloc];
}

- (id)_privacyServiceWithErrorHandler:(id)a3
{
  id v4 = a3;
  v5 = [(VSViewServiceRequestPreparationOperation *)self privacyServiceConnection];
  v6 = [v5 remoteObjectProxyWithErrorHandler:v4];

  return v6;
}

- (void)_finishWithError:(id)a3
{
  id v4 = a3;
  if (!v4) {
    [MEMORY[0x263EFF940] raise:*MEMORY[0x263EFF4A0] format:@"The error parameter must not be nil."];
  }
  v5 = VSErrorLogObject();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR)) {
    -[VSViewServiceRequestPreparationOperation _finishWithError:]();
  }

  v6 = (void *)MEMORY[0x263F1E250];
  v7 = [MEMORY[0x263F1E208] failableWithError:v4];
  uint64_t v8 = [v6 optionalWithObject:v7];
  [(VSViewServiceRequestPreparationOperation *)self setResult:v8];

  [(VSAsyncOperation *)self finishExecutionIfPossible];
}

- (void)_checkEntitlement
{
  objc_super v3 = VSDefaultLogObject();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_23F9AB000, v3, OS_LOG_TYPE_DEFAULT, "Prep operation will check entitlement", buf, 2u);
  }

  id v4 = (void *)MEMORY[0x263F1E288];
  [(VSViewServiceRequestPreparationOperation *)self hostAuditToken];
  v5 = [v4 securityTaskWithAuditToken:v8];
  int v6 = VSCheckEntitlementForTask();
  id v7 = 0;

  if (v6)
  {
    [(VSViewServiceRequestPreparationOperation *)self _checkPrivacy];
  }
  else
  {
    if (!v7) {
      [MEMORY[0x263EFF940] raise:*MEMORY[0x263EFF4A0] format:@"The entitlementErrorOrNil parameter must not be nil."];
    }
    [(VSViewServiceRequestPreparationOperation *)self _finishWithError:v7];
  }
}

- (void)_checkPrivacy
{
  objc_super v3 = VSDefaultLogObject();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_23F9AB000, v3, OS_LOG_TYPE_DEFAULT, "Prep operation will check privacy", buf, 2u);
  }

  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __57__VSViewServiceRequestPreparationOperation__checkPrivacy__block_invoke;
  v7[3] = &unk_265076EB8;
  v7[4] = self;
  id v4 = [(VSViewServiceRequestPreparationOperation *)self _privacyServiceWithErrorHandler:v7];
  uint64_t v5 = [(VSViewServiceRequestPreparationOperation *)self hostProcessIdentifier];
  v6[0] = MEMORY[0x263EF8330];
  v6[1] = 3221225472;
  v6[2] = __57__VSViewServiceRequestPreparationOperation__checkPrivacy__block_invoke_23;
  v6[3] = &unk_265076F58;
  v6[4] = self;
  [v4 preflightCheckForProcessIdentifier:v5 withCompletionHandler:v6];
}

void __57__VSViewServiceRequestPreparationOperation__checkPrivacy__block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = VSErrorLogObject();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
    __57__VSViewServiceRequestPreparationOperation__checkPrivacy__block_invoke_cold_1();
  }

  uint64_t v5 = VSPrivateError();
  [*(id *)(a1 + 32) _finishWithError:v5];
}

void __57__VSViewServiceRequestPreparationOperation__checkPrivacy__block_invoke_23(uint64_t a1, uint64_t a2)
{
  id v4 = VSDefaultLogObject();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_23F9AB000, v4, OS_LOG_TYPE_DEFAULT, "Prep operation did check privacy", buf, 2u);
  }

  if ([*(id *)(a1 + 32) isAccountModificationAllowed])
  {
    int v5 = [*(id *)(a1 + 32) shouldReturnErrorOnTVProviderFeatureUnsupportedByStorefront];
    int v6 = *(void **)(a1 + 32);
    if (v5)
    {
      id v7 = [v6 availabilityInfoCenter];
      v11[0] = MEMORY[0x263EF8330];
      v11[1] = 3221225472;
      v11[2] = __57__VSViewServiceRequestPreparationOperation__checkPrivacy__block_invoke_24;
      v11[3] = &unk_265076F30;
      v11[4] = *(void *)(a1 + 32);
      v11[5] = a2;
      [v7 determineIdentityProviderAvailabilityWithCompletionHandler:v11];
    }
    else
    {
      [v6 _continueCheckPrivacyWithAccessStatus:a2];
    }
  }
  else if (a2 == 1 {
         && ([*(id *)(a1 + 32) currentAccount],
  }
             uint64_t v8 = objc_claimAutoreleasedReturnValue(),
             [v8 object],
             v9 = objc_claimAutoreleasedReturnValue(),
             v9,
             v8,
             v9))
  {
    [*(id *)(a1 + 32) _checkAvailability];
  }
  else
  {
    v10 = VSPrivateError();
    [*(id *)(a1 + 32) _finishWithError:v10];
  }
}

void __57__VSViewServiceRequestPreparationOperation__checkPrivacy__block_invoke_24(uint64_t a1, char a2, void *a3)
{
  id v5 = a3;
  int v6 = VSDefaultLogObject();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    LOWORD(buf[0]) = 0;
    _os_log_impl(&dword_23F9AB000, v6, OS_LOG_TYPE_DEFAULT, "Prep operation did check availability", (uint8_t *)buf, 2u);
  }

  if (a2)
  {
    id v7 = VSDefaultLogObject();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(buf[0]) = 0;
      _os_log_impl(&dword_23F9AB000, v7, OS_LOG_TYPE_DEFAULT, "TV Provider feature is available in storefront.", (uint8_t *)buf, 2u);
    }

    [*(id *)(a1 + 32) _continueCheckPrivacyWithAccessStatus:*(void *)(a1 + 40)];
  }
  else
  {
    id v8 = objc_alloc_init(MEMORY[0x263F1E1E0]);
    objc_initWeak(buf, v8);
    v11[0] = MEMORY[0x263EF8330];
    v11[1] = 3221225472;
    v11[2] = __57__VSViewServiceRequestPreparationOperation__checkPrivacy__block_invoke_26;
    v11[3] = &unk_265076F08;
    objc_copyWeak(v12, buf);
    v9 = *(void **)(a1 + 40);
    v11[4] = *(void *)(a1 + 32);
    v12[1] = v9;
    [v8 setCompletionBlock:v11];
    v10 = [*(id *)(a1 + 32) privateQueue];
    [v10 addOperation:v8];

    objc_destroyWeak(v12);
    objc_destroyWeak(buf);
  }
}

void __57__VSViewServiceRequestPreparationOperation__checkPrivacy__block_invoke_26(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  id v3 = [WeakRetained result];
  id v4 = [v3 forceUnwrapObject];

  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __57__VSViewServiceRequestPreparationOperation__checkPrivacy__block_invoke_2;
  v7[3] = &unk_265076EE0;
  uint64_t v5 = *(void *)(a1 + 48);
  uint64_t v8 = *(void *)(a1 + 32);
  uint64_t v9 = v5;
  v6[0] = MEMORY[0x263EF8330];
  v6[1] = 3221225472;
  v6[2] = __57__VSViewServiceRequestPreparationOperation__checkPrivacy__block_invoke_28;
  v6[3] = &unk_265076EB8;
  v6[4] = v8;
  [v4 unwrapObject:v7 error:v6];
}

void __57__VSViewServiceRequestPreparationOperation__checkPrivacy__block_invoke_2(uint64_t a1, void *a2)
{
  uint64_t v3 = [a2 count];
  id v4 = VSDefaultLogObject();
  BOOL v5 = os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT);
  if (v3)
  {
    if (v5)
    {
      *(_WORD *)id v7 = 0;
      _os_log_impl(&dword_23F9AB000, v4, OS_LOG_TYPE_DEFAULT, "Developer providers were returned from fetch operation, allow TCC.", v7, 2u);
    }

    [*(id *)(a1 + 32) _continueCheckPrivacyWithAccessStatus:*(void *)(a1 + 40)];
  }
  else
  {
    if (v5)
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_23F9AB000, v4, OS_LOG_TYPE_DEFAULT, "No developer providers returned from fetch operation, finish with VSErrorCodeUnsupported.", buf, 2u);
    }

    int v6 = VSPublicError();
    [*(id *)(a1 + 32) _finishWithError:v6];
  }
}

void __57__VSViewServiceRequestPreparationOperation__checkPrivacy__block_invoke_28(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = VSErrorLogObject();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
    __57__VSViewServiceRequestPreparationOperation__checkPrivacy__block_invoke_28_cold_1();
  }

  BOOL v5 = VSPrivateError();
  [*(id *)(a1 + 32) _finishWithError:v5];
}

- (void)_continueCheckPrivacyWithAccessStatus:(unint64_t)a3
{
  if (a3 == 2)
  {
    VSPrivateError();
    id v7 = (id)objc_claimAutoreleasedReturnValue();
    [(VSViewServiceRequestPreparationOperation *)self _finishWithError:v7];
  }
  else if (a3 == 1)
  {
    [(VSViewServiceRequestPreparationOperation *)self _checkAvailability];
  }
  else
  {
    if (a3) {
      return;
    }
    if ([(VSViewServiceRequestPreparationOperation *)self requestRequiresPrivacyUI])
    {
      id v4 = self;
      uint64_t v5 = 1;
    }
    else
    {
      if ([(VSViewServiceRequestPreparationOperation *)self requestAllowsPrivacyUI])
      {
        int v6 = [(VSViewServiceRequestPreparationOperation *)self currentAccount];
        v9[0] = MEMORY[0x263EF8330];
        v9[1] = 3221225472;
        v9[2] = __82__VSViewServiceRequestPreparationOperation__continueCheckPrivacyWithAccessStatus___block_invoke;
        v9[3] = &unk_265076F80;
        v9[4] = self;
        v8[0] = MEMORY[0x263EF8330];
        v8[1] = 3221225472;
        v8[2] = __82__VSViewServiceRequestPreparationOperation__continueCheckPrivacyWithAccessStatus___block_invoke_2;
        v8[3] = &unk_265076A18;
        v8[4] = self;
        [v6 conditionallyUnwrapObject:v9 otherwise:v8];

        return;
      }
      id v4 = self;
      uint64_t v5 = 0;
    }
    [(VSViewServiceRequestPreparationOperation *)v4 _determineProviderDisplayNameWithUI:v5];
  }
}

uint64_t __82__VSViewServiceRequestPreparationOperation__continueCheckPrivacyWithAccessStatus___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _determineProviderDisplayNameWithUI:1];
}

uint64_t __82__VSViewServiceRequestPreparationOperation__continueCheckPrivacyWithAccessStatus___block_invoke_2(uint64_t a1)
{
  return [*(id *)(a1 + 32) _checkAvailability];
}

- (void)_checkAvailability
{
  id v3 = VSDefaultLogObject();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_23F9AB000, v3, OS_LOG_TYPE_DEFAULT, "Prep operation will check availability", buf, 2u);
  }

  id v4 = [(VSViewServiceRequestPreparationOperation *)self availabilityInfoCenter];
  v5[0] = MEMORY[0x263EF8330];
  v5[1] = 3221225472;
  v5[2] = __62__VSViewServiceRequestPreparationOperation__checkAvailability__block_invoke;
  v5[3] = &unk_265076FA8;
  v5[4] = self;
  [v4 determineIdentityProviderAvailabilityWithCompletionHandler:v5];
}

void __62__VSViewServiceRequestPreparationOperation__checkAvailability__block_invoke(uint64_t a1, int a2, void *a3)
{
  id v5 = a3;
  int v6 = VSDefaultLogObject();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)uint64_t v8 = 0;
    _os_log_impl(&dword_23F9AB000, v6, OS_LOG_TYPE_DEFAULT, "Prep operation did check availability", v8, 2u);
  }

  id v7 = *(void **)(a1 + 32);
  if (a2) {
    [v7 _checkSupportedProviders];
  }
  else {
    [v7 _finishWithError:v5];
  }
}

- (void)_finishWithSupportedProviders:(id)a3
{
  uint64_t v60 = *MEMORY[0x263EF8340];
  id v4 = a3;
  if (![v4 count]) {
    [MEMORY[0x263EFF940] raise:*MEMORY[0x263EFF4A0] format:@"No filtered identity providers provided."];
  }
  id v5 = [v4 valueForKeyPath:@"providerID.object"];
  int v6 = [(VSViewServiceRequestPreparationOperation *)self featuredIdentityProviderIdentifiers];
  id v7 = [MEMORY[0x263F087F0] expressionForKeyPath:@"self"];
  uint64_t v8 = [MEMORY[0x263F087F0] expressionForConstantValue:v5];
  uint64_t v9 = [MEMORY[0x263F08720] predicateWithLeftExpression:v7 rightExpression:v8 modifier:0 type:10 options:0];
  id v10 = [v6 filteredArrayUsingPredicate:v9];

  if ([(VSViewServiceRequestPreparationOperation *)self shouldInferFeaturedProviders]
    && ![v10 count])
  {
    v41 = v9;
    v11 = v10;
    uint64_t v12 = [MEMORY[0x263EFFA08] setWithArray:v5];
    v13 = (void *)MEMORY[0x263EFFA08];
    v14 = [(VSViewServiceRequestPreparationOperation *)self supportedIdentityProviderIdentifiers];
    v15 = [v13 setWithArray:v14];
    int v16 = [v12 isSubsetOfSet:v15];

    if (v16)
    {
      id v10 = v5;
    }
    else
    {
      id v10 = v11;
    }
    uint64_t v9 = v41;
  }
  if ([v10 count])
  {
    v42 = v9;
    v43 = v10;
    v38 = v7;
    v39 = self;
    v40 = v5;
    id v17 = objc_alloc_init(MEMORY[0x263EFF9A0]);
    long long v54 = 0u;
    long long v55 = 0u;
    long long v56 = 0u;
    long long v57 = 0u;
    id v18 = v4;
    uint64_t v19 = [v18 countByEnumeratingWithState:&v54 objects:v59 count:16];
    if (v19)
    {
      uint64_t v20 = v19;
      uint64_t v21 = *(void *)v55;
      do
      {
        for (uint64_t i = 0; i != v20; ++i)
        {
          if (*(void *)v55 != v21) {
            objc_enumerationMutation(v18);
          }
          v23 = *(void **)(*((void *)&v54 + 1) + 8 * i);
          [v23 setRankForSorting:0];
          v24 = [v23 providerID];
          v51[0] = MEMORY[0x263EF8330];
          v51[1] = 3221225472;
          v51[2] = __74__VSViewServiceRequestPreparationOperation__finishWithSupportedProviders___block_invoke;
          v51[3] = &unk_265076D20;
          id v52 = v17;
          v53 = v23;
          [v24 conditionallyUnwrapObject:v51];
        }
        uint64_t v20 = [v18 countByEnumeratingWithState:&v54 objects:v59 count:16];
      }
      while (v20);
    }

    long long v49 = 0u;
    long long v50 = 0u;
    long long v47 = 0u;
    long long v48 = 0u;
    id v25 = v43;
    uint64_t v26 = [v25 countByEnumeratingWithState:&v47 objects:v58 count:16];
    if (v26)
    {
      uint64_t v27 = v26;
      uint64_t v28 = *(void *)v48;
      uint64_t v29 = 1;
      do
      {
        for (uint64_t j = 0; j != v27; ++j)
        {
          if (*(void *)v48 != v28) {
            objc_enumerationMutation(v25);
          }
          v31 = [v17 objectForKey:*(void *)(*((void *)&v47 + 1) + 8 * j)];
          if (v31)
          {
            v32 = [NSNumber numberWithUnsignedInteger:v29];
            [v31 setRankForSorting:v32];

            ++v29;
          }
        }
        uint64_t v27 = [v25 countByEnumeratingWithState:&v47 objects:v58 count:16];
      }
      while (v27);
    }

    id v5 = v40;
    id v7 = v38;
    self = v39;
    id v10 = v43;
    uint64_t v9 = v42;
  }
  v33 = [(VSViewServiceRequestPreparationOperation *)self privateQueue];
  v34 = objc_alloc_init(VSFeaturedIdentityProviderLimitingOperation);
  [(VSFeaturedIdentityProviderLimitingOperation *)v34 setUnlimitedIdentityProviders:v4];
  [v33 addOperation:v34];
  v35 = (void *)MEMORY[0x263F086D0];
  v44[0] = MEMORY[0x263EF8330];
  v44[1] = 3221225472;
  v44[2] = __74__VSViewServiceRequestPreparationOperation__finishWithSupportedProviders___block_invoke_2;
  v44[3] = &unk_265076FD0;
  v45 = v34;
  v46 = self;
  v36 = v34;
  v37 = [v35 blockOperationWithBlock:v44];
  [v37 addDependency:v36];
  [v33 addOperation:v37];
}

uint64_t __74__VSViewServiceRequestPreparationOperation__finishWithSupportedProviders___block_invoke(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 32) setObject:*(void *)(a1 + 40) forKey:a2];
}

void __74__VSViewServiceRequestPreparationOperation__finishWithSupportedProviders___block_invoke_2(uint64_t a1)
{
  v2 = [*(id *)(a1 + 32) result];
  id v7 = [v2 forceUnwrapObject];

  id v3 = *(void **)(a1 + 40);
  id v4 = (void *)MEMORY[0x263F1E250];
  id v5 = [MEMORY[0x263F1E208] failableWithObject:v7];
  int v6 = [v4 optionalWithObject:v5];
  [v3 setResult:v6];

  [*(id *)(a1 + 40) finishExecutionIfPossible];
}

- (void)_checkSupportedProviders
{
  id v3 = VSDefaultLogObject();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_23F9AB000, v3, OS_LOG_TYPE_DEFAULT, "Prep operation will fetch identity providers.", buf, 2u);
  }

  id v4 = objc_alloc_init(VSIdentityProviderFetchAllOperation);
  id v5 = [(VSViewServiceRequestPreparationOperation *)self auditToken];
  [(VSIdentityProviderFetchAllOperation *)v4 setAuditToken:v5];

  int v6 = [(VSViewServiceRequestPreparationOperation *)self applicationAccountProviders];
  [(VSIdentityProviderFetchAllOperation *)v4 setApplicationAccountProviders:v6];

  [(VSAsyncOperation *)v4 start];
  [(VSIdentityProviderFetchAllOperation *)v4 waitUntilFinished];
  id v7 = VSDefaultLogObject();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_23F9AB000, v7, OS_LOG_TYPE_DEFAULT, "Prep operation did fetch identity providers.", buf, 2u);
  }

  uint64_t v8 = [(VSIdentityProviderFetchAllOperation *)v4 result];
  uint64_t v9 = [v8 forceUnwrapObject];

  v11[0] = MEMORY[0x263EF8330];
  v11[1] = 3221225472;
  v11[2] = __68__VSViewServiceRequestPreparationOperation__checkSupportedProviders__block_invoke;
  v11[3] = &unk_265077020;
  v11[4] = self;
  v10[0] = MEMORY[0x263EF8330];
  v10[1] = 3221225472;
  v10[2] = __68__VSViewServiceRequestPreparationOperation__checkSupportedProviders__block_invoke_4;
  v10[3] = &unk_265076EB8;
  v10[4] = self;
  [v9 unwrapObject:v11 error:v10];
}

void __68__VSViewServiceRequestPreparationOperation__checkSupportedProviders__block_invoke(uint64_t a1, void *a2)
{
  uint64_t v29 = *MEMORY[0x263EF8340];
  id v3 = a2;
  id v4 = objc_alloc_init(VSIdentityProviderFilter);
  [(VSIdentityProviderFilter *)v4 setAllIdentityProviders:v3];
  id v5 = objc_alloc_init(MEMORY[0x263EFF980]);
  long long v24 = 0u;
  long long v25 = 0u;
  long long v26 = 0u;
  long long v27 = 0u;
  int v6 = [*(id *)(a1 + 32) applicationAccountProviders];
  uint64_t v7 = [v6 countByEnumeratingWithState:&v24 objects:v28 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v9 = *(void *)v25;
    do
    {
      uint64_t v10 = 0;
      do
      {
        if (*(void *)v25 != v9) {
          objc_enumerationMutation(v6);
        }
        v11 = [*(id *)(*((void *)&v24 + 1) + 8 * v10) identifier];
        [v5 addObject:v11];

        ++v10;
      }
      while (v8 != v10);
      uint64_t v8 = [v6 countByEnumeratingWithState:&v24 objects:v28 count:16];
    }
    while (v8);
  }

  uint64_t v12 = [*(id *)(a1 + 32) supportedIdentityProviderIdentifiers];
  v13 = [v12 arrayByAddingObjectsFromArray:v5];

  [(VSIdentityProviderFilter *)v4 setSupportedAccountProviderIDs:v13];
  v14 = [(VSIdentityProviderFilter *)v4 filteredIdentityProviders];
  if ([v14 count])
  {
    v15 = [*(id *)(a1 + 32) currentAccount];
    v21[0] = MEMORY[0x263EF8330];
    v21[1] = 3221225472;
    v21[2] = __68__VSViewServiceRequestPreparationOperation__checkSupportedProviders__block_invoke_2;
    v21[3] = &unk_265076FF8;
    id v16 = v14;
    uint64_t v17 = *(void *)(a1 + 32);
    id v22 = v16;
    uint64_t v23 = v17;
    v19[0] = MEMORY[0x263EF8330];
    v19[1] = 3221225472;
    v19[2] = __68__VSViewServiceRequestPreparationOperation__checkSupportedProviders__block_invoke_3;
    v19[3] = &unk_265076FD0;
    v19[4] = v17;
    id v20 = v16;
    [v15 conditionallyUnwrapObject:v21 otherwise:v19];

    id v18 = v22;
  }
  else
  {
    id v18 = VSPublicUnsupportedProviderError();
    [*(id *)(a1 + 32) _finishWithError:v18];
  }
}

void __68__VSViewServiceRequestPreparationOperation__checkSupportedProviders__block_invoke_2(uint64_t a1, void *a2)
{
  id v3 = [a2 identityProviderID];
  id v7 = [v3 forceUnwrapObject];

  id v4 = [*(id *)(a1 + 32) valueForKeyPath:@"providerID.object"];
  int v5 = [v4 containsObject:v7];

  if (v5)
  {
    [*(id *)(a1 + 40) _finishWithSupportedProviders:*(void *)(a1 + 32)];
  }
  else
  {
    int v6 = VSPublicUnsupportedProviderError();
    [*(id *)(a1 + 40) _finishWithError:v6];
  }
}

uint64_t __68__VSViewServiceRequestPreparationOperation__checkSupportedProviders__block_invoke_3(uint64_t a1)
{
  return [*(id *)(a1 + 32) _finishWithSupportedProviders:*(void *)(a1 + 40)];
}

uint64_t __68__VSViewServiceRequestPreparationOperation__checkSupportedProviders__block_invoke_4(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 32) _finishWithError:a2];
}

- (void)_determineProviderDisplayNameWithUI:(BOOL)a3
{
  BOOL v3 = a3;
  int v5 = VSDefaultLogObject();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_23F9AB000, v5, OS_LOG_TYPE_DEFAULT, "Prep operation will determine display name", buf, 2u);
  }

  *(void *)buf = 0;
  uint64_t v19 = buf;
  uint64_t v20 = 0x3032000000;
  uint64_t v21 = __Block_byref_object_copy__1;
  id v22 = __Block_byref_object_dispose__1;
  id v23 = 0;
  uint64_t v12 = 0;
  v13 = &v12;
  uint64_t v14 = 0x3032000000;
  v15 = __Block_byref_object_copy__1;
  id v16 = __Block_byref_object_dispose__1;
  id v17 = 0;
  uint64_t v8 = 0;
  uint64_t v9 = &v8;
  uint64_t v10 = 0x2020000000;
  char v11 = 1;
  int v6 = [(VSViewServiceRequestPreparationOperation *)self currentAccount];
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __80__VSViewServiceRequestPreparationOperation__determineProviderDisplayNameWithUI___block_invoke;
  v7[3] = &unk_265077098;
  void v7[4] = buf;
  void v7[5] = &v12;
  v7[6] = &v8;
  [v6 conditionallyUnwrapObject:v7];

  [(VSViewServiceRequestPreparationOperation *)self _promptForPrivacyWithDisplayNameIfRequired:*((void *)v19 + 5) providerID:v13[5] providerIsSupported:*((unsigned __int8 *)v9 + 24) allowUI:v3];
  _Block_object_dispose(&v8, 8);
  _Block_object_dispose(&v12, 8);

  _Block_object_dispose(buf, 8);
}

void __80__VSViewServiceRequestPreparationOperation__determineProviderDisplayNameWithUI___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = VSDefaultLogObject();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_23F9AB000, v4, OS_LOG_TYPE_DEFAULT, "Prep operation will fetch identity providers.", buf, 2u);
  }

  int v5 = [VSIdentityProviderFetchOperation alloc];
  int v6 = [v3 identityProviderID];
  id v7 = [v6 forceUnwrapObject];
  uint64_t v8 = [(VSIdentityProviderFetchOperation *)v5 initWithIdentityProviderID:v7];

  [(VSAsyncOperation *)v8 start];
  [(VSIdentityProviderFetchOperation *)v8 waitUntilFinished];
  uint64_t v9 = VSDefaultLogObject();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_23F9AB000, v9, OS_LOG_TYPE_DEFAULT, "Prep operation did fetch identity providers.", buf, 2u);
  }

  uint64_t v10 = [(VSIdentityProviderFetchOperation *)v8 result];
  char v11 = [v10 forceUnwrapObject];

  v16[0] = MEMORY[0x263EF8330];
  v16[1] = 3221225472;
  v16[2] = __80__VSViewServiceRequestPreparationOperation__determineProviderDisplayNameWithUI___block_invoke_53;
  v16[3] = &unk_265077048;
  long long v17 = *(_OWORD *)(a1 + 32);
  uint64_t v18 = *(void *)(a1 + 48);
  v13[0] = MEMORY[0x263EF8330];
  v13[1] = 3221225472;
  v13[2] = __80__VSViewServiceRequestPreparationOperation__determineProviderDisplayNameWithUI___block_invoke_2;
  v13[3] = &unk_265077070;
  uint64_t v15 = v17;
  id v14 = v3;
  id v12 = v3;
  [v11 unwrapObject:v16 error:v13];
}

void __80__VSViewServiceRequestPreparationOperation__determineProviderDisplayNameWithUI___block_invoke_53(void *a1, void *a2)
{
  id v3 = a2;
  id v4 = [v3 displayName];
  uint64_t v5 = [v4 forceUnwrapObject];
  uint64_t v6 = *(void *)(a1[4] + 8);
  id v7 = *(void **)(v6 + 40);
  *(void *)(v6 + 40) = v5;

  uint64_t v8 = [v3 providerID];
  uint64_t v9 = [v8 forceUnwrapObject];
  uint64_t v10 = *(void *)(a1[5] + 8);
  char v11 = *(void **)(v10 + 40);
  *(void *)(v10 + 40) = v9;

  LOBYTE(v8) = [v3 isFullySupportedForRequestsExpectingAuthenticationSchemes:0];
  *(unsigned char *)(*(void *)(a1[6] + 8) + 24) = (_BYTE)v8;
}

void __80__VSViewServiceRequestPreparationOperation__determineProviderDisplayNameWithUI___block_invoke_2(uint64_t a1)
{
  id v5 = [*(id *)(a1 + 32) optionalIdentityProviderDisplayName];
  uint64_t v2 = [v5 forceUnwrapObject];
  uint64_t v3 = *(void *)(*(void *)(a1 + 40) + 8);
  id v4 = *(void **)(v3 + 40);
  *(void *)(v3 + 40) = v2;
}

- (void)_promptForPrivacyWithDisplayNameIfRequired:(id)a3 providerID:(id)a4 providerIsSupported:(BOOL)a5 allowUI:(BOOL)a6
{
  BOOL v6 = a6;
  BOOL v7 = a5;
  uint64_t v21 = *MEMORY[0x263EF8340];
  id v10 = a4;
  id v11 = a3;
  id v12 = VSDefaultLogObject();
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 67109120;
    BOOL v20 = v6;
    _os_log_impl(&dword_23F9AB000, v12, OS_LOG_TYPE_DEFAULT, "Prep operation will request privacy access with UI allowed %d", buf, 8u);
  }

  v18[0] = MEMORY[0x263EF8330];
  v18[1] = 3221225472;
  v18[2] = __126__VSViewServiceRequestPreparationOperation__promptForPrivacyWithDisplayNameIfRequired_providerID_providerIsSupported_allowUI___block_invoke;
  v18[3] = &unk_265076EB8;
  v18[4] = self;
  v13 = [(VSViewServiceRequestPreparationOperation *)self _privacyServiceWithErrorHandler:v18];
  [(VSViewServiceRequestPreparationOperation *)self hostAuditToken];
  uint64_t v14 = [(VSViewServiceRequestPreparationOperation *)self hostProcessIdentifier];
  v15[0] = MEMORY[0x263EF8330];
  v15[1] = 3221225472;
  v15[2] = __126__VSViewServiceRequestPreparationOperation__promptForPrivacyWithDisplayNameIfRequired_providerID_providerIsSupported_allowUI___block_invoke_55;
  v15[3] = &unk_2650770C0;
  BOOL v16 = v6;
  v15[4] = self;
  [v13 requestAccessForAuditToken:v17 processIdentifier:v14 identityProviderDisplayName:v11 providerIsSupported:v7 identityProviderID:v10 allowUI:v6 completionHandler:v15];
}

void __126__VSViewServiceRequestPreparationOperation__promptForPrivacyWithDisplayNameIfRequired_providerID_providerIsSupported_allowUI___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = VSErrorLogObject();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
    __126__VSViewServiceRequestPreparationOperation__promptForPrivacyWithDisplayNameIfRequired_providerID_providerIsSupported_allowUI___block_invoke_cold_1();
  }

  id v5 = VSPrivateError();
  [*(id *)(a1 + 32) _finishWithError:v5];
}

void __126__VSViewServiceRequestPreparationOperation__promptForPrivacyWithDisplayNameIfRequired_providerID_providerIsSupported_allowUI___block_invoke_55(uint64_t a1, uint64_t a2, void *a3)
{
  uint64_t v11 = *MEMORY[0x263EF8340];
  id v5 = a3;
  BOOL v6 = VSDefaultLogObject();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    int v7 = *(unsigned __int8 *)(a1 + 40);
    v10[0] = 67109120;
    v10[1] = v7;
    _os_log_impl(&dword_23F9AB000, v6, OS_LOG_TYPE_DEFAULT, "Prep operation did request privacy access with UI allowed %d", (uint8_t *)v10, 8u);
  }

  switch(a2)
  {
    case 2:
      goto LABEL_6;
    case 1:
      [*(id *)(a1 + 32) _checkAvailability];
      break;
    case 0:
LABEL_6:
      uint64_t v8 = *(void **)(a1 + 32);
      uint64_t v9 = [v5 forceUnwrapObject];
      [v8 _finishWithError:v9];

      break;
  }
}

- (void)cancel
{
  v2.receiver = self;
  v2.super_class = (Class)VSViewServiceRequestPreparationOperation;
  [(VSAsyncOperation *)&v2 cancel];
}

- ($115C4C562B26FF47E01F9F4EA65B5887)hostAuditToken
{
  long long v3 = *(_OWORD *)&self[11].var0[2];
  *(_OWORD *)retstr->var0 = *(_OWORD *)&self[10].var0[6];
  *(_OWORD *)&retstr->var0[4] = v3;
  return self;
}

- (void)setHostAuditToken:(id *)a3
{
  long long v3 = *(_OWORD *)&a3->var0[4];
  *(_OWORD *)self->_hostAuditToken.val = *(_OWORD *)a3->var0;
  *(_OWORD *)&self->_hostAuditToken.val[4] = v3;
}

- (int)hostProcessIdentifier
{
  return self->_hostProcessIdentifier;
}

- (void)setHostProcessIdentifier:(int)a3
{
  self->_hostProcessIdentifier = a3;
}

- (VSAuditToken)auditToken
{
  return self->_auditToken;
}

- (void)setAuditToken:(id)a3
{
}

- (BOOL)requestAllowsPrivacyUI
{
  return self->_requestAllowsPrivacyUI;
}

- (void)setRequestAllowsPrivacyUI:(BOOL)a3
{
  self->_requestAllowsPrivacyUI = a3;
}

- (BOOL)requestRequiresPrivacyUI
{
  return self->_requestRequiresPrivacyUI;
}

- (void)setRequestRequiresPrivacyUI:(BOOL)a3
{
  self->_requestRequiresPrivacyUI = a3;
}

- (NSArray)supportedIdentityProviderIdentifiers
{
  return self->_supportedIdentityProviderIdentifiers;
}

- (void)setSupportedIdentityProviderIdentifiers:(id)a3
{
}

- (NSArray)featuredIdentityProviderIdentifiers
{
  return self->_featuredIdentityProviderIdentifiers;
}

- (void)setFeaturedIdentityProviderIdentifiers:(id)a3
{
}

- (NSArray)applicationAccountProviders
{
  return self->_applicationAccountProviders;
}

- (void)setApplicationAccountProviders:(id)a3
{
}

- (BOOL)shouldInferFeaturedProviders
{
  return self->_shouldInferFeaturedProviders;
}

- (void)setShouldInferFeaturedProviders:(BOOL)a3
{
  self->_shouldInferFeaturedProviders = a3;
}

- (BOOL)shouldReturnErrorOnTVProviderFeatureUnsupportedByStorefront
{
  return self->_shouldReturnErrorOnTVProviderFeatureUnsupportedByStorefront;
}

- (void)setShouldReturnErrorOnTVProviderFeatureUnsupportedByStorefront:(BOOL)a3
{
  self->_shouldReturnErrorOnTVProviderFeatureUnsupportedByStorefront = a3;
}

- (BOOL)isAccountModificationAllowed
{
  return self->_accountModificationAllowed;
}

- (void)setAccountModificationAllowed:(BOOL)a3
{
  self->_accountModificationAllowed = a3;
}

- (VSOptional)currentAccount
{
  return self->_currentAccount;
}

- (void)setCurrentAccount:(id)a3
{
}

- (VSOptional)result
{
  return self->_result;
}

- (void)setResult:(id)a3
{
}

- (NSOperationQueue)privateQueue
{
  return self->_privateQueue;
}

- (void)setPrivateQueue:(id)a3
{
}

- (NSXPCConnection)privacyServiceConnection
{
  return self->_privacyServiceConnection;
}

- (void)setPrivacyServiceConnection:(id)a3
{
}

- (VSIdentityProviderAvailabilityInfoCenter)availabilityInfoCenter
{
  return self->_availabilityInfoCenter;
}

- (void)setAvailabilityInfoCenter:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_availabilityInfoCenter, 0);
  objc_storeStrong((id *)&self->_privacyServiceConnection, 0);
  objc_storeStrong((id *)&self->_privateQueue, 0);
  objc_storeStrong((id *)&self->_result, 0);
  objc_storeStrong((id *)&self->_currentAccount, 0);
  objc_storeStrong((id *)&self->_applicationAccountProviders, 0);
  objc_storeStrong((id *)&self->_featuredIdentityProviderIdentifiers, 0);
  objc_storeStrong((id *)&self->_supportedIdentityProviderIdentifiers, 0);
  objc_storeStrong((id *)&self->_auditToken, 0);
}

void __48__VSViewServiceRequestPreparationOperation_init__block_invoke_cold_1(os_log_t log)
{
  *(_WORD *)v1 = 0;
  _os_log_error_impl(&dword_23F9AB000, log, OS_LOG_TYPE_ERROR, "Privacy service connection interrupted.", v1, 2u);
}

void __48__VSViewServiceRequestPreparationOperation_init__block_invoke_6_cold_1(os_log_t log)
{
  *(_WORD *)v1 = 0;
  _os_log_error_impl(&dword_23F9AB000, log, OS_LOG_TYPE_ERROR, "Privacy service connection invalidated.", v1, 2u);
}

- (void)_finishWithError:.cold.1()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_23F9AB000, v0, v1, "Prep operation will finish with error: %@", v2, v3, v4, v5, v6);
}

void __57__VSViewServiceRequestPreparationOperation__checkPrivacy__block_invoke_cold_1()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_23F9AB000, v0, v1, "Service error during preflight check: %@", v2, v3, v4, v5, v6);
}

void __57__VSViewServiceRequestPreparationOperation__checkPrivacy__block_invoke_28_cold_1()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_23F9AB000, v0, v1, "VSDeveloperIdentityProviderFetchAllOperation failed with error: %@", v2, v3, v4, v5, v6);
}

void __126__VSViewServiceRequestPreparationOperation__promptForPrivacyWithDisplayNameIfRequired_providerID_providerIsSupported_allowUI___block_invoke_cold_1()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_23F9AB000, v0, v1, "Service error while prompting: %@", v2, v3, v4, v5, v6);
}

@end