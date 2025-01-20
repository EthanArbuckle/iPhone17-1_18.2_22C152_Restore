@interface UIFocusAnimationCoordinator
+ (id)_focusAnimationCoordinatorForAnimationType:(int64_t)a3 withConfiguration:(id)a4 inContext:(id)a5;
+ (id)_focusingAnimationCoordinatorWithConfiguration:(id)a3 inContext:(id)a4;
+ (id)_unfocusingAnimationCoordinatorWithConfiguration:(id)a3 inContext:(id)a4;
- (BOOL)_isLocked;
- (NSMutableArray)focusingAnimations;
- (NSMutableArray)focusingCompletions;
- (NSMutableArray)legacyFocusingAnimations;
- (NSMutableArray)legacyUnfocusingAnimations;
- (NSMutableArray)unfocusingAnimations;
- (NSMutableArray)unfocusingCompletions;
- (UIFocusAnimationCoordinator)init;
- (UIFocusUpdateContext)_focusUpdateContext;
- (_UIFocusAnimationConfiguration)_activeConfiguration;
- (_UIFocusAnimationConfiguration)focusingConfiguration;
- (_UIFocusAnimationConfiguration)unfocusingConfiguration;
- (double)_activeAnimationDuration;
- (double)_animationDelay;
- (double)_focusingAnimationDuration;
- (double)_unfocusingAnimationDuration;
- (double)_unfocusingRepositionAnimationDuration;
- (id)_configurationForFocusAnimation:(int64_t)a3;
- (id)_initWithFocusUpdateContext:(id)a3;
- (int64_t)activeFocusAnimation;
- (unint64_t)_animationOptions;
- (void)_animate;
- (void)_animateFocusAnimation:(int64_t)a3;
- (void)_cancelFocusAnimation:(int64_t)a3;
- (void)_configureWithFocusUpdateContext:(id)a3;
- (void)_consumeBlocks:(id)a3;
- (void)_consumeBlocks:(id)a3 withAnimationContext:(id)a4;
- (void)_prepareForFocusAnimation:(int64_t)a3;
- (void)_setConfiguration:(id)a3 forFocusAnimation:(int64_t)a4;
- (void)addCoordinatedAnimations:(void *)animations completion:(void *)completion;
- (void)addCoordinatedAnimationsForAnimation:(int64_t)a3 animations:(id)a4 completion:(id)a5;
- (void)addCoordinatedFocusingAnimations:(void *)animations completion:(void *)completion;
- (void)addCoordinatedUnfocusingAnimations:(void *)animations completion:(void *)completion;
- (void)setFocusingConfiguration:(id)a3;
- (void)setUnfocusingConfiguration:(id)a3;
@end

@implementation UIFocusAnimationCoordinator

+ (id)_focusingAnimationCoordinatorWithConfiguration:(id)a3 inContext:(id)a4
{
  return (id)[a1 _focusAnimationCoordinatorForAnimationType:0 withConfiguration:a3 inContext:a4];
}

+ (id)_unfocusingAnimationCoordinatorWithConfiguration:(id)a3 inContext:(id)a4
{
  return (id)[a1 _focusAnimationCoordinatorForAnimationType:1 withConfiguration:a3 inContext:a4];
}

+ (id)_focusAnimationCoordinatorForAnimationType:(int64_t)a3 withConfiguration:(id)a4 inContext:(id)a5
{
  id v9 = a4;
  id v10 = a5;
  if (!v9)
  {
    v13 = [MEMORY[0x1E4F28B00] currentHandler];
    [v13 handleFailureInMethod:a2, a1, @"UIFocusAnimationCoordinator.m", 85, @"Invalid parameter not satisfying: %@", @"configuration" object file lineNumber description];
  }
  v11 = (void *)[objc_alloc((Class)a1) _initWithFocusUpdateContext:v10];
  [v11 _setConfiguration:v9 forFocusAnimation:a3];
  [v11 _prepareForFocusAnimation:a3];

  return v11;
}

- (UIFocusAnimationCoordinator)init
{
  return (UIFocusAnimationCoordinator *)[(UIFocusAnimationCoordinator *)self _initWithFocusUpdateContext:0];
}

