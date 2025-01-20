@interface WFNFCTrigger(CoreDuetContext)
- (id)contextStorePredicate;
- (uint64_t)contextStoreKeyPathForCurrentState;
- (uint64_t)contextStoreQualityOfService;
@end

@implementation WFNFCTrigger(CoreDuetContext)

- (uint64_t)contextStoreQualityOfService
{
  return 25;
}

- (id)contextStorePredicate
{
  v2 = [a1 contextStoreKeyPathForCurrentState];
  v3 = (void *)MEMORY[0x1E4F5B6E8];
  v4 = [a1 tagIdentifier];
  v5 = [v3 predicateForKeyPath:v2, @"%@ IN SELF.%@.value", v4, v2 withFormat];

  [v5 setEvaluateOnEveryKeyPathUpdate:1];
  return v5;
}

- (uint64_t)contextStoreKeyPathForCurrentState
{
  return [MEMORY[0x1E4F5B6B8] keyPathForNFCTagIdentifiers];
}

@end