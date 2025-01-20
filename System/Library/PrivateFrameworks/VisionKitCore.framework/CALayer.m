@interface CALayer
@end

@implementation CALayer

void __51__CALayer_Utilities__vk_autoFadeOutShapePointLayer__block_invoke(uint64_t a1)
{
  [MEMORY[0x1E4F39CF8] begin];
  [MEMORY[0x1E4F39CF8] setAnimationDuration:0.5];
  [*(id *)(a1 + 32) setOpacity:0.0];
  v2 = (void *)MEMORY[0x1E4F39CF8];
  v3[0] = MEMORY[0x1E4F143A8];
  v3[1] = 3221225472;
  v3[2] = __51__CALayer_Utilities__vk_autoFadeOutShapePointLayer__block_invoke_2;
  v3[3] = &unk_1E6BF0D18;
  id v4 = *(id *)(a1 + 32);
  [v2 setCompletionBlock:v3];
  [MEMORY[0x1E4F39CF8] commit];
}

void __51__CALayer_Utilities__vk_autoFadeOutShapePointLayer__block_invoke_2(uint64_t a1)
{
  v1[0] = MEMORY[0x1E4F143A8];
  v1[1] = 3221225472;
  v1[2] = __51__CALayer_Utilities__vk_autoFadeOutShapePointLayer__block_invoke_3;
  v1[3] = &unk_1E6BF0D18;
  id v2 = *(id *)(a1 + 32);
  vk_dispatchMainAfterDelay(v1, 0.5);
}

uint64_t __51__CALayer_Utilities__vk_autoFadeOutShapePointLayer__block_invoke_3(uint64_t a1)
{
  return [*(id *)(a1 + 32) removeFromSuperlayer];
}

@end