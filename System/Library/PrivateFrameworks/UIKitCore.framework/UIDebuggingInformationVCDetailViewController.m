@interface UIDebuggingInformationVCDetailViewController
- (UIDebuggingInformationVCDetailViewController)initWithNibName:(id)a3 bundle:(id)a4;
- (UIViewController)inspectedVC;
- (id)tableView:(id)a3 cellForRowAtIndexPath:(id)a4;
- (id)tableView:(id)a3 titleForHeaderInSection:(int64_t)a4;
- (int64_t)numberOfSectionsInTableView:(id)a3;
- (int64_t)tableView:(id)a3 numberOfRowsInSection:(int64_t)a4;
- (void)_updateDataAndReload:(BOOL)a3;
- (void)inspectVC:(id)a3;
- (void)setInspectedVC:(id)a3;
- (void)tableView:(id)a3 didSelectRowAtIndexPath:(id)a4;
- (void)viewDidLoad;
- (void)viewWillAppear:(BOOL)a3;
@end

@implementation UIDebuggingInformationVCDetailViewController

- (UIDebuggingInformationVCDetailViewController)initWithNibName:(id)a3 bundle:(id)a4
{
  v9.receiver = self;
  v9.super_class = (Class)UIDebuggingInformationVCDetailViewController;
  v4 = [(UIViewController *)&v9 initWithNibName:a3 bundle:a4];
  if (v4)
  {
    v5 = [UITableView alloc];
    v6 = -[UITableView initWithFrame:style:](v5, "initWithFrame:style:", 0, *MEMORY[0x1E4F1DB28], *(double *)(MEMORY[0x1E4F1DB28] + 8), *(double *)(MEMORY[0x1E4F1DB28] + 16), *(double *)(MEMORY[0x1E4F1DB28] + 24));
    [(UITableView *)v6 setDataSource:v4];
    [(UITableView *)v6 setDelegate:v4];
    [(UITableView *)v6 setRowHeight:-1.0];
    tableView = v4->_tableView;
    v4->_tableView = v6;
  }
  return v4;
}

- (void)viewDidLoad
{
  v9.receiver = self;
  v9.super_class = (Class)UIDebuggingInformationVCDetailViewController;
  [(UIViewController *)&v9 viewDidLoad];
  v3 = +[UIColor whiteColor];
  v4 = [(UIViewController *)self view];
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
  v4.receiver = self;
  v4.super_class = (Class)UIDebuggingInformationVCDetailViewController;
  [(UIViewController *)&v4 viewWillAppear:a3];
  [(UIDebuggingInformationVCDetailViewController *)self _updateDataAndReload:1];
}

- (void)inspectVC:(id)a3
{
  [(UIDebuggingInformationVCDetailViewController *)self setInspectedVC:a3];
  [(UIDebuggingInformationVCDetailViewController *)self _updateDataAndReload:1];
}

- (void)_updateDataAndReload:(BOOL)a3
{
  BOOL v3 = a3;
  v39[6] = *MEMORY[0x1E4F143B8];
  if (!self->_data)
  {
    id WeakRetained = objc_loadWeakRetained((id *)&self->_inspectedVC);
    v6 = (objc_class *)objc_opt_class();
    v7 = NSStringFromClass(v6);
    v8 = +[_UIDebuggingOverlayDetail detailWithTitle:@"Class" detail:v7];

    id v9 = objc_loadWeakRetained((id *)&self->_inspectedVC);
    v10 = [v9 view];
    v11 = (objc_class *)objc_opt_class();
    v12 = NSStringFromClass(v11);
    v13 = +[_UIDebuggingOverlayDetail detailWithTitle:@"View" detail:v12];

    v14 = +[_UIDebuggingOverlayDetail detailWithTitle:@"Presenting" detail:@"None"];
    v15 = +[_UIDebuggingOverlayDetail detailWithTitle:@"Presented" detail:@"None"];
    id v16 = objc_loadWeakRetained((id *)&self->_inspectedVC);
    unint64_t v17 = [v16 modalPresentationStyle] + 1;
    if (v17 > 9) {
      v18 = @"Unknown";
    }
    else {
      v18 = *(&off_1E530CB88 + v17);
    }
    v19 = +[_UIDebuggingOverlayDetail detailWithTitle:@"Modal" detail:v18];

    v20 = +[_UIDebuggingOverlayDetail detailWithTitle:@"iVar Description" detail:0];
    v39[0] = v8;
    v39[1] = v13;
    v39[2] = v14;
    v39[3] = v15;
    v39[4] = v19;
    v39[5] = v20;
    v21 = [MEMORY[0x1E4F1C978] arrayWithObjects:v39 count:6];
    data = self->_data;
    self->_data = v21;
  }
  uint64_t v23 = [(UIViewController *)self viewIfLoaded];
  if (v23)
  {
    v24 = (void *)v23;
    v25 = [(UIViewController *)self view];
    v26 = [v25 window];

    if (v26)
    {
      long long v36 = 0u;
      long long v37 = 0u;
      long long v34 = 0u;
      long long v35 = 0u;
      v27 = self->_data;
      uint64_t v28 = [(NSArray *)v27 countByEnumeratingWithState:&v34 objects:v38 count:16];
      if (v28)
      {
        uint64_t v29 = v28;
        uint64_t v30 = *(void *)v35;
        do
        {
          uint64_t v31 = 0;
          do
          {
            if (*(void *)v35 != v30) {
              objc_enumerationMutation(v27);
            }
            v32 = *(void **)(*((void *)&v34 + 1) + 8 * v31);
            id v33 = objc_loadWeakRetained((id *)&self->_inspectedVC);
            objc_msgSend(v32, "_updateForInspectedViewController:", v33, (void)v34);

            ++v31;
          }
          while (v29 != v31);
          uint64_t v29 = [(NSArray *)v27 countByEnumeratingWithState:&v34 objects:v38 count:16];
        }
        while (v29);
      }

      if (v3) {
        [(UITableView *)self->_tableView reloadData];
      }
    }
  }
}

