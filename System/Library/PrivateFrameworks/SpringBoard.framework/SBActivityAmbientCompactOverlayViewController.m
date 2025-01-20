@interface SBActivityAmbientCompactOverlayViewController
- (BOOL)_canShowWhileLocked;
- (CGSize)contentSize;
- (PLPlatterView)platterView;
- (SBActivityAmbientCompactOverlayViewControllerDelegate)compactOverlayDelegate;
- (double)cornerRadius;
- (unint64_t)supportedInterfaceOrientations;
- (void)_configureTapGesture;
- (void)_handleTapGesture;
- (void)_layoutSubviews;
- (void)setBackgroundAlpha:(double)a3;
- (void)setCompactOverlayDelegate:(id)a3;
- (void)setContentAlpha:(double)a3;
- (void)viewDidLoad;
- (void)viewWillLayoutSubviews;
@end

@implementation SBActivityAmbientCompactOverlayViewController

- (void)viewDidLoad
{
  v8.receiver = self;
  v8.super_class = (Class)SBActivityAmbientCompactOverlayViewController;
  [(SBActivityViewController *)&v8 viewDidLoad];
  v3 = [(SBActivityAmbientCompactOverlayViewController *)self view];
  v4 = (PLPlatterView *)[objc_alloc(MEMORY[0x1E4F91460]) initWithRecipe:52];
  platterView = self->_platterView;
  self->_platterView = v4;

  [(PLPlatterView *)self->_platterView setUsesBackgroundView:1];
  [(PLPlatterView *)self->_platterView setOverrideUserInterfaceStyle:2];
  [(PLPlatterView *)self->_platterView setMaterialGroupNameBase:@"Activities"];
  [v3 addSubview:self->_platterView];
  [v3 sendSubviewToBack:self->_platterView];
  v6 = [(SBActivityViewController *)self activityHostViewController];
  v7 = [v6 view];
  objc_msgSend(v7, "bs_setHitTestingDisabled:", 1);

  [(SBActivityAmbientCompactOverlayViewController *)self _configureTapGesture];
}

- (void)viewWillLayoutSubviews
{
  v3.receiver = self;
  v3.super_class = (Class)SBActivityAmbientCompactOverlayViewController;
  [(SBActivityViewController *)&v3 viewWillLayoutSubviews];
  [(SBActivityAmbientCompactOverlayViewController *)self _layoutSubviews];
}

- (BOOL)_canShowWhileLocked
{
  return 1;
}

- (unint64_t)supportedInterfaceOrientations
{
  return 24;
}

- (CGSize)contentSize
{
  [(SBActivityAmbientCompactOverlayViewController *)self preferredContentSize];
  if (v2 == *MEMORY[0x1E4F1DB30] && v3 == *(double *)(MEMORY[0x1E4F1DB30] + 8))
  {
    double v2 = 40.0;
    double v3 = 40.0;
  }
  result.height = v3;
  result.width = v2;
  return result;
}

- (double)cornerRadius
{
  [(SBActivityAmbientCompactOverlayViewController *)self contentSize];
  return v2 * 0.5;
}

- (void)setBackgroundAlpha:(double)a3
{
}

- (void)setContentAlpha:(double)a3
{
  id v5 = [(SBActivityViewController *)self activityHostViewController];
  v4 = [v5 view];
  [v4 setAlpha:a3];
}

- (void)_layoutSubviews
{
  double v3 = [(SBActivityAmbientCompactOverlayViewController *)self view];
  [v3 bounds];
  double v5 = v4;
  double v7 = v6;
  double v9 = v8;
  double v11 = v10;

  platterView = self->_platterView;
  -[PLPlatterView setFrame:](platterView, "setFrame:", v5, v7, v9, v11);
}

- (void)_configureTapGesture
{
  id v4 = (id)[objc_alloc(MEMORY[0x1E4F42EC8]) initWithTarget:self action:sel__handleTapGesture];
  double v3 = [(SBActivityAmbientCompactOverlayViewController *)self view];
  [v3 addGestureRecognizer:v4];
}

- (void)_handleTapGesture
{
  id v4 = [(SBActivityAmbientCompactOverlayViewController *)self compactOverlayDelegate];
  double v3 = [(SBActivityViewController *)self activityItem];
  [v4 handleTapForCompactOverlayViewController:self withActivityItem:v3];
}

- (SBActivityAmbientCompactOverlayViewControllerDelegate)compactOverlayDelegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_compactOverlayDelegate);
  return (SBActivityAmbientCompactOverlayViewControllerDelegate *)WeakRetained;
}

- (void)setCompactOverlayDelegate:(id)a3
{
}

- (PLPlatterView)platterView
{
  return self->_platterView;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_platterView, 0);
  objc_destroyWeak((id *)&self->_compactOverlayDelegate);
}

@end