@interface ICQUIManageStorageHeaderSpecifierProvider
- (AIDAAccountManager)accountManager;
- (ICQCloudStorageSummary)storageSummary;
- (ICQUIManageStorageHeaderSpecifierProvider)initWithAccountManager:(id)a3;
- (ICQUIManageStorageHeaderSpecifierProvider)initWithAccountManager:(id)a3 storageSummary:(id)a4;
- (ICQUIManageStorageSpecifierProviderDelegate)delegate;
- (NSArray)specifiers;
- (PSSpecifier)storageSpecifier;
- (id)_valueForStorageGraphSpecifier:(id)a3;
- (id)account;
- (id)makeFamilyAndPlanManagementSpecifiers;
- (id)makeThermometerSpecifiers;
- (int64_t)cellTypeForAction:(int64_t)a3;
- (int64_t)cellTypeForSpecifierInfo:(id)a3;
- (void)_fetchStorageSummaryAndRefreshSpecifiers;
- (void)dealloc;
- (void)launchActionFromSpecifier:(id)a3;
- (void)refreshHeaderSpecifiersWithSummary:(id)a3;
- (void)setAccountManager:(id)a3;
- (void)setDelegate:(id)a3;
- (void)setSpecifiers:(id)a3;
- (void)setStorageSpecifier:(id)a3;
- (void)setStorageSummary:(id)a3;
@end

@implementation ICQUIManageStorageHeaderSpecifierProvider

- (ICQUIManageStorageHeaderSpecifierProvider)initWithAccountManager:(id)a3
{
  return [(ICQUIManageStorageHeaderSpecifierProvider *)self initWithAccountManager:a3 storageSummary:0];
}

- (ICQUIManageStorageHeaderSpecifierProvider)initWithAccountManager:(id)a3 storageSummary:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v13.receiver = self;
  v13.super_class = (Class)ICQUIManageStorageHeaderSpecifierProvider;
  v9 = [(ICQUIManageStorageHeaderSpecifierProvider *)&v13 init];
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_accountManager, a3);
    objc_storeStrong((id *)&v10->_storageSummary, a4);
    v11 = [MEMORY[0x263F08A00] defaultCenter];
    [v11 addObserver:v10 selector:sel__fetchStorageSummaryAndRefreshSpecifiers name:@"QuotaDidChange" object:0];
  }
  return v10;
}

- (void)dealloc
{
  uint64_t v5 = *MEMORY[0x263EF8340];
  int v1 = 136315394;
  v2 = "-[ICQUIManageStorageHeaderSpecifierProvider dealloc]";
  __int16 v3 = 2112;
  v4 = @"QuotaDidChange";
  _os_log_debug_impl(&dword_22C821000, log, OS_LOG_TYPE_DEBUG, "%s: Unregistering from notification: %@", (uint8_t *)&v1, 0x16u);
}

- (id)account
{
  v2 = [(AIDAAccountManager *)self->_accountManager accounts];
  __int16 v3 = [v2 objectForKeyedSubscript:*MEMORY[0x263F26D28]];

  return v3;
}

- (NSArray)specifiers
{
  specifiers = self->_specifiers;
  if (specifiers)
  {
    __int16 v3 = specifiers;
  }
  else
  {
    id v5 = objc_alloc_init(MEMORY[0x263EFF980]);
    v6 = [(ICQUIManageStorageHeaderSpecifierProvider *)self makeThermometerSpecifiers];
    [v5 addObjectsFromArray:v6];

    id v7 = [(ICQUIManageStorageHeaderSpecifierProvider *)self makeFamilyAndPlanManagementSpecifiers];
    [v5 addObjectsFromArray:v7];

    id v8 = (NSArray *)[v5 copy];
    v9 = self->_specifiers;
    self->_specifiers = v8;

    __int16 v3 = self->_specifiers;
  }
  return v3;
}

