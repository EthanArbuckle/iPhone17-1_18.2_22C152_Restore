@interface PKSettingsTableViewController
- (BOOL)tableView:(id)a3 shouldHighlightRowAtIndexPath:(id)a4;
- (id)indexPathForItemWithIdentifier:(id)a3;
- (id)sections;
- (int64_t)indexOfSectionWithIdentifier:(id)a3;
- (void)applyConfiguration:(id)a3 animated:(BOOL)a4;
- (void)applyConfiguration:(id)a3 reconfigureItems:(BOOL)a4 animated:(BOOL)a5;
- (void)tableView:(id)a3 didSelectRowAtIndexPath:(id)a4;
- (void)viewDidLoad;
@end

@implementation PKSettingsTableViewController

- (void)viewDidLoad
{
  v19.receiver = self;
  v19.super_class = (Class)PKSettingsTableViewController;
  [(PKSettingsTableViewController *)&v19 viewDidLoad];
  v3 = [(PKSettingsTableViewController *)self tableView];
  objc_msgSend(v3, "pkui_setupForReadableContentGuide");
  objc_initWeak(&location, self);
  v4 = [PKTableViewDiffableDataSource alloc];
  v16[0] = MEMORY[0x1E4F143A8];
  v16[1] = 3221225472;
  v16[2] = __44__PKSettingsTableViewController_viewDidLoad__block_invoke;
  v16[3] = &unk_1E59CAB80;
  objc_copyWeak(&v17, &location);
  v5 = [(UITableViewDiffableDataSource *)v4 initWithTableView:v3 cellProvider:v16];
  dataSource = self->_dataSource;
  self->_dataSource = v5;

  v7 = self->_dataSource;
  v14[0] = MEMORY[0x1E4F143A8];
  v14[1] = 3221225472;
  v14[2] = __44__PKSettingsTableViewController_viewDidLoad__block_invoke_2;
  v14[3] = &unk_1E59CABA8;
  objc_copyWeak(&v15, &location);
  [(PKTableViewDiffableDataSource *)v7 setSectionHeaderProvider:v14];
  v8 = self->_dataSource;
  uint64_t v9 = MEMORY[0x1E4F143A8];
  uint64_t v10 = 3221225472;
  v11 = __44__PKSettingsTableViewController_viewDidLoad__block_invoke_3;
  v12 = &unk_1E59CABA8;
  objc_copyWeak(&v13, &location);
  [(PKTableViewDiffableDataSource *)v8 setSectionFooterProvider:&v9];
  -[UITableViewDiffableDataSource setDefaultRowAnimation:](self->_dataSource, "setDefaultRowAnimation:", 0, v9, v10, v11, v12);
  [v3 setAccessibilityIdentifier:*MEMORY[0x1E4F859D0]];
  objc_destroyWeak(&v13);
  objc_destroyWeak(&v15);
  objc_destroyWeak(&v17);
  objc_destroyWeak(&location);
}

id __44__PKSettingsTableViewController_viewDidLoad__block_invoke(uint64_t a1, void *a2, void *a3, void *a4)
{
  id v7 = a2;
  id v8 = a3;
  id v9 = a4;
  WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 32));
  v11 = WeakRetained;
  if (WeakRetained)
  {
    v12 = [WeakRetained[129] rowForItemIdentifier:v9];
    id v13 = [v12 tableViewCellForTableView:v7 atIndexPath:v8];
  }
  else
  {
    id v13 = 0;
  }

  return v13;
}

id __44__PKSettingsTableViewController_viewDidLoad__block_invoke_2(uint64_t a1, uint64_t a2, void *a3)
{
  id v4 = a3;
  WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 32));
  v6 = WeakRetained;
  if (WeakRetained)
  {
    id v7 = [WeakRetained[129] sectionForSectionIdentifier:v4];
    id v8 = [v7 title];
  }
  else
  {
    id v8 = 0;
  }

  return v8;
}

id __44__PKSettingsTableViewController_viewDidLoad__block_invoke_3(uint64_t a1, uint64_t a2, void *a3)
{
  id v4 = a3;
  WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 32));
  v6 = WeakRetained;
  if (WeakRetained)
  {
    id v7 = [WeakRetained[129] sectionForSectionIdentifier:v4];
    id v8 = [v7 footer];
  }
  else
  {
    id v8 = 0;
  }

  return v8;
}

- (void)applyConfiguration:(id)a3 animated:(BOOL)a4
{
}

- (void)applyConfiguration:(id)a3 reconfigureItems:(BOOL)a4 animated:(BOOL)a5
{
  BOOL v5 = a5;
  BOOL v6 = a4;
  id v9 = a3;
  uint64_t v10 = [v9 snapshot];
  if (v10)
  {
    p_currentConfiguration = &self->_currentConfiguration;
    if (v6)
    {
      v12 = *p_currentConfiguration;
      if (*p_currentConfiguration)
      {
        id v15 = 0;
        [(PKSettingsTableViewConfiguration *)v12 diff:v9 updatedIdentifiers:&v15];
        id v13 = v15;
      }
      else
      {
        id v13 = 0;
      }
      objc_storeStrong((id *)&self->_currentConfiguration, a3);
      if ([v13 count])
      {
        v14 = [v13 allObjects];
        [v10 reconfigureItemsWithIdentifiers:v14];
      }
    }
    else
    {
      objc_storeStrong((id *)&self->_currentConfiguration, a3);
    }
    [(UITableViewDiffableDataSource *)self->_dataSource applySnapshot:v10 animatingDifferences:v5];
  }
}

- (int64_t)indexOfSectionWithIdentifier:(id)a3
{
  if (!a3) {
    return 0x7FFFFFFFFFFFFFFFLL;
  }
  dataSource = self->_dataSource;
  id v4 = a3;
  BOOL v5 = [(UITableViewDiffableDataSource *)dataSource snapshot];
  BOOL v6 = [v5 sectionIdentifiers];
  int64_t v7 = [v6 indexOfObject:v4];

  return v7;
}

- (id)indexPathForItemWithIdentifier:(id)a3
{
  if (a3)
  {
    id v4 = -[UITableViewDiffableDataSource indexPathForItemIdentifier:](self->_dataSource, "indexPathForItemIdentifier:");
  }
  else
  {
    id v4 = 0;
  }
  return v4;
}

- (id)sections
{
  return [(PKSettingsTableViewConfiguration *)self->_currentConfiguration sections];
}

- (BOOL)tableView:(id)a3 shouldHighlightRowAtIndexPath:(id)a4
{
  currentConfiguration = self->_currentConfiguration;
  BOOL v5 = [(UITableViewDiffableDataSource *)self->_dataSource itemIdentifierForIndexPath:a4];
  BOOL v6 = [(PKSettingsTableViewConfiguration *)currentConfiguration rowForItemIdentifier:v5];

  LOBYTE(v5) = [v6 shouldHighlight];
  return (char)v5;
}

- (void)tableView:(id)a3 didSelectRowAtIndexPath:(id)a4
{
  id v10 = a3;
  id v6 = a4;
  currentConfiguration = self->_currentConfiguration;
  id v8 = [(UITableViewDiffableDataSource *)self->_dataSource itemIdentifierForIndexPath:v6];
  id v9 = [(PKSettingsTableViewConfiguration *)currentConfiguration rowForItemIdentifier:v8];

  if (objc_opt_respondsToSelector()) {
    [v9 handleCellSelection];
  }
  [v10 deselectRowAtIndexPath:v6 animated:1];
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_currentConfiguration, 0);

  objc_storeStrong((id *)&self->_dataSource, 0);
}

@end