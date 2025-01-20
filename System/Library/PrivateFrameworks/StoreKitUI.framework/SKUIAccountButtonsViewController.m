@interface SKUIAccountButtonsViewController
- (BOOL)isGiftingHidden;
- (BOOL)isTermsAndConditionsHidden;
- (SKUIAccountButtonsDelegate)delegate;
- (SKUIAccountButtonsViewController)initWithNibName:(id)a3 bundle:(id)a4;
- (SKUIClientContext)clientContext;
- (SKUILink)ECommerceLink;
- (id)_buttonsView;
- (unint64_t)navigationControllerSupportedInterfaceOrientations:(id)a3;
- (void)_accountStoreChangedNotification:(id)a3;
- (void)_ecommerceLinkAction:(id)a3;
- (void)_giftAction:(id)a3;
- (void)_openIForgot;
- (void)_redeemButtonAction:(id)a3;
- (void)_reloadAccountsButton;
- (void)_reloadRestrictions;
- (void)_restrictionsChangedNotification:(id)a3;
- (void)_sendDidSignIn;
- (void)_signInButtonAction:(id)a3;
- (void)_signOut;
- (void)_termsAndConditionsButtonAction:(id)a3;
- (void)_usernameButtonAction:(id)a3;
- (void)_viewAppleID;
- (void)dealloc;
- (void)loadView;
- (void)setClientContext:(id)a3;
- (void)setDelegate:(id)a3;
- (void)setECommerceLink:(id)a3;
- (void)setGiftingHidden:(BOOL)a3;
- (void)setTermsAndConditionsHidden:(BOOL)a3;
@end

@implementation SKUIAccountButtonsViewController

- (SKUIAccountButtonsViewController)initWithNibName:(id)a3 bundle:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if (os_variant_has_internal_content()
    && _os_feature_enabled_impl()
    && os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_FAULT))
  {
    -[SKUIAccountButtonsViewController initWithNibName:bundle:]();
  }
  v11.receiver = self;
  v11.super_class = (Class)SKUIAccountButtonsViewController;
  v8 = [(SKUIAccountButtonsViewController *)&v11 initWithNibName:v6 bundle:v7];
  if (v8)
  {
    v9 = [MEMORY[0x1E4F28EB8] defaultCenter];
    [v9 addObserver:v8 selector:sel__accountStoreChangedNotification_ name:*MEMORY[0x1E4FA83B8] object:0];
    [v9 addObserver:v8 selector:sel__restrictionsChangedNotification_ name:*MEMORY[0x1E4F73EC0] object:0];
  }
  return v8;
}

- (void)dealloc
{
  v3 = [MEMORY[0x1E4F28EB8] defaultCenter];
  [v3 removeObserver:self name:*MEMORY[0x1E4F73EC0] object:0];
  [v3 removeObserver:self name:*MEMORY[0x1E4FA83B8] object:0];
  v4 = [(SKUIAccountButtonsView *)self->_buttonsView appleIDButton];
  [v4 removeTarget:self action:0 forControlEvents:64];

  v5 = [(SKUIAccountButtonsView *)self->_buttonsView ECommerceButton];
  [v5 removeTarget:self action:0 forControlEvents:64];

  id v6 = [(SKUIAccountButtonsView *)self->_buttonsView redeemButton];
  [v6 removeTarget:self action:0 forControlEvents:64];

  id v7 = [(SKUIAccountButtonsView *)self->_buttonsView termsAndConditionsButton];
  [v7 removeTarget:self action:0 forControlEvents:64];

  v8.receiver = self;
  v8.super_class = (Class)SKUIAccountButtonsViewController;
  [(SKUIAccountButtonsViewController *)&v8 dealloc];
}

- (BOOL)isGiftingHidden
{
  v2 = [(SKUIAccountButtonsViewController *)self _buttonsView];
  char v3 = [v2 isGiftingHidden];

  return v3;
}

- (BOOL)isTermsAndConditionsHidden
{
  v2 = [(SKUIAccountButtonsViewController *)self _buttonsView];
  char v3 = [v2 isTermsAndConditionsHidden];

  return v3;
}

- (void)setECommerceLink:(id)a3
{
  id v7 = (SKUILink *)a3;
  if (self->_ecommerceLink != v7)
  {
    objc_storeStrong((id *)&self->_ecommerceLink, a3);
    v5 = [(SKUIAccountButtonsViewController *)self _buttonsView];
    id v6 = [(SKUILink *)v7 title];
    [v5 setECommerceLinkTitle:v6];
  }
}

