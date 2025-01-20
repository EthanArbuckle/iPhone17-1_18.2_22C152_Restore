@interface PSAppCellularUsageSpecifier
+ (id)_specifierWithDisplayName:(id)a3 bundleID:(id)a4 shouldShowUsage:(BOOL)a5 icon:(id)a6 statisticsCache:(id)a7;
+ (id)appSpecifierWithBundleID:(id)a3 name:(id)a4 statisticsCache:(id)a5;
+ (id)systemPolicySpecifierForAppName:(id)a3 bundleID:(id)a4 icon:(id)a5;
+ (void)setIconForSpecifier:(id)a3 bundleID:(id)a4;
- (BOOL)isRestricted;
- (BOOL)shouldShowUsage;
- (NSString)bundleID;
- (PSAppCellularUsageSpecifierDelegate)delegate;
- (PSBillingPeriodSource)billingPeriodSource;
- (PSDataUsageStatisticsCache)statisticsCache;
- (id)cellularUsagePolicy;
- (id)dataUsageString;
- (unint64_t)dataUsage;
- (void)setBillingPeriodSource:(id)a3;
- (void)setBundleID:(id)a3;
- (void)setCellularUsagePolicy:(id)a3;
- (void)setDelegate:(id)a3;
- (void)setShouldShowUsage:(BOOL)a3;
- (void)setStatisticsCache:(id)a3;
@end

@implementation PSAppCellularUsageSpecifier

+ (id)_specifierWithDisplayName:(id)a3 bundleID:(id)a4 shouldShowUsage:(BOOL)a5 icon:(id)a6 statisticsCache:(id)a7
{
  BOOL v8 = a5;
  v11 = (void *)MEMORY[0x263F1C5C0];
  id v12 = a7;
  id v13 = a6;
  id v14 = a4;
  id v15 = a3;
  v16 = [v11 currentDevice];
  int v17 = objc_msgSend(v16, "sf_isChinaRegionCellularDevice");

  v18 = off_2646DEA20;
  if (!v17) {
    v18 = off_2646DEA18;
  }
  v19 = (void *)[objc_alloc(*v18) initWithBundleID:v14 displayName:v15 statisticsCache:v12];

  v20 = [v19 bundleID];
  [v19 setIdentifier:v20];

  [v19 setShouldShowUsage:v8];
  [v19 setProperty:v13 forKey:*MEMORY[0x263F60140]];

  return v19;
}

+ (id)appSpecifierWithBundleID:(id)a3 name:(id)a4 statisticsCache:(id)a5
{
  id v8 = a3;
  v9 = [a1 _specifierWithDisplayName:a4 bundleID:v8 shouldShowUsage:1 icon:0 statisticsCache:a5];
  if (v8) {
    [a1 setIconForSpecifier:v9 bundleID:v8];
  }

  return v9;
}

+ (void)setIconForSpecifier:(id)a3 bundleID:(id)a4
{
  id v12 = a3;
  v5 = (void *)MEMORY[0x263F1CBA0];
  id v6 = a4;
  if ([v5 bundleIdentifierContainsWebClipIdentifier:v6])
  {
    v7 = [MEMORY[0x263F1CBA0] webClipIdentifierFromBundleIdentifier:v6];

    id v8 = [MEMORY[0x263F1CBA0] webClipWithIdentifier:v7];
    v9 = [MEMORY[0x263F1C920] mainScreen];
    [v9 scale];
    v10 = objc_msgSend(v8, "generateIconImageForFormat:scale:", 0);

    if (v10) {
      [v12 setProperty:v10 forKey:*MEMORY[0x263F60140]];
    }
  }
  else
  {
    [v12 setProperty:v6 forKey:*MEMORY[0x263F60188]];

    v11 = [NSNumber numberWithBool:1];
    [v12 setProperty:v11 forKey:*MEMORY[0x263F601A8]];

    v7 = [NSNumber numberWithBool:1];
    [v12 setProperty:v7 forKey:*MEMORY[0x263F60198]];
  }
}

+ (id)systemPolicySpecifierForAppName:(id)a3 bundleID:(id)a4 icon:(id)a5
{
  id v6 = (void *)MEMORY[0x263F1C5C0];
  id v7 = a5;
  id v8 = a4;
  v9 = [v6 currentDevice];
  objc_msgSend(v9, "sf_isChinaRegionCellularDevice");

  v10 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
  v11 = SFLocalizableWAPIStringKeyForKey();
  id v12 = [v10 localizedStringForKey:v11 value:&stru_26D7A1F58 table:@"WirelessData"];

  id v13 = +[PSDataUsageStatisticsCache sharedInstance];
  id v14 = +[PSAppCellularUsageSpecifier _specifierWithDisplayName:v12 bundleID:v8 shouldShowUsage:0 icon:v7 statisticsCache:v13];

  return v14;
}

