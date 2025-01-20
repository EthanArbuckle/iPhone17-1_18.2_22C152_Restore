@interface SBCPlaybackPositionService
+ (Class)XPCServiceInterfaceClass;
+ (id)serviceForSyncDomain:(id)a3;
+ (id)serviceForValueDomain:(id)a3;
- (BOOL)usingPlaybackPositions;
- (SBCPlaybackPositionDomain)playbackPositionDomain;
- (SBCPlaybackPositionService)initWithPlaybackPositionDomain:(id)a3;
- (void)deletePlaybackPositionEntities;
- (void)deletePlaybackPositionEntity:(id)a3;
- (void)persistPlaybackPositionEntity:(id)a3 isCheckpoint:(BOOL)a4 completionBlock:(id)a5;
- (void)pullLocalPlaybackPositionForEntityIdentifiers:(id)a3 completionBlock:(id)a4;
- (void)pullPlaybackPositionEntity:(id)a3 completionBlock:(id)a4;
- (void)pushPlaybackPositionEntity:(id)a3 completionBlock:(id)a4;
- (void)synchronizeImmediatelyWithCompletionHandler:(id)a3;
- (void)updateForeignDatabaseWithValuesFromPlaybackPositionEntity:(id)a3;
@end

@implementation SBCPlaybackPositionService

- (void).cxx_destruct
{
}

- (BOOL)usingPlaybackPositions
{
  return self->_usingPlaybackPositions;
}

- (SBCPlaybackPositionDomain)playbackPositionDomain
{
  return self->_playbackPositionDomain;
}

- (void)pushPlaybackPositionEntity:(id)a3 completionBlock:(id)a4
{
  id v6 = a4;
  v7 = (void *)MEMORY[0x263F89260];
  id v8 = a3;
  v9 = [v7 sharedService];
  v10 = [v8 iTunesCloudEntity];

  v12[0] = MEMORY[0x263EF8330];
  v12[1] = 3221225472;
  v12[2] = __73__SBCPlaybackPositionService_pushPlaybackPositionEntity_completionBlock___block_invoke;
  v12[3] = &unk_264CAD380;
  v12[4] = self;
  id v13 = v6;
  id v11 = v6;
  [v9 pushPlaybackPositionEntity:v10 completionBlock:v12];
}

void __73__SBCPlaybackPositionService_pushPlaybackPositionEntity_completionBlock___block_invoke(uint64_t a1, uint64_t a2, void *a3, void *a4)
{
  uint64_t v24 = *MEMORY[0x263EF8340];
  id v7 = a3;
  id v8 = a4;
  v9 = os_log_create("com.apple.amp.StoreBookkeeperClient", "Default");
  v10 = v9;
  if (v7)
  {
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      uint64_t v11 = *(void *)(a1 + 32);
      v12 = objc_msgSend(v7, "msv_description");
      int v16 = 138544130;
      uint64_t v17 = v11;
      __int16 v18 = 1024;
      int v19 = a2;
      __int16 v20 = 2114;
      id v21 = v8;
      __int16 v22 = 2114;
      v23 = v12;
      _os_log_impl(&dword_23674F000, v10, OS_LOG_TYPE_ERROR, "%{public}@ pushPlaybackPositionEntity completed. success=%{BOOL}u entity=%{public}@ error=%{public}@", (uint8_t *)&v16, 0x26u);
    }
  }
  else if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v13 = *(void *)(a1 + 32);
    int v16 = 138543874;
    uint64_t v17 = v13;
    __int16 v18 = 1024;
    int v19 = a2;
    __int16 v20 = 2114;
    id v21 = v8;
    _os_log_impl(&dword_23674F000, v10, OS_LOG_TYPE_DEFAULT, "%{public}@ pushPlaybackPositionEntity completed. success=%{BOOL}u entity=%{public}@", (uint8_t *)&v16, 0x1Cu);
  }

  uint64_t v14 = *(void *)(a1 + 40);
  if (v14)
  {
    v15 = [v8 sbcEntity];
    (*(void (**)(uint64_t, uint64_t, id, void *))(v14 + 16))(v14, a2, v7, v15);
  }
}

