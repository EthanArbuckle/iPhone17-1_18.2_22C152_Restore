@interface PHAWallpaperSuggestionUpgradeSession
- (BOOL)beginUpgradeSessionAtURL:(id)a3;
- (BOOL)endUpgradeSessionAtURL:(id)a3;
- (PHAWallpaperSuggestionUpgradeSession)init;
- (id)upgradeSessionURLForPosterConfiguration:(id)a3;
- (void)fetchPosterConfigurationWithAssetDirectory:(id)a3 completion:(id)a4;
- (void)refreshPosterConfiguration:(id)a3 withSessionURL:(id)a4 completion:(id)a5;
- (void)upgradePosterConfiguration:(id)a3 options:(id)a4 completion:(id)a5;
- (void)upgradePosterConfiguration:(id)a3 withSessionURL:(id)a4 localIdentifier:(id)a5 options:(id)a6 completion:(id)a7;
- (void)upgradePosterConfiguration:(id)a3 withSessionURL:(id)a4 options:(id)a5 completion:(id)a6;
- (void)upgradePosterConfigurationWithAssetDirectory:(id)a3 options:(id)a4 completion:(id)a5;
@end

@implementation PHAWallpaperSuggestionUpgradeSession

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_upgradeSessions, 0);
  objc_storeStrong((id *)&self->_queue, 0);
  objc_storeStrong((id *)&self->_loggingConnection, 0);
  objc_storeStrong((id *)&self->_mediaAnalysisService, 0);

  objc_storeStrong((id *)&self->_posterService, 0);
}

- (void)refreshPosterConfiguration:(id)a3 withSessionURL:(id)a4 completion:(id)a5
{
  id v8 = a3;
  id v9 = a5;
  v10 = (objc_class *)MEMORY[0x1E4F92360];
  id v11 = a4;
  id v12 = objc_alloc_init(v10);
  v13 = [v11 path];

  [v12 setIdentifier:v13];
  posterService = self->_posterService;
  v17[0] = MEMORY[0x1E4F143A8];
  v17[1] = 3221225472;
  v17[2] = __93__PHAWallpaperSuggestionUpgradeSession_refreshPosterConfiguration_withSessionURL_completion___block_invoke;
  v17[3] = &unk_1E6917800;
  v17[4] = self;
  id v18 = v8;
  id v19 = v9;
  id v15 = v9;
  id v16 = v8;
  [(PRSService *)posterService refreshPosterConfiguration:v16 sessionInfo:v12 completion:v17];
}

void __93__PHAWallpaperSuggestionUpgradeSession_refreshPosterConfiguration_withSessionURL_completion___block_invoke(void *a1, void *a2, void *a3)
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  id v6 = a3;
  v7 = *(NSObject **)(a1[4] + 24);
  if (!v5)
  {
    if (!os_log_type_enabled(v7, OS_LOG_TYPE_ERROR)) {
      goto LABEL_6;
    }
    id v11 = (void *)a1[5];
    id v9 = v7;
    v10 = [v11 serverUUID];
    int v12 = 138543618;
    v13 = v10;
    __int16 v14 = 2114;
    id v15 = v6;
    _os_log_error_impl(&dword_1D21F2000, v9, OS_LOG_TYPE_ERROR, "Error refreshing poster configuration %{public}@: %{public}@", (uint8_t *)&v12, 0x16u);
    goto LABEL_4;
  }
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    id v8 = (void *)a1[5];
    id v9 = v7;
    v10 = [v8 serverUUID];
    int v12 = 138543362;
    v13 = v10;
    _os_log_impl(&dword_1D21F2000, v9, OS_LOG_TYPE_DEFAULT, "Successfully refreshed poster configuration %{public}@", (uint8_t *)&v12, 0xCu);
LABEL_4:
  }
LABEL_6:
  (*(void (**)(void))(a1[6] + 16))();
}

