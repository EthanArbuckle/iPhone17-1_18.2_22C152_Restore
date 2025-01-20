@interface LargeDayViewController
- (BOOL)_allEventsHaveSameAddressWithFirstArray:(id)a3 secondArray:(id)a4;
- (BOOL)_eventEndDateIsPassed:(id)a3;
- (BOOL)_eventIntersectsDayViewControllerActiveDate:(id)a3;
- (BOOL)_eventViewControllerForModelSelectedEventIsAlreadyShown;
- (BOOL)_isTransitioningTraitCollection;
- (BOOL)_selectEvent:(id)a3 animated:(BOOL)a4 context:(int)a5;
- (BOOL)_selectEvents:(id)a3 animated:(BOOL)a4 context:(int)a5;
- (BOOL)_showsEventViewControllerAsFullScreen:(id)a3;
- (BOOL)allowChangingDate;
- (BOOL)allowsOverriddenRightNavigationBarItems;
- (BOOL)allowsOverriddenToolbarItems;
- (BOOL)comparePointersOfArray:(id)a3 withArray:(id)a4;
- (BOOL)dayViewControllerShouldEndGestureEditingOnTap:(id)a3;
- (BOOL)didSelectEvent:(id)a3 userInitiated:(BOOL)a4;
- (BOOL)didSelectEvents:(id)a3 userInitiated:(BOOL)a4;
- (BOOL)enqueueableManagedNavigationControllerShouldEnqueuePresentationDismissals:(id)a3;
- (BOOL)eventViewControllerEditButtonTemporarilyDisabled:(id)a3;
- (BOOL)eventViewControllerPresentationWantsHiddenNavBarForSingleController;
- (BOOL)eventViewControllerShouldHideDeleteButton;
- (BOOL)eventViewControllerShowsInlinePreview;
- (BOOL)eventViewDelegateShouldCreateOwnEditViewController:(id)a3;
- (BOOL)eventViewDelegateShouldHandlePresentationOfDeleteAlert:(id)a3;
- (BOOL)eventViewDelegateShouldHandlePresentationOfEditViewController:(id)a3;
- (BOOL)mainViewControllerCanChangeSelectedDate;
- (BOOL)mainViewControllerCanChangeSelectedEvent;
- (BOOL)performModalDialogsIfNeededWithContinue:(id)a3;
- (BOOL)requiresSelfAsEventEditorDelegate;
- (BOOL)selectedEventWasAutoSelected;
- (BOOL)shouldAdaptEventViewControllers;
- (BOOL)shouldAlwaysPresentDeleteAlertsAsSheet;
- (BOOL)shouldHandleGestureCommits;
- (BOOL)shouldInvalidateManagedNavigationControllerOnPresentationDismissal;
- (BOOL)shouldJournalMainViewControllerParent;
- (BOOL)shouldModallyPresentFirstShownViewController;
- (BOOL)showDetachAlertOnDraggingGestureEnd;
- (BOOL)showEventDetailsWhenNewEventAdded;
- (BOOL)showWeekdayLabel;
- (BOOL)usePortraitLayoutForSize:(CGSize)a3;
- (Class)managedNavigationControllerType;
- (EKEvent)modelSelectedEvent;
- (LargeDayViewController)initWithDay:(id)a3 model:(id)a4 window:(id)a5;
- (NSArray)modelSelectedEvents;
- (double)_dayViewWidthWhenSplit;
- (double)_splitViewWidth;
- (double)_totalWidth;
- (double)detailsLeftInsetAdjustment;
- (double)detailsRightInsetAdjustment;
- (double)rightSplitViewSideInset;
- (double)splitterSpace;
- (id)_clonedViewForSelectedOccurrence:(id)a3;
- (id)_fallbackSizingContextWindow;
- (id)_selectedOccurrenceView;
- (id)calendarModel;
- (id)cellFactory;
- (id)managedNavigationController;
- (id)overrideCellColor;
- (id)selectedCopyViewForOccurrenceView:(id)a3;
- (id)showDetailViewControllerForEvent:(id)a3 context:(id)a4 animated:(BOOL)a5;
- (id)showDetailViewControllerForEvents:(id)a3 animated:(BOOL)a4;
- (id)shownEventEditViewController;
- (int)editorHideTransition;
- (int)editorShowTransition;
- (int64_t)intendedSizeClass;
- (int64_t)orientationForSize:(CGSize)a3;
- (int64_t)presentationStyleOverrideForChildViewControllers;
- (int64_t)viewInterfaceOrientation;
- (unint64_t)supportedInterfaceOrientations;
- (void)_adjustSelectedOccurrences;
- (void)_autoSelectEventWithAnimatedScroll:(BOOL)a3;
- (void)_beginAutoScrollingAutoSelectingWithContext:(int)a3;
- (void)_clearSplitViewNavigationController;
- (void)_configureSidebarConfigurationOfManagedNavigationController;
- (void)_createSplitView;
- (void)_customizeEventEditorForSplitViewAppearance:(id)a3;
- (void)_dismissEditorAndSaveIfPossibleWhileChangingDate:(BOOL)a3 animated:(BOOL)a4;
- (void)_editingDidCompleteWithAction:(int64_t)a3 changingDate:(BOOL)a4 dismissEditor:(BOOL)a5 editorToDismiss:(id)a6;
- (void)_eventStoreChanged:(id)a3;
- (void)_layOutSplitDividerFrame;
- (void)_layoutDayArea;
- (void)_layoutDayViewPane;
- (void)_layoutEventDetailsPane;
- (void)_layoutForSplitViews;
- (void)_occurrenceViewDidEndSelection:(id)a3;
- (void)_reselectedEventIfNeeded;
- (void)_resetSplitView;
- (void)_selectNextEventInForwardDirection:(BOOL)a3;
- (void)_selectedDateChangedToDate:(id)a3;
- (void)_selectedOccurrencesChanged:(id)a3;
- (void)_setDayViewToSplitViewVisibleState;
- (void)_setModal:(BOOL)a3;
- (void)_setSplitViewPosition;
- (void)_setUpCustomAppearances;
- (void)_setUpGesturesAndModalMode;
- (void)_showEventsWithoutChangingDate:(id)a3 animated:(BOOL)a4 showComments:(BOOL)a5 context:(id)a6;
- (void)_showNextDateComponentUnitInForwardDirection:(BOOL)a3 animated:(BOOL)a4;
- (void)_splitViewNavigationController:(id)a3 willShowViewController:(id)a4 animated:(BOOL)a5 completion:(id)a6;
- (void)_teardownSidebarConfigurationOfManagedNavigationController;
- (void)asyncLoadAndLayoutCompleted;
- (void)beganHorizontalDeceleration;
- (void)clearNoContentConfiguration;
- (void)dataReloadedWithTrigger:(int)a3;
- (void)dayViewDidChangeSelectedDate:(id)a3;
- (void)dealloc;
- (void)didBeginMovingOccurrenceWithGesture;
- (void)didShowEventWithoutShowingDetails:(id)a3;
- (void)displayedOccurrencesChangedWithTrigger:(int)a3;
- (void)endedHorizontalDeceleration;
- (void)eventEditViewController:(id)a3 didCompleteWithAction:(int64_t)a4;
- (void)eventEditViewController:(id)a3 didCompleteWithAction:(int64_t)a4 completionHandler:(id)a5;
- (void)eventViewController:(id)a3 didCompleteWithAction:(int64_t)a4;
- (void)eventViewController:(id)a3 requestsDisplayOfDeleteAlert:(id)a4;
- (void)eventViewController:(id)a3 requestsDisplayOfEditViewController:(id)a4 animated:(BOOL)a5;
- (void)eventViewControllerDidBeginEditingEventWithEditViewController:(id)a3;
- (void)eventViewControllerDidReceiveEditUserInteraction:(id)a3;
- (void)eventViewControllerModifiedEventWithoutEditing:(id)a3;
- (void)eventViewControllerWillBeginEditingEvent:(id)a3;
- (void)eventViewControllerWillFinishEditingEvent:(id)a3 deleted:(BOOL)a4;
- (void)finishedPinchingDayView;
- (void)handleCloseKeyCommand;
- (void)handleGestureCommittingOccurrence:(id)a3;
- (void)isPinchingDayView;
- (void)loadView;
- (void)navigateToNextDateComponentUnitAnimated:(BOOL)a3;
- (void)navigateToNextSelectableItem;
- (void)navigateToPreviousDateComponentUnitAnimated:(BOOL)a3;
- (void)navigateToPreviousSelectableItem;
- (void)navigationController:(id)a3 willShowViewController:(id)a4 animated:(BOOL)a5;
- (void)scrubberDidChangeSelectedDate:(id)a3;
- (void)setModelSelectedEvent:(id)a3;
- (void)setModelSelectedEvents:(id)a3;
- (void)setupUIForTraitCollection:(id)a3;
- (void)showEditViewController:(id)a3;
- (void)showEvent:(id)a3 animated:(BOOL)a4 showMode:(unint64_t)a5 context:(id)a6;
- (void)showEvents:(id)a3 animated:(BOOL)a4 showMode:(unint64_t)a5 context:(id)a6;
- (void)showNextOccurrenceOfSelectableItem;
- (void)showPreviousOccurrenceOfSelectableItem;
- (void)showReminderDetail:(id)a3;
- (void)showViewController:(id)a3 sender:(id)a4 animated:(BOOL)a5 completion:(id)a6;
- (void)updateNavigationBarDisplayedDateString;
- (void)updateNavigationBarDisplayedDateStringWithDate:(id)a3;
- (void)updateNoContentConfiguration;
- (void)updatePalette:(id)a3;
- (void)viewDidAppear:(BOOL)a3;
- (void)viewDidDisappear:(BOOL)a3;
- (void)viewDidLayoutSubviews;
- (void)viewDidLoad;
- (void)viewWillAppear:(BOOL)a3;
- (void)viewWillDisappear:(BOOL)a3;
- (void)viewWillLayoutSubviews;
- (void)viewWillTransitionToSize:(CGSize)a3 withTransitionCoordinator:(id)a4;
- (void)wasAllowedToChangeDate;
- (void)wasBlockedFromChangingDate:(id)a3;
@end

@implementation LargeDayViewController

- (LargeDayViewController)initWithDay:(id)a3 model:(id)a4 window:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  v21.receiver = self;
  v21.super_class = (Class)LargeDayViewController;
  v11 = [(DayViewController *)&v21 initWithDay:v8 model:v9 window:v10];
  v12 = v11;
  if (v11)
  {
    v13 = [(DayViewController *)v11 dayView];
    [v13 setGutterWidth:0.0];

    v14 = +[NSNotificationCenter defaultCenter];
    [v14 addObserver:v12 selector:"_occurrenceViewDidEndSelection:" name:EKDayOccurrenceViewDidEndSelectionNotification object:0];

    objc_initWeak(&location, v12);
    uint64_t v22 = objc_opt_class();
    v15 = +[NSArray arrayWithObjects:&v22 count:1];
    v18[0] = _NSConcreteStackBlock;
    v18[1] = 3221225472;
    v18[2] = sub_1000E3A44;
    v18[3] = &unk_1001D2620;
    objc_copyWeak(&v19, &location);
    id v16 = [(LargeDayViewController *)v12 registerForTraitChanges:v15 withHandler:v18];

    objc_destroyWeak(&v19);
    objc_destroyWeak(&location);
  }

  return v12;
}

- (void)viewWillTransitionToSize:(CGSize)a3 withTransitionCoordinator:(id)a4
{
  double height = a3.height;
  double width = a3.width;
  id v7 = a4;
  if ([(LargeDayViewController *)self isViewLoaded])
  {
    id v8 = [(LargeDayViewController *)self view];
    id v9 = [v8 window];

    if (v9)
    {
      if (EKUIIsSizeExtended())
      {
        id v10 = [(DayViewController *)self dayScrubberController];
        v11 = [v10 view];
        unsigned __int8 v12 = [v11 preservesSuperviewLayoutMargins];

        if ((v12 & 1) == 0)
        {
          v13 = [(DayViewController *)self dayScrubberController];
          v14 = [v13 view];
          [v14 setPreservesSuperviewLayoutMargins:1];

          v15 = [(DayViewController *)self dayScrubberController];
          id v16 = [v15 view];
          [v16 setNeedsLayout];
        }
      }
      v17.receiver = self;
      v17.super_class = (Class)LargeDayViewController;
      -[DayViewController viewWillTransitionToSize:withTransitionCoordinator:](&v17, "viewWillTransitionToSize:withTransitionCoordinator:", v7, width, height);
    }
  }
}

- (void)dealloc
{
  v3 = +[NSNotificationCenter defaultCenter];
  [v3 removeObserver:self name:EKDayOccurrenceViewDidEndSelectionNotification object:0];

  v4.receiver = self;
  v4.super_class = (Class)LargeDayViewController;
  [(DayViewController *)&v4 dealloc];
}

- (void)loadView
{
  v4.receiver = self;
  v4.super_class = (Class)LargeDayViewController;
  [(DayViewController *)&v4 loadView];
  v3 = [(DayViewController *)self dayView];
  [v3 setShouldAutoscrollAfterAppearance:0];
}

- (BOOL)_isTransitioningTraitCollection
{
  v3 = [(LargeDayViewController *)self navigationController];
  if (objc_opt_respondsToSelector())
  {
    objc_super v4 = [(LargeDayViewController *)self navigationController];
    BOOL v5 = [v4 performSelector:"isTransitioningTraitCollection"] != 0;
  }
  else
  {
    BOOL v5 = 0;
  }

  return v5;
}

- (NSArray)modelSelectedEvents
{
  v2 = [(MainViewController *)self model];
  v3 = [v2 selectedOccurrences];

  return (NSArray *)v3;
}

- (EKEvent)modelSelectedEvent
{
  v2 = [(MainViewController *)self model];
  v3 = [v2 selectedOccurrences];
  objc_super v4 = [v3 firstObject];

  return (EKEvent *)v4;
}

- (void)setModelSelectedEvent:(id)a3
{
  id v8 = a3;
  objc_super v4 = [(MainViewController *)self model];
  id v5 = [v4 selectedOccurrence];

  if (v5 == v8) {
    id v6 = 0;
  }
  else {
    id v6 = [v5 isEqual:v8];
  }
  id v7 = [(MainViewController *)self model];
  [v7 setSelectedOccurrence:v8 forceChange:v6];

  if (!v8) {
    *(&self->super._shouldRespondToApplicationDidBecomeActiveStateChange + 3) = 0;
  }
}

- (BOOL)_allEventsHaveSameAddressWithFirstArray:(id)a3 secondArray:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  Mutable = CFSetCreateMutable(0, 0, 0);
  long long v26 = 0u;
  long long v27 = 0u;
  long long v28 = 0u;
  long long v29 = 0u;
  id v8 = v5;
  id v9 = [v8 countByEnumeratingWithState:&v26 objects:v31 count:16];
  if (v9)
  {
    id v10 = v9;
    uint64_t v11 = *(void *)v27;
    do
    {
      for (i = 0; i != v10; i = (char *)i + 1)
      {
        if (*(void *)v27 != v11) {
          objc_enumerationMutation(v8);
        }
        CFSetAddValue(Mutable, *(const void **)(*((void *)&v26 + 1) + 8 * i));
      }
      id v10 = [v8 countByEnumeratingWithState:&v26 objects:v31 count:16];
    }
    while (v10);
  }

  v13 = CFSetCreateMutable(0, 0, 0);
  long long v22 = 0u;
  long long v23 = 0u;
  long long v24 = 0u;
  long long v25 = 0u;
  id v14 = v6;
  id v15 = [v14 countByEnumeratingWithState:&v22 objects:v30 count:16];
  if (v15)
  {
    id v16 = v15;
    uint64_t v17 = *(void *)v23;
    do
    {
      for (j = 0; j != v16; j = (char *)j + 1)
      {
        if (*(void *)v23 != v17) {
          objc_enumerationMutation(v14);
        }
        CFSetAddValue(v13, *(const void **)(*((void *)&v22 + 1) + 8 * (void)j));
      }
      id v16 = [v14 countByEnumeratingWithState:&v22 objects:v30 count:16];
    }
    while (v16);
  }

  CFIndex Count = CFSetGetCount(Mutable);
  if (Count == CFSetGetCount(v13)) {
    unsigned __int8 v20 = -[__CFSet isEqual:](Mutable, "isEqual:", v13, (void)v22);
  }
  else {
    unsigned __int8 v20 = 0;
  }
  CFRelease(Mutable);
  CFRelease(v13);

  return v20;
}

- (void)setModelSelectedEvents:(id)a3
{
  id v13 = a3;
  objc_super v4 = [(MainViewController *)self model];
  id v5 = [v4 selectedOccurrences];
  unsigned __int8 v6 = [(LargeDayViewController *)self _allEventsHaveSameAddressWithFirstArray:v5 secondArray:v13];

  if (v6)
  {
    id v7 = 0;
  }
  else
  {
    id v8 = [(MainViewController *)self model];
    id v9 = [v8 selectedOccurrences];
    id v10 = +[NSSet setWithArray:v9];
    uint64_t v11 = +[NSSet setWithArray:v13];
    id v7 = [v10 isEqualToSet:v11];
  }
  unsigned __int8 v12 = [(MainViewController *)self model];
  [v12 setSelectedOccurrences:v13 forceChange:v7];

  if (!v13) {
    *(&self->super._shouldRespondToApplicationDidBecomeActiveStateChange + 3) = 0;
  }
}