- (void)setGiftingHidden:(BOOL)a3
{
  BOOL v3 = a3;
  id v4 = [(SKUIAccountButtonsViewController *)self _buttonsView];
  [v4 setGiftingHidden:v3];
}

- (void)setTermsAndConditionsHidden:(BOOL)a3
{
  BOOL v3 = a3;
  id v4 = [(SKUIAccountButtonsViewController *)self _buttonsView];
  [v4 setTermsAndConditionsHidden:v3];
}

- (void)loadView
{
  BOOL v3 = [(SKUIAccountButtonsViewController *)self _buttonsView];
  [(SKUIAccountButtonsViewController *)self setView:v3];

  [(SKUIAccountButtonsViewController *)self _reloadAccountsButton];

  [(SKUIAccountButtonsViewController *)self _reloadRestrictions];
}

- (void)_ecommerceLinkAction:(id)a3
{
  id v6 = [(SKUIAccountButtonsViewController *)self delegate];
  if (objc_opt_respondsToSelector())
  {
    [v6 accountButtonsViewControllerDidTapECommerceLink:self];
  }
  else
  {
    id v4 = [(SKUILink *)self->_ecommerceLink URL];
    v5 = v4;
    if (v4) {
      SKUIMetricsOpenURL(v4);
    }
  }
}

- (void)_giftAction:(id)a3
{
  v5 = [[SKUIGift alloc] initWithGiftCategory:0];
  id v4 = [[SKUIGiftViewController alloc] initWithGift:v5];
  [(SKUIGiftViewController *)v4 setClientContext:self->_clientContext];
  [(SKUIAccountButtonsViewController *)self presentViewController:v4 animated:1 completion:0];
}

- (void)_redeemButtonAction:(id)a3
{
  id v4 = [[SKUIRedeemViewController alloc] initWithRedeemCategory:0];
  [(SKUIRedeemViewController *)v4 setClientContext:self->_clientContext];
  [(SKUIAccountButtonsViewController *)self presentViewController:v4 animated:1 completion:0];
}

- (void)_signInButtonAction:(id)a3
{
  id v4 = a3;
  objc_initWeak(&location, self);
  id v5 = objc_alloc(MEMORY[0x1E4FA8128]);
  id v6 = [MEMORY[0x1E4FA8130] contextForSignIn];
  id v7 = (void *)[v5 initWithAuthenticationContext:v6];

  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __56__SKUIAccountButtonsViewController__signInButtonAction___block_invoke;
  v8[3] = &unk_1E6424220;
  objc_copyWeak(&v9, &location);
  [v7 startWithAuthenticateResponseBlock:v8];
  objc_destroyWeak(&v9);

  objc_destroyWeak(&location);
}

void __56__SKUIAccountButtonsViewController__signInButtonAction___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __56__SKUIAccountButtonsViewController__signInButtonAction___block_invoke_2;
  v5[3] = &unk_1E6425240;
  objc_copyWeak(&v7, (id *)(a1 + 32));
  id v6 = v3;
  id v4 = v3;
  dispatch_async(MEMORY[0x1E4F14428], v5);

  objc_destroyWeak(&v7);
}

void __56__SKUIAccountButtonsViewController__signInButtonAction___block_invoke_2(uint64_t a1)
{
  v2 = (id *)(a1 + 40);
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  [WeakRetained _reloadAccountsButton];

  if ([*(id *)(a1 + 32) authenticateResponseType] == 4)
  {
    id v4 = objc_loadWeakRetained(v2);
    [v4 _sendDidSignIn];
  }
}

- (void)_termsAndConditionsButtonAction:(id)a3
{
  objc_msgSend(MEMORY[0x1E4F1CB10], "termsAndConditionsURL", a3);
  id v3 = (id)objc_claimAutoreleasedReturnValue();
  SKUIMetricsOpenURL(v3);
}