- (id)makeThermometerSpecifiers
{
  id v3 = objc_alloc_init(MEMORY[0x263EFF980]);
  v4 = [MEMORY[0x263F5FC40] groupSpecifierWithID:@"MANAGE_STORAGE_THERMOMETER"];
  id v5 = [(ICQUIManageStorageHeaderSpecifierProvider *)self storageSummary];
  v6 = [v5 manageStoragePage];
  id v7 = [v6 storageGraphFooterText];

  if (v7) {
    [v4 setProperty:v7 forKey:*MEMORY[0x263F600F8]];
  }
  [v3 addObject:v4];
  id v8 = [(ICQUIManageStorageHeaderSpecifierProvider *)self storageSpecifier];

  if (!v8)
  {
    v9 = (void *)MEMORY[0x263F5FC40];
    v10 = [(ICQUIManageStorageHeaderSpecifierProvider *)self storageSummary];
    v11 = [v10 displayLabel];
    v12 = [v9 preferenceSpecifierNamed:v11 target:self set:0 get:sel__valueForStorageGraphSpecifier_ detail:0 cell:-1 edit:0];
    [(ICQUIManageStorageHeaderSpecifierProvider *)self setStorageSpecifier:v12];

    objc_super v13 = [(ICQUIManageStorageHeaderSpecifierProvider *)self storageSpecifier];
    [v13 setIdentifier:@"CLOUD_STORAGE_GRAPH"];

    uint64_t v14 = objc_opt_class();
    v15 = [(ICQUIManageStorageHeaderSpecifierProvider *)self storageSpecifier];
    [v15 setObject:v14 forKeyedSubscript:*MEMORY[0x263F5FFE0]];

    v16 = [(ICQUIManageStorageHeaderSpecifierProvider *)self storageSpecifier];
    uint64_t v17 = *MEMORY[0x263F600A8];
    [v16 setObject:MEMORY[0x263EFFA88] forKeyedSubscript:*MEMORY[0x263F600A8]];

    v18 = [(ICQUIManageStorageHeaderSpecifierProvider *)self storageSpecifier];
    [v18 setObject:self forKeyedSubscript:*MEMORY[0x263F602B0]];

    v19 = NSNumber;
    v20 = [(ICQUIManageStorageHeaderSpecifierProvider *)self storageSummary];
    v21 = [v19 numberWithInt:v20 != 0];
    v22 = [(ICQUIManageStorageHeaderSpecifierProvider *)self storageSpecifier];
    [v22 setObject:v21 forKeyedSubscript:v17];

    v23 = [(ICQUIManageStorageHeaderSpecifierProvider *)self storageSummary];
    v24 = [v23 displayLabel];
    v25 = [(ICQUIManageStorageHeaderSpecifierProvider *)self storageSpecifier];
    [v25 setObject:v24 forKeyedSubscript:*MEMORY[0x263F602D0]];
  }
  v26 = [(ICQUIManageStorageHeaderSpecifierProvider *)self storageSpecifier];
  [v3 addObject:v26];

  v27 = (void *)[v3 copy];
  return v27;
}

- (void)setSpecifiers:(id)a3
{
  id v7 = a3;
  if (v7)
  {
    id v5 = (void *)[(NSArray *)self->_specifiers copy];
    objc_storeStrong((id *)&self->_specifiers, a3);
    v6 = [(ICQUIManageStorageHeaderSpecifierProvider *)self delegate];
    [v6 reloadSpecifiersForProvider:self oldSpecifiers:v5 animated:1];
  }
  else
  {
    [(ICQUIManageStorageHeaderSpecifierProvider *)self _fetchStorageSummaryAndRefreshSpecifiers];
  }
}

- (id)_valueForStorageGraphSpecifier:(id)a3
{
  id v4 = a3;
  id v5 = [(ICQUIManageStorageHeaderSpecifierProvider *)self storageSummary];
  v6 = [v5 totalStorage];
  [v4 setObject:v6 forKeyedSubscript:*MEMORY[0x263F25C50]];

  id v7 = [(ICQUIManageStorageHeaderSpecifierProvider *)self storageSummary];
  id v8 = [v7 freeStorage];
  [v4 setObject:v8 forKeyedSubscript:*MEMORY[0x263F25C48]];

  v9 = [(ICQUIManageStorageHeaderSpecifierProvider *)self storageSummary];
  v10 = [v9 usedStorage];
  [v4 setObject:v10 forKeyedSubscript:*MEMORY[0x263F25C60]];

  v11 = [(ICQUIManageStorageHeaderSpecifierProvider *)self storageSummary];
  v12 = objc_msgSend(v11, "icqui_AAUIiCloudMediaUsageInfo");
  [v4 setObject:v12 forKeyedSubscript:*MEMORY[0x263F25C58]];

  return 0;
}

