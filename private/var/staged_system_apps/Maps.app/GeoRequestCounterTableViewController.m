@interface GeoRequestCounterTableViewController
- (BOOL)isLoggingEnabled;
- (GEORequestCounter)reqCounter;
- (NSArray)routePreloadSessions;
- (NSDictionary)appRequestDict;
- (NSDictionary)placeCachePerAppCountsDict;
- (NSDictionary)placeCacheResultsDict;
- (NSOrderedSet)appRequestOrderedKeys;
- (NSOrderedSet)placeCacheCountsOrderedKeys;
- (NSOrderedSet)trafficProbeOrderedKeys;
- (id)getRecvBytesForAllApps;
- (id)getXmitBytesForAllApps;
- (id)tableView:(id)a3 cellForRowAtIndexPath:(id)a4;
- (id)tableView:(id)a3 titleForHeaderInSection:(int64_t)a4;
- (int64_t)getTotalRequestCountFor:(id)a3;
- (int64_t)getTotalRequestCountForAllApps;
- (int64_t)numberOfSectionsInTableView:(id)a3;
- (int64_t)tableView:(id)a3 numberOfRowsInSection:(int64_t)a4;
- (unint64_t)_getCacheTotal:(unsigned __int8)a3 forApp:(id)a4;
- (unint64_t)getCacheExpiredForApp:(id)a3;
- (unint64_t)getCacheHitsForApp:(id)a3;
- (unint64_t)getCacheMissesForApp:(id)a3;
- (void)_fetchPlaceCacheReults;
- (void)_reloadData;
- (void)_resetLogs;
- (void)_toggleLogging;
- (void)requestLogs:(id)a3;
- (void)setAppRequestDict:(id)a3;
- (void)setAppRequestOrderedKeys:(id)a3;
- (void)setIsLoggingEnabled:(BOOL)a3;
- (void)setPlaceCacheCountsOrderedKeys:(id)a3;
- (void)setPlaceCachePerAppCountsDict:(id)a3;
- (void)setPlaceCacheResultsDict:(id)a3;
- (void)setReqCounter:(id)a3;
- (void)setRoutePreloadSessions:(id)a3;
- (void)setTrafficProbeOrderedKeys:(id)a3;
- (void)tableView:(id)a3 didSelectRowAtIndexPath:(id)a4;
- (void)viewDidLoad;
- (void)viewWillAppear:(BOOL)a3;
@end

@implementation GeoRequestCounterTableViewController

- (void)viewWillAppear:(BOOL)a3
{
  v8.receiver = self;
  v8.super_class = (Class)GeoRequestCounterTableViewController;
  [(GeoRequestCounterTableViewController *)&v8 viewWillAppear:a3];
  v4 = [(GeoRequestCounterDurations *)self->_durations currentSelection];
  id v5 = [v4 firstIndex];

  int64_t currentDuration = self->_currentDuration;
  if ((id)currentDuration != v5) {
    self->_int64_t currentDuration = (int64_t)v5;
  }
  unint64_t v7 = [(GeoRequestCounterInterfaces *)self->_interfaces currentInterfaces];
  if (self->_currentInterfaces != v7)
  {
    self->_currentInterfaces = v7;
    goto LABEL_7;
  }
  if ((id)currentDuration != v5) {
LABEL_7:
  }
    [(GeoRequestCounterTableViewController *)self _reloadData];
}

- (void)viewDidLoad
{
  v13.receiver = self;
  v13.super_class = (Class)GeoRequestCounterTableViewController;
  [(GeoRequestCounterTableViewController *)&v13 viewDidLoad];
  v3 = objc_alloc_init(GeoRequestCounterDurations);
  durations = self->_durations;
  self->_durations = v3;

  id v5 = [(GeoRequestCounterDurations *)self->_durations currentSelection];
  self->_int64_t currentDuration = (int64_t)[v5 firstIndex];

  v6 = objc_alloc_init(GeoRequestCounterInterfaces);
  interfaces = self->_interfaces;
  self->_interfaces = v6;

  [(GeoRequestCounterTableViewController *)self setTitle:@"geod Counters"];
  objc_super v8 = [(GeoRequestCounterTableViewController *)self reqCounter];
  self->_isLoggingEnabled = [v8 countersEnabled];

  id v9 = [objc_alloc((Class)UIBarButtonItem) initWithBarButtonSystemItem:13 target:self action:"_reloadData"];
  v10 = [(GeoRequestCounterTableViewController *)self navigationItem];
  [v10 setRightBarButtonItem:v9];

  v11 = (NSDateIntervalFormatter *)objc_alloc_init((Class)NSDateIntervalFormatter);
  dateIntervalFormatter = self->_dateIntervalFormatter;
  self->_dateIntervalFormatter = v11;

  [(NSDateIntervalFormatter *)self->_dateIntervalFormatter setDateStyle:1];
  [(NSDateIntervalFormatter *)self->_dateIntervalFormatter setTimeStyle:1];
}

