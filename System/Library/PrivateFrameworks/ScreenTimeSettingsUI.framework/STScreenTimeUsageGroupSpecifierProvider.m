@interface STScreenTimeUsageGroupSpecifierProvider
- (PSSpecifier)usageSummaryGraphSpecifier;
- (PSSpecifier)weeklyTotalSpecifier;
- (STScreenTimeUsageGroupSpecifierProvider)init;
- (id)_usageDetailsCoordinator:(id)a3;
- (id)_weeklyTotal:(id)a3;
- (void)_headerButtonPressed:(id)a3;
- (void)_lastUpdatedDateDidChangeFrom:(id)a3 to:(id)a4;
- (void)_refreshingDidChange:(BOOL)a3;
- (void)_selectedUsageReportDidChangeFrom:(id)a3 to:(id)a4;
- (void)_specifierIdentifierDidChange:(id)a3;
- (void)observeValueForKeyPath:(id)a3 ofObject:(id)a4 change:(id)a5 context:(void *)a6;
- (void)setCoordinator:(id)a3;
- (void)setUsageSummaryGraphSpecifier:(id)a3;
- (void)setWeeklyTotalSpecifier:(id)a3;
@end

@implementation STScreenTimeUsageGroupSpecifierProvider

- (STScreenTimeUsageGroupSpecifierProvider)init
{
  v17.receiver = self;
  v17.super_class = (Class)STScreenTimeUsageGroupSpecifierProvider;
  v2 = [(STGroupSpecifierProvider *)&v17 init];
  if (v2)
  {
    v3 = +[STScreenTimeSettingsUIBundle bundle];
    v4 = [v3 localizedStringForKey:@"ScreenTimeGroupSpecifierName" value:&stru_26D9391A8 table:0];
    v5 = [MEMORY[0x263F5FC40] groupSpecifierWithName:v4];
    v6 = (objc_class *)objc_opt_class();
    v7 = NSStringFromClass(v6);
    [v5 setObject:v7 forKeyedSubscript:*MEMORY[0x263F60118]];

    v8 = (objc_class *)objc_opt_class();
    v9 = NSStringFromClass(v8);
    [v5 setObject:v9 forKeyedSubscript:*MEMORY[0x263F600C0]];

    [v5 setTarget:v2];
    [v5 setButtonAction:sel__headerButtonPressed_];
    [(STGroupSpecifierProvider *)v2 setGroupSpecifier:v5];
    v10 = [MEMORY[0x263F5FC40] preferenceSpecifierNamed:@"Screen Time Summary" target:v2 set:0 get:sel__usageDetailsCoordinator_ detail:0 cell:-1 edit:0];
    [v10 setObject:objc_opt_class() forKeyedSubscript:*MEMORY[0x263F5FFE0]];
    [v10 setObject:MEMORY[0x263EFFA88] forKeyedSubscript:*MEMORY[0x263F600A8]];
    [(STScreenTimeUsageGroupSpecifierProvider *)v2 setUsageSummaryGraphSpecifier:v10];
    v11 = (void *)MEMORY[0x263F5FC40];
    v12 = [v3 localizedStringForKey:@"WeeklyTotalSpecifierName" value:&stru_26D9391A8 table:0];
    v13 = [v11 preferenceSpecifierNamed:v12 target:v2 set:0 get:sel__weeklyTotal_ detail:0 cell:4 edit:0];

    [(STScreenTimeUsageGroupSpecifierProvider *)v2 setWeeklyTotalSpecifier:v13];
    v14 = [(STGroupSpecifierProvider *)v2 mutableSpecifiers];
    [v14 addObject:v10];
    [v14 addObject:v13];
    v15 = [MEMORY[0x263F08A00] defaultCenter];
    [v15 addObserver:v2 selector:sel__specifierIdentifierDidChange_ name:0x26D93EBE8 object:0];
  }
  return v2;
}

