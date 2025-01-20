@interface MFMailDebugIndexStatusViewController
+ (id)title;
- (EFCancelable)turboModeObservationToken;
- (NSArray)localIndexDiagnosticsSnapshotsCache;
- (NSArray)reindexReasonsCache;
- (NSArray)remoteIndexDiagnosticsSnapshotsCache;
- (NSDate)lastKnownIndexCountDate;
- (NSISO8601DateFormatter)reindexDateFormatter;
- (NSMutableDictionary)items;
- (NSNumber)currentIndexingSpeed;
- (NSNumberFormatter)numberFormatter;
- (NSTimer)refreshTimer;
- (UITableView)tableView;
- (id)_calculateIndexingSpeedWithMessagesIndexed:(int64_t)a3;
- (id)_dataForIndexPath:(id)a3;
- (id)_loadCacheForKey:(id)a3;
- (id)_messagesIndexedInTimeInterval:(double)a3 snapshots:(id)a4 currentMessagesIndexed:(int64_t)a5;
- (id)_reindexReasonsCache;
- (id)tableView:(id)a3 cellForRowAtIndexPath:(id)a4;
- (id)tableView:(id)a3 titleForFooterInSection:(int64_t)a4;
- (id)tableView:(id)a3 titleForHeaderInSection:(int64_t)a4;
- (int64_t)lastKnownIndexCount;
- (int64_t)numberOfSectionsInTableView:(id)a3;
- (int64_t)tableView:(id)a3 numberOfRowsInSection:(int64_t)a4;
- (void)_periodicallyRefreshStatus;
- (void)_refreshStatus;
- (void)_startObservingTurboModeToggle;
- (void)_stopObservingTurboModeToggle;
- (void)_stopRefreshingStatus;
- (void)setCurrentIndexingSpeed:(id)a3;
- (void)setItems:(id)a3;
- (void)setLastKnownIndexCount:(int64_t)a3;
- (void)setLastKnownIndexCountDate:(id)a3;
- (void)setLocalIndexDiagnosticsSnapshotsCache:(id)a3;
- (void)setNumberFormatter:(id)a3;
- (void)setRefreshTimer:(id)a3;
- (void)setReindexDateFormatter:(id)a3;
- (void)setReindexReasonsCache:(id)a3;
- (void)setRemoteIndexDiagnosticsSnapshotsCache:(id)a3;
- (void)setTableView:(id)a3;
- (void)setTurboModeObservationToken:(id)a3;
- (void)tableView:(id)a3 didSelectRowAtIndexPath:(id)a4;
- (void)viewDidLoad;
- (void)viewWillAppear:(BOOL)a3;
- (void)viewWillDisappear:(BOOL)a3;
@end

@implementation MFMailDebugIndexStatusViewController

+ (id)title
{
  return @"Index Status";
}

- (NSISO8601DateFormatter)reindexDateFormatter
{
  reindexDateFormatter = self->_reindexDateFormatter;
  if (!reindexDateFormatter)
  {
    v4 = (NSISO8601DateFormatter *)objc_alloc_init((Class)NSISO8601DateFormatter);
    v5 = self->_reindexDateFormatter;
    self->_reindexDateFormatter = v4;

    v6 = +[NSTimeZone localTimeZone];
    [(NSISO8601DateFormatter *)self->_reindexDateFormatter setTimeZone:v6];

    [(NSISO8601DateFormatter *)self->_reindexDateFormatter setFormatOptions:947];
    reindexDateFormatter = self->_reindexDateFormatter;
  }

  return reindexDateFormatter;
}

