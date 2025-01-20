@interface NavSettingsTracePickerController
+ (Class)_mfMailComposeViewController;
+ (id)navigationDestinationTitle;
- (BOOL)tableView:(id)a3 canEditRowAtIndexPath:(id)a4;
- (NavSettingsTracePickerController)init;
- (id)tracePickerOptionsForTableView:(id)a3 indexPath:(id)a4;
- (void)_showDeleteFileSheet;
- (void)_showDeleteFileSheetForDeleteAll;
- (void)_showDeleteFileSheetForTraceNames:(id)a3;
- (void)mailComposeController:(id)a3 didFinishWithResult:(int64_t)a4 error:(id)a5;
- (void)setEditing:(BOOL)a3 animated:(BOOL)a4;
- (void)tableView:(id)a3 commitEditingStyle:(int64_t)a4 forRowAtIndexPath:(id)a5;
- (void)updateTracePickerOptions;
- (void)viewWillAppear:(BOOL)a3;
- (void)viewWillDisappear:(BOOL)a3;
@end

@implementation NavSettingsTracePickerController

+ (id)navigationDestinationTitle
{
  return @"Play Trace";
}

+ (Class)_mfMailComposeViewController
{
  if (qword_10160F860 != -1) {
    dispatch_once(&qword_10160F860, &stru_1012F7E88);
  }
  v2 = (void *)qword_10160F858;

  return (Class)v2;
}

- (NavSettingsTracePickerController)init
{
  v8.receiver = self;
  v8.super_class = (Class)NavSettingsTracePickerController;
  v2 = [(TracePickerController *)&v8 init];
  v3 = v2;
  if (v2)
  {
    v4 = [(NavSettingsTracePickerController *)v2 tableView];
    [v4 setAllowsMultipleSelectionDuringEditing:1];

    v5 = [(NavSettingsTracePickerController *)v3 editButtonItem];
    v6 = [(NavSettingsTracePickerController *)v3 navigationItem];
    [v6 setRightBarButtonItem:v5];
  }
  return v3;
}

- (void)updateTracePickerOptions
{
  id v5 = [objc_alloc((Class)NSMutableArray) initWithCapacity:5];
  v3 = +[UIApplication sharedMapsDelegate];
  unsigned int v4 = [v3 canPlayTrace];

  if (v4) {
    [v5 addObject:&off_1013A8998];
  }
  [v5 addObject:&off_1013A89B0];
  [v5 addObject:&off_1013A89C8];
  [v5 addObject:&off_1013A89E0];
  [(TracePickerController *)self setMyFileSheetTracePickerOptions:v5];
}

- (void)viewWillAppear:(BOOL)a3
{
  v25.receiver = self;
  v25.super_class = (Class)NavSettingsTracePickerController;
  [(TracePickerController *)&v25 viewWillAppear:a3];
  id v4 = objc_alloc((Class)UIToolbar);
  id v5 = [(NavSettingsTracePickerController *)self navigationController];
  v6 = [v5 view];
  [v6 frame];
  double MaxY = CGRectGetMaxY(v27);
  objc_super v8 = [(NavSettingsTracePickerController *)self navigationController];
  v9 = [v8 view];
  [v9 frame];
  double v10 = MaxY - CGRectGetMinY(v28) + -44.0;
  v11 = [(NavSettingsTracePickerController *)self tableView];
  [v11 frame];
  v12 = [v4 initWithFrame:0.0, v10];
  toolbar = self->_toolbar;
  self->_toolbar = v12;

  v14 = (UIBarButtonItem *)[objc_alloc((Class)UIBarButtonItem) initWithTitle:@"Delete All" style:0 target:self action:"_showDeleteFileSheetForDeleteAll"];
  deleteAllButtonItem = self->_deleteAllButtonItem;
  self->_deleteAllButtonItem = v14;

  v16 = (UIBarButtonItem *)[objc_alloc((Class)UIBarButtonItem) initWithBarButtonSystemItem:16 target:self action:"_showDeleteFileSheet"];
  deleteButtonItem = self->_deleteButtonItem;
  self->_deleteButtonItem = v16;

  id v18 = [objc_alloc((Class)UIBarButtonItem) initWithBarButtonSystemItem:5 target:0 action:0];
  v19 = self->_deleteAllButtonItem;
  v26[0] = v18;
  v26[1] = v19;
  id v20 = [objc_alloc((Class)UIBarButtonItem) initWithBarButtonSystemItem:5 target:0 action:0];
  v21 = self->_deleteButtonItem;
  v26[2] = v20;
  v26[3] = v21;
  v22 = +[NSArray arrayWithObjects:v26 count:4];

  [(UIToolbar *)self->_toolbar setItems:v22];
  v23 = [(NavSettingsTracePickerController *)self navigationController];
  v24 = [v23 view];
  [v24 addSubview:self->_toolbar];

  [(UIToolbar *)self->_toolbar setHidden:[(NavSettingsTracePickerController *)self isEditing] ^ 1];
}

