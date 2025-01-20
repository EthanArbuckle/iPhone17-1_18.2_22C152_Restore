@interface LargeWeekViewController
+ (BOOL)_shouldForwardViewWillTransitionToSize;
- (BOOL)_tooFarToAnimate:(id)a3;
- (BOOL)allowsOverriddenRightNavigationBarItems;
- (BOOL)allowsOverriddenToolbarItems;
- (BOOL)enableEventCreationGesture;
- (BOOL)eventEditorPopoverActiveWhileDraggingForEventGestureController:(id)a3;
- (BOOL)eventGestureController:(id)a3 didCommitOccurrence:(id)a4 toDate:(double)a5 isAllDay:(BOOL)a6 span:(int64_t)a7;
- (BOOL)eventGestureController:(id)a3 shouldAllowShortLiftDelay:(id)a4;
- (BOOL)eventViewControllerPresentationWantsHiddenNavBarForSingleController;
- (BOOL)eventViewControllerShouldHideInlineEditButton;
- (BOOL)eventViewControllerShouldShowInlineEditButtonForInvitations:(id)a3;
- (BOOL)eventViewControllerShowsInlinePreview;
- (BOOL)eventViewControllerUseMinimalMode:(id)a3;
- (BOOL)eventViewDelegateShouldCreateOwnEditViewController:(id)a3;
- (BOOL)eventViewDelegateShouldHandlePresentationOfDeleteAlert:(id)a3;
- (BOOL)eventViewDelegateShouldHandlePresentationOfEditViewController:(id)a3;
- (BOOL)isEventAbleToShowPopover:(id)a3;
- (BOOL)isReadyToShowViewControllersInsideEnqueueableManagedNavigationController:(id)a3;
- (BOOL)isWaitingForBackgroundLoadingOfSelectedEventOccurrenceView;
- (BOOL)mainViewControllerCanChangeSelectedDate;
- (BOOL)mainViewControllerCanChangeSelectedEvent;
- (BOOL)presentationControllerShouldDismiss:(id)a3;
- (BOOL)suppressInitialScrollToCurrentTime;
- (Class)managedNavigationControllerType;
- (LargeWeekViewController)initWithModel:(id)a3 window:(id)a4;
- (NSOperationQueue)showEventDetailsOperationQueue;
- (TimerOperation)navigationThrottleOperation;
- (double)eventGestureController:(id)a3 heightForAllDayOccurrenceView:(id)a4;
- (double)headerVerticalOffset;
- (double)minimumHourScale;
- (double)scrollToDisplayedDateAnimated:(BOOL)a3;
- (id)_occurrenceViewForPopoverSource;
- (id)calendarModel;
- (id)pasteboardManagerForEventEditViewController:(id)a3;
- (id)pushedDayViewControllerWithDate:(id)a3 animated:(BOOL)a4;
- (id)pushedListViewControllerWithDate:(id)a3 animated:(BOOL)a4;
- (int)editorHideTransition;
- (int)editorShowTransition;
- (int64_t)adaptivePresentationStyleForPresentationController:(id)a3 traitCollection:(id)a4;
- (int64_t)intendedSizeClass;
- (int64_t)presentationStyleOverrideForChildViewControllers;
- (unint64_t)supportedInterfaceOrientations;
- (void)_closeEventPresentationAnimated:(BOOL)a3;
- (void)_closeEventPresentationAnimated:(BOOL)a3 cleanSelectionState:(BOOL)a4 completion:(id)a5;
- (void)_displayEventDetailsViewControllerForEvent:(id)a3 showComment:(BOOL)a4 context:(id)a5 completion:(id)a6;
- (void)_displayEventDetailsViewControllerForSelectedEventWithOccurrenceView:(id)a3 showComments:(BOOL)a4 context:(id)a5 forceShowEditor:(BOOL)a6 creationMethod:(unint64_t)a7 completion:(id)a8;
- (void)_displayEventDetailsViewControllerForSelectedEventWithOccurrenceView:(id)a3 showComments:(BOOL)a4 creationMethod:(unint64_t)a5;
- (void)_presentDetailViewControllerAsPageSheet:(id)a3;
- (void)_presentEventViewController:(id)a3 forOccurrenceView:(id)a4 animated:(BOOL)a5 showComments:(BOOL)a6;
- (void)_presentEventViewController:(id)a3 forOccurrenceView:(id)a4 animated:(BOOL)a5 showComments:(BOOL)a6 completion:(id)a7;
- (void)_presentationControllerDidDismissPopover:(id)a3 cleanSelectionState:(BOOL)a4;
- (void)_rePresentEditPopoverFromTargetView:(id)a3;
- (void)_resizeInterfaceForWindowSize:(CGSize)a3;
- (void)_scrollEventIntoViewAndRequestPresentPopoverForEvent:(id)a3;
- (void)_selectNextEventInForwardDirection:(BOOL)a3;
- (void)_setSelectedEvents:(id)a3;
- (void)_showEditorForEvent:(id)a3;
- (void)_showMonthOverlayInCellAtOffset:(double)a3 animated:(BOOL)a4;
- (void)_showNextDateComponentUnitInForwardDirection:(BOOL)a3 animated:(BOOL)a4;
- (void)_weekViewDidEndScrolling:(id)a3;
- (void)createdNewEventUsingCreationGesture:(id)a3;
- (void)emptySpaceClickedOnDate:(id)a3;
- (void)enqueuableNavigationController:(id)a3 requestsDeferShowViewControllerUntilReady:(id)a4;
- (void)enqueueableManagedNavigationController:(id)a3 requestsConfigurationOfPropertiesForPopoverPresentationController:(id)a4 completion:(id)a5;
- (void)eventEditViewController:(id)a3 didCompleteWithAction:(int64_t)a4;
- (void)eventEditViewController:(id)a3 didCompleteWithAction:(int64_t)a4 completionHandler:(id)a5;
- (void)eventGestureController:(id)a3 didCancelEditingOccurrence:(id)a4 fadedOut:(BOOL)a5;
- (void)eventGestureController:(id)a3 didSetUpAtDate:(double)a4 isAllDay:(BOOL)a5;
- (void)eventGestureController:(id)a3 didSingleTapOccurrence:(id)a4 shouldExtendSelection:(BOOL)a5;
- (void)eventViewController:(id)a3 didCompleteWithAction:(int64_t)a4;
- (void)eventViewController:(id)a3 requestsDisplayOfDeleteAlert:(id)a4;
- (void)eventViewController:(id)a3 requestsDisplayOfEditViewController:(id)a4 animated:(BOOL)a5;
- (void)eventViewController:(id)a3 requestsShowEvent:(id)a4;
- (void)eventViewControllerInlineEditButtonWasTapped:(id)a3;
- (void)eventViewControllerNextButtonWasTapped:(id)a3;
- (void)eventViewControllerPreviousButtonWasTapped:(id)a3;
- (void)eventViewControllerWillBeginEditingEvent:(id)a3;
- (void)eventViewControllerWillFinishEditingEvent:(id)a3 deleted:(BOOL)a4;
- (void)handleCloseKeyCommand;
- (void)navigateToNextDateComponentUnitAnimated:(BOOL)a3;
- (void)navigateToNextSelectableItem;
- (void)navigateToPreviousDateComponentUnitAnimated:(BOOL)a3;
- (void)navigateToPreviousSelectableItem;
- (void)overlayCalendarDidChange;
- (void)pasteboardManager:(id)a3 beginEditingEvent:(id)a4;
- (void)popoverPresentationController:(id)a3 willRepositionPopoverToRect:(CGRect *)a4 inView:(id *)a5;
- (void)presentationControllerDidDismiss:(id)a3;
- (void)selectDate:(id)a3 animated:(BOOL)a4;
- (void)setIsWaitingForBackgroundLoadingOfSelectedEventOccurrenceView:(BOOL)a3;
- (void)setNavigationThrottleOperation:(id)a3;
- (void)setShowEventDetailsOperationQueue:(id)a3;
- (void)showEvent:(id)a3 animated:(BOOL)a4 showMode:(unint64_t)a5 context:(id)a6;
- (void)showEvent:(id)a3 animated:(BOOL)a4 showMode:(unint64_t)a5 context:(id)a6 completion:(id)a7;
- (void)showEvents:(id)a3 animated:(BOOL)a4 showMode:(unint64_t)a5 context:(id)a6;
- (void)showNextOccurrenceOfSelectableItem;
- (void)showPreviousOccurrenceOfSelectableItem;
- (void)showReminderDetail:(id)a3;
- (void)showViewController:(id)a3 sender:(id)a4 animated:(BOOL)a5 completion:(id)a6;
- (void)snapTargetScrollOffset:(CGPoint *)a3 withVelocity:(CGPoint)a4;
- (void)updateNavigationBarDisplayedDateString;
- (void)updatePalette:(id)a3;
- (void)updateVisibleRects;
- (void)viewDidAppear:(BOOL)a3;
- (void)viewDidDisappear:(BOOL)a3;
- (void)viewDidLoad;
- (void)viewWillAppear:(BOOL)a3;
- (void)viewWillDisappear:(BOOL)a3;
- (void)viewWillTransitionToSize:(CGSize)a3 withTransitionCoordinator:(id)a4;
@end

@implementation LargeWeekViewController

- (LargeWeekViewController)initWithModel:(id)a3 window:(id)a4
{
  v9.receiver = self;
  v9.super_class = (Class)LargeWeekViewController;
  v4 = [(WeekViewController *)&v9 initWithModel:a3 window:a4];
  v5 = v4;
  if (v4)
  {
    [(WeekViewController *)v4 setDisplaysDatesSnappedToWeekBoundaries:1];
    id v6 = objc_alloc_init((Class)NSOperationQueue);
    [(LargeWeekViewController *)v5 setShowEventDetailsOperationQueue:v6];

    v7 = [(LargeWeekViewController *)v5 showEventDetailsOperationQueue];
    [v7 setMaxConcurrentOperationCount:1];
  }
  return v5;
}

- (unint64_t)supportedInterfaceOrientations
{
  v3 = [(MainViewController *)self shownEventEditViewController];

  if (v3)
  {
    v4 = [(MainViewController *)self shownEventEditViewController];
    id v5 = [v4 supportedInterfaceOrientations];

    return (unint64_t)v5;
  }
  else
  {
    v7.receiver = self;
    v7.super_class = (Class)LargeWeekViewController;
    return [(LargeWeekViewController *)&v7 supportedInterfaceOrientations];
  }
}

- (void)viewDidLoad
{
  v9.receiver = self;
  v9.super_class = (Class)LargeWeekViewController;
  [(WeekViewController *)&v9 viewDidLoad];
  v3 = [(WeekViewController *)self displayedDate];

  if (!v3)
  {
    v4 = CUIKTodayDate();
    id v5 = [(WeekViewController *)self model];
    id v6 = [v5 calendar];
    objc_super v7 = [v6 timeZone];
    v8 = +[EKCalendarDate calendarDateWithDate:v4 timeZone:v7];
    [(WeekViewController *)self setDisplayedDate:v8];
  }
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
  if ([(LargeWeekViewController *)self isViewLoaded])
  {
    v8 = [(LargeWeekViewController *)self view];
    objc_super v9 = [v8 window];

    if (v9)
    {
      if (width >= height) {
        [(WeekViewController *)self setRotatingToLandscape:1];
      }
      else {
        [(WeekViewController *)self setRotatingToPortrait:1];
      }
      self->_hasAlreadyAdjustedVisibleRects = 0;
      if (v7) {
        [v7 targetTransform];
      }
      else {
        memset(&v34, 0, sizeof(v34));
      }
      if (CGAffineTransformIsIdentity(&v34))
      {
        v10 = [(WeekViewController *)self weekScroller];
        [v10 bounds];
        double v12 = v11;

        if (width >= v12) {
          double v12 = width;
        }
        long long v32 = 0u;
        long long v33 = 0u;
        long long v30 = 0u;
        long long v31 = 0u;
        v13 = [(WeekViewController *)self visibleWeeks];
        id v14 = [v13 countByEnumeratingWithState:&v30 objects:v35 count:16];
        if (v14)
        {
          id v15 = v14;
          uint64_t v16 = *(void *)v31;
          do
          {
            for (i = 0; i != v15; i = (char *)i + 1)
            {
              if (*(void *)v31 != v16) {
                objc_enumerationMutation(v13);
              }
              v18 = *(void **)(*((void *)&v30 + 1) + 8 * i);
              v19 = [(WeekViewController *)self weekScroller];
              [v19 bounds];
              double v21 = v20;
              v22 = [(WeekViewController *)self weekScroller];
              [v22 bounds];
              double v24 = v23;

              [v18 adjustForVisibleRect:0.0, v21, v12, v24];
            }
            id v15 = [v13 countByEnumeratingWithState:&v30 objects:v35 count:16];
          }
          while (v15);
        }

        self->_hasAlreadyAdjustedVisibleRects = 1;
      }
      if (v7)
      {
        if (+[ApplicationTester testingSessionStarted])
        {
          v25 = +[UIApplication sharedApplication];
          v29[0] = _NSConcreteStackBlock;
          v29[1] = 3221225472;
          v29[2] = sub_1000DA078;
          v29[3] = &unk_1001D2740;
          v29[4] = self;
          [v25 installCACommitCompletionBlock:v29];
        }
        v28[0] = _NSConcreteStackBlock;
        v28[1] = 3221225472;
        v28[2] = sub_1000DA0D8;
        v28[3] = &unk_1001D4E18;
        v28[4] = self;
        *(double *)&v28[5] = width;
        *(double *)&v28[6] = height;
        v27[0] = _NSConcreteStackBlock;
        v27[1] = 3221225472;
        v27[2] = sub_1000DA14C;
        v27[3] = &unk_1001D2E40;
        v27[4] = self;
        [v7 animateAlongsideTransition:v28 completion:v27];
      }
      else
      {
        -[LargeWeekViewController _resizeInterfaceForWindowSize:](self, "_resizeInterfaceForWindowSize:", width, height);
        [(WeekViewController *)self setRotatingToPortrait:0];
        [(WeekViewController *)self setRotatingToLandscape:0];
        self->_hasAlreadyAdjustedVisibleRects = 0;
        [(LargeWeekViewController *)self updateVisibleRects];
      }
      v26.receiver = self;
      v26.super_class = (Class)LargeWeekViewController;
      -[WeekViewController viewWillTransitionToSize:withTransitionCoordinator:](&v26, "viewWillTransitionToSize:withTransitionCoordinator:", v7, width, height);
    }
  }
}

