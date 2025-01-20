@interface SBHomeGestureFloatingSwitcherModifier
- (BOOL)_hasPausedEnoughForFlyIn;
- (BOOL)_hasTraveledSufficientDistanceForHomeOrAppSwitcher;
- (BOOL)_inMultitaskingForLocation:(CGPoint)a3 translation:(CGPoint)a4;
- (BOOL)_isSelectedAppLayoutAtIndex:(unint64_t)a3;
- (BOOL)_isTranslationPastDistanceThresholdToUnconditionallyGoHome:(double)a3;
- (BOOL)isContentStatusBarVisibleForIndex:(unint64_t)a3;
- (CGPoint)_frameOffsetForTranslation:(CGPoint)a3;
- (CGRect)frameForIndex:(unint64_t)a3;
- (SBHomeGestureFloatingSwitcherModifier)initWithGestureID:(id)a3 selectedAppLayout:(id)a4 continuingGesture:(BOOL)a5 lastGestureWasAnArcSwipe:(BOOL)a6 floatingConfiguration:(int64_t)a7;
- (SBSwitcherAsyncRenderingAttributes)asyncRenderingAttributesForAppLayout:(id)a3;
- (UIRectCornerRadii)cornerRadiiForIndex:(unint64_t)a3;
- (double)_centerYOffsetDuringGesture;
- (double)_distanceYToInSwitcherCardScale;
- (double)_distanceYToMaxTranslation;
- (double)_gestureProgressToMaxTranslationForTranslation:(double)a3;
- (double)_inSwitcherCenterYOffsetWhenPresented;
- (double)_scaleForTranslation:(CGPoint)a3;
- (double)_switcherCardScale;
- (double)dimmingAlphaForLayoutRole:(int64_t)a3 inAppLayout:(id)a4;
- (double)opacityForLayoutRole:(int64_t)a3 inAppLayout:(id)a4 atIndex:(unint64_t)a5;
- (double)scaleForIndex:(unint64_t)a3;
- (double)shadowOffsetForIndex:(unint64_t)a3;
- (double)shadowOpacityForLayoutRole:(int64_t)a3 atIndex:(unint64_t)a4;
- (double)unconditionalDistanceThresholdForHome;
- (id)_layoutSettingsForAppLayout:(id)a3 layoutSettings:(id)a4;
- (id)_responseForActivatingFinalDestination:(int64_t)a3;
- (id)_updateForGestureDidBeginWithEvent:(id)a3;
- (id)_updateForGestureDidChangeWithEvent:(id)a3;
- (id)_updateForGestureDidEndWithEvent:(id)a3;
- (id)_updateInMultitaskingIfNeededWithEvent:(id)a3;
- (id)adjustedAppLayoutsForAppLayouts:(id)a3;
- (id)animationAttributesForLayoutElement:(id)a3;
- (id)appLayoutToAttachSlideOverTongue;
- (id)appLayoutsToCacheSnapshots;
- (id)appLayoutsToResignActive;
- (id)handleGestureEvent:(id)a3;
- (id)handleHomeGestureSettingsChangedEvent:(id)a3;
- (id)handleTransitionEvent:(id)a3;
- (id)keyboardSuppressionMode;
- (id)visibleAppLayouts;
- (int64_t)currentFinalDestination;
- (unint64_t)_selectedAppLayoutIndex;
- (unint64_t)slideOverTongueDirection;
- (unint64_t)slideOverTongueState;
- (void)_applyPrototypeSettings;
- (void)_beginAnimatingMultitaskingPropertyWithMode:(int64_t)a3 settings:(id)a4;
- (void)_beginAnimatingRampingPropertyWithSettings:(id)a3;
- (void)_displayLinkFired:(id)a3;
- (void)_updateGestureTranslationVelocityAndProgressWithEvent:(id)a3;
- (void)didMoveToParentModifier:(id)a3;
@end

@implementation SBHomeGestureFloatingSwitcherModifier

- (SBHomeGestureFloatingSwitcherModifier)initWithGestureID:(id)a3 selectedAppLayout:(id)a4 continuingGesture:(BOOL)a5 lastGestureWasAnArcSwipe:(BOOL)a6 floatingConfiguration:(int64_t)a7
{
  id v13 = a3;
  id v14 = a4;
  if (!v14)
  {
    v22 = [MEMORY[0x1E4F28B00] currentHandler];
    [v22 handleFailureInMethod:a2, self, @"SBHomeGestureFloatingSwitcherModifier.m", 118, @"Invalid parameter not satisfying: %@", @"selectedAppLayout" object file lineNumber description];
  }
  v23.receiver = self;
  v23.super_class = (Class)SBHomeGestureFloatingSwitcherModifier;
  v15 = [(SBGestureSwitcherModifier *)&v23 initWithGestureID:v13];
  v16 = v15;
  if (v15)
  {
    objc_storeStrong((id *)&v15->_selectedAppLayout, a4);
    v16->_continuingGesture = a5;
    v16->_lastGestureWasAnArcSwipe = a6;
    v16->_floatingConfiguration = a7;
    v17 = objc_alloc_init(SBStackedFloatingSwitcherModifier);
    stackedLayoutModifier = v16->_stackedLayoutModifier;
    v16->_stackedLayoutModifier = v17;

    v19 = objc_alloc_init(SBDismissSiriSwitcherModifier);
    dismissSiriModifier = v16->_dismissSiriModifier;
    v16->_dismissSiriModifier = v19;

    [(SBChainableModifier *)v16 addChildModifier:v16->_dismissSiriModifier];
  }

  return v16;
}

- (void)didMoveToParentModifier:(id)a3
{
  v10.receiver = self;
  v10.super_class = (Class)SBHomeGestureFloatingSwitcherModifier;
  -[SBChainableModifier didMoveToParentModifier:](&v10, sel_didMoveToParentModifier_);
  if (a3)
  {
    if (!self->_finalDestinationModifier)
    {
      v5 = [SBHomeGestureFinalDestinationSwitcherModifier alloc];
      v6 = [(SBHomeGestureFloatingSwitcherModifier *)self homeGestureSettings];
      [v6 minimumYDistanceForHomeOrAppSwitcher];
      v8 = -[SBHomeGestureFinalDestinationSwitcherModifier initWithDelegate:initialTranslationAdjustment:minYDistanceForHomeOrSwitcher:startingEnvironmentMode:continuingGesture:dockModifier:](v5, "initWithDelegate:initialTranslationAdjustment:minYDistanceForHomeOrSwitcher:startingEnvironmentMode:continuingGesture:dockModifier:", self, 3, self->_continuingGesture, 0, *MEMORY[0x1E4F1DAD8], *(double *)(MEMORY[0x1E4F1DAD8] + 8), v7);
      finalDestinationModifier = self->_finalDestinationModifier;
      self->_finalDestinationModifier = v8;

      [(SBChainableModifier *)self addChildModifier:self->_finalDestinationModifier];
    }
    [(SBHomeGestureFloatingSwitcherModifier *)self _applyPrototypeSettings];
  }
}

- (id)handleHomeGestureSettingsChangedEvent:(id)a3
{
  id v4 = a3;
  [(SBHomeGestureFloatingSwitcherModifier *)self _applyPrototypeSettings];
  v7.receiver = self;
  v7.super_class = (Class)SBHomeGestureFloatingSwitcherModifier;
  v5 = [(SBSwitcherModifier *)&v7 handleHomeGestureSettingsChangedEvent:v4];

  return v5;
}

- (id)handleTransitionEvent:(id)a3
{
  v8.receiver = self;
  v8.super_class = (Class)SBHomeGestureFloatingSwitcherModifier;
  id v4 = a3;
  v5 = [(SBGestureSwitcherModifier *)&v8 handleTransitionEvent:v4];
  unint64_t v6 = objc_msgSend(v4, "phase", v8.receiver, v8.super_class);

  if (v6 >= 2) {
    [(SBChainableModifier *)self setState:1];
  }
  return v5;
}

