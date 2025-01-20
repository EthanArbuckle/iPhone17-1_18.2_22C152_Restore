@interface PXSharingUserSafetyController
+ (BOOL)userSafetyInterventionCheckRequired;
+ (id)interventionAlertControllerWithAction:(id)a3;
+ (id)interventionViewControllerWithAction:(id)a3;
+ (void)_userSafetyInterventionCheckRequiredBeforeSharingAssets:(id)a3 completion:(id)a4;
+ (void)userSafetyInterventionCheckRequiredBeforeSharingAssets:(id)a3 completion:(id)a4;
@end

@implementation PXSharingUserSafetyController

+ (id)interventionAlertControllerWithAction:(id)a3
{
  id v3 = a3;
  v4 = objc_alloc_init(_PXSharingUserSafetyControllerDelegate);
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = __71__PXSharingUserSafetyController_interventionAlertControllerWithAction___block_invoke;
  v11[3] = &unk_1E5DCD158;
  id v5 = v3;
  id v13 = v5;
  v6 = v4;
  v12 = v6;
  [(_PXSharingUserSafetyControllerDelegate *)v6 configureAction:v11];
  uint64_t v15 = 0;
  v16 = &v15;
  uint64_t v17 = 0x2050000000;
  v7 = (void *)getSCUIInterventionAlertControllerClass_softClass;
  uint64_t v18 = getSCUIInterventionAlertControllerClass_softClass;
  if (!getSCUIInterventionAlertControllerClass_softClass)
  {
    v14[0] = MEMORY[0x1E4F143A8];
    v14[1] = 3221225472;
    v14[2] = __getSCUIInterventionAlertControllerClass_block_invoke;
    v14[3] = &unk_1E5DD2B08;
    v14[4] = &v15;
    __getSCUIInterventionAlertControllerClass_block_invoke((uint64_t)v14);
    v7 = (void *)v16[3];
  }
  id v8 = v7;
  _Block_object_dispose(&v15, 8);
  v9 = [v8 viewControllerWithWorkflow:1 contextDictionary:0];
  [v9 setInterventionDelegate:v6];

  return v9;
}

uint64_t __71__PXSharingUserSafetyController_interventionAlertControllerWithAction___block_invoke(uint64_t a1)
{
  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
  v2 = *(void **)(a1 + 32);
  return [v2 configureAction:0];
}

+ (id)interventionViewControllerWithAction:(id)a3
{
  id v3 = a3;
  v4 = objc_alloc_init(_PXSharingUserSafetyControllerDelegate);
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = __70__PXSharingUserSafetyController_interventionViewControllerWithAction___block_invoke;
  v11[3] = &unk_1E5DCD158;
  id v5 = v3;
  id v13 = v5;
  v6 = v4;
  v12 = v6;
  [(_PXSharingUserSafetyControllerDelegate *)v6 configureAction:v11];
  uint64_t v15 = 0;
  v16 = &v15;
  uint64_t v17 = 0x2050000000;
  v7 = (void *)getSCUIInterventionViewControllerClass_softClass;
  uint64_t v18 = getSCUIInterventionViewControllerClass_softClass;
  if (!getSCUIInterventionViewControllerClass_softClass)
  {
    v14[0] = MEMORY[0x1E4F143A8];
    v14[1] = 3221225472;
    v14[2] = __getSCUIInterventionViewControllerClass_block_invoke;
    v14[3] = &unk_1E5DD2B08;
    v14[4] = &v15;
    __getSCUIInterventionViewControllerClass_block_invoke((uint64_t)v14);
    v7 = (void *)v16[3];
  }
  id v8 = v7;
  _Block_object_dispose(&v15, 8);
  v9 = [v8 viewControllerWithWorkflow:1 contextDictionary:0];
  [v9 setModalInPresentation:1];
  [v9 setModalPresentationStyle:2];
  [v9 setInterventionDelegate:v6];

  return v9;
}

uint64_t __70__PXSharingUserSafetyController_interventionViewControllerWithAction___block_invoke(uint64_t a1)
{
  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
  v2 = *(void **)(a1 + 32);
  return [v2 configureAction:0];
}

