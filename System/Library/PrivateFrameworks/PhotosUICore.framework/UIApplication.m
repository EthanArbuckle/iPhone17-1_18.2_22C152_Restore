@interface UIApplication
@end

@implementation UIApplication

void __72__UIApplication_PhotosUICore__px_navigateToPhotosURL_completionHandler___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  if (a2 != 1)
  {
    v6 = PLUIGetLog();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    {
      uint64_t v7 = *(void *)(a1 + 32);
      int v9 = 138412802;
      uint64_t v10 = v7;
      __int16 v11 = 2048;
      uint64_t v12 = a2;
      __int16 v13 = 2112;
      id v14 = v5;
      _os_log_impl(&dword_1A9AE7000, v6, OS_LOG_TYPE_ERROR, "Failed to navigate to URL: %@ with result: %li error: %@", (uint8_t *)&v9, 0x20u);
    }
  }
  uint64_t v8 = *(void *)(a1 + 40);
  if (v8) {
    (*(void (**)(uint64_t, BOOL, id))(v8 + 16))(v8, a2 == 1, v5);
  }
}

void __72__UIApplication_PhotosUICore__px_navigateToPhotosURL_completionHandler___block_invoke_268(uint64_t a1)
{
  v21[2] = *MEMORY[0x1E4F143B8];
  v2 = [MEMORY[0x1E4F223E0] defaultWorkspace];
  uint64_t v3 = *(void *)(a1 + 32);
  uint64_t v4 = *MEMORY[0x1E4F62688];
  v20[0] = *MEMORY[0x1E4F626A0];
  v20[1] = v4;
  v21[0] = MEMORY[0x1E4F1CC38];
  v21[1] = MEMORY[0x1E4F1CC38];
  id v5 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v21 forKeys:v20 count:2];
  id v15 = 0;
  char v6 = [v2 openSensitiveURL:v3 withOptions:v5 error:&v15];
  id v7 = v15;

  if ((v6 & 1) == 0)
  {
    uint64_t v8 = PLUIGetLog();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    {
      uint64_t v9 = *(void *)(a1 + 32);
      *(_DWORD *)buf = 138412546;
      uint64_t v17 = v9;
      __int16 v18 = 2112;
      id v19 = v7;
      _os_log_impl(&dword_1A9AE7000, v8, OS_LOG_TYPE_ERROR, "Failed to navigate to URL: %@ with error: %@", buf, 0x16u);
    }
  }
  uint64_t v10 = *(void **)(a1 + 40);
  if (v10)
  {
    v11[0] = MEMORY[0x1E4F143A8];
    v11[1] = 3221225472;
    v11[2] = __72__UIApplication_PhotosUICore__px_navigateToPhotosURL_completionHandler___block_invoke_270;
    v11[3] = &unk_1E5DD1758;
    id v13 = v10;
    char v14 = v6;
    id v12 = v7;
    dispatch_async(MEMORY[0x1E4F14428], v11);
  }
}

uint64_t __72__UIApplication_PhotosUICore__px_navigateToPhotosURL_completionHandler___block_invoke_270(uint64_t a1)
{
  return (*(uint64_t (**)(void, void, void))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40), *(unsigned __int8 *)(a1 + 48), *(void *)(a1 + 32));
}

void __80__UIApplication_PhotosUICore__px_navigateToOneUpShowingAsset_completionHandler___block_invoke(uint64_t a1)
{
  v5[1] = *MEMORY[0x1E4F143B8];
  uint64_t v4 = *MEMORY[0x1E4F28568];
  v5[0] = @"Cannot navigate to an asset without a UUID";
  v2 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v5 forKeys:&v4 count:1];
  uint64_t v3 = [MEMORY[0x1E4F28C58] errorWithDomain:@"PXUIApplicationErrorDomain" code:-1 userInfo:v2];
  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
}

@end