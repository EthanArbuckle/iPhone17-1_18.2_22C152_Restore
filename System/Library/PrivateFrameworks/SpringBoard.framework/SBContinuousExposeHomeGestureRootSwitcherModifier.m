@interface SBContinuousExposeHomeGestureRootSwitcherModifier
- (BOOL)wantsAsynchronousSurfaceRetentionAssertion;
- (SBContinuousExposeHomeGestureRootSwitcherModifier)initWithStartingEnvironmentMode:(int64_t)a3 multitaskingModifier:(id)a4;
- (id)_newMultitaskingModifier;
- (id)gestureChildModifierForGestureEvent:(id)a3 activeTransitionModifier:(id)a4;
- (id)handleGestureEvent:(id)a3;
- (id)transitionChildModifierForMainTransitionEvent:(id)a3 activeGestureModifier:(id)a4;
- (int64_t)gestureType;
@end

@implementation SBContinuousExposeHomeGestureRootSwitcherModifier

- (SBContinuousExposeHomeGestureRootSwitcherModifier)initWithStartingEnvironmentMode:(int64_t)a3 multitaskingModifier:(id)a4
{
  id v8 = a4;
  v12.receiver = self;
  v12.super_class = (Class)SBContinuousExposeHomeGestureRootSwitcherModifier;
  v9 = [(SBGestureRootSwitcherModifier *)&v12 initWithStartingEnvironmentMode:a3];
  if (v9)
  {
    if (!v8)
    {
      v11 = [MEMORY[0x1E4F28B00] currentHandler];
      [v11 handleFailureInMethod:a2, v9, @"SBContinuousExposeHomeGestureRootSwitcherModifier.m", 40, @"Invalid parameter not satisfying: %@", @"multitaskingModifier" object file lineNumber description];
    }
    objc_storeStrong((id *)&v9->_multitaskingModifier, a4);
  }

  return v9;
}

- (int64_t)gestureType
{
  return 1;
}

- (id)gestureChildModifierForGestureEvent:(id)a3 activeTransitionModifier:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = [(SBGestureRootSwitcherModifier *)self selectedAppLayout];
  int64_t v9 = [(SBGestureRootSwitcherModifier *)self currentEnvironmentMode];
  if (v7)
  {
    objc_opt_class();
    char isKindOfClass = objc_opt_isKindOfClass();
  }
  else
  {
    char isKindOfClass = 0;
  }
  BOOL v11 = [v6 type] == 3;
  if ([(SBContinuousExposeHomeGestureRootSwitcherModifier *)self isReduceMotionEnabled])
  {
    objc_super v12 = [SBReduceMotionHomeGestureSwitcherModifier alloc];
    v13 = [v6 gestureID];
    v14 = [(SBReduceMotionHomeGestureSwitcherModifier *)v12 initWithGestureID:v13 selectedAppLayout:v8 startingEnvironmentMode:v9 scrunchInitiated:v11 continuingGesture:v7 != 0 lastGestureWasAnArcSwipe:isKindOfClass & 1];

    [(SBReduceMotionHomeGestureSwitcherModifier *)v14 setShouldProvideBlur:[(SBContinuousExposeHomeGestureRootSwitcherModifier *)self isChamoisWindowingUIEnabled] ^ 1];
    [(SBReduceMotionHomeGestureSwitcherModifier *)v14 setLaysOutNeighboringCards:[(SBContinuousExposeHomeGestureRootSwitcherModifier *)self isChamoisWindowingUIEnabled] ^ 1];
  }
  else
  {
    v15 = [SBContinuousExposeHomeGestureSwitcherModifier alloc];
    v16 = [v6 gestureID];
    v14 = [(SBContinuousExposeHomeGestureSwitcherModifier *)v15 initWithGestureID:v16 selectedAppLayout:v8 startingEnvironmentMode:v9 scrunchInitiated:v11 continuingGesture:v7 != 0 lastGestureWasAnArcSwipe:isKindOfClass & 1];

    [(SBReduceMotionHomeGestureSwitcherModifier *)v14 setProvidesHomeScreenDimmingAlpha:[(SBContinuousExposeHomeGestureRootSwitcherModifier *)self isChamoisWindowingUIEnabled] ^ 1];
  }

  return v14;
}

