@interface WGWidgetRemoteViewController
@end

@implementation WGWidgetRemoteViewController

uint64_t __80___WGWidgetRemoteViewController__requestEncodedLayerTreeAtURL_withReplyHandler___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

void __64___WGWidgetRemoteViewController__performUpdateWithReplyHandler___block_invoke(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 32);
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  (*(void (**)(uint64_t, uint64_t, uint64_t))(v1 + 16))(v1, 2, [WeakRetained implementsPerformUpdate]);
}

void __70___WGWidgetRemoteViewController__updateVisibleFrame_withReplyHandler___block_invoke(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 32);
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  v2 = [WeakRetained widgetInfo];
  (*(void (**)(uint64_t, uint64_t))(v1 + 16))(v1, [v2 wantsVisibleFrame]);
}

void __62___WGWidgetRemoteViewController___requestPreferredViewHeight___block_invoke(uint64_t a1)
{
  v2[0] = MEMORY[0x263EF8330];
  v2[1] = 3221225472;
  v2[2] = __62___WGWidgetRemoteViewController___requestPreferredViewHeight___block_invoke_2;
  v2[3] = &unk_264676D68;
  id v3 = *(id *)(a1 + 32);
  uint64_t v4 = *(void *)(a1 + 40);
  dispatch_async(MEMORY[0x263EF83A0], v2);
}

uint64_t __62___WGWidgetRemoteViewController___requestPreferredViewHeight___block_invoke_2(uint64_t a1)
{
  return [*(id *)(a1 + 32) _updatePreferredContentSizeWithHeight:*(double *)(a1 + 40)];
}

void __66___WGWidgetRemoteViewController___setLargestAvailableDisplayMode___block_invoke(uint64_t a1)
{
  v4[0] = MEMORY[0x263EF8330];
  v4[1] = 3221225472;
  v4[2] = __66___WGWidgetRemoteViewController___setLargestAvailableDisplayMode___block_invoke_2;
  v4[3] = &unk_264676D68;
  id v2 = *(id *)(a1 + 32);
  uint64_t v3 = *(void *)(a1 + 40);
  id v5 = v2;
  uint64_t v6 = v3;
  dispatch_async(MEMORY[0x263EF83A0], v4);
}

uint64_t __66___WGWidgetRemoteViewController___setLargestAvailableDisplayMode___block_invoke_2(uint64_t a1)
{
  uint64_t result = objc_opt_respondsToSelector();
  if (result)
  {
    uint64_t v3 = *(void **)(a1 + 32);
    uint64_t v4 = *(void *)(a1 + 40);
    return [v3 _setLargestAvailableDisplayMode:v4];
  }
  return result;
}

void __93___WGWidgetRemoteViewController___closeTransactionForAppearanceCallWithState_withIdentifier___block_invoke(uint64_t a1)
{
  v2[0] = MEMORY[0x263EF8330];
  v2[1] = 3221225472;
  v2[2] = __93___WGWidgetRemoteViewController___closeTransactionForAppearanceCallWithState_withIdentifier___block_invoke_2;
  v2[3] = &unk_264676680;
  id v3 = *(id *)(a1 + 32);
  id v4 = *(id *)(a1 + 40);
  dispatch_async(MEMORY[0x263EF83A0], v2);
}

void __93___WGWidgetRemoteViewController___closeTransactionForAppearanceCallWithState_withIdentifier___block_invoke_2(uint64_t a1)
{
  uint64_t v20 = *MEMORY[0x263EF8340];
  id v2 = [*(id *)(a1 + 32) _openAppearanceTransactions];
  id v3 = [v2 objectForKey:*(void *)(a1 + 40)];

  if (v3)
  {
    v3[2](v3);
  }
  else
  {
    id v4 = (void *)WGLogWidgets;
    if (os_log_type_enabled((os_log_t)WGLogWidgets, OS_LOG_TYPE_DEFAULT))
    {
      id v5 = *(void **)(a1 + 32);
      uint64_t v6 = v4;
      v7 = [v5 widgetIdentifier];
      v8 = *(void **)(a1 + 32);
      v9 = [v8 _containerIdentifier];
      uint64_t v10 = *(void *)(a1 + 40);
      int v12 = 138544130;
      v13 = v7;
      __int16 v14 = 2050;
      v15 = v8;
      __int16 v16 = 2114;
      v17 = v9;
      __int16 v18 = 2114;
      uint64_t v19 = v10;
      _os_log_impl(&dword_222E49000, v6, OS_LOG_TYPE_DEFAULT, "<%{public}@: %{public}p; container: %{public}@> No open transaction with identifier '%{public}@'",
        (uint8_t *)&v12,
        0x2Au);
    }
  }
  v11 = [*(id *)(a1 + 32) _openAppearanceTransactions];
  [v11 removeObjectForKey:*(void *)(a1 + 40)];
}

void __66___WGWidgetRemoteViewController_viewServiceDidTerminateWithError___block_invoke(id *a1)
{
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __66___WGWidgetRemoteViewController_viewServiceDidTerminateWithError___block_invoke_2;
  block[3] = &unk_264677D48;
  id v3 = a1[4];
  objc_copyWeak(&v5, a1 + 6);
  id v4 = a1[5];
  dispatch_async(MEMORY[0x263EF83A0], block);

  objc_destroyWeak(&v5);
}

void __66___WGWidgetRemoteViewController_viewServiceDidTerminateWithError___block_invoke_2(uint64_t a1)
{
  id v2 = *(void **)(a1 + 32);
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  [v2 widget:WeakRetained didTerminateWithError:*(void *)(a1 + 40)];
}

@end