- (id)handleGestureEvent:(id)a3
{
  id v5 = a3;
  v12.receiver = self;
  v12.super_class = (Class)SBHomeGestureFloatingSwitcherModifier;
  unint64_t v6 = [(SBGestureSwitcherModifier *)&v12 handleGestureEvent:v5];
  switch([v5 phase])
  {
    case 0:
      objc_super v7 = [MEMORY[0x1E4F28B00] currentHandler];
      [v7 handleFailureInMethod:a2 object:self file:@"SBHomeGestureFloatingSwitcherModifier.m" lineNumber:179 description:@"Should not be getting PhasePossible"];

      goto LABEL_3;
    case 1:
      uint64_t v9 = [(SBHomeGestureFloatingSwitcherModifier *)self _updateForGestureDidBeginWithEvent:v5];
      goto LABEL_7;
    case 2:
      uint64_t v9 = [(SBHomeGestureFloatingSwitcherModifier *)self _updateForGestureDidChangeWithEvent:v5];
      goto LABEL_7;
    case 3:
      uint64_t v9 = [(SBHomeGestureFloatingSwitcherModifier *)self _updateForGestureDidEndWithEvent:v5];
LABEL_7:
      objc_super v8 = (void *)v9;
      break;
    default:
LABEL_3:
      objc_super v8 = 0;
      break;
  }
  objc_super v10 = +[SBChainableModifierEventResponse responseByAppendingResponse:v8 toResponse:v6];

  return v10;
}

- (id)_updateForGestureDidBeginWithEvent:(id)a3
{
  id v5 = a3;
  if (self->_gestureHasBegun)
  {
    v24 = [MEMORY[0x1E4F28B00] currentHandler];
    [v24 handleFailureInMethod:a2 object:self file:@"SBHomeGestureFloatingSwitcherModifier.m" lineNumber:196 description:@"Can't begin a gesture that has already begun."];
  }
  if (self->_gestureHasEnded)
  {
    v25 = [MEMORY[0x1E4F28B00] currentHandler];
    [v25 handleFailureInMethod:a2 object:self file:@"SBHomeGestureFloatingSwitcherModifier.m" lineNumber:197 description:@"Can't begin a gesture that has already ended."];
  }
  self->_gestureHasBegun = 1;
  unint64_t v6 = objc_alloc_init(SBSwitcherModifierEventResponse);
  objc_super v7 = [MEMORY[0x1E4F39B68] displayLinkWithTarget:self selector:sel__displayLinkFired_];
  displayLink = self->_displayLink;
  self->_displayLink = v7;

  uint64_t v9 = self->_displayLink;
  objc_super v10 = [MEMORY[0x1E4F1CAC0] mainRunLoop];
  [(CADisplayLink *)v9 addToRunLoop:v10 forMode:*MEMORY[0x1E4F1C4B0]];

  self->_inMultitasking = 0;
  [(SBHomeGestureFloatingSwitcherModifier *)self containerViewBounds];
  [v5 locationInContainerView];
  double v12 = v11;
  double v14 = v13;
  UIRectGetCenter();
  self->_touchOffset.x = v12 - v15;
  self->_touchOffset.y = v14 - v16;
  self->_initialTouchLocation.x = v12;
  self->_initialTouchLocation.y = v14;
  self->_lastTouchLocation.x = v12;
  self->_lastTouchLocation.y = v14;
  [(SBHomeGestureFloatingSwitcherModifier *)self _updateGestureTranslationVelocityAndProgressWithEvent:v5];
  v17 = objc_alloc_init(SBInvalidateAdjustedAppLayoutsSwitcherEventResponse);
  [(SBChainableModifierEventResponse *)v6 addChildResponse:v17];
  if (self->_continuingGesture
    && ([(SBHomeGestureFloatingSwitcherModifier *)self appLayouts],
        v18 = objc_claimAutoreleasedReturnValue(),
        unint64_t v19 = [v18 count],
        v18,
        v19 >= 2))
  {
    v20 = [(SBHomeGestureFloatingSwitcherModifier *)self switcherSettings];
    v21 = [(SBUpdateLayoutSwitcherEventResponse *)v20 animationSettings];
    v22 = [v21 layoutSettings];
    [(SBHomeGestureFloatingSwitcherModifier *)self _beginAnimatingRampingPropertyWithSettings:v22];
  }
  else
  {
    v20 = [[SBUpdateLayoutSwitcherEventResponse alloc] initWithOptions:8 updateMode:2];
    [(SBChainableModifierEventResponse *)v6 addChildResponse:v20];
  }

  return v6;
}

- (id)_updateForGestureDidChangeWithEvent:(id)a3
{
  id v5 = a3;
  if (!self->_gestureHasBegun)
  {
    double v13 = [MEMORY[0x1E4F28B00] currentHandler];
    [v13 handleFailureInMethod:a2 object:self file:@"SBHomeGestureFloatingSwitcherModifier.m" lineNumber:234 description:@"Can't update a gesture that has not begun."];
  }
  if (self->_gestureHasEnded)
  {
    double v14 = [MEMORY[0x1E4F28B00] currentHandler];
    [v14 handleFailureInMethod:a2 object:self file:@"SBHomeGestureFloatingSwitcherModifier.m" lineNumber:235 description:@"Can't update a gesture that has already ended."];
  }
  [(SBHomeGestureFloatingSwitcherModifier *)self _updateGestureTranslationVelocityAndProgressWithEvent:v5];
  if ([(SBHomeGestureFloatingSwitcherModifier *)self _isTranslationPastDistanceThresholdToUnconditionallyGoHome:self->_translation.y])
  {
    self->_gestureHoldTimer = 0;
  }
  unint64_t v6 = objc_alloc_init(SBSwitcherModifierEventResponse);
  [v5 locationInContainerView];
  CGFloat v8 = v7;
  CGFloat v10 = v9;
  double v11 = [(SBHomeGestureFloatingSwitcherModifier *)self _updateInMultitaskingIfNeededWithEvent:v5];
  if (v11) {
    [(SBChainableModifierEventResponse *)v6 addChildResponse:v11];
  }
  self->_lastTouchLocation.x = v8;
  self->_lastTouchLocation.y = v10;

  return v6;
}

