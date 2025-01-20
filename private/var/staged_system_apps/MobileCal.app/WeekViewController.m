@interface WeekViewController
- (BOOL)_isLeadingEdgeToday;
- (BOOL)_weekGroup:(id)a3 containsOccurrence:(id)a4;
- (BOOL)allowsOverriddenRightNavigationBarItems;
- (BOOL)allowsOverriddenToolbarItems;
- (BOOL)canBecomeFirstResponder;
- (BOOL)canPerformAction:(SEL)a3 withSender:(id)a4;
- (BOOL)creationGestureController:(id)a3 canActivateAtPoint:(CGPoint)a4;
- (BOOL)currentlyEditingEventsWithGestures;
- (BOOL)dateIsVisible:(id)a3;
- (BOOL)didScrollWhenEventGestureController:(id)a3 scrollTimerFiredToMoveLeft:(BOOL)a4 right:(BOOL)a5 vertically:(BOOL)a6 towardPoint:(CGPoint)a7;
- (BOOL)displaysDatesSnappedToWeekBoundaries;
- (BOOL)dropInteraction:(id)a3 canHandleSession:(id)a4;
- (BOOL)enableEventCreationGesture;
- (BOOL)eventGestureController:(id)a3 didCommitOccurrence:(id)a4 toDate:(double)a5 isAllDay:(BOOL)a6 span:(int64_t)a7;
- (BOOL)eventGestureController:(id)a3 isAllDayAtPoint:(CGPoint)a4 requireInsistence:(BOOL)a5;
- (BOOL)eventGestureControllerShouldAllowLongPress:(id)a3;
- (BOOL)eventViewControllerShouldShowNextPreviousRecurrenceButtons;
- (BOOL)eventViewDelegateShouldShowNextOccurrenceOfEvent:(id)a3 forward:(BOOL)a4;
- (BOOL)hasCorrectParentForDraggingView:(id)a3 isAllDay:(BOOL)a4;
- (BOOL)interaction:(id)a3 canCreateEventAtPoint:(CGPoint)a4 inView:(id)a5;
- (BOOL)interaction:(id)a3 canCreateReminderAtPoint:(CGPoint)a4 inView:(id)a5;
- (BOOL)interaction:(id)a3 canPasteEventAtPoint:(CGPoint)a4 inView:(id)a5;
- (BOOL)interaction:(id)a3 shouldShowMenuAtPoint:(CGPoint)a4 inView:(id)a5;
- (BOOL)isDateVisible:(id)a3;
- (BOOL)isTodayVisible;
- (BOOL)moreThanOneDayVisibleForEventGestureController:(id)a3;
- (BOOL)receiveTapsInHeader;
- (BOOL)rotatingToLandscape;
- (BOOL)rotatingToPortrait;
- (BOOL)shouldPushNextLevelViewControllerWhenTodayIsVisible;
- (BOOL)shouldSnapToWeeksOnFlicks;
- (BOOL)showOverlayCalendar;
- (BOOL)suppressInitialScrollToCurrentTime;
- (BOOL)usePortraitLayoutForSize:(CGSize)a3;
- (BOOL)userInitiatedScroll;
- (BOOL)userIsDragging;
- (BOOL)userIsScrolling;
- (BOOL)usesMultiDayWeekView;
- (BOOL)usesSmallTextForIsCompact:(BOOL)a3;
- (BOOL)weekGroupViewShouldAnnotateAppEntities:(id)a3 onDayStarting:(id)a4;
- (CGPoint)creationGestureController:(id)a3 requestsPointForDate:(id)a4;
- (CGPoint)eventGestureController:(id)a3 pointAtDate:(double)a4 isAllDay:(BOOL)a5;
- (CGPoint)pointAtDate:(double)a3 isAllDay:(BOOL)a4;
- (CGRect)_frameForWeek:(int64_t)a3;
- (CGRect)currentTimeRectInView:(id)a3;
- (CGRect)marginFrameForEventGestureController:(id)a3;
- (Class)weekViewClass;
- (EKCalendarDate)displayedDate;
- (EKCalendarDate)referenceWeekStart;
- (EKEventGestureController)eventGestureController;
- (NSMutableArray)reusableViews;
- (NSMutableArray)visibleWeeks;
- (UIEdgeInsets)pageChangeMarginsForEventGestureController:(id)a3;
- (WeekTimeView)timeView;
- (WeekViewController)initWithModel:(id)a3 window:(id)a4;
- (WeekViewControllerDelegate)delegate;
- (_NSRange)visibleRangeForOffset:(double)a3;
- (double)_widthForDayAtPoint:(CGPoint)a3 isMovingRight:(BOOL)a4;
- (double)_xOffsetForDate:(id)a3;
- (double)creationGestureController:(id)a3 requestedWidthForEventPreview:(id)a4 atPoint:(CGPoint)a5;
- (double)creationGestureController:(id)a3 requestedXCoordinateForEventPreviewAtPoint:(CGPoint)a4;
- (double)currentScrollViewXOffset;
- (double)eventGestureController:(id)a3 convertXForMargin:(double)a4;
- (double)eventGestureController:(id)a3 dateAtPoint:(CGPoint)a4;
- (double)eventGestureController:(id)a3 heightForAllDayOccurrenceView:(id)a4;
- (double)eventGestureController:(id)a3 heightForOccurrenceViewOfDuration:(double)a4;
- (double)eventGestureController:(id)a3 widthForOccurrenceViewOfDays:(unint64_t)a4;
- (double)eventGestureController:(id)a3 yPositionPerhapsMatchingAllDayOccurrence:(id)a4 atPoint:(CGPoint)a5;
- (double)headerVerticalOffset;
- (double)maximumHourScale;
- (double)minimumHourScale;
- (double)scrollToDisplayedDateAnimated:(BOOL)a3;
- (double)timedRegionOriginForEventGestureController:(id)a3;
- (double)weekViewHourHeightScale;
- (double)weekWidth;
- (double)weekWidthForOrientation:(int64_t)a3;
- (id)_createPreparedViewForWeek:(int64_t)a3;
- (id)_daysToShiftFromSelectedDateToBeginningOfWeekIfShowingFullWeek:(id)a3;
- (id)_earliestVisibleWeekGroupView;
- (id)_earliestWeekGroup;
- (id)_eventsForCutOrCopy;
- (id)_latestDateComponents;
- (id)_latestVisibleWeekGroupView;
- (id)_latestWeekGroup;
- (id)_newEvent;
- (id)_parentViewForCreationGesturePreview;
- (id)_selectedOccurrenceViews;
- (id)_snapDateForOffset:(CGPoint)a3 snapToWeeks:(BOOL)a4;
- (id)_visibleOccurrenceViewsWithOptions:(int64_t)a3;
- (id)_weekGroupForEvent:(id)a3 occurrenceDate:(id)a4;
- (id)_weekGroupForPoint:(CGPoint)a3;
- (id)bestDateForNewEvent;
- (id)calendarModel;
- (id)centerDateComponents;
- (id)createEventForEventGestureController:(id)a3;
- (id)createOccurrenceViewForEventGestureController:(id)a3;
- (id)creationGestureController:(id)a3 dateForPoint:(CGPoint)a4;
- (id)creationGestureController:(id)a3 requestedPreviewForEvent:(id)a4;
- (id)dateAtPoint:(CGPoint)a3 isAllDay:(BOOL *)a4;
- (id)dateAtPoint:(CGPoint)a3 isAllDay:(BOOL *)a4 requireAllDayRegionInsistence:(BOOL)a5;
- (id)dateForWeek:(int64_t)a3;
- (id)dayDateAtPoint:(CGPoint)a3;
- (id)earliestDateComponents;
- (id)eventGestureController:(id)a3 occurrenceViewAtPoint:(CGPoint)a4 ignoreSelectedCopyView:(BOOL)a5;
- (id)eventGestureController:(id)a3 occurrenceViewForOccurrence:(id)a4 occurrenceDate:(id)a5;
- (id)firstDisplayedDate;
- (id)interaction:(id)a3 subtitleForPasteActionAtPoint:(CGPoint)a4 inView:(id)a5;
- (id)interaction:(id)a3 titleForPasteActionAtPoint:(CGPoint)a4 inView:(id)a5;
- (id)model;
- (id)occurrenceViewAtPoint:(CGPoint)a3 ignoreSelectedCopyView:(BOOL)a4;
- (id)occurrenceViewForEvent:(id)a3;
- (id)occurrenceViewForEvent:(id)a3 occurrenceDate:(id)a4;
- (id)occurrenceViewSuperviewForEventGestureController:(id)a3;
- (id)pasteboardManager;
- (id)preferredPreSizeClassTransitionSelectedDate;
- (id)presentationControllerForEditMenu;
- (id)sceneTitle;
- (id)selectedEventsForEditMenu;
- (id)touchTrackingViewForEventGestureController:(id)a3;
- (id)verticalScrollView;
- (id)weekGroupForWeekAfter:(id)a3;
- (id)weekGroupForWeekBefore:(id)a3;
- (id)weekScroller;
- (id)weekView:(id)a3 allEventsForStartDate:(id)a4 endDate:(id)a5;
- (id)weekView:(id)a3 eventsForStartDate:(id)a4 endDate:(id)a5;
- (int64_t)firstVisibleSecond;
- (int64_t)intendedSizeClass;
- (int64_t)orientation;
- (int64_t)orientationForSize:(CGSize)a3;
- (int64_t)savedFirstVisibleSecond;
- (int64_t)viewInterfaceOrientation;
- (unint64_t)_dateModeForAllDay:(BOOL)a3;
- (unint64_t)daysFromFirstToMiddleDay;
- (unint64_t)daysInWeek;
- (void)_calendarModelTimeZoneChanged:(id)a3;
- (void)_clearSelectedOccurrenceViews;
- (void)_clearSelectedOccurrenceViewsUpdatingModel:(BOOL)a3;
- (void)_deselectOccurrenceView:(id)a3;
- (void)_deselectOccurrenceView:(id)a3 updatingModel:(BOOL)a4;
- (void)_highlightEvent:(id)a3 dayViewDate:(double)a4 isAllDay:(BOOL)a5;
- (void)_invalidateMarkerTimer;
- (void)_localeChanged:(id)a3;
- (void)_logUserStateDiagnostics:(id)a3;
- (void)_reloadDataIfVisible;
- (void)_removeDateHighlight;
- (void)_reuseWeekView:(id)a3;
- (void)_sceneEnteredForeground:(id)a3;
- (void)_scrollEventIntoView:(id)a3 animated:(BOOL)a4 durationOverride:(double)a5 completion:(id)a6;
- (void)_scrollToSecond:(int64_t)a3 animated:(BOOL)a4 completion:(id)a5;
- (void)_selectEvents:(id)a3 updatingModel:(BOOL)a4;
- (void)_selectOccurrenceView:(id)a3;
- (void)_selectOccurrenceView:(id)a3 updatingModel:(BOOL)a4;
- (void)_selectedDateChanged:(id)a3;
- (void)_setHeaderHeightForWeekGroupView:(id)a3 forceLayout:(BOOL)a4;
- (void)_setHourHeightScale:(double)a3;
- (void)_setReduceLayoutProcessingForAnimation:(BOOL)a3;
- (void)_showWeekNumbersPrefDidChange;
- (void)_significantTimeChanged:(id)a3;
- (void)_startMarkerTimer;
- (void)_timeBarDropScrollTimerFired:(id)a3;
- (void)_updateAllDaySectionScrollerContentSize;
- (void)_updateAllDayView;
- (void)_updateBackButtonOnBackViewControllerToDate:(id)a3;
- (void)_updateContentForSizeCategoryChange:(id)a3;
- (void)_updateHeaderHeightsAnimated:(BOOL)a3;
- (void)_updateSelectedViewsToMatchModel;
- (void)_updateShouldAnnotateAppEntities;
- (void)_updateTimeMarker;
- (void)_updateTimeMarkerExtensionColor:(BOOL)a3;
- (void)_updateWeekViewContentHeight;
- (void)_weekScrollerDoubleTapped:(id)a3;
- (void)_weekScrollerPinched:(id)a3;
- (void)_weekViewStartsOnTodayPrefDidChange;
- (void)adjustVisibleAllDayOccurrenceLabelsAnimated:(BOOL)a3;
- (void)cancelTimeBarDropScrollTimerAndScrollToNearestDate;
- (void)cleanupSelectionState;
- (void)copy:(id)a3;
- (void)createEvent:(BOOL)a3 atPoint:(CGPoint)a4 inView:(id)a5;
- (void)creationGestureController:(id)a3 didCreateNewEvent:(id)a4;
- (void)creationGestureController:(id)a3 didResizeToDate:(id)a4;
- (void)currentlyVisibleDateRangeFromStartDate:(id *)a3 toEndDate:(id *)a4;
- (void)cut:(id)a3;
- (void)dayOccurrenceViewSelected:(id)a3 source:(unint64_t)a4;
- (void)dealloc;
- (void)didEditEvent:(id)a3 creationMethod:(unint64_t)a4;
- (void)dimOccurrence:(id)a3 occurrenceDate:(id)a4;
- (void)displayedDateChanged:(id)a3 userInitiated:(BOOL)a4;
- (void)draggingDone;
- (void)dropInteraction:(id)a3 sessionDidEnd:(id)a4;
- (void)dropInteraction:(id)a3 sessionDidEnter:(id)a4;
- (void)dropInteraction:(id)a3 sessionDidExit:(id)a4;
- (void)editorDidCancelEditingEvent:(id)a3;
- (void)editorDidDeleteEvent:(id)a3;
- (void)emptySpaceClickedOnDate:(id)a3;
- (void)eventEditViewController:(id)a3 didCompleteWithAction:(int64_t)a4;
- (void)eventEditViewController:(id)a3 didCompleteWithAction:(int64_t)a4 completionHandler:(id)a5;
- (void)eventGestureController:(id)a3 addViewToScroller:(id)a4 isAllDay:(BOOL)a5;
- (void)eventGestureController:(id)a3 adjustDraggingView:(id)a4 forAllDay:(BOOL)a5;
- (void)eventGestureController:(id)a3 didCancelEditingOccurrence:(id)a4 fadedOut:(BOOL)a5;
- (void)eventGestureController:(id)a3 didMoveToDate:(double)a4 isAllDay:(BOOL)a5;
- (void)eventGestureController:(id)a3 didSetUpAtDate:(double)a4 isAllDay:(BOOL)a5;
- (void)eventGestureController:(id)a3 didSingleTapOccurrence:(id)a4 shouldExtendSelection:(BOOL)a5;
- (void)eventGestureController:(id)a3 requestsPresentationOfViewController:(id)a4;
- (void)eventGestureController:(id)a3 requestsShowEvent:(id)a4;
- (void)eventGestureControllerDidEndDragSession:(id)a3;
- (void)eventViewController:(id)a3 didCompleteWithAction:(int64_t)a4;
- (void)eventViewController:(id)a3 requestsShowEvent:(id)a4;
- (void)eventViewController:(id)a3 willDismissEditViewController:(id)a4 deleted:(BOOL)a5;
- (void)eventViewControllerNextButtonWasTapped:(id)a3;
- (void)eventViewControllerPreviousButtonWasTapped:(id)a3;
- (void)eventViewDelegateShowNextOccurrenceOfEvent:(id)a3 forward:(BOOL)a4;
- (void)highlightDayViewCalendarDate:(id)a3 isAllDay:(BOOL)a4;
- (void)interaction:(id)a3 createEventAtPoint:(CGPoint)a4 inView:(id)a5;
- (void)interaction:(id)a3 createReminderAtPoint:(CGPoint)a4 inView:(id)a5;
- (void)interaction:(id)a3 pasteEventAtPoint:(CGPoint)a4 inView:(id)a5;
- (void)layoutCellsAnimated:(BOOL)a3;
- (void)loadDataAsync;
- (void)loadView;
- (void)occurrencesChanged:(id)a3;
- (void)overlayCalendarDidChange;
- (void)paste:(id)a3;
- (void)pasteboardManager:(id)a3 beginEditingEvent:(id)a4;
- (void)pasteboardManager:(id)a3 didFinishPasteWithResult:(unint64_t)a4 willOpenEditor:(BOOL)a5;
- (void)pasteboardManager:(id)a3 presentAlert:(id)a4;
- (void)reloadData;
- (void)resizeWeekGroupsIfNeededForOrientation:(int64_t)a3;
- (void)saveFirstVisibleSecond:(int64_t)a3;
- (void)scrollEventIntoView:(id)a3 animateWithDuration:(double)a4 completion:(id)a5;
- (void)scrollEventIntoView:(id)a3 animated:(BOOL)a4 completion:(id)a5;
- (void)scrollToCurrentTimeOfDayAnimated:(BOOL)a3;
- (void)scrollViewDidEndDecelerating:(id)a3;
- (void)scrollViewDidEndDragging:(id)a3 willDecelerate:(BOOL)a4;
- (void)scrollViewDidEndScrollingAnimation:(id)a3;
- (void)scrollViewDidScroll:(id)a3;
- (void)scrollViewWillBeginDragging:(id)a3;
- (void)scrollViewWillEndDragging:(id)a3 withVelocity:(CGPoint)a4 targetContentOffset:(CGPoint *)a5;
- (void)selectDate:(id)a3 animated:(BOOL)a4;
- (void)setDelegate:(id)a3;
- (void)setDisplayedDate:(id)a3;
- (void)setDisplayedDate:(id)a3 animated:(BOOL)a4;
- (void)setDisplayedDate:(id)a3 forceScroll:(BOOL)a4 animated:(BOOL)a5;
- (void)setDisplaysDatesSnappedToWeekBoundaries:(BOOL)a3;
- (void)setFirstVisibleSecond:(int64_t)a3;
- (void)setOrientation:(int64_t)a3;
- (void)setReceiveTapsInHeader:(BOOL)a3;
- (void)setReferenceWeekStart:(id)a3;
- (void)setReusableViews:(id)a3;
- (void)setRotatingToLandscape:(BOOL)a3;
- (void)setRotatingToPortrait:(BOOL)a3;
- (void)setTimeView:(id)a3;
- (void)setVisibleWeeks:(id)a3;
- (void)setWeekViewHourHeightScale:(double)a3;
- (void)showEvent:(id)a3 animated:(BOOL)a4 showMode:(unint64_t)a5 context:(id)a6;
- (void)showEvents:(id)a3 animated:(BOOL)a4 showMode:(unint64_t)a5 context:(id)a6;
- (void)showReminderDetail:(id)a3;
- (void)snapTargetScrollOffset:(CGPoint *)a3 withVelocity:(CGPoint)a4;
- (void)synchronizeWeekGroupScrollingToWeek:(id)a3;
- (void)tappedOnDate:(id)a3;
- (void)undimOccurrence:(id)a3 occurrenceDate:(id)a4;
- (void)updateBackButtonTitle;
- (void)updateDisplayedDateForCurrentScrollOffset;
- (void)updatePreferredReloadRange;
- (void)updateVisibleRects;
- (void)updateWeekNumber;
- (void)viewDidAppear:(BOOL)a3;
- (void)viewDidLayoutSubviews;
- (void)viewDidLoad;
- (void)viewSwitcherSwitchedToViewWithDate:(id)a3;
- (void)viewWillAppear:(BOOL)a3;
- (void)viewWillDisappear:(BOOL)a3;
- (void)viewWillLayoutSubviews;
- (void)viewWillTransitionToSize:(CGSize)a3 withTransitionCoordinator:(id)a4;
- (void)weekGroup:(id)a3 didSelectEvent:(id)a4 userInitiated:(BOOL)a5 dateSelected:(id)a6;
- (void)weekGroup:(id)a3 didSelectEvents:(id)a4 userInitiated:(BOOL)a5;
- (void)weekGroupAllDaySectionDidScroll:(id)a3;
- (void)weekGroupViewDidLayout:(id)a3;
- (void)weekGroupViewFirstVisibleSecondChanged:(int64_t)a3;
- (void)weekGroupViewOccurrenceLayoutDidChange:(id)a3;
@end

@implementation WeekViewController

- (Class)weekViewClass
{
  return (Class)objc_opt_class();
}

- (WeekViewController)initWithModel:(id)a3 window:(id)a4
{
  v12.receiver = self;
  v12.super_class = (Class)WeekViewController;
  v4 = [(MainViewController *)&v12 initWithWindow:a4 model:a3];
  if (v4)
  {
    v4->_lastScrollPositionSecond = (int)CUIKNumberOfSecondsForCurrentTime();
    +[EKDayTimeView defaultHourScale];
    v4->_weekViewHourHeightScale = v5;
    v6 = +[NSNotificationCenter defaultCenter];
    uint64_t v7 = CUIKCalendarModelDisplayedOccurrencesChangedNotification;
    v8 = [(WeekViewController *)v4 model];
    [v6 addObserver:v4 selector:"occurrencesChanged:" name:v7 object:v8];

    uint64_t v9 = CUIKCalendarModelSelectedOccurrencesChangedNotification;
    v10 = [(WeekViewController *)v4 model];
    [v6 addObserver:v4 selector:"selectedOccurrencesChanged:" name:v9 object:v10];

    [v6 addObserver:v4 selector:"virtualConferenceAppChanged:" name:EKConferenceUtilsAppRecordChangedNotification object:0];
  }
  return v4;
}

- (void)dealloc
{
  [(UIScrollView *)self->_weekScroller setDelegate:0];
  weekScroller = self->_weekScroller;
  self->_weekScroller = 0;

  [(EKEventGestureController *)self->_eventGestureController invalidate];
  [(WeekViewController *)self _invalidateMarkerTimer];
  v4 = +[NSNotificationCenter defaultCenter];
  [v4 removeObserver:self];

  v5.receiver = self;
  v5.super_class = (Class)WeekViewController;
  [(MainViewController *)&v5 dealloc];
}

- (BOOL)canBecomeFirstResponder
{
  return 1;
}

- (id)_eventsForCutOrCopy
{
  v3 = [(EKEventGestureController *)self->_eventGestureController event];

  if (v3)
  {
    v4 = [(EKEventGestureController *)self->_eventGestureController event];
    uint64_t v5 = +[NSSet setWithObject:v4];
LABEL_5:
    v8 = (void *)v5;

    goto LABEL_6;
  }
  v6 = [(CUIKCalendarModel *)self->super._model selectedOccurrences];
  id v7 = [v6 count];

  if (v7)
  {
    v4 = [(CUIKCalendarModel *)self->super._model selectedOccurrences];
    uint64_t v5 = +[NSSet setWithArray:v4];
    goto LABEL_5;
  }
  v8 = 0;
LABEL_6:

  return v8;
}

- (void)copy:(id)a3
{
  id v5 = [(WeekViewController *)self _eventsForCutOrCopy];
  if ([v5 count])
  {
    v4 = [(CUIKCalendarModel *)self->super._model pasteboardManager];
    [v4 copyEvents:v5 delegate:self];

    [(WeekViewController *)self cleanupSelectionState];
  }
}

- (void)cut:(id)a3
{
  id v5 = [(WeekViewController *)self _eventsForCutOrCopy];
  if ([v5 count])
  {
    v4 = [(CUIKCalendarModel *)self->super._model pasteboardManager];
    [v4 cutEvents:v5 delegate:self];

    [(WeekViewController *)self cleanupSelectionState];
  }
}

- (void)paste:(id)a3
{
  id v8 = [(WeekViewController *)self _eventsForCutOrCopy];
  if ([v8 count] == (id)1)
  {
    v4 = [(CUIKCalendarModel *)self->super._model pasteboardManager];
    id v5 = [v8 anyObject];
    v6 = [v5 startDate];
    [v4 setDateForPaste:v6];
  }
  id v7 = [(CUIKCalendarModel *)self->super._model pasteboardManager];
  [v7 pasteEventsWithDateMode:0 delegate:self];

  [(WeekViewController *)self cleanupSelectionState];
}

- (BOOL)canPerformAction:(SEL)a3 withSender:(id)a4
{
  id v6 = a4;
  if ((+[CUIKPasteboardUtilities declinesToPerformCutCopyPasteAction:a3 withSender:v6] & 1) == 0)
  {
    if ("paste:" == a3)
    {
      id v8 = [(WeekViewController *)self model];
      uint64_t v9 = [v8 pasteboardManager];
      unsigned __int8 v7 = [v9 canPerformPaste];
    }
    else
    {
      if ("copy:" == a3)
      {
        id v8 = [(WeekViewController *)self _eventsForCutOrCopy];
        uint64_t v10 = 1;
      }
      else
      {
        if ("cut:" != a3)
        {
          v12.receiver = self;
          v12.super_class = (Class)WeekViewController;
          unsigned __int8 v7 = [(WeekViewController *)&v12 canPerformAction:a3 withSender:v6];
          goto LABEL_12;
        }
        id v8 = [(WeekViewController *)self _eventsForCutOrCopy];
        uint64_t v10 = 0;
      }
      unsigned __int8 v7 = +[CUIKPasteboardUtilities allEventsValidForAction:v10 fromEvents:v8];
    }

    goto LABEL_12;
  }
  unsigned __int8 v7 = 0;
LABEL_12:

  return v7;
}

- (void)loadView
{
  v86.receiver = self;
  v86.super_class = (Class)WeekViewController;
  [(WeekViewController *)&v86 loadView];
  v4 = [(WeekViewController *)self view];
  [v4 setOpaque:1];

  [(WeekViewController *)self setEdgesForExtendedLayout:0];
  id v5 = +[UIColor systemBackgroundColor];
  id v6 = [(WeekViewController *)self view];
  [v6 setBackgroundColor:v5];

  unsigned __int8 v7 = [(WeekViewController *)self view];
  [v7 setAutoresizingMask:18];

  id v8 = +[CUIKPreferences sharedPreferences];
  self->_showWeekNumber = [v8 showWeekNumbers];

  uint64_t v9 = +[CUIKPreferences sharedPreferences];
  self->_weekViewStartsOnToday = [v9 weekViewStartsOnToday];

  uint64_t v10 = CUIKGetOverlayCalendar();
  self->_showOverlayCalendar = v10 != 0;

  [(WeekViewController *)self headerVerticalOffset];
  double v12 = v11;
  double v13 = 0.0;
  if ((CalInterfaceIsLeftToRight() & 1) == 0)
  {
    v14 = [(WeekViewController *)self view];
    [v14 bounds];
    double v13 = v15;
  }
  v16 = [(MainViewController *)self window];
  uint64_t v17 = EKUIInterfaceOrientationForViewHierarchy();

  v18 = -[WeekTimeView initWithFrame:targetSizeClass:orientation:]([WeekTimeView alloc], "initWithFrame:targetSizeClass:orientation:", [(WeekViewController *)self intendedSizeClass], v17, v13, v12, 0.0, 100.0);
  timeView = self->_timeView;
  self->_timeView = v18;

  [(WeekTimeView *)self->_timeView sizeToFit];
  [(WeekTimeView *)self->_timeView setUseMultiDayStyle:[(WeekViewController *)self usesMultiDayWeekView]];
  [(WeekTimeView *)self->_timeView setHeaderHeight:40.0];
  [(WeekTimeView *)self->_timeView setDayTimeViewDelegate:self];
  [(WeekTimeView *)self->_timeView setAutoresizingMask:16];
  v20 = (UIDropInteraction *)[objc_alloc((Class)UIDropInteraction) initWithDelegate:self];
  timeBarDropInteraction = self->_timeBarDropInteraction;
  self->_timeBarDropInteraction = v20;

  [(WeekTimeView *)self->_timeView addInteraction:self->_timeBarDropInteraction];
  v22 = [(WeekViewController *)self view];
  [v22 addSubview:self->_timeView];

  self->_currentlyDisplayedWeekNumber = -1;
  v23 = (UIScrollView *)objc_alloc_init((Class)UIScrollView);
  weekScroller = self->_weekScroller;
  self->_weekScroller = v23;

  v25 = +[UIColor systemBackgroundColor];
  [(UIScrollView *)self->_weekScroller setBackgroundColor:v25];

  [(UIScrollView *)self->_weekScroller setOpaque:1];
  [(UIScrollView *)self->_weekScroller setDelegate:self];
  [(UIScrollView *)self->_weekScroller setScrollsToTop:0];
  [(UIScrollView *)self->_weekScroller setDelaysContentTouches:0];
  [(UIScrollView *)self->_weekScroller setShowsHorizontalScrollIndicator:0];
  [(UIScrollView *)self->_weekScroller setDecelerationRate:UIScrollViewDecelerationRateFast];
  v26 = [(WeekViewController *)self view];
  [v26 addSubview:self->_weekScroller];

  v27 = [(WeekViewController *)self view];
  [v27 bringSubviewToFront:self->_timeView];

  id v28 = [objc_alloc((Class)UIPinchGestureRecognizer) initWithTarget:self action:"_weekScrollerPinched:"];
  [(UIScrollView *)self->_weekScroller addGestureRecognizer:v28];
  id v29 = [objc_alloc((Class)UITapGestureRecognizer) initWithTarget:self action:"_weekScrollerDoubleTapped:"];
  [v29 setNumberOfTapsRequired:2];
  [(UIScrollView *)self->_weekScroller addGestureRecognizer:v29];

  v30 = (NSMutableArray *)[objc_alloc((Class)NSMutableArray) initWithCapacity:2];
  reusableViews = self->_reusableViews;
  self->_reusableViews = v30;

  v32 = (NSMutableArray *)[objc_alloc((Class)NSMutableArray) initWithCapacity:2];
  visibleWeeks = self->_visibleWeeks;
  self->_visibleWeeks = v32;

  if ((EKUIHasFallbackSizingContext() & 1) == 0)
  {
    v85 = +[NSAssertionHandler currentHandler];
    [v85 handleFailureInMethod:a2 object:self file:@"WeekViewController.m" lineNumber:289 description:@"We entered weekview without a fallback sizing"];
  }
  [(WeekViewController *)self weekWidth];
  self->_weekWidth = v34;
  -[UIScrollView setContentSize:](self->_weekScroller, "setContentSize:", v34 * 54080.0, 0.0);
  if (!self->_eventGestureController)
  {
    v35 = (EKEventGestureController *)[objc_alloc((Class)EKEventGestureController) initWithView:self->_weekScroller];
    eventGestureController = self->_eventGestureController;
    self->_eventGestureController = v35;

    [(EKEventGestureController *)self->_eventGestureController setDelegate:self];
    [(EKEventGestureController *)self->_eventGestureController setUsesHorizontalDragLocking:1];
    [(EKEventGestureController *)self->_eventGestureController setUsesXDragOffsetInCancelRegion:1];
  }
  if ([(WeekViewController *)self enableEventCreationGesture])
  {
    v37 = (EKEventCreationGestureController *)[objc_alloc((Class)EKEventCreationGestureController) initWithView:self->_weekScroller delegate:self];
    eventCreationController = self->_eventCreationController;
    self->_eventCreationController = v37;
  }
  v39 = self->_reusableViews;
  v40 = [WeekGroupView alloc];
  [(UIScrollView *)self->_weekScroller bounds];
  double v42 = v41;
  double v44 = v43;
  double v46 = v45;
  double v48 = v47;
  int64_t v49 = [(WeekViewController *)self intendedSizeClass];
  v50 = [(MainViewController *)self window];
  v51 = -[WeekGroupView initWithFrame:sizeClass:targetWindow:rightClickDelegate:isMultiDayView:](v40, "initWithFrame:sizeClass:targetWindow:rightClickDelegate:isMultiDayView:", v49, v50, self, [(WeekViewController *)self usesMultiDayWeekView], v42, v44, v46, v48);
  [(NSMutableArray *)v39 addObject:v51];

  v52 = self->_reusableViews;
  v53 = [WeekGroupView alloc];
  [(UIScrollView *)self->_weekScroller bounds];
  double v55 = v54;
  double v57 = v56;
  double v59 = v58;
  double v61 = v60;
  int64_t v62 = [(WeekViewController *)self intendedSizeClass];
  v63 = [(MainViewController *)self window];
  v64 = -[WeekGroupView initWithFrame:sizeClass:targetWindow:rightClickDelegate:isMultiDayView:](v53, "initWithFrame:sizeClass:targetWindow:rightClickDelegate:isMultiDayView:", v62, v63, self, [(WeekViewController *)self usesMultiDayWeekView], v55, v57, v59, v61);
  [(NSMutableArray *)v52 addObject:v64];

  EKUISeparatorLineThickness();
  double v66 = v65;
  v67 = (UIView *)objc_alloc_init((Class)UIView);
  allDayDividerLineView = self->_allDayDividerLineView;
  self->_allDayDividerLineView = v67;

  v69 = +[UIColor separatorColor];
  [(UIView *)self->_allDayDividerLineView setBackgroundColor:v69];

  v70 = [(WeekViewController *)self view];
  [v70 bounds];
  -[UIView setFrame:](self->_allDayDividerLineView, "setFrame:", 0.0, v12 - v66);

  [(UIView *)self->_allDayDividerLineView setHidden:1];
  [(UIView *)self->_allDayDividerLineView setAutoresizingMask:2];
  v71 = [(WeekViewController *)self view];
  [v71 addSubview:self->_allDayDividerLineView];

  v72 = [(WeekViewController *)self displayedDate];

  if (v72) {
    [(WeekViewController *)self scrollToDisplayedDateAnimated:0];
  }
  self->_initialShow = 1;
  uint64_t v73 = [(CUIKCalendarModel *)self->super._model persistedSceneState];
  if (v73)
  {
    v74 = (void *)v73;
    v75 = [(CUIKCalendarModel *)self->super._model persistedSceneState];
    [v75 weekViewHourScale];
    double v77 = v76;

    if (v77 > 0.0)
    {
      v78 = [(CUIKCalendarModel *)self->super._model persistedSceneState];
      [v78 weekViewHourScale];
LABEL_16:
      self->_weekViewHourHeightScale = v79;
      goto LABEL_17;
    }
  }
  v80 = +[CUIKPreferences sharedPreferences];
  v78 = [v80 weekViewHourScale];

  if (v78)
  {
    [v78 floatValue];
    double v79 = v81;
    goto LABEL_16;
  }
LABEL_17:

  v82 = +[NSNotificationCenter defaultCenter];
  [v82 addObserver:self selector:"_updateContentForSizeCategoryChange:" name:UIContentSizeCategoryDidChangeNotification object:0];

  v83 = +[NSNotificationCenter defaultCenter];
  [v83 addObserver:self selector:"_showWeekNumbersPrefDidChange" name:CUIKPreferencesNotification_ShowWeekNumbers object:0];

  v84 = +[NSNotificationCenter defaultCenter];
  [v84 addObserver:self selector:"_weekViewStartsOnTodayPrefDidChange" name:CUIKPreferencesNotification_WeekViewStartsOnToday object:0];
}

