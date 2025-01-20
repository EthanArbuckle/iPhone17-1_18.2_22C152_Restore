@interface SKAAccountProvider
+ (id)logger;
- (BOOL)_shouldAttemptReauth;
- (NSMutableDictionary)cachedJwtTokenMap;
- (OS_dispatch_queue)tokenFetchQueue;
- (SKAAccountProvider)init;
- (double)cachedTimestamp;
- (id)_jwtTokenForPrimaryAccountForIdentifier:(id)a3 withError:(id *)a4;
- (id)_primarySystemiCloudAccountWithError:(id *)a3;
- (id)presenceJwtTokenForPrimaryAccountWithError:(id *)a3;
- (id)statusJwtTokenForPrimaryAccountWithError:(id *)a3;
- (int64_t)_authResetTime;
- (int64_t)_maxReauthCount;
- (void)_markReauthAttempt;
- (void)_refreshedJwtTokenForIdentifier:(id)a3 withCompletion:(id)a4;
- (void)refreshCredentialForPrimaryAccountWithCompletion:(id)a3;
- (void)refreshedPresenceJwtTokenForPrimaryAccountWithCompletion:(id)a3;
- (void)refreshedStatusJwtTokenForPrimaryAccountWithCompletion:(id)a3;
- (void)setCachedJwtTokenMap:(id)a3;
- (void)setCachedTimestamp:(double)a3;
- (void)setTokenFetchQueue:(id)a3;
@end

@implementation SKAAccountProvider

- (SKAAccountProvider)init
{
  v10.receiver = self;
  v10.super_class = (Class)SKAAccountProvider;
  v2 = [(SKAAccountProvider *)&v10 init];
  if (v2)
  {
    v3 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    v4 = dispatch_queue_attr_make_with_qos_class(v3, QOS_CLASS_DEFAULT, 0);

    dispatch_queue_t v5 = dispatch_queue_create("com.apple.StatusKit.InvitationManager.cleanup", v4);
    tokenFetchQueue = v2->_tokenFetchQueue;
    v2->_tokenFetchQueue = (OS_dispatch_queue *)v5;

    v2->_cachedTimestamp = 0.0;
    v7 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x263EFF9A0]);
    cachedJwtTokenMap = v2->_cachedJwtTokenMap;
    v2->_cachedJwtTokenMap = v7;
  }
  return v2;
}

- (id)statusJwtTokenForPrimaryAccountWithError:(id *)a3
{
  return [(SKAAccountProvider *)self _jwtTokenForPrimaryAccountForIdentifier:@"com.apple.gs.sharedchannels.auth" withError:a3];
}

- (id)presenceJwtTokenForPrimaryAccountWithError:(id *)a3
{
  return [(SKAAccountProvider *)self _jwtTokenForPrimaryAccountForIdentifier:@"com.apple.gs.sharedexperiences.auth" withError:a3];
}

- (id)_jwtTokenForPrimaryAccountForIdentifier:(id)a3 withError:(id *)a4
{
  uint64_t v39 = *MEMORY[0x263EF8340];
  id v6 = a3;
  uint64_t v29 = 0;
  v30 = &v29;
  uint64_t v31 = 0x3032000000;
  v32 = __Block_byref_object_copy__1;
  v33 = __Block_byref_object_dispose__1;
  id v34 = 0;
  uint64_t v23 = 0;
  v24 = &v23;
  uint64_t v25 = 0x3032000000;
  v26 = __Block_byref_object_copy__1;
  v27 = __Block_byref_object_dispose__1;
  id v28 = 0;
  tokenFetchQueue = self->_tokenFetchQueue;
  uint64_t v15 = MEMORY[0x263EF8330];
  uint64_t v16 = 3221225472;
  v17 = __72__SKAAccountProvider__jwtTokenForPrimaryAccountForIdentifier_withError___block_invoke;
  v18 = &unk_2646E1AC8;
  v19 = self;
  v21 = &v23;
  v22 = &v29;
  id v8 = v6;
  id v20 = v8;
  dispatch_sync(tokenFetchQueue, &v15);
  if (a4)
  {
    v9 = (void *)v24[5];
    if (v9) {
      *a4 = v9;
    }
  }
  objc_super v10 = objc_msgSend((id)v30[5], "ska_sha256Hash", v15, v16, v17, v18, v19);
  v11 = [v10 substringToIndex:5];

  v12 = +[SKAAccountProvider logger];
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412546;
    v36 = v11;
    __int16 v37 = 2112;
    id v38 = v8;
    _os_log_impl(&dword_22480C000, v12, OS_LOG_TYPE_DEFAULT, "Fetched token hash:%@ for %@", buf, 0x16u);
  }

  id v13 = (id)v30[5];
  _Block_object_dispose(&v23, 8);

  _Block_object_dispose(&v29, 8);
  return v13;
}

