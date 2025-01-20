@interface _UINonEditableTextSelectionForceGesture
- (BOOL)_shouldDelayUntilForceLevelRequirementIsMet;
- (UIKeyboardTaskQueue)taskQueue;
- (_UIKeyboardTextSelectionController)textSelectionController;
- (_UIKeyboardTextSelectionGestureController)gestureController;
- (_UINonEditableTextSelectionForceGesture)initWithTextInput:(id)a3;
- (_UINonEditableTextSelectionForceGestureDelegate)forceGestureDelegate;
- (void)dealloc;
- (void)setForceGestureDelegate:(id)a3;
- (void)setGestureController:(id)a3;
- (void)setTextSelectionController:(id)a3;
- (void)willBeginGesture;
@end

@implementation _UINonEditableTextSelectionForceGesture

- (_UINonEditableTextSelectionForceGesture)initWithTextInput:(id)a3
{
  id v4 = a3;
  if (v4)
  {
    v11.receiver = self;
    v11.super_class = (Class)_UINonEditableTextSelectionForceGesture;
    v5 = [(UIGestureRecognizer *)&v11 init];
    if (v5)
    {
      v6 = [[_UIKeyboardTextSelectionController alloc] initWithInputDelegate:v4];
      textSelectionController = v5->_textSelectionController;
      v5->_textSelectionController = v6;

      v8 = objc_alloc_init(_UIKeyboardBasedNonEditableTextSelectionGestureController);
      gestureController = v5->_gestureController;
      v5->_gestureController = &v8->super.super;

      [(_UIKeyboardTextSelectionGestureController *)v5->_gestureController setDelegate:v5];
      [(_UIKeyboardTextSelectionGestureController *)v5->_gestureController configureOneFingerForcePressRecognizer:v5];
    }
  }
  else
  {

    v5 = 0;
  }

  return v5;
}

- (void)dealloc
{
  [(_UIKeyboardTextSelectionGestureController *)self->_gestureController willRemoveSelectionController];
  textSelectionController = self->_textSelectionController;
  self->_textSelectionController = 0;

  [(_UIKeyboardTextSelectionGestureController *)self->_gestureController didRemoveSelectionController];
  [(_UIKeyboardTextSelectionGestureController *)self->_gestureController setDelegate:0];
  gestureController = self->_gestureController;
  self->_gestureController = 0;

  v5.receiver = self;
  v5.super_class = (Class)_UINonEditableTextSelectionForceGesture;
  [(UIGestureRecognizer *)&v5 dealloc];
}

- (UIKeyboardTaskQueue)taskQueue
{
  return 0;
}

- (BOOL)_shouldDelayUntilForceLevelRequirementIsMet
{
  return 0;
}

- (void)willBeginGesture
{
  uint64_t v3 = [(_UINonEditableTextSelectionForceGesture *)self forceGestureDelegate];
  if (v3)
  {
    id v4 = (void *)v3;
    objc_super v5 = [(_UINonEditableTextSelectionForceGesture *)self forceGestureDelegate];
    char v6 = objc_opt_respondsToSelector();

    if (v6)
    {
      id v7 = [(_UINonEditableTextSelectionForceGesture *)self forceGestureDelegate];
      [v7 willBeginGesture];
    }
  }
}

- (_UINonEditableTextSelectionForceGestureDelegate)forceGestureDelegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->forceGestureDelegate);
  return (_UINonEditableTextSelectionForceGestureDelegate *)WeakRetained;
}

- (void)setForceGestureDelegate:(id)a3
{
}

- (_UIKeyboardTextSelectionController)textSelectionController
{
  return self->_textSelectionController;
}

- (void)setTextSelectionController:(id)a3
{
}

- (_UIKeyboardTextSelectionGestureController)gestureController
{
  return self->_gestureController;
}

- (void)setGestureController:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_gestureController, 0);
  objc_storeStrong((id *)&self->_textSelectionController, 0);
  objc_destroyWeak((id *)&self->forceGestureDelegate);
}

@end