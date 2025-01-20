@interface MainViewControllerContainer
+ (BOOL)_shouldForwardViewWillTransitionToSize;
- (BOOL)allEventsIndividuallyRepresented:(id)a3;
- (BOOL)allowsOverriddenRightNavigationBarItems;
- (BOOL)allowsOverriddenToolbarItems;
- (BOOL)animatingViewTransition;
- (BOOL)currentChildViewControllerIsLoaded;
- (BOOL)hidesBackButton;
- (BOOL)isDateVisible:(id)a3;
- (BOOL)isTodayVisible;
- (BOOL)isWaitingForBackgroundLoadingOfSelectedEventOccurrenceView;
- (BOOL)mainViewControllerCanChangeSelectedDate;
- (BOOL)mainViewControllerCanChangeSelectedEvent;
- (BOOL)performModalDialogsIfNeededWithContinue:(id)a3;
- (BOOL)representsDayInViewHierarchy;
- (BOOL)respondsToSelector:(SEL)a3;
- (BOOL)shouldAdaptEventViewControllers;
- (BOOL)shouldInvalidateManagedNavigationControllerOnPresentationDismissal;
- (BOOL)shouldJournalMainViewControllerParent;
- (BOOL)shouldModallyPresentFirstShownViewController;
- (BOOL)shouldPushNextLevelViewControllerWhenTodayIsVisible;
- (BOOL)shouldRemoveSelfFromNavigationStackIfTraitCollectionIsUnsupported;
- (BOOL)shouldRespondToApplicationDidBecomeActiveStateChange;
- (BOOL)shouldUpdateOwnBackButtonWhenTopViewController;
- (BOOL)showEventDetailsWhenNewEventAdded;
- (Class)childViewControllerClassForTraits:(id)a3;
- (MainViewControllerContainer)initWithModel:(id)a3 window:(id)a4;
- (NSString)description;
- (double)leftBarButtonBlankFixedSpaceWidth;
- (id)_childViewControllerForTraitCollection:(id)a3;
- (id)_todaysDate;
- (id)bestDateForNewEvent;
- (id)childViewControllerForCompactWidthCompactHeight;
- (id)childViewControllerForCompactWidthRegularHeight;
- (id)childViewControllerForRegularWidthCompactHeight;
- (id)childViewControllerForRegularWidthRegularHeight;
- (id)childViewControllerForUnknownTraits;
- (id)currentChildViewController;
- (id)emptyChildViewController;
- (id)managedNavigationController;
- (id)navigationBarDisplayedDateString;
- (id)navigationBarTintColor;
- (id)preferredPreSizeClassTransitionSelectedDate;
- (id)pushedNextLevelMainViewControllerContainerAnimated:(BOOL)a3;
- (id)sceneTitle;
- (id)toolBarTintColor;
- (id)updateBackButtonWhileTopViewControllerToDate:(id)a3;
- (id)viewControllerToShowFrom;
- (int)supportedToggleMode;
- (int64_t)intendedSizeClass;
- (int64_t)presentationStyleOverrideForChildViewControllers;
- (void)_addChildViewControllerForCurrentTraits;
- (void)_removeChildViewControllerForCurrentTraits;
- (void)_updateForCurrentTraits;
- (void)currentlyVisibleDateRangeFromStartDate:(id *)a3 toEndDate:(id *)a4;
- (void)disableGestureRecognizers;
- (void)enableGestureRecognizers;
- (void)invalidateBackButtonDate;
- (void)invalidateManagedNavigationController;
- (void)navigateToNextDateComponentUnitAnimated:(BOOL)a3;
- (void)navigateToNextSelectableItem;
- (void)navigateToPreviousDateComponentUnitAnimated:(BOOL)a3;
- (void)navigateToPreviousSelectableItem;
- (void)selectDate:(id)a3 andTime:(BOOL)a4 animated:(BOOL)a5;
- (void)selectDate:(id)a3 animated:(BOOL)a4;
- (void)setAnimatingViewTransition:(BOOL)a3;
- (void)setShouldRespondToApplicationDidBecomeActiveStateChange:(BOOL)a3;
- (void)setupForViewAppearance;
- (void)setupUIForTraitCollection:(id)a3;
- (void)showEvent:(id)a3 animated:(BOOL)a4 showMode:(unint64_t)a5 context:(id)a6;
- (void)showNextOccurrenceOfSelectableItem;
- (void)showNowAnimated:(BOOL)a3;
- (void)showPreviousOccurrenceOfSelectableItem;
- (void)showTodayAnimated:(BOOL)a3;
- (void)showViewController:(id)a3 sender:(id)a4 animated:(BOOL)a5 completion:(id)a6;
- (void)updateBackButtonToDate:(id)a3;
- (void)updateNavigationBarDisplayedDateString;
- (void)updatePalette:(id)a3;
- (void)viewDidDisappear:(BOOL)a3;
- (void)viewDidLoad;
- (void)viewWillAppear:(BOOL)a3;
- (void)viewWillDisappear:(BOOL)a3;
- (void)viewWillLayoutSubviews;
@end

@implementation MainViewControllerContainer

