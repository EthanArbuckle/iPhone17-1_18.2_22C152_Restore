@interface WFWifiTriggerConfigurationViewController
- (NSArray)allNetworks;
- (WFWifiTriggerConfigurationViewController)initWithTrigger:(id)a3 mode:(unint64_t)a4;
- (id)customSections;
- (id)fetchWiFiNetworks;
- (id)infoForSection:(int64_t)a3;
- (id)tableView:(id)a3 cellForRowAtIndexPath:(id)a4;
- (id)tableView:(id)a3 titleForHeaderInSection:(int64_t)a4;
- (id)tableView:(id)a3 viewForFooterInSection:(int64_t)a4;
- (id)tableViewCellClasses;
- (id)textForSummaryFooterView;
- (int64_t)numberOfSectionsInTableView:(id)a3;
- (int64_t)tableView:(id)a3 numberOfRowsInSection:(int64_t)a4;
- (void)cell:(id)a3 didSelectOptionWithLeftViewSelected:(BOOL)a4 rightViewSelected:(BOOL)a5;
- (void)connectionSwitchChanged:(id)a3;
- (void)presentNavControllerWithRootViewController:(id)a3;
- (void)setAllNetworks:(id)a3;
- (void)tableView:(id)a3 didSelectRowAtIndexPath:(id)a4;
- (void)triggerTableViewController:(id)a3 didFinishWithAnySelected:(BOOL)a4 orSelectedOptions:(id)a5;
- (void)triggerTableViewControllerDidCancel:(id)a3;
- (void)viewWillAppear:(BOOL)a3;
@end

@implementation WFWifiTriggerConfigurationViewController

- (void).cxx_destruct
{
}

- (void)setAllNetworks:(id)a3
{
}

- (NSArray)allNetworks
{
  return self->_allNetworks;
}

- (void)cell:(id)a3 didSelectOptionWithLeftViewSelected:(BOOL)a4 rightViewSelected:(BOOL)a5
{
  BOOL v5 = a5;
  BOOL v6 = a4;
  v8 = [(WFTriggerConfigurationViewController *)self trigger];
  [v8 setOnConnect:v6];

  v9 = [(WFTriggerConfigurationViewController *)self trigger];
  [v9 setOnDisconnect:v5];

  [(WFTriggerConfigurationViewController *)self updateNextButtonEnabledState];
  id v10 = [(WFTriggerConfigurationViewController *)self tableView];
  [v10 reloadData];
}

- (void)triggerTableViewController:(id)a3 didFinishWithAnySelected:(BOOL)a4 orSelectedOptions:(id)a5
{
  BOOL v5 = a4;
  id v14 = a5;
  id v8 = a3;
  v9 = [(WFTriggerConfigurationViewController *)self trigger];
  id v10 = v9;
  if (v5)
  {
    [v9 setSelection:0];

    v11 = [(WFTriggerConfigurationViewController *)self trigger];
    [v11 setSelectedNetworks:MEMORY[0x263EFFA68]];
  }
  else
  {
    [v9 setSelection:1];

    v11 = objc_msgSend(v14, "if_map:", &__block_literal_global_5840);
    v12 = [(WFTriggerConfigurationViewController *)self trigger];
    [v12 setSelectedNetworks:v11];
  }
  [v8 dismissViewControllerAnimated:1 completion:0];

  v13 = [(WFTriggerConfigurationViewController *)self tableView];
  [v13 reloadData];

  [(WFTriggerConfigurationViewController *)self updateNextButtonEnabledState];
}

uint64_t __114__WFWifiTriggerConfigurationViewController_triggerTableViewController_didFinishWithAnySelected_orSelectedOptions___block_invoke(uint64_t a1, void *a2)
{
  return [a2 value];
}

- (void)triggerTableViewControllerDidCancel:(id)a3
{
}

- (void)presentNavControllerWithRootViewController:(id)a3
{
  v4 = (objc_class *)MEMORY[0x263F829B8];
  id v5 = a3;
  id v6 = (id)[[v4 alloc] initWithRootViewController:v5];

  [(WFWifiTriggerConfigurationViewController *)self presentViewController:v6 animated:1 completion:0];
}

