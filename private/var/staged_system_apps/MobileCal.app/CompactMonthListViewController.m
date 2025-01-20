@interface CompactMonthListViewController
- (BOOL)_rowDrawsBackground:(id)a3;
- (BOOL)canPerformAction:(SEL)a3 withSender:(id)a4;
- (BOOL)disabled;
- (BOOL)gestureRecognizerShouldBegin:(id)a3;
- (CompactMonthListViewController)initWithModel:(id)a3;
- (CompactMonthListViewControllerDelegate)compactMonthListViewDelegate;
- (id)_eventForRowAtIndexPath:(id)a3;
- (id)pasteboardManager;
- (id)tableView:(id)a3 cellForRowAtIndexPath:(id)a4;
- (id)tableView:(id)a3 contextMenuConfigurationForRowAtIndexPath:(id)a4 point:(CGPoint)a5;
- (int64_t)numberOfSectionsInTableView:(id)a3;
- (int64_t)tableView:(id)a3 editingStyleForRowAtIndexPath:(id)a4;
- (int64_t)tableView:(id)a3 numberOfRowsInSection:(int64_t)a4;
- (void)_contentCategorySizeChanged:(id)a3;
- (void)_deleteEventAtIndexPath:(id)a3 withCompletionHandler:(id)a4;
- (void)_flashOccurrenceTableScrollIndicators;
- (void)_ignoreSelectedOccurrencesChangedNotification:(id)a3;
- (void)_localeChanged:(id)a3;
- (void)_multiSelect:(id)a3;
- (void)_occurrencesChanged:(id)a3;
- (void)_purgeCachedOccurrence:(id)a3;
- (void)_reloadOccurrenceData;
- (void)_reloadTableViewAndScrollIfNeededWithForceScroll:(BOOL)a3;
- (void)_scrollToIdealPosition;
- (void)_selectedDateChanged:(id)a3;
- (void)_selectedOccurrencesChanged:(id)a3;
- (void)_significantTimeChange:(id)a3;
- (void)_updateContentUnavailableConfigurationUsingState:(id)a3;
- (void)_updateOccurrenceTable;
- (void)_updateOccurrenceTableWithForce:(BOOL)a3;
- (void)attemptDisplayReviewPrompt;
- (void)copy:(id)a3;
- (void)cut:(id)a3;
- (void)deselectAllRowsAnimated:(BOOL)a3;
- (void)eventIconButtonPressed:(id)a3;
- (void)forceUpdate;
- (void)paste:(id)a3;
- (void)pasteboardManager:(id)a3 beginEditingEvent:(id)a4;
- (void)pasteboardManager:(id)a3 didFinishPasteWithResult:(unint64_t)a4 willOpenEditor:(BOOL)a5;
- (void)pasteboardManager:(id)a3 presentAlert:(id)a4;
- (void)setCompactMonthListViewDelegate:(id)a3;
- (void)setDisabled:(BOOL)a3;
- (void)tableView:(id)a3 commitEditingStyle:(int64_t)a4 forRowAtIndexPath:(id)a5;
- (void)tableView:(id)a3 didDeselectRowAtIndexPath:(id)a4;
- (void)tableView:(id)a3 didSelectRowAtIndexPath:(id)a4;
- (void)tableView:(id)a3 willEndContextMenuInteractionWithConfiguration:(id)a4 animator:(id)a5;
- (void)tableView:(id)a3 willPerformPreviewActionForMenuWithConfiguration:(id)a4 animator:(id)a5;
- (void)viewDidAppear:(BOOL)a3;
- (void)viewDidLoad;
- (void)viewWillDisappear:(BOOL)a3;
@end

@implementation CompactMonthListViewController

- (CompactMonthListViewController)initWithModel:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)CompactMonthListViewController;
  v6 = [(CompactMonthListViewController *)&v9 initWithStyle:0];
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_model, a3);
    v7->_cachedRowHeight = -1.0;
  }

  return v7;
}

