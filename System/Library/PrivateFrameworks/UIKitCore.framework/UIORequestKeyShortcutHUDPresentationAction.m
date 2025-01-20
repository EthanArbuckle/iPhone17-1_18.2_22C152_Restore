@interface UIORequestKeyShortcutHUDPresentationAction
@end

@implementation UIORequestKeyShortcutHUDPresentationAction

void __85___UIORequestKeyShortcutHUDPresentationAction_initWithConfiguration_responseHandler___block_invoke(uint64_t a1, void *a2)
{
  id v7 = a2;
  v3 = [v7 error];

  if (v3)
  {
    v3 = objc_opt_new();
    [v3 setAccepted:0];
  }
  v4 = self;
  char isKindOfClass = objc_opt_isKindOfClass();

  if (isKindOfClass)
  {
    uint64_t v6 = [v7 response];

    v3 = (void *)v6;
  }
  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
}

void __75___UIORequestKeyShortcutHUDPresentationAction_performActionFromConnection___block_invoke(uint64_t a1, void *a2)
{
  id v5 = a2;
  if ([*(id *)(a1 + 32) canSendResponse])
  {
    v3 = *(void **)(a1 + 32);
    v4 = +[_UIORequestKeyShortcutHUDPresentationActionResponse _responseWithHUDPresentationResponse:v5];
    [v3 sendResponse:v4];
  }
}

void __75___UIORequestKeyShortcutHUDPresentationAction_performActionFromConnection___block_invoke_2(uint64_t a1, void *a2)
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  v4 = [v3 windowScene];
  if (v4)
  {
    id v5 = +[_UIKeyShortcutHUDServer sharedHUDServer];
    uint64_t v6 = [*(id *)(a1 + 32) configuration];
    id v7 = [v3 windowScene];
    v12[0] = MEMORY[0x1E4F143A8];
    v12[1] = 3221225472;
    v12[2] = __75___UIORequestKeyShortcutHUDPresentationAction_performActionFromConnection___block_invoke_12;
    v12[3] = &unk_1E5309780;
    uint64_t v8 = *(void *)(a1 + 40);
    id v13 = *(id *)(a1 + 48);
    [v5 presentHUDWithConfiguration:v6 inWindowScene:v7 forConnection:v8 completionHandler:v12];

    v9 = v13;
  }
  else
  {
    if (os_variant_has_internal_diagnostics())
    {
      v11 = __UIFaultDebugAssertLog();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_FAULT))
      {
        *(_DWORD *)buf = 138412290;
        id v15 = v3;
        _os_log_fault_impl(&dword_1853B0000, v11, OS_LOG_TYPE_FAULT, "The keyboard shortcut HUD failed to find a window scene in OverlayUI to present in. displayDelegate = %@", buf, 0xCu);
      }
    }
    else
    {
      v10 = *(NSObject **)(__UILogGetCategoryCachedImpl("Assert", &_UIInternalPreference_KeyShortcutHUDEnhancedLogging_block_invoke___s_category)+ 8);
      if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138412290;
        id v15 = v3;
        _os_log_impl(&dword_1853B0000, v10, OS_LOG_TYPE_ERROR, "The keyboard shortcut HUD failed to find a window scene in OverlayUI to present in. displayDelegate = %@", buf, 0xCu);
      }
    }
    v9 = objc_opt_new();
    [v9 setAccepted:0];
    (*(void (**)(void))(*(void *)(a1 + 48) + 16))();
  }
}

uint64_t __75___UIORequestKeyShortcutHUDPresentationAction_performActionFromConnection___block_invoke_12(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

@end