@interface SBSplitRemovalSwitcherModifier
- (BOOL)isContentStatusBarVisibleForIndex:(unint64_t)a3;
- (BOOL)isLayoutRoleBlurred:(int64_t)a3 inAppLayout:(id)a4;
- (BOOL)isLayoutRoleMatchMovedToScene:(int64_t)a3 inAppLayout:(id)a4;
- (BOOL)isWallpaperRequiredForSwitcher;
- (CGRect)frameForIndex:(unint64_t)a3;
- (CGRect)frameForLayoutRole:(int64_t)layoutRoleToKeep inAppLayout:(id)a4 withBounds:(CGRect)a5;
- (SBSplitRemovalSwitcherModifier)initWithTransitionID:(id)a3 fromAppLayout:(id)a4 toAppLayout:(id)a5 layoutRoleToRemove:(int64_t)a6 animationStyle:(int64_t)a7;
- (SBSwitcherAsyncRenderingAttributes)asyncRenderingAttributesForAppLayout:(id)a3;
- (UIRectCornerRadii)cornerRadiiForIndex:(unint64_t)a3;
- (double)opacityForLayoutRole:(int64_t)a3 inAppLayout:(id)a4 atIndex:(unint64_t)a5;
- (double)scaleForLayoutRole:(int64_t)a3 inAppLayout:(id)a4;
- (id)adjustedAppLayoutsForAppLayouts:(id)a3;
- (id)animationAttributesForLayoutElement:(id)a3;
- (id)handleSceneReadyEvent:(id)a3;
- (id)handleTimerEvent:(id)a3;
- (id)topMostLayoutElements;
- (id)transitionWillBegin;
- (id)transitionWillUpdate;
- (id)visibleAppLayouts;
- (int64_t)wallpaperStyle;
@end

@implementation SBSplitRemovalSwitcherModifier

- (SBSplitRemovalSwitcherModifier)initWithTransitionID:(id)a3 fromAppLayout:(id)a4 toAppLayout:(id)a5 layoutRoleToRemove:(int64_t)a6 animationStyle:(int64_t)a7
{
  id v13 = a4;
  id v14 = a5;
  v23.receiver = self;
  v23.super_class = (Class)SBSplitRemovalSwitcherModifier;
  v15 = [(SBTransitionSwitcherModifier *)&v23 initWithTransitionID:a3];
  v16 = v15;
  if (v15)
  {
    objc_storeStrong((id *)&v15->_fromAppLayout, a4);
    objc_storeStrong((id *)&v16->_toAppLayout, a5);
    uint64_t v17 = 1;
    if (a6 == 1) {
      uint64_t v17 = 2;
    }
    v16->_layoutRoleToKeep = v17;
    v16->_layoutRoleToRemove = a6;
    v16->_animationStyle = a7;
    uint64_t v18 = [v13 leafAppLayoutForRole:v16->_layoutRoleToKeep];
    remainingAppLayout = v16->_remainingAppLayout;
    v16->_remainingAppLayout = (SBAppLayout *)v18;

    uint64_t v20 = [v13 leafAppLayoutForRole:v16->_layoutRoleToRemove];
    removedAppLayout = v16->_removedAppLayout;
    v16->_removedAppLayout = (SBAppLayout *)v20;

    v16->_animationPhase = 1;
  }

  return v16;
}

- (id)handleSceneReadyEvent:(id)a3
{
  v7.receiver = self;
  v7.super_class = (Class)SBSplitRemovalSwitcherModifier;
  v3 = [(SBSwitcherModifier *)&v7 handleSceneReadyEvent:a3];
  v4 = [[SBUpdateLayoutSwitcherEventResponse alloc] initWithOptions:30 updateMode:3];
  v5 = SBAppendSwitcherModifierResponse(v4, v3);

  return v5;
}

