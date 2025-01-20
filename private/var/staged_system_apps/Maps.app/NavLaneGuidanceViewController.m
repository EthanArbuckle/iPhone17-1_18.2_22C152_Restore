@interface NavLaneGuidanceViewController
- (BOOL)_canShowWhileLocked;
- (BOOL)hasLaneGuidance;
- (MUBlurView)backgroundView;
- (NSLayoutConstraint)laneGuidanceHeightConstraint;
- (NavLaneGuidanceViewController)initWithDelegate:(id)a3 blurGroup:(id)a4;
- (NavLaneGuidanceViewControllerDelegate)delegate;
- (NavSignLaneGuidanceInfo)laneGuidanceInfo;
- (NavSignLaneGuidanceView)laneGuidanceView;
- (double)layoutProgress;
- (void)_insertBackgroundView;
- (void)_updateLaneGuidanceAnimated:(BOOL)a3;
- (void)navigationService:(id)a3 hideLaneDirectionsForId:(id)a4;
- (void)navigationService:(id)a3 showLaneDirections:(id)a4;
- (void)pressedLaneGuidance;
- (void)setBackgroundView:(id)a3;
- (void)setDelegate:(id)a3;
- (void)setLaneGuidanceHeightConstraint:(id)a3;
- (void)setLaneGuidanceInfo:(id)a3;
- (void)setLaneGuidanceView:(id)a3;
- (void)setLayoutProgress:(double)a3;
- (void)traitCollectionDidChange:(id)a3;
- (void)viewDidLoad;
@end

@implementation NavLaneGuidanceViewController

- (BOOL)_canShowWhileLocked
{
  return 1;
}

- (NavLaneGuidanceViewController)initWithDelegate:(id)a3 blurGroup:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v13.receiver = self;
  v13.super_class = (Class)NavLaneGuidanceViewController;
  v8 = [(NavLaneGuidanceViewController *)&v13 initWithNibName:0 bundle:0];
  if (v8)
  {
    v9 = (objc_class *)objc_opt_class();
    v10 = NSStringFromClass(v9);
    [(NavLaneGuidanceViewController *)v8 setAccessibilityIdentifier:v10];

    objc_storeWeak((id *)&v8->_delegate, v6);
    objc_storeStrong((id *)&v8->_blurGroup, a4);
    v11 = +[MNNavigationService sharedService];
    [v11 registerObserver:v8];
  }
  return v8;
}

- (void)viewDidLoad
{
  v25.receiver = self;
  v25.super_class = (Class)NavLaneGuidanceViewController;
  [(NavLaneGuidanceViewController *)&v25 viewDidLoad];
  v3 = [(NavLaneGuidanceViewController *)self view];
  v4 = [v3 layer];
  [v4 setMasksToBounds:1];

  [(NavLaneGuidanceViewController *)self _insertBackgroundView];
  v5 = [[NavSignLaneGuidanceView alloc] initWithLaneStyle:0];
  laneGuidanceView = self->_laneGuidanceView;
  self->_laneGuidanceView = v5;

  [(NavSignLaneGuidanceView *)self->_laneGuidanceView setTranslatesAutoresizingMaskIntoConstraints:0];
  -[NavSignLaneGuidanceView setEdgeInsets:](self->_laneGuidanceView, "setEdgeInsets:", 10.0, 0.0, 0.0, 0.0);
  [(NavSignLaneGuidanceView *)self->_laneGuidanceView setUserInteractionEnabled:1];
  id v7 = self->_laneGuidanceView;
  id v8 = [objc_alloc((Class)UITapGestureRecognizer) initWithTarget:self action:"pressedLaneGuidance"];
  [(NavSignLaneGuidanceView *)v7 addGestureRecognizer:v8];

  v9 = [(NavLaneGuidanceViewController *)self view];
  [v9 addSubview:self->_laneGuidanceView];

  v23 = [(NavSignLaneGuidanceView *)self->_laneGuidanceView leadingAnchor];
  v24 = [(NavLaneGuidanceViewController *)self view];
  v22 = [v24 leadingAnchor];
  v21 = [v23 constraintEqualToAnchor:v22];
  v26[0] = v21;
  v20 = [(NavSignLaneGuidanceView *)self->_laneGuidanceView trailingAnchor];
  v10 = [(NavLaneGuidanceViewController *)self view];
  v11 = [v10 trailingAnchor];
  v12 = [v20 constraintEqualToAnchor:v11];
  v26[1] = v12;
  objc_super v13 = [(NavSignLaneGuidanceView *)self->_laneGuidanceView bottomAnchor];
  v14 = [(NavLaneGuidanceViewController *)self view];
  v15 = [v14 bottomAnchor];
  v16 = [v13 constraintEqualToAnchor:v15];
  v26[2] = v16;
  v17 = [(NavSignLaneGuidanceView *)self->_laneGuidanceView heightAnchor];
  v18 = [v17 constraintEqualToConstant:60.0];
  v26[3] = v18;
  v19 = +[NSArray arrayWithObjects:v26 count:4];
  +[NSLayoutConstraint activateConstraints:v19];
}