- (void)_resizeInterfaceForWindowSize:(CGSize)a3
{
  if (!self->_isTransformingInterfaceSize)
  {
    if (-[WeekViewController usePortraitLayoutForSize:](self, "usePortraitLayoutForSize:", a3.width, a3.height)) {
      uint64_t v4 = 1;
    }
    else {
      uint64_t v4 = 4;
    }
    self->_isTransformingInterfaceSize = 1;
    id v5 = [(WeekViewController *)self timeView];
    id v6 = [v5 timeView];
    [v6 setOrientation:v4];

    id v7 = [(WeekViewController *)self timeView];
    [v7 sizeToFit];

    long long v38 = 0u;
    long long v39 = 0u;
    long long v36 = 0u;
    long long v37 = 0u;
    v8 = [(WeekViewController *)self visibleWeeks];
    id v9 = [v8 countByEnumeratingWithState:&v36 objects:v41 count:16];
    if (v9)
    {
      id v10 = v9;
      uint64_t v11 = *(void *)v37;
      do
      {
        for (i = 0; i != v10; i = (char *)i + 1)
        {
          if (*(void *)v37 != v11) {
            objc_enumerationMutation(v8);
          }
          v13 = *(void **)(*((void *)&v36 + 1) + 8 * i);
          id v14 = [v13 weekView];
          [v14 setOrientation:v4];

          [v13 setNeedsLayout];
        }
        id v10 = [v8 countByEnumeratingWithState:&v36 objects:v41 count:16];
      }
      while (v10);
    }

    long long v34 = 0u;
    long long v35 = 0u;
    long long v32 = 0u;
    long long v33 = 0u;
    id v15 = [(WeekViewController *)self reusableViews];
    id v16 = [v15 countByEnumeratingWithState:&v32 objects:v40 count:16];
    if (v16)
    {
      id v17 = v16;
      uint64_t v18 = *(void *)v33;
      do
      {
        for (j = 0; j != v17; j = (char *)j + 1)
        {
          if (*(void *)v33 != v18) {
            objc_enumerationMutation(v15);
          }
          double v20 = *(void **)(*((void *)&v32 + 1) + 8 * (void)j);
          double v21 = [v20 weekView];
          [v21 setOrientation:v4];

          [v20 setNeedsLayout];
        }
        id v17 = [v15 countByEnumeratingWithState:&v32 objects:v40 count:16];
      }
      while (v17);
    }

    [(WeekViewController *)self resizeWeekGroupsIfNeededForOrientation:v4];
    v22 = [(LargeWeekViewController *)self view];
    [v22 setNeedsLayout];

    double v23 = [(LargeWeekViewController *)self view];
    double v24 = [v23 superview];

    if (v24) {
      [(WeekViewController *)self adjustVisibleAllDayOccurrenceLabelsAnimated:0];
    }
    v25 = +[UIApplication sharedApplication];
    unsigned int v26 = [v25 isSuspended];

    v27 = [(WeekViewController *)self _selectedOccurrenceViews];
    if ([v27 count])
    {
      BOOL v28 = 0;
    }
    else
    {
      v29 = [(WeekViewController *)self eventGestureController];
      long long v30 = [v29 draggingView];
      BOOL v28 = v30 == 0;
    }
    if ((v26 | v28))
    {
      self->_isTransformingInterfaceSize = 0;
    }
    else
    {
      block[0] = _NSConcreteStackBlock;
      block[1] = 3221225472;
      block[2] = sub_1000DA56C;
      block[3] = &unk_1001D2740;
      block[4] = self;
      dispatch_async((dispatch_queue_t)&_dispatch_main_q, block);
    }
  }
}

- (void)updateVisibleRects
{
  if (!self->_hasAlreadyAdjustedVisibleRects)
  {
    v2.receiver = self;
    v2.super_class = (Class)LargeWeekViewController;
    [(WeekViewController *)&v2 updateVisibleRects];
  }
}

- (void)viewDidAppear:(BOOL)a3
{
  v11.receiver = self;
  v11.super_class = (Class)LargeWeekViewController;
  [(WeekViewController *)&v11 viewDidAppear:a3];
  self->_viewDidAppear = 1;
  uint64_t v4 = (void *)kCalUILogHandle;
  if (os_log_type_enabled((os_log_t)kCalUILogHandle, OS_LOG_TYPE_INFO))
  {
    id v5 = v4;
    id v6 = (objc_class *)objc_opt_class();
    id v7 = NSStringFromClass(v6);
    v8 = [(WeekViewController *)self displayedDate];
    id v9 = [v8 date];
    *(_DWORD *)buf = 138543618;
    v13 = v7;
    __int16 v14 = 2114;
    id v15 = v9;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_INFO, "[UserStateLog] State -> %{public}@ viewDidAppear. date = %{public}@", buf, 0x16u);
  }
  [(WeekViewController *)self currentScrollViewXOffset];
  -[LargeWeekViewController _showMonthOverlayInCellAtOffset:animated:](self, "_showMonthOverlayInCellAtOffset:animated:", 0);
  [(LargeWeekViewController *)self updateNavigationBarDisplayedDateString];
  if (self->_eventToPresentOnAppear)
  {
    -[LargeWeekViewController _scrollEventIntoViewAndRequestPresentPopoverForEvent:](self, "_scrollEventIntoViewAndRequestPresentPopoverForEvent:");
    eventToPresentOnAppear = self->_eventToPresentOnAppear;
    self->_eventToPresentOnAppear = 0;
  }
}

- (void)viewDidDisappear:(BOOL)a3
{
  v4.receiver = self;
  v4.super_class = (Class)LargeWeekViewController;
  [(LargeWeekViewController *)&v4 viewDidDisappear:a3];
  self->_viewDidAppear = 0;
}

- (void)viewWillAppear:(BOOL)a3
{
  v8.receiver = self;
  v8.super_class = (Class)LargeWeekViewController;
  [(WeekViewController *)&v8 viewWillAppear:a3];
  objc_super v4 = +[NSNotificationCenter defaultCenter];
  [v4 addObserver:self selector:"_weekViewDidEndScrolling:" name:@"WeekViewController_ScrollDidEndAnimationNotification" object:0];
  id v5 = [(LargeWeekViewController *)self view];
  [v5 bounds];
  -[LargeWeekViewController _resizeInterfaceForWindowSize:](self, "_resizeInterfaceForWindowSize:", v6, v7);
}

- (void)viewWillDisappear:(BOOL)a3
{
  BOOL v3 = a3;
  id v5 = +[NSNotificationCenter defaultCenter];
  [v5 removeObserver:self name:@"WeekViewController_ScrollDidEndAnimationNotification" object:0];
  [v5 removeObserver:self name:EKDayOccurrenceViewDidEndSelectionNotification object:0];
  [(LargeWeekViewController *)self _closeEventPresentationAnimated:0];
  double v6 = [(LargeWeekViewController *)self navigationController];
  double v7 = [v6 navigationBar];
  [v7 _setHidesShadow:0];

  v8.receiver = self;
  v8.super_class = (Class)LargeWeekViewController;
  [(WeekViewController *)&v8 viewWillDisappear:v3];
}

- (void)showViewController:(id)a3 sender:(id)a4 animated:(BOOL)a5 completion:(id)a6
{
  BOOL v7 = a5;
  id v10 = a3;
  id v11 = a4;
  id v12 = a6;
  self->_suppressInitialScrollToCurrentTime = 1;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    [v10 setPreferModalPresentation:0];
    goto LABEL_9;
  }
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v13 = v10;
    [v13 setMinimalMode:[self eventViewControllerUseMinimalMode:v13]];
LABEL_8:

    goto LABEL_9;
  }
  objc_opt_class();
  if (objc_opt_isKindOfClass() & 1) != 0 || (objc_opt_class(), (objc_opt_isKindOfClass()))
  {
    id v13 = [(LargeWeekViewController *)self view];
    self->_isPresentingPageSheet = EKUICurrentWindowInterfaceParadigm_SupportsPopoversForEventEditing() ^ 1;
    goto LABEL_8;
  }
LABEL_9:
  v14.receiver = self;
  v14.super_class = (Class)LargeWeekViewController;
  [(MainViewController *)&v14 showViewController:v10 sender:v11 animated:v7 completion:v12];
}

- (int64_t)intendedSizeClass
{
  return 2;
}

- (BOOL)suppressInitialScrollToCurrentTime
{
  return self->_suppressInitialScrollToCurrentTime;
}

- (Class)managedNavigationControllerType
{
  BOOL v3 = [(LargeWeekViewController *)self view];
  BOOL v4 = EKUICurrentWindowInterfaceParadigm_RequiresPageSheetEventEditors();

  if (v4)
  {
    id v5 = objc_opt_class();
  }
  else
  {
    v7.receiver = self;
    v7.super_class = (Class)LargeWeekViewController;
    id v5 = [(MainViewController *)&v7 managedNavigationControllerType];
  }

  return (Class)v5;
}

- (int64_t)presentationStyleOverrideForChildViewControllers
{
  BOOL v3 = [(LargeWeekViewController *)self view];
  if (EKUICurrentHeightSizeClassIsRegular())
  {

    return 7;
  }
  else
  {
    BOOL isPresentingPageSheet = self->_isPresentingPageSheet;

    if (isPresentingPageSheet) {
      return 1;
    }
    else {
      return 7;
    }
  }
}

- (BOOL)allowsOverriddenRightNavigationBarItems
{
  return 0;
}

- (BOOL)allowsOverriddenToolbarItems
{
  return 0;
}

- (void)showEvent:(id)a3 animated:(BOOL)a4 showMode:(unint64_t)a5 context:(id)a6 completion:(id)a7
{
  id v11 = a3;
  id v12 = a6;
  id v13 = a7;
  objc_super v14 = (void *)kCalUILogHandle;
  if (os_log_type_enabled((os_log_t)kCalUILogHandle, OS_LOG_TYPE_DEBUG))
  {
    id v15 = v14;
    id v16 = [v11 title];
    id v17 = [v11 startDate];
    uint64_t v18 = CUIKStringForDate();
    *(_DWORD *)buf = 138412546;
    long long v39 = v16;
    __int16 v40 = 2112;
    v41 = v18;
    _os_log_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_DEBUG, "LargeWeekViewController showEvent:animated:showMode:context:completion asked to show event named '%@' starting on '%@'.", buf, 0x16u);
  }
  v35[0] = _NSConcreteStackBlock;
  v35[1] = 3221225472;
  v35[2] = sub_1000DB234;
  v35[3] = &unk_1001D3038;
  id v19 = v13;
  id v36 = v19;
  double v20 = objc_retainBlock(v35);
  double v21 = [(LargeWeekViewController *)self presentedViewController];
  unsigned int v22 = [v21 isBeingDismissed];

  if (v22)
  {
    double v23 = kCalUILogHandle;
    if (os_log_type_enabled((os_log_t)kCalUILogHandle, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v23, OS_LOG_TYPE_INFO, "LargeWeekViewController showEvent:animated:showMode:context:completion unable to show event due to dismissing presentation.", buf, 2u);
    }
    goto LABEL_8;
  }
  if (a5 == 3)
  {
    [(LargeWeekViewController *)self _showEditorForEvent:v11];
LABEL_8:
    ((void (*)(void *))v20[2])(v20);
    goto LABEL_19;
  }
  id v37 = v11;
  double v24 = +[NSArray arrayWithObjects:&v37 count:1];
  [(LargeWeekViewController *)self _setSelectedEvents:v24];

  BOOL v25 = a5 == 2;
  unsigned int v26 = [(WeekViewController *)self occurrenceViewForEvent:v11];
  v27 = v26;
  if (!v26
    || ([v26 frame], CGRectIsEmpty(v42))
    || ([v27 frame], CGRectIsNull(v43))
    || ([v11 startDate],
        BOOL v28 = objc_claimAutoreleasedReturnValue(),
        unsigned __int8 v31 = [(WeekViewController *)self dateIsVisible:v28],
        v28,
        (v31 & 1) == 0))
  {
    v29 = kCalUILogHandle;
    if (os_log_type_enabled((os_log_t)kCalUILogHandle, OS_LOG_TYPE_DEBUG))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v29, OS_LOG_TYPE_DEBUG, "LargeWeekViewController showEvent:animated:showMode:context:completion got an invalid occurrenceView. Setting up for deferred popover presentation.", buf, 2u);
    }
    self->_shouldPresentEventCommentsForSelectedOccurrence = v25;
    [(LargeWeekViewController *)self setIsWaitingForBackgroundLoadingOfSelectedEventOccurrenceView:1];
    long long v30 = [v11 startCalendarDate];
    [(LargeWeekViewController *)self selectDate:v30 animated:0];

    ((void (*)(void *))v20[2])(v20);
  }
  else if (a5)
  {
    [(LargeWeekViewController *)self _displayEventDetailsViewControllerForEvent:v11 showComment:a5 == 2 context:v12 completion:v19];
  }
  else
  {
    v32[0] = _NSConcreteStackBlock;
    v32[1] = 3221225472;
    v32[2] = sub_1000DB24C;
    v32[3] = &unk_1001D3388;
    v32[4] = self;
    id v33 = v11;
    long long v34 = v20;
    [(LargeWeekViewController *)self _closeEventPresentationAnimated:0 cleanSelectionState:0 completion:v32];
  }
