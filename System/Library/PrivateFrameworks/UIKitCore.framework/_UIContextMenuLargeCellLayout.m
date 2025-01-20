@interface _UIContextMenuLargeCellLayout
- (BOOL)_hasTrailingAccessory;
- (BOOL)useContentShapeForSelectionHighlight;
- (NSArray)managedConstraints;
- (NSLayoutConstraint)decorationViewCenterX;
- (NSLayoutConstraint)iconViewCenterXToTrailing;
- (NSLayoutConstraint)labelStackViewTrailingToDecorationViewLeading;
- (NSLayoutConstraint)labelStackViewTrailingToiconViewCenterX;
- (NSLayoutConstraint)lastBaselineToBottom;
- (NSLayoutConstraint)leadingToLabelStackViewLeading;
- (NSLayoutConstraint)minHeightConstraint;
- (NSLayoutConstraint)topToFirstBaseline;
- (UIColor)preferredBackgroundColorForCurrentState;
- (UIColor)preferredContentColorForCurrentState;
- (UIHoverStyle)hoverStyle;
- (UIShape)contentShape;
- (_UIContextMenuCellContentView)contentView;
- (_UIContextMenuLargeCellLayout)initWithContentView:(id)a3;
- (id)preferredIconFontUsingBoldFont:(BOOL)a3;
- (int64_t)focusStyle;
- (int64_t)labelTextAlignment;
- (int64_t)layoutSize;
- (unint64_t)labelMaximumNumberOfLines;
- (void)installConstraints;
- (void)removeConstraints;
- (void)setContentView:(id)a3;
- (void)setDecorationViewCenterX:(id)a3;
- (void)setIconViewCenterXToTrailing:(id)a3;
- (void)setLabelStackViewTrailingToDecorationViewLeading:(id)a3;
- (void)setLabelStackViewTrailingToiconViewCenterX:(id)a3;
- (void)setLastBaselineToBottom:(id)a3;
- (void)setLeadingToLabelStackViewLeading:(id)a3;
- (void)setManagedConstraints:(id)a3;
- (void)setMinHeightConstraint:(id)a3;
- (void)setTopToFirstBaseline:(id)a3;
- (void)updateConstraints;
@end

@implementation _UIContextMenuLargeCellLayout

- (_UIContextMenuLargeCellLayout)initWithContentView:(id)a3
{
  id v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)_UIContextMenuLargeCellLayout;
  v5 = [(_UIContextMenuLargeCellLayout *)&v9 init];
  v6 = v5;
  if (v5)
  {
    [(_UIContextMenuLargeCellLayout *)v5 setContentView:v4];
    v7 = [MEMORY[0x1E4F1CA48] array];
    [(_UIContextMenuLargeCellLayout *)v6 setManagedConstraints:v7];
  }
  return v6;
}

- (int64_t)layoutSize
{
  return 2;
}

- (int64_t)labelTextAlignment
{
  return 4;
}

- (unint64_t)labelMaximumNumberOfLines
{
  return 0x7FFFFFFFFFFFFFFFLL;
}

- (id)preferredIconFontUsingBoldFont:(BOOL)a3
{
  id v4 = [(_UIContextMenuLargeCellLayout *)self contentView];
  v5 = [v4 traitCollection];
  v6 = _UIContextMenuGetPlatformMetrics([v5 userInterfaceIdiom]);
  v7 = v6;
  if (a3) {
    [v6 iconEmphasizedSymbolFont];
  }
  else {
  v8 = [v6 iconSymbolFont];
  }
  objc_super v9 = [v8 _fontAdjustedForCurrentContentSizeCategory];

  return v9;
}

- (UIColor)preferredContentColorForCurrentState
{
  return 0;
}

- (UIColor)preferredBackgroundColorForCurrentState
{
  return 0;
}

- (UIHoverStyle)hoverStyle
{
  return 0;
}

- (UIShape)contentShape
{
  return +[UIShape rectShape];
}

- (BOOL)useContentShapeForSelectionHighlight
{
  return 0;
}

