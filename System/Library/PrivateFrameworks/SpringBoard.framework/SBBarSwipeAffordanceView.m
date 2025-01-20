@interface SBBarSwipeAffordanceView
- (BOOL)ignoresLuminance;
- (BOOL)isActive;
- (BOOL)isHomeAffordanceHidden;
- (BOOL)isTrackingHomeGestureOfType:(int64_t)a3;
- (BOOL)shouldAllowAutoHideForHomeGrabberView:(id)a3;
- (BOOL)shouldAllowThinStyleForHomeGrabberView:(id)a3;
- (CGSize)sizeThatFits:(CGSize)a3;
- (SBBarSwipeAffordanceDelegate)delegate;
- (SBBarSwipeAffordanceView)initWithFrame:(CGRect)a3 systemGestureManager:(id)a4 enableGestures:(BOOL)a5;
- (SBHomeGrabberPointerClickDelegate)pointerClickDelegate;
- (SBHomeGrabberView)grabberView;
- (SBKeyboardHomeAffordanceAssertion)keyboardHomeAffordanceAssertion;
- (double)additionalEdgeSpacingForHomeGrabberView:(id)a3;
- (id)_hideHomeAffordanceAnimationSettings;
- (id)_unhideHomeAffordanceAnimationSettings;
- (id)customScreenEdgePanGestureRecognizerForHomeGestureInteraction:(id)a3;
- (int64_t)_effectiveOrientationAccountingForTransforms;
- (int64_t)colorBias;
- (int64_t)feedbackType;
- (unint64_t)homeGestureInteraction:(id)a3 systemGestureTypeForType:(int64_t)a4;
- (void)_activate;
- (void)_deactivate;
- (void)_runBlockOnObservers:(id)a3;
- (void)_updateHomeAffordanceVisibility;
- (void)addObserver:(id)a3;
- (void)barSwipeBehavior:(id)a3 didUpdateAdditionalEdgeSpacing:(double)a4;
- (void)barSwipeBehaviorActionPerformed:(id)a3;
- (void)didAddSubview:(id)a3;
- (void)homeGestureInteractionBegan:(id)a3;
- (void)homeGestureInteractionCancelled:(id)a3;
- (void)homeGestureInteractionChanged:(id)a3;
- (void)homeGestureInteractionEnded:(id)a3;
- (void)layoutSubviews;
- (void)removeObserver:(id)a3;
- (void)setActive:(BOOL)a3;
- (void)setColorBias:(int64_t)a3;
- (void)setDelegate:(id)a3;
- (void)setFeedbackType:(int64_t)a3;
- (void)setHomeAffordanceHidden:(BOOL)a3;
- (void)setIgnoresLuminance:(BOOL)a3;
- (void)setKeyboardHomeAffordanceAssertion:(id)a3;
- (void)setPointerClickDelegate:(id)a3;
@end

@implementation SBBarSwipeAffordanceView

