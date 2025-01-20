@interface PPBundleIdAllowancePolicy
+ (id)defaultPolicy;
- (BOOL)bundleIdentifierIsAllowed:(id)a3 blocklist:(id)a4 allowlist:(id)a5;
- (BOOL)bundleIdentifierIsAllowedForNotifications:(id)a3;
- (BOOL)bundleIdentifierIsAllowedForSearchableItems:(id)a3;
- (PPBundleIdAllowancePolicy)initWithNotificationBlocklist:(id)a3 notificationAllowlist:(id)a4 searchableItemBlocklist:(id)a5 searchableItemAllowlist:(id)a6;
- (id)_readAssetData:(id)a3;
- (id)init_;
- (void)_loadAssetData;
- (void)_resetGuardedData;
- (void)_setGuardedDataWithNotificationBlocklist:(id)a3 notificationAllowlist:(id)a4 searchableItemBlocklist:(id)a5 searchableItemAllowlist:(id)a6;
- (void)dealloc;
@end

@implementation PPBundleIdAllowancePolicy

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_trialToken, 0);
  objc_storeStrong((id *)&self->_allowancePolicyLock, 0);
}

- (BOOL)bundleIdentifierIsAllowed:(id)a3 blocklist:(id)a4 allowlist:(id)a5
{
  id v7 = a3;
  id v8 = a4;
  id v9 = a5;
  if (![v8 count] && !objc_msgSend(v9, "count"))
  {
    char v12 = 1;
    goto LABEL_10;
  }
  if (![v8 count]) {
    goto LABEL_7;
  }
  uint64_t v10 = [v9 count];
  char v11 = [v8 containsObject:v7];
  if (!v10)
  {
    char v12 = v11 ^ 1;
    goto LABEL_10;
  }
  if (v11) {
    char v12 = 0;
  }
  else {
LABEL_7:
  }
    char v12 = [v9 containsObject:v7];
LABEL_10:

  return v12;
}

- (BOOL)bundleIdentifierIsAllowedForSearchableItems:(id)a3
{
  id v4 = a3;
  uint64_t v14 = 0;
  v15 = &v14;
  uint64_t v16 = 0x3032000000;
  v17 = __Block_byref_object_copy__927;
  v18 = __Block_byref_object_dispose__928;
  id v19 = 0;
  uint64_t v8 = 0;
  id v9 = &v8;
  uint64_t v10 = 0x3032000000;
  char v11 = __Block_byref_object_copy__927;
  char v12 = __Block_byref_object_dispose__928;
  id v13 = 0;
  allowancePolicyLock = self->_allowancePolicyLock;
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __73__PPBundleIdAllowancePolicy_bundleIdentifierIsAllowedForSearchableItems___block_invoke;
  v7[3] = &unk_1E65D46C8;
  v7[4] = &v14;
  v7[5] = &v8;
  [(_PASLock *)allowancePolicyLock runWithLockAcquired:v7];
  LOBYTE(self) = [(PPBundleIdAllowancePolicy *)self bundleIdentifierIsAllowed:v4 blocklist:v15[5] allowlist:v9[5]];
  _Block_object_dispose(&v8, 8);

  _Block_object_dispose(&v14, 8);
  return (char)self;
}

void __73__PPBundleIdAllowancePolicy_bundleIdentifierIsAllowedForSearchableItems___block_invoke(uint64_t a1, id *a2)
{
  objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 32) + 8) + 40), a2[3]);
  id v4 = a2;
  objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40), v4[4]);
}

- (BOOL)bundleIdentifierIsAllowedForNotifications:(id)a3
{
  id v4 = a3;
  uint64_t v14 = 0;
  v15 = &v14;
  uint64_t v16 = 0x3032000000;
  v17 = __Block_byref_object_copy__927;
  v18 = __Block_byref_object_dispose__928;
  id v19 = 0;
  uint64_t v8 = 0;
  id v9 = &v8;
  uint64_t v10 = 0x3032000000;
  char v11 = __Block_byref_object_copy__927;
  char v12 = __Block_byref_object_dispose__928;
  id v13 = 0;
  allowancePolicyLock = self->_allowancePolicyLock;
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __71__PPBundleIdAllowancePolicy_bundleIdentifierIsAllowedForNotifications___block_invoke;
  v7[3] = &unk_1E65D46C8;
  v7[4] = &v14;
  v7[5] = &v8;
  [(_PASLock *)allowancePolicyLock runWithLockAcquired:v7];
  LOBYTE(self) = [(PPBundleIdAllowancePolicy *)self bundleIdentifierIsAllowed:v4 blocklist:v15[5] allowlist:v9[5]];
  _Block_object_dispose(&v8, 8);

  _Block_object_dispose(&v14, 8);
  return (char)self;
}

