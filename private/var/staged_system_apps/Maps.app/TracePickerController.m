@interface TracePickerController
+ (id)navigationDestinationTitle;
- (NSArray)myFileSheetTracePickerOptions;
- (NSArray)myFiles;
- (NSArray)selectedTracePaths;
- (NSString)selectedTraceFileName;
- (NSString)selectedTraceName;
- (NSString)selectedTracePath;
- (TracePickerController)init;
- (TracePickerController)initWithTraceType:(int64_t)a3 ConfirmHandler:(id)a4;
- (id)tableView:(id)a3 cellForRowAtIndexPath:(id)a4;
- (id)tableView:(id)a3 titleForFooterInSection:(int64_t)a4;
- (id)tableView:(id)a3 titleForHeaderInSection:(int64_t)a4;
- (id)tableView:(id)a3 willSelectRowAtIndexPath:(id)a4;
- (id)tracePathForRow:(unint64_t)a3;
- (id)tracePickerOptionsForTableView:(id)a3 indexPath:(id)a4;
- (int64_t)numberOfSectionsInTableView:(id)a3;
- (int64_t)tableView:(id)a3 numberOfRowsInSection:(int64_t)a4;
- (void)reloadTraces;
- (void)setMyFileSheetTracePickerOptions:(id)a3;
- (void)setMyFiles:(id)a3;
- (void)setSelectedTraceFileName:(id)a3;
- (void)setSelectedTraceName:(id)a3;
- (void)setSelectedTracePath:(id)a3;
- (void)tableView:(id)a3 didSelectRowAtIndexPath:(id)a4;
- (void)updateTracePickerOptions;
- (void)viewDidLoad;
- (void)viewWillAppear:(BOOL)a3;
@end

@implementation TracePickerController

- (TracePickerController)init
{
  v7.receiver = self;
  v7.super_class = (Class)TracePickerController;
  v2 = [(AuxiliaryDebugViewController *)&v7 init];
  if (!v2) {
    return 0;
  }
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472;
  v5[2] = sub_10040B0C0;
  v5[3] = &unk_1012E9618;
  v6 = v2;
  v3 = [(TracePickerController *)v6 initWithTraceType:0 ConfirmHandler:v5];

  return v3;
}

- (TracePickerController)initWithTraceType:(int64_t)a3 ConfirmHandler:(id)a4
{
  self->_type = a3;
  if (a4)
  {
    id v5 = [a4 copy];
    id confirmHandler = self->_confirmHandler;
    self->_id confirmHandler = v5;
  }
  return self;
}

+ (id)navigationDestinationTitle
{
  return @"Select Trace";
}

- (void)viewWillAppear:(BOOL)a3
{
  BOOL v3 = a3;
  [(TracePickerController *)self reloadTraces];
  [(TracePickerController *)self updateTracePickerOptions];
  v5.receiver = self;
  v5.super_class = (Class)TracePickerController;
  [(MapsDebugValuesViewController *)&v5 viewWillAppear:v3];
}

- (void)viewDidLoad
{
  BOOL v3 = [(id)objc_opt_class() navigationDestinationTitle];
  v4 = [(TracePickerController *)self navigationItem];
  [v4 setTitle:v3];

  id v5 = objc_alloc_init((Class)UINavigationBarAppearance);
  [v5 configureWithDefaultBackground];
  v6 = [(TracePickerController *)self navigationItem];
  [v6 setStandardAppearance:v5];

  objc_super v7 = [(TracePickerController *)self navigationItem];
  [v7 setScrollEdgeAppearance:v5];

  v8.receiver = self;
  v8.super_class = (Class)TracePickerController;
  [(MapsDebugValuesViewController *)&v8 viewDidLoad];
}

- (void)reloadTraces
{
  id v5 = +[TraceManager sharedManager];
  BOOL v3 = [v5 listOfUserTracesWithTraceType:self->_type];
  [(TracePickerController *)self setMyFiles:v3];

  v4 = [(TracePickerController *)self tableView];
  [v4 reloadData];
}

- (void)updateTracePickerOptions
{
  id v3 = [objc_alloc((Class)NSMutableArray) initWithCapacity:2];
  [v3 addObject:&off_1013A6F88];
  [v3 addObject:&off_1013A6FA0];
  [(TracePickerController *)self setMyFileSheetTracePickerOptions:v3];
}

