@interface WFWalletTransactionTriggerConfigurationViewController
+ (BOOL)passIsAppleAccess:(id)a3;
- (BOOL)paymentPassesSelected;
- (NSArray)passes;
- (NSArray)remotePasses;
- (NSMutableDictionary)localPassesToRemotePassesUniqueIdentifierMapping;
- (NSMutableDictionary)merchantIcons;
- (NSMutableDictionary)passIcons;
- (WFWalletTransactionTriggerConfigurationViewController)initWithTrigger:(id)a3 mode:(unint64_t)a4;
- (id)allPassIdentifiers;
- (id)customSections;
- (id)infoForSection:(int64_t)a3;
- (id)merchantIconForMerchantType:(unint64_t)a3;
- (id)passIconForPaymentPass:(id)a3 preferredIconSize:(CGSize)a4;
- (id)tableView:(id)a3 cellForRowAtIndexPath:(id)a4;
- (id)tableView:(id)a3 titleForHeaderInSection:(int64_t)a4;
- (id)tableViewCellClasses;
- (id)tableViewHeaderString;
- (int64_t)numberOfSectionsInTableView:(id)a3;
- (int64_t)tableView:(id)a3 numberOfRowsInSection:(int64_t)a4;
- (unint64_t)detailSelection;
- (void)_fetchPassesWithCompletion:(id)a3;
- (void)filterDuplicatePassesFromLocalPasses:(id)a3 watchPasses:(id)a4;
- (void)presentNavControllerWithRootViewController:(id)a3;
- (void)tableView:(id)a3 didSelectRowAtIndexPath:(id)a4;
- (void)viewDidLoad;
- (void)viewWillAppear:(BOOL)a3;
- (void)walletMerchantViewController:(id)a3 didFinishWithMerchants:(id)a4;
@end

@implementation WFWalletTransactionTriggerConfigurationViewController

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_merchantIcons, 0);
  objc_storeStrong((id *)&self->_passIcons, 0);
  objc_storeStrong((id *)&self->_localPassesToRemotePassesUniqueIdentifierMapping, 0);
  objc_storeStrong((id *)&self->_remotePasses, 0);
  objc_storeStrong((id *)&self->_passes, 0);
}

- (NSMutableDictionary)merchantIcons
{
  return self->_merchantIcons;
}

- (NSMutableDictionary)passIcons
{
  return self->_passIcons;
}

- (unint64_t)detailSelection
{
  return self->_detailSelection;
}

- (NSMutableDictionary)localPassesToRemotePassesUniqueIdentifierMapping
{
  return self->_localPassesToRemotePassesUniqueIdentifierMapping;
}

- (NSArray)remotePasses
{
  return self->_remotePasses;
}

- (NSArray)passes
{
  return self->_passes;
}

- (void)walletMerchantViewController:(id)a3 didFinishWithMerchants:(id)a4
{
  id v6 = a3;
  v7 = objc_msgSend(a4, "if_map:", &__block_literal_global_331);
  v8 = [(WFTriggerConfigurationViewController *)self trigger];
  [v8 setSelectedMerchants:v7];

  [v6 dismissViewControllerAnimated:1 completion:0];
  id v9 = [(WFTriggerConfigurationViewController *)self tableView];
  [v9 reloadData];
}

id __109__WFWalletTransactionTriggerConfigurationViewController_walletMerchantViewController_didFinishWithMerchants___block_invoke(uint64_t a1, void *a2)
{
  v2 = (objc_class *)MEMORY[0x263F339E8];
  id v3 = a2;
  id v4 = [v2 alloc];
  v5 = [v3 displayName];
  id v6 = [v3 uniqueIdentifier];
  v7 = [v3 logoImageURL];
  uint64_t v8 = [v3 category];

  if ((unint64_t)(v8 - 1) >= 7) {
    uint64_t v9 = 0;
  }
  else {
    uint64_t v9 = v8;
  }
  v10 = (void *)[v4 initWithDisplayName:v5 uniqueIdentifier:v6 logoURL:v7 merchantType:v9];

  return v10;
}

- (void)presentNavControllerWithRootViewController:(id)a3
{
  id v4 = (objc_class *)MEMORY[0x263F829B8];
  id v5 = a3;
  id v6 = (id)[[v4 alloc] initWithRootViewController:v5];

  [(WFWalletTransactionTriggerConfigurationViewController *)self presentViewController:v6 animated:1 completion:0];
}

