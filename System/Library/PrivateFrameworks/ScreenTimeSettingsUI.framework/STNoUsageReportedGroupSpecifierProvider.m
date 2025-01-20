@interface STNoUsageReportedGroupSpecifierProvider
- (PSSpecifier)noUsageReportedAlertSpecifier;
- (STNoUsageReportedGroupSpecifierProvider)init;
- (void)_devicesDidChange:(id)a3;
- (void)dealloc;
- (void)observeValueForKeyPath:(id)a3 ofObject:(id)a4 change:(id)a5 context:(void *)a6;
- (void)setCoordinator:(id)a3;
- (void)setNoUsageReportedAlertSpecifier:(id)a3;
@end

@implementation STNoUsageReportedGroupSpecifierProvider

- (STNoUsageReportedGroupSpecifierProvider)init
{
  v8.receiver = self;
  v8.super_class = (Class)STNoUsageReportedGroupSpecifierProvider;
  v2 = [(STGroupSpecifierProvider *)&v8 init];
  v3 = (void *)MEMORY[0x263F5FC40];
  v4 = objc_opt_new();
  v5 = [v4 UUIDString];
  v6 = [v3 groupSpecifierWithID:v5];

  [(STGroupSpecifierProvider *)v2 setGroupSpecifier:v6];
  return v2;
}

- (void)dealloc
{
  [(STNoUsageReportedGroupSpecifierProvider *)self setCoordinator:0];
  v4.receiver = self;
  v4.super_class = (Class)STNoUsageReportedGroupSpecifierProvider;
  [(STRootGroupSpecifierProvider *)&v4 invalidate];
  v3.receiver = self;
  v3.super_class = (Class)STNoUsageReportedGroupSpecifierProvider;
  [(STGroupSpecifierProvider *)&v3 dealloc];
}

- (void)setCoordinator:(id)a3
{
  id v4 = a3;
  v5 = [(STRootGroupSpecifierProvider *)self coordinator];
  [v5 removeObserver:self forKeyPath:@"usageDetailsCoordinator.devices"];
  v6.receiver = self;
  v6.super_class = (Class)STNoUsageReportedGroupSpecifierProvider;
  [(STRootGroupSpecifierProvider *)&v6 setCoordinator:v4];
  [v4 addObserver:self forKeyPath:@"usageDetailsCoordinator.devices" options:5 context:"KVOContextNoUsageReportedGroupSpecifierProvider"];
}

- (void)observeValueForKeyPath:(id)a3 ofObject:(id)a4 change:(id)a5 context:(void *)a6
{
  id v10 = a5;
  if (a6 == "KVOContextNoUsageReportedGroupSpecifierProvider")
  {
    id v12 = a3;
    [(STRootGroupSpecifierProvider *)self coordinator];

    int v13 = [v12 isEqualToString:@"usageDetailsCoordinator.devices"];
    if (v13)
    {
      v14 = [v10 objectForKeyedSubscript:*MEMORY[0x263F081B8]];
      v15 = [MEMORY[0x263EFF9D0] null];

      if (v14 == v15)
      {

        v14 = 0;
      }
      [(STNoUsageReportedGroupSpecifierProvider *)self _devicesDidChange:v14];
    }
  }
  else
  {
    v16.receiver = self;
    v16.super_class = (Class)STNoUsageReportedGroupSpecifierProvider;
    id v11 = a3;
    [(STNoUsageReportedGroupSpecifierProvider *)&v16 observeValueForKeyPath:v11 ofObject:a4 change:v10 context:a6];
  }
}

