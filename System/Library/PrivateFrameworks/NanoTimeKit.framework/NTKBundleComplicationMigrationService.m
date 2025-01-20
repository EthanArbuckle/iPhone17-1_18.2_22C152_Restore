@interface NTKBundleComplicationMigrationService
- (NTKBundleComplicationMigrationService)init;
- (id)_loadAndFetchClassesForBundleIdentifier:(id)a3;
- (void)_enumerateBundles:(id)a3;
- (void)_performMigrationWithDataSource:(id)a3 complication:(id)a4 family:(int64_t)a5 device:(id)a6 completion:(id)a7;
- (void)_processFallbackRequest:(id)a3 completion:(id)a4;
- (void)_processSingleRequest:(id)a3 completion:(id)a4;
- (void)generateComplicationTypeLookupForDevice:(id)a3 completion:(id)a4;
- (void)processRequest:(id)a3 completion:(id)a4;
@end

@implementation NTKBundleComplicationMigrationService

- (NTKBundleComplicationMigrationService)init
{
  v6.receiver = self;
  v6.super_class = (Class)NTKBundleComplicationMigrationService;
  v2 = [(NTKBundleComplicationMigrationService *)&v6 init];
  if (v2)
  {
    uint64_t v3 = objc_opt_new();
    cache = v2->_cache;
    v2->_cache = (NTKBundleComplicationIdentifierCache *)v3;

    NTKBundleComplicationMigrationServiceEnsureLookupDirectory();
  }
  return v2;
}

- (void)processRequest:(id)a3 completion:(id)a4
{
  id v8 = a3;
  objc_super v6 = (void (**)(id, void, void *))a4;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    [(NTKBundleComplicationMigrationService *)self _processSingleRequest:v8 completion:v6];
  }
  else
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      [(NTKBundleComplicationMigrationService *)self _processFallbackRequest:v8 completion:v6];
    }
    else
    {
      v7 = [MEMORY[0x1E4F28C58] errorWithDomain:@"com.apple.nanotimekit.NTKBundleComplicationMigrationService" code:3 userInfo:0];
      v6[2](v6, 0, v7);
    }
  }
}

- (void)_processFallbackRequest:(id)a3 completion:(id)a4
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  id v8 = _NTKLoggingObjectForDomain(56, (uint64_t)"NTKLoggingDomainBundleComplicationMigration");
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    id v17 = v6;
    _os_log_impl(&dword_1BC5A9000, v8, OS_LOG_TYPE_DEFAULT, "NTKBundleComplicationMigrationService: Begin processing fallback request %@", buf, 0xCu);
  }

  cache = self->_cache;
  v10 = [v6 complication];
  v13[0] = MEMORY[0x1E4F143A8];
  v13[1] = 3221225472;
  v13[2] = __76__NTKBundleComplicationMigrationService__processFallbackRequest_completion___block_invoke;
  v13[3] = &unk_1E62C4198;
  v13[4] = self;
  id v14 = v6;
  id v15 = v7;
  id v11 = v7;
  id v12 = v6;
  [(NTKBundleComplicationIdentifierCache *)cache fetchIdentifiersForComplication:v10 completion:v13];
}

