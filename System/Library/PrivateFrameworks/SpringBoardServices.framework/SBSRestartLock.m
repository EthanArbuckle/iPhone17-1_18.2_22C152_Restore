@interface SBSRestartLock
@end

@implementation SBSRestartLock

void ___SBSRestartLock_block_invoke()
{
  id v0 = objc_alloc_init(MEMORY[0x1E4F28FD0]);
  v1 = (void *)__SBSRestartLock;
  __SBSRestartLock = (uint64_t)v0;

  id v2 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
  v3 = (void *)__SBSRestartBlocks;
  __SBSRestartBlocks = (uint64_t)v2;

  __SBSRestartInfo = (uint64_t)CFDictionaryCreateMutable(0, 0, MEMORY[0x1E4F1D048], MEMORY[0x1E4F1D540]);
  DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
  CFNotificationCenterAddObserver(DarwinNotifyCenter, 0, (CFNotificationCallback)_SBSRestarted, @"SBSpringBoardDidLaunchNotification", 0, (CFNotificationSuspensionBehavior)0);
}

@end