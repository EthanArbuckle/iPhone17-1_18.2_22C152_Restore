@interface DayViewController
- (BOOL)allEventsIndividuallyRepresented:(id)a3;
- (BOOL)allowChangingDate;
- (BOOL)allowsOverriddenRightNavigationBarItems;
- (BOOL)allowsOverriddenToolbarItems;
- (BOOL)creationGestureController:(id)a3 canActivateAtPoint:(CGPoint)a4;
- (BOOL)currentlyEditingEventsWithGestures;
- (BOOL)dayNavigationViewControllerAllowedToChangeSelectedDate;
- (BOOL)dayViewController:(id)a3 willDuplicateOccurrence:(id)a4;
- (BOOL)dayViewControllerShouldAllowLongPress:(id)a3;
- (BOOL)dayViewControllerShouldDrawSynchronously:(id)a3;
- (BOOL)dayViewControllerShouldShowDetachDialogOnGestureDraggingEnd:(id)a3;
- (BOOL)dayviewControllerShouldAllowSwipeToChangeDays:(id)a3;
- (BOOL)delegateWantsToHandleDayViewController:(id)a3 gestureCommittingOccurrence:(id)a4;
- (BOOL)didSelectEvent:(id)a3 userInitiated:(BOOL)a4;
- (BOOL)didSelectEvents:(id)a3 userInitiated:(BOOL)a4;
- (BOOL)eventViewControllerShouldShowNextPreviousRecurrenceButtons;
- (BOOL)eventViewDelegateShouldShowNextOccurrenceOfEvent:(id)a3 forward:(BOOL)a4;
- (BOOL)handlesNotifyOnExtendedLaunchCompletion;
- (BOOL)isDateVisible:(id)a3;
- (BOOL)isTodayVisible;
- (BOOL)shouldAllowLongPress;
- (BOOL)shouldHandleGestureCommits;
- (BOOL)shouldPushNextLevelViewControllerWhenTodayIsVisible;
- (BOOL)shouldRespondToApplicationDidBecomeActiveStateChange;
- (BOOL)showDetachAlertOnDraggingGestureEnd;
- (BOOL)showWeekdayLabel;
- (BOOL)visible;
- (CGPoint)creationGestureController:(id)a3 requestsPointForDate:(id)a4;
- (CGRect)scrubberFrameWithPaletteView:(id)a3;
- (CGSize)cellSize;
- (DayViewController)initWithDay:(id)a3 model:(id)a4 window:(id)a5;
- (EKCalendarDate)day;
- (NSArray)timedDayViewContentGridSubviews;
- (UIView)allDayView;
- (UIView)topLabelsContainer;
- (double)creationGestureController:(id)a3 requestedWidthForEventPreview:(id)a4 atPoint:(CGPoint)a5;
- (double)creationGestureController:(id)a3 requestedXCoordinateForEventPreviewAtPoint:(CGPoint)a4;
- (double)dayViewControllerPersistedHourScalePreference:(id)a3;
- (double)firstCellInset;
- (id)_parentViewForCreationGesture;
- (id)_selectedOccurrenceFrontmostClonedViews;
- (id)_selectedOccurrenceViews;
- (id)bestDateForNewEvent;
- (id)calendarForNewIntegrationReminders;
- (id)calendarModel;
- (id)cellFactory;
- (id)creationGestureController:(id)a3 dateForPoint:(CGPoint)a4;
- (id)creationGestureController:(id)a3 requestedPreviewForEvent:(id)a4;
- (id)creationGestureControllerRequestsNewEvent:(id)a3;
- (id)dayScrubberController;
- (id)dayView;
- (id)dayViewController:(id)a3 createEventAtDate:(id)a4 allDay:(BOOL)a5;
- (id)dayViewController:(id)a3 createReminderAtDate:(id)a4 allDay:(BOOL)a5;
- (id)dayViewController:(id)a3 eventsForStartDate:(id)a4 endDate:(id)a5;
- (id)dayViewController:(id)a3 selectedCopyViewForView:(id)a4;
- (id)defaultCalendarForNewEvents;
- (id)eventEditViewControllerDefaultCalendarForNewEvents:(id)a3;
- (id)gestureController;
- (id)pasteboardManager;
- (id)pasteboardManagerForDayViewController:(id)a3;
- (id)pasteboardManagerForEventEditViewController:(id)a3;
- (id)sceneTitle;
- (id)selectedCopyViewForOccurrenceView:(id)a3;
- (id)selectedEventsForEditMenu;
- (id)selectedOccurrencesForDayViewController:(id)a3;
- (id)showDetailViewControllerForEvent:(id)a3 context:(id)a4 animated:(BOOL)a5;
- (id)showDetailViewControllerForEvents:(id)a3 animated:(BOOL)a4;
- (id)testingRotationDidEndNotificationName;
- (id)testingRotationWillStartNotificationName;
- (int)editorHideTransition;
- (int)editorShowTransition;
- (int)savedFirstVisibleSecond;
- (int64_t)intendedSizeClass;
- (int64_t)scrubberFirstVisibleDayOffsetFromSelectedDay;
- (void)_cleanupSelectedOccurrenceCloneViews;
- (void)_cleanupSelectedOccurrenceCloneViewsRespectingModelSelected;
- (void)_cleanupSelectedOccurrenceCloneViewsSkipSet:(id)a3;
- (void)_contentSizeCategoryChanged:(id)a3;
- (void)_occurrencesChanged:(id)a3;
- (void)_receivedSelectedDateChangeNotification:(id)a3;
- (void)_recursiveRemoveSelectedClonedViewsFromViewTree:(id)a3 skipSet:(id)a4;
- (void)_sceneEnteredForeground:(id)a3;
- (void)_scrollToEvent:(id)a3 animated:(BOOL)a4;
- (void)_selectedOccurrencesChanged:(id)a3;
- (void)_setUpSelectedOccurrenceViewsWithEvents:(id)a3 animated:(BOOL)a4 autoScroll:(BOOL)a5 resetSelection:(BOOL)a6;
- (void)_showDetailForEvent:(id)a3 animated:(BOOL)a4 context:(id)a5;
- (void)_showDetailForEvent:(id)a3 animated:(BOOL)a4 showComments:(BOOL)a5 context:(id)a6;
- (void)_showDetailForEvent:(id)a3 animated:(BOOL)a4 userInitiated:(BOOL)a5;
- (void)_showDetailForEvents:(id)a3 animated:(BOOL)a4;
- (void)_showDetailForEvents:(id)a3 animated:(BOOL)a4 userInitiated:(BOOL)a5;
- (void)_showNowWhenSameDaySelected;
- (void)_significantTimeChanged:(id)a3;
- (void)_timeZoneChanged:(id)a3;
- (void)addEventToSelection:(id)a3;
- (void)beginEditingOccurrence:(id)a3 creationMethod:(unint64_t)a4;
- (void)clearSelection;
- (void)creationGestureController:(id)a3 didCreateNewEvent:(id)a4;
- (void)creationGestureController:(id)a3 didResizeToDate:(id)a4;
- (void)creationGestureControllerDidCancel:(id)a3;
- (void)currentlyVisibleDateRangeFromStartDate:(id *)a3 toEndDate:(id *)a4;
- (void)dataReloadedWithTrigger:(int)a3;
- (void)dayNavigationViewController:(id)a3 didChangeCellWidth:(double)a4;
- (void)dayNavigationViewController:(id)a3 didSelectDate:(id)a4;
- (void)dayNavigationViewControllerFailedToChangeDate:(id)a3;
- (void)dayOccurrenceViewSelected:(id)a3 source:(unint64_t)a4;
- (void)dayViewController:(id)a3 awaitsDeletingOccurrence:(id)a4;
- (void)dayViewController:(id)a3 awaitsRefreshingOccurrence:(id)a4;
- (void)dayViewController:(id)a3 beginEditingOccurrence:(id)a4 creationMethod:(unint64_t)a5;
- (void)dayViewController:(id)a3 didChangeDisplayDate:(id)a4;
- (void)dayViewController:(id)a3 didChangeDisplayedOccurrencesDueToTrigger:(int)a4;
- (void)dayViewController:(id)a3 didReloadDataDueToTrigger:(int)a4;
- (void)dayViewController:(id)a3 didSelectEvent:(id)a4 animated:(BOOL)a5 userInitiated:(BOOL)a6;
- (void)dayViewController:(id)a3 didSelectEvents:(id)a4 animated:(BOOL)a5 userInitiated:(BOOL)a6;
- (void)dayViewController:(id)a3 didStartDeceleratingTargettingDate:(id)a4;
- (void)dayViewController:(id)a3 handleGestureCommittingOccurrence:(id)a4;
- (void)dayViewController:(id)a3 modifySelection:(id)a4;
- (void)dayViewController:(id)a3 requestsPresentationOfViewControllerForGestures:(id)a4;
- (void)dayViewController:(id)a3 requestsSaveFirstVisibleSecondPreference:(int)a4;
- (void)dayViewController:(id)a3 requestsSaveHourScalePreference:(double)a4;
- (void)dayViewController:(id)a3 requestsShowEvent:(id)a4 showDetails:(BOOL)a5;
- (void)dayViewControllerCurrentDayDidCompleteAsyncLoadAndLayout:(id)a3;
- (void)dayViewControllerDidBeginMovingEventWithGesture:(id)a3;
- (void)dayViewControllerDidEndDecelerating:(id)a3;
- (void)dayViewControllerDidEndScrolling:(id)a3;
- (void)dayViewControllerDidFinishPinchingDayView:(id)a3;
- (void)dayViewControllerDidRespondToApplicationDidBecomeActiveStateChange:(id)a3;
- (void)dayViewControllerDidTapEmptySpace:(id)a3 onDate:(id)a4;
- (void)dayViewControllerIsPinchingDayView:(id)a3;
- (void)dayViewDidChangeSelectedDate:(id)a3;
- (void)dealloc;
- (void)eventEditViewController:(id)a3 didCompleteWithAction:(int64_t)a4;
- (void)eventEditViewController:(id)a3 didCompleteWithAction:(int64_t)a4 completionHandler:(id)a5;
- (void)eventEditViewController:(id)a3 didCompleteWithAction:(int64_t)a4 dismissController:(BOOL)a5;
- (void)eventEditViewController:(id)a3 didCompleteWithAction:(int64_t)a4 dismissController:(BOOL)a5 completionHandler:(id)a6;
- (void)eventViewController:(id)a3 didCompleteWithAction:(int64_t)a4;
- (void)eventViewController:(id)a3 requestsShowEvent:(id)a4;
- (void)eventViewController:(id)a3 willDismissEditViewController:(id)a4 deleted:(BOOL)a5;
- (void)eventViewControllerNextButtonWasTapped:(id)a3;
- (void)eventViewControllerPreviousButtonWasTapped:(id)a3;
- (void)eventViewControllerWillDisappear:(id)a3;
- (void)eventViewDelegateShowNextOccurrenceOfEvent:(id)a3 forward:(BOOL)a4;
- (void)extendedLaunchCompletedByViewType:(int)a3;
- (void)finishedPinchingDayView;
- (void)loadView;
- (void)presentDetailsForEvents:(id)a3 animated:(BOOL)a4 showComments:(BOOL)a5 context:(id)a6;
- (void)reloadData;
- (void)removeEventFromSelection:(id)a3;
- (void)saveFirstVisibleSecond:(int)a3;
- (void)scrubberDidChangeSelectedDate:(id)a3;
- (void)selectDate:(id)a3 andTime:(BOOL)a4 animated:(BOOL)a5;
- (void)selectDate:(id)a3 animated:(BOOL)a4;
- (void)setShouldRespondToApplicationDidBecomeActiveStateChange:(BOOL)a3;
- (void)setVisible:(BOOL)a3;
- (void)showEditViewController:(id)a3;
- (void)showEvent:(id)a3 animated:(BOOL)a4 showMode:(unint64_t)a5 context:(id)a6;
- (void)showNowAnimated:(BOOL)a3;
- (void)showReminderDetail:(id)a3;
- (void)updatePalette:(id)a3;
- (void)viewDidAppear:(BOOL)a3;
- (void)viewDidDisappear:(BOOL)a3;
- (void)viewDidLoad;
- (void)viewWillAppear:(BOOL)a3;
- (void)viewWillLayoutSubviews;
- (void)viewWillTransitionToSize:(CGSize)a3 withTransitionCoordinator:(id)a4;
@end

