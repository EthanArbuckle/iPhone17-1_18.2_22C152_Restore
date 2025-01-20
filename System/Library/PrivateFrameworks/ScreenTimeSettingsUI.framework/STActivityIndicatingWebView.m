@interface STActivityIndicatingWebView
- (STActivityIndicatingWebView)initWithConfiguration:(id)a3;
- (UIActivityIndicatorView)activityView;
- (UITraitChangeRegistration)interfaceStyleObservation;
- (void)didChangeUserInterfaceStyle;
- (void)hostActivityIndicatorInView:(id)a3;
- (void)setActivityView:(id)a3;
- (void)setInterfaceStyleObservation:(id)a3;
- (void)webView:(id)a3 didFinishNavigation:(id)a4;
@end

@implementation STActivityIndicatingWebView

- (STActivityIndicatingWebView)initWithConfiguration:(id)a3
{
  v18[1] = *MEMORY[0x263EF8340];
  id v4 = a3;
  v17.receiver = self;
  v17.super_class = (Class)STActivityIndicatingWebView;
  v5 = -[STActivityIndicatingWebView initWithFrame:configuration:](&v17, sel_initWithFrame_configuration_, v4, *MEMORY[0x263F001A8], *(double *)(MEMORY[0x263F001A8] + 8), *(double *)(MEMORY[0x263F001A8] + 16), *(double *)(MEMORY[0x263F001A8] + 24));
  uint64_t v6 = [objc_alloc(MEMORY[0x263F823E8]) initWithActivityIndicatorStyle:101];
  activityView = v5->_activityView;
  v5->_activityView = (UIActivityIndicatorView *)v6;

  objc_initWeak(&location, v5);
  v18[0] = objc_opt_class();
  v8 = [MEMORY[0x263EFF8C0] arrayWithObjects:v18 count:1];
  uint64_t v11 = MEMORY[0x263EF8330];
  uint64_t v12 = 3221225472;
  v13 = __53__STActivityIndicatingWebView_initWithConfiguration___block_invoke;
  v14 = &unk_264766F08;
  objc_copyWeak(&v15, &location);
  v9 = [(STActivityIndicatingWebView *)v5 registerForTraitChanges:v8 withHandler:&v11];
  -[STActivityIndicatingWebView setInterfaceStyleObservation:](v5, "setInterfaceStyleObservation:", v9, v11, v12, v13, v14);

  [(STActivityIndicatingWebView *)v5 setNavigationDelegate:v5];
  objc_destroyWeak(&v15);
  objc_destroyWeak(&location);

  return v5;
}

void __53__STActivityIndicatingWebView_initWithConfiguration___block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained didChangeUserInterfaceStyle];
}

- (void)didChangeUserInterfaceStyle
{
  v3 = [(STActivityIndicatingWebView *)self superview];

  if (v3)
  {
    id v6 = [(STActivityIndicatingWebView *)self traitCollection];
    if ([v6 userInterfaceStyle] == 2) {
      [MEMORY[0x263F825C8] blackColor];
    }
    else {
    id v4 = [MEMORY[0x263F825C8] whiteColor];
    }
    v5 = [(STActivityIndicatingWebView *)self superview];
    [v5 setBackgroundColor:v4];
  }
}

- (void)hostActivityIndicatorInView:(id)a3
{
  v20[2] = *MEMORY[0x263EF8340];
  id v4 = a3;
  v5 = [(STActivityIndicatingWebView *)self activityView];
  id v6 = [v5 superview];

  if (!v6)
  {
    v7 = [(STActivityIndicatingWebView *)self activityView];
    [v7 setTranslatesAutoresizingMaskIntoConstraints:0];

    v8 = [(STActivityIndicatingWebView *)self activityView];
    [v4 addSubview:v8];

    v18 = (void *)MEMORY[0x263F08938];
    v19 = [(STActivityIndicatingWebView *)self activityView];
    v9 = [v19 centerXAnchor];
    v10 = [v4 centerXAnchor];
    uint64_t v11 = [v9 constraintEqualToAnchor:v10];
    v20[0] = v11;
    uint64_t v12 = [(STActivityIndicatingWebView *)self activityView];
    v13 = [v12 centerYAnchor];
    v14 = [v4 centerYAnchor];
    id v15 = [v13 constraintEqualToAnchor:v14];
    v20[1] = v15;
    v16 = [MEMORY[0x263EFF8C0] arrayWithObjects:v20 count:2];
    [v18 activateConstraints:v16];

    [(STActivityIndicatingWebView *)self setAlpha:0.0];
    objc_super v17 = [(STActivityIndicatingWebView *)self activityView];
    [v17 startAnimating];
  }
}

- (void)webView:(id)a3 didFinishNavigation:(id)a4
{
  v5 = [(STActivityIndicatingWebView *)self activityView];
  [v5 stopAnimating];

  v6[0] = MEMORY[0x263EF8330];
  v6[1] = 3221225472;
  v6[2] = __59__STActivityIndicatingWebView_webView_didFinishNavigation___block_invoke;
  v6[3] = &unk_264766F30;
  v6[4] = self;
  [MEMORY[0x263F82E00] animateWithDuration:v6 animations:0.25];
}

uint64_t __59__STActivityIndicatingWebView_webView_didFinishNavigation___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) setAlpha:1.0];
}

- (UIActivityIndicatorView)activityView
{
  return self->_activityView;
}

- (void)setActivityView:(id)a3
{
}

- (UITraitChangeRegistration)interfaceStyleObservation
{
  return self->_interfaceStyleObservation;
}

- (void)setInterfaceStyleObservation:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_interfaceStyleObservation, 0);

  objc_storeStrong((id *)&self->_activityView, 0);
}

@end