- (int64_t)focusStyle
{
  return 1;
}

- (void)installConstraints
{
  v82[2] = *MEMORY[0x1E4F143B8];
  [(_UIContextMenuLargeCellLayout *)self removeConstraints];
  v3 = [(_UIContextMenuLargeCellLayout *)self contentView];
  id v4 = [v3 traitCollection];
  v5 = [v4 preferredContentSizeCategory];
  BOOL IsAccessibilityCategory = UIContentSizeCategoryIsAccessibilityCategory(v5);

  v7 = [v3 labelStackView];
  v8 = [v3 decorationView];
  objc_super v9 = [v3 iconView];
  v10 = [MEMORY[0x1E4F1CA48] array];
  v80 = v10;
  if (v8)
  {
    v78 = v9;
    [v3 addSubview:v8];
    BOOL v11 = [(_UIContextMenuLargeCellLayout *)self _hasTrailingAccessory];
    v12 = [v8 centerXAnchor];
    v77 = v7;
    if (v11) {
      [v3 trailingAnchor];
    }
    else {
    v13 = [v3 leadingAnchor];
    }
    v14 = [v12 constraintEqualToAnchor:v13];
    [(_UIContextMenuLargeCellLayout *)self setDecorationViewCenterX:v14];

    v15 = [(_UIContextMenuLargeCellLayout *)self decorationViewCenterX];
    v82[0] = v15;
    v16 = [v8 centerYAnchor];
    v17 = [v3 centerYAnchor];
    v18 = [v16 constraintEqualToAnchor:v17];
    v82[1] = v18;
    v19 = [MEMORY[0x1E4F1C978] arrayWithObjects:v82 count:2];
    v10 = v80;
    [v80 addObjectsFromArray:v19];

    v7 = v77;
    objc_super v9 = v78;
  }
  if (v9) {
    char v20 = IsAccessibilityCategory;
  }
  else {
    char v20 = 1;
  }
  if (v20)
  {
    [v9 removeFromSuperview];
  }
  else
  {
    [v3 addSubview:v9];
    v21 = [v9 centerYAnchor];
    v22 = [v3 centerYAnchor];
    v23 = [v21 constraintEqualToAnchor:v22];
    [v10 addObject:v23];

    v24 = [v9 centerXAnchor];
    v25 = [v3 trailingAnchor];
    v26 = [v24 constraintEqualToAnchor:v25];
    [(_UIContextMenuLargeCellLayout *)self setIconViewCenterXToTrailing:v26];

    v27 = [(_UIContextMenuLargeCellLayout *)self iconViewCenterXToTrailing];
    [v10 addObject:v27];
  }
  v28 = [v3 titleLabel];
  v29 = [v28 text];
  if ([v29 length])
  {
  }
  else
  {
    v30 = [v3 subtitleLabel];
    v31 = [v30 text];
    uint64_t v32 = [v31 length];

    if (!v32)
    {
      v67 = [v3 traitCollection];
      uint64_t v68 = [v67 userInterfaceIdiom];

      v69 = _UIContextMenuGetPlatformMetrics(v68);
      [v69 itemTopToFirstBaseline];
      double v71 = v70;

      v72 = _UIContextMenuGetPlatformMetrics(v68);
      [v72 itemLastBaselineToBottom];
      double v74 = v73;

      v75 = [v3 heightAnchor];
      v76 = [v75 constraintGreaterThanOrEqualToConstant:v71 + v74];
      [(_UIContextMenuLargeCellLayout *)self setMinHeightConstraint:v76];

      v53 = [(_UIContextMenuLargeCellLayout *)self minHeightConstraint];
      v66 = v80;
      [v80 addObject:v53];
      goto LABEL_23;
    }
  }
  [v3 addSubview:v7];
  v33 = [v3 traitCollection];
  v34 = _UIContextMenuGetPlatformMetrics([v33 userInterfaceIdiom]);
  [v34 menuItemInternalPadding];
  double v36 = v35;
  double v38 = v37;

  v39 = [v7 firstBaselineAnchor];
  v40 = [v3 topAnchor];
  v41 = [v39 constraintEqualToAnchor:v40];
  [(_UIContextMenuLargeCellLayout *)self setTopToFirstBaseline:v41];

  v42 = [v7 lastBaselineAnchor];
  v43 = [v3 bottomAnchor];
  v44 = [v42 constraintEqualToAnchor:v43];
  [(_UIContextMenuLargeCellLayout *)self setLastBaselineToBottom:v44];

  v45 = [v7 leadingAnchor];
  v46 = [v3 leadingAnchor];
  v47 = [v45 constraintEqualToAnchor:v46 constant:v36];
  [(_UIContextMenuLargeCellLayout *)self setLeadingToLabelStackViewLeading:v47];

  v48 = [v9 superview];

  v79 = v8;
  if (v48)
  {
    v49 = [v7 trailingAnchor];
    v50 = [v9 centerXAnchor];
    v51 = [v49 constraintLessThanOrEqualToAnchor:v50];
    [(_UIContextMenuLargeCellLayout *)self setLabelStackViewTrailingToiconViewCenterX:v51];

    uint64_t v52 = [(_UIContextMenuLargeCellLayout *)self labelStackViewTrailingToiconViewCenterX];
  }
  else
  {
    uint64_t v54 = [v8 superview];
    if (!v54
      || (v55 = (void *)v54,
          BOOL v56 = [(_UIContextMenuLargeCellLayout *)self _hasTrailingAccessory],
          v55,
          !v56))
    {
      v60 = [v7 trailingAnchor];
      v61 = [v3 trailingAnchor];
      v53 = [v60 constraintEqualToAnchor:v61 constant:-v38];

      goto LABEL_22;
    }
    v57 = [v7 trailingAnchor];
    v58 = [v8 leadingAnchor];
    v59 = [v57 constraintLessThanOrEqualToAnchor:v58];
    [(_UIContextMenuLargeCellLayout *)self setLabelStackViewTrailingToDecorationViewLeading:v59];

    uint64_t v52 = [(_UIContextMenuLargeCellLayout *)self labelStackViewTrailingToDecorationViewLeading];
  }
  v53 = (void *)v52;
LABEL_22:
  v62 = [(_UIContextMenuLargeCellLayout *)self topToFirstBaseline];
  v81[0] = v62;
  v63 = [(_UIContextMenuLargeCellLayout *)self lastBaselineToBottom];
  v81[1] = v63;
  v64 = [(_UIContextMenuLargeCellLayout *)self leadingToLabelStackViewLeading];
  v81[2] = v64;
  v81[3] = v53;
  v65 = [MEMORY[0x1E4F1C978] arrayWithObjects:v81 count:4];
  v66 = v80;
  [v80 addObjectsFromArray:v65];

  v8 = v79;
LABEL_23:

  [MEMORY[0x1E4F5B268] activateConstraints:v66];
  [(_UIContextMenuLargeCellLayout *)self setManagedConstraints:v66];
}