@implementation DayViewController

- (double)dayViewControllerPersistedHourScalePreference:(id)a3
{
  v4 = [(CUIKCalendarModel *)self->super._model persistedSceneState];

  if (!v4) {
    return -1.0;
  }
  v5 = [(CUIKCalendarModel *)self->super._model persistedSceneState];
  [v5 dayViewHourScale];
  double v7 = v6;

  return v7;
}

- (int)savedFirstVisibleSecond
{
  if (!EKUIShouldSaveStateInPreferences())
  {
    v8 = [(MainViewController *)self model];
    v9 = [v8 persistedSceneState];

    if (v9)
    {
      v5 = [(MainViewController *)self model];
      double v6 = [v5 persistedSceneState];
      unsigned int v7 = [v6 dayViewFirstVisibleSecond];
      goto LABEL_6;
    }
    return -1;
  }
  v3 = +[CUIKPreferences sharedPreferences];
  v4 = [v3 dayViewFirstVisibleSecond];

  if (!v4) {
    return -1;
  }
  v5 = +[CUIKPreferences sharedPreferences];
  double v6 = [v5 dayViewFirstVisibleSecond];
  unsigned int v7 = [v6 intValue];
LABEL_6:
  int v10 = v7;

  return v10;
}

- (void)viewDidAppear:(BOOL)a3
{
  BOOL v3 = a3;
  previousNavigationTitle = self->_previousNavigationTitle;
  self->_previousNavigationTitle = 0;

  double v6 = [(DayViewController *)self navigationController];
  unsigned int v7 = [v6 extendedLaunchFinished];

  if (v7)
  {
    [(CUIKCalendarModel *)self->super._model setDesiredPaddingDays:1];
    [(CUIKCalendarModel *)self->super._model setComponentForExpandingPadding:16];
  }
  v8.receiver = self;
  v8.super_class = (Class)DayViewController;
  [(MainViewController *)&v8 viewDidAppear:v3];
}

- (void)extendedLaunchCompletedByViewType:(int)a3
{
  v6.receiver = self;
  v6.super_class = (Class)DayViewController;
  [(MainViewController *)&v6 extendedLaunchCompletedByViewType:*(void *)&a3];
  dispatch_time_t v4 = dispatch_time(0, 300000000);
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_1001306E8;
  block[3] = &unk_1001D2740;
  block[4] = self;
  dispatch_after(v4, (dispatch_queue_t)&_dispatch_main_q, block);
}

- (void)_receivedSelectedDateChangeNotification:(id)a3
{
  dispatch_time_t v4 = [(DayViewController *)self view];
  v5 = [v4 window];

  if (v5)
  {
    id v9 = [(MainViewController *)self model];
    objc_super v6 = [(EKCalendarDate *)self->_day date];
    unsigned int v7 = [(EKCalendarDate *)self->_day calendarDateForEndOfDay];
    objc_super v8 = [v7 date];
    [v9 setPreferredReloadStartDate:v6 endDate:v8];
  }
}

- (DayViewController)initWithDay:(id)a3 model:(id)a4 window:(id)a5
{
  id v8 = a3;
  v22.receiver = self;
  v22.super_class = (Class)DayViewController;
  id v9 = [(MainViewController *)&v22 initWithWindow:a5 model:a4];
  int v10 = v9;
  if (v9)
  {
    [(DayViewController *)v9 setEdgesForExtendedLayout:0];
    uint64_t v11 = [v8 calendarDateForDay];
    day = v10->_day;
    v10->_day = (EKCalendarDate *)v11;

    v10->_hasReloadedWithData = 0;
    v10->_hasEndedExtendedLaunch = 0;
    v13 = +[NSNotificationCenter defaultCenter];
    [v13 addObserver:v10 selector:"_occurrencesChanged:" name:CUIKCalendarModelDisplayedOccurrencesChangedNotification object:v10->super._model];

    v14 = +[NSNotificationCenter defaultCenter];
    [v14 addObserver:v10 selector:"_selectedOccurrencesChanged:" name:CUIKCalendarModelSelectedOccurrencesChangedNotification object:v10->super._model];

    v15 = +[NSNotificationCenter defaultCenter];
    [v15 addObserver:v10 selector:"_contentSizeCategoryChanged:" name:UIContentSizeCategoryDidChangeNotification object:0];

    v16 = +[NSNotificationCenter defaultCenter];
    [v16 addObserver:v10 selector:"virtualConferenceAppChanged:" name:EKConferenceUtilsAppRecordChangedNotification object:0];

    model = v10->super._model;
    v18 = [(EKCalendarDate *)v10->_day date];
    v19 = [(EKCalendarDate *)v10->_day calendarDateForEndOfDay];
    v20 = [v19 date];
    [(CUIKCalendarModel *)model setPreferredReloadStartDate:v18 endDate:v20];
  }
  return v10;
}

- (void)dayViewController:(id)a3 requestsSaveFirstVisibleSecondPreference:(int)a4
{
  uint64_t v4 = *(void *)&a4;
  objc_super v6 = [(MainViewController *)self window];
  unsigned int v7 = [v6 windowScene];
  id v8 = [v7 activationState];

  if (!v8)
  {
    [(DayViewController *)self saveFirstVisibleSecond:v4];
  }
}

- (void)viewWillAppear:(BOOL)a3
{
  v27.receiver = self;
  v27.super_class = (Class)DayViewController;
  [(DayViewController *)&v27 viewWillAppear:a3];
  if (!self->_viewHasDoneFirstAppearance)
  {
    uint64_t v4 = +[NSNotificationCenter defaultCenter];
    [v4 addObserver:self selector:"_significantTimeChanged:" name:CUIKCalendarModelSignificantTimeChangeNotification object:self->super._model];
    [v4 addObserver:self selector:"_timeZoneChanged:" name:CUIKCalendarModelTimeZoneChangedNotification object:self->super._model];
    [v4 addObserver:self selector:"_receivedSelectedDateChangeNotification:" name:CUIKCalendarModelSelectedDateChangedNotification object:self->super._model];
    self->_viewHasDoneFirstAppearance = 1;
  }
  v5 = [(DayViewController *)self navigationItem];
  objc_super v6 = [v5 title];
  previousNavigationTitle = self->_previousNavigationTitle;
  self->_previousNavigationTitle = v6;

  id v8 = [(DayViewController *)self navigationItem];
  [v8 setTitle:&stru_1001D6918];

  id v9 = [(MainViewController *)self window];
  EKUIPushFallbackSizingContextWithViewHierarchy();

  id v10 = [(EKDayViewController *)self->_dayViewController view];
  uint64_t v11 = [(MainViewController *)self window];
  EKUIPopFallbackSizingContextWithViewHierarchy();

  v12 = [(EKDayViewController *)self->_dayViewController displayDate];
  v13 = [(CUIKCalendarModel *)self->super._model calendar];
  v14 = [v13 timeZone];
  v15 = +[EKCalendarDate calendarDateWithDateComponents:v12 timeZone:v14];

  v16 = [(CUIKCalendarModel *)self->super._model calendar];
  v17 = [v15 date];
  v18 = [(CUIKCalendarModel *)self->super._model selectedDate];
  v19 = [v18 date];
  unsigned __int8 v20 = [v16 isDate:v17 inSameDayAsDate:v19];

  if ((v20 & 1) == 0)
  {
    v21 = [(MainViewController *)self model];
    objc_super v22 = [v21 selectedDate];
    [(DayViewController *)self selectDate:v22 animated:0];

    v23 = [(MainViewController *)self model];
    uint64_t v24 = [v23 selectedDate];

    v15 = (void *)v24;
  }
  scrubberControllerNeue = self->_scrubberControllerNeue;
  v26 = [v15 date];
  [(DayNavigationViewController *)scrubberControllerNeue setSelectedDate:v26 animated:0];
}

- (void)viewWillLayoutSubviews
{
  if (!self->_hasSetUpDayViewInitialLayout)
  {
    BOOL v3 = [(MainViewController *)self window];
    EKUIPushFallbackSizingContextWithViewHierarchy();

    uint64_t v4 = [(EKDayViewController *)self->_dayViewController view];
    [v4 setAutoresizingMask:18];

    v5 = [(DayViewController *)self view];
    [v5 bounds];
    double v7 = v6;

    id v8 = [(DayViewController *)self view];
    [v8 bounds];
    double v10 = v9;

    dayViewController = self->_dayViewController;
    [(EKDayViewController *)dayViewController gutterWidth];
    -[EKDayViewController setFrame:gutterWidth:](dayViewController, "setFrame:gutterWidth:", 0.0, 0.0, v7, v10, v12);
    v13 = [(MainViewController *)self window];
    EKUIPopFallbackSizingContextWithViewHierarchy();

    self->_hasSetUpDayViewInitialLayout = 1;
  }
  v14.receiver = self;
  v14.super_class = (Class)DayViewController;
  [(DayViewController *)&v14 viewWillLayoutSubviews];
}

- (void)_occurrencesChanged:(id)a3
{
  id v17 = a3;
  uint64_t v4 = [(DayViewController *)self view];
  v5 = [v4 superview];

  if (v5)
  {
    double v6 = [v17 userInfo];

    if (v6)
    {
      double v7 = [v17 userInfo];
      id v8 = [v7 objectForKey:CUIKCalendarModelDisplayedOccurrencesChangedRangeStartKey];

      double v9 = [v17 userInfo];
      double v10 = [v9 objectForKey:CUIKCalendarModelDisplayedOccurrencesChangedRangeEndKey];

      uint64_t v11 = [v17 userInfo];
      double v12 = [v11 objectForKey:CUIKCalendarModelDisplayedOccurrencesChangedFilteredAllKey];

      v13 = [v17 userInfo];
      objc_super v14 = [v13 objectForKey:CUIKCalendarModelDisplayedOccurrencesChangedGenerationKey];

      if (([v12 BOOLValue] & 1) == 0) {
        self->_hasReloadedWithData = 1;
      }
      if (self->_viewHasDoneFirstAppearance)
      {
        id v15 = [v14 intValue];
        dayViewController = self->_dayViewController;
        if (v8 && v10) {
          [(EKDayViewController *)dayViewController loadDataBetweenStart:v8 end:v10 withTrigger:1 generation:v15 completionForCurrentDayReload:0];
        }
        else {
          [(EKDayViewController *)dayViewController reloadDataForOccurrenceChangeWithGeneration:v15];
        }
      }
    }
    else
    {
      [(EKDayViewController *)self->_dayViewController reloadData];
    }
  }
  else
  {
    [(EKDayViewController *)self->_dayViewController setNeedsReload];
  }
}

- (CGSize)cellSize
{
  v2 = [(DayNavigationViewController *)self->_scrubberControllerNeue weekScrollView];
  [v2 cellSize];
  double v4 = v3;
  double v6 = v5;

  double v7 = v4;
  double v8 = v6;
  result.height = v8;
  result.width = v7;
  return result;
}

- (void)updatePalette:(id)a3
{
  id v4 = a3;
  [v4 setWeekdayHeaderVisible:1];
  [v4 setWeekdayHeaderFillsHalfWidth:0];
  id v9 = [(DayViewController *)self dayScrubberController];
  [v4 setDayScrubberController:v9];
  double v5 = [v9 view];
  [v5 setNeedsLayout];

  [v4 setUseCustomDayFrames:0];
  [v4 setFocusBannerPlacement:1];
  [v4 sizeToFit];
  [v4 frame];
  double v7 = v6;
  double v8 = [v4 containingPalette];

  [v8 setPreferredHeight:v7];
}

- (id)dayScrubberController
{
  return self->_scrubberControllerNeue;
}

- (void)setShouldRespondToApplicationDidBecomeActiveStateChange:(BOOL)a3
{
  self->_shouldRespondToApplicationDidBecomeActiveStateChange = a3;
}

