@interface STIntroAppLimitsTableViewController
- (BOOL)showingAllCategories;
- (BOOL)showingDatePicker;
- (NSDateComponentsFormatter)timeAmountFormatter;
- (STAllowance)allowance;
- (STIntroAppLimitsTableViewController)initWithCoder:(id)a3;
- (STIntroAppLimitsTableViewController)initWithNibName:(id)a3 bundle:(id)a4;
- (STIntroAppLimitsTableViewController)initWithStyle:(int64_t)a3;
- (double)tableView:(id)a3 heightForRowAtIndexPath:(id)a4;
- (id)_selectedCategories;
- (id)tableView:(id)a3 cellForRowAtIndexPath:(id)a4;
- (int64_t)numberOfSectionsInTableView:(id)a3;
- (int64_t)tableView:(id)a3 editingStyleForRowAtIndexPath:(id)a4;
- (int64_t)tableView:(id)a3 numberOfRowsInSection:(int64_t)a4;
- (void)_datePickerChanged:(id)a3;
- (void)_stIntroAppLimitsTableViewControllerCommonInit;
- (void)setShowingAllCategories:(BOOL)a3;
- (void)setShowingDatePicker:(BOOL)a3;
- (void)tableView:(id)a3 didDeselectRowAtIndexPath:(id)a4;
- (void)tableView:(id)a3 didSelectRowAtIndexPath:(id)a4;
- (void)viewDidLoad;
- (void)viewWillAppear:(BOOL)a3;
@end

@implementation STIntroAppLimitsTableViewController

- (STIntroAppLimitsTableViewController)initWithStyle:(int64_t)a3
{
  v5.receiver = self;
  v5.super_class = (Class)STIntroAppLimitsTableViewController;
  v3 = [(STIntroAppLimitsTableViewController *)&v5 initWithStyle:a3];
  [(STIntroAppLimitsTableViewController *)v3 _stIntroAppLimitsTableViewControllerCommonInit];
  return v3;
}

- (STIntroAppLimitsTableViewController)initWithNibName:(id)a3 bundle:(id)a4
{
  v6.receiver = self;
  v6.super_class = (Class)STIntroAppLimitsTableViewController;
  v4 = [(STIntroAppLimitsTableViewController *)&v6 initWithNibName:a3 bundle:a4];
  [(STIntroAppLimitsTableViewController *)v4 _stIntroAppLimitsTableViewControllerCommonInit];
  return v4;
}

- (STIntroAppLimitsTableViewController)initWithCoder:(id)a3
{
  v5.receiver = self;
  v5.super_class = (Class)STIntroAppLimitsTableViewController;
  v3 = [(STIntroAppLimitsTableViewController *)&v5 initWithCoder:a3];
  [(STIntroAppLimitsTableViewController *)v3 _stIntroAppLimitsTableViewControllerCommonInit];
  return v3;
}

- (void)_stIntroAppLimitsTableViewControllerCommonInit
{
  v3 = (STAllowance *)objc_opt_new();
  allowance = self->_allowance;
  self->_allowance = v3;

  [(STAllowance *)self->_allowance setBehaviorType:1];
  objc_super v5 = (NSDateComponentsFormatter *)objc_opt_new();
  timeAmountFormatter = self->_timeAmountFormatter;
  self->_timeAmountFormatter = v5;

  [(NSDateComponentsFormatter *)self->_timeAmountFormatter setUnitsStyle:2];
  v7 = self->_timeAmountFormatter;

  [(NSDateComponentsFormatter *)v7 setFormattingContext:3];
}

- (void)viewDidLoad
{
  v5.receiver = self;
  v5.super_class = (Class)STIntroAppLimitsTableViewController;
  [(STIntroAppLimitsTableViewController *)&v5 viewDidLoad];
  v3 = [(STIntroAppLimitsTableViewController *)self tableView];
  [v3 setEditing:1];

  if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v4 = 0;
    _os_log_impl(&dword_225B06000, &_os_log_internal, OS_LOG_TYPE_DEFAULT, "STUI:: STIntroAppLimitsTableViewController.viewDidLoad", v4, 2u);
  }
}

