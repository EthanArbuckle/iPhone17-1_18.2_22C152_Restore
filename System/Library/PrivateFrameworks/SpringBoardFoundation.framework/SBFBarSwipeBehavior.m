@interface SBFBarSwipeBehavior
- (SBFBarSwipeBehavior)initWithGrabberView:(id)a3 settleAffordanceAnimationBehaviorDescription:(id)a4;
- (SBFBarSwipeBehaviorDelegate)delegate;
- (UIView)grabberView;
- (UIViewSpringAnimationBehaviorDescribing)settleAffordanceAnimationBehaviorDescription;
- (double)_progressWithTranslation:(CGPoint)a3 liftoffVelocity:(CGPoint)a4;
- (double)grabberViewAdditionalEdgeSpacing;
- (id)_grabberViewContainerView;
- (id)_settleAffordanceAnimationBehaviorDescription;
- (int64_t)feedbackType;
- (void)_createFeedbackGenerator;
- (void)_fireAction;
- (void)_offsetGrabberForProgress:(double)a3;
- (void)_setGrabberAdditionalEdgeSpacing:(double)a3;
- (void)_settleGrabber;
- (void)barSwipeInteractionBegan:(id)a3;
- (void)barSwipeInteractionChanged:(id)a3;
- (void)barSwipeInteractionEnded:(id)a3;
- (void)setDelegate:(id)a3;
- (void)setFeedbackType:(int64_t)a3;
@end

@implementation SBFBarSwipeBehavior

- (SBFBarSwipeBehavior)initWithGrabberView:(id)a3 settleAffordanceAnimationBehaviorDescription:(id)a4
{
  id v8 = a3;
  id v9 = a4;
  if (!v8)
  {
    v13 = [MEMORY[0x1E4F28B00] currentHandler];
    [v13 handleFailureInMethod:a2, self, @"SBFBarSwipeBehavior.m", 33, @"Invalid parameter not satisfying: %@", @"grabberView" object file lineNumber description];
  }
  v14.receiver = self;
  v14.super_class = (Class)SBFBarSwipeBehavior;
  v10 = [(SBFBarSwipeBehavior *)&v14 init];
  v11 = v10;
  if (v10)
  {
    objc_storeStrong((id *)&v10->_grabberView, a3);
    objc_storeStrong((id *)&v11->_settleAffordanceAnimationBehaviorDescription, a4);
    v11->_feedbackType = 1010;
    [(SBFBarSwipeBehavior *)v11 _createFeedbackGenerator];
  }

  return v11;
}

- (void)setFeedbackType:(int64_t)a3
{
  if (self->_feedbackType != a3)
  {
    self->_feedbackType = a3;
    [(SBFBarSwipeBehavior *)self _createFeedbackGenerator];
  }
}

- (void)barSwipeInteractionBegan:(id)a3
{
  self->_didFireAction = 0;
  [(UINotificationFeedbackGenerator *)self->_dismissalFeedbackGenerator prepare];
}

- (void)barSwipeInteractionChanged:(id)a3
{
  id v4 = a3;
  id v9 = [(SBFBarSwipeBehavior *)self _grabberViewContainerView];
  objc_msgSend(v4, "translationInView:");
  double v6 = v5;
  double v8 = v7;

  -[SBFBarSwipeBehavior _progressWithTranslation:liftoffVelocity:](self, "_progressWithTranslation:liftoffVelocity:", v6, v8, *MEMORY[0x1E4F1DAD8], *(double *)(MEMORY[0x1E4F1DAD8] + 8));
  -[SBFBarSwipeBehavior _offsetGrabberForProgress:](self, "_offsetGrabberForProgress:");
  if (BSFloatGreaterThanOrEqualToFloat()) {
    [(SBFBarSwipeBehavior *)self _fireAction];
  }
}

- (void)barSwipeInteractionEnded:(id)a3
{
  id v4 = a3;
  id v13 = [(SBFBarSwipeBehavior *)self _grabberViewContainerView];
  [v4 translationInView:v13];
  double v6 = v5;
  double v8 = v7;
  [v4 velocityInView:v13];
  double v10 = v9;
  double v12 = v11;

  -[SBFBarSwipeBehavior _progressWithTranslation:liftoffVelocity:](self, "_progressWithTranslation:liftoffVelocity:", v6, v8, v10, v12);
  if (BSFloatGreaterThanOrEqualToFloat()) {
    [(SBFBarSwipeBehavior *)self _fireAction];
  }
  [(SBFBarSwipeBehavior *)self _settleGrabber];
}

