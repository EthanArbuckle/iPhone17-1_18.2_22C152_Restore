@interface UIDebuggingInformationInspectorDetailViewController
- (UIDebuggingInformationInspectorDetailViewController)initWithNibName:(id)a3 bundle:(id)a4;
- (id)tableView:(id)a3 cellForRowAtIndexPath:(id)a4;
- (int64_t)tableView:(id)a3 numberOfRowsInSection:(int64_t)a4;
- (void)_flush;
- (void)_forceViewLayout;
- (void)_updateData;
- (void)inspectView:(id)a3;
- (void)tableView:(id)a3 didSelectRowAtIndexPath:(id)a4;
- (void)viewDidLoad;
- (void)viewWillAppear:(BOOL)a3;
@end

@implementation UIDebuggingInformationInspectorDetailViewController

- (UIDebuggingInformationInspectorDetailViewController)initWithNibName:(id)a3 bundle:(id)a4
{
  v15[2] = *MEMORY[0x1E4F143B8];
  v14.receiver = self;
  v14.super_class = (Class)UIDebuggingInformationInspectorDetailViewController;
  v4 = [(UIViewController *)&v14 initWithNibName:a3 bundle:a4];
  if (v4)
  {
    v5 = [UITableView alloc];
    v6 = -[UITableView initWithFrame:style:](v5, "initWithFrame:style:", 0, *MEMORY[0x1E4F1DB28], *(double *)(MEMORY[0x1E4F1DB28] + 8), *(double *)(MEMORY[0x1E4F1DB28] + 16), *(double *)(MEMORY[0x1E4F1DB28] + 24));
    [(UITableView *)v6 setDataSource:v4];
    [(UITableView *)v6 setDelegate:v4];
    [(UITableView *)v6 setRowHeight:-1.0];
    tableView = v4->_tableView;
    v4->_tableView = v6;
    v8 = v6;

    v9 = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:16 target:v4 action:sel__flush];
    v15[0] = v9;
    v10 = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:13 target:v4 action:sel__forceViewLayout];
    v15[1] = v10;
    v11 = [MEMORY[0x1E4F1C978] arrayWithObjects:v15 count:2];

    v12 = [(UIViewController *)v4 navigationItem];
    [v12 setRightBarButtonItems:v11];
  }
  return v4;
}

- (void)_flush
{
}

- (void)_forceViewLayout
{
  p_inspectedView = &self->_inspectedView;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_inspectedView);
  [WeakRetained setNeedsLayout];

  id v4 = objc_loadWeakRetained((id *)p_inspectedView);
  [v4 layoutIfNeeded];
}

- (void)viewDidLoad
{
  v9.receiver = self;
  v9.super_class = (Class)UIDebuggingInformationInspectorDetailViewController;
  [(UIViewController *)&v9 viewDidLoad];
  v3 = +[UIColor whiteColor];
  id v4 = [(UIViewController *)self view];
  [v4 setBackgroundColor:v3];

  v5 = [(UIViewController *)self view];
  [v5 setAutoresizingMask:18];

  [(UIView *)self->_tableView setAutoresizingMask:18];
  tableView = self->_tableView;
  v7 = [(UIViewController *)self view];
  [v7 bounds];
  -[UITableView setFrame:](tableView, "setFrame:");

  v8 = [(UIViewController *)self view];
  [v8 addSubview:self->_tableView];
}

- (void)viewWillAppear:(BOOL)a3
{
  v5.receiver = self;
  v5.super_class = (Class)UIDebuggingInformationInspectorDetailViewController;
  [(UIViewController *)&v5 viewWillAppear:a3];
  id WeakRetained = objc_loadWeakRetained((id *)&self->_inspectedView);

  if (WeakRetained)
  {
    [(UIDebuggingInformationInspectorDetailViewController *)self _updateData];
    [(UITableView *)self->_tableView reloadData];
  }
}

