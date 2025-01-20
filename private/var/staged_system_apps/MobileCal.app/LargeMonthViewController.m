@interface LargeMonthViewController
+ (BOOL)_shouldForwardViewWillTransitionToSize;
+ (double)_cellHeightForMultiplier:(double)a3 windowSize:(CGSize)a4;
- (BOOL)allowsOverriddenRightNavigationBarItems;
- (BOOL)allowsOverriddenToolbarItems;
- (BOOL)currentlyEditingEventsWithGestures;
- (BOOL)dragAndDropAllowLongPress;
- (BOOL)dragAndDropIsCurrentlyScrubbing;
- (BOOL)eventViewControllerPresentationWantsHiddenNavBarForSingleController;
- (BOOL)eventViewDelegateShouldCreateOwnEditViewController:(id)a3;
- (BOOL)eventViewDelegateShouldHandlePresentationOfDeleteAlert:(id)a3;
- (BOOL)eventViewDelegateShouldHandlePresentationOfEditViewController:(id)a3;
- (BOOL)interaction:(id)a3 canCreateEventAtPoint:(CGPoint)a4 inView:(id)a5;
- (BOOL)interaction:(id)a3 canCreateReminderAtPoint:(CGPoint)a4 inView:(id)a5;
- (BOOL)interaction:(id)a3 canPasteEventAtPoint:(CGPoint)a4 inView:(id)a5;
- (BOOL)interaction:(id)a3 shouldShowMenuAtPoint:(CGPoint)a4 inView:(id)a5;
- (BOOL)isBackgroundScene;
- (BOOL)isDraggingOccurrence;
- (BOOL)isReadyToShowViewControllersInsideEnqueueableManagedNavigationController:(id)a3;
- (BOOL)isReadyToShowViewControllersInsideEnqueueableManagedNavigationController:(id)a3 isPreemptiveCheck:(BOOL)a4;
- (BOOL)isWaitingForBackgroundLoadingOfSelectedEventOccurrenceView;
- (BOOL)mainViewControllerCanChangeSelectedDate;
- (BOOL)mainViewControllerCanChangeSelectedEvent;
- (BOOL)presentationControllerShouldDismiss:(id)a3;
- (BOOL)requiresSelfAsEventEditorDelegate;
- (CGRect)frameForTodayHighlight;
- (LargeMonthViewController)initWithCalendarDate:(id)a3 model:(id)a4 window:(id)a5;
- (double)_subviewHeightForDate:(id)a3;
- (double)decelerationDistanceThresholdForPreferringMonthBoundary;
- (double)subviewBufferExtensionMultiplier;
- (double)topInsetForSubviewWithCalendarDate:(id)a3;
- (id)_createLargeMonthWeekViewForDate:(id)a3;
- (id)_paletteView;
- (id)_weekViewAtPoint:(CGPoint)a3 pointInWeek:(CGPoint *)a4;
- (id)calendarModel;
- (id)createInitialViewForDate:(id)a3;
- (id)interaction:(id)a3 subtitleForPasteActionAtPoint:(CGPoint)a4 inView:(id)a5;
- (id)interaction:(id)a3 titleForPasteActionAtPoint:(CGPoint)a4 inView:(id)a5;
- (id)newBottomViewBelowViewWithCalendarDate:(id)a3;
- (id)newTopViewAboveViewWithCalendarDate:(id)a3;
- (id)nextLevelWeekViewControllerWithDate:(id)a3;
- (id)occurrenceAtPoint:(CGPoint)a3;
- (id)occurrencesForStartDate:(id)a3 endDate:(id)a4 waitForLoad:(BOOL)a5;
- (id)pasteboardManagerForEventEditViewController:(id)a3;
- (id)presentationControllerForEditMenu;
- (id)pushedWeekViewControllerWithDate:(id)a3 animated:(BOOL)a4;
- (id)selectedEventsForEditMenu;
- (id)shownEventEditViewController;
- (id)shownEventViewController;
- (int)editorHideTransition;
- (int)editorShowTransition;
- (int)supportedToggleMode;
- (int64_t)intendedSizeClass;
- (unint64_t)maximumCachedReusableViews;
- (unint64_t)supportedInterfaceOrientations;
- (void)_animateGridlinesAndBackgrounds;
- (void)_cleanupGridAnimation;
- (void)_closeEventPresentationAnimated:(BOOL)a3;
- (void)_closeEventPresentationAnimated:(BOOL)a3 completion:(id)a4;
- (void)_closeEventPresentationAnimated:(BOOL)a3 viewController:(id)a4 completion:(id)a5;
- (void)_displayedOccurrencesChanged:(id)a3;
- (void)_layoutGridlinesAndBackgrounds:(BOOL)a3;
- (void)_presentationControllerDidDismiss;
- (void)_removeAnimatedGridComponents;
- (void)_scrollToWeekView:(id)a3 animated:(BOOL)a4 completion:(id)a5;
- (void)_scrubAtPoint:(CGPoint)a3;
- (void)_scrubWithTouches:(id)a3;
- (void)_selectedOccurrencesChanged:(id)a3;
- (void)_showEventDetailsForOccurrence:(id)a3 inWeek:(id)a4 onDay:(id)a5 animatedScrollToVisible:(BOOL)a6 showMode:(unint64_t)a7 context:(id)a8 creationMethod:(unint64_t)a9;
- (void)_showEventDetailsForOccurrence:(id)a3 inWeek:(id)a4 onDay:(id)a5 creationMethod:(unint64_t)a6;
- (void)_showNextDateComponentUnitInForwardDirection:(BOOL)a3 animated:(BOOL)a4;
- (void)_updateDayHeaderFrames;
- (void)addEventToSelection:(id)a3 inWeek:(id)a4 updateModel:(BOOL)a5;
- (void)completeReminderFromTap:(id)a3;
- (void)contentSizeCategoryChanged;
- (void)didCompleteBackgroundOccurrenceRenderingForLargeMonthWeekView:(id)a3;
- (void)didEndScrolling;
- (void)didScroll;
- (void)dragAndDropRequestsPresentationOfViewController:(id)a3;
- (void)draggedOccurrenceWasCancelled:(id)a3 atPoint:(CGPoint)a4;
- (void)enqueuableNavigationController:(id)a3 requestsDeferShowViewControllerUntilReady:(id)a4;
- (void)enqueueableManagedNavigationController:(id)a3 requestsConfigurationOfPropertiesForPopoverPresentationController:(id)a4 completion:(id)a5;
- (void)eventEditViewController:(id)a3 didCompleteWithAction:(int64_t)a4;
- (void)eventEditViewController:(id)a3 didCompleteWithAction:(int64_t)a4 completionHandler:(id)a5;
- (void)eventViewController:(id)a3 didCompleteWithAction:(int64_t)a4;
- (void)eventViewController:(id)a3 requestsDisplayOfDeleteAlert:(id)a4;
- (void)eventViewController:(id)a3 requestsDisplayOfEditViewController:(id)a4 animated:(BOOL)a5;
- (void)eventViewController:(id)a3 requestsShowEvent:(id)a4;
- (void)eventViewControllerNextButtonWasTapped:(id)a3;
- (void)eventViewControllerPreviousButtonWasTapped:(id)a3;
- (void)eventViewControllerWillBeginEditingEvent:(id)a3;
- (void)findWeekends;
- (void)handleCloseKeyCommand;
- (void)interaction:(id)a3 createEventAtPoint:(CGPoint)a4 inView:(id)a5;
- (void)interaction:(id)a3 createReminderAtPoint:(CGPoint)a4 inView:(id)a5;
- (void)interaction:(id)a3 pasteEventAtPoint:(CGPoint)a4 inView:(id)a5;
- (void)largeMonthWeekView:(id)a3 didDoubleTapOnDay:(id)a4;
- (void)largeMonthWeekView:(id)a3 didTapOccurrence:(id)a4 onDay:(id)a5 extendSelection:(BOOL)a6 userInitiated:(BOOL)a7 tappedSymbol:(BOOL)a8;
- (void)largeMonthWeekView:(id)a3 touchesBegan:(id)a4 withEvent:(id)a5;
- (void)largeMonthWeekView:(id)a3 touchesEnded:(id)a4 withEvent:(id)a5;
- (void)largeMonthWeekView:(id)a3 touchesMoved:(id)a4 withEvent:(id)a5;
- (void)loadView;
- (void)localeChanged;
- (void)navigateToNextDateComponentUnitAnimated:(BOOL)a3;
- (void)navigateToPreviousDateComponentUnitAnimated:(BOOL)a3;
- (void)pasteboardManager:(id)a3 beginEditingEvent:(id)a4;
- (void)pasteboardManager:(id)a3 didFinishPasteWithResult:(unint64_t)a4 willOpenEditor:(BOOL)a5;
- (void)pasteboardManager:(id)a3 presentAlert:(id)a4;
- (void)popoverPresentationController:(id)a3 willRepositionPopoverToRect:(CGRect *)a4 inView:(id *)a5;
- (void)presentationControllerDidDismiss:(id)a3;
- (void)removeEventFromSelection:(id)a3 inWeek:(id)a4 updateModel:(BOOL)a5;
- (void)selectOccurrence:(id)a3 inWeek:(id)a4;
- (void)setIsWaitingForBackgroundLoadingOfSelectedEventOccurrenceView:(BOOL)a3;
- (void)showDate:(id)a3 animated:(BOOL)a4;
- (void)showDetailsForDraggedOccurrence:(id)a3 inWeekView:(id)a4 onDay:(id)a5 creationMethod:(unint64_t)a6;
- (void)showEditorForNewDraggedEvent:(id)a3 inWeek:(id)a4;
- (void)showEvent:(id)a3 animated:(BOOL)a4 showMode:(unint64_t)a5 context:(id)a6;
- (void)showNextOccurrenceOfSelectableItem;
- (void)showPreviousOccurrenceOfSelectableItem;
- (void)showViewController:(id)a3 sender:(id)a4 animated:(BOOL)a5 completion:(id)a6;
- (void)significantTimeChangeOccurred;
- (void)updateNavigationBarDisplayedDateString;
- (void)updatePalette:(id)a3;
- (void)viewDidAppear:(BOOL)a3;
- (void)viewDidDisappear:(BOOL)a3;
- (void)viewWillAppear:(BOOL)a3;
- (void)viewWillDisappear:(BOOL)a3;
- (void)viewWillLayoutSubviews;
- (void)viewWillTransitionToSize:(CGSize)a3 withTransitionCoordinator:(id)a4;
- (void)weekNumbersPrefChanged;
@end

@implementation LargeMonthViewController

- (LargeMonthViewController)initWithCalendarDate:(id)a3 model:(id)a4 window:(id)a5
{
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  v20.receiver = self;
  v20.super_class = (Class)LargeMonthViewController;
  v12 = [(MonthViewController *)&v20 initWithCalendarDate:v9 model:v10 window:v11];
  v13 = v12;
  if (v12)
  {
    objc_storeStrong((id *)&v12->_initialDate, a3);
    +[MonthViewOccurrence clearCachedFonts];
    +[LargeMonthWeekView clearCachedFonts];
    [(LargeMonthViewController *)v13 findWeekends];
    objc_initWeak(&location, v13);
    uint64_t v21 = objc_opt_class();
    v14 = +[NSArray arrayWithObjects:&v21 count:1];
    v17[0] = _NSConcreteStackBlock;
    v17[1] = 3221225472;
    v17[2] = sub_100064E7C;
    v17[3] = &unk_1001D2620;
    objc_copyWeak(&v18, &location);
    id v15 = [(LargeMonthViewController *)v13 registerForTraitChanges:v14 withHandler:v17];

    objc_destroyWeak(&v18);
    objc_destroyWeak(&location);
  }

  return v13;
}

- (unint64_t)supportedInterfaceOrientations
{
  v3 = [(LargeMonthViewController *)self shownEventEditViewController];
  v4 = v3;
  if (v3)
  {
    id v5 = [v3 supportedInterfaceOrientations];
  }
  else
  {
    v8.receiver = self;
    v8.super_class = (Class)LargeMonthViewController;
    id v5 = [(LargeMonthViewController *)&v8 supportedInterfaceOrientations];
  }
  unint64_t v6 = (unint64_t)v5;

  return v6;
}

- (void)findWeekends
{
}

