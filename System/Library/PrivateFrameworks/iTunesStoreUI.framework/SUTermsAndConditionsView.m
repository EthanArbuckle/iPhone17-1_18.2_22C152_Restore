@interface SUTermsAndConditionsView
- (BOOL)hideAccountButton;
- (SUClientInterface)clientInterface;
- (SUTermsAndConditionsView)initWithFrame:(CGRect)a3;
- (SUTermsAndConditionsViewDelegate)delegate;
- (double)_buttonHeightForStyle:(int64_t)a3;
- (double)rightMargin;
- (id)_button;
- (id)_termsAndConditionsControl;
- (int64_t)_linkStyleForStyle:(int64_t)a3;
- (int64_t)style;
- (void)_buttonAction:(id)a3;
- (void)_clearButtonSelection:(id)a3;
- (void)_destroyButton;
- (void)_termsAndConditionsAction:(id)a3;
- (void)_updateButton;
- (void)dealloc;
- (void)layoutSubviews;
- (void)setClientInterface:(id)a3;
- (void)setDelegate:(id)a3;
- (void)setHideAccountButton:(BOOL)a3;
- (void)setRightMargin:(double)a3;
- (void)setStyle:(int64_t)a3;
- (void)sizeToFit;
@end

@implementation SUTermsAndConditionsView

