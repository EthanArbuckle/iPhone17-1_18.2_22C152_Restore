@interface SBHomeGestureRootSwitcherModifier
- (BOOL)ensuresSelectedAppLayoutUsesAnchorPointSpacePinning;
- (BOOL)resignsTransitionIntoAppSwitcher;
- (BOOL)shouldPinLayoutRolesToSpace:(unint64_t)a3;
- (BOOL)shouldUseAnchorPointToPinLayoutRolesToSpace:(unint64_t)a3;
- (BOOL)wantsAsynchronousSurfaceRetentionAssertion;
- (SBHomeGestureRootSwitcherModifier)initWithStartingEnvironmentMode:(int64_t)a3 multitaskingModifier:(id)a4;
- (id)_newMultitaskingModifier;
- (id)gestureChildModifierForGestureEvent:(id)a3 activeTransitionModifier:(id)a4;
- (id)handleGestureEvent:(id)a3;
- (id)transitionChildModifierForMainTransitionEvent:(id)a3 activeGestureModifier:(id)a4;
- (int64_t)gestureType;
- (void)setEnsuresSelectedAppLayoutUsesAnchorPointSpacePinning:(BOOL)a3;
- (void)setResignsTransitionIntoAppSwitcher:(BOOL)a3;
@end

@implementation SBHomeGestureRootSwitcherModifier

- (SBHomeGestureRootSwitcherModifier)initWithStartingEnvironmentMode:(int64_t)a3 multitaskingModifier:(id)a4
{
  id v8 = a4;
  v12.receiver = self;
  v12.super_class = (Class)SBHomeGestureRootSwitcherModifier;
  v9 = [(SBGestureRootSwitcherModifier *)&v12 initWithStartingEnvironmentMode:a3];
  if (v9)
  {
    if (!v8)
    {
      v11 = [MEMORY[0x1E4F28B00] currentHandler];
      [v11 handleFailureInMethod:a2, v9, @"SBHomeGestureRootSwitcherModifier.m", 39, @"Invalid parameter not satisfying: %@", @"multitaskingModifier" object file lineNumber description];
    }
    objc_storeStrong((id *)&v9->_multitaskingModifier, a4);
  }

  return v9;
}

- (int64_t)gestureType
{
  return 1;
}

- (id)handleGestureEvent:(id)a3
{
  objc_storeStrong((id *)&self->_lastGestureEvent, a3);
  id v5 = a3;
  v8.receiver = self;
  v8.super_class = (Class)SBHomeGestureRootSwitcherModifier;
  v6 = [(SBGestureRootSwitcherModifier *)&v8 handleGestureEvent:v5];

  return v6;
}

- (id)gestureChildModifierForGestureEvent:(id)a3 activeTransitionModifier:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  objc_super v8 = [(SBGestureRootSwitcherModifier *)self selectedAppLayout];
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
  uint64_t v11 = [v6 type];
  if ([(SBHomeGestureRootSwitcherModifier *)self isReduceMotionEnabled])
  {
    objc_super v12 = [SBReduceMotionHomeGestureSwitcherModifier alloc];
    v13 = [v6 gestureID];
    v14 = [(SBReduceMotionHomeGestureSwitcherModifier *)v12 initWithGestureID:v13 selectedAppLayout:v8 startingEnvironmentMode:v9 scrunchInitiated:v11 == 3 continuingGesture:v7 != 0 lastGestureWasAnArcSwipe:isKindOfClass & 1];

    [(SBReduceMotionHomeGestureSwitcherModifier *)v14 setShouldProvideBlur:[(SBHomeGestureRootSwitcherModifier *)self isChamoisWindowingUIEnabled] ^ 1];
    [(SBReduceMotionHomeGestureSwitcherModifier *)v14 setLaysOutNeighboringCards:[(SBHomeGestureRootSwitcherModifier *)self isChamoisWindowingUIEnabled] ^ 1];
  }
  else
  {
    BOOL v21 = v11 == 3;
    id v15 = [(SBHomeGestureRootSwitcherModifier *)self _newMultitaskingModifier];
    v16 = [SBHomeGestureSwitcherModifier alloc];
    [v6 gestureID];
    v18 = v17 = v8;
    LOBYTE(v20) = isKindOfClass & 1;
    v14 = [(SBHomeGestureSwitcherModifier *)v16 initWithGestureID:v18 selectedAppLayout:v17 startingEnvironmentMode:v9 multitaskingModifier:v15 scrunchInitiated:v21 continuingGesture:v7 != 0 lastGestureWasAnArcSwipe:v20];

    objc_super v8 = v17;
    [(SBReduceMotionHomeGestureSwitcherModifier *)v14 setProvidesHomeScreenDimmingAlpha:[(SBHomeGestureRootSwitcherModifier *)self isChamoisWindowingUIEnabled] ^ 1];
  }
  return v14;
}

