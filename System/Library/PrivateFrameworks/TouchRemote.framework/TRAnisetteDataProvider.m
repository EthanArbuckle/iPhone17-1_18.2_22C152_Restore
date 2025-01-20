@interface TRAnisetteDataProvider
- (TRAnisetteDataProvider)initWithSession:(id)a3;
- (TRSession)session;
- (void)eraseAnisetteWithCompletion:(id)a3;
- (void)fetchAnisetteDataAndProvisionIfNecessary:(BOOL)a3 withCompletion:(id)a4;
- (void)legacyAnisetteDataForDSID:(id)a3 withCompletion:(id)a4;
- (void)provisionAnisetteWithCompletion:(id)a3;
- (void)setSession:(id)a3;
- (void)syncAnisetteWithSIMData:(id)a3 completion:(id)a4;
@end

@implementation TRAnisetteDataProvider

- (TRAnisetteDataProvider)initWithSession:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)TRAnisetteDataProvider;
  v6 = [(TRAnisetteDataProvider *)&v9 init];
  v7 = v6;
  if (v6) {
    objc_storeStrong((id *)&v6->_session, a3);
  }

  return v7;
}

- (void)provisionAnisetteWithCompletion:(id)a3
{
  uint64_t v13 = *MEMORY[0x263EF8340];
  id v4 = a3;
  if (_TRLogEnabled == 1)
  {
    id v5 = TRLogHandle();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315138;
      v12 = "-[TRAnisetteDataProvider provisionAnisetteWithCompletion:]";
      _os_log_impl(&dword_2149BE000, v5, OS_LOG_TYPE_DEFAULT, "%s", buf, 0xCu);
    }
  }
  v6 = objc_alloc_init(TRProvisionAnisetteDataRequest);
  session = self->_session;
  v9[0] = MEMORY[0x263EF8330];
  v9[1] = 3221225472;
  v9[2] = __58__TRAnisetteDataProvider_provisionAnisetteWithCompletion___block_invoke;
  v9[3] = &unk_264220F78;
  id v10 = v4;
  id v8 = v4;
  [(TRSession *)session sendRequest:v6 withResponseHandler:v9];
}

void __58__TRAnisetteDataProvider_provisionAnisetteWithCompletion___block_invoke(uint64_t a1, void *a2, void *a3)
{
  uint64_t v14 = *MEMORY[0x263EF8340];
  id v5 = a2;
  id v6 = a3;
  if (_TRLogEnabled == 1)
  {
    v7 = TRLogHandle();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      int v8 = 136315650;
      objc_super v9 = "-[TRAnisetteDataProvider provisionAnisetteWithCompletion:]_block_invoke";
      __int16 v10 = 2112;
      id v11 = v6;
      __int16 v12 = 2112;
      id v13 = v5;
      _os_log_impl(&dword_2149BE000, v7, OS_LOG_TYPE_DEFAULT, "%s: response %@, error %@", (uint8_t *)&v8, 0x20u);
    }
  }
  (*(void (**)(void, uint64_t, id))(*(void *)(a1 + 32) + 16))(*(void *)(a1 + 32), [v6 didSucceed], v5);
}

- (void)syncAnisetteWithSIMData:(id)a3 completion:(id)a4
{
  uint64_t v16 = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v7 = a4;
  if (_TRLogEnabled == 1)
  {
    int v8 = TRLogHandle();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315138;
      v15 = "-[TRAnisetteDataProvider syncAnisetteWithSIMData:completion:]";
      _os_log_impl(&dword_2149BE000, v8, OS_LOG_TYPE_DEFAULT, "%s", buf, 0xCu);
    }
  }
  objc_super v9 = objc_alloc_init(TRSyncAnisetteDataRequest);
  [(TRSyncAnisetteDataRequest *)v9 setSimData:v6];
  session = self->_session;
  v12[0] = MEMORY[0x263EF8330];
  v12[1] = 3221225472;
  v12[2] = __61__TRAnisetteDataProvider_syncAnisetteWithSIMData_completion___block_invoke;
  v12[3] = &unk_264220F78;
  id v13 = v7;
  id v11 = v7;
  [(TRSession *)session sendRequest:v9 withResponseHandler:v12];
}

void __61__TRAnisetteDataProvider_syncAnisetteWithSIMData_completion___block_invoke(uint64_t a1, void *a2, void *a3)
{
  uint64_t v14 = *MEMORY[0x263EF8340];
  id v5 = a2;
  id v6 = a3;
  if (_TRLogEnabled == 1)
  {
    id v7 = TRLogHandle();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      int v8 = 136315650;
      objc_super v9 = "-[TRAnisetteDataProvider syncAnisetteWithSIMData:completion:]_block_invoke";
      __int16 v10 = 2112;
      id v11 = v6;
      __int16 v12 = 2112;
      id v13 = v5;
      _os_log_impl(&dword_2149BE000, v7, OS_LOG_TYPE_DEFAULT, "%s: response %@, error %@", (uint8_t *)&v8, 0x20u);
    }
  }
  (*(void (**)(void, uint64_t, id))(*(void *)(a1 + 32) + 16))(*(void *)(a1 + 32), [v6 didSucceed], v5);
}