- (void)viewDidLoad
{
  v26.receiver = self;
  v26.super_class = (Class)CompactMonthListViewController;
  [(CompactMonthListViewController *)&v26 viewDidLoad];
  v3 = [(CompactMonthListViewController *)self tableView];
  [v3 setSeparatorStyle:0];

  v4 = [(CompactMonthListViewController *)self tableView];
  [v4 setRowHeight:UITableViewAutomaticDimension];

  double left = UIEdgeInsetsZero.left;
  double bottom = UIEdgeInsetsZero.bottom;
  double right = UIEdgeInsetsZero.right;
  v8 = [(CompactMonthListViewController *)self tableView];
  [v8 setSeparatorInset:UIEdgeInsetsZero.top, left, bottom, right];

  objc_super v9 = [(CompactMonthListViewController *)self tableView];
  [v9 setAllowsMultipleSelection:1];

  v10 = [(CompactMonthListViewController *)self tableView];
  [v10 setAccessibilityIdentifier:@"CompactMonthListViewTable"];

  v11 = [(CompactMonthListViewController *)self tableView];
  uint64_t v12 = objc_opt_class();
  v13 = (objc_class *)objc_opt_class();
  v14 = NSStringFromClass(v13);
  [v11 registerClass:v12 forCellReuseIdentifier:v14];

  v15 = [(CompactMonthListViewController *)self tableView];
  uint64_t v16 = objc_opt_class();
  v17 = (objc_class *)objc_opt_class();
  v18 = NSStringFromClass(v17);
  [v15 registerClass:v16 forCellReuseIdentifier:v18];

  v19 = [(CompactMonthListViewController *)self tableView];
  uint64_t v20 = objc_opt_class();
  v21 = (objc_class *)objc_opt_class();
  v22 = NSStringFromClass(v21);
  [v19 registerClass:v20 forCellReuseIdentifier:v22];

  v23 = (UITapGestureRecognizer *)[objc_alloc((Class)UITapGestureRecognizer) initWithTarget:self action:"_multiSelect:"];
  multiSelectGestureRecognizer = self->_multiSelectGestureRecognizer;
  self->_multiSelectGestureRecognizer = v23;

  [(UITapGestureRecognizer *)self->_multiSelectGestureRecognizer setAllowedTouchTypes:&off_1001DC980];
  [(UITapGestureRecognizer *)self->_multiSelectGestureRecognizer setDelegate:self];
  v25 = [(CompactMonthListViewController *)self tableView];
  [v25 addGestureRecognizer:self->_multiSelectGestureRecognizer];

  self->_shouldScrollToIdealPosition = 1;
}

- (void)viewDidAppear:(BOOL)a3
{
  v16.receiver = self;
  v16.super_class = (Class)CompactMonthListViewController;
  [(CompactMonthListViewController *)&v16 viewDidAppear:a3];
  v4 = (void *)kCalUILogHandle;
  if (os_log_type_enabled((os_log_t)kCalUILogHandle, OS_LOG_TYPE_INFO))
  {
    id v5 = v4;
    v6 = (objc_class *)objc_opt_class();
    v7 = NSStringFromClass(v6);
    v8 = [(CUIKCalendarModel *)self->_model selectedDate];
    *(_DWORD *)buf = 138543618;
    v18 = v7;
    __int16 v19 = 2114;
    uint64_t v20 = v8;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_INFO, "[UserStateLog] State -> %{public}@ viewDidAppear. date = %{public}@", buf, 0x16u);
  }
  objc_super v9 = [(CompactMonthListViewController *)self view];
  v10 = [v9 window];

  if (v10) {
    goto LABEL_4;
  }
  v11 = [(CompactMonthListViewController *)self navigationController];
  uint64_t v12 = [v11 view];
  v13 = [v12 window];

  if (!v13)
  {
LABEL_4:
    [(CompactMonthListViewController *)self _reloadOccurrenceData];
  }
  else
  {
    EKUIPushFallbackSizingContextWithViewHierarchy();
    [(CompactMonthListViewController *)self _reloadOccurrenceData];
    EKUIPopFallbackSizingContextWithViewHierarchy();
  }
  v14 = +[NSNotificationCenter defaultCenter];
  [v14 addObserver:self selector:"_selectedDateChanged:" name:CUIKCalendarModelSelectedDateChangedNotification object:self->_model];
  [v14 addObserver:self selector:"_occurrencesChanged:" name:CUIKCalendarModelDisplayedOccurrencesChangedNotification object:self->_model];
  [v14 addObserver:self selector:"_selectedOccurrencesChanged:" name:CUIKCalendarModelSelectedOccurrencesChangedNotification object:self->_model];
  [v14 addObserver:self selector:"_significantTimeChange:" name:CUIKCalendarModelSignificantTimeChangeNotification object:self->_model];
  [v14 addObserver:self selector:"_localeChanged:" name:CUIKLocaleChangedNotification object:0];
  [v14 addObserver:self selector:"_contentCategorySizeChanged:" name:UIContentSizeCategoryDidChangeNotification object:0];
  v15 = [(CompactMonthListViewController *)self tableView];
  [v15 selectRowAtIndexPath:0 animated:1 scrollPosition:0];
}

