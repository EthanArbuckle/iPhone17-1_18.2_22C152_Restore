@interface NSFileProviderManager
@end

@implementation NSFileProviderManager

uint64_t __78__NSFileProviderManager_BRCAdditions__br_removeDomain_sync_completionHandler___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

void __90__NSFileProviderManager_BRCAdditions___br_removeDomain_options_retries_completionHandler___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  if ((objc_msgSend(v6, "br_isNSXPCConnectionError") & 1) != 0
    && (unint64_t v7 = *(void *)(a1 + 64),
        +[BRCUserDefaults defaultsForMangledID:0],
        v8 = objc_claimAutoreleasedReturnValue(),
        unint64_t v9 = [v8 xpcConnectionFailureRetries],
        v8,
        v7 < v9))
  {
    id WeakRetained = objc_loadWeakRetained((id *)(a1 + 56));
    v11 = WeakRetained;
    if (WeakRetained)
    {
      uint64_t v12 = *(void *)(a1 + 32);
      if (v12)
      {
        v13 = (void *)MEMORY[0x263F325F8];
        v14[0] = MEMORY[0x263EF8330];
        v14[1] = 3221225472;
        v14[2] = __90__NSFileProviderManager_BRCAdditions___br_removeDomain_options_retries_completionHandler___block_invoke_2;
        v14[3] = &unk_2650857F8;
        id v16 = *(id *)(a1 + 48);
        v14[4] = v11;
        id v15 = *(id *)(a1 + 40);
        int8x16_t v17 = vextq_s8(*(int8x16_t *)(a1 + 64), *(int8x16_t *)(a1 + 64), 8uLL);
        [v13 performWithPersonaID:v12 block:v14];
      }
      else
      {
        objc_msgSend(WeakRetained, "_br_removeDomain:options:retries:completionHandler:", *(void *)(a1 + 40), *(void *)(a1 + 72), *(void *)(a1 + 64) + 1, *(void *)(a1 + 48));
      }
    }
  }
  else
  {
    (*(void (**)(void))(*(void *)(a1 + 48) + 16))();
  }
}

void __90__NSFileProviderManager_BRCAdditions___br_removeDomain_options_retries_completionHandler___block_invoke_2(uint64_t a1, void *a2)
{
  id v3 = a2;
  if (v3)
  {
    v4 = brc_bread_crumbs();
    id v5 = brc_default_log();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_FAULT)) {
      __90__NSFileProviderManager_BRCAdditions___br_removeDomain_options_retries_completionHandler___block_invoke_2_cold_1((uint64_t)v4, v5);
    }

    (*(void (**)(void))(*(void *)(a1 + 48) + 16))();
  }
  else
  {
    objc_msgSend(*(id *)(a1 + 32), "_br_removeDomain:options:retries:completionHandler:", *(void *)(a1 + 40), *(void *)(a1 + 56), *(void *)(a1 + 64) + 1, *(void *)(a1 + 48));
  }
}

uint64_t __86__NSFileProviderManager_BRCAdditions__br_removeDomain_options_sync_completionHandler___block_invoke(void *a1, uint64_t a2)
{
  id v3 = (void *)a1[4];
  uint64_t v2 = a1[5];
  uint64_t v4 = a1[7];
  uint64_t v5 = *(void *)(a1[6] + 8);
  id obj = *(id *)(v5 + 40);
  uint64_t v6 = [v3 removeDomain:v2 options:v4 preservedLocation:&obj error:a2];
  objc_storeStrong((id *)(v5 + 40), obj);
  return v6;
}

