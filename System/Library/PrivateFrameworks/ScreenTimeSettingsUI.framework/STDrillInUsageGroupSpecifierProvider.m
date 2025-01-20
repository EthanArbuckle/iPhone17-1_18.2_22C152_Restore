@interface STDrillInUsageGroupSpecifierProvider
- (STDrillInUsageGroupSpecifierProvider)initWithUsageItem:(id)a3 coordinator:(id)a4;
- (STRootViewModelCoordinator)coordinator;
- (STUsageItem)usageItem;
- (id)dailyAverage:(id)a3;
- (id)notifications:(id)a3;
- (id)selectedUsageReport:(id)a3;
- (id)weeklyPickupTotal:(id)a3;
- (unint64_t)numberOfNotifications;
@end

@implementation STDrillInUsageGroupSpecifierProvider

- (STDrillInUsageGroupSpecifierProvider)initWithUsageItem:(id)a3 coordinator:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v50.receiver = self;
  v50.super_class = (Class)STDrillInUsageGroupSpecifierProvider;
  v9 = [(STGroupSpecifierProvider *)&v50 init];
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_usageItem, a3);
    objc_storeStrong((id *)&v10->_coordinator, a4);
    v11 = [v8 usageDetailsCoordinator];
    v12 = [v11 viewModel];
    v13 = [v12 selectedUsageReport];

    v14 = [v13 notificationsByTrustIdentifier];
    v15 = [v7 trustIdentifier];
    v16 = [v14 objectForKeyedSubscript:v15];
    v17 = [v16 totalUsage];
    v10->_numberOfNotifications = [v17 unsignedIntegerValue];

    v18 = v13;
    v19 = +[STScreenTimeSettingsUIBundle bundle];
    if ([v7 itemType] == 6) {
      v20 = @"DrillInPickupGroupSpecifierName";
    }
    else {
      v20 = @"MostUsedScreenTimeGroupSpecifierName";
    }
    v46 = v19;
    uint64_t v21 = [v19 localizedStringForKey:v20 value:&stru_26D9391A8 table:0];
    v22 = [MEMORY[0x263F5FC40] groupSpecifierWithName:v21];
    v23 = (objc_class *)objc_opt_class();
    v24 = NSStringFromClass(v23);
    [v22 setObject:v24 forKeyedSubscript:*MEMORY[0x263F60118]];

    v25 = [v13 lastUpdatedDate];
    v48 = (void *)v21;
    id v49 = v8;
    if (v25)
    {
      v26 = objc_opt_new();
      [v26 setTimeStyle:1];
      [v26 setDateStyle:2];
      [v26 setDoesRelativeDateFormatting:1];
      [v26 setFormattingContext:5];
      v27 = [v26 stringFromDate:v25];
      v28 = +[STScreenTimeSettingsUIBundle bundle];
      v29 = [v28 localizedStringForKey:@"LastUpdatedDateFormat" value:&stru_26D9391A8 table:0];

      id v30 = [NSString alloc];
      [MEMORY[0x263EFF960] currentLocale];
      v32 = v31 = v18;
      uint64_t v33 = objc_msgSend(v30, "initWithFormat:locale:", v29, v32, v27);

      v18 = v31;
      uint64_t v34 = v33;
    }
    else
    {
      v26 = +[STScreenTimeSettingsUIBundle bundle];
      uint64_t v34 = [v26 localizedStringForKey:@"NoLastUpdatedDate" value:&stru_26D9391A8 table:0];
    }
    v35 = v46;

    v47 = (void *)v34;
    [v22 setObject:v34 forKeyedSubscript:*MEMORY[0x263F600F8]];
    [(STGroupSpecifierProvider *)v10 setGroupSpecifier:v22];
    v36 = [(STGroupSpecifierProvider *)v10 mutableSpecifiers];
    v37 = [MEMORY[0x263F5FC40] preferenceSpecifierNamed:@"Usage Summary" target:v10 set:0 get:sel_selectedUsageReport_ detail:0 cell:-1 edit:0];
    [v37 setObject:objc_opt_class() forKeyedSubscript:*MEMORY[0x263F5FFE0]];
    [v37 setObject:MEMORY[0x263EFFA88] forKeyedSubscript:*MEMORY[0x263F600A8]];
    [v37 setObject:v7 forKeyedSubscript:0x26D93E2E8];
    [v36 addObject:v37];
    if ([v7 itemType] == 6 && !objc_msgSend(v18, "type"))
    {
      v38 = (void *)MEMORY[0x263F5FC40];
      v39 = [v35 localizedStringForKey:@"DrillInPickupTotalSpecifierName" value:&stru_26D9391A8 table:0];
      v40 = sel_weeklyPickupTotal_;
    }
    else
    {
      v38 = (void *)MEMORY[0x263F5FC40];
      v39 = [v35 localizedStringForKey:@"MostUsedDailyAverageSpecifierName" value:&stru_26D9391A8 table:0];
      v40 = sel_dailyAverage_;
    }
    v41 = [v38 preferenceSpecifierNamed:v39 target:v10 set:0 get:v40 detail:0 cell:4 edit:0];

    [v36 addObject:v41];
    if (v10->_numberOfNotifications)
    {
      v42 = (void *)MEMORY[0x263F5FC40];
      v43 = [v35 localizedStringForKey:@"MostUsedNotificationsSpecifierName" value:&stru_26D9391A8 table:0];
      v44 = [v42 preferenceSpecifierNamed:v43 target:v10 set:0 get:sel_notifications_ detail:0 cell:4 edit:0];

      [v36 addObject:v44];
    }

    id v8 = v49;
  }

  return v10;
}

