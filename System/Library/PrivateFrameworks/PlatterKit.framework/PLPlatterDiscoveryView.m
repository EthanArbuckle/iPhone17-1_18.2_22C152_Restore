@interface PLPlatterDiscoveryView
- (CGSize)sizeThatFits:(CGSize)a3;
- (MTVisualStylingProvider)strokeVisualStylingProvider;
- (NSString)bodyText;
- (NSString)titleText;
- (PLPlatterDiscoveryView)init;
- (UIAction)clearAction;
- (UIAction)defaultAction;
- (UIView)graphicView;
- (id)requiredVisualStyleCategories;
- (id)visualStylingProviderForCategory:(int64_t)a3;
- (void)_configureBodyLabelIfNeccessary;
- (void)_configureClearButtonIfNeccessary;
- (void)_configureTitleTextLabelIfNeccessary;
- (void)_layoutSubviewInBounds:(CGRect)a3 measuringOnly:(CGSize *)a4;
- (void)layoutSubviews;
- (void)setBodyText:(id)a3;
- (void)setClearAction:(id)a3;
- (void)setDefaultAction:(id)a3;
- (void)setGraphicView:(id)a3;
- (void)setStrokeVisualStylingProvider:(id)a3;
- (void)setTitleText:(id)a3;
- (void)setVisualStylingProvider:(id)a3 forCategory:(int64_t)a4;
- (void)updateVisualStylingOfView:(id)a3 style:(int64_t)a4 visualStylingProvider:(id)a5 outgoingProvider:(id)a6;
- (void)visualStylingProviderDidChange:(id)a3 forCategory:(int64_t)a4 outgoingProvider:(id)a5;
@end

@implementation PLPlatterDiscoveryView

- (PLPlatterDiscoveryView)init
{
  v7.receiver = self;
  v7.super_class = (Class)PLPlatterDiscoveryView;
  v2 = [(PLPlatterView *)&v7 initWithRecipe:1];
  v3 = v2;
  if (v2)
  {
    [(PLPlatterView *)v2 setUsesBackgroundView:0];
    uint64_t v4 = [(PLPlatterDiscoveryView *)v3 visualStylingProviderForCategory:1];
    strokeVisualStylingProvider = v3->_strokeVisualStylingProvider;
    v3->_strokeVisualStylingProvider = (MTVisualStylingProvider *)v4;
  }
  return v3;
}

- (NSString)titleText
{
  return [(UILabel *)self->_titleTextLabel text];
}

- (void)setTitleText:(id)a3
{
  id v7 = a3;
  uint64_t v4 = [(PLPlatterDiscoveryView *)self titleText];
  char v5 = BSEqualStrings();

  if ((v5 & 1) == 0)
  {
    if (v7)
    {
      [(PLPlatterDiscoveryView *)self _configureTitleTextLabelIfNeccessary];
      [(UILabel *)self->_titleTextLabel setText:v7];
    }
    else
    {
      [(UILabel *)self->_titleTextLabel removeFromSuperview];
      titleTextLabel = self->_titleTextLabel;
      self->_titleTextLabel = 0;
    }
    [(PLPlatterDiscoveryView *)self setNeedsLayout];
  }
}

- (NSString)bodyText
{
  return [(UILabel *)self->_bodyTextLabel text];
}

- (void)setBodyText:(id)a3
{
  id v7 = a3;
  uint64_t v4 = [(PLPlatterDiscoveryView *)self bodyText];
  char v5 = BSEqualStrings();

  if ((v5 & 1) == 0)
  {
    if (v7)
    {
      [(PLPlatterDiscoveryView *)self _configureBodyLabelIfNeccessary];
      [(UILabel *)self->_bodyTextLabel setText:v7];
    }
    else
    {
      [(UILabel *)self->_bodyTextLabel removeFromSuperview];
      bodyTextLabel = self->_bodyTextLabel;
      self->_bodyTextLabel = 0;
    }
    [(PLPlatterDiscoveryView *)self setNeedsLayout];
  }
}

- (UIView)graphicView
{
  v2 = [(UIView *)self->_graphicContainerView subviews];
  v3 = [v2 firstObject];

  return (UIView *)v3;
}

