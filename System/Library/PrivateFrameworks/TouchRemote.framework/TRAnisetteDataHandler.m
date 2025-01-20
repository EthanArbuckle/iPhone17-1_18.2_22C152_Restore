@interface TRAnisetteDataHandler
- (void)registerForAnisetteDataRequestsFromSession:(id)a3;
@end

@implementation TRAnisetteDataHandler

- (void)registerForAnisetteDataRequestsFromSession:(id)a3
{
  id v3 = a3;
  [v3 setRequestHandler:&__block_literal_global_3 forRequestClass:objc_opt_class()];
  [v3 setRequestHandler:&__block_literal_global_7 forRequestClass:objc_opt_class()];
  [v3 setRequestHandler:&__block_literal_global_13 forRequestClass:objc_opt_class()];
  [v3 setRequestHandler:&__block_literal_global_19 forRequestClass:objc_opt_class()];
  [v3 setRequestHandler:&__block_literal_global_26 forRequestClass:objc_opt_class()];
}

void __68__TRAnisetteDataHandler_registerForAnisetteDataRequestsFromSession___block_invoke(uint64_t a1, void *a2, void *a3)
{
  uint64_t v13 = *MEMORY[0x263EF8340];
  id v4 = a2;
  id v5 = a3;
  if (_TRLogEnabled == 1)
  {
    v6 = TRLogHandle();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      id v12 = v4;
      _os_log_impl(&dword_2149BE000, v6, OS_LOG_TYPE_DEFAULT, "Received provision request: %@", buf, 0xCu);
    }
  }
  id v7 = objc_alloc_init(MEMORY[0x263F29108]);
  v9[0] = MEMORY[0x263EF8330];
  v9[1] = 3221225472;
  v9[2] = __68__TRAnisetteDataHandler_registerForAnisetteDataRequestsFromSession___block_invoke_1;
  v9[3] = &unk_264220B28;
  id v10 = v5;
  id v8 = v5;
  [v7 provisionWithCompletion:v9];
}

void __68__TRAnisetteDataHandler_registerForAnisetteDataRequestsFromSession___block_invoke_1(uint64_t a1, uint64_t a2, void *a3)
{
  id v5 = a3;
  if (v5)
  {
    v6 = TRLogHandle();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR)) {
      __68__TRAnisetteDataHandler_registerForAnisetteDataRequestsFromSession___block_invoke_1_cold_1();
    }

    (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
  }
  else
  {
    id v7 = objc_alloc_init(TRProvisionAnisetteDataResponse);
    [(TRProvisionAnisetteDataResponse *)v7 setDidSucceed:a2];
    (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
  }
}

void __68__TRAnisetteDataHandler_registerForAnisetteDataRequestsFromSession___block_invoke_5(uint64_t a1, void *a2, void *a3)
{
  uint64_t v16 = *MEMORY[0x263EF8340];
  id v4 = a2;
  id v5 = a3;
  if (_TRLogEnabled == 1)
  {
    v6 = TRLogHandle();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      id v15 = v4;
      _os_log_impl(&dword_2149BE000, v6, OS_LOG_TYPE_DEFAULT, "Received sync request: %@", buf, 0xCu);
    }
  }
  id v7 = (objc_class *)MEMORY[0x263F29108];
  id v8 = v4;
  id v9 = objc_alloc_init(v7);
  id v10 = [v8 simData];
  v12[0] = MEMORY[0x263EF8330];
  v12[1] = 3221225472;
  v12[2] = __68__TRAnisetteDataHandler_registerForAnisetteDataRequestsFromSession___block_invoke_8;
  v12[3] = &unk_264220B28;
  id v13 = v5;
  id v11 = v5;
  [v9 syncWithSIMData:v10 completion:v12];
}

void __68__TRAnisetteDataHandler_registerForAnisetteDataRequestsFromSession___block_invoke_8(uint64_t a1, uint64_t a2, void *a3)
{
  id v5 = a3;
  if (v5)
  {
    v6 = TRLogHandle();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR)) {
      __68__TRAnisetteDataHandler_registerForAnisetteDataRequestsFromSession___block_invoke_8_cold_1();
    }

    (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
  }
  else
  {
    id v7 = objc_alloc_init(TRSyncAnisetteDataResponse);
    [(TRSyncAnisetteDataResponse *)v7 setDidSucceed:a2];
    (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
  }
}

void __68__TRAnisetteDataHandler_registerForAnisetteDataRequestsFromSession___block_invoke_11(uint64_t a1, void *a2, void *a3)
{
  uint64_t v13 = *MEMORY[0x263EF8340];
  id v4 = a2;
  id v5 = a3;
  if (_TRLogEnabled == 1)
  {
    v6 = TRLogHandle();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      id v12 = v4;
      _os_log_impl(&dword_2149BE000, v6, OS_LOG_TYPE_DEFAULT, "Received erase request: %@", buf, 0xCu);
    }
  }
  id v7 = objc_alloc_init(MEMORY[0x263F29108]);
  v9[0] = MEMORY[0x263EF8330];
  v9[1] = 3221225472;
  v9[2] = __68__TRAnisetteDataHandler_registerForAnisetteDataRequestsFromSession___block_invoke_14;
  v9[3] = &unk_264220B28;
  id v10 = v5;
  id v8 = v5;
  [v7 eraseWithCompletion:v9];
}

