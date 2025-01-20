@interface VSIdentityProviderPickerViewController
@end

@implementation VSIdentityProviderPickerViewController

void __60__VSIdentityProviderPickerViewController_iOS_initWithStyle___block_invoke(uint64_t a1, void *a2)
{
  id v2 = a2;
  id v4 = [v2 fontCenter];
  v3 = [v2 traitCollection];

  [v4 setTraitCollection:v3];
}

uint64_t __89__VSIdentityProviderPickerViewController_iOS_dismissSearchControllerAnimated_completion___block_invoke(uint64_t a1)
{
  id v2 = *(void **)(a1 + 32);
  v3 = [v2 selectedIdentityProvider];
  [v2 _performSelectionForIdentityProvider:v3];

  [*(id *)(a1 + 32) setSelectedIdentityProvider:0];
  uint64_t result = *(void *)(a1 + 40);
  if (result)
  {
    v5 = *(uint64_t (**)(void))(result + 16);
    return v5();
  }
  return result;
}

void __57__VSIdentityProviderPickerViewController_iOS_viewDidLoad__block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  id v5 = a2;
  if (a3) {
    [*(id *)(a1 + 32) appendString:@"\n\n"];
  }
  [*(id *)(a1 + 32) appendString:v5];
}

uint64_t __63__VSIdentityProviderPickerViewController_iOS_showPrivacySheet___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _showPrivacySheet:*(void *)(a1 + 40)];
}

void __79__VSIdentityProviderPickerViewController_iOS_handleSignInActionWithCompletion___block_invoke(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) searchBarDelegate];
  [v2 clearText];

  [*(id *)(a1 + 32) setAdditionalProvidersMode:5];
  v3 = [*(id *)(a1 + 32) tableView];
  v4[0] = MEMORY[0x263EF8330];
  v4[1] = 3221225472;
  v4[2] = __79__VSIdentityProviderPickerViewController_iOS_handleSignInActionWithCompletion___block_invoke_2;
  v4[3] = &unk_265076E20;
  id v5 = *(id *)(a1 + 40);
  objc_msgSend(v3, "vs_scrollToTopAnimated:completion:", 1, v4);
}

uint64_t __79__VSIdentityProviderPickerViewController_iOS_handleSignInActionWithCompletion___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

@end