- (BOOL)selectedEventWasAutoSelected
{
  return *(&self->super._shouldRespondToApplicationDidBecomeActiveStateChange + 3);
}

- (int)editorShowTransition
{
  return 6;
}

- (int)editorHideTransition
{
  return 6;
}

- (id)cellFactory
{
  v2 = objc_opt_new();

  return v2;
}

- (BOOL)showWeekdayLabel
{
  return 0;
}

- (BOOL)allowChangingDate
{
  v3 = [(LargeDayViewController *)self shownEventEditViewController];
  unsigned __int8 v4 = [v3 willPresentDialogOnSave];

  if (v4) {
    return 0;
  }
  v6.receiver = self;
  v6.super_class = (Class)LargeDayViewController;
  return [(DayViewController *)&v6 allowChangingDate];
}

- (void)wasAllowedToChangeDate
{
  id v2 = [(LargeDayViewController *)self shownEventEditViewController];
  [v2 completeAndSaveWithContinueBlock:0];
}

- (void)wasBlockedFromChangingDate:(id)a3
{
  id v7 = a3;
  unsigned __int8 v4 = [(LargeDayViewController *)self shownEventEditViewController];
  unsigned int v5 = [v4 willPresentDialogOnSave];

  if (v5)
  {
    objc_super v6 = [(LargeDayViewController *)self shownEventEditViewController];
    [v6 completeAndSaveWithContinueBlock:v7];
  }
}

- (void)isPinchingDayView
{
  v3 = [(DayViewController *)self _selectedOccurrenceFrontmostClonedViews];
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  id v4 = [v3 countByEnumeratingWithState:&v11 objects:v15 count:16];
  if (v4)
  {
    id v5 = v4;
    uint64_t v6 = *(void *)v12;
    do
    {
      id v7 = 0;
      do
      {
        if (*(void *)v12 != v6) {
          objc_enumerationMutation(v3);
        }
        [*(id *)(*((void *)&v11 + 1) + 8 * (void)v7) setReduceLayoutProcessingForAnimation:1];
        id v7 = (char *)v7 + 1;
      }
      while (v5 != v7);
      id v5 = [v3 countByEnumeratingWithState:&v11 objects:v15 count:16];
    }
    while (v5);
  }
  id v8 = [(DayViewController *)self dayView];
  id v9 = [v8 currentDayView];
  id v10 = [v9 dayContent];
  [v10 layoutIfNeeded];

  [(LargeDayViewController *)self _adjustSelectedOccurrences];
}

- (void)finishedPinchingDayView
{
  v3 = [(MainViewController *)self model];
  id v4 = [v3 selectedOccurrences];
  [(DayViewController *)self _setUpSelectedOccurrenceViewsWithEvents:v4 animated:0 autoScroll:1 resetSelection:1];

  [(LargeDayViewController *)self _adjustSelectedOccurrences];
}

- (void)_adjustSelectedOccurrences
{
  long long v9 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  id v2 = [(DayViewController *)self _selectedOccurrenceViews];
  id v3 = [v2 countByEnumeratingWithState:&v9 objects:v13 count:16];
  if (v3)
  {
    id v4 = v3;
    uint64_t v5 = *(void *)v10;
    do
    {
      for (i = 0; i != v4; i = (char *)i + 1)
      {
        if (*(void *)v10 != v5) {
          objc_enumerationMutation(v2);
        }
        id v7 = *(void **)(*((void *)&v9 + 1) + 8 * i);
        id v8 = [v7 selectedCopy];
        [v7 frame];
        [v8 setFrame:];
        [v7 travelTimeSubviewHeightInPoints];
        [v8 setTravelTimeSubviewHeightInPoints:];
        [v7 bottomPinningProximity];
        [v8 setBottomPinningProximity:];
        [v7 topPinningProximity];
        [v8 setTopPinningProximity];
        [v8 requestContentIfNeeded:16 completion:0];
      }
      id v4 = [v2 countByEnumeratingWithState:&v9 objects:v13 count:16];
    }
    while (v4);
  }
}

- (BOOL)shouldModallyPresentFirstShownViewController
{
  return 0;
}

- (BOOL)_eventViewControllerForModelSelectedEventIsAlreadyShown
{
  id v3 = [(LargeDayViewController *)self modelSelectedEvents];
  id v4 = [(MainViewController *)self shownEventViewController];
  uint64_t v5 = [v4 event];

  uint64_t v6 = [(MainViewController *)self shownExpandedReminderStackViewController];
  id v7 = [v6 events];

  if ([v3 count] == (id)1)
  {
    id v8 = [v3 firstObject];
    unsigned int v9 = [v5 isEqual:v8];
  }
  else
  {
    unsigned int v9 = 0;
  }
  long long v10 = +[NSSet setWithArray:v3];
  long long v11 = +[NSSet setWithArray:v7];
  unsigned int v12 = [v10 isEqualToSet:v11];

  if (v3 && v9 | v12 && !self->_changingDate)
  {
    LOBYTE(v16) = 1;
  }
  else
  {
    long long v13 = [(LargeDayViewController *)self managedNavigationController];
    long long v14 = [v13 enqueuedViewControllers];

    long long v29 = 0u;
    long long v30 = 0u;
    long long v27 = 0u;
    long long v28 = 0u;
    id v15 = v14;
    id v16 = [v15 countByEnumeratingWithState:&v27 objects:v31 count:16];
    if (v16)
    {
      long long v25 = v7;
      long long v26 = v5;
      uint64_t v17 = *(void *)v28;
      while (2)
      {
        for (i = 0; i != v16; i = (char *)i + 1)
        {
          if (*(void *)v28 != v17) {
            objc_enumerationMutation(v15);
          }
          id v19 = *(void **)(*((void *)&v27 + 1) + 8 * i);
          objc_opt_class();
          if (objc_opt_isKindOfClass())
          {
            id v20 = v19;
            objc_super v21 = [v20 event];
            if ([v3 count] == (id)1)
            {
              long long v22 = [v3 firstObject];
              unsigned int v23 = [v21 isEqual:v22];

              if (v23)
              {

                LOBYTE(v16) = 1;
                goto LABEL_20;
              }
            }
          }
        }
        id v16 = [v15 countByEnumeratingWithState:&v27 objects:v31 count:16];
        if (v16) {
          continue;
        }
        break;
      }
LABEL_20:
      id v7 = v25;
      uint64_t v5 = v26;
    }
  }
  return (char)v16;
}

- (void)showViewController:(id)a3 sender:(id)a4 animated:(BOOL)a5 completion:(id)a6
{
  BOOL v7 = a5;
  id v10 = a3;
  id v11 = a4;
  id v12 = a6;
  long long v13 = [(MainViewController *)self shownEventViewController];

  long long v14 = [(LargeDayViewController *)self managedNavigationController];
  id v15 = [v14 topViewController];
  id v16 = [(MainViewController *)self shownExpandedReminderStackViewController];

  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0 && v15 != v16)
  {
    uint64_t v17 = (void *)kCalUILogHandle;
    if (os_log_type_enabled((os_log_t)kCalUILogHandle, OS_LOG_TYPE_DEBUG))
    {
      v18 = v17;
      id v19 = [v10 event];
      id v20 = [v19 title];
      *(_DWORD *)buf = 136315394;
      v59 = "-[LargeDayViewController showViewController:sender:animated:completion:]";
      __int16 v60 = 2112;
      v61 = v20;
      _os_log_impl((void *)&_mh_execute_header, v18, OS_LOG_TYPE_DEBUG, "%s: Asked to show a view controller for event %@. Clearing sidebar nav stack first.", buf, 0x16u);
    }
    objc_super v21 = [(LargeDayViewController *)self presentedViewController];
    if (v21)
    {
      long long v22 = [(LargeDayViewController *)self presentedViewController];
      objc_opt_class();
      char isKindOfClass = objc_opt_isKindOfClass();
    }
    else
    {
      char isKindOfClass = 0;
    }

    long long v24 = [(LargeDayViewController *)self managedNavigationController];
    [v24 enqueueStackResetOperationDismissingPresentations:isKindOfClass & 1 cancelOperations:0 completionBlock:0];
  }
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    long long v25 = [(LargeDayViewController *)self view];
    if (EKUICurrentWindowInterfaceParadigm_RequiresPageSheetEventEditors())
    {
      long long v26 = +[UIDevice currentDevice];
      BOOL v27 = [v26 userInterfaceIdiom] == (id)1;

      if (!v27)
      {
        id v28 = [objc_alloc((Class)EKUIManagedNavigationController) initWithRootViewController:v10];
        [v28 setModalPresentationDelegate:self];
        [v28 setForceCanBeDirectlyManagedToNo:1];
        objc_initWeak((id *)buf, v28);
        objc_initWeak(&location, self);
        id v29 = objc_alloc((Class)UIBarButtonItem);
        v54[0] = _NSConcreteStackBlock;
        v54[1] = 3221225472;
        v54[2] = sub_1000E4F8C;
        v54[3] = &unk_1001D5108;
        objc_copyWeak(&v55, &location);
        objc_copyWeak(&v56, (id *)buf);
        long long v30 = +[UIAction actionWithTitle:&stru_1001D6918 image:0 identifier:0 handler:v54];
        id v31 = [v29 initWithBarButtonSystemItem:0 primaryAction:v30];

        v32 = [v10 navigationItem];
        [v32 setLeftBarButtonItem:v31];

        v33 = [(LargeDayViewController *)self navigationController];
        [v33 presentAdaptiveModalViewController:v28 animated:1 completion:0];

        objc_destroyWeak(&v56);
        objc_destroyWeak(&v55);
        objc_destroyWeak(&location);
        objc_destroyWeak((id *)buf);
        goto LABEL_26;
      }
    }
    else
    {
    }
  }
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    [v10 setPreferModalPresentation:0];
  }
  [(LargeDayViewController *)self _fallbackSizingContextWindow];
  BOOL v34 = v13 == 0;
  id v28 = (id)objc_claimAutoreleasedReturnValue();
  if (v28)
  {
    EKUIPushFallbackSizingContextWithViewHierarchy();
    v53.receiver = self;
    v53.super_class = (Class)LargeDayViewController;
    [(MainViewController *)&v53 showViewController:v10 sender:v11 animated:v7 completion:v12];
    v35 = [(LargeDayViewController *)self viewControllerToShowFrom];
    [(LargeDayViewController *)self _splitViewNavigationController:v35 willShowViewController:v10 animated:v34 completion:0];

    EKUIPopFallbackSizingContextWithViewHierarchy();
  }
  else
  {
    v53.receiver = self;
    v53.super_class = (Class)LargeDayViewController;
    [(MainViewController *)&v53 showViewController:v10 sender:v11 animated:v7 completion:v12];
    v36 = [(LargeDayViewController *)self viewControllerToShowFrom];
    [(LargeDayViewController *)self _splitViewNavigationController:v36 willShowViewController:v10 animated:v34 completion:0];
  }
  if ([v10 conformsToProtocol:&OBJC_PROTOCOL___EKEventOrIntegrationEditView])
  {
    v37 = [(LargeDayViewController *)self view];
    BOOL v38 = EKUICurrentWindowInterfaceParadigm_RequiresPageSheetEventEditors();

    if (!v38)
    {
      id v39 = v10;
      v40 = [v39 event];
      v41 = [(MainViewController *)self model];
      v42 = [v41 selectedOccurrence];
      BOOL v43 = v42 == v40;

      if (v43) {
        goto LABEL_23;
      }
      v44 = [(MainViewController *)self model];
      [v44 setSelectedOccurrence:v40];

      v45 = [(MainViewController *)self model];
      v46 = [v45 selectedOccurrence];
      BOOL v47 = v46 == v40;

      if (v47)
      {
LABEL_23:
        v48 = [(DayViewController *)self gestureController];
        v49 = [v48 draggingView];
        v50 = [v49 occurrence];
        BOOL v51 = v50 == v40;

        if (!v51) {
          [(LargeDayViewController *)self _setUpGesturesAndModalMode];
        }
      }
      v52 = [(DayViewController *)self dayView];
      [v52 setCurrentEditor:v39];
    }
  }
LABEL_26:
}

- (id)showDetailViewControllerForEvent:(id)a3 context:(id)a4 animated:(BOOL)a5
{
  BOOL v5 = a5;
  id v8 = a3;
  id v9 = a4;
  if (-[LargeDayViewController _eventViewControllerForModelSelectedEventIsAlreadyShown](self, "_eventViewControllerForModelSelectedEventIsAlreadyShown")&& ([v8 isReminderIntegrationEvent] & 1) == 0)
  {
    v18 = (void *)kCalUILogHandle;
    if (os_log_type_enabled((os_log_t)kCalUILogHandle, OS_LOG_TYPE_ERROR))
    {
      id v19 = v18;
      id v20 = [(LargeDayViewController *)self modelSelectedEvent];
      objc_super v21 = [v20 title];
      int v34 = 136315394;
      v35 = "-[LargeDayViewController showDetailViewControllerForEvent:context:animated:]";
      __int16 v36 = 2112;
      v37 = v21;
      _os_log_impl((void *)&_mh_execute_header, v19, OS_LOG_TYPE_ERROR, "%s: Asked to show a view controller for event %@, but it is already on the managed navigation controller.", (uint8_t *)&v34, 0x16u);
    }
    id v11 = 0;
  }
  else
  {
    id v10 = [(MainViewController *)self augmentEventDetailsContext:v9];
    id v11 = +[EKEventViewController eventDetailViewControllerWithEvent:v8 delegate:self context:v10 allowInlinePreview:0 previewInline:0 minimalMode:0];
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      [v11 setIsLargeDayView:1];
    }
    id v12 = [(LargeDayViewController *)self managedNavigationController];
    long long v13 = [v12 topViewController];
    long long v14 = [(MainViewController *)self shownExpandedReminderStackViewController];

    if (v13 != v14)
    {
      id v15 = [(LargeDayViewController *)self presentedViewController];
      if (v15)
      {
        id v16 = [(LargeDayViewController *)self presentedViewController];
        objc_opt_class();
        char isKindOfClass = objc_opt_isKindOfClass();
      }
      else
      {
        char isKindOfClass = 0;
      }

      long long v22 = [(LargeDayViewController *)self managedNavigationController];
      [v22 enqueueStackResetOperationDismissingPresentations:isKindOfClass & 1 cancelOperations:0 completionBlock:0];
    }
    [(LargeDayViewController *)self showViewController:v11 sender:self animated:v5 completion:0];
    [*(id *)((char *)&self->_lastEventShowed + 2) bounds];
    double v24 = v23;
    double v26 = v25;
    double v28 = v27;
    double v30 = v29;
    id v31 = [v11 view];
    [v31 setFrame:v24, v26, v28, v30];

    v32 = [v11 view];
    [v32 setAutoresizingMask:18];
  }

  return v11;
}

- (id)showDetailViewControllerForEvents:(id)a3 animated:(BOOL)a4
{
  id v5 = a3;
  if ([(LargeDayViewController *)self _eventViewControllerForModelSelectedEventIsAlreadyShown])
  {
    uint64_t v6 = (void *)kCalUILogHandle;
    if (os_log_type_enabled((os_log_t)kCalUILogHandle, OS_LOG_TYPE_ERROR))
    {
      BOOL v7 = v6;
      id v8 = [(LargeDayViewController *)self modelSelectedEvent];
      id v9 = [v8 title];
      int v26 = 136315394;
      double v27 = "-[LargeDayViewController showDetailViewControllerForEvents:animated:]";
      __int16 v28 = 2112;
      double v29 = v9;
      _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_ERROR, "%s: Asked to show a view controller for event %@, but it is already on the managed navigation controller.", (uint8_t *)&v26, 0x16u);
    }
    id v10 = 0;
  }
  else
  {
    id v10 = [objc_alloc((Class)EKExpandedReminderStackViewController) initWithEvents:v5 delegate:self];
    id v11 = [(LargeDayViewController *)self presentedViewController];
    if (v11)
    {
      id v12 = [(LargeDayViewController *)self presentedViewController];
      objc_opt_class();
      char isKindOfClass = objc_opt_isKindOfClass();
    }
    else
    {
      char isKindOfClass = 0;
    }

    long long v14 = [(LargeDayViewController *)self managedNavigationController];
    [v14 enqueueStackResetOperationDismissingPresentations:isKindOfClass & 1 cancelOperations:0 completionBlock:0];

    [(LargeDayViewController *)self showViewController:v10 sender:self animated:0 completion:0];
    [*(id *)((char *)&self->_lastEventShowed + 2) bounds];
    double v16 = v15;
    double v18 = v17;
    double v20 = v19;
    double v22 = v21;
    double v23 = [v10 view];
    [v23 setFrame:v16, v18, v20, v22];

    double v24 = [v10 view];
    [v24 setAutoresizingMask:18];
  }

  return v10;
}

- (BOOL)dayViewControllerShouldEndGestureEditingOnTap:(id)a3
{
  id v4 = [(LargeDayViewController *)self shownEventEditViewController];
  if (v4)
  {
    id v5 = [(LargeDayViewController *)self shownEventEditViewController];
    unsigned __int8 v6 = [v5 willPresentDialogOnSave];

    char v7 = v6 ^ 1;
  }
  else
  {
    char v7 = 1;
  }

  return v7;
}