- (void)setIsLoggingEnabled:(BOOL)a3
{
  self->_isLoggingEnabled = a3;
  v4 = [(GeoRequestCounterTableViewController *)self reqCounter];
  [v4 setCountersEnabled:self->_isLoggingEnabled];

  id v5 = [(GeoRequestCounterTableViewController *)self tableView];
  [v5 reloadData];
}

- (GEORequestCounter)reqCounter
{
  reqCounter = self->_reqCounter;
  if (!reqCounter)
  {
    v4 = (GEORequestCounter *)objc_alloc_init((Class)GEORequestCounter);
    id v5 = self->_reqCounter;
    self->_reqCounter = v4;

    reqCounter = self->_reqCounter;
  }

  return reqCounter;
}

- (NSDictionary)appRequestDict
{
  if (!self->_appRequestDict && [(GeoRequestCounterTableViewController *)self isLoggingEnabled])
  {
    v3 = [(GeoRequestCounterTableViewController *)self reqCounter];
    [(GeoRequestCounterDurations *)self->_durations currentDurationInterval];
    id v5 = +[NSDate dateWithTimeIntervalSinceNow:-v4];
    v8[0] = _NSConcreteStackBlock;
    v8[1] = 3221225472;
    v8[2] = sub_100BA3160;
    v8[3] = &unk_10131A480;
    v8[4] = self;
    [v3 readRequestsPerAppSince:v5 handler:v8];
  }
  appRequestDict = self->_appRequestDict;

  return appRequestDict;
}

- (void)setAppRequestDict:(id)a3
{
  if (self->_appRequestDict != a3)
  {
    id v4 = a3;
    +[NSMutableDictionary dictionaryWithCapacity:](NSMutableDictionary, "dictionaryWithCapacity:", [v4 count]);
    v11 = _NSConcreteStackBlock;
    uint64_t v12 = 3221225472;
    objc_super v13 = sub_100BA3398;
    v14 = &unk_10131A4A8;
    v15 = self;
    id v5 = (id)objc_claimAutoreleasedReturnValue();
    id v16 = v5;
    [v4 enumerateKeysAndObjectsUsingBlock:&v11];

    v6 = [v5 copy:v11, v12, v13, v14, v15];
    appRequestDict = self->_appRequestDict;
    self->_appRequestDict = v6;

    objc_super v8 = [(NSDictionary *)self->_appRequestDict allKeys];
    id v9 = [v8 sortedArrayUsingSelector:"compare:"];

    if (v9)
    {
      v10 = +[NSOrderedSet orderedSetWithArray:v9];
    }
    else
    {
      v10 = 0;
    }
    objc_storeStrong((id *)&self->_appRequestOrderedKeys, v10);
    if (v9) {
  }
    }
}

- (void)_fetchPlaceCacheReults
{
  v3 = [(GeoRequestCounterTableViewController *)self reqCounter];
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472;
  v4[2] = sub_100BA34B0;
  v4[3] = &unk_1012E7610;
  v4[4] = self;
  [v3 placeCacheGetCounts:0 forApp:0 inTimeRange:0 ofType:0 handler:v4];
}

- (NSDictionary)placeCacheResultsDict
{
  if (!self->_placeCacheResultsDict
    && [(GeoRequestCounterTableViewController *)self isLoggingEnabled])
  {
    [(GeoRequestCounterTableViewController *)self _fetchPlaceCacheReults];
  }
  placeCacheResultsDict = self->_placeCacheResultsDict;

  return placeCacheResultsDict;
}

