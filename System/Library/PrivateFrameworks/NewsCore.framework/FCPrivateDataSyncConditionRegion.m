@interface FCPrivateDataSyncConditionRegion
- (BOOL)isSatisfied;
- (id)description;
@end

@implementation FCPrivateDataSyncConditionRegion

- (BOOL)isSatisfied
{
  return +[FCGeoUtilities isRunningInSupportedRegion];
}

- (id)description
{
  v3 = NSString;
  v4 = +[FCGeoUtilities currentRegion];
  v5 = [v3 stringWithFormat:@"<%p condition=Region, region=%@>", self, v4];

  return v5;
}

@end