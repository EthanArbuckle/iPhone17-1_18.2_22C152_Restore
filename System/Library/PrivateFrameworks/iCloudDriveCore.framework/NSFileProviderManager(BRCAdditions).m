@interface NSFileProviderManager(BRCAdditions)
+ (uint64_t)br_addDomain:()BRCAdditions forProviderIdentifier:error:;
+ (uint64_t)br_importDomain:()BRCAdditions forProviderIdentifier:fromDirectoryAtURL:error:;
+ (uint64_t)br_importDomain:()BRCAdditions forProviderIdentifier:fromDirectoryAtURL:knownFolders:error:;
- (uint64_t)br_removeDomain:()BRCAdditions options:completionHandler:;
- (uint64_t)br_signalWorkingSetEnumeratorWithCompletionHandler:()BRCAdditions;
- (void)_br_removeDomain:()BRCAdditions options:retries:completionHandler:;
- (void)br_addDomain:()BRCAdditions completionHandler:;
- (void)br_removeDomain:()BRCAdditions options:sync:completionHandler:;
- (void)br_removeDomain:()BRCAdditions sync:completionHandler:;
- (void)br_signalEnumeratorForContainerItemIdentifier:()BRCAdditions completionHandler:;
@end

@implementation NSFileProviderManager(BRCAdditions)

- (void)br_removeDomain:()BRCAdditions sync:completionHandler:
{
  id v8 = a5;
  v10[0] = MEMORY[0x263EF8330];
  v10[1] = 3221225472;
  v10[2] = __78__NSFileProviderManager_BRCAdditions__br_removeDomain_sync_completionHandler___block_invoke;
  v10[3] = &unk_2650857D0;
  id v11 = v8;
  id v9 = v8;
  objc_msgSend(a1, "br_removeDomain:options:sync:completionHandler:", a3, 0, a4, v10);
}

- (void)_br_removeDomain:()BRCAdditions options:retries:completionHandler:
{
  id v10 = a3;
  id v11 = a6;
  v12 = [MEMORY[0x263F841B0] sharedManager];
  v13 = [v12 currentPersona];
  v14 = [v13 userPersonaUniqueString];

  objc_initWeak(&location, a1);
  v18[0] = MEMORY[0x263EF8330];
  v18[1] = 3221225472;
  v18[2] = __90__NSFileProviderManager_BRCAdditions___br_removeDomain_options_retries_completionHandler___block_invoke;
  v18[3] = &unk_265085820;
  id v15 = v11;
  id v21 = v15;
  v22[1] = a5;
  objc_copyWeak(v22, &location);
  id v16 = v14;
  id v19 = v16;
  id v17 = v10;
  id v20 = v17;
  v22[2] = a4;
  [a1 removeDomain:v17 options:a4 completionHandler:v18];

  objc_destroyWeak(v22);
  objc_destroyWeak(&location);
}

- (uint64_t)br_removeDomain:()BRCAdditions options:completionHandler:
{
  return objc_msgSend(a1, "_br_removeDomain:options:retries:completionHandler:", a3, a4, 1, a5);
}

- (void)br_removeDomain:()BRCAdditions options:sync:completionHandler:
{
  uint64_t v40 = *MEMORY[0x263EF8340];
  id v10 = a3;
  id v11 = a6;
  if (a5)
  {
    uint64_t v28 = 0;
    v29 = &v28;
    uint64_t v30 = 0x3032000000;
    v31 = __Block_byref_object_copy__45;
    v32 = __Block_byref_object_dispose__45;
    id v33 = 0;
    v12 = (void *)MEMORY[0x263F32650];
    v13 = +[BRCUserDefaults defaultsForMangledID:0];
    uint64_t v14 = [v13 xpcConnectionFailureRetries];
    id v27 = 0;
    v23[0] = MEMORY[0x263EF8330];
    v23[1] = 3221225472;
    v23[2] = __86__NSFileProviderManager_BRCAdditions__br_removeDomain_options_sync_completionHandler___block_invoke;
    v23[3] = &unk_265085848;
    v23[4] = a1;
    id v15 = v10;
    id v24 = v15;
    v25 = &v28;
    uint64_t v26 = a4;
    LODWORD(v12) = [v12 executeXPCWithMaxRetries:v14 error:&v27 block:v23];
    id v16 = v27;

    if (v12)
    {
      id v17 = brc_bread_crumbs();
      v18 = brc_default_log();
      if (os_log_type_enabled(v18, OS_LOG_TYPE_DEBUG)) {
        -[NSFileProviderManager(BRCAdditions) br_removeDomain:options:sync:completionHandler:]((uint64_t)v15, (uint64_t)v17, v18);
      }
    }
    else
    {
      id v17 = brc_bread_crumbs();
      v18 = brc_default_log();
      if (os_log_type_enabled(v18, (os_log_type_t)0x90u))
      {
        *(_DWORD *)buf = 138412802;
        id v35 = v15;
        __int16 v36 = 2112;
        id v37 = v16;
        __int16 v38 = 2112;
        v39 = v17;
        _os_log_error_impl(&dword_23FA42000, v18, (os_log_type_t)0x90u, "[ERROR] couldn't remove domain %@ in a sync way: %@%@", buf, 0x20u);
      }
    }

    v11[2](v11, v29[5], v16);
    _Block_object_dispose(&v28, 8);
  }
  else
  {
    uint64_t v28 = 0;
    v29 = &v28;
    uint64_t v30 = 0x3032000000;
    v31 = __Block_byref_object_copy__45;
    v32 = __Block_byref_object_dispose__45;
    id v33 = 0;
    v19[0] = MEMORY[0x263EF8330];
    v19[1] = 3221225472;
    v19[2] = __86__NSFileProviderManager_BRCAdditions__br_removeDomain_options_sync_completionHandler___block_invoke_6;
    v19[3] = &unk_265085870;
    v22 = &v28;
    id v20 = v10;
    id v21 = v11;
    objc_msgSend(a1, "br_removeDomain:options:completionHandler:", v20, a4, v19);

    _Block_object_dispose(&v28, 8);
  }
}