void __72__SKAAccountProvider__jwtTokenForPrimaryAccountForIdentifier_withError___block_invoke(uint64_t a1)
{
  v2 = (void *)MEMORY[0x22A619D40]();
  v3 = *(void **)(a1 + 32);
  id v19 = 0;
  v4 = [v3 _primarySystemiCloudAccountWithError:&v19];
  id v5 = v19;
  id v6 = v19;
  if (v6) {
    objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 48) + 8) + 40), v5);
  }
  if (!v4)
  {
    uint64_t v15 = +[SKAAccountProvider logger];
    if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR)) {
      __72__SKAAccountProvider__jwtTokenForPrimaryAccountForIdentifier_withError___block_invoke_cold_1();
    }
    goto LABEL_11;
  }
  uint64_t v7 = objc_msgSend(v4, "aida_tokenWithExpiryCheckForService:", *(void *)(a1 + 40));
  uint64_t v8 = *(void *)(*(void *)(a1 + 56) + 8);
  v9 = *(void **)(v8 + 40);
  *(void *)(v8 + 40) = v7;

  if (!*(void *)(*(void *)(*(void *)(a1 + 56) + 8) + 40))
  {
    objc_super v10 = +[SKAAccountProvider logger];
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR)) {
      __72__SKAAccountProvider__jwtTokenForPrimaryAccountForIdentifier_withError___block_invoke_cold_2();
    }

    double v11 = *(double *)(*(void *)(a1 + 32) + 16) + 300.0;
    v12 = [MEMORY[0x263EFF910] date];
    [v12 timeIntervalSince1970];
    double v14 = v13;

    if (v11 > v14)
    {
      uint64_t v15 = [*(id *)(a1 + 32) cachedJwtTokenMap];
      uint64_t v16 = [v15 objectForKeyedSubscript:*(void *)(a1 + 40)];
      uint64_t v17 = *(void *)(*(void *)(a1 + 56) + 8);
      v18 = *(void **)(v17 + 40);
      *(void *)(v17 + 40) = v16;

LABEL_11:
    }
  }
}

- (void)refreshCredentialForPrimaryAccountWithCompletion:(id)a3
{
  v33[1] = *MEMORY[0x263EF8340];
  id v4 = a3;
  if ([(SKAAccountProvider *)self _shouldAttemptReauth])
  {
    [(SKAAccountProvider *)self _markReauthAttempt];
    id v5 = objc_alloc_init(MEMORY[0x263EFB210]);
    if (!v5)
    {
      id v6 = +[SKAAccountProvider logger];
      if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR)) {
        -[SKAAccountProvider refreshCredentialForPrimaryAccountWithCompletion:]();
      }
    }
    uint64_t v7 = (void *)MEMORY[0x22A619D40]();
    id v27 = 0;
    uint64_t v8 = [(SKAAccountProvider *)self _primarySystemiCloudAccountWithError:&v27];
    id v9 = v27;
    if (v8)
    {
      id v10 = objc_alloc_init(MEMORY[0x263F29110]);
      [v10 setAuthenticationType:0];
      [v10 setIsUsernameEditable:0];
      [v10 setServiceType:1];
      double v11 = objc_msgSend(v8, "aida_alternateDSID");
      v12 = v11;
      if (v11 && [v11 length])
      {
        [v10 setAltDSID:v12];
      }
      else
      {
        uint64_t v17 = +[SKAAccountProvider logger];
        if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR)) {
          -[SKAAccountProvider refreshCredentialForPrimaryAccountWithCompletion:]();
        }
      }
      id v18 = objc_alloc_init(MEMORY[0x263F29118]);
      tokenFetchQueue = self->_tokenFetchQueue;
      v22[0] = MEMORY[0x263EF8330];
      v22[1] = 3221225472;
      v22[2] = __71__SKAAccountProvider_refreshCredentialForPrimaryAccountWithCompletion___block_invoke_37;
      v22[3] = &unk_2646E1B18;
      id v23 = v18;
      id v24 = v10;
      uint64_t v25 = self;
      id v26 = v4;
      id v20 = v10;
      id v21 = v18;
      dispatch_async(tokenFetchQueue, v22);
    }
    else
    {
      v12 = +[SKAAccountProvider logger];
      if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR)) {
        -[SKAAccountProvider refreshCredentialForPrimaryAccountWithCompletion:]();
      }
    }
  }
  else
  {
    double v13 = +[SKAAccountProvider logger];
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_22480C000, v13, OS_LOG_TYPE_DEFAULT, "Reauth has hit rate limit.  Not attempting.", buf, 2u);
    }

    double v14 = (void *)MEMORY[0x263F087E8];
    uint64_t v32 = *MEMORY[0x263F07F80];
    v33[0] = @"Reauth has hit rate limit";
    uint64_t v15 = [NSDictionary dictionaryWithObjects:v33 forKeys:&v32 count:1];
    uint64_t v16 = [v14 errorWithDomain:@"SKAAccountProviderErrorDomain" code:-1000 userInfo:v15];

    block[0] = MEMORY[0x263EF8330];
    block[1] = 3221225472;
    block[2] = __71__SKAAccountProvider_refreshCredentialForPrimaryAccountWithCompletion___block_invoke;
    block[3] = &unk_2646E1790;
    id v29 = v16;
    id v30 = v4;
    id v5 = v16;
    dispatch_async(MEMORY[0x263EF83A0], block);

    id v9 = v30;
  }
}