- (void)viewDidLoad
{
  v17.receiver = self;
  v17.super_class = (Class)MFMailDebugIndexStatusViewController;
  [(MFMailDebugIndexStatusViewController *)&v17 viewDidLoad];
  id v3 = objc_alloc((Class)UITableView);
  v4 = [(MFMailDebugIndexStatusViewController *)self view];
  [v4 bounds];
  id v5 = [v3 initWithFrame:1];
  [(MFMailDebugIndexStatusViewController *)self setTableView:v5];

  v6 = [(MFMailDebugIndexStatusViewController *)self tableView];
  [v6 setAutoresizingMask:18];

  v7 = [(MFMailDebugIndexStatusViewController *)self tableView];
  [v7 setDataSource:self];

  v8 = [(MFMailDebugIndexStatusViewController *)self tableView];
  [v8 setDelegate:self];

  v9 = [(MFMailDebugIndexStatusViewController *)self tableView];
  [v9 setSeparatorStyle:1];

  v10 = [(MFMailDebugIndexStatusViewController *)self tableView];
  [v10 setAllowsSelection:1];

  id v11 = objc_alloc_init((Class)NSNumberFormatter);
  [(MFMailDebugIndexStatusViewController *)self setNumberFormatter:v11];

  v12 = [(MFMailDebugIndexStatusViewController *)self numberFormatter];
  [v12 setGroupingSize:3];

  v13 = [(MFMailDebugIndexStatusViewController *)self numberFormatter];
  [v13 setUsesGroupingSeparator:1];

  v14 = [(MFMailDebugIndexStatusViewController *)self numberFormatter];
  [v14 setGroupingSeparator:@","];

  v15 = [(MFMailDebugIndexStatusViewController *)self view];
  v16 = [(MFMailDebugIndexStatusViewController *)self tableView];
  [v15 addSubview:v16];
}

- (void)viewWillAppear:(BOOL)a3
{
  v4.receiver = self;
  v4.super_class = (Class)MFMailDebugIndexStatusViewController;
  [(MFMailDebugIndexStatusViewController *)&v4 viewWillAppear:a3];
  [(MFMailDebugIndexStatusViewController *)self _refreshStatus];
  [(MFMailDebugIndexStatusViewController *)self _periodicallyRefreshStatus];
  [(MFMailDebugIndexStatusViewController *)self _startObservingTurboModeToggle];
}

- (void)viewWillDisappear:(BOOL)a3
{
  v4.receiver = self;
  v4.super_class = (Class)MFMailDebugIndexStatusViewController;
  [(MFMailDebugIndexStatusViewController *)&v4 viewWillDisappear:a3];
  [(MFMailDebugIndexStatusViewController *)self _stopRefreshingStatus];
  [(MFMailDebugIndexStatusViewController *)self _stopObservingTurboModeToggle];
}

- (void)_startObservingTurboModeToggle
{
  id v3 = +[UIApplication sharedApplication];
  [v3 setIdleTimerDisabled:[EMInternalPreferences preferenceEnabled:27]];

  id v4 = +[EMInternalPreferences observeChangesForPreference:27 usingBlock:&stru_10060BC48];
  -[MFMailDebugIndexStatusViewController setTurboModeObservationToken:](self, "setTurboModeObservationToken:");
}

- (void)_stopObservingTurboModeToggle
{
  id v3 = +[UIApplication sharedApplication];
  [v3 setIdleTimerDisabled:0];

  id v4 = [(MFMailDebugIndexStatusViewController *)self turboModeObservationToken];
  [v4 cancel];

  [(MFMailDebugIndexStatusViewController *)self setTurboModeObservationToken:0];
}

- (id)_dataForIndexPath:(id)a3
{
  id v4 = a3;
  id v5 = [(MFMailDebugIndexStatusViewController *)self items];
  v6 = +[NSNumber numberWithInteger:](NSNumber, "numberWithInteger:", [v4 section]);
  v7 = [v5 objectForKeyedSubscript:v6];

  id v8 = [v4 row];
  if ((uint64_t)v8 >= (uint64_t)[v7 count])
  {
    v9 = 0;
  }
  else
  {
    v9 = [v7 objectAtIndexedSubscript:[v4 row]];
  }

  return v9;
}

- (id)_messagesIndexedInTimeInterval:(double)a3 snapshots:(id)a4 currentMessagesIndexed:(int64_t)a5
{
  long long v25 = 0u;
  long long v26 = 0u;
  long long v27 = 0u;
  long long v28 = 0u;
  id v8 = a4;
  id v9 = [v8 countByEnumeratingWithState:&v25 objects:v29 count:16];
  if (v9)
  {
    uint64_t v10 = *(void *)v26;
    double v11 = a3 * 0.8;
    double v12 = a3 * 1.2;
LABEL_3:
    uint64_t v13 = 0;
    while (1)
    {
      if (*(void *)v26 != v10) {
        objc_enumerationMutation(v8);
      }
      v14 = *(void **)(*((void *)&v25 + 1) + 8 * v13);
      v16 = [v14 date:v25];
      [v16 timeIntervalSinceNow];
      double v18 = v17;

      v19 = [v14 messagesIndexed];
      id v20 = [v19 integerValue];

      BOOL v22 = v11 > -v18 || a5 - (uint64_t)v20 < 0;
      int v23 = v12 < -v18 || v22;
      if ((v23 & 1) == 0)
      {
        id v5 = +[NSNumber numberWithInteger:](NSNumber, "numberWithInteger:");
      }
      if (!v23) {
        break;
      }
      if (v9 == (id)++v13)
      {
        id v9 = [v8 countByEnumeratingWithState:&v25 objects:v29 count:16];
        if (v9) {
          goto LABEL_3;
        }
        goto LABEL_20;
      }
    }
  }
  else
  {
LABEL_20:
    id v5 = 0;
  }

  return v5;
}

