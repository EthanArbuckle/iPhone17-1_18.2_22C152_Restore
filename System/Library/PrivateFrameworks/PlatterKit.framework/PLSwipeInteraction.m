@interface PLSwipeInteraction
- (BOOL)_shouldContinuePresentingActionButtons;
- (BOOL)didPlayHaptic;
- (BOOL)gestureRecognizerShouldBegin:(id)a3;
- (BOOL)isPerformingSwipeHinting;
- (CGPoint)_panLocation;
- (NSString)materialGroupNameBase;
- (PLSwipeInteraction)initWithDelegate:(id)a3;
- (PLSwipeInteractionDelegate)delegate;
- (UIView)view;
- (UIView)viewToMove;
- (_UIStatesFeedbackGenerator)defaultActionFeedbackGenerator;
- (double)_actionButtonTriggerDistanceForView:(id)a3;
- (double)_panHorizontalTranslation;
- (double)_panHorizontalVelocity;
- (double)_updateActionRevealStateForTargetPosition:(double)a3 currentPosition:(double)a4 velocity:(double)a5;
- (id)senderForActionWithIdentifier:(id)a3;
- (unint64_t)_interfaceEdgeForLayoutLocation:(unint64_t)a3;
- (unint64_t)_interfaceEdgeToPresentOnForComparisonValue:(double)a3;
- (unint64_t)_interfaceEdgeToPresentOnForInitialPanTranslation:(double)a3 andInitialPanVelocity:(double)a4;
- (unint64_t)_layoutLocationForInterfaceEdge:(unint64_t)a3;
- (void)_actuateFeedbackForDefaultActionLockedIfNecessary;
- (void)_actuateFeedbackForDefaultActionUnlockedIfNecessary;
- (void)_addActionButtonViewsAtLayoutLocation:(unint64_t)a3 interfaceEdge:(unint64_t)a4;
- (void)_addActionButtonsAndRevealAnimated:(BOOL)a3 fastAnimation:(BOOL)a4 layoutLocation:(unint64_t)a5 completion:(id)a6;
- (void)_handlePanGesture:(id)a3;
- (void)_hideAnimated:(BOOL)a3 fastAnimation:(BOOL)a4 velocity:(double)a5 completion:(id)a6;
- (void)_performSwipeHintingForLayoutLocation:(unint64_t)a3;
- (void)_removeActionButtons;
- (void)_revealToPosition:(double)a3 animated:(BOOL)a4 fastAnimation:(BOOL)a5 velocity:(double)a6 completion:(id)a7;
- (void)_setViewPosition:(double)a3 withVelocity:(double)a4 usingNonInteractiveSpring:(BOOL)a5 animated:(BOOL)a6 completion:(id)a7;
- (void)_setViewPositionHelper:(double)a3 withVelocity:(double)a4 usingNonInteractiveSpring:(BOOL)a5 animated:(BOOL)a6 completion:(id)a7;
- (void)_setupContentOffsetFloatAnimatableProperty;
- (void)_updateActionButtonRevealPercentageForTargetPosition:(double)a3;
- (void)_updatePosition:(double)a3;
- (void)_updateRevealPercentage:(double)a3;
- (void)_updateTargetPosition:(double)a3;
- (void)didMoveToView:(id)a3;
- (void)hideActionsAnimated:(BOOL)a3 fastAnimation:(BOOL)a4 completion:(id)a5;
- (void)revealActionsForLayoutLocation:(unint64_t)a3 completion:(id)a4;
- (void)setDefaultActionFeedbackGenerator:(id)a3;
- (void)setDidPlayHaptic:(BOOL)a3;
- (void)setMaterialGroupNameBase:(id)a3;
- (void)setPerformingSwipeHinting:(BOOL)a3;
- (void)setView:(id)a3;
- (void)setViewToMove:(id)a3;
- (void)willMoveToView:(id)a3;
@end

@implementation PLSwipeInteraction

- (PLSwipeInteraction)initWithDelegate:(id)a3
{
  id v4 = a3;
  v10.receiver = self;
  v10.super_class = (Class)PLSwipeInteraction;
  v5 = [(PLSwipeInteraction *)&v10 init];
  v6 = v5;
  if (v5)
  {
    objc_storeWeak((id *)&v5->_delegate, v4);
    v6->_animationCount = 0;
    uint64_t v7 = [objc_alloc(MEMORY[0x1E4F42C38]) initWithTarget:v6 action:sel__handlePanGesture_];
    panGestureRecognizer = v6->_panGestureRecognizer;
    v6->_panGestureRecognizer = (UIPanGestureRecognizer *)v7;

    [(UIPanGestureRecognizer *)v6->_panGestureRecognizer _setCanPanVertically:0];
    [(UIPanGestureRecognizer *)v6->_panGestureRecognizer setDelegate:v6];
    [(UIPanGestureRecognizer *)v6->_panGestureRecognizer _setAllowedScrollTypesMask:2];
    [(PLSwipeInteraction *)v6 _setupContentOffsetFloatAnimatableProperty];
  }

  return v6;
}

- (void)revealActionsForLayoutLocation:(unint64_t)a3 completion:(id)a4
{
  v6 = (void (**)(void))a4;
  [(PLSwipeInteraction *)self setPerformingSwipeHinting:0];
  actionButtonsPresentingView = self->_actionButtonsPresentingView;
  if (actionButtonsPresentingView)
  {
    if ([(PLActionButtonsPresentingView *)actionButtonsPresentingView layoutLocation] == a3)
    {
      if (v6) {
        v6[2](v6);
      }
    }
    else
    {
      v8[0] = MEMORY[0x1E4F143A8];
      v8[1] = 3221225472;
      v8[2] = __64__PLSwipeInteraction_revealActionsForLayoutLocation_completion___block_invoke;
      v8[3] = &unk_1E6B5FC58;
      v8[4] = self;
      unint64_t v10 = a3;
      v9 = v6;
      [(PLSwipeInteraction *)self hideActionsAnimated:1 fastAnimation:1 completion:v8];
    }
  }
  else
  {
    [(PLSwipeInteraction *)self _addActionButtonsAndRevealAnimated:1 fastAnimation:1 layoutLocation:a3 completion:v6];
  }
}

uint64_t __64__PLSwipeInteraction_revealActionsForLayoutLocation_completion___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _addActionButtonsAndRevealAnimated:1 fastAnimation:1 layoutLocation:*(void *)(a1 + 48) completion:*(void *)(a1 + 40)];
}

- (void)hideActionsAnimated:(BOOL)a3 fastAnimation:(BOOL)a4 completion:(id)a5
{
  BOOL v5 = a4;
  BOOL v6 = a3;
  id v8 = a5;
  [(PLSwipeInteraction *)self setPerformingSwipeHinting:0];
  if (self->_actionButtonsPresentingView)
  {
    [(UIPanGestureRecognizer *)self->_panGestureRecognizer setState:4];
    [(PLSwipeInteraction *)self _hideAnimated:v6 fastAnimation:v5 velocity:v8 completion:0.0];
  }
}