LABEL_19:
}

- (void)showEvents:(id)a3 animated:(BOOL)a4 showMode:(unint64_t)a5 context:(id)a6
{
  id v8 = a3;
  id v9 = [(LargeWeekViewController *)self presentedViewController];
  unsigned int v10 = [v9 isBeingDismissed];

  if (v10)
  {
    id v11 = kCalUILogHandle;
    if (os_log_type_enabled((os_log_t)kCalUILogHandle, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)double v24 = 0;
      _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_INFO, "LargeWeekViewController showEvent:animated:showMode:context:completion unable to show event due to dismissing presentation.", v24, 2u);
    }
  }
  else
  {
    id v12 = [v8 firstObject];
    BOOL v25 = v12;
    id v13 = +[NSArray arrayWithObjects:&v25 count:1];
    [(LargeWeekViewController *)self _setSelectedEvents:v13];

    BOOL v14 = a5 == 2;
    id v15 = [v8 firstObject];
    id v16 = [(WeekViewController *)self occurrenceViewForEvent:v15];

    if (!v16) {
      goto LABEL_9;
    }
    [v16 frame];
    if (CGRectIsEmpty(v26)) {
      goto LABEL_9;
    }
    [v16 frame];
    if (CGRectIsNull(v27)
      || ([v8 firstObject],
          id v17 = objc_claimAutoreleasedReturnValue(),
          [v17 startDate],
          uint64_t v18 = objc_claimAutoreleasedReturnValue(),
          unsigned __int8 v19 = [(WeekViewController *)self dateIsVisible:v18],
          v18,
          v17,
          (v19 & 1) == 0))
    {
LABEL_9:
      unsigned int v22 = kCalUILogHandle;
      if (os_log_type_enabled((os_log_t)kCalUILogHandle, OS_LOG_TYPE_DEBUG))
      {
        *(_WORD *)double v24 = 0;
        _os_log_impl((void *)&_mh_execute_header, v22, OS_LOG_TYPE_DEBUG, "LargeWeekViewController showEvent:animated:showMode:context:completion got an invalid occurrenceView. Setting up for deferred popover presentation.", v24, 2u);
      }
      self->_shouldPresentEventCommentsForSelectedOccurrence = v14;
      [(LargeWeekViewController *)self setIsWaitingForBackgroundLoadingOfSelectedEventOccurrenceView:1];
      id v21 = [v8 firstObject];
      double v23 = [v21 startCalendarDate];
      [(LargeWeekViewController *)self selectDate:v23 animated:0];
    }
    else
    {
      BOOL v20 = a5 == 2;
      id v21 = [objc_alloc((Class)EKExpandedReminderStackViewController) initWithEvents:v8 delegate:self];
      [(LargeWeekViewController *)self _presentEventViewController:v21 forOccurrenceView:v16 animated:1 showComments:v20 completion:0];
    }
  }
}

- (void)showEvent:(id)a3 animated:(BOOL)a4 showMode:(unint64_t)a5 context:(id)a6
{
}

- (void)showReminderDetail:(id)a3
{
  id v4 = a3;
  id v10 = (id)objc_opt_new();
  [v10 setObject:&__kCFBooleanFalse forKeyedSubscript:EKUIEventDetailsContext_AllowsCalendarPreview];
  [v10 setObject:&__kCFBooleanFalse forKeyedSubscript:EKUIEventDetailsContext_CalendarPreviewIsInlineDayView];
  id v5 = [(LargeWeekViewController *)self view];
  double v6 = +[NSNumber numberWithInt:EKUICurrentWindowInterfaceParadigm() == 8];
  [v10 setObject:v6 forKeyedSubscript:EKUIEventDetailsContext_MinimalMode];

  objc_super v7 = [(LargeWeekViewController *)self view];
  id v8 = +[EKEventViewController eventDetailViewControllerWithEvent:v4 delegate:self context:v10 allowInlinePreview:0 previewInline:0 minimalMode:EKUICurrentWindowInterfaceParadigm() == 8];

  id v9 = [(WeekViewController *)self occurrenceViewForEvent:v4];

  [(LargeWeekViewController *)self _presentEventViewController:v8 forOccurrenceView:v9 animated:1 showComments:0 completion:0];
}

- (BOOL)_tooFarToAnimate:(id)a3
{
  id v4 = a3;
  id v5 = [(WeekViewController *)self displayedDate];
  uint64_t v6 = [v5 date];
  if (v6)
  {
    objc_super v7 = (void *)v6;
    id v8 = [v4 date];

    if (!v8)
    {
      BOOL v18 = 1;
      goto LABEL_10;
    }
    id v5 = CUIKCalendar();
    id v9 = [v4 date];
    [v5 rangeOfUnit:512 inUnit:4096 forDate:v9];
    unint64_t v11 = v10;

    id v12 = [(WeekViewController *)self displayedDate];
    id v13 = [v12 date];
    BOOL v14 = [v4 date];
    id v15 = [v5 components:16 fromDate:v13 toDate:v14 options:0];
    int64_t v16 = (unint64_t)[v15 day] / v11;

    if (v16 >= 0) {
      unint64_t v17 = v16;
    }
    else {
      unint64_t v17 = -v16;
    }
    BOOL v18 = v17 > 3;
  }
  else
  {
    BOOL v18 = 1;
  }

LABEL_10:
  return v18;
}

- (void)selectDate:(id)a3 animated:(BOOL)a4
{
  BOOL v4 = a4;
  id v6 = a3;
  objc_super v7 = [(WeekViewController *)self model];
  [v7 setSelectedDate:v6];

  if (v6)
  {
    [(WeekViewController *)self setDisplayedDate:v6 animated:v4 & ~[(LargeWeekViewController *)self _tooFarToAnimate:v6]];
  }
  else
  {
    id v8 = kCalUILogHandle;
    if (os_log_type_enabled((os_log_t)kCalUILogHandle, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)id v9 = 0;
      _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_ERROR, "LargeWeekViewController selectDate:animated: was called with a nil date.", v9, 2u);
    }
  }
}

- (void)updateNavigationBarDisplayedDateString
{
  uint64_t v3 = [(WeekViewController *)self displayedDate];
  if (v3)
  {
    BOOL v4 = (void *)v3;
    id v5 = [(LargeWeekViewController *)self navigationController];
    id v6 = [v5 topMainViewControllerContainer];
    objc_super v7 = [v6 currentChildViewController];

    if (v7 == self)
    {
      id v9 = [(LargeWeekViewController *)self navigationController];
      id v8 = [(WeekViewController *)self displayedDate];
      [v9 setNavBarStringFromDate:v8 includeMonth:1 includeYear:1];
    }
  }
}

- (BOOL)eventViewControllerShowsInlinePreview
{
  return 0;
}

- (BOOL)mainViewControllerCanChangeSelectedEvent
{
  objc_super v2 = [(MainViewController *)self shownEventEditViewController];
  BOOL v3 = v2 == 0;

  return v3;
}

- (BOOL)mainViewControllerCanChangeSelectedDate
{
  BOOL v3 = [(MainViewController *)self shownEventEditViewController];
  if (v3)
  {
    BOOL v4 = 0;
  }
  else
  {
    id v5 = [(MainViewController *)self shownEventViewController];
    BOOL v4 = v5 == 0;
  }
  return v4;
}

- (void)navigateToNextSelectableItem
{
}

- (void)navigateToPreviousSelectableItem
{
}

- (void)_selectNextEventInForwardDirection:(BOOL)a3
{
  id v5 = [(LargeWeekViewController *)self navigationThrottleOperation];

  if (!v5)
  {
    id v6 = +[TimerOperation operationWithTimeInterval:0.1];
    [(LargeWeekViewController *)self setNavigationThrottleOperation:v6];

    objc_initWeak(location, self);
    v30[0] = _NSConcreteStackBlock;
    v30[1] = 3221225472;
    v30[2] = sub_1000DBE6C;
    v30[3] = &unk_1001D41E8;
    objc_copyWeak(&v31, location);
    objc_super v7 = [(LargeWeekViewController *)self navigationThrottleOperation];
    [v7 setCompletionBlock:v30];

    objc_destroyWeak(&v31);
    objc_destroyWeak(location);
  }
  id v8 = [(LargeWeekViewController *)self navigationThrottleOperation];
  if (([v8 isExecuting] & 1) == 0)
  {
    id v9 = [(LargeWeekViewController *)self navigationThrottleOperation];
    unsigned __int8 v10 = [v9 isFinished];

    if (v10) {
      return;
    }
    unint64_t v11 = +[NSOperationQueue mainQueue];
    id v12 = [(LargeWeekViewController *)self navigationThrottleOperation];
    [v11 addOperation:v12];

    id v13 = (void *)kCalUILogHandle;
    if (os_log_type_enabled((os_log_t)kCalUILogHandle, OS_LOG_TYPE_DEBUG))
    {
      BOOL v14 = v13;
      id v15 = [(LargeWeekViewController *)self navigationThrottleOperation];
      LODWORD(location[0]) = 138412290;
      *(id *)((char *)location + 4) = v15;
      _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_DEBUG, "#NavigationThrottle Added navigation throttle operation: %@", (uint8_t *)location, 0xCu);
    }
    int64_t v16 = [(LargeWeekViewController *)self showEventDetailsOperationQueue];
    [v16 cancelAllOperations];

    unint64_t v17 = (void *)kCalUILogHandle;
    if (os_log_type_enabled((os_log_t)kCalUILogHandle, OS_LOG_TYPE_DEBUG))
    {
      BOOL v18 = v17;
      unsigned __int8 v19 = [(LargeWeekViewController *)self showEventDetailsOperationQueue];
      LODWORD(location[0]) = 138412290;
      *(id *)((char *)location + 4) = v19;
      _os_log_impl((void *)&_mh_execute_header, v18, OS_LOG_TYPE_DEBUG, "#ShowDetails Canceled all show event details timer operations in queue: %@", (uint8_t *)location, 0xCu);
    }
    id v8 = [(WeekViewController *)self _visibleOccurrenceViewsWithOptions:0];
    id v20 = objc_alloc((Class)EKDayOccurrenceViewIterator);
    id v21 = [(WeekViewController *)self model];
    unsigned int v22 = [v21 selectedOccurrence];
    id v23 = [v20 initWithOccurrenceViews:v8 selectedEvent:v22];

    if (a3) {
      [v23 next];
    }
    else {
    double v24 = [v23 previous];
    }
    BOOL v25 = v24;
    if (v24)
    {
      CGRect v26 = [v24 occurrence];
      v27[0] = _NSConcreteStackBlock;
      v27[1] = 3221225472;
      v27[2] = sub_1000DBFF0;
      v27[3] = &unk_1001D28A8;
      id v28 = v25;
      v29 = self;
      [(LargeWeekViewController *)self showEvent:v26 animated:1 showMode:0 context:0 completion:v27];
    }
  }
}

- (void)showNextOccurrenceOfSelectableItem
{
  BOOL v3 = [(MainViewController *)self shownEventEditViewController];

  if (v3) {
    return;
  }
  BOOL v4 = [(MainViewController *)self shownEventViewController];

  if (v4)
  {
    id v8 = [(MainViewController *)self shownEventViewController];
    [(LargeWeekViewController *)self eventViewControllerNextButtonWasTapped:v8];
LABEL_6:
    objc_super v7 = v8;
    goto LABEL_7;
  }
  id v5 = [(WeekViewController *)self model];
  id v6 = [v5 selectedOccurrence];
  id v8 = [v6 nextOccurrence];

  objc_super v7 = v8;
  if (v8)
  {
    [(LargeWeekViewController *)self showEvent:v8 animated:1 showMode:1 context:0];
    goto LABEL_6;
  }
LABEL_7:
}

