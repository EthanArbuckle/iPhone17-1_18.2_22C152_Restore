@interface ListViewController
- (BOOL)_isVisible;
- (BOOL)_processScrollingMessagesOnEveryFrameFromListViewController;
- (BOOL)_rowDrawsBackground:(id)a3;
- (BOOL)_selectedDateIsVisible;
- (BOOL)allowExtendedHeightCells;
- (BOOL)allowsOverriddenRightNavigationBarItems;
- (BOOL)allowsOverriddenToolbarItems;
- (BOOL)canPerformAction:(SEL)a3 withSender:(id)a4;
- (BOOL)eventViewControllerShouldShowNextPreviousRecurrenceButtons;
- (BOOL)eventViewDelegateShouldShowNextOccurrenceOfEvent:(id)a3 forward:(BOOL)a4;
- (BOOL)gestureRecognizerShouldBegin:(id)a3;
- (BOOL)hasContent;
- (BOOL)isTodayVisible;
- (BOOL)overrideExtendedEdges;
- (BOOL)preventScrollingForNextViewAppear;
- (BOOL)shouldAutoScrollToSelectedDateAfterFirstRefresh;
- (BOOL)shouldPreserveDateAcrossRefresh;
- (BOOL)shouldPushNextLevelViewControllerWhenTodayIsVisible;
- (BOOL)shouldUpdateModelSelectedDate;
- (BOOL)showEventDetailsWhenNewEventAdded;
- (BOOL)showFilteredData;
- (BOOL)showScrubber;
- (BOOL)tableView:(id)a3 wantsHeaderForSection:(int64_t)a4;
- (BOOL)toolbarVisibleInSplitBehavior:(int64_t)a3;
- (CGSize)scrubberCellSize;
- (EKEvent)currentSelectedEvent;
- (ListTableView)tableView;
- (ListViewController)initWithModel:(id)a3 window:(id)a4;
- (ListViewControllerDelegate)delegate;
- (NSString)description;
- (UITableView)tableViewForTesting;
- (double)contentInset;
- (id)_dateForFirstVisibleRow;
- (id)_eventForRowAtIndexPath:(id)a3;
- (id)_indexPathForDate:(id)a3;
- (id)backButtonTitleForEventDetails;
- (id)bestDateForNewEvent;
- (id)calendarModel;
- (id)cellFactory;
- (id)contentUnavailableConfigurationForState:(id)a3;
- (id)defaultEventForSelectedDate;
- (id)pasteboardManager;
- (id)sceneTitle;
- (id)tableView:(id)a3 cellForRowAtIndexPath:(id)a4;
- (id)tableView:(id)a3 contextMenuConfigurationForRowAtIndexPath:(id)a4 point:(CGPoint)a5;
- (id)tableView:(id)a3 previewForDismissingContextMenuWithConfiguration:(id)a4;
- (id)tableView:(id)a3 viewForHeaderInSection:(int64_t)a4;
- (int64_t)numberOfSectionsInTableView:(id)a3;
- (int64_t)tableView:(id)a3 editingStyleForRowAtIndexPath:(id)a4;
- (int64_t)tableView:(id)a3 numberOfRowsInSection:(int64_t)a4;
- (unint64_t)destination;
- (void)_addAllObservers;
- (void)_clearSwipedRow;
- (void)_contentCategorySizeChangedNotification:(id)a3;
- (void)_deleteEventAtIndexPath:(id)a3 withCompletionHandler:(id)a4;
- (void)_deselectAllSelectedRowsAnimated:(BOOL)a3;
- (void)_deselectRowAtIndexPath:(id)a3 animated:(BOOL)a4;
- (void)_localeChanged:(id)a3;
- (void)_multiSelect:(id)a3;
- (void)_selectRowAtIndexPath:(id)a3 animated:(BOOL)a4 scrollPosition:(int64_t)a5;
- (void)_selectTodayDate;
- (void)_selectedOccurrencesChanged:(id)a3;
- (void)_setTopVisibleDateAsSelectedDate;
- (void)_showEvent:(id)a3 viewController:(id)a4 animated:(BOOL)a5 showComments:(BOOL)a6 modal:(BOOL)a7;
- (void)_timeChangedSignificantly:(id)a3;
- (void)_updateBackButtonOnBackViewControllerToDate:(id)a3;
- (void)_updateContentUnavailableConfigurationUsingState:(id)a3;
- (void)_updatePaletteWeekDayHeaderDayFrames;
- (void)_updateSeparatorVisibilityForOccurrenceCell:(id)a3 atIndexPath:(id)a4;
- (void)_updateSeparatorVisibilityForRowAtIndexPath:(id)a3;
- (void)_weekNumberChanged:(id)a3;
- (void)copy:(id)a3;
- (void)cut:(id)a3;
- (void)dayNavigationViewController:(id)a3 didSelectDate:(id)a4;
- (void)dealloc;
- (void)eventEditViewController:(id)a3 didCompleteWithAction:(int64_t)a4;
- (void)eventEditViewController:(id)a3 didCompleteWithAction:(int64_t)a4 completionHandler:(id)a5;
- (void)eventIconButtonPressed:(id)a3;
- (void)eventViewController:(id)a3 didCompleteWithAction:(int64_t)a4;
- (void)eventViewController:(id)a3 requestsShowEvent:(id)a4;
- (void)eventViewController:(id)a3 willDismissEditViewController:(id)a4 deleted:(BOOL)a5;
- (void)eventViewControllerNextButtonWasTapped:(id)a3;
- (void)eventViewControllerPreviousButtonWasTapped:(id)a3;
- (void)eventViewControllerWillDisappear:(id)a3;
- (void)eventViewDelegateShowNextOccurrenceOfEvent:(id)a3 forward:(BOOL)a4;
- (void)loadView;
- (void)paste:(id)a3;
- (void)pasteboardManager:(id)a3 beginEditingEvent:(id)a4;
- (void)pasteboardManager:(id)a3 didFinishPasteWithResult:(unint64_t)a4 willOpenEditor:(BOOL)a5;
- (void)pasteboardManager:(id)a3 presentAlert:(id)a4;
- (void)refresh;
- (void)refreshIfNeeded;
- (void)scrollToDate:(id)a3 animated:(BOOL)a4;
- (void)scrollToSelectedDateAnimated:(BOOL)a3;
- (void)scrollToTodayAnimated:(BOOL)a3;
- (void)scrollViewDidEndDecelerating:(id)a3;
- (void)scrollViewDidEndDragging:(id)a3 willDecelerate:(BOOL)a4;
- (void)scrollViewWillBeginDragging:(id)a3;
- (void)selectDate:(id)a3 animated:(BOOL)a4;
- (void)selectEvent:(id)a3 animated:(BOOL)a4;
- (void)setAllowExtendedHeightCells:(BOOL)a3;
- (void)setCurrentSelectedEvent:(id)a3;
- (void)setDelegate:(id)a3;
- (void)setDestination:(unint64_t)a3;
- (void)setNeedsRefresh:(BOOL)a3;
- (void)setOverrideExtendedEdges:(BOOL)a3;
- (void)setPreventScrollingForNextViewAppear:(BOOL)a3;
- (void)setSelectedDateAndFirstVisibleHeaderDate:(id)a3;
- (void)setShowFilteredData:(BOOL)a3;
- (void)setShowScrubber:(BOOL)a3;
- (void)setTableView:(id)a3;
- (void)setUpViewConstraints;
- (void)showEvent:(id)a3 animated:(BOOL)a4 showMode:(unint64_t)a5 context:(id)a6;
- (void)showViewController:(id)a3 sender:(id)a4 animated:(BOOL)a5 completion:(id)a6;
- (void)tableView:(id)a3 commitEditingStyle:(int64_t)a4 forRowAtIndexPath:(id)a5;
- (void)tableView:(id)a3 didDeselectRowAtIndexPath:(id)a4;
- (void)tableView:(id)a3 didEndDisplayingHeaderView:(id)a4 forSection:(int64_t)a5;
- (void)tableView:(id)a3 didSelectRowAtIndexPath:(id)a4;
- (void)tableView:(id)a3 willDisplayHeaderView:(id)a4 forSection:(int64_t)a5;
- (void)tableView:(id)a3 willEndContextMenuInteractionWithConfiguration:(id)a4 animator:(id)a5;
- (void)tableView:(id)a3 willPerformPreviewActionForMenuWithConfiguration:(id)a4 animator:(id)a5;
- (void)updatePalette:(id)a3;
- (void)updateSeparatorVisibiltyForSelectionChangeForRowAtIndexPath:(id)a3;
- (void)updateUIToTopHeaderDate;
- (void)viewDidAppear:(BOOL)a3;
- (void)viewDidDisappear:(BOOL)a3;
- (void)viewWillAppear:(BOOL)a3;
- (void)viewWillDisappear:(BOOL)a3;
@end

@implementation ListViewController

- (ListViewController)initWithModel:(id)a3 window:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if (!v6)
  {
    id v12 = +[NSException exceptionWithName:NSInvalidArgumentException reason:@"Non-nil 'model' required." userInfo:0];
    objc_exception_throw(v12);
  }
  v8 = v7;
  v13.receiver = self;
  v13.super_class = (Class)ListViewController;
  v9 = [(MainViewController *)&v13 initWithWindow:v7 model:v6];
  v10 = v9;
  if (v9)
  {
    v9->_needsRefresh = 1;
    v9->_overrideExtendedEdges = 1;
  }

  return v10;
}

- (NSString)description
{
  id v3 = objc_alloc((Class)CalDescriptionBuilder);
  v9.receiver = self;
  v9.super_class = (Class)ListViewController;
  v4 = [(ListViewController *)&v9 description];
  id v5 = [v3 initWithSuperclassDescription:v4];

  id v6 = [(MainViewController *)self model];
  [v5 setKey:@"model" withObject:v6];

  id v7 = [v5 build];

  return (NSString *)v7;
}

