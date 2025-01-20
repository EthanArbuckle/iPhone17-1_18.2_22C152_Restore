@interface SBAnimationStepper
- (BOOL)adjustsDurationForLongestAnimation;
- (BOOL)isStepped;
- (NSArray)views;
- (SBAnimationStepper)init;
- (SBAnimationStepper)initWithAnimationSettings:(id)a3;
- (double)_nextCommitTime;
- (double)duration;
- (double)finishSpeed;
- (double)stepPercentage;
- (id)descriptionBuilderWithMultilinePrefix:(id)a3;
- (id)descriptionWithMultilinePrefix:(id)a3;
- (id)succinctDescription;
- (id)succinctDescriptionBuilder;
- (void)_adjustDurationForLongestAnimation;
- (void)_checkForCompletion;
- (void)_displayLinkFired:(id)a3;
- (void)_displayLinkFiredForBackwardToStart:(id)a3;
- (void)_makeSubviewTree:(id)a3 fromView:(id)a4;
- (void)_setStepPercentage:(double)a3;
- (void)_updateAnimationSteppingTarget:(double)a3;
- (void)animationDidStop:(id)a3 finished:(BOOL)a4;
- (void)dealloc;
- (void)finishSteppingBackwardToStart;
- (void)finishSteppingBackwardToStartWithCompletion:(id)a3;
- (void)finishSteppingForwardToEnd;
- (void)finishSteppingForwardToEndWithCompletion:(id)a3;
- (void)invalidate;
- (void)setAdjustsDurationForLongestAnimation:(BOOL)a3;
- (void)setFinishSpeed:(double)a3;
- (void)setStepPercentage:(double)a3;
- (void)startSteppingAnimationsInView:(id)a3;
@end

@implementation SBAnimationStepper

- (SBAnimationStepper)init
{
  return [(SBAnimationStepper *)self initWithAnimationSettings:0];
}

- (SBAnimationStepper)initWithAnimationSettings:(id)a3
{
  id v4 = a3;
  v16.receiver = self;
  v16.super_class = (Class)SBAnimationStepper;
  v5 = [(SBAnimationStepper *)&v16 init];
  if (v5)
  {
    uint64_t v6 = [v4 copy];
    animationSettings = v5->_animationSettings;
    v5->_animationSettings = (BSAnimationSettings *)v6;

    v8 = [MEMORY[0x1E4F4F898] factoryWithSettings:v4];
    v9 = [v8 effectiveSettings];
    [v9 duration];
    v5->_duration = v10;

    v11 = (NSMutableSet *)objc_alloc_init(MEMORY[0x1E4F1CA80]);
    views = v5->_views;
    v5->_views = v11;

    v5->_adjustsDurationForLongestAnimation = 1;
    v13 = (NSMutableSet *)objc_alloc_init(MEMORY[0x1E4F1CA80]);
    finishedAnimatingViews = v5->_finishedAnimatingViews;
    v5->_finishedAnimatingViews = v13;
  }
  return v5;
}

- (void)dealloc
{
  if ([(NSMutableSet *)self->_views count] && !self->_invalidated)
  {
    v5 = [MEMORY[0x1E4F28B00] currentHandler];
    [v5 handleFailureInMethod:a2 object:self file:@"SBAnimationStepper.m" lineNumber:74 description:@"stepper wasn't invalidated"];
  }
  if (self->_displayLink)
  {
    id v4 = [MEMORY[0x1E4F28B00] currentHandler];
    [v4 handleFailureInMethod:a2 object:self file:@"SBAnimationStepper.m" lineNumber:75 description:@"Trying to dealloc a SBAnimationStepper but the displayLink is still running"];
  }
  [(SBAnimationStepper *)self invalidate];
  v6.receiver = self;
  v6.super_class = (Class)SBAnimationStepper;
  [(SBAnimationStepper *)&v6 dealloc];
}

- (NSArray)views
{
  return (NSArray *)[(NSMutableSet *)self->_views allObjects];
}

