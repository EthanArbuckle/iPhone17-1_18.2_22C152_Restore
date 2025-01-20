@interface PSUIResetStatisticsGroup
- (CHManager)callHistoryManager;
- (PSConfirmationSpecifier)resetButtonSpecifier;
- (PSSpecifier)enableStatisticsSpecifier;
- (PSSpecifier)groupSpecifier;
- (PSUICoreTelephonyDataCache)dataCache;
- (PSUIResetStatisticsGroup)initWithDataCache:(id)a3 callHistoryManager:(id)a4 delegate:(id)a5;
- (PSUIResetStatisticsGroupDelegate)delegate;
- (id)_createResetConfirmationAlertDict;
- (id)_lastUpdateDate;
- (id)getLogger;
- (id)specifiers;
- (id)statsEnabled:(id)a3;
- (void)_updateFooterText;
- (void)clearStats;
- (void)clearStatsPressed:(id)a3;
- (void)createSpecifiers;
- (void)setCallHistoryManager:(id)a3;
- (void)setDataCache:(id)a3;
- (void)setDelegate:(id)a3;
- (void)setEnableStatisticsSpecifier:(id)a3;
- (void)setGroupSpecifier:(id)a3;
- (void)setResetButtonSpecifier:(id)a3;
- (void)setStatsEnabled:(id)a3 specifier:(id)a4;
@end

@implementation PSUIResetStatisticsGroup

- (PSUIResetStatisticsGroup)initWithDataCache:(id)a3 callHistoryManager:(id)a4 delegate:(id)a5
{
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  v15.receiver = self;
  v15.super_class = (Class)PSUIResetStatisticsGroup;
  v12 = [(PSUIResetStatisticsGroup *)&v15 init];
  v13 = v12;
  if (v12)
  {
    objc_storeStrong((id *)&v12->_dataCache, a3);
    objc_storeStrong((id *)&v13->_callHistoryManager, a4);
    objc_storeWeak((id *)&v13->_delegate, v11);
    [(PSUIResetStatisticsGroup *)v13 createSpecifiers];
    [(PSUIResetStatisticsGroup *)v13 _updateFooterText];
  }

  return v13;
}

- (void)createSpecifiers
{
  v3 = [MEMORY[0x263F5FC40] groupSpecifierWithID:@"CELLULAR_USAGE_STATISTICS"];
  groupSpecifier = self->_groupSpecifier;
  self->_groupSpecifier = v3;

  v5 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
  v6 = [v5 localizedStringForKey:@"CELLULAR_USAGE_STATISTICS" value:&stru_26D410CA0 table:@"Cellular"];
  [(PSSpecifier *)self->_groupSpecifier setName:v6];

  v7 = (void *)MEMORY[0x263F5FC40];
  v8 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
  id v9 = [v8 localizedStringForKey:@"ENABLE_CELLULAR_STATISTICS" value:&stru_26D410CA0 table:@"Cellular"];
  id v10 = [v7 preferenceSpecifierNamed:v9 target:self set:sel_setStatsEnabled_specifier_ get:sel_statsEnabled_ detail:0 cell:6 edit:0];
  enableStatisticsSpecifier = self->_enableStatisticsSpecifier;
  self->_enableStatisticsSpecifier = v10;

  uint64_t v12 = MEMORY[0x263EFFA88];
  [(PSSpecifier *)self->_enableStatisticsSpecifier setProperty:MEMORY[0x263EFFA88] forKey:*MEMORY[0x263F5FEF8]];
  v13 = (void *)MEMORY[0x263F5FB40];
  v14 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
  objc_super v15 = [v14 localizedStringForKey:@"Reset Statistics" value:&stru_26D410CA0 table:@"Cellular"];
  v16 = [v13 preferenceSpecifierNamed:v15 target:self set:0 get:0 detail:0 cell:13 edit:0];
  resetButtonSpecifier = self->_resetButtonSpecifier;
  self->_resetButtonSpecifier = v16;

  [(PSConfirmationSpecifier *)self->_resetButtonSpecifier setConfirmationAction:sel_clearStatsPressed_];
  v18 = self->_resetButtonSpecifier;
  v19 = [(PSUIResetStatisticsGroup *)self _createResetConfirmationAlertDict];
  [(PSConfirmationSpecifier *)v18 setupWithDictionary:v19];

  v20 = self->_resetButtonSpecifier;
  uint64_t v21 = *MEMORY[0x263F60000];
  [(PSConfirmationSpecifier *)v20 setProperty:v12 forKey:v21];
}

