@interface _UIPassthroughScrollInteraction
+ (BOOL)_isPassthroughGestureRecognizer:(id)a3;
+ (BOOL)_shouldEventBePassedThrough:(id)a3;
- (BOOL)_delegateShouldInteractAtLocation:(CGPoint)a3 withEvent:(id)a4;
- (BOOL)_passthroughGestureRecognizer:(id)a3 shouldInteractAtLocation:(CGPoint)a4 withEvent:(id)a5;
- (BOOL)_passthroughScrollGestureRecognizerShouldRequireFailureOfGestureRecognizer:(id)a3;
- (BOOL)configuredForInactiveInteractionEventsOnly;
- (BOOL)eatsTouches;
- (BOOL)gestureRecognizer:(id)a3 shouldBeRequiredToFailByGestureRecognizer:(id)a4;
- (BOOL)gestureRecognizer:(id)a3 shouldRecognizeSimultaneouslyWithGestureRecognizer:(id)a4;
- (BOOL)gestureRecognizer:(id)a3 shouldRequireFailureOfGestureRecognizer:(id)a4;
- (BOOL)hitTestsAsOpaque;
- (BOOL)recognizeOnPrimaryButtonDown;
- (BOOL)recognizeOnSecondaryButtonDown;
- (NSString)description;
- (UIView)_touchFallbackView;
- (UIView)view;
- (_UIPassthroughGateGestureRecognizer)_gestureGate;
- (_UIPassthroughScrollGestureRecognizer)_passthroughScrollGestureRecognizer;
- (_UIPassthroughScrollInteraction)init;
- (_UIPassthroughScrollInteractionDelegate)delegate;
- (void)_gestureRecognizerFailed:(id)a3;
- (void)_handlePassthroughGestureRecognizerEndWithReason:(unint64_t)a3;
- (void)_handlePassthroughRecognizer:(id)a3;
- (void)_setOverrideAllowsHitTestingOnTouchFallbackView:(BOOL)a3;
- (void)_setUpForWindow:(id)a3;
- (void)_tearDown;
- (void)_updateGesturesEatTouches;
- (void)dealloc;
- (void)didMoveToView:(id)a3;
- (void)setConfiguredForInactiveInteractionEventsOnly:(BOOL)a3;
- (void)setDelegate:(id)a3;
- (void)setEatsTouches:(BOOL)a3;
- (void)setHitTestsAsOpaque:(BOOL)a3;
- (void)setRecognizeOnPrimaryButtonDown:(BOOL)a3;
- (void)setRecognizeOnSecondaryButtonDown:(BOOL)a3;
@end

@implementation _UIPassthroughScrollInteraction

- (void)_setUpForWindow:(id)a3
{
  id v17 = a3;
  if ([(_UIPassthroughScrollInteraction *)self configuredForInactiveInteractionEventsOnly])
  {
    v4 = [(_UIPassthroughScrollInteraction *)self _passthroughScrollGestureRecognizer];
    [v4 _setAcceptsFailureRequiments:0];

    v5 = [(_UIPassthroughScrollInteraction *)self _gestureGate];
    [v5 _setAcceptsFailureRequiments:0];
  }
  else
  {
    [v17 bounds];
    double v7 = v6;
    double v9 = v8;
    double v11 = v10;
    double v13 = v12;
    v14 = [(_UIPassthroughScrollInteraction *)self _touchFallbackView];
    objc_msgSend(v14, "setFrame:", v7, v9, v11, v13);

    v5 = [(_UIPassthroughScrollInteraction *)self _touchFallbackView];
    [v17 insertSubview:v5 atIndex:0];
  }

  v15 = [(_UIPassthroughScrollInteraction *)self _passthroughScrollGestureRecognizer];
  [v17 addGestureRecognizer:v15];

  v16 = [(_UIPassthroughScrollInteraction *)self _gestureGate];
  [v17 addGestureRecognizer:v16];

  [(_UIPassthroughScrollInteraction *)self _updateGesturesEatTouches];
}