- (void)tableView:(id)a3 didSelectRowAtIndexPath:(id)a4
{
  id v11 = a4;
  if ([v11 section])
  {
    v5 = objc_alloc_init(UIDebuggingInformationVCDetailViewController);
    v6 = [(UIDebuggingInformationVCDetailViewController *)self inspectedVC];
    v7 = [v6 childViewControllers];
    v8 = objc_msgSend(v7, "objectAtIndexedSubscript:", objc_msgSend(v11, "row"));
    [(UIDebuggingInformationVCDetailViewController *)v5 setInspectedVC:v8];
  }
  else
  {
    id v9 = -[NSArray objectAtIndexedSubscript:](self->_data, "objectAtIndexedSubscript:", [v11 row]);
    v5 = [v9 viewController];

    if (!v5) {
      goto LABEL_5;
    }
  }
  v10 = [(UIViewController *)self navigationController];
  [v10 pushViewController:v5 animated:1];

LABEL_5:
}

- (id)tableView:(id)a3 cellForRowAtIndexPath:(id)a4
{
  id v5 = a4;
  v6 = [[UITableViewCell alloc] initWithStyle:3 reuseIdentifier:@"kCellReuseIdentifierDetail"];
  v7 = -[NSArray objectAtIndexedSubscript:](self->_data, "objectAtIndexedSubscript:", [v5 row]);
  if ([v5 section])
  {
    v8 = [(UIDebuggingInformationVCDetailViewController *)self inspectedVC];
    id v9 = [v8 childViewControllers];
    v10 = objc_msgSend(v9, "objectAtIndexedSubscript:", objc_msgSend(v5, "row"));
    id v11 = (objc_class *)objc_opt_class();
    v12 = NSStringFromClass(v11);
    v13 = [(UITableViewCell *)v6 textLabel];
    [v13 setText:v12];

    [(UITableViewCell *)v6 setAccessoryType:1];
  }
  else
  {
    v14 = [v7 viewController];
    if (v14) {
      uint64_t v15 = 3;
    }
    else {
      uint64_t v15 = 0;
    }
    [(UITableViewCell *)v6 setSelectionStyle:v15];

    id v16 = [v7 viewController];
    [(UITableViewCell *)v6 setAccessoryType:v16 != 0];

    unint64_t v17 = [v7 title];
    v18 = [(UITableViewCell *)v6 textLabel];
    [v18 setText:v17];

    v19 = [v7 detail];
    v20 = [(UITableViewCell *)v6 detailTextLabel];
    [v20 setText:v19];
  }
  return v6;
}

- (int64_t)tableView:(id)a3 numberOfRowsInSection:(int64_t)a4
{
  [(UIDebuggingInformationVCDetailViewController *)self _updateDataAndReload:0];
  if (a4)
  {
    v6 = [(UIDebuggingInformationVCDetailViewController *)self inspectedVC];
    v7 = [v6 childViewControllers];
    int64_t v8 = [v7 count];

    return v8;
  }
  else
  {
    data = self->_data;
    return [(NSArray *)data count];
  }
}

- (id)tableView:(id)a3 titleForHeaderInSection:(int64_t)a4
{
  if (a4) {
    return @"Children";
  }
  else {
    return @"Info";
  }
}

- (int64_t)numberOfSectionsInTableView:(id)a3
{
  BOOL v3 = [(UIDebuggingInformationVCDetailViewController *)self inspectedVC];
  objc_super v4 = [v3 childViewControllers];
  if ([v4 count]) {
    int64_t v5 = 2;
  }
  else {
    int64_t v5 = 1;
  }

  return v5;
}

- (UIViewController)inspectedVC
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_inspectedVC);
  return (UIViewController *)WeakRetained;
}

- (void)setInspectedVC:(id)a3
{
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_inspectedVC);
  objc_storeStrong((id *)&self->_data, 0);
  objc_storeStrong((id *)&self->_tableView, 0);
}

@end