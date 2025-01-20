@interface WFBatteryLevelTrigger(CoreDuetContext)
- (id)contextStorePredicate;
- (uint64_t)contextStoreKeyPathForCurrentState;
- (uint64_t)contextStoreQualityOfService;
@end

@implementation WFBatteryLevelTrigger(CoreDuetContext)

- (uint64_t)contextStoreQualityOfService
{
  return 21;
}

- (id)contextStorePredicate
{
  v3 = [a1 contextStoreKeyPathForCurrentState];
  uint64_t v4 = [a1 selection];
  if (v4 == 2)
  {
    v9 = (void *)MEMORY[0x1E4F5B6E8];
    v10 = (void *)MEMORY[0x1E4F28F60];
    v7 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", objc_msgSend(a1, "level"));
    v8 = [v10 predicateWithFormat:@"SELF.%@.value < %@", v3, v7];
    v11 = (void *)MEMORY[0x1E4F28F60];
    v12 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", objc_msgSend(a1, "level"));
    [v11 predicateWithFormat:@"SELF.value >= %@", v12];
    v15 = LABEL_7:;
    v1 = [v9 predicateForKeyPath:v3 withPredicate:v8 withPredicateForPreviousState:v15 withMinimumDurationInPreviousState:0.0];

    goto LABEL_8;
  }
  if (v4 == 1)
  {
    v9 = (void *)MEMORY[0x1E4F5B6E8];
    v13 = (void *)MEMORY[0x1E4F28F60];
    v7 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", objc_msgSend(a1, "level"));
    v8 = [v13 predicateWithFormat:@"SELF.%@.value > %@", v3, v7];
    v14 = (void *)MEMORY[0x1E4F28F60];
    v12 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", objc_msgSend(a1, "level"));
    [v14 predicateWithFormat:@"SELF.value <= %@", v12];
    goto LABEL_7;
  }
  if (v4) {
    goto LABEL_9;
  }
  v5 = (void *)MEMORY[0x1E4F5B6E8];
  v6 = (void *)MEMORY[0x1E4F28F60];
  v7 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", objc_msgSend(a1, "level"));
  v8 = [v6 predicateWithFormat:@"SELF.%@.value == %@", v3, v7];
  v1 = [v5 predicateForKeyPath:v3 withPredicate:v8];
LABEL_8:

LABEL_9:
  return v1;
}

- (uint64_t)contextStoreKeyPathForCurrentState
{
  return [MEMORY[0x1E4F5B6B8] keyPathForBatteryLevel];
}

@end