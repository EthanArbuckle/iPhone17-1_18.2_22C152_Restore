@interface WFAutomationSelectTypeViewController
+ (id)allKnownTriggersSortedAsInUI;
+ (unint64_t)automationTypeForHomeManager:(id)a3;
- (NSArray)availableFocusModes;
- (NSArray)tableContent;
- (UISearchController)searchController;
- (WFAutomationSelectTypeViewController)initWithTriggerManager:(id)a3;
- (WFAutomationSelectTypeViewControllerDelegate)delegate;
- (WFHomeManager)homeManager;
- (WFTriggerManager)triggerManager;
- (id)allTriggerTypeGroups;
- (id)buildTableContent;
- (id)currentSections;
- (id)tableView:(id)a3 cellForRowAtIndexPath:(id)a4;
- (id)tableView:(id)a3 viewForHeaderInSection:(int64_t)a4;
- (id)triggerForIndexPath:(id)a3;
- (int64_t)numberOfSectionsInTableView:(id)a3;
- (int64_t)tableView:(id)a3 numberOfRowsInSection:(int64_t)a4;
- (void)chooseHomeAutomation:(id)a3;
- (void)homeManagerDidUpdateHomes:(id)a3;
- (void)setAvailableFocusModes:(id)a3;
- (void)setDelegate:(id)a3;
- (void)tableView:(id)a3 didSelectRowAtIndexPath:(id)a4;
- (void)updateSearchResultsForSearchController:(id)a3;
- (void)viewDidLoad;
- (void)viewWillAppear:(BOOL)a3;
@end

@implementation WFAutomationSelectTypeViewController

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_availableFocusModes, 0);
  objc_storeStrong((id *)&self->_searchController, 0);
  objc_storeStrong((id *)&self->_homeManager, 0);
  objc_storeStrong((id *)&self->_tableContent, 0);
  objc_storeStrong((id *)&self->_triggerManager, 0);
  objc_destroyWeak((id *)&self->_delegate);
}

- (void)setAvailableFocusModes:(id)a3
{
}

- (NSArray)availableFocusModes
{
  return self->_availableFocusModes;
}

- (UISearchController)searchController
{
  return self->_searchController;
}

- (WFHomeManager)homeManager
{
  return self->_homeManager;
}

- (NSArray)tableContent
{
  return self->_tableContent;
}

- (WFTriggerManager)triggerManager
{
  return self->_triggerManager;
}

- (void)setDelegate:(id)a3
{
}

- (WFAutomationSelectTypeViewControllerDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  return (WFAutomationSelectTypeViewControllerDelegate *)WeakRetained;
}

- (void)updateSearchResultsForSearchController:(id)a3
{
  id v3 = [(WFAutomationSelectTypeViewController *)self tableView];
  [v3 reloadData];
}

- (id)buildTableContent
{
  uint64_t v25 = *MEMORY[0x263EF8340];
  id v3 = [MEMORY[0x263F86B68] availableModesForAutomationsDisplay];
  availableFocusModes = self->_availableFocusModes;
  self->_availableFocusModes = v3;

  v5 = objc_opt_new();
  long long v16 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  v6 = [(WFAutomationSelectTypeViewController *)self allTriggerTypeGroups];
  uint64_t v7 = [v6 countByEnumeratingWithState:&v16 objects:v24 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v9 = *(void *)v17;
    do
    {
      for (uint64_t i = 0; i != v8; ++i)
      {
        if (*(void *)v17 != v9) {
          objc_enumerationMutation(v6);
        }
        v11 = objc_msgSend(*(id *)(*((void *)&v16 + 1) + 8 * i), "if_objectsPassingTest:", &__block_literal_global_239);
        if ([v11 count])
        {
          v22[0] = @"sectionIdentifier";
          v22[1] = @"triggerClasses";
          v23[0] = @"triggerTypes";
          v23[1] = v11;
          v12 = [NSDictionary dictionaryWithObjects:v23 forKeys:v22 count:2];
          [v5 addObject:v12];
        }
      }
      uint64_t v8 = [v6 countByEnumeratingWithState:&v16 objects:v24 count:16];
    }
    while (v8);
  }

  v20 = @"sectionIdentifier";
  v21 = @"homePlatter";
  v13 = [NSDictionary dictionaryWithObjects:&v21 forKeys:&v20 count:1];
  [v5 addObject:v13];

  v14 = (void *)[v5 copy];
  return v14;
}