uint64_t __71__SKAAccountProvider_refreshCredentialForPrimaryAccountWithCompletion___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void, void, void))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40), 0, *(void *)(a1 + 32));
}

void __71__SKAAccountProvider_refreshCredentialForPrimaryAccountWithCompletion___block_invoke_37(void *a1)
{
  v1 = (void *)a1[4];
  uint64_t v2 = a1[5];
  v4[0] = MEMORY[0x263EF8330];
  v4[1] = 3221225472;
  v4[2] = __71__SKAAccountProvider_refreshCredentialForPrimaryAccountWithCompletion___block_invoke_2;
  v4[3] = &unk_2646E1AF0;
  v3 = (void *)a1[7];
  v4[4] = a1[6];
  id v5 = v3;
  [v1 authenticateWithContext:v2 completion:v4];
}

void __71__SKAAccountProvider_refreshCredentialForPrimaryAccountWithCompletion___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  uint64_t v7 = +[SKAAccountProvider logger];
  uint64_t v8 = v7;
  if (!v5 || v6)
  {
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR)) {
      __71__SKAAccountProvider_refreshCredentialForPrimaryAccountWithCompletion___block_invoke_2_cold_1();
    }

    v17[0] = MEMORY[0x263EF8330];
    v17[1] = 3221225472;
    v17[2] = __71__SKAAccountProvider_refreshCredentialForPrimaryAccountWithCompletion___block_invoke_39;
    v17[3] = &unk_2646E1790;
    id v19 = *(id *)(a1 + 40);
    id v18 = v6;
    dispatch_async(MEMORY[0x263EF83A0], v17);

    id v10 = v19;
  }
  else
  {
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_22480C000, v8, OS_LOG_TYPE_DEFAULT, "Auth refresh suceeded.", buf, 2u);
    }

    id v9 = [v5 objectForKey:*MEMORY[0x263F28FB0]];
    id v10 = v9;
    if (v9)
    {
      double v11 = [v9 objectForKey:@"com.apple.gs.sharedchannels.auth"];
      v12 = [v10 objectForKey:@"com.apple.gs.sharedexperiences.auth"];
      if (v11)
      {
        double v13 = [*(id *)(a1 + 32) cachedJwtTokenMap];
        [v13 setObject:v11 forKeyedSubscript:@"com.apple.gs.sharedchannels.auth"];
      }
      if (v12)
      {
        double v14 = [*(id *)(a1 + 32) cachedJwtTokenMap];
        [v14 setObject:v12 forKeyedSubscript:@"com.apple.gs.sharedexperiences.auth"];
      }
      uint64_t v15 = [MEMORY[0x263EFF910] date];
      [v15 timeIntervalSince1970];
      *(void *)(*(void *)(a1 + 32) + 16) = v16;
    }
    block[0] = MEMORY[0x263EF8330];
    block[1] = 3221225472;
    block[2] = __71__SKAAccountProvider_refreshCredentialForPrimaryAccountWithCompletion___block_invoke_38;
    block[3] = &unk_2646E1830;
    id v21 = *(id *)(a1 + 40);
    dispatch_async(MEMORY[0x263EF83A0], block);
  }
}