- (void)selectDate:(id)a3 andTime:(BOOL)a4 animated:(BOOL)a5
{
  BOOL v5 = a5;
  BOOL v6 = a4;
  id v8 = a3;
  if (v8)
  {
    id v9 = [(MainViewController *)self shownEventEditViewController];

    if (!v9)
    {
      double v10 = [(CUIKCalendarModel *)self->super._model eventStore];
      uint64_t v11 = [v10 timeZone];

      double v12 = [v8 calendarDateInTimeZone:v11];
      v13 = [v12 calendarDateForDay];
      day = self->_day;
      self->_day = v13;

      if (!self->_scrubberControllerNeue || !self->_dayViewController)
      {
LABEL_24:

        goto LABEL_25;
      }
      v37 = v12;
      BOOL v38 = v6;
      id v15 = self->_day;
      v16 = +[NSCalendar currentCalendar];
      id v17 = [(EKDayViewController *)self->_dayViewController displayDate];
      v18 = [v16 dateFromComponents:v17];
      v36 = v11;
      v19 = +[EKCalendarDate calendarDateWithDate:v18 timeZone:v11];
      id v20 = [(EKCalendarDate *)v15 differenceInDays:v19];

      if (v20) {
        BOOL v21 = v5;
      }
      else {
        BOOL v21 = 0;
      }
      objc_super v22 = [(EKCalendarDate *)self->_day date];
      v23 = [(MainViewController *)self model];
      [v23 setSelectedDate:v8];

      uint64_t v24 = [(MainViewController *)self model];
      v25 = [(EKCalendarDate *)self->_day calendarDateForEndOfDay];
      v26 = [v25 date];
      [v24 setPreferredReloadStartDate:v22 endDate:v26];

      if (v21)
      {
        if ([(DayNavigationViewController *)self->_scrubberControllerNeue canAnimateToDate:v22])
        {
          [(DayNavigationViewController *)self->_scrubberControllerNeue setSelectedDate:v22 animated:1];
          objc_super v27 = [(CUIKCalendarModel *)self->super._model calendar];
          v28 = [v27 components:30 fromDate:v22];
          [(EKDayViewController *)self->_dayViewController setDisplayDate:v28];
        }
        else
        {
          objc_super v27 = [(CUIKCalendarModel *)self->super._model calendar];
          id v33 = [(EKDayViewController *)self->_dayViewController alwaysAnimate];
          [(EKDayViewController *)self->_dayViewController setAlwaysAnimate:0];
          v34 = [v27 components:30 fromDate:v22];
          [(EKDayViewController *)self->_dayViewController setDisplayDate:v34];

          [(EKDayViewController *)self->_dayViewController setAlwaysAnimate:v33];
          [(DayNavigationViewController *)self->_scrubberControllerNeue setSelectedDate:v22 animated:0];
        }
        uint64_t v11 = v36;

        [(DayViewController *)self dayViewDidChangeSelectedDate:v22];
        double v12 = v37;
      }
      else
      {
        [(DayNavigationViewController *)self->_scrubberControllerNeue setSelectedDate:v22 animated:0];
        id v30 = v20;
        if (!v20 && v5) {
          [(DayNavigationViewController *)self->_scrubberControllerNeue pulseToday];
        }
        v31 = [(CUIKCalendarModel *)self->super._model calendar];
        v32 = [v31 components:30 fromDate:v22];
        [(EKDayViewController *)self->_dayViewController setDisplayDate:v32];

        [(DayViewController *)self dayViewDidChangeSelectedDate:v22];
        uint64_t v11 = v36;
        double v12 = v37;
        if (!v30)
        {
          [(DayViewController *)self _showNowWhenSameDaySelected];
LABEL_21:
          if (v38)
          {
            v35 = [(DayViewController *)self dayView];
            [v35 scrollToDate:v8 animated:v21];
          }
          goto LABEL_24;
        }
      }
      [(MainViewController *)self setSceneTitleNeedsUpdate];
      goto LABEL_21;
    }
  }
  else
  {
    v29 = kCalUILogHandle;
    if (os_log_type_enabled((os_log_t)kCalUILogHandle, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315138;
      v40 = "-[DayViewController selectDate:andTime:animated:]";
      _os_log_impl((void *)&_mh_execute_header, v29, OS_LOG_TYPE_ERROR, "%s received with nil date.", buf, 0xCu);
    }
  }
LABEL_25:
}

- (void)dayViewDidChangeSelectedDate:(id)a3
{
  model = self->super._model;
  id v5 = a3;
  id v9 = [(CUIKCalendarModel *)model calendar];
  BOOL v6 = [v9 timeZone];
  double v7 = +[EKCalendarDate calendarDateWithDate:v5 timeZone:v6];

  day = self->_day;
  self->_day = v7;
}

- (void)_showNowWhenSameDaySelected
{
  [(DayViewController *)self showNowAnimated:[(DayViewController *)self shouldRespondToApplicationDidBecomeActiveStateChange] ^ 1];
  if ([(DayViewController *)self shouldRespondToApplicationDidBecomeActiveStateChange])
  {
    [(DayViewController *)self setShouldRespondToApplicationDidBecomeActiveStateChange:0];
  }
}

- (BOOL)shouldRespondToApplicationDidBecomeActiveStateChange
{
  return self->_shouldRespondToApplicationDidBecomeActiveStateChange;
}

- (void)viewDidLoad
{
  v15.receiver = self;
  v15.super_class = (Class)DayViewController;
  [(DayViewController *)&v15 viewDidLoad];
  [(DayViewController *)self selectDate:self->_day animated:0];
  double v3 = +[NSNotificationCenter defaultCenter];
  [v3 addObserver:self selector:"_sceneEnteredForeground:" name:UISceneWillEnterForegroundNotification object:0];
  uint64_t v4 = [(DayViewController *)self savedFirstVisibleSecond];
  id v5 = [(DayViewController *)self dayView];
  [v5 setStartingFirstVisibleSecond:v4];

  id v6 = objc_alloc((Class)EKEventCreationGestureController);
  double v7 = [(DayViewController *)self dayView];
  id v8 = [v7 view];
  id v9 = (EKEventCreationGestureController *)[v6 initWithView:v8 delegate:self];
  eventCreationGestureController = self->_eventCreationGestureController;
  self->_eventCreationGestureController = v9;

  uint64_t v11 = [(MainViewController *)self window];
  EKUIPushFallbackSizingContextWithViewHierarchy();

  double v12 = [(DayViewController *)self view];
  v13 = [(EKDayViewController *)self->_dayViewController view];
  [v12 addSubview:v13];

  objc_super v14 = [(MainViewController *)self window];
  EKUIPopFallbackSizingContextWithViewHierarchy();
}

- (void)showNowAnimated:(BOOL)a3
{
  BOOL v3 = a3;
  id v4 = [(DayViewController *)self dayView];
  [v4 scrollToNow:v3];
}

- (id)dayView
{
  return self->_dayViewController;
}

- (void)loadView
{
  id v10 = [objc_alloc((Class)UIView) initWithFrame:CGRectZero.origin.x, CGRectZero.origin.y, CGRectZero.size.width, CGRectZero.size.height];
  [v10 setAutoresizingMask:18];
  BOOL v3 = +[UIColor systemBackgroundColor];
  [v10 setBackgroundColor:v3];

  id v4 = [[DayNavigationViewController alloc] initWithModel:self->super._model];
  scrubberControllerNeue = self->_scrubberControllerNeue;
  self->_scrubberControllerNeue = v4;

  id v6 = [(DayViewController *)self cellFactory];
  [(DayNavigationViewController *)self->_scrubberControllerNeue setCellFactory:v6];

  [(DayNavigationViewController *)self->_scrubberControllerNeue setDelegate:self];
  [(DayViewController *)self addChildViewController:self->_scrubberControllerNeue];
  [(DayNavigationViewController *)self->_scrubberControllerNeue didMoveToParentViewController:self];
  double v7 = [objc_alloc((Class)EKDayViewController) initWithTargetSizeClass:[self intendedSizeClass]];
  dayViewController = self->_dayViewController;
  self->_dayViewController = v7;

  [(EKDayViewController *)self->_dayViewController setShouldLogVisibleEvents:1];
  [(EKDayViewController *)self->_dayViewController setShouldAutoscrollAfterAppearance:0];
  [(EKDayViewController *)self->_dayViewController setDataSource:self];
  [(EKDayViewController *)self->_dayViewController setDelegate:self];
  [(EKDayViewController *)self->_dayViewController setShowsBanner:0];
  [(EKDayViewController *)self->_dayViewController setAlwaysAnimate:1];
  [(EKDayViewController *)self->_dayViewController setDisableNotifyDateChangeDuringTracking:1];
  id v9 = [(DayViewController *)self navigationController];
  -[EKDayViewController setPreloadExtraDays:](self->_dayViewController, "setPreloadExtraDays:", [v9 extendedLaunchFinished]);

  [(EKDayViewController *)self->_dayViewController setShowWeekdayLabel:[(DayViewController *)self showWeekdayLabel]];
  [(DayViewController *)self addChildViewController:self->_dayViewController];
  [(EKDayViewController *)self->_dayViewController didMoveToParentViewController:self];
  [(DayViewController *)self setView:v10];
}

- (BOOL)dayViewControllerShouldDrawSynchronously:(id)a3
{
  return !self->_hasEndedExtendedLaunch;
}

- (BOOL)shouldPushNextLevelViewControllerWhenTodayIsVisible
{
  return 0;
}

- (void)selectDate:(id)a3 animated:(BOOL)a4
{
}

- (BOOL)handlesNotifyOnExtendedLaunchCompletion
{
  return 1;
}

- (EKCalendarDate)day
{
  return self->_day;
}

- (void)dayViewControllerCurrentDayDidCompleteAsyncLoadAndLayout:(id)a3
{
}

- (id)dayViewController:(id)a3 eventsForStartDate:(id)a4 endDate:(id)a5
{
  return [(CUIKCalendarModel *)self->super._model occurrencesForStartDate:a4 endDate:a5 preSorted:1 waitForLoad:!self->_hasReloadedWithData];
}

- (void)dayViewController:(id)a3 didChangeDisplayedOccurrencesDueToTrigger:(int)a4
{
  [(DayViewController *)self displayedOccurrencesChangedWithTrigger:*(void *)&a4];
  if (self->_hasReloadedWithData && !self->_hasEndedExtendedLaunch)
  {
    self->_hasEndedExtendedLaunch = 1;
    [(DayViewController *)self extendedLaunchCompletedByViewType:3];
  }
}

- (void)dayNavigationViewController:(id)a3 didChangeCellWidth:(double)a4
{
}

- (BOOL)allowsOverriddenToolbarItems
{
  return 1;
}

- (BOOL)allowsOverriddenRightNavigationBarItems
{
  return 1;
}

- (void)dealloc
{
  BOOL v3 = +[NSNotificationCenter defaultCenter];
  [v3 removeObserver:self name:CUIKCalendarModelDisplayedOccurrencesChangedNotification object:self->super._model];
  [v3 removeObserver:self name:CUIKCalendarModelSelectedOccurrencesChangedNotification object:self->super._model];
  [v3 removeObserver:self name:CUIKCalendarModelSignificantTimeChangeNotification object:self->super._model];
  [v3 removeObserver:self name:CUIKCalendarModelSelectedDateChangedNotification object:self->super._model];

  v4.receiver = self;
  v4.super_class = (Class)DayViewController;
  [(MainViewController *)&v4 dealloc];
}

- (void)viewDidDisappear:(BOOL)a3
{
  BOOL v3 = a3;
  previousNavigationTitle = self->_previousNavigationTitle;
  if (previousNavigationTitle)
  {
    id v6 = [(DayViewController *)self navigationItem];
    [v6 setTitle:previousNavigationTitle];

    double v7 = self->_previousNavigationTitle;
    self->_previousNavigationTitle = 0;
  }
  v8.receiver = self;
  v8.super_class = (Class)DayViewController;
  [(DayViewController *)&v8 viewDidDisappear:v3];
}

- (void)viewWillTransitionToSize:(CGSize)a3 withTransitionCoordinator:(id)a4
{
  double height = a3.height;
  double width = a3.width;
  id v7 = a4;
  if ([(DayViewController *)self isViewLoaded])
  {
    objc_super v8 = [(DayViewController *)self view];
    id v9 = [v8 window];

    if (v9)
    {
      v12.receiver = self;
      v12.super_class = (Class)DayViewController;
      -[MainViewController viewWillTransitionToSize:withTransitionCoordinator:](&v12, "viewWillTransitionToSize:withTransitionCoordinator:", v7, width, height);
      id v10 = [(DayViewController *)self dayView];
      [v10 viewWillTransitionToSize:v7 withTransitionCoordinator:width, height];

      uint64_t v11 = [(DayViewController *)self dayScrubberController];
      [v11 viewWillTransitionToSize:v7 withTransitionCoordinator:width, height];
    }
  }
}

- (void)_contentSizeCategoryChanged:(id)a3
{
}

- (BOOL)isTodayVisible
{
  return 0;
}

- (BOOL)isDateVisible:(id)a3
{
  id v4 = a3;
  id v5 = [(CUIKCalendarModel *)self->super._model calendar];
  id v6 = [(EKDayViewController *)self->_dayViewController displayDate];
  id v7 = [v5 dateFromComponents:v6];

  objc_super v8 = kCalUILogHandle;
  if (os_log_type_enabled((os_log_t)kCalUILogHandle, OS_LOG_TYPE_INFO))
  {
    int v11 = 138412546;
    id v12 = v4;
    __int16 v13 = 2112;
    objc_super v14 = v7;
    _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_INFO, "Day view determining if date %@ is visible. Onscreen date: %@", (uint8_t *)&v11, 0x16u);
  }
  unsigned __int8 v9 = [v5 isDate:v4 inSameDayAsDate:v7];

  return v9;
}

