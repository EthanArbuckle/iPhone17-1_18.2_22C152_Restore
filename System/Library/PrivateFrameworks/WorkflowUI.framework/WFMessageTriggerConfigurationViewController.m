@interface WFMessageTriggerConfigurationViewController
- (WFMessageTriggerConfigurationViewController)initWithTrigger:(id)a3 mode:(unint64_t)a4;
- (id)customSections;
- (id)displayForSelectedContacts:(id)a3;
- (id)infoForSection:(int64_t)a3;
- (id)tableView:(id)a3 cellForRowAtIndexPath:(id)a4;
- (id)tableView:(id)a3 titleForHeaderInSection:(int64_t)a4;
- (id)tableViewCellClasses;
- (int64_t)numberOfSectionsInTableView:(id)a3;
- (int64_t)tableView:(id)a3 numberOfRowsInSection:(int64_t)a4;
- (void)presentNavControllerWithRootViewController:(id)a3;
- (void)recipientViewControllerDidFinish:(id)a3 cancelled:(BOOL)a4;
- (void)showMessageContainsAlert;
- (void)tableView:(id)a3 didSelectRowAtIndexPath:(id)a4;
- (void)updateUI;
- (void)viewWillAppear:(BOOL)a3;
@end

@implementation WFMessageTriggerConfigurationViewController

- (void)showMessageContainsAlert
{
  v3 = (void *)MEMORY[0x263F82418];
  v4 = WFLocalizedString(@"Message Contains");
  v5 = WFLocalizedString(@"Only run this automation when a message contains the following:");
  v6 = [v3 alertControllerWithTitle:v4 message:v5 preferredStyle:1];

  v7 = (void *)MEMORY[0x263F82400];
  v8 = WFLocalizedString(@"Done");
  v16[0] = MEMORY[0x263EF8330];
  v16[1] = 3221225472;
  v16[2] = __71__WFMessageTriggerConfigurationViewController_showMessageContainsAlert__block_invoke;
  v16[3] = &unk_2649CB888;
  id v17 = v6;
  v18 = self;
  id v9 = v6;
  v10 = [v7 actionWithTitle:v8 style:0 handler:v16];

  v11 = (void *)MEMORY[0x263F82400];
  v12 = WFLocalizedString(@"Cancel");
  v15[0] = MEMORY[0x263EF8330];
  v15[1] = 3221225472;
  v15[2] = __71__WFMessageTriggerConfigurationViewController_showMessageContainsAlert__block_invoke_2;
  v15[3] = &unk_2649CB860;
  v15[4] = self;
  v13 = [v11 actionWithTitle:v12 style:1 handler:v15];

  [v9 addAction:v10];
  [v9 addAction:v13];
  v14[0] = MEMORY[0x263EF8330];
  v14[1] = 3221225472;
  v14[2] = __71__WFMessageTriggerConfigurationViewController_showMessageContainsAlert__block_invoke_3;
  v14[3] = &unk_2649CB0A8;
  v14[4] = self;
  [v9 addTextFieldWithConfigurationHandler:v14];
  [(WFMessageTriggerConfigurationViewController *)self presentViewController:v9 animated:1 completion:0];
}

void __71__WFMessageTriggerConfigurationViewController_showMessageContainsAlert__block_invoke(uint64_t a1)
{
  v2 = [*(id *)(a1 + 32) textFields];
  v3 = [v2 firstObject];
  id v7 = [v3 text];

  if ([v7 length]) {
    id v4 = v7;
  }
  else {
    id v4 = 0;
  }
  v5 = [*(id *)(a1 + 40) trigger];
  [v5 setSelectedContents:v4];

  v6 = [*(id *)(a1 + 40) tableView];
  [v6 reloadData];

  [*(id *)(a1 + 40) updateNextButtonEnabledState];
}

