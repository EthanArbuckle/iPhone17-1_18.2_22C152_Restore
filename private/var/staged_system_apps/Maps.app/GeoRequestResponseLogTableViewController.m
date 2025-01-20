@interface GeoRequestResponseLogTableViewController
- (GeoRequestResponseLogTableViewController)initWithStyle:(int64_t)a3;
- (id)tableView:(id)a3 cellForRowAtIndexPath:(id)a4;
- (id)tableView:(id)a3 titleForHeaderInSection:(int64_t)a4;
- (int64_t)numberOfSectionsInTableView:(id)a3;
- (int64_t)tableView:(id)a3 numberOfRowsInSection:(int64_t)a4;
- (void)_confirmFlushDB;
- (void)_reallyFlushDB;
- (void)_rebuildComplete:(unsigned int)a3 error:(id)a4;
- (void)_rebuildDB;
- (void)_reloadLogsAsync;
- (void)_reloadLogsSync;
- (void)_showDatePickerFrom:(id)a3;
- (void)_showError:(id)a3 forTask:(id)a4;
- (void)_toggleLogging;
- (void)tableView:(id)a3 didSelectRowAtIndexPath:(id)a4;
- (void)valueChangedForGEOConfigKey:(id)a3;
- (void)viewDidDisappear:(BOOL)a3;
- (void)viewWillAppear:(BOOL)a3;
@end

@implementation GeoRequestResponseLogTableViewController

- (GeoRequestResponseLogTableViewController)initWithStyle:(int64_t)a3
{
  v10.receiver = self;
  v10.super_class = (Class)GeoRequestResponseLogTableViewController;
  v3 = [(GeoRequestResponseLogTableViewController *)&v10 initWithStyle:a3];
  if (v3)
  {
    v4 = (NSISO8601DateFormatter *)objc_alloc_init((Class)NSISO8601DateFormatter);
    dateFormatter = v3->_dateFormatter;
    v3->_dateFormatter = v4;

    v6 = +[NSTimeZone localTimeZone];
    [(NSISO8601DateFormatter *)v3->_dateFormatter setTimeZone:v6];

    v7 = (NSByteCountFormatter *)objc_alloc_init((Class)NSByteCountFormatter);
    byteFormatter = v3->_byteFormatter;
    v3->_byteFormatter = v7;

    [(NSByteCountFormatter *)v3->_byteFormatter setAdaptive:1];
    [(NSByteCountFormatter *)v3->_byteFormatter setAllowedUnits:0];
  }
  return v3;
}

- (void)viewWillAppear:(BOOL)a3
{
  v4.receiver = self;
  v4.super_class = (Class)GeoRequestResponseLogTableViewController;
  [(GeoRequestResponseLogTableViewController *)&v4 viewWillAppear:a3];
  self->_isLoggingEnabled = GEOConfigGetBOOL();
  _GEOConfigAddDelegateListenerForKey();
  [(GeoRequestResponseLogTableViewController *)self _reloadLogsAsync];
}

- (void)viewDidDisappear:(BOOL)a3
{
  v6.receiver = self;
  v6.super_class = (Class)GeoRequestResponseLogTableViewController;
  [(GeoRequestResponseLogTableViewController *)&v6 viewDidDisappear:a3];
  GEOConfigRemoveDelegateListenerForAllKeys();
  logPersister = self->_logPersister;
  self->_logPersister = 0;

  logEntries = self->_logEntries;
  self->_logEntries = 0;
}

- (void)_reloadLogsAsync
{
  v3 = dispatch_get_global_queue(25, 0);
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_1003B1AE8;
  block[3] = &unk_1012E5D08;
  block[4] = self;
  dispatch_async(v3, block);
}

- (void)_reloadLogsSync
{
  if (!self->_logPersister)
  {
    v3 = (GEORequestResponsePersister *)[objc_alloc((Class)GEORequestResponsePersister) initWritable:1];
    logPersister = self->_logPersister;
    self->_logPersister = v3;
  }
  v5 = +[NSMutableArray array];
  objc_super v6 = self->_logPersister;
  v12[0] = _NSConcreteStackBlock;
  v12[1] = 3221225472;
  v12[2] = sub_1003B1C3C;
  v12[3] = &unk_1012E7788;
  id v7 = v5;
  id v13 = v7;
  id v8 = [(GEORequestResponsePersister *)v6 enumerateAllEntriesWithBlock:v12];
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_1003B1C60;
  block[3] = &unk_1012E5D58;
  block[4] = self;
  id v11 = v7;
  id v9 = v7;
  dispatch_async((dispatch_queue_t)&_dispatch_main_q, block);
}

