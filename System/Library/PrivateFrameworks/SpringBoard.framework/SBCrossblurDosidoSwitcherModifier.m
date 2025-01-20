@interface SBCrossblurDosidoSwitcherModifier
- (BOOL)isWallpaperRequiredForSwitcher;
- (BOOL)shouldAsyncRenderUntilDelay:(double *)a3;
- (CGRect)frameForIndex:(unint64_t)a3;
- (SBCrossblurDosidoSwitcherModifier)initWithTransitionID:(id)a3 fromAppLayout:(id)a4 toAppLayout:(id)a5 direction:(unint64_t)a6;
- (double)opacityForLayoutRole:(int64_t)a3 inAppLayout:(id)a4 atIndex:(unint64_t)a5;
- (double)perspectiveAngleForAppLayout:(id)a3;
- (double)scaleForIndex:(unint64_t)a3;
- (double)scaleForLayoutRole:(int64_t)a3 inAppLayout:(id)a4;
- (id)_layoutSettings;
- (id)_opacitySettings;
- (id)animationAttributesForLayoutElement:(id)a3;
- (id)handleResizeProgressEvent:(id)a3;
- (id)resizeProgressNotificationsForLayoutRole:(int64_t)a3 inAppLayout:(id)a4;
- (id)topMostLayoutElements;
- (id)transitionDidEnd;
- (id)transitionWillBegin;
- (id)transitionWillUpdate;
- (id)visibleAppLayouts;
- (int64_t)wallpaperStyle;
@end

@implementation SBCrossblurDosidoSwitcherModifier

- (SBCrossblurDosidoSwitcherModifier)initWithTransitionID:(id)a3 fromAppLayout:(id)a4 toAppLayout:(id)a5 direction:(unint64_t)a6
{
  id v12 = a4;
  id v13 = a5;
  v18.receiver = self;
  v18.super_class = (Class)SBCrossblurDosidoSwitcherModifier;
  v14 = [(SBTransitionSwitcherModifier *)&v18 initWithTransitionID:a3];
  if (v14)
  {
    if (v12)
    {
      if (v13)
      {
LABEL_4:
        objc_storeStrong((id *)&v14->_fromAppLayout, a4);
        objc_storeStrong((id *)&v14->_toAppLayout, a5);
        v14->_direction = a6;
        goto LABEL_5;
      }
    }
    else
    {
      v16 = [MEMORY[0x1E4F28B00] currentHandler];
      [v16 handleFailureInMethod:a2, v14, @"SBCrossblurDosidoSwitcherModifier.m", 33, @"Invalid parameter not satisfying: %@", @"fromAppLayout" object file lineNumber description];

      if (v13) {
        goto LABEL_4;
      }
    }
    v17 = [MEMORY[0x1E4F28B00] currentHandler];
    [v17 handleFailureInMethod:a2, v14, @"SBCrossblurDosidoSwitcherModifier.m", 34, @"Invalid parameter not satisfying: %@", @"toAppLayout" object file lineNumber description];

    goto LABEL_4;
  }
LABEL_5:

  return v14;
}

- (BOOL)shouldAsyncRenderUntilDelay:(double *)a3
{
  v5 = [(SBCrossblurDosidoSwitcherModifier *)self switcherSettings];
  v6 = [v5 animationSettings];
  [v6 disableAsyncRenderingTransitionPercentage];
  double v8 = v7;

  v9 = [(SBCrossblurDosidoSwitcherModifier *)self _layoutSettings];
  [v9 settlingDuration];
  double v11 = v8 * v10;
  UIAnimationDragCoefficient();
  *a3 = v11 * v12;

  return 1;
}

