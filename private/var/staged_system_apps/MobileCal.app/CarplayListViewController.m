@interface CarplayListViewController
- (BOOL)_anyOccurrencesAvailable:(int64_t)a3;
- (BOOL)_shouldShowNoEventsView;
- (BOOL)_shouldShowTomorrowSection;
- (BOOL)showingTomorrowSection;
- (CarplayListViewController)initWithModel:(id)a3;
- (double)tableView:(id)a3 heightForHeaderInSection:(int64_t)a4;
- (id)_allDayOccurrences:(int64_t)a3;
- (id)_allFetchedOccurrences:(int64_t)a3;
- (id)_createListView;
- (id)_currentDateComponents;
- (id)_timedOccurrences:(int64_t)a3;
- (id)sharedManager;
- (id)tableView:(id)a3 cellForRowAtIndexPath:(id)a4;
- (id)tableView:(id)a3 viewForHeaderInSection:(int64_t)a4;
- (int64_t)numberOfSectionsInTableView:(id)a3;
- (int64_t)sectionForEvent:(id)a3;
- (int64_t)tableView:(id)a3 numberOfRowsInSection:(int64_t)a4;
- (void)_databaseDidChange:(id)a3;
- (void)_eventFetchCompleted;
- (void)_focusModeConfigurationChanged;
- (void)_forceUpdateCell:(id)a3;
- (void)_loadAndShowAppropriateContentView;
- (void)_localeChanged;
- (void)_refreshTodayView;
- (void)_setShowingNoEventsMode:(BOOL)a3;
- (void)_setViewStatesForCachedEventCollection;
- (void)_showListView;
- (void)_showNoEventsView;
- (void)_significantTimeChange:(id)a3;
- (void)_updateContent;
- (void)scrollToDate:(id)a3;
- (void)setShowingTomorrowSection:(BOOL)a3;
- (void)setViewControllerTitleForSelectedEventInSection:(int64_t)a3;
- (void)tableView:(id)a3 didHighlightRowAtIndexPath:(id)a4;
- (void)tableView:(id)a3 didSelectRowAtIndexPath:(id)a4;
- (void)tableView:(id)a3 didUnhighlightRowAtIndexPath:(id)a4;
- (void)viewWillAppear:(BOOL)a3;
- (void)viewWillDisappear:(BOOL)a3;
@end

@implementation CarplayListViewController

- (id)sharedManager
{
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100044044;
  block[3] = &unk_1001D2740;
  block[4] = self;
  if (qword_100216580 != -1) {
    dispatch_once(&qword_100216580, block);
  }
  return (id)qword_100216578;
}

