@interface _UIFloatingTabBarPageButton
- (CGRect)_frameInCoordinateSpace:(id)a3 window:(id)a4;
- (CGRect)_sourceRectForPresentationInWindow:(id)a3;
- (CGSize)sizeThatFits:(CGSize)a3;
- (UIButton)button;
- (_UIFloatingTabBarPageButton)initWithDirection:(int64_t)a3;
- (double)contentOpacity;
- (id)_imageNameForCurrentDirection;
- (id)_tintColorForButton;
- (id)hitTest:(CGPoint)a3 withEvent:(id)a4;
- (int64_t)direction;
- (void)_configureButton;
- (void)_updateButtonColor;
- (void)layoutSubviews;
- (void)setContentOpacity:(double)a3;
@end

@implementation _UIFloatingTabBarPageButton

- (_UIFloatingTabBarPageButton)initWithDirection:(int64_t)a3
{
  v7.receiver = self;
  v7.super_class = (Class)_UIFloatingTabBarPageButton;
  v4 = -[UIView initWithFrame:](&v7, sel_initWithFrame_, *MEMORY[0x1E4F1DB28], *(double *)(MEMORY[0x1E4F1DB28] + 8), *(double *)(MEMORY[0x1E4F1DB28] + 16), *(double *)(MEMORY[0x1E4F1DB28] + 24));
  v5 = v4;
  if (v4)
  {
    v4->_direction = a3;
    [(_UIFloatingTabBarPageButton *)v4 _configureButton];
  }
  return v5;
}

- (double)contentOpacity
{
  v2 = [(_UIFloatingTabBarPageButton *)self button];
  [v2 alpha];
  double v4 = v3;

  return v4;
}

- (void)setContentOpacity:(double)a3
{
  id v4 = [(_UIFloatingTabBarPageButton *)self button];
  [v4 setAlpha:a3];
}

- (id)_imageNameForCurrentDirection
{
  if ([(_UIFloatingTabBarPageButton *)self direction]) {
    return @"chevron.right";
  }
  else {
    return @"chevron.left";
  }
}

- (void)_configureButton
{
  v21[1] = *MEMORY[0x1E4F143B8];
  double v3 = [(UIView *)self traitCollection];
  id v4 = _UIFloatingTabBarGetPlatformMetrics([v3 userInterfaceIdiom]);

  v5 = +[UIButtonConfiguration plainButtonConfiguration];
  v6 = [(_UIFloatingTabBarPageButton *)self _imageNameForCurrentDirection];
  objc_super v7 = +[UIImage systemImageNamed:v6];
  [v5 setImage:v7];

  v8 = [(_UIFloatingTabBarPageButton *)self _tintColorForButton];
  [v5 setBaseForegroundColor:v8];

  [v5 setCornerStyle:-1];
  double v9 = *MEMORY[0x1E4F3A430];
  v10 = [v5 background];
  [v10 setCornerRadius:v9];

  v11 = [v4 symbolConfiguration];
  [v5 setPreferredSymbolConfigurationForImage:v11];

  v12 = +[UIButton buttonWithConfiguration:v5 primaryAction:0];
  v13 = +[UIHoverHighlightEffect effect];
  v14 = +[UIShape capsuleShape];
  v15 = +[UIHoverStyle styleWithEffect:v13 shape:v14];
  [v12 setHoverStyle:v15];

  [v12 _setContinuousCornerRadius:v9];
  [v12 setSpringLoaded:1];
  [(UIView *)self addSubview:v12];
  objc_storeStrong((id *)&self->_button, v12);
  v21[0] = objc_opt_class();
  v16 = [MEMORY[0x1E4F1C978] arrayWithObjects:v21 count:1];
  id v17 = (id)[v12 registerForTraitChanges:v16 withAction:sel_setNeedsUpdateConfiguration];

  uint64_t v20 = objc_opt_class();
  v18 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v20 count:1];
  id v19 = [(UIView *)self registerForTraitChanges:v18 withAction:sel__updateButtonColor];
}

