@interface PSAppDataUsagePolicyTernaryControlSpecifier
- (NSString)displayName;
- (PSAppDataUsagePolicyTernaryControlSpecifier)initWithBundleID:(id)a3 displayName:(id)a4 statisticsCache:(id)a5;
- (id)cellularUsagePolicy;
- (void)finishInitializing:(unint64_t)a3;
- (void)setCellularUsagePolicy:(id)a3;
- (void)setDisplayName:(id)a3;
@end

@implementation PSAppDataUsagePolicyTernaryControlSpecifier

- (PSAppDataUsagePolicyTernaryControlSpecifier)initWithBundleID:(id)a3 displayName:(id)a4 statisticsCache:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  uint64_t v11 = objc_opt_class();
  v15.receiver = self;
  v15.super_class = (Class)PSAppDataUsagePolicyTernaryControlSpecifier;
  v12 = [(PSAppDataUsagePolicyTernaryControlSpecifier *)&v15 initWithName:v9 target:self set:sel_setCellularUsagePolicy_ get:sel_cellularUsagePolicy detail:v11 cell:2 edit:0];
  v13 = v12;
  if (v12)
  {
    [(PSAppCellularUsageSpecifier *)v12 setStatisticsCache:v10];
    [(PSAppCellularUsageSpecifier *)v13 setBundleID:v8];
    [(PSAppDataUsagePolicyTernaryControlSpecifier *)v13 setDisplayName:v9];
    [(PSAppDataUsagePolicyTernaryControlSpecifier *)v13 setProperty:objc_opt_class() forKey:*MEMORY[0x263F5FFE0]];
    [(PSAppDataUsagePolicyTernaryControlSpecifier *)v13 finishInitializing:3];
    v13->_fullyInitialized = 0;
  }

  return v13;
}

- (void)finishInitializing:(unint64_t)a3
{
  BOOL v5 = [(PSAppCellularUsageSpecifier *)self isRestricted];
  if (a3 == 3 || !v5)
  {
    id v39 = [MEMORY[0x263EFF980] arrayWithCapacity:3];
    v21 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
    v22 = SFLocalizableWAPIStringKeyForKey();
    v23 = [v21 localizedStringForKey:v22 value:&stru_26D7A1F58 table:@"WirelessData"];
    [v39 addObject:v23];

    v24 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
    v25 = SFLocalizableWAPIStringKeyForKey();
    v26 = [v24 localizedStringForKey:v25 value:&stru_26D7A1F58 table:@"WirelessData"];
    [v39 addObject:v26];

    v27 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
    v28 = SFLocalizableWAPIStringKeyForKey();
    v29 = [v27 localizedStringForKey:v28 value:&stru_26D7A1F58 table:@"WirelessData"];
    [v39 addObject:v29];

    v12 = [MEMORY[0x263EFF980] arrayWithCapacity:3];
    v30 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
    v31 = SFLocalizableWAPIStringKeyForKey();
    v32 = [v30 localizedStringForKey:v31 value:&stru_26D7A1F58 table:@"WirelessData"];
    [v12 addObject:v32];

    v33 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
    v34 = SFLocalizableWAPIStringKeyForKey();
    v35 = [v33 localizedStringForKey:v34 value:&stru_26D7A1F58 table:@"WirelessData"];
    [v12 addObject:v35];

    v36 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
    v37 = SFLocalizableWAPIStringKeyForKey();
    v38 = [v36 localizedStringForKey:v37 value:&stru_26D7A1F58 table:@"WirelessData"];
    [v12 addObject:v38];

    v19 = [MEMORY[0x263EFF980] arrayWithCapacity:3];
    [v19 addObject:&unk_26D7A3E98];
    [v19 addObject:&unk_26D7A3EB0];
    v20 = &unk_26D7A3EC8;
  }
  else
  {
    id v39 = [MEMORY[0x263EFF980] arrayWithCapacity:2];
    v6 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
    v7 = SFLocalizableWAPIStringKeyForKey();
    id v8 = [v6 localizedStringForKey:v7 value:&stru_26D7A1F58 table:@"WirelessData"];
    [v39 addObject:v8];

    id v9 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
    id v10 = SFLocalizableWAPIStringKeyForKey();
    uint64_t v11 = [v9 localizedStringForKey:v10 value:&stru_26D7A1F58 table:@"WirelessData"];
    [v39 addObject:v11];

    v12 = [MEMORY[0x263EFF980] arrayWithCapacity:2];
    v13 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
    v14 = SFLocalizableWAPIStringKeyForKey();
    objc_super v15 = [v13 localizedStringForKey:v14 value:&stru_26D7A1F58 table:@"WirelessData"];
    [v12 addObject:v15];

    v16 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
    v17 = SFLocalizableWAPIStringKeyForKey();
    v18 = [v16 localizedStringForKey:v17 value:&stru_26D7A1F58 table:@"WirelessData"];
    [v12 addObject:v18];

    v19 = [MEMORY[0x263EFF980] arrayWithCapacity:2];
    [v19 addObject:&unk_26D7A3E98];
    v20 = &unk_26D7A3EB0;
  }
  [v19 addObject:v20];
  [(PSAppDataUsagePolicyTernaryControlSpecifier *)self setValues:v19 titles:v39 shortTitles:v12];
}

