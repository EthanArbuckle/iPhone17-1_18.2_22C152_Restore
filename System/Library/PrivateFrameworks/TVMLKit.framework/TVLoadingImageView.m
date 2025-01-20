@interface TVLoadingImageView
@end

@implementation TVLoadingImageView

void __37___TVLoadingImageView__fadeInFadeOut__block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained setAlpha:0.4];
}

void __37___TVLoadingImageView__fadeInFadeOut__block_invoke_2(uint64_t a1)
{
  v1 = (void *)MEMORY[0x263F1CB60];
  v5[0] = MEMORY[0x263EF8330];
  v5[1] = 3221225472;
  v5[2] = __37___TVLoadingImageView__fadeInFadeOut__block_invoke_3;
  v5[3] = &unk_264BA6A38;
  v2 = (id *)(a1 + 32);
  objc_copyWeak(&v6, (id *)(a1 + 32));
  v3[0] = MEMORY[0x263EF8330];
  v3[1] = 3221225472;
  v3[2] = __37___TVLoadingImageView__fadeInFadeOut__block_invoke_4;
  v3[3] = &unk_264BA7CC0;
  objc_copyWeak(&v4, v2);
  [v1 animateWithDuration:0 delay:v5 options:v3 animations:0.6 completion:0.0];
  objc_destroyWeak(&v4);
  objc_destroyWeak(&v6);
}

void __37___TVLoadingImageView__fadeInFadeOut__block_invoke_3(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained setAlpha:0.0];
}

void __37___TVLoadingImageView__fadeInFadeOut__block_invoke_4(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained _fadeInFadeOut];
}

@end