@interface ICLibraryAuthServiceClientTokenProvider
+ (ICLibraryAuthServiceClientTokenProvider)sharedProvider;
- (BOOL)_isPrivacyAcknowledgementRequiredForAccountDSID:(id)a3;
- (BOOL)_shouldStopBackgroundRefreshForError:(id)a3;
- (BOOL)_updateEntriesForAccountsChanges;
- (BOOL)listener:(id)a3 shouldAcceptNewConnection:(id)a4;
- (DevicePresetTokenResult)_checkTokenPresetsForDSID:(SEL)a3 forceRefresh:(id)a4;
- (DevicePresetTokenResult)_devicePresetForConfiguration:(SEL)a3 withDSID:(id)a4;
- (ICLibraryAuthServiceClientTokenProvider)init;
- (id)_clientConnection;
- (id)_loggableTokenCacheDictionary;
- (id)_remoteObjectProxyWithErrorHandler:(id)a3;
- (id)cachedTokenAndResetCache:(BOOL)a3;
- (void)_addConnection:(id)a3;
- (void)_commitCache;
- (void)_handleLibraryAuthServiceClientTokenDidChangeDistributedNotification:(id)a3;
- (void)_handleUserIdentityStoreDidChangeNotification:(id)a3;
- (void)_loadCache;
- (void)_refreshTokenForDSID:(id)a3 forExternalRequest:(BOOL)a4 completion:(id)a5;
- (void)_refreshTokensForDSIDs:(id)a3 forExternalRequest:(BOOL)a4 completion:(id)a5;
- (void)_removeConnection:(id)a3;
- (void)_updateRefreshTimer;
- (void)_updateTokenCacheEntryForDSID:(id)a3 tokenResult:(id)a4 error:(id)a5;
- (void)addTokenResult:(id)a3 forDSID:(id)a4 completion:(id)a5;
- (void)dealloc;
- (void)getAllTokenStatusForAssistantForcingRefresh:(BOOL)a3 completion:(id)a4;
- (void)getAllTokensForAssistantForcingRefresh:(BOOL)a3 completion:(id)a4;
- (void)getTokenForDSID:(id)a3 forceRefresh:(BOOL)a4 completion:(id)a5;
- (void)getTokenForcingRefresh:(BOOL)a3 completion:(id)a4;
- (void)getTokenResultForDSID:(id)a3 forceRefresh:(BOOL)a4 completion:(id)a5;
- (void)getTokenResultsForDSIDs:(id)a3 forceRefresh:(BOOL)a4 completion:(id)a5;
- (void)getTokenStatusForDSIDs:(id)a3 forcingRefresh:(BOOL)a4 completion:(id)a5;
- (void)getTokenStatusForcingRefresh:(BOOL)a3 completion:(id)a4;
- (void)startService;
- (void)stopService;
@end

@implementation ICLibraryAuthServiceClientTokenProvider

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_siriConnection, 0);
  objc_storeStrong((id *)&self->_xpcClientConnection, 0);
  objc_storeStrong((id *)&self->_xpcConnections, 0);
  objc_storeStrong((id *)&self->_xpcServiceListener, 0);
  objc_storeStrong((id *)&self->_tokenCache, 0);
  objc_storeStrong((id *)&self->_operationQueue, 0);

  objc_storeStrong((id *)&self->_accessQueue, 0);
}

- (void)_removeConnection:(id)a3
{
  id v4 = a3;
  accessQueue = self->_accessQueue;
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __61__ICLibraryAuthServiceClientTokenProvider__removeConnection___block_invoke;
  v7[3] = &unk_1E5ACD4C8;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_sync(accessQueue, v7);
}

uint64_t __61__ICLibraryAuthServiceClientTokenProvider__removeConnection___block_invoke(uint64_t a1)
{
  return [*(id *)(*(void *)(a1 + 32) + 48) removeObject:*(void *)(a1 + 40)];
}

- (void)_addConnection:(id)a3
{
  id v4 = a3;
  accessQueue = self->_accessQueue;
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __58__ICLibraryAuthServiceClientTokenProvider__addConnection___block_invoke;
  v7[3] = &unk_1E5ACD4C8;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_sync(accessQueue, v7);
}

uint64_t __58__ICLibraryAuthServiceClientTokenProvider__addConnection___block_invoke(uint64_t a1)
{
  v2 = *(void **)(*(void *)(a1 + 32) + 48);
  if (!v2)
  {
    uint64_t v3 = [objc_alloc(MEMORY[0x1E4F1CA80]) initWithCapacity:1];
    uint64_t v4 = *(void *)(a1 + 32);
    v5 = *(void **)(v4 + 48);
    *(void *)(v4 + 48) = v3;

    v2 = *(void **)(*(void *)(a1 + 32) + 48);
  }
  uint64_t v6 = *(void *)(a1 + 40);

  return [v2 addObject:v6];
}

- (BOOL)listener:(id)a3 shouldAcceptNewConnection:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  objc_initWeak(&location, self);
  objc_initWeak(&from, v7);
  id v8 = [MEMORY[0x1E4F29280] interfaceWithProtocol:&unk_1EF65E4F8];
  [v7 setExportedInterface:v8];
  [v7 setExportedObject:self];
  v16[0] = MEMORY[0x1E4F143A8];
  v16[1] = 3221225472;
  v16[2] = __78__ICLibraryAuthServiceClientTokenProvider_listener_shouldAcceptNewConnection___block_invoke;
  v16[3] = &unk_1E5ACA2F0;
  objc_copyWeak(&v17, &location);
  objc_copyWeak(&v18, &from);
  [v7 setInterruptionHandler:v16];
  uint64_t v10 = MEMORY[0x1E4F143A8];
  uint64_t v11 = 3221225472;
  v12 = __78__ICLibraryAuthServiceClientTokenProvider_listener_shouldAcceptNewConnection___block_invoke_205;
  v13 = &unk_1E5ACA2F0;
  objc_copyWeak(&v14, &location);
  objc_copyWeak(&v15, &from);
  [v7 setInvalidationHandler:&v10];
  -[ICLibraryAuthServiceClientTokenProvider _addConnection:](self, "_addConnection:", v7, v10, v11, v12, v13);
  [v7 resume];
  objc_destroyWeak(&v15);
  objc_destroyWeak(&v14);
  objc_destroyWeak(&v18);
  objc_destroyWeak(&v17);

  objc_destroyWeak(&from);
  objc_destroyWeak(&location);

  return 1;
}

void __78__ICLibraryAuthServiceClientTokenProvider_listener_shouldAcceptNewConnection___block_invoke(uint64_t a1)
{
  uint64_t v7 = *MEMORY[0x1E4F143B8];
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    uint64_t v3 = os_log_create("com.apple.amp.iTunesCloud", "Default");
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
    {
      int v5 = 138543362;
      id v6 = WeakRetained;
      _os_log_impl(&dword_1A2D01000, v3, OS_LOG_TYPE_DEFAULT, "%{public}@ Connection interrupted", (uint8_t *)&v5, 0xCu);
    }

    id v4 = objc_loadWeakRetained((id *)(a1 + 40));
    if (v4) {
      [WeakRetained _removeConnection:v4];
    }
  }
}

void __78__ICLibraryAuthServiceClientTokenProvider_listener_shouldAcceptNewConnection___block_invoke_205(uint64_t a1)
{
  uint64_t v7 = *MEMORY[0x1E4F143B8];
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    uint64_t v3 = os_log_create("com.apple.amp.iTunesCloud", "Default");
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
    {
      int v5 = 138543362;
      id v6 = WeakRetained;
      _os_log_impl(&dword_1A2D01000, v3, OS_LOG_TYPE_DEFAULT, "%{public}@ Connection invalidated", (uint8_t *)&v5, 0xCu);
    }

    id v4 = objc_loadWeakRetained((id *)(a1 + 40));
    if (v4) {
      [WeakRetained _removeConnection:v4];
    }
  }
}

- (void)_handleUserIdentityStoreDidChangeNotification:(id)a3
{
  id v4 = [ICAsyncBlockOperation alloc];
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __89__ICLibraryAuthServiceClientTokenProvider__handleUserIdentityStoreDidChangeNotification___block_invoke;
  v6[3] = &unk_1E5ACA1A0;
  v6[4] = self;
  int v5 = [(ICAsyncBlockOperation *)v4 initWithStartHandler:v6];
  [(ICAsyncBlockOperation *)v5 setName:@"com.apple.iTunesCloud.ICLibraryAuthServiceClientTokenProvider._handleUserIdentityStoreDidChangeNotification"];
  [(NSOperationQueue *)self->_operationQueue addOperation:v5];
}

void __89__ICLibraryAuthServiceClientTokenProvider__handleUserIdentityStoreDidChangeNotification___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v9 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  if ([*(id *)(a1 + 32) _updateEntriesForAccountsChanges])
  {
    id v4 = os_log_create("com.apple.amp.iTunesCloud", "Default");
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v5 = *(void *)(a1 + 32);
      int v7 = 138543362;
      uint64_t v8 = v5;
      _os_log_impl(&dword_1A2D01000, v4, OS_LOG_TYPE_DEFAULT, "%{public}@ Rescheduling a refresh due to account changes", (uint8_t *)&v7, 0xCu);
    }

    [*(id *)(a1 + 32) _updateRefreshTimer];
    id v6 = [MEMORY[0x1E4F28C40] defaultCenter];
    [v6 postNotificationName:@"com.apple.iTunesCloud.ICLibraryAuthServiceClientTokenProvider._ICLibraryAuthServiceClientTokenDidChangeDistributedNotification" object:0];
  }
  [v3 finishWithError:0];
}

- (id)_loggableTokenCacheDictionary
{
  id v3 = objc_msgSend(MEMORY[0x1E4F1CA60], "dictionaryWithCapacity:", -[NSMutableDictionary count](self->_tokenCache, "count"));
  tokenCache = self->_tokenCache;
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __72__ICLibraryAuthServiceClientTokenProvider__loggableTokenCacheDictionary__block_invoke;
  v7[3] = &unk_1E5ACA1F0;
  id v5 = v3;
  id v8 = v5;
  [(NSMutableDictionary *)tokenCache enumerateKeysAndObjectsUsingBlock:v7];

  return v5;
}

void __72__ICLibraryAuthServiceClientTokenProvider__loggableTokenCacheDictionary__block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5 = a3;
  ICCreateLoggableValueForDSID(a2);
  id v6 = (id)objc_claimAutoreleasedReturnValue();
  [*(id *)(a1 + 32) setObject:v5 forKey:v6];
}

- (BOOL)_updateEntriesForAccountsChanges
{
  uint64_t v60 = *MEMORY[0x1E4F143B8];
  uint64_t v48 = 0;
  v49 = &v48;
  uint64_t v50 = 0x2020000000;
  char v51 = 0;
  v31 = +[ICDeviceInfo currentDeviceInfo];
  char v3 = [v31 supportsMultipleITunesAccounts];
  id v4 = +[ICMonitoredAccountStore sharedAccountStore];
  id v47 = 0;
  id v5 = [v4 allStoreAccountsWithError:&v47];
  id v33 = v47;
  v45[0] = MEMORY[0x1E4F143A8];
  v45[1] = 3221225472;
  v45[2] = __75__ICLibraryAuthServiceClientTokenProvider__updateEntriesForAccountsChanges__block_invoke;
  v45[3] = &__block_descriptor_33_e19_B16__0__ACAccount_8l;
  char v46 = v3;
  v34 = objc_msgSend(v5, "msv_filter:", v45);

  v32 = objc_msgSend(v34, "msv_map:", &__block_literal_global_25211);
  id v6 = os_log_create("com.apple.amp.iTunesCloud", "Default_Oversize");
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    int v7 = [(ICLibraryAuthServiceClientTokenProvider *)self _loggableTokenCacheDictionary];
    *(_DWORD *)buf = 138543874;
    v55 = self;
    __int16 v56 = 2114;
    id v57 = v7;
    __int16 v58 = 2114;
    v59 = v32;
    _os_log_impl(&dword_1A2D01000, v6, OS_LOG_TYPE_DEFAULT, "%{public}@ Reconciling cache entries %{public}@ with current account list %{public}@", buf, 0x20u);
  }
  if (v33)
  {
    id v8 = os_log_create("com.apple.amp.iTunesCloud", "Default");
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138543618;
      v55 = self;
      __int16 v56 = 2114;
      id v57 = v33;
      _os_log_impl(&dword_1A2D01000, v8, OS_LOG_TYPE_ERROR, "%{public}@ Failed to gather DSIDs from the account store to fetch tokens for. err=%{public}@", buf, 0x16u);
    }
  }
  else
  {
    id v8 = objc_msgSend(MEMORY[0x1E4F1CA80], "setWithCapacity:", objc_msgSend(v34, "count"));
    long long v43 = 0u;
    long long v44 = 0u;
    long long v41 = 0u;
    long long v42 = 0u;
    id v9 = v34;
    uint64_t v10 = [v9 countByEnumeratingWithState:&v41 objects:v53 count:16];
    if (v10)
    {
      uint64_t v11 = *(void *)v42;
      do
      {
        for (uint64_t i = 0; i != v10; ++i)
        {
          if (*(void *)v42 != v11) {
            objc_enumerationMutation(v9);
          }
          v13 = *(void **)(*((void *)&v41 + 1) + 8 * i);
          id v14 = objc_msgSend(v13, "ic_DSID");
          [v8 addObject:v14];
          if ([v13 isAuthenticated])
          {
            id v15 = [(NSMutableDictionary *)self->_tokenCache objectForKey:v14];
            BOOL v16 = v15 == 0;

            if (v16)
            {
              id v17 = os_log_create("com.apple.amp.iTunesCloud", "Default");
              if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
              {
                id v18 = ICCreateLoggableValueForDSID(v14);
                *(_DWORD *)buf = 138543618;
                v55 = self;
                __int16 v56 = 2112;
                id v57 = v18;
                _os_log_impl(&dword_1A2D01000, v17, OS_LOG_TYPE_DEFAULT, "%{public}@ Pre-fetching library token for new account with DSID %@", buf, 0x16u);
              }
              [(ICLibraryAuthServiceClientTokenProvider *)self getTokenResultForDSID:v14 forceRefresh:0 completion:&__block_literal_global_200];
            }
          }
        }
        uint64_t v10 = [v9 countByEnumeratingWithState:&v41 objects:v53 count:16];
      }
      while (v10);
    }

    long long v39 = 0u;
    long long v40 = 0u;
    long long v37 = 0u;
    long long v38 = 0u;
    v19 = [(NSMutableDictionary *)self->_tokenCache allKeys];
    v20 = (void *)[v19 copy];

    uint64_t v21 = [v20 countByEnumeratingWithState:&v37 objects:v52 count:16];
    if (v21)
    {
      uint64_t v22 = *(void *)v38;
      do
      {
        for (uint64_t j = 0; j != v21; ++j)
        {
          if (*(void *)v38 != v22) {
            objc_enumerationMutation(v20);
          }
          v24 = *(void **)(*((void *)&v37 + 1) + 8 * j);
          if (([v8 containsObject:v24] & 1) == 0)
          {
            v25 = os_log_create("com.apple.amp.iTunesCloud", "Default");
            if (os_log_type_enabled(v25, OS_LOG_TYPE_DEFAULT))
            {
              v26 = ICCreateLoggableValueForDSID(v24);
              *(_DWORD *)buf = 138543618;
              v55 = self;
              __int16 v56 = 2112;
              id v57 = v26;
              _os_log_impl(&dword_1A2D01000, v25, OS_LOG_TYPE_DEFAULT, "%{public}@ Removing token entry for non-existent or inactive account DSID %@", buf, 0x16u);
            }
            [(NSMutableDictionary *)self->_tokenCache removeObjectForKey:v24];
            *((unsigned char *)v49 + 24) = 1;
          }
        }
        uint64_t v21 = [v20 countByEnumeratingWithState:&v37 objects:v52 count:16];
      }
      while (v21);
    }
  }
  BOOL v27 = [(ICLibraryAuthServiceClientTokenProvider *)self _isPrivacyAcknowledgementRequiredForAccountDSID:0];
  tokenCache = self->_tokenCache;
  v35[0] = MEMORY[0x1E4F143A8];
  v35[1] = 3221225472;
  v35[2] = __75__ICLibraryAuthServiceClientTokenProvider__updateEntriesForAccountsChanges__block_invoke_201;
  v35[3] = &unk_1E5ACA2C8;
  BOOL v36 = v27;
  v35[4] = &v48;
  [(NSMutableDictionary *)tokenCache enumerateKeysAndObjectsUsingBlock:v35];
  BOOL v29 = *((unsigned char *)v49 + 24) != 0;

  _Block_object_dispose(&v48, 8);
  return v29;
}

uint64_t __75__ICLibraryAuthServiceClientTokenProvider__updateEntriesForAccountsChanges__block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  if (objc_msgSend(v3, "ic_isLocalAccount"))
  {
    uint64_t v4 = 0;
  }
  else if (*(unsigned char *)(a1 + 32))
  {
    uint64_t v4 = 1;
  }
  else
  {
    uint64_t v4 = [v3 isActive];
  }

  return v4;
}

uint64_t __75__ICLibraryAuthServiceClientTokenProvider__updateEntriesForAccountsChanges__block_invoke_201(uint64_t a1, uint64_t a2, void *a3)
{
  id v11 = a3;
  uint64_t v4 = [v11 shouldExcludeFromBackgroundRefresh];
  id v5 = v11;
  if (v4)
  {
    id v6 = [v11 lastError];
    int v7 = v6;
    if (!*(unsigned char *)(a1 + 40))
    {
      id v8 = [v6 domain];
      if ([v8 isEqualToString:@"ICError"])
      {
        uint64_t v9 = [v7 code];

        if (v9 == -7007)
        {
          [v11 setShouldExcludeFromBackgroundRefresh:0];
          *(unsigned char *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = 1;
        }
      }
      else
      {
      }
    }

    id v5 = v11;
  }

  return MEMORY[0x1F41817F8](v4, v5);
}

uint64_t __75__ICLibraryAuthServiceClientTokenProvider__updateEntriesForAccountsChanges__block_invoke_2(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "ic_description");
}

- (BOOL)_isPrivacyAcknowledgementRequiredForAccountDSID:(id)a3
{
  id v3 = a3;
  if (v3)
  {
    uint64_t v4 = +[ICUserIdentity specificAccountWithDSID:v3];
    id v5 = +[ICPrivacyInfo sharedPrivacyInfoForUserIdentity:v4];
  }
  else
  {
    id v5 = +[ICPrivacyInfo sharedPrivacyInfo];
  }
  BOOL v6 = [v5 privacyAcknowledgementRequiredForIdentifier:@"Music"]
    && ([v5 privacyAcknowledgementRequiredForIdentifier:@"TV"] & 1) != 0;

  return v6;
}

