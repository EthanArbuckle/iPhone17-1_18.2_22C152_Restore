@interface WFMessageTrigger(CoreDuetContext)
- (id)contextStorePredicate;
- (uint64_t)contextStoreKeyPathForCurrentState;
- (uint64_t)contextStoreQualityOfService;
@end

@implementation WFMessageTrigger(CoreDuetContext)

- (uint64_t)contextStoreQualityOfService
{
  return 25;
}

- (id)contextStorePredicate
{
  v2 = [a1 contextStoreKeyPathForCurrentState];
  v3 = (void *)MEMORY[0x1E4F5B6E8];
  v4 = [a1 selectedContents];
  v5 = [MEMORY[0x1E4F5B6B8] contentKey];
  v6 = [a1 selectedContents];
  v7 = [a1 selectedSendersStrings];
  v8 = [a1 selectedSendersStrings];
  v9 = [a1 selectedSendersStrings];
  v10 = [MEMORY[0x1E4F5B6B8] senderHandlesKey];
  v11 = [MEMORY[0x1E4F5B6B8] senderContactIDKey];
  v12 = [v3 predicateForKeyPath:v2, @"SUBQUERY(SELF.%@.value, $message, (%@ = NULL OR $message.%K CONTAINS[cd] %@) AND                 (%@ = NULL OR %@.@count = 0 OR SUBQUERY(%@, $sender, $sender IN[cd] $message.%K OR $message.%K = $sender).@count > 0)            ).@count > 0", v2, v4, v5, v6, v7, v8, v9, v10, v11 withFormat];

  [v12 setEvaluateOnEveryKeyPathUpdate:1];
  return v12;
}

- (uint64_t)contextStoreKeyPathForCurrentState
{
  return [MEMORY[0x1E4F5B6B8] keyPathForRecentMessages];
}

@end