- (void)setCoordinator:(id)a3
{
  id v4 = a3;
  v5 = [(STUsageGroupSpecifierProvider *)self coordinator];
  [v5 removeObserver:self forKeyPath:@"usageDetailsCoordinator.viewModel.hasUsageData" context:"KVOContextScreenTimeUsageGroupSpecifierProvider"];
  [v5 removeObserver:self forKeyPath:@"usageDetailsCoordinator.viewModel.lastUpdatedDate" context:"KVOContextScreenTimeUsageGroupSpecifierProvider"];
  [v5 removeObserver:self forKeyPath:@"usageDetailsCoordinator.viewModel.selectedUsageReport" context:"KVOContextScreenTimeUsageGroupSpecifierProvider"];
  [v5 removeObserver:self forKeyPath:@"usageDetailsCoordinator.refreshing" context:"KVOContextScreenTimeUsageGroupSpecifierProvider"];
  v6.receiver = self;
  v6.super_class = (Class)STScreenTimeUsageGroupSpecifierProvider;
  [(STUsageGroupSpecifierProvider *)&v6 setCoordinator:v4];
  [v4 addObserver:self forKeyPath:@"usageDetailsCoordinator.viewModel.hasUsageData" options:7 context:"KVOContextScreenTimeUsageGroupSpecifierProvider"];
  [v4 addObserver:self forKeyPath:@"usageDetailsCoordinator.viewModel.lastUpdatedDate" options:7 context:"KVOContextScreenTimeUsageGroupSpecifierProvider"];
  [v4 addObserver:self forKeyPath:@"usageDetailsCoordinator.viewModel.selectedUsageReport" options:7 context:"KVOContextScreenTimeUsageGroupSpecifierProvider"];
  [v4 addObserver:self forKeyPath:@"usageDetailsCoordinator.refreshing" options:5 context:"KVOContextScreenTimeUsageGroupSpecifierProvider"];
}

- (void)observeValueForKeyPath:(id)a3 ofObject:(id)a4 change:(id)a5 context:(void *)a6
{
  id v10 = a3;
  id v11 = a5;
  if (a6 == "KVOContextScreenTimeUsageGroupSpecifierProvider")
  {
    [(STUsageGroupSpecifierProvider *)self coordinator];

    if ([v10 isEqualToString:@"usageDetailsCoordinator.viewModel.hasUsageData"])
    {
      v12 = [v11 objectForKeyedSubscript:*MEMORY[0x263F081B8]];
      v13 = [MEMORY[0x263EFF9D0] null];

      if (v12 == v13)
      {

        v12 = 0;
      }
      -[STGroupSpecifierProvider setIsHidden:](self, "setIsHidden:", [v12 BOOLValue] ^ 1);
    }
    else
    {
      [(STUsageGroupSpecifierProvider *)self coordinator];

      if ([v10 isEqualToString:@"usageDetailsCoordinator.viewModel.lastUpdatedDate"])
      {
        v12 = [v11 objectForKeyedSubscript:*MEMORY[0x263F081C8]];
        v14 = [MEMORY[0x263EFF9D0] null];

        if (v12 == v14)
        {

          v12 = 0;
        }
        v15 = [v11 objectForKeyedSubscript:*MEMORY[0x263F081B8]];
        v16 = [MEMORY[0x263EFF9D0] null];

        if (v15 == v16)
        {

          v15 = 0;
        }
        [(STScreenTimeUsageGroupSpecifierProvider *)self _lastUpdatedDateDidChangeFrom:v12 to:v15];
      }
      else
      {
        [(STUsageGroupSpecifierProvider *)self coordinator];

        if (![v10 isEqualToString:@"usageDetailsCoordinator.viewModel.selectedUsageReport"])
        {
          [(STUsageGroupSpecifierProvider *)self coordinator];

          if (![v10 isEqualToString:@"usageDetailsCoordinator.refreshing"]) {
            goto LABEL_21;
          }
          v12 = [v11 objectForKeyedSubscript:*MEMORY[0x263F081B8]];
          v19 = [MEMORY[0x263EFF9D0] null];

          if (v12 == v19)
          {

            v12 = 0;
          }
          -[STScreenTimeUsageGroupSpecifierProvider _refreshingDidChange:](self, "_refreshingDidChange:", [v12 BOOLValue]);
          goto LABEL_20;
        }
        v12 = [v11 objectForKeyedSubscript:*MEMORY[0x263F081C8]];
        objc_super v17 = [MEMORY[0x263EFF9D0] null];

        if (v12 == v17)
        {

          v12 = 0;
        }
        v15 = [v11 objectForKeyedSubscript:*MEMORY[0x263F081B8]];
        v18 = [MEMORY[0x263EFF9D0] null];

        if (v15 == v18)
        {

          v15 = 0;
        }
        [(STScreenTimeUsageGroupSpecifierProvider *)self _selectedUsageReportDidChangeFrom:v12 to:v15];
      }
    }
LABEL_20:

    goto LABEL_21;
  }
  v20.receiver = self;
  v20.super_class = (Class)STScreenTimeUsageGroupSpecifierProvider;
  [(STScreenTimeUsageGroupSpecifierProvider *)&v20 observeValueForKeyPath:v10 ofObject:a4 change:v11 context:a6];
LABEL_21:
}