void __86__NSFileProviderManager_BRCAdditions__br_removeDomain_options_sync_completionHandler___block_invoke_6(void *a1, void *a2, void *a3)
{
  uint64_t v17 = *MEMORY[0x263EF8340];
  id v6 = a3;
  objc_storeStrong((id *)(*(void *)(a1[6] + 8) + 40), a3);
  id v7 = a2;
  if (v6)
  {
    v8 = brc_bread_crumbs();
    unint64_t v9 = brc_default_log();
    if (os_log_type_enabled(v9, (os_log_type_t)0x90u))
    {
      uint64_t v10 = a1[4];
      int v11 = 138412802;
      uint64_t v12 = v10;
      __int16 v13 = 2112;
      id v14 = v6;
      __int16 v15 = 2112;
      id v16 = v8;
      _os_log_error_impl(&dword_23FA42000, v9, (os_log_type_t)0x90u, "[ERROR] couldn't remove domain %@: %@%@", (uint8_t *)&v11, 0x20u);
    }
  }
  else
  {
    v8 = brc_bread_crumbs();
    unint64_t v9 = brc_default_log();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG)) {
      __86__NSFileProviderManager_BRCAdditions__br_removeDomain_options_sync_completionHandler___block_invoke_6_cold_1((uint64_t)a1, (uint64_t)v8, v9);
    }
  }

  (*(void (**)(void))(a1[5] + 16))();
}

uint64_t __102__NSFileProviderManager_BRCAdditions__br_importDomain_forProviderIdentifier_fromDirectoryAtURL_error___block_invoke(void *a1, uint64_t a2)
{
  return [MEMORY[0x263F055B8] importDomain:a1[4] forProviderIdentifier:a1[5] fromDirectoryAtURL:a1[6] error:a2];
}

uint64_t __115__NSFileProviderManager_BRCAdditions__br_importDomain_forProviderIdentifier_fromDirectoryAtURL_knownFolders_error___block_invoke(void *a1, uint64_t a2)
{
  return [MEMORY[0x263F055B8] importDomain:a1[4] forProviderIdentifier:a1[5] fromDirectoryAtURL:a1[6] knownFolders:a1[7] error:a2];
}

uint64_t __80__NSFileProviderManager_BRCAdditions__br_addDomain_forProviderIdentifier_error___block_invoke(uint64_t a1, uint64_t a2)
{
  return [MEMORY[0x263F055B8] addDomain:*(void *)(a1 + 32) forProviderIdentifier:*(void *)(a1 + 40) error:a2];
}

uint64_t __70__NSFileProviderManager_BRCAdditions__br_addDomain_completionHandler___block_invoke(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 32) addDomain:*(void *)(a1 + 40) completionHandler:a2];
}

uint64_t __103__NSFileProviderManager_BRCAdditions__br_signalEnumeratorForContainerItemIdentifier_completionHandler___block_invoke(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 32) signalEnumeratorForContainerItemIdentifier:*(void *)(a1 + 40) completionHandler:a2];
}

void __90__NSFileProviderManager_BRCAdditions___br_removeDomain_options_retries_completionHandler___block_invoke_2_cold_1(uint64_t a1, NSObject *a2)
{
  uint64_t v4 = *MEMORY[0x263EF8340];
  int v2 = 138412290;
  uint64_t v3 = a1;
  _os_log_fault_impl(&dword_23FA42000, a2, OS_LOG_TYPE_FAULT, "[CRIT] UNREACHABLE: Failed to adopt persona for _br_removeDomain retry%@", (uint8_t *)&v2, 0xCu);
}

void __86__NSFileProviderManager_BRCAdditions__br_removeDomain_options_sync_completionHandler___block_invoke_6_cold_1(uint64_t a1, uint64_t a2, NSObject *a3)
{
  *(_DWORD *)uint64_t v3 = 138412546;
  *(void *)&v3[4] = *(void *)(a1 + 32);
  *(_WORD *)&v3[12] = 2112;
  *(void *)&v3[14] = a2;
  OUTLINED_FUNCTION_1(&dword_23FA42000, a2, a3, "[DEBUG] Successfully removed domain %@%@", *(void *)v3, *(void *)&v3[8], *(void *)&v3[16], *MEMORY[0x263EF8340]);
}

@end