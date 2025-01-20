@interface MFCastleEmailAliasUpdater
- (MFCastleEmailAliasUpdater)initWithAccountID:(id)a3 aliasSupport:(id)a4;
- (id)_aliasesFromData:(uint64_t)a1;
- (id)_defaultEmailAddressFromData:(uint64_t)a1;
- (id)_emailsFromData:(uint64_t)a1;
- (id)_headerStringFromDate:(uint64_t)a1;
- (id)_sourceApplicationBundleIdentifier;
- (id)createRequestWithLastSyncDate:(void *)a3 entityTag:;
- (void)_createURLSession;
- (void)_getEmailAddressAndAliasesWithLastSyncDate:(void *)a3 entityTag:(void *)a4 handler:;
- (void)_getEmailAddressAndAliasesWithRequest:(void *)a3 handler:;
- (void)_getEmailAddressAndAliasesWithResponse:(void *)a3 responseData:(void *)a4 error:(void *)a5 handler:;
- (void)getEmailAddressAndAliasesWithLastSyncDate:(id)a3 entityTag:(id)a4 handler:(id)a5;
@end

@implementation MFCastleEmailAliasUpdater

- (MFCastleEmailAliasUpdater)initWithAccountID:(id)a3 aliasSupport:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v16.receiver = self;
  v16.super_class = (Class)MFCastleEmailAliasUpdater;
  v9 = [(MFCastleEmailAliasUpdater *)&v16 init];
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_accountID, a3);
    objc_storeStrong((id *)&v10->_aliasSupport, a4);
    v11 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    v12 = dispatch_queue_attr_make_with_qos_class(v11, QOS_CLASS_UTILITY, 0);
    dispatch_queue_t v13 = dispatch_queue_create("com.apple.message.icloud.alias-update", v12);
    queue = v10->_queue;
    v10->_queue = (OS_dispatch_queue *)v13;
  }
  return v10;
}

- (void)getEmailAddressAndAliasesWithLastSyncDate:(id)a3 entityTag:(id)a4 handler:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  if (self) {
    queue = self->_queue;
  }
  else {
    queue = 0;
  }
  v17[0] = MEMORY[0x1E4F143A8];
  v17[1] = 3221225472;
  v17[2] = __89__MFCastleEmailAliasUpdater_getEmailAddressAndAliasesWithLastSyncDate_entityTag_handler___block_invoke;
  v17[3] = &unk_1E5D3E098;
  v17[4] = self;
  id v18 = v8;
  id v19 = v9;
  id v20 = v10;
  id v12 = v10;
  id v13 = v9;
  id v14 = v8;
  v15 = queue;
  dispatch_block_t v16 = dispatch_block_create(DISPATCH_BLOCK_DETACHED, v17);
  dispatch_async(v15, v16);
}

void __89__MFCastleEmailAliasUpdater_getEmailAddressAndAliasesWithLastSyncDate_entityTag_handler___block_invoke(uint64_t a1)
{
}

- (void)_getEmailAddressAndAliasesWithLastSyncDate:(void *)a3 entityTag:(void *)a4 handler:
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  id v7 = a2;
  id v8 = a3;
  id v9 = a4;
  if (a1)
  {
    dispatch_assert_queue_V2(*(dispatch_queue_t *)(a1 + 32));
    if (*(unsigned char *)(a1 + 8))
    {
      id v10 = [MEMORY[0x1E4F60CB0] log];
      if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
      {
        uint64_t v11 = *(void *)(a1 + 16);
        *(_DWORD *)buf = 138543362;
        uint64_t v17 = v11;
        _os_log_impl(&dword_1A7EFF000, v10, OS_LOG_TYPE_DEFAULT, "[%{public}@] updateEmailAddressAndAliases: Update already running.", buf, 0xCu);
      }

      v9[2](v9, 0);
    }
    else
    {
      *(unsigned char *)(a1 + 8) = 1;
      ++*(_DWORD *)(a1 + 12);
      id v12 = -[MFCastleEmailAliasUpdater createRequestWithLastSyncDate:entityTag:](a1, v7, v8);
      if (v12)
      {
        v14[0] = MEMORY[0x1E4F143A8];
        v14[1] = 3221225472;
        v14[2] = __90__MFCastleEmailAliasUpdater__getEmailAddressAndAliasesWithLastSyncDate_entityTag_handler___block_invoke;
        v14[3] = &unk_1E5D3E0C0;
        v14[4] = a1;
        v15 = v9;
        -[MFCastleEmailAliasUpdater _getEmailAddressAndAliasesWithRequest:handler:](a1, v12, v14);
      }
      else
      {
        id v13 = objc_alloc_init(CastleEmailAliasUpdateResult);
        ((void (**)(id, CastleEmailAliasUpdateResult *))v9)[2](v9, v13);

        *(unsigned char *)(a1 + 8) = 0;
      }
    }
  }
}

