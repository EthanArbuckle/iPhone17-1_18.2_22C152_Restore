@interface CalendarItemSource
+ (id)sharedDateFormatter;
+ (id)subtitleFromEventName:(id)a3 eventDate:(id)a4;
+ (void)initialize;
- (BOOL)shouldIncludeEvent:(id)a3;
- (CalendarItemSource)init;
- (id)_nextUpdateDate;
- (id)allItems;
- (id)predicateForDateRangeSince:(id)a3;
- (id)predicateForIncompleteReminders;
- (id)predicateForRemindersDueAfter:(id)a3;
- (void)_clearUpdateTimer;
- (void)_scheduleUpdateTimer;
- (void)_updateCalendarItems;
- (void)applicationWillEnterForeground:(id)a3;
- (void)dateHasChanged:(id)a3;
- (void)excludeItemsFromSource:(id)a3;
- (void)loadCalendarItems;
- (void)userDefaultsDidChange:(id)a3;
@end

@implementation CalendarItemSource

+ (void)initialize
{
  v2.receiver = a1;
  v2.super_class = (Class)&OBJC_METACLASS___CalendarItemSource;
  [super initialize];
  if (qword_101610750 != -1) {
    dispatch_once(&qword_101610750, &stru_101316980);
  }
}

- (void)excludeItemsFromSource:(id)a3
{
  objc_storeStrong((id *)&self->_exclusionSource, a3);
  id v5 = a3;
  [v5 addObserver:self];
}

- (id)_nextUpdateDate
{
  objc_super v2 = +[NSDate date];
  v3 = +[NSTimeZone localTimeZone];
  v4 = [v2 _maps_nextDayAtHour:0 timeZone:v3];

  return v4;
}

- (void)_scheduleUpdateTimer
{
  id v6 = [(CalendarItemSource *)self _nextUpdateDate];
  v3 = (NSTimer *)[objc_alloc((Class)NSTimer) initWithFireDate:v6 interval:self target:"dateHasChanged:" selector:0 userInfo:0 repeats:0.0];
  updateTimer = self->_updateTimer;
  self->_updateTimer = v3;

  id v5 = +[NSRunLoop mainRunLoop];
  [v5 addTimer:self->_updateTimer forMode:NSDefaultRunLoopMode];
}

- (void)_updateCalendarItems
{
  if (byte_10161075A)
  {
    v31 = +[NSMutableArray array];
    v36 = +[NSDate date];
    uint64_t v3 = -[CalendarItemSource predicateForDateRangeSince:](self, "predicateForDateRangeSince:");
    v4 = +[MapsSuggestionsSharedEventStore sharedEventStore];
    v35 = (void *)v3;
    id v5 = [v4 eventsMatchingPredicate:v3];

    id v6 = dispatch_group_create();
    v7 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    dispatch_queue_t v8 = dispatch_queue_create("_updateCalendarItems", v7);

    v9 = [(PersonalizedItemSource *)self->_exclusionSource allItems];
    v10 = +[NSMutableSet set];
    long long v55 = 0u;
    long long v56 = 0u;
    long long v57 = 0u;
    long long v58 = 0u;
    id obj = v9;
    id v11 = [obj countByEnumeratingWithState:&v55 objects:v62 count:16];
    if (v11)
    {
      id v12 = v11;
      uint64_t v13 = *(void *)v56;
      do
      {
        for (i = 0; i != v12; i = (char *)i + 1)
        {
          if (*(void *)v56 != v13) {
            objc_enumerationMutation(obj);
          }
          v15 = [*(id *)(*((void *)&v55 + 1) + 8 * i) keys];
          if (v15) {
            [v10 unionSet:v15];
          }
        }
        id v12 = [obj countByEnumeratingWithState:&v55 objects:v62 count:16];
      }
      while (v12);
    }

    v50[0] = _NSConcreteStackBlock;
    v50[1] = 3221225472;
    v50[2] = sub_100AC0E98;
    v50[3] = &unk_1013169A8;
    id v33 = v10;
    id v51 = v33;
    v34 = v8;
    v52 = v34;
    v53 = self;
    id v32 = v31;
    id v54 = v32;
    v16 = objc_retainBlock(v50);
    long long v46 = 0u;
    long long v47 = 0u;
    long long v48 = 0u;
    long long v49 = 0u;
    id v17 = v5;
    id v18 = [v17 countByEnumeratingWithState:&v46 objects:v61 count:16];
    if (v18)
    {
      id v19 = v18;
      uint64_t v20 = *(void *)v47;
      do
      {
        for (j = 0; j != v19; j = (char *)j + 1)
        {
          if (*(void *)v47 != v20) {
            objc_enumerationMutation(v17);
          }
          v22 = *(void **)(*((void *)&v46 + 1) + 8 * (void)j);
          if ([(CalendarItemSource *)self shouldIncludeEvent:v22])
          {
            dispatch_group_enter(v6);
            v23 = [v22 structuredLocation];
            v43[0] = _NSConcreteStackBlock;
            v43[1] = 3221225472;
            v43[2] = sub_100AC1040;
            v43[3] = &unk_1013169D0;
            v45 = v16;
            v43[4] = v22;
            v44 = v6;
            sub_100ABFADC(v23, v43);
          }
        }
        id v19 = [v17 countByEnumeratingWithState:&v46 objects:v61 count:16];
      }
      while (v19);
    }

    v24 = [(CalendarItemSource *)self predicateForIncompleteReminders];
    dispatch_group_enter(v6);
    v25 = +[MapsSuggestionsSharedEventStore sharedEventStore];
    v40[0] = _NSConcreteStackBlock;
    v40[1] = 3221225472;
    v40[2] = sub_100AC10C4;
    v40[3] = &unk_101314EF0;
    v41 = v6;
    id v42 = v16;
    v26 = v16;
    v27 = v6;
    id v28 = [v25 fetchRemindersMatchingPredicate:v24 completion:v40];

    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_100AC13AC;
    block[3] = &unk_1012E5D58;
    block[4] = self;
    id v39 = v32;
    id v29 = v32;
    dispatch_group_notify(v27, (dispatch_queue_t)&_dispatch_main_q, block);
  }
  else
  {
    lockQueue = self->_lockQueue;
    v60[0] = _NSConcreteStackBlock;
    v60[1] = 3221225472;
    v60[2] = sub_100105780;
    v60[3] = &unk_1012E5D08;
    v60[4] = self;
    dispatch_sync(lockQueue, v60);
    v59[0] = _NSConcreteStackBlock;
    v59[1] = 3221225472;
    v59[2] = sub_100105778;
    v59[3] = &unk_1012E5D08;
    v59[4] = self;
    dispatch_async((dispatch_queue_t)&_dispatch_main_q, v59);
  }
}

