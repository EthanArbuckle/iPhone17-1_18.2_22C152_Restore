@interface UIEditingOverlayViewController
- (BOOL)_canShowWhileLocked;
- (UIInteraction)pencilTextInputInteraction;
- (UIUndoGestureInteraction)undoInteraction;
- (_UIActionWhenIdle)addPencilTextInputInteractionAction;
- (void)_addInteractions;
- (void)_addPencilTextInputInteraction;
- (void)_removeInteractions;
- (void)loadView;
- (void)setAddPencilTextInputInteractionAction:(id)a3;
- (void)setPencilTextInputInteraction:(id)a3;
- (void)setUndoInteraction:(id)a3;
- (void)updateEditingOverlayContainer;
- (void)viewDidLoad;
@end

@implementation UIEditingOverlayViewController

- (void)loadView
{
  v3 = [(UIViewController *)self presentingViewController];
  if (v3)
  {
    v4 = [(UIViewController *)self presentingViewController];
    v5 = [v4 view];
    [v5 bounds];
    double v7 = v6;
    double v9 = v8;
    double v11 = v10;
    double v13 = v12;
  }
  else
  {
    [(UIViewController *)self _defaultInitialViewFrame];
    double v7 = v14;
    double v9 = v15;
    double v11 = v16;
    double v13 = v17;
  }

  v18 = -[UIView initWithFrame:]([UIEditingOverlayGestureView alloc], "initWithFrame:", v7, v9, v11, v13);
  [(UIView *)v18 setAutoresizingMask:18];
  [(UIViewController *)self setView:v18];
}

- (BOOL)_canShowWhileLocked
{
  return 1;
}

- (void)_addInteractions
{
  v3 = [(UIViewController *)self traitCollection];
  if ([(UIUndoGestureInteraction *)v3 userInterfaceIdiom] != 3)
  {
    v4 = [(UIEditingOverlayViewController *)self undoInteraction];

    if (v4) {
      goto LABEL_5;
    }
    v3 = objc_alloc_init(UIUndoGestureInteraction);
    [(UIEditingOverlayViewController *)self setUndoInteraction:v3];
  }

LABEL_5:
  v5 = [(UIEditingOverlayViewController *)self undoInteraction];

  if (v5)
  {
    double v6 = [(UIViewController *)self view];
    double v7 = [(UIEditingOverlayViewController *)self undoInteraction];
    [v6 addInteraction:v7];
  }
  double v8 = +[UIDevice currentDevice];
  int v9 = [v8 _supportsPencil];

  if (v9)
  {
    id v10 = +[_UIActionWhenIdle actionWhenIdleWithTarget:self selector:sel__addPencilTextInputInteraction object:0];
    [(UIEditingOverlayViewController *)self setAddPencilTextInputInteractionAction:v10];
  }
}

- (UIUndoGestureInteraction)undoInteraction
{
  return self->_undoInteraction;
}

- (void)setUndoInteraction:(id)a3
{
}

- (void)viewDidLoad
{
  v2.receiver = self;
  v2.super_class = (Class)UIEditingOverlayViewController;
  [(UIViewController *)&v2 viewDidLoad];
}

