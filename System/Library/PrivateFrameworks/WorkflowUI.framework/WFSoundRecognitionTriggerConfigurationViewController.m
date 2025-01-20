@interface WFSoundRecognitionTriggerConfigurationViewController
- (BOOL)shouldEnableNextButton;
- (WFSoundRecognitionTriggerConfigurationViewController)initWithTrigger:(id)a3 mode:(unint64_t)a4;
- (id)customSections;
- (id)footerLinkViewForTableView:(id)a3;
- (id)infoForSection:(int64_t)a3;
- (id)tableView:(id)a3 cellForRowAtIndexPath:(id)a4;
- (id)tableView:(id)a3 titleForHeaderInSection:(int64_t)a4;
- (id)tableView:(id)a3 viewForFooterInSection:(int64_t)a4;
- (id)tableViewCellClasses;
- (int64_t)numberOfSectionsInTableView:(id)a3;
- (int64_t)tableView:(id)a3 numberOfRowsInSection:(int64_t)a4;
- (void)footerLinkView:(id)a3 didTapURL:(id)a4;
- (void)handleDidBecomeActive;
- (void)tableView:(id)a3 didSelectRowAtIndexPath:(id)a4;
- (void)triggerTableViewController:(id)a3 didFinishWithAnySelected:(BOOL)a4 orSelectedOptions:(id)a5;
- (void)triggerTableViewControllerDidCancel:(id)a3;
- (void)viewDidLoad;
- (void)viewWillAppear:(BOOL)a3;
@end

@implementation WFSoundRecognitionTriggerConfigurationViewController

- (void)footerLinkView:(id)a3 didTapURL:(id)a4
{
  v4 = (void *)MEMORY[0x263F33718];
  id v5 = a4;
  id v6 = [v4 sharedContext];
  [v6 openURL:v5];
}

- (void)triggerTableViewControllerDidCancel:(id)a3
{
}

- (void)triggerTableViewController:(id)a3 didFinishWithAnySelected:(BOOL)a4 orSelectedOptions:(id)a5
{
  v7 = (void *)MEMORY[0x263EFFA08];
  id v8 = a3;
  v9 = objc_msgSend(a5, "if_map:", &__block_literal_global_3138);
  v10 = [v7 setWithArray:v9];
  v11 = [(WFTriggerConfigurationViewController *)self trigger];
  [v11 setSoundDetectionTypes:v10];

  [v8 dismissViewControllerAnimated:1 completion:0];
  v12 = [(WFTriggerConfigurationViewController *)self tableView];
  [v12 reloadData];

  [(WFTriggerConfigurationViewController *)self updateNextButtonEnabledState];
}

uint64_t __126__WFSoundRecognitionTriggerConfigurationViewController_triggerTableViewController_didFinishWithAnySelected_orSelectedOptions___block_invoke(uint64_t a1, void *a2)
{
  return [a2 value];
}

- (BOOL)shouldEnableNextButton
{
  v2 = [(WFTriggerConfigurationViewController *)self trigger];
  if ([v2 hasValidConfiguration]) {
    char v3 = [MEMORY[0x263F86850] soundDetectionEnabled];
  }
  else {
    char v3 = 0;
  }

  return v3;
}

