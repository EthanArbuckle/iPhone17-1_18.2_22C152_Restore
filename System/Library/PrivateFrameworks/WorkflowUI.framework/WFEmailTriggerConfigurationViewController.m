@interface WFEmailTriggerConfigurationViewController
- (BOOL)showingAccounts;
- (BOOL)showingRecipients;
- (NSArray)allAccounts;
- (UIViewController)recipientFieldViewController;
- (UIViewController)senderFieldViewController;
- (WFEmailTriggerConfigurationViewController)initWithTrigger:(id)a3 mode:(unint64_t)a4;
- (id)accountFromAccountIdentifier:(id)a3;
- (id)customSections;
- (id)infoForSection:(int64_t)a3;
- (id)supportedAccountTypeIdentifiers;
- (id)tableView:(id)a3 cellForRowAtIndexPath:(id)a4;
- (id)tableView:(id)a3 titleForHeaderInSection:(int64_t)a4;
- (id)tableViewCellClasses;
- (int64_t)numberOfSectionsInTableView:(id)a3;
- (int64_t)tableView:(id)a3 numberOfRowsInSection:(int64_t)a4;
- (void)presentNavControllerWithRootViewController:(id)a3;
- (void)recipientViewControllerDidFinish:(id)a3 cancelled:(BOOL)a4;
- (void)setAllAccounts:(id)a3;
- (void)setRecipientFieldViewController:(id)a3;
- (void)setSenderFieldViewController:(id)a3;
- (void)setShowingAccounts:(BOOL)a3;
- (void)setShowingRecipients:(BOOL)a3;
- (void)setUpAccounts;
- (void)showSubjectContainsAlert;
- (void)tableView:(id)a3 didSelectRowAtIndexPath:(id)a4;
- (void)triggerTableViewController:(id)a3 didFinishWithAnySelected:(BOOL)a4 orSelectedOptions:(id)a5;
- (void)triggerTableViewControllerDidCancel:(id)a3;
- (void)updateUI;
- (void)viewWillAppear:(BOOL)a3;
@end

@implementation WFEmailTriggerConfigurationViewController

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_recipientFieldViewController);
  objc_destroyWeak((id *)&self->_senderFieldViewController);
  objc_storeStrong((id *)&self->_allAccounts, 0);
}

- (void)setRecipientFieldViewController:(id)a3
{
}

- (UIViewController)recipientFieldViewController
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_recipientFieldViewController);
  return (UIViewController *)WeakRetained;
}

- (void)setSenderFieldViewController:(id)a3
{
}

- (UIViewController)senderFieldViewController
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_senderFieldViewController);
  return (UIViewController *)WeakRetained;
}

- (void)setShowingRecipients:(BOOL)a3
{
  self->_showingRecipients = a3;
}

- (BOOL)showingRecipients
{
  return self->_showingRecipients;
}

- (void)setShowingAccounts:(BOOL)a3
{
  self->_showingAccounts = a3;
}

- (BOOL)showingAccounts
{
  return self->_showingAccounts;
}

- (void)setAllAccounts:(id)a3
{
}

- (NSArray)allAccounts
{
  return self->_allAccounts;
}

- (id)accountFromAccountIdentifier:(id)a3
{
  uint64_t v18 = *MEMORY[0x263EF8340];
  id v4 = a3;
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  v5 = [(WFEmailTriggerConfigurationViewController *)self allAccounts];
  id v6 = (id)[v5 countByEnumeratingWithState:&v13 objects:v17 count:16];
  if (v6)
  {
    uint64_t v7 = *(void *)v14;
    while (2)
    {
      for (i = 0; i != v6; i = (char *)i + 1)
      {
        if (*(void *)v14 != v7) {
          objc_enumerationMutation(v5);
        }
        v9 = *(void **)(*((void *)&v13 + 1) + 8 * i);
        v10 = [v9 identifier];
        char v11 = [v10 isEqualToString:v4];

        if (v11)
        {
          id v6 = v9;
          goto LABEL_11;
        }
      }
      id v6 = (id)[v5 countByEnumeratingWithState:&v13 objects:v17 count:16];
      if (v6) {
        continue;
      }
      break;
    }
  }
LABEL_11:

  return v6;
}

