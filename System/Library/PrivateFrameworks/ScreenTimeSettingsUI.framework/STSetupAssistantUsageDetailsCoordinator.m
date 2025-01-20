@interface STSetupAssistantUsageDetailsCoordinator
- (BOOL)isRefreshing;
- (NSArray)devices;
- (NSString)selectedDeviceIdentifier;
- (STSetupAssistantUsageDetailsCoordinator)init;
- (STUsageDetailsViewModel)viewModel;
- (id)_introUsageItemsWithStartDate:(id)a3;
- (id)appConfigByIdentifier;
- (id)categoryConfigByIdentifier;
- (void)setDevices:(id)a3;
- (void)setSelectedDeviceIdentifier:(id)a3;
@end

@implementation STSetupAssistantUsageDetailsCoordinator

- (STSetupAssistantUsageDetailsCoordinator)init
{
  v20[1] = *MEMORY[0x263EF8340];
  v19.receiver = self;
  v19.super_class = (Class)STSetupAssistantUsageDetailsCoordinator;
  v2 = [(STSetupAssistantUsageDetailsCoordinator *)&v19 init];
  if (v2)
  {
    uint64_t v3 = objc_opt_new();
    viewModel = v2->_viewModel;
    v2->_viewModel = (STUsageDetailsViewModel *)v3;

    v5 = [MEMORY[0x263F82670] currentDevice];
    v6 = [v5 name];
    [(STUsageDetailsViewModel *)v2->_viewModel setSelectedItemDisplayName:v6];

    v7 = [MEMORY[0x263EFF8F0] currentCalendar];
    v8 = objc_opt_new();
    v9 = [v7 startOfDayForDate:v8];
    v10 = [v7 dateByAddingUnit:0x2000 value:-1 toDate:v9 options:0];
    uint64_t v11 = [v7 maximumRangeOfUnit:512];
    if ([v7 component:512 fromDate:v10] == v11)
    {
      id v12 = v10;
    }
    else
    {
      id v12 = [v7 nextDateAfterDate:v10 matchingUnit:512 value:v11 options:260];
    }
    v13 = v12;
    v14 = (void *)[objc_alloc(MEMORY[0x263F08B30]) initWithKey:@"startDate" ascending:1];
    v15 = [(STSetupAssistantUsageDetailsCoordinator *)v2 _introUsageItemsWithStartDate:v13];
    v20[0] = v14;
    v16 = [MEMORY[0x263EFF8C0] arrayWithObjects:v20 count:1];
    v17 = [v15 sortedArrayUsingDescriptors:v16];

    [(STUsageDetailsViewModel *)v2->_viewModel setWeekReportUsageItems:v17 weekStartDate:v13 lastUpdatedDate:v8];
  }
  return v2;
}

- (id)appConfigByIdentifier
{
  return &unk_26D967760;
}

- (id)categoryConfigByIdentifier
{
  v7[4] = *MEMORY[0x263EF8340];
  uint64_t v2 = *MEMORY[0x263F31820];
  v6[0] = *MEMORY[0x263F31858];
  v6[1] = v2;
  v7[0] = &unk_26D967788;
  v7[1] = &unk_26D9677B0;
  uint64_t v3 = *MEMORY[0x263F31838];
  v6[2] = *MEMORY[0x263F31840];
  v6[3] = v3;
  v7[2] = &unk_26D9677D8;
  v7[3] = &unk_26D967800;
  v4 = [NSDictionary dictionaryWithObjects:v7 forKeys:v6 count:4];

  return v4;
}

