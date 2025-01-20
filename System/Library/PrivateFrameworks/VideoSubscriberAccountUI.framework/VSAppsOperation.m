@interface VSAppsOperation
- (NSArray)nonChannelApps;
- (OS_dispatch_group)dispatchGroup;
- (VSAccountChannels)accountChannels;
- (VSAccountChannelsCenter)accountChannelsCenter;
- (VSApps)result;
- (VSAppsOperation)initWithIdentityProvider:(id)a3;
- (VSAppsOperation)initWithIdentityProvider:(id)a3 accountChannels:(id)a4;
- (VSFailable)channelAppsFailable;
- (VSIdentityProvider)identityProvider;
- (id)createAppsResult;
- (void)createAppsResult;
- (void)executionDidBegin;
- (void)fetchChannelAppsWithCompletion:(id)a3;
- (void)filterVisionOSCompatibleApps:(id)a3;
- (void)setAccountChannels:(id)a3;
- (void)setAccountChannelsCenter:(id)a3;
- (void)setChannelAppsFailable:(id)a3;
- (void)setDispatchGroup:(id)a3;
- (void)setIdentityProvider:(id)a3;
- (void)setNonChannelApps:(id)a3;
- (void)setResult:(id)a3;
@end

@implementation VSAppsOperation

- (VSAppsOperation)initWithIdentityProvider:(id)a3
{
  return [(VSAppsOperation *)self initWithIdentityProvider:a3 accountChannels:0];
}

- (VSAppsOperation)initWithIdentityProvider:(id)a3 accountChannels:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v14.receiver = self;
  v14.super_class = (Class)VSAppsOperation;
  v9 = [(VSAppsOperation *)&v14 init];
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_identityProvider, a3);
    objc_storeStrong((id *)&v10->_accountChannels, a4);
    dispatch_group_t v11 = dispatch_group_create();
    dispatchGroup = v10->_dispatchGroup;
    v10->_dispatchGroup = (OS_dispatch_group *)v11;
  }
  return v10;
}

- (void)fetchChannelAppsWithCompletion:(id)a3
{
  id v4 = a3;
  v5 = [(VSAppsOperation *)self identityProvider];
  v6 = [v5 uniqueID];
  id v7 = [v6 forceUnwrapObject];

  id v8 = [[VSIdentityProviderFetchAppsOperation alloc] initWithProviderIdentifier:v7 andType:3];
  objc_initWeak(&location, v8);
  v10[0] = MEMORY[0x263EF8330];
  v10[1] = 3221225472;
  v10[2] = __50__VSAppsOperation_fetchChannelAppsWithCompletion___block_invoke;
  v10[3] = &unk_265077DB0;
  id v9 = v4;
  id v11 = v9;
  objc_copyWeak(&v12, &location);
  [(VSIdentityProviderFetchAppsOperation *)v8 setCompletionBlock:v10];
  [(VSAsyncOperation *)v8 start];
  objc_destroyWeak(&v12);

  objc_destroyWeak(&location);
}

void __50__VSAppsOperation_fetchChannelAppsWithCompletion___block_invoke(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 32);
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  v2 = [WeakRetained result];
  v3 = [v2 object];
  (*(void (**)(uint64_t, void *))(v1 + 16))(v1, v3);
}

