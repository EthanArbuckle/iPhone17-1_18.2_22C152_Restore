@interface SBRevealContinuousExposeStripOverflowGestureModifier
- (BOOL)_hideDock;
- (BOOL)shouldPinLayoutRolesToSpace:(unint64_t)a3;
- (BOOL)shouldUpdateAnimatableProperty:(id)a3;
- (BOOL)shouldUseAnchorPointToPinLayoutRolesToSpace:(unint64_t)a3;
- (CGPoint)adjustedSpaceAccessoryViewAnchorPoint:(CGPoint)a3 forAppLayout:(id)a4;
- (CGPoint)anchorPointForIndex:(unint64_t)a3;
- (CGRect)adjustedSpaceAccessoryViewFrame:(CGRect)a3 forAppLayout:(id)a4;
- (CGRect)frameForIndex:(unint64_t)a3;
- (CGRect)frameForLayoutRole:(int64_t)a3 inAppLayout:(id)a4 withBounds:(CGRect)a5;
- (SBAppLayout)initialAppLayout;
- (SBRevealContinuousExposeStripOverflowGestureModifier)initWithGestureID:(id)a3 initialAppLayout:(id)a4;
- (SBSwitcherWallpaperGradientAttributes)wallpaperGradientAttributesForIndex:(unint64_t)a3;
- (UIRectCornerRadii)cornerRadiiForIndex:(unint64_t)a3;
- (double)_finalScaleForFullScreenAppLayout;
- (double)contentPageViewScaleForAppLayout:(id)a3 withScale:(double)a4;
- (double)dimmingAlphaForLayoutRole:(int64_t)a3 inAppLayout:(id)a4;
- (double)modelValueForAnimatableProperty:(id)a3 currentValue:(double)a4 creating:(BOOL)a5;
- (double)opacityForLayoutRole:(int64_t)a3 inAppLayout:(id)a4 atIndex:(unint64_t)a5;
- (double)perspectiveAngleForAppLayout:(id)a3;
- (double)scaleForIndex:(unint64_t)a3;
- (double)scaleForLayoutRole:(int64_t)a3 inAppLayout:(id)a4;
- (double)shadowOpacityForLayoutRole:(int64_t)a3 atIndex:(unint64_t)a4;
- (double)titleOpacityForIndex:(unint64_t)a3;
- (id)_appSwitcherDefaults;
- (id)_layoutSettingsForAppLayout:(id)a3;
- (id)animatablePropertyIdentifiers;
- (id)animationAttributesForLayoutElement:(id)a3;
- (id)handleGestureEvent:(id)a3;
- (id)handleTransitionEvent:(id)a3;
- (id)visibleAppLayouts;
- (int64_t)updateModeForAnimatableProperty:(id)a3;
@end

@implementation SBRevealContinuousExposeStripOverflowGestureModifier

- (SBRevealContinuousExposeStripOverflowGestureModifier)initWithGestureID:(id)a3 initialAppLayout:(id)a4
{
  id v8 = a4;
  v12.receiver = self;
  v12.super_class = (Class)SBRevealContinuousExposeStripOverflowGestureModifier;
  v9 = [(SBGestureSwitcherModifier *)&v12 initWithGestureID:a3];
  if (v9)
  {
    if (!v8)
    {
      v11 = [MEMORY[0x1E4F28B00] currentHandler];
      [v11 handleFailureInMethod:a2, v9, @"SBRevealContinuousExposeStripOverflowGestureModifier.m", 44, @"Invalid parameter not satisfying: %@", @"initialAppLayout" object file lineNumber description];
    }
    objc_storeStrong((id *)&v9->_initialAppLayout, a4);
  }

  return v9;
}

- (id)animationAttributesForLayoutElement:(id)a3
{
  id v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)SBRevealContinuousExposeStripOverflowGestureModifier;
  v5 = [(SBGestureSwitcherModifier *)&v9 animationAttributesForLayoutElement:v4];
  if (![v4 switcherLayoutElementType])
  {
    v6 = (void *)[v5 mutableCopy];
    v7 = [(SBRevealContinuousExposeStripOverflowGestureModifier *)self _layoutSettingsForAppLayout:v4];
    [v6 setLayoutSettings:v7];

    v5 = v6;
  }

  return v5;
}

- (id)_layoutSettingsForAppLayout:(id)a3
{
  id v4 = objc_alloc_init(MEMORY[0x1E4FA5F08]);
  [v4 setDefaultValues];
  if (self->_showingAppSwitcherLayout)
  {
    [v4 setTrackingResponse:0.15];
    [v4 setTrackingDampingRatio:0.85];
  }
  if (self->_beginAnimatingAppSwitcherLayoutProperty)
  {
    [(SBRevealContinuousExposeStripOverflowGestureModifier *)self presentationValueForAnimatableProperty:@"SBRevealContinuousExposeStripOverflowGestureModifierAnimatablePropertyIdentifier"];
    double v6 = v5;
    id v7 = objc_alloc_init(MEMORY[0x1E4FA5F08]);
    [v7 setDefaultValues];
    [v4 trackingResponse];
    double v9 = v8;
    [v7 response];
    double v11 = v6 * (v9 - v10);
    [v7 response];
    [v7 setTrackingResponse:v12 + v11];

    id v4 = v7;
  }
  CAFrameRateRange v15 = CAFrameRateRangeMake(80.0, 120.0, 120.0);
  objc_msgSend(v4, "setFrameRateRange:highFrameRateReason:", 1114113, *(double *)&v15.minimum, *(double *)&v15.maximum, *(double *)&v15.preferred);
  return v4;
}

