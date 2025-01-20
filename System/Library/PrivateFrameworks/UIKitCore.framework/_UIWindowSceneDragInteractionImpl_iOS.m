@interface _UIWindowSceneDragInteractionImpl_iOS
- (UIPanGestureRecognizer)directTouchPanGestureRecognizer;
- (UIPanGestureRecognizer)pointerTouchPanGestureRecognizer;
- (UIView)view;
- (_UIClientToHostRelationshipGestureInteraction)clientRelationshipInteraction;
- (_UIRelationshipGestureRecognizer)failureRelationshipGestureRecognizer;
- (_UIWindowSceneDragInteractionImpl_iOS)init;
- (id)_makeDraggingPanGestureRecognizer;
- (id)gestureForFailureRelationships;
- (void)_didRecognizePanGesture:(id)a3;
- (void)didMoveToView:(id)a3;
- (void)setClientRelationshipInteraction:(id)a3;
- (void)setDirectTouchPanGestureRecognizer:(id)a3;
- (void)setFailureRelationshipGestureRecognizer:(id)a3;
- (void)setPointerTouchPanGestureRecognizer:(id)a3;
- (void)willMoveToView:(id)a3;
@end

@implementation _UIWindowSceneDragInteractionImpl_iOS

- (_UIWindowSceneDragInteractionImpl_iOS)init
{
  v12.receiver = self;
  v12.super_class = (Class)_UIWindowSceneDragInteractionImpl_iOS;
  v2 = [(_UIWindowSceneDragInteractionImpl_iOS *)&v12 init];
  if (v2)
  {
    v3 = [[_UIClientToHostRelationshipGestureInteraction alloc] initWithHostIdentifier:@"com.apple.UIKit.UIWindowDragging"];
    clientRelationshipInteraction = v2->_clientRelationshipInteraction;
    v2->_clientRelationshipInteraction = v3;

    uint64_t v5 = [(_UIWindowSceneDragInteractionImpl_iOS *)v2 _makeDraggingPanGestureRecognizer];
    directTouchPanGestureRecognizer = v2->_directTouchPanGestureRecognizer;
    v2->_directTouchPanGestureRecognizer = (UIPanGestureRecognizer *)v5;

    [(_UIClientToHostRelationshipGestureInteraction *)v2->_clientRelationshipInteraction addGestureRecognizer:v2->_directTouchPanGestureRecognizer];
    uint64_t v7 = [(_UIWindowSceneDragInteractionImpl_iOS *)v2 _makeDraggingPanGestureRecognizer];
    pointerTouchPanGestureRecognizer = v2->_pointerTouchPanGestureRecognizer;
    v2->_pointerTouchPanGestureRecognizer = (UIPanGestureRecognizer *)v7;

    [(UIGestureRecognizer *)v2->_pointerTouchPanGestureRecognizer setAllowedTouchTypes:&unk_1ED3EF998];
    [(UIPanGestureRecognizer *)v2->_pointerTouchPanGestureRecognizer _setHysteresis:3.0];
    [(_UIClientToHostRelationshipGestureInteraction *)v2->_clientRelationshipInteraction addGestureRecognizer:v2->_pointerTouchPanGestureRecognizer];
    v9 = objc_alloc_init(_UIRelationshipGestureRecognizer);
    failureRelationshipGestureRecognizer = v2->_failureRelationshipGestureRecognizer;
    v2->_failureRelationshipGestureRecognizer = v9;

    [(UIGestureRecognizer *)v2->_failureRelationshipGestureRecognizer setName:@"UIWindowSceneDragRelationshipRecognizer"];
  }
  return v2;
}

- (id)_makeDraggingPanGestureRecognizer
{
  v2 = [[UIPanGestureRecognizer alloc] initWithTarget:self action:sel__didRecognizePanGesture_];
  [(UIGestureRecognizer *)v2 _setRequiresSystemGesturesToFail:0];
  [(UIGestureRecognizer *)v2 setName:@"com.apple.UIKit.UIWindowDraggingPan"];
  return v2;
}

