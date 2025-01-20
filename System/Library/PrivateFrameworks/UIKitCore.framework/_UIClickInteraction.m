@interface _UIClickInteraction
- (BOOL)driverCancelsTouchesInView;
- (BOOL)hapticsEnabled;
- (CGPoint)locationInCoordinateSpace:(id)a3;
- (Class)_driverClass;
- (Class)overrideDriverClass;
- (UIInteractionEffect)interactionEffect;
- (UIView)view;
- (_UIClickFeedbackGenerator)feedbackGenerator;
- (_UIClickInteraction)init;
- (_UIClickInteractionDelegate)delegate;
- (_UIClickInteractionDriving)driver;
- (double)allowableMovement;
- (void)_beginInteraction;
- (void)_createFeedbackGenerator;
- (void)_endInteraction;
- (void)_setOverrideDriverClass:(Class)a3;
- (void)_updateDriver;
- (void)cancelInteraction;
- (void)clickDriver:(id)a3 didPerformEvent:(unint64_t)a4;
- (void)clickDriver:(id)a3 didUpdateHighlightProgress:(double)a4;
- (void)clickDriver:(id)a3 shouldBegin:(id)a4;
- (void)didMoveToView:(id)a3;
- (void)setAllowableMovement:(double)a3;
- (void)setDelegate:(id)a3;
- (void)setDriver:(id)a3;
- (void)setDriverCancelsTouchesInView:(BOOL)a3;
- (void)setFeedbackGenerator:(id)a3;
- (void)setHapticsEnabled:(BOOL)a3;
- (void)setInteractionEffect:(id)a3;
- (void)willMoveToView:(id)a3;
@end

@implementation _UIClickInteraction

- (void)willMoveToView:(id)a3
{
  interactionEffect = self->_interactionEffect;
  self->_interactionEffect = 0;

  id v5 = [(_UIClickInteraction *)self driver];
  [v5 setView:0];
}

- (void)setDelegate:(id)a3
{
}

- (void)didMoveToView:(id)a3
{
  id v4 = objc_storeWeak((id *)&self->_view, a3);
  if (a3) {
    [(_UIClickInteraction *)self _updateDriver];
  }
}

- (_UIClickInteraction)init
{
  v5.receiver = self;
  v5.super_class = (Class)_UIClickInteraction;
  v2 = [(_UIClickInteraction *)&v5 init];
  v3 = v2;
  if (v2)
  {
    [(_UIClickInteraction *)v2 setAllowableMovement:44.0];
    [(_UIClickInteraction *)v3 setHapticsEnabled:1];
  }
  return v3;
}

- (void)setHapticsEnabled:(BOOL)a3
{
  self->_hapticsEnabled = a3;
}

- (void)setAllowableMovement:(double)a3
{
  if (self->_allowableMovement != a3)
  {
    self->_allowableMovement = a3;
    id v4 = [(_UIClickInteraction *)self driver];
    [v4 setAllowableMovement:a3];
  }
}

- (void)_updateDriver
{
  v3 = [(_UIClickInteraction *)self _driverClass];
  id v4 = [(_UIClickInteraction *)self driver];
  if (objc_opt_class())
  {
    objc_super v5 = [(_UIClickInteraction *)self driver];
    uint64_t v6 = objc_opt_class();

    if (v3 == (objc_class *)v6) {
      return;
    }
  }
  else
  {
  }
  v7 = [(_UIClickInteraction *)self driver];
  [v7 setView:0];

  id v9 = (id)objc_opt_new();
  [v9 setDelegate:self];
  v8 = [(_UIClickInteraction *)self view];
  [v9 setView:v8];

  [(_UIClickInteraction *)self allowableMovement];
  objc_msgSend(v9, "setAllowableMovement:");
  [(_UIClickInteraction *)self setDriver:v9];
}

- (_UIClickInteractionDriving)driver
{
  return self->_driver;
}

- (UIView)view
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_view);
  return (UIView *)WeakRetained;
}

- (void)setDriver:(id)a3
{
}

- (double)allowableMovement
{
  return self->_allowableMovement;
}

- (Class)_driverClass
{
  v3 = [(_UIClickInteraction *)self overrideDriverClass];
  if (!v3)
  {
    id v4 = [(_UIClickInteraction *)self delegate];
    if (objc_opt_respondsToSelector()) {
      [v4 _clickInteractionDefaultDriverType:self];
    }
    v3 = (objc_class *)_UIClickInteractionDriverForActivationStyle();
  }
  return v3;
}

- (Class)overrideDriverClass
{
  return self->_overrideDriverClass;
}

- (_UIClickInteractionDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  return (_UIClickInteractionDelegate *)WeakRetained;
}

- (void)cancelInteraction
{
  id v2 = [(_UIClickInteraction *)self driver];
  [v2 cancelInteraction];
}

- (CGPoint)locationInCoordinateSpace:(id)a3
{
  id v4 = a3;
  objc_super v5 = [(_UIClickInteraction *)self driver];
  [v5 locationInCoordinateSpace:v4];
  double v7 = v6;
  double v9 = v8;

  double v10 = v7;
  double v11 = v9;
  result.y = v11;
  result.x = v10;
  return result;
}