- (void)setPlaceCacheResultsDict:(id)a3
{
  if (self->_placeCacheResultsDict != a3)
  {
    id v4 = (NSDictionary *)[a3 copy];
    placeCacheResultsDict = self->_placeCacheResultsDict;
    self->_placeCacheResultsDict = v4;

    v6 = [(NSDictionary *)self->_placeCacheResultsDict allKeys];
    id v9 = [v6 sortedArrayUsingSelector:"compare:"];

    if (v9)
    {
      unint64_t v7 = +[NSOrderedSet orderedSetWithArray:v9];
    }
    else
    {
      unint64_t v7 = 0;
    }
    objc_storeStrong((id *)&self->_placeCacheCountsOrderedKeys, v7);
    objc_super v8 = v9;
    if (v9)
    {

      objc_super v8 = v9;
    }
  }
}

- (NSDictionary)placeCachePerAppCountsDict
{
  if (!self->_placeCachePerAppCountsDict
    && [(GeoRequestCounterTableViewController *)self isLoggingEnabled])
  {
    [(GeoRequestCounterTableViewController *)self _fetchPlaceCacheReults];
  }
  placeCachePerAppCountsDict = self->_placeCachePerAppCountsDict;

  return placeCachePerAppCountsDict;
}

- (void)setPlaceCachePerAppCountsDict:(id)a3
{
  if (self->_placeCachePerAppCountsDict != a3)
  {
    id v4 = (NSDictionary *)[a3 copy];
    placeCachePerAppCountsDict = self->_placeCachePerAppCountsDict;
    self->_placeCachePerAppCountsDict = v4;
  }
}

- (void)requestLogs:(id)a3
{
  id v4 = a3;
  id v5 = (void (**)(void, void))v4;
  requestLogs = self->_requestLogs;
  if (requestLogs)
  {
    (*((void (**)(id, NSArray *))v4 + 2))(v4, requestLogs);
  }
  else if ([(GeoRequestCounterTableViewController *)self isLoggingEnabled])
  {
    unint64_t v7 = [(GeoRequestCounterTableViewController *)self reqCounter];
    [(GeoRequestCounterDurations *)self->_durations currentDurationInterval];
    id v9 = +[NSDate dateWithTimeIntervalSinceNow:-v8];
    v10[0] = _NSConcreteStackBlock;
    v10[1] = 3221225472;
    v10[2] = sub_100BA3CDC;
    v10[3] = &unk_1012E6EF8;
    v10[4] = self;
    v11 = v5;
    [v7 readRequestLogsSince:v9 handler:v10];
  }
  else
  {
    v5[2](v5, 0);
  }
}

- (NSArray)routePreloadSessions
{
  unsigned int v3 = [(GeoRequestCounterTableViewController *)self isLoggingEnabled];
  routePreloadSessions = self->_routePreloadSessions;
  if (v3 && !routePreloadSessions)
  {
    id v5 = [(GeoRequestCounterTableViewController *)self reqCounter];
    [(GeoRequestCounterDurations *)self->_durations currentDurationInterval];
    unint64_t v7 = +[NSDate dateWithTimeIntervalSinceNow:-v6];
    v9[0] = _NSConcreteStackBlock;
    v9[1] = 3221225472;
    v9[2] = sub_100BA3F78;
    v9[3] = &unk_1012F0F88;
    v9[4] = self;
    [v5 fetchRoutePreloadSessionsFrom:v7 completion:v9 completionQueue:&_dispatch_main_q];

    routePreloadSessions = self->_routePreloadSessions;
  }

  return routePreloadSessions;
}

- (int64_t)numberOfSectionsInTableView:(id)a3
{
  if ([(GeoRequestCounterTableViewController *)self isLoggingEnabled]) {
    return 6;
  }
  else {
    return 1;
  }
}

- (int64_t)tableView:(id)a3 numberOfRowsInSection:(int64_t)a4
{
  id v6 = a3;
  int64_t v7 = 1;
  switch(a4)
  {
    case 0:
      if ([(GeoRequestCounterTableViewController *)self isLoggingEnabled]) {
        int64_t v7 = 4;
      }
      else {
        int64_t v7 = 1;
      }
      break;
    case 1:
    case 2:
      break;
    case 3:
      double v8 = [(GeoRequestCounterTableViewController *)self appRequestDict];
      goto LABEL_9;
    case 4:
      double v8 = [(GeoRequestCounterTableViewController *)self placeCacheResultsDict];
      goto LABEL_9;
    case 5:
      double v8 = [(GeoRequestCounterTableViewController *)self routePreloadSessions];
LABEL_9:
      id v9 = v8;
      int64_t v7 = (int64_t)[v8 count];

      break;
    default:
      int64_t v7 = 0;
      break;
  }

  return v7;
}

