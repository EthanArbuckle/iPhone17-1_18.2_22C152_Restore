@interface OSThermalNotificationSetLevelForBehavior
@end

@implementation OSThermalNotificationSetLevelForBehavior

uint64_t ___OSThermalNotificationSetLevelForBehavior_block_invoke(uint64_t a1)
{
  return notify_register_check(kOSThermalMitigationNames[*(int *)(a1 + 32)], &tokens[*(int *)(a1 + 32)]);
}

uint64_t ___OSThermalNotificationSetLevelForBehavior_block_invoke_2()
{
  return notify_register_check("com.apple.system.thermalmitigation.thermaltableready", &dword_1E911AF20);
}

@end