- (void)_updateTokenCacheEntryForDSID:(id)a3 tokenResult:(id)a4 error:(id)a5
{
  id v13 = a4;
  tokenCache = self->_tokenCache;
  id v9 = a5;
  id v10 = a3;
  id v11 = [(NSMutableDictionary *)tokenCache objectForKey:v10];
  if (!v11) {
    id v11 = objc_alloc_init(ICLibraryAuthServiceClientTokenStatus);
  }
  if (v13) {
    [(ICLibraryAuthServiceClientTokenStatus *)v11 setTokenResult:v13];
  }
  [(ICLibraryAuthServiceClientTokenStatus *)v11 setShouldExcludeFromBackgroundRefresh:[(ICLibraryAuthServiceClientTokenProvider *)self _shouldStopBackgroundRefreshForError:v9]];
  [(ICLibraryAuthServiceClientTokenStatus *)v11 setLastError:v9];

  v12 = [MEMORY[0x1E4F1C9C8] now];
  [v12 timeIntervalSinceReferenceDate];
  -[ICLibraryAuthServiceClientTokenStatus setLastUpdateAttemptTime:](v11, "setLastUpdateAttemptTime:");

  [(NSMutableDictionary *)self->_tokenCache setObject:v11 forKey:v10];
}

- (BOOL)_shouldStopBackgroundRefreshForError:(id)a3
{
  id v3 = a3;
  uint64_t v4 = v3;
  BOOL v8 = 0;
  if (v3)
  {
    id v5 = [v3 domain];
    int v6 = [v5 isEqualToString:@"ICError"];

    if (v6)
    {
      uint64_t v7 = [v4 code];
      if ((unint64_t)(v7 + 7403) < 4 || v7 == -7007) {
        BOOL v8 = 1;
      }
    }
  }

  return v8;
}

- (void)_updateRefreshTimer
{
  uint64_t v29 = *MEMORY[0x1E4F143B8];
  uint64_t v17 = 0;
  id v18 = &v17;
  uint64_t v19 = 0x3032000000;
  v20 = __Block_byref_object_copy__25223;
  uint64_t v21 = __Block_byref_object_dispose__25224;
  id v22 = 0;
  uint64_t v11 = 0;
  v12 = &v11;
  uint64_t v13 = 0x3032000000;
  id v14 = __Block_byref_object_copy__25223;
  id v15 = __Block_byref_object_dispose__25224;
  id v16 = 0;
  tokenCache = self->_tokenCache;
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __62__ICLibraryAuthServiceClientTokenProvider__updateRefreshTimer__block_invoke;
  v10[3] = &unk_1E5ACA1C8;
  v10[5] = &v17;
  v10[6] = &v11;
  v10[4] = self;
  [(NSMutableDictionary *)tokenCache enumerateKeysAndObjectsUsingBlock:v10];
  if (v18[5])
  {
    uint64_t v4 = os_log_create("com.apple.amp.iTunesCloud", "Default");
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v5 = v12[5];
      uint64_t v6 = v18[5];
      *(_DWORD *)buf = 138543874;
      v24 = self;
      __int16 v25 = 2112;
      uint64_t v26 = v5;
      __int16 v27 = 2114;
      uint64_t v28 = v6;
      _os_log_impl(&dword_1A2D01000, v4, OS_LOG_TYPE_DEFAULT, "%{public}@ Setting timer to refresh library auth token for DSID %@ at %{public}@}", buf, 0x20u);
    }

    xpc_object_t v7 = xpc_dictionary_create(0, 0, 0);
    xpc_dictionary_set_string(v7, (const char *)*MEMORY[0x1E4F142C8], (const char *)*MEMORY[0x1E4F142E0]);
    xpc_dictionary_set_BOOL(v7, (const char *)*MEMORY[0x1E4F142F8], 0);
    [(id)v18[5] timeIntervalSinceNow];
    xpc_dictionary_set_int64(v7, (const char *)*MEMORY[0x1E4F14170], (uint64_t)v8);
    xpc_dictionary_set_BOOL(v7, (const char *)*MEMORY[0x1E4F14340], 0);
    xpc_dictionary_set_int64(v7, "token_refresh_dsid", [(id)v12[5] longLongValue]);
    v9[0] = MEMORY[0x1E4F143A8];
    v9[1] = 3221225472;
    v9[2] = __62__ICLibraryAuthServiceClientTokenProvider__updateRefreshTimer__block_invoke_185;
    v9[3] = &unk_1E5ACA240;
    v9[4] = self;
    xpc_activity_register("com.apple.itunescloud.library_auth_token_refresh_timer", v7, v9);
  }
  else
  {
    xpc_activity_unregister("com.apple.itunescloud.library_auth_token_refresh_timer");
  }
  _Block_object_dispose(&v11, 8);

  _Block_object_dispose(&v17, 8);
}

void __62__ICLibraryAuthServiceClientTokenProvider__updateRefreshTimer__block_invoke(void *a1, void *a2, void *a3)
{
  uint64_t v25 = *MEMORY[0x1E4F143B8];
  id v6 = a2;
  id v7 = a3;
  if (([v7 shouldExcludeFromBackgroundRefresh] & 1) == 0)
  {
    uint64_t v11 = [v7 tokenResult];
    v12 = [v11 expirationDate];
    [v12 timeIntervalSinceReferenceDate];
    double v14 = v13;
    [v7 lastUpdateAttemptTime];
    if (v15 != 0.0 && v14 < v15 + 600.0)
    {
      uint64_t v16 = objc_msgSend(MEMORY[0x1E4F1C9C8], "dateWithTimeIntervalSinceReferenceDate:");

      v12 = (void *)v16;
    }
    if (!v12) {
      goto LABEL_13;
    }
    uint64_t v17 = *(void *)(a1[5] + 8);
    id v18 = *(void **)(v17 + 40);
    if (v18)
    {
      if ([v18 compare:v12] != 1)
      {
LABEL_13:

        goto LABEL_14;
      }
      uint64_t v17 = *(void *)(a1[5] + 8);
    }
    objc_storeStrong((id *)(v17 + 40), v12);
    objc_storeStrong((id *)(*(void *)(a1[6] + 8) + 40), a2);
    goto LABEL_13;
  }
  double v8 = os_log_create("com.apple.amp.iTunesCloud", "Default");
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v9 = a1[4];
    id v10 = [v7 lastError];
    int v19 = 138543874;
    uint64_t v20 = v9;
    __int16 v21 = 2112;
    id v22 = v6;
    __int16 v23 = 2114;
    v24 = v10;
    _os_log_impl(&dword_1A2D01000, v8, OS_LOG_TYPE_DEFAULT, "%{public}@ Skipping background refresh of DSID %@. last error: %{public}@}", (uint8_t *)&v19, 0x20u);
  }
LABEL_14:
}

void __62__ICLibraryAuthServiceClientTokenProvider__updateRefreshTimer__block_invoke_185(uint64_t a1, xpc_activity_t activity)
{
  xpc_object_t v3 = xpc_activity_copy_criteria(activity);
  uint64_t v4 = objc_msgSend(NSNumber, "numberWithLongLong:", xpc_dictionary_get_int64(v3, "token_refresh_dsid"));
  uint64_t v5 = [ICAsyncBlockOperation alloc];
  uint64_t v9 = MEMORY[0x1E4F143A8];
  uint64_t v10 = 3221225472;
  uint64_t v11 = __62__ICLibraryAuthServiceClientTokenProvider__updateRefreshTimer__block_invoke_2;
  v12 = &unk_1E5ACA218;
  uint64_t v6 = *(void *)(a1 + 32);
  id v13 = v4;
  uint64_t v14 = v6;
  id v7 = v4;
  double v8 = [(ICAsyncBlockOperation *)v5 initWithStartHandler:&v9];
  [(ICAsyncBlockOperation *)v8 setName:@"com.apple.iTunesCloud.ICLibraryAuthServiceClientTokenProvider.tokenRefreshTimer", v9, v10, v11, v12];
  [*(id *)(*(void *)(a1 + 32) + 16) addOperation:v8];
}

void __62__ICLibraryAuthServiceClientTokenProvider__updateRefreshTimer__block_invoke_2(uint64_t a1, void *a2)
{
  uint64_t v28 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  if ([*(id *)(a1 + 32) longLongValue]
    && (unint64_t)[*(id *)(*(void *)(a1 + 40) + 24) count] < 2)
  {
    uint64_t v10 = os_log_create("com.apple.amp.iTunesCloud", "Default");
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v12 = *(void *)(a1 + 32);
      uint64_t v11 = *(void *)(a1 + 40);
      *(_DWORD *)buf = 138543618;
      uint64_t v25 = v11;
      __int16 v26 = 2112;
      uint64_t v27 = v12;
      _os_log_impl(&dword_1A2D01000, v10, OS_LOG_TYPE_DEFAULT, "%{public}@ Refreshing token for DSID %@", buf, 0x16u);
    }

    uint64_t v15 = a1 + 32;
    uint64_t v13 = *(void *)(a1 + 32);
    uint64_t v14 = *(void **)(v15 + 8);
    v18[0] = MEMORY[0x1E4F143A8];
    v18[1] = 3221225472;
    v18[2] = __62__ICLibraryAuthServiceClientTokenProvider__updateRefreshTimer__block_invoke_188;
    v18[3] = &unk_1E5AC9ED8;
    id v19 = v3;
    [v14 _refreshTokenForDSID:v13 forExternalRequest:0 completion:v18];
    id v8 = v19;
  }
  else
  {
    uint64_t v4 = os_log_create("com.apple.amp.iTunesCloud", "Default");
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v5 = *(void *)(a1 + 40);
      *(_DWORD *)buf = 138543362;
      uint64_t v25 = v5;
      _os_log_impl(&dword_1A2D01000, v4, OS_LOG_TYPE_DEFAULT, "%{public}@ Performing bulk token refresh", buf, 0xCu);
    }

    uint64_t v6 = objc_msgSend(MEMORY[0x1E4F1CA80], "setWithCapacity:", objc_msgSend(*(id *)(*(void *)(a1 + 40) + 24), "count"));
    id v7 = *(void **)(*(void *)(a1 + 40) + 24);
    v22[0] = MEMORY[0x1E4F143A8];
    v22[1] = 3221225472;
    v22[2] = __62__ICLibraryAuthServiceClientTokenProvider__updateRefreshTimer__block_invoke_186;
    v22[3] = &unk_1E5ACA1F0;
    id v8 = v6;
    id v23 = v8;
    [v7 enumerateKeysAndObjectsUsingBlock:v22];
    if ([v8 count])
    {
      uint64_t v9 = *(void **)(a1 + 40);
      v20[0] = MEMORY[0x1E4F143A8];
      v20[1] = 3221225472;
      v20[2] = __62__ICLibraryAuthServiceClientTokenProvider__updateRefreshTimer__block_invoke_187;
      v20[3] = &unk_1E5AC9F78;
      id v21 = v3;
      [v9 _refreshTokensForDSIDs:v8 forExternalRequest:0 completion:v20];
    }
    else
    {
      uint64_t v16 = os_log_create("com.apple.amp.iTunesCloud", "Default");
      if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
      {
        uint64_t v17 = *(void *)(a1 + 40);
        *(_DWORD *)buf = 138543362;
        uint64_t v25 = v17;
        _os_log_impl(&dword_1A2D01000, v16, OS_LOG_TYPE_DEFAULT, "%{public}@ No DSIDs available to refresh - ignoring", buf, 0xCu);
      }

      [v3 finishWithError:0];
    }
  }
}

void __62__ICLibraryAuthServiceClientTokenProvider__updateRefreshTimer__block_invoke_186(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  if (([a3 shouldExcludeFromBackgroundRefresh] & 1) == 0) {
    [*(id *)(a1 + 32) addObject:v5];
  }
}

uint64_t __62__ICLibraryAuthServiceClientTokenProvider__updateRefreshTimer__block_invoke_187(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "finishWithError:");
}

uint64_t __62__ICLibraryAuthServiceClientTokenProvider__updateRefreshTimer__block_invoke_188(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "finishWithError:");
}

- (void)_commitCache
{
  if (!self->_isService)
  {
    uint64_t v9 = [MEMORY[0x1E4F28B00] currentHandler];
    [v9 handleFailureInMethod:a2 object:self file:@"ICLibraryAuthServiceClientTokenProvider.m" lineNumber:977 description:@"Committing the cache is not allowed from a client"];
  }
  id v3 = objc_msgSend(MEMORY[0x1E4F1CA60], "dictionaryWithCapacity:", -[NSMutableDictionary count](self->_tokenCache, "count"));
  tokenCache = self->_tokenCache;
  uint64_t v10 = MEMORY[0x1E4F143A8];
  uint64_t v11 = 3221225472;
  uint64_t v12 = __55__ICLibraryAuthServiceClientTokenProvider__commitCache__block_invoke;
  uint64_t v13 = &unk_1E5ACC010;
  uint64_t v14 = self;
  id v15 = v3;
  id v5 = v3;
  [(NSMutableDictionary *)tokenCache enumerateKeysAndObjectsUsingBlock:&v10];
  uint64_t v6 = +[ICDefaults standardDefaults];
  id v7 = (void *)[v5 copy];
  [v6 setAuthServiceClientTokenCache:v7];
}

void __55__ICLibraryAuthServiceClientTokenProvider__commitCache__block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  id v5 = (void *)MEMORY[0x1E4F28DB0];
  id v12 = 0;
  id v6 = a2;
  id v7 = [v5 archivedDataWithRootObject:a3 requiringSecureCoding:1 error:&v12];
  id v8 = v12;
  uint64_t v9 = [v6 stringValue];

  if (v8)
  {
    uint64_t v10 = os_log_create("com.apple.amp.iTunesCloud", "Default");
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v11 = *(void *)(a1 + 32);
      *(_DWORD *)buf = 138543618;
      uint64_t v14 = v11;
      __int16 v15 = 2114;
      id v16 = v8;
      _os_log_impl(&dword_1A2D01000, v10, OS_LOG_TYPE_DEFAULT, "%{public}@ Failed to serialize token result to cache. err=%{public}@", buf, 0x16u);
    }
  }
  else
  {
    [*(id *)(a1 + 40) setObject:v7 forKey:v9];
  }
}

- (DevicePresetTokenResult)_devicePresetForConfiguration:(SEL)a3 withDSID:(id)a4
{
  v24[5] = *MEMORY[0x1E4F143B8];
  id v7 = a4;
  id v8 = a5;
  retstr->var0 = 0;
  retstr->var1 = 0;
  if (!v7) {
    goto LABEL_10;
  }
  if (![v7 allDSIDsShouldError])
  {
    if ([v7 allDSIDsShouldSucceed])
    {
      v23[0] = @"generatedAtMillis";
      uint64_t v9 = NSNumber;
      uint64_t v20 = [MEMORY[0x1E4F1C9C8] date];
      [v20 timeIntervalSince1970];
      uint64_t v11 = [v9 numberWithDouble:v10 * 1000.0];
      v24[0] = v11;
      v24[1] = &unk_1EF640A08;
      v23[1] = @"lifespanMillis";
      v23[2] = @"timeToLiveMillis";
      v24[2] = &unk_1EF640A20;
      v23[3] = @"token";
      id v12 = [MEMORY[0x1E4F29128] UUID];
      uint64_t v13 = [v12 UUIDString];
      v24[3] = v13;
      v23[4] = @"tokenID";
      v21[0] = @"deviceGUID";
      uint64_t v14 = +[ICDeviceInfo currentDeviceInfo];
      __int16 v15 = [v14 deviceGUID];
      v21[1] = @"dsid";
      v22[0] = v15;
      v22[1] = v8;
      id v16 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v22 forKeys:v21 count:2];
      v24[4] = v16;
      uint64_t v17 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v24 forKeys:v23 count:5];

      retstr->var0 = [[ICLibraryAuthServiceClientTokenResult alloc] initWithResponseDictionary:v17];
      retstr->var2 = 1;

      goto LABEL_11;
    }
    id v18 = [v7 errorDSIDs];
    if ([v18 count] && objc_msgSend(v18, "containsObject:", v8))
    {
      retstr->var1 = [MEMORY[0x1E4F28C58] errorWithDomain:@"ICError" code:-7102 userInfo:0];
      retstr->var2 = 1;

      goto LABEL_11;
    }

LABEL_10:
    retstr->var2 = 0;
    goto LABEL_11;
  }
  retstr->var1 = [MEMORY[0x1E4F28C58] errorWithDomain:@"ICError" code:-7102 userInfo:0];
  retstr->var2 = 1;
LABEL_11:

  return result;
}

- (DevicePresetTokenResult)_checkTokenPresetsForDSID:(SEL)a3 forceRefresh:(id)a4
{
  BOOL v5 = a5;
  id v8 = a4;
  retstr->var0 = 0;
  retstr->var1 = 0;
  uint64_t v9 = +[ICDefaults standardDefaults];
  int v10 = [v9 presetsFound];

  if (v10)
  {
    +[ICDefaults standardDefaults];
    if (v5) {
      uint64_t v11 = {;
    }
      [v11 debugRefreshConfiguration];
    }
    else {
      uint64_t v11 = {;
    }
      [v11 debugFetchConfiguration];
    id v12 = };
    [(ICLibraryAuthServiceClientTokenProvider *)self _devicePresetForConfiguration:v12 withDSID:v8];
    *(_OWORD *)&retstr->var0 = v14;
    retstr->var2 = v15;
  }
  else
  {
    retstr->var2 = 0;
  }

  return result;
}

- (void)_loadCache
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  id v3 = +[ICDefaults standardDefaults];
  uint64_t v4 = [v3 authServiceClientTokenCache];

  objc_msgSend(MEMORY[0x1E4F1CA60], "dictionaryWithCapacity:", objc_msgSend(v4, "count"));
  BOOL v5 = (NSMutableDictionary *)objc_claimAutoreleasedReturnValue();
  tokenCache = self->_tokenCache;
  self->_tokenCache = v5;

  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __53__ICLibraryAuthServiceClientTokenProvider__loadCache__block_invoke;
  v9[3] = &unk_1E5ACADD0;
  v9[4] = self;
  [v4 enumerateKeysAndObjectsUsingBlock:v9];
  id v7 = os_log_create("com.apple.amp.iTunesCloud", "Default");
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    id v8 = [(ICLibraryAuthServiceClientTokenProvider *)self _loggableTokenCacheDictionary];
    *(_DWORD *)buf = 138543618;
    uint64_t v11 = self;
    __int16 v12 = 2114;
    uint64_t v13 = v8;
    _os_log_impl(&dword_1A2D01000, v7, OS_LOG_TYPE_DEFAULT, "%{public}@ Loaded cached tokens: %{public}@", buf, 0x16u);
  }
}