- (void)_devicesDidChange:(id)a3
{
  uint64_t v53 = *MEMORY[0x263EF8340];
  id v4 = [(STRootGroupSpecifierProvider *)self coordinator];
  v5 = [v4 viewModel];
  objc_super v6 = [v5 me];

  if ([v6 isRemoteUser]) {
    uint64_t v7 = [v6 isScreenTimeEnabled] ^ 1;
  }
  else {
    uint64_t v7 = 1;
  }
  [(STGroupSpecifierProvider *)self setIsHidden:v7];
  if (![(STGroupSpecifierProvider *)self isHidden])
  {
    v47 = v6;
    objc_super v8 = [MEMORY[0x263EFF8F0] currentCalendar];
    v9 = [MEMORY[0x263EFF910] now];
    id v10 = [v8 startOfDayForDate:v9];
    v46 = v8;
    id v11 = [v8 dateByAddingUnit:0x2000 value:-1 toDate:v10 options:0];

    id v12 = objc_opt_new();
    int v13 = [(STRootGroupSpecifierProvider *)self coordinator];
    v14 = [v13 usageDetailsCoordinator];
    v15 = [v14 devices];

    long long v50 = 0u;
    long long v51 = 0u;
    long long v48 = 0u;
    long long v49 = 0u;
    id v16 = v15;
    uint64_t v17 = [v16 countByEnumeratingWithState:&v48 objects:v52 count:16];
    if (v17)
    {
      uint64_t v18 = v17;
      uint64_t v19 = *(void *)v49;
      do
      {
        for (uint64_t i = 0; i != v18; ++i)
        {
          if (*(void *)v49 != v19) {
            objc_enumerationMutation(v16);
          }
          v21 = *(void **)(*((void *)&v48 + 1) + 8 * i);
          v22 = [v21 lastFamilyCheckinDate];
          uint64_t v23 = [v11 compare:v22];

          if (v23 == 1)
          {
            v24 = [v21 name];
            [v12 addObject:v24];
          }
        }
        uint64_t v18 = [v16 countByEnumeratingWithState:&v48 objects:v52 count:16];
      }
      while (v18);
    }

    unint64_t v25 = [v12 count];
    [(STGroupSpecifierProvider *)self setIsHidden:v25 == 0];
    objc_super v6 = v47;
    if ([(STGroupSpecifierProvider *)self isHidden]) {
      goto LABEL_25;
    }
    uint64_t v26 = [MEMORY[0x263F08950] localizedStringByJoiningStrings:v12];
    v27 = @"NoUsageReportedSingleDeviceAlertFormat";
    if (v25 > 1) {
      v27 = @"NoUsageReportedMultipleDevicesAlertFormat";
    }
    v28 = v27;
    v29 = +[STScreenTimeSettingsUIBundle bundle];
    uint64_t v30 = [v29 localizedStringForKey:v28 value:&stru_26D9391A8 table:0];

    v31 = NSString;
    v32 = [v47 givenName];
    v42 = (void *)v26;
    v43 = (void *)v30;
    uint64_t v33 = [v31 localizedStringWithValidatedFormat:v30, @"%@ %@", 0, v26, v32 validFormatSpecifiers error];

    v34 = [(STGroupSpecifierProvider *)self mutableSpecifiers];
    v35 = [(STNoUsageReportedGroupSpecifierProvider *)self noUsageReportedAlertSpecifier];
    uint64_t v36 = [v34 indexOfObject:v35];

    v44 = v34;
    v45 = (void *)v33;
    if (v36 == 0x7FFFFFFFFFFFFFFFLL)
    {
      uint64_t v37 = *MEMORY[0x263F602C8];
    }
    else
    {
      v38 = [v34 objectAtIndexedSubscript:v36];
      uint64_t v37 = *MEMORY[0x263F602C8];
      v39 = [v38 objectForKeyedSubscript:*MEMORY[0x263F602C8]];
      char v40 = [v39 isEqual:v33];

      if (v40)
      {
LABEL_24:

LABEL_25:
        goto LABEL_26;
      }
    }
    v41 = [MEMORY[0x263F5FC40] preferenceSpecifierNamed:&stru_26D9391A8 target:self set:0 get:0 detail:0 cell:-1 edit:0];
    [v41 setObject:objc_opt_class() forKeyedSubscript:*MEMORY[0x263F5FFE0]];
    [v41 setObject:v45 forKeyedSubscript:v37];
    if (v36 == 0x7FFFFFFFFFFFFFFFLL) {
      [v44 addObject:v41];
    }
    else {
      [v44 replaceObjectAtIndex:v36 withObject:v41];
    }
    [(STNoUsageReportedGroupSpecifierProvider *)self setNoUsageReportedAlertSpecifier:v41];

    goto LABEL_24;
  }
LABEL_26:
}

- (PSSpecifier)noUsageReportedAlertSpecifier
{
  return (PSSpecifier *)objc_getProperty(self, a2, 48, 1);
}

- (void)setNoUsageReportedAlertSpecifier:(id)a3
{
}

- (void).cxx_destruct
{
}

@end