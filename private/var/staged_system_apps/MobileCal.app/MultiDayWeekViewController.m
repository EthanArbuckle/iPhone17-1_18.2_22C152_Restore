@interface MultiDayWeekViewController
- (BOOL)eventViewControllerShouldHideInlineEditButton;
- (BOOL)shouldShowCompactLayout;
- (BOOL)usesMultiDayWeekView;
- (CGSize)cellSize;
- (Class)weekViewClass;
- (MultiDayWeekViewController)initWithModel:(id)a3 window:(id)a4;
- (double)headerVerticalOffset;
- (id)animationControllerForDismissedController:(id)a3;
- (id)animationControllerForPresentedController:(id)a3 presentingController:(id)a4 sourceController:(id)a5;
- (id)cellFactory;
- (id)dateForWeek:(int64_t)a3;
- (id)dayHeaderFrames;
- (id)dayScrubberController;
- (id)interactionControllerForPresentation:(id)a3;
- (id)pushedDayViewControllerWithDate:(id)a3 animated:(BOOL)a4;
- (int)supportedToggleMode;
- (int64_t)intendedSizeClass;
- (int64_t)numMultiDays;
- (unint64_t)daysInWeek;
- (void)_calendarModelTimeZoneChanged:(id)a3;
- (void)_sceneEnteredForeground:(id)a3;
- (void)_significantTimeChanged:(id)a3;
- (void)_updateWeekDayHeaderDayFrames;
- (void)dayNavigationViewController:(id)a3 didSelectDate:(id)a4;
- (void)displayedDateChanged:(id)a3 userInitiated:(BOOL)a4;
- (void)selectDate:(id)a3 animated:(BOOL)a4;
- (void)setDisplayedDate:(id)a3 forceScroll:(BOOL)a4 animated:(BOOL)a5;
- (void)setNumMultiDays:(int64_t)a3;
- (void)showEvent:(id)a3 animated:(BOOL)a4 showMode:(unint64_t)a5 context:(id)a6;
- (void)showEvents:(id)a3 animated:(BOOL)a4 showMode:(unint64_t)a5 context:(id)a6;
- (void)showReminderDetail:(id)a3;
- (void)showViewController:(id)a3 sender:(id)a4 animated:(BOOL)a5 completion:(id)a6;
- (void)updatePalette:(id)a3;
- (void)viewIsAppearing:(BOOL)a3;
- (void)viewWillAppear:(BOOL)a3;
- (void)viewWillTransitionToSize:(CGSize)a3 withTransitionCoordinator:(id)a4;
@end

@implementation MultiDayWeekViewController

- (MultiDayWeekViewController)initWithModel:(id)a3 window:(id)a4
{
  v9.receiver = self;
  v9.super_class = (Class)MultiDayWeekViewController;
  v4 = [(WeekViewController *)&v9 initWithModel:a3 window:a4];
  if (v4)
  {
    v4->_numMultiDays = +[MultiDayWeekView numMultiDays];
    v5 = [[DayNavigationViewController alloc] initWithModel:v4->super.super._model];
    scrubberControllerNeue = v4->_scrubberControllerNeue;
    v4->_scrubberControllerNeue = v5;

    v7 = [(MultiDayWeekViewController *)v4 cellFactory];
    [(DayNavigationViewController *)v4->_scrubberControllerNeue setCellFactory:v7];

    [(DayNavigationViewController *)v4->_scrubberControllerNeue setDelegate:v4];
    [(DayNavigationViewController *)v4->_scrubberControllerNeue setShowsMultiDay:1];
    [(MultiDayWeekViewController *)v4 addChildViewController:v4->_scrubberControllerNeue];
    [(DayNavigationViewController *)v4->_scrubberControllerNeue didMoveToParentViewController:v4];
  }
  return v4;
}

