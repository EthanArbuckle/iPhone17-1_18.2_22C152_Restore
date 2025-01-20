@interface MSUUpdateBrainAssetLoader
- (BOOL)cancel:(id *)a3;
- (BOOL)purgeUpdateBrains:(id *)a3;
- (MAAsset)updateAsset;
- (MSUUpdateBrainAssetLoader)initWithUpdateAsset:(id)a3;
- (int64_t)requiredDiskSpace:(id *)a3;
- (void)adjustMAOptions:(id)a3 completion:(id)a4;
- (void)adjustOptions:(id)a3 completion:(id)a4;
- (void)dealloc;
- (void)loadUpdateBrainWithMAOptions:(id)a3 clientOptionsFromPolicy:(id)a4 progressHandler:(id)a5;
- (void)loadUpdateBrainWithMAOptions:(id)a3 progressHandler:(id)a4;
- (void)loadUpdateBrainWithOptions:(id)a3 progressHandler:(id)a4;
- (void)setUpdateAsset:(id)a3;
@end

@implementation MSUUpdateBrainAssetLoader

- (MSUUpdateBrainAssetLoader)initWithUpdateAsset:(id)a3
{
  v6.receiver = self;
  v6.super_class = (Class)MSUUpdateBrainAssetLoader;
  v4 = [(MSUUpdateBrainAssetLoader *)&v6 init];
  if (v4) {
    v4->_updateAsset = (MAAsset *)a3;
  }
  return v4;
}

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)MSUUpdateBrainAssetLoader;
  [(MSUUpdateBrainLoader *)&v3 dealloc];
}

- (void)loadUpdateBrainWithMAOptions:(id)a3 progressHandler:(id)a4
{
}

- (void)loadUpdateBrainWithMAOptions:(id)a3 clientOptionsFromPolicy:(id)a4 progressHandler:(id)a5
{
  uint64_t v14 = *MEMORY[0x263EF8340];
  v9 = objc_msgSend((id)objc_msgSend(MEMORY[0x263F77DE8], "sharedLogger"), "oslog");
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543362;
    v13 = @"loadUpdateBrainWithMAOptions";
    _os_log_impl(&dword_21C4A9000, v9, OS_LOG_TYPE_DEFAULT, "[BRAIN_LOADER] %{public}@ | BEGIN", buf, 0xCu);
  }
  global_queue = dispatch_get_global_queue(17, 0);
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __98__MSUUpdateBrainAssetLoader_loadUpdateBrainWithMAOptions_clientOptionsFromPolicy_progressHandler___block_invoke;
  block[3] = &unk_2644043C8;
  block[4] = a4;
  block[5] = self;
  block[6] = @"loadUpdateBrainWithMAOptions";
  block[7] = a3;
  block[8] = a5;
  dispatch_async(global_queue, block);
}