- (CarplayListViewController)initWithModel:(id)a3
{
  id v5 = a3;
  v40.receiver = self;
  v40.super_class = (Class)CarplayListViewController;
  v6 = [(CarplayListViewController *)&v40 init];
  v7 = v6;
  if (v6)
  {
    p_model = (id *)&v6->_model;
    objc_storeStrong((id *)&v6->_model, a3);
    uint64_t v9 = [(CarplayListViewController *)v7 _createListView];
    listView = v7->_listView;
    v7->_listView = (UITableView *)v9;

    uint64_t v11 = objc_opt_new();
    noEventsView = v7->_noEventsView;
    v7->_noEventsView = (CarplayNoEventsView *)v11;

    -[CarplayNoEventsView setAnyCalendarsHiddenByFocus:](v7->_noEventsView, "setAnyCalendarsHiddenByFocus:", [*p_model focusFilterMode] == (id)1);
    uint64_t v13 = +[NSMutableSet set];
    changedObjectIDs = v7->_changedObjectIDs;
    v7->_changedObjectIDs = (NSMutableSet *)v13;

    v7->_needsForceRefresh = 1;
    uint64_t v15 = +[NSMutableDictionary dictionary];
    calendarColorMapping = v7->_calendarColorMapping;
    v7->_calendarColorMapping = (NSMutableDictionary *)v15;

    id v17 = objc_alloc((Class)EKCalendarVisibilityManager);
    v18 = [v5 eventStore];
    v35 = _NSConcreteStackBlock;
    uint64_t v36 = 3221225472;
    v37 = sub_100044408;
    v38 = &unk_1001D2740;
    v19 = v7;
    v39 = v19;
    v20 = (EKCalendarVisibilityManager *)[v17 initWithEventStore:v18 visibilityChangedCallback:&v35 queue:&_dispatch_main_q];
    visibilityManager = v19->_visibilityManager;
    v19->_visibilityManager = v20;

    v22 = [CarplayTableViewSection alloc];
    v23 = CUIKNowDate();
    v24 = CUIKStringForDateAndDayOfWeekInCalendarTimezoneWithFormattingContext();
    v25 = -[CarplayTableViewSection initWithPaddingCellEnabled:titleForSectionHeader:shouldCollapseMultipleAllDayEvents:model:](v22, "initWithPaddingCellEnabled:titleForSectionHeader:shouldCollapseMultipleAllDayEvents:model:", 1, v24, 1, *p_model, v35, v36, v37, v38);
    todaySection = v19->_todaySection;
    v19->_todaySection = v25;

    v27 = [CarplayTableViewSection alloc];
    v28 = +[NSBundle bundleForClass:objc_opt_class()];
    v29 = [v28 localizedStringForKey:@"Tomorrow" value:&stru_1001D6918 table:0];
    v30 = [(CarplayTableViewSection *)v27 initWithPaddingCellEnabled:0 titleForSectionHeader:v29 shouldCollapseMultipleAllDayEvents:1 model:*p_model];
    tomorrowSection = v19->_tomorrowSection;
    v19->_tomorrowSection = v30;

    v41[0] = v19->_todaySection;
    v41[1] = v19->_tomorrowSection;
    uint64_t v32 = +[NSArray arrayWithObjects:v41 count:2];
    sections = v19->_sections;
    v19->_sections = (NSArray *)v32;
  }
  return v7;
}

- (int64_t)sectionForEvent:(id)a3
{
  id v4 = a3;
  if ([(CarplayListViewController *)self _shouldShowNoEventsView])
  {
    int64_t v5 = 0x7FFFFFFFFFFFFFFFLL;
  }
  else
  {
    v6 = [(CarplayListViewController *)self _allFetchedOccurrences:0];
    int64_t v5 = 0;
    if (([v6 containsObject:v4] & 1) == 0)
    {
      if (![(CarplayListViewController *)self _shouldShowTomorrowSection]
        || (int64_t v5 = 1,
            [(CarplayListViewController *)self _allFetchedOccurrences:1],
            v7 = objc_claimAutoreleasedReturnValue(),
            unsigned __int8 v8 = [v7 containsObject:v4],
            v7,
            (v8 & 1) == 0))
      {
        int64_t v5 = 0x7FFFFFFFFFFFFFFFLL;
      }
    }
  }
  return v5;
}

- (void)scrollToDate:(id)a3
{
  id v16 = a3;
  if ([(CarplayListViewController *)self numberOfSectionsInTableView:self->_listView] >= 1)
  {
    id v4 = 0;
    uint64_t v5 = 0;
    double v6 = 1.79769313e308;
    do
    {
      if ([(CarplayListViewController *)self tableView:self->_listView numberOfRowsInSection:v5] >= 1)
      {
        uint64_t v7 = 0;
        do
        {
          unsigned __int8 v8 = +[NSIndexPath indexPathForRow:v7 inSection:v5];
          uint64_t v9 = [(CarplayListViewController *)self tableView:self->_listView cellForRowAtIndexPath:v8];
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) != 0
            || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0)
            || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
          {
            v10 = [v9 event];
            uint64_t v11 = [v10 startCalendarDate];

            if (v11)
            {
              [v16 differenceInSeconds:v11];
              if (v12 < v6)
              {
                double v13 = v12;
                if (v12 >= 0.0)
                {
                  id v14 = v8;

                  double v6 = v13;
                  id v4 = v14;
                }
              }
            }
          }
          else
          {
            uint64_t v11 = 0;
          }

          ++v7;
        }
        while (v7 < [(CarplayListViewController *)self tableView:self->_listView numberOfRowsInSection:v5]);
      }
      ++v5;
    }
    while (v5 < [(CarplayListViewController *)self numberOfSectionsInTableView:self->_listView]);
    if (v4)
    {
      uint64_t v15 = kCalUILogCarplayHandle;
      if (os_log_type_enabled((os_log_t)kCalUILogCarplayHandle, OS_LOG_TYPE_DEBUG))
      {
        *(_DWORD *)buf = 138412546;
        v18 = v4;
        __int16 v19 = 2048;
        double v20 = v6;
        _os_log_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_DEBUG, "Scrolling list to indexPath: %@, with foundDifference: %f", buf, 0x16u);
      }
      [(UITableView *)self->_listView scrollToRowAtIndexPath:v4 atScrollPosition:1 animated:1];
    }
  }
}