- (void)startSteppingAnimationsInView:(id)a3
{
  id v5 = a3;
  if (v5)
  {
    id value = v5;
    char v6 = [(NSMutableSet *)self->_views containsObject:v5];
    id v5 = value;
    if ((v6 & 1) == 0)
    {
      [value layoutIfNeeded];
      [(NSMutableSet *)self->_views addObject:value];
      v7 = [value layer];
      [(SBAnimationStepper *)self _nextCommitTime];
      objc_msgSend(v7, "setBeginTime:");
      [v7 setSpeed:0.0];
      [v7 beginTime];
      objc_msgSend(v7, "setTimeOffset:");
      if ([(SBAnimationStepper *)self adjustsDurationForLongestAnimation]) {
        [(SBAnimationStepper *)self _adjustDurationForLongestAnimation];
      }
      v8 = [MEMORY[0x1E4F39B30] animation];
      [v8 setDuration:self->_duration];
      [v8 setRemovedOnCompletion:1];
      [v8 setDelegate:self];
      v9 = [v7 animationForKey:@"SBAnimationStepper"];

      if (v9)
      {
        v11 = [MEMORY[0x1E4F28B00] currentHandler];
        [v11 handleFailureInMethod:a2 object:self file:@"SBAnimationStepper.m" lineNumber:117 description:@"multiple steppers shouldn't be operating on the same view"];
      }
      [v7 addAnimation:v8 forKey:@"SBAnimationStepper"];
      double v10 = [v7 animationForKey:@"SBAnimationStepper"];

      objc_setAssociatedObject(v10, &SBAnimationStepperViewForAnimationKey, value, 0);
      id v5 = value;
    }
  }
}

- (void)_adjustDurationForLongestAnimation
{
  uint64_t v41 = *MEMORY[0x1E4F143B8];
  id v3 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  long long v34 = 0u;
  long long v35 = 0u;
  long long v36 = 0u;
  long long v37 = 0u;
  id v4 = self->_views;
  uint64_t v5 = [(NSMutableSet *)v4 countByEnumeratingWithState:&v34 objects:v40 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v35;
    do
    {
      for (uint64_t i = 0; i != v6; ++i)
      {
        if (*(void *)v35 != v7) {
          objc_enumerationMutation(v4);
        }
        [(SBAnimationStepper *)self _makeSubviewTree:v3 fromView:*(void *)(*((void *)&v34 + 1) + 8 * i)];
      }
      uint64_t v6 = [(NSMutableSet *)v4 countByEnumeratingWithState:&v34 objects:v40 count:16];
    }
    while (v6);
  }
  v24 = self;

  long long v32 = 0u;
  long long v33 = 0u;
  long long v30 = 0u;
  long long v31 = 0u;
  obuint64_t j = v3;
  uint64_t v9 = [obj countByEnumeratingWithState:&v30 objects:v39 count:16];
  if (v9)
  {
    uint64_t v10 = v9;
    uint64_t v11 = *(void *)v31;
    double v12 = 0.0;
    do
    {
      for (uint64_t j = 0; j != v10; ++j)
      {
        if (*(void *)v31 != v11) {
          objc_enumerationMutation(obj);
        }
        v14 = objc_msgSend(*(id *)(*((void *)&v30 + 1) + 8 * j), "layer", v24);
        long long v26 = 0u;
        long long v27 = 0u;
        long long v28 = 0u;
        long long v29 = 0u;
        v15 = [v14 animationKeys];
        uint64_t v16 = [v15 countByEnumeratingWithState:&v26 objects:v38 count:16];
        if (v16)
        {
          uint64_t v17 = v16;
          uint64_t v18 = *(void *)v27;
          do
          {
            for (uint64_t k = 0; k != v17; ++k)
            {
              if (*(void *)v27 != v18) {
                objc_enumerationMutation(v15);
              }
              v20 = [v14 animationForKey:*(void *)(*((void *)&v26 + 1) + 8 * k)];
              [v20 duration];
              if (fabs(v21) != INFINITY && v21 > v12) {
                double v12 = v21;
              }
            }
            uint64_t v17 = [v15 countByEnumeratingWithState:&v26 objects:v38 count:16];
          }
          while (v17);
        }
      }
      uint64_t v10 = [obj countByEnumeratingWithState:&v30 objects:v39 count:16];
    }
    while (v10);
  }
  else
  {
    double v12 = 0.0;
  }

  double duration = v24->_duration;
  if (v12 >= duration) {
    double duration = v12;
  }
  v24->_double duration = duration;
}