- (void)beganHorizontalDeceleration
{
  self->_userSelectedEmptySpace = 1;
}

- (void)endedHorizontalDeceleration
{
  self->_userSelectedEmptySpace = 0;
  if (self->_selectedEventWasAutoSelected)
  {
    self->_selectedEventWasAutoSelected = 0;
    [(LargeDayViewController *)self _autoSelectEventWithAnimatedScroll:1];
  }
}

- (void)asyncLoadAndLayoutCompleted
{
  [(LargeDayViewController *)self _adjustSelectedOccurrences];
  id v3 = [(DayViewController *)self _selectedOccurrenceFrontmostClonedViews];
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  id v4 = [v3 countByEnumeratingWithState:&v10 objects:v14 count:16];
  if (v4)
  {
    id v5 = v4;
    uint64_t v6 = *(void *)v11;
    do
    {
      for (i = 0; i != v5; i = (char *)i + 1)
      {
        if (*(void *)v11 != v6) {
          objc_enumerationMutation(v3);
        }
        id v8 = *(void **)(*((void *)&v10 + 1) + 8 * i);
        id v9 = [v8 superview];
        [v9 bringSubviewToFront:v8];
      }
      id v5 = [v3 countByEnumeratingWithState:&v10 objects:v14 count:16];
    }
    while (v5);
  }
}

- (id)selectedCopyViewForOccurrenceView:(id)a3
{
  id v4 = a3;
  uint64_t v23 = 0;
  double v24 = &v23;
  uint64_t v25 = 0x2020000000;
  char v26 = 0;
  id v5 = [(DayViewController *)self _selectedOccurrenceViews];
  v20[0] = _NSConcreteStackBlock;
  v20[1] = 3221225472;
  v20[2] = sub_1000E5984;
  v20[3] = &unk_1001D5130;
  double v22 = &v23;
  id v6 = v4;
  id v21 = v6;
  [v5 enumerateObjectsUsingBlock:v20];

  if (*((unsigned char *)v24 + 24))
  {
    id v7 = 0;
  }
  else
  {
    [(DayViewController *)self _selectedOccurrenceFrontmostClonedViews];
    long long v18 = 0u;
    long long v19 = 0u;
    long long v16 = 0u;
    long long v17 = 0u;
    id v8 = (id)objc_claimAutoreleasedReturnValue();
    id v7 = [v8 countByEnumeratingWithState:&v16 objects:v27 count:16];
    if (v7)
    {
      uint64_t v9 = *(void *)v17;
      while (2)
      {
        for (i = 0; i != v7; i = (char *)i + 1)
        {
          if (*(void *)v17 != v9) {
            objc_enumerationMutation(v8);
          }
          long long v11 = *(void **)(*((void *)&v16 + 1) + 8 * i);
          long long v12 = [v6 occurrence:v16];
          long long v13 = [v11 occurrence];
          unsigned __int8 v14 = [v12 isEqual:v13];

          if (v14)
          {
            id v7 = v11;
            goto LABEL_13;
          }
        }
        id v7 = [v8 countByEnumeratingWithState:&v16 objects:v27 count:16];
        if (v7) {
          continue;
        }
        break;
      }
    }
LABEL_13:
  }
  _Block_object_dispose(&v23, 8);

  return v7;
}

- (void)viewDidLoad
{
  v6.receiver = self;
  v6.super_class = (Class)LargeDayViewController;
  [(DayViewController *)&v6 viewDidLoad];
  [(LargeDayViewController *)self _createSplitView];
  id v3 = [(DayViewController *)self dayView];
  [v3 setAnimateAllDayAreaHeight:0];

  id v4 = [(DayViewController *)self dayView];
  [v4 setNotifyWhenTapOtherEventDuringDragging:1];

  [(LargeDayViewController *)self _setUpCustomAppearances];
  id v5 = [(DayViewController *)self dayScrubberController];
  [v5 setEventSpringLoadingEnabled:1];
}

- (void)_setUpCustomAppearances
{
  if (qword_100216998 != -1) {
    dispatch_once(&qword_100216998, &stru_1001D5150);
  }
}

- (int64_t)presentationStyleOverrideForChildViewControllers
{
  id v2 = [(LargeDayViewController *)self view];
  BOOL v3 = EKUICurrentWindowInterfaceParadigm_RequiresPageSheetEventEditors();

  if (v3) {
    return 1;
  }
  else {
    return 6;
  }
}

- (void)setupUIForTraitCollection:(id)a3
{
  if (!*(&self->super._shouldRespondToApplicationDidBecomeActiveStateChange + 6))
  {
    id v4 = [(LargeDayViewController *)self _fallbackSizingContextWindow];
    if (v4)
    {
      EKUIPushFallbackSizingContextWithViewHierarchy();
      [(LargeDayViewController *)self viewWillAppear:0];
      EKUIPopFallbackSizingContextWithViewHierarchy();
    }
    else
    {
      [(LargeDayViewController *)self viewWillAppear:0];
    }
  }
}

- (id)_fallbackSizingContextWindow
{
  BOOL v3 = [(LargeDayViewController *)self view];
  id v4 = [v3 window];

  if (!v4)
  {
    id v5 = [(LargeDayViewController *)self navigationController];
    objc_super v6 = [v5 view];
    id v4 = [v6 window];

    if (!v4) {
      EKUIHasFallbackSizingContext();
    }
  }
  EKUIMultiwindowAssert();

  return v4;
}

- (void)viewWillAppear:(BOOL)a3
{
  if (!*(&self->super._shouldRespondToApplicationDidBecomeActiveStateChange + 6))
  {
    v20.receiver = self;
    v20.super_class = (Class)LargeDayViewController;
    [(DayViewController *)&v20 viewWillAppear:a3];
    id v4 = [(LargeDayViewController *)self presentedViewController];
    if (!v4 || (uint64_t v5 = *(uint64_t *)((char *)&self->_lastEventShowed + 2), v4, !v5)) {
      [(LargeDayViewController *)self _configureSidebarConfigurationOfManagedNavigationController];
    }
    [(LargeDayViewController *)self _layoutDayArea];
    objc_super v6 = [(DayViewController *)self dayView];
    id v7 = [v6 view];
    [v7 setClipsToBounds:1];

    id v8 = +[NSNotificationCenter defaultCenter];
    uint64_t v9 = [(MainViewController *)self model];
    long long v10 = [v9 eventStore];
    [v8 addObserver:self selector:"_eventStoreChanged:" name:EKEventStoreChangedNotification object:v10];

    *(_DWORD *)((char *)&self->_dividerView + 2) = 2;
    long long v11 = [(LargeDayViewController *)self view];
    int v12 = EKUIIsExtended();

    if (v12)
    {
      long long v13 = [(DayViewController *)self dayScrubberController];
      unsigned __int8 v14 = [v13 view];
      unsigned __int8 v15 = [v14 preservesSuperviewLayoutMargins];

      if ((v15 & 1) == 0)
      {
        long long v16 = [(DayViewController *)self dayScrubberController];
        long long v17 = [v16 view];
        [v17 setPreservesSuperviewLayoutMargins:1];

        long long v18 = [(DayViewController *)self dayScrubberController];
        long long v19 = [v18 view];
        [v19 setNeedsLayout];
      }
    }
  }
}

- (void)viewDidAppear:(BOOL)a3
{
  v13.receiver = self;
  v13.super_class = (Class)LargeDayViewController;
  [(DayViewController *)&v13 viewDidAppear:a3];
  id v4 = (void *)kCalUILogHandle;
  if (os_log_type_enabled((os_log_t)kCalUILogHandle, OS_LOG_TYPE_INFO))
  {
    uint64_t v5 = v4;
    objc_super v6 = (objc_class *)objc_opt_class();
    id v7 = NSStringFromClass(v6);
    id v8 = [(DayViewController *)self day];
    uint64_t v9 = [v8 date];
    *(_DWORD *)buf = 138543618;
    unsigned __int8 v15 = v7;
    __int16 v16 = 2114;
    long long v17 = v9;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_INFO, "[UserStateLog] State -> %{public}@ viewDidAppear. date = %{public}@", buf, 0x16u);
  }
  if (![(LargeDayViewController *)self _eventViewControllerForModelSelectedEventIsAlreadyShown]&& self->_userInteractedWithSplitviewPane)
  {
    long long v10 = [(LargeDayViewController *)self modelSelectedEvents];
    long long v11 = v10;
    if (v10 && [v10 count])
    {
      int v12 = [(LargeDayViewController *)self modelSelectedEvents];
      [(LargeDayViewController *)self showEvents:v12 animated:0 showMode:1 context:0];
    }
    else
    {
      [(LargeDayViewController *)self _autoSelectEventWithAnimatedScroll:0];
    }
  }
  *(&self->super._shouldRespondToApplicationDidBecomeActiveStateChange + 4) = 0;
  *(&self->super._shouldRespondToApplicationDidBecomeActiveStateChange + 6) = 1;
}

- (void)viewWillDisappear:(BOOL)a3
{
  BOOL v3 = a3;
  *(&self->super._shouldRespondToApplicationDidBecomeActiveStateChange + 6) = 0;
  uint64_t v5 = [(LargeDayViewController *)self presentedViewController];

  if (!v5) {
    [(LargeDayViewController *)self _teardownSidebarConfigurationOfManagedNavigationController];
  }
  objc_super v6 = +[NSNotificationCenter defaultCenter];
  id v7 = [(MainViewController *)self model];
  id v8 = [v7 eventStore];
  [v6 removeObserver:self name:EKEventStoreChangedNotification object:v8];

  [v6 removeObserver:self name:UIKeyboardWillShowNotification object:0];
  [v6 removeObserver:self name:UIKeyboardWillHideNotification object:0];
  v9.receiver = self;
  v9.super_class = (Class)LargeDayViewController;
  [(LargeDayViewController *)&v9 viewWillDisappear:v3];
}

- (void)viewDidDisappear:(BOOL)a3
{
  v4.receiver = self;
  v4.super_class = (Class)LargeDayViewController;
  [(DayViewController *)&v4 viewDidDisappear:a3];
  [(LargeDayViewController *)self _setModal:0];
}

- (unint64_t)supportedInterfaceOrientations
{
  return 30;
}

- (void)viewWillLayoutSubviews
{
  v5.receiver = self;
  v5.super_class = (Class)LargeDayViewController;
  [(DayViewController *)&v5 viewWillLayoutSubviews];
  BOOL v3 = [(DayViewController *)self dayScrubberController];
  objc_super v4 = [v3 view];
  [v4 setNeedsLayout];
}

- (void)viewDidLayoutSubviews
{
  BOOL v3 = [(LargeDayViewController *)self parentViewController];

  if (v3)
  {
    v8.receiver = self;
    v8.super_class = (Class)LargeDayViewController;
    [(LargeDayViewController *)&v8 viewDidLayoutSubviews];
    objc_super v4 = [(LargeDayViewController *)self view];
    objc_super v5 = [(DayViewController *)self dayView];
    objc_super v6 = [v5 view];
    [v4 sendSubviewToBack:v6];

    id v7 = [(LargeDayViewController *)self _fallbackSizingContextWindow];
    if (v7)
    {
      EKUIPushFallbackSizingContextWithViewHierarchy();
      [(LargeDayViewController *)self _layoutDayArea];
      EKUIPopFallbackSizingContextWithViewHierarchy();
    }
    else
    {
      [(LargeDayViewController *)self _layoutDayArea];
    }
  }
}

- (void)updateNavigationBarDisplayedDateString
{
  uint64_t v3 = [(DayViewController *)self dayView];
  if (v3)
  {
    objc_super v4 = (void *)v3;
    objc_super v5 = [(DayViewController *)self dayView];
    objc_super v6 = [v5 displayDate];

    if (v6)
    {
      id v7 = [(DayViewController *)self dayView];
      objc_super v8 = [v7 displayDate];
      objc_super v9 = [(MainViewController *)self model];
      long long v10 = [v9 calendar];
      long long v11 = [v10 timeZone];
      id v12 = +[EKCalendarDate calendarDateWithDateComponents:v8 timeZone:v11];

      [(LargeDayViewController *)self updateNavigationBarDisplayedDateStringWithDate:v12];
    }
  }
}

- (void)updateNavigationBarDisplayedDateStringWithDate:(id)a3
{
  id v4 = a3;
  id v5 = [(LargeDayViewController *)self navigationController];
  [v5 setNavBarStringFromDate:v4 includeMonth:1 includeYear:1];
}

- (Class)managedNavigationControllerType
{
  uint64_t v3 = [(LargeDayViewController *)self view];
  BOOL v4 = EKUICurrentWindowInterfaceParadigm_RequiresPageSheetEventEditors();

  if (v4)
  {
    id v5 = objc_opt_class();
  }
  else
  {
    v7.receiver = self;
    v7.super_class = (Class)LargeDayViewController;
    id v5 = [(MainViewController *)&v7 managedNavigationControllerType];
  }

  return (Class)v5;
}

- (id)managedNavigationController
{
  if (([(LargeDayViewController *)self isViewLoaded] & 1) == 0)
  {
    [(LargeDayViewController *)self view];
  }
  v5.receiver = self;
  v5.super_class = (Class)LargeDayViewController;
  uint64_t v3 = [(MainViewController *)&v5 managedNavigationController];

  return v3;
}

- (void)updatePalette:(id)a3
{
  id v4 = a3;
  [v4 setWeekdayHeaderFillsHalfWidth:0];
  [v4 setWeekdayHeaderVisible:0];
  [v4 setTodayButtonVisible:1];
  [v4 setDateStringVisible:1];
  [v4 setDividerLineVisible:1];
  [v4 setFocusBannerPlacement:2];
  id v11 = [(DayViewController *)self dayScrubberController];
  [v4 setDayScrubberController:v11];
  objc_super v5 = [v11 view];
  [v5 setNeedsLayout];

  [v4 sizeToFit];
  [v4 frame];
  double v7 = v6;
  objc_super v8 = [v4 containingPalette];
  [v8 setPreferredHeight:v7];

  objc_super v9 = [v4 containingPalette];

  long long v10 = [(LargeDayViewController *)self navigationItem];
  [v10 _setBottomPalette:v9];
}

- (BOOL)shouldAdaptEventViewControllers
{
  if (!*(&self->super._shouldRespondToApplicationDidBecomeActiveStateChange + 3)
    || *(&self->super._shouldRespondToApplicationDidBecomeActiveStateChange + 4))
  {
    return 1;
  }
  id v4 = [(LargeDayViewController *)self shownEventEditViewController];
  if (v4)
  {
    BOOL v3 = 1;
  }
  else
  {
    objc_super v5 = [(MainViewController *)self shownEventViewController];
    double v6 = [v5 presentedViewController];
    BOOL v3 = v6 != 0;
  }
  return v3;
}

- (BOOL)shouldJournalMainViewControllerParent
{
  BOOL v3 = [(LargeDayViewController *)self presentedViewController];
  objc_opt_class();
  char isKindOfClass = objc_opt_isKindOfClass();

  if ((isKindOfClass & 1) == 0) {
    return 1;
  }
  objc_super v5 = [(LargeDayViewController *)self presentedViewController];
  double v6 = [v5 viewControllers];
  double v7 = [v6 firstObject];
  objc_opt_class();
  char v8 = objc_opt_isKindOfClass();

  return (v8 & 1) == 0;
}

- (BOOL)showEventDetailsWhenNewEventAdded
{
  return 1;
}

- (BOOL)eventViewControllerShowsInlinePreview
{
  return 0;
}

- (BOOL)shouldInvalidateManagedNavigationControllerOnPresentationDismissal
{
  id v2 = self;
  BOOL v3 = [(LargeDayViewController *)self presentedViewController];
  id v4 = [(LargeDayViewController *)v2 managedNavigationController];
  LOBYTE(v2) = v3 == v4;

  return (char)v2;
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
  id v2 = [(LargeDayViewController *)self shownEventEditViewController];
  BOOL v3 = v2 == 0;

  return v3;
}

- (BOOL)mainViewControllerCanChangeSelectedDate
{
  id v2 = [(LargeDayViewController *)self shownEventEditViewController];
  BOOL v3 = v2 == 0;

  return v3;
}

- (BOOL)requiresSelfAsEventEditorDelegate
{
  return 1;
}

- (void)navigateToNextSelectableItem
{
}

- (void)navigateToPreviousSelectableItem
{
}

- (void)_selectNextEventInForwardDirection:(BOOL)a3
{
  objc_super v5 = [(DayViewController *)self dayView];
  id v12 = [v5 currentDayView];

  if (v12)
  {
    id v6 = objc_alloc((Class)EKDayOccurrenceViewIterator);
    double v7 = [v12 allOccurrenceViews];
    char v8 = [(LargeDayViewController *)self modelSelectedEvent];
    id v9 = [v6 initWithOccurrenceViews:v7 selectedEvent:v8];

    if (a3) {
      [v9 next];
    }
    else {
    long long v10 = [v9 previous];
    }

    if (v10)
    {
      id v11 = [v10 occurrence];
      [(LargeDayViewController *)self showEvent:v11 animated:1 showMode:1 context:0];
    }
  }
}

