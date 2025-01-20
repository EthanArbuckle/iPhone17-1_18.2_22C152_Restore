@interface UIExpandedBarItemsTableViewController
- (CGSize)preferredContentSize;
- (UIBarButtonItemGroup)barButtonGroup;
- (UIExpandedBarItemsTableViewController)initWithBarButtonGroup:(id)a3;
- (double)tableView:(id)a3 heightForRowAtIndexPath:(id)a4;
- (id)_displayTitleForBarButtonItem:(id)a3;
- (id)_visibleItems;
- (id)tableView:(id)a3 cellForRowAtIndexPath:(id)a4;
- (int64_t)numberOfSectionsInTableView:(id)a3;
- (unint64_t)_numberOfItems;
- (void)tableView:(id)a3 didSelectRowAtIndexPath:(id)a4;
- (void)viewDidLoad;
- (void)viewWillAppear:(BOOL)a3;
@end

@implementation UIExpandedBarItemsTableViewController

- (UIExpandedBarItemsTableViewController)initWithBarButtonGroup:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)UIExpandedBarItemsTableViewController;
  v6 = [(UITableViewController *)&v9 initWithStyle:0];
  v7 = v6;
  if (v6) {
    objc_storeStrong((id *)&v6->_barButtonGroup, a3);
  }

  return v7;
}

- (void)viewDidLoad
{
  v5.receiver = self;
  v5.super_class = (Class)UIExpandedBarItemsTableViewController;
  [(UIViewController *)&v5 viewDidLoad];
  v3 = [(UITableViewController *)self tableView];
  [v3 setAlwaysBounceVertical:0];

  v4 = [(UITableViewController *)self tableView];
  [v4 registerClass:objc_opt_class() forCellReuseIdentifier:@"baritemcell"];
}

- (void)viewWillAppear:(BOOL)a3
{
  v5.receiver = self;
  v5.super_class = (Class)UIExpandedBarItemsTableViewController;
  [(UITableViewController *)&v5 viewWillAppear:a3];
  v4 = [(UIExpandedBarItemsTableViewController *)self barButtonGroup];
  [v4 _validateAllItems];
}

- (id)_visibleItems
{
  v2 = [(UIBarButtonItemGroup *)self->_barButtonGroup barButtonItems];
  v3 = [MEMORY[0x1E4F28F60] predicateWithFormat:@"hidden == NO"];
  v4 = [v2 filteredArrayUsingPredicate:v3];

  return v4;
}

- (unint64_t)_numberOfItems
{
  v2 = [(UIExpandedBarItemsTableViewController *)self _visibleItems];
  unint64_t v3 = [v2 count];

  return v3;
}

- (id)_displayTitleForBarButtonItem:(id)a3
{
  id v3 = a3;
  v4 = [v3 title];

  if (v4)
  {
    uint64_t v5 = [v3 title];
LABEL_3:
    v6 = (__CFString *)v5;
    goto LABEL_7;
  }
  v7 = [v3 possibleTitles];
  uint64_t v8 = [v7 count];

  if (v8)
  {
    objc_super v9 = [v3 possibleTitles];
    uint64_t v10 = [v9 anyObject];
LABEL_6:
    v6 = (__CFString *)v10;

    goto LABEL_7;
  }
  v12 = [v3 accessibilityLabel];

  if (v12)
  {
    uint64_t v5 = [v3 accessibilityLabel];
    goto LABEL_3;
  }
  if (os_variant_has_internal_diagnostics())
  {
    v13 = NSString;
    objc_super v9 = NSStringFromSelector((SEL)[v3 action]);
    uint64_t v10 = [v13 stringWithFormat:@"NEEDS TITLE: %@", v9];
    goto LABEL_6;
  }
  v6 = &stru_1ED0E84C0;
LABEL_7:

  return v6;
}