- (id)_introUsageItemsWithStartDate:(id)a3
{
  uint64_t v67 = *MEMORY[0x263EF8340];
  id v3 = a3;
  v4 = objc_opt_new();
  v5 = [MEMORY[0x263EFF8F0] currentCalendar];
  v6 = objc_opt_new();
  for (uint64_t i = 0; i != 8; ++i)
  {
    [v6 setDay:i];
    v8 = [v5 dateByAddingComponents:v6 toDate:v3 options:0];
    v9 = objc_opt_new();
    [v9 setItemType:1];
    [v9 setIdentifier:@"ScreenTime"];
    [v9 setTimePeriod:0];
    [v9 setStartDate:v8];
    v10 = [NSNumber numberWithDouble:(double)(arc4random_uniform(0x28u) + 80) / 100.0 * 9360.0];
    [v9 setTotalUsage:v10];

    [v4 addObject:v9];
  }
  v53 = v5;
  v54 = v4;
  [(STSetupAssistantUsageDetailsCoordinator *)self appConfigByIdentifier];
  long long v60 = 0u;
  long long v61 = 0u;
  long long v62 = 0u;
  long long v63 = 0u;
  obuint64_t j = (id)objc_claimAutoreleasedReturnValue();
  unint64_t v11 = 0x263F67000uLL;
  uint64_t v51 = [obj countByEnumeratingWithState:&v60 objects:v66 count:16];
  if (v51)
  {
    uint64_t v50 = *(void *)v61;
    do
    {
      uint64_t v12 = 0;
      do
      {
        if (*(void *)v61 != v50) {
          objc_enumerationMutation(obj);
        }
        uint64_t v56 = v12;
        uint64_t v13 = *(void *)(*((void *)&v60 + 1) + 8 * v12);
        v14 = [NSString stringWithFormat:@"App Item %@", v13];
        v15 = [obj objectForKeyedSubscript:v13];
        v16 = [v15 objectForKeyedSubscript:@"total"];
        uint64_t v17 = [v16 unsignedIntegerValue];

        for (uint64_t j = 0; j != 8; ++j)
        {
          [v6 setDay:j];
          objc_super v19 = [v53 dateByAddingComponents:v6 toDate:v3 options:0];
          v20 = objc_opt_new();
          [v20 setItemType:2];
          [v20 setIdentifier:v14];
          v21 = (void *)[objc_alloc(*(Class *)(v11 + 632)) initWithIdentifier:v13 usageTrusted:1];
          [v20 setTrustIdentifier:v21];

          [v20 setTimePeriod:0];
          [v20 setStartDate:v19];
          v22 = [NSNumber numberWithUnsignedInteger:v17];
          [v20 setTotalUsage:v22];

          unint64_t v11 = 0x263F67000;
          [v54 addObject:v20];
        }
        uint64_t v12 = v56 + 1;
      }
      while (v56 + 1 != v51);
      uint64_t v51 = [obj countByEnumeratingWithState:&v60 objects:v66 count:16];
    }
    while (v51);
  }
  uint64_t v23 = *MEMORY[0x263F31820];
  v64[0] = *MEMORY[0x263F31858];
  v64[1] = v23;
  v65[0] = &unk_26D967828;
  v65[1] = &unk_26D967850;
  uint64_t v24 = *MEMORY[0x263F31838];
  v64[2] = *MEMORY[0x263F31840];
  v64[3] = v24;
  v65[2] = &unk_26D967878;
  v65[3] = &unk_26D9678A0;
  v57 = [NSDictionary dictionaryWithObjects:v65 forKeys:v64 count:4];
  v25 = [v57 allKeys];
  v52 = v25;
  if ([v25 count])
  {
    uint64_t v26 = 0;
    do
    {
      v27 = objc_msgSend(NSString, "stringWithFormat:", @"Category Item %d", v26);
      uint64_t v59 = v26;
      v28 = [v25 objectAtIndexedSubscript:v26];
      v29 = [v57 objectForKeyedSubscript:v28];
      v30 = [v29 objectForKeyedSubscript:@"total"];
      [v30 doubleValue];
      double v32 = v31;

      uint64_t v33 = 0;
      double v34 = v32 * 8.0;
      do
      {
        [v6 setDay:v33];
        v35 = [v53 dateByAddingComponents:v6 toDate:v3 options:0];
        v36 = objc_opt_new();
        [v36 setItemType:3];
        [v36 setIdentifier:v27];
        v37 = (void *)[objc_alloc(MEMORY[0x263F67278]) initWithIdentifier:v28 usageTrusted:1];
        [v36 setTrustIdentifier:v37];

        [v36 setTimePeriod:0];
        [v36 setStartDate:v35];
        v38 = [NSNumber numberWithDouble:v34 * ((double)(arc4random_uniform(0x28u) + 80) / 100.0)];
        [v36 setTotalUsage:v38];

        [v54 addObject:v36];
        ++v33;
      }
      while (v33 != 8);

      ++v26;
      v25 = v52;
    }
    while (v59 + 1 < (unint64_t)[v52 count]);
  }
  for (uint64_t k = 0; k != 8; ++k)
  {
    v40 = objc_msgSend(NSString, "stringWithFormat:", @"Notification App Item %d", k);
    [v6 setDay:k];
    v41 = [v53 dateByAddingComponents:v6 toDate:v3 options:0];
    v42 = objc_opt_new();
    [v42 setItemType:5];
    [v42 setIdentifier:v40];
    [v42 setTimePeriod:0];
    [v42 setStartDate:v41];
    [v42 setTotalUsage:&unk_26D967390];
    [v54 addObject:v42];
  }
  for (uint64_t m = 0; m != 8; ++m)
  {
    [v6 setDay:m];
    v44 = [v53 dateByAddingComponents:v6 toDate:v3 options:0];
    [v53 rangeOfUnit:32 inUnit:16 forDate:v44];
    [v6 setHour:arc4random_uniform(v45)];
    v46 = [v53 dateByAddingComponents:v6 toDate:v3 options:0];

    v47 = objc_opt_new();
    [v47 setItemType:6];
    [v47 setIdentifier:@"Pickups"];
    [v47 setTimePeriod:0];
    [v47 setStartDate:v46];
    [v47 setTotalUsage:&unk_26D9673A8];
    [v54 addObject:v47];
  }
  v48 = (void *)[v54 copy];

  return v48;
}

- (NSArray)devices
{
  return self->_devices;
}

- (void)setDevices:(id)a3
{
}

- (NSString)selectedDeviceIdentifier
{
  return self->_selectedDeviceIdentifier;
}

- (void)setSelectedDeviceIdentifier:(id)a3
{
}

- (STUsageDetailsViewModel)viewModel
{
  return self->_viewModel;
}

- (BOOL)isRefreshing
{
  return self->_refreshing;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_viewModel, 0);
  objc_storeStrong((id *)&self->_selectedDeviceIdentifier, 0);

  objc_storeStrong((id *)&self->_devices, 0);
}

@end