void __53__ICLibraryAuthServiceClientTokenProvider__loadCache__block_invoke(uint64_t a1, void *a2, void *a3)
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  id v6 = a3;
  if (_NSIsNSString() && _NSIsNSData() && [v5 longLongValue] >= 1)
  {
    id v7 = objc_msgSend(NSNumber, "numberWithLongLong:", objc_msgSend(v5, "longLongValue"));
    id v15 = 0;
    id v8 = [MEMORY[0x1E4F28DC0] unarchivedObjectOfClass:objc_opt_class() fromData:v6 error:&v15];
    id v9 = v15;
    id v10 = v9;
    if (v8)
    {
      if (v9) {
        goto LABEL_6;
      }
    }
    else
    {

      id v14 = 0;
      uint64_t v13 = [MEMORY[0x1E4F28DC0] unarchivedObjectOfClass:objc_opt_class() fromData:v6 error:&v14];
      id v10 = v14;
      if (v13)
      {
        id v8 = objc_alloc_init(ICLibraryAuthServiceClientTokenStatus);
        [(ICLibraryAuthServiceClientTokenStatus *)v8 setTokenResult:v13];
      }
      else
      {
        id v8 = 0;
      }

      if (v10)
      {
LABEL_6:
        uint64_t v11 = os_log_create("com.apple.amp.iTunesCloud", "Default");
        if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
        {
          uint64_t v12 = *(void *)(a1 + 32);
          *(_DWORD *)buf = 138543618;
          uint64_t v17 = v12;
          __int16 v18 = 2114;
          id v19 = v10;
          _os_log_impl(&dword_1A2D01000, v11, OS_LOG_TYPE_DEFAULT, "%{public}@ Failed to deserialize cached token result data. err=%{public}@", buf, 0x16u);
        }

LABEL_15:
        goto LABEL_16;
      }
    }
    if (v8) {
      [*(id *)(*(void *)(a1 + 32) + 24) setObject:v8 forKey:v7];
    }
    goto LABEL_15;
  }
LABEL_16:
}

- (id)_remoteObjectProxyWithErrorHandler:(id)a3
{
  id v4 = a3;
  id v5 = [(ICLibraryAuthServiceClientTokenProvider *)self _clientConnection];
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __78__ICLibraryAuthServiceClientTokenProvider__remoteObjectProxyWithErrorHandler___block_invoke;
  v9[3] = &unk_1E5ACD8E0;
  v9[4] = self;
  id v10 = v4;
  id v6 = v4;
  id v7 = [v5 remoteObjectProxyWithErrorHandler:v9];

  return v7;
}

void __78__ICLibraryAuthServiceClientTokenProvider__remoteObjectProxyWithErrorHandler___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  id v4 = os_log_create("com.apple.amp.iTunesCloud", "Default");
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v5 = *(void *)(a1 + 32);
    int v8 = 138543618;
    uint64_t v9 = v5;
    __int16 v10 = 2114;
    id v11 = v3;
    _os_log_impl(&dword_1A2D01000, v4, OS_LOG_TYPE_DEFAULT, "%{public}@ failed to get remote object proxy. err=%{public}@", (uint8_t *)&v8, 0x16u);
  }

  uint64_t v6 = *(void *)(a1 + 32);
  id v7 = *(void **)(v6 + 56);
  *(void *)(v6 + 56) = 0;

  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
}

- (id)_clientConnection
{
  uint64_t v25 = *MEMORY[0x1E4F143B8];
  xpcClientConnection = self->_xpcClientConnection;
  if (!xpcClientConnection)
  {
    id v4 = os_log_create("com.apple.amp.iTunesCloud", "Default");
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138543362;
      v24 = self;
      _os_log_impl(&dword_1A2D01000, v4, OS_LOG_TYPE_DEFAULT, "%{public}@ Connecting to token provider service", buf, 0xCu);
    }

    uint64_t v5 = (NSXPCConnection *)[objc_alloc(MEMORY[0x1E4F29268]) initWithMachServiceName:@"com.apple.itunescloud.library-auth-token-provider" options:0];
    uint64_t v6 = self->_xpcClientConnection;
    self->_xpcClientConnection = v5;

    [(NSXPCConnection *)self->_xpcClientConnection setExportedObject:self];
    id v7 = [MEMORY[0x1E4F29280] interfaceWithProtocol:&unk_1EF65E4F8];
    int v8 = (void *)MEMORY[0x1E4F1CAD0];
    uint64_t v9 = objc_opt_class();
    uint64_t v10 = objc_opt_class();
    id v11 = objc_msgSend(v8, "setWithObjects:", v9, v10, objc_opt_class(), 0);
    [v7 setClasses:v11 forSelector:sel_getTokenResultsForDSIDs_forceRefresh_completion_ argumentIndex:0 ofReply:1];

    uint64_t v12 = (void *)MEMORY[0x1E4F1CAD0];
    uint64_t v13 = objc_opt_class();
    uint64_t v14 = objc_opt_class();
    id v15 = objc_msgSend(v12, "setWithObjects:", v13, v14, objc_opt_class(), 0);
    [v7 setClasses:v15 forSelector:sel_getTokenStatusForDSIDs_forcingRefresh_completion_ argumentIndex:0 ofReply:1];

    [(NSXPCConnection *)self->_xpcClientConnection setRemoteObjectInterface:v7];
    objc_initWeak((id *)buf, self);
    id v16 = self->_xpcClientConnection;
    v21[0] = MEMORY[0x1E4F143A8];
    v21[1] = 3221225472;
    void v21[2] = __60__ICLibraryAuthServiceClientTokenProvider__clientConnection__block_invoke;
    v21[3] = &unk_1E5ACD778;
    objc_copyWeak(&v22, (id *)buf);
    [(NSXPCConnection *)v16 setInterruptionHandler:v21];
    uint64_t v17 = self->_xpcClientConnection;
    v19[0] = MEMORY[0x1E4F143A8];
    v19[1] = 3221225472;
    v19[2] = __60__ICLibraryAuthServiceClientTokenProvider__clientConnection__block_invoke_148;
    v19[3] = &unk_1E5ACD778;
    objc_copyWeak(&v20, (id *)buf);
    [(NSXPCConnection *)v17 setInvalidationHandler:v19];
    [(NSXPCConnection *)self->_xpcClientConnection resume];
    objc_destroyWeak(&v20);
    objc_destroyWeak(&v22);
    objc_destroyWeak((id *)buf);

    xpcClientConnection = self->_xpcClientConnection;
  }

  return xpcClientConnection;
}

void __60__ICLibraryAuthServiceClientTokenProvider__clientConnection__block_invoke(uint64_t a1)
{
  uint64_t v5 = *MEMORY[0x1E4F143B8];
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v2 = os_log_create("com.apple.amp.iTunesCloud", "Default");
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    int v3 = 138543362;
    id v4 = WeakRetained;
    _os_log_impl(&dword_1A2D01000, v2, OS_LOG_TYPE_DEFAULT, "%{public}@ client connection interrupted", (uint8_t *)&v3, 0xCu);
  }
}

void __60__ICLibraryAuthServiceClientTokenProvider__clientConnection__block_invoke_148(uint64_t a1)
{
  uint64_t v6 = *MEMORY[0x1E4F143B8];
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v2 = os_log_create("com.apple.amp.iTunesCloud", "Default");
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    int v4 = 138543362;
    uint64_t v5 = WeakRetained;
    _os_log_impl(&dword_1A2D01000, v2, OS_LOG_TYPE_DEFAULT, "%{public}@ client connection invalidated", (uint8_t *)&v4, 0xCu);
  }

  int v3 = (void *)WeakRetained[7];
  WeakRetained[7] = 0;
}

- (void)_handleLibraryAuthServiceClientTokenDidChangeDistributedNotification:(id)a3
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  int v4 = os_log_create("com.apple.amp.iTunesCloud", "Default");
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543362;
    uint64_t v9 = self;
    _os_log_impl(&dword_1A2D01000, v4, OS_LOG_TYPE_DEFAULT, "%{public}@ got change notification", buf, 0xCu);
  }

  uint64_t v5 = [ICAsyncBlockOperation alloc];
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __112__ICLibraryAuthServiceClientTokenProvider__handleLibraryAuthServiceClientTokenDidChangeDistributedNotification___block_invoke;
  v7[3] = &unk_1E5ACA1A0;
  void v7[4] = self;
  uint64_t v6 = [(ICAsyncBlockOperation *)v5 initWithStartHandler:v7];
  [(ICAsyncBlockOperation *)v6 setName:@"com.apple.iTunesCloud.ICLibraryAuthServiceClientTokenProvider._handleLibraryAuthServiceClientTokenDidChangeDistributedNotification"];
  [(NSOperationQueue *)self->_operationQueue addOperation:v6];
}

void __112__ICLibraryAuthServiceClientTokenProvider__handleLibraryAuthServiceClientTokenDidChangeDistributedNotification___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v9 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  if (!*(unsigned char *)(*(void *)(a1 + 32) + 32))
  {
    int v4 = os_log_create("com.apple.amp.iTunesCloud", "Default");
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v5 = *(void *)(a1 + 32);
      int v7 = 138543362;
      uint64_t v8 = v5;
      _os_log_impl(&dword_1A2D01000, v4, OS_LOG_TYPE_DEFAULT, "%{public}@ Clearing token cache for external change notification", (uint8_t *)&v7, 0xCu);
    }

    [*(id *)(*(void *)(a1 + 32) + 24) removeAllObjects];
  }
  uint64_t v6 = [MEMORY[0x1E4F28EB8] defaultCenter];
  [v6 postNotificationName:@"ICLibraryAuthServiceClientTokenDidChangeNotification" object:0];

  [v3 finishWithError:0];
}

- (void)_refreshTokensForDSIDs:(id)a3 forExternalRequest:(BOOL)a4 completion:(id)a5
{
  BOOL v35 = a4;
  uint64_t v69 = *MEMORY[0x1E4F143B8];
  id v32 = a3;
  id v31 = a5;
  uint64_t v6 = os_log_create("com.apple.amp.iTunesCloud", "Default");
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543618;
    *(void *)&uint8_t buf[4] = self;
    *(_WORD *)&buf[12] = 2112;
    *(void *)&buf[14] = v32;
    _os_log_impl(&dword_1A2D01000, v6, OS_LOG_TYPE_DEFAULT, "%{public}@ Refreshing tokens for DSIDs %@", buf, 0x16u);
  }

  if (v35)
  {
    int v7 = os_log_create("com.apple.amp.iTunesCloud", "Default");
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v8 = [(ICLibraryAuthServiceClientTokenProvider *)self _loggableTokenCacheDictionary];
      *(_DWORD *)buf = 138543618;
      *(void *)&uint8_t buf[4] = self;
      *(_WORD *)&buf[12] = 2114;
      *(void *)&buf[14] = v8;
      _os_log_impl(&dword_1A2D01000, v7, OS_LOG_TYPE_DEFAULT, "%{public}@ Current token status: %{public}@", buf, 0x16u);
    }
    if (![(ICLibraryAuthServiceClientTokenProvider *)self _isPrivacyAcknowledgementRequiredForAccountDSID:0])
    {
      uint64_t v9 = +[ICDeviceInfo currentDeviceInfo];
      if ([v9 isAudioAccessory]) {
        uint64_t v10 = 2;
      }
      else {
        uint64_t v10 = 1;
      }

      goto LABEL_31;
    }
  }
  else if (![(ICLibraryAuthServiceClientTokenProvider *)self _isPrivacyAcknowledgementRequiredForAccountDSID:0])
  {
    uint64_t v10 = 1;
LABEL_31:
    uint64_t v27 = [ICStoreRequestContext alloc];
    v41[0] = MEMORY[0x1E4F143A8];
    v41[1] = 3221225472;
    v41[2] = __96__ICLibraryAuthServiceClientTokenProvider__refreshTokensForDSIDs_forExternalRequest_completion___block_invoke_2_79;
    v41[3] = &__block_descriptor_40_e31_v16__0__ICStoreRequestContext_8l;
    v41[4] = v10;
    uint64_t v28 = [(ICStoreRequestContext *)v27 initWithBlock:v41];
    uint64_t v29 = [[ICLibraryAuthServiceBulkClientTokenRequest alloc] initWithStoreRequestContext:v28 accountDSIDs:v32];
    v37[0] = MEMORY[0x1E4F143A8];
    v37[1] = 3221225472;
    v37[2] = __96__ICLibraryAuthServiceClientTokenProvider__refreshTokensForDSIDs_forExternalRequest_completion___block_invoke_3;
    v37[3] = &unk_1E5ACA178;
    v37[4] = self;
    id v38 = v32;
    id v39 = v31;
    uint64_t v40 = v10;
    id v30 = v31;
    [(ICLibraryAuthServiceBulkClientTokenRequest *)v29 performRequestWithResponseHandler:v37];

    goto LABEL_32;
  }
  id v11 = os_log_create("com.apple.amp.iTunesCloud", "Default");
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543362;
    *(void *)&uint8_t buf[4] = self;
    _os_log_impl(&dword_1A2D01000, v11, OS_LOG_TYPE_DEFAULT, "%{public}@ Not performing bulk refresh because privacy acknowledgement is required for the primary account", buf, 0xCu);
  }

  *(void *)buf = 0;
  *(void *)&buf[8] = buf;
  *(void *)&buf[16] = 0x3032000000;
  v66 = __Block_byref_object_copy__25223;
  v67 = __Block_byref_object_dispose__25224;
  id v68 = 0;
  v58[0] = 0;
  v58[1] = v58;
  v58[2] = 0x2020000000;
  char v59 = 0;
  uint64_t v12 = dispatch_group_create();
  queue = dispatch_queue_create("com.apple.iTunesCloud.ICLibraryAuthServiceClientTokenProvider._refreshTokensForDSIDs.resultsGroup", 0);
  uint64_t v13 = objc_msgSend(MEMORY[0x1E4F1CA60], "dictionaryWithCapacity:", objc_msgSend(v32, "count"));
  long long v56 = 0u;
  long long v57 = 0u;
  long long v54 = 0u;
  long long v55 = 0u;
  obuint64_t j = v32;
  uint64_t v14 = [obj countByEnumeratingWithState:&v54 objects:v64 count:16];
  if (v14)
  {
    uint64_t v15 = *(void *)v55;
    do
    {
      for (uint64_t i = 0; i != v14; ++i)
      {
        if (*(void *)v55 != v15) {
          objc_enumerationMutation(obj);
        }
        uint64_t v17 = *(void **)(*((void *)&v54 + 1) + 8 * i);
        __int16 v18 = os_log_create("com.apple.amp.iTunesCloud", "Default");
        if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
        {
          id v19 = ICCreateLoggableValueForDSID(v17);
          *(_DWORD *)uint64_t v60 = 138543618;
          v61 = self;
          __int16 v62 = 2114;
          v63 = v19;
          _os_log_impl(&dword_1A2D01000, v18, OS_LOG_TYPE_DEFAULT, "%{public}@ Fetching token for DSID %{public}@", v60, 0x16u);
        }
        if (v35)
        {
          id v20 = +[ICDeviceInfo currentDeviceInfo];
          if ([v20 isAudioAccessory]) {
            uint64_t v21 = 2;
          }
          else {
            uint64_t v21 = 1;
          }
        }
        else
        {
          uint64_t v21 = 1;
        }
        id v22 = [ICStoreRequestContext alloc];
        v53[0] = MEMORY[0x1E4F143A8];
        v53[1] = 3221225472;
        v53[2] = __96__ICLibraryAuthServiceClientTokenProvider__refreshTokensForDSIDs_forExternalRequest_completion___block_invoke;
        v53[3] = &unk_1E5ACA040;
        v53[4] = v17;
        v53[5] = v21;
        id v23 = [(ICStoreRequestContext *)v22 initWithBlock:v53];
        dispatch_group_enter(v12);
        v24 = [[ICLibraryAuthServiceClientTokenRequest alloc] initWithStoreRequestContext:v23];
        v47[0] = MEMORY[0x1E4F143A8];
        v47[1] = 3221225472;
        v47[2] = __96__ICLibraryAuthServiceClientTokenProvider__refreshTokensForDSIDs_forExternalRequest_completion___block_invoke_2;
        v47[3] = &unk_1E5ACA0B8;
        v47[4] = self;
        v47[5] = v17;
        uint64_t v48 = queue;
        char v51 = buf;
        id v49 = v13;
        v52 = v58;
        uint64_t v50 = v12;
        [(ICLibraryAuthServiceClientTokenRequest *)v24 performRequestWithResponseHandler:v47];
      }
      uint64_t v14 = [obj countByEnumeratingWithState:&v54 objects:v64 count:16];
    }
    while (v14);
  }

  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __96__ICLibraryAuthServiceClientTokenProvider__refreshTokensForDSIDs_forExternalRequest_completion___block_invoke_78;
  block[3] = &unk_1E5ACA0E0;
  id v44 = v31;
  v45 = v58;
  block[4] = self;
  id v43 = v13;
  char v46 = buf;
  id v25 = v31;
  id v26 = v13;
  dispatch_group_notify(v12, queue, block);

  _Block_object_dispose(v58, 8);
  _Block_object_dispose(buf, 8);

LABEL_32:
}

void __96__ICLibraryAuthServiceClientTokenProvider__refreshTokensForDSIDs_forExternalRequest_completion___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v3 = *(void *)(a1 + 32);
  id v6 = a2;
  int v4 = +[ICUserIdentity specificAccountWithDSID:v3];
  [v6 setIdentity:v4];

  uint64_t v5 = [(ICURLResponseAuthenticationProvider *)[ICStoreURLResponseAuthenticationProvider alloc] initWithUserInteractionLevel:*(void *)(a1 + 40)];
  [v6 setAuthenticationProvider:v5];

  [v6 setAllowsExpiredBags:1];
}

void __96__ICLibraryAuthServiceClientTokenProvider__refreshTokensForDSIDs_forExternalRequest_completion___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  uint64_t v27 = *MEMORY[0x1E4F143B8];
  unint64_t v5 = a3;
  uint64_t v6 = [a2 tokenResult];
  int v7 = (void *)v5;
  if (!(v5 | v6))
  {
    uint64_t v8 = os_log_create("com.apple.amp.iTunesCloud", "Default");
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v9 = *(void *)(a1 + 32);
      uint64_t v10 = ICCreateLoggableValueForDSID(*(void **)(a1 + 40));
      *(_DWORD *)buf = 138543618;
      uint64_t v24 = v9;
      __int16 v25 = 2114;
      id v26 = v10;
      _os_log_impl(&dword_1A2D01000, v8, OS_LOG_TYPE_DEFAULT, "%{public}@ Token result missing from response for DSID %{public}@", buf, 0x16u);
    }
    int v7 = objc_msgSend(MEMORY[0x1E4F28C58], "msv_errorWithDomain:code:debugDescription:", @"ICError", -7102, @"token result missing from response");
  }
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __96__ICLibraryAuthServiceClientTokenProvider__refreshTokensForDSIDs_forExternalRequest_completion___block_invoke_77;
  block[3] = &unk_1E5ACA090;
  long long v17 = *(_OWORD *)(a1 + 32);
  id v18 = (id)v6;
  id v19 = v7;
  uint64_t v21 = *(void *)(a1 + 72);
  id v11 = *(NSObject **)(a1 + 48);
  id v12 = *(id *)(a1 + 56);
  uint64_t v13 = *(void *)(a1 + 80);
  id v20 = v12;
  uint64_t v22 = v13;
  id v14 = v7;
  id v15 = (id)v6;
  dispatch_sync(v11, block);
  dispatch_group_leave(*(dispatch_group_t *)(a1 + 64));
}