- (id)handleTimerEvent:(id)a3
{
  v10.receiver = self;
  v10.super_class = (Class)SBSplitRemovalSwitcherModifier;
  id v4 = a3;
  v5 = [(SBTransitionSwitcherModifier *)&v10 handleTimerEvent:v4];
  v6 = objc_msgSend(v4, "reason", v10.receiver, v10.super_class);

  LODWORD(v4) = [v6 isEqualToString:@"SBSplitRemovalSwitcherModifierTimerEventReason"];
  if (v4)
  {
    self->_animationPhase = 2;
    objc_super v7 = [[SBUpdateLayoutSwitcherEventResponse alloc] initWithOptions:30 updateMode:3];
    uint64_t v8 = SBAppendSwitcherModifierResponse(v7, v5);

    v5 = (void *)v8;
  }
  return v5;
}

- (id)transitionWillBegin
{
  v6.receiver = self;
  v6.super_class = (Class)SBSplitRemovalSwitcherModifier;
  v2 = [(SBTransitionSwitcherModifier *)&v6 transitionWillBegin];
  v3 = objc_alloc_init(SBInvalidateAdjustedAppLayoutsSwitcherEventResponse);
  id v4 = SBAppendSwitcherModifierResponse(v3, v2);

  return v4;
}

- (id)transitionWillUpdate
{
  v19.receiver = self;
  v19.super_class = (Class)SBSplitRemovalSwitcherModifier;
  v3 = [(SBTransitionSwitcherModifier *)&v19 transitionWillUpdate];
  if (self->_animationPhase == 1)
  {
    int64_t animationStyle = self->_animationStyle;
    v5 = [(SBSplitRemovalSwitcherModifier *)self entityRemovalSettings];
    objc_super v6 = v5;
    if (animationStyle == 2)
    {
      objc_super v7 = [v5 medusaCommitIntentAnimationSettings];
      [v7 toBeRemovedSlideOutAnimationDelay];
    }
    else
    {
      objc_super v7 = [v5 medusaDeleteIntentAnimationSettings];
      [v7 toBeMadeFullscreenFrameAnimationDelay];
    }
    double v9 = v8;
    UIAnimationDragCoefficient();
    float v11 = v10;

    objc_initWeak(&location, self);
    v12 = [SBTimerEventSwitcherEventResponse alloc];
    v16[0] = MEMORY[0x1E4F143A8];
    v16[1] = 3221225472;
    v16[2] = __54__SBSplitRemovalSwitcherModifier_transitionWillUpdate__block_invoke;
    v16[3] = &unk_1E6AF90F0;
    objc_copyWeak(&v17, &location);
    id v13 = [(SBTimerEventSwitcherEventResponse *)v12 initWithDelay:v16 validator:@"SBSplitRemovalSwitcherModifierTimerEventReason" reason:v9 * v11];
    uint64_t v14 = SBAppendSwitcherModifierResponse(v13, v3);

    objc_destroyWeak(&v17);
    objc_destroyWeak(&location);
    v3 = (void *)v14;
  }
  return v3;
}

BOOL __54__SBSplitRemovalSwitcherModifier_transitionWillUpdate__block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v2 = [WeakRetained parentModifier];
  BOOL v3 = v2 != 0;

  return v3;
}

- (id)adjustedAppLayoutsForAppLayouts:(id)a3
{
  v7.receiver = self;
  v7.super_class = (Class)SBSplitRemovalSwitcherModifier;
  id v4 = [(SBTransitionSwitcherModifier *)&v7 adjustedAppLayoutsForAppLayouts:a3];
  v5 = (void *)[v4 mutableCopy];

  if (([v5 containsObject:self->_remainingAppLayout] & 1) == 0) {
    [v5 addObject:self->_remainingAppLayout];
  }
  if (([v5 containsObject:self->_removedAppLayout] & 1) == 0) {
    [v5 addObject:self->_removedAppLayout];
  }
  return v5;
}

