@interface MonthViewContainerViewController
- (Class)childViewControllerClassForTraits:(id)a3;
- (CompactWidthMonthViewController)compactWidthController;
- (LargeMonthViewController)standardRegularController;
- (LargeTextLargeMonthViewController)largeTextRegularController;
- (MultiColumnMonthViewController)compactHeightController;
- (id)childViewControllerForCompactWidthRegularHeight;
- (id)childViewControllerForRegularWidthCompactHeight;
- (id)childViewControllerForRegularWidthRegularHeight;
- (id)currentChildViewController;
- (id)nextLevelWeekViewController;
- (id)pushedNextLevelMainViewControllerContainerAnimated:(BOOL)a3;
- (void)childViewControllerChangedForCurrentTraits;
- (void)setCompactHeightController:(id)a3;
- (void)setCompactWidthController:(id)a3;
- (void)setLargeTextRegularController:(id)a3;
- (void)setStandardRegularController:(id)a3;
- (void)willTransitionToTraitCollection:(id)a3 withTransitionCoordinator:(id)a4;
@end

@implementation MonthViewContainerViewController

- (id)childViewControllerForCompactWidthRegularHeight
{
  v3 = *(void **)(&self->super._animatingViewTransition + 1);
  if (!v3)
  {
    v4 = [(MainViewController *)self model];
    v5 = [v4 selectedDate];

    v6 = [CompactWidthMonthViewController alloc];
    v7 = [(MainViewController *)self model];
    v8 = [(MainViewController *)self window];
    v9 = [(CompactWidthMonthViewController *)v6 initWithCalendarDate:v5 model:v7 window:v8];
    v10 = *(void **)(&self->super._animatingViewTransition + 1);
    *(void *)(&self->super._animatingViewTransition + 1) = v9;

    v3 = *(void **)(&self->super._animatingViewTransition + 1);
  }

  return v3;
}

- (Class)childViewControllerClassForTraits:(id)a3
{
  id v4 = a3;
  if ([v4 horizontalSizeClass] == (id)2 && objc_msgSend(v4, "verticalSizeClass") != (id)1)
  {
    v5 = [(MonthViewContainerViewController *)self traitCollection];
    EKUIUsesLargeTextLayout();
  }
  v6 = objc_opt_class();

  return (Class)v6;
}

- (id)pushedNextLevelMainViewControllerContainerAnimated:(BOOL)a3
{
  BOOL v3 = a3;
  v5 = [(MainViewController *)self model];
  v6 = [v5 selectedDate];

  v7 = [(MonthViewContainerViewController *)self currentChildViewController];
  objc_opt_class();
  char isKindOfClass = objc_opt_isKindOfClass();

  if (isKindOfClass)
  {
    char v9 = 0;
  }
  else
  {
    v10 = [(MonthViewContainerViewController *)self currentChildViewController];
    objc_opt_class();
    char v9 = objc_opt_isKindOfClass();
  }
  v11 = [(MonthViewContainerViewController *)self currentChildViewController];
  objc_opt_class();
  char v12 = objc_opt_isKindOfClass();

  v13 = [(MonthViewContainerViewController *)self currentChildViewController];
  objc_opt_class();
  char v14 = objc_opt_isKindOfClass();

  if (v9)
  {
    v15 = [(MainViewController *)self model];
    unsigned int v16 = [v15 showDayAsList];

    if (v16)
    {
      v17 = [(MonthViewContainerViewController *)self currentChildViewController];
      uint64_t v18 = [v17 pushedListViewControllerWithDate:v6 animated:v3];
    }
    else
    {
      BOOL v19 = (_os_feature_enabled_impl() & 1) != 0 || _os_feature_enabled_impl();
      v21 = [(MainViewController *)self model];
      id v22 = [v21 numDaysToShow];

      v23 = [(MonthViewContainerViewController *)self currentChildViewController];
      v17 = v23;
      if (v19 && v22 == (id)2)
      {
        uint64_t v18 = [v23 pushedMultiDayViewControllerWithDate:v6 animated:v3];
      }
      else
      {
        uint64_t v18 = [v23 pushedDayViewControllerWithDate:v6 animated:v3];
      }
    }
  }
  else
  {
    if ((v12 & 1) == 0 && (v14 & 1) == 0 && (isKindOfClass & 1) == 0)
    {
      v20 = 0;
      goto LABEL_21;
    }
    v17 = [(MonthViewContainerViewController *)self currentChildViewController];
    uint64_t v18 = [v17 pushedWeekViewControllerWithDate:v6 animated:0];
  }
  v20 = (void *)v18;

LABEL_21:

  return v20;
}

