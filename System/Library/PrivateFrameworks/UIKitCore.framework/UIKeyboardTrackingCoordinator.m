@interface UIKeyboardTrackingCoordinator
+ (id)trackingCoordinatorForScene:(id)a3;
- (CGRect)lastSentEndFrame;
- (CGRect)previousEndFrame;
- (UIInputWindowController)controllerForTrackingElements;
- (UIKeyboardTrackingCoordinator)initWithWindowScene:(id)a3;
- (id)notificationInfoForStartFrame:(CGRect)a3 endFrame:(CGRect)a4 animationDuration:(double)a5;
- (void)animateTrackingElementsFromStart:(CGRect)a3 toEnd:(CGRect)a4 duration:(double)a5 forShow:(BOOL)a6;
- (void)moveKeyboardTrackingElementsFromStartFrame:(CGRect)a3 endFrame:(CGRect)a4 duration:(double)a5 isStart:(BOOL)a6 forShow:(BOOL)a7;
- (void)setControllerForTrackingElements:(id)a3;
- (void)setLastSentEndFrame:(CGRect)a3;
@end

@implementation UIKeyboardTrackingCoordinator

- (UIKeyboardTrackingCoordinator)initWithWindowScene:(id)a3
{
  id v4 = a3;
  v11.receiver = self;
  v11.super_class = (Class)UIKeyboardTrackingCoordinator;
  v5 = [(UIKeyboardTrackingCoordinator *)&v11 init];
  if (v5)
  {
    v6 = +[UITextEffectsWindow activeTextEffectsWindowForWindowScene:v4];
    uint64_t v7 = [v6 rootViewController];
    controllerForTrackingElements = v5->_controllerForTrackingElements;
    v5->_controllerForTrackingElements = (UIInputWindowController *)v7;

    CGSize v9 = *(CGSize *)(MEMORY[0x1E4F1DB28] + 16);
    v5->_lastSentEndFrame.origin = (CGPoint)*MEMORY[0x1E4F1DB28];
    v5->_lastSentEndFrame.size = v9;
  }
  return v5;
}

+ (id)trackingCoordinatorForScene:(id)a3
{
  id v3 = a3;
  if (os_variant_has_internal_diagnostics())
  {
    if (!v3)
    {
      v6 = __UIFaultDebugAssertLog();
      if (os_log_type_enabled(v6, OS_LOG_TYPE_FAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_fault_impl(&dword_1853B0000, v6, OS_LOG_TYPE_FAULT, "UIKeyboardTrackingCoordinator requires a valid windowScene", buf, 2u);
      }
    }
  }
  else if (!v3)
  {
    uint64_t v7 = *(NSObject **)(__UILogGetCategoryCachedImpl("Assert", &trackingCoordinatorForScene____s_category) + 8);
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)v8 = 0;
      _os_log_impl(&dword_1853B0000, v7, OS_LOG_TYPE_ERROR, "UIKeyboardTrackingCoordinator requires a valid windowScene", v8, 2u);
    }
  }
  id v4 = [[UIKeyboardTrackingCoordinator alloc] initWithWindowScene:v3];

  return v4;
}

- (CGRect)previousEndFrame
{
  double x = self->_lastSentEndFrame.origin.x;
  double y = self->_lastSentEndFrame.origin.y;
  double width = self->_lastSentEndFrame.size.width;
  double height = self->_lastSentEndFrame.size.height;
  result.size.double height = height;
  result.size.double width = width;
  result.origin.double y = y;
  result.origin.double x = x;
  return result;
}

- (id)notificationInfoForStartFrame:(CGRect)a3 endFrame:(CGRect)a4 animationDuration:(double)a5
{
  double height = a4.size.height;
  double width = a4.size.width;
  double y = a4.origin.y;
  double x = a4.origin.x;
  double v8 = a3.size.height;
  double v9 = a3.size.width;
  double v10 = a3.origin.y;
  double v11 = a3.origin.x;
  v12 = +[UIInputViewSetNotificationInfo info];
  objc_msgSend(v12, "populateStartInfoWithFrame:", v11, v10, v9, v8);
  objc_msgSend(v12, "populateEndInfoWithFrame:", x, y, width, height);
  v13 = +[UIInputViewAnimationStyle animationStyleAnimated:a5 > 0.0 duration:a5];
  [v12 populateWithAnimationStyle:v13];

  [v12 addKeyboardNotificationDebuggingInfo:@"UIKeyboardTrackingCoordinator"];
  return v12;
}