- (double)weekWidth
{
  int64_t v3 = [(WeekViewController *)self viewInterfaceOrientation];

  [(WeekViewController *)self weekWidthForOrientation:v3];
  return result;
}

- (double)weekWidthForOrientation:(int64_t)a3
{
  id v5 = [(WeekViewController *)self weekViewClass];
  id v6 = [(MainViewController *)self window];
  [(objc_class *)v5 standardWidthForOrientation:a3 withViewInViewHierarchy:v6];
  double v8 = v7;
  EKUISeparatorLineThickness();
  double v10 = v8 + v9;

  return v10;
}

- (void)viewWillLayoutSubviews
{
  p_lastBoundsSize = &self->_lastBoundsSize;
  v4 = [(WeekViewController *)self view];
  [v4 bounds];
  double height = p_lastBoundsSize->height;
  if (p_lastBoundsSize->width != v7 || height != v5)
  {

LABEL_10:
    [(WeekViewController *)self resizeWeekGroupsIfNeededForOrientation:[(WeekViewController *)self viewInterfaceOrientation]];
    uint64_t v17 = [(WeekViewController *)self view];
    [v17 bounds];
    p_lastBoundsSize->double width = v18;
    p_lastBoundsSize->double height = v19;

    v20 = [(MainViewController *)self window];
    [v20 bounds];
    self->_lastWindowBoundsSize.double width = v21;
    self->_lastWindowBoundsSize.double height = v22;

    goto LABEL_11;
  }
  double v9 = [(MainViewController *)self window];
  [v9 bounds];
  double v11 = v10;
  double v13 = v12;
  double width = self->_lastWindowBoundsSize.width;
  double v15 = self->_lastWindowBoundsSize.height;

  if (width != v11 || v15 != v13) {
    goto LABEL_10;
  }
LABEL_11:
  [(WeekViewController *)self headerVerticalOffset];
  double v24 = v23;
  v25 = [(WeekViewController *)self view];
  [v25 bounds];
  double v27 = v26;
  double v29 = v28;

  double v30 = v29 - v24;
  [(WeekTimeView *)self->_timeView sizeToFit];
  [(WeekTimeView *)self->_timeView frame];
  double v31 = CGRectGetWidth(v39);
  int IsLeftToRight = CalInterfaceIsLeftToRight();
  double v33 = v27 - v31;
  if (IsLeftToRight) {
    double v33 = 0.0;
  }
  -[WeekTimeView setFrame:](self->_timeView, "setFrame:", v33, v24, v31, v30);
  int v34 = CalInterfaceIsLeftToRight();
  double v35 = v31 + 1.0;
  if (!v34) {
    double v35 = 0.0;
  }
  double v36 = v27 - v35;
  if (v34) {
    double v37 = v31;
  }
  else {
    double v37 = 0.0;
  }
  -[UIScrollView setFrame:](self->_weekScroller, "setFrame:", v37, v24, v36, v30);
  [(WeekViewController *)self layoutCellsAnimated:0];
  [(WeekViewController *)self _updateWeekViewContentHeight];

  [(WeekViewController *)self _updateShouldAnnotateAppEntities];
}

- (void)viewDidLoad
{
  v8.receiver = self;
  v8.super_class = (Class)WeekViewController;
  [(WeekViewController *)&v8 viewDidLoad];
  int64_t v3 = +[NSNotificationCenter defaultCenter];
  [v3 addObserver:self selector:"_sceneEnteredForeground:" name:UISceneWillEnterForegroundNotification object:0];
  [v3 addObserver:self selector:"_logUserStateDiagnostics:" name:CUIKStateCaptureNotification object:0];
  uint64_t v4 = CUIKCalendarModelSelectedDateChangedNotification;
  double v5 = [(WeekViewController *)self model];
  [v3 addObserver:self selector:"_selectedDateChanged:" name:v4 object:v5];

  uint64_t v6 = CUIKCalendarModelSignificantTimeChangeNotification;
  double v7 = [(WeekViewController *)self model];
  [v3 addObserver:self selector:"_significantTimeChanged:" name:v6 object:v7];

  [v3 addObserver:self selector:"_localeChanged:" name:CUIKLocaleChangedNotification object:0];
  [v3 addObserver:self selector:"_calendarModelTimeZoneChanged:" name:CUIKCalendarModelTimeZoneChangedNotification object:0];
}

- (void)viewWillAppear:(BOOL)a3
{
  v10.receiver = self;
  v10.super_class = (Class)WeekViewController;
  [(WeekViewController *)&v10 viewWillAppear:a3];
  self->_viewWillAppearCalled = 1;
  if (![(WeekViewController *)self usesMultiDayWeekView]) {
    [(WeekViewController *)self resizeWeekGroupsIfNeededForOrientation:[(WeekViewController *)self viewInterfaceOrientation]];
  }
  if (![(WeekViewController *)self suppressInitialScrollToCurrentTime])
  {
    uint64_t v4 = [(WeekViewController *)self model];
    double v5 = [v4 selectedDate];
    [(WeekViewController *)self setDisplayedDate:v5];
  }
  [(WeekViewController *)self _updateTimeMarker];
  [(WeekViewController *)self overlayCalendarDidChange];
  if (self->_needsReload) {
    [(WeekViewController *)self reloadData];
  }
  if (self->_initialShow
    && ![(WeekViewController *)self suppressInitialScrollToCurrentTime])
  {
    if ([(NSMutableArray *)self->_visibleWeeks count])
    {
      uint64_t v6 = [(NSMutableArray *)self->_visibleWeeks objectAtIndex:0];
      double v7 = [v6 weekView];
      objc_super v8 = [v7 content];
      [v8 firstEventSecond];
      [(WeekViewController *)self _scrollToSecond:(uint64_t)v9 animated:0 completion:0];
    }
  }
}

- (void)viewDidLayoutSubviews
{
  v3.receiver = self;
  v3.super_class = (Class)WeekViewController;
  [(WeekViewController *)&v3 viewDidLayoutSubviews];
  [(WeekViewController *)self _updateTimeMarker];
}

- (void)viewDidAppear:(BOOL)a3
{
  v6.receiver = self;
  v6.super_class = (Class)WeekViewController;
  [(MainViewController *)&v6 viewDidAppear:a3];
  self->_viewIsVisible = 1;
  if (self->_needsHourHeightUpdate)
  {
    +[EKDayTimeView defaultHourScale];
LABEL_5:
    [(WeekViewController *)self _setHourHeightScale:weekViewHourHeightScale];
    [(WeekViewController *)self viewWillLayoutSubviews];
    double v5 = [(WeekViewController *)self view];
    [v5 layoutSubviews];

    [(WeekViewController *)self viewDidLayoutSubviews];
    [(WeekViewController *)self _updateTimeMarker];
    self->_needsHourHeightUpdate = 0;
    goto LABEL_6;
  }
  if (self->_initialShow)
  {
    double weekViewHourHeightScale = self->_weekViewHourHeightScale;
    goto LABEL_5;
  }
LABEL_6:
  [(WeekViewController *)self adjustVisibleAllDayOccurrenceLabelsAnimated:0];
  if (self->_initialShow
    && ![(WeekViewController *)self suppressInitialScrollToCurrentTime]
    && [(WeekViewController *)self isTodayVisible])
  {
    [(WeekViewController *)self scrollToCurrentTimeOfDayAnimated:1];
  }
  self->_initialShow = 0;
  [(CUIKCalendarModel *)self->super._model setDesiredPaddingDays:7];
  [(CUIKCalendarModel *)self->super._model setComponentForExpandingPadding:16];
}

- (void)viewWillDisappear:(BOOL)a3
{
  v12.receiver = self;
  v12.super_class = (Class)WeekViewController;
  [(WeekViewController *)&v12 viewWillDisappear:a3];
  uint64_t v4 = [(EKEventGestureController *)self->_eventGestureController event];
  double v5 = [(EKEventGestureController *)self->_eventGestureController occurrenceDate];
  [(WeekViewController *)self undimOccurrence:v4 occurrenceDate:v5];

  if (([(EKEventGestureController *)self->_eventGestureController dragGestureInProgress] & 1) == 0)[(EKEventGestureController *)self->_eventGestureController endForcedStart:0]; {
  self->_viewIsVisible = 0;
  }
  self->_viewWillAppearCalled = 0;
  [(WeekViewController *)self _invalidateMarkerTimer];
  if ([(WeekViewController *)self isTodayVisible])
  {
    if (![(WeekViewController *)self usesMultiDayWeekView])
    {
      objc_super v6 = CUIKTodayDate();
      double v7 = [(WeekViewController *)self model];
      objc_super v8 = [v7 eventStore];
      double v9 = [v8 timeZone];
      objc_super v10 = +[EKCalendarDate calendarDateWithDate:v6 timeZone:v9];

      double v11 = [(WeekViewController *)self model];
      [v11 setSelectedDate:v10];
    }
  }
}

- (BOOL)suppressInitialScrollToCurrentTime
{
  return 0;
}

- (BOOL)usesMultiDayWeekView
{
  return 0;
}

- (BOOL)usePortraitLayoutForSize:(CGSize)a3
{
  return a3.width <= a3.height;
}

- (int64_t)orientationForSize:(CGSize)a3
{
  if (-[WeekViewController usePortraitLayoutForSize:](self, "usePortraitLayoutForSize:", a3.width, a3.height)) {
    return 1;
  }
  else {
    return 4;
  }
}

- (int64_t)viewInterfaceOrientation
{
  objc_super v3 = [(WeekViewController *)self view];
  [v3 frame];
  int64_t v6 = -[WeekViewController orientationForSize:](self, "orientationForSize:", v4, v5);

  return v6;
}

- (id)_visibleOccurrenceViewsWithOptions:(int64_t)a3
{
  double v5 = &objc_retain_x2_ptr;
  int64_t v6 = +[NSMutableArray array];
  long long v25 = 0u;
  long long v26 = 0u;
  long long v27 = 0u;
  long long v28 = 0u;
  id obj = [(WeekViewController *)self visibleWeeks];
  id v7 = [obj countByEnumeratingWithState:&v25 objects:v29 count:16];
  if (v7)
  {
    id v8 = v7;
    uint64_t v9 = *(void *)v26;
    int64_t v23 = a3;
    do
    {
      for (i = 0; i != v8; i = (char *)i + 1)
      {
        if (*(void *)v26 != v9) {
          objc_enumerationMutation(obj);
        }
        double v11 = [*(id *)(*((void *)&v25 + 1) + 8 * i) weekView:v23];
        objc_super v12 = [v5[419] array];
        if (!a3)
        {
          id v15 = v8;
          uint64_t v16 = v9;
          uint64_t v17 = v6;
          CGFloat v18 = v5;
          v14 = [v11 occurrenceViews];
          if (v14) {
            [v12 addObjectsFromArray:v14];
          }
          CGFloat v19 = [v11 allDayView];
          v20 = [v19 occurrenceViews];

          [v12 addObjectsFromArray:v20];
          double v5 = v18;
          int64_t v6 = v17;
          uint64_t v9 = v16;
          id v8 = v15;
          a3 = v23;
          goto LABEL_15;
        }
        if ((a3 & 1) == 0)
        {
          if ((a3 & 2) == 0) {
            goto LABEL_16;
          }
          double v13 = [v11 allDayView];
          v14 = [v13 occurrenceViews];

LABEL_14:
          [v12 addObjectsFromArray:v14];
          goto LABEL_15;
        }
        v14 = [v11 occurrenceViews];
        if (v14) {
          goto LABEL_14;
        }
LABEL_15:

LABEL_16:
        [v6 addObjectsFromArray:v12];
      }
      id v8 = [obj countByEnumeratingWithState:&v25 objects:v29 count:16];
    }
    while (v8);
  }

  id v21 = [v6 copy];

  return v21;
}

- (void)_showWeekNumbersPrefDidChange
{
  objc_super v3 = +[CUIKPreferences sharedPreferences];
  self->_showWeekNumber = [v3 showWeekNumbers];

  if (self->_showWeekNumber)
  {
    [(WeekViewController *)self updateWeekNumber];
  }
  else
  {
    [(WeekTimeView *)self->_timeView setWeekNumberText:0];
    self->_currentlyDisplayedWeekNumber = -1;
  }
}

- (void)_weekViewStartsOnTodayPrefDidChange
{
  id v3 = +[CUIKPreferences sharedPreferences];
  self->_weekViewStartsOnToday = [v3 weekViewStartsOnToday];
}

- (void)overlayCalendarDidChange
{
  id v3 = CUIKGetOverlayCalendar();
  self->_showOverlayCalendar = v3 != 0;

  [(WeekViewController *)self _updateHeaderHeightsAnimated:0];
}

- (void)viewWillTransitionToSize:(CGSize)a3 withTransitionCoordinator:(id)a4
{
  double height = a3.height;
  double width = a3.width;
  v13.receiver = self;
  v13.super_class = (Class)WeekViewController;
  id v7 = a4;
  -[MainViewController viewWillTransitionToSize:withTransitionCoordinator:](&v13, "viewWillTransitionToSize:withTransitionCoordinator:", v7, width, height);
  id v8 = self->_eventGestureController;
  v10[0] = _NSConcreteStackBlock;
  v10[1] = 3221225472;
  v10[2] = sub_100083A54;
  v10[3] = &unk_1001D2DF0;
  double v11 = v8;
  objc_super v12 = self;
  uint64_t v9 = v8;
  [v7 animateAlongsideTransition:0 completion:v10];
}

- (BOOL)allowsOverriddenRightNavigationBarItems
{
  return 1;
}

- (BOOL)allowsOverriddenToolbarItems
{
  return 1;
}

- (void)showEvent:(id)a3 animated:(BOOL)a4 showMode:(unint64_t)a5 context:(id)a6
{
  BOOL v8 = a4;
  id v10 = a3;
  id v11 = a6;
  [(WeekViewController *)self scrollEventIntoView:v10 animated:v8 completion:0];
  unsigned int v12 = [v10 isNew];
  if (a5 == 3 || v12)
  {
    v14 = +[AddEventViewController editOrAddViewControllerForEventOrIntegrationWithEvent:v10 model:self->super._model creationMethod:0 eventEditViewDelegate:self];
  }
  else
  {
    objc_super v13 = [(MainViewController *)self augmentEventDetailsContext:v11];
    v14 = +[EKEventViewController eventDetailViewControllerWithEvent:v10 delegate:self context:v13];
    [(WeekViewController *)self ekui_adjustToolBarToTransparentStyle];
    [v14 ekui_adjustNavBarToTransparentStyle];
  }
  id v15 = +[NSBundle bundleForClass:objc_opt_class()];
  uint64_t v16 = [v15 localizedStringForKey:@"Week" value:&stru_1001D6918 table:0];
  uint64_t v17 = [(WeekViewController *)self navigationItem];
  [v17 setBackButtonTitle:v16];

  [(CUIKCalendarModel *)self->super._model setSelectedOccurrence:v10];
  if (a5)
  {
    v18[0] = _NSConcreteStackBlock;
    v18[1] = 3221225472;
    v18[2] = sub_100083D94;
    v18[3] = &unk_1001D2A40;
    id v19 = v14;
    unint64_t v20 = a5;
    [(MainViewController *)self showViewController:v19 sender:self animated:v8 completion:v18];
  }
}

- (void)showEvents:(id)a3 animated:(BOOL)a4 showMode:(unint64_t)a5 context:(id)a6
{
  BOOL v6 = a4;
  id v8 = a3;
  id v12 = [objc_alloc((Class)EKExpandedReminderStackViewController) initWithEvents:v8 delegate:self];
  uint64_t v9 = +[NSBundle bundleForClass:objc_opt_class()];
  id v10 = [v9 localizedStringForKey:@"Week" value:&stru_1001D6918 table:0];
  id v11 = [(WeekViewController *)self navigationItem];
  [v11 setBackButtonTitle:v10];

  [(CUIKCalendarModel *)self->super._model setSelectedOccurrences:v8];
  [(MainViewController *)self showViewController:v12 sender:self animated:v6 completion:0];
}

- (void)selectDate:(id)a3 animated:(BOOL)a4
{
  BOOL v4 = a4;
  id v7 = a3;
  BOOL v6 = [(WeekViewController *)self model];
  [v6 setSelectedDate:v7];

  [(WeekViewController *)self setDisplayedDate:v7 animated:v4];
}

- (BOOL)shouldPushNextLevelViewControllerWhenTodayIsVisible
{
  return 0;
}

- (BOOL)isTodayVisible
{
  id v3 = CUIKTodayDate();
  LOBYTE(self) = [(WeekViewController *)self dateIsVisible:v3];

  return (char)self;
}

- (id)bestDateForNewEvent
{
  if ([(WeekViewController *)self isTodayVisible])
  {
    id v3 = CUIKTodayDate();
    BOOL v4 = [(WeekViewController *)self model];
    double v5 = [v4 eventStore];
    BOOL v6 = [v5 timeZone];
    id v7 = +[EKCalendarDate calendarDateWithDate:v3 timeZone:v6];
  }
  else
  {
    id v7 = self->_displayedDate;
  }

  return v7;
}

- (EKCalendarDate)displayedDate
{
  return self->_displayedDate;
}

- (BOOL)currentlyEditingEventsWithGestures
{
  return [(EKEventGestureController *)self->_eventGestureController dragGestureInProgress];
}

- (id)sceneTitle
{
  if ([(WeekViewController *)self isViewLoaded])
  {
    id v3 = [(CUIKCalendarModel *)self->super._model calendar];
    BOOL v4 = [(WeekViewController *)self displayedDate];
    double v5 = [v4 date];
    if (v5)
    {
      BOOL v6 = CUIKTodayDate();
      unsigned int v7 = [(WeekViewController *)self isDateVisible:v6];

      if (v7)
      {
        id v8 = +[NSBundle bundleForClass:objc_opt_class()];
        uint64_t v9 = [v8 localizedStringForKey:@"This Week" value:&stru_1001D6918 table:0];
      }
      else
      {
        if (!self->_titleIntervalDateFormatter)
        {
          id v10 = (NSDateIntervalFormatter *)objc_alloc_init((Class)NSDateIntervalFormatter);
          titleIntervalDateFormatter = self->_titleIntervalDateFormatter;
          self->_titleIntervalDateFormatter = v10;

          id v12 = [(CUIKCalendarModel *)self->super._model calendar];
          [(NSDateIntervalFormatter *)self->_titleIntervalDateFormatter setCalendar:v12];

          objc_super v13 = [(CUIKCalendarModel *)self->super._model calendar];
          v14 = [v13 timeZone];
          [(NSDateIntervalFormatter *)self->_titleIntervalDateFormatter setTimeZone:v14];
        }
        id v8 = [(WeekViewController *)self earliestDateComponents];
        uint64_t v15 = [(WeekViewController *)self _latestDateComponents];
        uint64_t v16 = (void *)v15;
        uint64_t v9 = 0;
        if (v8 && v15)
        {
          uint64_t v17 = [v3 dateFromComponents:v8];
          CGFloat v18 = [v3 dateFromComponents:v16];
          id v19 = [v8 month];
          if (v19 == [v16 month]) {
            CFStringRef v20 = @"MMMMdy";
          }
          else {
            CFStringRef v20 = @"MMMdy";
          }
          [(NSDateIntervalFormatter *)self->_titleIntervalDateFormatter setDateTemplate:v20];
          uint64_t v9 = [(NSDateIntervalFormatter *)self->_titleIntervalDateFormatter stringFromDate:v17 toDate:v18];
        }
      }
    }
    else
    {
      uint64_t v9 = 0;
    }
  }
  else
  {
    uint64_t v9 = 0;
  }

  return v9;
}

- (BOOL)isDateVisible:(id)a3
{
  id v4 = a3;
  double v5 = [(CUIKCalendarModel *)self->super._model calendar];
  BOOL v6 = [(WeekViewController *)self earliestDateComponents];
  unsigned int v7 = [(WeekViewController *)self _latestDateComponents];
  id v8 = [v5 timeZone];
  uint64_t v9 = +[EKCalendarDate calendarDateWithDateComponents:v7 timeZone:v8];

  id v10 = [v9 calendarDateForEndOfDay];

  id v11 = [v5 dateFromComponents:v6];
  [v11 timeIntervalSinceReferenceDate];
  double v13 = v12;
  [v10 absoluteTime];
  double v15 = v14;
  [v4 timeIntervalSinceReferenceDate];
  double v17 = v16;
  CGFloat v18 = (void *)kCalUILogHandle;
  if (os_log_type_enabled((os_log_t)kCalUILogHandle, OS_LOG_TYPE_INFO))
  {
    id v19 = v18;
    CFStringRef v20 = [v10 date];
    int v23 = 138412802;
    id v24 = v4;
    __int16 v25 = 2112;
    long long v26 = v11;
    __int16 v27 = 2112;
    long long v28 = v20;
    _os_log_impl((void *)&_mh_execute_header, v19, OS_LOG_TYPE_INFO, "Week view determining if date %@ is visible. Onscreen dates: %@ - %@", (uint8_t *)&v23, 0x20u);
  }
  BOOL v21 = v17 <= v15 && v13 <= v17;

  return v21;
}

- (void)currentlyVisibleDateRangeFromStartDate:(id *)a3 toEndDate:(id *)a4
{
  id v12 = [(CUIKCalendarModel *)self->super._model calendar];
  unsigned int v7 = [(WeekViewController *)self earliestDateComponents];
  id v8 = [(WeekViewController *)self _latestDateComponents];
  uint64_t v9 = [v12 timeZone];
  id v10 = +[EKCalendarDate calendarDateWithDateComponents:v8 timeZone:v9];

  id v11 = [v10 calendarDateForEndOfDay];

  if (a3)
  {
    *a3 = [v12 dateFromComponents:v7];
  }
  if (a4)
  {
    *a4 = [v11 date];
  }
}

- (id)preferredPreSizeClassTransitionSelectedDate
{
  id v3 = [(MainViewController *)self shownEventEditViewController];

  if (v3)
  {
    id v4 = [(MainViewController *)self shownEventEditViewController];
    double v5 = [v4 event];
    BOOL v6 = [v5 startDate];
    unsigned int v7 = [(WeekViewController *)self model];
    id v8 = [v7 eventStore];
    uint64_t v9 = [v8 timeZone];
    id v10 = +[EKCalendarDate calendarDateWithDate:v6 timeZone:v9];
  }
  else if ([(WeekViewController *)self isTodayVisible])
  {
    id v11 = CUIKTodayDate();
    id v12 = [(WeekViewController *)self model];
    double v13 = [v12 eventStore];
    double v14 = [v13 timeZone];
    id v10 = +[EKCalendarDate calendarDateWithDate:v11 timeZone:v14];
  }
  else
  {
    v16.receiver = self;
    v16.super_class = (Class)WeekViewController;
    id v10 = [(MainViewController *)&v16 preferredPreSizeClassTransitionSelectedDate];
  }

  return v10;
}

- (void)showReminderDetail:(id)a3
{
}

- (void)_selectedDateChanged:(id)a3
{
  id v5 = [(WeekViewController *)self model];
  id v4 = [v5 selectedDate];
  [(WeekViewController *)self _updateBackButtonOnBackViewControllerToDate:v4];
}

- (void)_localeChanged:(id)a3
{
  [(WeekViewController *)self resizeWeekGroupsIfNeededForOrientation:[(WeekViewController *)self viewInterfaceOrientation]];

  [(WeekViewController *)self overlayCalendarDidChange];
}

- (void)_significantTimeChanged:(id)a3
{
  id v4 = [a3 userInfo];
  unsigned int v7 = [v4 objectForKeyedSubscript:CUIKCalendarModelSignificantTimeChangeNotificationDayChangedKey];

  id v5 = [v7 BOOLValue];
  BOOL v6 = v7;
  if ((v5 & 1) != 0 || !v7)
  {
    id v5 = [(WeekViewController *)self _updateTimeMarker];
    BOOL v6 = v7;
  }

  _objc_release_x1(v5, v6);
}

- (void)_calendarModelTimeZoneChanged:(id)a3
{
  id v4 = [(WeekViewController *)self model];
  id v5 = [v4 calendar];

  BOOL v6 = [(WeekViewController *)self model];
  unsigned int v7 = [v6 eventStore];
  id v8 = [v7 timeZone];

  long long v20 = 0u;
  long long v21 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  uint64_t v9 = self->_visibleWeeks;
  id v10 = [(NSMutableArray *)v9 countByEnumeratingWithState:&v18 objects:v22 count:16];
  if (v10)
  {
    id v11 = v10;
    uint64_t v12 = *(void *)v19;
    do
    {
      for (i = 0; i != v11; i = (char *)i + 1)
      {
        if (*(void *)v19 != v12) {
          objc_enumerationMutation(v9);
        }
        double v14 = *(void **)(*((void *)&v18 + 1) + 8 * i);
        [v14 setCalendar:v5];
        [v14 setTimeZone:v8];
      }
      id v11 = [(NSMutableArray *)v9 countByEnumeratingWithState:&v18 objects:v22 count:16];
    }
    while (v11);
  }

  [(NSMutableArray *)self->_reusableViews removeAllObjects];
  double v15 = [(EKCalendarDate *)self->_displayedDate dayComponents];
  objc_super v16 = [v5 dateFromComponents:v15];
  double v17 = +[EKCalendarDate calendarDateWithDate:v16 timeZone:v8];
  [(WeekViewController *)self setDisplayedDate:v17 forceScroll:1 animated:0];
}

- (void)_updateBackButtonOnBackViewControllerToDate:(id)a3
{
  id v5 = a3;
  id v4 = [(WeekViewController *)self navigationController];
  if (objc_opt_respondsToSelector()) {
    [v4 updateBackButtonToDate:v5];
  }
}

- (void)_updateContentForSizeCategoryChange:(id)a3
{
  +[EKUILargeTextUtilities clearCache];
  if (self->_viewWillAppearCalled)
  {
    +[EKDayTimeView defaultHourScale];
    -[WeekViewController _setHourHeightScale:](self, "_setHourHeightScale:");
  }
  else
  {
    self->_needsHourHeightUpdate = 1;
  }
  id v4 = +[CUIKPreferences sharedPreferences];
  +[EKDayTimeView defaultHourScale];
  *(float *)&double v5 = v5;
  BOOL v6 = +[NSNumber numberWithFloat:v5];
  [v4 setWeekViewHourScale:v6];

  +[EKDayTimeView defaultHourScale];
  double v8 = v7;
  uint64_t v9 = [(CUIKCalendarModel *)self->super._model persistedSceneState];
  [v9 setWeekViewHourScale:v8];

  [(WeekTimeView *)self->_timeView contentSizeCategoryChanged];
  [(WeekTimeView *)self->_timeView sizeToFit];
  [(WeekViewController *)self resizeWeekGroupsIfNeededForOrientation:[(WeekViewController *)self viewInterfaceOrientation]];
  if ([(NSMutableArray *)self->_visibleWeeks count])
  {
    id v10 = [(NSMutableArray *)self->_visibleWeeks objectAtIndex:0];
    id v11 = [v10 weekView];
    self->_lastScrollPositionSecond = (int64_t)[v11 firstVisibleSecond];
  }
  long long v29 = 0u;
  long long v30 = 0u;
  long long v27 = 0u;
  long long v28 = 0u;
  uint64_t v12 = self->_visibleWeeks;
  id v13 = [(NSMutableArray *)v12 countByEnumeratingWithState:&v27 objects:v32 count:16];
  if (v13)
  {
    id v14 = v13;
    uint64_t v15 = *(void *)v28;
    do
    {
      for (i = 0; i != v14; i = (char *)i + 1)
      {
        if (*(void *)v28 != v15) {
          objc_enumerationMutation(v12);
        }
        double v17 = *(void **)(*((void *)&v27 + 1) + 8 * i);
        [v17 removeFromSuperview];
        [(WeekViewController *)self _reuseWeekView:v17];
      }
      id v14 = [(NSMutableArray *)v12 countByEnumeratingWithState:&v27 objects:v32 count:16];
    }
    while (v14);
  }

  long long v25 = 0u;
  long long v26 = 0u;
  long long v23 = 0u;
  long long v24 = 0u;
  long long v18 = self->_reusableViews;
  id v19 = [(NSMutableArray *)v18 countByEnumeratingWithState:&v23 objects:v31 count:16];
  if (v19)
  {
    id v20 = v19;
    uint64_t v21 = *(void *)v24;
    do
    {
      for (j = 0; j != v20; j = (char *)j + 1)
      {
        if (*(void *)v24 != v21) {
          objc_enumerationMutation(v18);
        }
        [*(id *)(*((void *)&v23 + 1) + 8 * (void)j) removeFromSuperview];
      }
      id v20 = [(NSMutableArray *)v18 countByEnumeratingWithState:&v23 objects:v31 count:16];
    }
    while (v20);
  }

  [(NSMutableArray *)self->_visibleWeeks removeAllObjects];
  self->_visibleRange.location = 0;
  self->_visibleRange.length = 0;
  [(NSMutableArray *)self->_reusableViews removeAllObjects];
}

