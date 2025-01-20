@interface DBSBrightnessManager
+ (BOOL)specifiersPresentIn:(id)a3;
+ (id)defaultManager;
+ (void)removeSpecifiersFrom:(id)a3;
- (CBClient)brightnessClient;
- (DBSBrightnessManager)init;
- (NSMutableArray)specifiers;
- (PSListController)delegate;
- (id)_generateMainBrightnessSpecifier;
- (id)backlightValue:(id)a3;
- (id)getAutoWhiteBalanceEnabled:(id)a3;
- (id)mainDisplayBrightnessSpecifiers;
- (void)_cleanupTransactionRef;
- (void)brightnessChangedExternally;
- (void)dealloc;
- (void)setAutoWhiteBalanceEnabled:(id)a3 forSpecifier:(id)a4;
- (void)setBacklightValue:(id)a3 specifier:(id)a4;
- (void)setBrightnessClient:(id)a3;
- (void)setDelegate:(id)a3;
- (void)setSpecifiers:(id)a3;
- (void)showAlertToDisableAccessibilityFilters:(id)a3 cancel:(id)a4;
@end

@implementation DBSBrightnessManager

+ (id)defaultManager
{
  if (defaultManager_onceToken != -1) {
    dispatch_once(&defaultManager_onceToken, &__block_literal_global_0);
  }
  v2 = (void *)defaultManager_defaultManager;
  return v2;
}

uint64_t __38__DBSBrightnessManager_defaultManager__block_invoke()
{
  defaultManager_defaultManager = objc_alloc_init(DBSBrightnessManager);
  return MEMORY[0x270F9A758]();
}

- (DBSBrightnessManager)init
{
  v7.receiver = self;
  v7.super_class = (Class)DBSBrightnessManager;
  v2 = [(DBSBrightnessManager *)&v7 init];
  if (v2)
  {
    v3 = [MEMORY[0x263F08A00] defaultCenter];
    [v3 addObserver:v2 selector:sel_handleBrightnessChangedExternallyNotification_ name:*MEMORY[0x263F83960] object:0];

    v4 = (CBClient *)objc_alloc_init(MEMORY[0x263F34248]);
    brightnessClient = v2->_brightnessClient;
    v2->_brightnessClient = v4;
  }
  return v2;
}

- (void)dealloc
{
  [(DBSBrightnessManager *)self _cleanupTransactionRef];
  v3.receiver = self;
  v3.super_class = (Class)DBSBrightnessManager;
  [(DBSBrightnessManager *)&v3 dealloc];
}

+ (BOOL)specifiersPresentIn:(id)a3
{
  objc_super v3 = [a3 specifierForID:@"BRIGHTNESS_GROUP"];
  BOOL v4 = v3 != 0;

  return v4;
}

+ (void)removeSpecifiersFrom:(id)a3
{
  id v7 = a3;
  objc_super v3 = [MEMORY[0x263EFF980] array];
  BOOL v4 = [v7 specifierForID:@"BRIGHTNESS_GROUP"];
  if (v4) {
    [v3 addObject:v4];
  }
  v5 = [v7 specifierForID:@"BRIGHTNESS"];
  if (v5) {
    [v3 addObject:v5];
  }
  v6 = [v7 specifierForID:@"WHITE_BALANCE"];
  if (v6) {
    [v3 addObject:v6];
  }
  if ([v3 count]) {
    [v7 removeContiguousSpecifiers:v3 animated:1];
  }
}

- (id)mainDisplayBrightnessSpecifiers
{
  objc_super v3 = [(DBSBrightnessManager *)self specifiers];

  if (!v3)
  {
    BOOL v4 = [MEMORY[0x263EFF980] array];
    v5 = [MEMORY[0x263F5FC40] groupSpecifierWithID:@"BRIGHTNESS_GROUP"];
    v6 = DBS_LocalizedStringForConnectedDisplays(@"BRIGHTNESS_GROUP");
    [v5 setName:v6];

    id v7 = [MEMORY[0x263F5FB08] sharedManager];
    uint64_t v8 = *MEMORY[0x263F5FF10];
    int v9 = [v7 capabilityBoolAnswer:*MEMORY[0x263F5FF10]];

    if (v9)
    {
      v10 = DBS_LocalizedStringForDisplays(@"WHITE_BALANCE_FOOTER");
      [v5 setProperty:v10 forKey:*MEMORY[0x263F600F8]];
    }
    [v4 addObject:v5];
    v11 = [(DBSBrightnessManager *)self _generateMainBrightnessSpecifier];
    [v4 addObject:v11];
    v12 = [MEMORY[0x263F5FB08] sharedManager];
    int v13 = [v12 capabilityBoolAnswer:v8];

    if (v13)
    {
      v14 = (void *)MEMORY[0x263F5FC40];
      v15 = DBS_LocalizedStringForDisplays(@"WHITE_BALANCE");
      v16 = [v14 preferenceSpecifierNamed:v15 target:self set:sel_setAutoWhiteBalanceEnabled_forSpecifier_ get:sel_getAutoWhiteBalanceEnabled_ detail:0 cell:6 edit:0];

      [v16 setObject:@"WHITE_BALANCE" forKeyedSubscript:*MEMORY[0x263F60138]];
      [v4 addObject:v16];
    }
    [(DBSBrightnessManager *)self setSpecifiers:v4];
  }
  return [(DBSBrightnessManager *)self specifiers];
}