- (void)currentlyVisibleDateRangeFromStartDate:(id *)a3 toEndDate:(id *)a4
{
  id v14 = [(CUIKCalendarModel *)self->super._model calendar];
  id v7 = [(EKDayViewController *)self->_dayViewController displayDate];
  objc_super v8 = [v14 dateFromComponents:v7];

  if (a3)
  {
    unsigned __int8 v9 = [(CUIKCalendarModel *)self->super._model calendar];
    id v10 = [v9 timeZone];
    *a3 = [v8 dateForStartOfDayInTimeZone:v10];
  }
  if (a4)
  {
    int v11 = [v8 dateByAddingHours:1 inCalendar:v14];
    id v12 = [(CUIKCalendarModel *)self->super._model calendar];
    __int16 v13 = [v12 timeZone];
    *a4 = [v11 dateForEndOfDayInTimeZone:v13];
  }
}

- (void)showEvent:(id)a3 animated:(BOOL)a4 showMode:(unint64_t)a5 context:(id)a6
{
  BOOL v8 = a4;
  id v12 = a3;
  id v10 = a6;
  if (a5)
  {
    if (a5 == 3) {
      [(DayViewController *)self beginEditingOccurrence:v12 creationMethod:3];
    }
    else {
      [(DayViewController *)self _showDetailForEvent:v12 animated:v8 showComments:a5 == 2 context:v10];
    }
  }
  else
  {
    int v11 = [v12 startCalendarDate];
    [(DayViewController *)self selectDate:v11 animated:v8];

    [(DayViewController *)self clearSelection];
    [(DayViewController *)self addEventToSelection:v12];
    [(DayViewController *)self didShowEventWithoutShowingDetails:v12];
  }
  [(DayViewController *)self _scrollToEvent:v12 animated:v8];
}

- (void)addEventToSelection:(id)a3
{
  model = self->super._model;
  id v5 = a3;
  [(CUIKCalendarModel *)model selectOccurrence:v5];
  id v7 = v5;
  id v6 = +[NSArray arrayWithObjects:&v7 count:1];

  [(DayViewController *)self _setUpSelectedOccurrenceViewsWithEvents:v6 animated:1 autoScroll:0 resetSelection:0];
}

- (void)removeEventFromSelection:(id)a3
{
  id v4 = a3;
  [(CUIKCalendarModel *)self->super._model deselectOccurrence:v4];
  [(DayViewController *)self _selectedOccurrenceFrontmostClonedViews];
  long long v26 = 0u;
  long long v27 = 0u;
  long long v28 = 0u;
  long long v29 = 0u;
  id v5 = (id)objc_claimAutoreleasedReturnValue();
  id v6 = [v5 countByEnumeratingWithState:&v26 objects:v31 count:16];
  if (v6)
  {
    id v7 = v6;
    uint64_t v8 = *(void *)v27;
    while (2)
    {
      for (i = 0; i != v7; i = (char *)i + 1)
      {
        if (*(void *)v27 != v8) {
          objc_enumerationMutation(v5);
        }
        id v10 = *(void **)(*((void *)&v26 + 1) + 8 * i);
        int v11 = [v10 occurrence];
        unsigned int v12 = [v11 isEqual:v4];

        if (v12)
        {
          [v10 setDelegate:0];
          [v10 removeFromSuperview];
          goto LABEL_11;
        }
      }
      id v7 = [v5 countByEnumeratingWithState:&v26 objects:v31 count:16];
      if (v7) {
        continue;
      }
      break;
    }
  }
LABEL_11:

  long long v24 = 0u;
  long long v25 = 0u;
  long long v22 = 0u;
  long long v23 = 0u;
  BOOL v21 = self;
  __int16 v13 = self->_selectedOccurrenceViews;
  id v14 = [(NSMutableArray *)v13 countByEnumeratingWithState:&v22 objects:v30 count:16];
  if (v14)
  {
    id v15 = v14;
    uint64_t v16 = *(void *)v23;
    while (2)
    {
      for (j = 0; j != v15; j = (char *)j + 1)
      {
        if (*(void *)v23 != v16) {
          objc_enumerationMutation(v13);
        }
        v18 = *(void **)(*((void *)&v22 + 1) + 8 * (void)j);
        v19 = [v18 occurrence];
        unsigned int v20 = [v19 isEqual:v4];

        if (v20)
        {
          [(NSMutableArray *)v21->_selectedOccurrenceViews removeObject:v18];
          goto LABEL_21;
        }
      }
      id v15 = [(NSMutableArray *)v13 countByEnumeratingWithState:&v22 objects:v30 count:16];
      if (v15) {
        continue;
      }
      break;
    }
  }
LABEL_21:
}

- (void)clearSelection
{
}

- (id)bestDateForNewEvent
{
  return [(CUIKCalendarModel *)self->super._model selectedDate];
}

- (BOOL)currentlyEditingEventsWithGestures
{
  v2 = [(EKDayViewController *)self->_dayViewController gestureController];
  unsigned __int8 v3 = [v2 dragGestureInProgress];

  return v3;
}

- (id)testingRotationWillStartNotificationName
{
  return @"DayViewController_RotationAnimationStartedNotification";
}

- (id)testingRotationDidEndNotificationName
{
  return @"DayViewController_RotationAnimationCompletedNotification";
}

- (id)sceneTitle
{
  unsigned __int8 v3 = [(EKDayViewController *)self->_dayViewController displayDate];
  id v4 = [(MainViewController *)self model];
  id v5 = [v4 calendar];

  id v6 = [v5 dateFromComponents:v3];
  if (v6)
  {
    if ([v5 isDateInToday:v6])
    {
      id v7 = +[NSBundle bundleForClass:objc_opt_class()];
      uint64_t v8 = [v7 localizedStringForKey:@"Today" value:&stru_1001D6918 table:0];
    }
    else
    {
      uint64_t v8 = CUIKLongStringForDateWithCommaAndYear();
    }
  }
  else
  {
    uint64_t v8 = 0;
  }

  return v8;
}

- (void)setVisible:(BOOL)a3
{
  BOOL v3 = a3;
  self->_visible = a3;
  -[DayNavigationViewController setVisible:](self->_scrubberControllerNeue, "setVisible:");
  id v5 = [(EKDayViewController *)self->_dayViewController view];
  [v5 setHidden:!v3];
}

- (double)firstCellInset
{
  v2 = [(DayNavigationViewController *)self->_scrubberControllerNeue weekScrollView];
  [v2 frame];
  double v4 = v3;

  return v4;
}

- (CGRect)scrubberFrameWithPaletteView:(id)a3
{
  id v4 = a3;
  id v5 = [(DayViewController *)self view];
  id v6 = [(DayNavigationViewController *)self->_scrubberControllerNeue view];
  [v6 frame];
  [v5 convertRect:v4 fromView:];
  double v8 = v7;
  double v10 = v9;
  double v12 = v11;
  double v14 = v13;

  double v15 = v8;
  double v16 = v10;
  double v17 = v12;
  double v18 = v14;
  result.size.double height = v18;
  result.size.double width = v17;
  result.origin.y = v16;
  result.origin.x = v15;
  return result;
}

- (int64_t)scrubberFirstVisibleDayOffsetFromSelectedDay
{
  v2 = [(DayNavigationViewController *)self->_scrubberControllerNeue weekScrollView];
  id v3 = [v2 firstVisibleDayOffsetFromSelectedDay];

  return (int64_t)v3;
}

- (UIView)allDayView
{
  return (UIView *)[(EKDayViewController *)self->_dayViewController currentAllDayView];
}

- (UIView)topLabelsContainer
{
  return (UIView *)[(EKDayViewController *)self->_dayViewController currentTopLabelsContainer];
}

- (NSArray)timedDayViewContentGridSubviews
{
  return (NSArray *)[(EKDayViewController *)self->_dayViewController currentDayContentGridViewSubviews];
}

- (void)reloadData
{
  self->_hasReloadedWithData = 1;
  [(EKDayViewController *)self->_dayViewController reloadData];
}

- (void)presentDetailsForEvents:(id)a3 animated:(BOOL)a4 showComments:(BOOL)a5 context:(id)a6
{
  BOOL v6 = a5;
  BOOL v7 = a4;
  id v13 = a6;
  id v10 = a3;
  if ((unint64_t)[v10 count] < 2)
  {
    double v11 = [v10 firstObject];
    [(DayViewController *)self _showDetailForEvent:v11 animated:v7 showComments:v6 context:v13];
  }
  else
  {
    [(DayViewController *)self _showDetailForEvents:v10 animated:v7];
  }
  double v12 = [v10 firstObject];

  [(DayViewController *)self _scrollToEvent:v12 animated:v7];
}

- (void)beginEditingOccurrence:(id)a3 creationMethod:(unint64_t)a4
{
  id v5 = +[AddEventViewController editOrAddViewControllerForEventOrIntegrationWithEvent:a3 model:self->super._model creationMethod:a4 eventEditViewDelegate:self];
  [(DayViewController *)self showEditViewController:v5];
}

- (void)_showDetailForEvent:(id)a3 animated:(BOOL)a4 userInitiated:(BOOL)a5
{
  id v8 = a3;
  objc_initWeak(&location, self);
  double v12 = _NSConcreteStackBlock;
  uint64_t v13 = 3221225472;
  double v14 = sub_100130CF4;
  double v15 = &unk_1001D6058;
  objc_copyWeak(&v17, &location);
  id v9 = v8;
  id v16 = v9;
  BOOL v18 = a5;
  BOOL v19 = a4;
  id v10 = objc_retainBlock(&v12);
  double v11 = +[CalendarTipsManager sharedManager];
  [v11 dismissTipDueToUserNavigationWithCompletionBlock:v10];

  objc_destroyWeak(&v17);
  objc_destroyWeak(&location);
}

- (void)_showDetailForEvents:(id)a3 animated:(BOOL)a4 userInitiated:(BOOL)a5
{
  id v8 = a3;
  objc_initWeak(&location, self);
  double v12 = _NSConcreteStackBlock;
  uint64_t v13 = 3221225472;
  double v14 = sub_100130E94;
  double v15 = &unk_1001D6058;
  objc_copyWeak(&v17, &location);
  id v9 = v8;
  id v16 = v9;
  BOOL v18 = a5;
  BOOL v19 = a4;
  id v10 = objc_retainBlock(&v12);
  double v11 = +[CalendarTipsManager sharedManager];
  [v11 dismissTipDueToUserNavigationWithCompletionBlock:v10];

  objc_destroyWeak(&v17);
  objc_destroyWeak(&location);
}

