@interface MAsendDownloadAsset
@end

@implementation MAsendDownloadAsset

void ___MAsendDownloadAsset_block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  v4 = v3;
  if (v3
    && MEMORY[0x1B3EAB1B0](v3) == MEMORY[0x1E4F14590]
    && xpc_dictionary_get_int64(v4, "Result") == 13
    && *(unsigned char *)(a1 + 112)
    && (dispatch_time_t v5 = dispatch_time(*(void *)(a1 + 96), 180000000000), v5 > dispatch_time(0, 0)))
  {
    _MobileAssetLog(0, 6, (uint64_t)"_MAsendDownloadAsset_block_invoke", @"Daemon not ready - retrying download in %d seconds [%@, %@]", v6, v7, v8, v9, 5);
    dispatch_time_t v10 = dispatch_time(0, 5000000000);
    v11 = getRetryXpcDelayQueue();
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = ___MAsendDownloadAsset_block_invoke_2;
    block[3] = &unk_1E60042E0;
    id v19 = *(id *)(a1 + 48);
    id v20 = *(id *)(a1 + 32);
    id v21 = *(id *)(a1 + 40);
    id v12 = *(id *)(a1 + 56);
    uint64_t v13 = *(void *)(a1 + 104);
    id v22 = v12;
    uint64_t v26 = v13;
    id v23 = *(id *)(a1 + 64);
    id v14 = *(id *)(a1 + 72);
    uint64_t v15 = *(void *)(a1 + 88);
    id v24 = v14;
    uint64_t v25 = v15;
    dispatch_after(v10, v11, block);
  }
  else
  {
    uint64_t v16 = *(void *)(*(void *)(a1 + 88) + 8);
    v17 = *(void **)(v16 + 40);
    *(void *)(v16 + 40) = 0;

    (*(void (**)(void))(*(void *)(a1 + 80) + 16))();
  }
}

void ___MAsendDownloadAsset_block_invoke_2(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  uint64_t v9 = *(void **)(a1 + 32);
  if (v9 && [v9 count])
  {
    uint64_t v10 = [*(id *)(a1 + 32) count];
    _MobileAssetLog(0, 6, (uint64_t)"_MAsendDownloadAsset_block_invoke_2", @"Re-registering %lu progress callbacks", v11, v12, v13, v14, v10);
    id v23 = _getCommsManager(v15, v16, v17, v18, v19, v20, v21, v22);
    [v23 restoreProgressCallbacks:*(void *)(a1 + 32) assetType:*(void *)(a1 + 40) assetId:*(void *)(a1 + 48) withPurpose:*(void *)(a1 + 56)];
  }
  _MobileAssetLog(0, 6, (uint64_t)"_MAsendDownloadAsset_block_invoke_2", @"Retrying download [%@, %@]", a5, a6, a7, a8, *(void *)(a1 + 40));
  id v24 = *(void **)(a1 + 64);
  uint64_t v25 = *(void **)(a1 + 72);
  int64_t v26 = *(void *)(a1 + 88);
  v27 = *(void **)(*(void *)(*(void *)(a1 + 80) + 8) + 40);
  sendIfNecessary(v26, v24, v25, v27);
}

@end