- (id)_initWithFocusUpdateContext:(id)a3
{
  id v5 = a3;
  v21.receiver = self;
  v21.super_class = (Class)UIFocusAnimationCoordinator;
  v6 = [(UIFocusAnimationCoordinator *)&v21 init];
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_focusUpdateContext, a3);
    v8 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E4F1CA48]);
    focusingAnimations = v7->_focusingAnimations;
    v7->_focusingAnimations = v8;

    id v10 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E4F1CA48]);
    legacyFocusingAnimations = v7->_legacyFocusingAnimations;
    v7->_legacyFocusingAnimations = v10;

    v12 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E4F1CA48]);
    unfocusingAnimations = v7->_unfocusingAnimations;
    v7->_unfocusingAnimations = v12;

    v14 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E4F1CA48]);
    legacyUnfocusingAnimations = v7->_legacyUnfocusingAnimations;
    v7->_legacyUnfocusingAnimations = v14;

    v16 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E4F1CA48]);
    focusingCompletions = v7->_focusingCompletions;
    v7->_focusingCompletions = v16;

    v18 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E4F1CA48]);
    unfocusingCompletions = v7->_unfocusingCompletions;
    v7->_unfocusingCompletions = v18;

    if (v5) {
      [(UIFocusAnimationCoordinator *)v7 _configureWithFocusUpdateContext:v5];
    }
  }

  return v7;
}

- (void)_configureWithFocusUpdateContext:(id)a3
{
  id v5 = a3;
  id v28 = v5;
  if (!v5)
  {
    v27 = [MEMORY[0x1E4F28B00] currentHandler];
    [v27 handleFailureInMethod:a2, self, @"UIFocusAnimationCoordinator.m", 127, @"Invalid parameter not satisfying: %@", @"context" object file lineNumber description];

    id v5 = 0;
  }
  v6 = [v5 previouslyFocusedView];
  v7 = [v6 _preferredConfigurationForFocusAnimation:1 inContext:v28];

  if (v7) {
    [(UIFocusAnimationCoordinator *)self _setConfiguration:v7 forFocusAnimation:1];
  }
  v8 = [v28 nextFocusedView];
  id v9 = [v8 _preferredConfigurationForFocusAnimation:0 inContext:v28];

  if (v9)
  {
    [v28 _destinationViewDistanceOffscreen];
    if (v10 > 0.0)
    {
      v11 = [v28 _request];
      v12 = [v11 focusSystem];
      v13 = [v12 behavior];

      if (v13)
      {
        v14 = (void *)[v9 copy];

        if (_UIInternalPreferenceUsesDefault_1((int *)&unk_1EB2571E0, @"AnimationDelayTimeLimit"))double v15 = 0.75; {
        else
        }
          double v15 = *(double *)&qword_1EB2571E8;
        if (_UIInternalPreferenceUsesDefault_1((int *)&_MergedGlobals_908, @"AnimationDelayTimeFactor"))double v16 = 0.0005; {
        else
        }
          double v16 = *(double *)&qword_1EB2571C8;
        [v28 _destinationViewDistanceOffscreen];
        double v18 = v16 * v17;
        int v19 = _UIInternalPreferenceUsesDefault_1((int *)&unk_1EB2571D0, @"AnimationDelayTimeConstant");
        double v20 = *(double *)&qword_1EB2571D8;
        if (v19) {
          double v20 = 0.1;
        }
        double v21 = fmax(v18 + v20, 0.0);
        if (v15 <= v21) {
          double v21 = v15;
        }
        [v14 setFocusingDelay:v21];
        if (_UIInternalPreferenceUsesDefault_1((int *)&unk_1EB257200, @"AnimationExtraTimeLimit"))double v22 = 0.1; {
        else
        }
          double v22 = *(double *)&qword_1EB257208;
        if (_UIInternalPreferenceUsesDefault_1((int *)&unk_1EB2571F0, @"AnimationExtraTimeFactor"))double v23 = 0.0015; {
        else
        }
          double v23 = *(double *)&qword_1EB2571F8;
        [v28 _destinationViewDistanceOffscreen];
        double v25 = fmax(v23 * v24, 0.0);
        if (v22 > v25) {
          double v22 = v25;
        }
        [v14 focusingBaseDuration];
        [v14 setFocusingBaseDuration:v26 + v22];
        [v14 setFocusingDurationScaleFactorLowerBound:1.0];
        [v14 setFocusingDurationScaleFactorUpperBound:1.0];
        id v9 = v14;
      }
    }
    [(UIFocusAnimationCoordinator *)self _setConfiguration:v9 forFocusAnimation:0];
  }
}

- (unint64_t)_animationOptions
{
  v2 = [(UIFocusAnimationCoordinator *)self _activeConfiguration];
  unint64_t v3 = [v2 animationOptions];

  return v3;
}