- (void)dayNavigationViewController:(id)a3 didSelectDate:(id)a4
{
  model = self->super._model;
  id v6 = a4;
  BOOL v7 = [(CUIKCalendarModel *)model calendar];
  id v15 = [v7 components:30 fromDate:v6];

  id v8 = [(CUIKCalendarModel *)self->super._model calendar];
  id v9 = [v8 timeZone];
  id v10 = +[EKCalendarDate calendarDateWithDateComponents:v15 timeZone:v9];

  [(CUIKCalendarModel *)self->super._model setSelectedDate:v10];
  double v11 = [v10 calendarDateForDay];
  double v12 = [v11 date];

  uint64_t v13 = [v10 calendarDateForEndOfDay];
  double v14 = [v13 date];

  [(CUIKCalendarModel *)self->super._model setPreferredReloadStartDate:v12 endDate:v14];
  [(EKDayViewController *)self->_dayViewController setDisplayDate:v15];
  [(DayViewController *)self scrubberDidChangeSelectedDate:v6];

  [(MainViewController *)self setSceneTitleNeedsUpdate];
  [(DayViewController *)self wasAllowedToChangeDate];
}

- (BOOL)dayNavigationViewControllerAllowedToChangeSelectedDate
{
  return [(DayViewController *)self allowChangingDate];
}

- (void)dayNavigationViewControllerFailedToChangeDate:(id)a3
{
}

- (void)_showDetailForEvent:(id)a3 animated:(BOOL)a4 context:(id)a5
{
}

- (void)_showDetailForEvent:(id)a3 animated:(BOOL)a4 showComments:(BOOL)a5 context:(id)a6
{
  if (a3)
  {
    BOOL v6 = a5;
    BOOL v7 = a4;
    model = self->super._model;
    id v11 = a6;
    id v12 = a3;
    [(CUIKCalendarModel *)model setSelectedOccurrence:v12];
    id v13 = [(DayViewController *)self showDetailViewControllerForEvent:v12 context:v11 animated:v7];

    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0 && v6) {
      [v13 openAttendeesDetailItem];
    }
  }
}

- (void)_showDetailForEvents:(id)a3 animated:(BOOL)a4
{
  BOOL v4 = a4;
  id v7 = a3;
  [(CUIKCalendarModel *)self->super._model setSelectedOccurrences:v7];
  id v6 = [(DayViewController *)self showDetailViewControllerForEvents:v7 animated:v4];
}

- (void)eventViewController:(id)a3 didCompleteWithAction:(int64_t)a4
{
  id v21 = a3;
  [v21 setDelegate:0];
  [(CUIKCalendarModel *)self->super._model setSelectedOccurrence:0];
  id v6 = [v21 presentingViewController];
  objc_opt_class();
  char isKindOfClass = objc_opt_isKindOfClass();

  if (isKindOfClass)
  {
    id v8 = [v21 presentingViewController];
    id v9 = v8;
    if (a4 == 2)
    {
      id v10 = [v21 event];
      [v9 reminderDetailDismissedWithDeletedEvent:v10];
    }
    else
    {
      [v8 reminderDetailDismissedWithDeletedEvent:0];
    }
  }
  else
  {
    id v11 = [(DayViewController *)self navigationController];
    id v12 = [v11 presentedViewController];
    objc_opt_class();
    char v13 = objc_opt_isKindOfClass();

    double v14 = [(DayViewController *)self navigationController];
    id v15 = v14;
    if (v13)
    {
      id v16 = [v14 presentedViewController];
      id v17 = v16;
      if (a4 == 2)
      {
        BOOL v18 = [v21 event];
        [v17 reminderDetailDismissedWithDeletedEvent:v18];
      }
      else
      {
        [v16 reminderDetailDismissedWithDeletedEvent:0];
      }
    }
    else
    {

      if (v15)
      {
        BOOL v19 = [(DayViewController *)self navigationController];
        [v19 popViewControllersAfterAndIncluding:v21 animated:!self->_editorDismissedFromDelete];

        unsigned int v20 = v21;
        self->_editorDismissedFromDelete = 0;
        goto LABEL_14;
      }
    }
  }
  [v21 dismissViewControllerAnimated:1 completion:0];
  unsigned int v20 = v21;
LABEL_14:
}

- (void)eventViewController:(id)a3 willDismissEditViewController:(id)a4 deleted:(BOOL)a5
{
  self->_editorDismissedFromDelete = a5;
}

- (void)eventViewControllerWillDisappear:(id)a3
{
  BOOL v4 = [(DayViewController *)self navigationController];
  if (objc_opt_respondsToSelector())
  {
    id v5 = [(DayViewController *)self navigationController];
    id v6 = [v5 performSelector:"isTransitioningTraitCollection"];

    if (v6) {
      return;
    }
  }
  else
  {
  }
  model = self->super._model;

  [(CUIKCalendarModel *)model setSelectedOccurrence:0];
}

- (void)dayViewController:(id)a3 didSelectEvent:(id)a4 animated:(BOOL)a5 userInitiated:(BOOL)a6
{
  BOOL v6 = a6;
  BOOL v7 = a5;
  id v12 = a4;
  id v9 = [(MainViewController *)self model];
  id v10 = [v9 pasteboardManager];
  id v11 = [v12 startDate];
  [v10 setDateForPaste:v11];

  [(DayViewController *)self _showDetailForEvent:v12 animated:v7 userInitiated:v6];
}

- (void)dayViewController:(id)a3 didSelectEvents:(id)a4 animated:(BOOL)a5 userInitiated:(BOOL)a6
{
  BOOL v6 = a6;
  BOOL v7 = a5;
  id v13 = a4;
  id v9 = [(MainViewController *)self model];
  id v10 = [v9 pasteboardManager];
  id v11 = [v13 firstObject];
  id v12 = [v11 startDate];
  [v10 setDateForPaste:v12];

  [(DayViewController *)self _showDetailForEvents:v13 animated:v7 userInitiated:v6];
}

- (void)dayViewController:(id)a3 modifySelection:(id)a4
{
  id v9 = a3;
  id v6 = a4;
  if (v6)
  {
    BOOL v7 = [(CUIKCalendarModel *)self->super._model selectedOccurrences];
    unsigned int v8 = [v7 containsObject:v6];

    if (v8) {
      [(DayViewController *)self removeEventFromSelection:v6];
    }
    else {
      [(DayViewController *)self addEventToSelection:v6];
    }
  }
}

- (void)dayViewController:(id)a3 didChangeDisplayDate:(id)a4
{
  model = self->super._model;
  id v6 = a4;
  BOOL v7 = [(CUIKCalendarModel *)model eventStore];
  unsigned int v8 = [v7 timeZone];
  id v9 = +[EKCalendarDate calendarDateWithDateComponents:v6 timeZone:v8];

  day = self->_day;
  self->_day = v9;
  id v11 = v9;

  [(CUIKCalendarModel *)self->super._model setSelectedDate:v11];

  [(MainViewController *)self setSceneTitleNeedsUpdate];
}

- (void)dayViewControllerDidEndScrolling:(id)a3
{
  model = self->super._model;
  id v5 = a3;
  id v6 = [(CUIKCalendarModel *)model calendar];
  BOOL v7 = [v5 displayDate];

  id v9 = [v6 dateFromComponents:v7];

  [(DayNavigationViewController *)self->_scrubberControllerNeue setSelectedDate:v9 animated:1];
  if ([UIApp isRunningTest])
  {
    unsigned int v8 = +[NSNotificationCenter defaultCenter];
    [v8 postNotificationName:@"NSString *const DayViewController_DayScrollDidEndAnimationNotification" object:self userInfo:0];
  }
}

- (void)dayViewController:(id)a3 didStartDeceleratingTargettingDate:(id)a4
{
  id v5 = a4;
  CalAnalyticsSendEvent();
  [(DayViewController *)self beganHorizontalDeceleration];
  id v6 = [(CUIKCalendarModel *)self->super._model calendar];
  BOOL v7 = [v6 timeZone];
  id obj = +[EKCalendarDate calendarDateWithDateComponents:v5 timeZone:v7];

  scrubberControllerNeue = self->_scrubberControllerNeue;
  id v9 = [obj date];
  [(DayNavigationViewController *)scrubberControllerNeue setSelectedDate:v9 animated:1];

  if ([obj isEqual:self->_day])
  {
    [(CUIKCalendarModel *)self->super._model setSelectedDate:obj];
  }
  else
  {
    objc_storeStrong((id *)&self->_day, obj);
    [(CUIKCalendarModel *)self->super._model setSelectedDate:obj];
    id v10 = [obj date];
    [(DayViewController *)self dayViewDidChangeSelectedDate:v10];
  }
}

- (void)dayViewControllerDidEndDecelerating:(id)a3
{
}

- (id)dayViewController:(id)a3 createEventAtDate:(id)a4 allDay:(BOOL)a5
{
  BOOL v5 = a5;
  id v7 = a4;
  CalAnalyticsSendEvent();
  unsigned int v8 = [(CUIKCalendarModel *)self->super._model eventStore];
  id v9 = +[EKEvent eventWithEventStore:v8];

  [v9 setStartDate:v7];
  if (v5)
  {
    double v10 = 1.0;
  }
  else
  {
    unsigned int v8 = +[CalFoundationPreferences shared];
    [v8 defaultEventDuration];
  }
  id v11 = [v7 dateByAddingTimeInterval:v10];
  [v9 setEndDate:v11];

  if (!v5) {
  [v9 setAllDay:v5];
  }
  id v12 = +[EKEventEditor defaultTitleForCalendarItem];
  [v9 setTitle:v12];

  id v13 = [(CUIKCalendarModel *)self->super._model defaultCalendarForNewEvents];
  [v9 setCalendar:v13];

  return v9;
}

- (id)dayViewController:(id)a3 createReminderAtDate:(id)a4 allDay:(BOOL)a5
{
  BOOL v5 = a5;
  model = self->super._model;
  id v8 = a4;
  id v9 = [(CUIKCalendarModel *)model eventStore];
  double v10 = +[EKEvent eventWithEventStore:v9];

  [v10 setStartDate:v8];
  [v10 setEndDate:v8];

  [v10 setAllDay:v5];
  id v11 = [(CUIKCalendarModel *)self->super._model reminderCalendar];
  [v10 setCalendar:v11];

  return v10;
}

- (void)dayViewController:(id)a3 awaitsRefreshingOccurrence:(id)a4
{
}

- (void)dayViewController:(id)a3 awaitsDeletingOccurrence:(id)a4
{
}

- (BOOL)dayViewControllerShouldAllowLongPress:(id)a3
{
  if (![(DayViewController *)self shouldAllowLongPress]) {
    return 0;
  }
  BOOL v4 = [(CUIKCalendarModel *)self->super._model defaultCalendarForNewEvents];
  BOOL v5 = v4 != 0;

  return v5;
}

- (void)dayViewControllerDidTapEmptySpace:(id)a3 onDate:(id)a4
{
  id v8 = a4;
  [(DayViewController *)self didSelectEvent:0 userInitiated:1];
  [(DayViewController *)self _cleanupSelectedOccurrenceCloneViews];
  if (v8)
  {
    BOOL v5 = [(MainViewController *)self model];
    id v6 = [v5 pasteboardManager];
    id v7 = [v8 date];
    [v6 setDateForPaste:v7];
  }
}

- (void)dayViewController:(id)a3 didReloadDataDueToTrigger:(int)a4
{
}

- (BOOL)delegateWantsToHandleDayViewController:(id)a3 gestureCommittingOccurrence:(id)a4
{
  return [(DayViewController *)self shouldHandleGestureCommits];
}

