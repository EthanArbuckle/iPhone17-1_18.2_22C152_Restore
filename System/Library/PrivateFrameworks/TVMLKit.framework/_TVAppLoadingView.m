@interface _TVAppLoadingView
+ (id)loadingScreen;
- (BOOL)isVisible;
- (UIActivityIndicatorView)spinner;
- (_TVAppLoadingView)initWithFrame:(CGRect)a3 templateImage:(id)a4;
- (double)hideAnimationDuration;
- (void)didRotate:(id)a3;
- (void)hide;
- (void)setLoadingDelay:(double)a3;
- (void)setSpinner:(id)a3;
- (void)setTimeout:(double)a3;
- (void)showOverKeyWindow;
- (void)showOverKeyWindowWithSpinnerOnly:(BOOL)a3;
- (void)timeout;
@end

@implementation _TVAppLoadingView

+ (id)loadingScreen
{
  if (loadingScreen_onceToken != -1) {
    dispatch_once(&loadingScreen_onceToken, &__block_literal_global_14);
  }
  v2 = (void *)loadingScreen_loadingScreen;
  return v2;
}

- (void)setTimeout:(double)a3
{
  self->_timeout = a3;
}

- (void)setLoadingDelay:(double)a3
{
  self->_delay = a3;
}

- (void)showOverKeyWindow
{
}

- (void)showOverKeyWindowWithSpinnerOnly:(BOOL)a3
{
  [(UIImageView *)self->_maskView setHidden:a3];
  if (!self->_overlayWindow)
  {
    v4 = [_TVLoadingOverlayWindow alloc];
    [(_TVAppLoadingView *)self bounds];
    v5 = -[_TVLoadingOverlayWindow initWithFrame:](v4, "initWithFrame:");
    overlayWindow = self->_overlayWindow;
    self->_overlayWindow = v5;

    [(UIWindow *)self->_overlayWindow setWindowLevel:*MEMORY[0x263F1D810]];
    v7 = self->_overlayWindow;
    id v8 = objc_alloc_init(MEMORY[0x263F1CB68]);
    [(UIWindow *)v7 setRootViewController:v8];

    v9 = [(UIWindow *)self->_overlayWindow layer];
    v10 = [v9 superlayer];
    [v10 setAllowsGroupOpacity:0];

    v11 = [(UIWindow *)self->_overlayWindow layer];
    [v11 setAllowsGroupOpacity:0];

    [(UIWindow *)self->_overlayWindow setBackgroundColor:0];
  }
  v12 = [MEMORY[0x263F1C408] sharedApplication];
  v13 = [v12 keyWindow];

  v14 = [(_TVAppLoadingView *)self superview];
  char v15 = [v14 isEqual:v13];

  if ((v15 & 1) == 0)
  {
    [(UIWindow *)self->_overlayWindow setHidden:0];
    v16 = [(UIWindow *)self->_overlayWindow rootViewController];
    [v16 setView:self];

    [(UIView *)self->_wallpaperView setAlpha:1.0];
    [(_TVAppLoadingView *)self setAlpha:1.0];
    [(UIImageView *)self->_maskView setAlpha:1.0];
    [(UIVisualEffectView *)self->_visualEffectView _setTintOpacity:1.0];
    [(UIActivityIndicatorView *)self->_spinner setAlpha:0.0];
    v26[0] = MEMORY[0x263EF8330];
    v26[1] = 3221225472;
    v26[2] = __54___TVAppLoadingView_showOverKeyWindowWithSpinnerOnly___block_invoke;
    v26[3] = &unk_264BA6FE8;
    v26[4] = self;
    uint64_t v17 = MEMORY[0x230FC9DC0](v26);
    v18 = (void *)v17;
    double delay = self->_delay;
    if (delay == 0.0)
    {
      (*(void (**)(uint64_t, double))(v17 + 16))(v17, 0.2);
    }
    else
    {
      dispatch_time_t v20 = dispatch_time(0, (uint64_t)(delay * 1000000000.0));
      uint64_t v21 = MEMORY[0x263EF8330];
      uint64_t v22 = 3221225472;
      v23 = __54___TVAppLoadingView_showOverKeyWindowWithSpinnerOnly___block_invoke_3;
      v24 = &unk_264BA68A0;
      id v25 = v18;
      dispatch_after(v20, MEMORY[0x263EF83A0], &v21);
    }
    -[_TVAppLoadingView performSelector:withObject:afterDelay:](self, "performSelector:withObject:afterDelay:", sel_timeout, 0, self->_timeout, v21, v22, v23, v24);
  }
}

