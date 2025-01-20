@interface NCSupplementaryViewPrototypeRecipeContentAuxiliaryOptionsViewController
+ (id)title;
- (NCSupplementaryViewPrototypeRecipeContentAuxiliaryOptionsViewController)init;
- (id)_alertActionForMaterialRecipe:(int64_t)a3;
- (id)tableView:(id)a3 cellForRowAtIndexPath:(id)a4;
- (id)tableView:(id)a3 viewForHeaderInSection:(int64_t)a4;
- (int64_t)numberOfSectionsInTableView:(id)a3;
- (int64_t)tableView:(id)a3 numberOfRowsInSection:(int64_t)a4;
- (void)colorPickerViewController:(id)a3 didSelectColor:(id)a4 continuously:(BOOL)a5;
- (void)loadView;
- (void)tableView:(id)a3 didDeselectRowAtIndexPath:(id)a4;
- (void)tableView:(id)a3 didSelectRowAtIndexPath:(id)a4;
- (void)tableView:(id)a3 willDisplayHeaderView:(id)a4 forSection:(int64_t)a5;
@end

@implementation NCSupplementaryViewPrototypeRecipeContentAuxiliaryOptionsViewController

- (NCSupplementaryViewPrototypeRecipeContentAuxiliaryOptionsViewController)init
{
  v5.receiver = self;
  v5.super_class = (Class)NCSupplementaryViewPrototypeRecipeContentAuxiliaryOptionsViewController;
  v2 = [(NCSupplementaryViewPrototypeRecipeViewController *)&v5 init];
  v3 = v2;
  if (v2) {
    [(NCSupplementaryViewPrototypeRecipeViewController *)v2 updateConfiguration:&__block_literal_global_38];
  }
  return v3;
}

void __79__NCSupplementaryViewPrototypeRecipeContentAuxiliaryOptionsViewController_init__block_invoke(uint64_t a1, void *a2)
{
  v2 = (void *)MEMORY[0x1E4FB1618];
  id v3 = a2;
  v4 = [v2 systemWhiteColor];
  objc_super v5 = [v4 colorWithAlphaComponent:0.4];
  [v3 setTintColor:v5];

  id v6 = [MEMORY[0x1E4FB1618] systemBlackColor];
  [v3 setTextColor:v6];
}

+ (id)title
{
  return @"Auxiliary Options";
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
  objc_super v5 = self->_tableView;

  [(NCSupplementaryViewPrototypeRecipeContentAuxiliaryOptionsViewController *)self setView:v5];
}

- (int64_t)numberOfSectionsInTableView:(id)a3
{
  return 1;
}

- (int64_t)tableView:(id)a3 numberOfRowsInSection:(int64_t)a4
{
  return 4;
}

- (id)tableView:(id)a3 cellForRowAtIndexPath:(id)a4
{
  id v6 = a4;
  v7 = [a3 dequeueReusableCellWithIdentifier:@"cell"];
  if (!v7)
  {
    v7 = (void *)[objc_alloc(MEMORY[0x1E4FB1D08]) initWithStyle:0 reuseIdentifier:@"cell"];
    v8 = [MEMORY[0x1E4FB1618] clearColor];
    [v7 setBackgroundColor:v8];

    [v7 setSelectionStyle:0];
  }
  if ((unint64_t)[v6 row] > 2)
  {
    v13 = @"2 Auxiliary Options Without Title";
  }
  else
  {
    v9 = NSString;
    uint64_t v10 = [v6 row] + 1;
    uint64_t v11 = [v6 row];
    v12 = @"s";
    if (!v11) {
      v12 = &stru_1F2F516F8;
    }
    v13 = [v9 stringWithFormat:@"%lu Auxiliary Option%@", v10, v12];
  }
  v14 = [v7 textLabel];
  [v14 setText:v13];

  v15 = [v7 textLabel];
  v16 = [(NCSupplementaryViewPrototypeRecipeViewController *)self configuration];
  v17 = [v16 textColor];
  [v15 setTextColor:v17];

  return v7;
}

