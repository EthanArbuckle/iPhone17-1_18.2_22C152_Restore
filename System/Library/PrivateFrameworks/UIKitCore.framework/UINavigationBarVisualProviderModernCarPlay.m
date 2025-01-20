@interface UINavigationBarVisualProviderModernCarPlay
@end

@implementation UINavigationBarVisualProviderModernCarPlay

uint64_t __55___UINavigationBarVisualProviderModernCarPlay_teardown__block_invoke(uint64_t a1, void *a2)
{
  return [a2 removeFromSuperview];
}

void __100___UINavigationBarVisualProviderModernCarPlay__updateContentForTopItem_backItem_animated_direction___block_invoke(uint64_t a1)
{
  v4[1] = *MEMORY[0x1E4F143B8];
  v4[0] = *(void *)(a1 + 40);
  v2 = [MEMORY[0x1E4F1C978] arrayWithObjects:v4 count:1];
  v3 = [*(id *)(a1 + 32) leadingBar];
  [v3 setBarButtonGroups:v2];
}

void __100___UINavigationBarVisualProviderModernCarPlay__updateContentForTopItem_backItem_animated_direction___block_invoke_3(uint64_t a1)
{
  v4[1] = *MEMORY[0x1E4F143B8];
  v4[0] = *(void *)(a1 + 40);
  v2 = [MEMORY[0x1E4F1C978] arrayWithObjects:v4 count:1];
  v3 = [*(id *)(a1 + 32) trailingBar];
  [v3 setBarButtonGroups:v2];
}

uint64_t __100___UINavigationBarVisualProviderModernCarPlay__updateContentForTopItem_backItem_animated_direction___block_invoke_5(uint64_t a1)
{
  v2 = [*(id *)(a1 + 32) navigationBar];
  [v2 layoutIfNeeded];

  [*(id *)(a1 + 40) setAlpha:0.0];
  [*(id *)(a1 + 48) setAlpha:0.0];
  [*(id *)(a1 + 56) setAlpha:1.0];
  [*(id *)(a1 + 64) setAlpha:1.0];
  v3 = *(void **)(a1 + 72);
  return [v3 setAlpha:1.0];
}

uint64_t __100___UINavigationBarVisualProviderModernCarPlay__updateContentForTopItem_backItem_animated_direction___block_invoke_6(uint64_t a1)
{
  v2 = [*(id *)(a1 + 32) contentView];
  [v2 setHidden:0];

  [*(id *)(a1 + 40) removeFromSuperview];
  v3 = *(void **)(a1 + 48);
  return [v3 removeFromSuperview];
}

@end