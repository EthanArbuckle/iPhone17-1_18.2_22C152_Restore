@interface SFUnifiedBarButtonView
- (BOOL)pointInside:(CGPoint)a3 withEvent:(id)a4;
- (BOOL)shouldTrailingAlignImage;
- (CGRect)_hitRect;
- (CGRect)_selectedIndicatorBounds;
- (SFUnifiedBarButtonView)initWithFrame:(CGRect)a3;
- (UIImage)image;
- (double)preferredWidth;
- (id)pointerInteraction:(id)a3 regionForRequest:(id)a4 defaultRegion:(id)a5;
- (void)setEnabled:(BOOL)a3;
- (void)setImage:(id)a3;
- (void)setShouldTrailingAlignImage:(BOOL)a3;
- (void)tintColorDidChange;
- (void)traitCollectionDidChange:(id)a3;
- (void)updateTitleFont;
@end

@implementation SFUnifiedBarButtonView

- (SFUnifiedBarButtonView)initWithFrame:(CGRect)a3
{
  v31[4] = *MEMORY[0x1E4F143B8];
  v30.receiver = self;
  v30.super_class = (Class)SFUnifiedBarButtonView;
  v3 = -[SFUnifiedBarItemView initWithFrame:](&v30, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  v4 = v3;
  if (v3)
  {
    [(UIView *)v3 sf_applyContentSizeCategoryLimitsForToolbarButton];
    v5 = (UIImageView *)objc_alloc_init(MEMORY[0x1E4FB1838]);
    imageView = v4->_imageView;
    v4->_imageView = v5;

    v7 = [MEMORY[0x1E4FB1830] configurationWithTextStyle:*MEMORY[0x1E4FB28C8] scale:3];
    [(UIImageView *)v4->_imageView setPreferredSymbolConfiguration:v7];

    [(UIImageView *)v4->_imageView setContentMode:4];
    [(UIImageView *)v4->_imageView setTranslatesAutoresizingMaskIntoConstraints:0];
    v8 = [(SFUnifiedBarItemView *)v4 contentView];
    [v8 addSubview:v4->_imageView];
    v9 = [(UIImageView *)v4->_imageView leadingAnchor];
    v10 = [v8 leadingAnchor];
    uint64_t v11 = [v9 constraintEqualToAnchor:v10];
    imageViewLeadingConstraint = v4->_imageViewLeadingConstraint;
    v4->_imageViewLeadingConstraint = (NSLayoutConstraint *)v11;

    v24 = (void *)MEMORY[0x1E4F28DC8];
    v31[0] = v4->_imageViewLeadingConstraint;
    v26 = [(UIImageView *)v4->_imageView topAnchor];
    v25 = [v8 topAnchor];
    v13 = [v26 constraintEqualToAnchor:v25];
    v31[1] = v13;
    v14 = [v8 trailingAnchor];
    v15 = [(UIImageView *)v4->_imageView trailingAnchor];
    v16 = [v14 constraintEqualToAnchor:v15];
    v31[2] = v16;
    v17 = [v8 bottomAnchor];
    v18 = [(UIImageView *)v4->_imageView bottomAnchor];
    v19 = [v17 constraintEqualToAnchor:v18];
    v31[3] = v19;
    v20 = [MEMORY[0x1E4F1C978] arrayWithObjects:v31 count:4];
    [v24 activateConstraints:v20];

    v21 = (void *)[objc_alloc(MEMORY[0x1E4FB1AC8]) initWithDelegate:v4];
    [(SFUnifiedBarButtonView *)v4 addInteraction:v21];
    objc_initWeak(&location, v4);
    v27[0] = MEMORY[0x1E4F143A8];
    v27[1] = 3221225472;
    v27[2] = __40__SFUnifiedBarButtonView_initWithFrame___block_invoke;
    v27[3] = &unk_1E54EB370;
    objc_copyWeak(&v28, &location);
    [(SFUnifiedBarButtonView *)v4 setPointerStyleProvider:v27];
    [(SFUnifiedBarButtonView *)v4 updateTitleFont];
    v22 = v4;
    objc_destroyWeak(&v28);
    objc_destroyWeak(&location);
  }
  return v4;
}

id __40__SFUnifiedBarButtonView_initWithFrame___block_invoke(uint64_t a1, void *a2, void *a3, void *a4)
{
  id v7 = a2;
  id v8 = a3;
  id v9 = a4;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  uint64_t v11 = [WeakRetained platterStyle];

  if (v11)
  {
    v12 = (void *)[objc_alloc(MEMORY[0x1E4FB1D48]) initWithView:v7];
    v13 = [MEMORY[0x1E4FB1AD0] effectWithPreview:v12];
    v14 = [MEMORY[0x1E4FB1AE8] styleWithEffect:v13 shape:v9];
  }
  else
  {
    v12 = objc_msgSend(MEMORY[0x1E4FB1AE0], "sf_shapeForToolbarButton:", v7);
    v14 = [MEMORY[0x1E4FB1AE8] styleWithEffect:v8 shape:v12];
  }

  return v14;
}

- (void)traitCollectionDidChange:(id)a3
{
  v13.receiver = self;
  v13.super_class = (Class)SFUnifiedBarButtonView;
  id v4 = a3;
  [(SFUnifiedBarButtonView *)&v13 traitCollectionDidChange:v4];
  v5 = objc_msgSend(v4, "preferredContentSizeCategory", v13.receiver, v13.super_class);

  _SFToolbarContentSizeCategoryForPreferredCategory(v5);
  v6 = (NSString *)objc_claimAutoreleasedReturnValue();

  id v7 = [(SFUnifiedBarButtonView *)self traitCollection];
  id v8 = [v7 preferredContentSizeCategory];
  _SFToolbarContentSizeCategoryForPreferredCategory(v8);
  id v9 = (NSString *)objc_claimAutoreleasedReturnValue();

  v10 = [(SFUnifiedBarButtonView *)self _titleView];
  uint64_t v11 = [v10 text];
  if ([v11 length])
  {
    NSComparisonResult v12 = UIContentSizeCategoryCompareToCategory(v6, v9);

    if (v12) {
      [(SFUnifiedBarButtonView *)self updateTitleFont];
    }
  }
  else
  {
  }
}

- (void)updateTitleFont
{
  v3 = (void *)MEMORY[0x1E4FB1E20];
  id v4 = [(SFUnifiedBarButtonView *)self traitCollection];
  v5 = [v4 preferredContentSizeCategory];
  v6 = _SFToolbarContentSizeCategoryForPreferredCategory(v5);
  id v9 = [v3 traitCollectionWithPreferredContentSizeCategory:v6];

  id v7 = [(SFUnifiedBarButtonView *)self _titleView];
  id v8 = objc_msgSend(MEMORY[0x1E4FB08E0], "_sf_preferredFontForTextStyle:weight:compatibleWithTraitCollection:", *MEMORY[0x1E4FB2950], v9, *MEMORY[0x1E4FB09B8]);
  [v7 setFont:v8];

  [v7 setLineBreakMode:4];
}

- (UIImage)image
{
  return [(UIImageView *)self->_imageView image];
}

- (void)setImage:(id)a3
{
}

- (void)setEnabled:(BOOL)a3
{
  BOOL v3 = a3;
  if ([(SFUnifiedBarButtonView *)self isEnabled] != a3)
  {
    v5.receiver = self;
    v5.super_class = (Class)SFUnifiedBarButtonView;
    [(SFUnifiedBarButtonView *)&v5 setEnabled:v3];
    [(SFUnifiedBarButtonView *)self tintColorDidChange];
  }
}

- (BOOL)shouldTrailingAlignImage
{
  return ![(NSLayoutConstraint *)self->_imageViewLeadingConstraint isActive];
}

- (void)setShouldTrailingAlignImage:(BOOL)a3
{
}

- (void)tintColorDidChange
{
  if ([(SFUnifiedBarButtonView *)self isEnabled]) {
    [(SFUnifiedBarButtonView *)self tintColor];
  }
  else {
  id v3 = [MEMORY[0x1E4FB1618] quaternaryLabelColor];
  }
  [(UIImageView *)self->_imageView setTintColor:v3];
  [(SFUnifiedBarButtonView *)self setTitleColor:v3 forState:0];
}

- (double)preferredWidth
{
  id v3 = [(UIImageView *)self->_imageView image];

  if (v3)
  {
    [(UIImageView *)self->_imageView intrinsicContentSize];
    return v4;
  }
  objc_super v5 = [(SFUnifiedBarButtonView *)self titleForState:0];
  if (v5)
  {
  }
  else
  {
    v6 = [(SFUnifiedBarButtonView *)self attributedTitleForState:0];

    if (!v6) {
      return 0.0;
    }
  }
  [(SFUnifiedBarButtonView *)self bounds];
  double v7 = 200.0;
  -[SFUnifiedBarButtonView sizeThatFits:](self, "sizeThatFits:", 200.0, v8);
  if (v9 < 200.0)
  {
    [(SFUnifiedBarButtonView *)self bounds];
    -[SFUnifiedBarButtonView sizeThatFits:](self, "sizeThatFits:", 200.0, v10);
    return v4;
  }
  return v7;
}

- (CGRect)_selectedIndicatorBounds
{
  id v3 = [(SFUnifiedBarButtonView *)self _titleView];
  double v4 = [v3 text];
  uint64_t v5 = [v4 length];

  if (v5)
  {
    v6 = [(SFUnifiedBarButtonView *)self titleLabel];
    [v6 frame];
    CGFloat v8 = v7;
    CGFloat v10 = v9;
    CGFloat v12 = v11;
    CGFloat v14 = v13;

    v28.origin.CGFloat x = v8;
    v28.origin.CGFloat y = v10;
    v28.size.CGFloat width = v12;
    v28.size.CGFloat height = v14;
    CGRect v29 = CGRectInset(v28, 6.0, 0.0);
    CGFloat x = v29.origin.x;
    CGFloat y = v29.origin.y;
    CGFloat width = v29.size.width;
    CGFloat height = v29.size.height;
  }
  else
  {
    v19 = [(SFUnifiedBarButtonView *)self imageView];
    [v19 frame];
    CGFloat x = v20;
    CGFloat y = v21;
    CGFloat width = v22;
    CGFloat height = v23;
  }
  double v24 = x;
  double v25 = y;
  double v26 = width;
  double v27 = height;
  result.size.CGFloat height = v27;
  result.size.CGFloat width = v26;
  result.origin.CGFloat y = v25;
  result.origin.CGFloat x = v24;
  return result;
}

- (CGRect)_hitRect
{
  [(SFUnifiedBarButtonView *)self bounds];
  CGFloat v4 = v3;
  CGFloat v6 = v5;
  CGFloat v8 = v7;
  CGFloat v10 = v9;
  double v11 = [(SFUnifiedBarItemView *)self barMetrics];
  [v11 minimumItemSpacing];
  CGFloat v13 = v12 * -0.5;
  v22.origin.CGFloat x = v4;
  v22.origin.CGFloat y = v6;
  v22.size.CGFloat width = v8;
  v22.size.CGFloat height = v10;
  CGRect v23 = CGRectInset(v22, v13, 0.0);
  CGFloat x = v23.origin.x;
  CGFloat y = v23.origin.y;
  CGFloat width = v23.size.width;
  CGFloat height = v23.size.height;

  double v18 = x;
  double v19 = y;
  double v20 = width;
  double v21 = height;
  result.size.CGFloat height = v21;
  result.size.CGFloat width = v20;
  result.origin.CGFloat y = v19;
  result.origin.CGFloat x = v18;
  return result;
}

- (BOOL)pointInside:(CGPoint)a3 withEvent:(id)a4
{
  CGFloat y = a3.y;
  CGFloat x = a3.x;
  [(SFUnifiedBarButtonView *)self _hitRect];
  CGFloat v10 = x;
  CGFloat v11 = y;

  return CGRectContainsPoint(*(CGRect *)&v6, *(CGPoint *)&v10);
}

- (id)pointerInteraction:(id)a3 regionForRequest:(id)a4 defaultRegion:(id)a5
{
  double v5 = (void *)MEMORY[0x1E4FB1AD8];
  [(SFUnifiedBarButtonView *)self _hitRect];

  return (id)objc_msgSend(v5, "regionWithRect:identifier:", @"UnifiedBarButton");
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_imageViewLeadingConstraint, 0);

  objc_storeStrong((id *)&self->_imageView, 0);
}

@end