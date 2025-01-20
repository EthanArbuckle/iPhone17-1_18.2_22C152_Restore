@interface SUUIAccountButtonsView
- (BOOL)isEcommerceHidden;
- (BOOL)isGiftingHidden;
- (BOOL)isRedeemHidden;
- (BOOL)isTermsAndConditionsHidden;
- (CGSize)sizeThatFits:(CGSize)a3;
- (NSString)ECommerceLinkTitle;
- (NSString)accountCredits;
- (SUUIAccountButtonsView)initWithClientContext:(id)a3;
- (UIButton)appleIDButton;
- (UIButton)giftingButton;
- (UIButton)redeemButton;
- (UIButton)termsAndConditionsButton;
- (UIControl)ECommerceButton;
- (id)_newLinkButtonWithTitle:(id)a3;
- (void)_layoutOneRow;
- (void)_layoutTwoRows;
- (void)_reloadFonts;
- (void)dealloc;
- (void)layoutSubviews;
- (void)setAccountCredits:(id)a3;
- (void)setECommerceLinkTitle:(id)a3;
- (void)setGiftingHidden:(BOOL)a3;
- (void)setTermsAndConditionsHidden:(BOOL)a3;
- (void)tintColorDidChange;
@end

@implementation SUUIAccountButtonsView

- (SUUIAccountButtonsView)initWithClientContext:(id)a3
{
  id v5 = a3;
  v25.receiver = self;
  v25.super_class = (Class)SUUIAccountButtonsView;
  v6 = [(SUUIAccountButtonsView *)&v25 init];
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_clientContext, a3);
    v8 = objc_alloc_init(SUUIRoundedRectButton);
    appleIDButton = v7->_appleIDButton;
    v7->_appleIDButton = v8;

    [(SUUIAccountButtonsView *)v7 addSubview:v7->_appleIDButton];
    v10 = objc_alloc_init(SUUIRoundedRectButton);
    redeemButton = v7->_redeemButton;
    v7->_redeemButton = &v10->super;

    v12 = v7->_redeemButton;
    if (v5) {
      [v5 localizedStringForKey:@"REDEEM_BUTTON" inTable:@"Redeem"];
    }
    else {
    v13 = +[SUUIClientContext localizedStringForKey:@"REDEEM_BUTTON" inBundles:0 inTable:@"Redeem"];
    }
    [(UIButton *)v12 setTitle:v13 forState:0];

    [(SUUIAccountButtonsView *)v7 addSubview:v7->_redeemButton];
    v14 = objc_alloc_init(SUUIRoundedRectButton);
    giftingButton = v7->_giftingButton;
    v7->_giftingButton = v14;

    v16 = v7->_giftingButton;
    if (v5) {
      [v5 localizedStringForKey:@"GIFT_BUTTON"];
    }
    else {
    v17 = +[SUUIClientContext localizedStringForKey:@"GIFT_BUTTON" inBundles:0];
    }
    [(SUUIRoundedRectButton *)v16 setTitle:v17 forState:0];

    v7->_giftingVisibilityHidden = 0;
    [(SUUIAccountButtonsView *)v7 addSubview:v7->_giftingButton];
    uint64_t v18 = [(SUUIAccountButtonsView *)v7 _newLinkButtonWithTitle:0];
    ecommerceButton = v7->_ecommerceButton;
    v7->_ecommerceButton = (SUUILinkButton *)v18;

    v7->_ecommerceVisibilityHidden = 1;
    [(SUUIAccountButtonsView *)v7 addSubview:v7->_ecommerceButton];
    if (v5) {
      [v5 localizedStringForKey:@"TERMS_LINK"];
    }
    else {
    v20 = +[SUUIClientContext localizedStringForKey:@"TERMS_LINK" inBundles:0];
    }
    uint64_t v21 = [(SUUIAccountButtonsView *)v7 _newLinkButtonWithTitle:v20];
    termsAndConditionsButton = v7->_termsAndConditionsButton;
    v7->_termsAndConditionsButton = (UIButton *)v21;

    [(SUUIAccountButtonsView *)v7 addSubview:v7->_termsAndConditionsButton];
    [(SUUIAccountButtonsView *)v7 _reloadFonts];
    v23 = [MEMORY[0x263F08A00] defaultCenter];
    [v23 addObserver:v7 selector:sel__reloadFonts name:*MEMORY[0x263F83428] object:0];
  }
  return v7;
}

