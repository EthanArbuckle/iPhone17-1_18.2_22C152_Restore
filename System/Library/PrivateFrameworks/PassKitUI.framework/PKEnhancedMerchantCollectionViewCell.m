@interface PKEnhancedMerchantCollectionViewCell
- (PKAccountEnhancedMerchant)enhancedMerchant;
- (PKEnhancedMerchantCollectionViewCell)initWithFrame:(CGRect)a3;
- (UIImageView)imageView;
- (void)_commonInit;
- (void)_createHighlightFilterIfNecessary;
- (void)_updateFilter;
- (void)layoutSubviews;
- (void)prepareForReuse;
- (void)setHighlighted:(BOOL)a3;
- (void)setImageView:(id)a3;
- (void)setSelected:(BOOL)a3;
- (void)updateWithAccountEnhancedMerchant:(id)a3;
@end

@implementation PKEnhancedMerchantCollectionViewCell

- (PKEnhancedMerchantCollectionViewCell)initWithFrame:(CGRect)a3
{
  v6.receiver = self;
  v6.super_class = (Class)PKEnhancedMerchantCollectionViewCell;
  v3 = -[PKEnhancedMerchantCollectionViewCell initWithFrame:](&v6, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  v4 = v3;
  if (v3) {
    [(PKEnhancedMerchantCollectionViewCell *)v3 _commonInit];
  }
  return v4;
}

- (void)_commonInit
{
  v3 = (UIImageView *)[objc_alloc(MEMORY[0x1E4FB1838]) initWithImage:0];
  imageView = self->_imageView;
  self->_imageView = v3;

  [(UIImageView *)self->_imageView setContentMode:1];
  id v13 = [(PKEnhancedMerchantCollectionViewCell *)self layer];
  [v13 setCornerRadius:10.0];
  [v13 setCornerCurve:*MEMORY[0x1E4F39EA8]];
  v5 = [MEMORY[0x1E4FB1618] whiteColor];
  [(PKEnhancedMerchantCollectionViewCell *)self setBackgroundColor:v5];

  objc_super v6 = [(PKEnhancedMerchantCollectionViewCell *)self contentView];
  [v6 addSubview:self->_imageView];

  v7 = [MEMORY[0x1E4FB1618] colorWithWhite:1.0 alpha:1.0];
  normalInputColor = self->_normalInputColor;
  self->_normalInputColor = v7;

  v9 = [MEMORY[0x1E4FB1618] tableCellDefaultSelectionTintColor];
  v10 = [MEMORY[0x1E4FB1E20] traitCollectionWithUserInterfaceStyle:1];
  v11 = [v9 resolvedColorWithTraitCollection:v10];
  highlightInputColor = self->_highlightInputColor;
  self->_highlightInputColor = v11;

  self->_highlighted = 0;
  self->_selected = 0;
  [(PKEnhancedMerchantCollectionViewCell *)self setAccessibilityIdentifier:*MEMORY[0x1E4F854D8]];
}

- (void)_createHighlightFilterIfNecessary
{
  v8[1] = *MEMORY[0x1E4F143B8];
  if (!self->_highlightFilter)
  {
    id v3 = objc_alloc(MEMORY[0x1E4F39BC0]);
    v4 = (CAFilter *)[v3 initWithType:*MEMORY[0x1E4F3A2A8]];
    highlightFilter = self->_highlightFilter;
    self->_highlightFilter = v4;

    [(CAFilter *)self->_highlightFilter setName:@"highlightFilter"];
    [(CAFilter *)self->_highlightFilter setValue:[(UIColor *)self->_normalInputColor CGColor] forKey:@"inputColor"];
    objc_super v6 = [(PKEnhancedMerchantCollectionViewCell *)self layer];
    v8[0] = self->_highlightFilter;
    v7 = [MEMORY[0x1E4F1C978] arrayWithObjects:v8 count:1];
    [v6 setFilters:v7];

    objc_storeStrong((id *)&self->_appliedInputColor, self->_normalInputColor);
  }
}

- (void)updateWithAccountEnhancedMerchant:(id)a3
{
  id v6 = a3;
  objc_storeStrong((id *)&self->_enhancedMerchant, a3);
  v5 = v6;
  if (!v6)
  {
    [(UIImageView *)self->_imageView setImage:0];
    v5 = 0;
  }
}

- (void)prepareForReuse
{
  v3.receiver = self;
  v3.super_class = (Class)PKEnhancedMerchantCollectionViewCell;
  [(PKEnhancedMerchantCollectionViewCell *)&v3 prepareForReuse];
  [(PKEnhancedMerchantCollectionViewCell *)self updateWithAccountEnhancedMerchant:0];
}

- (void)layoutSubviews
{
  v16.receiver = self;
  v16.super_class = (Class)PKEnhancedMerchantCollectionViewCell;
  [(PKEnhancedMerchantCollectionViewCell *)&v16 layoutSubviews];
  [(PKEnhancedMerchantCollectionViewCell *)self bounds];
  CGRect v18 = CGRectInset(v17, 30.0, 30.0);
  double x = v18.origin.x;
  double y = v18.origin.y;
  double width = v18.size.width;
  double height = v18.size.height;
  v7 = [(PKEnhancedMerchantCollectionViewCell *)self contentView];
  -[PKEnhancedMerchantCollectionViewCell convertRect:toView:](self, "convertRect:toView:", v7, x, y, width, height);
  double v9 = v8;
  double v11 = v10;
  double v13 = v12;
  double v15 = v14;

  -[UIImageView setFrame:](self->_imageView, "setFrame:", v9, v11, v13, v15);
}

- (void)setHighlighted:(BOOL)a3
{
  BOOL v3 = a3;
  v5.receiver = self;
  v5.super_class = (Class)PKEnhancedMerchantCollectionViewCell;
  -[PKEnhancedMerchantCollectionViewCell setHighlighted:](&v5, sel_setHighlighted_);
  if (self->_highlighted != v3)
  {
    self->_highlighted = v3;
    [(PKEnhancedMerchantCollectionViewCell *)self _updateFilter];
  }
}

- (void)setSelected:(BOOL)a3
{
  BOOL v3 = a3;
  v5.receiver = self;
  v5.super_class = (Class)PKEnhancedMerchantCollectionViewCell;
  -[PKEnhancedMerchantCollectionViewCell setSelected:](&v5, sel_setSelected_);
  if (self->_selected != v3)
  {
    self->_selected = v3;
    [(PKEnhancedMerchantCollectionViewCell *)self _updateFilter];
  }
}

- (void)_updateFilter
{
  [(PKEnhancedMerchantCollectionViewCell *)self _createHighlightFilterIfNecessary];
  BOOL v3 = &OBJC_IVAR___PKEnhancedMerchantCollectionViewCell__highlightInputColor;
  if (!self->_highlighted)
  {
    BOOL v3 = &OBJC_IVAR___PKEnhancedMerchantCollectionViewCell__normalInputColor;
    if (self->_selected) {
      BOOL v3 = &OBJC_IVAR___PKEnhancedMerchantCollectionViewCell__highlightInputColor;
    }
  }
  p_appliedInputColor = &self->_appliedInputColor;
  id v17 = *(id *)((char *)&self->super.super.super.super.super.isa + *v3);
  if ((-[UIColor isEqual:](self->_appliedInputColor, "isEqual:") & 1) == 0)
  {
    objc_super v5 = (void *)MEMORY[0x1E4FB1618];
    id v6 = [(PKEnhancedMerchantCollectionViewCell *)self layer];
    v7 = [v6 presentationLayer];
    uint64_t v8 = [v7 valueForKeyPath:@"filters.highlightFilter.inputColor"];
    if (!v8) {
      uint64_t v8 = [(UIColor *)*p_appliedInputColor CGColor];
    }
    double v9 = [v5 colorWithCGColor:v8];

    double v10 = [(PKEnhancedMerchantCollectionViewCell *)self layer];
    id v11 = v17;
    objc_msgSend(v10, "setValue:forKeyPath:", objc_msgSend(v11, "CGColor"), @"filters.highlightFilter.inputColor");

    double v12 = [MEMORY[0x1E4F39B48] animationWithKeyPath:@"filters.highlightFilter.inputColor"];
    [v12 setAdditive:0];
    [v12 setDuration:0.15];
    id v13 = v9;
    objc_msgSend(v12, "setFromValue:", objc_msgSend(v13, "CGColor"));
    id v14 = v11;
    objc_msgSend(v12, "setToValue:", objc_msgSend(v14, "CGColor"));
    double v15 = [(PKEnhancedMerchantCollectionViewCell *)self layer];
    [v15 removeAnimationForKey:@"highlight"];

    objc_super v16 = [(PKEnhancedMerchantCollectionViewCell *)self layer];
    [v16 addAnimation:v12 forKey:@"highlight"];

    objc_storeStrong((id *)p_appliedInputColor, v14);
  }
}

- (PKAccountEnhancedMerchant)enhancedMerchant
{
  return self->_enhancedMerchant;
}

- (UIImageView)imageView
{
  return self->_imageView;
}

- (void)setImageView:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_imageView, 0);
  objc_storeStrong((id *)&self->_enhancedMerchant, 0);
  objc_storeStrong((id *)&self->_appliedInputColor, 0);
  objc_storeStrong((id *)&self->_highlightInputColor, 0);
  objc_storeStrong((id *)&self->_normalInputColor, 0);

  objc_storeStrong((id *)&self->_highlightFilter, 0);
}

@end