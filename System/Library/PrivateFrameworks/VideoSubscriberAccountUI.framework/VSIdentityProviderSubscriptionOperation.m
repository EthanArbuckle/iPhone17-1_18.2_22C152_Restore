@interface VSIdentityProviderSubscriptionOperation
- (NSArray)subscriptionsToAdd;
- (NSArray)subscriptionsToRemoveByBundleID;
- (NSOperationQueue)privateQueue;
- (VSDeveloperSettingsFetchOperation)developerSettingsFetchOperation;
- (VSIdentityProvider)identityProvider;
- (VSIdentityProviderSubscriptionOperation)init;
- (VSIdentityProviderSubscriptionOperation)initWithRegistrationCenter:(id)a3 andDeveloperSettingsFetchOperation:(id)a4;
- (VSSubscriptionRegistrationCenter)registrationCenter;
- (id)_authorizedBundleIdsFromAppDescriptions:(id)a3;
- (void)_registerSubscriptions:(id)a3 withAuthorizedBundleIdentifiers:(id)a4;
- (void)_removeSubscriptionsForBundleIdentifiers:(id)a3 withAuthorizedBundleIdentifiers:(id)a4;
- (void)cancel;
- (void)executionDidBegin;
- (void)setDeveloperSettingsFetchOperation:(id)a3;
- (void)setIdentityProvider:(id)a3;
- (void)setPrivateQueue:(id)a3;
- (void)setRegistrationCenter:(id)a3;
- (void)setSubscriptionsToAdd:(id)a3;
- (void)setSubscriptionsToRemoveByBundleID:(id)a3;
@end

@implementation VSIdentityProviderSubscriptionOperation

- (VSIdentityProviderSubscriptionOperation)init
{
  v10.receiver = self;
  v10.super_class = (Class)VSIdentityProviderSubscriptionOperation;
  v2 = [(VSIdentityProviderSubscriptionOperation *)&v10 init];
  if (v2)
  {
    v3 = (NSOperationQueue *)objc_alloc_init(MEMORY[0x263F08A48]);
    privateQueue = v2->_privateQueue;
    v2->_privateQueue = v3;

    [(NSOperationQueue *)v2->_privateQueue setName:@"VSBulkSubscriptionOperation"];
    [(NSOperationQueue *)v2->_privateQueue setMaxConcurrentOperationCount:1];
    uint64_t v5 = [MEMORY[0x263F1E2B0] defaultSubscriptionRegistrationCenter];
    registrationCenter = v2->_registrationCenter;
    v2->_registrationCenter = (VSSubscriptionRegistrationCenter *)v5;

    v7 = (VSDeveloperSettingsFetchOperation *)objc_alloc_init(MEMORY[0x263F1E1E8]);
    developerSettingsFetchOperation = v2->_developerSettingsFetchOperation;
    v2->_developerSettingsFetchOperation = v7;
  }
  return v2;
}

- (VSIdentityProviderSubscriptionOperation)initWithRegistrationCenter:(id)a3 andDeveloperSettingsFetchOperation:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v9 = [(VSIdentityProviderSubscriptionOperation *)self init];
  objc_super v10 = v9;
  if (v9)
  {
    if (v7) {
      objc_storeStrong((id *)&v9->_registrationCenter, a3);
    }
    if (v8) {
      objc_storeStrong((id *)&v10->_developerSettingsFetchOperation, a4);
    }
  }

  return v10;
}