- (id)handleGestureEvent:(id)a3
{
  uint64_t v41 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v39.receiver = self;
  v39.super_class = (Class)SBRevealContinuousExposeStripOverflowGestureModifier;
  double v5 = [(SBGestureSwitcherModifier *)&v39 handleGestureEvent:v4];
  [v4 translationInContainerView];
  self->_translation = fabs(v6);
  if ([v4 phase] == 1)
  {
    id v7 = objc_alloc_init(SBAppSwitcherContinuousExposeSwitcherModifier);
    continuousExposeAppSwitcherModifier = self->_continuousExposeAppSwitcherModifier;
    self->_continuousExposeAppSwitcherModifier = &v7->super;

    double v9 = [(SBAppLayout *)self->_initialAppLayout itemForLayoutRole:1];
    double v10 = [v9 bundleIdentifier];
    double v11 = (NSString *)[v10 copy];
    appExposeBundleIdentifier = self->_appExposeBundleIdentifier;
    self->_appExposeBundleIdentifier = v11;

    v13 = [v4 selectedAppLayout];
    initialAppLayout = self->_initialAppLayout;
    self->_initialAppLayout = v13;

    self->_int showingAppSwitcherLayout = 0;
    CAFrameRateRange v15 = [(SBRevealContinuousExposeStripOverflowGestureModifier *)self chamoisLayoutAttributes];
    [v15 stripWidth];
    self->_stripWidth = v16;

    goto LABEL_24;
  }
  if ([v4 phase] != 2)
  {
    if ([v4 phase] != 3) {
      goto LABEL_24;
    }
    if (([v4 isCanceled] & 1) != 0 || self->_translation <= 0.0)
    {
      v32 = +[SBSwitcherTransitionRequest requestForActivatingAppLayout:self->_initialAppLayout];
      v33 = [[SBPerformTransitionSwitcherEventResponse alloc] initWithTransitionRequest:v32 gestureInitiated:1];
      v22 = SBAppendSwitcherModifierResponse(v33, v5);

LABEL_23:
      double v5 = v22;
      goto LABEL_24;
    }
    v19 = [SBPerformTransitionSwitcherEventResponse alloc];
    v20 = +[SBSwitcherTransitionRequest requestForActivatingAppSwitcher];
    v21 = [(SBPerformTransitionSwitcherEventResponse *)v19 initWithTransitionRequest:v20 gestureInitiated:1];

    v22 = SBAppendSwitcherModifierResponse(v21, v5);

    long long v37 = 0u;
    long long v38 = 0u;
    long long v35 = 0u;
    long long v36 = 0u;
    v23 = [(SBRevealContinuousExposeStripOverflowGestureModifier *)self appLayouts];
    uint64_t v24 = [v23 countByEnumeratingWithState:&v35 objects:v40 count:16];
    if (v24)
    {
      uint64_t v25 = v24;
      id v26 = 0;
      uint64_t v27 = *(void *)v36;
LABEL_11:
      uint64_t v28 = 0;
      v29 = v26;
      while (1)
      {
        if (*(void *)v36 != v27) {
          objc_enumerationMutation(v23);
        }
        id v26 = *(id *)(*((void *)&v35 + 1) + 8 * v28);

        if ([v26 environment] == 1) {
          break;
        }
        ++v28;
        v29 = v26;
        if (v25 == v28)
        {
          uint64_t v25 = [v23 countByEnumeratingWithState:&v35 objects:v40 count:16];
          if (v25) {
            goto LABEL_11;
          }
          break;
        }
      }

      if (!v26) {
        goto LABEL_22;
      }
      v30 = [[SBScrollToAppLayoutSwitcherEventResponse alloc] initWithAppLayout:v26 alignment:0 animated:0];
      uint64_t v31 = SBAppendSwitcherModifierResponse(v30, v22);

      v22 = (void *)v31;
    }
    else
    {
      id v26 = v23;
    }

LABEL_22:
    goto LABEL_23;
  }
  int showingAppSwitcherLayout = self->_showingAppSwitcherLayout;
  int v18 = self->_translation > self->_stripWidth;
  self->_int showingAppSwitcherLayout = v18;
  if (showingAppSwitcherLayout != v18) {
    self->_beginAnimatingAppSwitcherLayoutProperty = 1;
  }
LABEL_24:

  return v5;
}

- (id)handleTransitionEvent:(id)a3
{
  v8.receiver = self;
  v8.super_class = (Class)SBRevealContinuousExposeStripOverflowGestureModifier;
  id v4 = a3;
  double v5 = [(SBGestureSwitcherModifier *)&v8 handleTransitionEvent:v4];
  unint64_t v6 = objc_msgSend(v4, "phase", v8.receiver, v8.super_class);

  if (v6 >= 2) {
    [(SBChainableModifier *)self setState:1];
  }
  return v5;
}

- (double)scaleForIndex:(unint64_t)a3
{
  uint64_t v17 = 0;
  int v18 = (double *)&v17;
  uint64_t v19 = 0x2020000000;
  uint64_t v20 = 0;
  v16.receiver = self;
  v16.super_class = (Class)SBRevealContinuousExposeStripOverflowGestureModifier;
  -[SBRevealContinuousExposeStripOverflowGestureModifier scaleForIndex:](&v16, sel_scaleForIndex_);
  uint64_t v20 = v5;
  if (self->_showingAppSwitcherLayout)
  {
    continuousExposeAppSwitcherModifier = self->_continuousExposeAppSwitcherModifier;
    v15[0] = MEMORY[0x1E4F143A8];
    v15[1] = 3221225472;
    v15[2] = __70__SBRevealContinuousExposeStripOverflowGestureModifier_scaleForIndex___block_invoke;
    v15[3] = &unk_1E6AF6358;
    v15[4] = self;
    v15[5] = &v17;
    v15[6] = a3;
    [(SBChainableModifier *)self performTransactionWithTemporaryChildModifier:continuousExposeAppSwitcherModifier usingBlock:v15];
  }
  id v7 = [(SBRevealContinuousExposeStripOverflowGestureModifier *)self appLayouts];
  objc_super v8 = [v7 objectAtIndex:a3];

  if ([(SBAppLayout *)self->_initialAppLayout isOrContainsAppLayout:v8])
  {
    BSUIConstrainValueToIntervalWithRubberBand();
    double v10 = v9;
    double stripWidth = self->_stripWidth;
    [(SBRevealContinuousExposeStripOverflowGestureModifier *)self _finalScaleForFullScreenAppLayout];
    double v13 = ((v12 + -1.0) * (v10 * (stripWidth + stripWidth) + 0.0) + 1.0) * v18[3];
    v18[3] = v13;
  }
  else
  {
    double v13 = v18[3];
  }

  _Block_object_dispose(&v17, 8);
  return v13;
}

uint64_t __70__SBRevealContinuousExposeStripOverflowGestureModifier_scaleForIndex___block_invoke(void *a1)
{
  uint64_t result = [*(id *)(a1[4] + 144) scaleForIndex:a1[6]];
  *(void *)(*(void *)(a1[5] + 8) + 24) = v3;
  return result;
}

