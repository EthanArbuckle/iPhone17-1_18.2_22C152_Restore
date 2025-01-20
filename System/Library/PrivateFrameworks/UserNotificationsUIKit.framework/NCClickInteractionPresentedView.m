@interface NCClickInteractionPresentedView
- (BOOL)adjustForContentSizeCategoryChange;
- (BOOL)adjustsFontForContentSizeCategory;
- (CGSize)sizeThatFits:(CGSize)a3;
- (NCClickInteractionPresentedView)initWithTitle:(id)a3;
- (NSArray)requiredVisualStyleCategories;
- (NSString)preferredContentSizeCategory;
- (NSString)title;
- (id)visualStylingProviderForCategory:(int64_t)a3;
- (void)_configureTitleLabel;
- (void)_darkerSystemColorsStatusDidChange:(id)a3;
- (void)_reduceTransparencyStatusDidChange:(id)a3;
- (void)_updateTitleLabelAnchorPointAndPosition;
- (void)_updateTitleLabelTextAttributes;
- (void)_updateTitleLabelVisualStyling;
- (void)dealloc;
- (void)layoutSubviews;
- (void)setAdjustsFontForContentSizeCategory:(BOOL)a3;
- (void)setPreferredContentSizeCategory:(id)a3;
- (void)setTitle:(id)a3;
- (void)setVisualStylingProvider:(id)a3 forCategory:(int64_t)a4;
@end

@implementation NCClickInteractionPresentedView

- (NCClickInteractionPresentedView)initWithTitle:(id)a3
{
  id v4 = a3;
  v10.receiver = self;
  v10.super_class = (Class)NCClickInteractionPresentedView;
  v5 = [(NCClickInteractionPresentedView *)&v10 init];
  v6 = v5;
  if (v5)
  {
    [(NCClickInteractionPresentedView *)v5 setUserInteractionEnabled:0];
    [(NCClickInteractionPresentedView *)v6 _configureTitleLabel];
    [(NCClickInteractionPresentedView *)v6 setTitle:v4];
    v7 = [MEMORY[0x1E4F28EB8] defaultCenter];
    [v7 addObserver:v6 selector:sel__darkerSystemColorsStatusDidChange_ name:*MEMORY[0x1E4FB2438] object:0];

    v8 = [MEMORY[0x1E4F28EB8] defaultCenter];
    [v8 addObserver:v6 selector:sel__reduceTransparencyStatusDidChange_ name:*MEMORY[0x1E4FB24A8] object:0];
  }
  return v6;
}

- (void)dealloc
{
  v3 = [MEMORY[0x1E4F28EB8] defaultCenter];
  [v3 removeObserver:self name:*MEMORY[0x1E4FB2438] object:0];

  id v4 = [MEMORY[0x1E4F28EB8] defaultCenter];
  [v4 removeObserver:self name:*MEMORY[0x1E4FB24A8] object:0];

  v5.receiver = self;
  v5.super_class = (Class)NCClickInteractionPresentedView;
  [(NCClickInteractionPresentedView *)&v5 dealloc];
}

- (void)setTitle:(id)a3
{
  id v6 = a3;
  id v4 = [(UILabel *)self->_titleLabel text];
  char v5 = BSEqualStrings();

  if ((v5 & 1) == 0)
  {
    self->_cachedSizeThatFits = (CGSize)*MEMORY[0x1E4F1DB30];
    [(UILabel *)self->_titleLabel setText:v6];
    [(NCClickInteractionPresentedView *)self _updateTitleLabelAnchorPointAndPosition];
  }
}

- (NSString)title
{
  return [(UILabel *)self->_titleLabel text];
}

- (CGSize)sizeThatFits:(CGSize)a3
{
  p_cachedSizeThatFits = &self->_cachedSizeThatFits;
  double width = self->_cachedSizeThatFits.width;
  double height = self->_cachedSizeThatFits.height;
  if (width == 0.0 && height == 0.0)
  {
    -[UILabel sizeThatFits:](self->_titleLabel, "sizeThatFits:", 1.79769313e308, 1.79769313e308);
    double v7 = v6 + 48.0;
    double v9 = v8 + 24.0;
    if (v9 < 60.0) {
      double v9 = 60.0;
    }
    p_cachedSizeThatFits->double width = v7;
    p_cachedSizeThatFits->double height = v9;
    _NCMainScreenScale();
    UISizeRoundToScale();
    p_cachedSizeThatFits->double width = width;
    p_cachedSizeThatFits->double height = height;
  }
  result.double height = height;
  result.double width = width;
  return result;
}

