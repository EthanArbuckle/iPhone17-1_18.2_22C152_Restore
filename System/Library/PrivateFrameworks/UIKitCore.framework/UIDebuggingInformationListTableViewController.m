@interface UIDebuggingInformationListTableViewController
- (UIDebuggingInformationListTableViewController)initWithStyle:(int64_t)a3;
- (id)tableView:(id)a3 cellForRowAtIndexPath:(id)a4;
- (id)topLevelViewControllerForName:(id)a3;
- (int64_t)numberOfSectionsInTableView:(id)a3;
- (int64_t)tableView:(id)a3 numberOfRowsInSection:(int64_t)a4;
- (void)addTopLevelViewController:(id)a3 forName:(id)a4;
- (void)tableView:(id)a3 didSelectRowAtIndexPath:(id)a4;
- (void)toggleOverlayFullscreen;
- (void)toggleOverlayVisibility;
- (void)viewDidLoad;
@end

@implementation UIDebuggingInformationListTableViewController

- (UIDebuggingInformationListTableViewController)initWithStyle:(int64_t)a3
{
  v9.receiver = self;
  v9.super_class = (Class)UIDebuggingInformationListTableViewController;
  v3 = [(UITableViewController *)&v9 initWithStyle:a3];
  if (v3)
  {
    v4 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E4F1CA48]);
    topLevelViewControllers = v3->topLevelViewControllers;
    v3->topLevelViewControllers = v4;

    v6 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E4F1CA48]);
    topLevelViewControllerNames = v3->topLevelViewControllerNames;
    v3->topLevelViewControllerNames = v6;
  }
  return v3;
}

- (void)toggleOverlayFullscreen
{
  id v2 = +[UIDebuggingInformationOverlay overlay];
  [v2 toggleFullscreen];
}

- (void)toggleOverlayVisibility
{
  id v2 = +[UIDebuggingInformationOverlay overlay];
  [v2 toggleVisibility];
}

- (void)viewDidLoad
{
  v8.receiver = self;
  v8.super_class = (Class)UIDebuggingInformationListTableViewController;
  [(UIViewController *)&v8 viewDidLoad];
  v3 = [(UITableViewController *)self tableView];
  [v3 registerClass:objc_opt_class() forCellReuseIdentifier:@"kReuseIdentifier"];

  v4 = [UIView alloc];
  v5 = [(UITableViewController *)self tableView];
  [v5 frame];
  v6 = -[UIView initWithFrame:](v4, "initWithFrame:", 0.0, 0.0);
  v7 = [(UITableViewController *)self tableView];
  [v7 setTableFooterView:v6];
}

- (int64_t)numberOfSectionsInTableView:(id)a3
{
  return 1;
}

- (int64_t)tableView:(id)a3 numberOfRowsInSection:(int64_t)a4
{
  return [(NSMutableArray *)self->topLevelViewControllerNames count];
}

- (id)tableView:(id)a3 cellForRowAtIndexPath:(id)a4
{
  id v6 = a4;
  v7 = [a3 dequeueReusableCellWithIdentifier:@"kReuseIdentifier" forIndexPath:v6];
  objc_super v8 = [v7 textLabel];
  topLevelViewControllerNames = self->topLevelViewControllerNames;
  uint64_t v10 = [v6 row];

  v11 = [(NSMutableArray *)topLevelViewControllerNames objectAtIndex:v10];
  [v8 setText:v11];

  [v7 setAccessoryType:1];
  return v7;
}

- (void)tableView:(id)a3 didSelectRowAtIndexPath:(id)a4
{
  topLevelViewControllers = self->topLevelViewControllers;
  id v6 = a4;
  -[NSMutableArray objectAtIndex:](topLevelViewControllers, "objectAtIndex:", [v6 row]);
  id v19 = (id)objc_claimAutoreleasedReturnValue();
  topLevelViewControllerNames = self->topLevelViewControllerNames;
  uint64_t v8 = [v6 row];

  objc_super v9 = [(NSMutableArray *)topLevelViewControllerNames objectAtIndexedSubscript:v8];
  [v19 setTitle:v9];

  if (objc_opt_respondsToSelector()) {
    [v19 prepareForDisplayAsTopLevelDebuggingViewController];
  }
  uint64_t v10 = [v19 navigationItem];
  v11 = [v10 rightBarButtonItems];
  uint64_t v12 = [v11 count];

  if (!v12)
  {
    v13 = [(UIViewController *)self navigationController];
    v14 = [v13 topViewController];
    v15 = [v14 navigationItem];
    v16 = [v15 rightBarButtonItems];
    v17 = [v19 navigationItem];
    [v17 setRightBarButtonItems:v16];
  }
  v18 = [(UIViewController *)self navigationController];
  [v18 pushViewController:v19 animated:1];
}

- (void)addTopLevelViewController:(id)a3 forName:(id)a4
{
  id v9 = a3;
  topLevelViewControllers = self->topLevelViewControllers;
  id v7 = a4;
  [(NSMutableArray *)topLevelViewControllers addObject:v9];
  [(NSMutableArray *)self->topLevelViewControllerNames addObject:v7];

  uint64_t v8 = [(UITableViewController *)self tableView];
  [v8 reloadData];
}

- (id)topLevelViewControllerForName:(id)a3
{
  uint64_t v4 = [(NSMutableArray *)self->topLevelViewControllerNames indexOfObjectIdenticalTo:a3];
  if (v4 == 0x7FFFFFFFFFFFFFFFLL)
  {
    v5 = 0;
  }
  else
  {
    v5 = [(NSMutableArray *)self->topLevelViewControllers objectAtIndex:v4];
  }
  return v5;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->topLevelViewControllerNames, 0);
  objc_storeStrong((id *)&self->topLevelViewControllers, 0);
}

@end