void __76__NTKBundleComplicationMigrationService__processFallbackRequest_completion___block_invoke(uint64_t a1, void *a2, void *a3)
{
  uint64_t v44 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  id v27 = a3;
  v30 = objc_msgSend(*(id *)(a1 + 32), "_loadAndFetchClassesForBundleIdentifier:");
  long long v38 = 0u;
  long long v39 = 0u;
  long long v40 = 0u;
  long long v41 = 0u;
  obuint64_t j = [*(id *)(a1 + 40) families];
  uint64_t v31 = [obj countByEnumeratingWithState:&v38 objects:v43 count:16];
  if (v31)
  {
    v32 = 0;
    uint64_t v29 = *(void *)v39;
    do
    {
      for (uint64_t i = 0; i != v31; ++i)
      {
        if (*(void *)v39 != v29) {
          objc_enumerationMutation(obj);
        }
        uint64_t v7 = [*(id *)(*((void *)&v38 + 1) + 8 * i) integerValue];
        long long v34 = 0u;
        long long v35 = 0u;
        long long v36 = 0u;
        long long v37 = 0u;
        id v8 = v30;
        uint64_t v9 = [v8 countByEnumeratingWithState:&v34 objects:v42 count:16];
        if (v9)
        {
          uint64_t v10 = v9;
          uint64_t v33 = i;
          uint64_t v11 = *(void *)v35;
          while (2)
          {
            for (uint64_t j = 0; j != v10; ++j)
            {
              if (*(void *)v35 != v11) {
                objc_enumerationMutation(v8);
              }
              v13 = *(void **)(*((void *)&v34 + 1) + 8 * j);
              id v14 = [v13 bundleIdentifier];
              int v15 = [v14 isEqualToString:v5];

              if (v15)
              {
                v16 = [*(id *)(a1 + 40) device];
                int v17 = [v13 acceptsComplicationFamily:v7 forDevice:v16];

                if (v17)
                {
                  id v18 = objc_alloc((Class)v13);
                  v19 = [*(id *)(a1 + 40) complication];
                  v20 = [*(id *)(a1 + 40) device];
                  v21 = objc_opt_new();
                  uint64_t v22 = [v18 initWithComplication:v19 family:v7 forDevice:v20 context:v21];

                  v32 = (void *)v22;
                  goto LABEL_17;
                }
              }
            }
            uint64_t v10 = [v8 countByEnumeratingWithState:&v34 objects:v42 count:16];
            if (v10) {
              continue;
            }
            break;
          }
LABEL_17:
          uint64_t i = v33;
        }
      }
      uint64_t v31 = [obj countByEnumeratingWithState:&v38 objects:v43 count:16];
    }
    while (v31);
  }
  else
  {
    v32 = 0;
  }

  v23 = *(void **)(a1 + 32);
  v24 = [*(id *)(a1 + 40) complication];
  uint64_t v25 = [v32 family];
  v26 = [*(id *)(a1 + 40) device];
  [v23 _performMigrationWithDataSource:v32 complication:v24 family:v25 device:v26 completion:*(void *)(a1 + 48)];
}

- (void)_processSingleRequest:(id)a3 completion:(id)a4
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  id v8 = _NTKLoggingObjectForDomain(56, (uint64_t)"NTKLoggingDomainBundleComplicationMigration");
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    id v17 = v6;
    _os_log_impl(&dword_1BC5A9000, v8, OS_LOG_TYPE_DEFAULT, "NTKBundleComplicationMigrationService: Processing single request %@", buf, 0xCu);
  }

  cache = self->_cache;
  uint64_t v10 = [v6 complication];
  v13[0] = MEMORY[0x1E4F143A8];
  v13[1] = 3221225472;
  v13[2] = __74__NTKBundleComplicationMigrationService__processSingleRequest_completion___block_invoke;
  v13[3] = &unk_1E62C4198;
  v13[4] = self;
  id v14 = v6;
  id v15 = v7;
  id v11 = v7;
  id v12 = v6;
  [(NTKBundleComplicationIdentifierCache *)cache fetchIdentifiersForComplication:v10 completion:v13];
}

void __74__NTKBundleComplicationMigrationService__processSingleRequest_completion___block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  uint64_t v27 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  [*(id *)(a1 + 32) _loadAndFetchClassesForBundleIdentifier:a3];
  long long v22 = 0u;
  long long v23 = 0u;
  long long v24 = 0u;
  long long v25 = 0u;
  id v6 = (id)objc_claimAutoreleasedReturnValue();
  id v7 = (void *)[v6 countByEnumeratingWithState:&v22 objects:v26 count:16];
  if (v7)
  {
    uint64_t v8 = *(void *)v23;
    while (2)
    {
      for (uint64_t i = 0; i != v7; uint64_t i = (char *)i + 1)
      {
        if (*(void *)v23 != v8) {
          objc_enumerationMutation(v6);
        }
        uint64_t v10 = *(void **)(*((void *)&v22 + 1) + 8 * i);
        id v11 = objc_msgSend(v10, "bundleIdentifier", (void)v22);
        int v12 = [v11 isEqualToString:v5];

        if (v12)
        {
          id v13 = objc_alloc((Class)v10);
          id v14 = [*(id *)(a1 + 40) complication];
          uint64_t v15 = [*(id *)(a1 + 40) family];
          v16 = [*(id *)(a1 + 40) device];
          id v17 = objc_opt_new();
          id v7 = (void *)[v13 initWithComplication:v14 family:v15 forDevice:v16 context:v17];

          goto LABEL_11;
        }
      }
      id v7 = (void *)[v6 countByEnumeratingWithState:&v22 objects:v26 count:16];
      if (v7) {
        continue;
      }
      break;
    }
  }