- (id)merchantIconForMerchantType:(unint64_t)a3
{
  id v5 = [(WFWalletTransactionTriggerConfigurationViewController *)self merchantIcons];
  id v6 = [NSNumber numberWithUnsignedInteger:a3];
  v7 = [v5 objectForKeyedSubscript:v6];

  if (!v7)
  {
    if (a3 - 1 >= 7) {
      unint64_t v8 = 0;
    }
    else {
      unint64_t v8 = a3;
    }
    uint64_t v9 = [MEMORY[0x263F82B60] mainScreen];
    [v9 scale];
    double v11 = v10;
    uint64_t v19 = 0;
    v20 = &v19;
    uint64_t v21 = 0x2020000000;
    v12 = getPKIconForMerchantCategorySymbolLoc_ptr;
    v22 = getPKIconForMerchantCategorySymbolLoc_ptr;
    if (!getPKIconForMerchantCategorySymbolLoc_ptr)
    {
      v13 = PassKitUILibrary();
      v20[3] = (uint64_t)dlsym(v13, "PKIconForMerchantCategory");
      getPKIconForMerchantCategorySymbolLoc_ptr = (_UNKNOWN *)v20[3];
      v12 = (void *)v20[3];
    }
    _Block_object_dispose(&v19, 8);
    if (!v12)
    {
      v17 = [MEMORY[0x263F08690] currentHandler];
      v18 = objc_msgSend(NSString, "stringWithUTF8String:", "UIImage *WFPKIconForMerchantCategory(PKMerchantCategory, CGSize, CGFloat, BOOL, BOOL)");
      objc_msgSend(v17, "handleFailureInFunction:file:lineNumber:description:", v18, @"WFWalletTransactionTriggerConfigurationViewController.m", 37, @"%s", dlerror());

      __break(1u);
      return result;
    }
    v7 = ((void (*)(unint64_t, void, void, double, double, double))v12)(v8, 0, 0, 45.0, 45.0, v11);

    v14 = [(WFWalletTransactionTriggerConfigurationViewController *)self merchantIcons];
    v15 = [NSNumber numberWithUnsignedInteger:a3];
    [v14 setObject:v7 forKeyedSubscript:v15];
  }
  return v7;
}

- (id)passIconForPaymentPass:(id)a3 preferredIconSize:(CGSize)a4
{
  double height = a4.height;
  double width = a4.width;
  id v7 = a3;
  unint64_t v8 = [(WFWalletTransactionTriggerConfigurationViewController *)self passIcons];
  uint64_t v9 = [v7 uniqueID];
  double v10 = [v8 objectForKeyedSubscript:v9];

  if (!v10)
  {
    double v11 = objc_msgSend(MEMORY[0x263F5BEE0], "constraintsWithAspectFitToSize:", width, height);
    v12 = [v7 frontFaceImage];
    v13 = [v12 resizedImageWithConstraints:v11];

    PassKitUILibrary();
    double v10 = [MEMORY[0x263F827E8] imageWithPKImage:v13];
    v14 = [(WFWalletTransactionTriggerConfigurationViewController *)self passIcons];
    v15 = [v7 uniqueID];
    [v14 setObject:v10 forKeyedSubscript:v15];
  }
  return v10;
}

- (void)filterDuplicatePassesFromLocalPasses:(id)a3 watchPasses:(id)a4
{
  uint64_t v58 = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v7 = a4;
  v40 = (void *)[v6 mutableCopy];
  v46 = (void *)[v7 mutableCopy];
  id v8 = objc_alloc_init(MEMORY[0x263EFF9A0]);
  id v43 = objc_alloc_init(MEMORY[0x263EFF9A0]);
  id v9 = objc_alloc_init(MEMORY[0x263EFF9C0]);
  long long v52 = 0u;
  long long v53 = 0u;
  long long v54 = 0u;
  long long v55 = 0u;
  obuint64_t j = v6;
  uint64_t v10 = [obj countByEnumeratingWithState:&v52 objects:v57 count:16];
  if (v10)
  {
    uint64_t v11 = v10;
    v47 = 0;
    uint64_t v12 = *(void *)v53;
    do
    {
      for (uint64_t i = 0; i != v11; ++i)
      {
        if (*(void *)v53 != v12) {
          objc_enumerationMutation(obj);
        }
        v14 = *(void **)(*((void *)&v52 + 1) + 8 * i);
        v15 = [v14 uniqueID];
        [v9 addObject:v15];

        if ([v14 passType] == 1)
        {
          id v16 = v14;
          if ([(id)objc_opt_class() passIsAppleAccess:v16])
          {
            uint64_t v17 = [v16 uniqueID];

            v47 = (void *)v17;
          }
          v18 = [v16 primaryAccountIdentifier];
          if (v18) {
            [v8 setObject:v16 forKeyedSubscript:v18];
          }
          uint64_t v19 = [v16 pairedTerminalIdentifier];
          if (v19) {
            [v43 setObject:v16 forKeyedSubscript:v19];
          }
        }
      }
      uint64_t v11 = [obj countByEnumeratingWithState:&v52 objects:v57 count:16];
    }
    while (v11);
  }
  else
  {
    v47 = 0;
  }
  v42 = v8;

  long long v50 = 0u;
  long long v51 = 0u;
  long long v48 = 0u;
  long long v49 = 0u;
  id v44 = v7;
  uint64_t v20 = [v44 countByEnumeratingWithState:&v48 objects:v56 count:16];
  if (v20)
  {
    uint64_t v21 = v20;
    uint64_t v22 = *(void *)v49;
    v41 = self;
    do
    {
      for (uint64_t j = 0; j != v21; ++j)
      {
        if (*(void *)v49 != v22) {
          objc_enumerationMutation(v44);
        }
        v24 = *(void **)(*((void *)&v48 + 1) + 8 * j);
        v25 = [v24 uniqueID];
        if ([v9 containsObject:v25]) {
          goto LABEL_36;
        }
        if (v47 && [(id)objc_opt_class() passIsAppleAccess:v24])
        {
          v26 = [v24 uniqueID];
          v27 = [(WFWalletTransactionTriggerConfigurationViewController *)self localPassesToRemotePassesUniqueIdentifierMapping];
          [v27 setObject:v26 forKeyedSubscript:v47];
LABEL_35:

LABEL_36:
          [v46 removeObject:v24];
          goto LABEL_37;
        }
        if (![v24 activationState] || objc_msgSend(v24, "activationState") == 2)
        {
          if ([v24 isCarKeyPass]
            && ([v24 pairedTerminalIdentifier],
                v28 = objc_claimAutoreleasedReturnValue(),
                [v43 objectForKey:v28],
                v29 = objc_claimAutoreleasedReturnValue(),
                v29,
                v28,
                v29))
          {
            v30 = [v24 pairedTerminalIdentifier];
            v31 = v43;
          }
          else
          {
            v32 = [v24 primaryAccountIdentifier];
            v33 = [v42 objectForKey:v32];

            if (!v33) {
              goto LABEL_37;
            }
            v30 = [v24 primaryAccountIdentifier];
            v31 = v42;
          }
          v26 = [v31 objectForKeyedSubscript:v30];

          v27 = [v24 uniqueID];
          v34 = [(WFWalletTransactionTriggerConfigurationViewController *)self localPassesToRemotePassesUniqueIdentifierMapping];
          v35 = [v26 uniqueID];
          [v34 setObject:v27 forKeyedSubscript:v35];

          self = v41;
          goto LABEL_35;
        }
LABEL_37:
      }
      uint64_t v21 = [v44 countByEnumeratingWithState:&v48 objects:v56 count:16];
    }
    while (v21);
  }

  v36 = [v40 sortedArrayUsingComparator:&__block_literal_global_322];
  passes = self->_passes;
  self->_passes = v36;

  v38 = [v46 sortedArrayUsingComparator:&__block_literal_global_324];
  remotePasses = self->_remotePasses;
  self->_remotePasses = v38;
}

