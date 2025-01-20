@interface WGCircleCheckView
- (BOOL)_isFrozen;
- (BOOL)isChecked;
- (CGSize)sizeThatFits:(CGSize)a3;
- (UIImageView)_circleView;
- (WGCheckView)_checkView;
- (WGCircleCheckView)initWithFrame:(CGRect)a3;
- (id)_configureCircleViewIfNecessary;
- (void)_configureCheckViewIfNecessary;
- (void)_setChecked:(BOOL)a3 completion:(id)a4;
- (void)_setFrozen:(BOOL)a3;
- (void)layoutSubviews;
- (void)setCheckView:(id)a3;
- (void)setChecked:(BOOL)a3;
- (void)setCircleView:(id)a3;
@end

@implementation WGCircleCheckView

- (WGCircleCheckView)initWithFrame:(CGRect)a3
{
  v6.receiver = self;
  v6.super_class = (Class)WGCircleCheckView;
  v3 = -[WGCircleCheckView initWithFrame:](&v6, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  v4 = v3;
  if (v3) {
    [(WGCircleCheckView *)v3 setUserInteractionEnabled:0];
  }
  return v4;
}

- (BOOL)isChecked
{
  if ([(WGCircleCheckView *)self _isFrozen]) {
    return 1;
  }
  checkView = self->_checkView;
  return [(WGCheckView *)checkView isChecked];
}

- (void)setChecked:(BOOL)a3
{
  BOOL v3 = a3;
  objc_initWeak(&location, self);
  if (v3 && ([MEMORY[0x263F1CB60] _isInAnimationBlock] & 1) == 0)
  {
    [(WGCircleCheckView *)self _setFrozen:1];
  }
  else
  {
    v5[0] = MEMORY[0x263EF8330];
    v5[1] = 3221225472;
    v5[2] = __32__WGCircleCheckView_setChecked___block_invoke;
    v5[3] = &unk_264677398;
    BOOL v7 = v3;
    objc_copyWeak(&v6, &location);
    [(WGCircleCheckView *)self _setChecked:v3 completion:v5];
    objc_destroyWeak(&v6);
  }
  objc_destroyWeak(&location);
}

void __32__WGCircleCheckView_setChecked___block_invoke(uint64_t a1, int a2)
{
  if (*(unsigned char *)(a1 + 40)) {
    BOOL v2 = a2 == 0;
  }
  else {
    BOOL v2 = 1;
  }
  if (!v2)
  {
    id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
    [WeakRetained _setFrozen:1];
  }
}

- (CGSize)sizeThatFits:(CGSize)a3
{
  double v3 = 20.0;
  double v4 = 20.0;
  result.height = v4;
  result.width = v3;
  return result;
}

- (void)layoutSubviews
{
  double v3 = [(WGCircleCheckView *)self layer];
  double v4 = [v3 contents];

  if (!v4)
  {
    id v5 = [(WGCircleCheckView *)self _configureCircleViewIfNecessary];
    [(WGCircleCheckView *)self _configureCheckViewIfNecessary];
    [(WGCircleCheckView *)self bounds];
    double v7 = v6;
    double v9 = v8;
    double v11 = v10;
    double v13 = v12;
    -[UIImageView setFrame:](self->_circleView, "setFrame:");
    checkView = self->_checkView;
    -[WGCheckView setFrame:](checkView, "setFrame:", v7, v9, v11, v13);
  }
}

- (id)_configureCircleViewIfNecessary
{
  circleView = self->_circleView;
  if (!circleView)
  {
    double v4 = +[WGMappedImageCache sharedCache];
    id v5 = NSString;
    double v6 = (objc_class *)objc_opt_class();
    double v7 = NSStringFromClass(v6);
    double v8 = [v5 stringWithFormat:@"%@.circle", v7];
    double v9 = [v4 imageForKey:v8 generatingIfNecessaryWithBlock:&__block_literal_global_8];

    double v10 = (UIImageView *)[objc_alloc(MEMORY[0x263F1C6D0]) initWithImage:v9];
    double v11 = self->_circleView;
    self->_circleView = v10;

    [(UIImageView *)self->_circleView setHidden:1];
    [(WGCircleCheckView *)self addSubview:self->_circleView];
    [(WGCircleCheckView *)self sendSubviewToBack:self->_circleView];

    circleView = self->_circleView;
  }
  return circleView;
}

CGContext *__52__WGCircleCheckView__configureCircleViewIfNecessary__block_invoke()
{
  double v0 = _WGMainScreenScale();
  v7.width = 20.0;
  v7.height = 20.0;
  UIGraphicsBeginImageContextWithOptions(v7, 0, v0);
  CurrentContext = UIGraphicsGetCurrentContext();
  if (CurrentContext)
  {
    BOOL v2 = CurrentContext;
    BSRectWithSize();
    double v3 = CGPathCreateWithEllipseInRect(v8, 0);
    CGContextAddPath(v2, v3);
    CGPathRelease(v3);
    double v4 = [MEMORY[0x263F1C550] colorWithWhite:0.0 alpha:0.35];
    [v4 setFill];

    CGContextFillPath(v2);
    UIGraphicsGetImageFromCurrentImageContext();
    CurrentContext = (CGContext *)objc_claimAutoreleasedReturnValue();
  }
  return CurrentContext;
}

- (void)_configureCheckViewIfNecessary
{
  if (!self->_checkView)
  {
    double v3 = objc_alloc_init(WGCheckView);
    checkView = self->_checkView;
    self->_checkView = v3;

    [(WGCircleCheckView *)self addSubview:self->_checkView];
    id v5 = self->_checkView;
    [(WGCircleCheckView *)self bringSubviewToFront:v5];
  }
}

- (void)_setChecked:(BOOL)a3 completion:(id)a4
{
  BOOL v4 = a3;
  id v6 = a4;
  if ([(WGCircleCheckView *)self isChecked] != v4)
  {
    if (v4)
    {
      if ([MEMORY[0x263F1CB60] _isInAnimationBlock])
      {
        v22[0] = MEMORY[0x263EF8330];
        v22[1] = 3221225472;
        v22[2] = __44__WGCircleCheckView__setChecked_completion___block_invoke;
        v22[3] = &unk_264676588;
        v22[4] = self;
        [MEMORY[0x263F1CB60] performWithoutAnimation:v22];
        CGSize v7 = dispatch_group_create();
        [MEMORY[0x263F1CB60] inheritedAnimationDuration];
        double v9 = v8;
        dispatch_group_enter(v7);
        double v10 = (void *)MEMORY[0x263F1CB60];
        v21[0] = MEMORY[0x263EF8330];
        v21[1] = 3221225472;
        v21[2] = __44__WGCircleCheckView__setChecked_completion___block_invoke_2;
        v21[3] = &unk_264676588;
        v21[4] = self;
        v19[0] = MEMORY[0x263EF8330];
        v19[1] = 3221225472;
        v19[2] = __44__WGCircleCheckView__setChecked_completion___block_invoke_3;
        v19[3] = &unk_2646773E0;
        double v11 = v7;
        v20 = v11;
        [v10 _animateUsingSpringWithDuration:0 delay:v21 options:v19 mass:v9 stiffness:v9 * 0.5 damping:3.0 initialVelocity:1560.0 animations:600.0 completion:0.0];
        dispatch_group_enter(v11);
        double v12 = (void *)MEMORY[0x263F1CB60];
        v18[0] = MEMORY[0x263EF8330];
        v18[1] = 3221225472;
        v18[2] = __44__WGCircleCheckView__setChecked_completion___block_invoke_4;
        v18[3] = &unk_264676588;
        v18[4] = self;
        v16[0] = MEMORY[0x263EF8330];
        v16[1] = 3221225472;
        v16[2] = __44__WGCircleCheckView__setChecked_completion___block_invoke_5;
        v16[3] = &unk_2646773E0;
        double v13 = v11;
        v17 = v13;
        [v12 _animateUsingSpringWithDuration:0 delay:v18 options:v16 mass:v9 stiffness:v9 + 0.01 damping:3.0 initialVelocity:1560.0 animations:600.0 completion:0.0];
        if (v6)
        {
          v14[0] = MEMORY[0x263EF8330];
          v14[1] = 3221225472;
          v14[2] = __44__WGCircleCheckView__setChecked_completion___block_invoke_6;
          v14[3] = &unk_2646768C8;
          id v15 = v6;
          dispatch_group_notify(v13, MEMORY[0x263EF83A0], v14);
        }
        goto LABEL_13;
      }
      [(WGCircleCheckView *)self layoutIfNeeded];
      [(UIImageView *)self->_circleView setHidden:0];
      [(WGCheckView *)self->_checkView setChecked:1];
      if (!v6) {
        goto LABEL_13;
      }
    }
    else
    {
      [(WGCircleCheckView *)self _setFrozen:0];
      if (!v6) {
        goto LABEL_13;
      }
    }
    (*((void (**)(id, uint64_t))v6 + 2))(v6, 1);
    goto LABEL_13;
  }
  if (v6) {
    (*((void (**)(id, void))v6 + 2))(v6, 0);
  }
LABEL_13:
}

uint64_t __44__WGCircleCheckView__setChecked_completion___block_invoke(uint64_t a1)
{
  [*(id *)(a1 + 32) layoutIfNeeded];
  BOOL v2 = *(void **)(*(void *)(a1 + 32) + 408);
  CGAffineTransformMakeScale(&v4, 0.0, 0.0);
  [v2 setTransform:&v4];
  return [*(id *)(*(void *)(a1 + 32) + 408) setHidden:0];
}

uint64_t __44__WGCircleCheckView__setChecked_completion___block_invoke_2(uint64_t a1)
{
  v1 = *(void **)(*(void *)(a1 + 32) + 408);
  long long v2 = *(_OWORD *)(MEMORY[0x263F000D0] + 16);
  v4[0] = *MEMORY[0x263F000D0];
  v4[1] = v2;
  v4[2] = *(_OWORD *)(MEMORY[0x263F000D0] + 32);
  return [v1 setTransform:v4];
}

void __44__WGCircleCheckView__setChecked_completion___block_invoke_3(uint64_t a1)
{
}

uint64_t __44__WGCircleCheckView__setChecked_completion___block_invoke_4(uint64_t a1)
{
  return [*(id *)(*(void *)(a1 + 32) + 416) setChecked:1];
}

void __44__WGCircleCheckView__setChecked_completion___block_invoke_5(uint64_t a1)
{
}

uint64_t __44__WGCircleCheckView__setChecked_completion___block_invoke_6(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (BOOL)_isFrozen
{
  long long v2 = [(WGCircleCheckView *)self layer];
  double v3 = [v2 contents];
  BOOL v4 = v3 != 0;

  return v4;
}

- (void)_setFrozen:(BOOL)a3
{
  BOOL v3 = a3;
  if ([(WGCircleCheckView *)self _isFrozen] != a3)
  {
    if (v3)
    {
      objc_initWeak(&location, self);
      id v5 = +[WGMappedImageCache sharedCache];
      id v6 = NSString;
      CGSize v7 = (objc_class *)objc_opt_class();
      double v8 = NSStringFromClass(v7);
      double v9 = [v6 stringWithFormat:@"%@.composite", v8];
      v15[0] = MEMORY[0x263EF8330];
      v15[1] = 3221225472;
      v15[2] = __32__WGCircleCheckView__setFrozen___block_invoke;
      v15[3] = &unk_264677408;
      objc_copyWeak(&v16, &location);
      double v10 = [v5 imageForKey:v9 generatingIfNecessaryWithBlock:v15];

      if (v10)
      {
        double v11 = [(WGCircleCheckView *)self layer];
        objc_msgSend(v11, "setContents:", objc_msgSend(v10, "CGImage"));

        [(UIImageView *)self->_circleView removeFromSuperview];
        circleView = self->_circleView;
        self->_circleView = 0;

        [(WGCheckView *)self->_checkView removeFromSuperview];
        checkView = self->_checkView;
        self->_checkView = 0;
      }
      objc_destroyWeak(&v16);
      objc_destroyWeak(&location);
    }
    else
    {
      v14 = [(WGCircleCheckView *)self layer];
      [v14 setContents:0];

      [(WGCircleCheckView *)self setNeedsLayout];
    }
  }
}

id __32__WGCircleCheckView__setFrozen___block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained _setChecked:1 completion:0];
  long long v2 = [WeakRetained _circleView];
  BOOL v3 = [v2 image];

  [v3 size];
  CGFloat v5 = v4;
  CGFloat v7 = v6;
  double v8 = _WGMainScreenScale();
  v14.width = v5;
  v14.height = v7;
  UIGraphicsBeginImageContextWithOptions(v14, 0, v8);
  CurrentContext = UIGraphicsGetCurrentContext();
  if (CurrentContext)
  {
    objc_msgSend(v3, "drawAtPoint:", *MEMORY[0x263F00148], *(double *)(MEMORY[0x263F00148] + 8));
    double v10 = [WeakRetained _checkView];
    double v11 = [v10 layer];
    [v11 renderInContext:CurrentContext];

    CurrentContext = UIGraphicsGetImageFromCurrentImageContext();
  }

  return CurrentContext;
}

- (UIImageView)_circleView
{
  return self->_circleView;
}

- (void)setCircleView:(id)a3
{
}

- (WGCheckView)_checkView
{
  return self->_checkView;
}

- (void)setCheckView:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_checkView, 0);
  objc_storeStrong((id *)&self->_circleView, 0);
}

@end