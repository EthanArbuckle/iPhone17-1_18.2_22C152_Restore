@interface BRCImportUtil
+ (BOOL)isFileNameIgnoredForSync:(id)a3 isRegFile:(BOOL)a4;
+ (BOOL)reimportItemsBelowItemWithIdentifier:(id)a3 error:(id *)a4;
+ (BOOL)shouldFileIDBeIgnoredAsNonMigrated:(id)a3 docID:(id)a4 deviceID:(id)a5 isRegFile:(BOOL)a6 rowid:(id)a7 outItemURL:(id *)a8 isBusyDate:(BOOL *)a9 isIgnoredFromSync:(BOOL *)a10;
+ (void)forceIngestionForItemID:(id)a3 completionHandler:(id)a4;
+ (void)forceLatestVersionOnDiskForItemID:(id)a3 completionHandler:(id)a4;
+ (void)reimportItemsBelowItemWithIdentifier:(id)a3 completionHandler:(id)a4;
+ (void)requestModificationOfItemIdentifier:(id)a3 completionHandler:(id)a4;
@end

@implementation BRCImportUtil

+ (BOOL)reimportItemsBelowItemWithIdentifier:(id)a3 error:(id *)a4
{
  uint64_t v30 = *MEMORY[0x263EF8340];
  id v5 = a3;
  v6 = dispatch_group_create();
  dispatch_group_enter(v6);
  uint64_t v16 = 0;
  v17 = &v16;
  uint64_t v18 = 0x3032000000;
  v19 = __Block_byref_object_copy__27;
  v20 = __Block_byref_object_dispose__27;
  id v21 = 0;
  v13[0] = MEMORY[0x263EF8330];
  v13[1] = 3221225472;
  v13[2] = __60__BRCImportUtil_reimportItemsBelowItemWithIdentifier_error___block_invoke;
  v13[3] = &unk_2650837C8;
  v15 = &v16;
  v7 = v6;
  v14 = v7;
  +[BRCImportUtil reimportItemsBelowItemWithIdentifier:v5 completionHandler:v13];
  dispatch_group_wait(v7, 0xFFFFFFFFFFFFFFFFLL);
  id v8 = (id)v17[5];
  if (v8)
  {
    v9 = brc_bread_crumbs();
    v10 = brc_default_log();
    if (os_log_type_enabled(v10, (os_log_type_t)0x90u))
    {
      v12 = "(passed to caller)";
      *(_DWORD *)buf = 136315906;
      v23 = "+[BRCImportUtil reimportItemsBelowItemWithIdentifier:error:]";
      __int16 v24 = 2080;
      if (!a4) {
        v12 = "(ignored by caller)";
      }
      v25 = v12;
      __int16 v26 = 2112;
      id v27 = v8;
      __int16 v28 = 2112;
      v29 = v9;
      _os_log_error_impl(&dword_23FA42000, v10, (os_log_type_t)0x90u, "[ERROR] %s: %s error: %@%@", buf, 0x2Au);
    }
  }
  if (a4) {
    *a4 = v8;
  }

  _Block_object_dispose(&v16, 8);
  return v8 == 0;
}

void __60__BRCImportUtil_reimportItemsBelowItemWithIdentifier_error___block_invoke(uint64_t a1, void *a2)
{
  objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40), a2);
  id v4 = a2;
  dispatch_group_leave(*(dispatch_group_t *)(a1 + 32));
}