- (id)transitionChildModifierForMainTransitionEvent:(id)a3 activeGestureModifier:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  uint64_t v9 = [v7 toEnvironmentMode];
  uint64_t v60 = [v7 fromEnvironmentMode];
  v10 = [v7 transitionID];
  uint64_t v11 = [(SBGestureRootSwitcherModifier *)self selectedAppLayout];
  int64_t v59 = [(SBGestureRootSwitcherModifier *)self currentEnvironmentMode];
  objc_super v12 = [(SBHomeGestureRootSwitcherModifier *)self switcherSettings];
  uint64_t v58 = [v12 effectiveSwitcherStyle];

  int v13 = [(SBHomeGestureRootSwitcherModifier *)self isReduceMotionEnabled];
  if (v13)
  {
    uint64_t v14 = 0;
    double v15 = *MEMORY[0x1E4F1DAD8];
    double v16 = *(double *)(MEMORY[0x1E4F1DAD8] + 8);
    double v17 = v16;
    double v18 = *MEMORY[0x1E4F1DAD8];
  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
      v57 = [MEMORY[0x1E4F28B00] currentHandler];
      [v57 handleFailureInMethod:a2, self, @"SBHomeGestureRootSwitcherModifier.m", 101, @"If reduce motion is disabled, the gesture modifier should be an instance of SBHomeGestureSwitcherModifier" object file lineNumber description];
    }
    id v19 = v8;
    if ([v19 isShowingOrAnimatingCardsForFlyIn]) {
      uint64_t v14 = [(SBHomeGestureRootSwitcherModifier *)self isChamoisWindowingUIEnabled] ^ 1;
    }
    else {
      uint64_t v14 = 0;
    }
    [v19 liftOffVelocityForGestureEnd];
    double v18 = v20;
    double v17 = v21;
    [v19 liftOffTranslationForGestureEnd];
    double v15 = v22;
    double v16 = v23;
  }
  if (v9 == 3)
  {
    v27 = [SBArcSwipeSwitcherModifier alloc];
    v28 = [v7 fromAppLayout];
    v29 = [v7 toAppLayout];
    v30 = [(SBArcSwipeSwitcherModifier *)v27 initWithTransitionID:v10 fromAppLayout:v28 toAppLayout:v29 pinSpaceCornerRadiiToDisplayCornerRadii:[(SBHomeGestureRootSwitcherModifier *)self isChamoisWindowingUIEnabled] ^ 1];

    goto LABEL_39;
  }
  if (v9 != 2)
  {
    if (v9 == 1)
    {
      if (v60 == 1)
      {
        v24 = [SBHomeGestureToHomeSwitcherModifier alloc];
        v25 = v10;
        uint64_t v26 = v14;
LABEL_36:
        v30 = [(SBHomeGestureToHomeSwitcherModifier *)v24 initWithTransitionID:v25 showingOrAnimatingCardsForFlyIn:v26];
        goto LABEL_39;
      }
      if ([v7 isMorphToPIPTransition])
      {
        if (v11)
        {
          v31 = -[SBFullScreenToHomePIPSwitcherModifier initWithTransitionID:appLayout:layoutRole:]([SBFullScreenToHomePIPSwitcherModifier alloc], "initWithTransitionID:appLayout:layoutRole:", v10, v11, [v7 morphingPIPLayoutRole]);
          if ([(SBHomeGestureRootSwitcherModifier *)self isChamoisWindowingUIEnabled])[(SBFullScreenToHomePIPSwitcherModifier *)v31 setShouldForceDefaultAnchorPointForTransition:1]; {
          v32 = [SBHomeGestureToZoomDownSwitcherModifier alloc];
          }
          v33 = v10;
          v34 = v11;
          v35 = v31;
          uint64_t v36 = v60;
          double v37 = v18;
          double v38 = v17;
          uint64_t v39 = 1;
          goto LABEL_28;
        }
      }
      else if ([(SBSwitcherModifier *)self shouldZoomToSystemApertureForEvent:v7 activeLayout:v11])
      {
        if (v11)
        {
          v40 = [(SBHomeGestureRootSwitcherModifier *)self appLayouts];
          uint64_t v41 = [v40 indexOfObject:v11];

          [(SBHomeGestureRootSwitcherModifier *)self frameForIndex:v41];
          double v43 = v42;
          double v45 = v44;
          double v47 = v46;
          double v49 = v48;
          [(SBHomeGestureRootSwitcherModifier *)self scaleForIndex:v41];
          v31 = -[SBFullScreenToHomeSystemApertureSwitcherModifier initWithTransitionID:zoomModifier:appLayout:direction:expandedCardFrame:cardScale:cardVelocity:]([SBFullScreenToHomeSystemApertureSwitcherModifier alloc], "initWithTransitionID:zoomModifier:appLayout:direction:expandedCardFrame:cardScale:cardVelocity:", v10, 0, v11, 1, v43, v45, v47, v49, v50, v18, v17);
          v32 = [SBHomeGestureToZoomDownSwitcherModifier alloc];
          v33 = v10;
          v34 = v11;
          v35 = v31;
          uint64_t v36 = v60;
          double v37 = v18;
          double v38 = v17;
          uint64_t v39 = 0;
LABEL_28:
          v30 = -[SBHomeGestureToZoomDownSwitcherModifier initWithTransitionID:appLayout:nonGestureInitiatedZoomModifier:effectiveStartingEnvironmentMode:liftOffVelocity:adjustAnimationAttributes:](v32, "initWithTransitionID:appLayout:nonGestureInitiatedZoomModifier:effectiveStartingEnvironmentMode:liftOffVelocity:adjustAnimationAttributes:", v33, v34, v35, v36, v39, v37, v38);
          goto LABEL_38;
        }
      }
      else
      {
        if ([v7 isIconZoomDisabled])
        {
          uint64_t v51 = *MEMORY[0x1E4F1DB20];
          uint64_t v52 = *(void *)(MEMORY[0x1E4F1DB20] + 8);
          uint64_t v53 = *(void *)(MEMORY[0x1E4F1DB20] + 16);
          uint64_t v54 = *(void *)(MEMORY[0x1E4F1DB20] + 24);
        }
        else
        {
          [(SBHomeGestureRootSwitcherModifier *)self homeScreenIconFrameForAppLayout:v11];
        }
        if (((v13 | CGRectIsNull(*(CGRect *)&v51)) & 1) == 0)
        {
          v31 = [[SBFullScreenToHomeIconZoomSwitcherModifier alloc] initWithTransitionID:v10 appLayout:v11 direction:1];
          v30 = -[SBHomeGestureToZoomDownSwitcherModifier initWithTransitionID:appLayout:nonGestureInitiatedZoomModifier:effectiveStartingEnvironmentMode:liftOffVelocity:adjustAnimationAttributes:]([SBHomeGestureToZoomDownSwitcherModifier alloc], "initWithTransitionID:appLayout:nonGestureInitiatedZoomModifier:effectiveStartingEnvironmentMode:liftOffVelocity:adjustAnimationAttributes:", v10, v11, v31, v60, 1, v18, v17);
          [(SBFullScreenToHomePIPSwitcherModifier *)v31 setShouldForceDefaultAnchorPointForTransition:self->_ensuresSelectedAppLayoutUsesAnchorPointSpacePinning];
          [(SBFullScreenToHomePIPSwitcherModifier *)v31 setShouldDockOrderFrontDuringTransition:self->_ensuresSelectedAppLayoutUsesAnchorPointSpacePinning];
          goto LABEL_38;
        }
        if (v11)
        {
          v31 = [(SBHomeGestureRootSwitcherModifier *)self homeGestureSettings];
          [(SBFullScreenToHomePIPSwitcherModifier *)v31 homeGestureCenterZoomDownCenterYOffsetFactor];
          v30 = [[SBFullScreenToHomeCenterZoomDownSwitcherModifier alloc] initWithTransitionID:v10 appLayout:v11 offsetYPercentOfScreenHeight:v55];
          [(SBHomeGestureToZoomDownSwitcherModifier *)v30 setShouldForceDefaultAnchorPointForTransition:self->_ensuresSelectedAppLayoutUsesAnchorPointSpacePinning];
          goto LABEL_38;
        }
      }
      v24 = [SBHomeGestureToHomeSwitcherModifier alloc];
      v25 = v10;
      uint64_t v26 = 1;
      goto LABEL_36;
    }
LABEL_19:
    v30 = 0;
    goto LABEL_39;
  }
  if (self->_resignsTransitionIntoAppSwitcher
    && v58 != 1
    && !SBPeekConfigurationIsValid([v7 toPeekConfiguration]))
  {
    goto LABEL_19;
  }
  v31 = [(SBHomeGestureRootSwitcherModifier *)self _newMultitaskingModifier];
  v30 = -[SBHomeGestureToSwitcherSwitcherModifier initWithTransitionID:multitaskingModifier:selectedAppLayout:startingEnvironmentMode:liftOffVelocity:liftOffTranslation:adjustAppLayoutsBeforeTransition:keepSelectedAppLayoutAsTopMostElement:]([SBHomeGestureToSwitcherSwitcherModifier alloc], "initWithTransitionID:multitaskingModifier:selectedAppLayout:startingEnvironmentMode:liftOffVelocity:liftOffTranslation:adjustAppLayoutsBeforeTransition:keepSelectedAppLayoutAsTopMostElement:", v10, v31, v11, v59, [(SBHomeGestureRootSwitcherModifier *)self isChamoisWindowingUIEnabled], [(SBHomeGestureRootSwitcherModifier *)self isChamoisWindowingUIEnabled], v18, v17, v15, v16);
  [(SBHomeGestureToZoomDownSwitcherModifier *)v30 setHidEventSenderID:[(SBGestureSwitcherModifierEvent *)self->_lastGestureEvent hidEventSenderID]];