- (void)executionDidBegin
{
  v3 = [(VSIdentityProviderSubscriptionOperation *)self privateQueue];
  v4 = [(VSIdentityProviderSubscriptionOperation *)self identityProvider];
  uint64_t v5 = [(VSIdentityProviderSubscriptionOperation *)self subscriptionsToAdd];
  v6 = [(VSIdentityProviderSubscriptionOperation *)self subscriptionsToRemoveByBundleID];
  int v7 = [v4 isDeveloper];
  id v8 = [v4 nonChannelAppDescriptions];
  if ([v8 count]) {
    int v9 = 1;
  }
  else {
    int v9 = v7;
  }

  v37[0] = 0;
  v37[1] = v37;
  v37[2] = 0x2020000000;
  char v38 = 0;
  v35[0] = 0;
  v35[1] = v35;
  v35[2] = 0x3032000000;
  v35[3] = __Block_byref_object_copy_;
  v35[4] = __Block_byref_object_dispose_;
  id v36 = 0;
  v33[0] = 0;
  v33[1] = v33;
  v33[2] = 0x3032000000;
  v33[3] = __Block_byref_object_copy_;
  v33[4] = __Block_byref_object_dispose_;
  id v34 = objc_alloc_init(MEMORY[0x263EFFA08]);
  v31[0] = 0;
  v31[1] = v31;
  v31[2] = 0x3032000000;
  v31[3] = __Block_byref_object_copy_;
  v31[4] = __Block_byref_object_dispose_;
  uint64_t v10 = [v4 nonChannelAppDescriptions];
  v11 = (void *)v10;
  v12 = (void *)MEMORY[0x263EFFA68];
  if (v10) {
    v12 = (void *)v10;
  }
  id v32 = v12;

  if (v9 && ([v5 count] || objc_msgSend(v6, "count")))
  {
    objc_initWeak(&location, self);
    v13 = (void *)MEMORY[0x263F086D0];
    v20[0] = MEMORY[0x263EF8330];
    v20[1] = 3221225472;
    v20[2] = __60__VSIdentityProviderSubscriptionOperation_executionDidBegin__block_invoke;
    v20[3] = &unk_265076B70;
    objc_copyWeak(&v28, &location);
    char v29 = v7;
    v24 = v37;
    v25 = v35;
    v26 = v33;
    v27 = v31;
    id v21 = v6;
    id v22 = v5;
    v23 = self;
    v14 = [v13 blockOperationWithBlock:v20];
    v15 = [(VSIdentityProviderSubscriptionOperation *)self developerSettingsFetchOperation];
    v18[0] = 0;
    v18[1] = v18;
    v18[2] = 0x3042000000;
    v18[3] = __Block_byref_object_copy__13;
    v18[4] = __Block_byref_object_dispose__14;
    objc_initWeak(&v19, v15);
    v17[0] = MEMORY[0x263EF8330];
    v17[1] = 3221225472;
    v17[2] = __60__VSIdentityProviderSubscriptionOperation_executionDidBegin__block_invoke_15;
    v17[3] = &unk_265076BE0;
    v17[4] = v18;
    v17[5] = v37;
    v17[6] = v35;
    v16 = [MEMORY[0x263F086D0] blockOperationWithBlock:v17];
    [v16 addDependency:v15];
    [v14 addDependency:v16];
    [v3 addOperation:v15];
    [v3 addOperation:v16];
    [v3 addOperation:v14];
    [v14 waitUntilFinished];

    _Block_object_dispose(v18, 8);
    objc_destroyWeak(&v19);

    objc_destroyWeak(&v28);
    objc_destroyWeak(&location);
  }
  else
  {
    [(VSAsyncOperation *)self finishExecutionIfPossible];
  }
  _Block_object_dispose(v31, 8);

  _Block_object_dispose(v33, 8);
  _Block_object_dispose(v35, 8);

  _Block_object_dispose(v37, 8);
}

