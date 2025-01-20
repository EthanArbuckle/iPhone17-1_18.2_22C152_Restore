@interface UIInputResponderController
+ (id)activeInputResponderController;
+ (int64_t)interfaceOrientation;
+ (void)performOnControllers:(id)a3;
+ (void)setInterfaceOrientation:(int64_t)a3;
- (BOOL)automaticAppearanceEnabled;
- (BOOL)isOnScreen;
- (BOOL)shouldSuppressInputAssistantUpdates;
- (CGRect)visibleFrameInView:(id)a3;
- (CGRect)visibleInputViewFrameInView:(id)a3;
- (UIResponder)responder;
- (UIWindowScene)scene;
- (double)verticalOverlapForView:(id)a3 usingKeyboardInfo:(id)a4;
- (id)_textInputSessionAnalytics;
- (void)assertNo;
- (void)setAutomaticAppearanceEnabled:(BOOL)a3;
- (void)setShouldSuppressInputAssistantUpdates:(BOOL)a3;
@end

@implementation UIInputResponderController

- (void)assertNo
{
  if (os_variant_has_internal_diagnostics())
  {
    v3 = __UIFaultDebugAssertLog();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_FAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_fault_impl(&dword_1853B0000, v3, OS_LOG_TYPE_FAULT, "A UIInputResponderController instance will never be created.", buf, 2u);
    }
  }
  else
  {
    v2 = *(NSObject **)(__UILogGetCategoryCachedImpl("Assert", &assertNo___s_category) + 8);
    if (os_log_type_enabled(v2, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)v4 = 0;
      _os_log_impl(&dword_1853B0000, v2, OS_LOG_TYPE_ERROR, "A UIInputResponderController instance will never be created.", v4, 2u);
    }
  }
}

- (CGRect)visibleFrameInView:(id)a3
{
  [(UIInputResponderController *)self assertNo];
  double v3 = *MEMORY[0x1E4F1DB28];
  double v4 = *(double *)(MEMORY[0x1E4F1DB28] + 8);
  double v5 = *(double *)(MEMORY[0x1E4F1DB28] + 16);
  double v6 = *(double *)(MEMORY[0x1E4F1DB28] + 24);
  result.size.height = v6;
  result.size.width = v5;
  result.origin.y = v4;
  result.origin.x = v3;
  return result;
}

- (CGRect)visibleInputViewFrameInView:(id)a3
{
  [(UIInputResponderController *)self assertNo];
  double v3 = *MEMORY[0x1E4F1DB28];
  double v4 = *(double *)(MEMORY[0x1E4F1DB28] + 8);
  double v5 = *(double *)(MEMORY[0x1E4F1DB28] + 16);
  double v6 = *(double *)(MEMORY[0x1E4F1DB28] + 24);
  result.size.height = v6;
  result.size.width = v5;
  result.origin.y = v4;
  result.origin.x = v3;
  return result;
}

- (double)verticalOverlapForView:(id)a3 usingKeyboardInfo:(id)a4
{
  return 0.0;
}

- (id)_textInputSessionAnalytics
{
  return 0;
}

+ (id)activeInputResponderController
{
  return +[UIKeyboardSceneDelegate activeKeyboardSceneDelegate];
}

+ (int64_t)interfaceOrientation
{
  return +[UIKeyboardSceneDelegate interfaceOrientation];
}

+ (void)setInterfaceOrientation:(int64_t)a3
{
}

+ (void)performOnControllers:(id)a3
{
}

- (UIWindowScene)scene
{
  return self->_scene;
}

- (UIResponder)responder
{
  return self->_responder;
}

- (BOOL)isOnScreen
{
  return self->_isOnScreen;
}

- (BOOL)automaticAppearanceEnabled
{
  return self->_automaticAppearanceEnabled;
}

- (void)setAutomaticAppearanceEnabled:(BOOL)a3
{
  self->_automaticAppearanceEnabled = a3;
}

- (BOOL)shouldSuppressInputAssistantUpdates
{
  return self->_shouldSuppressInputAssistantUpdates;
}

- (void)setShouldSuppressInputAssistantUpdates:(BOOL)a3
{
  self->_shouldSuppressInputAssistantUpdates = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_responder, 0);
  objc_storeStrong((id *)&self->_scene, 0);
}

@end