- (void)showNextOccurrenceOfSelectableItem
{
  BOOL v3 = [(LargeDayViewController *)self modelSelectedEvent];
  id v5 = [v3 nextOccurrence];

  id v4 = v5;
  if (v5)
  {
    [(LargeDayViewController *)self showEvent:v5 animated:1 showMode:1 context:0];
    id v4 = v5;
  }
}

- (void)showPreviousOccurrenceOfSelectableItem
{
  BOOL v3 = [(LargeDayViewController *)self modelSelectedEvent];
  id v5 = [v3 previousOccurrence];

  id v4 = v5;
  if (v5)
  {
    [(LargeDayViewController *)self showEvent:v5 animated:1 showMode:1 context:0];
    id v4 = v5;
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
  double v7 = [(MainViewController *)self model];
  id v10 = [v7 selectedDate];

  if (v5) {
    uint64_t v8 = 1;
  }
  else {
    uint64_t v8 = -1;
  }
  id v9 = [v10 calendarDateByAddingDays:v8];
  [(DayViewController *)self selectDate:v9 animated:v4];
}

- (void)_configureSidebarConfigurationOfManagedNavigationController
{
  if (!*(EKEvent **)((char *)&self->_lastEventShowed + 2))
  {
    BOOL v3 = [(LargeDayViewController *)self managedNavigationController];
    BOOL v4 = [v3 parentViewController];

    if (v4 != self)
    {
      BOOL v5 = [(LargeDayViewController *)self managedNavigationController];
      [(LargeDayViewController *)self addChildViewController:v5];

      id v6 = [(LargeDayViewController *)self managedNavigationController];
      [v6 didMoveToParentViewController:self];
    }
    double v7 = [LargeDayNavigationWrapperView alloc];
    uint64_t v8 = [(LargeDayViewController *)self managedNavigationController];
    id v9 = [v8 view];
    id v10 = [(LargeDayNavigationWrapperView *)v7 initWithNavigationView:v9];
    id v11 = *(EKEvent **)((char *)&self->_lastEventShowed + 2);
    *(EKEvent **)((char *)&self->_lastEventShowed + 2) = v10;

    [*(id *)((char *)&self->_lastEventShowed + 2) setClipsToBounds:1];
    id v12 = [(LargeDayViewController *)self view];
    [v12 addSubview:*(EKEvent **)((char *)&self->_lastEventShowed + 2)];
  }
  objc_super v13 = [(LargeDayViewController *)self managedNavigationController];
  [v13 setDelegate:self];

  id v15 = [(LargeDayViewController *)self managedNavigationController];
  unsigned __int8 v14 = [v15 traitOverrides];
  [v14 setHorizontalSizeClass:1];
}

- (void)_teardownSidebarConfigurationOfManagedNavigationController
{
  [(LargeDayViewController *)self _dismissEditorAndSaveIfPossibleWhileChangingDate:1 animated:0];
  [(LargeDayViewController *)self _clearSplitViewNavigationController];
  BOOL v3 = [(LargeDayViewController *)self managedNavigationController];
  [v3 removeFromParentViewController];

  BOOL v4 = [(LargeDayViewController *)self managedNavigationController];
  BOOL v5 = [v4 view];
  [v5 removeFromSuperview];

  id v6 = [(LargeDayViewController *)self managedNavigationController];
  [v6 setDelegate:0];

  [*(id *)((char *)&self->_lastEventShowed + 2) removeFromSuperview];
  double v7 = *(EKEvent **)((char *)&self->_lastEventShowed + 2);
  *(EKEvent **)((char *)&self->_lastEventShowed + 2) = 0;
}

- (void)_createSplitView
{
  BOOL v3 = [(LargeDayViewController *)self managedNavigationController];
  BOOL v4 = [v3 view];
  [v4 setClipsToBounds:1];

  BOOL v5 = [(LargeDayViewController *)self managedNavigationController];
  [(LargeDayViewController *)self addChildViewController:v5];

  id v6 = [(LargeDayViewController *)self managedNavigationController];
  [v6 didMoveToParentViewController:self];

  double v7 = (LargeDayNavigationWrapperView *)objc_opt_new();
  uint64_t v8 = *(LargeDayNavigationWrapperView **)((char *)&self->_navigationWrapperView + 2);
  *(LargeDayNavigationWrapperView **)((char *)&self->_navigationWrapperView + 2) = v7;

  id v9 = +[UIColor separatorColor];
  [*(id *)((char *)&self->_navigationWrapperView + 2) setBackgroundColor:v9];

  id v10 = [(LargeDayViewController *)self view];
  [v10 addSubview:*(LargeDayNavigationWrapperView **)((char *)&self->_navigationWrapperView + 2)];
}

- (void)_resetSplitView
{
  BOOL v3 = [(LargeDayViewController *)self shownEventEditViewController];

  if (v3)
  {
    BOOL v4 = [(DayViewController *)self dayView];
    [v4 setCurrentEditor:0];
  }

  [(LargeDayViewController *)self _clearSplitViewNavigationController];
}

- (void)_layoutDayArea
{
  [(LargeDayViewController *)self _setDayViewToSplitViewVisibleState];
  [(LargeDayViewController *)self _setSplitViewPosition];
  [(LargeDayViewController *)self _layoutForSplitViews];
  [(LargeDayViewController *)self _layOutSplitDividerFrame];
  BOOL v3 = [(DayViewController *)self dayView];
  BOOL v4 = [v3 gestureController];
  BOOL v5 = [v4 draggingView];

  if (v5)
  {
    id v7 = [(DayViewController *)self dayView];
    id v6 = [v7 gestureController];
    [v6 updateDraggingOccurrenceForced:0 animated:0];
  }
}

- (void)_setDayViewToSplitViewVisibleState
{
  BOOL v3 = [(LargeDayViewController *)self view];
  [v3 bounds];
  [(LargeDayViewController *)self splitterSpace];

  CalRoundToScreenScale();
  double v5 = v4;
  id v6 = [(DayViewController *)self dayView];
  id v7 = [v6 view];
  [v7 frame];
  double v9 = v8;
  double v11 = v10;

  id v13 = [(DayViewController *)self dayView];
  id v12 = [v13 view];
  [v12 setFrame:0.0, v9, v5, v11];
}

- (void)_layOutSplitDividerFrame
{
  EKUIScaleFactor();
  CalRoundToScreenScale();
  double v4 = v3;
  [(LargeDayViewController *)self _dayViewWidthWhenSplit];
  double v6 = v5;
  if ((CalInterfaceIsLeftToRight() & 1) == 0)
  {
    id v7 = [(LargeDayViewController *)self view];
    [v7 bounds];
    double v6 = v8 - v6;
  }
  double v9 = [(LargeDayViewController *)self view];
  [v9 bounds];
  double v11 = v10;

  id v12 = *(LargeDayNavigationWrapperView **)((char *)&self->_navigationWrapperView + 2);

  [v12 setFrame:v6, 0.0, v4, v11];
}

- (void)_layoutForSplitViews
{
  [(LargeDayViewController *)self _layoutDayViewPane];

  [(LargeDayViewController *)self _layoutEventDetailsPane];
}

- (void)_layoutDayViewPane
{
  double v3 = [(DayViewController *)self dayView];
  double v4 = [v3 view];
  [v4 frame];

  [(LargeDayViewController *)self _dayViewWidthWhenSplit];
  double v6 = v5;
  id v7 = [(LargeDayViewController *)self view];
  [v7 bounds];
  double v9 = v8;

  double v10 = 0.0;
  if ((CalInterfaceIsLeftToRight() & 1) == 0)
  {
    double v11 = [(LargeDayViewController *)self view];
    [v11 bounds];
    double v10 = v12 - v6;
  }
  id v13 = [(DayViewController *)self dayView];
  [v13 setFrame:v10 gutterWidth:v6, v9, 0.0];
}

- (void)_layoutEventDetailsPane
{
  double v3 = [(DayViewController *)self dayView];
  double v4 = [v3 view];
  [v4 frame];
  CGFloat v6 = v5;
  CGFloat v8 = v7;
  CGFloat v10 = v9;
  CGFloat v12 = v11;

  double v13 = 0.0;
  if (CalInterfaceIsLeftToRight())
  {
    v40.origin.x = v6;
    v40.origin.y = v8;
    v40.size.double width = v10;
    v40.size.double height = v12;
    double MaxX = CGRectGetMaxX(v40);
    [(LargeDayViewController *)self splitterSpace];
    double v13 = MaxX + v15;
  }
  [(LargeDayViewController *)self _splitViewWidth];
  double v17 = v16;
  long long v18 = [(LargeDayViewController *)self view];
  [v18 bounds];
  double v20 = v19;

  [*(id *)((char *)&self->_lastEventShowed + 2) setFrame:v13, 0.0, v17, v20];
  id v21 = [(MainViewController *)self shownEventViewController];

  if (v21)
  {
    double v22 = [(MainViewController *)self shownEventViewController];
    uint64_t v23 = [v22 view];
    [v23 layoutMargins];
    double v25 = v24;
    double v27 = v26;

    [(LargeDayViewController *)self detailsLeftInsetAdjustment];
    double v29 = v28;
    [(LargeDayViewController *)self rightSplitViewSideInset];
    double v31 = v29 + v30;
    [(LargeDayViewController *)self detailsRightInsetAdjustment];
    double v33 = v32;
    [(LargeDayViewController *)self rightSplitViewSideInset];
    double v35 = v33 + v34;
    if (CalInterfaceIsLeftToRight()) {
      double v36 = v31;
    }
    else {
      double v36 = v35;
    }
    if (CalInterfaceIsLeftToRight()) {
      double v31 = v35;
    }
    id v38 = [(MainViewController *)self shownEventViewController];
    v37 = [v38 view];
    [v37 setLayoutMargins:v25, v36, v27, v31];
  }
}

- (void)_setSplitViewPosition
{
  [*(id *)((char *)&self->_lastEventShowed + 2) frame];
  double v4 = v3;
  double v6 = v5;
  double v8 = v7;
  [(LargeDayViewController *)self _dayViewWidthWhenSplit];
  double v10 = v9;
  [(LargeDayViewController *)self splitterSpace];
  double v11 = *(EKEvent **)((char *)&self->_lastEventShowed + 2);
  double v13 = v10 + v12;

  [v11 setFrame:v13, v4, v6, v8];
}

- (double)_totalWidth
{
  double v3 = [(LargeDayViewController *)self view];
  [v3 bounds];
  double v5 = v4;
  [(LargeDayViewController *)self splitterSpace];
  double v7 = v5 - v6;

  return v7;
}

- (double)_dayViewWidthWhenSplit
{
  [(LargeDayViewController *)self _totalWidth];
  return v2 + -375.0;
}

- (double)_splitViewWidth
{
  [(LargeDayViewController *)self _totalWidth];
  double v4 = v3;
  [(LargeDayViewController *)self _dayViewWidthWhenSplit];
  return v4 - v5;
}

- (void)_clearSplitViewNavigationController
{
  self->_changingDate = 1;
  objc_initWeak(&location, self);
  double v3 = [(LargeDayViewController *)self managedNavigationController];
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472;
  v4[2] = sub_1000E7980;
  v4[3] = &unk_1001D41E8;
  objc_copyWeak(&v5, &location);
  [v3 enqueueStackResetOperationDismissingPresentations:1 cancelOperations:0 completionBlock:v4];

  objc_destroyWeak(&v5);
  objc_destroyWeak(&location);
}

- (void)navigationController:(id)a3 willShowViewController:(id)a4 animated:(BOOL)a5
{
  BOOL v5 = a5;
  id v15 = a3;
  id v8 = a4;
  uint64_t v9 = [(LargeDayViewController *)self shownEventEditViewController];
  if (!v9
    || (double v10 = (void *)v9,
        [(LargeDayViewController *)self shownEventEditViewController],
        double v11 = objc_claimAutoreleasedReturnValue(),
        unsigned int v12 = [v11 isBeingDismissed],
        v11,
        v10,
        v12))
  {
    double v13 = [(MainViewController *)self window];
    EKUIPushFallbackSizingContextWithViewHierarchy();

    [(LargeDayViewController *)self _splitViewNavigationController:v15 willShowViewController:v8 animated:v5 completion:0];
    unsigned __int8 v14 = [(MainViewController *)self window];
    EKUIPopFallbackSizingContextWithViewHierarchy();
  }
}

- (void)_splitViewNavigationController:(id)a3 willShowViewController:(id)a4 animated:(BOOL)a5 completion:(id)a6
{
  BOOL v7 = a5;
  id v10 = a3;
  id v11 = a4;
  id v12 = a6;
  double v13 = [(LargeDayViewController *)self managedNavigationController];
  unsigned int v14 = [v10 isEqual:v13];

  if (v14)
  {
    if (v7) {
      double v15 = 0.15;
    }
    else {
      double v15 = 0.0;
    }
    double v16 = [v10 viewControllers];
    BOOL v17 = (unint64_t)[v16 count] < 2;

    [v10 setNavigationBarHidden:v17 animated:0];
    if (v11
      || ([v10 viewControllers],
          double v34 = objc_claimAutoreleasedReturnValue(),
          id v35 = [v34 count],
          v34,
          v35)
      && ([v10 topViewController], (id v11 = (id)objc_claimAutoreleasedReturnValue()) != 0))
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0)
      {
        long long v18 = [v11 view];
        [v18 layoutMargins];
        double v20 = v19;
        double v22 = v21;

        [(LargeDayViewController *)self detailsRightInsetAdjustment];
        double v24 = v23;
        [(LargeDayViewController *)self rightSplitViewSideInset];
        double v26 = v24 + v25;
        [(LargeDayViewController *)self detailsLeftInsetAdjustment];
        double v28 = v27;
        [(LargeDayViewController *)self rightSplitViewSideInset];
        double v30 = v28 + v29;
        double v31 = [v11 view];
        [v31 setLayoutMargins:v20, v30, v22, v26];
      }
      double v32 = [v11 toolbarItems];
      [v10 setToolbarHidden:[v32 count] == 0];

      v41[0] = _NSConcreteStackBlock;
      v41[1] = 3221225472;
      v41[2] = sub_1000E7E14;
      v41[3] = &unk_1001D2740;
      v41[4] = self;
      v39[0] = _NSConcreteStackBlock;
      v39[1] = 3221225472;
      v39[2] = sub_1000E7E1C;
      v39[3] = &unk_1001D29F0;
      double v33 = &v40;
      id v40 = v12;
      +[UIView animateWithDuration:v41 animations:v39 completion:v15];
    }
    else
    {
      [v10 setToolbarHidden:1];
      v38[0] = _NSConcreteStackBlock;
      v38[1] = 3221225472;
      v38[2] = sub_1000E7E34;
      v38[3] = &unk_1001D2740;
      v38[4] = self;
      v36[0] = _NSConcreteStackBlock;
      v36[1] = 3221225472;
      v36[2] = sub_1000E7E3C;
      v36[3] = &unk_1001D29F0;
      double v33 = &v37;
      id v37 = v12;
      +[UIView animateWithDuration:v38 animations:v36 completion:v15];
      id v11 = 0;
    }
  }
}

- (BOOL)usePortraitLayoutForSize:(CGSize)a3
{
  return a3.width <= a3.height;
}

- (int64_t)orientationForSize:(CGSize)a3
{
  if (-[LargeDayViewController usePortraitLayoutForSize:](self, "usePortraitLayoutForSize:", a3.width, a3.height)) {
    return 1;
  }
  else {
    return 4;
  }
}

- (int64_t)viewInterfaceOrientation
{
  double v3 = [(LargeDayViewController *)self view];
  if (EKUICurrentWidthSizeClassIsCompactInViewHierarchy())
  {
    int64_t v4 = 4;
LABEL_6:

    return v4;
  }
  BOOL v5 = [(LargeDayViewController *)self view];
  char IsCompact = EKUICurrentHeightSizeClassIsCompact();

  if ((IsCompact & 1) == 0)
  {
    double v3 = [(LargeDayViewController *)self view];
    [v3 frame];
    int64_t v4 = -[LargeDayViewController orientationForSize:](self, "orientationForSize:", v7, v8);
    goto LABEL_6;
  }
  return 4;
}

- (double)splitterSpace
{
  return 1.0;
}

- (double)rightSplitViewSideInset
{
  return 23.0;
}

- (double)detailsLeftInsetAdjustment
{
  double v2 = [(LargeDayViewController *)self view];
  uint64_t v3 = EKUICurrentWindowInterfaceParadigm();

  double result = 1.0;
  if (v3 == 8) {
    return -19.0;
  }
  return result;
}

- (double)detailsRightInsetAdjustment
{
  uint64_t v3 = [(LargeDayViewController *)self view];
  uint64_t v4 = EKUICurrentWindowInterfaceParadigm();

  double result = -1.0;
  if (v4 == 8)
  {
    [(LargeDayViewController *)self rightSplitViewSideInset];
    return -v6;
  }
  return result;
}

