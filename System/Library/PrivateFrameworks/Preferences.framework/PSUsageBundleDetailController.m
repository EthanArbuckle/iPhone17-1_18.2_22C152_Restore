@interface PSUsageBundleDetailController
+ (id)mediaGroups;
+ (void)setupSpecifier:(id)a3 forMediaGroups:(id)a4;
- (BOOL)canBeShownFromSuspendedState;
- (BOOL)tableView:(id)a3 shouldIndentWhileEditingRowAtIndexPath:(id)a4;
- (id)size:(id)a3;
- (id)sizeForSpecifier:(id)a3;
- (id)specifiers;
- (int64_t)tableView:(id)a3 editingStyleForRowAtIndexPath:(id)a4;
- (void)loadView;
- (void)tableView:(id)a3 commitEditingStyle:(int64_t)a4 forRowAtIndexPath:(id)a5;
- (void)updateSizesAfterDeletingSize:(float)a3 shouldPop:(BOOL)a4;
@end

@implementation PSUsageBundleDetailController

+ (id)mediaGroups
{
  return 0;
}

+ (void)setupSpecifier:(id)a3 forMediaGroups:(id)a4
{
  id v4 = a3;
  id v9 = [v4 propertyForKey:@"USAGE_BUNDLE_APP"];
  v5 = [v9 usageBundleStorageReporter];
  if (objc_opt_respondsToSelector())
  {
    v6 = [v9 categories];
    if ([v6 count])
    {
      [v9 totalSize];
      if (v7 <= 0.0) {
        uint64_t v8 = 4;
      }
      else {
        uint64_t v8 = 2;
      }
    }
    else
    {
      uint64_t v8 = 4;
    }
  }
  else
  {
    uint64_t v8 = 4;
  }

  [v4 setCellType:v8];
}

- (void)loadView
{
  v8.receiver = self;
  v8.super_class = (Class)PSUsageBundleDetailController;
  [(PSListController *)&v8 loadView];
  v3 = [(PSListController *)self table];
  id v4 = objc_alloc(MEMORY[0x1E4F42FF0]);
  v5 = [MEMORY[0x1E4F42948] currentDevice];
  if (objc_msgSend(v5, "sf_isiPad")) {
    double v6 = 20.0;
  }
  else {
    double v6 = 10.0;
  }
  float v7 = objc_msgSend(v4, "initWithFrame:", 0.0, 0.0, 0.0, v6);

  [v3 setTableHeaderView:v7];
  [(PSEditableListController *)self setEditingButtonHidden:1 animated:0];
}

- (BOOL)canBeShownFromSuspendedState
{
  return 0;
}

- (id)size:(id)a3
{
  v3 = [a3 propertyForKey:@"USAGE_BUNDLE_APP"];
  id v4 = (void *)MEMORY[0x1E4F28B68];
  [v3 totalSize];
  double v6 = [v4 stringFromByteCount:(uint64_t)v5 countStyle:2];

  return v6;
}

- (int64_t)tableView:(id)a3 editingStyleForRowAtIndexPath:(id)a4
{
  float v5 = [(PSListController *)self specifierAtIndex:[(PSListController *)self indexForIndexPath:a4]];
  uint64_t v6 = [v5 cellType];
  float v7 = [v5 propertyForKey:@"USAGE_BUNDLE_CATEGORY"];
  objc_super v8 = [(PSListController *)self specifier];
  id v9 = [v8 propertyForKey:@"USAGE_BUNDLE_APP"];

  v10 = [v9 usageBundleStorageReporter];
  if ([v10 allowDeletionForCategory:v7])
  {
    unint64_t v11 = v6 - 1;
    v12 = [v9 usageBundleStorageReporter];
    char v13 = objc_opt_respondsToSelector();

    int64_t v14 = 0;
    if (v11 <= 3 && (v13 & 1) != 0) {
      int64_t v14 = [MEMORY[0x1E4F42738] isRunningInStoreDemoMode] ^ 1;
    }
  }
  else
  {

    int64_t v14 = 0;
  }

  return v14;
}

- (void)updateSizesAfterDeletingSize:(float)a3 shouldPop:(BOOL)a4
{
  BOOL v4 = a4;
  float v7 = [(PSListController *)self specifier];
  id v14 = [v7 propertyForKey:@"USAGE_BUNDLE_APP"];

  [v14 totalSize];
  *(float *)&double v9 = v8 - a3;
  v10 = [MEMORY[0x1E4F28ED0] numberWithFloat:v9];
  [v10 floatValue];
  objc_msgSend(v14, "setTotalSize:");
  [(PSSpecifier *)self->super.super.super._specifier setProperty:v10 forKey:@"TOTAL_SIZE"];
  [(id)objc_opt_class() setupSpecifier:self->super.super.super._specifier forMediaGroups:0];
  id WeakRetained = objc_loadWeakRetained((id *)&self->super.super.super._parentController);
  [WeakRetained reloadSpecifier:self->super.super.super._specifier];

  if (v4)
  {
    v12 = [(PSUsageBundleDetailController *)self navigationController];
    id v13 = (id)[v12 popViewControllerAnimated:1];
  }
}