- (id)senderForActionWithIdentifier:(id)a3
{
  id v4 = a3;
  BOOL v5 = [(PLActionButtonsPresentingView *)self->_actionButtonsPresentingView actionButtonsView];
  BOOL v6 = v5;
  if (v5)
  {
    uint64_t v7 = [v5 senderForActionWithIdentifier:v4];
  }
  else
  {
    uint64_t v7 = 0;
  }

  return v7;
}

- (void)setMaterialGroupNameBase:(id)a3
{
  id v9 = a3;
  BOOL v5 = [(NSString *)self->_materialGroupNameBase isEqualToString:v9];
  id v6 = v9;
  if (!v5)
  {
    objc_storeStrong((id *)&self->_materialGroupNameBase, a3);
    uint64_t v7 = [(PLActionButtonsPresentingView *)self->_actionButtonsPresentingView actionButtonsView];
    id v8 = v7;
    if (v7) {
      [v7 setMaterialGroupNameBase:v9];
    }

    id v6 = v9;
  }
  MEMORY[0x1F41817F8](v5, v6);
}

- (void)willMoveToView:(id)a3
{
  p_view = &self->_view;
  id v5 = a3;
  id WeakRetained = objc_loadWeakRetained((id *)p_view);

  id v6 = WeakRetained;
  if (WeakRetained && WeakRetained != v5)
  {
    [WeakRetained removeGestureRecognizer:self->_panGestureRecognizer];
    defaultActionFeedbackGenerator = self->_defaultActionFeedbackGenerator;
    self->_defaultActionFeedbackGenerator = 0;

    objc_storeWeak((id *)&self->_viewToMove, 0);
    [(PLSwipeInteraction *)self _removeActionButtons];
    id v6 = WeakRetained;
  }
}

- (void)didMoveToView:(id)a3
{
  id v6 = a3;
  objc_storeWeak((id *)&self->_view, v6);
  if (v6)
  {
    [v6 addGestureRecognizer:self->_panGestureRecognizer];
    id v4 = (_UIStatesFeedbackGenerator *)[objc_alloc(MEMORY[0x1E4F43308]) initWithStyle:1 view:v6];
    defaultActionFeedbackGenerator = self->_defaultActionFeedbackGenerator;
    self->_defaultActionFeedbackGenerator = v4;
  }
}

- (BOOL)gestureRecognizerShouldBegin:(id)a3
{
  uint64_t v27 = *MEMORY[0x1E4F143B8];
  id v4 = (UIPanGestureRecognizer *)a3;
  if ([(PLSwipeInteraction *)self _shouldContinuePresentingActionButtons])
  {
    id WeakRetained = objc_loadWeakRetained((id *)&self->_view);
    panGestureRecognizer = self->_panGestureRecognizer;
    if (WeakRetained && panGestureRecognizer == v4)
    {
      if (self->_actionButtonsPresentingView)
      {
        char v7 = 1;
        goto LABEL_17;
      }
      [(PLSwipeInteraction *)self _panHorizontalTranslation];
      double v14 = v13;
      [(PLSwipeInteraction *)self _panHorizontalVelocity];
      unint64_t v16 = [(PLSwipeInteraction *)self _interfaceEdgeToPresentOnForInitialPanTranslation:v14 andInitialPanVelocity:v15];
      if (v16)
      {
        unint64_t v17 = [(PLSwipeInteraction *)self _layoutLocationForInterfaceEdge:v16];
        v18 = [(PLSwipeInteraction *)self delegate];
        if (objc_opt_respondsToSelector()) {
          char v7 = [v18 swipeInteraction:self shouldRevealActionsFromLayoutLocation:v17];
        }
        else {
          char v7 = 0;
        }

        goto LABEL_17;
      }
      uint64_t v19 = PLLogInteraction;
      char v7 = 0;
      if (!os_log_type_enabled((os_log_t)PLLogInteraction, OS_LOG_TYPE_DEFAULT))
      {
LABEL_17:

        goto LABEL_18;
      }
      int v21 = 138543362;
      v22 = self;
      unint64_t v10 = "%{public}@: Denying pan gesture. Pan gesture translation and velocity are both 0. Cannot infer edge to revea"
            "l action buttons on.";
      v11 = v19;
      uint32_t v12 = 12;
    }
    else
    {
      uint64_t v8 = PLLogInteraction;
      char v7 = 0;
      if (!os_log_type_enabled((os_log_t)PLLogInteraction, OS_LOG_TYPE_DEFAULT)) {
        goto LABEL_17;
      }
      BOOL v9 = self->_actionButtonsPresentingView != 0;
      int v21 = 138543874;
      v22 = self;
      __int16 v23 = 1026;
      BOOL v24 = panGestureRecognizer == v4;
      __int16 v25 = 1026;
      BOOL v26 = v9;
      unint64_t v10 = "%{public}@: Denying pan gesture. recognizerMatches: %{public}d actionsRevealed: %{public}d";
      v11 = v8;
      uint32_t v12 = 24;
    }
    _os_log_impl(&dword_1D93DD000, v11, OS_LOG_TYPE_DEFAULT, v10, (uint8_t *)&v21, v12);
    char v7 = 0;
    goto LABEL_17;
  }
  [(PLSwipeInteraction *)self hideActionsAnimated:1 fastAnimation:1 completion:0];
  char v7 = 0;
LABEL_18:

  return v7;
}

- (BOOL)_shouldContinuePresentingActionButtons
{
  v3 = [(PLSwipeInteraction *)self delegate];
  if (objc_opt_respondsToSelector()) {
    char v4 = [v3 shouldContinuePresentingActionButtonsForSwipeInteraction:self];
  }
  else {
    char v4 = 1;
  }

  return v4;
}

- (unint64_t)_interfaceEdgeToPresentOnForInitialPanTranslation:(double)a3 andInitialPanVelocity:(double)a4
{
  if (a3 == 0.0) {
    a3 = a4;
  }
  return [(PLSwipeInteraction *)self _interfaceEdgeToPresentOnForComparisonValue:a3];
}

- (unint64_t)_interfaceEdgeToPresentOnForComparisonValue:(double)a3
{
  unint64_t v3 = 2;
  if (a3 > 0.0) {
    unint64_t v3 = 1;
  }
  if (a3 == 0.0) {
    return 0;
  }
  else {
    return v3;
  }
}