- (CGRect)_frameForWeek:(int64_t)a3
{
  double weekWidth = self->_weekWidth;
  double v4 = weekWidth * (double)a3;
  [(UIScrollView *)self->_weekScroller bounds];
  double v6 = 0.0;
  double v7 = v4;
  double v8 = weekWidth;
  result.size.double height = v5;
  result.size.double width = v8;
  result.origin.y = v6;
  result.origin.x = v7;
  return result;
}

- (id)dateForWeek:(int64_t)a3
{
  if (CalTimeDirectionIsLeftToRight()) {
    int64_t v5 = a3 - 27040;
  }
  else {
    int64_t v5 = 27040 - a3;
  }
  referenceWeekStart = self->_referenceWeekStart;

  return [(EKCalendarDate *)referenceWeekStart calendarDateByAddingWeeks:v5];
}

- (id)_createPreparedViewForWeek:(int64_t)a3
{
  int64_t v5 = [(WeekViewController *)self view];
  double v6 = [v5 window];

  if (v6)
  {
    double v7 = [(WeekViewController *)self view];
    double v8 = [v7 window];
    EKUIPushFallbackSizingContextWithViewHierarchy();
  }
  if ([(NSMutableArray *)self->_reusableViews count])
  {
    uint64_t v9 = [(NSMutableArray *)self->_reusableViews firstObject];
    [(WeekViewController *)self _frameForWeek:a3];
    -[WeekGroupView setFrame:](v9, "setFrame:");
    [(NSMutableArray *)self->_reusableViews removeObjectAtIndex:0];
  }
  else
  {
    id v10 = [WeekGroupView alloc];
    [(WeekViewController *)self _frameForWeek:a3];
    double v12 = v11;
    double v14 = v13;
    double v16 = v15;
    double v18 = v17;
    int64_t v19 = [(WeekViewController *)self intendedSizeClass];
    id v20 = [(MainViewController *)self window];
    uint64_t v9 = -[WeekGroupView initWithFrame:sizeClass:targetWindow:rightClickDelegate:isMultiDayView:](v10, "initWithFrame:sizeClass:targetWindow:rightClickDelegate:isMultiDayView:", v19, v20, self, [(WeekViewController *)self usesMultiDayWeekView], v12, v14, v16, v18);
  }
  [(WeekGroupView *)v9 setDelegate:self];
  [(WeekGroupView *)v9 setIsInUse:1];
  [(WeekGroupView *)v9 setWeek:a3];
  [(WeekGroupView *)v9 setAccessibilityIdentifier:@"weekGroupView"];
  uint64_t v21 = [(WeekViewController *)self dateForWeek:a3];
  CGFloat v22 = [(WeekViewController *)self model];
  long long v23 = [v22 calendar];
  [(WeekGroupView *)v9 setCalendar:v23];

  long long v24 = [(WeekViewController *)self model];
  long long v25 = [v24 eventStore];
  long long v26 = [v25 timeZone];
  [(WeekGroupView *)v9 setTimeZone:v26];

  long long v27 = [(WeekGroupView *)v9 weekView];
  [v27 setDataSource:self];

  BOOL v28 = [(WeekViewController *)self receiveTapsInHeader];
  long long v29 = [(WeekGroupView *)v9 weekView];
  long long v30 = [v29 allDayView];
  [v30 setReceiveTapsInHeader:v28];

  double v31 = [v21 allComponents];
  [(WeekGroupView *)v9 setWeekStartDate:v31];

  [(WeekViewController *)self _setHeaderHeightForWeekGroupView:v9 forceLayout:0];
  [(WeekGroupView *)v9 setHourHeightScale:self->_weekViewHourHeightScale];
  v32 = [(WeekViewController *)self view];
  +[EKDayTimeView defaultHeightForSizeClass:EKUIWidthSizeClassForViewHierarchy() orientation:[(WeekViewController *)self viewInterfaceOrientation]];
  double v34 = v33 * self->_weekViewHourHeightScale;

  double v35 = [(WeekGroupView *)v9 weekView];
  double v36 = [v35 scrollView];
  [v36 contentSize];
  double v38 = v37;

  CGRect v39 = [(WeekGroupView *)v9 weekView];
  v40 = [v39 scrollView];
  [v40 setContentSize:v38, v34];

  double v41 = [(WeekGroupView *)v9 weekView];
  double v42 = [v41 content];
  [v42 frame];
  double v44 = v43;
  double v46 = v45;
  double v48 = v47;

  int64_t v49 = [(WeekGroupView *)v9 weekView];
  v50 = [v49 content];
  [v50 setFrame:v44, v46, v48, v34];

  v51 = [(WeekGroupView *)v9 weekView];
  v52 = [v51 content];
  [v52 setNeedsLayout];

  if ([(NSMutableArray *)self->_visibleWeeks count])
  {
    v53 = [(NSMutableArray *)self->_visibleWeeks objectAtIndex:0];
    double v54 = [v53 weekView];
    id v55 = [v54 firstVisibleSecond];
    double v56 = [(WeekGroupView *)v9 weekView];
    [v56 setFirstVisibleSecond:v55];
  }
  [(UIScrollView *)self->_weekScroller addSubview:v9];
  if (v6)
  {
    double v57 = [(WeekViewController *)self view];
    double v58 = [v57 window];
    EKUIPopFallbackSizingContextWithViewHierarchy();
  }
  return v9;
}

- (id)weekScroller
{
  return self->_weekScroller;
}

- (id)verticalScrollView
{
  long long v25 = 0u;
  long long v26 = 0u;
  long long v27 = 0u;
  long long v28 = 0u;
  id v3 = self->_visibleWeeks;
  id v4 = [(NSMutableArray *)v3 countByEnumeratingWithState:&v25 objects:v29 count:16];
  if (v4)
  {
    id v5 = v4;
    uint64_t v6 = *(void *)v26;
    while (2)
    {
      for (i = 0; i != v5; i = (char *)i + 1)
      {
        if (*(void *)v26 != v6) {
          objc_enumerationMutation(v3);
        }
        double v8 = *(void **)(*((void *)&v25 + 1) + 8 * i);
        [v8 frame:v25];
        CGFloat v10 = v9;
        CGFloat v12 = v11;
        CGFloat v14 = v13;
        CGFloat v16 = v15;
        [(UIScrollView *)self->_weekScroller bounds];
        v33.origin.x = v17;
        v33.origin.y = v18;
        v33.size.double width = v19;
        v33.size.double height = v20;
        v31.origin.x = v10;
        v31.origin.y = v12;
        v31.size.double width = v14;
        v31.size.double height = v16;
        CGRect v32 = CGRectIntersection(v31, v33);
        if (!CGRectIsEmpty(v32))
        {
          id v21 = v8;
          goto LABEL_11;
        }
      }
      id v5 = [(NSMutableArray *)v3 countByEnumeratingWithState:&v25 objects:v29 count:16];
      if (v5) {
        continue;
      }
      break;
    }
  }
  id v21 = 0;
LABEL_11:

  CGFloat v22 = [v21 weekView];
  long long v23 = [v22 scrollView];

  return v23;
}

- (void)_reuseWeekView:(id)a3
{
  id v28 = a3;
  id v4 = [(EKEventGestureController *)self->_eventGestureController draggingView];

  if (v4)
  {
    id v5 = [(EKEventGestureController *)self->_eventGestureController draggingView];
    [v5 frame];
    double v7 = v6;
    double v9 = v8;

    [(EKEventGestureController *)self->_eventGestureController touchOffset];
    double v11 = v7 + v10;
    [(EKEventGestureController *)self->_eventGestureController touchOffset];
    double v13 = v9 + v12;
    weekScroller = self->_weekScroller;
    double v15 = [(EKEventGestureController *)self->_eventGestureController draggingView];
    CGFloat v16 = [v15 superview];
    -[UIScrollView convertPoint:fromView:](weekScroller, "convertPoint:fromView:", v16, v11, v13);
    double v18 = v17;
    double v20 = v19;

    id v21 = -[WeekViewController dateAtPoint:isAllDay:](self, "dateAtPoint:isAllDay:", 0, v18, v20);
    CGFloat v22 = [v28 weekStartDate];
    long long v23 = [v28 timeZone];
    long long v24 = +[EKCalendarDate calendarDateWithDateComponents:v22 timeZone:v23];

    if ([v24 compare:v21] == (id)-1)
    {
      long long v25 = [v24 calendarDateByAddingDays:-[WeekViewController daysInWeek](self, "daysInWeek")];
      if ([v25 compare:v21] == (id)1)
      {
        long long v26 = [(EKEventGestureController *)self->_eventGestureController event];
        long long v27 = [(EKEventGestureController *)self->_eventGestureController occurrenceDate];
        [(WeekViewController *)self undimOccurrence:v26 occurrenceDate:v27];

        [(EKEventGestureController *)self->_eventGestureController endForcedStart:0];
      }
    }
  }
  [v28 setIsInUse:0];
  [(NSMutableArray *)self->_reusableViews addObject:v28];
}

- (_NSRange)visibleRangeForOffset:(double)a3
{
  uint64_t v4 = 0;
  unint64_t v5 = (unint64_t)(a3 / self->_weekWidth);
  unint64_t v6 = v5 - 1;
  do
  {
    [(WeekViewController *)self _frameForWeek:v6];
    CGFloat v8 = v7;
    CGFloat v10 = v9;
    CGFloat v12 = v11;
    CGFloat v14 = v13;
    [(UIScrollView *)self->_weekScroller bounds];
    v37.origin.x = v15;
    v37.origin.y = v16;
    v37.size.double width = v17;
    v37.size.double height = v18;
    v35.origin.x = v8;
    v35.origin.y = v10;
    v35.size.double width = v12;
    v35.size.double height = v14;
    if (!CGRectIntersectsRect(v35, v37)) {
      break;
    }
    ++v4;
    --v6;
  }
  while (v4 != 2);
  for (uint64_t i = 0; i != 2; ++i)
  {
    [(WeekViewController *)self _frameForWeek:v5 + 1 + i];
    CGFloat v21 = v20;
    CGFloat v23 = v22;
    CGFloat v25 = v24;
    CGFloat v27 = v26;
    [(UIScrollView *)self->_weekScroller bounds];
    v38.origin.x = v28;
    v38.origin.y = v29;
    v38.size.double width = v30;
    v38.size.double height = v31;
    v36.origin.x = v21;
    v36.origin.y = v23;
    v36.size.double width = v25;
    v36.size.double height = v27;
    if (!CGRectIntersectsRect(v36, v38)) {
      break;
    }
  }
  NSUInteger v32 = v5 - v4;
  NSUInteger v33 = v4 + i + 1;
  result.length = v33;
  result.location = v32;
  return result;
}

- (void)updateVisibleRects
{
  long long v23 = 0u;
  long long v24 = 0u;
  long long v25 = 0u;
  long long v26 = 0u;
  id v3 = self->_visibleWeeks;
  id v4 = [(NSMutableArray *)v3 countByEnumeratingWithState:&v23 objects:v27 count:16];
  if (v4)
  {
    id v5 = v4;
    uint64_t v6 = *(void *)v24;
    do
    {
      for (uint64_t i = 0; i != v5; uint64_t i = (char *)i + 1)
      {
        if (*(void *)v24 != v6) {
          objc_enumerationMutation(v3);
        }
        CGFloat v8 = *(void **)(*((void *)&v23 + 1) + 8 * i);
        [(UIScrollView *)self->_weekScroller bounds];
        double v10 = v9;
        [(UIScrollView *)self->_weekScroller bounds];
        CGFloat v12 = v10 - v11;
        [(UIScrollView *)self->_weekScroller bounds];
        CGFloat v14 = v13;
        [(UIScrollView *)self->_weekScroller bounds];
        CGFloat v16 = v15 * 3.0;
        [(UIScrollView *)self->_weekScroller bounds];
        CGFloat v18 = v17;
        [v8 frame];
        v30.origin.double x = v12;
        v30.origin.double y = v14;
        v30.size.double width = v16;
        v30.size.double height = v18;
        CGRect v29 = CGRectIntersection(v28, v30);
        double x = v29.origin.x;
        double y = v29.origin.y;
        double width = v29.size.width;
        double height = v29.size.height;
        if (!CGRectIsEmpty(v29))
        {
          [v8 convertRect:self->_weekScroller x:x y:y width:width height:height];
          [v8 adjustForVisibleRect:];
        }
      }
      id v5 = [(NSMutableArray *)v3 countByEnumeratingWithState:&v23 objects:v27 count:16];
    }
    while (v5);
  }
}

- (void)layoutCellsAnimated:(BOOL)a3
{
  BOOL v71 = a3;
  [(UIScrollView *)self->_weekScroller contentOffset];
  unint64_t v4 = (unint64_t)-[WeekViewController visibleRangeForOffset:](self, "visibleRangeForOffset:");
  uint64_t v6 = v5;
  [(UIScrollView *)self->_weekScroller bounds];
  double v8 = v7;
  [(UIScrollView *)self->_weekScroller bounds];
  double v10 = v9;
  double v11 = [(WeekViewController *)self view];
  CGFloat v12 = [v11 window];
  [v12 frame];
  double v14 = v13;

  double v15 = [(WeekViewController *)self view];
  CGFloat v16 = [v15 window];
  [v16 frame];
  double v18 = v17;

  if ([(WeekViewController *)self rotatingToPortrait]
    || [(WeekViewController *)self rotatingToLandscape])
  {
    if ([(WeekViewController *)self rotatingToPortrait])
    {
      BOOL v19 = v14 > v18 || v8 > v10;
    }
    else
    {
      unsigned int v20 = [(WeekViewController *)self rotatingToLandscape];
      BOOL v21 = v8 < v10;
      if (v14 < v18) {
        BOOL v21 = 1;
      }
      if (v20) {
        BOOL v19 = v21;
      }
      else {
        BOOL v19 = 0;
      }
    }
    if (self->_prevLayoutScrollerSize.width == v8 && self->_prevLayoutScrollerSize.height == v10) {
      BOOL v19 = 1;
    }
  }
  else
  {
    BOOL v19 = 0;
  }
  [(UIScrollView *)self->_weekScroller bounds];
  self->_prevLayoutScrollerSize.double width = v22;
  self->_prevLayoutScrollerSize.double height = v23;
  NSUInteger length = self->_visibleRange.length;
  if (length)
  {
    NSUInteger location = self->_visibleRange.location;
    if (v19)
    {
      NSUInteger v26 = 0;
      NSUInteger v27 = 0;
      NSUInteger v68 = 0;
      unint64_t v28 = 0;
      uint64_t v6 = 0;
      CGRect v29 = 0;
      NSUInteger v70 = self->_visibleRange.length;
      unint64_t v4 = self->_visibleRange.location;
    }
    else
    {
      if (v4 >= location)
      {
        if (v4 > location)
        {
          NSUInteger v68 = 0;
          unint64_t v28 = 0;
          if (length >= v4 - location) {
            NSUInteger v27 = v4 - location;
          }
          else {
            NSUInteger v27 = self->_visibleRange.length;
          }
        }
        else
        {
          NSUInteger v27 = 0;
          NSUInteger v68 = 0;
          unint64_t v28 = 0;
        }
      }
      else
      {
        NSUInteger v27 = 0;
        NSUInteger v30 = location - v4;
        if ((unint64_t)v6 < location - v4) {
          NSUInteger v30 = (NSUInteger)v6;
        }
        NSUInteger v68 = v30;
        unint64_t v28 = v4;
      }
      CGFloat v31 = &v6[v4];
      NSUInteger v32 = length + location;
      NSUInteger v70 = (NSUInteger)v6;
      if ((unint64_t)&v6[v4] <= v32)
      {
        if ((unint64_t)&v6[v4] >= v32)
        {
          NSUInteger v26 = 0;
          uint64_t v6 = 0;
          CGRect v29 = 0;
        }
        else
        {
          uint64_t v6 = 0;
          CGRect v29 = 0;
          NSUInteger v33 = v32 - (void)v31;
          if (v33 >= length) {
            NSUInteger v26 = self->_visibleRange.length;
          }
          else {
            NSUInteger v26 = v33;
          }
        }
      }
      else
      {
        NSUInteger v26 = 0;
        if (v4 <= v32) {
          CGRect v29 = (char *)v32;
        }
        else {
          CGRect v29 = (char *)v4;
        }
        if (v6 >= &v6[v4 - v32]) {
          uint64_t v6 = &v6[v4 - v32];
        }
      }
    }
  }
  else
  {
    NSUInteger v26 = 0;
    NSUInteger v27 = 0;
    NSUInteger v68 = 0;
    unint64_t v28 = 0;
    NSUInteger v70 = (NSUInteger)v6;
    CGRect v29 = (char *)v4;
  }
  NSUInteger v69 = v4;
  uint64_t v34 = 376;
  if ([(NSMutableArray *)self->_visibleWeeks count])
  {
    CGRect v35 = [(NSMutableArray *)self->_visibleWeeks objectAtIndex:0];
    [v35 weekView];
    v37 = NSUInteger v36 = v26;
    int64_t v38 = (int64_t)[v37 firstVisibleSecond];

    NSUInteger v26 = v36;
    if (!v36) {
      goto LABEL_50;
    }
  }
  else
  {
    int64_t v38 = -1;
    if (!v26) {
      goto LABEL_50;
    }
  }
  if ([(NSMutableArray *)self->_visibleWeeks count])
  {
    unint64_t v73 = v28;
    NSUInteger v39 = self->_visibleRange.length;
    NSUInteger v67 = v26;
    NSUInteger v40 = v39 - v26;
    if (v39 >= v26)
    {
      NSUInteger v41 = v39 - v26;
      do
      {
        double v42 = -[NSMutableArray objectAtIndex:](self->_visibleWeeks, "objectAtIndex:", v41, v67);
        [v42 removeFromSuperview];
        [(WeekViewController *)self _reuseWeekView:v42];

        ++v41;
      }
      while (v41 < v39);
    }
    -[NSMutableArray removeObjectsInRange:](self->_visibleWeeks, "removeObjectsInRange:", v40, v67, v67);
    unint64_t v28 = v73;
  }
LABEL_50:
  if (v27 && [(NSMutableArray *)self->_visibleWeeks count])
  {
    unint64_t v43 = v28;
    for (uint64_t i = 0; i != v27; ++i)
    {
      double v45 = [(NSMutableArray *)self->_visibleWeeks objectAtIndex:i];
      [v45 removeFromSuperview];
      [(WeekViewController *)self _reuseWeekView:v45];
    }
    -[NSMutableArray removeObjectsInRange:](self->_visibleWeeks, "removeObjectsInRange:", 0, v27);
    unint64_t v28 = v43;
  }
  if ([(NSMutableArray *)self->_visibleWeeks count]) {
    BOOL v46 = 1;
  }
  else {
    BOOL v46 = v38 == -1;
  }
  double v47 = &OBJC_IVAR___WeekAllDayView__useMultiDayHeaderStyle;
  if (!v46) {
    self->_lastScrollPositionSecond = v38;
  }
  if ([(NSMutableArray *)self->_visibleWeeks count]) {
    BOOL v48 = 0;
  }
  else {
    BOOL v48 = self->_lastScrollPositionSecond != -1;
  }
  v75[0] = _NSConcreteStackBlock;
  v75[1] = 3221225472;
  v75[2] = sub_1000860AC;
  v75[3] = &unk_1001D38E0;
  v75[4] = self;
  BOOL v76 = v71;
  v74 = objc_retainBlock(v75);
  if (v68)
  {
    unint64_t v49 = v28 + v68 - 1;
    v72 = v29;
    do
    {
      if (v49 < v28) {
        break;
      }
      id v50 = [(WeekViewController *)self _createPreparedViewForWeek:v49];
      v51 = v50;
      if (v48)
      {
        uint64_t v52 = v47[377];
        v53 = v6;
        uint64_t v54 = v34;
        BOOL v55 = v48;
        double v56 = v47;
        unint64_t v57 = v28;
        uint64_t v58 = *(uint64_t *)((char *)&self->super.super.super.super.isa + v52);
        double v59 = [v50 weekView];
        uint64_t v60 = v58;
        unint64_t v28 = v57;
        double v47 = v56;
        BOOL v48 = v55;
        uint64_t v34 = v54;
        uint64_t v6 = v53;
        CGRect v29 = v72;
        [v59 setFirstVisibleSecond:v60];
      }
      [*(id *)((char *)&self->super.super.super.super.isa + v34) insertObject:v51 atIndex:0];
      id v61 = [(UIScrollView *)self->_weekScroller isTracking]
          ? (id)1
          : [(UIScrollView *)self->_weekScroller isScrollAnimating];
      [v51 setAsyncLoading:v61];
      if ([v51 asyncLoading]) {
        [v51 loadDataAsyncWithCompletion:v74 reverse:1];
      }
      else {
        [v51 reloadData];
      }

      --v49;
    }
    while (v49 != -1);
  }
  if (v6 && v29 < &v6[(void)v29])
  {
    do
    {
      id v62 = [(WeekViewController *)self _createPreparedViewForWeek:v29];
      v63 = v62;
      if (v48)
      {
        uint64_t v64 = *(uint64_t *)((char *)&self->super.super.super.super.isa + v47[377]);
        double v65 = [v62 weekView];
        [v65 setFirstVisibleSecond:v64];
      }
      [*(id *)((char *)&self->super.super.super.super.isa + v34) addObject:v63];
      if ([(UIScrollView *)self->_weekScroller isTracking]) {
        uint64_t v66 = 1;
      }
      else {
        uint64_t v66 = (uint64_t)[(UIScrollView *)self->_weekScroller isScrollAnimating];
      }
      [v63 setAsyncLoading:v66];
      if ([v63 asyncLoading]) {
        [v63 loadDataAsyncWithCompletion:v74 reverse:0];
      }
      else {
        [v63 reloadData];
      }

      ++v29;
      --v6;
    }
    while (v6);
  }
  self->_visibleRange.NSUInteger location = v69;
  self->_visibleRange.NSUInteger length = v70;
  [(WeekViewController *)self updateVisibleRects];
  [(WeekViewController *)self _updateAllDayView];
  [(WeekViewController *)self _updateHeaderHeightsAnimated:v71];
  [(WeekViewController *)self _updateAllDaySectionScrollerContentSize];
}

- (void)_updateAllDayView
{
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  v2 = self->_visibleWeeks;
  id v3 = [(NSMutableArray *)v2 countByEnumeratingWithState:&v12 objects:v16 count:16];
  if (v3)
  {
    id v4 = v3;
    uint64_t v5 = *(void *)v13;
    do
    {
      for (uint64_t i = 0; i != v4; uint64_t i = (char *)i + 1)
      {
        if (*(void *)v13 != v5) {
          objc_enumerationMutation(v2);
        }
        double v7 = *(void **)(*((void *)&v12 + 1) + 8 * i);
        double v8 = [v7 weekView];
        unsigned int v9 = [v8 hasAllDayEvents];

        if (v9)
        {
          double v10 = [v7 weekView];
          double v11 = [v10 allDayView];
          [v11 setNeedsLayout];
        }
      }
      id v4 = [(NSMutableArray *)v2 countByEnumeratingWithState:&v12 objects:v16 count:16];
    }
    while (v4);
  }
}

- (void)_updateTimeMarker
{
  BOOL v3 = [(WeekViewController *)self isTodayVisible];
  [(WeekTimeView *)self->_timeView setShowsTimeMarker:v3];
  [(WeekTimeView *)self->_timeView updateMarkerPosition];
  BOOL v4 = [(WeekViewController *)self _isLeadingEdgeToday];
  long long v26 = 0u;
  long long v27 = 0u;
  long long v28 = 0u;
  long long v29 = 0u;
  uint64_t v5 = self->_visibleWeeks;
  id v6 = [(NSMutableArray *)v5 countByEnumeratingWithState:&v26 objects:v31 count:16];
  if (v6)
  {
    id v7 = v6;
    uint64_t v8 = *(void *)v27;
    do
    {
      for (uint64_t i = 0; i != v7; uint64_t i = (char *)i + 1)
      {
        if (*(void *)v27 != v8) {
          objc_enumerationMutation(v5);
        }
        double v10 = *(void **)(*((void *)&v26 + 1) + 8 * i);
        double v11 = [v10 weekView];
        [v11 hideNowDot:v4];

        long long v12 = [v10 weekView];
        [v12 updateMarkerPosition];

        if (v3 & [v10 showsTimeMarker])
        {
          long long v13 = [v10 weekView];
          [v13 updateTimeMarkerForDayChange];
        }
        else
        {
          [v10 setShowsTimeMarker:v3];
        }
      }
      id v7 = [(NSMutableArray *)v5 countByEnumeratingWithState:&v26 objects:v31 count:16];
    }
    while (v7);
  }

  long long v24 = 0u;
  long long v25 = 0u;
  long long v22 = 0u;
  long long v23 = 0u;
  long long v14 = self->_reusableViews;
  id v15 = [(NSMutableArray *)v14 countByEnumeratingWithState:&v22 objects:v30 count:16];
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
        BOOL v19 = *(void **)(*((void *)&v22 + 1) + 8 * (void)j);
        unsigned int v20 = [v19 weekView];
        [v20 hideNowDot:v4];

        if (v3 & [v19 showsTimeMarker])
        {
          BOOL v21 = [v19 weekView];
          [v21 updateTimeMarkerForDayChange];
        }
        else
        {
          [v19 setShowsTimeMarker:v3];
        }
      }
      id v16 = [(NSMutableArray *)v14 countByEnumeratingWithState:&v22 objects:v30 count:16];
    }
    while (v16);
  }

  [(WeekViewController *)self _updateTimeMarkerExtensionColor:v4];
  if (v3) {
    [(WeekViewController *)self _startMarkerTimer];
  }
  else {
    [(WeekViewController *)self _invalidateMarkerTimer];
  }
}

- (BOOL)_isLeadingEdgeToday
{
  v2 = [(WeekViewController *)self earliestDateComponents];
  BOOL v3 = CUIKCalendar();
  BOOL v4 = [v3 dateFromComponents:v2];

  uint64_t v5 = CUIKTodayDate();
  unsigned __int8 v6 = [v4 isEqualToDate:v5];

  return v6;
}

- (void)_updateTimeMarkerExtensionColor:(BOOL)a3
{
  if (a3) {
    +[UIColor cuik_todayTimelineColor];
  }
  else {
  id v4 = +[UIColor cuik_nonTodayTimelineColor];
  }
  [(WeekTimeView *)self->_timeView setTimeMarkerExtensionColor:v4];
}

- (void)scrollViewDidScroll:(id)a3
{
  if (!self->_preventScrollUpdates)
  {
    [(WeekViewController *)self layoutCellsAnimated:[(WeekViewController *)self userInitiatedScroll]];
    if ([(WeekViewController *)self userInitiatedScroll]) {
      [(WeekViewController *)self updateDisplayedDateForCurrentScrollOffset];
    }
    BOOL v4 = [(WeekViewController *)self _isLeadingEdgeToday];
    [(WeekViewController *)self _updateTimeMarkerExtensionColor:v4];
    long long v23 = 0u;
    long long v24 = 0u;
    long long v21 = 0u;
    long long v22 = 0u;
    uint64_t v5 = self->_visibleWeeks;
    id v6 = [(NSMutableArray *)v5 countByEnumeratingWithState:&v21 objects:v26 count:16];
    if (v6)
    {
      id v7 = v6;
      uint64_t v8 = *(void *)v22;
      do
      {
        for (uint64_t i = 0; i != v7; uint64_t i = (char *)i + 1)
        {
          if (*(void *)v22 != v8) {
            objc_enumerationMutation(v5);
          }
          double v10 = [*(id *)(*((void *)&v21 + 1) + 8 * i) weekView];
          [v10 hideNowDot:v4];
        }
        id v7 = [(NSMutableArray *)v5 countByEnumeratingWithState:&v21 objects:v26 count:16];
      }
      while (v7);
    }

    long long v19 = 0u;
    long long v20 = 0u;
    long long v17 = 0u;
    long long v18 = 0u;
    double v11 = self->_reusableViews;
    id v12 = [(NSMutableArray *)v11 countByEnumeratingWithState:&v17 objects:v25 count:16];
    if (v12)
    {
      id v13 = v12;
      uint64_t v14 = *(void *)v18;
      do
      {
        for (j = 0; j != v13; j = (char *)j + 1)
        {
          if (*(void *)v18 != v14) {
            objc_enumerationMutation(v11);
          }
          id v16 = [*(id *)(*((void *)&v17 + 1) + 8 * (void)j) weekView:v17];
          [v16 hideNowDot:v4];
        }
        id v13 = [(NSMutableArray *)v11 countByEnumeratingWithState:&v17 objects:v25 count:16];
      }
      while (v13);
    }
  }
}

- (BOOL)userInitiatedScroll
{
  if ([(WeekViewController *)self userIsScrolling]) {
    return 1;
  }

  return [(WeekViewController *)self userIsDragging];
}

- (BOOL)userIsDragging
{
  return self->_previousGestureDate != 0;
}

- (BOOL)userIsScrolling
{
  return self->_isUserScrolling;
}

- (void)scrollViewWillBeginDragging:(id)a3
{
  self->_isUserScrolling = 1;
}

- (void)scrollViewWillEndDragging:(id)a3 withVelocity:(CGPoint)a4 targetContentOffset:(CGPoint *)a5
{
}

