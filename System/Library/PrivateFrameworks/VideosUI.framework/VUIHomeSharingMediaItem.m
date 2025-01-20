@interface VUIHomeSharingMediaItem
@end

@implementation VUIHomeSharingMediaItem

void __41__VUIHomeSharingMediaItem_iOS_initialize__block_invoke()
{
  os_log_t v0 = os_log_create("com.apple.AppleTV.playback", "VUIHomeSharingMediaItem_iOS");
  v1 = (void *)sLogObject_11;
  sLogObject_11 = (uint64_t)v0;
}

void __63__VUIHomeSharingMediaItem_iOS_prepareForLoadingWithCompletion___block_invoke(uint64_t a1, char a2, void *a3)
{
  id v5 = a3;
  if ((a2 & 1) == 0)
  {
    uint64_t v10 = *(void *)(a1 + 40);
    if (!v10) {
      goto LABEL_8;
    }
    v11 = *(void (**)(void))(v10 + 16);
LABEL_7:
    v11();
    goto LABEL_8;
  }
  if (![*(id *)(a1 + 32) needsKeyBagSyncPriorToPlayback])
  {
    v11 = *(void (**)(void))(*(void *)(a1 + 40) + 16);
    goto LABEL_7;
  }
  [*(id *)(a1 + 32) setNeedsKeyBagSyncPriorToPlayback:0];
  v6 = [*(id *)(a1 + 32) ml3Track];
  v7 = [v6 valueForProperty:*MEMORY[0x1E4F798D0]];

  v8 = (void *)[*(id *)(a1 + 32) loadingContext];
  objc_initWeak(&location, *(id *)(a1 + 32));
  v9 = *(void **)(a1 + 32);
  v12[0] = MEMORY[0x1E4F143A8];
  v12[1] = 3221225472;
  v12[2] = __63__VUIHomeSharingMediaItem_iOS_prepareForLoadingWithCompletion___block_invoke_2;
  v12[3] = &unk_1E6DF8C80;
  objc_copyWeak(v14, &location);
  v14[1] = v8;
  id v13 = *(id *)(a1 + 40);
  [v9 _fetchKeybagForDSID:v7 isFamilyAccount:0 completion:v12];

  objc_destroyWeak(v14);
  objc_destroyWeak(&location);

LABEL_8:
}