- (BOOL)endUpgradeSessionAtURL:(id)a3
{
  uint64_t v32 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  uint64_t v24 = 0;
  v25 = &v24;
  uint64_t v26 = 0x2020000000;
  char v27 = 0;
  queue = self->_queue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __63__PHAWallpaperSuggestionUpgradeSession_endUpgradeSessionAtURL___block_invoke;
  block[3] = &unk_1E69178A0;
  block[4] = self;
  id v6 = v4;
  id v22 = v6;
  v23 = &v24;
  dispatch_sync(queue, block);
  if (*((unsigned char *)v25 + 24))
  {
    v7 = [MEMORY[0x1E4F28CB8] defaultManager];
    id v20 = 0;
    int v8 = [v7 removeItemAtURL:v6 error:&v20];
    id v9 = (OS_os_log *)v20;

    v10 = self->_loggingConnection;
    id v11 = v10;
    if (v8)
    {
      if (os_log_type_enabled((os_log_t)v10, OS_LOG_TYPE_INFO))
      {
        int v12 = [v6 path];
        *(_DWORD *)buf = 138543362;
        v29 = v12;
        _os_log_impl(&dword_1D21F2000, v11, OS_LOG_TYPE_INFO, "Successfully removed temporary poster configuration data at %{public}@", buf, 0xCu);
      }
    }
    else if (os_log_type_enabled((os_log_t)v10, OS_LOG_TYPE_ERROR))
    {
      id v19 = [v6 path];
      *(_DWORD *)buf = 138543362;
      v29 = v19;
      _os_log_error_impl(&dword_1D21F2000, v11, OS_LOG_TYPE_ERROR, "Failed to remove temporary poster configuration data at %{public}@", buf, 0xCu);
    }
  }
  else
  {
    id v9 = self->_loggingConnection;
    if (os_log_type_enabled((os_log_t)v9, OS_LOG_TYPE_ERROR))
    {
      v13 = [v6 path];
      *(_DWORD *)buf = 138543362;
      v29 = v13;
      _os_log_error_impl(&dword_1D21F2000, (os_log_t)v9, OS_LOG_TYPE_ERROR, "END upgrade called with unknown session at %{public}@", buf, 0xCu);
    }
  }

  __int16 v14 = self->_loggingConnection;
  if (os_log_type_enabled((os_log_t)v14, OS_LOG_TYPE_INFO))
  {
    id v15 = [v6 path];
    int v16 = *((unsigned __int8 *)v25 + 24);
    *(_DWORD *)buf = 138543618;
    v29 = v15;
    __int16 v30 = 1024;
    int v31 = v16;
    _os_log_impl(&dword_1D21F2000, (os_log_t)v14, OS_LOG_TYPE_INFO, "END upgrade session at %{public}@ (success=%d)", buf, 0x12u);
  }
  BOOL v17 = *((unsigned char *)v25 + 24) != 0;

  _Block_object_dispose(&v24, 8);
  return v17;
}

void __63__PHAWallpaperSuggestionUpgradeSession_endUpgradeSessionAtURL___block_invoke(uint64_t a1)
{
  v2 = *(void **)(*(void *)(a1 + 32) + 40);
  v3 = [*(id *)(a1 + 40) path];
  LODWORD(v2) = [v2 containsObject:v3];

  if (v2)
  {
    id v4 = *(void **)(*(void *)(a1 + 32) + 40);
    id v5 = [*(id *)(a1 + 40) path];
    [v4 removeObject:v5];

    *(unsigned char *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) = 1;
  }
}

- (BOOL)beginUpgradeSessionAtURL:(id)a3
{
  uint64_t v34 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  uint64_t v26 = 0;
  char v27 = &v26;
  uint64_t v28 = 0x2020000000;
  char v29 = 0;
  queue = self->_queue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __65__PHAWallpaperSuggestionUpgradeSession_beginUpgradeSessionAtURL___block_invoke;
  block[3] = &unk_1E69178A0;
  block[4] = self;
  id v6 = v4;
  id v24 = v6;
  v25 = &v26;
  dispatch_sync(queue, block);
  if (*((unsigned char *)v27 + 24))
  {
    v7 = [MEMORY[0x1E4F28CB8] defaultManager];
    int v8 = [v6 path];
    int v9 = [v7 fileExistsAtPath:v8];

    if (v9)
    {
      v10 = [MEMORY[0x1E4F28CB8] defaultManager];
      id v22 = 0;
      int v11 = [v10 removeItemAtURL:v6 error:&v22];
      id v12 = v22;

      v13 = self->_loggingConnection;
      __int16 v14 = v13;
      if (v11)
      {
        if (os_log_type_enabled((os_log_t)v13, OS_LOG_TYPE_INFO))
        {
          id v15 = [v6 path];
          *(_DWORD *)buf = 138543362;
          int v31 = v15;
          _os_log_impl(&dword_1D21F2000, v14, OS_LOG_TYPE_INFO, "Successfully removed temporary poster configuration data at %{public}@", buf, 0xCu);
        }
      }
      else if (os_log_type_enabled((os_log_t)v13, OS_LOG_TYPE_ERROR))
      {
        v21 = [v6 path];
        *(_DWORD *)buf = 138543362;
        int v31 = v21;
        _os_log_error_impl(&dword_1D21F2000, v14, OS_LOG_TYPE_ERROR, "Failed to remove temporary poster configuration data at %{public}@", buf, 0xCu);
      }
    }
  }
  int v16 = self->_loggingConnection;
  if (os_log_type_enabled((os_log_t)v16, OS_LOG_TYPE_INFO))
  {
    BOOL v17 = [v6 path];
    int v18 = *((unsigned __int8 *)v27 + 24);
    *(_DWORD *)buf = 138543618;
    int v31 = v17;
    __int16 v32 = 1024;
    int v33 = v18;
    _os_log_impl(&dword_1D21F2000, (os_log_t)v16, OS_LOG_TYPE_INFO, "BEGIN upgrade session at %{public}@ (success=%d)", buf, 0x12u);
  }
  BOOL v19 = *((unsigned char *)v27 + 24) != 0;

  _Block_object_dispose(&v26, 8);
  return v19;
}

