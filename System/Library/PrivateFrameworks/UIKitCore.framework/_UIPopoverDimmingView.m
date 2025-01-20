@interface _UIPopoverDimmingView
- (BOOL)_delegateAllowsInteraction;
- (BOOL)passThroughDismissalTaps;
- (BOOL)passthroughScrollInteraction:(id)a3 shouldInteractAtLocation:(CGPoint)a4 withEvent:(id)a5;
- (BOOL)passthroughScrollInteractionDidRecognize:(id)a3;
- (UIView)transitionContainerView;
- (_UIPassthroughScrollInteraction)_passthroughScrollInteraction;
- (id)hitTest:(CGPoint)a3 withEvent:(id)a4;
- (void)_sendDelegateDimmingViewWasTapped;
- (void)_setOverrideAllowsHitTestingOnTouchFallbackView:(BOOL)a3;
- (void)_updatePassthroughInteraction;
- (void)didMoveToWindow;
- (void)setPassThroughDismissalTaps:(BOOL)a3;
- (void)setTransitionContainerView:(id)a3;
- (void)willMoveToWindow:(id)a3;
@end

@implementation _UIPopoverDimmingView

- (void)_updatePassthroughInteraction
{
  [(_UIPassthroughScrollInteraction *)self->_passthroughScrollInteraction setEatsTouches:[(_UIPopoverDimmingView *)self passThroughDismissalTaps] ^ 1];
  BOOL v3 = [(_UIPopoverDimmingView *)self passThroughDismissalTaps];
  passthroughScrollInteraction = self->_passthroughScrollInteraction;
  [(_UIPassthroughScrollInteraction *)passthroughScrollInteraction setRecognizeOnPrimaryButtonDown:v3];
}

- (BOOL)passThroughDismissalTaps
{
  return self->_passThroughDismissalTaps;
}

- (void)willMoveToWindow:(id)a3
{
  v4.receiver = self;
  v4.super_class = (Class)_UIPopoverDimmingView;
  [(UIDimmingView *)&v4 willMoveToWindow:a3];
  if (dyld_program_sdk_at_least())
  {
    if (self->_passthroughScrollInteraction) {
      -[UIView removeInteraction:](self, "removeInteraction:");
    }
  }
}

- (void)setTransitionContainerView:(id)a3
{
}

- (void)didMoveToWindow
{
  v7.receiver = self;
  v7.super_class = (Class)_UIPopoverDimmingView;
  [(UIView *)&v7 didMoveToWindow];
  if (dyld_program_sdk_at_least())
  {
    BOOL v3 = [(UIView *)self window];

    if (v3)
    {
      passthroughScrollInteraction = self->_passthroughScrollInteraction;
      if (!passthroughScrollInteraction)
      {
        v5 = objc_alloc_init(_UIPassthroughScrollInteraction);
        v6 = self->_passthroughScrollInteraction;
        self->_passthroughScrollInteraction = v5;

        [(_UIPassthroughScrollInteraction *)self->_passthroughScrollInteraction setDelegate:self];
        [(_UIPopoverDimmingView *)self _updatePassthroughInteraction];
        passthroughScrollInteraction = self->_passthroughScrollInteraction;
      }
      [(UIView *)self addInteraction:passthroughScrollInteraction];
    }
  }
}

- (BOOL)_delegateAllowsInteraction
{
  BOOL v3 = [(UIDimmingView *)self delegate];
  char v4 = objc_opt_respondsToSelector();

  if ((v4 & 1) == 0) {
    return 1;
  }
  v5 = [(UIDimmingView *)self delegate];
  char v6 = [v5 popoverDimmingViewShouldAllowInteraction:self];

  return v6;
}

- (void)_sendDelegateDimmingViewWasTapped
{
  id v3 = [(UIDimmingView *)self delegate];
  [v3 popoverDimmingViewDidReceiveDismissalInteraction:self];
}

- (void)_setOverrideAllowsHitTestingOnTouchFallbackView:(BOOL)a3
{
}

- (void)setPassThroughDismissalTaps:(BOOL)a3
{
  self->_passThroughDismissalTaps = a3;
  [(_UIPopoverDimmingView *)self _updatePassthroughInteraction];
}

- (id)hitTest:(CGPoint)a3 withEvent:(id)a4
{
  double y = a3.y;
  double x = a3.x;
  id v7 = a4;
  self->_lastHitTestWasPassedThrough = 0;
  v11.receiver = self;
  v11.super_class = (Class)_UIPopoverDimmingView;
  -[UIDimmingView hitTest:withEvent:](&v11, sel_hitTest_withEvent_, v7, x, y);
  v8 = (_UIPopoverDimmingView *)objc_claimAutoreleasedReturnValue();
  if ((dyld_program_sdk_at_least() & 1) != 0
    && v8 == self
    && ![(UIDimmingView *)self ignoresTouches]
    && +[_UIPassthroughScrollInteraction _shouldEventBePassedThrough:v7]&& [(_UIPopoverDimmingView *)self _delegateAllowsInteraction])
  {
    v9 = 0;
    self->_lastHitTestWasPassedThrough = 1;
  }
  else
  {
    v9 = v8;
  }

  return v9;
}

- (BOOL)passthroughScrollInteraction:(id)a3 shouldInteractAtLocation:(CGPoint)a4 withEvent:(id)a5
{
  double y = a4.y;
  double x = a4.x;
  self->_lastHitTestWasPassedThrough = 0;
  id v9 = a5;
  v10 = [a3 view];
  objc_super v11 = [(UIView *)self window];
  objc_msgSend(v10, "convertPoint:toView:", v11, x, y);
  double v13 = v12;
  double v15 = v14;

  v16 = [(UIView *)self window];
  v17 = objc_msgSend(v16, "hitTest:withEvent:", v9, v13, v15);

  v18 = [(UIView *)self traitCollection];
  uint64_t v19 = [v18 userInterfaceIdiom];

  BOOL v20 = v19 == 6 && !v17 || self->_lastHitTestWasPassedThrough;
  return v20;
}

- (BOOL)passthroughScrollInteractionDidRecognize:(id)a3
{
  id v3 = self;
  char v4 = [(UIDimmingView *)self delegate];
  LOBYTE(v3) = [v4 popoverDimmingViewDidReceiveDismissalInteraction:v3];

  return (char)v3;
}

- (_UIPassthroughScrollInteraction)_passthroughScrollInteraction
{
  return self->_passthroughScrollInteraction;
}

- (UIView)transitionContainerView
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_transitionContainerView);
  return (UIView *)WeakRetained;
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_transitionContainerView);
  objc_storeStrong((id *)&self->_passthroughScrollInteraction, 0);
}

@end