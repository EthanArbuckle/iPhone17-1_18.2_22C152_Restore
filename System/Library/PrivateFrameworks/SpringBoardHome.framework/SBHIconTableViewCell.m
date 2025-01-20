@interface SBHIconTableViewCell
+ (UIEdgeInsets)defaultTableViewCellSeparatorInsetsForIconImageInfo:(SBIconImageInfo *)a3;
+ (double)defaultTableViewCellHeightForIconImageInfo:(SBIconImageInfo *)a3;
+ (double)defaultTableViewCellHorizontalMargin;
- (BOOL)_setLabelAccessoryType:(int64_t)a3;
- (BOOL)_updateIconNameLabelForDisplayName:(id)a3 labelAccessoryType:(int64_t)a4;
- (CGSize)intrinsicContentSize;
- (NSArray)iconViewContainerViewConstraints;
- (NSString)iconDescription;
- (SBHIconTableViewCell)initWithStyle:(int64_t)a3 reuseIdentifier:(id)a4;
- (SBIcon)icon;
- (SBIconView)iconView;
- (UILabel)iconNameLabel;
- (UIView)iconViewContainerView;
- (UIView)labelContainerView;
- (_UILegibilitySettings)legibilitySettings;
- (void)_resetContent;
- (void)_resetIconView;
- (void)_teardownIconLabelAccessoryView;
- (void)_updateHighlightBackgroundView;
- (void)_updateTitleLabelFont;
- (void)configureCellForIcon:(id)a3;
- (void)prepareForReuse;
- (void)setHighlighted:(BOOL)a3;
- (void)setHighlighted:(BOOL)a3 animated:(BOOL)a4;
- (void)setIconView:(id)a3;
- (void)setIconViewContainerViewConstraints:(id)a3;
- (void)setLegibilitySettings:(id)a3;
@end

@implementation SBHIconTableViewCell

