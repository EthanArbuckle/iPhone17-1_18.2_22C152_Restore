@interface CompactWidthWeekViewController
- (BOOL)_focusBannerVisible;
- (BOOL)allowsOverriddenRightNavigationBarItems;
- (BOOL)allowsOverriddenToolbarItems;
- (BOOL)eventViewControllerShouldHideInlineEditButton;
- (BOOL)shouldShowCompactLayout;
- (CompactWidthWeekViewController)initWithModel:(id)a3 window:(id)a4;
- (double)headerVerticalOffset;
- (id)animationControllerForDismissedController:(id)a3;
- (id)animationControllerForPresentedController:(id)a3 presentingController:(id)a4 sourceController:(id)a5;
- (id)interactionControllerForPresentation:(id)a3;
- (int64_t)intendedSizeClass;
- (void)_focusConfigurationChanged;
- (void)editorDidSaveEvent:(id)a3;
- (void)focusBannerViewToggled:(id)a3;
- (void)layoutCellsAnimated:(BOOL)a3;
- (void)loadView;
- (void)overlayCalendarDidChange;
- (void)showEvents:(id)a3 animated:(BOOL)a4 showMode:(unint64_t)a5 context:(id)a6;
- (void)showReminderDetail:(id)a3;
- (void)showViewController:(id)a3 sender:(id)a4 animated:(BOOL)a5 completion:(id)a6;
- (void)updateBannerDateStrings:(id)a3;
- (void)updateTimeViewBaseline;
- (void)viewDidAppear:(BOOL)a3;
- (void)viewDidLayoutSubviews;
- (void)viewWillAppear:(BOOL)a3;
- (void)viewWillDisappear:(BOOL)a3;
- (void)viewWillLayoutSubviews;
@end

@implementation CompactWidthWeekViewController

- (CompactWidthWeekViewController)initWithModel:(id)a3 window:(id)a4
{
  v7.receiver = self;
  v7.super_class = (Class)CompactWidthWeekViewController;
  v4 = [(WeekViewController *)&v7 initWithModel:a3 window:a4];
  if (v4)
  {
    v5 = +[NSNotificationCenter defaultCenter];
    [v5 addObserver:v4 selector:"_focusConfigurationChanged" name:CUIKCalendarModelFocusModeConfigurationChangedNotification object:0];
  }
  return v4;
}

- (BOOL)allowsOverriddenRightNavigationBarItems
{
  return 0;
}

- (BOOL)allowsOverriddenToolbarItems
{
  return 0;
}

- (int64_t)intendedSizeClass
{
  return 1;
}

- (void)showEvents:(id)a3 animated:(BOOL)a4 showMode:(unint64_t)a5 context:(id)a6
{
  BOOL v6 = a4;
  id v8 = a3;
  id v12 = [objc_alloc((Class)EKExpandedReminderStackViewController) initWithEvents:v8 delegate:self];
  [v12 setPreferModalPresentation:1];
  [v12 setTransitioningDelegate:self];
  v9 = +[NSBundle bundleForClass:objc_opt_class()];
  v10 = [v9 localizedStringForKey:@"Week" value:&stru_1001D6918 table:0];
  v11 = [(CompactWidthWeekViewController *)self navigationItem];
  [v11 setBackButtonTitle:v10];

  [(CUIKCalendarModel *)self->super.super._model setSelectedOccurrences:v8];
  [(CompactWidthWeekViewController *)self showViewController:v12 sender:self animated:v6 completion:0];
}