- (void)tableView:(id)a3 commitEditingStyle:(int64_t)a4 forRowAtIndexPath:(id)a5
{
  uint64_t v6 = -[PSListController specifierAtIndex:](self, "specifierAtIndex:", -[PSListController indexForIndexPath:](self, "indexForIndexPath:", a5, a4));
  float v7 = [(PSListController *)self specifier];
  float v8 = [v7 propertyForKey:@"USAGE_BUNDLE_APP"];

  double v9 = [v8 bundleIdentifier];
  v10 = [v6 propertyForKey:@"USAGE_BUNDLE_CATEGORY"];
  unint64_t v11 = [v8 usageBundleStorageReporter];
  [v11 sizeForCategory:v10];
  int v13 = v12;

  id v14 = dispatch_get_global_queue(-2, 0);
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __80__PSUsageBundleDetailController_tableView_commitEditingStyle_forRowAtIndexPath___block_invoke;
  block[3] = &unk_1E5C5D548;
  id v20 = v8;
  id v21 = v10;
  id v22 = v9;
  id v15 = v9;
  id v16 = v10;
  id v17 = v8;
  dispatch_async(v14, block);

  LODWORD(v18) = v13;
  [(PSUsageBundleDetailController *)self updateSizesAfterDeletingSize:1 shouldPop:v18];
}

void __80__PSUsageBundleDetailController_tableView_commitEditingStyle_forRowAtIndexPath___block_invoke(uint64_t a1)
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  v2 = [*(id *)(a1 + 32) usageBundleStorageReporter];
  uint64_t v3 = *(void *)(a1 + 40);
  id v9 = 0;
  char v4 = [v2 deleteDataForCategory:v3 withError:&v9];
  id v5 = v9;

  if ((v4 & 1) == 0)
  {
    uint64_t v6 = _PSLoggingFacility();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v8 = *(void *)(a1 + 40);
      uint64_t v7 = *(void *)(a1 + 48);
      *(_DWORD *)buf = 138412802;
      uint64_t v11 = v7;
      __int16 v12 = 2112;
      uint64_t v13 = v8;
      __int16 v14 = 2112;
      id v15 = v5;
      _os_log_impl(&dword_1A6597000, v6, OS_LOG_TYPE_DEFAULT, "Unable to delete data for %@ : %@. Encountered error: %@", buf, 0x20u);
    }
  }
}

- (BOOL)tableView:(id)a3 shouldIndentWhileEditingRowAtIndexPath:(id)a4
{
  return [(PSUsageBundleDetailController *)self tableView:a3 editingStyleForRowAtIndexPath:a4] != 0;
}

- (id)sizeForSpecifier:(id)a3
{
  uint64_t v3 = [a3 propertyForKey:@"USAGE_BUNDLE_CATEGORY"];
  char v4 = [v3 usageBundleApp];
  id v5 = [v4 usageBundleStorageReporter];

  uint64_t v6 = (void *)MEMORY[0x1E4F28B68];
  [v5 sizeForCategory:v3];
  uint64_t v8 = [v6 stringFromByteCount:(uint64_t)v7 countStyle:2];

  return v8;
}

- (id)specifiers
{
  uint64_t v30 = *MEMORY[0x1E4F143B8];
  specifiers = self->super.super._specifiers;
  if (!specifiers)
  {
    char v4 = (NSArray *)objc_alloc_init(MEMORY[0x1E4F1CA48]);
    id v5 = [(PSListController *)self specifier];
    uint64_t v6 = [v5 propertyForKey:@"USAGE_BUNDLE_APP"];

    float v7 = [v6 name];
    uint64_t v8 = +[PSSpecifier preferenceSpecifierNamed:v7 target:0 set:0 get:0 detail:0 cell:0 edit:0];

    [v8 setProperty:@"PSUsageSizeHeader" forKey:@"headerCellClass"];
    v24 = self;
    id v9 = [(PSListController *)self specifier];
    v10 = [v9 propertyForKey:@"TOTAL_SIZE"];
    [v8 setProperty:v10 forKey:@"SIZE"];

    uint64_t v11 = v4;
    id v22 = v8;
    [(NSArray *)v4 insertObject:v8 atIndex:0];
    long long v27 = 0u;
    long long v28 = 0u;
    long long v25 = 0u;
    long long v26 = 0u;
    id obj = [v6 categories];
    uint64_t v12 = [obj countByEnumeratingWithState:&v25 objects:v29 count:16];
    if (v12)
    {
      uint64_t v13 = v12;
      uint64_t v14 = *(void *)v26;
      do
      {
        for (uint64_t i = 0; i != v13; ++i)
        {
          if (*(void *)v26 != v14) {
            objc_enumerationMutation(obj);
          }
          uint64_t v16 = *(void **)(*((void *)&v25 + 1) + 8 * i);
          id v17 = [v16 name];
          double v18 = +[PSSpecifier preferenceSpecifierNamed:v17 target:v24 set:0 get:sel_sizeForSpecifier_ detail:0 cell:4 edit:0];

          [v18 setProperty:v16 forKey:@"USAGE_BUNDLE_CATEGORY"];
          v19 = [v16 name];
          [v18 setProperty:v19 forKey:@"id"];

          [v18 setProperty:objc_opt_class() forKey:@"cellClass"];
          [(NSArray *)v11 addObject:v18];
        }
        uint64_t v13 = [obj countByEnumeratingWithState:&v25 objects:v29 count:16];
      }
      while (v13);
    }

    id v20 = v24->super.super._specifiers;
    v24->super.super._specifiers = v11;

    specifiers = v24->super.super._specifiers;
  }
  return specifiers;
}

@end