- (void)_usernameButtonAction:(id)a3
{
  id v4 = a3;
  id v5 = [MEMORY[0x1E4FA8100] defaultStore];
  id v6 = [v5 activeAccount];

  if (!v6)
  {
    [(SKUIAccountButtonsViewController *)self _reloadAccountsButton];
    goto LABEL_28;
  }
  if (![(SKUIClientContext *)self->_clientContext isMultiUser]
    || ![(SKUIClientContext *)self->_clientContext isManagedAppleID])
  {
    id v7 = objc_alloc_init(MEMORY[0x1E4FB1418]);
    objc_super v8 = (void *)MEMORY[0x1E4F4F0E0];
    id v9 = [v6 accountName];
    v10 = [v8 formattedUsernameFromUsername:v9];
    [v7 setMessage:v10];

    [v7 setPreferredStyle:1];
    clientContext = self->_clientContext;
    if (clientContext) {
      [(SKUIClientContext *)clientContext localizedStringForKey:@"SIGN_IN_ALERT_TITLE"];
    }
    else {
    v12 = +[SKUIClientContext localizedStringForKey:@"SIGN_IN_ALERT_TITLE" inBundles:0];
    }
    [v7 setTitle:v12];

    if ([(SKUIClientContext *)self->_clientContext isMultiUser])
    {
      objc_initWeak(&location, self);
    }
    else
    {
      BOOL v13 = [(SKUIClientContext *)self->_clientContext isManagedAppleID];
      objc_initWeak(&location, self);
      if (v13)
      {
        char v14 = 1;
LABEL_16:
        v18 = self->_clientContext;
        v19 = v18;
        if (v18) {
          [(SKUIClientContext *)v18 localizedStringForKey:@"SIGN_IN_ALERT_SIGN_OUT"];
        }
        else {
        v20 = +[SKUIClientContext localizedStringForKey:@"SIGN_IN_ALERT_SIGN_OUT" inBundles:0];
        }

        v29[0] = MEMORY[0x1E4F143A8];
        v29[1] = 3221225472;
        v29[2] = __58__SKUIAccountButtonsViewController__usernameButtonAction___block_invoke_2;
        v29[3] = &unk_1E6422250;
        objc_copyWeak(&v30, &location);
        [v7 _addActionWithTitle:v20 style:0 handler:v29];

        if ((v14 & 1) == 0)
        {
          v21 = self->_clientContext;
          v22 = v21;
          if (v21) {
            [(SKUIClientContext *)v21 localizedStringForKey:@"SIGN_IN_ALERT_IFORGOT"];
          }
          else {
          v23 = +[SKUIClientContext localizedStringForKey:@"SIGN_IN_ALERT_IFORGOT" inBundles:0];
          }

          v27[0] = MEMORY[0x1E4F143A8];
          v27[1] = 3221225472;
          v27[2] = __58__SKUIAccountButtonsViewController__usernameButtonAction___block_invoke_3;
          v27[3] = &unk_1E6422250;
          objc_copyWeak(&v28, &location);
          [v7 _addActionWithTitle:v23 style:0 handler:v27];

          objc_destroyWeak(&v28);
        }
        v24 = self->_clientContext;
        v25 = v24;
        if (v24) {
          [(SKUIClientContext *)v24 localizedStringForKey:@"CANCEL"];
        }
        else {
        v26 = +[SKUIClientContext localizedStringForKey:@"CANCEL" inBundles:0];
        }

        [v7 _addActionWithTitle:v26 style:1 handler:0];
        [(SKUIAccountButtonsViewController *)self presentViewController:v7 animated:1 completion:0];
        objc_destroyWeak(&v30);
        objc_destroyWeak(&location);

        goto LABEL_28;
      }
    }
    v15 = self->_clientContext;
    v16 = v15;
    if (v15) {
      [(SKUIClientContext *)v15 localizedStringForKey:@"SIGN_IN_ALERT_VIEW_APPLE_ID"];
    }
    else {
    v17 = +[SKUIClientContext localizedStringForKey:@"SIGN_IN_ALERT_VIEW_APPLE_ID" inBundles:0];
    }

    v31[0] = MEMORY[0x1E4F143A8];
    v31[1] = 3221225472;
    v31[2] = __58__SKUIAccountButtonsViewController__usernameButtonAction___block_invoke;
    v31[3] = &unk_1E6422250;
    objc_copyWeak(&v32, &location);
    [v7 _addActionWithTitle:v17 style:0 handler:v31];

    objc_destroyWeak(&v32);
    char v14 = 0;
    goto LABEL_16;
  }
LABEL_28:
}

