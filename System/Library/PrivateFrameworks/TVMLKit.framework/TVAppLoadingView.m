@interface TVAppLoadingView
@end

@implementation TVAppLoadingView

void __34___TVAppLoadingView_loadingScreen__block_invoke()
{
  id v9 = [MEMORY[0x263F086E0] mainBundle];
  v0 = objc_msgSend(v9, "tv_launchImage");
  v1 = [v9 objectForInfoDictionaryKey:@"UITemplateLaunchImage"];
  int v2 = [v1 BOOLValue];

  v3 = [_TVAppLoadingView alloc];
  v4 = [MEMORY[0x263F1C920] mainScreen];
  [v4 bounds];
  if (v2) {
    v5 = v0;
  }
  else {
    v5 = 0;
  }
  uint64_t v6 = -[_TVAppLoadingView initWithFrame:templateImage:](v3, "initWithFrame:templateImage:", v5);
  v7 = (void *)loadingScreen_loadingScreen;
  loadingScreen_loadingScreen = v6;

  uint64_t v8 = loadingScreen_loadingScreen;
  *(void *)(loadingScreen_loadingScreen + 432) = 0x4024000000000000;
  *(void *)(v8 + 440) = 0;
}

uint64_t __54___TVAppLoadingView_showOverKeyWindowWithSpinnerOnly___block_invoke(uint64_t a1, double a2)
{
  v3[0] = MEMORY[0x263EF8330];
  v3[1] = 3221225472;
  v3[2] = __54___TVAppLoadingView_showOverKeyWindowWithSpinnerOnly___block_invoke_2;
  v3[3] = &unk_264BA69A0;
  v3[4] = *(void *)(a1 + 32);
  return [MEMORY[0x263F1CB60] animateWithDuration:6 delay:v3 options:0 animations:0.6 completion:a2];
}

uint64_t __54___TVAppLoadingView_showOverKeyWindowWithSpinnerOnly___block_invoke_2(uint64_t a1)
{
  [*(id *)(*(void *)(a1 + 32) + 464) startAnimating];
  int v2 = *(void **)(*(void *)(a1 + 32) + 464);
  return [v2 setAlpha:1.0];
}

uint64_t __54___TVAppLoadingView_showOverKeyWindowWithSpinnerOnly___block_invoke_3(uint64_t a1)
{
  return (*(uint64_t (**)(double))(*(void *)(a1 + 32) + 16))(0.0);
}

uint64_t __25___TVAppLoadingView_hide__block_invoke(uint64_t a1)
{
  int v2 = *(id **)(a1 + 32);
  if (v2[57])
  {
    [v2[57] _setTintOpacity:0.0];
    [*(id *)(*(void *)(a1 + 32) + 448) setAlpha:0.0];
    [*(id *)(*(void *)(a1 + 32) + 464) setAlpha:0.0];
    int v2 = *(id **)(*(void *)(a1 + 32) + 408);
  }
  return [v2 setAlpha:0.0];
}

uint64_t __25___TVAppLoadingView_hide__block_invoke_2(uint64_t a1)
{
  [*(id *)(a1 + 32) setAlpha:0.0];
  [*(id *)(*(void *)(a1 + 32) + 464) stopAnimating];
  *(unsigned char *)(*(void *)(a1 + 32) + 424) = 0;
  int v2 = *(void **)(*(void *)(a1 + 32) + 416);
  return [v2 setHidden:1];
}

@end