- (void)viewWillDisappear:(BOOL)a3
{
  v5.receiver = self;
  v5.super_class = (Class)NavSettingsTracePickerController;
  [(NavSettingsTracePickerController *)&v5 viewWillDisappear:a3];
  [(UIToolbar *)self->_toolbar removeFromSuperview];
  toolbar = self->_toolbar;
  self->_toolbar = 0;
}

- (void)setEditing:(BOOL)a3 animated:(BOOL)a4
{
  BOOL v4 = a4;
  BOOL v5 = a3;
  v8.receiver = self;
  v8.super_class = (Class)NavSettingsTracePickerController;
  -[NavSettingsTracePickerController setEditing:animated:](&v8, "setEditing:animated:");
  v7 = [(NavSettingsTracePickerController *)self tableView];
  [v7 setEditing:v5 animated:v4];

  [(UIToolbar *)self->_toolbar setHidden:[(NavSettingsTracePickerController *)self isEditing] ^ 1];
}

- (id)tracePickerOptionsForTableView:(id)a3 indexPath:(id)a4
{
  id v5 = a4;
  v6 = +[UIAlertController alertControllerWithTitle:self->super._selectedTraceName message:0 preferredStyle:0];
  long long v26 = 0u;
  long long v27 = 0u;
  long long v28 = 0u;
  long long v29 = 0u;
  v7 = [(TracePickerController *)self myFileSheetTracePickerOptions];
  id v8 = [v7 countByEnumeratingWithState:&v26 objects:v30 count:16];
  if (!v8)
  {

LABEL_17:
    v15 = +[GEOCountryConfiguration sharedConfiguration];
    unsigned int v16 = [v15 currentCountrySupportsNavigation];

    if (v16) {
      CFStringRef v17 = @"This device is already providing navigation. End the navigation to play this trace.";
    }
    else {
      CFStringRef v17 = @"This device does not support navigation.";
    }
    [v6 setMessage:v17];
    goto LABEL_21;
  }
  id v9 = v8;
  char v19 = 0;
  uint64_t v10 = *(void *)v27;
  do
  {
    for (i = 0; i != v9; i = (char *)i + 1)
    {
      if (*(void *)v27 != v10) {
        objc_enumerationMutation(v7);
      }
      switch((unint64_t)[*(id *)(*((void *)&v26 + 1) + 8 * i) integerValue])
      {
        case 0uLL:
          v25[0] = _NSConcreteStackBlock;
          v25[1] = 3221225472;
          v25[2] = sub_100772474;
          v25[3] = &unk_1012E6DE0;
          v25[4] = self;
          v12 = +[UIAlertAction actionWithTitle:@"Play" style:0 handler:v25];
          [v6 addAction:v12];
          char v19 = 1;
          goto LABEL_11;
        case 2uLL:
          v23[0] = _NSConcreteStackBlock;
          v23[1] = 3221225472;
          v23[2] = sub_1007724D8;
          v23[3] = &unk_1012E9640;
          v23[4] = self;
          id v24 = v5;
          v14 = +[UIAlertAction actionWithTitle:@"Share" style:0 handler:v23];
          [v6 addAction:v14];

          v12 = v24;
          goto LABEL_11;
        case 3uLL:
          v20[0] = _NSConcreteStackBlock;
          v20[1] = 3221225472;
          v20[2] = sub_1007727DC;
          v20[3] = &unk_1012E9640;
          v20[4] = self;
          id v21 = v5;
          v13 = +[UIAlertAction actionWithTitle:@"Cancel" style:1 handler:v20];
          [v6 addAction:v13];

          v12 = v21;
          goto LABEL_11;
        case 4uLL:
          v22[0] = _NSConcreteStackBlock;
          v22[1] = 3221225472;
          v22[2] = sub_1007727D4;
          v22[3] = &unk_1012E6DE0;
          v22[4] = self;
          v12 = +[UIAlertAction actionWithTitle:@"Delete" style:2 handler:v22];
          [v6 addAction:v12];
LABEL_11:

          break;
        default:
          continue;
      }
    }
    id v9 = [v7 countByEnumeratingWithState:&v26 objects:v30 count:16];
  }
  while (v9);

  if ((v19 & 1) == 0) {
    goto LABEL_17;
  }
LABEL_21:

  return v6;
}