- (id)_updateForGestureDidEndWithEvent:(id)a3
{
  uint64_t v95 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  if (!self->_gestureHasBegun)
  {
    v64 = [MEMORY[0x1E4F28B00] currentHandler];
    [v64 handleFailureInMethod:a2 object:self file:@"SBHomeGestureFloatingSwitcherModifier.m" lineNumber:257 description:@"Can't end a gesture that has not begun."];
  }
  if (self->_gestureHasEnded)
  {
    v65 = [MEMORY[0x1E4F28B00] currentHandler];
    [v65 handleFailureInMethod:a2 object:self file:@"SBHomeGestureFloatingSwitcherModifier.m" lineNumber:258 description:@"Can't end a gesture that has already ended."];
  }
  self->_gestureHasEnded = 1;
  [(SBHomeGestureFloatingSwitcherModifier *)self _updateGestureTranslationVelocityAndProgressWithEvent:v5];
  [(CADisplayLink *)self->_displayLink invalidate];
  displayLink = self->_displayLink;
  self->_displayLink = 0;

  self->_gestureLiftOffVelocity = self->_velocity;
  self->_gestureLiftOffTranslation = self->_translation;
  [v5 locationInContainerView];
  self->_lastTouchLocation.x = v7;
  self->_lastTouchLocation.y = v8;
  unint64_t v9 = [(SBHomeGestureFinalDestinationSwitcherModifier *)self->_finalDestinationModifier currentFinalDestination];
  CGFloat v10 = [(SBHomeGestureFinalDestinationSwitcherModifier *)self->_finalDestinationModifier finalDestinationReason];
  double v11 = objc_alloc_init(SBSwitcherModifierEventResponse);
  if (([v5 isCanceled] & 1) == 0 && objc_msgSend(v5, "touchType") == 1)
  {
    double v12 = [(SBHomeGestureFloatingSwitcherModifier *)self homeGestureSettings];
    double v13 = v12;
    if (v9 == 4 && self->_selectedAppLayout && [v12 injectGestureVelocityForZoomDown])
    {
      double v14 = [(SBHomeGestureFloatingSwitcherModifier *)self visibleAppLayouts];
      [v5 velocityInContainerView];
      double v16 = v15;
      double v18 = v17;
      [(SBHomeGestureFloatingSwitcherModifier *)self switcherViewBounds];
      double v20 = v19;
      v21 = [(SBHomeGestureFloatingSwitcherModifier *)self homeGestureSettings];
      v22 = [(SBHomeGestureFloatingSwitcherModifier *)self currentVelocityValueForVisibleAppLayout:self->_selectedAppLayout key:@"transform"];
      objc_super v23 = v22;
      if (v22)
      {
        [v22 CATransform3DValue];
        CATransform3DGetAffineTransform(&v84, &v85);
        double a = v84.a;
      }
      else
      {
        double a = 0.0;
      }
      [v21 scaleVelocityPercentOfGestureVelocityYDividedByViewHeight];
      double v26 = v18 / v20 * v25;
      if ([v21 onlyInjectVelocityForShortFlicks] && fabs(a / v26) >= 0.15)
      {
        v27 = 0;
      }
      else
      {
        v71 = v11;
        id v72 = v5;
        v68 = v23;
        v70 = v10;
        v74 = self;
        v27 = (void *)[objc_alloc(MEMORY[0x1E4F1CA48]) initWithCapacity:2];
        v73 = v21;
        [v21 maximumScaleVelocity];
        long long v93 = 0u;
        long long v94 = 0u;
        long long v91 = 0u;
        long long v92 = 0u;
        long long v89 = 0u;
        long long v90 = 0u;
        memset(buf, 0, sizeof(buf));
        SBVelocityMatrixForUniform2DScaling();
        long long v82 = 0u;
        long long v83 = 0u;
        long long v80 = 0u;
        long long v81 = 0u;
        v69 = v14;
        id v28 = v14;
        uint64_t v29 = [v28 countByEnumeratingWithState:&v80 objects:v87 count:16];
        if (v29)
        {
          uint64_t v30 = v29;
          uint64_t v31 = *(void *)v81;
          do
          {
            for (uint64_t i = 0; i != v30; ++i)
            {
              if (*(void *)v81 != v31) {
                objc_enumerationMutation(v28);
              }
              uint64_t v33 = *(void *)(*((void *)&v80 + 1) + 8 * i);
              v34 = [SBInjectVelocitySwitcherEventResponse alloc];
              v79[4] = v91;
              v79[5] = v92;
              v79[6] = v93;
              v79[7] = v94;
              v79[0] = *(_OWORD *)buf;
              v79[1] = *(_OWORD *)&buf[16];
              v79[2] = v89;
              v79[3] = v90;
              v35 = [MEMORY[0x1E4F29238] valueWithCATransform3D:v79];
              v36 = [(SBInjectVelocitySwitcherEventResponse *)v34 initWithVelocity:v35 forKey:@"transform" appLayout:v33];
              [v27 addObject:v36];
            }
            uint64_t v30 = [v28 countByEnumeratingWithState:&v80 objects:v87 count:16];
          }
          while (v30);
        }

        v37 = [(SBHomeGestureFloatingSwitcherModifier *)v74 currentVelocityValueForVisibleAppLayout:v74->_selectedAppLayout key:@"position"];
        v66 = v37;
        if (v37)
        {
          objc_msgSend(v37, "CGPointValue", v37);
          double v39 = v38;
          double v41 = v40;
        }
        else
        {
          double v39 = *MEMORY[0x1E4F1DAD8];
          double v41 = *(double *)(MEMORY[0x1E4F1DAD8] + 8);
        }
        objc_msgSend(v73, "positionVelocityXPercentOfGestureVelocityX", v66);
        double v43 = v42;
        [v73 positionVelocityYPercentOfGestureVelocityY];
        double v45 = v44;
        long long v75 = 0u;
        long long v76 = 0u;
        long long v77 = 0u;
        long long v78 = 0u;
        id v46 = v28;
        uint64_t v47 = [v46 countByEnumeratingWithState:&v75 objects:v86 count:16];
        if (v47)
        {
          uint64_t v48 = v47;
          double v49 = fabs(v39);
          if (fabs(v16) >= v49) {
            double v50 = v16;
          }
          else {
            double v50 = v39;
          }
          if (fabs(v50) >= v49) {
            double v51 = v18;
          }
          else {
            double v51 = v41;
          }
          double v52 = v45 * v51;
          double v53 = v43 * v50;
          uint64_t v54 = *(void *)v76;
          do
          {
            for (uint64_t j = 0; j != v48; ++j)
            {
              if (*(void *)v76 != v54) {
                objc_enumerationMutation(v46);
              }
              uint64_t v56 = *(void *)(*((void *)&v75 + 1) + 8 * j);
              v57 = [SBInjectVelocitySwitcherEventResponse alloc];
              v58 = objc_msgSend(MEMORY[0x1E4F29238], "valueWithCGPoint:", v53, v52);
              v59 = [(SBInjectVelocitySwitcherEventResponse *)v57 initWithVelocity:v58 forKey:@"position" appLayout:v56];
              [v27 addObject:v59];
            }
            uint64_t v48 = [v46 countByEnumeratingWithState:&v75 objects:v86 count:16];
          }
          while (v48);
        }

        double v11 = v71;
        id v5 = v72;
        v21 = v73;
        self = v74;
        unint64_t v9 = 4;
        CGFloat v10 = v70;
        double v14 = v69;
        objc_super v23 = v68;
      }
      if ([v27 count]) {
        [(SBChainableModifierEventResponse *)v11 addChildResponses:v27];
      }
    }
  }
  v60 = SBLogSystemGestureAppSwitcher();
  if (os_log_type_enabled(v60, OS_LOG_TYPE_INFO))
  {
    v61 = NSStringFromSBHomeGestureFinalDestination(v9);
    *(_DWORD *)buf = 138412802;
    *(void *)&buf[4] = v61;
    *(_WORD *)&buf[12] = 2048;
    *(void *)&buf[14] = v9;
    *(_WORD *)&buf[22] = 2112;
    *(void *)&buf[24] = v10;
    _os_log_impl(&dword_1D85BA000, v60, OS_LOG_TYPE_INFO, "Floating Home Gesture Modifier - Final Response: %@ (%lu), Reason: %@", buf, 0x20u);
  }
  v62 = [(SBHomeGestureFloatingSwitcherModifier *)self _responseForActivatingFinalDestination:v9];
  [(SBChainableModifierEventResponse *)v11 addChildResponse:v62];

  return v11;
}

- (void)_beginAnimatingRampingPropertyWithSettings:(id)a3
{
  id v4 = a3;
  rampingProperty = self->_rampingProperty;
  if (rampingProperty)
  {
    [(UIViewFloatAnimatableProperty *)rampingProperty invalidate];
    unint64_t v6 = self->_rampingProperty;
    self->_rampingProperty = 0;
  }
  CGFloat v7 = (UIViewFloatAnimatableProperty *)objc_alloc_init(MEMORY[0x1E4F43000]);
  CGFloat v8 = self->_rampingProperty;
  self->_rampingProperty = v7;

  [(UIViewFloatAnimatableProperty *)self->_rampingProperty setValue:0.0];
  objc_initWeak(&location, self);
  unint64_t v9 = self->_rampingProperty;
  CGFloat v10 = (void *)MEMORY[0x1E4F42FF0];
  v15[0] = MEMORY[0x1E4F143A8];
  v15[1] = 3221225472;
  v15[2] = __84__SBHomeGestureFloatingSwitcherModifier__beginAnimatingRampingPropertyWithSettings___block_invoke;
  v15[3] = &unk_1E6AF4AC0;
  v15[4] = self;
  v12[0] = MEMORY[0x1E4F143A8];
  v12[1] = 3221225472;
  v12[2] = __84__SBHomeGestureFloatingSwitcherModifier__beginAnimatingRampingPropertyWithSettings___block_invoke_2;
  v12[3] = &unk_1E6AFBE70;
  objc_copyWeak(&v14, &location);
  double v11 = v9;
  double v13 = v11;
  objc_msgSend(v10, "sb_animateWithSettings:mode:animations:completion:", v4, 3, v15, v12);

  objc_destroyWeak(&v14);
  objc_destroyWeak(&location);
}

