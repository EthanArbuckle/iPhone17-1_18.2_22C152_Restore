@interface BRCMiniCiconia
- (BOOL)_cleanupOldCiconiaDomains:(id *)a3;
- (BOOL)_fsRemoveWorkDirectory:(id *)a3;
- (BOOL)_removeDiagnosticsDirectoryAtURL:(id)a3 withError:(id *)a4;
- (BOOL)_removeFPDomain:(id)a3 error:(id *)a4;
- (BOOL)_removeWorkDirectory:(id *)a3;
- (BRCMiniCiconia)init;
- (void)_setupExtensionID;
- (void)cleanupCiconiaAtURL:(id)a3 diagnosticsURL:(id)a4 completionHandler:(id)a5;
@end

@implementation BRCMiniCiconia

- (BRCMiniCiconia)init
{
  v7.receiver = self;
  v7.super_class = (Class)BRCMiniCiconia;
  v2 = [(BRCMiniCiconia *)&v7 init];
  if (v2)
  {
    v3 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    dispatch_queue_t v4 = dispatch_queue_create("BRCMiniCiconia", v3);

    workQueue = v2->_workQueue;
    v2->_workQueue = (OS_dispatch_queue *)v4;
  }
  return v2;
}

- (void)_setupExtensionID
{
  v3 = [MEMORY[0x263F841B0] sharedManager];
  id v8 = [v3 currentPersona];

  int v4 = [v8 isDataSeparatedPersona];
  BOOL v5 = v4;
  v6 = @"com.apple.CloudDocs.iCloudDriveFileProvider";
  extensionID = self->_extensionID;
  if (v4) {
    v6 = @"com.apple.CloudDocs.iCloudDriveFileProviderManaged";
  }
  self->_extensionID = &v6->isa;

  self->_isDataSeparated = v5;
}

- (BOOL)_removeFPDomain:(id)a3 error:(id *)a4
{
  uint64_t v38 = *MEMORY[0x263EF8340];
  id v5 = a3;
  uint64_t v30 = 0;
  v31 = &v30;
  uint64_t v32 = 0x3032000000;
  v33 = __Block_byref_object_copy__32;
  v34 = __Block_byref_object_dispose__32;
  id v35 = 0;
  dispatch_semaphore_t v6 = dispatch_semaphore_create(0);
  objc_super v7 = brc_bread_crumbs();
  id v8 = brc_default_log();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 138412546;
    *(void *)v37 = v5;
    *(_WORD *)&v37[8] = 2112;
    *(void *)&v37[10] = v7;
    _os_log_debug_impl(&dword_23FA42000, v8, OS_LOG_TYPE_DEBUG, "[DEBUG] Will remove domain: %@%@", buf, 0x16u);
  }

  int v9 = 0;
  uint64_t v10 = MEMORY[0x263EF8330];
  while (1)
  {
    v11 = (void *)MEMORY[0x263F055B8];
    extensionID = self->_extensionID;
    v25[0] = v10;
    v25[1] = 3221225472;
    v25[2] = __40__BRCMiniCiconia__removeFPDomain_error___block_invoke;
    v25[3] = &unk_2650841B0;
    int v29 = v9;
    id v13 = v5;
    id v26 = v13;
    v28 = &v30;
    v14 = v6;
    v27 = v14;
    [v11 removeDomain:v13 forProviderIdentifier:extensionID completionHandler:v25];
    dispatch_time_t v15 = dispatch_time(0, 900000000000);
    if (dispatch_semaphore_wait(v14, v15))
    {
      v16 = brc_bread_crumbs();
      v17 = brc_default_log();
      if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 67109634;
        *(_DWORD *)v37 = v9;
        *(_WORD *)&v37[4] = 2112;
        *(void *)&v37[6] = v5;
        *(_WORD *)&v37[14] = 2112;
        *(void *)&v37[16] = v16;
        _os_log_impl(&dword_23FA42000, v17, OS_LOG_TYPE_DEFAULT, "[WARNING] %d: removeDomain:%@ timed out%@", buf, 0x1Cu);
      }

      uint64_t v18 = objc_msgSend(MEMORY[0x263F087E8], "br_errorWithPOSIXCode:", 60);
      v19 = (void *)v31[5];
      v31[5] = v18;
    }
    v20 = (void *)v31[5];
    if (!v20 || !objc_msgSend(v20, "br_isNSXPCConnectionError")) {
      break;
    }
    sleep(1u);

    if (++v9 == 3) {
      goto LABEL_13;
    }
  }