- (void)showViewController:(id)a3 sender:(id)a4 animated:(BOOL)a5 completion:(id)a6
{
  BOOL v7 = a5;
  id v10 = a3;
  id v11 = a4;
  id v12 = a6;
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    [v10 setPreferModalPresentation:1];
  }
  v13 = [(CompactWidthWeekViewController *)self presentedViewController];
  objc_opt_class();
  char isKindOfClass = objc_opt_isKindOfClass();

  if (isKindOfClass)
  {
    v15 = [(CompactWidthWeekViewController *)self presentedViewController];
    v16 = [v10 presentationController];
    [v16 setDelegate:v15];

    v17 = [(CompactWidthWeekViewController *)self presentedViewController];
    [v17 presentViewController:v10 animated:1 completion:0];
  }
  else
  {
    v18.receiver = self;
    v18.super_class = (Class)CompactWidthWeekViewController;
    [(MainViewController *)&v18 showViewController:v10 sender:v11 animated:v7 completion:v12];
  }
}

- (void)loadView
{
  self->_currentlyDisplayedMonth = -1;
  self->_currentlyDisplayedMonthInOverlayCalendar = -1;
  v3.receiver = self;
  v3.super_class = (Class)CompactWidthWeekViewController;
  [(WeekViewController *)&v3 loadView];
  [(CompactWidthWeekViewController *)self _focusConfigurationChanged];
}

- (void)viewWillAppear:(BOOL)a3
{
  BOOL v3 = a3;
  v7.receiver = self;
  v7.super_class = (Class)CompactWidthWeekViewController;
  -[WeekViewController viewWillAppear:](&v7, "viewWillAppear:");
  v5 = [(CompactWidthWeekViewController *)self navigationController];
  [v5 setNavigationBarHidden:1 animated:v3];

  BOOL v6 = [(CompactWidthWeekViewController *)self navigationController];
  [v6 setToolbarHidden:1];
}

- (void)viewDidAppear:(BOOL)a3
{
  v10.receiver = self;
  v10.super_class = (Class)CompactWidthWeekViewController;
  [(WeekViewController *)&v10 viewDidAppear:a3];
  v4 = (void *)kCalUILogHandle;
  if (os_log_type_enabled((os_log_t)kCalUILogHandle, OS_LOG_TYPE_INFO))
  {
    v5 = v4;
    BOOL v6 = (objc_class *)objc_opt_class();
    objc_super v7 = NSStringFromClass(v6);
    id v8 = [(WeekViewController *)self displayedDate];
    v9 = [v8 date];
    *(_DWORD *)buf = 138543618;
    id v12 = v7;
    __int16 v13 = 2114;
    v14 = v9;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_INFO, "[UserStateLog] State -> %{public}@ viewDidAppear. date = %{public}@", buf, 0x16u);
  }
}

- (void)viewWillDisappear:(BOOL)a3
{
  BOOL v3 = a3;
  v6.receiver = self;
  v6.super_class = (Class)CompactWidthWeekViewController;
  -[WeekViewController viewWillDisappear:](&v6, "viewWillDisappear:");
  v5 = [(CompactWidthWeekViewController *)self navigationController];
  [v5 setNavigationBarHidden:0 animated:v3];
}

- (void)viewWillLayoutSubviews
{
  if ([(CompactWidthWeekViewController *)self _focusBannerVisible])
  {
    [(EKUIFocusBannerView *)self->_focusBanner sizeToFit];
    [(EKUIFocusBannerView *)self->_focusBanner frame];
    double v4 = v3;
    double v6 = v5;
    double v8 = v7;
    v9 = [(CompactWidthWeekViewController *)self view];
    [v9 bounds];
    double v11 = v10;

    -[EKUIFocusBannerView setFrame:](self->_focusBanner, "setFrame:", v4, v6, v11, v8);
  }
  v12.receiver = self;
  v12.super_class = (Class)CompactWidthWeekViewController;
  [(WeekViewController *)&v12 viewWillLayoutSubviews];
}

