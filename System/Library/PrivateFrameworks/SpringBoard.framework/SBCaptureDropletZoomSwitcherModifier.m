@interface SBCaptureDropletZoomSwitcherModifier
- (BOOL)completesWhenChildrenComplete;
- (BOOL)isDropletEffectRequiredBehindAppLayout:(id)a3;
- (BOOL)wantsBezelEffectsLayoutElement;
- (BOOL)wantsSwitcherDimmingView;
- (CGRect)frameForIndex:(unint64_t)a3;
- (SBCaptureDropletZoomSwitcherModifier)initWithTransitionID:(id)a3 zoomModifier:(id)a4 appLayout:(id)a5 launchPreludeAnimationToken:(id)a6;
- (double)homeScreenBackdropBlurProgress;
- (double)modelValueForAnimatableProperty:(id)a3 currentValue:(double)a4 creating:(BOOL)a5;
- (double)opacityForLayoutRole:(int64_t)a3 inAppLayout:(id)a4 atIndex:(unint64_t)a5;
- (double)scaleForIndex:(unint64_t)a3;
- (double)switcherDimmingAlpha;
- (id)animatablePropertyIdentifiers;
- (id)animationAttributesForLayoutElement:(id)a3;
- (id)handleAnimatablePropertyChangedEvent:(id)a3;
- (id)handleHardwareButtonDropletAnimationEvent:(id)a3;
- (id)handleTimerEvent:(id)a3;
- (id)settingsForAnimatableProperty:(id)a3;
- (id)topMostLayoutElements;
- (id)transitionDidEnd;
- (id)transitionWillBegin;
- (id)visibleAppLayouts;
- (int64_t)updateModeForAnimatableProperty:(id)a3;
- (void)didMoveToParentModifier:(id)a3;
@end

@implementation SBCaptureDropletZoomSwitcherModifier

- (SBCaptureDropletZoomSwitcherModifier)initWithTransitionID:(id)a3 zoomModifier:(id)a4 appLayout:(id)a5 launchPreludeAnimationToken:(id)a6
{
  id v11 = a3;
  id v12 = a4;
  id v13 = a5;
  id v14 = a6;
  if (v12)
  {
    if (v13) {
      goto LABEL_3;
    }
LABEL_8:
    v24 = [MEMORY[0x1E4F28B00] currentHandler];
    [v24 handleFailureInMethod:a2, self, @"SBCaptureDropletZoomSwitcherModifier.m", 49, @"Invalid parameter not satisfying: %@", @"appLayout != nil" object file lineNumber description];

    if (v14) {
      goto LABEL_4;
    }
    goto LABEL_9;
  }
  v23 = [MEMORY[0x1E4F28B00] currentHandler];
  [v23 handleFailureInMethod:a2, self, @"SBCaptureDropletZoomSwitcherModifier.m", 48, @"Invalid parameter not satisfying: %@", @"zoomModifier != nil" object file lineNumber description];

  if (!v13) {
    goto LABEL_8;
  }
LABEL_3:
  if (v14) {
    goto LABEL_4;
  }
LABEL_9:
  v25 = [MEMORY[0x1E4F28B00] currentHandler];
  [v25 handleFailureInMethod:a2, self, @"SBCaptureDropletZoomSwitcherModifier.m", 50, @"Invalid parameter not satisfying: %@", @"preludeToken != nil" object file lineNumber description];

LABEL_4:
  v26.receiver = self;
  v26.super_class = (Class)SBCaptureDropletZoomSwitcherModifier;
  v15 = [(SBTransitionSwitcherModifier *)&v26 initWithTransitionID:v11];
  if (v15)
  {
    uint64_t v16 = +[SBCaptureButtonDomain rootSettings];
    settings = v15->_settings;
    v15->_settings = (SBCaptureButtonSettings *)v16;

    objc_storeStrong((id *)&v15->_appLayout, a5);
    objc_storeStrong((id *)&v15->_zoomModifier, a4);
    objc_storeStrong((id *)&v15->_preludeAnimationToken, a6);
    v15->_dropletEffectRequired = 1;
    v15->_shouldDimBackground = 0;
    [v14 preludeAnimationRectPresentationValue];
    v15->_initialDropletFrame.origin.x = v18;
    v15->_initialDropletFrame.origin.y = v19;
    v15->_initialDropletFrame.size.width = v20;
    v15->_initialDropletFrame.size.height = v21;
  }

  return v15;
}