- (id)currentChildViewController
{
  v4.receiver = self;
  v4.super_class = (Class)MonthViewContainerViewController;
  v2 = [(MainViewControllerContainer *)&v4 currentChildViewController];

  return v2;
}

- (void)childViewControllerChangedForCurrentTraits
{
  id v4 = [(MonthViewContainerViewController *)self traitCollection];
  if ([v4 horizontalSizeClass] == (id)2)
  {
    unsigned int v3 = [(MonthViewContainerViewController *)self isViewLoaded];

    if (v3)
    {
      [(MainViewControllerContainer *)self setupForViewAppearance];
    }
  }
  else
  {
  }
}

- (void)willTransitionToTraitCollection:(id)a3 withTransitionCoordinator:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v8 = [(MonthViewContainerViewController *)self traitCollection];
  char v9 = [(MonthViewContainerViewController *)self currentChildViewController];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    v10 = [(MonthViewContainerViewController *)self currentChildViewController];
    unsigned int v11 = [v10 dividedListMode];
  }
  else
  {
    unsigned int v11 = 0;
  }
  if ([v8 horizontalSizeClass] == (id)1)
  {
    char v12 = [(MonthViewContainerViewController *)self navigationController];
    v13 = [v12 topViewController];

    if (v13 == self && !v11)
    {
      char v14 = [(MainViewControllerContainer *)self bestDateForNewEvent];
      if (v14)
      {
        v15 = [(MainViewController *)self model];
        [v15 setSelectedDate:v14];
      }
      else
      {
        unsigned int v16 = kCalUILogHandle;
        if (os_log_type_enabled((os_log_t)kCalUILogHandle, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 138412290;
          BOOL v19 = self;
          _os_log_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_ERROR, "%@ was unable to find bestDateForNewEvent!", buf, 0xCu);
        }
      }
    }
  }
  v17.receiver = self;
  v17.super_class = (Class)MonthViewContainerViewController;
  [(MainViewController *)&v17 willTransitionToTraitCollection:v6 withTransitionCoordinator:v7];
}

- (id)nextLevelWeekViewController
{
  unsigned int v3 = [(MainViewController *)self model];
  id v4 = [v3 selectedDate];

  v5 = [(MonthViewContainerViewController *)self currentChildViewController];
  objc_opt_class();
  char isKindOfClass = objc_opt_isKindOfClass();

  id v7 = [(MonthViewContainerViewController *)self currentChildViewController];
  if (isKindOfClass) {
    goto LABEL_5;
  }
  objc_opt_class();
  char v8 = objc_opt_isKindOfClass();

  id v7 = [(MonthViewContainerViewController *)self currentChildViewController];
  if (v8) {
    goto LABEL_5;
  }
  objc_opt_class();
  char v9 = objc_opt_isKindOfClass();

  if (v9)
  {
    id v7 = [(MonthViewContainerViewController *)self currentChildViewController];
LABEL_5:
    v10 = [v7 nextLevelWeekViewControllerWithDate:v4];

    goto LABEL_6;
  }
  v10 = 0;
LABEL_6:

  return v10;
}