- (void)dealloc
{
  v3 = [MEMORY[0x263F08A00] defaultCenter];
  [v3 removeObserver:self name:*MEMORY[0x263F83428] object:0];

  v4.receiver = self;
  v4.super_class = (Class)SUUIAccountButtonsView;
  [(SUUIAccountButtonsView *)&v4 dealloc];
}

- (NSString)accountCredits
{
  return [(UILabel *)self->_accountCreditsLabel text];
}

- (NSString)ECommerceLinkTitle
{
  return (NSString *)[(SUUILinkButton *)self->_ecommerceButton titleForState:0];
}

- (void)setECommerceLinkTitle:(id)a3
{
  id v5 = a3;
  id v4 = [(SUUILinkButton *)self->_ecommerceButton titleForState:0];
  if (v4 != v5 && ([v5 isEqualToString:v4] & 1) == 0)
  {
    self->_ecommerceVisibilityHidden = v5 == 0;
    -[SUUILinkButton setTitle:forState:](self->_ecommerceButton, "setTitle:forState:");
    [(SUUIAccountButtonsView *)self setNeedsLayout];
  }
}

- (BOOL)isEcommerceHidden
{
  return self->_ecommerceVisibilityHidden
      || [(SUUIClientContext *)self->_clientContext isManagedAppleID];
}

- (BOOL)isGiftingHidden
{
  return self->_giftingVisibilityHidden
      || [(SUUIClientContext *)self->_clientContext isManagedAppleID];
}

- (BOOL)isTermsAndConditionsHidden
{
  return [(UIButton *)self->_termsAndConditionsButton isHidden];
}

- (BOOL)isRedeemHidden
{
  return [(SUUIClientContext *)self->_clientContext isManagedAppleID];
}

- (void)setAccountCredits:(id)a3
{
  id v16 = a3;
  id v4 = [(UILabel *)self->_accountCreditsLabel text];

  id v5 = v16;
  if (v4 != v16)
  {
    if ([v16 length])
    {
      if (!self->_accountCreditsLabel)
      {
        v6 = (UILabel *)objc_alloc_init(MEMORY[0x263F828E0]);
        accountCreditsLabel = self->_accountCreditsLabel;
        self->_accountCreditsLabel = v6;

        v8 = self->_accountCreditsLabel;
        v9 = [MEMORY[0x263F825C8] clearColor];
        [(UILabel *)v8 setBackgroundColor:v9];

        v10 = self->_accountCreditsLabel;
        v11 = [MEMORY[0x263F81708] systemFontOfSize:11.0];
        [(UILabel *)v10 setFont:v11];

        [(UILabel *)self->_accountCreditsLabel setLineBreakMode:3];
        [(UILabel *)self->_accountCreditsLabel setTextAlignment:1];
        [(SUUIRoundedRectButton *)self->_appleIDButton setSubtitleWithLabel:self->_accountCreditsLabel];
      }
      clientContext = self->_clientContext;
      if (clientContext) {
        [(SUUIClientContext *)clientContext localizedStringForKey:@"ACCOUNT_CREDITS"];
      }
      else {
      v13 = +[SUUIClientContext localizedStringForKey:@"ACCOUNT_CREDITS" inBundles:0];
      }
      v14 = self->_accountCreditsLabel;
      v15 = [NSString stringWithValidatedFormat:v13, @"%@", 0, v16 validFormatSpecifiers error];
      [(UILabel *)v14 setText:v15];

      [(UILabel *)self->_accountCreditsLabel sizeToFit];
      [(SUUIRoundedRectButton *)self->_appleIDButton setNeedsLayout];
    }
    else
    {
      [(SUUIRoundedRectButton *)self->_appleIDButton setSubtitleWithLabel:0];
      v13 = self->_accountCreditsLabel;
      self->_accountCreditsLabel = 0;
    }

    id v5 = v16;
  }
}

- (void)setGiftingHidden:(BOOL)a3
{
  if (self->_giftingVisibilityHidden != a3)
  {
    self->_giftingVisibilityHidden = a3;
    [(SUUIAccountButtonsView *)self setNeedsLayout];
  }
}

- (void)setTermsAndConditionsHidden:(BOOL)a3
{
}