- (void)tableView:(id)a3 didSelectRowAtIndexPath:(id)a4
{
  uint64_t v21 = *MEMORY[0x263EF8340];
  id v6 = a4;
  [a3 deselectRowAtIndexPath:v6 animated:1];
  v7 = -[WFSoundRecognitionTriggerConfigurationViewController infoForSection:](self, "infoForSection:", [v6 section]);
  id v8 = [v7 objectForKeyedSubscript:@"identifier"];
  int v9 = [v8 isEqual:@"chooseSound"];

  if (v9)
  {
    v10 = getWFTriggersLogObject();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)buf = 136315394;
      v18 = "-[WFSoundRecognitionTriggerConfigurationViewController tableView:didSelectRowAtIndexPath:]";
      __int16 v19 = 2114;
      v20 = v7;
      _os_log_impl(&dword_22D994000, v10, OS_LOG_TYPE_DEBUG, "%s didselect section: %{public}@", buf, 0x16u);
    }

    v16[0] = MEMORY[0x263EF8330];
    v16[1] = 3221225472;
    v16[2] = __90__WFSoundRecognitionTriggerConfigurationViewController_tableView_didSelectRowAtIndexPath___block_invoke;
    v16[3] = &unk_2649CAD20;
    v16[4] = self;
    v11 = [MEMORY[0x263F86850] mapLocalizedSupportedSoundDetectionTypesUsingBlock:v16];
    v12 = [[WFTriggerTableViewController alloc] initWithOptions:v11 anySelected:0 nameOfAnyOption:0 mainSectionTitle:0];
    [(WFTriggerTableViewController *)v12 setDelegate:self];
    v13 = WFLocalizedString(@"Choose Sound");
    [(WFTriggerTableViewController *)v12 setTitle:v13];

    v14 = (void *)[objc_alloc(MEMORY[0x263F829B8]) initWithRootViewController:v12];
    [(WFSoundRecognitionTriggerConfigurationViewController *)self presentViewController:v14 animated:1 completion:0];
  }
  [(WFTriggerConfigurationViewController *)self didSelectRowAtIndexPath:v6 withSectionInfo:v7];
  v15 = [(WFTriggerConfigurationViewController *)self tableView];
  [v15 reloadData];
}

WFSelectableListOption *__90__WFSoundRecognitionTriggerConfigurationViewController_tableView_didSelectRowAtIndexPath___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5 = a3;
  id v6 = a2;
  v7 = [[WFSelectableListOption alloc] initWithDisplayTitle:v6 value:v5];

  id v8 = [*(id *)(a1 + 32) trigger];
  int v9 = [v8 soundDetectionTypes];
  uint64_t v10 = [v9 containsObject:v5];

  [(WFSelectableListOption *)v7 setSelected:v10];
  return v7;
}

- (id)footerLinkViewForTableView:(id)a3
{
  uint64_t v19 = *MEMORY[0x263EF8340];
  id v4 = a3;
  if ([MEMORY[0x263F86850] soundDetectionEnabled])
  {
    id v5 = 0;
  }
  else
  {
    id v6 = (objc_class *)objc_opt_class();
    v7 = NSStringFromClass(v6);
    id v8 = [v4 dequeueReusableHeaderFooterViewWithIdentifier:v7];

    int v9 = [NSURL URLWithString:@"prefs:root=ACCESSIBILITY&path=SOUND_RECOGNITION_TITLE"];
    if (v9)
    {
      uint64_t v10 = WFLocalizedString(@"You can enable Sound Recognition in the Settings app.");
      v11 = WFLocalizedString(@"Open Settings…");
      v12 = [NSString stringWithFormat:@"%@ %@", v10, v11];
      uint64_t v13 = [v12 rangeOfString:v11];
      objc_msgSend(v8, "setText:URL:linkRange:", v12, v9, v13, v14);
      [v8 setDelegate:self];
      id v5 = v8;
    }
    else
    {
      v15 = getWFTriggersLogObject();
      if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 136315138;
        v18 = "-[WFSoundRecognitionTriggerConfigurationViewController footerLinkViewForTableView:]";
        _os_log_impl(&dword_22D994000, v15, OS_LOG_TYPE_ERROR, "%s Failed to get Sound Recognition setting url", buf, 0xCu);
      }

      id v5 = 0;
    }
  }
  return v5;
}

- (id)tableView:(id)a3 viewForFooterInSection:(int64_t)a4
{
  id v6 = a3;
  v7 = [(WFSoundRecognitionTriggerConfigurationViewController *)self infoForSection:a4];
  id v8 = [v7 objectForKeyedSubscript:@"identifier"];
  int v9 = [v8 isEqual:@"chooseSound"];

  if (v9)
  {
    uint64_t v10 = [(WFSoundRecognitionTriggerConfigurationViewController *)self footerLinkViewForTableView:v6];
  }
  else
  {
    uint64_t v10 = 0;
  }

  return v10;
}