- (id)animationAttributesForLayoutElement:(id)a3
{
  id v4 = a3;
  v18.receiver = self;
  v18.super_class = (Class)SBSplitRemovalSwitcherModifier;
  v5 = [(SBTransitionSwitcherModifier *)&v18 animationAttributesForLayoutElement:v4];
  if ([v4 isEqual:self->_remainingAppLayout])
  {
    objc_super v6 = (void *)[v5 mutableCopy];
    if (self->_animationStyle != 2)
    {
      objc_super v7 = [(SBSplitRemovalSwitcherModifier *)self entityRemovalSettings];
      double v8 = [v7 medusaDeleteIntentAnimationSettings];

      double v9 = [v8 toBeMadeFullscreenFrameAnimationSettings];
      [v6 setLayoutSettings:v9];
    }
  }
  if ([v4 isEqual:self->_removedAppLayout])
  {
    float v10 = (void *)[v5 mutableCopy];
    int64_t animationStyle = self->_animationStyle;
    v12 = [(SBSplitRemovalSwitcherModifier *)self entityRemovalSettings];
    id v13 = v12;
    if (animationStyle == 2)
    {
      uint64_t v14 = [v12 medusaCommitIntentAnimationSettings];

      if (self->_animationPhase != 2)
      {
LABEL_11:

        goto LABEL_12;
      }
      v15 = [v14 toBeRemovedSlideOutAnimationSettings];
      [v10 setLayoutSettings:v15];
    }
    else
    {
      uint64_t v14 = [v12 medusaDeleteIntentAnimationSettings];

      v16 = [v14 toBeRemovedScaleAnimationSettings];
      [v10 setScaleSettings:v16];

      v15 = [v14 toBeRemovedAlphaAnimationSettings];
      [v10 setOpacitySettings:v15];
    }

    goto LABEL_11;
  }
LABEL_12:

  return v5;
}

- (UIRectCornerRadii)cornerRadiiForIndex:(unint64_t)a3
{
  v5 = [(SBSplitRemovalSwitcherModifier *)self appLayouts];
  objc_super v6 = [v5 objectAtIndex:a3];

  if ((([v6 isEqual:self->_remainingAppLayout] & 1) != 0
     || [v6 isEqual:self->_removedAppLayout])
    && [(SBTransitionSwitcherModifier *)self isUpdatingLayout])
  {
    [(SBSplitRemovalSwitcherModifier *)self displayCornerRadius];
    SBRectCornerRadiiForRadius();
  }
  else
  {
    v19.receiver = self;
    v19.super_class = (Class)SBSplitRemovalSwitcherModifier;
    [(SBSplitRemovalSwitcherModifier *)&v19 cornerRadiiForIndex:a3];
  }
  double v11 = v7;
  double v12 = v8;
  double v13 = v9;
  double v14 = v10;

  double v15 = v11;
  double v16 = v12;
  double v17 = v13;
  double v18 = v14;
  result.topRight = v18;
  result.bottomRight = v17;
  result.bottomLeft = v16;
  result.topLeft = v15;
  return result;
}

- (CGRect)frameForIndex:(unint64_t)a3
{
  v5 = [(SBSplitRemovalSwitcherModifier *)self appLayouts];
  objc_super v6 = [v5 objectAtIndex:a3];

  if (([v6 isEqual:self->_remainingAppLayout] & 1) != 0
    || [v6 isEqual:self->_removedAppLayout])
  {
    [(SBSplitRemovalSwitcherModifier *)self containerViewBounds];
  }
  else
  {
    v19.receiver = self;
    v19.super_class = (Class)SBSplitRemovalSwitcherModifier;
    [(SBSplitRemovalSwitcherModifier *)&v19 frameForIndex:a3];
  }
  double v11 = v7;
  double v12 = v8;
  double v13 = v9;
  double v14 = v10;

  double v15 = v11;
  double v16 = v12;
  double v17 = v13;
  double v18 = v14;
  result.size.height = v18;
  result.size.width = v17;
  result.origin.y = v16;
  result.origin.x = v15;
  return result;
}