- (void)timeout
{
  if ([(_TVAppLoadingView *)self isVisible])
  {
    v3 = TVMLKitLogObject;
    if (os_log_type_enabled((os_log_t)TVMLKitLogObject, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v4 = 0;
      _os_log_impl(&dword_230B4C000, v3, OS_LOG_TYPE_DEFAULT, "_TVAppLoadingView timed out, hiding", v4, 2u);
    }
    [(_TVAppLoadingView *)self hide];
  }
}

- (void)hide
{
  if ([(_TVAppLoadingView *)self isVisible])
  {
    if (!self->_hiding)
    {
      [MEMORY[0x263F8C6D0] cancelPreviousPerformRequestsWithTarget:self selector:sel_timeout object:0];
      self->_hiding = 1;
      self->_double delay = 0.0;
      v4[0] = MEMORY[0x263EF8330];
      v4[1] = 3221225472;
      v4[2] = __25___TVAppLoadingView_hide__block_invoke;
      v4[3] = &unk_264BA69A0;
      v4[4] = self;
      v3[0] = MEMORY[0x263EF8330];
      v3[1] = 3221225472;
      v3[2] = __25___TVAppLoadingView_hide__block_invoke_2;
      v3[3] = &unk_264BA6D78;
      v3[4] = self;
      [MEMORY[0x263F1CB60] animateWithDuration:6 delay:v4 options:v3 animations:0.6 completion:0.0];
    }
  }
}

- (BOOL)isVisible
{
  [(_TVAppLoadingView *)self alpha];
  return v2 >= 1.0;
}

- (double)hideAnimationDuration
{
  return 0.6;
}

- (_TVAppLoadingView)initWithFrame:(CGRect)a3 templateImage:(id)a4
{
  double height = a3.size.height;
  double width = a3.size.width;
  double y = a3.origin.y;
  double x = a3.origin.x;
  id v9 = a4;
  v10 = -[_TVAppLoadingView initWithFrame:](self, "initWithFrame:", x, y, width, height);
  v11 = v10;
  if (v10)
  {
    [(_TVAppLoadingView *)v10 bounds];
    double v13 = v12;
    double v15 = v14;
    double v17 = v16;
    double v19 = v18;
    dispatch_time_t v20 = v11;
    uint64_t v21 = [v20 layer];
    [v21 setAllowsGroupOpacity:0];
    [v21 setAllowsGroupBlending:0];
    if (v9)
    {
      uint64_t v22 = (void *)MEMORY[0x263F1CB58];
      v23 = [MEMORY[0x263F1C480] effectWithStyle:1000];
      v24 = [v22 effectForBlurEffect:v23];

      id v25 = [[_TVVisualEffectView alloc] initWithEffect:v24];
      id v26 = v20[57];
      v20[57] = v25;

      [v20[57] setAutoresizingMask:18];
      objc_msgSend(v20[57], "setFrame:", v13, v15, v17, v19);
      id v27 = objc_alloc(MEMORY[0x263F1C6D0]);
      v28 = [v9 imageWithRenderingMode:2];
      uint64_t v29 = [v27 initWithImage:v28];
      id v30 = v20[56];
      v20[56] = (id)v29;

      v31 = [v20[57] contentView];
      [v31 addSubview:v20[56]];

      v32 = [v20[56] layer];
      [v32 setAllowsGroupOpacity:0];

      [v20 addSubview:v20[57]];
      v33 = [v20[57] contentView];
    }
    else
    {
      v33 = v20;
    }
    v34 = [MEMORY[0x263F1C550] grayColor];
    v35 = [MEMORY[0x263F08A00] defaultCenter];
    uint64_t v36 = *MEMORY[0x263F1D838];
    v37 = [(id)*MEMORY[0x263F1D020] keyWindow];
    [v35 addObserver:v20 selector:sel_didRotate_ name:v36 object:v37];

    [MEMORY[0x263F1C3D8] defaultSizeForStyle:100];
    UIRectCenteredIntegralRect();
    double v39 = v38;
    double v41 = v40;
    double v43 = v42;
    double v45 = v44;
    uint64_t v46 = [objc_alloc(MEMORY[0x263F1C3D8]) initWithActivityIndicatorStyle:100];
    id v47 = v20[58];
    v20[58] = (id)v46;

    if (v34) {
      [v20[58] setColor:v34];
    }
    if (v9) {
      double v48 = v41 + 50.0;
    }
    else {
      double v48 = v41;
    }
    objc_msgSend(v20[58], "setFrame:", v39, v48, v43, v45);
    [v33 addSubview:v20[58]];
    [v20[58] startAnimating];
  }
  return v11;
}

- (void)didRotate:(id)a3
{
  [(UIActivityIndicatorView *)self->_spinner frame];
  v4 = [(id)*MEMORY[0x263F1D020] keyWindow];
  [v4 frame];
  UIRectCenteredIntegralRect();
  double v6 = v5;
  double v8 = v7;
  double v10 = v9;
  double v12 = v11;

  double v13 = [(UIImageView *)self->_maskView image];

  spinner = self->_spinner;
  if (v13) {
    double v15 = v8 + 50.0;
  }
  else {
    double v15 = v8;
  }
  -[UIActivityIndicatorView setFrame:](spinner, "setFrame:", v6, v15, v10, v12);
}

- (UIActivityIndicatorView)spinner
{
  return self->_spinner;
}

- (void)setSpinner:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_spinner, 0);
  objc_storeStrong((id *)&self->_visualEffectView, 0);
  objc_storeStrong((id *)&self->_maskView, 0);
  objc_storeStrong((id *)&self->_overlayWindow, 0);
  objc_storeStrong((id *)&self->_wallpaperView, 0);
}

@end