uint64_t __84__SBHomeGestureFloatingSwitcherModifier__beginAnimatingRampingPropertyWithSettings___block_invoke(uint64_t a1)
{
  return [*(id *)(*(void *)(a1 + 32) + 192) setValue:1.0];
}

void __84__SBHomeGestureFloatingSwitcherModifier__beginAnimatingRampingPropertyWithSettings___block_invoke_2(uint64_t a1)
{
  WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 40));
  if (WeakRetained)
  {
    unint64_t v6 = WeakRetained;
    id v3 = WeakRetained[24];
    id v4 = v3;
    if (v3 && v3 == *(id *)(a1 + 32))
    {
      id v5 = v6[24];
      v6[24] = 0;
    }
    WeakRetained = v6;
  }
}

- (void)_updateGestureTranslationVelocityAndProgressWithEvent:(id)a3
{
  id v4 = a3;
  [v4 translationInContainerView];
  double v6 = v5
     + self->_translationAdjustmentForStartingFromSwitcher.x
     + self->_translationAdjustmentForStartingFromHomeScreen.x;
  double v8 = v7
     + self->_translationAdjustmentForStartingFromSwitcher.y
     + self->_translationAdjustmentForStartingFromHomeScreen.y;
  [(SBHomeGestureFloatingSwitcherModifier *)self _distanceYToInSwitcherCardScale];
  double v10 = -v8 / v9;
  [(SBHomeGestureFloatingSwitcherModifier *)self _gestureProgressToMaxTranslationForTranslation:v8];
  self->_translation.x = v6;
  self->_translation.y = v8;
  self->_progressToInSwitcherCardScale = v10;
  self->_progressToMaxTranslation = v11;
  [v4 lastTouchTimestamp];
  self->_lastTouchTimestamp = v12;
  [(SBHomeGestureFloatingSwitcherModifier *)self containerViewBounds];
  double v14 = v13;
  if ([(SBHomeGestureFloatingSwitcherModifier *)self isRTLEnabled]) {
    double v15 = -v6;
  }
  else {
    double v15 = v6;
  }
  [(SBHomeGestureFloatingSwitcherModifier *)self scaleForIndex:0];
  double v17 = v16;
  double v18 = v16 * v14 * -0.55;
  if (v15 < v18)
  {
    BSUIConstrainValueWithRubberBand();
    double v15 = v18 - v19;
  }
  double v20 = v14 * v17 * 0.55;
  if (v15 > v20)
  {
    BSUIConstrainValueWithRubberBand();
    double v15 = v20 + v21;
  }
  int v22 = [(SBHomeGestureFloatingSwitcherModifier *)self isRTLEnabled];
  double v23 = -v15;
  if (!v22) {
    double v23 = v15;
  }
  self->_translation.x = v23;
  self->_translation.y = v8;
  [v4 averageTouchVelocityOverTimeDuration:0.0416666667];
  self->_velocity.x = v24;
  self->_velocity.y = v25;
  BSUIConstrainValueToIntervalWithRubberBand();
  self->_rubberbandedYTranslation = v26;
  self->_scaleProgress = v26 / 475.0 + 0.0;
  self->_multitaskingHintProgress = self->_rubberbandedYTranslation / 150.0 + 0.0;
}

- (int64_t)currentFinalDestination
{
  return [(SBHomeGestureFinalDestinationSwitcherModifier *)self->_finalDestinationModifier currentFinalDestination];
}

- (double)unconditionalDistanceThresholdForHome
{
  double v3 = *(double *)&kHomeGestureNormalizedDistanceYThresholdForUnconditionalHome_0;
  double v4 = *(double *)&kHomeGestureNormalizedDistanceYThresholdRangeForUnconditionalHome_0;
  [(SBHomeGestureFloatingSwitcherModifier *)self containerViewBounds];
  double result = v3 * v5;
  if (self->_hasTriggeredCardFlyIn)
  {
    double v7 = result - v4 * v5;
    double result = result + v4 * v5;
    if (v7 < 100.0 - self->_translationYWhenTriggeredCardFlyIn) {
      double v7 = 100.0 - self->_translationYWhenTriggeredCardFlyIn;
    }
    if (result > v7) {
      double result = v7;
    }
    if (!self->_inMultitasking) {
      return result + -50.0;
    }
  }
  return result;
}

- (id)_responseForActivatingFinalDestination:(int64_t)a3
{
  double v5 = [(SBHomeGestureFloatingSwitcherModifier *)self appLayouts];
  double v6 = v5;
  switch(a3)
  {
    case 0:
      double v7 = self->_selectedAppLayout;
      uint64_t v8 = 0;
      goto LABEL_4;
    case 1:
      uint64_t v10 = [v5 indexOfObject:self->_selectedAppLayout];
      uint64_t v9 = 0x7FFFFFFFFFFFFFFFLL;
      if (v10 == 0x7FFFFFFFFFFFFFFFLL) {
        goto LABEL_18;
      }
      uint64_t v11 = v10;
      if (![v6 count]) {
        goto LABEL_18;
      }
      if (!v11)
      {
        uint64_t v17 = [v6 lastObject];
        goto LABEL_27;
      }
      if (v11 <= 1) {
        uint64_t v12 = 1;
      }
      else {
        uint64_t v12 = v11;
      }
      uint64_t v13 = v12 - 1;
      goto LABEL_17;
    case 2:
      uint64_t v14 = [v5 indexOfObject:self->_selectedAppLayout];
      uint64_t v9 = 0x7FFFFFFFFFFFFFFFLL;
      if (v14 == 0x7FFFFFFFFFFFFFFFLL || (uint64_t v15 = v14, ![v6 count]))
      {
LABEL_18:
        uint64_t v8 = 0;
        double v7 = 0;
      }
      else
      {
        uint64_t v16 = [v6 count];
        if (v15 + 1 < v16 - 1) {
          uint64_t v13 = v15 + 1;
        }
        else {
          uint64_t v13 = v16 - 1;
        }
LABEL_17:
        uint64_t v17 = [v6 objectAtIndex:v13];
LABEL_27:
        double v7 = (SBAppLayout *)v17;
        uint64_t v8 = 0;
      }
LABEL_28:
      double v20 = objc_alloc_init(SBMutableSwitcherTransitionRequest);
      [(SBSwitcherTransitionRequest *)v20 setAppLayout:v7];
      [(SBSwitcherTransitionRequest *)v20 setFloatingSwitcherVisible:v9];
      [(SBSwitcherTransitionRequest *)v20 setFloatingConfiguration:v8];
      double v21 = [[SBPerformTransitionSwitcherEventResponse alloc] initWithTransitionRequest:v20 gestureInitiated:1];

      return v21;
    case 3:
      double v7 = self->_selectedAppLayout;
      uint64_t v8 = 0;
      uint64_t v9 = 1;
      goto LABEL_28;
    case 4:
      int64_t floatingConfiguration = self->_floatingConfiguration;
      uint64_t v19 = 4;
      if (floatingConfiguration != 2) {
        uint64_t v19 = 0;
      }
      if (floatingConfiguration == 1) {
        uint64_t v8 = 3;
      }
      else {
        uint64_t v8 = v19;
      }
      uint64_t v9 = 0x7FFFFFFFFFFFFFFFLL;
      double v7 = 0;
      goto LABEL_28;
    default:
      uint64_t v8 = 0;
      double v7 = 0;
LABEL_4:
      uint64_t v9 = 0x7FFFFFFFFFFFFFFFLL;
      goto LABEL_28;
  }
}