- (void)viewDidLoad
{
  v5.receiver = self;
  v5.super_class = (Class)MainViewControllerContainer;
  [(MainViewControllerContainer *)&v5 viewDidLoad];
  [(MainViewControllerContainer *)self _updateForCurrentTraits];
  [(MainViewControllerContainer *)self setupForViewAppearance];
  v4 = [(MainViewControllerContainer *)self view];
  [v4 setNeedsLayout];
}

- (void)viewWillLayoutSubviews
{
  [(MainViewControllerContainer *)self _updateForCurrentTraits];
  v3.receiver = self;
  v3.super_class = (Class)MainViewControllerContainer;
  [(MainViewControllerContainer *)&v3 viewWillLayoutSubviews];
}

- (BOOL)shouldPushNextLevelViewControllerWhenTodayIsVisible
{
  objc_super v3 = [(MainViewControllerContainer *)self currentChildViewController];
  char v4 = objc_opt_respondsToSelector();

  if ((v4 & 1) != 0
    && ([(MainViewControllerContainer *)self currentChildViewController],
        objc_super v5 = objc_claimAutoreleasedReturnValue(),
        unsigned int v6 = [v5 shouldPushNextLevelViewControllerWhenTodayIsVisible],
        v5,
        v6))
  {
    v7 = +[CUIKPreferences sharedPreferences];
    unsigned int v8 = [v7 disableTodayPushes] ^ 1;
  }
  else
  {
    LOBYTE(v8) = 0;
  }
  return v8;
}

- (BOOL)allowsOverriddenToolbarItems
{
  objc_super v3 = [(MainViewControllerContainer *)self currentChildViewController];
  char v4 = objc_opt_respondsToSelector();

  if ((v4 & 1) == 0) {
    return 0;
  }
  objc_super v5 = [(MainViewControllerContainer *)self currentChildViewController];
  unsigned __int8 v6 = [v5 allowsOverriddenToolbarItems];

  return v6;
}

- (void)selectDate:(id)a3 animated:(BOOL)a4
{
  BOOL v4 = a4;
  id v9 = a3;
  unsigned __int8 v6 = [(MainViewControllerContainer *)self currentChildViewController];
  char v7 = objc_opt_respondsToSelector();

  if (v7)
  {
    unsigned int v8 = [(MainViewControllerContainer *)self currentChildViewController];
    [v8 selectDate:v9 animated:v4];
  }
}

- (MainViewControllerContainer)initWithModel:(id)a3 window:(id)a4
{
  v8.receiver = self;
  v8.super_class = (Class)MainViewControllerContainer;
  BOOL v4 = [(MainViewController *)&v8 initWithWindow:a4 model:a3];
  objc_super v5 = v4;
  if (v4)
  {
    unsigned __int8 v6 = [(MainViewControllerContainer *)v4 navigationItem];
    if (objc_opt_respondsToSelector()) {
      [v6 _setAllowsInteractivePop:0];
    }
  }
  return v5;
}

- (BOOL)allowsOverriddenRightNavigationBarItems
{
  objc_super v3 = [(MainViewControllerContainer *)self currentChildViewController];
  char v4 = objc_opt_respondsToSelector();

  if ((v4 & 1) == 0) {
    return 0;
  }
  objc_super v5 = [(MainViewControllerContainer *)self currentChildViewController];
  unsigned __int8 v6 = [v5 allowsOverriddenRightNavigationBarItems];

  return v6;
}

- (void)setupForViewAppearance
{
  objc_super v3 = [(MainViewControllerContainer *)self view];
  char v4 = [v3 subviews];
  id v5 = [v4 count];

  if (!v5)
  {
    unsigned __int8 v6 = [(MainViewControllerContainer *)self navigationController];
    char v7 = [v6 view];
    id v30 = [v7 window];

    if (v30)
    {
      objc_super v8 = [(MainViewControllerContainer *)self navigationController];
      id v9 = [v8 view];
      v10 = [v9 window];
      EKUIPushFallbackSizingContextWithViewHierarchy();
    }
    v11 = [(MainViewControllerContainer *)self view];
    [v11 frame];
    double v13 = v12;
    v14 = [(MainViewControllerContainer *)self view];
    [v14 frame];
    double v16 = v15;

    v17 = [(MainViewController *)self->_currentChildViewController view];
    [v17 setFrame:0.0, 0.0, v13, v16];

    currentChildViewController = self->_currentChildViewController;
    v19 = [(MainViewController *)self model];
    v20 = [v19 selectedDate];
    [(MainViewController *)currentChildViewController selectDate:v20 animated:0];

    [(MainViewControllerContainer *)self setEdgesForExtendedLayout:[(MainViewController *)self->_currentChildViewController edgesForExtendedLayout]];
    v21 = [(MainViewController *)self->_currentChildViewController view];
    v22 = [v21 superview];

    if (v22)
    {
      v23 = [(MainViewController *)self->_currentChildViewController view];
      [v23 removeFromSuperview];
    }
    v24 = [(MainViewController *)self->_currentChildViewController view];
    [v24 setAlpha:1.0];

    v25 = [(MainViewControllerContainer *)self view];
    v26 = [(MainViewController *)self->_currentChildViewController view];
    [v25 addSubview:v26];

    if (v30)
    {
      v27 = [(MainViewControllerContainer *)self navigationController];
      v28 = [v27 view];
      v29 = [v28 window];
      EKUIPopFallbackSizingContextWithViewHierarchy();
    }
  }
}