LABEL_13:
  v21 = (void *)v31[5];
  if (a4 && v21)
  {
    *a4 = v21;
    v21 = (void *)v31[5];
  }
  BOOL v22 = v21 == 0;

  _Block_object_dispose(&v30, 8);
  return v22;
}

void __40__BRCMiniCiconia__removeFPDomain_error___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v19 = *MEMORY[0x263EF8340];
  id v3 = a2;
  if (v3)
  {
    int v4 = brc_bread_crumbs();
    id v5 = brc_default_log();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      int v6 = *(_DWORD *)(a1 + 56);
      uint64_t v7 = *(void *)(a1 + 32);
      id v8 = objc_msgSend(v3, "fp_prettyDescription");
      v12[0] = 67109890;
      v12[1] = v6;
      __int16 v13 = 2112;
      uint64_t v14 = v7;
      __int16 v15 = 2112;
      v16 = v8;
      __int16 v17 = 2112;
      uint64_t v18 = v4;
      _os_log_impl(&dword_23FA42000, v5, OS_LOG_TYPE_DEFAULT, "[WARNING] %d: removeDomain:%@ failed: %@%@", (uint8_t *)v12, 0x26u);
    }
  }
  uint64_t v9 = *(void *)(*(void *)(a1 + 48) + 8);
  uint64_t v10 = *(void **)(v9 + 40);
  *(void *)(v9 + 40) = v3;
  id v11 = v3;

  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 40));
}

- (BOOL)_cleanupOldCiconiaDomains:(id *)a3
{
  uint64_t v57 = *MEMORY[0x263EF8340];
  id v3 = brc_bread_crumbs();
  int v4 = brc_default_log();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG)) {
    -[BRCMiniCiconia _cleanupOldCiconiaDomains:]();
  }

  uint64_t v44 = 0;
  v45 = (id *)&v44;
  uint64_t v46 = 0x3032000000;
  v47 = __Block_byref_object_copy__32;
  v48 = __Block_byref_object_dispose__32;
  id v49 = 0;
  uint64_t v38 = 0;
  v39 = &v38;
  uint64_t v40 = 0x3032000000;
  v41 = __Block_byref_object_copy__32;
  v42 = __Block_byref_object_dispose__32;
  id v43 = 0;
  dispatch_semaphore_t v5 = dispatch_semaphore_create(0);
  int v6 = 0;
  uint64_t v7 = MEMORY[0x263EF8330];
  while (1)
  {
    id v8 = (void *)MEMORY[0x263F055B8];
    extensionID = self->_extensionID;
    v33[0] = v7;
    v33[1] = 3221225472;
    v33[2] = __44__BRCMiniCiconia__cleanupOldCiconiaDomains___block_invoke;
    v33[3] = &unk_2650841D8;
    int v37 = v6;
    id v35 = &v44;
    v36 = &v38;
    dispatch_semaphore_t dsema = v5;
    dispatch_semaphore_t v34 = dsema;
    [v8 getDomainsForProviderIdentifier:extensionID completionHandler:v33];
    dispatch_semaphore_wait(dsema, 0xFFFFFFFFFFFFFFFFLL);
    id v10 = v45[5];
    if (!v10 || (objc_msgSend(v10, "br_isNSXPCConnectionError") & 1) == 0) {
      break;
    }
    sleep(1u);

    if (++v6 == 3) {
      goto LABEL_9;
    }
  }