- (void)layoutSubviews
{
  [(SUUIAccountButtonsView *)self bounds];
  if (v3 >= 696.0)
  {
    [(SUUIAccountButtonsView *)self _layoutOneRow];
  }
  else
  {
    [(SUUIAccountButtonsView *)self _layoutTwoRows];
  }
}

- (CGSize)sizeThatFits:(CGSize)a3
{
  double height = a3.height;
  double width = a3.width;
  BOOL v6 = [(SUUIAccountButtonsView *)self isEcommerceHidden];
  uint64_t v7 = !v6;
  int v8 = [(UIButton *)self->_termsAndConditionsButton isHidden];
  int v9 = v8;
  uint64_t v10 = 1;
  if (!v6) {
    uint64_t v10 = 2;
  }
  if (!v8) {
    uint64_t v7 = v10;
  }
  if (width >= 0.00000011920929)
  {
    if (width < 696.0) {
      goto LABEL_7;
    }
  }
  else if (SUUIUserInterfaceIdiom(self->_clientContext) != 1)
  {
LABEL_7:
    -[SUUIRoundedRectButton sizeThatFits:](self->_appleIDButton, "sizeThatFits:", width, height);
    double v12 = v11 + 0.0;
    if (![(SUUIAccountButtonsView *)self isRedeemHidden])
    {
      -[UIButton sizeThatFits:](self->_redeemButton, "sizeThatFits:", width, v12);
      double v12 = v12 + v13 + 10.0;
    }
    if (v9 & v6) {
      double v14 = 44.0;
    }
    else {
      double v14 = (float)((float)v7 * 44.0);
    }
    double v17 = v12 + v14;
    goto LABEL_17;
  }
  -[SUUIRoundedRectButton sizeThatFits:](self->_appleIDButton, "sizeThatFits:", width, height);
  double v16 = v15 + 0.0;
  double v17 = v15 + 0.0 + 64.0;
  if ((v9 & v6) != 0) {
    double v17 = v16;
  }
LABEL_17:
  double v18 = width;
  result.double height = v17;
  result.double width = v18;
  return result;
}

- (void)tintColorDidChange
{
  double v3 = [(SUUIAccountButtonsView *)self tintColor];
  [(SUUILinkButton *)self->_ecommerceButton setTitleColor:v3 forState:0];
  [(UIButton *)self->_termsAndConditionsButton setTitleColor:v3 forState:0];
  v4.receiver = self;
  v4.super_class = (Class)SUUIAccountButtonsView;
  [(SUUIAccountButtonsView *)&v4 tintColorDidChange];
}

