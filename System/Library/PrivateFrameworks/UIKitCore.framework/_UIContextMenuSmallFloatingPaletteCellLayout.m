@interface _UIContextMenuSmallFloatingPaletteCellLayout
- (BOOL)allowsHighlightingOnHover;
- (BOOL)useContentShapeForSelectionHighlight;
- (NSArray)managedConstraints;
- (UIColor)preferredBackgroundColorForCurrentState;
- (UIColor)preferredContentColorForCurrentState;
- (UIHoverStyle)hoverStyle;
- (UIShape)contentShape;
- (_UIContextMenuCellContentView)contentView;
- (_UIContextMenuSmallFloatingPaletteCellLayout)initWithContentView:(id)a3;
- (_UIFloatingContentView)floatingContentView;
- (id)preferredIconFontUsingBoldFont:(BOOL)a3;
- (int64_t)focusStyle;
- (int64_t)labelTextAlignment;
- (int64_t)layoutSize;
- (unint64_t)controlState;
- (unint64_t)labelMaximumNumberOfLines;
- (void)_configureSharedFloatingContentViewStyle;
- (void)installConstraints;
- (void)removeConstraints;
- (void)setContentView:(id)a3;
- (void)setControlState:(unint64_t)a3;
- (void)setControlState:(unint64_t)a3 withAnimationCoordinator:(id)a4;
- (void)setFloatingContentView:(id)a3;
- (void)setManagedConstraints:(id)a3;
@end

@implementation _UIContextMenuSmallFloatingPaletteCellLayout