- (void)_updateForCurrentTraits
{
  objc_super v3 = [(MainViewControllerContainer *)self ekui_futureTraitCollection];

  if (v3)
  {
    id v4 = [(MainViewControllerContainer *)self navigationItem];
    id v5 = [(MainViewControllerContainer *)self ekui_futureTraitCollection];
    unsigned __int8 v6 = [(MainViewControllerContainer *)self _childViewControllerForTraitCollection:v5];

    if (v6)
    {
      char v7 = [(MainViewControllerContainer *)self emptyChildViewController];

      if (v6 != v7) {
        goto LABEL_15;
      }
    }
    if ([(MainViewControllerContainer *)self shouldRemoveSelfFromNavigationStackIfTraitCollectionIsUnsupported])
    {
      objc_super v8 = [(MainViewControllerContainer *)self navigationController];
      id v9 = [v8 viewControllers];

      v25 = self;
      v10 = +[NSArray arrayWithObjects:&v25 count:1];
      v11 = [v9 arrayByExcludingObjectsInArray:v10];

      [(MainViewControllerContainer *)self beginAppearanceTransition:0 animated:0];
      double v12 = [(MainViewControllerContainer *)self navigationController];
      [v12 setViewControllers:v11];

      [(MainViewControllerContainer *)self endAppearanceTransition];
      long long v22 = 0u;
      long long v23 = 0u;
      long long v20 = 0u;
      long long v21 = 0u;
      double v13 = [v11 reverseObjectEnumerator];
      id v14 = [v13 countByEnumeratingWithState:&v20 objects:v24 count:16];
      if (v14)
      {
        uint64_t v15 = *(void *)v21;
        while (2)
        {
          for (i = 0; i != v14; i = (char *)i + 1)
          {
            if (*(void *)v21 != v15) {
              objc_enumerationMutation(v13);
            }
            v17 = *(void **)(*((void *)&v20 + 1) + 8 * i);
            objc_opt_class();
            if (objc_opt_isKindOfClass())
            {
              id v14 = v17;
              goto LABEL_18;
            }
          }
          id v14 = [v13 countByEnumeratingWithState:&v20 objects:v24 count:16];
          if (v14) {
            continue;
          }
          break;
        }
      }
LABEL_18:

      [v14 setupForViewAppearance];
      unsigned __int8 v6 = 0;
      goto LABEL_19;
    }
    uint64_t v18 = [(MainViewControllerContainer *)self childViewControllerForUnknownTraits];

    unsigned __int8 v6 = (MainViewController *)v18;
    if (v18)
    {
LABEL_15:
      if (v6 != self->_currentChildViewController)
      {
        [(MainViewControllerContainer *)self _removeChildViewControllerForCurrentTraits];
        [(MainViewControllerContainer *)self _addChildViewControllerForCurrentTraits];
        [(MainViewControllerContainer *)self childViewControllerChangedForCurrentTraits];
      }
    }
LABEL_19:
    v19 = [(MainViewControllerContainer *)self ekui_futureTraitCollection];
    [(MainViewController *)v6 setEkui_futureTraitCollection:v19];
  }
}

- (id)currentChildViewController
{
  if (![(MainViewControllerContainer *)self currentChildViewControllerIsLoaded]) {
    [(MainViewControllerContainer *)self _updateForCurrentTraits];
  }
  objc_super v3 = [(MainViewControllerContainer *)self childViewControllers];
  id v4 = [v3 count];

  if ((unint64_t)v4 >= 2)
  {
    id v5 = (void *)kCalUILogHandle;
    if (os_log_type_enabled((os_log_t)kCalUILogHandle, OS_LOG_TYPE_ERROR))
    {
      unsigned __int8 v6 = v5;
      char v7 = [(MainViewControllerContainer *)self childViewControllers];
      int v11 = 138412290;
      double v12 = v7;
      _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_ERROR, "Extra calendar view children detected: %@", (uint8_t *)&v11, 0xCu);
    }
  }
  objc_super v8 = [(MainViewControllerContainer *)self childViewControllers];
  id v9 = [v8 firstObject];

  return v9;
}

- (BOOL)currentChildViewControllerIsLoaded
{
  objc_super v3 = [(MainViewControllerContainer *)self childViewControllers];
  id v4 = [v3 firstObject];

  id v5 = [(MainViewControllerContainer *)self childViewControllers];
  if ([v5 count] && objc_msgSend(v4, "isViewLoaded"))
  {
    unsigned __int8 v6 = [v4 view];
    char v7 = [v6 superview];
    BOOL v8 = v7 != 0;
  }
  else
  {
    BOOL v8 = 0;
  }

  return v8;
}

