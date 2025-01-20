@interface CTUIWirelessUsageAndAppPolicyController
- (BOOL)shouldCalculateUsage;
- (BOOL)shouldReloadSpecifiersOnResume;
- (CTUIWirelessUsageAndAppPolicyController)init;
- (CoreTelephonyClient)coreTelephonyClient;
- (PSSpecifier)groupSpecifier;
- (PSUIAppDataUsageGroup)appDataUsageGroup;
- (id)getLogger;
- (id)selectSpecifier:(id)a3;
- (id)specifiers;
- (void)_handleCellularPlanChangedNotification:(id)a3;
- (void)_handleNewCarrierNotification:(id)a3;
- (void)_handleWirelessDataUsageChangedNotification:(id)a3;
- (void)dealloc;
- (void)managedConfigurationProfileListDidChange;
- (void)managedConfigurationSettingsDidChange;
- (void)setAppDataUsageGroup:(id)a3;
- (void)setCoreTelephonyClient:(id)a3;
- (void)setGroupSpecifier:(id)a3;
- (void)setShouldCalculateUsage:(BOOL)a3;
- (void)simStatusDidChange:(id)a3 status:(id)a4;
@end

@implementation CTUIWirelessUsageAndAppPolicyController

- (CTUIWirelessUsageAndAppPolicyController)init
{
  v21.receiver = self;
  v21.super_class = (Class)CTUIWirelessUsageAndAppPolicyController;
  v2 = [(CTUIWirelessUsageAndAppPolicyController *)&v21 init];
  v3 = v2;
  if (v2)
  {
    v4 = [(CTUIWirelessUsageAndAppPolicyController *)v2 getLogger];
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v20 = 0;
      _os_log_impl(&dword_221B17000, v4, OS_LOG_TYPE_DEFAULT, "CTUIWirelessUsageAndAppPolicyController starting (init)", v20, 2u);
    }

    id v5 = objc_alloc(MEMORY[0x263F02D30]);
    v6 = [MEMORY[0x263F67F00] createCTClientSerialQueue:@"wireless_usage_and_app_policy"];
    uint64_t v7 = [v5 initWithQueue:v6];
    coreTelephonyClient = v3->_coreTelephonyClient;
    v3->_coreTelephonyClient = (CoreTelephonyClient *)v7;

    [(CoreTelephonyClient *)v3->_coreTelephonyClient setDelegate:v3];
    v9 = (void *)MEMORY[0x263F5FC40];
    v10 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
    v11 = [v10 localizedStringForKey:@"USE_WIRELESS_DATA" value:&stru_26D410CA0 table:@"Cellular"];
    uint64_t v12 = [v9 groupSpecifierWithName:v11];
    groupSpecifier = v3->_groupSpecifier;
    v3->_groupSpecifier = (PSSpecifier *)v12;

    v3->_shouldCalculateUsage = 1;
    v14 = [MEMORY[0x263F08A00] defaultCenter];
    [v14 addObserver:v3 selector:sel__handleNewCarrierNotification_ name:@"PSNewCarrierNotification" object:0];

    v15 = [MEMORY[0x263F08A00] defaultCenter];
    [v15 addObserver:v3 selector:sel__handleCellularPlanChangedNotification_ name:@"PSUICellularPlanChanged" object:0];

    v16 = [MEMORY[0x263F08A00] defaultCenter];
    [v16 addObserver:v3 selector:sel__handleWirelessDataUsageChangedNotification_ name:*MEMORY[0x263F67F20] object:0];

    v17 = [MEMORY[0x263F08A00] defaultCenter];
    [v17 addObserver:v3 selector:sel_managedConfigurationSettingsDidChange name:*MEMORY[0x263F536E0] object:0];

    v18 = [MEMORY[0x263F08A00] defaultCenter];
    [v18 addObserver:v3 selector:sel_managedConfigurationProfileListDidChange name:*MEMORY[0x263F53B18] object:0];
  }
  return v3;
}