- (void)loadView
{
  v22.receiver = self;
  v22.super_class = (Class)LargeMonthViewController;
  [(MonthViewController *)&v22 loadView];
  int v3 = 6;
  v4 = (NSArray *)[objc_alloc((Class)NSMutableArray) initWithCapacity:6];
  double y = CGPointZero.y;
  do
  {
    id v6 = objc_alloc_init((Class)CALayer);
    [v6 setAnchorPoint:CGPointZero.x, y];
    id v7 = +[LargeMonthWeekView gridlineColor];
    objc_msgSend(v6, "setBackgroundColor:", objc_msgSend(v7, "CGColor"));

    objc_super v8 = [(InfiniteScrollViewController *)self scrollView];
    id v9 = [v8 layer];
    [v9 addSublayer:v6];

    [(NSArray *)v4 addObject:v6];
    --v3;
  }
  while (v3);
  verticalGridLines = self->_verticalGridLines;
  self->_verticalGridLines = v4;
  id v11 = v4;

  id v12 = objc_alloc_init((Class)CALayer);
  id v13 = objc_alloc_init((Class)CALayer);
  [v12 setAnchorPoint:CGPointZero.x, y];
  [v13 setAnchorPoint:CGPointZero.x, y];
  id v14 = +[LargeMonthWeekView weekendColor];
  [v12 setBackgroundColor:[v14 CGColor]];

  id v15 = +[LargeMonthWeekView weekendColor];
  [v13 setBackgroundColor:[v15 CGColor]];

  v16 = [(InfiniteScrollViewController *)self scrollView];
  v17 = [v16 layer];
  [v17 addSublayer:v12];

  id v18 = [(InfiniteScrollViewController *)self scrollView];
  v19 = [v18 layer];
  [v19 addSublayer:v13];

  v23[0] = v12;
  v23[1] = v13;
  objc_super v20 = +[NSArray arrayWithObjects:v23 count:2];
  weekendDayBackgrounds = self->_weekendDayBackgrounds;
  self->_weekendDayBackgrounds = v20;
}

- (void)viewWillAppear:(BOOL)a3
{
  v6.receiver = self;
  v6.super_class = (Class)LargeMonthViewController;
  [(MonthViewController *)&v6 viewWillAppear:a3];
  v4 = +[NSNotificationCenter defaultCenter];
  [v4 addObserver:self selector:"_displayedOccurrencesChanged:" name:CUIKCalendarModelDisplayedOccurrencesChangedNotification object:self->super.super.super._model];
  [v4 addObserver:self selector:"_selectedOccurrencesChanged:" name:CUIKCalendarModelSelectedOccurrencesChangedNotification object:self->super.super.super._model];
  [(InfiniteScrollViewController *)self reloadDataForAllViews];
  navigationBarDisplayedDate = self->_navigationBarDisplayedDate;
  self->_navigationBarDisplayedDate = 0;

  self->_viewIsAppearing = 1;
}

- (void)viewDidAppear:(BOOL)a3
{
  v11.receiver = self;
  v11.super_class = (Class)LargeMonthViewController;
  [(MonthViewController *)&v11 viewDidAppear:a3];
  v4 = (void *)kCalUILogHandle;
  if (os_log_type_enabled((os_log_t)kCalUILogHandle, OS_LOG_TYPE_INFO))
  {
    id v5 = v4;
    objc_super v6 = (objc_class *)objc_opt_class();
    id v7 = NSStringFromClass(v6);
    objc_super v8 = [(MainViewController *)self model];
    id v9 = [v8 selectedDate];
    id v10 = [v9 date];
    *(_DWORD *)buf = 138543618;
    id v13 = v7;
    __int16 v14 = 2114;
    id v15 = v10;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_INFO, "[UserStateLog] State -> %{public}@ viewDidAppear. date = %{public}@", buf, 0x16u);
  }
  self->_viewIsAppearing = 0;
}

- (void)viewWillDisappear:(BOOL)a3
{
  BOOL v3 = a3;
  id v5 = +[NSNotificationCenter defaultCenter];
  [v5 removeObserver:self name:CUIKCalendarModelDisplayedOccurrencesChangedNotification object:self->super.super.super._model];
  [v5 removeObserver:self name:CUIKCalendarModelSelectedOccurrencesChangedNotification object:self->super.super.super._model];
  [(LargeMonthViewController *)self setIsWaitingForBackgroundLoadingOfSelectedEventOccurrenceView:0];
  objc_super v6 = [(LargeMonthViewController *)self shownEventViewController];

  if (v6) {
    [(LargeMonthViewController *)self _closeEventPresentationAnimated:0];
  }
  self->_viewIsAppearing = 0;
  v7.receiver = self;
  v7.super_class = (Class)LargeMonthViewController;
  [(MonthViewController *)&v7 viewWillDisappear:v3];
}

- (void)viewDidDisappear:(BOOL)a3
{
  v4.receiver = self;
  v4.super_class = (Class)LargeMonthViewController;
  [(LargeMonthViewController *)&v4 viewDidDisappear:a3];
  self->_viewIsAppearing = 0;
}

+ (BOOL)_shouldForwardViewWillTransitionToSize
{
  return 1;
}

- (void)viewWillTransitionToSize:(CGSize)a3 withTransitionCoordinator:(id)a4
{
  double height = a3.height;
  double width = a3.width;
  id v7 = a4;
  self->_shouldForceAllowUpdateNavigationBarDateString = 1;
  if ([(InfiniteScrollViewController *)self viewIsVisible] || self->_viewIsAppearing)
  {
    if (v7) {
      [v7 targetTransform];
    }
    else {
      memset(&v16, 0, sizeof(v16));
    }
    self->_animateResize = CGAffineTransformIsIdentity(&v16);
    v15.receiver = self;
    v15.super_class = (Class)LargeMonthViewController;
    -[InfiniteScrollViewController viewWillTransitionToSize:withTransitionCoordinator:](&v15, "viewWillTransitionToSize:withTransitionCoordinator:", v7, width, height);
    objc_super v8 = [(LargeMonthViewController *)self view];
    [v8 setNeedsLayout];

    v13[0] = 0;
    v13[1] = v13;
    v13[2] = 0x3010000000;
    v13[3] = &unk_1001B5939;
    CGPoint v14 = CGPointZero;
    v11[0] = 0;
    v11[1] = v11;
    v11[2] = 0x3032000000;
    v11[3] = sub_100065904;
    v11[4] = sub_100065914;
    id v12 = 0;
    v10[0] = _NSConcreteStackBlock;
    v10[1] = 3221225472;
    v10[2] = sub_10006591C;
    v10[3] = &unk_1001D32D0;
    v10[4] = self;
    v10[5] = v11;
    v10[6] = v13;
    v9[0] = _NSConcreteStackBlock;
    v9[1] = 3221225472;
    v9[2] = sub_100065BBC;
    v9[3] = &unk_1001D32D0;
    v9[4] = self;
    v9[5] = v11;
    v9[6] = v13;
    [v7 animateAlongsideTransition:v10 completion:v9];
    _Block_object_dispose(v11, 8);

    _Block_object_dispose(v13, 8);
  }
}

- (void)viewWillLayoutSubviews
{
  v4.receiver = self;
  v4.super_class = (Class)LargeMonthViewController;
  [(InfiniteScrollViewController *)&v4 viewWillLayoutSubviews];
  BOOL v3 = [(LargeMonthViewController *)self _paletteView];
  [(LargeMonthViewController *)self updatePalette:v3];

  if (!self->_animateResize) {
    [(LargeMonthViewController *)self _layoutGridlinesAndBackgrounds:0];
  }
}

- (void)_animateGridlinesAndBackgrounds
{
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_100065E5C;
  v7[3] = &unk_1001D2740;
  v7[4] = self;
  +[UIView performWithoutAnimation:v7];
  for (uint64_t i = 0; i != 6; ++i)
  {
    objc_super v4 = [(NSArray *)self->_verticalGridLines objectAtIndexedSubscript:i];
    [v4 setHidden:1];
  }
  id v5 = [(NSArray *)self->_weekendDayBackgrounds objectAtIndexedSubscript:0];
  [v5 setHidden:1];

  objc_super v6 = [(NSArray *)self->_weekendDayBackgrounds objectAtIndexedSubscript:1];
  [v6 setHidden:1];

  [(LargeMonthViewController *)self _layoutGridlinesAndBackgrounds:1];
}

- (void)_removeAnimatedGridComponents
{
  long long v19 = 0u;
  long long v20 = 0u;
  long long v21 = 0u;
  long long v22 = 0u;
  BOOL v3 = self->_animatableGridLines;
  id v4 = [(NSArray *)v3 countByEnumeratingWithState:&v19 objects:v24 count:16];
  if (v4)
  {
    id v5 = v4;
    uint64_t v6 = *(void *)v20;
    do
    {
      id v7 = 0;
      do
      {
        if (*(void *)v20 != v6) {
          objc_enumerationMutation(v3);
        }
        [*(id *)(*((void *)&v19 + 1) + 8 * (void)v7) removeFromSuperview];
        id v7 = (char *)v7 + 1;
      }
      while (v5 != v7);
      id v5 = [(NSArray *)v3 countByEnumeratingWithState:&v19 objects:v24 count:16];
    }
    while (v5);
  }

  long long v17 = 0u;
  long long v18 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  objc_super v8 = self->_animatableDayBackgrounds;
  id v9 = [(NSArray *)v8 countByEnumeratingWithState:&v15 objects:v23 count:16];
  if (v9)
  {
    id v10 = v9;
    uint64_t v11 = *(void *)v16;
    do
    {
      id v12 = 0;
      do
      {
        if (*(void *)v16 != v11) {
          objc_enumerationMutation(v8);
        }
        [*(id *)(*((void *)&v15 + 1) + 8 * (void)v12) removeFromSuperview];
        id v12 = (char *)v12 + 1;
      }
      while (v10 != v12);
      id v10 = [(NSArray *)v8 countByEnumeratingWithState:&v15 objects:v23 count:16];
    }
    while (v10);
  }

  animatableGridLines = self->_animatableGridLines;
  self->_animatableGridLines = 0;

  animatableDayBackgrounds = self->_animatableDayBackgrounds;
  self->_animatableDayBackgrounds = 0;
}

- (void)_cleanupGridAnimation
{
  [(LargeMonthViewController *)self _removeAnimatedGridComponents];
  long long v21 = 0u;
  long long v22 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  BOOL v3 = self->_verticalGridLines;
  id v4 = [(NSArray *)v3 countByEnumeratingWithState:&v19 objects:v24 count:16];
  if (v4)
  {
    id v5 = v4;
    uint64_t v6 = *(void *)v20;
    do
    {
      for (uint64_t i = 0; i != v5; uint64_t i = (char *)i + 1)
      {
        if (*(void *)v20 != v6) {
          objc_enumerationMutation(v3);
        }
        objc_super v8 = *(void **)(*((void *)&v19 + 1) + 8 * i);
        [v8 setHidden:0];
        [v8 removeAllAnimations];
      }
      id v5 = [(NSArray *)v3 countByEnumeratingWithState:&v19 objects:v24 count:16];
    }
    while (v5);
  }

  long long v17 = 0u;
  long long v18 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  id v9 = self->_weekendDayBackgrounds;
  id v10 = [(NSArray *)v9 countByEnumeratingWithState:&v15 objects:v23 count:16];
  if (v10)
  {
    id v11 = v10;
    uint64_t v12 = *(void *)v16;
    do
    {
      for (j = 0; j != v11; j = (char *)j + 1)
      {
        if (*(void *)v16 != v12) {
          objc_enumerationMutation(v9);
        }
        CGPoint v14 = *(void **)(*((void *)&v15 + 1) + 8 * (void)j);
        [v14 setHidden:0 v15];
        [v14 removeAllAnimations];
      }
      id v11 = [(NSArray *)v9 countByEnumeratingWithState:&v15 objects:v23 count:16];
    }
    while (v11);
  }
}

- (void)_layoutGridlinesAndBackgrounds:(BOOL)a3
{
  id v5 = [(InfiniteScrollViewController *)self scrollView];
  [v5 bounds];
  double v7 = v6;
  double v9 = v8;

  CalRoundToScreenScale();
  double v11 = v10;
  uint64_t v12 = [(InfiniteScrollViewController *)self centerViewOnScreen];
  id v39 = [v12 dayFrames];

  uint64_t v13 = 0;
  uint64_t IsLeftToRight = CalTimeDirectionIsLeftToRight();
  do
  {
    long long v15 = [v39 objectAtIndexedSubscript:IsLeftToRight + v13];
    [v15 CGRectValue];
    double v17 = v16;

    double v18 = v17 - v11;
    if (a3)
    {
      long long v19 = [(NSArray *)self->_animatableGridLines objectAtIndexedSubscript:v13];
      [v19 setFrame:v18, v7, v11, v9];
    }
    long long v20 = [(NSArray *)self->_verticalGridLines objectAtIndexedSubscript:v13];
    [v20 setFrame:v18, v7, v11, v9];
    [v20 removeAllAnimations];

    ++v13;
  }
  while (v13 != 6);
  uint64_t v21 = self->_weekendOffsets[0];
  uint64_t v22 = (v21 - CUIKZeroIndexedWeekStart() + 7) % 7;
  uint64_t v23 = self->_weekendOffsets[1];
  uint64_t v24 = (v23 - CUIKZeroIndexedWeekStart() + 7) % 7;
  v25 = [v39 objectAtIndexedSubscript:v22];
  [v25 CGRectValue];
  double v27 = v26;
  double v29 = v28;

  v30 = [v39 objectAtIndexedSubscript:v24];
  [v30 CGRectValue];
  double v32 = v31;
  double v34 = v33;

  if (a3)
  {
    v35 = [(NSArray *)self->_animatableDayBackgrounds objectAtIndexedSubscript:0];
    [v35 setFrame:v27, v7, v29, v9];

    v36 = [(NSArray *)self->_animatableDayBackgrounds objectAtIndexedSubscript:1];
    [v36 setFrame:v32, v7, v34, v9];
  }
  v37 = [(NSArray *)self->_weekendDayBackgrounds objectAtIndexedSubscript:0];
  v38 = [(NSArray *)self->_weekendDayBackgrounds objectAtIndexedSubscript:1];
  [v37 setFrame:v27, v7, v29, v9];
  [v38 setFrame:v32, v7, v34, v9];
  [v37 removeAllAnimations];
  [v38 removeAllAnimations];
}