- (void)tableView:(id)a3 didDeselectRowAtIndexPath:(id)a4
{
  id v5 = a4;
  id v6 = a3;
  v7 = [v6 cellForRowAtIndexPath:v5];
  [v7 setSelected:0];

  id v8 = [v6 cellForRowAtIndexPath:v5];

  [v8 setAccessoryType:0];
}

- (id)tableView:(id)a3 viewForHeaderInSection:(int64_t)a4
{
  id v5 = objc_msgSend(a3, "dequeueReusableHeaderFooterViewWithIdentifier:", @"header", a4);
  if (!v5) {
    id v5 = (void *)[objc_alloc(MEMORY[0x1E4FB1D30]) initWithReuseIdentifier:@"header"];
  }
  id v6 = [v5 textLabel];
  [v6 setText:@"Select Number of Auxiliary Option Buttons"];

  v7 = [v5 textLabel];
  id v8 = [(NCSupplementaryViewPrototypeRecipeViewController *)self configuration];
  v9 = [v8 textColor];
  [v7 setTextColor:v9];

  return v5;
}

- (void)tableView:(id)a3 willDisplayHeaderView:(id)a4 forSection:(int64_t)a5
{
  id v5 = (void *)MEMORY[0x1E4FB1618];
  id v6 = a3;
  id v7 = [v5 clearColor];
  [v6 setBackgroundColor:v7];
}

- (void)tableView:(id)a3 didSelectRowAtIndexPath:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  id v8 = [v7 cellForRowAtIndexPath:v6];
  [v8 setSelected:1];

  v9 = [v7 cellForRowAtIndexPath:v6];

  [v9 setAccessoryType:3];
  uint64_t v12 = MEMORY[0x1E4F143A8];
  uint64_t v13 = 3221225472;
  v14 = __109__NCSupplementaryViewPrototypeRecipeContentAuxiliaryOptionsViewController_tableView_didSelectRowAtIndexPath___block_invoke;
  v15 = &unk_1E6A94F80;
  v16 = self;
  id v17 = v6;
  id v10 = v6;
  [(NCSupplementaryViewPrototypeRecipeViewController *)self updateConfiguration:&v12];
  uint64_t v11 = [(NCSupplementaryViewPrototypeRecipeViewController *)self delegate];
  [v11 notificationListBaseComponentDidSignificantUserInteraction:self];
}