- (void)viewWillAppear:(BOOL)a3
{
  v9.receiver = self;
  v9.super_class = (Class)STIntroAppLimitsTableViewController;
  [(STIntroAppLimitsTableViewController *)&v9 viewWillAppear:a3];
  v4 = [MEMORY[0x263F088C8] indexPathForRow:0 inSection:0];
  objc_super v5 = [(STIntroAppLimitsTableViewController *)self tableView];
  [v5 selectRowAtIndexPath:v4 animated:0 scrollPosition:0];

  objc_super v6 = [(STIntroAppLimitsTableViewController *)self _selectedCategories];
  v7 = [(STIntroAppLimitsTableViewController *)self allowance];
  [v7 setCategoryIdentifiers:v6];

  if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v8 = 0;
    _os_log_impl(&dword_225B06000, &_os_log_internal, OS_LOG_TYPE_DEFAULT, "STUI:: STIntroAppLimitsTableViewController.viewWillAppear", v8, 2u);
  }
}

- (int64_t)numberOfSectionsInTableView:(id)a3
{
  return 2;
}

- (int64_t)tableView:(id)a3 numberOfRowsInSection:(int64_t)a4
{
  id v7 = a3;
  if (a4 == 1)
  {
    if ([(STIntroAppLimitsTableViewController *)self showingDatePicker]) {
      int64_t v10 = 2;
    }
    else {
      int64_t v10 = 1;
    }
  }
  else if (a4)
  {
    v12 = [MEMORY[0x263F08690] currentHandler];
    objc_msgSend(v12, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, @"STIntroAppLimitsTableViewController.m", 112, @"Unhandled App Limits table section %ld", a4);

    int64_t v10 = 0;
  }
  else if ([(STIntroAppLimitsTableViewController *)self showingAllCategories])
  {
    v8 = STSortedCategoriesForUsageLimits();
    uint64_t v9 = [v8 count];

    int64_t v10 = v9 + 1;
    if (v9 + 1 < 0)
    {
      v11 = [MEMORY[0x263F08690] currentHandler];
      objc_msgSend(v11, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, @"STIntroAppLimitsTableViewController.m", 102, @"number of rows overflowed %lu", v9);
    }
  }
  else
  {
    int64_t v10 = 4;
  }

  return v10;
}

- (id)tableView:(id)a3 cellForRowAtIndexPath:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  uint64_t v9 = [v8 section];
  if (v9 == 1)
  {
    uint64_t v18 = [v8 row];
    if (v18 == 1)
    {
      v14 = [v7 dequeueReusableCellWithIdentifier:@"Date Picker" forIndexPath:v8];
      v31 = [v14 contentView];
      v32 = [v31 subviews];
      v33 = [v32 objectAtIndexedSubscript:0];

      v34 = [(STIntroAppLimitsTableViewController *)self allowance];
      v35 = [v34 time];
      +[STAllowance timeIntervalForAllowanceDateComponents:v35];
      objc_msgSend(v33, "setCountDownDuration:");

      [v33 sendActionsForControlEvents:4096];
      goto LABEL_21;
    }
    uint64_t v19 = v18;
    if (!v18)
    {
      v20 = [(STIntroAppLimitsTableViewController *)self allowance];
      v21 = [v20 time];
      +[STAllowance timeIntervalForAllowanceDateComponents:v21];
      double v23 = v22;

      if (v23 > 0.0)
      {
        v14 = [v7 dequeueReusableCellWithIdentifier:@"Has Set Time Amount" forIndexPath:v8];
        v15 = [(STIntroAppLimitsTableViewController *)self timeAmountFormatter];
        v16 = [v15 stringFromTimeInterval:v23];
        v17 = [v14 detailTextLabel];
        [v17 setText:v16];
        goto LABEL_11;
      }
      uint64_t v36 = [v7 dequeueReusableCellWithIdentifier:@"No Set Time Amount" forIndexPath:v8];
LABEL_17:
      v14 = (void *)v36;
      goto LABEL_21;
    }
    v24 = [MEMORY[0x263F08690] currentHandler];
    objc_msgSend(v24, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, @"STIntroAppLimitsTableViewController.m", 167, @"Unhandled App Limits Time Amount section row %ld", v19);
LABEL_16:

    uint64_t v36 = [objc_alloc(MEMORY[0x263F82C80]) initWithStyle:0 reuseIdentifier:0];
    goto LABEL_17;
  }
  uint64_t v10 = v9;
  if (v9)
  {
    v24 = [MEMORY[0x263F08690] currentHandler];
    objc_msgSend(v24, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, @"STIntroAppLimitsTableViewController.m", 173, @"Unhandled App Limits table section %ld", v10);
    goto LABEL_16;
  }
  uint64_t v11 = [v8 row];
  if (!v11)
  {
    v14 = [v7 dequeueReusableCellWithIdentifier:@"Category" forIndexPath:v8];
    v25 = +[STScreenTimeSettingsUIBundle bundle];
    v26 = [v25 localizedStringForKey:@"AllAppsAndCategoriesSpecifierName" value:&stru_26D9391A8 table:0];
    v27 = [v14 textLabel];
    [v27 setText:v26];

    v28 = [MEMORY[0x263F67408] sharedCache];
    v29 = [v28 roundedImageForImageWithName:@"AllApps"];
    v30 = [v14 imageView];
    [v30 setImage:v29];
LABEL_19:

    v15 = objc_opt_new();
    v41 = [MEMORY[0x263F825C8] clearColor];
    [v15 setBackgroundColor:v41];

    [v14 setMultipleSelectionBackgroundView:v15];
    goto LABEL_20;
  }
  uint64_t v12 = v11;
  BOOL v13 = [(STIntroAppLimitsTableViewController *)self showingAllCategories];
  if (v12 < 3 || v13)
  {
    v14 = [v7 dequeueReusableCellWithIdentifier:@"Category" forIndexPath:v8];
    v37 = STSortedCategoriesForUsageLimits();
    v28 = [v37 objectAtIndexedSubscript:v12 - 1];

    v29 = STCategoryNameWithIdentifier();
    v38 = [v14 textLabel];
    [v38 setText:v29];

    v30 = [MEMORY[0x263F67408] sharedCache];
    v39 = [v30 imageForCategoryIdentifier:v28];
    v40 = [v14 imageView];
    [v40 setImage:v39];

    goto LABEL_19;
  }
  v14 = [v7 dequeueReusableCellWithIdentifier:@"Show All Categories" forIndexPath:v8];
  v15 = [MEMORY[0x263F67408] sharedCache];
  v16 = objc_msgSend(v15, "blankSpaceImageWithSize:", 29.0, 29.0);
  v17 = [v14 imageView];
  [v17 setImage:v16];