- (void)eraseAnisetteWithCompletion:(id)a3
{
  uint64_t v13 = *MEMORY[0x263EF8340];
  id v4 = a3;
  if (_TRLogEnabled == 1)
  {
    id v5 = TRLogHandle();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315138;
      __int16 v12 = "-[TRAnisetteDataProvider eraseAnisetteWithCompletion:]";
      _os_log_impl(&dword_2149BE000, v5, OS_LOG_TYPE_DEFAULT, "%s", buf, 0xCu);
    }
  }
  id v6 = objc_alloc_init(TREraseAnisetteDataRequest);
  session = self->_session;
  v9[0] = MEMORY[0x263EF8330];
  v9[1] = 3221225472;
  v9[2] = __54__TRAnisetteDataProvider_eraseAnisetteWithCompletion___block_invoke;
  v9[3] = &unk_264220F78;
  id v10 = v4;
  id v8 = v4;
  [(TRSession *)session sendRequest:v6 withResponseHandler:v9];
}

void __54__TRAnisetteDataProvider_eraseAnisetteWithCompletion___block_invoke(uint64_t a1, void *a2, void *a3)
{
  uint64_t v14 = *MEMORY[0x263EF8340];
  id v5 = a2;
  id v6 = a3;
  if (_TRLogEnabled == 1)
  {
    id v7 = TRLogHandle();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      int v8 = 136315650;
      objc_super v9 = "-[TRAnisetteDataProvider eraseAnisetteWithCompletion:]_block_invoke";
      __int16 v10 = 2112;
      id v11 = v6;
      __int16 v12 = 2112;
      id v13 = v5;
      _os_log_impl(&dword_2149BE000, v7, OS_LOG_TYPE_DEFAULT, "%s: response %@, error %@", (uint8_t *)&v8, 0x20u);
    }
  }
  (*(void (**)(void, uint64_t, id))(*(void *)(a1 + 32) + 16))(*(void *)(a1 + 32), [v6 didSucceed], v5);
}

- (void)fetchAnisetteDataAndProvisionIfNecessary:(BOOL)a3 withCompletion:(id)a4
{
  BOOL v4 = a3;
  uint64_t v20 = *MEMORY[0x263EF8340];
  id v6 = a4;
  if (_TRLogEnabled == 1)
  {
    id v7 = TRLogHandle();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315138;
      v19 = "-[TRAnisetteDataProvider fetchAnisetteDataAndProvisionIfNecessary:withCompletion:]";
      _os_log_impl(&dword_2149BE000, v7, OS_LOG_TYPE_DEFAULT, "%s", buf, 0xCu);
    }
  }
  int v8 = objc_alloc_init(TRFetchAnisetteDataRequest);
  [(TRFetchAnisetteDataRequest *)v8 setShouldProvision:v4];
  self->_fetchAnisetteInProgress = 1;
  session = self->_session;
  v16[0] = MEMORY[0x263EF8330];
  v16[1] = 3221225472;
  v16[2] = __82__TRAnisetteDataProvider_fetchAnisetteDataAndProvisionIfNecessary_withCompletion___block_invoke;
  v16[3] = &unk_264220FC8;
  v16[4] = self;
  id v10 = v6;
  id v17 = v10;
  [(TRSession *)session sendRequest:v8 withResponseHandler:v16];
  if (+[TRDefaults anisetteFetchTimeout]) {
    int64_t v11 = 1000000000 * +[TRDefaults anisetteFetchTimeout];
  }
  else {
    int64_t v11 = 120000000000;
  }
  dispatch_time_t v12 = dispatch_time(0, v11);
  v14[0] = MEMORY[0x263EF8330];
  v14[1] = 3221225472;
  v14[2] = __82__TRAnisetteDataProvider_fetchAnisetteDataAndProvisionIfNecessary_withCompletion___block_invoke_7;
  v14[3] = &unk_264220FF0;
  v14[4] = self;
  id v15 = v10;
  id v13 = v10;
  dispatch_after(v12, MEMORY[0x263EF83A0], v14);
}

void __82__TRAnisetteDataProvider_fetchAnisetteDataAndProvisionIfNecessary_withCompletion___block_invoke(uint64_t a1, void *a2, void *a3)
{
  uint64_t v21 = *MEMORY[0x263EF8340];
  id v5 = a2;
  id v6 = a3;
  if (_TRLogEnabled == 1)
  {
    id v7 = TRLogHandle();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315650;
      uint64_t v16 = "-[TRAnisetteDataProvider fetchAnisetteDataAndProvisionIfNecessary:withCompletion:]_block_invoke";
      __int16 v17 = 2112;
      id v18 = v6;
      __int16 v19 = 2112;
      id v20 = v5;
      _os_log_impl(&dword_2149BE000, v7, OS_LOG_TYPE_DEFAULT, "%s: response %@, error %@", buf, 0x20u);
    }
  }
  v11[0] = MEMORY[0x263EF8330];
  v11[1] = 3221225472;
  v11[2] = __82__TRAnisetteDataProvider_fetchAnisetteDataAndProvisionIfNecessary_withCompletion___block_invoke_4;
  v11[3] = &unk_264220FA0;
  int v8 = *(void **)(a1 + 40);
  v11[4] = *(void *)(a1 + 32);
  id v13 = v5;
  id v14 = v8;
  id v12 = v6;
  id v9 = v6;
  id v10 = v5;
  dispatch_async(MEMORY[0x263EF83A0], v11);
}