void __109__NCSupplementaryViewPrototypeRecipeContentAuxiliaryOptionsViewController_tableView_didSelectRowAtIndexPath___block_invoke(uint64_t a1, void *a2)
{
  v38[1] = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  objc_initWeak(&location, *(id *)(a1 + 32));
  switch([*(id *)(a1 + 40) row])
  {
    case 0:
      id v8 = [*(id *)(a1 + 32) configuration];
      [v8 materialRecipe];
      v9 = MTStringFromMaterialRecipe();

      id v10 = (void *)MEMORY[0x1E4FB13F0];
      v31[0] = MEMORY[0x1E4F143A8];
      v31[1] = 3221225472;
      v31[2] = __109__NCSupplementaryViewPrototypeRecipeContentAuxiliaryOptionsViewController_tableView_didSelectRowAtIndexPath___block_invoke_2;
      v31[3] = &unk_1E6A94FD0;
      objc_copyWeak(&v34, &location);
      v31[4] = *(void *)(a1 + 32);
      id v11 = v3;
      id v32 = v11;
      id v12 = v9;
      id v33 = v12;
      uint64_t v13 = [v10 actionWithTitle:@"Change Material" image:0 identifier:0 handler:v31];
      v38[0] = v13;
      v14 = [MEMORY[0x1E4F1C978] arrayWithObjects:v38 count:1];
      [v11 setAuxiliaryOptionActions:v14];

      v15 = [NSString stringWithFormat:@"Change Material? Current Material is %@", v12];
      [v11 setAuxiliaryOptionsSummaryText:v15];

      objc_destroyWeak(&v34);
      break;
    case 1:
    case 3:
      aBlock[0] = MEMORY[0x1E4F143A8];
      aBlock[1] = 3221225472;
      aBlock[2] = __109__NCSupplementaryViewPrototypeRecipeContentAuxiliaryOptionsViewController_tableView_didSelectRowAtIndexPath___block_invoke_287;
      aBlock[3] = &unk_1E6A91930;
      objc_copyWeak(&v30, &location);
      v4 = _Block_copy(aBlock);
      id v5 = [MEMORY[0x1E4FB13F0] actionWithTitle:@"Configure Tint Color" image:0 identifier:0 handler:v4];
      v37[0] = v5;
      id v6 = [MEMORY[0x1E4FB13F0] actionWithTitle:@"Configure Text Color" image:0 identifier:0 handler:v4];
      v37[1] = v6;
      id v7 = [MEMORY[0x1E4F1C978] arrayWithObjects:v37 count:2];
      [v3 setAuxiliaryOptionActions:v7];

      if ([*(id *)(a1 + 40) row] == 3) {
        [v3 setAuxiliaryOptionsSummaryText:0];
      }
      else {
        [v3 setAuxiliaryOptionsSummaryText:@"Configure the colors?"];
      }

      objc_destroyWeak(&v30);
      break;
    case 2:
      v16 = (void *)MEMORY[0x1E4FB13F0];
      v27[0] = MEMORY[0x1E4F143A8];
      v27[1] = 3221225472;
      v27[2] = __109__NCSupplementaryViewPrototypeRecipeContentAuxiliaryOptionsViewController_tableView_didSelectRowAtIndexPath___block_invoke_2_301;
      v27[3] = &unk_1E6A91930;
      objc_copyWeak(&v28, &location);
      id v17 = [v16 actionWithTitle:@"Keep" image:0 identifier:0 handler:v27];
      v36[0] = v17;
      v18 = (void *)MEMORY[0x1E4FB13F0];
      v25[0] = MEMORY[0x1E4F143A8];
      v25[1] = 3221225472;
      v25[2] = __109__NCSupplementaryViewPrototypeRecipeContentAuxiliaryOptionsViewController_tableView_didSelectRowAtIndexPath___block_invoke_4;
      v25[3] = &unk_1E6A93D50;
      objc_copyWeak(&v26, &location);
      v25[4] = *(void *)(a1 + 32);
      v19 = [v18 actionWithTitle:@"Remove" image:0 identifier:0 handler:v25];
      v36[1] = v19;
      v20 = (void *)MEMORY[0x1E4FB13F0];
      v23[0] = MEMORY[0x1E4F143A8];
      v23[1] = 3221225472;
      v23[2] = __109__NCSupplementaryViewPrototypeRecipeContentAuxiliaryOptionsViewController_tableView_didSelectRowAtIndexPath___block_invoke_5;
      v23[3] = &unk_1E6A91930;
      objc_copyWeak(&v24, &location);
      v21 = [v20 actionWithTitle:@"Noop" image:0 identifier:0 handler:v23];
      v36[2] = v21;
      v22 = [MEMORY[0x1E4F1C978] arrayWithObjects:v36 count:3];
      [v3 setAuxiliaryOptionActions:v22];

      [v3 setAuxiliaryOptionsSummaryText:@"Keep or remove?"];
      objc_destroyWeak(&v24);
      objc_destroyWeak(&v26);
      objc_destroyWeak(&v28);
      break;
    default:
      break;
  }
  objc_destroyWeak(&location);
}