uint64_t __96__ICLibraryAuthServiceClientTokenProvider__refreshTokensForDSIDs_forExternalRequest_completion___block_invoke_78(uint64_t a1)
{
  [*(id *)(a1 + 32) _commitCache];
  [*(id *)(a1 + 32) _updateRefreshTimer];
  if (*(unsigned char *)(*(void *)(*(void *)(a1 + 56) + 8) + 24))
  {
    v2 = [MEMORY[0x1E4F28C40] defaultCenter];
    [v2 postNotificationName:@"com.apple.iTunesCloud.ICLibraryAuthServiceClientTokenProvider._ICLibraryAuthServiceClientTokenDidChangeDistributedNotification" object:0];
  }
  int v4 = *(void **)(a1 + 40);
  uint64_t v3 = *(void *)(a1 + 48);
  if ([v4 count]) {
    uint64_t v5 = 0;
  }
  else {
    uint64_t v5 = *(void *)(*(void *)(*(void *)(a1 + 64) + 8) + 40);
  }
  uint64_t v6 = *(uint64_t (**)(uint64_t, void *, uint64_t))(v3 + 16);

  return v6(v3, v4, v5);
}

void __96__ICLibraryAuthServiceClientTokenProvider__refreshTokensForDSIDs_forExternalRequest_completion___block_invoke_2_79(uint64_t a1, void *a2)
{
  id v5 = a2;
  uint64_t v3 = +[ICUserIdentity activeAccount];
  [v5 setIdentity:v3];

  int v4 = [(ICURLResponseAuthenticationProvider *)[ICStoreURLResponseAuthenticationProvider alloc] initWithUserInteractionLevel:*(void *)(a1 + 32)];
  [v5 setAuthenticationProvider:v4];

  [v5 setAllowsExpiredBags:1];
  [v5 setPersonalizationStyle:2];
}

void __96__ICLibraryAuthServiceClientTokenProvider__refreshTokensForDSIDs_forExternalRequest_completion___block_invoke_3(uint64_t a1, void *a2, void *a3)
{
  uint64_t v73 = *MEMORY[0x1E4F143B8];
  id v31 = a2;
  id v32 = a3;
  if (v32)
  {
    id v5 = os_log_create("com.apple.amp.iTunesCloud", "Default");
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
    {
      uint64_t v6 = *(void *)(a1 + 32);
      uint64_t v7 = *(void *)(a1 + 40);
      *(_DWORD *)buf = 138543874;
      *(void *)&uint8_t buf[4] = v6;
      *(_WORD *)&buf[12] = 2112;
      *(void *)&buf[14] = v7;
      *(_WORD *)&buf[22] = 2114;
      uint64_t v69 = v32;
      _os_log_impl(&dword_1A2D01000, v5, OS_LOG_TYPE_ERROR, "%{public}@ Failed to fetch new tokens for DSIDs %@. err=%{public}@", buf, 0x20u);
    }

    long long v59 = 0u;
    long long v60 = 0u;
    long long v57 = 0u;
    long long v58 = 0u;
    id v8 = *(id *)(a1 + 40);
    uint64_t v9 = [v8 countByEnumeratingWithState:&v57 objects:v72 count:16];
    if (v9)
    {
      uint64_t v10 = *(void *)v58;
      do
      {
        for (uint64_t i = 0; i != v9; ++i)
        {
          if (*(void *)v58 != v10) {
            objc_enumerationMutation(v8);
          }
          [*(id *)(a1 + 32) _updateTokenCacheEntryForDSID:*(void *)(*((void *)&v57 + 1) + 8 * i) tokenResult:0 error:v32];
        }
        uint64_t v9 = [v8 countByEnumeratingWithState:&v57 objects:v72 count:16];
      }
      while (v9);
    }

    [*(id *)(a1 + 32) _commitCache];
    [*(id *)(a1 + 32) _updateRefreshTimer];
    (*(void (**)(void))(*(void *)(a1 + 48) + 16))();
  }
  else
  {
    *(void *)buf = 0;
    *(void *)&buf[8] = buf;
    *(void *)&buf[16] = 0x3032000000;
    uint64_t v69 = __Block_byref_object_copy__25223;
    v70 = __Block_byref_object_dispose__25224;
    id v71 = 0;
    v55[0] = 0;
    v55[1] = v55;
    v55[2] = 0x2020000000;
    char v56 = 0;
    id v12 = dispatch_group_create();
    queue = dispatch_queue_create("com.apple.iTunesCloud.ICLibraryAuthServiceClientTokenProvider._refreshTokensForDSIDs.resultsGroup", 0);
    uint64_t v13 = objc_msgSend(MEMORY[0x1E4F1CA60], "dictionaryWithCapacity:", objc_msgSend(*(id *)(a1 + 40), "count"));
    long long v53 = 0u;
    long long v54 = 0u;
    long long v51 = 0u;
    long long v52 = 0u;
    obuint64_t j = *(id *)(a1 + 40);
    uint64_t v14 = [obj countByEnumeratingWithState:&v51 objects:v67 count:16];
    if (v14)
    {
      uint64_t v15 = *(void *)v52;
      do
      {
        for (uint64_t j = 0; j != v14; ++j)
        {
          if (*(void *)v52 != v15) {
            objc_enumerationMutation(obj);
          }
          uint64_t v17 = *(void *)(*((void *)&v51 + 1) + 8 * j);
          dispatch_group_enter(v12);
          id v18 = [v31 tokenResultForAccountDSID:v17];
          id v19 = os_log_create("com.apple.amp.iTunesCloud", "Default");
          BOOL v20 = os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT);
          if (v18)
          {
            if (v20)
            {
              uint64_t v21 = *(void *)(a1 + 32);
              *(_DWORD *)v61 = 138543874;
              uint64_t v62 = v21;
              __int16 v63 = 2112;
              uint64_t v64 = v17;
              __int16 v65 = 2114;
              v66 = v18;
              _os_log_impl(&dword_1A2D01000, v19, OS_LOG_TYPE_DEFAULT, "%{public}@ fetched new token result for DSID %@: %{public}@", v61, 0x20u);
            }

            block[0] = MEMORY[0x1E4F143A8];
            block[1] = 3221225472;
            block[2] = __96__ICLibraryAuthServiceClientTokenProvider__refreshTokensForDSIDs_forExternalRequest_completion___block_invoke_85;
            block[3] = &unk_1E5ACA150;
            id v39 = v13;
            id v40 = v18;
            uint64_t v41 = v17;
            uint64_t v42 = *(void *)(a1 + 32);
            id v43 = v55;
            dispatch_sync(queue, block);
            dispatch_group_leave(v12);
          }
          else
          {
            if (v20)
            {
              uint64_t v22 = *(void *)(a1 + 32);
              *(_DWORD *)v61 = 138543618;
              uint64_t v62 = v22;
              __int16 v63 = 2112;
              uint64_t v64 = v17;
              _os_log_impl(&dword_1A2D01000, v19, OS_LOG_TYPE_DEFAULT, "%{public}@ No token result for DSID %@ - attempting to fetch it individually", v61, 0x16u);
            }

            id v23 = [ICStoreRequestContext alloc];
            v50[0] = MEMORY[0x1E4F143A8];
            v50[1] = 3221225472;
            v50[2] = __96__ICLibraryAuthServiceClientTokenProvider__refreshTokensForDSIDs_forExternalRequest_completion___block_invoke_82;
            v50[3] = &unk_1E5ACA040;
            uint64_t v24 = *(void *)(a1 + 56);
            v50[4] = v17;
            v50[5] = v24;
            __int16 v25 = [(ICStoreRequestContext *)v23 initWithBlock:v50];
            id v26 = [[ICLibraryAuthServiceClientTokenRequest alloc] initWithStoreRequestContext:v25];
            v44[0] = MEMORY[0x1E4F143A8];
            v44[1] = 3221225472;
            v44[2] = __96__ICLibraryAuthServiceClientTokenProvider__refreshTokensForDSIDs_forExternalRequest_completion___block_invoke_2_83;
            v44[3] = &unk_1E5ACA0B8;
            v44[4] = *(void *)(a1 + 32);
            v44[5] = v17;
            v45 = queue;
            uint64_t v48 = buf;
            id v46 = v13;
            id v49 = v55;
            id v47 = v12;
            [(ICLibraryAuthServiceClientTokenRequest *)v26 performRequestWithResponseHandler:v44];
          }
        }
        uint64_t v14 = [obj countByEnumeratingWithState:&v51 objects:v67 count:16];
      }
      while (v14);
    }

    v33[0] = MEMORY[0x1E4F143A8];
    v33[1] = 3221225472;
    v33[2] = __96__ICLibraryAuthServiceClientTokenProvider__refreshTokensForDSIDs_forExternalRequest_completion___block_invoke_2_86;
    v33[3] = &unk_1E5ACA0E0;
    v33[4] = *(void *)(a1 + 32);
    BOOL v36 = v55;
    id v27 = *(id *)(a1 + 48);
    id v34 = v13;
    id v35 = v27;
    long long v37 = buf;
    id v28 = v13;
    dispatch_group_notify(v12, queue, v33);

    _Block_object_dispose(v55, 8);
    _Block_object_dispose(buf, 8);
  }
}

void __96__ICLibraryAuthServiceClientTokenProvider__refreshTokensForDSIDs_forExternalRequest_completion___block_invoke_82(uint64_t a1, void *a2)
{
  uint64_t v3 = *(void *)(a1 + 32);
  id v6 = a2;
  int v4 = +[ICUserIdentity specificAccountWithDSID:v3];
  [v6 setIdentity:v4];

  id v5 = [(ICURLResponseAuthenticationProvider *)[ICStoreURLResponseAuthenticationProvider alloc] initWithUserInteractionLevel:*(void *)(a1 + 40)];
  [v6 setAuthenticationProvider:v5];

  [v6 setAllowsExpiredBags:1];
}

void __96__ICLibraryAuthServiceClientTokenProvider__refreshTokensForDSIDs_forExternalRequest_completion___block_invoke_2_83(uint64_t a1, void *a2, void *a3)
{
  uint64_t v30 = *MEMORY[0x1E4F143B8];
  unint64_t v5 = a3;
  uint64_t v6 = [a2 tokenResult];
  uint64_t v7 = (void *)v5;
  if (!(v5 | v6))
  {
    id v8 = os_log_create("com.apple.amp.iTunesCloud", "Default");
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v9 = *(void *)(a1 + 32);
      uint64_t v10 = *(void *)(a1 + 40);
      *(_DWORD *)buf = 138543618;
      uint64_t v27 = v9;
      __int16 v28 = 2112;
      uint64_t v29 = v10;
      _os_log_impl(&dword_1A2D01000, v8, OS_LOG_TYPE_DEFAULT, "%{public}@ Token result missing from response for DSID %@", buf, 0x16u);
    }

    uint64_t v7 = [MEMORY[0x1E4F28C58] errorWithDomain:@"ICError" code:-7102 userInfo:0];
  }
  v18[0] = MEMORY[0x1E4F143A8];
  v18[1] = 3221225472;
  v18[2] = __96__ICLibraryAuthServiceClientTokenProvider__refreshTokensForDSIDs_forExternalRequest_completion___block_invoke_84;
  v18[3] = &unk_1E5ACA128;
  long long v19 = *(_OWORD *)(a1 + 32);
  id v20 = (id)v6;
  id v21 = (id)v5;
  uint64_t v11 = *(void *)(a1 + 72);
  id v22 = v7;
  uint64_t v24 = v11;
  id v12 = *(NSObject **)(a1 + 48);
  id v13 = *(id *)(a1 + 56);
  uint64_t v14 = *(void *)(a1 + 80);
  id v23 = v13;
  uint64_t v25 = v14;
  id v15 = v7;
  id v16 = (id)v5;
  id v17 = (id)v6;
  dispatch_sync(v12, v18);
  dispatch_group_leave(*(dispatch_group_t *)(a1 + 64));
}

uint64_t __96__ICLibraryAuthServiceClientTokenProvider__refreshTokensForDSIDs_forExternalRequest_completion___block_invoke_85(uint64_t a1)
{
  [*(id *)(a1 + 32) setObject:*(void *)(a1 + 40) forKey:*(void *)(a1 + 48)];
  uint64_t result = [*(id *)(a1 + 56) _updateTokenCacheEntryForDSID:*(void *)(a1 + 48) tokenResult:*(void *)(a1 + 40) error:0];
  *(unsigned char *)(*(void *)(*(void *)(a1 + 64) + 8) + 24) = 1;
  return result;
}

uint64_t __96__ICLibraryAuthServiceClientTokenProvider__refreshTokensForDSIDs_forExternalRequest_completion___block_invoke_2_86(uint64_t a1)
{
  [*(id *)(a1 + 32) _commitCache];
  [*(id *)(a1 + 32) _updateRefreshTimer];
  if (*(unsigned char *)(*(void *)(*(void *)(a1 + 56) + 8) + 24))
  {
    v2 = [MEMORY[0x1E4F28C40] defaultCenter];
    [v2 postNotificationName:@"com.apple.iTunesCloud.ICLibraryAuthServiceClientTokenProvider._ICLibraryAuthServiceClientTokenDidChangeDistributedNotification" object:0];
  }
  int v4 = *(void **)(a1 + 40);
  uint64_t v3 = *(void *)(a1 + 48);
  if ([v4 count]) {
    uint64_t v5 = 0;
  }
  else {
    uint64_t v5 = *(void *)(*(void *)(*(void *)(a1 + 64) + 8) + 40);
  }
  uint64_t v6 = *(uint64_t (**)(uint64_t, void *, uint64_t))(v3 + 16);

  return v6(v3, v4, v5);
}

void __96__ICLibraryAuthServiceClientTokenProvider__refreshTokensForDSIDs_forExternalRequest_completion___block_invoke_84(uint64_t a1)
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  [*(id *)(a1 + 32) _updateTokenCacheEntryForDSID:*(void *)(a1 + 40) tokenResult:*(void *)(a1 + 48) error:*(void *)(a1 + 56)];
  uint64_t v2 = *(void *)(a1 + 64);
  uint64_t v3 = os_log_create("com.apple.amp.iTunesCloud", "Default");
  int v4 = v3;
  if (v2)
  {
    if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
    {
      uint64_t v5 = *(void *)(a1 + 32);
      uint64_t v6 = *(void *)(a1 + 40);
      uint64_t v7 = *(void *)(a1 + 56);
      int v11 = 138543874;
      uint64_t v12 = v5;
      __int16 v13 = 2112;
      uint64_t v14 = v6;
      __int16 v15 = 2114;
      uint64_t v16 = v7;
      _os_log_impl(&dword_1A2D01000, v4, OS_LOG_TYPE_ERROR, "%{public}@ Failed to fetch new token for DSID %@. err=%{public}@", (uint8_t *)&v11, 0x20u);
    }

    objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 80) + 8) + 40), *(id *)(a1 + 64));
  }
  else
  {
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v8 = *(void *)(a1 + 32);
      uint64_t v9 = *(void *)(a1 + 40);
      uint64_t v10 = *(void *)(a1 + 48);
      int v11 = 138543874;
      uint64_t v12 = v8;
      __int16 v13 = 2112;
      uint64_t v14 = v9;
      __int16 v15 = 2114;
      uint64_t v16 = v10;
      _os_log_impl(&dword_1A2D01000, v4, OS_LOG_TYPE_DEFAULT, "%{public}@ fetched new token result for DSID %@: %{public}@", (uint8_t *)&v11, 0x20u);
    }

    [*(id *)(a1 + 72) setObject:*(void *)(a1 + 48) forKey:*(void *)(a1 + 40)];
    *(unsigned char *)(*(void *)(*(void *)(a1 + 88) + 8) + 24) = 1;
  }
}

void __96__ICLibraryAuthServiceClientTokenProvider__refreshTokensForDSIDs_forExternalRequest_completion___block_invoke_77(uint64_t a1)
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  [*(id *)(a1 + 32) _updateTokenCacheEntryForDSID:*(void *)(a1 + 40) tokenResult:*(void *)(a1 + 48) error:*(void *)(a1 + 56)];
  uint64_t v2 = *(void *)(a1 + 56);
  uint64_t v3 = os_log_create("com.apple.amp.iTunesCloud", "Default");
  int v4 = v3;
  if (v2)
  {
    if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
    {
      uint64_t v5 = *(void *)(a1 + 32);
      uint64_t v6 = ICCreateLoggableValueForDSID(*(void **)(a1 + 40));
      uint64_t v7 = *(void *)(a1 + 56);
      int v11 = 138543874;
      uint64_t v12 = v5;
      __int16 v13 = 2114;
      uint64_t v14 = v6;
      __int16 v15 = 2114;
      uint64_t v16 = v7;
      _os_log_impl(&dword_1A2D01000, v4, OS_LOG_TYPE_ERROR, "%{public}@ Failed to fetch new token for DSID %{public}@. err=%{public}@", (uint8_t *)&v11, 0x20u);
    }
    objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 72) + 8) + 40), *(id *)(a1 + 56));
  }
  else
  {
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v8 = *(void *)(a1 + 32);
      uint64_t v9 = ICCreateLoggableValueForDSID(*(void **)(a1 + 40));
      uint64_t v10 = *(void *)(a1 + 48);
      int v11 = 138543874;
      uint64_t v12 = v8;
      __int16 v13 = 2114;
      uint64_t v14 = v9;
      __int16 v15 = 2114;
      uint64_t v16 = v10;
      _os_log_impl(&dword_1A2D01000, v4, OS_LOG_TYPE_DEFAULT, "%{public}@ fetched new token result for DSID %{public}@: %{public}@", (uint8_t *)&v11, 0x20u);
    }
    [*(id *)(a1 + 64) setObject:*(void *)(a1 + 48) forKey:*(void *)(a1 + 40)];
    *(unsigned char *)(*(void *)(*(void *)(a1 + 80) + 8) + 24) = 1;
  }
}