- (UIView)_touchFallbackView
{
  if (!self->_touchFallbackView
    && ![(_UIPassthroughScrollInteraction *)self configuredForInactiveInteractionEventsOnly])
  {
    v3 = objc_alloc_init(_UITouchFallbackView);
    touchFallbackView = self->_touchFallbackView;
    self->_touchFallbackView = &v3->super;

    [(UIView *)self->_touchFallbackView setAutoresizingMask:18];
  }
  v5 = self->_touchFallbackView;
  return v5;
}

- (void)didMoveToView:(id)a3
{
  objc_storeWeak((id *)&self->_view, a3);
  v5 = [(_UIPassthroughScrollInteraction *)self view];

  if (v5)
  {
    double v6 = [(_UIPassthroughScrollInteraction *)self view];
    double v7 = [v6 _window];

    if (!v7)
    {
      double v9 = [MEMORY[0x1E4F28B00] currentHandler];
      [v9 handleFailureInMethod:a2 object:self file:@"_UIPassthroughScrollInteraction.m" lineNumber:178 description:@"The view should already be in the window before adding a _UIPassthroughScrollInteraction"];
    }
    id v10 = [(_UIPassthroughScrollInteraction *)self view];
    double v8 = [v10 _window];
    [(_UIPassthroughScrollInteraction *)self _setUpForWindow:v8];
  }
}

- (UIView)view
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_view);
  return (UIView *)WeakRetained;
}

- (void)setRecognizeOnPrimaryButtonDown:(BOOL)a3
{
  BOOL v3 = a3;
  self->_recognizeOnPrimaryButtonDown = a3;
  id v4 = [(_UIPassthroughScrollInteraction *)self _passthroughScrollGestureRecognizer];
  [v4 setEndForPrimaryButtonDown:v3];
}

- (void)setEatsTouches:(BOOL)a3
{
  if (self->_eatsTouches != a3)
  {
    self->_eatsTouches = a3;
    [(_UIPassthroughScrollInteraction *)self _updateGesturesEatTouches];
  }
}

- (void)setDelegate:(id)a3
{
}

- (_UIPassthroughScrollInteraction)init
{
  v3.receiver = self;
  v3.super_class = (Class)_UIPassthroughScrollInteraction;
  result = [(_UIPassthroughScrollInteraction *)&v3 init];
  if (result) {
    result->_eatsTouches = 1;
  }
  return result;
}

- (BOOL)eatsTouches
{
  return self->_eatsTouches;
}

- (BOOL)configuredForInactiveInteractionEventsOnly
{
  return self->_configuredForInactiveInteractionEventsOnly;
}

- (void)_updateGesturesEatTouches
{
  objc_super v3 = self->_passthroughScrollGestureRecognizer;
  [(UIGestureRecognizer *)v3 setCancelsTouchesInView:0];
  [(UIGestureRecognizer *)v3 setDelaysTouchesBegan:0];
  [(UIGestureRecognizer *)v3 setDelaysTouchesEnded:0];

  BOOL v4 = [(_UIPassthroughScrollInteraction *)self eatsTouches];
  id v5 = [(_UIPassthroughScrollInteraction *)self _gestureGate];
  [v5 setCancelsTouchesInView:1];
  [v5 setDelaysTouchesBegan:v4];
  [v5 setDelaysTouchesEnded:v4];
}

- (void)_tearDown
{
  [(UIView *)self->_touchFallbackView removeFromSuperview];
  objc_super v3 = [(UIGestureRecognizer *)self->_passthroughScrollGestureRecognizer view];
  [v3 removeGestureRecognizer:self->_passthroughScrollGestureRecognizer];

  id v4 = [(UIGestureRecognizer *)self->_gestureGate view];
  [v4 removeGestureRecognizer:self->_gestureGate];
}