- (void)dealloc
{
  id v3 = [(ListViewController *)self tableView];
  [v3 setDelegate:0];

  v4.receiver = self;
  v4.super_class = (Class)ListViewController;
  [(MainViewController *)&v4 dealloc];
}

- (void)loadView
{
  v26.receiver = self;
  v26.super_class = (Class)ListViewController;
  [(ListViewController *)&v26 loadView];
  if ([(ListViewController *)self overrideExtendedEdges]) {
    [(ListViewController *)self setEdgesForExtendedLayout:0];
  }
  if (!self->_dateToShowWhenVisible)
  {
    id v3 = CUIKTodayDate();
    objc_super v4 = [(MainViewController *)self model];
    id v5 = [v4 calendar];
    id v6 = [v5 timeZone];
    id v7 = +[EKCalendarDate calendarDateWithDate:v3 timeZone:v6];
    dateToShowWhenVisible = self->_dateToShowWhenVisible;
    self->_dateToShowWhenVisible = v7;
  }
  objc_super v9 = -[ListTableView initWithFrame:style:]([ListTableView alloc], "initWithFrame:style:", 0, CGRectZero.origin.x, CGRectZero.origin.y, CGRectZero.size.width, CGRectZero.size.height);
  [(ListTableView *)v9 setDelegate:self];
  [(ListTableView *)v9 setDataSource:self];
  [(ListTableView *)v9 _setMarginWidth:0.0];
  [(ListTableView *)v9 setSectionHeaderHeight:UITableViewAutomaticDimension];
  [(ListTableView *)v9 setRowHeight:UITableViewAutomaticDimension];
  [(ListTableView *)v9 setShowsHorizontalScrollIndicator:0];
  [(ListTableView *)v9 setShowsVerticalScrollIndicator:0];
  [(ListTableView *)v9 setScrollsToTop:0];
  [(ListTableView *)v9 setAllowsFocus:0];
  [(ListTableView *)v9 setAllowsMultipleSelection:1];
  [(ListTableView *)v9 registerClass:objc_opt_class() forHeaderFooterViewReuseIdentifier:@"ListViewSectionHeaderView"];
  uint64_t v10 = objc_opt_class();
  v11 = (objc_class *)objc_opt_class();
  id v12 = NSStringFromClass(v11);
  [(ListTableView *)v9 registerClass:v10 forCellReuseIdentifier:v12];

  uint64_t v13 = objc_opt_class();
  v14 = (objc_class *)objc_opt_class();
  v15 = NSStringFromClass(v14);
  [(ListTableView *)v9 registerClass:v13 forCellReuseIdentifier:v15];

  uint64_t v16 = objc_opt_class();
  v17 = (objc_class *)objc_opt_class();
  v18 = NSStringFromClass(v17);
  [(ListTableView *)v9 registerClass:v16 forCellReuseIdentifier:v18];

  if ((id)[(ListViewController *)self destination] == (id)2)
  {
    v19 = +[UIColor secondarySystemBackgroundColor];
    [(ListTableView *)v9 setBackgroundColor:v19];
  }
  [(ListViewController *)self setTableView:v9];
  v20 = (UITapGestureRecognizer *)[objc_alloc((Class)UITapGestureRecognizer) initWithTarget:self action:"_multiSelect:"];
  multiSelectGestureRecognizer = self->_multiSelectGestureRecognizer;
  self->_multiSelectGestureRecognizer = v20;

  [(UITapGestureRecognizer *)self->_multiSelectGestureRecognizer setAllowedTouchTypes:&off_1001DC968];
  [(UITapGestureRecognizer *)self->_multiSelectGestureRecognizer setDelegate:self];
  [(ListTableView *)v9 addGestureRecognizer:self->_multiSelectGestureRecognizer];
  v22 = [(ListViewController *)self view];
  [v22 addSubview:v9];

  v23 = [(ListViewController *)self cellFactory];
  if (v23)
  {
    v24 = [[DayNavigationViewController alloc] initWithModel:self->super._model];
    scrubberController = self->_scrubberController;
    self->_scrubberController = v24;

    [(DayNavigationViewController *)self->_scrubberController setCellFactory:v23];
    [(DayNavigationViewController *)self->_scrubberController setDelegate:self];
    [(ListViewController *)self addChildViewController:self->_scrubberController];
    [(DayNavigationViewController *)self->_scrubberController didMoveToParentViewController:self];
  }
}

- (void)viewWillAppear:(BOOL)a3
{
  v15.receiver = self;
  v15.super_class = (Class)ListViewController;
  [(ListViewController *)&v15 viewWillAppear:a3];
  [(ListViewController *)self setUpViewConstraints];
  self->_isVisible = 1;
  [(ListViewController *)self _addAllObservers];
  [(ListViewController *)self refresh];
  objc_super v4 = [(ListViewController *)self tableView];
  id v5 = [v4 indexPathsForVisibleRows];

  if ([v5 count])
  {
    id v6 = [v5 objectAtIndex:0];
    id v7 = [v6 section];
    v8 = [(MainViewController *)self model];
    [v8 fetchCachedDaysInBackgroundStartingFromSection:v7 usingFilter:[self showFilteredData]];
  }
  objc_super v9 = [(CUIKCalendarModel *)self->super._model selectedDay];
  uint64_t v10 = [v9 date];
  firstVisibleHeaderDate = self->_firstVisibleHeaderDate;
  self->_firstVisibleHeaderDate = v10;

  id v12 = [(MainViewController *)self model];
  uint64_t v13 = [(CUIKCalendarModel *)self->super._model selectedDay];
  v14 = [v13 date];
  self->_cachedTopHeaderSection = [v12 sectionForCachedOccurrencesOnDate:v14 usingFilter:[self showFilteredData]];
}

- (void)viewDidAppear:(BOOL)a3
{
  v6.receiver = self;
  v6.super_class = (Class)ListViewController;
  [(MainViewController *)&v6 viewDidAppear:a3];
  objc_super v4 = +[NSNotificationCenter defaultCenter];
  [v4 postNotificationName:@"ListViewController_ViewDidAppearNotification" object:self];

  id v5 = [(MainViewController *)self model];
  [v5 startNotificationMonitor];

  [(CUIKCalendarModel *)self->super._model simulateFirstLoadFinished];
  if (![(ListViewController *)self preventScrollingForNextViewAppear]) {
    [(ListViewController *)self scrollToSelectedDateAnimated:0];
  }
  [(ListViewController *)self setPreventScrollingForNextViewAppear:0];
}

- (void)setUpViewConstraints
{
  id v3 = [(ListViewController *)self tableView];
  id v9 = [v3 superview];

  if (v9)
  {
    objc_super v4 = [(ListViewController *)self tableView];
    id v5 = [(ListViewController *)self tableView];
    [v5 setTranslatesAutoresizingMaskIntoConstraints:0];

    objc_super v6 = +[NSLayoutConstraint constraintWithItem:v4 attribute:3 relatedBy:0 toItem:v9 attribute:3 multiplier:1.0 constant:0.0];
    [v6 setActive:1];

    id v7 = +[NSLayoutConstraint constraintWithItem:v9 attribute:4 relatedBy:0 toItem:v4 attribute:4 multiplier:1.0 constant:0.0];
    [v7 setActive:1];

    v8 = +[NSLayoutConstraint constraintWithItem:v9 attribute:7 relatedBy:0 toItem:v4 attribute:7 multiplier:1.0 constant:0.0];
    [v8 setActive:1];
  }
}

- (void)viewWillDisappear:(BOOL)a3
{
  BOOL v3 = a3;
  self->_isVisible = 0;
  self->_userIsScrolling = 0;
  id v5 = +[NSNotificationCenter defaultCenter];
  [v5 removeObserver:self];

  if (![(ListViewController *)self _selectedDateIsVisible]) {
    [(ListViewController *)self _setTopVisibleDateAsSelectedDate];
  }
  v6.receiver = self;
  v6.super_class = (Class)ListViewController;
  [(ListViewController *)&v6 viewWillDisappear:v3];
}

- (void)viewDidDisappear:(BOOL)a3
{
  v4.receiver = self;
  v4.super_class = (Class)ListViewController;
  [(ListViewController *)&v4 viewDidDisappear:a3];
  [(ListViewController *)self _deselectAllSelectedRowsAnimated:0];
}

- (void)setSelectedDateAndFirstVisibleHeaderDate:(id)a3
{
  id v4 = a3;
  id v5 = [(ListViewController *)self delegate];
  char v6 = objc_opt_respondsToSelector();

  if (v6)
  {
    id v7 = [(ListViewController *)self delegate];
    v8 = [v4 date];
    [v7 listViewController:self didScrollToDate:v8];
  }
  else
  {
    [(CUIKCalendarModel *)self->super._model setSelectedDate:v4];
  }
  id v9 = [v4 date];

  firstVisibleHeaderDate = self->_firstVisibleHeaderDate;
  self->_firstVisibleHeaderDate = v9;
}

- (BOOL)allowsOverriddenRightNavigationBarItems
{
  return 1;
}

- (BOOL)allowsOverriddenToolbarItems
{
  return 1;
}

- (id)cellFactory
{
  return 0;
}

- (void)updatePalette:(id)a3
{
  id v3 = a3;
  [v3 setTodayButtonVisible:0];
  [v3 setDateStringVisible:0];
  [v3 setWeekdayHeaderVisible:0];
  [v3 setDividerLineVisible:0];
  [v3 setDayScrubberController:0];
  [v3 setFocusBannerPlacement:1];
}

