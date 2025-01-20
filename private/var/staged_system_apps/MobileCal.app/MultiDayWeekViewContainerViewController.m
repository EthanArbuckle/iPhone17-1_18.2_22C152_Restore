@interface MultiDayWeekViewContainerViewController
- (BOOL)representsDayInViewHierarchy;
- (Class)childViewControllerClassForTraits:(id)a3;
- (MultiDayWeekViewController)multiDayController;
- (id)childViewControllerForCompactWidthRegularHeight;
- (id)currentChildViewController;
- (id)pushedNextLevelMainViewControllerContainerAnimated:(BOOL)a3;
- (void)setMultiDayController:(id)a3;
@end

@implementation MultiDayWeekViewContainerViewController

- (id)currentChildViewController
{
  v4.receiver = self;
  v4.super_class = (Class)MultiDayWeekViewContainerViewController;
  v2 = [(WeekViewContainerViewController *)&v4 currentChildViewController];

  return v2;
}

- (id)childViewControllerForCompactWidthRegularHeight
{
  v3 = *(LargeWeekViewController **)((char *)&self->super._regularController + 1);
  if (!v3)
  {
    objc_super v4 = [MultiDayWeekViewController alloc];
    v5 = [(MainViewController *)self model];
    v6 = [(MainViewController *)self window];
    v7 = [(MultiDayWeekViewController *)v4 initWithModel:v5 window:v6];
    v8 = *(LargeWeekViewController **)((char *)&self->super._regularController + 1);
    *(LargeWeekViewController **)((char *)&self->super._regularController + 1) = v7;

    v9 = *(LargeWeekViewController **)((char *)&self->super._regularController + 1);
    v10 = [(MultiDayWeekViewContainerViewController *)self navigationController];
    [v9 setDelegate:v10];

    v3 = *(LargeWeekViewController **)((char *)&self->super._regularController + 1);
  }

  return v3;
}

- (id)pushedNextLevelMainViewControllerContainerAnimated:(BOOL)a3
{
  return 0;
}

- (BOOL)representsDayInViewHierarchy
{
  return 1;
}

- (Class)childViewControllerClassForTraits:(id)a3
{
  return (Class)objc_opt_class();
}

- (MultiDayWeekViewController)multiDayController
{
  return *(MultiDayWeekViewController **)((char *)&self->super._regularController + 1);
}

- (void)setMultiDayController:(id)a3
{
}

- (void).cxx_destruct
{
}

@end