- (_UIPassthroughScrollGestureRecognizer)_passthroughScrollGestureRecognizer
{
  passthroughScrollGestureRecognizer = self->_passthroughScrollGestureRecognizer;
  if (!passthroughScrollGestureRecognizer)
  {
    id v4 = [[_UIPassthroughScrollGestureRecognizer alloc] initWithTarget:self action:sel__handlePassthroughRecognizer_];
    id v5 = self->_passthroughScrollGestureRecognizer;
    self->_passthroughScrollGestureRecognizer = v4;

    [(UIGestureRecognizer *)self->_passthroughScrollGestureRecognizer setDelegate:self];
    passthroughScrollGestureRecognizer = self->_passthroughScrollGestureRecognizer;
  }
  return passthroughScrollGestureRecognizer;
}

- (_UIPassthroughGateGestureRecognizer)_gestureGate
{
  gestureGate = self->_gestureGate;
  if (!gestureGate)
  {
    id v4 = objc_alloc_init(_UIPassthroughGateGestureRecognizer);
    id v5 = self->_gestureGate;
    self->_gestureGate = v4;

    [(UIGestureRecognizer *)self->_gestureGate setDelegate:self];
    gestureGate = self->_gestureGate;
  }
  return gestureGate;
}

+ (BOOL)_shouldEventBePassedThrough:(id)a3
{
  return +[_UIPassthroughScrollGestureRecognizer canHandleEventForPassthrough:a3];
}

- (NSString)description
{
  objc_super v3 = NSString;
  id v4 = (objc_class *)objc_opt_class();
  id v5 = NSStringFromClass(v4);
  id WeakRetained = objc_loadWeakRetained((id *)&self->_view);
  double v7 = [v3 stringWithFormat:@"<%@ %p view: %@>", v5, self, WeakRetained];

  return (NSString *)v7;
}

- (BOOL)hitTestsAsOpaque
{
  v2 = [(_UIPassthroughScrollInteraction *)self _touchFallbackView];
  objc_super v3 = [v2 layer];
  char v4 = [v3 hitTestsAsOpaque];

  return v4;
}

- (void)setHitTestsAsOpaque:(BOOL)a3
{
  BOOL v3 = a3;
  id v5 = [(_UIPassthroughScrollInteraction *)self _touchFallbackView];
  char v4 = [v5 layer];
  [v4 setHitTestsAsOpaque:v3];
}

- (void)setRecognizeOnSecondaryButtonDown:(BOOL)a3
{
  BOOL v3 = a3;
  self->_recognizeOnSecondaryButtonDown = a3;
  id v4 = [(_UIPassthroughScrollInteraction *)self _passthroughScrollGestureRecognizer];
  [v4 setEndForSecondaryButtonDown:v3];
}

- (void)dealloc
{
  [(_UIPassthroughScrollInteraction *)self _tearDown];
  v3.receiver = self;
  v3.super_class = (Class)_UIPassthroughScrollInteraction;
  [(_UIPassthroughScrollInteraction *)&v3 dealloc];
}

+ (BOOL)_isPassthroughGestureRecognizer:(id)a3
{
  id v3 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    char isKindOfClass = 1;
  }
  else
  {
    objc_opt_class();
    char isKindOfClass = objc_opt_isKindOfClass();
  }

  return isKindOfClass & 1;
}

- (void)_handlePassthroughRecognizer:(id)a3
{
  id v4 = a3;
  if ([v4 state] == 3)
  {
    uint64_t v5 = [v4 endReason];
    v6[0] = MEMORY[0x1E4F143A8];
    v6[1] = 3221225472;
    v6[2] = __64___UIPassthroughScrollInteraction__handlePassthroughRecognizer___block_invoke;
    v6[3] = &unk_1E52D9CD0;
    v6[4] = self;
    v6[5] = v5;
    dispatch_async(MEMORY[0x1E4F14428], v6);
  }
}

