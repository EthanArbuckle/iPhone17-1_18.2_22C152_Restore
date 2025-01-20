@interface _SBDeviceApplicationSceneViewPlaceholderContentView
- (int64_t)statusBarStyle;
- (void)setStatusBarStyle:(int64_t)a3;
@end

@implementation _SBDeviceApplicationSceneViewPlaceholderContentView

- (void)setStatusBarStyle:(int64_t)a3
{
  self->_statusBarStyle = a3;
}

- (int64_t)statusBarStyle
{
  return self->_statusBarStyle;
}

@end