- (void)viewWillAppear:(BOOL)a3
{
  v4.receiver = self;
  v4.super_class = (Class)MultiDayWeekViewController;
  [(WeekViewController *)&v4 viewWillAppear:a3];
  [(WeekViewController *)self _clearSelectedOccurrenceViews];
}

- (void)viewIsAppearing:(BOOL)a3
{
  v4.receiver = self;
  v4.super_class = (Class)MultiDayWeekViewController;
  [(MultiDayWeekViewController *)&v4 viewIsAppearing:a3];
  [(MultiDayWeekViewController *)self ekui_adjustNavAndToolBarToTranslucentGrayStyles];
}

- (void)viewWillTransitionToSize:(CGSize)a3 withTransitionCoordinator:(id)a4
{
  double height = a3.height;
  double width = a3.width;
  v9.receiver = self;
  v9.super_class = (Class)MultiDayWeekViewController;
  id v7 = a4;
  -[WeekViewController viewWillTransitionToSize:withTransitionCoordinator:](&v9, "viewWillTransitionToSize:withTransitionCoordinator:", v7, width, height);
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472;
  v8[2] = sub_10007754C;
  v8[3] = &unk_1001D2E40;
  v8[4] = self;
  [v7 animateAlongsideTransition:0 completion:v8];
}

- (void)_significantTimeChanged:(id)a3
{
  v7.receiver = self;
  v7.super_class = (Class)MultiDayWeekViewController;
  id v4 = a3;
  [(WeekViewController *)&v7 _significantTimeChanged:v4];
  v5 = [v4 userInfo];

  v6 = [v5 objectForKeyedSubscript:CUIKCalendarModelSignificantTimeChangeNotificationDayChangedKey];

  if (([v6 BOOLValue] & 1) != 0 || !v6) {
    [(DayNavigationViewController *)self->_scrubberControllerNeue significantTimeChangeOccurred];
  }
}

- (void)_calendarModelTimeZoneChanged:(id)a3
{
  v4.receiver = self;
  v4.super_class = (Class)MultiDayWeekViewController;
  [(WeekViewController *)&v4 _calendarModelTimeZoneChanged:a3];
  [(DayNavigationViewController *)self->_scrubberControllerNeue timeZoneChanged];
}

- (void)_sceneEnteredForeground:(id)a3
{
}

- (BOOL)usesMultiDayWeekView
{
  return 1;
}

- (Class)weekViewClass
{
  return (Class)objc_opt_class();
}

- (unint64_t)daysInWeek
{
  return self->_numMultiDays;
}

- (id)dateForWeek:(int64_t)a3
{
  int IsLeftToRight = CalTimeDirectionIsLeftToRight();
  v6 = [(WeekViewController *)self referenceWeekStart];
  objc_super v7 = v6;
  if (IsLeftToRight) {
    int64_t v8 = self->_numMultiDays * (a3 - 27040);
  }
  else {
    int64_t v8 = -(self->_numMultiDays * (a3 - 27040));
  }
  objc_super v9 = [v6 calendarDateByAddingDays:v8];

  return v9;
}

- (int)supportedToggleMode
{
  return 1;
}

- (int64_t)intendedSizeClass
{
  return 1;
}

- (double)headerVerticalOffset
{
  return 0.0;
}

- (id)pushedDayViewControllerWithDate:(id)a3 animated:(BOOL)a4
{
  BOOL v4 = a4;
  v6 = [DayViewContainerViewController alloc];
  objc_super v7 = [(WeekViewController *)self model];
  int64_t v8 = [(MainViewController *)self window];
  objc_super v9 = [(MainViewControllerContainer *)v6 initWithModel:v7 window:v8];

  v10 = [(MultiDayWeekViewController *)self navigationController];
  [v10 pushViewController:v9 animated:v4];

  return v9;
}