- (void)_updatePaletteWeekDayHeaderDayFrames
{
  id v12 = +[NSMutableArray array];
  double x = CGRectZero.origin.x;
  double y = CGRectZero.origin.y;
  [(ListViewController *)self scrubberCellSize];
  double v6 = v5;
  double v8 = v7;
  uint64_t v9 = 7;
  do
  {
    int IsLeftToRight = CalTimeDirectionIsLeftToRight();
    v11 = +[NSValue valueWithCGRect:](NSValue, "valueWithCGRect:", x, y, v6, v8);
    if (IsLeftToRight) {
      [v12 addObject:v11];
    }
    else {
      [v12 insertObject:v11 atIndex:0];
    }

    v14.origin.double x = x;
    v14.origin.double y = y;
    v14.size.width = v6;
    v14.size.height = v8;
    double x = CGRectGetMaxX(v14);
    --v9;
  }
  while (v9);
  [(PaletteView *)self->_palette setDayHeaderFrames:v12];
}

- (CGSize)scrubberCellSize
{
  v2 = [(DayNavigationViewController *)self->_scrubberController weekScrollView];
  [v2 cellSize];
  double v4 = v3;
  double v6 = v5;

  double v7 = v4;
  double v8 = v6;
  result.height = v8;
  result.width = v7;
  return result;
}

- (void)showEvent:(id)a3 animated:(BOOL)a4 showMode:(unint64_t)a5 context:(id)a6
{
  BOOL v8 = a4;
  id v19 = a3;
  id v10 = a6;
  v11 = [(ListViewController *)self parentViewController];
  if (![v11 conformsToProtocol:&OBJC_PROTOCOL___ListViewControllerDelegate]) {
    goto LABEL_6;
  }
  id v12 = [(ListViewController *)self parentViewController];
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {

LABEL_6:
    goto LABEL_7;
  }
  uint64_t v13 = [(ListViewController *)self parentViewController];
  unsigned int v14 = [v13 listViewControllerContainerHandlesShowEvent];

  if (v14)
  {
    objc_super v15 = [(ListViewController *)self parentViewController];
    [v15 showEvent:v19 animated:v8 showMode:a5 context:v10];
    goto LABEL_14;
  }
LABEL_7:
  if (a5 == 3)
  {
    uint64_t v16 = +[AddEventViewController editOrAddViewControllerForEventOrIntegrationWithEvent:v19 model:self->super._model creationMethod:0 eventEditViewDelegate:self];
    id v17 = v19;
    objc_super v15 = (void *)v16;
  }
  else
  {
    if (a5)
    {
      v18 = [(MainViewController *)self augmentEventDetailsContext:v10];
      objc_super v15 = +[EKEventViewController eventDetailViewControllerWithEvent:v19 delegate:self context:v18];
      [v15 ekui_adjustNavBarToTransparentStyle];
    }
    else
    {
      objc_super v15 = 0;
    }
    id v17 = v19;
  }
  [(ListViewController *)self _showEvent:v17 viewController:v15 animated:v8 showComments:a5 == 2 modal:a5 == 3];
LABEL_14:
}

