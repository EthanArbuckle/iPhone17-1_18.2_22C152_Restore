@interface WFSleepTriggerConfigurationViewController
- (BOOL)shouldEnableNextButton;
- (WFHealthFeatureAvailability)healthFeatureAvailability;
- (WFSleepTriggerConfigurationViewController)initWithTrigger:(id)a3 mode:(unint64_t)a4;
- (id)customSections;
- (id)footerLinkViewForTableView:(id)a3;
- (id)infoForSection:(int64_t)a3;
- (id)tableView:(id)a3 cellForRowAtIndexPath:(id)a4;
- (id)tableView:(id)a3 titleForHeaderInSection:(int64_t)a4;
- (id)tableView:(id)a3 viewForFooterInSection:(int64_t)a4;
- (id)tableViewCellClasses;
- (int64_t)numberOfSectionsInTableView:(id)a3;
- (int64_t)tableView:(id)a3 numberOfRowsInSection:(int64_t)a4;
- (void)healthFeatureAvailability:(id)a3 sleepOnboardingStatusDidChange:(unint64_t)a4;
- (void)setupParameterSectionCell:(id)a3 atRow:(int64_t)a4;
- (void)tableView:(id)a3 didSelectRowAtIndexPath:(id)a4;
- (void)updateUI;
- (void)viewDidLoad;
- (void)viewWillAppear:(BOOL)a3;
@end

@implementation WFSleepTriggerConfigurationViewController

- (void).cxx_destruct
{
}

- (WFHealthFeatureAvailability)healthFeatureAvailability
{
  return self->_healthFeatureAvailability;
}

- (BOOL)shouldEnableNextButton
{
  v3 = [(WFTriggerConfigurationViewController *)self trigger];
  if ([v3 hasValidConfiguration])
  {
    v4 = [(WFSleepTriggerConfigurationViewController *)self healthFeatureAvailability];
    BOOL v5 = [v4 sleepOnboardingStatus] == 1;
  }
  else
  {
    BOOL v5 = 0;
  }

  return v5;
}

- (void)healthFeatureAvailability:(id)a3 sleepOnboardingStatusDidChange:(unint64_t)a4
{
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __102__WFSleepTriggerConfigurationViewController_healthFeatureAvailability_sleepOnboardingStatusDidChange___block_invoke;
  block[3] = &unk_2649CBF20;
  block[4] = self;
  dispatch_async(MEMORY[0x263EF83A0], block);
}

uint64_t __102__WFSleepTriggerConfigurationViewController_healthFeatureAvailability_sleepOnboardingStatusDidChange___block_invoke(uint64_t a1)
{
  v2 = [*(id *)(a1 + 32) tableView];
  [v2 reloadData];

  v3 = *(void **)(a1 + 32);
  return [v3 updateNextButtonEnabledState];
}

- (void)tableView:(id)a3 didSelectRowAtIndexPath:(id)a4
{
  uint64_t v20 = *MEMORY[0x263EF8340];
  id v6 = a4;
  [a3 deselectRowAtIndexPath:v6 animated:1];
  v7 = -[WFSleepTriggerConfigurationViewController infoForSection:](self, "infoForSection:", [v6 section]);
  v8 = [v7 objectForKeyedSubscript:@"identifier"];
  int v9 = [v8 isEqual:@"triggerParameters"];

  if (v9)
  {
    v10 = getWFTriggersLogObject();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG))
    {
      int v16 = 136315394;
      v17 = "-[WFSleepTriggerConfigurationViewController tableView:didSelectRowAtIndexPath:]";
      __int16 v18 = 2114;
      v19 = v7;
      _os_log_impl(&dword_22D994000, v10, OS_LOG_TYPE_DEBUG, "%s didselect section: %{public}@", (uint8_t *)&v16, 0x16u);
    }

    if ([v6 row])
    {
      uint64_t v11 = [v6 row];
      v12 = [(WFTriggerConfigurationViewController *)self trigger];
      v13 = v12;
      if (v11 == 1) {
        uint64_t v14 = 1;
      }
      else {
        uint64_t v14 = 2;
      }
    }
    else
    {
      v12 = [(WFTriggerConfigurationViewController *)self trigger];
      v13 = v12;
      uint64_t v14 = 0;
    }
    [v12 setSelection:v14];
  }
  [(WFTriggerConfigurationViewController *)self didSelectRowAtIndexPath:v6 withSectionInfo:v7];
  v15 = [(WFTriggerConfigurationViewController *)self tableView];
  [v15 reloadData];

  [(WFTriggerConfigurationViewController *)self updateNextButtonEnabledState];
}