- (void)showPreviousOccurrenceOfSelectableItem
{
  BOOL v3 = [(MainViewController *)self shownEventEditViewController];

  if (v3) {
    return;
  }
  BOOL v4 = [(MainViewController *)self shownEventViewController];

  if (v4)
  {
    id v8 = [(MainViewController *)self shownEventViewController];
    [(LargeWeekViewController *)self eventViewControllerPreviousButtonWasTapped:v8];
LABEL_6:
    objc_super v7 = v8;
    goto LABEL_7;
  }
  id v5 = [(WeekViewController *)self model];
  id v6 = [v5 selectedOccurrence];
  id v8 = [v6 previousOccurrence];

  objc_super v7 = v8;
  if (v8)
  {
    [(LargeWeekViewController *)self showEvent:v8 animated:1 showMode:1 context:0];
    goto LABEL_6;
  }
LABEL_7:
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
  [(LargeWeekViewController *)self _closeEventPresentationAnimated:0];
  objc_super v7 = [(WeekViewController *)self model];
  id v10 = [v7 selectedDate];

  if (v5) {
    uint64_t v8 = 1;
  }
  else {
    uint64_t v8 = -1;
  }
  id v9 = [v10 calendarDateByAddingWeeks:v8];
  [(LargeWeekViewController *)self selectDate:v9 animated:v4];
}

- (void)_weekViewDidEndScrolling:(id)a3
{
  id v4 = a3;
  BOOL v5 = [v4 userInfo];
  id v6 = [v5 objectForKey:@"WeekViewController_ScrollDidEndAnimationRangeStartKey"];

  objc_super v7 = [v4 userInfo];

  uint64_t v8 = [v7 objectForKey:@"WeekViewController_ScrollDidEndAnimationRangeEndKey"];

  id v9 = (void *)kCalUILogHandle;
  if (os_log_type_enabled((os_log_t)kCalUILogHandle, OS_LOG_TYPE_DEBUG))
  {
    id v10 = v9;
    unint64_t v11 = CUIKStringForDate();
    id v12 = CUIKStringForDate();
    *(_DWORD *)buf = 138412546;
    v49 = v11;
    __int16 v50 = 2112;
    v51 = v12;
    _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEBUG, "LargeWeekViewController _weekViewDidEndScrolling: %@ to %@", buf, 0x16u);
  }
  id v13 = [(WeekViewController *)self model];
  BOOL v14 = [v13 selectedOccurrence];

  id v15 = [(MainViewController *)self shownEventEditViewController];
  int64_t v16 = v15;
  if (v15
    && ([v15 presentingViewController],
        unint64_t v17 = objc_claimAutoreleasedReturnValue(),
        v17,
        !v17))
  {
    if (v6 && v8)
    {
      [v6 timeIntervalSinceReferenceDate];
      double v35 = v34;
      [v8 timeIntervalSinceReferenceDate];
      double v37 = v36;
      long long v38 = [v14 startCalendarDate];
      [v38 absoluteTime];
      double v40 = v39;

      v41 = [v14 endCalendarDate];
      [v41 absoluteTime];
      double v43 = v42;

      if (v40 >= v35 && v43 <= v37) {
        goto LABEL_36;
      }
      if (v40 <= v37 && v43 >= v37 || (v43 < v37 ? (BOOL v44 = v43 < v35) : (BOOL v44 = 0), v40 <= v35 && !v44))
      {
LABEL_36:
        v45 = [v16 event];
        v46 = [(WeekViewController *)self occurrenceViewForEvent:v45];

        if (v46) {
          [(LargeWeekViewController *)self _presentEventViewController:v16 forOccurrenceView:v46 animated:0 showComments:0];
        }
      }
    }
  }
  else if ([(LargeWeekViewController *)self isWaitingForBackgroundLoadingOfSelectedEventOccurrenceView]&& v14&& v6&& v8)
  {
    [v6 timeIntervalSinceReferenceDate];
    double v19 = v18;
    [v8 timeIntervalSinceReferenceDate];
    double v21 = v20;
    unsigned int v22 = [v14 startCalendarDate];
    [v22 absoluteTime];
    double v24 = v23;

    BOOL v25 = [v14 endCalendarDate];
    [v25 absoluteTime];
    double v27 = v26;

    if (v24 >= v19 && v27 <= v21) {
      goto LABEL_18;
    }
    if (v24 <= v21 && v27 >= v21 || (v27 < v21 ? (BOOL v28 = v27 < v19) : (BOOL v28 = 0), v24 <= v19 && !v28))
    {
LABEL_18:
      v29 = [(WeekViewController *)self occurrenceViewForEvent:v14];

      if (!v29)
      {
        long long v30 = kCalUILogHandle;
        if (os_log_type_enabled((os_log_t)kCalUILogHandle, OS_LOG_TYPE_DEBUG))
        {
          *(_WORD *)buf = 0;
          _os_log_impl((void *)&_mh_execute_header, v30, OS_LOG_TYPE_DEBUG, "LargeWeekViewController _weekViewDidEndScrolling: scrolling ended, and selected occurrence should be within displayed time span, but occurrence view still not present. Reloading data and laying out.", buf, 2u);
        }
        [(WeekViewController *)self reloadData];
        id v31 = [(LargeWeekViewController *)self view];
        [v31 layoutIfNeeded];
      }
      long long v32 = kCalUILogHandle;
      if (os_log_type_enabled((os_log_t)kCalUILogHandle, OS_LOG_TYPE_DEBUG))
      {
        *(_WORD *)buf = 0;
        _os_log_impl((void *)&_mh_execute_header, v32, OS_LOG_TYPE_DEBUG, "LargeWeekViewController _weekViewDidEndScrolling: scrolled to a week that includes the selected event. Calling showEvent.", buf, 2u);
      }
      dispatch_time_t v33 = dispatch_time(0, 150000000);
      block[0] = _NSConcreteStackBlock;
      block[1] = 3221225472;
      block[2] = sub_1000DCC90;
      block[3] = &unk_1001D2740;
      block[4] = self;
      dispatch_after(v33, (dispatch_queue_t)&_dispatch_main_q, block);
    }
  }
}

- (void)setIsWaitingForBackgroundLoadingOfSelectedEventOccurrenceView:(BOOL)a3
{
  self->_isWaitingForBackgroundLoadingOfSelectedEventOccurrenceView = a3;
}

- (BOOL)isWaitingForBackgroundLoadingOfSelectedEventOccurrenceView
{
  return self->_isWaitingForBackgroundLoadingOfSelectedEventOccurrenceView;
}

- (void)updatePalette:(id)a3
{
  id v3 = a3;
  [v3 setDayScrubberController:0];
  [v3 setWeekdayHeaderFillsHalfWidth:0];
  [v3 setWeekdayHeaderVisible:0];
  [v3 setTodayButtonVisible:1];
  [v3 setDateStringVisible:1];
  [v3 setDividerLineVisible:0];
  [v3 setFocusBannerPlacement:2];
  [v3 setNeedsLayout];
  [v3 layoutIfNeeded];
}

- (BOOL)presentationControllerShouldDismiss:(id)a3
{
  id v3 = [(MainViewController *)self shownEventEditViewController];
  BOOL v4 = v3 == 0;

  return v4;
}

- (void)presentationControllerDidDismiss:(id)a3
{
}

- (void)_presentationControllerDidDismissPopover:(id)a3 cleanSelectionState:(BOOL)a4
{
  BOOL v4 = a4;
  +[UIPopoverPresentationController _setAlwaysAllowPopoverPresentations:0];
  [(MainViewController *)self invalidateManagedNavigationController];
  if (v4) {
    [(WeekViewController *)self cleanupSelectionState];
  }
  self->_shouldRePresentPopoverAfterDrag = 0;
}

- (void)eventViewControllerWillBeginEditingEvent:(id)a3
{
  id v4 = a3;
  BOOL v5 = [(LargeWeekViewController *)self ekui_futureTraitCollection];
  id v6 = [v5 verticalSizeClass];

  if (v6 == (id)2)
  {
    objc_super v7 = [(WeekViewController *)self eventGestureController];
    uint64_t v8 = [v4 event];
    [v7 liftUpOccurrenceForEditingEvent:v8];

    id v9 = [v4 event];
    [(WeekViewController *)self dimOccurrence:v9 occurrenceDate:0];

    id v10 = [v4 popoverPresentationController];
    unint64_t v11 = [(WeekViewController *)self eventGestureController];
    id v12 = [v11 draggingView];
    BOOL v14 = v12;
    id v13 = +[NSArray arrayWithObjects:&v14 count:1];
    [v10 setPassthroughViews:v13];

    self->_shouldRePresentPopoverAfterDrag = 1;
  }
  [(LargeWeekViewController *)self setNeedsUpdateOfSupportedInterfaceOrientations];
}

- (BOOL)eventViewDelegateShouldHandlePresentationOfEditViewController:(id)a3
{
  id v3 = [(LargeWeekViewController *)self view];
  BOOL v4 = EKUICurrentWindowInterfaceParadigm_RequiresPageSheetEventEditors();

  return v4;
}

- (BOOL)eventViewDelegateShouldCreateOwnEditViewController:(id)a3
{
  return [(LargeWeekViewController *)self eventViewDelegateShouldHandlePresentationOfEditViewController:a3];
}

- (void)eventViewController:(id)a3 requestsDisplayOfEditViewController:(id)a4 animated:(BOOL)a5
{
  BOOL v5 = a5;
  id v8 = a3;
  id v9 = a4;
  id v10 = [(LargeWeekViewController *)self view];
  int v11 = EKUICurrentWindowInterfaceParadigm_SupportsPopoversForEventEditing();

  if (v11)
  {
    [v9 setInternalEditViewDelegate:self];
    [v9 setModalPresentationStyle:3];
    [v9 setModalTransitionStyle:2];
    [v9 preferredContentSize];
    [v8 setPreferredContentSize:];
    [v8 presentViewController:v9 animated:v5 completion:0];
  }
  else
  {
    if (!v9)
    {
      id v12 = [v8 event];
      id v9 = +[EKEventEditViewController eventOrIntegrationViewControllerWithEvent:v12 creationMethod:0 eventEditViewDelegate:self];
    }
    id v13 = [v8 presentingViewController];
    v14[0] = _NSConcreteStackBlock;
    v14[1] = 3221225472;
    v14[2] = sub_1000DD2E8;
    v14[3] = &unk_1001D28A8;
    v14[4] = self;
    id v9 = v9;
    id v15 = v9;
    [v13 dismissViewControllerAnimated:1 completion:v14];
  }
}

- (void)eventViewControllerWillFinishEditingEvent:(id)a3 deleted:(BOOL)a4
{
  self->_shouldRePresentPopoverAfterDrag = 0;
}

- (void)eventViewController:(id)a3 didCompleteWithAction:(int64_t)a4
{
  [a3 setDelegate:0, a4];
  [(WeekViewController *)self cleanupSelectionState];

  [(LargeWeekViewController *)self _closeEventPresentationAnimated:1];
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
  unint64_t v17 = [v6 popoverPresentationController];
  [v17 setSourceRect:v10, v12, v14, v16];

  double v18 = [v7 popoverPresentationController];
  double v19 = [v18 sourceView];
  double v20 = [v6 popoverPresentationController];
  [v20 setSourceView:v19];

  double v21 = [v7 popoverPresentationController];

  id v22 = [v21 permittedArrowDirections];
  double v23 = [v6 popoverPresentationController];
  [v23 setPermittedArrowDirections:v22];

  double v24 = [v6 popoverPresentationController];
  [v24 setDelegate:self];

  v26[0] = _NSConcreteStackBlock;
  v26[1] = 3221225472;
  v26[2] = sub_1000DD594;
  v26[3] = &unk_1001D28A8;
  v26[4] = self;
  id v27 = v6;
  id v25 = v6;
  [(LargeWeekViewController *)self _closeEventPresentationAnimated:1 cleanSelectionState:0 completion:v26];
}

- (BOOL)eventViewControllerShouldHideInlineEditButton
{
  id v3 = [(CUIKCalendarModel *)self->super.super._model selectedOccurrences];
  if ((unint64_t)[v3 count] < 2)
  {
    BOOL v5 = 0;
  }
  else
  {
    BOOL v4 = [(MainViewController *)self shownExpandedReminderStackViewController];
    BOOL v5 = v4 != 0;
  }
  return v5;
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
    v7[2] = sub_1000DD6F4;
    v7[3] = &unk_1001D2EE0;
    v7[4] = self;
    id v8 = v6;
    id v9 = v4;
    [(LargeWeekViewController *)self _closeEventPresentationAnimated:1 cleanSelectionState:0 completion:v7];
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
    v7[2] = sub_1000DD834;
    v7[3] = &unk_1001D2EE0;
    v7[4] = self;
    id v8 = v6;
    id v9 = v4;
    [(LargeWeekViewController *)self _closeEventPresentationAnimated:1 cleanSelectionState:0 completion:v7];
  }
}

- (void)eventViewController:(id)a3 requestsShowEvent:(id)a4
{
  id v6 = a3;
  v9[0] = _NSConcreteStackBlock;
  v9[1] = 3221225472;
  v9[2] = sub_1000DD964;
  v9[3] = &unk_1001D2EE0;
  v9[4] = self;
  id v10 = a4;
  id v11 = v6;
  id v7 = v6;
  id v8 = v10;
  [(LargeWeekViewController *)self _closeEventPresentationAnimated:1 cleanSelectionState:0 completion:v9];
}