- (id)makeFamilyAndPlanManagementSpecifiers
{
  uint64_t v35 = *MEMORY[0x263EF8340];
  id v24 = objc_alloc_init(MEMORY[0x263EFF980]);
  long long v27 = 0u;
  long long v28 = 0u;
  long long v29 = 0u;
  long long v30 = 0u;
  id v3 = [(ICQUIManageStorageHeaderSpecifierProvider *)self storageSummary];
  id v4 = [v3 manageStoragePage];
  id v5 = [v4 specifiers];

  id obj = v5;
  uint64_t v6 = [v5 countByEnumeratingWithState:&v27 objects:v34 count:16];
  if (!v6) {
    goto LABEL_19;
  }
  uint64_t v7 = v6;
  uint64_t v8 = *(void *)v28;
  uint64_t v26 = *MEMORY[0x263F5FFE0];
  uint64_t v25 = *MEMORY[0x263F5FEF8];
  uint64_t v22 = *MEMORY[0x263F602C8];
  do
  {
    uint64_t v9 = 0;
    do
    {
      if (*(void *)v28 != v8) {
        objc_enumerationMutation(obj);
      }
      v10 = *(void **)(*((void *)&v27 + 1) + 8 * v9);
      v11 = [v10 actions];
      v12 = [v11 firstObject];

      objc_super v13 = [v10 title];
      if (v13 || ([v12 title], (objc_super v13 = objc_claimAutoreleasedReturnValue()) != 0))
      {
        int64_t v14 = [(ICQUIManageStorageHeaderSpecifierProvider *)self cellTypeForSpecifierInfo:v10];
        v15 = [MEMORY[0x263F5FC40] preferenceSpecifierNamed:v13 target:self set:0 get:0 detail:0 cell:v14 edit:0];
        [v15 setIdentifier:v13];
        [v15 setObject:objc_opt_class() forKeyedSubscript:v26];
        [v15 setObject:v12 forKeyedSubscript:@"ACTION_INFO"];
        [v15 setObject:MEMORY[0x263EFFA88] forKeyedSubscript:v25];
        if (v14 == 1)
        {
          v16 = [v10 subtitle];
          [v15 setObject:v16 forKeyedSubscript:v22];

          [v15 setControllerLoadAction:sel_launchActionFromSpecifier_];
          if (!v15) {
            goto LABEL_13;
          }
LABEL_12:
          [v24 addObject:v15];
        }
        else
        {
          [v15 setButtonAction:sel_launchActionFromSpecifier_];
          if (v15) {
            goto LABEL_12;
          }
        }
LABEL_13:

        goto LABEL_14;
      }
      objc_super v13 = _ICQGetLogSystem();
      if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138412290;
        v33 = v10;
        _os_log_error_impl(&dword_22C821000, v13, OS_LOG_TYPE_ERROR, "Specifier info is missing a title! %@", buf, 0xCu);
      }
LABEL_14:

      ++v9;
    }
    while (v7 != v9);
    uint64_t v17 = [obj countByEnumeratingWithState:&v27 objects:v34 count:16];
    uint64_t v7 = v17;
  }
  while (v17);
LABEL_19:

  if ([v24 count])
  {
    v18 = [MEMORY[0x263F5FC40] groupSpecifierWithID:@"MANAGE_STORAGE_HEADER_ACTIONS"];
    v31 = v18;
    v19 = [MEMORY[0x263EFF8C0] arrayWithObjects:&v31 count:1];
    v20 = [v19 arrayByAddingObjectsFromArray:v24];
  }
  else
  {
    v20 = (void *)MEMORY[0x263EFFA68];
  }

  return v20;
}