+ (void)reimportItemsBelowItemWithIdentifier:(id)a3 completionHandler:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  v7 = brc_bread_crumbs();
  id v8 = brc_default_log();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG)) {
    +[BRCImportUtil reimportItemsBelowItemWithIdentifier:completionHandler:]();
  }

  v9 = objc_msgSend(MEMORY[0x263F055B8], "br_sharedProviderManager");
  if (v9)
  {
    v10 = (void *)MEMORY[0x263F32650];
    v11 = +[BRCUserDefaults defaultsForMangledID:0];
    uint64_t v12 = [v11 xpcConnectionFailureRetries];
    v19[0] = MEMORY[0x263EF8330];
    v19[1] = 3221225472;
    v19[2] = __72__BRCImportUtil_reimportItemsBelowItemWithIdentifier_completionHandler___block_invoke;
    v19[3] = &unk_265080B38;
    id v20 = v5;
    id v21 = v6;
    v16[0] = MEMORY[0x263EF8330];
    v16[1] = 3221225472;
    v16[2] = __72__BRCImportUtil_reimportItemsBelowItemWithIdentifier_completionHandler___block_invoke_7;
    v16[3] = &unk_2650837F0;
    id v17 = v9;
    id v18 = v20;
    [v10 executeAsyncXPCWithMaxRetries:v12 completion:v19 xpcInvokeBlock:v16];

    id v13 = v20;
  }
  else
  {
    v14 = brc_bread_crumbs();
    v15 = brc_default_log();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_FAULT)) {
      +[BRCImportUtil reimportItemsBelowItemWithIdentifier:completionHandler:]();
    }

    objc_msgSend(MEMORY[0x263F087E8], "br_errorWithPOSIXCode:", 22);
    id v13 = (id)objc_claimAutoreleasedReturnValue();
    (*((void (**)(id, id))v6 + 2))(v6, v13);
  }
}

void __72__BRCImportUtil_reimportItemsBelowItemWithIdentifier_completionHandler___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v13 = *MEMORY[0x263EF8340];
  id v3 = a2;
  if (v3)
  {
    id v4 = brc_bread_crumbs();
    id v5 = brc_default_log();
    if (os_log_type_enabled(v5, (os_log_type_t)0x90u))
    {
      uint64_t v6 = *(void *)(a1 + 32);
      int v7 = 138412802;
      uint64_t v8 = v6;
      __int16 v9 = 2112;
      id v10 = v3;
      __int16 v11 = 2112;
      uint64_t v12 = v4;
      _os_log_error_impl(&dword_23FA42000, v5, (os_log_type_t)0x90u, "[ERROR] failed to re-import items under %@ with error %@%@", (uint8_t *)&v7, 0x20u);
    }
  }
  else
  {
    id v4 = brc_bread_crumbs();
    id v5 = brc_default_log();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG)) {
      __72__BRCImportUtil_reimportItemsBelowItemWithIdentifier_completionHandler___block_invoke_cold_1(a1, (uint64_t)v4, v5);
    }
  }

  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
}

void __72__BRCImportUtil_reimportItemsBelowItemWithIdentifier_completionHandler___block_invoke_7(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v5 = *(void **)(a1 + 32);
  uint64_t v4 = *(void *)(a1 + 40);
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __72__BRCImportUtil_reimportItemsBelowItemWithIdentifier_completionHandler___block_invoke_2;
  v7[3] = &unk_265081478;
  id v8 = v3;
  id v6 = v3;
  [v5 reimportItemsBelowItemWithIdentifier:v4 completionHandler:v7];
}

uint64_t __72__BRCImportUtil_reimportItemsBelowItemWithIdentifier_completionHandler___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

+ (void)requestModificationOfItemIdentifier:(id)a3 completionHandler:(id)a4
{
  uint64_t v15 = *MEMORY[0x263EF8340];
  id v5 = a3;
  id v6 = a4;
  int v7 = brc_bread_crumbs();
  id v8 = brc_default_log();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG)) {
    +[BRCImportUtil requestModificationOfItemIdentifier:completionHandler:]();
  }

  __int16 v9 = objc_msgSend(MEMORY[0x263F055B8], "br_sharedProviderManager");
  id v10 = v9;
  if (v9)
  {
    [v9 requestModificationOfFields:1 forItemWithIdentifier:v5 options:1 completionHandler:v6];
  }
  else
  {
    __int16 v11 = brc_bread_crumbs();
    uint64_t v12 = brc_default_log();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      int v13 = 138412290;
      v14 = v11;
      _os_log_impl(&dword_23FA42000, v12, OS_LOG_TYPE_DEFAULT, "[WARNING] Couldn't compute fp manager for current account%@", (uint8_t *)&v13, 0xCu);
    }
  }
}