- (id)adjustedAppLayoutsForAppLayouts:(id)a3
{
  id v4 = a3;
  v16.receiver = self;
  v16.super_class = (Class)SBHomeGestureFloatingSwitcherModifier;
  double v5 = [(SBHomeGestureFloatingSwitcherModifier *)&v16 adjustedAppLayoutsForAppLayouts:v4];
  if ([(SBGestureSwitcherModifier *)self gesturePhase] != 3
    && (unint64_t)[v4 count] >= 5)
  {
    double v6 = [MEMORY[0x1E4F1CA48] array];
    uint64_t v7 = [v4 indexOfObject:self->_selectedAppLayout];
    if (v7 == 0x7FFFFFFFFFFFFFFFLL || v7 == 0)
    {
      [v6 addObjectsFromArray:v4];
    }
    else
    {
      uint64_t v9 = v7;
      uint64_t v10 = objc_msgSend(v4, "subarrayWithRange:", v9, objc_msgSend(v4, "count") - v9);
      [v6 addObjectsFromArray:v10];

      uint64_t v11 = objc_msgSend(v4, "subarrayWithRange:", 0, v9);
      [v6 addObjectsFromArray:v11];
    }
    uint64_t v12 = objc_msgSend(v6, "subarrayWithRange:", 0, 3);
    uint64_t v13 = (void *)[v12 mutableCopy];

    uint64_t v14 = [v6 lastObject];
    [v13 addObject:v14];

    double v5 = v13;
  }

  return v5;
}

- (CGRect)frameForIndex:(unint64_t)a3
{
  uint64_t v31 = 0;
  v32 = (CGRect *)&v31;
  uint64_t v33 = 0x4010000000;
  v34 = &unk_1D90ED3C6;
  long long v5 = *(_OWORD *)(MEMORY[0x1E4F1DB28] + 16);
  stackedLayoutModifier = self->_stackedLayoutModifier;
  long long v35 = *MEMORY[0x1E4F1DB28];
  long long v36 = v5;
  v30[0] = MEMORY[0x1E4F143A8];
  v30[1] = 3221225472;
  v30[2] = __55__SBHomeGestureFloatingSwitcherModifier_frameForIndex___block_invoke;
  v30[3] = &unk_1E6AF6358;
  v30[4] = self;
  v30[5] = &v31;
  v30[6] = a3;
  [(SBChainableModifier *)self performTransactionWithTemporaryChildModifier:stackedLayoutModifier usingBlock:v30];
  -[SBHomeGestureFloatingSwitcherModifier _frameOffsetForTranslation:](self, "_frameOffsetForTranslation:", self->_translation.x, self->_translation.y);
  double v8 = v7;
  CGFloat v10 = v9;
  if (![(SBHomeGestureFloatingSwitcherModifier *)self _isSelectedAppLayoutAtIndex:a3]
    && self->_inMultitasking)
  {
    double x = self->_translation.x;
    if ([(SBHomeGestureFloatingSwitcherModifier *)self isRTLEnabled]) {
      double x = -x;
    }
    double multitaskingHintProgress = self->_multitaskingHintProgress;
    uint64_t v13 = [(SBHomeGestureFloatingSwitcherModifier *)self appLayouts];
    double v14 = x * -0.4;
    uint64_t v15 = [v13 count] - 1;

    double v16 = (v14 + -70.0) * multitaskingHintProgress + (1.0 - multitaskingHintProgress) * v14;
    if (x >= 0.0)
    {
      double x = (v14 * 0.25 + -105.0) * multitaskingHintProgress + (1.0 - multitaskingHintProgress) * v14;
      double v19 = x;
    }
    else
    {
      double v17 = (v14 + -70.0) * multitaskingHintProgress + (1.0 - multitaskingHintProgress) * v14;
      if (v15 != 1)
      {
        double v17 = (v14 + -70.0) * multitaskingHintProgress + (1.0 - multitaskingHintProgress) * v14;
        if (v16 > x)
        {
          BSUIConstrainValueWithRubberBand();
          double v17 = x + v18;
        }
      }
      double v19 = v16 + multitaskingHintProgress * -35.0;
      if (v19 <= x) {
        double x = v19;
      }
      double v16 = v17;
    }
    int v20 = [(SBHomeGestureFloatingSwitcherModifier *)self isRTLEnabled];
    if (v15 == a3) {
      double v21 = v19;
    }
    else {
      double v21 = x;
    }
    if (a3 == 1) {
      double v21 = v16;
    }
    if (v20) {
      double v8 = -v21;
    }
    else {
      double v8 = v21;
    }
  }
  CGRect v37 = CGRectOffset(v32[1], v8, v10);
  CGFloat v22 = v37.origin.x;
  CGFloat y = v37.origin.y;
  CGFloat width = v37.size.width;
  CGFloat height = v37.size.height;
  v32[1] = v37;
  _Block_object_dispose(&v31, 8);
  double v26 = v22;
  double v27 = y;
  double v28 = width;
  double v29 = height;
  result.size.CGFloat height = v29;
  result.size.CGFloat width = v28;
  result.origin.CGFloat y = v27;
  result.origin.double x = v26;
  return result;
}

uint64_t __55__SBHomeGestureFloatingSwitcherModifier_frameForIndex___block_invoke(void *a1)
{
  uint64_t result = [*(id *)(a1[4] + 120) frameForIndex:a1[6]];
  double v3 = *(void **)(a1[5] + 8);
  v3[4] = v4;
  v3[5] = v5;
  v3[6] = v6;
  v3[7] = v7;
  return result;
}

- (double)scaleForIndex:(unint64_t)a3
{
  if ([(SBHomeGestureFloatingSwitcherModifier *)self _isSelectedAppLayoutAtIndex:"_isSelectedAppLayoutAtIndex:"])
  {
    double x = self->_translation.x;
    double y = self->_translation.y;
    -[SBHomeGestureFloatingSwitcherModifier _scaleForTranslation:](self, "_scaleForTranslation:", x, y);
  }
  else
  {
    unint64_t v8 = 2;
    if (a3 < 2) {
      unint64_t v8 = a3;
    }
    uint64_t v13 = 0;
    double v14 = (double *)&v13;
    uint64_t v15 = 0x2020000000;
    stackedLayoutModifier = self->_stackedLayoutModifier;
    uint64_t v16 = 0x3FF0000000000000;
    v12[0] = MEMORY[0x1E4F143A8];
    v12[1] = 3221225472;
    v12[2] = __55__SBHomeGestureFloatingSwitcherModifier_scaleForIndex___block_invoke;
    v12[3] = &unk_1E6AF6358;
    void v12[4] = self;
    v12[5] = &v13;
    v12[6] = v8;
    [(SBChainableModifier *)self performTransactionWithTemporaryChildModifier:stackedLayoutModifier usingBlock:v12];
    -[SBHomeGestureFloatingSwitcherModifier _scaleForTranslation:](self, "_scaleForTranslation:", self->_translation.x, self->_translation.y);
    double v11 = v10 * v14[3];
    v14[3] = v11;
    _Block_object_dispose(&v13, 8);
    return v11;
  }
  return result;
}

uint64_t __55__SBHomeGestureFloatingSwitcherModifier_scaleForIndex___block_invoke(void *a1)
{
  uint64_t result = [*(id *)(a1[4] + 120) scaleForIndex:a1[6]];
  *(void *)(*(void *)(a1[5] + 8) + 24) = v3;
  return result;
}

- (id)visibleAppLayouts
{
  id v3 = objc_alloc_init(MEMORY[0x1E4F1CA80]);
  uint64_t v4 = [(SBHomeGestureFloatingSwitcherModifier *)self appLayouts];
  if ([v4 count])
  {
    uint64_t v5 = [v4 count] - 1;
    if (v5 >= 2) {
      uint64_t v5 = 2;
    }
    uint64_t v6 = objc_msgSend(v4, "subarrayWithRange:", 0, v5 + 1);
    [v3 addObjectsFromArray:v6];

    uint64_t v7 = [v4 lastObject];
    [v3 addObject:v7];
  }
  return v3;
}

- (UIRectCornerRadii)cornerRadiiForIndex:(unint64_t)a3
{
  id v3 = [(SBHomeGestureFloatingSwitcherModifier *)self medusaSettings];
  [v3 cornerRadiusForFloatingApps];
  SBRectCornerRadiiForRadius();
  double v5 = v4;
  double v7 = v6;
  double v9 = v8;
  double v11 = v10;

  double v12 = v5;
  double v13 = v7;
  double v14 = v9;
  double v15 = v11;
  result.topRight = v15;
  result.bottomRight = v14;
  result.bottomLeft = v13;
  result.topLeft = v12;
  return result;
}

