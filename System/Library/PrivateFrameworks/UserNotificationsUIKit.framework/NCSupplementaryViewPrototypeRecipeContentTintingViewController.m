@interface NCSupplementaryViewPrototypeRecipeContentTintingViewController
+ (id)title;
- (NCSupplementaryViewPrototypeRecipeContentTintingViewController)init;
- (id)_initWithGroupingIdentifier:(id)a3 stackSubordinate:(BOOL)a4;
- (id)tableView:(id)a3 cellForRowAtIndexPath:(id)a4;
- (id)tableView:(id)a3 viewForHeaderInSection:(int64_t)a4;
- (id)tableView:(id)a3 willSelectRowAtIndexPath:(id)a4;
- (int64_t)numberOfSectionsInTableView:(id)a3;
- (int64_t)tableView:(id)a3 numberOfRowsInSection:(int64_t)a4;
- (void)_enumerateStack:(id)a3;
- (void)_setTextColor:(id)a3;
- (void)_setTintColor:(id)a3;
- (void)loadView;
- (void)tableView:(id)a3 didSelectRowAtIndexPath:(id)a4;
- (void)tableView:(id)a3 willDisplayHeaderView:(id)a4 forSection:(int64_t)a5;
@end

@implementation NCSupplementaryViewPrototypeRecipeContentTintingViewController

+ (id)title
{
  return @"Color Configuration";
}

- (NCSupplementaryViewPrototypeRecipeContentTintingViewController)init
{
  v3 = NSString;
  v4 = [MEMORY[0x1E4F29128] UUID];
  v5 = [v4 UUIDString];
  v6 = [v3 stringWithFormat:@"color-config-%@", v5];

  v7 = [(NCSupplementaryViewPrototypeRecipeContentTintingViewController *)self _initWithGroupingIdentifier:v6 stackSubordinate:0];
  return v7;
}

- (id)_initWithGroupingIdentifier:(id)a3 stackSubordinate:(BOOL)a4
{
  id v6 = a3;
  v12.receiver = self;
  v12.super_class = (Class)NCSupplementaryViewPrototypeRecipeContentTintingViewController;
  v7 = [(NCSupplementaryViewPrototypeRecipeViewController *)&v12 init];
  v8 = v7;
  if (v7)
  {
    v7->_stackSubordinate = a4;
    v10[0] = MEMORY[0x1E4F143A8];
    v10[1] = 3221225472;
    v10[2] = __111__NCSupplementaryViewPrototypeRecipeContentTintingViewController__initWithGroupingIdentifier_stackSubordinate___block_invoke;
    v10[3] = &unk_1E6A94F58;
    id v11 = v6;
    [(NCSupplementaryViewPrototypeRecipeViewController *)v8 updateConfiguration:v10];
  }
  return v8;
}

void __111__NCSupplementaryViewPrototypeRecipeContentTintingViewController__initWithGroupingIdentifier_stackSubordinate___block_invoke(uint64_t a1, void *a2)
{
  v3 = (void *)MEMORY[0x1E4FB1618];
  id v7 = a2;
  v4 = [v3 blackColor];
  v5 = [v4 colorWithAlphaComponent:1.0];
  [v7 setTintColor:v5];

  id v6 = [MEMORY[0x1E4FB1618] whiteColor];
  [v7 setTextColor:v6];

  [v7 setGroupingIdentifier:*(void *)(a1 + 32)];
}

- (void)loadView
{
  v3 = (UITableView *)objc_alloc_init(MEMORY[0x1E4FB1D00]);
  tableView = self->_tableView;
  self->_tableView = v3;

  [(UITableView *)self->_tableView setDelegate:self];
  [(UITableView *)self->_tableView setDataSource:self];
  [(UITableView *)self->_tableView setScrollEnabled:0];
  v5 = self->_tableView;

  [(NCSupplementaryViewPrototypeRecipeContentTintingViewController *)self setView:v5];
}

- (int64_t)numberOfSectionsInTableView:(id)a3
{
  return 1;
}

- (int64_t)tableView:(id)a3 numberOfRowsInSection:(int64_t)a4
{
  return self->_stackSubordinate ^ 3;
}

