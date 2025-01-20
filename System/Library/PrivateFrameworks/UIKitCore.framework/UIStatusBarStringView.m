@interface UIStatusBarStringView
@end

@implementation UIStatusBarStringView

void __51___UIStatusBarStringView__updateAlternateTextTimer__block_invoke(uint64_t a1)
{
  v1 = (id *)(a1 + 32);
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  uint64_t v2 = [WeakRetained showsAlternateText] ^ 1;
  id v3 = objc_loadWeakRetained(v1);
  [v3 setShowsAlternateText:v2];
}

@end