- (unint64_t)_layoutLocationForInterfaceEdge:(unint64_t)a3
{
  if (!a3)
  {
    unint64_t v10 = [MEMORY[0x1E4F28B00] currentHandler];
    [v10 handleFailureInMethod:a2 object:self file:@"PLSwipeInteraction.m" lineNumber:257 description:@"Must pass a valid PLSwipeInteractionLayoutLocation."];
  }
  id WeakRetained = objc_loadWeakRetained((id *)&self->_view);
  int v6 = [WeakRetained _shouldReverseLayoutDirection];

  uint64_t v7 = 1;
  if (v6) {
    uint64_t v7 = 2;
  }
  return v7 != a3;
}

- (unint64_t)_interfaceEdgeForLayoutLocation:(unint64_t)a3
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_view);
  int v5 = [WeakRetained _shouldReverseLayoutDirection];

  if (a3) {
    int v6 = 1;
  }
  else {
    int v6 = v5;
  }
  BOOL v7 = v6 == 0;
  unint64_t v8 = 1;
  if (!v7) {
    unint64_t v8 = 2;
  }
  if (((a3 == 1) & v5) != 0) {
    return 1;
  }
  else {
    return v8;
  }
}

- (double)_panHorizontalTranslation
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_view);
  double v4 = 0.0;
  if (WeakRetained)
  {
    panGestureRecognizer = self->_panGestureRecognizer;
    if (panGestureRecognizer)
    {
      [(UIPanGestureRecognizer *)panGestureRecognizer translationInView:WeakRetained];
      double v4 = v6;
    }
  }

  return v4;
}

- (double)_panHorizontalVelocity
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_view);
  double v4 = 0.0;
  if (WeakRetained)
  {
    panGestureRecognizer = self->_panGestureRecognizer;
    if (panGestureRecognizer)
    {
      [(UIPanGestureRecognizer *)panGestureRecognizer velocityInView:WeakRetained];
      double v4 = v6;
    }
  }

  return v4;
}

- (CGPoint)_panLocation
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_view);
  double v4 = *MEMORY[0x1E4F1DAD8];
  double v5 = *(double *)(MEMORY[0x1E4F1DAD8] + 8);
  if (WeakRetained)
  {
    panGestureRecognizer = self->_panGestureRecognizer;
    if (panGestureRecognizer)
    {
      [(UIPanGestureRecognizer *)panGestureRecognizer locationInView:WeakRetained];
      double v4 = v7;
      double v5 = v8;
    }
  }

  double v9 = v4;
  double v10 = v5;
  result.y = v10;
  result.x = v9;
  return result;
}

- (void)_handlePanGesture:(id)a3
{
  uint64_t v29 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  [(PLSwipeInteraction *)self setPerformingSwipeHinting:0];
  double v5 = [(PLSwipeInteraction *)self delegate];
  if (objc_opt_respondsToSelector()) {
    [v5 swipeInteractionDidSignificantUserInteraction:self];
  }
  if ([(PLSwipeInteraction *)self _shouldContinuePresentingActionButtons])
  {
    [(PLSwipeInteraction *)self _panHorizontalTranslation];
    double v7 = v6;
    [(PLSwipeInteraction *)self _panHorizontalVelocity];
    double v9 = v8;
    uint64_t v10 = [v4 state];
    switch(v10)
    {
      case 3:
        [(PLSwipeInteraction *)self _updateActionRevealStateForTargetPosition:v7 + self->_panGestureStartingPosition + v9 * 0.05 currentPosition:v7 + self->_panGestureStartingPosition velocity:v9];
        if (v12 == 0.0)
        {
          [(PLSwipeInteraction *)self _hideAnimated:1 fastAnimation:0 velocity:0 completion:v9];
        }
        else
        {
          double v17 = v12;
          objc_initWeak((id *)location, self);
          v22[0] = MEMORY[0x1E4F143A8];
          v22[1] = 3221225472;
          v22[2] = __40__PLSwipeInteraction__handlePanGesture___block_invoke;
          v22[3] = &unk_1E6B5F918;
          objc_copyWeak(&v23, (id *)location);
          [(PLSwipeInteraction *)self _revealToPosition:1 animated:0 fastAnimation:v22 velocity:v17 completion:v9];
          objc_destroyWeak(&v23);
          objc_destroyWeak((id *)location);
        }
        break;
      case 2:
        double v13 = v7 + self->_panGestureStartingPosition;
        unint64_t v14 = [(PLSwipeInteraction *)self _interfaceEdgeToPresentOnForAbsoluteTranslation:v13];
        if (v14)
        {
          unint64_t v15 = v14;
          unint64_t v16 = [(PLSwipeInteraction *)self _layoutLocationForInterfaceEdge:v14];
          if ([(PLActionButtonsPresentingView *)self->_actionButtonsPresentingView layoutLocation] != v16
            || [(PLActionButtonsPresentingView *)self->_actionButtonsPresentingView interfaceEdge] != v15)
          {
            [(PLSwipeInteraction *)self _removeActionButtons];
            [(PLSwipeInteraction *)self _addActionButtonViewsAtLayoutLocation:v16 interfaceEdge:v15];
          }
        }
        [(PLSwipeInteraction *)self _setViewPosition:0 withVelocity:0 usingNonInteractiveSpring:0 animated:v13 completion:0.0];
        break;
      case 1:
        if (self->_actionButtonsPresentingView) {
          goto LABEL_22;
        }
        unint64_t v11 = [(PLSwipeInteraction *)self _interfaceEdgeToPresentOnForInitialPanTranslation:v7 andInitialPanVelocity:v9];
        if (v11)
        {
          [(PLSwipeInteraction *)self _addActionButtonViewsAtLayoutLocation:[(PLSwipeInteraction *)self _layoutLocationForInterfaceEdge:v11] interfaceEdge:v11];
        }
        else
        {
          v18 = PLLogInteraction;
          if (os_log_type_enabled((os_log_t)PLLogInteraction, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)location = 138543874;
            *(void *)&location[4] = self;
            __int16 v25 = 2048;
            double v26 = v9;
            __int16 v27 = 2048;
            double v28 = v7;
            _os_log_impl(&dword_1D93DD000, v18, OS_LOG_TYPE_DEFAULT, "%{public}@: Cannot infer which side to reveal actions. Gesture translation: %f velocity: %f", location, 0x20u);
          }
        }
        if (self->_actionButtonsPresentingView)
        {
LABEL_22:
          if (objc_opt_respondsToSelector()) {
            [v5 swipeInteractionDidBeginRevealingActions:self];
          }
        }
        id WeakRetained = objc_loadWeakRetained((id *)&self->_viewToMove);
        [WeakRetained frame];
        double v21 = v20;

        self->_panGestureStartingPosition = v21;
        [(PLSwipeInteraction *)self _setViewPosition:0 withVelocity:0 usingNonInteractiveSpring:0 animated:v7 + v21 completion:0.0];
        break;
    }
  }
  else
  {
    [(PLSwipeInteraction *)self hideActionsAnimated:1 fastAnimation:1 completion:0];
  }
}