- (BOOL)dayViewController:(id)a3 willDuplicateOccurrence:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = +[UIApplication sharedApplication];
  if ([v8 optionKeyIsDown]
    && (id v22 = v7,
        +[NSArray arrayWithObjects:&v22 count:1],
        id v9 = objc_claimAutoreleasedReturnValue(),
        unsigned int v10 = +[CUIKPasteboardUtilities allEventsValidForAction:2 fromEvents:v9], v9, v10))
  {
    id v11 = kCalUILogHandle;
    if (os_log_type_enabled((os_log_t)kCalUILogHandle, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)id v21 = 0;
      _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_INFO, "duplicating event(s) in day view because option key is down", v21, 2u);
    }
    id v12 = [(MainViewController *)self model];
    id v13 = [v12 pasteboardManager];
    double v14 = [v7 startDate];
    [v13 setDateForPaste:v14];

    id v15 = [(MainViewController *)self model];
    id v16 = [v15 pasteboardManager];
    [v16 setCalendarForPaste:0];

    id v17 = [(DayViewController *)self pasteboardManager];
    BOOL v18 = +[NSSet setWithObject:v7];
    BOOL v19 = 1;
    [v17 duplicateEvents:v18 withDateMode:1 delegate:v6];
  }
  else
  {
    BOOL v19 = 0;
  }

  return v19;
}

- (void)dayViewController:(id)a3 handleGestureCommittingOccurrence:(id)a4
{
}

- (BOOL)dayviewControllerShouldAllowSwipeToChangeDays:(id)a3
{
  return [(DayViewController *)self allowChangingDate];
}

- (BOOL)dayViewControllerShouldShowDetachDialogOnGestureDraggingEnd:(id)a3
{
  return [(DayViewController *)self showDetachAlertOnDraggingGestureEnd];
}

- (void)dayViewControllerDidBeginMovingEventWithGesture:(id)a3
{
  BOOL v4 = [a3 gestureController];
  BOOL v5 = [v4 event];
  unsigned __int8 v6 = [v5 isNew];

  if ((v6 & 1) == 0) {
    CalAnalyticsSendEvent();
  }

  [(DayViewController *)self didBeginMovingOccurrenceWithGesture];
}

- (void)dayViewControllerDidFinishPinchingDayView:(id)a3
{
}

- (void)dayViewControllerIsPinchingDayView:(id)a3
{
}

- (void)dayViewControllerDidRespondToApplicationDidBecomeActiveStateChange:(id)a3
{
}

- (void)dayViewController:(id)a3 requestsPresentationOfViewControllerForGestures:(id)a4
{
  id v5 = a4;
  id v7 = [[UnadaptableNavigationController alloc] initWithRootViewController:v5];

  [(UnadaptableNavigationController *)v7 setModalPresentationStyle:2];
  unsigned __int8 v6 = [(DayViewController *)self navigationController];
  [v6 presentViewController:v7 animated:1 completion:0];
}

- (void)dayViewController:(id)a3 requestsShowEvent:(id)a4 showDetails:(BOOL)a5
{
}

- (void)dayViewController:(id)a3 requestsSaveHourScalePreference:(double)a4
{
  id v5 = [(CUIKCalendarModel *)self->super._model persistedSceneState];
  [v5 setDayViewHourScale:a4];
}

- (id)dayViewController:(id)a3 selectedCopyViewForView:(id)a4
{
  return [(DayViewController *)self selectedCopyViewForOccurrenceView:a4];
}

- (id)selectedOccurrencesForDayViewController:(id)a3
{
  return [(CUIKCalendarModel *)self->super._model selectedOccurrences];
}

- (id)selectedEventsForEditMenu
{
  return [(CUIKCalendarModel *)self->super._model selectedOccurrences];
}

- (void)dayOccurrenceViewSelected:(id)a3 source:(unint64_t)a4
{
  id v6 = a3;
  if (a4 == 1)
  {
    id v11 = v6;
    id v7 = [(CUIKCalendarModel *)self->super._model selectedOccurrences];
    id v8 = [v11 occurrence];
    unsigned __int8 v9 = [v7 containsObject:v8];

    id v6 = v11;
    if ((v9 & 1) == 0)
    {
      unsigned int v10 = [v11 occurrence];
      [(CUIKCalendarModel *)self->super._model setSelectedOccurrence:v10];

      id v6 = v11;
    }
  }
}

- (void)_significantTimeChanged:(id)a3
{
  id v4 = [(DayViewController *)self dayView];
  [(DayNavigationViewController *)self->_scrubberControllerNeue significantTimeChangeOccurred];
  [v4 significantTimeChangeOccurred];
}

- (void)_timeZoneChanged:(id)a3
{
  id v15 = [(DayViewController *)self dayView];
  id v4 = [(MainViewController *)self model];
  id v5 = [v4 selectedDate];
  [v5 absoluteTime];
  double v7 = v6;

  id v8 = [(MainViewController *)self model];
  unsigned __int8 v9 = [v8 calendar];
  unsigned int v10 = [v9 timeZone];

  [v15 setTimeZone:v10];
  id v11 = [(MainViewController *)self model];
  id v12 = [v11 calendar];
  [v15 setCalendar:v12];

  id v13 = [objc_alloc((Class)EKCalendarDate) initWithAbsoluteTime:v10 timeZone:v7];
  double v14 = [v13 dayComponents];
  [v15 setDisplayDate:v14];
  [(DayNavigationViewController *)self->_scrubberControllerNeue timeZoneChanged];
  [v15 timeZoneChanged];
}

- (void)dayViewController:(id)a3 beginEditingOccurrence:(id)a4 creationMethod:(unint64_t)a5
{
}

- (void)eventEditViewController:(id)a3 didCompleteWithAction:(int64_t)a4
{
}

- (void)eventEditViewController:(id)a3 didCompleteWithAction:(int64_t)a4 completionHandler:(id)a5
{
}

- (void)eventEditViewController:(id)a3 didCompleteWithAction:(int64_t)a4 dismissController:(BOOL)a5
{
}

- (void)eventEditViewController:(id)a3 didCompleteWithAction:(int64_t)a4 dismissController:(BOOL)a5 completionHandler:(id)a6
{
  BOOL v7 = a5;
  id v10 = a3;
  id v11 = a6;
  id v12 = [v10 event];
  if (v12)
  {
    if (a4)
    {
      if (a4 == 2)
      {
        [(EKDayViewController *)self->_dayViewController editorDidDeleteEvent:v12];
      }
      else if (a4 == 1)
      {
        id v13 = [v10 calendarToMakeVisibleOnSave];
        double v14 = [v13 objectID];
        if (v14) {
          [(CUIKCalendarModel *)self->super._model ensureCalendarVisibleWithId:v14];
        }
        [(CUIKCalendarModel *)self->super._model setSelectedOccurrence:v12];
        [(EKDayViewController *)self->_dayViewController editorDidSaveEvent:v12];
        if ([v13 sharingStatus]) {
          [(MainViewController *)self attemptDisplayReviewPrompt];
        }
      }
    }
    else
    {
      [(EKDayViewController *)self->_dayViewController editorDidCancelEditingEvent:v12];
    }
    id v16 = [v10 internalEditViewDelegate];

    if (v16 == self && v7)
    {
      id v17 = [v10 presentingViewController];
      v18[0] = _NSConcreteStackBlock;
      v18[1] = 3221225472;
      v18[2] = sub_1001325E8;
      v18[3] = &unk_1001D2808;
      v18[4] = self;
      id v19 = v11;
      [v17 dismissViewControllerAnimated:1 completion:v18];
    }
  }
  else
  {
    id v15 = kCalUILogHandle;
    if (os_log_type_enabled((os_log_t)kCalUILogHandle, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315138;
      id v21 = "-[DayViewController eventEditViewController:didCompleteWithAction:dismissController:completionHandler:]";
      _os_log_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_ERROR, "%s received with nil event.", buf, 0xCu);
    }
  }
}

- (id)eventEditViewControllerDefaultCalendarForNewEvents:(id)a3
{
  return [(CUIKCalendarModel *)self->super._model defaultCalendarForNewEvents];
}

- (id)pasteboardManagerForEventEditViewController:(id)a3
{
  id v3 = [(MainViewController *)self model];
  id v4 = [v3 pasteboardManager];

  return v4;
}

- (id)calendarModel
{
  return self->super._model;
}

- (id)pasteboardManager
{
  v2 = [(MainViewController *)self model];
  id v3 = [v2 pasteboardManager];

  return v3;
}

- (BOOL)eventViewDelegateShouldShowNextOccurrenceOfEvent:(id)a3 forward:(BOOL)a4
{
  if (a4) {
    [a3 nextOccurrence];
  }
  else {
  id v4 = [a3 previousOccurrence];
  }
  id v5 = [v4 reminderOccurrenceType];
  if (v4) {
    BOOL v6 = v5 == (id)1;
  }
  else {
    BOOL v6 = 1;
  }
  BOOL v7 = !v6;

  return v7;
}

- (void)eventViewDelegateShowNextOccurrenceOfEvent:(id)a3 forward:(BOOL)a4
{
  BOOL v4 = a4;
  id v6 = a3;
  id v10 = v6;
  if (v4) {
    [v6 nextOccurrence];
  }
  else {
  BOOL v7 = [v6 previousOccurrence];
  }
  id v8 = v7;
  if (v7)
  {
    unsigned __int8 v9 = [v7 startCalendarDate];
    [(DayViewController *)self selectDate:v9 animated:1];

    [(DayViewController *)self showEvent:v8 animated:1 showMode:0 context:0];
  }
}

- (BOOL)eventViewControllerShouldShowNextPreviousRecurrenceButtons
{
  return 1;
}

- (void)eventViewControllerNextButtonWasTapped:(id)a3
{
  id v8 = a3;
  BOOL v4 = [v8 event];
  id v5 = [v4 nextOccurrence];

  if (v5)
  {
    [(DayViewController *)self eventViewController:v8 didCompleteWithAction:0];
    id v6 = [v5 startCalendarDate];
    [(DayViewController *)self selectDate:v6 animated:0];

    BOOL v7 = [v8 context];
    [(DayViewController *)self showEvent:v5 animated:1 showMode:1 context:v7];
  }
}

- (void)eventViewControllerPreviousButtonWasTapped:(id)a3
{
  id v8 = a3;
  BOOL v4 = [v8 event];
  id v5 = [v4 previousOccurrence];

  if (v5)
  {
    [(DayViewController *)self eventViewController:v8 didCompleteWithAction:0];
    id v6 = [v5 startCalendarDate];
    [(DayViewController *)self selectDate:v6 animated:0];

    BOOL v7 = [v8 context];
    [(DayViewController *)self showEvent:v5 animated:1 showMode:1 context:v7];
  }
}

- (void)eventViewController:(id)a3 requestsShowEvent:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  [(DayViewController *)self eventViewController:v7 didCompleteWithAction:0];
  id v8 = [v7 context];

  [(DayViewController *)self showEvent:v6 animated:1 showMode:1 context:v8];
}

- (id)pasteboardManagerForDayViewController:(id)a3
{
  return [(CUIKCalendarModel *)self->super._model pasteboardManager];
}

- (id)defaultCalendarForNewEvents
{
  return [(CUIKCalendarModel *)self->super._model defaultCalendarForNewEvents];
}

- (id)calendarForNewIntegrationReminders
{
  return [(CUIKCalendarModel *)self->super._model reminderCalendar];
}

- (void)_scrollToEvent:(id)a3 animated:(BOOL)a4
{
  BOOL v4 = a4;
  id v11 = a3;
  id v6 = -[EKDayViewController occurrenceViewForEvent:](self->_dayViewController, "occurrenceViewForEvent:");
  if ([(DayViewController *)self isViewLoaded]
    && ([(DayViewController *)self view],
        id v7 = objc_claimAutoreleasedReturnValue(),
        [v7 window],
        id v8 = objc_claimAutoreleasedReturnValue(),
        v8,
        v7,
        v8)
    && v6)
  {
    [(EKDayViewController *)self->_dayViewController scrollEventIntoView:v11 animated:v4];
    scrollToEventIdentifier = self->_scrollToEventIdentifier;
    self->_scrollToEventIdentifier = 0;
  }
  else
  {
    id v10 = [v11 eventIdentifier];
    scrollToEventIdentifier = self->_scrollToEventIdentifier;
    self->_scrollToEventIdentifier = v10;
  }
}