- (void)_makeSubviewTree:(id)a3 fromView:(id)a4
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  uint64_t v7 = objc_msgSend(a4, "subviews", 0);
  uint64_t v8 = [v7 countByEnumeratingWithState:&v13 objects:v17 count:16];
  if (v8)
  {
    uint64_t v9 = v8;
    uint64_t v10 = *(void *)v14;
    do
    {
      for (uint64_t i = 0; i != v9; ++i)
      {
        if (*(void *)v14 != v10) {
          objc_enumerationMutation(v7);
        }
        uint64_t v12 = *(void *)(*((void *)&v13 + 1) + 8 * i);
        [v6 addObject:v12];
        [(SBAnimationStepper *)self _makeSubviewTree:v6 fromView:v12];
      }
      uint64_t v9 = [v7 countByEnumeratingWithState:&v13 objects:v17 count:16];
    }
    while (v9);
  }
}

- (void)invalidate
{
  if (!self->_invalidated)
  {
    self->_invalidated = 1;
    views = self->_views;
    v6[0] = MEMORY[0x1E4F143A8];
    v6[1] = 3221225472;
    v6[2] = __32__SBAnimationStepper_invalidate__block_invoke;
    v6[3] = &unk_1E6B02768;
    v6[4] = self;
    v6[5] = a2;
    [(NSMutableSet *)views enumerateObjectsUsingBlock:v6];
    [(NSMutableSet *)self->_views removeAllObjects];
    [(NSMutableSet *)self->_finishedAnimatingViews removeAllObjects];
    [(CADisplayLink *)self->_displayLink invalidate];
    displayLinuint64_t k = self->_displayLink;
    self->_displayLinuint64_t k = 0;

    id completion = self->_completion;
    self->_id completion = 0;
  }
}

void __32__SBAnimationStepper_invalidate__block_invoke(uint64_t a1, void *a2)
{
  id v9 = [a2 layer];
  LODWORD(v3) = 1.0;
  [v9 setSpeed:v3];
  [v9 setBeginTime:0.0];
  [v9 setTimeOffset:0.0];
  id v4 = [v9 animationForKey:@"SBAnimationStepper"];
  uint64_t v5 = v4;
  if (v4)
  {
    id v6 = [v4 delegate];
    uint64_t v7 = *(void **)(a1 + 32);

    if (v6 != v7)
    {
      uint64_t v8 = [MEMORY[0x1E4F28B00] currentHandler];
      [v8 handleFailureInMethod:*(void *)(a1 + 40) object:*(void *)(a1 + 32) file:@"SBAnimationStepper.m" lineNumber:171 description:@"this animation better be our own"];
    }
    [v9 removeAnimationForKey:@"SBAnimationStepper"];
  }
}

- (void)finishSteppingForwardToEndWithCompletion:(id)a3
{
  id v5 = a3;
  if (self->_invalidated)
  {
    uint64_t v11 = [MEMORY[0x1E4F28B00] currentHandler];
    [v11 handleFailureInMethod:a2 object:self file:@"SBAnimationStepper.m" lineNumber:185 description:@"object already invalidated"];
  }
  if (self->_completion)
  {
    uint64_t v12 = [MEMORY[0x1E4F28B00] currentHandler];
    [v12 handleFailureInMethod:a2 object:self file:@"SBAnimationStepper.m" lineNumber:186 description:@"can't complete multiple times"];
  }
  self->_finishingForward = 1;
  id v6 = (void *)[v5 copy];
  id completion = self->_completion;
  self->_id completion = v6;

  [(CADisplayLink *)self->_displayLink invalidate];
  displayLinuint64_t k = self->_displayLink;
  self->_displayLinuint64_t k = 0;

  [(SBAnimationStepper *)self _nextCommitTime];
  views = self->_views;
  v13[0] = MEMORY[0x1E4F143A8];
  v13[1] = 3221225472;
  v13[2] = __63__SBAnimationStepper_finishSteppingForwardToEndWithCompletion___block_invoke;
  v13[3] = &__block_descriptor_40_e20_v24__0__UIView_8_B16l;
  v13[4] = v10;
  [(NSMutableSet *)views enumerateObjectsUsingBlock:v13];
  [(SBAnimationStepper *)self _checkForCompletion];
}