- (void)setViewControllerTitleForSelectedEventInSection:(int64_t)a3
{
  CUIKNowDate();
  id v9 = (id)objc_claimAutoreleasedReturnValue();
  if (a3 == 1)
  {
    uint64_t v5 = CUIKCalendar();
    uint64_t v6 = [v9 dateByAddingDays:1 inCalendar:v5];

    uint64_t v7 = CUIKStringForDate();
    unsigned __int8 v8 = [(CarplayListViewController *)self navigationItem];
    [v8 setTitle:v7];
    id v9 = (id)v6;
  }
  else
  {
    uint64_t v7 = CUIKStringForDate();
    unsigned __int8 v8 = [(CarplayListViewController *)self navigationItem];
    [v8 setTitle:v7];
  }
}

- (id)_createListView
{
  v3 = -[CarplayHeaderFooterTableView initWithFrame:style:]([CarplayHeaderFooterTableView alloc], "initWithFrame:style:", 0, CGRectZero.origin.x, CGRectZero.origin.y, CGRectZero.size.width, CGRectZero.size.height);
  [(CarplayHeaderFooterTableView *)v3 setTranslatesAutoresizingMaskIntoConstraints:0];
  [(CarplayHeaderFooterTableView *)v3 setDelegate:self];
  [(CarplayHeaderFooterTableView *)v3 setDataSource:self];
  +[CarplayTableViewSection registerClassesOnTableView:v3];

  return v3;
}

- (void)viewWillAppear:(BOOL)a3
{
  BOOL v3 = a3;
  uint64_t v5 = [(CarplayListViewController *)self navigationController];
  [v5 setNavigationBarHidden:1];

  uint64_t v6 = +[NSNotificationCenter defaultCenter];
  [v6 addObserver:self selector:"_databaseDidChange:" name:EKEventStoreChangedNotification object:0];
  [v6 addObserver:self selector:"_significantTimeChange:" name:UIApplicationSignificantTimeChangeNotification object:0];
  [v6 addObserver:self selector:"_significantTimeChange:" name:CUIKTodayChangedNotification object:0];
  [v6 addObserver:self selector:"_eventFetchCompleted" name:@"com.apple.mobilecal.carplay.kEventFetchCompletedNotification" object:0];
  [v6 addObserver:self selector:"_localeChanged" name:CUIKLocaleChangedNotification object:0];
  [v6 addObserver:self selector:"_focusModeConfigurationChanged" name:CUIKCalendarModelFocusModeConfigurationChangedNotification object:self->_model];
  [(CarplayListViewController *)self _refreshTodayView];
  self->_needsForceRefresh = 1;
  [(CarplayListViewController *)self _setViewStatesForCachedEventCollection];
  v7.receiver = self;
  v7.super_class = (Class)CarplayListViewController;
  [(CarplayListViewController *)&v7 viewWillAppear:v3];
}

- (void)viewWillDisappear:(BOOL)a3
{
  BOOL v3 = a3;
  uint64_t v5 = +[NSNotificationCenter defaultCenter];
  [v5 removeObserver:self name:EKEventStoreChangedNotification object:0];
  [v5 removeObserver:self name:UIApplicationSignificantTimeChangeNotification object:0];
  [v5 removeObserver:self name:CUIKTodayChangedNotification object:0];
  [v5 removeObserver:self name:@"com.apple.mobilecal.carplay.kEventFetchCompletedNotification" object:0];
  [v5 removeObserver:self name:CUIKLocaleChangedNotification object:0];
  [v5 removeObserver:self name:CUIKCalendarModelFocusModeConfigurationChangedNotification object:self->_model];
  uint64_t v6 = [(CarplayListViewController *)self navigationController];
  [v6 setNavigationBarHidden:0];

  v7.receiver = self;
  v7.super_class = (Class)CarplayListViewController;
  [(CarplayListViewController *)&v7 viewWillDisappear:v3];
}

