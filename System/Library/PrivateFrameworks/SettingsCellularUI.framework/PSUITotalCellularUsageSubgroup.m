@interface PSUITotalCellularUsageSubgroup
- (PSBillingPeriodSource)billingPeriodSource;
- (PSDataUsageStatisticsCache)statisticsCache;
- (PSSpecifier)totalRoamingUsageSpecifier;
- (PSSpecifier)totalUsageSpecifier;
- (PSUITotalCellularUsageSubgroup)initWithStatisticsCache:(id)a3 andBillingPeriodSource:(id)a4;
- (id)getLogger;
- (id)specifiers;
- (id)totalBytesUsed;
- (id)totalDataUsageForSpecifier:(id)a3;
- (id)totalRoamingBytesUsed;
- (id)totalRoamingDataUsageForSpecifier:(id)a3;
- (void)setBillingPeriodSource:(id)a3;
- (void)setStatisticsCache:(id)a3;
- (void)setTotalRoamingUsageSpecifier:(id)a3;
- (void)setTotalUsageSpecifier:(id)a3;
@end

@implementation PSUITotalCellularUsageSubgroup

- (PSUITotalCellularUsageSubgroup)initWithStatisticsCache:(id)a3 andBillingPeriodSource:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v30.receiver = self;
  v30.super_class = (Class)PSUITotalCellularUsageSubgroup;
  v9 = [(PSUITotalCellularUsageSubgroup *)&v30 init];
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_statisticsCache, a3);
    objc_storeWeak((id *)&v10->_billingPeriodSource, v8);
    v11 = (void *)MEMORY[0x263F5FC40];
    v12 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
    [v12 localizedStringForKey:@"CURRENT_DATA_PERIOD" value:&stru_26D410CA0 table:@"Cellular"];
    v14 = id v13 = v8;
    uint64_t v15 = [v11 preferenceSpecifierNamed:v14 target:v10 set:0 get:sel_totalDataUsageForSpecifier_ detail:0 cell:4 edit:0];
    totalUsageSpecifier = v10->_totalUsageSpecifier;
    v10->_totalUsageSpecifier = (PSSpecifier *)v15;

    [(PSSpecifier *)v10->_totalUsageSpecifier setIdentifier:@"DATA_USAGE_IN_PERIOD"];
    v17 = v10->_totalUsageSpecifier;
    uint64_t v18 = objc_opt_class();
    uint64_t v19 = *MEMORY[0x263F5FFE0];
    [(PSSpecifier *)v17 setProperty:v18 forKey:*MEMORY[0x263F5FFE0]];
    v20 = (void *)MEMORY[0x263F5FC40];
    v21 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
    v22 = [v21 localizedStringForKey:@"CURRENT_ROAMING" value:&stru_26D410CA0 table:@"Cellular"];
    uint64_t v23 = [v20 preferenceSpecifierNamed:v22 target:v10 set:0 get:sel_totalRoamingDataUsageForSpecifier_ detail:0 cell:4 edit:0];
    totalRoamingUsageSpecifier = v10->_totalRoamingUsageSpecifier;
    v10->_totalRoamingUsageSpecifier = (PSSpecifier *)v23;

    id v8 = v13;
    [(PSSpecifier *)v10->_totalRoamingUsageSpecifier setProperty:objc_opt_class() forKey:v19];
    [(PSSpecifier *)v10->_totalRoamingUsageSpecifier setIdentifier:@"ROAMING_DATA_USAGE_IN_PERIOD"];
    if ([(PSDataUsageStatisticsCache *)v10->_statisticsCache useCalendarMonthBillingCycle])
    {
      v25 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
      v26 = [v25 localizedStringForKey:@"CELLULAR_DATA_USED" value:&stru_26D410CA0 table:@"Cellular"];
      [(PSSpecifier *)v10->_totalUsageSpecifier setName:v26];

      v27 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
      v28 = [v27 localizedStringForKey:@"ROAMING" value:&stru_26D410CA0 table:@"Cellular"];
      [(PSSpecifier *)v10->_totalRoamingUsageSpecifier setName:v28];
    }
  }

  return v10;
}