void __98__MSUUpdateBrainAssetLoader_loadUpdateBrainWithMAOptions_clientOptionsFromPolicy_progressHandler___block_invoke(uint64_t a1)
{
  v25[1] = *MEMORY[0x263EF8340];
  id v21 = 0;
  v2 = (void *)[MEMORY[0x263EFF9A0] dictionary];
  objc_super v3 = (void *)[MEMORY[0x263EFF9A0] dictionary];
  uint64_t v4 = *(void *)(a1 + 32);
  if (v4) {
    [v2 setObject:v4 forKey:@"ClientOptions"];
  }
  if ([*(id *)(a1 + 40) updateAsset])
  {
    if (objc_msgSend((id)objc_msgSend(*(id *)(a1 + 40), "updateAsset"), "attributes"))
    {
      objc_msgSend(v2, "setObject:forKey:", objc_msgSend((id)objc_msgSend(*(id *)(a1 + 40), "updateAsset"), "attributes"), @"AssetProperties");
    }
    else
    {
      v5 = objc_msgSend((id)objc_msgSend(MEMORY[0x263F77DE8], "sharedLogger"), "oslog");
      if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR)) {
        __98__MSUUpdateBrainAssetLoader_loadUpdateBrainWithMAOptions_clientOptionsFromPolicy_progressHandler___block_invoke_cold_2(a1, v5, v6, v7, v8, v9, v10, v11);
      }
    }
  }
  uint64_t v12 = *(void *)(a1 + 56);
  if (v12) {
    [v3 setObject:v12 forKey:@"DownloadOptions"];
  }
  v20[0] = MEMORY[0x263EF8330];
  v20[1] = 3221225472;
  v20[2] = __98__MSUUpdateBrainAssetLoader_loadUpdateBrainWithMAOptions_clientOptionsFromPolicy_progressHandler___block_invoke_14;
  v20[3] = &unk_2644043A0;
  uint64_t v14 = *(void *)(a1 + 48);
  v13 = (uint64_t *)(a1 + 48);
  uint64_t v15 = v13[2];
  v20[4] = v14;
  v20[5] = v15;
  int v16 = perform_se_command_with_progress("LoadMABrain", v2, 0, (uint64_t)v3, 0, (const __CFString **)&v21, (uint64_t)v20);
  uint64_t v17 = v13[2];
  if (v16)
  {
    uint64_t v24 = *MEMORY[0x263F55918];
    v25[0] = *MEMORY[0x263F55908];
    (*(void (**)(uint64_t, uint64_t, void))(v17 + 16))(v17, [NSDictionary dictionaryWithObjects:v25 forKeys:&v24 count:1], 0);
    v18 = objc_msgSend((id)objc_msgSend(MEMORY[0x263F77DE8], "sharedLogger"), "oslog");
    if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v19 = *v13;
      *(_DWORD *)buf = 138543362;
      uint64_t v23 = v19;
      _os_log_impl(&dword_21C4A9000, v18, OS_LOG_TYPE_DEFAULT, "[BRAIN_LOADER] %{public}@ | SUCCESS", buf, 0xCu);
    }
  }
  else
  {
    (*(void (**)(uint64_t, void, id))(v17 + 16))(v17, 0, v21);
    if (os_log_type_enabled((os_log_t)objc_msgSend((id)objc_msgSend(MEMORY[0x263F77DE8], "sharedLogger"), "oslog"), OS_LOG_TYPE_ERROR))
    {
      __98__MSUUpdateBrainAssetLoader_loadUpdateBrainWithMAOptions_clientOptionsFromPolicy_progressHandler___block_invoke_cold_1();
    }
  }
}

uint64_t __98__MSUUpdateBrainAssetLoader_loadUpdateBrainWithMAOptions_clientOptionsFromPolicy_progressHandler___block_invoke_14(uint64_t a1, uint64_t a2)
{
  uint64_t v15 = *MEMORY[0x263EF8340];
  uint64_t v4 = *(void *)(a1 + 40);
  v5 = objc_msgSend((id)objc_msgSend(MEMORY[0x263F77DE8], "sharedLogger"), "oslog");
  BOOL v6 = os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT);
  if (v4)
  {
    if (v6)
    {
      uint64_t v7 = *(void *)(a1 + 32);
      int v11 = 138543618;
      uint64_t v12 = v7;
      __int16 v13 = 2114;
      uint64_t v14 = a2;
      uint64_t v8 = "[BRAIN_LOADER] %{public}@ | PROGRESS (not calling progress handler) | state:%{public}@";
LABEL_6:
      _os_log_impl(&dword_21C4A9000, v5, OS_LOG_TYPE_DEFAULT, v8, (uint8_t *)&v11, 0x16u);
    }
  }
  else if (v6)
  {
    uint64_t v9 = *(void *)(a1 + 32);
    int v11 = 138543618;
    uint64_t v12 = v9;
    __int16 v13 = 2114;
    uint64_t v14 = a2;
    uint64_t v8 = "[BRAIN_LOADER] %{public}@ | PROGRESS (no progress handler) | state:%{public}@";
    goto LABEL_6;
  }
  return 0;
}