- (void)_lastUpdatedDateDidChangeFrom:(id)a3 to:(id)a4
{
  id v19 = a3;
  id v6 = a4;
  if (v19 != v6 && ([v19 isEqual:v6] & 1) == 0)
  {
    id v7 = v6;
    if (v7)
    {
      v8 = objc_opt_new();
      [v8 setTimeStyle:1];
      [v8 setDateStyle:2];
      [v8 setDoesRelativeDateFormatting:1];
      [v8 setFormattingContext:5];
      v9 = [v8 stringFromDate:v7];
      id v10 = +[STScreenTimeSettingsUIBundle bundle];
      id v11 = [v10 localizedStringForKey:@"LastUpdatedDateFormat" value:&stru_26D9391A8 table:0];

      id v12 = [NSString alloc];
      v13 = [MEMORY[0x263EFF960] currentLocale];
      v14 = objc_msgSend(v12, "initWithFormat:locale:", v11, v13, v9);
    }
    else
    {
      v8 = +[STScreenTimeSettingsUIBundle bundle];
      v14 = [v8 localizedStringForKey:@"NoLastUpdatedDate" value:&stru_26D9391A8 table:0];
    }

    v15 = [(STGroupSpecifierProvider *)self groupSpecifier];
    uint64_t v16 = *MEMORY[0x263F600F8];
    objc_super v17 = [v15 objectForKeyedSubscript:*MEMORY[0x263F600F8]];
    [v15 setObject:v14 forKeyedSubscript:v16];
    if (v17)
    {
      v18 = [v15 objectForKeyedSubscript:*MEMORY[0x263F60108]];
      [v18 reloadFromSpecifier];
    }
    else
    {
      [(STGroupSpecifierProvider *)self reloadSectionHeaderFootersWithAnimation:0];
    }
  }
}

- (void)_selectedUsageReportDidChangeFrom:(id)a3 to:(id)a4
{
  id v24 = a3;
  id v6 = a4;
  if (v24 != v6 && ([v24 isEqual:v6] & 1) == 0)
  {
    id v7 = [(STGroupSpecifierProvider *)self groupSpecifier];
    v8 = [v7 objectForKeyedSubscript:*MEMORY[0x263F60128]];
    uint64_t v9 = [v6 type];
    id v10 = [v6 reportDateInterval];
    id v11 = [v10 startDate];

    if (!v11)
    {
LABEL_13:
      [v8 reloadFromSpecifier];
      BOOL v20 = [v24 type] == v9;
      v21 = [(STScreenTimeUsageGroupSpecifierProvider *)self usageSummaryGraphSpecifier];
      [(STGroupSpecifierProvider *)self reloadSpecifier:v21 animated:v20];
      v22 = [(STScreenTimeUsageGroupSpecifierProvider *)self weeklyTotalSpecifier];
      v23 = [(STGroupSpecifierProvider *)self mutableSpecifiers];
      if ([v6 type])
      {
        [v23 removeObject:v22];
      }
      else if ([v23 containsObject:v22])
      {
        [(STGroupSpecifierProvider *)self reloadSpecifier:v22 animated:1];
      }
      else
      {
        objc_msgSend(v23, "ps_insertObject:afterObject:", v22, v21);
      }

      goto LABEL_19;
    }
    id v12 = [MEMORY[0x263EFF8F0] currentCalendar];
    v13 = v12;
    if (v9 == 1)
    {
      if (([v12 isDateInToday:v11] & 1) == 0)
      {
        id v19 = +[STScreenTimeSettingsUIBundle bundle];
        objc_super v17 = [v19 localizedStringForKey:@"ShowTodayButtonText" value:&stru_26D9391A8 table:0];

        [v7 setObject:v17 forKeyedSubscript:0x26D941808];
        [v7 setObject:MEMORY[0x263EFFA80] forKeyedSubscript:0x26D941828];
        v18 = &unk_26D967240;
        goto LABEL_11;
      }
    }
    else
    {
      if (v9)
      {
LABEL_12:

        goto LABEL_13;
      }
      v14 = objc_opt_new();
      char v15 = [v13 isDate:v11 equalToDate:v14 toUnitGranularity:0x2000];

      if ((v15 & 1) == 0)
      {
        uint64_t v16 = +[STScreenTimeSettingsUIBundle bundle];
        objc_super v17 = [v16 localizedStringForKey:@"ShowThisWeekButtonText" value:&stru_26D9391A8 table:0];

        [v7 setObject:v17 forKeyedSubscript:0x26D941808];
        [v7 setObject:MEMORY[0x263EFFA80] forKeyedSubscript:0x26D941828];
        v18 = &unk_26D967228;
LABEL_11:
        [v7 setObject:v18 forKeyedSubscript:0x26D941848];

        goto LABEL_12;
      }
    }
    [v7 setObject:MEMORY[0x263EFFA88] forKeyedSubscript:0x26D941828];
    goto LABEL_12;
  }
LABEL_19:
}