+ (uint64_t)br_importDomain:()BRCAdditions forProviderIdentifier:fromDirectoryAtURL:error:
{
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  v12 = (void *)MEMORY[0x263F32650];
  v13 = +[BRCUserDefaults defaultsForMangledID:0];
  uint64_t v14 = [v13 xpcConnectionFailureRetries];
  v20[0] = MEMORY[0x263EF8330];
  v20[1] = 3221225472;
  v20[2] = __102__NSFileProviderManager_BRCAdditions__br_importDomain_forProviderIdentifier_fromDirectoryAtURL_error___block_invoke;
  v20[3] = &unk_265085898;
  id v21 = v9;
  id v22 = v10;
  id v23 = v11;
  id v15 = v11;
  id v16 = v10;
  id v17 = v9;
  uint64_t v18 = [v12 executeXPCWithMaxRetries:v14 error:a6 block:v20];

  return v18;
}

+ (uint64_t)br_importDomain:()BRCAdditions forProviderIdentifier:fromDirectoryAtURL:knownFolders:error:
{
  id v11 = a3;
  id v12 = a4;
  id v13 = a5;
  id v14 = a6;
  id v15 = (void *)MEMORY[0x263F32650];
  id v16 = +[BRCUserDefaults defaultsForMangledID:0];
  uint64_t v17 = [v16 xpcConnectionFailureRetries];
  v24[0] = MEMORY[0x263EF8330];
  v24[1] = 3221225472;
  v24[2] = __115__NSFileProviderManager_BRCAdditions__br_importDomain_forProviderIdentifier_fromDirectoryAtURL_knownFolders_error___block_invoke;
  v24[3] = &unk_2650858C0;
  id v25 = v11;
  id v26 = v12;
  id v27 = v13;
  id v28 = v14;
  id v18 = v14;
  id v19 = v13;
  id v20 = v12;
  id v21 = v11;
  uint64_t v22 = [v15 executeXPCWithMaxRetries:v17 error:a7 block:v24];

  return v22;
}

+ (uint64_t)br_addDomain:()BRCAdditions forProviderIdentifier:error:
{
  id v7 = a3;
  id v8 = a4;
  id v9 = (void *)MEMORY[0x263F32650];
  id v10 = +[BRCUserDefaults defaultsForMangledID:0];
  uint64_t v11 = [v10 xpcConnectionFailureRetries];
  v16[0] = MEMORY[0x263EF8330];
  v16[1] = 3221225472;
  v16[2] = __80__NSFileProviderManager_BRCAdditions__br_addDomain_forProviderIdentifier_error___block_invoke;
  v16[3] = &unk_2650858E8;
  id v17 = v7;
  id v18 = v8;
  id v12 = v8;
  id v13 = v7;
  uint64_t v14 = [v9 executeXPCWithMaxRetries:v11 error:a5 block:v16];

  return v14;
}

- (void)br_addDomain:()BRCAdditions completionHandler:
{
  id v6 = a3;
  id v7 = (void *)MEMORY[0x263F32650];
  id v8 = a4;
  id v9 = +[BRCUserDefaults defaultsForMangledID:0];
  uint64_t v10 = [v9 xpcConnectionFailureRetries];
  v12[0] = MEMORY[0x263EF8330];
  v12[1] = 3221225472;
  v12[2] = __70__NSFileProviderManager_BRCAdditions__br_addDomain_completionHandler___block_invoke;
  v12[3] = &unk_2650837F0;
  v12[4] = a1;
  id v13 = v6;
  id v11 = v6;
  [v7 executeAsyncXPCWithMaxRetries:v10 completion:v8 xpcInvokeBlock:v12];
}

- (void)br_signalEnumeratorForContainerItemIdentifier:()BRCAdditions completionHandler:
{
  id v6 = a3;
  id v7 = (void *)MEMORY[0x263F32650];
  id v8 = a4;
  id v9 = +[BRCUserDefaults defaultsForMangledID:0];
  uint64_t v10 = [v9 xpcConnectionFailureRetries];
  v12[0] = MEMORY[0x263EF8330];
  v12[1] = 3221225472;
  v12[2] = __103__NSFileProviderManager_BRCAdditions__br_signalEnumeratorForContainerItemIdentifier_completionHandler___block_invoke;
  v12[3] = &unk_2650837F0;
  v12[4] = a1;
  id v13 = v6;
  id v11 = v6;
  [v7 executeAsyncXPCWithMaxRetries:v10 completion:v8 xpcInvokeBlock:v12];
}

- (uint64_t)br_signalWorkingSetEnumeratorWithCompletionHandler:()BRCAdditions
{
  return objc_msgSend(a1, "br_signalEnumeratorForContainerItemIdentifier:completionHandler:", *MEMORY[0x263F05400], a3);
}

- (void)br_removeDomain:()BRCAdditions options:sync:completionHandler:.cold.1(uint64_t a1, uint64_t a2, NSObject *a3)
{
  *(_DWORD *)v3 = 138412546;
  *(void *)&v3[4] = a1;
  *(_WORD *)&v3[12] = 2112;
  *(void *)&v3[14] = a2;
  OUTLINED_FUNCTION_1(&dword_23FA42000, a2, a3, "[DEBUG] Successfully removed domain %@ in a sync way%@", *(void *)v3, *(void *)&v3[8], *(void *)&v3[16], *MEMORY[0x263EF8340]);
}

@end