- (id)transitionWillBegin
{
  v20.receiver = self;
  v20.super_class = (Class)SBCrossblurDosidoSwitcherModifier;
  v3 = [(SBTransitionSwitcherModifier *)&v20 transitionWillBegin];
  v4 = [[SBUpdateLayoutSwitcherEventResponse alloc] initWithOptions:2 updateMode:2];
  v5 = +[SBChainableModifierEventResponse responseByAppendingResponse:v4 toResponse:v3];

  v6 = +[SBBlurItemContainerParameters defaultCrossblurBlurParameters];
  double v7 = [(SBCrossblurDosidoSwitcherModifier *)self switcherSettings];
  double v8 = [v7 animationSettings];

  v9 = [SBBlurItemContainerParameters alloc];
  [v8 homeScreenCenterZoomInitialBlur];
  double v11 = v10;
  uint64_t v12 = [v6 shouldRasterize];
  [v6 rasterizationScale];
  double v14 = v13;
  v15 = [v6 blurAnimationSettings];
  v16 = [(SBBlurItemContainerParameters *)v9 initWithBlurRadius:v12 shouldRasterize:1 rasterizationScale:1 inputQuality:v15 inputIntermediateBitDepth:v11 blurAnimationSettings:v14];

  v17 = [[SBBlurItemContainerSwitcherEventResponse alloc] initWithAppLayout:self->_toAppLayout shouldBlur:1 blurParameters:v16 animationUpdateMode:2];
  objc_super v18 = +[SBChainableModifierEventResponse responseByAppendingResponse:v17 toResponse:v5];

  return v18;
}

- (id)transitionWillUpdate
{
  v22.receiver = self;
  v22.super_class = (Class)SBCrossblurDosidoSwitcherModifier;
  v3 = [(SBTransitionSwitcherModifier *)&v22 transitionWillUpdate];
  v4 = [[SBBlurItemContainerSwitcherEventResponse alloc] initWithAppLayout:self->_fromAppLayout shouldBlur:1 animationUpdateMode:3];
  v5 = +[SBChainableModifierEventResponse responseByAppendingResponse:v4 toResponse:v3];

  v6 = +[SBBlurItemContainerParameters defaultCrossblurBlurParameters];
  double v7 = [(SBCrossblurDosidoSwitcherModifier *)self switcherSettings];
  double v8 = [v7 animationSettings];

  [v8 homeScreenCenterZoomInitialBlur];
  double v10 = v9;
  [v8 homeScreenCenterZoomTargetScaleWhenUnblurringIsComplete];
  double v12 = v10 * (v11 + -1.0) / v11;
  double v13 = [SBBlurItemContainerParameters alloc];
  uint64_t v14 = [v6 shouldRasterize];
  [v6 rasterizationScale];
  double v16 = v15;
  v17 = [v6 blurAnimationSettings];
  objc_super v18 = [(SBBlurItemContainerParameters *)v13 initWithBlurRadius:v14 shouldRasterize:1 rasterizationScale:1 inputQuality:v17 inputIntermediateBitDepth:v12 blurAnimationSettings:v16];

  v19 = [[SBBlurItemContainerSwitcherEventResponse alloc] initWithAppLayout:self->_toAppLayout shouldBlur:1 blurParameters:v18 animationUpdateMode:3];
  objc_super v20 = +[SBChainableModifierEventResponse responseByAppendingResponse:v19 toResponse:v5];

  return v20;
}

- (id)transitionDidEnd
{
  v9.receiver = self;
  v9.super_class = (Class)SBCrossblurDosidoSwitcherModifier;
  v3 = [(SBTransitionSwitcherModifier *)&v9 transitionDidEnd];
  v4 = [[SBBlurItemContainerSwitcherEventResponse alloc] initWithAppLayout:self->_fromAppLayout shouldBlur:0 animationUpdateMode:2];
  v5 = +[SBChainableModifierEventResponse responseByAppendingResponse:v4 toResponse:v3];

  v6 = [[SBBlurItemContainerSwitcherEventResponse alloc] initWithAppLayout:self->_toAppLayout shouldBlur:0 animationUpdateMode:2];
  double v7 = +[SBChainableModifierEventResponse responseByAppendingResponse:v6 toResponse:v5];

  return v7;
}

