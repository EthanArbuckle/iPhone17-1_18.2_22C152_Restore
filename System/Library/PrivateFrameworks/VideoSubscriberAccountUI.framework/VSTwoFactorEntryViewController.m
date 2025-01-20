@interface VSTwoFactorEntryViewController
@end

@implementation VSTwoFactorEntryViewController

void __49__VSTwoFactorEntryViewController_iOS_viewDidLoad__block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v4 = a2;
  id v5 = a3;
  id v17 = v4;
  v6 = [v17 traitCollection];
  uint64_t v7 = [v6 userInterfaceStyle];
  uint64_t v8 = [v5 userInterfaceStyle];

  if (v7 != v8)
  {
    v9 = [v17 traitCollection];
    uint64_t v10 = [v9 userInterfaceStyle];

    v11 = [v17 viewModel];
    [v17 preferredLogoSize];
    objc_msgSend(v17, "vs_updateViewModel:withUserInterfaceStyle:andPreferredLogoSize:", v11, v10);
  }
  v12 = [v17 traitCollection];
  v13 = [v12 preferredContentSizeCategory];
  v14 = [v5 preferredContentSizeCategory];

  if (v13 != v14)
  {
    v15 = [v17 fontCenter];
    v16 = [v17 traitCollection];
    [v15 setTraitCollection:v16];
  }
}

void __52__VSTwoFactorEntryViewController_iOS_viewDidAppear___block_invoke(uint64_t a1)
{
  id v1 = [*(id *)(a1 + 32) digitView];
  [v1 becomeFirstResponder];
}

@end