- (double)_progressWithTranslation:(CGPoint)a3 liftoffVelocity:(CGPoint)a4
{
  BSIntervalMap();
  return result;
}

- (id)_settleAffordanceAnimationBehaviorDescription
{
  settleAffordanceAnimationBehaviorDescription = self->_settleAffordanceAnimationBehaviorDescription;
  if (!settleAffordanceAnimationBehaviorDescription)
  {
    id v4 = objc_alloc_init(SBFFluidBehaviorSettings);
    [(SBFFluidBehaviorSettings *)v4 setDefaultValues];
    [(SBFFluidBehaviorSettings *)v4 setDampingRatio:0.471];
    [(SBFFluidBehaviorSettings *)v4 setResponse:0.299];
    double v5 = self->_settleAffordanceAnimationBehaviorDescription;
    self->_settleAffordanceAnimationBehaviorDescription = (UIViewSpringAnimationBehaviorDescribing *)v4;

    settleAffordanceAnimationBehaviorDescription = self->_settleAffordanceAnimationBehaviorDescription;
  }
  return settleAffordanceAnimationBehaviorDescription;
}

- (id)_grabberViewContainerView
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  if ((objc_opt_respondsToSelector() & 1) == 0
    || ([WeakRetained barSwipeBehaviorGrabberViewContainer:self],
        (id v4 = objc_claimAutoreleasedReturnValue()) == 0))
  {
    id v4 = [(UIView *)self->_grabberView superview];
  }

  return v4;
}

- (void)_settleGrabber
{
  v3 = [(SBFBarSwipeBehavior *)self _settleAffordanceAnimationBehaviorDescription];
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __37__SBFBarSwipeBehavior__settleGrabber__block_invoke;
  v4[3] = &unk_1E548CA88;
  v4[4] = self;
  [MEMORY[0x1E4F42FF0] _animateUsingSpringBehavior:v3 tracking:0 animations:v4 completion:0];
}

uint64_t __37__SBFBarSwipeBehavior__settleGrabber__block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _setGrabberAdditionalEdgeSpacing:0.0];
}

- (void)_offsetGrabberForProgress:(double)a3
{
}

- (void)_setGrabberAdditionalEdgeSpacing:(double)a3
{
  if ((BSFloatEqualToFloat() & 1) == 0)
  {
    self->_grabberViewAdditionalEdgeSpacing = a3;
    [(UIView *)self->_grabberView setNeedsLayout];
    [(UIView *)self->_grabberView layoutIfNeeded];
    id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
    if (objc_opt_respondsToSelector()) {
      [WeakRetained barSwipeBehavior:self didUpdateAdditionalEdgeSpacing:self->_grabberViewAdditionalEdgeSpacing];
    }
  }
}

- (void)_createFeedbackGenerator
{
  id v3 = objc_alloc(MEMORY[0x1E4F42C10]);
  id v4 = (void *)MEMORY[0x1E4F43268];
  double v5 = (void *)MEMORY[0x1E4F1CAD0];
  id v10 = [NSNumber numberWithInteger:self->_feedbackType];
  double v6 = [v5 setWithObject:v10];
  double v7 = [v4 privateConfigurationForTypes:v6];
  double v8 = (UINotificationFeedbackGenerator *)[v3 initWithConfiguration:v7];
  dismissalFeedbackGenerator = self->_dismissalFeedbackGenerator;
  self->_dismissalFeedbackGenerator = v8;
}

- (void)_fireAction
{
  uint64_t v7 = *MEMORY[0x1E4F143B8];
  int v3 = 138543618;
  uint64_t v4 = a1;
  __int16 v5 = 2114;
  uint64_t v6 = a2;
  _os_log_error_impl(&dword_18B52E000, log, OS_LOG_TYPE_ERROR, "%{public}@: Delegate (%{public}@) doesn't implement required method 'barSwipeBehaviorActionPerformed:'", (uint8_t *)&v3, 0x16u);
}

- (UIView)grabberView
{
  return self->_grabberView;
}

- (double)grabberViewAdditionalEdgeSpacing
{
  return self->_grabberViewAdditionalEdgeSpacing;
}

- (UIViewSpringAnimationBehaviorDescribing)settleAffordanceAnimationBehaviorDescription
{
  return self->_settleAffordanceAnimationBehaviorDescription;
}

- (SBFBarSwipeBehaviorDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  return (SBFBarSwipeBehaviorDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (int64_t)feedbackType
{
  return self->_feedbackType;
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_grabberView, 0);
  objc_storeStrong((id *)&self->_dismissalFeedbackGenerator, 0);
  objc_storeStrong((id *)&self->_settleAffordanceAnimationBehaviorDescription, 0);
}

@end