- (id)footerLinkViewForTableView:(id)a3
{
  uint64_t v45 = *MEMORY[0x263EF8340];
  id v4 = a3;
  BOOL v5 = [(WFSleepTriggerConfigurationViewController *)self healthFeatureAvailability];
  uint64_t v6 = [v5 sleepOnboardingStatus];

  if (v6 == 1)
  {
    id v7 = 0;
    goto LABEL_18;
  }
  v8 = (objc_class *)objc_opt_class();
  int v9 = NSStringFromClass(v8);
  v10 = [v4 dequeueReusableHeaderFooterViewWithIdentifier:v9];

  uint64_t v37 = 0;
  v38 = &v37;
  uint64_t v39 = 0x2020000000;
  uint64_t v11 = (id *)getHKSPSleepLaunchURLRouteOnboardSleepCoachingSymbolLoc_ptr;
  v40 = (void *)getHKSPSleepLaunchURLRouteOnboardSleepCoachingSymbolLoc_ptr;
  if (!getHKSPSleepLaunchURLRouteOnboardSleepCoachingSymbolLoc_ptr)
  {
    *(void *)&long long buf = MEMORY[0x263EF8330];
    *((void *)&buf + 1) = 3221225472;
    v42 = __getHKSPSleepLaunchURLRouteOnboardSleepCoachingSymbolLoc_block_invoke;
    v43 = &unk_2649CC0B8;
    v44 = &v37;
    v12 = SleepLibrary();
    v13 = dlsym(v12, "HKSPSleepLaunchURLRouteOnboardSleepCoaching");
    *(void *)(v44[1] + 24) = v13;
    getHKSPSleepLaunchURLRouteOnboardSleepCoachingSymbolLoc_ptr = *(void *)(v44[1] + 24);
    uint64_t v11 = (id *)v38[3];
  }
  _Block_object_dispose(&v37, 8);
  if (!v11)
  {
    v31 = [MEMORY[0x263F08690] currentHandler];
    v32 = [NSString stringWithUTF8String:"HKSPSleepLaunchURLRoute getHKSPSleepLaunchURLRouteOnboardSleepCoaching(void)"];
    objc_msgSend(v31, "handleFailureInFunction:file:lineNumber:description:", v32, @"WFSleepTriggerConfigurationViewController.m", 25, @"%s", dlerror());

    goto LABEL_24;
  }
  id v14 = *v11;
  uint64_t v37 = 0;
  v38 = &v37;
  uint64_t v39 = 0x2020000000;
  v15 = (id *)getHKSPProvenanceSourceShortcutsSymbolLoc_ptr;
  v40 = (void *)getHKSPProvenanceSourceShortcutsSymbolLoc_ptr;
  if (!getHKSPProvenanceSourceShortcutsSymbolLoc_ptr)
  {
    *(void *)&long long buf = MEMORY[0x263EF8330];
    *((void *)&buf + 1) = 3221225472;
    v42 = __getHKSPProvenanceSourceShortcutsSymbolLoc_block_invoke;
    v43 = &unk_2649CC0B8;
    v44 = &v37;
    int v16 = SleepLibrary();
    v17 = dlsym(v16, "HKSPProvenanceSourceShortcuts");
    *(void *)(v44[1] + 24) = v17;
    getHKSPProvenanceSourceShortcutsSymbolLoc_ptr = *(void *)(v44[1] + 24);
    v15 = (id *)v38[3];
  }
  _Block_object_dispose(&v37, 8);
  if (!v15)
  {
    v33 = [MEMORY[0x263F08690] currentHandler];
    v34 = [NSString stringWithUTF8String:"HKSPProvenanceSource getHKSPProvenanceSourceShortcuts(void)"];
    objc_msgSend(v33, "handleFailureInFunction:file:lineNumber:description:", v34, @"WFSleepTriggerConfigurationViewController.m", 27, @"%s", dlerror());

    goto LABEL_24;
  }
  id v18 = *v15;
  id v19 = v14;
  id v20 = v18;
  uint64_t v37 = 0;
  v38 = &v37;
  uint64_t v39 = 0x2020000000;
  v21 = (void (*)(id, id))getHKSPSleepURLSymbolLoc_ptr;
  v40 = getHKSPSleepURLSymbolLoc_ptr;
  if (!getHKSPSleepURLSymbolLoc_ptr)
  {
    *(void *)&long long buf = MEMORY[0x263EF8330];
    *((void *)&buf + 1) = 3221225472;
    v42 = __getHKSPSleepURLSymbolLoc_block_invoke;
    v43 = &unk_2649CC0B8;
    v44 = &v37;
    v22 = SleepLibrary();
    v23 = dlsym(v22, "HKSPSleepURL");
    *(void *)(v44[1] + 24) = v23;
    getHKSPSleepURLSymbolLoc_ptr = *(_UNKNOWN **)(v44[1] + 24);
    v21 = (void (*)(id, id))v38[3];
  }
  _Block_object_dispose(&v37, 8);
  if (!v21)
  {
    v35 = [MEMORY[0x263F08690] currentHandler];
    v36 = objc_msgSend(NSString, "stringWithUTF8String:", "NSURL *WFHKSPSleepURL(__strong HKSPSleepLaunchURLRoute, __strong HKSPProvenanceSource)");
    objc_msgSend(v35, "handleFailureInFunction:file:lineNumber:description:", v36, @"WFSleepTriggerConfigurationViewController.m", 26, @"%s", dlerror());

LABEL_24:
    __break(1u);
  }
  v24 = v21(v19, v20);

  if (v24)
  {
    v25 = WFLocalizedString(@"You can set up a sleep schedule in the Health app.");
    v26 = WFLocalizedString(@"Open Health…");
    v27 = [NSString stringWithFormat:@"%@ %@", v25, v26, v37];
    uint64_t v28 = [v27 rangeOfString:v26];
    objc_msgSend(v10, "setText:URL:linkRange:", v27, v24, v28, v29);
    id v7 = v10;
  }
  else
  {
    v25 = getWFTriggersLogObject();
    if (os_log_type_enabled(v25, OS_LOG_TYPE_ERROR))
    {
      LODWORD(buf) = 136315138;
      *(void *)((char *)&buf + 4) = "-[WFSleepTriggerConfigurationViewController footerLinkViewForTableView:]";
      _os_log_impl(&dword_22D994000, v25, OS_LOG_TYPE_ERROR, "%s Failed to get onboard sleep coaching url", (uint8_t *)&buf, 0xCu);
    }
    id v7 = 0;
  }

LABEL_18:
  return v7;
}

