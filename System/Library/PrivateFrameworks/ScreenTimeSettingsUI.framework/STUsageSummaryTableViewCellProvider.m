@interface STUsageSummaryTableViewCellProvider
+ (id)usageSummaryTableViewCellForUserDSID:(id)a3;
- (BOOL)shouldShowUsageSummaryForUser;
- (NSNumber)userDSID;
- (STOverallUsageSummaryCell)legacyUsageCell;
- (STRootViewModelCoordinator)rootCoordinator;
- (STUsageDetailsViewModelCoordinator)usageCoordinator;
- (STUsageSummaryTableViewCellProvider)initWithUserDSID:(id)a3;
- (_TtC20ScreenTimeSettingsUI34STUsageDetailsSelectionObservation)usageDetailsSelectionObservation;
- (id)usageSummaryTableViewCellForUser;
- (void)_deviceIdentifierDidChangeTo:(id)a3;
- (void)refresh;
- (void)setLegacyUsageCell:(id)a3;
- (void)setRootCoordinator:(id)a3;
- (void)setUsageDetailsSelectionObservation:(id)a3;
- (void)shouldShowUsageSummaryForUser;
@end

@implementation STUsageSummaryTableViewCellProvider

+ (id)usageSummaryTableViewCellForUserDSID:(id)a3
{
  id v3 = a3;
  v4 = [[STUsageSummaryTableViewCellProvider alloc] initWithUserDSID:v3];

  v5 = [(STUsageSummaryTableViewCellProvider *)v4 usageSummaryTableViewCellForUser];

  return v5;
}

- (STUsageSummaryTableViewCellProvider)initWithUserDSID:(id)a3
{
  id v5 = a3;
  v18.receiver = self;
  v18.super_class = (Class)STUsageSummaryTableViewCellProvider;
  v6 = [(STUsageSummaryTableViewCellProvider *)&v18 init];
  objc_storeStrong((id *)&v6->_userDSID, a3);
  v7 = +[STUsageDetailsSelection shared];
  v8 = [v7 deviceIdentifierForChildUserDSID:v5];
  v9 = [v7 usageReportTypeForChildUserDSID:v5];
  v10 = [[STRootViewModelCoordinator alloc] initWithUserDSID:v5 deviceIdentifier:v8 usageReportType:v9 usageContext:0];
  rootCoordinator = v6->_rootCoordinator;
  v6->_rootCoordinator = v10;

  objc_initWeak(&location, v6);
  v15[0] = MEMORY[0x263EF8330];
  v15[1] = 3221225472;
  v15[2] = __56__STUsageSummaryTableViewCellProvider_initWithUserDSID___block_invoke;
  v15[3] = &unk_264767CB0;
  objc_copyWeak(&v16, &location);
  uint64_t v12 = [v7 observeDeviceIdentifierChangesForChildUserDSID:v5 onChange:v15];
  usageDetailsSelectionObservation = v6->_usageDetailsSelectionObservation;
  v6->_usageDetailsSelectionObservation = (_TtC20ScreenTimeSettingsUI34STUsageDetailsSelectionObservation *)v12;

  objc_destroyWeak(&v16);
  objc_destroyWeak(&location);

  return v6;
}

void __56__STUsageSummaryTableViewCellProvider_initWithUserDSID___block_invoke(uint64_t a1, void *a2)
{
  v2 = (id *)(a1 + 32);
  id v3 = a2;
  id WeakRetained = objc_loadWeakRetained(v2);
  [WeakRetained _deviceIdentifierDidChangeTo:v3];
}

- (void)_deviceIdentifierDidChangeTo:(id)a3
{
  id v4 = a3;
  id v5 = [(STUsageSummaryTableViewCellProvider *)self legacyUsageCell];

  if (v5)
  {
    v6[0] = MEMORY[0x263EF8330];
    v6[1] = 3221225472;
    v6[2] = __68__STUsageSummaryTableViewCellProvider__deviceIdentifierDidChangeTo___block_invoke;
    v6[3] = &unk_264767078;
    v6[4] = self;
    id v7 = v4;
    dispatch_async(MEMORY[0x263EF83A0], v6);
  }
}

void __68__STUsageSummaryTableViewCellProvider__deviceIdentifierDidChangeTo___block_invoke(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 40);
  id v3 = [*(id *)(a1 + 32) usageCoordinator];
  [v3 setSelectedDeviceIdentifier:v2];

  id v4 = [*(id *)(a1 + 32) usageCoordinator];
  v5[0] = MEMORY[0x263EF8330];
  v5[1] = 3221225472;
  v5[2] = __68__STUsageSummaryTableViewCellProvider__deviceIdentifierDidChangeTo___block_invoke_2;
  v5[3] = &unk_2647671B0;
  v5[4] = *(void *)(a1 + 32);
  [v4 loadViewModelWithCompletionHandler:v5];
}

void __68__STUsageSummaryTableViewCellProvider__deviceIdentifierDidChangeTo___block_invoke_2(uint64_t a1, void *a2)
{
  id v3 = a2;
  if (v3)
  {
    id v4 = [MEMORY[0x263F671D8] usage];
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
      __68__STUsageSummaryTableViewCellProvider__deviceIdentifierDidChangeTo___block_invoke_2_cold_1((uint64_t)v3, v4);
    }
  }
  else
  {
    id v5 = [*(id *)(a1 + 32) legacyUsageCell];
    v6 = [*(id *)(a1 + 32) usageCoordinator];
    [v5 setValue:v6];
  }
}