LABEL_11:

LABEL_20:
LABEL_21:

  return v14;
}

- (void)tableView:(id)a3 didSelectRowAtIndexPath:(id)a4
{
  uint64_t v28 = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v7 = a4;
  uint64_t v8 = [v7 section];
  if (v8 == 1)
  {
    if (![v7 row])
    {
      [(STIntroAppLimitsTableViewController *)self setShowingDatePicker:[(STIntroAppLimitsTableViewController *)self showingDatePicker] ^ 1];
      uint64_t v10 = (void *)[objc_alloc(MEMORY[0x263F088D0]) initWithIndex:1];
      [v6 reloadSections:v10 withRowAnimation:100];
    }
  }
  else if (!v8)
  {
    if ([(STIntroAppLimitsTableViewController *)self showingAllCategories]
      || [v7 row] != 3)
    {
      if ([v7 row])
      {
        long long v20 = 0u;
        long long v21 = 0u;
        long long v18 = 0u;
        long long v19 = 0u;
        objc_msgSend(v6, "indexPathsForSelectedRows", 0);
        id v9 = (id)objc_claimAutoreleasedReturnValue();
        uint64_t v11 = [v9 countByEnumeratingWithState:&v18 objects:v27 count:16];
        if (v11)
        {
          uint64_t v12 = v11;
          uint64_t v13 = *(void *)v19;
          while (2)
          {
            for (uint64_t i = 0; i != v12; ++i)
            {
              if (*(void *)v19 != v13) {
                objc_enumerationMutation(v9);
              }
              v15 = *(void **)(*((void *)&v18 + 1) + 8 * i);
              if (![v15 section] && !objc_msgSend(v15, "row"))
              {
                [v6 deselectRowAtIndexPath:v15 animated:1];
                goto LABEL_21;
              }
            }
            uint64_t v12 = [v9 countByEnumeratingWithState:&v18 objects:v27 count:16];
            if (v12) {
              continue;
            }
            break;
          }
        }
      }
      else
      {
        v22[0] = MEMORY[0x263EF8330];
        v22[1] = 3221225472;
        v22[2] = __73__STIntroAppLimitsTableViewController_tableView_didSelectRowAtIndexPath___block_invoke_2;
        v22[3] = &unk_264767078;
        id v23 = v6;
        id v24 = v7;
        [v23 performBatchUpdates:v22 completion:0];

        id v9 = v23;
      }
    }
    else
    {
      [(STIntroAppLimitsTableViewController *)self setShowingAllCategories:1];
      v25[0] = MEMORY[0x263EF8330];
      v25[1] = 3221225472;
      v25[2] = __73__STIntroAppLimitsTableViewController_tableView_didSelectRowAtIndexPath___block_invoke;
      v25[3] = &unk_264766F30;
      id v26 = v6;
      [v26 performBatchUpdates:v25 completion:0];
      id v9 = v26;
    }
LABEL_21:

    v16 = [(STIntroAppLimitsTableViewController *)self _selectedCategories];
    v17 = [(STIntroAppLimitsTableViewController *)self allowance];
    [v17 setCategoryIdentifiers:v16];
  }
}