- (CGRect)frameForIndex:(unint64_t)a3
{
  uint64_t v58 = 0;
  v59 = (double *)&v58;
  uint64_t v60 = 0x4010000000;
  v61 = &unk_1D90ED3C6;
  long long v62 = 0u;
  long long v63 = 0u;
  v57.receiver = self;
  v57.super_class = (Class)SBRevealContinuousExposeStripOverflowGestureModifier;
  -[SBRevealContinuousExposeStripOverflowGestureModifier frameForIndex:](&v57, sel_frameForIndex_);
  *(void *)&long long v62 = v5;
  *((void *)&v62 + 1) = v6;
  *(void *)&long long v63 = v7;
  *((void *)&v63 + 1) = v8;
  if (self->_showingAppSwitcherLayout)
  {
    continuousExposeAppSwitcherModifier = self->_continuousExposeAppSwitcherModifier;
    v56[0] = MEMORY[0x1E4F143A8];
    v56[1] = 3221225472;
    v56[2] = __70__SBRevealContinuousExposeStripOverflowGestureModifier_frameForIndex___block_invoke;
    v56[3] = &unk_1E6AF6358;
    v56[4] = self;
    v56[5] = &v58;
    v56[6] = a3;
    [(SBChainableModifier *)self performTransactionWithTemporaryChildModifier:continuousExposeAppSwitcherModifier usingBlock:v56];
  }
  double v10 = [(SBRevealContinuousExposeStripOverflowGestureModifier *)self appLayouts];
  double v11 = [v10 objectAtIndex:a3];

  if ([(SBAppLayout *)self->_initialAppLayout isOrContainsAppLayout:v11])
  {
    BSUIConstrainValueToIntervalWithRubberBand();
    double v13 = v12;
    double stripWidth = self->_stripWidth;
    [(SBRevealContinuousExposeStripOverflowGestureModifier *)self _finalScaleForFullScreenAppLayout];
    double v16 = v15;
    uint64_t v17 = [(SBSwitcherModifier *)self autoLayoutSpaceForAppLayout:self->_initialAppLayout];
    int v18 = [v17 configuration];
    [v18 containerBounds];
    CGFloat v20 = v19;
    CGFloat v22 = v21;
    double v24 = v23;
    CGFloat v26 = v25;

    [(SBRevealContinuousExposeStripOverflowGestureModifier *)self containerViewBounds];
    double v54 = v27;
    double v55 = v16;
    double v28 = v13;
    double v29 = stripWidth;
    v64.origin.x = v20;
    v64.origin.y = v22;
    v64.size.width = v24;
    v64.size.height = v26;
    double MaxX = CGRectGetMaxX(v64);
    double v30 = v59[4];
    v65.origin.x = v20;
    v65.origin.y = v22;
    v65.size.width = v24;
    v65.size.height = v26;
    double MidX = CGRectGetMidX(v65);
    v32 = (id *)MEMORY[0x1E4F43630];
    uint64_t v33 = [(id)*MEMORY[0x1E4F43630] userInterfaceLayoutDirection];
    double v34 = v28 * (v29 + v29) + 0.0;
    double v35 = 1.0 - ((v55 + -1.0) * v34 + 1.0);
    double v36 = -(v35 * (v30 - MidX));
    if (v33 != 1) {
      double v36 = v35 * (v30 - MidX);
    }
    double v37 = v59[5];
    v59[4] = v59[4] - v36;
    v66.origin.x = v20;
    v66.origin.y = v22;
    v66.size.width = v24;
    v66.size.height = v26;
    v59[5] = v59[5] - v35 * (v37 - CGRectGetMidY(v66));
    uint64_t v38 = [*v32 userInterfaceLayoutDirection];
    double v39 = v34 * ((1.0 - v55) * v24 * 0.5 + v54 - MaxX) + 0.0;
    if (v38 == 1) {
      double v39 = -v39;
    }
    v59[4] = v39 + v59[4];
  }
  else
  {
    if ([(id)*MEMORY[0x1E4F43630] userInterfaceLayoutDirection] == 1)
    {
      v40 = [(SBRevealContinuousExposeStripOverflowGestureModifier *)self chamoisLayoutAttributes];
      [v40 screenEdgePadding];
      BSUIConstrainValueToIntervalWithRubberBand();
      uint64_t v41 = v59;
      double v43 = v59[4] - v42;
    }
    else
    {
      v40 = [(SBRevealContinuousExposeStripOverflowGestureModifier *)self chamoisLayoutAttributes];
      [v40 screenEdgePadding];
      BSUIConstrainValueToIntervalWithRubberBand();
      uint64_t v41 = v59;
      double v43 = v44 + v59[4];
    }
    v41[4] = v43;
  }
  double v45 = v59[4];
  double v46 = v59[5];
  double v47 = v59[6];
  double v48 = v59[7];

  _Block_object_dispose(&v58, 8);
  double v49 = v45;
  double v50 = v46;
  double v51 = v47;
  double v52 = v48;
  result.size.height = v52;
  result.size.width = v51;
  result.origin.y = v50;
  result.origin.x = v49;
  return result;
}

uint64_t __70__SBRevealContinuousExposeStripOverflowGestureModifier_frameForIndex___block_invoke(void *a1)
{
  uint64_t result = [*(id *)(a1[4] + 144) frameForIndex:a1[6]];
  uint64_t v3 = *(void **)(a1[5] + 8);
  v3[4] = v4;
  v3[5] = v5;
  v3[6] = v6;
  v3[7] = v7;
  return result;
}

- (CGPoint)anchorPointForIndex:(unint64_t)a3
{
  uint64_t v13 = 0;
  v14 = (double *)&v13;
  uint64_t v15 = 0x3010000000;
  uint64_t v17 = 0;
  uint64_t v18 = 0;
  double v16 = &unk_1D90ED3C6;
  if (self->_showingAppSwitcherLayout)
  {
    continuousExposeAppSwitcherModifier = self->_continuousExposeAppSwitcherModifier;
    v12[0] = MEMORY[0x1E4F143A8];
    v12[1] = 3221225472;
    v12[2] = __76__SBRevealContinuousExposeStripOverflowGestureModifier_anchorPointForIndex___block_invoke;
    v12[3] = &unk_1E6AF6358;
    v12[4] = self;
    v12[5] = &v13;
    v12[6] = a3;
    [(SBChainableModifier *)self performTransactionWithTemporaryChildModifier:continuousExposeAppSwitcherModifier usingBlock:v12];
    double v4 = v14[4];
    double v5 = v14[5];
  }
  else
  {
    v11.receiver = self;
    v11.super_class = (Class)SBRevealContinuousExposeStripOverflowGestureModifier;
    [(SBRevealContinuousExposeStripOverflowGestureModifier *)&v11 anchorPointForIndex:a3];
    double v4 = v6;
    double v5 = v7;
    uint64_t v8 = v14;
    v14[4] = v6;
    v8[5] = v7;
  }
  _Block_object_dispose(&v13, 8);
  double v9 = v4;
  double v10 = v5;
  result.y = v10;
  result.x = v9;
  return result;
}

uint64_t __76__SBRevealContinuousExposeStripOverflowGestureModifier_anchorPointForIndex___block_invoke(void *a1)
{
  uint64_t result = [*(id *)(a1[4] + 144) anchorPointForIndex:a1[6]];
  uint64_t v3 = *(void *)(a1[5] + 8);
  *(void *)(v3 + 32) = v4;
  *(void *)(v3 + 40) = v5;
  return result;
}

- (UIRectCornerRadii)cornerRadiiForIndex:(unint64_t)a3
{
  uint64_t v19 = 0;
  CGFloat v20 = (double *)&v19;
  uint64_t v21 = 0x4010000000;
  CGFloat v22 = &unk_1D90ED3C6;
  long long v23 = 0u;
  long long v24 = 0u;
  if (self->_showingAppSwitcherLayout)
  {
    continuousExposeAppSwitcherModifier = self->_continuousExposeAppSwitcherModifier;
    v18[0] = MEMORY[0x1E4F143A8];
    v18[1] = 3221225472;
    v18[2] = __76__SBRevealContinuousExposeStripOverflowGestureModifier_cornerRadiiForIndex___block_invoke;
    v18[3] = &unk_1E6AF6358;
    v18[4] = self;
    v18[5] = &v19;
    v18[6] = a3;
    [(SBChainableModifier *)self performTransactionWithTemporaryChildModifier:continuousExposeAppSwitcherModifier usingBlock:v18];
    double v4 = v20[4];
    double v5 = v20[5];
    double v6 = v20[6];
    double v7 = v20[7];
  }
  else
  {
    v17.receiver = self;
    v17.super_class = (Class)SBRevealContinuousExposeStripOverflowGestureModifier;
    [(SBRevealContinuousExposeStripOverflowGestureModifier *)&v17 cornerRadiiForIndex:a3];
    double v4 = v8;
    double v5 = v9;
    double v6 = v10;
    double v7 = v11;
    double v12 = v20;
    v20[4] = v8;
    v12[5] = v9;
    v12[6] = v10;
    void v12[7] = v11;
  }
  _Block_object_dispose(&v19, 8);
  double v13 = v4;
  double v14 = v5;
  double v15 = v6;
  double v16 = v7;
  result.topRight = v16;
  result.bottomRight = v15;
  result.bottomLeft = v14;
  result.topLeft = v13;
  return result;
}