- (id)_paletteView
{
  v2 = [(LargeMonthViewController *)self navigationController];
  BOOL v3 = [v2 paletteView];

  return v3;
}

- (void)_updateDayHeaderFrames
{
  BOOL v3 = [(LargeMonthViewController *)self _paletteView];
  if (v3)
  {
    id v16 = v3;
    id v4 = -[InfiniteScrollViewController subviewForPoint:](self, "subviewForPoint:", CGPointZero.x, CGPointZero.y);
    id v5 = [v4 dayFrames];
    id v6 = [objc_alloc((Class)NSMutableArray) initWithCapacity:[v5 count]];
    if ([v5 count])
    {
      unint64_t v7 = 0;
      do
      {
        double v8 = [v5 objectAtIndexedSubscript:v7];
        [v8 CGRectValue];
        double v10 = v9;
        double v12 = v11;

        [v16 bounds];
        double v14 = v13;
        [v16 bounds];
        long long v15 = +[NSValue valueWithCGRect:](NSValue, "valueWithCGRect:", v10, v14, v12);
        [v6 addObject:v15];

        ++v7;
      }
      while (v7 < (unint64_t)[v5 count]);
    }
    [v16 setDayHeaderFrames:v6];

    BOOL v3 = v16;
  }
}

- (BOOL)presentationControllerShouldDismiss:(id)a3
{
  return 1;
}

- (void)presentationControllerDidDismiss:(id)a3
{
}

- (void)_presentationControllerDidDismiss
{
  BOOL v3 = [(MonthViewController *)self draggedOccurrenceView];

  if (v3)
  {
    [(MonthViewController *)self removeDraggingOccurrenceAnimated:1];
    [(MonthViewController *)self removeAllWeekHighlights];
  }
  [(MainViewController *)self invalidateManagedNavigationController];
  id v4 = [(EKEvent *)self->_eventBeingInspected startCalendarDate];
  id v9 = [(InfiniteScrollViewController *)self subviewForDate:v4];

  [(LargeMonthViewController *)self selectOccurrence:0 inWeek:v9];
  self->_currentlyEditingEvent = 0;
  id v5 = [(InfiniteScrollViewController *)self scrollView];
  [v5 setScrollEnabled:1];

  eventBeingInspected = self->_eventBeingInspected;
  self->_eventBeingInspected = 0;

  tappedDadouble y = self->_tappedDay;
  self->_tappedDadouble y = 0;

  CGSize size = CGRectNull.size;
  self->_scrubbingRect.origin = CGRectNull.origin;
  self->_scrubbingRect.CGSize size = size;
  self->_shouldAnimateScrollToVisibleWeekViewForSelectedOccurrence = 0;
  [(NSMutableArray *)self->_weeksContainingSelectedOccurrences removeAllObjects];
  self->_shouldPresentEventCommentsForSelectedOccurrence = 0;
  [(LargeMonthViewController *)self setNeedsUpdateOfSupportedInterfaceOrientations];
}

- (void)popoverPresentationController:(id)a3 willRepositionPopoverToRect:(CGRect *)a4 inView:(id *)a5
{
  double v8 = [(EKEvent *)self->_eventBeingInspected startCalendarDate];
  id v19 = [(InfiniteScrollViewController *)self subviewForDate:v8];

  eventBeingInspected = self->_eventBeingInspected;
  double v10 = [(EKEvent *)eventBeingInspected startCalendarDate];
  [v19 frameForOccurrence:eventBeingInspected onDay:v10];
  CGFloat v12 = v11;
  CGFloat v14 = v13;
  CGFloat v16 = v15;
  CGFloat v18 = v17;

  v21.origin.x = v12;
  v21.origin.double y = v14;
  v21.size.double width = v16;
  v21.size.double height = v18;
  if (!CGRectIsNull(v21))
  {
    *a5 = v19;
    a4->origin.x = v12;
    a4->origin.double y = v14;
    a4->size.double width = v16;
    a4->size.double height = v18;
  }
  [(LargeMonthViewController *)self selectOccurrence:self->_eventBeingInspected inWeek:v19];
}

- (unint64_t)maximumCachedReusableViews
{
  return 12;
}

- (id)_createLargeMonthWeekViewForDate:(id)a3
{
  id v4 = a3;
  uint64_t v5 = CUIKOneIndexedWeekStart();
  id v6 = CUIKTodayDate();
  [v6 timeIntervalSinceReferenceDate];
  double v8 = v7;

  id v9 = [v4 calendarDateForWeekWithWeekStart:v5];
  double v10 = [v4 calendarDateForEndOfWeekWithWeekStart:v5];
  double v11 = [v9 calendarDateByAddingWeeks:1];
  CGFloat v12 = [v10 calendarDateByAddingWeeks:-1];
  id v13 = [v12 month];
  if (v13 == [v10 month] && (id v14 = objc_msgSend(v9, "month"), v14 == objc_msgSend(v11, "month")))
  {
    uint64_t v15 = 0;
    int v16 = 0;
    uint64_t v56 = 2;
    uint64_t v17 = 7;
  }
  else
  {
    id v18 = [v4 month];
    if (v18 == [v12 month])
    {
      id v19 = [v9 calendarDateForEndOfMonth];

      long long v20 = [v19 day];
      CGRect v21 = [v9 day];
      uint64_t v15 = 0;
      uint64_t v17 = v20 - v21 + 1;
      int v16 = 1;
      uint64_t v56 = 2;
      double v10 = v19;
    }
    else
    {
      uint64_t v22 = [v10 calendarDateForMonth];

      uint64_t v23 = [v10 day];
      int v16 = 0;
      uint64_t v15 = v23 - (unsigned char *)[v22 day] - 6;
      uint64_t v56 = 3;
      uint64_t v17 = 7;
      id v9 = v22;
    }
  }
  uint64_t v24 = v17 + v15;
  [v9 absoluteTime];
  if (v8 >= v25 && ([v10 absoluteTime], v8 <= v26))
  {
    double v28 = CUIKTodayComponents();
    id v27 = [v28 day];
  }
  else
  {
    id v27 = 0;
  }
  double v29 = [(LargeMonthViewController *)self view];
  [v29 bounds];
  double v31 = v30;
  double v33 = v32;
  double v35 = v34;

  [(LargeMonthViewController *)self _subviewHeightForDate:v9];
  double v37 = v36;
  v38 = [(InfiniteScrollViewController *)self dequeueReusableView];
  if (v38)
  {
    id v39 = v38;
    -[LargeMonthWeekView setFrame:](v38, "setFrame:", v31, v33, v35, v37);
  }
  else
  {
    id v39 = -[LargeMonthWeekView initWithFrame:]([LargeMonthWeekView alloc], "initWithFrame:", v31, v33, v35, v37);
    [(LargeMonthWeekView *)v39 setDataSource:self];
    [(LargeMonthWeekView *)v39 setDelegate:self];
    id v40 = [objc_alloc((Class)EKUIRightClickEmptySpaceInteraction) initWithDelegate:self];
    v55 = v10;
    v41 = self;
    id v42 = v27;
    uint64_t v43 = v24;
    int v44 = v16;
    id v45 = v4;
    v46 = v12;
    v47 = v11;
    v48 = v40;
    [(LargeMonthWeekView *)v39 addInteraction:v40];

    double v11 = v47;
    CGFloat v12 = v46;
    id v4 = v45;
    int v16 = v44;
    uint64_t v24 = v43;
    id v27 = v42;
    self = v41;
    double v10 = v55;
  }
  [(LargeMonthWeekView *)v39 setStartDate:v9 endDate:v10 dayCount:v24 todayDay:v27 reload:0];
  id v49 = [v9 month];
  if (v49 == [(EKCalendarDate *)self->_navigationBarDisplayedDate month])
  {
    id v50 = [v9 year];
    BOOL v51 = v50 != [(EKCalendarDate *)self->_navigationBarDisplayedDate year];
  }
  else
  {
    BOOL v51 = 1;
  }
  [(LargeMonthWeekView *)v39 setShowsFirstDayOfMonthLabel:v51 animated:0];
  if (v16) {
    uint64_t v52 = v56 | 4;
  }
  else {
    uint64_t v52 = v56;
  }
  [(LargeMonthWeekView *)v39 setAutoresizingMask:v52];
  v53 = +[CUIKPreferences sharedPreferences];
  -[LargeMonthWeekView setShowsWeekNumber:](v39, "setShowsWeekNumber:", [v53 showWeekNumbers]);

  return v39;
}

- (id)createInitialViewForDate:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [v4 calendarDateForWeekWithWeekStart:CUIKOneIndexedWeekStart()];

  id v6 = [(LargeMonthViewController *)self _createLargeMonthWeekViewForDate:v5];
  [v6 reloadData];

  return v6;
}

- (id)newTopViewAboveViewWithCalendarDate:(id)a3
{
  id v4 = [(MonthViewController *)self calendarDateForSubviewAboveSubviewWithCalendarDate:a3];
  uint64_t v5 = [(LargeMonthViewController *)self _createLargeMonthWeekViewForDate:v4];

  return v5;
}

- (id)newBottomViewBelowViewWithCalendarDate:(id)a3
{
  id v4 = [(MonthViewController *)self calendarDateForSubviewBelowSubviewWithCalendarDate:a3];
  uint64_t v5 = [(LargeMonthViewController *)self _createLargeMonthWeekViewForDate:v4];

  return v5;
}

- (double)decelerationDistanceThresholdForPreferringMonthBoundary
{
  BOOL v3 = objc_opt_class();
  id v4 = [(LargeMonthViewController *)self view];
  EKUICurrentWindowSize();
  [v3 _cellHeightForMultiplier:3.5 windowSize:v5, v6];
  double v8 = v7;

  return v8;
}

- (double)topInsetForSubviewWithCalendarDate:(id)a3
{
  +[LargeMonthWeekView topInset];
  return result;
}

- (double)subviewBufferExtensionMultiplier
{
  return 0.15;
}

- (void)significantTimeChangeOccurred
{
}

- (void)showDate:(id)a3 animated:(BOOL)a4
{
}

- (void)showEvent:(id)a3 animated:(BOOL)a4 showMode:(unint64_t)a5 context:(id)a6
{
}

- (void)updatePalette:(id)a3
{
  id v4 = a3;
  [v4 setWeekdayHeaderVisible:1];
  [v4 setWeekdayHeaderFillsHalfWidth:0];
  [v4 setTodayButtonVisible:1];
  [v4 setDateStringVisible:1];
  [v4 setDividerLineVisible:0];
  [v4 setFocusBannerPlacement:2];
  [v4 setDayScrubberController:0];
  [(LargeMonthViewController *)self _updateDayHeaderFrames];
  [v4 sizeToFit];
  [v4 frame];
  double v6 = v5;
  double v7 = [v4 containingPalette];
  [v7 setPreferredHeight:v6];

  id v9 = [v4 containingPalette];

  double v8 = [(LargeMonthViewController *)self navigationItem];
  [v8 _setBottomPalette:v9];
}