- (id)handleGestureEvent:(id)a3
{
  id v5 = a3;
  objc_storeStrong((id *)&self->_lastGestureEvent, a3);
  if ([v5 phase] == 1)
  {
    v12.receiver = self;
    v12.super_class = (Class)SBContinuousExposeHomeGestureRootSwitcherModifier;
    id v6 = [(SBContinuousExposeHomeGestureRootSwitcherModifier *)&v12 visibleAppLayouts];
    id v7 = (NSArray *)[v6 copy];
    initiallyVisibleAppLayouts = self->_initiallyVisibleAppLayouts;
    self->_initiallyVisibleAppLayouts = v7;
  }
  v11.receiver = self;
  v11.super_class = (Class)SBContinuousExposeHomeGestureRootSwitcherModifier;
  int64_t v9 = [(SBGestureRootSwitcherModifier *)&v11 handleGestureEvent:v5];

  return v9;
}

- (id)transitionChildModifierForMainTransitionEvent:(id)a3 activeGestureModifier:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  uint64_t v9 = [v7 toEnvironmentMode];
  uint64_t v10 = [v7 fromEnvironmentMode];
  objc_super v11 = [v7 transitionID];
  objc_super v12 = [(SBGestureRootSwitcherModifier *)self selectedAppLayout];
  int64_t v13 = [(SBGestureRootSwitcherModifier *)self currentEnvironmentMode];
  int v14 = [(SBContinuousExposeHomeGestureRootSwitcherModifier *)self isReduceMotionEnabled];
  if (v14)
  {
    uint64_t v15 = 0;
    double v16 = *MEMORY[0x1E4F1DAD8];
    double v17 = *(double *)(MEMORY[0x1E4F1DAD8] + 8);
    double v18 = v17;
    double v19 = *MEMORY[0x1E4F1DAD8];
  }
  else
  {
    int64_t v64 = v13;
    v20 = v11;
    v21 = v12;
    uint64_t v22 = v10;
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
      v63 = [MEMORY[0x1E4F28B00] currentHandler];
      [v63 handleFailureInMethod:a2, self, @"SBContinuousExposeHomeGestureRootSwitcherModifier.m", 102, @"If reduce motion is disabled, the gesture modifier should be an instance of SBHomeGestureSwitcherModifier" object file lineNumber description];
    }
    id v23 = v8;
    if ([v23 isShowingOrAnimatingCardsForFlyIn]) {
      uint64_t v15 = [(SBContinuousExposeHomeGestureRootSwitcherModifier *)self isChamoisWindowingUIEnabled] ^ 1;
    }
    else {
      uint64_t v15 = 0;
    }
    objc_msgSend(v23, "liftOffVelocityForGestureEnd", v64, v7);
    double v19 = v24;
    double v18 = v25;
    [v23 liftOffTranslationForGestureEnd];
    double v16 = v26;
    double v17 = v27;

    uint64_t v10 = v22;
    objc_super v12 = v21;
    objc_super v11 = v20;
    int64_t v13 = v65;
    id v7 = v66;
  }
  if (v9 == 3)
  {
    v31 = [SBContinuousExposeArcSwipeSwitcherModifier alloc];
    v32 = [v7 fromAppLayout];
    v33 = [v7 toAppLayout];
    v34 = [(SBGestureRootSwitcherModifier *)self selectedAppLayout];
    v35 = [(SBContinuousExposeArcSwipeSwitcherModifier *)v31 initWithTransitionID:v11 fromAppLayout:v32 toAppLayout:v33 selectedAppLayout:v34 initialVisibleAppLayouts:self->_initiallyVisibleAppLayouts pinSpaceCornerRadiiToDisplayCornerRadii:[(SBContinuousExposeHomeGestureRootSwitcherModifier *)self isChamoisWindowingUIEnabled] ^ 1];

LABEL_16:
    goto LABEL_37;
  }
  if (v9 == 2)
  {
    v32 = [(SBContinuousExposeHomeGestureRootSwitcherModifier *)self _newMultitaskingModifier];
    v35 = -[SBHomeGestureToSwitcherSwitcherModifier initWithTransitionID:multitaskingModifier:selectedAppLayout:startingEnvironmentMode:liftOffVelocity:liftOffTranslation:adjustAppLayoutsBeforeTransition:keepSelectedAppLayoutAsTopMostElement:]([SBHomeGestureToSwitcherSwitcherModifier alloc], "initWithTransitionID:multitaskingModifier:selectedAppLayout:startingEnvironmentMode:liftOffVelocity:liftOffTranslation:adjustAppLayoutsBeforeTransition:keepSelectedAppLayoutAsTopMostElement:", v11, v32, v12, v13, [(SBContinuousExposeHomeGestureRootSwitcherModifier *)self isChamoisWindowingUIEnabled], [(SBContinuousExposeHomeGestureRootSwitcherModifier *)self isChamoisWindowingUIEnabled], v19, v18, v16, v17);
    [(SBHomeGestureToSwitcherSwitcherModifier *)v35 setHidEventSenderID:[(SBGestureSwitcherModifierEvent *)self->_lastGestureEvent hidEventSenderID]];
    goto LABEL_16;
  }
  if (v9 != 1)
  {
    v35 = 0;
    goto LABEL_37;
  }
  if (v10 == 1)
  {
    v28 = [SBHomeGestureToHomeSwitcherModifier alloc];
    v29 = v11;
    uint64_t v30 = v15;
LABEL_33:
    v35 = [(SBHomeGestureToHomeSwitcherModifier *)v28 initWithTransitionID:v29 showingOrAnimatingCardsForFlyIn:v30];
    goto LABEL_37;
  }
  if ([v7 isMorphToPIPTransition])
  {
    if (v12)
    {
      v32 = -[SBFullScreenToHomePIPSwitcherModifier initWithTransitionID:appLayout:layoutRole:]([SBFullScreenToHomePIPSwitcherModifier alloc], "initWithTransitionID:appLayout:layoutRole:", v11, v12, [v7 morphingPIPLayoutRole]);
      if ([(SBContinuousExposeHomeGestureRootSwitcherModifier *)self isChamoisWindowingUIEnabled])[(SBFullScreenToHomePIPSwitcherModifier *)v32 setShouldForceDefaultAnchorPointForTransition:1]; {
      v35 = -[SBHomeGestureToZoomDownSwitcherModifier initWithTransitionID:appLayout:nonGestureInitiatedZoomModifier:effectiveStartingEnvironmentMode:liftOffVelocity:adjustAnimationAttributes:]([SBHomeGestureToZoomDownSwitcherModifier alloc], "initWithTransitionID:appLayout:nonGestureInitiatedZoomModifier:effectiveStartingEnvironmentMode:liftOffVelocity:adjustAnimationAttributes:", v11, v12, v32, v10, 1, v19, v18);
      }
      goto LABEL_16;
    }
LABEL_32:
    v28 = [SBHomeGestureToHomeSwitcherModifier alloc];
    v29 = v11;
    uint64_t v30 = 1;
    goto LABEL_33;
  }
  if ([(SBSwitcherModifier *)self shouldZoomToSystemApertureForEvent:v7 activeLayout:v12])
  {
    if (!v12) {
      goto LABEL_32;
    }
    [(SBContinuousExposeHomeGestureRootSwitcherModifier *)self appLayouts];
    v37 = uint64_t v36 = v10;
    uint64_t v38 = [v37 indexOfObject:v12];

    [(SBContinuousExposeHomeGestureRootSwitcherModifier *)self frameForIndex:v38];
    double v40 = v39;
    double v42 = v41;
    double v44 = v43;
    double v46 = v45;
    [(SBContinuousExposeHomeGestureRootSwitcherModifier *)self scaleForIndex:v38];
    v48 = -[SBFullScreenToHomeSystemApertureSwitcherModifier initWithTransitionID:zoomModifier:appLayout:direction:expandedCardFrame:cardScale:cardVelocity:]([SBFullScreenToHomeSystemApertureSwitcherModifier alloc], "initWithTransitionID:zoomModifier:appLayout:direction:expandedCardFrame:cardScale:cardVelocity:", v11, 0, v12, 1, v40, v42, v44, v46, v47, v19, v18);
    v49 = [SBHomeGestureToZoomDownSwitcherModifier alloc];
    v50 = v11;
    v51 = v12;
    v52 = v48;
    uint64_t v53 = v36;
    double v54 = v19;
    double v55 = v18;
    uint64_t v56 = 0;
    goto LABEL_35;
  }
  if ([v7 isIconZoomDisabled])
  {
    uint64_t v57 = *MEMORY[0x1E4F1DB20];
    uint64_t v58 = *(void *)(MEMORY[0x1E4F1DB20] + 8);
    uint64_t v59 = *(void *)(MEMORY[0x1E4F1DB20] + 16);
    uint64_t v60 = *(void *)(MEMORY[0x1E4F1DB20] + 24);
  }
  else
  {
    [(SBContinuousExposeHomeGestureRootSwitcherModifier *)self homeScreenIconFrameForAppLayout:v12];
  }
  if (((v14 | CGRectIsNull(*(CGRect *)&v57)) & 1) == 0)
  {
    v48 = [[SBFullScreenToHomeIconZoomSwitcherModifier alloc] initWithTransitionID:v11 appLayout:v12 direction:1];
    [(SBFullScreenToHomeSystemApertureSwitcherModifier *)v48 setShouldForceDefaultAnchorPointForTransition:1];
    [(SBFullScreenToHomeSystemApertureSwitcherModifier *)v48 setShouldDockOrderFrontDuringTransition:1];
    v49 = [SBHomeGestureToZoomDownSwitcherModifier alloc];
    v50 = v11;
    v51 = v12;
    v52 = v48;
    uint64_t v53 = v10;
    double v54 = v19;
    double v55 = v18;
    uint64_t v56 = 1;
LABEL_35:
    v35 = -[SBHomeGestureToZoomDownSwitcherModifier initWithTransitionID:appLayout:nonGestureInitiatedZoomModifier:effectiveStartingEnvironmentMode:liftOffVelocity:adjustAnimationAttributes:](v49, "initWithTransitionID:appLayout:nonGestureInitiatedZoomModifier:effectiveStartingEnvironmentMode:liftOffVelocity:adjustAnimationAttributes:", v50, v51, v52, v53, v56, v54, v55);
    goto LABEL_36;
  }
  if (!v12) {
    goto LABEL_32;
  }
  v48 = [(SBContinuousExposeHomeGestureRootSwitcherModifier *)self homeGestureSettings];
  [(SBFullScreenToHomeSystemApertureSwitcherModifier *)v48 homeGestureCenterZoomDownCenterYOffsetFactor];
  v35 = [[SBFullScreenToHomeCenterZoomDownSwitcherModifier alloc] initWithTransitionID:v11 appLayout:v12 offsetYPercentOfScreenHeight:v61];
  [(SBHomeGestureToSwitcherSwitcherModifier *)v35 setShouldForceDefaultAnchorPointForTransition:1];
LABEL_36:

LABEL_37:
  return v35;
}

- (BOOL)wantsAsynchronousSurfaceRetentionAssertion
{
  return 1;
}

- (id)_newMultitaskingModifier
{
  return (id)[(SBSwitcherModifier *)self->_multitaskingModifier copy];
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_lastGestureEvent, 0);
  objc_storeStrong((id *)&self->_initiallyVisibleAppLayouts, 0);
  objc_storeStrong((id *)&self->_multitaskingModifier, 0);
}

@end