uint64_t __57__WFAutomationSelectTypeViewController_buildTableContent__block_invoke(uint64_t a1, void *a2)
{
  return [a2 isSupportedOnThisDevice];
}

- (id)allTriggerTypeGroups
{
  v36[8] = *MEMORY[0x263EF8340];
  id v3 = objc_opt_new();
  v4 = [MEMORY[0x263EFFA40] workflowUserDefaults];
  int v5 = [v4 BOOLForKey:*MEMORY[0x263F874B8]];

  if (v5) {
    [v3 addObject:objc_opt_class()];
  }
  v6 = [MEMORY[0x263EFFA40] workflowUserDefaults];
  int v7 = [v6 BOOLForKey:*MEMORY[0x263F874C0]];

  if (v7) {
    [v3 addObject:objc_opt_class()];
  }
  uint64_t v8 = objc_opt_new();
  uint64_t v9 = [(WFAutomationSelectTypeViewController *)self availableFocusModes];
  uint64_t v10 = [v9 count];

  if (v10 >= 1)
  {
    uint64_t v11 = v10;
    do
    {
      [v8 addObject:objc_opt_class()];
      --v11;
    }
    while (v11);
  }
  uint64_t v25 = v10;
  id v12 = objc_alloc(MEMORY[0x263EFF980]);
  v35[0] = objc_opt_class();
  v35[1] = objc_opt_class();
  v35[2] = objc_opt_class();
  v24 = [MEMORY[0x263EFF8C0] arrayWithObjects:v35 count:3];
  v36[0] = v24;
  v34[0] = objc_opt_class();
  v34[1] = objc_opt_class();
  v34[2] = objc_opt_class();
  v34[3] = objc_opt_class();
  v13 = [MEMORY[0x263EFF8C0] arrayWithObjects:v34 count:4];
  v36[1] = v13;
  v36[2] = v3;
  v26 = v3;
  uint64_t v33 = objc_opt_class();
  v14 = [MEMORY[0x263EFF8C0] arrayWithObjects:&v33 count:1];
  v36[3] = v14;
  v32[0] = objc_opt_class();
  v32[1] = objc_opt_class();
  v32[2] = objc_opt_class();
  v15 = [MEMORY[0x263EFF8C0] arrayWithObjects:v32 count:3];
  v36[4] = v15;
  v31[0] = objc_opt_class();
  v31[1] = objc_opt_class();
  long long v16 = [MEMORY[0x263EFF8C0] arrayWithObjects:v31 count:2];
  v36[5] = v16;
  v30[0] = objc_opt_class();
  v30[1] = objc_opt_class();
  long long v17 = [MEMORY[0x263EFF8C0] arrayWithObjects:v30 count:2];
  v36[6] = v17;
  v29[0] = objc_opt_class();
  v29[1] = objc_opt_class();
  v29[2] = objc_opt_class();
  long long v18 = [MEMORY[0x263EFF8C0] arrayWithObjects:v29 count:3];
  v36[7] = v18;
  long long v19 = [MEMORY[0x263EFF8C0] arrayWithObjects:v36 count:8];
  v20 = (void *)[v12 initWithArray:v19];

  if (v25 > 0) {
    [v20 addObject:v8];
  }
  uint64_t v28 = objc_opt_class();
  v21 = [MEMORY[0x263EFF8C0] arrayWithObjects:&v28 count:1];
  [v20 addObject:v21];

  uint64_t v27 = objc_opt_class();
  v22 = [MEMORY[0x263EFF8C0] arrayWithObjects:&v27 count:1];
  [v20 insertObject:v22 atIndex:3];

  return v20;
}

- (id)triggerForIndexPath:(id)a3
{
  id v4 = a3;
  int v5 = [(WFAutomationSelectTypeViewController *)self currentSections];
  v6 = objc_msgSend(v5, "objectAtIndexedSubscript:", objc_msgSend(v4, "section"));

  int v7 = [v6 objectForKeyedSubscript:@"triggerClasses"];
  id v8 = (id)objc_msgSend(v7, "objectAtIndexedSubscript:", objc_msgSend(v4, "row"));

  if (v8 == (id)objc_opt_class())
  {
    uint64_t v10 = [(WFAutomationSelectTypeViewController *)self availableFocusModes];
    uint64_t v11 = objc_msgSend(v10, "objectAtIndex:", objc_msgSend(v4, "row"));

    uint64_t v9 = (void *)[objc_alloc(MEMORY[0x263F86F88]) initWithActivity:v11];
  }
  else
  {
    uint64_t v9 = objc_opt_new();
  }

  return v9;
}

