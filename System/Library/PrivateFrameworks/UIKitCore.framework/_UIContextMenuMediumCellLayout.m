@interface _UIContextMenuMediumCellLayout
- (BOOL)_hasTitle;
- (BOOL)useContentShapeForSelectionHighlight;
- (NSArray)managedConstraints;
- (NSLayoutConstraint)bottomConstraint;
- (NSLayoutConstraint)fittingBottomConstraint;
- (NSLayoutConstraint)minimumHeightConstraint;
- (NSLayoutConstraint)primaryViewCenterYConstraint;
- (NSLayoutConstraint)topConstraint;
- (UIColor)preferredBackgroundColorForCurrentState;
- (UIColor)preferredContentColorForCurrentState;
- (UIHoverStyle)hoverStyle;
- (UIShape)contentShape;
- (_UIContextMenuCellContentView)contentView;
- (_UIContextMenuMediumCellLayout)initWithContentView:(id)a3;
- (id)preferredIconFontUsingBoldFont:(BOOL)a3;
- (int64_t)focusStyle;
- (int64_t)labelTextAlignment;
- (int64_t)layoutSize;
- (unint64_t)labelMaximumNumberOfLines;
- (void)installConstraints;
- (void)removeConstraints;
- (void)setBottomConstraint:(id)a3;
- (void)setContentView:(id)a3;
- (void)setFittingBottomConstraint:(id)a3;
- (void)setManagedConstraints:(id)a3;
- (void)setMinimumHeightConstraint:(id)a3;
- (void)setPrimaryViewCenterYConstraint:(id)a3;
- (void)setTopConstraint:(id)a3;
- (void)updateConstraints;
@end

@implementation _UIContextMenuMediumCellLayout

- (_UIContextMenuMediumCellLayout)initWithContentView:(id)a3
{
  id v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)_UIContextMenuMediumCellLayout;
  v5 = [(_UIContextMenuMediumCellLayout *)&v9 init];
  v6 = v5;
  if (v5)
  {
    [(_UIContextMenuMediumCellLayout *)v5 setContentView:v4];
    v7 = [MEMORY[0x1E4F1CA48] array];
    [(_UIContextMenuMediumCellLayout *)v6 setManagedConstraints:v7];
  }
  return v6;
}

- (int64_t)layoutSize
{
  return 1;
}

- (int64_t)labelTextAlignment
{
  return 1;
}

- (unint64_t)labelMaximumNumberOfLines
{
  return 2;
}

- (id)preferredIconFontUsingBoldFont:(BOOL)a3
{
  BOOL v3 = a3;
  BOOL v4 = [(_UIContextMenuMediumCellLayout *)self _hasTitle];
  v5 = UIFontTextStyleEmphasizedFootnote;
  if (!v4) {
    v5 = UIFontTextStyleEmphasizedBody;
  }
  v6 = &UIFontTextStyleFootnote;
  if (!v4) {
    v6 = &UIFontTextStyleBody;
  }
  if (!v3) {
    v5 = (__CFString **)v6;
  }
  v7 = [off_1E52D39B8 preferredFontForTextStyle:*v5];
  return v7;
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
  v2 = [(_UIContextMenuMediumCellLayout *)self contentView];
  BOOL v3 = [v2 traitCollection];
  BOOL v4 = _UIContextMenuGetPlatformMetrics([v3 userInterfaceIdiom]);

  v5 = [v4 mediumItemContentShape];

  return (UIShape *)v5;
}

- (BOOL)useContentShapeForSelectionHighlight
{
  return 1;
}

- (int64_t)focusStyle
{
  return 1;
}

