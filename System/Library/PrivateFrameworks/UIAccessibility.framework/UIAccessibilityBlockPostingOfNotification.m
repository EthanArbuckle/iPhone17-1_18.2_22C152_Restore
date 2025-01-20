@interface UIAccessibilityBlockPostingOfNotification
@end

@implementation UIAccessibilityBlockPostingOfNotification

uint64_t ___UIAccessibilityBlockPostingOfNotification_block_invoke()
{
  _BlockNotificationsLock = (uint64_t)objc_alloc_init(MEMORY[0x1E4F28E08]);

  return MEMORY[0x1F41817F8]();
}

@end