- (void)loadUpdateBrainWithOptions:(id)a3 progressHandler:(id)a4
{
  uint64_t v12 = *MEMORY[0x263EF8340];
  uint64_t v7 = objc_msgSend((id)objc_msgSend(MEMORY[0x263F77DE8], "sharedLogger"), "oslog");
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543362;
    int v11 = @"loadUpdateBrainWithOptions";
    _os_log_impl(&dword_21C4A9000, v7, OS_LOG_TYPE_DEFAULT, "[BRAIN_LOADER] %{public}@ | BEGIN", buf, 0xCu);
  }
  global_queue = dispatch_get_global_queue(17, 0);
  v9[0] = MEMORY[0x263EF8330];
  v9[1] = 3221225472;
  v9[2] = __72__MSUUpdateBrainAssetLoader_loadUpdateBrainWithOptions_progressHandler___block_invoke;
  v9[3] = &unk_2644043F0;
  v9[4] = self;
  v9[5] = @"loadUpdateBrainWithOptions";
  v9[6] = a3;
  v9[7] = a4;
  dispatch_async(global_queue, v9);
}

void __72__MSUUpdateBrainAssetLoader_loadUpdateBrainWithOptions_progressHandler___block_invoke(uint64_t a1)
{
  v23[1] = *MEMORY[0x263EF8340];
  id v19 = 0;
  v2 = (void *)[MEMORY[0x263EFF9A0] dictionary];
  if ([*(id *)(a1 + 32) updateAsset])
  {
    if (objc_msgSend((id)objc_msgSend(*(id *)(a1 + 32), "updateAsset"), "attributes"))
    {
      objc_msgSend(v2, "setObject:forKey:", objc_msgSend((id)objc_msgSend(*(id *)(a1 + 32), "updateAsset"), "attributes"), @"AssetProperties");
    }
    else
    {
      objc_super v3 = objc_msgSend((id)objc_msgSend(MEMORY[0x263F77DE8], "sharedLogger"), "oslog");
      if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR)) {
        __72__MSUUpdateBrainAssetLoader_loadUpdateBrainWithOptions_progressHandler___block_invoke_cold_2(a1, v3, v4, v5, v6, v7, v8, v9);
      }
    }
  }
  uint64_t v10 = *(void *)(a1 + 48);
  if (v10) {
    [v2 setObject:v10 forKey:@"ClientOptions"];
  }
  v18[0] = MEMORY[0x263EF8330];
  v18[1] = 3221225472;
  v18[2] = __72__MSUUpdateBrainAssetLoader_loadUpdateBrainWithOptions_progressHandler___block_invoke_22;
  v18[3] = &unk_2644043A0;
  uint64_t v12 = *(void *)(a1 + 40);
  int v11 = (uint64_t *)(a1 + 40);
  uint64_t v13 = v11[2];
  v18[4] = v12;
  v18[5] = v13;
  int v14 = perform_command_with_progress("LoadBrain", v2, 0, 0, (const __CFString **)&v19, (uint64_t)v18);
  uint64_t v15 = v11[2];
  if (v14)
  {
    uint64_t v22 = *MEMORY[0x263F55918];
    v23[0] = *MEMORY[0x263F55908];
    (*(void (**)(uint64_t, uint64_t, void))(v15 + 16))(v15, [NSDictionary dictionaryWithObjects:v23 forKeys:&v22 count:1], 0);
    int v16 = objc_msgSend((id)objc_msgSend(MEMORY[0x263F77DE8], "sharedLogger"), "oslog");
    if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v17 = *v11;
      *(_DWORD *)buf = 138543362;
      uint64_t v21 = v17;
      _os_log_impl(&dword_21C4A9000, v16, OS_LOG_TYPE_DEFAULT, "[BRAIN_LOADER] %{public}@ | SUCCESS", buf, 0xCu);
    }
  }
  else
  {
    (*(void (**)(uint64_t, void, id))(v15 + 16))(v15, 0, v19);
    if (os_log_type_enabled((os_log_t)objc_msgSend((id)objc_msgSend(MEMORY[0x263F77DE8], "sharedLogger"), "oslog"), OS_LOG_TYPE_ERROR))
    {
      __98__MSUUpdateBrainAssetLoader_loadUpdateBrainWithMAOptions_clientOptionsFromPolicy_progressHandler___block_invoke_cold_1();
    }
  }
}

