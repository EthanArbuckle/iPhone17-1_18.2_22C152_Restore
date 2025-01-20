@interface ICQUIRecommendationsSpecifierProvider
- (AAUISpecifierProviderDelegate)delegate;
- (BOOL)_handleRecommendationsURL:(id)a3;
- (BOOL)handleURL:(id)a3;
- (ICQUIRecommendationsSpecifierProvider)initWithAccountManager:(id)a3;
- (NSArray)specifiers;
- (id)account;
- (void)_reloadSpecifiers;
- (void)setDelegate:(id)a3;
- (void)setSpecifiers:(id)a3;
@end

@implementation ICQUIRecommendationsSpecifierProvider

- (ICQUIRecommendationsSpecifierProvider)initWithAccountManager:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)ICQUIRecommendationsSpecifierProvider;
  v6 = [(ICQUIRecommendationsSpecifierProvider *)&v9 init];
  v7 = v6;
  if (v6) {
    objc_storeStrong((id *)&v6->_accountManager, a3);
  }

  return v7;
}

- (void)setDelegate:(id)a3
{
  uint64_t v15 = *MEMORY[0x263EF8340];
  id v4 = a3;
  id v5 = [(ICQUIRecommendationsSpecifierProvider *)self account];
  if (objc_msgSend(v5, "aa_isAccountClass:", *MEMORY[0x263F25618]))
  {
    v6 = [(ICQUIRecommendationsSpecifierProvider *)self account];
    int v7 = objc_msgSend(v6, "aa_isManagedAppleID");

    if (!v7)
    {
      objc_storeWeak((id *)&self->_delegate, v4);
      goto LABEL_8;
    }
  }
  else
  {
  }
  v8 = _ICQGetLogSystem();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    objc_super v9 = [(ICQUIRecommendationsSpecifierProvider *)self account];
    int v10 = objc_msgSend(v9, "aa_isPrimaryAccount");
    v11 = [(ICQUIRecommendationsSpecifierProvider *)self account];
    v12[0] = 67109376;
    v12[1] = v10;
    __int16 v13 = 1024;
    int v14 = objc_msgSend(v11, "aa_isManagedAppleID");
    _os_log_impl(&dword_22C821000, v8, OS_LOG_TYPE_DEFAULT, "Recommendations for account type isPrimary: %d, isMAID: %d is not supported. bailing.", (uint8_t *)v12, 0xEu);
  }
LABEL_8:
}

- (id)account
{
  v2 = [(AIDAAccountManager *)self->_accountManager accounts];
  v3 = [v2 objectForKeyedSubscript:*MEMORY[0x263F26D28]];

  return v3;
}

- (NSArray)specifiers
{
  v3 = [(ICQUIRecommendationsSpecifierProvider *)self account];
  if (objc_msgSend(v3, "aa_isAccountClass:", *MEMORY[0x263F25618]))
  {
    id v4 = [(ICQUIRecommendationsSpecifierProvider *)self account];
    int v5 = objc_msgSend(v4, "aa_isManagedAppleID");

    if (!v5) {
      return (NSArray *)MEMORY[0x263EFFA68];
    }
  }
  else
  {
  }
  int v7 = _ICQGetLogSystem();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v8 = 0;
    _os_log_impl(&dword_22C821000, v7, OS_LOG_TYPE_DEFAULT, "Recommendation specifier was requested for non-primary, maid accounts. Returning no specifiers.", v8, 2u);
  }

  return 0;
}

- (BOOL)handleURL:(id)a3
{
  BOOL v4 = [(ICQUIRecommendationsSpecifierProvider *)self _handleRecommendationsURL:a3];
  if (v4) {
    [(ICQUIRecommendationsSpecifierProvider *)self _openRecommendationsViewController:self->_recommendationsSpecifier];
  }
  return v4;
}

- (BOOL)_handleRecommendationsURL:(id)a3
{
  uint64_t v13 = *MEMORY[0x263EF8340];
  id v3 = a3;
  BOOL v4 = _ICQGetLogSystem();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    int v11 = 138412290;
    id v12 = v3;
    _os_log_impl(&dword_22C821000, v4, OS_LOG_TYPE_DEFAULT, "Recource dictionary %@", (uint8_t *)&v11, 0xCu);
  }

  int v5 = [v3 objectForKeyedSubscript:@"path"];
  int v6 = [v5 containsString:@"RECOMMENDATIONS"];
  if (v6)
  {
    int v7 = _ICQGetLogSystem();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      v8 = objc_opt_class();
      int v11 = 138412290;
      id v12 = v8;
      id v9 = v8;
      _os_log_impl(&dword_22C821000, v7, OS_LOG_TYPE_DEFAULT, "%@ Received a recommendations url.", (uint8_t *)&v11, 0xCu);
    }
  }

  return v6;
}

- (void)_reloadSpecifiers
{
  id v4 = (id)[(NSArray *)self->_specifiers copy];
  [(ICQUIRecommendationsSpecifierProvider *)self setSpecifiers:0];
  id v3 = [(ICQUIRecommendationsSpecifierProvider *)self delegate];
  [v3 reloadSpecifiersForProvider:self oldSpecifiers:v4 animated:0];
}

- (AAUISpecifierProviderDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  return (AAUISpecifierProviderDelegate *)WeakRetained;
}

- (void)setSpecifiers:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_specifiers, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_recommendationsSpecifier, 0);
  objc_storeStrong((id *)&self->_accountManager, 0);
}

@end