- (void)valueChangedForGEOConfigKey:(id)a3
{
  self->_isLoggingEnabled = GEOConfigGetBOOL();
  id v4 = [(GeoRequestResponseLogTableViewController *)self tableView];
  [v4 reloadData];
}

- (void)_toggleLogging
{
  GEOConfigSetBOOL();
  v3 = [(GeoRequestResponseLogTableViewController *)self tableView];
  id v4 = +[NSIndexPath indexPathForRow:1 inSection:0];
  objc_super v6 = v4;
  v5 = +[NSArray arrayWithObjects:&v6 count:1];
  [v3 reloadRowsAtIndexPaths:v5 withRowAnimation:100];
}

- (void)_rebuildDB
{
  +[UIAlertController alertControllerWithTitle:@"Rebuilding DB" message:@"This might take a minute..." preferredStyle:0];
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472;
  v4[2] = sub_1003B1EE0;
  v4[3] = &unk_1012E5D58;
  v4[4] = self;
  id v5 = (id)objc_claimAutoreleasedReturnValue();
  id v3 = v5;
  [(GeoRequestResponseLogTableViewController *)self presentViewController:v3 animated:1 completion:v4];
}

- (void)_rebuildComplete:(unsigned int)a3 error:(id)a4
{
  uint64_t v4 = *(void *)&a3;
  id v6 = a4;
  id v10 = v6;
  if (v6)
  {
    [(GeoRequestResponseLogTableViewController *)self _showError:v6 forTask:@"Rebuilding DB"];
  }
  else
  {
    if (v4)
    {
      id v7 = +[NSString stringWithFormat:@"Restored %u log messages", v4];
    }
    else
    {
      id v7 = @"No missing logs found";
    }
    id v8 = +[UIAlertController alertControllerWithTitle:@"Complete" message:v7 preferredStyle:0];
    id v9 = +[UIAlertAction actionWithTitle:@"Ok" style:0 handler:0];
    [v8 addAction:v9];

    [(GeoRequestResponseLogTableViewController *)self presentViewController:v8 animated:1 completion:0];
  }
}

- (void)_confirmFlushDB
{
  if ([(NSArray *)self->_logEntries count])
  {
    id v3 = +[UIAlertController alertControllerWithTitle:@"Delete All Logs?" message:@"Are you sure you want to delete ALL the logs?" preferredStyle:0];
    uint64_t v4 = +[UIAlertAction actionWithTitle:@"Cancel" style:1 handler:0];
    [v3 addAction:v4];

    v6[0] = _NSConcreteStackBlock;
    v6[1] = 3221225472;
    v6[2] = sub_1003B2364;
    v6[3] = &unk_1012E6DE0;
    v6[4] = self;
    id v5 = +[UIAlertAction actionWithTitle:@"Delete" style:2 handler:v6];
    [v3 addAction:v5];

    [(GeoRequestResponseLogTableViewController *)self presentViewController:v3 animated:1 completion:0];
  }
}

- (void)_reallyFlushDB
{
  id v3 = [(NSArray *)self->_logEntries lastObject];
  uint64_t v4 = [v3 timestamp];
  id v5 = [v4 dateByAddingTimeInterval:1.0];

  id v6 = dispatch_get_global_queue(25, 0);
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472;
  v8[2] = sub_1003B2458;
  v8[3] = &unk_1012E5D58;
  v8[4] = self;
  id v9 = v5;
  id v7 = v5;
  dispatch_async(v6, v8);
}

- (void)_showError:(id)a3 forTask:(id)a4
{
  id v7 = +[NSString stringWithFormat:@"Received error while %@: %@", a4, a3];
  id v5 = +[UIAlertController alertControllerWithTitle:@"Operation Failed" message:v7 preferredStyle:0];
  id v6 = +[UIAlertAction actionWithTitle:@"Ok" style:0 handler:0];
  [v5 addAction:v6];

  [(GeoRequestResponseLogTableViewController *)self presentViewController:v5 animated:1 completion:0];
}

- (int64_t)numberOfSectionsInTableView:(id)a3
{
  return 2;
}

- (int64_t)tableView:(id)a3 numberOfRowsInSection:(int64_t)a4
{
  id v6 = a3;
  if (a4)
  {
    if (a4 == 1) {
      int64_t v7 = [(NSArray *)self->_logEntries count];
    }
    else {
      int64_t v7 = 0;
    }
  }
  else
  {
    int64_t v7 = 7;
  }

  return v7;
}