- (void)viewWillDisappear:(BOOL)a3
{
  v5.receiver = self;
  v5.super_class = (Class)CompactMonthListViewController;
  [(CompactMonthListViewController *)&v5 viewWillDisappear:a3];
  v4 = +[NSNotificationCenter defaultCenter];
  [v4 removeObserver:self name:CUIKCalendarModelSelectedDateChangedNotification object:self->_model];
  [v4 removeObserver:self name:CUIKCalendarModelDisplayedOccurrencesChangedNotification object:self->_model];
  [v4 removeObserver:self name:CUIKCalendarModelSignificantTimeChangeNotification object:self->_model];
  [v4 removeObserver:self name:CUIKLocaleChangedNotification object:0];
  [v4 removeObserver:self name:UIContentSizeCategoryDidChangeNotification object:0];
  +[NSObject cancelPreviousPerformRequestsWithTarget:self selector:"_flashOccurrenceTableScrollIndicators" object:0];
}

- (void)setDisabled:(BOOL)a3
{
  if (self->_disabled != a3)
  {
    self->_disabled = a3;
    if (!a3) {
      [(CompactMonthListViewController *)self _reloadTableViewAndScrollIfNeededWithForceScroll:1];
    }
  }
}

- (void)_selectedDateChanged:(id)a3
{
  self->_shouldScrollToIdealPosition = 1;
  [(CompactMonthListViewController *)self _updateOccurrenceTable];
}

- (void)_occurrencesChanged:(id)a3
{
  id v4 = a3;
  objc_super v5 = [v4 userInfo];
  id v21 = [v5 objectForKey:CUIKCalendarModelDisplayedOccurrencesChangedRangeStartKey];

  v6 = [v4 userInfo];

  v7 = [v6 objectForKey:CUIKCalendarModelDisplayedOccurrencesChangedRangeEndKey];

  if (v21) {
    BOOL v8 = v7 == 0;
  }
  else {
    BOOL v8 = 1;
  }
  if (!v8)
  {
    [v21 timeIntervalSinceReferenceDate];
    double v10 = v9;
    [v7 timeIntervalSinceReferenceDate];
    double v12 = v11;
    v13 = [(CUIKCalendarModel *)self->_model selectedDate];
    v14 = [v13 calendarDateForDay];
    [v14 absoluteTime];
    double v16 = v15;

    v17 = [v13 calendarDateForEndOfDay];
    [v17 absoluteTime];
    double v19 = v18;

    if (v10 <= v19 && v12 >= v16) {
      [(CompactMonthListViewController *)self _updateOccurrenceTable];
    }
  }
}

- (void)_selectedOccurrencesChanged:(id)a3
{
  if (!self->_shouldIgnoreSelectedOccurrencesChangedNotification)
  {
    [(CompactMonthListViewController *)self deselectAllRowsAnimated:0];
    long long v15 = 0u;
    long long v16 = 0u;
    long long v13 = 0u;
    long long v14 = 0u;
    id v4 = [(CUIKCalendarModel *)self->_model selectedOccurrences];
    id v5 = [v4 countByEnumeratingWithState:&v13 objects:v17 count:16];
    if (v5)
    {
      id v6 = v5;
      uint64_t v7 = *(void *)v14;
      do
      {
        for (i = 0; i != v6; i = (char *)i + 1)
        {
          if (*(void *)v14 != v7) {
            objc_enumerationMutation(v4);
          }
          id v9 = [(NSMutableArray *)self->_selectedDayOccurrences indexOfObject:*(void *)(*((void *)&v13 + 1) + 8 * i)];
          if (v9 != (id)0x7FFFFFFFFFFFFFFFLL)
          {
            id v10 = v9;
            double v11 = [(CompactMonthListViewController *)self tableView];
            double v12 = +[NSIndexPath indexPathForRow:v10 inSection:0];
            [v11 selectRowAtIndexPath:v12 animated:0 scrollPosition:0];
          }
        }
        id v6 = [v4 countByEnumeratingWithState:&v13 objects:v17 count:16];
      }
      while (v6);
    }
  }
}

- (void)_significantTimeChange:(id)a3
{
  id v4 = [a3 userInfo];
  uint64_t v7 = [v4 objectForKey:CUIKCalendarModelSignificantTimeChangeNotificationDayChangedKey];

  id v5 = [v7 BOOLValue];
  id v6 = v7;
  if ((v5 & 1) != 0 || !v7)
  {
    id v5 = [(CompactMonthListViewController *)self _reloadTableViewAndScrollIfNeededWithForceScroll:1];
    id v6 = v7;
  }

  _objc_release_x1(v5, v6);
}

- (void)_localeChanged:(id)a3
{
}

- (void)_contentCategorySizeChanged:(id)a3
{
  self->_cachedRowHeight = -1.0;
  [(CompactMonthListViewController *)self _reloadTableViewAndScrollIfNeededWithForceScroll:1];
}

