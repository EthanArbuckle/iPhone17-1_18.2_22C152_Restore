@interface STIncludeWebsiteDataGroupSpecifierProvider
- (PSSpecifier)toggleIncludeWebsiteDataSpecifier;
- (STIncludeWebsiteDataGroupSpecifierProvider)init;
- (id)includeWebsiteData:(id)a3;
- (void)observeValueForKeyPath:(id)a3 ofObject:(id)a4 change:(id)a5 context:(void *)a6;
- (void)setCoordinator:(id)a3;
- (void)setIncludeWebsiteData:(id)a3 specifier:(id)a4;
- (void)setToggleIncludeWebsiteDataSpecifier:(id)a3;
@end

@implementation STIncludeWebsiteDataGroupSpecifierProvider

- (STIncludeWebsiteDataGroupSpecifierProvider)init
{
  v10.receiver = self;
  v10.super_class = (Class)STIncludeWebsiteDataGroupSpecifierProvider;
  v2 = [(STGroupSpecifierProvider *)&v10 init];
  v3 = v2;
  if (v2)
  {
    [(STGroupSpecifierProvider *)v2 setIsHidden:1];
    v4 = +[STScreenTimeSettingsUIBundle bundle];
    v5 = [v4 localizedStringForKey:@"IncludeWebsiteDataSpecifierName" value:&stru_26D9391A8 table:0];

    v6 = [MEMORY[0x263F5FC40] preferenceSpecifierNamed:v5 target:v3 set:sel_setIncludeWebsiteData_specifier_ get:sel_includeWebsiteData_ detail:0 cell:6 edit:0];
    [(STIncludeWebsiteDataGroupSpecifierProvider *)v3 setToggleIncludeWebsiteDataSpecifier:v6];

    v7 = [(STGroupSpecifierProvider *)v3 mutableSpecifiers];
    v8 = [(STIncludeWebsiteDataGroupSpecifierProvider *)v3 toggleIncludeWebsiteDataSpecifier];
    [v7 addObject:v8];
  }
  return v3;
}

- (void)setCoordinator:(id)a3
{
  id v4 = a3;
  v5 = [(STRootGroupSpecifierProvider *)self coordinator];
  [v5 removeObserver:self forKeyPath:@"viewModel.canToggleWebsiteData" context:"STIncludeWebsiteDataGroupSpecifierProviderObservationContext"];
  v6.receiver = self;
  v6.super_class = (Class)STIncludeWebsiteDataGroupSpecifierProvider;
  [(STRootGroupSpecifierProvider *)&v6 setCoordinator:v4];
  [v4 addObserver:self forKeyPath:@"viewModel.canToggleWebsiteData" options:4 context:"STIncludeWebsiteDataGroupSpecifierProviderObservationContext"];
}

- (void)observeValueForKeyPath:(id)a3 ofObject:(id)a4 change:(id)a5 context:(void *)a6
{
  if (a6 == "STIncludeWebsiteDataGroupSpecifierProviderObservationContext")
  {
    id v11 = a3;
    [(STRootGroupSpecifierProvider *)self coordinator];

    int v12 = [v11 isEqualToString:@"viewModel.canToggleWebsiteData"];
    if (v12)
    {
      id v14 = [(STRootGroupSpecifierProvider *)self coordinator];
      v13 = [v14 viewModel];
      -[STGroupSpecifierProvider setIsHidden:](self, "setIsHidden:", [v13 canToggleWebsiteData] ^ 1);
    }
  }
  else
  {
    v15.receiver = self;
    v15.super_class = (Class)STIncludeWebsiteDataGroupSpecifierProvider;
    id v10 = a3;
    [(STIncludeWebsiteDataGroupSpecifierProvider *)&v15 observeValueForKeyPath:v10 ofObject:a4 change:a5 context:a6];
  }
}

- (void)setIncludeWebsiteData:(id)a3 specifier:(id)a4
{
  id v5 = a3;
  id v7 = [(STRootGroupSpecifierProvider *)self coordinator];
  uint64_t v6 = [v5 BOOLValue];

  [v7 setShareWebUsageEnabled:v6 completionHandler:&__block_literal_global_11];
}

void __78__STIncludeWebsiteDataGroupSpecifierProvider_setIncludeWebsiteData_specifier___block_invoke(uint64_t a1, void *a2)
{
  id v2 = a2;
  if (v2)
  {
    v3 = +[STUILog persistence];
    if (os_log_type_enabled(v3, OS_LOG_TYPE_FAULT)) {
      __78__STIncludeWebsiteDataGroupSpecifierProvider_setIncludeWebsiteData_specifier___block_invoke_cold_1((uint64_t)v2, v3);
    }
  }
}

- (id)includeWebsiteData:(id)a3
{
  v3 = NSNumber;
  id v4 = [(STRootGroupSpecifierProvider *)self coordinator];
  id v5 = [v4 viewModel];
  uint64_t v6 = objc_msgSend(v3, "numberWithBool:", objc_msgSend(v5, "isWebUsageEnabled"));

  return v6;
}

- (PSSpecifier)toggleIncludeWebsiteDataSpecifier
{
  return self->_toggleIncludeWebsiteDataSpecifier;
}

- (void)setToggleIncludeWebsiteDataSpecifier:(id)a3
{
}

- (void).cxx_destruct
{
}

void __78__STIncludeWebsiteDataGroupSpecifierProvider_setIncludeWebsiteData_specifier___block_invoke_cold_1(uint64_t a1, NSObject *a2)
{
  uint64_t v4 = *MEMORY[0x263EF8340];
  int v2 = 138543362;
  uint64_t v3 = a1;
  _os_log_fault_impl(&dword_225B06000, a2, OS_LOG_TYPE_FAULT, "failed to set include website data enabled: %{public}@", (uint8_t *)&v2, 0xCu);
}

@end