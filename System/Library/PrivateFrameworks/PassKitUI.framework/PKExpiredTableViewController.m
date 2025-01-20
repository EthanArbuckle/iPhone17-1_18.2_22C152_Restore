@interface PKExpiredTableViewController
- (PKExpiredTableViewController)initWithStyle:(int64_t)a3;
- (PKExpiredTableViewControllerCachingDelegate)cachingDelegate;
- (PKGroupsController)existingGroupsController;
- (id)tableView:(id)a3 cellWithReuseIdentifier:(id)a4;
- (id)tableView:(id)a3 willDeselectRowAtIndexPath:(id)a4;
- (id)tableView:(id)a3 willSelectRowAtIndexPath:(id)a4;
- (int64_t)numberOfSectionsInTableView:(id)a3;
- (int64_t)tableView:(id)a3 numberOfRowsInSection:(int64_t)a4;
- (void)setCachingDelegate:(id)a3;
- (void)setExistingGroupsController:(id)a3;
- (void)tableView:(id)a3 prefetchRowsAtIndexPaths:(id)a4;
- (void)viewDidLoad;
@end

@implementation PKExpiredTableViewController

- (PKExpiredTableViewController)initWithStyle:(int64_t)a3
{
  v7.receiver = self;
  v7.super_class = (Class)PKExpiredTableViewController;
  v3 = [(PKExpiredTableViewController *)&v7 initWithStyle:a3];
  if (v3)
  {
    v4 = [(id)*MEMORY[0x1E4FB2608] preferredContentSizeCategory];
    BOOL IsAccessibilityCategory = UIContentSizeCategoryIsAccessibilityCategory(v4);

    if (IsAccessibilityCategory) {
      v3->_isAccessibilityCategory = 1;
    }
    objc_storeWeak((id *)&v3->_cachingDelegate, 0);
  }
  return v3;
}

- (void)viewDidLoad
{
  v6.receiver = self;
  v6.super_class = (Class)PKExpiredTableViewController;
  [(PKExpiredTableViewController *)&v6 viewDidLoad];
  v3 = [(PKExpiredTableViewController *)self tableView];
  tableView = self->_tableView;
  self->_tableView = v3;

  [(UITableView *)self->_tableView setPrefetchDataSource:self];
  v5 = self->_tableView;
  +[PKExpiredPassesTableViewCell height];
  -[UITableView setEstimatedRowHeight:](v5, "setEstimatedRowHeight:");
  [(UITableView *)self->_tableView setRowHeight:*MEMORY[0x1E4FB2F28]];
  [(UITableView *)self->_tableView setAllowsSelection:1];
  [(UITableView *)self->_tableView setAllowsSelectionDuringEditing:1];
  [(UITableView *)self->_tableView setAllowsMultipleSelectionDuringEditing:1];
  [(UITableView *)self->_tableView setSeparatorStyle:1];
  [(PKExpiredTableViewController *)self setEditing:0];
}

- (int64_t)numberOfSectionsInTableView:(id)a3
{
  return 0;
}

- (int64_t)tableView:(id)a3 numberOfRowsInSection:(int64_t)a4
{
  return 0;
}

- (id)tableView:(id)a3 cellWithReuseIdentifier:(id)a4
{
  id v5 = a4;
  objc_super v6 = [a3 dequeueReusableCellWithIdentifier:v5];
  if (!v6)
  {
    objc_super v6 = [[PKExpiredPassesTableViewCell alloc] initWithReuseIdentifier:v5];
    [(PKExpiredPassesTableViewCell *)v6 setShowsReorderControl:0];
    [(PKExpiredPassesTableViewCell *)v6 setAccessoryType:1];
    [(PKExpiredPassesTableViewCell *)v6 setEditingAccessoryType:1];
  }

  return v6;
}

- (id)tableView:(id)a3 willSelectRowAtIndexPath:(id)a4
{
  id v4 = a4;

  return v4;
}

- (id)tableView:(id)a3 willDeselectRowAtIndexPath:(id)a4
{
  id v4 = a4;

  return v4;
}

- (void)tableView:(id)a3 prefetchRowsAtIndexPaths:(id)a4
{
  id v7 = a4;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_cachingDelegate);
  objc_super v6 = WeakRetained;
  if (WeakRetained) {
    [WeakRetained prefetchItemsAtIndexPaths:v7];
  }
}

- (PKExpiredTableViewControllerCachingDelegate)cachingDelegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_cachingDelegate);

  return (PKExpiredTableViewControllerCachingDelegate *)WeakRetained;
}

- (void)setCachingDelegate:(id)a3
{
}

- (PKGroupsController)existingGroupsController
{
  return self->_existingGroupsController;
}

- (void)setExistingGroupsController:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_existingGroupsController, 0);
  objc_destroyWeak((id *)&self->_cachingDelegate);

  objc_storeStrong((id *)&self->_tableView, 0);
}

@end