- (void)pressedLaneGuidance
{
  id v2 = [(NavLaneGuidanceViewController *)self delegate];
  [v2 didTapLaneGuidance];
}

- (MUBlurView)backgroundView
{
  backgroundView = self->_backgroundView;
  if (!backgroundView)
  {
    v4 = (MUBlurView *)[objc_alloc((Class)MUBlurView) initWithBlurEffectStyle:19];
    v5 = self->_backgroundView;
    self->_backgroundView = v4;

    id v6 = sub_10082634C();
    [(NavLaneGuidanceViewController *)self layoutProgress];
    id v8 = [v6 colorWithAlphaComponent:v7 * 0.239999995];
    [(MUBlurView *)self->_backgroundView setOverlayColor:v8];

    [(MUBlurView *)self->_backgroundView setBlurGroupName:self->_blurGroup];
    v9 = sub_1008263F8();
    [(MUBlurView *)self->_backgroundView setNonBlurredColor:v9];

    [(MUBlurView *)self->_backgroundView setStyle:2];
    [(MUBlurView *)self->_backgroundView setTranslatesAutoresizingMaskIntoConstraints:0];
    backgroundView = self->_backgroundView;
  }

  return backgroundView;
}

- (void)setLayoutProgress:(double)a3
{
  if (self->_layoutProgress != a3)
  {
    self->_layoutProgress = a3;
    v4 = [(NavLaneGuidanceViewController *)self traitCollection];
    unsigned __int8 v5 = [v4 isLuminanceReduced];

    if ((v5 & 1) == 0)
    {
      sub_10082634C();
      id v8 = (id)objc_claimAutoreleasedReturnValue();
      [(NavLaneGuidanceViewController *)self layoutProgress];
      double v7 = [v8 colorWithAlphaComponent:v6 * 0.239999995];
      [(MUBlurView *)self->_backgroundView setOverlayColor:v7];
    }
  }
}

- (BOOL)hasLaneGuidance
{
  id v2 = [(NavLaneGuidanceViewController *)self laneGuidanceInfo];
  BOOL v3 = v2 != 0;

  return v3;
}

- (void)traitCollectionDidChange:(id)a3
{
  v11.receiver = self;
  v11.super_class = (Class)NavLaneGuidanceViewController;
  id v4 = a3;
  [(NavLaneGuidanceViewController *)&v11 traitCollectionDidChange:v4];
  unsigned __int8 v5 = [(NavLaneGuidanceViewController *)self traitCollection];
  int v6 = sub_100045060(v4, v5);

  if (v6)
  {
    double v7 = [(NavLaneGuidanceViewController *)self traitCollection];
    id v8 = [v7 isLuminanceReduced];

    v9[0] = _NSConcreteStackBlock;
    v9[1] = 3221225472;
    v9[2] = sub_1006932B0;
    v9[3] = &unk_1012E6300;
    char v10 = (char)v8;
    v9[4] = self;
    +[UIView _maps_animateForAndromeda:v8 animations:v9];
  }
}