- (id)tableView:(id)a3 cellForRowAtIndexPath:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if ([v7 row] && objc_msgSend(v7, "row") != 1)
  {
    v13 = [v6 dequeueReusableCellWithIdentifier:@"add-stack"];
    v14 = v13;
    if (v13) {
      id v15 = v13;
    }
    else {
      id v15 = (id)[objc_alloc(MEMORY[0x1E4FB1D08]) initWithStyle:0 reuseIdentifier:@"add-stack"];
    }
    v9 = v15;

    v30 = [v9 textLabel];
    [v30 setText:@"Add stack"];

    id v28 = [MEMORY[0x1E4FB1618] clearColor];
    [v9 setBackgroundColor:v28];
  }
  else
  {
    v8 = [v6 dequeueReusableCellWithIdentifier:@"color-well"];
    if (v8)
    {
      v9 = v8;
      v10 = [v8 contentView];
      id v11 = [v10 subviews];
      objc_super v12 = [v11 firstObject];

      [v12 removeTarget:0 action:0 forControlEvents:0xFFFFFFFFLL];
    }
    else
    {
      v9 = (void *)[objc_alloc(MEMORY[0x1E4FB1D08]) initWithStyle:0 reuseIdentifier:@"color-well"];
      id v16 = objc_alloc(MEMORY[0x1E4FB1630]);
      v17 = [v9 contentView];
      [v17 frame];
      objc_super v12 = objc_msgSend(v16, "initWithFrame:", CGRectGetMaxX(v45) + -50.0, 0.0, 50.0, 50.0);

      v18 = [v9 contentView];
      [v18 addSubview:v12];
    }
    uint64_t v19 = [v7 row];
    BOOL v20 = v19 == 0;
    v21 = @"Text Color";
    if (!v19) {
      v21 = @"Tint Color";
    }
    v22 = v21;
    v23 = [v9 textLabel];
    [v23 setText:v22];

    [v12 setTitle:v22];
    v24 = [(NCSupplementaryViewPrototypeRecipeViewController *)self configuration];
    v25 = v24;
    if (v19) {
      [v24 textColor];
    }
    else {
    v26 = [v24 tintColor];
    }
    [v12 setSelectedColor:v26];

    objc_initWeak(&location, self);
    v27 = (void *)MEMORY[0x1E4FB13F0];
    uint64_t v36 = MEMORY[0x1E4F143A8];
    uint64_t v37 = 3221225472;
    v38 = __98__NCSupplementaryViewPrototypeRecipeContentTintingViewController_tableView_cellForRowAtIndexPath___block_invoke;
    v39 = &unk_1E6A92B28;
    objc_copyWeak(&v41, &location);
    id v28 = v12;
    id v40 = v28;
    BOOL v42 = v20;
    v29 = [v27 actionWithTitle:v22 image:0 identifier:0 handler:&v36];
    objc_msgSend(v28, "addAction:forControlEvents:", v29, 4096, v36, v37, v38, v39);

    objc_destroyWeak(&v41);
    objc_destroyWeak(&location);
  }
  [v9 setSelectionStyle:0];
  v31 = [MEMORY[0x1E4FB1618] clearColor];
  [v9 setBackgroundColor:v31];

  v32 = [v9 textLabel];
  v33 = [(NCSupplementaryViewPrototypeRecipeViewController *)self configuration];
  v34 = [v33 textColor];
  [v32 setTextColor:v34];

  return v9;
}

void __98__NCSupplementaryViewPrototypeRecipeContentTintingViewController_tableView_cellForRowAtIndexPath___block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  if (WeakRetained)
  {
    id v6 = WeakRetained;
    v3 = [*(id *)(a1 + 32) selectedColor];
    v4 = NilColorIfTransparent(v3);

    if (*(unsigned char *)(a1 + 48)) {
      [v6 _setTintColor:v4];
    }
    else {
      [v6 _setTextColor:v4];
    }
    v5 = [v6 delegate];
    [v5 notificationListBaseComponentDidSignificantUserInteraction:v6];

    id WeakRetained = v6;
  }
}