- (CGRect)frameForLayoutRole:(int64_t)layoutRoleToKeep inAppLayout:(id)a4 withBounds:(CGRect)a5
{
  double height = a5.size.height;
  double width = a5.size.width;
  double y = a5.origin.y;
  double x = a5.origin.x;
  id v11 = a4;
  if ([v11 isEqual:self->_remainingAppLayout])
  {
    if (self->_animationPhase == 2)
    {
      uint64_t v12 = 144;
    }
    else
    {
      layoutRoleToKeep = self->_layoutRoleToKeep;
      uint64_t v12 = 136;
    }
    uint64_t v32 = *(uint64_t *)((char *)&self->super.super.super.super.isa + v12);
    [(SBSplitRemovalSwitcherModifier *)self containerViewBounds];
    -[SBSplitRemovalSwitcherModifier preferredFrameForLayoutRole:inAppLayout:bounds:interfaceOrientation:](self, "preferredFrameForLayoutRole:inAppLayout:bounds:interfaceOrientation:", layoutRoleToKeep, v32, [(SBSplitRemovalSwitcherModifier *)self switcherInterfaceOrientation], v33, v34, v35, v36);
    goto LABEL_11;
  }
  if (![v11 isEqual:self->_removedAppLayout])
  {
    v45.receiver = self;
    v45.super_class = (Class)SBSplitRemovalSwitcherModifier;
    -[SBSplitRemovalSwitcherModifier frameForLayoutRole:inAppLayout:withBounds:](&v45, sel_frameForLayoutRole_inAppLayout_withBounds_, layoutRoleToKeep, v11, x, y, width, height);
LABEL_11:
    double v20 = v37;
    double v22 = v38;
    double v24 = v39;
    double v26 = v40;
    goto LABEL_12;
  }
  int64_t layoutRoleToRemove = self->_layoutRoleToRemove;
  fromAppLayout = self->_fromAppLayout;
  [(SBSplitRemovalSwitcherModifier *)self containerViewBounds];
  -[SBSplitRemovalSwitcherModifier preferredFrameForLayoutRole:inAppLayout:bounds:interfaceOrientation:](self, "preferredFrameForLayoutRole:inAppLayout:bounds:interfaceOrientation:", layoutRoleToRemove, fromAppLayout, [(SBSplitRemovalSwitcherModifier *)self switcherInterfaceOrientation], v15, v16, v17, v18);
  double v20 = v19;
  double v22 = v21;
  double v24 = v23;
  double v26 = v25;
  if (self->_animationPhase == 2 && self->_animationStyle == 2)
  {
    [(SBSplitRemovalSwitcherModifier *)self containerViewBounds];
    double v27 = CGRectGetHeight(v46);
    v28 = [(SBSplitRemovalSwitcherModifier *)self entityRemovalSettings];
    v29 = [v28 medusaCommitIntentAnimationSettings];
    [v29 toBeRemovedSlideOutHeightOffsetMultiplier];
    double v31 = v27 * v30;

    double v22 = v22 - v31;
  }
LABEL_12:

  double v41 = v20;
  double v42 = v22;
  double v43 = v24;
  double v44 = v26;
  result.size.double height = v44;
  result.size.double width = v43;
  result.origin.double y = v42;
  result.origin.double x = v41;
  return result;
}

- (BOOL)isContentStatusBarVisibleForIndex:(unint64_t)a3
{
  v5 = [(SBSplitRemovalSwitcherModifier *)self appLayouts];
  objc_super v6 = [v5 objectAtIndex:a3];

  if (([v6 isEqual:self->_remainingAppLayout] & 1) != 0
    || [v6 isEqual:self->_removedAppLayout])
  {
    unsigned __int8 v7 = [(SBTransitionSwitcherModifier *)self isPreparingLayout];
  }
  else
  {
    v10.receiver = self;
    v10.super_class = (Class)SBSplitRemovalSwitcherModifier;
    unsigned __int8 v7 = [(SBSplitRemovalSwitcherModifier *)&v10 isContentStatusBarVisibleForIndex:a3];
  }
  BOOL v8 = v7;

  return v8;
}

- (BOOL)isLayoutRoleBlurred:(int64_t)a3 inAppLayout:(id)a4
{
  id v6 = a4;
  if ([v6 isEqual:self->_remainingAppLayout])
  {
    BOOL v7 = 1;
  }
  else
  {
    v9.receiver = self;
    v9.super_class = (Class)SBSplitRemovalSwitcherModifier;
    BOOL v7 = [(SBSplitRemovalSwitcherModifier *)&v9 isLayoutRoleBlurred:a3 inAppLayout:v6];
  }

  return v7;
}