- (void)_showEvent:(id)a3 viewController:(id)a4 animated:(BOOL)a5 showComments:(BOOL)a6 modal:(BOOL)a7
{
  BOOL v7 = a7;
  BOOL v8 = a6;
  BOOL v9 = a5;
  id v12 = a3;
  id v13 = a4;
  unsigned int v14 = [v12 startCalendarDate];
  [(ListViewController *)self setSelectedDateAndFirstVisibleHeaderDate:v14];

  [(CUIKCalendarModel *)self->super._model setSelectedOccurrence:v12];
  [(MainViewController *)self setSceneTitleNeedsUpdate];
  if (!v13)
  {
    [(ListViewController *)self selectEvent:v12 animated:v9];
    goto LABEL_10;
  }
  if (!v8 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
  {
    objc_super v15 = 0;
    if (!v7) {
      goto LABEL_5;
    }
LABEL_7:
    uint64_t v16 = [(ListViewController *)self navigationController];
    [v16 presentViewController:v13 animated:v9 completion:v15];

    goto LABEL_8;
  }
  v17[0] = _NSConcreteStackBlock;
  v17[1] = 3221225472;
  v17[2] = sub_10002CC30;
  v17[3] = &unk_1001D2740;
  id v18 = v13;
  objc_super v15 = objc_retainBlock(v17);

  if (v7) {
    goto LABEL_7;
  }
LABEL_5:
  [(ListViewController *)self showViewController:v13 sender:self animated:v9 completion:v15];
LABEL_8:

LABEL_10:
}

- (void)showViewController:(id)a3 sender:(id)a4 animated:(BOOL)a5 completion:(id)a6
{
  BOOL v6 = a5;
  id v10 = a6;
  id v11 = a4;
  id v12 = a3;
  id v13 = [(ListViewController *)self parentViewController];
  unsigned int v14 = [v13 navigationItem];
  objc_super v15 = [(ListViewController *)self backButtonTitleForEventDetails];
  [v14 setBackButtonTitle:v15];

  v16.receiver = self;
  v16.super_class = (Class)ListViewController;
  [(MainViewController *)&v16 showViewController:v12 sender:v11 animated:v6 completion:v10];
}

- (id)backButtonTitleForEventDetails
{
  double v3 = [(CUIKCalendarModel *)self->super._model selectedDate];
  double v4 = [v3 dayComponents];
  double v5 = [(CUIKCalendarModel *)self->super._model calendar];
  BOOL v6 = CUIKStringForDateComponents();

  return v6;
}

- (BOOL)shouldPushNextLevelViewControllerWhenTodayIsVisible
{
  return 0;
}

- (BOOL)isTodayVisible
{
  return 0;
}

- (void)selectDate:(id)a3 animated:(BOOL)a4
{
  BOOL v4 = a4;
  id v9 = a3;
  -[ListViewController setSelectedDateAndFirstVisibleHeaderDate:](self, "setSelectedDateAndFirstVisibleHeaderDate:");
  [(MainViewController *)self setSceneTitleNeedsUpdate];
  [(ListViewController *)self setNeedsRefresh:1];
  p_dateToShowWhenVisible = (id *)&self->_dateToShowWhenVisible;
  if (self->_isVisible)
  {
    id v8 = *p_dateToShowWhenVisible;
    id *p_dateToShowWhenVisible = 0;

    [(ListViewController *)self scrollToSelectedDateAnimated:v4];
  }
  else
  {
    objc_storeStrong(p_dateToShowWhenVisible, a3);
  }
  [(ListViewController *)self updateUIToTopHeaderDate];
}

- (void)_selectTodayDate
{
  CUIKTodayDate();
  id v7 = (id)objc_claimAutoreleasedReturnValue();
  double v3 = [(MainViewController *)self model];
  BOOL v4 = [v3 eventStore];
  double v5 = [v4 timeZone];

  id v6 = [objc_alloc((Class)EKCalendarDate) initWithDate:v7 timeZone:v5];
  [(ListViewController *)self selectDate:v6 animated:0];
}

- (id)bestDateForNewEvent
{
  return [(CUIKCalendarModel *)self->super._model selectedDate];
}

- (BOOL)showEventDetailsWhenNewEventAdded
{
  return 0;
}

- (id)sceneTitle
{
  double v3 = self->_firstVisibleHeaderDate;
  if (v3
    || ([(ListViewController *)self _dateForFirstVisibleRow],
        (double v3 = (NSDate *)objc_claimAutoreleasedReturnValue()) != 0))
  {
    BOOL v4 = CUIKStringForDateWithCommaAndYear();
  }
  else
  {
    BOOL v4 = 0;
  }

  return v4;
}

- (BOOL)toolbarVisibleInSplitBehavior:(int64_t)a3
{
  return a3 == 2;
}

- (BOOL)shouldAutoScrollToSelectedDateAfterFirstRefresh
{
  return 1;
}

- (BOOL)shouldPreserveDateAcrossRefresh
{
  return 1;
}

- (ListTableView)tableView
{
  return self->_tableView;
}

- (UITableView)tableViewForTesting
{
  return (UITableView *)self->_tableView;
}

- (void)refresh
{
  [(ListViewController *)self setNeedsRefresh:1];

  [(ListViewController *)self refreshIfNeeded];
}

- (BOOL)_isVisible
{
  if (self->_isVisible) {
    return [(ListViewController *)self isViewLoaded];
  }
  else {
    return 0;
  }
}

- (void)refreshIfNeeded
{
  if ([(ListViewController *)self _isVisible])
  {
    if (self->_needsRefresh)
    {
      [(ListViewController *)self setNeedsRefresh:0];
      double v3 = [(ListViewController *)self tableView];
      BOOL v4 = [v3 indexPathsForSelectedRows];
      [v3 reloadData];
      long long v15 = 0u;
      long long v16 = 0u;
      long long v13 = 0u;
      long long v14 = 0u;
      id v5 = v4;
      id v6 = [v5 countByEnumeratingWithState:&v13 objects:v17 count:16];
      if (v6)
      {
        id v7 = v6;
        uint64_t v8 = *(void *)v14;
        do
        {
          for (i = 0; i != v7; i = (char *)i + 1)
          {
            if (*(void *)v14 != v8) {
              objc_enumerationMutation(v5);
            }
            -[ListViewController _selectRowAtIndexPath:animated:scrollPosition:](self, "_selectRowAtIndexPath:animated:scrollPosition:", *(void *)(*((void *)&v13 + 1) + 8 * i), 0, 0, (void)v13);
          }
          id v7 = [v5 countByEnumeratingWithState:&v13 objects:v17 count:16];
        }
        while (v7);
      }

      if ([(ListViewController *)self shouldPreserveDateAcrossRefresh]
        && !self->_preventScrollingForNextViewAppear)
      {
        [(ListViewController *)self scrollToDate:self->_firstVisibleHeaderDate animated:0];
      }
      id v10 = [v3 numberOfSections];
      if (v3)
      {
        objc_opt_class();
        if (objc_opt_isKindOfClass()) {
          [(ListViewController *)self _setNeedsUpdateContentUnavailableConfiguration];
        }
      }
      if (v10 && self->_dateToShowWhenVisible)
      {
        if ([(ListViewController *)self shouldAutoScrollToSelectedDateAfterFirstRefresh])
        {
          [(ListViewController *)self setSelectedDateAndFirstVisibleHeaderDate:self->_dateToShowWhenVisible];
          dateToShowWhenVisible = self->_dateToShowWhenVisible;
          self->_dateToShowWhenVisible = 0;

          [(MainViewController *)self setSceneTitleNeedsUpdate];
          [(ListViewController *)self scrollToSelectedDateAnimated:0];
        }
      }
      id v12 = +[NSNotificationCenter defaultCenter];
      [v12 postNotificationName:@"ListViewController_DidRefreshNotification" object:self];
    }
  }
  else
  {
    [(ListViewController *)self setNeedsRefresh:1];
  }
}

- (void)setNeedsRefresh:(BOOL)a3
{
  if (self->_needsRefresh != a3) {
    self->_needsRefresh = a3;
  }
}

- (BOOL)hasContent
{
  v2 = [(ListViewController *)self tableView];
  BOOL v3 = [v2 numberOfSections] != 0;

  return v3;
}

- (void)_updateContentUnavailableConfigurationUsingState:(id)a3
{
  id v5 = a3;
  if ([(ListViewController *)self hasContent])
  {
    [(ListViewController *)self _setContentUnavailableConfiguration:0];
  }
  else
  {
    BOOL v4 = [(ListViewController *)self contentUnavailableConfigurationForState:v5];
    [(ListViewController *)self _setContentUnavailableConfiguration:v4];
  }
}

- (id)contentUnavailableConfigurationForState:(id)a3
{
  id v3 = a3;
  BOOL v4 = +[UIContentUnavailableConfiguration emptyConfiguration];
  id v5 = [v4 updatedConfigurationForState:v3];

  id v6 = +[NSBundle bundleForClass:objc_opt_class()];
  id v7 = [v6 localizedStringForKey:@"No Events" value:&stru_1001D6918 table:0];
  [v5 setText:v7];

  uint64_t v8 = +[UIColor secondaryLabelColor];
  id v9 = [v5 textProperties];
  [v9 setColor:v8];

  return v5;
}

- (BOOL)_selectedDateIsVisible
{
  id v3 = [(ListViewController *)self tableView];
  BOOL v4 = [v3 indexPathsForVisibleRows];
  if ([v4 count])
  {
    id v5 = [(MainViewController *)self model];
    long long v19 = 0u;
    long long v20 = 0u;
    long long v21 = 0u;
    long long v22 = 0u;
    id v6 = v4;
    id v7 = [v6 countByEnumeratingWithState:&v19 objects:v23 count:16];
    if (v7)
    {
      id v8 = v7;
      id v17 = v4;
      id v18 = v3;
      uint64_t v9 = *(void *)v20;
      while (2)
      {
        for (i = 0; i != v8; i = (char *)i + 1)
        {
          if (*(void *)v20 != v9) {
            objc_enumerationMutation(v6);
          }
          id v11 = [v5 dateForCachedOccurrencesInSection:[v19 section] usingFilter:[self showFilteredData]];
          id v12 = [v5 selectedDay];
          long long v13 = [v12 date];
          unsigned __int8 v14 = [v11 isEqualToDate:v13];

          if (v14)
          {
            BOOL v15 = 1;
            goto LABEL_12;
          }
        }
        id v8 = [v6 countByEnumeratingWithState:&v19 objects:v23 count:16];
        if (v8) {
          continue;
        }
        break;
      }
      BOOL v15 = 0;
LABEL_12:
      BOOL v4 = v17;
      id v3 = v18;
    }
    else
    {
      BOOL v15 = 0;
    }
  }
  else
  {
    BOOL v15 = 0;
  }

  return v15;
}

- (id)_dateForFirstVisibleRow
{
  id v3 = [(ListViewController *)self tableView];
  BOOL v4 = [v3 indexPathsForVisibleRows];

  if ([v4 count])
  {
    id v5 = [v4 objectAtIndex:0];
    id v6 = -[CUIKCalendarModel dateForCachedOccurrencesInSection:usingFilter:](self->super._model, "dateForCachedOccurrencesInSection:usingFilter:", [v5 section], -[ListViewController showFilteredData](self, "showFilteredData"));
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {

      id v6 = 0;
    }
  }
  else
  {
    id v6 = 0;
  }

  return v6;
}

- (void)scrollToSelectedDateAnimated:(BOOL)a3
{
}

- (void)scrollToTodayAnimated:(BOOL)a3
{
  BOOL v3 = a3;
  CUIKTodayDate();
  id v5 = (id)objc_claimAutoreleasedReturnValue();
  [(ListViewController *)self scrollToDate:v5 animated:v3];
}

- (void)scrollToDate:(id)a3 animated:(BOOL)a4
{
  uint64_t v4 = a4;
  id v6 = a3;
  if (v6)
  {
    id v28 = v6;
    if ([(ListViewController *)self _isVisible]
      && (uint64_t)[(CUIKCalendarModel *)self->super._model numberOfDaysWithCachedOccurrencesUsingFilter:[(ListViewController *)self showFilteredData]] >= 1)
    {
      id v7 = CUIKTodayDate();
      id v8 = (char *)[(CUIKCalendarModel *)self->super._model sectionForCachedOccurrencesOnDate:v7 usingFilter:[(ListViewController *)self showFilteredData]];
      id v9 = [(CUIKCalendarModel *)self->super._model numberOfCachedOccurrencesInSection:v8 usingFilter:[(ListViewController *)self showFilteredData]];
      id v10 = (char *)[(CUIKCalendarModel *)self->super._model sectionForCachedOccurrencesOnDate:v28 usingFilter:[(ListViewController *)self showFilteredData]];
      if (!v9 && (v10 == v8 || v10 - 1 == v8))
      {
        id v12 = v7;

        id v28 = v12;
      }
      uint64_t v13 = [(ListViewController *)self _dateForFirstVisibleRow];
      if (v13)
      {
        unsigned __int8 v14 = (void *)v13;
        BOOL v15 = [(MainViewController *)self model];
        long long v16 = [v15 calendar];
        id v17 = [(ListViewController *)self _dateForFirstVisibleRow];
        id v18 = [v16 components:16 fromDate:v17 toDate:v28 options:0];
        uint64_t v19 = (uint64_t)[v18 day];

        if (v19 >= 0) {
          unint64_t v20 = v19;
        }
        else {
          unint64_t v20 = -v19;
        }

        if (v20 < 7) {
          uint64_t v4 = v4;
        }
        else {
          uint64_t v4 = 0;
        }
      }
      long long v21 = [(ListViewController *)self tableView];
      long long v22 = [(ListViewController *)self _indexPathForDate:v28];
      [v21 scrollToRowAtIndexPath:v22 atScrollPosition:1 animated:v4];

      v23 = [(ListViewController *)self _indexPathForDate:v28];
      id v24 = [v23 section];
      v25 = [(ListViewController *)self tableView];
      id v26 = [v25 numberOfSections];

      if ((uint64_t)v24 <= (uint64_t)v26)
      {
        v27 = [(ListViewController *)self tableView];
        [v27 scrollToRowAtIndexPath:v23 atScrollPosition:1 animated:v4];
      }
    }
    id v6 = v28;
  }
}

- (id)_indexPathForDate:(id)a3
{
  id v4 = a3;
  if ([(CUIKCalendarModel *)self->super._model numberOfDaysWithCachedOccurrencesUsingFilter:[(ListViewController *)self showFilteredData]])
  {
    id v5 = [(CUIKCalendarModel *)self->super._model eventStore];
    id v6 = [v5 timeZone];
    id v7 = [v4 dateForDayInTimeZone:v6];

    id v8 = +[NSIndexPath indexPathForRow:0x7FFFFFFFFFFFFFFFLL inSection:[(CUIKCalendarModel *)self->super._model sectionForCachedOccurrencesOnDate:v7 usingFilter:[(ListViewController *)self showFilteredData]]];
  }
  else
  {
    id v8 = +[NSIndexPath indexPathForRow:0x7FFFFFFFFFFFFFFFLL inSection:0];
  }

  return v8;
}

- (BOOL)shouldUpdateModelSelectedDate
{
  return 1;
}

- (void)_setTopVisibleDateAsSelectedDate
{
  if ([(ListViewController *)self shouldUpdateModelSelectedDate])
  {
    id v10 = self->_firstVisibleHeaderDate;
    BOOL v3 = [(MainViewController *)self model];
    if (v10)
    {
      id v4 = [v3 selectedDate];
      id v5 = [v4 date];
      NSComparisonResult v6 = [(NSDate *)v10 compare:v5];

      if (v6)
      {
        id v7 = [v3 calendar];
        id v8 = [v7 timeZone];

        id v9 = +[EKCalendarDate calendarDateWithDate:v10 timeZone:v8];
        [(ListViewController *)self setSelectedDateAndFirstVisibleHeaderDate:v9];
      }
    }
  }
}

- (void)_updateBackButtonOnBackViewControllerToDate:(id)a3
{
  id v5 = a3;
  id v4 = [(ListViewController *)self navigationController];
  if (objc_opt_respondsToSelector()) {
    [v4 updateBackButtonToDate:v5];
  }
}

- (double)contentInset
{
  v2 = [(ListViewController *)self tableView];
  [v2 contentInset];
  double v4 = v3;

  return v4;
}

- (BOOL)_processScrollingMessagesOnEveryFrameFromListViewController
{
  double v3 = [(ListViewController *)self delegate];
  if (objc_opt_respondsToSelector())
  {
    double v4 = [(ListViewController *)self delegate];
    unsigned __int8 v5 = [v4 wantsScrollingMessagesOnEveryFrameFromListViewController:self];
  }
  else
  {
    unsigned __int8 v5 = 0;
  }

  return v5;
}

- (id)defaultEventForSelectedDate
{
  double v3 = [(ListViewController *)self _dateForFirstVisibleRow];
  double v4 = [(ListViewController *)self _indexPathForDate:v3];
  unsigned __int8 v5 = +[NSIndexPath indexPathForRow:inSection:](NSIndexPath, "indexPathForRow:inSection:", 0, [v4 section]);

  if ([v5 section] == (id)0x7FFFFFFFFFFFFFFFLL)
  {
    uint64_t v6 = +[NSIndexPath indexPathForRow:0 inSection:0];

    unsigned __int8 v5 = (void *)v6;
  }
  id v7 = [(ListViewController *)self _eventForRowAtIndexPath:v5];

  return v7;
}

- (void)selectEvent:(id)a3 animated:(BOOL)a4
{
  BOOL v4 = a4;
  id v6 = a3;
  id v7 = [(CUIKCalendarModel *)self->super._model indexPathsForOccurrence:v6 usingFilter:[(ListViewController *)self showFilteredData]];
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  id v8 = [v7 countByEnumeratingWithState:&v12 objects:v16 count:16];
  if (v8)
  {
    id v9 = v8;
    uint64_t v10 = *(void *)v13;
    do
    {
      id v11 = 0;
      do
      {
        if (*(void *)v13 != v10) {
          objc_enumerationMutation(v7);
        }
        [(ListViewController *)self _selectRowAtIndexPath:*(void *)(*((void *)&v12 + 1) + 8 * (void)v11) animated:v4 scrollPosition:0];
        id v11 = (char *)v11 + 1;
      }
      while (v9 != v11);
      id v9 = [v7 countByEnumeratingWithState:&v12 objects:v16 count:16];
    }
    while (v9);
  }
}

- (void)updateSeparatorVisibiltyForSelectionChangeForRowAtIndexPath:(id)a3
{
  id v5 = a3;
  if ((uint64_t)[v5 row] >= 1)
  {
    BOOL v4 = +[NSIndexPath indexPathForRow:inSection:](NSIndexPath, "indexPathForRow:inSection:", (char *)[v5 row] - 1, objc_msgSend(v5, "section"));
    [(ListViewController *)self _updateSeparatorVisibilityForRowAtIndexPath:v4];
  }
  [(ListViewController *)self _updateSeparatorVisibilityForRowAtIndexPath:v5];
}

- (void)_addAllObservers
{
  id v3 = +[NSNotificationCenter defaultCenter];
  [v3 addObserver:self selector:"_eventStoreChanged:" name:CUIKCalendarModelCachedOccurrencesChangedNotification object:self->super._model];
  [v3 addObserver:self selector:"_timeChangedSignificantly:" name:CUIKCalendarModelSignificantTimeChangeNotification object:self->super._model];
  [v3 addObserver:self selector:"_localeChanged:" name:CUIKLocaleChangedNotification object:0];
  [v3 addObserver:self selector:"_weekNumberChanged:" name:CUIKPreferencesNotification_ShowWeekNumbers object:0];
  [v3 addObserver:self selector:"_selectedOccurrencesChanged:" name:CUIKCalendarModelSelectedOccurrencesChangedNotification object:self->super._model];
  [v3 addObserver:self selector:"_contentCategorySizeChangedNotification:" name:UIContentSizeCategoryDidChangeNotification object:0];
}

- (void)_timeChangedSignificantly:(id)a3
{
  BOOL v4 = [a3 userInfo];
  id v8 = [v4 objectForKey:CUIKCalendarModelSignificantTimeChangeNotificationDayChangedKey];

  id v5 = [v8 BOOLValue];
  id v6 = v8;
  if ((v5 & 1) != 0 || !v8)
  {
    id v7 = [(ListViewController *)self tableView];
    [v7 reloadData];

    id v6 = v8;
  }

  _objc_release_x1(v5, v6);
}

- (void)_localeChanged:(id)a3
{
  id v3 = [(ListViewController *)self tableView];
  [v3 reloadData];
}

- (void)_weekNumberChanged:(id)a3
{
  id v3 = [(ListViewController *)self tableView];
  [v3 reloadData];
}

- (void)_selectedOccurrencesChanged:(id)a3
{
  BOOL v4 = [(MainViewController *)self model];
  id v5 = [v4 selectedOccurrences];
  id v6 = +[NSSet setWithArray:v5];

  long long v38 = 0u;
  long long v39 = 0u;
  long long v36 = 0u;
  long long v37 = 0u;
  id v7 = [(ListTableView *)self->_tableView indexPathsForSelectedRows];
  id v8 = [v7 countByEnumeratingWithState:&v36 objects:v42 count:16];
  if (v8)
  {
    id v9 = v8;
    uint64_t v10 = *(void *)v37;
    do
    {
      id v11 = 0;
      do
      {
        if (*(void *)v37 != v10) {
          objc_enumerationMutation(v7);
        }
        uint64_t v12 = *(void *)(*((void *)&v36 + 1) + 8 * (void)v11);
        long long v13 = [(MainViewController *)self model];
        long long v14 = [v13 cachedOccurrenceAtIndexPath:v12];

        if (([v6 containsObject:v14] & 1) == 0) {
          [(ListViewController *)self _deselectRowAtIndexPath:v12 animated:1];
        }

        id v11 = (char *)v11 + 1;
      }
      while (v9 != v11);
      id v9 = [v7 countByEnumeratingWithState:&v36 objects:v42 count:16];
    }
    while (v9);
  }

  long long v34 = 0u;
  long long v35 = 0u;
  long long v32 = 0u;
  long long v33 = 0u;
  id v15 = v6;
  id v16 = [v15 countByEnumeratingWithState:&v32 objects:v41 count:16];
  if (v16)
  {
    id v17 = v16;
    uint64_t v18 = *(void *)v33;
    do
    {
      uint64_t v19 = 0;
      do
      {
        if (*(void *)v33 != v18) {
          objc_enumerationMutation(v15);
        }
        uint64_t v20 = *(void *)(*((void *)&v32 + 1) + 8 * (void)v19);
        long long v21 = [(MainViewController *)self model];
        long long v22 = [v21 indexPathsForOccurrence:v20 usingFilter:[self showFilteredData]];

        long long v30 = 0u;
        long long v31 = 0u;
        long long v28 = 0u;
        long long v29 = 0u;
        id v23 = v22;
        id v24 = [v23 countByEnumeratingWithState:&v28 objects:v40 count:16];
        if (v24)
        {
          id v25 = v24;
          uint64_t v26 = *(void *)v29;
          do
          {
            v27 = 0;
            do
            {
              if (*(void *)v29 != v26) {
                objc_enumerationMutation(v23);
              }
              [(ListViewController *)self _selectRowAtIndexPath:*(void *)(*((void *)&v28 + 1) + 8 * (void)v27) animated:1 scrollPosition:0];
              v27 = (char *)v27 + 1;
            }
            while (v25 != v27);
            id v25 = [v23 countByEnumeratingWithState:&v28 objects:v40 count:16];
          }
          while (v25);
        }

        uint64_t v19 = (char *)v19 + 1;
      }
      while (v19 != v17);
      id v17 = [v15 countByEnumeratingWithState:&v32 objects:v41 count:16];
    }
    while (v17);
  }
}

- (void)_contentCategorySizeChangedNotification:(id)a3
{
  id v6 = [(ListViewController *)self _dateForFirstVisibleRow];
  BOOL v4 = [(ListViewController *)self tableView];
  [v4 reloadData];

  id v5 = v6;
  if (v6)
  {
    [(ListViewController *)self scrollToDate:v6 animated:0];
    id v5 = v6;
  }
}

- (int64_t)numberOfSectionsInTableView:(id)a3
{
  id v4 = a3;
  id v5 = [(MainViewController *)self model];
  id v6 = [v5 numberOfDaysWithCachedOccurrencesUsingFilter:[self showFilteredData]];

  swipedRow = self->_swipedRow;
  if (swipedRow) {
    id v6 = (id)((__PAIR128__((unint64_t)v6, [(ListViewController *)self tableView:v4 numberOfRowsInSection:[(NSIndexPath *)swipedRow section]])- 1) >> 64);
  }

  return (int64_t)v6;
}

- (int64_t)tableView:(id)a3 numberOfRowsInSection:(int64_t)a4
{
  id v6 = [(MainViewController *)self model];
  id v7 = [v6 numberOfCachedOccurrencesInSection:a4 usingFilter:[self showFilteredData]];

  swipedRow = self->_swipedRow;
  if (swipedRow) {
    return (int64_t)v7 - ([(NSIndexPath *)swipedRow section] == a4);
  }
  return (int64_t)v7;
}

- (id)tableView:(id)a3 cellForRowAtIndexPath:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = [(MainViewController *)self model];
  id v9 = [v8 cachedOccurrenceAtIndexPath:v7 usingFilter:[self showFilteredData]];

  v43 = -[CUIKCalendarModel dateForCachedOccurrencesInSection:usingFilter:](self->super._model, "dateForCachedOccurrencesInSection:usingFilter:", [v7 section], -[ListViewController showFilteredData](self, "showFilteredData"));
  uint64_t v10 = [v9 endDate];
  id v11 = CUIKNowDate();
  uint64_t v12 = CUIKCalendar();
  if ([v10 isBeforeDate:v11]) {
    uint64_t v13 = 1;
  }
  else {
    uint64_t v13 = (uint64_t)[v43 isBeforeDayForDate:v11 inCalendar:v12];
  }
  if ([v9 isReminderIntegrationEvent])
  {
    long long v14 = (objc_class *)objc_opt_class();
    id v15 = NSStringFromClass(v14);
    id v16 = [v6 dequeueReusableCellWithIdentifier:v15 forIndexPath:v7];

    [v16 setDelegate:self];
LABEL_8:
    [v16 updateWithEvent:v9 dimmed:v13];
    goto LABEL_10;
  }
  if ([v9 isAllDay])
  {
    id v17 = (objc_class *)objc_opt_class();
    uint64_t v18 = NSStringFromClass(v17);
    id v16 = [v6 dequeueReusableCellWithIdentifier:v18 forIndexPath:v7];

    goto LABEL_8;
  }
  uint64_t v19 = (objc_class *)objc_opt_class();
  uint64_t v20 = NSStringFromClass(v19);
  id v16 = [v6 dequeueReusableCellWithIdentifier:v20 forIndexPath:v7];

  long long v21 = [v9 startDate];
  [v9 endDateUnadjustedForLegacyClients];
  HIDWORD(v42) = v13;
  long long v22 = v11;
  id v24 = v23 = v10;
  LODWORD(v42) = [v12 cal_isMultidayEventForUIWithStartDate:v21 endDate:v24];

  uint64_t v10 = v23;
  id v11 = v22;

  [v16 updateWithEvent:v9 isMultiday:v42 occurrenceStartDate:v43 dimmed:HIDWORD(v42)];
LABEL_10:
  [(id)objc_opt_class() adjustedSeparatorInsets];
  double v26 = v25;
  double v28 = v27;
  double v30 = v29;
  double v32 = v31;
  int IsLeftToRight = CalInterfaceIsLeftToRight();
  [v6 safeAreaInsets];
  if (IsLeftToRight) {
    double v36 = v34;
  }
  else {
    double v36 = v35;
  }
  int v37 = CalInterfaceIsLeftToRight();
  [v6 safeAreaInsets];
  if (v37) {
    double v40 = v39;
  }
  else {
    double v40 = v38;
  }
  [v16 setSeparatorInset:v26, v28 + v36, v30, v32 + v40, v42];
  [v16 setDrawsOwnRowSeparators:1];
  [(ListViewController *)self _updateSeparatorVisibilityForOccurrenceCell:v16 atIndexPath:v7];

  return v16;
}

