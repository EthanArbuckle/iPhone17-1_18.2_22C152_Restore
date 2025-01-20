@interface UIApplication(MobileSafariFrameworkExtras)
- (BOOL)safari_prefersRTLLayout;
- (uint64_t)sf_currentKeyboardModifierFlags;
@end

@implementation UIApplication(MobileSafariFrameworkExtras)

- (uint64_t)sf_currentKeyboardModifierFlags
{
  if ((objc_opt_respondsToSelector() & 1) == 0) {
    return 0;
  }

  return [a1 currentKeyboardModifierFlags];
}

- (BOOL)safari_prefersRTLLayout
{
  return [a1 userInterfaceLayoutDirection] == 1;
}

@end