void __58__SKUIAccountButtonsViewController__usernameButtonAction___block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained _viewAppleID];
}

void __58__SKUIAccountButtonsViewController__usernameButtonAction___block_invoke_2(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained _signOut];
}

void __58__SKUIAccountButtonsViewController__usernameButtonAction___block_invoke_3(uint64_t a1)
{
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __58__SKUIAccountButtonsViewController__usernameButtonAction___block_invoke_4;
  block[3] = &unk_1E6422250;
  objc_copyWeak(&v2, (id *)(a1 + 32));
  dispatch_async(MEMORY[0x1E4F14428], block);
  objc_destroyWeak(&v2);
}

void __58__SKUIAccountButtonsViewController__usernameButtonAction___block_invoke_4(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained _openIForgot];
}

- (void)_accountStoreChangedNotification:(id)a3
{
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __69__SKUIAccountButtonsViewController__accountStoreChangedNotification___block_invoke;
  block[3] = &unk_1E6422020;
  void block[4] = self;
  dispatch_async(MEMORY[0x1E4F14428], block);
}

uint64_t __69__SKUIAccountButtonsViewController__accountStoreChangedNotification___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _reloadAccountsButton];
}

- (void)_restrictionsChangedNotification:(id)a3
{
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __69__SKUIAccountButtonsViewController__restrictionsChangedNotification___block_invoke;
  block[3] = &unk_1E6422020;
  void block[4] = self;
  dispatch_async(MEMORY[0x1E4F14428], block);
}

uint64_t __69__SKUIAccountButtonsViewController__restrictionsChangedNotification___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _reloadRestrictions];
}

- (unint64_t)navigationControllerSupportedInterfaceOrientations:(id)a3
{
  if (SKUIUserInterfaceIdiom(self->_clientContext) == 1) {
    return 30;
  }
  else {
    return 2;
  }
}

- (id)_buttonsView
{
  buttonsView = self->_buttonsView;
  if (!buttonsView)
  {
    id v4 = [[SKUIAccountButtonsView alloc] initWithClientContext:self->_clientContext];
    id v5 = self->_buttonsView;
    self->_buttonsView = v4;

    id v6 = [(SKUIAccountButtonsView *)self->_buttonsView ECommerceButton];
    [v6 addTarget:self action:sel__ecommerceLinkAction_ forControlEvents:64];

    id v7 = [(SKUIAccountButtonsView *)self->_buttonsView giftingButton];
    [v7 addTarget:self action:sel__giftAction_ forControlEvents:64];

    objc_super v8 = [(SKUIAccountButtonsView *)self->_buttonsView redeemButton];
    [v8 addTarget:self action:sel__redeemButtonAction_ forControlEvents:64];

    id v9 = [(SKUIAccountButtonsView *)self->_buttonsView termsAndConditionsButton];
    [v9 addTarget:self action:sel__termsAndConditionsButtonAction_ forControlEvents:64];

    buttonsView = self->_buttonsView;
  }

  return buttonsView;
}

- (void)_openIForgot
{
  id v2 = objc_alloc(MEMORY[0x1E4FB8830]);
  id v5 = (id)[v2 initWithURLBagKey:*MEMORY[0x1E4FA8960]];
  [v5 setITunesStoreURL:0];
  id v3 = (void *)[objc_alloc(MEMORY[0x1E4FB8828]) initWithOpenURLRequest:v5];
  id v4 = [MEMORY[0x1E4FB8838] mainQueue];
  [v4 addOperation:v3];
}