- (void)_databaseDidChange:(id)a3
{
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472;
  v5[2] = sub_100044C0C;
  v5[3] = &unk_1001D28A8;
  id v6 = a3;
  objc_super v7 = self;
  id v4 = v6;
  dispatch_async((dispatch_queue_t)&_dispatch_main_q, v5);
}

- (void)_significantTimeChange:(id)a3
{
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100044D24;
  block[3] = &unk_1001D2740;
  block[4] = self;
  dispatch_async((dispatch_queue_t)&_dispatch_main_q, block);
}

- (void)_localeChanged
{
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100044E5C;
  block[3] = &unk_1001D2740;
  block[4] = self;
  dispatch_async((dispatch_queue_t)&_dispatch_main_q, block);
}

- (void)_focusModeConfigurationChanged
{
  [(UITableView *)self->_listView reloadData];
  [(CarplayNoEventsView *)self->_noEventsView setAnyCalendarsHiddenByFocus:[(CUIKCalendarModel *)self->_model focusFilterMode] == (id)1];

  [(CarplayListViewController *)self _refreshTodayView];
}

- (void)_refreshTodayView
{
  id v4 = [(CarplayListViewController *)self sharedManager];
  BOOL v3 = [(CarplayListViewController *)self _currentDateComponents];
  [v4 reloadEvents:v3];
}

- (void)_eventFetchCompleted
{
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100044FAC;
  block[3] = &unk_1001D2740;
  block[4] = self;
  dispatch_async((dispatch_queue_t)&_dispatch_main_q, block);
}

- (void)_setViewStatesForCachedEventCollection
{
  [(CarplayListViewController *)self _loadAndShowAppropriateContentView];

  [(CarplayListViewController *)self _updateContent];
}

- (BOOL)_shouldShowTomorrowSection
{
  if (![(CarplayListViewController *)self _anyOccurrencesAvailable:1]) {
    return 0;
  }
  if (![(CarplayListViewController *)self _anyOccurrencesAvailable:0]) {
    return 1;
  }
  BOOL v3 = [(CarplayListViewController *)self _currentDateComponents];
  BOOL v4 = (uint64_t)[v3 hour] > 16;

  return v4;
}

- (BOOL)_shouldShowNoEventsView
{
  if ([(CarplayListViewController *)self _anyOccurrencesAvailable:0]) {
    return 0;
  }
  else {
    return ![(CarplayListViewController *)self _anyOccurrencesAvailable:1];
  }
}

- (void)_loadAndShowAppropriateContentView
{
  BOOL v3 = [(CarplayListViewController *)self _shouldShowNoEventsView];

  [(CarplayListViewController *)self _setShowingNoEventsMode:v3];
}