- (BOOL)completesWhenChildrenComplete
{
  return 1;
}

- (void)didMoveToParentModifier:(id)a3
{
  v5.receiver = self;
  v5.super_class = (Class)SBCaptureDropletZoomSwitcherModifier;
  -[SBChainableModifier didMoveToParentModifier:](&v5, sel_didMoveToParentModifier_);
  if (a3)
  {
    if (![(SBChainableModifier *)self containsChildModifier:self->_zoomModifier]) {
      [(SBChainableModifier *)self addChildModifier:self->_zoomModifier];
    }
    [(SBCaptureDropletZoomSwitcherModifier *)self presentationValueForAnimatableProperty:@"SBDropletZoomAnimatablePropertyIdentifier"];
    if ([(SBCaptureButtonSettings *)self->_settings enableZoomUpBlur])
    {
      [(SBCaptureButtonSettings *)self->_settings zoomUpBlurStartProgress];
      if (BSFloatGreaterThanOrEqualToFloat()) {
        self->_allowHomeScreenBlur = 1;
      }
    }
    [(SBCaptureButtonSettings *)self->_settings zoomUpBackgroundDimStartProgress];
    if (BSFloatGreaterThanOrEqualToFloat()) {
      self->_shouldDimBackground = 1;
    }
  }
}

- (id)handleAnimatablePropertyChangedEvent:(id)a3
{
  v9.receiver = self;
  v9.super_class = (Class)SBCaptureDropletZoomSwitcherModifier;
  v4 = [(SBSwitcherModifier *)&v9 handleAnimatablePropertyChangedEvent:a3];
  [(SBCaptureDropletZoomSwitcherModifier *)self presentationValueForAnimatableProperty:@"SBDropletZoomAnimatablePropertyIdentifier"];
  if ([(SBCaptureButtonSettings *)self->_settings enableZoomUpBlur]
    && ([(SBCaptureButtonSettings *)self->_settings zoomUpBlurStartProgress],
        BSFloatGreaterThanOrEqualToFloat())
    && !self->_allowHomeScreenBlur)
  {
    int v5 = 1;
    self->_allowHomeScreenBlur = 1;
  }
  else
  {
    int v5 = 0;
  }
  [(SBCaptureButtonSettings *)self->_settings zoomUpBackgroundDimStartProgress];
  if (BSFloatGreaterThanOrEqualToFloat() && !self->_shouldDimBackground)
  {
    self->_shouldDimBackground = 1;
    goto LABEL_10;
  }
  if (v5)
  {
LABEL_10:
    v6 = [[SBUpdateLayoutSwitcherEventResponse alloc] initWithOptions:8 updateMode:3];
    uint64_t v7 = SBAppendSwitcherModifierResponse(v6, v4);

    v4 = (void *)v7;
  }
  return v4;
}

- (id)handleHardwareButtonDropletAnimationEvent:(id)a3
{
  v14.receiver = self;
  v14.super_class = (Class)SBCaptureDropletZoomSwitcherModifier;
  id v4 = a3;
  int v5 = [(SBSwitcherModifier *)&v14 handleHardwareButtonDropletAnimationEvent:v4];
  preludeAnimationToken = self->_preludeAnimationToken;
  self->_preludeAnimationToken = 0;

  objc_msgSend(v4, "zoomUpToken", v14.receiver, v14.super_class);
  uint64_t v7 = (SBHardwareButtonLaunchZoomUpAnimationToken *)objc_claimAutoreleasedReturnValue();

  zoomupAnimationToken = self->_zoomupAnimationToken;
  self->_zoomupAnimationToken = v7;

  objc_super v9 = (void *)MEMORY[0x1E4F29238];
  [(SBHardwareButtonLaunchZoomUpAnimationToken *)self->_zoomupAnimationToken preludeAnimationVelocity];
  v10 = objc_msgSend(v9, "valueWithCGPoint:");
  id v11 = [[SBInjectVelocitySwitcherEventResponse alloc] initWithVelocity:v10 forKey:@"position" appLayout:self->_appLayout];
  id v12 = SBAppendSwitcherModifierResponse(v11, v5);

  return v12;
}