- (id)createRequestWithLastSyncDate:(void *)a3 entityTag:
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  id v6 = a3;
  if (!a1)
  {
LABEL_11:
    id v10 = 0;
    goto LABEL_14;
  }
  id v7 = +[MFNetworkController sharedInstance];
  char v8 = [v7 isNetworkUp];

  if ((v8 & 1) == 0)
  {
    id v14 = [MEMORY[0x1E4F60CB0] log];
    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v15 = *(void *)(a1 + 16);
      int v16 = *(_DWORD *)(a1 + 12);
      int v18 = 138543618;
      uint64_t v19 = v15;
      __int16 v20 = 1024;
      int v21 = v16;
      _os_log_impl(&dword_1A7EFF000, v14, OS_LOG_TYPE_DEFAULT, "[%{public}@ #%u] updateEmailAddressAndAliases: Network is not up.", (uint8_t *)&v18, 0x12u);
    }

    goto LABEL_11;
  }
  id v9 = [*(id *)(a1 + 24) aliasLookupURL];
  if (v9)
  {
    id v10 = [MEMORY[0x1E4F18D50] requestWithURL:v9];
    [v10 setHTTPMethod:@"GET"];
    uint64_t v11 = [*(id *)(a1 + 24) aliasAuthorizationHeader];
    [v10 setValue:v11 forHTTPHeaderField:@"Authorization"];

    id v12 = [*(id *)(a1 + 24) aliasUserAgent];
    [v10 setValue:v12 forHTTPHeaderField:*MEMORY[0x1E4F60748]];

    objc_msgSend(v10, "ak_addDeviceUDIDHeader");
    objc_msgSend(v10, "ak_addClientInfoHeader");
    if (v5)
    {
      id v13 = -[MFCastleEmailAliasUpdater _headerStringFromDate:](a1, v5);
      [v10 setValue:v13 forHTTPHeaderField:@"If-Modified-Since"];
    }
    if (v6) {
      [v10 setValue:v6 forKey:@"If-None-Match"];
    }
  }
  else
  {
    id v10 = 0;
  }

LABEL_14:
  return v10;
}

void __90__MFCastleEmailAliasUpdater__getEmailAddressAndAliasesWithLastSyncDate_entityTag_handler___block_invoke(uint64_t a1, void *a2)
{
  id v6 = a2;
  uint64_t v3 = *(void *)(a1 + 32);
  if (v3) {
    v4 = *(NSObject **)(v3 + 32);
  }
  else {
    v4 = 0;
  }
  dispatch_assert_queue_V2(v4);
  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
  uint64_t v5 = *(void *)(a1 + 32);
  if (v5) {
    *(unsigned char *)(v5 + 8) = 0;
  }
}

- (void)_getEmailAddressAndAliasesWithRequest:(void *)a3 handler:
{
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  id v6 = a3;
  if (a1)
  {
    id v7 = -[MFCastleEmailAliasUpdater _createURLSession]((void *)a1);
    v14[0] = MEMORY[0x1E4F143A8];
    v14[1] = 3221225472;
    v14[2] = __75__MFCastleEmailAliasUpdater__getEmailAddressAndAliasesWithRequest_handler___block_invoke;
    v14[3] = &unk_1E5D3E0E8;
    v14[4] = a1;
    id v16 = v6;
    id v8 = v7;
    id v15 = v8;
    id v9 = [v8 dataTaskWithRequest:v5 completionHandler:v14];
    id v10 = [MEMORY[0x1E4F60CB0] log];
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      id v11 = *(id *)(a1 + 16);
      int v12 = *(_DWORD *)(a1 + 12);
      uint64_t v13 = [v9 taskIdentifier];
      *(_DWORD *)buf = 138543874;
      id v18 = v11;
      __int16 v19 = 1024;
      int v20 = v12;
      __int16 v21 = 2048;
      uint64_t v22 = v13;
      _os_log_impl(&dword_1A7EFF000, v10, OS_LOG_TYPE_DEFAULT, "[%{public}@ #%u] Starting URL session task %llu", buf, 0x1Cu);
    }
    [v9 resume];
  }
}