- (void)setGraphicView:(id)a3
{
  id v13 = a3;
  uint64_t v4 = [(PLPlatterDiscoveryView *)self graphicView];

  if (v4)
  {
    char v5 = [(PLPlatterDiscoveryView *)self graphicView];
    [v5 removeFromSuperview];
  }
  graphicContainerView = self->_graphicContainerView;
  id v7 = v13;
  if (v13)
  {
    if (!graphicContainerView)
    {
      v8 = (UIView *)objc_alloc_init(MEMORY[0x1E4F42FF0]);
      v9 = self->_graphicContainerView;
      self->_graphicContainerView = v8;

      v10 = [(PLPlatterView *)self customContentView];
      [v10 addSubview:self->_graphicContainerView];

      v11 = [(PLPlatterView *)self customContentView];
      [v11 sendSubviewToBack:self->_graphicContainerView];

      id v7 = v13;
    }
    [v7 setAutoresizingMask:18];
    [(UIView *)self->_graphicContainerView addSubview:v13];
  }
  else
  {
    [(UIView *)graphicContainerView removeFromSuperview];
    v12 = self->_graphicContainerView;
    self->_graphicContainerView = 0;
  }
  [(PLPlatterDiscoveryView *)self setNeedsLayout];
}

- (void)setClearAction:(id)a3
{
  id v7 = a3;
  clearButton = self->_clearButton;
  if (clearButton)
  {
    [(UIButton *)clearButton removeFromSuperview];
    v6 = self->_clearButton;
    self->_clearButton = 0;
  }
  objc_storeStrong((id *)&self->_clearAction, a3);
  if (self->_clearAction)
  {
    [(PLPlatterDiscoveryView *)self _configureClearButtonIfNeccessary];
    [(UIButton *)self->_clearButton addAction:self->_clearAction forControlEvents:64];
  }
  [(PLPlatterDiscoveryView *)self setNeedsLayout];
}

- (CGSize)sizeThatFits:(CGSize)a3
{
  long long v6 = *MEMORY[0x1E4F1DB30];
  BSRectWithSize();
  -[PLPlatterDiscoveryView _layoutSubviewInBounds:measuringOnly:](self, "_layoutSubviewInBounds:measuringOnly:", &v6);
  double v5 = *((double *)&v6 + 1);
  double v4 = *(double *)&v6;
  result.height = v5;
  result.width = v4;
  return result;
}

- (void)layoutSubviews
{
  v3.receiver = self;
  v3.super_class = (Class)PLPlatterDiscoveryView;
  [(PLPlatterView *)&v3 layoutSubviews];
  [(PLPlatterDiscoveryView *)self bounds];
  if (CGRectGetWidth(v4) > 0.0)
  {
    [(PLPlatterDiscoveryView *)self bounds];
    -[PLPlatterDiscoveryView _layoutSubviewInBounds:measuringOnly:](self, "_layoutSubviewInBounds:measuringOnly:", 0);
  }
}

- (void)_configureClearButtonIfNeccessary
{
  if (!self->_clearButton)
  {
    objc_super v3 = (UIButton *)objc_alloc_init(MEMORY[0x1E4F427E0]);
    clearButton = self->_clearButton;
    self->_clearButton = v3;

    id v11 = [MEMORY[0x1E4F427E8] plainButtonConfiguration];
    double v5 = [MEMORY[0x1E4F4F8B8] defaultFontProvider];
    long long v6 = [v5 preferredFontForTextStyle:*MEMORY[0x1E4F43880] hiFontStyle:4];

    id v7 = [MEMORY[0x1E4F42A98] configurationWithFont:v6];
    v8 = [MEMORY[0x1E4F42A80] systemImageNamed:@"xmark" withConfiguration:v7];
    [v11 setImage:v8];
    [(UIButton *)self->_clearButton setConfiguration:v11];
    [(PLPlatterDiscoveryView *)self updateVisualStylingOfView:self->_clearButton style:1 visualStylingProvider:self->_strokeVisualStylingProvider outgoingProvider:0];
    v9 = [(PLPlatterView *)self customContentView];
    [v9 addSubview:self->_clearButton];

    v10 = [(PLPlatterView *)self customContentView];
    [v10 bringSubviewToFront:self->_clearButton];
  }
}

