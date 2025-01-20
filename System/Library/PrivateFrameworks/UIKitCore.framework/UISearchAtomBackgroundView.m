@interface UISearchAtomBackgroundView
@end

@implementation UISearchAtomBackgroundView

void __70___UISearchAtomBackgroundView__transitionFromBlurEffect_toBlurEffect___block_invoke(uint64_t a1)
{
  v2 = [[UIVisualEffectView alloc] initWithEffect:0];
  uint64_t v3 = *(void *)(a1 + 32);
  v4 = *(void **)(v3 + 408);
  *(void *)(v3 + 408) = v2;

  [*(id *)(a1 + 32) addSubview:*(void *)(*(void *)(a1 + 32) + 408)];
  [*(id *)(a1 + 32) bounds];
  objc_msgSend(*(id *)(*(void *)(a1 + 32) + 408), "setFrame:");
  v5 = *(void **)(a1 + 32);
  v6 = (void *)v5[51];
  id v13 = [v5 layer];
  [v13 cornerRadius];
  double v8 = v7;
  v9 = [*(id *)(a1 + 32) layer];
  v10 = [v9 cornerCurve];
  BOOL v11 = v10 == (void *)*MEMORY[0x1E4F39EA8];
  v12 = [*(id *)(a1 + 32) layer];
  objc_msgSend(v6, "_setCornerRadius:continuous:maskedCorners:", v11, objc_msgSend(v12, "maskedCorners"), v8);
}

uint64_t __70___UISearchAtomBackgroundView__transitionFromBlurEffect_toBlurEffect___block_invoke_2(uint64_t a1, uint64_t a2, uint64_t a3)
{
  if (a3)
  {
    objc_storeStrong((id *)(*(void *)(a1 + 32) + 408), *(id *)(a1 + 40));
    uint64_t v4 = *(void *)(a1 + 48);
    v5 = *(void **)(*(void *)(a1 + 32) + 408);
    return [v5 setEffect:v4];
  }
  else
  {
    double v7 = *(void **)(*(void *)(a1 + 32) + 408);
    return [v7 removeFromSuperview];
  }
}

@end