- (BOOL)_selectEvent:(id)a3 animated:(BOOL)a4 context:(int)a5
{
  LODWORD(v5) = a5;
  BOOL v6 = a4;
  id v8 = a3;
  uint64_t v9 = [(DayViewController *)self gestureController];
  unsigned __int8 v10 = [v9 dragGestureInProgress];

  if ((v10 & 1) == 0)
  {
    id v11 = [(LargeDayViewController *)self shownEventEditViewController];
    id v12 = v11;
    if (v5 == 1 && v11)
    {
      double v13 = [(LargeDayViewController *)self shownEventEditViewController];
      unsigned int v14 = [v13 event];
      double v15 = [v14 uniqueId];
      double v16 = [v8 uniqueId];
      unsigned int v17 = [v15 isEqualToString:v16];

      if (v17)
      {

        id v8 = 0;
        BOOL v18 = 1;
        goto LABEL_11;
      }
    }
    else
    {
    }
    if (!v8 || v5 != 1)
    {
LABEL_12:
      double v19 = [(LargeDayViewController *)self shownEventEditViewController];
      double v20 = [v19 event];

      if (v8 || !v20)
      {
        double v22 = [v20 uniqueID];
        double v23 = [v8 uniqueID];
        if (v22 == v23)
        {
          unsigned int v21 = 1;
        }
        else
        {
          double v24 = [v20 uniqueID];
          double v25 = [v8 uniqueID];
          unsigned int v21 = [v24 isEqualToString:v25];
        }
      }
      else
      {
        unsigned int v21 = 0;
      }
      double v26 = [(LargeDayViewController *)self shownEventEditViewController];
      double v27 = v26;
      if (!v26 || v21)
      {
      }
      else
      {
        double v28 = [(LargeDayViewController *)self shownEventEditViewController];
        int v29 = [v28 isBeingDismissed];

        if ((v29 & 1) == 0)
        {
          if (v5 == 1)
          {
            double v30 = [(LargeDayViewController *)self shownEventEditViewController];
            unsigned int v31 = [v30 willPresentDialogOnSave];

            if (v31)
            {
              BOOL v5 = [(LargeDayViewController *)self shownEventEditViewController];
              v44[0] = _NSConcreteStackBlock;
              v44[1] = 3221225472;
              v44[2] = sub_1000E8548;
              v44[3] = &unk_1001D5178;
              v44[4] = self;
              id v45 = v8;
              BOOL v47 = v6;
              int v46 = 1;
              [v5 completeAndSaveWithContinueBlock:v44];

              LOBYTE(v5) = 0;
LABEL_47:

              goto LABEL_48;
            }
            if (!v8) {
              *(_DWORD *)((char *)&self->_dividerView + 2) = 1;
            }
          }
          [(LargeDayViewController *)self _dismissEditorAndSaveIfPossibleWhileChangingDate:0 animated:0];
        }
      }
      double v32 = [(DayViewController *)self _selectedOccurrenceViews];
      if ([v32 count] == (id)1)
      {
        double v33 = [(DayViewController *)self _selectedOccurrenceViews];
        double v34 = [v33 firstObject];
      }
      else
      {
        double v34 = 0;
      }

      id v35 = [v34 occurrence];
      unsigned int v36 = [v35 isEqual:v8];

      if (v36)
      {
        if (([v8 hasChanges] & 1) == 0) {
          [(LargeDayViewController *)self _adjustSelectedOccurrences];
        }
        LOBYTE(v5) = 1;
      }
      else
      {
        [(DayViewController *)self _cleanupSelectedOccurrenceCloneViewsRespectingModelSelected];
        if (v8)
        {
          *(&self->super._shouldRespondToApplicationDidBecomeActiveStateChange + 3) = v5 != 1;
          [(LargeDayViewController *)self setModelSelectedEvent:v8];
          BOOL v37 = v5 != 2;
          id v48 = v8;
          LOBYTE(v5) = 1;
          id v38 = +[NSArray arrayWithObjects:&v48 count:1];
          [(DayViewController *)self _setUpSelectedOccurrenceViewsWithEvents:v38 animated:v6 autoScroll:v37 resetSelection:1];
        }
        else
        {
          id v39 = [(MainViewController *)self shownEventViewController];
          if (v39
            || ([(LargeDayViewController *)self shownEventEditViewController],
                (id v39 = objc_claimAutoreleasedReturnValue()) != 0)
            || ([(MainViewController *)self shownContactViewController],
                (id v39 = objc_claimAutoreleasedReturnValue()) != 0))
          {
          }
          else
          {
            BOOL v5 = [(MainViewController *)self shownExpandedReminderStackViewController];

            if (!v5)
            {
              double v41 = 0.15;
              if (!v6) {
                double v41 = 0.0;
              }
              v42[0] = _NSConcreteStackBlock;
              v42[1] = 3221225472;
              v42[2] = sub_1000E8564;
              v42[3] = &unk_1001D2740;
              v42[4] = self;
              +[UIView animateWithDuration:v42 animations:0 completion:v41];
              goto LABEL_46;
            }
          }
          if (v6)
          {
            block[0] = _NSConcreteStackBlock;
            block[1] = 3221225472;
            block[2] = sub_1000E855C;
            block[3] = &unk_1001D2740;
            block[4] = self;
            dispatch_async((dispatch_queue_t)&_dispatch_main_q, block);
          }
          else
          {
            [(LargeDayViewController *)self _resetSplitView];
          }
          LOBYTE(v5) = 0;
        }
      }
LABEL_46:

      goto LABEL_47;
    }
    BOOL v18 = 0;
LABEL_11:
    *(&self->super._shouldRespondToApplicationDidBecomeActiveStateChange + 2) = v18;
    goto LABEL_12;
  }
  LOBYTE(v5) = 0;
LABEL_48:

  return (char)v5;
}

- (BOOL)_selectEvents:(id)a3 animated:(BOOL)a4 context:(int)a5
{
  uint64_t v6 = a4;
  id v8 = a3;
  uint64_t v9 = [(DayViewController *)self gestureController];
  unsigned __int8 v10 = [v9 dragGestureInProgress];

  if ((v10 & 1) == 0)
  {
    uint64_t v12 = [(LargeDayViewController *)self shownEventEditViewController];
    double v13 = (void *)v12;
    int v72 = a5;
    if (a5 == 1 && v12 && [v8 count] == (id)1)
    {
      unsigned int v14 = [(LargeDayViewController *)self shownEventEditViewController];
      double v15 = [v14 event];
      double v16 = [v15 uniqueId];
      unsigned int v17 = [v8 firstObject];
      [v17 uniqueId];
      double v19 = v18 = v6;
      unsigned int v20 = [v16 isEqualToString:v19];

      uint64_t v6 = v18;
      a5 = 1;

      if (v20)
      {

        id v8 = 0;
        BOOL v21 = 1;
        goto LABEL_13;
      }
    }
    else
    {
    }
    if (!v8 || a5 != 1 || ![v8 count])
    {
LABEL_14:
      double v22 = [(LargeDayViewController *)self shownEventEditViewController];
      double v23 = [v22 event];

      double v24 = [(MainViewController *)self shownExpandedReminderStackViewController];
      double v25 = [v24 events];

      if (v23)
      {
        if (v8)
        {
          BOOL v26 = [v8 count] == 0;
          if (!v25) {
            goto LABEL_24;
          }
        }
        else
        {
          BOOL v26 = 1;
          if (!v25) {
            goto LABEL_24;
          }
        }
      }
      else
      {
        BOOL v26 = 0;
        if (!v25) {
          goto LABEL_24;
        }
      }
      if ([v25 count])
      {
        if (v8) {
          BOOL v27 = [v8 count] == 0;
        }
        else {
          BOOL v27 = 1;
        }
LABEL_25:
        v73 = v25;
        if (v26 || [v8 count] != (id)1)
        {
          unsigned int v35 = 0;
          if (!v27)
          {
LABEL_34:
            BOOL v37 = +[NSSet setWithArray:v25];
            if (v8) {
              id v38 = v8;
            }
            else {
              id v38 = &__NSArray0__struct;
            }
            id v39 = +[NSSet setWithArray:v38];
            unsigned __int8 v36 = [v37 isEqualToSet:v39];

LABEL_38:
            id v40 = [(LargeDayViewController *)self shownEventEditViewController];
            double v41 = v40;
            if (v40) {
              int v42 = v35;
            }
            else {
              int v42 = 1;
            }
            if (v42 == 1)
            {
            }
            else
            {
              BOOL v43 = [(LargeDayViewController *)self shownEventEditViewController];
              unsigned __int8 v44 = [v43 isBeingDismissed];

              if ((v44 & 1) == 0)
              {
                if (v72 == 1)
                {
                  id v45 = [(LargeDayViewController *)self shownEventEditViewController];
                  unsigned int v46 = [v45 willPresentDialogOnSave];

                  if (v46)
                  {
                    BOOL v47 = [(LargeDayViewController *)self shownEventEditViewController];
                    v76[0] = _NSConcreteStackBlock;
                    v76[1] = 3221225472;
                    v76[2] = sub_1000E8D4C;
                    v76[3] = &unk_1001D5178;
                    v76[4] = self;
                    id v77 = v8;
                    char v79 = v6;
                    int v78 = 1;
                    [v47 completeAndSaveWithContinueBlock:v76];

                    BOOL v11 = 0;
LABEL_86:

                    goto LABEL_87;
                  }
                  if (!v8 || ![v8 count]) {
                    *(_DWORD *)((char *)&self->_dividerView + 2) = 1;
                  }
                }
                else if (v8)
                {
                  [v8 count];
                }
                [(LargeDayViewController *)self _dismissEditorAndSaveIfPossibleWhileChangingDate:0 animated:0];
              }
            }
            id v48 = [(MainViewController *)self shownExpandedReminderStackViewController];
            if (v48) {
              char v49 = v36;
            }
            else {
              char v49 = 1;
            }
            if (v49) {
              goto LABEL_63;
            }
            v50 = [(MainViewController *)self shownExpandedReminderStackViewController];
            unsigned __int8 v51 = [v50 isBeingDismissed];

            if (v51) {
              goto LABEL_64;
            }
            if (v8)
            {
              id v52 = [v8 count];
              if (v72 != 1 || v52) {
                goto LABEL_62;
              }
            }
            else if (v72 != 1)
            {
              goto LABEL_62;
            }
            *(_DWORD *)((char *)&self->_dividerView + 2) = 1;
LABEL_62:
            id v48 = [(MainViewController *)self shownExpandedReminderStackViewController];
            objc_super v53 = [v48 presentingViewController];
            [v53 dismissViewControllerAnimated:1 completion:0];

LABEL_63:
LABEL_64:
            v54 = [(DayViewController *)self _selectedOccurrenceViews];
            if ([v54 count] == (id)1)
            {
              id v55 = [(DayViewController *)self _selectedOccurrenceViews];
              id v56 = [v55 firstObject];
            }
            else
            {
              id v56 = 0;
            }

            v57 = [v56 occurrences];
            v58 = v57;
            if (v8 && v57)
            {
              v59 = v23;
              __int16 v60 = [v56 occurrences];
              v61 = +[NSSet setWithArray:v60];
              v62 = +[NSSet setWithArray:v8];
              unsigned __int8 v63 = [v61 isEqualToSet:v62];

              if (v63)
              {
                double v23 = v59;
                if ([v8 count] == (id)1)
                {
                  v64 = [v8 firstObject];
                  unsigned __int8 v65 = [v64 hasChanges];

                  if ((v65 & 1) == 0) {
                    [(LargeDayViewController *)self _adjustSelectedOccurrences];
                  }
                }
                goto LABEL_85;
              }
              [(DayViewController *)self _cleanupSelectedOccurrenceCloneViewsRespectingModelSelected];
              double v23 = v59;
            }
            else
            {

              [(DayViewController *)self _cleanupSelectedOccurrenceCloneViewsRespectingModelSelected];
              if (!v8) {
                goto LABEL_78;
              }
            }
            if ([v8 count])
            {
              *(&self->super._shouldRespondToApplicationDidBecomeActiveStateChange + 3) = v72 != 1;
              [(LargeDayViewController *)self setModelSelectedEvents:v8];
              [(DayViewController *)self _setUpSelectedOccurrenceViewsWithEvents:v8 animated:v6 autoScroll:v72 != 2 resetSelection:1];
              goto LABEL_85;
            }
LABEL_78:
            v66 = [(MainViewController *)self shownEventViewController];
            if (v66
              || ([(LargeDayViewController *)self shownEventEditViewController],
                  (v66 = objc_claimAutoreleasedReturnValue()) != 0)
              || ([(MainViewController *)self shownContactViewController],
                  (v66 = objc_claimAutoreleasedReturnValue()) != 0))
            {
            }
            else
            {
              v68 = [(MainViewController *)self shownExpandedReminderStackViewController];

              if (!v68)
              {
                double v69 = 0.15;
                if (!v6) {
                  double v69 = 0.0;
                }
                v74[0] = _NSConcreteStackBlock;
                v74[1] = 3221225472;
                v74[2] = sub_1000E8E30;
                v74[3] = &unk_1001D2740;
                v74[4] = self;
                +[UIView animateWithDuration:v74 animations:0 completion:v69];
                goto LABEL_85;
              }
            }
            if (v6)
            {
              block[0] = _NSConcreteStackBlock;
              block[1] = 3221225472;
              block[2] = sub_1000E8D60;
              block[3] = &unk_1001D2740;
              block[4] = self;
              dispatch_async((dispatch_queue_t)&_dispatch_main_q, block);
            }
            else
            {
              [(LargeDayViewController *)self _resetSplitView];
            }
LABEL_85:

            BOOL v11 = 1;
            goto LABEL_86;
          }
        }
        else
        {
          unsigned int v71 = v6;
          double v28 = [v23 uniqueID];
          int v29 = [v8 firstObject];
          double v30 = [v29 uniqueID];
          if (v28 == v30)
          {
            unsigned int v35 = 1;
          }
          else
          {
            [v23 uniqueID];
            unsigned int v31 = v70 = v28;
            double v32 = [v8 firstObject];
            [v32 uniqueID];
            double v34 = v33 = v23;
            unsigned int v35 = [v31 isEqualToString:v34];

            double v23 = v33;
            double v25 = v73;

            double v28 = v70;
          }

          uint64_t v6 = v71;
          if (!v27) {
            goto LABEL_34;
          }
        }
        unsigned __int8 v36 = 0;
        goto LABEL_38;
      }
LABEL_24:
      BOOL v27 = 0;
      goto LABEL_25;
    }
    BOOL v21 = 0;
LABEL_13:
    *(&self->super._shouldRespondToApplicationDidBecomeActiveStateChange + 2) = v21;
    goto LABEL_14;
  }
  BOOL v11 = 0;
LABEL_87:

  return v11;
}

- (id)_selectedOccurrenceView
{
  uint64_t v3 = [(DayViewController *)self _selectedOccurrenceViews];
  if ([v3 count] == (id)1)
  {
    uint64_t v4 = [(DayViewController *)self _selectedOccurrenceViews];
    BOOL v5 = [v4 firstObject];
  }
  else
  {
    uint64_t v4 = [(DayViewController *)self dayView];
    uint64_t v6 = [(LargeDayViewController *)self modelSelectedEvent];
    BOOL v5 = [v4 occurrenceViewForEvent:v6 includeNextAndPreviousDays:0];
  }

  return v5;
}

- (id)_clonedViewForSelectedOccurrence:(id)a3
{
  id v5 = a3;
  uint64_t v6 = objc_opt_new();
  double v7 = [(DayViewController *)self timedDayViewContentGridSubviews];
  [v6 addObjectsFromArray:v7];

  id v8 = [(DayViewController *)self allDayView];
  uint64_t v9 = [v8 subviews];
  [v6 addObjectsFromArray:v9];

  uint64_t v13 = 0;
  unsigned int v14 = &v13;
  uint64_t v15 = 0x3032000000;
  double v16 = sub_1000E9080;
  unsigned int v17 = sub_1000E9090;
  id v18 = 0;
  v12[0] = _NSConcreteStackBlock;
  v12[1] = 3221225472;
  v12[2] = sub_1000E9098;
  v12[3] = &unk_1001D51A0;
  v12[5] = &v13;
  v12[6] = a2;
  v12[4] = self;
  [v6 enumerateObjectsUsingBlock:v12];
  id v10 = (id)v14[5];
  _Block_object_dispose(&v13, 8);

  return v10;
}

- (void)_occurrenceViewDidEndSelection:(id)a3
{
  id v9 = [a3 object];
  uint64_t v4 = [v9 occurrence];
  id v5 = [(LargeDayViewController *)self _clonedViewForSelectedOccurrence:v4];

  if (v5)
  {
    uint64_t v6 = [v9 occurrence];
    double v7 = [v5 occurrence];
    unsigned int v8 = [v6 isEqual:v7];

    if (v8) {
      [(DayViewController *)self _cleanupSelectedOccurrenceCloneViews];
    }
  }
}

- (void)_reselectedEventIfNeeded
{
  uint64_t v3 = [(LargeDayViewController *)self modelSelectedEvents];

  if (v3)
  {
    id v4 = [(LargeDayViewController *)self modelSelectedEvents];
    [(LargeDayViewController *)self _selectEvents:v4 animated:0 context:0];
  }
}

- (void)showEvent:(id)a3 animated:(BOOL)a4 showMode:(unint64_t)a5 context:(id)a6
{
  BOOL v7 = a4;
  id v13 = a3;
  id v10 = a6;
  id v11 = a3;
  uint64_t v12 = +[NSArray arrayWithObjects:&v13 count:1];

  -[LargeDayViewController showEvents:animated:showMode:context:](self, "showEvents:animated:showMode:context:", v12, v7, a5, v10, v13);
}