void __71__PPBundleIdAllowancePolicy_bundleIdentifierIsAllowedForNotifications___block_invoke(uint64_t a1, id *a2)
{
  objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 32) + 8) + 40), a2[1]);
  id v4 = a2;
  objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40), v4[2]);
}

- (void)_resetGuardedData
{
}

void __46__PPBundleIdAllowancePolicy__resetGuardedData__block_invoke(uint64_t a1, void *a2)
{
  v2 = a2;
  uint64_t v3 = objc_opt_new();
  id v4 = (void *)v2[1];
  v2[1] = v3;

  uint64_t v5 = objc_opt_new();
  v6 = (void *)v2[2];
  v2[2] = v5;

  uint64_t v7 = objc_opt_new();
  uint64_t v8 = (void *)v2[3];
  v2[3] = v7;

  uint64_t v9 = objc_opt_new();
  id v10 = (id)v2[4];
  v2[4] = v9;
}

- (void)_setGuardedDataWithNotificationBlocklist:(id)a3 notificationAllowlist:(id)a4 searchableItemBlocklist:(id)a5 searchableItemAllowlist:(id)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  id v13 = a6;
  allowancePolicyLock = self->_allowancePolicyLock;
  v19[0] = MEMORY[0x1E4F143A8];
  v19[1] = 3221225472;
  v19[2] = __140__PPBundleIdAllowancePolicy__setGuardedDataWithNotificationBlocklist_notificationAllowlist_searchableItemBlocklist_searchableItemAllowlist___block_invoke;
  v19[3] = &unk_1E65D4680;
  id v20 = v10;
  id v21 = v11;
  id v22 = v12;
  id v23 = v13;
  id v15 = v13;
  id v16 = v12;
  id v17 = v11;
  id v18 = v10;
  [(_PASLock *)allowancePolicyLock runWithLockAcquired:v19];
}

void __140__PPBundleIdAllowancePolicy__setGuardedDataWithNotificationBlocklist_notificationAllowlist_searchableItemBlocklist_searchableItemAllowlist___block_invoke(id *a1, id *a2)
{
  objc_storeStrong(a2 + 1, a1[4]);
  id v4 = a2;
  objc_storeStrong(v4 + 2, a1[5]);
  objc_storeStrong(v4 + 3, a1[6]);
  objc_storeStrong(v4 + 4, a1[7]);
}

