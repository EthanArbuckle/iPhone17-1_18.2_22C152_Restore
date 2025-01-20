@interface _ProactiveTileDownloadDetailViewController
- (_ProactiveTileDownloadDetailViewController)initWithRun:(id)a3;
- (id)tableView:(id)a3 cellForRowAtIndexPath:(id)a4;
- (int64_t)numberOfSectionsInTableView:(id)a3;
- (int64_t)tableView:(id)a3 numberOfRowsInSection:(int64_t)a4;
@end

@implementation _ProactiveTileDownloadDetailViewController

- (_ProactiveTileDownloadDetailViewController)initWithRun:(id)a3
{
  id v4 = a3;
  v18.receiver = self;
  v18.super_class = (Class)_ProactiveTileDownloadDetailViewController;
  v5 = [(_ProactiveTileDownloadDetailViewController *)&v18 initWithStyle:1];
  if (v5)
  {
    uint64_t v6 = [v4 policyStatistics];
    policyStatistics = v5->_policyStatistics;
    v5->_policyStatistics = (NSArray *)v6;

    v8 = (NSDateFormatter *)objc_alloc_init((Class)NSDateFormatter);
    dateFormatter = v5->_dateFormatter;
    v5->_dateFormatter = v8;

    [(NSDateFormatter *)v5->_dateFormatter setDateStyle:1];
    [(NSDateFormatter *)v5->_dateFormatter setTimeStyle:1];
    v10 = (NSMeasurementFormatter *)objc_alloc_init((Class)NSMeasurementFormatter);
    durationFormatter = v5->_durationFormatter;
    v5->_durationFormatter = v10;

    [(NSMeasurementFormatter *)v5->_durationFormatter setUnitOptions:2];
    [(NSMeasurementFormatter *)v5->_durationFormatter setUnitStyle:2];
    v12 = [(NSMeasurementFormatter *)v5->_durationFormatter numberFormatter];
    [v12 setMaximumFractionDigits:0];

    v13 = v5->_dateFormatter;
    v14 = [v4 startDate];
    v15 = [(NSDateFormatter *)v13 stringFromDate:v14];
    [(_ProactiveTileDownloadDetailViewController *)v5 setTitle:v15];

    v16 = v5;
  }

  return v5;
}

- (int64_t)numberOfSectionsInTableView:(id)a3
{
  return 1;
}

- (int64_t)tableView:(id)a3 numberOfRowsInSection:(int64_t)a4
{
  if (a4) {
    return 0;
  }
  else {
    return [(NSArray *)self->_policyStatistics count];
  }
}

- (id)tableView:(id)a3 cellForRowAtIndexPath:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if ([v7 section])
  {
    id v8 = 0;
  }
  else
  {
    id v8 = [v6 dequeueReusableCellWithIdentifier:@"basic"];
    if (!v8) {
      id v8 = [objc_alloc((Class)UITableViewCell) initWithStyle:3 reuseIdentifier:@"basic"];
    }
    [v8 setSelectionStyle:0];
    v9 = -[NSArray objectAtIndexedSubscript:](self->_policyStatistics, "objectAtIndexedSubscript:", [v7 row]);
    unsigned int v10 = [v9 policy] - 1;
    if (v10 > 2) {
      CFStringRef v11 = @"<unknown>";
    }
    else {
      CFStringRef v11 = off_1012ED498[(char)v10];
    }
    v12 = [v8 textLabel];
    [v12 setText:v11];

    v13 = sub_1004F0174([v9 tilesConsidered], [v9 successCount], [v9 failureCount], 0);
    [v8 setAccessoryView:v13];

    v14 = [v9 endTimestamp];
    v15 = [v9 startTimestamp];
    [v14 timeIntervalSinceDate:v15];
    double v17 = v16;

    id v18 = objc_alloc((Class)NSMeasurement);
    v19 = +[NSUnitDuration baseUnit];
    id v20 = [v18 initWithDoubleValue:v19 unit:v17];

    dateFormatter = self->_dateFormatter;
    v22 = [v9 startTimestamp];
    v23 = [(NSDateFormatter *)dateFormatter stringFromDate:v22];
    v24 = [(NSMeasurementFormatter *)self->_durationFormatter stringFromMeasurement:v20];
    v25 = +[NSString stringWithFormat:@"%@ — %@", v23, v24];
    v26 = [v8 detailTextLabel];
    [v26 setText:v25];
  }

  return v8;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_durationFormatter, 0);
  objc_storeStrong((id *)&self->_dateFormatter, 0);

  objc_storeStrong((id *)&self->_policyStatistics, 0);
}

@end