- (id)tableView:(id)a3 titleForHeaderInSection:(int64_t)a4
{
  if ((unint64_t)a4 > 5) {
    return 0;
  }
  else {
    return *(&off_10131A518 + a4);
  }
}

- (id)tableView:(id)a3 cellForRowAtIndexPath:(id)a4
{
  id v6 = a3;
  id v64 = a4;
  switch((unint64_t)[v64 section])
  {
    case 0uLL:
      id v7 = [objc_alloc((Class)UITableViewCell) initWithStyle:0 reuseIdentifier:0];
      switch((unint64_t)[v64 row])
      {
        case 0uLL:
          double v8 = [v7 textLabel];
          [v8 setText:@"Enable Counter"];

          id v9 = objc_alloc_init((Class)UISwitch);
          [v9 setOn:[self isLoggingEnabled]];
          [v9 addTarget:self action:"_toggleLogging" forControlEvents:4096];
          [v7 setAccessoryView:v9];
          [v7 setSelectionStyle:0];
          goto LABEL_27;
        case 1uLL:
          id v57 = [objc_alloc((Class)UITableViewCell) initWithStyle:1 reuseIdentifier:0];

          [v57 setSelectionStyle:3];
          v58 = [v57 textLabel];
          [v58 setText:@"Duration"];

          uint64_t v59 = 88;
          goto LABEL_33;
        case 2uLL:
          id v57 = [objc_alloc((Class)UITableViewCell) initWithStyle:1 reuseIdentifier:0];

          [v57 setSelectionStyle:3];
          v60 = [v57 textLabel];
          [v60 setText:@"Interface Filters"];

          uint64_t v59 = 104;
LABEL_33:
          v61 = [*(id *)((char *)&self->super.super.super.super.isa + v59) currentSelectionString];
          v62 = [v57 detailTextLabel];
          [v62 setText:v61];

          [v57 setAccessoryType:1];
          id v7 = v57;
          break;
        case 3uLL:
          v63 = [v7 textLabel];
          [v63 setText:@"Clear Logs"];

          break;
        default:
          goto LABEL_28;
      }
      break;
    case 1uLL:
      id v7 = [objc_alloc((Class)UITableViewCell) initWithStyle:3 reuseIdentifier:0];
      v18 = [v7 textLabel];
      [v18 setText:@"Total Counts"];

      int64_t v19 = [(GeoRequestCounterTableViewController *)self getTotalRequestCountForAllApps];
      v20 = [(GeoRequestCounterTableViewController *)self getXmitBytesForAllApps];
      v21 = [(GeoRequestCounterTableViewController *)self getRecvBytesForAllApps];
      v22 = +[NSString stringWithFormat:@"%ld requests : xmit:%@ / recv:%@", v19, v20, v21];
      v23 = [v7 detailTextLabel];
      [v23 setText:v22];

      goto LABEL_11;
    case 2uLL:
      id v7 = [objc_alloc((Class)UITableViewCell) initWithStyle:3 reuseIdentifier:0];
      v24 = [v7 textLabel];
      [v24 setText:@"Total Counts"];

      v25 = +[NSString stringWithFormat:@"%ld hits / %ld misses / %ld expired", self->_totalCacheHits, self->_totalCacheMisses, self->_totalCacheExpired];
      v26 = [v7 detailTextLabel];
      [v26 setText:v25];

LABEL_11:
      [v7 setAccessoryType:1];
      break;
    case 3uLL:
      id v7 = [v6 dequeueReusableCellWithIdentifier:@"AppRequests"];
      if (!v7) {
        id v7 = [objc_alloc((Class)UITableViewCell) initWithStyle:3 reuseIdentifier:@"AppRequests"];
      }
      v27 = [(GeoRequestCounterTableViewController *)self appRequestOrderedKeys];
      [v27 objectAtIndex:[v64 row]];
      id v9 = (id)objc_claimAutoreleasedReturnValue();

      v28 = [(GeoRequestCounterTableViewController *)self view];
      v29 = [v28 window];
      if (v29)
      {
        v30 = [(GeoRequestCounterTableViewController *)self view];
        [v30 window];
        v32 = id v31 = v6;
        v33 = [v32 screen];
        [v33 scale];
        v17 = +[UIImage _applicationIconImageForBundleIdentifier:format:scale:](UIImage, "_applicationIconImageForBundleIdentifier:format:scale:", v9, 0);

        id v6 = v31;
      }
      else
      {
        v30 = +[UIScreen mainScreen];
        [v30 scale];
        v17 = +[UIImage _applicationIconImageForBundleIdentifier:format:scale:](UIImage, "_applicationIconImageForBundleIdentifier:format:scale:", v9, 0);
      }

      v47 = [v7 imageView];
      [v47 setImage:v17];

      v48 = [(GeoRequestCounterTableViewController *)self appRequestDict];
      v49 = [v48 objectForKeyedSubscript:v9];

      v50 = [v7 textLabel];
      [v50 setText:v9];

      int64_t v51 = [(GeoRequestCounterTableViewController *)self getTotalRequestCountFor:v49];
      v52 = +[NSByteCountFormatter stringFromByteCount:countStyle:](NSByteCountFormatter, "stringFromByteCount:countStyle:", [v49 xmitBytes], 3);
      v53 = +[NSByteCountFormatter stringFromByteCount:countStyle:](NSByteCountFormatter, "stringFromByteCount:countStyle:", [v49 recvBytes], 3);
      v54 = +[NSString stringWithFormat:@"%ld requests : xmit:%@ / recv:%@", v51, v52, v53];
      v55 = [v7 detailTextLabel];
      [v55 setText:v54];

      [v7 setAccessoryType:1];
      goto LABEL_26;
    case 4uLL:
      id v7 = [v6 dequeueReusableCellWithIdentifier:@"CacheRequests"];
      if (!v7) {
        id v7 = [objc_alloc((Class)UITableViewCell) initWithStyle:3 reuseIdentifier:@"CacheRequests"];
      }
      v10 = [(GeoRequestCounterTableViewController *)self placeCacheCountsOrderedKeys];
      [v10 objectAtIndex:[v64 row]];
      id v9 = (id)objc_claimAutoreleasedReturnValue();

      v11 = [(GeoRequestCounterTableViewController *)self view];
      uint64_t v12 = [v11 window];
      if (v12)
      {
        objc_super v13 = [(GeoRequestCounterTableViewController *)self view];
        v14 = [v13 window];
        [v14 screen];
        id v16 = v15 = v6;
        [v16 scale];
        v17 = +[UIImage _applicationIconImageForBundleIdentifier:format:scale:](UIImage, "_applicationIconImageForBundleIdentifier:format:scale:", v9, 0);

        id v6 = v15;
      }
      else
      {
        objc_super v13 = +[UIScreen mainScreen];
        [v13 scale];
        v17 = +[UIImage _applicationIconImageForBundleIdentifier:format:scale:](UIImage, "_applicationIconImageForBundleIdentifier:format:scale:", v9, 0);
      }

      v43 = [v7 imageView];
      [v43 setImage:v17];

      v44 = [v7 textLabel];
      [v44 setText:v9];

      v45 = +[NSString stringWithFormat:@"%ld hits / %ld misses / %ld expired", [(GeoRequestCounterTableViewController *)self getCacheHitsForApp:v9], [(GeoRequestCounterTableViewController *)self getCacheMissesForApp:v9], [(GeoRequestCounterTableViewController *)self getCacheExpiredForApp:v9]];
      v46 = [v7 detailTextLabel];
      [v46 setText:v45];

      [v7 setAccessoryType:1];
LABEL_26:

      goto LABEL_27;
    case 5uLL:
      id v7 = [v6 dequeueReusableCellWithIdentifier:@"RoutePreloadSession"];
      if (!v7) {
        id v7 = [objc_alloc((Class)UITableViewCell) initWithStyle:3 reuseIdentifier:@"RoutePreloadSession"];
      }
      v34 = [(GeoRequestCounterTableViewController *)self routePreloadSessions];
      [v34 objectAtIndexedSubscript:[v64 row]];
      id v9 = (id)objc_claimAutoreleasedReturnValue();

      dateIntervalFormatter = self->_dateIntervalFormatter;
      v36 = [v9 dateInterval];
      v37 = [(NSDateIntervalFormatter *)dateIntervalFormatter stringFromDateInterval:v36];
      v38 = [v7 textLabel];
      [v38 setText:v37];

      id v39 = [v9 transportType];
      if (v39 >= 7)
      {
        v40 = +[NSString stringWithFormat:@"(unknown: %i)", v39];
      }
      else
      {
        v40 = *(&off_10131A548 + (int)v39);
      }
      v41 = [NSString stringWithFormat:@"%@: Preloaded: %llu - Missed: %llu / %llu", v40, [v9 tilesPreloaded], [v9 tilesMissed], [v9 tilesUsed]];
      v42 = [v7 detailTextLabel];
      [v42 setText:v41];

      [v7 setAccessoryType:0];
      [v7 setSelectionStyle:0];

LABEL_27:
      break;
    default:
      id v7 = 0;
      break;
  }
LABEL_28:

  return v7;
}

