@interface TVBgImageLoadingViewController
@end

@implementation TVBgImageLoadingViewController

void __64___TVBgImageLoadingViewController_configureAppearanceTransition__block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v3 = [WeakRetained navigationController];
  id v5 = [v3 navigationBar];

  v4 = objc_msgSend(MEMORY[0x263F1C550], "tvmlkit_keyColor");
  [v5 setTintColor:v4];

  [v5 _setBackgroundOpacity:*(double *)(a1 + 40)];
  [v5 _setTitleOpacity:*(double *)(a1 + 40)];
}

void __64___TVBgImageLoadingViewController_configureAppearanceTransition__block_invoke_2(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v3 = [WeakRetained navigationController];
  id v5 = [v3 navigationBar];

  v4 = objc_msgSend(MEMORY[0x263F1C550], "tvmlkit_keyColor");
  [v5 setTintColor:v4];

  [v5 _setBackgroundOpacity:*(double *)(a1 + 40)];
  [v5 _setTitleOpacity:*(double *)(a1 + 40)];
}

void __69___TVBgImageLoadingViewController_loadFromViewController_completion___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  v5[0] = MEMORY[0x263EF8330];
  v5[1] = 3221225472;
  v5[2] = __69___TVBgImageLoadingViewController_loadFromViewController_completion___block_invoke_2;
  v5[3] = &unk_264BA7928;
  objc_copyWeak(&v8, (id *)(a1 + 40));
  id v6 = v3;
  char v9 = *(unsigned char *)(a1 + 48);
  id v7 = *(id *)(a1 + 32);
  char v10 = *(unsigned char *)(a1 + 49);
  id v4 = v3;
  dispatch_async(MEMORY[0x263EF83A0], v5);

  objc_destroyWeak(&v8);
}

void __69___TVBgImageLoadingViewController_loadFromViewController_completion___block_invoke_2(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  if (WeakRetained)
  {
    v2 = [*(id *)(a1 + 32) uiImage];
    id v3 = (void *)WeakRetained[122];
    WeakRetained[122] = 0;

    [WeakRetained _configureWithBgImage:v2 backdropImage:0];
  }
  else
  {
    v2 = 0;
  }
  if (!*(unsigned char *)(a1 + 56))
  {
    uint64_t v4 = *(void *)(a1 + 40);
    if (v4) {
      (*(void (**)(uint64_t, void, BOOL))(v4 + 16))(v4, *(unsigned __int8 *)(a1 + 57), v2 != 0);
    }
  }
}

@end