- (SBHIconTableViewCell)initWithStyle:(int64_t)a3 reuseIdentifier:(id)a4
{
  v85[3] = *MEMORY[0x1E4F143B8];
  v81.receiver = self;
  v81.super_class = (Class)SBHIconTableViewCell;
  v4 = [(SBHIconTableViewCell *)&v81 initWithStyle:a3 reuseIdentifier:a4];
  if (v4)
  {
    v5 = (UILabel *)objc_alloc_init(MEMORY[0x1E4FB1930]);
    iconNameLabel = v4->_iconNameLabel;
    v4->_iconNameLabel = v5;

    [(UILabel *)v4->_iconNameLabel setNumberOfLines:1];
    v7 = v4->_iconNameLabel;
    v8 = [MEMORY[0x1E4FB1618] whiteColor];
    [(UILabel *)v7 setTextColor:v8];

    LODWORD(v9) = 1148846080;
    [(UILabel *)v4->_iconNameLabel setContentCompressionResistancePriority:1 forAxis:v9];
    LODWORD(v10) = 1132068864;
    [(UILabel *)v4->_iconNameLabel setContentCompressionResistancePriority:0 forAxis:v10];
    v11 = (UIView *)objc_alloc_init(MEMORY[0x1E4FB1EB0]);
    iconViewContainerView = v4->_iconViewContainerView;
    v4->_iconViewContainerView = v11;

    v13 = (UIView *)objc_alloc_init(MEMORY[0x1E4FB1EB0]);
    labelContainerView = v4->_labelContainerView;
    v4->_labelContainerView = v13;

    double v15 = *MEMORY[0x1E4FB2848];
    double v16 = *(double *)(MEMORY[0x1E4FB2848] + 8);
    double v17 = *(double *)(MEMORY[0x1E4FB2848] + 16);
    double v18 = *(double *)(MEMORY[0x1E4FB2848] + 24);
    -[SBHIconTableViewCell setLayoutMargins:](v4, "setLayoutMargins:", *MEMORY[0x1E4FB2848], v16, v17, v18);
    [(SBHIconTableViewCell *)v4 setPreservesSuperviewLayoutMargins:1];
    v19 = [(SBHIconTableViewCell *)v4 contentView];
    objc_msgSend(v19, "setLayoutMargins:", v15, v16, v17, v18);
    [v19 setPreservesSuperviewLayoutMargins:1];
    v85[0] = v4->_iconNameLabel;
    v85[1] = v4->_iconViewContainerView;
    v85[2] = v4->_labelContainerView;
    [MEMORY[0x1E4F1C978] arrayWithObjects:v85 count:3];
    long long v77 = 0u;
    long long v78 = 0u;
    long long v79 = 0u;
    long long v80 = 0u;
    id v20 = (id)objc_claimAutoreleasedReturnValue();
    uint64_t v21 = [v20 countByEnumeratingWithState:&v77 objects:v84 count:16];
    if (v21)
    {
      uint64_t v22 = v21;
      uint64_t v23 = *(void *)v78;
      do
      {
        for (uint64_t i = 0; i != v22; ++i)
        {
          if (*(void *)v78 != v23) {
            objc_enumerationMutation(v20);
          }
          [*(id *)(*((void *)&v77 + 1) + 8 * i) setTranslatesAutoresizingMaskIntoConstraints:0];
        }
        uint64_t v22 = [v20 countByEnumeratingWithState:&v77 objects:v84 count:16];
      }
      while (v22);
    }

    [(UIView *)v4->_labelContainerView addSubview:v4->_iconNameLabel];
    [v19 addSubview:v4->_labelContainerView];
    [v19 addSubview:v4->_iconViewContainerView];
    v25 = [MEMORY[0x1E4FB1618] clearColor];
    [v19 setBackgroundColor:v25];

    v26 = [MEMORY[0x1E4FB1618] clearColor];
    [(SBHIconTableViewCell *)v4 setBackgroundColor:v26];

    id v27 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
    v28 = [(UIView *)v4->_iconViewContainerView leadingAnchor];
    v29 = [v19 layoutMarginsGuide];
    v30 = [v29 leadingAnchor];
    [v28 constraintEqualToAnchor:v30];
    v32 = v31 = v19;
    [v27 addObject:v32];

    v33 = [(UIView *)v4->_iconViewContainerView topAnchor];
    v34 = [v31 topAnchor];
    v35 = [v33 constraintGreaterThanOrEqualToAnchor:v34 constant:12.0];
    [v27 addObject:v35];

    v36 = [(UIView *)v4->_iconViewContainerView bottomAnchor];
    v37 = [v31 bottomAnchor];
    v38 = [v36 constraintLessThanOrEqualToAnchor:v37 constant:12.0];
    [v27 addObject:v38];

    v39 = [(UIView *)v4->_iconViewContainerView centerYAnchor];
    v40 = [v31 centerYAnchor];
    v41 = [v39 constraintEqualToAnchor:v40];
    [v27 addObject:v41];

    v42 = [(UIView *)v4->_labelContainerView leadingAnchor];
    v43 = [(UIView *)v4->_iconViewContainerView trailingAnchor];
    v44 = [v42 constraintEqualToAnchor:v43 constant:16.0];
    [v27 addObject:v44];

    v45 = [(UIView *)v4->_labelContainerView trailingAnchor];
    v46 = [v31 layoutMarginsGuide];
    v47 = [v46 trailingAnchor];
    v48 = [v45 constraintLessThanOrEqualToAnchor:v47 constant:-16.0];
    [v27 addObject:v48];

    v49 = [(UIView *)v4->_labelContainerView centerYAnchor];
    v50 = [(UIView *)v4->_iconViewContainerView centerYAnchor];
    v51 = [v49 constraintEqualToAnchor:v50];
    [v27 addObject:v51];

    v52 = [(UIView *)v4->_labelContainerView heightAnchor];
    v53 = [(UIView *)v4->_iconViewContainerView heightAnchor];
    v54 = [v52 constraintLessThanOrEqualToAnchor:v53 multiplier:1.0];
    [v27 addObject:v54];

    v55 = [(UIView *)v4->_labelContainerView heightAnchor];
    v56 = [(UILabel *)v4->_iconNameLabel heightAnchor];
    v57 = [v55 constraintEqualToAnchor:v56 multiplier:1.0];
    [v27 addObject:v57];

    v58 = [(UILabel *)v4->_iconNameLabel leadingAnchor];
    v59 = [(UIView *)v4->_labelContainerView leadingAnchor];
    v60 = [v58 constraintEqualToAnchor:v59];
    [v27 addObject:v60];

    v61 = [(UILabel *)v4->_iconNameLabel trailingAnchor];
    v62 = [(UIView *)v4->_labelContainerView trailingAnchor];
    v63 = [v61 constraintEqualToAnchor:v62];
    [v27 addObject:v63];

    v64 = [(UILabel *)v4->_iconNameLabel topAnchor];
    v65 = [(UIView *)v4->_labelContainerView topAnchor];
    v66 = [v64 constraintEqualToAnchor:v65];
    [v27 addObject:v66];

    uint64_t v67 = objc_opt_new();
    customSelectedBackgroundView = v4->_customSelectedBackgroundView;
    v4->_customSelectedBackgroundView = (UIView *)v67;

    [(UIView *)v4->_customSelectedBackgroundView setTranslatesAutoresizingMaskIntoConstraints:0];
    [(SBHIconTableViewCell *)v4 setSelectedBackgroundView:v4->_customSelectedBackgroundView];
    [(SBHIconTableViewCell *)v4 _updateHighlightBackgroundView];
    [(SBHIconTableViewCell *)v4 _updateTitleLabelFont];
    v69 = [(SBHIconTableViewCell *)v4 layer];
    [v69 setAllowsGroupBlending:0];

    [MEMORY[0x1E4F28DC8] activateConstraints:v27];
    v70 = self;
    v83 = v70;
    v71 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v83 count:1];
    id v72 = (id)[(SBHIconTableViewCell *)v4 registerForTraitChanges:v71 withAction:sel__updateHighlightBackgroundView];

    v73 = self;
    v82 = v73;
    v74 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v82 count:1];
    id v75 = (id)[(SBHIconTableViewCell *)v4 registerForTraitChanges:v74 withAction:sel__updateTitleLabelFont];
  }
  return v4;
}

