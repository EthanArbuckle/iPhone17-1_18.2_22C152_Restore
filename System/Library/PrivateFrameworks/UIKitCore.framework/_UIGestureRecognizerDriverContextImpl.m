@interface _UIGestureRecognizerDriverContextImpl
- (CGPoint)convertPoint:(CGPoint)a3 fromSceneReferenceCoordinatesToView:(id)a4;
- (CGPoint)convertPoint:(CGPoint)a3 toSceneReferenceCoordinatesFromView:(id)a4;
- (UIWindow)eventReceivingWindow;
- (id)activeComponentsForEvent:(id)a3;
- (id)activeEventOfType:(int64_t)a3;
- (void)ignoreEventComponent:(id)a3 forEvent:(id)a4;
- (void)initWithGestureRecognizer:(void *)result;
@end

@implementation _UIGestureRecognizerDriverContextImpl

- (void)initWithGestureRecognizer:(void *)result
{
  if (result)
  {
    v3.receiver = result;
    v3.super_class = (Class)_UIGestureRecognizerDriverContextImpl;
    result = objc_msgSendSuper2(&v3, sel_init);
    if (result) {
      result[1] = a2;
    }
  }
  return result;
}

- (UIWindow)eventReceivingWindow
{
  gestureRecognizer = self->_gestureRecognizer;
  if (gestureRecognizer) {
    id WeakRetained = objc_loadWeakRetained((id *)&gestureRecognizer->_container);
  }
  else {
    id WeakRetained = 0;
  }
  v4 = [WeakRetained _eventReceivingWindow];

  return (UIWindow *)v4;
}

- (id)activeComponentsForEvent:(id)a3
{
  return -[UIGestureRecognizer _activeComponentsForEvent:]((uint64_t)self->_gestureRecognizer, a3);
}

- (id)activeEventOfType:(int64_t)a3
{
  return [(UIGestureRecognizer *)self->_gestureRecognizer _activeEventOfType:a3];
}

- (CGPoint)convertPoint:(CGPoint)a3 fromSceneReferenceCoordinatesToView:(id)a4
{
  -[UIGestureRecognizer _convertPoint:fromSceneReferenceCoordinatesToView:](self->_gestureRecognizer, "_convertPoint:fromSceneReferenceCoordinatesToView:", a4, a3.x, a3.y);
  result.y = v5;
  result.x = v4;
  return result;
}

- (CGPoint)convertPoint:(CGPoint)a3 toSceneReferenceCoordinatesFromView:(id)a4
{
  -[UIGestureRecognizer _convertPoint:toSceneReferenceCoordinatesFromView:](self->_gestureRecognizer, "_convertPoint:toSceneReferenceCoordinatesFromView:", a4, a3.x, a3.y);
  result.y = v5;
  result.x = v4;
  return result;
}

- (void)ignoreEventComponent:(id)a3 forEvent:(id)a4
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  if ([a3 _eventComponentType])
  {
    if ([a3 _eventComponentType] == 1)
    {
      gestureRecognizer = self->_gestureRecognizer;
      [(UIGestureRecognizer *)gestureRecognizer ignorePress:a3 forEvent:a4];
    }
    else if (os_variant_has_internal_diagnostics())
    {
      v10 = __UIFaultDebugAssertLog();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_FAULT))
      {
        int v11 = 138412290;
        id v12 = a3;
        _os_log_fault_impl(&dword_1853B0000, v10, OS_LOG_TYPE_FAULT, "Unsupported event component: %@", (uint8_t *)&v11, 0xCu);
      }
    }
    else
    {
      v9 = *(NSObject **)(__UILogGetCategoryCachedImpl("Assert", &ignoreEventComponent_forEvent____s_category) + 8);
      if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
      {
        int v11 = 138412290;
        id v12 = a3;
        _os_log_impl(&dword_1853B0000, v9, OS_LOG_TYPE_ERROR, "Unsupported event component: %@", (uint8_t *)&v11, 0xCu);
      }
    }
  }
  else
  {
    v8 = self->_gestureRecognizer;
    [(UIGestureRecognizer *)v8 ignoreTouch:a3 forEvent:a4];
  }
}

@end