- (void)triggerTableViewControllerDidCancel:(id)a3
{
}

- (void)triggerTableViewController:(id)a3 didFinishWithAnySelected:(BOOL)a4 orSelectedOptions:(id)a5
{
  BOOL v5 = a4;
  id v15 = a5;
  id v8 = a3;
  if (v5)
  {
    v9 = [(WFTriggerConfigurationViewController *)self trigger];
    [v9 setSelectedAccountIdentifiers:0];

    v10 = [(WFTriggerConfigurationViewController *)self trigger];
    [v10 setSelectedAccountDescriptions:0];
  }
  else
  {
    char v11 = objc_msgSend(v15, "if_map:", &__block_literal_global_304);
    v12 = [(WFTriggerConfigurationViewController *)self trigger];
    [v12 setSelectedAccountIdentifiers:v11];

    v10 = objc_msgSend(v15, "if_map:", &__block_literal_global_306);
    long long v13 = [(WFTriggerConfigurationViewController *)self trigger];
    [v13 setSelectedAccountDescriptions:v10];
  }
  [v8 dismissViewControllerAnimated:1 completion:0];

  long long v14 = [(WFTriggerConfigurationViewController *)self tableView];
  [v14 reloadData];

  [(WFTriggerConfigurationViewController *)self updateNextButtonEnabledState];
}

uint64_t __115__WFEmailTriggerConfigurationViewController_triggerTableViewController_didFinishWithAnySelected_orSelectedOptions___block_invoke_2(uint64_t a1, void *a2)
{
  return [a2 displayTitle];
}

uint64_t __115__WFEmailTriggerConfigurationViewController_triggerTableViewController_didFinishWithAnySelected_orSelectedOptions___block_invoke(uint64_t a1, void *a2)
{
  return [a2 value];
}

- (void)recipientViewControllerDidFinish:(id)a3 cancelled:(BOOL)a4
{
  id v6 = a3;
  id v14 = v6;
  if (a4)
  {
    [v6 dismissViewControllerAnimated:1 completion:0];
    goto LABEL_9;
  }
  [v6 commitRemainingText];
  uint64_t v7 = [v14 entries];
  id v8 = objc_msgSend(v7, "if_compactMap:", &__block_literal_global_1500);
  id v9 = [(WFEmailTriggerConfigurationViewController *)self recipientFieldViewController];

  if (v9 == v14)
  {
    v12 = [(WFTriggerConfigurationViewController *)self trigger];
    [v12 setSelectedRecipients:v8];
    goto LABEL_7;
  }
  id v10 = [(WFEmailTriggerConfigurationViewController *)self senderFieldViewController];

  char v11 = v14;
  if (v10 == v14)
  {
    v12 = [(WFTriggerConfigurationViewController *)self trigger];
    [v12 setSelectedSenders:v8];
LABEL_7:

    char v11 = v14;
  }
  [v11 dismissViewControllerAnimated:1 completion:0];
  long long v13 = [(WFTriggerConfigurationViewController *)self tableView];
  [v13 reloadData];

  [(WFTriggerConfigurationViewController *)self updateNextButtonEnabledState];
LABEL_9:
}

id __88__WFEmailTriggerConfigurationViewController_recipientViewControllerDidFinish_cancelled___block_invoke(uint64_t a1, void *a2)
{
  id v2 = a2;
  v3 = [v2 contact];

  if (v3)
  {
    id v4 = [v2 contact];

    BOOL v5 = [v4 emailAddresses];
    id v6 = [v5 firstObject];
    uint64_t v7 = [v6 value];
    id v8 = [v7 address];
  }
  else
  {
    id v4 = [v2 emailAddress];

    id v8 = [v4 address];
  }

  return v8;
}