+ (void)forceIngestionForItemID:(id)a3 completionHandler:(id)a4
{
  uint64_t v27 = *MEMORY[0x263EF8340];
  id v6 = a3;
  int v7 = (void (**)(id, void *))a4;
  if (!v6)
  {
    id v17 = brc_bread_crumbs();
    id v18 = brc_default_log();
    if (os_log_type_enabled(v18, OS_LOG_TYPE_FAULT)) {
      +[BRCImportUtil forceIngestionForItemID:completionHandler:]();
    }
  }
  id v8 = objc_msgSend(MEMORY[0x263F054B8], "br_fpItemIDFromItemIdentifier:", v6);
  if (v8)
  {
    __int16 v9 = brc_bread_crumbs();
    id v10 = brc_default_log();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)buf = 138412802;
      id v22 = v6;
      __int16 v23 = 2112;
      id v24 = v8;
      __int16 v25 = 2112;
      __int16 v26 = v9;
      _os_log_debug_impl(&dword_23FA42000, v10, OS_LOG_TYPE_DEBUG, "[DEBUG] Forcing Ingestion for itemIdentifier = %@ and itemID = %@%@", buf, 0x20u);
    }

    __int16 v11 = (void *)MEMORY[0x263F32650];
    uint64_t v12 = +[BRCUserDefaults defaultsForMangledID:0];
    uint64_t v13 = [v12 xpcConnectionFailureRetries];
    v19[0] = MEMORY[0x263EF8330];
    v19[1] = 3221225472;
    v19[2] = __59__BRCImportUtil_forceIngestionForItemID_completionHandler___block_invoke;
    v19[3] = &unk_265083818;
    id v20 = v8;
    [v11 executeAsyncXPCWithMaxRetries:v13 completion:v7 xpcInvokeBlock:v19];

    v14 = v20;
  }
  else
  {
    uint64_t v15 = brc_bread_crumbs();
    uint64_t v16 = brc_default_log();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412802;
      id v22 = a1;
      __int16 v23 = 2112;
      id v24 = v6;
      __int16 v25 = 2112;
      __int16 v26 = v15;
      _os_log_impl(&dword_23FA42000, v16, OS_LOG_TYPE_DEFAULT, "[WARNING] %@ - Can't find a file provider item ID for %@%@", buf, 0x20u);
    }

    v14 = objc_msgSend(MEMORY[0x263F087E8], "brc_errorItemNotFound:", v6);
    v7[2](v7, v14);
  }
}

void __59__BRCImportUtil_forceIngestionForItemID_completionHandler___block_invoke(uint64_t a1, void *a2)
{
  id v3 = (void *)MEMORY[0x263F05448];
  id v4 = a2;
  id v5 = [v3 sharedConnection];
  [v5 forceIngestionForItemID:*(void *)(a1 + 32) completionHandler:v4];
}

+ (void)forceLatestVersionOnDiskForItemID:(id)a3 completionHandler:(id)a4
{
  uint64_t v22 = *MEMORY[0x263EF8340];
  id v6 = a3;
  int v7 = (void (**)(id, void, void *))a4;
  if (!v6)
  {
    v14 = brc_bread_crumbs();
    uint64_t v15 = brc_default_log();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_FAULT)) {
      +[BRCImportUtil forceIngestionForItemID:completionHandler:]();
    }
  }
  id v8 = objc_msgSend(MEMORY[0x263F054B8], "br_fpItemIDFromItemIdentifier:", v6);
  if (v8)
  {
    __int16 v9 = brc_bread_crumbs();
    id v10 = brc_default_log();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG))
    {
      int v16 = 138412802;
      id v17 = v6;
      __int16 v18 = 2112;
      id v19 = v8;
      __int16 v20 = 2112;
      id v21 = v9;
      _os_log_debug_impl(&dword_23FA42000, v10, OS_LOG_TYPE_DEBUG, "[DEBUG] Propagating To File System for itemIdentifier = %@ and itemID = %@%@", (uint8_t *)&v16, 0x20u);
    }

    __int16 v11 = [MEMORY[0x263F05448] sharedConnection];
    [v11 forceLatestVersionOnDiskForItemID:v8 completionHandler:v7];
  }
  else
  {
    uint64_t v12 = brc_bread_crumbs();
    uint64_t v13 = brc_default_log();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
    {
      int v16 = 138412802;
      id v17 = a1;
      __int16 v18 = 2112;
      id v19 = v6;
      __int16 v20 = 2112;
      id v21 = v12;
      _os_log_impl(&dword_23FA42000, v13, OS_LOG_TYPE_DEFAULT, "[WARNING] %@ - Can't find a file provider item ID for %@%@", (uint8_t *)&v16, 0x20u);
    }

    __int16 v11 = objc_msgSend(MEMORY[0x263F087E8], "brc_errorItemNotFound:", v6);
    v7[2](v7, 0, v11);
  }
}