- (void)_didRecognizePanGesture:(id)a3
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if ([v4 state] == 1)
  {
    unint64_t CategoryCachedImpl = __UILogGetCategoryCachedImpl("UIWindowSceneDrag", &_MergedGlobals_1022);
    if (*(unsigned char *)CategoryCachedImpl)
    {
      uint64_t v7 = *(NSObject **)(CategoryCachedImpl + 8);
      if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
      {
        v8 = v7;
        v9 = [v4 description];
        int v13 = 138412290;
        v14 = v9;
        _os_log_impl(&dword_1853B0000, v8, OS_LOG_TYPE_ERROR, "Recognized window drag pan gesture in app: %@", (uint8_t *)&v13, 0xCu);
      }
    }
    [(_UIRelationshipGestureRecognizer *)self->_failureRelationshipGestureRecognizer _succeed];
  }
  else if ([v4 state] == 5 || objc_msgSend(v4, "state") == 4)
  {
    unint64_t v6 = __UILogGetCategoryCachedImpl("UIWindowSceneDrag", &qword_1EB260338);
    if (*(unsigned char *)v6)
    {
      v10 = *(NSObject **)(v6 + 8);
      if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
      {
        v11 = v10;
        objc_super v12 = [v4 description];
        int v13 = 138412290;
        v14 = v12;
        _os_log_impl(&dword_1853B0000, v11, OS_LOG_TYPE_ERROR, "Window drag pan gesture failed in app: %@", (uint8_t *)&v13, 0xCu);
      }
    }
    [(_UIRelationshipGestureRecognizer *)self->_failureRelationshipGestureRecognizer _fail];
  }
}

- (void)didMoveToView:(id)a3
{
  p_view = &self->_view;
  id v7 = a3;
  id v5 = objc_storeWeak((id *)p_view, v7);
  [v7 addInteraction:self->_clientRelationshipInteraction];

  id WeakRetained = objc_loadWeakRetained((id *)p_view);
  [WeakRetained addGestureRecognizer:self->_failureRelationshipGestureRecognizer];
}

- (void)willMoveToView:(id)a3
{
  p_view = &self->_view;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_view);
  [WeakRetained removeInteraction:self->_clientRelationshipInteraction];

  id v6 = objc_loadWeakRetained((id *)p_view);
  [v6 removeGestureRecognizer:self->_failureRelationshipGestureRecognizer];

  objc_storeWeak((id *)p_view, 0);
}

- (id)gestureForFailureRelationships
{
  return self->_failureRelationshipGestureRecognizer;
}

- (UIView)view
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_view);
  return (UIView *)WeakRetained;
}

- (_UIClientToHostRelationshipGestureInteraction)clientRelationshipInteraction
{
  return self->_clientRelationshipInteraction;
}

- (void)setClientRelationshipInteraction:(id)a3
{
}

- (UIPanGestureRecognizer)directTouchPanGestureRecognizer
{
  return self->_directTouchPanGestureRecognizer;
}

- (void)setDirectTouchPanGestureRecognizer:(id)a3
{
}

- (UIPanGestureRecognizer)pointerTouchPanGestureRecognizer
{
  return self->_pointerTouchPanGestureRecognizer;
}

- (void)setPointerTouchPanGestureRecognizer:(id)a3
{
}

- (_UIRelationshipGestureRecognizer)failureRelationshipGestureRecognizer
{
  return self->_failureRelationshipGestureRecognizer;
}

- (void)setFailureRelationshipGestureRecognizer:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_failureRelationshipGestureRecognizer, 0);
  objc_storeStrong((id *)&self->_pointerTouchPanGestureRecognizer, 0);
  objc_storeStrong((id *)&self->_directTouchPanGestureRecognizer, 0);
  objc_storeStrong((id *)&self->_clientRelationshipInteraction, 0);
  objc_destroyWeak((id *)&self->_view);
}

@end