- (void)_addPencilTextInputInteraction
{
  v3 = [(UIEditingOverlayViewController *)self addPencilTextInputInteractionAction];
  [v3 invalidate];

  [(UIEditingOverlayViewController *)self setAddPencilTextInputInteractionAction:0];
  v4 = [(UIEditingOverlayViewController *)self pencilTextInputInteraction];

  if (!v4)
  {
    uint64_t v14 = 0;
    double v15 = &v14;
    uint64_t v16 = 0x2050000000;
    v5 = (void *)_MergedGlobals_7_7;
    uint64_t v17 = _MergedGlobals_7_7;
    if (!_MergedGlobals_7_7)
    {
      v13[0] = MEMORY[0x1E4F143A8];
      v13[1] = 3221225472;
      v13[2] = __getPKTextInputInteractionClass_block_invoke_0;
      v13[3] = &unk_1E52D9900;
      v13[4] = &v14;
      __getPKTextInputInteractionClass_block_invoke_0((uint64_t)v13);
      v5 = (void *)v15[3];
    }
    double v6 = v5;
    _Block_object_dispose(&v14, 8);
    id v7 = objc_alloc_init(v6);
    [(UIEditingOverlayViewController *)self setPencilTextInputInteraction:v7];
  }
  double v8 = [(UIEditingOverlayViewController *)self pencilTextInputInteraction];

  if (v8)
  {
    int v9 = [(UIViewController *)self view];
    id v10 = [(UIEditingOverlayViewController *)self pencilTextInputInteraction];
    [v9 addInteraction:v10];
  }
  double v11 = +[UIKeyboard suppressionPolicyDelegate];

  if (!v11)
  {
    double v12 = objc_alloc_init(_UIKeyboardSuppressionPencilPolicyDelegate);
    +[UIKeyboard setSuppressionPolicyDelegate:v12];
  }
}

- (void)_removeInteractions
{
  v3 = [(UIEditingOverlayViewController *)self undoInteraction];

  if (v3)
  {
    v4 = [(UIViewController *)self view];
    v5 = [(UIEditingOverlayViewController *)self undoInteraction];
    [v4 removeInteraction:v5];
  }
  double v6 = [(UIEditingOverlayViewController *)self addPencilTextInputInteractionAction];
  [v6 invalidate];

  [(UIEditingOverlayViewController *)self setAddPencilTextInputInteractionAction:0];
  id v7 = [(UIEditingOverlayViewController *)self pencilTextInputInteraction];

  if (v7)
  {
    id v9 = [(UIViewController *)self view];
    double v8 = [(UIEditingOverlayViewController *)self pencilTextInputInteraction];
    [v9 removeInteraction:v8];
  }
}

- (void)updateEditingOverlayContainer
{
  uint64_t v29 = *MEMORY[0x1E4F143B8];
  v3 = [(UIViewController *)self view];
  v4 = [v3 window];
  int v5 = [v4 _isTextEffectsWindow];

  double v6 = [(UIViewController *)self view];
  id v7 = [v6 window];
  double v8 = v7;
  if (v5) {
    [v7 actualSceneBounds];
  }
  else {
    [v7 _sceneBounds];
  }
  double v13 = v9;
  double v14 = v10;
  double v15 = v11;
  double v16 = v12;

  long long v26 = 0u;
  long long v27 = 0u;
  long long v24 = 0u;
  long long v25 = 0u;
  uint64_t v17 = [(UIViewController *)self view];
  v18 = [v17 interactions];

  uint64_t v19 = [v18 countByEnumeratingWithState:&v24 objects:v28 count:16];
  if (v19)
  {
    uint64_t v20 = v19;
    uint64_t v21 = *(void *)v25;
    do
    {
      for (uint64_t i = 0; i != v20; ++i)
      {
        if (*(void *)v25 != v21) {
          objc_enumerationMutation(v18);
        }
        v23 = *(void **)(*((void *)&v24 + 1) + 8 * i);
        if ([v23 conformsToProtocol:&unk_1ED5FF5F8]) {
          objc_msgSend(v23, "editingOverlayContainerDidChangeToSceneBounds:", v13, v14, v15, v16);
        }
      }
      uint64_t v20 = [v18 countByEnumeratingWithState:&v24 objects:v28 count:16];
    }
    while (v20);
  }
}

- (_UIActionWhenIdle)addPencilTextInputInteractionAction
{
  return self->_addPencilTextInputInteractionAction;
}

- (void)setAddPencilTextInputInteractionAction:(id)a3
{
}

- (UIInteraction)pencilTextInputInteraction
{
  return self->_pencilTextInputInteraction;
}

- (void)setPencilTextInputInteraction:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_pencilTextInputInteraction, 0);
  objc_storeStrong((id *)&self->_addPencilTextInputInteractionAction, 0);
  objc_storeStrong((id *)&self->_undoInteraction, 0);
}

@end