void __65__PHAWallpaperSuggestionUpgradeSession_beginUpgradeSessionAtURL___block_invoke(uint64_t a1)
{
  v2 = *(void **)(*(void *)(a1 + 32) + 40);
  v3 = [*(id *)(a1 + 40) path];
  LOBYTE(v2) = [v2 containsObject:v3];

  if ((v2 & 1) == 0)
  {
    id v4 = *(void **)(*(void *)(a1 + 32) + 40);
    id v5 = [*(id *)(a1 + 40) path];
    [v4 addObject:v5];

    *(unsigned char *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) = 1;
  }
}

- (id)upgradeSessionURLForPosterConfiguration:(id)a3
{
  v3 = [a3 serverUUID];
  id v4 = [v3 UUIDString];

  id v5 = (void *)MEMORY[0x1E4F1CB10];
  id v6 = NSTemporaryDirectory();
  v7 = [v5 fileURLWithPath:v6 isDirectory:1];

  int v8 = [v7 URLByAppendingPathComponent:@"UpgradeSessions"];
  int v9 = [v8 URLByAppendingPathComponent:v4];

  return v9;
}

- (void)upgradePosterConfiguration:(id)a3 withSessionURL:(id)a4 localIdentifier:(id)a5 options:(id)a6 completion:(id)a7
{
  uint64_t v43 = *MEMORY[0x1E4F143B8];
  id v12 = a3;
  id v13 = a5;
  id v14 = a6;
  id v15 = a7;
  int v16 = [a4 URLByAppendingPathComponent:v13];
  BOOL v17 = [MEMORY[0x1E4F28CB8] defaultManager];
  id v36 = 0;
  int v18 = [v17 createDirectoryAtURL:v16 withIntermediateDirectories:1 attributes:0 error:&v36];
  id v19 = v36;

  loggingConnection = self->_loggingConnection;
  if (v18)
  {
    if (os_log_type_enabled(loggingConnection, OS_LOG_TYPE_DEFAULT))
    {
      v21 = loggingConnection;
      id v22 = [v12 serverUUID];
      v23 = [v16 path];
      *(_DWORD *)buf = 138543874;
      v38 = v22;
      __int16 v39 = 2114;
      id v40 = v13;
      __int16 v41 = 2114;
      v42 = v23;
      _os_log_impl(&dword_1D21F2000, v21, OS_LOG_TYPE_DEFAULT, "Upgrading poster configuration %{public}@ with local identifier: %{public}@ to: %{public}@", buf, 0x20u);
    }
    id v24 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
    [v24 setObject:&unk_1F291AB28 forKeyedSubscript:@"WallpaperUpgradeMode"];
    v25 = [v14 objectForKeyedSubscript:@"LayoutConfiguration"];
    [v24 setObject:v25 forKeyedSubscript:@"LayoutConfiguration"];

    uint64_t v26 = [v14 objectForKeyedSubscript:@"LayerStackOptions"];
    [v24 setObject:v26 forKeyedSubscript:@"LayerStackOptions"];

    mediaAnalysisService = self->_mediaAnalysisService;
    uint64_t v28 = [v12 assetDirectory];
    v31[0] = MEMORY[0x1E4F143A8];
    v31[1] = 3221225472;
    v31[2] = __117__PHAWallpaperSuggestionUpgradeSession_upgradePosterConfiguration_withSessionURL_localIdentifier_options_completion___block_invoke;
    v31[3] = &unk_1E6917878;
    v31[4] = self;
    id v32 = v12;
    id v33 = v13;
    id v34 = v16;
    id v35 = v15;
    [(VCPMediaAnalysisService *)mediaAnalysisService requestWallpaperUpgradeAtURL:v28 toDestinationURL:v34 withOptions:v24 andCompletionHandler:v31];
  }
  else
  {
    if (os_log_type_enabled(loggingConnection, OS_LOG_TYPE_ERROR))
    {
      char v29 = loggingConnection;
      __int16 v30 = [v16 path];
      *(_DWORD *)buf = 138543618;
      v38 = v30;
      __int16 v39 = 2114;
      id v40 = v19;
      _os_log_error_impl(&dword_1D21F2000, v29, OS_LOG_TYPE_ERROR, "Failed to create poster upgrade directory: %{public}@, error: %{public}@", buf, 0x16u);
    }
    (*((void (**)(id, id))v15 + 2))(v15, v19);
  }
}