- (id)createAppsResult
{
  uint64_t v47 = *MEMORY[0x263EF8340];
  v3 = objc_alloc_init(VSApps);
  id v4 = [(VSAppsOperation *)self identityProvider];
  uint64_t v5 = [v4 nonChannelAppDescriptions];
  v6 = (void *)v5;
  uint64_t v7 = MEMORY[0x263EFFA68];
  if (v5) {
    uint64_t v8 = v5;
  }
  else {
    uint64_t v8 = MEMORY[0x263EFFA68];
  }
  [(VSApps *)v3 setNonChannelApps:v8];

  uint64_t v40 = 0;
  v41 = &v40;
  uint64_t v42 = 0x3032000000;
  v43 = __Block_byref_object_copy__4;
  v44 = __Block_byref_object_dispose__4;
  id v45 = 0;
  id v9 = [(VSAppsOperation *)self channelAppsFailable];
  v10 = v9;
  if (v9)
  {
    v39[0] = MEMORY[0x263EF8330];
    v39[1] = 3221225472;
    v39[2] = __35__VSAppsOperation_createAppsResult__block_invoke;
    v39[3] = &unk_265077DD8;
    v39[4] = &v40;
    [v9 unwrapObject:v39 error:&__block_literal_global_20];
    v34 = [(VSAppsOperation *)self accountChannels];
    uint64_t v11 = [(id)v41[5] allApps];
    id v12 = (void *)v11;
    if (v11) {
      uint64_t v13 = v11;
    }
    else {
      uint64_t v13 = v7;
    }
    [(VSApps *)v3 setAvailableApps:v13];

    objc_super v14 = [(VSApps *)v3 availableApps];
    -[VSApps setHasChannelApps:](v3, "setHasChannelApps:", [v14 count] != 0);

    v33 = [(id)v41[5] appsByChannelID];
    if ([v33 count])
    {
      v15 = [v34 channelIDs];
      BOOL v16 = [v15 count] != 0;
    }
    else
    {
      BOOL v16 = 0;
    }
    [(VSApps *)v3 setHasUserChannelList:v16];
    if (v16)
    {
      id v19 = objc_alloc_init(MEMORY[0x263EFF9C0]);
      id v20 = objc_alloc(MEMORY[0x263EFF980]);
      v21 = [(VSApps *)v3 availableApps];
      v22 = (void *)[v20 initWithArray:v21];

      [v34 channelIDs];
      long long v37 = 0u;
      long long v38 = 0u;
      long long v35 = 0u;
      long long v36 = 0u;
      id v23 = (id)objc_claimAutoreleasedReturnValue();
      uint64_t v24 = [v23 countByEnumeratingWithState:&v35 objects:v46 count:16];
      if (v24)
      {
        uint64_t v25 = *(void *)v36;
        do
        {
          for (uint64_t i = 0; i != v24; ++i)
          {
            if (*(void *)v36 != v25) {
              objc_enumerationMutation(v23);
            }
            uint64_t v27 = *(void *)(*((void *)&v35 + 1) + 8 * i);
            v28 = [(id)v41[5] appsByChannelID];
            v29 = [v28 objectForKey:v27];

            if (v29)
            {
              [v22 removeObjectsInArray:v29];
              [v19 addObjectsFromArray:v29];
            }
          }
          uint64_t v24 = [v23 countByEnumeratingWithState:&v35 objects:v46 count:16];
        }
        while (v24);
      }

      v30 = (void *)[v22 copy];
      [(VSApps *)v3 setAvailableApps:v30];

      v31 = [v19 allObjects];
      [(VSApps *)v3 setSubscribedApps:v31];
    }
    v18 = v3;

    v17 = v34;
  }
  else
  {
    v17 = VSErrorLogObject();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR)) {
      -[VSAppsOperation createAppsResult](v17);
    }
    v18 = 0;
  }

  _Block_object_dispose(&v40, 8);
  return v18;
}

void __35__VSAppsOperation_createAppsResult__block_invoke(uint64_t a1, void *a2)
{
}

void __35__VSAppsOperation_createAppsResult__block_invoke_2(uint64_t a1, void *a2)
{
  id v2 = a2;
  v3 = VSErrorLogObject();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR)) {
    __35__VSAppsOperation_createAppsResult__block_invoke_2_cold_1((uint64_t)v2, v3);
  }
}

- (void)filterVisionOSCompatibleApps:(id)a3
{
  v3 = (void *)MEMORY[0x263F08A98];
  id v4 = a3;
  id v11 = [v3 predicateWithBlock:&__block_literal_global_9];
  uint64_t v5 = [v4 availableApps];
  v6 = [v5 filteredArrayUsingPredicate:v11];
  [v4 setAvailableApps:v6];

  uint64_t v7 = [v4 subscribedApps];
  uint64_t v8 = [v7 filteredArrayUsingPredicate:v11];
  [v4 setSubscribedApps:v8];

  id v9 = [v4 nonChannelApps];
  v10 = [v9 filteredArrayUsingPredicate:v11];
  [v4 setNonChannelApps:v10];
}

uint64_t __48__VSAppsOperation_filterVisionOSCompatibleApps___block_invoke(uint64_t a1, void *a2)
{
  id v2 = a2;
  v3 = [v2 isVisionOSCompatible];
  if (v3)
  {
    id v4 = [v2 isVisionOSCompatible];
    uint64_t v5 = [v4 BOOLValue];
  }
  else
  {
    uint64_t v5 = 1;
  }

  return v5;
}

