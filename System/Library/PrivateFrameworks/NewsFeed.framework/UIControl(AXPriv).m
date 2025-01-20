@interface UIControl(AXPriv)
- (uint64_t)_feldsparAccessibilityPresentMenu;
@end

@implementation UIControl(AXPriv)

- (uint64_t)_feldsparAccessibilityPresentMenu
{
  if ([a1 showsMenuAsPrimaryAction])
  {
    v2 = [a1 contextMenuInteraction];
    char v3 = objc_opt_respondsToSelector();
    if (v3)
    {
      [a1 accessibilityActivationPoint];
      objc_msgSend(v2, "_presentMenuAtLocation:");
    }
  }
  else
  {
    char v3 = 0;
  }
  return v3 & 1;
}

@end