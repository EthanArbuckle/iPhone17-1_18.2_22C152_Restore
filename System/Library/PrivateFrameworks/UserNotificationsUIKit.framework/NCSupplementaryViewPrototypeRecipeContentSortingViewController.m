@interface NCSupplementaryViewPrototypeRecipeContentSortingViewController
+ (id)title;
- (NCSupplementaryViewPrototypeRecipeContentSortingViewController)init;
- (id)_colorForSection:(unint64_t)a3 index:(unint64_t)a4;
- (id)_groupingIdentifierForSection:(unint64_t)a3;
- (id)tableView:(id)a3 cellForRowAtIndexPath:(id)a4;
- (id)tableView:(id)a3 viewForHeaderInSection:(int64_t)a4;
- (int64_t)numberOfSectionsInTableView:(id)a3;
- (int64_t)tableView:(id)a3 numberOfRowsInSection:(int64_t)a4;
- (void)loadView;
- (void)tableView:(id)a3 didSelectRowAtIndexPath:(id)a4;
@end

@implementation NCSupplementaryViewPrototypeRecipeContentSortingViewController

+ (id)title
{
  return @"Sorting";
}

- (NCSupplementaryViewPrototypeRecipeContentSortingViewController)init
{
  v22[5] = *MEMORY[0x1E4F143B8];
  v16.receiver = self;
  v16.super_class = (Class)NCSupplementaryViewPrototypeRecipeContentSortingViewController;
  v2 = [(NCSupplementaryViewPrototypeRecipeViewController *)&v16 init];
  if (v2)
  {
    v21[0] = @"com.apple.ClockAngel";
    v15 = [MEMORY[0x1E4FB1618] systemMintColor];
    v21[1] = v15;
    v14 = [MEMORY[0x1E4F1C978] arrayWithObjects:v21 count:2];
    v22[0] = v14;
    v20[0] = @"com.apple.mediaremote";
    v3 = [MEMORY[0x1E4FB1618] systemCyanColor];
    v20[1] = v3;
    v4 = [MEMORY[0x1E4F1C978] arrayWithObjects:v20 count:2];
    v22[1] = v4;
    v19[0] = @"com.example.live-activity-1";
    v5 = [MEMORY[0x1E4FB1618] systemOrangeColor];
    v19[1] = v5;
    v6 = [MEMORY[0x1E4F1C978] arrayWithObjects:v19 count:2];
    v22[2] = v6;
    v18[0] = @"com.example.live-activity-2";
    v7 = [MEMORY[0x1E4FB1618] systemPurpleColor];
    v18[1] = v7;
    v8 = [MEMORY[0x1E4F1C978] arrayWithObjects:v18 count:2];
    v22[3] = v8;
    v17[0] = @"com.example.live-activity-3";
    v9 = [MEMORY[0x1E4FB1618] grayColor];
    v17[1] = v9;
    v10 = [MEMORY[0x1E4F1C978] arrayWithObjects:v17 count:2];
    v22[4] = v10;
    uint64_t v11 = [MEMORY[0x1E4F1C978] arrayWithObjects:v22 count:5];
    exampleGroupIdentifiersAndBaseColors = v2->_exampleGroupIdentifiersAndBaseColors;
    v2->_exampleGroupIdentifiersAndBaseColors = (NSArray *)v11;

    [(NCSupplementaryViewPrototypeRecipeViewController *)v2 updateConfiguration:&__block_literal_global_429];
  }
  return v2;
}

void __70__NCSupplementaryViewPrototypeRecipeContentSortingViewController_init__block_invoke(uint64_t a1, void *a2)
{
  v2 = (void *)MEMORY[0x1E4FB1618];
  id v3 = a2;
  id v5 = [v2 greenColor];
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
  [(UITableView *)self->_tableView setScrollEnabled:0];
  [(UITableView *)self->_tableView setAllowsSelection:1];
  id v5 = self->_tableView;

  [(NCSupplementaryViewPrototypeRecipeContentSortingViewController *)self setView:v5];
}

- (int64_t)numberOfSectionsInTableView:(id)a3
{
  return 1;
}

- (int64_t)tableView:(id)a3 numberOfRowsInSection:(int64_t)a4
{
  return [(NSArray *)self->_exampleGroupIdentifiersAndBaseColors count];
}

