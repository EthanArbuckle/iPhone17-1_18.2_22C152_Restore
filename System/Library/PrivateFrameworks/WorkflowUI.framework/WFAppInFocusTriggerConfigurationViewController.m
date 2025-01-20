@interface WFAppInFocusTriggerConfigurationViewController
- (NSMutableArray)displayNameOfSelectedApps;
- (NSMutableOrderedSet)selectedApps;
- (WFAppInFocusTriggerConfigurationViewController)initWithTrigger:(id)a3 mode:(unint64_t)a4;
- (id)customSections;
- (id)infoForSection:(int64_t)a3;
- (id)tableView:(id)a3 cellForRowAtIndexPath:(id)a4;
- (id)tableView:(id)a3 titleForHeaderInSection:(int64_t)a4;
- (id)tableViewCellClasses;
- (int64_t)numberOfSectionsInTableView:(id)a3;
- (int64_t)tableView:(id)a3 numberOfRowsInSection:(int64_t)a4;
- (void)appSearchViewController:(id)a3 didFinishWithApps:(id)a4;
- (void)appSearchViewControllerDidCancel:(id)a3;
- (void)cell:(id)a3 didSelectOptionWithLeftViewSelected:(BOOL)a4 rightViewSelected:(BOOL)a5;
- (void)presentNavControllerWithRootViewController:(id)a3;
- (void)setDisplayNameOfSelectedApps:(id)a3;
- (void)setSelectedApps:(id)a3;
- (void)tableView:(id)a3 didSelectRowAtIndexPath:(id)a4;
- (void)updateDisplayNameOfSelectedApps;
- (void)viewWillAppear:(BOOL)a3;
@end

@implementation WFAppInFocusTriggerConfigurationViewController

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_displayNameOfSelectedApps, 0);
  objc_storeStrong((id *)&self->_selectedApps, 0);
}

- (void)setDisplayNameOfSelectedApps:(id)a3
{
}

- (NSMutableArray)displayNameOfSelectedApps
{
  return self->_displayNameOfSelectedApps;
}

- (void)setSelectedApps:(id)a3
{
}

- (NSMutableOrderedSet)selectedApps
{
  return self->_selectedApps;
}

- (void)cell:(id)a3 didSelectOptionWithLeftViewSelected:(BOOL)a4 rightViewSelected:(BOOL)a5
{
  BOOL v5 = a5;
  BOOL v6 = a4;
  v8 = [(WFTriggerConfigurationViewController *)self trigger];
  [v8 setOnFocus:v6];

  v9 = [(WFTriggerConfigurationViewController *)self trigger];
  [v9 setOnBackground:v5];

  [(WFTriggerConfigurationViewController *)self updateNextButtonEnabledState];
}

- (void)appSearchViewController:(id)a3 didFinishWithApps:(id)a4
{
  uint64_t v24 = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v7 = a4;
  v8 = objc_msgSend(v7, "if_map:", &__block_literal_global_217);
  v9 = [(WFTriggerConfigurationViewController *)self trigger];
  [v9 setSelectedBundleIdentifiers:v8];

  v10 = [(WFAppInFocusTriggerConfigurationViewController *)self selectedApps];
  [v10 removeAllObjects];

  long long v21 = 0u;
  long long v22 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  id v11 = v7;
  uint64_t v12 = [v11 countByEnumeratingWithState:&v19 objects:v23 count:16];
  if (v12)
  {
    uint64_t v13 = v12;
    uint64_t v14 = *(void *)v20;
    do
    {
      uint64_t v15 = 0;
      do
      {
        if (*(void *)v20 != v14) {
          objc_enumerationMutation(v11);
        }
        uint64_t v16 = *(void *)(*((void *)&v19 + 1) + 8 * v15);
        v17 = [(WFAppInFocusTriggerConfigurationViewController *)self selectedApps];
        [v17 addObject:v16];

        ++v15;
      }
      while (v13 != v15);
      uint64_t v13 = [v11 countByEnumeratingWithState:&v19 objects:v23 count:16];
    }
    while (v13);
  }

  [(WFAppInFocusTriggerConfigurationViewController *)self updateDisplayNameOfSelectedApps];
  [v6 dismissViewControllerAnimated:1 completion:0];
  v18 = [(WFTriggerConfigurationViewController *)self tableView];
  [v18 reloadData];

  [(WFTriggerConfigurationViewController *)self updateNextButtonEnabledState];
}

