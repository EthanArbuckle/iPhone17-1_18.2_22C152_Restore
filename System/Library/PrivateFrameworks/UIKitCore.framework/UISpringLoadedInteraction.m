@interface UISpringLoadedInteraction
+ (UISpringLoadedInteraction)springLoadedInteractionWithHandler:(id)a3;
+ (id)_blinkEffect;
+ (id)_defaultInteractionBehavior;
+ (id)hysteresisBehaviorWithBeginningVelocity:(double)a3 cancelingVelocity:(double)a4;
- (BOOL)_shouldAllowInteractionWithContext:(id)a3;
- (UIDelayedAction)activateAction;
- (UIDelayedAction)emphasizeAction;
- (UISpringLoadedInteraction)initWithActivationHandler:(void *)handler;
- (UISpringLoadedInteraction)initWithInteractionBehavior:(id)interactionBehavior interactionEffect:(id)interactionEffect activationHandler:(void *)handler;
- (UISpringLoadedInteractionContextImpl)context;
- (UIView)view;
- (double)_possibleStateDuration;
- (id)_dynamicGestureRecognizersForEvent:(id)a3;
- (id)handler;
- (id)interactionBehavior;
- (id)interactionEffect;
- (void)_activateSpringLoading:(id)a3;
- (void)_cancelActions;
- (void)_emphasizeSpringLoading:(id)a3;
- (void)_reloadSpringLoadedInteractionBehavior;
- (void)_resetBehavior;
- (void)_setPossibleStateDuration:(double)a3;
- (void)_springloadedStateChanged:(id)a3;
- (void)_startActivateAction;
- (void)_startEmphasizeAction;
- (void)didMoveToView:(id)a3;
- (void)setActivateAction:(id)a3;
- (void)setContext:(id)a3;
- (void)setEmphasizeAction:(id)a3;
- (void)setHandler:(id)a3;
- (void)setState:(int64_t)a3;
- (void)setView:(id)a3;
@end

@implementation UISpringLoadedInteraction

- (UIView)view
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_view);
  return (UIView *)WeakRetained;
}

- (void)didMoveToView:(id)a3
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_view);
  objc_storeWeak((id *)&self->_view, v4);
  if (!v4 && WeakRetained)
  {
    objc_opt_class();
    long long v13 = 0u;
    long long v14 = 0u;
    long long v15 = 0u;
    long long v16 = 0u;
    v6 = objc_msgSend(WeakRetained, "gestureRecognizers", 0);
    uint64_t v7 = [v6 countByEnumeratingWithState:&v13 objects:v17 count:16];
    if (v7)
    {
      uint64_t v8 = v7;
      uint64_t v9 = *(void *)v14;
      do
      {
        uint64_t v10 = 0;
        do
        {
          if (*(void *)v14 != v9) {
            objc_enumerationMutation(v6);
          }
          v11 = *(void **)(*((void *)&v13 + 1) + 8 * v10);
          if (objc_opt_isKindOfClass())
          {
            v12 = [v11 delegate];

            if (v12 == self) {
              [WeakRetained removeGestureRecognizer:v11];
            }
          }
          ++v10;
        }
        while (v8 != v10);
        uint64_t v8 = [v6 countByEnumeratingWithState:&v13 objects:v17 count:16];
      }
      while (v8);
    }
  }
}

- (void)_setPossibleStateDuration:(double)a3
{
  self->_possibleStateDuration = a3;
}

- (UISpringLoadedInteraction)initWithInteractionBehavior:(id)interactionBehavior interactionEffect:(id)interactionEffect activationHandler:(void *)handler
{
  id v8 = interactionBehavior;
  id v9 = interactionEffect;
  uint64_t v10 = handler;
  v20.receiver = self;
  v20.super_class = (Class)UISpringLoadedInteraction;
  v11 = [(UISpringLoadedInteraction *)&v20 init];
  if (v11)
  {
    v12 = _Block_copy(v10);
    id v13 = v11->_handler;
    v11->_handler = v12;

    if (v8)
    {
      long long v14 = (UISpringLoadedInteractionBehavior *)v8;
      long long v15 = v11->_interactionBehavior;
      v11->_interactionBehavior = v14;
    }
    else
    {
      long long v16 = +[UISpringLoadedInteraction _defaultInteractionBehavior];
      [v16 setDelegate:v11];
      long long v15 = v11->_interactionBehavior;
      v11->_interactionBehavior = (UISpringLoadedInteractionBehavior *)v16;
    }

    if (v9)
    {
      v17 = (UISpringLoadedInteractionEffect *)v9;
    }
    else
    {
      v17 = +[UISpringLoadedInteraction _blinkEffect];
    }
    uint64_t v18 = v11->_interactionEffect;
    v11->_interactionEffect = v17;

    v11->_possibleStateDuration = 0.8;
  }

  return v11;
}

