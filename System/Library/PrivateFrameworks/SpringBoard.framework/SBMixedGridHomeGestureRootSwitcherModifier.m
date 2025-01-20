@interface SBMixedGridHomeGestureRootSwitcherModifier
- (BOOL)canTransitionWithoutGestureModifier;
- (BOOL)completesWhenChildrenComplete;
- (BOOL)wantsAsynchronousSurfaceRetentionAssertion;
- (SBMixedGridHomeGestureRootSwitcherModifier)initWithStartingEnvironmentMode:(int64_t)a3 selectedAppLayout:(id)a4 mixedGridModifier:(id)a5;
- (id)_newMultitaskingModifier;
- (id)gestureChildModifierForGestureEvent:(id)a3 activeTransitionModifier:(id)a4;
- (id)handleEvent:(id)a3;
- (id)handleGestureEvent:(id)a3;
- (id)transitionChildModifierForMainTransitionEvent:(id)a3 activeGestureModifier:(id)a4;
- (int64_t)gestureType;
@end

@implementation SBMixedGridHomeGestureRootSwitcherModifier

- (SBMixedGridHomeGestureRootSwitcherModifier)initWithStartingEnvironmentMode:(int64_t)a3 selectedAppLayout:(id)a4 mixedGridModifier:(id)a5
{
  id v10 = a4;
  id v11 = a5;
  v15.receiver = self;
  v15.super_class = (Class)SBMixedGridHomeGestureRootSwitcherModifier;
  v12 = [(SBGestureRootSwitcherModifier *)&v15 initWithStartingEnvironmentMode:a3];
  if (v12)
  {
    if (!v11)
    {
      v14 = [MEMORY[0x1E4F28B00] currentHandler];
      [v14 handleFailureInMethod:a2, v12, @"SBMixedGridHomeGestureRootSwitcherModifier.m", 39, @"Invalid parameter not satisfying: %@", @"mixedGridModifier" object file lineNumber description];
    }
    objc_storeStrong((id *)&v12->_selectedAppLayout, a4);
    objc_storeStrong((id *)&v12->_mixedGridModifier, a5);
  }

  return v12;
}

- (BOOL)completesWhenChildrenComplete
{
  return 0;
}

- (int64_t)gestureType
{
  return 1;
}

- (id)gestureChildModifierForGestureEvent:(id)a3 activeTransitionModifier:(id)a4
{
  if (a4)
  {
    self->_continuingGesture = 1;
    id v5 = a4;
    objc_opt_class();
    char isKindOfClass = objc_opt_isKindOfClass();

    self->_lastGestureWasAnArcSwipe = isKindOfClass & 1;
  }
  return 0;
}

- (id)transitionChildModifierForMainTransitionEvent:(id)a3 activeGestureModifier:(id)a4
{
  id v6 = a3;
  v7 = [v6 transitionID];
  uint64_t v8 = [v6 toEnvironmentMode];
  v9 = [v6 fromFloatingAppLayout];
  uint64_t v10 = [v6 fromFloatingConfiguration];

  id v11 = self->_selectedAppLayout;
  int64_t v12 = [(SBGestureRootSwitcherModifier *)self currentEnvironmentMode];
  if ([(SBMixedGridHomeGestureRootSwitcherModifier *)self isReduceMotionEnabled])
  {
    double v14 = *MEMORY[0x1E4F1DAD8];
    double v13 = *(double *)(MEMORY[0x1E4F1DAD8] + 8);
    double v15 = v13;
    double v16 = *MEMORY[0x1E4F1DAD8];
  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
      v24 = [MEMORY[0x1E4F28B00] currentHandler];
      [v24 handleFailureInMethod:a2, self, @"SBMixedGridHomeGestureRootSwitcherModifier.m", 88, @"If reduce motion is disabled, the gesture modifier should be an instance of SBHomeGestureSwitcherModifier" object file lineNumber description];
    }
    [(SBGestureSwitcherModifier *)self->_gestureModifier isShowingOrAnimatingCardsForFlyIn];
    [(SBGestureSwitcherModifier *)self->_gestureModifier liftOffVelocityForGestureEnd];
    double v16 = v17;
    double v13 = v18;
    [(SBGestureSwitcherModifier *)self->_gestureModifier liftOffTranslationForGestureEnd];
    double v14 = v19;
    double v15 = v20;
  }
  if (v8 == 2)
  {
    id v21 = [(SBMixedGridHomeGestureRootSwitcherModifier *)self _newMultitaskingModifier];
    v22 = -[SBHomeGestureToMixedGridSwitcherSwitcherModifier initWithTransitionID:mixedGridModifier:selectedAppLayout:startingEnvironmentMode:liftOfVelocity:liftOffTranslation:floatingAppLayout:floatingConfiguration:]([SBHomeGestureToMixedGridSwitcherSwitcherModifier alloc], "initWithTransitionID:mixedGridModifier:selectedAppLayout:startingEnvironmentMode:liftOfVelocity:liftOffTranslation:floatingAppLayout:floatingConfiguration:", v7, v21, v11, v12, v9, v10, v16, v13, v14, v15);
    [(SBHomeGestureToMixedGridSwitcherSwitcherModifier *)v22 setHidEventSenderID:[(SBGestureSwitcherModifierEvent *)self->_lastGestureEvent hidEventSenderID]];
  }
  else
  {
    v22 = 0;
  }

  return v22;
}