- (id)textForSummaryFooterView
{
  v3 = [(WFTriggerConfigurationViewController *)self trigger];
  char v4 = [v3 runAfterConnectionInterruption];

  id v5 = [(WFTriggerConfigurationViewController *)self trigger];
  uint64_t v6 = [v5 selection];

  if (!v6)
  {
    v15 = [MEMORY[0x263F85258] currentDevice];
    int v16 = [v15 hasCapability:*MEMORY[0x263F85698]];

    if (v16)
    {
      if (v4) {
        v17 = @"If you reconnect to any WLAN network within 3 minutes of being disconnected, this automation will run again.";
      }
      else {
        v17 = @"If you reconnect to any WLAN network within 3 minutes of being disconnected, this automation will not run again.";
      }
    }
    else if (v4)
    {
      v17 = @"If you reconnect to any Wi-Fi network within 3 minutes of being disconnected, this automation will run again.";
    }
    else
    {
      v17 = @"If you reconnect to any Wi-Fi network within 3 minutes of being disconnected, this automation will not run again.";
    }
    goto LABEL_27;
  }
  v7 = [(WFTriggerConfigurationViewController *)self trigger];
  id v8 = [v7 selectedNetworks];
  uint64_t v9 = [v8 count];

  if (!v9)
  {
    v18 = [MEMORY[0x263F85258] currentDevice];
    int v19 = [v18 hasCapability:*MEMORY[0x263F85698]];

    if (v19)
    {
      if (v4) {
        v17 = @"If you reconnect to a WLAN network within 3 minutes of being disconnected, this automation will run again.";
      }
      else {
        v17 = @"If you reconnect to a WLAN network within 3 minutes of being disconnected, this automation will not run again.";
      }
    }
    else if (v4)
    {
      v17 = @"If you reconnect to a Wi-Fi network within 3 minutes of being disconnected, this automation will run again.";
    }
    else
    {
      v17 = @"If you reconnect to a Wi-Fi network within 3 minutes of being disconnected, this automation will not run again.";
    }
LABEL_27:
    v28 = WFLocalizedString(v17);
    goto LABEL_32;
  }
  id v10 = [(WFTriggerConfigurationViewController *)self trigger];
  v11 = [v10 selectedNetworks];
  uint64_t v12 = [v11 count];

  if (v12 == 1)
  {
    v13 = NSString;
    if (v4) {
      id v14 = @"If you reconnect to “%@” within 3 minutes of being disconnected, this automation will run again.";
    }
    else {
      id v14 = @"If you reconnect to “%@” within 3 minutes of being disconnected, this automation will not run again.";
    }
    v24 = WFLocalizedString(v14);
    v25 = [(WFTriggerConfigurationViewController *)self trigger];
    v26 = [v25 selectedNetworks];
    v27 = [v26 firstObject];
    v28 = objc_msgSend(v13, "localizedStringWithFormat:", v24, v27);
  }
  else
  {
    v20 = [MEMORY[0x263F85258] currentDevice];
    int v21 = [v20 hasCapability:*MEMORY[0x263F85698]];

    v22 = NSString;
    if (v21)
    {
      if (v4) {
        v23 = @"If you reconnect to any of %lu WLAN networks within 3 minutes of being disconnected, these automations will run again.";
      }
      else {
        v23 = @"If you reconnect to any of %lu WLAN networks within 3 minutes of being disconnected, these automations will not run again.";
      }
    }
    else if (v4)
    {
      v23 = @"If you reconnect to any of %lu Wi-Fi networks within 3 minutes of being disconnected, these automations will run again.";
    }
    else
    {
      v23 = @"If you reconnect to any of %lu Wi-Fi networks within 3 minutes of being disconnected, these automations will not run again.";
    }
    v24 = WFLocalizedPluralString(v23);
    v25 = [(WFTriggerConfigurationViewController *)self trigger];
    v26 = [v25 selectedNetworks];
    v28 = objc_msgSend(v22, "localizedStringWithFormat:", v24, objc_msgSend(v26, "count"));
  }

LABEL_32:
  return v28;
}