- (void)updateConstraints
{
  id v81 = [(_UIContextMenuLargeCellLayout *)self contentView];
  v3 = [v81 traitCollection];
  uint64_t v4 = [v3 userInterfaceIdiom];

  v5 = _UIContextMenuGetPlatformMetrics(v4);
  v6 = [v81 traitCollection];
  v7 = [v6 preferredContentSizeCategory];
  BOOL IsAccessibilityCategory = UIContentSizeCategoryIsAccessibilityCategory(v7);

  objc_super v9 = [v81 subtitleLabel];
  v10 = [v9 text];
  uint64_t v11 = [v10 length];

  v12 = [v81 traitCollection];
  v13 = _UIContextMenuGetPlatformMetrics([v12 userInterfaceIdiom]);
  v14 = [v13 titleFont];
  v15 = [v14 _fontAdjustedForContentSizeCategoryCompatibleWithTraitCollection:v12];

  v16 = _UIContextMenuGetPlatformMetrics(v4);
  [v16 itemBaselineToBaseline];
  double v18 = v17;

  [v15 _scaledValueForValue:1 useLanguageAwareScaling:v18];
  UIRoundToViewScale(v81);
  double v20 = v19;
  v21 = [v81 labelStackView];
  [v21 setSpacing:v20];

  v22 = _UIContextMenuGetPlatformMetrics(v4);
  v23 = v22;
  if (v11) {
    [v22 itemTopToFirstBaselineWithSubtitle];
  }
  else {
    [v22 itemTopToFirstBaseline];
  }
  double v25 = v24;

  v26 = _UIContextMenuGetPlatformMetrics(v4);
  v27 = v26;
  if (v11) {
    [v26 itemLastBaselineToBottomWithSubtitle];
  }
  else {
    [v26 itemLastBaselineToBottom];
  }
  double v29 = v28;

  [v15 _scaledValueForValue:v25];
  UIRoundToViewScale(v81);
  double v31 = v30;
  [v15 _scaledValueForValue:v29];
  UIRoundToViewScale(v81);
  double v33 = v32;
  v34 = [(_UIContextMenuLargeCellLayout *)self topToFirstBaseline];
  [v34 setConstant:v31];

  double v35 = [(_UIContextMenuLargeCellLayout *)self lastBaselineToBottom];
  [v35 setConstant:-v33];

  [v81 directionalLayoutMargins];
  double v37 = v36;
  uint64_t v38 = [v81 decorationView];
  if (v38)
  {
    v39 = (void *)v38;
    BOOL v40 = [(_UIContextMenuLargeCellLayout *)self _hasTrailingAccessory];

    if (!v40)
    {
      [v5 leadingDecorationViewOffset];
      objc_msgSend(v15, "_scaledValueForValue:");
      UIRoundToViewScale(v81);
      double v42 = v41;
      v43 = [(_UIContextMenuLargeCellLayout *)self decorationViewCenterX];
      [v43 setConstant:v42];
    }
  }
  v44 = [(_UIContextMenuLargeCellLayout *)self leadingToLabelStackViewLeading];
  [v44 setConstant:v37];

  v45 = [v81 iconView];
  if (!v45) {
    BOOL IsAccessibilityCategory = 1;
  }

  if (!IsAccessibilityCategory)
  {
    v46 = _UIContextMenuGetPlatformMetrics(v4);
    [v46 dynamicImageBoxWidth];
    double v48 = v47;

    [v15 _scaledValueForValue:v48];
    UIRoundToViewScale(v81);
    double v50 = v49;
    [v81 directionalLayoutMargins];
    double v51 = v50 * 0.5;
    double v53 = v50 * 0.5 + v52;
    uint64_t v54 = _UIContextMenuGetPlatformMetrics(v4);
    [v54 minIntraItemSpacing];
    double v56 = v55;

    v57 = [(_UIContextMenuLargeCellLayout *)self iconViewCenterXToTrailing];
    [v57 setConstant:-v53];

    v58 = [(_UIContextMenuLargeCellLayout *)self labelStackViewTrailingToiconViewCenterX];
    [v58 setConstant:-(v51 + v56)];
  }
  uint64_t v59 = [v81 decorationView];
  if (v59)
  {
    v60 = (void *)v59;
    BOOL v61 = [(_UIContextMenuLargeCellLayout *)self _hasTrailingAccessory];

    if (v61)
    {
      [v5 trailingDecorationViewOffset];
      objc_msgSend(v15, "_scaledValueForValue:");
      v62 = _UIContextMenuGetPlatformMetrics(v4);
      [v62 menuItemInternalPadding];

      v63 = _UIContextMenuGetPlatformMetrics(v4);
      [v63 menuGutterWidth];

      UIRoundToViewScale(v81);
      double v65 = -v64;
      v66 = [(_UIContextMenuLargeCellLayout *)self decorationViewCenterX];
      [v66 setConstant:v65];

      v67 = [(_UIContextMenuLargeCellLayout *)self labelStackViewTrailingToDecorationViewLeading];

      if (v67)
      {
        uint64_t v68 = _UIContextMenuGetPlatformMetrics(v4);
        [v68 minIntraItemSpacing];
        double v70 = v69;

        double v71 = [(_UIContextMenuLargeCellLayout *)self labelStackViewTrailingToDecorationViewLeading];
        [v71 setConstant:-v70];
      }
    }
  }
  v72 = _UIContextMenuGetPlatformMetrics(v4);
  [v72 itemTopToFirstBaseline];
  double v74 = v73;

  v75 = _UIContextMenuGetPlatformMetrics(v4);
  [v75 itemLastBaselineToBottom];
  double v77 = v76;

  [v15 _scaledValueForValue:v74 + v77];
  UIRoundToViewScale(v81);
  double v79 = v78;
  v80 = [(_UIContextMenuLargeCellLayout *)self minHeightConstraint];
  [v80 setConstant:v79];
}

