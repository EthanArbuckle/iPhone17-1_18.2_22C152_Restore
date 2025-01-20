@interface _NCSupplementaryViewPrototypeSortingExampleViewController
- (id)_dateModifiedText;
- (id)_titleText;
- (id)tableView:(id)a3 cellForRowAtIndexPath:(id)a4;
- (id)tableView:(id)a3 viewForHeaderInSection:(int64_t)a4;
- (id)tableView:(id)a3 willSelectRowAtIndexPath:(id)a4;
- (int64_t)numberOfSectionsInTableView:(id)a3;
- (int64_t)tableView:(id)a3 numberOfRowsInSection:(int64_t)a4;
- (void)_updatedDateModified;
- (void)loadView;
- (void)setDateModified:(id)a3;
- (void)setTitle:(id)a3;
- (void)tableView:(id)a3 didSelectRowAtIndexPath:(id)a4;
@end

@implementation _NCSupplementaryViewPrototypeSortingExampleViewController

- (void)setTitle:(id)a3
{
  v7.receiver = self;
  v7.super_class = (Class)_NCSupplementaryViewPrototypeSortingExampleViewController;
  [(_NCSupplementaryViewPrototypeSortingExampleViewController *)&v7 setTitle:a3];
  v4 = [(UITableView *)self->_tableView headerViewForSection:0];
  v5 = [v4 textLabel];
  v6 = [(_NCSupplementaryViewPrototypeSortingExampleViewController *)self _titleText];
  [v5 setText:v6];
}

- (void)setDateModified:(id)a3
{
  v9.receiver = self;
  v9.super_class = (Class)_NCSupplementaryViewPrototypeSortingExampleViewController;
  [(NCSupplementaryViewPrototypeRecipeViewController *)&v9 setDateModified:a3];
  tableView = self->_tableView;
  v5 = [MEMORY[0x1E4F28D58] indexPathForRow:0 inSection:0];
  v6 = [(UITableView *)tableView cellForRowAtIndexPath:v5];
  objc_super v7 = [v6 textLabel];
  v8 = [(_NCSupplementaryViewPrototypeSortingExampleViewController *)self _dateModifiedText];
  [v7 setText:v8];
}

- (void)loadView
{
  v3 = (UITableView *)objc_alloc_init(MEMORY[0x1E4FB1D00]);
  tableView = self->_tableView;
  self->_tableView = v3;

  [(UITableView *)self->_tableView setDelegate:self];
  [(UITableView *)self->_tableView setDataSource:self];
  [(UITableView *)self->_tableView setScrollEnabled:0];
  [(UITableView *)self->_tableView setAllowsSelection:1];
  v5 = self->_tableView;

  [(_NCSupplementaryViewPrototypeSortingExampleViewController *)self setView:v5];
}

- (int64_t)numberOfSectionsInTableView:(id)a3
{
  return 1;
}

- (int64_t)tableView:(id)a3 numberOfRowsInSection:(int64_t)a4
{
  return 3;
}

- (id)tableView:(id)a3 cellForRowAtIndexPath:(id)a4
{
  id v6 = a4;
  objc_super v7 = [a3 dequeueReusableCellWithIdentifier:@"cell"];
  v8 = [MEMORY[0x1E4FB1618] clearColor];
  [v7 setBackgroundColor:v8];

  if (!v7)
  {
    objc_super v7 = (void *)[objc_alloc(MEMORY[0x1E4FB1D08]) initWithStyle:0 reuseIdentifier:@"cell"];
    [v7 setSelectionStyle:0];
    objc_super v9 = [MEMORY[0x1E4FB1618] clearColor];
    [v7 setBackgroundColor:v9];
  }
  uint64_t v10 = [v6 row];
  if (v10 == 2)
  {
    v11 = @"Tap to update after 3 seconds";
  }
  else if (v10 == 1)
  {
    v11 = @"Tap to update";
  }
  else if (v10)
  {
    v11 = 0;
  }
  else
  {
    v11 = [(_NCSupplementaryViewPrototypeSortingExampleViewController *)self _dateModifiedText];
  }
  v12 = [v7 textLabel];
  [v12 setText:v11];

  return v7;
}

- (id)tableView:(id)a3 viewForHeaderInSection:(int64_t)a4
{
  v5 = objc_msgSend(a3, "dequeueReusableHeaderFooterViewWithIdentifier:", @"header", a4);
  id v6 = v5;
  if (v5) {
    id v7 = v5;
  }
  else {
    id v7 = (id)[objc_alloc(MEMORY[0x1E4FB1D30]) initWithReuseIdentifier:@"header"];
  }
  v8 = v7;

  objc_super v9 = [v8 textLabel];
  uint64_t v10 = [(_NCSupplementaryViewPrototypeSortingExampleViewController *)self _titleText];
  [v9 setText:v10];

  return v8;
}

- (void)tableView:(id)a3 didSelectRowAtIndexPath:(id)a4
{
  uint64_t v5 = objc_msgSend(a4, "row", a3);
  if (v5 == 2)
  {
    objc_initWeak(&location, self);
    dispatch_time_t v6 = dispatch_time(0, 3000000000);
    uint64_t v8 = MEMORY[0x1E4F143A8];
    uint64_t v9 = 3221225472;
    uint64_t v10 = __95___NCSupplementaryViewPrototypeSortingExampleViewController_tableView_didSelectRowAtIndexPath___block_invoke;
    v11 = &unk_1E6A919A0;
    objc_copyWeak(&v12, &location);
    dispatch_after(v6, MEMORY[0x1E4F14428], &v8);
    objc_destroyWeak(&v12);
    objc_destroyWeak(&location);
  }
  else if (v5 == 1)
  {
    [(_NCSupplementaryViewPrototypeSortingExampleViewController *)self _updatedDateModified];
  }
  id v7 = [(NCSupplementaryViewPrototypeRecipeViewController *)self delegate];
  [v7 notificationListBaseComponentDidSignificantUserInteraction:self];
}

- (id)tableView:(id)a3 willSelectRowAtIndexPath:(id)a4
{
  id v4 = a4;
  if ([v4 row] == 1 || objc_msgSend(v4, "row") == 2) {
    uint64_t v5 = v4;
  }
  else {
    uint64_t v5 = 0;
  }
  id v6 = v5;

  return v6;
}

- (void)_updatedDateModified
{
  v3 = [MEMORY[0x1E4F1C9C8] now];
  [(_NCSupplementaryViewPrototypeSortingExampleViewController *)self setDateModified:v3];

  id v4 = [(NCSupplementaryViewPrototypeRecipeViewController *)self delegate];
  [v4 requestsUpdatePositionIfNeededForPrototypeRecipeViewController:self];
}

- (id)_dateModifiedText
{
  id v3 = objc_alloc_init(MEMORY[0x1E4F28C10]);
  [v3 setDateFormat:@"HH:mm:ss.SSS"];
  id v4 = [(NCSupplementaryViewPrototypeRecipeViewController *)self dateModified];
  uint64_t v5 = [v3 stringFromDate:v4];

  id v6 = [NSString stringWithFormat:@"Last modified: %@", v5];

  return v6;
}

- (id)_titleText
{
  id v3 = NSString;
  id v4 = [(NCSupplementaryViewPrototypeRecipeViewController *)self configuration];
  uint64_t v5 = [v4 groupingIdentifier];
  id v6 = [(_NCSupplementaryViewPrototypeSortingExampleViewController *)self title];
  id v7 = [v3 stringWithFormat:@"%@ %@", v5, v6];

  return v7;
}

- (void).cxx_destruct
{
}

@end