- (id)tableView:(id)a3 titleForHeaderInSection:(int64_t)a4
{
  id v4 = [(WFSoundRecognitionTriggerConfigurationViewController *)self infoForSection:a4];
  id v5 = [v4 objectForKeyedSubscript:@"sectionTitle"];

  return v5;
}

- (id)tableView:(id)a3 cellForRowAtIndexPath:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = -[WFSoundRecognitionTriggerConfigurationViewController infoForSection:](self, "infoForSection:", [v7 section]);
  int v9 = [v8 objectForKeyedSubscript:@"cellIdentifier"];
  uint64_t v10 = [v6 dequeueReusableCellWithIdentifier:v9 forIndexPath:v7];
  [v10 setAccessoryType:0];
  v11 = [v8 objectForKeyedSubscript:@"identifier"];
  int v12 = [v11 isEqual:@"triggerDescription"];

  unint64_t v13 = 0x263F86000;
  if (v12)
  {
    [v10 setTriggerTypeClass:objc_opt_class()];
    [v10 setSelectionStyle:0];
  }
  else
  {
    uint64_t v14 = [v8 objectForKeyedSubscript:@"identifier"];
    int v15 = [v14 isEqual:@"chooseSound"];

    if (v15)
    {
      id v16 = v10;
      v17 = WFLocalizedString(@"Sound");
      v18 = [v16 textLabel];
      [v18 setText:v17];

      uint64_t v19 = [(WFTriggerConfigurationViewController *)self trigger];
      v20 = [v19 soundDetectionTypes];
      uint64_t v21 = [v20 count];

      if (v21)
      {
        v22 = [(WFTriggerConfigurationViewController *)self trigger];
        v23 = [v22 soundDetectionTypes];
        uint64_t v24 = [v23 count];

        if (v24 == 1)
        {
          v25 = (void *)MEMORY[0x263F86850];
          v41 = [(WFTriggerConfigurationViewController *)self trigger];
          v26 = [v41 soundDetectionTypes];
          v27 = [v26 anyObject];
          v28 = [v25 localizedNameForSoundDetectionType:v27];

          v29 = v41;
        }
        else
        {
          v42 = NSString;
          uint64_t v40 = WFLocalizedPluralString(@"Any of %d Sounds");
          v30 = [(WFTriggerConfigurationViewController *)self trigger];
          v31 = [v30 soundDetectionTypes];
          v28 = objc_msgSend(v42, "localizedStringWithFormat:", v40, objc_msgSend(v31, "count"));

          v29 = (void *)v40;
        }
      }
      else
      {
        v28 = WFLocalizedString(@"Choose");
      }
      v32 = [v16 detailTextLabel];
      [v32 setText:v28];

      unint64_t v13 = 0x263F86000uLL;
    }
  }
  uint64_t v33 = [*(id *)(v13 + 2128) soundDetectionEnabled];
  [v10 setUserInteractionEnabled:v33];
  v34 = [v10 textLabel];
  [v34 setEnabled:v33];

  v35 = [v10 detailTextLabel];
  [v35 setEnabled:v33];

  aBlock[0] = MEMORY[0x263EF8330];
  aBlock[1] = 3221225472;
  aBlock[2] = __88__WFSoundRecognitionTriggerConfigurationViewController_tableView_cellForRowAtIndexPath___block_invoke;
  aBlock[3] = &unk_2649CBF20;
  id v36 = v10;
  id v44 = v36;
  v37 = (void (**)(void))_Block_copy(aBlock);
  v38 = [(WFTriggerConfigurationViewController *)self configureAdditionalCellsIfNeeded:v36 indexPath:v7 sectionInfo:v8];
  v37[2](v37);

  return v38;
}