- (void)prepareForReuse
{
  v3.receiver = self;
  v3.super_class = (Class)SBHIconTableViewCell;
  [(SBHIconTableViewCell *)&v3 prepareForReuse];
  [(SBHIconTableViewCell *)self _resetContent];
}

- (CGSize)intrinsicContentSize
{
  LODWORD(v2) = 1148846080;
  LODWORD(v3) = 1148846080;
  -[SBHIconTableViewCell systemLayoutSizeFittingSize:withHorizontalFittingPriority:verticalFittingPriority:](self, "systemLayoutSizeFittingSize:withHorizontalFittingPriority:verticalFittingPriority:", *MEMORY[0x1E4F1DB30], *(double *)(MEMORY[0x1E4F1DB30] + 8), v2, v3);
  result.height = v5;
  result.width = v4;
  return result;
}

- (void)_updateTitleLabelFont
{
  double v3 = [(SBHIconTableViewCell *)self traitCollection];
  double v4 = (void *)MEMORY[0x1E4FB1E20];
  double v5 = [v3 preferredContentSizeCategory];
  v6 = SBHContentSizeCategoryClip(v5, (void *)*MEMORY[0x1E4FB27E8], (void *)*MEMORY[0x1E4FB2780]);
  id v12 = [v4 traitCollectionWithPreferredContentSizeCategory:v6];

  iconNameLabel = self->_iconNameLabel;
  v8 = [MEMORY[0x1E4FB08E0] preferredFontForTextStyle:*MEMORY[0x1E4FB28C8] compatibleWithTraitCollection:v12];
  [(UILabel *)iconNameLabel setFont:v8];

  iconLabelAccessoryView = self->_iconLabelAccessoryView;
  legibilitySettings = self->_legibilitySettings;
  v11 = [(UILabel *)self->_iconNameLabel font];
  [(SBIconLabelAccessoryView *)iconLabelAccessoryView updateWithLegibilitySettings:legibilitySettings labelFont:v11];
}