- (void)navigationService:(id)a3 showLaneDirections:(id)a4
{
  id v5 = a4;
  int v6 = [(NavLaneGuidanceViewController *)self laneGuidanceInfo];
  BOOL v7 = v6 == 0;

  id v8 = [[NavSignLaneGuidanceInfo alloc] initWithGuidanceLaneInfo:v5];
  [(NavLaneGuidanceViewController *)self setLaneGuidanceInfo:v8];

  v9 = [(NavLaneGuidanceViewController *)self laneGuidanceInfo];
  char v10 = [v9 lanes];
  objc_super v11 = [(NavLaneGuidanceViewController *)self laneGuidanceView];
  [v11 setLanes:v10];

  [(NavLaneGuidanceViewController *)self _updateLaneGuidanceAnimated:v7];
}

- (void)navigationService:(id)a3 hideLaneDirectionsForId:(id)a4
{
  -[NavLaneGuidanceViewController setLaneGuidanceInfo:](self, "setLaneGuidanceInfo:", 0, a4);

  [(NavLaneGuidanceViewController *)self _updateLaneGuidanceAnimated:1];
}

- (void)_updateLaneGuidanceAnimated:(BOOL)a3
{
  BOOL v3 = a3;
  id v5 = [(NavLaneGuidanceViewController *)self view];
  int v6 = [v5 superview];
  [v6 layoutIfNeeded];

  BOOL v7 = [(NavLaneGuidanceViewController *)self laneGuidanceInfo];
  if (v7) {
    double v8 = 60.0;
  }
  else {
    double v8 = 0.0;
  }

  v10[1] = 3221225472;
  double v9 = 0.25;
  v10[0] = _NSConcreteStackBlock;
  v10[2] = sub_100693588;
  v10[3] = &unk_1012E69C0;
  if (!v3) {
    double v9 = 0.0;
  }
  v10[4] = self;
  *(double *)&v10[5] = v8;
  +[UIView animateWithDuration:v10 animations:v9];
}

- (void)_insertBackgroundView
{
  [(MUBlurView *)self->_backgroundView removeFromSuperview];
  backgroundView = self->_backgroundView;
  self->_backgroundView = 0;

  id v4 = [(NavLaneGuidanceViewController *)self view];
  id v5 = [(NavLaneGuidanceViewController *)self backgroundView];
  [v4 insertSubview:v5 atIndex:0];

  id v10 = [(NavLaneGuidanceViewController *)self backgroundView];
  int v6 = [(NavLaneGuidanceViewController *)self view];
  LODWORD(v7) = 1148846080;
  double v8 = [v10 _maps_constraintsEqualToEdgesOfView:v6 priority:v7];
  double v9 = [v8 allConstraints];
  +[NSLayoutConstraint activateConstraints:v9];
}

- (NavLaneGuidanceViewControllerDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  return (NavLaneGuidanceViewControllerDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (double)layoutProgress
{
  return self->_layoutProgress;
}

- (void)setBackgroundView:(id)a3
{
}

- (NavSignLaneGuidanceView)laneGuidanceView
{
  return self->_laneGuidanceView;
}

- (void)setLaneGuidanceView:(id)a3
{
}

- (NSLayoutConstraint)laneGuidanceHeightConstraint
{
  return self->_laneGuidanceHeightConstraint;
}

- (void)setLaneGuidanceHeightConstraint:(id)a3
{
}

- (NavSignLaneGuidanceInfo)laneGuidanceInfo
{
  return self->_laneGuidanceInfo;
}

- (void)setLaneGuidanceInfo:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_laneGuidanceInfo, 0);
  objc_storeStrong((id *)&self->_laneGuidanceHeightConstraint, 0);
  objc_storeStrong((id *)&self->_laneGuidanceView, 0);
  objc_storeStrong((id *)&self->_backgroundView, 0);
  objc_destroyWeak((id *)&self->_delegate);

  objc_storeStrong((id *)&self->_blurGroup, 0);
}

@end