- (void)_updateSeparatorVisibilityForRowAtIndexPath:(id)a3
{
  id v5 = a3;
  id v4 = -[ListTableView cellForRowAtIndexPath:](self->_tableView, "cellForRowAtIndexPath:");
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    [(ListViewController *)self _updateSeparatorVisibilityForOccurrenceCell:v4 atIndexPath:v5];
  }
}

- (void)_updateSeparatorVisibilityForOccurrenceCell:(id)a3 atIndexPath:(id)a4
{
  id v12 = a4;
  id v6 = a3;
  id v7 = [(MainViewController *)self model];
  id v8 = (char *)objc_msgSend(v7, "numberOfCachedOccurrencesInSection:usingFilter:", objc_msgSend(v12, "section"), -[ListViewController showFilteredData](self, "showFilteredData"));

  if ((uint64_t)[v12 row] >= (uint64_t)(v8 - 1)
    || [(ListViewController *)self _rowDrawsBackground:v12])
  {
    uint64_t v9 = 0;
  }
  else
  {
    uint64_t v10 = +[NSIndexPath indexPathForRow:inSection:](NSIndexPath, "indexPathForRow:inSection:", (char *)[v12 row] + 1, objc_msgSend(v12, "section"));
    unsigned int v11 = [(ListViewController *)self _rowDrawsBackground:v10];

    if (v11) {
      uint64_t v9 = 0;
    }
    else {
      uint64_t v9 = 4;
    }
  }
  objc_msgSend(v6, "setSeparatorEdges:", v9 | (objc_msgSend(v12, "row") == 0));
}

