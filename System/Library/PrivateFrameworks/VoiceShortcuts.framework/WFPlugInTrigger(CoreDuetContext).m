@interface WFPlugInTrigger(CoreDuetContext)
- (id)contextStorePredicate;
- (uint64_t)contextStoreKeyPathForCurrentState;
- (uint64_t)contextStoreQualityOfService;
@end

@implementation WFPlugInTrigger(CoreDuetContext)

- (uint64_t)contextStoreQualityOfService
{
  return 25;
}

- (id)contextStorePredicate
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  v2 = objc_opt_new();
  if ([a1 onEnable] && objc_msgSend(a1, "onDisable"))
  {
    [v2 addObject:MEMORY[0x1E4F1CC38]];
    goto LABEL_7;
  }
  if ([a1 onEnable])
  {
    uint64_t v3 = MEMORY[0x1E4F1CC38];
LABEL_8:
    [v2 addObject:v3];
    goto LABEL_9;
  }
  if ([a1 onDisable])
  {
LABEL_7:
    uint64_t v3 = MEMORY[0x1E4F1CC28];
    goto LABEL_8;
  }
  v7 = getWFTriggersLogObject();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_FAULT))
  {
    *(_DWORD *)buf = 136315394;
    v9 = "-[WFPlugInTrigger(CoreDuetContext) contextStorePredicate]";
    __int16 v10 = 2114;
    v11 = a1;
    _os_log_impl(&dword_1C7D7E000, v7, OS_LOG_TYPE_FAULT, "%s Invalid config for %{public}@", buf, 0x16u);
  }

LABEL_9:
  v4 = [a1 contextStoreKeyPathForCurrentState];
  v5 = [MEMORY[0x1E4F5B6E8] predicateForKeyPath:v4, @"SELF.%@.value IN %@", v4, v2 withFormat];

  return v5;
}

- (uint64_t)contextStoreKeyPathForCurrentState
{
  return [MEMORY[0x1E4F5B6B8] keyPathForPluginStatus];
}

@end