- (void)dealloc
{
  v3 = [MEMORY[0x263F08A00] defaultCenter];
  [v3 removeObserver:self];

  v4.receiver = self;
  v4.super_class = (Class)CTUIWirelessUsageAndAppPolicyController;
  [(CTUIWirelessUsageAndAppPolicyController *)&v4 dealloc];
}

- (id)specifiers
{
  v16[1] = *MEMORY[0x263EF8340];
  uint64_t v3 = (int)*MEMORY[0x263F5FDB8];
  objc_super v4 = *(Class *)((char *)&self->super.super.super.super.super.isa + v3);
  if (!v4)
  {
    if (!self->_appDataUsageGroup)
    {
      id v5 = [[PSUIAppDataUsageGroup alloc] initWithListController:self groupSpecifier:self->_groupSpecifier];
      appDataUsageGroup = self->_appDataUsageGroup;
      self->_appDataUsageGroup = v5;
    }
    if (self->_shouldCalculateUsage)
    {
      [(PSUIAppDataUsageGroup *)self->_appDataUsageGroup calculateUsage];
      self->_shouldCalculateUsage = 0;
    }
    v16[0] = self->_groupSpecifier;
    uint64_t v7 = [MEMORY[0x263EFF8C0] arrayWithObjects:v16 count:1];
    v8 = [(CTUIWirelessUsageAndAppPolicyController *)self appDataUsageGroup];
    v9 = [v8 specifiers];
    v10 = [v7 arrayByAddingObjectsFromArray:v9];
    v11 = *(Class *)((char *)&self->super.super.super.super.super.isa + v3);
    *(Class *)((char *)&self->super.super.super.super.super.isa + v3) = v10;

    objc_super v4 = *(Class *)((char *)&self->super.super.super.super.super.isa + v3);
  }
  uint64_t v12 = (void *)MEMORY[0x263F67F00];
  v13 = (void *)[v4 mutableCopy];
  [v12 logSpecifiers:v13 origin:@"[CTUIWirelessUsageAndAppPolicyController specifiers] end"];

  v14 = *(Class *)((char *)&self->super.super.super.super.super.isa + v3);
  return v14;
}

- (void)_handleNewCarrierNotification:(id)a3
{
  self->_shouldCalculateUsage = 1;
  [(CTUIWirelessUsageAndAppPolicyController *)self reloadSpecifiers];
}

- (void)simStatusDidChange:(id)a3 status:(id)a4
{
  uint64_t v11 = *MEMORY[0x263EF8340];
  int v5 = [(id)*MEMORY[0x263F030B8] isEqualToString:a4];
  v6 = [(CTUIWirelessUsageAndAppPolicyController *)self getLogger];
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    int v7 = 136315394;
    v8 = "-[CTUIWirelessUsageAndAppPolicyController simStatusDidChange:status:]";
    __int16 v9 = 1024;
    int v10 = v5;
    _os_log_impl(&dword_221B17000, v6, OS_LOG_TYPE_DEFAULT, "%s with simReady %d", (uint8_t *)&v7, 0x12u);
  }

  if (v5)
  {
    self->_shouldCalculateUsage = 1;
    [(CTUIWirelessUsageAndAppPolicyController *)self reloadSpecifiers];
  }
}

- (void)_handleCellularPlanChangedNotification:(id)a3
{
  self->_shouldCalculateUsage = 1;
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __82__CTUIWirelessUsageAndAppPolicyController__handleCellularPlanChangedNotification___block_invoke;
  block[3] = &unk_2645E0B88;
  block[4] = self;
  dispatch_async(MEMORY[0x263EF83A0], block);
}

uint64_t __82__CTUIWirelessUsageAndAppPolicyController__handleCellularPlanChangedNotification___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) reloadSpecifiers];
}

