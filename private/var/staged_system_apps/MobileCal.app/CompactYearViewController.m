@interface CompactYearViewController
+ (BOOL)_shouldForwardViewWillTransitionToSize;
- (BOOL)shouldAnimateTransitionsToMonthView;
- (BOOL)shouldPushNextLevelViewControllerWhenTodayIsVisible;
- (Class)multipleMonthViewClass;
- (int64_t)intendedSizeClass;
- (unint64_t)monthsPerRow;
- (unint64_t)supportedInterfaceOrientations;
- (void)setShouldRespondToApplicationDidBecomeActiveStateChange:(BOOL)a3;
- (void)updatePalette:(id)a3;
- (void)viewDidAppear:(BOOL)a3;
- (void)viewWillTransitionToSize:(CGSize)a3 withTransitionCoordinator:(id)a4;
@end

@implementation CompactYearViewController

- (void)viewDidAppear:(BOOL)a3
{
  v7.receiver = self;
  v7.super_class = (Class)CompactYearViewController;
  [(YearViewController *)&v7 viewDidAppear:a3];
  v3 = (void *)kCalUILogHandle;
  if (os_log_type_enabled((os_log_t)kCalUILogHandle, OS_LOG_TYPE_INFO))
  {
    v4 = v3;
    v5 = (objc_class *)objc_opt_class();
    v6 = NSStringFromClass(v5);
    *(_DWORD *)buf = 138543362;
    v9 = v6;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_INFO, "[UserStateLog] State -> %{public}@ viewDidAppear", buf, 0xCu);
  }
}

- (unint64_t)supportedInterfaceOrientations
{
  return 2;
}

+ (BOOL)_shouldForwardViewWillTransitionToSize
{
  return 1;
}

- (void)viewWillTransitionToSize:(CGSize)a3 withTransitionCoordinator:(id)a4
{
  CGFloat height = a3.height;
  CGFloat width = a3.width;
  id v7 = a4;
  [(MainViewController *)self setDisableRotationTimings:1];
  v18[0] = _NSConcreteStackBlock;
  v18[1] = 3221225472;
  v18[2] = sub_1000A60D4;
  v18[3] = &unk_1001D2E40;
  v18[4] = self;
  v8 = objc_retainBlock(v18);
  v13[0] = _NSConcreteStackBlock;
  v13[1] = 3221225472;
  v13[2] = sub_1000A6178;
  v13[3] = &unk_1001D4048;
  CGFloat v16 = width;
  CGFloat v17 = height;
  id v9 = v7;
  id v14 = v9;
  v15 = self;
  v10 = objc_retainBlock(v13);
  if (v9)
  {
    [(MainViewController *)self transitionToSizeWillStart];
    v11[0] = _NSConcreteStackBlock;
    v11[1] = 3221225472;
    v11[2] = sub_1000A61B8;
    v11[3] = &unk_1001D4070;
    v11[4] = self;
    v12 = v10;
    [v9 animateAlongsideTransition:v8 completion:v11];
  }
  else
  {
    ((void (*)(void *, void))v8[2])(v8, 0);
    ((void (*)(void *, void))v10[2])(v10, 0);
  }
}

- (Class)multipleMonthViewClass
{
  v2 = [(CompactYearViewController *)self traitCollection];
  EKUIUsesLargeTextYearView();
  id v3 = (id)objc_opt_class();

  return (Class)v3;
}

- (unint64_t)monthsPerRow
{
  v2 = [(CompactYearViewController *)self traitCollection];
  if (EKUIUsesLargeTextYearView()) {
    unint64_t v3 = 2;
  }
  else {
    unint64_t v3 = 3;
  }

  return v3;
}

- (BOOL)shouldAnimateTransitionsToMonthView
{
  return 1;
}

- (void)updatePalette:(id)a3
{
  id v3 = a3;
  [v3 setWeekdayHeaderVisible:0];
  [v3 setWeekdayHeaderFillsHalfWidth:0];
  [v3 setTodayButtonVisible:0];
  [v3 setDateStringVisible:0];
  [v3 setDividerLineVisible:0];
  [v3 setDayScrubberController:0];
  [v3 setFocusBannerPlacement:1];
  [v3 layoutIfNeeded];
}

- (void)setShouldRespondToApplicationDidBecomeActiveStateChange:(BOOL)a3
{
  self->_applicationResuming = a3;
}

- (BOOL)shouldPushNextLevelViewControllerWhenTodayIsVisible
{
  return !self->_applicationResuming;
}

- (int64_t)intendedSizeClass
{
  return 1;
}

@end