- (void)_updateHighlightBackgroundView
{
  double v3 = [(SBHIconTableViewCell *)self traitCollection];
  uint64_t v4 = [v3 userInterfaceStyle];

  if (v4 == 1)
  {
    customSelectedBackgroundView = self->_customSelectedBackgroundView;
    double v10 = [MEMORY[0x1E4FB1618] colorWithRed:0.0900000036 green:0.0900000036 blue:0.0900000036 alpha:1.0];
    [(UIView *)customSelectedBackgroundView setBackgroundColor:v10];

    id v12 = [(UIView *)self->_customSelectedBackgroundView layer];
    v7 = (void *)MEMORY[0x1E4F39BC0];
    v8 = (void *)MEMORY[0x1E4F3A2E8];
  }
  else
  {
    if (v4 != 2) {
      return;
    }
    double v5 = self->_customSelectedBackgroundView;
    v6 = [MEMORY[0x1E4FB1618] colorWithRed:0.920000017 green:0.920000017 blue:0.920000017 alpha:1.0];
    [(UIView *)v5 setBackgroundColor:v6];

    id v12 = [(UIView *)self->_customSelectedBackgroundView layer];
    v7 = (void *)MEMORY[0x1E4F39BC0];
    v8 = (void *)MEMORY[0x1E4F3A2E0];
  }
  v11 = [v7 filterWithType:*v8];
  [v12 setCompositingFilter:v11];
}

- (void)setHighlighted:(BOOL)a3 animated:(BOOL)a4
{
  BOOL v4 = a3;
  v10.receiver = self;
  v10.super_class = (Class)SBHIconTableViewCell;
  [(SBHIconTableViewCell *)&v10 setHighlighted:a3 animated:a4];
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __48__SBHIconTableViewCell_setHighlighted_animated___block_invoke;
  v9[3] = &unk_1E6AAC810;
  v9[4] = self;
  [MEMORY[0x1E4FB1EB0] performWithoutAnimation:v9];
  v6 = [(SBHIconTableViewCell *)self selectedBackgroundView];
  v7 = [v6 superview];
  v8 = [v7 layer];
  [v8 setAllowsGroupBlending:!v4];
}

uint64_t __48__SBHIconTableViewCell_setHighlighted_animated___block_invoke(uint64_t a1)
{
  return [*(id *)(*(void *)(a1 + 32) + 1056) setHighlighted:0];
}

- (void)setHighlighted:(BOOL)a3
{
  BOOL v3 = a3;
  v9.receiver = self;
  v9.super_class = (Class)SBHIconTableViewCell;
  -[SBHIconTableViewCell setHighlighted:](&v9, sel_setHighlighted_);
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __39__SBHIconTableViewCell_setHighlighted___block_invoke;
  v8[3] = &unk_1E6AAC810;
  v8[4] = self;
  [MEMORY[0x1E4FB1EB0] performWithoutAnimation:v8];
  double v5 = [(SBHIconTableViewCell *)self selectedBackgroundView];
  v6 = [v5 superview];
  v7 = [v6 layer];
  [v7 setAllowsGroupBlending:!v3];
}

uint64_t __39__SBHIconTableViewCell_setHighlighted___block_invoke(uint64_t a1)
{
  return [*(id *)(*(void *)(a1 + 32) + 1056) setHighlighted:0];
}

- (void)setLegibilitySettings:(id)a3
{
  id v7 = a3;
  if ((-[_UILegibilitySettings isEqual:](self->_legibilitySettings, "isEqual:") & 1) == 0)
  {
    objc_storeStrong((id *)&self->_legibilitySettings, a3);
    [(SBIconView *)self->_iconView setLegibilitySettings:v7];
    iconLabelAccessoryView = self->_iconLabelAccessoryView;
    v6 = [(UILabel *)self->_iconNameLabel font];
    [(SBIconLabelAccessoryView *)iconLabelAccessoryView updateWithLegibilitySettings:v7 labelFont:v6];
  }
}