+ (id)hysteresisBehaviorWithBeginningVelocity:(double)a3 cancelingVelocity:(double)a4
{
  v6 = objc_alloc_init(_UISpringLoadedHysteresisBehavior);
  [(_UISpringLoadedHysteresisBehavior *)v6 setBeginningVelocityThreshold:a3];
  [(_UISpringLoadedHysteresisBehavior *)v6 setCancelingVelocityThreshold:a4];
  return v6;
}

+ (id)_defaultInteractionBehavior
{
  return (id)[a1 hysteresisBehaviorWithBeginningVelocity:20.0 cancelingVelocity:40.0];
}

+ (id)_blinkEffect
{
  v2 = objc_alloc_init(_UISpringLoadedBlinkingEffect);
  return v2;
}

- (UISpringLoadedInteraction)initWithActivationHandler:(void *)handler
{
  return [(UISpringLoadedInteraction *)self initWithInteractionBehavior:0 interactionEffect:0 activationHandler:handler];
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_activateAction, 0);
  objc_storeStrong((id *)&self->_emphasizeAction, 0);
  objc_storeStrong(&self->_handler, 0);
  objc_storeStrong((id *)&self->_context, 0);
  objc_storeStrong((id *)&self->_interactionEffect, 0);
  objc_storeStrong((id *)&self->_interactionBehavior, 0);
  objc_destroyWeak((id *)&self->_view);
}

+ (UISpringLoadedInteraction)springLoadedInteractionWithHandler:(id)a3
{
  id v4 = a3;
  id v5 = objc_alloc((Class)a1);
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __64__UISpringLoadedInteraction_springLoadedInteractionWithHandler___block_invoke;
  v9[3] = &unk_1E52EBFC8;
  id v10 = v4;
  id v6 = v4;
  uint64_t v7 = (void *)[v5 initWithActivationHandler:v9];

  return (UISpringLoadedInteraction *)v7;
}

uint64_t __64__UISpringLoadedInteraction_springLoadedInteractionWithHandler___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (id)_dynamicGestureRecognizersForEvent:(id)a3
{
  v7[1] = *MEMORY[0x1E4F143B8];
  id v4 = [(UIDragGestureRecognizer *)[UISpringLoadedGestureRecognizer alloc] initWithTarget:self action:sel__springloadedStateChanged_];
  [(UIGestureRecognizer *)v4 setDelegate:self];
  v7[0] = v4;
  id v5 = [MEMORY[0x1E4F1C978] arrayWithObjects:v7 count:1];

  return v5;
}

- (void)_springloadedStateChanged:(id)a3
{
  id v4 = a3;
  id v10 = [(UISpringLoadedInteraction *)self context];
  [v10 setCurrentRecognizer:v4];
  uint64_t v5 = [v4 state];

  if ((unint64_t)(v5 - 1) >= 2)
  {
    if (v5 == 3) {
      uint64_t v9 = 3;
    }
    else {
      uint64_t v9 = 0;
    }
    [(UISpringLoadedInteraction *)self setState:v9];
    [(UISpringLoadedInteraction *)self _resetBehavior];
    [(UISpringLoadedInteraction *)self setContext:0];
    goto LABEL_12;
  }
  BOOL v6 = [(UISpringLoadedInteraction *)self _shouldAllowInteractionWithContext:v10];
  if ([v10 state] <= 0 && v6)
  {
    uint64_t v7 = self;
    uint64_t v8 = 1;
  }
  else
  {
    if (v6) {
      goto LABEL_12;
    }
    uint64_t v7 = self;
    uint64_t v8 = 0;
  }
  [(UISpringLoadedInteraction *)v7 setState:v8];
LABEL_12:
}