- (void)tableView:(id)a3 didSelectRowAtIndexPath:(id)a4
{
  id v22 = a4;
  switch((unint64_t)[v22 section])
  {
    case 0uLL:
      id v5 = [v22 row];
      if (v5 == (id)3)
      {
        [(GeoRequestCounterTableViewController *)self _resetLogs];
      }
      else
      {
        if (v5 == (id)2)
        {
          id v6 = [GeoRequestCounterSelectionTableViewController alloc];
          uint64_t v7 = 104;
          goto LABEL_15;
        }
        if (v5 == (id)1)
        {
          id v6 = [GeoRequestCounterSelectionTableViewController alloc];
          uint64_t v7 = 88;
LABEL_15:
          v10 = [(GeoRequestCounterSelectionTableViewController *)v6 initWithSelection:*(Class *)((char *)&self->super.super.super.super.isa + v7)];
          goto LABEL_16;
        }
      }
LABEL_18:

      return;
    case 1uLL:
      double v8 = [GeoTotalRequestCountTableViewController alloc];
      id v9 = [(GeoRequestCounterTableViewController *)self appRequestDict];
      v10 = [(GeoTotalRequestCountTableViewController *)v8 initWithDictionary:v9];

      v11 = (GeoPlaceCacheDetailTableViewController *)v10;
      goto LABEL_8;
    case 2uLL:
      v11 = [[GeoPlaceCacheDetailTableViewController alloc] initWithGEORequestCounterCacheResults:self->_placeCacheResults];
      v10 = (GeoRequestCounterSelectionTableViewController *)v11;
LABEL_8:
      [(GeoPlaceCacheDetailTableViewController *)v11 setTitle:@"Total Request"];
LABEL_16:
      v21 = [(GeoRequestCounterTableViewController *)self navigationController];
      [v21 pushViewController:v10 animated:1];

      goto LABEL_17;
    case 3uLL:
      uint64_t v12 = [(GeoRequestCounterTableViewController *)self appRequestOrderedKeys];
      [v12 objectAtIndexedSubscript:[v22 row]];
      v10 = (GeoRequestCounterSelectionTableViewController *)objc_claimAutoreleasedReturnValue();

      objc_super v13 = [(GeoRequestCounterTableViewController *)self appRequestDict];
      v14 = [v13 objectForKeyedSubscript:v10];

      id v15 = [[GeoRequestDetailTableViewController alloc] initWithGEORequestCounterInfo:v14];
      goto LABEL_11;
    case 4uLL:
      id v16 = [(GeoRequestCounterTableViewController *)self placeCacheCountsOrderedKeys];
      objc_msgSend(v16, "objectAtIndexedSubscript:", objc_msgSend(v22, "row"));
      v10 = (GeoRequestCounterSelectionTableViewController *)objc_claimAutoreleasedReturnValue();

      v17 = [(GeoRequestCounterTableViewController *)self placeCacheResultsDict];
      v14 = [v17 objectForKeyedSubscript:v10];

      id v15 = [[GeoPlaceCacheDetailTableViewController alloc] initWithGEORequestCounterCacheResults:v14];
LABEL_11:
      v18 = v15;
      [(GeoRequestDetailTableViewController *)v15 setTitle:v10];
      int64_t v19 = [(GeoRequestCounterTableViewController *)self navigationController];
      [v19 pushViewController:v18 animated:1];

LABEL_17:
      goto LABEL_18;
    case 5uLL:
      v20 = [(GeoRequestCounterTableViewController *)self tableView];
      [v20 deselectRowAtIndexPath:v22 animated:1];

      goto LABEL_18;
    default:
      goto LABEL_18;
  }
}

