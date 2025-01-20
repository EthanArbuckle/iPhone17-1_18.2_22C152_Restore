@interface MSUUpdateBrainAssetLoader
@end

@implementation MSUUpdateBrainAssetLoader

void __150__MSUUpdateBrainAssetLoader_SUCoreBorderMSUUpdateBrainAssetLoader__SUCoreBorder_loadUpdateBrainWithMAOptions_clientOptionsFromPolicy_progressHandler___block_invoke(uint64_t a1, void *a2, void *a3)
{
  uint64_t v35 = *MEMORY[0x263EF8340];
  v5 = a2;
  id v6 = a3;
  v7 = _SUCoreBorder_MSUFunctionAtEnd(@"loadUpdateBrainWithMAOptions", 0);
  v8 = v7;
  if (v7)
  {
    uint64_t v9 = [v7 simAction];
    if (v9 == 3)
    {
      uint64_t v29 = *MEMORY[0x263F55918];
      uint64_t v30 = *MEMORY[0x263F55908];
      v11 = [NSDictionary dictionaryWithObjects:&v30 forKeys:&v29 count:1];
    }
    else
    {
      if (v9 == 1)
      {
        v10 = [v8 buildErrorWithDescription:@"SUCoreError created by SUCoreBorder_loadUpdateBrainWithMAOptions"];
        v11 = 0;
LABEL_10:
        if (*(void *)(a1 + 32))
        {
          v16 = [MEMORY[0x263F77D78] sharedCore];
          v17 = [v16 completionQueue];
          v21[0] = MEMORY[0x263EF8330];
          v21[1] = 3221225472;
          v21[2] = __150__MSUUpdateBrainAssetLoader_SUCoreBorderMSUUpdateBrainAssetLoader__SUCoreBorder_loadUpdateBrainWithMAOptions_clientOptionsFromPolicy_progressHandler___block_invoke_376;
          v21[3] = &unk_2640DC2C0;
          v24 = *(id *)(a1 + 32);
          v22 = v11;
          id v23 = v10;
          dispatch_async(v17, v21);

          v18 = v24;
        }
        else
        {
          v19 = [MEMORY[0x263F77DE8] sharedLogger];
          v18 = [v19 oslog];

          if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = 138543618;
            v32 = v11;
            __int16 v33 = 2114;
            id v34 = v10;
            _os_log_impl(&dword_20C8EA000, v18, OS_LOG_TYPE_DEFAULT, "loadUpdateBrainWithMAOptions completed (no handler), state=%{public}@ error=%{public}@", buf, 0x16u);
          }
        }

        goto LABEL_15;
      }
      v14 = [MEMORY[0x263F77DA8] sharedDiag];
      v15 = (void *)[[NSString alloc] initWithFormat:@"unsupported simulated event action, event: %@", v8];
      [v14 trackAnomaly:@"SUCoreBorder_loadUpdateBrainWithMAOptions" forReason:v15 withResult:8113 withError:0];

      v11 = 0;
    }
    v10 = 0;
    goto LABEL_10;
  }
  if (*(void *)(a1 + 32))
  {
    v12 = [MEMORY[0x263F77D78] sharedCore];
    v13 = [v12 completionQueue];
    block[0] = MEMORY[0x263EF8330];
    block[1] = 3221225472;
    block[2] = __150__MSUUpdateBrainAssetLoader_SUCoreBorderMSUUpdateBrainAssetLoader__SUCoreBorder_loadUpdateBrainWithMAOptions_clientOptionsFromPolicy_progressHandler___block_invoke_2;
    block[3] = &unk_2640DC2C0;
    v28 = *(id *)(a1 + 32);
    v26 = v5;
    id v27 = v6;
    dispatch_async(v13, block);

    v11 = v28;
  }
  else
  {
    v20 = [MEMORY[0x263F77DE8] sharedLogger];
    v11 = [v20 oslog];

    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138543618;
      v32 = v5;
      __int16 v33 = 2114;
      id v34 = v6;
      _os_log_impl(&dword_20C8EA000, v11, OS_LOG_TYPE_DEFAULT, "loadUpdateBrainWithMAOptions completed (no handler), state=%{public}@ error=%{public}@", buf, 0x16u);
    }
  }
LABEL_15:
}

uint64_t __150__MSUUpdateBrainAssetLoader_SUCoreBorderMSUUpdateBrainAssetLoader__SUCoreBorder_loadUpdateBrainWithMAOptions_clientOptionsFromPolicy_progressHandler___block_invoke_2(void *a1)
{
  return (*(uint64_t (**)(void, void, void))(a1[6] + 16))(a1[6], a1[4], a1[5]);
}

uint64_t __150__MSUUpdateBrainAssetLoader_SUCoreBorderMSUUpdateBrainAssetLoader__SUCoreBorder_loadUpdateBrainWithMAOptions_clientOptionsFromPolicy_progressHandler___block_invoke_376(void *a1)
{
  return (*(uint64_t (**)(void, void, void))(a1[6] + 16))(a1[6], a1[4], a1[5]);
}

uint64_t __150__MSUUpdateBrainAssetLoader_SUCoreBorderMSUUpdateBrainAssetLoader__SUCoreBorder_loadUpdateBrainWithMAOptions_clientOptionsFromPolicy_progressHandler___block_invoke_378(void *a1)
{
  return (*(uint64_t (**)(void, void, void))(a1[6] + 16))(a1[6], a1[4], a1[5]);
}

@end