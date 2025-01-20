@interface PSAppDataUsagePolicySwitchSpecifier
- (PSAppDataUsagePolicySwitchSpecifier)initWithBundleID:(id)a3 displayName:(id)a4 statisticsCache:(id)a5;
- (id)cellularUsagePolicy;
- (void)setCellularUsagePolicy:(id)a3;
- (void)setShouldShowUsage:(BOOL)a3;
@end

@implementation PSAppDataUsagePolicySwitchSpecifier

- (PSAppDataUsagePolicySwitchSpecifier)initWithBundleID:(id)a3 displayName:(id)a4 statisticsCache:(id)a5
{
  id v8 = a3;
  id v9 = a5;
  v13.receiver = self;
  v13.super_class = (Class)PSAppDataUsagePolicySwitchSpecifier;
  v10 = [(PSAppDataUsagePolicySwitchSpecifier *)&v13 initWithName:a4 target:self set:sel_setCellularUsagePolicy_ get:sel_cellularUsagePolicy detail:0 cell:6 edit:0];
  v11 = v10;
  if (v10)
  {
    [(PSAppCellularUsageSpecifier *)v10 setStatisticsCache:v9];
    [(PSAppCellularUsageSpecifier *)v11 setBundleID:v8];
  }

  return v11;
}

- (void)setShouldShowUsage:(BOOL)a3
{
  if (a3)
  {
    uint64_t v4 = objc_opt_class();
    uint64_t v5 = *MEMORY[0x263F5FFE0];
    [(PSAppDataUsagePolicySwitchSpecifier *)self setProperty:v4 forKey:v5];
  }
  else
  {
    uint64_t v6 = *MEMORY[0x263F5FFE0];
    [(PSAppDataUsagePolicySwitchSpecifier *)self removePropertyForKey:v6];
  }
}

- (id)cellularUsagePolicy
{
  v3 = objc_msgSend(NSNumber, "numberWithInt:", -[PSAppCellularUsageSpecifier isRestricted](self, "isRestricted") ^ 1);
  uint64_t v4 = *MEMORY[0x263F600A8];
  [(PSAppDataUsagePolicySwitchSpecifier *)self setProperty:v3 forKey:*MEMORY[0x263F600A8]];

  uint64_t v5 = +[PSAppDataUsagePolicyCache sharedInstance];
  uint64_t v6 = [(PSAppCellularUsageSpecifier *)self bundleID];
  v7 = [v5 policiesFor:v6];

  if (v7)
  {
    id v8 = objc_msgSend(NSNumber, "numberWithBool:", objc_msgSend(v7, "cellular") != 0);
  }
  else
  {
    [(PSAppDataUsagePolicySwitchSpecifier *)self setProperty:MEMORY[0x263EFFA80] forKey:v4];
    id v8 = &unk_26D7A3E80;
  }

  return v8;
}

- (void)setCellularUsagePolicy:(id)a3
{
  id v4 = a3;
  uint64_t v5 = +[PSAppDataUsagePolicyCache sharedInstance];
  uint64_t v6 = [(PSAppCellularUsageSpecifier *)self bundleID];
  v7 = [v5 policiesFor:v6];

  if (v7)
  {
    objc_msgSend(v7, "setCellular:", objc_msgSend(v4, "integerValue"));
    id v8 = +[PSAppDataUsagePolicyCache sharedInstance];
    v11[0] = MEMORY[0x263EF8330];
    v11[1] = 3221225472;
    v11[2] = __62__PSAppDataUsagePolicySwitchSpecifier_setCellularUsagePolicy___block_invoke;
    v11[3] = &unk_2646DEBF8;
    v11[4] = self;
    [v8 setPolicies:v7 completion:v11];
LABEL_5:

    goto LABEL_6;
  }
  id v9 = [(PSAppCellularUsageSpecifier *)self delegate];
  char v10 = objc_opt_respondsToSelector();

  if (v10)
  {
    id v8 = [(PSAppCellularUsageSpecifier *)self delegate];
    [v8 didFailToSetPolicyForSpecifier:self];
    goto LABEL_5;
  }
  if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR))
  {
    *(_WORD *)buf = 0;
    _os_log_error_impl(&dword_2247E9000, &_os_log_internal, OS_LOG_TYPE_ERROR, "Delegate does respond to didFailToSetPolicyForSpecifier:", buf, 2u);
  }
LABEL_6:
}

void __62__PSAppDataUsagePolicySwitchSpecifier_setCellularUsagePolicy___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  if (v3)
  {
    id v4 = [*(id *)(a1 + 32) delegate];
    char v5 = objc_opt_respondsToSelector();

    if (v5)
    {
      uint64_t v6 = [*(id *)(a1 + 32) delegate];
      [v6 didFailToSetPolicyForSpecifier:*(void *)(a1 + 32)];
    }
    else if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)v7 = 0;
      _os_log_error_impl(&dword_2247E9000, &_os_log_internal, OS_LOG_TYPE_ERROR, "Delegate does respond to didFailToSetPolicyForSpecifier:", v7, 2u);
    }
  }
}

@end