uint64_t __76__SBRevealContinuousExposeStripOverflowGestureModifier_cornerRadiiForIndex___block_invoke(void *a1)
{
  uint64_t result = [*(id *)(a1[4] + 144) cornerRadiiForIndex:a1[6]];
  uint64_t v3 = *(void **)(a1[5] + 8);
  v3[4] = v4;
  v3[5] = v5;
  v3[6] = v6;
  v3[7] = v7;
  return result;
}

- (double)perspectiveAngleForAppLayout:(id)a3
{
  id v4 = a3;
  uint64_t v16 = 0;
  objc_super v17 = (double *)&v16;
  uint64_t v18 = 0x2020000000;
  uint64_t v19 = 0;
  v15.receiver = self;
  v15.super_class = (Class)SBRevealContinuousExposeStripOverflowGestureModifier;
  [(SBRevealContinuousExposeStripOverflowGestureModifier *)&v15 perspectiveAngleForAppLayout:v4];
  uint64_t v19 = v5;
  double translation = self->_translation;
  double stripWidth = self->_stripWidth;
  if (self->_showingAppSwitcherLayout)
  {
    continuousExposeAppSwitcherModifier = self->_continuousExposeAppSwitcherModifier;
    v12[0] = MEMORY[0x1E4F143A8];
    v12[1] = 3221225472;
    v12[2] = __85__SBRevealContinuousExposeStripOverflowGestureModifier_perspectiveAngleForAppLayout___block_invoke;
    v12[3] = &unk_1E6AF6380;
    double v14 = &v16;
    v12[4] = self;
    id v13 = v4;
    [(SBChainableModifier *)self performTransactionWithTemporaryChildModifier:continuousExposeAppSwitcherModifier usingBlock:v12];
  }
  BOOL v9 = [(SBAppLayout *)self->_initialAppLayout isOrContainsAppLayout:v4];
  double v10 = v17[3];
  if (!v9)
  {
    double v10 = v10 + fmin(fmax(translation / stripWidth + 0.0, 0.0), 1.0) * (v10 * 0.5 - v10);
    v17[3] = v10;
  }
  _Block_object_dispose(&v16, 8);

  return v10;
}

uint64_t __85__SBRevealContinuousExposeStripOverflowGestureModifier_perspectiveAngleForAppLayout___block_invoke(void *a1)
{
  uint64_t result = [*(id *)(a1[4] + 144) perspectiveAngleForAppLayout:a1[5]];
  *(void *)(*(void *)(a1[6] + 8) + 24) = v3;
  return result;
}

- (id)visibleAppLayouts
{
  uint64_t v9 = 0;
  double v10 = &v9;
  uint64_t v11 = 0x3032000000;
  double v12 = __Block_byref_object_copy__0;
  id v13 = __Block_byref_object_dispose__0;
  id v14 = 0;
  if (self->_showingAppSwitcherLayout)
  {
    continuousExposeAppSwitcherModifier = self->_continuousExposeAppSwitcherModifier;
    v8[0] = MEMORY[0x1E4F143A8];
    v8[1] = 3221225472;
    v8[2] = __73__SBRevealContinuousExposeStripOverflowGestureModifier_visibleAppLayouts__block_invoke;
    v8[3] = &unk_1E6AF4B88;
    v8[4] = self;
    v8[5] = &v9;
    [(SBChainableModifier *)self performTransactionWithTemporaryChildModifier:continuousExposeAppSwitcherModifier usingBlock:v8];
  }
  else
  {
    v7.receiver = self;
    v7.super_class = (Class)SBRevealContinuousExposeStripOverflowGestureModifier;
    uint64_t v3 = [(SBRevealContinuousExposeStripOverflowGestureModifier *)&v7 visibleAppLayouts];
    id v4 = (void *)v10[5];
    v10[5] = v3;
  }
  id v5 = (id)v10[5];
  _Block_object_dispose(&v9, 8);

  return v5;
}

void __73__SBRevealContinuousExposeStripOverflowGestureModifier_visibleAppLayouts__block_invoke(uint64_t a1)
{
  uint64_t v2 = [*(id *)(*(void *)(a1 + 32) + 144) visibleAppLayouts];
  uint64_t v3 = *(void *)(*(void *)(a1 + 40) + 8);
  id v4 = *(void **)(v3 + 40);
  *(void *)(v3 + 40) = v2;
}

- (CGRect)frameForLayoutRole:(int64_t)a3 inAppLayout:(id)a4 withBounds:(CGRect)a5
{
  double height = a5.size.height;
  double width = a5.size.width;
  double y = a5.origin.y;
  double x = a5.origin.x;
  id v11 = a4;
  double v12 = v11;
  uint64_t v36 = 0;
  double v37 = (double *)&v36;
  uint64_t v38 = 0x4010000000;
  double v39 = &unk_1D90ED3C6;
  long long v40 = 0u;
  long long v41 = 0u;
  if (self->_showingAppSwitcherLayout)
  {
    continuousExposeAppSwitcherModifier = self->_continuousExposeAppSwitcherModifier;
    v28[0] = MEMORY[0x1E4F143A8];
    v28[1] = 3221225472;
    v28[2] = __98__SBRevealContinuousExposeStripOverflowGestureModifier_frameForLayoutRole_inAppLayout_withBounds___block_invoke;
    v28[3] = &unk_1E6AF63A8;
    double v30 = &v36;
    int64_t v31 = a3;
    v28[4] = self;
    id v29 = v11;
    double v32 = x;
    double v33 = y;
    double v34 = width;
    double v35 = height;
    [(SBChainableModifier *)self performTransactionWithTemporaryChildModifier:continuousExposeAppSwitcherModifier usingBlock:v28];

    double v14 = v37[4];
    double v15 = v37[5];
    double v16 = v37[6];
    double v17 = v37[7];
  }
  else
  {
    v27.receiver = self;
    v27.super_class = (Class)SBRevealContinuousExposeStripOverflowGestureModifier;
    -[SBRevealContinuousExposeStripOverflowGestureModifier frameForLayoutRole:inAppLayout:withBounds:](&v27, sel_frameForLayoutRole_inAppLayout_withBounds_, a3, v11, x, y, width, height);
    double v14 = v18;
    double v15 = v19;
    double v16 = v20;
    double v17 = v21;
    CGFloat v22 = v37;
    v37[4] = v18;
    v22[5] = v19;
    v22[6] = v20;
    v22[7] = v21;
  }
  _Block_object_dispose(&v36, 8);

  double v23 = v14;
  double v24 = v15;
  double v25 = v16;
  double v26 = v17;
  result.size.double height = v26;
  result.size.double width = v25;
  result.origin.double y = v24;
  result.origin.double x = v23;
  return result;
}

