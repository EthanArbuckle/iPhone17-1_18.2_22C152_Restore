@interface SiriUISashView
+ ($131113AABFBD927EF350151908AA1243)_textContainerStyleForSashItem:(SEL)a3;
+ (id)_font;
- (BOOL)isNavigating;
- (CGSize)sizeThatFits:(CGSize)a3;
- (SiriUISashItem)sashItem;
- (SiriUISashView)initWithFrame:(CGRect)a3;
- (UIButton)backNavigationButton;
- (void)_setupBackNavigationButton;
- (void)layoutSubviews;
- (void)setNavigating:(BOOL)a3;
- (void)setSashItem:(id)a3 locale:(id)a4;
@end

@implementation SiriUISashView

- (SiriUISashView)initWithFrame:(CGRect)a3
{
  v32.receiver = self;
  v32.super_class = (Class)SiriUISashView;
  v3 = -[SiriUISashView initWithFrame:](&v32, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  if (v3)
  {
    id v4 = objc_alloc(MEMORY[0x263F1CB60]);
    double v5 = *MEMORY[0x263F001A8];
    double v6 = *(double *)(MEMORY[0x263F001A8] + 8);
    double v7 = *(double *)(MEMORY[0x263F001A8] + 16);
    double v8 = *(double *)(MEMORY[0x263F001A8] + 24);
    uint64_t v9 = objc_msgSend(v4, "initWithFrame:", *MEMORY[0x263F001A8], v6, v7, v8);
    contentView = v3->_contentView;
    v3->_contentView = (UIView *)v9;

    v11 = [(SiriUISashView *)v3 layer];
    [v11 setAllowsGroupBlending:0];

    uint64_t v12 = objc_msgSend(objc_alloc(MEMORY[0x263F1C6D0]), "initWithFrame:", v5, v6, v7, v8);
    imageView = v3->_imageView;
    v3->_imageView = (UIImageView *)v12;

    v14 = [[SiriUITextContainerView alloc] initWithText:0];
    textContainerView = v3->_textContainerView;
    v3->_textContainerView = v14;

    v16 = v3->_textContainerView;
    v17 = [(id)objc_opt_class() _font];
    [(SiriUITextContainerView *)v16 setFont:v17];

    v18 = v3->_textContainerView;
    v19 = objc_msgSend(MEMORY[0x263F1C550], "siriui_semiTransparentTextColor");
    [(SiriUITextContainerView *)v18 setTextColor:v19];

    v20 = [MEMORY[0x263F1C480] effectWithStyle:8];
    v21 = [MEMORY[0x263F1CB58] effectForBlurEffect:v20 style:1];
    uint64_t v22 = [objc_alloc(MEMORY[0x263F1CB98]) initWithEffect:v21];
    vibrantTextBackgroundView = v3->_vibrantTextBackgroundView;
    v3->_vibrantTextBackgroundView = (UIVisualEffectView *)v22;

    v24 = [(UIVisualEffectView *)v3->_vibrantTextBackgroundView contentView];
    [v24 addSubview:v3->_textContainerView];

    [(UIView *)v3->_contentView addSubview:v3->_imageView];
    [(UIView *)v3->_contentView addSubview:v3->_vibrantTextBackgroundView];
    [(SiriUISashView *)v3 addSubview:v3->_contentView];
    if (SiriLanguageIsRTL())
    {
      v25 = v3->_contentView;
      CGAffineTransformMakeScale(&v31, -1.0, 1.0);
      [(UIView *)v25 setTransform:&v31];
      v26 = v3->_imageView;
      CGAffineTransformMakeScale(&v30, -1.0, 1.0);
      [(UIImageView *)v26 setTransform:&v30];
      v27 = v3->_textContainerView;
      CGAffineTransformMakeScale(&v29, -1.0, 1.0);
      [(SiriUITextContainerView *)v27 setTransform:&v29];
    }
  }
  return v3;
}

- (void)layoutSubviews
{
  v30.receiver = self;
  v30.super_class = (Class)SiriUISashView;
  [(SiriUISashView *)&v30 layoutSubviews];
  [(SiriUISashView *)self bounds];
  CGFloat v4 = v3;
  double v28 = v6;
  double v29 = v5;
  double v27 = v7;
  double v8 = 16.0;
  uint64_t v9 = [(SiriSharedUISashItem *)self->_sashItem image];
  double MaxX = 0.0;
  if (v9)
  {
    v31.origin.double x = 16.0;
    v31.origin.double y = 16.0;
    v31.size.double width = 20.0;
    v31.size.double height = 20.0;
    double MaxX = CGRectGetMaxX(v31);
  }

  v32.origin.double x = v4;
  v32.origin.double y = v29;
  v32.size.double width = v28;
  v32.size.double height = v27;
  double v25 = v4;
  double rect = CGRectGetWidth(v32) - MaxX;
  v33.origin.double x = v4;
  v33.origin.double y = v29;
  v33.size.double width = v28;
  v33.size.double height = v27;
  double width = 20.0;
  double height = 20.0;
  double v13 = CGRectGetHeight(v33) - 16.0;
  double v14 = 0.0;
  if (self->_requestsExtraPadding) {
    double v14 = 16.0;
  }
  double v15 = v13 - v14;
  double y = 16.0;
  if (v13 - v14 > 20.0)
  {
    v34.origin.double x = MaxX;
    v34.origin.double y = 16.0;
    v34.size.double width = rect;
    v34.size.double height = v15;
    double MidY = CGRectGetMidY(v34);
    v35.origin.double x = 16.0;
    v35.origin.double y = 16.0;
    v35.size.double width = 20.0;
    v35.size.double height = 20.0;
    double y = MidY + CGRectGetHeight(v35) * -0.5;
  }
  [(UIVisualEffectView *)self->_vibrantButtonBackgroundView setHidden:[(SiriUISashView *)self isNavigating] ^ 1];
  -[UIVisualEffectView setFrame:](self->_vibrantButtonBackgroundView, "setFrame:", v24, v24, v23, v22);
  backNavigationButton = self->_backNavigationButton;
  [(UIVisualEffectView *)self->_vibrantButtonBackgroundView bounds];
  -[UIButton setFrame:](backNavigationButton, "setFrame:");
  if ([(SiriUISashView *)self isNavigating])
  {
    v36.origin.double x = 16.0;
    v36.origin.double y = y;
    v36.size.double width = 20.0;
    v36.size.double height = 20.0;
    CGRect v37 = CGRectOffset(v36, 20.0 + 10.0, 0.0);
    double x = v37.origin.x;
    double y = v37.origin.y;
    double width = v37.size.width;
    double height = v37.size.height;
    v37.origin.double x = MaxX;
    v37.origin.double y = 16.0;
    v37.size.double width = rect;
    v37.size.double height = v15;
    CGRect v38 = CGRectOffset(v37, 20.0 + 10.0, 0.0);
    double MaxX = v38.origin.x;
    double v8 = v38.origin.y;
    double v20 = v38.size.width;
    double v15 = v38.size.height;
  }
  else
  {
    double x = 16.0;
    double v20 = rect;
  }
  -[UIView setFrame:](self->_contentView, "setFrame:", v25, v29, v28, v27);
  -[UIImageView setFrame:](self->_imageView, "setFrame:", x, y, width, height);
  -[UIVisualEffectView setFrame:](self->_vibrantTextBackgroundView, "setFrame:", MaxX, v8, v20, v15);
  textContainerView = self->_textContainerView;
  [(UIVisualEffectView *)self->_vibrantTextBackgroundView bounds];
  -[SiriUITextContainerView setFrame:](textContainerView, "setFrame:");
}

- (CGSize)sizeThatFits:(CGSize)a3
{
  double width = a3.width;
  sashItem = self->_sashItem;
  double v6 = 0.0;
  if (sashItem && ![(SiriSharedUISashItem *)sashItem isHidden])
  {
    double v7 = [(SiriSharedUISashItem *)self->_sashItem image];
    if (v7) {
      double v8 = 20.0 + 16.0;
    }
    else {
      double v8 = 0.0;
    }

    -[SiriUITextContainerView sizeThatFits:](self->_textContainerView, "sizeThatFits:", width - v8, 1.79769313e308);
    double v10 = 20.0 + 16.0;
    if (20.0 + 16.0 < v9) {
      double v10 = v9;
    }
    double v11 = -0.0;
    if (self->_requestsExtraPadding) {
      double v11 = 16.0;
    }
    double v6 = v10 + v11;
  }
  double v12 = width;
  double v13 = v6;
  result.double height = v13;
  result.double width = v12;
  return result;
}

- (void)setSashItem:(id)a3 locale:(id)a4
{
  id v6 = a3;
  p_sashItem = &self->_sashItem;
  if (![(SiriSharedUISashItem *)self->_sashItem isEqual:v6])
  {
    objc_storeStrong((id *)&self->_sashItem, a3);
    if (*p_sashItem) {
      uint64_t v8 = [(SiriSharedUISashItem *)*p_sashItem isHidden];
    }
    else {
      uint64_t v8 = 1;
    }
    imageView = self->_imageView;
    double v10 = [v6 image];
    [(UIImageView *)imageView setImage:v10];

    textContainerView = self->_textContainerView;
    double v12 = [v6 title];
    [(SiriUITextContainerView *)textContainerView setText:v12];

    double v13 = self->_textContainerView;
    double v14 = objc_opt_class();
    if (v14)
    {
      [v14 _textContainerStyleForSashItem:v6];
    }
    else
    {
      uint64_t v24 = 0;
      long long v22 = 0u;
      long long v23 = 0u;
      long long v21 = 0u;
    }
    [(SiriUITextContainerView *)v13 setTextContainerStyle:&v21];
    [(UIImageView *)self->_imageView setHidden:v8];
    [(SiriUITextContainerView *)self->_textContainerView setHidden:v8];
    double v15 = [v6 backgroundColor];

    if (v15)
    {
      contentView = self->_contentView;
      v17 = [v6 backgroundColor];
      [(UIView *)contentView setBackgroundColor:v17];
    }
    v18 = objc_msgSend(v6, "textColor", v21, v22, v23, v24);

    if (v18)
    {
      v19 = self->_textContainerView;
      double v20 = [v6 textColor];
      [(SiriUITextContainerView *)v19 setTextColor:v20];

      [(UIVisualEffectView *)self->_vibrantTextBackgroundView setEffect:0];
    }
    self->_requestsExtraPadding = [v6 requestsExtraPadding];
    [(SiriUISashView *)self setNeedsLayout];
  }
}

- (void)setNavigating:(BOOL)a3
{
  if (self->_navigating != a3)
  {
    self->_navigating = a3;
    if (a3) {
      [(SiriUISashView *)self _setupBackNavigationButton];
    }
    [(SiriUISashView *)self setNeedsLayout];
  }
}

- (UIButton)backNavigationButton
{
  backNavigationButton = self->_backNavigationButton;
  if (!backNavigationButton)
  {
    [(SiriUISashView *)self _setupBackNavigationButton];
    backNavigationButton = self->_backNavigationButton;
  }
  return backNavigationButton;
}

- (void)_setupBackNavigationButton
{
  if (!self->_backNavigationButton)
  {
    id v15 = [MEMORY[0x263F1C6C8] configurationWithWeight:7];
    double v3 = [MEMORY[0x263F1C6B0] systemImageNamed:@"chevron.left.circle.fill"];
    CGFloat v4 = [v3 imageWithConfiguration:v15];

    double v5 = [MEMORY[0x263F1C488] buttonWithType:0];
    backNavigationButton = self->_backNavigationButton;
    self->_backNavigationButton = v5;

    [(UIButton *)self->_backNavigationButton setBackgroundImage:v4 forState:0];
    [(UIButton *)self->_backNavigationButton setBackgroundImage:v4 forState:1];
    double v7 = self->_backNavigationButton;
    uint64_t v8 = [MEMORY[0x263F1C550] systemGrayColor];
    [(UIButton *)v7 setTintColor:v8];

    double v9 = self->_backNavigationButton;
    UIEdgeInsetsMakeWithEdges();
    -[UIButton _setTouchInsets:](v9, "_setTouchInsets:");
    double v10 = [MEMORY[0x263F1C480] effectWithStyle:8];
    double v11 = [MEMORY[0x263F1CB58] effectForBlurEffect:v10 style:4];
    double v12 = (UIVisualEffectView *)[objc_alloc(MEMORY[0x263F1CB98]) initWithEffect:v11];
    vibrantButtonBackgroundView = self->_vibrantButtonBackgroundView;
    self->_vibrantButtonBackgroundView = v12;

    double v14 = [(UIVisualEffectView *)self->_vibrantButtonBackgroundView contentView];
    [v14 addSubview:self->_backNavigationButton];

    [(UIView *)self->_contentView addSubview:self->_vibrantButtonBackgroundView];
  }
}

+ (id)_font
{
  v17[1] = *MEMORY[0x263EF8340];
  uint64_t v16 = *MEMORY[0x263F1D350];
  v2 = [NSNumber numberWithDouble:*MEMORY[0x263F1D340]];
  v17[0] = v2;
  double v3 = [NSDictionary dictionaryWithObjects:v17 forKeys:&v16 count:1];

  uint64_t v4 = *MEMORY[0x263F1D2C0];
  uint64_t v5 = *MEMORY[0x263F1D210];
  v14[0] = *MEMORY[0x263F1D208];
  v14[1] = v5;
  v15[0] = v4;
  v15[1] = v3;
  id v6 = [NSDictionary dictionaryWithObjects:v15 forKeys:v14 count:2];
  double v7 = (void *)[objc_alloc(MEMORY[0x263F1C660]) initWithFontAttributes:v6];
  uint64_t v8 = (void *)MEMORY[0x263F1C658];
  double v9 = [MEMORY[0x263F1C668] defaultMetrics];
  [v9 scaledValueForValue:15.0];
  double v11 = round(v10);

  double v12 = objc_msgSend(v8, "fontWithDescriptor:size:", v7, fmax(v11, 15.0));

  return v12;
}

+ ($131113AABFBD927EF350151908AA1243)_textContainerStyleForSashItem:(SEL)a3
{
  *(_OWORD *)&retstr->var0 = unk_22323E8E8;
  *(_OWORD *)&retstr->var2 = unk_22323E8F8;
  *(_OWORD *)&retstr->var3.left = unk_22323E908;
  retstr->var3.right = 16.0;
  uint64_t v5 = [a4 image];

  if (v5)
  {
    CGSize result = ($131113AABFBD927EF350151908AA1243 *)SiriLanguageIsRTL();
    uint64_t v7 = 32;
    if (result) {
      uint64_t v7 = 48;
    }
    *(double *)((char *)&retstr->var0 + v7) = *(double *)((char *)&retstr->var0 + v7) + -8.0;
  }
  return result;
}

- (SiriUISashItem)sashItem
{
  return self->_sashItem;
}

- (BOOL)isNavigating
{
  return self->_navigating;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_backNavigationButton, 0);
  objc_storeStrong((id *)&self->_sashItem, 0);
  objc_storeStrong((id *)&self->_vibrantTextBackgroundView, 0);
  objc_storeStrong((id *)&self->_vibrantButtonBackgroundView, 0);
  objc_storeStrong((id *)&self->_textContainerView, 0);
  objc_storeStrong((id *)&self->_imageView, 0);
  objc_storeStrong((id *)&self->_contentView, 0);
}

@end