- (SUTermsAndConditionsView)initWithFrame:(CGRect)a3
{
  v6.receiver = self;
  v6.super_class = (Class)SUTermsAndConditionsView;
  v3 = -[SUTermsAndConditionsView initWithFrame:](&v6, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  if (v3)
  {
    v4 = (void *)[MEMORY[0x263F08A00] defaultCenter];
    [v4 addObserver:v3 selector:sel__accountsChangedNotification_ name:*MEMORY[0x263F7B440] object:0];
  }
  return v3;
}

- (void)dealloc
{
  v3 = (void *)[MEMORY[0x263F08A00] defaultCenter];
  [v3 removeObserver:self name:*MEMORY[0x263F7B440] object:0];
  [(SUTermsAndConditionsView *)self _destroyButton];

  [(SULinkControl *)self->_termsAndConditionsControl removeTarget:self action:0 forControlEvents:0xFFFFFFFFLL];
  self->_termsAndConditionsControl = 0;
  v4.receiver = self;
  v4.super_class = (Class)SUTermsAndConditionsView;
  [(SUTermsAndConditionsView *)&v4 dealloc];
}

- (SUTermsAndConditionsViewDelegate)delegate
{
  return (SUTermsAndConditionsViewDelegate *)objc_loadWeak((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
}

- (void)setHideAccountButton:(BOOL)a3
{
  if (self->_hideAccountButton != a3)
  {
    self->_hideAccountButton = a3;
    [(SUTermsAndConditionsView *)self _destroyButton];
    [(SUTermsAndConditionsView *)self setNeedsLayout];
  }
}

- (void)setRightMargin:(double)a3
{
  if (self->_rightMargin != a3)
  {
    self->_rightMargin = a3;
    [(SUTermsAndConditionsView *)self setNeedsLayout];
  }
}

- (void)setStyle:(int64_t)a3
{
  if (self->_style != a3)
  {
    self->_style = a3;
    [(SUTermsAndConditionsView *)self _destroyButton];
    [(SULinkControl *)self->_termsAndConditionsControl setStyle:[(SUTermsAndConditionsView *)self _linkStyleForStyle:self->_style]];
    [(SUTermsAndConditionsView *)self setNeedsLayout];
  }
}

- (void)layoutSubviews
{
  [(SUTermsAndConditionsView *)self bounds];
  double v4 = v3 - self->_rightMargin;
  if (!self->_hideAccountButton)
  {
    id v5 = [(SUTermsAndConditionsView *)self _button];
    [(SUTermsAndConditionsView *)self _buttonHeightForStyle:self->_style];
    objc_msgSend(v5, "setFrame:", 9.0, 8.0, v4 + -9.0 + -9.0, v6);
  }
  id v7 = [(SUTermsAndConditionsView *)self _termsAndConditionsControl];
  [v7 frame];
  double v9 = ceil((v4 - v8) * 0.5);
  double v10 = 91.0;
  if (self->_hideAccountButton) {
    double v10 = 26.0;
  }

  objc_msgSend(v7, "setFrame:", v9, v10);
}

- (void)sizeToFit
{
  [(SUTermsAndConditionsView *)self frame];

  -[SUTermsAndConditionsView setFrame:](self, "setFrame:");
}

- (void)_buttonAction:(id)a3
{
  id v5 = objc_msgSend((id)objc_msgSend((id)objc_msgSend(MEMORY[0x263F7B0E8], "defaultStore"), "activeAccount"), "accountName");
  if ([v5 length])
  {
    double v6 = objc_msgSend(MEMORY[0x263F1C3F8], "alertControllerWithTitle:message:preferredStyle:", objc_msgSend((id)objc_msgSend(MEMORY[0x263F086E0], "bundleForClass:", objc_opt_class()), "localizedStringForKey:value:table:", @"ITUNES_ACCOUNT", &stru_26DB8C5F8, 0), v5, 1);
    id v7 = (void *)MEMORY[0x263F1C3F0];
    uint64_t v8 = objc_msgSend((id)objc_msgSend(MEMORY[0x263F086E0], "bundleForClass:", objc_opt_class()), "localizedStringForKey:value:table:", @"VIEW_ACCOUNT", &stru_26DB8C5F8, 0);
    v11[0] = MEMORY[0x263EF8330];
    v11[1] = 3221225472;
    v11[2] = __42__SUTermsAndConditionsView__buttonAction___block_invoke;
    v11[3] = &unk_264812880;
    v11[4] = self;
    objc_msgSend(v6, "addAction:", objc_msgSend(v7, "actionWithTitle:style:handler:", v8, 0, v11));
    objc_msgSend(v6, "addAction:", objc_msgSend(MEMORY[0x263F1C3F0], "actionWithTitle:style:handler:", objc_msgSend((id)objc_msgSend(MEMORY[0x263F086E0], "bundleForClass:", objc_opt_class()), "localizedStringForKey:value:table:", @"SIGN_OUT", &stru_26DB8C5F8, 0), 0, &__block_literal_global_3));
    objc_msgSend(v6, "addAction:", objc_msgSend(MEMORY[0x263F1C3F0], "actionWithTitle:style:handler:", objc_msgSend((id)objc_msgSend(MEMORY[0x263F086E0], "bundleForClass:", objc_opt_class()), "localizedStringForKey:value:table:", @"FORGOT_PASSWORD", &stru_26DB8C5F8, 0), 0, &__block_literal_global_28));
    objc_msgSend(v6, "addAction:", objc_msgSend(MEMORY[0x263F1C3F0], "actionWithTitle:style:handler:", objc_msgSend((id)objc_msgSend(MEMORY[0x263F086E0], "bundleForClass:", objc_opt_class()), "localizedStringForKey:value:table:", @"CANCEL", &stru_26DB8C5F8, 0), 1, 0));
    objc_msgSend((id)-[SUTermsAndConditionsViewDelegate viewControllerForPresentingAccountAlertControllerFromTermsAndConditionsView:](-[SUTermsAndConditionsView delegate](self, "delegate"), "viewControllerForPresentingAccountAlertControllerFromTermsAndConditionsView:", self), "presentViewController:animated:completion:", v6, 1, 0);
  }
  else
  {
    id v9 = objc_alloc(MEMORY[0x263F89520]);
    double v10 = objc_msgSend(v9, "initWithAuthenticationContext:", objc_msgSend(MEMORY[0x263F7B120], "contextForSignIn"));
    objc_msgSend((id)objc_msgSend(MEMORY[0x263F894E0], "mainQueue"), "addOperation:", v10);
  }
  [(SUTermsAndConditionsView *)self performSelector:sel__clearButtonSelection_ withObject:a3 afterDelay:0.100000001];
}

void __42__SUTermsAndConditionsView__buttonAction___block_invoke(uint64_t a1)
{
  v2 = objc_alloc_init(SUAccountViewController);
  -[SUViewController setClientInterface:](v2, "setClientInterface:", [*(id *)(a1 + 32) clientInterface]);
  [(SUAccountViewController *)v2 setStyle:2];
  +[SUClientDispatch enterAccountFlowWithViewController:v2 animated:1];
}

uint64_t __42__SUTermsAndConditionsView__buttonAction___block_invoke_2()
{
  v0 = (void *)[MEMORY[0x263F7B0E8] defaultStore];

  return [v0 signOutAllAccounts];
}

void __42__SUTermsAndConditionsView__buttonAction___block_invoke_3()
{
  id v0 = objc_alloc(MEMORY[0x263F894D0]);
  id v2 = (id)[v0 initWithURLBagKey:*MEMORY[0x263F7BCC0]];
  [v2 setITunesStoreURL:0];
  v1 = (void *)[objc_alloc(MEMORY[0x263F894C8]) initWithOpenURLRequest:v2];
  objc_msgSend((id)objc_msgSend(MEMORY[0x263F894E0], "mainQueue"), "addOperation:", v1);
}

- (void)_termsAndConditionsAction:(id)a3
{
  uint64_t v4 = objc_msgSend(NSURL, "termsAndConditionsURL", a3);
  id v5 = [(SUTermsAndConditionsView *)self clientInterface];

  SUOpenExternalURL(v4, v5);
}

- (id)_button
{
  id result = self->_button;
  if (!result)
  {
    objc_msgSend((id)objc_msgSend(MEMORY[0x263F1C920], "mainScreen"), "bounds");
    double v5 = v4 + -18.0;
    [(SUTermsAndConditionsView *)self _buttonHeightForStyle:self->_style];
    int64_t style = self->_style;
    if (style == 2)
    {
      uint64_t v8 = -[SUSubtitledButton initWithFrame:]([SUSubtitledButton alloc], "initWithFrame:", 9.0, 8.0, v5, v6);
      self->_button = v8;
      -[SUSubtitledButton setTitleEdgeInsets:](v8, "setTitleEdgeInsets:", 0.0, 7.0, 0.0, 7.0);
      uint64_t v9 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
      -[SUSubtitledButton setBackgroundImage:forState:](self->_button, "setBackgroundImage:forState:", objc_msgSend((id)objc_msgSend(MEMORY[0x263F1C6B0], "imageNamed:inBundle:", @"GradientButtonBackground.png", v9), "stretchableImageWithLeftCapWidth:topCapHeight:", 7, 0), 0);
      -[SUSubtitledButton setTitleColor:forState:](self->_button, "setTitleColor:forState:", [MEMORY[0x263F1C550] blackColor], 0);
      uint64_t v10 = objc_msgSend((id)objc_msgSend(MEMORY[0x263F1C6B0], "imageNamed:inBundle:", @"GradientButtonBackgroundPressed.png", v9), "stretchableImageWithLeftCapWidth:topCapHeight:", 7, 0);
      [(SUSubtitledButton *)self->_button setBackgroundImage:v10 forState:1];
      button = self->_button;
      uint64_t v12 = v10;
    }
    else
    {
      if (!style)
      {
        self->_button = (SUSubtitledButton *)-[SURoundedCornersButton initWithFrame:]([SURoundedCornersButton alloc], "initWithFrame:", 9.0, 8.0, v5, v6);
LABEL_8:
        [(SUSubtitledButton *)self->_button addTarget:self action:sel__buttonAction_ forControlEvents:64];
        -[SUSubtitledButton setSubtitleColor:forState:](self->_button, "setSubtitleColor:forState:", [MEMORY[0x263F1C550] blackColor], 0);
        -[SUSubtitledButton setSubtitleColor:forState:](self->_button, "setSubtitleColor:forState:", [MEMORY[0x263F1C550] whiteColor], 1);
        -[SUSubtitledButton setSubtitleColor:forState:](self->_button, "setSubtitleColor:forState:", [MEMORY[0x263F1C550] whiteColor], 4);
        [(SUSubtitledButton *)self->_button setSubtitleShadowColor:0 forState:0];
        [(SUSubtitledButton *)self->_button setSubtitleShadowColor:0 forState:1];
        [(SUSubtitledButton *)self->_button setSubtitleShadowColor:0 forState:4];
        -[SUSubtitledButton setTitleColor:forState:](self->_button, "setTitleColor:forState:", [MEMORY[0x263F1C550] blackColor], 0);
        -[SUSubtitledButton setTitleColor:forState:](self->_button, "setTitleColor:forState:", [MEMORY[0x263F1C550] whiteColor], 1);
        -[SUSubtitledButton setTitleColor:forState:](self->_button, "setTitleColor:forState:", [MEMORY[0x263F1C550] whiteColor], 4);
        [(SUSubtitledButton *)self->_button setTitleShadowColor:0 forState:0];
        [(SUSubtitledButton *)self->_button setTitleShadowColor:0 forState:1];
        [(SUSubtitledButton *)self->_button setTitleShadowColor:0 forState:4];
        [(SUSubtitledButton *)self->_button titleEdgeInsets];
        [(SUSubtitledButton *)self->_button setTitleEdgeInsets:v16 + 1.0];
        v17 = (void *)[(SUSubtitledButton *)self->_button titleLabel];
        objc_msgSend(v17, "setFont:", objc_msgSend(MEMORY[0x263F1C658], "boldSystemFontOfSize:", 14.0));
        [v17 setTextAlignment:1];
        v18 = [(SUSubtitledButton *)self->_button subtitleLabel];
        -[UILabel setFont:](v18, "setFont:", [MEMORY[0x263F1C658] systemFontOfSize:13.0]);
        [(UILabel *)v18 setTextAlignment:1];
        [(SUTermsAndConditionsView *)self addSubview:self->_button];
        [(SUTermsAndConditionsView *)self _updateButton];
        return self->_button;
      }
      v13 = -[SUSubtitledButton initWithFrame:]([SUSubtitledButton alloc], "initWithFrame:", 9.0, 8.0, v5, v6);
      self->_button = v13;
      -[SUSubtitledButton setTitleEdgeInsets:](v13, "setTitleEdgeInsets:", 0.0, 7.0, 0.0, 7.0);
      -[SUSubtitledButton setBackgroundImage:forState:](self->_button, "setBackgroundImage:forState:", objc_msgSend((id)objc_msgSend(MEMORY[0x263F1C6B0], "imageNamed:", @"AccountButtonBackground.png"), "stretchableImageWithLeftCapWidth:topCapHeight:", 7, 0), 0);
      v14 = objc_msgSend(MEMORY[0x263F1C6B0], "imageNamed:inBundle:", @"GradientButtonBackgroundPressed.png", objc_msgSend(MEMORY[0x263F086E0], "bundleForClass:", objc_opt_class()));
      -[SUSubtitledButton setBackgroundImage:forState:](self->_button, "setBackgroundImage:forState:", [v14 stretchableImageWithLeftCapWidth:7 topCapHeight:0], 1);
      v15 = self->_button;
      uint64_t v12 = [v14 stretchableImageWithLeftCapWidth:7 topCapHeight:0];
      button = v15;
    }
    [(SUSubtitledButton *)button setBackgroundImage:v12 forState:4];
    goto LABEL_8;
  }
  return result;
}

- (double)_buttonHeightForStyle:(int64_t)a3
{
  double result = 47.0;
  if (!a3) {
    return 48.0;
  }
  return result;
}

- (void)_clearButtonSelection:(id)a3
{
  [MEMORY[0x263F8C6D0] cancelPreviousPerformRequestsWithTarget:self selector:a2 object:a3];

  [a3 setSelected:0];
}

- (void)_destroyButton
{
  self->_button = 0;
}

- (int64_t)_linkStyleForStyle:(int64_t)a3
{
  return 2 * (a3 == 1);
}

- (id)_termsAndConditionsControl
{
  id result = self->_termsAndConditionsControl;
  if (!result)
  {
    double v4 = objc_alloc_init(SULinkControl);
    self->_termsAndConditionsControl = v4;
    [(SULinkControl *)v4 addTarget:self action:sel__termsAndConditionsAction_ forControlEvents:64];
    -[SULinkControl setBackgroundColor:](self->_termsAndConditionsControl, "setBackgroundColor:", [MEMORY[0x263F1C550] clearColor]);
    LODWORD(v5) = -1097229926;
    [(SULinkControl *)self->_termsAndConditionsControl setCharge:v5];
    [(SULinkControl *)self->_termsAndConditionsControl setStyle:[(SUTermsAndConditionsView *)self _linkStyleForStyle:self->_style]];
    -[SULinkControl setText:](self->_termsAndConditionsControl, "setText:", objc_msgSend((id)objc_msgSend(MEMORY[0x263F086E0], "bundleForClass:", objc_opt_class()), "localizedStringForKey:value:table:", @"TERMS_AND_CONDITIONS", &stru_26DB8C5F8, 0));
    [(SULinkControl *)self->_termsAndConditionsControl sizeToFit];
    [(SUTermsAndConditionsView *)self addSubview:self->_termsAndConditionsControl];
    return self->_termsAndConditionsControl;
  }
  return result;
}

- (void)_updateButton
{
  double v3 = objc_msgSend((id)objc_msgSend(MEMORY[0x263F7B0E8], "defaultStore"), "activeAccount");
  double v4 = (void *)[v3 accountName];
  if ([v4 length])
  {
    double v5 = (void *)[v3 creditsString];
    uint64_t v6 = [v5 length];
    button = self->_button;
    if (v6) {
      uint64_t v8 = objc_msgSend(NSString, "stringWithFormat:", objc_msgSend((id)objc_msgSend(MEMORY[0x263F086E0], "bundleForClass:", objc_opt_class()), "localizedStringForKey:value:table:", @"ACCOUNT_BUTTON_CREDIT_FORMAT", &stru_26DB8C5F8, 0), v5);
    }
    else {
      uint64_t v8 = 0;
    }
    [(SUSubtitledButton *)button setSubtitle:v8 forState:0];
    uint64_t v12 = self->_button;
    uint64_t v10 = objc_msgSend(NSString, "stringWithFormat:", objc_msgSend((id)objc_msgSend(MEMORY[0x263F086E0], "bundleForClass:", objc_opt_class()), "localizedStringForKey:value:table:", @"ACCOUNT_FORMAT", &stru_26DB8C5F8, 0), v4);
    v11 = v12;
  }
  else
  {
    [(SUSubtitledButton *)self->_button setSubtitle:0 forState:0];
    uint64_t v9 = self->_button;
    uint64_t v10 = objc_msgSend((id)objc_msgSend(MEMORY[0x263F086E0], "bundleForClass:", objc_opt_class()), "localizedStringForKey:value:table:", @"SIGN_IN", &stru_26DB8C5F8, 0);
    v11 = v9;
  }

  [(SUSubtitledButton *)v11 setTitle:v10 forState:0];
}

- (SUClientInterface)clientInterface
{
  return self->_clientInterface;
}

- (void)setClientInterface:(id)a3
{
}

- (BOOL)hideAccountButton
{
  return self->_hideAccountButton;
}

- (double)rightMargin
{
  return self->_rightMargin;
}

- (int64_t)style
{
  return self->_style;
}

@end