uint64_t __106__WFWalletTransactionTriggerConfigurationViewController_filterDuplicatePassesFromLocalPasses_watchPasses___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v4 = a3;
  id v5 = [a2 localizedDescription];
  id v6 = [v4 localizedDescription];

  uint64_t v7 = [v5 localizedCaseInsensitiveCompare:v6];
  return v7;
}

uint64_t __106__WFWalletTransactionTriggerConfigurationViewController_filterDuplicatePassesFromLocalPasses_watchPasses___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v4 = a3;
  id v5 = [a2 localizedDescription];
  id v6 = [v4 localizedDescription];

  uint64_t v7 = [v5 localizedCaseInsensitiveCompare:v6];
  return v7;
}

- (void)_fetchPassesWithCompletion:(id)a3
{
  id v8 = (void (**)(id, uint64_t))a3;
  id v4 = [MEMORY[0x263F5BF80] sharedInstance];
  id v5 = [v4 passesOfType:1];
  id v6 = [MEMORY[0x263F5BF80] sharedInstanceWithRemoteLibrary];
  uint64_t v7 = [v6 remoteSecureElementPasses];
  [(WFWalletTransactionTriggerConfigurationViewController *)self filterDuplicatePassesFromLocalPasses:v5 watchPasses:v7];
  if (v8) {
    v8[2](v8, 1);
  }
}

- (void)tableView:(id)a3 didSelectRowAtIndexPath:(id)a4
{
  uint64_t v67 = *MEMORY[0x263EF8340];
  id v6 = a4;
  [a3 deselectRowAtIndexPath:v6 animated:1];
  uint64_t v7 = -[WFWalletTransactionTriggerConfigurationViewController infoForSection:](self, "infoForSection:", [v6 section]);
  id v8 = [v7 objectForKeyedSubscript:@"identifier"];
  int v9 = [v8 isEqual:@"triggerPassParameters"];

  if (v9)
  {
    uint64_t v10 = getWFTriggersLogObject();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG))
    {
      int v63 = 136315394;
      v64 = "-[WFWalletTransactionTriggerConfigurationViewController tableView:didSelectRowAtIndexPath:]";
      __int16 v65 = 2114;
      v66 = v7;
      _os_log_impl(&dword_22D994000, v10, OS_LOG_TYPE_DEBUG, "%s didselect section: %{public}@", (uint8_t *)&v63, 0x16u);
    }

    uint64_t v11 = [(WFWalletTransactionTriggerConfigurationViewController *)self passes];
    uint64_t v12 = objc_msgSend(v11, "objectAtIndexedSubscript:", objc_msgSend(v6, "row"));

    v13 = [(WFTriggerConfigurationViewController *)self trigger];
    v14 = [v13 selectedPassUniqueIDs];
    v15 = [v12 uniqueID];
    int v16 = [v14 containsObject:v15];

    if (v16)
    {
      uint64_t v17 = [(WFTriggerConfigurationViewController *)self trigger];
      v18 = [v17 selectedPassUniqueIDs];
      uint64_t v19 = (WFWalletMerchantSelectionTableViewController *)[v18 mutableCopy];

      uint64_t v20 = [v12 uniqueID];
      [(WFWalletMerchantSelectionTableViewController *)v19 removeObject:v20];

      uint64_t v21 = [(WFWalletTransactionTriggerConfigurationViewController *)self localPassesToRemotePassesUniqueIdentifierMapping];
      uint64_t v22 = [v12 uniqueID];
      v23 = [v21 objectForKeyedSubscript:v22];

      if (v23) {
        [(WFWalletMerchantSelectionTableViewController *)v19 removeObject:v23];
      }
      v24 = [(WFTriggerConfigurationViewController *)self trigger];
      v25 = v24;
      v26 = v19;
LABEL_17:
      [v24 setSelectedPassUniqueIDs:v26];
LABEL_24:

      goto LABEL_25;
    }
    v37 = (void *)MEMORY[0x263EFF9C0];
    v38 = [(WFTriggerConfigurationViewController *)self trigger];
    v39 = [v38 selectedPassUniqueIDs];
    uint64_t v19 = [v37 setWithArray:v39];

    v40 = [v12 uniqueID];
    [(WFWalletMerchantSelectionTableViewController *)v19 addObject:v40];

    v41 = [(WFWalletTransactionTriggerConfigurationViewController *)self localPassesToRemotePassesUniqueIdentifierMapping];
    v42 = [v12 uniqueID];
    v23 = [v41 objectForKeyedSubscript:v42];

    if (v23) {
      [(WFWalletMerchantSelectionTableViewController *)v19 addObject:v23];
    }
    v25 = [(WFWalletMerchantSelectionTableViewController *)v19 allObjects];
    id v43 = [(WFTriggerConfigurationViewController *)self trigger];
    [v43 setSelectedPassUniqueIDs:v25];