LABEL_9:
  long long v31 = 0u;
  long long v32 = 0u;
  long long v29 = 0u;
  long long v30 = 0u;
  id v11 = (id)v39[5];
  uint64_t v12 = [v11 countByEnumeratingWithState:&v29 objects:v56 count:16];
  if (v12)
  {
    uint64_t v13 = *(void *)v30;
    do
    {
      for (uint64_t i = 0; i != v12; ++i)
      {
        if (*(void *)v30 != v13) {
          objc_enumerationMutation(v11);
        }
        __int16 v15 = *(void **)(*((void *)&v29 + 1) + 8 * i);
        if (objc_msgSend(v15, "br_isCiconiaDomain"))
        {
          v16 = brc_bread_crumbs();
          __int16 v17 = brc_default_log();
          if (os_log_type_enabled(v17, OS_LOG_TYPE_DEBUG))
          {
            *(_DWORD *)buf = 138412546;
            v51 = v15;
            __int16 v52 = 2112;
            v53 = v16;
            _os_log_debug_impl(&dword_23FA42000, v17, OS_LOG_TYPE_DEBUG, "[DEBUG] Found old domain %@, dropping%@", buf, 0x16u);
          }

          id v28 = 0;
          [(BRCMiniCiconia *)self _removeFPDomain:v15 error:&v28];
          id v18 = v28;
          id v19 = v28;
          if (v19 && !v45[5])
          {
            v20 = brc_bread_crumbs();
            v21 = brc_default_log();
            if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
            {
              BOOL v22 = objc_msgSend(v19, "fp_prettyDescription");
              *(_DWORD *)buf = 138412802;
              v51 = v15;
              __int16 v52 = 2112;
              v53 = v22;
              __int16 v54 = 2112;
              v55 = v20;
              _os_log_impl(&dword_23FA42000, v21, OS_LOG_TYPE_DEFAULT, "[WARNING] Failed to remove old domain %@: %@%@", buf, 0x20u);
            }
            objc_storeStrong(v45 + 5, v18);
          }
        }
      }
      uint64_t v12 = [v11 countByEnumeratingWithState:&v29 objects:v56 count:16];
    }
    while (v12);
  }

  id v23 = v45[5];
  if (a3 && v23) {
    *a3 = v23;
  }

  _Block_object_dispose(&v38, 8);
  _Block_object_dispose(&v44, 8);

  return v23 == 0;
}

void __44__BRCMiniCiconia__cleanupOldCiconiaDomains___block_invoke(uint64_t a1, void *a2, void *a3)
{
  uint64_t v19 = *MEMORY[0x263EF8340];
  id v5 = a2;
  id v6 = a3;
  if (v6)
  {
    uint64_t v7 = brc_bread_crumbs();
    id v8 = brc_default_log();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      int v9 = *(_DWORD *)(a1 + 56);
      id v10 = objc_msgSend(v6, "fp_prettyDescription");
      v14[0] = 67109634;
      v14[1] = v9;
      __int16 v15 = 2112;
      v16 = v10;
      __int16 v17 = 2112;
      id v18 = v7;
      _os_log_impl(&dword_23FA42000, v8, OS_LOG_TYPE_DEFAULT, "[WARNING] %d: enumerating domains failed: %@%@", (uint8_t *)v14, 0x1Cu);
    }
    objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40), a3);
  }
  uint64_t v11 = *(void *)(*(void *)(a1 + 48) + 8);
  uint64_t v12 = *(void **)(v11 + 40);
  *(void *)(v11 + 40) = v5;
  id v13 = v5;

  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));
}

- (BOOL)_removeDiagnosticsDirectoryAtURL:(id)a3 withError:(id *)a4
{
  id v5 = [a3 path];
  int v6 = BRCRecursiveRemove(v5);

  if (a4 && v6 < 0)
  {
    objc_msgSend(MEMORY[0x263F087E8], "br_errorWithPOSIXCode:", *__error());
    *a4 = (id)objc_claimAutoreleasedReturnValue();
  }
  return v6 >= 0;
}

