@interface WFSleepTrigger(CoreDuetContext)
- (id)contextStorePredicate;
- (uint64_t)contextStoreKeyPathForCurrentState;
- (uint64_t)contextStoreQualityOfService;
@end

@implementation WFSleepTrigger(CoreDuetContext)

- (uint64_t)contextStoreQualityOfService
{
  return 25;
}

- (id)contextStorePredicate
{
  v2 = [a1 contextStoreKeyPathForCurrentState];
  uint64_t v3 = [a1 selection];
  switch(v3)
  {
    case 2:
      v4 = (void *)MEMORY[0x1E4F5B6E8];
      v5 = [MEMORY[0x1E4F28F60] predicateWithFormat:@"SELF.%@.value.%K = %@ OR SELF.%@.value.%K = %@", v2, @"sleepScheduleState", &unk_1F22705B0, v2, @"sleepScheduleState", &unk_1F22705B0];
      [MEMORY[0x1E4F28F60] predicateWithFormat:@"SELF.value.%K = %@ OR SELF.value.%K = %@", @"sleepScheduleState", &unk_1F22705C8, @"sleepScheduleState", &unk_1F2270628];
      goto LABEL_7;
    case 1:
      v4 = (void *)MEMORY[0x1E4F5B6E8];
      v5 = [MEMORY[0x1E4F28F60] predicateWithFormat:@"SELF.%@.value.%K = %@", v2, @"sleepModeState", &unk_1F22705C8];
      [MEMORY[0x1E4F28F60] predicateWithFormat:@"SELF.value.%K != %@", @"sleepModeState", &unk_1F22705C8, v9, v10];
      goto LABEL_7;
    case 0:
      v4 = (void *)MEMORY[0x1E4F5B6E8];
      v5 = [MEMORY[0x1E4F28F60] predicateWithFormat:@"SELF.%@.value.%K = %@ AND SELF.%@.value.%K = %@", v2, @"sleepModeState", &unk_1F22705B0, v2, @"sleepModeState", &unk_1F22705B0];
      [MEMORY[0x1E4F28F60] predicateWithFormat:@"SELF.value.%K != %@ AND SELF.value.%K != %@", @"sleepModeState", &unk_1F22705B0, @"sleepModeState", &unk_1F22705C8];
      v6 = LABEL_7:;
      v7 = [v4 predicateForKeyPath:v2 withPredicate:v5 withPredicateForPreviousState:v6 withMinimumDurationInPreviousState:0.0];

      goto LABEL_9;
  }
  v7 = 0;
LABEL_9:

  return v7;
}

- (uint64_t)contextStoreKeyPathForCurrentState
{
  return [MEMORY[0x1E4F5B6E0] keyPathWithKey:@"/system/currentSleepState"];
}

@end