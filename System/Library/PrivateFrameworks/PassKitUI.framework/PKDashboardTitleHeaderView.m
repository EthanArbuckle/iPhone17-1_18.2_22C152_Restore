@interface PKDashboardTitleHeaderView
+ (double)defaultHorizontalInset;
+ (double)defaultTableHorizontalInset;
- (BOOL)preferBaselineAlignment;
- (BOOL)preferTitleWrapOverStackedLayout;
- (BOOL)shouldShowActionButton;
- (BOOL)useActionInsets;
- (BOOL)useCompactTopInset;
- (BOOL)useLargeBottomInset;
- (CGSize)_layoutWithBounds:(CGRect)a3 isTemplate:(BOOL)a4;
- (CGSize)sizeThatFits:(CGSize)a3;
- (NSString)actionTitle;
- (NSString)title;
- (PKDashboardTitleHeaderView)initWithFrame:(CGRect)a3;
- (UIColor)actionColor;
- (UIColor)titleColor;
- (UIImage)actionImage;
- (UIMenu)menu;
- (double)topPadding;
- (id)action;
- (unint64_t)actionStyle;
- (unint64_t)titleStyle;
- (void)_buttonPressed:(id)a3;
- (void)_resetButtonInsets;
- (void)createSubviews;
- (void)layoutSubviews;
- (void)prepareForReuse;
- (void)resetFonts;
- (void)resetTitleColor;
- (void)setAction:(id)a3;
- (void)setActionColor:(id)a3;
- (void)setActionImage:(id)a3;
- (void)setActionStyle:(unint64_t)a3;
- (void)setActionTitle:(id)a3;
- (void)setMenu:(id)a3;
- (void)setPreferBaselineAlignment:(BOOL)a3;
- (void)setPreferTitleWrapOverStackedLayout:(BOOL)a3;
- (void)setTitle:(id)a3;
- (void)setTitleColor:(id)a3;
- (void)setTitleStyle:(unint64_t)a3;
- (void)setTopPadding:(double)a3;
- (void)setUseActionInsets:(BOOL)a3;
- (void)setUseCompactTopInset:(BOOL)a3;
- (void)setUseLargeBottomInset:(BOOL)a3;
- (void)traitCollectionDidChange:(id)a3;
@end

@implementation PKDashboardTitleHeaderView

+ (double)defaultHorizontalInset
{
  return 2.0;
}

+ (double)defaultTableHorizontalInset
{
  +[PKDashboardCollectionViewCell defaultHorizontalInset];
  return result;
}