- (CGSize)preferredContentSize
{
  uint64_t v29 = *MEMORY[0x1E4F143B8];
  id v3 = +[UILabel defaultFont];
  long long v22 = 0u;
  long long v23 = 0u;
  long long v24 = 0u;
  long long v25 = 0u;
  v4 = [(UIBarButtonItemGroup *)self->_barButtonGroup barButtonItems];
  uint64_t v5 = [v4 countByEnumeratingWithState:&v22 objects:v28 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v23;
    uint64_t v8 = *(void *)off_1E52D2040;
    double v9 = 180.0;
    do
    {
      for (uint64_t i = 0; i != v6; ++i)
      {
        if (*(void *)v23 != v7) {
          objc_enumerationMutation(v4);
        }
        v11 = [(UIExpandedBarItemsTableViewController *)self _displayTitleForBarButtonItem:*(void *)(*((void *)&v22 + 1) + 8 * i)];
        uint64_t v26 = v8;
        v27 = v3;
        v12 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v27 forKeys:&v26 count:1];
        [v11 sizeWithAttributes:v12];
        double v14 = v13;

        if (v14 + 45.0 + 20.0 > v9) {
          double v9 = v14 + 45.0 + 20.0;
        }
      }
      uint64_t v6 = [v4 countByEnumeratingWithState:&v22 objects:v28 count:16];
    }
    while (v6);
  }
  else
  {
    double v9 = 180.0;
  }

  v15 = +[UIKeyboardSceneDelegate activeKeyboardSceneDelegate];
  v16 = [v15 keyboardWindow];

  if (v16)
  {
    [v16 bounds];
    if (v9 > v17)
    {
      [v16 bounds];
      double v9 = v18;
    }
  }
  unint64_t v19 = [(UIExpandedBarItemsTableViewController *)self _numberOfItems];

  double v20 = (double)v19 * 55.0;
  double v21 = v9;
  result.height = v20;
  result.width = v21;
  return result;
}

- (int64_t)numberOfSectionsInTableView:(id)a3
{
  return 1;
}

- (double)tableView:(id)a3 heightForRowAtIndexPath:(id)a4
{
  return 55.0;
}

- (id)tableView:(id)a3 cellForRowAtIndexPath:(id)a4
{
  id v6 = a4;
  uint64_t v7 = [a3 dequeueReusableCellWithIdentifier:@"baritemcell" forIndexPath:v6];
  uint64_t v8 = [(UIExpandedBarItemsTableViewController *)self _visibleItems];
  uint64_t v9 = [v6 row];

  uint64_t v10 = [v8 objectAtIndex:v9];

  v11 = [(UIExpandedBarItemsTableViewController *)self _displayTitleForBarButtonItem:v10];
  v12 = [v7 textLabel];
  [v12 setText:v11];

  double v13 = [v10 image];
  double v14 = [v7 imageView];
  [v14 setImage:v13];

  if ([v10 isEnabled])
  {
    [v7 setSelectionStyle:3];
    v15 = [v7 contentView];
    v16 = v15;
    double v17 = 1.0;
  }
  else
  {
    [v7 setSelectionStyle:0];
    v15 = [v7 contentView];
    v16 = v15;
    double v17 = 0.25;
  }
  [v15 setAlpha:v17];

  return v7;
}

- (void)tableView:(id)a3 didSelectRowAtIndexPath:(id)a4
{
  id v5 = a4;
  id v6 = [(UIExpandedBarItemsTableViewController *)self _visibleItems];
  uint64_t v7 = [v5 row];

  uint64_t v8 = [v6 objectAtIndex:v7];

  uint64_t v14 = MEMORY[0x1E4F143A8];
  uint64_t v15 = 3221225472;
  v16 = __75__UIExpandedBarItemsTableViewController_tableView_didSelectRowAtIndexPath___block_invoke;
  double v17 = &unk_1E52D9F98;
  id v9 = v8;
  id v18 = v9;
  unint64_t v19 = self;
  uint64_t v10 = (void (**)(void))_Block_copy(&v14);
  objc_msgSend(v9, "buttonGroup", v14, v15, v16, v17);
  v11 = (unsigned char *)objc_claimAutoreleasedReturnValue();
  if (v11)
  {
    char v12 = v11[24];

    double v13 = v10;
    if ((v12 & 4) != 0)
    {
      v10[2](v10);
      double v13 = 0;
    }
  }
  else
  {
    double v13 = v10;
  }
  [(UIViewController *)self dismissViewControllerAnimated:1 completion:v13];
}

void __75__UIExpandedBarItemsTableViewController_tableView_didSelectRowAtIndexPath___block_invoke(uint64_t a1)
{
  if ([*(id *)(a1 + 32) action])
  {
    v2 = [*(id *)(a1 + 32) target];

    if (v2)
    {
      id v3 = (void *)UIApp;
      uint64_t v4 = [*(id *)(a1 + 32) action];
      id v7 = [*(id *)(a1 + 32) target];
      id v5 = [*(id *)(a1 + 40) barButtonGroup];
      id v6 = [v5 representativeItem];
      [v3 sendAction:v4 to:v7 from:v6 forEvent:0];
    }
  }
}

- (UIBarButtonItemGroup)barButtonGroup
{
  return self->_barButtonGroup;
}

- (void).cxx_destruct
{
}

@end