- (id)tableView:(id)a3 titleForHeaderInSection:(int64_t)a4
{
  if (a4 == 1) {
    return @"Logs";
  }
  else {
    return 0;
  }
}

- (id)tableView:(id)a3 cellForRowAtIndexPath:(id)a4
{
  id v5 = a4;
  id v6 = [v5 section];
  if (v6 == (id)1)
  {
    id v7 = [objc_alloc((Class)UITableViewCell) initWithStyle:3 reuseIdentifier:0];
    -[NSArray objectAtIndexedSubscript:](self->_logEntries, "objectAtIndexedSubscript:", [v5 row]);
    id v9 = (id)objc_claimAutoreleasedReturnValue();
    id v10 = [v9 messageType];
    switch((int)v10)
    {
      case 1005:
        id v11 = @"GEOPlaceSearchFeedback";
        break;
      case 1006:
      case 1007:
      case 1008:
      case 1011:
      case 1012:
      case 1018:
      case 1019:
      case 1020:
      case 1022:
      case 1023:
LABEL_38:
        id v11 = +[NSString stringWithFormat:@"(unknown: %i)", v10];
        break;
      case 1009:
        id v11 = @"GEORPProblemCollection";
        break;
      case 1010:
        id v11 = @"GEORPProblemStatus";
        break;
      case 1013:
        id v11 = @"GEORPProblemOptIn";
        break;
      case 1014:
        id v11 = @"GEORPProblem";
        break;
      case 1015:
        id v11 = @"GEORPFeedback";
        break;
      case 1016:
        id v11 = @"GEOABAssignment";
        break;
      case 1017:
        id v11 = @"GEOLogCollection";
        break;
      case 1021:
        id v11 = @"GEOSpatialLookupBatch";
        break;
      case 1024:
        id v11 = @"GEOImageService";
        break;
      case 1025:
        id v11 = @"GEOWiFiQualityService";
        break;
      case 1026:
        id v11 = @"GEOTransitRouteUpdate";
        break;
      case 1027:
        id v11 = @"GEOAddressCorrectionTaggedLocation";
        break;
      case 1028:
        id v11 = @"GEOPBOfflineDataKeys";
        break;
      default:
        switch((int)v10)
        {
          case '+':
            id v11 = @"GEOPlaceSearch";
            break;
          case ',':
            id v11 = @"GEODirections";
            break;
          case '-':
          case '/':
          case '3':
          case '7':
          case '8':
          case '9':
          case ';':
            goto LABEL_38;
          case '.':
            id v11 = @"GEOLocationShift";
            break;
          case '0':
            id v11 = @"GEOETATrafficUpdate";
            break;
          case '1':
            id v11 = @"GEOBatchRevGeocode";
            break;
          case '2':
            id v11 = @"GEOPolyLocationShift";
            break;
          case '4':
            id v11 = @"GEOETA";
            break;
          case '5':
            id v11 = @"GEOAddressCorrectionInit";
            break;
          case '6':
            id v11 = @"GEOAddressCorrectionUpdate";
            break;
          case ':':
            id v11 = @"GEOBusinessResolution";
            break;
          case '<':
            id v11 = @"GEOPDPlace";
            break;
          default:
            if (v10) {
              goto LABEL_38;
            }
            id v11 = @"Unknown";
            break;
        }
        break;
    }
    id v36 = [v9 eventType];
    if (v36 >= 3)
    {
      v37 = +[NSString stringWithFormat:@"(unknown: %i)", v36];
    }
    else
    {
      v37 = *(&off_1012E7960 + (int)v36);
    }
    v38 = -[NSByteCountFormatter stringFromByteCount:](self->_byteFormatter, "stringFromByteCount:", [v9 size]);
    v39 = +[NSString stringWithFormat:@"%@ - %@ %@", v11, v37, v38];
    v40 = [v7 textLabel];
    [v40 setText:v39];

    dateFormatter = self->_dateFormatter;
    v42 = [v9 timestamp];
    v43 = [(NSISO8601DateFormatter *)dateFormatter stringFromDate:v42];
    v44 = [v9 appId];
    v45 = +[NSString stringWithFormat:@"%@ - %@", v43, v44];
    v46 = [v7 detailTextLabel];
    [v46 setText:v45];

    [v7 setAccessoryType:1];
  }
  else
  {
    if (v6)
    {
LABEL_5:
      id v7 = 0;
      goto LABEL_70;
    }
    switch((unint64_t)[v5 row])
    {
      case 0uLL:
        id v7 = [objc_alloc((Class)UITableViewCell) initWithStyle:0 reuseIdentifier:0];
        [v7 setSelectionStyle:0];
        id v8 = [v7 textLabel];
        [v8 setText:@"Enable Full Request Response Logging"];

        id v9 = objc_alloc_init((Class)UISwitch);
        [v9 setOn:self->_isLoggingEnabled];
        [v9 addTarget:self action:"_toggleLogging" forControlEvents:4096];
        [v7 setAccessoryView:v9];
        break;
      case 1uLL:
        uint64_t v12 = GEOConfigGetDate();
        id v9 = (id)v12;
        if (self->_isLoggingEnabled)
        {
          if (v12)
          {
            id v13 = [(NSISO8601DateFormatter *)self->_dateFormatter stringFromDate:v12];
          }
          else
          {
            id v13 = @"never";
          }
        }
        else
        {
          id v13 = @"logging is off";
        }
        id v7 = [objc_alloc((Class)UITableViewCell) initWithStyle:0 reuseIdentifier:0];
        [v7 setSelectionStyle:3];
        v47 = +[NSString stringWithFormat:@"Turn off at: %@", v13];
        v48 = [v7 textLabel];
        [v48 setText:v47];

        [v7 setAccessoryType:1];
        goto LABEL_68;
      case 2uLL:
        GEOConfigGetSet();
        id v9 = (id)objc_claimAutoreleasedReturnValue();
        id v7 = [objc_alloc((Class)UITableViewCell) initWithStyle:3 reuseIdentifier:0];
        [v7 setSelectionStyle:3];
        v14 = [v7 textLabel];
        [v14 setText:@"Limit to BundleIds"];

        if ([v9 count])
        {
          v15 = [v9 allObjects];
          v16 = [v15 componentsJoinedByString:@","];
          v17 = [v7 detailTextLabel];
          [v17 setText:v16];
        }
        else
        {
          v15 = [v7 detailTextLabel];
          [v15 setText:@"<all>"];
        }

        [v7 setAccessoryType:1];
        break;
      case 3uLL:
        id v7 = [objc_alloc((Class)UITableViewCell) initWithStyle:3 reuseIdentifier:0];
        [v7 setSelectionStyle:3];
        v18 = +[NSString stringWithFormat:@"Entries: %u", [(NSArray *)self->_logEntries count]];
        v19 = [v7 textLabel];
        [v19 setText:v18];

        v20 = [v7 detailTextLabel];
        [v20 setText:@"(tap to refresh)"];

        id v9 = +[UIColor systemBlueColor];
        v21 = [v7 detailTextLabel];
        goto LABEL_37;
      case 4uLL:
        id v7 = [objc_alloc((Class)UITableViewCell) initWithStyle:3 reuseIdentifier:0];
        [v7 setSelectionStyle:0];
        v22 = self->_dateFormatter;
        v23 = [(NSArray *)self->_logEntries firstObject];
        v24 = [v23 timestamp];
        id v9 = [(NSISO8601DateFormatter *)v22 stringFromDate:v24];

        v25 = self->_dateFormatter;
        v26 = [(NSArray *)self->_logEntries lastObject];
        v27 = [v26 timestamp];
        id v13 = [(NSISO8601DateFormatter *)v25 stringFromDate:v27];

        v28 = [v7 textLabel];
        [v28 setText:@"Time Range"];

        if (v9) {
          BOOL v29 = v13 == 0;
        }
        else {
          BOOL v29 = 1;
        }
        if (v29)
        {
          v34 = [v7 detailTextLabel];
          [v34 setText:@"no logs found"];
        }
        else
        {
          v34 = +[NSString stringWithFormat:@"%@ - %@", v9, v13];
          v35 = [v7 detailTextLabel];
          [v35 setText:v34];
        }
        goto LABEL_68;
      case 5uLL:
        id v7 = [objc_alloc((Class)UITableViewCell) initWithStyle:0 reuseIdentifier:0];
        [v7 setSelectionStyle:3];
        v30 = [v7 textLabel];
        [v30 setText:@"Rebuild Database"];

        uint64_t v31 = +[UIColor systemBlueColor];
        goto LABEL_36;
      case 6uLL:
        id v7 = [objc_alloc((Class)UITableViewCell) initWithStyle:0 reuseIdentifier:0];
        if ([(NSArray *)self->_logEntries count]) {
          uint64_t v32 = 3;
        }
        else {
          uint64_t v32 = 0;
        }
        [v7 setSelectionStyle:v32];
        v33 = [v7 textLabel];
        [v33 setText:@"Delete All Logs"];

        if ([(NSArray *)self->_logEntries count]) {
          +[UIColor systemRedColor];
        }
        else {
        uint64_t v31 = +[UIColor systemGrayColor];
        }
LABEL_36:
        id v9 = (id)v31;
        v21 = [v7 textLabel];
LABEL_37:
        id v13 = v21;
        [(__CFString *)v21 setTextColor:v9];
LABEL_68:

        break;
      default:
        goto LABEL_5;
    }
  }

LABEL_70:

  return v7;
}