- (void)_refreshTokenForDSID:(id)a3 forExternalRequest:(BOOL)a4 completion:(id)a5
{
  BOOL v6 = a4;
  uint64_t v31 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = a5;
  uint64_t v10 = os_log_create("com.apple.amp.iTunesCloud", "Default");
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543618;
    __int16 v28 = self;
    __int16 v29 = 2112;
    id v30 = v8;
    _os_log_impl(&dword_1A2D01000, v10, OS_LOG_TYPE_DEFAULT, "%{public}@ Refreshing token for DSID %@", buf, 0x16u);
  }

  if (v6)
  {
    int v11 = os_log_create("com.apple.amp.iTunesCloud", "Default");
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v12 = [(ICLibraryAuthServiceClientTokenProvider *)self _loggableTokenCacheDictionary];
      *(_DWORD *)buf = 138543618;
      __int16 v28 = self;
      __int16 v29 = 2114;
      id v30 = v12;
      _os_log_impl(&dword_1A2D01000, v11, OS_LOG_TYPE_DEFAULT, "%{public}@ Current token status: %{public}@", buf, 0x16u);
    }
    if (![(ICLibraryAuthServiceClientTokenProvider *)self _isPrivacyAcknowledgementRequiredForAccountDSID:v8])
    {
      __int16 v13 = +[ICDeviceInfo currentDeviceInfo];
      if ([v13 isAudioAccessory]) {
        uint64_t v14 = 2;
      }
      else {
        uint64_t v14 = 1;
      }

      goto LABEL_16;
    }
  }
  else if (![(ICLibraryAuthServiceClientTokenProvider *)self _isPrivacyAcknowledgementRequiredForAccountDSID:v8])
  {
    uint64_t v14 = 1;
LABEL_16:
    uint64_t v17 = [ICStoreRequestContext alloc];
    v24[0] = MEMORY[0x1E4F143A8];
    v24[1] = 3221225472;
    v24[2] = __94__ICLibraryAuthServiceClientTokenProvider__refreshTokenForDSID_forExternalRequest_completion___block_invoke;
    v24[3] = &unk_1E5ACA040;
    id v18 = v8;
    id v25 = v18;
    uint64_t v26 = v14;
    long long v19 = [(ICStoreRequestContext *)v17 initWithBlock:v24];
    id v20 = [[ICLibraryAuthServiceClientTokenRequest alloc] initWithStoreRequestContext:v19];
    v21[0] = MEMORY[0x1E4F143A8];
    v21[1] = 3221225472;
    void v21[2] = __94__ICLibraryAuthServiceClientTokenProvider__refreshTokenForDSID_forExternalRequest_completion___block_invoke_2;
    v21[3] = &unk_1E5ACA068;
    void v21[4] = self;
    id v22 = v18;
    id v23 = v9;
    [(ICLibraryAuthServiceClientTokenRequest *)v20 performRequestWithResponseHandler:v21];

    uint64_t v16 = v25;
    goto LABEL_17;
  }
  __int16 v15 = os_log_create("com.apple.amp.iTunesCloud", "Default");
  if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543618;
    __int16 v28 = self;
    __int16 v29 = 2112;
    id v30 = v8;
    _os_log_impl(&dword_1A2D01000, v15, OS_LOG_TYPE_DEFAULT, "%{public}@ Not refreshing token for DSID %@ because privacy acknowledgement is required", buf, 0x16u);
  }

  uint64_t v16 = [MEMORY[0x1E4F28C58] errorWithDomain:@"ICError" code:-7007 userInfo:0];
  [(ICLibraryAuthServiceClientTokenProvider *)self _updateTokenCacheEntryForDSID:v8 tokenResult:0 error:v16];
  [(ICLibraryAuthServiceClientTokenProvider *)self _commitCache];
  [(ICLibraryAuthServiceClientTokenProvider *)self _updateRefreshTimer];
  (*((void (**)(id, void, void *))v9 + 2))(v9, 0, v16);
LABEL_17:
}

void __94__ICLibraryAuthServiceClientTokenProvider__refreshTokenForDSID_forExternalRequest_completion___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v3 = *(void *)(a1 + 32);
  id v6 = a2;
  int v4 = +[ICUserIdentity specificAccountWithDSID:v3];
  [v6 setIdentity:v4];

  uint64_t v5 = [(ICURLResponseAuthenticationProvider *)[ICStoreURLResponseAuthenticationProvider alloc] initWithUserInteractionLevel:*(void *)(a1 + 40)];
  [v6 setAuthenticationProvider:v5];

  [v6 setAllowsExpiredBags:1];
  [v6 setPersonalizationStyle:2];
}

void __94__ICLibraryAuthServiceClientTokenProvider__refreshTokenForDSID_forExternalRequest_completion___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  unint64_t v5 = a3;
  uint64_t v6 = [a2 tokenResult];
  uint64_t v7 = (void *)v5;
  if (!(v5 | v6))
  {
    id v8 = os_log_create("com.apple.amp.iTunesCloud", "Default");
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v9 = *(void *)(a1 + 32);
      uint64_t v10 = *(void *)(a1 + 40);
      int v15 = 138543618;
      uint64_t v16 = v9;
      __int16 v17 = 2112;
      uint64_t v18 = v10;
      _os_log_impl(&dword_1A2D01000, v8, OS_LOG_TYPE_DEFAULT, "%{public}@ Token result missing from response for DSID %@", (uint8_t *)&v15, 0x16u);
    }

    uint64_t v7 = [MEMORY[0x1E4F28C58] errorWithDomain:@"ICError" code:-7102 userInfo:0];
  }
  int v11 = os_log_create("com.apple.amp.iTunesCloud", "Default");
  if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
  {
    uint64_t v12 = *(void *)(a1 + 32);
    uint64_t v13 = *(void *)(a1 + 40);
    int v15 = 138544130;
    uint64_t v16 = v12;
    __int16 v17 = 2112;
    uint64_t v18 = v13;
    __int16 v19 = 2114;
    id v20 = v7;
    __int16 v21 = 2112;
    uint64_t v22 = v6;
    _os_log_impl(&dword_1A2D01000, v11, OS_LOG_TYPE_ERROR, "%{public}@ Finished fetching new token for DSID %@. err=%{public}@. token=%@", (uint8_t *)&v15, 0x2Au);
  }

  [*(id *)(a1 + 32) _updateTokenCacheEntryForDSID:*(void *)(a1 + 40) tokenResult:v6 error:v7];
  [*(id *)(a1 + 32) _commitCache];
  [*(id *)(a1 + 32) _updateRefreshTimer];
  if (!v7)
  {
    uint64_t v14 = [MEMORY[0x1E4F28C40] defaultCenter];
    [v14 postNotificationName:@"com.apple.iTunesCloud.ICLibraryAuthServiceClientTokenProvider._ICLibraryAuthServiceClientTokenDidChangeDistributedNotification" object:0];
  }
  (*(void (**)(void))(*(void *)(a1 + 48) + 16))();
}

- (void)getAllTokenStatusForAssistantForcingRefresh:(BOOL)a3 completion:(id)a4
{
  BOOL v4 = a3;
  uint64_t v44 = *MEMORY[0x1E4F143B8];
  unint64_t v5 = (void (**)(id, void, id))a4;
  uint64_t v6 = +[ICUserIdentityStore defaultIdentityStore];
  uint64_t v7 = [v6 _unsafeBackend];

  id v38 = 0;
  id v8 = [v7 allStoreAccountsWithError:&v38];
  id v9 = v38;
  if (v9)
  {
    uint64_t v10 = os_log_create("com.apple.amp.iTunesCloud", "Default");
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138543618;
      uint64_t v41 = self;
      __int16 v42 = 2114;
      id v43 = v9;
      _os_log_impl(&dword_1A2D01000, v10, OS_LOG_TYPE_ERROR, "%{public}@ Failed to gather DSIDs from the account store to fetch tokens for. err=%{public}@", buf, 0x16u);
    }

    v5[2](v5, 0, v9);
  }
  else
  {
    BOOL v24 = v4;
    uint64_t v26 = v7;
    uint64_t v27 = v5;
    int v11 = [MEMORY[0x1E4F1CA80] set];
    __int16 v28 = [MEMORY[0x1E4F1CA60] dictionary];
    long long v34 = 0u;
    long long v35 = 0u;
    long long v36 = 0u;
    long long v37 = 0u;
    id v25 = v8;
    id v12 = v8;
    uint64_t v13 = [v12 countByEnumeratingWithState:&v34 objects:v39 count:16];
    if (v13)
    {
      uint64_t v14 = v13;
      uint64_t v15 = *(void *)v35;
      do
      {
        for (uint64_t i = 0; i != v14; ++i)
        {
          if (*(void *)v35 != v15) {
            objc_enumerationMutation(v12);
          }
          __int16 v17 = *(void **)(*((void *)&v34 + 1) + 8 * i);
          if ([v17 isAuthenticated]
            && (objc_msgSend(v17, "ic_homeUserIdentifiers"),
                uint64_t v18 = objc_claimAutoreleasedReturnValue(),
                uint64_t v19 = [v18 count],
                v18,
                v19))
          {
            id v20 = objc_msgSend(v17, "ic_DSID");
            [v11 addObject:v20];

            __int16 v21 = objc_msgSend(v17, "ic_DSID");
            [v28 setObject:v17 forKeyedSubscript:v21];
          }
          else
          {
            __int16 v21 = os_log_create("com.apple.amp.iTunesCloud", "Default");
            if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
            {
              *(_DWORD *)buf = 138543618;
              uint64_t v41 = self;
              __int16 v42 = 2112;
              id v43 = v17;
              _os_log_impl(&dword_1A2D01000, v21, OS_LOG_TYPE_DEFAULT, "%{public}@ Skipping account %@ because either the DSID is missing or it has no home user ids", buf, 0x16u);
            }
          }
        }
        uint64_t v14 = [v12 countByEnumeratingWithState:&v34 objects:v39 count:16];
      }
      while (v14);
    }

    if ([v11 count])
    {
      v30[0] = MEMORY[0x1E4F143A8];
      v30[1] = 3221225472;
      v30[2] = __98__ICLibraryAuthServiceClientTokenProvider_getAllTokenStatusForAssistantForcingRefresh_completion___block_invoke;
      v30[3] = &unk_1E5ACCA00;
      v30[4] = self;
      unint64_t v5 = v27;
      id v33 = v27;
      id v31 = v11;
      uint64_t v22 = v28;
      id v32 = v28;
      [(ICLibraryAuthServiceClientTokenProvider *)self getTokenStatusForDSIDs:v31 forcingRefresh:v24 completion:v30];

      id v9 = 0;
      uint64_t v7 = v26;
      id v8 = v25;
    }
    else
    {
      uint64_t v23 = [MEMORY[0x1E4F1CA60] dictionary];
      unint64_t v5 = v27;
      ((void (**)(id, void *, id))v27)[2](v27, v23, 0);

      id v9 = 0;
      uint64_t v7 = v26;
      id v8 = v25;
      uint64_t v22 = v28;
    }
  }
}

void __98__ICLibraryAuthServiceClientTokenProvider_getAllTokenStatusForAssistantForcingRefresh_completion___block_invoke(uint64_t a1, void *a2, void *a3)
{
  uint64_t v65 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  id v28 = a3;
  if (v28)
  {
    uint64_t v6 = os_log_create("com.apple.amp.iTunesCloud", "Default");
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    {
      uint64_t v7 = *(void *)(a1 + 32);
      *(_DWORD *)buf = 138543618;
      *(void *)&uint8_t buf[4] = v7;
      *(_WORD *)&buf[12] = 2114;
      *(void *)&buf[14] = v28;
      _os_log_impl(&dword_1A2D01000, v6, OS_LOG_TYPE_ERROR, "%{public}@ Failed to fetch all client tokens. err=%{public}@", buf, 0x16u);
    }

    (*(void (**)(void))(*(void *)(a1 + 56) + 16))();
  }
  else
  {
    *(void *)buf = 0;
    *(void *)&buf[8] = buf;
    *(void *)&buf[16] = 0x3032000000;
    uint64_t v62 = __Block_byref_object_copy__25223;
    __int16 v63 = __Block_byref_object_dispose__25224;
    id v64 = 0;
    queue = dispatch_queue_create("com.apple.iTunesCloud.ICLibraryAuthServiceClientTokenProvider.allTokens", 0);
    id v8 = dispatch_group_create();
    long long v34 = objc_msgSend(MEMORY[0x1E4F1CA60], "dictionaryWithCapacity:", objc_msgSend(v5, "count"));
    long long v53 = 0u;
    long long v54 = 0u;
    long long v51 = 0u;
    long long v52 = 0u;
    obuint64_t j = *(id *)(a1 + 40);
    uint64_t v9 = [obj countByEnumeratingWithState:&v51 objects:v60 count:16];
    if (v9)
    {
      uint64_t v30 = *(void *)v52;
      do
      {
        for (uint64_t i = 0; i != v9; ++i)
        {
          if (*(void *)v52 != v30) {
            objc_enumerationMutation(obj);
          }
          uint64_t v10 = *(void *)(*((void *)&v51 + 1) + 8 * i);
          long long v36 = [v5 objectForKey:v10];
          if (!v36
            || ([v36 tokenResult],
                int v11 = objc_claimAutoreleasedReturnValue(),
                [v11 token],
                id v12 = objc_claimAutoreleasedReturnValue(),
                BOOL v13 = v12 == 0,
                v12,
                v11,
                v13))
          {
            BOOL v24 = os_log_create("com.apple.amp.iTunesCloud", "Default");
            id v31 = v24;
            if (os_log_type_enabled(v24, OS_LOG_TYPE_ERROR))
            {
              uint64_t v25 = *(void *)(a1 + 32);
              *(_DWORD *)char v56 = 138543618;
              uint64_t v57 = v25;
              __int16 v58 = 2112;
              uint64_t v59 = v10;
              _os_log_impl(&dword_1A2D01000, v24, OS_LOG_TYPE_ERROR, "%{public}@ No token result for DSID %@ in bulk response - this will be treated as an error", v56, 0x16u);
            }
          }
          else
          {
            id v31 = [*(id *)(a1 + 48) objectForKey:v10];
            uint64_t v14 = objc_msgSend(v31, "ic_homeUserIdentifiers");
            uint64_t v15 = os_log_create("com.apple.amp.iTunesCloud", "Default");
            if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
            {
              uint64_t v16 = *(void *)(a1 + 32);
              uint64_t v17 = [v14 count];
              *(_DWORD *)char v56 = 138543618;
              uint64_t v57 = v16;
              __int16 v58 = 2050;
              uint64_t v59 = v17;
              _os_log_impl(&dword_1A2D01000, v15, OS_LOG_TYPE_DEFAULT, "%{public}@ iterating through home %{public}lu identifiers", v56, 0x16u);
            }

            long long v49 = 0u;
            long long v50 = 0u;
            long long v47 = 0u;
            long long v48 = 0u;
            id v33 = v14;
            uint64_t v18 = [v33 countByEnumeratingWithState:&v47 objects:v55 count:16];
            if (v18)
            {
              uint64_t v19 = *(void *)v48;
              do
              {
                for (uint64_t j = 0; j != v18; ++j)
                {
                  if (*(void *)v48 != v19) {
                    objc_enumerationMutation(v33);
                  }
                  __int16 v21 = *(void **)(*((void *)&v47 + 1) + 8 * j);
                  dispatch_group_enter(v8);
                  uint64_t v22 = *(void **)(*(void *)(a1 + 32) + 64);
                  uint64_t v23 = [v21 UUIDString];
                  v41[0] = MEMORY[0x1E4F143A8];
                  v41[1] = 3221225472;
                  v41[2] = __98__ICLibraryAuthServiceClientTokenProvider_getAllTokenStatusForAssistantForcingRefresh_completion___block_invoke_65;
                  v41[3] = &unk_1E5AC9E88;
                  v41[4] = *(void *)(a1 + 32);
                  void v41[5] = v21;
                  id v46 = buf;
                  __int16 v42 = queue;
                  id v43 = v34;
                  id v44 = v36;
                  v45 = v8;
                  [v22 getSharedUserIdForHomeUserId:v23 completion:v41];
                }
                uint64_t v18 = [v33 countByEnumeratingWithState:&v47 objects:v55 count:16];
              }
              while (v18);
            }
          }
        }
        uint64_t v9 = [obj countByEnumeratingWithState:&v51 objects:v60 count:16];
      }
      while (v9);
    }

    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __98__ICLibraryAuthServiceClientTokenProvider_getAllTokenStatusForAssistantForcingRefresh_completion___block_invoke_2;
    block[3] = &unk_1E5ACB0E8;
    id v26 = *(id *)(a1 + 56);
    id v38 = v34;
    id v39 = v26;
    id v40 = buf;
    id v27 = v34;
    dispatch_group_notify(v8, queue, block);

    _Block_object_dispose(buf, 8);
  }
}

void __98__ICLibraryAuthServiceClientTokenProvider_getAllTokenStatusForAssistantForcingRefresh_completion___block_invoke_65(uint64_t a1, void *a2, void *a3)
{
  uint64_t v29 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  id v6 = a3;
  uint64_t v7 = os_log_create("com.apple.amp.iTunesCloud", "Default");
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v8 = *(void *)(a1 + 32);
    uint64_t v9 = *(void *)(a1 + 40);
    *(_DWORD *)buf = 138543874;
    uint64_t v22 = v8;
    __int16 v23 = 2114;
    uint64_t v24 = v9;
    __int16 v25 = 2114;
    id v26 = v6;
    _os_log_impl(&dword_1A2D01000, v7, OS_LOG_TYPE_DEFAULT, "%{public}@ Completed getting user ids for home user id %{public}@. Err=%{public}@", buf, 0x20u);
  }

  if (!v5 || v6)
  {
    id v12 = os_log_create("com.apple.amp.iTunesCloud", "Default");
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
    {
      uint64_t v13 = *(void *)(a1 + 32);
      uint64_t v14 = *(void *)(a1 + 40);
      *(_DWORD *)buf = 138544131;
      uint64_t v22 = v13;
      __int16 v23 = 2114;
      uint64_t v24 = v14;
      __int16 v25 = 2113;
      id v26 = v5;
      __int16 v27 = 2114;
      id v28 = v6;
      _os_log_impl(&dword_1A2D01000, v12, OS_LOG_TYPE_ERROR, "%{public}@ failed fetching siri shared user id for homeIdentifier %{public}@:%{private}@. err=%{public}@", buf, 0x2Au);
    }

    uint64_t v15 = *(void *)(*(void *)(a1 + 80) + 8);
    id v16 = v6;
    int v11 = *(void **)(v15 + 40);
    *(void *)(v15 + 40) = v16;
  }
  else
  {
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __98__ICLibraryAuthServiceClientTokenProvider_getAllTokenStatusForAssistantForcingRefresh_completion___block_invoke_66;
    block[3] = &unk_1E5ACD5C8;
    uint64_t v10 = *(NSObject **)(a1 + 48);
    id v18 = *(id *)(a1 + 56);
    id v19 = v5;
    id v20 = *(id *)(a1 + 64);
    dispatch_sync(v10, block);

    int v11 = v18;
  }

  dispatch_group_leave(*(dispatch_group_t *)(a1 + 72));
}

uint64_t __98__ICLibraryAuthServiceClientTokenProvider_getAllTokenStatusForAssistantForcingRefresh_completion___block_invoke_2(void *a1)
{
  return (*(uint64_t (**)(void, void, void))(a1[5] + 16))(a1[5], a1[4], *(void *)(*(void *)(a1[6] + 8) + 40));
}

uint64_t __98__ICLibraryAuthServiceClientTokenProvider_getAllTokenStatusForAssistantForcingRefresh_completion___block_invoke_66(uint64_t a1)
{
  return [*(id *)(a1 + 32) setObject:*(void *)(a1 + 48) forKeyedSubscript:*(void *)(a1 + 40)];
}