- (void)_createURLSession
{
  v1 = a1;
  if (a1)
  {
    v2 = [MEMORY[0x1E4F18DD0] ephemeralSessionConfiguration];
    [v2 setTimeoutIntervalForResource:300.0];
    uint64_t v3 = -[MFCastleEmailAliasUpdater _sourceApplicationBundleIdentifier]((uint64_t)v1);
    if (v3)
    {
      objc_msgSend(v2, "set_sourceApplicationBundleIdentifier:", v3);
      v4 = (void *)[objc_alloc(MEMORY[0x1E4F4EF78]) initWithIdentifier:v3];
    }
    else
    {
      v4 = (void *)[objc_alloc(MEMORY[0x1E4F4EF78]) initWithIdentifier:@"maild"];
    }
    objc_msgSend(v2, "set_appleIDContext:", v4);

    id v5 = objc_alloc_init(MEMORY[0x1E4F28F08]);
    [v5 setMaxConcurrentOperationCount:1];
    [v5 setUnderlyingQueue:v1[4]];
    v1 = [MEMORY[0x1E4F18DC0] sessionWithConfiguration:v2 delegate:0 delegateQueue:v5];
  }
  return v1;
}

void __75__MFCastleEmailAliasUpdater__getEmailAddressAndAliasesWithRequest_handler___block_invoke(uint64_t a1, void *a2, void *a3, void *a4)
{
  id v13 = a2;
  id v7 = a3;
  id v8 = a4;
  uint64_t v9 = *(void *)(a1 + 32);
  if (v9) {
    id v10 = *(NSObject **)(v9 + 32);
  }
  else {
    id v10 = 0;
  }
  dispatch_assert_queue_V2(v10);
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    id v11 = v7;
  }
  else {
    id v11 = 0;
  }
  id v12 = v11;
  -[MFCastleEmailAliasUpdater _getEmailAddressAndAliasesWithResponse:responseData:error:handler:](*(void *)(a1 + 32), v12, v13, v8, *(void **)(a1 + 48));
  [*(id *)(a1 + 40) invalidateAndCancel];
}

