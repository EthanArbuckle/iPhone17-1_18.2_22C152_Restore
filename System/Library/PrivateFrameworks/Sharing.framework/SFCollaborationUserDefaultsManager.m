@interface SFCollaborationUserDefaultsManager
+ (id)_createRemoteDataProxyWithErrorHandler:(id)a3;
+ (void)requestCollaborativeModeForContentIdentifier:(id)a3 completionHandler:(id)a4;
+ (void)saveCollaborativeMode:(id)a3 forContentIdentifier:(id)a4;
@end

@implementation SFCollaborationUserDefaultsManager

+ (void)requestCollaborativeModeForContentIdentifier:(id)a3 completionHandler:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if (v7)
  {
    v8 = _os_activity_create(&dword_1A5389000, "Sharing/SFCollaborationUserDefaultsManager/requestCollaborativeModeForContentIdentifier", MEMORY[0x1E4F144F0], OS_ACTIVITY_FLAG_DEFAULT);
    state.opaque[0] = 0;
    state.opaque[1] = 0;
    os_activity_scope_enter(v8, &state);
    v12[0] = MEMORY[0x1E4F143A8];
    v12[1] = 3221225472;
    v12[2] = __101__SFCollaborationUserDefaultsManager_requestCollaborativeModeForContentIdentifier_completionHandler___block_invoke;
    v12[3] = &unk_1E5BBCD68;
    id v9 = v7;
    id v13 = v9;
    v10 = [a1 _createRemoteDataProxyWithErrorHandler:v12];
    v11 = v10;
    if (v10) {
      [v10 requestCollaborativeModeForContentIdentifier:v6 completionHandler:v9];
    }
    else {
      (*((void (**)(id, void))v9 + 2))(v9, 0);
    }

    os_activity_scope_leave(&state);
  }
}

void __101__SFCollaborationUserDefaultsManager_requestCollaborativeModeForContentIdentifier_completionHandler___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  v4 = share_sheet_log();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
    __101__SFCollaborationUserDefaultsManager_requestCollaborativeModeForContentIdentifier_completionHandler___block_invoke_cold_1((uint64_t)v3, v4);
  }

  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
}

+ (void)saveCollaborativeMode:(id)a3 forContentIdentifier:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v8 = _os_activity_create(&dword_1A5389000, "Sharing/SFCollaborationUserDefaultsManager/saveCollaborativeMode", MEMORY[0x1E4F144F0], OS_ACTIVITY_FLAG_DEFAULT);
  v11.opaque[0] = 0;
  v11.opaque[1] = 0;
  os_activity_scope_enter(v8, &v11);
  id v9 = [a1 _createRemoteDataProxyWithErrorHandler:&__block_literal_global_9];
  v10 = v9;
  if (v9) {
    [v9 saveCollaborativeMode:v6 forContentIdentifier:v7];
  }

  os_activity_scope_leave(&v11);
}

void __81__SFCollaborationUserDefaultsManager_saveCollaborativeMode_forContentIdentifier___block_invoke(uint64_t a1, void *a2)
{
  id v2 = a2;
  id v3 = share_sheet_log();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR)) {
    __101__SFCollaborationUserDefaultsManager_requestCollaborativeModeForContentIdentifier_completionHandler___block_invoke_cold_1((uint64_t)v2, v3);
  }
}

+ (id)_createRemoteDataProxyWithErrorHandler:(id)a3
{
  id v3 = (objc_class *)MEMORY[0x1E4F29268];
  id v4 = a3;
  v5 = (void *)[[v3 alloc] initWithMachServiceName:@"com.apple.sharing.collaborationuserdefaults" options:0];
  id v6 = [MEMORY[0x1E4F29280] interfaceWithProtocol:&unk_1EFA39020];
  [v5 setRemoteObjectInterface:v6];

  [v5 resume];
  id v7 = [v5 synchronousRemoteObjectProxyWithErrorHandler:v4];

  return v7;
}

void __101__SFCollaborationUserDefaultsManager_requestCollaborativeModeForContentIdentifier_completionHandler___block_invoke_cold_1(uint64_t a1, NSObject *a2)
{
  uint64_t v4 = *MEMORY[0x1E4F143B8];
  int v2 = 138412290;
  uint64_t v3 = a1;
  _os_log_error_impl(&dword_1A5389000, a2, OS_LOG_TYPE_ERROR, "Share Sheet User Defaults: Error getting synchronous remote object proxy %@", (uint8_t *)&v2, 0xCu);
}

@end