- (void)getTokenStatusForcingRefresh:(BOOL)a3 completion:(id)a4
{
  BOOL v4 = a3;
  uint64_t v28 = *MEMORY[0x1E4F143B8];
  id v6 = (void (**)(id, void, id))a4;
  uint64_t v7 = +[ICUserIdentityStore defaultIdentityStore];
  uint64_t v8 = +[ICUserIdentity activeAccount];
  id v21 = 0;
  uint64_t v9 = [v7 getPropertiesForUserIdentity:v8 error:&v21];
  id v10 = v21;

  if (v10)
  {
    int v11 = os_log_create("com.apple.amp.iTunesCloud", "Default");
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138543618;
      __int16 v25 = self;
      __int16 v26 = 2114;
      id v27 = v10;
      _os_log_impl(&dword_1A2D01000, v11, OS_LOG_TYPE_DEFAULT, "%{public}@ failed to get identity properties for token request. err=%{public}@", buf, 0x16u);
    }

    v6[2](v6, 0, v10);
  }
  else
  {
    id v12 = [v9 DSID];
    if (v12)
    {
      uint64_t v13 = [MEMORY[0x1E4F1CAD0] setWithObject:v12];
      v18[0] = MEMORY[0x1E4F143A8];
      v18[1] = 3221225472;
      v18[2] = __83__ICLibraryAuthServiceClientTokenProvider_getTokenStatusForcingRefresh_completion___block_invoke;
      v18[3] = &unk_1E5ACA018;
      id v19 = v12;
      id v20 = v6;
      [(ICLibraryAuthServiceClientTokenProvider *)self getTokenStatusForDSIDs:v13 forcingRefresh:v4 completion:v18];

      uint64_t v14 = v19;
    }
    else
    {
      uint64_t v15 = os_log_create("com.apple.amp.iTunesCloud", "Default");
      if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138543362;
        __int16 v25 = self;
        _os_log_impl(&dword_1A2D01000, v15, OS_LOG_TYPE_DEFAULT, "%{public}@ not fetching library token because there's no active account", buf, 0xCu);
      }

      uint64_t v22 = *MEMORY[0x1E4F28228];
      id v16 = [NSString stringWithFormat:@"Unable to fetch library token [no DSID on active account] - properties=%@", v9];
      __int16 v23 = v16;
      uint64_t v14 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v23 forKeys:&v22 count:1];

      uint64_t v17 = [MEMORY[0x1E4F28C58] errorWithDomain:@"ICError" code:-7400 userInfo:v14];
      v6[2](v6, 0, v17);
    }
  }
}

void __83__ICLibraryAuthServiceClientTokenProvider_getTokenStatusForcingRefresh_completion___block_invoke(uint64_t a1, void *a2, void *a3)
{
  uint64_t v5 = *(void *)(a1 + 32);
  id v6 = a3;
  id v7 = [a2 objectForKey:v5];
  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
}

- (void)getTokenStatusForDSIDs:(id)a3 forcingRefresh:(BOOL)a4 completion:(id)a5
{
  uint64_t v25 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = a5;
  id v10 = os_log_create("com.apple.amp.iTunesCloud", "Default");
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543362;
    uint64_t v24 = self;
    _os_log_impl(&dword_1A2D01000, v10, OS_LOG_TYPE_DEFAULT, "%{public}@ Fetching token status", buf, 0xCu);
  }

  int v11 = [ICAsyncBlockOperation alloc];
  uint64_t v15 = MEMORY[0x1E4F143A8];
  uint64_t v16 = 3221225472;
  uint64_t v17 = __92__ICLibraryAuthServiceClientTokenProvider_getTokenStatusForDSIDs_forcingRefresh_completion___block_invoke;
  id v18 = &unk_1E5AC9F50;
  BOOL v22 = a4;
  id v19 = v8;
  id v20 = self;
  id v21 = v9;
  id v12 = v9;
  id v13 = v8;
  uint64_t v14 = [(ICAsyncBlockOperation *)v11 initWithStartHandler:&v15];
  [(ICAsyncBlockOperation *)v14 setName:@"com.apple.iTunesCloud.ICLibraryAuthServiceClientTokenProvider.addTokenResult", v15, v16, v17, v18];
  [(NSOperationQueue *)self->_operationQueue addOperation:v14];
}

void __92__ICLibraryAuthServiceClientTokenProvider_getTokenStatusForDSIDs_forcingRefresh_completion___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v40 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  BOOL v4 = [MEMORY[0x1E4F1CA60] dictionary];
  if (!*(unsigned char *)(a1 + 56))
  {
    long long v37 = 0u;
    long long v38 = 0u;
    long long v35 = 0u;
    long long v36 = 0u;
    id v5 = *(id *)(a1 + 32);
    uint64_t v6 = [v5 countByEnumeratingWithState:&v35 objects:v39 count:16];
    if (v6)
    {
      uint64_t v7 = v6;
      uint64_t v8 = *(void *)v36;
      do
      {
        for (uint64_t i = 0; i != v7; ++i)
        {
          if (*(void *)v36 != v8) {
            objc_enumerationMutation(v5);
          }
          uint64_t v10 = *(void *)(*((void *)&v35 + 1) + 8 * i);
          int v11 = [*(id *)(*(void *)(a1 + 40) + 24) objectForKey:v10];
          if (v11) {
            [v4 setObject:v11 forKey:v10];
          }
        }
        uint64_t v7 = [v5 countByEnumeratingWithState:&v35 objects:v39 count:16];
      }
      while (v7);
    }
  }
  uint64_t v12 = [v4 count];
  if (v12 == [*(id *)(a1 + 32) count]) {
    goto LABEL_13;
  }
  id v13 = *(unsigned char **)(a1 + 40);
  if (!v13[32])
  {
    v32[0] = MEMORY[0x1E4F143A8];
    v32[1] = 3221225472;
    v32[2] = __92__ICLibraryAuthServiceClientTokenProvider_getTokenStatusForDSIDs_forcingRefresh_completion___block_invoke_2;
    v32[3] = &unk_1E5ACD8E0;
    id v34 = *(id *)(a1 + 48);
    id v19 = v3;
    id v33 = v19;
    id v20 = [v13 _remoteObjectProxyWithErrorHandler:v32];
    uint64_t v21 = *(unsigned __int8 *)(a1 + 56);
    v29[0] = MEMORY[0x1E4F143A8];
    v29[1] = 3221225472;
    v29[2] = __92__ICLibraryAuthServiceClientTokenProvider_getTokenStatusForDSIDs_forcingRefresh_completion___block_invoke_3;
    v29[3] = &unk_1E5AC9FF0;
    uint64_t v22 = *(void *)(a1 + 32);
    __int16 v23 = *(void **)(a1 + 48);
    v29[4] = *(void *)(a1 + 40);
    id v31 = v23;
    id v30 = v19;
    [v20 getTokenStatusForDSIDs:v22 forcingRefresh:v21 completion:v29];

    id v18 = v34;
    goto LABEL_18;
  }
  if (*(unsigned char *)(a1 + 56))
  {
    uint64_t v14 = *(void **)(a1 + 32);
    v24[0] = MEMORY[0x1E4F143A8];
    v24[1] = 3221225472;
    v24[2] = __92__ICLibraryAuthServiceClientTokenProvider_getTokenStatusForDSIDs_forcingRefresh_completion___block_invoke_4;
    v24[3] = &unk_1E5ACCA00;
    id v15 = v14;
    uint64_t v16 = *(void *)(a1 + 40);
    uint64_t v17 = *(void **)(a1 + 48);
    id v25 = v15;
    uint64_t v26 = v16;
    id v28 = v17;
    id v27 = v3;
    [v13 _refreshTokensForDSIDs:v15 forExternalRequest:1 completion:v24];

    id v18 = v25;
LABEL_18:

    goto LABEL_19;
  }
LABEL_13:
  (*(void (**)(void))(*(void *)(a1 + 48) + 16))();
  [v3 finishWithError:0];
LABEL_19:
}

void __92__ICLibraryAuthServiceClientTokenProvider_getTokenStatusForDSIDs_forcingRefresh_completion___block_invoke_2(uint64_t a1, void *a2)
{
  uint64_t v3 = *(void *)(a1 + 40);
  BOOL v4 = *(void (**)(uint64_t, void, id))(v3 + 16);
  id v5 = a2;
  v4(v3, 0, v5);
  [*(id *)(a1 + 32) finishWithError:v5];
}

void __92__ICLibraryAuthServiceClientTokenProvider_getTokenStatusForDSIDs_forcingRefresh_completion___block_invoke_3(uint64_t a1, void *a2, void *a3)
{
  id v5 = *(void **)(*(void *)(a1 + 32) + 24);
  id v9 = a3;
  id v6 = a2;
  [v5 addEntriesFromDictionary:v6];
  uint64_t v7 = *(void *)(a1 + 48);
  uint64_t v8 = objc_msgSend(v9, "msv_errorByRemovingUnsafeUserInfo");
  (*(void (**)(uint64_t, id, void *))(v7 + 16))(v7, v6, v8);

  [*(id *)(a1 + 40) finishWithError:v9];
}

void __92__ICLibraryAuthServiceClientTokenProvider_getTokenStatusForDSIDs_forcingRefresh_completion___block_invoke_4(uint64_t a1, uint64_t a2, void *a3)
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v5 = [MEMORY[0x1E4F1CA60] dictionary];
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  id v6 = *(id *)(a1 + 32);
  uint64_t v7 = [v6 countByEnumeratingWithState:&v15 objects:v19 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v9 = *(void *)v16;
    do
    {
      for (uint64_t i = 0; i != v8; ++i)
      {
        if (*(void *)v16 != v9) {
          objc_enumerationMutation(v6);
        }
        uint64_t v11 = *(void *)(*((void *)&v15 + 1) + 8 * i);
        uint64_t v12 = objc_msgSend(*(id *)(*(void *)(a1 + 40) + 24), "objectForKey:", v11, (void)v15);
        if (v12) {
          [v5 setObject:v12 forKey:v11];
        }
      }
      uint64_t v8 = [v6 countByEnumeratingWithState:&v15 objects:v19 count:16];
    }
    while (v8);
  }

  uint64_t v13 = *(void *)(a1 + 56);
  uint64_t v14 = objc_msgSend(v4, "msv_errorByRemovingUnsafeUserInfo");
  (*(void (**)(uint64_t, void *, void *))(v13 + 16))(v13, v5, v14);

  [*(id *)(a1 + 48) finishWithError:v4];
}

- (void)addTokenResult:(id)a3 forDSID:(id)a4 completion:(id)a5
{
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  if (!v10)
  {
    long long v17 = [MEMORY[0x1E4F28B00] currentHandler];
    [v17 handleFailureInMethod:a2 object:self file:@"ICLibraryAuthServiceClientTokenProvider.m" lineNumber:374 description:@"addTokenResult requires a valid DSID"];
  }
  uint64_t v12 = [ICAsyncBlockOperation alloc];
  uint64_t v18 = MEMORY[0x1E4F143A8];
  uint64_t v19 = 3221225472;
  uint64_t v20 = __77__ICLibraryAuthServiceClientTokenProvider_addTokenResult_forDSID_completion___block_invoke;
  uint64_t v21 = &unk_1E5ACC088;
  uint64_t v22 = self;
  id v23 = v9;
  id v24 = v10;
  id v25 = v11;
  id v13 = v10;
  id v14 = v9;
  id v15 = v11;
  long long v16 = [(ICAsyncBlockOperation *)v12 initWithStartHandler:&v18];
  [(ICAsyncBlockOperation *)v16 setName:@"com.apple.iTunesCloud.ICLibraryAuthServiceClientTokenProvider.addTokenResult", v18, v19, v20, v21, v22];
  [(NSOperationQueue *)self->_operationQueue addOperation:v16];
}

void __77__ICLibraryAuthServiceClientTokenProvider_addTokenResult_forDSID_completion___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = *(unsigned char **)(a1 + 32);
  if (v4[32])
  {
    id v5 = objc_alloc_init(ICLibraryAuthServiceClientTokenStatus);
    [(ICLibraryAuthServiceClientTokenStatus *)v5 setTokenResult:*(void *)(a1 + 40)];
    [*(id *)(*(void *)(a1 + 32) + 24) setObject:v5 forKey:*(void *)(a1 + 48)];
    [*(id *)(a1 + 32) _commitCache];
    id v6 = [MEMORY[0x1E4F28C40] defaultCenter];
    [v6 postNotificationName:@"com.apple.iTunesCloud.ICLibraryAuthServiceClientTokenProvider._ICLibraryAuthServiceClientTokenDidChangeDistributedNotification" object:0];

    (*(void (**)(void))(*(void *)(a1 + 56) + 16))();
    [v3 finishWithError:0];
  }
  else
  {
    v19[0] = MEMORY[0x1E4F143A8];
    v19[1] = 3221225472;
    v19[2] = __77__ICLibraryAuthServiceClientTokenProvider_addTokenResult_forDSID_completion___block_invoke_2;
    v19[3] = &unk_1E5ACD8E0;
    id v21 = *(id *)(a1 + 56);
    id v7 = v3;
    id v20 = v7;
    uint64_t v8 = [v4 _remoteObjectProxyWithErrorHandler:v19];
    id v9 = *(void **)(a1 + 40);
    uint64_t v10 = *(void *)(a1 + 48);
    v13[0] = MEMORY[0x1E4F143A8];
    v13[1] = 3221225472;
    v13[2] = __77__ICLibraryAuthServiceClientTokenProvider_addTokenResult_forDSID_completion___block_invoke_3;
    v13[3] = &unk_1E5AC9FC8;
    id v11 = v9;
    uint64_t v12 = *(void *)(a1 + 32);
    id v14 = v11;
    uint64_t v15 = v12;
    id v16 = *(id *)(a1 + 48);
    id v18 = *(id *)(a1 + 56);
    id v17 = v7;
    [v8 addTokenResult:v11 forDSID:v10 completion:v13];
  }
}

void __77__ICLibraryAuthServiceClientTokenProvider_addTokenResult_forDSID_completion___block_invoke_2(uint64_t a1, void *a2)
{
  uint64_t v3 = *(void *)(a1 + 40);
  id v4 = *(void (**)(uint64_t, id))(v3 + 16);
  id v5 = a2;
  v4(v3, v5);
  [*(id *)(a1 + 32) finishWithError:v5];
}

void __77__ICLibraryAuthServiceClientTokenProvider_addTokenResult_forDSID_completion___block_invoke_3(uint64_t a1, void *a2)
{
  id v4 = a2;
  if (!v4)
  {
    uint64_t v3 = objc_alloc_init(ICLibraryAuthServiceClientTokenStatus);
    [(ICLibraryAuthServiceClientTokenStatus *)v3 setTokenResult:*(void *)(a1 + 32)];
    [*(id *)(*(void *)(a1 + 40) + 24) setObject:v3 forKey:*(void *)(a1 + 48)];
  }
  (*(void (**)(void))(*(void *)(a1 + 64) + 16))();
  [*(id *)(a1 + 56) finishWithError:v4];
}

- (id)cachedTokenAndResetCache:(BOOL)a3
{
  BOOL v3 = a3;
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  id v5 = os_log_create("com.apple.amp.iTunesCloud", "Default");
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543618;
    *(void *)&uint8_t buf[4] = self;
    *(_WORD *)&buf[12] = 1024;
    *(_DWORD *)&buf[14] = v3;
    _os_log_impl(&dword_1A2D01000, v5, OS_LOG_TYPE_DEFAULT, "%{public}@ cachedTokenAndResetCache %d", buf, 0x12u);
  }

  *(void *)buf = 0;
  *(void *)&buf[8] = buf;
  *(void *)&buf[16] = 0x3032000000;
  id v14 = __Block_byref_object_copy__25223;
  uint64_t v15 = __Block_byref_object_dispose__25224;
  id v16 = 0;
  dispatch_semaphore_t v6 = dispatch_semaphore_create(0);
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __68__ICLibraryAuthServiceClientTokenProvider_cachedTokenAndResetCache___block_invoke;
  v10[3] = &unk_1E5AC9FA0;
  uint64_t v12 = buf;
  id v7 = v6;
  id v11 = v7;
  [(ICLibraryAuthServiceClientTokenProvider *)self getTokenForcingRefresh:v3 completion:v10];
  dispatch_semaphore_wait(v7, 0xFFFFFFFFFFFFFFFFLL);
  id v8 = *(id *)(*(void *)&buf[8] + 40);

  _Block_object_dispose(buf, 8);

  return v8;
}

void __68__ICLibraryAuthServiceClientTokenProvider_cachedTokenAndResetCache___block_invoke(uint64_t a1, void *a2)
{
  objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40), a2);
  id v4 = a2;
  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));
}

- (void)getTokenResultsForDSIDs:(id)a3 forceRefresh:(BOOL)a4 completion:(id)a5
{
  BOOL v6 = a4;
  uint64_t v29 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = a5;
  uint64_t v10 = os_log_create("com.apple.amp.iTunesCloud", "Default");
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543874;
    id v24 = self;
    __int16 v25 = 2112;
    id v26 = v8;
    __int16 v27 = 1024;
    BOOL v28 = v6;
    _os_log_impl(&dword_1A2D01000, v10, OS_LOG_TYPE_DEFAULT, "%{public}@ Fetching token results for DSIDs %@. forceRefresh=%{BOOL}u", buf, 0x1Cu);
  }

  id v11 = [ICAsyncBlockOperation alloc];
  uint64_t v15 = MEMORY[0x1E4F143A8];
  uint64_t v16 = 3221225472;
  uint64_t v17 = __91__ICLibraryAuthServiceClientTokenProvider_getTokenResultsForDSIDs_forceRefresh_completion___block_invoke;
  id v18 = &unk_1E5AC9F50;
  id v19 = v8;
  id v20 = self;
  BOOL v22 = v6;
  id v21 = v9;
  id v12 = v9;
  id v13 = v8;
  id v14 = [(ICAsyncBlockOperation *)v11 initWithStartHandler:&v15];
  [(ICAsyncBlockOperation *)v14 setName:@"com.apple.iTunesCloud.ICLibraryAuthServiceClientTokenProvider.getTokenResultsForDSIDs", v15, v16, v17, v18];
  [(NSOperationQueue *)self->_operationQueue addOperation:v14];
}

void __91__ICLibraryAuthServiceClientTokenProvider_getTokenResultsForDSIDs_forceRefresh_completion___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v55 = *MEMORY[0x1E4F143B8];
  id v33 = a2;
  BOOL v3 = objc_msgSend(MEMORY[0x1E4F1CA60], "dictionaryWithCapacity:", objc_msgSend(*(id *)(a1 + 32), "count"));
  id v4 = objc_msgSend(MEMORY[0x1E4F1CA80], "setWithCapacity:", objc_msgSend(*(id *)(a1 + 32), "count"));
  long long v46 = 0u;
  long long v47 = 0u;
  long long v48 = 0u;
  long long v49 = 0u;
  id v5 = *(id *)(a1 + 32);
  uint64_t v6 = [v5 countByEnumeratingWithState:&v46 objects:v54 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v47;
    while (2)
    {
      for (uint64_t i = 0; i != v7; ++i)
      {
        if (*(void *)v47 != v8) {
          objc_enumerationMutation(v5);
        }
        uint64_t v10 = *(void *)(*((void *)&v46 + 1) + 8 * i);
        id v11 = [*(id *)(*(void *)(a1 + 40) + 24) objectForKey:v10];
        uint64_t v12 = [v11 tokenResult];
        if (!v12)
        {

          goto LABEL_14;
        }
        id v13 = (void *)v12;
        [v3 setObject:v12 forKey:v10];
        if ([v13 isExpired]
          && ([v11 shouldExcludeFromBackgroundRefresh] & 1) == 0)
        {
          [v4 addObject:v10];
        }
      }
      uint64_t v7 = [v5 countByEnumeratingWithState:&v46 objects:v54 count:16];
      if (v7) {
        continue;
      }
      break;
    }
  }
