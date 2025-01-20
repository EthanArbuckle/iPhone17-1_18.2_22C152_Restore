@interface _UIContextMenuLargePaletteCellLayout
- (BOOL)useContentShapeForSelectionHighlight;
- (NSArray)managedConstraints;
- (UIColor)preferredBackgroundColorForCurrentState;
- (UIColor)preferredContentColorForCurrentState;
- (UIHoverStyle)hoverStyle;
- (UIShape)contentShape;
- (_UIContextMenuCellContentView)contentView;
- (_UIContextMenuLargePaletteCellLayout)initWithContentView:(id)a3;
- (id)preferredIconFontUsingBoldFont:(BOOL)a3;
- (int64_t)focusStyle;
- (int64_t)labelTextAlignment;
- (int64_t)layoutSize;
- (unint64_t)labelMaximumNumberOfLines;
- (void)installConstraints;
- (void)removeConstraints;
- (void)setContentView:(id)a3;
- (void)setManagedConstraints:(id)a3;
@end

@implementation _UIContextMenuLargePaletteCellLayout

- (_UIContextMenuLargePaletteCellLayout)initWithContentView:(id)a3
{
  id v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)_UIContextMenuLargePaletteCellLayout;
  v5 = [(_UIContextMenuLargePaletteCellLayout *)&v9 init];
  v6 = v5;
  if (v5)
  {
    [(_UIContextMenuLargePaletteCellLayout *)v5 setContentView:v4];
    v7 = [MEMORY[0x1E4F1CA48] array];
    [(_UIContextMenuLargePaletteCellLayout *)v6 setManagedConstraints:v7];
  }
  return v6;
}

- (int64_t)layoutSize
{
  return 2;
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
  id v4 = [(_UIContextMenuLargePaletteCellLayout *)self contentView];
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
  return 0;
}

- (UIShape)contentShape
{
  v2 = +[UIShape rectShapeWithCornerRadius:8.0];
  v3 = objc_msgSend(v2, "shapeByApplyingInsets:", 8.0, 0.0, 8.0, 0.0);

  return (UIShape *)v3;
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
  v2 = self;
  v40[2] = *MEMORY[0x1E4F143B8];
  [(_UIContextMenuLargePaletteCellLayout *)self removeConstraints];
  v3 = [MEMORY[0x1E4F1CA48] array];
  id v4 = [(_UIContextMenuLargePaletteCellLayout *)v2 contentView];
  v5 = [v4 labelStackView];
  [v5 removeFromSuperview];

  v6 = [v4 iconView];
  uint64_t v7 = [v4 titleLabel];
  v8 = (void *)v7;
  if (v6)
  {
    [v4 addSubview:v6];
    [v6 centerYAnchor];
    objc_super v9 = v36 = v2;
    [v4 centerYAnchor];
    v10 = v37 = v8;
    v11 = [v9 constraintEqualToAnchor:v10];
    v40[0] = v11;
    v12 = [v6 centerXAnchor];
    v13 = [v4 centerXAnchor];
    v14 = [v12 constraintEqualToAnchor:v13];
    v40[1] = v14;
    v15 = [MEMORY[0x1E4F1C978] arrayWithObjects:v40 count:2];
    [v3 addObjectsFromArray:v15];

    v8 = v37;
    v2 = v36;
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      id v16 = v6;
      v17 = [v16 _currentImage];
      v31 = [v16 widthAnchor];
      [v17 size];
      v35 = objc_msgSend(v31, "constraintEqualToConstant:");
      v39[0] = v35;
      v18 = [v16 heightAnchor];
      [v17 size];
      v34 = v18;
      v33 = [v18 constraintEqualToConstant:v19];
      v39[1] = v33;
      v20 = [v4 widthAnchor];
      v21 = [v16 widthAnchor];
      v32 = v20;
      v22 = [v20 constraintGreaterThanOrEqualToAnchor:v21];
      v39[2] = v22;
      v23 = [v4 heightAnchor];
      v24 = [v16 heightAnchor];

      v25 = [v23 constraintGreaterThanOrEqualToAnchor:v24];
      v39[3] = v25;
      v26 = [MEMORY[0x1E4F1C978] arrayWithObjects:v39 count:4];
      [v3 addObjectsFromArray:v26];

      v2 = v36;
      v27 = v17;
      v28 = v31;
LABEL_6:

      v8 = v37;
    }
  }
  else if (v7)
  {
    v29 = [off_1E52D39B8 preferredFontForTextStyle:@"UICTFontTextStyleFootnote"];
    [v8 setFont:v29];

    [v4 addSubview:v8];
    v27 = [v8 centerYAnchor];
    v28 = [v4 centerYAnchor];
    v35 = [v27 constraintEqualToAnchor:v28];
    v38[0] = v35;
    v30 = [v8 leadingAnchor];
    v33 = [v4 leadingAnchor];
    v34 = v30;
    v32 = [v30 constraintEqualToAnchor:v33 constant:10.0];
    v38[1] = v32;
    v37 = v8;
    v21 = [v8 trailingAnchor];
    v22 = [v4 trailingAnchor];
    v23 = [v21 constraintEqualToAnchor:v22 constant:-10.0];
    v38[2] = v23;
    v24 = [MEMORY[0x1E4F1C978] arrayWithObjects:v38 count:3];
    [v3 addObjectsFromArray:v24];
    goto LABEL_6;
  }
  [MEMORY[0x1E4F5B268] activateConstraints:v3];
  [(_UIContextMenuLargePaletteCellLayout *)v2 setManagedConstraints:v3];
}

- (void)removeConstraints
{
  v3 = (void *)MEMORY[0x1E4F5B268];
  id v4 = [(_UIContextMenuLargePaletteCellLayout *)self managedConstraints];
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

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_managedConstraints, 0);
  objc_destroyWeak((id *)&self->_contentView);
}

@end