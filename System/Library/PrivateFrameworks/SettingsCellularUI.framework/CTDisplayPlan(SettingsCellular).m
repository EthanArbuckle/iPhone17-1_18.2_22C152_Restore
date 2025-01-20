@interface CTDisplayPlan(SettingsCellular)
- (BOOL)isAddOnPurchasablePlan;
- (BOOL)isPendingInstallPlan;
@end

@implementation CTDisplayPlan(SettingsCellular)

- (BOOL)isPendingInstallPlan
{
  return [a1 status] == 1;
}

- (BOOL)isAddOnPurchasablePlan
{
  return [a1 status] == 11;
}

@end