+ (double)defaultTableViewCellHorizontalMargin
{
  return 16.0;
}

+ (double)defaultTableViewCellHeightForIconImageInfo:(SBIconImageInfo *)a3
{
  +[SBIconView defaultIconViewSizeForIconImageSize:configurationOptions:](SBIconView, "defaultIconViewSizeForIconImageSize:configurationOptions:", 2);
  return v3 + 24.0;
}

+ (UIEdgeInsets)defaultTableViewCellSeparatorInsetsForIconImageInfo:(SBIconImageInfo *)a3
{
  double v4 = v3 + 16.0;
  double v5 = 0.0;
  double v6 = 0.0;
  double v7 = 30.0;
  result.right = v7;
  result.bottom = v6;
  result.left = v4;
  result.top = v5;
  return result;
}

- (void)setIconView:(id)a3
{
  v27[5] = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  p_iconView = (id *)&self->_iconView;
  if (([(SBIconView *)self->_iconView isEqual:v5] & 1) == 0)
  {
    [(SBHIconTableViewCell *)self _resetIconView];
    objc_storeStrong((id *)&self->_iconView, a3);
    id v7 = *p_iconView;
    v8 = [(SBHIconTableViewCell *)self legibilitySettings];
    [v7 setLegibilitySettings:v8];

    [*p_iconView setTranslatesAutoresizingMaskIntoConstraints:0];
    if (*p_iconView)
    {
      objc_super v9 = [(SBHIconTableViewCell *)self iconViewContainerView];
      [v5 sizeToFit];
      [v9 addSubview:v5];
      v26 = [v5 topAnchor];
      v25 = [v9 topAnchor];
      v24 = [v26 constraintEqualToAnchor:v25];
      v27[0] = v24;
      uint64_t v23 = [v5 bottomAnchor];
      uint64_t v22 = [v9 bottomAnchor];
      uint64_t v21 = [v23 constraintEqualToAnchor:v22];
      v27[1] = v21;
      id v20 = [v5 leadingAnchor];
      v19 = [v9 leadingAnchor];
      objc_super v10 = [v20 constraintEqualToAnchor:v19];
      v27[2] = v10;
      v11 = [v5 trailingAnchor];
      id v12 = [v9 trailingAnchor];
      v13 = [v11 constraintEqualToAnchor:v12];
      v27[3] = v13;
      v14 = [v9 widthAnchor];
      [v5 iconImageSize];
      double v15 = objc_msgSend(v14, "constraintEqualToConstant:");
      v27[4] = v15;
      double v16 = [MEMORY[0x1E4F1C978] arrayWithObjects:v27 count:5];
      [(SBHIconTableViewCell *)self setIconViewContainerViewConstraints:v16];

      double v17 = (void *)MEMORY[0x1E4F28DC8];
      double v18 = [(SBHIconTableViewCell *)self iconViewContainerViewConstraints];
      [v17 activateConstraints:v18];
    }
    [(SBHIconTableViewCell *)self invalidateIntrinsicContentSize];
  }
}

- (void)configureCellForIcon:(id)a3
{
  id v7 = a3;
  objc_storeStrong((id *)&self->_icon, a3);
  if (v7)
  {
    id v5 = [v7 displayName];
    BOOL v6 = -[SBHIconTableViewCell _updateIconNameLabelForDisplayName:labelAccessoryType:](self, "_updateIconNameLabelForDisplayName:labelAccessoryType:", v5, [v7 labelAccessoryType]);

    if (!v6) {
      goto LABEL_4;
    }
    goto LABEL_3;
  }
  if ([(SBHIconTableViewCell *)self _updateIconNameLabelForDisplayName:0 labelAccessoryType:0])
  {
LABEL_3:
    [(SBHIconTableViewCell *)self invalidateIntrinsicContentSize];
    [(SBHIconTableViewCell *)self setNeedsUpdateConstraints];
  }
LABEL_4:
}