- (void)_updateContent
{
  v2 = self;
  if ([(CarplayListViewController *)self _shouldShowNoEventsView]) {
    return;
  }
  [(CarplayListViewController *)v2 setShowingTomorrowSection:[(CarplayListViewController *)v2 _shouldShowTomorrowSection]];
  [(CarplayTableViewSection *)v2->_todaySection setPaddingCellEnabled:[(CarplayListViewController *)v2 showingTomorrowSection]];
  BOOL v3 = [(CarplayListViewController *)v2 _allFetchedOccurrences:0];
  int v4 = 1;
  v75 = [(CarplayListViewController *)v2 _allFetchedOccurrences:1];
  uint64_t v5 = [(CarplayTableViewSection *)v2->_todaySection events];
  uint64_t v6 = [(CarplayTableViewSection *)v2->_tomorrowSection events];
  objc_super v7 = &OBJC_IVAR___WeekAllDayView__useMultiDayHeaderStyle;
  unsigned __int8 v8 = &OBJC_IVAR___WeekAllDayView__useMultiDayHeaderStyle;
  v72 = (void *)v6;
  v73 = (void *)v5;
  if (!v2->_needsForceRefresh)
  {
    uint64_t v9 = v6;
    if ([v3 isEqualToArray:v5] && objc_msgSend(v75, "isEqualToArray:", v9))
    {
      if ([(NSMutableSet *)v2->_changedObjectIDs count])
      {
        long long v91 = 0u;
        long long v92 = 0u;
        long long v89 = 0u;
        long long v90 = 0u;
        id obj = v3;
        id v69 = [obj countByEnumeratingWithState:&v89 objects:v96 count:16];
        if (v69)
        {
          uint64_t v67 = *(void *)v90;
          v65 = v3;
LABEL_8:
          v10 = 0;
          while (1)
          {
            if (*(void *)v90 != v67) {
              objc_enumerationMutation(obj);
            }
            uint64_t v11 = *(void **)(*((void *)&v89 + 1) + 8 * (void)v10);
            changedObjectIDs = v2->_changedObjectIDs;
            double v13 = [v11 objectID:v65];
            if ([(NSMutableSet *)changedObjectIDs containsObject:v13]) {
              break;
            }
            calendarColorMapping = v2->_calendarColorMapping;
            uint64_t v15 = [v11 calendar];
            id v16 = [v15 objectID];
            id v17 = [(NSMutableDictionary *)calendarColorMapping objectForKeyedSubscript:v16];
            v18 = [v11 calendar];
            __int16 v19 = [v18 colorString];
            unsigned int v20 = [v17 isEqualToString:v19];

            if (!v20)
            {
LABEL_50:
              int v4 = 1;
              BOOL v3 = v65;
              unsigned __int8 v8 = &OBJC_IVAR___WeekAllDayView__useMultiDayHeaderStyle;
LABEL_51:
              objc_super v7 = &OBJC_IVAR___WeekAllDayView__useMultiDayHeaderStyle;
              goto LABEL_53;
            }
            v10 = (char *)v10 + 1;
            unsigned __int8 v8 = &OBJC_IVAR___WeekAllDayView__useMultiDayHeaderStyle;
            if (v69 == v10)
            {
              BOOL v3 = v65;
              objc_super v7 = &OBJC_IVAR___WeekAllDayView__useMultiDayHeaderStyle;
              id v69 = [obj countByEnumeratingWithState:&v89 objects:v96 count:16];
              if (v69) {
                goto LABEL_8;
              }
              goto LABEL_15;
            }
          }
        }
        else
        {
LABEL_15:

          long long v87 = 0u;
          long long v88 = 0u;
          long long v85 = 0u;
          long long v86 = 0u;
          id obj = v75;
          id v70 = [obj countByEnumeratingWithState:&v85 objects:v95 count:16];
          if (!v70)
          {
            int v4 = 0;
            goto LABEL_53;
          }
          v65 = v3;
          uint64_t v68 = *(void *)v86;
LABEL_17:
          v21 = 0;
          while (1)
          {
            if (*(void *)v86 != v68) {
              objc_enumerationMutation(obj);
            }
            v22 = *(void **)(*((void *)&v85 + 1) + 8 * (void)v21);
            v23 = v2->_changedObjectIDs;
            double v13 = [v22 objectID:v65];
            if ([(NSMutableSet *)v23 containsObject:v13]) {
              break;
            }
            v24 = *(Class *)((char *)&v2->super.super.super.isa + v8[45]);
            v25 = [v22 calendar];
            v26 = [v25 objectID];
            v27 = [v24 objectForKeyedSubscript:v26];
            v28 = [v22 calendar];
            v29 = [v28 colorString];
            unsigned int v30 = [v27 isEqualToString:v29];

            if (!v30) {
              goto LABEL_50;
            }
            v21 = (char *)v21 + 1;
            unsigned __int8 v8 = &OBJC_IVAR___WeekAllDayView__useMultiDayHeaderStyle;
            if (v70 == v21)
            {
              id v70 = [obj countByEnumeratingWithState:&v85 objects:v95 count:16];
              if (v70) {
                goto LABEL_17;
              }
              int v4 = 0;
              BOOL v3 = v65;
              goto LABEL_51;
            }
          }
        }
        BOOL v3 = v65;
        objc_super v7 = &OBJC_IVAR___WeekAllDayView__useMultiDayHeaderStyle;

        int v4 = 1;
LABEL_53:

        goto LABEL_26;
      }
      int v4 = 0;
    }
    else
    {
      int v4 = 1;
    }
  }
LABEL_26:
  int v71 = v4;
  [*(id *)((char *)&v2->super.super.super.isa + v7[43]) removeAllObjects];
  v2->_needsForceRefresh = 0;
  uint64_t v31 = v8[45];
  [*(id *)((char *)&v2->super.super.super.isa + v31) removeAllObjects];
  long long v83 = 0u;
  long long v84 = 0u;
  long long v81 = 0u;
  long long v82 = 0u;
  id v74 = v3;
  id v32 = [v74 countByEnumeratingWithState:&v81 objects:v94 count:16];
  if (v32)
  {
    id v33 = v32;
    uint64_t v34 = *(void *)v82;
    do
    {
      for (i = 0; i != v33; i = (char *)i + 1)
      {
        if (*(void *)v82 != v34) {
          objc_enumerationMutation(v74);
        }
        uint64_t v36 = *(void **)(*((void *)&v81 + 1) + 8 * i);
        v37 = *(Class *)((char *)&v2->super.super.super.isa + v31);
        v38 = [v36 calendar];
        v39 = [v38 objectID];
        objc_super v40 = [v37 objectForKeyedSubscript:v39];

        if (!v40)
        {
          v41 = [v36 calendar];
          v42 = [v41 colorString];
          v43 = *(Class *)((char *)&v2->super.super.super.isa + v31);
          v44 = [v36 calendar];
          v45 = [v44 objectID];
          [v43 setObject:v42 forKeyedSubscript:v45];
        }
      }
      id v33 = [v74 countByEnumeratingWithState:&v81 objects:v94 count:16];
    }
    while (v33);
  }

  long long v79 = 0u;
  long long v80 = 0u;
  long long v77 = 0u;
  long long v78 = 0u;
  id v46 = v75;
  id v47 = [v46 countByEnumeratingWithState:&v77 objects:v93 count:16];
  if (v47)
  {
    id v48 = v47;
    uint64_t v49 = *(void *)v78;
    do
    {
      for (j = 0; j != v48; j = (char *)j + 1)
      {
        if (*(void *)v78 != v49) {
          objc_enumerationMutation(v46);
        }
        v51 = *(void **)(*((void *)&v77 + 1) + 8 * (void)j);
        v52 = *(Class *)((char *)&v2->super.super.super.isa + v31);
        v53 = [v51 calendar];
        v54 = [v53 objectID];
        v55 = [v52 objectForKeyedSubscript:v54];

        if (!v55)
        {
          v76 = [v51 calendar];
          v56 = [v76 colorString];
          v57 = *(Class *)((char *)&v2->super.super.super.isa + v31);
          v58 = [v51 calendar];
          [v58 objectID];
          uint64_t v59 = v31;
          id v60 = v48;
          uint64_t v61 = v49;
          v62 = v2;
          v64 = id v63 = v46;
          [v57 setObject:v56 forKeyedSubscript:v64];

          id v46 = v63;
          v2 = v62;
          uint64_t v49 = v61;
          id v48 = v60;
          uint64_t v31 = v59;
        }
      }
      id v48 = [v46 countByEnumeratingWithState:&v77 objects:v93 count:16];
    }
    while (v48);
  }

  if (v71)
  {
    [(CarplayTableViewSection *)v2->_todaySection updateWithEvents:v74];
    [(CarplayTableViewSection *)v2->_tomorrowSection updateWithEvents:v46];
    [(UITableView *)v2->_listView reloadData];
  }
}

