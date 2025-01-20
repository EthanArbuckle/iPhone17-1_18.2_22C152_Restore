@interface CompactDayViewController
- (BOOL)eventViewControllerShouldHideInlineEditButton;
- (BOOL)shouldShowCompactLayout;
- (BOOL)showWeekdayLabel;
- (id)animationControllerForDismissedController:(id)a3;
- (id)animationControllerForPresentedController:(id)a3 presentingController:(id)a4 sourceController:(id)a5;
- (id)calendarModel;
- (id)cellFactory;
- (id)dayHeaderFrames;
- (id)interactionControllerForPresentation:(id)a3;
- (id)occurrenceViewForEvent:(id)a3;
- (id)showDetailViewControllerForEvent:(id)a3 context:(id)a4 animated:(BOOL)a5;
- (id)showDetailViewControllerForEvents:(id)a3 animated:(BOOL)a4;
- (int)supportedToggleMode;
- (int64_t)intendedSizeClass;
- (int64_t)presentationStyleOverrideForChildViewControllers;
- (unint64_t)supportedInterfaceOrientations;
- (void)_receivedSelectedDateChangeNotification:(id)a3;
- (void)_updateBackButtonOnBackViewControllerToDate:(id)a3;
- (void)_updateWeekDayHeaderDayFrames;
- (void)dayViewController:(id)a3 didStartDeceleratingTargettingDate:(id)a4;
- (void)eventEditViewController:(id)a3 didCompleteWithAction:(int64_t)a4;
- (void)eventEditViewController:(id)a3 didCompleteWithAction:(int64_t)a4 completionHandler:(id)a5;
- (void)showEditViewController:(id)a3;
- (void)showViewController:(id)a3 sender:(id)a4 animated:(BOOL)a5 completion:(id)a6;
- (void)updatePalette:(id)a3;
- (void)viewDidAppear:(BOOL)a3;
- (void)viewIsAppearing:(BOOL)a3;
- (void)viewWillTransitionToSize:(CGSize)a3 withTransitionCoordinator:(id)a4;
- (void)willMoveToParentViewController:(id)a3;
@end

@implementation CompactDayViewController

- (void)willMoveToParentViewController:(id)a3
{
  v8.receiver = self;
  v8.super_class = (Class)CompactDayViewController;
  -[CompactDayViewController willMoveToParentViewController:](&v8, "willMoveToParentViewController:");
  if (a3)
  {
    v5 = [(MainViewController *)self model];
    v6 = [v5 selectedOccurrence];

    if (v6)
    {
      v7 = [(MainViewController *)self model];
      [v7 setSelectedOccurrence:0];
    }
  }
}

- (void)_updateBackButtonOnBackViewControllerToDate:(id)a3
{
  id v5 = a3;
  v4 = [(CompactDayViewController *)self navigationController];
  if (objc_opt_respondsToSelector()) {
    [v4 updateBackButtonToDate:v5];
  }
}

- (void)_receivedSelectedDateChangeNotification:(id)a3
{
  v6.receiver = self;
  v6.super_class = (Class)CompactDayViewController;
  [(DayViewController *)&v6 _receivedSelectedDateChangeNotification:a3];
  v4 = [(MainViewController *)self model];
  id v5 = [v4 selectedDate];
  [(CompactDayViewController *)self _updateBackButtonOnBackViewControllerToDate:v5];
}

- (void)viewDidAppear:(BOOL)a3
{
  v10.receiver = self;
  v10.super_class = (Class)CompactDayViewController;
  [(DayViewController *)&v10 viewDidAppear:a3];
  v4 = (void *)kCalUILogHandle;
  if (os_log_type_enabled((os_log_t)kCalUILogHandle, OS_LOG_TYPE_INFO))
  {
    id v5 = v4;
    objc_super v6 = (objc_class *)objc_opt_class();
    v7 = NSStringFromClass(v6);
    objc_super v8 = [(DayViewController *)self day];
    v9 = [v8 date];
    *(_DWORD *)buf = 138543618;
    v12 = v7;
    __int16 v13 = 2114;
    v14 = v9;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_INFO, "[UserStateLog] State -> %{public}@ viewDidAppear. date = %{public}@", buf, 0x16u);
  }
}

