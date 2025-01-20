@interface WBSBrowsingDataImportScanner
@end

@implementation WBSBrowsingDataImportScanner

void __84___WBSBrowsingDataImportScanner_scanImportURLs_sandboxExtensions_completionHandler___block_invoke(uint64_t a1)
{
  if (![*(id *)(*(void *)(a1 + 32) + 24) count])
  {
    v2 = [MEMORY[0x1E4F28CB8] defaultManager];
    [v2 removeItemAtURL:*(void *)(*(void *)(a1 + 32) + 40) error:0];
  }
  uint64_t v3 = *(void *)(a1 + 40);
  id v4 = (id)[*(id *)(*(void *)(a1 + 32) + 24) copy];
  (*(void (**)(uint64_t, id, void))(v3 + 16))(v3, v4, 0);
}

void __71___WBSBrowsingDataImportScanner__scanImportedURL_isInUnarchivedFolder___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __71___WBSBrowsingDataImportScanner__scanImportedURL_isInUnarchivedFolder___block_invoke_2;
  block[3] = &unk_1E615B188;
  uint64_t v7 = *(void *)(a1 + 32);
  id v11 = v5;
  uint64_t v12 = v7;
  id v13 = v6;
  id v8 = v6;
  id v9 = v5;
  dispatch_async(MEMORY[0x1E4F14428], block);
}

void __71___WBSBrowsingDataImportScanner__scanImportedURL_isInUnarchivedFolder___block_invoke_2(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 32);
  if (v2)
  {
    [*(id *)(a1 + 40) _scanImportedURL:v2 isInUnarchivedFolder:1];
  }
  else
  {
    uint64_t v3 = WBS_LOG_CHANNEL_PREFIXImport();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR)) {
      __71___WBSBrowsingDataImportScanner__scanImportedURL_isInUnarchivedFolder___block_invoke_2_cold_1(a1, v3);
    }
  }
  dispatch_group_leave(*(dispatch_group_t *)(*(void *)(a1 + 40) + 8));
}

void __71___WBSBrowsingDataImportScanner__scanImportedURL_isInUnarchivedFolder___block_invoke_73(uint64_t a1, void *a2)
{
  id v3 = a2;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __71___WBSBrowsingDataImportScanner__scanImportedURL_isInUnarchivedFolder___block_invoke_2_74;
  block[3] = &unk_1E615B188;
  uint64_t v4 = *(void *)(a1 + 32);
  id v5 = *(void **)(a1 + 40);
  id v8 = v3;
  uint64_t v9 = v4;
  id v10 = v5;
  id v6 = v3;
  dispatch_async(MEMORY[0x1E4F14428], block);
}

void __71___WBSBrowsingDataImportScanner__scanImportedURL_isInUnarchivedFolder___block_invoke_2_74(void *a1)
{
  if (a1[4])
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1[5] + 32));
    [*(id *)(a1[5] + 24) setObject:a1[4] forKeyedSubscript:a1[6]];
    os_unfair_lock_unlock((os_unfair_lock_t)(a1[5] + 32));
  }
  uint64_t v2 = *(NSObject **)(a1[5] + 8);
  dispatch_group_leave(v2);
}

void __51___WBSBrowsingDataImportScanner__isArchiveFileURL___block_invoke()
{
  uint64_t v0 = [MEMORY[0x1E4F1CAD0] setWithArray:&unk_1F1086D80];
  v1 = (void *)_isArchiveFileURL__archiveExtensions;
  _isArchiveFileURL__archiveExtensions = v0;
}

void __91___WBSBrowsingDataImportScanner__processFileForURL_isInUnarchivedFolder_completionHandler___block_invoke(uint64_t a1, void *a2)
{
  id v5 = a2;
  if (*(unsigned char *)(a1 + 48))
  {
    [v5 setObject:*(void *)(*(void *)(a1 + 32) + 40) forKeyedSubscript:@"temporary_unzipped_directory_url"];
    [v5 setObject:*(void *)(*(void *)(a1 + 32) + 56) forKeyedSubscript:@"temporary_unzipped_directory_sandbox_extension"];
  }
  uint64_t v3 = *(void *)(a1 + 40);
  uint64_t v4 = (void *)[v5 copy];
  (*(void (**)(uint64_t, void *))(v3 + 16))(v3, v4);
}

void __91___WBSBrowsingDataImportScanner__processFileForURL_isInUnarchivedFolder_completionHandler___block_invoke_2(uint64_t a1)
{
  uint64_t v2 = *(void **)(a1 + 32);
  uint64_t v3 = *(void *)(a1 + 40);
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __91___WBSBrowsingDataImportScanner__processFileForURL_isInUnarchivedFolder_completionHandler___block_invoke_3;
  v4[3] = &unk_1E615DC78;
  id v5 = *(id *)(a1 + 48);
  id v6 = *(id *)(a1 + 56);
  [v2 fetchLooksLikePasswordsCSVFile:v3 completionHandler:v4];
}

uint64_t __91___WBSBrowsingDataImportScanner__processFileForURL_isInUnarchivedFolder_completionHandler___block_invoke_3(uint64_t a1, int a2)
{
  if (a2) {
    [*(id *)(a1 + 32) setObject:@"passwords" forKeyedSubscript:@"data_type"];
  }
  uint64_t v3 = *(uint64_t (**)(void))(*(void *)(a1 + 40) + 16);
  return v3();
}

void __71___WBSBrowsingDataImportScanner__scanImportedURL_isInUnarchivedFolder___block_invoke_2_cold_1(uint64_t a1, void *a2)
{
  id v3 = a2;
  uint64_t v4 = objc_msgSend((id)OUTLINED_FUNCTION_2(), "safari_privacyPreservingDescription");
  OUTLINED_FUNCTION_0_0();
  OUTLINED_FUNCTION_0_3(&dword_1B728F000, v5, v6, "Unable to unarchive imported archive error with: %{public}@", v7, v8, v9, v10, v11);
}

@end