- (void)updateNavigationBarDisplayedDateString
{
  BOOL v3 = [(InfiniteScrollViewController *)self dateOfCenterViewOnScreen];
  id v4 = v3;
  if (self->_shouldForceAllowUpdateNavigationBarDateString
    || !self->_navigationBarDisplayedDate
    || (id v9 = [v3 month], v9 != -[EKCalendarDate month](self->_navigationBarDisplayedDate, "month"))
    || (id v10 = [v4 year], v10 != -[EKCalendarDate year](self->_navigationBarDisplayedDate, "year")))
  {
    self->_shouldForceAllowUpdateNavigationBarDateString = 0;
    double v5 = [(LargeMonthViewController *)self navigationController];
    double v6 = [v5 topMainViewControllerContainer];
    if ([v6 currentChildViewControllerIsLoaded])
    {
      double v7 = [v5 topMainViewControllerContainer];
      double v8 = [v7 currentChildViewController];

      if (v8 == self) {
        [v5 setNavBarStringFromDate:v4 includeMonth:1 includeYear:1];
      }
    }
    else
    {
    }
    v11[0] = _NSConcreteStackBlock;
    v11[1] = 3221225472;
    v11[2] = sub_10006739C;
    v11[3] = &unk_1001D29A0;
    id v12 = v4;
    [(InfiniteScrollViewController *)self enumerateScrollViewSubviews:v11];
    objc_storeStrong((id *)&self->_navigationBarDisplayedDate, v4);
  }
}

- (int)supportedToggleMode
{
  return 0;
}

- (void)didScroll
{
  v3.receiver = self;
  v3.super_class = (Class)LargeMonthViewController;
  [(MonthViewController *)&v3 didScroll];
  [(LargeMonthViewController *)self updateNavigationBarDisplayedDateString];
  if (!self->_animateResize) {
    [(LargeMonthViewController *)self _layoutGridlinesAndBackgrounds:0];
  }
}

- (void)didEndScrolling
{
  v3.receiver = self;
  v3.super_class = (Class)LargeMonthViewController;
  [(MonthViewController *)&v3 didEndScrolling];
  [(LargeMonthViewController *)self updateNavigationBarDisplayedDateString];
  [(LargeMonthViewController *)self _layoutGridlinesAndBackgrounds:0];
}

- (CGRect)frameForTodayHighlight
{
  objc_super v3 = CUIKTodayDate();
  id v4 = [(CUIKCalendarModel *)self->super.super.super._model calendar];
  double v5 = [v4 timeZone];
  double v6 = +[EKCalendarDate calendarDateWithDate:v3 timeZone:v5];

  double v7 = [(InfiniteScrollViewController *)self subviewForDate:v6];
  double v8 = v7;
  if (v7)
  {
    [v7 frameForTodayHighlight];
    double v10 = v9;
    double v12 = v11;
    double v14 = v13;
    double v16 = v15;
    uint64_t v17 = [(LargeMonthViewController *)self view];
    [v17 convertRect:v8 fromView:v10];
    CGFloat x = v18;
    CGFloat y = v20;
    CGFloat width = v22;
    CGFloat height = v24;
  }
  else
  {
    CGFloat x = CGRectZero.origin.x;
    CGFloat y = CGRectZero.origin.y;
    CGFloat width = CGRectZero.size.width;
    CGFloat height = CGRectZero.size.height;
  }

  double v26 = x;
  double v27 = y;
  double v28 = width;
  double v29 = height;
  result.size.CGFloat height = v29;
  result.size.CGFloat width = v28;
  result.origin.CGFloat y = v27;
  result.origin.CGFloat x = v26;
  return result;
}

- (void)setIsWaitingForBackgroundLoadingOfSelectedEventOccurrenceView:(BOOL)a3
{
  self->_isWaitingForBackgroundLoadingOfSelectedEventOccurrenceView = a3;
}

- (BOOL)isWaitingForBackgroundLoadingOfSelectedEventOccurrenceView
{
  return self->_isWaitingForBackgroundLoadingOfSelectedEventOccurrenceView;
}

- (id)shownEventViewController
{
  objc_super v3 = [(LargeMonthViewController *)self viewControllerToShowFrom];
  id v4 = [v3 presentingViewController];

  if (v4)
  {
    v7.receiver = self;
    v7.super_class = (Class)LargeMonthViewController;
    double v5 = [(MainViewController *)&v7 shownEventViewController];
  }
  else
  {
    double v5 = 0;
  }

  return v5;
}

- (id)shownEventEditViewController
{
  objc_super v3 = [(LargeMonthViewController *)self viewControllerToShowFrom];
  id v4 = [v3 presentingViewController];

  if (v4)
  {
    v7.receiver = self;
    v7.super_class = (Class)LargeMonthViewController;
    double v5 = [(MainViewController *)&v7 shownEventEditViewController];
  }
  else
  {
    double v5 = 0;
  }

  return v5;
}

- (BOOL)currentlyEditingEventsWithGestures
{
  v2 = [(MonthViewController *)self draggedOccurrenceView];
  BOOL v3 = v2 != 0;

  return v3;
}

- (int64_t)intendedSizeClass
{
  return 2;
}

- (BOOL)allowsOverriddenRightNavigationBarItems
{
  return 0;
}

- (BOOL)allowsOverriddenToolbarItems
{
  return 0;
}

- (BOOL)mainViewControllerCanChangeSelectedEvent
{
  v2 = [(LargeMonthViewController *)self shownEventEditViewController];
  BOOL v3 = v2 == 0;

  return v3;
}

- (BOOL)mainViewControllerCanChangeSelectedDate
{
  BOOL v3 = [(LargeMonthViewController *)self shownEventEditViewController];
  if (v3)
  {
    BOOL v4 = 0;
  }
  else
  {
    double v5 = [(LargeMonthViewController *)self shownEventViewController];
    BOOL v4 = v5 == 0;
  }
  return v4;
}

- (BOOL)requiresSelfAsEventEditorDelegate
{
  return 1;
}

- (void)showNextOccurrenceOfSelectableItem
{
  BOOL v3 = [(LargeMonthViewController *)self shownEventViewController];

  if (v3)
  {
    id v4 = [(LargeMonthViewController *)self shownEventViewController];
    [(LargeMonthViewController *)self eventViewControllerNextButtonWasTapped:v4];
  }
}

- (void)showPreviousOccurrenceOfSelectableItem
{
  BOOL v3 = [(LargeMonthViewController *)self shownEventViewController];

  if (v3)
  {
    id v4 = [(LargeMonthViewController *)self shownEventViewController];
    [(LargeMonthViewController *)self eventViewControllerPreviousButtonWasTapped:v4];
  }
}

- (void)navigateToNextDateComponentUnitAnimated:(BOOL)a3
{
}

- (void)navigateToPreviousDateComponentUnitAnimated:(BOOL)a3
{
}

- (void)_showNextDateComponentUnitInForwardDirection:(BOOL)a3 animated:(BOOL)a4
{
  BOOL v4 = a4;
  BOOL v5 = a3;
  [(LargeMonthViewController *)self _closeEventPresentationAnimated:0];
  objc_super v7 = [(MainViewController *)self model];
  id v10 = [v7 selectedDate];

  if (v5) {
    uint64_t v8 = 1;
  }
  else {
    uint64_t v8 = -1;
  }
  double v9 = [v10 calendarDateByAddingMonths:v8];
  [(MonthViewController *)self selectDate:v9 animated:v4];
}

- (double)_subviewHeightForDate:(id)a3
{
  id v4 = a3;
  BOOL v5 = [v4 calendarDateForWeekWithWeekStart:CUIKOneIndexedWeekStart()];
  double v6 = [v5 calendarDateByAddingWeeks:1];
  id v7 = [v6 day];
  uint64_t v8 = [v4 calendarDateForMonth];

  id v9 = [v8 day];
  if (v7 == v9) {
    double v10 = 2.0;
  }
  else {
    double v10 = 1.0;
  }
  double v11 = objc_opt_class();
  double v12 = [(LargeMonthViewController *)self view];
  EKUICurrentWindowSize();
  [v11 _cellHeightForMultiplier:v10 windowSize:v13, v14];
  double v16 = v15;

  return v16;
}

+ (double)_cellHeightForMultiplier:(double)a3 windowSize:(CGSize)a4
{
  double width = a4.width;
  if (qword_100216660 != -1) {
    dispatch_once(&qword_100216660, &stru_1001D3310);
  }
  [(id)qword_100216658 valueForSize:width];
  return v6 * a3;
}

- (id)pushedWeekViewControllerWithDate:(id)a3 animated:(BOOL)a4
{
  BOOL v4 = a4;
  double v6 = [(LargeMonthViewController *)self nextLevelWeekViewControllerWithDate:a3];
  id v7 = [(LargeMonthViewController *)self navigationController];
  [v7 pushViewController:v6 animated:v4];

  return v6;
}

- (id)nextLevelWeekViewControllerWithDate:(id)a3
{
  [(CUIKCalendarModel *)self->super.super.super._model setSelectedDate:a3];
  BOOL v4 = [WeekViewContainerViewController alloc];
  model = self->super.super.super._model;
  double v6 = [(MainViewController *)self window];
  id v7 = [(MainViewControllerContainer *)v4 initWithModel:model window:v6];

  return v7;
}

- (id)occurrencesForStartDate:(id)a3 endDate:(id)a4 waitForLoad:(BOOL)a5
{
  BOOL v5 = [(CUIKCalendarModel *)self->super.super.super._model occurrencesForStartDate:a3 endDate:a4 preSorted:0 waitForLoad:a5];
  double v6 = [v5 occurrences];

  return v6;
}

- (void)didCompleteBackgroundOccurrenceRenderingForLargeMonthWeekView:(id)a3
{
  id v4 = a3;
  BOOL v5 = [(MainViewController *)self model];
  double v6 = [v5 selectedOccurrence];

  unsigned int v7 = [(LargeMonthViewController *)self isReadyToShowViewControllersInsideEnqueueableManagedNavigationController:0 isPreemptiveCheck:1];
  if (v6)
  {
    unsigned int v8 = v7;
    if ([(LargeMonthViewController *)self isWaitingForBackgroundLoadingOfSelectedEventOccurrenceView])
    {
      id v9 = [v6 endCalendarDate];
      [v9 absoluteTime];
      double v11 = v10;
      double v12 = [v4 startDate];
      [v12 absoluteTime];
      if (v11 <= v13)
      {

LABEL_11:
        goto LABEL_12;
      }
      double v14 = [v6 startCalendarDate];
      [v14 absoluteTime];
      double v16 = v15;
      uint64_t v17 = [v4 endDate];
      [v17 absoluteTime];
      if (v16 >= v18) {
        unsigned int v8 = 0;
      }

      if (v8 == 1)
      {
        [(LargeMonthViewController *)self setIsWaitingForBackgroundLoadingOfSelectedEventOccurrenceView:0];
        id v19 = (void *)kCalUILogHandle;
        if (os_log_type_enabled((os_log_t)kCalUILogHandle, OS_LOG_TYPE_DEBUG))
        {
          double v20 = v19;
          CGRect v21 = objc_opt_class();
          id v22 = v21;
          uint64_t v23 = [(MainViewController *)self managedNavigationController];
          *(_DWORD *)double v25 = 138412546;
          *(void *)&v25[4] = v21;
          *(_WORD *)&v25[12] = 2112;
          *(void *)&v25[14] = objc_opt_class();
          id v24 = *(id *)&v25[14];
          _os_log_impl((void *)&_mh_execute_header, v20, OS_LOG_TYPE_DEBUG, "%@ notifying %@ that it completed background rendering of the occurrence view for the selected event.", v25, 0x16u);
        }
        id v9 = [(MainViewController *)self managedNavigationController];
        [v9 sourceViewController:self notifiesReadinessForPresentation:1];
        goto LABEL_11;
      }
    }
  }
LABEL_12:
}

- (BOOL)isBackgroundScene
{
  v2 = [(MainViewController *)self window];
  BOOL v3 = [v2 windowScene];
  BOOL v4 = [v3 activationState] == (id)2;

  return v4;
}

