@interface UIWindow(AXRectHelper)
- (uint64_t)_axConvertRect:()AXRectHelper toWindow:;
@end

@implementation UIWindow(AXRectHelper)

- (uint64_t)_axConvertRect:()AXRectHelper toWindow:
{
  return objc_msgSend(a1, "convertRect:toWindow:", 0);
}

@end