- (CGSize)sizeThatFits:(CGSize)a3
{
  double height = a3.height;
  double width = a3.width;
  v5 = [(_UIFloatingTabBarPageButton *)self button];
  objc_msgSend(v5, "sizeThatFits:", width, height);
  double v7 = v6;
  double v9 = v8;

  double v10 = v7 + -10.0;
  double v11 = v9;
  result.double height = v11;
  result.double width = v10;
  return result;
}

- (void)layoutSubviews
{
  v12.receiver = self;
  v12.super_class = (Class)_UIFloatingTabBarPageButton;
  [(UIView *)&v12 layoutSubviews];
  [(UIView *)self bounds];
  double v4 = v3;
  double v6 = v5;
  double v8 = v7;
  double v10 = v9;
  if ([(_UIFloatingTabBarPageButton *)self direction] == 1) {
    double v4 = v4 + -10.0;
  }
  double v11 = [(_UIFloatingTabBarPageButton *)self button];
  objc_msgSend(v11, "setFrame:", v4, v6, v8 + 10.0, v10);
}

- (id)hitTest:(CGPoint)a3 withEvent:(id)a4
{
  double y = a3.y;
  double x = a3.x;
  id v7 = a4;
  if (-[UIView pointInside:withEvent:](self, "pointInside:withEvent:", v7, x, y))
  {
    v10.receiver = self;
    v10.super_class = (Class)_UIFloatingTabBarPageButton;
    double v8 = -[UIView hitTest:withEvent:](&v10, sel_hitTest_withEvent_, v7, x, y);
  }
  else
  {
    double v8 = 0;
  }

  return v8;
}

- (void)_updateButtonColor
{
  double v3 = [(_UIFloatingTabBarPageButton *)self button];
  id v6 = [v3 configuration];

  double v4 = [(_UIFloatingTabBarPageButton *)self _tintColorForButton];
  [v6 setBaseForegroundColor:v4];

  double v5 = [(_UIFloatingTabBarPageButton *)self button];
  [v5 setConfiguration:v6];
}

- (id)_tintColorForButton
{
  double v3 = [(UIView *)self traitCollection];
  double v4 = _UIFloatingTabBarGetPlatformMetrics([v3 userInterfaceIdiom]);

  double v5 = [v4 contentPaletteProvider];
  id v6 = [(UIView *)self traitCollection];
  id v7 = v5[2](v5, [v6 userInterfaceStyle]);

  double v8 = [v7 inactiveColor];

  return v8;
}

- (CGRect)_frameInCoordinateSpace:(id)a3 window:(id)a4
{
  id v5 = a3;
  id v6 = [(_UIFloatingTabBarPageButton *)self button];
  [v6 frame];
  -[UIView convertRect:toCoordinateSpace:](self, "convertRect:toCoordinateSpace:", v5);
  double v8 = v7;
  double v10 = v9;
  double v12 = v11;
  double v14 = v13;

  double v15 = v8;
  double v16 = v10;
  double v17 = v12;
  double v18 = v14;
  result.size.double height = v18;
  result.size.double width = v17;
  result.origin.double y = v16;
  result.origin.double x = v15;
  return result;
}

- (CGRect)_sourceRectForPresentationInWindow:(id)a3
{
  double v3 = [(_UIFloatingTabBarPageButton *)self button];
  [v3 frame];
  double v5 = v4;
  double v7 = v6;
  double v9 = v8;
  double v11 = v10;

  double v12 = v5;
  double v13 = v7;
  double v14 = v9;
  double v15 = v11;
  result.size.double height = v15;
  result.size.double width = v14;
  result.origin.double y = v13;
  result.origin.double x = v12;
  return result;
}

- (UIButton)button
{
  return self->_button;
}

- (int64_t)direction
{
  return self->_direction;
}

- (void).cxx_destruct
{
}

@end