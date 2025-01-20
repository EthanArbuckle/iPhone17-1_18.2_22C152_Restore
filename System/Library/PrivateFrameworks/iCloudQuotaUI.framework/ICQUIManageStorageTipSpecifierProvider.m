@interface ICQUIManageStorageTipSpecifierProvider
- (ICQCloudStorageSummary)storageSummary;
- (ICQUIManageStorageTipSpecifierProvider)initWithAccountManager:(id)a3 presenter:(id)a4 summary:(id)a5;
- (NSArray)specifiers;
- (id)account;
- (id)manageStorageSpecifiersForSummary:(id)a3;
- (void)_fetchStorageSummaryAndRefreshSpecifiers;
- (void)_refreshTipsWithSummary:(id)a3;
- (void)setSpecifiers:(id)a3;
- (void)setStorageSummary:(id)a3;
@end

@implementation ICQUIManageStorageTipSpecifierProvider

- (ICQUIManageStorageTipSpecifierProvider)initWithAccountManager:(id)a3 presenter:(id)a4 summary:(id)a5
{
  id v8 = a5;
  uint64_t v9 = *MEMORY[0x263F88868];
  v14.receiver = self;
  v14.super_class = (Class)ICQUIManageStorageTipSpecifierProvider;
  v10 = [(ICQUITipSpecifierProvider *)&v14 initWithAccountManager:a3 presenter:a4 sectionAnchorIdentifier:v9 showUpwardPointingTips:0];
  v11 = v10;
  if (v10)
  {
    objc_storeWeak((id *)&v10->_storageSummary, v8);
    v12 = [MEMORY[0x263F08A00] defaultCenter];
    [v12 addObserver:v11 selector:sel__fetchStorageSummaryAndRefreshSpecifiers name:@"QuotaDidChange" object:0];
  }
  return v11;
}

- (id)account
{
  v2 = [(ICQUIManageStorageTipSpecifierProvider *)self valueForKey:@"_accountManager"];
  v3 = [v2 accounts];
  v4 = [v3 objectForKeyedSubscript:*MEMORY[0x263F26D28]];

  return v4;
}

- (NSArray)specifiers
{
  specifiers = self->_specifiers;
  if (!specifiers)
  {
    v4 = [(ICQUIManageStorageTipSpecifierProvider *)self storageSummary];
    v5 = [(ICQUIManageStorageTipSpecifierProvider *)self manageStorageSpecifiersForSummary:v4];
    v6 = self->_specifiers;
    self->_specifiers = v5;

    specifiers = self->_specifiers;
  }
  v7 = specifiers;
  return v7;
}

- (id)manageStorageSpecifiersForSummary:(id)a3
{
  id v4 = a3;
  v5 = [v4 manageStoragePage];
  v6 = [v5 tips];
  uint64_t v7 = [v6 count];

  if (v7)
  {
    id v8 = [ICQUIManageStorageTipViewModel alloc];
    uint64_t v9 = [v4 manageStoragePage];
    v10 = [v9 tips];
    v11 = [v10 firstObject];
    v12 = [(ICQUIManageStorageTipViewModel *)v8 initWithTipInfo:v11];
    [(ICQUITipSpecifierProvider *)self setViewModel:v12];

    v13 = [(ICQUITipSpecifierProvider *)self _tipSpecifiers];
    objc_super v14 = (void *)[v13 copy];
  }
  else
  {
    objc_super v14 = 0;
  }

  return v14;
}

- (void)setSpecifiers:(id)a3
{
  id v7 = a3;
  if (v7)
  {
    v5 = (void *)[(NSArray *)self->_specifiers copy];
    objc_storeStrong((id *)&self->_specifiers, a3);
    v6 = [(ICQUITipSpecifierProvider *)self delegate];
    [v6 reloadSpecifiersForProvider:self oldSpecifiers:v5 animated:1];
  }
  else
  {
    [(ICQUIManageStorageTipSpecifierProvider *)self _fetchStorageSummaryAndRefreshSpecifiers];
  }
}

- (void)_refreshTipsWithSummary:(id)a3
{
  [(ICQUIManageStorageTipSpecifierProvider *)self setStorageSummary:a3];
  id v6 = (id)[(NSArray *)self->_specifiers copy];
  specifiers = self->_specifiers;
  self->_specifiers = 0;

  v5 = [(ICQUITipSpecifierProvider *)self delegate];
  [v5 reloadSpecifiersForProvider:self oldSpecifiers:v6 animated:1];
}

- (void)_fetchStorageSummaryAndRefreshSpecifiers
{
  uint64_t v7 = 0;
  id v8 = &v7;
  uint64_t v9 = 0x3032000000;
  v10 = __Block_byref_object_copy__0;
  v11 = __Block_byref_object_dispose__0;
  id v3 = objc_alloc(MEMORY[0x263F888D0]);
  id v4 = [(ICQUIManageStorageTipSpecifierProvider *)self account];
  id v12 = (id)[v3 initWithAccount:v4];

  v5 = (void *)v8[5];
  v6[0] = MEMORY[0x263EF8330];
  v6[1] = 3221225472;
  v6[2] = __82__ICQUIManageStorageTipSpecifierProvider__fetchStorageSummaryAndRefreshSpecifiers__block_invoke;
  v6[3] = &unk_264921F28;
  v6[4] = self;
  v6[5] = &v7;
  [v5 fetchStorageSummaryWithCompletion:v6];
  _Block_object_dispose(&v7, 8);
}

void __82__ICQUIManageStorageTipSpecifierProvider__fetchStorageSummaryAndRefreshSpecifiers__block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __82__ICQUIManageStorageTipSpecifierProvider__fetchStorageSummaryAndRefreshSpecifiers__block_invoke_2;
  block[3] = &unk_264921F00;
  id v6 = v3;
  long long v7 = *(_OWORD *)(a1 + 32);
  id v4 = v3;
  dispatch_async(MEMORY[0x263EF83A0], block);
}

void __82__ICQUIManageStorageTipSpecifierProvider__fetchStorageSummaryAndRefreshSpecifiers__block_invoke_2(uint64_t a1)
{
  if (*(void *)(a1 + 32)) {
    objc_msgSend(*(id *)(a1 + 40), "_refreshTipsWithSummary:");
  }
  uint64_t v2 = *(void *)(*(void *)(a1 + 48) + 8);
  id v3 = *(void **)(v2 + 40);
  *(void *)(v2 + 40) = 0;
}

- (ICQCloudStorageSummary)storageSummary
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_storageSummary);
  return (ICQCloudStorageSummary *)WeakRetained;
}

- (void)setStorageSummary:(id)a3
{
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_storageSummary);
  objc_storeStrong((id *)&self->_specifiers, 0);
}

@end