uint64_t __71__WFMessageTriggerConfigurationViewController_showMessageContainsAlert__block_invoke_2(uint64_t a1)
{
  v3 = [*(id *)(a1 + 32) trigger];
  id v4 = [v3 selectedContents];
  uint64_t v5 = [v4 length];
  if (v5)
  {
    v1 = [*(id *)(a1 + 32) trigger];
    v6 = [v1 selectedContents];
  }
  else
  {
    v6 = 0;
  }
  id v7 = [*(id *)(a1 + 32) trigger];
  [v7 setSelectedContents:v6];

  if (v5)
  {
  }
  v8 = [*(id *)(a1 + 32) tableView];
  [v8 reloadData];

  id v9 = *(void **)(a1 + 32);
  return [v9 updateNextButtonEnabledState];
}

void __71__WFMessageTriggerConfigurationViewController_showMessageContainsAlert__block_invoke_3(uint64_t a1, void *a2)
{
  id v3 = a2;
  [v3 setAutocapitalizationType:0];
  [v3 setClearButtonMode:3];
  [v3 setReturnKeyType:9];
  id v4 = [*(id *)(a1 + 32) trigger];
  uint64_t v5 = [v4 selectedContents];
  [v3 setText:v5];

  WFLocalizedStringWithKey(@"Anything prompt", @"Anything");
  id v6 = (id)objc_claimAutoreleasedReturnValue();
  [v3 setPlaceholder:v6];
}

- (void)presentNavControllerWithRootViewController:(id)a3
{
  id v4 = (objc_class *)MEMORY[0x263F829B8];
  id v5 = a3;
  id v6 = (id)[[v4 alloc] initWithRootViewController:v5];

  [(WFMessageTriggerConfigurationViewController *)self presentViewController:v6 animated:1 completion:0];
}

- (id)displayForSelectedContacts:(id)a3
{
  uint64_t v21 = *MEMORY[0x263EF8340];
  id v3 = a3;
  id v4 = objc_alloc_init(MEMORY[0x263F089D8]);
  long long v16 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  id v5 = v3;
  uint64_t v6 = [v5 countByEnumeratingWithState:&v16 objects:v20 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v17;
    do
    {
      for (uint64_t i = 0; i != v7; ++i)
      {
        if (*(void *)v17 != v8) {
          objc_enumerationMutation(v5);
        }
        v10 = *(void **)(*((void *)&v16 + 1) + 8 * i);
        v11 = NSString;
        v12 = [v10 givenName];
        v13 = [v10 familyName];
        v14 = [v11 stringWithFormat:@"%@ %@,", v12, v13, (void)v16];
        [v4 appendString:v14];
      }
      uint64_t v7 = [v5 countByEnumeratingWithState:&v16 objects:v20 count:16];
    }
    while (v7);
  }

  return v4;
}

