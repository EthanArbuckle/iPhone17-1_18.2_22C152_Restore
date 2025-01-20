@interface VUIAppLoadingView
+ (id)loadingScreen;
- (BOOL)isVisible;
- (VUIActivityIndicatorView)spinner;
- (VUIAppLoadingView)initWithFrame:(CGRect)a3 templateImage:(id)a4;
- (double)hideAnimationDuration;
- (void)didRotate:(id)a3;
- (void)hide;
- (void)hideImmediately;
- (void)setLoadingDelay:(double)a3;
- (void)setSpinner:(id)a3;
- (void)setTimeout:(double)a3;
- (void)showOverKeyWindow;
- (void)showOverKeyWindowWithSpinnerOnly:(BOOL)a3;
- (void)timeout;
@end

@implementation VUIAppLoadingView

uint64_t __54__VUIAppLoadingView_showOverKeyWindowWithSpinnerOnly___block_invoke_2(uint64_t a1)
{
  [*(id *)(*(void *)(a1 + 32) + 464) startAnimating];
  v2 = *(void **)(*(void *)(a1 + 32) + 464);
  return [v2 setAlpha:1.0];
}

void __34__VUIAppLoadingView_loadingScreen__block_invoke()
{
  id v11 = [MEMORY[0x1E4F28B50] mainBundle];
  v0 = (void *)MEMORY[0x1E4FB1818];
  v1 = [MEMORY[0x1E4FB1E20] traitCollectionWithUserInterfaceIdiom:2];
  v2 = [v0 imageNamed:@"LaunchImage" inBundle:v11 compatibleWithTraitCollection:v1];

  v3 = [v11 objectForInfoDictionaryKey:@"UITemplateLaunchImage"];
  int v4 = [v3 BOOLValue];

  v5 = [VUIAppLoadingView alloc];
  v6 = objc_msgSend(MEMORY[0x1E4FB1F48], "vui_keyWindow");
  [v6 bounds];
  if (v4) {
    v7 = v2;
  }
  else {
    v7 = 0;
  }
  uint64_t v8 = -[VUIAppLoadingView initWithFrame:templateImage:](v5, "initWithFrame:templateImage:", v7);
  v9 = (void *)loadingScreen_loadingScreen;
  loadingScreen_loadingScreen = v8;

  uint64_t v10 = loadingScreen_loadingScreen;
  *(void *)(loadingScreen_loadingScreen + 432) = 0x4024000000000000;
  *(void *)(v10 + 440) = 0;
}

- (VUIAppLoadingView)initWithFrame:(CGRect)a3 templateImage:(id)a4
{
  double height = a3.size.height;
  double width = a3.size.width;
  double y = a3.origin.y;
  double x = a3.origin.x;
  id v9 = a4;
  uint64_t v10 = -[VUIAppLoadingView initWithFrame:](self, "initWithFrame:", x, y, width, height);
  id v11 = v10;
  if (v10)
  {
    [(VUIAppLoadingView *)v10 bounds];
    double v13 = v12;
    double v15 = v14;
    double v17 = v16;
    double v19 = v18;
    v20 = v11;
    v21 = [v20 layer];
    [v21 setAllowsGroupOpacity:0];
    [v21 setAllowsGroupBlending:0];
    v22 = v20;
    if (v9)
    {
      v23 = (void *)MEMORY[0x1E4FB1EA0];
      v24 = [MEMORY[0x1E4FB14C8] effectWithStyle:1000];
      v25 = [v23 effectForBlurEffect:v24];

      uint64_t v26 = [objc_alloc(MEMORY[0x1E4FB1F00]) initWithEffect:v25];
      id v27 = v20[57];
      v20[57] = (id)v26;

      [v20[57] setAutoresizingMask:18];
      objc_msgSend(v20[57], "setFrame:", v13, v15, v17, v19);
      v28 = (void *)MEMORY[0x1E4FB1838];
      v29 = [v9 vuiTemplateImage];
      uint64_t v30 = objc_msgSend(v28, "vui_imageViewWithImage:", v29);
      id v31 = v20[56];
      v20[56] = (id)v30;

      v32 = [v20[57] contentView];
      [v32 addSubview:v20[56]];

      v33 = [v20[56] layer];
      [v33 setAllowsGroupOpacity:0];

      id v34 = v20[56];
      [v20[57] bounds];
      objc_msgSend(v34, "setFrame:");
      [v20 addSubview:v20[57]];
      v22 = [v20[57] contentView];
    }
    v35 = [MEMORY[0x1E4FB1618] grayColor];
    v36 = [MEMORY[0x1E4F28EB8] defaultCenter];
    uint64_t v37 = *MEMORY[0x1E4FB3140];
    v38 = [(id)*MEMORY[0x1E4FB2608] keyWindow];
    [v36 addObserver:v20 selector:sel_didRotate_ name:v37 object:v38];

    uint64_t v39 = +[VUIActivityIndicatorView vui_activityIndicatorViewWithActivityIndicatorStyle:0];
    id v40 = v20[58];
    v20[58] = (id)v39;

    if (v35) {
      [v20[58] setColor:v35];
    }
    [v20[58] sizeToFit];
    [v20[58] bounds];
    double v42 = round(v13 + (v17 - v41) * 0.5);
    double v44 = round(v15 + (v19 - v43) * 0.5);
    if (v9) {
      double v44 = v44 + 50.0;
    }
    objc_msgSend(v20[58], "setFrame:", v42, v44);
    [v22 addSubview:v20[58]];
    objc_msgSend(v20[58], "vui_startAnimating");
  }
  return v11;
}

