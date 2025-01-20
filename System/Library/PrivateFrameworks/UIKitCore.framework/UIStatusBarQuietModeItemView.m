@interface UIStatusBarQuietModeItemView
- (BOOL)updateForNewData:(id)a3 actions:(int)a4;
- (double)_visibleAlpha;
- (id)accessibilityHUDRepresentation;
- (void)_triggerAction:(id)a3;
- (void)animationDidStop:(id)a3 finished:(BOOL)a4;
- (void)dealloc;
- (void)setVisible:(BOOL)a3;
- (void)setVisible:(BOOL)a3 frame:(CGRect)a4 duration:(double)a5;
@end

@implementation UIStatusBarQuietModeItemView

- (void)dealloc
{
  v3 = [MEMORY[0x1E4F28EB8] defaultCenter];
  [v3 removeObserver:self name:@"_UIStatusBarActionChangeQuietMode" object:0];

  v4.receiver = self;
  v4.super_class = (Class)UIStatusBarQuietModeItemView;
  [(UIStatusBarItemView *)&v4 dealloc];
}

- (BOOL)updateForNewData:(id)a3 actions:(int)a4
{
  uint64_t v4 = *(void *)&a4;
  id v6 = a3;
  unsigned int v7 = *(unsigned __int8 *)([v6 rawData] + 2529);
  if (self->_inactive != v7 >> 7)
  {
    self->_inactive = v7 >> 7;
    [(UIStatusBarQuietModeItemView *)self setVisible:[(UIStatusBarItemView *)self isVisible]];
  }
  if (!self->_registeredForNotifications)
  {
    v8 = [MEMORY[0x1E4F28EB8] defaultCenter];
    [v8 addObserver:self selector:sel__triggerAction_ name:@"_UIStatusBarActionChangeQuietMode" object:0];

    self->_registeredForNotifications = 1;
  }
  self->_hideForAction = (v4 & 0x20) != 0;
  v11.receiver = self;
  v11.super_class = (Class)UIStatusBarQuietModeItemView;
  BOOL v9 = [(UIStatusBarItemView *)&v11 updateForNewData:v6 actions:v4];

  return v9;
}

- (void)animationDidStop:(id)a3 finished:(BOOL)a4
{
  if (self->_hideForAction)
  {
    -[UIView setAlpha:](self, "setAlpha:", a3, a4, 0.0);
  }
  else
  {
    v5 = [(UIView *)self layer];
    [v5 setMask:0];
  }
  [(UIStatusBarItemView *)self endDisablingRasterization];
}