- (void)animateTrackingElementsFromStart:(CGRect)a3 toEnd:(CGRect)a4 duration:(double)a5 forShow:(BOOL)a6
{
  BOOL v6 = a6;
  double height = a4.size.height;
  double width = a4.size.width;
  double y = a4.origin.y;
  double x = a4.origin.x;
  double v11 = a3.size.height;
  double v12 = a3.size.width;
  double v13 = a3.origin.y;
  double v14 = a3.origin.x;
  uint64_t v29 = *MEMORY[0x1E4F143B8];
  int has_internal_diagnostics = os_variant_has_internal_diagnostics();
  BOOL IsDiscrete = UIRectIsDiscrete(v14, v13, v12, v11);
  if (has_internal_diagnostics)
  {
    if (IsDiscrete && UIRectIsDiscrete(x, y, width, height)) {
      goto LABEL_4;
    }
    v22 = __UIFaultDebugAssertLog();
    if (!os_log_type_enabled(v22, OS_LOG_TYPE_FAULT)) {
      goto LABEL_11;
    }
    v32.origin.double x = v14;
    v32.origin.double y = v13;
    v32.size.double width = v12;
    v32.size.double height = v11;
    v23 = NSStringFromCGRect(v32);
    v33.origin.double x = x;
    v33.origin.double y = y;
    v33.size.double width = width;
    v33.size.double height = height;
    v24 = NSStringFromCGRect(v33);
    *(_DWORD *)buf = 138412546;
    v26 = v23;
    __int16 v27 = 2112;
    v28 = v24;
    _os_log_fault_impl(&dword_1853B0000, v22, OS_LOG_TYPE_FAULT, "Both startFrame and endFrame must be valid rects to animate keyboard tracking elements. Start %@ End %@", buf, 0x16u);
LABEL_10:

LABEL_11:
    goto LABEL_4;
  }
  if (!IsDiscrete || !UIRectIsDiscrete(x, y, width, height))
  {
    v21 = *(NSObject **)(__UILogGetCategoryCachedImpl("Assert", &animateTrackingElementsFromStart_toEnd_duration_forShow____s_category)+ 8);
    if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR))
    {
      v22 = v21;
      v30.origin.double x = v14;
      v30.origin.double y = v13;
      v30.size.double width = v12;
      v30.size.double height = v11;
      v23 = NSStringFromCGRect(v30);
      v31.origin.double x = x;
      v31.origin.double y = y;
      v31.size.double width = width;
      v31.size.double height = height;
      v24 = NSStringFromCGRect(v31);
      *(_DWORD *)buf = 138412546;
      v26 = v23;
      __int16 v27 = 2112;
      v28 = v24;
      _os_log_impl(&dword_1853B0000, v22, OS_LOG_TYPE_ERROR, "Both startFrame and endFrame must be valid rects to animate keyboard tracking elements. Start %@ End %@", buf, 0x16u);
      goto LABEL_10;
    }
  }
LABEL_4:
  v18 = -[UIKeyboardTrackingCoordinator notificationInfoForStartFrame:endFrame:animationDuration:](self, "notificationInfoForStartFrame:endFrame:animationDuration:", v14, v13, v12, v11, x, y, width, height, *(void *)&a5);
  self->_lastSentEndFrame.origin.double x = x;
  self->_lastSentEndFrame.origin.double y = y;
  if (v6) {
    uint64_t v19 = 2;
  }
  else {
    uint64_t v19 = 3;
  }
  self->_lastSentEndFrame.size.double width = width;
  self->_lastSentEndFrame.size.double height = height;
  v20 = [(UIKeyboardTrackingCoordinator *)self controllerForTrackingElements];
  [v20 animateKeyboardTrackingElementsWithNotificationInfo:v18 notificationType:v19 updateForStart:1 updateForEnd:1];
}