- (void)_setShowingNoEventsMode:(BOOL)a3
{
  if (a3)
  {
    [(UITableView *)self->_listView removeFromSuperview];
    [(CarplayListViewController *)self _showNoEventsView];
  }
  else
  {
    [(CarplayNoEventsView *)self->_noEventsView removeFromSuperview];
    [(CarplayListViewController *)self _showListView];
  }
}

- (void)_showNoEventsView
{
  [(CarplayNoEventsView *)self->_noEventsView removeFromSuperview];
  BOOL v3 = [(CarplayListViewController *)self view];
  [v3 addSubview:self->_noEventsView];

  v23 = [(CarplayNoEventsView *)self->_noEventsView leadingAnchor];
  v24 = [(CarplayListViewController *)self view];
  v22 = [v24 safeAreaLayoutGuide];
  v21 = [v22 leadingAnchor];
  unsigned int v20 = [v23 constraintEqualToAnchor:v21];
  v25[0] = v20;
  v18 = [(CarplayNoEventsView *)self->_noEventsView trailingAnchor];
  __int16 v19 = [(CarplayListViewController *)self view];
  id v17 = [v19 safeAreaLayoutGuide];
  id v16 = [v17 trailingAnchor];
  uint64_t v15 = [v18 constraintEqualToAnchor:v16];
  v25[1] = v15;
  id v14 = [(CarplayNoEventsView *)self->_noEventsView bottomAnchor];
  int v4 = [(CarplayListViewController *)self view];
  uint64_t v5 = [v4 safeAreaLayoutGuide];
  uint64_t v6 = [v5 bottomAnchor];
  objc_super v7 = [v14 constraintEqualToAnchor:v6];
  v25[2] = v7;
  unsigned __int8 v8 = [(CarplayNoEventsView *)self->_noEventsView topAnchor];
  uint64_t v9 = [(CarplayListViewController *)self view];
  v10 = [v9 safeAreaLayoutGuide];
  uint64_t v11 = [v10 topAnchor];
  double v12 = [v8 constraintEqualToAnchor:v11];
  v25[3] = v12;
  double v13 = +[NSArray arrayWithObjects:v25 count:4];
  +[NSLayoutConstraint activateConstraints:v13];
}

