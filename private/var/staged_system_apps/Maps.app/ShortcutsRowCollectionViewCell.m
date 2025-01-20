@interface ShortcutsRowCollectionViewCell
+ (BOOL)isSubtitleHidden;
+ (CGSize)cellSizeWithTraitCollection:(id)a3;
+ (NSString)cellReuseIdentifier;
+ (NSString)maximumContentSizeCategory;
+ (double)bottomMargin;
+ (double)imageSize;
+ (double)imageTopMargin;
+ (double)textHorizontalMargin;
+ (double)titleTopMargin;
+ (id)_effectiveTraitCollectionWithTraitCollection:(id)a3;
+ (id)subtitleFontWithTraitCollection:(id)a3;
+ (id)titleFontWithTraitCollection:(id)a3;
- (BOOL)shortcutsRowCellModelShouldFetchMissingImage:(id)a3;
- (ShortcutsRowCellModel)model;
- (ShortcutsRowCollectionViewCell)initWithFrame:(CGRect)a3;
- (void)_dynamicUserInterfaceTraitDidChange;
- (void)_updateConstraints;
- (void)_updateFonts;
- (void)_updateFromModel;
- (void)_updateHighlight;
- (void)_updateTextAlignment;
- (void)layoutSubviews;
- (void)setHighlighted:(BOOL)a3;
- (void)setModel:(id)a3;
- (void)setVibrant:(BOOL)a3;
- (void)traitCollectionDidChange:(id)a3;
@end

@implementation ShortcutsRowCollectionViewCell

- (void)layoutSubviews
{
  v13.receiver = self;
  v13.super_class = (Class)ShortcutsRowCollectionViewCell;
  [(ShortcutsRowCollectionViewCell *)&v13 layoutSubviews];
  v3 = [(ShortcutsRowCollectionViewCell *)self traitCollection];
  v4 = [v3 preferredContentSizeCategory];
  BOOL IsAccessibilityCategory = UIContentSizeCategoryIsAccessibilityCategory(v4);

  highlightLayer = self->_highlightLayer;
  if (IsAccessibilityCategory)
  {
    -[CAShapeLayer setAnchorPoint:](highlightLayer, "setAnchorPoint:", 0.0, 0.5);
    v7 = [(ShortcutsRowCollectionViewCell *)self contentView];
    [v7 bounds];
    double MidY = CGRectGetMidY(v14);
    v9 = self->_highlightLayer;
    double v10 = 0.0;
  }
  else
  {
    -[CAShapeLayer setAnchorPoint:](highlightLayer, "setAnchorPoint:", 0.5, 0.0);
    v7 = [(ShortcutsRowCollectionViewCell *)self contentView];
    [v7 bounds];
    CGFloat MidX = CGRectGetMidX(v15);
    [(id)objc_opt_class() imageTopMargin];
    double MidY = v12;
    v9 = self->_highlightLayer;
    double v10 = MidX;
  }
  -[CAShapeLayer setPosition:](v9, "setPosition:", v10, MidY);
}

- (void)setModel:(id)a3
{
  v5 = (ShortcutsRowCellModel *)a3;
  v6 = v5;
  p_model = &self->_model;
  if (self->_model != v5)
  {
    v9 = v5;
    unsigned __int8 v8 = -[ShortcutsRowCellModel isEqual:](v5, "isEqual:");
    v6 = v9;
    if ((v8 & 1) == 0)
    {
      [(ShortcutsRowCellModel *)*p_model removeObserver:self];
      objc_storeStrong((id *)&self->_model, a3);
      [(ShortcutsRowCellModel *)*p_model addObserver:self];
      [(ShortcutsRowCollectionViewCell *)self _updateFromModel];
      v6 = v9;
    }
  }
}

- (void)_updateFromModel
{
  v3 = [(ShortcutsRowCellModel *)self->_model title];
  [(UILabel *)self->_titleLabel setText:v3];

  v4 = [(ShortcutsRowCellModel *)self->_model subtitle];
  [(UILabel *)self->_subtitleLabel setText:v4];

  v5 = [(ShortcutsRowCellModel *)self->_model subtitleColor];
  [(UILabel *)self->_subtitleLabel setTextColor:v5];

  [(UIImageView *)self->_imageView setContentMode:[(ShortcutsRowCellModel *)self->_model contentMode]];
  v6 = [(ShortcutsRowCellModel *)self->_model image];
  [(UIImageView *)self->_imageView setImage:v6];

  BOOL v7 = [(ShortcutsRowCellModel *)self->_model vibrantBackground];

  [(ShortcutsRowCollectionViewCell *)self setVibrant:v7];
}