- (CGPoint)_frameOffsetForTranslation:(CGPoint)a3
{
  double x = a3.x;
  double v6 = *MEMORY[0x1E4F1DAD8];
  double v5 = *(double *)(MEMORY[0x1E4F1DAD8] + 8);
  [(SBHomeGestureFloatingSwitcherModifier *)self _gestureProgressToMaxTranslationForTranslation:a3.y];
  double v8 = v7;
  [(SBHomeGestureFloatingSwitcherModifier *)self _centerYOffsetDuringGesture];
  double v10 = v5 + v8 * v9 + 0.0;
  -[SBHomeGestureFloatingSwitcherModifier _scaleForTranslation:](self, "_scaleForTranslation:", self->_translation.x, self->_translation.y);
  double v12 = v11;
  [(SBHomeGestureFloatingSwitcherModifier *)self containerViewBounds];
  double v14 = x + v6 + self->_touchOffset.x / (v13 * 0.5) * ((v13 - v12 * v13) * 0.5);
  double v15 = v10;
  result.double y = v15;
  result.double x = v14;
  return result;
}

- (double)_scaleForTranslation:(CGPoint)a3
{
  [(SBHomeGestureFloatingSwitcherModifier *)self _gestureProgressToMaxTranslationForTranslation:a3.y];
  double result = 1.0 - v3;
  if (result < 0.0) {
    double result = 0.0;
  }
  if (result >= 0.4)
  {
    if (result > 1.0)
    {
      BSUIConstrainValueWithRubberBand();
      return v6 + 1.0;
    }
  }
  else
  {
    BSUIConstrainValueWithRubberBand();
    return 0.4 - v5;
  }
  return result;
}

- (double)opacityForLayoutRole:(int64_t)a3 inAppLayout:(id)a4 atIndex:(unint64_t)a5
{
  return 1.0;
}

- (double)dimmingAlphaForLayoutRole:(int64_t)a3 inAppLayout:(id)a4
{
  id v5 = a4;
  double v6 = [(SBHomeGestureFloatingSwitcherModifier *)self appLayouts];
  uint64_t v7 = [v6 indexOfObject:v5];

  double x = self->_translation.x;
  [(SBHomeGestureFloatingSwitcherModifier *)self containerViewBounds];
  double v10 = v9;
  int v11 = [(SBHomeGestureFloatingSwitcherModifier *)self isRTLEnabled];
  double v12 = self->_translation.x;
  if (v11) {
    double v12 = -v12;
  }
  if (v12 >= 0.0)
  {
    uint64_t v14 = 1;
  }
  else
  {
    double v13 = [(SBHomeGestureFloatingSwitcherModifier *)self appLayouts];
    uint64_t v14 = [v13 count] - 1;
  }
  double result = 0.0;
  if (v7)
  {
    if (v7 == v14)
    {
      double v16 = fmin(fmax(fabs(x) / (v10 / 1.5) + 0.0, 0.0), 1.0);
      return v16 * 0.0 + (1.0 - v16) * 0.05625;
    }
    else
    {
      return 0.075;
    }
  }
  return result;
}

- (double)shadowOpacityForLayoutRole:(int64_t)a3 atIndex:(unint64_t)a4
{
  if (!a4) {
    return 1.0;
  }
  if (!self->_inMultitasking) {
    return 0.0;
  }
  double v6 = fabs(self->_translation.x);
  [(SBHomeGestureFloatingSwitcherModifier *)self containerViewBounds];
  double v8 = fmin(fmax(fmin(fmax(v6 / (v7 * 0.25) + 0.0, 0.0), 1.0) + self->_multitaskingHintProgress, 0.0), 1.0);
  double v9 = v8 * 0.75 + (1.0 - v8) * 0.0;
  double v10 = [(SBHomeGestureFloatingSwitcherModifier *)self appLayouts];
  unint64_t v11 = [v10 count];

  if (v11 >= 4)
  {
    int v12 = [(SBHomeGestureFloatingSwitcherModifier *)self isRTLEnabled];
    double x = self->_translation.x;
    if (v12) {
      double x = -x;
    }
    if (x >= 0.0 && v11 - 1 == a4) {
      return 0.0;
    }
    if (x < 0.0 && v11 - 2 == a4) {
      return 0.0;
    }
  }
  return v9;
}

- (double)shadowOffsetForIndex:(unint64_t)a3
{
  double result = 0.0;
  if (!a3)
  {
    uint64_t v16 = v8;
    uint64_t v17 = v7;
    uint64_t v18 = v6;
    uint64_t v19 = v5;
    uint64_t v20 = v3;
    uint64_t v21 = v4;
    double v11 = fabs(self->_translation.x);
    [(SBHomeGestureFloatingSwitcherModifier *)self containerViewBounds];
    double v13 = fmin(fmax(fmin(fmax(v11 / (v12 * 0.25) + 0.0, 0.0), 1.0) + self->_multitaskingHintProgress, 0.0), 1.0);
    v15.receiver = self;
    v15.super_class = (Class)SBHomeGestureFloatingSwitcherModifier;
    [(SBHomeGestureFloatingSwitcherModifier *)&v15 shadowOffsetForIndex:0];
    return v13 * 0.0 + (1.0 - v13) * v14;
  }
  return result;
}

- (BOOL)isContentStatusBarVisibleForIndex:(unint64_t)a3
{
  return 0;
}

- (id)appLayoutsToCacheSnapshots
{
  if (self->_selectedAppLayout)
  {
    uint64_t v3 = [(SBHomeGestureFloatingSwitcherModifier *)self appLayouts];
    uint64_t v4 = [v3 indexOfObject:self->_selectedAppLayout];
  }
  else
  {
    uint64_t v4 = 0;
  }
  uint64_t v5 = [(SBHomeGestureFloatingSwitcherModifier *)self switcherSettings];
  uint64_t v6 = [v5 numberOfSnapshotsToCacheInSwitcher];

  return -[SBSwitcherModifier appLayoutsToCacheSnapshotsWithVisibleRange:numberOfSnapshotsToCache:biasForward:](self, "appLayoutsToCacheSnapshotsWithVisibleRange:numberOfSnapshotsToCache:biasForward:", v4, 1, v6, 1);
}

- (id)animationAttributesForLayoutElement:(id)a3
{
  id v4 = a3;
  v24.receiver = self;
  v24.super_class = (Class)SBHomeGestureFloatingSwitcherModifier;
  uint64_t v5 = [(SBGestureSwitcherModifier *)&v24 animationAttributesForLayoutElement:v4];
  if (![v4 switcherLayoutElementType])
  {
    uint64_t v6 = (void *)[v5 mutableCopy];
    uint64_t v7 = [v5 layoutSettings];
    uint64_t v8 = [(SBHomeGestureFloatingSwitcherModifier *)self _layoutSettingsForAppLayout:v4 layoutSettings:v7];
    [v6 setLayoutSettings:v8];

    uint64_t v5 = v6;
  }
  if (self->_rampingProperty && ![v4 switcherLayoutElementType])
  {
    double v9 = [(SBHomeGestureFloatingSwitcherModifier *)self appLayouts];
    unint64_t v10 = [v9 count];
    uint64_t v11 = [v9 indexOfObject:v4];
    if (v10 >= 2 && v11 == v10 - 1)
    {
      double v12 = (void *)[v5 mutableCopy];
      double v23 = [v12 layoutSettings];
      double v13 = (void *)[objc_alloc(MEMORY[0x1E4FA5F08]) initWithDefaultValues];
      double v14 = [(SBHomeGestureFloatingSwitcherModifier *)self switcherSettings];
      objc_super v15 = [v14 animationSettings];
      uint64_t v16 = [v15 arcSwipeSettings];

      [(UIViewFloatAnimatableProperty *)self->_rampingProperty presentationValue];
      double v18 = v17;
      [v16 response];
      double v20 = v19;
      [v23 trackingResponse];
      [v13 setTrackingResponse:v18 * v21 + (1.0 - v18) * v20];
      [v16 dampingRatio];
      objc_msgSend(v13, "setTrackingDampingRatio:");
      CAFrameRateRange v26 = CAFrameRateRangeMake(80.0, 120.0, 120.0);
      objc_msgSend(v13, "setFrameRateRange:highFrameRateReason:", 1114113, *(double *)&v26.minimum, *(double *)&v26.maximum, *(double *)&v26.preferred);
      [v12 setLayoutSettings:v13];

      uint64_t v5 = v12;
    }
  }
  return v5;
}

