@interface YearViewContainerViewController
- (Class)childViewControllerClassForTraits:(id)a3;
- (CompactYearViewController)compactController;
- (LargeYearViewController)regularController;
- (id)_pushMonthViewControllerWithDate:(id)a3 animated:(BOOL)a4;
- (id)childViewControllerForCompactWidthRegularHeight;
- (id)childViewControllerForRegularWidthRegularHeight;
- (id)currentChildViewController;
- (id)pushedNextLevelMainViewControllerContainerAnimated:(BOOL)a3;
- (void)pushContentViewOfType:(int64_t)a3 date:(id)a4 animated:(BOOL)a5;
- (void)setCompactController:(id)a3;
- (void)setRegularController:(id)a3;
@end

@implementation YearViewContainerViewController

- (id)pushedNextLevelMainViewControllerContainerAnimated:(BOOL)a3
{
  BOOL v3 = a3;
  id v5 = [(YearViewContainerViewController *)self currentChildViewController];
  v6 = [(MainViewController *)self model];
  v7 = [v6 selectedDate];
  v8 = [(YearViewContainerViewController *)self _pushMonthViewControllerWithDate:v7 animated:v3];

  return v8;
}

- (id)_pushMonthViewControllerWithDate:(id)a3 animated:(BOOL)a4
{
  BOOL v4 = a4;
  id v6 = a3;
  v7 = [(MainViewController *)self model];
  [v7 setSelectedDate:v6];

  v8 = [(YearViewContainerViewController *)self navigationController];
  v9 = [v8 viewControllers];
  if ((unint64_t)[v9 count] <= 1)
  {
  }
  else
  {
    v10 = [(YearViewContainerViewController *)self navigationController];
    v11 = [v10 viewControllers];
    v12 = [v11 objectAtIndex:1];
    objc_opt_class();
    char isKindOfClass = objc_opt_isKindOfClass();

    if (isKindOfClass)
    {
      v14 = [(YearViewContainerViewController *)self navigationController];
      v15 = [v14 viewControllers];
      v16 = [v15 objectAtIndex:1];

      goto LABEL_9;
    }
  }
  v17 = (MonthViewContainerViewController *)*(id *)(&self->super._animatingViewTransition + 1);
  v16 = v17;
  if (!v17)
  {
    v18 = [MonthViewContainerViewController alloc];
    v19 = [(MainViewController *)self model];
    v20 = [(MainViewController *)self window];
    v16 = [(MainViewControllerContainer *)v18 initWithModel:v19 window:v20];
  }
  v21 = [(YearViewContainerViewController *)self navigationController];
  [v21 pushViewController:v16 animated:v4];

  if (v17) {
    [(MainViewController *)v16 traitCollectionDidChange:0];
  }
LABEL_9:
  objc_storeStrong((id *)(&self->super._animatingViewTransition + 1), v16);

  return v16;
}

- (id)childViewControllerForCompactWidthRegularHeight
{
  BOOL v3 = *(MonthViewContainerViewController **)((char *)&self->_cachedMonthViewController + 1);
  if (!v3)
  {
    BOOL v4 = [(MainViewController *)self model];
    id v5 = [v4 selectedDate];

    id v6 = [CompactYearViewController alloc];
    v7 = [(MainViewController *)self model];
    v8 = [(MainViewController *)self window];
    v9 = [(YearViewController *)v6 initWithCalendarDate:v5 model:v7 window:v8];
    v10 = *(MonthViewContainerViewController **)((char *)&self->_cachedMonthViewController + 1);
    *(MonthViewContainerViewController **)((char *)&self->_cachedMonthViewController + 1) = v9;

    [*(id *)((char *)&self->_cachedMonthViewController + 1) setPushDelegate:self];
    BOOL v3 = *(MonthViewContainerViewController **)((char *)&self->_cachedMonthViewController + 1);
  }

  return v3;
}

- (id)currentChildViewController
{
  v4.receiver = self;
  v4.super_class = (Class)YearViewContainerViewController;
  v2 = [(MainViewControllerContainer *)&v4 currentChildViewController];

  return v2;
}

- (id)childViewControllerForRegularWidthRegularHeight
{
  BOOL v3 = *(CompactYearViewController **)((char *)&self->_compactController + 1);
  if (!v3)
  {
    objc_super v4 = [(MainViewController *)self model];
    id v5 = [v4 selectedDate];

    id v6 = [LargeYearViewController alloc];
    v7 = [(MainViewController *)self model];
    v8 = [(MainViewController *)self window];
    v9 = [(YearViewController *)v6 initWithCalendarDate:v5 model:v7 window:v8];
    v10 = *(CompactYearViewController **)((char *)&self->_compactController + 1);
    *(CompactYearViewController **)((char *)&self->_compactController + 1) = v9;

    [*(id *)((char *)&self->_compactController + 1) setPushDelegate:self];
    BOOL v3 = *(CompactYearViewController **)((char *)&self->_compactController + 1);
  }

  return v3;
}

- (Class)childViewControllerClassForTraits:(id)a3
{
  [a3 horizontalSizeClass];
  BOOL v3 = objc_opt_class();

  return (Class)v3;
}

- (void)pushContentViewOfType:(int64_t)a3 date:(id)a4 animated:(BOOL)a5
{
  BOOL v5 = a5;
  id v8 = a4;
  id v12 = v8;
  if ((a3 & 0xFFFFFFFFFFFFFFFELL) == 2)
  {
    v9 = [(YearViewContainerViewController *)self navigationController];
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      id v10 = [v9 pushCalendarViewControllerWithViewType:a3 andDate:v12];
    }
  }
  else
  {
    id v11 = [(YearViewContainerViewController *)self _pushMonthViewControllerWithDate:v8 animated:v5];
  }
}

- (CompactYearViewController)compactController
{
  return *(CompactYearViewController **)((char *)&self->_cachedMonthViewController + 1);
}

- (void)setCompactController:(id)a3
{
}

- (LargeYearViewController)regularController
{
  return *(LargeYearViewController **)((char *)&self->_compactController + 1);
}

- (void)setRegularController:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)((char *)&self->_compactController + 1), 0);
  objc_storeStrong((id *)((char *)&self->_cachedMonthViewController + 1), 0);

  objc_storeStrong((id *)(&self->super._animatingViewTransition + 1), 0);
}

@end