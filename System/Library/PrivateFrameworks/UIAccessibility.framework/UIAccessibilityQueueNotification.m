@interface UIAccessibilityQueueNotification
@end

@implementation UIAccessibilityQueueNotification

uint64_t ___UIAccessibilityQueueNotification_block_invoke()
{
  _QueuedNotificationsLock = (uint64_t)objc_alloc_init(MEMORY[0x1E4F28E08]);

  return MEMORY[0x1F41817F8]();
}

@end