void __109__NCSupplementaryViewPrototypeRecipeContentAuxiliaryOptionsViewController_tableView_didSelectRowAtIndexPath___block_invoke_2(uint64_t a1)
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 56));
  id v3 = WeakRetained;
  if (WeakRetained)
  {
    v15 = WeakRetained;
    v4 = [MEMORY[0x1E4FB1418] alertControllerWithTitle:@"Select Material" message:0 preferredStyle:0];
    long long v16 = 0u;
    long long v17 = 0u;
    long long v18 = 0u;
    long long v19 = 0u;
    uint64_t v5 = [&unk_1F2F84640 countByEnumeratingWithState:&v16 objects:v20 count:16];
    if (v5)
    {
      uint64_t v6 = v5;
      uint64_t v7 = *(void *)v17;
      do
      {
        for (uint64_t i = 0; i != v6; ++i)
        {
          if (*(void *)v17 != v7) {
            objc_enumerationMutation(&unk_1F2F84640);
          }
          v9 = *(void **)(*((void *)&v16 + 1) + 8 * i);
          id v10 = objc_msgSend(*(id *)(a1 + 32), "_alertActionForMaterialRecipe:", objc_msgSend(v9, "integerValue"));
          [v4 addAction:v10];
          uint64_t v11 = [*(id *)(a1 + 40) materialRecipe];
          if (v11 == [v9 integerValue])
          {
            id v12 = [NSString stringWithFormat:@"Current Material: %@", *(void *)(a1 + 48)];
            [v4 setMessage:v12];
          }
        }
        uint64_t v6 = [&unk_1F2F84640 countByEnumeratingWithState:&v16 objects:v20 count:16];
      }
      while (v6);
    }
    uint64_t v13 = [MEMORY[0x1E4FB1410] actionWithTitle:@"Dismiss" style:1 handler:0];
    [v4 addAction:v13];
    id v3 = v15;
    [v15 presentViewController:v4 animated:1 completion:0];
    v14 = [v15 delegate];
    [v14 notificationListBaseComponentDidSignificantUserInteraction:v15];
  }
}

void __109__NCSupplementaryViewPrototypeRecipeContentAuxiliaryOptionsViewController_tableView_didSelectRowAtIndexPath___block_invoke_287(uint64_t a1, void *a2)
{
  id v13 = a2;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    id v4 = objc_alloc_init(MEMORY[0x1E4FB1628]);
    uint64_t v5 = [v4 view];
    [v5 setTag:0];

    uint64_t v6 = [v13 title];
    [v4 setTitle:v6];

    [v4 setDelegate:WeakRetained];
    uint64_t v7 = [v13 title];
    LOBYTE(v6) = [v7 isEqualToString:@"Configure Tint Color"];
    id v8 = [WeakRetained configuration];
    v9 = v8;
    if (v6) {
      [v8 tintColor];
    }
    else {
    id v10 = [v8 textColor];
    }

    if (v10)
    {
      [v4 setSelectedColor:v10];
    }
    else
    {
      uint64_t v11 = [MEMORY[0x1E4FB1618] whiteColor];
      [v4 setSelectedColor:v11];
    }
    [WeakRetained presentViewController:v4 animated:1 completion:0];
    id v12 = [WeakRetained delegate];
    [v12 notificationListBaseComponentDidSignificantUserInteraction:WeakRetained];
  }
}

void __109__NCSupplementaryViewPrototypeRecipeContentAuxiliaryOptionsViewController_tableView_didSelectRowAtIndexPath___block_invoke_2_301(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    id v3 = WeakRetained;
    [WeakRetained updateConfiguration:&__block_literal_global_303];
    v2 = [v3 delegate];
    [v2 notificationListBaseComponentDidSignificantUserInteraction:v3];

    id WeakRetained = v3;
  }
}

void __109__NCSupplementaryViewPrototypeRecipeContentAuxiliaryOptionsViewController_tableView_didSelectRowAtIndexPath___block_invoke_3(uint64_t a1, void *a2)
{
  id v2 = a2;
  [v2 setAuxiliaryOptionActions:0];
  [v2 setAuxiliaryOptionsSummaryText:0];
}

void __109__NCSupplementaryViewPrototypeRecipeContentAuxiliaryOptionsViewController_tableView_didSelectRowAtIndexPath___block_invoke_4(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  if (WeakRetained)
  {
    id v4 = WeakRetained;
    id v3 = [WeakRetained delegate];
    [v3 requestsRemovalForPrototypeRecipeViewController:*(void *)(a1 + 32)];
    [v3 notificationListBaseComponentDidSignificantUserInteraction:v4];

    id WeakRetained = v4;
  }
}

void __109__NCSupplementaryViewPrototypeRecipeContentAuxiliaryOptionsViewController_tableView_didSelectRowAtIndexPath___block_invoke_5(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    id v3 = WeakRetained;
    id v2 = [WeakRetained delegate];
    [v2 notificationListBaseComponentDidSignificantUserInteraction:v3];

    id WeakRetained = v3;
  }
}