- (void)_beginInteraction
{
  id v6 = [(_UIClickInteraction *)self delegate];
  v3 = [(_UIClickInteraction *)self interactionEffect];

  if (!v3 && (objc_opt_respondsToSelector() & 1) != 0)
  {
    id v4 = [v6 highlightEffectForClickInteraction:self];
    interactionEffect = self->_interactionEffect;
    self->_interactionEffect = v4;
  }
  [(_UIClickInteraction *)self _createFeedbackGenerator];
}

- (void)_endInteraction
{
  v3 = [(_UIClickInteraction *)self interactionEffect];

  if (v3)
  {
    id v4 = objc_opt_new();
    [v4 setProgress:0.0];
    [v4 setEnded:1];
    objc_super v5 = [(_UIClickInteraction *)self interactionEffect];
    [v5 interaction:self didChangeWithContext:v4];

    interactionEffect = self->_interactionEffect;
    self->_interactionEffect = 0;
  }
  double v7 = [(_UIClickInteraction *)self delegate];
  char v8 = objc_opt_respondsToSelector();

  if (v8)
  {
    double v9 = [(_UIClickInteraction *)self delegate];
    [v9 clickInteractionDidEnd:self];
  }
  if ([(_UIClickInteraction *)self hapticsEnabled])
  {
    double v10 = [(_UIClickInteraction *)self feedbackGenerator];
    [v10 userInteractionEnded];

    [(_UIClickInteraction *)self setFeedbackGenerator:0];
  }
}

- (void)_setOverrideDriverClass:(Class)a3
{
  if (self->_overrideDriverClass != a3)
  {
    self->_overrideDriverClass = a3;
    [(_UIClickInteraction *)self _updateDriver];
  }
}

- (void)_createFeedbackGenerator
{
  id v9 = [(_UIClickInteraction *)self view];
  uint64_t v3 = [v9 window];
  if (v3)
  {
    id v4 = (void *)v3;
    BOOL v5 = [(_UIClickInteraction *)self hapticsEnabled];

    if (!v5) {
      return;
    }
    id v6 = [_UIClickFeedbackGenerator alloc];
    double v7 = [(_UIClickInteraction *)self view];
    char v8 = [(_UIClickFeedbackGenerator *)v6 initWithView:v7];
    [(_UIClickInteraction *)self setFeedbackGenerator:v8];

    id v9 = [(_UIClickInteraction *)self feedbackGenerator];
    [v9 userInteractionStarted];
  }
}

- (BOOL)driverCancelsTouchesInView
{
  id v2 = [(_UIClickInteraction *)self driver];
  char v3 = [v2 cancelsTouchesInView];

  return v3;
}

- (void)setDriverCancelsTouchesInView:(BOOL)a3
{
  BOOL v3 = a3;
  id v4 = [(_UIClickInteraction *)self driver];
  [v4 setCancelsTouchesInView:v3];
}

- (void)clickDriver:(id)a3 shouldBegin:(id)a4
{
  double v7 = (void (**)(id, uint64_t))a4;
  BOOL v5 = [(_UIClickInteraction *)self delegate];
  if (objc_opt_respondsToSelector())
  {
    if ([v5 clickInteractionShouldBegin:self]) {
      uint64_t v6 = 0;
    }
    else {
      uint64_t v6 = 2;
    }
  }
  else
  {
    uint64_t v6 = 0;
  }
  v7[2](v7, v6);
}

- (void)clickDriver:(id)a3 didPerformEvent:(unint64_t)a4
{
  id v9 = a3;
  uint64_t v6 = [(_UIClickInteraction *)self delegate];
  switch(a4)
  {
    case 0uLL:
      [(_UIClickInteraction *)self _beginInteraction];
      break;
    case 1uLL:
      if ([(_UIClickInteraction *)self hapticsEnabled])
      {
        double v7 = [(_UIClickInteraction *)self feedbackGenerator];
        [v7 pressedDown];
      }
      if (objc_opt_respondsToSelector()) {
        [v6 clickInteractionDidClickDown:self];
      }
      break;
    case 2uLL:
      if ([(_UIClickInteraction *)self hapticsEnabled]
        && ([v9 clicksUpAutomaticallyAfterTimeout] & 1) == 0)
      {
        char v8 = [(_UIClickInteraction *)self feedbackGenerator];
        [v8 pressedUp];
      }
      [v6 clickInteractionDidClickUp:self];
      break;
    case 3uLL:
      [(_UIClickInteraction *)self _endInteraction];
      break;
    default:
      break;
  }
}

- (void)clickDriver:(id)a3 didUpdateHighlightProgress:(double)a4
{
  id v6 = a3;
  id v10 = (id)objc_opt_new();
  [v10 setProgress:a4];
  [v6 maximumEffectProgress];
  double v8 = v7;

  [v10 setMaximumProgress:v8];
  id v9 = [(_UIClickInteraction *)self interactionEffect];
  [v9 interaction:self didChangeWithContext:v10];
}

- (UIInteractionEffect)interactionEffect
{
  return self->_interactionEffect;
}

- (void)setInteractionEffect:(id)a3
{
}

- (_UIClickFeedbackGenerator)feedbackGenerator
{
  return self->_feedbackGenerator;
}

- (void)setFeedbackGenerator:(id)a3
{
}

- (BOOL)hapticsEnabled
{
  return self->_hapticsEnabled;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_feedbackGenerator, 0);
  objc_storeStrong((id *)&self->_driver, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_interactionEffect, 0);
  objc_destroyWeak((id *)&self->_view);
}

@end