- (void)showSubjectContainsAlert
{
  v3 = (void *)MEMORY[0x263F82418];
  id v4 = WFLocalizedString(@"Subject Contains");
  BOOL v5 = WFLocalizedString(@"Only run this automation when the email subject line contains the following:");
  id v6 = [v3 alertControllerWithTitle:v4 message:v5 preferredStyle:1];

  uint64_t v7 = (void *)MEMORY[0x263F82400];
  id v8 = WFLocalizedString(@"Done");
  v16[0] = MEMORY[0x263EF8330];
  v16[1] = 3221225472;
  v16[2] = __69__WFEmailTriggerConfigurationViewController_showSubjectContainsAlert__block_invoke;
  v16[3] = &unk_2649CB888;
  id v17 = v6;
  uint64_t v18 = self;
  id v9 = v6;
  id v10 = [v7 actionWithTitle:v8 style:0 handler:v16];

  char v11 = (void *)MEMORY[0x263F82400];
  v12 = WFLocalizedString(@"Cancel");
  v15[0] = MEMORY[0x263EF8330];
  v15[1] = 3221225472;
  v15[2] = __69__WFEmailTriggerConfigurationViewController_showSubjectContainsAlert__block_invoke_2;
  v15[3] = &unk_2649CB860;
  v15[4] = self;
  long long v13 = [v11 actionWithTitle:v12 style:1 handler:v15];

  [v9 addAction:v10];
  [v9 addAction:v13];
  v14[0] = MEMORY[0x263EF8330];
  v14[1] = 3221225472;
  v14[2] = __69__WFEmailTriggerConfigurationViewController_showSubjectContainsAlert__block_invoke_3;
  v14[3] = &unk_2649CB0A8;
  v14[4] = self;
  [v9 addTextFieldWithConfigurationHandler:v14];
  [(WFEmailTriggerConfigurationViewController *)self presentViewController:v9 animated:1 completion:0];
}

void __69__WFEmailTriggerConfigurationViewController_showSubjectContainsAlert__block_invoke(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) textFields];
  v3 = [v2 firstObject];
  id v7 = [v3 text];

  if ([v7 length]) {
    id v4 = v7;
  }
  else {
    id v4 = 0;
  }
  BOOL v5 = [*(id *)(a1 + 40) trigger];
  [v5 setSelectedSubject:v4];

  id v6 = [*(id *)(a1 + 40) tableView];
  [v6 reloadData];

  [*(id *)(a1 + 40) updateNextButtonEnabledState];
}

uint64_t __69__WFEmailTriggerConfigurationViewController_showSubjectContainsAlert__block_invoke_2(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) tableView];
  [v2 reloadData];

  v3 = *(void **)(a1 + 32);
  return [v3 updateNextButtonEnabledState];
}

void __69__WFEmailTriggerConfigurationViewController_showSubjectContainsAlert__block_invoke_3(uint64_t a1, void *a2)
{
  id v3 = a2;
  [v3 setAutocapitalizationType:0];
  [v3 setClearButtonMode:3];
  [v3 setReturnKeyType:9];
  id v4 = [*(id *)(a1 + 32) trigger];
  BOOL v5 = [v4 selectedSubject];
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

  [(WFEmailTriggerConfigurationViewController *)self presentViewController:v6 animated:1 completion:0];
}