- (unint64_t)dataUsage
{
  v3 = [(PSAppCellularUsageSpecifier *)self billingPeriodSource];
  statisticsCache = self->_statisticsCache;
  v5 = [(PSAppCellularUsageSpecifier *)self bundleID];
  if (v3) {
    uint64_t v6 = [v3 selectedPeriod];
  }
  else {
    uint64_t v6 = 0;
  }
  id v7 = [(PSDataUsageStatisticsCache *)statisticsCache usageForBundleID:v5 inPeriod:v6];

  id v8 = [v7 native];
  uint64_t v9 = [v8 cellularHome];
  v10 = [v7 native];
  uint64_t v11 = [v10 cellularRoaming] + v9;
  id v12 = [v7 proxied];
  uint64_t v13 = [v12 cellularHome];
  id v14 = [v7 proxied];
  unint64_t v15 = v11 + v13 + [v14 cellularRoaming];

  return v15;
}

- (id)dataUsageString
{
  unint64_t v3 = [(PSAppCellularUsageSpecifier *)self dataUsage];
  if (v3)
  {
    v4 = +[SettingsCellularSharedUtils usageSizeString:(double)v3];
  }
  else
  {
    v4 = 0;
  }
  uint64_t v5 = [(PSAppCellularUsageSpecifier *)self bundleID];
  if (!v5) {
    goto LABEL_8;
  }
  uint64_t v6 = (void *)v5;
  id v7 = +[PSCellularManagementCache sharedInstance];
  id v8 = [(PSAppCellularUsageSpecifier *)self bundleID];
  int v9 = [v7 isManaged:v8];

  if (v9)
  {
    if (v4)
    {
      v10 = NSString;
      uint64_t v11 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
      id v12 = SFLocalizableWAPIStringKeyForKey();
      uint64_t v13 = [v11 localizedStringForKey:v12 value:&stru_26D7A1F58 table:@"WirelessData"];
      objc_msgSend(v10, "stringWithFormat:", v13, v4);
      id v14 = (__CFString *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      int v17 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
      v18 = SFLocalizableWAPIStringKeyForKey();
      id v14 = [v17 localizedStringForKey:v18 value:&stru_26D7A1F58 table:@"WirelessData"];
    }
  }
  else
  {
LABEL_8:
    unint64_t v15 = &stru_26D7A1F58;
    if (v4) {
      unint64_t v15 = v4;
    }
    id v14 = v15;
  }

  return v14;
}

- (id)cellularUsagePolicy
{
  id v2 = [MEMORY[0x263EFF940] exceptionWithName:@"Unimplemented method." reason:@"This method is only implemented by subclasses." userInfo:0];
  objc_exception_throw(v2);
}

- (void)setCellularUsagePolicy:(id)a3
{
  id v3 = a3;
  id v4 = [MEMORY[0x263EFF940] exceptionWithName:@"Unimplemented method." reason:@"This method is only implemented by subclasses." userInfo:0];
  objc_exception_throw(v4);
}

- (BOOL)isRestricted
{
  id v3 = +[PSCellularManagementCache sharedInstance];
  if ([v3 isGlobalDataModificationRestricted])
  {
    char v4 = 1;
  }
  else
  {
    uint64_t v5 = +[PSAppDataUsagePolicyCache sharedInstance];
    uint64_t v6 = [(PSAppCellularUsageSpecifier *)self bundleID];
    id v7 = [v5 policiesFor:v6];
    char v4 = [v7 isRestricted];
  }
  return v4;
}

- (BOOL)shouldShowUsage
{
  return self->_shouldShowUsage;
}

- (void)setShouldShowUsage:(BOOL)a3
{
  self->_shouldShowUsage = a3;
}

- (NSString)bundleID
{
  return self->_bundleID;
}

- (void)setBundleID:(id)a3
{
}

- (PSBillingPeriodSource)billingPeriodSource
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_billingPeriodSource);
  return (PSBillingPeriodSource *)WeakRetained;
}

- (void)setBillingPeriodSource:(id)a3
{
}

- (PSAppCellularUsageSpecifierDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  return (PSAppCellularUsageSpecifierDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
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
  objc_destroyWeak((id *)&self->_delegate);
  objc_destroyWeak((id *)&self->_billingPeriodSource);
  objc_storeStrong((id *)&self->_bundleID, 0);
}

@end