- (void)_reloadAccountsButton
{
  id v3 = [MEMORY[0x1E4FA8100] defaultStore];
  id v15 = [v3 activeAccount];

  id v4 = [(SKUIAccountButtonsView *)self->_buttonsView appleIDButton];
  if (v15)
  {
    id v5 = (void *)MEMORY[0x1E4F4F0E0];
    id v6 = [v15 accountName];
    id v7 = [v5 formattedUsernameFromUsername:v6];

    clientContext = self->_clientContext;
    if (clientContext) {
      [(SKUIClientContext *)clientContext localizedStringForKey:@"ACCOUNT_BUTTON_APPLE_ID"];
    }
    else {
    v10 = +[SKUIClientContext localizedStringForKey:@"ACCOUNT_BUTTON_APPLE_ID" inBundles:0];
    }
    objc_super v11 = [NSString stringWithValidatedFormat:v10, @"%@", 0, v7 validFormatSpecifiers error];
    [v4 setTitle:v11 forState:0];
    [v4 removeTarget:self action:0 forControlEvents:64];
    [v4 addTarget:self action:sel__usernameButtonAction_ forControlEvents:64];
    buttonsView = self->_buttonsView;
    BOOL v13 = [v15 creditsString];
    [(SKUIAccountButtonsView *)buttonsView setAccountCredits:v13];
  }
  else
  {
    id v9 = self->_clientContext;
    if (v9) {
      [(SKUIClientContext *)v9 localizedStringForKey:@"ACCOUNT_BUTTON_SIGN_IN"];
    }
    else {
    char v14 = +[SKUIClientContext localizedStringForKey:@"ACCOUNT_BUTTON_SIGN_IN" inBundles:0];
    }
    [v4 setTitle:v14 forState:0];

    [v4 removeTarget:self action:0 forControlEvents:64];
    [v4 addTarget:self action:sel__signInButtonAction_ forControlEvents:64];
    [(SKUIAccountButtonsView *)self->_buttonsView setAccountCredits:0];
  }
  [(SKUIAccountButtonsView *)self->_buttonsView setNeedsLayout];
}

- (void)_reloadRestrictions
{
  id v3 = [MEMORY[0x1E4F74230] sharedConnection];
  int v4 = [v3 effectiveBoolValueForSetting:*MEMORY[0x1E4F73ED0]];

  id v5 = +[SKUIItemStateCenter defaultCenter];
  int v6 = [v5 isRunningInStoreDemoMode];

  id v7 = [(SKUIAccountButtonsView *)self->_buttonsView appleIDButton];
  objc_super v8 = v7;
  if (v4 == 2) {
    uint64_t v9 = 0;
  }
  else {
    uint64_t v9 = v6 ^ 1u;
  }
  [v7 setEnabled:v9];

  v10 = [(SKUIAccountButtonsView *)self->_buttonsView giftingButton];
  [v10 setEnabled:v6 ^ 1u];

  id v11 = [(SKUIAccountButtonsView *)self->_buttonsView redeemButton];
  [v11 setEnabled:v6 ^ 1u];
}

- (void)_sendDidSignIn
{
  p_delegate = &self->_delegate;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  char v5 = objc_opt_respondsToSelector();

  if (v5)
  {
    id v6 = objc_loadWeakRetained((id *)p_delegate);
    [v6 accountButtonsViewControllerDidSignIn:self];
  }
}

- (void)_signOut
{
  id v7 = [MEMORY[0x1E4FA8100] defaultStore];
  id v3 = [v7 activeAccount];
  if (v3)
  {
    [v7 signOutAccount:v3];
    [(SKUIAccountButtonsViewController *)self _reloadAccountsButton];
    id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
    char v5 = objc_opt_respondsToSelector();

    if (v5)
    {
      id v6 = objc_loadWeakRetained((id *)&self->_delegate);
      [v6 accountButtonsViewControllerDidSignOut:self];
    }
  }
}

- (void)_viewAppleID
{
  id v5 = [(SKUIClientContext *)self->_clientContext clientInterface];
  id v3 = objc_alloc_init(MEMORY[0x1E4FB8888]);
  [v3 setCanMoveToOverlay:0];
  [v3 setClientInterface:v5];
  [v3 setStyle:2];
  int v4 = (void *)[objc_alloc(MEMORY[0x1E4FB19E8]) initWithRootViewController:v3];
  [v4 setDelegate:self];
  [v4 setModalPresentationStyle:2];
  [(SKUIAccountButtonsViewController *)self presentViewController:v4 animated:1 completion:0];
}

- (SKUIClientContext)clientContext
{
  return self->_clientContext;
}

- (void)setClientContext:(id)a3
{
}

- (SKUIAccountButtonsDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  return (SKUIAccountButtonsDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (SKUILink)ECommerceLink
{
  return self->_ecommerceLink;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_ecommerceLink, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_clientContext, 0);

  objc_storeStrong((id *)&self->_buttonsView, 0);
}

- (void)initWithNibName:bundle:.cold.1()
{
  uint64_t v2 = *MEMORY[0x1E4F143B8];
  int v0 = 136446210;
  v1 = "-[SKUIAccountButtonsViewController initWithNibName:bundle:]";
}

@end