uint64_t __71__SKAAccountProvider_refreshCredentialForPrimaryAccountWithCompletion___block_invoke_38(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

uint64_t __71__SKAAccountProvider_refreshCredentialForPrimaryAccountWithCompletion___block_invoke_39(uint64_t a1)
{
  return (*(uint64_t (**)(void, void, void))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40), 0, *(void *)(a1 + 32));
}

- (void)refreshedStatusJwtTokenForPrimaryAccountWithCompletion:(id)a3
{
}

- (void)refreshedPresenceJwtTokenForPrimaryAccountWithCompletion:(id)a3
{
}

- (void)_refreshedJwtTokenForIdentifier:(id)a3 withCompletion:(id)a4
{
  v38[1] = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v7 = a4;
  if ([(SKAAccountProvider *)self _shouldAttemptReauth])
  {
    [(SKAAccountProvider *)self _markReauthAttempt];
    id v8 = objc_alloc_init(MEMORY[0x263EFB210]);
    if (!v8)
    {
      id v9 = +[SKAAccountProvider logger];
      if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR)) {
        -[SKAAccountProvider refreshCredentialForPrimaryAccountWithCompletion:]();
      }
    }
    id v10 = (void *)MEMORY[0x22A619D40]();
    id v32 = 0;
    double v11 = [(SKAAccountProvider *)self _primarySystemiCloudAccountWithError:&v32];
    id v12 = v32;
    if (v11)
    {
      id v13 = objc_alloc_init(MEMORY[0x263F29110]);
      [v13 setAuthenticationType:0];
      [v13 setIsUsernameEditable:0];
      [v13 setServiceType:1];
      double v14 = objc_msgSend(v11, "aida_alternateDSID");
      uint64_t v15 = v14;
      uint64_t v25 = v10;
      if (v14 && [v14 length])
      {
        [v13 setAltDSID:v15];
      }
      else
      {
        id v20 = +[SKAAccountProvider logger];
        if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR)) {
          -[SKAAccountProvider refreshCredentialForPrimaryAccountWithCompletion:]();
        }
      }
      id v21 = objc_alloc_init(MEMORY[0x263F29118]);
      tokenFetchQueue = self->_tokenFetchQueue;
      v26[0] = MEMORY[0x263EF8330];
      v26[1] = 3221225472;
      v26[2] = __69__SKAAccountProvider__refreshedJwtTokenForIdentifier_withCompletion___block_invoke_41;
      v26[3] = &unk_2646E16F0;
      id v27 = v21;
      id v28 = v13;
      id v29 = self;
      id v30 = v6;
      id v31 = v7;
      id v23 = v13;
      id v24 = v21;
      dispatch_async(tokenFetchQueue, v26);

      id v10 = v25;
    }
    else
    {
      uint64_t v15 = +[SKAAccountProvider logger];
      if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR)) {
        -[SKAAccountProvider refreshCredentialForPrimaryAccountWithCompletion:]();
      }
    }
  }
  else
  {
    uint64_t v16 = +[SKAAccountProvider logger];
    if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_22480C000, v16, OS_LOG_TYPE_DEFAULT, "Reauth has hit rate limit.  Not attempting.", buf, 2u);
    }

    uint64_t v17 = (void *)MEMORY[0x263F087E8];
    uint64_t v37 = *MEMORY[0x263F07F80];
    v38[0] = @"Reauth has hit rate limit";
    id v18 = [NSDictionary dictionaryWithObjects:v38 forKeys:&v37 count:1];
    id v19 = [v17 errorWithDomain:@"SKAAccountProviderErrorDomain" code:-1000 userInfo:v18];

    block[0] = MEMORY[0x263EF8330];
    block[1] = 3221225472;
    block[2] = __69__SKAAccountProvider__refreshedJwtTokenForIdentifier_withCompletion___block_invoke;
    block[3] = &unk_2646E1790;
    id v34 = v19;
    id v35 = v7;
    id v8 = v19;
    dispatch_async(MEMORY[0x263EF83A0], block);

    id v12 = v35;
  }
}

