@interface SUMenuViewController
- (BOOL)_sendDidCancel;
- (BOOL)isMenuItemEnabledAtIndex:(int64_t)a3;
- (CGSize)maximumViewSize;
- (CGSize)minimumViewSize;
- (SUMenuViewController)init;
- (SUMenuViewControllerDelegate)delegate;
- (id)_tableView;
- (id)tableView:(id)a3 cellForRowAtIndexPath:(id)a4;
- (id)titleOfMenuItemAtIndex:(int64_t)a3;
- (int64_t)numberOfMenuItems;
- (int64_t)selectedIndex;
- (void)dealloc;
- (void)loadView;
- (void)performActionForMenuItemAtIndex:(int64_t)a3;
- (void)reload;
- (void)setDelegate:(id)a3;
- (void)setSelectedIndex:(int64_t)a3;
- (void)tableView:(id)a3 didSelectRowAtIndexPath:(id)a4;
- (void)viewDidAppear:(BOOL)a3;
@end

@implementation SUMenuViewController

- (SUMenuViewController)init
{
  v3.receiver = self;
  v3.super_class = (Class)SUMenuViewController;
  result = [(SUViewController *)&v3 init];
  if (result) {
    result->_selectedIndex = -1;
  }
  return result;
}

- (void)dealloc
{
  [(UITableView *)self->_tableView setDataSource:0];
  [(UITableView *)self->_tableView setDelegate:0];

  v3.receiver = self;
  v3.super_class = (Class)SUMenuViewController;
  [(SUViewController *)&v3 dealloc];
}

- (BOOL)isMenuItemEnabledAtIndex:(int64_t)a3
{
  return 1;
}

- (int64_t)numberOfMenuItems
{
  return 0;
}

- (void)performActionForMenuItemAtIndex:(int64_t)a3
{
  if (objc_opt_respondsToSelector())
  {
    v5 = self;
    delegate = self->_delegate;
    [(SUMenuViewControllerDelegate *)delegate menuViewController:self didSelectItemAtIndex:a3];
  }
  else
  {
    [(UIViewController *)self dismissAnimated:1];
  }
}

- (void)setSelectedIndex:(int64_t)a3
{
  if (self->_selectedIndex != a3)
  {
    self->_selectedIndex = a3;
    [(SUMenuViewController *)self reload];
  }
}

- (id)titleOfMenuItemAtIndex:(int64_t)a3
{
  return 0;
}

- (void)loadView
{
  [(SUMenuViewController *)self setView:[(SUMenuViewController *)self _tableView]];

  [(SUMenuViewController *)self reload];
}

- (CGSize)maximumViewSize
{
  [(SUMenuViewController *)self view];
  [(UITableView *)self->_tableView rowHeight];
  double v4 = v3 * 15.0;
  double v5 = 0.0;
  result.height = v4;
  result.width = v5;
  return result;
}

- (CGSize)minimumViewSize
{
  uint64_t v3 = [(SUMenuViewController *)self numberOfMenuItems];
  if (v3 <= 5) {
    uint64_t v4 = 5;
  }
  else {
    uint64_t v4 = v3;
  }
  [(SUMenuViewController *)self view];
  [(UITableView *)self->_tableView rowHeight];
  double v6 = v5 * (double)v4;
  double v7 = 0.0;
  result.height = v6;
  result.width = v7;
  return result;
}

- (void)reload
{
  [(UITableView *)self->_tableView reloadData];
  [(SUViewController *)self reloadContentSizeForViewInPopover];
  v3.receiver = self;
  v3.super_class = (Class)SUMenuViewController;
  [(SUViewController *)&v3 reload];
}

- (void)viewDidAppear:(BOOL)a3
{
  BOOL v3 = a3;
  [(UITableView *)self->_tableView flashScrollIndicators];
  v5.receiver = self;
  v5.super_class = (Class)SUMenuViewController;
  [(SUViewController *)&v5 viewDidAppear:v3];
}

- (void)tableView:(id)a3 didSelectRowAtIndexPath:(id)a4
{
  -[SUMenuViewController setSelectedIndex:](self, "setSelectedIndex:", objc_msgSend(a4, "row", a3));
  uint64_t v6 = [a4 row];

  [(SUMenuViewController *)self performActionForMenuItemAtIndex:v6];
}

- (id)tableView:(id)a3 cellForRowAtIndexPath:(id)a4
{
  uint64_t v6 = [a4 row];
  id v7 = (id)[a3 dequeueReusableCellWithIdentifier:@"i"];
  if (!v7) {
    id v7 = (id)[objc_alloc(MEMORY[0x263F1CA48]) initWithStyle:0 reuseIdentifier:@"i"];
  }
  if (v6 == self->_selectedIndex) {
    uint64_t v8 = 3;
  }
  else {
    uint64_t v8 = 0;
  }
  [v7 setAccessoryType:v8];
  v9 = (void *)[v7 textLabel];
  objc_msgSend(v9, "setText:", -[SUMenuViewController titleOfMenuItemAtIndex:](self, "titleOfMenuItemAtIndex:", v6));
  BOOL v10 = [(SUMenuViewController *)self isMenuItemEnabledAtIndex:v6];
  [v9 setEnabled:v10];
  [v7 setUserInteractionEnabled:v10];
  return v7;
}

- (BOOL)_sendDidCancel
{
  char v3 = objc_opt_respondsToSelector();
  if (v3)
  {
    uint64_t v4 = self;
    [(SUMenuViewControllerDelegate *)self->_delegate menuViewControllerDidCancel:self];
  }
  return v3 & 1;
}

- (id)_tableView
{
  id result = self->_tableView;
  if (!result)
  {
    uint64_t v4 = (UITableView *)objc_alloc_init(MEMORY[0x263F1CA40]);
    self->_tableView = v4;
    [(UITableView *)v4 setAutoresizingMask:18];
    [(UITableView *)self->_tableView setDataSource:self];
    [(UITableView *)self->_tableView setDelegate:self];
    return self->_tableView;
  }
  return result;
}

- (SUMenuViewControllerDelegate)delegate
{
  return self->_delegate;
}

- (void)setDelegate:(id)a3
{
  self->_delegate = (SUMenuViewControllerDelegate *)a3;
}

- (int64_t)selectedIndex
{
  return self->_selectedIndex;
}

@end