LABEL_11:

  uint64_t v18 = *(void **)(a1 + 32);
  v19 = [*(id *)(a1 + 40) complication];
  uint64_t v20 = [*(id *)(a1 + 40) family];
  v21 = [*(id *)(a1 + 40) device];
  [v18 _performMigrationWithDataSource:v7 complication:v19 family:v20 device:v21 completion:*(void *)(a1 + 48)];
}

- (void)_performMigrationWithDataSource:(id)a3 complication:(id)a4 family:(int64_t)a5 device:(id)a6 completion:(id)a7
{
  uint64_t v55 = *MEMORY[0x1E4F143B8];
  id v11 = a3;
  id v12 = a4;
  id v13 = a6;
  id v14 = (void (**)(id, void, uint64_t))a7;
  if (([v13 supportsWidgetMigration] & 1) == 0) {
    goto LABEL_7;
  }
  if (!v11)
  {
    uint64_t v16 = [MEMORY[0x1E4F28C58] errorWithDomain:@"com.apple.nanotimekit.NTKBundleComplicationMigrationService" code:0 userInfo:0];
LABEL_10:
    id v17 = (void *)v16;
    v14[2](v14, 0, v16);

    goto LABEL_11;
  }
  uint64_t v15 = objc_opt_class();
  if (([v15 isSubclassOfClass:objc_opt_class()] & 1) == 0)
  {
    uint64_t v16 = [MEMORY[0x1E4F28C58] errorWithDomain:@"com.apple.nanotimekit.NTKBundleComplicationMigrationService" code:1 userInfo:0];
    goto LABEL_10;
  }
  if (([(id)objc_opt_class() hasMigratedToWidgetForFamily:a5 device:v13] & 1) == 0)
  {
LABEL_7:
    v14[2](v14, 0, 0);
    goto LABEL_11;
  }
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    [v12 complicationDescriptor];
  }
  else {
  uint64_t v18 = [MEMORY[0x1E4F196C8] legacyComplicationDescriptor];
  }
  v45[0] = 0;
  v45[1] = v45;
  v45[2] = 0x2020000000;
  char v46 = 0;
  aBlock[0] = MEMORY[0x1E4F143A8];
  aBlock[1] = 3221225472;
  aBlock[2] = __111__NTKBundleComplicationMigrationService__performMigrationWithDataSource_complication_family_device_completion___block_invoke;
  aBlock[3] = &unk_1E62C41C0;
  uint64_t v44 = v45;
  v43 = v14;
  v19 = _Block_copy(aBlock);
  uint64_t v20 = _NTKLoggingObjectForDomain(56, (uint64_t)"NTKLoggingDomainBundleComplicationMigration");
  if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
  {
    CLKComplicationFamilyDescription();
    id v21 = (id)objc_claimAutoreleasedReturnValue();
    long long v22 = [(id)objc_opt_class() bundleIdentifier];
    *(_DWORD *)buf = 138413058;
    id v48 = v12;
    __int16 v49 = 2112;
    id v50 = v21;
    __int16 v51 = 2048;
    int64_t v52 = a5;
    __int16 v53 = 2112;
    v54 = v22;
    _os_log_impl(&dword_1BC5A9000, v20, OS_LOG_TYPE_DEFAULT, "Fetching migration for request <complication=%@, family=%@ (%li)> from %@", buf, 0x2Au);
  }
  long long v23 = [(id)objc_opt_class() appIdentifier];
  v36[0] = MEMORY[0x1E4F143A8];
  v36[1] = 3221225472;
  v36[2] = __111__NTKBundleComplicationMigrationService__performMigrationWithDataSource_complication_family_device_completion___block_invoke_11;
  v36[3] = &unk_1E62C4210;
  id v30 = v23;
  id v37 = v30;
  id v24 = v19;
  id v40 = v24;
  id v25 = v11;
  id v38 = v25;
  id v26 = v12;
  id v39 = v26;
  int64_t v41 = a5;
  [v25 fetchWidgetMigrationForDescriptor:v18 family:a5 completion:v36];
  uint64_t v27 = (void *)v18;
  dispatch_time_t v28 = dispatch_time(0, 10000000000);
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __111__NTKBundleComplicationMigrationService__performMigrationWithDataSource_complication_family_device_completion___block_invoke_16;
  block[3] = &unk_1E62C4238;
  id v34 = v24;
  id v32 = v25;
  id v33 = v26;
  int64_t v35 = a5;
  id v29 = v24;
  dispatch_after(v28, MEMORY[0x1E4F14428], block);

  _Block_object_dispose(v45, 8);