- (void)showEvents:(id)a3 animated:(BOOL)a4 showMode:(unint64_t)a5 context:(id)a6
{
  BOOL v8 = a4;
  id v21 = a3;
  id v10 = a6;
  id v11 = [(DayViewController *)self gestureController];
  unsigned __int8 v12 = [v11 dragGestureInProgress];

  if ((v12 & 1) == 0)
  {
    [(LargeDayViewController *)self setModelSelectedEvents:v21];
    if ([v21 count] == (id)1)
    {
      id v13 = [v21 firstObject];
      unsigned int v14 = v13;
      if (a5 == 3)
      {
        [(DayViewController *)self beginEditingOccurrence:v13 creationMethod:3];
LABEL_5:

        goto LABEL_10;
      }
      if (([v13 isNew] & 1) == 0
        && ![(LargeDayViewController *)self _eventIntersectsDayViewControllerActiveDate:v14])
      {
        uint64_t v15 = [(LargeDayViewController *)self shownEventEditViewController];

        if (v15) {
          [(LargeDayViewController *)self _dismissEditorAndSaveIfPossibleWhileChangingDate:1 animated:0];
        }
        double v16 = [v14 startDate];
        unsigned int v17 = [(MainViewController *)self model];
        id v18 = [v17 calendar];
        double v19 = [v18 timeZone];
        unsigned int v20 = +[EKCalendarDate calendarDateWithDate:v16 timeZone:v19];
        [(DayViewController *)self selectDate:v20 animated:v8];

        goto LABEL_5;
      }
    }
    [(LargeDayViewController *)self _showEventsWithoutChangingDate:v21 animated:v8 showComments:a5 == 2 context:v10];
  }
LABEL_10:
}

- (void)_showEventsWithoutChangingDate:(id)a3 animated:(BOOL)a4 showComments:(BOOL)a5 context:(id)a6
{
  BOOL v7 = a5;
  BOOL v8 = a4;
  id v15 = a3;
  id v10 = a6;
  id v11 = [(DayViewController *)self gestureController];
  unsigned __int8 v12 = [v11 dragGestureInProgress];

  if ((v12 & 1) == 0)
  {
    [(LargeDayViewController *)self _selectEvents:v15 animated:v8 context:0];
    if (v15)
    {
      if ([v15 count] != (id)1
        || ([v15 firstObject],
            id v13 = objc_claimAutoreleasedReturnValue(),
            unsigned __int8 v14 = [v13 isNew],
            v13,
            (v14 & 1) == 0))
      {
        [(DayViewController *)self presentDetailsForEvents:v15 animated:v8 showComments:v7 context:v10];
      }
    }
  }
}

- (BOOL)didSelectEvents:(id)a3 userInitiated:(BOOL)a4
{
  BOOL v4 = a4;
  id v6 = a3;
  BOOL v7 = v6;
  if (v4)
  {
    if (v6)
    {
      BOOL v8 = [(LargeDayViewController *)self modelSelectedEvents];
      id v9 = +[NSSet setWithArray:v8];
      id v10 = +[NSSet setWithArray:v7];
      unsigned int v11 = [v9 isEqualToSet:v10];

      id v12 = v7;
      id v13 = v12;
      if (v11)
      {

        char v14 = 1;
        id v13 = 0;
        if (![(LargeDayViewController *)self _selectEvents:0 animated:1 context:1])
        {
          char v15 = 0;
LABEL_29:
          LOBYTE(v21) = v15 & (v14 ^ 1);
          goto LABEL_30;
        }
LABEL_27:
        *(&self->super._shouldRespondToApplicationDidBecomeActiveStateChange + 3) = 0;
        char v15 = 1;
        *(&self->super._shouldRespondToApplicationDidBecomeActiveStateChange + 2) = 1;
        [(LargeDayViewController *)self setModelSelectedEvent:0];
        [(DayViewController *)self _cleanupSelectedOccurrenceCloneViews];
        goto LABEL_29;
      }
      if ([(LargeDayViewController *)self _selectEvents:v12 animated:1 context:1])
      {
        if ([v13 count])
        {
          char v14 = 0;
          goto LABEL_28;
        }
LABEL_26:
        BOOL v26 = [(MainViewController *)self model];
        BOOL v27 = [v26 selectedOccurrences];
        id v28 = [v27 count];

        char v14 = 0;
        if (v28) {
          goto LABEL_27;
        }
LABEL_28:
        char v15 = 1;
        goto LABEL_29;
      }
    }
    else
    {
      id v13 = 0;
      if ([(LargeDayViewController *)self _selectEvents:0 animated:1 context:1])
      {
        goto LABEL_26;
      }
    }
    char v15 = 0;
    char v14 = 0;
    goto LABEL_29;
  }
  if (!v6) {
    goto LABEL_8;
  }
  double v16 = [(MainViewController *)self model];
  unsigned int v17 = [v16 selectedOccurrences];
  id v18 = +[NSSet setWithArray:v17];
  double v19 = +[NSSet setWithArray:v7];
  unsigned __int8 v20 = [v18 isEqualToSet:v19];

  if ((v20 & 1) == 0)
  {
LABEL_8:
    unsigned int v21 = [(LargeDayViewController *)self _selectEvents:v7 animated:1 context:0];
    long long v30 = 0u;
    long long v31 = 0u;
    long long v32 = 0u;
    long long v33 = 0u;
    id v13 = v7;
    id v22 = [v13 countByEnumeratingWithState:&v30 objects:v34 count:16];
    if (!v22)
    {
LABEL_30:

      goto LABEL_31;
    }
    id v23 = v22;
    uint64_t v24 = *(void *)v31;
LABEL_10:
    uint64_t v25 = 0;
    while (1)
    {
      if (*(void *)v31 != v24) {
        objc_enumerationMutation(v13);
      }
      if (-[LargeDayViewController _showsEventViewControllerAsFullScreen:](self, "_showsEventViewControllerAsFullScreen:", *(void *)(*((void *)&v30 + 1) + 8 * v25), (void)v30))
      {
        break;
      }
      if (v23 == (id)++v25)
      {
        id v23 = [v13 countByEnumeratingWithState:&v30 objects:v34 count:16];
        if (v23) {
          goto LABEL_10;
        }
        goto LABEL_30;
      }
    }

    if (!v21) {
      goto LABEL_31;
    }
    [(LargeDayViewController *)self _resetSplitView];
  }
  LOBYTE(v21) = 0;
LABEL_31:

  return v21;
}

- (BOOL)didSelectEvent:(id)a3 userInitiated:(BOOL)a4
{
  BOOL v4 = a4;
  if (a3)
  {
    id v10 = a3;
    id v6 = a3;
    BOOL v7 = +[NSArray arrayWithObjects:&v10 count:1];
  }
  else
  {
    BOOL v7 = 0;
  }
  BOOL v8 = -[LargeDayViewController didSelectEvents:userInitiated:](self, "didSelectEvents:userInitiated:", v7, v4, v10);

  return v8;
}

- (BOOL)_showsEventViewControllerAsFullScreen:(id)a3
{
  unsigned int v4 = [a3 isBirthday];
  if (v4)
  {
    id v5 = [(LargeDayViewController *)self view];
    BOOL v6 = EKUICurrentWindowInterfaceParadigm_RequiresPageSheetEventEditors();

    LOBYTE(v4) = v6;
  }
  return v4;
}

- (void)didShowEventWithoutShowingDetails:(id)a3
{
}

- (void)eventViewController:(id)a3 didCompleteWithAction:(int64_t)a4
{
  id v18 = a3;
  BOOL v6 = [(LargeDayViewController *)self shownEventEditViewController];

  if (v6) {
    [(LargeDayViewController *)self _editingDidCompleteWithAction:2 * (a4 == 2) changingDate:0 dismissEditor:1 editorToDismiss:0];
  }
  BOOL v7 = [v18 event];
  unsigned int v8 = [v7 refreshIfRefreshableAndNotify:1];
  id v9 = [v7 participationStatus];
  id v10 = [v7 eventStore];
  if ([v10 showDeclinedEvents])
  {
    unsigned int v11 = [v7 calendar];
    id v12 = [v11 source];
    BOOL v13 = [v12 sourceType] != (id)1;
  }
  else
  {
    BOOL v13 = 0;
  }

  if (a4 == 1) {
    unsigned int v14 = v8;
  }
  else {
    unsigned int v14 = 0;
  }
  char v15 = v9 != (id)3 || v13;
  if (v14 != 1 || (v15 & 1) == 0)
  {
    [v18 setDelegate:0];
    [(LargeDayViewController *)self _clearSplitViewNavigationController];
    double v16 = [(DayViewController *)self dayView];
    [v16 setCurrentEditor:0];

    [(DayViewController *)self _cleanupSelectedOccurrenceCloneViews];
    [(LargeDayViewController *)self setModelSelectedEvent:0];
    [(LargeDayViewController *)self _selectEvent:0 animated:0 context:0];
    char v17 = a4 == 2 ? v8 : 1;
    if ((v17 & 1) == 0) {
      *(&self->super._shouldRespondToApplicationDidBecomeActiveStateChange + 2) = 1;
    }
  }
}

- (BOOL)eventViewDelegateShouldHandlePresentationOfDeleteAlert:(id)a3
{
  return 1;
}

- (void)eventViewController:(id)a3 requestsDisplayOfDeleteAlert:(id)a4
{
  id v23 = a4;
  id v6 = a3;
  BOOL v7 = [v6 navigationController];
  unsigned int v8 = [v7 toolbar];
  [v8 bounds];
  double v10 = v9;
  double v12 = v11;
  double v14 = v13;
  double v16 = v15;
  char v17 = [v23 popoverPresentationController];
  [v17 setSourceRect:v10, v12, v14, v16];

  uint64_t v18 = [v6 navigationController];

  double v19 = [(id)v18 toolbar];
  unsigned __int8 v20 = [v23 popoverPresentationController];
  [v20 setSourceView:v19];

  unsigned int v21 = [v23 popoverPresentationController];
  [v21 setPermittedArrowDirections:2];

  id v22 = [(LargeDayViewController *)self presentedViewController];
  objc_opt_class();
  LOBYTE(v18) = objc_opt_isKindOfClass();

  if ((v18 & 1) == 0) {
    [(LargeDayViewController *)self presentViewController:v23 animated:0 completion:0];
  }
}

- (void)scrubberDidChangeSelectedDate:(id)a3
{
  v5.receiver = self;
  v5.super_class = (Class)LargeDayViewController;
  id v4 = a3;
  [(DayViewController *)&v5 scrubberDidChangeSelectedDate:v4];
  -[LargeDayViewController _selectedDateChangedToDate:](self, "_selectedDateChangedToDate:", v4, v5.receiver, v5.super_class);
}

- (void)dayViewDidChangeSelectedDate:(id)a3
{
  v5.receiver = self;
  v5.super_class = (Class)LargeDayViewController;
  id v4 = a3;
  [(DayViewController *)&v5 dayViewDidChangeSelectedDate:v4];
  -[LargeDayViewController _selectedDateChangedToDate:](self, "_selectedDateChangedToDate:", v4, v5.receiver, v5.super_class);
}

- (void)_selectedDateChangedToDate:(id)a3
{
  id v4 = a3;
  objc_super v5 = [(MainViewController *)self model];
  id v6 = [v5 calendar];
  BOOL v7 = [v6 timeZone];
  id v11 = +[EKCalendarDate calendarDateWithDate:v4 timeZone:v7];

  [(LargeDayViewController *)self updateNavigationBarDisplayedDateStringWithDate:v11];
  unsigned int v8 = [(LargeDayViewController *)self shownEventEditViewController];

  if (v8)
  {
    *(_DWORD *)((char *)&self->_dividerView + 2) = 0;
    [(LargeDayViewController *)self _dismissEditorAndSaveIfPossibleWhileChangingDate:1 animated:0];
  }
  double v9 = [(LargeDayViewController *)self navigationController];
  unsigned int v10 = [v9 extendedLaunchFinished];

  if (v10)
  {
    *(&self->super._shouldRespondToApplicationDidBecomeActiveStateChange + 2) = 0;
    [(LargeDayViewController *)self _beginAutoScrollingAutoSelectingWithContext:0];
  }
}

- (BOOL)_eventIntersectsDayViewControllerActiveDate:(id)a3
{
  id v4 = a3;
  objc_super v5 = v4;
  if (v4)
  {
    id v6 = [v4 calendar];
    if ([v6 isHidden])
    {
      BOOL v7 = 0;
    }
    else
    {
      unsigned int v8 = [v5 startCalendarDate];
      double v9 = [(DayViewController *)self day];
      unsigned int v10 = [v9 calendarDateForEndOfDay];
      if ([v8 compare:v10] == (id)-1)
      {
        id v11 = [v5 endCalendarDate];
        double v12 = [(DayViewController *)self day];
        double v13 = [v12 calendarDateForDay];
        BOOL v7 = [v11 compare:v13] == (id)1;
      }
      else
      {
        BOOL v7 = 0;
      }
    }
  }
  else
  {
    BOOL v7 = 0;
  }

  return v7;
}

- (BOOL)_eventEndDateIsPassed:(id)a3
{
  uint64_t v3 = [a3 endDate];
  id v4 = CUIKNowDate();
  BOOL v5 = [v3 compare:v4] == (id)-1;

  return v5;
}

- (void)_autoSelectEventWithAnimatedScroll:(BOOL)a3
{
  if (self->_userSelectedEmptySpace)
  {
    self->_selectedEventWasAutoSelected = 1;
    return;
  }
  BOOL v4 = a3;
  BOOL v5 = [(DayViewController *)self gestureController];
  unsigned __int8 v6 = [v5 dragGestureInProgress];

  if ((v6 & 1) == 0)
  {
    id v28 = [(DayViewController *)self day];
    if (*(void *)&self->_clearingSplitViewNavigationController
      && ![(LargeDayViewController *)self _isTransitioningTraitCollection])
    {
      *(&self->super._shouldRespondToApplicationDidBecomeActiveStateChange + 3) = 1;
      [(LargeDayViewController *)self setModelSelectedEvent:*(void *)&self->_clearingSplitViewNavigationController];
      char v17 = *(void **)&self->_clearingSplitViewNavigationController;
      *(void *)&self->_clearingSplitViewNavigationController = 0;
    }
    else
    {
      BOOL v7 = [(LargeDayViewController *)self shownEventEditViewController];
      unsigned int v8 = [v7 event];
      unsigned __int8 v9 = [v8 isNew];

      if (v9)
      {
LABEL_18:
        unsigned int v21 = [(LargeDayViewController *)self shownEventEditViewController];
        id v22 = [v21 event];
        unsigned __int8 v23 = [v22 isNew];

        if ((v23 & 1) == 0)
        {
          uint64_t v24 = [(MainViewController *)self model];
          uint64_t v25 = [v24 selectedOccurrences];
          [(LargeDayViewController *)self _showEventsWithoutChangingDate:v25 animated:v4 showComments:0 context:0];
        }
        BOOL v26 = [(LargeDayViewController *)self modelSelectedEvent];

        if (!v26)
        {
          BOOL v27 = [(DayViewController *)self dayView];
          [v27 scrollToNow:v4];
        }

        return;
      }
      unsigned int v10 = [(LargeDayViewController *)self modelSelectedEvent];

      if (v10)
      {
        id v11 = [(LargeDayViewController *)self modelSelectedEvent];
        unsigned int v12 = [(LargeDayViewController *)self _eventIntersectsDayViewControllerActiveDate:v11];

        if (v12)
        {
          double v13 = [(LargeDayViewController *)self modelSelectedEvent];
          unsigned int v14 = [(LargeDayViewController *)self _showsEventViewControllerAsFullScreen:v13];

          if (!v14) {
            goto LABEL_18;
          }
        }
        double v15 = [(LargeDayViewController *)self shownEventEditViewController];

        if (v15) {
          [(LargeDayViewController *)self _dismissEditorAndSaveIfPossibleWhileChangingDate:1 animated:0];
        }
      }
      *(&self->super._shouldRespondToApplicationDidBecomeActiveStateChange + 3) = 1;
      double v16 = [(DayViewController *)self dayView];
      char v17 = [v16 preferredEventsToSelectOnDate:v28];

      if ([v17 count] == (id)1)
      {
        uint64_t v18 = [v17 firstObject];
        unsigned int v19 = [(LargeDayViewController *)self _showsEventViewControllerAsFullScreen:v18];

        if (v19)
        {

          char v17 = 0;
        }
      }
      unsigned __int8 v20 = [(MainViewController *)self model];
      [v20 setSelectedOccurrences:v17];
    }
    goto LABEL_18;
  }
}

- (BOOL)shouldAlwaysPresentDeleteAlertsAsSheet
{
  return 1;
}

- (id)overrideCellColor
{
  return +[UIColor quaternarySystemFillColor];
}

- (void)showReminderDetail:(id)a3
{
  id v6 = a3;
  BOOL v4 = [(MainViewController *)self model];
  [v4 setSelectedOccurrence:v6];

  id v5 = [(LargeDayViewController *)self showDetailViewControllerForEvent:v6 context:0 animated:1];
}

- (BOOL)eventViewDelegateShouldHandlePresentationOfEditViewController:(id)a3
{
  uint64_t v3 = [(LargeDayViewController *)self view];
  BOOL v4 = EKUICurrentWindowInterfaceParadigm_RequiresPageSheetEventEditors();

  return v4;
}