- (id)_generateMainBrightnessSpecifier
{
  v2 = [MEMORY[0x263F5FC40] preferenceSpecifierNamed:0 target:self set:sel_setBacklightValue_specifier_ get:sel_backlightValue_ detail:0 cell:5 edit:0];
  [v2 setObject:objc_opt_class() forKeyedSubscript:*MEMORY[0x263F5FFE0]];
  [v2 setObject:&unk_26E939170 forKeyedSubscript:*MEMORY[0x263F60038]];
  [v2 setObject:&unk_26E939180 forKeyedSubscript:*MEMORY[0x263F60030]];
  [v2 setObject:&unk_26E939190 forKeyedSubscript:*MEMORY[0x263F60068]];
  [v2 setObject:MEMORY[0x263EFFA88] forKeyedSubscript:*MEMORY[0x263F60230]];
  [v2 setObject:@"BRIGHTNESS" forKeyedSubscript:*MEMORY[0x263F60138]];
  objc_super v3 = objc_msgSend(MEMORY[0x263F827E8], "dbs_minSliderImage");
  [v2 setObject:v3 forKeyedSubscript:*MEMORY[0x263F60240]];

  BOOL v4 = objc_msgSend(MEMORY[0x263F827E8], "dbs_maxSliderImage");
  [v2 setObject:v4 forKeyedSubscript:*MEMORY[0x263F60250]];

  [v2 setObject:MEMORY[0x263EFFA80] forKeyedSubscript:*MEMORY[0x263F60268]];
  return v2;
}

- (void)_cleanupTransactionRef
{
  if (gTransactionRef)
  {
    CFRelease((CFTypeRef)gTransactionRef);
    gTransactionRef = 0;
  }
}

- (id)backlightValue:(id)a3
{
  objc_super v3 = NSNumber;
  BKSDisplayBrightnessGetCurrent();
  double v5 = v4;
  return (id)[v3 numberWithDouble:v5];
}

- (void)setBacklightValue:(id)a3 specifier:(id)a4
{
  id v6 = a4;
  [a3 floatValue];
  id v8 = [v6 propertyForKey:*MEMORY[0x263F60028]];

  char v7 = [v8 isTracking];
  if (gTransactionRef || (gTransactionRef = BKSDisplayBrightnessTransactionCreate()) != 0) {
    BKSDisplayBrightnessSet();
  }
  if ((v7 & 1) == 0) {
    [(DBSBrightnessManager *)self _cleanupTransactionRef];
  }
}

- (void)brightnessChangedExternally
{
  objc_super v3 = [(DBSBrightnessManager *)self specifiers];
  id v9 = [v3 specifierForID:@"BRIGHTNESS"];

  uint64_t v4 = *MEMORY[0x263F602B0];
  double v5 = [v9 propertyForKey:*MEMORY[0x263F602B0]];
  id v6 = [v5 control];

  if (([v6 isTracking] & 1) == 0 && !gTransactionRef && v9)
  {
    char v7 = [(DBSBrightnessManager *)self backlightValue:0];
    id v8 = [v9 propertyForKey:v4];
    [v8 setValue:v7];
    [v8 layoutSubviews];
  }
}

- (id)getAutoWhiteBalanceEnabled:(id)a3
{
  objc_super v3 = NSNumber;
  uint64_t v4 = [(DBSBrightnessManager *)self brightnessClient];
  double v5 = [v4 adaptationClient];
  id v6 = objc_msgSend(v3, "numberWithBool:", objc_msgSend(v5, "getEnabled"));

  return v6;
}