- (void)_resetIconView
{
  [(SBHIconTableViewCell *)self _teardownIconLabelAccessoryView];
  self->_labelAccessoryType = 0;
  [(SBIconView *)self->_iconView setTranslatesAutoresizingMaskIntoConstraints:1];
  double v3 = [(SBIconView *)self->_iconView superview];
  double v4 = [(SBHIconTableViewCell *)self iconViewContainerView];

  if (v3 == v4) {
    [(SBIconView *)self->_iconView removeFromSuperview];
  }
  iconView = self->_iconView;
  self->_iconView = 0;

  icon = self->_icon;
  self->_icon = 0;

  id v10 = [(SBHIconTableViewCell *)self iconViewContainerView];
  id v7 = [v10 subviews];
  [v7 makeObjectsPerformSelector:sel_removeFromSuperview];

  v8 = (void *)MEMORY[0x1E4F28DC8];
  objc_super v9 = [(SBHIconTableViewCell *)self iconViewContainerViewConstraints];
  [v8 deactivateConstraints:v9];

  [(SBHIconTableViewCell *)self setIconViewContainerViewConstraints:0];
}

- (void)_resetContent
{
  double v3 = [(SBHIconTableViewCell *)self iconView];
  [v3 prepareForReuse];

  double v4 = [(SBHIconTableViewCell *)self iconNameLabel];
  [v4 setText:0];

  [(SBHIconTableViewCell *)self _teardownIconLabelAccessoryView];
  self->_labelAccessoryType = 0;
  icon = self->_icon;
  self->_icon = 0;
}

- (BOOL)_updateIconNameLabelForDisplayName:(id)a3 labelAccessoryType:(int64_t)a4
{
  id v6 = a3;
  id v7 = [(UILabel *)self->_iconNameLabel text];
  char v8 = BSEqualObjects();

  if ((v8 & 1) == 0)
  {
    [(UILabel *)self->_iconNameLabel setText:v6];
    [(UILabel *)self->_iconNameLabel invalidateIntrinsicContentSize];
  }
  char v9 = v8 ^ 1 | [(SBHIconTableViewCell *)self _setLabelAccessoryType:a4];

  return v9;
}