- (id)tableView:(id)a3 viewForFooterInSection:(int64_t)a4
{
  id v5 = [(WFWifiTriggerConfigurationViewController *)self infoForSection:a4];
  uint64_t v6 = [v5 objectForKeyedSubscript:@"identifier"];
  int v7 = [v6 isEqual:@"switchCell"];

  if (v7)
  {
    id v8 = objc_opt_new();
    [v8 setHorizontalPadding:0.0];
    uint64_t v9 = [(WFWifiTriggerConfigurationViewController *)self textForSummaryFooterView];
    [v8 setText:v9];
  }
  else
  {
    id v8 = 0;
  }

  return v8;
}

- (void)tableView:(id)a3 didSelectRowAtIndexPath:(id)a4
{
  uint64_t v26 = *MEMORY[0x263EF8340];
  id v6 = a4;
  [a3 deselectRowAtIndexPath:v6 animated:1];
  int v7 = -[WFWifiTriggerConfigurationViewController infoForSection:](self, "infoForSection:", [v6 section]);
  id v8 = [v7 objectForKeyedSubscript:@"identifier"];
  int v9 = [v8 isEqual:@"chooseNetwork"];

  if (v9)
  {
    id v10 = getWFTriggersLogObject();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)buf = 136315394;
      v23 = "-[WFWifiTriggerConfigurationViewController tableView:didSelectRowAtIndexPath:]";
      __int16 v24 = 2114;
      v25 = v7;
      _os_log_impl(&dword_22D994000, v10, OS_LOG_TYPE_DEBUG, "%s didselect section: %{public}@", buf, 0x16u);
    }

    v11 = [(WFWifiTriggerConfigurationViewController *)self allNetworks];

    if (v11)
    {
      uint64_t v12 = [(WFWifiTriggerConfigurationViewController *)self allNetworks];
      v21[0] = MEMORY[0x263EF8330];
      v21[1] = 3221225472;
      v21[2] = __78__WFWifiTriggerConfigurationViewController_tableView_didSelectRowAtIndexPath___block_invoke;
      v21[3] = &unk_2649CB7A0;
      v21[4] = self;
      v13 = objc_msgSend(v12, "if_map:", v21);

      id v14 = [(WFTriggerConfigurationViewController *)self trigger];
      BOOL v15 = [v14 selection] == 0;

      int v16 = [WFTriggerTableViewController alloc];
      v17 = WFLocalizedString(@"Any Network");
      v18 = [(WFTriggerTableViewController *)v16 initWithOptions:v13 anySelected:v15 nameOfAnyOption:v17 mainSectionTitle:0];

      int v19 = WFLocalizedString(@"Choose Networks");
      [(WFTriggerTableViewController *)v18 setTitle:v19];

      [(WFTriggerTableViewController *)v18 setDelegate:self];
      [(WFWifiTriggerConfigurationViewController *)self presentNavControllerWithRootViewController:v18];
    }
    else
    {
      v13 = getWFTriggersLogObject();
      if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 136315138;
        v23 = "-[WFWifiTriggerConfigurationViewController tableView:didSelectRowAtIndexPath:]";
        _os_log_impl(&dword_22D994000, v13, OS_LOG_TYPE_INFO, "%s no wifi networks loaded", buf, 0xCu);
      }
    }
  }
  [(WFTriggerConfigurationViewController *)self didSelectRowAtIndexPath:v6 withSectionInfo:v7];
  v20 = [(WFTriggerConfigurationViewController *)self tableView];
  [v20 reloadData];
}

WFSelectableListOption *__78__WFWifiTriggerConfigurationViewController_tableView_didSelectRowAtIndexPath___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  char v4 = [[WFSelectableListOption alloc] initWithDisplayTitle:v3 value:v3];
  id v5 = [*(id *)(a1 + 32) trigger];
  id v6 = [v5 selectedNetworks];
  uint64_t v7 = [v6 containsObject:v3];

  [(WFSelectableListOption *)v4 setSelected:v7];
  return v4;
}

