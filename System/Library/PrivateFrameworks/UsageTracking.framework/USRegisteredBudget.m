@interface USRegisteredBudget
- (id)queryForInterval:(id)a3;
@end

@implementation USRegisteredBudget

- (id)queryForInterval:(id)a3
{
  id v4 = a3;
  v5 = [(USRegisteredBudget *)self budgetedApplications];
  v6 = [v5 valueForKey:@"bundleIdentifier"];

  v7 = [(USRegisteredBudget *)self budgetedWebDomains];
  v8 = [v7 valueForKey:@"webDomain"];

  v9 = [(USRegisteredBudget *)self budgetedCategories];
  v10 = [v9 valueForKey:@"categoryIdentifier"];

  v11 = [[_TtC18UsageTrackingAgent19DeviceActivityQuery alloc] initWithBundleIdentifiers:v6 categoryIdentifiers:v10 domains:v8 interval:v4];
  return v11;
}

@end