void __40__PLSwipeInteraction__handlePanGesture___block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (([WeakRetained _shouldContinuePresentingActionButtons] & 1) == 0) {
    [WeakRetained hideActionsAnimated:1 fastAnimation:1 completion:0];
  }
}

- (double)_updateActionRevealStateForTargetPosition:(double)a3 currentPosition:(double)a4 velocity:(double)a5
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_viewToMove);
  unint64_t v10 = [(PLActionButtonsPresentingView *)self->_actionButtonsPresentingView interfaceEdge];
  actionButtonsPresentingView = self->_actionButtonsPresentingView;
  double v12 = 0.0;
  if (actionButtonsPresentingView)
  {
    double v13 = fabs(a5);
    BOOL v14 = v10 == 2 ? a5 > 0.0 : a5 < 0.0;
    uint64_t v15 = [(PLActionButtonsPresentingView *)actionButtonsPresentingView interfaceEdge];
    BOOL v16 = v13 > 100.0 && v14;
    BOOL v17 = fabs(a3) < 45.0 || v15 == 0;
    if (!v17 && !v16)
    {
      if ([WeakRetained _shouldReverseLayoutDirection]) {
        double v18 = a4;
      }
      else {
        double v18 = a3;
      }
      uint64_t v19 = [(PLActionButtonsPresentingView *)self->_actionButtonsPresentingView actionButtonsView];
      [(PLSwipeInteraction *)self _actionButtonTriggerDistanceForView:v19];
      double v21 = v20;
      v22 = [v19 defaultAction];

      if (v22 && fabs(v18) > v21)
      {
        [WeakRetained bounds];
        double Width = CGRectGetWidth(v28);
        unint64_t v24 = [(PLActionButtonsPresentingView *)self->_actionButtonsPresentingView interfaceEdge];
        double v25 = -(Width + 8.0);
      }
      else
      {
        [v19 defaultWidth];
        double Width = v26 + 8.0;
        unint64_t v24 = [(PLActionButtonsPresentingView *)self->_actionButtonsPresentingView interfaceEdge];
        double v25 = -Width;
      }
      if (v24 == 2) {
        double v12 = v25;
      }
      else {
        double v12 = Width;
      }
    }
  }

  return v12;
}

- (void)_actuateFeedbackForDefaultActionLockedIfNecessary
{
  if (![(PLSwipeInteraction *)self didPlayHaptic])
  {
    [(PLSwipeInteraction *)self setDidPlayHaptic:1];
    defaultActionFeedbackGenerator = self->_defaultActionFeedbackGenerator;
    uint64_t v4 = *MEMORY[0x1E4F44180];
    [(PLSwipeInteraction *)self _panLocation];
    -[_UIStatesFeedbackGenerator transitionToState:ended:atLocation:](defaultActionFeedbackGenerator, "transitionToState:ended:atLocation:", v4, 1);
  }
}

- (void)_actuateFeedbackForDefaultActionUnlockedIfNecessary
{
  if ([(PLSwipeInteraction *)self didPlayHaptic])
  {
    [(PLSwipeInteraction *)self setDidPlayHaptic:0];
    defaultActionFeedbackGenerator = self->_defaultActionFeedbackGenerator;
    uint64_t v4 = *MEMORY[0x1E4F44188];
    [(PLSwipeInteraction *)self _panLocation];
    -[_UIStatesFeedbackGenerator transitionToState:ended:atLocation:](defaultActionFeedbackGenerator, "transitionToState:ended:atLocation:", v4, 1);
  }
}

- (void)_addActionButtonsAndRevealAnimated:(BOOL)a3 fastAnimation:(BOOL)a4 layoutLocation:(unint64_t)a5 completion:(id)a6
{
  BOOL v7 = a4;
  BOOL v8 = a3;
  id v15 = a6;
  [(PLSwipeInteraction *)self _addActionButtonViewsAtLayoutLocation:a5 interfaceEdge:[(PLSwipeInteraction *)self _interfaceEdgeForLayoutLocation:a5]];
  unint64_t v10 = [(PLActionButtonsPresentingView *)self->_actionButtonsPresentingView actionButtonsView];
  [v10 defaultWidth];
  double v12 = v11;

  unint64_t v13 = [(PLActionButtonsPresentingView *)self->_actionButtonsPresentingView interfaceEdge];
  double v14 = v12 + 8.0;
  if (v13 == 2) {
    double v14 = -(v12 + 8.0);
  }
  [(PLSwipeInteraction *)self _revealToPosition:v8 animated:v7 fastAnimation:v15 velocity:v14 completion:0.0];
}

- (void)_revealToPosition:(double)a3 animated:(BOOL)a4 fastAnimation:(BOOL)a5 velocity:(double)a6 completion:(id)a7
{
  BOOL v8 = a5;
  BOOL v9 = a4;
  id v12 = a7;
  unint64_t v13 = [(PLSwipeInteraction *)self delegate];
  if (objc_opt_respondsToSelector()) {
    [v13 swipeInteractionDidBeginRevealingActions:self];
  }
  objc_initWeak(&location, self);
  v15[0] = MEMORY[0x1E4F143A8];
  v15[1] = 3221225472;
  v15[2] = __83__PLSwipeInteraction__revealToPosition_animated_fastAnimation_velocity_completion___block_invoke;
  v15[3] = &unk_1E6B5FC80;
  objc_copyWeak(&v17, &location);
  id v14 = v12;
  id v16 = v14;
  [(PLSwipeInteraction *)self _setViewPosition:v8 withVelocity:v9 usingNonInteractiveSpring:v15 animated:a3 completion:a6];

  objc_destroyWeak(&v17);
  objc_destroyWeak(&location);
}

void __83__PLSwipeInteraction__revealToPosition_animated_fastAnimation_velocity_completion___block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  if (WeakRetained)
  {
    id v5 = WeakRetained;
    unint64_t v3 = [WeakRetained delegate];
    if (objc_opt_respondsToSelector()) {
      [v3 swipeInteractionDidCompleteRevealingActions:v5];
    }
    uint64_t v4 = *(void *)(a1 + 32);
    if (v4) {
      (*(void (**)(void))(v4 + 16))();
    }

    id WeakRetained = v5;
  }
}

- (void)_hideAnimated:(BOOL)a3 fastAnimation:(BOOL)a4 velocity:(double)a5 completion:(id)a6
{
  BOOL v7 = a4;
  BOOL v8 = a3;
  id v10 = a6;
  double v11 = [(PLSwipeInteraction *)self delegate];
  if (objc_opt_respondsToSelector()) {
    [v11 swipeInteractionDidBeginHidingActions:self];
  }
  objc_initWeak(&location, self);
  v13[0] = MEMORY[0x1E4F143A8];
  v13[1] = 3221225472;
  v13[2] = __70__PLSwipeInteraction__hideAnimated_fastAnimation_velocity_completion___block_invoke;
  v13[3] = &unk_1E6B5FC80;
  objc_copyWeak(&v15, &location);
  id v12 = v10;
  id v14 = v12;
  [(PLSwipeInteraction *)self _setViewPosition:v7 withVelocity:v8 usingNonInteractiveSpring:v13 animated:0.0 completion:a5];

  objc_destroyWeak(&v15);
  objc_destroyWeak(&location);
}