- (PKDashboardTitleHeaderView)initWithFrame:(CGRect)a3
{
  v5.receiver = self;
  v5.super_class = (Class)PKDashboardTitleHeaderView;
  v3 = -[PKDashboardCollectionViewCell initWithFrame:](&v5, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  if (v3)
  {
    v3->_isCompactUI = PKUIGetMinScreenWidthType() == 0;
    [(PKDashboardTitleHeaderView *)v3 createSubviews];
    [(PKDashboardCollectionViewCell *)v3 setWantsCustomAppearance:1];
    [(PKDashboardTitleHeaderView *)v3 setAccessibilityIdentifier:*MEMORY[0x1E4F85430]];
  }
  return v3;
}

- (void)prepareForReuse
{
  v3.receiver = self;
  v3.super_class = (Class)PKDashboardTitleHeaderView;
  [(PKDashboardCollectionViewCell *)&v3 prepareForReuse];
  [(PKDashboardTitleHeaderView *)self setTitleStyle:0];
  [(PKDashboardTitleHeaderView *)self setTitle:0];
  [(PKDashboardTitleHeaderView *)self setTitleColor:0];
  [(PKDashboardTitleHeaderView *)self setActionTitle:0];
  [(PKDashboardTitleHeaderView *)self setActionImage:0];
  [(PKDashboardTitleHeaderView *)self setAction:0];
  [(PKDashboardTitleHeaderView *)self setMenu:0];
  [(PKDashboardTitleHeaderView *)self setTopPadding:0.0];
  [(UIButton *)self->_actionButton setHidden:[(PKDashboardTitleHeaderView *)self shouldShowActionButton] ^ 1];
  [(UIButton *)self->_actionButton setMenu:0];
  [(PKDashboardTitleHeaderView *)self setAlpha:1.0];
}

- (BOOL)shouldShowActionButton
{
  return self->_actionTitle || self->_actionImage != 0;
}

- (void)createSubviews
{
  objc_super v3 = (UILabel *)objc_alloc_init(MEMORY[0x1E4FB1930]);
  titleLabel = self->_titleLabel;
  self->_titleLabel = v3;

  [(UILabel *)self->_titleLabel setAccessibilityIdentifier:*MEMORY[0x1E4F85AB8]];
  [(PKDashboardTitleHeaderView *)self addSubview:self->_titleLabel];
  objc_initWeak(&location, self);
  objc_super v5 = (void *)MEMORY[0x1E4FB13F0];
  uint64_t v15 = MEMORY[0x1E4F143A8];
  uint64_t v16 = 3221225472;
  v17 = __44__PKDashboardTitleHeaderView_createSubviews__block_invoke;
  v18 = &unk_1E59CBEE0;
  objc_copyWeak(&v19, &location);
  v6 = [v5 actionWithHandler:&v15];
  v7 = objc_msgSend(MEMORY[0x1E4FB14D8], "plainButtonConfiguration", v15, v16, v17, v18);
  v8 = [(PKDashboardTitleHeaderView *)self traitCollection];
  v9 = [v8 preferredContentSizeCategory];
  BOOL IsAccessibilityCategory = UIContentSizeCategoryIsAccessibilityCategory(v9);

  if (IsAccessibilityCategory) {
    uint64_t v11 = 2;
  }
  else {
    uint64_t v11 = 8;
  }
  [v7 setImagePlacement:v11];
  v12 = [MEMORY[0x1E4FB14D0] buttonWithConfiguration:v7 primaryAction:v6];
  actionButton = self->_actionButton;
  self->_actionButton = v12;

  v14 = [(UIButton *)self->_actionButton titleLabel];
  [v14 setLineBreakMode:4];

  [(UIButton *)self->_actionButton setAccessibilityIdentifier:*MEMORY[0x1E4F851B0]];
  [(PKDashboardTitleHeaderView *)self addSubview:self->_actionButton];
  [(PKDashboardTitleHeaderView *)self _resetButtonInsets];
  [(PKDashboardTitleHeaderView *)self resetFonts];
  [(PKDashboardTitleHeaderView *)self setAccessibilityIdentifier:*MEMORY[0x1E4F855D8]];

  objc_destroyWeak(&v19);
  objc_destroyWeak(&location);
}

void __44__PKDashboardTitleHeaderView_createSubviews__block_invoke(uint64_t a1, void *a2)
{
  v2 = (id *)(a1 + 32);
  id v3 = a2;
  id WeakRetained = objc_loadWeakRetained(v2);
  v4 = [v3 sender];

  [WeakRetained _buttonPressed:v4];
}

- (void)resetFonts
{
  uint64_t v3 = PKUIGetMinScreenWidthType();
  id v18 = [MEMORY[0x1E4FB1948] extraProminentInsetGroupedHeaderConfiguration];
  actionButton = self->_actionButton;
  objc_super v5 = (NSString *)*MEMORY[0x1E4FB2950];
  if (v3) {
    v6 = (void *)*MEMORY[0x1E4FB28C8];
  }
  else {
    v6 = (void *)*MEMORY[0x1E4FB2950];
  }
  v7 = PKFontForDefaultDesign(v6, (void *)*MEMORY[0x1E4FB2788], 0x8000, 0);
  [(UIButton *)actionButton pkui_updateConfigurationWithFont:v7];

  switch(self->_titleStyle)
  {
    case 0uLL:
      titleLabel = self->_titleLabel;
      v9 = [v18 textProperties];
      v10 = [v9 font];
      [(UILabel *)titleLabel setFont:v10];

      [v18 directionalLayoutMargins];
      [(PKDashboardTitleHeaderView *)self setDirectionalLayoutMargins:"setDirectionalLayoutMargins:"];
      break;
    case 1uLL:
      uint64_t v11 = self->_titleLabel;
      v12 = (void *)*MEMORY[0x1E4FB2980];
      v13 = (void **)MEMORY[0x1E4FB2790];
      goto LABEL_10;
    case 2uLL:
      uint64_t v11 = self->_titleLabel;
      uint64_t v14 = [MEMORY[0x1E4FB1D30] _defaultFontForTableViewStyle:1 isSectionHeader:1];
      goto LABEL_13;
    case 3uLL:
      uint64_t v11 = self->_titleLabel;
      uint64_t v15 = (NSString *)*MEMORY[0x1E4FB28F0];
      uint64_t v16 = (NSString *)*MEMORY[0x1E4FB27D0];
      goto LABEL_12;
    case 4uLL:
      uint64_t v11 = self->_titleLabel;
      v12 = (void *)*MEMORY[0x1E4FB2908];
      v13 = (void **)MEMORY[0x1E4FB2798];
LABEL_10:
      uint64_t v14 = PKFontForDefaultDesign(v12, *v13, 2, 0);
      goto LABEL_13;
    case 5uLL:
      uint64_t v11 = self->_titleLabel;
      uint64_t v16 = (NSString *)*MEMORY[0x1E4FB27B8];
      uint64_t v15 = v5;
LABEL_12:
      uint64_t v14 = PKFontForDefaultDesign(v15, v16);
LABEL_13:
      v17 = (void *)v14;
      [(UILabel *)v11 setFont:v14];

      break;
    default:
      break;
  }
}

- (void)resetTitleColor
{
  unint64_t titleStyle = self->_titleStyle;
  if (titleStyle <= 5)
  {
    if (titleStyle == 3) {
      [MEMORY[0x1E4FB1D30] _defaultTextColorForTableViewStyle:0 isSectionHeader:1];
    }
    else {
    id v4 = [MEMORY[0x1E4FB1618] labelColor];
    }
    [(PKDashboardTitleHeaderView *)self setTitleColor:v4];
  }
}

- (void)_resetButtonInsets
{
  id v15 = [(UIButton *)self->_actionButton configuration];
  [v15 contentInsets];
  double v4 = v3;
  double v6 = v5;
  double v8 = v7;
  double v10 = v9;
  uint64_t v11 = [(PKDashboardTitleHeaderView *)self traitCollection];
  v12 = [v11 preferredContentSizeCategory];
  BOOL IsAccessibilityCategory = UIContentSizeCategoryIsAccessibilityCategory(v12);

  unint64_t actionStyle = self->_actionStyle;
  if (actionStyle - 1 >= 2)
  {
    if (!actionStyle && !self->_useActionInsets)
    {
      double v6 = 0.0;
      double v10 = 0.0;
    }
  }
  else
  {
    double v6 = (double)!IsAccessibilityCategory;
    if ((unint64_t)PKUIGetMinScreenWidthType() <= 4) {
      double v10 = 0.0;
    }
    else {
      double v10 = 2.0;
    }
  }
  objc_msgSend(v15, "setContentInsets:", v4, v6, v8, v10);
  [(UIButton *)self->_actionButton setConfiguration:v15];
}

- (void)layoutSubviews
{
  v3.receiver = self;
  v3.super_class = (Class)PKDashboardTitleHeaderView;
  [(PKDashboardCollectionViewCell *)&v3 layoutSubviews];
  [(PKDashboardTitleHeaderView *)self bounds];
  -[PKDashboardTitleHeaderView _layoutWithBounds:isTemplate:](self, "_layoutWithBounds:isTemplate:", 0);
}

- (CGSize)sizeThatFits:(CGSize)a3
{
  -[PKDashboardTitleHeaderView _layoutWithBounds:isTemplate:](self, "_layoutWithBounds:isTemplate:", 1, *MEMORY[0x1E4F1DAD8], *(double *)(MEMORY[0x1E4F1DAD8] + 8), a3.width, a3.height);
  result.height = v4;
  result.width = v3;
  return result;
}

- (CGSize)_layoutWithBounds:(CGRect)a3 isTemplate:(BOOL)a4
{
  double width = a3.size.width;
  CGFloat x = a3.origin.x;
  [(PKDashboardCollectionViewCell *)self horizontalInset];
  double v9 = v8;
  BOOL preferBaselineAlignment = self->_preferBaselineAlignment;
  double v11 = 0.0;
  if (!self->_isCompactUI)
  {
    double v12 = 15.0;
    if (!self->_preferBaselineAlignment) {
      double v12 = 9.0;
    }
    if (self->_useCompactTopInset) {
      double v11 = 4.0;
    }
    else {
      double v11 = v12;
    }
  }
  double topPadding = self->_topPadding;
  uint64_t v14 = [(PKDashboardTitleHeaderView *)self traitCollection];
  id v15 = [v14 preferredContentSizeCategory];
  BOOL IsAccessibilityCategory = UIContentSizeCategoryIsAccessibilityCategory(v15);

  int v17 = [(PKDashboardTitleHeaderView *)self _shouldReverseLayoutDirection];
  if ([(NSString *)self->_actionTitle length]) {
    BOOL v18 = 1;
  }
  else {
    BOOL v18 = self->_actionImage != 0;
  }
  double v19 = v11 + topPadding;
  NSUInteger v20 = [(NSString *)self->_actionTitle length];
  titleLabel = self->_titleLabel;
  if (!titleLabel
    || ([(UILabel *)titleLabel superview],
        v22 = objc_claimAutoreleasedReturnValue(),
        v22,
        !v22))
  {
    double v25 = v11 + topPadding;
    goto LABEL_16;
  }
  CGFloat v92 = x;
  double v23 = width + v9 * -2.0;
  BOOL v24 = !IsAccessibilityCategory && self->_titleStyle != 1 && !self->_preferTitleWrapOverStackedLayout;
  double v30 = *MEMORY[0x1E4F1DB30];
  double v29 = *(double *)(MEMORY[0x1E4F1DB30] + 8);
  [(UILabel *)self->_titleLabel setNumberOfLines:v24];
  -[UILabel sizeThatFits:](self->_titleLabel, "sizeThatFits:", v23, 1.79769313e308);
  if (v31 <= v23) {
    double v33 = v31;
  }
  else {
    double v33 = v23;
  }
  double v34 = v32;
  double v25 = v19 + v32;
  double v91 = v33;
  if (v18)
  {
    double v90 = width;
    -[UIButton sizeThatFits:](self->_actionButton, "sizeThatFits:", v23, 1.79769313e308);
    double v37 = v36;
    double v89 = v29;
    if (IsAccessibilityCategory)
    {
      double v29 = v35;
      double v38 = v30;
    }
    else
    {
      double v46 = v91 + 13.0;
      double v38 = v91 + 13.0 + v37;
      if (v38 <= v23 || (v38 = v30, double v29 = v35, self->_preferTitleWrapOverStackedLayout))
      {
        double v39 = v23 - v46;
        -[UIButton sizeThatFits:](self->_actionButton, "sizeThatFits:", v23 - v46, 1.79769313e308, v38, *(void *)&v89);
        double v37 = v47;
        double v29 = v48;
        -[UIButton sizeThatFits:](self->_actionButton, "sizeThatFits:", v23, 1.79769313e308);
        double v38 = v49;
        double v89 = v50;
        BOOL IsAccessibilityCategory = 0;
        if (v37 > v39) {
          double v37 = v39;
        }
LABEL_31:
        if (v38 > v37 && self->_preferTitleWrapOverStackedLayout)
        {
          double v40 = v25 - v34;
          if (v38 > v23) {
            double v38 = v23;
          }
          double v39 = v23 - (v38 + 13.0);
          double v41 = v38;
          -[UILabel sizeThatFits:](self->_titleLabel, "sizeThatFits:", v39, 1.79769313e308, *(void *)&v89);
          double v44 = v41;
          double v34 = v43;
          if (v42 > v39) {
            double v42 = v39;
          }
          double v91 = v42;
          double v25 = v40 + v43;
          double v29 = v89;
          double width = v90;
        }
        else
        {
          double v44 = v37;
          double width = v90;
        }
        double v45 = v92;
        if (a4) {
          goto LABEL_16;
        }
        goto LABEL_46;
      }
    }
LABEL_30:
    double v25 = v25 + v35;
    BOOL IsAccessibilityCategory = 1;
    double v39 = v23;
    goto LABEL_31;
  }
  if (IsAccessibilityCategory)
  {
    double v89 = v29;
    double v90 = width;
    double v35 = -0.0;
    double v38 = v30;
    double v37 = v30;
    goto LABEL_30;
  }
  double v51 = v23 - (v33 + 13.0);
  double v45 = v92;
  double v44 = v30;
  double v39 = v51;
  if (a4) {
    goto LABEL_16;
  }
LABEL_46:
  double v93 = v44;
  v52 = self->_titleLabel;
  [(PKDashboardCollectionViewCell *)self horizontalInset];
  if (v17) {
    double v53 = width - v53 - v91;
  }
  -[UILabel setFrame:](v52, "setFrame:", v45 + v53, v19, v91, v34);
  if (v18)
  {
    if (IsAccessibilityCategory)
    {
      actionButton = self->_actionButton;
      [(PKDashboardCollectionViewCell *)self horizontalInset];
      if (v17) {
        double v55 = width - v55 - v93;
      }
      double v56 = v45 + v55;
      v57 = actionButton;
      double v58 = v19 + v34;
    }
    else if (v39 <= 0.0)
    {
      v57 = self->_actionButton;
      double v56 = *MEMORY[0x1E4F1DB28];
      double v58 = *(double *)(MEMORY[0x1E4F1DB28] + 8);
    }
    else
    {
      if (v20)
      {
        [(UILabel *)self->_titleLabel frame];
        double MinY = CGRectGetMinY(v95);
        v60 = [(UILabel *)self->_titleLabel font];
        [v60 ascender];
        double v61 = v29;
        double v63 = MinY + v62;
        v64 = [(UIButton *)self->_actionButton titleLabel];
        v65 = [v64 font];

        [v65 ascender];
        double v67 = v66;
        v68 = [(UIButton *)self->_actionButton configuration];
        [v68 contentInsets];
        double v70 = v67 + v69;

        double v71 = v63 - v70;
        v72 = self->_actionButton;
        [(PKDashboardCollectionViewCell *)self horizontalInset];
        if (!v17) {
          double v73 = width - v73 - v93;
        }
        -[UIButton setFrame:](v72, "setFrame:", v45 + v73, v71, v93, v61);

        goto LABEL_16;
      }
      double v74 = v29;
      unint64_t actionStyle = self->_actionStyle;
      [(UILabel *)self->_titleLabel frame];
      double v77 = v76;
      [(UILabel *)self->_titleLabel frame];
      double v79 = v78;
      [(UILabel *)self->_titleLabel font];
      if (actionStyle == 2) {
        v80 = {;
      }
        [v80 lineHeight];
        double v82 = v77 + (v79 - v81) * 0.5;
        v83 = [(UILabel *)self->_titleLabel font];
        [v83 lineHeight];
      }
      else {
        v80 = {;
      }
        [v80 ascender];
        double v82 = v77 + v79 - v85;
        v83 = [(UILabel *)self->_titleLabel font];
        [v83 ascender];
      }
      double v86 = v82 + v84 * 0.5 - v74 * 0.5;

      v87 = self->_actionButton;
      [(PKDashboardCollectionViewCell *)self horizontalInset];
      if (!v17) {
        double v88 = width - v88 - v93;
      }
      double v56 = v45 + v88;
      v57 = v87;
      double v58 = v86;
    }
    -[UIButton setFrame:](v57, "setFrame:", v56, v58);
  }
LABEL_16:
  double v26 = 0.0;
  if (!preferBaselineAlignment) {
    double v26 = 6.0;
  }
  if (self->_useLargeBottomInset) {
    double v26 = 10.0;
  }
  double v27 = v25 + v26;
  double v28 = width;
  result.height = v27;
  result.double width = v28;
  return result;
}

- (void)traitCollectionDidChange:(id)a3
{
  id v4 = a3;
  v12.receiver = self;
  v12.super_class = (Class)PKDashboardTitleHeaderView;
  [(PKDashboardTitleHeaderView *)&v12 traitCollectionDidChange:v4];
  double v5 = [(PKDashboardTitleHeaderView *)self traitCollection];
  if (v4)
  {
    double v6 = [v4 preferredContentSizeCategory];
    double v7 = v6;
    if (v6 == (void *)*MEMORY[0x1E4FB27F0] || v5 == 0)
    {
    }
    else
    {
      double v9 = [v4 preferredContentSizeCategory];
      double v10 = [v5 preferredContentSizeCategory];
      NSComparisonResult v11 = UIContentSizeCategoryCompareToCategory(v9, v10);

      if (v11)
      {
        [(PKDashboardTitleHeaderView *)self _resetButtonInsets];
        [(PKDashboardTitleHeaderView *)self resetFonts];
      }
    }
  }
}

- (void)setTitle:(id)a3
{
  id v5 = a3;
  double v6 = self->_title;
  double v7 = (NSString *)v5;
  objc_super v12 = v7;
  if (v6 == v7)
  {

LABEL_12:
    double v9 = v12;
    goto LABEL_13;
  }
  if (!v7 || !v6)
  {

    goto LABEL_8;
  }
  BOOL v8 = [(NSString *)v6 isEqualToString:v7];

  double v9 = v12;
  if (!v8)
  {
LABEL_8:
    objc_storeStrong((id *)&self->_title, a3);
    titleLabel = self->_titleLabel;
    if (self->_titleStyle == 3)
    {
      NSComparisonResult v11 = [(NSString *)v12 uppercaseString];
      [(UILabel *)titleLabel setText:v11];
    }
    else
    {
      [(UILabel *)self->_titleLabel setText:v12];
    }
    [(UILabel *)self->_titleLabel setAccessibilityIdentifier:*MEMORY[0x1E4F85AB8]];
    [(PKDashboardTitleHeaderView *)self setNeedsLayout];
    goto LABEL_12;
  }
LABEL_13:
}

- (void)setTitleColor:(id)a3
{
}

- (void)setActionTitle:(id)a3
{
  id v5 = a3;
  actionTitle = self->_actionTitle;
  double v10 = (NSString *)v5;
  double v7 = actionTitle;
  if (v7 == v10)
  {

    goto LABEL_9;
  }
  if (!v10 || !v7)
  {

    goto LABEL_8;
  }
  BOOL v8 = [(NSString *)v10 isEqualToString:v7];

  if (!v8)
  {
LABEL_8:
    objc_storeStrong((id *)&self->_actionTitle, a3);
    actionImage = self->_actionImage;
    self->_actionImage = 0;

    [(UIButton *)self->_actionButton pkui_updateConfigurationWithTitle:self->_actionTitle];
    [(UIButton *)self->_actionButton setHidden:[(PKDashboardTitleHeaderView *)self shouldShowActionButton] ^ 1];
    [(PKDashboardTitleHeaderView *)self setNeedsLayout];
  }
LABEL_9:
}

- (void)setActionImage:(id)a3
{
  p_actionImage = &self->_actionImage;
  id v7 = a3;
  if ((PKEqualObjects() & 1) == 0)
  {
    objc_storeStrong((id *)&self->_actionImage, a3);
    actionTitle = self->_actionTitle;
    self->_actionTitle = 0;

    [(UIButton *)self->_actionButton pkui_updateConfigurationWithImage:*p_actionImage];
    [(UIButton *)self->_actionButton setHidden:[(PKDashboardTitleHeaderView *)self shouldShowActionButton] ^ 1];
    [(PKDashboardTitleHeaderView *)self setNeedsLayout];
  }
}

- (void)setTitleStyle:(unint64_t)a3
{
  if (self->_titleStyle != a3)
  {
    self->_unint64_t titleStyle = a3;
    titleLabel = self->_titleLabel;
    if (a3 == 3)
    {
      id v5 = [(NSString *)self->_title uppercaseString];
      [(UILabel *)titleLabel setText:v5];
    }
    else
    {
      [(UILabel *)self->_titleLabel setText:self->_title];
    }
    [(PKDashboardTitleHeaderView *)self resetTitleColor];
    [(PKDashboardTitleHeaderView *)self resetFonts];
    [(PKDashboardTitleHeaderView *)self setNeedsLayout];
  }
}

- (void)setActionColor:(id)a3
{
}

- (void)setTopPadding:(double)a3
{
  if (self->_topPadding != a3)
  {
    self->_double topPadding = a3;
    [(PKDashboardTitleHeaderView *)self setNeedsLayout];
  }
}

- (void)setActionStyle:(unint64_t)a3
{
  if (self->_actionStyle != a3)
  {
    self->_unint64_t actionStyle = a3;
    [(PKDashboardTitleHeaderView *)self _resetButtonInsets];
    [(PKDashboardTitleHeaderView *)self setNeedsLayout];
  }
}

- (void)setAction:(id)a3
{
  id v4 = _Block_copy(a3);
  id action = self->_action;
  self->_id action = v4;

  actionButton = self->_actionButton;

  [(UIButton *)actionButton setShowsMenuAsPrimaryAction:0];
}

- (void)_buttonPressed:(id)a3
{
  id action = (void (**)(void))self->_action;
  if (action) {
    action[2]();
  }
}

- (void)setMenu:(id)a3
{
  p_menu = &self->_menu;
  id v6 = a3;
  if ((PKEqualObjects() & 1) == 0)
  {
    objc_storeStrong((id *)&self->_menu, a3);
    [(UIButton *)self->_actionButton setMenu:*p_menu];
    [(UIButton *)self->_actionButton setShowsMenuAsPrimaryAction:1];
  }
}

- (BOOL)useCompactTopInset
{
  return self->_useCompactTopInset;
}

- (void)setUseCompactTopInset:(BOOL)a3
{
  self->_useCompactTopInset = a3;
}

- (BOOL)useLargeBottomInset
{
  return self->_useLargeBottomInset;
}

- (void)setUseLargeBottomInset:(BOOL)a3
{
  self->_useLargeBottomInset = a3;
}

- (BOOL)useActionInsets
{
  return self->_useActionInsets;
}

- (void)setUseActionInsets:(BOOL)a3
{
  self->_useActionInsets = a3;
}

- (BOOL)preferBaselineAlignment
{
  return self->_preferBaselineAlignment;
}

- (void)setPreferBaselineAlignment:(BOOL)a3
{
  self->_BOOL preferBaselineAlignment = a3;
}

- (BOOL)preferTitleWrapOverStackedLayout
{
  return self->_preferTitleWrapOverStackedLayout;
}

- (void)setPreferTitleWrapOverStackedLayout:(BOOL)a3
{
  self->_preferTitleWrapOverStackedLayout = a3;
}

- (NSString)title
{
  return self->_title;
}

- (UIColor)titleColor
{
  return self->_titleColor;
}

- (unint64_t)titleStyle
{
  return self->_titleStyle;
}

- (double)topPadding
{
  return self->_topPadding;
}

- (NSString)actionTitle
{
  return self->_actionTitle;
}

- (UIImage)actionImage
{
  return self->_actionImage;
}

- (UIColor)actionColor
{
  return self->_actionColor;
}

- (unint64_t)actionStyle
{
  return self->_actionStyle;
}

- (id)action
{
  return self->_action;
}

- (UIMenu)menu
{
  return self->_menu;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_menu, 0);
  objc_storeStrong(&self->_action, 0);
  objc_storeStrong((id *)&self->_actionColor, 0);
  objc_storeStrong((id *)&self->_actionImage, 0);
  objc_storeStrong((id *)&self->_actionTitle, 0);
  objc_storeStrong((id *)&self->_titleColor, 0);
  objc_storeStrong((id *)&self->_title, 0);
  objc_storeStrong((id *)&self->_actionButton, 0);

  objc_storeStrong((id *)&self->_titleLabel, 0);
}

@end