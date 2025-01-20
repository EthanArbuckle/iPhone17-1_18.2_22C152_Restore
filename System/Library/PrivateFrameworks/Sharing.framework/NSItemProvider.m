@interface NSItemProvider
@end

@implementation NSItemProvider

void __75__NSItemProvider_Sharing__loadURLClassWithPreviousError_completionHandler___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v2 = *(void *)(a1 + 32);
  v3 = (void *)*MEMORY[0x1E4F444F8];
  id v4 = a2;
  id v5 = [v3 identifier];
  (*(void (**)(uint64_t, id, id, void))(v2 + 16))(v2, v4, v5, 0);
}

void __77__NSItemProvider_Sharing__loadFileURLRequiringOpenInPlace_completionHandler___block_invoke(uint64_t a1, void *a2, int a3, void *a4)
{
  id v7 = a2;
  id v8 = a4;
  if (!v7)
  {
    v10 = framework_log();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR)) {
      __77__NSItemProvider_Sharing__loadFileURLRequiringOpenInPlace_completionHandler___block_invoke_cold_1(a1, (uint64_t)v8, v10);
    }
LABEL_12:

    [*(id *)(a1 + 40) loadURLClassWithPreviousError:v8 completionHandler:*(void *)(a1 + 48)];
    goto LABEL_14;
  }
  if (*(unsigned char *)(a1 + 56)) {
    BOOL v9 = a3 == 0;
  }
  else {
    BOOL v9 = 1;
  }
  if (v9)
  {
    if (!*(unsigned char *)(a1 + 56))
    {
      v13[0] = MEMORY[0x1E4F143A8];
      v13[1] = 3221225472;
      v13[2] = __77__NSItemProvider_Sharing__loadFileURLRequiringOpenInPlace_completionHandler___block_invoke_3;
      v13[3] = &unk_1E5BC0C18;
      id v14 = v7;
      id v16 = *(id *)(a1 + 48);
      id v15 = *(id *)(a1 + 32);
      [v14 coordinateReadingWithSaveToTempDir:1 options:8 completionHandler:v13];

      goto LABEL_14;
    }
    v10 = framework_log();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR)) {
      __77__NSItemProvider_Sharing__loadFileURLRequiringOpenInPlace_completionHandler___block_invoke_cold_2(a1, v10);
    }
    goto LABEL_12;
  }
  uint64_t v11 = *(void *)(a1 + 48);
  v12 = [*(id *)(a1 + 32) identifier];
  (*(void (**)(uint64_t, id, void *, void))(v11 + 16))(v11, v7, v12, 0);

LABEL_14:
}

void __77__NSItemProvider_Sharing__loadFileURLRequiringOpenInPlace_completionHandler___block_invoke_3(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  id v7 = v5;
  if (!v5)
  {
    id v8 = framework_log();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR)) {
      __77__NSItemProvider_Sharing__loadFileURLRequiringOpenInPlace_completionHandler___block_invoke_3_cold_1(a1, (uint64_t)v6, v8);
    }

    id v7 = *(void **)(a1 + 32);
  }
  uint64_t v11 = a1 + 40;
  BOOL v9 = *(void **)(a1 + 40);
  uint64_t v10 = *(void *)(v11 + 8);
  id v12 = v7;
  v13 = [v9 identifier];
  (*(void (**)(uint64_t, id, void *, void))(v10 + 16))(v10, v12, v13, 0);
}

uint64_t __71__NSItemProvider_Sharing__sf_loadSecurityContextWithCompletionHandler___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

void __77__NSItemProvider_Sharing__loadFileURLRequiringOpenInPlace_completionHandler___block_invoke_cold_1(uint64_t a1, uint64_t a2, NSObject *a3)
{
  *(_DWORD *)v3 = 138543618;
  *(void *)&v3[4] = *(void *)(a1 + 32);
  *(_WORD *)&v3[12] = 2114;
  *(void *)&v3[14] = a2;
  OUTLINED_FUNCTION_4_1(&dword_1A5389000, a2, a3, "Could not load representation %{public}@ from the item provider. Error: %{public}@", *(void *)v3, *(void *)&v3[8], *(void *)&v3[16], *MEMORY[0x1E4F143B8]);
}

void __77__NSItemProvider_Sharing__loadFileURLRequiringOpenInPlace_completionHandler___block_invoke_cold_2(uint64_t a1, NSObject *a2)
{
  uint64_t v5 = *MEMORY[0x1E4F143B8];
  uint64_t v2 = *(void *)(a1 + 32);
  int v3 = 138543362;
  uint64_t v4 = v2;
  _os_log_error_impl(&dword_1A5389000, a2, OS_LOG_TYPE_ERROR, "Could not load representation %{public}@ from the item provider for opening in place", (uint8_t *)&v3, 0xCu);
}

void __77__NSItemProvider_Sharing__loadFileURLRequiringOpenInPlace_completionHandler___block_invoke_3_cold_1(uint64_t a1, uint64_t a2, NSObject *a3)
{
  *(_DWORD *)int v3 = 138412546;
  *(void *)&v3[4] = *(void *)(a1 + 32);
  *(_WORD *)&v3[12] = 2112;
  *(void *)&v3[14] = a2;
  OUTLINED_FUNCTION_4_1(&dword_1A5389000, a2, a3, "Failed to save %@ to temp directory with error: %@", *(void *)v3, *(void *)&v3[8], *(void *)&v3[16], *MEMORY[0x1E4F143B8]);
}

@end