uint64_t __72__MSUUpdateBrainAssetLoader_loadUpdateBrainWithOptions_progressHandler___block_invoke_22(uint64_t a1, uint64_t a2)
{
  uint64_t v14 = *MEMORY[0x263EF8340];
  uint64_t v4 = *(void *)(a1 + 40);
  uint64_t v5 = objc_msgSend((id)objc_msgSend(MEMORY[0x263F77DE8], "sharedLogger"), "oslog");
  BOOL v6 = os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT);
  if (v4)
  {
    if (v6)
    {
      uint64_t v7 = *(void *)(a1 + 32);
      int v10 = 138543618;
      uint64_t v11 = v7;
      __int16 v12 = 2114;
      uint64_t v13 = a2;
      _os_log_impl(&dword_21C4A9000, v5, OS_LOG_TYPE_DEFAULT, "[BRAIN_LOADER] %{public}@ | PROGRESS (calling progress handler) | state:%{public}@", (uint8_t *)&v10, 0x16u);
    }
    (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
  }
  else if (v6)
  {
    uint64_t v8 = *(void *)(a1 + 32);
    int v10 = 138543618;
    uint64_t v11 = v8;
    __int16 v12 = 2114;
    uint64_t v13 = a2;
    _os_log_impl(&dword_21C4A9000, v5, OS_LOG_TYPE_DEFAULT, "[BRAIN_LOADER] %{public}@ | PROGRESS (no progress handler) | state:%{public}@", (uint8_t *)&v10, 0x16u);
  }
  return 0;
}

- (BOOL)cancel:(id *)a3
{
  uint64_t v15 = *MEMORY[0x263EF8340];
  uint64_t v5 = objc_msgSend((id)objc_msgSend(MEMORY[0x263F77DE8], "sharedLogger"), "oslog");
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543362;
    uint64_t v14 = @"cancel";
    _os_log_impl(&dword_21C4A9000, v5, OS_LOG_TYPE_DEFAULT, "[BRAIN_LOADER] %{public}@ | BEGIN", buf, 0xCu);
  }
  uint64_t v12 = [(MAAsset *)[(MSUUpdateBrainAssetLoader *)self updateAsset] attributes];
  int v6 = perform_command("CancelLoadBrain", (void *)[NSDictionary dictionaryWithObjects:&v12 forKeys:&v11 count:1], 0, 0, (CFTypeRef *)a3);
  if (a3) {
    id v7 = *a3;
  }
  uint64_t v8 = objc_msgSend((id)objc_msgSend(MEMORY[0x263F77DE8], "sharedLogger"), "oslog");
  uint64_t v9 = v8;
  if (v6)
  {
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138543362;
      uint64_t v14 = @"cancel";
      _os_log_impl(&dword_21C4A9000, v9, OS_LOG_TYPE_DEFAULT, "[BRAIN_LOADER] %{public}@ | SUCCESS", buf, 0xCu);
    }
  }
  else if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
  {
    -[MSUUpdateBrainAssetLoader cancel:]();
  }
  return v6;
}

- (void)adjustMAOptions:(id)a3 completion:(id)a4
{
  uint64_t v12 = *MEMORY[0x263EF8340];
  id v7 = objc_msgSend((id)objc_msgSend(MEMORY[0x263F77DE8], "sharedLogger"), "oslog");
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543362;
    uint64_t v11 = @"adjustMAOptions";
    _os_log_impl(&dword_21C4A9000, v7, OS_LOG_TYPE_DEFAULT, "[BRAIN_LOADER] %{public}@ | BEGIN", buf, 0xCu);
  }
  global_queue = dispatch_get_global_queue(25, 0);
  v9[0] = MEMORY[0x263EF8330];
  v9[1] = 3221225472;
  v9[2] = __56__MSUUpdateBrainAssetLoader_adjustMAOptions_completion___block_invoke;
  v9[3] = &unk_2644043F0;
  v9[4] = a3;
  v9[5] = @"adjustMAOptions";
  v9[6] = self;
  v9[7] = a4;
  dispatch_async(global_queue, v9);
}

