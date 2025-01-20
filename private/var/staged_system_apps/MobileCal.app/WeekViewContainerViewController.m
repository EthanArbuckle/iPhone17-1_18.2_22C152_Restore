@interface WeekViewContainerViewController
- (BOOL)allEventsIndividuallyRepresented:(id)a3;
- (BOOL)hidesBackButton;
- (BOOL)shouldRemoveSelfFromNavigationStackIfTraitCollectionIsUnsupported;
- (Class)childViewControllerClassForTraits:(id)a3;
- (CompactWidthWeekViewController)compactController;
- (LargeWeekViewController)regularController;
- (id)childViewControllerForCompactWidthCompactHeight;
- (id)childViewControllerForRegularWidthRegularHeight;
- (id)currentChildViewController;
- (id)pushedNextLevelMainViewControllerContainerAnimated:(BOOL)a3;
- (void)setCompactController:(id)a3;
- (void)setRegularController:(id)a3;
- (void)viewIsAppearing:(BOOL)a3;
- (void)viewSwitcherSwitchedToViewWithDate:(id)a3;
@end

@implementation WeekViewContainerViewController

- (void)viewIsAppearing:(BOOL)a3
{
  v8.receiver = self;
  v8.super_class = (Class)WeekViewContainerViewController;
  [(WeekViewContainerViewController *)&v8 viewIsAppearing:a3];
  v4 = [(WeekViewContainerViewController *)self navigationController];
  v5 = [v4 navigationBar];

  v6 = [v5 standardAppearance];
  v7 = +[UIColor clearColor];
  [v6 setShadowColor:v7];

  [v5 setScrollEdgeAppearance:v6];
}

- (id)currentChildViewController
{
  v4.receiver = self;
  v4.super_class = (Class)WeekViewContainerViewController;
  v2 = [(MainViewControllerContainer *)&v4 currentChildViewController];

  return v2;
}

- (BOOL)shouldRemoveSelfFromNavigationStackIfTraitCollectionIsUnsupported
{
  return 1;
}

- (id)pushedNextLevelMainViewControllerContainerAnimated:(BOOL)a3
{
  objc_super v4 = [(MainViewController *)self model];
  v5 = [v4 selectedDate];

  v6 = +[CUIKPreferences sharedPreferences];
  if ([v6 showExperimentalUI])
  {
    v7 = [(MainViewController *)self model];
    unsigned int v8 = [v7 showDayAsList];

    if (v8)
    {
      v9 = [(WeekViewContainerViewController *)self currentChildViewController];
      uint64_t v10 = [v9 pushedListViewControllerWithDate:v5 animated:0];
      goto LABEL_6;
    }
  }
  else
  {
  }
  v9 = [(WeekViewContainerViewController *)self currentChildViewController];
  uint64_t v10 = [v9 pushedDayViewControllerWithDate:v5 animated:0];
LABEL_6:
  v11 = (void *)v10;

  return v11;
}

- (id)childViewControllerForCompactWidthCompactHeight
{
  v3 = *(void **)(&self->super._animatingViewTransition + 1);
  if (!v3)
  {
    objc_super v4 = [CompactWidthWeekViewController alloc];
    v5 = [(MainViewController *)self model];
    v6 = [(MainViewController *)self window];
    v7 = [(CompactWidthWeekViewController *)v4 initWithModel:v5 window:v6];
    unsigned int v8 = *(void **)(&self->super._animatingViewTransition + 1);
    *(void *)(&self->super._animatingViewTransition + 1) = v7;

    v9 = *(void **)(&self->super._animatingViewTransition + 1);
    uint64_t v10 = [(WeekViewContainerViewController *)self navigationController];
    [v9 setDelegate:v10];

    v11 = +[NSBundle bundleForClass:objc_opt_class()];
    v12 = [v11 localizedStringForKey:@"Week" value:&stru_1001D6918 table:0];
    v13 = [(WeekViewContainerViewController *)self navigationItem];
    [v13 setBackButtonTitle:v12];

    v3 = *(void **)(&self->super._animatingViewTransition + 1);
  }

  return v3;
}

- (id)childViewControllerForRegularWidthRegularHeight
{
  v3 = *(CompactWidthWeekViewController **)((char *)&self->_compactController + 1);
  if (!v3)
  {
    objc_super v4 = [LargeWeekViewController alloc];
    v5 = [(MainViewController *)self model];
    v6 = [(MainViewController *)self window];
    v7 = [(LargeWeekViewController *)v4 initWithModel:v5 window:v6];
    unsigned int v8 = *(CompactWidthWeekViewController **)((char *)&self->_compactController + 1);
    *(CompactWidthWeekViewController **)((char *)&self->_compactController + 1) = v7;

    v3 = *(CompactWidthWeekViewController **)((char *)&self->_compactController + 1);
  }

  return v3;
}

- (Class)childViewControllerClassForTraits:(id)a3
{
  [a3 horizontalSizeClass];
  v3 = objc_opt_class();

  return (Class)v3;
}

- (void)viewSwitcherSwitchedToViewWithDate:(id)a3
{
  id v7 = a3;
  objc_super v4 = [(WeekViewContainerViewController *)self currentChildViewController];
  char v5 = objc_opt_respondsToSelector();

  if (v5)
  {
    v6 = [(WeekViewContainerViewController *)self currentChildViewController];
    [v6 viewSwitcherSwitchedToViewWithDate:v7];
  }
}

- (BOOL)hidesBackButton
{
  v2 = [(WeekViewContainerViewController *)self currentChildViewController];
  objc_opt_class();
  char isKindOfClass = objc_opt_isKindOfClass();

  return isKindOfClass & 1;
}

- (BOOL)allEventsIndividuallyRepresented:(id)a3
{
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  id v4 = a3;
  id v5 = [v4 countByEnumeratingWithState:&v15 objects:v19 count:16];
  if (v5)
  {
    id v6 = v5;
    uint64_t v7 = *(void *)v16;
LABEL_3:
    uint64_t v8 = 0;
    while (1)
    {
      if (*(void *)v16 != v7) {
        objc_enumerationMutation(v4);
      }
      uint64_t v9 = *(void *)(*((void *)&v15 + 1) + 8 * v8);
      uint64_t v10 = [(WeekViewContainerViewController *)self currentChildViewController];
      v11 = [v10 occurrenceViewForEvent:v9];

      if (!v11) {
        break;
      }
      v12 = [v11 occurrences];
      id v13 = [v12 count];

      if ((unint64_t)v13 > 1)
      {
        LOBYTE(v11) = 0;
        break;
      }
      if (v6 == (id)++v8)
      {
        id v6 = [v4 countByEnumeratingWithState:&v15 objects:v19 count:16];
        LOBYTE(v11) = 1;
        if (v6) {
          goto LABEL_3;
        }
        break;
      }
    }
  }
  else
  {
    LOBYTE(v11) = 1;
  }

  return (char)v11;
}

- (CompactWidthWeekViewController)compactController
{
  return *(CompactWidthWeekViewController **)(&self->super._animatingViewTransition + 1);
}

- (void)setCompactController:(id)a3
{
}

- (LargeWeekViewController)regularController
{
  return *(LargeWeekViewController **)((char *)&self->_compactController + 1);
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