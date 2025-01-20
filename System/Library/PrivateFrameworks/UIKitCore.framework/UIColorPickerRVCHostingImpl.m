@interface UIColorPickerRVCHostingImpl
@end

@implementation UIColorPickerRVCHostingImpl

void __55___UIColorPickerRVCHostingImpl__tryLaunchingExtension___block_invoke(uint64_t a1, void *a2, void *a3, void *a4)
{
  uint64_t v30 = *MEMORY[0x1E4F143B8];
  id v7 = a2;
  id v8 = a3;
  id v9 = a4;
  id v10 = v8;
  v11 = (id *)(a1 + 40);
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  v13 = WeakRetained;
  if (WeakRetained)
  {
    if (!v10 || v9)
    {
      if (*(uint64_t *)(a1 + 48) < 1)
      {
        v20 = *(NSObject **)(__UILogGetCategoryCachedImpl("UIColorPicker", &_UIInternalPreference_ForceIOSDeviceInsets_block_invoke___s_category_2)+ 8);
        if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
        {
          v21 = v20;
          v22 = [v9 localizedDescription];
          *(_DWORD *)buf = 138543362;
          v29 = v22;
          _os_log_impl(&dword_1853B0000, v21, OS_LOG_TYPE_ERROR, "Error launching extension: %{public}@", buf, 0xCu);
        }
        if (!v10)
        {
          v23 = [MEMORY[0x1E4F28B00] currentHandler];
          v24 = [NSString stringWithUTF8String:"-[_UIColorPickerRVCHostingImpl _tryLaunchingExtension:]_block_invoke"];
          [v23 handleFailureInFunction:v24 file:@"_UIColorPickerRVCHostingImpl.m" lineNumber:84 description:@"Cannot load extension’s view controller."];
        }
      }
      else
      {
        dispatch_time_t v18 = dispatch_time(0, 500000000);
        block[0] = MEMORY[0x1E4F143A8];
        block[1] = 3221225472;
        block[2] = __55___UIColorPickerRVCHostingImpl__tryLaunchingExtension___block_invoke_3;
        block[3] = &unk_1E52D9CD0;
        uint64_t v19 = *(void *)(a1 + 48);
        block[4] = v13;
        block[5] = v19;
        dispatch_after(v18, MEMORY[0x1E4F14428], block);
      }
    }
    else
    {
      [WeakRetained setRemoteViewController:v10];
      objc_msgSend(v10, "set_delegate:", v13);
      [v13 setExtensionRequestIdentifier:v7];
      v14 = [v10 serviceViewControllerProxy];
      v15 = [*(id *)(a1 + 32) delegateColorPickerViewController];
      [v15 _setChildViewController:v10];
      v16 = [v15 _selectedColor];
      [v13 setRemoteSelectedColor:v16];

      v17 = [v15 configuration];
      [v13 setRemoteConfiguration:v17];

      v26[0] = MEMORY[0x1E4F143A8];
      v26[1] = 3221225472;
      v26[2] = __55___UIColorPickerRVCHostingImpl__tryLaunchingExtension___block_invoke_2;
      v26[3] = &unk_1E52DC308;
      objc_copyWeak(&v27, v11);
      [v14 _prepareForDisplayWithCompletion:v26];
      objc_destroyWeak(&v27);
    }
  }
}

void __55___UIColorPickerRVCHostingImpl__tryLaunchingExtension___block_invoke_2(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v1 = [WeakRetained delegateColorPickerViewController];
  [v1 _endDelayingPresentation];
}

uint64_t __55___UIColorPickerRVCHostingImpl__tryLaunchingExtension___block_invoke_3(uint64_t a1)
{
  return [*(id *)(a1 + 32) _tryLaunchingExtension:*(void *)(a1 + 40) - 1];
}

@end