- (id)_childViewControllerForTraitCollection:(id)a3
{
  id v4 = a3;
  if ([v4 horizontalSizeClass] == (id)2 && objc_msgSend(v4, "verticalSizeClass") == (id)2)
  {
    uint64_t v5 = [(MainViewControllerContainer *)self childViewControllerForRegularWidthRegularHeight];
  }
  else if ([v4 horizontalSizeClass] == (id)2 && objc_msgSend(v4, "verticalSizeClass") == (id)1)
  {
    uint64_t v5 = [(MainViewControllerContainer *)self childViewControllerForRegularWidthCompactHeight];
  }
  else if ([v4 horizontalSizeClass] == (id)1 && objc_msgSend(v4, "verticalSizeClass") == (id)2)
  {
    uint64_t v5 = [(MainViewControllerContainer *)self childViewControllerForCompactWidthRegularHeight];
  }
  else if ([v4 horizontalSizeClass] == (id)1 && objc_msgSend(v4, "verticalSizeClass") == (id)1)
  {
    uint64_t v5 = [(MainViewControllerContainer *)self childViewControllerForCompactWidthCompactHeight];
  }
  else
  {
    uint64_t v5 = [(MainViewControllerContainer *)self emptyChildViewController];
  }
  unsigned __int8 v6 = (void *)v5;

  return v6;
}

- (id)emptyChildViewController
{
  emptyChildViewController = self->_emptyChildViewController;
  if (!emptyChildViewController)
  {
    id v4 = [EmptyMainViewController alloc];
    uint64_t v5 = [(MainViewController *)self window];
    unsigned __int8 v6 = [(MainViewController *)self model];
    char v7 = [(MainViewController *)v4 initWithWindow:v5 model:v6];
    BOOL v8 = self->_emptyChildViewController;
    self->_emptyChildViewController = v7;

    emptyChildViewController = self->_emptyChildViewController;
  }

  return emptyChildViewController;
}

- (void)_removeChildViewControllerForCurrentTraits
{
  currentChildViewController = self->_currentChildViewController;
  if (currentChildViewController)
  {
    [(MainViewController *)currentChildViewController willMoveToParentViewController:0];
    id v4 = [(MainViewController *)self->_currentChildViewController view];
    [v4 removeFromSuperview];

    uint64_t v5 = self->_currentChildViewController;
    [(MainViewController *)v5 removeFromParentViewController];
  }
}

- (void)_addChildViewControllerForCurrentTraits
{
  objc_super v3 = [(MainViewControllerContainer *)self ekui_futureTraitCollection];
  id v4 = [(MainViewControllerContainer *)self _childViewControllerForTraitCollection:v3];

  if (v4)
  {
    [(MainViewControllerContainer *)self addChildViewController:v4];
    [(MainViewController *)v4 didMoveToParentViewController:self];
  }
  currentChildViewController = self->_currentChildViewController;
  self->_currentChildViewController = v4;
}

- (int)supportedToggleMode
{
  objc_super v3 = [(MainViewControllerContainer *)self currentChildViewController];
  char v4 = objc_opt_respondsToSelector();

  if ((v4 & 1) == 0) {
    return 0;
  }
  uint64_t v5 = [(MainViewControllerContainer *)self currentChildViewController];
  int v6 = [v5 supportedToggleMode];

  return v6;
}

- (void)setShouldRespondToApplicationDidBecomeActiveStateChange:(BOOL)a3
{
  BOOL v3 = a3;
  uint64_t v5 = [(MainViewControllerContainer *)self currentChildViewController];
  char v6 = objc_opt_respondsToSelector();

  if (v6)
  {
    id v7 = [(MainViewControllerContainer *)self currentChildViewController];
    [v7 setShouldRespondToApplicationDidBecomeActiveStateChange:v3];
  }
}

- (void)updatePalette:(id)a3
{
  id v7 = a3;
  char v4 = [(MainViewControllerContainer *)self currentChildViewController];
  char v5 = objc_opt_respondsToSelector();

  if (v5)
  {
    char v6 = [(MainViewControllerContainer *)self currentChildViewController];
    [v6 updatePalette:v7];
  }
}

- (void)updateBackButtonToDate:(id)a3
{
  id v7 = a3;
  char v4 = [(MainViewControllerContainer *)self currentChildViewController];
  char v5 = objc_opt_respondsToSelector();

  if (v5)
  {
    char v6 = [(MainViewControllerContainer *)self currentChildViewController];
    [v6 updateBackButtonToDate:v7];
  }
}

- (BOOL)respondsToSelector:(SEL)a3
{
  if ("copy:" == a3 || "paste:" == a3 || "cut:" == a3)
  {
    v11.receiver = self;
    v11.super_class = (Class)MainViewControllerContainer;
    return [(MainViewControllerContainer *)&v11 respondsToSelector:a3];
  }
  else
  {
    char v8 = objc_opt_respondsToSelector();
    if (v8)
    {
      return 1;
    }
    else
    {
      id v9 = [(MainViewControllerContainer *)self ekui_futureTraitCollection];
      unsigned __int8 v10 = [(objc_class *)[(MainViewControllerContainer *)self childViewControllerClassForTraits:v9] instancesRespondToSelector:a3];

      return v10;
    }
  }
}

- (BOOL)shouldUpdateOwnBackButtonWhenTopViewController
{
  BOOL v3 = [(MainViewControllerContainer *)self currentChildViewController];
  char v4 = objc_opt_respondsToSelector();

  if ((v4 & 1) == 0) {
    return 0;
  }
  char v5 = [(MainViewControllerContainer *)self currentChildViewController];
  unsigned __int8 v6 = [v5 shouldUpdateOwnBackButtonWhenTopViewController];

  return v6;
}

