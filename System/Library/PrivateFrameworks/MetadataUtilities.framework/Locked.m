@interface Locked
@end

@implementation Locked

void __rescheduleAutomaticCooldown_Locked_block_invoke()
{
  LocalCenter = CFNotificationCenterGetLocalCenter();
  v1 = (const void *)gQueryParser;

  CFNotificationCenterAddObserver(LocalCenter, v1, (CFNotificationCallback)handleDidEnterBackgroundNotification, @"UIApplicationDidEnterBackgroundNotification", 0, CFNotificationSuspensionBehaviorDeliverImmediately);
}

uint64_t __rescheduleAutomaticCooldown_Locked_block_invoke_2()
{
  uint64_t v3 = *MEMORY[0x1E4F143B8];
  if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT))
  {
    int v1 = 134217984;
    uint64_t v2 = 0x405E000000000000;
    _os_log_impl(&dword_1A334F000, MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT, "[automatic cooldown] cooling down QP after %.0fs of idle time", (uint8_t *)&v1, 0xCu);
  }
  __MDQueryParserCooldown();
  pthread_mutex_lock(&gQueryParserLock);
  if (gQueryParserAutomaticCoolDownBlock)
  {
    _Block_release((const void *)gQueryParserAutomaticCoolDownBlock);
    gQueryParserAutomaticCoolDownBlock = 0;
  }
  return pthread_mutex_unlock(&gQueryParserLock);
}

@end