- (CalendarItemSource)init
{
  v17.receiver = self;
  v17.super_class = (Class)CalendarItemSource;
  objc_super v2 = [(CalendarItemSource *)&v17 init];
  if (v2)
  {
    uint64_t v3 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    dispatch_queue_t v4 = dispatch_queue_create("CalendarItemSource.lock", v3);
    lockQueue = v2->_lockQueue;
    v2->_lockQueue = (OS_dispatch_queue *)v4;

    id v6 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    dispatch_queue_t v7 = dispatch_queue_create("calendar item source", v6);
    updateQueue = v2->_updateQueue;
    v2->_updateQueue = (OS_dispatch_queue *)v7;

    v9 = +[NSUserDefaults standardUserDefaults];
    byte_101610759 = [v9 BOOLForKey:@"__personalizedMapsCalendarItemsUseGenericPOI"];

    v10 = +[NSUserDefaults standardUserDefaults];
    byte_10161075A = [v10 BOOLForKey:@"__personalizedMapsCalendarEnabled"];

    id v11 = +[NSUserDefaults standardUserDefaults];
    byte_101610758 = [v11 BOOLForKey:@"__personalizedMapsCalendarDisableCanonicalLookupSearch"];

    id v12 = +[NSNotificationCenter defaultCenter];
    [v12 addObserver:v2 selector:"userDefaultsDidChange:" name:NSUserDefaultsDidChangeNotification object:0];

    uint64_t v13 = +[NSNotificationCenter defaultCenter];
    [v13 addObserver:v2 selector:"eventStoreDidChange:" name:EKEventStoreChangedNotification object:0];

    v14 = +[NSNotificationCenter defaultCenter];
    [v14 addObserver:v2 selector:"applicationWillEnterForeground:" name:UIApplicationWillEnterForegroundNotification object:0];

    v15 = +[NSNotificationCenter defaultCenter];
    [v15 addObserver:v2 selector:"applicationDidEnterBackground:" name:UIApplicationDidEnterBackgroundNotification object:0];

    [(CalendarItemSource *)v2 _scheduleUpdateTimer];
  }
  return v2;
}

- (void)userDefaultsDidChange:(id)a3
{
  dispatch_queue_t v4 = +[NSUserDefaults standardUserDefaults];
  unsigned int v5 = [v4 BOOLForKey:@"__personalizedMapsCalendarItemsUseGenericPOI"];

  id v6 = +[NSUserDefaults standardUserDefaults];
  unsigned int v7 = [v6 BOOLForKey:@"__personalizedMapsCalendarEnabled"];

  dispatch_queue_t v8 = +[NSUserDefaults standardUserDefaults];
  unsigned int v9 = [v8 BOOLForKey:@"__personalizedMapsCalendarDisableCanonicalLookupSearch"];

  if (byte_101610759 != v5
    || byte_10161075A != v7
    || byte_101610758 != v9)
  {
    byte_101610759 = v5;
    byte_10161075A = v7;
    byte_101610758 = v9;
    [(CalendarItemSource *)self loadCalendarItems];
  }
}

- (void)loadCalendarItems
{
  updateQueue = self->_updateQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_1001057A8;
  block[3] = &unk_1012E5D08;
  block[4] = self;
  dispatch_async(updateQueue, block);
}

