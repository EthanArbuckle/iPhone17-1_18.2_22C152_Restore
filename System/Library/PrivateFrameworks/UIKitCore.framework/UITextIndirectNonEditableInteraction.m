@interface UITextIndirectNonEditableInteraction
- (BOOL)shouldAllowSelectionGestures:(BOOL)a3 atPoint:(CGPoint)a4 toBegin:(BOOL)a5;
- (BOOL)shouldAllowWithTouchTypes:(id)a3 atPoint:(CGPoint)a4 toBegin:(BOOL)a5;
- (UIKeyboardTaskQueue)taskQueue;
- (UITextIndirectNonEditableInteraction)initWithView:(id)a3;
- (_UIKeyboardTextSelectionController)textSelectionController;
- (void)_setupControllersIfNecessaryWithView:(id)a3;
- (void)dealloc;
- (void)didEndGesture;
- (void)finishSetup;
- (void)willBeginGesture;
@end

@implementation UITextIndirectNonEditableInteraction

- (void)finishSetup
{
  v4.receiver = self;
  v4.super_class = (Class)UITextIndirectNonEditableInteraction;
  [(UITextInteraction *)&v4 finishSetup];
  v3 = [(UITextInteraction *)self view];
  [(UITextIndirectNonEditableInteraction *)self _setupControllersIfNecessaryWithView:v3];
}

- (UITextIndirectNonEditableInteraction)initWithView:(id)a3
{
  id v4 = a3;
  v8.receiver = self;
  v8.super_class = (Class)UITextIndirectNonEditableInteraction;
  v5 = [(UITextInteraction *)&v8 init];
  v6 = v5;
  if (v4 && v5) {
    [(UITextIndirectNonEditableInteraction *)v5 _setupControllersIfNecessaryWithView:v4];
  }

  return v6;
}

- (void)_setupControllersIfNecessaryWithView:(id)a3
{
  id v4 = a3;
  if (!self->_textSelectionController || !self->super._textSelectionGestureController)
  {
    id v17 = v4;
    if ([v4 conformsToProtocol:&unk_1ED42F658])
    {
      id v5 = v17;
      if (!v5) {
        goto LABEL_12;
      }
    }
    else
    {
      v6 = [(UITextInteraction *)self root];
      id v5 = [v6 textInput];

      if (!v5)
      {
LABEL_12:

        id v4 = v17;
        goto LABEL_13;
      }
    }
    uint64_t v7 = [v5 inputDelegate];
    if (!v7) {
      goto LABEL_9;
    }
    objc_super v8 = (void *)v7;
    v9 = [v5 inputDelegate];
    v10 = +[UIKeyboardImpl activeInstance];

    if (v9 == v10)
    {
LABEL_9:
      int v11 = [v17 _usesAsynchronousProtocol];
      v12 = off_1E52D59D8;
      if (!v11) {
        v12 = off_1E52D5A08;
      }
      v13 = (_UIKeyboardTextSelectionController *)[objc_alloc(*v12) initWithInputDelegate:v5];
      textSelectionController = self->_textSelectionController;
      self->_textSelectionController = v13;

      v15 = objc_alloc_init(_UIKeyboardBasedNonEditableTextSelectionGestureController);
      textSelectionGestureController = self->super._textSelectionGestureController;
      self->super._textSelectionGestureController = &v15->super.super;

      [(_UIKeyboardTextSelectionGestureController *)self->super._textSelectionGestureController setDelegate:self];
    }
    goto LABEL_12;
  }
LABEL_13:
}

- (void)dealloc
{
  v3 = [(_UIKeyboardTextSelectionGestureController *)self->super._textSelectionGestureController delegate];

  if (v3 == self) {
    [(_UIKeyboardTextSelectionGestureController *)self->super._textSelectionGestureController setDelegate:0];
  }
  textSelectionController = self->_textSelectionController;
  self->_textSelectionController = 0;

  v5.receiver = self;
  v5.super_class = (Class)UITextIndirectNonEditableInteraction;
  [(UITextIndirectNonEditableInteraction *)&v5 dealloc];
}

- (UIKeyboardTaskQueue)taskQueue
{
  v2 = +[UIKeyboardImpl activeInstance];
  v3 = [v2 taskQueue];

  return (UIKeyboardTaskQueue *)v3;
}

- (_UIKeyboardTextSelectionController)textSelectionController
{
  return self->_textSelectionController;
}

- (void)willBeginGesture
{
  v2 = self;
  id v5 = [(UITextInteraction *)v2 assistantDelegate];
  uint64_t v3 = [(UITextInteraction *)v2 inGesture];
  [(UITextInteraction *)v2 setInGesture:1];
  [v5 checkEditabilityAndSetFirstResponderIfNecessary];
  id v4 = [v5 _editMenuAssistant];
  [v4 hideSelectionCommands];

  [(UITextInteraction *)v2 setInGesture:v3];
}

- (void)didEndGesture
{
  id v5 = [(UITextInteraction *)self assistantDelegate];
  if ([v5 needsGestureUpdate])
  {
    uint64_t v3 = [(UITextInteraction *)self _textInput];
    int v4 = [v3 isFirstResponder];

    if (v4)
    {
      [v5 setGestureRecognizers];
      [v5 setNeedsGestureUpdate:0];
    }
  }
}

- (BOOL)shouldAllowWithTouchTypes:(id)a3 atPoint:(CGPoint)a4 toBegin:(BOOL)a5
{
  uint64_t v5 = a5;
  double y = a4.y;
  double x = a4.x;
  id v9 = a3;
  v10 = [(UITextInteraction *)self root];
  LOBYTE(v5) = objc_msgSend(v10, "shouldAllowWithTouchTypes:atPoint:toBegin:", v9, v5, x, y);

  return v5;
}

- (BOOL)shouldAllowSelectionGestures:(BOOL)a3 atPoint:(CGPoint)a4 toBegin:(BOOL)a5
{
  BOOL v5 = a5;
  double y = a4.y;
  double x = a4.x;
  if ((objc_opt_respondsToSelector() & 1) == 0) {
    return 1;
  }
  textSelectionController = self->_textSelectionController;
  if (v5) {
    uint64_t v10 = 1;
  }
  else {
    uint64_t v10 = 2;
  }
  return -[_UIKeyboardTextSelectionController shouldAllowSelectionGestureWithTouchType:atPoint:toProgressToState:](textSelectionController, "shouldAllowSelectionGestureWithTouchType:atPoint:toProgressToState:", 0, v10, x, y);
}

- (void).cxx_destruct
{
}

@end