void __63__SBAnimationStepper_finishSteppingForwardToEndWithCompletion___block_invoke(uint64_t a1, void *a2)
{
  id v4 = [a2 layer];
  [v4 setBeginTime:*(double *)(a1 + 32)];
  LODWORD(v3) = 1.0;
  [v4 setSpeed:v3];
}

- (void)finishSteppingBackwardToStartWithCompletion:(id)a3
{
  id v20 = a3;
  if (self->_invalidated)
  {
    long long v16 = [MEMORY[0x1E4F28B00] currentHandler];
    [v16 handleFailureInMethod:a2 object:self file:@"SBAnimationStepper.m" lineNumber:205 description:@"object already invalidated"];
  }
  if (self->_completion)
  {
    uint64_t v17 = [MEMORY[0x1E4F28B00] currentHandler];
    [v17 handleFailureInMethod:a2 object:self file:@"SBAnimationStepper.m" lineNumber:206 description:@"can't complete multiple times"];
  }
  id v5 = [MEMORY[0x1E4F1CAC0] currentRunLoop];
  id v6 = [MEMORY[0x1E4F1CAC0] mainRunLoop];

  if (v5 != v6)
  {
    uint64_t v18 = [MEMORY[0x1E4F28B00] currentHandler];
    v19 = [MEMORY[0x1E4F1CAC0] currentRunLoop];
    [v18 handleFailureInMethod:a2, self, @"SBAnimationStepper.m", 207, @"Trying to call this but the mainRunLoop != currentRunLoop: %@", v19 object file lineNumber description];
  }
  self->_finishingBackward = 1;
  uint64_t v7 = (void *)[v20 copy];
  id completion = self->_completion;
  self->_id completion = v7;

  double v9 = CACurrentMediaTime();
  double percentage = self->_percentage;
  double v11 = self->_duration * percentage;
  self->_finishBackwardTimestamp = v9;
  self->_finishBackwardDuration = v11;
  self->_finishBackwardPercentage = percentage;
  [(CADisplayLink *)self->_displayLink invalidate];
  uint64_t v12 = [MEMORY[0x1E4F39B68] displayLinkWithTarget:self selector:sel__displayLinkFiredForBackwardToStart_];
  displayLinuint64_t k = self->_displayLink;
  self->_displayLinuint64_t k = v12;

  long long v14 = self->_displayLink;
  long long v15 = [MEMORY[0x1E4F1CAC0] currentRunLoop];
  [(CADisplayLink *)v14 addToRunLoop:v15 forMode:*MEMORY[0x1E4F1C4B0]];

  [(SBAnimationStepper *)self _displayLinkFiredForBackwardToStart:0];
}

- (void)_checkForCompletion
{
  uint64_t v3 = [(NSMutableSet *)self->_finishedAnimatingViews count];
  if (v3 == [(NSMutableSet *)self->_views count])
  {
    self->_completed = 1;
    [(CADisplayLink *)self->_displayLink invalidate];
    displayLinuint64_t k = self->_displayLink;
    self->_displayLinuint64_t k = 0;

    id completion = (void (**)(id, uint64_t))self->_completion;
    if (completion)
    {
      completion[2](completion, 1);
      id v6 = self->_completion;
      self->_id completion = 0;
    }
  }
}

