@interface UISystemAppearanceManager
@end

@implementation UISystemAppearanceManager

uint64_t __70___UISystemAppearanceManager_updateScreenEdgesDeferringSystemGestures__block_invoke(uint64_t a1, void *a2)
{
  return [a2 setScreenEdgesDeferringSystemGestures:*(void *)(a1 + 32)];
}

uint64_t __59___UISystemAppearanceManager_updateHomeIndicatorAutoHidden__block_invoke(uint64_t a1, void *a2)
{
  return [a2 setHomeIndicatorAutoHidden:*(unsigned __int8 *)(*(void *)(a1 + 32) + 8)];
}

uint64_t __61___UISystemAppearanceManager_updateWhitePointAdaptivityStyle__block_invoke(uint64_t a1, void *a2)
{
  return 0;
}

uint64_t __106___UISystemAppearanceManager_window_didUpdateSupportedOrientations_preferredOrientation_prefersAnimation___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  if (*(unsigned char *)(a1 + 80))
  {
    if (*(unsigned char *)(a1 + 81)) {
      [v5 setSupportedInterfaceOrientations:*(void *)(a1 + 48)];
    }
    if (*(unsigned char *)(a1 + 82)) {
      [v5 _setDebugValidationOrientationMask:*(void *)(a1 + 48)];
    }
  }
  if (*(unsigned char *)(a1 + 83) && *(unsigned char *)(a1 + 81)) {
    [v5 setPreferredInterfaceOrientation:*(void *)(a1 + 56)];
  }
  if (*(unsigned char *)(a1 + 84))
  {
    v7 = +[UIView _currentAnimationSettings];
    [v6 setAnimationSettings:v7];

    v8 = [v6 animationSettings];

    if (v8) {
      goto LABEL_14;
    }
    v9 = [MEMORY[0x1E4F39C10] functionWithName:*MEMORY[0x1E4F3A490]];
    v10 = (void *)MEMORY[0x1E4F4F680];
    [*(id *)(a1 + 32) _rotationDuration];
    v11 = objc_msgSend(v10, "settingsWithDuration:timingFunction:", v9);
    [v6 setAnimationSettings:v11];
  }
  else
  {
    v9 = [MEMORY[0x1E4F4F680] settingsWithDuration:0.0];
    [v6 setAnimationSettings:v9];
  }

LABEL_14:
  if (*(unsigned char *)(a1 + 81))
  {
    v12 = *(void **)(a1 + 40);
    uint64_t v13 = *(void *)(a1 + 48);
    uint64_t v15 = *(void *)(a1 + 64);
    uint64_t v14 = *(void *)(a1 + 72);
    uint64_t v16 = *(void *)(a1 + 56);
    v17 = [v6 animationSettings];
    [v12 _logOrientationPreferencesChangeWithOldSupportedOrientations:v15 newSupportedOrientations:v13 oldPreferredOrientation:v14 newPreferredOrientation:v16 animationSettings:v17 fenced:*(unsigned __int8 *)(a1 + 85)];
  }
  uint64_t v18 = *(unsigned __int8 *)(a1 + 85);

  return v18;
}

id __40___UISystemAppearanceManager__setScene___block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v2 = [WeakRetained _orientationDebugDescription];

  return v2;
}

uint64_t __66___UISystemAppearanceManager_updateMultitaskingDragExclusionRects__block_invoke(uint64_t a1, void *a2)
{
  return [a2 setMultitaskingDragExclusionRects:*(void *)(*(void *)(a1 + 32) + 40)];
}

@end