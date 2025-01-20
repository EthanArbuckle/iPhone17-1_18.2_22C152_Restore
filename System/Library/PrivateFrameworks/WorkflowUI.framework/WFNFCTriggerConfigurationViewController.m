@interface WFNFCTriggerConfigurationViewController
- (WFNFCTriggerConfigurationViewController)initWithTrigger:(id)a3 mode:(unint64_t)a4;
- (id)customSections;
- (id)infoForSection:(int64_t)a3;
- (id)tableView:(id)a3 cellForRowAtIndexPath:(id)a4;
- (id)tableView:(id)a3 titleForHeaderInSection:(int64_t)a4;
- (id)tableViewCellClasses;
- (int64_t)numberOfSectionsInTableView:(id)a3;
- (int64_t)tableView:(id)a3 numberOfRowsInSection:(int64_t)a4;
- (void)alertTextFieldDidChange:(id)a3;
- (void)readerSession:(id)a3 didDetectTags:(id)a4;
- (void)readerSessionDidEndUnexpectedly:(id)a3;
- (void)showNameStep;
- (void)tableView:(id)a3 didSelectRowAtIndexPath:(id)a4;
- (void)updateUI;
- (void)viewWillAppear:(BOOL)a3;
@end

@implementation WFNFCTriggerConfigurationViewController

- (void)alertTextFieldDidChange:(id)a3
{
  id v9 = a3;
  v4 = [(WFNFCTriggerConfigurationViewController *)self presentedViewController];
  if (v4)
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v5 = [v9 text];
      BOOL v6 = [v5 length] != 0;
      v7 = [v4 actions];
      v8 = [v7 firstObject];
      [v8 setEnabled:v6];
    }
  }
}

- (void)showNameStep
{
  v3 = (void *)MEMORY[0x263F82418];
  v4 = WFLocalizedString(@"Name This Tag");
  v5 = [v3 alertControllerWithTitle:v4 message:0 preferredStyle:1];

  BOOL v6 = (void *)MEMORY[0x263F82400];
  v7 = WFLocalizedString(@"OK");
  v15[0] = MEMORY[0x263EF8330];
  v15[1] = 3221225472;
  v15[2] = __55__WFNFCTriggerConfigurationViewController_showNameStep__block_invoke;
  v15[3] = &unk_2649CB888;
  id v16 = v5;
  v17 = self;
  id v8 = v5;
  id v9 = [v6 actionWithTitle:v7 style:0 handler:v15];

  [v9 setEnabled:0];
  [v8 addAction:v9];
  v10 = (void *)MEMORY[0x263F82400];
  v11 = WFLocalizedString(@"Cancel");
  v14[0] = MEMORY[0x263EF8330];
  v14[1] = 3221225472;
  v14[2] = __55__WFNFCTriggerConfigurationViewController_showNameStep__block_invoke_2;
  v14[3] = &unk_2649CB860;
  v14[4] = self;
  v12 = [v10 actionWithTitle:v11 style:1 handler:v14];

  [v8 addAction:v12];
  v13[0] = MEMORY[0x263EF8330];
  v13[1] = 3221225472;
  v13[2] = __55__WFNFCTriggerConfigurationViewController_showNameStep__block_invoke_3;
  v13[3] = &unk_2649CB0A8;
  v13[4] = self;
  [v8 addTextFieldWithConfigurationHandler:v13];
  [(WFNFCTriggerConfigurationViewController *)self presentViewController:v8 animated:1 completion:0];
}

uint64_t __55__WFNFCTriggerConfigurationViewController_showNameStep__block_invoke(uint64_t a1)
{
  v2 = [*(id *)(a1 + 32) textFields];
  v3 = [v2 firstObject];
  v4 = [v3 text];

  if (v4)
  {
    v5 = [*(id *)(a1 + 32) textFields];
    BOOL v6 = [v5 firstObject];
    v7 = [v6 text];
    id v8 = [*(id *)(a1 + 40) trigger];
    [v8 setName:v7];
  }
  else
  {
    id v9 = [*(id *)(a1 + 40) trigger];
    [v9 setTagIdentifier:0];

    v5 = [*(id *)(a1 + 40) trigger];
    [v5 setName:0];
  }

  v10 = [*(id *)(a1 + 40) tableView];
  [v10 reloadData];

  v11 = *(void **)(a1 + 40);
  return [v11 updateNextButtonEnabledState];
}