- (BOOL)_rowDrawsBackground:(id)a3
{
  id v4 = a3;
  id v5 = [(ListTableView *)self->_tableView indexPathsForSelectedRows];
  id v6 = v5;
  if (v5 && ([v5 containsObject:v4] & 1) != 0)
  {
    unsigned __int8 v7 = 1;
  }
  else
  {
    id v8 = [(MainViewController *)self model];
    uint64_t v9 = [v8 cachedOccurrenceAtIndexPath:v4 usingFilter:[self showFilteredData]];

    unsigned __int8 v7 = +[EKUIListViewCell drawsBackgroundForEvent:v9];
  }

  return v7;
}

- (id)tableView:(id)a3 viewForHeaderInSection:(int64_t)a4
{
  id v6 = a3;
  unsigned __int8 v7 = [(MainViewController *)self model];
  id v8 = [v7 dateForCachedOccurrencesInSection:a4 usingFilter:[self showFilteredData]];

  uint64_t v9 = [v6 dequeueReusableHeaderFooterViewWithIdentifier:@"ListViewSectionHeaderView"];

  uint64_t v10 = [(MainViewController *)self model];
  unsigned int v11 = [v10 calendar];
  id v12 = [v11 timeZone];
  [v9 configureWithDate:v8 timeZone:v12];

  return v9;
}

- (void)tableView:(id)a3 willDisplayHeaderView:(id)a4 forSection:(int64_t)a5
{
  id v16 = a3;
  id v8 = a4;
  if (self->_userIsScrolling)
  {
    if (self->_cachedTopHeaderSection > a5)
    {
      uint64_t v9 = [(CUIKCalendarModel *)self->super._model dateForCachedOccurrencesInSection:a5 usingFilter:[(ListViewController *)self showFilteredData]];
      uint64_t v10 = [(CUIKCalendarModel *)self->super._model calendar];
      unsigned int v11 = [v10 timeZone];
      id v12 = +[EKCalendarDate calendarDateWithDate:v9 timeZone:v11];

      [(ListViewController *)self setSelectedDateAndFirstVisibleHeaderDate:v12];
      [(ListViewController *)self updateUIToTopHeaderDate];
    }
    uint64_t v13 = [(ListViewController *)self tableView];
    long long v14 = [v13 indexPathsForVisibleRows];

    id v15 = [v14 firstObject];
    if ((uint64_t)[v15 section] >= a5) {
      self->_cachedTopHeaderSection = a5;
    }
  }
}

- (void)tableView:(id)a3 didEndDisplayingHeaderView:(id)a4 forSection:(int64_t)a5
{
  if (self->_userIsScrolling && self->_cachedTopHeaderSection >= a5)
  {
    id v6 = [(ListViewController *)self tableView];
    id v14 = [v6 indexPathsForVisibleRows];

    unsigned __int8 v7 = [v14 firstObject];
    id v8 = v7;
    if (v7) {
      id cachedTopHeaderSection = [v7 section];
    }
    else {
      id cachedTopHeaderSection = self->_cachedTopHeaderSection;
    }
    self->_id cachedTopHeaderSection = (int64_t)cachedTopHeaderSection;
    uint64_t v10 = [(CUIKCalendarModel *)self->super._model dateForCachedOccurrencesInSection:cachedTopHeaderSection usingFilter:[(ListViewController *)self showFilteredData]];
    unsigned int v11 = [(CUIKCalendarModel *)self->super._model calendar];
    id v12 = [v11 timeZone];
    uint64_t v13 = +[EKCalendarDate calendarDateWithDate:v10 timeZone:v12];

    [(ListViewController *)self setSelectedDateAndFirstVisibleHeaderDate:v13];
    [(ListViewController *)self updateUIToTopHeaderDate];
  }
}

- (void)updateUIToTopHeaderDate
{
  if (![(ListViewController *)self _processScrollingMessagesOnEveryFrameFromListViewController])
  {
    id v3 = [(CUIKCalendarModel *)self->super._model selectedDate];
    [(ListViewController *)self _updateBackButtonOnBackViewControllerToDate:v3];

    [(MainViewController *)self setSceneTitleNeedsUpdate];
  }
  id v4 = [(PaletteView *)self->_palette dayScrubberController];
  [v4 setSelectedDate:self->_firstVisibleHeaderDate animated:1];
}

- (BOOL)tableView:(id)a3 wantsHeaderForSection:(int64_t)a4
{
  return 1;
}

- (void)tableView:(id)a3 didSelectRowAtIndexPath:(id)a4
{
  id v8 = a4;
  id v5 = [(ListViewController *)self presentedViewController];

  if (!v5)
  {
    [(ListViewController *)self setPreventScrollingForNextViewAppear:1];
    id v6 = [(MainViewController *)self model];
    unsigned __int8 v7 = [v6 cachedOccurrenceAtIndexPath:v8 usingFilter:[self showFilteredData]];

    [(ListViewController *)self showEvent:v7 animated:1 showMode:1 context:0];
  }
  [(ListViewController *)self updateSeparatorVisibiltyForSelectionChangeForRowAtIndexPath:v8];
}

- (void)tableView:(id)a3 didDeselectRowAtIndexPath:(id)a4
{
  id v9 = a3;
  id v6 = a4;
  if ([(ListViewController *)self showFilteredData])
  {
    [(ListViewController *)self tableView:v9 didSelectRowAtIndexPath:v6];
  }
  else
  {
    unsigned __int8 v7 = [(MainViewController *)self model];
    id v8 = [v7 cachedOccurrenceAtIndexPath:v6 usingFilter:[self showFilteredData]];

    [(CUIKCalendarModel *)self->super._model deselectOccurrence:v8];
    [(ListViewController *)self updateSeparatorVisibiltyForSelectionChangeForRowAtIndexPath:v6];
  }
}

- (void)_deselectRowAtIndexPath:(id)a3 animated:(BOOL)a4
{
  BOOL v4 = a4;
  tableView = self->_tableView;
  id v7 = a3;
  [(ListTableView *)tableView deselectRowAtIndexPath:v7 animated:v4];
  [(ListViewController *)self updateSeparatorVisibiltyForSelectionChangeForRowAtIndexPath:v7];
}

