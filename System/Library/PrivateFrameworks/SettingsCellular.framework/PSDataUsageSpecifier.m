@interface PSDataUsageSpecifier
- (NSString)bundleID;
- (PSBillingPeriodSource)billingPeriodSource;
- (PSDataUsageSpecifier)initWithType:(unint64_t)a3 bundleID:(id)a4 name:(id)a5 statisticsCache:(id)a6;
- (PSDataUsageStatisticsCache)statisticsCache;
- (id)dataUsageString;
- (unint64_t)dataUsage;
- (unint64_t)type;
- (void)setBillingPeriodSource:(id)a3;
- (void)setBundleID:(id)a3;
- (void)setStatisticsCache:(id)a3;
- (void)setType:(unint64_t)a3;
@end

@implementation PSDataUsageSpecifier

- (PSDataUsageSpecifier)initWithType:(unint64_t)a3 bundleID:(id)a4 name:(id)a5 statisticsCache:(id)a6
{
  id v11 = a4;
  id v12 = a5;
  id v13 = a6;
  if (a3 == 4 && [v12 isEqualToString:@"Others"])
  {
    v14 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
    v15 = SFLocalizableWAPIStringKeyForKey();
    uint64_t v16 = [v14 localizedStringForKey:v15 value:&stru_26D7A1F58 table:@"WirelessData"];

    id v12 = (id)v16;
  }
  v22.receiver = self;
  v22.super_class = (Class)PSDataUsageSpecifier;
  v17 = [(PSDataUsageSpecifier *)&v22 initWithName:v12 target:0 set:0 get:0 detail:0 cell:4 edit:0];
  v18 = v17;
  if (v17)
  {
    [(PSDataUsageSpecifier *)v17 setTarget:v17];
    *(Class *)((char *)&v18->super.super.isa + (int)*MEMORY[0x263F5FE28]) = (Class)sel_dataUsageString;
    objc_storeStrong((id *)&v18->_statisticsCache, a6);
    objc_storeStrong((id *)&v18->_bundleID, a4);
    v18->_type = a3;
    [(PSDataUsageSpecifier *)v18 setProperty:MEMORY[0x263EFFA88] forKey:*MEMORY[0x263F601F8]];
    v19 = [MEMORY[0x263F1C5C0] currentDevice];
    int v20 = objc_msgSend(v19, "sf_isChinaRegionCellularDevice");

    if (v20) {
      [(PSDataUsageSpecifier *)v18 setProperty:objc_opt_class() forKey:*MEMORY[0x263F5FFE0]];
    }
  }

  return v18;
}

- (unint64_t)dataUsage
{
  v3 = [(PSDataUsageSpecifier *)self billingPeriodSource];
  v4 = v3;
  statisticsCache = self->_statisticsCache;
  bundleID = self->_bundleID;
  if (v3) {
    uint64_t v7 = [v3 selectedPeriod];
  }
  else {
    uint64_t v7 = 0;
  }
  v8 = [(PSDataUsageStatisticsCache *)statisticsCache usageForBundleID:bundleID inPeriod:v7];
  v9 = v8;
  if (self->_type == 4)
  {
    v10 = self->_statisticsCache;
    id v11 = self->_bundleID;
    if (v4) {
      uint64_t v12 = [v4 selectedPeriod];
    }
    else {
      uint64_t v12 = 0;
    }
    unint64_t v20 = [(PSDataUsageStatisticsCache *)v10 usageForHotspotClientID:v11 inPeriod:v12];
  }
  else
  {
    id v13 = [v8 native];
    uint64_t v14 = [v13 cellularHome];
    v15 = [v9 native];
    uint64_t v16 = [v15 cellularRoaming] + v14;
    v17 = [v9 proxied];
    uint64_t v18 = [v17 cellularHome];
    v19 = [v9 proxied];
    unint64_t v20 = v16 + v18 + [v19 cellularRoaming];
  }
  return v20;
}

- (id)dataUsageString
{
  unint64_t v3 = [(PSDataUsageSpecifier *)self dataUsage];
  if (v3)
  {
    v4 = +[SettingsCellularSharedUtils usageSizeString:(double)v3];
  }
  else
  {
    v4 = 0;
  }
  if (self->_bundleID
    && (+[PSCellularManagementCache sharedInstance],
        v5 = objc_claimAutoreleasedReturnValue(),
        int v6 = [v5 isManaged:self->_bundleID],
        v5,
        v6))
  {
    if (v4)
    {
      uint64_t v7 = NSString;
      v8 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
      v9 = SFLocalizableWAPIStringKeyForKey();
      v10 = [v8 localizedStringForKey:v9 value:&stru_26D7A1F58 table:@"WirelessData"];
      objc_msgSend(v7, "stringWithFormat:", v10, v4);
      id v11 = (__CFString *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      uint64_t v14 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
      v15 = SFLocalizableWAPIStringKeyForKey();
      id v11 = [v14 localizedStringForKey:v15 value:&stru_26D7A1F58 table:@"WirelessData"];
    }
  }
  else
  {
    uint64_t v12 = &stru_26D7A1F58;
    if (v4) {
      uint64_t v12 = v4;
    }
    id v11 = v12;
  }

  return v11;
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

- (NSString)bundleID
{
  return self->_bundleID;
}

- (void)setBundleID:(id)a3
{
}

- (unint64_t)type
{
  return self->_type;
}

- (void)setType:(unint64_t)a3
{
  self->_type = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_bundleID, 0);
  objc_storeStrong((id *)&self->_statisticsCache, 0);
  objc_destroyWeak((id *)&self->_billingPeriodSource);
}

@end