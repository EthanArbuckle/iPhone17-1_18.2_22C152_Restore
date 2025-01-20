@interface UIView
@end

@implementation UIView

uint64_t __43__UIView_Utilities__vk_setHidden_animated___block_invoke(uint64_t a1)
{
  double v1 = 0.0;
  if (!*(unsigned char *)(a1 + 40)) {
    double v1 = 1.0;
  }
  return objc_msgSend(*(id *)(a1 + 32), "setVk_alpha:", v1);
}

uint64_t __43__UIView_Utilities__vk_setHidden_animated___block_invoke_2(uint64_t a1)
{
  return [*(id *)(a1 + 32) setHidden:*(unsigned __int8 *)(a1 + 40)];
}

void __62__UIView_Utilities__vk_autoFadeOutLayerWithPath_fadeOutDelay___block_invoke(uint64_t a1)
{
  [MEMORY[0x1E4F39CF8] begin];
  [MEMORY[0x1E4F39CF8] setAnimationDuration:0.5];
  [*(id *)(a1 + 32) setOpacity:0.0];
  v2 = (void *)MEMORY[0x1E4F39CF8];
  v3[0] = MEMORY[0x1E4F143A8];
  v3[1] = 3221225472;
  v3[2] = __62__UIView_Utilities__vk_autoFadeOutLayerWithPath_fadeOutDelay___block_invoke_2;
  v3[3] = &unk_1E6BF0D18;
  id v4 = *(id *)(a1 + 32);
  [v2 setCompletionBlock:v3];
  [MEMORY[0x1E4F39CF8] commit];
}

void __62__UIView_Utilities__vk_autoFadeOutLayerWithPath_fadeOutDelay___block_invoke_2(uint64_t a1)
{
  v1[0] = MEMORY[0x1E4F143A8];
  v1[1] = 3221225472;
  v1[2] = __62__UIView_Utilities__vk_autoFadeOutLayerWithPath_fadeOutDelay___block_invoke_3;
  v1[3] = &unk_1E6BF0D18;
  id v2 = *(id *)(a1 + 32);
  vk_dispatchMainAfterDelay(v1, 0.5);
}

uint64_t __62__UIView_Utilities__vk_autoFadeOutLayerWithPath_fadeOutDelay___block_invoke_3(uint64_t a1)
{
  return [*(id *)(a1 + 32) removeFromSuperlayer];
}

uint64_t __67__UIView_Utilities__vk_renderImageFromViewBackingStoreWithSubrect___block_invoke(uint64_t a1)
{
  [*(id *)(a1 + 32) bounds];
  double v2 = VKMMultiplyPointScalar(*(double *)(a1 + 40), *(double *)(a1 + 48), -1.0);
  v3 = *(void **)(a1 + 32);
  return [v3 drawViewHierarchyInRect:0 afterScreenUpdates:v2];
}

@end