uint64_t __55__WFNFCTriggerConfigurationViewController_showNameStep__block_invoke_2(uint64_t a1)
{
  v2 = [*(id *)(a1 + 32) trigger];
  [v2 setTagIdentifier:0];

  v3 = [*(id *)(a1 + 32) trigger];
  [v3 setName:0];

  v4 = [*(id *)(a1 + 32) tableView];
  [v4 reloadData];

  v5 = *(void **)(a1 + 32);
  return [v5 updateNextButtonEnabledState];
}

void __55__WFNFCTriggerConfigurationViewController_showNameStep__block_invoke_3(uint64_t a1, void *a2)
{
  id v4 = a2;
  [v4 setAutocapitalizationType:1];
  [v4 setClearButtonMode:3];
  [v4 setReturnKeyType:9];
  v3 = WFLocalizedString(@"Name");
  [v4 setPlaceholder:v3];

  [v4 addTarget:*(void *)(a1 + 32) action:sel_alertTextFieldDidChange_ forControlEvents:0x20000];
}

- (void)readerSessionDidEndUnexpectedly:(id)a3
{
  uint64_t v9 = *MEMORY[0x263EF8340];
  id v3 = a3;
  id v4 = getWFTriggersLogObject();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
  {
    int v5 = 136315394;
    BOOL v6 = "-[WFNFCTriggerConfigurationViewController readerSessionDidEndUnexpectedly:]";
    __int16 v7 = 2114;
    id v8 = v3;
    _os_log_impl(&dword_22D994000, v4, OS_LOG_TYPE_ERROR, "%s session (%{public}@) ended unexpectedly", (uint8_t *)&v5, 0x16u);
  }
}

- (void)readerSession:(id)a3 didDetectTags:(id)a4
{
  uint64_t v23 = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v7 = a4;
  id v8 = getWFTriggersLogObject();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 136315906;
    id v16 = "-[WFNFCTriggerConfigurationViewController readerSession:didDetectTags:]";
    __int16 v17 = 2114;
    id v18 = v6;
    __int16 v19 = 2050;
    uint64_t v20 = [v7 count];
    __int16 v21 = 2112;
    id v22 = v7;
    _os_log_impl(&dword_22D994000, v8, OS_LOG_TYPE_DEBUG, "%s session (%{public}@) detected %{public}lu tags: %@", buf, 0x2Au);
  }

  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __71__WFNFCTriggerConfigurationViewController_readerSession_didDetectTags___block_invoke;
  block[3] = &unk_2649CC068;
  id v12 = v7;
  id v13 = v6;
  v14 = self;
  id v9 = v6;
  id v10 = v7;
  dispatch_async(MEMORY[0x263EF83A0], block);
}