- (BOOL)eventViewControllerShouldShowInlineEditButtonForInvitations:(id)a3
{
  id v4 = a3;
  BOOL v5 = [v4 event];
  unsigned int v6 = [v5 allowsParticipationStatusModifications];

  id v7 = [(LargeWeekViewController *)self view];
  if (EKUICurrentHeightSizeClassIsCompact()) {
    unsigned int v8 = [v4 minimalMode] & v6;
  }
  else {
    LOBYTE(v8) = 0;
  }

  return v8;
}

- (void)eventViewControllerInlineEditButtonWasTapped:(id)a3
{
  id v4 = a3;
  if ([(LargeWeekViewController *)self eventViewControllerShouldShowInlineEditButtonForInvitations:v4])
  {
    BOOL v5 = [v4 presentingViewController];
    v8[0] = _NSConcreteStackBlock;
    v8[1] = 3221225472;
    v8[2] = sub_1000DDB68;
    v8[3] = &unk_1001D28A8;
    v8[4] = self;
    id v9 = v4;
    [v5 dismissViewControllerAnimated:1 completion:v8];
  }
  else
  {
    unsigned int v6 = [v4 event];
    id v7 = +[EKEventEditViewController eventOrIntegrationViewControllerWithEvent:v6 creationMethod:0 eventEditViewDelegate:0];

    [(LargeWeekViewController *)self eventViewController:v4 requestsDisplayOfEditViewController:v7 animated:1];
  }
}

- (BOOL)eventViewControllerPresentationWantsHiddenNavBarForSingleController
{
  return !self->_isPresentingPageSheet;
}

- (void)_presentDetailViewControllerAsPageSheet:(id)a3
{
  self->_BOOL isPresentingPageSheet = 1;
  self->_isPresentingNonMinimalMode = 1;
  [(LargeWeekViewController *)self showViewController:a3 sender:self animated:1 completion:0];
}

- (void)_closeEventPresentationAnimated:(BOOL)a3
{
}

- (void)_closeEventPresentationAnimated:(BOOL)a3 cleanSelectionState:(BOOL)a4 completion:(id)a5
{
  BOOL v5 = a4;
  BOOL v6 = a3;
  v31[0] = _NSConcreteStackBlock;
  v31[1] = 3221225472;
  v31[2] = sub_1000DE000;
  v31[3] = &unk_1001D2808;
  id v8 = a5;
  v31[4] = self;
  id v32 = v8;
  v29[0] = _NSConcreteStackBlock;
  v29[1] = 3221225472;
  v29[2] = sub_1000DE048;
  v29[3] = &unk_1001D2F88;
  v29[4] = self;
  id v9 = objc_retainBlock(v31);
  id v30 = v9;
  id v10 = objc_retainBlock(v29);
  id v11 = [(MainViewController *)self shownEventViewController];
  if (v11)
  {
  }
  else
  {
    double v12 = [(MainViewController *)self shownEventEditViewController];

    if (!v12)
    {
      ((void (*)(void *))v10[2])(v10);
      goto LABEL_18;
    }
  }
  double v13 = [(LargeWeekViewController *)self presentedViewController];
  double v14 = [v13 popoverPresentationController];

  if (v14)
  {
    if (v6) {
      double v15 = 0.3;
    }
    else {
      double v15 = 0.0;
    }
    v27[0] = _NSConcreteStackBlock;
    v27[1] = 3221225472;
    v27[2] = sub_1000DE0F4;
    v27[3] = &unk_1001D2740;
    id v28 = v14;
    v23[0] = _NSConcreteStackBlock;
    v23[1] = 3221225472;
    v23[2] = sub_1000DE13C;
    v23[3] = &unk_1001D4E90;
    v23[4] = self;
    id v24 = v28;
    BOOL v26 = v5;
    id v25 = v9;
    +[UIView animateWithDuration:v27 animations:v23 completion:v15];
  }
  else
  {
    if (v5) {
      [(WeekViewController *)self cleanupSelectionState];
    }
    double v16 = [(LargeWeekViewController *)self presentedViewController];

    if (v16)
    {
      [(LargeWeekViewController *)self dismissViewControllerAnimated:v6 completion:v10];
    }
    else
    {
      unint64_t v17 = (void *)kCalUILogHandle;
      if (os_log_type_enabled((os_log_t)kCalUILogHandle, OS_LOG_TYPE_ERROR))
      {
        double v18 = v17;
        double v19 = objc_opt_class();
        id v20 = v19;
        double v21 = [(MainViewController *)self shownEventViewController];
        id v22 = [(MainViewController *)self shownEventEditViewController];
        *(_DWORD *)buf = 138412802;
        double v34 = v19;
        __int16 v35 = 2112;
        double v36 = v21;
        __int16 v37 = 2112;
        long long v38 = v22;
        _os_log_impl((void *)&_mh_execute_header, v18, OS_LOG_TYPE_ERROR, "%@ trying to show a new event thinks it is already showing one (shownEventViewController = %@, shownEventEditViewController = %@), and yet we are not presenting anything", buf, 0x20u);
      }
      ((void (*)(void *))v10[2])(v10);
    }
  }

LABEL_18:
}

- (void)_presentEventViewController:(id)a3 forOccurrenceView:(id)a4 animated:(BOOL)a5 showComments:(BOOL)a6 completion:(id)a7
{
  id v12 = a3;
  id v13 = a4;
  v29[0] = _NSConcreteStackBlock;
  v29[1] = 3221225472;
  v29[2] = sub_1000DE41C;
  v29[3] = &unk_1001D2808;
  v29[4] = self;
  id v30 = a7;
  id v14 = v30;
  double v15 = objc_retainBlock(v29);
  v23[0] = _NSConcreteStackBlock;
  v23[1] = 3221225472;
  v23[2] = sub_1000DE490;
  v23[3] = &unk_1001D4630;
  v23[4] = self;
  id v24 = v12;
  id v16 = v13;
  BOOL v27 = a5;
  BOOL v28 = a6;
  id v25 = v16;
  id v26 = v15;
  unint64_t v17 = v15;
  id v18 = v12;
  double v19 = objc_retainBlock(v23);
  id v20 = [v16 occurrence];
  if ([v20 isNew])
  {
  }
  else
  {
    unsigned __int8 v21 = [v16 isReminderStack];

    if ((v21 & 1) == 0)
    {
      id v22 = [v16 occurrence];
      [(WeekViewController *)self scrollEventIntoView:v22 animated:1 completion:v19];

      goto LABEL_6;
    }
  }
  ((void (*)(void *, void))v19[2])(v19, 0);
LABEL_6:
}

- (void)_presentEventViewController:(id)a3 forOccurrenceView:(id)a4 animated:(BOOL)a5 showComments:(BOOL)a6
{
}

- (int64_t)adaptivePresentationStyleForPresentationController:(id)a3 traitCollection:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  if ([v6 horizontalSizeClass] != (id)2) {
    goto LABEL_4;
  }
  if ([v6 verticalSizeClass] != (id)1) {
    goto LABEL_4;
  }
  uint64_t v7 = objc_opt_class();
  if (v7 != objc_opt_class()) {
    goto LABEL_4;
  }
  id v10 = [v5 presentedViewController];
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0) {
    goto LABEL_11;
  }
  id v10 = v10;
  id v11 = [v10 viewControllers];
  id v12 = [v11 count];

  if (!v12)
  {

LABEL_11:
LABEL_12:
    int64_t v8 = -1;
    goto LABEL_5;
  }
  uint64_t v13 = [v10 viewControllers];
  id v14 = [(id)v13 objectAtIndexedSubscript:0];

  objc_opt_class();
  LOBYTE(v13) = objc_opt_isKindOfClass();

  if ((v13 & 1) == 0) {
    goto LABEL_12;
  }
LABEL_4:
  int64_t v8 = (int64_t)[v5 presentationStyle];
LABEL_5:

  return v8;
}

- (void)_setSelectedEvents:(id)a3
{
  id v4 = a3;
  id v5 = [(WeekViewController *)self model];
  [v5 setSelectedOccurrences:v4];

  [(WeekViewController *)self _clearSelectedOccurrenceViews];
  long long v14 = 0u;
  long long v15 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  id v6 = v4;
  id v7 = [v6 countByEnumeratingWithState:&v12 objects:v16 count:16];
  if (v7)
  {
    id v8 = v7;
    uint64_t v9 = *(void *)v13;
    do
    {
      id v10 = 0;
      do
      {
        if (*(void *)v13 != v9) {
          objc_enumerationMutation(v6);
        }
        id v11 = -[WeekViewController occurrenceViewForEvent:](self, "occurrenceViewForEvent:", *(void *)(*((void *)&v12 + 1) + 8 * (void)v10), (void)v12);
        [(WeekViewController *)self _selectOccurrenceView:v11];

        id v10 = (char *)v10 + 1;
      }
      while (v8 != v10);
      id v8 = [v6 countByEnumeratingWithState:&v12 objects:v16 count:16];
    }
    while (v8);
  }
}

- (void)_displayEventDetailsViewControllerForEvent:(id)a3 showComment:(BOOL)a4 context:(id)a5 completion:(id)a6
{
  BOOL v8 = a4;
  id v10 = a3;
  id v11 = a5;
  id v12 = a6;
  long long v13 = kCalUILogHandle;
  if (os_log_type_enabled((os_log_t)kCalUILogHandle, OS_LOG_TYPE_DEBUG))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_DEBUG, "LargeWeekViewController _displayEventDetailsPopoverForEvent: called", buf, 2u);
  }
  v19[0] = _NSConcreteStackBlock;
  v19[1] = 3221225472;
  v19[2] = sub_1000DED4C;
  v19[3] = &unk_1001D3038;
  id v14 = v12;
  id v20 = v14;
  long long v15 = objc_retainBlock(v19);
  if (v10)
  {
    id v22 = v10;
    id v16 = +[NSArray arrayWithObjects:&v22 count:1];
    [(LargeWeekViewController *)self _setSelectedEvents:v16];

    unint64_t v17 = [(WeekViewController *)self occurrenceViewForEvent:v10];
    [(LargeWeekViewController *)self _displayEventDetailsViewControllerForSelectedEventWithOccurrenceView:v17 showComments:v8 context:v11 forceShowEditor:0 creationMethod:0 completion:v14];
  }
  else
  {
    id v18 = kCalUILogHandle;
    if (os_log_type_enabled((os_log_t)kCalUILogHandle, OS_LOG_TYPE_DEBUG))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v18, OS_LOG_TYPE_DEBUG, "LargeWeekViewController _displayEventDetailsPopoverForEvent: called with nil event.", buf, 2u);
    }
    ((void (*)(void *))v15[2])(v15);
  }
}