void __73__STIntroAppLimitsTableViewController_tableView_didSelectRowAtIndexPath___block_invoke(uint64_t a1)
{
  v13[1] = *MEMORY[0x263EF8340];
  v2 = [MEMORY[0x263F088C8] indexPathForRow:3 inSection:0];
  v3 = *(void **)(a1 + 32);
  v13[0] = v2;
  v4 = [MEMORY[0x263EFF8C0] arrayWithObjects:v13 count:1];
  [v3 deleteRowsAtIndexPaths:v4 withRowAnimation:5];

  objc_super v5 = objc_opt_new();
  id v6 = STSortedCategoriesForUsageLimits();
  uint64_t v7 = [v6 count];

  if ((unint64_t)(v7 - 0x7FFFFFFFFFFFFFFFLL) <= 2)
  {
    uint64_t v10 = v7 - 2;
    uint64_t v11 = [MEMORY[0x263F08690] currentHandler];
    uint64_t v12 = [NSString stringWithUTF8String:"-[STIntroAppLimitsTableViewController tableView:didSelectRowAtIndexPath:]_block_invoke"];
    objc_msgSend(v11, "handleFailureInFunction:file:lineNumber:description:", v12, @"STIntroAppLimitsTableViewController.m", 196, @"indexOffset (%lu) + numberOfRowsToAdd (%lu) will overflow", 3, v10);
  }
  else if (v7 >= 3)
  {
    uint64_t v8 = 2;
    do
    {
      id v9 = [MEMORY[0x263F088C8] indexPathForRow:++v8 inSection:0];
      [v5 addObject:v9];
    }
    while (v7 != v8);
  }
  [*(id *)(a1 + 32) insertRowsAtIndexPaths:v5 withRowAnimation:5];
}

void __73__STIntroAppLimitsTableViewController_tableView_didSelectRowAtIndexPath___block_invoke_2(uint64_t a1)
{
  uint64_t v13 = *MEMORY[0x263EF8340];
  long long v8 = 0u;
  long long v9 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  v2 = objc_msgSend(*(id *)(a1 + 32), "indexPathsForSelectedRows", 0);
  uint64_t v3 = [v2 countByEnumeratingWithState:&v8 objects:v12 count:16];
  if (v3)
  {
    uint64_t v4 = v3;
    uint64_t v5 = *(void *)v9;
    do
    {
      for (uint64_t i = 0; i != v4; ++i)
      {
        if (*(void *)v9 != v5) {
          objc_enumerationMutation(v2);
        }
        uint64_t v7 = *(void **)(*((void *)&v8 + 1) + 8 * i);
        if (([v7 isEqual:*(void *)(a1 + 40)] & 1) == 0) {
          [*(id *)(a1 + 32) deselectRowAtIndexPath:v7 animated:1];
        }
      }
      uint64_t v4 = [v2 countByEnumeratingWithState:&v8 objects:v12 count:16];
    }
    while (v4);
  }
}