- (int64_t)cellTypeForSpecifierInfo:(id)a3
{
  id v3 = [a3 subtitle];

  if (v3) {
    return 1;
  }
  else {
    return 13;
  }
}

- (int64_t)cellTypeForAction:(int64_t)a3
{
  if ((unint64_t)(a3 - 112) > 9) {
    return 13;
  }
  else {
    return qword_22C9ADA30[a3 - 112];
  }
}

- (void)launchActionFromSpecifier:(id)a3
{
  id v4 = a3;
  id v5 = [(ICQUIManageStorageHeaderSpecifierProvider *)self delegate];
  [v5 provider:self loadActionFromSpecifier:v4];
}

- (void)refreshHeaderSpecifiersWithSummary:(id)a3
{
  [(ICQUIManageStorageHeaderSpecifierProvider *)self setStorageSummary:a3];
  id v6 = (id)[(NSArray *)self->_specifiers copy];
  specifiers = self->_specifiers;
  self->_specifiers = 0;

  id v5 = [(ICQUIManageStorageHeaderSpecifierProvider *)self delegate];
  [v5 reloadSpecifiersForProvider:self oldSpecifiers:v6 animated:1];
}

- (void)_fetchStorageSummaryAndRefreshSpecifiers
{
  uint64_t v7 = 0;
  uint64_t v8 = &v7;
  uint64_t v9 = 0x3032000000;
  v10 = __Block_byref_object_copy__5;
  v11 = __Block_byref_object_dispose__5;
  id v3 = objc_alloc(MEMORY[0x263F888D0]);
  id v4 = [(ICQUIManageStorageHeaderSpecifierProvider *)self account];
  id v12 = (id)[v3 initWithAccount:v4];

  id v5 = (void *)v8[5];
  v6[0] = MEMORY[0x263EF8330];
  v6[1] = 3221225472;
  v6[2] = __85__ICQUIManageStorageHeaderSpecifierProvider__fetchStorageSummaryAndRefreshSpecifiers__block_invoke;
  v6[3] = &unk_264921F28;
  v6[4] = self;
  v6[5] = &v7;
  [v5 fetchStorageSummaryWithCompletion:v6];
  _Block_object_dispose(&v7, 8);
}

void __85__ICQUIManageStorageHeaderSpecifierProvider__fetchStorageSummaryAndRefreshSpecifiers__block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __85__ICQUIManageStorageHeaderSpecifierProvider__fetchStorageSummaryAndRefreshSpecifiers__block_invoke_2;
  block[3] = &unk_264921F00;
  id v6 = v3;
  long long v7 = *(_OWORD *)(a1 + 32);
  id v4 = v3;
  dispatch_async(MEMORY[0x263EF83A0], block);
}

void __85__ICQUIManageStorageHeaderSpecifierProvider__fetchStorageSummaryAndRefreshSpecifiers__block_invoke_2(uint64_t a1)
{
  if (*(void *)(a1 + 32)) {
    objc_msgSend(*(id *)(a1 + 40), "refreshHeaderSpecifiersWithSummary:");
  }
  uint64_t v2 = *(void *)(*(void *)(a1 + 48) + 8);
  id v3 = *(void **)(v2 + 40);
  *(void *)(v2 + 40) = 0;
}

- (ICQUIManageStorageSpecifierProviderDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  return (ICQUIManageStorageSpecifierProviderDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (AIDAAccountManager)accountManager
{
  return self->_accountManager;
}

- (void)setAccountManager:(id)a3
{
}

- (ICQCloudStorageSummary)storageSummary
{
  return self->_storageSummary;
}

- (void)setStorageSummary:(id)a3
{
}

- (PSSpecifier)storageSpecifier
{
  return self->_storageSpecifier;
}

- (void)setStorageSpecifier:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_storageSpecifier, 0);
  objc_storeStrong((id *)&self->_storageSummary, 0);
  objc_storeStrong((id *)&self->_accountManager, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_specifiers, 0);
}

@end