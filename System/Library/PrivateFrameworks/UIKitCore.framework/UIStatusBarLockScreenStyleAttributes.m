@interface UIStatusBarLockScreenStyleAttributes
- (BOOL)isLockScreen;
- (BOOL)shouldShowInternalItemType:(int)a3 withScreenCapabilities:(id)a4;
- (Class)foregroundStyleClass;
- (double)heightForMetrics:(int64_t)a3;
@end

@implementation UIStatusBarLockScreenStyleAttributes

- (double)heightForMetrics:(int64_t)a3
{
  return 24.0;
}

- (Class)foregroundStyleClass
{
  return (Class)objc_opt_class();
}

- (BOOL)shouldShowInternalItemType:(int)a3 withScreenCapabilities:(id)a4
{
  if (a3 == 49) {
    return [(UIStatusBarStyleAttributes *)self style] == 1001;
  }
  v5.receiver = self;
  v5.super_class = (Class)UIStatusBarLockScreenStyleAttributes;
  return [(UIStatusBarStyleAttributes *)&v5 shouldShowInternalItemType:*(void *)&a3 withScreenCapabilities:a4];
}

- (BOOL)isLockScreen
{
  return 1;
}

@end