- (void)tableView:(id)a3 didDeselectRowAtIndexPath:(id)a4
{
  id v13 = a3;
  uint64_t v6 = [a4 section];
  id v7 = v13;
  if (!v6)
  {
    long long v8 = [v13 indexPathsForSelectedRows];
    uint64_t v9 = [v8 count];

    if (!v9)
    {
      long long v10 = [MEMORY[0x263F088C8] indexPathForRow:0 inSection:0];
      [v13 selectRowAtIndexPath:v10 animated:1 scrollPosition:0];
    }
    long long v11 = [(STIntroAppLimitsTableViewController *)self _selectedCategories];
    uint64_t v12 = [(STIntroAppLimitsTableViewController *)self allowance];
    [v12 setCategoryIdentifiers:v11];

    id v7 = v13;
  }

  MEMORY[0x270F9A758](v6, v7);
}

- (int64_t)tableView:(id)a3 editingStyleForRowAtIndexPath:(id)a4
{
  id v5 = a4;
  if ([v5 section]
    || ![(STIntroAppLimitsTableViewController *)self showingAllCategories]
    && [v5 row] == 3)
  {
    int64_t v6 = 0;
  }
  else
  {
    int64_t v6 = 3;
  }

  return v6;
}

- (double)tableView:(id)a3 heightForRowAtIndexPath:(id)a4
{
  id v4 = a4;
  if ([v4 section] == 1)
  {
    if ([v4 row] == 1) {
      double v5 = *MEMORY[0x263F839B8];
    }
    else {
      double v5 = 61.0;
    }
  }
  else
  {
    double v5 = 61.0;
  }

  return v5;
}

- (id)_selectedCategories
{
  uint64_t v22 = *MEMORY[0x263EF8340];
  uint64_t v3 = STSortedCategoriesForUsageLimits();
  long long v17 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  id v4 = [(STIntroAppLimitsTableViewController *)self tableView];
  double v5 = [v4 indexPathsForSelectedRows];

  uint64_t v6 = [v5 countByEnumeratingWithState:&v17 objects:v21 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    long long v8 = 0;
    uint64_t v9 = *(void *)v18;
    while (2)
    {
      for (uint64_t i = 0; i != v7; ++i)
      {
        if (*(void *)v18 != v9) {
          objc_enumerationMutation(v5);
        }
        long long v11 = *(void **)(*((void *)&v17 + 1) + 8 * i);
        if (![v11 section])
        {
          uint64_t v12 = [v11 row];
          if (!v12)
          {

            goto LABEL_16;
          }
          id v13 = [v3 objectAtIndexedSubscript:v12 - 1];
          if (v8) {
            [v8 addObject:v13];
          }
          else {
            long long v8 = objc_msgSend(objc_alloc(MEMORY[0x263EFF980]), "initWithObjects:", v13, 0);
          }
        }
      }
      uint64_t v7 = [v5 countByEnumeratingWithState:&v17 objects:v21 count:16];
      if (v7) {
        continue;
      }
      break;
    }
  }
  else
  {
LABEL_16:
    long long v8 = 0;
  }

  if (v8) {
    v14 = v8;
  }
  else {
    v14 = v3;
  }
  id v15 = v14;

  return v15;
}

- (void)_datePickerChanged:(id)a3
{
  v9[1] = *MEMORY[0x263EF8340];
  [a3 countDownDuration];
  id v4 = +[STAllowance dateComponentsForDuration:](STAllowance, "dateComponentsForDuration:");
  double v5 = [(STIntroAppLimitsTableViewController *)self allowance];
  [v5 setTime:v4];

  uint64_t v6 = [MEMORY[0x263F088C8] indexPathForRow:0 inSection:1];
  uint64_t v7 = [(STIntroAppLimitsTableViewController *)self tableView];
  v9[0] = v6;
  long long v8 = [MEMORY[0x263EFF8C0] arrayWithObjects:v9 count:1];
  [v7 reloadRowsAtIndexPaths:v8 withRowAnimation:100];
}

- (STAllowance)allowance
{
  return (STAllowance *)objc_getProperty(self, a2, 1032, 1);
}

- (BOOL)showingAllCategories
{
  return self->_showingAllCategories;
}

- (void)setShowingAllCategories:(BOOL)a3
{
  self->_showingAllCategories = a3;
}

- (BOOL)showingDatePicker
{
  return self->_showingDatePicker;
}

- (void)setShowingDatePicker:(BOOL)a3
{
  self->_showingDatePicker = a3;
}

- (NSDateComponentsFormatter)timeAmountFormatter
{
  return (NSDateComponentsFormatter *)objc_getProperty(self, a2, 1040, 1);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_timeAmountFormatter, 0);

  objc_storeStrong((id *)&self->_allowance, 0);
}

@end