- (double)_animationDelay
{
  if ([(UIFocusAnimationCoordinator *)self activeFocusAnimation]) {
    return 0.0;
  }
  v4 = [(UIFocusAnimationCoordinator *)self _activeConfiguration];
  [v4 focusingDelay];
  double v6 = v5;

  return v6;
}

- (double)_activeAnimationDuration
{
  if ([(UIFocusAnimationCoordinator *)self activeFocusAnimation])
  {
    if ([(UIFocusAnimationCoordinator *)self activeFocusAnimation] == 1)
    {
      [(UIFocusAnimationCoordinator *)self _unfocusingAnimationDuration];
    }
    else
    {
      return 0.0;
    }
  }
  else
  {
    [(UIFocusAnimationCoordinator *)self _focusingAnimationDuration];
  }
  return result;
}

- (double)_focusingAnimationDuration
{
  unint64_t v3 = [(UIFocusAnimationCoordinator *)self _activeConfiguration];
  [v3 focusingBaseDuration];
  double v5 = v4;
  double v6 = [(UIFocusAnimationCoordinator *)self _activeConfiguration];
  v7 = [(UIFocusAnimationCoordinator *)self _focusUpdateContext];
  [v6 _focusingVelocityBasedDurationScaleFactorForAnimationInContext:v7];
  double v9 = v5 * v8;

  return v9;
}

- (double)_unfocusingAnimationDuration
{
  unint64_t v3 = [(UIFocusAnimationCoordinator *)self _activeConfiguration];
  [v3 unfocusingBaseDuration];
  double v5 = v4;
  double v6 = [(UIFocusAnimationCoordinator *)self _activeConfiguration];
  v7 = [(UIFocusAnimationCoordinator *)self _focusUpdateContext];
  [v6 _unfocusingVelocityBasedDurationScaleFactorForAnimationInContext:v7];
  double v9 = v5 * v8;

  return v9;
}

- (double)_unfocusingRepositionAnimationDuration
{
  unint64_t v3 = [(UIFocusAnimationCoordinator *)self _activeConfiguration];
  [v3 unfocusingRepositionBaseDuration];
  double v5 = v4;
  double v6 = [(UIFocusAnimationCoordinator *)self _activeConfiguration];
  v7 = [(UIFocusAnimationCoordinator *)self _focusUpdateContext];
  [v6 _unfocusingRepositionVelocityBasedDurationScaleFactorForAnimationInContext:v7];
  double v9 = v5 * v8;

  return v9;
}

- (void)_setConfiguration:(id)a3 forFocusAnimation:(int64_t)a4
{
  id v6 = a3;
  if (v6)
  {
    id v8 = v6;
    BOOL v7 = [(UIFocusAnimationCoordinator *)self _isLocked];
    id v6 = v8;
    if (!v7)
    {
      if (a4) {
        [(UIFocusAnimationCoordinator *)self setUnfocusingConfiguration:v8];
      }
      else {
        [(UIFocusAnimationCoordinator *)self setFocusingConfiguration:v8];
      }
      id v6 = v8;
    }
  }
}

- (id)_configurationForFocusAnimation:(int64_t)a3
{
  if (a3 || !self->_focusingConfiguration)
  {
    unfocusingConfiguration = self->_unfocusingConfiguration;
    if (!unfocusingConfiguration)
    {
      double v4 = +[_UIFocusAnimationConfiguration configurationWithStyle:0];
      goto LABEL_7;
    }
  }
  else
  {
    unfocusingConfiguration = self->_focusingConfiguration;
  }
  double v4 = (void *)[(_UIFocusAnimationConfiguration *)unfocusingConfiguration copy];
LABEL_7:
  return v4;
}

- (_UIFocusAnimationConfiguration)_activeConfiguration
{
  int64_t v3 = [(UIFocusAnimationCoordinator *)self activeFocusAnimation];
  return (_UIFocusAnimationConfiguration *)[(UIFocusAnimationCoordinator *)self _configurationForFocusAnimation:v3];
}

- (void)_prepareForFocusAnimation:(int64_t)a3
{
  self->_activeFocusAnimation = a3;
  self->_locked = 1;
}