void __70__PLSwipeInteraction__hideAnimated_fastAnimation_velocity_completion___block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  if (WeakRetained)
  {
    id v5 = WeakRetained;
    unint64_t v3 = [WeakRetained delegate];
    if (objc_opt_respondsToSelector()) {
      [v3 swipeInteractionDidCompleteHidingActions:v5];
    }
    [v5 setViewToMove:0];
    [v5 _removeActionButtons];
    uint64_t v4 = *(void *)(a1 + 32);
    if (v4) {
      (*(void (**)(void))(v4 + 16))();
    }

    id WeakRetained = v5;
  }
}

- (void)_setViewPosition:(double)a3 withVelocity:(double)a4 usingNonInteractiveSpring:(BOOL)a5 animated:(BOOL)a6 completion:(id)a7
{
  BOOL v7 = a6;
  BOOL v8 = a5;
  id v12 = a7;
  objc_initWeak(&location, self);
  v14[0] = MEMORY[0x1E4F143A8];
  v14[1] = 3221225472;
  v14[2] = __98__PLSwipeInteraction__setViewPosition_withVelocity_usingNonInteractiveSpring_animated_completion___block_invoke;
  v14[3] = &unk_1E6B5FCA8;
  objc_copyWeak(v16, &location);
  v16[1] = *(id *)&a3;
  id v13 = v12;
  id v15 = v13;
  [(PLSwipeInteraction *)self _setViewPositionHelper:v8 withVelocity:v7 usingNonInteractiveSpring:v14 animated:a3 completion:a4];

  objc_destroyWeak(v16);
  objc_destroyWeak(&location);
}

void __98__PLSwipeInteraction__setViewPosition_withVelocity_usingNonInteractiveSpring_animated_completion___block_invoke(uint64_t a1)
{
  id WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 40));
  if (WeakRetained)
  {
    BOOL v8 = WeakRetained;
    id v3 = objc_loadWeakRetained(WeakRetained + 12);
    uint64_t v4 = v3;
    if (v3)
    {
      double v5 = *(double *)(a1 + 48);
      [v3 frame];
      if (v5 != v6)
      {
        [v4 frame];
        [v4 setFrame:*(double *)(a1 + 48)];
      }
    }
    uint64_t v7 = *(void *)(a1 + 32);
    if (v7) {
      (*(void (**)(void))(v7 + 16))();
    }

    id WeakRetained = v8;
  }
}

- (void)_setViewPositionHelper:(double)a3 withVelocity:(double)a4 usingNonInteractiveSpring:(BOOL)a5 animated:(BOOL)a6 completion:(id)a7
{
  BOOL v7 = a6;
  BOOL v8 = a5;
  id v12 = (void (**)(void))a7;
  id animationCompletion = self->_animationCompletion;
  self->_id animationCompletion = 0;

  id performWithoutRetargetingAnimationCompletion = self->_performWithoutRetargetingAnimationCompletion;
  self->_id performWithoutRetargetingAnimationCompletion = 0;

  id v15 = self->_targetPositionAnimatableProperty;
  [(UIViewFloatAnimatableProperty *)v15 value];
  if (vabdd_f64(v16, a3) >= 2.22044605e-16)
  {
    v30[0] = MEMORY[0x1E4F143A8];
    v30[1] = 3221225472;
    v30[2] = __104__PLSwipeInteraction__setViewPositionHelper_withVelocity_usingNonInteractiveSpring_animated_completion___block_invoke;
    v30[3] = &unk_1E6B5FAC8;
    v31 = v15;
    double v32 = a3;
    uint64_t v19 = (void *)MEMORY[0x1D948D440](v30);
    double v20 = (void *)MEMORY[0x1D948D440](v12);
    if (v7)
    {
      id v21 = self->_animationCompletion;
      self->_id animationCompletion = v20;

      ++self->_animationCount;
      objc_initWeak(&location, self);
      uint64_t v24 = MEMORY[0x1E4F143A8];
      uint64_t v25 = 3221225472;
      double v26 = __104__PLSwipeInteraction__setViewPositionHelper_withVelocity_usingNonInteractiveSpring_animated_completion___block_invoke_2;
      __int16 v27 = &unk_1E6B5FCD0;
      objc_copyWeak(&v28, &location);
      v22 = (void *)MEMORY[0x1D948D440](&v24);
      if (v8) {
        objc_msgSend(MEMORY[0x1E4F42FF0], "_animateUsingSpringInteractive:animations:completion:", 0, v19, v22, v24, v25, v26, v27);
      }
      else {
        objc_msgSend(MEMORY[0x1E4F42FF0], "_animateUsingSpringWithTension:friction:interactive:animations:completion:", 0, v19, v22, fabs(a4) * 0.1 + 180.0, 25.0, v24, v25, v26, v27);
      }

      objc_destroyWeak(&v28);
      objc_destroyWeak(&location);
    }
    else
    {
      id v23 = self->_performWithoutRetargetingAnimationCompletion;
      self->_id performWithoutRetargetingAnimationCompletion = v20;

      [MEMORY[0x1E4F42FF0] _performWithoutRetargetingAnimations:v19];
    }

    id v18 = v31;
LABEL_12:

    goto LABEL_13;
  }
  if (v12)
  {
    if (!self->_animationCount)
    {
      v12[2](v12);
      goto LABEL_13;
    }
    id v17 = (void *)MEMORY[0x1D948D440](v12);
    id v18 = self->_animationCompletion;
    self->_id animationCompletion = v17;
    goto LABEL_12;
  }
LABEL_13:
}

uint64_t __104__PLSwipeInteraction__setViewPositionHelper_withVelocity_usingNonInteractiveSpring_animated_completion___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) setValue:*(double *)(a1 + 40)];
}

void __104__PLSwipeInteraction__setViewPositionHelper_withVelocity_usingNonInteractiveSpring_animated_completion___block_invoke_2(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    uint64_t v2 = WeakRetained[8];
    if (v2) {
      WeakRetained[8] = v2 - 1;
    }
    double v6 = WeakRetained;
    id v3 = (void (**)(void))MEMORY[0x1D948D440](WeakRetained[6]);
    uint64_t v4 = (void *)v6[6];
    v6[6] = 0;

    if (v6[8]) {
      BOOL v5 = 1;
    }
    else {
      BOOL v5 = v3 == 0;
    }
    if (!v5) {
      v3[2](v3);
    }

    id WeakRetained = v6;
  }
}