- (void)largeMonthWeekView:(id)a3 didTapOccurrence:(id)a4 onDay:(id)a5 extendSelection:(BOOL)a6 userInitiated:(BOOL)a7 tappedSymbol:(BOOL)a8
{
  BOOL v8 = a8;
  BOOL v9 = a7;
  BOOL v10 = a6;
  id v36 = a3;
  id v14 = a4;
  id v15 = a5;
  double v16 = [(MainViewController *)self model];
  uint64_t v17 = [v16 pasteboardManager];
  if (v14) {
    [v14 startDate];
  }
  else {
  double v18 = [v15 date];
  }
  [v17 setDateForPaste:v18];

  id v19 = [(LargeMonthViewController *)self shownEventEditViewController];

  if (v19) {
    goto LABEL_22;
  }
  if (v9)
  {
    double v20 = [(LargeMonthViewController *)self presentedViewController];
    unsigned __int8 v21 = [v20 isBeingDismissed];

    if (v21) {
      goto LABEL_22;
    }
    p_isTrackingTouches = &self->_isTrackingTouches;
    if (!self->_isTrackingTouches)
    {
      uint64_t v23 = [(InfiniteScrollViewController *)self subviewForDate:v15];
      id v24 = (void *)v23;
      if (v14 && v23)
      {
        if (v10)
        {
          double v25 = [(CUIKCalendarModel *)self->super.super.super._model selectedOccurrences];
          unsigned int v26 = [v25 containsObject:v14];

          if (v26) {
            [(LargeMonthViewController *)self removeEventFromSelection:v14 inWeek:v24 updateModel:1];
          }
          else {
            [(LargeMonthViewController *)self addEventToSelection:v14 inWeek:v24 updateModel:1];
          }
        }
        else if (v8 && [v14 isIntegrationEvent])
        {
          [(LargeMonthViewController *)self completeReminderFromTap:v14];
        }
        else
        {
          [(LargeMonthViewController *)self _showEventDetailsForOccurrence:v14 inWeek:v24 onDay:v15 creationMethod:0];
        }
      }
      else
      {
        double v33 = [(LargeMonthViewController *)self shownEventEditViewController];
        if (v33)
        {
          BOOL currentlyEditingEvent = self->_currentlyEditingEvent;

          if (!currentlyEditingEvent)
          {
            [(LargeMonthViewController *)self _closeEventPresentationAnimated:1];
            [(MonthViewController *)self removeDraggingOccurrenceAnimated:1];
            [(MonthViewController *)self removeAllWeekHighlights];
            [(LargeMonthViewController *)self selectOccurrence:0 inWeek:0];
            double v35 = [(InfiniteScrollViewController *)self scrollView];
            [v35 setScrollEnabled:1];
          }
        }
      }

      goto LABEL_22;
    }
    goto LABEL_14;
  }
  p_isTrackingTouches = &self->_isTrackingTouches;
  if (self->_isTrackingTouches)
  {
LABEL_14:
    double v27 = [(LargeMonthViewController *)self shownEventViewController];

    if (v27)
    {
      double v28 = [(CUIKCalendarModel *)self->super.super.super._model selectedOccurrence];

      if (v28)
      {
        double v29 = [(CUIKCalendarModel *)self->super.super.super._model selectedOccurrence];
        double v30 = [(NSMutableArray *)self->_weeksContainingSelectedOccurrences firstObject];
        [(LargeMonthViewController *)self _showEventDetailsForOccurrence:v29 inWeek:v30 onDay:self->_tappedDay creationMethod:0];
      }
      else
      {
        [(LargeMonthViewController *)self _closeEventPresentationAnimated:1];
      }
    }
    BOOL *p_isTrackingTouches = 0;
    goto LABEL_22;
  }
  if (v14)
  {
    double v31 = [(CUIKCalendarModel *)self->super.super.super._model selectedOccurrences];
    unsigned __int8 v32 = [v31 containsObject:v14];

    if ((v32 & 1) == 0) {
      [(CUIKCalendarModel *)self->super.super.super._model setSelectedOccurrence:v14];
    }
  }
LABEL_22:
}

- (void)completeReminderFromTap:(id)a3
{
  id v4 = a3;
  [v4 setCompleted:[v4 completed] ^ 1];
  BOOL v5 = [(LargeMonthViewController *)self EKUI_editor];
  id v9 = 0;
  unsigned __int8 v6 = [v5 saveEvent:v4 span:0 error:&v9];

  id v7 = v9;
  if ((v6 & 1) == 0)
  {
    BOOL v8 = kCalUILogHandle;
    if (os_log_type_enabled((os_log_t)kCalUILogHandle, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412290;
      id v11 = v7;
      _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_ERROR, "error completing/uncompleting reminder: %@", buf, 0xCu);
    }
  }
}

- (void)largeMonthWeekView:(id)a3 didDoubleTapOnDay:(id)a4
{
  id v8 = a4;
  [(LargeMonthViewController *)self _closeEventPresentationAnimated:0];
  [(MonthViewController *)self removeAllWeekHighlights];
  [(CUIKCalendarModel *)self->super.super.super._model setSelectedDate:v8];
  BOOL v5 = [(LargeMonthViewController *)self pushedWeekViewControllerWithDate:v8 animated:0];
  unsigned __int8 v6 = [v5 currentChildViewController];

  if (objc_opt_respondsToSelector()) {
    id v7 = [v6 pushedDayViewControllerWithDate:v8 animated:0];
  }
}

- (void)largeMonthWeekView:(id)a3 touchesBegan:(id)a4 withEvent:(id)a5
{
  id v8 = a4;
  unsigned __int8 v6 = [(LargeMonthViewController *)self shownEventEditViewController];

  if (!v6)
  {
    id v7 = [(LargeMonthViewController *)self shownEventViewController];

    if (v7)
    {
      self->_isTrackingTouches = 1;
      [(LargeMonthViewController *)self _scrubWithTouches:v8];
    }
  }
}

- (void)largeMonthWeekView:(id)a3 touchesMoved:(id)a4 withEvent:(id)a5
{
  id v8 = a4;
  unsigned __int8 v6 = [(LargeMonthViewController *)self shownEventEditViewController];

  if (!v6)
  {
    id v7 = [(LargeMonthViewController *)self shownEventViewController];

    if (v7) {
      [(LargeMonthViewController *)self _scrubWithTouches:v8];
    }
  }
}

- (void)largeMonthWeekView:(id)a3 touchesEnded:(id)a4 withEvent:(id)a5
{
  id v20 = a4;
  unsigned __int8 v6 = [(LargeMonthViewController *)self shownEventEditViewController];

  if (!v6)
  {
    self->_isTrackingTouches = 0;
    id v7 = [(LargeMonthViewController *)self shownEventViewController];

    if (v7)
    {
      [(LargeMonthViewController *)self _scrubWithTouches:v20];
      id v8 = [(MainViewController *)self model];
      id v9 = [v8 selectedOccurrence];

      if (v9)
      {
        BOOL v10 = [v20 anyObject];
        id v11 = [(InfiniteScrollViewController *)self scrollView];
        [v10 locationInView:v11];
        double v13 = v12;
        double v15 = v14;

        double v16 = -[LargeMonthViewController _weekViewAtPoint:pointInWeek:](self, "_weekViewAtPoint:pointInWeek:", 0, v13, v15);
        uint64_t v17 = [(MainViewController *)self model];
        double v18 = [v17 selectedOccurrence];
        id v19 = -[MonthViewController dateAtPoint:](self, "dateAtPoint:", v13, v15);
        [(LargeMonthViewController *)self _showEventDetailsForOccurrence:v18 inWeek:v16 onDay:v19 creationMethod:0];
      }
      else
      {
        [(LargeMonthViewController *)self _closeEventPresentationAnimated:1];
      }
      [(MonthViewController *)self removeAllWeekHighlights];
    }
  }
}

- (id)presentationControllerForEditMenu
{
  v2 = [(LargeMonthViewController *)self currentPresentationController];
  BOOL v3 = [v2 presentedViewController];

  if (v3)
  {
    id v4 = [v2 presentedViewController];
  }
  else
  {
    id v4 = v2;
  }
  BOOL v5 = v4;

  return v5;
}

- (id)selectedEventsForEditMenu
{
  return [(CUIKCalendarModel *)self->super.super.super._model selectedOccurrences];
}

- (BOOL)interaction:(id)a3 shouldShowMenuAtPoint:(CGPoint)a4 inView:(id)a5
{
  BOOL v5 = [a5 occurrenceAtPoint:a3 x:a4.x y:a4.y];
  BOOL v6 = v5 == 0;

  return v6;
}

- (BOOL)interaction:(id)a3 canPasteEventAtPoint:(CGPoint)a4 inView:(id)a5
{
  BOOL v5 = [(MainViewController *)self model];
  BOOL v6 = [v5 pasteboardManager];
  unsigned __int8 v7 = [v6 canPerformPaste];

  return v7;
}

- (BOOL)interaction:(id)a3 canCreateEventAtPoint:(CGPoint)a4 inView:(id)a5
{
  BOOL v5 = [(MainViewController *)self model];
  BOOL v6 = [v5 defaultCalendarForNewEvents];
  BOOL v7 = v6 != 0;

  return v7;
}

- (BOOL)interaction:(id)a3 canCreateReminderAtPoint:(CGPoint)a4 inView:(id)a5
{
  BOOL v5 = [(MainViewController *)self model];
  BOOL v6 = [v5 reminderCalendar];
  BOOL v7 = v6 != 0;

  return v7;
}

- (void)interaction:(id)a3 createEventAtPoint:(CGPoint)a4 inView:(id)a5
{
  double y = a4.y;
  double x = a4.x;
  id v8 = a5;
  id v9 = [(InfiniteScrollViewController *)self scrollView];
  [v9 convertPoint:v8 fromView:x, y];
  double v11 = v10;
  double v13 = v12;

  id v14 = -[MonthViewController eventGestureController:setUpAtPoint:withOccurrence:forceNewEvent:](self, "eventGestureController:setUpAtPoint:withOccurrence:forceNewEvent:", 0, 0, 1, v11, v13);

  -[MonthViewController eventGestureController:commitToPoint:](self, "eventGestureController:commitToPoint:", 0, v11, v13);
}

- (void)interaction:(id)a3 createReminderAtPoint:(CGPoint)a4 inView:(id)a5
{
  double y = a4.y;
  double x = a4.x;
  id v8 = a5;
  id v9 = [(InfiniteScrollViewController *)self scrollView];
  [v9 convertPoint:v8 fromView:x, y];
  double v11 = v10;
  double v13 = v12;

  -[MonthViewController eventGestureController:setUpAtPoint:withOccurrence:forceNewEvent:](self, "eventGestureController:setUpAtPoint:withOccurrence:forceNewEvent:", 0, 0, 1, v11, v13);
  id v17 = (id)objc_claimAutoreleasedReturnValue();
  id v14 = [(MainViewController *)self model];
  double v15 = [v14 reminderCalendar];
  [v17 setCalendar:v15];

  double v16 = [v17 startDate];
  [v17 setEndDate:v16];

  -[MonthViewController eventGestureController:commitToPoint:](self, "eventGestureController:commitToPoint:", 0, v11, v13);
}

- (void)interaction:(id)a3 pasteEventAtPoint:(CGPoint)a4 inView:(id)a5
{
  double y = a4.y;
  double x = a4.x;
  id v8 = a5;
  id v9 = [(InfiniteScrollViewController *)self scrollView];
  [v9 convertPoint:v8 fromView:x, y];
  double v11 = v10;
  double v13 = v12;

  -[MonthViewController dateAtPoint:](self, "dateAtPoint:", v11, v13);
  id v19 = (id)objc_claimAutoreleasedReturnValue();
  id v14 = [(MainViewController *)self model];
  double v15 = [v14 pasteboardManager];
  double v16 = [v19 date];
  [v15 setDateForPaste:v16];

  id v17 = [(MainViewController *)self model];
  double v18 = [v17 pasteboardManager];
  [v18 pasteEventsWithDateMode:0 delegate:self];
}

- (id)interaction:(id)a3 titleForPasteActionAtPoint:(CGPoint)a4 inView:(id)a5
{
  BOOL v5 = [(MainViewController *)self model];
  BOOL v6 = [v5 pasteboardManager];
  id v7 = [v6 numberOfEventsToPaste];

  return +[EKUIRightClickEmptySpaceInteraction localizedPasteStringForEventCount:v7 includeHere:0];
}

- (id)interaction:(id)a3 subtitleForPasteActionAtPoint:(CGPoint)a4 inView:(id)a5
{
  double y = a4.y;
  double x = a4.x;
  id v8 = a5;
  id v9 = [(InfiniteScrollViewController *)self scrollView];
  [v9 convertPoint:v8 fromView:x, y];
  double v11 = v10;
  double v13 = v12;

  id v14 = -[MonthViewController dateAtPoint:](self, "dateAtPoint:", v11, v13);
  double v15 = [v14 date];
  double v16 = CUIKCalendar();
  id v17 = +[CUIKPasteboardUtilities roundedDateForDate:v15 dateMode:0 calendar:v16];

  id v18 = objc_alloc_init((Class)NSDateFormatter);
  [v18 setCalendar:v16];
  id v19 = [v16 timeZone];
  [v18 setTimeZone:v19];

  [v18 setDoesRelativeDateFormatting:1];
  [v18 setDateStyle:1];
  [v18 setTimeStyle:0];
  id v20 = [v18 stringFromDate:v17];

  return v20;
}

- (void)pasteboardManager:(id)a3 beginEditingEvent:(id)a4
{
}

- (void)pasteboardManager:(id)a3 presentAlert:(id)a4
{
}

- (void)pasteboardManager:(id)a3 didFinishPasteWithResult:(unint64_t)a4 willOpenEditor:(BOOL)a5
{
  if (!a4 && !a5) {
    [(MainViewController *)self attemptDisplayReviewPrompt];
  }
}

- (void)_showEventDetailsForOccurrence:(id)a3 inWeek:(id)a4 onDay:(id)a5 creationMethod:(unint64_t)a6
{
}