- (void)showEvent:(id)a3 animated:(BOOL)a4 showMode:(unint64_t)a5 context:(id)a6
{
  BOOL v7 = a4;
  id v10 = a6;
  v18.receiver = self;
  v18.super_class = (Class)MultiDayWeekViewController;
  [(WeekViewController *)&v18 showEvent:a3 animated:v7 showMode:a5 context:v10];
  v11 = [(MultiDayWeekViewController *)self navigationItem];
  [v11 setTitle:0];

  if (!v10
    || ([v10 objectForKeyedSubscript:@"Context_DateSelected"],
        (v12 = objc_claimAutoreleasedReturnValue()) == 0))
  {
    v12 = [(WeekViewController *)self displayedDate];
  }
  v13 = v12;
  v14 = [v12 date];

  v15 = CUIKStringForDate();
  v16 = [(MultiDayWeekViewController *)self parentViewController];
  v17 = [v16 navigationItem];
  [v17 setBackButtonTitle:v15];
}

- (void)showEvents:(id)a3 animated:(BOOL)a4 showMode:(unint64_t)a5 context:(id)a6
{
  BOOL v6 = a4;
  id v8 = a3;
  id v9 = [objc_alloc((Class)EKExpandedReminderStackViewController) initWithEvents:v8 delegate:self];
  [v9 setPreferModalPresentation:1];
  [v9 setTransitioningDelegate:self];
  [(CUIKCalendarModel *)self->super.super._model setSelectedOccurrences:v8];

  [(MultiDayWeekViewController *)self showViewController:v9 sender:self animated:v6 completion:0];
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
  v13 = [(MultiDayWeekViewController *)self presentedViewController];
  objc_opt_class();
  char isKindOfClass = objc_opt_isKindOfClass();

  if (isKindOfClass)
  {
    v15 = [(MultiDayWeekViewController *)self presentedViewController];
    v16 = [v10 presentationController];
    [v16 setDelegate:v15];

    v17 = [(MultiDayWeekViewController *)self presentedViewController];
    [v17 presentViewController:v10 animated:1 completion:0];
  }
  else
  {
    v18.receiver = self;
    v18.super_class = (Class)MultiDayWeekViewController;
    [(MainViewController *)&v18 showViewController:v10 sender:v11 animated:v7 completion:v12];
  }
}

- (void)displayedDateChanged:(id)a3 userInitiated:(BOOL)a4
{
  BOOL v4 = a4;
  id v6 = a3;
  v9.receiver = self;
  v9.super_class = (Class)MultiDayWeekViewController;
  [(WeekViewController *)&v9 displayedDateChanged:v6 userInitiated:v4];
  if (v4)
  {
    BOOL v7 = [(MultiDayWeekViewController *)self dayScrubberController];
    id v8 = [v6 date];
    [v7 setSelectedDate:v8 animated:1];
  }
}

- (void)setDisplayedDate:(id)a3 forceScroll:(BOOL)a4 animated:(BOOL)a5
{
  BOOL v5 = a5;
  v10.receiver = self;
  v10.super_class = (Class)MultiDayWeekViewController;
  id v7 = a3;
  [(WeekViewController *)&v10 setDisplayedDate:v7 forceScroll:1 animated:v5];
  id v8 = [(MultiDayWeekViewController *)self dayScrubberController];
  objc_super v9 = [v7 date];

  [v8 setSelectedDate:v9 animated:v5];
}

- (void)selectDate:(id)a3 animated:(BOOL)a4
{
  BOOL v4 = a4;
  id v10 = a3;
  id v6 = [(WeekViewController *)self model];
  [v6 setSelectedDate:v10];

  id v7 = [v10 calendarDateForDay];
  id v8 = [(WeekViewController *)self displayedDate];
  id v9 = [v7 differenceInDays:v8];

  if (v9 || !v4)
  {
    if (v9) {
      [(WeekViewController *)self setDisplayedDate:v10 animated:v4];
    }
  }
  else
  {
    [(DayNavigationViewController *)self->_scrubberControllerNeue pulseToday];
  }
  [(WeekViewController *)self scrollToCurrentTimeOfDayAnimated:v4];
}

