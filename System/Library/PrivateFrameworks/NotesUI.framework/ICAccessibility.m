@interface ICAccessibility
+ (id)sharedInstance;
- (BOOL)needsAccessibilityElements;
- (void)postAnnouncement:(id)a3 withSender:(id)a4 priority:(int64_t)a5;
@end

@implementation ICAccessibility

- (BOOL)needsAccessibilityElements
{
  return UIAccessibilityIsVoiceOverRunning()
      || UIAccessibilityIsSwitchControlRunning()
      || _AXSCommandAndControlEnabled()
      || _AXSFullKeyboardAccessEnabled() != 0;
}

+ (id)sharedInstance
{
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __33__ICAccessibility_sharedInstance__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (sharedInstance__ICAccessibilitySharedInstanceOnceToken != -1) {
    dispatch_once(&sharedInstance__ICAccessibilitySharedInstanceOnceToken, block);
  }
  v2 = (void *)sharedInstance__ICAccessibilitySharedInstance;
  return v2;
}

uint64_t __33__ICAccessibility_sharedInstance__block_invoke()
{
  sharedInstance__ICAccessibilitySharedInstance = objc_opt_new();
  return MEMORY[0x1F41817F8]();
}

- (void)postAnnouncement:(id)a3 withSender:(id)a4 priority:(int64_t)a5
{
}

@end