- (void)_configureTitleTextLabelIfNeccessary
{
  if (!self->_titleTextLabel)
  {
    id v15 = [MEMORY[0x1E4F42A38] preferredFontDescriptorWithTextStyle:*MEMORY[0x1E4F438A8] addingSymbolicTraits:2 options:0];
    objc_super v3 = [MEMORY[0x1E4F42A38] preferredFontDescriptorWithTextStyle:*MEMORY[0x1E4F438B0] addingSymbolicTraits:2 options:0];
    CGRect v4 = (UILabel *)objc_alloc_init(MEMORY[0x1E4F42B38]);
    titleTextLabel = self->_titleTextLabel;
    self->_titleTextLabel = v4;

    long long v6 = self->_titleTextLabel;
    id v7 = [(PLPlatterDiscoveryView *)self titleText];
    [(UILabel *)v6 setText:v7];

    v8 = self->_titleTextLabel;
    v9 = [MEMORY[0x1E4F42A30] fontWithDescriptor:v15 size:0.0];
    [(UILabel *)v8 setFont:v9];

    [(UILabel *)self->_titleTextLabel setAdjustsFontSizeToFitWidth:1];
    v10 = self->_titleTextLabel;
    [v3 pointSize];
    double v12 = v11;
    [v15 pointSize];
    [(UILabel *)v10 setMinimumScaleFactor:v12 / v13];
    [(UILabel *)self->_titleTextLabel setNumberOfLines:0];
    [(PLPlatterDiscoveryView *)self updateVisualStylingOfView:self->_titleTextLabel style:0 visualStylingProvider:self->_strokeVisualStylingProvider outgoingProvider:0];
    v14 = [(PLPlatterView *)self customContentView];
    [v14 addSubview:self->_titleTextLabel];
  }
}

- (void)_configureBodyLabelIfNeccessary
{
  if (!self->_bodyTextLabel)
  {
    objc_super v3 = (UILabel *)objc_alloc_init(MEMORY[0x1E4F42B38]);
    bodyTextLabel = self->_bodyTextLabel;
    self->_bodyTextLabel = v3;

    double v5 = self->_bodyTextLabel;
    long long v6 = [(PLPlatterDiscoveryView *)self bodyText];
    [(UILabel *)v5 setText:v6];

    id v7 = self->_bodyTextLabel;
    v8 = [MEMORY[0x1E4F42A30] preferredFontForTextStyle:*MEMORY[0x1E4F438C0]];
    [(UILabel *)v7 setFont:v8];

    [(PLPlatterDiscoveryView *)self updateVisualStylingOfView:self->_bodyTextLabel style:1 visualStylingProvider:self->_strokeVisualStylingProvider outgoingProvider:0];
    [(UILabel *)self->_bodyTextLabel setNumberOfLines:0];
    id v9 = [(PLPlatterView *)self customContentView];
    [v9 addSubview:self->_bodyTextLabel];
  }
}

- (void)_layoutSubviewInBounds:(CGRect)a3 measuringOnly:(CGSize *)a4
{
  CGFloat height = a3.size.height;
  CGFloat width = a3.size.width;
  CGFloat y = a3.origin.y;
  CGFloat x = a3.origin.x;
  int v10 = [(PLPlatterDiscoveryView *)self _shouldReverseLayoutDirection];
  double v11 = [(PLPlatterDiscoveryView *)self traitCollection];
  [v11 displayScale];

  v37.origin.CGFloat x = x;
  v37.origin.CGFloat y = y;
  v37.size.CGFloat width = width;
  v37.size.CGFloat height = height;
  double v12 = CGRectGetWidth(v37);
  double v13 = v12 * 0.5;
  titleTextLabel = self->_titleTextLabel;
  if (titleTextLabel)
  {
    -[UILabel sizeThatFits:](titleTextLabel, "sizeThatFits:", v13, 1.79769313e308);
    UIRectIntegralWithScale();
    CGFloat v19 = v15;
    CGFloat v20 = v16;
    CGFloat v21 = v17;
    CGFloat v22 = v18;
    if (!a4) {
      -[UILabel setFrame:](self->_titleTextLabel, "setFrame:", v15, v16, v17, v18);
    }
    v38.origin.CGFloat x = v19;
    v38.origin.CGFloat y = v20;
    v38.size.CGFloat width = v21;
    v38.size.CGFloat height = v22;
    CGRectGetMaxY(v38);
  }
  bodyTextLabel = self->_bodyTextLabel;
  if (bodyTextLabel)
  {
    -[UILabel sizeThatFits:](bodyTextLabel, "sizeThatFits:", v13, 1.79769313e308);
    UIRectIntegralWithScale();
    CGFloat v28 = v24;
    CGFloat v29 = v25;
    CGFloat v30 = v26;
    CGFloat v31 = v27;
    if (!a4) {
      -[UILabel setFrame:](self->_bodyTextLabel, "setFrame:", v24, v25, v26, v27);
    }
    v39.origin.CGFloat x = v28;
    v39.origin.CGFloat y = v29;
    v39.size.CGFloat width = v30;
    v39.size.CGFloat height = v31;
    CGRectGetMaxY(v39);
  }
  if (a4)
  {
    UISizeRoundToScale();
    a4->CGFloat width = v32;
    a4->CGFloat height = v33;
  }
  else
  {
    UIRectIntegralWithScale();
    -[UIView setFrame:](self->_graphicContainerView, "setFrame:");
    clearButton = self->_clearButton;
    double v35 = v12 + -2.0 + -44.0;
    if (v10) {
      double v35 = 2.0;
    }
    [(UIButton *)clearButton setFrame:v35];
  }
}

