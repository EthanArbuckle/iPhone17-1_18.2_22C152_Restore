@interface WFBluetoothTrigger(CoreDuetContext)
- (id)contextStorePredicate;
- (uint64_t)contextStoreKeyPathForCurrentState;
- (uint64_t)contextStoreQualityOfService;
@end

@implementation WFBluetoothTrigger(CoreDuetContext)

- (uint64_t)contextStoreQualityOfService
{
  return 25;
}

- (id)contextStorePredicate
{
  v3 = [a1 contextStoreKeyPathForCurrentState];
  uint64_t v4 = [a1 selection];
  if (v4 != 1)
  {
    if (v4) {
      goto LABEL_21;
    }
    if ([a1 onConnect] && objc_msgSend(a1, "onDisconnect"))
    {
      v5 = (void *)MEMORY[0x1E4F5B6E8];
      v16 = v3;
LABEL_9:
      [v5 predicateForKeyPath:v3, @"SELF.%@.value != nil OR SELF.%@.value == nil", v3, v16 withFormat];
      v1 = LABEL_16:;
      goto LABEL_21;
    }
    if ([a1 onConnect])
    {
      [MEMORY[0x1E4F5B6E8] predicateForKeyPath:v3, @"SELF.%@.value != nil", v3, v16 withFormat];
      goto LABEL_16;
    }
    if ([a1 onDisconnect])
    {
      [MEMORY[0x1E4F5B6E8] predicateForKeyPath:v3, @"SELF.%@.value == nil", v3, v16 withFormat];
      goto LABEL_16;
    }
    goto LABEL_20;
  }
  if ([a1 onConnect] && objc_msgSend(a1, "onDisconnect"))
  {
    v5 = (void *)MEMORY[0x1E4F5B6E8];
    goto LABEL_9;
  }
  if ([a1 onConnect])
  {
    v6 = (void *)MEMORY[0x1E4F5B6E8];
    v7 = (void *)MEMORY[0x1E4F28F60];
    v8 = [a1 selectedDevices];
    v9 = [v7 predicateWithFormat:@"SELF.%@.value IN %@", v3, v8];
    v10 = (void *)MEMORY[0x1E4F28F60];
    v11 = [a1 selectedDevices];
    [v10 predicateWithFormat:@"NOT (SELF.value IN %@)", v3, v11];
    v14 = LABEL_19:;
    v1 = [v6 predicateForKeyPath:v3 withPredicate:v9 withPredicateForPreviousState:v14 withMinimumDurationInPreviousState:0.0];

    goto LABEL_21;
  }
  if ([a1 onDisconnect])
  {
    v6 = (void *)MEMORY[0x1E4F5B6E8];
    v12 = (void *)MEMORY[0x1E4F28F60];
    v8 = [a1 selectedDevices];
    v9 = [v12 predicateWithFormat:@"NOT (SELF.%@.value IN %@)", v3, v8];
    v13 = (void *)MEMORY[0x1E4F28F60];
    v11 = [a1 selectedDevices];
    [v13 predicateWithFormat:@"SELF.value IN %@", v3, v11];
    goto LABEL_19;
  }
LABEL_20:
  v1 = 0;
LABEL_21:

  return v1;
}

- (uint64_t)contextStoreKeyPathForCurrentState
{
  return [MEMORY[0x1E4F5B6B8] keyPathForBluetoothDataDictionary];
}

@end