- (id)_readAssetData:(id)a3
{
  uint64_t v29 = *MEMORY[0x1E4F143B8];
  uint64_t v3 = +[PPTrialWrapper sharedInstance];
  id v4 = [v3 plistForFactorName:@"allowancePolicy.plist" namespaceName:@"PERSONALIZATION_PORTRAIT_GLOBAL"];

  if (!v4)
  {
    uint64_t v5 = pp_default_log_handle();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_FAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_fault_impl(&dword_1CA9A8000, v5, OS_LOG_TYPE_FAULT, "PPBundleIdAllowancePolicy: no allowance policy found.", buf, 2u);
    }
  }
  v6 = [v4 objectForKeyedSubscript:@"notificationBlocklist"];
  if (!v6 && os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_FAULT))
  {
    *(_DWORD *)buf = 138412290;
    v28 = @"notificationBlocklist";
    _os_log_fault_impl(&dword_1CA9A8000, MEMORY[0x1E4F14500], OS_LOG_TYPE_FAULT, "Param key not found: %@", buf, 0xCu);
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0 && os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_FAULT))
  {
    *(_DWORD *)buf = 138412290;
    v28 = @"notificationBlocklist";
    _os_log_fault_impl(&dword_1CA9A8000, MEMORY[0x1E4F14500], OS_LOG_TYPE_FAULT, "Wrong value type for param key: %@", buf, 0xCu);
  }
  uint64_t v7 = [v4 objectForKeyedSubscript:@"notificationAllowlist"];
  if (!v7 && os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_FAULT))
  {
    *(_DWORD *)buf = 138412290;
    v28 = @"notificationAllowlist";
    _os_log_fault_impl(&dword_1CA9A8000, MEMORY[0x1E4F14500], OS_LOG_TYPE_FAULT, "Param key not found: %@", buf, 0xCu);
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0 && os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_FAULT))
  {
    *(_DWORD *)buf = 138412290;
    v28 = @"notificationAllowlist";
    _os_log_fault_impl(&dword_1CA9A8000, MEMORY[0x1E4F14500], OS_LOG_TYPE_FAULT, "Wrong value type for param key: %@", buf, 0xCu);
  }
  uint64_t v8 = [v4 objectForKeyedSubscript:@"searchableItemBlocklist"];
  if (!v8 && os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_FAULT))
  {
    *(_DWORD *)buf = 138412290;
    v28 = @"searchableItemBlocklist";
    _os_log_fault_impl(&dword_1CA9A8000, MEMORY[0x1E4F14500], OS_LOG_TYPE_FAULT, "Param key not found: %@", buf, 0xCu);
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0 && os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_FAULT))
  {
    *(_DWORD *)buf = 138412290;
    v28 = @"searchableItemBlocklist";
    _os_log_fault_impl(&dword_1CA9A8000, MEMORY[0x1E4F14500], OS_LOG_TYPE_FAULT, "Wrong value type for param key: %@", buf, 0xCu);
  }
  uint64_t v9 = [v4 objectForKeyedSubscript:@"searchableItemAllowlist"];
  if (!v9 && os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_FAULT))
  {
    *(_DWORD *)buf = 138412290;
    v28 = @"searchableItemAllowlist";
    _os_log_fault_impl(&dword_1CA9A8000, MEMORY[0x1E4F14500], OS_LOG_TYPE_FAULT, "Param key not found: %@", buf, 0xCu);
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0 && os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_FAULT))
  {
    *(_DWORD *)buf = 138412290;
    v28 = @"searchableItemAllowlist";
    _os_log_fault_impl(&dword_1CA9A8000, MEMORY[0x1E4F14500], OS_LOG_TYPE_FAULT, "Wrong value type for param key: %@", buf, 0xCu);
  }
  v25[0] = @"notificationBlocklist";
  id v10 = objc_alloc(MEMORY[0x1E4F1CAD0]);
  id v11 = (void *)MEMORY[0x1E4F1CBF0];
  if (v6) {
    id v12 = v6;
  }
  else {
    id v12 = (void *)MEMORY[0x1E4F1CBF0];
  }
  id v13 = objc_msgSend(v10, "initWithArray:", v12, v25[0]);
  v26[0] = v13;
  v25[1] = @"notificationAllowlist";
  id v14 = objc_alloc(MEMORY[0x1E4F1CAD0]);
  if (v7) {
    id v15 = v7;
  }
  else {
    id v15 = v11;
  }
  id v16 = (void *)[v14 initWithArray:v15];
  v26[1] = v16;
  v25[2] = @"searchableItemBlocklist";
  id v17 = objc_alloc(MEMORY[0x1E4F1CAD0]);
  if (v8) {
    id v18 = v8;
  }
  else {
    id v18 = v11;
  }
  id v19 = (void *)[v17 initWithArray:v18];
  v26[2] = v19;
  v25[3] = @"searchableItemAllowlist";
  id v20 = objc_alloc(MEMORY[0x1E4F1CAD0]);
  if (v9) {
    id v21 = v9;
  }
  else {
    id v21 = v11;
  }
  id v22 = (void *)[v20 initWithArray:v21];
  v26[3] = v22;
  id v23 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v26 forKeys:v25 count:4];

  return v23;
}