- (id)tableView:(id)a3 viewForFooterInSection:(int64_t)a4
{
  id v6 = a3;
  id v7 = [(WFSleepTriggerConfigurationViewController *)self infoForSection:a4];
  v8 = [v7 objectForKeyedSubscript:@"identifier"];
  int v9 = [v8 isEqual:@"triggerParameters"];

  if (v9)
  {
    v10 = [(WFSleepTriggerConfigurationViewController *)self footerLinkViewForTableView:v6];
  }
  else
  {
    v10 = 0;
  }

  return v10;
}

- (id)tableView:(id)a3 titleForHeaderInSection:(int64_t)a4
{
  id v4 = [(WFSleepTriggerConfigurationViewController *)self infoForSection:a4];
  BOOL v5 = [v4 objectForKeyedSubscript:@"sectionTitle"];

  return v5;
}

- (void)setupParameterSectionCell:(id)a3 atRow:(int64_t)a4
{
  id v15 = a3;
  switch(a4)
  {
    case 2:
      id v6 = @"Waking Up";
      goto LABEL_7;
    case 1:
      id v6 = @"Bedtime Begins";
      goto LABEL_7;
    case 0:
      id v6 = @"Wind Down Begins";
LABEL_7:
      id v7 = WFLocalizedString(v6);
      v8 = [v15 textLabel];
      [v8 setText:v7];

      goto LABEL_9;
  }
  objc_msgSend(MEMORY[0x263EFF940], "raise:format:", *MEMORY[0x263EFF498], @"Invalid row %li for WFSleepTriggerConfigurationViewController", a4);
LABEL_9:
  [v15 setUserInteractionEnabled:1];
  int v9 = [v15 textLabel];
  [v9 setEnabled:1];

  v10 = [(WFSleepTriggerConfigurationViewController *)self healthFeatureAvailability];
  uint64_t v11 = [v10 sleepOnboardingStatus];

  if (v11)
  {
    v12 = [(WFTriggerConfigurationViewController *)self trigger];
    uint64_t v13 = [v12 selection];

    if (v13 == a4) {
      [v15 setAccessoryType:3];
    }
  }
  else
  {
    [v15 setUserInteractionEnabled:0];
    id v14 = [v15 textLabel];
    [v14 setEnabled:0];
  }
}