- (id)handleEvent:(id)a3
{
  id v4 = a3;
  v16.receiver = self;
  v16.super_class = (Class)SBMixedGridHomeGestureRootSwitcherModifier;
  id v5 = [(SBGestureRootSwitcherModifier *)&v16 handleEvent:v4];
  uint64_t v12 = 0;
  double v13 = &v12;
  uint64_t v14 = 0x2020000000;
  uint64_t v15 = 0;
  gestureModifier = self->_gestureModifier;
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __58__SBMixedGridHomeGestureRootSwitcherModifier_handleEvent___block_invoke;
  v9[3] = &unk_1E6AFA6F8;
  v9[4] = self;
  id v7 = v4;
  id v10 = v7;
  id v11 = &v12;
  [(SBChainableModifier *)self performTransactionWithTemporaryChildModifier:gestureModifier usingBlock:v9];
  [(SBChainableModifier *)self->_gestureModifier setState:v13[3]];
  if (![(SBChainableModifier *)self childModifierCount]
    && [(SBChainableModifier *)self->_gestureModifier state] == 1)
  {
    [(SBChainableModifier *)self setState:1];
  }

  _Block_object_dispose(&v12, 8);
  return v5;
}

uint64_t __58__SBMixedGridHomeGestureRootSwitcherModifier_handleEvent___block_invoke(void *a1)
{
  id v2 = (id)[*(id *)(a1[4] + 144) handleEvent:a1[5]];
  uint64_t result = [*(id *)(a1[4] + 144) state];
  *(void *)(*(void *)(a1[6] + 8) + 24) = result;
  return result;
}

- (id)handleGestureEvent:(id)a3
{
  id v5 = a3;
  objc_storeStrong((id *)&self->_lastGestureEvent, a3);
  v21.receiver = self;
  v21.super_class = (Class)SBMixedGridHomeGestureRootSwitcherModifier;
  id v6 = [(SBGestureRootSwitcherModifier *)&v21 handleGestureEvent:v5];
  if ([v5 phase] == 1)
  {
    uint64_t v7 = [v5 gestureType];
    if (v7 == [(SBMixedGridHomeGestureRootSwitcherModifier *)self gestureType])
    {
      uint64_t v8 = objc_alloc_init(SBInvalidateAdjustedAppLayoutsSwitcherEventResponse);
      uint64_t v9 = +[SBChainableModifierEventResponse responseByAppendingResponse:v6 toResponse:v8];

      id v10 = self->_selectedAppLayout;
      int64_t v11 = [(SBGestureRootSwitcherModifier *)self currentEnvironmentMode];
      uint64_t v12 = [v5 type];
      double v13 = [v5 gestureID];
      BOOL v14 = v12 == 3;
      if ([(SBMixedGridHomeGestureRootSwitcherModifier *)self isReduceMotionEnabled])
      {
        uint64_t v15 = [[SBReduceMotionHomeGestureSwitcherModifier alloc] initWithGestureID:v13 selectedAppLayout:v10 startingEnvironmentMode:v11 scrunchInitiated:v14 continuingGesture:self->_continuingGesture lastGestureWasAnArcSwipe:self->_lastGestureWasAnArcSwipe];
        [(SBReduceMotionHomeGestureSwitcherModifier *)v15 setShouldProvideBlur:[(SBMixedGridHomeGestureRootSwitcherModifier *)self isChamoisWindowingUIEnabled] ^ 1];
        [(SBReduceMotionHomeGestureSwitcherModifier *)v15 setLaysOutNeighboringCards:[(SBMixedGridHomeGestureRootSwitcherModifier *)self isChamoisWindowingUIEnabled] ^ 1];
      }
      else
      {
        id v16 = [(SBMixedGridHomeGestureRootSwitcherModifier *)self _newMultitaskingModifier];
        double v17 = [SBHomeGestureSwitcherModifier alloc];
        LOBYTE(v20) = self->_lastGestureWasAnArcSwipe;
        uint64_t v15 = [(SBHomeGestureSwitcherModifier *)v17 initWithGestureID:v13 selectedAppLayout:v10 startingEnvironmentMode:v11 multitaskingModifier:v16 scrunchInitiated:v14 continuingGesture:self->_continuingGesture lastGestureWasAnArcSwipe:v20];
      }
      [(SBChainableModifier *)v15 setDelegate:self];
      gestureModifier = self->_gestureModifier;
      self->_gestureModifier = &v15->super;

      id v6 = (void *)v9;
    }
  }

  return v6;
}

- (BOOL)wantsAsynchronousSurfaceRetentionAssertion
{
  return 1;
}

- (BOOL)canTransitionWithoutGestureModifier
{
  return 1;
}

- (id)_newMultitaskingModifier
{
  return (id)[(SBMixedGridSwitcherProviding *)self->_mixedGridModifier copy];
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_lastGestureEvent, 0);
  objc_storeStrong((id *)&self->_gestureModifier, 0);
  objc_storeStrong((id *)&self->_mixedGridModifier, 0);
  objc_storeStrong((id *)&self->_selectedAppLayout, 0);
}

@end