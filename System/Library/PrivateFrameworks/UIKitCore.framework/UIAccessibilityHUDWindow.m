@interface UIAccessibilityHUDWindow
+ (UIAccessibilityHUDWindow)sharedWindow;
+ (void)createSharedWindowWithScene:(id)a3;
+ (void)removeSharedWindow;
@end

@implementation UIAccessibilityHUDWindow

+ (UIAccessibilityHUDWindow)sharedWindow
{
  return (UIAccessibilityHUDWindow *)(id)_SharedWindow;
}

+ (void)createSharedWindowWithScene:(id)a3
{
  id v4 = a3;
  v5 = (void *)_SharedWindow;
  if (_SharedWindow)
  {
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)v10 = 0;
      _os_log_error_impl(&dword_1853B0000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "Attempted to create shared Accessibility HUD window when one was already present", v10, 2u);
      v5 = (void *)_SharedWindow;
    }
    [v5 setHidden:1];
  }
  uint64_t v6 = [objc_alloc((Class)a1) initWithWindowScene:v4];
  v7 = (void *)_SharedWindow;
  _SharedWindow = v6;

  [(id)_SharedWindow setWindowLevel:10000002.0];
  v8 = objc_opt_new();
  [v8 setSizesWindowToScene:1];
  v9 = +[UIColor clearColor];
  [(id)_SharedWindow setBackgroundColor:v9];

  [(id)_SharedWindow setRootViewController:v8];
}

+ (void)removeSharedWindow
{
  v2 = (void *)_SharedWindow;
  _SharedWindow = 0;
}

@end