- (void)installConstraints
{
  [(_UIContextMenuMediumCellLayout *)self removeConstraints];
  id v54 = [MEMORY[0x1E4F1CA48] array];
  BOOL v3 = [(_UIContextMenuMediumCellLayout *)self _hasTitle];
  BOOL v4 = [(_UIContextMenuMediumCellLayout *)self contentView];
  v5 = [v4 labelStackView];
  v6 = [v4 iconView];
  v7 = [v4 titleLabel];
  [v7 setTextAlignment:1];
  v8 = [off_1E52D39B8 preferredFontForTextStyle:@"UICTFontTextStyleFootnote"];
  [v7 setFont:v8];

  LODWORD(v9) = 1148846080;
  [v7 setContentHuggingPriority:1 forAxis:v9];
  if (v6)
  {
    [v4 addSubview:v6];
    v10 = [v6 centerXAnchor];
    v11 = [v4 centerXAnchor];
    v12 = [v10 constraintEqualToAnchor:v11];
    [v54 addObject:v12];
  }
  if (v7)
  {
    [v4 addSubview:v5];
    v13 = [v5 leadingAnchor];
    v14 = [v4 leadingAnchor];
    v15 = [v13 constraintEqualToAnchor:v14 constant:10.0];
    [v54 addObject:v15];

    v16 = [v4 trailingAnchor];
    v17 = [v5 trailingAnchor];
    v18 = [v16 constraintEqualToAnchor:v17 constant:10.0];
    [v54 addObject:v18];
  }
  char v19 = !v3;
  if (!v6) {
    char v19 = 1;
  }
  if ((v19 & 1) == 0)
  {
    v20 = [v6 centerYAnchor];
    uint64_t v21 = [v4 topAnchor];
LABEL_11:
    v22 = (void *)v21;
    v23 = [v20 constraintEqualToAnchor:v21];
    [(_UIContextMenuMediumCellLayout *)self setPrimaryViewCenterYConstraint:v23];

    v24 = [v5 firstBaselineAnchor];
    v25 = [v4 topAnchor];
    v26 = [v24 constraintEqualToAnchor:v25];
    [(_UIContextMenuMediumCellLayout *)self setTopConstraint:v26];

    v27 = [v4 bottomAnchor];
    v28 = [v5 lastBaselineAnchor];
    v29 = [v27 constraintEqualToAnchor:v28];
    [(_UIContextMenuMediumCellLayout *)self setBottomConstraint:v29];

    v30 = [v4 bottomAnchor];
    v31 = v5;
LABEL_12:
    v32 = [v31 lastBaselineAnchor];
    v33 = [v30 constraintGreaterThanOrEqualToAnchor:v32];
    [(_UIContextMenuMediumCellLayout *)self setFittingBottomConstraint:v33];

    v34 = [(_UIContextMenuMediumCellLayout *)self topConstraint];
    LODWORD(v35) = 1144750080;
    [v34 setPriority:v35];

    v36 = [(_UIContextMenuMediumCellLayout *)self bottomConstraint];
    LODWORD(v37) = 1144733696;
    [v36 setPriority:v37];

    v38 = [(_UIContextMenuMediumCellLayout *)self primaryViewCenterYConstraint];
    [v54 addObject:v38];

    v39 = [(_UIContextMenuMediumCellLayout *)self topConstraint];
    [v54 addObject:v39];

    v40 = [(_UIContextMenuMediumCellLayout *)self bottomConstraint];
    [v54 addObject:v40];

    v41 = [(_UIContextMenuMediumCellLayout *)self fittingBottomConstraint];
    [v54 addObject:v41];

    goto LABEL_13;
  }
  if (v3)
  {
    v20 = [v5 centerYAnchor];
    uint64_t v21 = [v4 centerYAnchor];
    goto LABEL_11;
  }
  if (v6)
  {
    v45 = [v6 centerYAnchor];
    v46 = [v4 centerYAnchor];
    v47 = [v45 constraintEqualToAnchor:v46];
    [(_UIContextMenuMediumCellLayout *)self setPrimaryViewCenterYConstraint:v47];

    v48 = [v6 topAnchor];
    v49 = [v4 topAnchor];
    v50 = [v48 constraintGreaterThanOrEqualToAnchor:v49];
    [(_UIContextMenuMediumCellLayout *)self setTopConstraint:v50];

    v51 = [v4 bottomAnchor];
    v52 = [v6 lastBaselineAnchor];
    v53 = [v51 constraintEqualToAnchor:v52];
    [(_UIContextMenuMediumCellLayout *)self setBottomConstraint:v53];

    v30 = [v4 bottomAnchor];
    v31 = v6;
    goto LABEL_12;
  }
LABEL_13:
  v42 = [v4 heightAnchor];
  v43 = [v42 constraintGreaterThanOrEqualToConstant:0.0];
  [(_UIContextMenuMediumCellLayout *)self setMinimumHeightConstraint:v43];

  v44 = [(_UIContextMenuMediumCellLayout *)self minimumHeightConstraint];
  [v54 addObject:v44];

  [MEMORY[0x1E4F5B268] activateConstraints:v54];
  [(_UIContextMenuMediumCellLayout *)self setManagedConstraints:v54];
}