- (void)snapTargetScrollOffset:(CGPoint *)a3 withVelocity:(CGPoint)a4
{
  double x = a4.x;
  BOOL v7 = [(WeekViewController *)self displaysDatesSnappedToWeekBoundaries];
  [(UIScrollView *)self->_weekScroller contentOffset];
  uint64_t v8 = -[WeekViewController dayDateAtPoint:](self, "dayDateAtPoint:");
  unsigned int v9 = -[WeekViewController dayDateAtPoint:](self, "dayDateAtPoint:", a3->x, a3->y);
  if (v7)
  {
    id v22 = [v8 calendarDateForWeekWithWeekStart:CUIKOneIndexedWeekStart()];

    [v9 calendarDateForWeekWithWeekStart:CUIKOneIndexedWeekStart()];
  }
  else
  {
    id v22 = [v8 calendarDateForDay];

    [v9 calendarDateForDay];
  double v10 = };

  int IsLeftToRight = CalTimeDirectionIsLeftToRight();
  double v12 = -x;
  if (IsLeftToRight) {
    double v12 = x;
  }
  if (v12 <= 0.5)
  {
    if (v12 < -0.5)
    {
      if (v7) {
        [v22 calendarDateByAddingWeeks:-1];
      }
      else {
      long long v19 = [v22 calendarDateByAddingDays:-1];
      }
      if ([v19 compare:v10] == (id)1)
      {
        -[WeekViewController _snapDateForOffset:snapToWeeks:](self, "_snapDateForOffset:snapToWeeks:", v7, a3->x, a3->y);
        id v20 = (id)objc_claimAutoreleasedReturnValue();
      }
      else
      {
        id v20 = v10;
      }
      long long v18 = v20;

      goto LABEL_24;
    }
    double v14 = a3->x;
    double y = a3->y;
    id v16 = self;
    BOOL v17 = 0;
  }
  else
  {
    if ([v22 compare:v10] != (id)-1)
    {
      if (v7) {
        [v10 calendarDateByAddingWeeks:1];
      }
      else {
      uint64_t v13 = [v10 calendarDateByAddingDays:1];
      }
      goto LABEL_18;
    }
    double v14 = a3->x;
    double y = a3->y;
    id v16 = self;
    BOOL v17 = v7;
  }
  uint64_t v13 = -[WeekViewController _snapDateForOffset:snapToWeeks:](v16, "_snapDateForOffset:snapToWeeks:", v17, v14, y);
LABEL_18:
  long long v18 = (void *)v13;
LABEL_24:
  [(WeekViewController *)self _xOffsetForDate:v18];
  a3->double x = v21;
}

- (id)_snapDateForOffset:(CGPoint)a3 snapToWeeks:(BOOL)a4
{
  double y = a3.y;
  double x = a3.x;
  uint64_t v8 = -[WeekViewController dayDateAtPoint:](self, "dayDateAtPoint:");
  if (a4)
  {
    uint64_t v9 = [v8 calendarDateForWeekWithWeekStart:CUIKOneIndexedWeekStart()];

    [(WeekViewController *)self weekWidth];
    double v11 = -[WeekViewController dayDateAtPoint:](self, "dayDateAtPoint:", x + v10 * 0.5, y);
    double v12 = [v11 calendarDateForWeekWithWeekStart:CUIKOneIndexedWeekStart()];
    uint64_t v8 = (void *)v9;
  }
  else
  {
    double v11 = -[WeekViewController dayDateAtPoint:](self, "dayDateAtPoint:", x + 0.0, y);
    double v12 = [v11 calendarDateForDay];
  }

  if ([v12 isEqual:v8]) {
    uint64_t v13 = v8;
  }
  else {
    uint64_t v13 = v12;
  }
  id v14 = v13;

  return v14;
}

- (BOOL)shouldSnapToWeeksOnFlicks
{
  return 0;
}

- (void)scrollViewDidEndDragging:(id)a3 willDecelerate:(BOOL)a4
{
  if (!a4) {
    [(WeekViewController *)self draggingDone];
  }
}

- (void)scrollViewDidEndDecelerating:(id)a3
{
  self->_isUserScrolling = 0;
}

- (void)scrollViewDidEndScrollingAnimation:(id)a3
{
  [(WeekViewController *)self draggingDone];
  uint64_t v5 = [(WeekViewController *)self earliestDateComponents];
  if (!v5)
  {
    [(WeekViewController *)self layoutCellsAnimated:0];
    uint64_t v5 = [(WeekViewController *)self earliestDateComponents];
    if (!v5)
    {
      id v16 = +[NSAssertionHandler currentHandler];
      [v16 handleFailureInMethod:a2 object:self file:@"WeekViewController.m" lineNumber:1420 description:@"Found nil date components for first visible subview."];

      uint64_t v5 = 0;
    }
  }
  id v17 = (id)v5;
  id v6 = CUIKCalendar();
  BOOL v7 = [v6 dateFromComponents:v17];

  uint64_t v8 = [(WeekViewController *)self model];
  uint64_t v9 = [v8 eventStore];
  double v10 = [v9 timeZone];
  double v11 = +[EKCalendarDate calendarDateWithDate:v7 timeZone:v10];
  double v12 = [v11 calendarDateByAddingDays:-[WeekViewController daysInWeek](self, "daysInWeek")];
  uint64_t v13 = [v12 date];

  id v14 = +[NSDictionary dictionaryWithObjectsAndKeys:v7, @"WeekViewController_ScrollDidEndAnimationRangeStartKey", v13, @"WeekViewController_ScrollDidEndAnimationRangeEndKey", 0];
  id v15 = +[NSNotificationCenter defaultCenter];
  [v15 postNotificationName:@"WeekViewController_ScrollDidEndAnimationNotification" object:self userInfo:v14];
}

- (void)draggingDone
{
  [(WeekViewController *)self updatePreferredReloadRange];
  [(WeekViewController *)self adjustVisibleAllDayOccurrenceLabelsAnimated:1];
  [(WeekViewController *)self _updateTimeMarker];
  id v8 = [(WeekViewController *)self centerDateComponents];
  if (v8)
  {
    BOOL v3 = [(WeekViewController *)self model];
    BOOL v4 = [v3 calendar];
    uint64_t v5 = [v4 timeZone];
    id v6 = +[EKCalendarDate calendarDateWithDateComponents:v8 timeZone:v5];

    CalAnalyticsSendEventLazy();
    BOOL v7 = [(WeekViewController *)self model];
    [v7 setSelectedDate:v6];
  }
  [(WeekViewController *)self updateDisplayedDateForCurrentScrollOffset];
  [(MainViewController *)self setSceneTitleNeedsUpdate];
  [(WeekViewController *)self _updateShouldAnnotateAppEntities];
}

- (void)_updateShouldAnnotateAppEntities
{
  BOOL v3 = [(CUIKCalendarModel *)self->super._model calendar];
  BOOL v4 = [(WeekViewController *)self earliestDateComponents];
  uint64_t v5 = [v3 dateFromComponents:v4];
  cachedEarliestDate = self->_cachedEarliestDate;
  self->_cachedEarliestDate = v5;

  BOOL v7 = [(WeekViewController *)self _latestDateComponents];
  id v8 = [v3 dateFromComponents:v7];
  cachedLatestDate = self->_cachedLatestDate;
  self->_cachedLatestDate = v8;

  long long v26 = 0u;
  long long v27 = 0u;
  long long v24 = 0u;
  long long v25 = 0u;
  double v10 = self->_visibleWeeks;
  id v11 = [(NSMutableArray *)v10 countByEnumeratingWithState:&v24 objects:v29 count:16];
  if (v11)
  {
    id v12 = v11;
    uint64_t v13 = *(void *)v25;
    do
    {
      id v14 = 0;
      do
      {
        if (*(void *)v25 != v13) {
          objc_enumerationMutation(v10);
        }
        [*(id *)(*((void *)&v24 + 1) + 8 * (void)v14) shouldAnnotateAppEntitiesChanged];
        id v14 = (char *)v14 + 1;
      }
      while (v12 != v14);
      id v12 = [(NSMutableArray *)v10 countByEnumeratingWithState:&v24 objects:v29 count:16];
    }
    while (v12);
  }

  long long v22 = 0u;
  long long v23 = 0u;
  long long v20 = 0u;
  long long v21 = 0u;
  id v15 = self->_reusableViews;
  id v16 = [(NSMutableArray *)v15 countByEnumeratingWithState:&v20 objects:v28 count:16];
  if (v16)
  {
    id v17 = v16;
    uint64_t v18 = *(void *)v21;
    do
    {
      long long v19 = 0;
      do
      {
        if (*(void *)v21 != v18) {
          objc_enumerationMutation(v15);
        }
        [*(id *)(*((void *)&v20 + 1) + 8 * (void)v19) shouldAnnotateAppEntitiesChanged:v20];
        long long v19 = (char *)v19 + 1;
      }
      while (v17 != v19);
      id v17 = [(NSMutableArray *)v15 countByEnumeratingWithState:&v20 objects:v28 count:16];
    }
    while (v17);
  }
}

- (int64_t)firstVisibleSecond
{
  memset(v6, 0, sizeof(v6));
  v2 = self->_visibleWeeks;
  if ([(NSMutableArray *)v2 countByEnumeratingWithState:v6 objects:v7 count:16])
  {
    BOOL v3 = [**((id **)&v6[0] + 1) weekView:*(void *)&v6[0]];
    id v4 = [v3 firstVisibleSecond];
  }
  else
  {
    id v4 = 0;
  }

  return (int64_t)v4;
}

- (void)setFirstVisibleSecond:(int64_t)a3
{
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  id v4 = self->_visibleWeeks;
  id v5 = [(NSMutableArray *)v4 countByEnumeratingWithState:&v10 objects:v14 count:16];
  if (v5)
  {
    id v6 = v5;
    uint64_t v7 = *(void *)v11;
    do
    {
      id v8 = 0;
      do
      {
        if (*(void *)v11 != v7) {
          objc_enumerationMutation(v4);
        }
        uint64_t v9 = [*(id *)(*((void *)&v10 + 1) + 8 * (void)v8) weekView:(void)v10];
        [v9 setFirstVisibleSecond:a3];

        id v8 = (char *)v8 + 1;
      }
      while (v6 != v8);
      id v6 = [(NSMutableArray *)v4 countByEnumeratingWithState:&v10 objects:v14 count:16];
    }
    while (v6);
  }
}

- (void)occurrencesChanged:(id)a3
{
  id v15 = a3;
  id v4 = [(NSMutableArray *)self->_visibleWeeks count];
  id v5 = v15;
  if (v4)
  {
    id v6 = [v15 userInfo];
    uint64_t v7 = [v6 objectForKey:CUIKCalendarModelDisplayedOccurrencesChangedRangeStartKey];
    uint64_t v8 = [v6 objectForKey:CUIKCalendarModelDisplayedOccurrencesChangedRangeEndKey];
    uint64_t v9 = (void *)v8;
    if (v7) {
      BOOL v10 = v8 == 0;
    }
    else {
      BOOL v10 = 1;
    }
    if (!v10)
    {
      reloadDateRangeStart = self->_reloadDateRangeStart;
      if (!reloadDateRangeStart
        || ([(NSDate *)reloadDateRangeStart earlierDate:v7],
            long long v12 = objc_claimAutoreleasedReturnValue(),
            v12,
            v12 == v7))
      {
        objc_storeStrong((id *)&self->_reloadDateRangeStart, v7);
      }
      reloadDateRangeEnd = self->_reloadDateRangeEnd;
      if (!reloadDateRangeEnd
        || ([(NSDate *)reloadDateRangeEnd laterDate:v9],
            id v14 = objc_claimAutoreleasedReturnValue(),
            v14,
            v14 == v9))
      {
        objc_storeStrong((id *)&self->_reloadDateRangeEnd, v9);
      }
    }
    [(WeekViewController *)self _reloadDataIfVisible];
    [(WeekViewController *)self _updateSelectedViewsToMatchModel];

    id v5 = v15;
  }

  _objc_release_x1(v4, v5);
}

- (void)_reloadDataIfVisible
{
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  BOOL v3 = self->_visibleWeeks;
  id v4 = [(NSMutableArray *)v3 countByEnumeratingWithState:&v15 objects:v19 count:16];
  if (v4)
  {
    id v5 = v4;
    int v6 = 0;
    uint64_t v7 = *(void *)v16;
    do
    {
      for (uint64_t i = 0; i != v5; uint64_t i = (char *)i + 1)
      {
        if (*(void *)v16 != v7) {
          objc_enumerationMutation(v3);
        }
        v6 |= [*(id *)(*((void *)&v15 + 1) + 8 * i) asyncLoading:v15];
      }
      id v5 = [(NSMutableArray *)v3 countByEnumeratingWithState:&v15 objects:v19 count:16];
    }
    while (v5);
  }
  else
  {
    LOBYTE(v6) = 0;
  }

  uint64_t v9 = [(WeekViewController *)self view];
  BOOL v10 = [v9 window];
  long long v11 = [v10 windowScene];

  if (v11
    && (![v11 activationState] || objc_msgSend(v11, "activationState") == (id)1)
    && self->_viewWillAppearCalled
    && ([(WeekViewController *)self view],
        long long v12 = objc_claimAutoreleasedReturnValue(),
        [v12 window],
        long long v13 = objc_claimAutoreleasedReturnValue(),
        char v14 = [v13 isRotating] | v6,
        v13,
        v12,
        (v14 & 1) == 0))
  {
    [(WeekViewController *)self reloadData];
  }
  else
  {
    self->_needsReload = 1;
  }
}

- (void)loadDataAsync
{
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  BOOL v3 = self->_visibleWeeks;
  id v4 = [(NSMutableArray *)v3 countByEnumeratingWithState:&v12 objects:v16 count:16];
  if (v4)
  {
    id v5 = v4;
    uint64_t v6 = *(void *)v13;
    do
    {
      for (uint64_t i = 0; i != v5; uint64_t i = (char *)i + 1)
      {
        if (*(void *)v13 != v6) {
          objc_enumerationMutation(v3);
        }
        uint64_t v8 = *(void **)(*((void *)&v12 + 1) + 8 * i);
        [v8 setAsyncLoading:1];
        v11[0] = _NSConcreteStackBlock;
        v11[1] = 3221225472;
        v11[2] = sub_10008779C;
        v11[3] = &unk_1001D3948;
        v11[4] = self;
        [v8 loadDataAsyncWithCompletion:v11 reverse:0];
      }
      id v5 = [(NSMutableArray *)v3 countByEnumeratingWithState:&v12 objects:v16 count:16];
    }
    while (v5);
  }

  reloadDateRangeStart = self->_reloadDateRangeStart;
  self->_reloadDateRangeStart = 0;

  reloadDateRangeEnd = self->_reloadDateRangeEnd;
  self->_reloadDateRangeEnd = 0;

  self->_needsReload = 0;
}

- (void)reloadData
{
  long long v25 = 0u;
  long long v26 = 0u;
  long long v27 = 0u;
  long long v28 = 0u;
  id obj = self->_visibleWeeks;
  id v3 = [(NSMutableArray *)obj countByEnumeratingWithState:&v25 objects:v29 count:16];
  id v4 = &OBJC_IVAR___WeekAllDayView__useMultiDayHeaderStyle;
  if (v3)
  {
    id v5 = v3;
    uint64_t v6 = *(void *)v26;
    uint64_t v22 = *(void *)v26;
    do
    {
      uint64_t v7 = 0;
      id v23 = v5;
      do
      {
        if (*(void *)v26 != v6) {
          objc_enumerationMutation(obj);
        }
        uint64_t v8 = *(void **)(*((void *)&v25 + 1) + 8 * (void)v7);
        uint64_t v9 = v4[410];
        if (*(Class *)((char *)&self->super.super.super.super.isa + v9) && self->_reloadDateRangeEnd)
        {
          BOOL v10 = v4;
          long long v11 = [(WeekViewController *)self model];
          long long v12 = [v11 calendar];
          long long v13 = [v8 weekStartDate];
          long long v14 = [v12 dateFromComponents:v13];

          long long v15 = [v8 lastSecondOfWeek];
          NSComparisonResult v16 = [(NSDate *)self->_reloadDateRangeEnd compare:v14];
          id v17 = [*(id *)((char *)&self->super.super.super.super.isa + v9) compare:v15];
          if (v16 != NSOrderedAscending && v17 != (id)1) {
            [v8 reloadData];
          }

          id v4 = v10;
          uint64_t v6 = v22;
          id v5 = v23;
        }
        else
        {
          [*(id *)(*((void *)&v25 + 1) + 8 * (void)v7) reloadData];
        }
        uint64_t v7 = (char *)v7 + 1;
      }
      while (v5 != v7);
      id v5 = [(NSMutableArray *)obj countByEnumeratingWithState:&v25 objects:v29 count:16];
    }
    while (v5);
  }

  [(WeekViewController *)self _updateHeaderHeightsAnimated:0];
  uint64_t v19 = v4[410];
  long long v20 = *(Class *)((char *)&self->super.super.super.super.isa + v19);
  *(Class *)((char *)&self->super.super.super.super.isa + v19) = 0;

  reloadDateRangeEnd = self->_reloadDateRangeEnd;
  self->_reloadDateRangeEnd = 0;

  self->_needsReload = 0;
}

- (void)updatePreferredReloadRange
{
  id v13 = [(WeekViewController *)self centerDateComponents];
  if (v13)
  {
    id v3 = [(WeekViewController *)self model];
    id v4 = [v3 calendar];
    id v5 = [v4 timeZone];
    uint64_t v6 = +[EKCalendarDate calendarDateWithDateComponents:v13 timeZone:v5];

    uint64_t v7 = CUIKOneIndexedWeekStart();
    uint64_t v8 = [v6 calendarDateForWeekWithWeekStart:v7];
    uint64_t v9 = [v8 calendarDateForEndOfWeekWithWeekStart:v7];
    BOOL v10 = [(WeekViewController *)self model];
    long long v11 = [v8 date];
    long long v12 = [v9 date];
    [v10 setPreferredReloadStartDate:v11 endDate:v12];
  }
}

- (id)weekView:(id)a3 allEventsForStartDate:(id)a4 endDate:(id)a5
{
  id v7 = a5;
  id v8 = a4;
  uint64_t v9 = [(WeekViewController *)self model];
  BOOL v10 = [v9 occurrencesForStartDate:v8 endDate:v7 preSorted:1 waitForLoad:1];

  return v10;
}

- (id)weekView:(id)a3 eventsForStartDate:(id)a4 endDate:(id)a5
{
  id v7 = a5;
  id v8 = a4;
  uint64_t v9 = [(WeekViewController *)self model];
  BOOL v10 = [v9 occurrencesForStartDate:v8 endDate:v7 preSorted:1 waitForLoad:0];

  return v10;
}

- (id)presentationControllerForEditMenu
{
  v2 = [(WeekViewController *)self currentPresentationController];
  id v3 = [v2 presentedViewController];

  if (v3)
  {
    id v4 = [v2 presentedViewController];
  }
  else
  {
    id v4 = v2;
  }
  id v5 = v4;

  return v5;
}

- (id)selectedEventsForEditMenu
{
  v2 = [(WeekViewController *)self model];
  id v3 = [v2 selectedOccurrences];

  return v3;
}

- (void)weekGroupAllDaySectionDidScroll:(id)a3
{
  id v4 = a3;
  id v5 = v4;
  if (!self->_updatingAllDayContentOffset)
  {
    self->_updatingAllDayContentOffset = 1;
    uint64_t v6 = [v4 weekView];
    id v7 = [v6 allDayView];
    [v7 contentOffset];
    double v9 = v8;
    double v11 = v10;

    long long v22 = 0u;
    long long v23 = 0u;
    long long v20 = 0u;
    long long v21 = 0u;
    long long v12 = self->_visibleWeeks;
    id v13 = [(NSMutableArray *)v12 countByEnumeratingWithState:&v20 objects:v24 count:16];
    if (v13)
    {
      id v14 = v13;
      uint64_t v15 = *(void *)v21;
      do
      {
        NSComparisonResult v16 = 0;
        do
        {
          if (*(void *)v21 != v15) {
            objc_enumerationMutation(v12);
          }
          id v17 = *(void **)(*((void *)&v20 + 1) + 8 * (void)v16);
          if (v17 != v5)
          {
            long long v18 = [v17 weekView:v20];
            uint64_t v19 = [v18 allDayView];
            [v19 setContentOffset:v9, v11];
          }
          NSComparisonResult v16 = (char *)v16 + 1;
        }
        while (v14 != v16);
        id v14 = [(NSMutableArray *)v12 countByEnumeratingWithState:&v20 objects:v24 count:16];
      }
      while (v14);
    }

    self->_updatingAllDayContentOffset = 0;
  }
}

- (id)weekGroupForWeekBefore:(id)a3
{
  if ((char *)[(NSMutableArray *)self->_visibleWeeks indexOfObject:a3] - 1 > (char *)0x7FFFFFFFFFFFFFFDLL)
  {
    id v4 = 0;
  }
  else
  {
    id v4 = -[NSMutableArray objectAtIndex:](self->_visibleWeeks, "objectAtIndex:");
  }

  return v4;
}

- (id)weekGroupForWeekAfter:(id)a3
{
  id v4 = (char *)[(NSMutableArray *)self->_visibleWeeks indexOfObject:a3];
  if (v4 == (char *)0x7FFFFFFFFFFFFFFFLL
    || (id v5 = v4 + 1, v4 + 1 >= [(NSMutableArray *)self->_visibleWeeks count]))
  {
    uint64_t v6 = 0;
  }
  else
  {
    uint64_t v6 = [(NSMutableArray *)self->_visibleWeeks objectAtIndex:v5];
  }

  return v6;
}

- (void)weekGroup:(id)a3 didSelectEvent:(id)a4 userInitiated:(BOOL)a5 dateSelected:(id)a6
{
  BOOL v7 = a5;
  id v9 = a4;
  id v10 = a6;
  double v11 = [(WeekViewController *)self model];
  long long v12 = [v11 pasteboardManager];
  id v13 = [v9 startDate];
  [v12 setDateForPaste:v13];

  if (([(EKEventGestureController *)self->_eventGestureController dragGestureInProgress] & 1) == 0)
  {
    [(WeekViewController *)self _removeDateHighlight];
    id v14 = [(EKEventGestureController *)self->_eventGestureController event];

    if (v14)
    {
      uint64_t v15 = [(EKEventGestureController *)self->_eventGestureController event];
      NSComparisonResult v16 = [(EKEventGestureController *)self->_eventGestureController occurrenceDate];
      [(WeekViewController *)self undimOccurrence:v15 occurrenceDate:v16];

      [(EKEventGestureController *)self->_eventGestureController endForcedStart:0];
    }
    else if (v9)
    {
      if (v7)
      {
        id v17 = [(WeekViewController *)self presentedViewController];
        unsigned __int8 v18 = [v17 isBeingDismissed];

        if (v18)
        {
          uint64_t v19 = kCalUILogHandle;
          if (os_log_type_enabled((os_log_t)kCalUILogHandle, OS_LOG_TYPE_INFO))
          {
            *(_WORD *)long long v23 = 0;
            _os_log_impl((void *)&_mh_execute_header, v19, OS_LOG_TYPE_INFO, "Week view cannot present event details: presentation is currently dismissing", v23, 2u);
          }
        }
        else
        {
          if (v10)
          {
            CFStringRef v24 = @"Context_DateSelected";
            id v25 = v10;
            long long v22 = +[NSDictionary dictionaryWithObjects:&v25 forKeys:&v24 count:1];
          }
          else
          {
            long long v22 = 0;
          }
          [(WeekViewController *)self showEvent:v9 animated:1 showMode:1 context:v22];
        }
      }
      else
      {
        long long v20 = [(CUIKCalendarModel *)self->super._model selectedOccurrences];
        unsigned __int8 v21 = [v20 containsObject:v9];

        if ((v21 & 1) == 0) {
          [(CUIKCalendarModel *)self->super._model setSelectedOccurrence:v9];
        }
      }
    }
  }
}

- (void)weekGroup:(id)a3 didSelectEvents:(id)a4 userInitiated:(BOOL)a5
{
  BOOL v5 = a5;
  id v7 = a4;
  if (([(EKEventGestureController *)self->_eventGestureController dragGestureInProgress] & 1) == 0)
  {
    [(WeekViewController *)self _removeDateHighlight];
    double v8 = [(EKEventGestureController *)self->_eventGestureController event];

    if (v8)
    {
      id v9 = [(EKEventGestureController *)self->_eventGestureController event];
      id v10 = [(EKEventGestureController *)self->_eventGestureController occurrenceDate];
      [(WeekViewController *)self undimOccurrence:v9 occurrenceDate:v10];

      [(EKEventGestureController *)self->_eventGestureController endForcedStart:0];
    }
    else if (v7)
    {
      if (v5)
      {
        double v11 = [(WeekViewController *)self presentedViewController];
        unsigned __int8 v12 = [v11 isBeingDismissed];

        if (v12)
        {
          id v13 = kCalUILogHandle;
          if (os_log_type_enabled((os_log_t)kCalUILogHandle, OS_LOG_TYPE_INFO))
          {
            *(_WORD *)NSComparisonResult v16 = 0;
            _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_INFO, "Week view cannot present event details: presentation is currently dismissing", v16, 2u);
          }
        }
        else
        {
          [(WeekViewController *)self showEvents:v7 animated:1 showMode:1 context:0];
        }
      }
      else
      {
        id v14 = [(CUIKCalendarModel *)self->super._model selectedOccurrences];
        unsigned __int8 v15 = [v14 isEqualToArray:v7];

        if ((v15 & 1) == 0) {
          [(CUIKCalendarModel *)self->super._model setSelectedOccurrences:v7];
        }
      }
    }
  }
}

- (void)didEditEvent:(id)a3 creationMethod:(unint64_t)a4
{
  id v9 = a3;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  char v7 = objc_opt_respondsToSelector();

  if (v7)
  {
    id v8 = objc_loadWeakRetained((id *)&self->_delegate);
    [v8 weekViewController:self didEditEvent:v9 creationMethod:a4];
  }
}

- (void)synchronizeWeekGroupScrollingToWeek:(id)a3
{
  id v4 = a3;
  if ((unint64_t)[(NSMutableArray *)self->_visibleWeeks count] >= 2)
  {
    long long v23 = 0u;
    long long v24 = 0u;
    long long v21 = 0u;
    long long v22 = 0u;
    BOOL v5 = self->_visibleWeeks;
    id v6 = [(NSMutableArray *)v5 countByEnumeratingWithState:&v21 objects:v25 count:16];
    if (v6)
    {
      id v7 = v6;
      uint64_t v8 = *(void *)v22;
      do
      {
        id v9 = 0;
        do
        {
          if (*(void *)v22 != v8) {
            objc_enumerationMutation(v5);
          }
          id v10 = *(id *)(*((void *)&v21 + 1) + 8 * (void)v9);
          if (v10 != v4)
          {
            double v11 = [v10 weekView:v21];
            unsigned __int8 v12 = [v4 weekView];
            id v13 = [v12 scrollView];
            [v13 contentOffset];
            [v11 setScrollerContentOffset:];
          }
          id v9 = (char *)v9 + 1;
        }
        while (v7 != v9);
        id v7 = [(NSMutableArray *)v5 countByEnumeratingWithState:&v21 objects:v25 count:16];
      }
      while (v7);
    }
  }
  [(WeekViewController *)self updateVisibleRects];
  id v14 = [v4 weekView];
  unsigned __int8 v15 = [v14 scrollView];
  [v15 contentOffset];
  double v17 = v16;
  double v19 = v18;
  long long v20 = [(WeekTimeView *)self->_timeView scrollView];
  [v20 setContentOffset:v17, v19];
}

- (void)weekGroupViewDidLayout:(id)a3
{
  id v8 = a3;
  id v4 = [(EKEventGestureController *)self->_eventGestureController event];
  if (v4 && [(WeekViewController *)self _weekGroup:v8 containsOccurrence:v4])
  {
    BOOL v5 = [v4 eventIdentifier];
    if (v5)
    {

LABEL_6:
      eventGestureController = self->_eventGestureController;
      id v7 = [(EKEventGestureController *)eventGestureController occurrenceDate];
      [(EKEventGestureController *)eventGestureController forceStartWithOccurrence:v4 occurrenceDate:v7 shouldUpdateViewSource:1 shouldUpdateOrigin:1 shouldPresentEditMenu:0];

      goto LABEL_7;
    }
    if ([v4 isNew]) {
      goto LABEL_6;
    }
    [(EKEventGestureController *)self->_eventGestureController endForcedStart:0];
  }
LABEL_7:
}

- (void)weekGroupViewOccurrenceLayoutDidChange:(id)a3
{
}

- (BOOL)weekGroupViewShouldAnnotateAppEntities:(id)a3 onDayStarting:(id)a4
{
  id v6 = a4;
  if ([a3 isInUse])
  {
    id v7 = [v6 date];
    if ([v7 CalIsBeforeDate:self->_cachedEarliestDate]) {
      LOBYTE(v8) = 0;
    }
    else {
      unsigned int v8 = [v7 CalIsAfterDate:self->_cachedLatestDate] ^ 1;
    }
  }
  else
  {
    LOBYTE(v8) = 0;
  }

  return v8;
}

- (BOOL)_weekGroup:(id)a3 containsOccurrence:(id)a4
{
  id v5 = a3;
  id v6 = [a4 startDate];
  unsigned __int8 v7 = [v5 containsDate:v6];

  return v7;
}

- (void)_setReduceLayoutProcessingForAnimation:(BOOL)a3
{
  BOOL v3 = a3;
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  id v4 = self->_visibleWeeks;
  id v5 = [(NSMutableArray *)v4 countByEnumeratingWithState:&v11 objects:v15 count:16];
  if (v5)
  {
    id v6 = v5;
    uint64_t v7 = *(void *)v12;
    do
    {
      unsigned int v8 = 0;
      do
      {
        if (*(void *)v12 != v7) {
          objc_enumerationMutation(v4);
        }
        id v9 = [*(id *)(*((void *)&v11 + 1) + 8 * (void)v8) weekView:v11];
        id v10 = [v9 content];
        [v10 setReduceLayoutProcessingForAnimation:v3];

        unsigned int v8 = (char *)v8 + 1;
      }
      while (v6 != v8);
      id v6 = [(NSMutableArray *)v4 countByEnumeratingWithState:&v11 objects:v15 count:16];
    }
    while (v6);
  }
}