- (void)recipientViewControllerDidFinish:(id)a3 cancelled:(BOOL)a4
{
  uint64_t v50 = *MEMORY[0x263EF8340];
  id v6 = a3;
  uint64_t v7 = v6;
  if (!a4)
  {
    v42 = self;
    [v6 commitRemainingText];
    v41 = v7;
    uint64_t v8 = [v7 entries];
    id v9 = [MEMORY[0x263EFF9C0] set];
    v10 = [MEMORY[0x263EFF9C0] set];
    long long v45 = 0u;
    long long v46 = 0u;
    long long v47 = 0u;
    long long v48 = 0u;
    id v11 = v8;
    uint64_t v44 = [v11 countByEnumeratingWithState:&v45 objects:v49 count:16];
    if (!v44) {
      goto LABEL_20;
    }
    uint64_t v12 = *(void *)v46;
    uint64_t v43 = *(void *)v46;
    while (1)
    {
      for (uint64_t i = 0; i != v44; ++i)
      {
        if (*(void *)v46 != v12) {
          objc_enumerationMutation(v11);
        }
        v14 = *(void **)(*((void *)&v45 + 1) + 8 * i);
        v15 = [v14 contact];
        long long v16 = v15;
        if (v15)
        {
          long long v17 = [v15 contact];
          [v9 addObject:v17];

          WFMessageTriggerConfigurationSenderStringsFromContact(v16);
          id v18 = (id)objc_claimAutoreleasedReturnValue();
          [v10 addObjectsFromArray:v18];
        }
        else
        {
          long long v19 = [v14 phoneNumber];

          if (v19)
          {
            id v20 = v11;
            uint64_t v21 = v10;
            v22 = v9;
            id v18 = [v14 phoneNumber];
            uint64_t v23 = [v18 formattedPhoneNumber];
            if (!v23)
            {
              v10 = v21;
              id v11 = v20;
              uint64_t v12 = v43;
              goto LABEL_17;
            }
            v24 = (void *)v23;
            v25 = [v14 phoneNumber];
            v26 = [v25 normalizedPhoneNumber];

            id v9 = v22;
            v10 = v21;
            id v11 = v20;
            uint64_t v12 = v43;
            if (!v26) {
              goto LABEL_18;
            }
            id v18 = objc_alloc_init(MEMORY[0x263EFEAF0]);
            v27 = [v14 phoneNumber];
            v28 = [v27 formattedPhoneNumber];
            [v18 setGivenName:v28];

            [v9 addObject:v18];
            v29 = [v14 phoneNumber];
            uint64_t v30 = [v29 normalizedPhoneNumber];
          }
          else
          {
            v31 = [v14 emailAddress];

            if (!v31) {
              goto LABEL_18;
            }
            id v18 = objc_alloc_init(MEMORY[0x263EFEAF0]);
            v32 = [v14 emailAddress];
            v33 = [v32 address];
            [v18 setGivenName:v33];

            [v9 addObject:v18];
            v29 = [v14 emailAddress];
            uint64_t v30 = [v29 address];
          }
          v34 = (void *)v30;
          [v10 addObject:v30];
        }
LABEL_17:

LABEL_18:
      }
      uint64_t v44 = [v11 countByEnumeratingWithState:&v45 objects:v49 count:16];
      if (!v44)
      {
LABEL_20:

        v35 = [v9 allObjects];
        v36 = v11;
        self = v42;
        v37 = [(WFTriggerConfigurationViewController *)v42 trigger];
        [v37 setSelectedSenders:v35];

        v38 = [v10 allObjects];
        v39 = [(WFTriggerConfigurationViewController *)v42 trigger];
        [v39 setSelectedSendersStrings:v38];

        uint64_t v7 = v41;
        break;
      }
    }
  }
  [v7 dismissViewControllerAnimated:1 completion:0];
  v40 = [(WFTriggerConfigurationViewController *)self tableView];
  [v40 reloadData];

  [(WFTriggerConfigurationViewController *)self updateNextButtonEnabledState];
}