- (id)specifiers
{
  v5[2] = *MEMORY[0x263EF8340];
  totalRoamingUsageSpecifier = self->_totalRoamingUsageSpecifier;
  v5[0] = self->_totalUsageSpecifier;
  v5[1] = totalRoamingUsageSpecifier;
  v3 = [MEMORY[0x263EFF8C0] arrayWithObjects:v5 count:2];
  return v3;
}

- (id)totalBytesUsed
{
  uint64_t v16 = *MEMORY[0x263EF8340];
  v3 = [(PSUITotalCellularUsageSubgroup *)self billingPeriodSource];
  v4 = v3;
  if (v3)
  {
    uint64_t v5 = [v3 selectedPeriod];
    statisticsCache = self->_statisticsCache;
    if (v5)
    {
      double v7 = (double)(unint64_t)[(PSDataUsageStatisticsCache *)statisticsCache totalCellularUsageForPeriod:1];
      id v8 = [(PSUITotalCellularUsageSubgroup *)self getLogger];
      if (!os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT)) {
        goto LABEL_10;
      }
      int v12 = 136315394;
      id v13 = "-[PSUITotalCellularUsageSubgroup totalBytesUsed]";
      __int16 v14 = 2048;
      double v15 = v7;
      v9 = "%s returning previous billing cycle usage %f";
    }
    else
    {
      double v7 = (double)(unint64_t)[(PSDataUsageStatisticsCache *)statisticsCache totalCellularUsageForPeriod:0];
      id v8 = [(PSUITotalCellularUsageSubgroup *)self getLogger];
      if (!os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT)) {
        goto LABEL_10;
      }
      int v12 = 136315394;
      id v13 = "-[PSUITotalCellularUsageSubgroup totalBytesUsed]";
      __int16 v14 = 2048;
      double v15 = v7;
      v9 = "%s returning current billing cycle usage %f";
    }
  }
  else
  {
    double v7 = (double)(unint64_t)[(PSDataUsageStatisticsCache *)self->_statisticsCache totalCellularUsageForPeriod:0];
    id v8 = [(PSUITotalCellularUsageSubgroup *)self getLogger];
    if (!os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT)) {
      goto LABEL_10;
    }
    int v12 = 136315394;
    id v13 = "-[PSUITotalCellularUsageSubgroup totalBytesUsed]";
    __int16 v14 = 2048;
    double v15 = v7;
    v9 = "%s returning total usage %f";
  }
  _os_log_impl(&dword_221B17000, v8, OS_LOG_TYPE_DEFAULT, v9, (uint8_t *)&v12, 0x16u);
LABEL_10:

  v10 = [NSNumber numberWithDouble:v7];

  return v10;
}