- (void)_getEmailAddressAndAliasesWithResponse:(void *)a3 responseData:(void *)a4 error:(void *)a5 handler:
{
  uint64_t v61 = *MEMORY[0x1E4F143B8];
  id v9 = a2;
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  if (a1)
  {
    dispatch_assert_queue_V2(*(dispatch_queue_t *)(a1 + 32));
    if (!v9 || v11)
    {
      id v18 = [MEMORY[0x1E4F60CB0] log];
      if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
      {
        id v41 = *(id *)(a1 + 16);
        int v42 = *(_DWORD *)(a1 + 12);
        v43 = objc_msgSend(v11, "ef_publicDescription");
        *(_DWORD *)buf = 138543874;
        id v54 = v41;
        __int16 v55 = 1024;
        int v56 = v42;
        __int16 v57 = 2114;
        *(void *)&long long v58 = v43;
        _os_log_error_impl(&dword_1A7EFF000, v18, OS_LOG_TYPE_ERROR, "[%{public}@ #%u] updateEmailAddressAndAliases: Email alias request failed: %{public}@", buf, 0x1Cu);
      }
      uint64_t v17 = objc_alloc_init(CastleEmailAliasUpdateResult);
      v12[2](v12, v17);
    }
    else
    {
      id v13 = [MEMORY[0x1E4F60CB0] log];
      if (os_log_type_enabled(v13, OS_LOG_TYPE_DEBUG))
      {
        id v52 = *(id *)(a1 + 16);
        int v36 = *(_DWORD *)(a1 + 12);
        int v50 = [v9 statusCode];
        id v37 = [NSString alloc];
        uint64_t v38 = (uint64_t)v10;
        if (!v10)
        {
          uint64_t v38 = [MEMORY[0x1E4F1C9B8] data];
        }
        v48 = (void *)v38;
        v39 = (void *)[v37 initWithData:v38 encoding:4];
        *(_DWORD *)buf = 138544130;
        v40 = v52;
        id v54 = v52;
        __int16 v55 = 1024;
        int v56 = v36;
        __int16 v57 = 1024;
        LODWORD(v58) = v50;
        WORD2(v58) = 2112;
        *(void *)((char *)&v58 + 6) = v39;
        _os_log_debug_impl(&dword_1A7EFF000, v13, OS_LOG_TYPE_DEBUG, "[%{public}@ #%u] updateEmailAddressAndAliases: Received (status=%d) '%@'", buf, 0x22u);
        if (!v10)
        {

          v40 = v52;
        }
      }
      if ([v9 statusCode] == 304)
      {
        id v14 = [MEMORY[0x1E4F60CB0] log];
        if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
        {
          id v15 = *(void **)(a1 + 16);
          int v16 = *(_DWORD *)(a1 + 12);
          *(_DWORD *)buf = 138543618;
          id v54 = v15;
          __int16 v55 = 1024;
          int v56 = v16;
          _os_log_impl(&dword_1A7EFF000, v14, OS_LOG_TYPE_DEFAULT, "[%{public}@ #%u] updateEmailAddressAndAliases: Not Modified.", buf, 0x12u);
        }

        LOBYTE(v47) = 0;
        uint64_t v17 = [[CastleEmailAliasUpdateResult alloc] initWithReceiveEmailAliasAddresses:0 emailAddresses:0 defaultEmailAddress:0 entityTag:0 isSuccess:1 notModified:1 accountNeedsToUpdateProperties:v47];
        v12[2](v12, v17);
      }
      else
      {
        uint64_t v19 = [v9 statusCode];
        if (v10 && v19 == 200)
        {
          uint64_t v17 = [v9 valueForHTTPHeaderField:@"ETag"];
          uint64_t v20 = -[MFCastleEmailAliasUpdater _aliasesFromData:](a1, v10);
          __int16 v21 = (void *)v20;
          uint64_t v22 = (void *)MEMORY[0x1E4F1CC08];
          if (v20) {
            uint64_t v22 = (void *)v20;
          }
          uint64_t v23 = v22;

          v24 = -[MFCastleEmailAliasUpdater _emailsFromData:](a1, v10);
          v51 = -[MFCastleEmailAliasUpdater _defaultEmailAddressFromData:](a1, v10);
          v25 = [MEMORY[0x1E4F60CB0] log];
          if (os_log_type_enabled(v25, OS_LOG_TYPE_DEFAULT))
          {
            v49 = v24;
            id v26 = *(id *)(a1 + 16);
            int v27 = *(_DWORD *)(a1 + 12);
            int v28 = [(CastleEmailAliasUpdateResult *)v23 count];
            int v29 = [v49 count];
            *(_DWORD *)buf = 138544642;
            id v54 = v26;
            __int16 v55 = 1024;
            int v56 = v27;
            __int16 v57 = 1024;
            LODWORD(v58) = v28;
            WORD2(v58) = 1024;
            *(_DWORD *)((char *)&v58 + 6) = v29;
            WORD5(v58) = 1024;
            HIDWORD(v58) = v51 != 0;
            __int16 v59 = 2114;
            v60 = v17;
            _os_log_impl(&dword_1A7EFF000, v25, OS_LOG_TYPE_DEFAULT, "[%{public}@ #%u] updateEmailAddressAndAliases: Got response. aliases: %d, emails: %d, defaultEmail: %{BOOL}d, entityTag: %{public}@", buf, 0x2Eu);

            v24 = v49;
          }

          LOBYTE(v47) = 0;
          v30 = [[CastleEmailAliasUpdateResult alloc] initWithReceiveEmailAliasAddresses:v23 emailAddresses:v24 defaultEmailAddress:v51 entityTag:v17 isSuccess:1 notModified:0 accountNeedsToUpdateProperties:v47];
          v12[2](v12, v30);
        }
        else
        {
          v31 = [v9 URL];
          uint64_t v17 = [v31 host];

          v32 = [MEMORY[0x1E4F60CB0] log];
          if (os_log_type_enabled(v32, OS_LOG_TYPE_ERROR))
          {
            id v44 = *(id *)(a1 + 16);
            int v45 = *(_DWORD *)(a1 + 12);
            int v46 = [v9 statusCode];
            *(_DWORD *)buf = 138544130;
            id v54 = v44;
            __int16 v55 = 1024;
            int v56 = v45;
            __int16 v57 = 2112;
            *(void *)&long long v58 = v17;
            WORD4(v58) = 1024;
            *(_DWORD *)((char *)&v58 + 10) = v46;
            _os_log_error_impl(&dword_1A7EFF000, v32, OS_LOG_TYPE_ERROR, "[%{public}@ #%u] updateEmailAddressAndAliases: Email alias request to [%@] failed with status code [%d]", buf, 0x22u);
          }
          if (([v9 statusCode] == 404 || (uint64_t v35 = objc_msgSend(v9, "statusCode"), !v10) || v35 == 405)
            && [(CastleEmailAliasUpdateResult *)v17 hasPrefix:@"p99-"])
          {
            v33 = [MEMORY[0x1E4F60CB0] log];
            if (os_log_type_enabled(v33, OS_LOG_TYPE_ERROR)) {
              -[MFCastleEmailAliasUpdater _getEmailAddressAndAliasesWithResponse:responseData:error:handler:](a1, (uint64_t)v17, v33);
            }

            char v34 = 1;
          }
          else
          {
            char v34 = 0;
          }
          LOBYTE(v47) = v34;
          uint64_t v23 = [[CastleEmailAliasUpdateResult alloc] initWithReceiveEmailAliasAddresses:0 emailAddresses:0 defaultEmailAddress:0 entityTag:0 isSuccess:0 notModified:0 accountNeedsToUpdateProperties:v47];
          v12[2](v12, v23);
        }
      }
    }
  }
}