- (id)_calculateIndexingSpeedWithMessagesIndexed:(int64_t)a3
{
  id v5 = +[NSDate now];
  v6 = [(MFMailDebugIndexStatusViewController *)self lastKnownIndexCountDate];
  if (v6
    && (int64_t v7 = [(MFMailDebugIndexStatusViewController *)self lastKnownIndexCount],
        v6,
        v7))
  {
    id v8 = [(MFMailDebugIndexStatusViewController *)self lastKnownIndexCountDate];
    [v5 timeIntervalSinceDate:v8];
    double v10 = v9;

    if (v10 < 5.0) {
      goto LABEL_7;
    }
    int64_t v11 = [(MFMailDebugIndexStatusViewController *)self lastKnownIndexCount];
    double v12 = [(MFMailDebugIndexStatusViewController *)self lastKnownIndexCountDate];
    [v5 timeIntervalSinceDate:v12];
    v14 = +[NSNumber numberWithDouble:(double)(60 * (a3 - v11)) / v13];
    [(MFMailDebugIndexStatusViewController *)self setCurrentIndexingSpeed:v14];
  }
  else
  {
    [(MFMailDebugIndexStatusViewController *)self setCurrentIndexingSpeed:0];
  }
  [(MFMailDebugIndexStatusViewController *)self setLastKnownIndexCountDate:v5];
  [(MFMailDebugIndexStatusViewController *)self setLastKnownIndexCount:a3];
LABEL_7:
  v15 = [(MFMailDebugIndexStatusViewController *)self currentIndexingSpeed];

  return v15;
}

- (id)_loadCacheForKey:(id)a3
{
  id v3 = a3;
  id v4 = objc_alloc_init((Class)NSMutableArray);
  id v5 = +[NSUserDefaults em_userDefaults];
  v6 = [v5 objectForKey:v3];
  v10[0] = _NSConcreteStackBlock;
  v10[1] = 3221225472;
  v10[2] = sub_1001A8114;
  v10[3] = &unk_10060BC70;
  id v7 = v4;
  id v11 = v7;
  [v6 enumerateObjectsUsingBlock:v10];

  id v8 = [v7 copy];

  return v8;
}

- (id)_reindexReasonsCache
{
  id v3 = [(MFMailDebugIndexStatusViewController *)self reindexReasonsCache];

  if (!v3)
  {
    id v4 = +[NSUserDefaults em_userDefaults];
    id v5 = [v4 objectForKey:EDSearchableIndexDefaultsKeyLastKnownReindexReasons];
    [(MFMailDebugIndexStatusViewController *)self setReindexReasonsCache:v5];
  }

  return [(MFMailDebugIndexStatusViewController *)self reindexReasonsCache];
}

- (void)_periodicallyRefreshStatus
{
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472;
  v4[2] = sub_1001A8308;
  v4[3] = &unk_1006097F0;
  v4[4] = self;
  id v3 = +[NSTimer scheduledTimerWithTimeInterval:1 repeats:v4 block:1.0];
  [(MFMailDebugIndexStatusViewController *)self setRefreshTimer:v3];
}

- (void)_stopRefreshingStatus
{
  id v3 = [(MFMailDebugIndexStatusViewController *)self refreshTimer];
  [v3 invalidate];

  [(MFMailDebugIndexStatusViewController *)self setRefreshTimer:0];
}

