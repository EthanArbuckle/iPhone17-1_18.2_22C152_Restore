@interface _TVSpinnerView
- (BOOL)isAnimating;
- (UIColor)color;
- (_TVSpinnerView)initWithFrame:(CGRect)a3;
- (_TVSpinnerView)initWithFrame:(CGRect)a3 color:(id)a4;
- (id)_spinnerImageForTraitCollection:(id)a3 size:(CGSize)a4 alpha:(double)a5;
- (void)_addAnimations;
- (void)_applicationDidBecomeActiveNotification:(id)a3;
- (void)_applicationWillResignActiveNotification:(id)a3;
- (void)_removeAnimations;
- (void)_updateImagesForTraitCollection:(id)a3;
- (void)dealloc;
- (void)didMoveToWindow;
- (void)startAnimating;
- (void)stopAnimating;
- (void)traitCollectionDidChange:(id)a3;
- (void)willMoveToWindow:(id)a3;
@end

@implementation _TVSpinnerView

- (_TVSpinnerView)initWithFrame:(CGRect)a3
{
  return -[_TVSpinnerView initWithFrame:color:](self, "initWithFrame:color:", 0, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
}

- (_TVSpinnerView)initWithFrame:(CGRect)a3 color:(id)a4
{
  double height = a3.size.height;
  double width = a3.size.width;
  double y = a3.origin.y;
  double x = a3.origin.x;
  id v10 = a4;
  v39.receiver = self;
  v39.super_class = (Class)_TVSpinnerView;
  v11 = -[_TVSpinnerView initWithFrame:](&v39, sel_initWithFrame_, x, y, width, height);
  v12 = v11;
  if (!v11) {
    goto LABEL_14;
  }
  p_color = (void **)&v11->_color;
  objc_storeStrong((id *)&v11->_color, a4);
  v14 = [MEMORY[0x263F1C5C0] currentDevice];
  if ([v14 _graphicsQuality] != 10) {
    goto LABEL_5;
  }
  v15 = *p_color;

  if (!v15)
  {
    uint64_t v16 = [MEMORY[0x263F1C550] colorWithRed:0.0 green:0.0 blue:0.0 alpha:0.6];
    v14 = *p_color;
    *p_color = (void *)v16;
LABEL_5:
  }
  v17 = *p_color;
  id v18 = objc_alloc(MEMORY[0x263F1CB60]);
  [(_TVSpinnerView *)v12 bounds];
  uint64_t v19 = objc_msgSend(v18, "initWithFrame:");
  spinnerContainer = v12->_spinnerContainer;
  v12->_spinnerContainer = (UIView *)v19;

  [(UIView *)v12->_spinnerContainer setAutoresizingMask:18];
  [(UIView *)v12->_spinnerContainer setContentMode:1];
  if (v17)
  {
    v40.origin.double x = x;
    v40.origin.double y = y;
    v40.size.double width = width;
    v40.size.double height = height;
    double v21 = CGRectGetWidth(v40);
    v41.origin.double x = x;
    v41.origin.double y = y;
    v41.size.double width = width;
    v41.size.double height = height;
    double v22 = CGRectGetHeight(v41);
    if (v21 >= v22) {
      double v22 = v21;
    }
    v23 = _TVCreateSpinnerImage(v10, v22);
    v24 = [(UIView *)v12->_spinnerContainer layer];
    id v25 = v23;
    objc_msgSend(v24, "setContents:", objc_msgSend(v25, "CGImage"));

    v26 = [(UIView *)v12->_spinnerContainer layer];
    [v25 scale];
    objc_msgSend(v26, "setContentsScale:");

    [(_TVSpinnerView *)v12 addSubview:v12->_spinnerContainer];
  }
  else
  {
    v27 = [(UIView *)v12->_spinnerContainer layer];
    [v27 setCompositingFilter:*MEMORY[0x263F15D40]];

    [(_TVSpinnerView *)v12 addSubview:v12->_spinnerContainer];
    id v28 = objc_alloc(MEMORY[0x263F1CB60]);
    [(_TVSpinnerView *)v12 bounds];
    uint64_t v29 = objc_msgSend(v28, "initWithFrame:");
    spinnerOverlayContainer = v12->_spinnerOverlayContainer;
    v12->_spinnerOverlayContainer = (UIView *)v29;

    [(UIView *)v12->_spinnerOverlayContainer setAutoresizingMask:18];
    [(UIView *)v12->_spinnerOverlayContainer setContentMode:1];
    v31 = [(_TVSpinnerView *)v12 traitCollection];
    uint64_t v32 = [v31 userInterfaceStyle];
    v33 = (id *)MEMORY[0x263F15D58];
    if (v32 != 2) {
      v33 = (id *)MEMORY[0x263F15D50];
    }
    id v34 = *v33;

    v35 = [(UIView *)v12->_spinnerOverlayContainer layer];
    [v35 setCompositingFilter:v34];

    [(_TVSpinnerView *)v12 addSubview:v12->_spinnerOverlayContainer];
    v36 = [(_TVSpinnerView *)v12 traitCollection];
    [(_TVSpinnerView *)v12 _updateImagesForTraitCollection:v36];

    id v25 = [(_TVSpinnerView *)v12 layer];
    [v25 setAllowsGroupOpacity:0];
    [v25 setAllowsGroupBlending:0];
    v37 = [MEMORY[0x263F08A00] defaultCenter];
    [v37 addObserver:v12 selector:sel__applicationDidBecomeActiveNotification_ name:*MEMORY[0x263F1D038] object:0];
    [v37 addObserver:v12 selector:sel__applicationWillResignActiveNotification_ name:*MEMORY[0x263F1D0D8] object:0];
  }
LABEL_14:

  return v12;
}

- (void)dealloc
{
  v3 = [MEMORY[0x263F08A00] defaultCenter];
  [v3 removeObserver:self name:*MEMORY[0x263F1D038] object:0];
  [v3 removeObserver:self name:*MEMORY[0x263F1D0D8] object:0];

  v4.receiver = self;
  v4.super_class = (Class)_TVSpinnerView;
  [(_TVSpinnerView *)&v4 dealloc];
}

- (void)willMoveToWindow:(id)a3
{
  v5.receiver = self;
  v5.super_class = (Class)_TVSpinnerView;
  -[_TVSpinnerView willMoveToWindow:](&v5, sel_willMoveToWindow_);
  if (!a3)
  {
    self->_shouldResumeAnimation = self->_animating;
    [(_TVSpinnerView *)self stopAnimating];
  }
}

- (void)didMoveToWindow
{
  v5.receiver = self;
  v5.super_class = (Class)_TVSpinnerView;
  [(_TVSpinnerView *)&v5 didMoveToWindow];
  v3 = [(_TVSpinnerView *)self window];
  if (v3)
  {
    BOOL shouldResumeAnimation = self->_shouldResumeAnimation;

    if (shouldResumeAnimation) {
      [(_TVSpinnerView *)self startAnimating];
    }
  }
}

- (void)traitCollectionDidChange:(id)a3
{
  id v4 = a3;
  v14.receiver = self;
  v14.super_class = (Class)_TVSpinnerView;
  [(_TVSpinnerView *)&v14 traitCollectionDidChange:v4];
  objc_super v5 = [(_TVSpinnerView *)self traitCollection];
  if (![v5 userInterfaceStyle])
  {
LABEL_6:

    goto LABEL_7;
  }
  uint64_t v6 = [v4 userInterfaceStyle];
  v7 = [(_TVSpinnerView *)self traitCollection];
  uint64_t v8 = [v7 userInterfaceStyle];

  if (v6 != v8)
  {
    v9 = [(_TVSpinnerView *)self traitCollection];
    [(_TVSpinnerView *)self _updateImagesForTraitCollection:v9];

    id v10 = [(_TVSpinnerView *)self traitCollection];
    uint64_t v11 = [v10 userInterfaceStyle];
    v12 = (id *)MEMORY[0x263F15D58];
    if (v11 != 2) {
      v12 = (id *)MEMORY[0x263F15D50];
    }
    id v13 = *v12;

    objc_super v5 = [(UIView *)self->_spinnerOverlayContainer layer];
    [v5 setCompositingFilter:v13];

    goto LABEL_6;
  }
LABEL_7:
}

- (void)_applicationDidBecomeActiveNotification:(id)a3
{
  id v4 = [(_TVSpinnerView *)self window];
  if (v4)
  {
    BOOL shouldResumeAnimation = self->_shouldResumeAnimation;

    if (shouldResumeAnimation)
    {
      [(_TVSpinnerView *)self startAnimating];
    }
  }
}

- (void)_applicationWillResignActiveNotification:(id)a3
{
  id v4 = [(_TVSpinnerView *)self window];

  if (v4)
  {
    self->_BOOL shouldResumeAnimation = self->_animating;
    [(_TVSpinnerView *)self stopAnimating];
  }
}

- (void)startAnimating
{
  if (!self->_animating)
  {
    v3 = [(_TVSpinnerView *)self window];

    if (v3)
    {
      self->_animating = 1;
      [(_TVSpinnerView *)self _addAnimations];
    }
    else
    {
      self->_BOOL shouldResumeAnimation = 1;
    }
  }
}

- (void)stopAnimating
{
  if (self->_animating)
  {
    self->_animating = 0;
    [(_TVSpinnerView *)self _removeAnimations];
  }
}

- (id)_spinnerImageForTraitCollection:(id)a3 size:(CGSize)a4 alpha:(double)a5
{
  double height = a4.height;
  double width = a4.width;
  id v8 = a3;
  if ([v8 userInterfaceStyle] == 2
    || (v9 = [v8 userInterfaceStyle], double v10 = 0.0, v9 == 1000))
  {
    double v10 = 1.0;
  }
  if (width >= height) {
    double height = width;
  }
  uint64_t v11 = [MEMORY[0x263F1C550] colorWithWhite:v10 alpha:a5];
  v12 = _TVCreateSpinnerImage(v11, height);

  return v12;
}

- (void)_updateImagesForTraitCollection:(id)a3
{
  id v4 = a3;
  [(_TVSpinnerView *)self frame];
  v7 = -[_TVSpinnerView _spinnerImageForTraitCollection:size:alpha:](self, "_spinnerImageForTraitCollection:size:alpha:", v4, v5, v6, 0.75);
  id v8 = [(UIView *)self->_spinnerContainer layer];
  id v16 = v7;
  objc_msgSend(v8, "setContents:", objc_msgSend(v16, "CGImage"));

  uint64_t v9 = [(UIView *)self->_spinnerContainer layer];
  [v16 scale];
  objc_msgSend(v9, "setContentsScale:");

  [(_TVSpinnerView *)self frame];
  v12 = -[_TVSpinnerView _spinnerImageForTraitCollection:size:alpha:](self, "_spinnerImageForTraitCollection:size:alpha:", v4, v10, v11, 0.3);

  id v13 = [(UIView *)self->_spinnerOverlayContainer layer];
  id v14 = v12;
  objc_msgSend(v13, "setContents:", objc_msgSend(v14, "CGImage"));

  v15 = [(UIView *)self->_spinnerOverlayContainer layer];
  [v14 scale];
  objc_msgSend(v15, "setContentsScale:");
}

- (void)_addAnimations
{
  v18[2] = *MEMORY[0x263EF8340];
  v3 = [(_TVSpinnerView *)self layer];
  id v4 = [v3 animationForKey:@"repeatingGroupAnimation"];

  if (!v4)
  {
    [(_TVSpinnerView *)self setAlpha:0.0];
    v17[0] = MEMORY[0x263EF8330];
    v17[1] = 3221225472;
    v17[2] = __32___TVSpinnerView__addAnimations__block_invoke;
    v17[3] = &unk_264BA69A0;
    v17[4] = self;
    [MEMORY[0x263F1CB60] animateWithDuration:4 delay:v17 options:&__block_literal_global_25 animations:0.5 completion:0.0];
    double v5 = [MEMORY[0x263F15760] animation];
    [v5 setKeyPath:@"opacity"];
    [v5 setDuration:0.0833333333];
    LODWORD(v6) = 2139095040;
    [v5 setRepeatCount:v6];
    v7 = [MEMORY[0x263F15808] functionWithName:*MEMORY[0x263F15EB8]];
    [v5 setTimingFunction:v7];

    [v5 setFromValue:&unk_26E59EC58];
    [v5 setToValue:&unk_26E59EC68];
    id v8 = [MEMORY[0x263F157D8] animation];
    uint64_t v9 = (void *)[objc_alloc(MEMORY[0x263EFF980]) initWithCapacity:12];
    uint64_t v10 = -30;
    do
    {
      v10 += 30;
      double v11 = [NSNumber numberWithDouble:(double)v10 * 0.0174532925];
      [v9 addObject:v11];
    }
    while ((unint64_t)v10 < 0x14A);
    [v8 setKeyPath:@"transform.rotation.z"];
    [v8 setValues:v9];
    [v8 setCalculationMode:@"discrete"];
    LODWORD(v12) = 2139095040;
    [v8 setRepeatCount:v12];
    [v8 setDuration:1.0];
    id v13 = [MEMORY[0x263F15750] animation];
    v18[0] = v5;
    v18[1] = v8;
    id v14 = [MEMORY[0x263EFF8C0] arrayWithObjects:v18 count:2];
    [v13 setAnimations:v14];

    [v13 setDuration:1.0e100];
    [MEMORY[0x263F158F8] begin];
    v15 = [(UIView *)self->_spinnerContainer layer];
    [v15 addAnimation:v13 forKey:@"repeatingGroupAnimation"];

    id v16 = [(UIView *)self->_spinnerOverlayContainer layer];
    [v16 addAnimation:v13 forKey:@"repeatingGroupAnimation"];

    [MEMORY[0x263F158F8] commit];
  }
}

- (void)_removeAnimations
{
  v3[0] = MEMORY[0x263EF8330];
  v3[1] = 3221225472;
  v3[2] = __35___TVSpinnerView__removeAnimations__block_invoke;
  v3[3] = &unk_264BA69A0;
  v3[4] = self;
  v2[0] = MEMORY[0x263EF8330];
  v2[1] = 3221225472;
  v2[2] = __35___TVSpinnerView__removeAnimations__block_invoke_2;
  v2[3] = &unk_264BA6D78;
  v2[4] = self;
  [MEMORY[0x263F1CB60] animateWithDuration:4 delay:v3 options:v2 animations:0.5 completion:0.0];
}

- (BOOL)isAnimating
{
  return self->_animating;
}

- (UIColor)color
{
  return self->_color;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_color, 0);
  objc_storeStrong((id *)&self->_spinnerOverlayContainer, 0);
  objc_storeStrong((id *)&self->_spinnerContainer, 0);
}

@end