LABEL_23:

    goto LABEL_24;
  }
  v27 = [v7 objectForKeyedSubscript:@"identifier"];
  int v28 = [v27 isEqual:@"triggerRemotePassParameters"];

  if (v28)
  {
    v29 = [(WFWalletTransactionTriggerConfigurationViewController *)self remotePasses];
    uint64_t v12 = objc_msgSend(v29, "objectAtIndexedSubscript:", objc_msgSend(v6, "row"));

    v30 = [(WFTriggerConfigurationViewController *)self trigger];
    v31 = [v30 selectedPassUniqueIDs];
    v32 = [v12 uniqueID];
    int v33 = [v31 containsObject:v32];

    if (v33)
    {
      v34 = [(WFTriggerConfigurationViewController *)self trigger];
      v35 = [v34 selectedPassUniqueIDs];
      uint64_t v19 = (WFWalletMerchantSelectionTableViewController *)[v35 mutableCopy];

      v36 = [v12 uniqueID];
      [(WFWalletMerchantSelectionTableViewController *)v19 removeObject:v36];

      v23 = [(WFTriggerConfigurationViewController *)self trigger];
      [(WFWalletMerchantSelectionTableViewController *)v23 setSelectedPassUniqueIDs:v19];
LABEL_25:

      goto LABEL_26;
    }
    long long v51 = (void *)MEMORY[0x263EFF9C0];
    long long v52 = [(WFTriggerConfigurationViewController *)self trigger];
    long long v53 = [v52 selectedPassUniqueIDs];
    uint64_t v19 = [v51 setWithArray:v53];

    long long v54 = [v12 uniqueID];
    [(WFWalletMerchantSelectionTableViewController *)v19 addObject:v54];

    v23 = [(WFWalletMerchantSelectionTableViewController *)v19 allObjects];
    v24 = [(WFTriggerConfigurationViewController *)self trigger];
    v25 = v24;
    v26 = v23;
    goto LABEL_17;
  }
  id v44 = [v7 objectForKeyedSubscript:@"identifier"];
  int v45 = [v44 isEqual:@"merchants"];

  if (v45)
  {
    v46 = [(WFWalletTransactionTriggerConfigurationViewController *)self passes];
    uint64_t v12 = objc_msgSend(v46, "if_flatMap:", &__block_literal_global_317);

    v47 = [WFWalletMerchantSelectionTableViewController alloc];
    long long v48 = [MEMORY[0x263EFFA08] setWithArray:v12];
    long long v49 = [(WFTriggerConfigurationViewController *)self trigger];
    long long v50 = [v49 selectedMerchants];
    uint64_t v19 = [(WFWalletMerchantSelectionTableViewController *)v47 initWithTransactionIdentifiers:v48 selectedMerchants:v50];

    [(WFWalletMerchantSelectionTableViewController *)v19 setDelegate:self];
    [(WFWalletTransactionTriggerConfigurationViewController *)self presentNavControllerWithRootViewController:v19];
LABEL_26:

    goto LABEL_27;
  }
  long long v55 = [v7 objectForKeyedSubscript:@"identifier"];
  int v56 = [v55 isEqualToString:@"triggerTransactionMerchantType"];

  if (v56)
  {
    v57 = [v7 objectForKeyedSubscript:@"items"];
    uint64_t v12 = objc_msgSend(v57, "objectAtIndexedSubscript:", objc_msgSend(v6, "row"));

    uint64_t v58 = [(WFTriggerConfigurationViewController *)self trigger];
    v59 = [v58 selectedMerchantTypes];
    int v60 = [v59 containsObject:v12];

    uint64_t v19 = [(WFTriggerConfigurationViewController *)self trigger];
    v61 = [(WFWalletMerchantSelectionTableViewController *)v19 selectedMerchantTypes];
    v23 = v61;
    if (v60) {
      [(WFWalletMerchantSelectionTableViewController *)v61 if_arrayByRemovingObject:v12];
    }
    else {
    v25 = [(WFWalletMerchantSelectionTableViewController *)v61 arrayByAddingObject:v12];
    }
    id v43 = [(WFTriggerConfigurationViewController *)self trigger];
    [v43 setSelectedMerchantTypes:v25];
    goto LABEL_23;
  }
