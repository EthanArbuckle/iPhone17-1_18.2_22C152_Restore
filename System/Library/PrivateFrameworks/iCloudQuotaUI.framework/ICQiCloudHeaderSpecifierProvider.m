@interface ICQiCloudHeaderSpecifierProvider
- (AAUISpecifierProviderDelegate)delegate;
- (BOOL)handleURL:(id)a3;
- (ICQiCloudHeaderSpecifierProvider)initWithAccountManager:(id)a3;
- (ICQiCloudHeaderSpecifierProvider)initWithAccountManager:(id)a3 navigationController:(id)a4;
- (ICQiCloudHeaderSpecifierProvider)initWithAccountManager:(id)a3 presenter:(id)a4;
- (NSArray)specifiers;
- (id)account;
- (void)_handleSkippedCFUWithResourceDictionary:(id)a3;
- (void)_launchServerUIFlowWithOffer:(id)a3;
- (void)setDelegate:(id)a3;
- (void)setSpecifiers:(id)a3;
@end

@implementation ICQiCloudHeaderSpecifierProvider

- (ICQiCloudHeaderSpecifierProvider)initWithAccountManager:(id)a3
{
  return [(ICQiCloudHeaderSpecifierProvider *)self initWithAccountManager:a3 presenter:0];
}

- (ICQiCloudHeaderSpecifierProvider)initWithAccountManager:(id)a3 navigationController:(id)a4
{
  return [(ICQiCloudHeaderSpecifierProvider *)self initWithAccountManager:a3 presenter:0];
}

- (ICQiCloudHeaderSpecifierProvider)initWithAccountManager:(id)a3 presenter:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v13.receiver = self;
  v13.super_class = (Class)ICQiCloudHeaderSpecifierProvider;
  v9 = [(ICQiCloudHeaderSpecifierProvider *)&v13 init];
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_accountManager, a3);
    objc_storeWeak((id *)&v10->_listController, v8);
    v11 = [(ICQiCloudHeaderSpecifierProvider *)v10 account];
    +[ICQJetAnalytics preloadWithAccount:v11];
  }
  return v10;
}

- (id)account
{
  v2 = [(AIDAAccountManager *)self->_accountManager accounts];
  v3 = [v2 objectForKeyedSubscript:*MEMORY[0x263F26D28]];

  return v3;
}

- (void)setSpecifiers:(id)a3
{
  v4 = (NSArray *)a3;
  [(AAUISpecifierProvider *)self->_storageViolationTipSpecifierProvider setSpecifiers:0];
  specifiers = self->_specifiers;
  self->_specifiers = v4;
}

- (void)setDelegate:(id)a3
{
  p_delegate = &self->_delegate;
  objc_storeWeak((id *)&self->_delegate, a3);
  v5 = [ICQCloudStorageSpecifierProvider alloc];
  accountManager = self->_accountManager;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_listController);
  id v8 = [(ICQCloudStorageSpecifierProvider *)v5 initWithAccountManager:accountManager presenter:WeakRetained];
  storageGroupSpecifierProvider = self->_storageGroupSpecifierProvider;
  self->_storageGroupSpecifierProvider = v8;

  id v10 = objc_loadWeakRetained((id *)p_delegate);
  [(ICQCloudStorageSpecifierProvider *)self->_storageGroupSpecifierProvider setDelegate:v10];

  v11 = [ICQUITipSpecifierProvider alloc];
  v12 = self->_accountManager;
  id v13 = objc_loadWeakRetained((id *)&self->_listController);
  v14 = [(ICQUITipSpecifierProvider *)v11 initWithAccountManager:v12 presenter:v13 sectionAnchorIdentifier:*MEMORY[0x263F88868] showUpwardPointingTips:1];
  storageViolationTipSpecifierProvider = self->_storageViolationTipSpecifierProvider;
  self->_storageViolationTipSpecifierProvider = v14;

  id v16 = objc_loadWeakRetained((id *)p_delegate);
  [(AAUISpecifierProvider *)self->_storageViolationTipSpecifierProvider setDelegate:v16];

  v17 = [ICQUITipSpecifierProvider alloc];
  v18 = self->_accountManager;
  id v19 = objc_loadWeakRetained((id *)&self->_listController);
  v20 = [(ICQUITipSpecifierProvider *)v17 initWithAccountManager:v18 presenter:v19 sectionAnchorIdentifier:*MEMORY[0x263F888A0] showUpwardPointingTips:0];
  recommendationsTipSpecifierProvider = self->_recommendationsTipSpecifierProvider;
  self->_recommendationsTipSpecifierProvider = v20;

  id v22 = objc_loadWeakRetained((id *)p_delegate);
  [(AAUISpecifierProvider *)self->_recommendationsTipSpecifierProvider setDelegate:v22];
}