+ (void)_userSafetyInterventionCheckRequiredBeforeSharingAssets:(id)a3 completion:(id)a4
{
  uint64_t v73 = *MEMORY[0x1E4F143B8];
  id v28 = a3;
  id v6 = a4;
  if ([a1 userSafetyInterventionCheckRequired])
  {
    v27 = v6;
    v66[0] = 0;
    v66[1] = v66;
    v66[2] = 0x2020000000;
    char v67 = 0;
    v64[0] = 0;
    v64[1] = v64;
    v64[2] = 0x2020000000;
    char v65 = 0;
    v62[0] = 0;
    v62[1] = v62;
    v62[2] = 0x3032000000;
    v62[3] = __Block_byref_object_copy__258473;
    v62[4] = __Block_byref_object_dispose__258474;
    id v63 = 0;
    v60[0] = 0;
    v60[1] = v60;
    v60[2] = 0x3032000000;
    v60[3] = __Block_byref_object_copy__258473;
    v60[4] = __Block_byref_object_dispose__258474;
    id v61 = [MEMORY[0x1E4F1CA80] set];
    dispatch_group_t v7 = dispatch_group_create();
    aBlock[0] = MEMORY[0x1E4F143A8];
    aBlock[1] = 3221225472;
    aBlock[2] = __100__PXSharingUserSafetyController__userSafetyInterventionCheckRequiredBeforeSharingAssets_completion___block_invoke;
    aBlock[3] = &unk_1E5DCD020;
    v57 = v66;
    v58 = v64;
    v59 = v62;
    id v8 = v7;
    v56 = v8;
    v31 = _Block_copy(aBlock);
    id v30 = objc_alloc_init((Class)getUSSensitivityAnalyzerClass());
    long long v53 = 0u;
    long long v54 = 0u;
    long long v51 = 0u;
    long long v52 = 0u;
    id obj = v28;
    uint64_t v9 = [obj countByEnumeratingWithState:&v51 objects:v72 count:16];
    if (v9)
    {
      uint64_t v10 = *(void *)v52;
      do
      {
        for (uint64_t i = 0; i != v9; ++i)
        {
          if (*(void *)v52 != v10) {
            objc_enumerationMutation(obj);
          }
          v12 = *(void **)(*((void *)&v51 + 1) + 8 * i);
          dispatch_group_enter(v8);
          id v13 = PLSharingGetLog();
          if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
          {
            v14 = [v12 localIdentifier];
            uint64_t v15 = [v12 mediaType];
            *(_DWORD *)buf = 138412546;
            v69 = v14;
            __int16 v70 = 2048;
            uint64_t v71 = v15;
            _os_log_impl(&dword_1A9AE7000, v13, OS_LOG_TYPE_DEFAULT, "[Civic] Analyzing %@ with media type: %ld", buf, 0x16u);
          }
          v16 = [v12 localIdentifier];
          uint64_t v17 = [v12 photoLibrary];
          uint64_t v18 = [v17 photoLibraryURL];

          uint64_t v19 = [v12 mediaType];
          if (v19 == 2)
          {
            v38[0] = MEMORY[0x1E4F143A8];
            v38[1] = 3221225472;
            v38[2] = __100__PXSharingUserSafetyController__userSafetyInterventionCheckRequiredBeforeSharingAssets_completion___block_invoke_95;
            v38[3] = &unk_1E5DCD108;
            v38[4] = v12;
            v44 = v60;
            id v23 = v30;
            id v39 = v23;
            id v24 = v16;
            id v40 = v24;
            id v25 = v18;
            id v41 = v25;
            id v42 = &__block_literal_global_258477;
            id v43 = v31;
            [v23 analyzeVideoWithLocalIdentifier:v24 fromPhotoLibraryWithURL:v25 progressHandler:&__block_literal_global_258477 completionHandler:v38];
          }
          else if (v19 == 1)
          {
            v45[0] = MEMORY[0x1E4F143A8];
            v45[1] = 3221225472;
            v45[2] = __100__PXSharingUserSafetyController__userSafetyInterventionCheckRequiredBeforeSharingAssets_completion___block_invoke_89;
            v45[3] = &unk_1E5DCD098;
            v45[4] = v12;
            v50 = v60;
            id v20 = v30;
            id v46 = v20;
            id v21 = v16;
            id v47 = v21;
            id v22 = v18;
            id v48 = v22;
            id v49 = v31;
            [v20 analyzeImageWithLocalIdentifier:v21 fromPhotoLibraryWithURL:v22 completionHandler:v45];
          }
          else
          {
            v26 = objc_msgSend(MEMORY[0x1E4F28C58], "px_genericErrorWithDebugDescription:", @"Unsupported Media Type");
            (*((void (**)(void *, void *, void, void *))v31 + 2))(v31, v12, 0, v26);
          }
        }
        uint64_t v9 = [obj countByEnumeratingWithState:&v51 objects:v72 count:16];
      }
      while (v9);
    }

    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __100__PXSharingUserSafetyController__userSafetyInterventionCheckRequiredBeforeSharingAssets_completion___block_invoke_3_102;
    block[3] = &unk_1E5DCD130;
    v34 = v60;
    id v33 = v27;
    v35 = v66;
    v36 = v64;
    v37 = v62;
    dispatch_group_notify(v8, MEMORY[0x1E4F14428], block);

    _Block_object_dispose(v60, 8);
    _Block_object_dispose(v62, 8);

    _Block_object_dispose(v64, 8);
    _Block_object_dispose(v66, 8);
    id v6 = v27;
  }
}