- (id)childViewControllerForRegularWidthCompactHeight
{
  unsigned int v3 = *(CompactWidthMonthViewController **)((char *)&self->_compactWidthController + 1);
  if (!v3)
  {
    id v4 = [(MainViewController *)self model];
    v5 = [v4 selectedDate];

    id v6 = [MultiColumnMonthViewController alloc];
    id v7 = [(MainViewController *)self model];
    char v8 = [(MainViewController *)self window];
    char v9 = [(MultiColumnMonthViewController *)v6 initWithCalendarDate:v5 model:v7 window:v8];
    v10 = *(CompactWidthMonthViewController **)((char *)&self->_compactWidthController + 1);
    *(CompactWidthMonthViewController **)((char *)&self->_compactWidthController + 1) = v9;

    unsigned int v3 = *(CompactWidthMonthViewController **)((char *)&self->_compactWidthController + 1);
  }

  return v3;
}

- (LargeMonthViewController)standardRegularController
{
  unsigned int v3 = *(MultiColumnMonthViewController **)((char *)&self->_compactHeightController + 1);
  if (!v3)
  {
    id v4 = [(MainViewController *)self model];
    v5 = [v4 selectedDate];

    id v6 = [LargeMonthViewController alloc];
    id v7 = [(MainViewController *)self model];
    char v8 = [(MainViewController *)self window];
    char v9 = [(LargeMonthViewController *)v6 initWithCalendarDate:v5 model:v7 window:v8];
    v10 = *(MultiColumnMonthViewController **)((char *)&self->_compactHeightController + 1);
    *(MultiColumnMonthViewController **)((char *)&self->_compactHeightController + 1) = v9;

    unsigned int v3 = *(MultiColumnMonthViewController **)((char *)&self->_compactHeightController + 1);
  }

  return (LargeMonthViewController *)v3;
}

- (LargeTextLargeMonthViewController)largeTextRegularController
{
  unsigned int v3 = *(LargeMonthViewController **)((char *)&self->_standardRegularController + 1);
  if (!v3)
  {
    id v4 = [(MainViewController *)self model];
    v5 = [v4 selectedDate];

    id v6 = [LargeTextLargeMonthViewController alloc];
    id v7 = [(MainViewController *)self model];
    char v8 = [(MainViewController *)self window];
    char v9 = [(CompactWidthMonthViewController *)v6 initWithCalendarDate:v5 model:v7 window:v8];
    v10 = *(LargeMonthViewController **)((char *)&self->_standardRegularController + 1);
    *(LargeMonthViewController **)((char *)&self->_standardRegularController + 1) = v9;

    unsigned int v3 = *(LargeMonthViewController **)((char *)&self->_standardRegularController + 1);
  }

  return (LargeTextLargeMonthViewController *)v3;
}

- (id)childViewControllerForRegularWidthRegularHeight
{
  unsigned int v3 = [(MonthViewContainerViewController *)self traitCollection];
  int v4 = EKUIUsesLargeTextLayout();

  if (v4) {
    [(MonthViewContainerViewController *)self largeTextRegularController];
  }
  else {
  v5 = [(MonthViewContainerViewController *)self standardRegularController];
  }

  return v5;
}

- (CompactWidthMonthViewController)compactWidthController
{
  return *(CompactWidthMonthViewController **)(&self->super._animatingViewTransition + 1);
}

- (void)setCompactWidthController:(id)a3
{
}

- (MultiColumnMonthViewController)compactHeightController
{
  return *(MultiColumnMonthViewController **)((char *)&self->_compactWidthController + 1);
}

- (void)setCompactHeightController:(id)a3
{
}

- (void)setStandardRegularController:(id)a3
{
}

- (void)setLargeTextRegularController:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)((char *)&self->_standardRegularController + 1), 0);
  objc_storeStrong((id *)((char *)&self->_compactHeightController + 1), 0);
  objc_storeStrong((id *)((char *)&self->_compactWidthController + 1), 0);

  objc_storeStrong((id *)(&self->super._animatingViewTransition + 1), 0);
}

@end