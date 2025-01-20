@interface SAPathManager
+ (SAPathManager)defaultManager;
- (BOOL)validatePaths:(id)a3;
- (id)checkForDuplicatePathsWithDifferentExclusivity:(id)a3;
- (id)checkUnAllowedBundleIDs:(id)a3;
- (id)checkUnAllowedPaths:(id)a3;
- (void)registerPaths:(id)a3 completionHandler:(id)a4;
- (void)registerPaths:(id)a3 forBundleID:(id)a4 completionHandler:(id)a5;
- (void)unregisterPaths:(id)a3 completionHandler:(id)a4;
- (void)unregisterURLs:(id)a3 forBundleID:(id)a4 completionHandler:(id)a5;
@end

@implementation SAPathManager

+ (SAPathManager)defaultManager
{
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __31__SAPathManager_defaultManager__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (defaultManager_once != -1) {
    dispatch_once(&defaultManager_once, block);
  }
  v2 = (void *)defaultManager__self;
  return (SAPathManager *)v2;
}

uint64_t __31__SAPathManager_defaultManager__block_invoke(uint64_t a1)
{
  defaultManager__self = (uint64_t)objc_alloc_init(*(Class *)(a1 + 32));
  return MEMORY[0x270F9A758]();
}

- (id)checkUnAllowedBundleIDs:(id)a3
{
  v25[3] = *MEMORY[0x263EF8340];
  id v3 = a3;
  v25[0] = @"com.apple.fakeapp.System";
  v25[1] = @"com.apple.fakeapp.SystemData";
  v25[2] = @"com.apple.fakeapp.SoftwareUpdate";
  v4 = [MEMORY[0x263EFF8C0] arrayWithObjects:v25 count:3];
  long long v18 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  long long v21 = 0u;
  id v5 = v3;
  uint64_t v6 = [v5 countByEnumeratingWithState:&v18 objects:v24 count:16];
  v7 = (void *)v6;
  if (v6)
  {
    uint64_t v8 = *(void *)v19;
    while (2)
    {
      v9 = 0;
      do
      {
        if (*(void *)v19 != v8) {
          objc_enumerationMutation(v5);
        }
        v10 = *(void **)(*((void *)&v18 + 1) + 8 * (void)v9);
        v11 = (void *)MEMORY[0x2611D1170](v6);
        v12 = objc_msgSend(v10, "bundleID", (void)v18);
        if ([v4 containsObject:v12])
        {
          v13 = (void *)MEMORY[0x263F087E8];
          uint64_t v14 = *MEMORY[0x263F08438];
          uint64_t v22 = *MEMORY[0x263F08320];
          v15 = [NSString stringWithFormat:@"Un-allowed bundleID"];
          v23 = v15;
          v16 = [NSDictionary dictionaryWithObjects:&v23 forKeys:&v22 count:1];
          v7 = [v13 errorWithDomain:v14 code:22 userInfo:v16];

          goto LABEL_11;
        }

        v9 = (char *)v9 + 1;
      }
      while (v7 != v9);
      uint64_t v6 = [v5 countByEnumeratingWithState:&v18 objects:v24 count:16];
      v7 = (void *)v6;
      if (v6) {
        continue;
      }
      break;
    }
  }
LABEL_11:

  return v7;
}

- (id)checkUnAllowedPaths:(id)a3
{
  id v3 = a3;
  uint64_t v7 = 0;
  uint64_t v8 = &v7;
  uint64_t v9 = 0x3032000000;
  v10 = __Block_byref_object_copy__1;
  v11 = __Block_byref_object_dispose__1;
  id v12 = 0;
  v6[0] = MEMORY[0x263EF8330];
  v6[1] = 3221225472;
  v6[2] = __37__SAPathManager_checkUnAllowedPaths___block_invoke;
  v6[3] = &unk_26551E7A8;
  v6[4] = &v7;
  [v3 enumerateObjectsUsingBlock:v6];
  id v4 = (id)v8[5];
  _Block_object_dispose(&v7, 8);

  return v4;
}