uint64_t __98__SBRevealContinuousExposeStripOverflowGestureModifier_frameForLayoutRole_inAppLayout_withBounds___block_invoke(uint64_t a1)
{
  uint64_t result = objc_msgSend(*(id *)(*(void *)(a1 + 32) + 144), "frameForLayoutRole:inAppLayout:withBounds:", *(void *)(a1 + 56), *(void *)(a1 + 40), *(double *)(a1 + 64), *(double *)(a1 + 72), *(double *)(a1 + 80), *(double *)(a1 + 88));
  uint64_t v3 = *(void **)(*(void *)(a1 + 48) + 8);
  v3[4] = v4;
  v3[5] = v5;
  v3[6] = v6;
  v3[7] = v7;
  return result;
}

- (double)scaleForLayoutRole:(int64_t)a3 inAppLayout:(id)a4
{
  id v6 = a4;
  uint64_t v7 = v6;
  uint64_t v17 = 0;
  double v18 = (double *)&v17;
  uint64_t v19 = 0x2020000000;
  uint64_t v20 = 0;
  if (self->_showingAppSwitcherLayout)
  {
    continuousExposeAppSwitcherModifier = self->_continuousExposeAppSwitcherModifier;
    v13[0] = MEMORY[0x1E4F143A8];
    v13[1] = 3221225472;
    v13[2] = __87__SBRevealContinuousExposeStripOverflowGestureModifier_scaleForLayoutRole_inAppLayout___block_invoke;
    v13[3] = &unk_1E6AF63D0;
    double v15 = &v17;
    int64_t v16 = a3;
    v13[4] = self;
    id v14 = v6;
    [(SBChainableModifier *)self performTransactionWithTemporaryChildModifier:continuousExposeAppSwitcherModifier usingBlock:v13];

    double v9 = v18[3];
  }
  else
  {
    v12.receiver = self;
    v12.super_class = (Class)SBRevealContinuousExposeStripOverflowGestureModifier;
    [(SBRevealContinuousExposeStripOverflowGestureModifier *)&v12 scaleForLayoutRole:a3 inAppLayout:v6];
    double v9 = v10;
    v18[3] = v10;
  }
  _Block_object_dispose(&v17, 8);

  return v9;
}

uint64_t __87__SBRevealContinuousExposeStripOverflowGestureModifier_scaleForLayoutRole_inAppLayout___block_invoke(void *a1)
{
  uint64_t result = [*(id *)(a1[4] + 144) scaleForLayoutRole:a1[7] inAppLayout:a1[5]];
  *(void *)(*(void *)(a1[6] + 8) + 24) = v3;
  return result;
}

- (BOOL)shouldPinLayoutRolesToSpace:(unint64_t)a3
{
  uint64_t v8 = 0;
  double v9 = &v8;
  uint64_t v10 = 0x2020000000;
  char v11 = 0;
  if (self->_showingAppSwitcherLayout)
  {
    continuousExposeAppSwitcherModifier = self->_continuousExposeAppSwitcherModifier;
    v7[0] = MEMORY[0x1E4F143A8];
    v7[1] = 3221225472;
    v7[2] = __84__SBRevealContinuousExposeStripOverflowGestureModifier_shouldPinLayoutRolesToSpace___block_invoke;
    v7[3] = &unk_1E6AF6358;
    v7[4] = self;
    v7[5] = &v8;
    v7[6] = a3;
    [(SBChainableModifier *)self performTransactionWithTemporaryChildModifier:continuousExposeAppSwitcherModifier usingBlock:v7];
    unsigned __int8 v4 = *((unsigned char *)v9 + 24) != 0;
  }
  else
  {
    v6.receiver = self;
    v6.super_class = (Class)SBRevealContinuousExposeStripOverflowGestureModifier;
    unsigned __int8 v4 = [(SBRevealContinuousExposeStripOverflowGestureModifier *)&v6 shouldPinLayoutRolesToSpace:a3];
    *((unsigned char *)v9 + 24) = v4;
  }
  _Block_object_dispose(&v8, 8);
  return v4;
}

uint64_t __84__SBRevealContinuousExposeStripOverflowGestureModifier_shouldPinLayoutRolesToSpace___block_invoke(void *a1)
{
  uint64_t result = [*(id *)(a1[4] + 144) shouldPinLayoutRolesToSpace:a1[6]];
  *(unsigned char *)(*(void *)(a1[5] + 8) + 24) = result;
  return result;
}

- (double)opacityForLayoutRole:(int64_t)a3 inAppLayout:(id)a4 atIndex:(unint64_t)a5
{
  id v8 = a4;
  double v9 = v8;
  uint64_t v20 = 0;
  double v21 = (double *)&v20;
  uint64_t v22 = 0x2020000000;
  uint64_t v23 = 0;
  if (self->_showingAppSwitcherLayout)
  {
    continuousExposeAppSwitcherModifier = self->_continuousExposeAppSwitcherModifier;
    v15[0] = MEMORY[0x1E4F143A8];
    v15[1] = 3221225472;
    v15[2] = __97__SBRevealContinuousExposeStripOverflowGestureModifier_opacityForLayoutRole_inAppLayout_atIndex___block_invoke;
    v15[3] = &unk_1E6AF63F8;
    uint64_t v17 = &v20;
    int64_t v18 = a3;
    v15[4] = self;
    id v16 = v8;
    unint64_t v19 = a5;
    [(SBChainableModifier *)self performTransactionWithTemporaryChildModifier:continuousExposeAppSwitcherModifier usingBlock:v15];

    double v11 = v21[3];
  }
  else
  {
    v14.receiver = self;
    v14.super_class = (Class)SBRevealContinuousExposeStripOverflowGestureModifier;
    [(SBRevealContinuousExposeStripOverflowGestureModifier *)&v14 opacityForLayoutRole:a3 inAppLayout:v8 atIndex:a5];
    double v11 = v12;
    v21[3] = v12;
  }
  _Block_object_dispose(&v20, 8);

  return v11;
}

uint64_t __97__SBRevealContinuousExposeStripOverflowGestureModifier_opacityForLayoutRole_inAppLayout_atIndex___block_invoke(void *a1)
{
  uint64_t result = [*(id *)(a1[4] + 144) opacityForLayoutRole:a1[7] inAppLayout:a1[5] atIndex:a1[8]];
  *(void *)(*(void *)(a1[6] + 8) + 24) = v3;
  return result;
}