LABEL_27:
  [(WFTriggerConfigurationViewController *)self didSelectRowAtIndexPath:v6 withSectionInfo:v7];
  v62 = [(WFTriggerConfigurationViewController *)self tableView];
  [v62 reloadData];

  [(WFTriggerConfigurationViewController *)self updateNextButtonEnabledState];
}

id __91__WFWalletTransactionTriggerConfigurationViewController_tableView_didSelectRowAtIndexPath___block_invoke(uint64_t a1, void *a2)
{
  v2 = [a2 deviceTransactionSourceIdentifiers];
  id v3 = [v2 allObjects];

  return v3;
}

- (id)tableView:(id)a3 titleForHeaderInSection:(int64_t)a4
{
  id v4 = [(WFWalletTransactionTriggerConfigurationViewController *)self infoForSection:a4];
  id v5 = [v4 objectForKeyedSubscript:@"sectionTitle"];

  return v5;
}

- (id)tableViewHeaderString
{
  return WFLocalizedString(@"When I tap");
}

- (id)tableView:(id)a3 cellForRowAtIndexPath:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  id v8 = -[WFWalletTransactionTriggerConfigurationViewController infoForSection:](self, "infoForSection:", [v6 section]);
  int v9 = [v8 objectForKeyedSubscript:@"cellIdentifier"];
  uint64_t v10 = [v7 dequeueReusableCellWithIdentifier:v9 forIndexPath:v6];

  [v10 setAccessoryType:0];
  uint64_t v11 = [v8 objectForKeyedSubscript:@"identifier"];
  int v12 = [v11 isEqual:@"triggerPassParameters"];

  if (v12)
  {
    v69 = v9;
    id v13 = v10;
    v14 = [(WFWalletTransactionTriggerConfigurationViewController *)self passes];
    id v67 = v6;
    v15 = objc_msgSend(v14, "objectAtIndexedSubscript:", objc_msgSend(v6, "row"));

    int v16 = -[WFWalletTransactionTriggerConfigurationViewController passIconForPaymentPass:preferredIconSize:](self, "passIconForPaymentPass:preferredIconSize:", v15, 45.0, 32.0);
    [v13 setImage:v16 width:45.0 height:32.0];
    [v13 setImageTopPadding:10.0 bottomPadding:10.0];
    [v15 localizedDescription];
    v18 = uint64_t v17 = self;
    uint64_t v19 = [v13 label];
    [v19 setText:v18];

    uint64_t v20 = v17;
    uint64_t v21 = [(WFTriggerConfigurationViewController *)v17 trigger];
    uint64_t v22 = [v21 selectedPassUniqueIDs];
    v23 = [v15 uniqueID];
    LODWORD(v17) = [v22 containsObject:v23];

    if (v17) {
LABEL_3:
    }
      [v13 setAccessoryType:3];
  }
  else
  {
    v24 = [v8 objectForKeyedSubscript:@"identifier"];
    int v25 = [v24 isEqual:@"merchants"];

    if (v25)
    {
      id v26 = v10;
      v27 = WFLocalizedString(@"Filter Merchants");
      int v28 = [v26 textLabel];
      [v28 setText:v27];

      v29 = [(WFTriggerConfigurationViewController *)self trigger];
      v30 = [v29 selectedMerchants];
      uint64_t v31 = [v30 count];

      if (v31)
      {
        v32 = [(WFTriggerConfigurationViewController *)self trigger];
        int v33 = [v32 selectedMerchants];
        uint64_t v34 = [v33 count];

        if (v34 == 1)
        {
          v15 = [(WFTriggerConfigurationViewController *)self trigger];
          v35 = [v15 selectedMerchants];
          v36 = [v35 firstObject];
          v37 = [v36 displayName];
          v38 = [v26 detailTextLabel];
          [v38 setText:v37];
        }
        else
        {
          v61 = NSString;
          v15 = WFLocalizedString(@"Any of %lu Merchants");
          v35 = [(WFTriggerConfigurationViewController *)self trigger];
          v62 = [v35 selectedMerchants];
          int v63 = objc_msgSend(v61, "localizedStringWithFormat:", v15, objc_msgSend(v62, "count"));
          v64 = [v26 detailTextLabel];
          [v64 setText:v63];
        }
      }
      else
      {
        v15 = WFLocalizedString(@"Choose");
        v35 = [v26 detailTextLabel];
        [v35 setText:v15];
      }

      goto LABEL_20;
    }
    v39 = [v8 objectForKeyedSubscript:@"identifier"];
    int v40 = [v39 isEqual:@"triggerRemotePassParameters"];

    if (!v40)
    {
      long long v48 = [v8 objectForKeyedSubscript:@"identifier"];
      int v49 = [v48 isEqualToString:@"triggerTransactionMerchantType"];

      if (!v49) {
        goto LABEL_21;
      }
      v69 = v9;
      long long v50 = [v8 objectForKeyedSubscript:@"items"];
      long long v51 = objc_msgSend(v50, "objectAtIndexedSubscript:", objc_msgSend(v6, "row"));
      uint64_t v52 = [v51 unsignedIntegerValue];

      id v53 = v10;
      long long v54 = PKLocalizedStringFromMerchantCategory();
      long long v55 = [v53 label];
      [v55 setText:v54];

      v15 = [(WFWalletTransactionTriggerConfigurationViewController *)self merchantIconForMerchantType:v52];
      [v53 setImage:v15 width:45.0 height:45.0];
      [v53 setImageTopPadding:10.0 bottomPadding:10.0];
      [v53 setCornerRadius:6.0];
      v68 = self;
      int v56 = [(WFTriggerConfigurationViewController *)self trigger];
      v57 = [v56 selectedMerchantTypes];
      uint64_t v58 = [v8 objectForKeyedSubscript:@"items"];
      v59 = objc_msgSend(v58, "objectAtIndexedSubscript:", objc_msgSend(v6, "row"));
      int v60 = [v57 containsObject:v59];

      if (v60) {
        [v53 setAccessoryType:3];
      }
      self = v68;
      goto LABEL_5;
    }
    v69 = v9;
    id v13 = v10;
    v41 = [(WFWalletTransactionTriggerConfigurationViewController *)self remotePasses];
    id v67 = v6;
    v15 = objc_msgSend(v41, "objectAtIndexedSubscript:", objc_msgSend(v6, "row"));

    int v16 = -[WFWalletTransactionTriggerConfigurationViewController passIconForPaymentPass:preferredIconSize:](self, "passIconForPaymentPass:preferredIconSize:", v15, 42.0, 30.0);
    [v13 setImage:v16 width:42.0 height:30.0];
    [v13 setImageTopPadding:10.0 bottomPadding:10.0];
    v42 = [v15 localizedDescription];
    id v43 = [v13 label];
    [v43 setText:v42];

    uint64_t v20 = self;
    id v44 = [(WFTriggerConfigurationViewController *)self trigger];
    int v45 = [v44 selectedPassUniqueIDs];
    v46 = [v15 uniqueID];
    int v47 = [v45 containsObject:v46];

    if (v47) {
      goto LABEL_3;
    }
  }

  self = v20;
  id v6 = v67;