void __71__WFNFCTriggerConfigurationViewController_readerSession_didDetectTags___block_invoke(id *a1)
{
  uint64_t v16 = *MEMORY[0x263EF8340];
  v2 = [a1[4] firstObject];
  id v3 = v2;
  if (v2)
  {
    id v4 = NSString;
    int v5 = [v2 tagID];
    id v6 = objc_msgSend(v4, "if_hexStringFromData:", v5);
    id v7 = [v6 uppercaseString];

    id v8 = getWFTriggersLogObject();
    id v9 = v8;
    if (v7)
    {
      if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
      {
        int v12 = 136315394;
        id v13 = "-[WFNFCTriggerConfigurationViewController readerSession:didDetectTags:]_block_invoke";
        __int16 v14 = 2112;
        v15 = v7;
        _os_log_impl(&dword_22D994000, v9, OS_LOG_TYPE_INFO, "%s Got NFC tagIdentifier: (%@)", (uint8_t *)&v12, 0x16u);
      }

      id v10 = [a1[6] trigger];
      [v10 setTagIdentifier:v7];

      [a1[6] showNameStep];
    }
    else
    {
      if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
      {
        int v12 = 136315394;
        id v13 = "-[WFNFCTriggerConfigurationViewController readerSession:didDetectTags:]_block_invoke";
        __int16 v14 = 2112;
        v15 = v3;
        _os_log_impl(&dword_22D994000, v9, OS_LOG_TYPE_ERROR, "%s No tagID from tag (%@)", (uint8_t *)&v12, 0x16u);
      }

      [a1[6] updateNextButtonEnabledState];
    }
    [a1[5] endSession];
  }
  else
  {
    v11 = getWFTriggersLogObject();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
    {
      int v12 = 136315138;
      id v13 = "-[WFNFCTriggerConfigurationViewController readerSession:didDetectTags:]_block_invoke";
      _os_log_impl(&dword_22D994000, v11, OS_LOG_TYPE_ERROR, "%s No tags detected", (uint8_t *)&v12, 0xCu);
    }

    [a1[5] endSession];
    [a1[6] updateNextButtonEnabledState];
  }
}

- (void)tableView:(id)a3 didSelectRowAtIndexPath:(id)a4
{
  id v6 = a4;
  [a3 deselectRowAtIndexPath:v6 animated:1];
  id v7 = -[WFNFCTriggerConfigurationViewController infoForSection:](self, "infoForSection:", [v6 section]);
  id v8 = [v7 objectForKeyedSubscript:@"identifier"];
  int v9 = [v8 isEqual:@"triggerParameters"];

  if (v9)
  {
    v10[0] = MEMORY[0x263EF8330];
    v10[1] = 3221225472;
    v10[2] = __77__WFNFCTriggerConfigurationViewController_tableView_didSelectRowAtIndexPath___block_invoke;
    v10[3] = &unk_2649CAA70;
    v10[4] = self;
    [MEMORY[0x263F58118] sharedHardwareManager:v10];
  }
  [(WFTriggerConfigurationViewController *)self didSelectRowAtIndexPath:v6 withSectionInfo:v7];
}

id __77__WFNFCTriggerConfigurationViewController_tableView_didSelectRowAtIndexPath___block_invoke(uint64_t a1, void *a2)
{
  v3[0] = MEMORY[0x263EF8330];
  v3[1] = 3221225472;
  v3[2] = __77__WFNFCTriggerConfigurationViewController_tableView_didSelectRowAtIndexPath___block_invoke_2;
  v3[3] = &unk_2649CAA48;
  v3[4] = *(void *)(a1 + 32);
  return (id)[a2 startReaderSessionWithActionSheetUI:v3];
}

void __77__WFNFCTriggerConfigurationViewController_tableView_didSelectRowAtIndexPath___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  uint64_t v14 = *MEMORY[0x263EF8340];
  id v5 = a2;
  id v6 = a3;
  if (v5)
  {
    id v7 = WFLocalizedString(@"Hold your device near the NFC tag.");
    id v8 = (id)[v5 updateUIAlertMessage:v7];

    [v5 setDelegate:*(void *)(a1 + 32)];
    [v5 startPolling];
  }
  else
  {
    int v9 = getWFTriggersLogObject();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      int v10 = 136315394;
      v11 = "-[WFNFCTriggerConfigurationViewController tableView:didSelectRowAtIndexPath:]_block_invoke_2";
      __int16 v12 = 2112;
      id v13 = v6;
      _os_log_impl(&dword_22D994000, v9, OS_LOG_TYPE_ERROR, "%s Could not start reader session with error: %@", (uint8_t *)&v10, 0x16u);
    }
  }
}

- (id)tableView:(id)a3 titleForHeaderInSection:(int64_t)a4
{
  id v4 = [(WFNFCTriggerConfigurationViewController *)self infoForSection:a4];
  id v5 = [v4 objectForKeyedSubscript:@"sectionTitle"];

  return v5;
}