void __37__SAPathManager_checkUnAllowedPaths___block_invoke(uint64_t a1, void *a2, uint64_t a3, unsigned char *a4)
{
  v39[1] = *MEMORY[0x263EF8340];
  id v6 = a2;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    uint64_t v7 = [v6 url];
    uint64_t v8 = [v7 path];
    int v9 = [&unk_270B09CB0 containsObject:v8];

    if (v9)
    {
      v10 = (void *)MEMORY[0x263F087E8];
      uint64_t v11 = *MEMORY[0x263F08438];
      uint64_t v36 = *MEMORY[0x263F08320];
      id v12 = NSString;
      v13 = [v6 url];
      uint64_t v14 = [v6 bundleID];
      v15 = [v12 stringWithFormat:@"Path (%@) is not permitted to be registered for bundle (%@)", v13, v14];
      v37 = v15;
      v16 = [NSDictionary dictionaryWithObjects:&v37 forKeys:&v36 count:1];
      uint64_t v17 = [v10 errorWithDomain:v11 code:1 userInfo:v16];
      uint64_t v18 = *(void *)(*(void *)(a1 + 32) + 8);
      long long v19 = *(void **)(v18 + 40);
      *(void *)(v18 + 40) = v17;
    }
    else
    {
      v33[0] = MEMORY[0x263EF8330];
      v33[1] = 3221225472;
      v33[2] = __37__SAPathManager_checkUnAllowedPaths___block_invoke_2;
      v33[3] = &unk_26551E780;
      id v26 = v6;
      uint64_t v27 = *(void *)(a1 + 32);
      id v34 = v26;
      uint64_t v35 = v27;
      [&unk_270B09CC8 enumerateObjectsUsingBlock:v33];
      if (!*(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 40))
      {
        v30[0] = MEMORY[0x263EF8330];
        v30[1] = 3221225472;
        v30[2] = __37__SAPathManager_checkUnAllowedPaths___block_invoke_3;
        v30[3] = &unk_26551E780;
        id v28 = v26;
        uint64_t v29 = *(void *)(a1 + 32);
        id v31 = v28;
        uint64_t v32 = v29;
        [&unk_270B09CE0 enumerateObjectsUsingBlock:v30];
      }
      v13 = v34;
    }
  }
  else
  {
    long long v20 = (void *)MEMORY[0x263F087E8];
    uint64_t v21 = *MEMORY[0x263F08438];
    uint64_t v38 = *MEMORY[0x263F08320];
    v13 = [NSString stringWithFormat:@"Invalid paths input, not all objects in the paths array are of type SAPathInfo"];
    v39[0] = v13;
    uint64_t v22 = [NSDictionary dictionaryWithObjects:v39 forKeys:&v38 count:1];
    uint64_t v23 = [v20 errorWithDomain:v21 code:22 userInfo:v22];
    uint64_t v24 = *(void *)(*(void *)(a1 + 32) + 8);
    v25 = *(void **)(v24 + 40);
    *(void *)(v24 + 40) = v23;
  }
  if (*(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 40)) {
    *a4 = 1;
  }
}

void __37__SAPathManager_checkUnAllowedPaths___block_invoke_2(uint64_t a1, void *a2, uint64_t a3, unsigned char *a4)
{
  v18[1] = *MEMORY[0x263EF8340];
  id v6 = a2;
  uint64_t v7 = [*(id *)(a1 + 32) url];
  uint64_t v8 = [v7 path];
  int v9 = [v8 hasPrefix:v6];

  if (v9)
  {
    v10 = (void *)MEMORY[0x263F087E8];
    uint64_t v11 = *MEMORY[0x263F08438];
    id v12 = [NSString stringWithFormat:@"Registering paths under %@ is not permitted", v6, *MEMORY[0x263F08320]];
    v18[0] = v12;
    v13 = [NSDictionary dictionaryWithObjects:v18 forKeys:&v17 count:1];
    uint64_t v14 = [v10 errorWithDomain:v11 code:1 userInfo:v13];
    uint64_t v15 = *(void *)(*(void *)(a1 + 40) + 8);
    v16 = *(void **)(v15 + 40);
    *(void *)(v15 + 40) = v14;

    *a4 = 1;
  }
}

void __37__SAPathManager_checkUnAllowedPaths___block_invoke_3(uint64_t a1, void *a2, uint64_t a3, unsigned char *a4)
{
  v18[1] = *MEMORY[0x263EF8340];
  id v6 = *(void **)(a1 + 32);
  id v7 = a2;
  uint64_t v8 = [v6 url];
  int v9 = [v8 path];
  int v10 = [v9 containsString:v7];

  if (v10)
  {
    uint64_t v11 = (void *)MEMORY[0x263F087E8];
    uint64_t v12 = *MEMORY[0x263F08438];
    uint64_t v17 = *MEMORY[0x263F08320];
    v18[0] = @"Registering paths with reference to current/parent directory is not allowed";
    v13 = [NSDictionary dictionaryWithObjects:v18 forKeys:&v17 count:1];
    uint64_t v14 = [v11 errorWithDomain:v12 code:1 userInfo:v13];
    uint64_t v15 = *(void *)(*(void *)(a1 + 40) + 8);
    v16 = *(void **)(v15 + 40);
    *(void *)(v15 + 40) = v14;

    *a4 = 1;
  }
}