void __100__PXSharingUserSafetyController__userSafetyInterventionCheckRequiredBeforeSharingAssets_completion___block_invoke(uint64_t a1, void *a2, int a3, void *a4)
{
  uint64_t v29 = *MEMORY[0x1E4F143B8];
  id v7 = a2;
  id v8 = a4;
  if (a3) {
    *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = 1;
  }
  uint64_t v9 = PLSharingGetLog();
  uint64_t v10 = v9;
  if (v8)
  {
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      v11 = [v7 localIdentifier];
      int v23 = 138412802;
      id v24 = v11;
      __int16 v25 = 2048;
      uint64_t v26 = [v7 mediaType];
      __int16 v27 = 2112;
      id v28 = v8;
      _os_log_impl(&dword_1A9AE7000, v10, OS_LOG_TYPE_ERROR, "[Civic] Failed to analyze %@ with media type: %ld (error: %@)", (uint8_t *)&v23, 0x20u);
    }
    *(unsigned char *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) = 1;
    uint64_t v12 = *(void *)(*(void *)(a1 + 56) + 8);
    id v13 = v8;
    uint64_t v10 = *(NSObject **)(v12 + 40);
    *(void *)(v12 + 40) = v13;
  }
  else if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    v14 = [v7 localIdentifier];
    uint64_t v15 = [v7 mediaType];
    v16 = @"NO";
    if (a3) {
      v16 = @"YES";
    }
    uint64_t v17 = v16;
    int v23 = 138412802;
    id v24 = v14;
    __int16 v25 = 2048;
    uint64_t v26 = v15;
    __int16 v27 = 2112;
    id v28 = v17;
    _os_log_impl(&dword_1A9AE7000, v10, OS_LOG_TYPE_DEFAULT, "[Civic] Analysis completed for %@ with media type: %ld (isSensitive: %@)", (uint8_t *)&v23, 0x20u);
  }
  if (PFOSVariantHasInternalUI())
  {
    uint64_t v18 = PXSharedUserDefaults();
    int v19 = [v18 BOOLForKey:@"alwaysShowUserSafetyInterventionUI"];

    if (v19)
    {
      id v20 = PLSharingGetLog();
      if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
      {
        LOWORD(v23) = 0;
        _os_log_impl(&dword_1A9AE7000, v20, OS_LOG_TYPE_DEFAULT, "[Civic] Force showing safety intervention UI.", (uint8_t *)&v23, 2u);
      }

      *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = 1;
      uint64_t v21 = *(void *)(*(void *)(a1 + 56) + 8);
      id v22 = *(void **)(v21 + 40);
      *(void *)(v21 + 40) = 0;

      *(unsigned char *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) = 0;
    }
  }
  dispatch_group_leave(*(dispatch_group_t *)(a1 + 32));
}

void __100__PXSharingUserSafetyController__userSafetyInterventionCheckRequiredBeforeSharingAssets_completion___block_invoke_89(uint64_t a1, uint64_t a2, void *a3)
{
  uint64_t v27 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if (v4)
  {
    id v5 = PLSharingGetLog();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
    {
      id v6 = [*(id *)(a1 + 32) localIdentifier];
      uint64_t v7 = [*(id *)(a1 + 32) mediaType];
      *(_DWORD *)buf = 138412802;
      id v22 = v6;
      __int16 v23 = 2048;
      uint64_t v24 = v7;
      __int16 v25 = 2112;
      id v26 = v4;
      _os_log_impl(&dword_1A9AE7000, v5, OS_LOG_TYPE_ERROR, "[Civic] Failed to analyze %@ with media type: %ld (error: %@). Will retry after download.", buf, 0x20u);
    }
    id v8 = (void *)[objc_alloc(MEMORY[0x1E4F39270]) initWithAsset:*(void *)(a1 + 32) requestType:1];
    [*(id *)(*(void *)(*(void *)(a1 + 72) + 8) + 40) addObject:v8];
    v13[0] = MEMORY[0x1E4F143A8];
    v13[1] = 3221225472;
    v13[2] = __100__PXSharingUserSafetyController__userSafetyInterventionCheckRequiredBeforeSharingAssets_completion___block_invoke_91;
    v13[3] = &unk_1E5DCD070;
    id v14 = *(id *)(a1 + 40);
    id v15 = *(id *)(a1 + 48);
    id v16 = *(id *)(a1 + 56);
    id v9 = *(id *)(a1 + 64);
    uint64_t v10 = *(void *)(a1 + 32);
    uint64_t v11 = *(void *)(a1 + 72);
    id v19 = v9;
    uint64_t v20 = v11;
    uint64_t v17 = v10;
    id v18 = v8;
    id v12 = v8;
    [v12 retrieveRequiredResourcesWithOptions:0 completionHandler:v13];
  }
  else
  {
    (*(void (**)(void))(*(void *)(a1 + 64) + 16))();
  }
}

