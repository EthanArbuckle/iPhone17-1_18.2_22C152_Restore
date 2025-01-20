@interface MailActionCell
+ (NSString)reusableIdentifier;
+ (double)approximateHeightForAccessibilityContentSizeCategory;
+ (id)preferredFontForHorizontalTitle;
- (BOOL)isHorizontalActionCell;
- (BOOL)useActionSheetStyle;
- (MFCardAction)cardAction;
- (MFMessageDisplayMetrics)displayMetrics;
- (MailActionCell)initWithFrame:(CGRect)a3;
- (NSArray)dynamicConstraints;
- (UIImageView)imageView;
- (UIView)fillView;
- (UIVisualEffectView)visualEffectView;
- (_MailActionCellTitleLabel)titleLabel;
- (id)_temporaryTrimmingTitle:(id)a3;
- (void)_updateDynamicConstraints;
- (void)_updateFillView;
- (void)_updateImageViewSymbolConfiguration;
- (void)_updateImageViewTintColor;
- (void)_updateTitleLabelTextColor;
- (void)configureConstraints;
- (void)prepareForReuse;
- (void)setCardAction:(id)a3;
- (void)setDisplayMetrics:(id)a3;
- (void)setDynamicConstraints:(id)a3;
- (void)setFillView:(id)a3;
- (void)setHighlighted:(BOOL)a3;
- (void)setImageView:(id)a3;
- (void)setSelected:(BOOL)a3;
- (void)setTitleLabel:(id)a3;
- (void)setUseActionSheetStyle:(BOOL)a3;
- (void)setVisualEffectView:(id)a3;
- (void)traitCollectionDidChange:(id)a3;
@end

@implementation MailActionCell

+ (NSString)reusableIdentifier
{
  return (NSString *)@"MailActionCellIdentifier";
}

