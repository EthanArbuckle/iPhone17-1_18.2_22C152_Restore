@interface UIView(MTUIRTLSupport)
- (BOOL)mtui_isRTL;
@end

@implementation UIView(MTUIRTLSupport)

- (BOOL)mtui_isRTL
{
  return objc_msgSend(MEMORY[0x263F1CB60], "userInterfaceLayoutDirectionForSemanticContentAttribute:", objc_msgSend(a1, "semanticContentAttribute")) == 1;
}

@end