uint64_t __88__WFSoundRecognitionTriggerConfigurationViewController_tableView_cellForRowAtIndexPath___block_invoke(uint64_t a1)
{
  uint64_t result = [MEMORY[0x263F86850] soundDetectionEnabled];
  if ((result & 1) == 0)
  {
    char v3 = *(void **)(a1 + 32);
    return [v3 setAccessoryType:0];
  }
  return result;
}

- (int64_t)tableView:(id)a3 numberOfRowsInSection:(int64_t)a4
{
  id v5 = [(WFSoundRecognitionTriggerConfigurationViewController *)self infoForSection:a4];
  int64_t v6 = [(WFTriggerConfigurationViewController *)self numberOfRowsInSectionWithInfo:v5];

  return v6;
}

- (int64_t)numberOfSectionsInTableView:(id)a3
{
  char v3 = [(WFTriggerConfigurationViewController *)self sections];
  int64_t v4 = [v3 count];

  return v4;
}

- (id)infoForSection:(int64_t)a3
{
  int64_t v4 = [(WFTriggerConfigurationViewController *)self sections];
  id v5 = [v4 objectAtIndexedSubscript:a3];

  return v5;
}

- (void)handleDidBecomeActive
{
  id v2 = [(WFTriggerConfigurationViewController *)self tableView];
  [v2 reloadData];
}

- (void)viewWillAppear:(BOOL)a3
{
  id v3 = [(WFTriggerConfigurationViewController *)self tableView];
  [v3 reloadData];
}

- (void)viewDidLoad
{
  id v3 = [(WFTriggerConfigurationViewController *)self tableView];
  uint64_t v4 = objc_opt_class();
  id v5 = (objc_class *)objc_opt_class();
  int64_t v6 = NSStringFromClass(v5);
  [v3 registerClass:v4 forHeaderFooterViewReuseIdentifier:v6];

  id v7 = [MEMORY[0x263F08A00] defaultCenter];
  [v7 addObserver:self selector:sel_handleDidBecomeActive name:*MEMORY[0x263F83318] object:0];
}

- (id)customSections
{
  v10[1] = *MEMORY[0x263EF8340];
  id v7 = @"identifier";
  id v8 = @"cellIdentifier";
  v9[0] = @"chooseSound";
  id v2 = (objc_class *)objc_opt_class();
  id v3 = NSStringFromClass(v2);
  v9[1] = v3;
  uint64_t v4 = [NSDictionary dictionaryWithObjects:v9 forKeys:&v7 count:2];
  v10[0] = v4;
  id v5 = objc_msgSend(MEMORY[0x263EFF8C0], "arrayWithObjects:count:", v10, 1, v7, v8, v9[0]);

  return v5;
}

- (id)tableViewCellClasses
{
  v6[2] = *MEMORY[0x263EF8340];
  id v2 = (void *)MEMORY[0x263EFFA08];
  v6[0] = objc_opt_class();
  v6[1] = objc_opt_class();
  id v3 = [MEMORY[0x263EFF8C0] arrayWithObjects:v6 count:2];
  uint64_t v4 = [v2 setWithArray:v3];

  return v4;
}

- (WFSoundRecognitionTriggerConfigurationViewController)initWithTrigger:(id)a3 mode:(unint64_t)a4
{
  id v7 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    int v12 = [MEMORY[0x263F08690] currentHandler];
    [v12 handleFailureInMethod:a2, self, @"WFSoundRecognitionTriggerConfigurationViewController.m", 28, @"Invalid parameter not satisfying: %@", @"[trigger isKindOfClass:[WFSoundRecognitionTrigger class]]" object file lineNumber description];
  }
  v13.receiver = self;
  v13.super_class = (Class)WFSoundRecognitionTriggerConfigurationViewController;
  id v8 = [(WFTriggerConfigurationViewController *)&v13 initWithTrigger:v7 mode:a4];
  int v9 = v8;
  if (v8) {
    uint64_t v10 = v8;
  }

  return v9;
}

@end