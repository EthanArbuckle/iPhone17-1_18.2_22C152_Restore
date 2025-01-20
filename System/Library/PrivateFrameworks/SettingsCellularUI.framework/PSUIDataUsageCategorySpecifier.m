@interface PSUIDataUsageCategorySpecifier
- (NSArray)subcategorySpecifiers;
- (PSBillingPeriodSource)billingPeriodSource;
- (PSDataUsageStatisticsCache)statisticsCache;
- (PSUIDataUsageCategorySpecifier)initWithType:(unint64_t)a3 subSpecifiers:(id)a4;
- (id)dataUsageString;
- (id)getLogger;
- (unint64_t)dataUsage;
- (unint64_t)type;
- (void)setBillingPeriodSource:(id)a3;
- (void)setStatisticsCache:(id)a3;
- (void)setSubcategorySpecifiers:(id)a3;
- (void)setType:(unint64_t)a3;
@end

@implementation PSUIDataUsageCategorySpecifier

- (PSUIDataUsageCategorySpecifier)initWithType:(unint64_t)a3 subSpecifiers:(id)a4
{
  id v6 = a4;
  switch(a3)
  {
    case 1uLL:
      v7 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
      v8 = [v7 localizedStringForKey:@"UNINSTALLED_APPS" value:&stru_26D410CA0 table:@"Cellular"];
      v9 = @"com.apple.graphic-icon.uninstalled-apps";
      goto LABEL_7;
    case 2uLL:
      v7 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
      v8 = [v7 localizedStringForKey:@"WATCH_ONLY_APPS" value:&stru_26D410CA0 table:@"Cellular"];
      v9 = @"com.apple.graphic-icon.apps-on-watch";
      goto LABEL_7;
    case 3uLL:
      v7 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
      v8 = [v7 localizedStringForKey:@"SYSTEM_SERVICES" value:&stru_26D410CA0 table:@"Cellular"];
      v9 = @"com.apple.graphic-icon.gear";
      goto LABEL_7;
    case 4uLL:
      v7 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
      v8 = [v7 localizedStringForKey:@"HOTSPOT_CLIENTS" value:&stru_26D410CA0 table:@"Cellular"];
      v9 = @"com.apple.graphic-icon.personal-hotspot";
LABEL_7:

      break;
    default:
      v8 = 0;
      v9 = 0;
      break;
  }
  v18.receiver = self;
  v18.super_class = (Class)PSUIDataUsageCategorySpecifier;
  v10 = [(PSUIDataUsageCategorySpecifier *)&v18 initWithName:v8 target:0 set:0 get:0 detail:0 cell:4 edit:0];
  v11 = v10;
  if (v10)
  {
    v10->_type = a3;
    uint64_t v12 = [MEMORY[0x263F67EE0] sharedInstance];
    statisticsCache = v11->_statisticsCache;
    v11->_statisticsCache = (PSDataUsageStatisticsCache *)v12;

    [(PSUIDataUsageCategorySpecifier *)v11 setTarget:v11];
    *(Class *)((char *)&v11->super.super.isa + (int)*MEMORY[0x263F5FE28]) = (Class)sel_dataUsageString;
    if (v11->_type == 1)
    {
      [(PSUIDataUsageCategorySpecifier *)v11 setCellType:4];
    }
    else
    {
      if ([v6 count]) {
        uint64_t v14 = 2;
      }
      else {
        uint64_t v14 = 4;
      }
      [(PSUIDataUsageCategorySpecifier *)v11 setCellType:v14];
      if ([v6 count])
      {
        uint64_t v15 = objc_opt_class();
LABEL_17:
        [(PSUIDataUsageCategorySpecifier *)v11 setDetailControllerClass:v15];
        [(PSUIDataUsageCategorySpecifier *)v11 setProperty:objc_opt_class() forKey:*MEMORY[0x263F5FFE0]];
        [(PSUIDataUsageCategorySpecifier *)v11 setProperty:v9 forKey:*MEMORY[0x263F60158]];
        uint64_t v16 = MEMORY[0x263EFFA88];
        [(PSUIDataUsageCategorySpecifier *)v11 setProperty:MEMORY[0x263EFFA88] forKey:*MEMORY[0x263F601A8]];
        [(PSUIDataUsageCategorySpecifier *)v11 setProperty:v16 forKey:*MEMORY[0x263F60198]];
        [(PSUIDataUsageCategorySpecifier *)v11 setSubcategorySpecifiers:v6];
        goto LABEL_18;
      }
    }
    uint64_t v15 = 0;
    goto LABEL_17;
  }
LABEL_18:

  return v11;
}