- (void)_setHourHeightScale:(double)a3
{
  [(WeekViewController *)self maximumHourScale];
  if (v5 <= a3) {
    a3 = v5;
  }
  [(WeekViewController *)self minimumHourScale];
  if (a3 >= v6) {
    double v6 = a3;
  }
  self->_double weekViewHourHeightScale = v6;
  uint64_t v7 = [(WeekViewController *)self view];
  +[EKDayTimeView defaultHeightForSizeClass:EKUIWidthSizeClassForViewHierarchy() orientation:[(WeekViewController *)self viewInterfaceOrientation]];
  double v9 = v8;
  double weekViewHourHeightScale = self->_weekViewHourHeightScale;

  [(WeekTimeView *)self->_timeView setHourHeightScale:self->_weekViewHourHeightScale];
  long long v43 = 0u;
  long long v44 = 0u;
  long long v41 = 0u;
  long long v42 = 0u;
  long long v11 = self->_visibleWeeks;
  id v12 = [(NSMutableArray *)v11 countByEnumeratingWithState:&v41 objects:v45 count:16];
  if (v12)
  {
    id v13 = v12;
    double v14 = v9 * weekViewHourHeightScale;
    uint64_t v15 = *(void *)v42;
    do
    {
      for (uint64_t i = 0; i != v13; uint64_t i = (char *)i + 1)
      {
        if (*(void *)v42 != v15) {
          objc_enumerationMutation(v11);
        }
        double v17 = *(void **)(*((void *)&v41 + 1) + 8 * i);
        [v17 setHourHeightScale:self->_weekViewHourHeightScale v41];
        double v18 = [v17 weekView];
        double v19 = [v18 scrollView];
        [v19 contentSize];
        double v21 = v20;

        long long v22 = [v17 weekView];
        long long v23 = [v22 scrollView];
        [v23 setContentSize:v21, v14];

        long long v24 = [v17 weekView];
        id v25 = [v24 content];
        [v25 frame];
        double v27 = v26;
        double v29 = v28;

        NSUInteger v30 = [v17 weekView];
        CGFloat v31 = [v30 content];
        [v31 bounds];
        double Width = CGRectGetWidth(v46);

        NSUInteger v33 = [v17 weekView];
        uint64_t v34 = [v33 content];
        [v34 setFrame:v27, v29, Width, v14];

        CGRect v35 = [v17 weekView];
        NSUInteger v36 = [v35 content];
        [v36 setNeedsLayout];
      }
      id v13 = [(NSMutableArray *)v11 countByEnumeratingWithState:&v41 objects:v45 count:16];
    }
    while (v13);
  }

  [(WeekViewController *)self _updateTimeMarker];
  CGRect v37 = [(WeekViewController *)self visibleWeeks];
  id v38 = [v37 count];

  if (v38)
  {
    NSUInteger v39 = [(WeekViewController *)self visibleWeeks];
    NSUInteger v40 = [v39 objectAtIndex:0];
    [(WeekViewController *)self synchronizeWeekGroupScrollingToWeek:v40];
  }
}

- (void)_weekScrollerDoubleTapped:(id)a3
{
  visibleWeeks = self->_visibleWeeks;
  id v5 = a3;
  id v44 = [(NSMutableArray *)visibleWeeks objectAtIndex:0];
  double v6 = [v44 weekView];
  uint64_t v7 = [v6 content];
  double v8 = [v7 grid];

  double v9 = [(WeekViewController *)self view];
  [v5 locationInView:v9];
  double v11 = v10;

  [v5 locationInView:v8];
  double v13 = v12;
  double v15 = v14;

  +[EKDayTimeView defaultHourScale];
  double v17 = v16 / self->_weekViewHourHeightScale;
  -[WeekViewController _setHourHeightScale:](self, "_setHourHeightScale:");
  double v18 = +[CUIKPreferences sharedPreferences];
  double weekViewHourHeightScale = self->_weekViewHourHeightScale;
  *(float *)&double weekViewHourHeightScale = weekViewHourHeightScale;
  double v20 = +[NSNumber numberWithFloat:weekViewHourHeightScale];
  [v18 setWeekViewHourScale:v20];

  double v21 = self->_weekViewHourHeightScale;
  long long v22 = [(CUIKCalendarModel *)self->super._model persistedSceneState];
  [v22 setWeekViewHourScale:v21];

  long long v23 = [(WeekViewController *)self view];
  [v23 convertPoint:v8 fromView:v13];
  double v25 = v24;

  double v26 = v25 - v11;
  double v27 = [v44 weekView];
  double v28 = [v27 scrollView];
  [v28 contentOffset];
  double v30 = v29;
  double v32 = v31;

  double v33 = v26 + v32;
  uint64_t v34 = [(WeekViewController *)self view];
  +[EKDayTimeView defaultHeightForSizeClass:EKUIWidthSizeClassForViewHierarchy() orientation:[(WeekViewController *)self viewInterfaceOrientation] withHourScale:self->_weekViewHourHeightScale];
  double v36 = v35;

  CGRect v37 = [v44 weekView];
  id v38 = [v37 scrollView];
  [v38 frame];
  double v40 = v36 - v39;

  double v41 = 0.0;
  if (v33 >= 0.0) {
    double v41 = v33;
  }
  if (v41 < v40) {
    double v40 = v41;
  }
  long long v42 = [v44 weekView];
  long long v43 = [v42 scrollView];
  [v43 setContentOffset:0 animated:v30];
}

- (double)minimumHourScale
{
  [(UIScrollView *)self->_weekScroller frame];
  double v4 = v3;
  id v5 = [(WeekViewController *)self view];
  +[EKDayTimeView defaultHeightForSizeClass:EKUIWidthSizeClassForViewHierarchy() orientation:[(WeekViewController *)self viewInterfaceOrientation]];
  double v7 = v6;

  return fmax(v4 / v7, 0.62);
}

- (double)maximumHourScale
{
  return 1.66;
}

- (void)_updateWeekViewContentHeight
{
  double v3 = [(WeekViewController *)self view];
  +[EKDayTimeView defaultHeightForSizeClass:EKUIWidthSizeClassForViewHierarchy() orientation:[(WeekViewController *)self viewInterfaceOrientation] withHourScale:self->_weekViewHourHeightScale];
  double v5 = v4;

  long long v31 = 0u;
  long long v32 = 0u;
  long long v29 = 0u;
  long long v30 = 0u;
  double v6 = self->_visibleWeeks;
  id v7 = [(NSMutableArray *)v6 countByEnumeratingWithState:&v29 objects:v33 count:16];
  if (v7)
  {
    id v8 = v7;
    uint64_t v9 = *(void *)v30;
    do
    {
      for (uint64_t i = 0; i != v8; uint64_t i = (char *)i + 1)
      {
        if (*(void *)v30 != v9) {
          objc_enumerationMutation(v6);
        }
        double v11 = *(void **)(*((void *)&v29 + 1) + 8 * i);
        [v11 setHourHeightScale:self->_weekViewHourHeightScale v29];
        double v12 = [v11 weekView];
        double v13 = [v12 scrollView];
        [v13 contentSize];
        double v15 = v14;

        double v16 = [v11 weekView];
        double v17 = [v16 scrollView];
        [v17 setContentSize:v15, v5];

        double v18 = [v11 weekView];
        double v19 = [v18 content];
        [v19 frame];
        double v21 = v20;
        double v23 = v22;

        double v24 = [v11 weekView];
        double v25 = [v24 content];
        [v25 bounds];
        double Width = CGRectGetWidth(v34);

        double v27 = [v11 weekView];
        double v28 = [v27 content];
        [v28 setFrame:v21, v23, Width, v5];
      }
      id v8 = [(NSMutableArray *)v6 countByEnumeratingWithState:&v29 objects:v33 count:16];
    }
    while (v8);
  }
}

- (void)_weekScrollerPinched:(id)a3
{
  id v72 = a3;
  double v4 = (char *)[v72 state];
  if ((unint64_t)(v4 - 3) <= 2)
  {
    double v5 = [(WeekViewController *)self visibleWeeks];
    double v6 = [v5 objectAtIndex:0];
    [(WeekViewController *)self synchronizeWeekGroupScrollingToWeek:v6];

    [(WeekViewController *)self _setReduceLayoutProcessingForAnimation:0];
    id v7 = +[CUIKPreferences sharedPreferences];
    double weekViewHourHeightScale = self->_weekViewHourHeightScale;
    *(float *)&double weekViewHourHeightScale = weekViewHourHeightScale;
    uint64_t v9 = +[NSNumber numberWithFloat:weekViewHourHeightScale];
    [v7 setWeekViewHourScale:v9];

    double v10 = self->_weekViewHourHeightScale;
    double v11 = [(CUIKCalendarModel *)self->super._model persistedSceneState];
    [v11 setWeekViewHourScale:v10];

    [(WeekViewController *)self reloadData];
    double v12 = [(WeekViewController *)self view];
    [v12 setNeedsLayout];
  }
  unint64_t v13 = (unint64_t)[v72 numberOfTouches];
  if ((v13 | 2) == 2)
  {
    unint64_t v14 = v13;
    double x = self->_lastPinchPoint1.x;
    double y = self->_lastPinchPoint1.y;
    if (v13)
    {
      double v17 = [(WeekViewController *)self view];
      [v72 locationOfTouch:0 inView:v17];
      self->_lastPinchPoint1.double x = v18;
      self->_lastPinchPoint1.double y = v19;
    }
    if (v4 == (char *)2)
    {
      if (v14)
      {
        pinchDistanceForGestureRecognizer();
        double v24 = self->_lastPinchDistance.y;
        double v25 = v23 / v24;
        double v26 = v22 - self->_lastPinchDistance.x;
        if (v26 < 0.0) {
          double v26 = -v26;
        }
        double v27 = v23 - v24;
        if (v27 < 0.0) {
          double v27 = -v27;
        }
        if (v26 <= v27) {
          double v28 = v25;
        }
        else {
          double v28 = 1.0;
        }
        self->_lastPinchDistance.double x = v22;
        self->_lastPinchDistance.double y = v23;
      }
      else
      {
        [v72 scale];
        double v28 = fabs(v30 / self->_lastPinchScale);
        self->_lastPinchScale = v30;
      }
      double v31 = v28 * self->_weekViewHourHeightScale;
      [(WeekViewController *)self minimumHourScale];
      BOOL v33 = v28 <= 1.0 && v31 < v32;
      if (v33 || ([(WeekViewController *)self maximumHourScale], v31 > v34))
      {
        [(WeekViewController *)self minimumHourScale];
        if (1.0 - v28 > 0.01 && v31 < v35) {
          goto LABEL_49;
        }
        [(WeekViewController *)self maximumHourScale];
        double v38 = v28 + -1.0;
        double v28 = 1.0;
        if (v38 > 0.01 && v31 > v37) {
          goto LABEL_49;
        }
      }
      else
      {
        self->_double weekViewHourHeightScale = v31;
      }
      double v40 = [(NSMutableArray *)self->_visibleWeeks objectAtIndex:0];
      double v41 = [v40 weekView];
      long long v42 = [v41 content];

      if (v14)
      {
        long long v43 = [(WeekViewController *)self view];
        [v42 convertPoint:v43 fromView:x, y];
        double v45 = v44;
        double v47 = v46;
      }
      else
      {
        [v72 locationInView:v42];
        double v45 = v48;
        double v47 = v49;
      }
      id v50 = [(WeekViewController *)self view];
      +[EKDayTimeView defaultHeightForSizeClass:EKUIWidthSizeClassForViewHierarchy() orientation:[(WeekViewController *)self viewInterfaceOrientation] withHourScale:self->_weekViewHourHeightScale];
      double v52 = v51;

      [(WeekTimeView *)self->_timeView setHourHeightScale:self->_weekViewHourHeightScale];
      [(WeekViewController *)self _updateWeekViewContentHeight];
      v53 = [v40 weekView];
      uint64_t v54 = [v53 scrollView];
      [v54 contentOffset];
      double v56 = v55;
      double v58 = v57;

      if (v14)
      {
        double v59 = [(WeekViewController *)self view];
        [v59 convertPoint:v42 fromView:v45];
        double v61 = v60;

        double v62 = v61 - self->_lastPinchPoint1.y;
      }
      else
      {
        [v72 locationInView:v42];
        double v62 = v28 * v47 - v63;
      }
      double v64 = v58 + v62;
      double v65 = [v40 weekView];
      uint64_t v66 = [v65 scrollView];
      [v66 frame];
      double v68 = v52 - v67;

      double v69 = 0.0;
      if (v64 >= 0.0) {
        double v69 = v64;
      }
      if (v69 >= v68) {
        double v70 = v68;
      }
      else {
        double v70 = v69;
      }
      BOOL v71 = [v40 weekView];
      [v71 setScrollerContentOffset:v56, v70];

      [(WeekViewController *)self _updateTimeMarker];
      [(EKEventGestureController *)self->_eventGestureController updateDraggingOccurrenceFrame];
    }
    else if (v4 == (char *)1)
    {
      if (v14)
      {
        pinchDistanceForGestureRecognizer();
        self->_lastPinchDistance.double x = v20;
        self->_lastPinchDistance.double y = v21;
      }
      else
      {
        [v72 scale];
        self->_lastPinchScale = v29;
      }
      [(WeekViewController *)self _setReduceLayoutProcessingForAnimation:1];
    }
  }
LABEL_49:
}

- (void)tappedOnDate:(id)a3
{
  id v4 = a3;
  id v7 = [(WeekViewController *)self model];
  double v5 = [v7 pasteboardManager];
  double v6 = [v4 date];

  [v5 setDateForPaste:v6];
}

- (void)adjustVisibleAllDayOccurrenceLabelsAnimated:(BOOL)a3
{
  BOOL v88 = a3;
  id v4 = [(WeekViewController *)self weekViewClass];
  int64_t v5 = [(WeekViewController *)self viewInterfaceOrientation];
  double v6 = [(WeekViewController *)self view];
  [(objc_class *)v4 dayWidthForOrientation:v5 withViewInViewHierarchy:v6];
  double v93 = v7;

  [(WeekTimeView *)self->_timeView bounds];
  CalRoundToScreenScale();
  double v87 = v8;
  long long v97 = 0u;
  long long v98 = 0u;
  long long v99 = 0u;
  long long v100 = 0u;
  id obj = self->_visibleWeeks;
  id v82 = [(NSMutableArray *)obj countByEnumeratingWithState:&v97 objects:v102 count:16];
  if (v82)
  {
    uint64_t v9 = 0;
    uint64_t v81 = *(void *)v98;
    do
    {
      uint64_t v10 = 0;
      do
      {
        if (*(void *)v98 != v81) {
          objc_enumerationMutation(obj);
        }
        double v11 = *(void **)(*((void *)&v97 + 1) + 8 * v10);
        double v12 = [v11 weekView];
        unint64_t v13 = [v12 allDayView];

        [(UIScrollView *)self->_weekScroller bounds];
        [v13 convertRect:self->_weekScroller fromView:];
        CGFloat v91 = v15;
        CGFloat v92 = v14;
        CGFloat v89 = v17;
        CGFloat v90 = v16;
        CGFloat v18 = [(WeekViewController *)self model];
        CGFloat v19 = [v18 calendar];
        CGFloat v20 = [v11 weekStartDate];
        CGFloat v21 = [v19 dateFromComponents:v20];

        uint64_t v84 = v10;
        uint64_t v85 = v9;
        if (v9 < 1)
        {
          double width = -1.0;
        }
        else
        {
          double v22 = [(NSMutableArray *)self->_visibleWeeks objectAtIndex:v9 - 1];
          double v23 = [(WeekViewController *)self view];
          [v22 frame];
          double v25 = v24;
          double v27 = v26;
          double v29 = v28;
          double v31 = v30;
          double v32 = [v22 superview];
          [v23 convertRect:v32 fromView:v25, v27, v29, v31];
          CGFloat v34 = v33;
          CGFloat v36 = v35;
          CGFloat v38 = v37;
          CGFloat v40 = v39;

          double v41 = [(WeekViewController *)self view];
          [(UIScrollView *)self->_weekScroller bounds];
          [v41 convertRect:self->_weekScroller fromView:];
          CGFloat v43 = v42;
          CGFloat v45 = v44;
          CGFloat v47 = v46;
          CGFloat v49 = v48;

          v103.origin.double x = v34;
          v103.origin.double y = v36;
          v103.size.double width = v38;
          v103.size.double height = v40;
          v107.origin.double x = v43;
          v107.origin.double y = v45;
          v107.size.double width = v47;
          v107.size.double height = v49;
          CGRect v104 = CGRectIntersection(v103, v107);
          double width = v104.size.width;
        }
        long long v95 = 0u;
        long long v96 = 0u;
        memset(&rect1[1], 0, 32);
        v83 = v13;
        id v50 = [v13 occurrenceViews];
        id v51 = [v50 countByEnumeratingWithState:&rect1[1] objects:v101 count:16];
        if (v51)
        {
          id v52 = v51;
          uint64_t v53 = *(void *)rect1[3];
          do
          {
            for (uint64_t i = 0; i != v52; uint64_t i = (char *)i + 1)
            {
              if (*(void *)rect1[3] != v53) {
                objc_enumerationMutation(v50);
              }
              double v55 = *(void **)(rect1[2] + 8 * i);
              [v55 frame];
              CGFloat v57 = v56;
              CGFloat v59 = v58;
              CGFloat v61 = v60;
              CGFloat v63 = v62;
              [v55 frame];
              CGFloat v65 = v64;
              CGFloat v67 = v66;
              CGFloat v69 = v68;
              CGFloat v71 = v70;
              id v72 = [v55 occurrence];
              unint64_t v73 = [v72 startDate];
              id v74 = [v73 compare:v21];

              if (v74 != (id)-1) {
                goto LABEL_18;
              }
              if (width >= v93)
              {
                [v55 setHideText:1 v93, width];
LABEL_18:
                unsigned int v75 = 0;
                goto LABEL_19;
              }
              unsigned int v75 = [v55 hideText:v93 width:width];
LABEL_19:
              v105.origin.double x = v65;
              v105.origin.double y = v67;
              v105.size.double width = v69;
              v105.size.double height = v71;
              v108.origin.double x = v92;
              v108.origin.double y = v91;
              v108.size.double width = v90;
              v108.size.double height = v89;
              CGRect v106 = CGRectIntersection(v105, v108);
              double v76 = v106.size.width;
              v106.origin.double x = v57;
              v106.origin.double y = v59;
              v106.size.double width = v61;
              v106.size.double height = v63;
              v109.origin.double x = v92;
              v109.origin.double y = v91;
              v109.size.double width = v90;
              v109.size.double height = v89;
              if (!CGRectIntersectsRect(v106, v109) && v76 >= v93)
              {
                double v77 = [(WeekViewController *)self view];
                [v55 convertPoint:v77 fromView:v87];
                double v79 = v78;

                [v55 fadeInContentViewAt:v88 minWidth:v79 animated:v93];
              }
              if (v75) {
                [v55 setHideText:0 animate:0];
              }
            }
            id v52 = [v50 countByEnumeratingWithState:&rect1[1] objects:v101 count:16];
          }
          while (v52);
        }
        uint64_t v9 = v85 + 1;

        uint64_t v10 = v84 + 1;
      }
      while ((id)(v84 + 1) != v82);
      id v82 = [(NSMutableArray *)obj countByEnumeratingWithState:&v97 objects:v102 count:16];
    }
    while (v82);
  }
}

- (unint64_t)daysInWeek
{
  return 7;
}

- (double)_xOffsetForDate:(id)a3
{
  id v4 = a3;
  [(WeekViewController *)self loadViewIfNeeded];
  double weekWidth = self->_weekWidth;
  double v6 = [(WeekViewController *)self weekViewClass];
  int64_t v7 = [(WeekViewController *)self viewInterfaceOrientation];
  double v8 = [(MainViewController *)self window];
  [(objc_class *)v6 dayWidthForOrientation:v7 withViewInViewHierarchy:v8];
  double v10 = v9;

  double v11 = [v4 calendarDateForDay];
  double v12 = [(EKCalendarDate *)self->_referenceWeekStart calendarDateForDay];
  uint64_t v13 = (uint64_t)[v11 differenceInDays:v12];
  uint64_t v14 = v13;
  if (v13 >= 0) {
    unint64_t v15 = v13;
  }
  else {
    unint64_t v15 = -v13;
  }
  double v16 = self->_weekWidth;
  if (v15 % [(WeekViewController *)self daysInWeek])
  {
    unint64_t v17 = [(WeekViewController *)self daysInWeek];
    double v18 = 0.0;
    while (v15 > v17)
    {
      double v18 = v16 + v18;
      v15 -= [(WeekViewController *)self daysInWeek];
      unint64_t v17 = [(WeekViewController *)self daysInWeek];
    }
    double v19 = v18 + (double)v15 * v10;
    if (v14 >= 1)
    {
      CalOnePixelInPoints();
      double v19 = v19 + v20;
    }
  }
  else
  {
    double v19 = v16 * ((double)v15 / (double)[(WeekViewController *)self daysInWeek]) + 0.0;
  }
  if (v14 <= 0) {
    double v19 = -v19;
  }
  if ((CalTimeDirectionIsLeftToRight() & 1) == 0)
  {
    double v19 = -v19;
    if ((id)[(WeekViewController *)self daysInWeek] == (id)7)
    {
      [(UIScrollView *)self->_weekScroller adjustedContentInset];
      double v19 = v19 - v21;
    }
    double v22 = [(WeekViewController *)self weekViewClass];
    int64_t v23 = [(WeekViewController *)self viewInterfaceOrientation];
    double v24 = [(WeekViewController *)self view];
    double v25 = [(objc_class *)v22 displayedDaysForOrientation:v23 withViewInViewHierarchy:v24];

    if (v25 != (unsigned char *)[(WeekViewController *)self daysInWeek]) {
      double v19 = v19 + (double)(unint64_t)((unsigned char *)[(WeekViewController *)self daysInWeek] - v25) * v10;
    }
  }

  return weekWidth * 27040.0 + v19;
}

- (double)currentScrollViewXOffset
{
  [(UIScrollView *)self->_weekScroller contentOffset];
  return result;
}

- (double)scrollToDisplayedDateAnimated:(BOOL)a3
{
  BOOL v3 = a3;
  unsigned int v5 = [(WeekViewController *)self displaysDatesSnappedToWeekBoundaries];
  double v6 = self->_displayedDate;
  int64_t v7 = v6;
  if (self->_weekViewStartsOnToday) {
    goto LABEL_2;
  }
  if (!v5)
  {
    double v8 = [(EKCalendarDate *)v6 calendarDateByAddingDays:-(uint64_t)[(WeekViewController *)self daysFromFirstToMiddleDay]];

    goto LABEL_8;
  }
  id v9 = [(EKCalendarDate *)v6 dayOfWeek];
  if (v9 == (id)CUIKOneIndexedWeekStart())
  {
LABEL_2:
    double v8 = v7;
  }
  else
  {
    do
    {
      double v8 = [(EKCalendarDate *)v7 calendarDateByAddingDays:-1];

      id v10 = [v8 dayOfWeek];
      int64_t v7 = (EKCalendarDate *)v8;
    }
    while (v10 != (id)CUIKOneIndexedWeekStart());
  }
LABEL_8:
  [(WeekViewController *)self _xOffsetForDate:v8];
  double v12 = v11;
  -[UIScrollView setContentOffset:animated:](self->_weekScroller, "setContentOffset:animated:", v3);
  if (!v3 && self->_viewIsVisible) {
    [(WeekViewController *)self scrollViewDidEndScrollingAnimation:self->_weekScroller];
  }

  return v12;
}

- (void)scrollEventIntoView:(id)a3 animated:(BOOL)a4 completion:(id)a5
{
}

- (void)scrollEventIntoView:(id)a3 animateWithDuration:(double)a4 completion:(id)a5
{
}

- (void)_scrollEventIntoView:(id)a3 animated:(BOOL)a4 durationOverride:(double)a5 completion:(id)a6
{
  uint64_t v8 = a4;
  id v10 = a3;
  v23[0] = _NSConcreteStackBlock;
  v23[1] = 3221225472;
  v23[2] = sub_10008A228;
  v23[3] = &unk_1001D29F0;
  id v11 = a6;
  id v24 = v11;
  double v12 = objc_retainBlock(v23);
  uint64_t v13 = (void (**)(void, void))v12;
  if (v10)
  {
    uint64_t v14 = [(WeekViewController *)self _weekGroupForEvent:v10 occurrenceDate:0];
    if (!v14)
    {
      [v10 startDate];
      unint64_t v15 = v22 = v8;
      double v16 = [(WeekViewController *)self model];
      unint64_t v17 = [v16 eventStore];
      double v18 = [v17 timeZone];
      double v19 = +[EKCalendarDate calendarDateWithDate:v15 timeZone:v18];

      uint64_t v8 = v22;
      [(WeekViewController *)self setDisplayedDate:v19 animated:v22];
      uint64_t v14 = [(WeekViewController *)self _weekGroupForEvent:v10 occurrenceDate:0];
    }
    if (([v10 isAllDay] & 1) != 0 || !v14)
    {
      v13[2](v13, 0);
    }
    else
    {
      double v20 = [v14 weekView];
      double v21 = v20;
      if (a5 > 0.0 && v8) {
        [v20 scrollToEvent:v10 animateWithDuration:v11 completion:a5];
      }
      else {
        [v20 scrollToEvent:v10 animated:v8 completion:v11];
      }
    }
  }
  else
  {
    ((void (*)(void *, void))v12[2])(v12, 0);
  }
}

- (void)scrollToCurrentTimeOfDayAnimated:(BOOL)a3
{
  BOOL v3 = a3;
  CUIKNowComponents();
  id v5 = (id)objc_claimAutoreleasedReturnValue();
  [self _scrollToSecond:[v5 second]+ 3600 * [v5 hour]+ 60 * [v5 minute] animated:v3 completion:0];
}

- (void)_scrollToSecond:(int64_t)a3 animated:(BOOL)a4 completion:(id)a5
{
  BOOL v5 = a4;
  id v8 = a5;
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  id v9 = self->_visibleWeeks;
  id v10 = [(NSMutableArray *)v9 countByEnumeratingWithState:&v15 objects:v19 count:16];
  if (v10)
  {
    id v11 = v10;
    uint64_t v12 = *(void *)v16;
    do
    {
      uint64_t v13 = 0;
      do
      {
        if (*(void *)v16 != v12) {
          objc_enumerationMutation(v9);
        }
        uint64_t v14 = [*(id *)(*((void *)&v15 + 1) + 8 * (void)v13) weekView:(void)v15];
        [v14 scrollToSecond:a3 animated:v5 completion:v8];

        uint64_t v13 = (char *)v13 + 1;
      }
      while (v11 != v13);
      id v11 = [(NSMutableArray *)v9 countByEnumeratingWithState:&v15 objects:v19 count:16];
    }
    while (v11);
  }
}

- (unint64_t)daysFromFirstToMiddleDay
{
  BOOL v3 = [(WeekViewController *)self weekViewClass];
  int64_t v4 = [(WeekViewController *)self viewInterfaceOrientation];
  BOOL v5 = [(WeekViewController *)self view];
  unint64_t v6 = vcvtmd_u64_f64((double)(unint64_t)[(objc_class *)v3 displayedDaysForOrientation:v4 withViewInViewHierarchy:v5]/ 2.001);

  return v6;
}

- (id)firstDisplayedDate
{
  uint64_t v3 = -(uint64_t)[(WeekViewController *)self daysFromFirstToMiddleDay];
  displayedDate = self->_displayedDate;

  return [(EKCalendarDate *)displayedDate calendarDateByAddingDays:v3];
}

- (void)updateWeekNumber
{
  if (self->_showWeekNumber)
  {
    id v9 = [(EKCalendarDate *)self->_displayedDate date];
    uint64_t v3 = CUIKCalendar();
    id v4 = [v3 component:0x2000 fromDate:v9];

    if (v4 != self->_currentlyDisplayedWeekNumber)
    {
      BOOL v5 = +[NSBundle bundleForClass:objc_opt_class()];
      unint64_t v6 = [v5 localizedStringForKey:@"W%@" value:&stru_1001D6918 table:0];
      int64_t v7 = CUIKLocalizedStringForInteger();
      id v8 = +[NSString localizedStringWithFormat:](NSString, "localizedStringWithFormat:", v6, v7);

      [(WeekTimeView *)self->_timeView setWeekNumberText:v8];
      self->_currentlyDisplayedWeekNumber = (int64_t)v4;
    }
  }
}

- (void)setDisplayedDate:(id)a3 animated:(BOOL)a4
{
}

- (void)setDisplayedDate:(id)a3 forceScroll:(BOOL)a4 animated:(BOOL)a5
{
  BOOL v5 = a5;
  id v8 = a3;
  id v14 = v8;
  if (!self->_referenceWeekStart)
  {
    if ((id)[(WeekViewController *)self daysInWeek] == (id)2)
    {
      id v9 = (EKCalendarDate *)v14;
    }
    else
    {
      id v9 = [v14 calendarDateForWeekWithWeekStart:CUIKOneIndexedWeekStart()];
    }
    referenceWeekStart = self->_referenceWeekStart;
    self->_referenceWeekStart = v9;

    id v8 = v14;
  }
  id v11 = (EKCalendarDate *)[v8 copy];
  displayedDate = self->_displayedDate;
  self->_displayedDate = v11;

  [(WeekViewController *)self updateWeekNumber];
  uint64_t v13 = [v14 date];
  if (![(WeekViewController *)self dateIsVisible:v13] || self->_weekViewStartsOnToday)
  {

LABEL_9:
    [(WeekViewController *)self scrollToDisplayedDateAnimated:v5];
    goto LABEL_10;
  }

  if (a4) {
    goto LABEL_9;
  }
LABEL_10:
  [(WeekViewController *)self updateBannerDateStrings:v14];
  [(WeekViewController *)self updatePreferredReloadRange];
}

- (void)updateBackButtonTitle
{
}

- (void)setDisplayedDate:(id)a3
{
}

- (void)updateDisplayedDateForCurrentScrollOffset
{
  uint64_t v3 = [(WeekViewController *)self centerDateComponents];
  if (v3)
  {
    id v10 = v3;
    id v4 = [(WeekViewController *)self model];
    BOOL v5 = [v4 calendar];
    unint64_t v6 = [v5 timeZone];
    int64_t v7 = +[EKCalendarDate calendarDateWithDateComponents:v10 timeZone:v6];

    p_displayedDate = &self->_displayedDate;
    if (![(EKCalendarDate *)self->_displayedDate isEqual:v7]
      || (!*p_displayedDate ? (BOOL v9 = v7 == 0) : (BOOL v9 = 1), !v9))
    {
      objc_storeStrong((id *)&self->_displayedDate, v7);
      [(WeekViewController *)self displayedDateChanged:*p_displayedDate userInitiated:[(WeekViewController *)self userInitiatedScroll]];
    }

    uint64_t v3 = v10;
  }
}

- (void)displayedDateChanged:(id)a3 userInitiated:(BOOL)a4
{
  id v5 = a3;
  [(WeekViewController *)self updateWeekNumber];
  [(WeekViewController *)self updateBannerDateStrings:v5];

  [(WeekViewController *)self updateBackButtonTitle];
}

- (id)_earliestWeekGroup
{
  id v3 = [(NSMutableArray *)self->_visibleWeeks count];
  if (v3)
  {
    char IsLeftToRight = CalTimeDirectionIsLeftToRight();
    visibleWeeks = self->_visibleWeeks;
    if (IsLeftToRight) {
      [(NSMutableArray *)visibleWeeks firstObject];
    }
    else {
    id v3 = [(NSMutableArray *)visibleWeeks lastObject];
    }
  }

  return v3;
}

- (id)_latestWeekGroup
{
  id v3 = [(NSMutableArray *)self->_visibleWeeks count];
  if (v3)
  {
    char IsLeftToRight = CalTimeDirectionIsLeftToRight();
    visibleWeeks = self->_visibleWeeks;
    if (IsLeftToRight) {
      [(NSMutableArray *)visibleWeeks lastObject];
    }
    else {
    id v3 = [(NSMutableArray *)visibleWeeks firstObject];
    }
  }

  return v3;
}