- (void)removeConstraints
{
  v3 = (void *)MEMORY[0x1E4F5B268];
  uint64_t v4 = [(_UIContextMenuLargeCellLayout *)self managedConstraints];
  [v3 deactivateConstraints:v4];

  managedConstraints = self->_managedConstraints;
  self->_managedConstraints = 0;
}

- (BOOL)_hasTrailingAccessory
{
  v2 = [(_UIContextMenuLargeCellLayout *)self contentView];
  char v3 = ~[v2 options];

  return (v3 & 0x30) == 0;
}

- (_UIContextMenuCellContentView)contentView
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_contentView);
  return (_UIContextMenuCellContentView *)WeakRetained;
}

- (void)setContentView:(id)a3
{
}

- (NSArray)managedConstraints
{
  return self->_managedConstraints;
}

- (void)setManagedConstraints:(id)a3
{
}

- (NSLayoutConstraint)topToFirstBaseline
{
  return self->_topToFirstBaseline;
}

- (void)setTopToFirstBaseline:(id)a3
{
}

- (NSLayoutConstraint)lastBaselineToBottom
{
  return self->_lastBaselineToBottom;
}

- (void)setLastBaselineToBottom:(id)a3
{
}

- (NSLayoutConstraint)leadingToLabelStackViewLeading
{
  return self->_leadingToLabelStackViewLeading;
}