- (void)showOverKeyWindowWithSpinnerOnly:(BOOL)a3
{
  [(UIImageView *)self->_maskView setHidden:a3];
  if (!self->_overlayWindow)
  {
    int v4 = [_VUILoadingOverlayWindow alloc];
    [(VUIAppLoadingView *)self bounds];
    v5 = -[_VUILoadingOverlayWindow initWithFrame:](v4, "initWithFrame:");
    overlayWindow = self->_overlayWindow;
    self->_overlayWindow = v5;

    [(UIWindow *)self->_overlayWindow setWindowLevel:*MEMORY[0x1E4FB3108]];
    v7 = self->_overlayWindow;
    id v8 = objc_alloc_init(MEMORY[0x1E4FB1EC0]);
    [(UIWindow *)v7 setRootViewController:v8];

    id v9 = [(UIWindow *)self->_overlayWindow layer];
    uint64_t v10 = [v9 superlayer];
    [v10 setAllowsGroupOpacity:0];

    id v11 = [(UIWindow *)self->_overlayWindow layer];
    [v11 setAllowsGroupOpacity:0];

    [(UIWindow *)self->_overlayWindow setBackgroundColor:0];
  }
  double v12 = objc_msgSend(MEMORY[0x1E4FB1F48], "vui_keyWindow");
  double v13 = [(VUIAppLoadingView *)self superview];
  char v14 = [v13 isEqual:v12];

  if ((v14 & 1) == 0)
  {
    [(UIWindow *)self->_overlayWindow setVuiHidden:0];
    double v15 = [(UIWindow *)self->_overlayWindow rootViewController];
    [v15 setView:self];

    [(UIView *)self->_wallpaperView setVuiAlpha:1.0];
    [(VUIAppLoadingView *)self setVuiAlpha:1.0];
    [(UIImageView *)self->_maskView setVuiAlpha:1.0];
    [(UIVisualEffectView *)self->_visualEffectView _setTintOpacity:1.0];
    [(VUIActivityIndicatorView *)self->_spinner setVuiAlpha:0.0];
    aBlock[0] = MEMORY[0x1E4F143A8];
    aBlock[1] = 3221225472;
    aBlock[2] = __54__VUIAppLoadingView_showOverKeyWindowWithSpinnerOnly___block_invoke;
    aBlock[3] = &unk_1E6DF7AC0;
    aBlock[4] = self;
    double v16 = _Block_copy(aBlock);
    double v17 = v16;
    deladouble y = self->_delay;
    if (delay <= 0.0)
    {
      (*((void (**)(void *, double))v16 + 2))(v16, 0.2);
    }
    else
    {
      dispatch_time_t v19 = dispatch_time(0, (uint64_t)(delay * 1000000000.0));
      uint64_t v20 = MEMORY[0x1E4F143A8];
      uint64_t v21 = 3221225472;
      v22 = __54__VUIAppLoadingView_showOverKeyWindowWithSpinnerOnly___block_invoke_3;
      v23 = &unk_1E6DF3DD0;
      id v24 = v17;
      dispatch_after(v19, MEMORY[0x1E4F14428], &v20);
    }
    -[VUIAppLoadingView performSelector:withObject:afterDelay:](self, "performSelector:withObject:afterDelay:", sel_timeout, 0, self->_timeout, v20, v21, v22, v23);
  }
}

uint64_t __54__VUIAppLoadingView_showOverKeyWindowWithSpinnerOnly___block_invoke(uint64_t a1, double a2)
{
  v3[0] = MEMORY[0x1E4F143A8];
  v3[1] = 3221225472;
  v3[2] = __54__VUIAppLoadingView_showOverKeyWindowWithSpinnerOnly___block_invoke_2;
  v3[3] = &unk_1E6DF3D58;
  v3[4] = *(void *)(a1 + 32);
  return [MEMORY[0x1E4FB1EB0] animateWithDuration:6 delay:v3 options:0 animations:0.6 completion:a2];
}