- (id)cellularUsagePolicy
{
  v3 = objc_msgSend(NSNumber, "numberWithInt:", -[PSAppCellularUsageSpecifier isRestricted](self, "isRestricted") ^ 1);
  uint64_t v4 = *MEMORY[0x263F600A8];
  [(PSAppDataUsagePolicyTernaryControlSpecifier *)self setProperty:v3 forKey:*MEMORY[0x263F600A8]];

  BOOL v5 = +[PSAppDataUsagePolicyCache sharedInstance];
  v6 = [(PSAppCellularUsageSpecifier *)self bundleID];
  v7 = [v5 policiesFor:v6];

  if (!v7) {
    [(PSAppDataUsagePolicyTernaryControlSpecifier *)self setProperty:MEMORY[0x263EFFA80] forKey:v4];
  }
  uint64_t v8 = [v7 wifi] != 0;
  if ([v7 cellular]) {
    v8 |= 2uLL;
  }
  if (!self->_fullyInitialized)
  {
    [(PSAppDataUsagePolicyTernaryControlSpecifier *)self finishInitializing:v8];
    self->_fullyInitialized = 1;
  }
  id v9 = [NSNumber numberWithInteger:v8];

  return v9;
}

- (void)setCellularUsagePolicy:(id)a3
{
  id v4 = a3;
  BOOL v5 = +[PSAppDataUsagePolicyCache sharedInstance];
  v6 = [(PSAppCellularUsageSpecifier *)self bundleID];
  v7 = [v5 policiesFor:v6];

  if (v7)
  {
    unint64_t v8 = [v4 unsignedIntegerValue];
    char v9 = v8;
    [v7 setCellular:(v8 >> 1) & 1];
    [v7 setWifi:v9 & 1];
    id v10 = +[PSAppDataUsagePolicyCache sharedInstance];
    v11[0] = MEMORY[0x263EF8330];
    v11[1] = 3221225472;
    v11[2] = __70__PSAppDataUsagePolicyTernaryControlSpecifier_setCellularUsagePolicy___block_invoke;
    v11[3] = &unk_2646DEBF8;
    v11[4] = self;
    [v10 setPolicies:v7 completion:v11];
  }
  else
  {
    id v10 = [(PSAppCellularUsageSpecifier *)self delegate];
    [v10 didFailToSetPolicyForSpecifier:self];
  }
}

void __70__PSAppDataUsagePolicyTernaryControlSpecifier_setCellularUsagePolicy___block_invoke(uint64_t a1, uint64_t a2)
{
  if (a2)
  {
    id v3 = [*(id *)(a1 + 32) delegate];
    [v3 didFailToSetPolicyForSpecifier:*(void *)(a1 + 32)];
  }
}

- (NSString)displayName
{
  return self->_displayName;
}

- (void)setDisplayName:(id)a3
{
}

- (void).cxx_destruct
{
}

@end