@interface NSObject(AccessibilityActivation)
- (uint64_t)_accessibilityGetContextID;
- (uint64_t)_keyboardActivateEventDown:()AccessibilityActivation;
- (void)_keyboardActivate;
@end

@implementation NSObject(AccessibilityActivation)

- (void)_keyboardActivate
{
  v2 = (const void *)[a1 _keyboardActivateEventDown:1];
  uint64_t v3 = [a1 _keyboardActivateEventDown:0];
  [(id)UIApp _enqueueHIDEvent:v2];
  CFRelease(v2);
  dispatch_time_t v4 = dispatch_time(0, 50000000);
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __54__NSObject_AccessibilityActivation___keyboardActivate__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = v3;
  dispatch_after(v4, MEMORY[0x1E4F14428], block);
}

- (uint64_t)_keyboardActivateEventDown:()AccessibilityActivation
{
  [a1 accessibilityActivationPoint];
  mach_absolute_time();
  uint64_t DigitizerEvent = IOHIDEventCreateDigitizerEvent();
  DigitizerFingerEventWithQuality = (const void *)IOHIDEventCreateDigitizerFingerEventWithQuality();
  IOHIDEventAppendEvent();
  objc_msgSend(a1, "_accessibilityGetContextID", 0, 0);
  BKSHIDEventSetDigitizerInfo();
  CFRelease(DigitizerFingerEventWithQuality);
  return DigitizerEvent;
}

- (uint64_t)_accessibilityGetContextID
{
  if ((objc_opt_respondsToSelector() & 1) == 0 || (v2 = (UIWindow *)[a1 _accessibilityWindow]) == 0) {
    v2 = [+[UIScreen mainScreen] _preferredFocusedWindow];
  }
  return [(UIWindow *)v2 _contextId];
}

@end