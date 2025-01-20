@interface WFTrigger(CoreDuetContext)
- (uint64_t)contextStoreQualityOfService;
- (uint64_t)contextStoreRegistrationIsForWatch;
- (uint64_t)needsRegistrationAfterFiring;
- (uint64_t)shouldFireTriggerWithEventInfo:()CoreDuetContext error:;
- (void)contextStoreKeyPathForCurrentState;
- (void)contextStorePredicate;
@end

@implementation WFTrigger(CoreDuetContext)

- (uint64_t)needsRegistrationAfterFiring
{
  return 0;
}

- (uint64_t)shouldFireTriggerWithEventInfo:()CoreDuetContext error:
{
  return 1;
}

- (uint64_t)contextStoreRegistrationIsForWatch
{
  return 0;
}

- (uint64_t)contextStoreQualityOfService
{
  return 21;
}

- (void)contextStorePredicate
{
  v0 = getWFTriggersLogObject();
  if (os_log_type_enabled(v0, OS_LOG_TYPE_ERROR))
  {
    v1 = (objc_class *)objc_opt_class();
    v2 = NSStringFromClass(v1);
    int v3 = 136315394;
    v4 = "-[WFTrigger(CoreDuetContext) contextStorePredicate]";
    __int16 v5 = 2112;
    v6 = v2;
    _os_log_impl(&dword_1C7D7E000, v0, OS_LOG_TYPE_ERROR, "%s Subclass MUST override, but %@ didn't", (uint8_t *)&v3, 0x16u);
  }
  __break(1u);
}

- (void)contextStoreKeyPathForCurrentState
{
  v0 = getWFTriggersLogObject();
  if (os_log_type_enabled(v0, OS_LOG_TYPE_ERROR))
  {
    v1 = (objc_class *)objc_opt_class();
    v2 = NSStringFromClass(v1);
    int v3 = 136315394;
    v4 = "-[WFTrigger(CoreDuetContext) contextStoreKeyPathForCurrentState]";
    __int16 v5 = 2112;
    v6 = v2;
    _os_log_impl(&dword_1C7D7E000, v0, OS_LOG_TYPE_ERROR, "%s Subclass MUST override, but %@ didn't", (uint8_t *)&v3, 0x16u);
  }
  __break(1u);
}

@end