LABEL_38:

LABEL_39:
  return v30;
}

- (BOOL)wantsAsynchronousSurfaceRetentionAssertion
{
  return 1;
}

- (id)_newMultitaskingModifier
{
  return (id)[(SBSwitcherModifier *)self->_multitaskingModifier copy];
}

- (BOOL)shouldPinLayoutRolesToSpace:(unint64_t)a3
{
  id v5 = [(SBHomeGestureRootSwitcherModifier *)self appLayouts];
  id v6 = [v5 objectAtIndex:a3];

  if (self->_ensuresSelectedAppLayoutUsesAnchorPointSpacePinning
    && ([(SBGestureRootSwitcherModifier *)self selectedAppLayout],
        id v7 = objc_claimAutoreleasedReturnValue(),
        char v8 = [v6 isOrContainsAppLayout:v7],
        v7,
        (v8 & 1) != 0))
  {
    BOOL v9 = 1;
  }
  else
  {
    v11.receiver = self;
    v11.super_class = (Class)SBHomeGestureRootSwitcherModifier;
    BOOL v9 = [(SBHomeGestureRootSwitcherModifier *)&v11 shouldPinLayoutRolesToSpace:a3];
  }

  return v9;
}

- (BOOL)shouldUseAnchorPointToPinLayoutRolesToSpace:(unint64_t)a3
{
  id v5 = [(SBHomeGestureRootSwitcherModifier *)self appLayouts];
  id v6 = [v5 objectAtIndex:a3];

  if (self->_ensuresSelectedAppLayoutUsesAnchorPointSpacePinning
    && ([(SBGestureRootSwitcherModifier *)self selectedAppLayout],
        id v7 = objc_claimAutoreleasedReturnValue(),
        char v8 = [v6 isOrContainsAppLayout:v7],
        v7,
        (v8 & 1) != 0))
  {
    BOOL v9 = 1;
  }
  else
  {
    v11.receiver = self;
    v11.super_class = (Class)SBHomeGestureRootSwitcherModifier;
    BOOL v9 = [(SBHomeGestureRootSwitcherModifier *)&v11 shouldUseAnchorPointToPinLayoutRolesToSpace:a3];
  }

  return v9;
}

- (BOOL)resignsTransitionIntoAppSwitcher
{
  return self->_resignsTransitionIntoAppSwitcher;
}

- (void)setResignsTransitionIntoAppSwitcher:(BOOL)a3
{
  self->_resignsTransitionIntoAppSwitcher = a3;
}

- (BOOL)ensuresSelectedAppLayoutUsesAnchorPointSpacePinning
{
  return self->_ensuresSelectedAppLayoutUsesAnchorPointSpacePinning;
}

- (void)setEnsuresSelectedAppLayoutUsesAnchorPointSpacePinning:(BOOL)a3
{
  self->_ensuresSelectedAppLayoutUsesAnchorPointSpacePinning = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_lastGestureEvent, 0);
  objc_storeStrong((id *)&self->_multitaskingModifier, 0);
}

@end