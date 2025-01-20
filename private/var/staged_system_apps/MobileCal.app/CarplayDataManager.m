@interface CarplayDataManager
- (BOOL)hasEverCompletedFetch;
- (CUIKOccurrencesCollection)loadedEventCollection;
- (CUIKOccurrencesCollection)tomorrowLoadedEventCollection;
- (CarplayDataManager)initWithEventStore:(id)a3;
- (id)_calendarOccurrencesCollectionFromPredicate:(id)a3;
- (id)_selectedCalendars;
- (id)collectionForDayType:(int64_t)a3;
- (void)_fetchUpcomingOccurrences:(id)a3;
- (void)_timeZoneChanged:(id)a3;
- (void)reloadEvents:(id)a3;
- (void)setHasEverCompletedFetch:(BOOL)a3;
@end

@implementation CarplayDataManager

- (CarplayDataManager)initWithEventStore:(id)a3
{
  id v5 = a3;
  v11.receiver = self;
  v11.super_class = (Class)CarplayDataManager;
  v6 = [(CarplayDataManager *)&v11 init];
  if (v6)
  {
    dispatch_queue_t v7 = dispatch_queue_create("com.apple.mobilecal.carplay.loading", 0);
    eventLoadingQueue = v6->_eventLoadingQueue;
    v6->_eventLoadingQueue = (OS_dispatch_queue *)v7;

    objc_storeStrong((id *)&v6->_eventStore, a3);
    v9 = +[NSNotificationCenter defaultCenter];
    [v9 addObserver:v6 selector:"_timeZoneChanged:" name:kCalTimeZoneChangedNotification object:0];
  }
  return v6;
}

- (id)collectionForDayType:(int64_t)a3
{
  if (a3) {
    [(CarplayDataManager *)self tomorrowLoadedEventCollection];
  }
  else {
  v3 = [(CarplayDataManager *)self loadedEventCollection];
  }

  return v3;
}

- (id)_selectedCalendars
{
  id v3 = [objc_alloc((Class)EKCalendarVisibilityManager) initWithEventStore:self->_eventStore visibilityChangedCallback:0 queue:0];
  v4 = [v3 visibleCalendars];
  id v5 = +[EKCalendarVisibilityManager unselectedCalendarsForFocusModeInEventStore:self->_eventStore];
  if (v5)
  {
    v6 = +[NSMutableSet setWithArray:v4];
    [v6 minusSet:v5];
    uint64_t v7 = [v6 allObjects];

    v4 = (void *)v7;
  }
  v8 = (void *)kCalUILogCarplayHandle;
  if (os_log_type_enabled((os_log_t)kCalUILogCarplayHandle, OS_LOG_TYPE_INFO))
  {
    v9 = v8;
    v10 = +[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:", [v4 count]);
    int v12 = 136315394;
    v13 = "-[CarplayDataManager _selectedCalendars]";
    __int16 v14 = 2112;
    v15 = v10;
    _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_INFO, "%s found [%@] selected calendars", (uint8_t *)&v12, 0x16u);
  }

  return v4;
}

- (CUIKOccurrencesCollection)loadedEventCollection
{
  uint64_t v6 = 0;
  uint64_t v7 = &v6;
  uint64_t v8 = 0x3032000000;
  v9 = sub_10005A2E4;
  v10 = sub_10005A2F4;
  id v11 = 0;
  eventLoadingQueue = self->_eventLoadingQueue;
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472;
  v5[2] = sub_10005A2FC;
  v5[3] = &unk_1001D3068;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(eventLoadingQueue, v5);
  id v3 = (id)v7[5];
  _Block_object_dispose(&v6, 8);

  return (CUIKOccurrencesCollection *)v3;
}

- (CUIKOccurrencesCollection)tomorrowLoadedEventCollection
{
  uint64_t v6 = 0;
  uint64_t v7 = &v6;
  uint64_t v8 = 0x3032000000;
  v9 = sub_10005A2E4;
  v10 = sub_10005A2F4;
  id v11 = 0;
  eventLoadingQueue = self->_eventLoadingQueue;
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472;
  v5[2] = sub_10005A400;
  v5[3] = &unk_1001D3068;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(eventLoadingQueue, v5);
  id v3 = (id)v7[5];
  _Block_object_dispose(&v6, 8);

  return (CUIKOccurrencesCollection *)v3;
}