- (id)handleTimerEvent:(id)a3
{
  v10.receiver = self;
  v10.super_class = (Class)SBCaptureDropletZoomSwitcherModifier;
  id v4 = a3;
  int v5 = [(SBTransitionSwitcherModifier *)&v10 handleTimerEvent:v4];
  v6 = objc_msgSend(v4, "reason", v10.receiver, v10.super_class);

  LODWORD(v4) = BSEqualStrings();
  if (v4)
  {
    self->_dropletEffectRequired = 0;
    uint64_t v7 = [[SBUpdateLayoutSwitcherEventResponse alloc] initWithOptions:4 updateMode:3];
    uint64_t v8 = SBAppendSwitcherModifierResponse(v7, v5);

    int v5 = (void *)v8;
  }
  return v5;
}

- (id)transitionWillBegin
{
  v15.receiver = self;
  v15.super_class = (Class)SBCaptureDropletZoomSwitcherModifier;
  v3 = [(SBTransitionSwitcherModifier *)&v15 transitionWillBegin];
  id v4 = objc_alloc_init(SBSwitcherModifierEventResponse);
  int v5 = [SBTimerEventSwitcherEventResponse alloc];
  [(SBCaptureButtonSettings *)self->_settings disableDropletEffectDelay];
  double v7 = v6;
  UIAnimationDragCoefficient();
  objc_super v9 = [(SBTimerEventSwitcherEventResponse *)v5 initWithDelay:0 validator:@"SBDropletEffectDisableTimerReason" reason:v7 * v8];
  [(SBChainableModifierEventResponse *)v4 addChildResponse:v9];

  objc_super v10 = [[SBUpdateLayoutSwitcherEventResponse alloc] initWithOptions:2 updateMode:2];
  [(SBChainableModifierEventResponse *)v4 addChildResponse:v10];

  id v11 = [[SBHardwareButtonDropletActionResponse alloc] initWithPreludeToken:self->_preludeAnimationToken zoomUpToken:0 appLayout:self->_appLayout action:0];
  [(SBChainableModifierEventResponse *)v4 addChildResponse:v11];

  id v12 = [[SBMatchMoveToDropletSwitcherEventResponse alloc] initWithAppLayout:self->_appLayout active:1];
  [(SBChainableModifierEventResponse *)v4 addChildResponse:v12];

  id v13 = SBAppendSwitcherModifierResponse(v4, v3);

  return v13;
}

- (id)transitionDidEnd
{
  v11.receiver = self;
  v11.super_class = (Class)SBCaptureDropletZoomSwitcherModifier;
  v3 = [(SBTransitionSwitcherModifier *)&v11 transitionDidEnd];
  id v4 = objc_alloc_init(SBSwitcherModifierEventResponse);
  int v5 = [[SBMatchMoveToDropletSwitcherEventResponse alloc] initWithAppLayout:self->_appLayout active:0];
  [(SBChainableModifierEventResponse *)v4 addChildResponse:v5];

  double v6 = [[SBHardwareButtonDropletActionResponse alloc] initWithPreludeToken:self->_preludeAnimationToken zoomUpToken:self->_zoomupAnimationToken appLayout:self->_appLayout action:1];
  [(SBChainableModifierEventResponse *)v4 addChildResponse:v6];

  preludeAnimationToken = self->_preludeAnimationToken;
  self->_preludeAnimationToken = 0;

  zoomupAnimationToken = self->_zoomupAnimationToken;
  self->_zoomupAnimationToken = 0;

  objc_super v9 = SBAppendSwitcherModifierResponse(v4, v3);

  return v9;
}