LABEL_14:

  uint64_t v14 = [v3 count];
  if (v14 == [*(id *)(a1 + 32) count] && !*(unsigned char *)(a1 + 56))
  {
    id v26 = os_log_create("com.apple.amp.iTunesCloud", "Default");
    if (os_log_type_enabled(v26, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v27 = *(void *)(a1 + 40);
      *(_DWORD *)buf = 138543618;
      uint64_t v51 = v27;
      __int16 v52 = 2114;
      long long v53 = v3;
      _os_log_impl(&dword_1A2D01000, v26, OS_LOG_TYPE_DEFAULT, "%{public}@ getTokenResultsForDSIDs returning cached token results %{public}@", buf, 0x16u);
    }

    uint64_t v28 = *(void *)(a1 + 48);
    uint64_t v29 = (void *)[v3 copy];
    (*(void (**)(uint64_t, void *, void))(v28 + 16))(v28, v29, 0);

    uint64_t v17 = v33;
    if ([v4 count])
    {
      id v30 = os_log_create("com.apple.amp.iTunesCloud", "Default");
      if (os_log_type_enabled(v30, OS_LOG_TYPE_DEFAULT))
      {
        uint64_t v31 = *(void *)(a1 + 40);
        *(_DWORD *)buf = 138543618;
        uint64_t v51 = v31;
        __int16 v52 = 2112;
        long long v53 = v4;
        _os_log_impl(&dword_1A2D01000, v30, OS_LOG_TYPE_DEFAULT, "%{public}@ Refreshing expired tokens for DSIDs %@", buf, 0x16u);
      }

      id v32 = *(void **)(a1 + 40);
      v45[0] = MEMORY[0x1E4F143A8];
      v45[1] = 3221225472;
      v45[2] = __91__ICLibraryAuthServiceClientTokenProvider_getTokenResultsForDSIDs_forceRefresh_completion___block_invoke_52;
      v45[3] = &unk_1E5AC9F78;
      void v45[4] = v32;
      [v32 getTokenResultsForDSIDs:v4 forceRefresh:1 completion:v45];
    }
    [v33 finishWithError:0];
  }
  else
  {
    uint64_t v15 = *(unsigned char **)(a1 + 40);
    if (v15[32])
    {
      uint64_t v16 = *(void *)(a1 + 32);
      v34[0] = MEMORY[0x1E4F143A8];
      v34[1] = 3221225472;
      v34[2] = __91__ICLibraryAuthServiceClientTokenProvider_getTokenResultsForDSIDs_forceRefresh_completion___block_invoke_3;
      v34[3] = &unk_1E5ACA018;
      id v36 = *(id *)(a1 + 48);
      uint64_t v17 = v33;
      id v35 = v33;
      [v15 _refreshTokensForDSIDs:v16 forExternalRequest:1 completion:v34];

      id v18 = v36;
    }
    else
    {
      v42[0] = MEMORY[0x1E4F143A8];
      v42[1] = 3221225472;
      v42[2] = __91__ICLibraryAuthServiceClientTokenProvider_getTokenResultsForDSIDs_forceRefresh_completion___block_invoke_53;
      v42[3] = &unk_1E5ACD8E0;
      id v44 = *(id *)(a1 + 48);
      uint64_t v17 = v33;
      id v19 = v33;
      id v43 = v19;
      id v20 = [v15 _remoteObjectProxyWithErrorHandler:v42];
      id v21 = *(void **)(a1 + 32);
      uint64_t v22 = *(unsigned __int8 *)(a1 + 56);
      v37[0] = MEMORY[0x1E4F143A8];
      v37[1] = 3221225472;
      v37[2] = __91__ICLibraryAuthServiceClientTokenProvider_getTokenResultsForDSIDs_forceRefresh_completion___block_invoke_2;
      v37[3] = &unk_1E5ACCA00;
      id v23 = v21;
      uint64_t v24 = *(void *)(a1 + 40);
      __int16 v25 = *(void **)(a1 + 48);
      id v38 = v23;
      uint64_t v39 = v24;
      id v41 = v25;
      id v40 = v19;
      [v20 getTokenResultsForDSIDs:v23 forceRefresh:v22 completion:v37];

      id v18 = v44;
    }
  }
}

void __91__ICLibraryAuthServiceClientTokenProvider_getTokenResultsForDSIDs_forceRefresh_completion___block_invoke_52(uint64_t a1, uint64_t a2, void *a3)
{
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if (v4)
  {
    id v5 = os_log_create("com.apple.amp.iTunesCloud", "Default");
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
    {
      uint64_t v6 = *(void *)(a1 + 32);
      int v7 = 138543618;
      uint64_t v8 = v6;
      __int16 v9 = 2114;
      id v10 = v4;
      _os_log_impl(&dword_1A2D01000, v5, OS_LOG_TYPE_ERROR, "%{public}@ Failed to refresh tokens. err=%{public}@", (uint8_t *)&v7, 0x16u);
    }
  }
}

void __91__ICLibraryAuthServiceClientTokenProvider_getTokenResultsForDSIDs_forceRefresh_completion___block_invoke_53(uint64_t a1, void *a2)
{
  uint64_t v3 = *(void *)(a1 + 40);
  id v4 = *(void (**)(uint64_t, void, id))(v3 + 16);
  id v5 = a2;
  v4(v3, 0, v5);
  [*(id *)(a1 + 32) finishWithError:v5];
}

void __91__ICLibraryAuthServiceClientTokenProvider_getTokenResultsForDSIDs_forceRefresh_completion___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  id v6 = a3;
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  id v7 = *(id *)(a1 + 32);
  uint64_t v8 = [v7 countByEnumeratingWithState:&v14 objects:v18 count:16];
  if (v8)
  {
    uint64_t v9 = v8;
    uint64_t v10 = *(void *)v15;
    do
    {
      for (uint64_t i = 0; i != v9; ++i)
      {
        if (*(void *)v15 != v10) {
          objc_enumerationMutation(v7);
        }
        uint64_t v12 = *(void *)(*((void *)&v14 + 1) + 8 * i);
        id v13 = objc_msgSend(v5, "objectForKeyedSubscript:", v12, (void)v14);
        [*(id *)(a1 + 40) _updateTokenCacheEntryForDSID:v12 tokenResult:v13 error:v6];
      }
      uint64_t v9 = [v7 countByEnumeratingWithState:&v14 objects:v18 count:16];
    }
    while (v9);
  }

  (*(void (**)(void))(*(void *)(a1 + 56) + 16))();
  [*(id *)(a1 + 48) finishWithError:v6];
}

void __91__ICLibraryAuthServiceClientTokenProvider_getTokenResultsForDSIDs_forceRefresh_completion___block_invoke_3(uint64_t a1, void *a2, void *a3)
{
  uint64_t v5 = *(void *)(a1 + 40);
  id v8 = a3;
  id v6 = a2;
  id v7 = objc_msgSend(v8, "msv_errorByRemovingUnsafeUserInfo");
  (*(void (**)(uint64_t, id, void *))(v5 + 16))(v5, v6, v7);

  [*(id *)(a1 + 32) finishWithError:v8];
}

- (void)getTokenResultForDSID:(id)a3 forceRefresh:(BOOL)a4 completion:(id)a5
{
  BOOL v6 = a4;
  uint64_t v26 = *MEMORY[0x1E4F143B8];
  id v9 = a3;
  id v10 = a5;
  if (!v9)
  {
    long long v15 = [MEMORY[0x1E4F28B00] currentHandler];
    [v15 handleFailureInMethod:a2 object:self file:@"ICLibraryAuthServiceClientTokenProvider.m" lineNumber:250 description:@"getTokenForDSID requires a valid DSID"];
  }
  uint64_t v11 = os_log_create("com.apple.amp.iTunesCloud", "Default");
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v12 = ICCreateLoggableValueForDSID(v9);
    *(_DWORD *)buf = 138543874;
    *(void *)&uint8_t buf[4] = self;
    *(_WORD *)&buf[12] = 2114;
    *(void *)&buf[14] = v12;
    *(_WORD *)&buf[22] = 1024;
    BOOL v25 = v6;
    _os_log_impl(&dword_1A2D01000, v11, OS_LOG_TYPE_DEFAULT, "%{public}@ Fetching token result for DSID %{public}@. forceRefresh=%{BOOL}u", buf, 0x1Cu);
  }
  memset(buf, 0, sizeof(buf));
  [(ICLibraryAuthServiceClientTokenProvider *)self _checkTokenPresetsForDSID:v9 forceRefresh:v6];
  if (buf[16])
  {
    (*((void (**)(id, void, void))v10 + 2))(v10, *(void *)buf, *(void *)&buf[8]);
  }
  else
  {
    id v13 = [ICAsyncBlockOperation alloc];
    uint64_t v16 = MEMORY[0x1E4F143A8];
    uint64_t v17 = 3221225472;
    id v18 = __89__ICLibraryAuthServiceClientTokenProvider_getTokenResultForDSID_forceRefresh_completion___block_invoke;
    uint64_t v19 = &unk_1E5AC9F50;
    id v20 = self;
    id v21 = v9;
    BOOL v23 = v6;
    id v22 = v10;
    long long v14 = [(ICAsyncBlockOperation *)v13 initWithStartHandler:&v16];
    [(ICAsyncBlockOperation *)v14 setName:@"com.apple.iTunesCloud.ICLibraryAuthServiceClientTokenProvider.getTokenResultForDSID", v16, v17, v18, v19, v20];
    [(NSOperationQueue *)self->_operationQueue addOperation:v14];
  }
}

void __89__ICLibraryAuthServiceClientTokenProvider_getTokenResultForDSID_forceRefresh_completion___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v35 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  id v4 = [*(id *)(*(void *)(a1 + 32) + 24) objectForKey:*(void *)(a1 + 40)];
  uint64_t v5 = [v4 tokenResult];

  if (v5 && !*(unsigned char *)(a1 + 56))
  {
    id v13 = os_log_create("com.apple.amp.iTunesCloud", "Default");
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v14 = *(void *)(a1 + 32);
      *(_DWORD *)buf = 138543618;
      uint64_t v32 = v14;
      __int16 v33 = 2114;
      id v34 = v5;
      _os_log_impl(&dword_1A2D01000, v13, OS_LOG_TYPE_DEFAULT, "%{public}@ getTokenResultForDSID returning cached token result %{public}@", buf, 0x16u);
    }

    (*(void (**)(void))(*(void *)(a1 + 48) + 16))();
    if ([v5 isExpired])
    {
      long long v15 = os_log_create("com.apple.amp.iTunesCloud", "Default");
      if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
      {
        uint64_t v16 = *(void *)(a1 + 32);
        uint64_t v17 = *(void **)(a1 + 40);
        *(_DWORD *)buf = 138543618;
        uint64_t v32 = v16;
        __int16 v33 = 2112;
        id v34 = v17;
        _os_log_impl(&dword_1A2D01000, v15, OS_LOG_TYPE_DEFAULT, "%{public}@ Refreshing expired token for DSID %@", buf, 0x16u);
      }

      id v18 = *(void **)(a1 + 32);
      uint64_t v19 = *(void *)(a1 + 40);
      v30[0] = MEMORY[0x1E4F143A8];
      v30[1] = 3221225472;
      v30[2] = __89__ICLibraryAuthServiceClientTokenProvider_getTokenResultForDSID_forceRefresh_completion___block_invoke_45;
      v30[3] = &unk_1E5AC9ED8;
      v30[4] = v18;
      [v18 getTokenResultForDSID:v19 forceRefresh:1 completion:v30];
    }
    [v3 finishWithError:0];
  }
  else
  {
    BOOL v6 = *(unsigned char **)(a1 + 32);
    if (v6[32])
    {
      v20[0] = MEMORY[0x1E4F143A8];
      v20[1] = 3221225472;
      v20[2] = __89__ICLibraryAuthServiceClientTokenProvider_getTokenResultForDSID_forceRefresh_completion___block_invoke_3;
      v20[3] = &unk_1E5AC9F28;
      uint64_t v7 = *(void *)(a1 + 40);
      id v22 = *(id *)(a1 + 48);
      id v21 = v3;
      [v6 _refreshTokenForDSID:v7 forExternalRequest:1 completion:v20];

      id v8 = v22;
    }
    else
    {
      v27[0] = MEMORY[0x1E4F143A8];
      v27[1] = 3221225472;
      v27[2] = __89__ICLibraryAuthServiceClientTokenProvider_getTokenResultForDSID_forceRefresh_completion___block_invoke_46;
      v27[3] = &unk_1E5ACD8E0;
      id v29 = *(id *)(a1 + 48);
      id v9 = v3;
      id v28 = v9;
      id v10 = [v6 _remoteObjectProxyWithErrorHandler:v27];
      uint64_t v11 = *(unsigned __int8 *)(a1 + 56);
      v23[0] = MEMORY[0x1E4F143A8];
      v23[1] = 3221225472;
      v23[2] = __89__ICLibraryAuthServiceClientTokenProvider_getTokenResultForDSID_forceRefresh_completion___block_invoke_2;
      v23[3] = &unk_1E5AC9F00;
      uint64_t v12 = *(void **)(a1 + 40);
      v23[4] = *(void *)(a1 + 32);
      id v24 = v12;
      id v26 = *(id *)(a1 + 48);
      id v25 = v9;
      [v10 getTokenResultForDSID:v24 forceRefresh:v11 completion:v23];

      id v8 = v29;
    }
  }
}

void __89__ICLibraryAuthServiceClientTokenProvider_getTokenResultForDSID_forceRefresh_completion___block_invoke_45(uint64_t a1, uint64_t a2, void *a3)
{
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if (v4)
  {
    uint64_t v5 = os_log_create("com.apple.amp.iTunesCloud", "Default");
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v6 = *(void *)(a1 + 32);
      int v7 = 138543618;
      uint64_t v8 = v6;
      __int16 v9 = 2114;
      id v10 = v4;
      _os_log_impl(&dword_1A2D01000, v5, OS_LOG_TYPE_DEFAULT, "%{public}@ Failed to refresh the token. err=%{public}@", (uint8_t *)&v7, 0x16u);
    }
  }
}

void __89__ICLibraryAuthServiceClientTokenProvider_getTokenResultForDSID_forceRefresh_completion___block_invoke_46(uint64_t a1, void *a2)
{
  uint64_t v3 = *(void *)(a1 + 40);
  id v4 = *(void (**)(uint64_t, void, id))(v3 + 16);
  id v5 = a2;
  v4(v3, 0, v5);
  [*(id *)(a1 + 32) finishWithError:v5];
}

void __89__ICLibraryAuthServiceClientTokenProvider_getTokenResultForDSID_forceRefresh_completion___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v5 = *(void **)(a1 + 32);
  uint64_t v6 = *(void *)(a1 + 40);
  id v8 = a3;
  id v7 = a2;
  [v5 _updateTokenCacheEntryForDSID:v6 tokenResult:v7 error:v8];
  (*(void (**)(void))(*(void *)(a1 + 56) + 16))();

  [*(id *)(a1 + 48) finishWithError:v8];
}

void __89__ICLibraryAuthServiceClientTokenProvider_getTokenResultForDSID_forceRefresh_completion___block_invoke_3(uint64_t a1, void *a2, void *a3)
{
  uint64_t v5 = *(void *)(a1 + 40);
  id v8 = a3;
  id v6 = a2;
  id v7 = objc_msgSend(v8, "msv_errorByRemovingUnsafeUserInfo");
  (*(void (**)(uint64_t, id, void *))(v5 + 16))(v5, v6, v7);

  [*(id *)(a1 + 32) finishWithError:v8];
}

- (void)getTokenForDSID:(id)a3 forceRefresh:(BOOL)a4 completion:(id)a5
{
  BOOL v6 = a4;
  id v9 = a3;
  id v10 = a5;
  if (!v9)
  {
    uint64_t v12 = [MEMORY[0x1E4F28B00] currentHandler];
    [v12 handleFailureInMethod:a2 object:self file:@"ICLibraryAuthServiceClientTokenProvider.m" lineNumber:243 description:@"getTokenForDSID requires a valid DSID"];
  }
  v13[0] = MEMORY[0x1E4F143A8];
  v13[1] = 3221225472;
  v13[2] = __83__ICLibraryAuthServiceClientTokenProvider_getTokenForDSID_forceRefresh_completion___block_invoke;
  v13[3] = &unk_1E5AC9EB0;
  id v14 = v10;
  id v11 = v10;
  [(ICLibraryAuthServiceClientTokenProvider *)self getTokenResultForDSID:v9 forceRefresh:v6 completion:v13];
}

void __83__ICLibraryAuthServiceClientTokenProvider_getTokenForDSID_forceRefresh_completion___block_invoke(uint64_t a1, void *a2, void *a3)
{
  uint64_t v4 = *(void *)(a1 + 32);
  id v5 = a3;
  id v6 = [a2 token];
  (*(void (**)(uint64_t, id, id))(v4 + 16))(v4, v6, v5);
}