uint64_t __92__WFAppInFocusTriggerConfigurationViewController_appSearchViewController_didFinishWithApps___block_invoke(uint64_t a1, void *a2)
{
  return [a2 bundleIdentifier];
}

- (void)appSearchViewControllerDidCancel:(id)a3
{
}

- (void)updateDisplayNameOfSelectedApps
{
  uint64_t v17 = *MEMORY[0x263EF8340];
  v3 = [(WFAppInFocusTriggerConfigurationViewController *)self displayNameOfSelectedApps];
  [v3 removeAllObjects];

  long long v14 = 0u;
  long long v15 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  v4 = [(WFAppInFocusTriggerConfigurationViewController *)self selectedApps];
  uint64_t v5 = [v4 countByEnumeratingWithState:&v12 objects:v16 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v13;
    do
    {
      uint64_t v8 = 0;
      do
      {
        if (*(void *)v13 != v7) {
          objc_enumerationMutation(v4);
        }
        v9 = *(void **)(*((void *)&v12 + 1) + 8 * v8);
        v10 = [(WFAppInFocusTriggerConfigurationViewController *)self displayNameOfSelectedApps];
        id v11 = [v9 localizedName];
        [v10 addObject:v11];

        ++v8;
      }
      while (v6 != v8);
      uint64_t v6 = [v4 countByEnumeratingWithState:&v12 objects:v16 count:16];
    }
    while (v6);
  }
}

- (void)presentNavControllerWithRootViewController:(id)a3
{
  v4 = (objc_class *)MEMORY[0x263F829B8];
  id v5 = a3;
  id v6 = (id)[[v4 alloc] initWithRootViewController:v5];

  [(WFAppInFocusTriggerConfigurationViewController *)self presentViewController:v6 animated:1 completion:0];
}

- (void)tableView:(id)a3 didSelectRowAtIndexPath:(id)a4
{
  uint64_t v22 = *MEMORY[0x263EF8340];
  id v6 = a4;
  [a3 deselectRowAtIndexPath:v6 animated:1];
  uint64_t v7 = -[WFAppInFocusTriggerConfigurationViewController infoForSection:](self, "infoForSection:", [v6 section]);
  uint64_t v8 = [v7 objectForKeyedSubscript:@"identifier"];
  int v9 = [v8 isEqual:@"chooseApps"];

  if (v9)
  {
    v10 = getWFTriggersLogObject();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)buf = 136315394;
      long long v19 = "-[WFAppInFocusTriggerConfigurationViewController tableView:didSelectRowAtIndexPath:]";
      __int16 v20 = 2114;
      long long v21 = v7;
      _os_log_impl(&dword_22D994000, v10, OS_LOG_TYPE_DEBUG, "%s didselect section: %{public}@", buf, 0x16u);
    }

    id v11 = [WFAppSearchViewController alloc];
    uint64_t v17 = *MEMORY[0x263F855B8];
    long long v12 = [MEMORY[0x263EFF8C0] arrayWithObjects:&v17 count:1];
    long long v13 = [(WFAppInFocusTriggerConfigurationViewController *)self selectedApps];
    long long v14 = [(WFAppSearchViewController *)v11 initWithAppSearchType:0 omittedAppBundleIDs:v12 allowMultipleSelection:1 selectedApps:v13];

    [(WFAppSearchViewController *)v14 setDelegate:self];
    long long v15 = WFLocalizedString(@"Choose Apps");
    [(WFAppSearchViewController *)v14 setTitle:v15];

    [(WFAppInFocusTriggerConfigurationViewController *)self presentNavControllerWithRootViewController:v14];
  }
  [(WFTriggerConfigurationViewController *)self didSelectRowAtIndexPath:v6 withSectionInfo:v7];
  uint64_t v16 = [(WFTriggerConfigurationViewController *)self tableView];
  [v16 reloadData];
}

- (id)tableView:(id)a3 titleForHeaderInSection:(int64_t)a4
{
  v4 = [(WFAppInFocusTriggerConfigurationViewController *)self infoForSection:a4];
  id v5 = [v4 objectForKeyedSubscript:@"sectionTitle"];

  return v5;
}