- (void)_displayEventDetailsViewControllerForSelectedEventWithOccurrenceView:(id)a3 showComments:(BOOL)a4 context:(id)a5 forceShowEditor:(BOOL)a6 creationMethod:(unint64_t)a7 completion:(id)a8
{
  id v14 = a3;
  id v15 = a5;
  v44[0] = _NSConcreteStackBlock;
  v44[1] = 3221225472;
  v44[2] = sub_1000DF100;
  v44[3] = &unk_1001D3038;
  id v16 = a8;
  id v45 = v16;
  unint64_t v17 = objc_retainBlock(v44);
  id v18 = [(WeekViewController *)self model];
  id v19 = [v18 selectedOccurrence];

  if (!v19)
  {
    id v22 = [v14 occurrence];
    unsigned int v23 = [v22 isBirthday];

    if (!v23 || ([v14 occurrence], (id v19 = (id)objc_claimAutoreleasedReturnValue()) == 0))
    {
      id v24 = [(WeekViewController *)self model];
      id v19 = [v24 selectedOccurrences];

      if (v19 && (unint64_t)[v19 count] >= 2) {
        [(LargeWeekViewController *)self showEvents:v19 animated:1 showMode:1 context:v15];
      }
      id v20 = kCalUILogHandle;
      if (!os_log_type_enabled((os_log_t)kCalUILogHandle, OS_LOG_TYPE_ERROR)) {
        goto LABEL_19;
      }
      *(_WORD *)buf = 0;
      unsigned __int8 v21 = "LargeWeekViewController _displayEventDetailsPopoverForSelectedEventWithOccurrenceView: called with nil event.";
      goto LABEL_15;
    }
  }
  if (v14)
  {
    [v14 frame];
    if (CGRectIsEmpty(v46))
    {
      id v20 = kCalUILogHandle;
      if (os_log_type_enabled((os_log_t)kCalUILogHandle, OS_LOG_TYPE_ERROR))
      {
        *(_WORD *)buf = 0;
        unsigned __int8 v21 = "LargeWeekViewController _displayEventDetailsPopoverForSelectedEventWithOccurrenceView: occurrence view frame is null.";
LABEL_15:
        _os_log_impl((void *)&_mh_execute_header, v20, OS_LOG_TYPE_ERROR, v21, buf, 2u);
      }
    }
    else
    {
      BOOL v33 = a6;
      id v25 = [(MainViewController *)self shownEventViewController];
      id v26 = [v25 event];
      if ([v26 isEqual:v19])
      {
      }
      else
      {
        unint64_t v30 = a7;
        BOOL v31 = a4;
        [(MainViewController *)self shownEventEditViewController];
        v27 = id v32 = v15;
        BOOL v28 = [v27 event];
        unsigned int v29 = [v28 isEqual:v19];

        id v15 = v32;
        if (!v29)
        {
          v34[0] = _NSConcreteStackBlock;
          v34[1] = 3221225472;
          v34[2] = sub_1000DF118;
          v34[3] = &unk_1001D4EE0;
          BOOL v41 = v33;
          id v35 = v19;
          double v36 = self;
          unint64_t v40 = v30;
          id v37 = v32;
          id v38 = v14;
          BOOL v42 = v31;
          id v39 = v16;
          id v19 = v19;
          [(LargeWeekViewController *)self _closeEventPresentationAnimated:0 cleanSelectionState:0 completion:v34];

          goto LABEL_20;
        }
      }
    }
  }
  else
  {
    id v20 = kCalUILogHandle;
    if (os_log_type_enabled((os_log_t)kCalUILogHandle, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      unsigned __int8 v21 = "LargeWeekViewController _displayEventDetailsPopoverForSelectedEventWithOccurrenceView: got nil occurrence view.";
      goto LABEL_15;
    }
  }
LABEL_19:
  ((void (*)(void *))v17[2])(v17);
LABEL_20:
}

- (void)_displayEventDetailsViewControllerForSelectedEventWithOccurrenceView:(id)a3 showComments:(BOOL)a4 creationMethod:(unint64_t)a5
{
}

- (void)_rePresentEditPopoverFromTargetView:(id)a3
{
  id v4 = a3;
  id v5 = [(MainViewController *)self shownEventEditViewController];
  id v6 = v5;
  if (v5)
  {
    [v5 setInternalEditViewDelegate:self];
    [v6 refreshStartAndEndDates];
    [(LargeWeekViewController *)self _presentEventViewController:v6 forOccurrenceView:v4 animated:0 showComments:0];
    id v7 = [v6 popoverPresentationController];
    BOOL v8 = [(WeekViewController *)self eventGestureController];
    uint64_t v9 = [v8 draggingView];
    id v11 = v9;
    id v10 = +[NSArray arrayWithObjects:&v11 count:1];
    [v7 setPassthroughViews:v10];
  }
}

- (void)popoverPresentationController:(id)a3 willRepositionPopoverToRect:(CGRect *)a4 inView:(id *)a5
{
  BOOL v8 = [(MainViewController *)self shownEventEditViewController];

  if (v8)
  {
    uint64_t v9 = [(MainViewController *)self shownEventEditViewController];
LABEL_5:
    id v11 = v9;
    id v12 = [v9 event];
    goto LABEL_6;
  }
  id v10 = [(MainViewController *)self shownEventViewController];

  if (v10)
  {
    uint64_t v9 = [(MainViewController *)self shownEventViewController];
    goto LABEL_5;
  }
  id v12 = [(MainViewController *)self shownExpandedReminderStackViewController];

  if (!v12) {
    goto LABEL_10;
  }
  id v11 = [(MainViewController *)self shownExpandedReminderStackViewController];
  id v14 = [v11 events];
  id v12 = [v14 firstObject];

LABEL_6:
  if (v12)
  {
    long long v13 = [(WeekViewController *)self occurrenceViewForEvent:v12];
    goto LABEL_11;
  }
LABEL_10:
  long long v13 = 0;
LABEL_11:
  id v15 = [(WeekViewController *)self eventGestureController];
  id v16 = v15;
  if (!v15) {
    goto LABEL_16;
  }
  unint64_t v17 = [v15 draggingView];

  if (!v17)
  {
    id v18 = [v16 event];

    if (!v18) {
      goto LABEL_16;
    }
    id v19 = [v16 event];
    id v20 = [v16 occurrenceDate];
    [v16 forceStartWithOccurrence:v19 occurrenceDate:v20 shouldUpdateViewSource:0 shouldUpdateOrigin:1 shouldPresentEditMenu:0];
  }
  uint64_t v21 = [v16 draggingView];

  long long v13 = (void *)v21;
LABEL_16:
  if (v13)
  {
    *a5 = v13;
    CGSize size = CGRectNull.size;
    a4->origin = CGRectNull.origin;
    a4->CGSize size = size;
  }
  else
  {
    unsigned int v23 = [(WeekViewController *)self _selectedOccurrenceViews];
    id v24 = [v23 count];

    id v25 = kCalUILogHandle;
    if (v24 == (id)1)
    {
      if (os_log_type_enabled((os_log_t)kCalUILogHandle, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)buf = 0;
        _os_log_impl((void *)&_mh_execute_header, v25, OS_LOG_TYPE_INFO, "Couldn't find event for popover re-presentation, but found a selected occurrence view to use.", buf, 2u);
      }
      id v26 = [(WeekViewController *)self _selectedOccurrenceViews];
      *a5 = [v26 firstObject];

      CGSize v27 = CGRectNull.size;
      a4->origin = CGRectNull.origin;
      a4->CGSize size = v27;
    }
    else
    {
      if (os_log_type_enabled((os_log_t)kCalUILogHandle, OS_LOG_TYPE_ERROR))
      {
        *(_WORD *)id v37 = 0;
        _os_log_impl((void *)&_mh_execute_header, v25, OS_LOG_TYPE_ERROR, "Couldn't find event for popover re-presentation", v37, 2u);
      }
      *a5 = [(LargeWeekViewController *)self view];
      BOOL v28 = [(LargeWeekViewController *)self view];
      [v28 bounds];
      CGFloat MidX = CGRectGetMidX(v39);
      unint64_t v30 = [(LargeWeekViewController *)self view];
      [v30 bounds];
      CGFloat MidY = CGRectGetMidY(v40);
      a4->origin.x = MidX;
      a4->origin.y = MidY;
      __asm { FMOV            V0.2D, #20.0 }
      a4->CGSize size = _Q0;
    }
  }
}

- (BOOL)isEventAbleToShowPopover:(id)a3
{
  id v4 = a3;
  if ([v4 isNew] & 1) != 0 || (objc_msgSend(v4, "isAllDay"))
  {
    unsigned __int8 v5 = 1;
  }
  else
  {
    if (!v4) {
      goto LABEL_9;
    }
    id v7 = [(WeekViewController *)self _weekGroupForEvent:v4 occurrenceDate:0];
    if (v7) {
      goto LABEL_8;
    }
    BOOL v8 = [v4 startDate];
    uint64_t v9 = [(WeekViewController *)self model];
    id v10 = [v9 eventStore];
    id v11 = [v10 timeZone];
    id v12 = +[EKCalendarDate calendarDateWithDate:v8 timeZone:v11];

    [(WeekViewController *)self setDisplayedDate:v12 animated:0];
    id v7 = [(WeekViewController *)self _weekGroupForEvent:v4 occurrenceDate:0];

    if (v7)
    {
LABEL_8:
      long long v13 = [v7 weekView];
      unsigned __int8 v5 = [v13 isEventFullyVisible:v4];
    }
    else
    {
LABEL_9:
      unsigned __int8 v5 = 0;
    }
  }

  return v5;
}

- (BOOL)isReadyToShowViewControllersInsideEnqueueableManagedNavigationController:(id)a3
{
  id v4 = [(WeekViewController *)self model];
  unsigned __int8 v5 = [v4 selectedOccurrences];

  if (v5 && [v5 count])
  {
    id v6 = [v5 firstObject];
    id v7 = [(LargeWeekViewController *)self _occurrenceViewForPopoverSource];
    if (!v7)
    {
      if ([v5 count] == (id)1
        && ([v5 firstObject],
            BOOL v8 = objc_claimAutoreleasedReturnValue(),
            unsigned int v9 = [v8 isNew],
            v8,
            v9))
      {
        id v10 = [(WeekViewController *)self eventGestureController];
        id v11 = [v5 firstObject];
        id v12 = [0 occurrenceDate];
        [v10 forceStartWithOccurrence:v11 occurrenceDate:v12 shouldUpdateViewSource:0 shouldUpdateOrigin:0 shouldPresentEditMenu:1];

        id v7 = [(LargeWeekViewController *)self _occurrenceViewForPopoverSource];
      }
      else
      {
        id v7 = 0;
      }
    }
    id v15 = [(LargeWeekViewController *)self view];
    [v7 bounds];
    [v15 convertRect:v7 fromView:v15];
    CGFloat v17 = v16;
    CGFloat v19 = v18;
    CGFloat v21 = v20;
    CGFloat v23 = v22;

    unsigned int v24 = [(LargeWeekViewController *)self isEventAbleToShowPopover:v6];
    if (v7) {
      unsigned int v25 = v24;
    }
    else {
      unsigned int v25 = 0;
    }
    v31.origin.x = v17;
    v31.origin.y = v19;
    v31.size.double width = v21;
    v31.size.double height = v23;
    int v26 = v25 & ~CGRectIsEmpty(v31);
    CGSize v27 = [(LargeWeekViewController *)self view];
    [v27 bounds];
    v33.origin.x = v17;
    v33.origin.y = v19;
    v33.size.double width = v21;
    v33.size.double height = v23;
    BOOL v14 = v26 & CGRectIntersectsRect(v32, v33);
  }
  else
  {
    long long v13 = kCalUILogHandle;
    if (os_log_type_enabled((os_log_t)kCalUILogHandle, OS_LOG_TYPE_ERROR))
    {
      int v29 = 136315138;
      unint64_t v30 = "-[LargeWeekViewController isReadyToShowViewControllersInsideEnqueueableManagedNavigationController:]";
      _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_ERROR, "%s: Couldn't find a selected event to show details for.", (uint8_t *)&v29, 0xCu);
    }
    LOBYTE(v14) = 0;
  }

  return v14;
}

- (void)enqueuableNavigationController:(id)a3 requestsDeferShowViewControllerUntilReady:(id)a4
{
  id v6 = a3;
  id v7 = (void (**)(id, uint64_t))a4;
  BOOL v8 = (void *)kCalUILogHandle;
  if (os_log_type_enabled((os_log_t)kCalUILogHandle, OS_LOG_TYPE_DEBUG))
  {
    unsigned int v9 = v8;
    id v10 = [(MainViewController *)self managedNavigationController];
    id v11 = objc_opt_class();
    id v12 = v11;
    *(_DWORD *)int v29 = 138412546;
    *(void *)&v29[4] = v11;
    *(_WORD *)&v29[12] = 2112;
    *(void *)&v29[14] = objc_opt_class();
    id v13 = *(id *)&v29[14];
    _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEBUG, "%@ requested that %@ prepare itself to show the source view for the popover.", v29, 0x16u);
  }
  BOOL v14 = [(WeekViewController *)self model];
  id v15 = [v14 selectedOccurrences];

  if (v15 && [v15 count])
  {
    if ([(LargeWeekViewController *)self isReadyToShowViewControllersInsideEnqueueableManagedNavigationController:v6])
    {
      if (v7)
      {
        double v16 = (void *)kCalUILogHandle;
        if (os_log_type_enabled((os_log_t)kCalUILogHandle, OS_LOG_TYPE_DEBUG))
        {
          CGFloat v17 = v16;
          double v18 = objc_opt_class();
          *(_DWORD *)int v29 = 138412290;
          *(void *)&v29[4] = v18;
          id v19 = v18;
          _os_log_impl((void *)&_mh_execute_header, v17, OS_LOG_TYPE_DEBUG, "%@ found the source occurence view for the selected event, calling show block.", v29, 0xCu);
        }
        v7[2](v7, 1);
      }
    }
    else
    {
      CGFloat v21 = (void *)kCalUILogHandle;
      if (os_log_type_enabled((os_log_t)kCalUILogHandle, OS_LOG_TYPE_DEBUG))
      {
        double v22 = v21;
        CGFloat v23 = objc_opt_class();
        id v24 = v23;
        unsigned int v25 = [(MainViewController *)self managedNavigationController];
        int v26 = objc_opt_class();
        *(_DWORD *)int v29 = 138412546;
        *(void *)&v29[4] = v23;
        *(_WORD *)&v29[12] = 2112;
        *(void *)&v29[14] = v26;
        id v27 = v26;
        _os_log_impl((void *)&_mh_execute_header, v22, OS_LOG_TYPE_DEBUG, "%@ didn't find the source occurence view for the selected event yet. It is either loading or offscreen. %@ will be notified once it is present.", v29, 0x16u);
      }
      [(LargeWeekViewController *)self setIsWaitingForBackgroundLoadingOfSelectedEventOccurrenceView:1];
      self->_needToNotifyEnqueuedManagedNavigationController = 1;
      BOOL v28 = [v15 firstObject];
      if (self->_viewDidAppear) {
        [(LargeWeekViewController *)self _scrollEventIntoViewAndRequestPresentPopoverForEvent:v28];
      }
      else {
        objc_storeStrong((id *)&self->_eventToPresentOnAppear, v28);
      }
    }
  }
  else
  {
    double v20 = kCalUILogHandle;
    if (os_log_type_enabled((os_log_t)kCalUILogHandle, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)int v29 = 136315138;
      *(void *)&v29[4] = "-[LargeWeekViewController enqueuableNavigationController:requestsDeferShowViewControllerUntilReady:]";
      _os_log_impl((void *)&_mh_execute_header, v20, OS_LOG_TYPE_ERROR, "%s: Couldn't find a selected event to show details for.", v29, 0xCu);
    }
    [v6 enqueueStackResetOperation];
  }
}