- (void)getAllTokensForAssistantForcingRefresh:(BOOL)a3 completion:(id)a4
{
  BOOL v4 = a3;
  uint64_t v44 = *MEMORY[0x1E4F143B8];
  id v5 = (void (**)(id, void, id))a4;
  id v6 = +[ICUserIdentityStore defaultIdentityStore];
  id v7 = [v6 _unsafeBackend];

  id v38 = 0;
  id v8 = [v7 allStoreAccountsWithError:&v38];
  id v9 = v38;
  if (v9)
  {
    id v10 = os_log_create("com.apple.amp.iTunesCloud", "Default");
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138543618;
      id v41 = self;
      __int16 v42 = 2114;
      id v43 = v9;
      _os_log_impl(&dword_1A2D01000, v10, OS_LOG_TYPE_ERROR, "%{public}@ Failed to gather DSIDs from the account store to fetch tokens for. err=%{public}@", buf, 0x16u);
    }

    v5[2](v5, 0, v9);
  }
  else
  {
    BOOL v24 = v4;
    id v26 = v7;
    uint64_t v27 = v5;
    id v11 = [MEMORY[0x1E4F1CA80] set];
    id v28 = [MEMORY[0x1E4F1CA60] dictionary];
    long long v34 = 0u;
    long long v35 = 0u;
    long long v36 = 0u;
    long long v37 = 0u;
    id v25 = v8;
    id v12 = v8;
    uint64_t v13 = [v12 countByEnumeratingWithState:&v34 objects:v39 count:16];
    if (v13)
    {
      uint64_t v14 = v13;
      uint64_t v15 = *(void *)v35;
      do
      {
        for (uint64_t i = 0; i != v14; ++i)
        {
          if (*(void *)v35 != v15) {
            objc_enumerationMutation(v12);
          }
          uint64_t v17 = *(void **)(*((void *)&v34 + 1) + 8 * i);
          if ([v17 isAuthenticated]
            && (objc_msgSend(v17, "ic_homeUserIdentifiers"),
                id v18 = objc_claimAutoreleasedReturnValue(),
                uint64_t v19 = [v18 count],
                v18,
                v19))
          {
            id v20 = objc_msgSend(v17, "ic_DSID");
            [v11 addObject:v20];

            id v21 = objc_msgSend(v17, "ic_DSID");
            [v28 setObject:v17 forKeyedSubscript:v21];
          }
          else
          {
            id v21 = os_log_create("com.apple.amp.iTunesCloud", "Default");
            if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
            {
              *(_DWORD *)buf = 138543618;
              id v41 = self;
              __int16 v42 = 2112;
              id v43 = v17;
              _os_log_impl(&dword_1A2D01000, v21, OS_LOG_TYPE_DEFAULT, "%{public}@ Skipping account %@ because either the DSID is missing or it has no home user ids", buf, 0x16u);
            }
          }
        }
        uint64_t v14 = [v12 countByEnumeratingWithState:&v34 objects:v39 count:16];
      }
      while (v14);
    }

    if ([v11 count])
    {
      v30[0] = MEMORY[0x1E4F143A8];
      v30[1] = 3221225472;
      v30[2] = __93__ICLibraryAuthServiceClientTokenProvider_getAllTokensForAssistantForcingRefresh_completion___block_invoke;
      v30[3] = &unk_1E5ACCA00;
      v30[4] = self;
      id v5 = v27;
      __int16 v33 = v27;
      id v31 = v11;
      id v22 = v28;
      id v32 = v28;
      [(ICLibraryAuthServiceClientTokenProvider *)self getTokenResultsForDSIDs:v31 forceRefresh:v24 completion:v30];

      id v9 = 0;
      id v7 = v26;
      id v8 = v25;
    }
    else
    {
      BOOL v23 = [MEMORY[0x1E4F1CA60] dictionary];
      id v5 = v27;
      ((void (**)(id, void *, id))v27)[2](v27, v23, 0);

      id v9 = 0;
      id v7 = v26;
      id v8 = v25;
      id v22 = v28;
    }
  }
}

void __93__ICLibraryAuthServiceClientTokenProvider_getAllTokensForAssistantForcingRefresh_completion___block_invoke(uint64_t a1, void *a2, void *a3)
{
  uint64_t v62 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  id v25 = a3;
  if (v25)
  {
    id v6 = os_log_create("com.apple.amp.iTunesCloud", "Default");
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    {
      uint64_t v7 = *(void *)(a1 + 32);
      *(_DWORD *)buf = 138543618;
      *(void *)&uint8_t buf[4] = v7;
      *(_WORD *)&buf[12] = 2114;
      *(void *)&buf[14] = v25;
      _os_log_impl(&dword_1A2D01000, v6, OS_LOG_TYPE_ERROR, "%{public}@ Failed to fetch all client tokens. err=%{public}@", buf, 0x16u);
    }

    (*(void (**)(void))(*(void *)(a1 + 56) + 16))();
  }
  else
  {
    *(void *)buf = 0;
    *(void *)&buf[8] = buf;
    *(void *)&buf[16] = 0x3032000000;
    uint64_t v59 = __Block_byref_object_copy__25223;
    long long v60 = __Block_byref_object_dispose__25224;
    id v61 = 0;
    queue = dispatch_queue_create("com.apple.iTunesCloud.ICLibraryAuthServiceClientTokenProvider.allTokens", 0);
    id v8 = dispatch_group_create();
    id v31 = objc_msgSend(MEMORY[0x1E4F1CA60], "dictionaryWithCapacity:", objc_msgSend(v5, "count"));
    long long v50 = 0u;
    long long v51 = 0u;
    long long v48 = 0u;
    long long v49 = 0u;
    obuint64_t j = *(id *)(a1 + 40);
    uint64_t v9 = [obj countByEnumeratingWithState:&v48 objects:v57 count:16];
    if (v9)
    {
      uint64_t v27 = *(void *)v49;
      do
      {
        for (uint64_t i = 0; i != v9; ++i)
        {
          if (*(void *)v49 != v27) {
            objc_enumerationMutation(obj);
          }
          uint64_t v10 = *(void *)(*((void *)&v48 + 1) + 8 * i);
          __int16 v33 = [v5 objectForKey:v10];
          if (!v33
            || ([v33 token],
                id v11 = objc_claimAutoreleasedReturnValue(),
                BOOL v12 = v11 == 0,
                v11,
                v12))
          {
            id v21 = os_log_create("com.apple.amp.iTunesCloud", "Default");
            id v28 = v21;
            if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR))
            {
              uint64_t v22 = *(void *)(a1 + 32);
              *(_DWORD *)long long v53 = 138543618;
              uint64_t v54 = v22;
              __int16 v55 = 2112;
              uint64_t v56 = v10;
              _os_log_impl(&dword_1A2D01000, v21, OS_LOG_TYPE_ERROR, "%{public}@ No token result for DSID %@ in bulk response - this will be treated as an error", v53, 0x16u);
            }
          }
          else
          {
            dispatch_group_enter(v8);
            uint64_t v13 = [*(id *)(a1 + 48) objectForKey:v10];
            long long v46 = 0u;
            long long v47 = 0u;
            long long v44 = 0u;
            long long v45 = 0u;
            id v28 = v13;
            uint64_t v14 = [v13 ic_homeUserIdentifiers];
            uint64_t v15 = [v14 countByEnumeratingWithState:&v44 objects:v52 count:16];
            if (v15)
            {
              uint64_t v16 = *(void *)v45;
              id v30 = v14;
              do
              {
                for (uint64_t j = 0; j != v15; ++j)
                {
                  if (*(void *)v45 != v16) {
                    objc_enumerationMutation(v30);
                  }
                  id v18 = *(void **)(*((void *)&v44 + 1) + 8 * j);
                  dispatch_group_enter(v8);
                  uint64_t v19 = *(void **)(*(void *)(a1 + 32) + 64);
                  id v20 = [v18 UUIDString];
                  v38[0] = MEMORY[0x1E4F143A8];
                  v38[1] = 3221225472;
                  v38[2] = __93__ICLibraryAuthServiceClientTokenProvider_getAllTokensForAssistantForcingRefresh_completion___block_invoke_33;
                  v38[3] = &unk_1E5AC9E88;
                  v38[4] = *(void *)(a1 + 32);
                  v38[5] = v18;
                  id v43 = buf;
                  uint64_t v39 = queue;
                  id v40 = v31;
                  id v41 = v33;
                  __int16 v42 = v8;
                  [v19 getSharedUserIdForHomeUserId:v20 completion:v38];
                }
                uint64_t v14 = v30;
                uint64_t v15 = [v30 countByEnumeratingWithState:&v44 objects:v52 count:16];
              }
              while (v15);
            }

            dispatch_group_leave(v8);
          }
        }
        uint64_t v9 = [obj countByEnumeratingWithState:&v48 objects:v57 count:16];
      }
      while (v9);
    }

    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __93__ICLibraryAuthServiceClientTokenProvider_getAllTokensForAssistantForcingRefresh_completion___block_invoke_2;
    block[3] = &unk_1E5ACB0E8;
    id v23 = *(id *)(a1 + 56);
    id v35 = v31;
    id v36 = v23;
    long long v37 = buf;
    id v24 = v31;
    dispatch_group_notify(v8, queue, block);

    _Block_object_dispose(buf, 8);
  }
}

void __93__ICLibraryAuthServiceClientTokenProvider_getAllTokensForAssistantForcingRefresh_completion___block_invoke_33(uint64_t a1, void *a2, void *a3)
{
  uint64_t v27 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  id v6 = a3;
  uint64_t v7 = v6;
  if (!v5 || v6)
  {
    uint64_t v10 = os_log_create("com.apple.amp.iTunesCloud", "Default");
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
    {
      uint64_t v11 = *(void *)(a1 + 32);
      uint64_t v12 = *(void *)(a1 + 40);
      *(_DWORD *)buf = 138544131;
      uint64_t v20 = v11;
      __int16 v21 = 2114;
      uint64_t v22 = v12;
      __int16 v23 = 2113;
      id v24 = v5;
      __int16 v25 = 2114;
      id v26 = v7;
      _os_log_impl(&dword_1A2D01000, v10, OS_LOG_TYPE_ERROR, "%{public}@ failed fetching siri shared user id for homeIdentifier %{public}@:%{private}@. err=%{public}@", buf, 0x2Au);
    }

    uint64_t v13 = *(void *)(*(void *)(a1 + 80) + 8);
    id v14 = v7;
    uint64_t v9 = *(void **)(v13 + 40);
    *(void *)(v13 + 40) = v14;
  }
  else
  {
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __93__ICLibraryAuthServiceClientTokenProvider_getAllTokensForAssistantForcingRefresh_completion___block_invoke_34;
    block[3] = &unk_1E5ACD5C8;
    id v8 = *(NSObject **)(a1 + 48);
    id v16 = *(id *)(a1 + 56);
    id v17 = v5;
    id v18 = *(id *)(a1 + 64);
    dispatch_sync(v8, block);

    uint64_t v9 = v16;
  }

  dispatch_group_leave(*(dispatch_group_t *)(a1 + 72));
}

uint64_t __93__ICLibraryAuthServiceClientTokenProvider_getAllTokensForAssistantForcingRefresh_completion___block_invoke_2(void *a1)
{
  return (*(uint64_t (**)(void, void, void))(a1[5] + 16))(a1[5], a1[4], *(void *)(*(void *)(a1[6] + 8) + 40));
}

void __93__ICLibraryAuthServiceClientTokenProvider_getAllTokensForAssistantForcingRefresh_completion___block_invoke_34(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 48) token];
  [*(id *)(a1 + 32) setObject:v2 forKeyedSubscript:*(void *)(a1 + 40)];
}

- (void)getTokenForcingRefresh:(BOOL)a3 completion:(id)a4
{
  BOOL v4 = a3;
  uint64_t v26 = *MEMORY[0x1E4F143B8];
  id v6 = (void (**)(id, void, id))a4;
  uint64_t v7 = +[ICUserIdentityStore defaultIdentityStore];
  id v8 = +[ICUserIdentity activeAccount];
  id v19 = 0;
  uint64_t v9 = [v7 getPropertiesForUserIdentity:v8 error:&v19];
  id v10 = v19;

  if (v10)
  {
    uint64_t v11 = os_log_create("com.apple.amp.iTunesCloud", "Default");
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138543618;
      __int16 v23 = self;
      __int16 v24 = 2114;
      id v25 = v10;
      _os_log_impl(&dword_1A2D01000, v11, OS_LOG_TYPE_DEFAULT, "%{public}@ failed to get identity properties for token request. err=%{public}@", buf, 0x16u);
    }

    v6[2](v6, 0, v10);
  }
  else
  {
    uint64_t v12 = [v9 DSID];
    if (v12)
    {
      v17[0] = MEMORY[0x1E4F143A8];
      v17[1] = 3221225472;
      v17[2] = __77__ICLibraryAuthServiceClientTokenProvider_getTokenForcingRefresh_completion___block_invoke;
      v17[3] = &unk_1E5AC9E60;
      id v18 = v6;
      [(ICLibraryAuthServiceClientTokenProvider *)self getTokenForDSID:v12 forceRefresh:v4 completion:v17];
      uint64_t v13 = v18;
    }
    else
    {
      id v14 = os_log_create("com.apple.amp.iTunesCloud", "Default");
      if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138543362;
        __int16 v23 = self;
        _os_log_impl(&dword_1A2D01000, v14, OS_LOG_TYPE_DEFAULT, "%{public}@ not fetching library token because there's no active account", buf, 0xCu);
      }

      uint64_t v20 = *MEMORY[0x1E4F28228];
      uint64_t v15 = [NSString stringWithFormat:@"Unable to fetch library token [no DSID on active account] - properties=%@", v9];
      __int16 v21 = v15;
      uint64_t v13 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v21 forKeys:&v20 count:1];

      id v16 = [MEMORY[0x1E4F28C58] errorWithDomain:@"ICError" code:-7400 userInfo:v13];
      v6[2](v6, 0, v16);
    }
  }
}

uint64_t __77__ICLibraryAuthServiceClientTokenProvider_getTokenForcingRefresh_completion___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)stopService
{
  uint64_t v7 = *MEMORY[0x1E4F143B8];
  uint64_t v3 = os_log_create("com.apple.amp.iTunesCloud", "Default");
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    int v5 = 138543362;
    id v6 = self;
    _os_log_impl(&dword_1A2D01000, v3, OS_LOG_TYPE_DEFAULT, "%{public}@ Stopping system service...", (uint8_t *)&v5, 0xCu);
  }

  [(NSXPCListener *)self->_xpcServiceListener invalidate];
  xpcServiceListener = self->_xpcServiceListener;
  self->_xpcServiceListener = 0;
}

- (void)startService
{
  uint64_t v9 = *MEMORY[0x1E4F143B8];
  uint64_t v3 = os_log_create("com.apple.amp.iTunesCloud", "Default");
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    int v7 = 138543362;
    id v8 = self;
    _os_log_impl(&dword_1A2D01000, v3, OS_LOG_TYPE_DEFAULT, "%{public}@ Starting system service...", (uint8_t *)&v7, 0xCu);
  }

  self->_isService = 1;
  [(ICLibraryAuthServiceClientTokenProvider *)self _loadCache];
  [(ICLibraryAuthServiceClientTokenProvider *)self _updateEntriesForAccountsChanges];
  [(ICLibraryAuthServiceClientTokenProvider *)self _updateRefreshTimer];
  BOOL v4 = (NSXPCListener *)[objc_alloc(MEMORY[0x1E4F29290]) initWithMachServiceName:@"com.apple.itunescloud.library-auth-token-provider"];
  xpcServiceListener = self->_xpcServiceListener;
  self->_xpcServiceListener = v4;

  [(NSXPCListener *)self->_xpcServiceListener setDelegate:self];
  [(NSXPCListener *)self->_xpcServiceListener resume];
  id v6 = [MEMORY[0x1E4F28EB8] defaultCenter];
  [v6 addObserver:self selector:sel__handleUserIdentityStoreDidChangeNotification_ name:@"ICUserIdentityStoreDidChangeNotification" object:0];
}

- (void)dealloc
{
  uint64_t v3 = [MEMORY[0x1E4F28C40] defaultCenter];
  [v3 removeObserver:self name:@"com.apple.iTunesCloud.ICLibraryAuthServiceClientTokenProvider._ICLibraryAuthServiceClientTokenDidChangeDistributedNotification" object:0];

  xpcClientConnection = self->_xpcClientConnection;
  if (xpcClientConnection)
  {
    [(NSXPCConnection *)xpcClientConnection invalidate];
    int v5 = self->_xpcClientConnection;
    self->_xpcClientConnection = 0;
  }
  xpcServiceListener = self->_xpcServiceListener;
  if (xpcServiceListener)
  {
    [(NSXPCListener *)xpcServiceListener invalidate];
    int v7 = self->_xpcServiceListener;
    self->_xpcServiceListener = 0;
  }
  v8.receiver = self;
  v8.super_class = (Class)ICLibraryAuthServiceClientTokenProvider;
  [(ICLibraryAuthServiceClientTokenProvider *)&v8 dealloc];
}

- (ICLibraryAuthServiceClientTokenProvider)init
{
  v15.receiver = self;
  v15.super_class = (Class)ICLibraryAuthServiceClientTokenProvider;
  id v2 = [(ICLibraryAuthServiceClientTokenProvider *)&v15 init];
  if (v2)
  {
    dispatch_queue_t v3 = dispatch_queue_create("com.apple.iTunesCloud.ICLibraryAuthServiceClientTokenProvider.accessQueue", 0);
    accessQueue = v2->_accessQueue;
    v2->_accessQueue = (OS_dispatch_queue *)v3;

    int v5 = (NSOperationQueue *)objc_alloc_init(MEMORY[0x1E4F28F08]);
    operationQueue = v2->_operationQueue;
    v2->_operationQueue = v5;

    [(NSOperationQueue *)v2->_operationQueue setName:@"com.apple.iTunesCloud.ICLibraryAuthServiceClientTokenProvider.operationQueue"];
    [(NSOperationQueue *)v2->_operationQueue setMaxConcurrentOperationCount:1];
    [(NSOperationQueue *)v2->_operationQueue setQualityOfService:25];
    uint64_t v7 = [MEMORY[0x1E4F1CA60] dictionary];
    tokenCache = v2->_tokenCache;
    v2->_tokenCache = (NSMutableDictionary *)v7;

    uint64_t v17 = 0;
    id v18 = &v17;
    uint64_t v19 = 0x2050000000;
    uint64_t v9 = (void *)getAFMultiUserConnectionClass_softClass;
    uint64_t v20 = getAFMultiUserConnectionClass_softClass;
    if (!getAFMultiUserConnectionClass_softClass)
    {
      v16[0] = MEMORY[0x1E4F143A8];
      v16[1] = 3221225472;
      v16[2] = __getAFMultiUserConnectionClass_block_invoke;
      v16[3] = &unk_1E5ACD4F0;
      void v16[4] = &v17;
      __getAFMultiUserConnectionClass_block_invoke((uint64_t)v16);
      uint64_t v9 = (void *)v18[3];
    }
    id v10 = v9;
    _Block_object_dispose(&v17, 8);
    uint64_t v11 = (AFMultiUserConnection *)objc_alloc_init(v10);
    siriConnection = v2->_siriConnection;
    v2->_siriConnection = v11;

    uint64_t v13 = [MEMORY[0x1E4F28C40] defaultCenter];
    [v13 addObserver:v2 selector:sel__handleLibraryAuthServiceClientTokenDidChangeDistributedNotification_ name:@"com.apple.iTunesCloud.ICLibraryAuthServiceClientTokenProvider._ICLibraryAuthServiceClientTokenDidChangeDistributedNotification" object:0];
  }
  return v2;
}

+ (ICLibraryAuthServiceClientTokenProvider)sharedProvider
{
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __57__ICLibraryAuthServiceClientTokenProvider_sharedProvider__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  void block[4] = a1;
  if (sharedProvider_sOnceToken != -1) {
    dispatch_once(&sharedProvider_sOnceToken, block);
  }
  id v2 = (void *)sharedProvider_sSharedProvider;

  return (ICLibraryAuthServiceClientTokenProvider *)v2;
}

uint64_t __57__ICLibraryAuthServiceClientTokenProvider_sharedProvider__block_invoke()
{
  id v0 = objc_alloc_init((Class)objc_opt_class());
  uint64_t v1 = sharedProvider_sSharedProvider;
  sharedProvider_sSharedProvider = (uint64_t)v0;

  return MEMORY[0x1F41817F8](v0, v1);
}

@end