- (void)_updateAnimationSteppingTarget:(double)a3
{
  self->_animatedSteppingTargetPercent = fmin(fmax(a3, 0.0), 1.0);
}

- (void)_setStepPercentage:(double)a3
{
  self->_double percentage = fmin(fmax(a3, 0.0), 1.0);
  views = self->_views;
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __41__SBAnimationStepper__setStepPercentage___block_invoke;
  v4[3] = &unk_1E6B027B0;
  v4[4] = self;
  [(NSMutableSet *)views enumerateObjectsUsingBlock:v4];
}

void __41__SBAnimationStepper__setStepPercentage___block_invoke(uint64_t a1, void *a2)
{
  id v4 = [a2 layer];
  [v4 setSpeed:0.0];
  [v4 beginTime];
  [v4 setTimeOffset:v3 + *(double *)(*(void *)(a1 + 32) + 120) * *(double *)(*(void *)(a1 + 32) + 48)];
}

- (void)_displayLinkFired:(id)a3
{
  id v4 = a3;
  if (!*(_WORD *)&self->_invalidated)
  {
    id v15 = v4;
    CFTimeInterval v5 = CACurrentMediaTime();
    double animatedSteppingTargetPercent = self->_animatedSteppingTargetPercent;
    double percentage = self->_percentage;
    double duration = self->_duration;
    double v9 = duration * vabdd_f64(animatedSteppingTargetPercent, percentage);
    double v10 = percentage
        + (animatedSteppingTargetPercent - percentage)
        * fmin(fmax((v5 - self->_animatedSteppingTimestamp)/ (duration* vabdd_f64(animatedSteppingTargetPercent, self->_animatedSteppingStartPercent)), 0.0), 1.0);
    if (v15)
    {
      [v15 duration];
      double v12 = v11;
    }
    else
    {
      double v12 = 0.017;
    }
    int v13 = BSFloatEqualToFloat();
    if (v9 <= v12 || v13)
    {
      self->_animatingToStepPercent = 0;
      [(CADisplayLink *)self->_displayLink invalidate];
      displayLinuint64_t k = self->_displayLink;
      self->_displayLinuint64_t k = 0;

      double v10 = self->_animatedSteppingTargetPercent;
    }
    [(SBAnimationStepper *)self _setStepPercentage:v10];
    id v4 = v15;
  }
}

- (void)_displayLinkFiredForBackwardToStart:(id)a3
{
  id v4 = a3;
  if (!*(_WORD *)&self->_invalidated)
  {
    [(SBAnimationStepper *)self _setStepPercentage:self->_finishBackwardPercentage* (1.0 - (CACurrentMediaTime() - self->_finishBackwardTimestamp) / self->_finishBackwardDuration)];
    views = self->_views;
    v6[0] = MEMORY[0x1E4F143A8];
    v6[1] = 3221225472;
    v6[2] = __58__SBAnimationStepper__displayLinkFiredForBackwardToStart___block_invoke;
    v6[3] = &unk_1E6B027B0;
    v6[4] = self;
    [(NSMutableSet *)views enumerateObjectsUsingBlock:v6];
    [(SBAnimationStepper *)self _checkForCompletion];
  }
}

void __58__SBAnimationStepper__displayLinkFiredForBackwardToStart___block_invoke(uint64_t a1, void *a2)
{
  id v7 = a2;
  double v3 = [v7 layer];
  [v3 timeOffset];
  double v5 = v4;
  [v3 beginTime];
  if (v5 <= v6 + 0.00000011920929)
  {
    [v3 beginTime];
    objc_msgSend(v3, "setTimeOffset:");
    objc_msgSend(v7, "sb_removeAnimationsIncludingSubviews:predicate:", 1, &__block_literal_global_169);
    [*(id *)(*(void *)(a1 + 32) + 24) addObject:v7];
  }
}

uint64_t __58__SBAnimationStepper__displayLinkFiredForBackwardToStart___block_invoke_2(uint64_t a1, void *a2)
{
  return [a2 isRemovedOnCompletion];
}