- (void)_layoutOneRow
{
  [(SUUIAccountButtonsView *)self bounds];
  double v4 = v3;
  double v6 = v5;
  double v7 = 30.0;
  if (v3 / 3.0 < 300.0) {
    double v7 = 15.0;
  }
  double v8 = v3 - v7 * 2.0 + -30.0;
  float v9 = v8 / 3.0;
  double v10 = floorf(v9);
  [(SUUIRoundedRectButton *)self->_appleIDButton frame];
  -[SUUIRoundedRectButton sizeThatFits:](self->_appleIDButton, "sizeThatFits:", v4, v6);
  double v12 = v11;
  [(UIButton *)self->_redeemButton frame];
  -[UIButton sizeThatFits:](self->_redeemButton, "sizeThatFits:", v4, v6);
  double v14 = v13;
  if ([(SUUIAccountButtonsView *)self isGiftingHidden]
    && ![(SUUIAccountButtonsView *)self isRedeemHidden])
  {
    float v22 = (v4 - (v10 * 2.0 + 15.0)) * 0.5;
    double v20 = floorf(v22);
    v37.origin.y = 0.0;
    v37.origin.x = v20;
    v37.size.double width = v10;
    v37.size.double height = v12;
    double v18 = CGRectGetMaxX(v37) + 15.0;
    double v16 = v10;
  }
  else
  {
    float v15 = v8 - v10 * 2.0;
    double v16 = ceilf(v15);
    float v17 = (v4 - v16) * 0.5;
    double v18 = floorf(v17);
    if ([(SUUIAccountButtonsView *)self isGiftingHidden])
    {
      v36.origin.x = 15.0;
      v36.origin.y = 0.0;
      v36.size.double width = v10;
      v36.size.double height = v12;
      float v19 = (v4 - CGRectGetWidth(v36)) * 0.5;
      double v20 = floorf(v19);
    }
    else
    {
      [(SUUIRoundedRectButton *)self->_giftingButton frame];
      -[SUUIRoundedRectButton sizeThatFits:](self->_giftingButton, "sizeThatFits:", v4, v6);
      -[SUUIRoundedRectButton setFrame:](self->_giftingButton, "setFrame:", v4 + -15.0 - v10, 0.0, v10, v21);
      double v20 = 15.0;
    }
  }
  [(SUUIRoundedRectButton *)self->_giftingButton setHidden:[(SUUIAccountButtonsView *)self isGiftingHidden]];
  [(UIButton *)self->_redeemButton setHidden:[(SUUIAccountButtonsView *)self isRedeemHidden]];
  -[SUUIRoundedRectButton setFrame:](self->_appleIDButton, "setFrame:", v20, 0.0, v10, v12);
  -[UIButton setFrame:](self->_redeemButton, "setFrame:", v18, 0.0, v16, v14);
  v38.origin.y = 0.0;
  v38.origin.x = v20;
  v38.size.double width = v10;
  v38.size.double height = v12;
  double v23 = CGRectGetMaxY(v38) + 20.0;
  [(UIButton *)self->_termsAndConditionsButton frame];
  double v24 = *(double *)(MEMORY[0x263F00190] + 16);
  double v25 = *(double *)(MEMORY[0x263F00190] + 24);
  -[UIButton sizeThatFits:](self->_termsAndConditionsButton, "sizeThatFits:", v24, v25);
  double v27 = v26;
  *(float *)&double v26 = (v4 - v26) * 0.5;
  double v28 = floorf(*(float *)&v26);
  if (![(SUUIAccountButtonsView *)self isEcommerceHidden])
  {
    [(SUUILinkButton *)self->_ecommerceButton frame];
    -[SUUILinkButton sizeThatFits:](self->_ecommerceButton, "sizeThatFits:", v24, v25);
    double v30 = v29;
    if ([(UIButton *)self->_termsAndConditionsButton isHidden])
    {
      float v31 = (v4 - v30) * 0.5;
      double v32 = floorf(v31);
    }
    else
    {
      float v33 = (v4 - (v27 + 40.0 + v30)) * 0.5;
      double v28 = floorf(v33);
      v39.size.double height = 44.0;
      v39.origin.x = v28;
      v39.origin.y = v23;
      v39.size.double width = v27;
      double v32 = CGRectGetMaxX(v39) + 40.0;
    }
    -[SUUILinkButton setFrame:](self->_ecommerceButton, "setFrame:", v32, v23, v30, 44.0);
  }
  [(SUUILinkButton *)self->_ecommerceButton setHidden:[(SUUIAccountButtonsView *)self isEcommerceHidden]];
  termsAndConditionsButton = self->_termsAndConditionsButton;
  -[UIButton setFrame:](termsAndConditionsButton, "setFrame:", v28, v23, v27, 44.0);
}

