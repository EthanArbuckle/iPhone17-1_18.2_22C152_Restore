@interface _XBWrapperWindow
+ (BOOL)_isSecure;
- (BOOL)_alwaysGetsContexts;
- (BOOL)_isWindowServerHostingManaged;
- (BOOL)_shouldResizeWithScene;
- (BOOL)_shouldUseRemoteContext;
- (UIEdgeInsets)safeAreaInsets;
- (XBDisplayEdgeInsetsWrapper)_customSafeAreaInsets;
- (int64_t)_orientationForRootTransform;
- (int64_t)_orientationForViewTransform;
- (void)_setCustomSafeAreaInsets:(id)a3;
@end

@implementation _XBWrapperWindow

- (BOOL)_shouldUseRemoteContext
{
  return 1;
}

- (BOOL)_isWindowServerHostingManaged
{
  return 1;
}

- (BOOL)_alwaysGetsContexts
{
  return 1;
}

- (BOOL)_shouldResizeWithScene
{
  return 0;
}

- (int64_t)_orientationForViewTransform
{
  return 1;
}

- (int64_t)_orientationForRootTransform
{
  return 1;
}

- (UIEdgeInsets)safeAreaInsets
{
  if (self->_customSafeAreaInsets)
  {
    customSafeAreaInsets = self->_customSafeAreaInsets;
    [(XBDisplayEdgeInsetsWrapper *)customSafeAreaInsets edgeInsets];
  }
  else
  {
    v7.receiver = self;
    v7.super_class = (Class)_XBWrapperWindow;
    [(_XBWrapperWindow *)&v7 safeAreaInsets];
  }
  result.right = v6;
  result.bottom = v5;
  result.left = v4;
  result.top = v3;
  return result;
}

+ (BOOL)_isSecure
{
  return 1;
}

- (XBDisplayEdgeInsetsWrapper)_customSafeAreaInsets
{
  return self->_customSafeAreaInsets;
}

- (void)_setCustomSafeAreaInsets:(id)a3
{
}

- (void).cxx_destruct
{
}

@end