- (ShortcutsRowCellModel)model
{
  return self->_model;
}

+ (NSString)cellReuseIdentifier
{
  v2 = (objc_class *)objc_opt_class();

  return NSStringFromClass(v2);
}

- (BOOL)shortcutsRowCellModelShouldFetchMissingImage:(id)a3
{
  v4 = [(ShortcutsRowCollectionViewCell *)self window];

  if (v4)
  {
    v5 = self;
    if (v5)
    {
      v6 = v5;
      do
      {
        unsigned __int8 v7 = [v6 isHidden];
        if (v7) {
          break;
        }
        uint64_t v8 = [v6 superview];

        v6 = (void *)v8;
      }
      while (v8);
      LOBYTE(v4) = v7 ^ 1;
    }
    else
    {
      LOBYTE(v4) = 1;
    }
  }
  return (char)v4;
}

- (void)setVibrant:(BOOL)a3
{
  if (self->_vibrant != a3)
  {
    self->_vibrant = a3;
    if (a3)
    {
      id v4 = [objc_alloc((Class)MKVibrantView) initWithFrame:0.0, 0.0, 60.0, 60.0];
      [v4 _setCornerRadius:30.0];
      [v4 setTranslatesAutoresizingMaskIntoConstraints:0];
      v5 = [(ShortcutsRowCollectionViewCell *)self contentView];
      [v5 insertSubview:v4 belowSubview:self->_imageView];

      vibrantView = self->_vibrantView;
      self->_vibrantView = (MKVibrantView *)v4;
      id v7 = v4;

      v20 = [v7 centerXAnchor];
      v19 = [(UIImageView *)self->_imageView centerXAnchor];
      v18 = [v20 constraintEqualToAnchor:v19];
      v21[0] = v18;
      uint64_t v8 = [v7 centerYAnchor];
      v9 = [(UIImageView *)self->_imageView centerYAnchor];
      double v10 = [v8 constraintEqualToAnchor:v9];
      v21[1] = v10;
      v11 = [v7 widthAnchor];
      double v12 = [v11 constraintEqualToConstant:60.0];
      v21[2] = v12;
      objc_super v13 = [v7 heightAnchor];
      CGRect v14 = [v7 widthAnchor];
      CGRect v15 = [v13 constraintEqualToAnchor:v14];
      v21[3] = v15;
      v16 = +[NSArray arrayWithObjects:v21 count:4];
      +[NSLayoutConstraint activateConstraints:v16];
    }
    else
    {
      [(MKVibrantView *)self->_vibrantView removeFromSuperview];
      v17 = self->_vibrantView;
      self->_vibrantView = 0;
    }
  }
}

