@interface ICQUIPhotosHelper
+ (void)enableCloudPhotosLibraryWithCompletion:(id)a3;
+ (void)enableCloudPhotosOptimizationWithCompletion:(id)a3;
@end

@implementation ICQUIPhotosHelper

+ (void)enableCloudPhotosLibraryWithCompletion:(id)a3
{
  id v4 = a3;
  id v3 = v4;
  PLCanEnableCloudPhotoLibrary();
}

void __60__ICQUIPhotosHelper_enableCloudPhotosLibraryWithCompletion___block_invoke(uint64_t a1, char a2, void *a3)
{
  id v5 = a3;
  v6 = _ICQGetLogSystem();
  v7 = v6;
  if (a2)
  {
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_22C821000, v7, OS_LOG_TYPE_DEFAULT, "Attempting to enable iCPL.", buf, 2u);
    }

    v8 = (void *)MEMORY[0x263F5D8C0];
    v13[0] = MEMORY[0x263EF8330];
    v13[1] = 3221225472;
    v13[2] = __60__ICQUIPhotosHelper_enableCloudPhotosLibraryWithCompletion___block_invoke_1;
    v13[3] = &unk_264921BD8;
    long long v12 = *(_OWORD *)(a1 + 32);
    id v9 = (id)v12;
    long long v14 = v12;
    [v8 enableCPL:v13];
    v10 = (void *)v14;
  }
  else
  {
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR)) {
      __60__ICQUIPhotosHelper_enableCloudPhotosLibraryWithCompletion___block_invoke_cold_1((uint64_t)v5, v7);
    }

    uint64_t v11 = *(void *)(a1 + 32);
    v10 = ICQCreateErrorWithMessage();
    (*(void (**)(uint64_t, void, void *))(v11 + 16))(v11, 0, v10);
  }
}

void __60__ICQUIPhotosHelper_enableCloudPhotosLibraryWithCompletion___block_invoke_1(uint64_t a1, int a2, void *a3)
{
  id v5 = a3;
  v6 = _ICQGetLogSystem();
  v7 = v6;
  if (a2)
  {
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v10 = 0;
      _os_log_impl(&dword_22C821000, v7, OS_LOG_TYPE_DEFAULT, "iCPL enabled successfully.", v10, 2u);
    }

    [*(id *)(a1 + 40) enableCloudPhotosOptimizationWithCompletion:*(void *)(a1 + 32)];
  }
  else
  {
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR)) {
      __60__ICQUIPhotosHelper_enableCloudPhotosLibraryWithCompletion___block_invoke_1_cold_1((uint64_t)v5, v7);
    }

    uint64_t v8 = *(void *)(a1 + 32);
    id v9 = ICQCreateErrorWithMessage();
    (*(void (**)(uint64_t, void, void *))(v8 + 16))(v8, 0, v9);
  }
}

+ (void)enableCloudPhotosOptimizationWithCompletion:(id)a3
{
  id v3 = (void (**)(id, uint64_t, void))a3;
  if ((PLIsCPLDataclassEnabled() & 1) == 0)
  {
    v6 = _ICQGetLogSystem();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR)) {
      +[ICQUIPhotosHelper enableCloudPhotosOptimizationWithCompletion:](v6);
    }
    goto LABEL_9;
  }
  if ((PLCloudPhotoLibraryKeepOriginalsIsEnabled() & 1) == 0)
  {
    v6 = _ICQGetLogSystem();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      __int16 v11 = 0;
      uint64_t v8 = "Optimize photos already enabled.";
      id v9 = (uint8_t *)&v11;
LABEL_14:
      _os_log_impl(&dword_22C821000, v6, OS_LOG_TYPE_DEFAULT, v8, v9, 2u);
    }
LABEL_15:

    v3[2](v3, 1, 0);
    goto LABEL_16;
  }
  PLCPLSetKeepOriginalsEnabled();
  char IsEnabled = PLCloudPhotoLibraryKeepOriginalsIsEnabled();
  id v5 = _ICQGetLogSystem();
  v6 = v5;
  if ((IsEnabled & 1) == 0)
  {
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      __int16 v10 = 0;
      uint64_t v8 = "Optimize photos enabled successfully.";
      id v9 = (uint8_t *)&v10;
      goto LABEL_14;
    }
    goto LABEL_15;
  }
  if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR)) {
    +[ICQUIPhotosHelper enableCloudPhotosOptimizationWithCompletion:](v6);
  }
LABEL_9:

  v7 = ICQCreateErrorWithMessage();
  ((void (**)(id, uint64_t, void *))v3)[2](v3, 0, v7);

LABEL_16:
}

void __60__ICQUIPhotosHelper_enableCloudPhotosLibraryWithCompletion___block_invoke_cold_1(uint64_t a1, NSObject *a2)
{
  uint64_t v4 = *MEMORY[0x263EF8340];
  int v2 = 138412290;
  uint64_t v3 = a1;
  _os_log_error_impl(&dword_22C821000, a2, OS_LOG_TYPE_ERROR, "Cannot enable iCPL with error: %@", (uint8_t *)&v2, 0xCu);
}

void __60__ICQUIPhotosHelper_enableCloudPhotosLibraryWithCompletion___block_invoke_1_cold_1(uint64_t a1, NSObject *a2)
{
  uint64_t v4 = *MEMORY[0x263EF8340];
  int v2 = 138412290;
  uint64_t v3 = a1;
  _os_log_error_impl(&dword_22C821000, a2, OS_LOG_TYPE_ERROR, "Failed to enable iCPL with error: %@", (uint8_t *)&v2, 0xCu);
}

+ (void)enableCloudPhotosOptimizationWithCompletion:(os_log_t)log .cold.1(os_log_t log)
{
  *(_WORD *)v1 = 0;
  _os_log_error_impl(&dword_22C821000, log, OS_LOG_TYPE_ERROR, "Failed to enable optimize photos.", v1, 2u);
}

+ (void)enableCloudPhotosOptimizationWithCompletion:(os_log_t)log .cold.2(os_log_t log)
{
  *(_WORD *)v1 = 0;
  _os_log_error_impl(&dword_22C821000, log, OS_LOG_TYPE_ERROR, "Attempt to optimize photos when iCloud Photo Library is not enabled.", v1, 2u);
}

@end