- (id)handleResizeProgressEvent:(id)a3
{
  v11.receiver = self;
  v11.super_class = (Class)SBCrossblurDosidoSwitcherModifier;
  id v4 = a3;
  v5 = [(SBSwitcherModifier *)&v11 handleResizeProgressEvent:v4];
  objc_msgSend(v4, "progress", v11.receiver, v11.super_class);

  v6 = [(SBCrossblurDosidoSwitcherModifier *)self switcherSettings];
  double v7 = [v6 animationSettings];

  [v7 homeScreenCenterZoomTargetScaleWhenUnblurringIsComplete];
  if (BSFloatGreaterThanOrEqualToFloat())
  {
    double v8 = [[SBBlurItemContainerSwitcherEventResponse alloc] initWithAppLayout:self->_toAppLayout shouldBlur:0 animationUpdateMode:2];
    uint64_t v9 = +[SBChainableModifierEventResponse responseByAppendingResponse:v8 toResponse:v5];

    v5 = (void *)v9;
  }

  return v5;
}

- (CGRect)frameForIndex:(unint64_t)a3
{
  v5 = [(SBCrossblurDosidoSwitcherModifier *)self appLayouts];
  v6 = [v5 objectAtIndex:a3];

  fromAppLayout = self->_fromAppLayout;
  if (v6 == fromAppLayout || v6 == self->_toAppLayout)
  {
    if ([(SBAppLayout *)v6 environment] == 2)
    {
      [(SBCrossblurDosidoSwitcherModifier *)self containerViewBounds];
      goto LABEL_28;
    }
    fromAppLayout = self->_fromAppLayout;
  }
  if (v6 == fromAppLayout)
  {
    if ([(SBTransitionSwitcherModifier *)self transitionPhase] == 1)
    {
      v34 = self;
      v35 = SBCrossblurDosidoSwitcherModifier;
      double v12 = &v34;
LABEL_27:
      objc_msgSendSuper2((objc_super *)v12, sel_frameForIndex_, a3, v28, v29, v30, v31, v32.receiver, v32.super_class, v33.receiver, v33.super_class, v34, v35);
      goto LABEL_28;
    }
    fromAppLayout = self->_fromAppLayout;
  }
  if (v6 == fromAppLayout && [(SBTransitionSwitcherModifier *)self transitionPhase] >= 2)
  {
    double v13 = [(SBCrossblurDosidoSwitcherModifier *)self appLayouts];
    uint64_t v14 = [v13 indexOfObject:self->_toAppLayout];

    if (v14 == 0x7FFFFFFFFFFFFFFFLL) {
      unint64_t v15 = a3;
    }
    else {
      unint64_t v15 = v14;
    }
    -[SBCrossblurDosidoSwitcherModifier frameForIndex:](&v33, sel_frameForIndex_, v15, v28, v29, v30, v31, v32.receiver, v32.super_class, self, SBCrossblurDosidoSwitcherModifier, v34, v35);
    goto LABEL_28;
  }
  toAppLayout = self->_toAppLayout;
  if (v6 != toAppLayout)
  {
LABEL_23:
    if (v6 == toAppLayout && [(SBTransitionSwitcherModifier *)self transitionPhase] >= 2)
    {
      v30 = self;
      v31 = SBCrossblurDosidoSwitcherModifier;
      double v12 = &v30;
    }
    else
    {
      v28 = self;
      v29 = SBCrossblurDosidoSwitcherModifier;
      double v12 = &v28;
    }
    goto LABEL_27;
  }
  if ([(SBTransitionSwitcherModifier *)self transitionPhase] != 1)
  {
    toAppLayout = self->_toAppLayout;
    goto LABEL_23;
  }
  v17 = [(SBCrossblurDosidoSwitcherModifier *)self appLayouts];
  uint64_t v18 = [v17 indexOfObject:self->_fromAppLayout];

  if (v18 == 0x7FFFFFFFFFFFFFFFLL) {
    unint64_t v19 = a3;
  }
  else {
    unint64_t v19 = v18;
  }
  -[SBCrossblurDosidoSwitcherModifier frameForIndex:](&v32, sel_frameForIndex_, v19, v28, v29, v30, v31, self, SBCrossblurDosidoSwitcherModifier, v33.receiver, v33.super_class, v34, v35);
LABEL_28:
  double v20 = v8;
  double v21 = v9;
  double v22 = v10;
  double v23 = v11;

  double v24 = v20;
  double v25 = v21;
  double v26 = v22;
  double v27 = v23;
  result.size.height = v27;
  result.size.width = v26;
  result.origin.y = v25;
  result.origin.x = v24;
  return result;
}