- (double)_actionButtonTriggerDistanceForView:(id)a3
{
  p_viewToMove = &self->_viewToMove;
  id v4 = a3;
  id WeakRetained = objc_loadWeakRetained((id *)p_viewToMove);
  [WeakRetained bounds];
  double Width = CGRectGetWidth(v10);

  [v4 defaultWidth];
  double v8 = v7;

  return fmax(Width * 0.5, (v8 + 8.0) * 1.1);
}

- (void)_setupContentOffsetFloatAnimatableProperty
{
  v10[1] = *MEMORY[0x1E4F143B8];
  objc_initWeak(&location, self);
  id v3 = (UIViewFloatAnimatableProperty *)objc_alloc_init(MEMORY[0x1E4F43000]);
  targetPositionAnimatableProperty = self->_targetPositionAnimatableProperty;
  self->_targetPositionAnimatableProperty = v3;

  [(UIViewFloatAnimatableProperty *)self->_targetPositionAnimatableProperty setValue:0.0];
  BOOL v5 = (void *)MEMORY[0x1E4F42FF0];
  v10[0] = self->_targetPositionAnimatableProperty;
  double v6 = [MEMORY[0x1E4F1C978] arrayWithObjects:v10 count:1];
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __64__PLSwipeInteraction__setupContentOffsetFloatAnimatableProperty__block_invoke;
  v7[3] = &unk_1E6B5F918;
  objc_copyWeak(&v8, &location);
  [v5 _createTransformerWithInputAnimatableProperties:v6 presentationValueChangedCallback:v7];

  objc_destroyWeak(&v8);
  objc_destroyWeak(&location);
}

uint64_t __64__PLSwipeInteraction__setupContentOffsetFloatAnimatableProperty__block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  uint64_t v2 = WeakRetained;
  if (WeakRetained)
  {
    id WeakRetained = (void *)WeakRetained[3];
    if (WeakRetained)
    {
      id v4 = v2;
      [WeakRetained presentationValue];
      id WeakRetained = objc_msgSend(v4, "_updateTargetPosition:");
      uint64_t v2 = v4;
    }
  }
  return MEMORY[0x1F41817F8](WeakRetained, v2);
}

- (void)_updateTargetPosition:(double)a3
{
  -[PLSwipeInteraction _updatePosition:](self, "_updatePosition:");
  [(PLSwipeInteraction *)self _updateActionButtonRevealPercentageForTargetPosition:a3];
}

- (void)_updatePosition:(double)a3
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_viewToMove);
  [WeakRetained frame];
  [WeakRetained setFrame:a3];
  BOOL v5 = [(PLSwipeInteraction *)self delegate];
  if (objc_opt_respondsToSelector()) {
    [v5 swipeInteraction:self didMoveToNewXPosition:a3];
  }
  double v6 = (void (**)(void))MEMORY[0x1D948D440](self->_performWithoutRetargetingAnimationCompletion);
  id performWithoutRetargetingAnimationCompletion = self->_performWithoutRetargetingAnimationCompletion;
  self->_id performWithoutRetargetingAnimationCompletion = 0;

  if (v6) {
    v6[2](v6);
  }
}

- (void)_updateActionButtonRevealPercentageForTargetPosition:(double)a3
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_viewToMove);
  [WeakRetained bounds];
  double Width = CGRectGetWidth(v16);
  double v6 = [(PLActionButtonsPresentingView *)self->_actionButtonsPresentingView actionButtonsView];
  double v7 = v6;
  double v8 = fabs(a3);
  if (v8 <= 8.0)
  {
    [(PLSwipeInteraction *)self _updateRevealPercentage:0.0];
    [v7 setHighlightDefaultActionButton:0];
  }
  else
  {
    if (v6)
    {
      [v6 defaultWidth];
      if (v9 > 0.0)
      {
        [v7 defaultWidth];
        [(PLSwipeInteraction *)self _updateRevealPercentage:(v8 + -8.0) / v10];
      }
    }
    [(PLSwipeInteraction *)self _actionButtonTriggerDistanceForView:v7];
    double v12 = v11;
    [v7 setHighlightDefaultActionButton:v8 > v11];
    if (v8 > v12 && (unint64_t)[v7 actionButtonCount] >= 2) {
      [(PLSwipeInteraction *)self _actuateFeedbackForDefaultActionLockedIfNecessary];
    }
    if ([(UIPanGestureRecognizer *)self->_panGestureRecognizer state] != 2
      && v8 > Width * 0.98
      && ![(PLActionButtonsPresentingView *)self->_actionButtonsPresentingView defaultActionTriggered])
    {
      id v13 = [v7 defaultAction];
      [v13 performWithSender:self target:0];
      [(PLActionButtonsPresentingView *)self->_actionButtonsPresentingView setDefaultActionTriggered:1];
    }
  }
}

