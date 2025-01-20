@interface LargeTextLargeMonthViewController
+ (BOOL)shouldAnimateTransitionToDay;
+ (Class)monthWeekViewClass;
- (BOOL)allowsOverriddenRightNavigationBarItems;
- (BOOL)allowsOverriddenToolbarItems;
- (BOOL)dividedListMode;
- (BOOL)pinchToZoomAllowed;
- (id)nextLevelWeekViewControllerWithDate:(id)a3;
- (id)pushedWeekViewControllerWithDate:(id)a3 animated:(BOOL)a4;
- (int64_t)presentationStyleOverrideForChildViewControllers;
- (void)didScroll;
- (void)updateNavigationBarDisplayedDateString;
- (void)updatePalette:(id)a3;
@end

@implementation LargeTextLargeMonthViewController

+ (Class)monthWeekViewClass
{
  return (Class)objc_opt_class();
}

+ (BOOL)shouldAnimateTransitionToDay
{
  return 0;
}

- (id)pushedWeekViewControllerWithDate:(id)a3 animated:(BOOL)a4
{
  BOOL v4 = a4;
  v6 = [(LargeTextLargeMonthViewController *)self nextLevelWeekViewControllerWithDate:a3];
  v7 = [(LargeTextLargeMonthViewController *)self navigationController];
  [v7 pushViewController:v6 animated:v4];

  return v6;
}

- (id)nextLevelWeekViewControllerWithDate:(id)a3
{
  [(CUIKCalendarModel *)self->super.super.super.super.super._model setSelectedDate:a3];
  BOOL v4 = [WeekViewContainerViewController alloc];
  model = self->super.super.super.super.super._model;
  v6 = [(MainViewController *)self window];
  v7 = [(MainViewControllerContainer *)v4 initWithModel:model window:v6];

  return v7;
}

- (void)updatePalette:(id)a3
{
  v4.receiver = self;
  v4.super_class = (Class)LargeTextLargeMonthViewController;
  id v3 = a3;
  [(CompactWidthMonthViewController *)&v4 updatePalette:v3];
  [v3 setTodayButtonVisible:1];
  [v3 setDateStringVisible:1];
}

- (void)updateNavigationBarDisplayedDateString
{
  id v4 = [(InfiniteScrollViewController *)self dateOfCenterViewOnScreen];
  id v3 = [(LargeTextLargeMonthViewController *)self navigationController];
  [v3 setNavBarStringFromDate:v4 includeMonth:1 includeYear:1];
}

- (BOOL)dividedListMode
{
  return 0;
}

- (int64_t)presentationStyleOverrideForChildViewControllers
{
  return -52534682;
}

- (BOOL)allowsOverriddenRightNavigationBarItems
{
  return 0;
}

- (BOOL)allowsOverriddenToolbarItems
{
  return 0;
}

- (BOOL)pinchToZoomAllowed
{
  return 0;
}

- (void)didScroll
{
  v8.receiver = self;
  v8.super_class = (Class)LargeTextLargeMonthViewController;
  [(CompactWidthMonthViewController *)&v8 didScroll];
  id v3 = [(CompactWidthMonthViewController *)self targetCalendarDate];
  if (v3)
  {
    id v4 = [(LargeTextLargeMonthViewController *)self navigationController];
    v5 = [v4 topMainViewControllerContainer];
    if ([v5 currentChildViewControllerIsLoaded])
    {
      v6 = [v4 topMainViewControllerContainer];
      v7 = [v6 currentChildViewController];

      if (v7 == self) {
        [v4 setNavBarStringFromDate:v3 includeMonth:1 includeYear:1];
      }
    }
    else
    {
    }
  }
}

@end