- (double)scaleForIndex:(unint64_t)a3
{
  v5 = [(SBCrossblurDosidoSwitcherModifier *)self appLayouts];
  v6 = [v5 objectAtIndex:a3];

  double v7 = 1.0;
  if (v6 != self->_fromAppLayout && v6 != self->_toAppLayout)
  {
    v10.receiver = self;
    v10.super_class = (Class)SBCrossblurDosidoSwitcherModifier;
    [(SBCrossblurDosidoSwitcherModifier *)&v10 scaleForIndex:a3];
    double v7 = v8;
  }

  return v7;
}

- (double)scaleForLayoutRole:(int64_t)a3 inAppLayout:(id)a4
{
  v6 = (SBAppLayout *)a4;
  unint64_t v7 = [(SBTransitionSwitcherModifier *)self transitionPhase];
  double v8 = [(SBCrossblurDosidoSwitcherModifier *)self switcherSettings];
  double v9 = [v8 animationSettings];

  if (self->_fromAppLayout == v6)
  {
    double v11 = 1.0;
    if (v7 >= 2)
    {
      if (self->_direction == 1)
      {
        [v9 crossblurDosidoSmallScale];
        goto LABEL_11;
      }
LABEL_9:
      [v9 crossblurDosidoLargeScale];
      goto LABEL_11;
    }
  }
  else
  {
    if (self->_toAppLayout != v6)
    {
      v13.receiver = self;
      v13.super_class = (Class)SBCrossblurDosidoSwitcherModifier;
      [(SBCrossblurDosidoSwitcherModifier *)&v13 scaleForLayoutRole:a3 inAppLayout:v6];
LABEL_11:
      double v11 = v10;
      goto LABEL_12;
    }
    double v11 = 1.0;
    if (v7 <= 1)
    {
      if (self->_direction != 1)
      {
        [v9 crossblurDosidoCenterZoomUpSmallScale];
        goto LABEL_11;
      }
      goto LABEL_9;
    }
  }
LABEL_12:

  return v11;
}

- (id)visibleAppLayouts
{
  return (id)objc_msgSend(MEMORY[0x1E4F1CAD0], "setWithObjects:", self->_fromAppLayout, self->_toAppLayout, 0);
}

- (id)animationAttributesForLayoutElement:(id)a3
{
  v9.receiver = self;
  v9.super_class = (Class)SBCrossblurDosidoSwitcherModifier;
  id v4 = [(SBTransitionSwitcherModifier *)&v9 animationAttributesForLayoutElement:a3];
  v5 = (void *)[v4 mutableCopy];

  v6 = [(SBCrossblurDosidoSwitcherModifier *)self _layoutSettings];
  [v5 setLayoutSettings:v6];

  unint64_t v7 = [(SBCrossblurDosidoSwitcherModifier *)self _opacitySettings];
  [v5 setOpacitySettings:v7];

  return v5;
}

- (id)_layoutSettings
{
  v2 = [(SBCrossblurDosidoSwitcherModifier *)self switcherSettings];
  v3 = [v2 animationSettings];
  id v4 = [v3 crossblurDosidoSettings];

  return v4;
}

- (id)_opacitySettings
{
  v2 = [(SBCrossblurDosidoSwitcherModifier *)self switcherSettings];
  v3 = [v2 animationSettings];
  id v4 = [v3 crossblurDosidoSettings];

  return v4;
}