void __117__PHAWallpaperSuggestionUpgradeSession_upgradePosterConfiguration_withSessionURL_localIdentifier_options_completion___block_invoke(uint64_t a1, void *a2, void *a3)
{
  uint64_t v27 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  id v6 = a3;
  v7 = *(NSObject **)(*(void *)(a1 + 32) + 24);
  if (v5)
  {
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      int v8 = *(void **)(a1 + 40);
      int v9 = v7;
      v10 = [v8 serverUUID];
      uint64_t v11 = *(void *)(a1 + 48);
      id v12 = [*(id *)(a1 + 56) path];
      int v19 = 138543874;
      id v20 = v10;
      __int16 v21 = 2114;
      uint64_t v22 = v11;
      __int16 v23 = 2114;
      id v24 = v12;
      _os_log_impl(&dword_1D21F2000, v9, OS_LOG_TYPE_DEFAULT, "Successfully upgraded poster configuration %{public}@ with local identifier: %{public}@ to: %{public}@", (uint8_t *)&v19, 0x20u);
    }
    id v13 = *(void (**)(void))(*(void *)(a1 + 64) + 16);
  }
  else
  {
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      id v14 = *(void **)(a1 + 40);
      id v15 = v7;
      int v16 = [v14 serverUUID];
      uint64_t v17 = *(void *)(a1 + 48);
      int v18 = [*(id *)(a1 + 56) path];
      int v19 = 138544130;
      id v20 = v16;
      __int16 v21 = 2114;
      uint64_t v22 = v17;
      __int16 v23 = 2114;
      id v24 = v18;
      __int16 v25 = 2114;
      id v26 = v6;
      _os_log_error_impl(&dword_1D21F2000, v15, OS_LOG_TYPE_ERROR, "Failed to upgrade poster configuration %{public}@ with local identifier: %{public}@ to: %{public}@, error: %{public}@", (uint8_t *)&v19, 0x2Au);
    }
    id v13 = *(void (**)(void))(*(void *)(a1 + 64) + 16);
  }
  v13();
}

- (void)upgradePosterConfiguration:(id)a3 withSessionURL:(id)a4 options:(id)a5 completion:(id)a6
{
  uint64_t v38 = *MEMORY[0x1E4F143B8];
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  id v27 = a6;
  id v13 = (void *)MEMORY[0x1E4F8CCF8];
  id v14 = [v10 assetDirectory];
  id v34 = 0;
  id v15 = [v13 loadFromURL:v14 error:&v34];
  id v16 = v34;

  if (v15)
  {
    objc_initWeak((id *)location, self);
    uint64_t v17 = [v15 identifier];
    v28[0] = MEMORY[0x1E4F143A8];
    v28[1] = 3221225472;
    v28[2] = __101__PHAWallpaperSuggestionUpgradeSession_upgradePosterConfiguration_withSessionURL_options_completion___block_invoke;
    v28[3] = &unk_1E6917850;
    objc_copyWeak(&v33, (id *)location);
    id v18 = v10;
    id v19 = v10;
    id v20 = v12;
    id v21 = v19;
    id v29 = v19;
    id v30 = v11;
    int v31 = self;
    id v32 = v27;
    id v22 = v21;
    id v12 = v20;
    [(PHAWallpaperSuggestionUpgradeSession *)self upgradePosterConfiguration:v22 withSessionURL:v30 localIdentifier:v17 options:v20 completion:v28];

    id v10 = v18;
    objc_destroyWeak(&v33);
    objc_destroyWeak((id *)location);
  }
  else
  {
    loggingConnection = self->_loggingConnection;
    if (os_log_type_enabled(loggingConnection, OS_LOG_TYPE_ERROR))
    {
      id v24 = loggingConnection;
      __int16 v25 = [v10 assetDirectory];
      id v26 = [v25 path];
      *(_DWORD *)location = 138543618;
      *(void *)&location[4] = v26;
      __int16 v36 = 2114;
      id v37 = v16;
      _os_log_error_impl(&dword_1D21F2000, v24, OS_LOG_TYPE_ERROR, "Failed to load poster configuration from asset directory: '%{public}@', error: %{public}@", location, 0x16u);
    }
    (*((void (**)(id, void, id))v27 + 2))(v27, 0, v16);
  }
}