uint64_t __69__SKAAccountProvider__refreshedJwtTokenForIdentifier_withCompletion___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void, void, void))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40), 0, *(void *)(a1 + 32));
}

void __69__SKAAccountProvider__refreshedJwtTokenForIdentifier_withCompletion___block_invoke_41(uint64_t a1)
{
  uint64_t v2 = *(void **)(a1 + 32);
  uint64_t v3 = *(void *)(a1 + 40);
  v5[0] = MEMORY[0x263EF8330];
  v5[1] = 3221225472;
  v5[2] = __69__SKAAccountProvider__refreshedJwtTokenForIdentifier_withCompletion___block_invoke_2;
  v5[3] = &unk_2646E1B40;
  id v4 = *(void **)(a1 + 56);
  v5[4] = *(void *)(a1 + 48);
  id v6 = v4;
  id v7 = *(id *)(a1 + 64);
  [v2 authenticateWithContext:v3 completion:v5];
}

void __69__SKAAccountProvider__refreshedJwtTokenForIdentifier_withCompletion___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  uint64_t v33 = *MEMORY[0x263EF8340];
  id v5 = a2;
  id v6 = a3;
  id v7 = +[SKAAccountProvider logger];
  id v8 = v7;
  if (!v5 || v6)
  {
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR)) {
      __71__SKAAccountProvider_refreshCredentialForPrimaryAccountWithCompletion___block_invoke_2_cold_1();
    }

    v23[0] = MEMORY[0x263EF8330];
    v23[1] = 3221225472;
    v23[2] = __69__SKAAccountProvider__refreshedJwtTokenForIdentifier_withCompletion___block_invoke_49;
    v23[3] = &unk_2646E1790;
    id v25 = *(id *)(a1 + 48);
    id v24 = v6;
    dispatch_async(MEMORY[0x263EF83A0], v23);

    id v10 = v25;
  }
  else
  {
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_22480C000, v8, OS_LOG_TYPE_DEFAULT, "Auth refresh suceeded.", buf, 2u);
    }

    id v9 = [v5 objectForKey:*MEMORY[0x263F28FB0]];
    id v10 = v9;
    if (v9)
    {
      double v11 = [v9 objectForKey:@"com.apple.gs.sharedchannels.auth"];
      id v12 = [v10 objectForKey:@"com.apple.gs.sharedexperiences.auth"];
      if (v11)
      {
        id v13 = [*(id *)(a1 + 32) cachedJwtTokenMap];
        [v13 setObject:v11 forKeyedSubscript:@"com.apple.gs.sharedchannels.auth"];
      }
      if (v12)
      {
        double v14 = [*(id *)(a1 + 32) cachedJwtTokenMap];
        [v14 setObject:v12 forKeyedSubscript:@"com.apple.gs.sharedexperiences.auth"];
      }
      uint64_t v15 = [MEMORY[0x263EFF910] date];
      [v15 timeIntervalSince1970];
      *(void *)(*(void *)(a1 + 32) + 16) = v16;

      uint64_t v17 = [v10 objectForKey:*(void *)(a1 + 40)];
    }
    else
    {
      uint64_t v17 = 0;
    }
    id v18 = +[SKAAccountProvider logger];
    if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
    {
      id v19 = @"NO";
      uint64_t v20 = *(void *)(a1 + 40);
      if (!v17) {
        id v19 = @"YES";
      }
      *(_DWORD *)buf = 138412546;
      id v30 = v19;
      __int16 v31 = 2112;
      uint64_t v32 = v20;
      _os_log_impl(&dword_22480C000, v18, OS_LOG_TYPE_DEFAULT, "Did fetch token post refresh:%@ for %@", buf, 0x16u);
    }

    block[0] = MEMORY[0x263EF8330];
    block[1] = 3221225472;
    block[2] = __69__SKAAccountProvider__refreshedJwtTokenForIdentifier_withCompletion___block_invoke_48;
    block[3] = &unk_2646E1790;
    id v21 = *(id *)(a1 + 48);
    id v27 = v17;
    id v28 = v21;
    id v22 = v17;
    dispatch_async(MEMORY[0x263EF83A0], block);
  }
}

