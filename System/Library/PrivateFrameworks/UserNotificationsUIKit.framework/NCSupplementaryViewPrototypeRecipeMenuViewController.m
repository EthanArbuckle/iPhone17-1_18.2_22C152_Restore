@interface NCSupplementaryViewPrototypeRecipeMenuViewController
- (NCSupplementaryViewPrototypeRecipeMenuViewController)init;
- (id)tableView:(id)a3 cellForRowAtIndexPath:(id)a4;
- (id)tableView:(id)a3 viewForHeaderInSection:(int64_t)a4;
- (int64_t)numberOfSectionsInTableView:(id)a3;
- (int64_t)tableView:(id)a3 numberOfRowsInSection:(int64_t)a4;
- (void)loadView;
- (void)tableView:(id)a3 didSelectRowAtIndexPath:(id)a4;
- (void)viewDidLoad;
@end

@implementation NCSupplementaryViewPrototypeRecipeMenuViewController

- (NCSupplementaryViewPrototypeRecipeMenuViewController)init
{
  v5.receiver = self;
  v5.super_class = (Class)NCSupplementaryViewPrototypeRecipeMenuViewController;
  v2 = [(NCSupplementaryViewPrototypeRecipeViewController *)&v5 init];
  v3 = v2;
  if (v2) {
    [(NCSupplementaryViewPrototypeRecipeViewController *)v2 updateConfiguration:&__block_literal_global_32];
  }
  return v3;
}

void __60__NCSupplementaryViewPrototypeRecipeMenuViewController_init__block_invoke(uint64_t a1, void *a2)
{
  v2 = (void *)MEMORY[0x1E4FB1618];
  id v3 = a2;
  id v5 = [v2 blackColor];
  v4 = [v5 colorWithAlphaComponent:0.4];
  [v3 setTintColor:v4];
}

- (void)loadView
{
  id v3 = (UITableView *)objc_alloc_init(MEMORY[0x1E4FB1D00]);
  tableView = self->_tableView;
  self->_tableView = v3;

  [(UITableView *)self->_tableView setDelegate:self];
  [(UITableView *)self->_tableView setDataSource:self];
  [(UITableView *)self->_tableView setAllowsSelection:1];
  [(UITableView *)self->_tableView setScrollEnabled:0];
  id v5 = self->_tableView;

  [(NCSupplementaryViewPrototypeRecipeMenuViewController *)self setView:v5];
}

- (void)viewDidLoad
{
  v6[4] = *MEMORY[0x1E4F143B8];
  v5.receiver = self;
  v5.super_class = (Class)NCSupplementaryViewPrototypeRecipeMenuViewController;
  [(NCSupplementaryViewPrototypeRecipeViewController *)&v5 viewDidLoad];
  v6[0] = objc_opt_class();
  v6[1] = objc_opt_class();
  v6[2] = objc_opt_class();
  v6[3] = objc_opt_class();
  id v3 = [MEMORY[0x1E4F1C978] arrayWithObjects:v6 count:4];
  viewControllers = self->_viewControllers;
  self->_viewControllers = v3;
}

- (id)tableView:(id)a3 cellForRowAtIndexPath:(id)a4
{
  id v6 = a4;
  v7 = [a3 dequeueReusableCellWithIdentifier:@"cell"];
  if (!v7)
  {
    v7 = (void *)[objc_alloc(MEMORY[0x1E4FB1D08]) initWithStyle:0 reuseIdentifier:@"cell"];
    [v7 setSelectionStyle:0];
  }
  v8 = objc_msgSend(-[NSArray objectAtIndex:](self->_viewControllers, "objectAtIndex:", objc_msgSend(v6, "row")), "title");
  v9 = [MEMORY[0x1E4FB1618] clearColor];
  [v7 setBackgroundColor:v9];

  v10 = [v7 textLabel];
  [v10 setText:v8];

  v11 = [v7 textLabel];
  v12 = [(NCSupplementaryViewPrototypeRecipeViewController *)self configuration];
  v13 = [v12 textColor];
  [v11 setTextColor:v13];

  return v7;
}

- (id)tableView:(id)a3 viewForHeaderInSection:(int64_t)a4
{
  objc_super v5 = [(UITableView *)self->_tableView dequeueReusableHeaderFooterViewWithIdentifier:@"header", a4];
  if (!v5) {
    objc_super v5 = (void *)[objc_alloc(MEMORY[0x1E4FB1D30]) initWithReuseIdentifier:@"header"];
  }
  id v6 = [v5 textLabel];
  [v6 setText:@"Supplementary Prototype Options"];

  v7 = [v5 textLabel];
  v8 = [(NCSupplementaryViewPrototypeRecipeViewController *)self configuration];
  v9 = [v8 textColor];
  [v7 setTextColor:v9];

  return v5;
}

- (void)tableView:(id)a3 didSelectRowAtIndexPath:(id)a4
{
  id v5 = a4;
  id v9 = [(NCSupplementaryViewPrototypeRecipeViewController *)self delegate];
  viewControllers = self->_viewControllers;
  uint64_t v7 = [v5 row];

  id v8 = objc_alloc_init((Class)[(NSArray *)viewControllers objectAtIndex:v7]);
  [v8 setDelegate:v9];
  [v9 requestsInsertForPrototypeRecipeViewController:v8];
  [v9 notificationListBaseComponentDidSignificantUserInteraction:self];
}

- (int64_t)numberOfSectionsInTableView:(id)a3
{
  return 1;
}

- (int64_t)tableView:(id)a3 numberOfRowsInSection:(int64_t)a4
{
  return [(NSArray *)self->_viewControllers count];
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_viewControllers, 0);

  objc_storeStrong((id *)&self->_tableView, 0);
}

@end