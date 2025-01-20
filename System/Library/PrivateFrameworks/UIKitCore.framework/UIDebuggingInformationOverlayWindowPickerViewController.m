@interface UIDebuggingInformationOverlayWindowPickerViewController
- (NSArray)windows;
- (UIDebuggingInformationOverlayWindowPickerViewController)initWithNibName:(id)a3 bundle:(id)a4;
- (UITableView)tableView;
- (id)tableView:(id)a3 cellForRowAtIndexPath:(id)a4;
- (int64_t)tableView:(id)a3 numberOfRowsInSection:(int64_t)a4;
- (void)loadData;
- (void)setTableView:(id)a3;
- (void)setWindows:(id)a3;
- (void)tableView:(id)a3 didSelectRowAtIndexPath:(id)a4;
- (void)viewDidLoad;
@end

@implementation UIDebuggingInformationOverlayWindowPickerViewController

- (UIDebuggingInformationOverlayWindowPickerViewController)initWithNibName:(id)a3 bundle:(id)a4
{
  v10.receiver = self;
  v10.super_class = (Class)UIDebuggingInformationOverlayWindowPickerViewController;
  v4 = [(UIViewController *)&v10 initWithNibName:a3 bundle:a4];
  v5 = v4;
  if (v4)
  {
    [(UIViewController *)v4 setTitle:@"Current Window"];
    v6 = [UITableView alloc];
    v7 = -[UITableView initWithFrame:style:](v6, "initWithFrame:style:", 0, *MEMORY[0x1E4F1DB28], *(double *)(MEMORY[0x1E4F1DB28] + 8), *(double *)(MEMORY[0x1E4F1DB28] + 16), *(double *)(MEMORY[0x1E4F1DB28] + 24));
    [(UITableView *)v7 setDataSource:v5];
    [(UITableView *)v7 setDelegate:v5];
    [(UITableView *)v7 setRowHeight:-1.0];
    tableView = v5->_tableView;
    v5->_tableView = v7;
  }
  return v5;
}

- (void)viewDidLoad
{
  v12.receiver = self;
  v12.super_class = (Class)UIDebuggingInformationOverlayWindowPickerViewController;
  [(UIViewController *)&v12 viewDidLoad];
  v3 = +[UIColor whiteColor];
  v4 = [(UIViewController *)self view];
  [v4 setBackgroundColor:v3];

  v5 = [(UIViewController *)self view];
  [v5 setAutoresizingMask:18];

  v6 = [(UIDebuggingInformationOverlayWindowPickerViewController *)self tableView];
  [v6 setAutoresizingMask:18];

  v7 = [(UIDebuggingInformationOverlayWindowPickerViewController *)self tableView];
  v8 = [(UIViewController *)self view];
  [v8 bounds];
  objc_msgSend(v7, "setFrame:");

  v9 = [(UIViewController *)self view];
  objc_super v10 = [(UIDebuggingInformationOverlayWindowPickerViewController *)self tableView];
  [v9 addSubview:v10];

  [(UIDebuggingInformationOverlayWindowPickerViewController *)self loadData];
  v11 = [(UIDebuggingInformationOverlayWindowPickerViewController *)self tableView];
  [v11 reloadData];
}

- (void)loadData
{
  v3 = [(UIViewController *)self view];
  v4 = [v3 window];
  v5 = [v4 screen];
  id v6 = +[UIWindow allWindowsIncludingInternalWindows:1 onlyVisibleWindows:0 forScreen:v5];

  [(UIDebuggingInformationOverlayWindowPickerViewController *)self setWindows:v6];
}

- (void)tableView:(id)a3 didSelectRowAtIndexPath:(id)a4
{
  id v13 = a4;
  v5 = +[UIDebuggingInformationOverlay overlay];
  id v6 = [v5 inspectedWindow];
  v7 = [(UIDebuggingInformationOverlayWindowPickerViewController *)self windows];
  v8 = objc_msgSend(v7, "objectAtIndexedSubscript:", objc_msgSend(v13, "row"));

  if (v6 != v8)
  {
    v9 = [(UIDebuggingInformationOverlayWindowPickerViewController *)self windows];
    objc_super v10 = objc_msgSend(v9, "objectAtIndexedSubscript:", objc_msgSend(v13, "row"));
    v11 = +[UIDebuggingInformationOverlay overlay];
    [v11 setInspectedWindow:v10];

    objc_super v12 = [(UIDebuggingInformationOverlayWindowPickerViewController *)self tableView];
    [v12 reloadData];
  }
}

- (id)tableView:(id)a3 cellForRowAtIndexPath:(id)a4
{
  id v5 = a4;
  id v6 = [(UIDebuggingInformationOverlayWindowPickerViewController *)self windows];
  v7 = objc_msgSend(v6, "objectAtIndexedSubscript:", objc_msgSend(v5, "row"));
  v8 = (objc_class *)objc_opt_class();
  v9 = NSStringFromClass(v8);

  objc_super v10 = [[UITableViewCell alloc] initWithStyle:1 reuseIdentifier:@"kCellReuseIdentifierWindows"];
  v11 = [(UITableViewCell *)v10 textLabel];
  [v11 setText:v9];

  objc_super v12 = [(UIDebuggingInformationOverlayWindowPickerViewController *)self windows];
  uint64_t v13 = [v5 row];

  v14 = [v12 objectAtIndexedSubscript:v13];
  v15 = +[UIDebuggingInformationOverlay overlay];
  v16 = [v15 inspectedWindow];

  if (v14 == v16) {
    uint64_t v17 = 3;
  }
  else {
    uint64_t v17 = 0;
  }
  if (v14 == v16) {
    uint64_t v18 = 0;
  }
  else {
    uint64_t v18 = 3;
  }
  [(UITableViewCell *)v10 setAccessoryType:v17];
  [(UITableViewCell *)v10 setSelectionStyle:v18];

  return v10;
}

- (int64_t)tableView:(id)a3 numberOfRowsInSection:(int64_t)a4
{
  v4 = [(UIDebuggingInformationOverlayWindowPickerViewController *)self windows];
  int64_t v5 = [v4 count];

  return v5;
}

- (UITableView)tableView
{
  return self->_tableView;
}

- (void)setTableView:(id)a3
{
}

- (NSArray)windows
{
  return self->_windows;
}

- (void)setWindows:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_windows, 0);
  objc_storeStrong((id *)&self->_tableView, 0);
}

@end