- (id)selectedUsageReport:(id)a3
{
  id v4 = a3;
  v5 = [(STDrillInUsageGroupSpecifierProvider *)self usageItem];
  [v4 setUserInfo:v5];

  v6 = [(STDrillInUsageGroupSpecifierProvider *)self coordinator];
  id v7 = [v6 usageDetailsCoordinator];
  id v8 = [v7 viewModel];
  v9 = [v8 selectedUsageReport];

  return v9;
}

- (id)weeklyPickupTotal:(id)a3
{
  id v4 = [(STDrillInUsageGroupSpecifierProvider *)self coordinator];
  v5 = [v4 usageDetailsCoordinator];
  v6 = [v5 viewModel];
  id v7 = [v6 selectedWeekUsageReport];
  id v8 = [v7 pickupsByTrustIdentifier];
  v9 = [(STDrillInUsageGroupSpecifierProvider *)self usageItem];
  v10 = [v9 trustIdentifier];
  v11 = [v8 objectForKeyedSubscript:v10];
  v12 = [v11 totalUsage];
  uint64_t v13 = [v12 unsignedIntegerValue];

  v14 = NSString;
  v15 = +[STScreenTimeSettingsUIBundle bundle];
  v16 = [v15 localizedStringForKey:@"PickupsCount" value:&stru_26D9391A8 table:0];
  v17 = objc_msgSend(v14, "localizedStringWithFormat:", v16, v13);

  return v17;
}

- (id)dailyAverage:(id)a3
{
  id v4 = [(STDrillInUsageGroupSpecifierProvider *)self coordinator];
  v5 = [v4 usageDetailsCoordinator];
  v6 = [v5 viewModel];
  id v7 = [v6 selectedWeekUsageReport];

  id v8 = [(STDrillInUsageGroupSpecifierProvider *)self usageItem];
  [v7 activePickupDateIntervals];
  if (v9 == 0.0)
  {
    double v11 = 1.0;
  }
  else
  {
    [v7 activePickupDateIntervals];
    double v11 = v10;
  }
  v12 = &stru_26D9391A8;
  switch([v8 itemType])
  {
    case 1:
      [v7 totalScreenTime];
      double v14 = v13 / v11;
      goto LABEL_10;
    case 2:
      uint64_t v15 = [v7 applicationUsageByTrustIdentifier];
      goto LABEL_9;
    case 3:
      uint64_t v15 = [v7 categoryUsageByTrustIdentifier];
      goto LABEL_9;
    case 4:
      uint64_t v15 = [v7 webUsageByTrustIdentifier];
LABEL_9:
      v16 = (void *)v15;
      v17 = [v8 trustIdentifier];
      v18 = [v16 objectForKeyedSubscript:v17];
      v19 = [v18 totalUsage];
      [v19 doubleValue];
      double v21 = v20;

      double v14 = v21 / v11;
LABEL_10:
      if (v14 >= 60.0)
      {
        v22 = objc_opt_new();
        [v22 setAllowedUnits:96];
        [v22 setUnitsStyle:1];
      }
      else
      {
        v22 = objc_msgSend(MEMORY[0x263F08780], "st_sharedAbbreviatedSecondsDateFormatter");
      }
      v12 = [v22 stringFromTimeInterval:v14];
      goto LABEL_15;
    case 6:
      v23 = [v7 pickupsByTrustIdentifier];
      v24 = [v8 trustIdentifier];
      v25 = [v23 objectForKeyedSubscript:v24];
      v26 = [v25 totalUsage];
      [v26 doubleValue];
      double v28 = v27 / v11;

      v29 = NSString;
      v22 = +[STScreenTimeSettingsUIBundle bundle];
      id v30 = [v22 localizedStringForKey:@"PickupsCount" value:&stru_26D9391A8 table:0];
      objc_msgSend(v29, "localizedStringWithFormat:", v30, (unint64_t)fmin(fmax(round(v28), 0.0), 1.79769313e308));
      v12 = (__CFString *)objc_claimAutoreleasedReturnValue();

LABEL_15:
      break;
    default:
      break;
  }

  return v12;
}

- (id)notifications:(id)a3
{
  id v4 = [(STDrillInUsageGroupSpecifierProvider *)self coordinator];
  v5 = [v4 usageDetailsCoordinator];
  v6 = [v5 viewModel];
  id v7 = [v6 selectedUsageReport];

  id v8 = [v7 notificationsByTrustIdentifier];
  double v9 = [(STDrillInUsageGroupSpecifierProvider *)self usageItem];
  double v10 = [v9 trustIdentifier];
  double v11 = [v8 objectForKeyedSubscript:v10];
  v12 = [v11 totalUsage];
  uint64_t v13 = [v12 unsignedIntegerValue];

  double v14 = NSString;
  uint64_t v15 = +[STScreenTimeSettingsUIBundle bundle];
  v16 = [v15 localizedStringForKey:@"NotificationsCount" value:&stru_26D9391A8 table:0];
  v17 = objc_msgSend(v14, "localizedStringWithFormat:", v16, v13);

  return v17;
}

- (STUsageItem)usageItem
{
  return self->_usageItem;
}

- (STRootViewModelCoordinator)coordinator
{
  return self->_coordinator;
}

- (unint64_t)numberOfNotifications
{
  return self->_numberOfNotifications;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_coordinator, 0);

  objc_storeStrong((id *)&self->_usageItem, 0);
}

@end