- (id)tableView:(id)a3 cellForRowAtIndexPath:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  id v8 = -[WFNFCTriggerConfigurationViewController infoForSection:](self, "infoForSection:", [v6 section]);
  int v9 = [v8 objectForKeyedSubscript:@"cellIdentifier"];
  int v10 = [v7 dequeueReusableCellWithIdentifier:v9 forIndexPath:v6];

  v11 = [v8 objectForKeyedSubscript:@"identifier"];
  int v12 = [v11 isEqual:@"triggerDescription"];

  if (v12)
  {
    [v10 setTriggerTypeClass:objc_opt_class()];
    [v10 setSelectionStyle:0];
    [v10 setAccessoryType:0];
  }
  else
  {
    id v13 = [v8 objectForKeyedSubscript:@"identifier"];
    int v14 = [v13 isEqual:@"triggerParameters"];

    if (v14)
    {
      v15 = WFLocalizedString(@"NFC Tag");
      uint64_t v16 = [v10 textLabel];
      [v16 setText:v15];

      __int16 v17 = [(WFTriggerConfigurationViewController *)self trigger];
      id v18 = [v17 tagIdentifier];

      if (v18)
      {
        __int16 v19 = [(WFTriggerConfigurationViewController *)self trigger];
        uint64_t v20 = [v19 name];
        __int16 v21 = [v10 detailTextLabel];
        [v21 setText:v20];
      }
      else
      {
        __int16 v19 = WFLocalizedString(@"Scan");
        uint64_t v20 = [v10 detailTextLabel];
        [v20 setText:v19];
      }
    }
  }
  id v22 = [(WFTriggerConfigurationViewController *)self configureAdditionalCellsIfNeeded:v10 indexPath:v6 sectionInfo:v8];

  return v22;
}

- (int64_t)tableView:(id)a3 numberOfRowsInSection:(int64_t)a4
{
  id v5 = [(WFNFCTriggerConfigurationViewController *)self infoForSection:a4];
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

- (void)viewWillAppear:(BOOL)a3
{
  v5.receiver = self;
  v5.super_class = (Class)WFNFCTriggerConfigurationViewController;
  [(WFNFCTriggerConfigurationViewController *)&v5 viewWillAppear:a3];
  int64_t v4 = [(WFTriggerConfigurationViewController *)self tableView];
  [v4 reloadData];
}

- (void)updateUI
{
  id v2 = [(WFTriggerConfigurationViewController *)self tableView];
  [v2 reloadData];
}

- (id)customSections
{
  v8[2] = *MEMORY[0x263EF8340];
  id v2 = objc_opt_new();
  v7[0] = @"identifier";
  v7[1] = @"cellIdentifier";
  v8[0] = @"triggerParameters";
  id v3 = (objc_class *)objc_opt_class();
  int64_t v4 = NSStringFromClass(v3);
  v8[1] = v4;
  objc_super v5 = [NSDictionary dictionaryWithObjects:v8 forKeys:v7 count:2];
  [v2 addObject:v5];

  return v2;
}

- (id)tableViewCellClasses
{
  v6[2] = *MEMORY[0x263EF8340];
  id v2 = (void *)MEMORY[0x263EFFA08];
  v6[0] = objc_opt_class();
  v6[1] = objc_opt_class();
  id v3 = [MEMORY[0x263EFF8C0] arrayWithObjects:v6 count:2];
  int64_t v4 = [v2 setWithArray:v3];

  return v4;
}

- (WFNFCTriggerConfigurationViewController)initWithTrigger:(id)a3 mode:(unint64_t)a4
{
  id v7 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    int v12 = [MEMORY[0x263F08690] currentHandler];
    [v12 handleFailureInMethod:a2, self, @"WFNFCTriggerConfigurationViewController.m", 44, @"Invalid parameter not satisfying: %@", @"[trigger isKindOfClass:[WFNFCTrigger class]]" object file lineNumber description];
  }
  v13.receiver = self;
  v13.super_class = (Class)WFNFCTriggerConfigurationViewController;
  id v8 = [(WFTriggerConfigurationViewController *)&v13 initWithTrigger:v7 mode:a4];
  int v9 = v8;
  if (v8) {
    int v10 = v8;
  }

  return v9;
}

@end