- (BOOL)_fsRemoveWorkDirectory:(id *)a3
{
  int v5 = 5;
  while (1)
  {
    int v6 = [(NSURL *)self->_targetURL path];
    int v7 = BRCRemoveFolder(v6, 0, 0, 1);

    if ((v7 & 0x80000000) == 0) {
      break;
    }
    uint64_t v8 = *__error();
    if (*__error() != 2)
    {
      sleep(1u);
      if (--v5) {
        continue;
      }
    }
    if (a3)
    {
      objc_msgSend(MEMORY[0x263F087E8], "br_errorWithPOSIXCode:", v8);
      *a3 = (id)objc_claimAutoreleasedReturnValue();
    }
    return v7 >= 0;
  }
  return v7 >= 0;
}

- (BOOL)_removeWorkDirectory:(id *)a3
{
  int v5 = brc_bread_crumbs();
  int v6 = brc_default_log();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG)) {
    -[BRCMiniCiconia _removeWorkDirectory:].cold.5();
  }

  if (self->_isDataSeparated)
  {
    uint64_t v27 = 1;
    uint64_t v7 = container_create_or_lookup_path_for_current_user();
    if (v7)
    {
      uint64_t v8 = (void *)v7;
      int v9 = NSURL;
      id v10 = [NSString stringWithUTF8String:v7];
      uint64_t v11 = [v9 fileURLWithPath:v10 isDirectory:1];
      uint64_t v12 = [v11 URLByAppendingPathComponent:@"Library/CloudStorage/"];

      free(v8);
      id v13 = [v12 URLByAppendingPathComponent:@"iCloudDrive𝛃-Ciconia"];
      uint64_t v14 = brc_bread_crumbs();
      __int16 v15 = brc_default_log();
      if (os_log_type_enabled(v15, OS_LOG_TYPE_DEBUG)) {
        [(BRCMiniCiconia *)v13 _removeWorkDirectory:v15];
      }

      v16 = [v13 path];
      int v17 = BRCRemoveFolder(v16, 0, 0, 1);

      if (v17 < 0)
      {
        int v18 = *__error();
        uint64_t v19 = brc_bread_crumbs();
        v20 = brc_default_log();
        if (os_log_type_enabled(v20, (os_log_type_t)0x90u)) {
          [(BRCMiniCiconia *)(uint64_t)v19 _removeWorkDirectory:v20];
        }

        *__error() = v18;
      }
    }
    else
    {
      uint64_t v12 = brc_bread_crumbs();
      id v13 = brc_default_log();
      if (os_log_type_enabled(v13, (os_log_type_t)0x90u)) {
        [(BRCMiniCiconia *)&v27 _removeWorkDirectory:v13];
      }
    }
  }
  if ([(BRCMiniCiconia *)self _fsRemoveWorkDirectory:a3]) {
    return 1;
  }
  if (objc_msgSend(*a3, "br_isPOSIXErrorCode:", 2)) {
    return 0;
  }
  BOOL v22 = brc_bread_crumbs();
  id v23 = brc_default_log();
  if (os_log_type_enabled(v23, OS_LOG_TYPE_DEBUG)) {
    -[BRCMiniCiconia _removeWorkDirectory:]();
  }

  v24 = [(NSURL *)self->_targetURL URLByAppendingPathComponent:@"files"];
  fpfs_enable_fault_handling();
  id v25 = [v24 path];
  MEMORY[0x2455D9540]([v25 fileSystemRepresentation], 0);

  BOOL v21 = [(BRCMiniCiconia *)self _fsRemoveWorkDirectory:a3];
  return v21;
}

