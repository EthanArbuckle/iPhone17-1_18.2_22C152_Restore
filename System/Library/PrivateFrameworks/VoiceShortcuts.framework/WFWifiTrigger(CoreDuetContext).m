@interface WFWifiTrigger(CoreDuetContext)
- (id)contextStorePredicate;
- (uint64_t)contextStoreKeyPathForCurrentState;
- (uint64_t)contextStoreQualityOfService;
@end

@implementation WFWifiTrigger(CoreDuetContext)

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
      goto LABEL_20;
    }
    if ([a1 onConnect] && objc_msgSend(a1, "onDisconnect"))
    {
      [MEMORY[0x1E4F5B6E8] predicateForKeyPath:v3, @"SELF.%@.value != nil OR SELF.%@.value == nil", v3, v3 withFormat];
      v1 = LABEL_15:;
      goto LABEL_20;
    }
    if ([a1 onConnect])
    {
      [MEMORY[0x1E4F5B6E8] predicateForKeyPath:v3, @"SELF.%@.value != nil", v3, v24 withFormat];
      goto LABEL_15;
    }
    if ([a1 onDisconnect])
    {
      [MEMORY[0x1E4F5B6E8] predicateForKeyPath:v3, @"SELF.%@.value == nil", v3, v24 withFormat];
      goto LABEL_15;
    }
    goto LABEL_19;
  }
  if ([a1 onConnect] && objc_msgSend(a1, "onDisconnect"))
  {
    v5 = (void *)MEMORY[0x1E4F5B6E8];
    v6 = (void *)MEMORY[0x1E4F28F60];
    v7 = [a1 selectedNetworks];
    v8 = [a1 selectedNetworks];
    v9 = [v6 predicateWithFormat:@"SELF.%@.value IN %@ OR NOT (SELF.%@.value in %@)", v3, v7, v3, v8];
    v10 = (void *)MEMORY[0x1E4F28F60];
    v11 = [a1 selectedNetworks];
    v12 = [a1 selectedNetworks];
    v13 = [v10 predicateWithFormat:@"NOT (SELF.value IN %@) OR SELF.value IN %@", v3, v11, v3, v12];
    v1 = [v5 predicateForKeyPath:v3 withPredicate:v9 withPredicateForPreviousState:v13 withMinimumDurationInPreviousState:0.0];

    goto LABEL_20;
  }
  if ([a1 onConnect])
  {
    v14 = (void *)MEMORY[0x1E4F5B6E8];
    v15 = (void *)MEMORY[0x1E4F28F60];
    v16 = [a1 selectedNetworks];
    v17 = [v15 predicateWithFormat:@"SELF.%@.value IN %@", v3, v16];
    v18 = (void *)MEMORY[0x1E4F28F60];
    v19 = [a1 selectedNetworks];
    [v18 predicateWithFormat:@"NOT (SELF.value IN %@)", v3, v19];
    v22 = LABEL_18:;
    v1 = [v14 predicateForKeyPath:v3 withPredicate:v17 withPredicateForPreviousState:v22 withMinimumDurationInPreviousState:0.0];

    goto LABEL_20;
  }
  if ([a1 onDisconnect])
  {
    v14 = (void *)MEMORY[0x1E4F5B6E8];
    v20 = (void *)MEMORY[0x1E4F28F60];
    v16 = [a1 selectedNetworks];
    v17 = [v20 predicateWithFormat:@"NOT (SELF.%@.value IN %@)", v3, v16];
    v21 = (void *)MEMORY[0x1E4F28F60];
    v19 = [a1 selectedNetworks];
    [v21 predicateWithFormat:@"SELF.value IN %@", v3, v19];
    goto LABEL_18;
  }
LABEL_19:
  v1 = 0;
LABEL_20:

  return v1;
}

- (uint64_t)contextStoreKeyPathForCurrentState
{
  return [MEMORY[0x1E4F5B6B8] keyPathForWiFiConnectionSSID];
}

@end