- (id)_weekGroupForPoint:(CGPoint)a3
{
  CGFloat y = a3.y;
  CGFloat x = a3.x;
  uint64_t v26 = 0;
  double v27 = &v26;
  uint64_t v28 = 0x3032000000;
  double v29 = sub_10008AB54;
  double v30 = sub_10008AB64;
  id v31 = 0;
  uint64_t v22 = 0;
  int64_t v23 = &v22;
  uint64_t v24 = 0x2020000000;
  uint64_t v25 = 0;
  BOOL v6 = CalTimeDirectionIsLeftToRight() == 0;
  visibleWeeks = self->_visibleWeeks;
  id v14 = _NSConcreteStackBlock;
  uint64_t v15 = 3221225472;
  long long v16 = sub_10008AB6C;
  long long v17 = &unk_1001D3970;
  if (v6) {
    uint64_t v8 = 2;
  }
  else {
    uint64_t v8 = 0;
  }
  CGFloat v20 = x;
  CGFloat v21 = y;
  long long v18 = &v22;
  double v19 = &v26;
  [(NSMutableArray *)visibleWeeks enumerateObjectsWithOptions:v8 usingBlock:&v14];
  BOOL v9 = (void *)v27[5];
  if (!v9)
  {
    id v10 = -[WeekViewController _createPreparedViewForWeek:](self, "_createPreparedViewForWeek:", v23[3], v14, v15, v16, v17);
    id v11 = (void *)v27[5];
    v27[5] = (uint64_t)v10;

    [(NSMutableArray *)self->_reusableViews addObject:v27[5]];
    BOOL v9 = (void *)v27[5];
  }
  id v12 = v9;
  _Block_object_dispose(&v22, 8);
  _Block_object_dispose(&v26, 8);

  return v12;
}

- (id)dateAtPoint:(CGPoint)a3 isAllDay:(BOOL *)a4 requireAllDayRegionInsistence:(BOOL)a5
{
  BOOL v5 = a5;
  double y = a3.y;
  double x = a3.x;
  id v10 = -[WeekViewController _weekGroupForPoint:](self, "_weekGroupForPoint:");
  -[UIScrollView convertPoint:toView:](self->_weekScroller, "convertPoint:toView:", v10, x, y);
  id v11 = [v10 dateAtPoint:a4 isAllDay:v5];

  return v11;
}

- (id)dateAtPoint:(CGPoint)a3 isAllDay:(BOOL *)a4
{
  return -[WeekViewController dateAtPoint:isAllDay:requireAllDayRegionInsistence:](self, "dateAtPoint:isAllDay:requireAllDayRegionInsistence:", a4, 1, a3.x, a3.y);
}

- (id)dayDateAtPoint:(CGPoint)a3
{
  CGFloat v4 = a3.x + self->_weekWidth * -27040.0;
  [(WeekViewController *)self weekWidth];
  unint64_t v6 = llround(v4 / v5 * (double)[(WeekViewController *)self daysInWeek]);
  if (!CalTimeDirectionIsLeftToRight()) {
    unint64_t v6 = -(uint64_t)v6;
  }
  if ((CalTimeDirectionIsLeftToRight() & 1) == 0)
  {
    int64_t v7 = [(WeekViewController *)self weekViewClass];
    int64_t v8 = [(WeekViewController *)self viewInterfaceOrientation];
    BOOL v9 = [(WeekViewController *)self view];
    id v10 = [(objc_class *)v7 displayedDaysForOrientation:v8 withViewInViewHierarchy:v9];
    unint64_t v11 = [(WeekViewController *)self daysInWeek];

    if (v10 != (id)v11)
    {
      unint64_t v12 = [(WeekViewController *)self daysInWeek];
      uint64_t v13 = [(WeekViewController *)self weekViewClass];
      int64_t v14 = [(WeekViewController *)self viewInterfaceOrientation];
      uint64_t v15 = [(WeekViewController *)self view];
      v6 += v12
          + ~(unint64_t)[(objc_class *)v13 displayedDaysForOrientation:v14 withViewInViewHierarchy:v15];
    }
  }
  referenceWeekStart = self->_referenceWeekStart;

  return [(EKCalendarDate *)referenceWeekStart calendarDateByAddingDays:v6];
}

- (CGPoint)pointAtDate:(double)a3 isAllDay:(BOOL)a4
{
  BOOL v4 = a4;
  unint64_t v6 = +[NSDate dateWithTimeIntervalSinceReferenceDate:a3];
  long long v19 = 0u;
  long long v20 = 0u;
  long long v21 = 0u;
  long long v22 = 0u;
  int64_t v7 = self->_visibleWeeks;
  id v8 = [(NSMutableArray *)v7 countByEnumeratingWithState:&v19 objects:v23 count:16];
  if (v8)
  {
    id v9 = v8;
    uint64_t v10 = *(void *)v20;
    while (2)
    {
      for (uint64_t i = 0; i != v9; uint64_t i = (char *)i + 1)
      {
        if (*(void *)v20 != v10) {
          objc_enumerationMutation(v7);
        }
        unint64_t v12 = *(void **)(*((void *)&v19 + 1) + 8 * i);
        if (objc_msgSend(v12, "containsDate:", v6, (void)v19))
        {
          [v12 pointAtDate:v6 isAllDay:v4];
          [v12 convertPoint:self->_weekScroller toView:];
          CGFloat x = v15;
          CGFloat y = v16;

          goto LABEL_11;
        }
      }
      id v9 = [(NSMutableArray *)v7 countByEnumeratingWithState:&v19 objects:v23 count:16];
      if (v9) {
        continue;
      }
      break;
    }
  }

  CGFloat x = CGPointZero.x;
  CGFloat y = CGPointZero.y;
LABEL_11:

  double v17 = x;
  double v18 = y;
  result.CGFloat y = v18;
  result.CGFloat x = v17;
  return result;
}

- (id)_weekGroupForEvent:(id)a3 occurrenceDate:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if (v6)
  {
    long long v17 = 0u;
    long long v18 = 0u;
    long long v15 = 0u;
    long long v16 = 0u;
    id v8 = self->_visibleWeeks;
    id v9 = [(NSMutableArray *)v8 countByEnumeratingWithState:&v15 objects:v19 count:16];
    if (v9)
    {
      uint64_t v10 = *(void *)v16;
      while (2)
      {
        for (uint64_t i = 0; i != v9; uint64_t i = (char *)i + 1)
        {
          if (*(void *)v16 != v10) {
            objc_enumerationMutation(v8);
          }
          unint64_t v12 = *(void **)(*((void *)&v15 + 1) + 8 * i);
          uint64_t v13 = [v12 occurrenceViewForEvent:v6 occurrenceDate:v7];

          if (v13)
          {
            id v9 = v12;
            goto LABEL_12;
          }
        }
        id v9 = [(NSMutableArray *)v8 countByEnumeratingWithState:&v15 objects:v19 count:16];
        if (v9) {
          continue;
        }
        break;
      }
    }
LABEL_12:
  }
  else
  {
    id v9 = 0;
  }

  return v9;
}

- (id)occurrenceViewAtPoint:(CGPoint)a3 ignoreSelectedCopyView:(BOOL)a4
{
  BOOL v4 = a4;
  double y = a3.y;
  double x = a3.x;
  id v8 = -[WeekViewController _weekGroupForPoint:](self, "_weekGroupForPoint:");
  -[UIScrollView convertPoint:toView:](self->_weekScroller, "convertPoint:toView:", v8, x, y);
  id v9 = [v8 occurrenceViewAtPoint:v4];

  return v9;
}

- (void)editorDidDeleteEvent:(id)a3
{
  eventGestureController = self->_eventGestureController;
  id v5 = a3;
  id v6 = [(EKEventGestureController *)eventGestureController occurrenceDate];
  [(WeekViewController *)self undimOccurrence:v5 occurrenceDate:v6];

  id v7 = self->_eventGestureController;

  [(EKEventGestureController *)v7 endForcedStart:0];
}

- (void)editorDidCancelEditingEvent:(id)a3
{
  eventGestureController = self->_eventGestureController;
  id v5 = a3;
  id v6 = [(EKEventGestureController *)eventGestureController occurrenceDate];
  [(WeekViewController *)self undimOccurrence:v5 occurrenceDate:v6];

  id v7 = self->_eventGestureController;

  [(EKEventGestureController *)v7 endForcedStart:0];
}

- (void)eventGestureController:(id)a3 addViewToScroller:(id)a4 isAllDay:(BOOL)a5
{
  BOOL v5 = a5;
  unint64_t v12 = (UIScrollView *)a4;
  id v7 = [(UIScrollView *)v12 superview];
  weekScroller = v12;
  if (!v7) {
    weekScroller = self->_weekScroller;
  }
  id v9 = [(UIScrollView *)weekScroller superview];

  [(UIScrollView *)v12 frame];
  double MidX = CGRectGetMidX(v14);
  [(UIScrollView *)v12 frame];
  [v9 convertPoint:MidX toView:self->_weekScroller];
  unint64_t v11 = -[WeekViewController _weekGroupForPoint:](self, "_weekGroupForPoint:");
  [v11 addViewToScroller:v12 isAllDay:v5];
}

- (BOOL)hasCorrectParentForDraggingView:(id)a3 isAllDay:(BOOL)a4
{
  uint64_t v4 = a4;
  weekScroller = self->_weekScroller;
  id v7 = a3;
  id v8 = [(UIScrollView *)weekScroller superview];
  [v7 frame];
  [v8 convertPoint:self->_weekScroller toView:];
  double v10 = v9;
  double v12 = v11;

  uint64_t v13 = -[WeekViewController _weekGroupForPoint:](self, "_weekGroupForPoint:", v10, v12);
  LOBYTE(v4) = [v13 scrollerIsParentOfView:v7 isAllDay:v4];

  return v4;
}

- (void)highlightDayViewCalendarDate:(id)a3 isAllDay:(BOOL)a4
{
  BOOL v4 = a4;
  id v6 = a3;
  id v7 = v6;
  if (v4)
  {
    id v8 = [(WeekTimeView *)self->_timeView timeView];
    [v8 setHighlightedHour:-1.0];

    [(WeekTimeView *)self->_timeView setAllDayHighlighted:1];
    long long v31 = 0u;
    long long v32 = 0u;
    long long v29 = 0u;
    long long v30 = 0u;
    double v9 = self->_visibleWeeks;
    id v10 = [(NSMutableArray *)v9 countByEnumeratingWithState:&v29 objects:v34 count:16];
    if (v10)
    {
      id v11 = v10;
      uint64_t v12 = *(void *)v30;
      do
      {
        for (uint64_t i = 0; i != v11; uint64_t i = (char *)i + 1)
        {
          if (*(void *)v30 != v12) {
            objc_enumerationMutation(v9);
          }
          [*(id *)(*((void *)&v29 + 1) + 8 * i) setHighlightedDateComponents:0];
        }
        id v11 = [(NSMutableArray *)v9 countByEnumeratingWithState:&v29 objects:v34 count:16];
      }
      while (v11);
    }
  }
  else
  {
    id v14 = [v6 hour];
    double v15 = (double)((uint64_t)[v7 minute] + 60 * (void)v14) / 60.0;
    long long v16 = [(WeekTimeView *)self->_timeView timeView];
    [v16 setHighlightedHour:v15];

    [(WeekTimeView *)self->_timeView setAllDayHighlighted:0];
    long long v27 = 0u;
    long long v28 = 0u;
    long long v25 = 0u;
    long long v26 = 0u;
    double v9 = self->_visibleWeeks;
    id v17 = [(NSMutableArray *)v9 countByEnumeratingWithState:&v25 objects:v33 count:16];
    if (v17)
    {
      id v18 = v17;
      uint64_t v19 = *(void *)v26;
      do
      {
        for (j = 0; j != v18; j = (char *)j + 1)
        {
          if (*(void *)v26 != v19) {
            objc_enumerationMutation(v9);
          }
          long long v21 = *(void **)(*((void *)&v25 + 1) + 8 * (void)j);
          long long v22 = [v7 date:v25];
          unsigned int v23 = [v21 containsDate:v22];

          if (v23)
          {
            uint64_t v24 = [v7 allComponents];
            [v21 setHighlightedDateComponents:v24];
          }
          else
          {
            [v21 setHighlightedDateComponents:0];
          }
        }
        id v18 = [(NSMutableArray *)v9 countByEnumeratingWithState:&v25 objects:v33 count:16];
      }
      while (v18);
    }
  }
}

- (void)_highlightEvent:(id)a3 dayViewDate:(double)a4 isAllDay:(BOOL)a5
{
  BOOL v5 = a5;
  id v7 = a3;
  id v12 = +[NSTimeZone defaultTimeZone];
  id v8 = [(WeekViewController *)self eventGestureController];
  [v8 currentDragSnappingType];

  CalSnapDateTo15MinuteOr5MinuteInterval();
  double v10 = v9;

  id v11 = +[EKCalendarDate calendarDateWithAbsoluteTime:v12 timeZone:v10];
  [(WeekViewController *)self highlightDayViewCalendarDate:v11 isAllDay:v5];
}

- (void)_removeDateHighlight
{
  id v3 = +[EKCalendarDate calendarDateWithAbsoluteTime:0 timeZone:0.0];
  [(WeekViewController *)self highlightDayViewCalendarDate:v3 isAllDay:0];
}

- (void)dimOccurrence:(id)a3 occurrenceDate:(id)a4
{
  id v6 = a3;
  id v9 = [(WeekViewController *)self _weekGroupForEvent:v6 occurrenceDate:a4];
  id v7 = [v9 weekView];
  id v8 = [v7 content];
  [v8 setDimmedOccurrence:v6];
}

- (void)undimOccurrence:(id)a3 occurrenceDate:(id)a4
{
  id v6 = [(WeekViewController *)self _weekGroupForEvent:a3 occurrenceDate:a4];
  BOOL v4 = [v6 weekView];
  BOOL v5 = [v4 content];
  [v5 setDimmedOccurrence:0];
}

- (id)touchTrackingViewForEventGestureController:(id)a3
{
  return self->_weekScroller;
}

- (id)occurrenceViewSuperviewForEventGestureController:(id)a3
{
  return [(UIScrollView *)self->_weekScroller superview];
}

- (double)eventGestureController:(id)a3 convertXForMargin:(double)a4
{
  weekScroller = self->_weekScroller;
  id v6 = [(UIScrollView *)weekScroller superview];
  -[UIScrollView convertPoint:toView:](weekScroller, "convertPoint:toView:", v6, a4, 0.0);
  double v8 = v7;

  return v8;
}

- (CGRect)marginFrameForEventGestureController:(id)a3
{
  id v3 = [(UIScrollView *)self->_weekScroller superview];
  [v3 frame];
  double v5 = v4;
  double v7 = v6;
  double v9 = v8;
  double v11 = v10;

  double v12 = v5;
  double v13 = v7;
  double v14 = v9;
  double v15 = v11;
  result.size.double height = v15;
  result.size.double width = v14;
  result.origin.double y = v13;
  result.origin.double x = v12;
  return result;
}

- (double)timedRegionOriginForEventGestureController:(id)a3
{
  double v4 = [(WeekViewController *)self touchTrackingViewForEventGestureController:a3];
  double v5 = [(WeekViewController *)self _earliestWeekGroup];
  double v6 = [v5 weekView];
  double v7 = [v6 allDayView];

  [v7 bounds];
  [v4 convertRect:v7 fromView:];
  double v8 = CGRectGetMaxY(v10) + 1.0;

  return v8;
}

- (void)eventGestureController:(id)a3 requestsPresentationOfViewController:(id)a4
{
  id v5 = a4;
  double v7 = [[UnadaptableNavigationController alloc] initWithRootViewController:v5];

  [(UnadaptableNavigationController *)v7 setModalPresentationStyle:2];
  double v6 = [(WeekViewController *)self currentPresentationController];
  [v6 presentViewController:v7 animated:1 completion:0];
}

- (void)eventGestureController:(id)a3 requestsShowEvent:(id)a4
{
}

- (BOOL)moreThanOneDayVisibleForEventGestureController:(id)a3
{
  return 1;
}

- (UIEdgeInsets)pageChangeMarginsForEventGestureController:(id)a3
{
  double v4 = kLongPressPageChangeDelayMargin;
  id v5 = [(WeekViewController *)self timeView];

  double v6 = v4;
  if (v5)
  {
    double v7 = [(WeekViewController *)self timeView];
    [v7 frame];
    double v6 = v4 + v8;
  }
  double v9 = v4;
  double v10 = v6;
  double v11 = v4;
  double v12 = v4;
  result.right = v12;
  result.bottom = v11;
  result.left = v10;
  result.top = v9;
  return result;
}

- (BOOL)usesSmallTextForIsCompact:(BOOL)a3
{
  BOOL v3 = a3;
  double v4 = [(WeekViewController *)self weekViewClass];

  return [(objc_class *)v4 usesSmallTextForIsCompact:v3];
}

- (id)createOccurrenceViewForEventGestureController:(id)a3
{
  id v4 = [objc_alloc((Class)EKDayOccurrenceView) initWithFrame:CGRectZero.origin.x, CGRectZero.origin.y, CGRectZero.size.width, CGRectZero.size.height];
  [v4 setDelegate:self];
  [v4 setUsesSmallText:[self usesSmallTextForIsCompact:1]];
  return v4;
}

- (void)eventGestureController:(id)a3 adjustDraggingView:(id)a4 forAllDay:(BOOL)a5
{
}

- (id)createEventForEventGestureController:(id)a3
{
  CalAnalyticsSendEvent();

  return [(WeekViewController *)self _newEvent];
}

- (double)eventGestureController:(id)a3 yPositionPerhapsMatchingAllDayOccurrence:(id)a4 atPoint:(CGPoint)a5
{
  double y = a5.y;
  double x = a5.x;
  id v9 = a4;
  double v10 = [(WeekViewController *)self touchTrackingViewForEventGestureController:a3];
  double v11 = [(WeekViewController *)self _earliestWeekGroup];
  double v12 = [v11 weekView];

  [v12 convertPoint:v10 fromView:x, y];
  double v14 = v13;
  double v16 = v15;
  id v17 = [(WeekViewController *)self _latestWeekGroup];
  id v18 = [v17 weekView];

  [v18 convertPoint:v10 fromView:x, y];
  double v20 = v19;
  double v22 = v21;
  if (CalTimeDirectionIsLeftToRight()) {
    double v23 = v20;
  }
  else {
    double v23 = v14;
  }
  BOOL v24 = v23 < 0.0;
  if (v23 >= 0.0) {
    double v25 = v20;
  }
  else {
    double v25 = v14;
  }
  if (v24) {
    double v26 = v16;
  }
  else {
    double v26 = v22;
  }
  if (v24) {
    long long v27 = v12;
  }
  else {
    long long v27 = v18;
  }
  [v27 yPositionPerhapsMatchingAllDayOccurrence:v9 atPoint:v25, v26];
  double v29 = v28;

  [v10 convertPoint:v27 fromView:0.0, v29];
  double v31 = v30;

  return v31;
}

- (id)eventGestureController:(id)a3 occurrenceViewAtPoint:(CGPoint)a4 ignoreSelectedCopyView:(BOOL)a5
{
  return -[WeekViewController occurrenceViewAtPoint:ignoreSelectedCopyView:](self, "occurrenceViewAtPoint:ignoreSelectedCopyView:", a5, a4.x, a4.y);
}

- (id)eventGestureController:(id)a3 occurrenceViewForOccurrence:(id)a4 occurrenceDate:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  uint64_t v20 = 0;
  double v21 = &v20;
  uint64_t v22 = 0x3032000000;
  double v23 = sub_10008AB54;
  BOOL v24 = sub_10008AB64;
  id v25 = 0;
  visibleWeeks = self->_visibleWeeks;
  v16[0] = _NSConcreteStackBlock;
  v16[1] = 3221225472;
  v16[2] = sub_10008BFC0;
  v16[3] = &unk_1001D3998;
  double v19 = &v20;
  id v12 = v9;
  id v17 = v12;
  id v13 = v10;
  id v18 = v13;
  [(NSMutableArray *)visibleWeeks enumerateObjectsUsingBlock:v16];
  id v14 = (id)v21[5];

  _Block_object_dispose(&v20, 8);

  return v14;
}

- (BOOL)eventGestureController:(id)a3 isAllDayAtPoint:(CGPoint)a4 requireInsistence:(BOOL)a5
{
  BOOL v7 = 0;
  id v5 = -[WeekViewController dateAtPoint:isAllDay:requireAllDayRegionInsistence:](self, "dateAtPoint:isAllDay:requireAllDayRegionInsistence:", &v7, a5, a4.x, a4.y);
  return v7;
}

- (double)eventGestureController:(id)a3 dateAtPoint:(CGPoint)a4
{
  id v4 = -[WeekViewController dateAtPoint:isAllDay:](self, "dateAtPoint:isAllDay:", 0, a4.x, a4.y);
  [v4 absoluteTime];
  double v6 = v5;

  return v6;
}

- (CGPoint)eventGestureController:(id)a3 pointAtDate:(double)a4 isAllDay:(BOOL)a5
{
  [(WeekViewController *)self pointAtDate:a5 isAllDay:a4];
  result.double y = v6;
  result.double x = v5;
  return result;
}

- (double)eventGestureController:(id)a3 widthForOccurrenceViewOfDays:(unint64_t)a4
{
  double v5 = [(WeekViewController *)self _earliestWeekGroup];
  double v6 = [v5 weekView];
  BOOL v7 = [v6 content];
  [v7 fixedDayWidth];
  double v9 = v8 * (double)a4;

  return v9 + -4.0;
}

- (double)eventGestureController:(id)a3 heightForOccurrenceViewOfDuration:(double)a4
{
  double v5 = [(WeekViewController *)self view];
  +[EKDayTimeView hourHeightForSizeClass:EKUIWidthSizeClassForViewHierarchy() orientation:[(WeekViewController *)self viewInterfaceOrientation]];

  +[EKDayOccurrenceView bottomShadowMargin];
  CalRoundToScreenScale();
  double v7 = v6;
  double v8 = [(WeekViewController *)self view];
  +[EKDayOccurrenceView minimumHeightForSizeClass:EKUIWidthSizeClassForViewHierarchy() orientation:[(WeekViewController *)self viewInterfaceOrientation]];
  double v10 = v9;

  if (v7 >= v10) {
    return v7;
  }
  else {
    return v10;
  }
}

- (double)eventGestureController:(id)a3 heightForAllDayOccurrenceView:(id)a4
{
  id v5 = a4;
  double v6 = [(WeekViewController *)self view];
  +[EKDayOccurrenceView minimumHeightForSizeClass:EKUIWidthSizeClassForViewHierarchy() orientation:[(WeekViewController *)self viewInterfaceOrientation] isAllDay:1 usesSmallText:[(WeekViewController *)self usesSmallTextForIsCompact:1]];
  double v8 = v7;

  double v9 = [v5 currentImageState];
  unsigned int v10 = [v9 requiresLanguageAwarePadding];

  if (v10)
  {
    double v11 = [v5 currentImageState];
    [v11 totalLanguageAwareHeightPadding];
    double v8 = v8 + v12;
  }
  return v8;
}

- (BOOL)eventGestureControllerShouldAllowLongPress:(id)a3
{
  id v4 = [(WeekViewController *)self model];
  id v5 = [v4 defaultCalendarForNewEvents];

  if (v5) {
    return [(EKEventCreationGestureController *)self->_eventCreationController currentlyCreatingEvent] ^ 1;
  }
  else {
    return 0;
  }
}

- (void)eventGestureController:(id)a3 didSetUpAtDate:(double)a4 isAllDay:(BOOL)a5
{
  BOOL v5 = a5;
  id v8 = a3;
  double v9 = [v8 event];
  [(WeekViewController *)self _highlightEvent:v9 dayViewDate:v5 isAllDay:a4];

  unsigned int v10 = [v8 draggingView];

  double v11 = [(UIScrollView *)self->_weekScroller superview];
  CalSwitchViewToSuperview();

  previousGestureDate = self->_previousGestureDate;
  self->_previousGestureDate = 0;
}

- (void)eventGestureController:(id)a3 didMoveToDate:(double)a4 isAllDay:(BOOL)a5
{
  BOOL v5 = a5;
  id v17 = a3;
  id v8 = +[NSTimeZone defaultTimeZone];
  double v9 = +[EKCalendarDate calendarDateWithAbsoluteTime:v8 timeZone:a4];
  unsigned int v10 = [v9 allComponents];
  previousGestureDate = self->_previousGestureDate;
  if (!previousGestureDate
    || (id v12 = [(NSDateComponents *)previousGestureDate era], v12 != (id)[(NSDateComponents *)v10 era])
    || (id v13 = [(NSDateComponents *)self->_previousGestureDate month],
        v13 != (void *)[(NSDateComponents *)v10 month])
    || (id v14 = [(NSDateComponents *)self->_previousGestureDate day],
        v14 != (void *)[(NSDateComponents *)v10 day]))
  {
    [v17 didCrossDragBoundary:2];
  }
  double v15 = [v17 event];
  [(WeekViewController *)self _highlightEvent:v15 dayViewDate:v5 isAllDay:a4];

  double v16 = self->_previousGestureDate;
  self->_previousGestureDate = v10;
}

- (BOOL)eventGestureController:(id)a3 didCommitOccurrence:(id)a4 toDate:(double)a5 isAllDay:(BOOL)a6 span:(int64_t)a7
{
  id v9 = a4;
  [(WeekViewController *)self updatePreferredReloadRange];
  if (![v9 isNew])
  {
    CalAnalyticsSendEvent();
    double v11 = +[UIApplication sharedApplication];
    if ([v11 optionKeyIsDown]
      && (id v32 = v9,
          +[NSArray arrayWithObjects:&v32 count:1],
          id v14 = objc_claimAutoreleasedReturnValue(),
          unsigned int v15 = +[CUIKPasteboardUtilities allEventsValidForAction:2 fromEvents:v14], v14, v15))
    {
      double v16 = kCalUILogHandle;
      if (os_log_type_enabled((os_log_t)kCalUILogHandle, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)buf = 0;
        _os_log_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_INFO, "duplicating event(s) in week view because option key is down", buf, 2u);
      }
      id v17 = [(WeekViewController *)self model];
      id v18 = [v17 pasteboardManager];
      double v19 = [v9 startDate];
      [v18 setDateForPaste:v19];

      uint64_t v20 = [(WeekViewController *)self model];
      double v21 = [v20 pasteboardManager];
      [v21 setCalendarForPaste:0];

      id v22 = [(WeekViewController *)self pasteboardManager];
      double v23 = +[NSSet setWithObject:v9];
      [v22 duplicateEvents:v23 withDateMode:1 delegate:self];
    }
    else
    {
      BOOL v24 = [(WeekViewController *)self EKUI_editor];
      id v29 = 0;
      unsigned __int8 v25 = [v24 saveEvent:v9 span:a7 error:&v29];
      id v22 = v29;

      if ((v25 & 1) == 0)
      {
        double v26 = kCalUILogHandle;
        if (os_log_type_enabled((os_log_t)kCalUILogHandle, OS_LOG_TYPE_DEBUG))
        {
          *(_DWORD *)buf = 138412290;
          id v31 = v22;
          _os_log_impl((void *)&_mh_execute_header, v26, OS_LOG_TYPE_DEBUG, "Error moving event: %@", buf, 0xCu);
        }
      }
    }

    goto LABEL_15;
  }
  unsigned int v10 = [(WeekViewController *)self presentedViewController];

  if (!v10)
  {
    double v11 = +[EKEventEditor defaultTitleForCalendarItem];
    id v12 = [v9 title];
    unsigned int v13 = [v11 isEqualToString:v12];

    if (v13) {
      [v9 setTitle:&stru_1001D6918];
    }
    [(WeekViewController *)self didEditEvent:v9 creationMethod:1];
LABEL_15:
  }
  [(WeekViewController *)self scrollToDisplayedDateAnimated:1];
  [(WeekViewController *)self _removeDateHighlight];
  previousGestureDate = self->_previousGestureDate;
  self->_previousGestureDate = 0;

  return 1;
}

- (void)eventGestureControllerDidEndDragSession:(id)a3
{
  previousGestureDate = self->_previousGestureDate;
  self->_previousGestureDate = 0;

  [(WeekViewController *)self _removeDateHighlight];
}

- (void)eventGestureController:(id)a3 didCancelEditingOccurrence:(id)a4 fadedOut:(BOOL)a5
{
  id v17 = a3;
  id v8 = a4;
  [(WeekViewController *)self _removeDateHighlight];
  previousGestureDate = self->_previousGestureDate;
  self->_previousGestureDate = 0;

  unsigned int v10 = [(WeekViewController *)self view];
  [v10 alpha];
  double v12 = v11;

  if (v12 > 0.0)
  {
    if (a5)
    {
      if (([v8 isNew] & 1) == 0)
      {
        unsigned int v13 = [v17 occurrenceDate];
        [(WeekViewController *)self undimOccurrence:v8 occurrenceDate:v13];

        [v17 endForcedStart:0];
      }
    }
    else
    {
      id v14 = [v17 occurrenceDate];
      [v17 forceStartWithOccurrence:v8 occurrenceDate:v14 shouldUpdateViewSource:0 shouldUpdateOrigin:1 shouldPresentEditMenu:1];

      unsigned int v15 = [v17 event];
      double v16 = [v17 occurrenceDate];
      [(WeekViewController *)self dimOccurrence:v15 occurrenceDate:v16];
    }
  }
}

- (void)eventGestureController:(id)a3 didSingleTapOccurrence:(id)a4 shouldExtendSelection:(BOOL)a5
{
  id v17 = a4;
  id v8 = a3;
  [(WeekViewController *)self _removeDateHighlight];
  if (a5)
  {
    id v9 = [v8 event];
    unsigned int v10 = [v8 occurrenceDate];
    [(WeekViewController *)self undimOccurrence:v9 occurrenceDate:v10];

    [v8 endForcedStart:0];
    id v8 = [(WeekViewController *)self occurrenceViewForEvent:v17 occurrenceDate:0];
    if ([(NSMutableArray *)self->_selectedOccurrenceViews containsObject:v8]) {
      [(WeekViewController *)self _deselectOccurrenceView:v8];
    }
    else {
      [(WeekViewController *)self _selectOccurrenceView:v8];
    }
  }
  else
  {
    id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
    char v12 = objc_opt_respondsToSelector();

    if (v12)
    {
      id v13 = objc_loadWeakRetained((id *)&self->_delegate);
      id v14 = [(EKEventGestureController *)self->_eventGestureController event];
      [v13 performSelector:"weekViewController:didSelectEvent:" withObject:self withObject:v14];
    }
    unsigned int v15 = [v8 event];
    double v16 = [v8 occurrenceDate];
    [(WeekViewController *)self undimOccurrence:v15 occurrenceDate:v16];

    [v8 endForcedStart:0];
  }
}

- (double)_widthForDayAtPoint:(CGPoint)a3 isMovingRight:(BOOL)a4
{
  BOOL v5 = [(WeekViewController *)self weekViewClass];
  int64_t v6 = [(WeekViewController *)self viewInterfaceOrientation];
  double v7 = [(WeekViewController *)self view];
  [(objc_class *)v5 dayWidthForOrientation:v6 withViewInViewHierarchy:v7];
  double v9 = v8;

  return v9;
}

