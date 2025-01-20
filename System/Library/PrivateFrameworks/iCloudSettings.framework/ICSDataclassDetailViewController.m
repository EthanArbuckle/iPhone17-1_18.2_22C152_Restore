@interface ICSDataclassDetailViewController
- (id)specifiers;
- (id)tableView:(id)a3 cellForRowAtIndexPath:(id)a4;
- (void)_initSpecifiers;
- (void)cleanupDataclassSpecifiers;
- (void)setAccountManager:(id)a3;
- (void)viewDidLoad;
@end

@implementation ICSDataclassDetailViewController

- (void)setAccountManager:(id)a3
{
  v7.receiver = self;
  v7.super_class = (Class)ICSDataclassDetailViewController;
  [(ICSDataclassViewController *)&v7 setAccountManager:a3];
  v4 = [(ICSDataclassDetailViewController *)self specifier];
  v5 = [v4 objectForKeyedSubscript:*MEMORY[0x263F60138]];
  dataclass = self->_dataclass;
  self->_dataclass = v5;

  [(ICSDataclassDetailViewController *)self _initSpecifiers];
}

- (void)viewDidLoad
{
  uint64_t v10 = *MEMORY[0x263EF8340];
  uint64_t v4 = *a1;
  v5 = [a2 title];
  int v6 = 138412546;
  uint64_t v7 = v4;
  __int16 v8 = 2112;
  v9 = v5;
  _os_log_debug_impl(&dword_262993000, a3, OS_LOG_TYPE_DEBUG, "Dataclass (%@) - title (%@)", (uint8_t *)&v6, 0x16u);
}

- (void)_initSpecifiers
{
  v3 = [ICSDataclassDetailSpecifierProvider alloc];
  uint64_t v4 = [(ICSDataclassViewController *)self accountManager];
  v5 = [(ICSDataclassDetailSpecifierProvider *)v3 initWithAccountManager:v4 presenter:self];
  specifierProvider = self->_specifierProvider;
  self->_specifierProvider = v5;

  [(ICSDataclassDetailSpecifierProvider *)self->_specifierProvider setDelegate:self];
  dataclass = self->_dataclass;
  __int16 v8 = self->_specifierProvider;

  [(ICSDataclassDetailSpecifierProvider *)v8 setDataclass:dataclass];
}

- (id)specifiers
{
  uint64_t v3 = (int)*MEMORY[0x263F5FDB8];
  if (!*(Class *)((char *)&self->super.super.super.super.super.super.super.super.isa + v3))
  {
    uint64_t v4 = [(ICSDataclassDetailSpecifierProvider *)self->_specifierProvider specifiers];
    uint64_t v5 = [v4 count];

    if (v5)
    {
      int v6 = (void *)MEMORY[0x263EFF8C0];
      uint64_t v7 = [(ICSDataclassDetailSpecifierProvider *)self->_specifierProvider specifiers];
      __int16 v8 = [v6 arrayWithArray:v7];
      v9 = *(Class *)((char *)&self->super.super.super.super.super.super.super.super.isa + v3);
      *(Class *)((char *)&self->super.super.super.super.super.super.super.super.isa + v3) = v8;
    }
  }
  uint64_t v10 = *(Class *)((char *)&self->super.super.super.super.super.super.super.super.isa + v3);

  return v10;
}

- (id)tableView:(id)a3 cellForRowAtIndexPath:(id)a4
{
  v11.receiver = self;
  v11.super_class = (Class)ICSDataclassDetailViewController;
  uint64_t v4 = [(ACUIDataclassConfigurationViewController *)&v11 tableView:a3 cellForRowAtIndexPath:a4];
  uint64_t v5 = [v4 specifier];
  int v6 = [v5 propertyForKey:*MEMORY[0x263F60020]];
  int v7 = [v6 BOOLValue];

  if (v7)
  {
    __int16 v8 = LogSubsystem();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG)) {
      -[ICSDataclassDetailViewController tableView:cellForRowAtIndexPath:](v5, v8);
    }

    v9 = (void *)[objc_alloc(MEMORY[0x263F823E8]) initWithActivityIndicatorStyle:100];
    [v9 startAnimating];
    [v4 setAccessoryView:v9];
  }

  return v4;
}

- (void)cleanupDataclassSpecifiers
{
  [(ICSDataclassDetailSpecifierProvider *)self->_specifierProvider setSpecifiers:0];
  uint64_t v3 = (int)*MEMORY[0x263F5FDB8];
  uint64_t v4 = *(Class *)((char *)&self->super.super.super.super.super.super.super.super.isa + v3);
  *(Class *)((char *)&self->super.super.super.super.super.super.super.super.isa + v3) = 0;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_dataclass, 0);

  objc_storeStrong((id *)&self->_specifierProvider, 0);
}

- (void)tableView:(void *)a1 cellForRowAtIndexPath:(NSObject *)a2 .cold.1(void *a1, NSObject *a2)
{
  uint64_t v6 = *MEMORY[0x263EF8340];
  uint64_t v3 = [a1 identifier];
  int v4 = 138412290;
  uint64_t v5 = v3;
  _os_log_debug_impl(&dword_262993000, a2, OS_LOG_TYPE_DEBUG, "Adding spinner to specifier: %@", (uint8_t *)&v4, 0xCu);
}

@end