- (id)tableView:(id)a3 cellForRowAtIndexPath:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  uint64_t v8 = -[WFAppInFocusTriggerConfigurationViewController infoForSection:](self, "infoForSection:", [v6 section]);
  int v9 = [v8 objectForKeyedSubscript:@"cellIdentifier"];
  v10 = [v7 dequeueReusableCellWithIdentifier:v9 forIndexPath:v6];

  [v10 setAccessoryType:0];
  id v11 = [v8 objectForKeyedSubscript:@"identifier"];
  int v12 = [v11 isEqual:@"triggerDescription"];

  if (v12)
  {
    [v10 setTriggerTypeClass:objc_opt_class()];
    [v10 setSelectionStyle:0];
  }
  else
  {
    long long v13 = [v8 objectForKeyedSubscript:@"identifier"];
    int v14 = [v13 isEqual:@"chooseApps"];

    id v15 = v10;
    uint64_t v16 = v15;
    if (v14)
    {
      uint64_t v17 = WFLocalizedString(@"App");
      v18 = [v16 textLabel];
      [v18 setText:v17];

      long long v19 = [(WFTriggerConfigurationViewController *)self trigger];
      __int16 v20 = [v19 selectedBundleIdentifiers];
      uint64_t v21 = [v20 count];

      if (v21)
      {
        uint64_t v22 = [(WFTriggerConfigurationViewController *)self trigger];
        v23 = [v22 selectedBundleIdentifiers];
        uint64_t v24 = [v23 count];

        if (v24 == 1)
        {
          v25 = [(WFAppInFocusTriggerConfigurationViewController *)self displayNameOfSelectedApps];
          v26 = [v25 objectAtIndexedSubscript:0];
          v27 = [v16 detailTextLabel];
          [v27 setText:v26];
        }
        else
        {
          v39 = NSString;
          v25 = WFLocalizedString(@"Any of %lu Apps");
          v26 = [(WFTriggerConfigurationViewController *)self trigger];
          [v26 selectedBundleIdentifiers];
          v40 = v52 = v9;
          v41 = objc_msgSend(v39, "localizedStringWithFormat:", v25, objc_msgSend(v40, "count"));
          v42 = [v16 detailTextLabel];
          [v42 setText:v41];

          int v9 = v52;
        }
      }
      else
      {
        v25 = WFLocalizedString(@"Choose");
        v26 = [v16 detailTextLabel];
        [v26 setText:v25];
      }
    }
    else
    {
      v51 = v9;
      id v48 = v6;
      v45 = v8;
      if (v15)
      {
        objc_opt_class();
        if (objc_opt_isKindOfClass()) {
          v28 = v16;
        }
        else {
          v28 = 0;
        }
      }
      else
      {
        v28 = 0;
      }
      id v53 = v28;

      v50 = [(WFTriggerConfigurationViewController *)self trigger];
      v29 = [(id)objc_opt_class() onIcon];
      v49 = [(WFTriggerConfigurationViewController *)self trigger];
      v30 = [(id)objc_opt_class() onLabel];
      v47 = [(WFTriggerConfigurationViewController *)self trigger];
      v31 = [(id)objc_opt_class() onIconTintColor];
      v46 = [(WFTriggerConfigurationViewController *)self trigger];
      v32 = [(id)objc_opt_class() offIcon];
      v33 = [(WFTriggerConfigurationViewController *)self trigger];
      v34 = [(id)objc_opt_class() offLabel];
      v35 = [(WFTriggerConfigurationViewController *)self trigger];
      v36 = [(id)objc_opt_class() offIconTintColor];
      [v53 configureWithLeftGlyph:v29 leftTitle:v30 leftTintColor:v31 rightGlyph:v32 rightTitle:v34 rightTintColor:v36];

      v37 = [(WFTriggerConfigurationViewController *)self trigger];
      objc_msgSend(v53, "setLeftViewSelected:", objc_msgSend(v37, "onFocus"));

      v38 = [(WFTriggerConfigurationViewController *)self trigger];
      objc_msgSend(v53, "setRightViewSelected:", objc_msgSend(v38, "onBackground"));

      [v53 setDelegate:self];
      int v9 = v51;
      id v6 = v48;
      uint64_t v8 = v45;
    }
  }
  v43 = [(WFTriggerConfigurationViewController *)self configureAdditionalCellsIfNeeded:v10 indexPath:v6 sectionInfo:v8];

  return v43;
}

- (int64_t)tableView:(id)a3 numberOfRowsInSection:(int64_t)a4
{
  id v5 = [(WFAppInFocusTriggerConfigurationViewController *)self infoForSection:a4];
  int64_t v6 = [(WFTriggerConfigurationViewController *)self numberOfRowsInSectionWithInfo:v5];

  return v6;
}