void __101__PHAWallpaperSuggestionUpgradeSession_upgradePosterConfiguration_withSessionURL_options_completion___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v24 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  if (v3)
  {
    id v4 = *(NSObject **)(*(void *)(a1 + 48) + 24);
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    {
      id v10 = *(void **)(a1 + 32);
      id v11 = v4;
      id v12 = [v10 serverUUID];
      *(_DWORD *)buf = 138543618;
      id v21 = v12;
      __int16 v22 = 2114;
      id v23 = v3;
      _os_log_error_impl(&dword_1D21F2000, v11, OS_LOG_TYPE_ERROR, "Failed to upgrade poster configuration %{public}@, error: %{public}@", buf, 0x16u);
    }
    (*(void (**)(void))(*(void *)(a1 + 56) + 16))();
  }
  else
  {
    id WeakRetained = objc_loadWeakRetained((id *)(a1 + 64));
    id v6 = [*(id *)(a1 + 32) assetDirectory];
    v13[0] = MEMORY[0x1E4F143A8];
    v13[1] = 3221225472;
    v13[2] = __101__PHAWallpaperSuggestionUpgradeSession_upgradePosterConfiguration_withSessionURL_options_completion___block_invoke_2;
    v13[3] = &unk_1E6917828;
    objc_copyWeak(&v19, (id *)(a1 + 64));
    id v14 = *(id *)(a1 + 32);
    id v7 = *(id *)(a1 + 40);
    uint64_t v8 = *(void *)(a1 + 48);
    int v9 = *(void **)(a1 + 56);
    id v15 = v7;
    uint64_t v16 = v8;
    id v17 = 0;
    id v18 = v9;
    [WeakRetained fetchPosterConfigurationWithAssetDirectory:v6 completion:v13];

    objc_destroyWeak(&v19);
  }
}

void __101__PHAWallpaperSuggestionUpgradeSession_upgradePosterConfiguration_withSessionURL_options_completion___block_invoke_2(uint64_t a1, uint64_t a2, void *a3)
{
  uint64_t v30 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  id v6 = v5;
  if (a2)
  {
    id WeakRetained = objc_loadWeakRetained((id *)(a1 + 72));
    uint64_t v8 = *(void **)(a1 + 32);
    uint64_t v9 = *(void *)(a1 + 40);
    v23[0] = MEMORY[0x1E4F143A8];
    v23[1] = 3221225472;
    v23[2] = __101__PHAWallpaperSuggestionUpgradeSession_upgradePosterConfiguration_withSessionURL_options_completion___block_invoke_3;
    v23[3] = &unk_1E6917800;
    v23[4] = *(void *)(a1 + 48);
    id v24 = v8;
    id v25 = *(id *)(a1 + 64);
    [WeakRetained refreshPosterConfiguration:v24 withSessionURL:v9 completion:v23];
  }
  else
  {
    id v10 = [v5 domain];
    int v11 = [v10 isEqualToString:@"com.apple.photoanalysis"];

    id v12 = *(NSObject **)(*(void *)(a1 + 48) + 24);
    if (v11)
    {
      if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
      {
        id v13 = *(void **)(a1 + 32);
        id v14 = v12;
        id v15 = [v13 assetDirectory];
        uint64_t v16 = [v15 path];
        *(_DWORD *)buf = 138543362;
        id v27 = v16;
        _os_log_impl(&dword_1D21F2000, v14, OS_LOG_TYPE_DEFAULT, "Poster configuration at: %{public}@ is out of date, discarding...", buf, 0xCu);
      }
      id v17 = *(void (**)(void))(*(void *)(a1 + 64) + 16);
    }
    else
    {
      if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
      {
        id v18 = *(void **)(a1 + 32);
        id v19 = v12;
        id v20 = [v18 assetDirectory];
        id v21 = [v20 path];
        uint64_t v22 = *(void *)(a1 + 56);
        *(_DWORD *)buf = 138543618;
        id v27 = v21;
        __int16 v28 = 2114;
        uint64_t v29 = v22;
        _os_log_error_impl(&dword_1D21F2000, v19, OS_LOG_TYPE_ERROR, "Failed to reload poster configuration at: %{public}@, error: %{public}@", buf, 0x16u);
      }
      id v17 = *(void (**)(void))(*(void *)(a1 + 64) + 16);
    }
    v17();
  }
}