- (void)updateConstraints
{
  id v23 = [(_UIContextMenuMediumCellLayout *)self contentView];
  BOOL v3 = [v23 traitCollection];
  BOOL v4 = _UIContextMenuGetPlatformMetrics([v3 userInterfaceIdiom]);
  v5 = [v4 titleFont];
  v6 = [v5 _fontAdjustedForContentSizeCategoryCompatibleWithTraitCollection:v3];

  LODWORD(v3) = [(_UIContextMenuMediumCellLayout *)self _hasTitle];
  [v6 _scaledValueForValue:16.0];
  if (v3)
  {
    v7 = [v23 iconView];

    if (v7) {
      [v6 _scaledValueForValue:48.0];
    }
    else {
      [v6 _scaledValueForValue:26.0];
    }
  }
  UIRoundToViewScale(v23);
  double v9 = v8;
  v10 = [(_UIContextMenuMediumCellLayout *)self primaryViewCenterYConstraint];
  [v10 setConstant:v9];

  UIRoundToViewScale(v23);
  double v12 = v11;
  v13 = [(_UIContextMenuMediumCellLayout *)self topConstraint];
  [v13 setConstant:v12];

  UIRoundToViewScale(v23);
  double v15 = v14;
  v16 = [(_UIContextMenuMediumCellLayout *)self bottomConstraint];
  [v16 setConstant:v15];

  UIRoundToViewScale(v23);
  double v18 = v17;
  char v19 = [(_UIContextMenuMediumCellLayout *)self fittingBottomConstraint];
  [v19 setConstant:v18];

  [v6 _scaledValueForValue:64.0];
  double v21 = v20;
  v22 = [(_UIContextMenuMediumCellLayout *)self minimumHeightConstraint];
  [v22 setConstant:v21];
}

- (void)removeConstraints
{
  BOOL v3 = (void *)MEMORY[0x1E4F5B268];
  BOOL v4 = [(_UIContextMenuMediumCellLayout *)self managedConstraints];
  [v3 deactivateConstraints:v4];

  managedConstraints = self->_managedConstraints;
  self->_managedConstraints = 0;
}

- (BOOL)_hasTitle
{
  v2 = [(_UIContextMenuMediumCellLayout *)self contentView];
  BOOL v3 = [v2 titleLabel];
  BOOL v4 = [v3 text];
  BOOL v5 = [v4 length] != 0;

  return v5;
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

- (NSLayoutConstraint)topConstraint
{
  return self->_topConstraint;
}

- (void)setTopConstraint:(id)a3
{
}

- (NSLayoutConstraint)primaryViewCenterYConstraint
{
  return self->_primaryViewCenterYConstraint;
}

- (void)setPrimaryViewCenterYConstraint:(id)a3
{
}

- (NSLayoutConstraint)bottomConstraint
{
  return self->_bottomConstraint;
}

- (void)setBottomConstraint:(id)a3
{
}

- (NSLayoutConstraint)fittingBottomConstraint
{
  return self->_fittingBottomConstraint;
}

- (void)setFittingBottomConstraint:(id)a3
{
}

- (NSLayoutConstraint)minimumHeightConstraint
{
  return self->_minimumHeightConstraint;
}

- (void)setMinimumHeightConstraint:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_minimumHeightConstraint, 0);
  objc_storeStrong((id *)&self->_fittingBottomConstraint, 0);
  objc_storeStrong((id *)&self->_bottomConstraint, 0);
  objc_storeStrong((id *)&self->_primaryViewCenterYConstraint, 0);
  objc_storeStrong((id *)&self->_topConstraint, 0);
  objc_storeStrong((id *)&self->_managedConstraints, 0);
  objc_destroyWeak((id *)&self->_contentView);
}

@end