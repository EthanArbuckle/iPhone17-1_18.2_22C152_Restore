@interface UICloudSharingActivity
@end

@implementation UICloudSharingActivity

void __71___UICloudSharingActivity__isURLEligibleForSharing_isInitial_isFolder___block_invoke(void *a1, void *a2)
{
  uint64_t v27 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  v4 = [v3 objectForKeyedSubscript:@"com.apple.CloudDocs.SharingV1"];
  if (v4)
  {
  }
  else
  {
    v5 = [v3 objectForKeyedSubscript:@"com.apple.CloudDocs.private.SharingOperation"];

    if (!v5) {
      goto LABEL_13;
    }
  }
  *(unsigned char *)(*(void *)(a1[6] + 8) + 24) = 1;
  v6 = (void *)a1[4];
  uint64_t v8 = *MEMORY[0x1E4F1C728];
  v24[0] = *MEMORY[0x1E4F1C788];
  uint64_t v7 = v24[0];
  v24[1] = v8;
  uint64_t v10 = *MEMORY[0x1E4F1C658];
  uint64_t v25 = *MEMORY[0x1E4F1C628];
  uint64_t v9 = v25;
  uint64_t v26 = v10;
  v11 = [MEMORY[0x1E4F1C978] arrayWithObjects:v24 count:4];
  v12 = [v6 promisedItemResourceValuesForKeys:v11 error:0];

  v13 = [v12 objectForKeyedSubscript:v7];
  LODWORD(v11) = [v13 BOOLValue];

  v14 = [v12 objectForKeyedSubscript:v9];
  char v15 = [v14 BOOLValue];

  v16 = (void *)a1[5];
  v17 = [v12 objectForKeyedSubscript:v8];
  int v18 = [v16 eligibleTypeForActivity:v17];

  v19 = [v12 objectForKeyedSubscript:v10];
  char v20 = [v19 BOOLValue];

  if (v11)
  {
    v21 = (unsigned char *)a1[7];
    if (v21) {
      unsigned char *v21 = 0;
    }
  }
  else if (v18)
  {
    v22 = (unsigned char *)a1[7];
    if (v22) {
      unsigned char *v22 = 1;
    }
  }
  v23 = (unsigned char *)a1[8];
  if (v23) {
    unsigned char *v23 = v15 & ~v20;
  }

LABEL_13:
}

void __64___UICloudSharingActivity__prepareWithActivityItems_completion___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  id v3 = a2;
  uint64_t v4 = [v3 countByEnumeratingWithState:&v15 objects:v19 count:16];
  if (v4)
  {
    uint64_t v5 = *(void *)v16;
    while (2)
    {
      uint64_t v6 = 0;
      do
      {
        if (*(void *)v16 != v5) {
          objc_enumerationMutation(v3);
        }
        uint64_t v7 = *(void **)(*((void *)&v15 + 1) + 8 * v6);
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0 && [v7 isFileURL])
        {
          id v8 = v7;
          if ([*(id *)(a1 + 32) _isURLEligibleForSharing:v8 isInitial:0 isFolder:0])
          {
            if ([*(id *)(a1 + 32) activityItemIsInSharedFolder])
            {
              id location = 0;
              objc_initWeak(&location, *(id *)(a1 + 32));
              uint64_t v9 = (void *)MEMORY[0x1E4F9F6B8];
              v10[0] = MEMORY[0x1E4F143A8];
              v10[1] = 3221225472;
              v10[2] = __64___UICloudSharingActivity__prepareWithActivityItems_completion___block_invoke_2;
              v10[3] = &unk_1E5A221A8;
              v10[4] = *(void *)(a1 + 32);
              id v11 = v8;
              objc_copyWeak(&v13, &location);
              id v12 = *(id *)(a1 + 40);
              [v9 findOriginatingSharedItemForSubitemURL:v11 completionHandler:v10];

              objc_destroyWeak(&v13);
              objc_destroyWeak(&location);
            }
            else
            {
              [*(id *)(a1 + 32) _showSharingControllerForURL:v8 completion:*(void *)(a1 + 40)];
            }

            goto LABEL_17;
          }
        }
        ++v6;
      }
      while (v4 != v6);
      uint64_t v4 = [v3 countByEnumeratingWithState:&v15 objects:v19 count:16];
      if (v4) {
        continue;
      }
      break;
    }
  }

  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
LABEL_17:
}

void __64___UICloudSharingActivity__prepareWithActivityItems_completion___block_invoke_2(id *a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  if (!v5)
  {
    uint64_t v7 = share_sheet_log();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR)) {
      __64___UICloudSharingActivity__prepareWithActivityItems_completion___block_invoke_2_cold_1((uint64_t)a1, (uint64_t)v6, v7);
    }

    id v5 = a1[5];
  }
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __64___UICloudSharingActivity__prepareWithActivityItems_completion___block_invoke_40;
  block[3] = &unk_1E5A22180;
  objc_copyWeak(&v12, a1 + 7);
  id v10 = v5;
  id v11 = a1[6];
  id v8 = v5;
  dispatch_async(MEMORY[0x1E4F14428], block);

  objc_destroyWeak(&v12);
}

void __64___UICloudSharingActivity__prepareWithActivityItems_completion___block_invoke_40(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  [WeakRetained _showSharingControllerForURL:*(void *)(a1 + 32) completion:*(void *)(a1 + 40)];
}

void __64___UICloudSharingActivity__prepareWithActivityItems_completion___block_invoke_2_cold_1(uint64_t a1, uint64_t a2, os_log_t log)
{
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  uint64_t v3 = *(void *)(a1 + 32);
  uint64_t v4 = *(void *)(a1 + 40);
  int v5 = 138412802;
  uint64_t v6 = v3;
  __int16 v7 = 2112;
  uint64_t v8 = v4;
  __int16 v9 = 2112;
  uint64_t v10 = a2;
  _os_log_error_impl(&dword_1A0AD8000, log, OS_LOG_TYPE_ERROR, "%@: could not find the originating shared item URL, falling back to item URL:%@ : %@", (uint8_t *)&v5, 0x20u);
}

@end