- (id)gestureController
{
  return [(EKDayViewController *)self->_dayViewController gestureController];
}

- (BOOL)didSelectEvent:(id)a3 userInitiated:(BOOL)a4
{
  id v6 = a3;
  if (!v6)
  {
    [(CUIKCalendarModel *)self->super._model setSelectedOccurrences:&__NSArray0__struct];
LABEL_7:
    BOOL v7 = 0;
    goto LABEL_8;
  }
  if (!a4)
  {
    id v8 = [(CUIKCalendarModel *)self->super._model selectedOccurrences];
    unsigned __int8 v9 = [v8 containsObject:v6];

    if ((v9 & 1) == 0)
    {
      [(CUIKCalendarModel *)self->super._model setSelectedOccurrence:v6];
      id v12 = v6;
      id v10 = +[NSArray arrayWithObjects:&v12 count:1];
      [(DayViewController *)self _setUpSelectedOccurrenceViewsWithEvents:v10 animated:1 autoScroll:0 resetSelection:1];
    }
    goto LABEL_7;
  }
  BOOL v7 = 1;
LABEL_8:

  return v7;
}

- (BOOL)didSelectEvents:(id)a3 userInitiated:(BOOL)a4
{
  id v6 = a3;
  BOOL v7 = v6;
  if (!v6 || ![v6 count])
  {
    [(CUIKCalendarModel *)self->super._model setSelectedOccurrences:&__NSArray0__struct];
LABEL_6:
    BOOL v8 = 0;
    goto LABEL_7;
  }
  if (!a4)
  {
    id v10 = [(CUIKCalendarModel *)self->super._model selectedOccurrences];
    id v11 = +[NSSet setWithArray:v10];
    id v12 = +[NSSet setWithArray:v7];
    unsigned __int8 v13 = [v11 isEqualToSet:v12];

    if ((v13 & 1) == 0)
    {
      [(CUIKCalendarModel *)self->super._model setSelectedOccurrences:v7];
      [(DayViewController *)self _setUpSelectedOccurrenceViewsWithEvents:v7 animated:1 autoScroll:0 resetSelection:1];
    }
    goto LABEL_6;
  }
  BOOL v8 = 1;
LABEL_7:

  return v8;
}

- (void)scrubberDidChangeSelectedDate:(id)a3
{
  model = self->super._model;
  id v5 = a3;
  id v9 = [(CUIKCalendarModel *)model calendar];
  id v6 = [v9 timeZone];
  BOOL v7 = +[EKCalendarDate calendarDateWithDate:v5 timeZone:v6];

  day = self->_day;
  self->_day = v7;
}

- (id)showDetailViewControllerForEvent:(id)a3 context:(id)a4 animated:(BOOL)a5
{
  BOOL v5 = a5;
  id v8 = a4;
  id v9 = a3;
  id v10 = +[NSBundle bundleForClass:objc_opt_class()];
  id v11 = [v10 localizedStringForKey:@"Day" value:&stru_1001D6918 table:0];
  id v12 = [(DayViewController *)self navigationItem];
  [v12 setTitle:v11];

  unsigned __int8 v13 = [(MainViewController *)self augmentEventDetailsContext:v8];

  double v14 = +[EKEventViewController eventDetailViewControllerWithEvent:v9 delegate:self context:v13];

  [(MainViewController *)self showViewController:v14 sender:self animated:v5 completion:0];

  return v14;
}

- (id)showDetailViewControllerForEvents:(id)a3 animated:(BOOL)a4
{
  BOOL v4 = a4;
  id v6 = a3;
  BOOL v7 = +[NSBundle bundleForClass:objc_opt_class()];
  id v8 = [v7 localizedStringForKey:@"Day" value:&stru_1001D6918 table:0];
  id v9 = [(DayViewController *)self navigationItem];
  [v9 setTitle:v8];

  id v10 = [objc_alloc((Class)EKExpandedReminderStackViewController) initWithEvents:v6 delegate:self];
  [v10 setPreferModalPresentation:0];
  [(MainViewController *)self showViewController:v10 sender:self animated:v4 completion:0];

  return v10;
}

- (void)showReminderDetail:(id)a3
{
  id v4 = a3;
  id v7 = [(MainViewController *)self augmentEventDetailsContext:0];
  id v5 = objc_alloc_init((Class)UINavigationController);
  id v6 = +[EKEventViewController eventDetailViewControllerWithEvent:v4 delegate:self context:v7];

  [v5 pushViewController:v6 animated:0];
  [(MainViewController *)self showViewController:v5 sender:self animated:1 completion:0];
}

- (void)showEditViewController:(id)a3
{
  id v4 = a3;
  id v5 = [(DayViewController *)self navigationController];
  [v5 presentModalViewController:v4 withTransition:8];
}

- (void)dataReloadedWithTrigger:(int)a3
{
  id v4 = [(DayViewController *)self view];
  id v5 = [v4 window];

  if (v5)
  {
    id v6 = [(CUIKCalendarModel *)self->super._model eventStore];
    id v7 = [v6 eventWithIdentifier:self->_scrollToEventIdentifier];

    [(DayViewController *)self _scrollToEvent:v7 animated:1];
  }
}

- (BOOL)shouldHandleGestureCommits
{
  return 0;
}

- (BOOL)showWeekdayLabel
{
  return 1;
}

- (BOOL)allowChangingDate
{
  return 1;
}

- (int)editorShowTransition
{
  return 8;
}

- (int)editorHideTransition
{
  return 9;
}

- (BOOL)showDetachAlertOnDraggingGestureEnd
{
  return 1;
}

- (void)finishedPinchingDayView
{
  id v4 = [(MainViewController *)self model];
  id v3 = [v4 selectedOccurrences];
  [(DayViewController *)self _setUpSelectedOccurrenceViewsWithEvents:v3 animated:0 autoScroll:1 resetSelection:1];
}

- (BOOL)shouldAllowLongPress
{
  return [(EKEventCreationGestureController *)self->_eventCreationGestureController currentlyCreatingEvent] ^ 1;
}

- (id)selectedCopyViewForOccurrenceView:(id)a3
{
  return 0;
}

- (void)_sceneEnteredForeground:(id)a3
{
  id v9 = [a3 object];
  id v4 = [(MainViewController *)self model];
  id v5 = [v4 sceneIdentifier];
  id v6 = [v9 _sceneIdentifier];
  if ([v5 isEqualToString:v6])
  {
    unsigned int v7 = [(DayViewController *)self savedFirstVisibleSecond];

    if ((v7 & 0x80000000) != 0) {
      goto LABEL_6;
    }
    uint64_t v8 = [(DayViewController *)self savedFirstVisibleSecond];
    id v4 = [(DayViewController *)self dayView];
    id v5 = [v4 currentDayView];
    [v5 setFirstVisibleSecond:v8];
  }
  else
  {
  }
LABEL_6:
}

- (void)saveFirstVisibleSecond:(int)a3
{
  uint64_t v3 = *(void *)&a3;
  if (EKUIShouldSaveStateInPreferences())
  {
    id v6 = +[NSNumber numberWithInt:v3];
    id v5 = +[CUIKPreferences sharedPreferences];
    [v5 setDayViewFirstVisibleSecond:v6];
  }
  else
  {
    id v6 = [(MainViewController *)self model];
    id v5 = [v6 persistedSceneState];
    [v5 setDayViewFirstVisibleSecond:v3];
  }
}

- (BOOL)creationGestureController:(id)a3 canActivateAtPoint:(CGPoint)a4
{
  double y = a4.y;
  double x = a4.x;
  unsigned int v7 = [(DayViewController *)self gestureController];
  if ([v7 dragGestureInProgress])
  {
    BOOL v8 = 0;
LABEL_6:

    return v8;
  }
  id v9 = [(DayViewController *)self gestureController];
  id v10 = [v9 draggingView];

  if (!v10)
  {
    id v11 = [(DayViewController *)self _parentViewForCreationGesture];
    id v12 = [(DayViewController *)self dayView];
    unsigned __int8 v13 = [v12 currentDayView];
    [v11 convertPoint:v13 toView:x, y];
    double v15 = v14;
    double v17 = v16;

    unsigned int v7 = [(DayViewController *)self dayView];
    BOOL v18 = [v7 currentDayView];
    id v19 = [v18 occurrenceViewAtPoint:v15, v17];
    BOOL v8 = v19 == 0;

    goto LABEL_6;
  }
  return 0;
}

- (id)_parentViewForCreationGesture
{
  v2 = [(DayViewController *)self dayView];
  uint64_t v3 = [v2 effectiveEventGestureSuperview];

  return v3;
}

- (id)creationGestureController:(id)a3 requestedPreviewForEvent:(id)a4
{
  id v5 = a4;
  id v6 = [(DayViewController *)self dayView];
  unsigned int v7 = [v6 createOccurrenceViewForEventGestures];

  [v7 setOccurrence:v5];
  [v7 setSelected:1];
  return v7;
}

- (double)creationGestureController:(id)a3 requestedWidthForEventPreview:(id)a4 atPoint:(CGPoint)a5
{
  id v6 = [(DayViewController *)self dayView];
  unsigned int v7 = [v6 currentDayView];
  [v7 frame];
  double v9 = v8;
  id v10 = [(DayViewController *)self dayView];
  id v11 = [v10 currentDayView];
  [v11 leftContentInset];
  double v13 = v9 - v12;

  return v13;
}

- (double)creationGestureController:(id)a3 requestedXCoordinateForEventPreviewAtPoint:(CGPoint)a4
{
  id v5 = [(DayViewController *)self dayView];
  id v6 = [v5 currentDayView];

  unsigned int v7 = [(DayViewController *)self _parentViewForCreationGesture];
  double v8 = [(DayViewController *)self dayView];
  double v9 = [v8 currentDayView];
  [v9 leftContentInset];
  [v7 convertPoint:v6 fromView:];
  double v11 = v10;

  return v11;
}

- (CGPoint)creationGestureController:(id)a3 requestsPointForDate:(id)a4
{
  id v5 = a4;
  id v6 = [(DayViewController *)self dayView];
  [v5 timeIntervalSinceReferenceDate];
  double v8 = v7;

  [v6 pointAtDate:0 isAllDay:v8];
  double v10 = v9;
  double v12 = v11;

  double v13 = v10;
  double v14 = v12;
  result.double y = v14;
  result.double x = v13;
  return result;
}

- (void)creationGestureController:(id)a3 didResizeToDate:(id)a4
{
  id v5 = a4;
  id v6 = [(DayViewController *)self dayView];
  [v6 showTimelineHighlightForTime:v5];
}

- (id)creationGestureController:(id)a3 dateForPoint:(CGPoint)a4
{
  double y = a4.y;
  double x = a4.x;
  id v6 = [(DayViewController *)self dayView];
  double v7 = [v6 currentDayView];
  [v7 dateAtPoint:0 isAllDay:x, y];
  double v9 = v8;

  return +[NSDate dateWithTimeIntervalSinceReferenceDate:v9];
}

- (id)creationGestureControllerRequestsNewEvent:(id)a3
{
  id v4 = [(MainViewController *)self model];
  id v5 = [v4 calendar];
  id v6 = [(DayViewController *)self dayView];
  double v7 = [v6 displayDate];
  double v8 = [v5 dateFromComponents:v7];

  double v9 = [(DayViewController *)self dayView];
  id v10 = [(DayViewController *)self dayViewController:v9 createEventAtDate:v8 allDay:0];

  return v10;
}

- (void)creationGestureController:(id)a3 didCreateNewEvent:(id)a4
{
  id v11 = a4;
  id v5 = [(DayViewController *)self dayView];
  id v6 = [v5 currentEditor];

  if (!v6)
  {
    double v7 = +[EKEventEditor defaultTitleForCalendarItem];
    double v8 = [v11 title];
    unsigned int v9 = [v7 isEqualToString:v8];

    if (v9) {
      [v11 setTitle:&stru_1001D6918];
    }
    [(DayViewController *)self beginEditingOccurrence:v11 creationMethod:4];
  }
  id v10 = [(DayViewController *)self gestureController];
  [v10 liftUpOccurrenceForEditingEvent:v11];
}

