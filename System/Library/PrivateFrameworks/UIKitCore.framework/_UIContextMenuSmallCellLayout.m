@interface _UIContextMenuSmallCellLayout
- (BOOL)useContentShapeForSelectionHighlight;
- (NSArray)managedConstraints;
- (NSLayoutConstraint)firstBaselineConstraint;
- (NSLayoutConstraint)minHeightConstraint;
- (UIColor)preferredBackgroundColorForCurrentState;
- (UIColor)preferredContentColorForCurrentState;
- (UIHoverStyle)hoverStyle;
- (UIShape)contentShape;
- (_UIContextMenuCellContentView)contentView;
- (_UIContextMenuSmallCellLayout)initWithContentView:(id)a3;
- (id)preferredIconFontUsingBoldFont:(BOOL)a3;
- (int64_t)focusStyle;
- (int64_t)labelTextAlignment;
- (int64_t)layoutSize;
- (unint64_t)labelMaximumNumberOfLines;
- (void)installConstraints;
- (void)removeConstraints;
- (void)setContentView:(id)a3;
- (void)setFirstBaselineConstraint:(id)a3;
- (void)setManagedConstraints:(id)a3;
- (void)setMinHeightConstraint:(id)a3;
- (void)updateConstraints;
@end

@implementation _UIContextMenuSmallCellLayout

- (_UIContextMenuSmallCellLayout)initWithContentView:(id)a3
{
  id v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)_UIContextMenuSmallCellLayout;
  v5 = [(_UIContextMenuSmallCellLayout *)&v9 init];
  v6 = v5;
  if (v5)
  {
    [(_UIContextMenuSmallCellLayout *)v5 setContentView:v4];
    v7 = [MEMORY[0x1E4F1CA48] array];
    [(_UIContextMenuSmallCellLayout *)v6 setManagedConstraints:v7];
  }
  return v6;
}

- (int64_t)layoutSize
{
  return 0;
}

- (int64_t)labelTextAlignment
{
  return 1;
}

- (unint64_t)labelMaximumNumberOfLines
{
  return 1;
}

- (id)preferredIconFontUsingBoldFont:(BOOL)a3
{
  id v4 = [(_UIContextMenuSmallCellLayout *)self contentView];
  v5 = [v4 traitCollection];
  v6 = _UIContextMenuGetPlatformMetrics([v5 userInterfaceIdiom]);
  v7 = v6;
  if (a3) {
    [v6 titleEmphasizedFont];
  }
  else {
  v8 = [v6 titleFont];
  }
  objc_super v9 = [v8 _fontAdjustedForContentSizeCategoryCompatibleWithTraitCollection:v5];

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
  v3 = [(_UIContextMenuSmallCellLayout *)self contentView];
  id v4 = [v3 traitCollection];
  uint64_t v5 = [v4 userInterfaceIdiom];

  if (v5 == 6)
  {
    v6 = [(_UIContextMenuSmallCellLayout *)self contentShape];
    v7 = +[UIHoverStyle styleWithShape:v6];
  }
  else
  {
    v7 = 0;
  }
  return (UIHoverStyle *)v7;
}