- (void)_updateData
{
  v46[7] = *MEMORY[0x1E4F143B8];
  if (![(NSArray *)self->_data count])
  {
    id WeakRetained = objc_loadWeakRetained((id *)&self->_inspectedView);
    id v4 = (objc_class *)objc_opt_class();
    objc_super v5 = NSStringFromClass(v4);
    v40 = +[_UIDebuggingOverlayDetail detailWithTitle:@"Class" detail:v5];

    id v6 = objc_loadWeakRetained((id *)&self->_inspectedView);
    [v6 frame];
    v11 = [NSString stringWithFormat:@"{{%.2f %.2f}, {%.2f %.2f}}", v7, v8, v9, v10];
    v12 = +[_UIDebuggingOverlayDetail detailWithTitle:@"Frame" detail:v11];

    id v13 = objc_loadWeakRetained((id *)&self->_inspectedView);
    [v13 bounds];
    v18 = [NSString stringWithFormat:@"{{%.2f %.2f}, {%.2f %.2f}}", v14, v15, v16, v17];
    v19 = +[_UIDebuggingOverlayDetail detailWithTitle:@"Bounds" detail:v18];

    id v20 = objc_loadWeakRetained((id *)&self->_inspectedView);
    [v20 safeAreaInsets];
    v21 = NSStringFromUIEdgeInsets(v47);
    v22 = +[_UIDebuggingOverlayDetail detailWithTitle:@"Safe Area" detail:v21];

    v23 = objc_alloc_init(_UIDebuggingOverlayDetailOpacity);
    v24 = +[_UIDebuggingOverlayDetail detailWithTitle:@"iVar Description" detail:0];
    [(_UIDebuggingOverlayDetail *)v23 setTitle:@"Opacity"];
    id v25 = objc_loadWeakRetained((id *)&self->_inspectedView);
    [(_UIDebuggingOverlayDetailOpacity *)v23 _updateForInspectedView:v25];

    id v26 = objc_loadWeakRetained((id *)&self->_inspectedView);
    int v27 = [v26 _wantsAutolayout];
    v28 = @"No";
    if (v27) {
      v28 = @"Yes";
    }
    v29 = v28;

    v30 = +[_UIDebuggingOverlayDetail detailWithTitle:@"Auto Layout" detail:v29];

    v46[0] = v40;
    v46[1] = v24;
    v46[2] = v12;
    v46[3] = v19;
    v46[4] = v22;
    v46[5] = v23;
    v46[6] = v30;
    v31 = [MEMORY[0x1E4F1C978] arrayWithObjects:v46 count:7];
    data = self->_data;
    self->_data = v31;
  }
  long long v43 = 0u;
  long long v44 = 0u;
  long long v41 = 0u;
  long long v42 = 0u;
  v33 = self->_data;
  uint64_t v34 = [(NSArray *)v33 countByEnumeratingWithState:&v41 objects:v45 count:16];
  if (v34)
  {
    uint64_t v35 = v34;
    uint64_t v36 = *(void *)v42;
    do
    {
      uint64_t v37 = 0;
      do
      {
        if (*(void *)v42 != v36) {
          objc_enumerationMutation(v33);
        }
        v38 = *(void **)(*((void *)&v41 + 1) + 8 * v37);
        id v39 = objc_loadWeakRetained((id *)&self->_inspectedView);
        [v38 _updateForInspectedView:v39];

        ++v37;
      }
      while (v35 != v37);
      uint64_t v35 = [(NSArray *)v33 countByEnumeratingWithState:&v41 objects:v45 count:16];
    }
    while (v35);
  }
}

- (void)inspectView:(id)a3
{
}

- (void)tableView:(id)a3 didSelectRowAtIndexPath:(id)a4
{
  -[NSArray objectAtIndexedSubscript:](self->_data, "objectAtIndexedSubscript:", objc_msgSend(a4, "row", a3));
  id v8 = (id)objc_claimAutoreleasedReturnValue();
  objc_super v5 = [v8 viewController];

  if (v5)
  {
    id v6 = [(UIViewController *)self navigationController];
    uint64_t v7 = [v8 viewController];
    [v6 pushViewController:v7 animated:1];
  }
}

- (id)tableView:(id)a3 cellForRowAtIndexPath:(id)a4
{
  id v5 = a4;
  id v6 = [[UITableViewCell alloc] initWithStyle:3 reuseIdentifier:@"kCellReuseIdentifierDetail"];
  data = self->_data;
  uint64_t v8 = [v5 row];

  uint64_t v9 = [(NSArray *)data objectAtIndexedSubscript:v8];
  uint64_t v10 = [v9 viewController];
  if (v10) {
    uint64_t v11 = 3;
  }
  else {
    uint64_t v11 = 0;
  }
  [(UITableViewCell *)v6 setSelectionStyle:v11];

  v12 = [v9 viewController];
  [(UITableViewCell *)v6 setAccessoryType:v12 != 0];

  id v13 = [v9 title];
  uint64_t v14 = [(UITableViewCell *)v6 textLabel];
  [v14 setText:v13];

  uint64_t v15 = [v9 detail];
  uint64_t v16 = [(UITableViewCell *)v6 detailTextLabel];
  [v16 setText:v15];

  uint64_t v17 = [v9 view];
  [(UITableViewCell *)v6 setAccessoryView:v17];

  return v6;
}

- (int64_t)tableView:(id)a3 numberOfRowsInSection:(int64_t)a4
{
  return [(NSArray *)self->_data count];
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_tableView, 0);
  objc_destroyWeak((id *)&self->_inspectedView);
  objc_storeStrong((id *)&self->_data, 0);
}

@end