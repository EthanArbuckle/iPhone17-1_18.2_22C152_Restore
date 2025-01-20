@interface SBSystemApertureCurtainViewController
- (BOOL)_canShowWhileLocked;
- (UIView)curtainView;
- (UIView)indicatorSourceView;
- (id)_indicatorPortalView;
- (void)setCurtainView:(id)a3;
- (void)setIndicatorSourceView:(id)a3;
- (void)viewDidLoad;
@end

@implementation SBSystemApertureCurtainViewController

- (void)setIndicatorSourceView:(id)a3
{
  id v4 = a3;
  v5 = [(SBSystemApertureCurtainViewController *)self _indicatorPortalView];
  [v5 setSourceView:v4];

  id v6 = [(SBSystemApertureCurtainViewController *)self _indicatorPortalView];
  [v6 setHidden:v4 == 0];
}

- (id)_indicatorPortalView
{
  indicatorPortalView = self->_indicatorPortalView;
  if (!indicatorPortalView)
  {
    id v4 = objc_alloc_init(MEMORY[0x1E4F43298]);
    [v4 setMatchesPosition:1];
    [v4 setMatchesAlpha:1];
    [v4 setMatchesTransform:1];
    [v4 setHidesSourceView:0];
    v5 = self->_indicatorPortalView;
    self->_indicatorPortalView = (_UIPortalView *)v4;

    indicatorPortalView = self->_indicatorPortalView;
  }
  return indicatorPortalView;
}

- (BOOL)_canShowWhileLocked
{
  return 1;
}

- (void)viewDidLoad
{
  id v13 = [(SBSystemApertureCurtainViewController *)self view];
  [v13 bounds];
  double v4 = v3;
  double v6 = v5;
  double v8 = v7;
  double v10 = v9;
  v11 = [(SBSystemApertureCurtainViewController *)self _indicatorPortalView];
  objc_msgSend(v11, "setFrame:", v4, v6, v8, v10);
  v12 = [(SBSystemApertureCurtainViewController *)self view];
  [v12 addSubview:v11];
}

- (void)setCurtainView:(id)a3
{
  double v5 = (UIView *)a3;
  p_curtainView = &self->_curtainView;
  curtainView = self->_curtainView;
  if (curtainView != v5)
  {
    v12 = v5;
    double v8 = [(UIView *)curtainView superview];
    double v9 = [(SBSystemApertureCurtainViewController *)self view];
    int v10 = [v8 isEqual:v9];

    if (v10) {
      [(UIView *)*p_curtainView removeFromSuperview];
    }
    v11 = [(SBSystemApertureCurtainViewController *)self view];
    [v11 insertSubview:v12 atIndex:0];

    objc_storeStrong((id *)p_curtainView, a3);
    double v5 = v12;
  }
}

- (UIView)curtainView
{
  return self->_curtainView;
}

- (UIView)indicatorSourceView
{
  v2 = [(SBSystemApertureCurtainViewController *)self _indicatorPortalView];
  double v3 = [v2 sourceView];

  return (UIView *)v3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_indicatorPortalView, 0);
  objc_storeStrong((id *)&self->_curtainView, 0);
}

@end