- (id)tableView:(id)a3 viewForHeaderInSection:(int64_t)a4
{
  v5 = objc_msgSend(a3, "dequeueReusableHeaderFooterViewWithIdentifier:", @"header", a4);
  if (!v5) {
    v5 = (void *)[objc_alloc(MEMORY[0x1E4FB1D30]) initWithReuseIdentifier:@"header"];
  }
  [(NSPointerArray *)self->_weakStackViewControllers unui_compact];
  id v6 = [v5 textLabel];
  id v7 = NSString;
  v8 = &stru_1F2F516F8;
  if (!self->_stackSubordinate && [(NSPointerArray *)self->_weakStackViewControllers count]) {
    v8 = @": Controls All Stack";
  }
  v9 = [v7 stringWithFormat:@"Color Configuration%@", v8];
  [v6 setText:v9];

  v10 = [v5 textLabel];
  id v11 = [(NCSupplementaryViewPrototypeRecipeViewController *)self configuration];
  objc_super v12 = [v11 textColor];
  [v10 setTextColor:v12];

  return v5;
}

- (void)tableView:(id)a3 willDisplayHeaderView:(id)a4 forSection:(int64_t)a5
{
  v5 = (void *)MEMORY[0x1E4FB1618];
  id v6 = a3;
  id v7 = [v5 clearColor];
  [v6 setBackgroundColor:v7];
}

- (id)tableView:(id)a3 willSelectRowAtIndexPath:(id)a4
{
  id v4 = a4;
  if ([v4 row] == 2) {
    v5 = v4;
  }
  else {
    v5 = 0;
  }
  id v6 = v5;

  return v6;
}

- (void)tableView:(id)a3 didSelectRowAtIndexPath:(id)a4
{
  if (objc_msgSend(a4, "row", a3) == 2)
  {
    uint64_t v5 = 3;
    do
    {
      id v6 = [NCSupplementaryViewPrototypeRecipeContentTintingViewController alloc];
      id v7 = [(NCSupplementaryViewPrototypeRecipeViewController *)self configuration];
      v8 = [v7 groupingIdentifier];
      id v9 = [(NCSupplementaryViewPrototypeRecipeContentTintingViewController *)v6 _initWithGroupingIdentifier:v8 stackSubordinate:1];

      v10 = [(NCSupplementaryViewPrototypeRecipeViewController *)self delegate];
      id v11 = [(NCSupplementaryViewPrototypeRecipeViewController *)self configuration];
      objc_super v12 = [v11 groupingIdentifier];

      v18[0] = MEMORY[0x1E4F143A8];
      v18[1] = 3221225472;
      v18[2] = __100__NCSupplementaryViewPrototypeRecipeContentTintingViewController_tableView_didSelectRowAtIndexPath___block_invoke;
      v18[3] = &unk_1E6A94F80;
      id v13 = v12;
      id v19 = v13;
      BOOL v20 = self;
      [v9 updateConfiguration:v18];
      [v9 setDelegate:v10];
      [v10 requestsInsertForPrototypeRecipeViewController:v9];
      [v10 notificationListBaseComponentDidSignificantUserInteraction:self];
      weakStackViewControllers = self->_weakStackViewControllers;
      if (weakStackViewControllers)
      {
        id v15 = weakStackViewControllers;
      }
      else
      {
        id v15 = [MEMORY[0x1E4F28F50] weakObjectsPointerArray];
      }
      id v16 = self->_weakStackViewControllers;
      self->_weakStackViewControllers = v15;

      [(NSPointerArray *)self->_weakStackViewControllers addPointer:v9];
      v17 = [MEMORY[0x1E4F1C9C8] now];
      [(NCSupplementaryViewPrototypeRecipeViewController *)self setDateModified:v17];

      [(UITableView *)self->_tableView reloadData];
      [v10 requestsUpdatePositionIfNeededForPrototypeRecipeViewController:self];

      --v5;
    }
    while (v5);
  }
}

void __100__NCSupplementaryViewPrototypeRecipeContentTintingViewController_tableView_didSelectRowAtIndexPath___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v3 = *(void *)(a1 + 32);
  id v4 = a2;
  [v4 setGroupingIdentifier:v3];
  [v4 setGroupName:*(void *)(a1 + 32)];
  uint64_t v5 = [*(id *)(a1 + 40) configuration];
  id v6 = [v5 tintColor];
  [v4 setTintColor:v6];

  id v8 = [*(id *)(a1 + 40) configuration];
  id v7 = [v8 textColor];
  [v4 setTextColor:v7];
}

