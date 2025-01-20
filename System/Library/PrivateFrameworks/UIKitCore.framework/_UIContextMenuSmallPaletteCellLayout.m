@interface _UIContextMenuSmallPaletteCellLayout
- (BOOL)useContentShapeForSelectionHighlight;
- (CGRect)_rectForHighlightContentShape;
- (NSArray)managedConstraints;
- (UIColor)preferredBackgroundColorForCurrentState;
- (UIColor)preferredContentColorForCurrentState;
- (UIHoverStyle)hoverStyle;
- (UIShape)contentShape;
- (_UIContextMenuCellContentView)contentView;
- (_UIContextMenuSmallPaletteCellLayout)initWithContentView:(id)a3;
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

@implementation _UIContextMenuSmallPaletteCellLayout

- (_UIContextMenuSmallPaletteCellLayout)initWithContentView:(id)a3
{
  id v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)_UIContextMenuSmallPaletteCellLayout;
  v5 = [(_UIContextMenuSmallPaletteCellLayout *)&v9 init];
  v6 = v5;
  if (v5)
  {
    [(_UIContextMenuSmallPaletteCellLayout *)v5 setContentView:v4];
    v7 = [MEMORY[0x1E4F1CA48] array];
    [(_UIContextMenuSmallPaletteCellLayout *)v6 setManagedConstraints:v7];
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
  id v4 = [(_UIContextMenuSmallPaletteCellLayout *)self contentView];
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
  v2 = [(_UIContextMenuSmallPaletteCellLayout *)self contentView];
  char v3 = [v2 options];

  if (v3)
  {
    id v4 = +[UIColor tertiaryLabelColor];
  }
  else
  {
    id v4 = 0;
  }
  return (UIColor *)v4;
}

- (UIColor)preferredBackgroundColorForCurrentState
{
  return 0;
}

- (void)installConstraints
{
  v2 = self;
  v50[2] = *MEMORY[0x1E4F143B8];
  [(_UIContextMenuSmallPaletteCellLayout *)self removeConstraints];
  char v3 = [(_UIContextMenuSmallPaletteCellLayout *)v2 contentView];
  id v4 = [v3 labelStackView];
  [v4 removeFromSuperview];

  v5 = [v3 iconView];
  uint64_t v6 = [v3 titleLabel];
  v7 = (void *)v6;
  if (v5)
  {
    v47 = v2;
    v8 = (void *)v6;
    [v3 addSubview:v5];
    objc_super v9 = [v5 centerYAnchor];
    v10 = [v3 centerYAnchor];
    v11 = [v9 constraintEqualToAnchor:v10];
    v50[0] = v11;
    v12 = [v5 centerXAnchor];
    v13 = [v3 centerXAnchor];
    v14 = [v12 constraintEqualToAnchor:v13];
    v50[1] = v14;
    v15 = [MEMORY[0x1E4F1C978] arrayWithObjects:v50 count:2];

    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      id v16 = v5;
      v17 = [v16 _currentImage];
      v18 = [v3 traitCollection];
      float v19 = 0.0;
      if ([v17 isSymbolImage])
      {
        v7 = v8;
        v2 = v47;
        if ([v18 userInterfaceStyle] == 1)
        {
          v45 = v18;
          v20 = [v17 symbolConfiguration];
          v21 = [v20 _colors];
          v22 = [v21 firstObject];

          if (v22)
          {
            [v22 _luminance];
            v18 = v45;
            if (v23 > 0.8)
            {
              v43 = +[UIColor colorWithWhite:0.0 alpha:0.15];
              v24 = [v3 traitCollection];
              [v24 displayScale];
              double v26 = 1.0 / v25;
              v27 = [v16 layer];
              [v27 setRimWidth:v26];

              v28 = [v16 layer];
              float v19 = 1.0;
              LODWORD(v29) = 1.0;
              [v28 setRimOpacity:v29];

              id v30 = [v22 _colorBlendedWithColor:v43 compositingFilter:*MEMORY[0x1E4F3A2E0]];
              uint64_t v41 = [v30 CGColor];
              v31 = [v16 layer];
              [v31 setRimColor:v41];

              v18 = v45;
            }
          }
          else
          {
            v18 = v45;
          }
        }
      }
      else
      {
        v7 = v8;
        v2 = v47;
      }
      v33 = [v16 layer];
      *(float *)&double v40 = v19;
      [v33 setRimOpacity:v40];
      goto LABEL_16;
    }
    v7 = v8;
    v2 = v47;
  }
  else
  {
    if (v6)
    {
      v32 = [off_1E52D39B8 preferredFontForTextStyle:@"UICTFontTextStyleFootnote"];
      [v7 setFont:v32];

      [v3 addSubview:v7];
      v44 = [v7 centerYAnchor];
      uint64_t v48 = [v3 centerYAnchor];
      uint64_t v46 = [v44 constraintEqualToAnchor:v48];
      v49[0] = v46;
      v33 = [v7 leadingAnchor];
      v42 = [v3 leadingAnchor];
      v34 = [v33 constraintEqualToAnchor:v42 constant:10.0];
      v49[1] = v34;
      v35 = [v7 trailingAnchor];
      v36 = [v3 trailingAnchor];
      [v35 constraintEqualToAnchor:v36 constant:-10.0];
      v37 = v2;
      v39 = v38 = v7;
      v49[2] = v39;
      v15 = [MEMORY[0x1E4F1C978] arrayWithObjects:v49 count:3];

      v7 = v38;
      v2 = v37;

      id v16 = v44;
      v17 = (void *)v48;

      v18 = (void *)v46;
LABEL_16:

      goto LABEL_17;
    }
    v15 = 0;
  }
