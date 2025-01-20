@interface ICQUIiCloudPlusSpecifierProvider
- (AAUISpecifierProviderDelegate)delegate;
- (ICQUIiCloudPlusSpecifierProvider)initWithAccountManager:(id)a3;
- (NSArray)specifiers;
- (id)_buildiCloudPlusFeatureSpecifiersFrom:(id)a3;
- (id)_buildiCloudPlusGroupTitleSpecifierFrom:(id)a3;
- (id)_buildiCloudPlusSpecifiers;
- (id)account;
- (void)_buildiCloudPlusSpecifiers;
- (void)setDelegate:(id)a3;
- (void)setSpecifiers:(id)a3;
@end

@implementation ICQUIiCloudPlusSpecifierProvider

- (ICQUIiCloudPlusSpecifierProvider)initWithAccountManager:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)ICQUIiCloudPlusSpecifierProvider;
  v6 = [(ICQUIiCloudPlusSpecifierProvider *)&v9 init];
  v7 = v6;
  if (v6) {
    objc_storeStrong((id *)&v6->_accountManager, a3);
  }

  return v7;
}

- (id)account
{
  v2 = [(AIDAAccountManager *)self->_accountManager accounts];
  v3 = [v2 objectForKeyedSubscript:*MEMORY[0x263F26D28]];

  return v3;
}

- (NSArray)specifiers
{
  specifiers = self->_specifiers;
  if (!specifiers)
  {
    v4 = [(ICQUIiCloudPlusSpecifierProvider *)self _buildiCloudPlusSpecifiers];
    id v5 = self->_specifiers;
    self->_specifiers = v4;

    specifiers = self->_specifiers;
  }
  return specifiers;
}

- (id)_buildiCloudPlusSpecifiers
{
  id v3 = objc_alloc(MEMORY[0x263F888D0]);
  v4 = [(ICQUIiCloudPlusSpecifierProvider *)self account];
  id v5 = (void *)[v3 initWithAccount:v4];

  v6 = [v5 cachedStorageSummary];
  storageSummary = self->_storageSummary;
  self->_storageSummary = v6;

  v8 = [(ICQCloudStorageSummary *)self->_storageSummary subscriptionInfo];
  if ([v8 isiCloudPlusSubscriber])
  {
    objc_super v9 = _ICQGetLogSystem();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR)) {
      -[ICQUIiCloudPlusSpecifierProvider _buildiCloudPlusSpecifiers](v9);
    }
    id v10 = (id)MEMORY[0x263EFFA68];
  }
  else
  {
    id v11 = objc_alloc_init(MEMORY[0x263EFF980]);
    v12 = [v8 specifiersInfo];
    uint64_t v14 = MEMORY[0x263EF8330];
    uint64_t v15 = 3221225472;
    v16 = __62__ICQUIiCloudPlusSpecifierProvider__buildiCloudPlusSpecifiers__block_invoke;
    v17 = &unk_264921ED8;
    v18 = self;
    id v19 = v11;
    objc_super v9 = v11;
    [v12 enumerateObjectsUsingBlock:&v14];

    id v10 = [v9 copy];
  }

  return v10;
}

void __62__ICQUIiCloudPlusSpecifierProvider__buildiCloudPlusSpecifiers__block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  v4 = [v3 type];
  int v5 = [v4 isEqualToString:@"ICLOUD_PLUS_CELL"];

  if (v5)
  {
    id v6 = v3;
    v7 = [*(id *)(a1 + 32) _buildiCloudPlusGroupTitleSpecifierFrom:v6];
    [*(id *)(a1 + 40) addObject:v7];
    v8 = [v6 featureList];
    v11[0] = MEMORY[0x263EF8330];
    v11[1] = 3221225472;
    v11[2] = __62__ICQUIiCloudPlusSpecifierProvider__buildiCloudPlusSpecifiers__block_invoke_2;
    v11[3] = &unk_264921EB0;
    objc_super v9 = *(void **)(a1 + 40);
    v11[4] = *(void *)(a1 + 32);
    id v12 = v6;
    id v13 = v9;
    id v10 = v6;
    [v8 enumerateObjectsUsingBlock:v11];
  }
}

void __62__ICQUIiCloudPlusSpecifierProvider__buildiCloudPlusSpecifiers__block_invoke_2(id *a1, uint64_t a2, uint64_t a3)
{
  id v8 = [a1[4] _buildiCloudPlusFeatureSpecifiersFrom:a2];
  int v5 = [a1[5] featureList];
  uint64_t v6 = [v5 count] - 1;

  if (v6 == a3)
  {
    [v8 setProperty:MEMORY[0x263EFFA88] forKey:@"LAST_ITEM_KEY"];
    v7 = &unk_26E01EE58;
  }
  else
  {
    v7 = &unk_26E01EE68;
  }
  [v8 setProperty:v7 forKey:*MEMORY[0x263F602A8]];
  [a1[6] addObject:v8];
}

- (id)_buildiCloudPlusGroupTitleSpecifierFrom:(id)a3
{
  v4 = (void *)MEMORY[0x263F5FC40];
  id v5 = a3;
  uint64_t v6 = [v4 preferenceSpecifierNamed:@"ICLOUD_PLUS_FEATURE_HEADER_CELL" target:self set:0 get:0 detail:0 cell:4 edit:0];
  [v6 setProperty:objc_opt_class() forKey:*MEMORY[0x263F5FFE0]];
  [v6 setProperty:&unk_26E01ECC0 forKey:*MEMORY[0x263F5FEF0]];
  v7 = [v5 title];

  [v6 setProperty:v7 forKey:*MEMORY[0x263F602D0]];
  return v6;
}

- (id)_buildiCloudPlusFeatureSpecifiersFrom:(id)a3
{
  v4 = (void *)MEMORY[0x263F5FC40];
  id v5 = a3;
  uint64_t v6 = [v5 label];
  v7 = [v4 preferenceSpecifierNamed:v6 target:self set:0 get:0 detail:0 cell:-1 edit:0];

  [v7 setProperty:objc_opt_class() forKey:*MEMORY[0x263F5FFE0]];
  id v8 = [v5 label];
  [v7 setProperty:v8 forKey:*MEMORY[0x263F602D0]];

  [v7 setProperty:&unk_26E01ECC0 forKey:*MEMORY[0x263F5FEF0]];
  [v7 setTarget:v5];
  [v7 setProperty:MEMORY[0x263EFFA88] forKey:*MEMORY[0x263F601A8]];
  objc_super v9 = [v5 iconURL];

  id v10 = +[_ICQUIHelperFunctions scaledImageURL:v9];
  [v7 setProperty:v10 forKey:*MEMORY[0x263F601B0]];

  return v7;
}

- (AAUISpecifierProviderDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  return (AAUISpecifierProviderDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (void)setSpecifiers:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_specifiers, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_storageSummary, 0);
  objc_storeStrong((id *)&self->_accountManager, 0);
}

- (void)_buildiCloudPlusSpecifiers
{
  *(_WORD *)v1 = 0;
  _os_log_error_impl(&dword_22C821000, log, OS_LOG_TYPE_ERROR, "Upgrade to iCloud+ specifiers were requested for iCloud+ user. Returning no specifiers.", v1, 2u);
}

@end