- (BOOL)isLayoutRoleMatchMovedToScene:(int64_t)a3 inAppLayout:(id)a4
{
  id v6 = a4;
  if ([v6 isEqual:self->_remainingAppLayout])
  {
    BOOL v7 = 1;
  }
  else
  {
    v9.receiver = self;
    v9.super_class = (Class)SBSplitRemovalSwitcherModifier;
    BOOL v7 = [(SBSplitRemovalSwitcherModifier *)&v9 isLayoutRoleMatchMovedToScene:a3 inAppLayout:v6];
  }

  return v7;
}

- (BOOL)isWallpaperRequiredForSwitcher
{
  return 1;
}

- (double)opacityForLayoutRole:(int64_t)a3 inAppLayout:(id)a4 atIndex:(unint64_t)a5
{
  id v8 = a4;
  double v9 = 1.0;
  if (([v8 isEqual:self->_remainingAppLayout] & 1) == 0)
  {
    if ([v8 isEqual:self->_removedAppLayout])
    {
      if (self->_animationStyle != 2 && ![(SBTransitionSwitcherModifier *)self isPreparingLayout])
      {
        objc_super v10 = [(SBSplitRemovalSwitcherModifier *)self entityRemovalSettings];
        id v11 = [v10 medusaDeleteIntentAnimationSettings];
        [v11 toBeRemovedFinalAlpha];
        double v9 = v12;
      }
    }
    else
    {
      v15.receiver = self;
      v15.super_class = (Class)SBSplitRemovalSwitcherModifier;
      [(SBSplitRemovalSwitcherModifier *)&v15 opacityForLayoutRole:a3 inAppLayout:v8 atIndex:a5];
      double v9 = v13;
    }
  }

  return v9;
}

- (double)scaleForLayoutRole:(int64_t)a3 inAppLayout:(id)a4
{
  id v6 = a4;
  if ([v6 isEqual:self->_removedAppLayout]
    && [(SBTransitionSwitcherModifier *)self isUpdatingLayout])
  {
    BOOL v7 = [(SBSplitRemovalSwitcherModifier *)self entityRemovalSettings];
    id v8 = [v7 medusaDeleteIntentAnimationSettings];
    [v8 toBeRemovedFinalScale];
    double v10 = v9;
  }
  else
  {
    v13.receiver = self;
    v13.super_class = (Class)SBSplitRemovalSwitcherModifier;
    [(SBSplitRemovalSwitcherModifier *)&v13 scaleForLayoutRole:a3 inAppLayout:v6];
    double v10 = v11;
  }

  return v10;
}

- (id)topMostLayoutElements
{
  v9.receiver = self;
  v9.super_class = (Class)SBSplitRemovalSwitcherModifier;
  BOOL v3 = [(SBSplitRemovalSwitcherModifier *)&v9 topMostLayoutElements];
  id v4 = (void *)[v3 mutableCopy];
  v5 = v4;
  if (v4) {
    id v6 = v4;
  }
  else {
    id v6 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  }
  BOOL v7 = v6;

  [v7 removeObject:self->_remainingAppLayout];
  [v7 removeObject:self->_removedAppLayout];
  [v7 insertObject:self->_removedAppLayout atIndex:0];
  [v7 insertObject:self->_remainingAppLayout atIndex:0];
  return v7;
}

- (id)visibleAppLayouts
{
  v6.receiver = self;
  v6.super_class = (Class)SBSplitRemovalSwitcherModifier;
  BOOL v3 = [(SBSplitRemovalSwitcherModifier *)&v6 visibleAppLayouts];
  id v4 = (void *)[v3 mutableCopy];

  [v4 removeObject:self->_toAppLayout];
  [v4 addObject:self->_remainingAppLayout];
  [v4 addObject:self->_removedAppLayout];
  return v4;
}

- (int64_t)wallpaperStyle
{
  return 3;
}

- (SBSwitcherAsyncRenderingAttributes)asyncRenderingAttributesForAppLayout:(id)a3
{
  return (SBSwitcherAsyncRenderingAttributes)SBSwitcherAsyncRenderingAttributesMake(0, 0);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_removedAppLayout, 0);
  objc_storeStrong((id *)&self->_remainingAppLayout, 0);
  objc_storeStrong((id *)&self->_toAppLayout, 0);
  objc_storeStrong((id *)&self->_fromAppLayout, 0);
}

@end