- (id)currentSections
{
  id v3 = [(WFAutomationSelectTypeViewController *)self searchController];
  if ([v3 isActive])
  {
    id v4 = [(WFAutomationSelectTypeViewController *)self searchController];
    int v5 = [v4 searchBar];
    v6 = [v5 text];
    uint64_t v7 = [v6 length];

    if (v7)
    {
      id v8 = [(WFAutomationSelectTypeViewController *)self searchController];
      uint64_t v9 = [v8 searchBar];
      uint64_t v10 = [v9 text];

      uint64_t v11 = [(WFAutomationSelectTypeViewController *)self tableContent];
      v15[0] = MEMORY[0x263EF8330];
      v15[1] = 3221225472;
      v15[2] = __55__WFAutomationSelectTypeViewController_currentSections__block_invoke;
      v15[3] = &unk_2649CB678;
      id v16 = v10;
      id v12 = v10;
      v13 = objc_msgSend(v11, "if_compactMap:", v15);

      goto LABEL_6;
    }
  }
  else
  {
  }
  v13 = [(WFAutomationSelectTypeViewController *)self tableContent];
LABEL_6:
  return v13;
}

id __55__WFAutomationSelectTypeViewController_currentSections__block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = [v3 objectForKeyedSubscript:@"sectionIdentifier"];
  int v5 = [v4 isEqualToString:@"triggerTypes"];

  if (v5)
  {
    v6 = (void *)[v3 mutableCopy];
    uint64_t v7 = [v3 objectForKeyedSubscript:@"triggerClasses"];

    v12[0] = MEMORY[0x263EF8330];
    v12[1] = 3221225472;
    v12[2] = __55__WFAutomationSelectTypeViewController_currentSections__block_invoke_2;
    v12[3] = &unk_2649CB650;
    id v13 = *(id *)(a1 + 32);
    id v8 = objc_msgSend(v7, "if_objectsPassingTest:", v12);
    if ([v8 count])
    {
      [v6 setObject:v8 forKeyedSubscript:@"triggerClasses"];
      id v9 = v6;
    }
    else
    {
      id v9 = 0;
    }
  }
  else
  {
    v6 = WFLocalizedString(@"Home");
    if ([v6 localizedCaseInsensitiveContainsString:*(void *)(a1 + 32)]) {
      uint64_t v10 = v3;
    }
    else {
      uint64_t v10 = 0;
    }
    id v9 = v10;
  }
  return v9;
}

uint64_t __55__WFAutomationSelectTypeViewController_currentSections__block_invoke_2(uint64_t a1, void *a2)
{
  id v3 = [a2 localizedDisplayName];
  uint64_t v4 = [v3 localizedCaseInsensitiveContainsString:*(void *)(a1 + 32)];

  return v4;
}

- (id)tableView:(id)a3 viewForHeaderInSection:(int64_t)a4
{
  id v6 = a3;
  uint64_t v7 = [(WFAutomationSelectTypeViewController *)self currentSections];
  id v8 = [v7 objectAtIndexedSubscript:a4];

  id v9 = [v8 objectForKeyedSubscript:@"sectionIdentifier"];
  int v10 = [v9 isEqualToString:@"homePlatter"];

  if (v10)
  {
    uint64_t v11 = [v6 dequeueReusableHeaderFooterViewWithIdentifier:@"header"];
    id v12 = [MEMORY[0x263F82918] extraProminentInsetGroupedHeaderConfiguration];
    id v13 = WFLocalizedString(@"Home Automation");
    [v12 setText:v13];

    double v14 = 8.0;
    double v15 = 8.0;
    double v16 = 12.0;
LABEL_9:
    objc_msgSend(v12, "setDirectionalLayoutMargins:", v14, v15, v16, 8.0);
    [v11 setContentConfiguration:v12];

    goto LABEL_10;
  }
  long long v17 = [v8 objectForKeyedSubscript:@"sectionIdentifier"];
  int v18 = [v17 isEqualToString:@"triggerTypes"];

  uint64_t v11 = 0;
  if (!a4 && v18)
  {
    uint64_t v11 = [v6 dequeueReusableHeaderFooterViewWithIdentifier:@"header"];
    id v12 = [MEMORY[0x263F82918] extraProminentInsetGroupedHeaderConfiguration];
    long long v19 = WFLocalizedString(@"Personal Automation");
    [v12 setText:v19];

    v20 = [MEMORY[0x263F85258] currentDevice];
    unint64_t v21 = [v20 idiom];

    if (v21 > 4) {
      v22 = @"An automation that runs on your device.";
    }
    else {
      v22 = off_2649CC130[v21];
    }
    v23 = WFLocalizedString(v22);
    [v12 setSecondaryText:v23];

    double v14 = 8.0;
    double v15 = 8.0;
    double v16 = 14.0;
    goto LABEL_9;
  }
LABEL_10:

  return v11;
}