- (ShortcutsRowCollectionViewCell)initWithFrame:(CGRect)a3
{
  v32.receiver = self;
  v32.super_class = (Class)ShortcutsRowCollectionViewCell;
  v3 = -[ShortcutsRowCollectionViewCell initWithFrame:](&v32, "initWithFrame:", a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  if (v3)
  {
    id v4 = (UIImageView *)objc_alloc_init((Class)UIImageView);
    imageView = v3->_imageView;
    v3->_imageView = v4;

    v6 = +[UIImageSymbolConfiguration configurationWithPointSize:6 weight:25.0];
    [(UIImageView *)v3->_imageView setPreferredSymbolConfiguration:v6];

    id v7 = +[UIColor clearColor];
    [(UIImageView *)v3->_imageView setBackgroundColor:v7];

    uint64_t v8 = [(ShortcutsRowCollectionViewCell *)v3 theme];
    v9 = [v8 keyColor];
    [(UIImageView *)v3->_imageView setTintColor:v9];

    [(id)objc_opt_class() imageSize];
    double v11 = v10 * 0.5;
    double v12 = [(UIImageView *)v3->_imageView layer];
    [v12 setCornerRadius:v11];

    [(UIImageView *)v3->_imageView setClipsToBounds:1];
    [(UIImageView *)v3->_imageView setAccessibilityIdentifier:@"ShortcutImage"];
    objc_super v13 = [(ShortcutsRowCollectionViewCell *)v3 contentView];
    [v13 addSubview:v3->_imageView];

    uint64_t v14 = +[CAShapeLayer layer];
    highlightLayer = v3->_highlightLayer;
    v3->_highlightLayer = (CAShapeLayer *)v14;

    id v16 = +[UIColor colorWithWhite:0.0 alpha:0.1];
    -[CAShapeLayer setFillColor:](v3->_highlightLayer, "setFillColor:", [v16 CGColor]);

    [(id)objc_opt_class() imageSize];
    double v18 = v17;
    [(id)objc_opt_class() imageSize];
    -[CAShapeLayer setFrame:](v3->_highlightLayer, "setFrame:", 0.0, 0.0, v18, v19);
    [(CAShapeLayer *)v3->_highlightLayer bounds];
    +[UIBezierPath bezierPathWithOvalInRect:](UIBezierPath, "bezierPathWithOvalInRect:");
    id v20 = objc_claimAutoreleasedReturnValue();
    -[CAShapeLayer setPath:](v3->_highlightLayer, "setPath:", [v20 CGPath]);

    v21 = [(ShortcutsRowCollectionViewCell *)v3 contentView];
    v22 = [v21 layer];
    [v22 addSublayer:v3->_highlightLayer];

    v23 = (UILabel *)objc_alloc_init((Class)UILabel);
    titleLabel = v3->_titleLabel;
    v3->_titleLabel = v23;

    v25 = +[UIColor labelColor];
    [(UILabel *)v3->_titleLabel setTextColor:v25];

    [(UILabel *)v3->_titleLabel setAllowsDefaultTighteningForTruncation:1];
    [(UILabel *)v3->_titleLabel setAccessibilityIdentifier:@"ShortcutTitle"];
    v26 = [(ShortcutsRowCollectionViewCell *)v3 contentView];
    [v26 addSubview:v3->_titleLabel];

    if (([(id)objc_opt_class() isSubtitleHidden] & 1) == 0)
    {
      v27 = (UILabel *)objc_alloc_init((Class)UILabel);
      subtitleLabel = v3->_subtitleLabel;
      v3->_subtitleLabel = v27;

      v29 = +[UIColor secondaryLabelColor];
      [(UILabel *)v3->_subtitleLabel setTextColor:v29];

      [(UILabel *)v3->_subtitleLabel setAdjustsFontSizeToFitWidth:1];
      [(UILabel *)v3->_subtitleLabel setMinimumScaleFactor:0.7];
      [(UILabel *)v3->_subtitleLabel setAccessibilityIdentifier:@"ShortcutSubtitle"];
      v30 = [(ShortcutsRowCollectionViewCell *)v3 contentView];
      [v30 addSubview:v3->_subtitleLabel];
    }
    [(ShortcutsRowCollectionViewCell *)v3 _updateConstraints];
    [(ShortcutsRowCollectionViewCell *)v3 _updateTextAlignment];
    [(ShortcutsRowCollectionViewCell *)v3 _updateFonts];
    [(ShortcutsRowCollectionViewCell *)v3 _updateHighlight];
  }
  return v3;
}

- (void)_updateTextAlignment
{
  v3 = [(ShortcutsRowCollectionViewCell *)self traitCollection];
  id v4 = [v3 preferredContentSizeCategory];
  BOOL IsAccessibilityCategory = UIContentSizeCategoryIsAccessibilityCategory(v4);

  if (IsAccessibilityCategory) {
    uint64_t v6 = 4;
  }
  else {
    uint64_t v6 = 1;
  }
  [(UILabel *)self->_titleLabel setTextAlignment:v6];
  subtitleLabel = self->_subtitleLabel;

  [(UILabel *)subtitleLabel setTextAlignment:v6];
}

- (void)_updateHighlight
{
  uint64_t v3 = [(ShortcutsRowCollectionViewCell *)self isHighlighted] ^ 1;
  highlightLayer = self->_highlightLayer;

  [(CAShapeLayer *)highlightLayer setHidden:v3];
}

- (void)_updateConstraints
{
  if (!self->_imageSizeLayout)
  {
    id v3 = objc_alloc((Class)MUSizeLayout);
    imageView = self->_imageView;
    [(id)objc_opt_class() imageSize];
    double v6 = v5;
    [(id)objc_opt_class() imageSize];
    uint64_t v8 = (MUSizeLayout *)[v3 initWithItem:imageView size:v6, v7];
    imageSizeLayout = self->_imageSizeLayout;
    self->_imageSizeLayout = v8;
  }
  id v10 = [objc_alloc((Class)MUCompositionalStackLayoutGroup) initWithIdentifier:@"labelGroup" axis:1];
  if ([(id)objc_opt_class() isSubtitleHidden])
  {
    titleLabel = self->_titleLabel;
    p_titleLabel = &titleLabel;
    uint64_t v12 = 1;
  }
  else
  {
    subtitleLabel = self->_subtitleLabel;
    v43[0] = self->_titleLabel;
    v43[1] = subtitleLabel;
    p_titleLabel = (UILabel **)v43;
    uint64_t v12 = 2;
  }
  uint64_t v14 = +[NSArray arrayWithObjects:p_titleLabel count:v12];
  [v10 setArrangedLayoutItems:v14];

  CGRect v15 = [(ShortcutsRowCollectionViewCell *)self traitCollection];
  id v16 = [v15 preferredContentSizeCategory];
  BOOL IsAccessibilityCategory = UIContentSizeCategoryIsAccessibilityCategory(v16);

  id v18 = objc_alloc((Class)MUCompositionalStackLayoutGroup);
  if (IsAccessibilityCategory)
  {
    id v19 = [v18 initWithIdentifier:@"contentGroup" axis:0];
    v42[0] = self->_imageView;
    v42[1] = v10;
    id v20 = +[NSArray arrayWithObjects:v42 count:2];
    [v19 setArrangedLayoutItems:v20];

    [v19 setAlignment:2];
    LODWORD(v21) = 1132003328;
    [v19 setAlignmentFittingSizePriority:v10 forArrangedLayoutItem:v21];
    double v22 = 0.0;
    double v23 = 12.0;
    double v24 = 10.0;
    v25 = v19;
  }
  else
  {
    id v19 = [v18 initWithIdentifier:@"contentGroup" axis:1];
    v41[0] = self->_imageView;
    v41[1] = v10;
    v26 = +[NSArray arrayWithObjects:v41 count:2];
    [v19 setArrangedLayoutItems:v26];

    [v19 setDistribution:2];
    LODWORD(v27) = 1132003328;
    [v19 setDistributionFittingSizePriority:v27];
    [v19 setAlignment:2 forArrangedLayoutItem:self->_imageView];
    [(id)objc_opt_class() imageTopMargin];
    [v19 setPadding:forArrangedLayoutItem:self->_imageView];
    [(id)objc_opt_class() titleTopMargin];
    double v29 = v28;
    [(id)objc_opt_class() textHorizontalMargin];
    double v31 = v30;
    [(id)objc_opt_class() textHorizontalMargin];
    double v24 = v32;
    v25 = v19;
    double v22 = v29;
    double v23 = v31;
  }
  [v25 setPadding:v10 forArrangedLayoutItem:v22, v23, 0.0, v24];
  contentStackLayout = self->_contentStackLayout;
  if (contentStackLayout)
  {
    [(MUCompositionalStackLayout *)contentStackLayout setGroup:v19];
  }
  else
  {
    id v34 = objc_alloc((Class)MUCompositionalStackLayout);
    v35 = [(ShortcutsRowCollectionViewCell *)self contentView];
    v36 = (MUCompositionalStackLayout *)[v34 initWithContainer:v35 group:v19];
    v37 = self->_contentStackLayout;
    self->_contentStackLayout = v36;
  }
  v38 = self->_contentStackLayout;
  v40[0] = self->_imageSizeLayout;
  v40[1] = v38;
  v39 = +[NSArray arrayWithObjects:v40 count:2];
  +[NSLayoutConstraint _mapsui_activateLayouts:v39];
}

+ (double)textHorizontalMargin
{
  return 4.0;
}

+ (CGSize)cellSizeWithTraitCollection:(id)a3
{
  id v4 = [a1 _effectiveTraitCollectionWithTraitCollection:a3];
  [v4 _maps_displayScaleOrMainScreenScale];
  double v6 = v5;
  double v7 = [a1 titleFontWithTraitCollection:v4];
  +[UILabel _maps_maximumHeightWithFont:v7 numberOfLines:1 displayScale:v6];
  double v9 = v8;
  if ([a1 isSubtitleHidden])
  {
    double v10 = v9 + 0.0;
  }
  else
  {
    double v11 = [a1 subtitleFontWithTraitCollection:v4];
    +[UILabel _maps_maximumHeightWithFont:v11 numberOfLines:1 displayScale:v6];
    double v10 = v9 + v12;
  }
  objc_super v13 = [v4 preferredContentSizeCategory];
  BOOL IsAccessibilityCategory = UIContentSizeCategoryIsAccessibilityCategory(v13);

  if (IsAccessibilityCategory)
  {
    +[UIFont _maps_bodyScaledValueForValue:v4 compatibleWithTraitCollection:142.350006];
    double v16 = v15;
    double v17 = v10 + 20.0;
  }
  else
  {
    [a1 imageSize];
    +[UIFont _maps_bodyScaledValueForValue:v4 compatibleWithTraitCollection:v18 + 26.0];
    double v16 = v19;
    [a1 imageTopMargin];
    double v21 = v20;
    [a1 imageSize];
    double v23 = v21 + v22;
    [a1 titleTopMargin];
    double v25 = v10 + v23 + v24;
    [a1 bottomMargin];
    double v17 = v26 + v25;
  }

  double v27 = v16;
  double v28 = v17;
  result.height = v28;
  result.width = v27;
  return result;
}

+ (double)imageSize
{
  return 60.0;
}

+ (BOOL)isSubtitleHidden
{
  return 0;
}

+ (double)imageTopMargin
{
  return 16.0;
}

+ (double)titleTopMargin
{
  return 7.0;
}

+ (id)titleFontWithTraitCollection:(id)a3
{
  return +[UIFont system15CompatibleWithTraitCollection:a3];
}

+ (id)subtitleFontWithTraitCollection:(id)a3
{
  return +[UIFont system13AdaptiveCompatibleWithTraitCollection:a3];
}

+ (id)_effectiveTraitCollectionWithTraitCollection:(id)a3
{
  id v4 = a3;
  double v5 = [a1 maximumContentSizeCategory];
  double v6 = [v4 _maps_traitCollectionByClampingContentSizeCategoryWithMinimumContentSizeCategory:0 maximumContentSizeCategory:v5];

  return v6;
}

+ (NSString)maximumContentSizeCategory
{
  return UIContentSizeCategoryAccessibilityExtraLarge;
}

+ (double)bottomMargin
{
  return 14.0;
}

- (void)traitCollectionDidChange:(id)a3
{
  id v4 = a3;
  v14.receiver = self;
  v14.super_class = (Class)ShortcutsRowCollectionViewCell;
  [(ShortcutsRowCollectionViewCell *)&v14 traitCollectionDidChange:v4];
  double v5 = [v4 preferredContentSizeCategory];
  int IsAccessibilityCategory = UIContentSizeCategoryIsAccessibilityCategory(v5);
  double v7 = [(ShortcutsRowCollectionViewCell *)self traitCollection];
  double v8 = [v7 preferredContentSizeCategory];
  int v9 = UIContentSizeCategoryIsAccessibilityCategory(v8);

  if (IsAccessibilityCategory != v9)
  {
    [(ShortcutsRowCollectionViewCell *)self _updateConstraints];
    [(ShortcutsRowCollectionViewCell *)self _updateTextAlignment];
  }
  double v10 = [(ShortcutsRowCollectionViewCell *)self traitCollection];
  double v11 = [v10 preferredContentSizeCategory];
  double v12 = [v4 preferredContentSizeCategory];
  uint64_t v13 = sub_1000E93B0(v11, v12);

  if (v13) {
    [(ShortcutsRowCollectionViewCell *)self _updateFonts];
  }
}

- (void)_updateFonts
{
  id v3 = objc_opt_class();
  id v4 = [(ShortcutsRowCollectionViewCell *)self traitCollection];
  id v7 = [v3 _effectiveTraitCollectionWithTraitCollection:v4];

  double v5 = [(id)objc_opt_class() titleFontWithTraitCollection:v7];
  [(UILabel *)self->_titleLabel setFont:v5];

  double v6 = [(id)objc_opt_class() subtitleFontWithTraitCollection:v7];
  [(UILabel *)self->_subtitleLabel setFont:v6];
}

- (void)_dynamicUserInterfaceTraitDidChange
{
}

- (void)setHighlighted:(BOOL)a3
{
  v4.receiver = self;
  v4.super_class = (Class)ShortcutsRowCollectionViewCell;
  [(ShortcutsRowCollectionViewCell *)&v4 setHighlighted:a3];
  [(ShortcutsRowCollectionViewCell *)self _updateHighlight];
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_model, 0);
  objc_storeStrong((id *)&self->_contentStackLayout, 0);
  objc_storeStrong((id *)&self->_imageSizeLayout, 0);
  objc_storeStrong((id *)&self->_vibrantView, 0);
  objc_storeStrong((id *)&self->_subtitleLabel, 0);
  objc_storeStrong((id *)&self->_titleLabel, 0);
  objc_storeStrong((id *)&self->_highlightLayer, 0);

  objc_storeStrong((id *)&self->_imageView, 0);
}

@end