- (void)executionDidBegin
{
  uint64_t v18 = *MEMORY[0x263EF8340];
  v3 = VSDefaultLogObject();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315138;
    v17 = "-[VSAppsOperation executionDidBegin]";
    _os_log_impl(&dword_23F9AB000, v3, OS_LOG_TYPE_DEFAULT, "Entering %s", buf, 0xCu);
  }

  objc_initWeak((id *)buf, self);
  id v4 = [(VSAppsOperation *)self accountChannels];
  BOOL v5 = v4 == 0;

  if (v5)
  {
    v6 = [(VSAppsOperation *)self dispatchGroup];
    dispatch_group_enter(v6);

    uint64_t v7 = [MEMORY[0x263F1E180] sharedCenter];
    v14[0] = MEMORY[0x263EF8330];
    v14[1] = 3221225472;
    v14[2] = __36__VSAppsOperation_executionDidBegin__block_invoke;
    v14[3] = &unk_265077E20;
    objc_copyWeak(&v15, (id *)buf);
    [v7 fetchAccountChannelsWithCompletionHandler:v14];

    objc_destroyWeak(&v15);
  }
  uint64_t v8 = [(VSAppsOperation *)self dispatchGroup];
  dispatch_group_enter(v8);

  v12[0] = MEMORY[0x263EF8330];
  v12[1] = 3221225472;
  v12[2] = __36__VSAppsOperation_executionDidBegin__block_invoke_2;
  v12[3] = &unk_265077E48;
  objc_copyWeak(&v13, (id *)buf);
  [(VSAppsOperation *)self fetchChannelAppsWithCompletion:v12];
  id v9 = [(VSAppsOperation *)self dispatchGroup];
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __36__VSAppsOperation_executionDidBegin__block_invoke_3;
  block[3] = &unk_2650774D0;
  objc_copyWeak(&v11, (id *)buf);
  dispatch_group_notify(v9, MEMORY[0x263EF83A0], block);

  objc_destroyWeak(&v11);
  objc_destroyWeak(&v13);
  objc_destroyWeak((id *)buf);
}

void __36__VSAppsOperation_executionDidBegin__block_invoke(uint64_t a1, void *a2)
{
  id v2 = (id *)(a1 + 32);
  id v3 = a2;
  id WeakRetained = objc_loadWeakRetained(v2);
  [WeakRetained setAccountChannels:v3];

  id v4 = [WeakRetained dispatchGroup];
  dispatch_group_leave(v4);
}

void __36__VSAppsOperation_executionDidBegin__block_invoke_2(uint64_t a1, void *a2)
{
  id v2 = (id *)(a1 + 32);
  id v3 = a2;
  id WeakRetained = objc_loadWeakRetained(v2);
  [WeakRetained setChannelAppsFailable:v3];

  id v4 = [WeakRetained dispatchGroup];
  dispatch_group_leave(v4);
}

void __36__VSAppsOperation_executionDidBegin__block_invoke_3(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  uint64_t v1 = [WeakRetained createAppsResult];
  [WeakRetained setResult:v1];
  [WeakRetained finishExecutionIfPossible];
}

- (VSApps)result
{
  return self->_result;
}

- (void)setResult:(id)a3
{
}

- (VSIdentityProvider)identityProvider
{
  return self->_identityProvider;
}

- (void)setIdentityProvider:(id)a3
{
}

- (VSAccountChannelsCenter)accountChannelsCenter
{
  return self->_accountChannelsCenter;
}

- (void)setAccountChannelsCenter:(id)a3
{
}

- (VSAccountChannels)accountChannels
{
  return self->_accountChannels;
}

- (void)setAccountChannels:(id)a3
{
}

- (NSArray)nonChannelApps
{
  return self->_nonChannelApps;
}

- (void)setNonChannelApps:(id)a3
{
}

- (VSFailable)channelAppsFailable
{
  return self->_channelAppsFailable;
}

- (void)setChannelAppsFailable:(id)a3
{
}

- (OS_dispatch_group)dispatchGroup
{
  return self->_dispatchGroup;
}

- (void)setDispatchGroup:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_dispatchGroup, 0);
  objc_storeStrong((id *)&self->_channelAppsFailable, 0);
  objc_storeStrong((id *)&self->_nonChannelApps, 0);
  objc_storeStrong((id *)&self->_accountChannels, 0);
  objc_storeStrong((id *)&self->_accountChannelsCenter, 0);
  objc_storeStrong((id *)&self->_identityProvider, 0);
  objc_storeStrong((id *)&self->_result, 0);
}

- (void)createAppsResult
{
  *(_WORD *)uint64_t v1 = 0;
  _os_log_error_impl(&dword_23F9AB000, log, OS_LOG_TYPE_ERROR, "No ChannelAppsOperation result -- returning no apps.", v1, 2u);
}

void __35__VSAppsOperation_createAppsResult__block_invoke_2_cold_1(uint64_t a1, NSObject *a2)
{
  uint64_t v4 = *MEMORY[0x263EF8340];
  int v2 = 138412290;
  uint64_t v3 = a1;
  _os_log_error_impl(&dword_23F9AB000, a2, OS_LOG_TYPE_ERROR, "Error fetching channel apps: %@", (uint8_t *)&v2, 0xCu);
}

@end