- (CGRect)frameForIndex:(unint64_t)a3
{
  v28.receiver = self;
  v28.super_class = (Class)SBCaptureDropletZoomSwitcherModifier;
  -[SBCaptureDropletZoomSwitcherModifier frameForIndex:](&v28, sel_frameForIndex_);
  double v6 = v5;
  double v8 = v7;
  double v10 = v9;
  double v12 = v11;
  id v13 = [(SBCaptureDropletZoomSwitcherModifier *)self appLayouts];
  objc_super v14 = [v13 objectAtIndex:a3];

  if ([v14 isEqual:self->_appLayout])
  {
    v27.receiver = self;
    v27.super_class = (Class)SBCaptureDropletZoomSwitcherModifier;
    -[SBCaptureDropletZoomSwitcherModifier fullyPresentedFrameForIndex:frame:](&v27, sel_fullyPresentedFrameForIndex_frame_, a3, v6, v8, v10, v12);
    double v6 = v15;
    double v8 = v16;
    double v10 = v17;
    double v12 = v18;
    if ([(SBTransitionSwitcherModifier *)self isPreparingLayout])
    {
      UIRectGetCenter();
      SBUnintegralizedRectCenteredAboutPoint();
      double v6 = v19;
      double v8 = v20;
      double v10 = v21;
      double v12 = v22;
    }
  }

  double v23 = v6;
  double v24 = v8;
  double v25 = v10;
  double v26 = v12;
  result.size.height = v26;
  result.size.width = v25;
  result.origin.y = v24;
  result.origin.x = v23;
  return result;
}

- (double)scaleForIndex:(unint64_t)a3
{
  double v5 = [(SBCaptureDropletZoomSwitcherModifier *)self appLayouts];
  double v6 = [v5 objectAtIndex:a3];

  if ([v6 isEqual:self->_appLayout])
  {
    double v7 = 1.0;
    if ([(SBTransitionSwitcherModifier *)self isPreparingLayout])
    {
      double Height = CGRectGetHeight(self->_initialDropletFrame);
      [(SBCaptureDropletZoomSwitcherModifier *)self containerViewBounds];
      double v7 = Height / CGRectGetHeight(v12);
    }
  }
  else
  {
    v11.receiver = self;
    v11.super_class = (Class)SBCaptureDropletZoomSwitcherModifier;
    [(SBCaptureDropletZoomSwitcherModifier *)&v11 scaleForIndex:a3];
    double v7 = v9;
  }

  return v7;
}

- (id)visibleAppLayouts
{
  v6.receiver = self;
  v6.super_class = (Class)SBCaptureDropletZoomSwitcherModifier;
  v3 = [(SBCaptureDropletZoomSwitcherModifier *)&v6 visibleAppLayouts];
  id v4 = [v3 setByAddingObject:self->_appLayout];

  return v4;
}

- (BOOL)isDropletEffectRequiredBehindAppLayout:(id)a3
{
  id v4 = a3;
  if ([v4 isEqual:self->_appLayout])
  {
    unsigned __int8 dropletEffectRequired = self->_dropletEffectRequired;
  }
  else
  {
    v7.receiver = self;
    v7.super_class = (Class)SBCaptureDropletZoomSwitcherModifier;
    unsigned __int8 dropletEffectRequired = [(SBCaptureDropletZoomSwitcherModifier *)&v7 isDropletEffectRequiredBehindAppLayout:v4];
  }

  return dropletEffectRequired;
}