- (BOOL)didScrollWhenEventGestureController:(id)a3 scrollTimerFiredToMoveLeft:(BOOL)a4 right:(BOOL)a5 vertically:(BOOL)a6 towardPoint:(CGPoint)a7
{
  double y = a7.y;
  double x = a7.x;
  BOOL v9 = a6;
  BOOL v10 = a5;
  id v13 = a3;
  if (a4 || v10)
  {
    [(UIScrollView *)self->_weekScroller contentOffset];
    double v27 = v26;
    double v29 = v28;
    if (v10)
    {
      -[WeekViewController _widthForDayAtPoint:isMovingRight:](self, "_widthForDayAtPoint:isMovingRight:", 1, x, y);
      double v31 = v27 + v30;
    }
    else
    {
      -[WeekViewController _widthForDayAtPoint:isMovingRight:](self, "_widthForDayAtPoint:isMovingRight:", 0, x, y);
      double v31 = v27 - v32;
    }
    weekScroller = self->_weekScroller;
    unsigned __int8 v25 = 1;
    -[UIScrollView setContentOffset:animated:](weekScroller, "setContentOffset:animated:", 1, v31, v29);
  }
  else if (v9)
  {
    id v14 = -[WeekViewController _weekGroupForPoint:](self, "_weekGroupForPoint:", x, y);
    -[UIScrollView convertPoint:toView:](self->_weekScroller, "convertPoint:toView:", v14, x, y);
    double v16 = v15;
    double v18 = v17;
    double v19 = [v14 weekView];
    [v14 convertPoint:v19 toView:v16];
    double v21 = v20;
    double v23 = v22;

    BOOL v24 = [v14 weekView];
    unsigned __int8 v25 = [v24 scrollTowardPoint:v21, v23];
  }
  else
  {
    unsigned __int8 v25 = 0;
  }

  return v25;
}

- (void)emptySpaceClickedOnDate:(id)a3
{
  id v4 = a3;
  if (([(EKEventGestureController *)self->_eventGestureController dragGestureInProgress] & 1) == 0)
  {
    [(WeekViewController *)self _removeDateHighlight];
    [(WeekViewController *)self tappedOnDate:v4];
    [(WeekViewController *)self cleanupSelectionState];
  }
}

- (void)setReceiveTapsInHeader:(BOOL)a3
{
  if (self->_receiveTapsInHeader != a3)
  {
    BOOL v3 = a3;
    self->_receiveTapsInHeader = a3;
    long long v11 = 0u;
    long long v12 = 0u;
    long long v13 = 0u;
    long long v14 = 0u;
    id v4 = self->_visibleWeeks;
    id v5 = [(NSMutableArray *)v4 countByEnumeratingWithState:&v11 objects:v15 count:16];
    if (v5)
    {
      id v6 = v5;
      uint64_t v7 = *(void *)v12;
      do
      {
        double v8 = 0;
        do
        {
          if (*(void *)v12 != v7) {
            objc_enumerationMutation(v4);
          }
          BOOL v9 = [*(id *)(*((void *)&v11 + 1) + 8 * (void)v8) weekView:(void)v11];
          BOOL v10 = [v9 allDayView];
          [v10 setReceiveTapsInHeader:v3];

          double v8 = (char *)v8 + 1;
        }
        while (v6 != v8);
        id v6 = [(NSMutableArray *)v4 countByEnumeratingWithState:&v11 objects:v15 count:16];
      }
      while (v6);
    }
  }
}

- (BOOL)creationGestureController:(id)a3 canActivateAtPoint:(CGPoint)a4
{
  double y = a4.y;
  double x = a4.x;
  if ([(EKEventGestureController *)self->_eventGestureController dragGestureInProgress])return 0; {
  uint64_t v7 = [(EKEventGestureController *)self->_eventGestureController draggingView];
  }

  if (v7) {
    return 0;
  }
  BOOL v10 = [(MainViewController *)self shownEventViewController];
  if (v10)
  {
    BOOL v8 = 0;
LABEL_7:

    return v8;
  }
  long long v11 = [(MainViewController *)self shownEventEditViewController];

  if (!v11)
  {
    long long v12 = [(WeekViewController *)self _parentViewForCreationGesturePreview];
    [v12 convertPoint:self->_weekScroller toView:x, y];
    double v14 = v13;
    double v16 = v15;

    BOOL v10 = -[WeekViewController occurrenceViewAtPoint:ignoreSelectedCopyView:](self, "occurrenceViewAtPoint:ignoreSelectedCopyView:", 0, v14, v16);
    BOOL v8 = v10 == 0;
    goto LABEL_7;
  }
  return 0;
}

- (id)_parentViewForCreationGesturePreview
{
  return [(UIScrollView *)self->_weekScroller superview];
}

- (id)creationGestureController:(id)a3 requestedPreviewForEvent:(id)a4
{
  id v5 = a4;
  id v6 = [objc_alloc((Class)EKDayOccurrenceView) initWithFrame:CGRectZero.origin.x, CGRectZero.origin.y, CGRectZero.size.width, CGRectZero.size.height];
  [v6 setOccurrence:v5];

  [v6 setUsesSmallText:[self usesSmallTextForIsCompact:1]];
  [v6 setSelected:1];
  return v6;
}

- (double)creationGestureController:(id)a3 requestedWidthForEventPreview:(id)a4 atPoint:(CGPoint)a5
{
  id v6 = [(WeekViewController *)self weekViewClass];
  int64_t v7 = [(WeekViewController *)self viewInterfaceOrientation];
  BOOL v8 = [(WeekViewController *)self view];
  [(objc_class *)v6 dayWidthForOrientation:v7 withViewInViewHierarchy:v8];
  double v10 = v9;

  return v10;
}

- (double)creationGestureController:(id)a3 requestedXCoordinateForEventPreviewAtPoint:(CGPoint)a4
{
  double y = a4.y;
  double x = a4.x;
  int64_t v7 = [(WeekViewController *)self _parentViewForCreationGesturePreview];
  -[UIScrollView convertPoint:fromView:](self->_weekScroller, "convertPoint:fromView:", v7, x, y);
  BOOL v8 = -[WeekViewController dateAtPoint:isAllDay:requireAllDayRegionInsistence:](self, "dateAtPoint:isAllDay:requireAllDayRegionInsistence:", 0, 0);
  [(WeekViewController *)self _xOffsetForDate:v8];
  [v7 convertPoint:self->_weekScroller fromView:];
  double v10 = v9;

  return v10;
}

- (CGPoint)creationGestureController:(id)a3 requestsPointForDate:(id)a4
{
  [a4 timeIntervalSinceReferenceDate:a3];
  -[WeekViewController pointAtDate:isAllDay:](self, "pointAtDate:isAllDay:", 0);
  double v6 = v5;
  double v8 = v7;
  double v9 = [(WeekViewController *)self _parentViewForCreationGesturePreview];
  [v9 convertPoint:self->_weekScroller fromView:v6];
  double v11 = v10;
  double v13 = v12;

  double v14 = v11;
  double v15 = v13;
  result.double y = v15;
  result.double x = v14;
  return result;
}

- (void)creationGestureController:(id)a3 didResizeToDate:(id)a4
{
  [a4 timeIntervalSinceReferenceDate];

  -[WeekViewController _highlightEvent:dayViewDate:isAllDay:](self, "_highlightEvent:dayViewDate:isAllDay:", 0, 0);
}

- (id)creationGestureController:(id)a3 dateForPoint:(CGPoint)a4
{
  double y = a4.y;
  double x = a4.x;
  weekScroller = self->_weekScroller;
  double v8 = [(WeekViewController *)self _parentViewForCreationGesturePreview];
  -[UIScrollView convertPoint:fromView:](weekScroller, "convertPoint:fromView:", v8, x, y);
  double v10 = v9;
  double v12 = v11;

  double v13 = -[WeekViewController dateAtPoint:isAllDay:](self, "dateAtPoint:isAllDay:", 0, v10, v12);
  double v14 = [v13 date];

  return v14;
}

- (id)_newEvent
{
  BOOL v3 = [(WeekViewController *)self model];
  id v4 = [v3 eventStore];
  double v5 = +[EKEvent eventWithEventStore:v4];

  double v6 = +[EKEventEditor defaultTitleForCalendarItem];
  [v5 setTitle:v6];

  double v7 = [(WeekViewController *)self model];
  double v8 = [v7 defaultCalendarForNewEvents];
  [v5 setCalendar:v8];

  return v5;
}

- (void)creationGestureController:(id)a3 didCreateNewEvent:(id)a4
{
  id v5 = a4;
  [(WeekViewController *)self _removeDateHighlight];
  [(WeekViewController *)self createdNewEventUsingCreationGesture:v5];
}

- (BOOL)enableEventCreationGesture
{
  return 0;
}

- (void)eventViewController:(id)a3 didCompleteWithAction:(int64_t)a4
{
  id v19 = a3;
  [v19 setDelegate:0];
  id v5 = [v19 presentingViewController];
  objc_opt_class();
  char isKindOfClass = objc_opt_isKindOfClass();

  if (isKindOfClass)
  {
    double v7 = [v19 presentingViewController];
    double v8 = v7;
    if (self->_editorDismissedFromDelete)
    {
      double v9 = [v19 event];
      [v8 reminderDetailDismissedWithDeletedEvent:v9];
    }
    else
    {
      [v7 reminderDetailDismissedWithDeletedEvent:0];
    }
LABEL_12:

    goto LABEL_13;
  }
  double v10 = [(WeekViewController *)self navigationController];
  double v11 = [v10 presentedViewController];
  objc_opt_class();
  char v12 = objc_opt_isKindOfClass();

  double v13 = [(WeekViewController *)self navigationController];
  double v8 = v13;
  if (v12)
  {
    double v14 = [v13 presentedViewController];
    double v15 = v14;
    if (self->_editorDismissedFromDelete)
    {
      double v16 = [v19 event];
      [v15 reminderDetailDismissedWithDeletedEvent:v16];
    }
    else
    {
      [v14 reminderDetailDismissedWithDeletedEvent:0];
    }

    goto LABEL_12;
  }

  if (v8)
  {
    double v17 = [(WeekViewController *)self navigationController];
    [v17 popViewControllersAfterAndIncluding:v19 animated:!self->_editorDismissedFromDelete];

    double v18 = [(WeekViewController *)self model];
    [v18 setSelectedOccurrence:0];

    goto LABEL_14;
  }
LABEL_13:
  [v19 dismissViewControllerAnimated:1 completion:0];
LABEL_14:
}

- (void)eventViewController:(id)a3 willDismissEditViewController:(id)a4 deleted:(BOOL)a5
{
  self->_editorDismissedFromDelete = a5;
}

- (CGRect)currentTimeRectInView:(id)a3
{
  id v4 = a3;
  CGFloat x = CGRectNull.origin.x;
  CGFloat y = CGRectNull.origin.y;
  CGFloat width = CGRectNull.size.width;
  CGFloat height = CGRectNull.size.height;
  double v9 = [(WeekTimeView *)self->_timeView timeView];
  double v10 = [v9 timeMarker];

  double v11 = [v10 superview];
  if (!v11) {
    goto LABEL_5;
  }
  [v10 alpha];
  if (v12 != 1.0) {
    goto LABEL_5;
  }
  unsigned int v13 = [v10 showsThumb];

  if (v13)
  {
    [v10 currentTimeFrame];
    double v15 = v14;
    double v17 = v16;
    double v19 = v18;
    double v21 = v20;
    double v11 = [v10 superview];
    [v4 convertRect:v11 fromView:v15, v17, v19, v21];
    CGFloat x = v22;
    CGFloat y = v23;
    CGFloat width = v24;
    CGFloat height = v25;
LABEL_5:
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

- (void)_updateAllDaySectionScrollerContentSize
{
  if ([(WeekViewController *)self usesMultiDayWeekView])
  {
    BOOL v3 = [(WeekViewController *)self earliestDateComponents];
    id v4 = [(CUIKCalendarModel *)self->super._model calendar];
    id v5 = [v4 timeZone];
    double v42 = +[EKCalendarDate calendarDateWithDateComponents:v3 timeZone:v5];

    double v6 = [(WeekViewController *)self _latestDateComponents];
    double v7 = [(CUIKCalendarModel *)self->super._model calendar];
    double v8 = [v7 timeZone];
    double v9 = +[EKCalendarDate calendarDateWithDateComponents:v6 timeZone:v8];
    CGFloat v40 = [v9 calendarDateForEndOfDay];

    long long v49 = 0u;
    long long v50 = 0u;
    long long v47 = 0u;
    long long v48 = 0u;
    id obj = self->_visibleWeeks;
    id v10 = [(NSMutableArray *)obj countByEnumeratingWithState:&v47 objects:v52 count:16];
    if (v10)
    {
      id v11 = v10;
      uint64_t v41 = *(void *)v48;
      double v12 = 0.0;
      do
      {
        for (uint64_t i = 0; i != v11; uint64_t i = (char *)i + 1)
        {
          if (*(void *)v48 != v41) {
            objc_enumerationMutation(obj);
          }
          double v14 = *(void **)(*((void *)&v47 + 1) + 8 * i);
          double v15 = [v14 weekStartDate];
          double v16 = [(CUIKCalendarModel *)self->super._model calendar];
          double v17 = [v16 timeZone];
          double v18 = +[EKCalendarDate calendarDateWithDateComponents:v15 timeZone:v17];

          double v19 = [v14 lastSecondOfWeek];
          double v20 = [(CUIKCalendarModel *)self->super._model calendar];
          double v21 = [v20 timeZone];
          double v22 = +[EKCalendarDate calendarDateWithDate:v19 timeZone:v21];

          if ([v22 compare:v42] != (id)-1 && objc_msgSend(v18, "compare:", v40) != (id)1)
          {
            double v23 = [v14 weekView];
            double v24 = [v23 allDayView];
            [v24 scrollerContentHeightWithUserVisibleEarliestDate:v42 latestDate:v40];
            double v26 = v25;

            if (v26 > v12) {
              double v12 = v26;
            }
          }
        }
        id v11 = [(NSMutableArray *)obj countByEnumeratingWithState:&v47 objects:v52 count:16];
      }
      while (v11);
    }
    else
    {
      double v12 = 0.0;
    }

    long long v45 = 0u;
    long long v46 = 0u;
    long long v43 = 0u;
    long long v44 = 0u;
    double v27 = self->_visibleWeeks;
    id v28 = [(NSMutableArray *)v27 countByEnumeratingWithState:&v43 objects:v51 count:16];
    if (v28)
    {
      id v29 = v28;
      uint64_t v30 = *(void *)v44;
      do
      {
        for (j = 0; j != v29; j = (char *)j + 1)
        {
          if (*(void *)v44 != v30) {
            objc_enumerationMutation(v27);
          }
          double v32 = *(void **)(*((void *)&v43 + 1) + 8 * (void)j);
          double v33 = [v32 weekView];
          CGFloat v34 = [v33 allDayView];
          [v34 scrollerContentSize];
          double v36 = v35;

          double v37 = [v32 weekView];
          CGFloat v38 = [v37 allDayView];
          [v38 setScrollerContentSize:v36, v12];
        }
        id v29 = [(NSMutableArray *)v27 countByEnumeratingWithState:&v43 objects:v51 count:16];
      }
      while (v29);
    }
  }
}

- (void)_updateHeaderHeightsAnimated:(BOOL)a3
{
  BOOL v105 = a3;
  [(UIScrollView *)self->_weekScroller frame];
  CGFloat v111 = v5;
  CGFloat v112 = v4;
  CGFloat v7 = v6;
  CGFloat v9 = v8;
  long long v122 = 0u;
  long long v123 = 0u;
  long long v124 = 0u;
  long long v125 = 0u;
  id v10 = self->_visibleWeeks;
  id v11 = [(NSMutableArray *)v10 countByEnumeratingWithState:&v122 objects:v127 count:16];
  if (v11)
  {
    id v12 = v11;
    char v110 = 0;
    uint64_t v13 = *(void *)v123;
    double v14 = 0.0;
    uint64_t v106 = *(void *)v123;
    CGRect v107 = v10;
    while (1)
    {
      uint64_t v15 = 0;
      id v108 = v12;
      do
      {
        if (*(void *)v123 != v13) {
          objc_enumerationMutation(v10);
        }
        uint64_t v109 = v15;
        double v16 = *(void **)(*((void *)&v122 + 1) + 8 * v15);
        double v17 = [(WeekViewController *)self view];
        double v18 = [v16 weekView];
        [v18 frame];
        double v20 = v19;
        double v22 = v21;
        double v24 = v23;
        double v26 = v25;
        double v27 = [v16 weekView];
        id v28 = [v27 superview];
        [v17 convertRect:v28 fromView:v20 toView:v22];
        CGFloat v30 = v29;
        CGFloat v32 = v31;
        CGFloat v34 = v33;
        CGFloat v36 = v35;

        v128.origin.CGFloat y = v111;
        v128.origin.CGFloat x = v112;
        v128.size.CGFloat width = v7;
        v128.size.CGFloat height = v9;
        v130.origin.CGFloat x = v30;
        v130.origin.CGFloat y = v32;
        v130.size.CGFloat width = v34;
        v130.size.CGFloat height = v36;
        if (CGRectIntersectsRect(v128, v130))
        {
          double v37 = [v16 weekView];
          CGFloat v38 = [v37 allDayView];
          [v38 heightWithoutNoAllDayOccurrences];
          double v40 = v39;

          if (v40 > v14) {
            double v14 = v40;
          }
          uint64_t v41 = [v16 weekView];
          unsigned int v42 = [v41 hasAllDayEvents];

          if (v42)
          {
            long long v43 = [v16 weekView];
            long long v44 = [v43 allDayView];
            [v44 layoutIfNeeded];

            if ([(WeekViewController *)self usesMultiDayWeekView])
            {
              long long v45 = [(WeekViewController *)self earliestDateComponents];
              long long v46 = [(CUIKCalendarModel *)self->super._model calendar];
              long long v47 = [v46 timeZone];
              long long v48 = +[EKCalendarDate calendarDateWithDateComponents:v45 timeZone:v47];

              long long v49 = [(WeekViewController *)self _latestDateComponents];
              long long v50 = [(CUIKCalendarModel *)self->super._model calendar];
              id v51 = [v50 timeZone];
              id v52 = +[EKCalendarDate calendarDateWithDateComponents:v49 timeZone:v51];
              uint64_t v53 = [v52 calendarDateForEndOfDay];

              uint64_t v54 = [v16 weekView];
              double v55 = [v54 allDayView];
              [v55 multiDayViewVisibleHeightWithUserVisibleEarliestDate:v48 latestDate:v53];
              double v57 = v56;
            }
            else
            {
              long long v48 = [v16 weekView];
              uint64_t v53 = [v48 allDayView];
              [v53 naturalHeight];
              double v57 = v58;
            }

            long long v120 = 0u;
            long long v121 = 0u;
            long long v118 = 0u;
            long long v119 = 0u;
            CGFloat v59 = [v16 weekView];
            double v60 = [v59 allDayView];
            CGFloat v61 = [v60 occurrenceViews];

            id v62 = [v61 countByEnumeratingWithState:&v118 objects:v126 count:16];
            if (v62)
            {
              id v63 = v62;
              uint64_t v64 = *(void *)v119;
              do
              {
                for (uint64_t i = 0; i != v63; uint64_t i = (char *)i + 1)
                {
                  if (*(void *)v119 != v64) {
                    objc_enumerationMutation(v61);
                  }
                  double v66 = *(void **)(*((void *)&v118 + 1) + 8 * i);
                  CGFloat v67 = [(WeekViewController *)self view];
                  [v66 frame];
                  double v69 = v68;
                  double v71 = v70;
                  double v73 = v72;
                  double v75 = v74;
                  double v76 = [v16 weekView];
                  double v77 = [v76 allDayView];
                  [v67 convertRect:v77 fromView:v69];
                  CGFloat v79 = v78;
                  CGFloat v81 = v80;
                  CGFloat v83 = v82;
                  double v85 = v84;

                  v129.origin.CGFloat y = v111;
                  v129.origin.CGFloat x = v112;
                  v129.size.CGFloat width = v7;
                  v129.size.CGFloat height = v9;
                  v131.origin.CGFloat x = v79;
                  v131.origin.CGFloat y = v81;
                  v131.size.CGFloat width = v83;
                  v131.size.CGFloat height = v85;
                  if (CGRectIntersectsRect(v129, v131))
                  {
                    objc_super v86 = [v66 currentImageState];
                    unsigned int v87 = [v86 requiresLanguageAwarePadding];

                    if (v87)
                    {
                      BOOL v88 = [v66 currentImageState];
                      [v88 totalLanguageAwareHeightPadding];
                      double v90 = v89;
                      goto LABEL_25;
                    }
                    CGFloat v91 = [v16 weekView];
                    CGFloat v92 = [v91 allDayView];
                    [v92 occurrenceHeight];
                    double v94 = v93;

                    BOOL v95 = v85 <= v94;
                    double v96 = v57;
                    if (!v95)
                    {
                      BOOL v88 = [v66 currentImageState];
                      [v88 totalLanguageAwareHeightPadding];
                      double v98 = v97;
                      long long v99 = [(WeekViewController *)self view];
                      IsRegularInViewHierarchCGFloat y = EKUICurrentWidthSizeClassIsRegularInViewHierarchy();
                      double v101 = 2.5;
                      if (IsRegularInViewHierarchy) {
                        double v101 = 3.5;
                      }
                      double v90 = v98 + v101;

LABEL_25:
                      double v96 = v57 + v90;
                    }
                    if (v96 > v14) {
                      double v14 = v96;
                    }
                    char v110 = 1;
                    continue;
                  }
                }
                id v63 = [v61 countByEnumeratingWithState:&v118 objects:v126 count:16];
              }
              while (v63);
            }

            uint64_t v13 = v106;
            id v10 = v107;
            id v12 = v108;
          }
        }
        uint64_t v15 = v109 + 1;
      }
      while ((id)(v109 + 1) != v12);
      id v12 = [(NSMutableArray *)v10 countByEnumeratingWithState:&v122 objects:v127 count:16];
      if (!v12) {
        goto LABEL_36;
      }
    }
  }
  char v110 = 0;
  double v14 = 0.0;
LABEL_36:

  double v102 = self->_cachedHeaderHeight - v14;
  if (v102 < 0.0) {
    double v102 = -v102;
  }
  if (v102 > 0.0001)
  {
    self->_cachedHeaderHeight = v14;
    v115[0] = _NSConcreteStackBlock;
    v115[1] = 3221225472;
    v115[2] = sub_10008E328;
    v115[3] = &unk_1001D39C0;
    v115[4] = self;
    BOOL v116 = v105;
    *(double *)&v115[5] = v14;
    char v117 = v110 & 1;
    CGRect v103 = objc_retainBlock(v115);
    v113[0] = _NSConcreteStackBlock;
    v113[1] = 3221225472;
    v113[2] = sub_10008E4F4;
    v113[3] = &unk_1001D39E8;
    v113[4] = self;
    char v114 = v110 & 1;
    CGRect v104 = objc_retainBlock(v113);
    if (v105)
    {
      +[UIView animateWithDuration:7 delay:v103 options:v104 animations:0.3 completion:0.0];
    }
    else
    {
      ((void (*)(void *))v103[2])(v103);
      ((void (*)(void *, uint64_t))v104[2])(v104, 1);
    }
  }
}

- (void)_setHeaderHeightForWeekGroupView:(id)a3 forceLayout:(BOOL)a4
{
  BOOL v4 = a4;
  id v17 = [a3 weekView];
  double v6 = [v17 allDayView];
  [v6 setFixedDayHeight:self->_cachedHeaderHeight];
  [v6 frame];
  double v8 = v7;
  double v10 = v9;
  double v12 = v11;
  double cachedHeaderHeight = self->_cachedHeaderHeight;
  [v6 setFrame:];
  double v14 = [v17 allDayView];
  [v14 setFrame:v8, v10, v12, cachedHeaderHeight];

  [v17 setNeedsLayout];
  if (v4) {
    [v17 layoutIfNeeded];
  }
  uint64_t v15 = [v17 content];
  double v16 = [v15 layer];
  recursiveAnimationRemove();
}

- (id)_earliestVisibleWeekGroupView
{
  [(UIScrollView *)self->_weekScroller contentOffset];
  uint64_t v4 = v3;
  uint64_t v11 = 0;
  double v12 = &v11;
  uint64_t v13 = 0x3032000000;
  double v14 = sub_10008AB54;
  uint64_t v15 = sub_10008AB64;
  id v16 = 0;
  BOOL v5 = CalTimeDirectionIsLeftToRight() == 0;
  visibleWeeks = self->_visibleWeeks;
  v10[0] = _NSConcreteStackBlock;
  v10[1] = 3221225472;
  v10[2] = sub_10008E7A8;
  v10[3] = &unk_1001D3A10;
  if (v5) {
    uint64_t v7 = 2;
  }
  else {
    uint64_t v7 = 0;
  }
  v10[5] = v4;
  void v10[4] = &v11;
  [(NSMutableArray *)visibleWeeks enumerateObjectsWithOptions:v7 usingBlock:v10];
  id v8 = (id)v12[5];
  _Block_object_dispose(&v11, 8);

  return v8;
}

- (id)_latestVisibleWeekGroupView
{
  [(UIScrollView *)self->_weekScroller contentOffset];
  double v4 = v3;
  double weekWidth = self->_weekWidth;
  uint64_t v12 = 0;
  uint64_t v13 = &v12;
  uint64_t v14 = 0x3032000000;
  uint64_t v15 = sub_10008AB54;
  id v16 = sub_10008AB64;
  id v17 = 0;
  BOOL v6 = CalTimeDirectionIsLeftToRight() == 0;
  visibleWeeks = self->_visibleWeeks;
  v11[0] = _NSConcreteStackBlock;
  v11[1] = 3221225472;
  v11[2] = sub_10008E9A8;
  v11[3] = &unk_1001D3A10;
  if (v6) {
    uint64_t v8 = 0;
  }
  else {
    uint64_t v8 = 2;
  }
  *(double *)&void v11[5] = v4 + weekWidth;
  v11[4] = &v12;
  [(NSMutableArray *)visibleWeeks enumerateObjectsWithOptions:v8 usingBlock:v11];
  id v9 = (id)v13[5];
  _Block_object_dispose(&v12, 8);

  return v9;
}

- (id)earliestDateComponents
{
  double v3 = [(WeekViewController *)self _earliestVisibleWeekGroupView];
  if (CalTimeDirectionIsLeftToRight())
  {
    [(UIScrollView *)self->_weekScroller contentOffset];
    double v5 = 1.0;
  }
  else
  {
    [(WeekTimeView *)self->_timeView frame];
    double Width = CGRectGetWidth(v14);
    [(UIScrollView *)self->_weekScroller contentOffset];
    double v8 = v7;
    [(UIScrollView *)self->_weekScroller bounds];
    double v4 = v8 + CGRectGetWidth(v15) - Width;
    double v5 = -1.0;
  }
  double v9 = v4 + v5;
  [v3 frame];
  uint64_t v11 = [v3 dateForXOffset:v9 - v10];

  return v11;
}

- (id)_latestDateComponents
{
  [(UIScrollView *)self->_weekScroller contentOffset];
  double v4 = v3;
  double v5 = 1.0;
  if (CalTimeDirectionIsLeftToRight())
  {
    [(UIScrollView *)self->_weekScroller bounds];
    double v5 = CGRectGetWidth(v11) + -1.0;
  }
  BOOL v6 = [(WeekViewController *)self _latestVisibleWeekGroupView];
  [v6 frame];
  double v8 = [v6 dateForXOffset:v4 + v5 - v7];

  return v8;
}

- (id)centerDateComponents
{
  int IsLeftToRight = CalTimeDirectionIsLeftToRight();
  unint64_t v4 = [(WeekViewController *)self daysInWeek];
  double v5 = 0.499;
  if (v4 == 2) {
    double v5 = 0.25;
  }
  double v6 = 0.501;
  if (v4 == 2) {
    double v6 = 0.75;
  }
  if (IsLeftToRight) {
    double v7 = v5;
  }
  else {
    double v7 = v6;
  }
  [(UIScrollView *)self->_weekScroller contentOffset];
  double v9 = v8;
  [(UIScrollView *)self->_weekScroller bounds];
  double v11 = v9 + v10 * v7;
  long long v21 = 0u;
  long long v22 = 0u;
  long long v23 = 0u;
  long long v24 = 0u;
  uint64_t v12 = self->_visibleWeeks;
  id v13 = [(NSMutableArray *)v12 countByEnumeratingWithState:&v21 objects:v25 count:16];
  if (v13)
  {
    uint64_t v14 = *(void *)v22;
    while (2)
    {
      for (uint64_t i = 0; i != v13; uint64_t i = (char *)i + 1)
      {
        if (*(void *)v22 != v14) {
          objc_enumerationMutation(v12);
        }
        id v16 = *(void **)(*((void *)&v21 + 1) + 8 * i);
        [v16 frame:v21];
        if (v17 <= v11)
        {
          [v16 frame];
          if (CGRectGetMaxX(v27) > v11)
          {
            id v13 = v16;
            goto LABEL_19;
          }
        }
      }
      id v13 = [(NSMutableArray *)v12 countByEnumeratingWithState:&v21 objects:v25 count:16];
      if (v13) {
        continue;
      }
      break;
    }
  }
LABEL_19:

  [v13 frame];
  double v19 = [v13 dateForXOffset:v11 - v18];

  return v19;
}

- (void)_startMarkerTimer
{
  if (!self->_timeMarkerTimer)
  {
    CUIKCalendar();
    id v12 = (id)objc_claimAutoreleasedReturnValue();
    double v3 = CUIKCalendar();
    unint64_t v4 = +[NSDate date];
    double v5 = [v3 components:126 fromDate:v4];

    double v6 = [v12 dateFromComponents:v5];
    id v7 = objc_alloc_init((Class)NSDateComponents);
    [v7 setMinute:1];
    double v8 = [v12 dateByAddingComponents:v7 toDate:v6 options:0];
    double v9 = (NSTimer *)[objc_alloc((Class)NSTimer) initWithFireDate:v8 interval:self target:"_updateTimeMarker" selector:0 userInfo:1 repeats:60.0];
    timeMarkerTimer = self->_timeMarkerTimer;
    self->_timeMarkerTimer = v9;

    double v11 = +[NSRunLoop currentRunLoop];
    [v11 addTimer:self->_timeMarkerTimer forMode:NSDefaultRunLoopMode];
  }
}

- (void)_invalidateMarkerTimer
{
  [(NSTimer *)self->_timeMarkerTimer invalidate];
  timeMarkerTimer = self->_timeMarkerTimer;
  self->_timeMarkerTimer = 0;
}

- (id)model
{
  return self->super._model;
}

- (BOOL)dateIsVisible:(id)a3
{
  id v4 = a3;
  long long v23 = 0u;
  long long v24 = 0u;
  long long v25 = 0u;
  long long v26 = 0u;
  id obj = self->_visibleWeeks;
  id v5 = [(NSMutableArray *)obj countByEnumeratingWithState:&v23 objects:v27 count:16];
  if (v5)
  {
    id v6 = v5;
    uint64_t v7 = *(void *)v24;
    while (2)
    {
      for (uint64_t i = 0; i != v6; uint64_t i = (char *)i + 1)
      {
        if (*(void *)v24 != v7) {
          objc_enumerationMutation(obj);
        }
        double v9 = [*(id *)(*((void *)&v23 + 1) + 8 * i) weekView];
        if ([v9 containsDate:v4])
        {
          [v9 pointAtDate:v4 isAllDay:0];
          -[UIScrollView convertPoint:fromView:](self->_weekScroller, "convertPoint:fromView:", v9);
          double v11 = v10;
          [(UIScrollView *)self->_weekScroller contentOffset];
          double v13 = v11 - v12;
          uint64_t v14 = objc_opt_class();
          int64_t v15 = [(WeekViewController *)self viewInterfaceOrientation];
          id v16 = [(MainViewController *)self window];
          [v14 dayWidthForOrientation:v15 withViewInViewHierarchy:v16];
          double v18 = v13 + v17 * 0.5;

          if (v18 >= 0.0)
          {
            [(UIScrollView *)self->_weekScroller bounds];
            if (v18 < v19)
            {

              BOOL v20 = 1;
              goto LABEL_13;
            }
          }
        }
      }
      id v6 = [(NSMutableArray *)obj countByEnumeratingWithState:&v23 objects:v27 count:16];
      if (v6) {
        continue;
      }
      break;
    }
  }
  BOOL v20 = 0;
LABEL_13:

  return v20;
}

- (id)occurrenceViewForEvent:(id)a3
{
  return [(WeekViewController *)self occurrenceViewForEvent:a3 occurrenceDate:0];
}

- (id)occurrenceViewForEvent:(id)a3 occurrenceDate:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  double v8 = [(EKEventGestureController *)self->_eventGestureController currentlySelectedOccurrenceViewSource];
  double v9 = [v8 occurrence];
  unsigned int v10 = [v9 isEqual:v6];

  if (v10)
  {
    id v11 = v8;
  }
  else
  {
    long long v21 = 0u;
    long long v22 = 0u;
    long long v19 = 0u;
    long long v20 = 0u;
    double v12 = self->_visibleWeeks;
    id v13 = [(NSMutableArray *)v12 countByEnumeratingWithState:&v19 objects:v23 count:16];
    if (v13)
    {
      id v14 = v13;
      uint64_t v15 = *(void *)v20;
      while (2)
      {
        for (uint64_t i = 0; i != v14; uint64_t i = (char *)i + 1)
        {
          if (*(void *)v20 != v15) {
            objc_enumerationMutation(v12);
          }
          uint64_t v17 = [*(id *)(*((void *)&v19 + 1) + 8 * i) occurrenceViewForEvent:v6 occurrenceDate:v7];
          if (v17)
          {
            id v11 = (id)v17;

            goto LABEL_13;
          }
        }
        id v14 = [(NSMutableArray *)v12 countByEnumeratingWithState:&v19 objects:v23 count:16];
        if (v14) {
          continue;
        }
        break;
      }
    }

    id v11 = 0;
  }
LABEL_13:

  return v11;
}

- (void)resizeWeekGroupsIfNeededForOrientation:(int64_t)a3
{
  double weekWidth = self->_weekWidth;
  -[WeekViewController weekWidthForOrientation:](self, "weekWidthForOrientation:");
  double v7 = weekWidth - v6;
  if (v7 < 0.0) {
    double v7 = -v7;
  }
  if (v7 >= 0.00100000005)
  {
    [(UIScrollView *)self->_weekScroller contentOffset];
    double v9 = v8 / self->_weekWidth;
    [(WeekViewController *)self weekWidthForOrientation:a3];
    self->_double weekWidth = v10;
    self->_preventScrollUpdates = 1;
    double v11 = v10 * 54080.0;
    [(UIScrollView *)self->_weekScroller contentSize];
    [(UIScrollView *)self->_weekScroller setContentSize:v11];
    self->_preventScrollUpdates = 0;
    NSUInteger location = self->_visibleRange.location;
    long long v33 = 0u;
    long long v34 = 0u;
    long long v35 = 0u;
    long long v36 = 0u;
    id v13 = self->_visibleWeeks;
    id v14 = [(NSMutableArray *)v13 countByEnumeratingWithState:&v33 objects:v38 count:16];
    if (v14)
    {
      id v15 = v14;
      uint64_t v16 = *(void *)v34;
      do
      {
        for (uint64_t i = 0; i != v15; uint64_t i = (char *)i + 1)
        {
          if (*(void *)v34 != v16) {
            objc_enumerationMutation(v13);
          }
          double v18 = *(void **)(*((void *)&v33 + 1) + 8 * i);
          [(WeekViewController *)self _frameForWeek:(char *)i + location];
          [v18 setFrame:];
          [v18 setNeedsLayout];
        }
        id v15 = [(NSMutableArray *)v13 countByEnumeratingWithState:&v33 objects:v38 count:16];
        location += (NSUInteger)i;
      }
      while (v15);
    }

    double v19 = v9 * self->_weekWidth;
    id v20 = [(WeekViewController *)self visibleRangeForOffset:v19];
    if (v21 == self->_visibleRange.length)
    {
      self->_visibleRange.NSUInteger location = (NSUInteger)v20;
      self->_visibleRange.NSUInteger length = v21;
    }
    [(UIScrollView *)self->_weekScroller contentOffset];
    [(UIScrollView *)self->_weekScroller setContentOffset:v19];
    long long v31 = 0u;
    long long v32 = 0u;
    long long v29 = 0u;
    long long v30 = 0u;
    long long v22 = self->_visibleWeeks;
    id v23 = [(NSMutableArray *)v22 countByEnumeratingWithState:&v29 objects:v37 count:16];
    if (v23)
    {
      id v24 = v23;
      uint64_t v25 = *(void *)v30;
      do
      {
        for (j = 0; j != v24; j = (char *)j + 1)
        {
          if (*(void *)v30 != v25) {
            objc_enumerationMutation(v22);
          }
          CGRect v27 = [*(id *)(*((void *)&v29 + 1) + 8 * (void)j) weekView];
          id v28 = [v27 content];
          [v28 setNeedsLayout];
        }
        id v24 = [(NSMutableArray *)v22 countByEnumeratingWithState:&v29 objects:v37 count:16];
      }
      while (v24);
    }
  }
}

- (id)_daysToShiftFromSelectedDateToBeginningOfWeekIfShowingFullWeek:(id)a3
{
  id v4 = a3;
  if ((id)[(WeekViewController *)self daysInWeek] == (id)7)
  {
    [v4 calendarDateByAddingDays:1 - [v4 dayOfWeek]];
    id v5 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    id v5 = v4;
  }
  double v6 = v5;

  return v6;
}

- (void)viewSwitcherSwitchedToViewWithDate:(id)a3
{
  id v5 = [(WeekViewController *)self _daysToShiftFromSelectedDateToBeginningOfWeekIfShowingFullWeek:a3];
  id v4 = [(WeekViewController *)self model];
  [v4 setSelectedDate:v5];
}

- (void)_sceneEnteredForeground:(id)a3
{
  id v8 = [a3 object];
  id v4 = [(WeekViewController *)self model];
  id v5 = [v4 sceneIdentifier];
  double v6 = [v8 _sceneIdentifier];
  if ([v5 isEqualToString:v6])
  {
    int64_t v7 = [(WeekViewController *)self savedFirstVisibleSecond];

    if (v7 < 0) {
      goto LABEL_6;
    }
    [(WeekViewController *)self setFirstVisibleSecond:[(WeekViewController *)self savedFirstVisibleSecond]];
    id v4 = [(NSMutableArray *)self->_visibleWeeks firstObject];
    [(WeekViewController *)self synchronizeWeekGroupScrollingToWeek:v4];
  }
  else
  {
  }
LABEL_6:
  if (self->_needsReload) {
    [(WeekViewController *)self reloadData];
  }
}

- (int64_t)savedFirstVisibleSecond
{
  if (EKUIShouldSaveStateInPreferences()) {
    return -1;
  }
  id v4 = [(WeekViewController *)self model];
  id v5 = [v4 persistedSceneState];
  id v6 = [v5 weekViewFirstVisibleSecond];

  return (int64_t)v6;
}

- (void)weekGroupViewFirstVisibleSecondChanged:(int64_t)a3
{
  id v5 = [(MainViewController *)self window];
  id v6 = [v5 windowScene];
  id v7 = [v6 activationState];

  if (!v7)
  {
    [(WeekViewController *)self saveFirstVisibleSecond:a3];
  }
}

- (void)saveFirstVisibleSecond:(int64_t)a3
{
  if ((EKUIShouldSaveStateInPreferences() & 1) == 0)
  {
    id v6 = [(WeekViewController *)self model];
    id v5 = [v6 persistedSceneState];
    [v5 setWeekViewFirstVisibleSecond:a3];
  }
}

- (id)_selectedOccurrenceViews
{
  return self->_selectedOccurrenceViews;
}

- (void)_updateSelectedViewsToMatchModel
{
  [(WeekViewController *)self _clearSelectedOccurrenceViewsUpdatingModel:0];
  double v3 = [(WeekViewController *)self model];
  id v4 = [v3 selectedOccurrences];
  id v5 = [(EKEventGestureController *)self->_eventGestureController event];
  unsigned __int8 v6 = [v4 containsObject:v5];

  if ((v6 & 1) == 0) {
    [(EKEventGestureController *)self->_eventGestureController endForcedStart:0];
  }
  id v8 = [(WeekViewController *)self model];
  id v7 = [v8 selectedOccurrences];
  [(WeekViewController *)self _selectEvents:v7 updatingModel:0];
}

- (void)cleanupSelectionState
{
  double v3 = [(EKEventGestureController *)self->_eventGestureController event];
  id v4 = [(EKEventGestureController *)self->_eventGestureController occurrenceDate];
  [(WeekViewController *)self undimOccurrence:v3 occurrenceDate:v4];

  [(WeekViewController *)self _clearSelectedOccurrenceViews];
  id v5 = [(WeekViewController *)self eventGestureController];
  [v5 endForcedStart:0];
}

- (void)_clearSelectedOccurrenceViews
{
}

- (void)_clearSelectedOccurrenceViewsUpdatingModel:(BOOL)a3
{
  BOOL v3 = a3;
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  id v5 = [(NSMutableArray *)self->_selectedOccurrenceViews copy];
  id v6 = [v5 countByEnumeratingWithState:&v10 objects:v14 count:16];
  if (v6)
  {
    id v7 = v6;
    uint64_t v8 = *(void *)v11;
    do
    {
      double v9 = 0;
      do
      {
        if (*(void *)v11 != v8) {
          objc_enumerationMutation(v5);
        }
        [(WeekViewController *)self _deselectOccurrenceView:*(void *)(*((void *)&v10 + 1) + 8 * (void)v9) updatingModel:v3];
        double v9 = (char *)v9 + 1;
      }
      while (v7 != v9);
      id v7 = [v5 countByEnumeratingWithState:&v10 objects:v14 count:16];
    }
    while (v7);
  }
}

- (void)_selectEvents:(id)a3 updatingModel:(BOOL)a4
{
  BOOL v4 = a4;
  id v6 = a3;
  id v7 = objc_opt_new();
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  id v8 = v6;
  id v9 = [v8 countByEnumeratingWithState:&v15 objects:v19 count:16];
  if (v9)
  {
    id v10 = v9;
    uint64_t v11 = *(void *)v16;
    do
    {
      long long v12 = 0;
      do
      {
        if (*(void *)v16 != v11) {
          objc_enumerationMutation(v8);
        }
        long long v13 = -[WeekViewController occurrenceViewForEvent:occurrenceDate:](self, "occurrenceViewForEvent:occurrenceDate:", *(void *)(*((void *)&v15 + 1) + 8 * (void)v12), 0, (void)v15);
        id v14 = v13;
        if (v13 && ([v13 isSelectedCopyView] & 1) == 0)
        {
          if (([v7 containsObject:v14] & 1) == 0) {
            [(WeekViewController *)self _selectOccurrenceView:v14 updatingModel:v4];
          }
          [v7 addObject:v14];
        }

        long long v12 = (char *)v12 + 1;
      }
      while (v10 != v12);
      id v10 = [v8 countByEnumeratingWithState:&v15 objects:v19 count:16];
    }
    while (v10);
  }
}

- (void)_selectOccurrenceView:(id)a3
{
}

- (void)_selectOccurrenceView:(id)a3 updatingModel:(BOOL)a4
{
  BOOL v4 = a4;
  id v7 = a3;
  id v21 = v7;
  if (!self->_selectedOccurrenceViews)
  {
    id v8 = +[NSMutableArray array];
    selectedOccurrenceViews = self->_selectedOccurrenceViews;
    self->_selectedOccurrenceViews = v8;

    id v7 = v21;
  }
  if (!self->_selectedOccurrencesFrontmostClonedViews)
  {
    id v10 = +[NSMutableArray array];
    selectedOccurrencesFrontmostClonedViews = self->_selectedOccurrencesFrontmostClonedViews;
    self->_selectedOccurrencesFrontmostClonedViews = v10;

    id v7 = v21;
  }
  if (v7)
  {
    long long v12 = [v21 selectedCopy];

    id v7 = v21;
    if (!v12)
    {
      long long v13 = [v21 selectedCopy];

      if (v13)
      {
        double v19 = +[NSAssertionHandler currentHandler];
        [v19 handleFailureInMethod:a2 object:self file:@"WeekViewController.m" lineNumber:3494 description:@"View to select already has a selected copy view"];
      }
      if ([v21 isSelectedCopyView])
      {
        id v20 = +[NSAssertionHandler currentHandler];
        [v20 handleFailureInMethod:a2 object:self file:@"WeekViewController.m" lineNumber:3495 description:@"View to select was a selected copy view"];
      }
      id v14 = [v21 copy];
      [v14 setSelected:1];
      [v14 requestContentIfNeeded:16 completion:0];
      [v14 setIsSelectedCopyView:1];
      [(NSMutableArray *)self->_selectedOccurrencesFrontmostClonedViews addObject:v14];
      long long v15 = [v21 superview];
      [v15 addSubview:v14];

      long long v16 = [v21 superview];
      [v16 bringSubviewToFront:v14];

      [v21 setSelectedCopy:v14];
      [v21 setSelected:1];
      [v21 setHidden:1];
      [(NSMutableArray *)self->_selectedOccurrenceViews addObject:v21];
      if (v4)
      {
        long long v17 = [(WeekViewController *)self model];
        long long v18 = [v21 occurrences];
        [v17 selectOccurrences:v18];
      }
      id v7 = v21;
    }
  }
}

- (void)_deselectOccurrenceView:(id)a3
{
}

- (void)_deselectOccurrenceView:(id)a3 updatingModel:(BOOL)a4
{
  BOOL v4 = a4;
  id v10 = a3;
  id v6 = [v10 selectedCopy];
  [(NSMutableArray *)self->_selectedOccurrencesFrontmostClonedViews removeObject:v6];
  [v6 removeFromSuperview];
  [(NSMutableArray *)self->_selectedOccurrenceViews removeObject:v10];
  id v7 = [v10 occurrence];

  if (v7)
  {
    [v10 setSelectedCopy:0];
    [v10 setSelected:0];
    [v10 requestContentIfNeeded:16 completion:0];
    [v10 setHidden:0];
  }
  if (v4)
  {
    id v8 = [(WeekViewController *)self model];
    id v9 = [v10 occurrences];
    [v8 deselectOccurrences:v9];
  }
}

- (id)pasteboardManager
{
  v2 = [(WeekViewController *)self model];
  BOOL v3 = [v2 pasteboardManager];

  return v3;
}

- (BOOL)eventViewDelegateShouldShowNextOccurrenceOfEvent:(id)a3 forward:(BOOL)a4
{
  if (a4) {
    [a3 nextOccurrence];
  }
  else {
  BOOL v4 = [a3 previousOccurrence];
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
    id v9 = [v7 startCalendarDate];
    [(WeekViewController *)self selectDate:v9 animated:1];

    [(WeekViewController *)self showEvent:v8 animated:1 showMode:0 context:0];
  }
}

- (BOOL)eventViewControllerShouldShowNextPreviousRecurrenceButtons
{
  return 1;
}

- (void)eventViewControllerNextButtonWasTapped:(id)a3
{
  id v7 = a3;
  BOOL v4 = [v7 event];
  id v5 = [v4 nextOccurrence];

  if (v5)
  {
    [(WeekViewController *)self eventViewController:v7 didCompleteWithAction:0];
    id v6 = [v7 context];
    [(WeekViewController *)self showEvent:v5 animated:1 showMode:1 context:v6];
  }
}

- (void)eventViewControllerPreviousButtonWasTapped:(id)a3
{
  id v7 = a3;
  BOOL v4 = [v7 event];
  id v5 = [v4 previousOccurrence];

  if (v5)
  {
    [(WeekViewController *)self eventViewController:v7 didCompleteWithAction:0];
    id v6 = [v7 context];
    [(WeekViewController *)self showEvent:v5 animated:1 showMode:1 context:v6];
  }
}

- (void)eventViewController:(id)a3 requestsShowEvent:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  [(WeekViewController *)self eventViewController:v7 didCompleteWithAction:0];
  id v8 = [v7 context];

  [(WeekViewController *)self showEvent:v6 animated:1 showMode:1 context:v8];
}