- (void)colorPickerViewController:(id)a3 didSelectColor:(id)a4 continuously:(BOOL)a5
{
  id v6 = a3;
  uint64_t v7 = [(NCSupplementaryViewPrototypeRecipeViewController *)self delegate];
  [v7 notificationListBaseComponentDidSignificantUserInteraction:self];

  id v8 = [v6 title];
  char v9 = [v8 isEqualToString:@"Configure Tint Color"];

  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = __129__NCSupplementaryViewPrototypeRecipeContentAuxiliaryOptionsViewController_colorPickerViewController_didSelectColor_continuously___block_invoke;
  v11[3] = &unk_1E6A94FF8;
  char v14 = v9;
  id v12 = v6;
  id v13 = self;
  id v10 = v6;
  [(NCSupplementaryViewPrototypeRecipeViewController *)self updateConfiguration:v11];
}

void __129__NCSupplementaryViewPrototypeRecipeContentAuxiliaryOptionsViewController_colorPickerViewController_didSelectColor_continuously___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  id v4 = [*(id *)(a1 + 32) selectedColor];
  uint64_t v5 = NilColorIfTransparent(v4);

  if (*(unsigned char *)(a1 + 48))
  {
    [v3 setTintColor:v5];
  }
  else
  {
    [v3 setTextColor:v5];
    long long v16 = 0u;
    long long v17 = 0u;
    long long v14 = 0u;
    long long v15 = 0u;
    id v6 = objc_msgSend(*(id *)(*(void *)(a1 + 40) + 1008), "visibleCells", 0);
    uint64_t v7 = [v6 countByEnumeratingWithState:&v14 objects:v18 count:16];
    if (v7)
    {
      uint64_t v8 = v7;
      uint64_t v9 = *(void *)v15;
      do
      {
        for (uint64_t i = 0; i != v8; ++i)
        {
          if (*(void *)v15 != v9) {
            objc_enumerationMutation(v6);
          }
          uint64_t v11 = [*(id *)(*((void *)&v14 + 1) + 8 * i) textLabel];
          [v11 setTextColor:v5];

          id v12 = [*(id *)(*(void *)(a1 + 40) + 1008) headerViewForSection:0];
          id v13 = [v12 textLabel];
          [v13 setTextColor:v5];
        }
        uint64_t v8 = [v6 countByEnumeratingWithState:&v14 objects:v18 count:16];
      }
      while (v8);
    }
  }
}

- (id)_alertActionForMaterialRecipe:(int64_t)a3
{
  objc_initWeak(&location, self);
  id v4 = (void *)MEMORY[0x1E4FB1410];
  uint64_t v5 = MTStringFromMaterialRecipe();
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __105__NCSupplementaryViewPrototypeRecipeContentAuxiliaryOptionsViewController__alertActionForMaterialRecipe___block_invoke;
  v8[3] = &unk_1E6A95040;
  objc_copyWeak(v9, &location);
  v9[1] = (id)a3;
  id v6 = [v4 actionWithTitle:v5 style:0 handler:v8];

  objc_destroyWeak(v9);
  objc_destroyWeak(&location);

  return v6;
}

void __105__NCSupplementaryViewPrototypeRecipeContentAuxiliaryOptionsViewController__alertActionForMaterialRecipe___block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  id v3 = WeakRetained;
  if (WeakRetained)
  {
    v4[0] = MEMORY[0x1E4F143A8];
    v4[1] = 3221225472;
    v4[2] = __105__NCSupplementaryViewPrototypeRecipeContentAuxiliaryOptionsViewController__alertActionForMaterialRecipe___block_invoke_2;
    v4[3] = &__block_descriptor_40_e65_v16__0__NCNotificationListMutableSupplementaryViewConfiguration_8l;
    v4[4] = *(void *)(a1 + 40);
    [WeakRetained updateConfiguration:v4];
  }
}

uint64_t __105__NCSupplementaryViewPrototypeRecipeContentAuxiliaryOptionsViewController__alertActionForMaterialRecipe___block_invoke_2(uint64_t a1, void *a2)
{
  return [a2 setMaterialRecipe:*(void *)(a1 + 32)];
}

- (void).cxx_destruct
{
}

@end