- (void)_reloadOccurrenceData
{
  if ([(CUIKCalendarModel *)self->_model cachedOccurrencesAreLoaded])
  {
    [(CompactMonthListViewController *)self _updateOccurrenceTable];
    [(CompactMonthListViewController *)self _scrollToIdealPosition];
  }
  else if (!self->_loadingOccurrenceCache)
  {
    self->_loadingOccurrenceCache = 1;
    id v3 = [(CUIKCalendarModel *)self->_model selectedDateOccurrences:0 loadIsComplete:0];
    id v4 = dispatch_get_global_queue(0, 0);
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_100049EA0;
    block[3] = &unk_1001D2740;
    block[4] = self;
    dispatch_async(v4, block);
  }
}

- (void)_updateOccurrenceTable
{
}

- (void)_updateOccurrenceTableWithForce:(BOOL)a3
{
  if (self->_loadingOccurrenceCache && !a3) {
    return;
  }
  BOOL v4 = a3;
  char v13 = 0;
  id v6 = [(CUIKCalendarModel *)self->_model selectedDate];

  if (!v6)
  {
    selectedDayOccurrences = self->_selectedDayOccurrences;
    self->_selectedDayOccurrences = 0;

    char v13 = 1;
LABEL_13:
    [(CompactMonthListViewController *)self _setNeedsUpdateContentUnavailableConfiguration];
    return;
  }
  uint64_t v7 = [(CUIKCalendarModel *)self->_model selectedDateOccurrences:v4 loadIsComplete:&v13];
  BOOL v8 = +[NSMutableArray arrayWithArray:v7];
  id v9 = self->_selectedDayOccurrences;
  self->_selectedDayOccurrences = v8;

  id v10 = [(NSMutableArray *)self->_selectedDayOccurrences count];
  [(CompactMonthListViewController *)self _reloadTableViewAndScrollIfNeededWithForceScroll:0];
  if (v10)
  {
    if (self->_willFlashOccurrenceTableScrollIndicators) {
      +[NSObject cancelPreviousPerformRequestsWithTarget:self selector:"_flashOccurrenceTableScrollIndicators" object:0];
    }
    self->_willFlashOccurrenceTableScrollIndicators = 1;
    double v11 = [(CompactMonthListViewController *)self tableView];
    [v11 setShowsVerticalScrollIndicator:0];

    [(CompactMonthListViewController *)self performSelector:"_flashOccurrenceTableScrollIndicators" withObject:0 afterDelay:0.2];
  }

  if (v13) {
    goto LABEL_13;
  }
}

- (void)_updateContentUnavailableConfigurationUsingState:(id)a3
{
  if ([(NSMutableArray *)self->_selectedDayOccurrences count])
  {
    [(CompactMonthListViewController *)self _setContentUnavailableConfiguration:0];
  }
  else
  {
    id v8 = +[UIContentUnavailableConfiguration emptyConfiguration];
    BOOL v4 = +[NSBundle bundleForClass:objc_opt_class()];
    id v5 = [v4 localizedStringForKey:@"No Events" value:&stru_1001D6918 table:0];
    [v8 setText:v5];

    id v6 = +[UIColor secondaryLabelColor];
    uint64_t v7 = [v8 textProperties];
    [v7 setColor:v6];

    [(CompactMonthListViewController *)self _setContentUnavailableConfiguration:v8];
  }
}

- (void)_flashOccurrenceTableScrollIndicators
{
  id v3 = [(CompactMonthListViewController *)self tableView];
  [v3 setShowsVerticalScrollIndicator:1];

  BOOL v4 = [(CompactMonthListViewController *)self tableView];
  [v4 flashScrollIndicators];

  self->_willFlashOccurrenceTableScrollIndicators = 0;
}

- (void)deselectAllRowsAnimated:(BOOL)a3
{
  BOOL v3 = a3;
  id v5 = [(CompactMonthListViewController *)self tableView];
  id v6 = [v5 indexPathsForSelectedRows];

  long long v16 = 0u;
  long long v17 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  id v7 = v6;
  id v8 = [v7 countByEnumeratingWithState:&v14 objects:v18 count:16];
  if (v8)
  {
    id v9 = v8;
    uint64_t v10 = *(void *)v15;
    do
    {
      double v11 = 0;
      do
      {
        if (*(void *)v15 != v10) {
          objc_enumerationMutation(v7);
        }
        uint64_t v12 = *(void *)(*((void *)&v14 + 1) + 8 * (void)v11);
        char v13 = [(CompactMonthListViewController *)self tableView];
        [v13 deselectRowAtIndexPath:v12 animated:v3];

        double v11 = (char *)v11 + 1;
      }
      while (v9 != v11);
      id v9 = [v7 countByEnumeratingWithState:&v14 objects:v18 count:16];
    }
    while (v9);
  }
}

- (void)forceUpdate
{
}