- (void)tableView:(id)a3 didSelectRowAtIndexPath:(id)a4
{
  uint64_t v25 = *MEMORY[0x263EF8340];
  id v6 = a4;
  [a3 deselectRowAtIndexPath:v6 animated:1];
  uint64_t v7 = -[WFMessageTriggerConfigurationViewController infoForSection:](self, "infoForSection:", [v6 section]);
  uint64_t v8 = getWFTriggersLogObject();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
  {
    int v21 = 136315394;
    v22 = "-[WFMessageTriggerConfigurationViewController tableView:didSelectRowAtIndexPath:]";
    __int16 v23 = 2114;
    v24 = v7;
    _os_log_impl(&dword_22D994000, v8, OS_LOG_TYPE_DEBUG, "%s didselect section: %{public}@", (uint8_t *)&v21, 0x16u);
  }

  id v9 = [v7 objectForKeyedSubscript:@"identifier"];
  int v10 = [v9 isEqual:@"senderSection"];

  if (v10)
  {
    id v11 = objc_alloc_init(MEMORY[0x263F865F8]);
    uint64_t v12 = WFLocalizedString(@"Choose Contacts");
    [v11 setTitle:v12];

    v13 = WFLocalizedString(@"From:");
    [v11 setFieldLabel:v13];

    v14 = [MEMORY[0x263EFFA08] setWithObject:&unk_26E1CA498];
    [v11 setSupportedPersonProperties:v14];

    [v11 setDelegate:self];
    v15 = [(WFTriggerConfigurationViewController *)self trigger];
    long long v16 = [v15 selectedSenders];

    long long v17 = objc_msgSend(v16, "if_map:", &__block_literal_global_230);
    [v11 setEntries:v17];

    [(WFMessageTriggerConfigurationViewController *)self presentNavControllerWithRootViewController:v11];
  }
  else
  {
    id v18 = [v7 objectForKeyedSubscript:@"identifier"];
    int v19 = [v18 isEqual:@"messageContains"];

    if (v19) {
      [(WFMessageTriggerConfigurationViewController *)self showMessageContainsAlert];
    }
  }
  [(WFTriggerConfigurationViewController *)self didSelectRowAtIndexPath:v6 withSectionInfo:v7];
  id v20 = [(WFTriggerConfigurationViewController *)self tableView];
  [v20 reloadData];

  [(WFTriggerConfigurationViewController *)self updateNextButtonEnabledState];
}

id __81__WFMessageTriggerConfigurationViewController_tableView_didSelectRowAtIndexPath___block_invoke(uint64_t a1, void *a2)
{
  v2 = (objc_class *)MEMORY[0x263F33790];
  id v3 = a2;
  id v4 = [v2 alloc];
  id v5 = [MEMORY[0x263F33748] contactWithCNContact:v3];

  id v6 = (void *)[v4 initWithContact:v5];
  return v6;
}

- (id)tableView:(id)a3 titleForHeaderInSection:(int64_t)a4
{
  id v4 = [(WFMessageTriggerConfigurationViewController *)self infoForSection:a4];
  id v5 = [v4 objectForKeyedSubscript:@"sectionTitle"];

  return v5;
}

- (id)tableView:(id)a3 cellForRowAtIndexPath:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  uint64_t v8 = -[WFMessageTriggerConfigurationViewController infoForSection:](self, "infoForSection:", [v6 section]);
  id v9 = [v8 objectForKeyedSubscript:@"cellIdentifier"];
  int v10 = [v7 dequeueReusableCellWithIdentifier:v9 forIndexPath:v6];

  [v10 setAccessoryType:0];
  id v11 = [v8 objectForKeyedSubscript:@"identifier"];
  int v12 = [v11 isEqualToString:@"triggerDescription"];

  if (v12)
  {
    [v10 setSelectionStyle:0];
    [v10 setTriggerTypeClass:objc_opt_class()];
    goto LABEL_14;
  }
  v13 = [v8 objectForKeyedSubscript:@"identifier"];
  int v14 = [v13 isEqualToString:@"senderSection"];

  if (!v14)
  {
    v27 = [v8 objectForKeyedSubscript:@"identifier"];
    int v28 = [v27 isEqualToString:@"messageContains"];

    if (!v28) {
      goto LABEL_14;
    }
    id v15 = v10;
    v29 = WFLocalizedString(@"Message Contains");
    uint64_t v30 = [v15 textLabel];
    [v30 setText:v29];

    v31 = [(WFTriggerConfigurationViewController *)self trigger];
    v32 = [v31 selectedContents];

    if (v32)
    {
      v33 = NSString;
      v24 = [(WFTriggerConfigurationViewController *)self trigger];
      uint64_t v25 = [v24 selectedContents];
      uint64_t v26 = [v33 stringWithFormat:@"%@", v25];
      goto LABEL_9;
    }
LABEL_12:
    v24 = WFLocalizedString(@"Choose");
    uint64_t v25 = [v15 detailTextLabel];
    [v25 setText:v24];
    goto LABEL_13;
  }
  id v15 = v10;
  long long v16 = WFLocalizedString(@"Sender");
  long long v17 = [v15 textLabel];
  [v17 setText:v16];

  id v18 = [(WFTriggerConfigurationViewController *)self trigger];
  int v19 = [v18 selectedSenders];
  uint64_t v20 = [v19 count];

  int v21 = [(WFTriggerConfigurationViewController *)self trigger];
  v22 = [v21 selectedSenders];
  __int16 v23 = v22;
  if (v20 != 1)
  {
    unint64_t v36 = [v22 count];

    if (v36 >= 2)
    {
      v37 = NSString;
      v24 = WFLocalizedString(@"Any of %lu Senders");
      uint64_t v25 = [(WFTriggerConfigurationViewController *)self trigger];
      v42 = [v25 selectedSenders];
      v38 = objc_msgSend(v37, "localizedStringWithFormat:", v24, objc_msgSend(v42, "count"));
      v39 = [v15 detailTextLabel];
      [v39 setText:v38];

      goto LABEL_13;
    }
    goto LABEL_12;
  }
  v24 = [v22 objectAtIndex:0];

  uint64_t v25 = [MEMORY[0x263F33748] contactWithCNContact:v24];
  uint64_t v26 = [v25 triggerDisplayName];