- (id)_layoutSettingsForAppLayout:(id)a3 layoutSettings:(id)a4
{
  id v6 = a4;
  if ([(SBAppLayout *)self->_selectedAppLayout isEqual:a3] || !self->_inMultitaskingChangedProperty)
  {
    id v10 = v6;
  }
  else
  {
    uint64_t v7 = [(SBHomeGestureFloatingSwitcherModifier *)self switcherSettings];
    uint64_t v8 = [v7 animationSettings];
    double v9 = [v8 cardFlyInSettings];

    id v10 = objc_alloc_init(MEMORY[0x1E4FA5F08]);
    [v10 setDefaultValues];
    if (self->_inMultitasking)
    {
      [(UIViewFloatAnimatableProperty *)self->_inMultitaskingChangedProperty presentationValue];
      double v12 = v11;
      double v13 = fabs(self->_translation.x);
      [(SBHomeGestureFloatingSwitcherModifier *)self containerViewBounds];
      double v15 = fmax(v13 / v14 + 0.0, 0.0);
      if (v15 >= 1.0) {
        double v16 = 0.0;
      }
      else {
        double v16 = 1.0 - v15;
      }
      double v17 = fmin(fmax(1.0 - (1.0 - v12) * v16, 0.0), 1.0);
    }
    else
    {
      double v17 = 0.0;
    }
    [v6 trackingResponse];
    double v19 = v18;
    [v9 response];
    double v21 = v17 * (v19 - v20);
    [v9 response];
    [v10 setTrackingResponse:v22 + v21];
    [v6 dampingRatio];
    objc_msgSend(v10, "setTrackingDampingRatio:");
    CAFrameRateRange v25 = CAFrameRateRangeMake(80.0, 120.0, 120.0);
    objc_msgSend(v10, "setFrameRateRange:highFrameRateReason:", 1114113, *(double *)&v25.minimum, *(double *)&v25.maximum, *(double *)&v25.preferred);
  }
  return v10;
}

- (id)appLayoutsToResignActive
{
  v2 = (void *)MEMORY[0x1E4F1C9E8];
  uint64_t v3 = (void *)MEMORY[0x1E4F1CAD0];
  id v4 = [(SBHomeGestureFloatingSwitcherModifier *)self appLayouts];
  uint64_t v5 = [v3 setWithArray:v4];
  id v6 = [v2 dictionaryWithObject:v5 forKey:&unk_1F334AB08];

  return v6;
}

- (id)keyboardSuppressionMode
{
  return +[SBSwitcherKeyboardSuppressionMode suppressionModeForAllScenes];
}

- (SBSwitcherAsyncRenderingAttributes)asyncRenderingAttributesForAppLayout:(id)a3
{
  return (SBSwitcherAsyncRenderingAttributes)SBSwitcherAsyncRenderingAttributesMake(1u, 1);
}

- (unint64_t)slideOverTongueState
{
  return 0;
}

- (unint64_t)slideOverTongueDirection
{
  if (SBFloatingConfigurationIsLeft(self->_floatingConfiguration)) {
    return 2;
  }
  else {
    return 1;
  }
}

- (id)appLayoutToAttachSlideOverTongue
{
  return self->_selectedAppLayout;
}

- (id)_updateInMultitaskingIfNeededWithEvent:(id)a3
{
  id v4 = a3;
  uint64_t v5 = objc_alloc_init(SBSwitcherModifierEventResponse);
  int inMultitasking = self->_inMultitasking;
  [v4 locationInContainerView];
  double v8 = v7;
  double v10 = v9;

  int v11 = -[SBHomeGestureFloatingSwitcherModifier _inMultitaskingForLocation:translation:](self, "_inMultitaskingForLocation:translation:", v8, v10, self->_translation.x, self->_translation.y);
  self->_int inMultitasking = v11;
  if (inMultitasking != v11)
  {
    if (v11)
    {
      self->_hasTriggeredCardFlyIn = 1;
      self->_translationYWhenTriggeredCardFlyIn = self->_translation.y;
    }
    double v12 = [(SBHomeGestureFloatingSwitcherModifier *)self switcherSettings];
    double v13 = [v12 animationSettings];
    double v14 = [v13 layoutSettings];
    [(SBHomeGestureFloatingSwitcherModifier *)self _beginAnimatingMultitaskingPropertyWithMode:3 settings:v14];
  }
  return v5;
}

- (BOOL)_hasPausedEnoughForFlyIn
{
  if ([(SBHomeGestureFinalDestinationSwitcherModifier *)self->_finalDestinationModifier hasSeenAccelerationDipForAppSwitcher])
  {
    return 1;
  }
  double v4 = *(double *)&kCardFlyInDelayAfterEnteringAppSwitcher_0;
  return self->_gestureHoldTimer > (unint64_t)(v4 * SBScreenMaximumFramesPerSecond());
}

- (BOOL)_hasTraveledSufficientDistanceForHomeOrAppSwitcher
{
  [(SBHomeGestureFloatingSwitcherModifier *)self containerViewBounds];
  return self->_lastTouchLocation.y <= v3 - *(double *)&kMinimumYDistanceForHomeOrAppSwitcher_1;
}

- (void)_displayLinkFired:(id)a3
{
  if ([(SBGestureSwitcherModifier *)self gesturePhase] == 2)
  {
    [(SBHomeGestureFloatingSwitcherModifier *)self gestureHandlingModifier:self averageVelocityOverDuration:0.0416666667];
    int64_t v4 = [(SBHomeGestureFinalDestinationSwitcherModifier *)self->_finalDestinationModifier currentFinalDestination];
    if (v4) {
      BOOL v5 = v4 == 4;
    }
    else {
      BOOL v5 = 1;
    }
    if (v5)
    {
      self->_gestureHoldTimer = 0;
    }
    else if (v4 == 3 && BSFloatLessThanFloat())
    {
      ++self->_gestureHoldTimer;
    }
    if (!self->_inMultitasking
      && [(SBHomeGestureFloatingSwitcherModifier *)self _hasPausedEnoughForFlyIn])
    {
      [(SBHomeGestureFloatingSwitcherModifier *)self gestureHandlingModifierRequestsUpdate:self];
    }
  }
}

- (void)_beginAnimatingMultitaskingPropertyWithMode:(int64_t)a3 settings:(id)a4
{
  id v6 = a4;
  inMultitaskingChangedPropertdouble y = self->_inMultitaskingChangedProperty;
  if (inMultitaskingChangedProperty)
  {
    [(UIViewFloatAnimatableProperty *)inMultitaskingChangedProperty invalidate];
    double v8 = self->_inMultitaskingChangedProperty;
    self->_inMultitaskingChangedPropertdouble y = 0;
  }
  double v9 = (UIViewFloatAnimatableProperty *)objc_alloc_init(MEMORY[0x1E4F43000]);
  double v10 = self->_inMultitaskingChangedProperty;
  self->_inMultitaskingChangedPropertdouble y = v9;

  [(UIViewFloatAnimatableProperty *)self->_inMultitaskingChangedProperty setValue:0.0];
  int v11 = (void *)[v6 copy];
  LODWORD(v12) = *MEMORY[0x1E4F39AF0];
  LODWORD(v13) = *(_DWORD *)(MEMORY[0x1E4F39AF0] + 4);
  LODWORD(v14) = *(_DWORD *)(MEMORY[0x1E4F39AF0] + 8);
  objc_msgSend(v11, "setFrameRateRange:highFrameRateReason:", 0, v12, v13, v14);
  id v15 = v11;

  objc_initWeak(&location, self);
  double v16 = self->_inMultitaskingChangedProperty;
  double v17 = (void *)MEMORY[0x1E4F42FF0];
  v22[0] = MEMORY[0x1E4F143A8];
  v22[1] = 3221225472;
  v22[2] = __94__SBHomeGestureFloatingSwitcherModifier__beginAnimatingMultitaskingPropertyWithMode_settings___block_invoke;
  v22[3] = &unk_1E6AF4AC0;
  v22[4] = self;
  v19[0] = MEMORY[0x1E4F143A8];
  v19[1] = 3221225472;
  v19[2] = __94__SBHomeGestureFloatingSwitcherModifier__beginAnimatingMultitaskingPropertyWithMode_settings___block_invoke_2;
  v19[3] = &unk_1E6AFBE70;
  objc_copyWeak(&v21, &location);
  double v18 = v16;
  double v20 = v18;
  objc_msgSend(v17, "sb_animateWithSettings:mode:animations:completion:", v15, a3, v22, v19);

  objc_destroyWeak(&v21);
  objc_destroyWeak(&location);
}