- (void)pullPlaybackPositionEntity:(id)a3 completionBlock:(id)a4
{
  id v6 = a4;
  id v7 = (void *)MEMORY[0x263F89260];
  id v8 = a3;
  v9 = [v7 sharedService];
  v10 = [v8 iTunesCloudEntity];

  v12[0] = MEMORY[0x263EF8330];
  v12[1] = 3221225472;
  v12[2] = __73__SBCPlaybackPositionService_pullPlaybackPositionEntity_completionBlock___block_invoke;
  v12[3] = &unk_264CAD380;
  v12[4] = self;
  id v13 = v6;
  id v11 = v6;
  [v9 pullPlaybackPositionEntity:v10 completionBlock:v12];
}

void __73__SBCPlaybackPositionService_pullPlaybackPositionEntity_completionBlock___block_invoke(uint64_t a1, uint64_t a2, void *a3, void *a4)
{
  uint64_t v24 = *MEMORY[0x263EF8340];
  id v7 = a3;
  id v8 = a4;
  v9 = os_log_create("com.apple.amp.StoreBookkeeperClient", "Default");
  v10 = v9;
  if (v7)
  {
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      uint64_t v11 = *(void *)(a1 + 32);
      v12 = objc_msgSend(v7, "msv_description");
      int v16 = 138544130;
      uint64_t v17 = v11;
      __int16 v18 = 1024;
      int v19 = a2;
      __int16 v20 = 2114;
      id v21 = v8;
      __int16 v22 = 2114;
      v23 = v12;
      _os_log_impl(&dword_23674F000, v10, OS_LOG_TYPE_ERROR, "%{public}@ pullPlaybackPositionEntity completed. success=%{BOOL}u entity=%{public}@ error=%{public}@", (uint8_t *)&v16, 0x26u);
    }
  }
  else if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v13 = *(void *)(a1 + 32);
    int v16 = 138543874;
    uint64_t v17 = v13;
    __int16 v18 = 1024;
    int v19 = a2;
    __int16 v20 = 2114;
    id v21 = v8;
    _os_log_impl(&dword_23674F000, v10, OS_LOG_TYPE_DEFAULT, "%{public}@ pullPlaybackPositionEntity completed. success=%{BOOL}u entity=%{public}@", (uint8_t *)&v16, 0x1Cu);
  }

  uint64_t v14 = *(void *)(a1 + 40);
  if (v14)
  {
    v15 = [v8 sbcEntity];
    (*(void (**)(uint64_t, uint64_t, id, void *))(v14 + 16))(v14, a2, v7, v15);
  }
}

- (void)pullLocalPlaybackPositionForEntityIdentifiers:(id)a3 completionBlock:(id)a4
{
  id v6 = a4;
  id v7 = (void *)MEMORY[0x263F89260];
  id v8 = a3;
  v9 = [v7 sharedService];
  v10 = [(SBCPlaybackPositionDomain *)self->_playbackPositionDomain domainIdentifier];
  uint64_t v11 = [MEMORY[0x263F57448] autoupdatingSharedLibrary];
  v12 = [v11 libraryUID];
  v14[0] = MEMORY[0x263EF8330];
  v14[1] = 3221225472;
  v14[2] = __92__SBCPlaybackPositionService_pullLocalPlaybackPositionForEntityIdentifiers_completionBlock___block_invoke;
  v14[3] = &unk_264CAD358;
  v14[4] = self;
  id v15 = v6;
  id v13 = v6;
  [v9 getLocalPlaybackPositionForEntityIdentifiers:v8 forDomain:v10 fromLibraryWithIdentifier:v12 completionBlock:v14];
}