- (SBBarSwipeAffordanceView)initWithFrame:(CGRect)a3 systemGestureManager:(id)a4 enableGestures:(BOOL)a5
{
  BOOL v5 = a5;
  double height = a3.size.height;
  double width = a3.size.width;
  double y = a3.origin.y;
  double x = a3.origin.x;
  id v12 = a4;
  v34.receiver = self;
  v34.super_class = (Class)SBBarSwipeAffordanceView;
  v13 = -[SBBarSwipeAffordanceView initWithFrame:](&v34, sel_initWithFrame_, x, y, width, height);
  v14 = v13;
  if (v13)
  {
    objc_storeStrong((id *)&v13->_gestureManager, a4);
    uint64_t v15 = SBFEffectiveHomeButtonType();
    objc_opt_class();
    char v16 = objc_opt_isKindOfClass() & 1;
    BOOL v17 = v15 != 2;
    if (v15 == 2 || SBFEffectiveDeviceClass() == 2)
    {
      v18 = [SBHomeGrabberView alloc];
      uint64_t v19 = -[SBHomeGrabberView initWithFrame:shouldEnableGestures:](v18, "initWithFrame:shouldEnableGestures:", v5, *MEMORY[0x1E4F1DB28], *(double *)(MEMORY[0x1E4F1DB28] + 8), *(double *)(MEMORY[0x1E4F1DB28] + 16), *(double *)(MEMORY[0x1E4F1DB28] + 24));
      grabberView = v14->_grabberView;
      v14->_grabberView = (SBHomeGrabberView *)v19;

      [(SBHomeGrabberView *)v14->_grabberView setDelegate:v14];
      [(SBHomeGrabberView *)v14->_grabberView setHomeAffordanceInteractionEnabled:v14->_active];
      [(SBBarSwipeAffordanceView *)v14 addSubview:v14->_grabberView];
      id v21 = objc_alloc(MEMORY[0x1E4FA5EB8]);
      v22 = v14->_grabberView;
      v23 = +[SBAppSwitcherDomain rootSettings];
      v24 = [v23 animationSettings];
      v25 = [v24 alertBarSwipeDismissalSettings];
      uint64_t v26 = [v21 initWithGrabberView:v22 settleAffordanceAnimationBehaviorDescription:v25];
      barSwipeBehavior = v14->_barSwipeBehavior;
      v14->_barSwipeBehavior = (SBFBarSwipeBehavior *)v26;

      [(SBFBarSwipeBehavior *)v14->_barSwipeBehavior setDelegate:v14];
    }
    v28 = (void *)MEMORY[0x1E4F42FF0];
    v30[0] = MEMORY[0x1E4F143A8];
    v30[1] = 3221225472;
    v30[2] = __78__SBBarSwipeAffordanceView_initWithFrame_systemGestureManager_enableGestures___block_invoke;
    v30[3] = &unk_1E6AF7EB8;
    BOOL v32 = v17;
    char v33 = v16;
    v31 = v14;
    [v28 performWithoutAnimation:v30];
  }
  return v14;
}

uint64_t __78__SBBarSwipeAffordanceView_initWithFrame_systemGestureManager_enableGestures___block_invoke(uint64_t a1)
{
  if (*(unsigned char *)(a1 + 40) || *(unsigned char *)(a1 + 41)) {
    [*(id *)(a1 + 32) setHomeAffordanceHidden:1];
  }
  v2 = *(void **)(a1 + 32);
  return [v2 _deactivate];
}

- (void)setPointerClickDelegate:(id)a3
{
}

- (SBHomeGrabberPointerClickDelegate)pointerClickDelegate
{
  return [(SBHomeGrabberView *)self->_grabberView pointerClickDelegate];
}

- (void)setDelegate:(id)a3
{
  id obj = a3;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  BOOL v5 = obj;
  if (WeakRetained != obj)
  {
    objc_storeWeak((id *)&self->_delegate, obj);
    BOOL v5 = obj;
    homeGestureInteraction = self->_homeGestureInteraction;
    if (obj)
    {
      if (homeGestureInteraction) {
        goto LABEL_8;
      }
      v7 = [[SBHomeGestureInteraction alloc] initWithSystemGestureManager:self->_gestureManager delegate:self];
      v8 = self->_homeGestureInteraction;
      self->_homeGestureInteraction = v7;

      [(SBHomeGestureInteraction *)self->_homeGestureInteraction setEnabled:self->_active];
    }
    else
    {
      if (!homeGestureInteraction) {
        goto LABEL_8;
      }
      [(SBHomeGestureInteraction *)homeGestureInteraction invalidate];
      v9 = self->_homeGestureInteraction;
      self->_homeGestureInteraction = 0;
    }
    BOOL v5 = obj;
  }
LABEL_8:
}

- (int64_t)feedbackType
{
  return [(SBFBarSwipeBehavior *)self->_barSwipeBehavior feedbackType];
}

- (void)setFeedbackType:(int64_t)a3
{
}

- (void)setActive:(BOOL)a3
{
  if (self->_active != a3)
  {
    self->_active = a3;
    if (a3) {
      [(SBBarSwipeAffordanceView *)self _activate];
    }
    else {
      [(SBBarSwipeAffordanceView *)self _deactivate];
    }
  }
}

- (int64_t)colorBias
{
  v2 = [(SBBarSwipeAffordanceView *)self grabberView];
  int64_t v3 = [v2 colorBias];

  return v3;
}