- (void)_handleWirelessDataUsageChangedNotification:(id)a3
{
  objc_super v4 = [(CTUIWirelessUsageAndAppPolicyController *)self getLogger];
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_221B17000, v4, OS_LOG_TYPE_DEFAULT, "CTUIWirelessUsageAndAppPolicyController received wirelessDataUsageChanged notification", buf, 2u);
  }

  self->_shouldCalculateUsage = 1;
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __87__CTUIWirelessUsageAndAppPolicyController__handleWirelessDataUsageChangedNotification___block_invoke;
  block[3] = &unk_2645E0B88;
  block[4] = self;
  dispatch_async(MEMORY[0x263EF83A0], block);
}

uint64_t __87__CTUIWirelessUsageAndAppPolicyController__handleWirelessDataUsageChangedNotification___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) reloadSpecifiers];
}

- (void)managedConfigurationSettingsDidChange
{
  uint64_t v3 = [(CTUIWirelessUsageAndAppPolicyController *)self getLogger];
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_221B17000, v3, OS_LOG_TYPE_DEFAULT, "CTUIWirelessUsageAndAppPolicyController received managedConfigurationSettingsDidChange notification", buf, 2u);
  }

  self->_shouldCalculateUsage = 1;
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __80__CTUIWirelessUsageAndAppPolicyController_managedConfigurationSettingsDidChange__block_invoke;
  block[3] = &unk_2645E0B88;
  block[4] = self;
  dispatch_async(MEMORY[0x263EF83A0], block);
}

uint64_t __80__CTUIWirelessUsageAndAppPolicyController_managedConfigurationSettingsDidChange__block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) reloadSpecifiers];
}

- (void)managedConfigurationProfileListDidChange
{
  uint64_t v3 = [(CTUIWirelessUsageAndAppPolicyController *)self getLogger];
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_221B17000, v3, OS_LOG_TYPE_DEFAULT, "CTUIWirelessUsageAndAppPolicyController received managedConfigurationProfileListDidChange notification", buf, 2u);
  }

  self->_shouldCalculateUsage = 1;
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __83__CTUIWirelessUsageAndAppPolicyController_managedConfigurationProfileListDidChange__block_invoke;
  block[3] = &unk_2645E0B88;
  block[4] = self;
  dispatch_async(MEMORY[0x263EF83A0], block);
}

uint64_t __83__CTUIWirelessUsageAndAppPolicyController_managedConfigurationProfileListDidChange__block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) reloadSpecifiers];
}

- (BOOL)shouldReloadSpecifiersOnResume
{
  return 0;
}

- (id)selectSpecifier:(id)a3
{
  id v4 = a3;
  v7.receiver = self;
  v7.super_class = (Class)CTUIWirelessUsageAndAppPolicyController;
  int v5 = [(CTUIWirelessUsageAndAppPolicyController *)&v7 selectSpecifier:v4];
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    [v5 setParentSpecifier:v4];
  }

  return v5;
}

- (id)getLogger
{
  return (id)[MEMORY[0x263F67EB0] loggerWithCategory:@"WirelessUsageAndAppPolicyController"];
}

- (PSSpecifier)groupSpecifier
{
  return self->_groupSpecifier;
}

- (void)setGroupSpecifier:(id)a3
{
}

- (PSUIAppDataUsageGroup)appDataUsageGroup
{
  return self->_appDataUsageGroup;
}

- (void)setAppDataUsageGroup:(id)a3
{
}

- (CoreTelephonyClient)coreTelephonyClient
{
  return self->_coreTelephonyClient;
}

- (void)setCoreTelephonyClient:(id)a3
{
}

- (BOOL)shouldCalculateUsage
{
  return self->_shouldCalculateUsage;
}

- (void)setShouldCalculateUsage:(BOOL)a3
{
  self->_shouldCalculateUsage = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_coreTelephonyClient, 0);
  objc_storeStrong((id *)&self->_appDataUsageGroup, 0);
  objc_storeStrong((id *)&self->_groupSpecifier, 0);
}

@end