- (void)layoutSubviews
{
  v20.receiver = self;
  v20.super_class = (Class)NCClickInteractionPresentedView;
  [(NCClickInteractionPresentedView *)&v20 layoutSubviews];
  [(NCClickInteractionPresentedView *)self bounds];
  CGFloat v4 = v3;
  CGFloat v6 = v5;
  CGFloat v8 = v7;
  CGFloat v10 = v9;
  -[NCClickInteractionPresentedView sizeThatFits:](self, "sizeThatFits:", *MEMORY[0x1E4F1DB30], *(double *)(MEMORY[0x1E4F1DB30] + 8));
  double v12 = v11;
  double v14 = v13;
  v21.origin.x = v4;
  v21.origin.y = v6;
  v21.size.double width = v8;
  v21.size.double height = v10;
  CGFloat v15 = CGRectGetWidth(v21) / v12;
  v22.origin.x = v4;
  v22.origin.y = v6;
  v22.size.double width = v8;
  v22.size.double height = v10;
  CGFloat Height = CGRectGetHeight(v22);
  memset(&v19, 0, sizeof(v19));
  CGAffineTransformMakeScale(&v19, v15, Height / v14);
  titleLabel = self->_titleLabel;
  CGAffineTransform v18 = v19;
  [(UILabel *)titleLabel setTransform:&v18];
}

- (id)visualStylingProviderForCategory:(int64_t)a3
{
  if (a3 == 1) {
    return self->_visualStylingProvider;
  }
  else {
    return 0;
  }
}

- (NSArray)requiredVisualStyleCategories
{
  return (NSArray *)&unk_1F2F84688;
}

- (void)setVisualStylingProvider:(id)a3 forCategory:(int64_t)a4
{
  double v7 = (MTVisualStylingProvider *)a3;
  if (a4 == 1)
  {
    visualStylingProvider = self->_visualStylingProvider;
    if (visualStylingProvider != v7)
    {
      double v9 = v7;
      [(MTVisualStylingProvider *)visualStylingProvider stopAutomaticallyUpdatingView:self->_titleLabel];
      objc_storeStrong((id *)&self->_visualStylingProvider, a3);
      [(NCClickInteractionPresentedView *)self _updateTitleLabelVisualStyling];
      double v7 = v9;
    }
  }
}

- (void)setAdjustsFontForContentSizeCategory:(BOOL)a3
{
  if (self->_adjustsFontForContentSizeCategory != a3)
  {
    self->_adjustsFontForContentSizeCategory = a3;
    [(NCClickInteractionPresentedView *)self adjustForContentSizeCategoryChange];
  }
}

- (NSString)preferredContentSizeCategory
{
  p_preferredContentSizeCategory = &self->_preferredContentSizeCategory;
  preferredContentSizeCategory = self->_preferredContentSizeCategory;
  if (!preferredContentSizeCategory)
  {
    objc_storeStrong((id *)p_preferredContentSizeCategory, (id)*MEMORY[0x1E4FB27F0]);
    preferredContentSizeCategory = *p_preferredContentSizeCategory;
  }

  return preferredContentSizeCategory;
}

- (BOOL)adjustForContentSizeCategoryChange
{
  double v3 = [MEMORY[0x1E4FB1438] sharedApplication];
  CGFloat v4 = [v3 preferredContentSizeCategory];

  double v5 = [(NCClickInteractionPresentedView *)self preferredContentSizeCategory];
  char v6 = [v4 isEqualToString:v5];

  if ((v6 & 1) == 0)
  {
    [(NCClickInteractionPresentedView *)self setPreferredContentSizeCategory:v4];
    self->_cachedSizeThatFits = (CGSize)*MEMORY[0x1E4F1DB30];
    [(NCClickInteractionPresentedView *)self _updateTitleLabelTextAttributes];
  }

  return v6 ^ 1;
}

- (void)_updateTitleLabelVisualStyling
{
  double v3 = [(NCClickInteractionPresentedView *)self superview];

  if (v3)
  {
    [(UILabel *)self->_titleLabel mt_removeAllVisualStyling];
    visualStylingProvider = self->_visualStylingProvider;
    titleLabel = self->_titleLabel;
    [(MTVisualStylingProvider *)visualStylingProvider automaticallyUpdateView:titleLabel withStyle:1];
  }
}