- (void)setColorBias:(int64_t)a3
{
  id v4 = [(SBBarSwipeAffordanceView *)self grabberView];
  [v4 setColorBias:a3];
}

- (BOOL)ignoresLuminance
{
  v2 = [(SBBarSwipeAffordanceView *)self grabberView];
  char v3 = [v2 ignoresLuminance];

  return v3;
}

- (void)setIgnoresLuminance:(BOOL)a3
{
  BOOL v3 = a3;
  id v4 = [(SBBarSwipeAffordanceView *)self grabberView];
  [v4 setIgnoresLuminance:v3];
}

- (void)setHomeAffordanceHidden:(BOOL)a3
{
  if (self->_homeAffordanceHidden != a3)
  {
    self->_homeAffordanceHidden = a3;
    [(SBBarSwipeAffordanceView *)self _updateHomeAffordanceVisibility];
  }
}

- (void)setKeyboardHomeAffordanceAssertion:(id)a3
{
  BOOL v5 = (SBKeyboardHomeAffordanceAssertion *)a3;
  p_keyboardHomeAffordanceAssertion = &self->_keyboardHomeAffordanceAssertion;
  keyboardHomeAffordanceAssertion = self->_keyboardHomeAffordanceAssertion;
  if (keyboardHomeAffordanceAssertion != v5)
  {
    v13 = v5;
    if (v5)
    {
      objc_storeStrong((id *)&self->_keyboardHomeAffordanceAssertion, a3);
      v8 = [(SBBarSwipeAffordanceView *)self grabberView];
      v9 = [(SBBarSwipeAffordanceView *)self _hideHomeAffordanceAnimationSettings];
      v10 = v8;
      uint64_t v11 = 1;
    }
    else
    {
      [(SBKeyboardHomeAffordanceAssertion *)keyboardHomeAffordanceAssertion invalidate];
      id v12 = *p_keyboardHomeAffordanceAssertion;
      *p_keyboardHomeAffordanceAssertion = 0;

      v8 = [(SBBarSwipeAffordanceView *)self grabberView];
      v9 = [(SBBarSwipeAffordanceView *)self _unhideHomeAffordanceAnimationSettings];
      v10 = v8;
      uint64_t v11 = 0;
    }
    [v10 setHidden:v11 forReason:@"SBBarSwipeAffordanceViewKeyboardVisible" withAnimationSettings:v9];

    BOOL v5 = v13;
  }
}

- (void)_updateHomeAffordanceVisibility
{
  id v3 = [(SBBarSwipeAffordanceView *)self grabberView];
  [v3 setHidden:self->_homeAffordanceHidden forReason:@"SBBarSwipeAffordanceViewAlways" withAnimationSettings:0];
}

- (BOOL)isTrackingHomeGestureOfType:(int64_t)a3
{
  return [(SBHomeGestureInteraction *)self->_homeGestureInteraction recognizedGestureType] == a3;
}

- (void)_activate
{
  [(SBHomeGestureInteraction *)self->_homeGestureInteraction setEnabled:1];
  id v3 = [(SBBarSwipeAffordanceView *)self grabberView];
  id v4 = [(SBBarSwipeAffordanceView *)self _unhideHomeAffordanceAnimationSettings];
  [v3 setHidden:0 forReason:@"SBBarSwipeAffordanceView" withAnimationSettings:v4];

  id v5 = [(SBBarSwipeAffordanceView *)self grabberView];
  [v5 setHomeAffordanceInteractionEnabled:1];
}

- (void)_deactivate
{
  [(SBHomeGestureInteraction *)self->_homeGestureInteraction setEnabled:0];
  id v3 = [(SBBarSwipeAffordanceView *)self grabberView];
  id v4 = [(SBBarSwipeAffordanceView *)self _hideHomeAffordanceAnimationSettings];
  [v3 setHidden:1 forReason:@"SBBarSwipeAffordanceView" withAnimationSettings:v4];

  id v5 = [(SBBarSwipeAffordanceView *)self grabberView];
  [v5 setHomeAffordanceInteractionEnabled:0];
}