- (id)checkForDuplicatePathsWithDifferentExclusivity:(id)a3
{
  uint64_t v35 = *MEMORY[0x263EF8340];
  id v3 = a3;
  id v4 = objc_opt_new();
  long long v28 = 0u;
  long long v29 = 0u;
  long long v30 = 0u;
  long long v31 = 0u;
  id obj = v3;
  uint64_t v5 = [obj countByEnumeratingWithState:&v28 objects:v34 count:16];
  if (!v5)
  {
    id v26 = 0;
    goto LABEL_16;
  }
  uint64_t v6 = v5;
  id v26 = 0;
  uint64_t v27 = *(void *)v29;
  uint64_t v24 = *MEMORY[0x263F07F70];
  uint64_t v23 = *MEMORY[0x263F08338];
  do
  {
    for (uint64_t i = 0; i != v6; ++i)
    {
      if (*(void *)v29 != v27) {
        objc_enumerationMutation(obj);
      }
      uint64_t v8 = *(void **)(*((void *)&v28 + 1) + 8 * i);
      int v9 = (void *)MEMORY[0x2611D1170]();
      int v10 = [v8 url];
      uint64_t v11 = [v4 objectForKeyedSubscript:v10];

      if (!v11)
      {
        [v4 setObject:v8 forKeyedSubscript:v10];
        goto LABEL_12;
      }
      uint64_t v12 = [v4 objectForKeyedSubscript:v10];
      int v13 = [v12 exclusive];
      if (v13 == [v8 exclusive])
      {
        uint64_t v14 = [v4 objectForKeyedSubscript:v10];
        uint64_t v15 = [v14 bundleID];
        v16 = [v8 bundleID];
        char v17 = [v15 isEqual:v16];

        if (v17) {
          goto LABEL_12;
        }
      }
      else
      {
      }
      uint64_t v18 = (void *)MEMORY[0x263F087E8];
      uint64_t v32 = v23;
      long long v19 = [NSString stringWithFormat:@"Path %@ is supplied more than once with different exclusivity OR multiple bundles", v10];
      v33 = v19;
      long long v20 = [NSDictionary dictionaryWithObjects:&v33 forKeys:&v32 count:1];
      uint64_t v21 = [v18 errorWithDomain:v24 code:1024 userInfo:v20];

      id v26 = (id)v21;
LABEL_12:
    }
    uint64_t v6 = [obj countByEnumeratingWithState:&v28 objects:v34 count:16];
  }
  while (v6);
LABEL_16:

  return v26;
}

- (BOOL)validatePaths:(id)a3
{
  uint64_t v19 = *MEMORY[0x263EF8340];
  id v3 = a3;
  id v4 = v3;
  if (v3 && [v3 count])
  {
    long long v16 = 0u;
    long long v17 = 0u;
    long long v14 = 0u;
    long long v15 = 0u;
    id v5 = v4;
    uint64_t v6 = [v5 countByEnumeratingWithState:&v14 objects:v18 count:16];
    if (v6)
    {
      uint64_t v7 = v6;
      uint64_t v8 = *(void *)v15;
      while (2)
      {
        for (uint64_t i = 0; i != v7; ++i)
        {
          if (*(void *)v15 != v8) {
            objc_enumerationMutation(v5);
          }
          int v10 = objc_msgSend(*(id *)(*((void *)&v14 + 1) + 8 * i), "bundleID", (void)v14);
          uint64_t v11 = v10;
          if (!v10 || ![v10 length])
          {

            BOOL v12 = 0;
            goto LABEL_16;
          }
        }
        uint64_t v7 = [v5 countByEnumeratingWithState:&v14 objects:v18 count:16];
        BOOL v12 = 1;
        if (v7) {
          continue;
        }
        break;
      }
    }
    else
    {
      BOOL v12 = 1;
    }
LABEL_16:
  }
  else
  {
    BOOL v12 = 0;
  }

  return v12;
}