- (double)shadowOpacityForLayoutRole:(int64_t)a3 atIndex:(unint64_t)a4
{
  uint64_t v10 = 0;
  double v11 = (double *)&v10;
  uint64_t v12 = 0x2020000000;
  uint64_t v13 = 0;
  if (self->_showingAppSwitcherLayout)
  {
    continuousExposeAppSwitcherModifier = self->_continuousExposeAppSwitcherModifier;
    v9[0] = MEMORY[0x1E4F143A8];
    v9[1] = 3221225472;
    v9[2] = __91__SBRevealContinuousExposeStripOverflowGestureModifier_shadowOpacityForLayoutRole_atIndex___block_invoke;
    v9[3] = &unk_1E6AF6420;
    v9[4] = self;
    v9[5] = &v10;
    v9[6] = a3;
    v9[7] = a4;
    [(SBChainableModifier *)self performTransactionWithTemporaryChildModifier:continuousExposeAppSwitcherModifier usingBlock:v9];
    double v5 = v11[3];
  }
  else
  {
    v8.receiver = self;
    v8.super_class = (Class)SBRevealContinuousExposeStripOverflowGestureModifier;
    [(SBRevealContinuousExposeStripOverflowGestureModifier *)&v8 shadowOpacityForLayoutRole:a3 atIndex:a4];
    double v5 = v6;
    v11[3] = v6;
  }
  _Block_object_dispose(&v10, 8);
  return v5;
}

uint64_t __91__SBRevealContinuousExposeStripOverflowGestureModifier_shadowOpacityForLayoutRole_atIndex___block_invoke(void *a1)
{
  uint64_t result = [*(id *)(a1[4] + 144) shadowOpacityForLayoutRole:a1[6] atIndex:a1[7]];
  *(void *)(*(void *)(a1[5] + 8) + 24) = v3;
  return result;
}

- (SBSwitcherWallpaperGradientAttributes)wallpaperGradientAttributesForIndex:(unint64_t)a3
{
  uint64_t v13 = 0;
  objc_super v14 = (double *)&v13;
  uint64_t v15 = 0x3010000000;
  uint64_t v17 = 0;
  uint64_t v18 = 0;
  id v16 = &unk_1D90ED3C6;
  if (self->_showingAppSwitcherLayout)
  {
    continuousExposeAppSwitcherModifier = self->_continuousExposeAppSwitcherModifier;
    v12[0] = MEMORY[0x1E4F143A8];
    v12[1] = 3221225472;
    v12[2] = __92__SBRevealContinuousExposeStripOverflowGestureModifier_wallpaperGradientAttributesForIndex___block_invoke;
    v12[3] = &unk_1E6AF6358;
    v12[4] = self;
    void v12[5] = &v13;
    v12[6] = a3;
    [(SBChainableModifier *)self performTransactionWithTemporaryChildModifier:continuousExposeAppSwitcherModifier usingBlock:v12];
    double v4 = v14[4];
    double v5 = v14[5];
  }
  else
  {
    v11.receiver = self;
    v11.super_class = (Class)SBRevealContinuousExposeStripOverflowGestureModifier;
    [(SBRevealContinuousExposeStripOverflowGestureModifier *)&v11 wallpaperGradientAttributesForIndex:a3];
    double v4 = v6;
    double v5 = v7;
    objc_super v8 = v14;
    v14[4] = v6;
    v8[5] = v7;
  }
  _Block_object_dispose(&v13, 8);
  double v9 = v4;
  double v10 = v5;
  result.trailingAlpha = v10;
  result.leadingAlpha = v9;
  return result;
}

uint64_t __92__SBRevealContinuousExposeStripOverflowGestureModifier_wallpaperGradientAttributesForIndex___block_invoke(void *a1)
{
  uint64_t result = [*(id *)(a1[4] + 144) wallpaperGradientAttributesForIndex:a1[6]];
  uint64_t v3 = *(void *)(a1[5] + 8);
  *(void *)(v3 + 32) = v4;
  *(void *)(v3 + 40) = v5;
  return result;
}

- (double)contentPageViewScaleForAppLayout:(id)a3 withScale:(double)a4
{
  id v6 = a3;
  double v7 = v6;
  uint64_t v17 = 0;
  uint64_t v18 = (double *)&v17;
  uint64_t v19 = 0x2020000000;
  uint64_t v20 = 0;
  if (self->_showingAppSwitcherLayout)
  {
    continuousExposeAppSwitcherModifier = self->_continuousExposeAppSwitcherModifier;
    v13[0] = MEMORY[0x1E4F143A8];
    v13[1] = 3221225472;
    v13[2] = __99__SBRevealContinuousExposeStripOverflowGestureModifier_contentPageViewScaleForAppLayout_withScale___block_invoke;
    v13[3] = &unk_1E6AF63D0;
    uint64_t v15 = &v17;
    v13[4] = self;
    id v14 = v6;
    double v16 = a4;
    [(SBChainableModifier *)self performTransactionWithTemporaryChildModifier:continuousExposeAppSwitcherModifier usingBlock:v13];

    double v9 = v18[3];
  }
  else
  {
    v12.receiver = self;
    v12.super_class = (Class)SBRevealContinuousExposeStripOverflowGestureModifier;
    [(SBRevealContinuousExposeStripOverflowGestureModifier *)&v12 contentPageViewScaleForAppLayout:v6 withScale:a4];
    double v9 = v10;
    v18[3] = v10;
  }
  _Block_object_dispose(&v17, 8);

  return v9;
}

uint64_t __99__SBRevealContinuousExposeStripOverflowGestureModifier_contentPageViewScaleForAppLayout_withScale___block_invoke(uint64_t a1)
{
  uint64_t result = [*(id *)(*(void *)(a1 + 32) + 144) contentPageViewScaleForAppLayout:*(void *)(a1 + 40) withScale:*(double *)(a1 + 56)];
  *(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) = v3;
  return result;
}

- (double)dimmingAlphaForLayoutRole:(int64_t)a3 inAppLayout:(id)a4
{
  id v6 = a4;
  double v7 = v6;
  uint64_t v17 = 0;
  uint64_t v18 = (double *)&v17;
  uint64_t v19 = 0x2020000000;
  uint64_t v20 = 0;
  if (self->_showingAppSwitcherLayout)
  {
    continuousExposeAppSwitcherModifier = self->_continuousExposeAppSwitcherModifier;
    v13[0] = MEMORY[0x1E4F143A8];
    v13[1] = 3221225472;
    v13[2] = __94__SBRevealContinuousExposeStripOverflowGestureModifier_dimmingAlphaForLayoutRole_inAppLayout___block_invoke;
    v13[3] = &unk_1E6AF63D0;
    uint64_t v15 = &v17;
    int64_t v16 = a3;
    v13[4] = self;
    id v14 = v6;
    [(SBChainableModifier *)self performTransactionWithTemporaryChildModifier:continuousExposeAppSwitcherModifier usingBlock:v13];

    double v9 = v18[3];
  }
  else
  {
    v12.receiver = self;
    v12.super_class = (Class)SBRevealContinuousExposeStripOverflowGestureModifier;
    [(SBRevealContinuousExposeStripOverflowGestureModifier *)&v12 dimmingAlphaForLayoutRole:a3 inAppLayout:v6];
    double v9 = v10;
    v18[3] = v10;
  }
  _Block_object_dispose(&v17, 8);

  return v9;
}