- (id)tableView:(id)a3 cellForRowAtIndexPath:(id)a4
{
  id v6 = a4;
  v7 = [a3 dequeueReusableCellWithIdentifier:@"cell"];
  v8 = [MEMORY[0x1E4FB1618] clearColor];
  [v7 setBackgroundColor:v8];

  if (!v7)
  {
    v7 = (void *)[objc_alloc(MEMORY[0x1E4FB1D08]) initWithStyle:0 reuseIdentifier:@"cell"];
    [v7 setSelectionStyle:0];
    v9 = [MEMORY[0x1E4FB1618] clearColor];
    [v7 setBackgroundColor:v9];
  }
  v10 = NSString;
  uint64_t v11 = -[NCSupplementaryViewPrototypeRecipeContentSortingViewController _groupingIdentifierForSection:](self, "_groupingIdentifierForSection:", [v6 row]);
  v12 = [v10 stringWithFormat:@"Add %@", v11];

  v13 = [v7 textLabel];
  [v13 setText:v12];

  return v7;
}

- (id)tableView:(id)a3 viewForHeaderInSection:(int64_t)a4
{
  v4 = objc_msgSend(a3, "dequeueReusableHeaderFooterViewWithIdentifier:", @"header", a4);
  id v5 = v4;
  if (v4) {
    id v6 = v4;
  }
  else {
    id v6 = (id)[objc_alloc(MEMORY[0x1E4FB1D30]) initWithReuseIdentifier:@"header"];
  }
  v7 = v6;

  v8 = [v7 textLabel];
  v9 = [NSString stringWithFormat:@"Sorting Configuration Menu"];
  [v8 setText:v9];

  return v7;
}

- (void)tableView:(id)a3 didSelectRowAtIndexPath:(id)a4
{
  id v5 = a4;
  id v6 = objc_alloc_init(_NCSupplementaryViewPrototypeSortingExampleViewController);
  v7 = [(NCSupplementaryViewPrototypeRecipeViewController *)self delegate];
  v8 = -[NCSupplementaryViewPrototypeRecipeContentSortingViewController _groupingIdentifierForSection:](self, "_groupingIdentifierForSection:", [v5 row]);
  uint64_t v9 = [v7 prototypeRecipeViewController:self requestsCountForGroupWithIdentifier:v8];
  uint64_t v13 = MEMORY[0x1E4F143A8];
  uint64_t v14 = 3221225472;
  v15 = __100__NCSupplementaryViewPrototypeRecipeContentSortingViewController_tableView_didSelectRowAtIndexPath___block_invoke;
  objc_super v16 = &unk_1E6A95088;
  id v17 = v8;
  v18 = self;
  id v19 = v5;
  uint64_t v20 = v9;
  id v10 = v5;
  id v11 = v8;
  [(NCSupplementaryViewPrototypeRecipeViewController *)v6 updateConfiguration:&v13];
  v12 = [NSString stringWithFormat:@"Number:%lu\n%@", v9, v11, v13, v14, v15, v16];
  [(_NCSupplementaryViewPrototypeSortingExampleViewController *)v6 setTitle:v12];
  [(NCSupplementaryViewPrototypeRecipeViewController *)v6 setDelegate:v7];
  [v7 requestsInsertForPrototypeRecipeViewController:v6];
  [v7 notificationListBaseComponentDidSignificantUserInteraction:self];
}

void __100__NCSupplementaryViewPrototypeRecipeContentSortingViewController_tableView_didSelectRowAtIndexPath___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v3 = *(void *)(a1 + 32);
  id v4 = a2;
  [v4 setGroupingIdentifier:v3];
  [v4 setGroupName:*(void *)(a1 + 32)];
  objc_msgSend(*(id *)(a1 + 40), "_colorForSection:index:", objc_msgSend(*(id *)(a1 + 48), "row"), *(void *)(a1 + 56));
  id v5 = (id)objc_claimAutoreleasedReturnValue();
  [v4 setTintColor:v5];
}

- (id)_groupingIdentifierForSection:(unint64_t)a3
{
  uint64_t v3 = [(NSArray *)self->_exampleGroupIdentifiersAndBaseColors objectAtIndex:a3];
  id v4 = [v3 objectAtIndex:0];

  return v4;
}

- (id)_colorForSection:(unint64_t)a3 index:(unint64_t)a4
{
  id v5 = [(NSArray *)self->_exampleGroupIdentifiersAndBaseColors objectAtIndex:a3];
  id v6 = [v5 objectAtIndex:1];

  double v12 = 0.0;
  double v13 = 0.0;
  uint64_t v10 = 0;
  uint64_t v11 = 0;
  [v6 getHue:&v13 saturation:&v12 brightness:&v11 alpha:&v10];
  double v7 = ((double)(arc4random() % 0xA) / 10.0 + 0.1) * (double)(a4 + 1);
  double v12 = vabdd_f64(v12, v7);
  double v13 = vabdd_f64(v13, v7);
  v8 = objc_msgSend(MEMORY[0x1E4FB1618], "colorWithHue:saturation:brightness:alpha:");

  return v8;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_exampleGroupIdentifiersAndBaseColors, 0);

  objc_storeStrong((id *)&self->_tableView, 0);
}

@end