- (void)_updateRevealPercentage:(double)a3
{
  actionButtonsPresentingView = self->_actionButtonsPresentingView;
  if (a3 <= 0.0)
  {
    [(PLActionButtonsPresentingView *)actionButtonsPresentingView setHidden:1];
  }
  else
  {
    [(PLActionButtonsPresentingView *)actionButtonsPresentingView setHidden:0];
    id v43 = [(PLActionButtonsPresentingView *)self->_actionButtonsPresentingView actionButtonsView];
    [v43 defaultWidth];
    if (v6 * a3 >= 30.0) {
      double v7 = v6 * a3;
    }
    else {
      double v7 = 30.0;
    }
    [(PLActionButtonsPresentingView *)self->_actionButtonsPresentingView setAlpha:fmin(a3, 1.0) * ((v7 + -30.0) / (v6 * 0.5 + -30.0))];
    id WeakRetained = objc_loadWeakRetained((id *)&self->_viewToMove);
    [WeakRetained frame];
    CGFloat v10 = v9;
    CGFloat v12 = v11;
    CGFloat v14 = v13;
    CGFloat v16 = v15;
    [(PLActionButtonsPresentingView *)self->_actionButtonsPresentingView frame];
    unint64_t v17 = [(PLActionButtonsPresentingView *)self->_actionButtonsPresentingView interfaceEdge];
    double v18 = 0.0;
    if (v17 == 2)
    {
      v45.origin.x = v10;
      v45.origin.y = v12;
      v45.size.width = v14;
      v45.size.height = v16;
      double v18 = CGRectGetWidth(v45) - v7;
    }
    uint64_t v19 = [(PLActionButtonsPresentingView *)self->_actionButtonsPresentingView actionButtonsView];
    char v20 = [v19 isVerticallyStacked];

    if (v20)
    {
      id v21 = (id *)MEMORY[0x1E4F43630];
      v22 = [(id)*MEMORY[0x1E4F43630] preferredContentSizeCategory];
      if (UIContentSizeCategoryIsAccessibilityCategory(v22)) {
        double v23 = 0.0;
      }
      else {
        double v23 = 0.2;
      }
      v46.origin.x = v10;
      v46.origin.y = v12;
      v46.size.width = v14;
      v46.size.height = v16;
      double v24 = v23 * CGRectGetHeight(v46);
      v47.origin.x = v10;
      v47.origin.y = v12;
      v47.size.width = v14;
      v47.size.height = v16;
      double v25 = v24 + CGRectGetMinY(v47);

      v48.origin.x = v10;
      v48.origin.y = v12;
      v48.size.width = v14;
      v48.size.height = v16;
      double Height = CGRectGetHeight(v48);
      __int16 v27 = [*v21 preferredContentSizeCategory];
      BOOL IsAccessibilityCategory = UIContentSizeCategoryIsAccessibilityCategory(v27);
      double v29 = 0.6;
      if (IsAccessibilityCategory) {
        double v29 = 1.0;
      }
      double v30 = Height * v29;
    }
    else
    {
      v49.origin.x = v10;
      v49.origin.y = v12;
      v49.size.width = v14;
      v49.size.height = v16;
      double v25 = CGRectGetMinY(v49) + 0.0;
      v50.origin.x = v10;
      v50.origin.y = v12;
      v50.size.width = v14;
      v50.size.height = v16;
      double v30 = CGRectGetHeight(v50);
    }
    -[PLActionButtonsPresentingView setFrame:](self->_actionButtonsPresentingView, "setFrame:", v18, v25, v7, v30);
    [v43 setStretchedWidth:v7];
    [v43 setNeedsLayout];
    [v43 sizeToFit];
    [v43 frame];
    CGFloat v32 = v31;
    CGFloat v34 = v33;
    CGFloat v36 = v35;
    CGFloat v38 = v37;
    [(PLActionButtonsPresentingView *)self->_actionButtonsPresentingView bounds];
    double MaxX = CGRectGetMaxX(v51);
    v52.origin.x = v32;
    v52.origin.y = v34;
    v52.size.width = v36;
    v52.size.height = v38;
    double v40 = MaxX - CGRectGetWidth(v52);
    if (v17 == 2) {
      double v41 = v40;
    }
    else {
      double v41 = *MEMORY[0x1E4F1DAD8];
    }
    if (v17 == 2) {
      double v42 = 0.0;
    }
    else {
      double v42 = *(double *)(MEMORY[0x1E4F1DAD8] + 8);
    }
    v53.origin.x = v41;
    v53.origin.y = v42;
    v53.size.width = v36;
    v53.size.height = v38;
    objc_msgSend(v43, "setFrame:", v41, v42, CGRectGetWidth(v53), v30);
  }
}

- (void)_addActionButtonViewsAtLayoutLocation:(unint64_t)a3 interfaceEdge:(unint64_t)a4
{
  uint64_t v33 = *MEMORY[0x1E4F143B8];
  double v7 = [(PLSwipeInteraction *)self delegate];
  if ((objc_opt_respondsToSelector() & 1) == 0
    || ![v7 swipeInteraction:self shouldRevealActionsFromLayoutLocation:a3])
  {
    goto LABEL_26;
  }
  if (objc_opt_respondsToSelector())
  {
    double v8 = [v7 swipeInteraction:self actionsToRevealFromLayoutLocation:a3];
    double v9 = v8;
    if (v8 && [v8 count]) {
      goto LABEL_10;
    }
  }
  else
  {
    double v9 = 0;
  }
  if (os_log_type_enabled((os_log_t)PLLogInteraction, OS_LOG_TYPE_DEBUG)) {
    -[PLSwipeInteraction _addActionButtonViewsAtLayoutLocation:interfaceEdge:].cold.4();
  }
LABEL_10:
  long long v30 = 0u;
  long long v31 = 0u;
  long long v28 = 0u;
  long long v29 = 0u;
  id v10 = v9;
  uint64_t v11 = [v10 countByEnumeratingWithState:&v28 objects:v32 count:16];
  id v12 = v10;
  if (v11)
  {
    uint64_t v13 = v11;
    unint64_t v14 = 0;
    uint64_t v15 = *(void *)v29;
    do
    {
      for (uint64_t i = 0; i != v13; ++i)
      {
        if (*(void *)v29 != v15) {
          objc_enumerationMutation(v10);
        }
        v14 += objc_msgSend(*(id *)(*((void *)&v28 + 1) + 8 * i), "pl_isDefaultAction", (void)v28);
      }
      uint64_t v13 = [v10 countByEnumeratingWithState:&v28 objects:v32 count:16];
    }
    while (v13);

    if (v14 < 2) {
      goto LABEL_22;
    }
    if (os_log_type_enabled((os_log_t)PLLogInteraction, OS_LOG_TYPE_DEBUG)) {
      -[PLSwipeInteraction _addActionButtonViewsAtLayoutLocation:interfaceEdge:]();
    }
    id v12 = 0;
  }

  id v10 = v12;
LABEL_22:
  if ((unint64_t)objc_msgSend(v10, "count", (void)v28) < 5) {
    goto LABEL_27;
  }
  if (os_log_type_enabled((os_log_t)PLLogInteraction, OS_LOG_TYPE_DEBUG)) {
    -[PLSwipeInteraction _addActionButtonViewsAtLayoutLocation:interfaceEdge:]();
  }

LABEL_26:
  id v10 = 0;
LABEL_27:
  if (![v10 count])
  {
LABEL_36:
    id WeakRetained = objc_loadWeakRetained((id *)&self->_view);
    double v18 = 0;
LABEL_37:

    goto LABEL_38;
  }
  if ((objc_opt_respondsToSelector() & 1) == 0
    || ([v7 viewToMoveForSwipeInteraction:self], (uint64_t v17 = objc_claimAutoreleasedReturnValue()) == 0))
  {
    if (os_log_type_enabled((os_log_t)PLLogInteraction, OS_LOG_TYPE_DEBUG)) {
      -[PLSwipeInteraction _addActionButtonViewsAtLayoutLocation:interfaceEdge:]();
    }
    goto LABEL_36;
  }
  double v18 = (void *)v17;
  id v19 = objc_loadWeakRetained((id *)&self->_view);
  if (v19)
  {
    id WeakRetained = v19;
    objc_storeWeak((id *)&self->_viewToMove, v18);
    if (unint64_t)[v10 count] >= 2 && (objc_opt_respondsToSelector()) {
      uint64_t v21 = [v7 shouldVerticallyStackButtonsForSwipeInteraction:self];
    }
    else {
      uint64_t v21 = 0;
    }
    if (objc_opt_respondsToSelector()) {
      [v7 buttonsCornerRadiusForSwipeInteraction:self];
    }
    v22 = [PLPlatterActionButtonsView alloc];
    [WeakRetained bounds];
    double v23 = -[PLPlatterActionButtonsView initWithFrame:actions:cornerRadius:shouldVerticallyStack:](v22, "initWithFrame:actions:cornerRadius:shouldVerticallyStack:", v10, v21);
    if (objc_opt_respondsToSelector())
    {
      [(PLPlatterActionButtonsView *)v23 setMaterialGroupNameBase:self->_materialGroupNameBase];
      -[PLPlatterActionButtonsView setBackgroundMaterialRecipe:](v23, "setBackgroundMaterialRecipe:", [v7 buttonsRecipeForSwipeInteraction:self]);
    }
    if (objc_opt_respondsToSelector())
    {
      double v24 = [v7 buttonsTintColorForSwipeInteraction:self];
      [(PLPlatterActionButtonsView *)v23 setBackgroundTintColor:v24];
    }
    if (objc_opt_respondsToSelector())
    {
      double v25 = [v7 buttonsTextColorForSwipeInteraction:self];
      [(PLPlatterActionButtonsView *)v23 setTextColor:v25];
    }
    double v26 = [[PLActionButtonsPresentingView alloc] initWithActionButtonsView:v23 interfaceEdge:a4 layoutLocation:a3];
    actionButtonsPresentingView = self->_actionButtonsPresentingView;
    self->_actionButtonsPresentingView = v26;

    [WeakRetained addSubview:self->_actionButtonsPresentingView];
    [WeakRetained sendSubviewToBack:self->_actionButtonsPresentingView];

    goto LABEL_37;
  }
LABEL_38:
}