- (id)_aliasesFromData:(uint64_t)a1
{
  uint64_t v37 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  uint64_t v20 = v3;
  if (a1)
  {
    __int16 v21 = [MEMORY[0x1E4F28D90] JSONObjectWithData:v3 options:0 error:0];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      uint64_t v19 = [v21 objectForKey:@"aliases"];
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        long long v33 = 0u;
        long long v34 = 0u;
        long long v31 = 0u;
        long long v32 = 0u;
        obuint64_t j = v19;
        uint64_t v4 = [obj countByEnumeratingWithState:&v31 objects:v36 count:16];
        if (v4)
        {
          id v5 = 0;
          uint64_t v24 = *(void *)v32;
          uint64_t v25 = v4;
          do
          {
            for (uint64_t i = 0; i != v25; ++i)
            {
              if (*(void *)v32 != v24) {
                objc_enumerationMutation(obj);
              }
              id v6 = *(void **)(*((void *)&v31 + 1) + 8 * i);
              objc_opt_class();
              if (objc_opt_isKindOfClass())
              {
                id v7 = [v6 objectForKeyedSubscript:@"fullName"];
                objc_opt_class();
                if (objc_opt_isKindOfClass())
                {
                  uint64_t v23 = [v6 objectForKeyedSubscript:@"emails"];
                  objc_opt_class();
                  if (objc_opt_isKindOfClass())
                  {
                    long long v29 = 0u;
                    long long v30 = 0u;
                    long long v27 = 0u;
                    long long v28 = 0u;
                    id v8 = v23;
                    uint64_t v9 = [v8 countByEnumeratingWithState:&v27 objects:v35 count:16];
                    if (v9)
                    {
                      uint64_t v10 = *(void *)v28;
                      do
                      {
                        for (uint64_t j = 0; j != v9; ++j)
                        {
                          if (*(void *)v28 != v10) {
                            objc_enumerationMutation(v8);
                          }
                          id v12 = *(void **)(*((void *)&v27 + 1) + 8 * j);
                          objc_opt_class();
                          if (objc_opt_isKindOfClass())
                          {
                            id v13 = (void *)MEMORY[0x1E4F60800];
                            id v14 = [v12 objectForKeyedSubscript:@"address"];
                            id v15 = [v13 componentsWithString:v14];

                            [v15 setDisplayName:v7];
                            int v16 = [v15 stringValue];
                            if (!v5)
                            {
                              id v5 = [MEMORY[0x1E4F1CA60] dictionary];
                            }
                            uint64_t v17 = objc_msgSend(v12, "objectForKeyedSubscript:", @"canSendFrom", v19, v20);
                            [v5 setObject:v17 forKeyedSubscript:v16];
                          }
                        }
                        uint64_t v9 = [v8 countByEnumeratingWithState:&v27 objects:v35 count:16];
                      }
                      while (v9);
                    }
                  }
                }
              }
            }
            uint64_t v25 = [obj countByEnumeratingWithState:&v31 objects:v36 count:16];
          }
          while (v25);
        }
        else
        {
          id v5 = 0;
        }
      }
      else
      {
        id v5 = 0;
      }
    }
    else
    {
      id v5 = 0;
    }
  }
  else
  {
    id v5 = 0;
  }

  return v5;
}

