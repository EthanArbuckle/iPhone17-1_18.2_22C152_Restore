@interface SBWidgetExtensionDebugHomeScreenDataSource
@end

@implementation SBWidgetExtensionDebugHomeScreenDataSource

void __84___SBWidgetExtensionDebugHomeScreenDataSource_launchWidget_widgetFamily_completion___block_invoke(uint64_t a1)
{
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __84___SBWidgetExtensionDebugHomeScreenDataSource_launchWidget_widgetFamily_completion___block_invoke_2;
  v7[3] = &unk_1E6B07548;
  id v2 = *(id *)(a1 + 48);
  uint64_t v3 = *(void *)(a1 + 32);
  v4 = *(void **)(a1 + 40);
  id v9 = v2;
  v7[4] = v3;
  id v5 = v4;
  uint64_t v6 = *(void *)(a1 + 56);
  id v8 = v5;
  uint64_t v10 = v6;
  SBWorkspaceForceToSpringBoard(v7);
}

uint64_t __84___SBWidgetExtensionDebugHomeScreenDataSource_launchWidget_widgetFamily_completion___block_invoke_2(void *a1, int a2)
{
  if (a2)
  {
    SBWorkspaceSuspendActiveDisplay();
    (*(void (**)(void))(a1[6] + 16))();
    uint64_t v3 = (void *)a1[4];
    uint64_t v4 = a1[5];
    uint64_t v5 = a1[7];
    return [v3 _reallyLaunchWidgetOnHomeScreen:v4 widgetFamily:v5];
  }
  else
  {
    v7 = *(uint64_t (**)(void))(a1[6] + 16);
    return v7();
  }
}

void __84___SBWidgetExtensionDebugHomeScreenDataSource_launchWidget_widgetFamily_completion___block_invoke_3(uint64_t a1)
{
  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
  id v2 = *(void **)(*(void *)(a1 + 32) + 16);
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  [v2 removeObject:WeakRetained];
}

void __92___SBWidgetExtensionDebugHomeScreenDataSource__reallyLaunchWidgetOnHomeScreen_widgetFamily___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  if (v3)
  {
    uint64_t v4 = SBLogWidgets();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
      __92___SBWidgetExtensionDebugHomeScreenDataSource__reallyLaunchWidgetOnHomeScreen_widgetFamily___block_invoke_cold_1(v3, a1, v4);
    }
  }
}

void __92___SBWidgetExtensionDebugHomeScreenDataSource__reallyLaunchWidgetOnHomeScreen_widgetFamily___block_invoke_cold_1(void *a1, uint64_t a2, NSObject *a3)
{
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  uint64_t v5 = [a1 debugDescription];
  uint64_t v6 = *(void *)(a2 + 32);
  int v7 = 138543618;
  id v8 = v5;
  __int16 v9 = 2114;
  uint64_t v10 = v6;
  _os_log_error_impl(&dword_1D85BA000, a3, OS_LOG_TYPE_ERROR, "Tools reload error %{public}@ for container %{public}@", (uint8_t *)&v7, 0x16u);
}

@end