- (void)_selectRowAtIndexPath:(id)a3 animated:(BOOL)a4 scrollPosition:(int64_t)a5
{
  BOOL v6 = a4;
  tableView = self->_tableView;
  id v9 = a3;
  [(ListTableView *)tableView selectRowAtIndexPath:v9 animated:v6 scrollPosition:a5];
  [(ListViewController *)self updateSeparatorVisibiltyForSelectionChangeForRowAtIndexPath:v9];
}

- (void)eventViewController:(id)a3 didCompleteWithAction:(int64_t)a4
{
  id v5 = a3;
  [v5 setDelegate:0];
  BOOL v6 = [(ListViewController *)self navigationController];
  [v6 popViewControllersAfterAndIncluding:v5 animated:!self->_editorDismissedFromDelete];

  self->_editorDismissedFromDelete = 0;
}

- (void)eventViewControllerWillDisappear:(id)a3
{
}

- (void)eventViewController:(id)a3 willDismissEditViewController:(id)a4 deleted:(BOOL)a5
{
  self->_editorDismissedFromDelete = a5;
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
    id v9 = _NSConcreteStackBlock;
    uint64_t v10 = 3221225472;
    unsigned int v11 = sub_10002F52C;
    id v12 = &unk_1001D2808;
    uint64_t v13 = self;
    id v14 = v6;
    id v8 = objc_retainBlock(&v9);
  }
  else
  {
    id v8 = 0;
  }
  -[CUIKCalendarModel setSelectedOccurrence:](self->super._model, "setSelectedOccurrence:", 0, v9, v10, v11, v12);
  [(ListViewController *)self dismissViewControllerAnimated:1 completion:v8];
}

- (id)calendarModel
{
  return self->super._model;
}

- (void)scrollViewWillBeginDragging:(id)a3
{
  self->_userIsScrolling = 1;
}

- (void)scrollViewDidEndDragging:(id)a3 willDecelerate:(BOOL)a4
{
  if (!a4) {
    self->_userIsScrolling = 0;
  }
}

- (void)scrollViewDidEndDecelerating:(id)a3
{
  self->_userIsScrolling = 0;
}

- (id)tableView:(id)a3 contextMenuConfigurationForRowAtIndexPath:(id)a4 point:(CGPoint)a5
{
  id v7 = a3;
  id v8 = a4;
  if (v8
    && ([(ListViewController *)self presentedViewController],
        id v9 = objc_claimAutoreleasedReturnValue(),
        unsigned __int8 v10 = [v9 isBeingDismissed],
        v9,
        (v10 & 1) == 0))
  {
    id v12 = [(ListViewController *)self _eventForRowAtIndexPath:v8];
    if (v12)
    {
      uint64_t v13 = [(CUIKCalendarModel *)self->super._model selectedOccurrences];
      unsigned __int8 v14 = [v13 containsObject:v12];

      if ((v14 & 1) == 0)
      {
        uint64_t v20 = v12;
        id v15 = +[NSArray arrayWithObjects:&v20 count:1];
        [(CUIKCalendarModel *)self->super._model setSelectedOccurrences:v15];
      }
      v18[0] = _NSConcreteStackBlock;
      v18[1] = 3221225472;
      v18[2] = sub_10002F798;
      v18[3] = &unk_1001D2830;
      id v19 = v12;
      v17[0] = _NSConcreteStackBlock;
      v17[1] = 3221225472;
      v17[2] = sub_10002F7DC;
      v17[3] = &unk_1001D2880;
      void v17[4] = self;
      unsigned int v11 = +[UIContextMenuConfiguration configurationWithIdentifier:v8 previewProvider:v18 actionProvider:v17];
    }
    else
    {
      unsigned int v11 = 0;
    }
  }
  else
  {
    unsigned int v11 = 0;
  }

  return v11;
}

- (id)tableView:(id)a3 previewForDismissingContextMenuWithConfiguration:(id)a4
{
  id v5 = a4;
  id v6 = a3;
  id v7 = [v5 identifier];
  id v8 = [v6 cellForRowAtIndexPath:v7];

  id v9 = [v5 identifier];

  id v16 = v9;
  unsigned __int8 v10 = +[NSArray arrayWithObjects:&v16 count:1];
  [v6 reloadRowsAtIndexPaths:v10 withRowAnimation:100];

  if (v8)
  {
    id v11 = [v8 window];

    if (v11)
    {
      id v12 = objc_alloc((Class)UITargetedPreview);
      uint64_t v13 = [v8 contentView];
      id v14 = objc_alloc_init((Class)UIPreviewParameters);
      id v11 = [v12 initWithView:v13 parameters:v14];
    }
  }
  else
  {
    id v11 = 0;
  }

  return v11;
}

- (void)tableView:(id)a3 willPerformPreviewActionForMenuWithConfiguration:(id)a4 animator:(id)a5
{
  id v6 = a5;
  id v7 = [v6 previewViewController];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v8 = [v6 previewViewController];
  }
  else
  {
    id v8 = 0;
  }

  id v9 = [v8 event];
  [v8 willCommitPreview];
  if (v9)
  {
    v10[0] = _NSConcreteStackBlock;
    v10[1] = 3221225472;
    v10[2] = sub_10002FBA8;
    v10[3] = &unk_1001D28A8;
    v10[4] = self;
    id v11 = v9;
    [v6 addAnimations:v10];
  }
}

- (void)tableView:(id)a3 willEndContextMenuInteractionWithConfiguration:(id)a4 animator:(id)a5
{
  id v6 = [(CUIKCalendarModel *)self->super._model selectedOccurrences];
  id v7 = [v6 count];

  if (v7 == (id)1)
  {
    model = self->super._model;
    [(CUIKCalendarModel *)model setSelectedOccurrences:&__NSArray0__struct];
  }
}

- (id)_eventForRowAtIndexPath:(id)a3
{
  id v4 = a3;
  id v5 = [(MainViewController *)self model];
  id v6 = [v5 cachedOccurrenceAtIndexPath:v4 usingFilter:[self showFilteredData]];

  return v6;
}

- (void)tableView:(id)a3 commitEditingStyle:(int64_t)a4 forRowAtIndexPath:(id)a5
{
  id v8 = a3;
  id v9 = a5;
  unsigned __int8 v10 = +[CUIKPreferences sharedPreferences];
  unsigned int v11 = [v10 swipeToDeleteEnabled];

  if (a4 == 1 && v11)
  {
    v13[0] = _NSConcreteStackBlock;
    v13[1] = 3221225472;
    v13[2] = sub_10002FE6C;
    v13[3] = &unk_1001D28D0;
    v13[4] = self;
    id v14 = v9;
    id v15 = v8;
    [(ListViewController *)self _deleteEventAtIndexPath:v14 withCompletionHandler:v13];
  }
  else
  {
    swipedRow = self->_swipedRow;
    self->_swipedRow = 0;
  }
}

- (void)_clearSwipedRow
{
  self->_swipedRow = 0;
  _objc_release_x1();
}

- (void)_deleteEventAtIndexPath:(id)a3 withCompletionHandler:(id)a4
{
  id v6 = a4;
  id v7 = [(ListViewController *)self _eventForRowAtIndexPath:a3];
  id v8 = +[NSBundle bundleForClass:objc_opt_class()];
  id v9 = [v8 localizedStringForKey:@"Delete" value:&stru_1001D6918 table:0];
  v14[0] = _NSConcreteStackBlock;
  v14[1] = 3221225472;
  v14[2] = sub_100030160;
  v14[3] = &unk_1001D28F8;
  v14[4] = self;
  id v15 = v7;
  id v16 = v6;
  id v10 = v6;
  id v11 = v7;
  id v12 = +[EKUIRecurrenceAlertController presentDeleteAlertWithOptions:0 viewController:self barButtonItem:0 forEvent:v11 stringForDeleteButton:v9 withCompletionHandler:v14];
  recurrenceAlertController = self->_recurrenceAlertController;
  self->_recurrenceAlertController = v12;
}

- (int64_t)tableView:(id)a3 editingStyleForRowAtIndexPath:(id)a4
{
  id v4 = [(ListViewController *)self _eventForRowAtIndexPath:a4];
  id v5 = +[CUIKPreferences sharedPreferences];
  if (![v5 swipeToDeleteEnabled])
  {

    goto LABEL_5;
  }
  unsigned __int8 v6 = [v4 isEditable];

  if ((v6 & 1) == 0)
  {
LABEL_5:
    int64_t v7 = 0;
    goto LABEL_6;
  }
  int64_t v7 = 1;
LABEL_6:

  return v7;
}

- (BOOL)eventViewDelegateShouldShowNextOccurrenceOfEvent:(id)a3 forward:(BOOL)a4
{
  BOOL v4 = a4;
  id v6 = a3;
  int64_t v7 = v6;
  if (v4)
  {
    id v8 = [v6 nextOccurrence];
    if (v8)
    {
      id v9 = [(ListViewController *)self tableView];
      int64_t v10 = [(ListViewController *)self numberOfSectionsInTableView:v9];

      id v11 = [(ListViewController *)self tableView];
      int64_t v12 = [(ListViewController *)self tableView:v11 numberOfRowsInSection:--v10];

      int64_t v23 = v10;
      int64_t v24 = v12 - 1;
      uint64_t v13 = +[NSIndexPath indexPathWithIndexes:&v23 length:2];
      id v14 = [(MainViewController *)self model];
      id v15 = [v14 cachedOccurrenceAtIndexPath:v13 usingFilter:[self showFilteredData]];

      id v16 = [v8 startDate];
      id v17 = [v15 startDate];
      unsigned __int8 v18 = [v16 isBeforeDate:v17];
LABEL_8:
      BOOL v20 = v18;

      goto LABEL_9;
    }
  }
  else
  {
    id v19 = [v6 previousOccurrence];
    id v8 = v19;
    if (v19 && [v19 reminderOccurrenceType] != (id)1)
    {
      int64_t v23 = 0;
      int64_t v24 = 0;
      uint64_t v13 = +[NSIndexPath indexPathWithIndexes:&v23 length:2];
      long long v21 = [(MainViewController *)self model];
      id v15 = [v21 cachedOccurrenceAtIndexPath:v13 usingFilter:[self showFilteredData]];

      id v16 = [v8 startDate];
      id v17 = [v15 startDate];
      unsigned __int8 v18 = [v16 isAfterDate:v17];
      goto LABEL_8;
    }
  }
  BOOL v20 = 0;
LABEL_9:

  return v20;
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
  int64_t v7 = [v6 previousOccurrence];
  }
  id v8 = v7;
  if (v7)
  {
    id v9 = [v7 startCalendarDate];
    [(ListViewController *)self selectDate:v9 animated:1];

    [(ListViewController *)self selectEvent:v8 animated:1];
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
    [(ListViewController *)self eventViewController:v7 didCompleteWithAction:0];
    id v6 = [v7 context];
    [(ListViewController *)self showEvent:v5 animated:1 showMode:1 context:v6];
  }
}