- (id)visualStylingProviderForCategory:(int64_t)a3
{
  strokeVisualStylingProvider = self->_strokeVisualStylingProvider;
  if (strokeVisualStylingProvider)
  {
    CGRect v4 = strokeVisualStylingProvider;
  }
  else
  {
    v6.receiver = self;
    v6.super_class = (Class)PLPlatterDiscoveryView;
    CGRect v4 = [(PLPlatterView *)&v6 visualStylingProviderForCategory:a3];
  }
  return v4;
}

- (id)requiredVisualStyleCategories
{
  return &unk_1F3358E60;
}

- (void)setVisualStylingProvider:(id)a3 forCategory:(int64_t)a4
{
  double v16 = (MTVisualStylingProvider *)a3;
  id v7 = [(PLPlatterDiscoveryView *)self requiredVisualStyleCategories];
  v8 = [NSNumber numberWithInteger:a4];
  char v9 = [v7 containsObject:v8];

  if ((v9 & 1) == 0)
  {
    double v15 = [MEMORY[0x1E4F28B00] currentHandler];
    [v15 handleFailureInMethod:a2, self, @"PLPlatterDiscoveryView.m", 241, @"Invalid parameter not satisfying: %@", @"[[self requiredVisualStyleCategories] containsObject:@(category)]" object file lineNumber description];
  }
  strokeVisualStylingProvider = self->_strokeVisualStylingProvider;
  double v11 = v16;
  if (strokeVisualStylingProvider != v16)
  {
    double v12 = v16;
    double v13 = self->_strokeVisualStylingProvider;
    self->_strokeVisualStylingProvider = v12;
    v14 = strokeVisualStylingProvider;

    [(PLPlatterDiscoveryView *)self visualStylingProviderDidChange:self->_strokeVisualStylingProvider forCategory:a4 outgoingProvider:v14];
    double v11 = v16;
  }
}

- (void)visualStylingProviderDidChange:(id)a3 forCategory:(int64_t)a4 outgoingProvider:(id)a5
{
  titleTextLabel = self->_titleTextLabel;
  id v8 = a5;
  id v9 = a3;
  [(PLPlatterDiscoveryView *)self updateVisualStylingOfView:titleTextLabel style:0 visualStylingProvider:v9 outgoingProvider:v8];
  [(PLPlatterDiscoveryView *)self updateVisualStylingOfView:self->_bodyTextLabel style:1 visualStylingProvider:v9 outgoingProvider:v8];
  [(PLPlatterDiscoveryView *)self updateVisualStylingOfView:self->_clearButton style:1 visualStylingProvider:v9 outgoingProvider:v8];
}

- (void)updateVisualStylingOfView:(id)a3 style:(int64_t)a4 visualStylingProvider:(id)a5 outgoingProvider:(id)a6
{
  if (a3)
  {
    id v9 = a5;
    id v10 = a3;
    [a6 stopAutomaticallyUpdatingView:v10];
    [v9 automaticallyUpdateView:v10 withStyle:a4];
  }
}

- (UIAction)defaultAction
{
  return self->_defaultAction;
}

- (void)setDefaultAction:(id)a3
{
}

- (MTVisualStylingProvider)strokeVisualStylingProvider
{
  return self->_strokeVisualStylingProvider;
}

- (void)setStrokeVisualStylingProvider:(id)a3
{
}

- (UIAction)clearAction
{
  return self->_clearAction;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_clearAction, 0);
  objc_storeStrong((id *)&self->_defaultAction, 0);
  objc_storeStrong((id *)&self->_clearButton, 0);
  objc_storeStrong((id *)&self->_strokeVisualStylingProvider, 0);
  objc_storeStrong((id *)&self->_graphicContainerView, 0);
  objc_storeStrong((id *)&self->_bodyTextLabel, 0);
  objc_storeStrong((id *)&self->_titleTextLabel, 0);
}

@end