- (void)_ignoreSelectedOccurrencesChangedNotification:(id)a3
{
  self->_shouldIgnoreSelectedOccurrencesChangedNotification = 1;
  (*((void (**)(id, SEL))a3 + 2))(a3, a2);
  self->_shouldIgnoreSelectedOccurrencesChangedNotification = 0;
}

- (id)tableView:(id)a3 contextMenuConfigurationForRowAtIndexPath:(id)a4 point:(CGPoint)a5
{
  if (a4)
  {
    id v6 = -[CompactMonthListViewController _eventForRowAtIndexPath:](self, "_eventForRowAtIndexPath:", a4, a5.x, a5.y);
    if (v6)
    {
      id v7 = [(CUIKCalendarModel *)self->_model selectedOccurrences];
      unsigned __int8 v8 = [v7 containsObject:v6];

      if ((v8 & 1) == 0)
      {
        v14[0] = _NSConcreteStackBlock;
        v14[1] = 3221225472;
        v14[2] = sub_10004A59C;
        v14[3] = &unk_1001D28A8;
        v14[4] = self;
        id v15 = v6;
        [(CompactMonthListViewController *)self _ignoreSelectedOccurrencesChangedNotification:v14];
      }
      v12[0] = _NSConcreteStackBlock;
      v12[1] = 3221225472;
      v12[2] = sub_10004A630;
      v12[3] = &unk_1001D2830;
      id v13 = v6;
      v11[0] = _NSConcreteStackBlock;
      v11[1] = 3221225472;
      v11[2] = sub_10004A674;
      v11[3] = &unk_1001D2880;
      v11[4] = self;
      id v9 = +[UIContextMenuConfiguration configurationWithIdentifier:0 previewProvider:v12 actionProvider:v11];
    }
    else
    {
      id v9 = 0;
    }
  }
  else
  {
    id v9 = 0;
  }

  return v9;
}

- (void)tableView:(id)a3 willPerformPreviewActionForMenuWithConfiguration:(id)a4 animator:(id)a5
{
  id v6 = a5;
  id v7 = [v6 previewViewController];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    unsigned __int8 v8 = [v6 previewViewController];
  }
  else
  {
    unsigned __int8 v8 = 0;
  }

  [v8 willCommitPreview];
  v10[0] = _NSConcreteStackBlock;
  v10[1] = 3221225472;
  v10[2] = sub_10004A854;
  v10[3] = &unk_1001D28A8;
  v10[4] = self;
  id v11 = v8;
  id v9 = v8;
  [v6 addAnimations:v10];
}

- (void)tableView:(id)a3 willEndContextMenuInteractionWithConfiguration:(id)a4 animator:(id)a5
{
  id v6 = [(CUIKCalendarModel *)self->_model selectedOccurrences];
  id v7 = [v6 count];

  if (v7 == (id)1)
  {
    model = self->_model;
    [(CUIKCalendarModel *)model setSelectedOccurrences:&__NSArray0__struct];
  }
}

- (int64_t)numberOfSectionsInTableView:(id)a3
{
  return 1;
}

- (int64_t)tableView:(id)a3 numberOfRowsInSection:(int64_t)a4
{
  if ([(CompactMonthListViewController *)self disabled]) {
    return 0;
  }
  selectedDayOccurrences = self->_selectedDayOccurrences;

  return (int64_t)[(NSMutableArray *)selectedDayOccurrences count];
}

- (id)_eventForRowAtIndexPath:(id)a3
{
  if (a3)
  {
    BOOL v4 = -[NSMutableArray objectAtIndex:](self->_selectedDayOccurrences, "objectAtIndex:", [a3 row]);
  }
  else
  {
    BOOL v4 = 0;
  }
  return v4;
}

- (id)tableView:(id)a3 cellForRowAtIndexPath:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  unsigned __int8 v8 = [(CompactMonthListViewController *)self _eventForRowAtIndexPath:v7];
  id v9 = [(CUIKCalendarModel *)self->_model selectedDate];
  uint64_t v10 = [v9 calendarDateForDay];
  id v11 = [v10 date];

  if (CUIKNSDateIsToday())
  {
    uint64_t v12 = [v8 endDate];
    id v13 = CUIKNowDate();
    BOOL v14 = [v12 compare:v13] == (id)-1;
  }
  else
  {
    BOOL v14 = 0;
  }
  if ([v8 isReminderIntegrationEvent])
  {
    id v15 = (objc_class *)objc_opt_class();
    long long v16 = NSStringFromClass(v15);
    long long v17 = [v6 dequeueReusableCellWithIdentifier:v16 forIndexPath:v7];

    [v17 setDelegate:self];
  }
  else
  {
    if (![v8 isAllDay])
    {
      uint64_t v20 = (objc_class *)objc_opt_class();
      id v21 = NSStringFromClass(v20);
      long long v17 = [v6 dequeueReusableCellWithIdentifier:v21 forIndexPath:v7];

      v22 = CUIKCalendar();
      [v8 startDate];
      v32 = v11;
      v24 = id v23 = v6;
      v25 = [v8 endDateUnadjustedForLegacyClients];
      id v26 = [v22 cal_isMultidayEventForUIWithStartDate:v24 endDate:v25];

      id v6 = v23;
      id v11 = v32;

      [v17 updateWithEvent:v8 isMultiday:v26 occurrenceStartDate:v32 dimmed:v14];
      goto LABEL_10;
    }
    double v18 = (objc_class *)objc_opt_class();
    double v19 = NSStringFromClass(v18);
    long long v17 = [v6 dequeueReusableCellWithIdentifier:v19 forIndexPath:v7];
  }
  [v17 updateWithEvent:v8 dimmed:v14];