- (void)tableView:(id)a3 didSelectRowAtIndexPath:(id)a4
{
  id v12 = a3;
  id v6 = a4;
  id v7 = [v6 section];
  if (v7 == (id)1)
  {
    -[NSArray objectAtIndexedSubscript:](self->_logEntries, "objectAtIndexedSubscript:", [v6 row]);
    id v8 = (GeoRequestResponseLogBundleIdTableViewController *)objc_claimAutoreleasedReturnValue();
    id v9 = [[GeoRequestResponseLogDetailViewController alloc] initWithEvent:v8];
    id v10 = [(GeoRequestResponseLogTableViewController *)self navigationController];
    [v10 pushViewController:v9 animated:1];

LABEL_6:
  }
  else if (!v7)
  {
    switch((unint64_t)[v6 row])
    {
      case 1uLL:
        [(GeoRequestResponseLogTableViewController *)self _showDatePickerFrom:v6];
        break;
      case 2uLL:
        id v8 = objc_alloc_init(GeoRequestResponseLogBundleIdTableViewController);
        id v11 = [(GeoRequestResponseLogTableViewController *)self navigationController];
        [v11 pushViewController:v8 animated:1];

        goto LABEL_6;
      case 3uLL:
        [(GeoRequestResponseLogTableViewController *)self _reloadLogsAsync];
        break;
      case 5uLL:
        [(GeoRequestResponseLogTableViewController *)self _rebuildDB];
        goto LABEL_11;
      case 6uLL:
        [(GeoRequestResponseLogTableViewController *)self _confirmFlushDB];
LABEL_11:
        [v12 deselectRowAtIndexPath:v6 animated:1];
        break;
      default:
        break;
    }
  }
}

