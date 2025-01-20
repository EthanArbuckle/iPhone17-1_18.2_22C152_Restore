@interface UIKeyboardLayerHostView
@end

@implementation UIKeyboardLayerHostView

void __81___UIKeyboardLayerHostView__initWithLayer_owningScene_keyboardMatchingPredicate___block_invoke(uint64_t a1, void *a2)
{
  v2 = (id *)(a1 + 32);
  id v3 = a2;
  id WeakRetained = objc_loadWeakRetained(v2);
  [WeakRetained _setKeyboardScene:v3];
}

uint64_t __67___UIKeyboardLayerHostView_initWithKeyboardProxyLayer_owningScene___block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  if (WeakRetained)
  {
    id v3 = [*(id *)(a1 + 32) proxiedKeyboardOwner];
    uint64_t v4 = [v3 isEqual:WeakRetained[61]];
  }
  else
  {
    uint64_t v4 = 0;
  }

  return v4;
}

uint64_t __62___UIKeyboardLayerHostView_initWithKeyboardLayer_owningScene___block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  if (WeakRetained)
  {
    id v3 = [*(id *)(a1 + 32) identityToken];
    uint64_t v4 = [v3 isEqual:WeakRetained[61]];
  }
  else
  {
    uint64_t v4 = 0;
  }

  return v4;
}

void __58___UIKeyboardLayerHostView_setCurrentPresentationContext___block_invoke(uint64_t a1, void *a2)
{
  v2 = *(void **)(a1 + 32);
  id v3 = a2;
  objc_msgSend(v3, "_setVisibilityPropagationEnabled:", objc_msgSend(v2, "_isVisibilityPropagationEnabled"));
}

uint64_t __48___UIKeyboardLayerHostView_setInheritsSecurity___block_invoke(uint64_t a1, void *a2)
{
  return [a2 setInheritsSecurity:*(unsigned __int8 *)(a1 + 32)];
}

void __102___UIKeyboardLayerHostView_scene_didUpdateClientSettingsWithDiff_oldClientSettings_transitionContext___block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained _updatePairingState];
}

void __47___UIKeyboardLayerHostView__updatePairingState__block_invoke(uint64_t a1, void *a2)
{
  id v4 = a2;
  objc_msgSend(v4, "setPresentedLayerTypes:", objc_msgSend(v4, "presentedLayerTypes") | 2);
  id v3 = [*(id *)(a1 + 32) currentPresentationContext];
  objc_msgSend(v4, "_setVisibilityPropagationEnabled:", objc_msgSend(v3, "_isVisibilityPropagationEnabled"));

  objc_msgSend(v4, "setInheritsSecurity:", objc_msgSend(*(id *)(a1 + 32), "inheritsSecurity"));
}

@end