LABEL_9:
  v34 = (void *)v26;
  v35 = [v15 detailTextLabel];
  [v35 setText:v34];

LABEL_13:
LABEL_14:
  v40 = [(WFTriggerConfigurationViewController *)self configureAdditionalCellsIfNeeded:v10 indexPath:v6 sectionInfo:v8];

  return v40;
}

- (int64_t)tableView:(id)a3 numberOfRowsInSection:(int64_t)a4
{
  id v5 = [(WFMessageTriggerConfigurationViewController *)self infoForSection:a4];
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
  v5.super_class = (Class)WFMessageTriggerConfigurationViewController;
  [(WFMessageTriggerConfigurationViewController *)&v5 viewWillAppear:a3];
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
  v14[2] = *MEMORY[0x263EF8340];
  v12[0] = @"identifier";
  v12[1] = @"cellIdentifier";
  v13[0] = @"senderSection";
  id v2 = (objc_class *)objc_opt_class();
  id v3 = NSStringFromClass(v2);
  v13[1] = v3;
  int64_t v4 = [NSDictionary dictionaryWithObjects:v13 forKeys:v12 count:2];
  v14[0] = v4;
  v10[1] = @"cellIdentifier";
  v11[0] = @"messageContains";
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
  id v2 = (void *)MEMORY[0x263EFFA08];
  uint64_t v6 = objc_opt_class();
  uint64_t v7 = objc_opt_class();
  uint64_t v8 = objc_opt_class();
  id v3 = [MEMORY[0x263EFF8C0] arrayWithObjects:&v6 count:3];
  int64_t v4 = objc_msgSend(v2, "setWithArray:", v3, v6, v7);

  return v4;
}

- (WFMessageTriggerConfigurationViewController)initWithTrigger:(id)a3 mode:(unint64_t)a4
{
  id v7 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    int v12 = [MEMORY[0x263F08690] currentHandler];
    [v12 handleFailureInMethod:a2, self, @"WFMessageTriggerConfigurationViewController.m", 68, @"Invalid parameter not satisfying: %@", @"[trigger isKindOfClass:[WFMessageTrigger class]]" object file lineNumber description];
  }
  v13.receiver = self;
  v13.super_class = (Class)WFMessageTriggerConfigurationViewController;
  uint64_t v8 = [(WFTriggerConfigurationViewController *)&v13 initWithTrigger:v7 mode:a4];
  uint64_t v9 = v8;
  if (v8) {
    int v10 = v8;
  }

  return v9;
}

@end