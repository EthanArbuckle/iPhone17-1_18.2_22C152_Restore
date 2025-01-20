@interface UISceneHostingActivationStateHostComponent
@end

@implementation UISceneHostingActivationStateHostComponent

void __76___UISceneHostingActivationStateHostComponent_foregroundAssertionForReason___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  unint64_t CategoryCachedImpl = __UILogGetCategoryCachedImpl("UISceneHostingActivationState", &_UIInternalPreference_ForceIOSDeviceInsets_block_invoke___s_category);
  if (*(unsigned char *)CategoryCachedImpl)
  {
    v7 = *(NSObject **)(CategoryCachedImpl + 8);
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      int v8 = 138412290;
      id v9 = v3;
      _os_log_impl(&dword_1853B0000, v7, OS_LOG_TYPE_ERROR, "Foreground assertion relinquished: %@", (uint8_t *)&v8, 0xCu);
    }
  }
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v6 = WeakRetained;
  if (WeakRetained)
  {
    --WeakRetained[6];
    [WeakRetained evaluateActivationState];
  }
}

uint64_t __61___UISceneHostingActivationStateHostComponent_setForeground___block_invoke(uint64_t a1, void *a2)
{
  return [a2 setForeground:*(unsigned __int8 *)(a1 + 32)];
}

void __67___UISceneHostingActivationStateHostComponent_propagateForeground___block_invoke(uint64_t a1, void *a2)
{
  int v3 = *(unsigned __int8 *)(a1 + 40);
  id v4 = a2;
  id v9 = v4;
  if (v3)
  {
    [v4 addPropagatedProperty:sel_isForeground];
    id WeakRetained = objc_loadWeakRetained((id *)(*(void *)(a1 + 32) + 32));
    v6 = [WeakRetained _childRemoteContentRegistry];
    v7 = [v6 parentSettings];
    objc_msgSend(v9, "setForeground:", objc_msgSend(v7, "isForeground"));

    int v8 = WeakRetained;
  }
  else
  {
    [v4 removePropagatedProperty:sel_isForeground];
    int v8 = v9;
  }
}

@end