- (void)eventViewControllerPreviousButtonWasTapped:(id)a3
{
  id v7 = a3;
  BOOL v4 = [v7 event];
  id v5 = [v4 previousOccurrence];

  if (v5)
  {
    [(ListViewController *)self eventViewController:v7 didCompleteWithAction:0];
    id v6 = [v7 context];
    [(ListViewController *)self showEvent:v5 animated:1 showMode:1 context:v6];
  }
}

- (void)eventViewController:(id)a3 requestsShowEvent:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  [(ListViewController *)self eventViewController:v7 didCompleteWithAction:0];
  id v8 = [v7 context];

  [(ListViewController *)self showEvent:v6 animated:1 showMode:1 context:v8];
}

- (id)pasteboardManager
{
  v2 = [(MainViewController *)self model];
  id v3 = [v2 pasteboardManager];

  return v3;
}

- (BOOL)gestureRecognizerShouldBegin:(id)a3
{
  BOOL v4 = (UITapGestureRecognizer *)a3;
  id v5 = v4;
  BOOL v6 = self->_multiSelectGestureRecognizer != v4
    || ((unint64_t)[(UITapGestureRecognizer *)v4 modifierFlags] & 0x120000) != 0;

  return v6;
}

- (void)_multiSelect:(id)a3
{
  [a3 locationInView:self->_tableView];
  uint64_t v4 = -[ListTableView indexPathForRowAtPoint:](self->_tableView, "indexPathForRowAtPoint:");
  uint64_t v5 = v4;
  if (v4)
  {
    uint64_t v9 = v4;
    BOOL v6 = [(ListTableView *)self->_tableView indexPathsForSelectedRows];
    id v7 = [(MainViewController *)self model];
    id v8 = [v7 cachedOccurrenceAtIndexPath:v9 usingFilter:[self showFilteredData]];

    if ([v6 containsObject:v9])
    {
      [(ListViewController *)self _deselectRowAtIndexPath:v9 animated:1];
      [(CUIKCalendarModel *)self->super._model deselectOccurrence:v8];
    }
    else
    {
      [(ListViewController *)self _selectRowAtIndexPath:v9 animated:1 scrollPosition:0];
      [(CUIKCalendarModel *)self->super._model selectOccurrence:v8];
    }

    uint64_t v5 = v9;
  }

  _objc_release_x1(v4, v5);
}

- (void)_deselectAllSelectedRowsAnimated:(BOOL)a3
{
  uint64_t v4 = [(ListTableView *)self->_tableView indexPathsForSelectedRows];
  long long v9 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  id v5 = [v4 countByEnumeratingWithState:&v9 objects:v13 count:16];
  if (v5)
  {
    id v6 = v5;
    uint64_t v7 = *(void *)v10;
    do
    {
      id v8 = 0;
      do
      {
        if (*(void *)v10 != v7) {
          objc_enumerationMutation(v4);
        }
        [(ListViewController *)self _deselectRowAtIndexPath:*(void *)(*((void *)&v9 + 1) + 8 * (void)v8) animated:1];
        id v8 = (char *)v8 + 1;
      }
      while (v6 != v8);
      id v6 = [v4 countByEnumeratingWithState:&v9 objects:v13 count:16];
    }
    while (v6);
  }
}

- (BOOL)canPerformAction:(SEL)a3 withSender:(id)a4
{
  id v6 = a4;
  if ((+[CUIKPasteboardUtilities declinesToPerformCutCopyPasteAction:a3 withSender:v6] & 1) == 0)
  {
    if ("paste:" == a3)
    {
      id v8 = [(CUIKCalendarModel *)self->super._model pasteboardManager];
      unsigned __int8 v7 = [v8 canPerformPaste];

      goto LABEL_11;
    }
    if ("copy:" == a3)
    {
      long long v9 = [(CUIKCalendarModel *)self->super._model selectedOccurrences];
      uint64_t v10 = 1;
    }
    else
    {
      if ("cut:" != a3)
      {
        v12.receiver = self;
        v12.super_class = (Class)ListViewController;
        unsigned __int8 v7 = [(ListViewController *)&v12 canPerformAction:a3 withSender:v6];
        goto LABEL_11;
      }
      long long v9 = [(CUIKCalendarModel *)self->super._model selectedOccurrences];
      uint64_t v10 = 0;
    }
    unsigned __int8 v7 = +[CUIKPasteboardUtilities allEventsValidForAction:v10 fromEvents:v9];

    goto LABEL_11;
  }
  unsigned __int8 v7 = 0;
LABEL_11:

  return v7;
}

- (void)cut:(id)a3
{
  id v6 = [(CUIKCalendarModel *)self->super._model selectedOccurrences];
  if ([v6 count])
  {
    uint64_t v4 = [(CUIKCalendarModel *)self->super._model pasteboardManager];
    id v5 = +[NSSet setWithArray:v6];
    [v4 cutEvents:v5 delegate:self];
  }
}

- (void)copy:(id)a3
{
  id v6 = [(CUIKCalendarModel *)self->super._model selectedOccurrences];
  if ([v6 count])
  {
    uint64_t v4 = [(CUIKCalendarModel *)self->super._model pasteboardManager];
    id v5 = +[NSSet setWithArray:v6];
    [v4 copyEvents:v5 delegate:self];
  }
}

- (void)paste:(id)a3
{
  id v7 = [(CUIKCalendarModel *)self->super._model selectedOccurrence];
  if (v7)
  {
    uint64_t v4 = [(CUIKCalendarModel *)self->super._model pasteboardManager];
    id v5 = [v7 startDate];
    [v4 setDateForPaste:v5];
  }
  id v6 = [(CUIKCalendarModel *)self->super._model pasteboardManager];
  [v6 pasteEventsWithDateMode:0 delegate:self];
}

- (void)pasteboardManager:(id)a3 presentAlert:(id)a4
{
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

- (void)eventIconButtonPressed:(id)a3
{
  uint64_t v4 = [a3 event];
  objc_msgSend(v4, "setCompleted:", objc_msgSend(v4, "completed") ^ 1);
  id v5 = [(ListViewController *)self EKUI_editor];
  id v9 = 0;
  unsigned __int8 v6 = [v5 saveEvent:v4 span:0 error:&v9];
  id v7 = v9;

  if ((v6 & 1) == 0)
  {
    id v8 = kCalUILogHandle;
    if (os_log_type_enabled((os_log_t)kCalUILogHandle, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412290;
      id v11 = v7;
      _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_ERROR, "Couldn't complete/uncomplete event: %@", buf, 0xCu);
    }
  }
}

- (void)dayNavigationViewController:(id)a3 didSelectDate:(id)a4
{
}

- (BOOL)allowExtendedHeightCells
{
  return self->_allowExtendedHeightCells;
}

- (void)setAllowExtendedHeightCells:(BOOL)a3
{
  self->_allowExtendedHeightCells = a3;
}

- (BOOL)preventScrollingForNextViewAppear
{
  return self->_preventScrollingForNextViewAppear;
}

- (void)setPreventScrollingForNextViewAppear:(BOOL)a3
{
  self->_preventScrollingForNextViewAppear = a3;
}

- (BOOL)overrideExtendedEdges
{
  return self->_overrideExtendedEdges;
}

- (void)setOverrideExtendedEdges:(BOOL)a3
{
  self->_overrideExtendedEdges = a3;
}

- (ListViewControllerDelegate)delegate
{
  return self->_delegate;
}

- (void)setDelegate:(id)a3
{
}

- (unint64_t)destination
{
  return self->_destination;
}

- (void)setDestination:(unint64_t)a3
{
  self->_destination = a3;
}

- (EKEvent)currentSelectedEvent
{
  return self->_currentSelectedEvent;
}

- (void)setCurrentSelectedEvent:(id)a3
{
}

- (BOOL)showFilteredData
{
  return self->_showFilteredData;
}

- (void)setShowFilteredData:(BOOL)a3
{
  self->_showFilteredData = a3;
}

- (BOOL)showScrubber
{
  return self->_showScrubber;
}

- (void)setShowScrubber:(BOOL)a3
{
  self->_showScrubber = a3;
}

- (void)setTableView:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_tableView, 0);
  objc_storeStrong((id *)&self->_currentSelectedEvent, 0);
  objc_storeStrong((id *)&self->_delegate, 0);
  objc_storeStrong((id *)&self->_multiSelectGestureRecognizer, 0);
  objc_storeStrong((id *)&self->_dateToShowWhenVisible, 0);
  objc_storeStrong((id *)&self->_userActivity, 0);
  objc_storeStrong((id *)&self->_recurrenceAlertController, 0);
  objc_storeStrong((id *)&self->_swipedRow, 0);
  objc_storeStrong((id *)&self->_firstVisibleHeaderDate, 0);
  objc_storeStrong((id *)&self->_scrubberController, 0);

  objc_storeStrong((id *)&self->_palette, 0);
}

@end