- (void)_loadAssetData
{
  id v7 = [(PPBundleIdAllowancePolicy *)self _readAssetData:@"allowancePolicy.plist"];
  uint64_t v3 = [v7 objectForKeyedSubscript:@"notificationBlocklist"];
  id v4 = [v7 objectForKeyedSubscript:@"notificationAllowlist"];
  uint64_t v5 = [v7 objectForKeyedSubscript:@"searchableItemBlocklist"];
  v6 = [v7 objectForKeyedSubscript:@"searchableItemAllowlist"];
  [(PPBundleIdAllowancePolicy *)self _setGuardedDataWithNotificationBlocklist:v3 notificationAllowlist:v4 searchableItemBlocklist:v5 searchableItemAllowlist:v6];
}

- (PPBundleIdAllowancePolicy)initWithNotificationBlocklist:(id)a3 notificationAllowlist:(id)a4 searchableItemBlocklist:(id)a5 searchableItemAllowlist:(id)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  id v13 = a6;
  v20.receiver = self;
  v20.super_class = (Class)PPBundleIdAllowancePolicy;
  id v14 = [(PPBundleIdAllowancePolicy *)&v20 init];
  if (v14)
  {
    id v15 = objc_alloc(MEMORY[0x1E4F93B70]);
    id v16 = objc_opt_new();
    uint64_t v17 = [v15 initWithGuardedData:v16];
    allowancePolicyLock = v14->_allowancePolicyLock;
    v14->_allowancePolicyLock = (_PASLock *)v17;

    [(PPBundleIdAllowancePolicy *)v14 _setGuardedDataWithNotificationBlocklist:v10 notificationAllowlist:v11 searchableItemBlocklist:v12 searchableItemAllowlist:v13];
  }

  return v14;
}

- (void)dealloc
{
  uint64_t v3 = +[PPTrialWrapper sharedInstance];
  [v3 removeUpdateHandlerForToken:self->_trialToken];

  v4.receiver = self;
  v4.super_class = (Class)PPBundleIdAllowancePolicy;
  [(PPBundleIdAllowancePolicy *)&v4 dealloc];
}

- (id)init_
{
  v14.receiver = self;
  v14.super_class = (Class)PPBundleIdAllowancePolicy;
  v2 = [(PPBundleIdAllowancePolicy *)&v14 init];
  if (v2)
  {
    id v3 = objc_alloc(MEMORY[0x1E4F93B70]);
    objc_super v4 = objc_opt_new();
    uint64_t v5 = [v3 initWithGuardedData:v4];
    allowancePolicyLock = v2->_allowancePolicyLock;
    v2->_allowancePolicyLock = (_PASLock *)v5;

    [(PPBundleIdAllowancePolicy *)v2 _loadAssetData];
    id location = 0;
    objc_initWeak(&location, v2);
    id v7 = +[PPTrialWrapper sharedInstance];
    v11[0] = MEMORY[0x1E4F143A8];
    v11[1] = 3221225472;
    v11[2] = __34__PPBundleIdAllowancePolicy_init___block_invoke;
    v11[3] = &unk_1E65DC540;
    objc_copyWeak(&v12, &location);
    uint64_t v8 = [v7 addUpdateHandlerForNamespaceName:@"PERSONALIZATION_PORTRAIT_GLOBAL" block:v11];
    trialToken = v2->_trialToken;
    v2->_trialToken = (TRINotificationToken *)v8;

    objc_destroyWeak(&v12);
    objc_destroyWeak(&location);
  }
  return v2;
}

void __34__PPBundleIdAllowancePolicy_init___block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained _loadAssetData];
}

+ (id)defaultPolicy
{
  if (defaultPolicy__pasOnceToken2 != -1) {
    dispatch_once(&defaultPolicy__pasOnceToken2, &__block_literal_global_958);
  }
  v2 = (void *)defaultPolicy__pasExprOnceResult;
  return v2;
}

void __42__PPBundleIdAllowancePolicy_defaultPolicy__block_invoke()
{
  v0 = (void *)MEMORY[0x1CB79D060]();
  v1 = [[PPBundleIdAllowancePolicy alloc] init];
  v2 = (void *)defaultPolicy__pasExprOnceResult;
  defaultPolicy__pasExprOnceResult = (uint64_t)v1;
}

@end