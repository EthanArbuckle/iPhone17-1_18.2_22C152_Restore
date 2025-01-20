@interface GeoRequestResponseLogBundleIdTableViewController
- (BOOL)tableView:(id)a3 canEditRowAtIndexPath:(id)a4;
- (GeoRequestResponseLogBundleIdTableViewController)init;
- (id)tableView:(id)a3 cellForRowAtIndexPath:(id)a4;
- (id)tableView:(id)a3 trailingSwipeActionsConfigurationForRowAtIndexPath:(id)a4;
- (id)tableView:(id)a3 viewForHeaderInSection:(int64_t)a4;
- (int64_t)numberOfSectionsInTableView:(id)a3;
- (int64_t)tableView:(id)a3 numberOfRowsInSection:(int64_t)a4;
- (void)_addRow;
- (void)_editBundleId:(id)a3 completion:(id)a4;
- (void)tableView:(id)a3 didSelectRowAtIndexPath:(id)a4;
- (void)viewDidLoad;
- (void)viewWillAppear:(BOOL)a3;
@end

@implementation GeoRequestResponseLogBundleIdTableViewController

- (GeoRequestResponseLogBundleIdTableViewController)init
{
  v3.receiver = self;
  v3.super_class = (Class)GeoRequestResponseLogBundleIdTableViewController;
  return [(GeoRequestResponseLogBundleIdTableViewController *)&v3 initWithStyle:0];
}

- (void)viewDidLoad
{
  v6.receiver = self;
  v6.super_class = (Class)GeoRequestResponseLogBundleIdTableViewController;
  [(GeoRequestResponseLogBundleIdTableViewController *)&v6 viewDidLoad];
  id v3 = [objc_alloc((Class)UIBarButtonItem) initWithBarButtonSystemItem:4 target:self action:"_addRow"];
  v4 = [(GeoRequestResponseLogBundleIdTableViewController *)self navigationItem];
  [v4 setRightBarButtonItem:v3];

  v5 = [(GeoRequestResponseLogBundleIdTableViewController *)self tableView];
  [v5 setSectionHeaderHeight:UITableViewAutomaticDimension];
}

- (void)viewWillAppear:(BOOL)a3
{
  v8.receiver = self;
  v8.super_class = (Class)GeoRequestResponseLogBundleIdTableViewController;
  [(GeoRequestResponseLogBundleIdTableViewController *)&v8 viewWillAppear:a3];
  v4 = GEOConfigGetSet();
  v5 = [v4 allObjects];
  objc_super v6 = (NSMutableArray *)[v5 mutableCopy];
  bundleIds = self->_bundleIds;
  self->_bundleIds = v6;
}

- (int64_t)numberOfSectionsInTableView:(id)a3
{
  return 1;
}

- (int64_t)tableView:(id)a3 numberOfRowsInSection:(int64_t)a4
{
  return (int64_t)[(NSMutableArray *)self->_bundleIds count];
}

- (BOOL)tableView:(id)a3 canEditRowAtIndexPath:(id)a4
{
  return 1;
}

- (id)tableView:(id)a3 viewForHeaderInSection:(int64_t)a4
{
  id v4 = objc_alloc_init((Class)UILabel);
  [v4 setTranslatesAutoresizingMaskIntoConstraints:0];
  [v4 setText:@"Bundle Ids are matched exactly. An id may end in * to perform a prefix match (e.g. \"com.apple.*\" to filter on all internal apps)"];
  [v4 setNumberOfLines:0];
  id v5 = objc_alloc_init((Class)UIView);
  [v5 addSubview:v4];
  v19 = [v4 leadingAnchor];
  v18 = [v5 leadingAnchor];
  v17 = [v19 constraintEqualToAnchor:v18 constant:8.0];
  v20[0] = v17;
  v16 = [v5 trailingAnchor];
  v15 = [v4 trailingAnchor];
  objc_super v6 = [v16 constraintEqualToAnchor:v15 constant:8.0];
  v20[1] = v6;
  v7 = [v4 topAnchor];
  objc_super v8 = [v5 topAnchor];
  v9 = [v7 constraintEqualToAnchor:v8 constant:8.0];
  v20[2] = v9;
  v10 = [v5 bottomAnchor];
  v11 = [v4 bottomAnchor];
  v12 = [v10 constraintEqualToAnchor:v11 constant:8.0];
  v20[3] = v12;
  v13 = +[NSArray arrayWithObjects:v20 count:4];
  +[NSLayoutConstraint activateConstraints:v13];

  return v5;
}

- (void)tableView:(id)a3 didSelectRowAtIndexPath:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  objc_super v8 = -[NSMutableArray objectAtIndexedSubscript:](self->_bundleIds, "objectAtIndexedSubscript:", [v7 row]);
  v11[0] = _NSConcreteStackBlock;
  v11[1] = 3221225472;
  v11[2] = sub_1003B4BD8;
  v11[3] = &unk_1012E7878;
  v11[4] = self;
  id v12 = v7;
  id v13 = v6;
  id v9 = v6;
  id v10 = v7;
  [(GeoRequestResponseLogBundleIdTableViewController *)self _editBundleId:v8 completion:v11];

  [v9 deselectRowAtIndexPath:v10 animated:1];
}

- (id)tableView:(id)a3 cellForRowAtIndexPath:(id)a4
{
  id v5 = a4;
  id v6 = [objc_alloc((Class)UITableViewCell) initWithStyle:0 reuseIdentifier:@"row"];
  [v6 setSelectionStyle:0];
  bundleIds = self->_bundleIds;
  id v8 = [v5 row];

  id v9 = [(NSMutableArray *)bundleIds objectAtIndexedSubscript:v8];
  id v10 = [v6 textLabel];
  [v10 setText:v9];

  return v6;
}

- (id)tableView:(id)a3 trailingSwipeActionsConfigurationForRowAtIndexPath:(id)a4
{
  id v9 = _NSConcreteStackBlock;
  uint64_t v10 = 3221225472;
  v11 = sub_1003B4EF8;
  id v12 = &unk_1012E78A0;
  id v13 = self;
  id v14 = a4;
  id v4 = v14;
  id v5 = +[UIContextualAction contextualActionWithStyle:1 title:@"Delete" handler:&v9];
  v15 = v5;
  id v6 = +[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", &v15, 1, v9, v10, v11, v12, v13);
  id v7 = +[UISwipeActionsConfiguration configurationWithActions:v6];

  return v7;
}

- (void)_addRow
{
  v2[0] = _NSConcreteStackBlock;
  v2[1] = 3221225472;
  v2[2] = sub_1003B5068;
  v2[3] = &unk_1012E78C8;
  v2[4] = self;
  [(GeoRequestResponseLogBundleIdTableViewController *)self _editBundleId:&stru_101324E70 completion:v2];
}

- (void)_editBundleId:(id)a3 completion:(id)a4
{
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472;
  v8[2] = sub_1003B5270;
  v8[3] = &unk_1012E78F0;
  id v9 = a4;
  id v6 = v9;
  id v7 = +[GeoRequestResponseLogBundleIdAlertController alertControllerWithBundleId:a3 completionHandler:v8];
  [(GeoRequestResponseLogBundleIdTableViewController *)self presentViewController:v7 animated:1 completion:0];
}

- (void).cxx_destruct
{
}

@end