- (void)addObserver:(id)a3
{
  id v4 = a3;
  observers = self->_observers;
  id v8 = v4;
  if (!observers)
  {
    v6 = [MEMORY[0x1E4F28D30] hashTableWithOptions:517];
    v7 = self->_observers;
    self->_observers = v6;

    id v4 = v8;
    observers = self->_observers;
  }
  [(NSHashTable *)observers addObject:v4];
}

- (void)removeObserver:(id)a3
{
}

- (void)_runBlockOnObservers:(id)a3
{
  observers = self->_observers;
  id v4 = a3;
  id v5 = [(NSHashTable *)observers allObjects];
  objc_msgSend(v5, "bs_each:", v4);
}

- (void)didAddSubview:(id)a3
{
  v5.receiver = self;
  v5.super_class = (Class)SBBarSwipeAffordanceView;
  [(SBBarSwipeAffordanceView *)&v5 didAddSubview:a3];
  id v4 = [(SBBarSwipeAffordanceView *)self grabberView];
  [(SBBarSwipeAffordanceView *)self bringSubviewToFront:v4];
}

- (void)layoutSubviews
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  v20.receiver = self;
  v20.super_class = (Class)SBBarSwipeAffordanceView;
  [(SBBarSwipeAffordanceView *)&v20 layoutSubviews];
  [(SBBarSwipeAffordanceView *)self bounds];
  double v4 = v3;
  double v6 = v5;
  double v8 = v7;
  double v10 = v9;
  long long v16 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  uint64_t v11 = [(SBBarSwipeAffordanceView *)self subviews];
  uint64_t v12 = [v11 countByEnumeratingWithState:&v16 objects:v21 count:16];
  if (v12)
  {
    uint64_t v13 = v12;
    uint64_t v14 = *(void *)v17;
    do
    {
      uint64_t v15 = 0;
      do
      {
        if (*(void *)v17 != v14) {
          objc_enumerationMutation(v11);
        }
        objc_msgSend(*(id *)(*((void *)&v16 + 1) + 8 * v15++), "setFrame:", v4, v6, v8, v10);
      }
      while (v13 != v15);
      uint64_t v13 = [v11 countByEnumeratingWithState:&v16 objects:v21 count:16];
    }
    while (v13);
  }
}

- (CGSize)sizeThatFits:(CGSize)a3
{
  double v3 = [(SBBarSwipeAffordanceView *)self grabberView];
  BSRectWithSize();
  objc_msgSend(v3, "grabberFrameForBounds:");
  double v5 = v4;
  double v7 = v6;

  double v8 = v7 + *MEMORY[0x1E4FA6188];
  double v9 = v5;
  result.double height = v8;
  result.double width = v9;
  return result;
}

- (unint64_t)homeGestureInteraction:(id)a3 systemGestureTypeForType:(int64_t)a4
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  unint64_t v7 = [WeakRetained barSwipeAffordanceView:self systemGestureTypeForType:a4];

  return v7;
}

- (id)customScreenEdgePanGestureRecognizerForHomeGestureInteraction:(id)a3
{
  double v4 = +[SBHomeGesturePanGestureRecognizer homeGesturePanGestureRecognizerWithTarget:0 action:0];
  [v4 setInterfaceDelegate:self];
  [v4 setEdges:4];
  return v4;
}

- (void)homeGestureInteractionBegan:(id)a3
{
}

- (void)homeGestureInteractionChanged:(id)a3
{
}

- (void)homeGestureInteractionEnded:(id)a3
{
}

- (void)homeGestureInteractionCancelled:(id)a3
{
}

- (void)barSwipeBehaviorActionPerformed:(id)a3
{
  if ([(SBHomeGestureInteraction *)self->_homeGestureInteraction isEnabled])
  {
    [(SBHomeGestureInteraction *)self->_homeGestureInteraction setEnabled:0];
    [(SBHomeGestureInteraction *)self->_homeGestureInteraction setEnabled:1];
  }
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __60__SBBarSwipeAffordanceView_barSwipeBehaviorActionPerformed___block_invoke;
  v4[3] = &unk_1E6AFBF10;
  v4[4] = self;
  [(SBBarSwipeAffordanceView *)self _runBlockOnObservers:v4];
}