- (void)registerPaths:(id)a3 forBundleID:(id)a4 completionHandler:(id)a5
{
  uint64_t v22 = *MEMORY[0x263EF8340];
  id v8 = a3;
  id v9 = a4;
  int v10 = (void (**)(id, void *))a5;
  uint64_t v11 = [(SAPathManager *)self checkUnAllowedPaths:v8];
  if (v11)
  {
    v10[2](v10, v11);
  }
  else
  {
    long long v19 = 0u;
    long long v20 = 0u;
    long long v17 = 0u;
    long long v18 = 0u;
    id v12 = v8;
    uint64_t v13 = [v12 countByEnumeratingWithState:&v17 objects:v21 count:16];
    if (v13)
    {
      uint64_t v14 = v13;
      uint64_t v15 = *(void *)v18;
      do
      {
        for (uint64_t i = 0; i != v14; ++i)
        {
          if (*(void *)v18 != v15) {
            objc_enumerationMutation(v12);
          }
          objc_msgSend(*(id *)(*((void *)&v17 + 1) + 8 * i), "setBundleID:", v9, (void)v17);
        }
        uint64_t v14 = [v12 countByEnumeratingWithState:&v17 objects:v21 count:16];
      }
      while (v14);
    }

    [(SAPathManager *)self registerPaths:v12 completionHandler:v10];
  }
}

- (void)registerPaths:(id)a3 completionHandler:(id)a4
{
  id v6 = a3;
  uint64_t v7 = (void (**)(id, void *))a4;
  if (v7)
  {
    if ([(SAPathManager *)self validatePaths:v6])
    {
      id v8 = [(SAPathManager *)self checkUnAllowedBundleIDs:v6];
      if (!v8)
      {
        id v9 = [(SAPathManager *)self checkUnAllowedPaths:v6];
        if (v9)
        {
          v7[2](v7, v9);
        }
        else
        {
          long long v17 = [MEMORY[0x263EFFA08] setWithArray:v6];
          uint64_t v18 = [v17 allObjects];

          long long v19 = [(SAPathManager *)self checkForDuplicatePathsWithDifferentExclusivity:v18];
          if (v19)
          {
            v7[2](v7, v19);
          }
          else
          {
            uint64_t v29 = 0;
            long long v30 = &v29;
            uint64_t v31 = 0x3032000000;
            uint64_t v32 = __Block_byref_object_copy__1;
            v33 = __Block_byref_object_dispose__1;
            id v34 = +[SADaemonXPC newWithInvalidationHandler:0];
            long long v20 = (void *)v30[5];
            v26[0] = MEMORY[0x263EF8330];
            v26[1] = 3221225472;
            v26[2] = __49__SAPathManager_registerPaths_completionHandler___block_invoke;
            v26[3] = &unk_26551E7D0;
            uint64_t v21 = v7;
            uint64_t v27 = v21;
            long long v28 = &v29;
            uint64_t v22 = [v20 remoteObjectProxyWithErrorHandler:v26];
            v23[0] = MEMORY[0x263EF8330];
            v23[1] = 3221225472;
            v23[2] = __49__SAPathManager_registerPaths_completionHandler___block_invoke_2;
            v23[3] = &unk_26551E7D0;
            uint64_t v24 = v21;
            v25 = &v29;
            [v22 registerPaths:v18 reply:v23];

            _Block_object_dispose(&v29, 8);
          }

          id v6 = (id)v18;
        }

        goto LABEL_10;
      }
    }
    else
    {
      id v8 = [MEMORY[0x263F087E8] errorWithDomain:*MEMORY[0x263F07F70] code:1024 userInfo:0];
    }
    v7[2](v7, v8);
    goto LABEL_10;
  }
  id v8 = SALog();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR)) {
    -[SAPathManager registerPaths:completionHandler:](v8, v10, v11, v12, v13, v14, v15, v16);
  }
LABEL_10:
}

uint64_t __49__SAPathManager_registerPaths_completionHandler___block_invoke(uint64_t a1)
{
  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
  v2 = *(void **)(*(void *)(*(void *)(a1 + 40) + 8) + 40);
  return [v2 invalidate];
}

void __49__SAPathManager_registerPaths_completionHandler___block_invoke_2(uint64_t a1, void *a2)
{
  uint64_t v7 = *MEMORY[0x263EF8340];
  id v3 = a2;
  if (v3)
  {
    id v4 = SALog();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      int v5 = 138412290;
      id v6 = v3;
      _os_log_impl(&dword_25E2BB000, v4, OS_LOG_TYPE_DEFAULT, "registerPaths returned err %@", (uint8_t *)&v5, 0xCu);
    }
  }
  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
  [*(id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40) invalidate];
}