- (MailActionCell)initWithFrame:(CGRect)a3
{
  v21.receiver = self;
  v21.super_class = (Class)MailActionCell;
  v3 = -[MailActionCell initWithFrame:](&v21, "initWithFrame:", a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  v4 = v3;
  if (v3)
  {
    [(MailActionCell *)v3 setClipsToBounds:1];
    v5 = [(MailActionCell *)v4 contentView];
    v6 = [v5 superview];
    v7 = [v6 layer];
    [v7 setCornerRadius:10.0];

    v8 = [v5 superview];
    v9 = [v8 layer];
    [v9 setCornerCurve:kCACornerCurveContinuous];

    uint64_t v10 = objc_opt_new();
    displayMetrics = v4->_displayMetrics;
    v4->_displayMetrics = (MFMessageDisplayMetrics *)v10;

    v12 = +[UIBlurEffect effectWithStyle:18];
    v13 = +[UIVibrancyEffect _effectForBlurEffect:v12 vibrancyStyle:112];
    id v14 = [objc_alloc((Class)UIVisualEffectView) initWithEffect:v13];
    [v14 setTranslatesAutoresizingMaskIntoConstraints:0];
    v15 = +[UIColor whiteColor];
    v16 = [v14 contentView];
    [v16 setBackgroundColor:v15];

    [v14 setClipsToBounds:1];
    [(MailActionCell *)v4 setVisualEffectView:v14];
    [v5 addSubview:v14];
    [v14 mf_pinToView:v5 usingLayoutMargins:0];
    id v17 = objc_alloc_init((Class)UIView);
    [v17 setTranslatesAutoresizingMaskIntoConstraints:0];
    [v17 setClipsToBounds:1];
    [(MailActionCell *)v4 setFillView:v17];
    [(MailActionCell *)v4 _updateFillView];
    [v5 addSubview:v17];
    [v17 mf_pinToView:v5 usingLayoutMargins:0];
    v18 = [(MailActionCell *)v4 titleLabel];
    [(MailActionCell *)v4 _updateTitleLabelTextColor];
    if (v18) {
      [v5 addSubview:v18];
    }
    id v19 = objc_alloc_init((Class)UIImageView);
    [v19 setContentMode:4];
    [v19 setTranslatesAutoresizingMaskIntoConstraints:0];
    [v19 setContentMode:4];
    [(MailActionCell *)v4 setImageView:v19];
    [v5 addSubview:v19];
    [(MailActionCell *)v4 _updateImageViewSymbolConfiguration];
    [(MailActionCell *)v4 configureConstraints];
  }
  return v4;
}

- (void)configureConstraints
{
  id v26 = [(MailActionCell *)self contentView];
  v3 = +[NSMutableArray array];
  v4 = [(MailActionCell *)self titleLabel];
  v5 = v4;
  if (v4)
  {
    v6 = [v4 leadingAnchor];
    v7 = [v26 layoutMarginsGuide];
    v8 = [v7 leadingAnchor];
    v9 = [v6 constraintEqualToAnchor:v8 constant:8.0];
    [v3 addObject:v9];
  }
  [(MailActionCell *)self _updateDynamicConstraints];
  uint64_t v10 = [(MailActionCell *)self dynamicConstraints];
  [v3 addObjectsFromArray:v10];

  v11 = [(MailActionCell *)self imageView];
  v12 = v11;
  if (v5)
  {
    v13 = [v11 leadingAnchor];
    id v14 = [v5 trailingAnchor];
    v15 = [v13 constraintGreaterThanOrEqualToAnchor:v14 constant:16.0];
    [v3 addObject:v15];
  }
  v16 = [v12 centerXAnchor];
  id v17 = [v26 trailingAnchor];
  v18 = [v16 constraintEqualToAnchor:v17 constant:-28.0];
  [v3 addObject:v18];

  id v19 = [v12 centerYAnchor];
  v20 = [v26 centerYAnchor];
  objc_super v21 = [v19 constraintEqualToAnchor:v20];
  [v3 addObject:v21];

  v22 = [v12 widthAnchor];
  v23 = [v22 constraintEqualToConstant:40.0];
  [v3 addObject:v23];

  v24 = [v12 heightAnchor];
  v25 = [v24 constraintEqualToConstant:40.0];
  [v3 addObject:v25];

  +[NSLayoutConstraint activateConstraints:v3];
}

- (void)setCardAction:(id)a3
{
  id v12 = a3;
  if ((-[MFCardAction isEqual:](self->_cardAction, "isEqual:") & 1) == 0) {
    objc_storeStrong((id *)&self->_cardAction, a3);
  }
  if ([(MailActionCell *)self isHorizontalActionCell]) {
    [v12 shortTitle];
  }
  else {
  v5 = [v12 title];
  }
  v6 = [(MailActionCell *)self _temporaryTrimmingTitle:v5];
  v7 = [(MailActionCell *)self titleLabel];
  [v7 setText:v6];

  v8 = [v12 imageName];
  v9 = +[UIImage systemImageNamed:v8 withConfiguration:0];
  uint64_t v10 = [(MailActionCell *)self imageView];
  [v10 setImage:v9];

  [(MailActionCell *)self _updateImageViewTintColor];
  v11 = [v12 accessibilityIdentifer];
  [(MailActionCell *)self setAccessibilityIdentifier:v11];
}

- (id)_temporaryTrimmingTitle:(id)a3
{
  v3 = [a3 ef_stringByTrimmingWhitespaceAndNewlineCharacters];
  if ([v3 isEqualToString:@"Notify Me…"])
  {
    CFStringRef v4 = @"Notify Me of Replies";
  }
  else
  {
    if (![v3 isEqualToString:@"Move Message…"]) {
      goto LABEL_6;
    }
    CFStringRef v4 = @"Move Message";
  }

  v3 = (void *)v4;
LABEL_6:

  return v3;
}

- (void)prepareForReuse
{
  v9.receiver = self;
  v9.super_class = (Class)MailActionCell;
  [(MailActionCell *)&v9 prepareForReuse];
  v3 = [(MailActionCell *)self titleLabel];
  [v3 setText:0];

  CFStringRef v4 = [(MailActionCell *)self titleLabel];
  v5 = [v4 layer];
  [v5 setContents:0];

  v6 = [(MailActionCell *)self imageView];
  [v6 setImage:0];

  v7 = [(MailActionCell *)self imageView];
  v8 = [v7 layer];
  [v8 setContents:0];
}

- (void)setHighlighted:(BOOL)a3
{
  BOOL v3 = a3;
  if ([(MailActionCell *)self isHighlighted] != a3)
  {
    v5 = [(MailActionCell *)self titleLabel];
    v6 = [v5 layer];
    v7 = [v6 contents];

    v10.receiver = self;
    v10.super_class = (Class)MailActionCell;
    [(MailActionCell *)&v10 setHighlighted:v3];
    v8 = [(MailActionCell *)self titleLabel];
    objc_super v9 = [v8 layer];
    [v9 setContents:v7];

    [(MailActionCell *)self _updateFillView];
  }
}

- (void)setSelected:(BOOL)a3
{
  BOOL v3 = a3;
  if ([(MailActionCell *)self isSelected] != a3)
  {
    v5 = [(MailActionCell *)self titleLabel];
    v6 = [v5 layer];
    v7 = [v6 contents];

    v10.receiver = self;
    v10.super_class = (Class)MailActionCell;
    [(MailActionCell *)&v10 setSelected:v3];
    v8 = [(MailActionCell *)self titleLabel];
    objc_super v9 = [v8 layer];
    [v9 setContents:v7];
  }
}

- (void)traitCollectionDidChange:(id)a3
{
  id v4 = a3;
  v13.receiver = self;
  v13.super_class = (Class)MailActionCell;
  [(MailActionCell *)&v13 traitCollectionDidChange:v4];
  [(MailActionCell *)self _updateFillView];
  [(MailActionCell *)self _updateImageViewTintColor];
  [(MailActionCell *)self _updateImageViewSymbolConfiguration];
  [(MailActionCell *)self _updateTitleLabelTextColor];
  v5 = [(MailActionCell *)self dynamicConstraints];

  if (v5)
  {
    v6 = [v4 preferredContentSizeCategory];
    int IsAccessibilityCategory = UIContentSizeCategoryIsAccessibilityCategory(v6);

    v8 = [(MailActionCell *)self traitCollection];
    objc_super v9 = [v8 preferredContentSizeCategory];
    int v10 = UIContentSizeCategoryIsAccessibilityCategory(v9);

    if (IsAccessibilityCategory != v10)
    {
      v11 = [(MailActionCell *)self dynamicConstraints];
      +[NSLayoutConstraint deactivateConstraints:v11];

      [(MailActionCell *)self _updateDynamicConstraints];
      id v12 = [(MailActionCell *)self dynamicConstraints];
      +[NSLayoutConstraint activateConstraints:v12];
    }
  }
}

- (BOOL)isHorizontalActionCell
{
  return 0;
}

- (void)_updateDynamicConstraints
{
  id v18 = [(MailActionCell *)self titleLabel];
  if (v18)
  {
    BOOL v3 = +[NSMutableArray array];
    id v4 = [(MailActionCell *)self contentView];
    v5 = [(MailActionCell *)self traitCollection];
    v6 = [v5 preferredContentSizeCategory];
    BOOL IsAccessibilityCategory = UIContentSizeCategoryIsAccessibilityCategory(v6);

    if (IsAccessibilityCategory)
    {
      v8 = [v18 topAnchor];
      objc_super v9 = [v4 topAnchor];
      int v10 = [v8 constraintEqualToAnchor:v9 constant:15.0];
      [v3 addObject:v10];

      v11 = [v4 bottomAnchor];
      id v12 = [v18 bottomAnchor];
      objc_super v13 = [v11 constraintEqualToAnchor:v12 constant:15.0];
      [v3 addObject:v13];
    }
    else
    {
      v11 = [(MailActionCell *)self displayMetrics];
      id v14 = [v18 firstBaselineAnchor];
      v15 = [v4 topAnchor];
      [v11 topToFirstBaselineSpacingInMailActionCardVerticalGroup];
      v16 = [v14 constraintEqualToAnchor:v15];
      [v3 addObject:v16];

      id v12 = [v4 bottomAnchor];
      objc_super v13 = [v18 lastBaselineAnchor];
      [v11 bottomToLastBaselineInMailActionCardVerticalGroup];
      id v17 = [v12 constraintEqualToAnchor:v13];
      [v3 addObject:v17];
    }
    [(MailActionCell *)self setDynamicConstraints:v3];
  }
}

+ (id)preferredFontForHorizontalTitle
{
  return +[_MailActionCellTitleLabel preferredFontForHorizontalTitle];
}

+ (double)approximateHeightForAccessibilityContentSizeCategory
{
  id v4 = +[UIApplication sharedApplication];
  v5 = [v4 preferredContentSizeCategory];
  BOOL IsAccessibilityCategory = UIContentSizeCategoryIsAccessibilityCategory(v5);

  if (!IsAccessibilityCategory)
  {
    v11 = +[NSAssertionHandler currentHandler];
    [v11 handleFailureInMethod:a2 object:a1 file:@"MailActionCell.m" lineNumber:244 description:@"Unexpectedly attempted to calculate approximate height for non-accessibility text sizes"];
  }
  v7 = +[_MailActionCellTitleLabel preferredFontForDefaultTitle];
  [v7 lineHeight];
  double v9 = v8 + 30.0;

  return v9;
}

- (void)setUseActionSheetStyle:(BOOL)a3
{
  if (self->_useActionSheetStyle != a3)
  {
    BOOL v3 = a3;
    self->_useActionSheetStyle = a3;
    id v4 = [(MailActionCell *)self titleLabel];
    [v4 setUseActionSheetStyle:v3];
  }
}

- (_MailActionCellTitleLabel)titleLabel
{
  titleLabel = self->_titleLabel;
  if (!titleLabel)
  {
    id v4 = objc_alloc_init(_MailActionCellTitleLabel);
    v5 = +[UIColor clearColor];
    [(_MailActionCellTitleLabel *)v4 setBackgroundColor:v5];

    [(_MailActionCellTitleLabel *)v4 setTranslatesAutoresizingMaskIntoConstraints:0];
    [(_MailActionCellTitleLabel *)v4 setLineBreakMode:0];
    [(_MailActionCellTitleLabel *)v4 setNumberOfLines:0];
    [(_MailActionCellTitleLabel *)v4 setIsHorizontalTitle:[(MailActionCell *)self isHorizontalActionCell]];
    v6 = self->_titleLabel;
    self->_titleLabel = v4;

    titleLabel = self->_titleLabel;
  }

  return titleLabel;
}

- (void)_updateTitleLabelTextColor
{
  id v5 = [(MailActionCell *)self traitCollection];
  if ([v5 userInterfaceStyle] == (id)2) {
    +[UIColor systemWhiteColor];
  }
  else {
  BOOL v3 = +[UIColor systemBlueColor];
  }
  id v4 = [(MailActionCell *)self titleLabel];
  [v4 setTextColor:v3];
}

- (void)_updateImageViewSymbolConfiguration
{
  id v3 = [(MailActionCell *)self imageView];
  v2 = +[UIImage mf_symbolConfigurationForView:18];
  [v3 setPreferredSymbolConfiguration:v2];
}

- (void)_updateImageViewTintColor
{
  id v3 = [(MailActionCell *)self cardAction];
  id v8 = [v3 tintColor];

  if (v8)
  {
    int v4 = 0;
    id v5 = v8;
  }
  else
  {
    id v3 = [(MailActionCell *)self traitCollection];
    if ([v3 userInterfaceStyle] == (id)1)
    {
      int v4 = 0;
      id v5 = 0;
    }
    else
    {
      id v5 = +[UIColor systemWhiteColor];
      int v4 = 1;
    }
  }
  v6 = [(MailActionCell *)self imageView];
  [v6 setTintColor:v5];

  if (v4) {
  v7 = v8;
  }
  if (!v8)
  {

    v7 = 0;
  }
}

- (void)_updateFillView
{
  id v9 = [(MailActionCell *)self fillView];
  if ([(MailActionCell *)self isHighlighted])
  {
    id v3 = +[UIColor tableCellDefaultSelectionTintColor];
    int v4 = [v3 colorWithAlphaComponent:0.6];
    [v9 setBackgroundColor:v4];

    [v9 setAlpha:1.0];
  }
  else
  {
    id v5 = +[UIColor blackColor];
    [v9 setBackgroundColor:v5];

    v6 = [(MailActionCell *)self traitCollection];
    id v7 = [v6 userInterfaceStyle];
    double v8 = 0.27;
    if (v7 != (id)2) {
      double v8 = 0.0;
    }
    [v9 setAlpha:v8];
  }
}

- (MFCardAction)cardAction
{
  return self->_cardAction;
}

- (BOOL)useActionSheetStyle
{
  return self->_useActionSheetStyle;
}

- (UIVisualEffectView)visualEffectView
{
  return self->_visualEffectView;
}

- (void)setVisualEffectView:(id)a3
{
}

- (UIView)fillView
{
  return self->_fillView;
}

- (void)setFillView:(id)a3
{
}

- (void)setTitleLabel:(id)a3
{
}

- (UIImageView)imageView
{
  return self->_imageView;
}

- (void)setImageView:(id)a3
{
}

- (NSArray)dynamicConstraints
{
  return self->_dynamicConstraints;
}

- (void)setDynamicConstraints:(id)a3
{
}

- (MFMessageDisplayMetrics)displayMetrics
{
  return self->_displayMetrics;
}

- (void)setDisplayMetrics:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_displayMetrics, 0);
  objc_storeStrong((id *)&self->_dynamicConstraints, 0);
  objc_storeStrong((id *)&self->_imageView, 0);
  objc_storeStrong((id *)&self->_titleLabel, 0);
  objc_storeStrong((id *)&self->_fillView, 0);
  objc_storeStrong((id *)&self->_visualEffectView, 0);

  objc_storeStrong((id *)&self->_cardAction, 0);
}

@end