- (void)_scrollEventIntoViewAndRequestPresentPopoverForEvent:(id)a3
{
  v3[0] = _NSConcreteStackBlock;
  v3[1] = 3221225472;
  v3[2] = sub_1000DFEC8;
  v3[3] = &unk_1001D27D8;
  v3[4] = self;
  [(WeekViewController *)self scrollEventIntoView:a3 animated:1 completion:v3];
}

- (void)enqueueableManagedNavigationController:(id)a3 requestsConfigurationOfPropertiesForPopoverPresentationController:(id)a4 completion:(id)a5
{
  id v9 = a3;
  id v10 = a4;
  id v11 = (void (**)(void))a5;
  id v12 = (void *)kCalUILogHandle;
  if (os_log_type_enabled((os_log_t)kCalUILogHandle, OS_LOG_TYPE_DEBUG))
  {
    id v13 = v12;
    BOOL v14 = [(MainViewController *)self managedNavigationController];
    id v15 = objc_opt_class();
    id v16 = v15;
    *(_DWORD *)buf = 138412546;
    v64 = v15;
    __int16 v65 = 2112;
    id v66 = (id)objc_opt_class();
    id v17 = v66;
    _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_DEBUG, "%@ requested that %@ configure the popover.", buf, 0x16u);
  }
  double v18 = [(WeekViewController *)self model];
  id v19 = [v18 selectedOccurrences];

  if (v19 && [v19 count])
  {
    double v20 = [(LargeWeekViewController *)self _occurrenceViewForPopoverSource];
    if (!v20)
    {
      v61 = +[NSAssertionHandler currentHandler];
      [v61 handleFailureInMethod:a2 object:self file:@"LargeWeekViewController.m" lineNumber:1345 description:@"No source view for popover"];
    }
    [v20 bounds];
    double v22 = v21;
    double v24 = v23;
    double v26 = v25;
    double v28 = v27;
    int v29 = [v20 layer];
    unint64_t v30 = [v29 mask];

    if (v30)
    {
      CGRect v31 = [v20 layer];
      CGRect v32 = [v31 mask];
      [v32 frame];
      double v22 = v33;
      double v24 = v34;
      double v26 = v35;
      double v28 = v36;
    }
    else
    {
      id v38 = [(LargeWeekViewController *)self view];
      [v38 convertRect:v20 fromView:v22];
      CGFloat v40 = v39;
      CGFloat v42 = v41;
      CGFloat v44 = v43;
      CGFloat v46 = v45;

      v47 = [(LargeWeekViewController *)self view];
      [v47 bounds];
      v70.origin.double x = v40;
      v70.origin.double y = v42;
      v70.size.double width = v44;
      v70.size.double height = v46;
      CGRect v68 = CGRectIntersection(v67, v70);
      double x = v68.origin.x;
      double y = v68.origin.y;
      double width = v68.size.width;
      double height = v68.size.height;

      v69.origin.double x = x;
      v69.origin.double y = y;
      v69.size.double width = width;
      v69.size.double height = height;
      if (CGRectIsEmpty(v69))
      {
LABEL_14:
        v56 = +[UIColor clearColor];
        v57 = [v10 presentedViewController];
        v58 = [v57 view];
        [v58 setBackgroundColor:v56];

        v59 = [v10 presentedViewController];
        [v59 setModalPresentationStyle:7];

        [v10 setDelegate:self];
        [v10 setSourceRect:v22, v24, v26, v28];
        [v10 setSourceView:v20];
        [v10 setPermittedArrowDirections:12];
        v62 = v20;
        v60 = +[NSArray arrayWithObjects:&v62 count:1];
        [v10 setPassthroughViews:v60];

        if (v11) {
          v11[2](v11);
        }

        goto LABEL_17;
      }
      CGRect v31 = [(LargeWeekViewController *)self view];
      [v20 convertRect:v31 fromView:x, y, width, height];
      double v22 = v52;
      double v24 = v53;
      double v26 = v54;
      double v28 = v55;
    }

    goto LABEL_14;
  }
  id v37 = kCalUILogHandle;
  if (os_log_type_enabled((os_log_t)kCalUILogHandle, OS_LOG_TYPE_ERROR))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v37, OS_LOG_TYPE_ERROR, "Can't present popover from a nil event.", buf, 2u);
  }
LABEL_17:
}

- (id)_occurrenceViewForPopoverSource
{
  id v3 = [(WeekViewController *)self eventGestureController];
  id v4 = [v3 draggingView];

  if (v4)
  {
    unsigned __int8 v5 = [(WeekViewController *)self eventGestureController];
    uint64_t v6 = [v5 draggingView];
  }
  else
  {
    unsigned __int8 v5 = objc_opt_new();
    long long v17 = 0u;
    long long v18 = 0u;
    long long v19 = 0u;
    long long v20 = 0u;
    id v7 = [(WeekViewController *)self model];
    BOOL v8 = [v7 selectedOccurrences];

    id v9 = [v8 countByEnumeratingWithState:&v17 objects:v23 count:16];
    if (v9)
    {
      id v10 = v9;
      uint64_t v11 = *(void *)v18;
      do
      {
        for (i = 0; i != v10; i = (char *)i + 1)
        {
          if (*(void *)v18 != v11) {
            objc_enumerationMutation(v8);
          }
          id v13 = [(WeekViewController *)self occurrenceViewForEvent:*(void *)(*((void *)&v17 + 1) + 8 * i)];
          if (v13) {
            [v5 addObject:v13];
          }
        }
        id v10 = [v8 countByEnumeratingWithState:&v17 objects:v23 count:16];
      }
      while (v10);
    }

    if ((unint64_t)[v5 count] >= 2)
    {
      BOOL v14 = kCalUILogHandle;
      if (os_log_type_enabled((os_log_t)kCalUILogHandle, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 136315138;
        double v22 = "-[LargeWeekViewController _occurrenceViewForPopoverSource]";
        _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_ERROR, "%s: found multiple occurrence views for selected occurrences.", buf, 0xCu);
      }
    }
    uint64_t v6 = [v5 anyObject];
  }
  id v15 = (void *)v6;

  return v15;
}

- (int)editorShowTransition
{
  return 6;
}

- (int)editorHideTransition
{
  return 6;
}

- (BOOL)eventViewControllerUseMinimalMode:(id)a3
{
  if (self->_isPresentingNonMinimalMode) {
    return 0;
  }
  id v4 = [(LargeWeekViewController *)self view];
  BOOL v3 = EKUICurrentWindowInterfaceParadigm() == 8;

  return v3;
}

- (BOOL)eventGestureController:(id)a3 shouldAllowShortLiftDelay:(id)a4
{
  return [a4 isNew] ^ 1;
}

- (void)eventGestureController:(id)a3 didSetUpAtDate:(double)a4 isAllDay:(BOOL)a5
{
  BOOL v5 = a5;
  id v8 = a3;
  id v9 = v8;
  if (self->_shouldRePresentPopoverAfterDrag)
  {
    id v10 = [v8 draggingView];
    uint64_t v11 = [(WeekViewController *)self occurrenceViewSuperviewForEventGestureController:v9];
    CalSwitchViewToSuperview();
  }
  [(LargeWeekViewController *)self _closeEventPresentationAnimated:0];
  v12.receiver = self;
  v12.super_class = (Class)LargeWeekViewController;
  [(WeekViewController *)&v12 eventGestureController:v9 didSetUpAtDate:v5 isAllDay:a4];
}

- (BOOL)eventGestureController:(id)a3 didCommitOccurrence:(id)a4 toDate:(double)a5 isAllDay:(BOOL)a6 span:(int64_t)a7
{
  BOOL v8 = a6;
  id v11 = a3;
  id v12 = a4;
  [(WeekViewController *)self updatePreferredReloadRange];
  [(WeekViewController *)self highlightDayViewCalendarDate:0 isAllDay:v8];
  if (([v12 isNew] & 1) == 0) {
    CalAnalyticsSendEvent();
  }
  if (self->_shouldRePresentPopoverAfterDrag && ([v12 isNew] & 1) == 0)
  {
    id v13 = [v11 draggingView];
    [(LargeWeekViewController *)self _rePresentEditPopoverFromTargetView:v13];
  }
  else
  {
    if ([v12 isNew])
    {
      id v13 = +[EKEventEditor defaultTitleForCalendarItem];
      BOOL v14 = [v12 title];
      unsigned int v15 = [v13 isEqualToString:v14];

      if (v15) {
        [v12 setTitle:&stru_1001D6918];
      }
      id v45 = v12;
      id v16 = +[NSArray arrayWithObjects:&v45 count:1];
      [(LargeWeekViewController *)self _setSelectedEvents:v16];

      long long v17 = [v11 occurrenceDate];
      [v11 forceStartWithOccurrence:v12 occurrenceDate:v17 shouldUpdateViewSource:0 shouldUpdateOrigin:0 shouldPresentEditMenu:0];

      long long v18 = [v11 draggingView];
      [v18 setSelected:1];

      long long v19 = [v11 draggingView];
      [(LargeWeekViewController *)self _displayEventDetailsViewControllerForSelectedEventWithOccurrenceView:v19 showComments:0 creationMethod:1];

      long long v20 = [(MainViewController *)self shownEventViewController];
      double v21 = [v20 popoverPresentationController];
      double v22 = [v11 draggingView];
      CGFloat v44 = v22;
      double v23 = +[NSArray arrayWithObjects:&v44 count:1];
      [v21 setPassthroughViews:v23];

      id v24 = [(LargeWeekViewController *)self view];
      self->_shouldRePresentPopoverAfterDrag = EKUICurrentWindowInterfaceParadigm_SupportsPopoversForEventEditing();
    }
    else
    {
      id v13 = +[UIApplication sharedApplication];
      if ([v13 optionKeyIsDown]
        && (id v43 = v12,
            +[NSArray arrayWithObjects:&v43 count:1],
            double v25 = objc_claimAutoreleasedReturnValue(),
            unsigned int v26 = +[CUIKPasteboardUtilities allEventsValidForAction:2 fromEvents:v25], v25, v26))
      {
        double v27 = kCalUILogHandle;
        if (os_log_type_enabled((os_log_t)kCalUILogHandle, OS_LOG_TYPE_INFO))
        {
          *(_WORD *)buf = 0;
          _os_log_impl((void *)&_mh_execute_header, v27, OS_LOG_TYPE_INFO, "duplicating event(s) in large week view because option key is down", buf, 2u);
        }
        double v28 = [(WeekViewController *)self model];
        int v29 = [v28 pasteboardManager];
        unint64_t v30 = [v12 startDate];
        [v29 setDateForPaste:v30];

        CGRect v31 = [(WeekViewController *)self model];
        CGRect v32 = [v31 pasteboardManager];
        [v32 setCalendarForPaste:0];

        id v24 = [(WeekViewController *)self model];
        double v33 = [v24 pasteboardManager];
        double v34 = +[NSSet setWithObject:v12];
        [v33 duplicateEvents:v34 withDateMode:1 delegate:self];
      }
      else
      {
        double v35 = [(LargeWeekViewController *)self EKUI_editor];
        id v40 = 0;
        unsigned int v36 = [v35 saveEvent:v12 span:a7 error:&v40];
        id v24 = v40;

        if (v36)
        {
          id v37 = [(WeekViewController *)self model];
          [v37 addOccurrenceAwaitingRefresh:v12];

          [(WeekViewController *)self editorDidSaveEvent:v12];
        }
        else
        {
          id v38 = kCalUILogHandle;
          if (os_log_type_enabled((os_log_t)kCalUILogHandle, OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)buf = 138412290;
            id v42 = v24;
            _os_log_impl((void *)&_mh_execute_header, v38, OS_LOG_TYPE_ERROR, "Error moving event: %@", buf, 0xCu);
          }
          [v12 revert];
          [(WeekViewController *)self editorDidCancelEditingEvent:v12];
        }
      }
    }
  }
  return 1;
}

- (void)eventGestureController:(id)a3 didCancelEditingOccurrence:(id)a4 fadedOut:(BOOL)a5
{
  BOOL v5 = a5;
  id v8 = a3;
  id v9 = a4;
  if (self->_shouldRePresentPopoverAfterDrag && !v5)
  {
    id v10 = [v8 draggingView];
    [(LargeWeekViewController *)self _rePresentEditPopoverFromTargetView:v10];
  }
  v11.receiver = self;
  v11.super_class = (Class)LargeWeekViewController;
  [(WeekViewController *)&v11 eventGestureController:v8 didCancelEditingOccurrence:v9 fadedOut:v5];
}

- (void)eventGestureController:(id)a3 didSingleTapOccurrence:(id)a4 shouldExtendSelection:(BOOL)a5
{
  BOOL v5 = a5;
  id v13 = a3;
  id v8 = a4;
  if (self->_shouldRePresentPopoverAfterDrag)
  {
    id v9 = [v13 draggingView];
    [(LargeWeekViewController *)self _rePresentEditPopoverFromTargetView:v9];
  }
  if (v5)
  {
    id v10 = [(WeekViewController *)self occurrenceViewForEvent:v8];
    objc_super v11 = [(WeekViewController *)self _selectedOccurrenceViews];
    unsigned int v12 = [v11 containsObject:v10];

    if (v12) {
      [(WeekViewController *)self _deselectOccurrenceView:v10];
    }
    else {
      [(WeekViewController *)self _selectOccurrenceView:v10];
    }
  }
}