- (void)_showDatePickerFrom:(id)a3
{
  id v4 = a3;
  id v5 = [(GeoRequestResponseLogTableViewController *)self tableView];
  id v6 = [v5 cellForRowAtIndexPath:v4];

  id v7 = [(GeoRequestResponseLogTableViewController *)self title];
  id v8 = +[UIAlertController alertControllerWithTitle:v7 message:0 preferredStyle:0];

  id v9 = objc_alloc_init(GeoRequestResponseLogDatePickerViewController);
  id v10 = GEOConfigGetDate();
  id v11 = [(GeoRequestResponseLogDatePickerViewController *)v9 datePicker];
  [v11 setDate:v10];

  [v8 setContentViewController:v9];
  v25[0] = _NSConcreteStackBlock;
  v25[1] = 3221225472;
  v25[2] = sub_1003B34F8;
  v25[3] = &unk_1012E7800;
  id v12 = v9;
  v26 = v12;
  v27 = self;
  id v13 = v4;
  id v28 = v13;
  v14 = +[UIAlertAction actionWithTitle:@"Ok" style:0 handler:v25];
  [v8 addAction:v14];

  v15 = +[UIAlertAction actionWithTitle:@"Cancel" style:1 handler:0];
  [v8 addAction:v15];

  v16 = [v8 popoverPresentationController];
  v17 = [v6 contentView];
  [v17 bounds];
  [v16 setSourceRect:];

  v18 = [v6 contentView];
  [v16 setSourceView:v18];

  id v19 = v6;
  v20 = v19;
  if (v19)
  {
    v21 = v19;
    do
    {
      v22 = v21;
      v23 = +[UIViewController viewControllerForView:v21];
      v21 = [v21 superview];

      if (v23) {
        BOOL v24 = 1;
      }
      else {
        BOOL v24 = v21 == 0;
      }
    }
    while (!v24);
  }
  else
  {
    v23 = 0;
  }
  [v23 presentViewController:v8 animated:1 completion:0];
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_byteFormatter, 0);
  objc_storeStrong((id *)&self->_dateFormatter, 0);
  objc_storeStrong((id *)&self->_logPersister, 0);

  objc_storeStrong((id *)&self->_logEntries, 0);
}

@end