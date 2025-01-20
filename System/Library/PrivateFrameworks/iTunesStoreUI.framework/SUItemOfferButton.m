@interface SUItemOfferButton
+ (double)defaultAnimationDuration;
+ (id)itemOfferButtonStyleForItem:(id)a3 offer:(id)a4;
- ($4B5500DDDD144FD891C396F8C9BA0187)_configurationForStyle:(SEL)a3;
- (BOOL)configureForItem:(id)a3 offer:(id)a4;
- (BOOL)isShowingConfirmation;
- (BOOL)shouldShowConfirmation;
- (CGSize)sizeThatFits:(CGSize)a3;
- (NSString)confirmationTitle;
- (NSString)itemOfferButtonStyle;
- (NSString)offerTitle;
- (SUItemOfferButton)initWithFrame:(CGRect)a3;
- (int64_t)animationHorizontalAlignment;
- (void)_applyConfiguration:(id *)a3;
- (void)_reloadButton;
- (void)dealloc;
- (void)layoutSubviews;
- (void)setAnimationHorizontalAlignment:(int64_t)a3;
- (void)setConfirmationTitle:(id)a3;
- (void)setItemOfferButtonStyle:(id)a3;
- (void)setOfferTitle:(id)a3;
- (void)setShouldShowConfirmation:(BOOL)a3;
- (void)setShowingConfirmation:(BOOL)a3;
- (void)setShowingConfirmation:(BOOL)a3 duration:(double)a4;
@end

@implementation SUItemOfferButton