- (BOOL)_setLabelAccessoryType:(int64_t)a3
{
  if (a3 == 3) {
    int64_t v3 = 3;
  }
  else {
    int64_t v3 = 0;
  }
  int64_t labelAccessoryType = self->_labelAccessoryType;
  if (labelAccessoryType != v3)
  {
    self->_int64_t labelAccessoryType = v3;
    [(SBHIconTableViewCell *)self _teardownIconLabelAccessoryView];
    if (a3 == 3)
    {
      +[SBIconView defaultViewClassForLabelAccessoryType:3];
      id v7 = (SBIconLabelAccessoryView *)objc_opt_new();
      iconLabelAccessoryView = self->_iconLabelAccessoryView;
      self->_iconLabelAccessoryView = v7;

      char v9 = self->_iconLabelAccessoryView;
      legibilitySettings = self->_legibilitySettings;
      v11 = [(SBHIconTableViewCell *)self iconNameLabel];
      id v12 = [v11 font];
      [(SBIconLabelAccessoryView *)v9 updateWithLegibilitySettings:legibilitySettings labelFont:v12];

      [(SBIconLabelAccessoryView *)self->_iconLabelAccessoryView setTranslatesAutoresizingMaskIntoConstraints:0];
      v13 = [(SBHIconTableViewCell *)self contentView];
      [v13 addSubview:self->_iconLabelAccessoryView];

      v14 = (NSArray *)objc_alloc_init(MEMORY[0x1E4F1CA48]);
      BOOL v15 = [(SBIconLabelAccessoryView *)self->_iconLabelAccessoryView hasBaseline];
      double v16 = self->_iconLabelAccessoryView;
      if (v15)
      {
        double v17 = [(SBIconLabelAccessoryView *)v16 firstBaselineAnchor];
        [(UILabel *)self->_iconNameLabel firstBaselineAnchor];
      }
      else
      {
        double v17 = [(SBIconLabelAccessoryView *)v16 centerYAnchor];
        [(UILabel *)self->_iconNameLabel centerYAnchor];
      double v18 = };
      v19 = [v17 constraintEqualToAnchor:v18];
      [(NSArray *)v14 addObject:v19];

      id v20 = [(SBHIconTableViewCell *)self contentView];
      uint64_t v21 = [v20 layoutMarginsGuide];

      uint64_t v22 = [(SBIconLabelAccessoryView *)self->_iconLabelAccessoryView trailingAnchor];
      uint64_t v23 = [v21 trailingAnchor];
      v24 = [v22 constraintEqualToAnchor:v23 constant:-16.0];
      [(NSArray *)v14 addObject:v24];

      v25 = [(SBIconLabelAccessoryView *)self->_iconLabelAccessoryView leadingAnchor];
      v26 = [(UIView *)self->_labelContainerView trailingAnchor];
      id v27 = [v25 constraintGreaterThanOrEqualToSystemSpacingAfterAnchor:v26 multiplier:1.0];
      [(NSArray *)v14 addObject:v27];

      iconLabelAccessoryViewConstraints = self->_iconLabelAccessoryViewConstraints;
      self->_iconLabelAccessoryViewConstraints = v14;
      v29 = v14;

      [MEMORY[0x1E4F28DC8] activateConstraints:self->_iconLabelAccessoryViewConstraints];
    }
  }
  return labelAccessoryType != v3;
}

- (void)_teardownIconLabelAccessoryView
{
  if (self->_iconLabelAccessoryView)
  {
    [MEMORY[0x1E4F28DC8] deactivateConstraints:self->_iconLabelAccessoryViewConstraints];
    iconLabelAccessoryViewConstraints = self->_iconLabelAccessoryViewConstraints;
    self->_iconLabelAccessoryViewConstraints = 0;

    [(SBIconLabelAccessoryView *)self->_iconLabelAccessoryView removeFromSuperview];
    iconLabelAccessoryView = self->_iconLabelAccessoryView;
    self->_iconLabelAccessoryView = 0;

    [(SBHIconTableViewCell *)self setNeedsUpdateConstraints];
  }
}

- (_UILegibilitySettings)legibilitySettings
{
  return self->_legibilitySettings;
}

- (SBIconView)iconView
{
  return self->_iconView;
}

- (SBIcon)icon
{
  return self->_icon;
}

- (NSString)iconDescription
{
  return self->_iconDescription;
}

- (UILabel)iconNameLabel
{
  return self->_iconNameLabel;
}

- (UIView)iconViewContainerView
{
  return self->_iconViewContainerView;
}

- (UIView)labelContainerView
{
  return self->_labelContainerView;
}

- (NSArray)iconViewContainerViewConstraints
{
  return self->_iconViewContainerViewConstraints;
}

- (void)setIconViewContainerViewConstraints:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_iconViewContainerViewConstraints, 0);
  objc_storeStrong((id *)&self->_labelContainerView, 0);
  objc_storeStrong((id *)&self->_iconViewContainerView, 0);
  objc_storeStrong((id *)&self->_iconNameLabel, 0);
  objc_storeStrong((id *)&self->_iconDescription, 0);
  objc_storeStrong((id *)&self->_icon, 0);
  objc_storeStrong((id *)&self->_iconView, 0);
  objc_storeStrong((id *)&self->_legibilitySettings, 0);
  objc_storeStrong((id *)&self->_iconLabelAccessoryViewConstraints, 0);
  objc_storeStrong((id *)&self->_iconLabelAccessoryView, 0);
  objc_storeStrong((id *)&self->_customSelectedBackgroundView, 0);
}

@end