- (id)topMostLayoutElements
{
  v13.receiver = self;
  v13.super_class = (Class)SBCaptureDropletZoomSwitcherModifier;
  v3 = [(SBCaptureDropletZoomSwitcherModifier *)&v13 topMostLayoutElements];
  if (v3
    && [(SBCaptureDropletZoomSwitcherModifier *)self wantsBezelEffectsLayoutElement])
  {
    v12.receiver = self;
    v12.super_class = (Class)SBCaptureDropletZoomSwitcherModifier;
    id v4 = [(SBCaptureDropletZoomSwitcherModifier *)&v12 bezelEffectsLayoutElement];
    if (v4)
    {
      id v5 = (id)[v3 mutableCopy];
      v11[0] = MEMORY[0x1E4F143A8];
      v11[1] = 3221225472;
      v11[2] = __61__SBCaptureDropletZoomSwitcherModifier_topMostLayoutElements__block_invoke;
      v11[3] = &unk_1E6B0AA78;
      v11[4] = self;
      uint64_t v6 = [v5 indexOfObjectPassingTest:v11];
      if (v6 != 0x7FFFFFFFFFFFFFFFLL)
      {
        uint64_t v7 = v6 + 1;
        [v5 insertObject:v4 atIndex:v6 + 1];
        v10.receiver = self;
        v10.super_class = (Class)SBCaptureDropletZoomSwitcherModifier;
        double v8 = [(SBCaptureDropletZoomSwitcherModifier *)&v10 switcherDimmingViewLayoutElement];
        if (v8) {
          [v5 insertObject:v8 atIndex:v7];
        }
      }
    }
    else
    {
      id v5 = v3;
    }
  }
  else
  {
    id v5 = v3;
  }

  return v5;
}

uint64_t __61__SBCaptureDropletZoomSwitcherModifier_topMostLayoutElements__block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  if ([v3 switcherLayoutElementType] || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0)) {
    uint64_t v4 = 0;
  }
  else {
    uint64_t v4 = [*(id *)(*(void *)(a1 + 32) + 144) isEqual:v3];
  }

  return v4;
}

- (BOOL)wantsBezelEffectsLayoutElement
{
  return 1;
}

- (id)animationAttributesForLayoutElement:(id)a3
{
  id v4 = a3;
  v16.receiver = self;
  v16.super_class = (Class)SBCaptureDropletZoomSwitcherModifier;
  id v5 = [(SBTransitionSwitcherModifier *)&v16 animationAttributesForLayoutElement:v4];
  uint64_t v6 = [v4 switcherLayoutElementType];
  if (v6 == 2)
  {
    uint64_t v7 = (void *)[v5 mutableCopy];
    objc_super v14 = [(SBCaptureButtonSettings *)self->_settings zoomUpBackgroundDimAnimationSettings];
    [v7 setOpacitySettings:v14];

    [v7 setUpdateMode:3];
    goto LABEL_6;
  }
  if (!v6 && [v4 isEqual:self->_appLayout])
  {
    uint64_t v7 = (void *)[v5 mutableCopy];
    double v8 = [(SBCaptureButtonSettings *)self->_settings zoomUpScaleSettings];
    [v7 setLayoutSettings:v8];

    double v9 = [(SBCaptureButtonSettings *)self->_settings zoomUpPositionXSettings];
    [v7 setPositionSettings:v9];

    objc_super v10 = [(SBCaptureButtonSettings *)self->_settings zoomUpPositionXSettings];
    [v7 setDropletPositionXSettings:v10];

    objc_super v11 = [(SBCaptureButtonSettings *)self->_settings zoomUpPositionYSettings];
    [v7 setDropletPositionYSettings:v11];

    objc_super v12 = [(SBCaptureButtonSettings *)self->_settings zoomUpScaleSettings];
    [v7 setScaleSettings:v12];

    objc_super v13 = [(SBCaptureButtonSettings *)self->_settings zoomUpCornerRadiusSettings];
    [v7 setCornerRadiusSettings:v13];

LABEL_6:
    id v5 = v7;
  }

  return v5;
}

- (double)opacityForLayoutRole:(int64_t)a3 inAppLayout:(id)a4 atIndex:(unint64_t)a5
{
  id v8 = a4;
  if (![v8 isEqual:self->_appLayout]
    || (double v9 = 0.0, ![(SBTransitionSwitcherModifier *)self isPreparingLayout]))
  {
    v12.receiver = self;
    v12.super_class = (Class)SBCaptureDropletZoomSwitcherModifier;
    [(SBCaptureDropletZoomSwitcherModifier *)&v12 opacityForLayoutRole:a3 inAppLayout:v8 atIndex:a5];
    double v9 = v10;
  }

  return v9;
}