- (SUItemOfferButton)initWithFrame:(CGRect)a3
{
  v6.receiver = self;
  v6.super_class = (Class)SUItemOfferButton;
  v3 = -[SUItemOfferButton initWithFrame:](&v6, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  v4 = v3;
  if (v3)
  {
    v3->_animationHorizontalAlignment = 1;
    v3->_shouldShowConfirmation = 1;
    [(SUItemOfferButton *)v3 setItemOfferButtonStyle:@"SUItemOfferButtonStyleGrayBlue"];
  }
  return v4;
}

- (void)dealloc
{
  [(SUItemOfferButton *)self removeTarget:self action:0 forControlEvents:0xFFFFFFFFLL];

  v3.receiver = self;
  v3.super_class = (Class)SUItemOfferButton;
  [(SUItemOfferButton *)&v3 dealloc];
}

+ (double)defaultAnimationDuration
{
  return 0.2;
}

+ (id)itemOfferButtonStyleForItem:(id)a3 offer:(id)a4
{
  if (![a3 isDownloadable]) {
    return @"SUItemOfferButtonStyleNotPurchasable";
  }
  uint64_t v6 = [a3 itemType];
  int v7 = [a4 shouldShowPlusIcon];
  v8 = @"SUItemOfferButtonStyleGrayBlue";
  if (v7) {
    v8 = @"SUItemOfferButtonStyleGrayBluePlus";
  }
  v9 = @"SUItemOfferButtonStyleBluePlus";
  if (!v7) {
    v9 = @"SUItemOfferButtonStyleBlue";
  }
  if (v6 == 2000) {
    return v9;
  }
  else {
    return v8;
  }
}

- (BOOL)configureForItem:(id)a3 offer:(id)a4
{
  uint64_t v7 = [a4 actionDisplayName];
  if ([(NSString *)self->_confirmationTitle isEqualToString:v7])
  {
    LOBYTE(v7) = 0;
  }
  else
  {
    [(SUItemOfferButton *)self setConfirmationTitle:v7];
    LOBYTE(v7) = [(SUItemOfferButton *)self isShowingConfirmation];
  }
  uint64_t v8 = [a4 priceDisplay];
  if (![(NSString *)self->_offerTitle isEqualToString:v8])
  {
    [(SUItemOfferButton *)self setOfferTitle:v8];
    if (v7) {
      LOBYTE(v7) = 1;
    }
    else {
      LODWORD(v7) = ![(SUItemOfferButton *)self isShowingConfirmation];
    }
  }
  uint64_t v9 = [(id)objc_opt_class() itemOfferButtonStyleForItem:a3 offer:a4];
  if (![(NSString *)self->_buttonStyle isEqualToString:v9])
  {
    [(SUItemOfferButton *)self setItemOfferButtonStyle:v9];
    if (v7) {
      LOBYTE(v7) = 1;
    }
    else {
      LODWORD(v7) = ![(SUItemOfferButton *)self isShowingConfirmation];
    }
  }
  -[SUItemOfferButton setShouldShowConfirmation:](self, "setShouldShowConfirmation:", [a4 isOneTapOffer] ^ 1);
  return v7;
}

- (void)setConfirmationTitle:(id)a3
{
  if (!-[NSString isEqualToString:](self->_confirmationTitle, "isEqualToString:"))
  {

    self->_confirmationTitle = (NSString *)[a3 copy];
    if ([(SUItemOfferButton *)self isShowingConfirmation])
    {
      [(SUItemOfferButton *)self _reloadButton];
    }
  }
}

- (void)setItemOfferButtonStyle:(id)a3
{
  if (!-[NSString isEqualToString:](self->_buttonStyle, "isEqualToString:"))
  {
    [(SUItemOfferButton *)self _configurationForStyle:a3];
    [MEMORY[0x263EFF940] raise:*MEMORY[0x263EFF4A0] format:@"Invalid button style"];

    self->_buttonStyle = (NSString *)[a3 copy];
    [(SUItemOfferButton *)self _reloadButton];
  }
}

- (void)setOfferTitle:(id)a3
{
  if (!-[NSString isEqualToString:](self->_offerTitle, "isEqualToString:"))
  {

    self->_offerTitle = (NSString *)[a3 copy];
    if (![(SUItemOfferButton *)self isShowingConfirmation])
    {
      [(SUItemOfferButton *)self _reloadButton];
    }
  }
}

- (void)setShowingConfirmation:(BOOL)a3
{
}

- (void)setShowingConfirmation:(BOOL)a3 duration:(double)a4
{
  if (self->_isShowingConfirmation != a3)
  {
    [(SUItemOfferButton *)self frame];
    double v8 = v7;
    double rect = v9;
    double v11 = v10;
    double v13 = v12;
    self->_isShowingConfirmation = a3;
    [(SUItemOfferButton *)self sizeToFit];
    [(SUItemOfferButton *)self frame];
    uint64_t v15 = v14;
    double v17 = v16;
    uint64_t v19 = v18;
    int64_t v20 = [(SUItemOfferButton *)self animationHorizontalAlignment];
    if (v20)
    {
      double v21 = v8;
      if (v20 == 2)
      {
        v26.origin.x = v8;
        v26.origin.y = rect;
        v26.size.width = v11;
        v26.size.height = v13;
        double v21 = CGRectGetMaxX(v26) - v17;
      }
    }
    else
    {
      float v22 = (v17 - v11) * 0.5;
      double v21 = v8 - floorf(v22);
    }
    if (a4 > 2.22044605e-16)
    {
      [(SUItemOfferButton *)self setTitle:0 forState:0];
      -[SUItemOfferButton setFrame:](self, "setFrame:", v8, rect, v11, v13);
    }
    v25[0] = MEMORY[0x263EF8330];
    v25[1] = 3221225472;
    v25[2] = __53__SUItemOfferButton_setShowingConfirmation_duration___block_invoke;
    v25[3] = &unk_2648148C0;
    v25[4] = self;
    *(double *)&v25[5] = v21;
    v25[6] = v15;
    *(double *)&v25[7] = v17;
    v25[8] = v19;
    v24[0] = MEMORY[0x263EF8330];
    v24[1] = 3221225472;
    v24[2] = __53__SUItemOfferButton_setShowingConfirmation_duration___block_invoke_2;
    v24[3] = &unk_264812908;
    v24[4] = self;
    [MEMORY[0x263F1CB60] animateWithDuration:v25 animations:v24 completion:a4];
  }
}

uint64_t __53__SUItemOfferButton_setShowingConfirmation_duration___block_invoke(uint64_t a1)
{
  objc_msgSend(*(id *)(a1 + 32), "setFrame:", *(double *)(a1 + 40), *(double *)(a1 + 48), *(double *)(a1 + 56), *(double *)(a1 + 64));
  v2 = *(void **)(a1 + 32);

  return [v2 layoutIfNeeded];
}

uint64_t __53__SUItemOfferButton_setShowingConfirmation_duration___block_invoke_2(uint64_t a1)
{
  return [*(id *)(a1 + 32) _reloadButton];
}

- (void)layoutSubviews
{
  v15.receiver = self;
  v15.super_class = (Class)SUItemOfferButton;
  [(SUItemOfferButton *)&v15 layoutSubviews];
  objc_super v3 = (void *)[(SUItemOfferButton *)self titleLabel];
  if (v3)
  {
    v4 = v3;
    if ([v3 numberOfLines] != 1)
    {
      [(SUItemOfferButton *)self bounds];
      -[SUItemOfferButton contentRectForBounds:](self, "contentRectForBounds:");
      double v6 = v5;
      double v8 = v7;
      objc_msgSend(v4, "textRectForBounds:limitedToNumberOfLines:", objc_msgSend(v4, "numberOfLines"), v9, v5, v10, v7);
      double v12 = v11;
      *(float *)&double v11 = (v8 - v13) * 0.5;
      objc_msgSend(v4, "setFrame:", v12, v6 + floorf(*(float *)&v11), v14, v13 + ceilf((float)objc_msgSend(v4, "lineSpacing") * 0.5));
    }
  }
}

- (CGSize)sizeThatFits:(CGSize)a3
{
  double height = a3.height;
  double width = a3.width;
  [(SUItemOfferButton *)self _reloadButton];
  v18.receiver = self;
  v18.super_class = (Class)SUItemOfferButton;
  -[SUItemOfferButton sizeThatFits:](&v18, sel_sizeThatFits_, width, height);
  double v7 = v6;
  double v9 = v8;
  double v10 = (void *)[(SUItemOfferButton *)self titleLabel];
  if (v10)
  {
    double v11 = v10;
    if ([v10 numberOfLines] != 1)
    {
      objc_msgSend(v11, "textRectForBounds:limitedToNumberOfLines:", objc_msgSend(v11, "numberOfLines"), 0.0, 0.0, v7, v9);
      double v13 = v12;
      [(SUItemOfferButton *)self contentEdgeInsets];
      if (v7 >= v15 + v13 + v14) {
        double v7 = v15 + v13 + v14;
      }
    }
  }
  double v16 = v7;
  double v17 = v9;
  result.double height = v17;
  result.double width = v16;
  return result;
}

- (void)_applyConfiguration:(id *)a3
{
  -[SUItemOfferButton setContentEdgeInsets:](self, "setContentEdgeInsets:", a3->var3.top, a3->var3.left, a3->var3.bottom, a3->var3.right);
  uint64_t v5 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
  id var4 = a3->var4;
  if (var4) {
    id var4 = (id)objc_msgSend((id)objc_msgSend(MEMORY[0x263F1C6B0], "imageNamed:inBundle:", var4, v5), "stretchableImageWithLeftCapWidth:rightCapWidth:", a3->var1, a3->var2);
  }
  [(SUItemOfferButton *)self setBackgroundImage:var4 forState:0];
  id var5 = a3->var5;
  if (var5) {
    id var5 = (id)objc_msgSend((id)objc_msgSend(MEMORY[0x263F1C6B0], "imageNamed:inBundle:", var5, v5), "stretchableImageWithLeftCapWidth:rightCapWidth:", a3->var1, a3->var2);
  }
  [(SUItemOfferButton *)self setBackgroundImage:var5 forState:1];
  double v8 = (void *)[(SUItemOfferButton *)self titleLabel];
  [v8 setTextAlignment:1];
  int v9 = [a3->var0 isEqualToString:@"SUItemOfferButtonStyleNotPurchasable"];
  if (v9)
  {
    objc_msgSend(v8, "setFont:", objc_msgSend(MEMORY[0x263F1C658], "boldSystemFontOfSize:", 10.0));
    objc_msgSend(v8, "setShadowOffset:", *MEMORY[0x263F001B0], *(double *)(MEMORY[0x263F001B0] + 8));
    [(SUItemOfferButton *)self setAlpha:1.0];
    -[SUItemOfferButton setTitleColor:forState:](self, "setTitleColor:forState:", [MEMORY[0x263F1C550] whiteColor], 0);
    uint64_t v10 = 0;
    uint64_t v11 = 0;
    uint64_t v12 = 0;
    uint64_t v13 = 2;
    uint64_t v14 = 9;
  }
  else
  {
    int v15 = [a3->var0 isEqualToString:@"SUItemOfferButtonStylePurchasedAlready"];
    objc_msgSend(v8, "setFont:", objc_msgSend(MEMORY[0x263F1C658], "boldSystemFontOfSize:", 13.0));
    if (v15)
    {
      objc_msgSend(v8, "setShadowOffset:", 0.0, 1.0);
      [(SUItemOfferButton *)self setAlpha:0.5];
      -[SUItemOfferButton setTitleColor:forState:](self, "setTitleColor:forState:", [MEMORY[0x263F1C550] colorWithRed:0.462745098 green:0.470588235 blue:0.470588235 alpha:1.0], 0);
      uint64_t v10 = [MEMORY[0x263F1C550] colorWithRed:0.721568627 green:0.733333333 blue:0.741176471 alpha:1.0];
      uint64_t v11 = 0;
      uint64_t v14 = 0;
      uint64_t v13 = 1;
      uint64_t v12 = 4;
    }
    else
    {
      objc_msgSend(v8, "setShadowOffset:", 0.0, -1.0);
      [(SUItemOfferButton *)self setAlpha:1.0];
      -[SUItemOfferButton setTitleColor:forState:](self, "setTitleColor:forState:", [MEMORY[0x263F1C550] whiteColor], 0);
      uint64_t v10 = [MEMORY[0x263F1C550] colorWithWhite:0.300000012 alpha:1.0];
      uint64_t v14 = 0;
      uint64_t v11 = 1;
      uint64_t v12 = 4;
      uint64_t v13 = 1;
    }
  }
  [(SUItemOfferButton *)self setTitleShadowColor:v10 forState:0];
  [(SUItemOfferButton *)self setUserInteractionEnabled:v11];
  [v8 setLineBreakMode:v12];
  [v8 setLineSpacing:v14];
  [v8 setNumberOfLines:v13];
  if ([(SUItemOfferButton *)self isShowingConfirmation])
  {
    double v16 = [(SUItemOfferButton *)self confirmationTitle];
    [(SUItemOfferButton *)self setTitle:v16 forState:0];
  }
  else
  {
    double v17 = [(SUItemOfferButton *)self offerTitle];
    uint64_t v18 = (uint64_t)v17;
    if (v9)
    {
      uint64_t v19 = [(NSString *)v17 componentsSeparatedByString:@" "];
      if ([(NSArray *)v19 count] == 2) {
        uint64_t v18 = [(NSArray *)v19 componentsJoinedByString:@"\n"];
      }
    }
    [(SUItemOfferButton *)self setTitle:v18 forState:0];
    [v8 setText:v18];
  }
}

- ($4B5500DDDD144FD891C396F8C9BA0187)_configurationForStyle:(SEL)a3
{
  uint64_t v6 = 0;
  retstr->id var5 = 0;
  *(_OWORD *)&retstr->var3.left = 0u;
  *(_OWORD *)&retstr->var3.right = 0u;
  *(_OWORD *)&retstr->var0 = 0u;
  *(_OWORD *)&retstr->var2 = 0u;
  while (1)
  {
    CGSize result = ($4B5500DDDD144FD891C396F8C9BA0187 *)[(id)__ButtonConfigurations[v6] isEqualToString:a4];
    if (result) {
      break;
    }
    v6 += 9;
    if (v6 == 63) {
      return result;
    }
  }
  long long v8 = *(_OWORD *)&__ButtonConfigurations[v6 + 6];
  *(_OWORD *)&retstr->var3.left = *(_OWORD *)&__ButtonConfigurations[v6 + 4];
  *(_OWORD *)&retstr->var3.right = v8;
  retstr->id var5 = (id)__ButtonConfigurations[v6 + 8];
  long long v9 = *(_OWORD *)&__ButtonConfigurations[v6 + 2];
  *(_OWORD *)&retstr->var0 = *(_OWORD *)&__ButtonConfigurations[v6];
  *(_OWORD *)&retstr->var2 = v9;
  return result;
}

- (void)_reloadButton
{
  if ([(SUItemOfferButton *)self isShowingConfirmation])
  {
    long long v12 = xmmword_264814B00;
    long long v13 = unk_264814B10;
    uint64_t v14 = @"PurchaseConfirmButtonPressed.png";
    long long v10 = __ConfirmationConfiguration;
    long long v11 = unk_264814AF0;
    objc_super v3 = &v10;
LABEL_6:
    -[SUItemOfferButton _applyConfiguration:](self, "_applyConfiguration:", v3, v5, v6, v7, v8, v9);
    return;
  }
  uint64_t v14 = 0;
  long long v12 = 0u;
  long long v13 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  v4 = [(SUItemOfferButton *)self itemOfferButtonStyle];
  if (self)
  {
    [(SUItemOfferButton *)self _configurationForStyle:v4];
    if ((void)v10)
    {
      long long v7 = v12;
      long long v8 = v13;
      long long v9 = v14;
      long long v5 = v10;
      long long v6 = v11;
      objc_super v3 = &v5;
      goto LABEL_6;
    }
  }
}

- (int64_t)animationHorizontalAlignment
{
  return self->_animationHorizontalAlignment;
}

- (void)setAnimationHorizontalAlignment:(int64_t)a3
{
  self->_animationHorizontalAlignment = a3;
}

- (NSString)confirmationTitle
{
  return self->_confirmationTitle;
}

- (NSString)itemOfferButtonStyle
{
  return self->_buttonStyle;
}

- (NSString)offerTitle
{
  return self->_offerTitle;
}

- (BOOL)shouldShowConfirmation
{
  return self->_shouldShowConfirmation;
}

- (void)setShouldShowConfirmation:(BOOL)a3
{
  self->_shouldShowConfirmation = a3;
}

- (BOOL)isShowingConfirmation
{
  return self->_isShowingConfirmation;
}

@end