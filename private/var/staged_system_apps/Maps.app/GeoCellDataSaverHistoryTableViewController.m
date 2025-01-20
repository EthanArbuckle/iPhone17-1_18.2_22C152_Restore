@interface GeoCellDataSaverHistoryTableViewController
- (GeoCellDataSaverHistoryTableViewController)init;
- (id)tableView:(id)a3 cellForRowAtIndexPath:(id)a4;
- (int64_t)numberOfSectionsInTableView:(id)a3;
- (int64_t)tableView:(id)a3 numberOfRowsInSection:(int64_t)a4;
- (void)_toggleLogging:(id)a3;
- (void)tableView:(id)a3 didSelectRowAtIndexPath:(id)a4;
- (void)viewDidLoad;
- (void)viewWillAppear:(BOOL)a3;
@end

@implementation GeoCellDataSaverHistoryTableViewController

- (GeoCellDataSaverHistoryTableViewController)init
{
  v9.receiver = self;
  v9.super_class = (Class)GeoCellDataSaverHistoryTableViewController;
  v2 = [(GeoCellDataSaverHistoryTableViewController *)&v9 initWithStyle:1];
  if (v2)
  {
    v3 = (NSDateFormatter *)objc_alloc_init((Class)NSDateFormatter);
    dateFormatter = v2->_dateFormatter;
    v2->_dateFormatter = v3;

    [(NSDateFormatter *)v2->_dateFormatter setDateStyle:1];
    [(NSDateFormatter *)v2->_dateFormatter setTimeStyle:1];
    v5 = (NSMeasurementFormatter *)objc_alloc_init((Class)NSMeasurementFormatter);
    durationFormatter = v2->_durationFormatter;
    v2->_durationFormatter = v5;

    [(NSMeasurementFormatter *)v2->_durationFormatter setUnitOptions:2];
    [(NSMeasurementFormatter *)v2->_durationFormatter setUnitStyle:2];
    v7 = [(NSMeasurementFormatter *)v2->_durationFormatter numberFormatter];
    [v7 setMaximumFractionDigits:0];
  }
  return v2;
}

- (void)viewDidLoad
{
  v3.receiver = self;
  v3.super_class = (Class)GeoCellDataSaverHistoryTableViewController;
  [(GeoCellDataSaverHistoryTableViewController *)&v3 viewDidLoad];
  [(GeoCellDataSaverHistoryTableViewController *)self setTitle:@"CDS History"];
}

- (void)viewWillAppear:(BOOL)a3
{
  v9.receiver = self;
  v9.super_class = (Class)GeoCellDataSaverHistoryTableViewController;
  [(GeoCellDataSaverHistoryTableViewController *)&v9 viewWillAppear:a3];
  v4 = +[NSDate dateWithTimeIntervalSinceNow:-864000.0];
  objc_initWeak(&location, self);
  v5 = +[GEORequestCounter sharedCounter];
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472;
  v6[2] = sub_1004EF8E0;
  v6[3] = &unk_1012E6E78;
  objc_copyWeak(&v7, &location);
  [v5 readProactiveTileDownloadsSince:v4 handler:v6];

  objc_destroyWeak(&v7);
  objc_destroyWeak(&location);
}

- (void)_toggleLogging:(id)a3
{
  id v3 = a3;
  id v5 = +[GEORequestCounter sharedCounter];
  id v4 = [v3 isOn];

  [v5 setCountersEnabled:v4];
}

- (int64_t)numberOfSectionsInTableView:(id)a3
{
  return 2;
}

- (int64_t)tableView:(id)a3 numberOfRowsInSection:(int64_t)a4
{
  if (!a4) {
    return 1;
  }
  if (a4 == 1) {
    return [(NSArray *)self->_runs count];
  }
  return 0;
}

- (id)tableView:(id)a3 cellForRowAtIndexPath:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = [v7 section];
  if (v8 == (id)1)
  {
    id v10 = [v6 dequeueReusableCellWithIdentifier:@"basic"];
    if (!v10) {
      id v10 = [objc_alloc((Class)UITableViewCell) initWithStyle:3 reuseIdentifier:@"basic"];
    }
    [v10 setSelectionStyle:3];
    -[NSArray objectAtIndexedSubscript:](self->_runs, "objectAtIndexedSubscript:", [v7 row]);
    id v9 = (id)objc_claimAutoreleasedReturnValue();
    dateFormatter = self->_dateFormatter;
    v12 = [v9 startDate];
    v13 = [(NSDateFormatter *)dateFormatter stringFromDate:v12];
    v14 = [v10 textLabel];
    [v14 setText:v13];

    v15 = sub_1004F0174([v9 totalTiles], [v9 successCount], [v9 failureCount], 1);
    [v10 setAccessoryView:v15];

    v16 = [v9 endDate];
    v17 = [v9 startDate];
    [v16 timeIntervalSinceDate:v17];
    double v19 = v18;

    id v20 = objc_alloc((Class)NSMeasurement);
    v21 = +[NSUnitDuration baseUnit];
    id v22 = [v20 initWithDoubleValue:v21 unit:v19];

    v23 = [(NSMeasurementFormatter *)self->_durationFormatter stringFromMeasurement:v22];
    v24 = [v10 detailTextLabel];
    [v24 setText:v23];
  }
  else
  {
    if (v8)
    {
      id v10 = 0;
      goto LABEL_11;
    }
    id v9 = [objc_alloc((Class)UITableViewCell) initWithStyle:0 reuseIdentifier:0];
    if ([v7 row])
    {
      id v10 = 0;
    }
    else
    {
      v25 = [v9 textLabel];
      [v25 setText:@"Record History"];

      id v26 = objc_alloc_init((Class)UISwitch);
      v27 = +[GEORequestCounter sharedCounter];
      [v26 setOn:[v27 countersEnabled]];

      [v26 addTarget:self action:"_toggleLogging:" forControlEvents:4096];
      [v9 setAccessoryView:v26];
      [v9 setSelectionStyle:0];

      id v9 = v9;
      id v10 = v9;
    }
  }

LABEL_11:

  return v10;
}

- (void)tableView:(id)a3 didSelectRowAtIndexPath:(id)a4
{
  id v10 = a3;
  id v6 = a4;
  if ([v6 section] == (id)1)
  {
    id v7 = -[NSArray objectAtIndexedSubscript:](self->_runs, "objectAtIndexedSubscript:", [v6 row]);
    id v8 = [[_ProactiveTileDownloadDetailViewController alloc] initWithRun:v7];
    id v9 = [(GeoCellDataSaverHistoryTableViewController *)self navigationController];
    [v9 pushViewController:v8 animated:1];
  }
  [v10 deselectRowAtIndexPath:v6 animated:1];
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_durationFormatter, 0);
  objc_storeStrong((id *)&self->_dateFormatter, 0);

  objc_storeStrong((id *)&self->_runs, 0);
}

@end