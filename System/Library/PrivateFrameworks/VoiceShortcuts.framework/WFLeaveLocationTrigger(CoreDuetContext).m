@interface WFLeaveLocationTrigger(CoreDuetContext)
- (id)contextStorePredicate;
- (uint64_t)contextStoreKeyPathForCurrentState;
- (uint64_t)contextStoreQualityOfService;
@end

@implementation WFLeaveLocationTrigger(CoreDuetContext)

- (uint64_t)contextStoreQualityOfService
{
  return 25;
}

- (id)contextStorePredicate
{
  v1 = [a1 region];
  id v2 = objc_alloc(MEMORY[0x1E4F1E6A0]);
  [v1 center];
  double v4 = v3;
  double v6 = v5;
  [v1 radius];
  double v8 = v7;
  v9 = [v1 identifier];
  v10 = objc_msgSend(v2, "initWithCenter:radius:identifier:", v9, v4, v6, v8);

  if (v10)
  {
    v11 = [MEMORY[0x1E4F5B6B8] predicateForCircularLocationRegion:v10 state:2];
  }
  else
  {
    v11 = 0;
  }

  return v11;
}

- (uint64_t)contextStoreKeyPathForCurrentState
{
  return [MEMORY[0x1E4F5B6B8] keyPathForCircularLocationRegions];
}

@end