uint64_t __94__SBRevealContinuousExposeStripOverflowGestureModifier_dimmingAlphaForLayoutRole_inAppLayout___block_invoke(void *a1)
{
  uint64_t result = [*(id *)(a1[4] + 144) dimmingAlphaForLayoutRole:a1[7] inAppLayout:a1[5]];
  *(void *)(*(void *)(a1[6] + 8) + 24) = v3;
  return result;
}

- (double)titleOpacityForIndex:(unint64_t)a3
{
  uint64_t v9 = 0;
  double v10 = (double *)&v9;
  uint64_t v11 = 0x2020000000;
  uint64_t v12 = 0;
  if (self->_showingAppSwitcherLayout)
  {
    continuousExposeAppSwitcherModifier = self->_continuousExposeAppSwitcherModifier;
    v8[0] = MEMORY[0x1E4F143A8];
    v8[1] = 3221225472;
    v8[2] = __77__SBRevealContinuousExposeStripOverflowGestureModifier_titleOpacityForIndex___block_invoke;
    v8[3] = &unk_1E6AF6358;
    v8[4] = self;
    v8[5] = &v9;
    void v8[6] = a3;
    [(SBChainableModifier *)self performTransactionWithTemporaryChildModifier:continuousExposeAppSwitcherModifier usingBlock:v8];
    double v4 = v10[3];
  }
  else
  {
    v7.receiver = self;
    v7.super_class = (Class)SBRevealContinuousExposeStripOverflowGestureModifier;
    [(SBRevealContinuousExposeStripOverflowGestureModifier *)&v7 titleOpacityForIndex:a3];
    double v4 = v5;
    v10[3] = v5;
  }
  _Block_object_dispose(&v9, 8);
  return v4;
}

uint64_t __77__SBRevealContinuousExposeStripOverflowGestureModifier_titleOpacityForIndex___block_invoke(void *a1)
{
  uint64_t result = [*(id *)(a1[4] + 144) titleOpacityForIndex:a1[6]];
  *(void *)(*(void *)(a1[5] + 8) + 24) = v3;
  return result;
}

- (BOOL)shouldUseAnchorPointToPinLayoutRolesToSpace:(unint64_t)a3
{
  uint64_t v8 = 0;
  uint64_t v9 = &v8;
  uint64_t v10 = 0x2020000000;
  char v11 = 0;
  if (self->_showingAppSwitcherLayout)
  {
    continuousExposeAppSwitcherModifier = self->_continuousExposeAppSwitcherModifier;
    v7[0] = MEMORY[0x1E4F143A8];
    v7[1] = 3221225472;
    v7[2] = __100__SBRevealContinuousExposeStripOverflowGestureModifier_shouldUseAnchorPointToPinLayoutRolesToSpace___block_invoke;
    v7[3] = &unk_1E6AF6358;
    v7[4] = self;
    v7[5] = &v8;
    v7[6] = a3;
    [(SBChainableModifier *)self performTransactionWithTemporaryChildModifier:continuousExposeAppSwitcherModifier usingBlock:v7];
    unsigned __int8 v4 = *((unsigned char *)v9 + 24) != 0;
  }
  else
  {
    v6.receiver = self;
    v6.super_class = (Class)SBRevealContinuousExposeStripOverflowGestureModifier;
    unsigned __int8 v4 = [(SBRevealContinuousExposeStripOverflowGestureModifier *)&v6 shouldUseAnchorPointToPinLayoutRolesToSpace:a3];
    *((unsigned char *)v9 + 24) = v4;
  }
  _Block_object_dispose(&v8, 8);
  return v4;
}

uint64_t __100__SBRevealContinuousExposeStripOverflowGestureModifier_shouldUseAnchorPointToPinLayoutRolesToSpace___block_invoke(void *a1)
{
  uint64_t result = [*(id *)(a1[4] + 144) shouldPinLayoutRolesToSpace:a1[6]];
  *(unsigned char *)(*(void *)(a1[5] + 8) + 24) = result;
  return result;
}

- (CGRect)adjustedSpaceAccessoryViewFrame:(CGRect)a3 forAppLayout:(id)a4
{
  double height = a3.size.height;
  double width = a3.size.width;
  double y = a3.origin.y;
  double x = a3.origin.x;
  id v9 = a4;
  uint64_t v10 = v9;
  uint64_t v33 = 0;
  double v34 = (double *)&v33;
  uint64_t v35 = 0x4010000000;
  uint64_t v36 = &unk_1D90ED3C6;
  long long v37 = 0u;
  long long v38 = 0u;
  if (self->_showingAppSwitcherLayout)
  {
    continuousExposeAppSwitcherModifier = self->_continuousExposeAppSwitcherModifier;
    v26[0] = MEMORY[0x1E4F143A8];
    v26[1] = 3221225472;
    v26[2] = __101__SBRevealContinuousExposeStripOverflowGestureModifier_adjustedSpaceAccessoryViewFrame_forAppLayout___block_invoke;
    v26[3] = &unk_1E6AF6448;
    double v28 = &v33;
    v26[4] = self;
    double v29 = x;
    double v30 = y;
    double v31 = width;
    double v32 = height;
    id v27 = v9;
    [(SBChainableModifier *)self performTransactionWithTemporaryChildModifier:continuousExposeAppSwitcherModifier usingBlock:v26];

    double v12 = v34[4];
    double v13 = v34[5];
    double v14 = v34[6];
    double v15 = v34[7];
  }
  else
  {
    v25.receiver = self;
    v25.super_class = (Class)SBRevealContinuousExposeStripOverflowGestureModifier;
    -[SBRevealContinuousExposeStripOverflowGestureModifier adjustedSpaceAccessoryViewFrame:forAppLayout:](&v25, sel_adjustedSpaceAccessoryViewFrame_forAppLayout_, v9, x, y, width, height);
    double v12 = v16;
    double v13 = v17;
    double v14 = v18;
    double v15 = v19;
    uint64_t v20 = v34;
    v34[4] = v16;
    v20[5] = v17;
    v20[6] = v18;
    v20[7] = v19;
  }
  _Block_object_dispose(&v33, 8);

  double v21 = v12;
  double v22 = v13;
  double v23 = v14;
  double v24 = v15;
  result.size.double height = v24;
  result.size.double width = v23;
  result.origin.double y = v22;
  result.origin.double x = v21;
  return result;
}

uint64_t __101__SBRevealContinuousExposeStripOverflowGestureModifier_adjustedSpaceAccessoryViewFrame_forAppLayout___block_invoke(uint64_t a1)
{
  uint64_t result = objc_msgSend(*(id *)(*(void *)(a1 + 32) + 144), "adjustedSpaceAccessoryViewFrame:forAppLayout:", *(void *)(a1 + 40), *(double *)(a1 + 56), *(double *)(a1 + 64), *(double *)(a1 + 72), *(double *)(a1 + 80));
  uint64_t v3 = *(void **)(*(void *)(a1 + 48) + 8);
  v3[4] = v4;
  v3[5] = v5;
  v3[6] = v6;
  v3[7] = v7;
  return result;
}