- (id)_emailsFromData:(uint64_t)a1
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  id v15 = v3;
  if (a1)
  {
    int v16 = [MEMORY[0x1E4F28D90] JSONObjectWithData:v3 options:0 error:0];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      id v14 = [v16 objectForKey:@"account"];
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        id v13 = [v14 objectForKey:@"emails"];
        objc_opt_class();
        if (objc_opt_isKindOfClass())
        {
          long long v19 = 0u;
          long long v20 = 0u;
          long long v17 = 0u;
          long long v18 = 0u;
          id v4 = v13;
          id v5 = 0;
          uint64_t v6 = [v4 countByEnumeratingWithState:&v17 objects:v21 count:16];
          if (v6)
          {
            uint64_t v7 = *(void *)v18;
            do
            {
              for (uint64_t i = 0; i != v6; ++i)
              {
                if (*(void *)v18 != v7) {
                  objc_enumerationMutation(v4);
                }
                uint64_t v9 = *(void **)(*((void *)&v17 + 1) + 8 * i);
                objc_opt_class();
                if (objc_opt_isKindOfClass())
                {
                  if (!v5)
                  {
                    id v5 = [MEMORY[0x1E4F1CA60] dictionary];
                  }
                  uint64_t v10 = objc_msgSend(v9, "objectForKeyedSubscript:", @"canSendFrom", v13);
                  id v11 = [v9 objectForKeyedSubscript:@"address"];
                  [v5 setObject:v10 forKeyedSubscript:v11];
                }
              }
              uint64_t v6 = [v4 countByEnumeratingWithState:&v17 objects:v21 count:16];
            }
            while (v6);
          }
        }
        else
        {
          id v5 = 0;
        }
      }
      else
      {
        id v5 = 0;
      }
    }
    else
    {
      id v5 = 0;
    }
  }
  else
  {
    id v5 = 0;
  }

  return v5;
}

- (id)_defaultEmailAddressFromData:(uint64_t)a1
{
  id v3 = a2;
  if (a1)
  {
    id v4 = [MEMORY[0x1E4F28D90] JSONObjectWithData:v3 options:0 error:0];
    id v5 = [v4 objectForKeyedSubscript:@"defaultAddress"];
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {

      id v5 = 0;
    }
  }
  else
  {
    id v5 = 0;
  }

  return v5;
}

- (id)_headerStringFromDate:(uint64_t)a1
{
  id v3 = a2;
  if (a1)
  {
    id v4 = objc_alloc_init(MEMORY[0x1E4F28C10]);
    id v5 = objc_msgSend(MEMORY[0x1E4F1CA20], "ef_posixLocale");
    [v4 setLocale:v5];

    [v4 setDateFormat:@"EEE, dd MMM yyyy HH:mm:ss zzz"];
    uint64_t v6 = [v4 stringFromDate:v3];
  }
  else
  {
    uint64_t v6 = 0;
  }

  return v6;
}

- (id)_sourceApplicationBundleIdentifier
{
  if (a1)
  {
    v1 = MFUserAgent();
    if (v1 && (objc_opt_respondsToSelector() & 1) != 0)
    {
      v2 = [v1 sourceApplicationBundleIdentifier];
    }
    else
    {
      v2 = 0;
    }
  }
  else
  {
    v2 = 0;
  }
  return v2;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_queue, 0);
  objc_storeStrong((id *)&self->_aliasSupport, 0);
  objc_storeStrong((id *)&self->_accountID, 0);
}

- (void)_getEmailAddressAndAliasesWithResponse:(os_log_t)log responseData:error:handler:.cold.1(uint64_t a1, uint64_t a2, os_log_t log)
{
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  uint64_t v3 = *(void *)(a1 + 16);
  int v4 = *(_DWORD *)(a1 + 12);
  int v5 = 138543874;
  uint64_t v6 = v3;
  __int16 v7 = 1024;
  int v8 = v4;
  __int16 v9 = 2112;
  uint64_t v10 = a2;
  _os_log_error_impl(&dword_1A7EFF000, log, OS_LOG_TYPE_ERROR, "[%{public}@ #%u] updateEmailAddressAndAliases: Email alias requests configured to use [%@], scheduling reprovision", (uint8_t *)&v5, 0x1Cu);
}

@end