- (void)creationGestureControllerDidCancel:(id)a3
{
  id v3 = [(DayViewController *)self dayView];
  [v3 hideTimelineHighlight];
}

- (id)_selectedOccurrenceViews
{
  return self->_selectedOccurrenceViews;
}

- (void)_setUpSelectedOccurrenceViewsWithEvents:(id)a3 animated:(BOOL)a4 autoScroll:(BOOL)a5 resetSelection:(BOOL)a6
{
  BOOL v34 = a4;
  BOOL v35 = a6;
  BOOL v33 = a5;
  long long v41 = 0u;
  long long v42 = 0u;
  long long v43 = 0u;
  long long v44 = 0u;
  id obj = a3;
  id v7 = [obj countByEnumeratingWithState:&v41 objects:v45 count:16];
  if (v7)
  {
    id v8 = v7;
    v37 = 0;
    char v9 = 0;
    uint64_t v10 = *(void *)v42;
    v32 = v39;
    do
    {
      for (i = 0; i != v8; i = (char *)i + 1)
      {
        if (*(void *)v42 != v10) {
          objc_enumerationMutation(obj);
        }
        uint64_t v12 = *(void *)(*((void *)&v41 + 1) + 8 * i);
        double v13 = [(DayViewController *)self gestureController];
        double v14 = [v13 draggingView];
        double v15 = [v14 occurrence];
        unsigned __int8 v16 = [v15 isEqual:v12];

        if (v16)
        {
          double v17 = 0;
        }
        else
        {
          BOOL v18 = [(DayViewController *)self dayView];
          double v17 = [v18 occurrenceViewForEvent:v12 includeNextAndPreviousDays:1];

          if (v17)
          {
            if (v9)
            {
              id v19 = v37;
            }
            else
            {
              if (v35)
              {
                unsigned int v20 = [(DayViewController *)self _selectedOccurrenceFrontmostClonedViews];
                id v21 = [v20 count];

                if (v21) {
                  [(DayViewController *)self _cleanupSelectedOccurrenceCloneViews];
                }
              }
              if (v33)
              {
                id v22 = [(DayViewController *)self dayView];
                [v22 scrollEventIntoView:v12 animated:v34];
              }
              selectedOccurrenceViews = self->_selectedOccurrenceViews;
              if (selectedOccurrenceViews)
              {
                if (v35) {
                  [(NSMutableArray *)selectedOccurrenceViews removeAllObjects];
                }
              }
              else
              {
                long long v24 = +[NSMutableArray array];
                long long v25 = self->_selectedOccurrenceViews;
                self->_selectedOccurrenceViews = v24;
              }
              long long v26 = [(DayViewController *)self _selectedOccurrenceViews];
              long long v27 = [v26 CalMap:&stru_1001D6098];
              uint64_t v28 = +[NSMutableSet setWithArray:v27];

              id v19 = (void *)v28;
            }
            v37 = v19;
            if (([v19 containsObject:v12] & 1) == 0)
            {
              long long v29 = [v17 occurrences];
              [v19 addObjectsFromArray:v29];

              [(NSMutableArray *)self->_selectedOccurrenceViews addObject:v17];
              id v30 = [v17 superview];
              id v31 = [v17 copy];
              [v31 setDelegate:0];
              [v31 setIsSelectedCopyView:1];
              [v31 setSelectedCopy:0];
              [v31 setSelected:1];
              [v31 setUserInteractionEnabled:0];
              [v31 requestContentIfNeeded:16 completion:0];
              [v17 setSelectedCopy:v31];
              [v30 addSubview:v31];
              [v30 bringSubviewToFront:v31];
              if (v34)
              {
                [v31 setAlpha:0.0];
                v38[0] = _NSConcreteStackBlock;
                v38[1] = 3221225472;
                v39[0] = sub_100133F50;
                v39[1] = &unk_1001D2740;
                id v40 = v31;
                +[UIView animateWithDuration:6 delay:v38 usingSpringWithDamping:0 initialSpringVelocity:1.5 options:0.0 animations:10.0 completion:10.0];
              }
            }
            char v9 = 1;
          }
        }
      }
      id v8 = [obj countByEnumeratingWithState:&v41 objects:v45 count:16];
    }
    while (v8);
  }
  else
  {
    v37 = 0;
  }
}

- (id)_selectedOccurrenceFrontmostClonedViews
{
  uint64_t v10 = 0;
  id v11 = &v10;
  uint64_t v12 = 0x3032000000;
  double v13 = sub_1001340D4;
  double v14 = sub_1001340E4;
  id v15 = 0;
  id v3 = objc_opt_new();
  id v4 = [(DayViewController *)self timedDayViewContentGridSubviews];
  [v3 addObjectsFromArray:v4];

  id v5 = [(DayViewController *)self allDayView];
  id v6 = [v5 subviews];
  [v3 addObjectsFromArray:v6];

  v9[0] = _NSConcreteStackBlock;
  v9[1] = 3221225472;
  v9[2] = sub_1001340EC;
  v9[3] = &unk_1001D60C0;
  v9[4] = &v10;
  [v3 enumerateObjectsUsingBlock:v9];
  id v7 = (id)v11[5];

  _Block_object_dispose(&v10, 8);

  return v7;
}

- (void)_cleanupSelectedOccurrenceCloneViews
{
  id v3 = +[NSSet set];
  [(DayViewController *)self _cleanupSelectedOccurrenceCloneViewsSkipSet:v3];
}

- (void)_cleanupSelectedOccurrenceCloneViewsRespectingModelSelected
{
  id v5 = [(MainViewController *)self model];
  id v3 = [v5 selectedOccurrences];
  id v4 = +[NSSet setWithArray:v3];
  [(DayViewController *)self _cleanupSelectedOccurrenceCloneViewsSkipSet:v4];
}

- (void)_cleanupSelectedOccurrenceCloneViewsSkipSet:(id)a3
{
  id v4 = a3;
  id v5 = [(DayViewController *)self dayView];
  id v6 = [v5 view];
  [(DayViewController *)self _recursiveRemoveSelectedClonedViewsFromViewTree:v6 skipSet:v4];

  selectedOccurrenceViews = self->_selectedOccurrenceViews;
  v10[0] = _NSConcreteStackBlock;
  v10[1] = 3221225472;
  v10[2] = sub_100134388;
  v10[3] = &unk_1001D60E8;
  id v11 = v4;
  id v8 = v4;
  char v9 = +[NSPredicate predicateWithBlock:v10];
  [(NSMutableArray *)selectedOccurrenceViews filterUsingPredicate:v9];
}

- (void)_recursiveRemoveSelectedClonedViewsFromViewTree:(id)a3 skipSet:(id)a4
{
  id v6 = a4;
  if (a3)
  {
    long long v18 = 0u;
    long long v19 = 0u;
    long long v16 = 0u;
    long long v17 = 0u;
    id v7 = [a3 subviews];
    id v8 = [v7 countByEnumeratingWithState:&v16 objects:v20 count:16];
    if (v8)
    {
      id v9 = v8;
      uint64_t v10 = *(void *)v17;
      do
      {
        for (i = 0; i != v9; i = (char *)i + 1)
        {
          if (*(void *)v17 != v10) {
            objc_enumerationMutation(v7);
          }
          uint64_t v12 = *(void **)(*((void *)&v16 + 1) + 8 * i);
          [(DayViewController *)self _recursiveRemoveSelectedClonedViewsFromViewTree:v12 skipSet:v6];
          objc_opt_class();
          if (objc_opt_isKindOfClass())
          {
            id v13 = v12;
            double v14 = [v13 occurrence];
            unsigned __int8 v15 = [v6 containsObject:v14];

            if ((v15 & 1) == 0)
            {
              if ([v13 isSelectedCopyView])
              {
                [v13 setDelegate:0];
                [v13 removeFromSuperview];
              }
              else
              {
                [v13 setSelectedCopy:0];
              }
            }
          }
        }
        id v9 = [v7 countByEnumeratingWithState:&v16 objects:v20 count:16];
      }
      while (v9);
    }
  }
}

- (void)_selectedOccurrencesChanged:(id)a3
{
  id v4 = [(CUIKCalendarModel *)self->super._model selectedOccurrences];
  id v5 = +[NSSet setWithArray:v4];

  [(DayViewController *)self _cleanupSelectedOccurrenceCloneViewsRespectingModelSelected];
  id v6 = [(DayViewController *)self gestureController];
  id v7 = [v6 event];
  unsigned __int8 v8 = [v5 containsObject:v7];

  if ((v8 & 1) == 0)
  {
    id v9 = [(DayViewController *)self gestureController];
    [v9 endForcedStart:0];
  }
  id v10 = [v5 mutableCopy];
  long long v24 = 0u;
  long long v25 = 0u;
  long long v26 = 0u;
  long long v27 = 0u;
  id v11 = self->_selectedOccurrenceViews;
  id v12 = [(NSMutableArray *)v11 countByEnumeratingWithState:&v24 objects:v28 count:16];
  if (v12)
  {
    id v13 = v12;
    uint64_t v14 = *(void *)v25;
    do
    {
      for (i = 0; i != v13; i = (char *)i + 1)
      {
        if (*(void *)v25 != v14) {
          objc_enumerationMutation(v11);
        }
        long long v16 = *(void **)(*((void *)&v24 + 1) + 8 * i);
        long long v17 = [v16 occurrence:v24];

        if (v17)
        {
          long long v18 = [v16 occurrence];
          [v10 removeObject:v18];
        }
      }
      id v13 = [(NSMutableArray *)v11 countByEnumeratingWithState:&v24 objects:v28 count:16];
    }
    while (v13);
  }

  long long v19 = [(DayViewController *)self gestureController];
  unsigned int v20 = [v19 event];

  if (v20)
  {
    id v21 = [(DayViewController *)self gestureController];
    id v22 = [v21 event];
    [v10 removeObject:v22];
  }
  long long v23 = [v10 allObjects];
  [(DayViewController *)self _setUpSelectedOccurrenceViewsWithEvents:v23 animated:1 autoScroll:0 resetSelection:0];
}

- (BOOL)allEventsIndividuallyRepresented:(id)a3
{
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  id v4 = a3;
  id v5 = [v4 countByEnumeratingWithState:&v14 objects:v18 count:16];
  if (v5)
  {
    id v6 = v5;
    uint64_t v7 = *(void *)v15;
LABEL_3:
    uint64_t v8 = 0;
    while (1)
    {
      if (*(void *)v15 != v7) {
        objc_enumerationMutation(v4);
      }
      id v9 = -[EKDayViewController occurrenceViewForEvent:](self->_dayViewController, "occurrenceViewForEvent:", *(void *)(*((void *)&v14 + 1) + 8 * v8), (void)v14);
      id v10 = v9;
      if (!v9) {
        break;
      }
      id v11 = [v9 occurrences];
      id v12 = [v11 count];

      if ((unint64_t)v12 > 1)
      {
        LOBYTE(v10) = 0;
        break;
      }
      if (v6 == (id)++v8)
      {
        id v6 = [v4 countByEnumeratingWithState:&v14 objects:v18 count:16];
        LOBYTE(v10) = 1;
        if (v6) {
          goto LABEL_3;
        }
        break;
      }
    }
  }
  else
  {
    LOBYTE(v10) = 1;
  }

  return (char)v10;
}

- (BOOL)visible
{
  return self->_visible;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_eventCreationGestureController, 0);
  objc_storeStrong((id *)&self->_selectedOccurrenceViews, 0);
  objc_storeStrong((id *)&self->_previousNavigationTitle, 0);
  objc_storeStrong((id *)&self->_dayViewController, 0);
  objc_storeStrong((id *)&self->_scrubberControllerNeue, 0);
  objc_storeStrong((id *)&self->_day, 0);

  objc_storeStrong((id *)&self->_scrollToEventIdentifier, 0);
}

- (int64_t)intendedSizeClass
{
  return 0;
}

- (id)cellFactory
{
  return 0;
}

@end