- (void)tableView:(id)a3 didSelectRowAtIndexPath:(id)a4
{
  uint64_t v38 = *MEMORY[0x263EF8340];
  id v6 = a4;
  [a3 deselectRowAtIndexPath:v6 animated:1];
  id v7 = -[WFEmailTriggerConfigurationViewController infoForSection:](self, "infoForSection:", [v6 section]);
  id v8 = getWFTriggersLogObject();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 136315394;
    v35 = "-[WFEmailTriggerConfigurationViewController tableView:didSelectRowAtIndexPath:]";
    __int16 v36 = 2114;
    v37 = v7;
    _os_log_impl(&dword_22D994000, v8, OS_LOG_TYPE_DEBUG, "%s didselect section: %{public}@", buf, 0x16u);
  }

  id v9 = [v7 objectForKeyedSubscript:@"identifier"];
  int v10 = [v9 isEqual:@"senderSection"];

  if (v10)
  {
    id v11 = objc_alloc_init(MEMORY[0x263F865F8]);
    v12 = WFLocalizedString(@"Choose Contacts");
    [v11 setTitle:v12];

    long long v13 = WFLocalizedString(@"From:");
    [v11 setFieldLabel:v13];

    id v14 = [MEMORY[0x263EFFA08] setWithObject:&unk_26E1CA318];
    [v11 setSupportedPersonProperties:v14];

    [v11 setDelegate:self];
    [(WFEmailTriggerConfigurationViewController *)self setSenderFieldViewController:v11];
  }
  else
  {
    id v15 = [v7 objectForKeyedSubscript:@"identifier"];
    int v16 = [v15 isEqual:@"subjectContainsSection"];

    if (v16)
    {
      [(WFEmailTriggerConfigurationViewController *)self showSubjectContainsAlert];
      goto LABEL_13;
    }
    id v17 = [v7 objectForKeyedSubscript:@"identifier"];
    int v18 = [v17 isEqual:@"accountSection"];

    if (v18)
    {
      v19 = [(WFTriggerConfigurationViewController *)self trigger];
      v20 = [v19 selectedAccountIdentifiers];
      BOOL v21 = [v20 count] == 0;

      v22 = [(WFEmailTriggerConfigurationViewController *)self allAccounts];
      v33[0] = MEMORY[0x263EF8330];
      v33[1] = 3221225472;
      v33[2] = __79__WFEmailTriggerConfigurationViewController_tableView_didSelectRowAtIndexPath___block_invoke;
      v33[3] = &unk_2649CAB60;
      v33[4] = self;
      objc_msgSend(v22, "if_map:", v33);
      id v11 = (id)objc_claimAutoreleasedReturnValue();

      v23 = [WFTriggerTableViewController alloc];
      v24 = WFLocalizedString(@"Any Account");
      v25 = [(WFTriggerTableViewController *)v23 initWithOptions:v11 anySelected:v21 nameOfAnyOption:v24 mainSectionTitle:0];

      [(WFTriggerTableViewController *)v25 setDelegate:self];
      v26 = (void *)[objc_alloc(MEMORY[0x263F829B8]) initWithRootViewController:v25];
      [(WFEmailTriggerConfigurationViewController *)self presentViewController:v26 animated:1 completion:0];

      goto LABEL_6;
    }
    v27 = [v7 objectForKeyedSubscript:@"identifier"];
    int v28 = [v27 isEqual:@"recipientSection"];

    if (!v28) {
      goto LABEL_13;
    }
    id v11 = objc_alloc_init(MEMORY[0x263F865F8]);
    v29 = WFLocalizedString(@"Choose Contacts");
    [v11 setTitle:v29];

    v30 = WFLocalizedString(@"To:");
    [v11 setFieldLabel:v30];

    v31 = [MEMORY[0x263EFFA08] setWithObject:&unk_26E1CA318];
    [v11 setSupportedPersonProperties:v31];

    [v11 setDelegate:self];
    [(WFEmailTriggerConfigurationViewController *)self setRecipientFieldViewController:v11];
  }
  [(WFEmailTriggerConfigurationViewController *)self presentNavControllerWithRootViewController:v11];
LABEL_6:

LABEL_13:
  [(WFTriggerConfigurationViewController *)self didSelectRowAtIndexPath:v6 withSectionInfo:v7];
  v32 = [(WFTriggerConfigurationViewController *)self tableView];
  [v32 reloadData];

  [(WFTriggerConfigurationViewController *)self updateNextButtonEnabledState];
}

WFSelectableListOption *__79__WFEmailTriggerConfigurationViewController_tableView_didSelectRowAtIndexPath___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = [WFSelectableListOption alloc];
  id v5 = [v3 accountDescription];
  id v6 = [v3 identifier];
  id v7 = [(WFSelectableListOption *)v4 initWithDisplayTitle:v5 value:v6];

  id v8 = [*(id *)(a1 + 32) trigger];
  id v9 = [v8 selectedAccountIdentifiers];
  int v10 = [v3 identifier];

  -[WFSelectableListOption setSelected:](v7, "setSelected:", [v9 containsObject:v10]);
  return v7;
}

- (id)tableView:(id)a3 titleForHeaderInSection:(int64_t)a4
{
  id v4 = [(WFEmailTriggerConfigurationViewController *)self infoForSection:a4];
  id v5 = [v4 objectForKeyedSubscript:@"sectionTitle"];

  return v5;
}