- (id)tracePathForRow:(unint64_t)a3
{
  id v5 = +[TraceManager sharedManager];
  v6 = [(NSArray *)self->_myFiles objectAtIndexedSubscript:a3];
  objc_super v7 = [v5 fullPathForTraceFilename:v6 withTraceType:self->_type];

  return v7;
}

- (NSArray)selectedTracePaths
{
  id v3 = objc_alloc_init((Class)NSMutableArray);
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  v4 = [(TracePickerController *)self tableView];
  id v5 = [v4 indexPathsForSelectedRows];

  id v6 = [v5 countByEnumeratingWithState:&v14 objects:v18 count:16];
  if (v6)
  {
    id v7 = v6;
    uint64_t v8 = *(void *)v15;
    do
    {
      for (i = 0; i != v7; i = (char *)i + 1)
      {
        if (*(void *)v15 != v8) {
          objc_enumerationMutation(v5);
        }
        v10 = *(void **)(*((void *)&v14 + 1) + 8 * i);
        id v11 = [v10 row];
        if (![v10 section])
        {
          v12 = [(TracePickerController *)self tracePathForRow:v11];
          [v3 addObject:v12];
        }
      }
      id v7 = [v5 countByEnumeratingWithState:&v14 objects:v18 count:16];
    }
    while (v7);
  }

  return (NSArray *)v3;
}

- (int64_t)numberOfSectionsInTableView:(id)a3
{
  return 1;
}

- (int64_t)tableView:(id)a3 numberOfRowsInSection:(int64_t)a4
{
  if (a4) {
    int64_t result = 0;
  }
  else {
    int64_t result = [(NSArray *)self->_myFiles count];
  }
  if ((unint64_t)result <= 1) {
    return 1;
  }
  return result;
}

- (id)tableView:(id)a3 cellForRowAtIndexPath:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = [v7 row];
  if ([v7 section]) {
    NSUInteger v9 = 0;
  }
  else {
    NSUInteger v9 = [(NSArray *)self->_myFiles count];
  }
  id v10 = [v6 dequeueReusableCellWithIdentifier:@"TraceFile"];
  if (v10)
  {
    if (v9)
    {
LABEL_6:
      if ([v7 section])
      {
        id v11 = 0;
      }
      else
      {
        id v11 = [(NSArray *)self->_myFiles objectAtIndexedSubscript:v8];
      }
      long long v16 = +[TraceManager sharedManager];
      long long v17 = [v16 displayNameForTraceName:v11];
      v18 = [v10 textLabel];
      [v18 setText:v17];

      v19 = +[UIColor labelColor];
      v20 = [v10 textLabel];
      [v20 setTextColor:v19];

      v21 = [v10 textLabel];
      [v21 setAdjustsFontSizeToFitWidth:1];

      [v10 setSelectionStyle:1];
      goto LABEL_12;
    }
  }
  else
  {
    id v10 = [objc_alloc((Class)UITableViewCell) initWithStyle:0 reuseIdentifier:@"TraceFile"];
    if (v9) {
      goto LABEL_6;
    }
  }
  v12 = [v10 textLabel];
  [v12 setText:@"No traces"];

  v13 = +[UIColor secondaryLabelColor];
  long long v14 = [v10 textLabel];
  [v14 setTextColor:v13];

  long long v15 = [v10 textLabel];
  [v15 setAdjustsFontSizeToFitWidth:0];

  [v10 setSelectionStyle:0];
LABEL_12:

  return v10;
}

- (id)tableView:(id)a3 willSelectRowAtIndexPath:(id)a4
{
  id v5 = a4;
  if ([v5 section])
  {
    id v6 = 0;
  }
  else if ([(NSArray *)self->_myFiles count])
  {
    id v6 = v5;
  }
  else
  {
    id v6 = 0;
  }
  id v7 = v6;

  return v7;
}