- (BOOL)eventViewDelegateShouldCreateOwnEditViewController:(id)a3
{
  uint64_t v3 = [(LargeDayViewController *)self view];
  BOOL v4 = EKUICurrentWindowInterfaceParadigm_RequiresPageSheetEventEditors();

  return v4;
}

- (void)_setModal:(BOOL)a3
{
  if (*(&self->super._shouldRespondToApplicationDidBecomeActiveStateChange + 1) != a3)
  {
    BOOL v3 = a3;
    *(&self->super._shouldRespondToApplicationDidBecomeActiveStateChange + 1) = a3;
    id v4 = [(DayViewController *)self dayView];
    [v4 setDisableGestureDayChange:v3];
  }
}

- (void)showEditViewController:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [(LargeDayViewController *)self shownEventEditViewController];
  if (!v5) {
    goto LABEL_3;
  }
  id v6 = (void *)v5;
  BOOL v7 = [(LargeDayViewController *)self shownEventEditViewController];
  unsigned int v8 = [v7 event];
  unsigned __int8 v9 = [v4 event];

  if (v8 != v9)
  {
LABEL_3:
    *(_DWORD *)((char *)&self->_dividerView + 2) = 2;
    unsigned int v10 = [(LargeDayViewController *)self view];
    BOOL v11 = EKUICurrentWindowInterfaceParadigm_RequiresPageSheetEventEditors();

    if (v11)
    {
      if (v4)
      {
        [v4 setInternalEditViewDelegate:self];
LABEL_10:
        [v4 setModalPresentationDelegate:self];
        unsigned __int8 v20 = [(MainViewController *)self shownEventViewController];
        [v20 dismissViewControllerAnimated:0 completion:0];

        unsigned int v21 = [(LargeDayViewController *)self shownEventEditViewController];
        id v22 = [v21 presentingViewController];
        [v22 dismissViewControllerAnimated:0 completion:0];

        unsigned __int8 v23 = [(LargeDayViewController *)self navigationController];
        [v23 presentAdaptiveModalViewController:v4 animated:1 completion:0];

        goto LABEL_11;
      }
      uint64_t v18 = [(MainViewController *)self shownEventViewController];
      unsigned int v19 = [v18 event];

      if (v19
        || ([(LargeDayViewController *)self modelSelectedEvent],
            (unsigned int v19 = objc_claimAutoreleasedReturnValue()) != 0))
      {
        id v4 = +[EKEventEditViewController eventOrIntegrationViewControllerWithEvent:v19 creationMethod:0 eventEditViewDelegate:self];

        goto LABEL_10;
      }
      uint64_t v24 = kCalUILogHandle;
      if (os_log_type_enabled((os_log_t)kCalUILogHandle, OS_LOG_TYPE_ERROR))
      {
        int v25 = 136315138;
        BOOL v26 = "-[LargeDayViewController showEditViewController:]";
        _os_log_impl((void *)&_mh_execute_header, v24, OS_LOG_TYPE_ERROR, "[%s] couldn't get a valid event.", (uint8_t *)&v25, 0xCu);
      }
      id v4 = 0;
    }
    else
    {
      unsigned int v12 = [v4 event];
      [(LargeDayViewController *)self _selectEvent:v12 animated:0 context:0];

      [(LargeDayViewController *)self _customizeEventEditorForSplitViewAppearance:v4];
      [(LargeDayViewController *)self _clearSplitViewNavigationController];
      double v13 = [(LargeDayViewController *)self managedNavigationController];
      [v13 showViewController:v4 sender:self animated:1 completion:0];

      unsigned int v14 = [v4 toolbarItems];
      BOOL v15 = [v14 count] == 0;
      double v16 = [(LargeDayViewController *)self managedNavigationController];
      [v16 setToolbarHidden:v15];

      char v17 = [(DayViewController *)self dayView];
      [v17 setCurrentEditor:v4];

      [(LargeDayViewController *)self _setUpGesturesAndModalMode];
    }
  }
LABEL_11:
}

- (void)_customizeEventEditorForSplitViewAppearance:(id)a3
{
}

- (BOOL)eventViewControllerShouldHideDeleteButton
{
  double v2 = [(LargeDayViewController *)self view];
  BOOL v3 = EKUICurrentWindowInterfaceParadigm() == 8;

  return v3;
}

- (BOOL)eventViewControllerPresentationWantsHiddenNavBarForSingleController
{
  return 1;
}

- (void)eventViewController:(id)a3 requestsDisplayOfEditViewController:(id)a4 animated:(BOOL)a5
{
  id v8 = a4;
  *(&self->super._shouldRespondToApplicationDidBecomeActiveStateChange + 4) = 1;
  id v6 = [(LargeDayViewController *)self view];
  BOOL v7 = EKUICurrentWindowInterfaceParadigm_RequiresPageSheetEventEditors();

  if (v7) {
    [(LargeDayViewController *)self showEditViewController:v8];
  }
}

- (void)eventViewControllerWillBeginEditingEvent:(id)a3
{
  *(_DWORD *)((char *)&self->_dividerView + 2) = 2;
  id v4 = [(LargeDayViewController *)self view];
  BOOL v5 = EKUICurrentWindowInterfaceParadigm_RequiresPageSheetEventEditors();

  if (!v5)
  {
    id v6 = [(LargeDayViewController *)self modelSelectedEvent];

    if (v6) {
      [(LargeDayViewController *)self _setUpGesturesAndModalMode];
    }
  }
  id v8 = [(LargeDayViewController *)self navigationController];
  BOOL v7 = [v8 todayBarButtonItem];
  [v7 setEnabled:0];
}

- (BOOL)eventViewControllerEditButtonTemporarilyDisabled:(id)a3
{
  BOOL v3 = [(DayViewController *)self gestureController];
  unsigned __int8 v4 = [v3 dragGestureInProgress];

  return v4;
}

- (void)_setUpGesturesAndModalMode
{
  BOOL v3 = [(DayViewController *)self gestureController];
  unsigned __int8 v4 = [(LargeDayViewController *)self modelSelectedEvent];
  [v3 liftUpOccurrenceForEditingEvent:v4];

  [(LargeDayViewController *)self _setModal:1];
}

- (void)eventViewControllerDidBeginEditingEventWithEditViewController:(id)a3
{
  id v9 = a3;
  unsigned __int8 v4 = [(LargeDayViewController *)self view];
  BOOL v5 = EKUICurrentWindowInterfaceParadigm_RequiresPageSheetEventEditors();

  if (!v5)
  {
    [(LargeDayViewController *)self _customizeEventEditorForSplitViewAppearance:v9];
    id v6 = [(DayViewController *)self dayView];
    [v6 setCurrentEditor:v9];
  }
  BOOL v7 = [(LargeDayViewController *)self navigationController];
  id v8 = [v7 todayBarButtonItem];
  [v8 setEnabled:0];
}

- (void)eventEditViewController:(id)a3 didCompleteWithAction:(int64_t)a4
{
}

- (void)eventEditViewController:(id)a3 didCompleteWithAction:(int64_t)a4 completionHandler:(id)a5
{
  id v8 = a3;
  id v9 = a5;
  unsigned int v10 = [(LargeDayViewController *)self modelSelectedEvent];
  v19.receiver = self;
  v19.super_class = (Class)LargeDayViewController;
  [(DayViewController *)&v19 eventEditViewController:v8 didCompleteWithAction:a4 dismissController:0];
  if (!v10
    && *(_DWORD *)((char *)&self->_dividerView + 2) == 1
    && *(&self->super._shouldRespondToApplicationDidBecomeActiveStateChange + 2))
  {
    [(LargeDayViewController *)self setModelSelectedEvent:0];
  }
  [(LargeDayViewController *)self _editingDidCompleteWithAction:a4 changingDate:0 dismissEditor:1 editorToDismiss:v8];
  if (v9)
  {
    double v13 = _NSConcreteStackBlock;
    uint64_t v14 = 3221225472;
    BOOL v15 = sub_1000EAD44;
    double v16 = &unk_1001D2808;
    char v17 = self;
    id v18 = v9;
    BOOL v11 = objc_retainBlock(&v13);
  }
  else
  {
    BOOL v11 = 0;
  }
  unsigned int v12 = [(LargeDayViewController *)self managedNavigationController];
  [(LargeDayViewController *)self _splitViewNavigationController:v12 willShowViewController:0 animated:1 completion:v11];
}

- (id)calendarModel
{
  return self->super.super._model;
}

- (void)eventViewControllerWillFinishEditingEvent:(id)a3 deleted:(BOOL)a4
{
  if (a4)
  {
    BOOL v5 = [(MainViewController *)self shownEventViewController];
    [v5 setEditorHideTransition:0];

    uint64_t v6 = 2;
  }
  else
  {
    uint64_t v6 = 1;
  }

  [(LargeDayViewController *)self _editingDidCompleteWithAction:v6 changingDate:0 dismissEditor:0 editorToDismiss:0];
}

- (void)_editingDidCompleteWithAction:(int64_t)a3 changingDate:(BOOL)a4 dismissEditor:(BOOL)a5 editorToDismiss:(id)a6
{
  BOOL v6 = a5;
  id v10 = a6;
  BOOL v11 = a4 || *(&self->super._shouldRespondToApplicationDidBecomeActiveStateChange + 5);
  unsigned int v12 = [(DayViewController *)self gestureController];
  [v12 endForcedStart:0];

  double v13 = [(DayViewController *)self dayView];
  [v13 externallyEndedGestureDragging];

  uint64_t v14 = [(DayViewController *)self dayView];
  [v14 setGestureOccurrenceSuperview:0];

  [(LargeDayViewController *)self _setModal:0];
  BOOL v15 = [(DayViewController *)self _selectedOccurrenceFrontmostClonedViews];
  if ([v15 count] == (id)1)
  {
    double v16 = [v15 firstObject];
    if (v16)
    {
      char v17 = v16;
      [v16 setAlpha:1.0];
      [v17 setDimmed:0];
      [(LargeDayViewController *)self _adjustSelectedOccurrences];
    }
  }
  if (v6)
  {
    id v18 = [(LargeDayViewController *)self managedNavigationController];
    objc_super v19 = v18;
    if (v10)
    {
      unsigned __int8 v20 = [v10 presentingViewController];
    }
    else
    {
      id v22 = [(LargeDayViewController *)v18 presentedViewController];

      if (v22)
      {
LABEL_12:
        unsigned __int8 v23 = [(LargeDayViewController *)v19 presentedViewController];
        uint64_t v24 = objc_opt_class();

        if (v10
          || ([(LargeDayViewController *)self shownEventEditViewController],
              (uint64_t v29 = objc_claimAutoreleasedReturnValue()) != 0)
          && (long long v30 = (void *)v29, v31 = objc_opt_class(), v30, v24 == v31))
        {
          int v25 = [(LargeDayViewController *)self view];
          BOOL v26 = EKUICurrentWindowInterfaceParadigm_RequiresPageSheetEventEditors();

          if (v26)
          {
            int v27 = !v11;
            unsigned int v28 = 9;
          }
          else
          {
            long long v32 = [(MainViewController *)self shownEventViewController];
            if (v32) {
              int v27 = !v11;
            }
            else {
              int v27 = 0;
            }

            unsigned int v28 = 6;
          }
          if (v27) {
            uint64_t v33 = v28;
          }
          else {
            uint64_t v33 = 0;
          }
          self->_modalEditing = 1;
          v50[0] = _NSConcreteStackBlock;
          v50[1] = 3221225472;
          v50[2] = sub_1000EB294;
          v50[3] = &unk_1001D2740;
          v50[4] = self;
          [(LargeDayViewController *)v19 dismissViewControllerWithTransition:v33 completion:v50];
        }

        goto LABEL_27;
      }
      unsigned __int8 v20 = self;
    }
    unsigned int v21 = v20;

    objc_super v19 = v21;
    goto LABEL_12;
  }
LABEL_27:
  if (*(_DWORD *)((char *)&self->_dividerView + 2) == 2 && (unint64_t)a3 <= 2) {
    *(_DWORD *)((char *)&self->_dividerView + 2) = dword_1001C1690[a3];
  }
  double v34 = [(LargeDayViewController *)self modelSelectedEvent];

  if (!v34) {
    goto LABEL_38;
  }
  unsigned int v35 = [(LargeDayViewController *)self modelSelectedEvent];
  unsigned __int8 v36 = [v35 isNew];

  if (!a3 && (v36 & 1) != 0) {
    goto LABEL_38;
  }
  char v37 = a3 == 2 || v11;
  if (v37)
  {
    if (a3 == 2)
    {
LABEL_38:
      if (*(_DWORD *)((char *)&self->_dividerView + 2))
      {
        [(DayViewController *)self _cleanupSelectedOccurrenceCloneViews];
        [(LargeDayViewController *)self setModelSelectedEvent:0];
      }
    }
LABEL_40:
    *(&self->super._shouldRespondToApplicationDidBecomeActiveStateChange + 2) = 1;
    goto LABEL_41;
  }
  if (*(_DWORD *)((char *)&self->_dividerView + 2) != 2) {
    goto LABEL_40;
  }
  uint64_t v41 = [(MainViewController *)self shownEventViewController];
  if (!v41) {
    goto LABEL_56;
  }
  int v42 = (void *)v41;
  BOOL v43 = [(MainViewController *)self shownEventViewController];
  unsigned __int8 v44 = [v43 event];
  id v45 = [(LargeDayViewController *)self modelSelectedEvent];
  unsigned __int8 v46 = [v44 isEqual:v45];

  if (v46)
  {
    if (a3) {
      goto LABEL_41;
    }
    BOOL v47 = [(MainViewController *)self shownEventViewController];
    [v47 setNeedsReload];
  }
  else
  {
LABEL_56:
    BOOL v47 = [(LargeDayViewController *)self modelSelectedEvent];
    [(LargeDayViewController *)self showEvent:v47 animated:1 showMode:1 context:0];
  }

LABEL_41:
  id v38 = [(DayViewController *)self dayView];
  [v38 setCurrentEditor:0];

  id v39 = [(LargeDayViewController *)self modelSelectedEvent];
  if (!v11)
  {
    switch(a3)
    {
      case 0:
        id v40 = [(DayViewController *)self dayView];
        [v40 editorDidCancelEditingEvent:v39];
        goto LABEL_53;
      case 2:
        id v40 = [(DayViewController *)self dayView];
        [v40 editorDidDeleteEvent:v39];
        goto LABEL_53;
      case 1:
        id v40 = [(DayViewController *)self dayView];
        [v40 editorDidSaveEvent:v39];
LABEL_53:

        break;
    }
  }
  id v48 = [(LargeDayViewController *)self navigationController];
  char v49 = [v48 todayBarButtonItem];
  [v49 setEnabled:1];
}

- (void)eventViewControllerModifiedEventWithoutEditing:(id)a3
{
  id v4 = [a3 event];
  [(LargeDayViewController *)self setModelSelectedEvent:v4];
}

- (BOOL)shouldHandleGestureCommits
{
  return 1;
}

- (void)handleGestureCommittingOccurrence:(id)a3
{
  id v4 = a3;
  [(LargeDayViewController *)self showEvent:v4 animated:0 showMode:1 context:0];
  objc_initWeak(&location, self);
  objc_initWeak(&from, *(id *)((char *)&self->_lastEventShowed + 2));
  id v8 = _NSConcreteStackBlock;
  uint64_t v9 = 3221225472;
  id v10 = sub_1000EB4A0;
  BOOL v11 = &unk_1001D51C8;
  objc_copyWeak(&v12, &location);
  objc_copyWeak(&v13, &from);
  BOOL v5 = objc_retainBlock(&v8);
  BOOL v6 = [(LargeDayViewController *)self shownEventEditViewController];

  if (v6)
  {
    ((void (*)(void ***))v5[2])(v5);
  }
  else
  {
    [*(id *)((char *)&self->_lastEventShowed + 2) setHidden:1];
    BOOL v7 = [(LargeDayViewController *)self managedNavigationController];
    [v7 enqueueBlock:v5];
  }
  objc_destroyWeak(&v13);
  objc_destroyWeak(&v12);
  objc_destroyWeak(&from);
  objc_destroyWeak(&location);
}

- (BOOL)comparePointersOfArray:(id)a3 withArray:(id)a4
{
  unint64_t v5 = (unint64_t)a3;
  unint64_t v6 = (unint64_t)a4;
  BOOL v7 = (void *)v6;
  if (!(v5 | v6)) {
    goto LABEL_2;
  }
  if ((v5 == 0) != (v6 == 0) || (id v9 = [(id)v5 count], v9 != objc_msgSend(v7, "count")))
  {
    BOOL v8 = 0;
    goto LABEL_12;
  }
  if ([(id)v5 count])
  {
    unint64_t v10 = 0;
    do
    {
      BOOL v11 = [(id)v5 objectAtIndex:v10];
      id v12 = [v7 objectAtIndex:v10];

      BOOL v8 = v11 == v12;
      if (!v8) {
        break;
      }
      ++v10;
    }
    while (v10 < (unint64_t)[(id)v5 count]);
  }
  else
  {
LABEL_2:
    BOOL v8 = 1;
  }
LABEL_12:

  return v8;
}