- (void)_setTextColor:(id)a3
{
  uint64_t v28 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  long long v23 = 0u;
  long long v24 = 0u;
  long long v25 = 0u;
  long long v26 = 0u;
  uint64_t v5 = [(UITableView *)self->_tableView visibleCells];
  uint64_t v6 = [v5 countByEnumeratingWithState:&v23 objects:v27 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v24;
    do
    {
      uint64_t v9 = 0;
      do
      {
        if (*(void *)v24 != v8) {
          objc_enumerationMutation(v5);
        }
        v10 = [*(id *)(*((void *)&v23 + 1) + 8 * v9) textLabel];
        id v11 = [(NCSupplementaryViewPrototypeRecipeViewController *)self configuration];
        objc_super v12 = [v11 textColor];
        [v10 setTextColor:v12];

        ++v9;
      }
      while (v7 != v9);
      uint64_t v7 = [v5 countByEnumeratingWithState:&v23 objects:v27 count:16];
    }
    while (v7);
  }

  id v13 = [(UITableView *)self->_tableView headerViewForSection:0];
  v14 = [v13 textLabel];
  id v15 = [(NCSupplementaryViewPrototypeRecipeViewController *)self configuration];
  id v16 = [v15 textColor];
  [v14 setTextColor:v16];

  v21[0] = MEMORY[0x1E4F143A8];
  v21[1] = 3221225472;
  v21[2] = __80__NCSupplementaryViewPrototypeRecipeContentTintingViewController__setTextColor___block_invoke;
  v21[3] = &unk_1E6A94F58;
  id v17 = v4;
  id v22 = v17;
  [(NCSupplementaryViewPrototypeRecipeViewController *)self updateConfiguration:v21];
  v19[0] = MEMORY[0x1E4F143A8];
  v19[1] = 3221225472;
  v19[2] = __80__NCSupplementaryViewPrototypeRecipeContentTintingViewController__setTextColor___block_invoke_2;
  v19[3] = &unk_1E6A94FA8;
  id v20 = v17;
  id v18 = v17;
  [(NCSupplementaryViewPrototypeRecipeContentTintingViewController *)self _enumerateStack:v19];
}

uint64_t __80__NCSupplementaryViewPrototypeRecipeContentTintingViewController__setTextColor___block_invoke(uint64_t a1, void *a2)
{
  return [a2 setTextColor:*(void *)(a1 + 32)];
}

uint64_t __80__NCSupplementaryViewPrototypeRecipeContentTintingViewController__setTextColor___block_invoke_2(uint64_t a1, void *a2)
{
  return [a2 _setTextColor:*(void *)(a1 + 32)];
}

- (void)_setTintColor:(id)a3
{
  id v4 = a3;
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __80__NCSupplementaryViewPrototypeRecipeContentTintingViewController__setTintColor___block_invoke;
  v9[3] = &unk_1E6A94F58;
  id v5 = v4;
  id v10 = v5;
  [(NCSupplementaryViewPrototypeRecipeViewController *)self updateConfiguration:v9];
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __80__NCSupplementaryViewPrototypeRecipeContentTintingViewController__setTintColor___block_invoke_2;
  v7[3] = &unk_1E6A94FA8;
  id v8 = v5;
  id v6 = v5;
  [(NCSupplementaryViewPrototypeRecipeContentTintingViewController *)self _enumerateStack:v7];
}

uint64_t __80__NCSupplementaryViewPrototypeRecipeContentTintingViewController__setTintColor___block_invoke(uint64_t a1, void *a2)
{
  return [a2 setTintColor:*(void *)(a1 + 32)];
}

uint64_t __80__NCSupplementaryViewPrototypeRecipeContentTintingViewController__setTintColor___block_invoke_2(uint64_t a1, void *a2)
{
  return [a2 _setTintColor:*(void *)(a1 + 32)];
}

- (void)_enumerateStack:(id)a3
{
  id v6 = (void (**)(id, void *))a3;
  [(NSPointerArray *)self->_weakStackViewControllers unui_compact];
  if ([(NSPointerArray *)self->_weakStackViewControllers count])
  {
    unint64_t v4 = 0;
    do
    {
      id v5 = [(NSPointerArray *)self->_weakStackViewControllers pointerAtIndex:v4];
      if (v5) {
        v6[2](v6, v5);
      }

      ++v4;
    }
    while (v4 < [(NSPointerArray *)self->_weakStackViewControllers count]);
  }
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_weakStackViewControllers, 0);

  objc_storeStrong((id *)&self->_tableView, 0);
}

@end