- (void)_handlePassthroughGestureRecognizerEndWithReason:(unint64_t)a3
{
  switch(a3)
  {
    case 0uLL:
    case 1uLL:
      goto LABEL_11;
    case 2uLL:
      double v11 = [(_UIPassthroughScrollInteraction *)self delegate];
      int v12 = [v11 passthroughScrollInteractionDidRecognize:self];

      if (!v12 || [(_UIPassthroughScrollInteraction *)self eatsTouches])
      {
LABEL_11:
        gestureGate = self->_gestureGate;
        goto LABEL_12;
      }
      gestureGate = self->_gestureGate;
      goto LABEL_21;
    case 3uLL:
      double v8 = [(_UIPassthroughScrollInteraction *)self delegate];
      int v9 = [v8 passthroughScrollInteractionDidRecognize:self];

      BOOL v10 = ![(_UIPassthroughScrollInteraction *)self configuredForInactiveInteractionEventsOnly]&& [(_UIPassthroughScrollInteraction *)self eatsTouches];
      if (!v9 || v10)
      {
        gestureGate = self->_gestureGate;
LABEL_12:
        [(_UIPassthroughGateGestureRecognizer *)gestureGate endClosed];
      }
      else
      {
        gestureGate = self->_gestureGate;
LABEL_21:
        [(_UIPassthroughGateGestureRecognizer *)gestureGate open];
      }
      return;
    case 4uLL:
    case 5uLL:
    case 6uLL:
      id v4 = [(_UIPassthroughScrollInteraction *)self delegate];
      int v5 = [v4 passthroughScrollInteractionDidRecognize:self];

      gestureGate = self->_gestureGate;
      if (v5) {
        goto LABEL_21;
      }
      goto LABEL_12;
    default:
      id v13 = [MEMORY[0x1E4F28B00] currentHandler];
      [v13 handleFailureInMethod:a2 object:self file:@"_UIPassthroughScrollInteraction.m" lineNumber:255 description:@"Unknown end reason received when handling end of a passthrough gesture recognizer"];

      return;
  }
}

- (BOOL)_delegateShouldInteractAtLocation:(CGPoint)a3 withEvent:(id)a4
{
  double y = a3.y;
  double x = a3.x;
  id v7 = a4;
  double v8 = [(_UIPassthroughScrollInteraction *)self delegate];
  if (v8)
  {
    int v9 = [(_UIPassthroughScrollInteraction *)self delegate];
    char v10 = objc_msgSend(v9, "passthroughScrollInteraction:shouldInteractAtLocation:withEvent:", self, v7, x, y);
  }
  else
  {
    char v10 = 1;
  }

  return v10;
}

- (void)_setOverrideAllowsHitTestingOnTouchFallbackView:(BOOL)a3
{
  BOOL v3 = a3;
  id v4 = [(UIView *)self->_touchFallbackView layer];
  [v4 setAllowsHitTesting:v3];
}

- (BOOL)gestureRecognizer:(id)a3 shouldBeRequiredToFailByGestureRecognizer:(id)a4
{
  id v6 = a3;
  id v7 = (_UIPassthroughScrollGestureRecognizer *)a4;
  id v8 = [(_UIPassthroughScrollInteraction *)self _gestureGate];
  if (v8 == v6)
  {
    passthroughScrollGestureRecognizer = self->_passthroughScrollGestureRecognizer;

    if (passthroughScrollGestureRecognizer != v7)
    {
      BOOL v9 = ![(_UIPassthroughScrollInteraction *)self _passthroughScrollGestureRecognizerShouldRequireFailureOfGestureRecognizer:v7];
      goto LABEL_6;
    }
  }
  else
  {
  }
  LOBYTE(v9) = 0;
LABEL_6:

  return v9;
}

- (BOOL)gestureRecognizer:(id)a3 shouldRequireFailureOfGestureRecognizer:(id)a4
{
  id v6 = (_UIPassthroughScrollGestureRecognizer *)a4;
  id v7 = a3;
  id v8 = [(_UIPassthroughScrollInteraction *)self _gestureGate];

  BOOL v9 = v8 == v7
    && self->_passthroughScrollGestureRecognizer != v6
    && [(_UIPassthroughScrollInteraction *)self _passthroughScrollGestureRecognizerShouldRequireFailureOfGestureRecognizer:v6];

  return v9;
}

- (BOOL)gestureRecognizer:(id)a3 shouldRecognizeSimultaneouslyWithGestureRecognizer:(id)a4
{
  return [a4 _isGestureType:1] ^ 1;
}