- (id)allItems
{
  uint64_t v6 = 0;
  unsigned int v7 = &v6;
  uint64_t v8 = 0x3032000000;
  unsigned int v9 = sub_1001042E0;
  v10 = sub_1001049E0;
  id v11 = 0;
  lockQueue = self->_lockQueue;
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472;
  v5[2] = sub_10001D2CC;
  v5[3] = &unk_1012E73F0;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(lockQueue, v5);
  id v3 = (id)v7[5];
  _Block_object_dispose(&v6, 8);

  return v3;
}

+ (id)sharedDateFormatter
{
  if (qword_101610768 != -1) {
    dispatch_once(&qword_101610768, &stru_101316960);
  }
  objc_super v2 = (void *)qword_101610760;

  return v2;
}

- (void)applicationWillEnterForeground:(id)a3
{
  [(CalendarItemSource *)self _clearUpdateTimer];

  [(CalendarItemSource *)self _scheduleUpdateTimer];
}

- (void)dateHasChanged:(id)a3
{
  [(CalendarItemSource *)self _clearUpdateTimer];
  [(CalendarItemSource *)self _scheduleUpdateTimer];

  [(CalendarItemSource *)self loadCalendarItems];
}

- (void)_clearUpdateTimer
{
  [(NSTimer *)self->_updateTimer invalidate];
  updateTimer = self->_updateTimer;
  self->_updateTimer = 0;
}

- (id)predicateForDateRangeSince:(id)a3
{
  id v3 = a3;
  dispatch_queue_t v4 = +[NSCalendar currentCalendar];
  id v5 = objc_alloc_init((Class)NSDateComponents);
  [v5 setDay:7];
  uint64_t v6 = [v4 dateByAddingComponents:v5 toDate:v3 options:0];
  unsigned int v7 = +[MapsSuggestionsSharedEventStore sharedEventStore];
  uint64_t v8 = [v7 predicateForEventsWithStartDate:v3 endDate:v6 calendars:0];

  return v8;
}

- (id)predicateForRemindersDueAfter:(id)a3
{
  id v3 = a3;
  dispatch_queue_t v4 = +[NSCalendar currentCalendar];
  id v5 = objc_alloc_init((Class)NSDateComponents);
  [v5 setDay:7];
  uint64_t v6 = [v4 dateByAddingComponents:v5 toDate:v3 options:0];
  unsigned int v7 = +[MapsSuggestionsSharedEventStore sharedEventStore];
  uint64_t v8 = [v7 predicateForIncompleteRemindersWithDueDateStarting:v3 ending:v6 calendars:0];

  return v8;
}

- (id)predicateForIncompleteReminders
{
  objc_super v2 = +[MapsSuggestionsSharedEventStore sharedEventStore];
  id v3 = [v2 predicateForIncompleteRemindersWithDueDateStarting:0 ending:0 calendars:0];

  return v3;
}

- (BOOL)shouldIncludeEvent:(id)a3
{
  id v3 = a3;
  dispatch_queue_t v4 = [v3 structuredLocation];

  if (v4
    && ([v3 structuredLocation],
        id v5 = objc_claimAutoreleasedReturnValue(),
        unsigned __int8 v6 = [v5 isPrediction],
        v5,
        (v6 & 1) == 0))
  {
    uint64_t v8 = [v3 selfAttendee];
    unsigned int v9 = v8;
    BOOL v7 = !v8 || ((unint64_t)[v8 participantStatus] & 0xFFFFFFFFFFFFFFFDLL) != 1;
  }
  else
  {
    BOOL v7 = 0;
  }

  return v7;
}

+ (id)subtitleFromEventName:(id)a3 eventDate:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  BOOL v7 = +[CalendarItemSource sharedDateFormatter];
  uint64_t v8 = v7;
  if (v6)
  {
    unsigned int v9 = [v7 stringFromDate:v6];
  }
  else
  {
    unsigned int v9 = 0;
  }
  id v10 = v5;
  if ([v10 length])
  {
    id v11 = +[NSString stringWithFormat:@"\b%@\b", v10];
  }
  else
  {
    id v11 = v10;
  }
  id v12 = v11;

  id v13 = v9;
  if ([v13 length])
  {
    id v14 = +[NSString stringWithFormat:@"\b%@\b", v13];
  }
  else
  {
    id v14 = v13;
  }
  v15 = v14;

  id v16 = v12;
  id v17 = v15;
  if ([v16 length])
  {
    if ([v17 length])
    {
      id v18 = +[NSString stringWithFormat:@"%@\n%@", v16, v17];
    }
    else
    {
      id v18 = v16;
    }
  }
  else
  {
    id v18 = v17;
  }
  id v19 = v18;

  return v19;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_lockQueue, 0);
  objc_storeStrong((id *)&self->_exclusionSource, 0);
  objc_storeStrong((id *)&self->_updateTimer, 0);
  objc_storeStrong((id *)&self->_updateQueue, 0);

  objc_storeStrong((id *)&self->_allItems, 0);
}

@end