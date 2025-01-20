@interface MAsendPMVCancelDownload
@end

@implementation MAsendPMVCancelDownload

void ___MAsendPMVCancelDownload_block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  uint64_t v4 = MEMORY[0x1B3EAB1B0]();
  *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = 4;
  if (v4 == MEMORY[0x1E4F145A8])
  {
    *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = 1;
    _MobileAssetLog(0, 6, (uint64_t)"_MAsendPMVCancelDownload_block_invoke", @"Error on the cancel PMV download reply", v5, v6, v7, v8, v16);
  }
  else
  {
    *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = xpc_dictionary_get_int64(v3, "Result");
    unint64_t v9 = *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 24);
    v17 = stringForMACancelDownloadResult(v9);
    _MobileAssetLog(0, 6, (uint64_t)"_MAsendPMVCancelDownload_block_invoke", @"Got the cancel PMV reply, response: %ld (%@)", v10, v11, v12, v13, v9);
  }
  if (*(void *)(a1 + 32))
  {
    v14 = _getClientCallbackQueue();
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = ___MAsendPMVCancelDownload_block_invoke_2;
    block[3] = &unk_1E6004380;
    long long v18 = *(_OWORD *)(a1 + 32);
    id v15 = (id)v18;
    long long v20 = v18;
    dispatch_async(v14, block);
  }
}

void ___MAsendPMVCancelDownload_block_invoke_2(uint64_t a1)
{
  if (isCancelDownloadResultFailure(*(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 24)))
  {
    unint64_t v2 = *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 24);
    id v3 = errorStringForMACancelDownloadResult(v2);
    MAErrorForCancelDownloadResultWithUnderlying(v2, 0, @"During software lookup: %@", v4, v5, v6, v7, v8, (uint64_t)v3);
    id v9 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    id v9 = 0;
  }
  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
}

void ___MAsendPMVCancelDownload_block_invoke_3(uint64_t a1)
{
  unint64_t v2 = *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 24);
  if (isCancelDownloadResultFailure(v2))
  {
    id v3 = errorStringForMACancelDownloadResult(*(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 24));
    MAErrorForCancelDownloadResultWithUnderlying(v2, 0, @"Before software lookup: %@", v4, v5, v6, v7, v8, (uint64_t)v3);
    id v9 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    id v9 = 0;
  }
  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
}

@end