- (double)homeScreenBackdropBlurProgress
{
  if (!self->_allowHomeScreenBlur) {
    return 0.0;
  }
  v3.receiver = self;
  v3.super_class = (Class)SBCaptureDropletZoomSwitcherModifier;
  [(SBCaptureDropletZoomSwitcherModifier *)&v3 homeScreenBackdropBlurProgress];
  return result;
}

- (BOOL)wantsSwitcherDimmingView
{
  return 1;
}

- (double)switcherDimmingAlpha
{
  if ([(SBTransitionSwitcherModifier *)self isPreparingLayout]
    || (double result = 1.0, !self->_shouldDimBackground))
  {
    v4.receiver = self;
    v4.super_class = (Class)SBCaptureDropletZoomSwitcherModifier;
    [(SBCaptureDropletZoomSwitcherModifier *)&v4 switcherDimmingAlpha];
  }
  return result;
}

- (id)animatablePropertyIdentifiers
{
  v6.receiver = self;
  v6.super_class = (Class)SBCaptureDropletZoomSwitcherModifier;
  objc_super v3 = [(SBCaptureDropletZoomSwitcherModifier *)&v6 animatablePropertyIdentifiers];
  if ([(SBCaptureButtonSettings *)self->_settings enableZoomUpBlur])
  {
    uint64_t v4 = [v3 setByAddingObject:@"SBDropletZoomAnimatablePropertyIdentifier"];

    objc_super v3 = (void *)v4;
  }
  return v3;
}

- (int64_t)updateModeForAnimatableProperty:(id)a3
{
  id v4 = a3;
  if ([v4 isEqualToString:@"SBDropletZoomAnimatablePropertyIdentifier"])
  {
    int64_t v5 = 3;
  }
  else
  {
    v7.receiver = self;
    v7.super_class = (Class)SBCaptureDropletZoomSwitcherModifier;
    int64_t v5 = [(SBCaptureDropletZoomSwitcherModifier *)&v7 updateModeForAnimatableProperty:v4];
  }

  return v5;
}

- (id)settingsForAnimatableProperty:(id)a3
{
  id v4 = a3;
  if ([v4 isEqualToString:@"SBDropletZoomAnimatablePropertyIdentifier"])
  {
    uint64_t v5 = [(SBCaptureButtonSettings *)self->_settings zoomUpScaleSettings];
  }
  else
  {
    v8.receiver = self;
    v8.super_class = (Class)SBCaptureDropletZoomSwitcherModifier;
    uint64_t v5 = [(SBCaptureDropletZoomSwitcherModifier *)&v8 settingsForAnimatableProperty:v4];
  }
  objc_super v6 = (void *)v5;

  return v6;
}

- (double)modelValueForAnimatableProperty:(id)a3 currentValue:(double)a4 creating:(BOOL)a5
{
  BOOL v5 = a5;
  id v8 = a3;
  if ([v8 isEqualToString:@"SBDropletZoomAnimatablePropertyIdentifier"])
  {
    if (v5) {
      double v9 = 0.0;
    }
    else {
      double v9 = 1.0;
    }
  }
  else
  {
    v12.receiver = self;
    v12.super_class = (Class)SBCaptureDropletZoomSwitcherModifier;
    [(SBCaptureDropletZoomSwitcherModifier *)&v12 modelValueForAnimatableProperty:v8 currentValue:v5 creating:a4];
    double v9 = v10;
  }

  return v9;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_zoomupAnimationToken, 0);
  objc_storeStrong((id *)&self->_preludeAnimationToken, 0);
  objc_storeStrong((id *)&self->_zoomModifier, 0);
  objc_storeStrong((id *)&self->_appLayout, 0);
  objc_storeStrong((id *)&self->_settings, 0);
}

@end