LABEL_11:
}

BOOL __111__NTKBundleComplicationMigrationService__performMigrationWithDataSource_complication_family_device_completion___block_invoke(uint64_t a1)
{
  uint64_t v1 = *(void *)(*(void *)(a1 + 40) + 8);
  int v2 = *(unsigned __int8 *)(v1 + 24);
  if (!*(unsigned char *)(v1 + 24))
  {
    *(unsigned char *)(v1 + 24) = 1;
    (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
  }
  return v2 == 0;
}

void __111__NTKBundleComplicationMigrationService__performMigrationWithDataSource_complication_family_device_completion___block_invoke_11(uint64_t a1, void *a2)
{
  id v3 = a2;
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __111__NTKBundleComplicationMigrationService__performMigrationWithDataSource_complication_family_device_completion___block_invoke_2;
  v7[3] = &unk_1E62C41E8;
  id v8 = v3;
  id v9 = *(id *)(a1 + 32);
  id v12 = *(id *)(a1 + 56);
  id v10 = *(id *)(a1 + 40);
  id v4 = *(id *)(a1 + 48);
  uint64_t v5 = *(void *)(a1 + 64);
  id v11 = v4;
  uint64_t v13 = v5;
  id v6 = v3;
  dispatch_async(MEMORY[0x1E4F14428], v7);
}

void __111__NTKBundleComplicationMigrationService__performMigrationWithDataSource_complication_family_device_completion___block_invoke_2(uint64_t a1)
{
  uint64_t v43 = *MEMORY[0x1E4F143B8];
  int v2 = *(void **)(a1 + 32);
  if (v2
    && ([v2 intentReference],
        id v3 = objc_claimAutoreleasedReturnValue(),
        v3,
        int v2 = *(void **)(a1 + 32),
        v3))
  {
    id v4 = [v2 intentReference];
    uint64_t v5 = [v4 intent];

    [v5 _setLaunchId:*(void *)(a1 + 40)];
    if (([v5 isMemberOfClass:objc_opt_class()] & 1) == 0)
    {
      uint64_t v6 = INIntentWithTypedIntent();

      uint64_t v5 = (void *)v6;
    }
    id v7 = objc_alloc(MEMORY[0x1E4F19AF8]);
    id v8 = [*(id *)(a1 + 32) extensionBundleIdentifier];
    id v9 = [*(id *)(a1 + 32) containerBundleIdentifier];
    id v10 = [*(id *)(a1 + 32) kind];
    id v11 = (id)[v7 initWithExtensionBundleIdentifier:v8 containerBundleIdentifier:v9 kind:v10 intent:v5];

    if (!v11) {
      goto LABEL_11;
    }
  }
  else
  {
    id v11 = v2;
    if (!v11) {
      goto LABEL_11;
    }
  }
  uint64_t v12 = [v11 extensionBundleIdentifier];
  if (v12)
  {
    uint64_t v13 = (void *)v12;
    uint64_t v14 = [v11 containerBundleIdentifier];
    if (v14)
    {
      uint64_t v15 = (void *)v14;
      uint64_t v16 = [v11 kind];

      if (v16)
      {
LABEL_11:
        int v17 = (*(uint64_t (**)(void))(*(void *)(a1 + 64) + 16))();
        uint64_t v18 = _NTKLoggingObjectForDomain(56, (uint64_t)"NTKLoggingDomainBundleComplicationMigration");
        if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
        {
          uint64_t v19 = *(void *)(a1 + 32);
          uint64_t v20 = [(id)objc_opt_class() bundleIdentifier];
          uint64_t v21 = *(void *)(a1 + 56);
          long long v22 = CLKComplicationFamilyDescription();
          uint64_t v23 = *(void *)(a1 + 72);
          int v31 = 138413570;
          uint64_t v32 = v19;
          __int16 v33 = 2112;
          id v34 = v20;
          __int16 v35 = 2112;
          uint64_t v36 = v21;
          __int16 v37 = 2112;
          id v38 = v22;
          __int16 v39 = 2048;
          uint64_t v40 = v23;
          __int16 v41 = 1024;
          int v42 = v17;
          _os_log_impl(&dword_1BC5A9000, v18, OS_LOG_TYPE_DEFAULT, "Received migration result %@ in \"%@\" for request <complication=%@, family=%@ (%li)> (success=%d)", (uint8_t *)&v31, 0x3Au);
        }
        goto LABEL_17;
      }
    }
    else
    {
    }
  }
  uint64_t v18 = [MEMORY[0x1E4F28C58] errorWithDomain:@"com.apple.nanotimekit.NTKBundleComplicationMigrationService" code:4 userInfo:0];
  int v24 = (*(uint64_t (**)(void))(*(void *)(a1 + 64) + 16))();
  id v25 = _NTKLoggingObjectForDomain(56, (uint64_t)"NTKLoggingDomainBundleComplicationMigration");
  if (os_log_type_enabled(v25, OS_LOG_TYPE_FAULT))
  {
    uint64_t v26 = *(void *)(a1 + 32);
    uint64_t v27 = [(id)objc_opt_class() bundleIdentifier];
    uint64_t v28 = *(void *)(a1 + 56);
    id v29 = CLKComplicationFamilyDescription();
    uint64_t v30 = *(void *)(a1 + 72);
    int v31 = 138413570;
    uint64_t v32 = v26;
    __int16 v33 = 2112;
    id v34 = v27;
    __int16 v35 = 2112;
    uint64_t v36 = v28;
    __int16 v37 = 2112;
    id v38 = v29;
    __int16 v39 = 2048;
    uint64_t v40 = v30;
    __int16 v41 = 1024;
    int v42 = v24;
    _os_log_fault_impl(&dword_1BC5A9000, v25, OS_LOG_TYPE_FAULT, "Received invalid migration result %@ in \"%@\" for request <complication=%@, family=%@ (%li)> (first=%d)", (uint8_t *)&v31, 0x3Au);
  }
LABEL_17:
}

void __111__NTKBundleComplicationMigrationService__performMigrationWithDataSource_complication_family_device_completion___block_invoke_16(uint64_t a1)
{
  int v2 = [MEMORY[0x1E4F28C58] errorWithDomain:@"com.apple.nanotimekit.NTKBundleComplicationMigrationService" code:2 userInfo:0];
  if ((*(unsigned int (**)(void))(*(void *)(a1 + 48) + 16))())
  {
    id v3 = _NTKLoggingObjectForDomain(56, (uint64_t)"NTKLoggingDomainBundleComplicationMigration");
    if (os_log_type_enabled(v3, OS_LOG_TYPE_FAULT)) {
      __111__NTKBundleComplicationMigrationService__performMigrationWithDataSource_complication_family_device_completion___block_invoke_16_cold_1(a1, v3);
    }
  }
}

- (void)generateComplicationTypeLookupForDevice:(id)a3 completion:(id)a4
{
  id v6 = a4;
  id v7 = [MEMORY[0x1E4F19A30] deviceForDescriptor:a3];
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __92__NTKBundleComplicationMigrationService_generateComplicationTypeLookupForDevice_completion___block_invoke;
  v10[3] = &unk_1E62C4260;
  id v11 = v7;
  id v12 = v6;
  id v8 = v7;
  id v9 = v6;
  +[NTKBundleComplicationMigrationTypeLookupGenerator generateLookupUsingService:self device:v8 completion:v10];
}

void __92__NTKBundleComplicationMigrationService_generateComplicationTypeLookupForDevice_completion___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = objc_opt_new();
  uint64_t v5 = NTKBundleComplicationMigrationCurrentVersion();
  [v4 setBuildVersion:v5];

  [v4 setDictionary:v3];
  id v16 = 0;
  id v6 = [MEMORY[0x1E4F28DB0] archivedDataWithRootObject:v4 requiringSecureCoding:1 error:&v16];
  id v7 = v16;
  if (v6)
  {
    id v8 = NTKBundleComplicationMigrationServiceLookupPathForDevice(*(void **)(a1 + 32));
    id v15 = v7;
    char v9 = [v6 writeToFile:v8 options:1 error:&v15];
    id v10 = v15;

    if (v9)
    {
      id v11 = *(void **)(a1 + 32);
      id v12 = NTKBundleComplicationMigrationCurrentVersion();
      LOBYTE(v11) = NTKBundleComplicationMigrationServiceSetLookupVersion(v11, v12);

      if ((v11 & 1) == 0)
      {
        uint64_t v13 = _NTKLoggingObjectForDomain(56, (uint64_t)"NTKLoggingDomainBundleComplicationMigration");
        if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR)) {
          NTKBundleComplicationMigrationServiceSetLookupVersion_cold_1((uint64_t)v8, v13);
        }
      }
      uint64_t v14 = *(void (**)(void))(*(void *)(a1 + 40) + 16);
    }
    else
    {
      uint64_t v14 = *(void (**)(void))(*(void *)(a1 + 40) + 16);
    }
    v14();
  }
  else
  {
    (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
    id v10 = v7;
  }
}