- (void)tableView:(id)a3 didSelectRowAtIndexPath:(id)a4
{
  id v6 = a4;
  [a3 deselectRowAtIndexPath:v6 animated:1];
  id v8 = [(WFAutomationSelectTypeViewController *)self triggerForIndexPath:v6];

  if (v8)
  {
    uint64_t v7 = [(WFAutomationSelectTypeViewController *)self delegate];
    [v7 selectTypeViewController:self didChooseTrigger:v8];
  }
}

- (void)chooseHomeAutomation:(id)a3
{
  id v4 = [(WFAutomationSelectTypeViewController *)self delegate];
  [v4 selectTypeViewController:self didChooseAutomationType:1];
}

- (id)tableView:(id)a3 cellForRowAtIndexPath:(id)a4
{
  id v5 = a4;
  id v6 = [(WFAutomationSelectTypeViewController *)self currentSections];
  uint64_t v7 = objc_msgSend(v6, "objectAtIndexedSubscript:", objc_msgSend(v5, "section"));

  id v8 = [v7 objectForKeyedSubscript:@"sectionIdentifier"];
  int v9 = [v8 isEqualToString:@"triggerTypes"];

  int v10 = [(WFAutomationSelectTypeViewController *)self tableView];
  uint64_t v11 = (objc_class *)objc_opt_class();
  NSStringFromClass(v11);
  if (v9) {
    id v12 = {;
  }
    id v13 = [v10 dequeueReusableCellWithIdentifier:v12 forIndexPath:v5];

    double v14 = [(WFAutomationSelectTypeViewController *)self triggerForIndexPath:v5];
    [v13 setTrigger:v14];

    [v13 setAccessoryType:1];
  }
  else {
    double v15 = {;
  }
    id v13 = [v10 dequeueReusableCellWithIdentifier:v15 forIndexPath:v5];

    double v16 = objc_opt_class();
    long long v17 = [(WFAutomationSelectTypeViewController *)self homeManager];
    uint64_t v18 = [v16 automationTypeForHomeManager:v17];

    [v13 configureForAutomationType:v18 buttonTarget:self action:sel_chooseHomeAutomation_];
    [v13 setSelectionStyle:0];
  }

  return v13;
}

- (int64_t)tableView:(id)a3 numberOfRowsInSection:(int64_t)a4
{
  id v6 = [(WFAutomationSelectTypeViewController *)self currentSections];
  uint64_t v7 = [v6 objectAtIndexedSubscript:a4];

  id v8 = [v7 objectForKeyedSubscript:@"sectionIdentifier"];
  int v9 = [v8 isEqualToString:@"triggerTypes"];

  if (v9)
  {
    int v10 = [v7 objectForKeyedSubscript:@"triggerClasses"];
    if ([v10 containsObject:objc_opt_class()])
    {
      uint64_t v11 = [(WFAutomationSelectTypeViewController *)self availableFocusModes];
      int64_t v12 = [v11 count];
    }
    else
    {
      int64_t v12 = [v10 count];
    }
  }
  else
  {
    int64_t v12 = 1;
  }

  return v12;
}

- (int64_t)numberOfSectionsInTableView:(id)a3
{
  id v3 = [(WFAutomationSelectTypeViewController *)self currentSections];
  int64_t v4 = [v3 count];

  return v4;
}

- (void)viewWillAppear:(BOOL)a3
{
  int64_t v4 = [(WFAutomationSelectTypeViewController *)self homeManager];
  [v4 reloadData];

  objc_msgSend(MEMORY[0x263F825C8], "wf_accentColor");
  id v7 = (id)objc_claimAutoreleasedReturnValue();
  id v5 = [(WFAutomationSelectTypeViewController *)self navigationController];
  id v6 = [v5 navigationBar];
  [v6 setTintColor:v7];
}

- (void)homeManagerDidUpdateHomes:(id)a3
{
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __66__WFAutomationSelectTypeViewController_homeManagerDidUpdateHomes___block_invoke;
  block[3] = &unk_2649CBF20;
  block[4] = self;
  dispatch_async(MEMORY[0x263EF83A0], block);
}

