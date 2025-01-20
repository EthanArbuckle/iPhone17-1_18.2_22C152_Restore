@interface NTKVideoAssetScrubbingOperation
- (BOOL)scrubAssetAtURL:(id)a3 toDestinationURL:(id)a4 error:(id *)a5;
- (id)supportedExtensions;
@end

@implementation NTKVideoAssetScrubbingOperation

- (id)supportedExtensions
{
  return &unk_1F16EA648;
}

- (BOOL)scrubAssetAtURL:(id)a3 toDestinationURL:(id)a4 error:(id *)a5
{
  uint64_t v32 = *MEMORY[0x1E4F143B8];
  id v7 = a3;
  v8 = (void *)MEMORY[0x1E4F166C8];
  v9 = a4;
  v10 = [v8 URLAssetWithURL:v7 options:0];
  v11 = (void *)MEMORY[0x1E4F16558];
  v12 = [v10 metadata];
  v13 = [v11 metadataItemsFromArray:v12 filteredByIdentifier:*MEMORY[0x1E4F15C60]];

  uint64_t v14 = [v13 count];
  v15 = _NTKLoggingObjectForDomain(6, (uint64_t)"NTKLoggingDomainPhoto");
  BOOL v16 = os_log_type_enabled(v15, OS_LOG_TYPE_INFO);
  if (v14)
  {
    if (v16)
    {
      *(_DWORD *)buf = 138412290;
      id v31 = v7;
      _os_log_impl(&dword_1BC5A9000, v15, OS_LOG_TYPE_INFO, "[Resource Scrubber]: Found location data in asset: '%@'. Will scrub.", buf, 0xCu);
    }

    v17 = [MEMORY[0x1E4F16360] exportSessionWithAsset:v10 presetName:*MEMORY[0x1E4F15758]];
    [v17 setOutputFileType:*MEMORY[0x1E4F15AB0]];
    v18 = [MEMORY[0x1E4F16560] metadataItemFilterForSharing];
    [v17 setMetadataItemFilter:v18];

    [v17 setOutputURL:v9];
    dispatch_semaphore_t v19 = dispatch_semaphore_create(0);
    v26[0] = MEMORY[0x1E4F143A8];
    v26[1] = 3221225472;
    v26[2] = __74__NTKVideoAssetScrubbingOperation_scrubAssetAtURL_toDestinationURL_error___block_invoke;
    v26[3] = &unk_1E62C04F0;
    id v27 = v7;
    id v20 = v17;
    id v28 = v20;
    v9 = v19;
    v29 = v9;
    [v20 exportAsynchronouslyWithCompletionHandler:v26];
    dispatch_time_t v21 = dispatch_time(0, 180000000000);
    dispatch_semaphore_wait(v9, v21);
    unint64_t v22 = [v20 status];
    if (v22 >= 3)
    {
      if (v22 == 4)
      {
        if (a5)
        {
          v24 = [v20 error];

          if (v24)
          {
            [v20 error];
            LOBYTE(v24) = 0;
            *a5 = (id)objc_claimAutoreleasedReturnValue();
          }
          goto LABEL_18;
        }
      }
      else if (v22 != 5)
      {
        LOBYTE(v24) = 1;
LABEL_18:

        goto LABEL_19;
      }
    }
    else
    {
      v23 = _NTKLoggingObjectForDomain(6, (uint64_t)"NTKLoggingDomainPhoto");
      if (os_log_type_enabled(v23, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_1BC5A9000, v23, OS_LOG_TYPE_INFO, "[Resource Scrubber]: AVAssetExportSession timed out.", buf, 2u);
      }

      [v20 cancelExport];
    }
    LOBYTE(v24) = 0;
    goto LABEL_18;
  }
  if (v16)
  {
    *(_DWORD *)buf = 138412290;
    id v31 = v7;
    _os_log_impl(&dword_1BC5A9000, v15, OS_LOG_TYPE_INFO, "[Resource Scrubber]: Location data not found in asset: '%@'. Passing through", buf, 0xCu);
  }

  id v20 = [MEMORY[0x1E4F28CB8] defaultManager];
  LOBYTE(v24) = [v20 copyItemAtURL:v7 toURL:v9 error:a5];
LABEL_19:

  return (char)v24;
}

intptr_t __74__NTKVideoAssetScrubbingOperation_scrubAssetAtURL_toDestinationURL_error___block_invoke(uint64_t a1)
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  v2 = _NTKLoggingObjectForDomain(6, (uint64_t)"NTKLoggingDomainPhoto");
  if (os_log_type_enabled(v2, OS_LOG_TYPE_INFO))
  {
    uint64_t v3 = *(void *)(a1 + 32);
    uint64_t v4 = [*(id *)(a1 + 40) status];
    int v6 = 138412546;
    uint64_t v7 = v3;
    __int16 v8 = 2048;
    uint64_t v9 = v4;
    _os_log_impl(&dword_1BC5A9000, v2, OS_LOG_TYPE_INFO, "[Resource Scrubber]: AVAssetExportSession finished running on asset: '%@'. Status: %li", (uint8_t *)&v6, 0x16u);
  }

  return dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 48));
}

@end