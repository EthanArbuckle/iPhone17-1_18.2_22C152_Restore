@interface NPKTapToRadarManager
- (id)_applicationWorkSpace;
- (void)_openTapToRadarWithRequest:(id)a3 completion:(id)a4;
- (void)_requestUserPermissionToFileRadarWithRequest:(id)a3 completion:(id)a4;
- (void)fileRadarWithRequest:(id)a3 requestUserPermission:(BOOL)a4 completion:(id)a5;
@end

@implementation NPKTapToRadarManager

- (void)fileRadarWithRequest:(id)a3 requestUserPermission:(BOOL)a4 completion:(id)a5
{
  BOOL v6 = a4;
  id v8 = a3;
  id v9 = a5;
  if (v6)
  {
    v10[0] = MEMORY[0x263EF8330];
    v10[1] = 3221225472;
    v10[2] = __78__NPKTapToRadarManager_fileRadarWithRequest_requestUserPermission_completion___block_invoke;
    v10[3] = &unk_2644D2B40;
    v10[4] = self;
    id v11 = v8;
    id v12 = v9;
    [(NPKTapToRadarManager *)self _requestUserPermissionToFileRadarWithRequest:v11 completion:v10];
  }
  else
  {
    [(NPKTapToRadarManager *)self _openTapToRadarWithRequest:v8 completion:v9];
  }
}

uint64_t __78__NPKTapToRadarManager_fileRadarWithRequest_requestUserPermission_completion___block_invoke(uint64_t a1, uint64_t a2)
{
  if (a2) {
    return (*(uint64_t (**)(void))(*(void *)(a1 + 48) + 16))();
  }
  else {
    return [*(id *)(a1 + 32) _openTapToRadarWithRequest:*(void *)(a1 + 40) completion:*(void *)(a1 + 48)];
  }
}

- (void)_requestUserPermissionToFileRadarWithRequest:(id)a3 completion:(id)a4
{
  v20[4] = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v7 = a4;
  id v8 = NSString;
  id v9 = [v6 title];
  v10 = [v8 stringWithFormat:@"(Internal Only)\n\nPlease file a radar to help us improve the product.\n\nIssue detected:\n%@", v9];

  uint64_t v11 = *MEMORY[0x263EFFFD8];
  v19[0] = *MEMORY[0x263EFFFC8];
  v19[1] = v11;
  v20[0] = @"Wallet detected an issue";
  v20[1] = v10;
  uint64_t v12 = *MEMORY[0x263EFFFE8];
  v19[2] = *MEMORY[0x263F00000];
  v19[3] = v12;
  v20[2] = @"Tap-To-Radar";
  v20[3] = @"Cancel";
  CFDictionaryRef v13 = [NSDictionary dictionaryWithObjects:v20 forKeys:v19 count:4];
  objc_initWeak(&location, self);
  v15[0] = MEMORY[0x263EF8330];
  v15[1] = 3221225472;
  v15[2] = __80__NPKTapToRadarManager__requestUserPermissionToFileRadarWithRequest_completion___block_invoke;
  v15[3] = &unk_2644D41A8;
  objc_copyWeak(&v17, &location);
  id v14 = v7;
  id v16 = v14;
  NPKPresentUserNotification(v13, v15);

  objc_destroyWeak(&v17);
  objc_destroyWeak(&location);
}

void __80__NPKTapToRadarManager__requestUserPermissionToFileRadarWithRequest_completion___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  objc_copyWeak(&to, (id *)(a1 + 40));
  id v5 = objc_loadWeakRetained(&to);

  if (v5)
  {
    if (a3)
    {
      id v6 = pk_General_log();
      BOOL v7 = os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT);

      if (v7)
      {
        id v8 = pk_General_log();
        if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
        {
          *(_WORD *)id v14 = 0;
          _os_log_impl(&dword_21E92F000, v8, OS_LOG_TYPE_DEFAULT, "Notice: User rejected to Open Tap-To-Radar", v14, 2u);
        }
      }
      uint64_t v9 = *(void *)(a1 + 32);
      v10 = [MEMORY[0x263F087E8] errorWithDomain:@"NPKTapToRadarManagerErrorDomain" code:0 userInfo:0];
      (*(void (**)(uint64_t, void *))(v9 + 16))(v9, v10);
    }
    else
    {
      uint64_t v11 = pk_General_log();
      BOOL v12 = os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT);

      if (v12)
      {
        CFDictionaryRef v13 = pk_General_log();
        if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
        {
          *(_WORD *)buf = 0;
          _os_log_impl(&dword_21E92F000, v13, OS_LOG_TYPE_DEFAULT, "Notice: User accepted to Open Tap-To-Radar", buf, 2u);
        }
      }
      (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
    }
  }
  objc_destroyWeak(&to);
}

- (void)_openTapToRadarWithRequest:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = pk_General_log();
  BOOL v9 = os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT);

  if (v9)
  {
    v10 = pk_General_log();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_21E92F000, v10, OS_LOG_TYPE_DEFAULT, "Notice: Requested to Open Tap-To-Radar", buf, 2u);
    }
  }
  uint64_t v11 = [(NPKTapToRadarManager *)self _applicationWorkSpace];
  BOOL v12 = [v6 tapToRadarURL];
  v15[0] = MEMORY[0x263EF8330];
  v15[1] = 3221225472;
  v15[2] = __62__NPKTapToRadarManager__openTapToRadarWithRequest_completion___block_invoke;
  v15[3] = &unk_2644D41D0;
  id v16 = v6;
  id v17 = v7;
  id v13 = v7;
  id v14 = v6;
  [v11 openURL:v12 configuration:0 completionHandler:v15];
}

void __62__NPKTapToRadarManager__openTapToRadarWithRequest_completion___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  v10[2] = *MEMORY[0x263EF8340];
  id v4 = a3;
  if (v4)
  {
    id v5 = (void *)MEMORY[0x263F087E8];
    v9[0] = @"requestURL";
    id v6 = [*(id *)(a1 + 32) tapToRadarURL];
    v9[1] = *MEMORY[0x263F08608];
    v10[0] = v6;
    v10[1] = v4;
    id v7 = [NSDictionary dictionaryWithObjects:v10 forKeys:v9 count:2];
    id v8 = [v5 errorWithDomain:@"NPKTapToRadarManagerErrorDomain" code:1 userInfo:v7];
  }
  else
  {
    id v8 = 0;
  }
  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
}

- (id)_applicationWorkSpace
{
  return (id)[MEMORY[0x263F01880] defaultWorkspace];
}

@end