- (void)_enumerateBundles:(id)a3
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  if (_enumerateBundles__onceToken != -1) {
    dispatch_once(&_enumerateBundles__onceToken, &__block_literal_global_65);
  }
  NTKBundleComplicationDirectoryURLs();
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  obuint64_t j = (id)objc_claimAutoreleasedReturnValue();
  uint64_t v4 = [obj countByEnumeratingWithState:&v13 objects:v17 count:16];
  if (v4)
  {
    uint64_t v5 = v4;
    uint64_t v6 = *(void *)v14;
    do
    {
      for (uint64_t i = 0; i != v5; ++i)
      {
        if (*(void *)v14 != v6) {
          objc_enumerationMutation(obj);
        }
        uint64_t v8 = *(void *)(*((void *)&v13 + 1) + 8 * i);
        char v9 = (void *)_enumerateBundles___complicationBundleLoader;
        v11[0] = MEMORY[0x1E4F143A8];
        v11[1] = 3221225472;
        v11[2] = __59__NTKBundleComplicationMigrationService__enumerateBundles___block_invoke_2;
        v11[3] = &unk_1E62C4288;
        id v12 = v3;
        [v9 enumerateBundlesFromDirectoryURL:v8 enumerator:v11];
      }
      uint64_t v5 = [obj countByEnumeratingWithState:&v13 objects:v17 count:16];
    }
    while (v5);
  }
}