- (id)dayHeaderFrames
{
  v3 = +[NSMutableArray array];
  double x = CGRectZero.origin.x;
  double y = CGRectZero.origin.y;
  [(DayViewController *)self cellSize];
  double v7 = v6;
  double v9 = v8;
  uint64_t v10 = 7;
  do
  {
    int IsLeftToRight = CalTimeDirectionIsLeftToRight();
    v12 = +[NSValue valueWithCGRect:](NSValue, "valueWithCGRect:", x, y, v7, v9);
    if (IsLeftToRight) {
      [v3 addObject:v12];
    }
    else {
      [v3 insertObject:v12 atIndex:0];
    }

    v15.origin.double x = x;
    v15.origin.double y = y;
    v15.size.width = v7;
    v15.size.height = v9;
    double x = CGRectGetMaxX(v15);
    --v10;
  }
  while (v10);

  return v3;
}

- (void)updatePalette:(id)a3
{
  id v4 = a3;
  [v4 setTodayButtonVisible:0];
  [v4 setDateStringVisible:0];
  [v4 setDividerLineVisible:1];
  [v4 setFocusBannerPlacement:1];
  v7.receiver = self;
  v7.super_class = (Class)CompactDayViewController;
  [(DayViewController *)&v7 updatePalette:v4];
  [(CompactDayViewController *)self _updateWeekDayHeaderDayFrames];
  id v5 = *(void **)(&self->super._shouldRespondToApplicationDidBecomeActiveStateChange + 1);
  *(void *)(&self->super._shouldRespondToApplicationDidBecomeActiveStateChange + 1) = v4;
  id v6 = v4;

  [v6 setNeedsLayout];
}

- (void)_updateWeekDayHeaderDayFrames
{
  v2 = *(void **)(&self->super._shouldRespondToApplicationDidBecomeActiveStateChange + 1);
  id v3 = [(CompactDayViewController *)self dayHeaderFrames];
  [v2 setDayHeaderFrames:v3];
}

- (void)viewIsAppearing:(BOOL)a3
{
  v4.receiver = self;
  v4.super_class = (Class)CompactDayViewController;
  [(CompactDayViewController *)&v4 viewIsAppearing:a3];
  [(CompactDayViewController *)self ekui_adjustNavAndToolBarToTranslucentGrayStyles];
}

- (int)supportedToggleMode
{
  return 1;
}

- (unint64_t)supportedInterfaceOrientations
{
  return 2;
}

- (BOOL)showWeekdayLabel
{
  return 1;
}

- (int64_t)intendedSizeClass
{
  return 1;
}

- (id)cellFactory
{
  v2 = objc_opt_new();

  return v2;
}

- (void)viewWillTransitionToSize:(CGSize)a3 withTransitionCoordinator:(id)a4
{
  double height = a3.height;
  double width = a3.width;
  v9.receiver = self;
  v9.super_class = (Class)CompactDayViewController;
  -[DayViewController viewWillTransitionToSize:withTransitionCoordinator:](&v9, "viewWillTransitionToSize:withTransitionCoordinator:", a4);
  if (height > width) {
    uint64_t v7 = 1;
  }
  else {
    uint64_t v7 = 4;
  }
  double v8 = [(DayViewController *)self dayView];
  [v8 validateInterfaceOrientationWithFutureOrientation:v7];
}

- (void)dayViewController:(id)a3 didStartDeceleratingTargettingDate:(id)a4
{
  v11.receiver = self;
  v11.super_class = (Class)CompactDayViewController;
  id v6 = a4;
  [(DayViewController *)&v11 dayViewController:a3 didStartDeceleratingTargettingDate:v6];
  uint64_t v7 = [(MainViewController *)self model];
  double v8 = [v7 calendar];
  objc_super v9 = [v8 timeZone];
  uint64_t v10 = +[EKCalendarDate calendarDateWithDateComponents:v6 timeZone:v9];

  [(CompactDayViewController *)self _updateBackButtonOnBackViewControllerToDate:v10];
}