- (id)totalRoamingBytesUsed
{
  uint64_t v16 = *MEMORY[0x263EF8340];
  v3 = [(PSUITotalCellularUsageSubgroup *)self billingPeriodSource];
  v4 = v3;
  if (v3)
  {
    uint64_t v5 = [v3 selectedPeriod];
    statisticsCache = self->_statisticsCache;
    if (v5)
    {
      double v7 = (double)(unint64_t)[(PSDataUsageStatisticsCache *)statisticsCache totalRoamingUsageForPeriod:1];
      id v8 = [(PSUITotalCellularUsageSubgroup *)self getLogger];
      if (!os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT)) {
        goto LABEL_10;
      }
      int v12 = 136315394;
      id v13 = "-[PSUITotalCellularUsageSubgroup totalRoamingBytesUsed]";
      __int16 v14 = 2048;
      double v15 = v7;
      v9 = "%s returning previous billing cycle roaming %f";
    }
    else
    {
      double v7 = (double)(unint64_t)[(PSDataUsageStatisticsCache *)statisticsCache totalRoamingUsageForPeriod:0];
      id v8 = [(PSUITotalCellularUsageSubgroup *)self getLogger];
      if (!os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT)) {
        goto LABEL_10;
      }
      int v12 = 136315394;
      id v13 = "-[PSUITotalCellularUsageSubgroup totalRoamingBytesUsed]";
      __int16 v14 = 2048;
      double v15 = v7;
      v9 = "%s returning current billing cycle roaming %f";
    }
  }
  else
  {
    double v7 = (double)(unint64_t)[(PSDataUsageStatisticsCache *)self->_statisticsCache totalRoamingUsageForPeriod:0];
    id v8 = [(PSUITotalCellularUsageSubgroup *)self getLogger];
    if (!os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT)) {
      goto LABEL_10;
    }
    int v12 = 136315394;
    id v13 = "-[PSUITotalCellularUsageSubgroup totalRoamingBytesUsed]";
    __int16 v14 = 2048;
    double v15 = v7;
    v9 = "%s returning total roaming %f";
  }
  _os_log_impl(&dword_221B17000, v8, OS_LOG_TYPE_DEFAULT, v9, (uint8_t *)&v12, 0x16u);
LABEL_10:

  v10 = [NSNumber numberWithDouble:v7];

  return v10;
}

- (id)totalDataUsageForSpecifier:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [(PSUITotalCellularUsageSubgroup *)self totalBytesUsed];
  v6 = [v4 propertyForKey:*MEMORY[0x263F602B0]];

  if (v5)
  {
    [v6 setAccessoryView:0];
    double v7 = (void *)MEMORY[0x263F67F00];
    [v5 doubleValue];
    objc_msgSend(v7, "usageSizeString:");
    id v8 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v9 = (void *)[objc_alloc(MEMORY[0x263F823E8]) initWithActivityIndicatorStyle:100];
    [v9 startAnimating];
    [v6 setAccessoryView:v9];

    id v8 = &stru_26D410CA0;
  }

  return v8;
}

- (id)totalRoamingDataUsageForSpecifier:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [(PSUITotalCellularUsageSubgroup *)self totalRoamingBytesUsed];
  v6 = [v4 propertyForKey:*MEMORY[0x263F602B0]];

  if (v5)
  {
    [v6 setAccessoryView:0];
    double v7 = (void *)MEMORY[0x263F67F00];
    [v5 doubleValue];
    objc_msgSend(v7, "usageSizeString:");
    id v8 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v9 = (void *)[objc_alloc(MEMORY[0x263F823E8]) initWithActivityIndicatorStyle:100];
    [v9 startAnimating];
    [v6 setAccessoryView:v9];

    id v8 = &stru_26D410CA0;
  }

  return v8;
}

- (id)getLogger
{
  return (id)[MEMORY[0x263F67EB0] loggerWithCategory:@"TotalCellularUsage"];
}

- (PSBillingPeriodSource)billingPeriodSource
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_billingPeriodSource);
  return (PSBillingPeriodSource *)WeakRetained;
}

- (void)setBillingPeriodSource:(id)a3
{
}

- (PSDataUsageStatisticsCache)statisticsCache
{
  return self->_statisticsCache;
}

- (void)setStatisticsCache:(id)a3
{
}

- (PSSpecifier)totalUsageSpecifier
{
  return self->_totalUsageSpecifier;
}

- (void)setTotalUsageSpecifier:(id)a3
{
}

- (PSSpecifier)totalRoamingUsageSpecifier
{
  return self->_totalRoamingUsageSpecifier;
}

- (void)setTotalRoamingUsageSpecifier:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_totalRoamingUsageSpecifier, 0);
  objc_storeStrong((id *)&self->_totalUsageSpecifier, 0);
  objc_storeStrong((id *)&self->_statisticsCache, 0);
  objc_destroyWeak((id *)&self->_billingPeriodSource);
}

@end