uint64_t __56__MSUUpdateBrainAssetLoader_adjustMAOptions_completion___block_invoke(uint64_t a1)
{
  v22[1] = *MEMORY[0x263EF8340];
  id v16 = 0;
  if (*(void *)(a1 + 32))
  {
    if ([*(id *)(a1 + 48) updateAsset])
    {
      uint64_t v21 = @"AssetProperties";
      v22[0] = objc_msgSend((id)objc_msgSend(*(id *)(a1 + 48), "updateAsset"), "attributes");
      v2 = (void *)[NSDictionary dictionaryWithObjects:v22 forKeys:&v21 count:1];
    }
    else
    {
      v2 = 0;
    }
    uint64_t v10 = *(void *)(a1 + 32);
    id v19 = @"DownloadConfig";
    uint64_t v20 = v10;
    int v11 = perform_se_command("MAAdjustLoadBrainOptions", v2, 0, [NSDictionary dictionaryWithObjects:&v20 forKeys:&v19 count:1], 0, (CFTypeRef *)&v16);
    uint64_t v12 = objc_msgSend((id)objc_msgSend(MEMORY[0x263F77DE8], "sharedLogger"), "oslog");
    uint64_t v13 = v12;
    if (v11)
    {
      if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
      {
        uint64_t v14 = *(void *)(a1 + 40);
        *(_DWORD *)buf = 138543362;
        uint64_t v18 = v14;
        _os_log_impl(&dword_21C4A9000, v13, OS_LOG_TYPE_DEFAULT, "[BRAIN_LOADER] %{public}@ | SUCCESS", buf, 0xCu);
      }
    }
    else if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
    {
      __56__MSUUpdateBrainAssetLoader_adjustMAOptions_completion___block_invoke_cold_2();
    }
  }
  else
  {
    objc_super v3 = objc_msgSend((id)objc_msgSend(MEMORY[0x263F77DE8], "sharedLogger"), "oslog");
    if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR)) {
      __56__MSUUpdateBrainAssetLoader_adjustMAOptions_completion___block_invoke_cold_1(a1, v3, v4, v5, v6, v7, v8, v9);
    }
  }
  return (*(uint64_t (**)(void, id))(*(void *)(a1 + 56) + 16))(*(void *)(a1 + 56), v16);
}

- (void)adjustOptions:(id)a3 completion:(id)a4
{
  uint64_t v12 = *MEMORY[0x263EF8340];
  uint64_t v7 = objc_msgSend((id)objc_msgSend(MEMORY[0x263F77DE8], "sharedLogger"), "oslog");
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543362;
    int v11 = @"adjustOptions";
    _os_log_impl(&dword_21C4A9000, v7, OS_LOG_TYPE_DEFAULT, "[BRAIN_LOADER] %{public}@ | BEGIN", buf, 0xCu);
  }
  global_queue = dispatch_get_global_queue(17, 0);
  v9[0] = MEMORY[0x263EF8330];
  v9[1] = 3221225472;
  v9[2] = __54__MSUUpdateBrainAssetLoader_adjustOptions_completion___block_invoke;
  v9[3] = &unk_2644043F0;
  v9[4] = a3;
  v9[5] = self;
  v9[6] = @"adjustOptions";
  v9[7] = a4;
  dispatch_async(global_queue, v9);
}