- (void)moveKeyboardTrackingElementsFromStartFrame:(CGRect)a3 endFrame:(CGRect)a4 duration:(double)a5 isStart:(BOOL)a6 forShow:(BOOL)a7
{
  BOOL v7 = a7;
  BOOL v8 = a6;
  double height = a4.size.height;
  double width = a4.size.width;
  double y = a4.origin.y;
  double x = a4.origin.x;
  double v13 = a3.size.height;
  double v14 = a3.size.width;
  double v15 = a3.origin.y;
  double v16 = a3.origin.x;
  uint64_t v31 = *MEMORY[0x1E4F143B8];
  int has_internal_diagnostics = os_variant_has_internal_diagnostics();
  BOOL IsDiscrete = UIRectIsDiscrete(v16, v15, v14, v13);
  if (has_internal_diagnostics)
  {
    if (IsDiscrete && UIRectIsDiscrete(x, y, width, height)) {
      goto LABEL_4;
    }
    v24 = __UIFaultDebugAssertLog();
    if (!os_log_type_enabled(v24, OS_LOG_TYPE_FAULT)) {
      goto LABEL_11;
    }
    v34.origin.double x = v16;
    v34.origin.double y = v15;
    v34.size.double width = v14;
    v34.size.double height = v13;
    v25 = NSStringFromCGRect(v34);
    v35.origin.double x = x;
    v35.origin.double y = y;
    v35.size.double width = width;
    v35.size.double height = height;
    v26 = NSStringFromCGRect(v35);
    *(_DWORD *)buf = 138412546;
    v28 = v25;
    __int16 v29 = 2112;
    CGRect v30 = v26;
    _os_log_fault_impl(&dword_1853B0000, v24, OS_LOG_TYPE_FAULT, "Both startFrame and endFrame must be valid rects to move keyboard tracking elements. Start %@ End %@", buf, 0x16u);
LABEL_10:

LABEL_11:
    goto LABEL_4;
  }
  if (!IsDiscrete || !UIRectIsDiscrete(x, y, width, height))
  {
    v23 = *(NSObject **)(__UILogGetCategoryCachedImpl("Assert", &moveKeyboardTrackingElementsFromStartFrame_endFrame_duration_isStart_forShow____s_category)+ 8);
    if (os_log_type_enabled(v23, OS_LOG_TYPE_ERROR))
    {
      v24 = v23;
      v32.origin.double x = v16;
      v32.origin.double y = v15;
      v32.size.double width = v14;
      v32.size.double height = v13;
      v25 = NSStringFromCGRect(v32);
      v33.origin.double x = x;
      v33.origin.double y = y;
      v33.size.double width = width;
      v33.size.double height = height;
      v26 = NSStringFromCGRect(v33);
      *(_DWORD *)buf = 138412546;
      v28 = v25;
      __int16 v29 = 2112;
      CGRect v30 = v26;
      _os_log_impl(&dword_1853B0000, v24, OS_LOG_TYPE_ERROR, "Both startFrame and endFrame must be valid rects to move keyboard tracking elements. Start %@ End %@", buf, 0x16u);
      goto LABEL_10;
    }
  }
LABEL_4:
  v20 = -[UIKeyboardTrackingCoordinator notificationInfoForStartFrame:endFrame:animationDuration:](self, "notificationInfoForStartFrame:endFrame:animationDuration:", v16, v15, v14, v13, x, y, width, height, *(void *)&a5);
  self->_lastSentEndFrame.origin.double x = x;
  self->_lastSentEndFrame.origin.double y = y;
  if (v7) {
    uint64_t v21 = 2;
  }
  else {
    uint64_t v21 = 3;
  }
  self->_lastSentEndFrame.size.double width = width;
  self->_lastSentEndFrame.size.double height = height;
  v22 = [(UIKeyboardTrackingCoordinator *)self controllerForTrackingElements];
  [v22 animateKeyboardTrackingElementsWithNotificationInfo:v20 notificationType:v21 updateForStart:v8 updateForEnd:v8 ^ 1];
}

- (UIInputWindowController)controllerForTrackingElements
{
  return self->_controllerForTrackingElements;
}

- (void)setControllerForTrackingElements:(id)a3
{
}

- (CGRect)lastSentEndFrame
{
  double x = self->_lastSentEndFrame.origin.x;
  double y = self->_lastSentEndFrame.origin.y;
  double width = self->_lastSentEndFrame.size.width;
  double height = self->_lastSentEndFrame.size.height;
  result.size.double height = height;
  result.size.double width = width;
  result.origin.double y = y;
  result.origin.double x = x;
  return result;
}

- (void)setLastSentEndFrame:(CGRect)a3
{
  self->_lastSentEndFrame = a3;
}

- (void).cxx_destruct
{
}

@end