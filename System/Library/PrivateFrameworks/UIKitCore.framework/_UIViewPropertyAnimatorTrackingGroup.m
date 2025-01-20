@interface _UIViewPropertyAnimatorTrackingGroup
- (BOOL)isReversed;
- (BOOL)isRunning;
- (NSArray)trackingAnimators;
- (_UIViewPropertyAnimatorTrackingGroup)initWithAnimators:(id)a3;
- (double)fractionComplete;
- (int64_t)state;
- (void)addAnimations:(id)a3;
- (void)addCompletion:(id)a3;
- (void)continueAnimationWithTimingParameters:(id)a3 durationFactor:(double)a4;
- (void)finishAnimationAtPosition:(int64_t)a3;
- (void)pauseAnimation;
- (void)setFractionComplete:(double)a3;
- (void)setReversed:(BOOL)a3;
- (void)startAnimation;
- (void)startAnimationAfterDelay:(double)a3;
- (void)stopAnimation:(BOOL)a3;
@end

@implementation _UIViewPropertyAnimatorTrackingGroup

- (_UIViewPropertyAnimatorTrackingGroup)initWithAnimators:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)_UIViewPropertyAnimatorTrackingGroup;
  v6 = [(_UIViewPropertyAnimatorTrackingGroup *)&v9 init];
  v7 = v6;
  if (v6) {
    objc_storeStrong((id *)&v6->_trackingAnimators, a3);
  }

  return v7;
}

- (void)addAnimations:(id)a3
{
  trackingAnimators = self->_trackingAnimators;
  id v4 = a3;
  id v5 = [(NSArray *)trackingAnimators firstObject];
  [v5 addAnimations:v4];
}

- (void)continueAnimationWithTimingParameters:(id)a3 durationFactor:(double)a4
{
  id v6 = a3;
  trackingAnimators = self->_trackingAnimators;
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __93___UIViewPropertyAnimatorTrackingGroup_continueAnimationWithTimingParameters_durationFactor___block_invoke;
  v9[3] = &unk_1E52DCA80;
  id v10 = v6;
  double v11 = a4;
  id v8 = v6;
  [(NSArray *)trackingAnimators enumerateObjectsUsingBlock:v9];
}

- (void)addCompletion:(id)a3
{
  trackingAnimators = self->_trackingAnimators;
  id v4 = a3;
  id v5 = [(NSArray *)trackingAnimators firstObject];
  [v5 addCompletion:v4];
}

- (int64_t)state
{
  v2 = [(NSArray *)self->_trackingAnimators firstObject];
  int64_t v3 = [v2 state];

  return v3;
}

- (BOOL)isRunning
{
  v2 = [(NSArray *)self->_trackingAnimators firstObject];
  char v3 = [v2 isRunning];

  return v3;
}

- (BOOL)isReversed
{
  v2 = [(NSArray *)self->_trackingAnimators firstObject];
  char v3 = [v2 isReversed];

  return v3;
}

- (void)setReversed:(BOOL)a3
{
  trackingAnimators = self->_trackingAnimators;
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __52___UIViewPropertyAnimatorTrackingGroup_setReversed___block_invoke;
  v4[3] = &__block_descriptor_33_e39_v32__0__UIViewPropertyAnimator_8Q16_B24l;
  BOOL v5 = a3;
  [(NSArray *)trackingAnimators enumerateObjectsUsingBlock:v4];
}

- (double)fractionComplete
{
  v2 = [(NSArray *)self->_trackingAnimators firstObject];
  [v2 fractionComplete];
  double v4 = v3;

  return v4;
}

- (void)setFractionComplete:(double)a3
{
  trackingAnimators = self->_trackingAnimators;
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __60___UIViewPropertyAnimatorTrackingGroup_setFractionComplete___block_invoke;
  v4[3] = &__block_descriptor_40_e39_v32__0__UIViewPropertyAnimator_8Q16_B24l;
  *(double *)&void v4[4] = a3;
  [(NSArray *)trackingAnimators enumerateObjectsUsingBlock:v4];
}

- (void)startAnimation
{
}

- (void)startAnimationAfterDelay:(double)a3
{
  trackingAnimators = self->_trackingAnimators;
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __65___UIViewPropertyAnimatorTrackingGroup_startAnimationAfterDelay___block_invoke;
  v4[3] = &__block_descriptor_40_e39_v32__0__UIViewPropertyAnimator_8Q16_B24l;
  *(double *)&void v4[4] = a3;
  [(NSArray *)trackingAnimators enumerateObjectsUsingBlock:v4];
}

- (void)pauseAnimation
{
}

- (void)stopAnimation:(BOOL)a3
{
  trackingAnimators = self->_trackingAnimators;
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __54___UIViewPropertyAnimatorTrackingGroup_stopAnimation___block_invoke;
  v4[3] = &__block_descriptor_33_e39_v32__0__UIViewPropertyAnimator_8Q16_B24l;
  BOOL v5 = a3;
  [(NSArray *)trackingAnimators enumerateObjectsUsingBlock:v4];
}

- (void)finishAnimationAtPosition:(int64_t)a3
{
  trackingAnimators = self->_trackingAnimators;
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __66___UIViewPropertyAnimatorTrackingGroup_finishAnimationAtPosition___block_invoke;
  v4[3] = &__block_descriptor_40_e39_v32__0__UIViewPropertyAnimator_8Q16_B24l;
  void v4[4] = a3;
  [(NSArray *)trackingAnimators enumerateObjectsUsingBlock:v4];
}

- (NSArray)trackingAnimators
{
  return self->_trackingAnimators;
}

- (void).cxx_destruct
{
}

@end