- (NSArray)specifiers
{
  id v3 = objc_alloc_init(MEMORY[0x263EFF980]);
  v4 = [(NSArray *)self->_storageSpecifiers firstObject];

  if (!v4)
  {
    v5 = [(ICQCloudStorageSpecifierProvider *)self->_storageGroupSpecifierProvider specifiers];
    storageSpecifiers = self->_storageSpecifiers;
    self->_storageSpecifiers = v5;
  }
  [v3 addObjectsFromArray:self->_storageSpecifiers];
  id v7 = [(AAUISpecifierProvider *)self->_storageViolationTipSpecifierProvider specifiers];
  uint64_t v8 = [v7 count];

  if (v8)
  {
    v9 = [(AAUISpecifierProvider *)self->_storageViolationTipSpecifierProvider specifiers];
    [v3 addObjectsFromArray:v9];
  }
  id v10 = [(AAUISpecifierProvider *)self->_recommendationsTipSpecifierProvider specifiers];
  uint64_t v11 = [v10 count];

  if (v11)
  {
    v12 = [(AAUISpecifierProvider *)self->_recommendationsTipSpecifierProvider specifiers];
    [v3 addObjectsFromArray:v12];
  }
  id v13 = (void *)[v3 copy];

  return (NSArray *)v13;
}

- (BOOL)handleURL:(id)a3
{
  uint64_t v14 = *MEMORY[0x263EF8340];
  id v4 = a3;
  v5 = [v4 objectForKeyedSubscript:@"path"];
  if ((objc_opt_respondsToSelector() & 1) != 0
    && [(ICQCloudStorageSpecifierProvider *)self->_storageGroupSpecifierProvider handleURL:v4])
  {
    v6 = _ICQGetLogSystem();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      id v13 = (const char *)v4;
      _os_log_impl(&dword_22C821000, v6, OS_LOG_TYPE_DEFAULT, "ICQiCloudHeaderSpecifierProvider Storage Specifier handled: %@", buf, 0xCu);
    }
  }
  else if (objc_msgSend(v5, "icqui_isReviewLargeFilesPath"))
  {
    id v7 = _ICQGetLogSystem();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315138;
      id v13 = "-[ICQiCloudHeaderSpecifierProvider handleURL:]";
      _os_log_impl(&dword_22C821000, v7, OS_LOG_TYPE_DEFAULT, "%s: Received review large files url", buf, 0xCu);
    }

    block[0] = MEMORY[0x263EF8330];
    block[1] = 3221225472;
    block[2] = __46__ICQiCloudHeaderSpecifierProvider_handleURL___block_invoke;
    block[3] = &unk_264921C80;
    block[4] = self;
    dispatch_async(MEMORY[0x263EF83A0], block);
  }
  else
  {
    if (!objc_msgSend(v5, "icqui_isCFUSkipPath"))
    {
      BOOL v9 = 0;
      goto LABEL_15;
    }
    uint64_t v8 = _ICQGetLogSystem();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315138;
      id v13 = "-[ICQiCloudHeaderSpecifierProvider handleURL:]";
      _os_log_impl(&dword_22C821000, v8, OS_LOG_TYPE_DEFAULT, "%s: Received CFU skip url from lockscreen notification", buf, 0xCu);
    }

    [(ICQiCloudHeaderSpecifierProvider *)self _handleSkippedCFUWithResourceDictionary:v4];
  }
  BOOL v9 = 1;
LABEL_15:

  return v9;
}

void __46__ICQiCloudHeaderSpecifierProvider_handleURL___block_invoke(uint64_t a1)
{
  id v3 = objc_alloc_init(ICQUIReviewLargeFilesFlowController);
  id WeakRetained = objc_loadWeakRetained((id *)(*(void *)(a1 + 32) + 16));
  [WeakRetained presentPreferredSizeWithViewController:v3 animated:1 completion:&__block_literal_global_23];
}

- (void)_handleSkippedCFUWithResourceDictionary:(id)a3
{
  id v4 = a3;
  v5 = [v4 objectForKeyedSubscript:*MEMORY[0x263F88800]];
  int v6 = [v5 isEqualToString:*MEMORY[0x263F88990]];
  int v7 = [v5 isEqualToString:*MEMORY[0x263F88988]];
  uint64_t v8 = [MEMORY[0x263F88928] sharedOfferManager];
  BOOL v9 = v8;
  if (v6)
  {
    v14[0] = MEMORY[0x263EF8330];
    v14[1] = 3221225472;
    v14[2] = __76__ICQiCloudHeaderSpecifierProvider__handleSkippedCFUWithResourceDictionary___block_invoke;
    v14[3] = &unk_264923E38;
    v14[4] = self;
    [v8 getPremiumOfferWithCompletion:v14];
  }
  else
  {
    if (!v7)
    {
      v10[0] = MEMORY[0x263EF8330];
      v10[1] = 3221225472;
      v10[2] = __76__ICQiCloudHeaderSpecifierProvider__handleSkippedCFUWithResourceDictionary___block_invoke_3;
      v10[3] = &unk_264923D78;
      id v11 = v4;
      v12 = self;
      [v9 getOfferWithCompletion:v10];

      goto LABEL_7;
    }
    v13[0] = MEMORY[0x263EF8330];
    v13[1] = 3221225472;
    v13[2] = __76__ICQiCloudHeaderSpecifierProvider__handleSkippedCFUWithResourceDictionary___block_invoke_2;
    v13[3] = &unk_264923E60;
    v13[4] = self;
    [v8 getEventOfferWithOptions:0 completion:v13];
  }

LABEL_7:
}