LABEL_17:
  [MEMORY[0x1E4F5B268] activateConstraints:v15];
  [(_UIContextMenuSmallPaletteCellLayout *)v2 setManagedConstraints:v15];
}

- (void)removeConstraints
{
  char v3 = (void *)MEMORY[0x1E4F5B268];
  id v4 = [(_UIContextMenuSmallPaletteCellLayout *)self managedConstraints];
  [v3 deactivateConstraints:v4];

  managedConstraints = self->_managedConstraints;
  self->_managedConstraints = 0;
}

- (UIHoverStyle)hoverStyle
{
  char v3 = [(_UIContextMenuSmallPaletteCellLayout *)self contentView];
  id v4 = [v3 iconView];
  if (v4 || ([v3 titleLabel], (id v4 = objc_claimAutoreleasedReturnValue()) != 0))
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v5 = [v4 image];
      if ([v5 isSymbolImage])
      {
        uint64_t v6 = _UIImageName(v5);
        if (([v6 containsString:@"circle.fill"] & 1) != 0
          || ([v6 containsString:@"square.fill"] & 1) != 0)
        {
          int v7 = 1;
        }
        else
        {
          int v7 = [v6 containsString:@"rectangle.fill"];
        }
      }
      else
      {
        int v7 = 0;
      }
    }
    else
    {
      int v7 = 0;
    }
    objc_super v9 = [[UITargetedPreview alloc] initWithView:v4];
    if (v7)
    {
      v10 = +[UIPointerEffect effectWithPreview:v9];
      [v4 frame];
      double x = v29.origin.x;
      double y = v29.origin.y;
      double width = v29.size.width;
      double height = v29.size.height;
      double v15 = CGRectGetWidth(v29);
      v30.origin.double x = x;
      v30.origin.double y = y;
      v30.size.double width = width;
      v30.size.double height = height;
      double v16 = CGRectGetHeight(v30);
      if (v15 < v16) {
        double v16 = v15;
      }
      uint64_t v17 = +[UIPointerShape shapeWithRoundedRect:cornerRadius:](UIPointerShape, "shapeWithRoundedRect:cornerRadius:", x, y, width, height, v16 * 0.5);
    }
    else
    {
      [(_UIContextMenuSmallPaletteCellLayout *)self _rectForHighlightContentShape];
      double v19 = v18;
      double v21 = v20;
      double v23 = v22;
      double v25 = v24;
      v10 = +[UIPointerEffect effectWithPreview:v9];
      uint64_t v17 = +[UIPointerShape shapeWithRoundedRect:](UIPointerShape, "shapeWithRoundedRect:", v19, v21, v23, v25);
    }
    double v26 = (void *)v17;
    v8 = +[UIPointerStyle styleWithEffect:v10 shape:v17];
  }
  else
  {
    v8 = 0;
  }

  return (UIHoverStyle *)v8;
}

- (UIShape)contentShape
{
  char v3 = objc_opt_new();
  [v3 setLayout:self];
  id v4 = +[UIShape shapeWithProvider:v3];

  return (UIShape *)v4;
}

- (BOOL)useContentShapeForSelectionHighlight
{
  v2 = [(_UIContextMenuSmallPaletteCellLayout *)self contentView];
  BOOL v3 = [v2 selectedIconBehavior] != 2;

  return v3;
}

- (int64_t)focusStyle
{
  return 1;
}

- (CGRect)_rectForHighlightContentShape
{
  v2 = [(_UIContextMenuSmallPaletteCellLayout *)self contentView];
  BOOL v3 = [v2 iconView];
  id v4 = v3;
  if (v3)
  {
    id v5 = v3;
  }
  else
  {
    id v5 = [v2 titleLabel];
  }
  uint64_t v6 = v5;

  [v2 bounds];
  double v8 = v7;
  CGFloat v10 = v9;
  double v36 = v9;
  double v12 = v11;
  double v14 = v13;
  double v15 = [off_1E52D39B8 preferredFontForTextStyle:@"UICTFontTextStyleBody"];
  [v15 _scaledValueForValue:8.0];
  double v17 = v16;
  double v18 = [v2 traitCollection];
  [v18 displayScale];
  UIRoundToScale(v17, v19);
  CGFloat v21 = v20;

  v37.origin.CGFloat x = v8;
  v37.origin.CGFloat y = v10;
  v37.size.CGFloat width = v12;
  v37.size.double height = v14;
  CGRect v38 = CGRectInset(v37, v21, v21);
  CGFloat x = v38.origin.x;
  CGFloat y = v38.origin.y;
  CGFloat width = v38.size.width;
  double height = v38.size.height;
  [v6 bounds];
  double v26 = v21 + v21 + CGRectGetWidth(v39);
  v40.origin.CGFloat x = x;
  v40.origin.CGFloat y = y;
  v40.size.CGFloat width = width;
  v40.size.double height = height;
  double v27 = CGRectGetHeight(v40);
  if (v26 >= v27) {
    CGFloat v28 = v26;
  }
  else {
    CGFloat v28 = v27;
  }
  [v2 bounds];
  double v29 = CGRectGetWidth(v41);
  v42.origin.CGFloat x = x;
  v42.origin.CGFloat y = y;
  v42.size.CGFloat width = v28;
  v42.size.double height = height;
  double v30 = CGRectGetWidth(v42);
  if (v29 >= v30) {
    double v31 = v30;
  }
  else {
    double v31 = v29;
  }

  double v32 = v8 + (v12 - v31) * 0.5;
  double v33 = v36 + (v14 - height) * 0.5;
  double v34 = v31;
  double v35 = height;
  result.size.double height = v35;
  result.size.CGFloat width = v34;
  result.origin.CGFloat y = v33;
  result.origin.CGFloat x = v32;
  return result;
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