- (id)cellFactory
{
  v2 = objc_opt_new();

  return v2;
}

- (CGSize)cellSize
{
  v2 = [(DayNavigationViewController *)self->_scrubberControllerNeue weekScrollView];
  [v2 cellSize];
  double v4 = v3;
  double v6 = v5;

  double v7 = v4;
  double v8 = v6;
  result.double height = v8;
  result.double width = v7;
  return result;
}

- (id)dayScrubberController
{
  return self->_scrubberControllerNeue;
}

- (void)updatePalette:(id)a3
{
  double v4 = (PaletteView *)a3;
  [(PaletteView *)v4 setWeekdayHeaderVisible:1];
  [(PaletteView *)v4 setWeekdayHeaderFillsHalfWidth:0];
  id v11 = [(MultiDayWeekViewController *)self dayScrubberController];
  [(PaletteView *)v4 setDayScrubberController:v11];
  double v5 = [v11 view];
  [v5 setNeedsLayout];

  [(PaletteView *)v4 setTodayButtonVisible:0];
  [(PaletteView *)v4 setDateStringVisible:0];
  [(PaletteView *)v4 setDividerLineVisible:1];
  [(PaletteView *)v4 setFocusBannerPlacement:1];
  [(MultiDayWeekViewController *)self _updateWeekDayHeaderDayFrames];
  [(PaletteView *)v4 sizeToFit];
  [(PaletteView *)v4 frame];
  double v7 = v6;
  double v8 = [(PaletteView *)v4 containingPalette];
  [v8 setPreferredHeight:v7];

  palette = self->_palette;
  self->_palette = v4;
  id v10 = v4;

  [(PaletteView *)v10 setNeedsLayout];
}

- (void)_updateWeekDayHeaderDayFrames
{
  palette = self->_palette;
  id v3 = [(MultiDayWeekViewController *)self dayHeaderFrames];
  [(PaletteView *)palette setDayHeaderFrames:v3];
}

- (id)dayHeaderFrames
{
  id v3 = +[NSMutableArray array];
  double x = CGRectZero.origin.x;
  double y = CGRectZero.origin.y;
  [(MultiDayWeekViewController *)self cellSize];
  double v7 = v6;
  double v9 = v8;
  uint64_t v10 = 7;
  do
  {
    int IsLeftToRight = CalTimeDirectionIsLeftToRight();
    id v12 = +[NSValue valueWithCGRect:](NSValue, "valueWithCGRect:", x, y, v7, v9);
    if (IsLeftToRight) {
      [v3 addObject:v12];
    }
    else {
      [v3 insertObject:v12 atIndex:0];
    }

    v15.origin.double x = x;
    v15.origin.double y = y;
    v15.size.double width = v7;
    v15.size.double height = v9;
    double x = CGRectGetMaxX(v15);
    --v10;
  }
  while (v10);

  return v3;
}

- (void)dayNavigationViewController:(id)a3 didSelectDate:(id)a4
{
  model = self->super.super._model;
  id v6 = a4;
  double v7 = [(CUIKCalendarModel *)model calendar];
  double v8 = [v7 timeZone];
  id v9 = +[EKCalendarDate calendarDateWithDate:v6 timeZone:v8];

  [(MultiDayWeekViewController *)self setDisplayedDate:v9 forceScroll:1 animated:1];
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
  [(MultiDayWeekViewController *)self showViewController:v5 sender:self animated:1 completion:0];
}

- (BOOL)eventViewControllerShouldHideInlineEditButton
{
  return 1;
}

- (int64_t)numMultiDays
{
  return self->_numMultiDays;
}

- (void)setNumMultiDays:(int64_t)a3
{
  self->_numMultiDays = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_scrubberControllerNeue, 0);

  objc_storeStrong((id *)&self->_palette, 0);
}

@end