- (id)_createResetConfirmationAlertDict
{
  v2 = [MEMORY[0x263EFF9A0] dictionary];
  v3 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
  v4 = [v3 localizedStringForKey:@"RESET_STATISTICS_CANCEL" value:&stru_26D410CA0 table:@"Cellular"];
  [v2 setObject:v4 forKey:*MEMORY[0x263F5FFF8]];

  v5 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
  v6 = [v5 localizedStringForKey:@"RESET_STATISTICS_OK" value:&stru_26D410CA0 table:@"Cellular"];
  [v2 setObject:v6 forKey:*MEMORY[0x263F60008]];

  v7 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
  v8 = [v7 localizedStringForKey:@"RESET_STATISTICS_MSG" value:&stru_26D410CA0 table:@"Cellular"];
  [v2 setObject:v8 forKey:*MEMORY[0x263F60010]];

  id v9 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
  id v10 = [v9 localizedStringForKey:@"RESET_STATISTICS_TITLE" value:&stru_26D410CA0 table:@"Cellular"];
  [v2 setObject:v10 forKey:*MEMORY[0x263F60018]];

  return v2;
}

- (id)specifiers
{
  uint64_t v6 = *MEMORY[0x263EF8340];
  long long v4 = *(_OWORD *)&self->_groupSpecifier;
  resetButtonSpecifier = self->_resetButtonSpecifier;
  v2 = [MEMORY[0x263EFF8C0] arrayWithObjects:&v4 count:3];
  return v2;
}

- (id)_lastUpdateDate
{
  id v2 = [(PSUICoreTelephonyDataCache *)self->_dataCache copyStartDateOfCellularDataUsageRecords];
  return v2;
}

- (void)_updateFooterText
{
  v3 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
  long long v4 = [v3 localizedStringForKey:@"ENABLE_STATISTICS_EXPLANATION" value:&stru_26D410CA0 table:@"Cellular"];

  v5 = [(PSUIResetStatisticsGroup *)self _lastUpdateDate];
  if (v5)
  {
    uint64_t v6 = [MEMORY[0x263F08790] localizedStringFromDate:v5 dateStyle:2 timeStyle:1];
    v7 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
    v8 = [v7 localizedStringForKey:@"LAST" value:&stru_26D410CA0 table:@"Cellular"];
    objc_msgSend(v4, "stringByAppendingFormat:", v8, v6);
    id v10 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    uint64_t v6 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
    v7 = [v6 localizedStringForKey:@"LAST" value:&stru_26D410CA0 table:@"Cellular"];
    v8 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
    uint64_t v9 = [v8 localizedStringForKey:@"NEVER" value:&stru_26D410CA0 table:@"Cellular"];
    objc_msgSend(v4, "stringByAppendingFormat:", v7, v9);
    id v10 = (id)objc_claimAutoreleasedReturnValue();

    long long v4 = (void *)v9;
  }

  [(PSSpecifier *)self->_groupSpecifier setProperty:v10 forKey:*MEMORY[0x263F600F8]];
}

- (void)setStatsEnabled:(id)a3 specifier:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  uint64_t v8 = [v6 BOOLValue];
  id location = 0;
  objc_initWeak(&location, self);
  dataCache = self->_dataCache;
  v10[0] = MEMORY[0x263EF8330];
  v10[1] = 3221225472;
  v10[2] = __54__PSUIResetStatisticsGroup_setStatsEnabled_specifier___block_invoke;
  v10[3] = &unk_2645E1068;
  objc_copyWeak(&v11, &location);
  char v12 = v8;
  [(PSUICoreTelephonyDataCache *)dataCache setCellularUsageStatisticsEnabled:v8 completion:v10];
  objc_destroyWeak(&v11);
  objc_destroyWeak(&location);
}