void __68__TRAnisetteDataHandler_registerForAnisetteDataRequestsFromSession___block_invoke_14(uint64_t a1, uint64_t a2, void *a3)
{
  id v5 = a3;
  if (v5)
  {
    v6 = TRLogHandle();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR)) {
      __68__TRAnisetteDataHandler_registerForAnisetteDataRequestsFromSession___block_invoke_14_cold_1();
    }

    (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
  }
  else
  {
    id v7 = objc_alloc_init(TREraseAnisetteDataResponse);
    [(TREraseAnisetteDataResponse *)v7 setDidSucceed:a2];
    (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
  }
}

void __68__TRAnisetteDataHandler_registerForAnisetteDataRequestsFromSession___block_invoke_17(uint64_t a1, void *a2, void *a3)
{
  uint64_t v13 = *MEMORY[0x263EF8340];
  id v4 = a2;
  id v5 = a3;
  if (_TRLogEnabled == 1)
  {
    v6 = TRLogHandle();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      id v12 = v4;
      _os_log_impl(&dword_2149BE000, v6, OS_LOG_TYPE_DEFAULT, "Received fetch request: %@", buf, 0xCu);
    }
  }
  id v7 = objc_alloc_init(MEMORY[0x263F29108]);
  v9[0] = MEMORY[0x263EF8330];
  v9[1] = 3221225472;
  v9[2] = __68__TRAnisetteDataHandler_registerForAnisetteDataRequestsFromSession___block_invoke_20;
  v9[3] = &unk_264221348;
  id v10 = v5;
  id v8 = v5;
  [v7 anisetteDataWithCompletion:v9];
}

void __68__TRAnisetteDataHandler_registerForAnisetteDataRequestsFromSession___block_invoke_20(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  if (v6)
  {
    id v7 = TRLogHandle();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR)) {
      __68__TRAnisetteDataHandler_registerForAnisetteDataRequestsFromSession___block_invoke_20_cold_1();
    }

    (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
  }
  else
  {
    id v8 = objc_alloc_init(TRFetchAnisetteDataResponse);
    [(TRFetchAnisetteDataResponse *)v8 setAnisetteData:v5];
    (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
  }
}

void __68__TRAnisetteDataHandler_registerForAnisetteDataRequestsFromSession___block_invoke_24(uint64_t a1, void *a2, void *a3)
{
  uint64_t v16 = *MEMORY[0x263EF8340];
  id v4 = a2;
  id v5 = a3;
  if (_TRLogEnabled == 1)
  {
    id v6 = TRLogHandle();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      id v15 = v4;
      _os_log_impl(&dword_2149BE000, v6, OS_LOG_TYPE_DEFAULT, "Received legacy request: %@", buf, 0xCu);
    }
  }
  id v7 = (objc_class *)MEMORY[0x263F29108];
  id v8 = v4;
  id v9 = objc_alloc_init(v7);
  id v10 = [v8 dsid];
  v12[0] = MEMORY[0x263EF8330];
  v12[1] = 3221225472;
  v12[2] = __68__TRAnisetteDataHandler_registerForAnisetteDataRequestsFromSession___block_invoke_27;
  v12[3] = &unk_264221348;
  id v13 = v5;
  id v11 = v5;
  [v9 legacyAnisetteDataForDSID:v10 withCompletion:v12];
}

void __68__TRAnisetteDataHandler_registerForAnisetteDataRequestsFromSession___block_invoke_27(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  if (v6)
  {
    id v7 = TRLogHandle();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR)) {
      __68__TRAnisetteDataHandler_registerForAnisetteDataRequestsFromSession___block_invoke_27_cold_1();
    }

    (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
  }
  else
  {
    id v8 = objc_alloc_init(TRLegacyAnisetteDataResponse);
    [(TRLegacyAnisetteDataResponse *)v8 setAnisetteData:v5];
    (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
  }
}

void __68__TRAnisetteDataHandler_registerForAnisetteDataRequestsFromSession___block_invoke_1_cold_1()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_2149BE000, v0, v1, "TRProvisionAnisetteDataRequest error: %@", v2, v3, v4, v5, v6);
}

void __68__TRAnisetteDataHandler_registerForAnisetteDataRequestsFromSession___block_invoke_8_cold_1()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_2149BE000, v0, v1, "TRSyncAnisetteDataRequest error: %@", v2, v3, v4, v5, v6);
}

void __68__TRAnisetteDataHandler_registerForAnisetteDataRequestsFromSession___block_invoke_14_cold_1()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_2149BE000, v0, v1, "TREraseAnisetteDataResponse error: %@", v2, v3, v4, v5, v6);
}

void __68__TRAnisetteDataHandler_registerForAnisetteDataRequestsFromSession___block_invoke_20_cold_1()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_2149BE000, v0, v1, "TRFetchAnisetteDataResponse error: %@", v2, v3, v4, v5, v6);
}

void __68__TRAnisetteDataHandler_registerForAnisetteDataRequestsFromSession___block_invoke_27_cold_1()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_2149BE000, v0, v1, "TRLegacyAnisetteDataResponse error: %@", v2, v3, v4, v5, v6);
}

@end