void __60__VSIdentityProviderSubscriptionOperation_executionDidBegin__block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 88));
  if (!WeakRetained) {
    goto LABEL_23;
  }
  if (*(unsigned char *)(a1 + 96))
  {
    if (!*(unsigned char *)(*(void *)(*(void *)(a1 + 56) + 8) + 24)
      || !*(void *)(*(void *)(*(void *)(a1 + 64) + 8) + 40))
    {
      id v8 = VSDefaultLogObject();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)v14 = 0;
        _os_log_impl(&dword_23F9AB000, v8, OS_LOG_TYPE_DEFAULT, "Will allow any subscription bundle IDs for developer provider not in Set Top Box Mode or without a bundle identifier.", v14, 2u);
      }

      uint64_t v9 = *(void *)(*(void *)(a1 + 72) + 8);
      int v7 = *(void **)(v9 + 40);
      *(void *)(v9 + 40) = 0;
      goto LABEL_15;
    }
    v3 = VSDefaultLogObject();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_23F9AB000, v3, OS_LOG_TYPE_DEFAULT, "Will write subscriptions for developer provider in Set Top Box Mode and with a bundle identifier.", buf, 2u);
    }

    uint64_t v4 = [MEMORY[0x263EFFA08] setWithObject:*(void *)(*(void *)(*(void *)(a1 + 64) + 8) + 40)];
  }
  else
  {
    uint64_t v5 = VSDefaultLogObject();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v12 = 0;
      _os_log_impl(&dword_23F9AB000, v5, OS_LOG_TYPE_DEFAULT, "Will configure app as non channel purple software.", v12, 2u);
    }

    uint64_t v4 = [WeakRetained _authorizedBundleIdsFromAppDescriptions:*(void *)(*(void *)(*(void *)(a1 + 80) + 8) + 40)];
  }
  uint64_t v6 = *(void *)(*(void *)(a1 + 72) + 8);
  int v7 = *(void **)(v6 + 40);
  *(void *)(v6 + 40) = v4;
LABEL_15:

  if ([*(id *)(a1 + 32) count])
  {
    uint64_t v10 = *(void *)(a1 + 32);
    if (!v10)
    {
      [MEMORY[0x263EFF940] raise:*MEMORY[0x263EFF4A0] format:@"The clearSubscriptionBundleIdsOrNil parameter must not be nil."];
      uint64_t v10 = *(void *)(a1 + 32);
    }
    [WeakRetained _removeSubscriptionsForBundleIdentifiers:v10 withAuthorizedBundleIdentifiers:*(void *)(*(void *)(*(void *)(a1 + 72) + 8) + 40)];
  }
  if ([*(id *)(a1 + 40) count])
  {
    uint64_t v11 = *(void *)(a1 + 40);
    if (!v11)
    {
      [MEMORY[0x263EFF940] raise:*MEMORY[0x263EFF4A0] format:@"The newSubscriptionsOrNil parameter must not be nil."];
      uint64_t v11 = *(void *)(a1 + 40);
    }
    [WeakRetained _registerSubscriptions:v11 withAuthorizedBundleIdentifiers:*(void *)(*(void *)(*(void *)(a1 + 72) + 8) + 40)];
  }
LABEL_23:
  [*(id *)(a1 + 48) finishExecutionIfPossible];
}

void __60__VSIdentityProviderSubscriptionOperation_executionDidBegin__block_invoke_15(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(*(void *)(*(void *)(a1 + 32) + 8) + 40));
  v3 = [WeakRetained result];
  uint64_t v4 = [v3 forceUnwrapObject];

  v5[0] = MEMORY[0x263EF8330];
  v5[1] = 3221225472;
  v5[2] = __60__VSIdentityProviderSubscriptionOperation_executionDidBegin__block_invoke_2;
  v5[3] = &unk_265076B98;
  long long v6 = *(_OWORD *)(a1 + 40);
  [v4 unwrapObject:v5 error:&__block_literal_global_0];
}