void __101__PHAWallpaperSuggestionUpgradeSession_upgradePosterConfiguration_withSessionURL_options_completion___block_invoke_3(void *a1, void *a2, void *a3)
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  id v6 = a3;
  id v7 = *(NSObject **)(a1[4] + 24);
  if (v5)
  {
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v8 = (void *)a1[5];
      uint64_t v9 = v7;
      id v10 = [v8 serverUUID];
      int v11 = [v5 assetDirectory];
      int v16 = 138543618;
      id v17 = v10;
      __int16 v18 = 2114;
      id v19 = v11;
      _os_log_impl(&dword_1D21F2000, v9, OS_LOG_TYPE_DEFAULT, "Successfully refreshed poster configuration %{public}@ to: %{public}@", (uint8_t *)&v16, 0x16u);
    }
    id v12 = *(void (**)(void))(a1[6] + 16);
  }
  else
  {
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      id v13 = (void *)a1[5];
      id v14 = v7;
      id v15 = [v13 serverUUID];
      int v16 = 138543618;
      id v17 = v15;
      __int16 v18 = 2114;
      id v19 = v6;
      _os_log_error_impl(&dword_1D21F2000, v14, OS_LOG_TYPE_ERROR, "Failed to refresh poster configuration %{public}@, error: %{public}@", (uint8_t *)&v16, 0x16u);
    }
    id v12 = *(void (**)(void))(a1[6] + 16);
  }
  v12();
}

- (void)upgradePosterConfiguration:(id)a3 options:(id)a4 completion:(id)a5
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  int v11 = [(PHAWallpaperSuggestionUpgradeSession *)self upgradeSessionURLForPosterConfiguration:v8];
  if ([(PHAWallpaperSuggestionUpgradeSession *)self beginUpgradeSessionAtURL:v11])
  {
    v16[0] = MEMORY[0x1E4F143A8];
    v16[1] = 3221225472;
    v16[2] = __86__PHAWallpaperSuggestionUpgradeSession_upgradePosterConfiguration_options_completion___block_invoke;
    v16[3] = &unk_1E6917A38;
    v16[4] = self;
    id v17 = v11;
    id v18 = v10;
    [(PHAWallpaperSuggestionUpgradeSession *)self upgradePosterConfiguration:v8 withSessionURL:v17 options:v9 completion:v16];
  }
  else
  {
    loggingConnection = self->_loggingConnection;
    if (os_log_type_enabled(loggingConnection, OS_LOG_TYPE_DEFAULT))
    {
      id v13 = loggingConnection;
      id v14 = [v11 path];
      *(_DWORD *)buf = 138543362;
      uint64_t v20 = v14;
      _os_log_impl(&dword_1D21F2000, v13, OS_LOG_TYPE_DEFAULT, "Poster configuration upgrade session already in progress at %{public}@, aborting...", buf, 0xCu);
    }
    id v15 = objc_msgSend(MEMORY[0x1E4F28C58], "pl_analysisErrorWithCode:localizedDescription:", 14, @"Poster configuration upgrade session already in progress");
    (*((void (**)(id, void, void *))v10 + 2))(v10, 0, v15);
  }
}

void __86__PHAWallpaperSuggestionUpgradeSession_upgradePosterConfiguration_options_completion___block_invoke(void *a1, uint64_t a2, void *a3)
{
  id v4 = (void *)a1[4];
  uint64_t v5 = a1[5];
  id v6 = a3;
  [v4 endUpgradeSessionAtURL:v5];
  (*(void (**)(void))(a1[6] + 16))();
}

- (void)fetchPosterConfigurationWithAssetDirectory:(id)a3 completion:(id)a4
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  loggingConnection = self->_loggingConnection;
  if (os_log_type_enabled(loggingConnection, OS_LOG_TYPE_DEFAULT))
  {
    id v9 = loggingConnection;
    id v10 = [v6 path];
    *(_DWORD *)buf = 138543362;
    id v18 = v10;
    _os_log_impl(&dword_1D21F2000, v9, OS_LOG_TYPE_DEFAULT, "Fetching poster configuration with asset directory: %{public}@", buf, 0xCu);
  }
  posterService = self->_posterService;
  v14[0] = MEMORY[0x1E4F143A8];
  v14[1] = 3221225472;
  v14[2] = __94__PHAWallpaperSuggestionUpgradeSession_fetchPosterConfigurationWithAssetDirectory_completion___block_invoke;
  v14[3] = &unk_1E69177D8;
  v14[4] = self;
  id v15 = v6;
  id v16 = v7;
  id v12 = v7;
  id v13 = v6;
  [(PRSService *)posterService fetchPosterConfigurationsForExtension:@"com.apple.PhotosUIPrivate.PhotosPosterProvider" completion:v14];
}