- (_UIContextMenuSmallFloatingPaletteCellLayout)initWithContentView:(id)a3
{
  id v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)_UIContextMenuSmallFloatingPaletteCellLayout;
  v5 = [(_UIContextMenuSmallFloatingPaletteCellLayout *)&v9 init];
  v6 = v5;
  if (v5)
  {
    [(_UIContextMenuSmallFloatingPaletteCellLayout *)v5 setContentView:v4];
    v7 = [MEMORY[0x1E4F1CA48] array];
    [(_UIContextMenuSmallFloatingPaletteCellLayout *)v6 setManagedConstraints:v7];
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

- (BOOL)allowsHighlightingOnHover
{
  return 0;
}

- (id)preferredIconFontUsingBoldFont:(BOOL)a3
{
  id v4 = [(_UIContextMenuSmallFloatingPaletteCellLayout *)self contentView];
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
  return +[UIColor clearColor];
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
  return 0;
}

- (void)installConstraints
{
  v78[6] = *MEMORY[0x1E4F143B8];
  [(_UIContextMenuSmallFloatingPaletteCellLayout *)self removeConstraints];
  v74 = [MEMORY[0x1E4F1CA48] array];
  v3 = [(_UIContextMenuSmallFloatingPaletteCellLayout *)self contentView];
  id v4 = [v3 labelStackView];
  [v4 removeFromSuperview];

  v5 = [(_UIContextMenuSmallFloatingPaletteCellLayout *)self floatingContentView];

  if (!v5)
  {
    v6 = [_UIFloatingContentView alloc];
    v7 = -[_UIFloatingContentView initWithFrame:](v6, "initWithFrame:", *MEMORY[0x1E4F1DB28], *(double *)(MEMORY[0x1E4F1DB28] + 8), *(double *)(MEMORY[0x1E4F1DB28] + 16), *(double *)(MEMORY[0x1E4F1DB28] + 24));
    [(UIView *)v7 setTranslatesAutoresizingMaskIntoConstraints:0];
    [(_UIContextMenuSmallFloatingPaletteCellLayout *)self setFloatingContentView:v7];
    [(_UIContextMenuSmallFloatingPaletteCellLayout *)self _configureSharedFloatingContentViewStyle];
  }
  v8 = [(_UIContextMenuSmallFloatingPaletteCellLayout *)self floatingContentView];
  [v3 addSubview:v8];

  v73 = [v3 iconView];
  v71 = [v3 titleLabel];
  objc_super v9 = [(_UIContextMenuSmallFloatingPaletteCellLayout *)self floatingContentView];
  v69 = self;
  v10 = [(_UIContextMenuSmallFloatingPaletteCellLayout *)self contentView];
  v11 = [v10 traitCollection];
  uint64_t v12 = [v11 userInterfaceIdiom];

  v68 = _UIContextMenuGetPlatformMetrics(v12);
  [v68 paletteMinimumItemSize];
  double v14 = v13;
  double v16 = v15;
  v65 = [v9 topAnchor];
  v62 = [v3 topAnchor];
  v60 = [v65 constraintEqualToAnchor:v62 constant:26.0];
  v78[0] = v60;
  v58 = [v9 bottomAnchor];
  v57 = [v3 bottomAnchor];
  v56 = [v58 constraintEqualToAnchor:v57 constant:-46.0];
  v78[1] = v56;
  v55 = [v9 leadingAnchor];
  v17 = [v3 leadingAnchor];
  v18 = [v55 constraintEqualToAnchor:v17];
  v78[2] = v18;
  v19 = [v9 trailingAnchor];
  v72 = v3;
  v20 = [v3 trailingAnchor];
  v21 = [v19 constraintEqualToAnchor:v20];
  v78[3] = v21;
  v22 = [v9 widthAnchor];
  v23 = [v22 constraintEqualToConstant:v14];
  v78[4] = v23;
  v70 = v9;
  v24 = [v9 heightAnchor];
  v25 = [v24 constraintEqualToConstant:v16];
  v78[5] = v25;
  v26 = [MEMORY[0x1E4F1C978] arrayWithObjects:v78 count:6];
  [v74 addObjectsFromArray:v26];

  v27 = v73;
  if (v73)
  {
    v28 = [v70 contentView];
    [v28 addSubview:v73];

    v63 = [v73 centerYAnchor];
    v66 = [v70 contentView];
    v29 = [v66 centerYAnchor];
    v30 = [v63 constraintEqualToAnchor:v29];
    v77[0] = v30;
    v31 = [v73 centerXAnchor];
    v32 = [v70 contentView];
    v33 = [v32 centerXAnchor];
    v34 = [v31 constraintEqualToAnchor:v33];
    v77[1] = v34;
    v35 = [MEMORY[0x1E4F1C978] arrayWithObjects:v77 count:2];
    v36 = v74;
    [v74 addObjectsFromArray:v35];

    objc_opt_class();
    v38 = v71;
    v37 = v72;
    v39 = v70;
    if (objc_opt_isKindOfClass())
    {
      id v40 = v73;
      v41 = [v40 _currentImage];
      if (([v72 options] & 4) != 0 && !objc_msgSend(v72, "selectedIconBehavior"))
      {
        v42 = v74;
        if ([v72 isFocused]) {
          +[UIColor blackColor];
        }
        else {
        v53 = +[UIColor labelColor];
        }
        v76 = v53;
        v54 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v76 count:1];
        v43 = +[UIImageSymbolConfiguration configurationWithPaletteColors:v54];
      }
      else
      {
        v42 = v74;
        v43 = 0;
      }
      [v40 _setOverridingSymbolConfiguration:v43];
      goto LABEL_11;
    }
  }
  else
  {
    v36 = v74;
    v38 = v71;
    v37 = v72;
    v39 = v70;
    if (v71)
    {
      v44 = [off_1E52D39B8 preferredFontForTextStyle:@"UICTFontTextStyleCaption1"];
      [v71 setFont:v44];

      v45 = [v70 contentView];
      [v45 addSubview:v71];

      [v71 centerYAnchor];
      v43 = v42 = v74;
      id v40 = [v70 contentView];
      uint64_t v61 = [v40 centerYAnchor];
      v67 = [v43 constraintEqualToAnchor:v61];
      v75[0] = v67;
      v59 = [v71 leadingAnchor];
      v64 = [v70 contentView];
      v46 = [v64 leadingAnchor];
      v47 = [v59 constraintEqualToAnchor:v46 constant:10.0];
      v75[1] = v47;
      v48 = [v71 trailingAnchor];
      v49 = [v70 contentView];
      v50 = [v49 trailingAnchor];
      v51 = [v48 constraintEqualToAnchor:v50 constant:-10.0];
      v75[2] = v51;
      v52 = [MEMORY[0x1E4F1C978] arrayWithObjects:v75 count:3];
      [v74 addObjectsFromArray:v52];

      v41 = (void *)v61;
      v39 = v70;

      v38 = v71;
      v37 = v72;

LABEL_11:
      v36 = v42;
      v27 = v73;
    }
  }
  [MEMORY[0x1E4F5B268] activateConstraints:v36];
  [(_UIContextMenuSmallFloatingPaletteCellLayout *)v69 setManagedConstraints:v36];
}