- (id)showDetailViewControllerForEvent:(id)a3 context:(id)a4 animated:(BOOL)a5
{
  BOOL v23 = a5;
  id v7 = a4;
  id v22 = a3;
  double v8 = [(CompactDayViewController *)self parentViewController];
  objc_super v9 = [v8 navigationItem];
  uint64_t v10 = [(MainViewController *)self model];
  objc_super v11 = [v10 selectedDate];
  v12 = [v11 dayComponents];
  __int16 v13 = [(MainViewController *)self model];
  v14 = [v13 calendar];
  CGRect v15 = CUIKStringForDateComponents();
  [v9 setBackButtonTitle:v15];

  v16 = [(MainViewController *)self augmentEventDetailsContext:v7];

  v17 = +[EKEventViewController eventDetailViewControllerWithEvent:v22 delegate:self context:v16];

  [(CompactDayViewController *)self ekui_adjustToolBarToTransparentStyle];
  [v17 ekui_adjustNavBarToTransparentStyle];
  v18 = +[NSBundle bundleForClass:objc_opt_class()];
  v19 = [v18 localizedStringForKey:@"Day" value:&stru_1001D6918 table:0];
  v20 = [(CompactDayViewController *)self navigationItem];
  [v20 setTitle:v19];

  [(CompactDayViewController *)self showViewController:v17 sender:self animated:v23 completion:0];

  return v17;
}

- (id)showDetailViewControllerForEvents:(id)a3 animated:(BOOL)a4
{
  BOOL v4 = a4;
  id v6 = a3;
  id v7 = [objc_alloc((Class)EKExpandedReminderStackViewController) initWithEvents:v6 delegate:self];

  [v7 setTransitioningDelegate:self];
  [v7 setPreferModalPresentation:1];
  [(CompactDayViewController *)self showViewController:v7 sender:self animated:v4 completion:0];

  return v7;
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
  __int16 v13 = [(CompactDayViewController *)self presentedViewController];
  objc_opt_class();
  char isKindOfClass = objc_opt_isKindOfClass();

  if (isKindOfClass)
  {
    CGRect v15 = [(CompactDayViewController *)self presentedViewController];
    v16 = [v10 presentationController];
    [v16 setDelegate:v15];

    v17 = [(CompactDayViewController *)self presentedViewController];
    [v17 presentViewController:v10 animated:1 completion:0];
  }
  else
  {
    v18.receiver = self;
    v18.super_class = (Class)CompactDayViewController;
    [(MainViewController *)&v18 showViewController:v10 sender:v11 animated:v7 completion:v12];
  }
}

- (void)showEditViewController:(id)a3
{
  id v7 = a3;
  BOOL v4 = [v7 event];
  unsigned int v5 = [v4 isNew];

  if (v5) {
    [v7 setModalPresentationDelegate:self];
  }
  id v6 = [(CompactDayViewController *)self navigationController];
  [v6 presentViewController:v7 animated:1 completion:0];
}

- (int64_t)presentationStyleOverrideForChildViewControllers
{
  return 0;
}

- (id)occurrenceViewForEvent:(id)a3
{
  id v4 = a3;
  unsigned int v5 = [(DayViewController *)self dayView];
  id v6 = [v5 occurrenceViewForEvent:v4];

  return v6;
}

- (BOOL)shouldShowCompactLayout
{
  return 1;
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

- (BOOL)eventViewControllerShouldHideInlineEditButton
{
  return 1;
}

- (void)eventEditViewController:(id)a3 didCompleteWithAction:(int64_t)a4
{
}

- (void)eventEditViewController:(id)a3 didCompleteWithAction:(int64_t)a4 completionHandler:(id)a5
{
  id v8 = a5;
  id v9 = a3;
  id v10 = [(MainViewController *)self model];
  id v11 = [v10 selectedOccurrence];

  v13.receiver = self;
  v13.super_class = (Class)CompactDayViewController;
  [(DayViewController *)&v13 eventEditViewController:v9 didCompleteWithAction:a4 completionHandler:v8];

  if (!v11)
  {
    id v12 = [(MainViewController *)self model];
    [v12 setSelectedOccurrence:0];
  }
}

- (id)calendarModel
{
  return self->super.super._model;
}

- (void).cxx_destruct
{
}

@end