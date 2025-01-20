@interface DayViewContainerViewController
- (BOOL)representsDayInViewHierarchy;
- (Class)childViewControllerClassForTraits:(id)a3;
- (CompactDayViewController)compactController;
- (LargeDayViewController)regularController;
- (id)childViewControllerForCompactWidthRegularHeight;
- (id)childViewControllerForRegularWidthRegularHeight;
- (id)currentChildViewController;
- (void)setCompactController:(id)a3;
- (void)setRegularController:(id)a3;
- (void)viewIsAppearing:(BOOL)a3;
@end

@implementation DayViewContainerViewController

- (void)viewIsAppearing:(BOOL)a3
{
  v8.receiver = self;
  v8.super_class = (Class)DayViewContainerViewController;
  [(DayViewContainerViewController *)&v8 viewIsAppearing:a3];
  v4 = [(DayViewContainerViewController *)self navigationController];
  v5 = [v4 navigationBar];

  v6 = [v5 standardAppearance];
  v7 = +[UIColor clearColor];
  [v6 setShadowColor:v7];

  [v5 setScrollEdgeAppearance:v6];
}

- (id)childViewControllerForCompactWidthRegularHeight
{
  v3 = *(void **)(&self->super._animatingViewTransition + 1);
  if (!v3)
  {
    v4 = [(MainViewController *)self model];
    v5 = [v4 selectedDate];

    v6 = [CompactDayViewController alloc];
    v7 = [(MainViewController *)self model];
    objc_super v8 = [(MainViewController *)self window];
    v9 = [(DayViewController *)v6 initWithDay:v5 model:v7 window:v8];
    v10 = *(void **)(&self->super._animatingViewTransition + 1);
    *(void *)(&self->super._animatingViewTransition + 1) = v9;

    v3 = *(void **)(&self->super._animatingViewTransition + 1);
  }

  return v3;
}

- (id)currentChildViewController
{
  v4.receiver = self;
  v4.super_class = (Class)DayViewContainerViewController;
  v2 = [(MainViewControllerContainer *)&v4 currentChildViewController];

  return v2;
}

- (Class)childViewControllerClassForTraits:(id)a3
{
  [a3 horizontalSizeClass];
  v3 = objc_opt_class();

  return (Class)v3;
}

- (id)childViewControllerForRegularWidthRegularHeight
{
  v3 = *(CompactDayViewController **)((char *)&self->_compactController + 1);
  if (!v3)
  {
    objc_super v4 = [(MainViewController *)self model];
    v5 = [v4 selectedDate];

    v6 = [LargeDayViewController alloc];
    v7 = [(MainViewController *)self model];
    objc_super v8 = [(MainViewController *)self window];
    v9 = [(LargeDayViewController *)v6 initWithDay:v5 model:v7 window:v8];
    v10 = *(CompactDayViewController **)((char *)&self->_compactController + 1);
    *(CompactDayViewController **)((char *)&self->_compactController + 1) = v9;

    v3 = *(CompactDayViewController **)((char *)&self->_compactController + 1);
  }

  return v3;
}

- (BOOL)representsDayInViewHierarchy
{
  return 1;
}

- (CompactDayViewController)compactController
{
  return *(CompactDayViewController **)(&self->super._animatingViewTransition + 1);
}

- (void)setCompactController:(id)a3
{
}

- (LargeDayViewController)regularController
{
  return *(LargeDayViewController **)((char *)&self->_compactController + 1);
}

- (void)setRegularController:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)((char *)&self->_compactController + 1), 0);

  objc_storeStrong((id *)(&self->super._animatingViewTransition + 1), 0);
}

@end