- (id)tableView:(id)a3 cellForRowAtIndexPath:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v8 = -[WFSleepTriggerConfigurationViewController infoForSection:](self, "infoForSection:", [v7 section]);
  int v9 = [v8 objectForKeyedSubscript:@"cellIdentifier"];
  v10 = [v6 dequeueReusableCellWithIdentifier:v9 forIndexPath:v7];
  uint64_t v11 = [v8 objectForKeyedSubscript:@"identifier"];
  int v12 = [v11 isEqual:@"triggerDescription"];

  if (v12)
  {
    [v10 setTriggerTypeClass:objc_opt_class()];
    [v10 setSelectionStyle:0];
    [v10 setAccessoryType:0];
  }
  else
  {
    [v10 setAccessoryType:0];
    -[WFSleepTriggerConfigurationViewController setupParameterSectionCell:atRow:](self, "setupParameterSectionCell:atRow:", v10, [v7 row]);
  }
  uint64_t v17 = MEMORY[0x263EF8330];
  uint64_t v18 = 3221225472;
  id v19 = __77__WFSleepTriggerConfigurationViewController_tableView_cellForRowAtIndexPath___block_invoke;
  id v20 = &unk_2649CC018;
  v21 = self;
  id v13 = v10;
  id v22 = v13;
  id v14 = (void (**)(void))_Block_copy(&v17);
  id v15 = -[WFTriggerConfigurationViewController configureAdditionalCellsIfNeeded:indexPath:sectionInfo:](self, "configureAdditionalCellsIfNeeded:indexPath:sectionInfo:", v13, v7, v8, v17, v18, v19, v20, v21);
  v14[2](v14);

  return v15;
}

void __77__WFSleepTriggerConfigurationViewController_tableView_cellForRowAtIndexPath___block_invoke(uint64_t a1)
{
  v2 = [*(id *)(a1 + 32) healthFeatureAvailability];
  uint64_t v3 = [v2 sleepOnboardingStatus];

  if (v3 != 1)
  {
    id v4 = *(void **)(a1 + 40);
    [v4 setAccessoryType:0];
  }
}

- (int64_t)tableView:(id)a3 numberOfRowsInSection:(int64_t)a4
{
  BOOL v5 = [(WFSleepTriggerConfigurationViewController *)self infoForSection:a4];
  id v6 = [v5 objectForKeyedSubscript:@"identifier"];
  char v7 = [v6 isEqual:@"triggerDescription"];

  if (v7)
  {
    int64_t v8 = 1;
  }
  else
  {
    int v9 = [v5 objectForKeyedSubscript:@"identifier"];
    char v10 = [v9 isEqual:@"triggerParameters"];

    if (v10) {
      int64_t v8 = 3;
    }
    else {
      int64_t v8 = [(WFTriggerConfigurationViewController *)self numberOfRowsInSectionWithInfo:v5];
    }
  }

  return v8;
}