uint64_t __54__MSUUpdateBrainAssetLoader_adjustOptions_completion___block_invoke(void *a1)
{
  v13[2] = *MEMORY[0x263EF8340];
  id v9 = 0;
  uint64_t v3 = a1[4];
  v2 = (void *)a1[5];
  v12[0] = @"ClientOptions";
  v12[1] = @"AssetProperties";
  v13[0] = v3;
  v13[1] = objc_msgSend((id)objc_msgSend(v2, "updateAsset"), "attributes");
  int v4 = perform_command("AdjustLoadBrainOptions", (void *)[NSDictionary dictionaryWithObjects:v13 forKeys:v12 count:2], 0, 0, (CFTypeRef *)&v9);
  uint64_t v5 = objc_msgSend((id)objc_msgSend(MEMORY[0x263F77DE8], "sharedLogger"), "oslog");
  uint64_t v6 = v5;
  if (v4)
  {
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v7 = a1[6];
      *(_DWORD *)buf = 138543362;
      uint64_t v11 = v7;
      _os_log_impl(&dword_21C4A9000, v6, OS_LOG_TYPE_DEFAULT, "[BRAIN_LOADER] %{public}@ | SUCCESS", buf, 0xCu);
    }
  }
  else if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
  {
    __54__MSUUpdateBrainAssetLoader_adjustOptions_completion___block_invoke_cold_1();
  }
  return (*(uint64_t (**)(void, id))(a1[7] + 16))(a1[7], v9);
}

- (BOOL)purgeUpdateBrains:(id *)a3
{
  uint64_t v11 = *MEMORY[0x263EF8340];
  int v4 = objc_msgSend((id)objc_msgSend(MEMORY[0x263F77DE8], "sharedLogger"), "oslog");
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    int v9 = 138543362;
    uint64_t v10 = @"purgeUpdateBrains";
    _os_log_impl(&dword_21C4A9000, v4, OS_LOG_TYPE_DEFAULT, "[BRAIN_LOADER] %{public}@ | BEGIN", (uint8_t *)&v9, 0xCu);
  }
  char v5 = perform_command("PurgeBrains", 0, 0, 0, (CFTypeRef *)a3);
  if (a3)
  {
    id v6 = *a3;
    if (os_log_type_enabled((os_log_t)objc_msgSend((id)objc_msgSend(MEMORY[0x263F77DE8], "sharedLogger"), "oslog"), OS_LOG_TYPE_ERROR))
    {
      -[MSUUpdateBrainAssetLoader purgeUpdateBrains:]();
    }
  }
  else
  {
    uint64_t v7 = objc_msgSend((id)objc_msgSend(MEMORY[0x263F77DE8], "sharedLogger"), "oslog");
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      int v9 = 138543362;
      uint64_t v10 = @"purgeUpdateBrains";
      _os_log_impl(&dword_21C4A9000, v7, OS_LOG_TYPE_DEFAULT, "[BRAIN_LOADER] %{public}@ | SUCCESS", (uint8_t *)&v9, 0xCu);
    }
  }
  return v5;
}