void __100__PXSharingUserSafetyController__userSafetyInterventionCheckRequiredBeforeSharingAssets_completion___block_invoke_95(uint64_t a1, uint64_t a2, void *a3)
{
  uint64_t v28 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if (v4)
  {
    id v5 = PLSharingGetLog();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
    {
      id v6 = [*(id *)(a1 + 32) localIdentifier];
      uint64_t v7 = [*(id *)(a1 + 32) mediaType];
      *(_DWORD *)buf = 138412802;
      __int16 v23 = v6;
      __int16 v24 = 2048;
      uint64_t v25 = v7;
      __int16 v26 = 2112;
      id v27 = v4;
      _os_log_impl(&dword_1A9AE7000, v5, OS_LOG_TYPE_ERROR, "[Civic] Failed to analyze %@ with media type: %ld (error: %@). Will retry after download.", buf, 0x20u);
    }
    id v8 = (void *)[objc_alloc(MEMORY[0x1E4F39270]) initWithAsset:*(void *)(a1 + 32) requestType:1];
    [*(id *)(*(void *)(*(void *)(a1 + 80) + 8) + 40) addObject:v8];
    v13[0] = MEMORY[0x1E4F143A8];
    v13[1] = 3221225472;
    v13[2] = __100__PXSharingUserSafetyController__userSafetyInterventionCheckRequiredBeforeSharingAssets_completion___block_invoke_96;
    v13[3] = &unk_1E5DCD0E0;
    id v14 = *(id *)(a1 + 40);
    id v15 = *(id *)(a1 + 48);
    id v16 = *(id *)(a1 + 56);
    id v19 = *(id *)(a1 + 64);
    id v9 = *(id *)(a1 + 72);
    uint64_t v10 = *(void *)(a1 + 32);
    uint64_t v11 = *(void *)(a1 + 80);
    id v20 = v9;
    uint64_t v21 = v11;
    uint64_t v17 = v10;
    id v18 = v8;
    id v12 = v8;
    [v12 retrieveRequiredResourcesWithOptions:0 completionHandler:v13];
  }
  else
  {
    (*(void (**)(void))(*(void *)(a1 + 72) + 16))();
  }
}

uint64_t __100__PXSharingUserSafetyController__userSafetyInterventionCheckRequiredBeforeSharingAssets_completion___block_invoke_3_102(void *a1)
{
  return (*(uint64_t (**)(void, void, void, void))(a1[4] + 16))(a1[4], *(unsigned __int8 *)(*(void *)(a1[6] + 8) + 24), *(unsigned __int8 *)(*(void *)(a1[7] + 8) + 24), *(void *)(*(void *)(a1[8] + 8) + 40));
}

void __100__PXSharingUserSafetyController__userSafetyInterventionCheckRequiredBeforeSharingAssets_completion___block_invoke_3(double a1, uint64_t a2, void *a3)
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v5 = PLSharingGetLog();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
  {
    int v6 = 138412546;
    id v7 = v4;
    __int16 v8 = 2048;
    double v9 = a1;
    _os_log_impl(&dword_1A9AE7000, v5, OS_LOG_TYPE_DEBUG, "[Civic] Analyzing %@ with progress: %f", (uint8_t *)&v6, 0x16u);
  }
}