- (void)setState:(int64_t)a3
{
  id v8 = [(UISpringLoadedInteraction *)self context];
  if ([v8 state] == a3)
  {
    if (a3 == 1) {
LABEL_5:
    }
      [(UISpringLoadedInteraction *)self _startEmphasizeAction];
  }
  else
  {
    [v8 setState:a3];
    uint64_t v5 = [(UISpringLoadedInteraction *)self view];
    [v8 setTargetView:v5];

    [(UISpringLoadedInteractionEffect *)self->_interactionEffect interaction:self didChangeWithContext:v8];
    switch(a3)
    {
      case 0:
        goto LABEL_9;
      case 1:
        goto LABEL_5;
      case 2:
        [(UISpringLoadedInteraction *)self _startActivateAction];
        break;
      case 3:
        handler = (void (**)(id, UISpringLoadedInteraction *, void *))self->_handler;
        if (handler)
        {
          uint64_t v7 = [(UISpringLoadedInteraction *)self context];
          handler[2](handler, self, v7);
        }
LABEL_9:
        [(UISpringLoadedInteraction *)self _cancelActions];
        break;
      default:
        break;
    }
  }
}

- (void)_reloadSpringLoadedInteractionBehavior
{
  id v4 = [(UISpringLoadedInteraction *)self context];
  v3 = [v4 currentRecognizer];
  [(UISpringLoadedInteraction *)self _springloadedStateChanged:v3];
}

- (void)_startEmphasizeAction
{
  v3 = [(UISpringLoadedInteraction *)self emphasizeAction];

  if (v3)
  {
    id v4 = [(UISpringLoadedInteraction *)self emphasizeAction];
    [(UIDelayedAction *)v4 touch];
  }
  else
  {
    id v4 = [[UIDelayedAction alloc] initWithTarget:self action:sel__emphasizeSpringLoading_ userInfo:0 delay:self->_possibleStateDuration];
    -[UISpringLoadedInteraction setEmphasizeAction:](self, "setEmphasizeAction:");
  }
}

- (void)_emphasizeSpringLoading:(id)a3
{
}

- (void)_startActivateAction
{
  v3 = [(UISpringLoadedInteraction *)self activateAction];

  if (v3)
  {
    id v4 = [(UISpringLoadedInteraction *)self activateAction];
    [(UIDelayedAction *)v4 touch];
  }
  else
  {
    id v4 = [[UIDelayedAction alloc] initWithTarget:self action:sel__activateSpringLoading_ userInfo:0 delay:0.4];
    -[UISpringLoadedInteraction setActivateAction:](self, "setActivateAction:");
  }
}

- (void)_activateSpringLoading:(id)a3
{
  id v4 = [(UISpringLoadedInteraction *)self context];
  v3 = [v4 currentRecognizer];
  [v3 spring];
}

- (void)_cancelActions
{
  v3 = [(UISpringLoadedInteraction *)self emphasizeAction];
  [v3 cancel];

  [(UISpringLoadedInteraction *)self setEmphasizeAction:0];
  id v4 = [(UISpringLoadedInteraction *)self activateAction];
  [v4 cancel];

  [(UISpringLoadedInteraction *)self setActivateAction:0];
}

- (UISpringLoadedInteractionContextImpl)context
{
  context = self->_context;
  if (!context)
  {
    id v4 = (UISpringLoadedInteractionContextImpl *)objc_opt_new();
    uint64_t v5 = self->_context;
    self->_context = v4;

    BOOL v6 = [(UISpringLoadedInteraction *)self view];
    [(UISpringLoadedInteractionContextImpl *)self->_context setTargetView:v6];

    context = self->_context;
  }
  return context;
}

- (void)_resetBehavior
{
  v3 = self->_interactionBehavior;
  if (objc_opt_respondsToSelector()) {
    [(UISpringLoadedInteractionBehavior *)v3 interactionDidFinish:self];
  }
}

- (BOOL)_shouldAllowInteractionWithContext:(id)a3
{
  id v4 = a3;
  uint64_t v5 = self->_interactionBehavior;
  if (objc_opt_respondsToSelector()) {
    char v6 = [(UISpringLoadedInteractionBehavior *)v5 shouldAllowInteraction:self withContext:v4];
  }
  else {
    char v6 = 1;
  }

  return v6;
}

- (void)setView:(id)a3
{
}

- (double)_possibleStateDuration
{
  return self->_possibleStateDuration;
}

- (id)interactionBehavior
{
  return self->_interactionBehavior;
}

- (id)interactionEffect
{
  return self->_interactionEffect;
}

- (void)setContext:(id)a3
{
}

- (id)handler
{
  return self->_handler;
}

- (void)setHandler:(id)a3
{
}

- (UIDelayedAction)emphasizeAction
{
  return self->_emphasizeAction;
}

- (void)setEmphasizeAction:(id)a3
{
}

- (UIDelayedAction)activateAction
{
  return self->_activateAction;
}

- (void)setActivateAction:(id)a3
{
}

@end