void __92__SBCPlaybackPositionService_pullLocalPlaybackPositionForEntityIdentifiers_completionBlock___block_invoke(uint64_t a1, uint64_t a2, void *a3, void *a4)
{
  uint64_t v28 = *MEMORY[0x263EF8340];
  id v7 = a3;
  id v8 = a4;
  v9 = os_log_create("com.apple.amp.StoreBookkeeperClient", "Default");
  v10 = v9;
  if (v7)
  {
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      uint64_t v11 = *(void *)(a1 + 32);
      uint64_t v12 = [v8 count];
      id v13 = objc_msgSend(v7, "msv_description");
      *(_DWORD *)buf = 138544130;
      uint64_t v21 = v11;
      __int16 v22 = 2048;
      uint64_t v23 = v12;
      __int16 v24 = 1024;
      int v25 = a2;
      __int16 v26 = 2114;
      v27 = v13;
      _os_log_impl(&dword_23674F000, v10, OS_LOG_TYPE_ERROR, "%{public}@ pullLocalPlaybackPositionForEntityIdentifiers completed with %lu entities. success=%{BOOL}u error=%{public}@", buf, 0x26u);
    }
  }
  else if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v14 = *(void *)(a1 + 32);
    *(_DWORD *)buf = 138543874;
    uint64_t v21 = v14;
    __int16 v22 = 2048;
    uint64_t v23 = [v8 count];
    __int16 v24 = 1024;
    int v25 = a2;
    _os_log_impl(&dword_23674F000, v10, OS_LOG_TYPE_DEFAULT, "%{public}@ pullLocalPlaybackPositionForEntityIdentifiers completed with %lu entities. success=%{BOOL}u", buf, 0x1Cu);
  }

  id v15 = [MEMORY[0x263EFF980] array];
  v18[0] = MEMORY[0x263EF8330];
  v18[1] = 3221225472;
  v18[2] = __92__SBCPlaybackPositionService_pullLocalPlaybackPositionForEntityIdentifiers_completionBlock___block_invoke_7;
  v18[3] = &unk_264CAD330;
  id v16 = v15;
  id v19 = v16;
  [v8 enumerateObjectsUsingBlock:v18];
  uint64_t v17 = *(void *)(a1 + 40);
  if (v17) {
    (*(void (**)(uint64_t, uint64_t, id, id))(v17 + 16))(v17, a2, v7, v16);
  }
}

void __92__SBCPlaybackPositionService_pullLocalPlaybackPositionForEntityIdentifiers_completionBlock___block_invoke_7(uint64_t a1, void *a2)
{
  v2 = *(void **)(a1 + 32);
  id v3 = [a2 sbcEntity];
  [v2 addObject:v3];
}

- (void)synchronizeImmediatelyWithCompletionHandler:(id)a3
{
  id v9 = a3;
  v4 = [MEMORY[0x263F89260] sharedService];
  v5 = [MEMORY[0x263F57448] autoupdatingSharedLibrary];
  id v6 = [v5 libraryUID];
  id v7 = [(SBCPlaybackPositionDomain *)self->_playbackPositionDomain domainIdentifier];
  [v4 synchronizePlaybackPositionsForLibraryWithIdentifier:v6 forDomain:v7 isCheckpoint:0];

  id v8 = v9;
  if (v9)
  {
    (*((void (**)(id, uint64_t, void))v9 + 2))(v9, 1, 0);
    id v8 = v9;
  }
}

- (void)updateForeignDatabaseWithValuesFromPlaybackPositionEntity:(id)a3
{
  id v3 = (void *)MEMORY[0x263F89260];
  id v4 = a3;
  id v6 = [v3 sharedService];
  v5 = [v4 iTunesCloudEntity];

  [v6 updateForeignDatabaseWithValuesFromPlaybackPositionEntity:v5];
}

- (void)deletePlaybackPositionEntities
{
  id v4 = [MEMORY[0x263F89260] sharedService];
  v2 = [MEMORY[0x263F57448] autoupdatingSharedLibrary];
  id v3 = [v2 libraryUID];
  [v4 deletePlaybackPositionEntitiesFromLibraryWithIdentifier:v3];
}

