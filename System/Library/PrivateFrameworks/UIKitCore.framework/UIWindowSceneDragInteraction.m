@interface UIWindowSceneDragInteraction
- (UIGestureRecognizer)gestureForFailureRelationships;
- (UIView)view;
- (UIWindowSceneDragInteraction)init;
- (_UIWindowSceneDragInteractionImpl)impl;
- (void)didMoveToView:(id)a3;
- (void)setImpl:(id)a3;
- (void)willMoveToView:(id)a3;
@end

@implementation UIWindowSceneDragInteraction

- (UIWindowSceneDragInteraction)init
{
  v6.receiver = self;
  v6.super_class = (Class)UIWindowSceneDragInteraction;
  v2 = [(UIWindowSceneDragInteraction *)&v6 init];
  if (v2)
  {
    v3 = objc_alloc_init(_UIWindowSceneDragInteractionImpl_iOS);
    impl = v2->_impl;
    v2->_impl = (_UIWindowSceneDragInteractionImpl *)v3;
  }
  return v2;
}

- (UIGestureRecognizer)gestureForFailureRelationships
{
  return (UIGestureRecognizer *)[(_UIWindowSceneDragInteractionImpl *)self->_impl gestureForFailureRelationships];
}

- (void)didMoveToView:(id)a3
{
  p_view = &self->_view;
  id v5 = a3;
  objc_storeWeak((id *)p_view, v5);
  [(_UIWindowSceneDragInteractionImpl *)self->_impl didMoveToView:v5];
}

- (void)willMoveToView:(id)a3
{
  [(_UIWindowSceneDragInteractionImpl *)self->_impl willMoveToView:a3];
  objc_storeWeak((id *)&self->_view, 0);
}

- (UIView)view
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_view);
  return (UIView *)WeakRetained;
}

- (_UIWindowSceneDragInteractionImpl)impl
{
  return self->_impl;
}

- (void)setImpl:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_impl, 0);
  objc_destroyWeak((id *)&self->_view);
}

@end