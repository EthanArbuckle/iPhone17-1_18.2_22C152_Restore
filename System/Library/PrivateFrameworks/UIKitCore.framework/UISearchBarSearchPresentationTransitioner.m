@interface UISearchBarSearchPresentationTransitioner
@end

@implementation UISearchBarSearchPresentationTransitioner

void __53___UISearchBarSearchPresentationTransitioner_animate__block_invoke(uint64_t a1)
{
  v1[0] = MEMORY[0x1E4F143A8];
  v1[1] = 3221225472;
  v1[2] = __53___UISearchBarSearchPresentationTransitioner_animate__block_invoke_2;
  v1[3] = &unk_1E52D9F70;
  id v2 = *(id *)(a1 + 32);
  +[UIView addKeyframeWithRelativeStartTime:v1 relativeDuration:0.7 animations:0.3];
}

void __53___UISearchBarSearchPresentationTransitioner_animate__block_invoke_2(uint64_t a1)
{
  id v1 = [*(id *)(a1 + 32) scopeBarContainer];
  [v1 setAlpha:1.0];
}

@end