void __59__NTKBundleComplicationMigrationService__enumerateBundles___block_invoke()
{
  v0 = objc_alloc_init(NTKBundleLoader);
  uint64_t v1 = (void *)_enumerateBundles___complicationBundleLoader;
  _enumerateBundles___complicationBundleLoader = (uint64_t)v0;
}

uint64_t __59__NTKBundleComplicationMigrationService__enumerateBundles___block_invoke_2(uint64_t a1, void *a2)
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  uint64_t v4 = [v3 infoDictionary];
  uint64_t v5 = NTKBundleComplicationMigrationStatusForInfoDictionary(v4);

  if (!v5)
  {
    char v9 = _NTKLoggingObjectForDomain(56, (uint64_t)"NTKLoggingDomainBundleComplicationMigration");
    if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
    {
      id v10 = [v3 bundleIdentifier];
      int v12 = 138543362;
      long long v13 = v10;
      _os_log_impl(&dword_1BC5A9000, v9, OS_LOG_TYPE_INFO, "NTKBundleComplicationMigrationService: Skipping bundle %{public}@, not migrated", (uint8_t *)&v12, 0xCu);
    }
    goto LABEL_12;
  }
  if (([v3 isLoaded] & 1) == 0)
  {
    uint64_t v6 = [v3 objectForInfoDictionaryKey:@"NSPrincipalClass"];
    if (v6)
    {

      goto LABEL_5;
    }
    char v9 = _NTKLoggingObjectForDomain(56, (uint64_t)"NTKLoggingDomainBundleComplicationMigration");
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR)) {
      __59__NTKBundleComplicationMigrationService__enumerateBundles___block_invoke_2_cold_1(v3, v9);
    }