void __94__PHAWallpaperSuggestionUpgradeSession_fetchPosterConfigurationWithAssetDirectory_completion___block_invoke(uint64_t a1, void *a2, void *a3)
{
  uint64_t v41 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  id v6 = a3;
  uint64_t v7 = *(void *)(a1 + 32);
  id v8 = *(NSObject **)(v7 + 24);
  if (v5)
  {
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      id v9 = v8;
      *(_DWORD *)buf = 134217984;
      uint64_t v38 = [v5 count];
      _os_log_impl(&dword_1D21F2000, v9, OS_LOG_TYPE_DEFAULT, "Successfully fetched %lu poster configurations", buf, 0xCu);

      uint64_t v7 = *(void *)(a1 + 32);
    }
    aBlock[0] = MEMORY[0x1E4F143A8];
    aBlock[1] = 3221225472;
    aBlock[2] = __94__PHAWallpaperSuggestionUpgradeSession_fetchPosterConfigurationWithAssetDirectory_completion___block_invoke_16;
    aBlock[3] = &unk_1E6917788;
    aBlock[4] = v7;
    id v10 = (void (**)(void *, void))_Block_copy(aBlock);
    int v11 = v10[2](v10, *(void *)(a1 + 40));
    v32[0] = MEMORY[0x1E4F143A8];
    v32[1] = 3221225472;
    v32[2] = __94__PHAWallpaperSuggestionUpgradeSession_fetchPosterConfigurationWithAssetDirectory_completion___block_invoke_18;
    v32[3] = &unk_1E69177B0;
    id v12 = v10;
    id v35 = v12;
    id v13 = v11;
    id v33 = v13;
    id v34 = *(id *)(a1 + 40);
    uint64_t v14 = [v5 indexOfObjectPassingTest:v32];
    if (v14 == 0x7FFFFFFFFFFFFFFFLL)
    {
      id v15 = *(NSObject **)(*(void *)(a1 + 32) + 24);
      if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
      {
        __int16 v28 = *(void **)(a1 + 40);
        uint64_t v29 = v15;
        uint64_t v30 = [v28 path];
        *(_DWORD *)buf = 138543362;
        uint64_t v38 = (uint64_t)v30;
        _os_log_error_impl(&dword_1D21F2000, v29, OS_LOG_TYPE_ERROR, "Couldn't find poster configuration with asset directory: %{public}@", buf, 0xCu);
      }
      id v16 = (void *)MEMORY[0x1E4F28C58];
      id v17 = NSString;
      id v18 = [*(id *)(a1 + 40) path];
      uint64_t v19 = [v17 stringWithFormat:@"Couldn't find poster configuration with asset directory: %@", v18];
      uint64_t v20 = objc_msgSend(v16, "pl_analysisErrorWithCode:localizedDescription:", 9, v19);

      uint64_t v21 = *(void (**)(void))(*(void *)(a1 + 48) + 16);
    }
    else
    {
      uint64_t v20 = [v5 objectAtIndexedSubscript:v14];
      uint64_t v22 = *(NSObject **)(*(void *)(a1 + 32) + 24);
      if (os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT))
      {
        id v23 = v22;
        id v24 = [v20 assetDirectory];
        [v24 path];
        v25 = id v31 = v6;
        id v26 = [v20 serverUUID];
        id v27 = [v26 UUIDString];
        *(_DWORD *)buf = 138543618;
        uint64_t v38 = (uint64_t)v25;
        __int16 v39 = 2114;
        id v40 = v27;
        _os_log_impl(&dword_1D21F2000, v23, OS_LOG_TYPE_DEFAULT, "Found poster configuration with asset directory: %{public}@, identifier: %{public}@", buf, 0x16u);

        id v6 = v31;
      }
      uint64_t v21 = *(void (**)(void))(*(void *)(a1 + 48) + 16);
    }
    v21();
  }
  else
  {
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138543362;
      uint64_t v38 = (uint64_t)v6;
      _os_log_error_impl(&dword_1D21F2000, v8, OS_LOG_TYPE_ERROR, "Failed to fetch poster configurations: %{public}@", buf, 0xCu);
    }
    (*(void (**)(void))(*(void *)(a1 + 48) + 16))();
  }
}

id __94__PHAWallpaperSuggestionUpgradeSession_fetchPosterConfigurationWithAssetDirectory_completion___block_invoke_16(uint64_t a1, void *a2)
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  id v10 = 0;
  uint64_t v4 = *MEMORY[0x1E4F1C5A0];
  id v9 = 0;
  [v3 getResourceValue:&v10 forKey:v4 error:&v9];
  id v5 = v10;
  id v6 = v9;
  if (v6)
  {
    uint64_t v7 = *(NSObject **)(*(void *)(a1 + 32) + 24);
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138543362;
      id v12 = v3;
      _os_log_error_impl(&dword_1D21F2000, v7, OS_LOG_TYPE_ERROR, "Failed to get resource identifier for URL: %{public}@", buf, 0xCu);
    }
  }

  return v5;
}

