@interface PKPaymentPassActionWidgetButton
+ (double)glyphImageHeight:(BOOL)a3;
+ (double)widgetHeightWithAccessibilityLayout:(BOOL)a3;
- (BOOL)usesAccessibilityLayout;
- (CGSize)sizeThatFits:(CGSize)a3;
- (PKPaymentPassActionBundle)actionBundle;
- (PKPaymentPassActionWidgetButton)initWithWidgetViewStyle:(unint64_t)a3;
- (void)_applyStyles;
- (void)layoutSubviews;
- (void)setActionBundle:(id)a3;
- (void)setHighlighted:(BOOL)a3;
- (void)setUsesAccessibilityLayout:(BOOL)a3;
- (void)traitCollectionDidChange:(id)a3;
@end

@implementation PKPaymentPassActionWidgetButton

- (PKPaymentPassActionWidgetButton)initWithWidgetViewStyle:(unint64_t)a3
{
  v10.receiver = self;
  v10.super_class = (Class)PKPaymentPassActionWidgetButton;
  v3 = -[PKPaymentPassActionWidgetButton initWithFrame:](&v10, sel_initWithFrame_, a3, *MEMORY[0x1E4F1DB28], *(double *)(MEMORY[0x1E4F1DB28] + 8), *(double *)(MEMORY[0x1E4F1DB28] + 16), *(double *)(MEMORY[0x1E4F1DB28] + 24));
  v4 = v3;
  if (v3)
  {
    v5 = [(PKPaymentPassActionWidgetButton *)v3 titleLabel];
    [v5 setTextAlignment:1];
    [v5 setLineBreakMode:5];
    [(PKPaymentPassActionWidgetButton *)v4 _applyStyles];
    v6 = [MEMORY[0x1E4FB1618] systemBlueColor];
    [(PKPaymentPassActionWidgetButton *)v4 setTitleColor:v6 forState:0];
    v7 = [v6 colorWithAlphaComponent:0.5];
    [(PKPaymentPassActionWidgetButton *)v4 setTitleColor:v7 forState:2];

    [(PKPaymentPassActionWidgetButton *)v4 setTintColor:v6];
    v8 = [MEMORY[0x1E4FB1618] secondarySystemGroupedBackgroundColor];
    [(PKPaymentPassActionWidgetButton *)v4 setBackgroundColor:v8];

    [(PKPaymentPassActionWidgetButton *)v4 _setContinuousCornerRadius:10.0];
    [(PKPaymentPassActionWidgetButton *)v4 setAccessibilityIdentifier:*MEMORY[0x1E4F851B0]];
  }
  return v4;
}

- (void)layoutSubviews
{
  v23.receiver = self;
  v23.super_class = (Class)PKPaymentPassActionWidgetButton;
  [(PKPaymentPassActionWidgetButton *)&v23 layoutSubviews];
  [(PKPaymentPassActionWidgetButton *)self bounds];
  double v4 = v3;
  double v6 = v5;
  double v8 = v7;
  double v10 = v9;
  remainder.origin.x = v3;
  remainder.origin.y = v5;
  remainder.size.width = v7;
  remainder.size.height = v9;
  memset(&slice, 0, sizeof(slice));
  v11 = [(PKPaymentPassActionWidgetButton *)self imageView];
  v12 = [(PKPaymentPassActionWidgetButton *)self titleLabel];
  objc_msgSend(v11, "sizeThatFits:", v8, v10);
  CGFloat v14 = v13;
  CGFloat v16 = v15;
  objc_msgSend(v12, "sizeThatFits:", v8, v10);
  if (self->_usesAccessibilityLayout)
  {
    remainder.origin.x = v4 + 16.0;
    remainder.origin.y = v6 + 0.0;
    remainder.size.width = v8 + -32.0;
    remainder.size.height = v10;
    if ([(PKPaymentPassActionWidgetButton *)self _shouldReverseLayoutDirection])CGRectEdge v17 = CGRectMaxXEdge; {
    else
    }
      CGRectEdge v17 = CGRectMinXEdge;
    CGRectDivide(remainder, &slice, &remainder, v14, v17);
    PKSizeAlignedInRect();
    objc_msgSend(v11, "setFrame:");
    CGRectDivide(remainder, &slice, &remainder, 10.0, v17);
  }
  else
  {
    v18 = [v12 font];
    [v18 lineHeight];
    PKFloatRoundToPixel();
    double v20 = v19;

    v24.origin.x = v4 + 0.0;
    v24.origin.y = v6 + v20;
    remainder.origin.x = v4 + 0.0;
    remainder.origin.y = v6 + v20;
    v24.size.height = v10 - (v20 + v20);
    remainder.size.width = v8;
    remainder.size.height = v24.size.height;
    v24.size.width = v8;
    CGRectDivide(v24, &slice, &remainder, v16, CGRectMinYEdge);
    PKSizeAlignedInRect();
    objc_msgSend(v11, "setFrame:");
    CGRectDivide(remainder, &slice, &remainder, 2.0, CGRectMinYEdge);
  }
  PKSizeAlignedInRect();
  objc_msgSend(v12, "setFrame:");
}