- (void)_showListView
{
  BOOL v3 = self->_listView;
  id v25 = (id)objc_opt_new();
  [(UITableView *)v3 removeFromSuperview];
  int v4 = [(CarplayListViewController *)self view];
  [v4 addSubview:v3];

  uint64_t v5 = [(UITableView *)v3 topAnchor];
  uint64_t v6 = [(CarplayListViewController *)self view];
  objc_super v7 = [v6 safeAreaLayoutGuide];
  unsigned __int8 v8 = [v7 topAnchor];
  uint64_t v9 = [v5 constraintEqualToAnchor:v8];
  [v25 addObject:v9];

  v10 = [(UITableView *)v3 leadingAnchor];
  uint64_t v11 = [(CarplayListViewController *)self view];
  double v12 = [v11 safeAreaLayoutGuide];
  double v13 = [v12 leadingAnchor];
  id v14 = [v10 constraintEqualToAnchor:v13];
  [v25 addObject:v14];

  uint64_t v15 = [(CarplayListViewController *)self view];
  id v16 = [v15 safeAreaLayoutGuide];
  id v17 = [v16 trailingAnchor];
  v18 = [(UITableView *)v3 trailingAnchor];
  __int16 v19 = [v17 constraintEqualToAnchor:v18];
  [v25 addObject:v19];

  unsigned int v20 = [(UITableView *)v3 bottomAnchor];

  v21 = [(CarplayListViewController *)self view];
  v22 = [v21 safeAreaLayoutGuide];
  v23 = [v22 bottomAnchor];
  v24 = [v20 constraintEqualToAnchor:v23];
  [v25 addObject:v24];

  +[NSLayoutConstraint activateConstraints:v25];
}

- (id)_currentDateComponents
{
  v2 = CUIKCalendar();
  BOOL v3 = CUIKNowDate();
  int v4 = [v2 components:254 fromDate:v3];

  uint64_t v5 = CUIKCalendar();
  [v4 setCalendar:v5];

  return v4;
}

- (BOOL)_anyOccurrencesAvailable:(int64_t)a3
{
  BOOL v3 = [(CarplayListViewController *)self _allFetchedOccurrences:a3];
  BOOL v4 = [v3 count] != 0;

  return v4;
}

- (id)_allFetchedOccurrences:(int64_t)a3
{
  BOOL v4 = [(CarplayListViewController *)self sharedManager];
  uint64_t v5 = [v4 collectionForDayType:a3];
  uint64_t v6 = [v5 occurrences];

  return v6;
}