- (void)unregisterPaths:(id)a3 completionHandler:(id)a4
{
  id v6 = a3;
  uint64_t v7 = (void (**)(id, NSObject *))a4;
  if (!v7)
  {
    uint64_t v11 = SALog();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR)) {
      -[SAPathManager unregisterPaths:completionHandler:](v11, v12, v13, v14, v15, v16, v17, v18);
    }
    goto LABEL_9;
  }
  if (![(SAPathManager *)self validatePaths:v6])
  {
    long long v19 = SALog();
    if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR)) {
      -[SAPathManager unregisterPaths:completionHandler:](v19, v20, v21, v22, v23, v24, v25, v26);
    }

    uint64_t v11 = [MEMORY[0x263F087E8] errorWithDomain:*MEMORY[0x263F07F70] code:1024 userInfo:0];
    v7[2](v7, v11);
LABEL_9:

    goto LABEL_10;
  }
  uint64_t v33 = 0;
  id v34 = &v33;
  uint64_t v35 = 0x3032000000;
  uint64_t v36 = __Block_byref_object_copy__1;
  v37 = __Block_byref_object_dispose__1;
  id v38 = +[SADaemonXPC newWithInvalidationHandler:0];
  id v8 = (void *)v34[5];
  v30[0] = MEMORY[0x263EF8330];
  v30[1] = 3221225472;
  v30[2] = __51__SAPathManager_unregisterPaths_completionHandler___block_invoke;
  v30[3] = &unk_26551E7D0;
  id v9 = v7;
  uint64_t v31 = v9;
  uint64_t v32 = &v33;
  uint64_t v10 = [v8 remoteObjectProxyWithErrorHandler:v30];
  v27[0] = MEMORY[0x263EF8330];
  v27[1] = 3221225472;
  v27[2] = __51__SAPathManager_unregisterPaths_completionHandler___block_invoke_171;
  v27[3] = &unk_26551E7D0;
  long long v28 = v9;
  uint64_t v29 = &v33;
  [v10 unregisterPaths:v6 reply:v27];

  _Block_object_dispose(&v33, 8);
LABEL_10:
}

uint64_t __51__SAPathManager_unregisterPaths_completionHandler___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = SALog();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
    __51__SAPathManager_unregisterPaths_completionHandler___block_invoke_cold_1(v4);
  }

  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
  return [*(id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40) invalidate];
}

void __51__SAPathManager_unregisterPaths_completionHandler___block_invoke_171(uint64_t a1, void *a2)
{
  id v3 = a2;
  if (v3)
  {
    id v4 = SALog();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
      __51__SAPathManager_unregisterPaths_completionHandler___block_invoke_171_cold_1((uint64_t)v3, v4, v5, v6, v7, v8, v9, v10);
    }
  }
  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
  [*(id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40) invalidate];
}

- (void)unregisterURLs:(id)a3 forBundleID:(id)a4 completionHandler:(id)a5
{
  uint64_t v23 = *MEMORY[0x263EF8340];
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  uint64_t v11 = objc_opt_new();
  long long v18 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  long long v21 = 0u;
  id v12 = v8;
  uint64_t v13 = [v12 countByEnumeratingWithState:&v18 objects:v22 count:16];
  if (v13)
  {
    uint64_t v14 = v13;
    uint64_t v15 = *(void *)v19;
    do
    {
      uint64_t v16 = 0;
      do
      {
        if (*(void *)v19 != v15) {
          objc_enumerationMutation(v12);
        }
        uint64_t v17 = +[SAPathInfo pathInfoWithURL:bundleID:](SAPathInfo, "pathInfoWithURL:bundleID:", *(void *)(*((void *)&v18 + 1) + 8 * v16), v9, (void)v18);
        [v11 addObject:v17];

        ++v16;
      }
      while (v14 != v16);
      uint64_t v14 = [v12 countByEnumeratingWithState:&v18 objects:v22 count:16];
    }
    while (v14);
  }

  [(SAPathManager *)self unregisterPaths:v11 completionHandler:v10];
}

- (void)registerPaths:(uint64_t)a3 completionHandler:(uint64_t)a4 .cold.1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

- (void)unregisterPaths:(uint64_t)a3 completionHandler:(uint64_t)a4 .cold.1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

- (void)unregisterPaths:(uint64_t)a3 completionHandler:(uint64_t)a4 .cold.2(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void __51__SAPathManager_unregisterPaths_completionHandler___block_invoke_cold_1(os_log_t log)
{
  *(_WORD *)v1 = 0;
  _os_log_error_impl(&dword_25E2BB000, log, OS_LOG_TYPE_ERROR, "connection dropped", v1, 2u);
}

void __51__SAPathManager_unregisterPaths_completionHandler___block_invoke_171_cold_1(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0(&dword_25E2BB000, a2, a3, "unregisterURLs returned err %@", a5, a6, a7, a8, 2u);
}

@end