void __63__VUIHomeSharingMediaItem_iOS_prepareForLoadingWithCompletion___block_invoke_2(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  v3 = [WeakRetained ml3Track];
  v4 = [v3 valueForProperty:*MEMORY[0x1E4F79940]];

  if (v4
    && [v4 unsignedLongLongValue]
    && ([WeakRetained _loadingCancelled:*(void *)(a1 + 48)] & 1) == 0)
  {
    v5[0] = MEMORY[0x1E4F143A8];
    v5[1] = 3221225472;
    v5[2] = __63__VUIHomeSharingMediaItem_iOS_prepareForLoadingWithCompletion___block_invoke_3;
    v5[3] = &unk_1E6DF3DD0;
    id v6 = *(id *)(a1 + 32);
    [WeakRetained _fetchKeybagForDSID:v4 isFamilyAccount:1 completion:v5];
  }
  else
  {
    (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
  }
}

uint64_t __63__VUIHomeSharingMediaItem_iOS_prepareForLoadingWithCompletion___block_invoke_3(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

uint64_t __78__VUIHomeSharingMediaItem_iOS__fetchKeybagForDSID_isFamilyAccount_completion___block_invoke()
{
  return TVPPerformBlockOnMainThreadIfNeeded();
}

void __78__VUIHomeSharingMediaItem_iOS__fetchKeybagForDSID_isFamilyAccount_completion___block_invoke_2(uint64_t a1, void *a2)
{
  id v3 = a2;
  v4 = sLogObject_11;
  if (os_log_type_enabled((os_log_t)sLogObject_11, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1E2BD7000, v4, OS_LOG_TYPE_DEFAULT, "Token request complete", buf, 2u);
  }
  id v5 = [v3 tokenData];
  if ([v5 length])
  {
    id v6 = [MEMORY[0x1E4F28CB8] defaultManager];
    char v7 = [v6 fileExistsAtPath:*(void *)(a1 + 32)];

    if ((v7 & 1) == 0)
    {
      v8 = [MEMORY[0x1E4F28CB8] defaultManager];
      uint64_t v9 = *(void *)(a1 + 32);
      id v23 = 0;
      char v10 = [v8 createDirectoryAtPath:v9 withIntermediateDirectories:1 attributes:0 error:&v23];
      id v11 = v23;

      if ((v10 & 1) == 0)
      {
        v12 = sLogObject_11;
        if (os_log_type_enabled((os_log_t)sLogObject_11, OS_LOG_TYPE_ERROR)) {
          __78__VUIHomeSharingMediaItem_iOS__fetchKeybagForDSID_isFamilyAccount_completion___block_invoke_2_cold_2((uint64_t)v11, v12, v13, v14, v15, v16, v17, v18);
        }
      }
    }
    v19 = (void *)[objc_alloc(MEMORY[0x1E4FA8138]) initWithAuthorizationToken:v5 accountIdentifier:*(void *)(a1 + 40)];
    [v19 setKeybagPath:*(void *)(a1 + 32)];
    if (*(unsigned char *)(a1 + 56)) {
      [v19 setReason:@"family"];
    }
    v20[0] = MEMORY[0x1E4F143A8];
    v20[1] = 3221225472;
    v20[2] = __78__VUIHomeSharingMediaItem_iOS__fetchKeybagForDSID_isFamilyAccount_completion___block_invoke_40;
    v20[3] = &unk_1E6DF8CA8;
    id v21 = *(id *)(a1 + 32);
    id v22 = *(id *)(a1 + 48);
    [v19 startWithAuthorizationResponseBlock:v20];
  }
  else
  {
    if (os_log_type_enabled((os_log_t)sLogObject_11, OS_LOG_TYPE_ERROR)) {
      __78__VUIHomeSharingMediaItem_iOS__fetchKeybagForDSID_isFamilyAccount_completion___block_invoke_2_cold_1();
    }
    (*(void (**)(void))(*(void *)(a1 + 48) + 16))();
  }
}

void __78__VUIHomeSharingMediaItem_iOS__fetchKeybagForDSID_isFamilyAccount_completion___block_invoke_40(uint64_t a1, void *a2, void *a3)
{
  uint64_t v35 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  id v6 = a3;
  char v7 = sLogObject_11;
  if (os_log_type_enabled((os_log_t)sLogObject_11, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1E2BD7000, v7, OS_LOG_TYPE_DEFAULT, "Authorization request complete", buf, 2u);
  }
  v8 = [v5 bodyData];
  if ([v8 length])
  {
    uint64_t v9 = [MEMORY[0x1E4F28F98] propertyListWithData:v8 options:0 format:0 error:0];
    char v10 = [v9 objectForKey:@"keybag"];
    if ([v10 length])
    {
      *(void *)buf = 0;
      uint64_t v33 = 0;
      uint64_t v34 = 0;
      if (SSVFairPlayGetHardwareInfo())
      {
        int v31 = 0;
        uint64_t v11 = XtCqEf5X(0, (uint64_t)buf, [*(id *)(a1 + 32) UTF8String], (uint64_t)&v31);
        if (v11)
        {
          uint64_t v12 = v11;
          uint64_t v13 = sLogObject_11;
          if (os_log_type_enabled((os_log_t)sLogObject_11, OS_LOG_TYPE_ERROR)) {
            __78__VUIHomeSharingMediaItem_iOS__fetchKeybagForDSID_isFamilyAccount_completion___block_invoke_40_cold_4(v12, v13, v14, v15, v16, v17, v18, v19);
          }
        }
        else
        {
          id v20 = v10;
          [v20 bytes];
          [v20 length];
          lCUad();
          id v22 = sLogObject_11;
          if (v21)
          {
            uint64_t v23 = v21;
            if (os_log_type_enabled((os_log_t)sLogObject_11, OS_LOG_TYPE_ERROR)) {
              __78__VUIHomeSharingMediaItem_iOS__fetchKeybagForDSID_isFamilyAccount_completion___block_invoke_40_cold_3(v23, v22, v24, v25, v26, v27, v28, v29);
            }
          }
          else if (os_log_type_enabled((os_log_t)sLogObject_11, OS_LOG_TYPE_DEFAULT))
          {
            *(_WORD *)v30 = 0;
            _os_log_impl(&dword_1E2BD7000, v22, OS_LOG_TYPE_DEFAULT, "Successfully imported key bag", v30, 2u);
          }
          VLxCLgDpiF(v31);
        }
      }
      else if (os_log_type_enabled((os_log_t)sLogObject_11, OS_LOG_TYPE_ERROR))
      {
        __78__VUIHomeSharingMediaItem_iOS__fetchKeybagForDSID_isFamilyAccount_completion___block_invoke_40_cold_5();
      }
    }
    else if (os_log_type_enabled((os_log_t)sLogObject_11, OS_LOG_TYPE_ERROR))
    {
      __78__VUIHomeSharingMediaItem_iOS__fetchKeybagForDSID_isFamilyAccount_completion___block_invoke_40_cold_2();
    }
    (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
  }
  else
  {
    if (os_log_type_enabled((os_log_t)sLogObject_11, OS_LOG_TYPE_ERROR)) {
      __78__VUIHomeSharingMediaItem_iOS__fetchKeybagForDSID_isFamilyAccount_completion___block_invoke_40_cold_1();
    }
    (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
  }
}

void __78__VUIHomeSharingMediaItem_iOS__fetchKeybagForDSID_isFamilyAccount_completion___block_invoke_2_cold_1()
{
  OUTLINED_FUNCTION_1_5();
  OUTLINED_FUNCTION_0_13(&dword_1E2BD7000, v0, v1, "Token data has zero length", v2, v3, v4, v5, v6);
}

void __78__VUIHomeSharingMediaItem_iOS__fetchKeybagForDSID_isFamilyAccount_completion___block_invoke_2_cold_2(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void __78__VUIHomeSharingMediaItem_iOS__fetchKeybagForDSID_isFamilyAccount_completion___block_invoke_40_cold_1()
{
  OUTLINED_FUNCTION_1_5();
  OUTLINED_FUNCTION_0_13(&dword_1E2BD7000, v0, v1, "Store auth request response has zero length body data", v2, v3, v4, v5, v6);
}

void __78__VUIHomeSharingMediaItem_iOS__fetchKeybagForDSID_isFamilyAccount_completion___block_invoke_40_cold_2()
{
  OUTLINED_FUNCTION_1_5();
  OUTLINED_FUNCTION_0_13(&dword_1E2BD7000, v0, v1, "Store auth request response has no keybag entry", v2, v3, v4, v5, v6);
}

void __78__VUIHomeSharingMediaItem_iOS__fetchKeybagForDSID_isFamilyAccount_completion___block_invoke_40_cold_3(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void __78__VUIHomeSharingMediaItem_iOS__fetchKeybagForDSID_isFamilyAccount_completion___block_invoke_40_cold_4(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void __78__VUIHomeSharingMediaItem_iOS__fetchKeybagForDSID_isFamilyAccount_completion___block_invoke_40_cold_5()
{
  OUTLINED_FUNCTION_1_5();
  OUTLINED_FUNCTION_0_13(&dword_1E2BD7000, v0, v1, "FP hardware info is unavailable", v2, v3, v4, v5, v6);
}

@end