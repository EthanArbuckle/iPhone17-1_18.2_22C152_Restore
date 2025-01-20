@interface MAsendPMVDownload
@end

@implementation MAsendPMVDownload

void ___MAsendPMVDownload_block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  uint64_t v4 = MEMORY[0x1B3EAB1B0]();
  int64_t int64 = xpc_dictionary_get_int64(v3, "Result");
  if (v4 == MEMORY[0x1E4F145A8])
  {
    _MobileAssetLog(0, 6, (uint64_t)"_MAsendPMVDownload_block_invoke", @"PMV download failed due to XPC", v6, v7, v8, v9, v26);
    unint64_t v10 = 1;
  }
  else
  {
    unint64_t v10 = int64;
    if (int64 == 13)
    {
      if (*(unsigned char *)(a1 + 48))
      {
        _MobileAssetLog(0, 6, (uint64_t)"_MAsendPMVDownload_block_invoke", @"Will retry download PMV, after %ld seconds", v6, v7, v8, v9, 2);
        dispatch_time_t v11 = dispatch_time(0, 2000000000);
        v12 = getRetryXpcDelayQueue();
        block[0] = MEMORY[0x1E4F143A8];
        block[1] = 3221225472;
        block[2] = ___MAsendPMVDownload_block_invoke_2;
        block[3] = &unk_1E6004240;
        id v28 = *(id *)(a1 + 32);
        id v29 = *(id *)(a1 + 40);
        dispatch_after(v11, v12, block);

        v13 = 0;
LABEL_16:
        v22 = 0;
        goto LABEL_17;
      }
      unint64_t v10 = 13;
    }
  }
  if (!MAIsDownloadResultFailure(v10))
  {
    uint64_t v24 = getLoadDictionaryFromMessage(v3, @"productMarketingVersions");
    if (v24) {
      v13 = (void *)v24;
    }
    else {
      v13 = (void *)MEMORY[0x1E4F1CC08];
    }
    uint64_t v25 = *(void *)(a1 + 40);
    if (v25) {
      (*(void (**)(uint64_t, unint64_t, void *, void))(v25 + 16))(v25, v10, v13, 0);
    }
    goto LABEL_16;
  }
  uint64_t v14 = objc_opt_class();
  v15 = getLoadClassFromMessage(v3, @"CFNetworkError", v14);
  v16 = errorStringForMADownloadResult(v10);
  v22 = MAErrorForDownloadResultWithUnderlying(v10, v15, @"Failed downloading SoftwareLookup: %@", v17, v18, v19, v20, v21, (uint64_t)v16);

  uint64_t v23 = *(void *)(a1 + 40);
  if (v23) {
    (*(void (**)(uint64_t, unint64_t, void, void *))(v23 + 16))(v23, v10, 0, v22);
  }

  v13 = 0;
LABEL_17:
}

void ___MAsendPMVDownload_block_invoke_2(uint64_t a1)
{
  v2[0] = MEMORY[0x1E4F143A8];
  v2[1] = 3221225472;
  v2[2] = ___MAsendPMVDownload_block_invoke_3;
  v2[3] = &unk_1E6004330;
  uint64_t v1 = *(void *)(a1 + 32);
  id v3 = *(id *)(a1 + 40);
  _MAsendPMVDownload(v1, 0, v2);
}

uint64_t ___MAsendPMVDownload_block_invoke_3(uint64_t a1)
{
  uint64_t result = *(void *)(a1 + 32);
  if (result) {
    return (*(uint64_t (**)(void))(result + 16))();
  }
  return result;
}

@end