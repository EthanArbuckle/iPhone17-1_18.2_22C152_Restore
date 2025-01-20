@interface RERegisterForLockedStatusChangeIfNecessary
@end

@implementation RERegisterForLockedStatusChangeIfNecessary

uint64_t ___RERegisterForLockedStatusChangeIfNecessary_block_invoke()
{
  return notify_register_dispatch("com.apple.mobile.keybagd.lock_status", (int *)&_RERegisterForLockedStatusChangeIfNecessary_notifyToken, MEMORY[0x263EF83A0], &__block_literal_global_106);
}

void ___RERegisterForLockedStatusChangeIfNecessary_block_invoke_2()
{
  v0 = RELogForDomain(0);
  if (os_log_type_enabled(v0, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v2 = 0;
    _os_log_impl(&dword_21E6E6000, v0, OS_LOG_TYPE_DEFAULT, "post REDeviceLockStateChangedNotification", v2, 2u);
  }

  v1 = [MEMORY[0x263F08A00] defaultCenter];
  [v1 postNotificationName:@"REDeviceLockStateChangedNotification" object:0];
}

@end