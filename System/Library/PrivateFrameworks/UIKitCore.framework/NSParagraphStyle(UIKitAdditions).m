@interface NSParagraphStyle(UIKitAdditions)
- (uint64_t)_ui_resolvedTextAlignment;
- (uint64_t)_ui_resolvedTextAlignmentForUserInterfaceLayoutDirection:()UIKitAdditions;
- (uint64_t)_ui_resolvedWritingDirection;
- (uint64_t)_ui_resolvedWritingDirectionForUserInterfaceLayoutDirection:()UIKitAdditions;
@end

@implementation NSParagraphStyle(UIKitAdditions)

- (uint64_t)_ui_resolvedTextAlignment
{
  uint64_t v2 = [(id)UIApp userInterfaceLayoutDirection];
  return objc_msgSend(a1, "_ui_resolvedTextAlignmentForUserInterfaceLayoutDirection:", v2);
}

- (uint64_t)_ui_resolvedTextAlignmentForUserInterfaceLayoutDirection:()UIKitAdditions
{
  uint64_t result = [a1 alignment];
  if ((unint64_t)(result - 3) <= 1)
  {
    uint64_t v6 = [a1 baseWritingDirection];
    BOOL v7 = a3 != 0;
    if (v6 != -1) {
      BOOL v7 = v6 == 1;
    }
    if (v7) {
      return 2;
    }
    else {
      return 0;
    }
  }
  return result;
}

- (uint64_t)_ui_resolvedWritingDirection
{
  uint64_t v2 = [(id)UIApp userInterfaceLayoutDirection];
  return objc_msgSend(a1, "_ui_resolvedWritingDirectionForUserInterfaceLayoutDirection:", v2);
}

- (uint64_t)_ui_resolvedWritingDirectionForUserInterfaceLayoutDirection:()UIKitAdditions
{
  uint64_t result = [a1 baseWritingDirection];
  if (result == -1) {
    return a3 != 0;
  }
  return result;
}

@end