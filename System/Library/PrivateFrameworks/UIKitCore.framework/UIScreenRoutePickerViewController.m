@interface UIScreenRoutePickerViewController
@end

@implementation UIScreenRoutePickerViewController

uint64_t __45___UIScreenRoutePickerViewController_dealloc__block_invoke()
{
  return objc_opt_class();
}

void __64___UIScreenRoutePickerViewController__commonInitWithCompletion___block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v1 = [WeakRetained remoteViewController];
  v2 = [v1 serviceViewControllerProxy];
  [v2 _invalidate];
}

void __64___UIScreenRoutePickerViewController__commonInitWithCompletion___block_invoke_2(uint64_t a1, uint64_t a2, void *a3, void *a4)
{
  id v6 = a4;
  id v7 = a3;
  id WeakRetained = (dispatch_semaphore_t *)objc_loadWeakRetained((id *)(a1 + 40));
  [v7 setPublicController:WeakRetained];
  v9 = [v7 serviceViewControllerProxy];

  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
  if (v6)
  {
    uint64_t v10 = objc_opt_class();
    NSLog(&cfstr_RemoteViewCont.isa, v10, v6);
    [(dispatch_semaphore_t *)WeakRetained _endDelayingPresentation];
  }
  else
  {
    v11[0] = MEMORY[0x1E4F143A8];
    v11[1] = 3221225472;
    v11[2] = __64___UIScreenRoutePickerViewController__commonInitWithCompletion___block_invoke_3;
    v11[3] = &unk_1E52F2248;
    v11[4] = WeakRetained;
    [v9 _prepareForDisplayWithCompletion:v11];
  }
  dispatch_semaphore_signal(WeakRetained[124]);
}

uint64_t __64___UIScreenRoutePickerViewController__commonInitWithCompletion___block_invoke_3(uint64_t a1, double a2, double a3)
{
  uint64_t v6 = [*(id *)(a1 + 32) modalPresentationStyle];
  double v7 = 0.0;
  if (v6 == 7) {
    double v7 = a2;
  }
  objc_msgSend(*(id *)(a1 + 32), "setPreferredContentSize:", v7, a3);
  v8 = *(void **)(a1 + 32);
  return [v8 _endDelayingPresentation];
}

void __53___UIScreenRoutePickerViewController_disconnectRoute__block_invoke(uint64_t a1)
{
  dispatch_semaphore_wait(*(dispatch_semaphore_t *)(*(void *)(a1 + 32) + 992), 0xFFFFFFFFFFFFFFFFLL);
  int has_internal_diagnostics = os_variant_has_internal_diagnostics();
  v3 = [*(id *)(a1 + 32) remoteViewController];

  if (has_internal_diagnostics)
  {
    if (!v3)
    {
      uint64_t v6 = __UIFaultDebugAssertLog();
      if (os_log_type_enabled(v6, OS_LOG_TYPE_FAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_fault_impl(&dword_1853B0000, v6, OS_LOG_TYPE_FAULT, "Failed to get remote view controller for disconnect", buf, 2u);
      }
    }
  }
  else if (!v3)
  {
    double v7 = *(NSObject **)(__UILogGetCategoryCachedImpl("Assert", &_UIInternalPreference_ForceIOSDeviceInsets_block_invoke___s_category_1)+ 8);
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1853B0000, v7, OS_LOG_TYPE_ERROR, "Failed to get remote view controller for disconnect", buf, 2u);
    }
  }
  v4 = [*(id *)(a1 + 32) remoteViewController];
  v5 = [v4 serviceViewControllerProxy];
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __53___UIScreenRoutePickerViewController_disconnectRoute__block_invoke_21;
  v8[3] = &unk_1E52D9F70;
  v8[4] = *(void *)(a1 + 32);
  [v5 _disconnectRouteWithCompletion:v8];
}

id __53___UIScreenRoutePickerViewController_disconnectRoute__block_invoke_21()
{
  return self;
}

void __68___UIScreenRoutePickerViewController_setCurrentOutputDeviceEnabled___block_invoke(uint64_t a1)
{
  dispatch_semaphore_wait(*(dispatch_semaphore_t *)(*(void *)(a1 + 32) + 992), 0xFFFFFFFFFFFFFFFFLL);
  int has_internal_diagnostics = os_variant_has_internal_diagnostics();
  v3 = [*(id *)(a1 + 32) remoteViewController];

  if (has_internal_diagnostics)
  {
    if (!v3)
    {
      double v7 = __UIFaultDebugAssertLog();
      if (os_log_type_enabled(v7, OS_LOG_TYPE_FAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_fault_impl(&dword_1853B0000, v7, OS_LOG_TYPE_FAULT, "Failed to get remote view controller for disconnect", buf, 2u);
      }
    }
  }
  else if (!v3)
  {
    v8 = *(NSObject **)(__UILogGetCategoryCachedImpl("Assert", &_UIInternalPreference_ForceIOSDeviceInsets_block_invoke_2___s_category)+ 8);
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1853B0000, v8, OS_LOG_TYPE_ERROR, "Failed to get remote view controller for disconnect", buf, 2u);
    }
  }
  v4 = [*(id *)(a1 + 32) remoteViewController];
  v5 = [v4 serviceViewControllerProxy];
  uint64_t v6 = *(unsigned __int8 *)(a1 + 40);
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __68___UIScreenRoutePickerViewController_setCurrentOutputDeviceEnabled___block_invoke_22;
  v9[3] = &unk_1E52D9F70;
  v9[4] = *(void *)(a1 + 32);
  [v5 _setCurrentOutputDeviceEnabled:v6 completion:v9];
}

id __68___UIScreenRoutePickerViewController_setCurrentOutputDeviceEnabled___block_invoke_22()
{
  return self;
}

@end