uint64_t __76__ICQiCloudHeaderSpecifierProvider__handleSkippedCFUWithResourceDictionary___block_invoke(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 32) _launchServerUIFlowWithOffer:a2];
}

uint64_t __76__ICQiCloudHeaderSpecifierProvider__handleSkippedCFUWithResourceDictionary___block_invoke_2(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 32) _launchServerUIFlowWithOffer:a2];
}

void __76__ICQiCloudHeaderSpecifierProvider__handleSkippedCFUWithResourceDictionary___block_invoke_3(uint64_t a1, void *a2, void *a3)
{
  uint64_t v18 = *MEMORY[0x263EF8340];
  id v5 = a2;
  id v6 = a3;
  if (v5)
  {
    int v7 = [v5 offerId];
  }
  else
  {
    int v7 = 0;
  }
  uint64_t v8 = [*(id *)(a1 + 32) objectForKeyedSubscript:*MEMORY[0x263F88810]];
  BOOL v9 = (void *)v8;
  id v10 = (void *)*MEMORY[0x263F88818];
  if (v8) {
    id v10 = (void *)v8;
  }
  id v11 = v10;

  v12 = _ICQGetLogSystem();
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
  {
    int v14 = 138412546;
    v15 = v7;
    __int16 v16 = 2112;
    id v17 = v11;
    _os_log_impl(&dword_22C821000, v12, OS_LOG_TYPE_DEFAULT, "ICQiCloudHeaderSpecifierProvider sending updateOfferId:%@ buttonId:%@", (uint8_t *)&v14, 0x16u);
  }

  id v13 = [MEMORY[0x263F88928] sharedOfferManager];
  [v13 updateOfferId:v7 buttonId:v11 info:0 completion:0];

  [*(id *)(a1 + 40) _launchServerUIFlowWithOffer:v5];
}

- (void)_launchServerUIFlowWithOffer:(id)a3
{
  id v3 = a3;
  id v4 = [v3 followupSpecification];
  id v5 = [v4 noteActivateLink];

  uint64_t v6 = [v5 action];
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __65__ICQiCloudHeaderSpecifierProvider__launchServerUIFlowWithOffer___block_invoke;
  block[3] = &unk_264922C70;
  id v11 = v3;
  uint64_t v12 = v6;
  id v10 = v5;
  id v7 = v3;
  id v8 = v5;
  dispatch_async(MEMORY[0x263EF83A0], block);
}

void __65__ICQiCloudHeaderSpecifierProvider__launchServerUIFlowWithOffer___block_invoke(uint64_t a1)
{
  uint64_t v16 = *MEMORY[0x263EF8340];
  int v2 = [*(id *)(a1 + 32) hasServerUIAction];
  id v3 = _ICQGetLogSystem();
  BOOL v4 = os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT);
  if (v2)
  {
    if (v4)
    {
      id v5 = _ICQStringForAction();
      uint64_t v6 = *(void *)(a1 + 32);
      int v12 = 138412546;
      id v13 = v5;
      __int16 v14 = 2112;
      uint64_t v15 = v6;
      _os_log_impl(&dword_22C821000, v3, OS_LOG_TYPE_DEFAULT, "Handling serverUI action %@ in link %@", (uint8_t *)&v12, 0x16u);
    }
    id v7 = [[ICQUpgradeFlowManager alloc] initWithOffer:*(void *)(a1 + 40)];
    [(ICQUpgradeFlowManager *)v7 beginRemoteUpgradeFlowWithICQLink:*(void *)(a1 + 32)];
  }
  else
  {
    if (v4)
    {
      id v8 = _ICQStringForAction();
      uint64_t v9 = *(void *)(a1 + 32);
      int v12 = 138412546;
      id v13 = v8;
      __int16 v14 = 2112;
      uint64_t v15 = v9;
      _os_log_impl(&dword_22C821000, v3, OS_LOG_TYPE_DEFAULT, "No special handling for action %@ in link %@, falling back to performAction.", (uint8_t *)&v12, 0x16u);
    }
    id v10 = (void *)MEMORY[0x263F88908];
    uint64_t v11 = *(void *)(a1 + 48);
    id v7 = [*(id *)(a1 + 32) parameters];
    [v10 performAction:v11 parameters:v7 options:0];
  }
}

- (AAUISpecifierProviderDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  return (AAUISpecifierProviderDelegate *)WeakRetained;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_specifiers, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_recommendationsTipSpecifierProvider, 0);
  objc_storeStrong((id *)&self->_storageSpecifiers, 0);
  objc_storeStrong((id *)&self->_storageViolationTipSpecifierProvider, 0);
  objc_storeStrong((id *)&self->_storageGroupSpecifierProvider, 0);
  objc_destroyWeak((id *)&self->_listController);
  objc_storeStrong((id *)&self->_accountManager, 0);
}

@end