uint64_t __94__SBHomeGestureFloatingSwitcherModifier__beginAnimatingMultitaskingPropertyWithMode_settings___block_invoke(uint64_t a1)
{
  return [*(id *)(*(void *)(a1 + 32) + 208) setValue:1.0];
}

void __94__SBHomeGestureFloatingSwitcherModifier__beginAnimatingMultitaskingPropertyWithMode_settings___block_invoke_2(uint64_t a1)
{
  WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 40));
  if (WeakRetained)
  {
    id v6 = WeakRetained;
    id v3 = WeakRetained[26];
    int64_t v4 = v3;
    if (v3 && v3 == *(id *)(a1 + 32))
    {
      id v5 = v6[26];
      v6[26] = 0;
    }
    WeakRetained = v6;
  }
}

- (BOOL)_inMultitaskingForLocation:(CGPoint)a3 translation:(CGPoint)a4
{
  double y = a4.y;
  double x = a4.x;
  BOOL inMultitasking = self->_inMultitasking;
  int64_t v8 = [(SBHomeGestureFinalDestinationSwitcherModifier *)self->_finalDestinationModifier currentFinalDestination];
  char v10 = inMultitasking || (unint64_t)(v8 - 1) < 2;
  int v11 = [(SBHomeGestureFloatingSwitcherModifier *)self appLayouts];
  uint64_t v12 = [v11 count];

  if (fabs(x) <= fabs(y) || v8 == 4) {
    char v14 = v10;
  }
  else {
    char v14 = 1;
  }
  if (v12) {
    char v15 = v14;
  }
  else {
    char v15 = v10;
  }
  char v16 = [(SBHomeGestureFloatingSwitcherModifier *)self _hasPausedEnoughForFlyIn] | v15;
  return v16 & ~[(SBHomeGestureFloatingSwitcherModifier *)self _isTranslationPastDistanceThresholdToUnconditionallyGoHome:y];
}

- (BOOL)_isTranslationPastDistanceThresholdToUnconditionallyGoHome:(double)a3
{
  double v3 = -a3;
  [(SBHomeGestureFloatingSwitcherModifier *)self unconditionalDistanceThresholdForHome];
  return v4 < v3;
}

- (double)_gestureProgressToMaxTranslationForTranslation:(double)a3
{
  [(SBHomeGestureFloatingSwitcherModifier *)self _distanceYToMaxTranslation];
  return -a3 / v4;
}

- (double)_distanceYToInSwitcherCardScale
{
  [(SBHomeGestureFloatingSwitcherModifier *)self _switcherCardScale];
  double v4 = v3;
  [(SBHomeGestureFloatingSwitcherModifier *)self _inSwitcherCenterYOffsetWhenPresented];
  double v6 = v5;
  [(SBHomeGestureFloatingSwitcherModifier *)self containerViewBounds];
  return (1.0 - v4) * v7 * 0.5 - v6;
}

- (double)_distanceYToMaxTranslation
{
  [(SBHomeGestureFloatingSwitcherModifier *)self containerViewBounds];
  double v4 = v3;
  [(SBHomeGestureFloatingSwitcherModifier *)self _centerYOffsetDuringGesture];
  return v4 * 0.5 - v5;
}

- (double)_inSwitcherCenterYOffsetWhenPresented
{
  double v3 = [(SBHomeGestureFloatingSwitcherModifier *)self switcherSettings];
  [v3 switcherCenterYOffsetPercentOfScreenHeight];

  [(SBHomeGestureFloatingSwitcherModifier *)self containerViewBounds];
  [(SBHomeGestureFloatingSwitcherModifier *)self screenScale];
  BSFloatRoundForScale();
  return result;
}

- (double)_centerYOffsetDuringGesture
{
  double v3 = [(SBHomeGestureFloatingSwitcherModifier *)self homeGestureSettings];
  [v3 homeGestureCenterZoomDownCenterYOffsetFactor];
  [(SBHomeGestureFloatingSwitcherModifier *)self containerViewBounds];
  [(SBHomeGestureFloatingSwitcherModifier *)self screenScale];
  BSFloatRoundForScale();
  double v5 = v4;

  return v5;
}

- (double)_switcherCardScale
{
  v2 = [(SBHomeGestureFloatingSwitcherModifier *)self switcherSettings];
  [v2 deckSwitcherPageScale];
  double v4 = v3;

  return v4;
}

- (unint64_t)_selectedAppLayoutIndex
{
  double v3 = [(SBHomeGestureFloatingSwitcherModifier *)self appLayouts];
  double v4 = v3;
  if (v3 && self->_selectedAppLayout) {
    unint64_t v5 = objc_msgSend(v3, "indexOfObject:");
  }
  else {
    unint64_t v5 = 0x7FFFFFFFFFFFFFFFLL;
  }

  return v5;
}

- (BOOL)_isSelectedAppLayoutAtIndex:(unint64_t)a3
{
  double v4 = self;
  unint64_t v5 = [(SBHomeGestureFloatingSwitcherModifier *)self appLayouts];
  double v6 = [v5 objectAtIndex:a3];

  LOBYTE(v4) = [v6 isEqual:v4->_selectedAppLayout];
  return (char)v4;
}

- (void)_applyPrototypeSettings
{
  double v3 = SBMainScreenPointsPerMillimeter();
  id v9 = [(SBHomeGestureFloatingSwitcherModifier *)self homeGestureSettings];
  [v9 normalizedDistanceYThresholdForUnconditionalHomeInSlideOver];
  kHomeGestureNormalizedDistanceYThresholdForUnconditionalHome_0 = v4;
  [v9 normalizedDistanceYThresholdRangeForUnconditionalHomeInSlideOver];
  kHomeGestureNormalizedDistanceYThresholdRangeForUnconditionalHome_0 = v5;
  [v9 pauseVelocityThresholdForAppSwitcher];
  [v9 velocityXThresholdForUnconditionalArcSwipe];
  [v9 minimumYDistanceForHomeOrAppSwitcher];
  *(double *)&kMinimumYDistanceForHomeOrAppSwitcher_1 = v3 * v6;
  [v9 cardFlyInMaximumVelocityThreshold];
  *(double *)&kCardFlyInMaximumVelocityThreshold_0 = v3 * v7;
  [v9 cardFlyInDelayAfterEnteringAppSwitcher];
  kCardFlyInDelayAfterEnteringAppSwitcher_0 = v8;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_displayLink, 0);
  objc_storeStrong((id *)&self->_inMultitaskingChangedProperty, 0);
  objc_storeStrong((id *)&self->_rampingProperty, 0);
  objc_storeStrong((id *)&self->_selectedAppLayout, 0);
  objc_storeStrong((id *)&self->_dismissSiriModifier, 0);
  objc_storeStrong((id *)&self->_finalDestinationModifier, 0);
  objc_storeStrong((id *)&self->_stackedLayoutModifier, 0);
}

@end