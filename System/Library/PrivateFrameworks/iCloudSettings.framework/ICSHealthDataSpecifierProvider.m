@interface ICSHealthDataSpecifierProvider
- (AAUISpecifierProviderDelegate)delegate;
- (BOOL)_isHealthDataEnabled:(id)a3;
- (ICSHealthDataSpecifierProvider)initWithAccountManager:(id)a3;
- (NSArray)specifiers;
- (id)_isHealthDataEnabledString:(id)a3;
- (id)_specifierForHealthData;
- (id)account;
- (void)setDelegate:(id)a3;
- (void)setSpecifiers:(id)a3;
@end

@implementation ICSHealthDataSpecifierProvider

- (ICSHealthDataSpecifierProvider)initWithAccountManager:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)ICSHealthDataSpecifierProvider;
  v6 = [(ICSHealthDataSpecifierProvider *)&v9 init];
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
  v9[1] = *MEMORY[0x263EF8340];
  specifiers = self->_specifiers;
  if (!specifiers)
  {
    uint64_t v4 = [(ICSHealthDataSpecifierProvider *)self _specifierForHealthData];
    id v5 = (void *)v4;
    if (v4)
    {
      v9[0] = v4;
      v6 = [MEMORY[0x263EFF8C0] arrayWithObjects:v9 count:1];
      v7 = self->_specifiers;
      self->_specifiers = v6;
    }
    specifiers = self->_specifiers;
  }

  return specifiers;
}

- (id)_specifierForHealthData
{
  v3 = (void *)MEMORY[0x263F5FC40];
  uint64_t v4 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
  id v5 = [v4 localizedStringForKey:@"HEALTH_DATA_SPECIFIER_NAME" value:&stru_270DEF3F8 table:@"Localizable-AppleID"];
  v6 = [v3 preferenceSpecifierNamed:v5 target:self set:0 get:sel__isHealthDataEnabledString_ detail:objc_opt_class() cell:2 edit:0];

  v7 = +[ICSDefaultIconLoader tableIconWithType:1 drawBorder:1];
  [v6 setObject:v7 forKeyedSubscript:*MEMORY[0x263F60140]];

  uint64_t v8 = *MEMORY[0x263EFAC90];
  [v6 setObject:*MEMORY[0x263EFAC90] forKeyedSubscript:*MEMORY[0x263F60138]];
  [v6 setObject:v8 forKeyedSubscript:@"com.apple.accountsui.dataclass"];
  [v6 setObject:self->_accountManager forKeyedSubscript:@"icloudAccountManager"];

  return v6;
}

- (id)_isHealthDataEnabledString:(id)a3
{
  BOOL v3 = [(ICSHealthDataSpecifierProvider *)self _isHealthDataEnabled:a3];
  uint64_t v4 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
  id v5 = v4;
  if (v3) {
    v6 = @"ON";
  }
  else {
    v6 = @"OFF";
  }
  v7 = [v4 localizedStringForKey:v6 value:&stru_270DEF3F8 table:@"Localizable-AppleID"];

  return v7;
}

- (BOOL)_isHealthDataEnabled:(id)a3
{
  id v4 = a3;
  p_delegate = &self->_delegate;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  char v7 = objc_opt_respondsToSelector();

  if ((v7 & 1) == 0)
  {
    v12 = LogSubsystem();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR)) {
      -[ICSPhotoStreamSpecifierProvider _isPhotoStreamEnabled:]((id *)p_delegate, v12);
    }

    goto LABEL_7;
  }
  id v8 = objc_loadWeakRetained((id *)&self->_delegate);
  char v9 = [v8 specifierProvider:self isDataclassAvailableForSpecifier:v4];

  if ((v9 & 1) == 0)
  {
LABEL_7:
    char v11 = 0;
    goto LABEL_8;
  }
  v10 = [(ICSHealthDataSpecifierProvider *)self account];
  char v11 = [v10 isEnabledForDataclass:*MEMORY[0x263EFAC90]];

LABEL_8:
  return v11;
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

  objc_storeStrong((id *)&self->_accountManager, 0);
}

@end