- (id)_timedOccurrences:(int64_t)a3
{
  BOOL v4 = [(CarplayListViewController *)self sharedManager];
  uint64_t v5 = [v4 collectionForDayType:a3];
  uint64_t v6 = [v5 timedOccurrences];

  return v6;
}

- (id)_allDayOccurrences:(int64_t)a3
{
  BOOL v4 = [(CarplayListViewController *)self sharedManager];
  uint64_t v5 = [v4 collectionForDayType:a3];
  uint64_t v6 = [v5 allDayOccurrences];

  return v6;
}

- (int64_t)numberOfSectionsInTableView:(id)a3
{
  if ([(CarplayListViewController *)self showingTomorrowSection]) {
    return 2;
  }
  else {
    return 1;
  }
}

- (double)tableView:(id)a3 heightForHeaderInSection:(int64_t)a4
{
  BOOL v4 = [(NSArray *)self->_sections objectAtIndexedSubscript:a4];
  [v4 heightForHeaderInSection];
  double v6 = v5;

  return v6;
}

- (id)tableView:(id)a3 viewForHeaderInSection:(int64_t)a4
{
  sections = self->_sections;
  id v6 = a3;
  objc_super v7 = [(NSArray *)sections objectAtIndexedSubscript:a4];
  unsigned __int8 v8 = [v7 headerForSectionInTableView:v6];

  return v8;
}

- (int64_t)tableView:(id)a3 numberOfRowsInSection:(int64_t)a4
{
  BOOL v4 = [(NSArray *)self->_sections objectAtIndexedSubscript:a4];
  id v5 = [v4 numberOfRows];

  return (int64_t)v5;
}

- (id)tableView:(id)a3 cellForRowAtIndexPath:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  unsigned __int8 v8 = +[CarplayUtilities dateForSection:](CarplayUtilities, "dateForSection:", [v6 section]);
  uint64_t v9 = -[NSArray objectAtIndexedSubscript:](self->_sections, "objectAtIndexedSubscript:", [v6 section]);
  id v10 = [v6 row];

  uint64_t v11 = [v9 cellForRow:v10 underDate:v8 inTableView:v7];

  return v11;
}

- (void)tableView:(id)a3 didSelectRowAtIndexPath:(id)a4
{
  id v10 = a4;
  id v6 = a3;
  [v6 deselectRowAtIndexPath:v10 animated:1];
  id v7 = -[NSArray objectAtIndexedSubscript:](self->_sections, "objectAtIndexedSubscript:", [v10 section]);
  unsigned __int8 v8 = [v7 tableView:v6 didSelectRowAtIndexPath:v10];

  if (v8)
  {
    -[CarplayListViewController setViewControllerTitleForSelectedEventInSection:](self, "setViewControllerTitleForSelectedEventInSection:", [v10 section]);
    uint64_t v9 = [(CarplayListViewController *)self navigationController];
    [v9 pushViewController:v8 animated:1];
  }
}

- (void)tableView:(id)a3 didHighlightRowAtIndexPath:(id)a4
{
  id v5 = [a3 cellForRowAtIndexPath:a4];
  [(CarplayListViewController *)self _forceUpdateCell:v5];
}

- (void)tableView:(id)a3 didUnhighlightRowAtIndexPath:(id)a4
{
  id v5 = [a3 cellForRowAtIndexPath:a4];
  [(CarplayListViewController *)self _forceUpdateCell:v5];
}

- (void)_forceUpdateCell:(id)a3
{
  id v3 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    [v3 forceUpdateOfAllElements];
  }
}

- (BOOL)showingTomorrowSection
{
  return self->_showingTomorrowSection;
}

- (void)setShowingTomorrowSection:(BOOL)a3
{
  self->_showingTomorrowSection = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_calendarColorMapping, 0);
  objc_storeStrong((id *)&self->_changedObjectIDs, 0);
  objc_storeStrong((id *)&self->_sections, 0);
  objc_storeStrong((id *)&self->_tomorrowSection, 0);
  objc_storeStrong((id *)&self->_todaySection, 0);
  objc_storeStrong((id *)&self->_listView, 0);
  objc_storeStrong((id *)&self->_noEventsView, 0);
  objc_storeStrong((id *)&self->_visibilityManager, 0);

  objc_storeStrong((id *)&self->_model, 0);
}

@end