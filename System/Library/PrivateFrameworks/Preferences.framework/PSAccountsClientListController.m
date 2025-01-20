@interface PSAccountsClientListController
- (BOOL)_isAccountModificationDisabledByRestrictions;
- (PSAccountsClientListController)init;
- (id)_visibleAccountTypeIDs;
- (id)requestedAccountDataclass;
- (id)specifierForID:(id)a3;
- (void)dealloc;
- (void)setSpecifiers:(id)a3;
- (void)updateAccountSpecifier;
- (void)viewWillAppear:(BOOL)a3;
@end

@implementation PSAccountsClientListController

- (PSAccountsClientListController)init
{
  v14.receiver = self;
  v14.super_class = (Class)PSAccountsClientListController;
  v2 = [(PSListController *)&v14 init];
  if (v2)
  {
    objc_initWeak(&location, v2);
    v3 = [MEMORY[0x1E4F28EB8] defaultCenter];
    v4 = [MEMORY[0x1E4F28F08] mainQueue];
    uint64_t v5 = *MEMORY[0x1E4F17728];
    v10[0] = MEMORY[0x1E4F143A8];
    v10[1] = 3221225472;
    v10[2] = __38__PSAccountsClientListController_init__block_invoke;
    v10[3] = &unk_1E5C5DF70;
    objc_copyWeak(&v12, &location);
    v6 = v2;
    v11 = v6;
    uint64_t v7 = [v3 addObserverForName:v5 object:0 queue:v4 usingBlock:v10];
    id acObserver = v6->_acObserver;
    v6->_id acObserver = (id)v7;

    objc_destroyWeak(&v12);
    objc_destroyWeak(&location);
  }
  return v2;
}

void __38__PSAccountsClientListController_init__block_invoke(uint64_t a1)
{
  v2 = (id *)(a1 + 40);
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  [WeakRetained updateAccountSpecifier];

  id v4 = objc_loadWeakRetained(v2);
  [v4 reloadSpecifier:*(void *)(*(void *)(a1 + 32) + 1392)];
}

- (void)dealloc
{
  v3 = [MEMORY[0x1E4F28EB8] defaultCenter];
  [v3 removeObserver:self->_acObserver];

  v4.receiver = self;
  v4.super_class = (Class)PSAccountsClientListController;
  [(PSListController *)&v4 dealloc];
}

- (id)_visibleAccountTypeIDs
{
  v11[14] = *MEMORY[0x1E4F143B8];
  uint64_t v2 = *MEMORY[0x1E4F17770];
  v11[0] = *MEMORY[0x1E4F17858];
  v11[1] = v2;
  uint64_t v3 = *MEMORY[0x1E4F177E8];
  v11[2] = *MEMORY[0x1E4F17778];
  v11[3] = v3;
  uint64_t v4 = *MEMORY[0x1E4F17798];
  v11[4] = *MEMORY[0x1E4F17830];
  v11[5] = v4;
  uint64_t v5 = *MEMORY[0x1E4F17818];
  v11[6] = *MEMORY[0x1E4F177D0];
  v11[7] = v5;
  uint64_t v6 = *MEMORY[0x1E4F17878];
  v11[8] = *MEMORY[0x1E4F177C0];
  v11[9] = v6;
  uint64_t v7 = *MEMORY[0x1E4F177F0];
  v11[10] = *MEMORY[0x1E4F177F8];
  v11[11] = v7;
  uint64_t v8 = *MEMORY[0x1E4F17820];
  v11[12] = *MEMORY[0x1E4F17750];
  v11[13] = v8;
  v9 = [MEMORY[0x1E4F1C978] arrayWithObjects:v11 count:14];
  return v9;
}

- (void)viewWillAppear:(BOOL)a3
{
  BOOL v3 = a3;
  v5.receiver = self;
  v5.super_class = (Class)PSAccountsClientListController;
  -[PSListController viewWillAppear:](&v5, sel_viewWillAppear_);
  [(PSAccountsClientListController *)self updateAccountSpecifier];
  [(PSListController *)self reloadSpecifier:self->_accountSpecifier animated:v3];
}

- (id)requestedAccountDataclass
{
  return 0;
}

- (void)updateAccountSpecifier
{
}