- (void)_triggerAction:(id)a3
{
  uint64_t v4 = [a3 object];
  if ([(UIView *)self isDescendantOfView:v4])
  {
    [(UIStatusBarItemView *)self beginDisablingRasterization];
    BOOL hideForAction = self->_hideForAction;
    self->_BOOL hideForAction = !hideForAction;
    id v6 = +[UIImage kitImageNamed:@"Item_QuietModeAnimationMask.png"];
    unsigned int v7 = +[UIScreen mainScreen];
    [v7 scale];
    _UIGraphicsBeginImageContextWithOptions(0, 0, 14.0, 14.0, v8);

    BOOL v9 = +[UIColor blackColor];
    [v9 setFill];

    v37.origin.x = 0.0;
    v37.origin.y = 0.0;
    v37.size.width = 14.0;
    v37.size.height = 14.0;
    UIRectFillUsingBlendMode(v37, kCGBlendModeCopy);
    objc_msgSend(v6, "drawInRect:blendMode:alpha:", 23, 5.0, 0.0, 9.0, 9.0, 1.0);
    v10 = _UIGraphicsGetImageFromCurrentImageContext(0);

    UIGraphicsEndImageContext();
    objc_super v11 = [(UIStatusBarItemView *)self foregroundStyle];
    [v11 sizeForMoonMaskVisible:1];
    double v13 = v12 / 9.0;

    v14 = [(UIStatusBarItemView *)self foregroundStyle];
    [v14 sizeForMoonMaskVisible:0];
    double v16 = v15 / 9.0;

    if (hideForAction) {
      CGFloat v17 = v16;
    }
    else {
      CGFloat v17 = v13;
    }
    memset(&v36.m41, 0, 32);
    if (hideForAction) {
      CGFloat v18 = v13;
    }
    else {
      CGFloat v18 = v16;
    }
    memset(&v36, 0, 96);
    if (hideForAction) {
      v19 = @"Reveal Moon";
    }
    else {
      v19 = @"Hide Moon";
    }
    CATransform3DMakeScale(&v36, v18, v18, 1.0);
    v20 = [MEMORY[0x1E4F39B48] animationWithKeyPath:@"transform"];
    [v20 setDelegate:self];
    [v20 setDuration:0.5];
    v21 = (void *)MEMORY[0x1E4F29238];
    CATransform3DMakeScale(&v35, v17, v17, 1.0);
    v22 = [v21 valueWithCATransform3D:&v35];
    [v20 setFromValue:v22];

    CATransform3D v34 = v36;
    v23 = [MEMORY[0x1E4F29238] valueWithCATransform3D:&v34];
    [v20 setToValue:v23];

    v24 = [MEMORY[0x1E4F39BE8] layer];
    id v25 = v10;
    objc_msgSend(v24, "setContents:", objc_msgSend(v25, "CGImage"));
    [v25 scale];
    objc_msgSend(v24, "setContentsScale:");
    objc_msgSend(v24, "setAnchorPoint:", 1.0, 0.0);
    double v26 = *MEMORY[0x1E4F1DAD8];
    double v27 = *(double *)(MEMORY[0x1E4F1DAD8] + 8);
    [v25 size];
    objc_msgSend(v24, "setBounds:", v26, v27, v28, v29);
    v30 = [(UIStatusBarItemView *)self foregroundStyle];
    [(UIView *)self bounds];
    objc_msgSend(v30, "positionForMoonMaskInBounds:");
    objc_msgSend(v24, "setPosition:");

    CATransform3D v34 = v36;
    [v24 setTransform:&v34];
    [v24 addAnimation:v20 forKey:v19];
    v31 = [(UIView *)self layer];
    [v31 setMask:v24];

    v32[0] = MEMORY[0x1E4F143A8];
    v32[1] = 3221225472;
    v32[2] = __47__UIStatusBarQuietModeItemView__triggerAction___block_invoke;
    v32[3] = &unk_1E52D9FC0;
    v32[4] = self;
    BOOL v33 = hideForAction;
    +[UIView performWithoutAnimation:v32];
  }
}

uint64_t __47__UIStatusBarQuietModeItemView__triggerAction___block_invoke(uint64_t a1)
{
  [*(id *)(a1 + 32) setVisible:*(unsigned __int8 *)(a1 + 40)];
  v2 = *(void **)(a1 + 32);
  [v2 _visibleAlpha];
  return objc_msgSend(v2, "setAlpha:");
}

- (void)setVisible:(BOOL)a3 frame:(CGRect)a4 duration:(double)a5
{
  *(void *)&a3 = !self->_hideForAction && a3;
  v5.receiver = self;
  v5.super_class = (Class)UIStatusBarQuietModeItemView;
  -[UIStatusBarItemView setVisible:frame:duration:](&v5, sel_setVisible_frame_duration_, a3, a4.origin.x, a4.origin.y, a4.size.width, a4.size.height, a5);
}

- (double)_visibleAlpha
{
  double result = 0.3;
  if (!self->_inactive) {
    return 1.0;
  }
  return result;
}

- (void)setVisible:(BOOL)a3
{
  BOOL v3 = a3;
  v6.receiver = self;
  v6.super_class = (Class)UIStatusBarQuietModeItemView;
  -[UIStatusBarItemView setVisible:](&v6, sel_setVisible_);
  double v5 = 0.0;
  if (v3) {
    [(UIStatusBarQuietModeItemView *)self _visibleAlpha];
  }
  [(UIView *)self setAlpha:v5];
}

- (id)accessibilityHUDRepresentation
{
  BOOL v3 = [(UIStatusBarItemView *)self foregroundStyle];
  uint64_t v4 = [v3 accessibilityHUDImageNamed:@"QuietMode"];

  double v5 = -[UIAccessibilityHUDItem initWithTitle:image:imageInsets:scaleImage:]([UIAccessibilityHUDItem alloc], "initWithTitle:image:imageInsets:scaleImage:", 0, v4, 1, 0.0, 0.0, 0.0, 0.0);
  [(UIAccessibilityHUDItem *)v5 setDisabledAppearance:self->_inactive];

  return v5;
}

@end