- (void)updateTimeViewBaseline
{
  double v3 = [(WeekViewController *)self visibleWeeks];
  double v4 = [v3 lastObject];
  id v19 = [v4 weekView];

  double v5 = [v19 allDayView];
  [v5 baselineForWeekdayNumbers];
  double v7 = v6;

  if (v7 > 0.0)
  {
    double v8 = [(WeekViewController *)self timeView];
    v9 = [v19 allDayView];
    [v9 frame];
    double v11 = v10;
    double v13 = v12;
    v14 = [v19 allDayView];
    v15 = [v14 superview];
    [v8 convertPoint:v15 fromView:v11];
    double v17 = v16;

    objc_super v18 = [(WeekViewController *)self timeView];
    [v18 setMonthTextBaselineOffset:v7 + v17];
  }
}

- (void)layoutCellsAnimated:(BOOL)a3
{
  v4.receiver = self;
  v4.super_class = (Class)CompactWidthWeekViewController;
  [(WeekViewController *)&v4 layoutCellsAnimated:a3];
  [(CompactWidthWeekViewController *)self updateTimeViewBaseline];
}

- (void)viewDidLayoutSubviews
{
  v3.receiver = self;
  v3.super_class = (Class)CompactWidthWeekViewController;
  [(WeekViewController *)&v3 viewDidLayoutSubviews];
  [(CompactWidthWeekViewController *)self updateTimeViewBaseline];
}

- (double)headerVerticalOffset
{
  unsigned int v3 = [(CompactWidthWeekViewController *)self _focusBannerVisible];
  double result = 0.0;
  if (v3)
  {
    [(EKUIFocusBannerView *)self->_focusBanner frame];
    return v5;
  }
  return result;
}

- (void)updateBannerDateStrings:(id)a3
{
  id v4 = a3;
  id v21 = +[CalChronometry activeCalendar];
  double v5 = [v4 date];

  double v6 = [v21 components:2097278 fromDate:v5];

  double v7 = CUIKTodayComponents();
  id v8 = [v6 month];
  if (v8 == [v7 month] && (id v9 = objc_msgSend(v6, "year"), v9 == objc_msgSend(v7, "year")))
  {
    id v10 = [v6 era];
    BOOL v11 = v10 == [v7 era];
    if (!v6) {
      goto LABEL_8;
    }
  }
  else
  {
    BOOL v11 = 0;
    if (!v6) {
      goto LABEL_8;
    }
  }
  if ([v6 month] != self->_currentlyDisplayedMonth)
  {
    self->_currentlyDisplayedMonth = (int64_t)[v6 month];
    [v6 month];
    double v12 = CUIKStringAbbreviationForMonth();
    double v13 = [(WeekViewController *)self timeView];
    [v13 setMonthText:v12 isCurrentMonth:v11];
  }
LABEL_8:
  if ([(WeekViewController *)self showOverlayCalendar])
  {
    v14 = CUIKGetOverlayCalendar();
    v15 = CUIKCalendar();
    double v16 = [(WeekViewController *)self centerDateComponents];
    double v17 = [v15 dateFromComponents:v16];

    id v18 = [v14 component:8 fromDate:v17];
    if (v18 != self->_currentlyDisplayedMonthInOverlayCalendar)
    {
      self->_currentlyDisplayedMonthInOverlayCalendar = (int64_t)v18;
      id v19 = +[CUIKDateStrings overlayYearStringForDate:v17 inCalendar:v14];
      v20 = [(WeekViewController *)self timeView];
      [v20 setOverlayMonthText:v19];
    }
  }
}

- (void)overlayCalendarDidChange
{
  v9.receiver = self;
  v9.super_class = (Class)CompactWidthWeekViewController;
  [(WeekViewController *)&v9 overlayCalendarDidChange];
  if ([(WeekViewController *)self showOverlayCalendar])
  {
    unsigned int v3 = +[CalChronometry activeCalendar];
    id v4 = [(WeekViewController *)self centerDateComponents];
    id v5 = objc_alloc((Class)EKCalendarDate);
    double v6 = [v3 timeZone];
    id v7 = [v5 initWithDateComponents:v4 timeZone:v6];

    [(CompactWidthWeekViewController *)self updateBannerDateStrings:v7];
  }
  else
  {
    id v8 = [(WeekViewController *)self timeView];
    [v8 setOverlayMonthText:0];

    self->_currentlyDisplayedMonthInOverlayCalendar = -1;
  }
}