- (id)tableView:(id)a3 titleForHeaderInSection:(int64_t)a4
{
  char v4 = [(WFWifiTriggerConfigurationViewController *)self infoForSection:a4];
  id v5 = [v4 objectForKeyedSubscript:@"sectionTitle"];

  return v5;
}

- (void)connectionSwitchChanged:(id)a3
{
  uint64_t v4 = [a3 isOn];
  id v5 = [(WFTriggerConfigurationViewController *)self trigger];
  [v5 setRunAfterConnectionInterruption:v4];

  id v6 = [(WFTriggerConfigurationViewController *)self tableView];
  [v6 reloadData];
}

- (id)tableView:(id)a3 cellForRowAtIndexPath:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  id v8 = -[WFWifiTriggerConfigurationViewController infoForSection:](self, "infoForSection:", [v6 section]);
  int v9 = [v8 objectForKeyedSubscript:@"cellIdentifier"];
  id v10 = [v7 dequeueReusableCellWithIdentifier:v9 forIndexPath:v6];

  [v10 setAccessoryType:0];
  v11 = [v8 objectForKeyedSubscript:@"identifier"];
  int v12 = [v11 isEqualToString:@"triggerDescription"];

  if (v12)
  {
    [v10 setTriggerTypeClass:objc_opt_class()];
    [v10 setSelectionStyle:0];
    goto LABEL_31;
  }
  v13 = [v8 objectForKeyedSubscript:@"identifier"];
  int v14 = [v13 isEqualToString:@"chooseNetwork"];

  if (v14)
  {
    id v15 = v10;
    int v16 = WFLocalizedString(@"Network");
    v17 = [v15 textLabel];
    [v17 setText:v16];

    v18 = [(WFTriggerConfigurationViewController *)self trigger];
    uint64_t v19 = [v18 selection];

    if (v19 == 1)
    {
      v32 = [(WFTriggerConfigurationViewController *)self trigger];
      v33 = [v32 selectedNetworks];
      uint64_t v34 = [v33 count];

      if (v34)
      {
        v35 = [(WFTriggerConfigurationViewController *)self trigger];
        v36 = [v35 selectedNetworks];
        uint64_t v37 = [v36 count];

        if (v37 == 1)
        {
          v38 = [(WFTriggerConfigurationViewController *)self trigger];
          v39 = [v38 selectedNetworks];
          v40 = [v39 objectAtIndex:0];
        }
        else
        {
          v51 = NSString;
          v38 = WFLocalizedString(@"Any of %lu Networks");
          v39 = [(WFTriggerConfigurationViewController *)self trigger];
          v52 = [v39 selectedNetworks];
          v40 = objc_msgSend(v51, "localizedStringWithFormat:", v38, objc_msgSend(v52, "count"));
        }
        goto LABEL_29;
      }
      v20 = @"Choose";
    }
    else
    {
      if (v19)
      {
        v40 = 0;
LABEL_29:
        v53 = [v15 detailTextLabel];
        [v53 setText:v40];

LABEL_30:
        goto LABEL_31;
      }
      v20 = @"Any Network";
    }
    v40 = WFLocalizedString(v20);
    goto LABEL_29;
  }
  int v21 = [v8 objectForKeyedSubscript:@"identifier"];
  int v22 = [v21 isEqualToString:@"connectOrDisconnect"];

  if (v22)
  {
    [v10 setSelectionStyle:0];
    id v23 = v10;
    v60 = v9;
    if (v23)
    {
      objc_opt_class();
      if (objc_opt_isKindOfClass()) {
        __int16 v24 = v23;
      }
      else {
        __int16 v24 = 0;
      }
    }
    else
    {
      __int16 v24 = 0;
    }
    id v63 = v24;

    v61 = [(WFTriggerConfigurationViewController *)self trigger];
    v62 = [(id)objc_opt_class() onIcon];
    v59 = [(WFTriggerConfigurationViewController *)self trigger];
    v41 = [(id)objc_opt_class() onLabel];
    v58 = [(WFTriggerConfigurationViewController *)self trigger];
    v42 = [(id)objc_opt_class() onIconTintColor];
    v57 = [(WFTriggerConfigurationViewController *)self trigger];
    v43 = [(id)objc_opt_class() offIcon];
    v56 = [(WFTriggerConfigurationViewController *)self trigger];
    v44 = [(id)objc_opt_class() offLabel];
    v45 = [(WFTriggerConfigurationViewController *)self trigger];
    v46 = [(id)objc_opt_class() offIconTintColor];
    [v63 configureWithLeftGlyph:v62 leftTitle:v41 leftTintColor:v42 rightGlyph:v43 rightTitle:v44 rightTintColor:v46];

    v47 = [(WFTriggerConfigurationViewController *)self trigger];
    objc_msgSend(v63, "setLeftViewSelected:", objc_msgSend(v47, "onConnect"));

    v48 = [(WFTriggerConfigurationViewController *)self trigger];
    objc_msgSend(v63, "setRightViewSelected:", objc_msgSend(v48, "onDisconnect"));

    [v63 setSingleSelection:1];
    [v63 setDelegate:self];

    int v9 = v60;
    goto LABEL_31;
  }
  v25 = [v8 objectForKeyedSubscript:@"identifier"];
  int v26 = [v25 isEqualToString:@"switchCell"];

  if (v26)
  {
    [v10 setSelectionStyle:0];
    v27 = WFLocalizedString(@"Run After Connection Interruption");
    v28 = [v10 textLabel];
    [v28 setText:v27];

    v29 = [v10 textLabel];
    [v29 setNumberOfLines:2];

    id v30 = v10;
    if (v30)
    {
      objc_opt_class();
      if (objc_opt_isKindOfClass()) {
        v31 = v30;
      }
      else {
        v31 = 0;
      }
    }
    else
    {
      v31 = 0;
    }
    id v49 = v31;

    id v15 = [v49 switchControl];

    v50 = [(WFTriggerConfigurationViewController *)self trigger];
    objc_msgSend(v15, "setOn:", objc_msgSend(v50, "runAfterConnectionInterruption"));

    [v15 addTarget:self action:sel_connectionSwitchChanged_ forControlEvents:4096];
    goto LABEL_30;
  }