- (double)_nextCommitTime
{
  v2 = [MEMORY[0x1E4F39CF8] valueForKey:*MEMORY[0x1E4F3A5A0]];
  [v2 doubleValue];
  if (BSFloatIsZero()) {
    double v3 = CACurrentMediaTime();
  }
  else {
    [v2 doubleValue];
  }
  double v4 = v3;

  return v4;
}

- (void)animationDidStop:(id)a3 finished:(BOOL)a4
{
  id v5 = a3;
  if (!*(_WORD *)&self->_invalidated)
  {
    id v7 = v5;
    double v6 = objc_getAssociatedObject(v5, &SBAnimationStepperViewForAnimationKey);
    if (v6)
    {
      [(NSMutableSet *)self->_finishedAnimatingViews addObject:v6];
      [(SBAnimationStepper *)self _checkForCompletion];
    }

    id v5 = v7;
  }
}

- (BOOL)isStepped
{
  return 1;
}

- (void)setStepPercentage:(double)a3
{
  if (!self->_invalidated && !self->_completed)
  {
    if (self->_animatingToStepPercent) {
      [(SBAnimationStepper *)self _updateAnimationSteppingTarget:a3];
    }
    else {
      [(SBAnimationStepper *)self _setStepPercentage:a3];
    }
  }
}

- (double)stepPercentage
{
  return self->_percentage;
}

- (void)finishSteppingForwardToEnd
{
}

- (void)finishSteppingBackwardToStart
{
}

- (id)succinctDescription
{
  v2 = [(SBAnimationStepper *)self succinctDescriptionBuilder];
  double v3 = [v2 build];

  return v3;
}

- (id)succinctDescriptionBuilder
{
  return (id)[MEMORY[0x1E4F4F718] builderWithObject:self];
}

- (id)descriptionWithMultilinePrefix:(id)a3
{
  double v3 = [(SBAnimationStepper *)self descriptionBuilderWithMultilinePrefix:a3];
  double v4 = [v3 build];

  return v4;
}

- (id)descriptionBuilderWithMultilinePrefix:(id)a3
{
  id v4 = a3;
  id v5 = [(SBAnimationStepper *)self succinctDescriptionBuilder];
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __60__SBAnimationStepper_descriptionBuilderWithMultilinePrefix___block_invoke;
  v9[3] = &unk_1E6AF5290;
  id v6 = v5;
  id v10 = v6;
  double v11 = self;
  [v6 appendBodySectionWithName:0 multilinePrefix:v4 block:v9];

  id v7 = v6;
  return v7;
}

void __60__SBAnimationStepper_descriptionBuilderWithMultilinePrefix___block_invoke(uint64_t a1)
{
  id v2 = (id)[*(id *)(a1 + 32) appendObject:*(void *)(*(void *)(a1 + 40) + 8) withName:@"settings"];
  double v3 = *(void **)(a1 + 32);
  id v4 = [*(id *)(a1 + 40) views];
  [v3 appendArraySection:v4 withName:@"views" skipIfEmpty:1 objectTransformer:&__block_literal_global_50_1];
}

uint64_t __60__SBAnimationStepper_descriptionBuilderWithMultilinePrefix___block_invoke_2(uint64_t a1, uint64_t a2)
{
  return [MEMORY[0x1E4F4F718] descriptionForObject:a2];
}

- (double)duration
{
  return self->_duration;
}

- (BOOL)adjustsDurationForLongestAnimation
{
  return self->_adjustsDurationForLongestAnimation;
}

- (void)setAdjustsDurationForLongestAnimation:(BOOL)a3
{
  self->_adjustsDurationForLongestAnimation = a3;
}

- (double)finishSpeed
{
  return self->_finishSpeed;
}

- (void)setFinishSpeed:(double)a3
{
  self->_finishSpeed = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_completion, 0);
  objc_storeStrong((id *)&self->_displayLink, 0);
  objc_storeStrong((id *)&self->_finishedAnimatingViews, 0);
  objc_storeStrong((id *)&self->_views, 0);
  objc_storeStrong((id *)&self->_animationSettings, 0);
}

@end