- (void)_showEventDetailsForOccurrence:(id)a3 inWeek:(id)a4 onDay:(id)a5 animatedScrollToVisible:(BOOL)a6 showMode:(unint64_t)a7 context:(id)a8 creationMethod:(unint64_t)a9
{
  id v15 = a3;
  id v16 = a4;
  id v39 = a5;
  id v17 = a8;
  id v18 = [(MainViewController *)self model];
  [v18 setSelectedOccurrence:v15];

  if (!self->_weeksContainingSelectedOccurrences)
  {
    id v19 = +[NSMutableArray array];
    weeksContainingSelectedOccurrences = self->_weeksContainingSelectedOccurrences;
    self->_weeksContainingSelectedOccurrences = v19;
  }
  if (v16) {
    [(NSMutableArray *)self->_weeksContainingSelectedOccurrences addObject:v16];
  }
  id v40 = v16;
  objc_storeStrong((id *)&self->_tappedDay, a5);
  self->_shouldAnimateScrollToVisibleWeekViewForSelectedOccurrence = a6;
  BOOL v38 = a7 == 2;
  self->_shouldPresentEventCommentsForSelectedOccurrence = a7 == 2;
  uint64_t v53 = 0;
  v54 = &v53;
  uint64_t v55 = 0x3032000000;
  uint64_t v56 = sub_100065904;
  v57 = sub_100065914;
  id v58 = 0;
  unsigned __int8 v21 = [(LargeMonthViewController *)self viewControllerToShowFrom];
  v45[0] = _NSConcreteStackBlock;
  v45[1] = 3221225472;
  v45[2] = sub_10006924C;
  v45[3] = &unk_1001D3338;
  id v22 = v15;
  id v46 = v22;
  v47 = self;
  unint64_t v51 = a7;
  unint64_t v52 = a9;
  id v50 = &v53;
  id v23 = v17;
  id v48 = v23;
  id v24 = v21;
  id v49 = v24;
  double v25 = objc_retainBlock(v45);
  unsigned int v26 = [v24 viewControllers];
  id v27 = [v26 count];

  if (!v27) {
    goto LABEL_10;
  }
  double v28 = [(LargeMonthViewController *)self shownEventEditViewController];
  double v29 = [v28 event];
  if ([v29 isEqual:v22])
  {

    goto LABEL_11;
  }
  double v30 = [(LargeMonthViewController *)self shownEventViewController];
  double v31 = [v30 event];
  unsigned __int8 v32 = [v31 isEqual:v22];

  if ((v32 & 1) == 0)
  {
    [v24 setViewControllers:&__NSArray0__struct animated:0];
    [v24 dismissViewControllerAnimated:0 completion:0];
LABEL_10:
    ((void (*)(void *))v25[2])(v25);
  }
LABEL_11:
  if (v54[5])
  {
    double v33 = [(LargeMonthViewController *)self navigationController];
    double v34 = [v33 view];
    double v35 = [v34 window];

    if (v35) {
      EKUIPushFallbackSizingContextWithViewHierarchy();
    }
    uint64_t v36 = v54[5];
    v41[0] = _NSConcreteStackBlock;
    v41[1] = 3221225472;
    v41[2] = sub_100069344;
    v41[3] = &unk_1001D3360;
    BOOL v44 = v38;
    uint64_t v43 = &v53;
    id v37 = v35;
    id v42 = v37;
    [v24 showViewController:v36 sender:self animated:1 completion:v41];
  }
  _Block_object_dispose(&v53, 8);
}

- (void)showViewController:(id)a3 sender:(id)a4 animated:(BOOL)a5 completion:(id)a6
{
  BOOL v7 = a5;
  id v10 = a3;
  id v11 = a4;
  id v12 = a6;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    double v13 = [(LargeMonthViewController *)self viewControllerToShowFrom];
    [v13 setNavigationBarHidden:1 animated:0];
  }
  v14.receiver = self;
  v14.super_class = (Class)LargeMonthViewController;
  [(MainViewController *)&v14 showViewController:v10 sender:v11 animated:v7 completion:v12];
}

- (void)_scrubAtPoint:(CGPoint)a3
{
  double y = a3.y;
  double x = a3.x;
  BOOL v6 = [(LargeMonthViewController *)self shownEventEditViewController];

  if (!v6)
  {
    v13.double x = x;
    v13.double y = y;
    if (!CGRectContainsPoint(self->_scrubbingRect, v13)
      || (-[LargeMonthViewController occurrenceAtPoint:](self, "occurrenceAtPoint:", x, y),
          (uint64_t v7 = objc_claimAutoreleasedReturnValue()) == 0))
    {
      id v8 = [(MainViewController *)self model];
      id v9 = [v8 selectedOccurrence];

      if (!v9) {
        return;
      }
      uint64_t v7 = 0;
    }
    id v11 = (id)v7;
    id v10 = -[LargeMonthViewController _weekViewAtPoint:pointInWeek:](self, "_weekViewAtPoint:pointInWeek:", 0, x, y);
    [(LargeMonthViewController *)self selectOccurrence:v11 inWeek:v10];
  }
}

- (void)_scrubWithTouches:(id)a3
{
  id v9 = [a3 anyObject];
  id v4 = [(InfiniteScrollViewController *)self scrollView];
  [v9 locationInView:v4];
  double v6 = v5;
  double v8 = v7;

  -[LargeMonthViewController _scrubAtPoint:](self, "_scrubAtPoint:", v6, v8);
}

- (void)_scrollToWeekView:(id)a3 animated:(BOOL)a4 completion:(id)a5
{
  BOOL v6 = a4;
  id v8 = a3;
  id v9 = (void (**)(id, uint64_t))a5;
  if (v8)
  {
    if (v6) {
      double v10 = 0.4;
    }
    else {
      double v10 = 0.0;
    }
    id v11 = [(MainViewController *)self existingPalette];
    id v12 = [v11 superview];
    [v11 frame];
    double MaxY = CGRectGetMaxY(v47);
    objc_super v14 = [(LargeMonthViewController *)self view];
    [v12 convertPoint:v14 toView:0.0, MaxY];
    double v16 = v15;

    id v17 = [(LargeMonthViewController *)self view];
    [v17 bounds];
    double v18 = CGRectGetMaxY(v48);

    id v19 = [v8 superview];
    [v8 frame];
    double v21 = v20;
    double v23 = v22;
    double v25 = v24;
    double v27 = v26;
    double v28 = [(LargeMonthViewController *)self view];
    [v19 convertRect:v28 toView:v21];
    CGFloat v30 = v29;
    CGFloat v32 = v31;
    CGFloat v34 = v33;
    CGFloat v36 = v35;

    v49.origin.double x = v30;
    v49.origin.double y = v32;
    v49.size.double width = v34;
    v49.size.CGFloat height = v36;
    if (CGRectGetMinY(v49) >= v16 + 0.0)
    {
      v51.origin.double x = v30;
      v51.origin.double y = v32;
      v51.size.double width = v34;
      v51.size.CGFloat height = v36;
      if (CGRectGetMaxY(v51) <= v18) {
        goto LABEL_13;
      }
      v52.origin.double x = v30;
      v52.origin.double y = v32;
      v52.size.double width = v34;
      v52.size.CGFloat height = v36;
      double v37 = CGRectGetMaxY(v52) - v18;
    }
    else
    {
      v50.origin.double x = v30;
      v50.origin.double y = v32;
      v50.size.double width = v34;
      v50.size.CGFloat height = v36;
      double v37 = CGRectGetMinY(v50) - v16;
    }
    if (v37 != 0.0)
    {
      id v39 = [(InfiniteScrollViewController *)self scrollView];
      [v39 contentOffset];
      uint64_t v41 = v40;
      double v43 = v42;

      v44[0] = _NSConcreteStackBlock;
      v44[1] = 3221225472;
      v44[2] = sub_100069938;
      v44[3] = &unk_1001D2A18;
      v44[4] = self;
      v44[5] = v41;
      *(double *)&v44[6] = v37 + v43;
      +[UIView animateWithDuration:v44 animations:v9 completion:v10];
LABEL_15:

      goto LABEL_16;
    }
LABEL_13:
    if (v9) {
      v9[2](v9, 1);
    }
    goto LABEL_15;
  }
  BOOL v38 = kCalUILogHandle;
  if (os_log_type_enabled((os_log_t)kCalUILogHandle, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 136315138;
    id v46 = "-[LargeMonthViewController _scrollToWeekView:animated:completion:]";
    _os_log_impl((void *)&_mh_execute_header, v38, OS_LOG_TYPE_DEBUG, "%s: Can't scroll to nil weekView.", buf, 0xCu);
  }
LABEL_16:
}

- (void)_closeEventPresentationAnimated:(BOOL)a3
{
}

- (void)_closeEventPresentationAnimated:(BOOL)a3 completion:(id)a4
{
}

- (void)_closeEventPresentationAnimated:(BOOL)a3 viewController:(id)a4 completion:(id)a5
{
  BOOL v6 = a3;
  id v8 = a4;
  id v9 = a5;
  double v10 = [(LargeMonthViewController *)self presentedViewController];
  id v11 = [v10 popoverPresentationController];

  if (v11)
  {
    if (([v11 dismissing] & 1) == 0)
    {
      if (v6) {
        double v12 = 0.3;
      }
      else {
        double v12 = 0.0;
      }
      v18[0] = _NSConcreteStackBlock;
      v18[1] = 3221225472;
      v18[2] = sub_100069B7C;
      v18[3] = &unk_1001D2740;
      id v19 = v11;
      v15[0] = _NSConcreteStackBlock;
      v15[1] = 3221225472;
      v15[2] = sub_100069BC4;
      v15[3] = &unk_1001D33B0;
      v15[4] = self;
      id v16 = v19;
      id v17 = v9;
      +[UIView animateWithDuration:v18 animations:v15 completion:v12];
    }
  }
  else if (v8)
  {
    CGPoint v13 = [v8 presentingViewController];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      uint64_t v14 = [v13 presentingViewController];

      CGPoint v13 = (void *)v14;
    }
    [v13 dismissViewControllerAnimated:v6 completion:v9];
  }
}

- (void)addEventToSelection:(id)a3 inWeek:(id)a4 updateModel:(BOOL)a5
{
  BOOL v5 = a5;
  id v12 = a3;
  id v8 = a4;
  if (v5) {
    [(CUIKCalendarModel *)self->super.super.super._model selectOccurrence:v12];
  }
  if (v8)
  {
    [v8 selectOccurrence:v12];
    if (([(NSMutableArray *)self->_weeksContainingSelectedOccurrences containsObject:v8] & 1) == 0)
    {
      weeksContainingSelectedOccurrences = self->_weeksContainingSelectedOccurrences;
      if (!weeksContainingSelectedOccurrences)
      {
        double v10 = +[NSMutableArray array];
        id v11 = self->_weeksContainingSelectedOccurrences;
        self->_weeksContainingSelectedOccurrences = v10;

        weeksContainingSelectedOccurrences = self->_weeksContainingSelectedOccurrences;
      }
      [(NSMutableArray *)weeksContainingSelectedOccurrences addObject:v8];
    }
  }
}

- (void)removeEventFromSelection:(id)a3 inWeek:(id)a4 updateModel:(BOOL)a5
{
  BOOL v5 = a5;
  id v11 = a3;
  id v8 = a4;
  if (v5) {
    [(CUIKCalendarModel *)self->super.super.super._model deselectOccurrence:v11];
  }
  [v8 deselectOccurrence:v11];
  id v9 = [v8 selectedOccurrences];
  id v10 = [v9 count];

  if (!v10) {
    [(NSMutableArray *)self->_weeksContainingSelectedOccurrences removeObject:v8];
  }
}

- (BOOL)isReadyToShowViewControllersInsideEnqueueableManagedNavigationController:(id)a3
{
  return [(LargeMonthViewController *)self isReadyToShowViewControllersInsideEnqueueableManagedNavigationController:a3 isPreemptiveCheck:0];
}

