@interface _UIActivityUserDefaultsManager
+ (void)requestFavoritesForActivityCategory:(int64_t)a3 completionHandler:(id)a4;
@end

@implementation _UIActivityUserDefaultsManager

+ (void)requestFavoritesForActivityCategory:(int64_t)a3 completionHandler:(id)a4
{
  id v5 = a4;
  if (v5)
  {
    v6 = _os_activity_create(&dword_1A0AD8000, "Sharing/_UIActivityUserDefaultsManager/requestFavoritesForActivityCategory", MEMORY[0x1E4F144F0], OS_ACTIVITY_FLAG_DEFAULT);
    state.opaque[0] = 0;
    state.opaque[1] = 0;
    os_activity_scope_enter(v6, &state);
    if (requestFavoritesForActivityCategory_completionHandler__onceToken != -1) {
      dispatch_once(&requestFavoritesForActivityCategory_completionHandler__onceToken, &__block_literal_global_34);
    }
    v7 = (void *)[objc_alloc(MEMORY[0x1E4F29268]) initWithMachServiceName:@"com.apple.sharing.sharesheetuserdefaults" options:0];
    v8 = [MEMORY[0x1E4F29280] interfaceWithProtocol:&unk_1EF3A52B8];
    [v7 setRemoteObjectInterface:v8];

    [v7 _setQueue:requestFavoritesForActivityCategory_completionHandler__xpc_queue];
    [v7 resume];
    v12[0] = MEMORY[0x1E4F143A8];
    v12[1] = 3221225472;
    v12[2] = __88___UIActivityUserDefaultsManager_requestFavoritesForActivityCategory_completionHandler___block_invoke_2;
    v12[3] = &unk_1E5A23208;
    id v9 = v5;
    id v13 = v9;
    v10 = [v7 synchronousRemoteObjectProxyWithErrorHandler:v12];
    v11 = v10;
    if (v10) {
      [v10 requestFavoritesForActivityCategory:a3 completionHandler:v9];
    }
    else {
      (*((void (**)(id, void))v9 + 2))(v9, 0);
    }

    os_activity_scope_leave(&state);
  }
}

@end