- (id)tableView:(id)a3 cellForRowAtIndexPath:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  id v8 = -[WFEmailTriggerConfigurationViewController infoForSection:](self, "infoForSection:", [v6 section]);
  id v9 = [v8 objectForKeyedSubscript:@"cellIdentifier"];
  int v10 = [v7 dequeueReusableCellWithIdentifier:v9 forIndexPath:v6];

  [v10 setAccessoryType:0];
  id v11 = [v8 objectForKeyedSubscript:@"identifier"];
  int v12 = [v11 isEqual:@"triggerDescriptionSection"];

  if (v12)
  {
    [v10 setSelectionStyle:0];
    [v10 setTriggerTypeClass:objc_opt_class()];
    goto LABEL_21;
  }
  long long v13 = [v8 objectForKeyedSubscript:@"identifier"];
  int v14 = [v13 isEqual:@"senderSection"];

  if (v14)
  {
    id v15 = v10;
    int v16 = WFLocalizedString(@"Sender");
    id v17 = [v15 textLabel];
    [v17 setText:v16];

    int v18 = [(WFTriggerConfigurationViewController *)self trigger];
    v19 = [v18 selectedSenders];
    uint64_t v20 = [v19 count];

    if (v20)
    {
      BOOL v21 = [(WFTriggerConfigurationViewController *)self trigger];
      v22 = [v21 selectedSenders];
      uint64_t v23 = [v22 componentsJoinedByString:@", "];
LABEL_19:
      v54 = (void *)v23;
      v55 = [v15 detailTextLabel];
      [v55 setText:v54];

      goto LABEL_20;
    }
  }
  else
  {
    v24 = [v8 objectForKeyedSubscript:@"identifier"];
    int v25 = [v24 isEqual:@"subjectContainsSection"];

    if (!v25)
    {
      v32 = [v8 objectForKeyedSubscript:@"identifier"];
      int v33 = [v32 isEqual:@"accountSection"];

      if (v33)
      {
        id v15 = v10;
        v34 = WFLocalizedString(@"Account");
        v35 = [v15 textLabel];
        [v35 setText:v34];

        __int16 v36 = [(WFTriggerConfigurationViewController *)self trigger];
        v37 = [v36 selectedAccountIdentifiers];
        uint64_t v38 = [v37 count];

        if (!v38)
        {
          v31 = @"Any Account";
          goto LABEL_10;
        }
        v39 = [(WFTriggerConfigurationViewController *)self trigger];
        v40 = [v39 selectedAccountIdentifiers];
        uint64_t v41 = [v40 count];

        if (v41 == 1)
        {
          v42 = [(WFTriggerConfigurationViewController *)self trigger];
          v43 = [v42 selectedAccountIdentifiers];
          BOOL v21 = [v43 objectAtIndex:0];

          v22 = [(WFEmailTriggerConfigurationViewController *)self accountFromAccountIdentifier:v21];
          uint64_t v23 = [v22 accountDescription];
          goto LABEL_19;
        }
        v58 = NSString;
        BOOL v21 = WFLocalizedPluralString(@"Any of %lu Accounts");
        v22 = [(WFTriggerConfigurationViewController *)self trigger];
        v64 = [v22 selectedAccountIdentifiers];
        v59 = objc_msgSend(v58, "localizedStringWithFormat:", v21, objc_msgSend(v64, "count"));
        [v15 detailTextLabel];
        v61 = id v60 = v15;
        [v61 setText:v59];

        id v15 = v60;
      }
      else
      {
        v44 = [v8 objectForKeyedSubscript:@"identifier"];
        int v45 = [v44 isEqual:@"recipientSection"];

        if (!v45) {
          goto LABEL_21;
        }
        id v15 = v10;
        v46 = WFLocalizedString(@"Recipient");
        v47 = [v15 textLabel];
        [v47 setText:v46];

        v48 = [(WFTriggerConfigurationViewController *)self trigger];
        v49 = [v48 selectedRecipients];
        uint64_t v50 = [v49 count];

        if (!v50)
        {
          v31 = @"Any Recipient";
          goto LABEL_10;
        }
        v51 = [(WFTriggerConfigurationViewController *)self trigger];
        v52 = [v51 selectedRecipients];
        uint64_t v53 = [v52 count];

        if (v53 == 1)
        {
          BOOL v21 = [(WFTriggerConfigurationViewController *)self trigger];
          v22 = [v21 selectedRecipients];
          uint64_t v23 = [v22 objectAtIndex:0];
          goto LABEL_19;
        }
        v62 = NSString;
        BOOL v21 = WFLocalizedPluralString(@"Any of %lu Recipients");
        v22 = [(WFTriggerConfigurationViewController *)self trigger];
        v64 = [v22 selectedRecipients];
        v59 = objc_msgSend(v62, "localizedStringWithFormat:", v21, objc_msgSend(v64, "count"));
        v63 = [v15 detailTextLabel];
        [v63 setText:v59];
      }
      goto LABEL_20;
    }
    id v15 = v10;
    v26 = WFLocalizedString(@"Subject Contains");
    v27 = [v15 textLabel];
    [v27 setText:v26];

    int v28 = [(WFTriggerConfigurationViewController *)self trigger];
    v29 = [v28 selectedSubject];

    if (v29)
    {
      v30 = NSString;
      BOOL v21 = [(WFTriggerConfigurationViewController *)self trigger];
      v22 = [v21 selectedSubject];
      uint64_t v23 = [v30 stringWithFormat:@"%@", v22];
      goto LABEL_19;
    }
  }
  v31 = @"Choose";
