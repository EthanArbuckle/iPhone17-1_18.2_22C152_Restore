@interface OSThermalNotificationLevelForBehavior
@end

@implementation OSThermalNotificationLevelForBehavior

uint64_t ___OSThermalNotificationLevelForBehavior_block_invoke(uint64_t a1)
{
  return notify_register_check(kOSThermalMitigationNames[*(int *)(a1 + 32)], &tokens[*(int *)(a1 + 32)]);
}

@end