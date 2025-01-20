@interface AccessibilityWrapper
+ (unint64_t)accessibilityTraitTableIndex;
+ (unsigned)accessibilityKeyboardKeySelectedNotification;
+ (void)accessibilityKeyboardKeySelectedNotification;
@end

@implementation AccessibilityWrapper

+ (unsigned)accessibilityKeyboardKeySelectedNotification
{
  uint64_t v5 = 0;
  v6 = &v5;
  uint64_t v7 = 0x2020000000;
  v2 = (unsigned int *)getUIAccessibilityKeyboardKeySelectedNotificationSymbolLoc_ptr;
  uint64_t v8 = getUIAccessibilityKeyboardKeySelectedNotificationSymbolLoc_ptr;
  if (!getUIAccessibilityKeyboardKeySelectedNotificationSymbolLoc_ptr)
  {
    v3 = (void *)UIAccessibilityLibrary();
    v6[3] = (uint64_t)dlsym(v3, "UIAccessibilityKeyboardKeySelectedNotification");
    getUIAccessibilityKeyboardKeySelectedNotificationSymbolLoc_ptr = v6[3];
    v2 = (unsigned int *)v6[3];
  }
  _Block_object_dispose(&v5, 8);
  if (!v2) {
    +[AccessibilityWrapper accessibilityKeyboardKeySelectedNotification]();
  }
  return *v2;
}

+ (unint64_t)accessibilityTraitTableIndex
{
  uint64_t v5 = 0;
  v6 = &v5;
  uint64_t v7 = 0x2020000000;
  v2 = (unint64_t *)getUIAccessibilityTraitTableIndexSymbolLoc_ptr;
  uint64_t v8 = getUIAccessibilityTraitTableIndexSymbolLoc_ptr;
  if (!getUIAccessibilityTraitTableIndexSymbolLoc_ptr)
  {
    v3 = (void *)UIAccessibilityLibrary();
    v6[3] = (uint64_t)dlsym(v3, "UIAccessibilityTraitTableIndex");
    getUIAccessibilityTraitTableIndexSymbolLoc_ptr = v6[3];
    v2 = (unint64_t *)v6[3];
  }
  _Block_object_dispose(&v5, 8);
  if (!v2) {
    +[AccessibilityWrapper accessibilityKeyboardKeySelectedNotification]();
  }
  return *v2;
}

+ (void)accessibilityKeyboardKeySelectedNotification
{
  dlerror();
  uint64_t v0 = abort_report_np();
  __getSKUIRedeemViewControllerClass_block_invoke_cold_1(v0);
}

@end