- (void)removeConstraints
{
  v3 = [(_UIContextMenuSmallFloatingPaletteCellLayout *)self floatingContentView];
  [v3 removeFromSuperview];

  id v4 = (void *)MEMORY[0x1E4F5B268];
  v5 = [(_UIContextMenuSmallFloatingPaletteCellLayout *)self managedConstraints];
  [v4 deactivateConstraints:v5];

  managedConstraints = self->_managedConstraints;
  self->_managedConstraints = 0;
}

- (void)setControlState:(unint64_t)a3 withAnimationCoordinator:(id)a4
{
  self->_controlState = a3;
  id v6 = a4;
  id v7 = [(_UIContextMenuSmallFloatingPaletteCellLayout *)self floatingContentView];
  [v7 setControlState:a3 withAnimationCoordinator:v6];
}

- (void)_configureSharedFloatingContentViewStyle
{
  v3 = [(_UIContextMenuSmallFloatingPaletteCellLayout *)self contentView];
  id v4 = [v3 traitCollection];
  uint64_t v5 = [v4 userInterfaceIdiom];

  _UIContextMenuGetPlatformMetrics(v5);
  id v29 = (id)objc_claimAutoreleasedReturnValue();
  id v6 = [(_UIContextMenuSmallFloatingPaletteCellLayout *)self floatingContentView];
  id v7 = [v29 itemBackgroundColorProvider];
  v8 = v7[2](v7, 0, 0);
  [v6 setBackgroundColor:v8 forState:0];

  objc_super v9 = [(_UIContextMenuSmallFloatingPaletteCellLayout *)self floatingContentView];
  v10 = [v29 itemBackgroundColorProvider];
  v11 = v10[2](v10, 8, 0);
  [v9 setBackgroundColor:v11 forState:8];

  uint64_t v12 = [(_UIContextMenuSmallFloatingPaletteCellLayout *)self floatingContentView];
  double v13 = [v29 itemBackgroundColorProvider];
  double v14 = v13[2](v13, 1, 0);
  [v12 setBackgroundColor:v14 forState:1];

  double v15 = [(_UIContextMenuSmallFloatingPaletteCellLayout *)self floatingContentView];
  double v16 = [v29 itemBackgroundColorProvider];
  v17 = v16[2](v16, 4, 0);
  [v15 setBackgroundColor:v17 forState:4];

  v18 = [(_UIContextMenuSmallFloatingPaletteCellLayout *)self floatingContentView];
  v19 = +[_UIFocusAnimationConfiguration configurationWithStyle:2];
  [v18 setFocusAnimationConfiguration:v19];

  v20 = [(_UIContextMenuSmallFloatingPaletteCellLayout *)self floatingContentView];
  [v20 setCornerRadius:24.0];

  v21 = [(_UIContextMenuSmallFloatingPaletteCellLayout *)self floatingContentView];
  [v21 setRoundContentWhenDeselected:1];

  v22 = [(_UIContextMenuSmallFloatingPaletteCellLayout *)self floatingContentView];
  [v22 setClipsContentToBounds:1];

  v23 = [(_UIContextMenuSmallFloatingPaletteCellLayout *)self floatingContentView];
  [v23 setFocusedSizeIncrease:20.0];

  v24 = [(_UIContextMenuSmallFloatingPaletteCellLayout *)self floatingContentView];
  [v24 setShadowOpacity:1 forUserInterfaceStyle:0.3];

  v25 = [(_UIContextMenuSmallFloatingPaletteCellLayout *)self floatingContentView];
  [v25 setUseShadowImage:0];

  v26 = [(_UIContextMenuSmallFloatingPaletteCellLayout *)self floatingContentView];
  [v26 setShadowRadius:10.0];

  v27 = [(_UIContextMenuSmallFloatingPaletteCellLayout *)self floatingContentView];
  [v27 setShadowVerticalOffset:10.0];

  v28 = [(_UIContextMenuSmallFloatingPaletteCellLayout *)self floatingContentView];
  objc_msgSend(v28, "setContentMotionRotation:translation:", 0.0, 0.0, 4.0, 4.0);
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

- (_UIFloatingContentView)floatingContentView
{
  return self->_floatingContentView;
}

- (void)setFloatingContentView:(id)a3
{
}

- (unint64_t)controlState
{
  return self->_controlState;
}

- (void)setControlState:(unint64_t)a3
{
  self->_controlState = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_floatingContentView, 0);
  objc_storeStrong((id *)&self->_managedConstraints, 0);
  objc_destroyWeak((id *)&self->_contentView);
}

@end