- (void)dataReloadedWithTrigger:(int)a3
{
  [(DayViewController *)self _cleanupSelectedOccurrenceCloneViews];
  unint64_t v5 = [(LargeDayViewController *)self modelSelectedEvent];

  if (!v5) {
    return;
  }
  unint64_t v6 = [(DayViewController *)self dayView];
  BOOL v7 = [(LargeDayViewController *)self modelSelectedEvent];
  id v23 = [v6 occurrenceViewForEvent:v7];

  BOOL v8 = [v23 occurrences];
  if (v23)
  {
    id v9 = [(LargeDayViewController *)self modelSelectedEvents];
    unsigned int v10 = [(LargeDayViewController *)self comparePointersOfArray:v8 withArray:v9];

    if (v10) {
      [(LargeDayViewController *)self setModelSelectedEvents:v8];
    }
  }
  BOOL v11 = [(LargeDayViewController *)self shownEventEditViewController];
  id v12 = v11;
  BOOL v16 = !v11
     || ([v11 event],
         id v13 = objc_claimAutoreleasedReturnValue(),
         [(LargeDayViewController *)self modelSelectedEvent],
         uint64_t v14 = objc_claimAutoreleasedReturnValue(),
         unsigned int v15 = [v13 isEqual:v14],
         v14,
         v13,
         !v15)
     || *(_DWORD *)((char *)&self->_dividerView + 2) == 2;
  char v17 = [(MainViewController *)self shownExpandedReminderStackViewController];
  id v18 = v17;
  if (!v17)
  {
    if (!v16) {
      goto LABEL_21;
    }
    goto LABEL_20;
  }
  objc_super v19 = [v17 events];
  unsigned int v20 = [(LargeDayViewController *)self comparePointersOfArray:v8 withArray:v19];

  if (v20)
  {
    if (*(_DWORD *)((char *)&self->_dividerView + 2) != 2 || !v16) {
      goto LABEL_21;
    }
    goto LABEL_20;
  }
  if (v16)
  {
LABEL_20:
    id v22 = [(LargeDayViewController *)self modelSelectedEvents];
    [(LargeDayViewController *)self _selectEvents:v22 animated:0 context:2 * (a3 == 1)];
  }
LABEL_21:
}

- (void)_eventStoreChanged:(id)a3
{
  id v4 = [a3 userInfo];
  unint64_t v5 = [v4 objectForKeyedSubscript:EKEventStoreChangeTypeUserInfoKey];
  id v6 = [v5 unsignedIntegerValue];

  if (v6 != (id)2)
  {
    uint64_t v7 = [(LargeDayViewController *)self modelSelectedEvent];
    if (v7)
    {
      BOOL v8 = (void *)v7;
      id v9 = [(LargeDayViewController *)self modelSelectedEvent];
      unsigned __int8 v10 = [v9 refreshIfRefreshableAndNotify:1];

      if ((v10 & 1) == 0)
      {
        [(LargeDayViewController *)self setModelSelectedEvent:0];
        [(LargeDayViewController *)self _autoSelectEventWithAnimatedScroll:1];
      }
    }
  }
}

- (void)displayedOccurrencesChangedWithTrigger:(int)a3
{
  self->_userInteractedWithSplitviewPane = 1;
  -[LargeDayViewController dataReloadedWithTrigger:](self, "dataReloadedWithTrigger:");
  id v7 = [(LargeDayViewController *)self view];
  unint64_t v5 = [v7 window];
  if (v5)
  {
    int v6 = *((unsigned __int8 *)&self->super._shouldRespondToApplicationDidBecomeActiveStateChange + 6);

    if (v6)
    {
      [(LargeDayViewController *)self _beginAutoScrollingAutoSelectingWithContext:2 * (a3 == 1)];
    }
  }
  else
  {
  }
}

- (void)_beginAutoScrollingAutoSelectingWithContext:(int)a3
{
  uint64_t v3 = *(void *)&a3;
  unint64_t v5 = [(LargeDayViewController *)self modelSelectedEvent];
  unsigned int v6 = [(LargeDayViewController *)self _eventIntersectsDayViewControllerActiveDate:v5];

  if (!*(&self->super._shouldRespondToApplicationDidBecomeActiveStateChange + 2))
  {
    if (!v6 || *(void *)&self->_clearingSplitViewNavigationController) {
      goto LABEL_4;
    }
    uint64_t v9 = [(MainViewController *)self shownEventViewController];
    if (!v9) {
      goto LABEL_13;
    }
    unsigned __int8 v10 = (void *)v9;
    BOOL v11 = [(MainViewController *)self shownEventViewController];
    id v12 = [v11 event];
    id v13 = [(LargeDayViewController *)self modelSelectedEvent];
    unsigned int v14 = [v12 isEqual:v13];

    if (v14)
    {
      unsigned int v15 = [(LargeDayViewController *)self modelSelectedEvent];
      [(LargeDayViewController *)self _selectEvent:v15 animated:0 context:v3];
    }
    else
    {
LABEL_13:
      uint64_t v16 = [(MainViewController *)self shownExpandedReminderStackViewController];
      if (!v16) {
        goto LABEL_4;
      }
      char v17 = (void *)v16;
      id v18 = [(MainViewController *)self shownExpandedReminderStackViewController];
      objc_super v19 = [v18 events];
      unsigned int v20 = +[NSSet setWithArray:v19];
      unsigned int v21 = [(LargeDayViewController *)self modelSelectedEvents];
      id v22 = +[NSSet setWithArray:v21];
      unsigned int v23 = [v20 isEqualToSet:v22];

      if (!v23)
      {
LABEL_4:
        [(LargeDayViewController *)self _autoSelectEventWithAnimatedScroll:*((unsigned __int8 *)&self->super._shouldRespondToApplicationDidBecomeActiveStateChange + 6)];
        goto LABEL_5;
      }
      unsigned int v15 = [(LargeDayViewController *)self modelSelectedEvents];
      [(LargeDayViewController *)self _selectEvents:v15 animated:0 context:v3];
    }
  }
LABEL_5:
  id v7 = [(LargeDayViewController *)self managedNavigationController];
  BOOL v8 = [v7 _contentUnavailableConfiguration];

  if (v8)
  {
    [(LargeDayViewController *)self updateNoContentConfiguration];
  }
}

- (void)updateNoContentConfiguration
{
  uint64_t v3 = [(MainViewController *)self model];
  id v4 = [v3 selectedOccurrences];
  id v5 = [v4 count];

  if (v5)
  {
    unsigned int v6 = +[NSBundle bundleForClass:objc_opt_class()];
    id v7 = [v6 localizedStringForKey:@"num_selected_events_large_day_view" value:&stru_1001D6918 table:0];
    +[NSString localizedStringWithFormat:](NSString, "localizedStringWithFormat:", v7, v5);
    id v15 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    BOOL v8 = [(DayViewController *)self dayView];
    unsigned int v9 = [v8 currentDayContainsOccurrences];

    unsigned __int8 v10 = +[NSBundle bundleForClass:objc_opt_class()];
    unsigned int v6 = v10;
    if (v9) {
      CFStringRef v11 = @"No Event Selected";
    }
    else {
      CFStringRef v11 = @"No Events";
    }
    id v15 = [v10 localizedStringForKey:v11 value:&stru_1001D6918 table:0];
  }

  id v12 = +[UIContentUnavailableConfiguration emptyConfiguration];
  [v12 setText:v15];
  id v13 = [(LargeDayViewController *)self managedNavigationController];
  [v13 _setContentUnavailableConfiguration:v12];

  unsigned int v14 = [(LargeDayViewController *)self managedNavigationController];
  [v14 setNavigationBarHidden:1 animated:0];
}

- (void)clearNoContentConfiguration
{
  id v2 = [(LargeDayViewController *)self managedNavigationController];
  [v2 _setContentUnavailableConfiguration:0];
}

- (BOOL)performModalDialogsIfNeededWithContinue:(id)a3
{
  id v4 = (void (**)(void))a3;
  id v5 = [(LargeDayViewController *)self shownEventEditViewController];
  if (v5
    && (BOOL modalEditing = self->_modalEditing, v5, !modalEditing)
    && ([(LargeDayViewController *)self shownEventEditViewController],
        id v7 = objc_claimAutoreleasedReturnValue(),
        unsigned int v8 = [v7 willPresentDialogOnSave],
        v7,
        v8))
  {
    BOOL v9 = 1;
    self->_BOOL modalEditing = 1;
    unsigned __int8 v10 = [(LargeDayViewController *)self shownEventEditViewController];
    [v10 completeAndSaveWithContinueBlock:v4];

    self->_BOOL modalEditing = 0;
  }
  else
  {
    v4[2](v4);
    BOOL v9 = 0;
  }

  return v9;
}

- (id)shownEventEditViewController
{
  v5.receiver = self;
  v5.super_class = (Class)LargeDayViewController;
  id v2 = [(MainViewController *)&v5 shownEventEditViewController];
  objc_opt_class();
  if (objc_opt_isKindOfClass() & 1) != 0 && ([v2 presentedOverWholeApp]) {
    id v3 = 0;
  }
  else {
    id v3 = v2;
  }

  return v3;
}

- (void)_dismissEditorAndSaveIfPossibleWhileChangingDate:(BOOL)a3 animated:(BOOL)a4
{
  BOOL v4 = a4;
  BOOL v5 = a3;
  id v7 = [(LargeDayViewController *)self shownEventEditViewController];
  if (!v7 || self->_modalEditing) {
    goto LABEL_23;
  }
  id v24 = v7;
  if ([v7 hasUnsavedChanges])
  {
    unsigned __int8 v8 = 0;
  }
  else
  {
    BOOL v9 = [v24 event];
    unsigned __int8 v8 = [v9 existsInStore];
  }
  if ([v24 willPresentDialogOnSave] & 1) != 0 || (v8)
  {
    self->_BOOL modalEditing = 1;
    [v24 setIgnoreUnsavedChanges:1];
    [v24 cancelEditing];
    [(LargeDayViewController *)self _editingDidCompleteWithAction:0 changingDate:v5 dismissEditor:1 editorToDismiss:0];
    [v24 setIgnoreUnsavedChanges:0];
LABEL_22:
    id v7 = v24;
    goto LABEL_23;
  }
  if (v4)
  {
    uint64_t v10 = [(MainViewController *)self shownEventViewController];
    if (v10)
    {
      CFStringRef v11 = (void *)v10;
      uint64_t v12 = [(LargeDayViewController *)self modelSelectedEvent];
      if (v12)
      {
        id v13 = (void *)v12;
        unsigned int v14 = [(MainViewController *)self shownEventViewController];
        id v15 = [v14 event];
        uint64_t v16 = [v15 uniqueId];
        char v17 = [(LargeDayViewController *)self modelSelectedEvent];
        id v18 = [v17 uniqueId];
        unsigned __int8 v23 = [v16 isEqualToString:v18];

        if (v23)
        {
          char v19 = 1;
          goto LABEL_16;
        }
      }
      else
      {
      }
    }
  }
  unsigned int v20 = [(MainViewController *)self shownEventViewController];
  [v20 setEditorHideTransition:0];

  char v19 = 0;
LABEL_16:
  BOOL v21 = 1;
  if (!v5) {
    BOOL v21 = *(&self->super._shouldRespondToApplicationDidBecomeActiveStateChange + 5);
  }
  *(&self->super._shouldRespondToApplicationDidBecomeActiveStateChange + 5) = v21;
  self->_BOOL modalEditing = 1;
  if (*(&self->super._shouldRespondToApplicationDidBecomeActiveStateChange + 5)) {
    *(_DWORD *)((char *)&self->_dividerView + 2) = 0;
  }
  [v24 completeAndSaveWithContinueBlock:0];
  id v7 = v24;
  *(&self->super._shouldRespondToApplicationDidBecomeActiveStateChange + 5) = 0;
  self->_BOOL modalEditing = 0;
  if ((v19 & 1) == 0)
  {
    id v22 = [(MainViewController *)self shownEventViewController];
    [v22 setEditorHideTransition:6];

    goto LABEL_22;
  }
LABEL_23:
}

- (BOOL)showDetachAlertOnDraggingGestureEnd
{
  return 0;
}

- (void)didBeginMovingOccurrenceWithGesture
{
  id v8 = [(DayViewController *)self _selectedOccurrenceFrontmostClonedViews];
  if ([v8 count] == (id)1)
  {
    id v3 = [(DayViewController *)self _selectedOccurrenceViews];
    id v4 = [v3 count];

    if (v4 == (id)1)
    {
      BOOL v5 = [v8 firstObject];
      [v5 setAlpha:0.0];

      unsigned int v6 = [(DayViewController *)self _selectedOccurrenceViews];
      id v7 = [v6 firstObject];
      [v7 setAlpha:1.0];
    }
  }
}

- (void)eventViewControllerDidReceiveEditUserInteraction:(id)a3
{
  *(&self->super._shouldRespondToApplicationDidBecomeActiveStateChange + 4) = 1;
}

- (BOOL)enqueueableManagedNavigationControllerShouldEnqueuePresentationDismissals:(id)a3
{
  return 1;
}

- (void)handleCloseKeyCommand
{
  id v3 = [(LargeDayViewController *)self shownEventEditViewController];
  if (v3)
  {
  }
  else
  {
    id v4 = [(MainViewController *)self shownEventViewController];

    if (v4)
    {
      [(LargeDayViewController *)self _selectEvent:0 animated:1 context:0];
    }
  }
}

- (void)_selectedOccurrencesChanged:(id)a3
{
  id v4 = [(MainViewController *)self model];
  BOOL v5 = [v4 selectedOccurrences];
  unsigned int v6 = +[NSSet setWithArray:v5];

  [(DayViewController *)self _cleanupSelectedOccurrenceCloneViewsRespectingModelSelected];
  id v7 = [(DayViewController *)self gestureController];
  id v8 = [v7 event];
  unsigned __int8 v9 = [v6 containsObject:v8];

  if ((v9 & 1) == 0)
  {
    uint64_t v10 = [(DayViewController *)self gestureController];
    [v10 endForcedStart:0];
  }
  long long v40 = 0u;
  long long v41 = 0u;
  long long v38 = 0u;
  long long v39 = 0u;
  id v11 = v6;
  id v12 = [v11 countByEnumeratingWithState:&v38 objects:v43 count:16];
  if (v12)
  {
    id v13 = v12;
    uint64_t v14 = *(void *)v39;
    while (2)
    {
      for (i = 0; i != v13; i = (char *)i + 1)
      {
        if (*(void *)v39 != v14) {
          objc_enumerationMutation(v11);
        }
        if (![*(id *)(*((void *)&v38 + 1) + 8 * i) isReminderIntegrationEvent])
        {
          char v16 = 0;
          goto LABEL_13;
        }
      }
      id v13 = [v11 countByEnumeratingWithState:&v38 objects:v43 count:16];
      if (v13) {
        continue;
      }
      break;
    }
  }
  char v16 = 1;
LABEL_13:

  id v17 = [v11 count];
  if ((v16 & 1) == 0 && v17 != (id)1 && !self->_modalEditing)
  {
    [(LargeDayViewController *)self _selectEvent:0 animated:0 context:0];
LABEL_20:
    [(LargeDayViewController *)self updateNoContentConfiguration];
    goto LABEL_22;
  }
  id v18 = [(MainViewController *)self shownEventViewController];
  if (v18
    || ([(LargeDayViewController *)self shownEventEditViewController],
        (id v18 = objc_claimAutoreleasedReturnValue()) != 0))
  {

    goto LABEL_22;
  }
  char v19 = [(MainViewController *)self shownExpandedReminderStackViewController];

  if (!v19) {
    goto LABEL_20;
  }
LABEL_22:
  id v20 = [v11 mutableCopy];
  long long v34 = 0u;
  long long v35 = 0u;
  long long v36 = 0u;
  long long v37 = 0u;
  BOOL v21 = [(DayViewController *)self _selectedOccurrenceViews];
  id v22 = [v21 countByEnumeratingWithState:&v34 objects:v42 count:16];
  if (v22)
  {
    id v23 = v22;
    uint64_t v24 = *(void *)v35;
    do
    {
      for (j = 0; j != v23; j = (char *)j + 1)
      {
        if (*(void *)v35 != v24) {
          objc_enumerationMutation(v21);
        }
        BOOL v26 = *(void **)(*((void *)&v34 + 1) + 8 * (void)j);
        int v27 = [v26 occurrence];

        if (v27)
        {
          unsigned int v28 = [v26 occurrence];
          [v20 removeObject:v28];
        }
      }
      id v23 = [v21 countByEnumeratingWithState:&v34 objects:v42 count:16];
    }
    while (v23);
  }

  uint64_t v29 = [(DayViewController *)self gestureController];
  long long v30 = [v29 event];

  if (v30)
  {
    uint64_t v31 = [(DayViewController *)self gestureController];
    long long v32 = [v31 event];
    [v20 removeObject:v32];
  }
  uint64_t v33 = [v20 allObjects];
  [(DayViewController *)self _setUpSelectedOccurrenceViewsWithEvents:v33 animated:1 autoScroll:0 resetSelection:0];
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)((char *)&self->_navigationWrapperView + 2), 0);
  objc_storeStrong((id *)((char *)&self->_lastEventShowed + 2), 0);

  objc_storeStrong((id *)&self->_clearingSplitViewNavigationController, 0);
}

@end