LABEL_5:
  int v9 = v69;
LABEL_20:

LABEL_21:
  __int16 v65 = [(WFTriggerConfigurationViewController *)self configureAdditionalCellsIfNeeded:v10 indexPath:v6 sectionInfo:v8];

  return v65;
}

- (int64_t)tableView:(id)a3 numberOfRowsInSection:(int64_t)a4
{
  id v5 = [(WFWalletTransactionTriggerConfigurationViewController *)self infoForSection:a4];
  id v6 = [v5 objectForKeyedSubscript:@"identifier"];
  char v7 = [v6 isEqualToString:@"merchants"];

  if (v7)
  {
    int64_t v8 = 1;
  }
  else
  {
    int v9 = [v5 objectForKeyedSubscript:@"identifier"];
    int v10 = [v9 isEqualToString:@"triggerPassParameters"];

    if (v10)
    {
      uint64_t v11 = [(WFWalletTransactionTriggerConfigurationViewController *)self passes];
    }
    else
    {
      int v12 = [v5 objectForKeyedSubscript:@"identifier"];
      int v13 = [v12 isEqualToString:@"triggerTransactionMerchantType"];

      if (!v13)
      {
        int64_t v8 = [(WFTriggerConfigurationViewController *)self numberOfRowsInSectionWithInfo:v5];
        goto LABEL_9;
      }
      uint64_t v11 = [v5 objectForKeyedSubscript:@"items"];
    }
    v14 = v11;
    int64_t v8 = [v11 count];
  }
LABEL_9:

  return v8;
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
  v6.receiver = self;
  v6.super_class = (Class)WFWalletTransactionTriggerConfigurationViewController;
  [(WFWalletTransactionTriggerConfigurationViewController *)&v6 viewWillAppear:a3];
  int64_t v4 = [(WFTriggerConfigurationViewController *)self tableView];
  [v4 setEstimatedRowHeight:100.0];

  v5[0] = MEMORY[0x263EF8330];
  v5[1] = 3221225472;
  v5[2] = __72__WFWalletTransactionTriggerConfigurationViewController_viewWillAppear___block_invoke;
  v5[3] = &unk_2649CBE58;
  v5[4] = self;
  [(WFWalletTransactionTriggerConfigurationViewController *)self _fetchPassesWithCompletion:v5];
}

void __72__WFWalletTransactionTriggerConfigurationViewController_viewWillAppear___block_invoke(uint64_t a1)
{
  if (![*(id *)(a1 + 32) mode])
  {
    v2 = [*(id *)(a1 + 32) allPassIdentifiers];
    id v3 = [*(id *)(a1 + 32) trigger];
    [v3 setSelectedPassUniqueIDs:v2];
  }
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __72__WFWalletTransactionTriggerConfigurationViewController_viewWillAppear___block_invoke_2;
  block[3] = &unk_2649CBF20;
  block[4] = *(void *)(a1 + 32);
  dispatch_async(MEMORY[0x263EF83A0], block);
}

uint64_t __72__WFWalletTransactionTriggerConfigurationViewController_viewWillAppear___block_invoke_2(uint64_t a1)
{
  v2 = [*(id *)(a1 + 32) tableView];
  [v2 reloadData];

  id v3 = *(void **)(a1 + 32);
  return [v3 updateNextButtonEnabledState];
}