- (double)eventGestureController:(id)a3 heightForAllDayOccurrenceView:(id)a4
{
  id v5 = a4;
  id v6 = [(LargeWeekViewController *)self interfaceOrientation];
  id v7 = [(LargeWeekViewController *)self view];
  +[EKDayOccurrenceView minimumHeightForSizeClass:EKUIWidthSizeClassForViewHierarchy() orientation:v6 isAllDay:1];
  double v9 = v8;

  id v10 = [v5 currentImageState];
  LODWORD(v6) = [v10 requiresLanguageAwarePadding];

  if (v6)
  {
    objc_super v11 = [v5 currentImageState];
    [v11 totalLanguageAwareHeightPadding];
    double v9 = v9 + v12;
  }
  return v9;
}

- (void)eventEditViewController:(id)a3 didCompleteWithAction:(int64_t)a4
{
}

- (void)eventEditViewController:(id)a3 didCompleteWithAction:(int64_t)a4 completionHandler:(id)a5
{
  id v9 = a3;
  id v10 = a5;
  objc_super v11 = [v9 event];
  if (v10)
  {
    double v12 = v30;
    v30[0] = _NSConcreteStackBlock;
    v30[1] = 3221225472;
    v30[2] = sub_1000E11FC;
    v30[3] = &unk_1001D2808;
    id v5 = &v31;
    id v13 = v10;
    void v30[4] = self;
    id v31 = v13;
  }
  else
  {
    double v12 = 0;
  }
  BOOL v14 = objc_retainBlock(v12);
  switch(a4)
  {
    case 2:
      [(WeekViewController *)self editorDidDeleteEvent:v11];
      break;
    case 1:
      long long v18 = [v9 calendarToMakeVisibleOnSave];
      long long v19 = [v18 objectID];
      if (v19) {
        [(CUIKCalendarModel *)self->super.super._model ensureCalendarVisibleWithId:v19];
      }
      [(WeekViewController *)self editorDidSaveEvent:v11];
      self->_shouldRePresentPopoverAfterDrag = 0;
      if ([v18 sharingStatus])
      {
        if (v14)
        {
          v21[0] = _NSConcreteStackBlock;
          v21[1] = 3221225472;
          v21[2] = sub_1000E1308;
          v21[3] = &unk_1001D2808;
          v21[4] = self;
          id v22 = v10;
          long long v20 = objc_retainBlock(v21);

          BOOL v14 = v20;
        }
        else
        {
          v23[0] = _NSConcreteStackBlock;
          v23[1] = 3221225472;
          v23[2] = sub_1000E1300;
          v23[3] = &unk_1001D2740;
          v23[4] = self;
          BOOL v14 = objc_retainBlock(v23);
        }
      }

      break;
    case 0:
      if ([v11 isNew])
      {
        unsigned int v15 = [(WeekViewController *)self eventGestureController];
        unsigned __int8 v16 = [v15 dragGestureInProgress];

        if ((v16 & 1) == 0)
        {
          v29[0] = _NSConcreteStackBlock;
          v29[1] = 3221225472;
          v29[2] = sub_1000E1210;
          v29[3] = &unk_1001D2740;
          v29[4] = self;
          +[UIView animateWithDuration:v29 animations:0.2];
        }
        if (v14)
        {
          v24[0] = _NSConcreteStackBlock;
          v24[1] = 3221225472;
          v24[2] = sub_1000E12B4;
          v24[3] = &unk_1001D3388;
          v24[4] = self;
          id v25 = v11;
          id v26 = v10;
          long long v17 = objc_retainBlock(v24);

          BOOL v14 = v17;
        }
        else
        {
          v27[0] = _NSConcreteStackBlock;
          v27[1] = 3221225472;
          v27[2] = sub_1000E12A8;
          v27[3] = &unk_1001D28A8;
          void v27[4] = self;
          id v28 = v11;
          BOOL v14 = objc_retainBlock(v27);
        }
      }
      else
      {
        [(WeekViewController *)self editorDidCancelEditingEvent:v11];
      }
      break;
  }
  [(LargeWeekViewController *)self _closeEventPresentationAnimated:1 cleanSelectionState:1 completion:v14];

  if (v10) {
}
  }

- (id)calendarModel
{
  return self->super.super._model;
}

- (id)pasteboardManagerForEventEditViewController:(id)a3
{
  BOOL v3 = [(WeekViewController *)self model];
  id v4 = [v3 pasteboardManager];

  return v4;
}

- (BOOL)eventEditorPopoverActiveWhileDraggingForEventGestureController:(id)a3
{
  return self->_shouldRePresentPopoverAfterDrag;
}

- (BOOL)enableEventCreationGesture
{
  return 1;
}

- (void)createdNewEventUsingCreationGesture:(id)a3
{
  id v4 = a3;
  id v5 = +[EKEventEditor defaultTitleForCalendarItem];
  id v6 = [v4 title];
  unsigned int v7 = [v5 isEqualToString:v6];

  if (v7) {
    [v4 setTitle:&stru_1001D6918];
  }
  id v21 = v4;
  double v8 = +[NSArray arrayWithObjects:&v21 count:1];
  [(LargeWeekViewController *)self _setSelectedEvents:v8];

  id v9 = [(WeekViewController *)self eventGestureController];
  [v9 liftUpOccurrenceForEditingEvent:v4];

  id v10 = [(WeekViewController *)self eventGestureController];
  objc_super v11 = [v10 draggingView];
  [v11 setSelected:1];

  double v12 = [(WeekViewController *)self eventGestureController];
  id v13 = [v12 draggingView];
  [(LargeWeekViewController *)self _displayEventDetailsViewControllerForSelectedEventWithOccurrenceView:v13 showComments:0 creationMethod:4];

  BOOL v14 = [(MainViewController *)self shownEventViewController];
  unsigned int v15 = [v14 popoverPresentationController];
  unsigned __int8 v16 = [(WeekViewController *)self eventGestureController];
  long long v17 = [v16 draggingView];
  long long v20 = v17;
  long long v18 = +[NSArray arrayWithObjects:&v20 count:1];
  [v15 setPassthroughViews:v18];

  long long v19 = [(LargeWeekViewController *)self view];
  self->_shouldRePresentPopoverAfterDrag = EKUICurrentWindowInterfaceParadigm_SupportsPopoversForEventEditing();
}

- (double)headerVerticalOffset
{
  return 0.0;
}

- (id)pushedDayViewControllerWithDate:(id)a3 animated:(BOOL)a4
{
  BOOL v4 = a4;
  id v6 = a3;
  unsigned int v7 = [(WeekViewController *)self model];
  [v7 setSelectedDate:v6];

  [v7 setSelectedOccurrence:0];
  int64_t v8 = [(WeekViewController *)self firstVisibleSecond];
  id v9 = [(WeekViewController *)self model];
  [v9 setFirstVisibleSecond:v8];

  id v10 = [DayViewContainerViewController alloc];
  objc_super v11 = [(MainViewController *)self window];
  double v12 = [(MainViewControllerContainer *)v10 initWithModel:v7 window:v11];

  id v13 = [(LargeWeekViewController *)self navigationController];
  [v13 pushViewController:v12 animated:v4];

  return v12;
}

- (id)pushedListViewControllerWithDate:(id)a3 animated:(BOOL)a4
{
  BOOL v4 = a4;
  id v6 = a3;
  unsigned int v7 = [(WeekViewController *)self model];
  [v7 setSelectedDate:v6];

  int64_t v8 = [ListViewContainerViewController alloc];
  id v9 = [(WeekViewController *)self model];
  id v10 = [(MainViewController *)self window];
  objc_super v11 = [(MainViewControllerContainer *)v8 initWithModel:v9 window:v10];

  double v12 = [(LargeWeekViewController *)self navigationController];
  [v12 pushViewController:v11 animated:v4];

  return v11;
}

- (double)scrollToDisplayedDateAnimated:(BOOL)a3
{
  BOOL v3 = a3;
  v8.receiver = self;
  v8.super_class = (Class)LargeWeekViewController;
  -[WeekViewController scrollToDisplayedDateAnimated:](&v8, "scrollToDisplayedDateAnimated:");
  double v6 = v5;
  -[LargeWeekViewController _showMonthOverlayInCellAtOffset:animated:](self, "_showMonthOverlayInCellAtOffset:animated:", v3);
  [(LargeWeekViewController *)self _closeEventPresentationAnimated:0 cleanSelectionState:1 completion:0];
  return v6;
}

- (void)snapTargetScrollOffset:(CGPoint *)a3 withVelocity:(CGPoint)a4
{
  v6.receiver = self;
  v6.super_class = (Class)LargeWeekViewController;
  [(WeekViewController *)&v6 snapTargetScrollOffset:a4.x withVelocity:a4.y];
  if ([(WeekViewController *)self showOverlayCalendar]) {
    [(LargeWeekViewController *)self _showMonthOverlayInCellAtOffset:1 animated:a3->x];
  }
}

- (void)_showMonthOverlayInCellAtOffset:(double)a3 animated:(BOOL)a4
{
  unsigned int v7 = [(LargeWeekViewController *)self view];
  [v7 layoutIfNeeded];

  objc_super v8 = [(WeekViewController *)self visibleWeeks];
  v9[0] = _NSConcreteStackBlock;
  v9[1] = 3221225472;
  v9[2] = sub_1000E1950;
  v9[3] = &unk_1001D4F00;
  *(double *)&v9[4] = a3;
  BOOL v10 = a4;
  [v8 enumerateObjectsUsingBlock:v9];
}

- (void)overlayCalendarDidChange
{
  v3.receiver = self;
  v3.super_class = (Class)LargeWeekViewController;
  [(WeekViewController *)&v3 overlayCalendarDidChange];
  [(WeekViewController *)self currentScrollViewXOffset];
  -[LargeWeekViewController _showMonthOverlayInCellAtOffset:animated:](self, "_showMonthOverlayInCellAtOffset:animated:", 0);
}

- (double)minimumHourScale
{
  v12.receiver = self;
  v12.super_class = (Class)LargeWeekViewController;
  [(WeekViewController *)&v12 minimumHourScale];
  double v4 = v3;
  double v5 = [(WeekViewController *)self timeView];
  [v5 frame];
  double v7 = v6;

  objc_super v8 = [(LargeWeekViewController *)self view];
  +[EKDayTimeView defaultHeightForSizeClass:EKUIWidthSizeClassForViewHierarchy() orientation:1];
  double v10 = v9;

  double result = v7 / v10;
  if (v4 >= v7 / v10) {
    return v4;
  }
  return result;
}

- (void)handleCloseKeyCommand
{
  double v3 = [(MainViewController *)self shownEventEditViewController];
  if (v3)
  {
  }
  else
  {
    double v4 = [(MainViewController *)self shownEventViewController];

    if (v4)
    {
      v5[0] = _NSConcreteStackBlock;
      v5[1] = 3221225472;
      v5[2] = sub_1000E1B88;
      v5[3] = &unk_1001D2740;
      v5[4] = self;
      [(LargeWeekViewController *)self dismissViewControllerAnimated:1 completion:v5];
    }
  }
}

- (void)emptySpaceClickedOnDate:(id)a3
{
  v4.receiver = self;
  v4.super_class = (Class)LargeWeekViewController;
  [(WeekViewController *)&v4 emptySpaceClickedOnDate:a3];
  [(WeekViewController *)self _clearSelectedOccurrenceViews];
}

- (void)pasteboardManager:(id)a3 beginEditingEvent:(id)a4
{
}

- (void)_showEditorForEvent:(id)a3
{
  id v4 = a3;
  id v11 = v4;
  double v5 = +[NSArray arrayWithObjects:&v11 count:1];
  [(LargeWeekViewController *)self _setSelectedEvents:v5];

  double v6 = [(WeekViewController *)self occurrenceViewForEvent:v4];
  if (!v6)
  {
    double v7 = [(WeekViewController *)self eventGestureController];
    [v7 endForcedStart:0];

    objc_super v8 = [(WeekViewController *)self eventGestureController];
    double v9 = [0 occurrenceDate];
    [v8 forceStartWithOccurrence:v4 occurrenceDate:v9 shouldUpdateViewSource:1 shouldUpdateOrigin:1 shouldPresentEditMenu:0];

    double v10 = [(WeekViewController *)self eventGestureController];
    double v6 = [v10 draggingView];
  }
  [(LargeWeekViewController *)self _displayEventDetailsViewControllerForSelectedEventWithOccurrenceView:v6 showComments:0 context:0 forceShowEditor:1 creationMethod:3 completion:0];
}

- (TimerOperation)navigationThrottleOperation
{
  return self->_navigationThrottleOperation;
}

- (void)setNavigationThrottleOperation:(id)a3
{
}

- (NSOperationQueue)showEventDetailsOperationQueue
{
  return self->_showEventDetailsOperationQueue;
}

- (void)setShowEventDetailsOperationQueue:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_showEventDetailsOperationQueue, 0);
  objc_storeStrong((id *)&self->_navigationThrottleOperation, 0);

  objc_storeStrong((id *)&self->_eventToPresentOnAppear, 0);
}

@end