- (UIShape)contentShape
{
  v3 = [(_UIContextMenuSmallCellLayout *)self contentView];
  id v4 = [v3 traitCollection];
  uint64_t v5 = [v4 userInterfaceIdiom];

  if (v5 == 6)
  {
    v6 = +[UIShape circleShape];
  }
  else
  {
    v7 = [(_UIContextMenuSmallCellLayout *)self contentView];
    v8 = [v7 traitCollection];
    objc_super v9 = _UIContextMenuGetPlatformMetrics([v8 userInterfaceIdiom]);

    v6 = [v9 smallItemContentShape];
  }
  return (UIShape *)v6;
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
  [(_UIContextMenuSmallCellLayout *)self removeConstraints];
  id v35 = [MEMORY[0x1E4F1CA48] array];
  v3 = [(_UIContextMenuSmallCellLayout *)self contentView];
  id v4 = [v3 iconView];
  uint64_t v5 = v4;
  if (v4)
  {
    id v6 = v4;
  }
  else
  {
    id v6 = [v3 labelStackView];
  }
  v7 = v6;

  [v3 addSubview:v7];
  v8 = [v3 iconView];

  if (v8)
  {
    objc_super v9 = [v3 labelStackView];
    [v9 removeFromSuperview];

    v10 = [v7 centerYAnchor];
    v11 = [v3 centerYAnchor];
    v12 = [v10 constraintEqualToAnchor:v11];
    [v35 addObject:v12];
  }
  else
  {
    v13 = [v3 titleLabel];

    if (!v13) {
      goto LABEL_9;
    }
    v14 = [v3 iconView];
    [v14 removeFromSuperview];

    v15 = [v7 firstBaselineAnchor];
    v16 = [v3 topAnchor];
    v17 = [v15 constraintEqualToAnchor:v16];
    [(_UIContextMenuSmallCellLayout *)self setFirstBaselineConstraint:v17];

    v10 = [(_UIContextMenuSmallCellLayout *)self firstBaselineConstraint];
    [v35 addObject:v10];
  }

LABEL_9:
  v18 = [v7 leadingAnchor];
  v19 = [v3 leadingAnchor];
  v20 = [v18 constraintEqualToAnchor:v19 constant:10.0];
  [v35 addObject:v20];

  v21 = [v3 trailingAnchor];
  v22 = [v7 trailingAnchor];
  v23 = [v21 constraintEqualToAnchor:v22 constant:10.0];
  [v35 addObject:v23];

  v24 = [v3 traitCollection];
  uint64_t v25 = [v24 userInterfaceIdiom];

  v26 = _UIContextMenuGetPlatformMetrics(v25);
  [v26 smallItemTopToFirstBaseline];
  double v28 = v27;

  v29 = _UIContextMenuGetPlatformMetrics(v25);
  [v29 smallItemLastBaselineToBottom];
  double v31 = v30;

  v32 = [v3 heightAnchor];
  v33 = [v32 constraintGreaterThanOrEqualToConstant:v28 + v31];
  [(_UIContextMenuSmallCellLayout *)self setMinHeightConstraint:v33];

  v34 = [(_UIContextMenuSmallCellLayout *)self minHeightConstraint];
  [v35 addObject:v34];

  [MEMORY[0x1E4F5B268] activateConstraints:v35];
  [(_UIContextMenuSmallCellLayout *)self setManagedConstraints:v35];
}

- (void)updateConstraints
{
  v3 = [(_UIContextMenuSmallCellLayout *)self contentView];
  id v4 = [v3 traitCollection];
  uint64_t v5 = [v4 userInterfaceIdiom];

  id v6 = [(_UIContextMenuSmallCellLayout *)self contentView];
  v7 = [v6 traitCollection];
  v8 = _UIContextMenuGetPlatformMetrics([v7 userInterfaceIdiom]);
  objc_super v9 = [v8 titleFont];
  id v27 = [v9 _fontAdjustedForContentSizeCategoryCompatibleWithTraitCollection:v7];

  v10 = _UIContextMenuGetPlatformMetrics(v5);
  [v10 smallItemTopToFirstBaseline];
  double v12 = v11;

  [v27 _scaledValueForValue:v12];
  v13 = [(_UIContextMenuSmallCellLayout *)self contentView];
  UIRoundToViewScale(v13);
  double v15 = v14;
  v16 = [(_UIContextMenuSmallCellLayout *)self firstBaselineConstraint];
  [v16 setConstant:v15];

  v17 = _UIContextMenuGetPlatformMetrics(v5);
  [v17 smallItemTopToFirstBaseline];
  double v19 = v18;

  v20 = _UIContextMenuGetPlatformMetrics(v5);
  [v20 smallItemLastBaselineToBottom];
  double v22 = v21;

  [v27 _scaledValueForValue:v19 + v22];
  v23 = [(_UIContextMenuSmallCellLayout *)self contentView];
  UIRoundToViewScale(v23);
  double v25 = v24;
  v26 = [(_UIContextMenuSmallCellLayout *)self minHeightConstraint];
  [v26 setConstant:v25];
}

- (void)removeConstraints
{
  v3 = (void *)MEMORY[0x1E4F5B268];
  id v4 = [(_UIContextMenuSmallCellLayout *)self managedConstraints];
  [v3 deactivateConstraints:v4];

  managedConstraints = self->_managedConstraints;
  self->_managedConstraints = 0;
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

- (NSLayoutConstraint)firstBaselineConstraint
{
  return self->_firstBaselineConstraint;
}

- (void)setFirstBaselineConstraint:(id)a3
{
}

- (NSLayoutConstraint)minHeightConstraint
{
  return self->_minHeightConstraint;
}

- (void)setMinHeightConstraint:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_minHeightConstraint, 0);
  objc_storeStrong((id *)&self->_firstBaselineConstraint, 0);
  objc_storeStrong((id *)&self->_managedConstraints, 0);
  objc_destroyWeak((id *)&self->_contentView);
}

@end