uint64_t __94__PHAWallpaperSuggestionUpgradeSession_fetchPosterConfigurationWithAssetDirectory_completion___block_invoke_18(void *a1, void *a2)
{
  id v3 = [a2 assetDirectory];
  uint64_t v4 = (*(void (**)(void))(a1[6] + 16))();
  id v5 = v4;
  uint64_t v6 = a1[4];
  if (v6) {
    BOOL v7 = v4 == 0;
  }
  else {
    BOOL v7 = 1;
  }
  if (v7)
  {
    uint64_t v6 = a1[5];
    uint64_t v4 = v3;
  }
  uint64_t v8 = [v4 isEqual:v6];

  return v8;
}

- (void)upgradePosterConfigurationWithAssetDirectory:(id)a3 options:(id)a4 completion:(id)a5
{
  uint64_t v25 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  loggingConnection = self->_loggingConnection;
  if (os_log_type_enabled(loggingConnection, OS_LOG_TYPE_INFO))
  {
    id v12 = loggingConnection;
    uint64_t v13 = [v8 path];
    *(_DWORD *)buf = 138543362;
    id v24 = v13;
    _os_log_impl(&dword_1D21F2000, v12, OS_LOG_TYPE_INFO, "Request to upgrade poster configuration at: %{public}@", buf, 0xCu);
  }
  objc_initWeak((id *)buf, self);
  v17[0] = MEMORY[0x1E4F143A8];
  v17[1] = 3221225472;
  v17[2] = __104__PHAWallpaperSuggestionUpgradeSession_upgradePosterConfigurationWithAssetDirectory_options_completion___block_invoke;
  v17[3] = &unk_1E6917760;
  objc_copyWeak(&v22, (id *)buf);
  id v14 = v9;
  id v18 = v14;
  id v15 = v10;
  id v21 = v15;
  uint64_t v19 = self;
  id v16 = v8;
  id v20 = v16;
  [(PHAWallpaperSuggestionUpgradeSession *)self fetchPosterConfigurationWithAssetDirectory:v16 completion:v17];

  objc_destroyWeak(&v22);
  objc_destroyWeak((id *)buf);
}

void __104__PHAWallpaperSuggestionUpgradeSession_upgradePosterConfigurationWithAssetDirectory_options_completion___block_invoke(uint64_t a1, void *a2, void *a3)
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  id v6 = a3;
  if (v5)
  {
    id WeakRetained = objc_loadWeakRetained((id *)(a1 + 64));
    [WeakRetained upgradePosterConfiguration:v5 options:*(void *)(a1 + 32) completion:*(void *)(a1 + 56)];
  }
  else
  {
    id v8 = *(NSObject **)(*(void *)(a1 + 40) + 24);
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    {
      id v9 = *(void **)(a1 + 48);
      id v10 = v8;
      int v11 = [v9 path];
      int v12 = 138543618;
      uint64_t v13 = v11;
      __int16 v14 = 2114;
      id v15 = v6;
      _os_log_error_impl(&dword_1D21F2000, v10, OS_LOG_TYPE_ERROR, "Failed to load poster configuration at: %{public}@, error: %{public}@", (uint8_t *)&v12, 0x16u);
    }
    (*(void (**)(void))(*(void *)(a1 + 56) + 16))();
  }
}

- (PHAWallpaperSuggestionUpgradeSession)init
{
  v16.receiver = self;
  v16.super_class = (Class)PHAWallpaperSuggestionUpgradeSession;
  v2 = [(PHAWallpaperSuggestionUpgradeSession *)&v16 init];
  if (v2)
  {
    id v3 = (PRSService *)objc_alloc_init(MEMORY[0x1E4F92380]);
    posterService = v2->_posterService;
    v2->_posterService = v3;

    uint64_t v5 = [MEMORY[0x1E4F744E8] analysisService];
    mediaAnalysisService = v2->_mediaAnalysisService;
    v2->_mediaAnalysisService = (VCPMediaAnalysisService *)v5;

    os_log_t v7 = os_log_create("com.apple.photoanalysisd", "PHAWallpaperSuggestionUpgradeSession");
    loggingConnection = v2->_loggingConnection;
    v2->_loggingConnection = (OS_os_log *)v7;

    id v9 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    id v10 = dispatch_queue_attr_make_with_qos_class(v9, QOS_CLASS_UTILITY, 0);

    dispatch_queue_t v11 = dispatch_queue_create("com.apple.PHAWallpaperSuggestionUpgradeSession", v10);
    queue = v2->_queue;
    v2->_queue = (OS_dispatch_queue *)v11;

    uint64_t v13 = (NSMutableSet *)objc_alloc_init(MEMORY[0x1E4F1CA80]);
    upgradeSessions = v2->_upgradeSessions;
    v2->_upgradeSessions = v13;
  }
  return v2;
}

@end