- (void)viewDidLoad
{
  v7.receiver = self;
  v7.super_class = (Class)WFWalletTransactionTriggerConfigurationViewController;
  [(WFTriggerConfigurationViewController *)&v7 viewDidLoad];
  id v3 = [(WFTriggerConfigurationViewController *)self tableView];
  uint64_t v4 = objc_opt_class();
  id v5 = (objc_class *)objc_opt_class();
  objc_super v6 = NSStringFromClass(v5);
  [v3 registerClass:v4 forHeaderFooterViewReuseIdentifier:v6];
}

- (id)allPassIdentifiers
{
  id v3 = [(WFWalletTransactionTriggerConfigurationViewController *)self passes];
  uint64_t v4 = objc_msgSend(v3, "if_compactMap:", &__block_literal_global_17046);
  id v5 = [(WFWalletTransactionTriggerConfigurationViewController *)self remotePasses];
  objc_super v6 = objc_msgSend(v5, "if_compactMap:", &__block_literal_global_281);
  objc_super v7 = [v4 arrayByAddingObjectsFromArray:v6];
  int64_t v8 = [(WFWalletTransactionTriggerConfigurationViewController *)self localPassesToRemotePassesUniqueIdentifierMapping];
  int v9 = [v8 allValues];
  int v10 = [v7 arrayByAddingObjectsFromArray:v9];

  return v10;
}

uint64_t __75__WFWalletTransactionTriggerConfigurationViewController_allPassIdentifiers__block_invoke_2(uint64_t a1, void *a2)
{
  return [a2 uniqueID];
}

uint64_t __75__WFWalletTransactionTriggerConfigurationViewController_allPassIdentifiers__block_invoke(uint64_t a1, void *a2)
{
  return [a2 uniqueID];
}

- (BOOL)paymentPassesSelected
{
  uint64_t v23 = *MEMORY[0x263EF8340];
  long long v18 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  long long v21 = 0u;
  id v3 = [(WFWalletTransactionTriggerConfigurationViewController *)self passes];
  uint64_t v17 = self;
  uint64_t v4 = [(WFWalletTransactionTriggerConfigurationViewController *)self remotePasses];
  id v5 = [v3 arrayByAddingObjectsFromArray:v4];

  uint64_t v6 = [v5 countByEnumeratingWithState:&v18 objects:v22 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v19;
    do
    {
      for (uint64_t i = 0; i != v7; ++i)
      {
        if (*(void *)v19 != v8) {
          objc_enumerationMutation(v5);
        }
        id v10 = *(id *)(*((void *)&v18 + 1) + 8 * i);
        if (v10 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
        {
          if ([v10 cardType] == 1)
          {
            uint64_t v11 = [(WFTriggerConfigurationViewController *)v17 trigger];
            int v12 = [v11 selectedPassUniqueIDs];
            int v13 = [v10 uniqueID];
            char v14 = [v12 containsObject:v13];

            if (v14)
            {

              BOOL v15 = 1;
              goto LABEL_15;
            }
          }
        }
        else
        {

          id v10 = 0;
        }
      }
      uint64_t v7 = [v5 countByEnumeratingWithState:&v18 objects:v22 count:16];
    }
    while (v7);
  }
  BOOL v15 = 0;
LABEL_15:

  return v15;
}

- (id)customSections
{
  v35[3] = *MEMORY[0x263EF8340];
  id v3 = objc_opt_new();
  uint64_t v4 = [(WFWalletTransactionTriggerConfigurationViewController *)self passes];
  uint64_t v5 = [v4 count];

  if (v5)
  {
    v35[0] = @"triggerPassParameters";
    v34[0] = @"identifier";
    v34[1] = @"sectionTitle";
    uint64_t v6 = WFLocalizedString(@"CARD");
    v35[1] = v6;
    v34[2] = @"cellIdentifier";
    uint64_t v7 = (objc_class *)objc_opt_class();
    uint64_t v8 = NSStringFromClass(v7);
    v35[2] = v8;
    int v9 = [NSDictionary dictionaryWithObjects:v35 forKeys:v34 count:3];
    [v3 addObject:v9];
  }
  id v10 = [(WFWalletTransactionTriggerConfigurationViewController *)self remotePasses];
  uint64_t v11 = [v10 count];

  if (v11)
  {
    v33[0] = @"triggerRemotePassParameters";
    v32[0] = @"identifier";
    v32[1] = @"sectionTitle";
    int v12 = WFLocalizedString(@"OTHER CARDS ON YOUR WATCH");
    v33[1] = v12;
    v32[2] = @"cellIdentifier";
    int v13 = (objc_class *)objc_opt_class();
    char v14 = NSStringFromClass(v13);
    v33[2] = v14;
    BOOL v15 = [NSDictionary dictionaryWithObjects:v33 forKeys:v32 count:3];
    [v3 addObject:v15];
  }
  if ([(WFWalletTransactionTriggerConfigurationViewController *)self paymentPassesSelected])
  {
    int v16 = [(WFTriggerConfigurationViewController *)self trigger];
    uint64_t v17 = [v16 selectedMerchants];
    uint64_t v18 = [v17 count];

    if (!v18)
    {
      v31[0] = @"triggerTransactionMerchantType";
      v30[0] = @"identifier";
      v30[1] = @"sectionTitle";
      long long v19 = WFLocalizedString(@"CATEGORY");
      v31[1] = v19;
      v30[2] = @"cellIdentifier";
      long long v20 = (objc_class *)objc_opt_class();
      long long v21 = NSStringFromClass(v20);
      v30[3] = @"items";
      v31[2] = v21;
      v31[3] = &unk_26E1CA918;
      uint64_t v22 = [NSDictionary dictionaryWithObjects:v31 forKeys:v30 count:4];
      [v3 addObject:v22];
    }
    int v28 = @"cellIdentifier";
    v29[0] = @"merchants";
    v27 = @"identifier";
    uint64_t v23 = (objc_class *)objc_opt_class();
    v24 = NSStringFromClass(v23);
    v29[1] = v24;
    int v25 = [NSDictionary dictionaryWithObjects:v29 forKeys:&v27 count:2];
    objc_msgSend(v3, "addObject:", v25, v27, v28, v29[0]);
  }
  return v3;
}

- (id)tableViewCellClasses
{
  uint64_t v9 = *MEMORY[0x263EF8340];
  v2 = (void *)MEMORY[0x263EFFA08];
  uint64_t v6 = objc_opt_class();
  uint64_t v7 = objc_opt_class();
  uint64_t v8 = objc_opt_class();
  id v3 = [MEMORY[0x263EFF8C0] arrayWithObjects:&v6 count:3];
  uint64_t v4 = objc_msgSend(v2, "setWithArray:", v3, v6, v7);

  return v4;
}

- (WFWalletTransactionTriggerConfigurationViewController)initWithTrigger:(id)a3 mode:(unint64_t)a4
{
  id v7 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    long long v21 = [MEMORY[0x263F08690] currentHandler];
    [v21 handleFailureInMethod:a2, self, @"WFWalletTransactionTriggerConfigurationViewController.m", 126, @"Invalid parameter not satisfying: %@", @"[trigger isKindOfClass:[WFWalletTransactionTrigger class]]" object file lineNumber description];
  }
  v22.receiver = self;
  v22.super_class = (Class)WFWalletTransactionTriggerConfigurationViewController;
  uint64_t v8 = [(WFTriggerConfigurationViewController *)&v22 initWithTrigger:v7 mode:a4];
  uint64_t v9 = v8;
  if (v8)
  {
    passes = v8->_passes;
    uint64_t v11 = (NSArray *)MEMORY[0x263EFFA68];
    v8->_passes = (NSArray *)MEMORY[0x263EFFA68];

    remotePasses = v9->_remotePasses;
    v9->_remotePasses = v11;

    v9->_detailSelection = 0;
    int v13 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x263EFF9A0]);
    localPassesToRemotePassesUniqueIdentifierMapping = v9->_localPassesToRemotePassesUniqueIdentifierMapping;
    v9->_localPassesToRemotePassesUniqueIdentifierMapping = v13;

    BOOL v15 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x263EFF9A0]);
    passIcons = v9->_passIcons;
    v9->_passIcons = v15;

    uint64_t v17 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x263EFF9A0]);
    merchantIcons = v9->_merchantIcons;
    v9->_merchantIcons = v17;

    long long v19 = v9;
  }

  return v9;
}

