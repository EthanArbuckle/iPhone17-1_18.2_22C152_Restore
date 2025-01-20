@interface TPSAppStoreRegionValidation
- (BOOL)hasStoreFrontRegionPrefix:(id)a3 fromRegions:(id)a4;
- (id)getCurrentState;
- (void)getCurrentStateWithCompletion:(id)a3;
- (void)validateWithCompletion:(id)a3;
@end

@implementation TPSAppStoreRegionValidation

- (BOOL)hasStoreFrontRegionPrefix:(id)a3 fromRegions:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  uint64_t v13 = 0;
  v14 = &v13;
  uint64_t v15 = 0x2020000000;
  char v16 = 0;
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __69__TPSAppStoreRegionValidation_hasStoreFrontRegionPrefix_fromRegions___block_invoke;
  v10[3] = &unk_1E6E6BED0;
  v12 = &v13;
  id v7 = v5;
  id v11 = v7;
  [v6 enumerateObjectsUsingBlock:v10];
  char v8 = *((unsigned char *)v14 + 24);

  _Block_object_dispose(&v13, 8);
  return v8;
}

uint64_t __69__TPSAppStoreRegionValidation_hasStoreFrontRegionPrefix_fromRegions___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3, unsigned char *a4)
{
  uint64_t result = [*(id *)(a1 + 32) hasPrefix:a2];
  *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = result;
  *a4 = *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24);
  return result;
}

- (void)validateWithCompletion:(id)a3
{
  uint64_t v36 = *MEMORY[0x1E4F143B8];
  v4 = (void (**)(id, uint64_t, void))a3;
  id v5 = [(TPSRegionsValidation *)self targetRegions];
  if ([v5 count])
  {

LABEL_4:
    char v8 = [(TPSAppStoreRegionValidation *)self getCurrentState];
    v9 = [(TPSRegionsValidation *)self targetRegions];
    uint64_t v10 = [v9 count];

    if (v10)
    {
      id v11 = [(TPSRegionsValidation *)self targetRegions];
      BOOL v12 = [(TPSAppStoreRegionValidation *)self hasStoreFrontRegionPrefix:v8 fromRegions:v11];
    }
    else
    {
      BOOL v12 = 1;
    }
    uint64_t v13 = [(TPSRegionsValidation *)self excludeRegions];
    uint64_t v14 = [v13 count];

    if (v14)
    {
      uint64_t v15 = [(TPSRegionsValidation *)self excludeRegions];
      BOOL v16 = [(TPSAppStoreRegionValidation *)self hasStoreFrontRegionPrefix:v8 fromRegions:v15];

      int v17 = !v16;
    }
    else
    {
      int v17 = 1;
    }
    uint64_t v18 = v12 & v17;
    v19 = [MEMORY[0x1E4FAF480] targeting];
    if (os_log_type_enabled(v19, OS_LOG_TYPE_DEBUG))
    {
      v20 = objc_opt_class();
      id v21 = v20;
      v22 = [(TPSRegionsValidation *)self targetRegions];
      v23 = [v22 componentsJoinedByString:@","];
      v24 = [(TPSRegionsValidation *)self excludeRegions];
      v25 = [v24 componentsJoinedByString:@","];
      int v26 = 138413314;
      v27 = v20;
      __int16 v28 = 2112;
      v29 = v8;
      __int16 v30 = 2112;
      v31 = v23;
      __int16 v32 = 2112;
      v33 = v25;
      __int16 v34 = 1024;
      int v35 = v18;
      _os_log_debug_impl(&dword_1E4492000, v19, OS_LOG_TYPE_DEBUG, "%@ - checking appstore region: %@, target regions: %@, exclude regions: %@. Valid: %d", (uint8_t *)&v26, 0x30u);
    }
    goto LABEL_13;
  }
  id v6 = [(TPSRegionsValidation *)self excludeRegions];
  uint64_t v7 = [v6 count];

  if (v7) {
    goto LABEL_4;
  }
  char v8 = [MEMORY[0x1E4FAF480] targeting];
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG)) {
    -[TPSAppStoreRegionValidation validateWithCompletion:]((uint64_t)self, v8);
  }
  uint64_t v18 = 1;
LABEL_13:

  v4[2](v4, v18, 0);
}

- (id)getCurrentState
{
  v2 = objc_msgSend(MEMORY[0x1E4F179C8], "ams_sharedAccountStore");
  v3 = objc_msgSend(v2, "ams_activeiTunesAccount");

  v4 = objc_msgSend(v3, "ams_storefront");

  return v4;
}

- (void)getCurrentStateWithCompletion:(id)a3
{
  v4 = (void (**)(id, id, void))a3;
  id v5 = [(TPSAppStoreRegionValidation *)self getCurrentState];
  id v6 = v5;
  if (v5)
  {
    id v7 = v5;
  }
  else
  {
    id v7 = [MEMORY[0x1E4F1CA98] null];
  }
  id v8 = v7;

  v4[2](v4, v8, 0);
}

- (void)validateWithCompletion:(uint64_t)a1 .cold.1(uint64_t a1, NSObject *a2)
{
  uint64_t v6 = *MEMORY[0x1E4F143B8];
  int v4 = 138412290;
  id v5 = (id)objc_opt_class();
  id v3 = v5;
  _os_log_debug_impl(&dword_1E4492000, a2, OS_LOG_TYPE_DEBUG, "%@ - neither target nor exclude appstore region(s) is specified.", (uint8_t *)&v4, 0xCu);
}

@end