- (void)_refreshingDidChange:(BOOL)a3
{
  BOOL v3 = a3;
  id v4 = [(STGroupSpecifierProvider *)self groupSpecifier];
  id v5 = [v4 objectForKeyedSubscript:*MEMORY[0x263F60108]];

  if (v3) {
    [v5 startAnimatingSpinner];
  }
  else {
    [v5 stopAnimatingSpinner];
  }
}

- (id)_usageDetailsCoordinator:(id)a3
{
  BOOL v3 = [(STUsageGroupSpecifierProvider *)self coordinator];
  id v4 = [v3 usageDetailsCoordinator];

  return v4;
}

- (id)_weeklyTotal:(id)a3
{
  BOOL v3 = [(STUsageGroupSpecifierProvider *)self coordinator];
  id v4 = [v3 usageDetailsCoordinator];
  id v5 = [v4 viewModel];
  id v6 = [v5 selectedUsageReport];
  [v6 totalScreenTime];
  double v8 = v7;

  if (v8 >= 60.0)
  {
    uint64_t v9 = objc_opt_new();
    [v9 setAllowedUnits:96];
    [v9 setUnitsStyle:1];
  }
  else
  {
    uint64_t v9 = objc_msgSend(MEMORY[0x263F08780], "st_sharedAbbreviatedSecondsDateFormatter");
  }
  id v10 = [v9 stringFromTimeInterval:v8];

  return v10;
}

- (void)_headerButtonPressed:(id)a3
{
  id v5 = a3;
  id v6 = [(STUsageGroupSpecifierProvider *)self coordinator];
  double v7 = [v6 usageDetailsCoordinator];
  id v11 = [v7 viewModel];

  uint64_t v8 = [v5 tag];
  if (v8 == 1)
  {
    [v11 selectToday];
  }
  else if (v8)
  {
    uint64_t v9 = [MEMORY[0x263F08690] currentHandler];
    objc_msgSend(v9, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, @"STScreenTimeUsageGroupSpecifierProvider.m", 235, @"Unknown button tag: %lu", v8);
  }
  else
  {
    [v11 setSelectedWeek:0];
  }
  id v10 = [(STGroupSpecifierProvider *)self groupSpecifier];
  [v10 setObject:MEMORY[0x263EFFA88] forKeyedSubscript:0x26D941828];
}

- (void)_specifierIdentifierDidChange:(id)a3
{
  id v6 = [a3 userInfo];
  id v4 = [v6 objectForKeyedSubscript:0x26D93EC08];
  id v5 = [(STScreenTimeUsageGroupSpecifierProvider *)self usageSummaryGraphSpecifier];
  [v5 setIdentifier:v4];
}

- (PSSpecifier)usageSummaryGraphSpecifier
{
  return self->_usageSummaryGraphSpecifier;
}

- (void)setUsageSummaryGraphSpecifier:(id)a3
{
}

- (PSSpecifier)weeklyTotalSpecifier
{
  return self->_weeklyTotalSpecifier;
}

- (void)setWeeklyTotalSpecifier:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_weeklyTotalSpecifier, 0);

  objc_storeStrong((id *)&self->_usageSummaryGraphSpecifier, 0);
}

@end