- (void)_consumeBlocks:(id)a3
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  long long v8 = 0u;
  long long v9 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  uint64_t v4 = [v3 countByEnumeratingWithState:&v8 objects:v12 count:16];
  if (v4)
  {
    uint64_t v5 = v4;
    uint64_t v6 = *(void *)v9;
    do
    {
      uint64_t v7 = 0;
      do
      {
        if (*(void *)v9 != v6) {
          objc_enumerationMutation(v3);
        }
        (*(void (**)(void))(*(void *)(*((void *)&v8 + 1) + 8 * v7++) + 16))();
      }
      while (v5 != v7);
      uint64_t v5 = [v3 countByEnumeratingWithState:&v8 objects:v12 count:16];
    }
    while (v5);
  }
  [v3 removeAllObjects];
}

- (void)_consumeBlocks:(id)a3 withAnimationContext:(id)a4
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  id v6 = a4;
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  uint64_t v7 = [v5 countByEnumeratingWithState:&v11 objects:v15 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v9 = *(void *)v12;
    do
    {
      uint64_t v10 = 0;
      do
      {
        if (*(void *)v12 != v9) {
          objc_enumerationMutation(v5);
        }
        (*(void (**)(void))(*(void *)(*((void *)&v11 + 1) + 8 * v10++) + 16))();
      }
      while (v8 != v10);
      uint64_t v8 = [v5 countByEnumeratingWithState:&v11 objects:v15 count:16];
    }
    while (v8);
  }
  [v5 removeAllObjects];
}

- (void)addCoordinatedAnimations:(void *)animations completion:(void *)completion
{
  id v6 = completion;
  id v7 = animations;
  [(UIFocusAnimationCoordinator *)self addCoordinatedAnimationsForAnimation:[(UIFocusAnimationCoordinator *)self activeFocusAnimation] animations:v7 completion:v6];
}

- (void)addCoordinatedAnimationsForAnimation:(int64_t)a3 animations:(id)a4 completion:(id)a5
{
  id aBlock = a4;
  id v8 = a5;
  if (aBlock)
  {
    uint64_t v9 = 56;
    if (!a3) {
      uint64_t v9 = 40;
    }
    id v10 = *(id *)((char *)&self->super.isa + v9);
    long long v11 = _Block_copy(aBlock);
    [v10 addObject:v11];
  }
  if (v8)
  {
    uint64_t v12 = 72;
    if (!a3) {
      uint64_t v12 = 64;
    }
    id v13 = *(id *)((char *)&self->super.isa + v12);
    long long v14 = _Block_copy(v8);
    [v13 addObject:v14];
  }
}

- (void)addCoordinatedFocusingAnimations:(void *)animations completion:(void *)completion
{
  id aBlock = animations;
  id v6 = completion;
  if (aBlock)
  {
    focusingAnimations = self->_focusingAnimations;
    id v8 = _Block_copy(aBlock);
    [(NSMutableArray *)focusingAnimations addObject:v8];
  }
  if (v6)
  {
    focusingCompletions = self->_focusingCompletions;
    id v10 = _Block_copy(v6);
    [(NSMutableArray *)focusingCompletions addObject:v10];
  }
}

- (void)addCoordinatedUnfocusingAnimations:(void *)animations completion:(void *)completion
{
  id aBlock = animations;
  id v6 = completion;
  if (aBlock)
  {
    unfocusingAnimations = self->_unfocusingAnimations;
    id v8 = _Block_copy(aBlock);
    [(NSMutableArray *)unfocusingAnimations addObject:v8];
  }
  if (v6)
  {
    unfocusingCompletions = self->_unfocusingCompletions;
    id v10 = _Block_copy(v6);
    [(NSMutableArray *)unfocusingCompletions addObject:v10];
  }
}

- (void)_animate
{
  int64_t v3 = [(UIFocusAnimationCoordinator *)self activeFocusAnimation];
  [(UIFocusAnimationCoordinator *)self _animateFocusAnimation:v3];
}