void __100__PXSharingUserSafetyController__userSafetyInterventionCheckRequiredBeforeSharingAssets_completion___block_invoke_96(uint64_t a1)
{
  v2 = *(void **)(a1 + 32);
  uint64_t v3 = *(void *)(a1 + 40);
  uint64_t v4 = *(void *)(a1 + 48);
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __100__PXSharingUserSafetyController__userSafetyInterventionCheckRequiredBeforeSharingAssets_completion___block_invoke_2_97;
  v9[3] = &unk_1E5DCD048;
  uint64_t v5 = *(void *)(a1 + 72);
  id v6 = *(id *)(a1 + 80);
  id v7 = *(void **)(a1 + 64);
  v9[4] = *(void *)(a1 + 56);
  uint64_t v8 = *(void *)(a1 + 88);
  id v11 = v6;
  uint64_t v12 = v8;
  id v10 = v7;
  [v2 analyzeVideoWithLocalIdentifier:v3 fromPhotoLibraryWithURL:v4 progressHandler:v5 completionHandler:v9];
}

uint64_t __100__PXSharingUserSafetyController__userSafetyInterventionCheckRequiredBeforeSharingAssets_completion___block_invoke_2_97(void *a1)
{
  (*(void (**)(void))(a1[6] + 16))();
  v2 = *(void **)(*(void *)(a1[7] + 8) + 40);
  uint64_t v3 = a1[5];
  return [v2 removeObject:v3];
}

void __100__PXSharingUserSafetyController__userSafetyInterventionCheckRequiredBeforeSharingAssets_completion___block_invoke_91(uint64_t a1)
{
  v2 = *(void **)(a1 + 32);
  uint64_t v3 = *(void *)(a1 + 40);
  uint64_t v4 = *(void *)(a1 + 48);
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __100__PXSharingUserSafetyController__userSafetyInterventionCheckRequiredBeforeSharingAssets_completion___block_invoke_2;
  v8[3] = &unk_1E5DCD048;
  id v5 = *(id *)(a1 + 72);
  id v6 = *(void **)(a1 + 64);
  v8[4] = *(void *)(a1 + 56);
  uint64_t v7 = *(void *)(a1 + 80);
  id v10 = v5;
  uint64_t v11 = v7;
  id v9 = v6;
  [v2 analyzeImageWithLocalIdentifier:v3 fromPhotoLibraryWithURL:v4 completionHandler:v8];
}

uint64_t __100__PXSharingUserSafetyController__userSafetyInterventionCheckRequiredBeforeSharingAssets_completion___block_invoke_2(void *a1)
{
  (*(void (**)(void))(a1[6] + 16))();
  v2 = *(void **)(*(void *)(a1[7] + 8) + 40);
  uint64_t v3 = a1[5];
  return [v2 removeObject:v3];
}

+ (void)userSafetyInterventionCheckRequiredBeforeSharingAssets:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __99__PXSharingUserSafetyController_userSafetyInterventionCheckRequiredBeforeSharingAssets_completion___block_invoke;
  v10[3] = &unk_1E5DCCFF8;
  id v11 = v6;
  id v12 = v7;
  id v8 = v7;
  id v9 = v6;
  [a1 _userSafetyInterventionCheckRequiredBeforeSharingAssets:v9 completion:v10];
}

void __99__PXSharingUserSafetyController_userSafetyInterventionCheckRequiredBeforeSharingAssets_completion___block_invoke(uint64_t a1, uint64_t a2, int a3, void *a4)
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  id v6 = a4;
  if (a3)
  {
    id v7 = PLUIGetLog();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_FAULT))
    {
      uint64_t v8 = *(void *)(a1 + 32);
      int v9 = 138412546;
      uint64_t v10 = v8;
      __int16 v11 = 2112;
      id v12 = v6;
      _os_log_impl(&dword_1A9AE7000, v7, OS_LOG_TYPE_FAULT, "User safety intervention check failed to analyze fetch result (%@): %@", (uint8_t *)&v9, 0x16u);
    }
  }
  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
}

+ (BOOL)userSafetyInterventionCheckRequired
{
  if (PFOSVariantHasInternalUI()
    && (PXSharedUserDefaults(),
        v2 = objc_claimAutoreleasedReturnValue(),
        int v3 = [v2 BOOLForKey:@"alwaysShowUserSafetyInterventionUI"],
        v2,
        v3))
  {
    uint64_t v4 = PLSharingGetLog();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)id v7 = 0;
      _os_log_impl(&dword_1A9AE7000, v4, OS_LOG_TYPE_DEFAULT, "[Civic] Force showing safety intervention UI.", v7, 2u);
    }

    return 1;
  }
  else
  {
    id USSensitivityAnalyzerClass = getUSSensitivityAnalyzerClass();
    return [USSensitivityAnalyzerClass isCommunicationSafetyEnabled];
  }
}

@end