- (BOOL)isReadyToShowViewControllersInsideEnqueueableManagedNavigationController:(id)a3 isPreemptiveCheck:(BOOL)a4
{
  BOOL v6 = [(MainViewController *)self model];
  double v7 = [v6 selectedOccurrence];

  if (v7)
  {
    id v8 = [v7 startCalendarDate];
    id v9 = [(InfiniteScrollViewController *)self subviewForDate:v8];

    id v10 = [(LargeMonthViewController *)self view];
    id v11 = [v7 startCalendarDate];
    id v12 = [v11 calendarDateForDay];
    [v9 frameForOccurrence:v7 onDay:v12];
    [v10 convertRect:v9 fromView:];
    CGFloat v14 = v13;
    CGFloat v16 = v15;
    CGFloat v18 = v17;
    CGFloat v20 = v19;

    if (a4) {
      unsigned int v21 = 1;
    }
    else {
      unsigned int v21 = ![(LargeMonthViewController *)self isWaitingForBackgroundLoadingOfSelectedEventOccurrenceView];
    }
    if (v9) {
      unsigned int v24 = v21;
    }
    else {
      unsigned int v24 = 0;
    }
    v30.origin.double x = v14;
    v30.origin.double y = v16;
    v30.size.double width = v18;
    v30.size.CGFloat height = v20;
    int v25 = v24 & ~CGRectIsEmpty(v30);
    double v26 = [(LargeMonthViewController *)self view];
    [v26 bounds];
    v32.origin.double x = v14;
    v32.origin.double y = v16;
    v32.size.double width = v18;
    v32.size.CGFloat height = v20;
    BOOL v23 = v25 & CGRectContainsRect(v31, v32);
  }
  else
  {
    double v22 = kCalUILogHandle;
    if (os_log_type_enabled((os_log_t)kCalUILogHandle, OS_LOG_TYPE_ERROR))
    {
      int v28 = 136315138;
      double v29 = "-[LargeMonthViewController isReadyToShowViewControllersInsideEnqueueableManagedNavigationController:isPreemptiveCheck:]";
      _os_log_impl((void *)&_mh_execute_header, v22, OS_LOG_TYPE_ERROR, "%s: Couldn't find a selected event to show details for.", (uint8_t *)&v28, 0xCu);
    }
    LOBYTE(v23) = 0;
  }

  return v23;
}

- (void)enqueuableNavigationController:(id)a3 requestsDeferShowViewControllerUntilReady:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = (void *)kCalUILogHandle;
  if (os_log_type_enabled((os_log_t)kCalUILogHandle, OS_LOG_TYPE_DEBUG))
  {
    id v9 = v8;
    id v10 = [(MainViewController *)self managedNavigationController];
    id v11 = objc_opt_class();
    id v12 = v11;
    *(_DWORD *)buf = 138412546;
    double v29 = (const char *)v11;
    __int16 v30 = 2112;
    id v31 = (id)objc_opt_class();
    id v13 = v31;
    _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEBUG, "%@ requested that %@ prepare itself to show the source view for the popover.", buf, 0x16u);
  }
  CGFloat v14 = [(MainViewController *)self model];
  double v15 = [v14 selectedOccurrence];

  if (v15)
  {
    objc_initWeak((id *)buf, self);
    v22[0] = _NSConcreteStackBlock;
    v22[1] = 3221225472;
    v22[2] = sub_10006A39C;
    v22[3] = &unk_1001D33D8;
    objc_copyWeak(&v27, (id *)buf);
    id v16 = v15;
    id v23 = v16;
    id v17 = v6;
    id v24 = v17;
    int v25 = self;
    id v26 = v7;
    CGFloat v18 = objc_retainBlock(v22);
    if ([(LargeMonthViewController *)self isReadyToShowViewControllersInsideEnqueueableManagedNavigationController:v17])
    {
      ((void (*)(void *, uint64_t))v18[2])(v18, 1);
    }
    else
    {
      CGFloat v20 = [v16 startCalendarDate];
      unsigned int v21 = [v20 date];
      [(InfiniteScrollViewController *)self showDate:v21 animated:self->_shouldAnimateScrollToVisibleWeekViewForSelectedOccurrence completionBlock:v18];
    }
    objc_destroyWeak(&v27);
    objc_destroyWeak((id *)buf);
  }
  else
  {
    double v19 = kCalUILogHandle;
    if (os_log_type_enabled((os_log_t)kCalUILogHandle, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315138;
      double v29 = "-[LargeMonthViewController enqueuableNavigationController:requestsDeferShowViewControllerUntilReady:]";
      _os_log_impl((void *)&_mh_execute_header, v19, OS_LOG_TYPE_ERROR, "%s: Couldn't find a selected event to show details for.", buf, 0xCu);
    }
    [v6 enqueueStackResetOperation];
  }
}

- (void)enqueueableManagedNavigationController:(id)a3 requestsConfigurationOfPropertiesForPopoverPresentationController:(id)a4 completion:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = (void (**)(void))a5;
  id v11 = (void *)kCalUILogHandle;
  if (os_log_type_enabled((os_log_t)kCalUILogHandle, OS_LOG_TYPE_DEBUG))
  {
    id v12 = v11;
    id v13 = [(MainViewController *)self managedNavigationController];
    CGFloat v14 = objc_opt_class();
    id v15 = v14;
    *(_DWORD *)BOOL v44 = 138412546;
    *(void *)&v44[4] = v14;
    *(_WORD *)&v44[12] = 2112;
    *(void *)&v44[14] = objc_opt_class();
    id v16 = *(id *)&v44[14];
    _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_DEBUG, "%@ requested that %@ configure the popover.", v44, 0x16u);
  }
  id v17 = [(MainViewController *)self model];
  CGFloat v18 = [v17 selectedOccurrence];

  if (v18)
  {
    double v19 = [v18 startCalendarDate];
    CGFloat v20 = [(InfiniteScrollViewController *)self subviewForDate:v19];

    if (v20)
    {
      unsigned int v21 = +[UIColor clearColor];
      double v22 = [v9 presentedViewController];
      id v23 = [v22 view];
      [v23 setBackgroundColor:v21];

      id v24 = [v9 presentedViewController];
      [v24 setModalPresentationStyle:7];

      int v25 = [(MonthViewController *)self draggedOccurrenceView];

      if (v25)
      {
        id v26 = [(MonthViewController *)self draggedOccurrenceView];
        [v26 bounds];
        [v9 setSourceRect:];

        id v27 = [(MonthViewController *)self draggedOccurrenceView];
        [v9 setSourceView:v27];
      }
      else
      {
        __int16 v30 = [v18 startCalendarDate];
        [v20 frameForOccurrence:v18 onDay:v30];
        double x = v31;
        double y = v33;
        double width = v35;
        double height = v37;

        v45.origin.double x = x;
        v45.origin.double y = y;
        v45.size.double width = width;
        v45.size.double height = height;
        if (CGRectIsNull(v45))
        {
          double x = CGRectZero.origin.x;
          double y = CGRectZero.origin.y;
          double width = CGRectZero.size.width;
          double height = CGRectZero.size.height;
        }
        else
        {
          [v20 frame];
          if (width == v39)
          {
            uint64_t v40 = [(LargeMonthViewController *)self view];
            EKUICurrentWindowSize();
            double v42 = v41;

            if (width == v42) {
              double width = width + -30.0;
            }
          }
        }
        [v9 setSourceRect:x, y, width, height];
        [v9 setSourceView:v20];
      }
      [v9 setDelegate:self];
      [v9 setPermittedArrowDirections:12];
      if (self->_tappedDay)
      {
        double v43 = [(LargeMonthViewController *)self shownEventEditViewController];

        if (!v43)
        {
          [v20 frameForDate:self->_tappedDay];
          CGRectIsNull(v46);
        }
      }
      if (v10) {
        v10[2](v10);
      }
    }
    else
    {
      double v29 = kCalUILogHandle;
      if (os_log_type_enabled((os_log_t)kCalUILogHandle, OS_LOG_TYPE_ERROR))
      {
        *(_WORD *)BOOL v44 = 0;
        _os_log_impl((void *)&_mh_execute_header, v29, OS_LOG_TYPE_ERROR, "Can't present popover from a nil event.", v44, 2u);
      }
    }
  }
  else
  {
    int v28 = kCalUILogHandle;
    if (os_log_type_enabled((os_log_t)kCalUILogHandle, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)BOOL v44 = 0;
      _os_log_impl((void *)&_mh_execute_header, v28, OS_LOG_TYPE_ERROR, "Can't present popover from a nil event.", v44, 2u);
    }
  }
}

- (int)editorShowTransition
{
  return 6;
}

- (int)editorHideTransition
{
  return 6;
}

- (void)eventViewControllerWillBeginEditingEvent:(id)a3
{
  self->_BOOL currentlyEditingEvent = 1;
  [(LargeMonthViewController *)self setNeedsUpdateOfSupportedInterfaceOrientations];
}

- (BOOL)eventViewDelegateShouldHandlePresentationOfEditViewController:(id)a3
{
  return 1;
}

- (BOOL)eventViewDelegateShouldCreateOwnEditViewController:(id)a3
{
  return 0;
}

- (void)eventViewController:(id)a3 requestsDisplayOfEditViewController:(id)a4 animated:(BOOL)a5
{
  BOOL v5 = a5;
  id v7 = a4;
  [v7 setInternalEditViewDelegate:self];
  [v7 setModalPresentationStyle:3];
  [v7 setModalTransitionStyle:2];
  id v8 = [(MainViewController *)self managedNavigationController];
  [v8 presentViewController:v7 animated:v5 completion:0];
}

- (void)eventViewController:(id)a3 didCompleteWithAction:(int64_t)a4
{
}

- (BOOL)eventViewControllerPresentationWantsHiddenNavBarForSingleController
{
  return 1;
}

- (BOOL)eventViewDelegateShouldHandlePresentationOfDeleteAlert:(id)a3
{
  return 1;
}

- (void)eventViewController:(id)a3 requestsDisplayOfDeleteAlert:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  id v8 = [v7 popoverPresentationController];
  [v8 sourceRect];
  double v10 = v9;
  double v12 = v11;
  double v14 = v13;
  double v16 = v15;
  id v17 = [v6 popoverPresentationController];
  [v17 setSourceRect:v10, v12, v14, v16];

  CGFloat v18 = [v7 popoverPresentationController];
  double v19 = [v18 sourceView];
  CGFloat v20 = [v6 popoverPresentationController];
  [v20 setSourceView:v19];

  unsigned int v21 = [v7 popoverPresentationController];

  id v22 = [v21 permittedArrowDirections];
  id v23 = [v6 popoverPresentationController];
  [v23 setPermittedArrowDirections:v22];

  id v24 = [v6 popoverPresentationController];
  [v24 setDelegate:self];

  v26[0] = _NSConcreteStackBlock;
  v26[1] = 3221225472;
  v26[2] = sub_10006ACB4;
  v26[3] = &unk_1001D28A8;
  v26[4] = self;
  id v27 = v6;
  id v25 = v6;
  [(LargeMonthViewController *)self dismissViewControllerAnimated:1 completion:v26];
}

- (void)eventEditViewController:(id)a3 didCompleteWithAction:(int64_t)a4
{
}

- (void)eventEditViewController:(id)a3 didCompleteWithAction:(int64_t)a4 completionHandler:(id)a5
{
  id v8 = a3;
  id v9 = a5;
  double v10 = v9;
  if (a4 == 1)
  {
    double v11 = [v8 calendarToMakeVisibleOnSave];
    double v12 = [v11 objectID];
    if (v12) {
      [(CUIKCalendarModel *)self->super.super.super._model ensureCalendarVisibleWithId:v12];
    }
    if ([v11 sharingStatus])
    {
      if (!v10)
      {
        v19[0] = _NSConcreteStackBlock;
        v19[1] = 3221225472;
        v19[2] = sub_10006AF98;
        v19[3] = &unk_1001D2740;
        v19[4] = self;
        double v13 = objc_retainBlock(v19);
        goto LABEL_15;
      }
      v20[0] = _NSConcreteStackBlock;
      v20[1] = 3221225472;
      v20[2] = sub_10006AF50;
      v20[3] = &unk_1001D2808;
      v20[4] = self;
      id v21 = v10;
      double v13 = objc_retainBlock(v20);
      double v14 = v21;
    }
    else
    {
      if (!v10)
      {
        double v13 = 0;
        goto LABEL_15;
      }
      v17[0] = _NSConcreteStackBlock;
      v17[1] = 3221225472;
      v17[2] = sub_10006AFA0;
      v17[3] = &unk_1001D2808;
      void v17[4] = self;
      id v18 = v10;
      double v13 = objc_retainBlock(v17);
      double v14 = v18;
    }

LABEL_15:
    goto LABEL_16;
  }
  if (v9)
  {
    v15[0] = _NSConcreteStackBlock;
    v15[1] = 3221225472;
    v15[2] = sub_10006AFB4;
    v15[3] = &unk_1001D2808;
    v15[4] = self;
    id v16 = v9;
    double v13 = objc_retainBlock(v15);
    double v11 = v16;
LABEL_16:

    goto LABEL_17;
  }
  double v13 = 0;
LABEL_17:
  [(LargeMonthViewController *)self _closeEventPresentationAnimated:1 viewController:v8 completion:v13];
  [(MonthViewController *)self removeDraggingOccurrenceAnimated:1];
  [(MonthViewController *)self removeAllWeekHighlights];
  self->_BOOL currentlyEditingEvent = 0;
}

- (id)calendarModel
{
  return self->super.super.super._model;
}