- (void)_toggleLogging
{
  uint64_t v3 = [(GeoRequestCounterTableViewController *)self isLoggingEnabled] ^ 1;

  [(GeoRequestCounterTableViewController *)self setIsLoggingEnabled:v3];
}

- (void)_resetLogs
{
  uint64_t v3 = [(GeoRequestCounterTableViewController *)self reqCounter];
  [v3 clearCounters];

  [(GeoRequestCounterTableViewController *)self _reloadData];
  id v5 = objc_alloc_init((Class)UIAlertController);
  [v5 setTitle:@"GEO Request Counter"];
  [v5 setMessage:@"Logged Data has been cleared."];
  id v4 = +[UIAlertAction actionWithTitle:@"OK" style:2 handler:0];
  [v5 addAction:v4];

  [(GeoRequestCounterTableViewController *)self presentViewController:v5 animated:1 completion:0];
}

- (void)_reloadData
{
  appRequestDict = self->_appRequestDict;
  self->_appRequestDict = 0;

  requestLogs = self->_requestLogs;
  self->_requestLogs = 0;

  placeCacheResults = self->_placeCacheResults;
  self->_placeCacheResults = 0;

  placeCacheResultsDict = self->_placeCacheResultsDict;
  self->_placeCacheResultsDict = 0;

  placeCachePerAppCountsDict = self->_placeCachePerAppCountsDict;
  self->_placeCachePerAppCountsDict = 0;

  placeCacheCountsOrderedKeys = self->_placeCacheCountsOrderedKeys;
  self->_placeCacheCountsOrderedKeys = 0;

  id v9 = [(GeoRequestCounterTableViewController *)self tableView];
  [v9 reloadData];
}