- (int64_t)numberOfSectionsInTableView:(id)a3
{
  uint64_t v3 = [(WFTriggerConfigurationViewController *)self sections];
  int64_t v4 = [v3 count];

  return v4;
}

- (id)infoForSection:(int64_t)a3
{
  int64_t v4 = [(WFTriggerConfigurationViewController *)self sections];
  BOOL v5 = [v4 objectAtIndexedSubscript:a3];

  return v5;
}

- (void)viewWillAppear:(BOOL)a3
{
  v5.receiver = self;
  v5.super_class = (Class)WFSleepTriggerConfigurationViewController;
  [(WFSleepTriggerConfigurationViewController *)&v5 viewWillAppear:a3];
  int64_t v4 = [(WFTriggerConfigurationViewController *)self tableView];
  [v4 reloadData];
}

- (id)customSections
{
  v10[1] = *MEMORY[0x263EF8340];
  char v7 = @"identifier";
  int64_t v8 = @"cellIdentifier";
  v9[0] = @"triggerParameters";
  v2 = (objc_class *)objc_opt_class();
  uint64_t v3 = NSStringFromClass(v2);
  v9[1] = v3;
  int64_t v4 = [NSDictionary dictionaryWithObjects:v9 forKeys:&v7 count:2];
  v10[0] = v4;
  objc_super v5 = objc_msgSend(MEMORY[0x263EFF8C0], "arrayWithObjects:count:", v10, 1, v7, v8, v9[0]);

  return v5;
}

- (id)tableViewCellClasses
{
  v6[2] = *MEMORY[0x263EF8340];
  v2 = (void *)MEMORY[0x263EFFA08];
  v6[0] = objc_opt_class();
  v6[1] = objc_opt_class();
  uint64_t v3 = [MEMORY[0x263EFF8C0] arrayWithObjects:v6 count:2];
  int64_t v4 = [v2 setWithArray:v3];

  return v4;
}

- (void)viewDidLoad
{
  id v5 = [(WFTriggerConfigurationViewController *)self tableView];
  uint64_t v2 = objc_opt_class();
  uint64_t v3 = (objc_class *)objc_opt_class();
  int64_t v4 = NSStringFromClass(v3);
  [v5 registerClass:v2 forHeaderFooterViewReuseIdentifier:v4];
}

- (void)updateUI
{
  id v2 = [(WFTriggerConfigurationViewController *)self tableView];
  [v2 reloadData];
}

- (WFSleepTriggerConfigurationViewController)initWithTrigger:(id)a3 mode:(unint64_t)a4
{
  id v7 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    id v14 = [MEMORY[0x263F08690] currentHandler];
    [v14 handleFailureInMethod:a2, self, @"WFSleepTriggerConfigurationViewController.m", 44, @"Invalid parameter not satisfying: %@", @"[trigger isKindOfClass:[WFSleepTrigger class]]" object file lineNumber description];
  }
  v15.receiver = self;
  v15.super_class = (Class)WFSleepTriggerConfigurationViewController;
  int64_t v8 = [(WFTriggerConfigurationViewController *)&v15 initWithTrigger:v7 mode:a4];
  if (v8)
  {
    uint64_t v9 = [objc_alloc(MEMORY[0x263F86BF8]) initWithSleepFeature:0];
    healthFeatureAvailability = v8->_healthFeatureAvailability;
    v8->_healthFeatureAvailability = (WFHealthFeatureAvailability *)v9;

    uint64_t v11 = [(WFSleepTriggerConfigurationViewController *)v8 healthFeatureAvailability];
    [v11 setObserver:v8];

    int v12 = v8;
  }

  return v8;
}

@end