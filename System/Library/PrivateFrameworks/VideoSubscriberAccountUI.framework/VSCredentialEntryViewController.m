@interface VSCredentialEntryViewController
@end

@implementation VSCredentialEntryViewController

void __62__VSCredentialEntryViewController_iOS_initWithNibName_bundle___block_invoke(uint64_t a1, void *a2)
{
  id v7 = a2;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    v4 = [v7 object];
    v5 = [v4 text];
    v6 = [WeakRetained _specifierForTextField:v4];
    if (v6) {
      [WeakRetained _setText:v5 forSpecifier:v6];
    }
  }
}

void __62__VSCredentialEntryViewController_iOS_initWithNibName_bundle___block_invoke_2(uint64_t a1, void *a2)
{
  id v3 = a2;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    v5 = [v3 userInfo];
    v6 = [v5 objectForKey:*MEMORY[0x263F1D428]];
    [v6 CGRectValue];
    double v8 = v7;

    v9 = [v5 objectForKey:*MEMORY[0x263F1D3F8]];
    [v9 doubleValue];
    double v11 = v10;

    v12 = [v5 objectForKey:*MEMORY[0x263F1D3F0]];
    uint64_t v13 = [v12 unsignedIntegerValue];

    [WeakRetained setKeyboardHeight:v8];
    v14 = [WeakRetained table];
    v15 = (void *)MEMORY[0x263F1CB60];
    v17[0] = MEMORY[0x263EF8330];
    v17[1] = 3221225472;
    v17[2] = __62__VSCredentialEntryViewController_iOS_initWithNibName_bundle___block_invoke_3;
    v17[3] = &unk_265077268;
    id v18 = WeakRetained;
    id v19 = v14;
    double v20 = v8;
    id v16 = v14;
    [v15 animateWithDuration:v13 << 16 delay:v17 options:0 animations:v11 completion:0.0];
  }
}

uint64_t __62__VSCredentialEntryViewController_iOS_initWithNibName_bundle___block_invoke_3(uint64_t a1)
{
  [*(id *)(a1 + 32) _updateLinkButtonLayout];
  [*(id *)(a1 + 40) scrollIndicatorInsets];
  v2 = *(void **)(a1 + 40);
  return objc_msgSend(v2, "setScrollIndicatorInsets:");
}

void __62__VSCredentialEntryViewController_iOS_initWithNibName_bundle___block_invoke_4(uint64_t a1, void *a2)
{
  id v3 = a2;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    v5 = [v3 userInfo];
    v6 = [v5 objectForKey:*MEMORY[0x263F1D420]];
    [v6 CGRectValue];
    double v8 = v7;

    v9 = [v5 objectForKey:*MEMORY[0x263F1D3F8]];
    [v9 doubleValue];
    double v11 = v10;

    v12 = [v5 objectForKey:*MEMORY[0x263F1D3F0]];
    uint64_t v13 = [v12 unsignedIntegerValue];

    [WeakRetained setKeyboardHeight:v8];
    v14 = [WeakRetained table];
    v15 = (void *)MEMORY[0x263F1CB60];
    v17[0] = MEMORY[0x263EF8330];
    v17[1] = 3221225472;
    v17[2] = __62__VSCredentialEntryViewController_iOS_initWithNibName_bundle___block_invoke_5;
    v17[3] = &unk_265077268;
    id v18 = WeakRetained;
    id v19 = v14;
    double v20 = v8;
    id v16 = v14;
    [v15 animateWithDuration:v13 << 16 delay:v17 options:0 animations:v11 completion:0.0];
  }
}

uint64_t __62__VSCredentialEntryViewController_iOS_initWithNibName_bundle___block_invoke_5(uint64_t a1)
{
  [*(id *)(a1 + 32) _updateLinkButtonLayout];
  [*(id *)(a1 + 40) scrollIndicatorInsets];
  v2 = *(void **)(a1 + 40);
  return objc_msgSend(v2, "setScrollIndicatorInsets:");
}

void __62__VSCredentialEntryViewController_iOS_initWithNibName_bundle___block_invoke_6(uint64_t a1, void *a2)
{
  id v2 = a2;
  id v3 = [v2 traitCollection];
  uint64_t v4 = [v3 userInterfaceStyle];

  id v6 = v2;
  v5 = [v6 viewModel];
  [v6 preferredLogoSize];
  objc_msgSend(v6, "vs_updateViewModel:withUserInterfaceStyle:andPreferredLogoSize:", v5, v4);
}

void __86__VSCredentialEntryViewController_iOS_observeValueForKeyPath_ofObject_change_context___block_invoke(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) pickerButtonSpecifier];
  id v3 = [*(id *)(a1 + 32) pickerTitle];
  [v2 setName:v3];

  uint64_t v4 = *(void **)(a1 + 32);
  v5 = [v4 pickerButtonSpecifier];
  [v4 reloadSpecifier:v5];

  id v6 = *(void **)(a1 + 32);
  id v7 = [v6 pickerSpecifier];
  [v6 reloadSpecifier:v7];
}

@end