- (BOOL)hidesBackButton
{
  return 0;
}

- (void)viewWillDisappear:(BOOL)a3
{
  BOOL v3 = a3;
  v6.receiver = self;
  v6.super_class = (Class)MainViewControllerContainer;
  -[MainViewControllerContainer viewWillDisappear:](&v6, "viewWillDisappear:");
  if ([(MainViewControllerContainer *)self currentChildViewControllerIsLoaded])
  {
    char v5 = [(MainViewControllerContainer *)self currentChildViewController];
    [v5 beginAppearanceTransition:0 animated:v3];
  }
}

- (void)viewWillAppear:(BOOL)a3
{
  v4.receiver = self;
  v4.super_class = (Class)MainViewControllerContainer;
  [(MainViewControllerContainer *)&v4 viewWillAppear:a3];
  [(MainViewControllerContainer *)self setupForViewAppearance];
}

- (void)viewDidDisappear:(BOOL)a3
{
  v5.receiver = self;
  v5.super_class = (Class)MainViewControllerContainer;
  [(MainViewControllerContainer *)&v5 viewDidDisappear:a3];
  if ([(MainViewControllerContainer *)self currentChildViewControllerIsLoaded])
  {
    objc_super v4 = [(MainViewControllerContainer *)self currentChildViewController];
    [v4 endAppearanceTransition];
  }
}

- (NSString)description
{
  uint64_t v12 = objc_opt_class();
  BOOL v3 = [(MainViewControllerContainer *)self traitCollection];
  id v4 = [v3 horizontalSizeClass];
  objc_super v5 = [(MainViewControllerContainer *)self traitCollection];
  id v6 = [v5 verticalSizeClass];
  id v7 = [(MainViewControllerContainer *)self ekui_futureTraitCollection];
  id v8 = [v7 horizontalSizeClass];
  id v9 = [(MainViewControllerContainer *)self ekui_futureTraitCollection];
  unsigned __int8 v10 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", @"<%@: %p  WidthClass: %ld  HeightClass: %ld  FutureWidthClass: %ld  FutureHeightClass: %ld  Showing %@ %p>", v12, self, v4, v6, v8, [v9 verticalSizeClass], objc_opt_class(), self->_currentChildViewController);

  return (NSString *)v10;
}

- (BOOL)performModalDialogsIfNeededWithContinue:(id)a3
{
  id v4 = a3;
  if (objc_opt_respondsToSelector()) {
    BOOL v5 = [(MainViewController *)self->_currentChildViewController performModalDialogsIfNeededWithContinue:v4];
  }
  else {
    BOOL v5 = 0;
  }

  return v5;
}

- (void)setupUIForTraitCollection:(id)a3
{
  id v4 = a3;
  [(MainViewControllerContainer *)self _updateForCurrentTraits];
  [(MainViewController *)self->_currentChildViewController setupUIForTraitCollection:v4];

  id v5 = [(MainViewControllerContainer *)self view];
  [v5 setNeedsLayout];
}

- (void)showViewController:(id)a3 sender:(id)a4 animated:(BOOL)a5 completion:(id)a6
{
  BOOL v6 = a5;
  id v10 = a6;
  id v11 = a4;
  id v12 = a3;
  id v13 = [(MainViewControllerContainer *)self currentChildViewController];
  [v13 showViewController:v12 sender:v11 animated:v6 completion:v10];
}

- (int64_t)presentationStyleOverrideForChildViewControllers
{
  v2 = [(MainViewControllerContainer *)self currentChildViewController];
  id v3 = [v2 presentationStyleOverrideForChildViewControllers];

  return (int64_t)v3;
}

- (id)viewControllerToShowFrom
{
  v2 = [(MainViewControllerContainer *)self currentChildViewController];
  id v3 = [v2 viewControllerToShowFrom];

  return v3;
}

+ (BOOL)_shouldForwardViewWillTransitionToSize
{
  return 1;
}

- (BOOL)shouldRemoveSelfFromNavigationStackIfTraitCollectionIsUnsupported
{
  return 0;
}

- (id)pushedNextLevelMainViewControllerContainerAnimated:(BOOL)a3
{
  return 0;
}

- (id)childViewControllerForUnknownTraits
{
  return 0;
}

- (id)childViewControllerForCompactWidthCompactHeight
{
  return 0;
}

- (id)childViewControllerForCompactWidthRegularHeight
{
  return 0;
}

- (id)childViewControllerForRegularWidthCompactHeight
{
  return 0;
}

- (id)childViewControllerForRegularWidthRegularHeight
{
  return 0;
}

- (Class)childViewControllerClassForTraits:(id)a3
{
  return 0;
}

- (id)managedNavigationController
{
  v2 = [(MainViewControllerContainer *)self currentChildViewController];
  id v3 = [v2 managedNavigationController];

  return v3;
}

- (void)invalidateManagedNavigationController
{
  id v2 = [(MainViewControllerContainer *)self currentChildViewController];
  [v2 invalidateManagedNavigationController];
}