- (int64_t)requiredDiskSpace:(id *)a3
{
  v36[1] = *MEMORY[0x263EF8340];
  char v5 = objc_msgSend((id)objc_msgSend(MEMORY[0x263F77DE8], "sharedLogger"), "oslog");
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543362;
    v32 = @"requiredDiskSpace";
    _os_log_impl(&dword_21C4A9000, v5, OS_LOG_TYPE_DEFAULT, "[BRAIN_LOADER] %{public}@ | BEGIN", buf, 0xCu);
  }
  if ([(MAAsset *)[(MSUUpdateBrainAssetLoader *)self updateAsset] attributes])
  {
    v35 = @"AssetProperties";
    v36[0] = [(MAAsset *)[(MSUUpdateBrainAssetLoader *)self updateAsset] attributes];
    id v6 = (void *)[NSDictionary dictionaryWithObjects:v36 forKeys:&v35 count:1];
  }
  else
  {
    id v6 = 0;
  }
  id v30 = 0;
  char v7 = perform_command("RequiredDiskSpace", v6, 0, (const __CFString **)&v30, (CFTypeRef *)a3);
  id v8 = v30;
  if (a3)
  {
    id v9 = *a3;
    if ((v7 & 1) == 0)
    {
      if (os_log_type_enabled((os_log_t)objc_msgSend((id)objc_msgSend(MEMORY[0x263F77DE8], "sharedLogger"), "oslog"), OS_LOG_TYPE_ERROR))
      {
        -[MSUUpdateBrainAssetLoader requiredDiskSpace:]();
      }
      return -1;
    }
  }
  else if ((v7 & 1) == 0)
  {
    uint64_t v22 = objc_msgSend((id)objc_msgSend(MEMORY[0x263F77DE8], "sharedLogger"), "oslog");
    if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR)) {
      -[MSUUpdateBrainAssetLoader requiredDiskSpace:](v22, v23, v24, v25, v26, v27, v28, v29);
    }
    return -1;
  }
  objc_opt_class();
  char isKindOfClass = objc_opt_isKindOfClass();
  uint64_t v11 = objc_msgSend((id)objc_msgSend(MEMORY[0x263F77DE8], "sharedLogger"), "oslog");
  uint64_t v12 = v11;
  if ((isKindOfClass & 1) == 0)
  {
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR)) {
      -[MSUUpdateBrainAssetLoader requiredDiskSpace:](v12, v15, v16, v17, v18, v19, v20, v21);
    }
    return -1;
  }
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v13 = [v30 longLongValue];
    *(_DWORD *)buf = 138543618;
    v32 = @"requiredDiskSpace";
    __int16 v33 = 2048;
    uint64_t v34 = v13;
    _os_log_impl(&dword_21C4A9000, v12, OS_LOG_TYPE_DEFAULT, "[BRAIN_LOADER] %{public}@ | SUCCESS | Required disk space: %llu bytes", buf, 0x16u);
  }
  return [v30 longLongValue];
}

- (MAAsset)updateAsset
{
  return self->_updateAsset;
}

- (void)setUpdateAsset:(id)a3
{
}

void __98__MSUUpdateBrainAssetLoader_loadUpdateBrainWithMAOptions_clientOptionsFromPolicy_progressHandler___block_invoke_cold_1()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_21C4A9000, v0, v1, "[BRAIN_LOADER] %{public}@ | FAILURE | error:%{public}@");
}

void __98__MSUUpdateBrainAssetLoader_loadUpdateBrainWithMAOptions_clientOptionsFromPolicy_progressHandler___block_invoke_cold_2(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void __72__MSUUpdateBrainAssetLoader_loadUpdateBrainWithOptions_progressHandler___block_invoke_cold_2(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

- (void)cancel:.cold.1()
{
  int v2 = 138543618;
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0(&dword_21C4A9000, v0, v1, "[BRAIN_LOADER] %{public}@ | FAILURE | error:%{public}@", v2);
}

void __56__MSUUpdateBrainAssetLoader_adjustMAOptions_completion___block_invoke_cold_1(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void __56__MSUUpdateBrainAssetLoader_adjustMAOptions_completion___block_invoke_cold_2()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_21C4A9000, v0, v1, "[BRAIN_LOADER] %{public}@ | FAILURE | command kCommandBrainLoaderMAAdjustOptions failed, error:%{public}@");
}

void __54__MSUUpdateBrainAssetLoader_adjustOptions_completion___block_invoke_cold_1()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_21C4A9000, v0, v1, "[BRAIN_LOADER] %{public}@ | FAILURE | command kCommandBrainLoaderAdjustOptions failed, error:%{public}@");
}

- (void)purgeUpdateBrains:.cold.1()
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_4(&dword_21C4A9000, v0, v1, "[BRAIN_LOADER] %{public}@ | FAILURE | command kCommandBrainLoaderPurge failed, error:%{public}@", v2, v3, v4, v5, 2u);
}

- (void)requiredDiskSpace:(uint64_t)a3 .cold.1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

- (void)requiredDiskSpace:(uint64_t)a3 .cold.2(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

- (void)requiredDiskSpace:.cold.3()
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_4(&dword_21C4A9000, v0, v1, "[BRAIN_LOADER] %{public}@ | FAILURE | Required disk space check failed, error:%{public}@", v2, v3, v4, v5, 2u);
}

@end