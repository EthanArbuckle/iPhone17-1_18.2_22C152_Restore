@interface UIWindowHostingScenePerformUpdateWithEffectiveSettings
@end

@implementation UIWindowHostingScenePerformUpdateWithEffectiveSettings

void ___UIWindowHostingScenePerformUpdateWithEffectiveSettings_block_invoke(uint64_t a1)
{
  v2[0] = MEMORY[0x1E4F143A8];
  v2[1] = 3221225472;
  v2[2] = ___UIWindowHostingScenePerformUpdateWithEffectiveSettings_block_invoke_2;
  v2[3] = &unk_1E52D9F98;
  id v3 = *(id *)(a1 + 32);
  id v4 = *(id *)(a1 + 40);
  +[UIViewController _performWithoutDeferringTransitions:v2];
}

void ___UIWindowHostingScenePerformUpdateWithEffectiveSettings_block_invoke_2(uint64_t a1)
{
  uint64_t v2 = [*(id *)(a1 + 40) interfaceOrientation];
  id v3 = [*(id *)(a1 + 32) _screen];
  [v3 _setInterfaceOrientation:v2];

  [*(id *)(a1 + 32) _updateSceneTraitsAndPushTraitsToScreen:1 callParentWillTransitionToTraitCollection:1];
  [*(id *)(a1 + 32) _computeMetrics:0];
  id v4 = [*(id *)(a1 + 32) _traitCollection];
  v5 = *(void **)(a1 + 32);
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = ___UIWindowHostingScenePerformUpdateWithEffectiveSettings_block_invoke_3;
  v6[3] = &unk_1E52DAE18;
  id v7 = v5;
  [v7 _enumerateWindowsIncludingInternalWindows:1 onlyVisibleWindows:1 asCopy:0 stopped:0 withBlock:v6];
}

uint64_t ___UIWindowHostingScenePerformUpdateWithEffectiveSettings_block_invoke_3(uint64_t result, void *a2)
{
  if (!*(void *)(*(void *)(result + 32) + 160)) {
    return [a2 layoutIfNeeded];
  }
  return result;
}

@end