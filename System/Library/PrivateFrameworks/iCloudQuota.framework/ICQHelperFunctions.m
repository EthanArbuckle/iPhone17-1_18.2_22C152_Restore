@interface ICQHelperFunctions
@end

@implementation ICQHelperFunctions

void __58___ICQHelperFunctions_getPhotosLibrarySizeWithCompletion___block_invoke(uint64_t a1, void *a2)
{
  v3 = NSString;
  id v4 = a2;
  objc_msgSend(v3, "stringWithFormat:", @"%lu", 1);
  id v6 = (id)objc_claimAutoreleasedReturnValue();
  v5 = [v4 objectForKeyedSubscript:v6];

  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
}

void __59___ICQHelperFunctions_getOriginalPhotosSizeWithCompletion___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  uint64_t v4 = *(void *)(a1 + 32);
  v5 = NSNumber;
  id v6 = a3;
  id v7 = [v5 numberWithLongLong:a2];
  (*(void (**)(uint64_t, id, id))(v4 + 16))(v4, v7, v6);
}

void __78___ICQHelperFunctions_remoteBackupSizeForAccount_timeoutInSeconds_completion___block_invoke(uint64_t a1)
{
  id v2 = objc_alloc(MEMORY[0x1E4F78010]);
  v3 = [*(id *)(a1 + 32) personaIdentifier];
  id v8 = (id)[v2 initWithDelegate:0 eventQueue:0 personaIdentifier:v3];

  uint64_t v4 = [*(id *)(a1 + 56) _fetchNextBackupSize:v8];
  v5 = *(void **)(*(void *)(*(void *)(a1 + 48) + 8) + 40);
  if (v5 && ([v5 isCancelled] & 1) == 0) {
    (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
  }
  uint64_t v6 = *(void *)(*(void *)(a1 + 48) + 8);
  id v7 = *(void **)(v6 + 40);
  *(void *)(v6 + 40) = 0;
}

void __78___ICQHelperFunctions_remoteBackupSizeForAccount_timeoutInSeconds_completion___block_invoke_2(uint64_t a1)
{
  if (([*(id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40) isFinished] & 1) == 0)
  {
    [*(id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40) cancel];
    id v2 = _ICQGetLogSystem();
    if (os_log_type_enabled(v2, OS_LOG_TYPE_ERROR)) {
      __78___ICQHelperFunctions_remoteBackupSizeForAccount_timeoutInSeconds_completion___block_invoke_2_cold_1(v2);
    }

    (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
    uint64_t v3 = *(void *)(*(void *)(a1 + 40) + 8);
    uint64_t v4 = *(void **)(v3 + 40);
    *(void *)(v3 + 40) = 0;
  }
}

uint64_t __44___ICQHelperFunctions__fetchNextBackupSize___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v4 = a3;
  unint64_t v5 = [a2 snapshotID];
  unint64_t v6 = [v4 snapshotID];

  if (v5 < v6) {
    return -1;
  }
  else {
    return 1;
  }
}

uint64_t __54___ICQHelperFunctions__remoteBackupSizeOperationQueue__block_invoke()
{
  id v0 = objc_alloc_init(MEMORY[0x1E4F28F08]);
  v1 = (void *)_remoteBackupSizeOperationQueue_operationQueue;
  _remoteBackupSizeOperationQueue_operationQueue = (uint64_t)v0;

  id v2 = (void *)_remoteBackupSizeOperationQueue_operationQueue;
  return [v2 setMaxConcurrentOperationCount:1];
}

void __78___ICQHelperFunctions_remoteBackupSizeForAccount_timeoutInSeconds_completion___block_invoke_2_cold_1(os_log_t log)
{
  *(_WORD *)v1 = 0;
  _os_log_error_impl(&dword_1D5851000, log, OS_LOG_TYPE_ERROR, "MBManager took too long to respond. Returning nil for remote backup.", v1, 2u);
}

@end