- (unint64_t)dataUsage
{
  uint64_t v36 = *MEMORY[0x263EF8340];
  v3 = [(PSUIDataUsageCategorySpecifier *)self billingPeriodSource];
  v4 = v3;
  switch(self->_type)
  {
    case 1uLL:
      statisticsCache = self->_statisticsCache;
      if (v3) {
        uint64_t v6 = [v3 selectedPeriod];
      }
      else {
        uint64_t v6 = 0;
      }
      v31 = v4;
      uint64_t v15 = [(PSDataUsageStatisticsCache *)statisticsCache totalUninstalledAppUsageForPeriod:v6];
      goto LABEL_19;
    case 2uLL:
      v9 = self->_statisticsCache;
      if (v3) {
        uint64_t v10 = [v3 selectedPeriod];
      }
      else {
        uint64_t v10 = 0;
      }
      v31 = v4;
      uint64_t v16 = [(PSDataUsageStatisticsCache *)v9 totalWatchOnlyAppUsageForPeriod:v10];
      goto LABEL_20;
    case 3uLL:
      v11 = self->_statisticsCache;
      if (v3) {
        uint64_t v12 = [v3 selectedPeriod];
      }
      else {
        uint64_t v12 = 0;
      }
      v31 = v4;
      uint64_t v15 = [(PSDataUsageStatisticsCache *)v11 totalSystemServicesUsageForPeriod:v12];
LABEL_19:
      uint64_t v16 = (void *)v15;
LABEL_20:
      v17 = [v16 native];
      uint64_t v18 = [v17 cellularHome];
      v19 = [v16 native];
      uint64_t v20 = [v19 cellularRoaming] + v18;
      v21 = [v16 proxied];
      uint64_t v22 = [v21 cellularHome];
      v23 = [v16 proxied];
      unint64_t v8 = v20 + v22 + [v23 cellularRoaming];

      if (self->_type == 3)
      {
        v24 = self->_statisticsCache;
        v4 = v31;
        if (v31) {
          uint64_t v25 = [v31 selectedPeriod];
        }
        else {
          uint64_t v25 = 0;
        }
        unint64_t v26 = [(PSDataUsageStatisticsCache *)v24 totalHotspotClientUsageForPeriod:v25];
        v27 = [(PSUIDataUsageCategorySpecifier *)self getLogger];
        v28 = v27;
        if (v8 >= v26)
        {
          if (os_log_type_enabled(v27, OS_LOG_TYPE_INFO))
          {
            *(_DWORD *)buf = 134218240;
            unint64_t v33 = v26;
            __int16 v34 = 2048;
            unint64_t v35 = v8;
            _os_log_impl(&dword_221B17000, v28, OS_LOG_TYPE_INFO, "Removing %zu bytes of hotspot usage from %zu bytes of system services", buf, 0x16u);
          }

          v8 -= v26;
        }
        else
        {
          if (os_log_type_enabled(v27, OS_LOG_TYPE_FAULT))
          {
            *(_DWORD *)buf = 134218240;
            unint64_t v33 = v26;
            __int16 v34 = 2048;
            unint64_t v35 = v8;
            _os_log_fault_impl(&dword_221B17000, v28, OS_LOG_TYPE_FAULT, "Hotspot usage %zu is greater than system services usage %zu", buf, 0x16u);
          }
        }
      }
      else
      {
        v4 = v31;
      }
      goto LABEL_35;
    case 4uLL:
      v13 = self->_statisticsCache;
      if (v3) {
        uint64_t v14 = [v3 selectedPeriod];
      }
      else {
        uint64_t v14 = 0;
      }
      unint64_t v8 = [(PSDataUsageStatisticsCache *)v13 totalHotspotClientUsageForPeriod:v14];
      goto LABEL_34;
    default:
      v7 = [(PSUIDataUsageCategorySpecifier *)self getLogger];
      if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
      {
        unint64_t type = self->_type;
        *(_DWORD *)buf = 134217984;
        unint64_t v33 = type;
        _os_log_error_impl(&dword_221B17000, v7, OS_LOG_TYPE_ERROR, "Unhandled usage category %lu", buf, 0xCu);
      }

      unint64_t v8 = 0;
LABEL_34:
      uint64_t v16 = 0;
LABEL_35:

      return v8;
  }
}

- (id)dataUsageString
{
  unint64_t v2 = [(PSUIDataUsageCategorySpecifier *)self dataUsage];
  if (v2)
  {
    v3 = [MEMORY[0x263F67F00] usageSizeString:(double)v2];
  }
  else
  {
    v3 = 0;
  }
  if (v3) {
    v4 = v3;
  }
  else {
    v4 = &stru_26D410CA0;
  }
  v5 = v4;

  return v5;
}

- (id)getLogger
{
  return (id)[MEMORY[0x263F67EB0] loggerWithCategory:@"DataUsageCategory"];
}

- (PSBillingPeriodSource)billingPeriodSource
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_billingPeriodSource);
  return (PSBillingPeriodSource *)WeakRetained;
}

- (void)setBillingPeriodSource:(id)a3
{
}

- (NSArray)subcategorySpecifiers
{
  return self->_subcategorySpecifiers;
}

- (void)setSubcategorySpecifiers:(id)a3
{
}

- (unint64_t)type
{
  return self->_type;
}

- (void)setType:(unint64_t)a3
{
  self->_unint64_t type = a3;
}

- (PSDataUsageStatisticsCache)statisticsCache
{
  return self->_statisticsCache;
}

- (void)setStatisticsCache:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_statisticsCache, 0);
  objc_storeStrong((id *)&self->_subcategorySpecifiers, 0);
  objc_destroyWeak((id *)&self->_billingPeriodSource);
}

@end