- (BOOL)shouldShowUsageSummaryForUser
{
  id v3 = [(STUsageSummaryTableViewCellProvider *)self rootCoordinator];
  id v4 = [v3 viewModel];
  if ([v4 hasWatchOSDevicesOnly])
  {
    char v5 = 0;
  }
  else
  {
    v6 = [(STUsageSummaryTableViewCellProvider *)self rootCoordinator];
    id v7 = [v6 viewModel];
    char v5 = [v7 isScreenTimeEnabled];
  }
  if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_DEBUG)) {
    -[STUsageSummaryTableViewCellProvider shouldShowUsageSummaryForUser](v5);
  }
  return v5;
}

- (id)usageSummaryTableViewCellForUser
{
  id v3 = [[STOverallUsageSummaryCell alloc] initWithStyle:1 reuseIdentifier:@"STLegacyOverallUsageSummaryCell" specifier:0];
  [(STUsageSummaryTableViewCellProvider *)self setLegacyUsageCell:v3];

  [(STUsageSummaryTableViewCellProvider *)self refresh];
  _os_feature_enabled_impl();

  return [(STUsageSummaryTableViewCellProvider *)self legacyUsageCell];
}

- (void)refresh
{
  id v3 = [(STUsageSummaryTableViewCellProvider *)self legacyUsageCell];

  if (v3)
  {
    block[0] = MEMORY[0x263EF8330];
    block[1] = 3221225472;
    block[2] = __46__STUsageSummaryTableViewCellProvider_refresh__block_invoke;
    block[3] = &unk_264766F30;
    block[4] = self;
    dispatch_async(MEMORY[0x263EF83A0], block);
  }
}

void __46__STUsageSummaryTableViewCellProvider_refresh__block_invoke(uint64_t a1)
{
  uint64_t v2 = [*(id *)(a1 + 32) usageCoordinator];
  v3[0] = MEMORY[0x263EF8330];
  v3[1] = 3221225472;
  v3[2] = __46__STUsageSummaryTableViewCellProvider_refresh__block_invoke_2;
  v3[3] = &unk_2647671B0;
  v3[4] = *(void *)(a1 + 32);
  [v2 loadViewModelWithCompletionHandler:v3];
}

void __46__STUsageSummaryTableViewCellProvider_refresh__block_invoke_2(uint64_t a1, void *a2)
{
  id v3 = a2;
  if (v3)
  {
    if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR)) {
      __46__STUsageSummaryTableViewCellProvider_refresh__block_invoke_2_cold_1((uint64_t)v3);
    }
  }
  else
  {
    id v4 = [*(id *)(a1 + 32) usageCoordinator];
    [v4 refreshUsageData];

    char v5 = [*(id *)(a1 + 32) legacyUsageCell];
    v6 = [*(id *)(a1 + 32) usageCoordinator];
    [v5 setValue:v6];
  }
}

- (STUsageDetailsViewModelCoordinator)usageCoordinator
{
  uint64_t v2 = [(STUsageSummaryTableViewCellProvider *)self rootCoordinator];
  id v3 = [v2 usageDetailsCoordinator];

  return (STUsageDetailsViewModelCoordinator *)v3;
}

- (NSNumber)userDSID
{
  return self->_userDSID;
}

- (STOverallUsageSummaryCell)legacyUsageCell
{
  return self->_legacyUsageCell;
}

- (void)setLegacyUsageCell:(id)a3
{
}

- (STRootViewModelCoordinator)rootCoordinator
{
  return self->_rootCoordinator;
}

- (void)setRootCoordinator:(id)a3
{
}

- (_TtC20ScreenTimeSettingsUI34STUsageDetailsSelectionObservation)usageDetailsSelectionObservation
{
  return self->_usageDetailsSelectionObservation;
}

- (void)setUsageDetailsSelectionObservation:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_usageDetailsSelectionObservation, 0);
  objc_storeStrong((id *)&self->_rootCoordinator, 0);
  objc_storeStrong((id *)&self->_legacyUsageCell, 0);

  objc_storeStrong((id *)&self->_userDSID, 0);
}

void __68__STUsageSummaryTableViewCellProvider__deviceIdentifierDidChangeTo___block_invoke_2_cold_1(uint64_t a1, NSObject *a2)
{
  uint64_t v4 = *MEMORY[0x263EF8340];
  int v2 = 138412290;
  uint64_t v3 = a1;
  _os_log_error_impl(&dword_225B06000, a2, OS_LOG_TYPE_ERROR, "On device identifier change, error loading view model : %@", (uint8_t *)&v2, 0xCu);
}

- (void)shouldShowUsageSummaryForUser
{
  uint64_t v4 = *MEMORY[0x263EF8340];
  v1 = @"No";
  if (a1) {
    v1 = @"Yes";
  }
  int v2 = 138412290;
  uint64_t v3 = v1;
  _os_log_debug_impl(&dword_225B06000, &_os_log_internal, OS_LOG_TYPE_DEBUG, "Should show usage summary cell: %@", (uint8_t *)&v2, 0xCu);
}

void __46__STUsageSummaryTableViewCellProvider_refresh__block_invoke_2_cold_1(uint64_t a1)
{
  uint64_t v3 = *MEMORY[0x263EF8340];
  int v1 = 138412290;
  uint64_t v2 = a1;
  _os_log_error_impl(&dword_225B06000, &_os_log_internal, OS_LOG_TYPE_ERROR, "Error loading for STOverallUsageSummaryCell: %@", (uint8_t *)&v1, 0xCu);
}

@end