LABEL_10:
  BOOL v21 = WFLocalizedString(v31);
  v22 = [v15 detailTextLabel];
  [v22 setText:v21];
LABEL_20:

LABEL_21:
  v56 = [(WFTriggerConfigurationViewController *)self configureAdditionalCellsIfNeeded:v10 indexPath:v6 sectionInfo:v8];

  return v56;
}

- (int64_t)tableView:(id)a3 numberOfRowsInSection:(int64_t)a4
{
  id v5 = [(WFEmailTriggerConfigurationViewController *)self infoForSection:a4];
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
  v5.super_class = (Class)WFEmailTriggerConfigurationViewController;
  [(WFEmailTriggerConfigurationViewController *)&v5 viewWillAppear:a3];
  int64_t v4 = [(WFTriggerConfigurationViewController *)self tableView];
  [v4 reloadData];
}

- (void)updateUI
{
  id v2 = [(WFTriggerConfigurationViewController *)self tableView];
  [v2 reloadData];
}

- (void)setUpAccounts
{
  uint64_t v18 = *MEMORY[0x263EF8340];
  id v3 = objc_alloc_init(MEMORY[0x263EFB210]);
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  int64_t v4 = [(WFEmailTriggerConfigurationViewController *)self supportedAccountTypeIdentifiers];
  uint64_t v5 = [v4 countByEnumeratingWithState:&v13 objects:v17 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v14;
    do
    {
      uint64_t v8 = 0;
      do
      {
        if (*(void *)v14 != v7) {
          objc_enumerationMutation(v4);
        }
        id v9 = [v3 accountTypeWithAccountTypeIdentifier:*(void *)(*((void *)&v13 + 1) + 8 * v8)];
        int v10 = [(WFEmailTriggerConfigurationViewController *)self allAccounts];
        id v11 = [v3 accountsWithAccountType:v9];
        int v12 = [v10 arrayByAddingObjectsFromArray:v11];
        [(WFEmailTriggerConfigurationViewController *)self setAllAccounts:v12];

        ++v8;
      }
      while (v6 != v8);
      uint64_t v6 = [v4 countByEnumeratingWithState:&v13 objects:v17 count:16];
    }
    while (v6);
  }
}

