@interface UIONavigationBarTitleRenamerConnectionAction
@end

@implementation UIONavigationBarTitleRenamerConnectionAction

void __88___UIONavigationBarTitleRenamerConnectionAction_initWithSession_action_responseHandler___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __88___UIONavigationBarTitleRenamerConnectionAction_initWithSession_action_responseHandler___block_invoke_2;
  v6[3] = &unk_1E52DB330;
  id v4 = *(id *)(a1 + 32);
  id v7 = v3;
  id v8 = v4;
  id v5 = v3;
  dispatch_async(MEMORY[0x1E4F14428], v6);
}

uint64_t __88___UIONavigationBarTitleRenamerConnectionAction_initWithSession_action_responseHandler___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void, void))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40), *(void *)(a1 + 32));
}

void __90___UIONavigationBarTitleRenamerConnectionAction__setupKeyboardEventDeferralForConnection___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = v3;
  if (v3)
  {
    id v5 = [v3 windowScene];
    uint64_t v12 = 0;
    v13 = &v12;
    uint64_t v14 = 0x2050000000;
    v6 = (void *)_MergedGlobals_1310;
    uint64_t v15 = _MergedGlobals_1310;
    if (!_MergedGlobals_1310)
    {
      v11[0] = MEMORY[0x1E4F143A8];
      v11[1] = 3221225472;
      v11[2] = __getSBSKeyboardFocusServiceClass_block_invoke_1;
      v11[3] = &unk_1E52D9900;
      v11[4] = &v12;
      __getSBSKeyboardFocusServiceClass_block_invoke_1((uint64_t)v11);
      v6 = (void *)v13[3];
    }
    id v7 = v6;
    _Block_object_dispose(&v12, 8);
    id v8 = objc_opt_new();
    v9 = [v5 _FBSScene];
    v10 = [v9 identityToken];

    [v8 requestKeyboardFocusForSceneIdentity:v10 processID:getpid() completion:&__block_literal_global_632];
    [*(id *)(a1 + 32) setKfService:v8];
  }
  else
  {
    id v5 = UIOLog();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
    {
      LOWORD(v11[0]) = 0;
      _os_log_error_impl(&dword_1853B0000, v5, OS_LOG_TYPE_ERROR, "_UIONavigationBarTitleRenamerConnectionAction: No display delegate available to set up keyboard event deferral", (uint8_t *)v11, 2u);
    }
  }
}

void __90___UIONavigationBarTitleRenamerConnectionAction__addViewToHierarchyForConnection_session___block_invoke(uint64_t a1, void *a2)
{
  if (a2)
  {
    id v3 = [a2 rootViewController];
    id v9 = [v3 view];

    [v9 addSubview:*(void *)(a1 + 48)];
    [*(id *)(a1 + 48) becomeFirstResponder];
  }
  else
  {
    id v4 = UIOLog();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_error_impl(&dword_1853B0000, v4, OS_LOG_TYPE_ERROR, "_UIONavigationBarTitleRenamerConnectionAction No display delegate available for view hierarchy population.", buf, 2u);
    }

    id v5 = [MEMORY[0x1E4F28C58] errorWithDomain:0x1ED12F8C0 code:-1 userInfo:0];
    v6 = *(void **)(a1 + 32);
    id v7 = (void *)[objc_alloc(MEMORY[0x1E4F4F678]) initWithInfo:0 error:v5];
    [v6 sendResponse:v7];

    id v8 = +[_UINavigationBarTitleRenamer renameServer];
    [v8 endSession:*(void *)(a1 + 40)];
  }
}

@end