LABEL_10:
  [(id)objc_opt_class() adjustedSeparatorInsets];
  [v17 setSeparatorInset:];
  v27 = (char *)[(NSMutableArray *)self->_selectedDayOccurrences count];
  if ((uint64_t)[v7 row] >= (uint64_t)(v27 - 1)
    || [(CompactMonthListViewController *)self _rowDrawsBackground:v7])
  {
    uint64_t v28 = 0;
  }
  else
  {
    v29 = +[NSIndexPath indexPathForRow:inSection:](NSIndexPath, "indexPathForRow:inSection:", (char *)[v7 row] + 1, objc_msgSend(v7, "section"));
    unsigned int v30 = [(CompactMonthListViewController *)self _rowDrawsBackground:v29];

    uint64_t v28 = v30 ^ 1;
  }
  [v17 setDrawsOwnRowSeparators:v28];

  return v17;
}

- (BOOL)_rowDrawsBackground:(id)a3
{
  uint64_t v3 = [(CompactMonthListViewController *)self _eventForRowAtIndexPath:a3];
  unsigned __int8 v4 = +[EKUIListViewCell drawsBackgroundForEvent:v3];

  return v4;
}

- (void)tableView:(id)a3 didSelectRowAtIndexPath:(id)a4
{
  id v9 = a3;
  id v6 = a4;
  uint64_t v7 = (uint64_t)[v6 row];
  unsigned __int8 v8 = [(CompactMonthListViewController *)self presentedViewController];
  if (!v8
    && v7 != 0x7FFFFFFFFFFFFFFFLL
    && self->_compactMonthListViewDelegate
    && v7 < (uint64_t)[(NSMutableArray *)self->_selectedDayOccurrences count])
  {
    if (v7 < 0) {
      goto LABEL_8;
    }
    unsigned __int8 v8 = [(CompactMonthListViewController *)self _eventForRowAtIndexPath:v6];
    [(CompactMonthListViewControllerDelegate *)self->_compactMonthListViewDelegate compactMonthListViewController:self didSelectEvent:v8 showMode:1];
    [(CompactMonthListViewController *)self deselectAllRowsAnimated:1];
    [v9 selectRowAtIndexPath:v6 animated:1 scrollPosition:0];
  }

LABEL_8:
}

- (void)tableView:(id)a3 didDeselectRowAtIndexPath:(id)a4
{
  id v5 = [(CompactMonthListViewController *)self _eventForRowAtIndexPath:a4];
  [(CUIKCalendarModel *)self->_model deselectOccurrence:v5];
}

- (void)_reloadTableViewAndScrollIfNeededWithForceScroll:(BOOL)a3
{
  id v5 = [(CompactMonthListViewController *)self tableView];
  [v5 reloadData];

  self->_shouldScrollToIdealPosition |= a3;

  [(CompactMonthListViewController *)self _scrollToIdealPosition];
}

- (void)_scrollToIdealPosition
{
  if (self->_shouldScrollToIdealPosition && !self->_disabled)
  {
    self->_shouldScrollToIdealPosition = 0;
    uint64_t v3 = [(CUIKCalendarModel *)self->_model selectedDate];
    unsigned __int8 v4 = [v3 calendarDateForDay];
    id v15 = [v4 date];

    unsigned __int8 IsToday = CUIKNSDateIsToday();
    if ([(NSMutableArray *)self->_selectedDayOccurrences count])
    {
      uint64_t v6 = 0;
      while (1)
      {
        uint64_t v7 = [(NSMutableArray *)self->_selectedDayOccurrences objectAtIndexedSubscript:v6];
        unsigned __int8 v8 = [v7 endDate];
        id v9 = CUIKNowDate();
        unsigned __int8 v10 = [v8 CalIsAfterDate:v9];

        if (IsToday & v10) {
          break;
        }
        if (++v6 >= (unint64_t)[(NSMutableArray *)self->_selectedDayOccurrences count]) {
          goto LABEL_8;
        }
      }
    }
    else
    {
LABEL_8:
      uint64_t v6 = 0;
    }
    id v11 = [(NSMutableArray *)self->_selectedDayOccurrences count];
    uint64_t v12 = [(CompactMonthListViewController *)self tableView];
    id v13 = v12;
    if (v11)
    {
      BOOL v14 = +[NSIndexPath indexPathForRow:v6 inSection:0];
      [v13 scrollToRowAtIndexPath:v14 atScrollPosition:1 animated:0];
    }
    else
    {
      [v12 setContentOffset:CGPointZero animated:0];
    }
  }
}