- (BOOL)_focusBannerVisible
{
  v2 = [(WeekViewController *)self model];
  BOOL v3 = [v2 focusFilterMode] != 0;

  return v3;
}

- (void)_focusConfigurationChanged
{
  unsigned int v3 = [(CompactWidthWeekViewController *)self _focusBannerVisible];
  id v4 = [(EKUIFocusBannerView *)self->_focusBanner superview];
  BOOL v5 = v4 == 0;

  if (((v3 ^ v5) & 1) == 0)
  {
    focusBanner = self->_focusBanner;
    if (v3)
    {
      if (!focusBanner)
      {
        id v7 = (EKUIFocusBannerView *)objc_opt_new();
        id v8 = self->_focusBanner;
        self->_focusBanner = v7;

        [(EKUIFocusBannerView *)self->_focusBanner setDelegate:self];
        [(EKUIFocusBannerView *)self->_focusBanner setLayout:1];
      }
      objc_super v9 = [(CompactWidthWeekViewController *)self view];
      [v9 addSubview:self->_focusBanner];

      id v10 = [(WeekViewController *)self model];
      -[EKUIFocusBannerView setOn:](self->_focusBanner, "setOn:", [v10 focusFilterMode] == (id)1);
    }
    else
    {
      [(EKUIFocusBannerView *)focusBanner removeFromSuperview];
    }
  }
  id v11 = [(CompactWidthWeekViewController *)self view];
  [v11 setNeedsLayout];
}

- (BOOL)eventViewControllerShouldHideInlineEditButton
{
  return 1;
}

- (void)editorDidSaveEvent:(id)a3
{
  id v4 = a3;
  BOOL v5 = [(WeekViewController *)self model];
  [v5 addOccurrenceAwaitingRefresh:v4];

  [(WeekViewController *)self reloadData];
}

- (void)focusBannerViewToggled:(id)a3
{
  if ([(EKUIFocusBannerView *)self->_focusBanner on]) {
    uint64_t v4 = 1;
  }
  else {
    uint64_t v4 = 2;
  }
  id v5 = [(WeekViewController *)self model];
  [v5 setFocusFilterMode:v4];
}

- (id)animationControllerForPresentedController:(id)a3 presentingController:(id)a4 sourceController:(id)a5
{
  id v5 = a3;
  if ([v5 conformsToProtocol:&OBJC_PROTOCOL___UIViewControllerAnimatedTransitioning]) {
    id v6 = v5;
  }
  else {
    id v6 = 0;
  }

  return v6;
}

- (id)animationControllerForDismissedController:(id)a3
{
  id v3 = a3;
  if ([v3 conformsToProtocol:&OBJC_PROTOCOL___UIViewControllerAnimatedTransitioning]) {
    id v4 = v3;
  }
  else {
    id v4 = 0;
  }

  return v4;
}

- (id)interactionControllerForPresentation:(id)a3
{
  id v3 = a3;
  if ([v3 conformsToProtocol:&OBJC_PROTOCOL___UIViewControllerInteractiveTransitioning]) {
    id v4 = v3;
  }
  else {
    id v4 = 0;
  }

  return v4;
}

- (BOOL)shouldShowCompactLayout
{
  return 1;
}

- (void)showReminderDetail:(id)a3
{
  id v4 = a3;
  id v7 = [(MainViewController *)self augmentEventDetailsContext:0];
  id v5 = objc_alloc_init((Class)UINavigationController);
  id v6 = +[EKEventViewController eventDetailViewControllerWithEvent:v4 delegate:self context:v7];

  [v5 pushViewController:v6 animated:0];
  [(CompactWidthWeekViewController *)self showViewController:v5 sender:self animated:1 completion:0];
}

- (void).cxx_destruct
{
}

@end