uint64_t __60__SBBarSwipeAffordanceView_barSwipeBehaviorActionPerformed___block_invoke(uint64_t a1, void *a2)
{
  return [a2 homeGesturePerformedForBarSwipeAffordanceView:*(void *)(a1 + 32)];
}

- (void)barSwipeBehavior:(id)a3 didUpdateAdditionalEdgeSpacing:(double)a4
{
}

- (int64_t)_effectiveOrientationAccountingForTransforms
{
  double v3 = [(SBBarSwipeAffordanceView *)self window];
  double v4 = [(SBBarSwipeAffordanceView *)self window];
  -[SBBarSwipeAffordanceView convertPoint:toView:](self, "convertPoint:toView:", v4, 1.0, 1.0);
  objc_msgSend(v3, "_convertPointToSceneReferenceSpace:");
  double v6 = v5;
  double v8 = v7;
  double v9 = [(SBBarSwipeAffordanceView *)self window];
  double v10 = [(SBBarSwipeAffordanceView *)self window];
  -[SBBarSwipeAffordanceView convertPoint:toView:](self, "convertPoint:toView:", v10, 0.0, 0.0);
  objc_msgSend(v9, "_convertPointToSceneReferenceSpace:");
  double v12 = v6 - v11;
  double v14 = v8 - v13;

  BOOL v15 = v12 <= 0.0;
  if (v12 > 0.0 && v14 > 0.0) {
    return 1;
  }
  if (v12 <= 0.0 && v14 <= 0.0) {
    return 2;
  }
  if (v14 > 0.0) {
    BOOL v15 = 1;
  }
  if (v15) {
    return 3;
  }
  else {
    return 4;
  }
}

- (double)additionalEdgeSpacingForHomeGrabberView:(id)a3
{
  [(SBFBarSwipeBehavior *)self->_barSwipeBehavior grabberViewAdditionalEdgeSpacing];
  return result;
}

- (BOOL)shouldAllowThinStyleForHomeGrabberView:(id)a3
{
  return 0;
}

- (BOOL)shouldAllowAutoHideForHomeGrabberView:(id)a3
{
  return 0;
}

- (id)_hideHomeAffordanceAnimationSettings
{
  double v3 = [(SBBarSwipeAffordanceView *)self delegate];
  if (!v3
    || (objc_opt_respondsToSelector() & 1) == 0
    || ([v3 hideAnimationSettingsForBarSwipeAffordanceView:self],
        (double v4 = objc_claimAutoreleasedReturnValue()) == 0))
  {
    double v5 = [MEMORY[0x1E4FA5F28] rootSettings];
    double v6 = [v5 hideForHomeGestureOwnershipAnimationSettings];
    double v4 = [v6 BSAnimationSettings];
  }
  return v4;
}

- (id)_unhideHomeAffordanceAnimationSettings
{
  double v3 = [(SBBarSwipeAffordanceView *)self delegate];
  if (!v3
    || (objc_opt_respondsToSelector() & 1) == 0
    || ([v3 unhideAnimationSettingsForBarSwipeAffordanceView:self],
        (double v4 = objc_claimAutoreleasedReturnValue()) == 0))
  {
    double v5 = [MEMORY[0x1E4FA5F28] rootSettings];
    double v6 = [v5 unhideForHomeGestureOwnershipAnimationSettings];
    double v4 = [v6 BSAnimationSettings];
  }
  return v4;
}

- (SBBarSwipeAffordanceDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  return (SBBarSwipeAffordanceDelegate *)WeakRetained;
}

- (BOOL)isActive
{
  return self->_active;
}

- (BOOL)isHomeAffordanceHidden
{
  return self->_homeAffordanceHidden;
}

- (SBKeyboardHomeAffordanceAssertion)keyboardHomeAffordanceAssertion
{
  return self->_keyboardHomeAffordanceAssertion;
}

- (SBHomeGrabberView)grabberView
{
  return self->_grabberView;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_grabberView, 0);
  objc_storeStrong((id *)&self->_keyboardHomeAffordanceAssertion, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_gestureManager, 0);
  objc_storeStrong((id *)&self->_homeGestureInteraction, 0);
  objc_storeStrong((id *)&self->_barSwipeBehavior, 0);
  objc_storeStrong((id *)&self->_observers, 0);
}

@end