void __66__WFAutomationSelectTypeViewController_homeManagerDidUpdateHomes___block_invoke(uint64_t a1)
{
  id v1 = [*(id *)(a1 + 32) tableView];
  [v1 reloadData];
}

- (void)viewDidLoad
{
  v19.receiver = self;
  v19.super_class = (Class)WFAutomationSelectTypeViewController;
  [(WFAutomationSelectTypeViewController *)&v19 viewDidLoad];
  id v3 = [(WFAutomationSelectTypeViewController *)self tableView];
  uint64_t v4 = objc_opt_class();
  id v5 = (objc_class *)objc_opt_class();
  id v6 = NSStringFromClass(v5);
  [v3 registerClass:v4 forCellReuseIdentifier:v6];

  id v7 = [(WFAutomationSelectTypeViewController *)self tableView];
  uint64_t v8 = objc_opt_class();
  int v9 = (objc_class *)objc_opt_class();
  int v10 = NSStringFromClass(v9);
  [v7 registerClass:v8 forCellReuseIdentifier:v10];

  uint64_t v11 = [(WFAutomationSelectTypeViewController *)self tableView];
  [v11 registerClass:objc_opt_class() forHeaderFooterViewReuseIdentifier:@"header"];

  double v12 = *MEMORY[0x263F839B8];
  id v13 = [(WFAutomationSelectTypeViewController *)self tableView];
  [v13 setRowHeight:v12];

  double v14 = [(WFAutomationSelectTypeViewController *)self tableView];
  [v14 setEstimatedRowHeight:60.0];

  double v15 = [(WFAutomationSelectTypeViewController *)self searchController];
  [v15 setSearchResultsUpdater:self];

  double v16 = [(WFAutomationSelectTypeViewController *)self searchController];
  [v16 setObscuresBackgroundDuringPresentation:0];

  long long v17 = [(WFAutomationSelectTypeViewController *)self searchController];
  uint64_t v18 = [(WFAutomationSelectTypeViewController *)self navigationItem];
  [v18 setSearchController:v17];
}

- (WFAutomationSelectTypeViewController)initWithTriggerManager:(id)a3
{
  id v5 = a3;
  v16.receiver = self;
  v16.super_class = (Class)WFAutomationSelectTypeViewController;
  id v6 = [(WFAutomationSelectTypeViewController *)&v16 initWithStyle:2];
  id v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_triggerManager, a3);
    uint64_t v8 = [MEMORY[0x263F86C08] sharedManager];
    homeManager = v7->_homeManager;
    v7->_homeManager = (WFHomeManager *)v8;

    [(WFHomeManager *)v7->_homeManager addEventObserver:v7];
    int v10 = (UISearchController *)objc_alloc_init(MEMORY[0x263F82BA0]);
    searchController = v7->_searchController;
    v7->_searchController = v10;

    uint64_t v12 = [(WFAutomationSelectTypeViewController *)v7 buildTableContent];
    tableContent = v7->_tableContent;
    v7->_tableContent = (NSArray *)v12;

    double v14 = v7;
  }

  return v7;
}

+ (id)allKnownTriggersSortedAsInUI
{
  v2 = objc_alloc_init(WFAutomationSelectTypeViewController);
  id v3 = [MEMORY[0x263F86B68] availableModesForAutomationsDisplay];
  [(WFAutomationSelectTypeViewController *)v2 setAvailableFocusModes:v3];

  uint64_t v4 = [(WFAutomationSelectTypeViewController *)v2 allTriggerTypeGroups];
  id v5 = objc_msgSend(v4, "if_flatMap:", &__block_literal_global_12522);

  return v5;
}

id __68__WFAutomationSelectTypeViewController_allKnownTriggersSortedAsInUI__block_invoke(uint64_t a1, void *a2)
{
  id v2 = a2;
  return v2;
}

+ (unint64_t)automationTypeForHomeManager:(id)a3
{
  id v3 = a3;
  uint64_t v4 = [v3 homesToWhichWeHaveAdminAccess];
  uint64_t v5 = [v4 count];

  if (v5)
  {
    id v6 = [v3 homesToWhichWeCanAddHomeAutomations];
    uint64_t v7 = [v6 count];

    if (v7) {
      unint64_t v8 = 1;
    }
    else {
      unint64_t v8 = 3;
    }
  }
  else
  {
    unint64_t v8 = 2;
  }

  return v8;
}

@end