- (void)cleanupCiconiaAtURL:(id)a3 diagnosticsURL:(id)a4 completionHandler:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  objc_initWeak(&location, self);
  workQueue = self->_workQueue;
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __71__BRCMiniCiconia_cleanupCiconiaAtURL_diagnosticsURL_completionHandler___block_invoke;
  block[3] = &unk_265084200;
  objc_copyWeak(&v19, &location);
  id v17 = v9;
  id v18 = v10;
  id v16 = v8;
  id v12 = v9;
  id v13 = v8;
  id v14 = v10;
  dispatch_async(workQueue, block);

  objc_destroyWeak(&v19);
  objc_destroyWeak(&location);
}

void __71__BRCMiniCiconia_cleanupCiconiaAtURL_diagnosticsURL_completionHandler___block_invoke(uint64_t a1)
{
  WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 56));
  id v3 = WeakRetained;
  if (WeakRetained)
  {
    objc_storeStrong(WeakRetained + 2, *(id *)(a1 + 32));
    [v3 _setupExtensionID];
    id v7 = 0;
    [v3 _cleanupOldCiconiaDomains:&v7];
    id v4 = v7;
    id v6 = v4;
    [v3 _removeWorkDirectory:&v6];
    id v5 = v6;

    [v3 _removeDiagnosticsDirectoryAtURL:*(void *)(a1 + 40) withError:0];
    (*(void (**)(void))(*(void *)(a1 + 48) + 16))();
  }
  else
  {
    (*(void (**)(void))(*(void *)(a1 + 48) + 16))();
  }
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_extensionID, 0);
  objc_storeStrong((id *)&self->_targetURL, 0);
  objc_storeStrong((id *)&self->_workQueue, 0);
}

- (void)_cleanupOldCiconiaDomains:.cold.1()
{
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_4_0(&dword_23FA42000, v0, v1, "[DEBUG] Looking for old Ciconia domains%@", v2, v3, v4, v5, v6);
}

- (void)_removeWorkDirectory:.cold.1()
{
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_4_0(&dword_23FA42000, v0, v1, "[DEBUG] Retry removing work directory%@", v2, v3, v4, v5, v6);
}

- (void)_removeWorkDirectory:(os_log_t)log .cold.2(uint64_t *a1, uint64_t a2, os_log_t log)
{
  uint64_t v8 = *MEMORY[0x263EF8340];
  uint64_t v3 = *a1;
  int v4 = 134218242;
  uint64_t v5 = v3;
  __int16 v6 = 2112;
  uint64_t v7 = a2;
  _os_log_error_impl(&dword_23FA42000, log, (os_log_type_t)0x90u, "[ERROR] Error: %lld%@", (uint8_t *)&v4, 0x16u);
}

- (void)_removeWorkDirectory:(os_log_t)log .cold.3(uint64_t a1, int a2, os_log_t log)
{
  uint64_t v6 = *MEMORY[0x263EF8340];
  v3[0] = 67109378;
  v3[1] = a2;
  __int16 v4 = 2112;
  uint64_t v5 = a1;
  _os_log_error_impl(&dword_23FA42000, log, (os_log_type_t)0x90u, "[ERROR] Failed removing domain %{errno}d%@", (uint8_t *)v3, 0x12u);
}

- (void)_removeWorkDirectory:(NSObject *)a3 .cold.4(void *a1, uint64_t a2, NSObject *a3)
{
  uint64_t v10 = *MEMORY[0x263EF8340];
  uint64_t v5 = [a1 path];
  uint64_t v6 = objc_msgSend(v5, "fp_prettyPath");
  OUTLINED_FUNCTION_3();
  __int16 v8 = 2112;
  uint64_t v9 = a2;
  _os_log_debug_impl(&dword_23FA42000, a3, OS_LOG_TYPE_DEBUG, "[DEBUG] Removing FP domain on disk: %@%@", v7, 0x16u);
}

- (void)_removeWorkDirectory:.cold.5()
{
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_4_0(&dword_23FA42000, v0, v1, "[DEBUG] Removing work directory%@", v2, v3, v4, v5, v6);
}

@end