uint64_t __69__SKAAccountProvider__refreshedJwtTokenForIdentifier_withCompletion___block_invoke_48(uint64_t a1)
{
  return (*(uint64_t (**)(void, void, void))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40), *(void *)(a1 + 32), 0);
}

uint64_t __69__SKAAccountProvider__refreshedJwtTokenForIdentifier_withCompletion___block_invoke_49(uint64_t a1)
{
  return (*(uint64_t (**)(void, void, void))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40), 0, *(void *)(a1 + 32));
}

- (id)_primarySystemiCloudAccountWithError:(id *)a3
{
  uint64_t v13 = *MEMORY[0x263EF8340];
  uint64_t v3 = (void *)MEMORY[0x22A619D40](self, a2, a3);
  id v4 = +[SKAAccountProvider logger];
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    LOWORD(v11) = 0;
    _os_log_impl(&dword_22480C000, v4, OS_LOG_TYPE_DEFAULT, "Fetching primary iCloud account", (uint8_t *)&v11, 2u);
  }

  id v5 = objc_alloc_init(MEMORY[0x263EFB210]);
  if (v5)
  {
    id v6 = v5;
    id v7 = [v5 aida_accountForPrimaryiCloudAccount];
    id v8 = +[SKAAccountProvider logger];
    id v9 = v8;
    if (v7)
    {
      if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
      {
        int v11 = 138412290;
        id v12 = v7;
        _os_log_impl(&dword_22480C000, v9, OS_LOG_TYPE_DEFAULT, "Primary iCloud account determined: %@", (uint8_t *)&v11, 0xCu);
      }
    }
    else if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    {
      -[SKAAccountProvider _primarySystemiCloudAccountWithError:]();
    }
  }
  else
  {
    id v6 = +[SKAAccountProvider logger];
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR)) {
      -[SKAAccountProvider refreshCredentialForPrimaryAccountWithCompletion:]();
    }
    id v7 = 0;
  }

  return v7;
}

- (BOOL)_shouldAttemptReauth
{
  CFPropertyListRef v3 = CFPreferencesCopyAppValue(@"reauthCount", @"com.apple.StatusKitAgent");
  if (v3) {
    id v4 = (void *)v3;
  }
  else {
    id v4 = &unk_26D7BA130;
  }
  int64_t v5 = [(SKAAccountProvider *)self _maxReauthCount];
  if (v5 <= (int)[v4 intValue])
  {
    id v7 = (void *)CFPreferencesCopyAppValue(@"lastReauthTime", @"com.apple.StatusKitAgent");
    int64_t v8 = [(SKAAccountProvider *)self _authResetTime];
    if (v7
      && (uint64_t v9 = v8,
          [MEMORY[0x263EFF910] now],
          id v10 = objc_claimAutoreleasedReturnValue(),
          [v10 timeIntervalSinceDate:v7],
          double v12 = v11,
          v10,
          v12 <= (double)v9))
    {
      BOOL v6 = 0;
    }
    else
    {
      CFPreferencesSetAppValue(@"reauthCount", &unk_26D7BA130, @"com.apple.StatusKitAgent");
      BOOL v6 = 1;
    }
  }
  else
  {
    BOOL v6 = 1;
  }

  return v6;
}

- (void)_markReauthAttempt
{
  id v5 = [MEMORY[0x263EFF910] now];
  CFPreferencesSetAppValue(@"lastReauthTime", v5, @"com.apple.StatusKitAgent");
  CFPropertyListRef v2 = CFPreferencesCopyAppValue(@"reauthCount", @"com.apple.StatusKitAgent");
  if (v2) {
    CFPropertyListRef v3 = (void *)v2;
  }
  else {
    CFPropertyListRef v3 = &unk_26D7BA130;
  }
  id v4 = objc_msgSend(NSNumber, "numberWithInt:", objc_msgSend(v3, "intValue") + 1);
  CFPreferencesSetAppValue(@"reauthCount", v4, @"com.apple.StatusKitAgent");
}