- (void)reloadEvents:(id)a3
{
  id v4 = a3;
  eventLoadingQueue = self->_eventLoadingQueue;
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_10005A4AC;
  v7[3] = &unk_1001D28A8;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(eventLoadingQueue, v7);
}

- (void)_fetchUpcomingOccurrences:(id)a3
{
  id v4 = a3;
  id v5 = CUIKCalendar();
  id v6 = [v4 copy];
  [v6 setHour:23];
  [v6 setMinute:59];
  [v6 setSecond:59];
  uint64_t v7 = [v5 dateFromComponents:v4];
  uint64_t v8 = [v5 dateFromComponents:v6];
  v9 = [v4 date];

  v46 = v9;
  v10 = [v9 dateByAddingDays:1 inCalendar:v5];
  id v11 = [v5 components:254 fromDate:v10];
  [v11 setHour:23];
  [v11 setMinute:59];
  [v11 setSecond:59];
  uint64_t v12 = [v5 startOfDayForDate:v10];
  v13 = [v5 dateFromComponents:v11];
  __int16 v14 = [(CarplayDataManager *)self _selectedCalendars];
  v47 = (void *)v8;
  v48 = (void *)v7;
  v45 = (void *)v12;
  if ([v14 count])
  {
    v15 = [(EKEventStore *)self->_eventStore predicateForEventsWithStartDate:v7 endDate:v8 calendars:v14];
    v16 = [(EKEventStore *)self->_eventStore predicateForEventsWithStartDate:v12 endDate:v13 calendars:v14];
    v17 = [(CarplayDataManager *)self _calendarOccurrencesCollectionFromPredicate:v15];
    loadedEventCollection = self->_loadedEventCollection;
    self->_loadedEventCollection = v17;

    v19 = [(CarplayDataManager *)self _calendarOccurrencesCollectionFromPredicate:v16];
    tomorrowLoadedEventCollection = self->_tomorrowLoadedEventCollection;
    self->_tomorrowLoadedEventCollection = v19;
  }
  else
  {
    v21 = (CUIKOccurrencesCollection *)[objc_alloc((Class)CUIKOccurrencesCollection) initWithOccurrences:0 timedOccurrences:&__NSArray0__struct allDayOccurrences:&__NSArray0__struct];
    v22 = self->_loadedEventCollection;
    self->_loadedEventCollection = v21;

    v23 = (CUIKOccurrencesCollection *)[objc_alloc((Class)CUIKOccurrencesCollection) initWithOccurrences:0 timedOccurrences:&__NSArray0__struct allDayOccurrences:&__NSArray0__struct];
    v15 = self->_tomorrowLoadedEventCollection;
    self->_tomorrowLoadedEventCollection = v23;
  }

  v24 = (void *)kCalUILogCarplayHandle;
  if (os_log_type_enabled((os_log_t)kCalUILogCarplayHandle, OS_LOG_TYPE_INFO))
  {
    v25 = self->_loadedEventCollection;
    v26 = v24;
    v27 = [(CUIKOccurrencesCollection *)v25 timedOccurrences];
    v28 = +[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:", [v27 count]);
    *(_DWORD *)buf = 136315394;
    v50 = "-[CarplayDataManager _fetchUpcomingOccurrences:]";
    __int16 v51 = 2112;
    v52 = v28;
    _os_log_impl((void *)&_mh_execute_header, v26, OS_LOG_TYPE_INFO, "%s fetched [%@] timed occurrences for today", buf, 0x16u);
  }
  v29 = (void *)kCalUILogCarplayHandle;
  if (os_log_type_enabled((os_log_t)kCalUILogCarplayHandle, OS_LOG_TYPE_INFO))
  {
    v30 = self->_loadedEventCollection;
    v31 = v29;
    v32 = [(CUIKOccurrencesCollection *)v30 allDayOccurrences];
    v33 = +[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:", [v32 count]);
    *(_DWORD *)buf = 136315394;
    v50 = "-[CarplayDataManager _fetchUpcomingOccurrences:]";
    __int16 v51 = 2112;
    v52 = v33;
    _os_log_impl((void *)&_mh_execute_header, v31, OS_LOG_TYPE_INFO, "%s fetched [%@] all-day occurrences for today", buf, 0x16u);
  }
  v34 = (void *)kCalUILogCarplayHandle;
  if (os_log_type_enabled((os_log_t)kCalUILogCarplayHandle, OS_LOG_TYPE_INFO))
  {
    v35 = self->_tomorrowLoadedEventCollection;
    v36 = v34;
    v37 = [(CUIKOccurrencesCollection *)v35 timedOccurrences];
    v38 = +[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:", [v37 count]);
    *(_DWORD *)buf = 136315394;
    v50 = "-[CarplayDataManager _fetchUpcomingOccurrences:]";
    __int16 v51 = 2112;
    v52 = v38;
    _os_log_impl((void *)&_mh_execute_header, v36, OS_LOG_TYPE_INFO, "%s fetched [%@] timed occurrences for tomorrow", buf, 0x16u);
  }
  v39 = (void *)kCalUILogCarplayHandle;
  if (os_log_type_enabled((os_log_t)kCalUILogCarplayHandle, OS_LOG_TYPE_INFO))
  {
    v40 = self->_tomorrowLoadedEventCollection;
    v41 = v39;
    v42 = [(CUIKOccurrencesCollection *)v40 allDayOccurrences];
    v43 = +[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:", [v42 count]);
    *(_DWORD *)buf = 136315394;
    v50 = "-[CarplayDataManager _fetchUpcomingOccurrences:]";
    __int16 v51 = 2112;
    v52 = v43;
    _os_log_impl((void *)&_mh_execute_header, v41, OS_LOG_TYPE_INFO, "%s fetched [%@] all-day occurrences for tomorrow", buf, 0x16u);
  }
  [(CarplayDataManager *)self setHasEverCompletedFetch:1];
  v44 = +[NSNotificationCenter defaultCenter];
  [v44 postNotificationName:@"com.apple.mobilecal.carplay.kEventFetchCompletedNotification" object:0];
}

- (id)_calendarOccurrencesCollectionFromPredicate:(id)a3
{
  id v4 = a3;
  id v5 = objc_alloc_init((Class)NSMutableArray);
  id v6 = objc_alloc_init((Class)NSMutableArray);
  uint64_t v7 = [(EKEventStore *)self->_eventStore eventsMatchingPredicate:v4];
  id v8 = [v7 mutableCopy];
  if (([(EKEventStore *)self->_eventStore showDeclinedEvents] & 1) == 0)
  {
    v9 = +[NSPredicate predicateWithBlock:&stru_1001D30A8];
    [v8 filterUsingPredicate:v9];
  }
  [v8 sortUsingFunction:&_CUIKCompareEKEvents context:0];
  long long v21 = 0u;
  long long v22 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  id v10 = v8;
  id v11 = [v10 countByEnumeratingWithState:&v19 objects:v23 count:16];
  if (v11)
  {
    id v12 = v11;
    uint64_t v13 = *(void *)v20;
    do
    {
      for (i = 0; i != v12; i = (char *)i + 1)
      {
        if (*(void *)v20 != v13) {
          objc_enumerationMutation(v10);
        }
        v15 = *(void **)(*((void *)&v19 + 1) + 8 * i);
        if (objc_msgSend(v15, "isAllDay", (void)v19)) {
          v16 = v6;
        }
        else {
          v16 = v5;
        }
        [v16 addObject:v15];
      }
      id v12 = [v10 countByEnumeratingWithState:&v19 objects:v23 count:16];
    }
    while (v12);
  }

  id v17 = [objc_alloc((Class)CUIKOccurrencesCollection) initWithOccurrences:v10 timedOccurrences:v5 allDayOccurrences:v6];

  return v17;
}

- (void)_timeZoneChanged:(id)a3
{
  id v4 = a3;
  id v5 = kCalUILogCarplayHandle;
  if (os_log_type_enabled((os_log_t)kCalUILogCarplayHandle, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 138412546;
    v9 = self;
    __int16 v10 = 2112;
    id v11 = v4;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_INFO, "[%@] received notification: [%@]", buf, 0x16u);
  }
  eventLoadingQueue = self->_eventLoadingQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10005AE3C;
  block[3] = &unk_1001D2740;
  block[4] = self;
  dispatch_async(eventLoadingQueue, block);
}

- (BOOL)hasEverCompletedFetch
{
  return self->_hasEverCompletedFetch;
}

- (void)setHasEverCompletedFetch:(BOOL)a3
{
  self->_hasEverCompletedFetch = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_eventStore, 0);
  objc_storeStrong((id *)&self->_tomorrowLoadedEventCollection, 0);
  objc_storeStrong((id *)&self->_loadedEventCollection, 0);

  objc_storeStrong((id *)&self->_eventLoadingQueue, 0);
}

@end