- (BOOL)shouldInvalidateManagedNavigationControllerOnPresentationDismissal
{
  id v2 = [(MainViewControllerContainer *)self currentChildViewController];
  unsigned __int8 v3 = [v2 shouldInvalidateManagedNavigationControllerOnPresentationDismissal];

  return v3;
}

- (BOOL)shouldModallyPresentFirstShownViewController
{
  id v2 = [(MainViewControllerContainer *)self currentChildViewController];
  unsigned __int8 v3 = [v2 shouldModallyPresentFirstShownViewController];

  return v3;
}

- (void)showEvent:(id)a3 animated:(BOOL)a4 showMode:(unint64_t)a5 context:(id)a6
{
  BOOL v8 = a4;
  id v14 = a3;
  id v10 = a6;
  id v11 = [(MainViewControllerContainer *)self currentChildViewController];
  char v12 = objc_opt_respondsToSelector();

  if (v12)
  {
    id v13 = [(MainViewControllerContainer *)self currentChildViewController];
    [v13 showEvent:v14 animated:v8 showMode:a5 context:v10];
  }
}

- (void)selectDate:(id)a3 andTime:(BOOL)a4 animated:(BOOL)a5
{
  BOOL v5 = a5;
  BOOL v6 = a4;
  id v11 = a3;
  if (v6
    && ([(MainViewControllerContainer *)self currentChildViewController],
        BOOL v8 = objc_claimAutoreleasedReturnValue(),
        char v9 = objc_opt_respondsToSelector(),
        v8,
        (v9 & 1) != 0))
  {
    id v10 = [(MainViewControllerContainer *)self currentChildViewController];
    [v10 selectDate:v11 andTime:1 animated:v5];
  }
  else
  {
    id v10 = [(MainViewControllerContainer *)self currentChildViewController];
    [v10 selectDate:v11 animated:v5];
  }
}

- (BOOL)isDateVisible:(id)a3
{
  id v4 = a3;
  BOOL v5 = [(MainViewControllerContainer *)self currentChildViewController];
  unsigned __int8 v6 = [v5 isDateVisible:v4];

  return v6;
}

- (void)currentlyVisibleDateRangeFromStartDate:(id *)a3 toEndDate:(id *)a4
{
  id v6 = [(MainViewControllerContainer *)self currentChildViewController];
  [v6 currentlyVisibleDateRangeFromStartDate:a3 toEndDate:a4];
}

- (void)showTodayAnimated:(BOOL)a3
{
  BOOL v3 = a3;
  id v9 = [(MainViewControllerContainer *)self _todaysDate];
  BOOL v5 = [(MainViewControllerContainer *)self view];
  int IsCompactInViewHierarchy = EKUICurrentWidthSizeClassIsCompactInViewHierarchy();

  if (IsCompactInViewHierarchy
    && [(MainViewControllerContainer *)self shouldPushNextLevelViewControllerWhenTodayIsVisible]&& [(MainViewControllerContainer *)self isTodayVisible])
  {
    id v7 = [(MainViewController *)self model];
    [v7 setSelectedDate:v9];

    id v8 = [(MainViewControllerContainer *)self pushedNextLevelMainViewControllerContainerAnimated:v3];
  }
  else
  {
    [(MainViewControllerContainer *)self selectDate:v9 animated:v3];
  }
}

- (int64_t)intendedSizeClass
{
  return 0;
}

- (id)sceneTitle
{
  id v2 = [(MainViewControllerContainer *)self currentChildViewController];
  BOOL v3 = [v2 sceneTitle];

  return v3;
}

- (id)preferredPreSizeClassTransitionSelectedDate
{
  id v2 = [(MainViewControllerContainer *)self currentChildViewController];
  BOOL v3 = [v2 preferredPreSizeClassTransitionSelectedDate];

  return v3;
}

- (BOOL)mainViewControllerCanChangeSelectedEvent
{
  BOOL v3 = [(MainViewControllerContainer *)self currentChildViewController];
  char v4 = objc_opt_respondsToSelector();

  if ((v4 & 1) == 0) {
    return 1;
  }
  BOOL v5 = [(MainViewControllerContainer *)self currentChildViewController];
  unsigned __int8 v6 = [v5 mainViewControllerCanChangeSelectedEvent];

  return v6;
}

- (BOOL)mainViewControllerCanChangeSelectedDate
{
  BOOL v3 = [(MainViewControllerContainer *)self currentChildViewController];
  char v4 = objc_opt_respondsToSelector();

  if ((v4 & 1) == 0) {
    return 1;
  }
  BOOL v5 = [(MainViewControllerContainer *)self currentChildViewController];
  unsigned __int8 v6 = [v5 mainViewControllerCanChangeSelectedDate];

  return v6;
}

- (BOOL)allEventsIndividuallyRepresented:(id)a3
{
  id v4 = a3;
  BOOL v5 = [(MainViewControllerContainer *)self currentChildViewController];
  char v6 = objc_opt_respondsToSelector();

  if (v6)
  {
    id v7 = [(MainViewControllerContainer *)self currentChildViewController];
    unsigned __int8 v8 = [v7 allEventsIndividuallyRepresented:v4];
  }
  else
  {
    unsigned __int8 v8 = 1;
  }

  return v8;
}