- (int64_t)_maxReauthCount
{
  uint64_t v9 = *MEMORY[0x263EF8340];
  CFPropertyListRef v2 = [MEMORY[0x263F4A240] sharedInstanceForBagType:1];
  CFPropertyListRef v3 = [v2 objectForKey:@"shared-channels-reauth-max-count"];

  if (v3 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
  {
    int64_t v4 = [v3 integerValue];
    id v5 = +[SKAAccountProvider logger];
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      int v7 = 134217984;
      int64_t v8 = v4;
      _os_log_impl(&dword_22480C000, v5, OS_LOG_TYPE_DEFAULT, "Server bag indicates our max reauth count should be %lu", (uint8_t *)&v7, 0xCu);
    }
  }
  else
  {
    int64_t v4 = 5;
  }

  return v4;
}

- (int64_t)_authResetTime
{
  uint64_t v9 = *MEMORY[0x263EF8340];
  CFPropertyListRef v2 = [MEMORY[0x263F4A240] sharedInstanceForBagType:1];
  CFPropertyListRef v3 = [v2 objectForKey:@"shared-channels-reauth-backoff-time-seconds"];

  if (v3 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
  {
    int64_t v4 = [v3 integerValue];
    id v5 = +[SKAAccountProvider logger];
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      int v7 = 134217984;
      int64_t v8 = v4;
      _os_log_impl(&dword_22480C000, v5, OS_LOG_TYPE_DEFAULT, "Server bag indicates our reauth backoff time should be %lu", (uint8_t *)&v7, 0xCu);
    }
  }
  else
  {
    int64_t v4 = 43200;
  }

  return v4;
}

+ (id)logger
{
  if (logger_onceToken_16 != -1) {
    dispatch_once(&logger_onceToken_16, &__block_literal_global_16);
  }
  CFPropertyListRef v2 = (void *)logger__logger_16;
  return v2;
}

uint64_t __28__SKAAccountProvider_logger__block_invoke()
{
  logger__logger_16 = (uint64_t)os_log_create("com.apple.StatusKit", "SKAAccountProvider");
  return MEMORY[0x270F9A758]();
}

- (OS_dispatch_queue)tokenFetchQueue
{
  return self->_tokenFetchQueue;
}

- (void)setTokenFetchQueue:(id)a3
{
}

- (double)cachedTimestamp
{
  return self->_cachedTimestamp;
}

- (void)setCachedTimestamp:(double)a3
{
  self->_cachedTimestamp = a3;
}

- (NSMutableDictionary)cachedJwtTokenMap
{
  return self->_cachedJwtTokenMap;
}

- (void)setCachedJwtTokenMap:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_cachedJwtTokenMap, 0);
  objc_storeStrong((id *)&self->_tokenFetchQueue, 0);
}

void __72__SKAAccountProvider__jwtTokenForPrimaryAccountForIdentifier_withError___block_invoke_cold_1()
{
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_1(&dword_22480C000, v0, v1, "Unable to fetch system account! Likely no iCloud account signed in.", v2, v3, v4, v5, v6);
}

void __72__SKAAccountProvider__jwtTokenForPrimaryAccountForIdentifier_withError___block_invoke_cold_2()
{
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_1(&dword_22480C000, v0, v1, "Unable to fetch JWT token! Will use cached token if not expired", v2, v3, v4, v5, v6);
}

- (void)refreshCredentialForPrimaryAccountWithCompletion:.cold.1()
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0(&dword_22480C000, v0, v1, "Unable to fetch system account! Likely no iCloud account signed in. Error: %@", v2, v3, v4, v5, v6);
}

- (void)refreshCredentialForPrimaryAccountWithCompletion:.cold.2()
{
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_1(&dword_22480C000, v0, v1, "altDSID not available for account", v2, v3, v4, v5, v6);
}

- (void)refreshCredentialForPrimaryAccountWithCompletion:.cold.3()
{
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_1(&dword_22480C000, v0, v1, "Unable to fetch account store!", v2, v3, v4, v5, v6);
}

void __71__SKAAccountProvider_refreshCredentialForPrimaryAccountWithCompletion___block_invoke_2_cold_1()
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0(&dword_22480C000, v0, v1, "Auth refresh failed with error: %@", v2, v3, v4, v5, v6);
}

- (void)_primarySystemiCloudAccountWithError:.cold.2()
{
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_1(&dword_22480C000, v0, v1, "Failed to find primary iCloud account", v2, v3, v4, v5, v6);
}

@end