LABEL_12:

    uint64_t v8 = 0;
    goto LABEL_13;
  }
LABEL_5:
  uint64_t v7 = *(void *)(a1 + 32);
  if (v7) {
    (*(void (**)(uint64_t, id))(v7 + 16))(v7, v3);
  }
  uint64_t v8 = 1;
LABEL_13:

  return v8;
}

- (id)_loadAndFetchClassesForBundleIdentifier:(id)a3
{
  id v4 = a3;
  uint64_t v11 = 0;
  int v12 = &v11;
  uint64_t v13 = 0x3032000000;
  uint64_t v14 = __Block_byref_object_copy__24;
  long long v15 = __Block_byref_object_dispose__24;
  id v16 = 0;
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __81__NTKBundleComplicationMigrationService__loadAndFetchClassesForBundleIdentifier___block_invoke;
  v8[3] = &unk_1E62C42B0;
  id v5 = v4;
  id v9 = v5;
  id v10 = &v11;
  [(NTKBundleComplicationMigrationService *)self _enumerateBundles:v8];
  id v6 = (id)v12[5];

  _Block_object_dispose(&v11, 8);
  return v6;
}

void __81__NTKBundleComplicationMigrationService__loadAndFetchClassesForBundleIdentifier___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  id v4 = [v3 bundleIdentifier];
  int v5 = [v4 isEqualToString:*(void *)(a1 + 32)];

  if (v5)
  {
    if (([v3 isLoaded] & 1) == 0)
    {
      [v3 load];
      id v6 = _NTKLoggingObjectForDomain(56, (uint64_t)"NTKLoggingDomainBundleComplicationMigration");
      if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
      {
        uint64_t v7 = [v3 bundleIdentifier];
        int v11 = 138543362;
        int v12 = v7;
        _os_log_impl(&dword_1BC5A9000, v6, OS_LOG_TYPE_DEFAULT, "NTKBundleComplicationMigrationService: Loading bundle for identifier %{public}@", (uint8_t *)&v11, 0xCu);
      }
    }
    uint64_t v8 = NTKBundleComplicationDataSourceClassesFromBundle(v3);
    uint64_t v9 = *(void *)(*(void *)(a1 + 40) + 8);
    id v10 = *(void **)(v9 + 40);
    *(void *)(v9 + 40) = v8;
  }
}

- (void).cxx_destruct
{
}

void __111__NTKBundleComplicationMigrationService__performMigrationWithDataSource_complication_family_device_completion___block_invoke_16_cold_1(uint64_t a1, NSObject *a2)
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  id v4 = [(id)objc_opt_class() bundleIdentifier];
  uint64_t v5 = *(void *)(a1 + 40);
  id v6 = CLKComplicationFamilyDescription();
  uint64_t v7 = *(void *)(a1 + 56);
  int v8 = 138413058;
  uint64_t v9 = v4;
  __int16 v10 = 2112;
  uint64_t v11 = v5;
  __int16 v12 = 2112;
  uint64_t v13 = v6;
  __int16 v14 = 2048;
  uint64_t v15 = v7;
  _os_log_fault_impl(&dword_1BC5A9000, a2, OS_LOG_TYPE_FAULT, "Timed out requesting migration from %@ with request <complication=%@, family=%@ (%li)>", (uint8_t *)&v8, 0x2Au);
}

void __59__NTKBundleComplicationMigrationService__enumerateBundles___block_invoke_2_cold_1(void *a1, NSObject *a2)
{
  uint64_t v6 = *MEMORY[0x1E4F143B8];
  id v3 = [a1 bundleIdentifier];
  int v4 = 138543362;
  uint64_t v5 = v3;
  _os_log_error_impl(&dword_1BC5A9000, a2, OS_LOG_TYPE_ERROR, "NTKBundleComplicationMigrationService: Bundle %{public}@ missing principal class", (uint8_t *)&v4, 0xCu);
}

@end