+ (BOOL)isFileNameIgnoredForSync:(id)a3 isRegFile:(BOOL)a4
{
  BOOL v4 = a4;
  id v5 = a3;
  if (!v5)
  {
    id v8 = brc_bread_crumbs();
    __int16 v9 = brc_default_log();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_FAULT)) {
      +[BRCImportUtil isFileNameIgnoredForSync:isRegFile:]();
    }
  }
  if (objc_msgSend(v5, "br_isExcludedFromSyncInFPFSIsFile:", v4)) {
    char v6 = 1;
  }
  else {
    char v6 = objc_msgSend(v5, "br_isSideFaultName");
  }

  return v6;
}

+ (BOOL)shouldFileIDBeIgnoredAsNonMigrated:(id)a3 docID:(id)a4 deviceID:(id)a5 isRegFile:(BOOL)a6 rowid:(id)a7 outItemURL:(id *)a8 isBusyDate:(BOOL *)a9 isIgnoredFromSync:(BOOL *)a10
{
  BOOL v12 = a6;
  uint64_t v53 = *MEMORY[0x263EF8340];
  id v16 = a3;
  id v17 = a4;
  id v18 = a7;
  id v42 = 0;
  id v19 = objc_msgSend(NSURL, "brc_fileURLWithVolumeDeviceID:fileID:isDirectory:withError:", a5, v16, 0, &v42);
  id v20 = v42;
  if (a8) {
    *a8 = v19;
  }
  uint64_t v41 = 0;
  if (v19) {
    BOOL v21 = v20 == 0;
  }
  else {
    BOOL v21 = 0;
  }
  if (!v21)
  {
    if (objc_msgSend(v20, "br_isPOSIXErrorCode:", 2))
    {
      uint64_t v22 = brc_bread_crumbs();
      __int16 v23 = brc_default_log();
      if (os_log_type_enabled(v23, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138413058;
        id v44 = v18;
        __int16 v45 = 2112;
        id v46 = v17;
        __int16 v47 = 2112;
        id v48 = v16;
        __int16 v49 = 2112;
        id v50 = v22;
        _os_log_impl(&dword_23FA42000, v23, OS_LOG_TYPE_DEFAULT, "[NOTICE] item with rowID %@ docID %@ and fileID %@ was not found on disk%@", buf, 0x2Au);
      }
LABEL_20:

      BOOL v35 = 1;
      goto LABEL_36;
    }
    v33 = brc_bread_crumbs();
    v34 = brc_default_log();
    if (os_log_type_enabled(v34, (os_log_type_t)0x90u))
    {
      *(_DWORD *)buf = 138413314;
      id v44 = v18;
      __int16 v45 = 2112;
      id v46 = v17;
      __int16 v47 = 2112;
      id v48 = v16;
      __int16 v49 = 2112;
      id v50 = v20;
      __int16 v51 = 2112;
      v52 = v33;
      _os_log_error_impl(&dword_23FA42000, v34, (os_log_type_t)0x90u, "[ERROR] failed getting URL of item with rowID %@ docID %@ and fileID %@: %@%@", buf, 0x34u);
    }
    goto LABEL_17;
  }
  if ((objc_msgSend(v19, "br_isInSyncedLocation") & 1) == 0)
  {
    uint64_t v22 = brc_bread_crumbs();
    __int16 v23 = brc_default_log();
    if (os_log_type_enabled(v23, OS_LOG_TYPE_DEFAULT))
    {
      v36 = [v19 path];
      v37 = objc_msgSend(v36, "fp_prettyPath");
      *(_DWORD *)buf = 138413314;
      id v44 = v18;
      __int16 v45 = 2112;
      id v46 = v17;
      __int16 v47 = 2112;
      id v48 = v16;
      __int16 v49 = 2112;
      id v50 = v37;
      __int16 v51 = 2112;
      v52 = v22;
      _os_log_impl(&dword_23FA42000, v23, OS_LOG_TYPE_DEFAULT, "[NOTICE] item with rowID %@ docID %@ and fileID %@ is not located in synced location: %@%@", buf, 0x34u);
    }
    goto LABEL_20;
  }
  __int16 v25 = objc_msgSend(v19, "br_containerID");

  if (!v25)
  {
    __int16 v28 = brc_bread_crumbs();
    v29 = brc_default_log();
    if (!os_log_type_enabled(v29, OS_LOG_TYPE_DEFAULT)) {
      goto LABEL_34;
    }
    uint64_t v30 = [v19 path];
    v31 = objc_msgSend(v30, "fp_prettyPath");
    *(_DWORD *)buf = 138413314;
    id v44 = v18;
    __int16 v45 = 2112;
    id v46 = v17;
    __int16 v47 = 2112;
    id v48 = v16;
    __int16 v49 = 2112;
    id v50 = v31;
    __int16 v51 = 2112;
    v52 = v28;
    v32 = "[NOTICE] item with rowID %@ docID %@ and fileID %@ is located in an invalid container: %@%@";
    goto LABEL_33;
  }
  __int16 v26 = [v19 lastPathComponent];
  int v27 = [a1 isFileNameIgnoredForSync:v26 isRegFile:v12];

  if (v27)
  {
    __int16 v28 = brc_bread_crumbs();
    v29 = brc_default_log();
    if (!os_log_type_enabled(v29, OS_LOG_TYPE_DEFAULT)) {
      goto LABEL_34;
    }
    uint64_t v30 = [v19 path];
    v31 = objc_msgSend(v30, "fp_prettyPath");
    *(_DWORD *)buf = 138413314;
    id v44 = v18;
    __int16 v45 = 2112;
    id v46 = v17;
    __int16 v47 = 2112;
    id v48 = v16;
    __int16 v49 = 2112;
    id v50 = v31;
    __int16 v51 = 2112;
    v52 = v28;
    v32 = "[NOTICE] item with rowID %@ docID %@ and fileID %@ is ignored from sync: %@%@";
    goto LABEL_33;
  }
  if (objc_msgSend(v19, "br_getBirthDate:", &v41) && BRCIsBusyDate(v41))
  {
    a10 = a9;
    __int16 v28 = brc_bread_crumbs();
    v29 = brc_default_log();
    if (!os_log_type_enabled(v29, OS_LOG_TYPE_DEFAULT)) {
      goto LABEL_34;
    }
    uint64_t v30 = [v19 path];
    v31 = objc_msgSend(v30, "fp_prettyPath");
    *(_DWORD *)buf = 138413314;
    id v44 = v18;
    __int16 v45 = 2112;
    id v46 = v17;
    __int16 v47 = 2112;
    id v48 = v16;
    __int16 v49 = 2112;
    id v50 = v31;
    __int16 v51 = 2112;
    v52 = v28;
    v32 = "[NOTICE] item with rowID %@ docID %@ and fileID %@ is busy date: %@%@";
    goto LABEL_33;
  }
  if (objc_msgSend(v19, "br_isIgnoredByFileProvider", v41))
  {
    __int16 v28 = brc_bread_crumbs();
    v29 = brc_default_log();
    if (!os_log_type_enabled(v29, OS_LOG_TYPE_DEFAULT)) {
      goto LABEL_34;
    }
    uint64_t v30 = [v19 path];
    v31 = objc_msgSend(v30, "fp_prettyPath");
    *(_DWORD *)buf = 138413314;
    id v44 = v18;
    __int16 v45 = 2112;
    id v46 = v17;
    __int16 v47 = 2112;
    id v48 = v16;
    __int16 v49 = 2112;
    id v50 = v31;
    __int16 v51 = 2112;
    v52 = v28;
    v32 = "[NOTICE] item with rowID %@ docID %@ and fileID %@ is ignored by FP: %@%@";
    goto LABEL_33;
  }
  if (!objc_msgSend(v19, "br_isRootOwned"))
  {
    v33 = brc_bread_crumbs();
    v34 = brc_default_log();
    if (os_log_type_enabled(v34, (os_log_type_t)0x90u))
    {
      v39 = [v19 path];
      v40 = objc_msgSend(v39, "fp_prettyPath");
      *(_DWORD *)buf = 138413314;
      id v44 = v18;
      __int16 v45 = 2112;
      id v46 = v17;
      __int16 v47 = 2112;
      id v48 = v16;
      __int16 v49 = 2112;
      id v50 = v40;
      __int16 v51 = 2112;
      v52 = v33;
      _os_log_error_impl(&dword_23FA42000, v34, (os_log_type_t)0x90u, "[ERROR] item with rowID %@ docID %@ and fileID %@ got left behind when migrating: %@%@", buf, 0x34u);
    }
LABEL_17:

    BOOL v35 = 0;
    goto LABEL_36;
  }
  __int16 v28 = brc_bread_crumbs();
  v29 = brc_default_log();
  if (os_log_type_enabled(v29, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v30 = [v19 path];
    v31 = objc_msgSend(v30, "fp_prettyPath");
    *(_DWORD *)buf = 138413314;
    id v44 = v18;
    __int16 v45 = 2112;
    id v46 = v17;
    __int16 v47 = 2112;
    id v48 = v16;
    __int16 v49 = 2112;
    id v50 = v31;
    __int16 v51 = 2112;
    v52 = v28;
    v32 = "[NOTICE] item with rowID %@ docID %@ and fileID %@ is root owned: %@%@";
LABEL_33:
    _os_log_impl(&dword_23FA42000, v29, OS_LOG_TYPE_DEFAULT, v32, buf, 0x34u);
  }
LABEL_34:

  BOOL v35 = 1;
  if (a10) {
    *a10 = 1;
  }
LABEL_36:

  return v35;
}

+ (void)reimportItemsBelowItemWithIdentifier:completionHandler:.cold.1()
{
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_2(&dword_23FA42000, v0, v1, "[CRIT] UNREACHABLE: Couldn't compute fp manager for current account%@", v2, v3, v4, v5, v6);
}

+ (void)reimportItemsBelowItemWithIdentifier:completionHandler:.cold.2()
{
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1(&dword_23FA42000, v0, v1, "[DEBUG] Starting BRCImportUtil::reimportItemsBelowItemWithIdentifier::%@%@");
}

void __72__BRCImportUtil_reimportItemsBelowItemWithIdentifier_completionHandler___block_invoke_cold_1(uint64_t a1, uint64_t a2, NSObject *a3)
{
  *(_DWORD *)uint64_t v3 = 138412546;
  *(void *)&v3[4] = *(void *)(a1 + 32);
  *(_WORD *)&v3[12] = 2112;
  *(void *)&v3[14] = a2;
  OUTLINED_FUNCTION_1(&dword_23FA42000, a2, a3, "[DEBUG] Successfully asked file provider to re-import all %@ items%@", *(void *)v3, *(void *)&v3[8], *(void *)&v3[16], *MEMORY[0x263EF8340]);
}

+ (void)requestModificationOfItemIdentifier:completionHandler:.cold.1()
{
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1(&dword_23FA42000, v0, v1, "[DEBUG] Starting BRCImportUtil::requestModificationOfItemIdentifier::%@%@");
}

+ (void)forceIngestionForItemID:completionHandler:.cold.1()
{
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_2(&dword_23FA42000, v0, v1, "[CRIT] Assertion failed: itemIdentifier%@", v2, v3, v4, v5, v6);
}

+ (void)isFileNameIgnoredForSync:isRegFile:.cold.1()
{
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_2(&dword_23FA42000, v0, v1, "[CRIT] Assertion failed: fileName%@", v2, v3, v4, v5, v6);
}

@end