void __56__PSAccountsClientListController_updateAccountSpecifier__block_invoke(uint64_t a1, void *a2, void *a3)
{
  uint64_t v48 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  id v40 = a3;
  BOOL v6 = os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_DEBUG);
  if (v6) {
    __56__PSAccountsClientListController_updateAccountSpecifier__block_invoke_cold_2(v6, v7, v8, v9, v10, v11, v12, v13);
  }
  long long v45 = 0u;
  long long v46 = 0u;
  long long v43 = 0u;
  long long v44 = 0u;
  id v14 = v5;
  uint64_t v15 = [v14 countByEnumeratingWithState:&v43 objects:v47 count:16];
  if (v15)
  {
    uint64_t v16 = v15;
    uint64_t v17 = *(void *)v44;
    do
    {
      uint64_t v18 = 0;
      do
      {
        if (*(void *)v44 != v17) {
          objc_enumerationMutation(v14);
        }
        v19 = *(void **)(*((void *)&v43 + 1) + 8 * v18);
        uint64_t v20 = *(void *)(*(void *)(a1 + 48) + 8);
        if (*(unsigned char *)(v20 + 24) || !*(void *)(a1 + 32))
        {
          *(unsigned char *)(v20 + 24) = 1;
        }
        else
        {
          v21 = objc_msgSend(*(id *)(*((void *)&v43 + 1) + 8 * v18), "provisionedDataclasses", v40);
          *(unsigned char *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) = [v21 containsObject:*(void *)(a1 + 32)];
        }
        if (!*(void *)(a1 + 32)) {
          goto LABEL_26;
        }
        v22 = [v19 enabledDataclasses];
        v41[0] = MEMORY[0x1E4F143A8];
        v41[1] = 3221225472;
        v41[2] = __56__PSAccountsClientListController_updateAccountSpecifier__block_invoke_31;
        v41[3] = &unk_1E5C5DF98;
        id v42 = *(id *)(a1 + 32);
        v23 = [v22 objectsPassingTest:v41];

        uint64_t v24 = [v23 count];
        if (v24)
        {
LABEL_26:
          v25 = objc_msgSend(v19, "accountPropertyForKey:", @"ACUIAccountSimpleDisplayName", v40);
          if (v25
            || ([v19 accountDescription], (v25 = objc_claimAutoreleasedReturnValue()) != 0))
          {
            if ([*(id *)(*(void *)(*(void *)(a1 + 56) + 8) + 40) length])
            {
              uint64_t v26 = [*(id *)(*(void *)(*(void *)(a1 + 56) + 8) + 40) stringByAppendingString:@", "];
              uint64_t v27 = *(void *)(*(void *)(a1 + 56) + 8);
              v28 = *(void **)(v27 + 40);
              *(void *)(v27 + 40) = v26;
            }
            uint64_t v29 = [*(id *)(*(void *)(*(void *)(a1 + 56) + 8) + 40) stringByAppendingString:v25];
            uint64_t v30 = *(void *)(*(void *)(a1 + 56) + 8);
            v31 = *(void **)(v30 + 40);
            *(void *)(v30 + 40) = v29;
          }
        }
        ++v18;
      }
      while (v16 != v18);
      uint64_t v16 = [v14 countByEnumeratingWithState:&v43 objects:v47 count:16];
    }
    while (v16);
  }

  BOOL v32 = os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_DEBUG);
  if (v32) {
    __56__PSAccountsClientListController_updateAccountSpecifier__block_invoke_cold_1(v32, v33, v34, v35, v36, v37, v38, v39);
  }
  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 40));
}

uint64_t __56__PSAccountsClientListController_updateAccountSpecifier__block_invoke_31(uint64_t a1, void *a2, unsigned char *a3)
{
  id v5 = a2;
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    uint64_t v6 = [v5 hasPrefix:*(void *)(a1 + 32)];
  }
  else {
    uint64_t v6 = 0;
  }
  *a3 = v6;

  return v6;
}

uint64_t __56__PSAccountsClientListController_updateAccountSpecifier__block_invoke_53(uint64_t result)
{
  return result;
}

uint64_t __56__PSAccountsClientListController_updateAccountSpecifier__block_invoke_55(uint64_t a1)
{
  return [*(id *)(a1 + 32) updateAccountSpecifier];
}

- (void)setSpecifiers:(id)a3
{
  id v4 = a3;
  [(PSAccountsClientListController *)self updateAccountSpecifier];
  if (self->_accountSpecifier)
  {
    id v5 = (void *)MEMORY[0x1E4F1CA48];
    uint64_t v6 = +[PSSpecifier groupSpecifierWithName:0];
    uint64_t v7 = objc_msgSend(v5, "arrayWithObjects:", v6, self->_accountSpecifier, 0);

    uint64_t v8 = [v4 firstObject];
    if ([v8 cellType])
    {
      uint64_t v9 = +[PSSpecifier groupSpecifierWithName:0];
      [v7 addObject:v9];
    }
    [v7 addObjectsFromArray:v4];
  }
  else
  {
    uint64_t v7 = (void *)[v4 mutableCopy];
  }
  v10.receiver = self;
  v10.super_class = (Class)PSAccountsClientListController;
  [(PSListController *)&v10 setSpecifiers:v7];
}

- (id)specifierForID:(id)a3
{
  id v4 = a3;
  if (!self->_accountSpecifier
    || ![(NSArray *)self->super._specifiers count]
    || ![(NSArray *)self->super._specifiers containsObject:self->_accountSpecifier])
  {
    [(PSAccountsClientListController *)self setSpecifiers:MEMORY[0x1E4F1CBF0]];
  }
  v7.receiver = self;
  v7.super_class = (Class)PSAccountsClientListController;
  id v5 = [(PSListController *)&v7 specifierForID:v4];

  return v5;
}

- (BOOL)_isAccountModificationDisabledByRestrictions
{
  uint64_t v2 = [MEMORY[0x1E4F74230] sharedConnection];
  BOOL v3 = [v2 effectiveBoolValueForSetting:*MEMORY[0x1E4F73ED0]] == 2;

  return v3;
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_acObserver, 0);
  objc_storeStrong((id *)&self->_accountSpecifier, 0);
}

void __56__PSAccountsClientListController_updateAccountSpecifier__block_invoke_cold_1(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void __56__PSAccountsClientListController_updateAccountSpecifier__block_invoke_cold_2(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

@end