- (void)eventEditViewController:(id)a3 didCompleteWithAction:(int64_t)a4
{
}

- (void)eventEditViewController:(id)a3 didCompleteWithAction:(int64_t)a4 completionHandler:(id)a5
{
  id v6 = a5;
  id v7 = v6;
  if (v6)
  {
    id v10 = _NSConcreteStackBlock;
    uint64_t v11 = 3221225472;
    long long v12 = sub_1000904B0;
    long long v13 = &unk_1001D2808;
    id v14 = self;
    id v15 = v6;
    id v8 = objc_retainBlock(&v10);
  }
  else
  {
    id v8 = 0;
  }
  id v9 = [(WeekViewController *)self navigationController];
  [v9 dismissViewControllerAnimated:1 completion:v8];
}

- (id)calendarModel
{
  return self->super._model;
}

- (void)pasteboardManager:(id)a3 presentAlert:(id)a4
{
  id v5 = a4;
  id v6 = [(WeekViewController *)self currentPresentationController];
  [v5 presentFromSource:v6];
}

- (void)pasteboardManager:(id)a3 beginEditingEvent:(id)a4
{
}

- (void)pasteboardManager:(id)a3 didFinishPasteWithResult:(unint64_t)a4 willOpenEditor:(BOOL)a5
{
  if (!a4 && !a5) {
    [(MainViewController *)self attemptDisplayReviewPrompt];
  }
}

- (void)_logUserStateDiagnostics:(id)a3
{
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_1000905D0;
  block[3] = &unk_1001D2740;
  block[4] = self;
  dispatch_async((dispatch_queue_t)&_dispatch_main_q, block);
}

- (unint64_t)_dateModeForAllDay:(BOOL)a3
{
  return !a3;
}

- (BOOL)interaction:(id)a3 shouldShowMenuAtPoint:(CGPoint)a4 inView:(id)a5
{
  return 1;
}

- (BOOL)interaction:(id)a3 canPasteEventAtPoint:(CGPoint)a4 inView:(id)a5
{
  id v5 = [(WeekViewController *)self model];
  id v6 = [v5 pasteboardManager];
  unsigned __int8 v7 = [v6 canPerformPaste];

  return v7;
}

- (BOOL)interaction:(id)a3 canCreateEventAtPoint:(CGPoint)a4 inView:(id)a5
{
  id v5 = [(WeekViewController *)self model];
  id v6 = [v5 defaultCalendarForNewEvents];
  BOOL v7 = v6 != 0;

  return v7;
}

- (BOOL)interaction:(id)a3 canCreateReminderAtPoint:(CGPoint)a4 inView:(id)a5
{
  id v5 = [(WeekViewController *)self model];
  id v6 = [v5 reminderCalendar];
  BOOL v7 = v6 != 0;

  return v7;
}

- (void)interaction:(id)a3 createEventAtPoint:(CGPoint)a4 inView:(id)a5
{
}

- (void)interaction:(id)a3 createReminderAtPoint:(CGPoint)a4 inView:(id)a5
{
}

- (void)createEvent:(BOOL)a3 atPoint:(CGPoint)a4 inView:(id)a5
{
  BOOL v5 = a3;
  -[UIScrollView convertPoint:fromView:](self->_weekScroller, "convertPoint:fromView:", a5, a4.x, a4.y);
  unsigned __int8 v21 = 0;
  BOOL v7 = -[WeekViewController dateAtPoint:isAllDay:](self, "dateAtPoint:isAllDay:", &v21);
  if (v5)
  {
    id v8 = [(WeekViewController *)self _newEvent];
  }
  else
  {
    id v9 = [(WeekViewController *)self model];
    id v10 = [v9 eventStore];
    id v8 = +[EKEvent eventWithEventStore:v10];

    uint64_t v11 = [(WeekViewController *)self model];
    long long v12 = [v11 reminderCalendar];
    [v8 setCalendar:v12];
  }
  long long v13 = [v7 date];
  [v13 timeIntervalSinceReferenceDate];
  CalSnapDateTo15MinuteInterval();
  double v15 = v14;

  long long v16 = +[NSDate dateWithTimeIntervalSinceReferenceDate:v15];
  [v8 setStartDate:v16];
  if (v5)
  {
    double v17 = 3600.0;
    if (v21) {
      double v17 = 1.0;
    }
    long long v18 = [v16 dateByAddingTimeInterval:v17];
    [v8 setEndDateUnadjustedForLegacyClients:v18];
  }
  else
  {
    [v8 setEndDateUnadjustedForLegacyClients:v16];
  }
  if (v21) {
    [v8 setAllDay:1];
  }
  [(EKEventGestureController *)self->_eventGestureController forceStartWithOccurrence:v8 occurrenceDate:v7 shouldUpdateViewSource:1 shouldUpdateOrigin:1 shouldPresentEditMenu:0];
  eventGestureController = self->_eventGestureController;
  id v20 = [v7 date];
  [v20 timeIntervalSinceReferenceDate];
  -[WeekViewController eventGestureController:didCommitOccurrence:toDate:isAllDay:span:](self, "eventGestureController:didCommitOccurrence:toDate:isAllDay:span:", eventGestureController, v8, v21, 0);
}

- (void)interaction:(id)a3 pasteEventAtPoint:(CGPoint)a4 inView:(id)a5
{
  -[UIScrollView convertPoint:fromView:](self->_weekScroller, "convertPoint:fromView:", a5, a4.x, a4.y);
  unsigned __int8 v10 = 0;
  id v6 = -[WeekViewController dateAtPoint:isAllDay:](self, "dateAtPoint:isAllDay:", &v10);
  BOOL v7 = [(CUIKCalendarModel *)self->super._model pasteboardManager];
  id v8 = [v6 date];
  [v7 setDateForPaste:v8];

  id v9 = [(CUIKCalendarModel *)self->super._model pasteboardManager];
  [v9 pasteEventsWithDateMode:[self _dateModeForAllDay:v10] delegate:self];
}

- (id)interaction:(id)a3 titleForPasteActionAtPoint:(CGPoint)a4 inView:(id)a5
{
  -[UIScrollView convertPoint:fromView:](self->_weekScroller, "convertPoint:fromView:", a5, a4.x, a4.y);
  char v12 = 0;
  id v6 = -[WeekViewController dateAtPoint:isAllDay:](self, "dateAtPoint:isAllDay:", &v12);
  BOOL v7 = [(WeekViewController *)self model];
  id v8 = [v7 pasteboardManager];
  id v9 = [v8 numberOfEventsToPaste];

  unsigned __int8 v10 = +[EKUIRightClickEmptySpaceInteraction localizedPasteStringForEventCount:v9 includeHere:v12 == 0];

  return v10;
}

- (id)interaction:(id)a3 subtitleForPasteActionAtPoint:(CGPoint)a4 inView:(id)a5
{
  -[UIScrollView convertPoint:fromView:](self->_weekScroller, "convertPoint:fromView:", a5, a4.x, a4.y);
  unsigned __int8 v15 = 0;
  id v6 = -[WeekViewController dateAtPoint:isAllDay:](self, "dateAtPoint:isAllDay:", &v15);
  BOOL v7 = [v6 date];

  id v8 = CUIKCalendar();
  id v9 = +[CUIKPasteboardUtilities roundedDateForDate:v7 dateMode:[(WeekViewController *)self _dateModeForAllDay:v15] calendar:v8];

  id v10 = objc_alloc_init((Class)NSDateFormatter);
  [v10 setCalendar:v8];
  uint64_t v11 = [v8 timeZone];
  [v10 setTimeZone:v11];

  [v10 setDoesRelativeDateFormatting:1];
  BOOL v12 = v15 == 0;
  [v10 setDateStyle:1];
  [v10 setTimeStyle:v12];
  long long v13 = [v10 stringFromDate:v9];

  return v13;
}

- (void)dayOccurrenceViewSelected:(id)a3 source:(unint64_t)a4
{
  id v6 = a3;
  if (a4 == 1)
  {
    id v11 = v6;
    BOOL v7 = [(CUIKCalendarModel *)self->super._model selectedOccurrences];
    id v8 = [v11 occurrence];
    unsigned __int8 v9 = [v7 containsObject:v8];

    id v6 = v11;
    if ((v9 & 1) == 0)
    {
      id v10 = [v11 occurrence];
      [(CUIKCalendarModel *)self->super._model setSelectedOccurrence:v10];

      id v6 = v11;
    }
  }
}

- (BOOL)dropInteraction:(id)a3 canHandleSession:(id)a4
{
  return 1;
}

- (void)dropInteraction:(id)a3 sessionDidEnter:(id)a4
{
  if (!self->_timeBarDropScrollTimer)
  {
    BOOL v5 = +[NSTimer timerWithTimeInterval:self target:"_timeBarDropScrollTimerFired:" selector:0 userInfo:1 repeats:0.003];
    timeBarDropScrollTimer = self->_timeBarDropScrollTimer;
    self->_timeBarDropScrollTimer = v5;

    id v7 = +[NSRunLoop currentRunLoop];
    [v7 addTimer:self->_timeBarDropScrollTimer forMode:NSDefaultRunLoopMode];
  }
}

- (void)_timeBarDropScrollTimerFired:(id)a3
{
  [(UIScrollView *)self->_weekScroller contentOffset];
  double v5 = v4;
  double v7 = v6;
  int IsLeftToRight = CalInterfaceIsLeftToRight();
  double v9 = 1.0;
  if (IsLeftToRight) {
    double v9 = -1.0;
  }
  double v10 = v5 + v9;
  weekScroller = self->_weekScroller;

  -[UIScrollView setContentOffset:animated:](weekScroller, "setContentOffset:animated:", 0, v10, v7);
}

- (void)dropInteraction:(id)a3 sessionDidExit:(id)a4
{
}

- (void)dropInteraction:(id)a3 sessionDidEnd:(id)a4
{
}

- (void)cancelTimeBarDropScrollTimerAndScrollToNearestDate
{
  [(NSTimer *)self->_timeBarDropScrollTimer invalidate];
  timeBarDropScrollTimer = self->_timeBarDropScrollTimer;
  self->_timeBarDropScrollTimer = 0;

  [(WeekViewController *)self updateDisplayedDateForCurrentScrollOffset];

  [(WeekViewController *)self scrollToDisplayedDateAnimated:1];
}

- (WeekViewControllerDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  return (WeekViewControllerDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (BOOL)receiveTapsInHeader
{
  return self->_receiveTapsInHeader;
}

- (double)weekViewHourHeightScale
{
  return self->_weekViewHourHeightScale;
}

- (void)setWeekViewHourHeightScale:(double)a3
{
  self->_double weekViewHourHeightScale = a3;
}

- (BOOL)rotatingToPortrait
{
  return self->_rotatingToPortrait;
}

- (void)setRotatingToPortrait:(BOOL)a3
{
  self->_rotatingToPortrait = a3;
}

- (BOOL)rotatingToLandscape
{
  return self->_rotatingToLandscape;
}

- (void)setRotatingToLandscape:(BOOL)a3
{
  self->_rotatingToLandscape = a3;
}

- (EKEventGestureController)eventGestureController
{
  return self->_eventGestureController;
}

- (BOOL)showOverlayCalendar
{
  return self->_showOverlayCalendar;
}

- (NSMutableArray)visibleWeeks
{
  return self->_visibleWeeks;
}

- (void)setVisibleWeeks:(id)a3
{
}

- (NSMutableArray)reusableViews
{
  return self->_reusableViews;
}

- (void)setReusableViews:(id)a3
{
}

- (WeekTimeView)timeView
{
  return self->_timeView;
}

- (void)setTimeView:(id)a3
{
}

- (BOOL)displaysDatesSnappedToWeekBoundaries
{
  return self->_displaysDatesSnappedToWeekBoundaries;
}

- (void)setDisplaysDatesSnappedToWeekBoundaries:(BOOL)a3
{
  self->_displaysDatesSnappedToWeekBoundaries = a3;
}

- (int64_t)orientation
{
  return self->_orientation;
}

- (void)setOrientation:(int64_t)a3
{
  self->_orientation = a3;
}

- (EKCalendarDate)referenceWeekStart
{
  return self->_referenceWeekStart;
}

- (void)setReferenceWeekStart:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_timeView, 0);
  objc_storeStrong((id *)&self->_reusableViews, 0);
  objc_storeStrong((id *)&self->_visibleWeeks, 0);
  objc_storeStrong((id *)&self->_eventGestureController, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_timeBarDropScrollTimer, 0);
  objc_storeStrong((id *)&self->_timeBarDropInteraction, 0);
  objc_storeStrong((id *)&self->_eventCreationController, 0);
  objc_storeStrong((id *)&self->_selectedOccurrencesFrontmostClonedViews, 0);
  objc_storeStrong((id *)&self->_selectedOccurrenceViews, 0);
  objc_storeStrong((id *)&self->_titleIntervalDateFormatter, 0);
  objc_storeStrong((id *)&self->_previousGestureDate, 0);
  objc_storeStrong((id *)&self->_timeMarkerTimer, 0);
  objc_storeStrong((id *)&self->_allDayDividerLineView, 0);
  objc_storeStrong((id *)&self->_weekScroller, 0);
  objc_storeStrong((id *)&self->_cachedLatestDate, 0);
  objc_storeStrong((id *)&self->_cachedEarliestDate, 0);
  objc_storeStrong((id *)&self->_reloadDateRangeEnd, 0);
  objc_storeStrong((id *)&self->_reloadDateRangeStart, 0);
  objc_storeStrong((id *)&self->_proposedTimeView, 0);
  objc_storeStrong((id *)&self->_referenceWeekStart, 0);

  objc_storeStrong((id *)&self->_displayedDate, 0);
}

- (int64_t)intendedSizeClass
{
  return 0;
}

- (double)headerVerticalOffset
{
  return 0.0;
}

@end