- (void)_showDeleteFileSheet
{
  id v3 = [(TracePickerController *)self selectedTracePaths];
  [(NavSettingsTracePickerController *)self _showDeleteFileSheetForTraceNames:v3];
}

- (void)_showDeleteFileSheetForDeleteAll
{
  id v9 = objc_alloc_init((Class)NSMutableArray);
  id v3 = [(NavSettingsTracePickerController *)self tableView];
  id v4 = [v3 numberOfRowsInSection:0];

  if (v4)
  {
    unint64_t v5 = 0;
    do
    {
      v6 = [(TracePickerController *)self tracePathForRow:v5];
      [v9 addObject:v6];

      ++v5;
      v7 = [(NavSettingsTracePickerController *)self tableView];
      id v8 = [v7 numberOfRowsInSection:0];
    }
    while (v5 < (unint64_t)v8);
  }
  [(NavSettingsTracePickerController *)self _showDeleteFileSheetForTraceNames:v9];
}

- (void)_showDeleteFileSheetForTraceNames:(id)a3
{
  id v4 = a3;
  if ([v4 count])
  {
    if ((unint64_t)[v4 count] <= 1) {
      [(TracePickerController *)self selectedTraceName];
    }
    else {
    unint64_t v5 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", @"Delete %d Items?", [v4 count]);
    }
    v6 = +[UIAlertController alertControllerWithTitle:v5 message:0 preferredStyle:0];
    v7 = [(NavSettingsTracePickerController *)self tableView];
    id v8 = [v7 indexPathForSelectedRow];

    v27[0] = _NSConcreteStackBlock;
    v27[1] = 3221225472;
    v27[2] = sub_100772C1C;
    v27[3] = &unk_1012E7800;
    v27[4] = self;
    id v9 = v8;
    id v28 = v9;
    id v29 = v4;
    uint64_t v10 = +[UIAlertAction actionWithTitle:@"Delete" style:2 handler:v27];
    [v6 addAction:v10];

    v25[0] = _NSConcreteStackBlock;
    v25[1] = 3221225472;
    v25[2] = sub_100772D60;
    v25[3] = &unk_1012E9640;
    v25[4] = self;
    id v26 = v9;
    id v11 = v9;
    v12 = +[UIAlertAction actionWithTitle:@"Cancel" style:1 handler:v25];
    [v6 addAction:v12];

    v13 = [(NavSettingsTracePickerController *)self tableView];
    v14 = [v13 cellForRowAtIndexPath:v11];

    v15 = [v6 popoverPresentationController];
    [v15 setSourceView:v14];

    [v14 bounds];
    double v17 = v16;
    double v19 = v18;
    double v21 = v20;
    double v23 = v22;
    id v24 = [v6 popoverPresentationController];
    [v24 setSourceRect:v17, v19, v21, v23];

    [(NavSettingsTracePickerController *)self presentViewController:v6 animated:1 completion:0];
  }
}

- (void)mailComposeController:(id)a3 didFinishWithResult:(int64_t)a4 error:(id)a5
{
  if (a5)
  {
    v6 = [a5 description:a3, a4];
    NSLog(@"@@@@ mail error: %@", v6);
  }
  [(NavSettingsTracePickerController *)self dismissViewControllerAnimated:1 completion:0];
  id v9 = [(NavSettingsTracePickerController *)self view];
  v7 = [(NavSettingsTracePickerController *)self view];
  id v8 = [v7 indexPathForSelectedRow];
  [v9 deselectRowAtIndexPath:v8 animated:1];
}

- (BOOL)tableView:(id)a3 canEditRowAtIndexPath:(id)a4
{
  return 1;
}

- (void)tableView:(id)a3 commitEditingStyle:(int64_t)a4 forRowAtIndexPath:(id)a5
{
  if (a4 == 1)
  {
    v6 = -[TracePickerController tracePathForRow:[a5 row]];
    id v8 = v6;
    v7 = +[NSArray arrayWithObjects:&v8 count:1];
    [(NavSettingsTracePickerController *)self _showDeleteFileSheetForTraceNames:v7];
  }
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_deleteAllButtonItem, 0);
  objc_storeStrong((id *)&self->_deleteButtonItem, 0);

  objc_storeStrong((id *)&self->_toolbar, 0);
}

@end