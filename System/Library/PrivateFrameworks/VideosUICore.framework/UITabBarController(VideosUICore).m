@interface UITabBarController(VideosUICore)
- (id)init;
- (void)setVuiViewControllers:()VideosUICore;
@end

@implementation UITabBarController(VideosUICore)

- (void)setVuiViewControllers:()VideosUICore
{
  if (a3) {
    return objc_msgSend(a1, "setViewControllers:");
  }
  return a1;
}

- (id)init
{
  v2.receiver = a1;
  v2.super_class = (Class)&off_1F3E1F6F8;
  return objc_msgSendSuper2(&v2, sel_init);
}

@end