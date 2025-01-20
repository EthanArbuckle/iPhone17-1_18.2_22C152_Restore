@interface UIDebuggingInformationVCHierarchyViewController
- (NSArray)data;
- (UIDebuggingInformationVCHierarchyViewController)initWithNibName:(id)a3 bundle:(id)a4;
- (UITableView)tableView;
- (id)getViewControllersRecursiveWithLevel:(int)a3 forView:(id)a4;
- (id)tableView:(id)a3 cellForRowAtIndexPath:(id)a4;
- (int64_t)tableView:(id)a3 indentationLevelForRowAtIndexPath:(id)a4;
- (int64_t)tableView:(id)a3 numberOfRowsInSection:(int64_t)a4;
- (void)setData:(id)a3;
- (void)setTableView:(id)a3;
- (void)tableView:(id)a3 didSelectRowAtIndexPath:(id)a4;
- (void)viewDidLoad;
- (void)viewWillAppear:(BOOL)a3;
@end

@implementation UIDebuggingInformationVCHierarchyViewController

- (UIDebuggingInformationVCHierarchyViewController)initWithNibName:(id)a3 bundle:(id)a4
{
  v8.receiver = self;
  v8.super_class = (Class)UIDebuggingInformationVCHierarchyViewController;
  v4 = [(UIViewController *)&v8 initWithNibName:a3 bundle:a4];
  if (v4)
  {
    v5 = [UITableView alloc];
    v6 = -[UITableView initWithFrame:style:](v5, "initWithFrame:style:", 0, *MEMORY[0x1E4F1DB28], *(double *)(MEMORY[0x1E4F1DB28] + 8), *(double *)(MEMORY[0x1E4F1DB28] + 16), *(double *)(MEMORY[0x1E4F1DB28] + 24));
    [(UITableView *)v6 setDataSource:v4];
    [(UITableView *)v6 setDelegate:v4];
    [(UITableView *)v6 setRowHeight:-1.0];
    [(UIDebuggingInformationVCHierarchyViewController *)v4 setTableView:v6];
  }
  return v4;
}

- (void)viewDidLoad
{
  v11.receiver = self;
  v11.super_class = (Class)UIDebuggingInformationVCHierarchyViewController;
  [(UIViewController *)&v11 viewDidLoad];
  v3 = [(UIViewController *)self view];
  [v3 setAutoresizingMask:18];

  v4 = [(UIDebuggingInformationVCHierarchyViewController *)self tableView];
  [v4 setAutoresizingMask:18];

  v5 = [(UIViewController *)self view];
  v6 = [(UIDebuggingInformationVCHierarchyViewController *)self tableView];
  [v5 addSubview:v6];

  v7 = [(UIDebuggingInformationVCHierarchyViewController *)self tableView];
  objc_super v8 = [(UIViewController *)self view];
  [v8 bounds];
  objc_msgSend(v7, "setFrame:");

  v9 = [(UIViewController *)self view];
  v10 = +[UIColor whiteColor];
  [v9 setBackgroundColor:v10];
}

- (void)viewWillAppear:(BOOL)a3
{
  v9.receiver = self;
  v9.super_class = (Class)UIDebuggingInformationVCHierarchyViewController;
  [(UIViewController *)&v9 viewWillAppear:a3];
  v4 = +[UIDebuggingInformationOverlay overlay];
  v5 = [v4 inspectedWindow];
  v6 = [v5 rootViewController];
  v7 = [(UIDebuggingInformationVCHierarchyViewController *)self getViewControllersRecursiveWithLevel:0 forView:v6];
  [(UIDebuggingInformationVCHierarchyViewController *)self setData:v7];

  objc_super v8 = [(UIDebuggingInformationVCHierarchyViewController *)self tableView];
  [v8 reloadData];
}

- (id)getViewControllersRecursiveWithLevel:(int)a3 forView:(id)a4
{
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  id v6 = a4;
  v7 = [[UIDebuggingInformationVCHierarchyDataContainer alloc] initWithViewController:v6 atLevel:a3];
  objc_super v8 = objc_msgSend(MEMORY[0x1E4F1CA48], "arrayWithObjects:", v7, 0);
  long long v18 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  long long v21 = 0u;
  objc_super v9 = [v6 childViewControllers];
  uint64_t v10 = [v9 countByEnumeratingWithState:&v18 objects:v22 count:16];
  if (v10)
  {
    uint64_t v11 = v10;
    uint64_t v12 = *(void *)v19;
    uint64_t v13 = (a3 + 1);
    do
    {
      for (uint64_t i = 0; i != v11; ++i)
      {
        if (*(void *)v19 != v12) {
          objc_enumerationMutation(v9);
        }
        v15 = [(UIDebuggingInformationVCHierarchyViewController *)self getViewControllersRecursiveWithLevel:v13 forView:*(void *)(*((void *)&v18 + 1) + 8 * i)];
        [v8 addObjectsFromArray:v15];
      }
      uint64_t v11 = [v9 countByEnumeratingWithState:&v18 objects:v22 count:16];
    }
    while (v11);
  }

  v16 = (void *)[v8 copy];
  return v16;
}

- (void)tableView:(id)a3 didSelectRowAtIndexPath:(id)a4
{
  id v5 = a4;
  id v6 = [(UIDebuggingInformationVCHierarchyViewController *)self data];
  uint64_t v7 = [v5 row];

  objc_super v8 = [v6 objectAtIndexedSubscript:v7];
  id v11 = [v8 viewController];

  objc_super v9 = objc_alloc_init(UIDebuggingInformationVCDetailViewController);
  [(UIDebuggingInformationVCDetailViewController *)v9 inspectVC:v11];
  uint64_t v10 = [(UIViewController *)self navigationController];
  [v10 pushViewController:v9 animated:1];
}

- (id)tableView:(id)a3 cellForRowAtIndexPath:(id)a4
{
  id v5 = a4;
  id v6 = [[UITableViewCell alloc] initWithStyle:0 reuseIdentifier:@"kCellReuseIdentifier"];
  uint64_t v7 = [(UIDebuggingInformationVCHierarchyViewController *)self data];
  uint64_t v8 = [v5 row];

  objc_super v9 = [v7 objectAtIndexedSubscript:v8];
  uint64_t v10 = [v9 viewController];

  if (v10)
  {
    id v11 = (objc_class *)objc_opt_class();
    NSStringFromClass(v11);
    uint64_t v12 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    uint64_t v12 = @"Deallocated";
  }
  uint64_t v13 = [(UITableViewCell *)v6 textLabel];
  [v13 setText:v12];

  [(UITableViewCell *)v6 setSelectionStyle:3];
  [(UITableViewCell *)v6 setAccessoryType:1];

  return v6;
}

- (int64_t)tableView:(id)a3 indentationLevelForRowAtIndexPath:(id)a4
{
  id v5 = a4;
  id v6 = [(UIDebuggingInformationVCHierarchyViewController *)self data];
  uint64_t v7 = [v5 row];

  uint64_t v8 = [v6 objectAtIndexedSubscript:v7];
  int64_t v9 = [v8 level];

  return v9;
}

- (int64_t)tableView:(id)a3 numberOfRowsInSection:(int64_t)a4
{
  v4 = [(UIDebuggingInformationVCHierarchyViewController *)self data];
  int64_t v5 = [v4 count];

  return v5;
}

- (NSArray)data
{
  return self->_data;
}

- (void)setData:(id)a3
{
}

- (UITableView)tableView
{
  return self->_tableView;
}

- (void)setTableView:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_tableView, 0);
  objc_storeStrong((id *)&self->_data, 0);
}

@end