- (void)navigateToNextSelectableItem
{
  BOOL v3 = [(MainViewControllerContainer *)self currentChildViewController];
  char v4 = objc_opt_respondsToSelector();

  if (v4)
  {
    id v5 = [(MainViewControllerContainer *)self currentChildViewController];
    [v5 navigateToNextSelectableItem];
  }
}

- (void)navigateToPreviousSelectableItem
{
  BOOL v3 = [(MainViewControllerContainer *)self currentChildViewController];
  char v4 = objc_opt_respondsToSelector();

  if (v4)
  {
    id v5 = [(MainViewControllerContainer *)self currentChildViewController];
    [v5 navigateToPreviousSelectableItem];
  }
}

- (void)showNextOccurrenceOfSelectableItem
{
  BOOL v3 = [(MainViewControllerContainer *)self currentChildViewController];
  char v4 = objc_opt_respondsToSelector();

  if (v4)
  {
    id v5 = [(MainViewControllerContainer *)self currentChildViewController];
    [v5 showNextOccurrenceOfSelectableItem];
  }
}

- (void)showPreviousOccurrenceOfSelectableItem
{
  BOOL v3 = [(MainViewControllerContainer *)self currentChildViewController];
  char v4 = objc_opt_respondsToSelector();

  if (v4)
  {
    id v5 = [(MainViewControllerContainer *)self currentChildViewController];
    [v5 showPreviousOccurrenceOfSelectableItem];
  }
}

- (void)navigateToNextDateComponentUnitAnimated:(BOOL)a3
{
  BOOL v3 = a3;
  id v5 = [(MainViewControllerContainer *)self currentChildViewController];
  char v6 = objc_opt_respondsToSelector();

  if (v6)
  {
    id v7 = [(MainViewControllerContainer *)self currentChildViewController];
    [v7 navigateToNextDateComponentUnitAnimated:v3];
  }
}

- (void)navigateToPreviousDateComponentUnitAnimated:(BOOL)a3
{
  BOOL v3 = a3;
  id v5 = [(MainViewControllerContainer *)self currentChildViewController];
  char v6 = objc_opt_respondsToSelector();

  if (v6)
  {
    id v7 = [(MainViewControllerContainer *)self currentChildViewController];
    [v7 navigateToPreviousDateComponentUnitAnimated:v3];
  }
}

- (BOOL)shouldRespondToApplicationDidBecomeActiveStateChange
{
  BOOL v3 = [(MainViewControllerContainer *)self currentChildViewController];
  char v4 = objc_opt_respondsToSelector();

  if ((v4 & 1) == 0) {
    return 0;
  }
  id v5 = [(MainViewControllerContainer *)self currentChildViewController];
  unsigned __int8 v6 = [v5 shouldRespondToApplicationDidBecomeActiveStateChange];

  return v6;
}

- (BOOL)isTodayVisible
{
  BOOL v3 = [(MainViewControllerContainer *)self currentChildViewController];
  char v4 = objc_opt_respondsToSelector();

  if ((v4 & 1) == 0) {
    return 1;
  }
  id v5 = [(MainViewControllerContainer *)self currentChildViewController];
  unsigned __int8 v6 = [v5 isTodayVisible];

  return v6;
}

- (id)_todaysDate
{
  BOOL v3 = CUIKTodayDate();
  char v4 = [(MainViewController *)self model];
  id v5 = [v4 eventStore];
  unsigned __int8 v6 = [v5 timeZone];

  id v7 = +[EKCalendarDate calendarDateWithDate:v3 timeZone:v6];

  return v7;
}

- (void)showNowAnimated:(BOOL)a3
{
  BOOL v3 = a3;
  id v5 = [(MainViewControllerContainer *)self currentChildViewController];
  char v6 = objc_opt_respondsToSelector();

  if (v6)
  {
    id v7 = [(MainViewControllerContainer *)self currentChildViewController];
    [v7 showNowAnimated:v3];
  }
}

- (void)enableGestureRecognizers
{
  BOOL v3 = [(MainViewControllerContainer *)self currentChildViewController];
  char v4 = objc_opt_respondsToSelector();

  if (v4)
  {
    id v5 = [(MainViewControllerContainer *)self currentChildViewController];
    [v5 enableGestureRecognizers];
  }
}

- (void)disableGestureRecognizers
{
  BOOL v3 = [(MainViewControllerContainer *)self currentChildViewController];
  char v4 = objc_opt_respondsToSelector();

  if (v4)
  {
    id v5 = [(MainViewControllerContainer *)self currentChildViewController];
    [v5 disableGestureRecognizers];
  }
}

- (double)leftBarButtonBlankFixedSpaceWidth
{
  BOOL v3 = [(MainViewControllerContainer *)self currentChildViewController];
  char v4 = objc_opt_respondsToSelector();

  if ((v4 & 1) == 0) {
    return 0.0;
  }
  id v5 = [(MainViewControllerContainer *)self currentChildViewController];
  [v5 leftBarButtonBlankFixedSpaceWidth];
  double v7 = v6;

  return v7;
}

