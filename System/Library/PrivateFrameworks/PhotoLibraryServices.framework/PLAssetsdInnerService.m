@interface PLAssetsdInnerService
- (PLAssetsdInnerService)initWithPermissions:(id)a3 requiredLibraryServicesState:(int64_t)a4 lazyService:(id)a5;
- (id)instantiateInnerService;
- (void)_awaitForRequiredLibraryStateWithContext:(id)a3 completionHandler:(id)a4;
- (void)getInnerServiceWithContext:(id)a3 reply:(id)a4;
@end

@implementation PLAssetsdInnerService

- (PLAssetsdInnerService)initWithPermissions:(id)a3 requiredLibraryServicesState:(int64_t)a4 lazyService:(id)a5
{
  id v8 = a3;
  id v9 = a5;
  v15.receiver = self;
  v15.super_class = (Class)PLAssetsdInnerService;
  v10 = [(PLAssetsdInnerService *)&v15 init];
  if (v10)
  {
    uint64_t v11 = [v8 copy];
    permissions = v10->_permissions;
    v10->_permissions = (PLAssetsdServicePermissions *)v11;

    v10->_requiredState = a4;
    objc_storeStrong((id *)&v10->_lazyService, a5);
    v13 = v10;
  }

  return v10;
}

- (void)getInnerServiceWithContext:(id)a3 reply:(id)a4
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  v7 = (void (**)(id, void, void *))a4;
  [(PLAssetsdServicePermissions *)self->_permissions refreshCachedAuthorizationsWithContext:v6];
  id v8 = [(PLAssetsdServicePermissions *)self->_permissions verifyPermissionsWithContext:v6];
  if (v8)
  {
    id v9 = PLGatekeeperXPCGetLog();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      v10 = [v6 clientDebugDescription];
      *(_DWORD *)buf = 138412546;
      v16 = v8;
      __int16 v17 = 2114;
      v18 = v10;
      _os_log_impl(&dword_19B3C7000, v9, OS_LOG_TYPE_ERROR, "Verify permissions error: %@ for client: %{public}@", buf, 0x16u);
    }
    v7[2](v7, 0, v8);
  }
  else
  {
    v11[0] = MEMORY[0x1E4F143A8];
    v11[1] = 3221225472;
    v11[2] = __58__PLAssetsdInnerService_getInnerServiceWithContext_reply___block_invoke;
    v11[3] = &unk_1E5875B30;
    id v12 = v6;
    v13 = self;
    v14 = v7;
    [(PLAssetsdInnerService *)self _awaitForRequiredLibraryStateWithContext:v12 completionHandler:v11];
  }
}

- (void)_awaitForRequiredLibraryStateWithContext:(id)a3 completionHandler:(id)a4
{
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  v7 = (void (**)(id, void *))a4;
  id v8 = [v6 shutdownReason];
  if (v8)
  {
    id v9 = PLGatekeeperXPCGetLog();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      v20 = v8;
      _os_log_impl(&dword_19B3C7000, v9, OS_LOG_TYPE_DEFAULT, "Library is shutting down: %@", buf, 0xCu);
    }

    v7[2](v7, v8);
  }
  else
  {
    int64_t requiredState = self->_requiredState;
    uint64_t v11 = PLGatekeeperXPCGetLog();
    BOOL v12 = os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG);
    if (requiredState)
    {
      if (v12)
      {
        v13 = PLStringFromLibraryServicesState();
        v14 = [v6 clientDebugDescription];
        *(_DWORD *)buf = 138412546;
        v20 = v13;
        __int16 v21 = 2112;
        v22 = v14;
        _os_log_impl(&dword_19B3C7000, v11, OS_LOG_TYPE_DEBUG, "Waiting for library services manager state: %@ for client: %@", buf, 0x16u);
      }
      int64_t v15 = self->_requiredState;
      v17[0] = MEMORY[0x1E4F143A8];
      v17[1] = 3221225472;
      v17[2] = __84__PLAssetsdInnerService__awaitForRequiredLibraryStateWithContext_completionHandler___block_invoke;
      v17[3] = &unk_1E5874DE8;
      v18 = v7;
      [v6 awaitLibraryState:v15 completionHandler:v17];
    }
    else
    {
      if (v12)
      {
        v16 = [v6 clientDebugDescription];
        *(_DWORD *)buf = 138412290;
        v20 = v16;
        _os_log_impl(&dword_19B3C7000, v11, OS_LOG_TYPE_DEBUG, "No required library services manager state for client: %@", buf, 0xCu);
      }
      v7[2](v7, 0);
    }
  }
}

uint64_t __84__PLAssetsdInnerService__awaitForRequiredLibraryStateWithContext_completionHandler___block_invoke(uint64_t a1, int a2, uint64_t a3)
{
  uint64_t v3 = *(void *)(a1 + 32);
  if (a2) {
    uint64_t v4 = 0;
  }
  else {
    uint64_t v4 = a3;
  }
  return (*(uint64_t (**)(uint64_t, uint64_t))(v3 + 16))(v3, v4);
}

void __58__PLAssetsdInnerService_getInnerServiceWithContext_reply___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  if (v3)
  {
    uint64_t v4 = PLGatekeeperXPCGetLog();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    {
      v5 = [*(id *)(a1 + 32) clientDebugDescription];
      *(_DWORD *)buf = 138412546;
      id v18 = v3;
      __int16 v19 = 2114;
      v20 = v5;
      _os_log_impl(&dword_19B3C7000, v4, OS_LOG_TYPE_ERROR, "Await for required library state error: %@ for client: %{public}@", buf, 0x16u);
    }
    (*(void (**)(void))(*(void *)(a1 + 48) + 16))();
  }
  else
  {
    id v6 = [*(id *)(*(void *)(a1 + 40) + 24) objectValue];
    v7 = PLGatekeeperXPCGetLog();
    id v8 = v7;
    if (v6)
    {
      if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
      {
        id v9 = [*(id *)(a1 + 32) clientDebugDescription];
        *(_DWORD *)buf = 138412546;
        id v18 = v6;
        __int16 v19 = 2112;
        v20 = v9;
        _os_log_impl(&dword_19B3C7000, v8, OS_LOG_TYPE_DEBUG, "Sending back service: %@ for client: %@", buf, 0x16u);
      }
      (*(void (**)(void))(*(void *)(a1 + 48) + 16))();
    }
    else
    {
      if (os_log_type_enabled(v7, OS_LOG_TYPE_FAULT))
      {
        v10 = [*(id *)(a1 + 32) clientDebugDescription];
        *(_DWORD *)buf = 138412290;
        id v18 = v10;
        _os_log_impl(&dword_19B3C7000, v8, OS_LOG_TYPE_FAULT, "assetsd service could not be initialized for client: %@", buf, 0xCu);
      }
      uint64_t v11 = (void *)MEMORY[0x1E4F28C58];
      uint64_t v12 = *MEMORY[0x1E4F8C500];
      uint64_t v15 = *MEMORY[0x1E4F28568];
      v16 = @"assetsd service could not be initialized";
      v13 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v16 forKeys:&v15 count:1];
      v14 = [v11 errorWithDomain:v12 code:46501 userInfo:v13];

      (*(void (**)(void))(*(void *)(a1 + 48) + 16))();
    }
  }
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_lazyService, 0);
  objc_storeStrong((id *)&self->_permissions, 0);
}

- (id)instantiateInnerService
{
  return (id)[(PLLazyObject *)self->_lazyService objectValue];
}

@end