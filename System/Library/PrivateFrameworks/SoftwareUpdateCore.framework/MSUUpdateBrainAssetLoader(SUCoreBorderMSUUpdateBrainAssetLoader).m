@interface MSUUpdateBrainAssetLoader(SUCoreBorderMSUUpdateBrainAssetLoader)
- (void)SUCoreBorder_loadUpdateBrainWithMAOptions:()SUCoreBorderMSUUpdateBrainAssetLoader clientOptionsFromPolicy:progressHandler:;
@end

@implementation MSUUpdateBrainAssetLoader(SUCoreBorderMSUUpdateBrainAssetLoader)

- (void)SUCoreBorder_loadUpdateBrainWithMAOptions:()SUCoreBorderMSUUpdateBrainAssetLoader clientOptionsFromPolicy:progressHandler:
{
  v33[1] = *MEMORY[0x263EF8340];
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  v11 = _SUCoreBorder_MSUFunctionAtBegin(@"loadUpdateBrainWithMAOptions", 0);
  v12 = v11;
  if (v11)
  {
    uint64_t v13 = [v11 simAction];
    if (v13 == 3)
    {
      uint64_t v32 = *MEMORY[0x263F55918];
      v33[0] = *MEMORY[0x263F55908];
      v15 = [NSDictionary dictionaryWithObjects:v33 forKeys:&v32 count:1];
    }
    else
    {
      if (v13 == 1)
      {
        v14 = [v12 buildErrorWithDescription:@"SUCoreError created by SUCoreBorder_loadUpdateBrainWithMAOptions"];
        v15 = 0;
        if (!v10) {
          goto LABEL_5;
        }
        goto LABEL_11;
      }
      v18 = [MEMORY[0x263F77DA8] sharedDiag];
      v19 = (void *)[[NSString alloc] initWithFormat:@"unsupported simulated event action, event: %@", v12];
      [v18 trackAnomaly:@"SUCoreBorder_loadUpdateBrainWithMAOptions" forReason:v19 withResult:8113 withError:0];

      v15 = 0;
    }
    v14 = 0;
    if (!v10)
    {
LABEL_5:
      v16 = [MEMORY[0x263F77DE8] sharedLogger];
      v17 = [v16 oslog];

      if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138543618;
        v29 = v15;
        __int16 v30 = 2114;
        v31 = v14;
        _os_log_impl(&dword_20C8EA000, v17, OS_LOG_TYPE_DEFAULT, "loadUpdateBrainWithMAOptions completed (no handler), state=%{public}@ error=%{public}@", buf, 0x16u);
      }
      goto LABEL_12;
    }
LABEL_11:
    v20 = [MEMORY[0x263F77D78] sharedCore];
    v21 = [v20 completionQueue];
    block[0] = MEMORY[0x263EF8330];
    block[1] = 3221225472;
    block[2] = __150__MSUUpdateBrainAssetLoader_SUCoreBorderMSUUpdateBrainAssetLoader__SUCoreBorder_loadUpdateBrainWithMAOptions_clientOptionsFromPolicy_progressHandler___block_invoke_378;
    block[3] = &unk_2640DC2C0;
    v25 = v10;
    id v23 = v15;
    id v24 = v14;
    dispatch_async(v21, block);

    v17 = v25;
LABEL_12:

    goto LABEL_13;
  }
  v26[0] = MEMORY[0x263EF8330];
  v26[1] = 3221225472;
  v26[2] = __150__MSUUpdateBrainAssetLoader_SUCoreBorderMSUUpdateBrainAssetLoader__SUCoreBorder_loadUpdateBrainWithMAOptions_clientOptionsFromPolicy_progressHandler___block_invoke;
  v26[3] = &unk_2640DC2E8;
  id v27 = v10;
  [a1 loadUpdateBrainWithMAOptions:v8 clientOptionsFromPolicy:v9 progressHandler:v26];
  v15 = v27;
LABEL_13:
}

@end