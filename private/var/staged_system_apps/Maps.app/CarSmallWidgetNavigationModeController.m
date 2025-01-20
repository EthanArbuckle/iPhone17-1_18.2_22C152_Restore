@interface CarSmallWidgetNavigationModeController
- (BOOL)showsMapView;
- (CGSize)availableSize;
- (CarGuidanceCardViewController)guidanceCard;
- (ChromeViewController)chromeViewController;
- (GuidanceObserver)guidanceObserver;
- (NSArray)carFocusOrderSequences;
- (UIViewController)content;
- (unint64_t)maneuverViewLayoutType;
- (void)_setupGuidanceCard;
- (void)becomeTopContextInChromeViewController:(id)a3 withAnimation:(id)a4;
- (void)navigationService:(id)a3 didArriveAtWaypoint:(id)a4 endOfLegIndex:(unint64_t)a5;
- (void)resignTopContextInChromeViewController:(id)a3 withAnimation:(id)a4;
- (void)setChromeViewController:(id)a3;
- (void)setContent:(id)a3;
- (void)setGuidanceCard:(id)a3;
@end

@implementation CarSmallWidgetNavigationModeController

- (void)_setupGuidanceCard
{
  v3 = [(CarSmallWidgetNavigationModeController *)self guidanceCard];
  [(CarSmallWidgetNavigationModeController *)self setContent:v3];

  v4 = [(CarSmallWidgetNavigationModeController *)self guidanceObserver];
  v5 = [(CarSmallWidgetNavigationModeController *)self guidanceCard];
  [v4 addOutlet:v5 forOwner:self];

  id v7 = [(CarSmallWidgetNavigationModeController *)self guidanceObserver];
  v6 = [(CarSmallWidgetNavigationModeController *)self guidanceCard];
  [v7 repeatAllUpdatesForOutlet:v6];
}

- (BOOL)showsMapView
{
  return 0;
}

- (CarGuidanceCardViewController)guidanceCard
{
  guidanceCard = self->_guidanceCard;
  if (!guidanceCard)
  {
    v4 = [[CarGuidanceCardViewController alloc] initWithDestination:1 guidanceCardSizeProvider:self interactionDelegate:0];
    v5 = self->_guidanceCard;
    self->_guidanceCard = v4;

    guidanceCard = self->_guidanceCard;
  }

  return guidanceCard;
}

- (GuidanceObserver)guidanceObserver
{
  v2 = +[CarDisplayController sharedInstance];
  v3 = [v2 guidanceObserver];

  return (GuidanceObserver *)v3;
}

- (void)setContent:(id)a3
{
  v5 = (UIViewController *)a3;
  p_content = &self->_content;
  content = self->_content;
  if (content != v5)
  {
    if (content)
    {
      v8 = [(UIViewController *)content view];
      [v8 removeFromSuperview];
    }
    objc_storeStrong((id *)&self->_content, a3);
    if (*p_content)
    {
      v9 = [(UIViewController *)*p_content view];
      [v9 setTranslatesAutoresizingMaskIntoConstraints:0];

      v10 = [(CarSmallWidgetNavigationModeController *)self view];
      v11 = [(UIViewController *)*p_content view];
      [v10 addSubview:v11];

      v42 = [(UIViewController *)*p_content view];
      v40 = [v42 leadingAnchor];
      v41 = [(CarSmallWidgetNavigationModeController *)self view];
      v39 = [v41 safeAreaLayoutGuide];
      v38 = [v39 leadingAnchor];
      v37 = [v40 constraintEqualToAnchor:v38];
      v43[0] = v37;
      v36 = [(UIViewController *)*p_content view];
      v34 = [v36 trailingAnchor];
      v35 = [(CarSmallWidgetNavigationModeController *)self view];
      v33 = [v35 safeAreaLayoutGuide];
      v32 = [v33 trailingAnchor];
      v31 = [v34 constraintEqualToAnchor:v32];
      v43[1] = v31;
      v30 = [(UIViewController *)*p_content view];
      v28 = [v30 topAnchor];
      v29 = [(CarSmallWidgetNavigationModeController *)self view];
      v27 = [v29 safeAreaLayoutGuide];
      v26 = [v27 topAnchor];
      v25 = [v28 constraintGreaterThanOrEqualToAnchor:v26];
      v43[2] = v25;
      v24 = [(UIViewController *)*p_content view];
      v22 = [v24 bottomAnchor];
      v23 = [(CarSmallWidgetNavigationModeController *)self view];
      v21 = [v23 safeAreaLayoutGuide];
      v12 = [v21 bottomAnchor];
      v13 = [v22 constraintLessThanOrEqualToAnchor:v12];
      v43[3] = v13;
      v14 = [(UIViewController *)*p_content view];
      v15 = [v14 centerYAnchor];
      v16 = [(CarSmallWidgetNavigationModeController *)self view];
      v17 = [v16 safeAreaLayoutGuide];
      v18 = [v17 centerYAnchor];
      v19 = [v15 constraintEqualToAnchor:v18];
      v43[4] = v19;
      v20 = +[NSArray arrayWithObjects:v43 count:5];
      +[NSLayoutConstraint activateConstraints:v20];
    }
  }
}

- (void)becomeTopContextInChromeViewController:(id)a3 withAnimation:(id)a4
{
  v5 = +[MNNavigationService sharedService];
  [v5 registerObserver:self];

  [(CarSmallWidgetNavigationModeController *)self _setupGuidanceCard];
}

- (void)resignTopContextInChromeViewController:(id)a3 withAnimation:(id)a4
{
  v5 = +[MNNavigationService sharedService];
  [v5 unregisterObserver:self];

  id v7 = [(CarSmallWidgetNavigationModeController *)self guidanceObserver];
  v6 = [(CarSmallWidgetNavigationModeController *)self guidanceCard];
  [v7 removeOutlet:v6];
}

- (void)navigationService:(id)a3 didArriveAtWaypoint:(id)a4 endOfLegIndex:(unint64_t)a5
{
  id v7 = [a3 route];
  self->_hasArrived = [v7 isLegIndexOfLastLeg:a5];
}

- (CGSize)availableSize
{
  v3 = [(CarSmallWidgetNavigationModeController *)self view];
  [v3 bounds];
  double v5 = v4;
  double v7 = v6;
  v8 = [(CarSmallWidgetNavigationModeController *)self view];
  [v8 safeAreaInsets];
  double v11 = v5 - (v9 + v10);
  double v14 = v7 - (v12 + v13);

  double v15 = v11;
  double v16 = v14;
  result.height = v16;
  result.width = v15;
  return result;
}

- (unint64_t)maneuverViewLayoutType
{
  [(CarSmallWidgetNavigationModeController *)self availableSize];
  if (v3 > 160.0) {
    return 1;
  }
  [(CarSmallWidgetNavigationModeController *)self availableSize];
  return v5 < 100.0;
}

- (NSArray)carFocusOrderSequences
{
  return (NSArray *)&__NSArray0__struct;
}

- (ChromeViewController)chromeViewController
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_chromeViewController);

  return (ChromeViewController *)WeakRetained;
}

- (void)setChromeViewController:(id)a3
{
}

- (UIViewController)content
{
  return self->_content;
}

- (void)setGuidanceCard:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_guidanceCard, 0);
  objc_storeStrong((id *)&self->_content, 0);

  objc_destroyWeak((id *)&self->_chromeViewController);
}

@end