- (void)deletePlaybackPositionEntity:(id)a3
{
  id v3 = (void *)MEMORY[0x263F89260];
  id v4 = a3;
  id v6 = [v3 sharedService];
  v5 = [v4 iTunesCloudEntity];

  [v6 deletePlaybackPositionEntity:v5];
}

- (void)persistPlaybackPositionEntity:(id)a3 isCheckpoint:(BOOL)a4 completionBlock:(id)a5
{
  BOOL v5 = a4;
  id v8 = a5;
  id v9 = (void *)MEMORY[0x263F89260];
  id v10 = a3;
  uint64_t v11 = [v9 sharedService];
  uint64_t v12 = [v10 iTunesCloudEntity];

  v14[0] = MEMORY[0x263EF8330];
  v14[1] = 3221225472;
  v14[2] = __89__SBCPlaybackPositionService_persistPlaybackPositionEntity_isCheckpoint_completionBlock___block_invoke;
  v14[3] = &unk_264CAD308;
  v14[4] = self;
  id v15 = v8;
  id v13 = v8;
  [v11 persistPlaybackPositionEntity:v12 isCheckpoint:v5 completionBlock:v14];
}

void __89__SBCPlaybackPositionService_persistPlaybackPositionEntity_isCheckpoint_completionBlock___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  uint64_t v18 = *MEMORY[0x263EF8340];
  id v5 = a3;
  id v6 = os_log_create("com.apple.amp.StoreBookkeeperClient", "Default");
  id v7 = v6;
  if (v5)
  {
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    {
      uint64_t v8 = *(void *)(a1 + 32);
      id v9 = objc_msgSend(v5, "msv_description");
      int v12 = 138543874;
      uint64_t v13 = v8;
      __int16 v14 = 1024;
      int v15 = a2;
      __int16 v16 = 2114;
      uint64_t v17 = v9;
      _os_log_impl(&dword_23674F000, v7, OS_LOG_TYPE_ERROR, "%{public}@ persistPlaybackPositionEntity completed. success=%{BOOL}u error=%{public}@", (uint8_t *)&v12, 0x1Cu);
    }
  }
  else if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v10 = *(void *)(a1 + 32);
    int v12 = 138543618;
    uint64_t v13 = v10;
    __int16 v14 = 1024;
    int v15 = a2;
    _os_log_impl(&dword_23674F000, v7, OS_LOG_TYPE_DEFAULT, "%{public}@ persistPlaybackPositionEntity completed. success=%{BOOL}u", (uint8_t *)&v12, 0x12u);
  }

  uint64_t v11 = *(void *)(a1 + 40);
  if (v11) {
    (*(void (**)(uint64_t, uint64_t))(v11 + 16))(v11, a2);
  }
}

- (SBCPlaybackPositionService)initWithPlaybackPositionDomain:(id)a3
{
  id v5 = a3;
  id v6 = [[SBCClientConfiguration alloc] initWithPlaybackPositionDomain:v5];
  v10.receiver = self;
  v10.super_class = (Class)SBCPlaybackPositionService;
  id v7 = [(SBCXPCService *)&v10 initWithClientConfiguration:v6];
  uint64_t v8 = v7;
  if (v7) {
    objc_storeStrong((id *)&v7->_playbackPositionDomain, a3);
  }

  return v8;
}

+ (Class)XPCServiceInterfaceClass
{
  return (Class)objc_opt_class();
}

+ (id)serviceForValueDomain:(id)a3
{
  id v3 = a3;
  id v4 = [(SBCPlaybackPositionService *)[SBCPlaybackPositionValueService alloc] initWithPlaybackPositionDomain:v3];

  return v4;
}

+ (id)serviceForSyncDomain:(id)a3
{
  id v3 = a3;
  id v4 = [(SBCPlaybackPositionService *)[SBCPlaybackPositionSyncService alloc] initWithPlaybackPositionDomain:v3];

  return v4;
}

@end