LABEL_31:
  v54 = [(WFTriggerConfigurationViewController *)self configureAdditionalCellsIfNeeded:v10 indexPath:v6 sectionInfo:v8];

  return v54;
}

- (int64_t)tableView:(id)a3 numberOfRowsInSection:(int64_t)a4
{
  id v5 = [(WFWifiTriggerConfigurationViewController *)self infoForSection:a4];
  int64_t v6 = [(WFTriggerConfigurationViewController *)self numberOfRowsInSectionWithInfo:v5];

  return v6;
}

- (int64_t)numberOfSectionsInTableView:(id)a3
{
  id v3 = [(WFTriggerConfigurationViewController *)self sections];
  int64_t v4 = [v3 count];

  return v4;
}

- (id)infoForSection:(int64_t)a3
{
  int64_t v4 = [(WFTriggerConfigurationViewController *)self sections];
  id v5 = [v4 objectAtIndexedSubscript:a3];

  return v5;
}

- (id)fetchWiFiNetworks
{
  id v2 = objc_alloc_init(MEMORY[0x263EFF9B0]);
  uint64_t v3 = WiFiManagerClientCreate();
  if (v3)
  {
    int64_t v4 = (const void *)v3;
    id v5 = (void *)WiFiManagerClientCopyNetworks();
    unint64_t v6 = 0;
    if (!v5) {
      goto LABEL_4;
    }
LABEL_3:
    for (unint64_t i = [v5 count]; v6 < i; unint64_t i = 0)
    {
      [v5 objectAtIndex:v6];
      id v8 = WiFiNetworkGetSSID();
      [v2 addObject:v8];

      ++v6;
      if (v5) {
        goto LABEL_3;
      }
LABEL_4:
      ;
    }
    CFRelease(v4);
  }
  int v9 = [v2 array];
  id v10 = [v9 sortedArrayUsingSelector:sel_localizedStandardCompare_];

  return v10;
}