void __60__VSIdentityProviderSubscriptionOperation_executionDidBegin__block_invoke_2(uint64_t a1, void *a2)
{
  id v8 = a2;
  *(unsigned char *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = [v8 isInSetTopBoxMode];
  v3 = [v8 setTopBoxBundleIdentifier];
  uint64_t v4 = [v3 length];

  if (v4)
  {
    uint64_t v5 = [v8 setTopBoxBundleIdentifier];
    uint64_t v6 = *(void *)(*(void *)(a1 + 40) + 8);
    int v7 = *(void **)(v6 + 40);
    *(void *)(v6 + 40) = v5;
  }
}

void __60__VSIdentityProviderSubscriptionOperation_executionDidBegin__block_invoke_3(uint64_t a1, void *a2)
{
  id v2 = a2;
  v3 = VSErrorLogObject();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR)) {
    __60__VSIdentityProviderSubscriptionOperation_executionDidBegin__block_invoke_3_cold_1((uint64_t)v2, v3);
  }
}

- (id)_authorizedBundleIdsFromAppDescriptions:(id)a3
{
  uint64_t v17 = *MEMORY[0x263EF8340];
  id v3 = a3;
  id v4 = objc_alloc_init(MEMORY[0x263EFF9C0]);
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  id v5 = v3;
  uint64_t v6 = [v5 countByEnumeratingWithState:&v12 objects:v16 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v13;
    do
    {
      for (uint64_t i = 0; i != v7; ++i)
      {
        if (*(void *)v13 != v8) {
          objc_enumerationMutation(v5);
        }
        uint64_t v10 = objc_msgSend(*(id *)(*((void *)&v12 + 1) + 8 * i), "bundleID", (void)v12);
        if (v10) {
          [v4 addObject:v10];
        }
      }
      uint64_t v7 = [v5 countByEnumeratingWithState:&v12 objects:v16 count:16];
    }
    while (v7);
  }

  return v4;
}

- (void)_removeSubscriptionsForBundleIdentifiers:(id)a3 withAuthorizedBundleIdentifiers:(id)a4
{
  v25[1] = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v7 = a4;
  uint64_t v8 = [(VSIdentityProviderSubscriptionOperation *)self registrationCenter];
  id v9 = objc_alloc_init(MEMORY[0x263F1E290]);
  uint64_t v24 = *MEMORY[0x263F1E480];
  v25[0] = MEMORY[0x263EFFA80];
  uint64_t v10 = [NSDictionary dictionaryWithObjects:v25 forKeys:&v24 count:1];
  uint64_t v15 = MEMORY[0x263EF8330];
  uint64_t v16 = 3221225472;
  uint64_t v17 = __116__VSIdentityProviderSubscriptionOperation__removeSubscriptionsForBundleIdentifiers_withAuthorizedBundleIdentifiers___block_invoke;
  v18 = &unk_265076C08;
  id v19 = v6;
  id v20 = v7;
  id v21 = self;
  id v22 = v8;
  id v23 = v9;
  id v11 = v9;
  id v12 = v8;
  id v13 = v7;
  id v14 = v6;
  [v12 fetchActiveSubscriptionsWithOptions:v10 completionHandler:&v15];
  objc_msgSend(v11, "wait", v15, v16, v17, v18);
}