- (id)supportedAccountTypeIdentifiers
{
  v8[8] = *MEMORY[0x263EF8340];
  uint64_t v2 = *MEMORY[0x263EFAEB0];
  v8[0] = *MEMORY[0x263EFAE58];
  v8[1] = v2;
  uint64_t v3 = *MEMORY[0x263EFAFE0];
  v8[2] = *MEMORY[0x263EFAEE8];
  v8[3] = v3;
  uint64_t v4 = *MEMORY[0x263EFAEF8];
  v8[4] = *MEMORY[0x263EFAE50];
  v8[5] = v4;
  uint64_t v5 = *MEMORY[0x263EFAF78];
  v8[6] = *MEMORY[0x263EFAF08];
  v8[7] = v5;
  uint64_t v6 = [MEMORY[0x263EFF8C0] arrayWithObjects:v8 count:8];
  return v6;
}

- (id)customSections
{
  v25[4] = *MEMORY[0x263EF8340];
  v23[0] = @"identifier";
  v23[1] = @"cellIdentifier";
  v24[0] = @"senderSection";
  uint64_t v2 = (objc_class *)objc_opt_class();
  long long v16 = NSStringFromClass(v2);
  v24[1] = v16;
  uint64_t v3 = [NSDictionary dictionaryWithObjects:v24 forKeys:v23 count:2];
  v25[0] = v3;
  v21[1] = @"cellIdentifier";
  v22[0] = @"subjectContainsSection";
  v21[0] = @"identifier";
  uint64_t v4 = (objc_class *)objc_opt_class();
  uint64_t v5 = NSStringFromClass(v4);
  v22[1] = v5;
  uint64_t v6 = [NSDictionary dictionaryWithObjects:v22 forKeys:v21 count:2];
  v25[1] = v6;
  v20[0] = @"accountSection";
  v19[0] = @"identifier";
  v19[1] = @"sectionTitle";
  uint64_t v7 = WFLocalizedString(@"Additional filters");
  v20[1] = v7;
  v19[2] = @"cellIdentifier";
  uint64_t v8 = (objc_class *)objc_opt_class();
  id v9 = NSStringFromClass(v8);
  v20[2] = v9;
  int v10 = [NSDictionary dictionaryWithObjects:v20 forKeys:v19 count:3];
  v25[2] = v10;
  v17[1] = @"cellIdentifier";
  v18[0] = @"recipientSection";
  v17[0] = @"identifier";
  id v11 = (objc_class *)objc_opt_class();
  int v12 = NSStringFromClass(v11);
  v18[1] = v12;
  long long v13 = [NSDictionary dictionaryWithObjects:v18 forKeys:v17 count:2];
  v25[3] = v13;
  long long v14 = [MEMORY[0x263EFF8C0] arrayWithObjects:v25 count:4];

  return v14;
}

- (id)tableViewCellClasses
{
  uint64_t v9 = *MEMORY[0x263EF8340];
  uint64_t v2 = (void *)MEMORY[0x263EFFA08];
  uint64_t v6 = objc_opt_class();
  uint64_t v7 = objc_opt_class();
  uint64_t v8 = objc_opt_class();
  uint64_t v3 = [MEMORY[0x263EFF8C0] arrayWithObjects:&v6 count:3];
  uint64_t v4 = objc_msgSend(v2, "setWithArray:", v3, v6, v7);

  return v4;
}

- (WFEmailTriggerConfigurationViewController)initWithTrigger:(id)a3 mode:(unint64_t)a4
{
  id v7 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    long long v13 = [MEMORY[0x263F08690] currentHandler];
    [v13 handleFailureInMethod:a2, self, @"WFEmailTriggerConfigurationViewController.m", 49, @"Invalid parameter not satisfying: %@", @"[trigger isKindOfClass:[WFEmailTrigger class]]" object file lineNumber description];
  }
  v14.receiver = self;
  v14.super_class = (Class)WFEmailTriggerConfigurationViewController;
  uint64_t v8 = [(WFTriggerConfigurationViewController *)&v14 initWithTrigger:v7 mode:a4];
  if (v8)
  {
    uint64_t v9 = (NSArray *)objc_alloc_init(MEMORY[0x263EFF8C0]);
    allAccounts = v8->_allAccounts;
    v8->_allAccounts = v9;

    [(WFEmailTriggerConfigurationViewController *)v8 setUpAccounts];
    id v11 = v8;
  }

  return v8;
}

@end