- (void)tableView:(id)a3 commitEditingStyle:(int64_t)a4 forRowAtIndexPath:(id)a5
{
  id v8 = a3;
  id v9 = a5;
  unsigned __int8 v10 = +[CUIKPreferences sharedPreferences];
  unsigned int v11 = [v10 swipeToDeleteEnabled];

  if (a4 == 1 && v11)
  {
    v12[0] = _NSConcreteStackBlock;
    v12[1] = 3221225472;
    v12[2] = sub_10004B270;
    v12[3] = &unk_1001D28D0;
    void v12[4] = self;
    id v13 = v9;
    id v14 = v8;
    [(CompactMonthListViewController *)self _deleteEventAtIndexPath:v13 withCompletionHandler:v12];
  }
}

- (void)_purgeCachedOccurrence:(id)a3
{
  id v9 = a3;
  unsigned __int8 v4 = [(CompactMonthListViewController *)self tableView];
  int64_t v5 = [(CompactMonthListViewController *)self tableView:v4 numberOfRowsInSection:0];

  if (v5)
  {
    uint64_t v6 = 0;
    while (1)
    {
      uint64_t v7 = +[NSIndexPath indexPathForRow:v6 inSection:0];
      id v8 = [(CompactMonthListViewController *)self _eventForRowAtIndexPath:v7];
      if ([v8 isEqual:v9]) {
        break;
      }

      if (v5 == ++v6) {
        goto LABEL_7;
      }
    }
    [(NSMutableArray *)self->_selectedDayOccurrences removeObjectAtIndex:v6];
  }
LABEL_7:
}

- (void)_deleteEventAtIndexPath:(id)a3 withCompletionHandler:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = [(CompactMonthListViewController *)self _eventForRowAtIndexPath:v6];
  objc_initWeak(&location, self);
  id v9 = +[NSBundle bundleForClass:objc_opt_class()];
  unsigned __int8 v10 = [v9 localizedStringForKey:@"Delete" value:&stru_1001D6918 table:0];
  v15[0] = _NSConcreteStackBlock;
  v15[1] = 3221225472;
  v15[2] = sub_10004B5CC;
  v15[3] = &unk_1001D2F30;
  objc_copyWeak(&v18, &location);
  id v11 = v8;
  id v16 = v11;
  id v12 = v7;
  id v17 = v12;
  id v13 = +[EKUIRecurrenceAlertController presentDeleteAlertWithOptions:0 viewController:self barButtonItem:0 forEvent:v11 stringForDeleteButton:v10 withCompletionHandler:v15];
  recurrenceAlertController = self->_recurrenceAlertController;
  self->_recurrenceAlertController = v13;

  objc_destroyWeak(&v18);
  objc_destroyWeak(&location);
}