- (void)_animateFocusAnimation:(int64_t)a3
{
  id v5 = -[UIFocusAnimationCoordinator _configurationForFocusAnimation:](self, "_configurationForFocusAnimation:");
  if (a3)
  {
    [(UIFocusAnimationCoordinator *)self _unfocusingAnimationDuration];
    double v7 = v6;
    double v8 = 0.0;
    uint64_t v9 = 72;
    uint64_t v10 = 48;
    uint64_t v11 = 56;
  }
  else
  {
    [(UIFocusAnimationCoordinator *)self _focusingAnimationDuration];
    double v7 = v12;
    [v5 focusingDelay];
    double v8 = v13;
    uint64_t v9 = 64;
    uint64_t v10 = 32;
    uint64_t v11 = 40;
  }
  id v14 = *(id *)((char *)&self->super.isa + v11);
  id v15 = *(id *)((char *)&self->super.isa + v10);
  id v16 = *(id *)((char *)&self->super.isa + v9);
  double v17 = [[_UIFocusAnimationContext alloc] initWithDuration:v7];
  if (fabs(v7) < 2.22044605e-16 || _AXSReduceMotionEnabled())
  {
    [(UIFocusAnimationCoordinator *)self _consumeBlocks:v14];
    [(UIFocusAnimationCoordinator *)self _consumeBlocks:v15 withAnimationContext:v17];
    [(UIFocusAnimationCoordinator *)self _consumeBlocks:v16];
  }
  else
  {
    uint64_t v18 = [v5 animationOptions];
    if (fabs(v8) >= 2.22044605e-16) {
      uint64_t v19 = v18 | 0x800;
    }
    else {
      uint64_t v19 = v18;
    }
    v22[0] = MEMORY[0x1E4F143A8];
    v22[1] = 3221225472;
    v22[2] = __54__UIFocusAnimationCoordinator__animateFocusAnimation___block_invoke;
    v22[3] = &unk_1E52DD450;
    v22[4] = self;
    id v23 = v15;
    double v24 = v17;
    id v25 = v14;
    v20[0] = MEMORY[0x1E4F143A8];
    v20[1] = 3221225472;
    v20[2] = __54__UIFocusAnimationCoordinator__animateFocusAnimation___block_invoke_2;
    v20[3] = &unk_1E52DA660;
    v20[4] = self;
    id v21 = v16;
    +[UIView animateWithDuration:v19 delay:v22 options:v20 animations:v7 completion:0.0];
  }
}

uint64_t __54__UIFocusAnimationCoordinator__animateFocusAnimation___block_invoke(uint64_t a1)
{
  [*(id *)(a1 + 32) _consumeBlocks:*(void *)(a1 + 40) withAnimationContext:*(void *)(a1 + 48)];
  v2 = *(void **)(a1 + 32);
  uint64_t v3 = *(void *)(a1 + 56);
  return [v2 _consumeBlocks:v3];
}

uint64_t __54__UIFocusAnimationCoordinator__animateFocusAnimation___block_invoke_2(uint64_t a1)
{
  return [*(id *)(a1 + 32) _consumeBlocks:*(void *)(a1 + 40)];
}

- (void)_cancelFocusAnimation:(int64_t)a3
{
  uint64_t v3 = 72;
  if (!a3) {
    uint64_t v3 = 64;
  }
  [(UIFocusAnimationCoordinator *)self _consumeBlocks:*(Class *)((char *)&self->super.isa + v3)];
}

- (_UIFocusAnimationConfiguration)focusingConfiguration
{
  return self->_focusingConfiguration;
}

- (void)setFocusingConfiguration:(id)a3
{
}

- (_UIFocusAnimationConfiguration)unfocusingConfiguration
{
  return self->_unfocusingConfiguration;
}

- (void)setUnfocusingConfiguration:(id)a3
{
}

- (NSMutableArray)focusingAnimations
{
  return self->_focusingAnimations;
}

- (NSMutableArray)legacyFocusingAnimations
{
  return self->_legacyFocusingAnimations;
}

- (NSMutableArray)unfocusingAnimations
{
  return self->_unfocusingAnimations;
}

- (NSMutableArray)legacyUnfocusingAnimations
{
  return self->_legacyUnfocusingAnimations;
}

- (NSMutableArray)focusingCompletions
{
  return self->_focusingCompletions;
}

- (NSMutableArray)unfocusingCompletions
{
  return self->_unfocusingCompletions;
}

- (UIFocusUpdateContext)_focusUpdateContext
{
  return self->_focusUpdateContext;
}

- (BOOL)_isLocked
{
  return self->_locked;
}

- (int64_t)activeFocusAnimation
{
  return self->_activeFocusAnimation;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_focusUpdateContext, 0);
  objc_storeStrong((id *)&self->_unfocusingCompletions, 0);
  objc_storeStrong((id *)&self->_focusingCompletions, 0);
  objc_storeStrong((id *)&self->_legacyUnfocusingAnimations, 0);
  objc_storeStrong((id *)&self->_unfocusingAnimations, 0);
  objc_storeStrong((id *)&self->_legacyFocusingAnimations, 0);
  objc_storeStrong((id *)&self->_focusingAnimations, 0);
  objc_storeStrong((id *)&self->_unfocusingConfiguration, 0);
  objc_storeStrong((id *)&self->_focusingConfiguration, 0);
}

@end