- (BOOL)_passthroughGestureRecognizer:(id)a3 shouldInteractAtLocation:(CGPoint)a4 withEvent:(id)a5
{
  double y = a4.y;
  double x = a4.x;
  id v9 = a5;
  char v10 = [a3 view];
  double v11 = [(_UIPassthroughScrollInteraction *)self view];
  objc_msgSend(v10, "convertPoint:toView:", v11, x, y);
  double v13 = v12;
  double v15 = v14;

  LOBYTE(v10) = -[_UIPassthroughScrollInteraction _delegateShouldInteractAtLocation:withEvent:](self, "_delegateShouldInteractAtLocation:withEvent:", v9, v13, v15);
  return (char)v10;
}

- (void)_gestureRecognizerFailed:(id)a3
{
}

- (BOOL)_passthroughScrollGestureRecognizerShouldRequireFailureOfGestureRecognizer:(id)a3
{
  uint64_t v26 = *MEMORY[0x1E4F143B8];
  id v4 = (_UIPassthroughScrollGestureRecognizer *)a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0
    || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0)
    || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0)
    || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0)
    || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
  {
    BOOL v5 = 1;
    goto LABEL_7;
  }
  id v7 = self->_passthroughScrollGestureRecognizer;
  if (self->_passthroughScrollGestureRecognizer == v4
    || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0)
    || ([(UIGestureRecognizer *)v4 view],
        id v8 = objc_claimAutoreleasedReturnValue(),
        [(UIGestureRecognizer *)self->_passthroughScrollGestureRecognizer view],
        id v9 = objc_claimAutoreleasedReturnValue(),
        v9,
        v8,
        v8 != v9))
  {
    BOOL v5 = 0;
    goto LABEL_12;
  }
  char v10 = [(UIGestureRecognizer *)v4 delegate];
  if ([v10 configuredForInactiveInteractionEventsOnly])
  {
    BOOL v5 = 1;
    goto LABEL_30;
  }
  double v11 = [(UIGestureRecognizer *)v7 view];
  double v12 = [v11 gestureRecognizers];

  long long v23 = 0u;
  long long v24 = 0u;
  long long v21 = 0u;
  long long v22 = 0u;
  id v13 = v12;
  uint64_t v14 = [v13 countByEnumeratingWithState:&v21 objects:v25 count:16];
  if (!v14)
  {
    v19 = 0;
    goto LABEL_29;
  }
  uint64_t v15 = v14;
  uint64_t v16 = *(void *)v22;
  while (2)
  {
    for (uint64_t i = 0; i != v15; ++i)
    {
      if (*(void *)v22 != v16) {
        objc_enumerationMutation(v13);
      }
      v18 = *(_UIPassthroughScrollGestureRecognizer **)(*((void *)&v21 + 1) + 8 * i);
      if (v18 == v7)
      {
        v20 = v7;
LABEL_28:
        v19 = v20;
        goto LABEL_29;
      }
      if (v18 == v4)
      {
        v20 = v4;
        goto LABEL_28;
      }
    }
    uint64_t v15 = [v13 countByEnumeratingWithState:&v21 objects:v25 count:16];
    v19 = 0;
    if (v15) {
      continue;
    }
    break;
  }
LABEL_29:

  BOOL v5 = v19 == v7;
LABEL_30:

LABEL_12:
LABEL_7:

  return v5;
}

- (_UIPassthroughScrollInteractionDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  return (_UIPassthroughScrollInteractionDelegate *)WeakRetained;
}

- (BOOL)recognizeOnPrimaryButtonDown
{
  return self->_recognizeOnPrimaryButtonDown;
}

- (BOOL)recognizeOnSecondaryButtonDown
{
  return self->_recognizeOnSecondaryButtonDown;
}

- (void)setConfiguredForInactiveInteractionEventsOnly:(BOOL)a3
{
  self->_configuredForInactiveInteractionEventsOnldouble y = a3;
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_gestureGate, 0);
  objc_storeStrong((id *)&self->_passthroughScrollGestureRecognizer, 0);
  objc_storeStrong((id *)&self->_touchFallbackView, 0);
  objc_destroyWeak((id *)&self->_view);
}

@end