void __116__VSIdentityProviderSubscriptionOperation__removeSubscriptionsForBundleIdentifiers_withAuthorizedBundleIdentifiers___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v48 = *MEMORY[0x263EF8340];
  id v3 = a2;
  id v4 = objc_alloc_init(MEMORY[0x263EFF980]);
  long long v38 = 0u;
  long long v39 = 0u;
  long long v40 = 0u;
  long long v41 = 0u;
  obuint64_t j = v3;
  uint64_t v5 = [obj countByEnumeratingWithState:&v38 objects:v47 count:16];
  if (v5)
  {
    uint64_t v7 = v5;
    uint64_t v8 = *(void *)v39;
    *(void *)&long long v6 = 138412546;
    long long v29 = v6;
    do
    {
      for (uint64_t i = 0; i != v7; ++i)
      {
        if (*(void *)v39 != v8) {
          objc_enumerationMutation(obj);
        }
        uint64_t v10 = *(void **)(*((void *)&v38 + 1) + 8 * i);
        id v11 = objc_msgSend(v10, "source", v29);
        id v12 = [v11 identifier];

        id v13 = VSDefaultLogObject();
        if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 138412290;
          uint64_t v44 = (uint64_t)v12;
          _os_log_impl(&dword_23F9AB000, v13, OS_LOG_TYPE_DEFAULT, "will check if subscription for bundle ID %@ exists and is authorized for removal", buf, 0xCu);
        }

        if ([*(id *)(a1 + 32) containsObject:v12])
        {
          id v14 = *(void **)(a1 + 40);
          if (v14 && ![v14 containsObject:v12])
          {
            uint64_t v15 = VSErrorLogObject();
            if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
            {
              v31 = [*(id *)(a1 + 48) identityProvider];
              uint64_t v16 = [v31 providerID];
              v30 = [v16 forceUnwrapObject];
              *(_DWORD *)buf = v29;
              uint64_t v44 = (uint64_t)v12;
              __int16 v45 = 2112;
              v46 = v30;
              _os_log_error_impl(&dword_23F9AB000, v15, OS_LOG_TYPE_ERROR, "denying subscription removal for subscription for bundle ID %@ from identity provider %@", buf, 0x16u);
            }
          }
          else
          {
            [v4 addObject:v10];
          }
        }
      }
      uint64_t v7 = [obj countByEnumeratingWithState:&v38 objects:v47 count:16];
    }
    while (v7);
  }

  if ([v4 count])
  {
    uint64_t v17 = VSDefaultLogObject();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v18 = [v4 count];
      *(_DWORD *)buf = 134217984;
      uint64_t v44 = v18;
      _os_log_impl(&dword_23F9AB000, v17, OS_LOG_TYPE_DEFAULT, "will remove %lu subscriptions due to idenity provider clear request.", buf, 0xCu);
    }

    long long v36 = 0u;
    long long v37 = 0u;
    long long v34 = 0u;
    long long v35 = 0u;
    id v32 = v4;
    id v19 = v4;
    uint64_t v20 = [v19 countByEnumeratingWithState:&v34 objects:v42 count:16];
    if (v20)
    {
      uint64_t v21 = v20;
      uint64_t v22 = *(void *)v35;
      uint64_t v23 = *MEMORY[0x263F1E448];
      do
      {
        for (uint64_t j = 0; j != v21; ++j)
        {
          if (*(void *)v35 != v22) {
            objc_enumerationMutation(v19);
          }
          v25 = *(void **)(*((void *)&v34 + 1) + 8 * j);
          v26 = [*(id *)(a1 + 48) identityProvider];
          v27 = [v26 providerID];
          id v28 = [v27 forceUnwrapObject];
          [v25 setModifierIdentifier:v28];

          [v25 setModifierType:v23];
        }
        uint64_t v21 = [v19 countByEnumeratingWithState:&v34 objects:v42 count:16];
      }
      while (v21);
    }

    [*(id *)(a1 + 56) removeSubscriptions:v19];
    id v4 = v32;
  }
  [*(id *)(a1 + 64) signal];
}