- (CGPoint)adjustedSpaceAccessoryViewAnchorPoint:(CGPoint)a3 forAppLayout:(id)a4
{
  double y = a3.y;
  double x = a3.x;
  id v7 = a4;
  uint64_t v8 = v7;
  uint64_t v23 = 0;
  double v24 = (double *)&v23;
  uint64_t v25 = 0x3010000000;
  uint64_t v27 = 0;
  uint64_t v28 = 0;
  double v26 = &unk_1D90ED3C6;
  if (self->_showingAppSwitcherLayout)
  {
    continuousExposeAppSwitcherModifier = self->_continuousExposeAppSwitcherModifier;
    v18[0] = MEMORY[0x1E4F143A8];
    v18[1] = 3221225472;
    v18[2] = __107__SBRevealContinuousExposeStripOverflowGestureModifier_adjustedSpaceAccessoryViewAnchorPoint_forAppLayout___block_invoke;
    v18[3] = &unk_1E6AF63F8;
    uint64_t v20 = &v23;
    v18[4] = self;
    double v21 = x;
    double v22 = y;
    id v19 = v7;
    [(SBChainableModifier *)self performTransactionWithTemporaryChildModifier:continuousExposeAppSwitcherModifier usingBlock:v18];

    double v10 = v24[4];
    double v11 = v24[5];
  }
  else
  {
    v17.receiver = self;
    v17.super_class = (Class)SBRevealContinuousExposeStripOverflowGestureModifier;
    -[SBRevealContinuousExposeStripOverflowGestureModifier adjustedSpaceAccessoryViewAnchorPoint:forAppLayout:](&v17, sel_adjustedSpaceAccessoryViewAnchorPoint_forAppLayout_, v7, x, y);
    double v10 = v12;
    double v11 = v13;
    double v14 = v24;
    v24[4] = v12;
    v14[5] = v13;
  }
  _Block_object_dispose(&v23, 8);

  double v15 = v10;
  double v16 = v11;
  result.double y = v16;
  result.double x = v15;
  return result;
}

uint64_t __107__SBRevealContinuousExposeStripOverflowGestureModifier_adjustedSpaceAccessoryViewAnchorPoint_forAppLayout___block_invoke(uint64_t a1)
{
  uint64_t result = objc_msgSend(*(id *)(*(void *)(a1 + 32) + 144), "adjustedSpaceAccessoryViewAnchorPoint:forAppLayout:", *(void *)(a1 + 40), *(double *)(a1 + 56), *(double *)(a1 + 64));
  uint64_t v3 = *(void *)(*(void *)(a1 + 48) + 8);
  *(void *)(v3 + 32) = v4;
  *(void *)(v3 + 40) = v5;
  return result;
}

- (id)animatablePropertyIdentifiers
{
  uint64_t v2 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CAD0]), "initWithObjects:", @"SBRevealContinuousExposeStripOverflowGestureModifierAnimatablePropertyIdentifier", 0);
  return v2;
}

- (double)modelValueForAnimatableProperty:(id)a3 currentValue:(double)a4 creating:(BOOL)a5
{
  BOOL v5 = a5;
  id v8 = a3;
  if ([v8 isEqualToString:@"SBRevealContinuousExposeStripOverflowGestureModifierAnimatablePropertyIdentifier"])
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
    v12.super_class = (Class)SBRevealContinuousExposeStripOverflowGestureModifier;
    [(SBRevealContinuousExposeStripOverflowGestureModifier *)&v12 modelValueForAnimatableProperty:v8 currentValue:v5 creating:a4];
    double v9 = v10;
  }

  return v9;
}

- (int64_t)updateModeForAnimatableProperty:(id)a3
{
  id v4 = a3;
  if ([v4 isEqualToString:@"SBRevealContinuousExposeStripOverflowGestureModifierAnimatablePropertyIdentifier"])
  {
    int64_t v5 = 3;
  }
  else
  {
    v7.receiver = self;
    v7.super_class = (Class)SBRevealContinuousExposeStripOverflowGestureModifier;
    int64_t v5 = [(SBRevealContinuousExposeStripOverflowGestureModifier *)&v7 updateModeForAnimatableProperty:v4];
  }

  return v5;
}

- (BOOL)shouldUpdateAnimatableProperty:(id)a3
{
  id v4 = a3;
  if ([v4 isEqualToString:@"SBRevealContinuousExposeStripOverflowGestureModifierAnimatablePropertyIdentifier"])
  {
    unsigned __int8 v5 = self->_showingAppSwitcherLayout != self->_translation > self->_stripWidth;
  }
  else
  {
    v7.receiver = self;
    v7.super_class = (Class)SBRevealContinuousExposeStripOverflowGestureModifier;
    unsigned __int8 v5 = [(SBRevealContinuousExposeStripOverflowGestureModifier *)&v7 shouldUpdateAnimatableProperty:v4];
  }

  return v5;
}

- (double)_finalScaleForFullScreenAppLayout
{
  uint64_t v3 = [(SBSwitcherModifier *)self autoLayoutSpaceForAppLayout:self->_initialAppLayout];
  id v4 = [v3 configuration];
  [v4 containerBounds];
  double v6 = v5;

  [(SBRevealContinuousExposeStripOverflowGestureModifier *)self containerViewBounds];
  double v8 = v7;
  if (![(SBRevealContinuousExposeStripOverflowGestureModifier *)self _hideDock])
  {
    [(SBRevealContinuousExposeStripOverflowGestureModifier *)self floatingDockHeight];
    double v8 = v8 - v9;
  }
  double v10 = [(SBRevealContinuousExposeStripOverflowGestureModifier *)self chamoisLayoutAttributes];
  [v10 stripVerticalEdgeSpacing];
  double v12 = v8 + v11 * -2.0;

  return v12 / v6;
}

- (id)_appSwitcherDefaults
{
  appSwitcherDefaults = self->_appSwitcherDefaults;
  if (!appSwitcherDefaults)
  {
    id v4 = +[SBDefaults localDefaults];
    double v5 = [v4 appSwitcherDefaults];
    double v6 = self->_appSwitcherDefaults;
    self->_appSwitcherDefaults = v5;

    appSwitcherDefaults = self->_appSwitcherDefaults;
  }
  return appSwitcherDefaults;
}

- (BOOL)_hideDock
{
  int64_t v3 = [(SBAppLayout *)self->_initialAppLayout preferredDisplayOrdinal];
  id v4 = [(SBRevealContinuousExposeStripOverflowGestureModifier *)self _appSwitcherDefaults];
  double v5 = v4;
  if (v3) {
    char v6 = [v4 chamoisHideDockExternal];
  }
  else {
    char v6 = [v4 chamoisHideDock];
  }
  BOOL v7 = v6;

  return v7;
}

- (SBAppLayout)initialAppLayout
{
  return self->_initialAppLayout;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_appSwitcherDefaults, 0);
  objc_storeStrong((id *)&self->_continuousExposeAppSwitcherModifier, 0);
  objc_storeStrong((id *)&self->_initialAppLayout, 0);
  objc_storeStrong((id *)&self->_appExposeBundleIdentifier, 0);
}

@end