- (void)_removeActionButtons
{
  [(PLActionButtonsPresentingView *)self->_actionButtonsPresentingView removeFromSuperview];
  actionButtonsPresentingView = self->_actionButtonsPresentingView;
  self->_actionButtonsPresentingView = 0;

  [(PLSwipeInteraction *)self setDidPlayHaptic:0];
}

- (void)setPerformingSwipeHinting:(BOOL)a3
{
  if (self->_performingSwipeHinting != a3)
  {
    self->_performingSwipeHinting = a3;
    if (!a3)
    {
      dispatch_block_cancel(self->_swipeHintingHideAnimationBlock);
      id swipeHintingHideAnimationBlock = self->_swipeHintingHideAnimationBlock;
      self->_id swipeHintingHideAnimationBlock = 0;
    }
  }
}

- (void)_performSwipeHintingForLayoutLocation:(unint64_t)a3
{
  if (self->_actionButtonsPresentingView)
  {
    [(PLSwipeInteraction *)self hideActionsAnimated:1 fastAnimation:0 completion:0];
  }
  else
  {
    [(PLSwipeInteraction *)self setPerformingSwipeHinting:1];
    [(PLSwipeInteraction *)self _addActionButtonsAndRevealAnimated:1 fastAnimation:0 layoutLocation:a3 completion:0];
    objc_initWeak(&location, self);
    v8[0] = MEMORY[0x1E4F143A8];
    v8[1] = 3221225472;
    v8[2] = __60__PLSwipeInteraction__performSwipeHintingForLayoutLocation___block_invoke;
    v8[3] = &unk_1E6B5F918;
    objc_copyWeak(&v9, &location);
    dispatch_block_t v5 = dispatch_block_create((dispatch_block_flags_t)0, v8);
    id swipeHintingHideAnimationBlock = self->_swipeHintingHideAnimationBlock;
    self->_id swipeHintingHideAnimationBlock = v5;

    dispatch_time_t v7 = dispatch_time(0, 3000000000);
    dispatch_after(v7, MEMORY[0x1E4F14428], self->_swipeHintingHideAnimationBlock);
    objc_destroyWeak(&v9);
    objc_destroyWeak(&location);
  }
}

uint64_t __60__PLSwipeInteraction__performSwipeHintingForLayoutLocation___block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  uint64_t v2 = WeakRetained;
  if (WeakRetained)
  {
    id v4 = WeakRetained;
    id WeakRetained = (unsigned char *)[WeakRetained isPerformingSwipeHinting];
    uint64_t v2 = v4;
    if (WeakRetained)
    {
      v4[72] = 0;
      id WeakRetained = (unsigned char *)[v4 hideActionsAnimated:1 fastAnimation:0 completion:0];
      uint64_t v2 = v4;
    }
  }
  return MEMORY[0x1F41817F8](WeakRetained, v2);
}

- (NSString)materialGroupNameBase
{
  return self->_materialGroupNameBase;
}

- (UIView)view
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_view);
  return (UIView *)WeakRetained;
}

- (void)setView:(id)a3
{
}

- (UIView)viewToMove
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_viewToMove);
  return (UIView *)WeakRetained;
}

- (void)setViewToMove:(id)a3
{
}

- (PLSwipeInteractionDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  return (PLSwipeInteractionDelegate *)WeakRetained;
}

- (BOOL)isPerformingSwipeHinting
{
  return self->_performingSwipeHinting;
}

- (_UIStatesFeedbackGenerator)defaultActionFeedbackGenerator
{
  return self->_defaultActionFeedbackGenerator;
}

- (void)setDefaultActionFeedbackGenerator:(id)a3
{
}

- (BOOL)didPlayHaptic
{
  return self->_didPlayHaptic;
}

- (void)setDidPlayHaptic:(BOOL)a3
{
  self->_didPlayHaptic = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_defaultActionFeedbackGenerator, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_destroyWeak((id *)&self->_viewToMove);
  objc_destroyWeak((id *)&self->_view);
  objc_storeStrong((id *)&self->_materialGroupNameBase, 0);
  objc_storeStrong(&self->_performWithoutRetargetingAnimationCompletion, 0);
  objc_storeStrong(&self->_animationCompletion, 0);
  objc_storeStrong(&self->_swipeHintingHideAnimationBlock, 0);
  objc_storeStrong((id *)&self->_actionButtonsPresentingView, 0);
  objc_storeStrong((id *)&self->_targetPositionAnimatableProperty, 0);
  objc_storeStrong((id *)&self->_panGestureRecognizer, 0);
}

- (void)_addActionButtonViewsAtLayoutLocation:interfaceEdge:.cold.1()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_1D93DD000, v0, v1, "%{public}@: Must provide view to present actions in", v2, v3, v4, v5, v6);
}

- (void)_addActionButtonViewsAtLayoutLocation:interfaceEdge:.cold.2()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_1D93DD000, v0, v1, "%{public}@: Must provide 4 or less actions per location", v2, v3, v4, v5, v6);
}

- (void)_addActionButtonViewsAtLayoutLocation:interfaceEdge:.cold.3()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_1D93DD000, v0, v1, "%{public}@: Must provide only one UIAction with defaultAction=YES per location", v2, v3, v4, v5, v6);
}

- (void)_addActionButtonViewsAtLayoutLocation:interfaceEdge:.cold.4()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_1D93DD000, v0, v1, "%{public}@: Must provide actions for reveal", v2, v3, v4, v5, v6);
}

@end