void __54__PSUIResetStatisticsGroup_setStatsEnabled_specifier___block_invoke(uint64_t a1)
{
  id v2 = (id *)(a1 + 32);
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));

  if (WeakRetained)
  {
    id v4 = objc_loadWeakRetained(v2);
    v5 = [v4 delegate];
    [v5 didModifyStatisticsSetting];

    if (!*(unsigned char *)(a1 + 40))
    {
      id v6 = objc_loadWeakRetained(v2);
      id v7 = [v6 getLogger];

      if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)uint64_t v9 = 0;
        _os_log_impl(&dword_221B17000, v7, OS_LOG_TYPE_DEFAULT, "Successfully disabled cellular usage statistics, resetting statistics", v9, 2u);
      }

      id v8 = objc_loadWeakRetained(v2);
      [v8 clearStats];
    }
  }
}

- (id)statsEnabled:(id)a3
{
  BOOL v3 = [(PSUICoreTelephonyDataCache *)self->_dataCache isCellularUsageStatisticsEnabled];
  id v4 = NSNumber;
  return (id)[v4 numberWithBool:v3];
}

- (void)clearStatsPressed:(id)a3
{
  id v4 = [(PSUIResetStatisticsGroup *)self getLogger];
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)id v6 = 0;
    _os_log_impl(&dword_221B17000, v4, OS_LOG_TYPE_DEFAULT, "Reset Statistics button pressed", v6, 2u);
  }

  [(PSUIResetStatisticsGroup *)self clearStats];
  v5 = [(PSUIResetStatisticsGroup *)self delegate];
  [v5 didResetStatistics];
}

- (void)clearStats
{
  BOOL v3 = [(PSUIResetStatisticsGroup *)self getLogger];
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_221B17000, v3, OS_LOG_TYPE_DEFAULT, "Reset Statistics button pressed, clearing voice usage", buf, 2u);
  }

  id v4 = [(PSUIResetStatisticsGroup *)self callHistoryManager];
  [v4 callTimersReset];

  v5 = [(PSUIResetStatisticsGroup *)self getLogger];
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)id v8 = 0;
    _os_log_impl(&dword_221B17000, v5, OS_LOG_TYPE_DEFAULT, "Clearing data usage", v8, 2u);
  }

  [(PSUICoreTelephonyDataCache *)self->_dataCache eraseCellularDataUsageRecords];
  uint64_t v6 = WiFiManagerClientCreate();
  if (v6)
  {
    id v7 = (const void *)v6;
    WiFiManagerClientSetProperty();
    CFRelease(v7);
  }
  [(PSUIResetStatisticsGroup *)self _updateFooterText];
}

- (id)getLogger
{
  return (id)[MEMORY[0x263F67EB0] loggerWithCategory:@"ResetStatisticsGroup"];
}

- (PSUIResetStatisticsGroupDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  return (PSUIResetStatisticsGroupDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (PSUICoreTelephonyDataCache)dataCache
{
  return self->_dataCache;
}

- (void)setDataCache:(id)a3
{
}

- (PSSpecifier)groupSpecifier
{
  return self->_groupSpecifier;
}

- (void)setGroupSpecifier:(id)a3
{
}

- (PSSpecifier)enableStatisticsSpecifier
{
  return self->_enableStatisticsSpecifier;
}

- (void)setEnableStatisticsSpecifier:(id)a3
{
}

- (PSConfirmationSpecifier)resetButtonSpecifier
{
  return self->_resetButtonSpecifier;
}

- (void)setResetButtonSpecifier:(id)a3
{
}

- (CHManager)callHistoryManager
{
  return self->_callHistoryManager;
}

- (void)setCallHistoryManager:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_callHistoryManager, 0);
  objc_storeStrong((id *)&self->_resetButtonSpecifier, 0);
  objc_storeStrong((id *)&self->_enableStatisticsSpecifier, 0);
  objc_storeStrong((id *)&self->_groupSpecifier, 0);
  objc_storeStrong((id *)&self->_dataCache, 0);
  objc_destroyWeak((id *)&self->_delegate);
}

@end