- (void)_layoutTwoRows
{
  [(SUUIAccountButtonsView *)self bounds];
  double v4 = v3;
  double v6 = v5;
  double v7 = v3 + -30.0;
  BOOL v8 = [(SUUIAccountButtonsView *)self isGiftingHidden];
  double v9 = floor((v7 + -10.0) * 0.5);
  if (v8) {
    double v10 = v7;
  }
  else {
    double v10 = v9;
  }
  [(UIButton *)self->_redeemButton frame];
  -[UIButton sizeThatFits:](self->_redeemButton, "sizeThatFits:", v4, v6);
  double v11 = 0.0;
  -[UIButton setFrame:](self->_redeemButton, "setFrame:", 15.0, 0.0, v10, v12);
  [(UIButton *)self->_redeemButton setHidden:[(SUUIAccountButtonsView *)self isRedeemHidden]];
  [(SUUIRoundedRectButton *)self->_giftingButton frame];
  -[SUUIRoundedRectButton sizeThatFits:](self->_giftingButton, "sizeThatFits:", v4, v6);
  CGFloat v14 = v13;
  -[SUUIRoundedRectButton setFrame:](self->_giftingButton, "setFrame:", v4 + -15.0 - v10, 0.0, v10, v13);
  [(SUUIRoundedRectButton *)self->_giftingButton setHidden:[(SUUIAccountButtonsView *)self isGiftingHidden]];
  if (![(SUUIAccountButtonsView *)self isRedeemHidden]
    || ![(SUUIAccountButtonsView *)self isGiftingHidden])
  {
    v28.origin.y = 0.0;
    v28.origin.x = v4 + -15.0 - v10;
    v28.size.double width = v10;
    v28.size.double height = v14;
    double v11 = CGRectGetMaxY(v28) + 10.0;
  }
  [(SUUIRoundedRectButton *)self->_appleIDButton frame];
  -[SUUIRoundedRectButton sizeThatFits:](self->_appleIDButton, "sizeThatFits:", v4, v6);
  CGFloat v16 = v15;
  -[SUUIRoundedRectButton setFrame:](self->_appleIDButton, "setFrame:", 15.0, v11, v7, v15);
  v29.origin.x = 15.0;
  v29.origin.y = v11;
  v29.size.double width = v7;
  v29.size.double height = v16;
  double MaxY = CGRectGetMaxY(v29);
  char v18 = [(UIButton *)self->_termsAndConditionsButton isHidden];
  uint64_t v19 = MEMORY[0x263F00190];
  if ((v18 & 1) == 0)
  {
    [(UIButton *)self->_termsAndConditionsButton frame];
    -[UIButton sizeThatFits:](self->_termsAndConditionsButton, "sizeThatFits:", *(double *)(v19 + 16), *(double *)(v19 + 24));
    double v21 = v20;
    *(float *)&double v20 = (v4 - v20) * 0.5;
    CGFloat v22 = floorf(*(float *)&v20);
    -[UIButton setFrame:](self->_termsAndConditionsButton, "setFrame:", v22, MaxY, v21, 44.0);
    v30.origin.x = v22;
    v30.origin.y = MaxY;
    v30.size.double width = v21;
    v30.size.double height = 44.0;
    double MaxY = CGRectGetMaxY(v30);
  }
  if (![(SUUIAccountButtonsView *)self isEcommerceHidden])
  {
    [(SUUILinkButton *)self->_ecommerceButton frame];
    -[SUUILinkButton sizeThatFits:](self->_ecommerceButton, "sizeThatFits:", *(double *)(v19 + 16), *(double *)(v19 + 24));
    double v24 = v23;
    *(float *)&double v23 = (v4 - v23) * 0.5;
    -[SUUILinkButton setFrame:](self->_ecommerceButton, "setFrame:", floorf(*(float *)&v23), MaxY, v24, 44.0);
  }
  ecommerceButton = self->_ecommerceButton;
  BOOL v26 = [(SUUIAccountButtonsView *)self isEcommerceHidden];
  [(SUUILinkButton *)ecommerceButton setHidden:v26];
}

- (id)_newLinkButtonWithTitle:(id)a3
{
  id v4 = a3;
  double v5 = [[SUUILinkButton alloc] initWithArrowStyle:0];
  [(SUUILinkButton *)v5 setTitle:v4 forState:0];

  double v6 = [(SUUIAccountButtonsView *)self tintColor];
  [(SUUILinkButton *)v5 setTitleColor:v6 forState:0];

  return v5;
}

- (void)_reloadFonts
{
  id v5 = [MEMORY[0x263F81708] preferredFontForTextStyle:*MEMORY[0x263F83588]];
  double v3 = [(SUUILinkButton *)self->_ecommerceButton titleLabel];
  [v3 setFont:v5];

  id v4 = [(UIButton *)self->_termsAndConditionsButton titleLabel];
  [v4 setFont:v5];
}

- (UIButton)appleIDButton
{
  return &self->_appleIDButton->super;
}

- (UIControl)ECommerceButton
{
  return &self->_ecommerceButton->super.super;
}

- (UIButton)giftingButton
{
  return &self->_giftingButton->super;
}

- (UIButton)redeemButton
{
  return self->_redeemButton;
}

- (UIButton)termsAndConditionsButton
{
  return self->_termsAndConditionsButton;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_redeemButton, 0);
  objc_storeStrong((id *)&self->_usernameButton, 0);
  objc_storeStrong((id *)&self->_termsAndConditionsButton, 0);
  objc_storeStrong((id *)&self->_giftingButton, 0);
  objc_storeStrong((id *)&self->_ecommerceButton, 0);
  objc_storeStrong((id *)&self->_clientContext, 0);
  objc_storeStrong((id *)&self->_appleIDButton, 0);
  objc_storeStrong((id *)&self->_accountCreditsLabel, 0);
}

@end