- (id)resizeProgressNotificationsForLayoutRole:(int64_t)a3 inAppLayout:(id)a4
{
  v17[3] = *MEMORY[0x1E4F143B8];
  if (self->_toAppLayout == a4)
  {
    v16.receiver = self;
    v16.super_class = (Class)SBCrossblurDosidoSwitcherModifier;
    v6 = -[SBCrossblurDosidoSwitcherModifier resizeProgressNotificationsForLayoutRole:inAppLayout:](&v16, sel_resizeProgressNotificationsForLayoutRole_inAppLayout_, a3);
    unint64_t v7 = [(SBCrossblurDosidoSwitcherModifier *)self switcherSettings];
    double v8 = [v7 animationSettings];

    [v8 homeScreenCenterZoomTargetScaleWhenUnblurringIsComplete];
    double v10 = v9;
    [v8 homeScreenCenterZoomInitialScale];
    v17[0] = &unk_1F3348B98;
    double v12 = [NSNumber numberWithDouble:(v10 - v11) / (1.0 - v11)];
    v17[1] = v12;
    v17[2] = &unk_1F3348BA8;
    objc_super v13 = [MEMORY[0x1E4F1C978] arrayWithObjects:v17 count:3];
    v5 = [v6 setByAddingObjectsFromArray:v13];
  }
  else
  {
    v15.receiver = self;
    v15.super_class = (Class)SBCrossblurDosidoSwitcherModifier;
    v5 = -[SBCrossblurDosidoSwitcherModifier resizeProgressNotificationsForLayoutRole:inAppLayout:](&v15, sel_resizeProgressNotificationsForLayoutRole_inAppLayout_, a3);
  }
  return v5;
}

- (double)opacityForLayoutRole:(int64_t)a3 inAppLayout:(id)a4 atIndex:(unint64_t)a5
{
  id v8 = a4;
  double v9 = [(SBCrossblurDosidoSwitcherModifier *)self appLayouts];
  uint64_t v10 = [v9 indexOfObject:self->_fromAppLayout];
  uint64_t v11 = [v9 indexOfObject:self->_toAppLayout];
  if (v10 == a5)
  {
    if ([(SBTransitionSwitcherModifier *)self transitionPhase] >= 2) {
      double v12 = 0.0;
    }
    else {
      double v12 = 1.0;
    }
  }
  else if (v11 == a5)
  {
    double v12 = 1.0;
    if ([(SBTransitionSwitcherModifier *)self transitionPhase] <= 1)
    {
      objc_super v13 = [(SBCrossblurDosidoSwitcherModifier *)self switcherSettings];
      uint64_t v14 = [v13 animationSettings];
      [v14 homeScreenCenterZoomInitialOpacity];
      double v12 = v15;
    }
  }
  else
  {
    v18.receiver = self;
    v18.super_class = (Class)SBCrossblurDosidoSwitcherModifier;
    [(SBCrossblurDosidoSwitcherModifier *)&v18 opacityForLayoutRole:a3 inAppLayout:v8 atIndex:a5];
    double v12 = v16;
  }

  return v12;
}

- (BOOL)isWallpaperRequiredForSwitcher
{
  if (![(SBCrossblurDosidoSwitcherModifier *)self isChamoisWindowingUIEnabled])return 1; {
  v4.receiver = self;
  }
  v4.super_class = (Class)SBCrossblurDosidoSwitcherModifier;
  return [(SBCrossblurDosidoSwitcherModifier *)&v4 isWallpaperRequiredForSwitcher];
}

- (int64_t)wallpaperStyle
{
  if (![(SBCrossblurDosidoSwitcherModifier *)self isChamoisWindowingUIEnabled])return 2; {
  v4.receiver = self;
  }
  v4.super_class = (Class)SBCrossblurDosidoSwitcherModifier;
  return [(SBCrossblurDosidoSwitcherModifier *)&v4 wallpaperStyle];
}

- (double)perspectiveAngleForAppLayout:(id)a3
{
  id v4 = a3;
  double v5 = 0.0;
  if (([v4 isEqual:self->_fromAppLayout] & 1) == 0
    && ([v4 isEqual:self->_toAppLayout] & 1) == 0)
  {
    v8.receiver = self;
    v8.super_class = (Class)SBCrossblurDosidoSwitcherModifier;
    [(SBCrossblurDosidoSwitcherModifier *)&v8 perspectiveAngleForAppLayout:v4];
    double v5 = v6;
  }

  return v5;
}

- (id)topMostLayoutElements
{
  v6.receiver = self;
  v6.super_class = (Class)SBCrossblurDosidoSwitcherModifier;
  v3 = [(SBCrossblurDosidoSwitcherModifier *)&v6 topMostLayoutElements];
  id v4 = objc_msgSend(v3, "sb_arrayByInsertingOrMovingObject:toIndex:", self->_toAppLayout, 0);

  return v4;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_toAppLayout, 0);
  objc_storeStrong((id *)&self->_fromAppLayout, 0);
}

@end