- (void)viewWillAppear:(BOOL)a3
{
  v6.receiver = self;
  v6.super_class = (Class)WFWifiTriggerConfigurationViewController;
  [(WFWifiTriggerConfigurationViewController *)&v6 viewWillAppear:a3];
  int64_t v4 = [(WFWifiTriggerConfigurationViewController *)self fetchWiFiNetworks];
  [(WFWifiTriggerConfigurationViewController *)self setAllNetworks:v4];

  id v5 = [(WFTriggerConfigurationViewController *)self tableView];
  [v5 reloadData];
}

- (id)customSections
{
  v29[3] = *MEMORY[0x263EF8340];
  id v2 = [(WFTriggerConfigurationViewController *)self trigger];
  int v3 = [v2 onConnect];

  if (v3)
  {
    v27[0] = @"identifier";
    v27[1] = @"cellIdentifier";
    v28[0] = @"chooseNetwork";
    int64_t v4 = (objc_class *)objc_opt_class();
    id v5 = NSStringFromClass(v4);
    v28[1] = v5;
    objc_super v6 = [NSDictionary dictionaryWithObjects:v28 forKeys:v27 count:2];
    v29[0] = v6;
    v25[1] = @"cellIdentifier";
    v26[0] = @"connectOrDisconnect";
    v25[0] = @"identifier";
    id v7 = (objc_class *)objc_opt_class();
    id v8 = NSStringFromClass(v7);
    v26[1] = v8;
    int v9 = [NSDictionary dictionaryWithObjects:v26 forKeys:v25 count:2];
    v29[1] = v9;
    v23[1] = @"cellIdentifier";
    v24[0] = @"switchCell";
    v23[0] = @"identifier";
    id v10 = (objc_class *)objc_opt_class();
    v11 = NSStringFromClass(v10);
    v24[1] = v11;
    int v12 = [NSDictionary dictionaryWithObjects:v24 forKeys:v23 count:2];
    v29[2] = v12;
    v13 = [MEMORY[0x263EFF8C0] arrayWithObjects:v29 count:3];
  }
  else
  {
    v20[0] = @"identifier";
    v20[1] = @"cellIdentifier";
    v21[0] = @"chooseNetwork";
    int v14 = (objc_class *)objc_opt_class();
    id v5 = NSStringFromClass(v14);
    v21[1] = v5;
    objc_super v6 = [NSDictionary dictionaryWithObjects:v21 forKeys:v20 count:2];
    v22[0] = v6;
    v18 = @"cellIdentifier";
    v19[0] = @"connectOrDisconnect";
    v17 = @"identifier";
    id v15 = (objc_class *)objc_opt_class();
    id v8 = NSStringFromClass(v15);
    v19[1] = v8;
    int v9 = [NSDictionary dictionaryWithObjects:v19 forKeys:&v17 count:2];
    v22[1] = v9;
    v13 = objc_msgSend(MEMORY[0x263EFF8C0], "arrayWithObjects:count:", v22, 2, v17, v18, v19[0]);
  }

  return v13;
}

- (id)tableViewCellClasses
{
  v6[4] = *MEMORY[0x263EF8340];
  id v2 = (void *)MEMORY[0x263EFFA08];
  v6[0] = objc_opt_class();
  v6[1] = objc_opt_class();
  v6[2] = objc_opt_class();
  v6[3] = objc_opt_class();
  int v3 = [MEMORY[0x263EFF8C0] arrayWithObjects:v6 count:4];
  int64_t v4 = [v2 setWithArray:v3];

  return v4;
}

- (WFWifiTriggerConfigurationViewController)initWithTrigger:(id)a3 mode:(unint64_t)a4
{
  id v7 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    int v12 = [MEMORY[0x263F08690] currentHandler];
    [v12 handleFailureInMethod:a2, self, @"WFWifiTriggerConfigurationViewController.m", 47, @"Invalid parameter not satisfying: %@", @"[trigger isKindOfClass:[WFWifiTrigger class]]" object file lineNumber description];
  }
  v13.receiver = self;
  v13.super_class = (Class)WFWifiTriggerConfigurationViewController;
  id v8 = [(WFTriggerConfigurationViewController *)&v13 initWithTrigger:v7 mode:a4];
  int v9 = v8;
  if (v8) {
    id v10 = v8;
  }

  return v9;
}

@end