- (void)_refreshStatus
{
  id location = (id)0xAAAAAAAAAAAAAAAALL;
  objc_initWeak(&location, self);
  v2 = +[UIApplication sharedApplication];
  id v3 = [v2 daemonInterface];
  id v4 = [v3 diagnosticInfoGatherer];
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472;
  v5[2] = sub_1001A8498;
  v5[3] = &unk_100605F40;
  objc_copyWeak(&v6, &location);
  [v4 databaseStatisticsWithCompletionHandler:v5];

  objc_destroyWeak(&v6);
  objc_destroyWeak(&location);
}

- (id)tableView:(id)a3 titleForHeaderInSection:(int64_t)a4
{
  if ((unint64_t)a4 > 5) {
    return 0;
  }
  else {
    return *(&off_10060BD58 + a4);
  }
}

- (id)tableView:(id)a3 titleForFooterInSection:(int64_t)a4
{
  id v6 = a3;
  id v7 = 0;
  switch(a4)
  {
    case 0:
      id v7 = @"Turbo mode keeps the display on, and ignores power assertions and indexing budgets to index messages at the maximum speed.";
      break;
    case 3:
      id v8 = [(MFMailDebugIndexStatusViewController *)self items];
      double v9 = [v8 objectForKeyedSubscript:&off_10062AAD0];
      id v10 = [v9 count];

      if ((unint64_t)v10 < 4)
      {
        id v7 = @"Indexing speed history is available when we have sufficient data.";
      }
      else
      {
        id v7 = +[NSString stringWithFormat:@"Time window has an error margin of +/- %ld%%", 20];
      }
      break;
    case 4:
      id v7 = @"Server messages are downloaded and indexed overnight if the device has been plugged in.";
      break;
    case 5:
      id v7 = @"Showing up to last 50 recorded re-index reasons.";
      break;
    default:
      break;
  }

  return v7;
}

- (id)tableView:(id)a3 cellForRowAtIndexPath:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = [(MFMailDebugIndexStatusViewController *)self _dataForIndexPath:v7];
  double v9 = [v8 primaryText];
  id v10 = v9;
  if (v9 == @"Turbo mode")
  {
    uint64_t v21 = +[DebugSwitchCell preferenceSwitchWithTitle:@"Turbo mode" preference:27];
LABEL_9:
    id v11 = (id)v21;
    goto LABEL_12;
  }
  if (v9 == @"View chart")
  {
    id location = (id)0xAAAAAAAAAAAAAAAALL;
    objc_initWeak(&location, self);
    v27[0] = _NSConcreteStackBlock;
    v27[1] = 3221225472;
    v27[2] = sub_1001A9F8C;
    v27[3] = &unk_100604C00;
    objc_copyWeak(&v29, &location);
    id v28 = v7;
    id v11 = +[DebugButtonCell cellWithTitle:@"View chart" style:2 handler:v27];

    objc_destroyWeak(&v29);
    objc_destroyWeak(&location);
    goto LABEL_12;
  }
  if (v9 == @"Reset speed statistics")
  {
    v24[0] = _NSConcreteStackBlock;
    v24[1] = 3221225472;
    v24[2] = sub_1001AA0C4;
    v24[3] = &unk_100604618;
    id v25 = v7;
    long long v26 = self;
    id v11 = +[DebugButtonCell cellWithTitle:@"Reset speed statistics" style:1 handler:v24];

    goto LABEL_12;
  }
  if (v9 == @"Reset reindexing reasons")
  {
    v23[0] = _NSConcreteStackBlock;
    v23[1] = 3221225472;
    v23[2] = sub_1001AA1A8;
    v23[3] = &unk_1006047A0;
    v23[4] = self;
    uint64_t v21 = +[DebugButtonCell cellWithTitle:@"Reset reindexing reasons" style:1 handler:v23];
    goto LABEL_9;
  }
  id v11 = [v6 dequeueReusableCellWithIdentifier:@"DebugIndexStatusCell"];
  if (!v11)
  {
    id v11 = [objc_alloc((Class)UITableViewCell) initWithStyle:0 reuseIdentifier:@"DebugIndexStatusCell"];
    double v12 = +[UIColor secondarySystemGroupedBackgroundColor];
    [v11 setBackgroundColor:v12];

    [v11 setSelectionStyle:0];
  }
  double v13 = +[UIListContentConfiguration cellConfiguration];
  v14 = +[UIColor secondaryLabelColor];
  v15 = [v13 secondaryTextProperties];
  [v15 setColor:v14];

  v16 = [v8 primaryText];
  [v13 setText:v16];

  double v17 = [v8 secondaryText];
  [v13 setSecondaryText:v17];

  [v11 setContentConfiguration:v13];
  id v18 = [objc_alloc((Class)UILabel) initWithFrame:CGRectZero.origin.x, CGRectZero.origin.y, CGRectZero.size.width, CGRectZero.size.height];
  v19 = +[UIColor secondaryLabelColor];
  [v18 setTextColor:v19];

  id v20 = [v8 labelText];
  [v18 setText:v20];

  [v18 sizeToFit];
  [v11 setAccessoryView:v18];