- (void)hide
{
  if ([(VUIAppLoadingView *)self isVisible])
  {
    if (!self->_hiding)
    {
      [MEMORY[0x1E4FBA8A8] cancelPreviousPerformRequestsWithTarget:self selector:sel_timeout object:0];
      self->_hiding = 1;
      self->_deladouble y = 0.0;
      v4[0] = MEMORY[0x1E4F143A8];
      v4[1] = 3221225472;
      v4[2] = __25__VUIAppLoadingView_hide__block_invoke;
      v4[3] = &unk_1E6DF3D58;
      v4[4] = self;
      v3[0] = MEMORY[0x1E4F143A8];
      v3[1] = 3221225472;
      v3[2] = __25__VUIAppLoadingView_hide__block_invoke_2;
      v3[3] = &unk_1E6DF5B20;
      v3[4] = self;
      [MEMORY[0x1E4FB1EB0] animateWithDuration:6 delay:v4 options:v3 animations:0.6 completion:0.0];
    }
  }
}

- (BOOL)isVisible
{
  [(VUIAppLoadingView *)self vuiAlpha];
  return v2 >= 1.0;
}

+ (id)loadingScreen
{
  if (loadingScreen_onceToken[0] != -1) {
    dispatch_once(loadingScreen_onceToken, &__block_literal_global_60);
  }
  double v2 = (void *)loadingScreen_loadingScreen;
  return v2;
}

- (void)setTimeout:(double)a3
{
  self->_timeout = a3;
}

uint64_t __25__VUIAppLoadingView_hide__block_invoke(uint64_t a1)
{
  double v2 = *(id **)(a1 + 32);
  if (v2[57])
  {
    [v2[57] _setTintOpacity:0.0];
    [*(id *)(*(void *)(a1 + 32) + 448) setAlpha:0.0];
    [*(id *)(*(void *)(a1 + 32) + 464) setAlpha:0.0];
    double v2 = *(id **)(*(void *)(a1 + 32) + 408);
  }
  return [v2 setAlpha:0.0];
}

- (void)setLoadingDelay:(double)a3
{
  self->_deladouble y = a3;
}

- (void)showOverKeyWindow
{
}

uint64_t __54__VUIAppLoadingView_showOverKeyWindowWithSpinnerOnly___block_invoke_3(uint64_t a1)
{
  return (*(uint64_t (**)(double))(*(void *)(a1 + 32) + 16))(0.0);
}

- (void)timeout
{
  if ([(VUIAppLoadingView *)self isVisible])
  {
    v3 = VUIDefaultLogObject();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)int v4 = 0;
      _os_log_impl(&dword_1E2BD7000, v3, OS_LOG_TYPE_INFO, "VUIAppLoadingView - VUIAppLoadingView timed out, hiding", v4, 2u);
    }

    [(VUIAppLoadingView *)self hide];
  }
}

- (void)hideImmediately
{
  if ([(VUIAppLoadingView *)self isVisible] && !self->_hiding)
  {
    [MEMORY[0x1E4FBA8A8] cancelPreviousPerformRequestsWithTarget:self selector:sel_timeout object:0];
    self->_hiding = 1;
    self->_deladouble y = 0.0;
    [(VUIAppLoadingView *)self setAlpha:0.0];
    [(VUIActivityIndicatorView *)self->_spinner stopAnimating];
    self->_hiding = 0;
    overlayWindow = self->_overlayWindow;
    [(UIWindow *)overlayWindow setHidden:1];
  }
}

uint64_t __25__VUIAppLoadingView_hide__block_invoke_2(uint64_t a1)
{
  [*(id *)(a1 + 32) setAlpha:0.0];
  [*(id *)(*(void *)(a1 + 32) + 464) stopAnimating];
  *(unsigned char *)(*(void *)(a1 + 32) + 424) = 0;
  double v2 = *(void **)(*(void *)(a1 + 32) + 416);
  return [v2 setHidden:1];
}

- (double)hideAnimationDuration
{
  return 0.6;
}

- (void)didRotate:(id)a3
{
  [(VUIActivityIndicatorView *)self->_spinner frame];
  double v5 = v4;
  double v7 = v6;
  id v8 = objc_msgSend(MEMORY[0x1E4FB1F48], "vui_keyWindow");
  [v8 frame];
  double v11 = round(v10 + (v9 - v5) * 0.5);
  double v14 = round(v13 + (v12 - v7) * 0.5);

  double v15 = [(UIImageView *)self->_maskView image];

  spinner = self->_spinner;
  if (v15) {
    double v17 = v14 + 50.0;
  }
  else {
    double v17 = v14;
  }
  -[VUIActivityIndicatorView setFrame:](spinner, "setFrame:", v11, v17, v5, v7);
}

- (VUIActivityIndicatorView)spinner
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