- (void)_registerSubscriptions:(id)a3 withAuthorizedBundleIdentifiers:(id)a4
{
  uint64_t v40 = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v7 = a4;
  uint64_t v8 = self;
  v30 = [(VSIdentityProviderSubscriptionOperation *)self registrationCenter];
  long long v31 = 0u;
  long long v32 = 0u;
  long long v33 = 0u;
  long long v34 = 0u;
  obuint64_t j = v6;
  uint64_t v9 = [obj countByEnumeratingWithState:&v31 objects:v39 count:16];
  if (v9)
  {
    uint64_t v11 = v9;
    uint64_t v12 = *(void *)v32;
    uint64_t v13 = *MEMORY[0x263F1E448];
    *(void *)&long long v10 = 138412546;
    long long v26 = v10;
    do
    {
      uint64_t v14 = 0;
      do
      {
        if (*(void *)v32 != v12) {
          objc_enumerationMutation(obj);
        }
        uint64_t v15 = *(void **)(*((void *)&v31 + 1) + 8 * v14);
        if (v7
          && ([*(id *)(*((void *)&v31 + 1) + 8 * v14) source],
              uint64_t v16 = objc_claimAutoreleasedReturnValue(),
              [v16 identifier],
              uint64_t v17 = objc_claimAutoreleasedReturnValue(),
              int v18 = [v7 containsObject:v17],
              v17,
              v16,
              !v18))
        {
          uint64_t v22 = VSErrorLogObject();
          if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR))
          {
            id v28 = [v15 source];
            uint64_t v23 = [v28 identifier];
            v27 = [(VSIdentityProviderSubscriptionOperation *)v8 identityProvider];
            uint64_t v24 = [v27 providerID];
            v25 = [v24 forceUnwrapObject];
            *(_DWORD *)buf = v26;
            long long v36 = v23;
            __int16 v37 = 2112;
            long long v38 = v25;
            _os_log_error_impl(&dword_23F9AB000, v22, OS_LOG_TYPE_ERROR, "denying subscription registration for subscription for bundle ID %@ from identity provider %@", buf, 0x16u);
          }
        }
        else
        {
          id v19 = [(VSIdentityProviderSubscriptionOperation *)v8 identityProvider];
          uint64_t v20 = [v19 providerID];
          uint64_t v21 = [v20 forceUnwrapObject];
          [v15 setModifierIdentifier:v21];

          [v15 setModifierType:v13];
          [v30 registerSubscription:v15];
        }
        ++v14;
      }
      while (v11 != v14);
      uint64_t v11 = [obj countByEnumeratingWithState:&v31 objects:v39 count:16];
    }
    while (v11);
  }
}

- (void)cancel
{
  v4.receiver = self;
  v4.super_class = (Class)VSIdentityProviderSubscriptionOperation;
  [(VSAsyncOperation *)&v4 cancel];
  id v3 = [(VSIdentityProviderSubscriptionOperation *)self privateQueue];
  [v3 cancelAllOperations];
}

- (VSIdentityProvider)identityProvider
{
  return self->_identityProvider;
}

- (void)setIdentityProvider:(id)a3
{
}

- (NSArray)subscriptionsToAdd
{
  return self->_subscriptionsToAdd;
}

- (void)setSubscriptionsToAdd:(id)a3
{
}

- (NSArray)subscriptionsToRemoveByBundleID
{
  return self->_subscriptionsToRemoveByBundleID;
}

- (void)setSubscriptionsToRemoveByBundleID:(id)a3
{
}

- (NSOperationQueue)privateQueue
{
  return self->_privateQueue;
}

- (void)setPrivateQueue:(id)a3
{
}

- (VSSubscriptionRegistrationCenter)registrationCenter
{
  return self->_registrationCenter;
}

- (void)setRegistrationCenter:(id)a3
{
}

- (VSDeveloperSettingsFetchOperation)developerSettingsFetchOperation
{
  return self->_developerSettingsFetchOperation;
}

- (void)setDeveloperSettingsFetchOperation:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_developerSettingsFetchOperation, 0);
  objc_storeStrong((id *)&self->_registrationCenter, 0);
  objc_storeStrong((id *)&self->_privateQueue, 0);
  objc_storeStrong((id *)&self->_subscriptionsToRemoveByBundleID, 0);
  objc_storeStrong((id *)&self->_subscriptionsToAdd, 0);
  objc_storeStrong((id *)&self->_identityProvider, 0);
}

void __60__VSIdentityProviderSubscriptionOperation_executionDidBegin__block_invoke_3_cold_1(uint64_t a1, NSObject *a2)
{
  uint64_t v4 = *MEMORY[0x263EF8340];
  int v2 = 138412290;
  uint64_t v3 = a1;
  _os_log_error_impl(&dword_23F9AB000, a2, OS_LOG_TYPE_ERROR, "Error fetching developer settings: %@", (uint8_t *)&v2, 0xCu);
}

@end