LABEL_12:

  return v11;
}

- (int64_t)tableView:(id)a3 numberOfRowsInSection:(int64_t)a4
{
  id v5 = [(MFMailDebugIndexStatusViewController *)self items];
  id v6 = +[NSNumber numberWithInteger:a4];
  id v7 = [v5 objectForKeyedSubscript:v6];
  id v8 = [v7 count];

  return (int64_t)v8;
}

- (int64_t)numberOfSectionsInTableView:(id)a3
{
  id v3 = [(MFMailDebugIndexStatusViewController *)self items];
  id v4 = [v3 count];

  return (int64_t)v4;
}

- (void)tableView:(id)a3 didSelectRowAtIndexPath:(id)a4
{
  id v7 = a3;
  id v5 = a4;
  id v6 = [v7 cellForRowAtIndexPath:v5];
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    [v6 invokeAction];
  }
  [v7 deselectRowAtIndexPath:v5 animated:1];
}

- (UITableView)tableView
{
  return self->_tableView;
}

- (void)setTableView:(id)a3
{
}

- (NSMutableDictionary)items
{
  return self->_items;
}

- (void)setItems:(id)a3
{
}

- (int64_t)lastKnownIndexCount
{
  return self->_lastKnownIndexCount;
}

- (void)setLastKnownIndexCount:(int64_t)a3
{
  self->_lastKnownIndexCount = a3;
}

- (NSDate)lastKnownIndexCountDate
{
  return self->_lastKnownIndexCountDate;
}

- (void)setLastKnownIndexCountDate:(id)a3
{
}

- (NSNumber)currentIndexingSpeed
{
  return self->_currentIndexingSpeed;
}

- (void)setCurrentIndexingSpeed:(id)a3
{
}

- (EFCancelable)turboModeObservationToken
{
  return self->_turboModeObservationToken;
}

- (void)setTurboModeObservationToken:(id)a3
{
}

- (NSNumberFormatter)numberFormatter
{
  return self->_numberFormatter;
}

- (void)setNumberFormatter:(id)a3
{
}

- (NSArray)localIndexDiagnosticsSnapshotsCache
{
  return self->_localIndexDiagnosticsSnapshotsCache;
}

- (void)setLocalIndexDiagnosticsSnapshotsCache:(id)a3
{
}

- (NSArray)remoteIndexDiagnosticsSnapshotsCache
{
  return self->_remoteIndexDiagnosticsSnapshotsCache;
}

- (void)setRemoteIndexDiagnosticsSnapshotsCache:(id)a3
{
}

- (NSArray)reindexReasonsCache
{
  return self->_reindexReasonsCache;
}

- (void)setReindexReasonsCache:(id)a3
{
}

- (NSTimer)refreshTimer
{
  return self->_refreshTimer;
}

- (void)setRefreshTimer:(id)a3
{
}

- (void)setReindexDateFormatter:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_reindexDateFormatter, 0);
  objc_storeStrong((id *)&self->_refreshTimer, 0);
  objc_storeStrong((id *)&self->_reindexReasonsCache, 0);
  objc_storeStrong((id *)&self->_remoteIndexDiagnosticsSnapshotsCache, 0);
  objc_storeStrong((id *)&self->_localIndexDiagnosticsSnapshotsCache, 0);
  objc_storeStrong((id *)&self->_numberFormatter, 0);
  objc_storeStrong((id *)&self->_turboModeObservationToken, 0);
  objc_storeStrong((id *)&self->_currentIndexingSpeed, 0);
  objc_storeStrong((id *)&self->_lastKnownIndexCountDate, 0);
  objc_storeStrong((id *)&self->_items, 0);

  objc_storeStrong((id *)&self->_tableView, 0);
}

@end