- (int64_t)getTotalRequestCountFor:(id)a3
{
  uint64_t v9 = 0;
  v10 = &v9;
  uint64_t v11 = 0x2020000000;
  uint64_t v12 = 0;
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472;
  v6[2] = sub_100BA5018;
  v6[3] = &unk_10131A4F8;
  double v8 = &v9;
  id v3 = a3;
  id v7 = v3;
  [v3 enumerateRequestTypes:v6];
  int64_t v4 = v10[3];

  _Block_object_dispose(&v9, 8);
  return v4;
}

- (int64_t)getTotalRequestCountForAllApps
{
  id v3 = [(GeoRequestCounterTableViewController *)self appRequestDict];
  int64_t v4 = [v3 allValues];

  long long v14 = 0u;
  long long v15 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  id v5 = v4;
  id v6 = [v5 countByEnumeratingWithState:&v12 objects:v16 count:16];
  if (v6)
  {
    id v7 = v6;
    int64_t v8 = 0;
    uint64_t v9 = *(void *)v13;
    do
    {
      for (i = 0; i != v7; i = (char *)i + 1)
      {
        if (*(void *)v13 != v9) {
          objc_enumerationMutation(v5);
        }
        v8 += -[GeoRequestCounterTableViewController getTotalRequestCountFor:](self, "getTotalRequestCountFor:", *(void *)(*((void *)&v12 + 1) + 8 * i), (void)v12);
      }
      id v7 = [v5 countByEnumeratingWithState:&v12 objects:v16 count:16];
    }
    while (v7);
  }
  else
  {
    int64_t v8 = 0;
  }

  return v8;
}

- (id)getXmitBytesForAllApps
{
  v2 = [(GeoRequestCounterTableViewController *)self appRequestDict];
  id v3 = [v2 allValues];

  long long v14 = 0u;
  long long v15 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  id v4 = v3;
  id v5 = [v4 countByEnumeratingWithState:&v12 objects:v16 count:16];
  if (v5)
  {
    id v6 = v5;
    uint64_t v7 = 0;
    uint64_t v8 = *(void *)v13;
    do
    {
      for (i = 0; i != v6; i = (char *)i + 1)
      {
        if (*(void *)v13 != v8) {
          objc_enumerationMutation(v4);
        }
        v7 += (uint64_t)[*(id *)(*((void *)&v12 + 1) + 8 * i) xmitBytes:v12];
      }
      id v6 = [v4 countByEnumeratingWithState:&v12 objects:v16 count:16];
    }
    while (v6);
  }
  else
  {
    uint64_t v7 = 0;
  }

  v10 = +[NSByteCountFormatter stringFromByteCount:v7 countStyle:3];

  return v10;
}