+ (BOOL)passIsAppleAccess:(id)a3
{
  uint64_t v29 = *MEMORY[0x263EF8340];
  long long v23 = 0u;
  long long v24 = 0u;
  long long v25 = 0u;
  long long v26 = 0u;
  id v3 = [a3 devicePaymentApplications];
  uint64_t v4 = [v3 countByEnumeratingWithState:&v23 objects:v28 count:16];
  if (v4)
  {
    uint64_t v5 = v4;
    uint64_t v6 = *(void *)v24;
    uint64_t v18 = *(void *)v24;
    do
    {
      for (uint64_t i = 0; i != v5; ++i)
      {
        if (*(void *)v24 != v6) {
          objc_enumerationMutation(v3);
        }
        uint64_t v8 = *(void **)(*((void *)&v23 + 1) + 8 * i);
        long long v19 = 0u;
        long long v20 = 0u;
        long long v21 = 0u;
        long long v22 = 0u;
        uint64_t v9 = [v8 automaticSelectionCriteria];
        uint64_t v10 = [v9 countByEnumeratingWithState:&v19 objects:v27 count:16];
        if (v10)
        {
          uint64_t v11 = v10;
          uint64_t v12 = *(void *)v20;
          while (2)
          {
            for (uint64_t j = 0; j != v11; ++j)
            {
              if (*(void *)v20 != v12) {
                objc_enumerationMutation(v9);
              }
              char v14 = [*(id *)(*((void *)&v19 + 1) + 8 * j) type];
              char v15 = PKEqualObjects();

              if (v15)
              {

                BOOL v16 = 1;
                goto LABEL_19;
              }
            }
            uint64_t v11 = [v9 countByEnumeratingWithState:&v19 objects:v27 count:16];
            if (v11) {
              continue;
            }
            break;
          }
        }

        uint64_t v6 = v18;
      }
      uint64_t v5 = [v3 countByEnumeratingWithState:&v23 objects:v28 count:16];
      BOOL v16 = 0;
    }
    while (v5);
  }
  else
  {
    BOOL v16 = 0;
  }
LABEL_19:

  return v16;
}

@end