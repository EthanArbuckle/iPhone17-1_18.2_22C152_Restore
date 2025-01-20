@interface IMMenuViewController
- (NSArray)menuItems;
- (double)tableView:(id)a3 heightForRowAtIndexPath:(id)a4;
- (id)tableView:(id)a3 cellForRowAtIndexPath:(id)a4;
- (int64_t)tableView:(id)a3 numberOfRowsInSection:(int64_t)a4;
- (void)setMenuItems:(id)a3;
- (void)tableView:(id)a3 didSelectRowAtIndexPath:(id)a4;
- (void)tableView:(id)a3 willDisplayCell:(id)a4 forRowAtIndexPath:(id)a5;
- (void)updatePopoverSize;
- (void)viewDidLoad;
@end

@implementation IMMenuViewController

- (void)setMenuItems:(id)a3
{
  if (self->_menuItems != a3)
  {
    v4 = (NSArray *)[a3 copy];
    menuItems = self->_menuItems;
    self->_menuItems = v4;

    [(IMMenuViewController *)self updatePopoverSize];
    tableView = self->_tableView;
    [(UITableView *)tableView reloadData];
  }
}

- (void)viewDidLoad
{
  v29.receiver = self;
  v29.super_class = (Class)IMMenuViewController;
  [(IMMenuViewController *)&v29 viewDidLoad];
  v3 = [(IMMenuViewController *)self view];
  id v4 = objc_alloc((Class)UITableView);
  [v3 bounds];
  v5 = [v4 initWithFrame:];
  tableView = self->_tableView;
  self->_tableView = v5;

  [(UITableView *)self->_tableView setTranslatesAutoresizingMaskIntoConstraints:0];
  [(UITableView *)self->_tableView setDelegate:self];
  [(UITableView *)self->_tableView setDataSource:self];
  v7 = +[UIColor clearColor];
  [(UITableView *)self->_tableView setBackgroundColor:v7];

  [(UITableView *)self->_tableView setScrollEnabled:0];
  -[UITableView setSeparatorInset:](self->_tableView, "setSeparatorInset:", UIEdgeInsetsZero.top, UIEdgeInsetsZero.left, UIEdgeInsetsZero.bottom, UIEdgeInsetsZero.right);
  v22 = v3;
  [v3 addSubview:self->_tableView];
  v8 = [v3 safeAreaLayoutGuide];
  v27 = [(UITableView *)self->_tableView topAnchor];
  v26 = [v8 topAnchor];
  v25 = [v27 constraintEqualToAnchor:v26];
  v30[0] = v25;
  v24 = [(UITableView *)self->_tableView bottomAnchor];
  v23 = [v8 bottomAnchor];
  v21 = [v24 constraintEqualToAnchor:v23];
  v30[1] = v21;
  v9 = [(UITableView *)self->_tableView leadingAnchor];
  v28 = v8;
  v10 = [v8 leadingAnchor];
  v11 = [v9 constraintEqualToAnchor:v10];
  v30[2] = v11;
  v12 = [(UITableView *)self->_tableView trailingAnchor];
  v13 = [v8 trailingAnchor];
  v14 = [v12 constraintEqualToAnchor:v13];
  v30[3] = v14;
  v15 = +[NSArray arrayWithObjects:v30 count:4];
  [v22 addConstraints:v15];

  v16 = [(IMViewController *)self themePage];
  v17 = [v16 tintColor];
  [v22 setTintColor:v17];

  v18 = [v16 tableViewCellBackgroundColor];
  [v22 setBackgroundColor:v18];

  v19 = [v16 tableViewBackgroundColor];
  [(UITableView *)self->_tableView setBackgroundColor:v19];

  v20 = [v16 separatorColor];
  [(UITableView *)self->_tableView setSeparatorColor:v20];
}

- (int64_t)tableView:(id)a3 numberOfRowsInSection:(int64_t)a4
{
  id v4 = [(IMMenuViewController *)self menuItems];
  id v5 = [v4 count];

  return (int64_t)v5;
}

- (id)tableView:(id)a3 cellForRowAtIndexPath:(id)a4
{
  id v6 = a4;
  id v7 = [a3 dequeueReusableCellWithIdentifier:@"IMMenuViewControllerCellIdentifier"];
  if (!v7)
  {
    id v8 = [v6 row];
    v9 = [(IMMenuViewController *)self menuItems];
    id v10 = [v9 count];

    if (v8 >= v10) {
      goto LABEL_4;
    }
    v11 = [(IMMenuViewController *)self menuItems];
    v12 = [v11 objectAtIndex:[v6 row]];

    id v7 = [objc_alloc((Class)UITableViewCell) initWithStyle:0 reuseIdentifier:@"IMMenuViewControllerCellIdentifier"];
    v13 = [v12 title];
    v14 = [v7 textLabel];
    [v14 setText:v13];

    v15 = [v7 textLabel];
    [v15 setTextAlignment:1];

    v16 = [(IMViewController *)self themePage];
    v17 = [(IMMenuViewController *)self traitCollection];
    [v16 styleMenuCell:v7 withTraitCollection:v17];

    if (!v7) {
LABEL_4:
    }
      id v7 = [objc_alloc((Class)UITableViewCell) initWithStyle:0 reuseIdentifier:@"IMMenuViewControllerCellIdentifier"];
  }

  return v7;
}

- (double)tableView:(id)a3 heightForRowAtIndexPath:(id)a4
{
  return 45.0;
}

- (void)tableView:(id)a3 didSelectRowAtIndexPath:(id)a4
{
  id v12 = a4;
  id v5 = [v12 row];
  id v6 = [(IMMenuViewController *)self menuItems];
  id v7 = [v6 count];

  if (v5 < v7)
  {
    id v8 = [(IMMenuViewController *)self menuItems];
    v9 = [v8 objectAtIndex:[v12 row]];

    id v10 = [v9 target];
    if (v10 && [v9 action])
    {
      [v10 performSelector:[v9 action] withObject:0];
    }
    else
    {
      v11 = [v9 actionBlock];

      if (v11) {
        [v9 performActionBlock:0];
      }
    }
  }
}

- (void)tableView:(id)a3 willDisplayCell:(id)a4 forRowAtIndexPath:(id)a5
{
  id v6 = a4;
  id v8 = [(IMViewController *)self themePage];
  id v7 = [(IMMenuViewController *)self traitCollection];
  [v8 styleMenuCell:v6 withTraitCollection:v7];
}

- (void)updatePopoverSize
{
  if (isPad()) {
    double v3 = 332.0;
  }
  else {
    double v3 = 286.0;
  }
  id v4 = [(IMMenuViewController *)self menuItems];
  -[IMMenuViewController setPreferredContentSize:](self, "setPreferredContentSize:", v3, (double)(unint64_t)[v4 count] * 45.0 + -1.0);
}

- (NSArray)menuItems
{
  return self->_menuItems;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_tableView, 0);

  objc_storeStrong((id *)&self->_menuItems, 0);
}

@end