- (id)pasteboardManagerForEventEditViewController:(id)a3
{
  BOOL v3 = [(MainViewController *)self model];
  id v4 = [v3 pasteboardManager];

  return v4;
}

- (void)eventViewControllerNextButtonWasTapped:(id)a3
{
  id v4 = a3;
  BOOL v5 = [v4 event];
  id v6 = [v5 nextOccurrence];

  if (v6)
  {
    v7[0] = _NSConcreteStackBlock;
    v7[1] = 3221225472;
    v7[2] = sub_10006B104;
    v7[3] = &unk_1001D2EE0;
    v7[4] = self;
    id v8 = v6;
    id v9 = v4;
    [(LargeMonthViewController *)self _closeEventPresentationAnimated:1 viewController:0 completion:v7];
  }
}

- (void)eventViewControllerPreviousButtonWasTapped:(id)a3
{
  id v4 = a3;
  BOOL v5 = [v4 event];
  id v6 = [v5 previousOccurrence];

  if (v6)
  {
    v7[0] = _NSConcreteStackBlock;
    v7[1] = 3221225472;
    v7[2] = sub_10006B244;
    v7[3] = &unk_1001D2EE0;
    v7[4] = self;
    id v8 = v6;
    id v9 = v4;
    [(LargeMonthViewController *)self _closeEventPresentationAnimated:1 viewController:0 completion:v7];
  }
}

- (void)eventViewController:(id)a3 requestsShowEvent:(id)a4
{
  id v6 = a3;
  v9[0] = _NSConcreteStackBlock;
  v9[1] = 3221225472;
  v9[2] = sub_10006B374;
  v9[3] = &unk_1001D2EE0;
  v9[4] = self;
  id v10 = a4;
  id v11 = v6;
  id v7 = v6;
  id v8 = v10;
  [(LargeMonthViewController *)self _closeEventPresentationAnimated:1 viewController:0 completion:v9];
}

- (void)_displayedOccurrencesChanged:(id)a3
{
  id v4 = a3;
  BOOL v5 = [v4 userInfo];
  id v6 = [v5 objectForKey:CUIKCalendarModelDisplayedOccurrencesChangedRangeStartKey];

  id v7 = [v4 userInfo];

  id v8 = [v7 objectForKey:CUIKCalendarModelDisplayedOccurrencesChangedRangeEndKey];

  v11[0] = _NSConcreteStackBlock;
  v11[1] = 3221225472;
  v11[2] = sub_10006B4E8;
  v11[3] = &unk_1001D3400;
  id v12 = v6;
  id v13 = v8;
  id v9 = v8;
  id v10 = v6;
  [(InfiniteScrollViewController *)self enumerateScrollViewSubviews:v11];
}

- (void)_selectedOccurrencesChanged:(id)a3
{
  long long v31 = 0u;
  long long v32 = 0u;
  long long v33 = 0u;
  long long v34 = 0u;
  id v4 = [(NSMutableArray *)self->_weeksContainingSelectedOccurrences copy];
  id v5 = [v4 countByEnumeratingWithState:&v31 objects:v37 count:16];
  if (v5)
  {
    id v6 = v5;
    uint64_t v7 = *(void *)v32;
    do
    {
      for (uint64_t i = 0; i != v6; uint64_t i = (char *)i + 1)
      {
        if (*(void *)v32 != v7) {
          objc_enumerationMutation(v4);
        }
        id v9 = *(void **)(*((void *)&v31 + 1) + 8 * i);
        long long v27 = 0u;
        long long v28 = 0u;
        long long v29 = 0u;
        long long v30 = 0u;
        id v10 = [v9 selectedOccurrences];
        id v11 = [v10 countByEnumeratingWithState:&v27 objects:v36 count:16];
        if (v11)
        {
          id v12 = v11;
          uint64_t v13 = *(void *)v28;
          do
          {
            for (j = 0; j != v12; j = (char *)j + 1)
            {
              if (*(void *)v28 != v13) {
                objc_enumerationMutation(v10);
              }
              [(LargeMonthViewController *)self removeEventFromSelection:*(void *)(*((void *)&v27 + 1) + 8 * (void)j) inWeek:v9 updateModel:0];
            }
            id v12 = [v10 countByEnumeratingWithState:&v27 objects:v36 count:16];
          }
          while (v12);
        }
      }
      id v6 = [v4 countByEnumeratingWithState:&v31 objects:v37 count:16];
    }
    while (v6);
  }

  long long v25 = 0u;
  long long v26 = 0u;
  long long v23 = 0u;
  long long v24 = 0u;
  double v15 = [(CUIKCalendarModel *)self->super.super.super._model selectedOccurrences];
  id v16 = [v15 countByEnumeratingWithState:&v23 objects:v35 count:16];
  if (v16)
  {
    id v17 = v16;
    uint64_t v18 = *(void *)v24;
    do
    {
      for (k = 0; k != v17; k = (char *)k + 1)
      {
        if (*(void *)v24 != v18) {
          objc_enumerationMutation(v15);
        }
        CGFloat v20 = *(void **)(*((void *)&v23 + 1) + 8 * (void)k);
        id v21 = [v20 startCalendarDate];
        id v22 = [(InfiniteScrollViewController *)self subviewForDate:v21];

        [(LargeMonthViewController *)self addEventToSelection:v20 inWeek:v22 updateModel:0];
      }
      id v17 = [v15 countByEnumeratingWithState:&v23 objects:v35 count:16];
    }
    while (v17);
  }
}

- (void)contentSizeCategoryChanged
{
  +[MonthViewOccurrence clearCachedFonts];
  +[LargeMonthWeekView clearCachedFonts];
  v3.receiver = self;
  v3.super_class = (Class)LargeMonthViewController;
  [(MonthViewController *)&v3 contentSizeCategoryChanged];
}

- (void)weekNumbersPrefChanged
{
  objc_super v3 = +[CUIKPreferences sharedPreferences];
  unsigned __int8 v4 = [v3 showWeekNumbers];

  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472;
  v5[2] = sub_10006B94C;
  v5[3] = &unk_1001D3420;
  unsigned __int8 v6 = v4;
  [(InfiniteScrollViewController *)self enumerateScrollViewSubviews:v5];
}

- (void)localeChanged
{
  [(LargeMonthViewController *)self findWeekends];
  v3.receiver = self;
  v3.super_class = (Class)LargeMonthViewController;
  [(MonthViewController *)&v3 localeChanged];
}

- (BOOL)dragAndDropAllowLongPress
{
  return 1;
}

- (id)occurrenceAtPoint:(CGPoint)a3
{
  CGPoint v6 = CGPointZero;
  objc_super v3 = -[LargeMonthViewController _weekViewAtPoint:pointInWeek:](self, "_weekViewAtPoint:pointInWeek:", &v6, a3.x, a3.y);
  unsigned __int8 v4 = [v3 occurrenceAtPoint:v6];

  return v4;
}

- (BOOL)dragAndDropIsCurrentlyScrubbing
{
  v2 = [(LargeMonthViewController *)self shownEventViewController];
  BOOL v3 = v2 != 0;

  return v3;
}

- (void)draggedOccurrenceWasCancelled:(id)a3 atPoint:(CGPoint)a4
{
  double y = a4.y;
  double x = a4.x;
  if (([a3 isNew] & 1) == 0)
  {
    -[LargeMonthViewController _weekViewAtPoint:pointInWeek:](self, "_weekViewAtPoint:pointInWeek:", 0, x, y);
    id v7 = (id)objc_claimAutoreleasedReturnValue();
    [v7 reloadData];
  }
}

- (void)selectOccurrence:(id)a3 inWeek:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v8 = v7;
    if (v6)
    {
      id v9 = [(MainViewController *)self model];
      id v10 = [v9 selectedOccurrence];
      if (v10 == v6)
      {
        unsigned __int8 v11 = [(NSMutableArray *)self->_weeksContainingSelectedOccurrences containsObject:v8];

        if (v11) {
          goto LABEL_20;
        }
      }
      else
      {
      }
    }
    [(CUIKCalendarModel *)self->super.super.super._model setSelectedOccurrence:v6];
    long long v21 = 0u;
    long long v22 = 0u;
    long long v19 = 0u;
    long long v20 = 0u;
    id v12 = self->_weeksContainingSelectedOccurrences;
    id v13 = [(NSMutableArray *)v12 countByEnumeratingWithState:&v19 objects:v23 count:16];
    if (v13)
    {
      id v14 = v13;
      uint64_t v15 = *(void *)v20;
      do
      {
        for (uint64_t i = 0; i != v14; uint64_t i = (char *)i + 1)
        {
          if (*(void *)v20 != v15) {
            objc_enumerationMutation(v12);
          }
          [*(id *)(*((void *)&v19 + 1) + 8 * i) setSelectedOccurrence:0 v19];
        }
        id v14 = [(NSMutableArray *)v12 countByEnumeratingWithState:&v19 objects:v23 count:16];
      }
      while (v14);
    }

    [(NSMutableArray *)self->_weeksContainingSelectedOccurrences removeAllObjects];
    if (!self->_weeksContainingSelectedOccurrences)
    {
      id v17 = +[NSMutableArray array];
      weeksContainingSelectedOccurrences = self->_weeksContainingSelectedOccurrences;
      self->_weeksContainingSelectedOccurrences = v17;
    }
    if (v8) {
      [(NSMutableArray *)self->_weeksContainingSelectedOccurrences addObject:v8];
    }
    if (v6) {
      [v8 setSelectedOccurrence:v6];
    }
  }
  else
  {
    id v8 = 0;
  }
LABEL_20:
}

- (void)showDetailsForDraggedOccurrence:(id)a3 inWeekView:(id)a4 onDay:(id)a5 creationMethod:(unint64_t)a6
{
  id v11 = a3;
  id v9 = a4;
  id v10 = a5;
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    [(LargeMonthViewController *)self _showEventDetailsForOccurrence:v11 inWeek:v9 onDay:v10 creationMethod:1];
  }
}

- (void)showEditorForNewDraggedEvent:(id)a3 inWeek:(id)a4
{
  id v8 = a4;
  id v6 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    id v7 = v8;
  }
  else {
    id v7 = 0;
  }
  [(LargeMonthViewController *)self _showEventDetailsForOccurrence:v6 inWeek:v7 onDay:0 creationMethod:1];
}

- (void)dragAndDropRequestsPresentationOfViewController:(id)a3
{
  id v4 = a3;
  id v6 = [[UnadaptableNavigationController alloc] initWithRootViewController:v4];

  [(UnadaptableNavigationController *)v6 setModalPresentationStyle:2];
  id v5 = [(LargeMonthViewController *)self currentPresentationController];
  [v5 presentViewController:v6 animated:1 completion:0];
}

- (BOOL)isDraggingOccurrence
{
  v2 = [(MonthViewController *)self draggedOccurrenceView];
  BOOL v3 = v2 != 0;

  return v3;
}

- (id)_weekViewAtPoint:(CGPoint)a3 pointInWeek:(CGPoint *)a4
{
  uint64_t v9 = 0;
  id v10 = &v9;
  uint64_t v11 = 0x3032000000;
  id v12 = sub_100065904;
  id v13 = sub_100065914;
  id v14 = 0;
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472;
  v6[2] = sub_10006BFFC;
  v6[3] = &unk_1001D3448;
  CGPoint v7 = a3;
  v6[4] = self;
  v6[5] = &v9;
  id v8 = a4;
  [(InfiniteScrollViewController *)self enumerateScrollViewSubviews:v6];
  id v4 = (id)v10[5];
  _Block_object_dispose(&v9, 8);

  return v4;
}

- (void)handleCloseKeyCommand
{
  BOOL v3 = [(LargeMonthViewController *)self shownEventEditViewController];
  if (v3)
  {
  }
  else
  {
    id v4 = [(LargeMonthViewController *)self shownEventViewController];

    if (v4)
    {
      v5[0] = _NSConcreteStackBlock;
      v5[1] = 3221225472;
      v5[2] = sub_10006C1BC;
      v5[3] = &unk_1001D2740;
      void v5[4] = self;
      [(LargeMonthViewController *)self dismissViewControllerAnimated:1 completion:v5];
    }
  }
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_navigationBarDisplayedDate, 0);
  objc_storeStrong((id *)&self->_initialDate, 0);
  objc_storeStrong((id *)&self->_weeksContainingSelectedOccurrences, 0);
  objc_storeStrong((id *)&self->_animatableDayBackgrounds, 0);
  objc_storeStrong((id *)&self->_animatableGridLines, 0);
  objc_storeStrong((id *)&self->_weekendDayBackgrounds, 0);
  objc_storeStrong((id *)&self->_verticalGridLines, 0);
  objc_storeStrong((id *)&self->_tappedDay, 0);

  objc_storeStrong((id *)&self->_eventBeingInspected, 0);
}

@end