- (void)_updateTitleLabelTextAttributes
{
  preferredContentSizeCategory = self->_preferredContentSizeCategory;
  if (preferredContentSizeCategory
    && (uint64_t v4 = *MEMORY[0x1E4FB27C0],
        UIContentSizeCategoryCompareToCategory(preferredContentSizeCategory, (UIContentSizeCategory)*MEMORY[0x1E4FB27C0]) != NSOrderedDescending))
  {
    titleLabel = self->_titleLabel;
    CGFloat v8 = (void *)MEMORY[0x1E4FB08E0];
    uint64_t v9 = *MEMORY[0x1E4FB28C8];
    char v6 = [MEMORY[0x1E4FB1E20] traitCollectionWithPreferredContentSizeCategory:v4];
    CGFloat v10 = [v8 preferredFontForTextStyle:v9 compatibleWithTraitCollection:v6];
    [(UILabel *)titleLabel setFont:v10];
  }
  else
  {
    double v5 = self->_titleLabel;
    char v6 = [MEMORY[0x1E4FB08E0] preferredFontForTextStyle:*MEMORY[0x1E4FB28C8]];
    [(UILabel *)v5 setFont:v6];
  }

  [(NCClickInteractionPresentedView *)self _updateTitleLabelAnchorPointAndPosition];

  [(NCClickInteractionPresentedView *)self setNeedsLayout];
}

- (void)_updateTitleLabelAnchorPointAndPosition
{
  long long v21 = 0u;
  long long v22 = 0u;
  long long v20 = 0u;
  titleLabel = self->_titleLabel;
  if (titleLabel)
  {
    [(UILabel *)titleLabel transform];
    titleLabel = self->_titleLabel;
  }
  long long v4 = *(_OWORD *)(MEMORY[0x1E4F1DAB8] + 16);
  long long v17 = *MEMORY[0x1E4F1DAB8];
  long long v18 = v4;
  long long v19 = *(_OWORD *)(MEMORY[0x1E4F1DAB8] + 32);
  [(UILabel *)titleLabel setTransform:&v17];
  double v5 = [(UILabel *)self->_titleLabel layer];
  objc_msgSend(v5, "setAnchorPoint:", 0.5, 0.5);
  objc_msgSend(v5, "setPosition:", *MEMORY[0x1E4F1DAD8], *(double *)(MEMORY[0x1E4F1DAD8] + 8));
  -[NCClickInteractionPresentedView sizeThatFits:](self, "sizeThatFits:", *MEMORY[0x1E4F1DB30], *(double *)(MEMORY[0x1E4F1DB30] + 8));
  BSRectWithSize();
  CGFloat v7 = v6;
  CGFloat v9 = v8;
  CGFloat v11 = v10;
  CGFloat v13 = v12;
  -[UILabel setFrame:](self->_titleLabel, "setFrame:");
  v23.origin.x = v7;
  v23.origin.y = v9;
  v23.size.double width = v11;
  v23.size.double height = v13;
  double MinX = CGRectGetMinX(v23);
  v24.origin.x = v7;
  v24.origin.y = v9;
  v24.size.double width = v11;
  v24.size.double height = v13;
  double MinY = CGRectGetMinY(v24);
  objc_msgSend(v5, "setAnchorPoint:", 0.0, 0.0);
  objc_msgSend(v5, "setPosition:", MinX, MinY);
  v16 = self->_titleLabel;
  long long v17 = v20;
  long long v18 = v21;
  long long v19 = v22;
  [(UILabel *)v16 setTransform:&v17];
  [(NCClickInteractionPresentedView *)self setNeedsLayout];
}

- (void)_configureTitleLabel
{
  if (!self->_titleLabel)
  {
    double v3 = (UILabel *)objc_alloc_init(MEMORY[0x1E4FB1930]);
    titleLabel = self->_titleLabel;
    self->_titleLabel = v3;

    [(UILabel *)self->_titleLabel setNumberOfLines:0];
    [(UILabel *)self->_titleLabel setLineBreakMode:0];
    LODWORD(v5) = 0.5;
    [(UILabel *)self->_titleLabel _setHyphenationFactor:v5];
    [(UILabel *)self->_titleLabel setTextAlignment:1];
    [(NCClickInteractionPresentedView *)self _updateTitleLabelVisualStyling];
    [(NCClickInteractionPresentedView *)self _updateTitleLabelTextAttributes];
    double v6 = self->_titleLabel;
    [(NCClickInteractionPresentedView *)self addSubview:v6];
  }
}

- (void)_darkerSystemColorsStatusDidChange:(id)a3
{
  if (self->_titleLabel) {
    [(NCClickInteractionPresentedView *)self _updateTitleLabelVisualStyling];
  }
}

- (void)_reduceTransparencyStatusDidChange:(id)a3
{
  if (self->_titleLabel) {
    [(NCClickInteractionPresentedView *)self _updateTitleLabelVisualStyling];
  }
}

- (BOOL)adjustsFontForContentSizeCategory
{
  return self->_adjustsFontForContentSizeCategory;
}

- (void)setPreferredContentSizeCategory:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_preferredContentSizeCategory, 0);
  objc_storeStrong((id *)&self->_visualStylingProvider, 0);

  objc_storeStrong((id *)&self->_titleLabel, 0);
}

@end