- (id)tracePickerOptionsForTableView:(id)a3 indexPath:(id)a4
{
  id v15 = a4;
  id v5 = +[UIAlertController alertControllerWithTitle:self->_selectedTraceName message:0 preferredStyle:0];
  long long v19 = 0u;
  long long v20 = 0u;
  long long v21 = 0u;
  long long v22 = 0u;
  id v6 = [(TracePickerController *)self myFileSheetTracePickerOptions];
  id v7 = [v6 countByEnumeratingWithState:&v19 objects:v23 count:16];
  if (v7)
  {
    id v8 = v7;
    uint64_t v9 = *(void *)v20;
    do
    {
      for (i = 0; i != v8; i = (char *)i + 1)
      {
        if (*(void *)v20 != v9) {
          objc_enumerationMutation(v6);
        }
        id v11 = [*(id *)(*((void *)&v19 + 1) + 8 * i) integerValue];
        if (v11)
        {
          if (v11 != (id)1) {
            continue;
          }
          v18[0] = _NSConcreteStackBlock;
          v18[1] = 3221225472;
          v18[2] = sub_10040BAB0;
          v18[3] = &unk_1012E6DE0;
          v18[4] = self;
          v12 = +[UIAlertAction actionWithTitle:@"Confirm" style:0 handler:v18];
          [v5 addAction:v12];
        }
        else
        {
          v16[0] = _NSConcreteStackBlock;
          v16[1] = 3221225472;
          v16[2] = sub_10040BB34;
          v16[3] = &unk_1012E9640;
          v16[4] = self;
          id v17 = v15;
          v13 = +[UIAlertAction actionWithTitle:@"Cancel" style:1 handler:v16];
          [v5 addAction:v13];

          v12 = v17;
        }
      }
      id v8 = [v6 countByEnumeratingWithState:&v19 objects:v23 count:16];
    }
    while (v8);
  }

  return v5;
}

- (void)tableView:(id)a3 didSelectRowAtIndexPath:(id)a4
{
  id v26 = a3;
  id v6 = a4;
  id v7 = +[TraceManager sharedManager];
  id v8 = [v6 row];
  if (![v6 section])
  {
    uint64_t v9 = [(NSArray *)self->_myFiles objectAtIndexedSubscript:v8];
    [(TracePickerController *)self setSelectedTraceFileName:v9];

    id v10 = [v7 displayNameForTraceName:self->_selectedTraceFileName];
    [(TracePickerController *)self setSelectedTraceName:v10];

    id v11 = [v7 fullPathForTraceFilename:self->_selectedTraceFileName withTraceType:self->_type];
    [(TracePickerController *)self setSelectedTracePath:v11];
  }
  v12 = [(TracePickerController *)self tableView];
  unsigned __int8 v13 = [v12 isEditing];

  if ((v13 & 1) == 0)
  {
    long long v14 = [(TracePickerController *)self tracePickerOptionsForTableView:v26 indexPath:v6];
    id v15 = [v26 cellForRowAtIndexPath:v6];
    long long v16 = [v14 popoverPresentationController];
    [v16 setSourceView:v15];

    [v15 bounds];
    double v18 = v17;
    double v20 = v19;
    double v22 = v21;
    double v24 = v23;
    v25 = [v14 popoverPresentationController];
    [v25 setSourceRect:v18, v20, v22, v24];

    [(TracePickerController *)self presentViewController:v14 animated:1 completion:0];
  }
}

- (id)tableView:(id)a3 titleForHeaderInSection:(int64_t)a4
{
  return 0;
}

- (id)tableView:(id)a3 titleForFooterInSection:(int64_t)a4
{
  uint64_t v4 = +[TraceManager sharedManager];
  id v5 = [v4 tracesDirectoryWithTraceType:0 resolveSymlink:1];

  id v6 = +[NSString stringWithFormat:@"Directory: %@", v5];

  return v6;
}

- (NSArray)myFileSheetTracePickerOptions
{
  return self->_myFileSheetTrackPickerOptions;
}

- (void)setMyFileSheetTracePickerOptions:(id)a3
{
}

- (NSArray)myFiles
{
  return self->_myFiles;
}

- (void)setMyFiles:(id)a3
{
}

- (NSString)selectedTracePath
{
  return self->_selectedTracePath;
}

- (void)setSelectedTracePath:(id)a3
{
}

- (NSString)selectedTraceName
{
  return self->_selectedTraceName;
}

- (void)setSelectedTraceName:(id)a3
{
}

- (NSString)selectedTraceFileName
{
  return self->_selectedTraceFileName;
}

- (void)setSelectedTraceFileName:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_confirmHandler, 0);
  objc_storeStrong((id *)&self->_selectedTraceFileName, 0);
  objc_storeStrong((id *)&self->_selectedTraceName, 0);
  objc_storeStrong((id *)&self->_selectedTracePath, 0);
  objc_storeStrong((id *)&self->_myFiles, 0);

  objc_storeStrong((id *)&self->_myFileSheetTrackPickerOptions, 0);
}

@end