- (int64_t)numberOfSectionsInTableView:(id)a3
{
  v3 = [(WFTriggerConfigurationViewController *)self sections];
  int64_t v4 = [v3 count];

  return v4;
}

- (id)infoForSection:(int64_t)a3
{
  int64_t v4 = [(WFTriggerConfigurationViewController *)self sections];
  id v5 = [v4 objectAtIndexedSubscript:a3];

  return v5;
}

- (void)viewWillAppear:(BOOL)a3
{
  v5.receiver = self;
  v5.super_class = (Class)WFAppInFocusTriggerConfigurationViewController;
  [(WFAppInFocusTriggerConfigurationViewController *)&v5 viewWillAppear:a3];
  int64_t v4 = [(WFTriggerConfigurationViewController *)self tableView];
  [v4 reloadData];
}

- (id)customSections
{
  v14[2] = *MEMORY[0x263EF8340];
  v12[0] = @"identifier";
  v12[1] = @"cellIdentifier";
  v13[0] = @"chooseApps";
  v2 = (objc_class *)objc_opt_class();
  v3 = NSStringFromClass(v2);
  v13[1] = v3;
  int64_t v4 = [NSDictionary dictionaryWithObjects:v13 forKeys:v12 count:2];
  v14[0] = v4;
  v10[1] = @"cellIdentifier";
  v11[0] = @"triggerParameters";
  v10[0] = @"identifier";
  objc_super v5 = (objc_class *)objc_opt_class();
  int64_t v6 = NSStringFromClass(v5);
  v11[1] = v6;
  id v7 = [NSDictionary dictionaryWithObjects:v11 forKeys:v10 count:2];
  v14[1] = v7;
  uint64_t v8 = [MEMORY[0x263EFF8C0] arrayWithObjects:v14 count:2];

  return v8;
}

- (id)tableViewCellClasses
{
  uint64_t v9 = *MEMORY[0x263EF8340];
  v2 = (void *)MEMORY[0x263EFFA08];
  uint64_t v6 = objc_opt_class();
  uint64_t v7 = objc_opt_class();
  uint64_t v8 = objc_opt_class();
  v3 = [MEMORY[0x263EFF8C0] arrayWithObjects:&v6 count:3];
  int64_t v4 = objc_msgSend(v2, "setWithArray:", v3, v6, v7);

  return v4;
}

- (WFAppInFocusTriggerConfigurationViewController)initWithTrigger:(id)a3 mode:(unint64_t)a4
{
  id v7 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    long long v19 = [MEMORY[0x263F08690] currentHandler];
    [v19 handleFailureInMethod:a2, self, @"WFAppInFocusTriggerConfigurationViewController.m", 38, @"Invalid parameter not satisfying: %@", @"[trigger isKindOfClass:[WFAppInFocusTrigger class]]" object file lineNumber description];
  }
  v20.receiver = self;
  v20.super_class = (Class)WFAppInFocusTriggerConfigurationViewController;
  uint64_t v8 = [(WFTriggerConfigurationViewController *)&v20 initWithTrigger:v7 mode:a4];
  if (v8)
  {
    uint64_t v9 = (NSMutableOrderedSet *)objc_alloc_init(MEMORY[0x263EFF9B0]);
    selectedApps = v8->_selectedApps;
    v8->_selectedApps = v9;

    id v11 = (NSMutableArray *)objc_alloc_init(MEMORY[0x263EFF980]);
    displayNameOfSelectedApps = v8->_displayNameOfSelectedApps;
    v8->_displayNameOfSelectedApps = v11;

    long long v13 = [v7 selectedBundleIdentifiers];
    uint64_t v14 = [v13 count];

    if (v14)
    {
      id v15 = [v7 selectedBundleIdentifiers];
      uint64_t v16 = objc_msgSend(v15, "if_compactMap:", &__block_literal_global_7816);

      [(NSMutableOrderedSet *)v8->_selectedApps addObjectsFromArray:v16];
      [(WFAppInFocusTriggerConfigurationViewController *)v8 updateDisplayNameOfSelectedApps];
    }
    uint64_t v17 = v8;
  }

  return v8;
}

uint64_t __71__WFAppInFocusTriggerConfigurationViewController_initWithTrigger_mode___block_invoke(uint64_t a1, uint64_t a2)
{
  return [MEMORY[0x263F01868] applicationProxyForIdentifier:a2];
}

@end