- (id)bestDateForNewEvent
{
  BOOL v3 = [(MainViewControllerContainer *)self currentChildViewController];
  char v4 = objc_opt_respondsToSelector();

  if (v4)
  {
    id v5 = [(MainViewControllerContainer *)self currentChildViewController];
    double v6 = [v5 bestDateForNewEvent];
  }
  else
  {
    double v6 = 0;
  }

  return v6;
}

- (BOOL)showEventDetailsWhenNewEventAdded
{
  BOOL v3 = [(MainViewControllerContainer *)self currentChildViewController];
  char v4 = objc_opt_respondsToSelector();

  if ((v4 & 1) == 0) {
    return 0;
  }
  id v5 = [(MainViewControllerContainer *)self currentChildViewController];
  unsigned __int8 v6 = [v5 showEventDetailsWhenNewEventAdded];

  return v6;
}

- (BOOL)shouldJournalMainViewControllerParent
{
  BOOL v3 = [(MainViewControllerContainer *)self currentChildViewController];
  char v4 = objc_opt_respondsToSelector();

  if ((v4 & 1) == 0) {
    return 1;
  }
  id v5 = [(MainViewControllerContainer *)self currentChildViewController];
  unsigned __int8 v6 = [v5 shouldJournalMainViewControllerParent];

  return v6;
}

- (BOOL)shouldAdaptEventViewControllers
{
  BOOL v3 = [(MainViewControllerContainer *)self currentChildViewController];
  char v4 = objc_opt_respondsToSelector();

  if ((v4 & 1) == 0) {
    return 0;
  }
  id v5 = [(MainViewControllerContainer *)self currentChildViewController];
  unsigned __int8 v6 = [v5 shouldAdaptEventViewControllers];

  return v6;
}

- (id)navigationBarTintColor
{
  BOOL v3 = [(MainViewControllerContainer *)self currentChildViewController];
  char v4 = objc_opt_respondsToSelector();

  if (v4)
  {
    id v5 = [(MainViewControllerContainer *)self currentChildViewController];
    unsigned __int8 v6 = [v5 navigationBarTintColor];
  }
  else
  {
    unsigned __int8 v6 = 0;
  }

  return v6;
}

- (id)toolBarTintColor
{
  BOOL v3 = [(MainViewControllerContainer *)self currentChildViewController];
  char v4 = objc_opt_respondsToSelector();

  if (v4)
  {
    id v5 = [(MainViewControllerContainer *)self currentChildViewController];
    unsigned __int8 v6 = [v5 toolBarTintColor];
  }
  else
  {
    unsigned __int8 v6 = 0;
  }

  return v6;
}

- (id)navigationBarDisplayedDateString
{
  BOOL v3 = [(MainViewControllerContainer *)self currentChildViewController];
  char v4 = objc_opt_respondsToSelector();

  if (v4)
  {
    id v5 = [(MainViewControllerContainer *)self currentChildViewController];
    unsigned __int8 v6 = [v5 navigationBarDisplayedDateString];
  }
  else
  {
    unsigned __int8 v6 = 0;
  }

  return v6;
}

- (void)updateNavigationBarDisplayedDateString
{
  BOOL v3 = [(MainViewControllerContainer *)self currentChildViewController];
  char v4 = objc_opt_respondsToSelector();

  if (v4)
  {
    id v5 = [(MainViewControllerContainer *)self currentChildViewController];
    [v5 updateNavigationBarDisplayedDateString];
  }
}

- (void)invalidateBackButtonDate
{
  BOOL v3 = [(MainViewControllerContainer *)self currentChildViewController];
  char v4 = objc_opt_respondsToSelector();

  if (v4)
  {
    id v5 = [(MainViewControllerContainer *)self currentChildViewController];
    [v5 invalidateBackButtonDate];
  }
}

- (id)updateBackButtonWhileTopViewControllerToDate:(id)a3
{
  id v4 = a3;
  id v5 = [(MainViewControllerContainer *)self currentChildViewController];
  char v6 = objc_opt_respondsToSelector();

  if (v6)
  {
    double v7 = [(MainViewControllerContainer *)self currentChildViewController];
    unsigned __int8 v8 = [v7 updateBackButtonWhileTopViewControllerToDate:v4];
  }
  else
  {
    unsigned __int8 v8 = 0;
  }

  return v8;
}

- (BOOL)isWaitingForBackgroundLoadingOfSelectedEventOccurrenceView
{
  BOOL v3 = [(MainViewControllerContainer *)self currentChildViewController];
  char v4 = objc_opt_respondsToSelector();

  if ((v4 & 1) == 0) {
    return 0;
  }
  id v5 = [(MainViewControllerContainer *)self currentChildViewController];
  unsigned __int8 v6 = [v5 isWaitingForBackgroundLoadingOfSelectedEventOccurrenceView];

  return v6;
}

- (BOOL)representsDayInViewHierarchy
{
  return 0;
}

- (BOOL)animatingViewTransition
{
  return self->_animatingViewTransition;
}

- (void)setAnimatingViewTransition:(BOOL)a3
{
  self->_animatingViewTransition = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_emptyChildViewController, 0);

  objc_storeStrong((id *)&self->_currentChildViewController, 0);
}

@end