- (void)setAutoWhiteBalanceEnabled:(id)a3 forSpecifier:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  int v8 = [v6 BOOLValue];
  objc_initWeak(&location, self);
  v14[0] = MEMORY[0x263EF8330];
  v14[1] = 3221225472;
  v14[2] = __64__DBSBrightnessManager_setAutoWhiteBalanceEnabled_forSpecifier___block_invoke;
  v14[3] = &unk_264C7A5C0;
  objc_copyWeak(&v15, &location);
  char v16 = v8;
  id v9 = (void (**)(void))MEMORY[0x237DF4780](v14);
  if (v8 && _AXSScreenFilterApplied())
  {
    v12[0] = MEMORY[0x263EF8330];
    v12[1] = 3221225472;
    v12[2] = __64__DBSBrightnessManager_setAutoWhiteBalanceEnabled_forSpecifier___block_invoke_2;
    v12[3] = &unk_264C7A708;
    int v13 = v9;
    v10[0] = MEMORY[0x263EF8330];
    v10[1] = 3221225472;
    v10[2] = __64__DBSBrightnessManager_setAutoWhiteBalanceEnabled_forSpecifier___block_invoke_3;
    v10[3] = &unk_264C7A5E8;
    v10[4] = self;
    id v11 = v7;
    [(DBSBrightnessManager *)self showAlertToDisableAccessibilityFilters:v12 cancel:v10];
  }
  else
  {
    v9[2](v9);
  }

  objc_destroyWeak(&v15);
  objc_destroyWeak(&location);
}

void __64__DBSBrightnessManager_setAutoWhiteBalanceEnabled_forSpecifier___block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v2 = [WeakRetained brightnessClient];
  objc_super v3 = [v2 adaptationClient];
  [v3 setEnabled:*(unsigned __int8 *)(a1 + 40)];
}

uint64_t __64__DBSBrightnessManager_setAutoWhiteBalanceEnabled_forSpecifier___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

void __64__DBSBrightnessManager_setAutoWhiteBalanceEnabled_forSpecifier___block_invoke_3(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) delegate];
  [v2 reloadSpecifier:*(void *)(a1 + 40)];
}

- (void)showAlertToDisableAccessibilityFilters:(id)a3 cancel:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  int v8 = (void *)MEMORY[0x263F82418];
  id v9 = DBS_LocalizedStringForDisplays(@"DISABLE_AX_FILTERS_TITLE");
  v10 = DBS_LocalizedStringForDisplays(@"DISABLE_AX_FILTERS_MESSAGE");
  id v11 = [v8 alertControllerWithTitle:v9 message:v10 preferredStyle:1];

  v12 = (void *)MEMORY[0x263F82400];
  int v13 = DBS_LocalizedStringForDisplays(@"DISABLE_AX_FILTERS_ENABLE");
  v26[0] = MEMORY[0x263EF8330];
  v26[1] = 3221225472;
  v26[2] = __70__DBSBrightnessManager_showAlertToDisableAccessibilityFilters_cancel___block_invoke;
  v26[3] = &unk_264C7A610;
  id v27 = v6;
  id v14 = v6;
  id v15 = [v12 actionWithTitle:v13 style:0 handler:v26];
  [v11 addAction:v15];

  char v16 = (void *)MEMORY[0x263F82400];
  v17 = DBS_LocalizedStringForDisplays(@"DISABLE_AX_FILTERS_CANCEL");
  uint64_t v21 = MEMORY[0x263EF8330];
  uint64_t v22 = 3221225472;
  v23 = __70__DBSBrightnessManager_showAlertToDisableAccessibilityFilters_cancel___block_invoke_2;
  v24 = &unk_264C7A610;
  id v25 = v7;
  id v18 = v7;
  v19 = [v16 actionWithTitle:v17 style:1 handler:&v21];
  objc_msgSend(v11, "addAction:", v19, v21, v22, v23, v24);

  v20 = [(DBSBrightnessManager *)self delegate];
  [v20 presentViewController:v11 animated:1 completion:0];
}

uint64_t __70__DBSBrightnessManager_showAlertToDisableAccessibilityFilters_cancel___block_invoke(uint64_t a1)
{
  _AXSDisableScreenFilters();
  id v2 = *(uint64_t (**)(void))(*(void *)(a1 + 32) + 16);
  return v2();
}

uint64_t __70__DBSBrightnessManager_showAlertToDisableAccessibilityFilters_cancel___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (CBClient)brightnessClient
{
  return self->_brightnessClient;
}

- (void)setBrightnessClient:(id)a3
{
}

- (PSListController)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  return (PSListController *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (NSMutableArray)specifiers
{
  return self->_specifiers;
}

- (void)setSpecifiers:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_specifiers, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_brightnessClient, 0);
}

@end