- (int64_t)tableView:(id)a3 editingStyleForRowAtIndexPath:(id)a4
{
  unsigned __int8 v4 = [(CompactMonthListViewController *)self _eventForRowAtIndexPath:a4];
  int64_t v5 = +[CUIKPreferences sharedPreferences];
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

- (id)pasteboardManager
{
  return [(CUIKCalendarModel *)self->_model pasteboardManager];
}

- (void)attemptDisplayReviewPrompt
{
  id v5 = [(CompactMonthListViewController *)self view];
  uint64_t v3 = [v5 window];
  unsigned __int8 v4 = [v3 windowScene];
  +[EKUIAppReviewUtils displayReviewPromptIfNeededInScene:v4 calendarModel:self->_model];
}

- (BOOL)canPerformAction:(SEL)a3 withSender:(id)a4
{
  id v6 = a4;
  if ((+[CUIKPasteboardUtilities declinesToPerformCutCopyPasteAction:a3 withSender:v6] & 1) == 0)
  {
    if ("paste:" == a3)
    {
      id v8 = [(CUIKCalendarModel *)self->_model pasteboardManager];
      unsigned __int8 v7 = [v8 canPerformPaste];

      goto LABEL_11;
    }
    if ("copy:" == a3)
    {
      id v9 = [(CUIKCalendarModel *)self->_model selectedOccurrences];
      uint64_t v10 = 1;
    }
    else
    {
      if ("cut:" != a3)
      {
        v12.receiver = self;
        v12.super_class = (Class)CompactMonthListViewController;
        unsigned __int8 v7 = [(CompactMonthListViewController *)&v12 canPerformAction:a3 withSender:v6];
        goto LABEL_11;
      }
      id v9 = [(CUIKCalendarModel *)self->_model selectedOccurrences];
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
  id v6 = [(CUIKCalendarModel *)self->_model selectedOccurrences];
  if ([v6 count])
  {
    unsigned __int8 v4 = [(CUIKCalendarModel *)self->_model pasteboardManager];
    id v5 = +[NSSet setWithArray:v6];
    [v4 cutEvents:v5 delegate:self];
  }
}

- (void)copy:(id)a3
{
  id v6 = [(CUIKCalendarModel *)self->_model selectedOccurrences];
  if ([v6 count])
  {
    unsigned __int8 v4 = [(CUIKCalendarModel *)self->_model pasteboardManager];
    id v5 = +[NSSet setWithArray:v6];
    [v4 copyEvents:v5 delegate:self];
  }
}

- (void)paste:(id)a3
{
  id v7 = [(CUIKCalendarModel *)self->_model selectedOccurrence];
  if (v7)
  {
    unsigned __int8 v4 = [(CUIKCalendarModel *)self->_model pasteboardManager];
    id v5 = [v7 startDate];
    [v4 setDateForPaste:v5];
  }
  id v6 = [(CUIKCalendarModel *)self->_model pasteboardManager];
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
    [(CompactMonthListViewController *)self attemptDisplayReviewPrompt];
  }
}

- (BOOL)gestureRecognizerShouldBegin:(id)a3
{
  unsigned __int8 v4 = (UITapGestureRecognizer *)a3;
  id v5 = v4;
  BOOL v6 = self->_multiSelectGestureRecognizer != v4
    || ((unint64_t)[(UITapGestureRecognizer *)v4 modifierFlags] & 0x120000) != 0;

  return v6;
}

- (void)_multiSelect:(id)a3
{
  id v4 = a3;
  id v5 = [(CompactMonthListViewController *)self tableView];
  [v4 locationInView:v5];
  double v7 = v6;
  double v9 = v8;

  uint64_t v10 = [(CompactMonthListViewController *)self tableView];
  [v10 indexPathForRowAtPoint:v7, v9];
  id v18 = (id)objc_claimAutoreleasedReturnValue();

  id v11 = v18;
  if (v18)
  {
    objc_super v12 = [(CompactMonthListViewController *)self tableView];
    id v13 = [v12 indexPathsForSelectedRows];

    id v14 = [(CompactMonthListViewController *)self _eventForRowAtIndexPath:v18];
    unsigned int v15 = [v13 containsObject:v18];
    id v16 = [(CompactMonthListViewController *)self tableView];
    id v17 = v16;
    if (v15)
    {
      [v16 deselectRowAtIndexPath:v18 animated:1];

      [(CUIKCalendarModel *)self->_model deselectOccurrence:v14];
    }
    else
    {
      [v16 selectRowAtIndexPath:v18 animated:1 scrollPosition:0];

      [(CUIKCalendarModel *)self->_model selectOccurrence:v14];
    }

    id v11 = v18;
  }
}

- (void)eventIconButtonPressed:(id)a3
{
  id v4 = [a3 event];
  [v4 setCompleted:[v4 completed] ^ 1];
  id v5 = [(CompactMonthListViewController *)self EKUI_editor];
  id v9 = 0;
  unsigned __int8 v6 = [v5 saveEvent:v4 span:0 error:&v9];
  id v7 = v9;

  if ((v6 & 1) == 0)
  {
    double v8 = kCalUILogHandle;
    if (os_log_type_enabled((os_log_t)kCalUILogHandle, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412290;
      id v11 = v7;
      _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_ERROR, "Couldn't complete/uncomplete event: %@", buf, 0xCu);
    }
  }
}

- (CompactMonthListViewControllerDelegate)compactMonthListViewDelegate
{
  return self->_compactMonthListViewDelegate;
}

- (void)setCompactMonthListViewDelegate:(id)a3
{
  self->_compactMonthListViewDelegate = (CompactMonthListViewControllerDelegate *)a3;
}

- (BOOL)disabled
{
  return self->_disabled;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_multiSelectGestureRecognizer, 0);
  objc_storeStrong((id *)&self->_recurrenceAlertController, 0);
  objc_storeStrong((id *)&self->_selectedDayOccurrences, 0);

  objc_storeStrong((id *)&self->_model, 0);
}

@end