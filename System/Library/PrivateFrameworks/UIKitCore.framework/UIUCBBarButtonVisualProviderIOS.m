@interface UIUCBBarButtonVisualProviderIOS
@end

@implementation UIUCBBarButtonVisualProviderIOS

void __59___UIUCBBarButtonVisualProviderIOS__defaultTitleAttributes__block_invoke()
{
  v8[3] = *MEMORY[0x1E4F143B8];
  id v0 = objc_alloc_init((Class)off_1E52D2D48);
  [v0 setLineBreakMode:4];
  [v0 setAlignment:4];
  id v1 = objc_alloc_init((Class)off_1E52D2E28);
  objc_msgSend(v1, "setShadowOffset:", 0.0, -1.0);
  [v1 setShadowColor:0];
  [v1 setShadowBlurRadius:0.0];
  v7[0] = *(void *)off_1E52D2040;
  v2 = [off_1E52D39B8 systemFontOfSize:17.0];
  uint64_t v3 = *(void *)off_1E52D21B8;
  v8[0] = v2;
  v8[1] = v0;
  uint64_t v4 = *(void *)off_1E52D2238;
  v7[1] = v3;
  v7[2] = v4;
  v8[2] = v1;
  uint64_t v5 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v8 forKeys:v7 count:3];
  v6 = (void *)_MergedGlobals_11_3;
  _MergedGlobals_11_3 = v5;
}

uint64_t __70___UIUCBBarButtonVisualProviderIOS__configureImageOrTitleFromBarItem___block_invoke(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 32) resolvedStyleForStyle:a2];
}

void __70___UIUCBBarButtonVisualProviderIOS__configureImageOrTitleFromBarItem___block_invoke_2(uint64_t a1, void *a2, void *a3, void *a4)
{
  id v7 = a3;
  id v8 = a4;
  v9 = dispatch_get_global_queue(33, 0);
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __70___UIUCBBarButtonVisualProviderIOS__configureImageOrTitleFromBarItem___block_invoke_3;
  block[3] = &unk_1E52DDC90;
  v16[1] = a2;
  id v13 = v7;
  id v14 = *(id *)(a1 + 32);
  id v15 = v8;
  id v10 = v8;
  id v11 = v7;
  objc_copyWeak(v16, (id *)(a1 + 40));
  dispatch_async(v9, block);

  objc_destroyWeak(v16);
}

void __70___UIUCBBarButtonVisualProviderIOS__configureImageOrTitleFromBarItem___block_invoke_3(uint64_t a1)
{
  v2 = +[_UIConcretePasteboard _remoteContentForLayerContextWithId:*(void *)(a1 + 64) slotStyle:*(void *)(a1 + 32) pasteButtonTag:*(void *)(a1 + 40)];
  if (v2)
  {
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __70___UIUCBBarButtonVisualProviderIOS__configureImageOrTitleFromBarItem___block_invoke_4;
    block[3] = &unk_1E52DDC68;
    id v5 = *(id *)(a1 + 48);
    id v4 = v2;
    objc_copyWeak(&v6, (id *)(a1 + 56));
    dispatch_async(MEMORY[0x1E4F14428], block);
    objc_destroyWeak(&v6);
  }
}

void __70___UIUCBBarButtonVisualProviderIOS__configureImageOrTitleFromBarItem___block_invoke_4(uint64_t a1)
{
  if ((*(unsigned int (**)(void))(*(void *)(a1 + 40) + 16))())
  {
    id WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
    [WeakRetained updateSecureButton];
  }
}

id __46___UIUCBBarButtonVisualProviderIOS_updateMenu__block_invoke(uint64_t a1, void *a2)
{
  uint64_t v28 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  uint64_t v4 = *(void *)(a1 + 32);
  id v5 = (id *)(a1 + 40);
  id WeakRetained = objc_loadWeakRetained(v5);
  id v7 = (*(void (**)(uint64_t, id, id))(v4 + 16))(v4, WeakRetained, v3);

  if (!v7)
  {
    if (os_variant_has_internal_diagnostics())
    {
      v18 = __UIFaultDebugAssertLog();
      if (os_log_type_enabled(v18, OS_LOG_TYPE_FAULT))
      {
        id v19 = objc_loadWeakRetained(v5);
        *(_DWORD *)buf = 138412290;
        id v27 = v19;
        _os_log_fault_impl(&dword_1853B0000, v18, OS_LOG_TYPE_FAULT, "Client configured a bar button item (%@) with a secondaryActionsProvider and secondaryActionsArePrimary=YES, but failed to return a menu, Substituting a dummy menu.", buf, 0xCu);
      }
    }
    else
    {
      v9 = *(NSObject **)(__UILogGetCategoryCachedImpl("Assert", &UIDictationInputModeInvocationSourceGenerativeField_block_invoke___s_category)+ 8);
      if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
      {
        id v10 = v9;
        id v11 = objc_loadWeakRetained(v5);
        *(_DWORD *)buf = 138412290;
        id v27 = v11;
        _os_log_impl(&dword_1853B0000, v10, OS_LOG_TYPE_ERROR, "Client configured a bar button item (%@) with a secondaryActionsProvider and secondaryActionsArePrimary=YES, but failed to return a menu, Substituting a dummy menu.", buf, 0xCu);
      }
    }
    id v12 = objc_loadWeakRetained(v5);
    id v13 = [v12 title];
    id v14 = objc_loadWeakRetained(v5);
    id v15 = [v14 image];
    uint64_t v20 = MEMORY[0x1E4F143A8];
    uint64_t v21 = 3221225472;
    v22 = __46___UIUCBBarButtonVisualProviderIOS_updateMenu__block_invoke_102;
    v23 = &unk_1E52DDB60;
    objc_copyWeak(&v24, v5);
    v16 = +[UIAction actionWithTitle:v13 image:v15 identifier:0 handler:&v20];

    v25 = v16;
    v17 = objc_msgSend(MEMORY[0x1E4F1C978], "arrayWithObjects:count:", &v25, 1, v20, v21, v22, v23);
    id v7 = +[UIMenu menuWithChildren:v17];

    objc_destroyWeak(&v24);
  }

  return v7;
}

void __46___UIUCBBarButtonVisualProviderIOS_updateMenu__block_invoke_102(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained _triggerActionForEvent:0];
}

id __46___UIUCBBarButtonVisualProviderIOS_updateMenu__block_invoke_2(uint64_t a1, void *a2)
{
  uint64_t v2 = *(void *)(a1 + 32);
  id v3 = (id *)(a1 + 40);
  id v4 = a2;
  id WeakRetained = objc_loadWeakRetained(v3);
  id v6 = (*(void (**)(uint64_t, id, id))(v2 + 16))(v2, WeakRetained, v4);

  return v6;
}

id __46___UIUCBBarButtonVisualProviderIOS_updateMenu__block_invoke_3(uint64_t a1)
{
  return *(id *)(a1 + 32);
}

@end