void __82__TRAnisetteDataProvider_fetchAnisetteDataAndProvisionIfNecessary_withCompletion___block_invoke_4(uint64_t a1)
{
  uint64_t v8 = *MEMORY[0x263EF8340];
  uint64_t v1 = *(void *)(a1 + 32);
  if (*(unsigned char *)(v1 + 8))
  {
    if (_TRLogEnabled == 1)
    {
      v3 = TRLogHandle();
      if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
      {
        int v6 = 136315138;
        id v7 = "-[TRAnisetteDataProvider fetchAnisetteDataAndProvisionIfNecessary:withCompletion:]_block_invoke";
        _os_log_impl(&dword_2149BE000, v3, OS_LOG_TYPE_DEFAULT, "%s: Completing without timeout", (uint8_t *)&v6, 0xCu);
      }

      uint64_t v1 = *(void *)(a1 + 32);
    }
    *(unsigned char *)(v1 + 8) = 0;
    uint64_t v4 = *(void *)(a1 + 56);
    id v5 = [*(id *)(a1 + 40) anisetteData];
    (*(void (**)(uint64_t, void *, void))(v4 + 16))(v4, v5, *(void *)(a1 + 48));
  }
}

void __82__TRAnisetteDataProvider_fetchAnisetteDataAndProvisionIfNecessary_withCompletion___block_invoke_7(uint64_t a1)
{
  uint64_t v7 = *MEMORY[0x263EF8340];
  uint64_t v1 = *(void *)(a1 + 32);
  if (*(unsigned char *)(v1 + 8))
  {
    *(unsigned char *)(v1 + 8) = 0;
    if (_TRLogEnabled == 1)
    {
      v3 = TRLogHandle();
      if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
      {
        int v5 = 136315138;
        int v6 = "-[TRAnisetteDataProvider fetchAnisetteDataAndProvisionIfNecessary:withCompletion:]_block_invoke";
        _os_log_impl(&dword_2149BE000, v3, OS_LOG_TYPE_DEFAULT, "%s: Timed out", (uint8_t *)&v5, 0xCu);
      }
    }
    uint64_t v4 = [MEMORY[0x263F087E8] errorWithDomain:@"TRNearbyDeviceErrorDomain" code:-12003 userInfo:0];
    (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
  }
}

- (void)legacyAnisetteDataForDSID:(id)a3 withCompletion:(id)a4
{
  uint64_t v16 = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v7 = a4;
  if (_TRLogEnabled == 1)
  {
    uint64_t v8 = TRLogHandle();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315138;
      id v15 = "-[TRAnisetteDataProvider legacyAnisetteDataForDSID:withCompletion:]";
      _os_log_impl(&dword_2149BE000, v8, OS_LOG_TYPE_DEFAULT, "%s", buf, 0xCu);
    }
  }
  id v9 = objc_alloc_init(TRLegacyAnisetteDataRequest);
  [(TRLegacyAnisetteDataRequest *)v9 setDsid:v6];
  session = self->_session;
  v12[0] = MEMORY[0x263EF8330];
  v12[1] = 3221225472;
  v12[2] = __67__TRAnisetteDataProvider_legacyAnisetteDataForDSID_withCompletion___block_invoke;
  v12[3] = &unk_264220F78;
  id v13 = v7;
  id v11 = v7;
  [(TRSession *)session sendRequest:v9 withResponseHandler:v12];
}

void __67__TRAnisetteDataProvider_legacyAnisetteDataForDSID_withCompletion___block_invoke(uint64_t a1, void *a2, void *a3)
{
  uint64_t v16 = *MEMORY[0x263EF8340];
  id v5 = a2;
  id v6 = a3;
  if (_TRLogEnabled == 1)
  {
    id v7 = TRLogHandle();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      int v10 = 136315650;
      id v11 = "-[TRAnisetteDataProvider legacyAnisetteDataForDSID:withCompletion:]_block_invoke";
      __int16 v12 = 2112;
      id v13 = v6;
      __int16 v14 = 2112;
      id v15 = v5;
      _os_log_impl(&dword_2149BE000, v7, OS_LOG_TYPE_DEFAULT, "%s: response %@, error %@", (uint8_t *)&v10, 0x20u);
    }
  }
  uint64_t v8 = *(void *)(a1 + 32);
  id v9 = [v6 anisetteData];
  (*(void (**)(uint64_t, void *, id))(v8 + 16))(v8, v9, v5);
}

- (TRSession)session
{
  return self->_session;
}

- (void)setSession:(id)a3
{
}

- (void).cxx_destruct
{
}

@end