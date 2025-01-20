@interface UIStatusBarManager
- (double)bc_defaultPortraitStatusBarHeight;
@end

@implementation UIStatusBarManager

- (double)bc_defaultPortraitStatusBarHeight
{
  [(UIStatusBarManager *)self defaultStatusBarHeightInOrientation:1];
  return result;
}

@end