- (CGSize)sizeThatFits:(CGSize)a3
{
  double height = a3.height;
  double width = a3.width;
  [(id)objc_opt_class() widgetHeightWithAccessibilityLayout:self->_usesAccessibilityLayout];
  double v7 = v6;
  if (self->_usesAccessibilityLayout)
  {
    double v8 = width;
    double v9 = v7;
  }
  else
  {
    double v10 = [(PKPaymentPassActionWidgetButton *)self titleLabel];
    objc_msgSend(v10, "sizeThatFits:", 1.79769313e308, height);
    double v12 = v11;

    double v13 = [(PKPaymentPassActionWidgetButton *)self imageView];
    objc_msgSend(v13, "sizeThatFits:", width, height);
    double v15 = v14;

    if (v15 <= v12) {
      double v19 = v12;
    }
    else {
      double v19 = v15;
    }
    v16.n128_f64[0] = v19 + 16.0;
    v17.n128_f64[0] = v7;
    PKSizeRoundToPixel(v16, v17, v18);
  }
  result.double height = v9;
  result.double width = v8;
  return result;
}

- (void)traitCollectionDidChange:(id)a3
{
  v8.receiver = self;
  v8.super_class = (Class)PKPaymentPassActionWidgetButton;
  id v4 = a3;
  [(PKPaymentPassActionWidgetButton *)&v8 traitCollectionDidChange:v4];
  CGFloat v5 = [(PKPaymentPassActionWidgetButton *)self traitCollection];
  double v6 = [v5 preferredContentSizeCategory];

  double v7 = [v4 preferredContentSizeCategory];

  LOBYTE(v4) = [v7 isEqualToString:v6];
  if ((v4 & 1) == 0) {
    [(PKPaymentPassActionWidgetButton *)self _applyStyles];
  }
}

+ (double)glyphImageHeight:(BOOL)a3
{
  CGFloat v3 = (NSString **)MEMORY[0x1E4FB28E0];
  if (a3) {
    CGFloat v3 = (NSString **)MEMORY[0x1E4FB2950];
  }
  id v4 = PKFontForDefaultDesign(*v3, (NSString *)*MEMORY[0x1E4FB2778]);
  [v4 lineHeight];
  PKFloatRoundToPixel();
  double v6 = fmin(v5, 28.0);

  return v6;
}

+ (double)widgetHeightWithAccessibilityLayout:(BOOL)a3
{
  BOOL v3 = a3;
  id v4 = (NSString **)MEMORY[0x1E4FB28E0];
  if (a3) {
    id v4 = (NSString **)MEMORY[0x1E4FB2950];
  }
  double v5 = PKFontForDefaultDesign(*v4, (NSString *)*MEMORY[0x1E4FB2778]);
  [v5 lineHeight];

  [(id)objc_opt_class() glyphImageHeight:v3];

  PKFloatRoundToPixel();
  return result;
}

- (void)_applyStyles
{
  id v5 = [(PKPaymentPassActionWidgetButton *)self titleLabel];
  if (self->_usesAccessibilityLayout) {
    BOOL v3 = (NSString **)MEMORY[0x1E4FB2950];
  }
  else {
    BOOL v3 = (NSString **)MEMORY[0x1E4FB28E0];
  }
  id v4 = PKFontForDefaultDesign(*v3, (NSString *)*MEMORY[0x1E4FB2778]);
  [v5 setFont:v4];
}

- (void)setUsesAccessibilityLayout:(BOOL)a3
{
  if (((!self->_usesAccessibilityLayout ^ a3) & 1) == 0)
  {
    self->_usesAccessibilityLayout = a3;
    [(PKPaymentPassActionWidgetButton *)self _applyStyles];
    [(PKPaymentPassActionWidgetButton *)self setNeedsLayout];
  }
}

- (void)setHighlighted:(BOOL)a3
{
  BOOL v3 = a3;
  v6.receiver = self;
  v6.super_class = (Class)PKPaymentPassActionWidgetButton;
  -[PKPaymentPassActionWidgetButton setHighlighted:](&v6, sel_setHighlighted_);
  if (v3) {
    [MEMORY[0x1E4FB1618] tableCellDefaultSelectionTintColor];
  }
  else {
  id v5 = [MEMORY[0x1E4FB1618] secondarySystemGroupedBackgroundColor];
  }
  [(PKPaymentPassActionWidgetButton *)self setBackgroundColor:v5];
}

- (PKPaymentPassActionBundle)actionBundle
{
  return self->_actionBundle;
}

- (void)setActionBundle:(id)a3
{
}

- (BOOL)usesAccessibilityLayout
{
  return self->_usesAccessibilityLayout;
}

- (void).cxx_destruct
{
}

@end