- (id)getRecvBytesForAllApps
{
  v2 = [(GeoRequestCounterTableViewController *)self appRequestDict];
  id v3 = [v2 allValues];

  long long v14 = 0u;
  long long v15 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  id v4 = v3;
  id v5 = [v4 countByEnumeratingWithState:&v12 objects:v16 count:16];
  if (v5)
  {
    id v6 = v5;
    uint64_t v7 = 0;
    uint64_t v8 = *(void *)v13;
    do
    {
      for (i = 0; i != v6; i = (char *)i + 1)
      {
        if (*(void *)v13 != v8) {
          objc_enumerationMutation(v4);
        }
        v7 += (uint64_t)[*(id *)(*((void *)&v12 + 1) + 8 * i) recvBytes:v12];
      }
      id v6 = [v4 countByEnumeratingWithState:&v12 objects:v16 count:16];
    }
    while (v6);
  }
  else
  {
    uint64_t v7 = 0;
  }

  v10 = +[NSByteCountFormatter stringFromByteCount:v7 countStyle:3];

  return v10;
}

- (unint64_t)_getCacheTotal:(unsigned __int8)a3 forApp:(id)a4
{
  uint64_t v4 = a3;
  id v5 = [(NSDictionary *)self->_placeCachePerAppCountsDict objectForKeyedSubscript:a4];
  id v6 = +[NSNumber numberWithUnsignedChar:v4];
  uint64_t v7 = [v5 objectForKeyedSubscript:v6];

  id v8 = [v7 unsignedIntegerValue];
  return (unint64_t)v8;
}

- (unint64_t)getCacheHitsForApp:(id)a3
{
  return [(GeoRequestCounterTableViewController *)self _getCacheTotal:1 forApp:a3];
}

- (unint64_t)getCacheMissesForApp:(id)a3
{
  return [(GeoRequestCounterTableViewController *)self _getCacheTotal:2 forApp:a3];
}

- (unint64_t)getCacheExpiredForApp:(id)a3
{
  return [(GeoRequestCounterTableViewController *)self _getCacheTotal:3 forApp:a3];
}

- (void)setRoutePreloadSessions:(id)a3
{
}

- (BOOL)isLoggingEnabled
{
  return self->_isLoggingEnabled;
}

- (void)setReqCounter:(id)a3
{
}

- (NSOrderedSet)appRequestOrderedKeys
{
  return self->_appRequestOrderedKeys;
}

- (void)setAppRequestOrderedKeys:(id)a3
{
}

- (NSOrderedSet)placeCacheCountsOrderedKeys
{
  return self->_placeCacheCountsOrderedKeys;
}

- (void)setPlaceCacheCountsOrderedKeys:(id)a3
{
}

- (NSOrderedSet)trafficProbeOrderedKeys
{
  return self->_trafficProbeOrderedKeys;
}

- (void)setTrafficProbeOrderedKeys:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_trafficProbeOrderedKeys, 0);
  objc_storeStrong((id *)&self->_placeCacheCountsOrderedKeys, 0);
  objc_storeStrong((id *)&self->_appRequestOrderedKeys, 0);
  objc_storeStrong((id *)&self->_reqCounter, 0);
  objc_storeStrong((id *)&self->_interfaces, 0);
  objc_storeStrong((id *)&self->_durations, 0);
  objc_storeStrong((id *)&self->_dateIntervalFormatter, 0);
  objc_storeStrong((id *)&self->_routePreloadSessions, 0);
  objc_storeStrong((id *)&self->_requestLogs, 0);
  objc_storeStrong((id *)&self->_placeCachePerAppCountsDict, 0);
  objc_storeStrong((id *)&self->_placeCacheResultsDict, 0);
  objc_storeStrong((id *)&self->_placeCacheResults, 0);

  objc_storeStrong((id *)&self->_appRequestDict, 0);
}

@end