- (void)setLeadingToLabelStackViewLeading:(id)a3
{
}

- (NSLayoutConstraint)decorationViewCenterX
{
  return self->_decorationViewCenterX;
}

- (void)setDecorationViewCenterX:(id)a3
{
}

- (NSLayoutConstraint)iconViewCenterXToTrailing
{
  return self->_iconViewCenterXToTrailing;
}

- (void)setIconViewCenterXToTrailing:(id)a3
{
}

- (NSLayoutConstraint)labelStackViewTrailingToiconViewCenterX
{
  return self->_labelStackViewTrailingToiconViewCenterX;
}

- (void)setLabelStackViewTrailingToiconViewCenterX:(id)a3
{
}

- (NSLayoutConstraint)minHeightConstraint
{
  return self->_minHeightConstraint;
}

- (void)setMinHeightConstraint:(id)a3
{
}

- (NSLayoutConstraint)labelStackViewTrailingToDecorationViewLeading
{
  return self->_labelStackViewTrailingToDecorationViewLeading;
}

- (void)setLabelStackViewTrailingToDecorationViewLeading:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_labelStackViewTrailingToDecorationViewLeading, 0);
  objc_storeStrong((id *)&self->_minHeightConstraint, 0);
  objc_storeStrong((id *)&self->_labelStackViewTrailingToiconViewCenterX, 0);
  objc_storeStrong((id *)&self->_iconViewCenterXToTrailing, 0);
  objc_storeStrong((id *)&self->_decorationViewCenterX, 0);
  objc_storeStrong((id *)&self->_leadingToLabelStackViewLeading, 0);
  objc_storeStrong((id *)&self->_lastBaselineToBottom, 0);
  objc_storeStrong((id *)&self->_topToFirstBaseline, 0);
  objc_storeStrong((id *)&self->_managedConstraints, 0);
  objc_destroyWeak((id *)&self->_contentView);
}

@end