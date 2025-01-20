@interface SBFullScreenToSplitViewSwitcherModifier
- (BOOL)isLayoutRoleBlurred:(int64_t)a3 inAppLayout:(id)a4;
- (BOOL)isLayoutRoleMatchMovedToScene:(int64_t)a3 inAppLayout:(id)a4;
- (BOOL)isWallpaperRequiredForSwitcher;
- (SBFullScreenToSplitViewSwitcherModifier)initWithTransitionID:(id)a3 fromAppLayout:(id)a4 toAppLayout:(id)a5;
- (double)backgroundOpacityForIndex:(unint64_t)a3;
- (double)blurDelayForLayoutRole:(int64_t)a3 inAppLayout:(id)a4;
- (double)homeScreenDimmingAlpha;
- (double)opacityForLayoutRole:(int64_t)a3 inAppLayout:(id)a4 atIndex:(unint64_t)a5;
- (double)scaleForLayoutRole:(int64_t)a3 inAppLayout:(id)a4;
- (double)shadowOpacityForLayoutRole:(int64_t)a3 atIndex:(unint64_t)a4;
- (id)animationAttributesForLayoutElement:(id)a3;
- (id)handleSceneReadyEvent:(id)a3;
- (id)topMostLayoutElements;
- (id)transitionWillBegin;
- (id)visibleAppLayouts;
- (int64_t)wallpaperStyle;
@end

@implementation SBFullScreenToSplitViewSwitcherModifier

- (SBFullScreenToSplitViewSwitcherModifier)initWithTransitionID:(id)a3 fromAppLayout:(id)a4 toAppLayout:(id)a5
{
  id v10 = a4;
  id v11 = a5;
  v18.receiver = self;
  v18.super_class = (Class)SBFullScreenToSplitViewSwitcherModifier;
  v12 = [(SBTransitionSwitcherModifier *)&v18 initWithTransitionID:a3];
  if (v12)
  {
    if (v10)
    {
      if (v11)
      {
LABEL_4:
        objc_storeStrong((id *)&v12->_existingAppLayout, a4);
        uint64_t v13 = [v11 leafAppLayoutForRole:2];
        incomingAppLayout = v12->_incomingAppLayout;
        v12->_incomingAppLayout = (SBAppLayout *)v13;

        v12->_blurExistingDisplayItem = 1;
        goto LABEL_5;
      }
    }
    else
    {
      v16 = [MEMORY[0x1E4F28B00] currentHandler];
      [v16 handleFailureInMethod:a2, v12, @"SBFullScreenToSplitViewSwitcherModifier.m", 31, @"Invalid parameter not satisfying: %@", @"fromAppLayout" object file lineNumber description];

      if (v11) {
        goto LABEL_4;
      }
    }
    v17 = [MEMORY[0x1E4F28B00] currentHandler];
    [v17 handleFailureInMethod:a2, v12, @"SBFullScreenToSplitViewSwitcherModifier.m", 32, @"Invalid parameter not satisfying: %@", @"toAppLayout" object file lineNumber description];

    goto LABEL_4;
  }
LABEL_5:

  return v12;
}

- (id)transitionWillBegin
{
  v6.receiver = self;
  v6.super_class = (Class)SBFullScreenToSplitViewSwitcherModifier;
  v2 = [(SBTransitionSwitcherModifier *)&v6 transitionWillBegin];
  v3 = [[SBUpdateLayoutSwitcherEventResponse alloc] initWithOptions:10 updateMode:4];
  v4 = SBAppendSwitcherModifierResponse(v3, v2);

  return v4;
}

- (id)handleSceneReadyEvent:(id)a3
{
  v13.receiver = self;
  v13.super_class = (Class)SBFullScreenToSplitViewSwitcherModifier;
  id v4 = a3;
  v5 = [(SBSwitcherModifier *)&v13 handleSceneReadyEvent:v4];
  objc_super v6 = [v4 appLayout];

  if ([v6 containsAllItemsFromAppLayout:self->_existingAppLayout])
  {
    char blurExistingDisplayItem = self->_blurExistingDisplayItem;
    if (blurExistingDisplayItem)
    {
      existingAppLayout = self->_existingAppLayout;
      v12.receiver = self;
      v12.super_class = (Class)SBFullScreenToSplitViewSwitcherModifier;
      char blurExistingDisplayItem = [(SBFullScreenToSplitViewSwitcherModifier *)&v12 isLayoutRoleContentReady:1 inAppLayout:existingAppLayout] ^ 1;
    }
    self->_char blurExistingDisplayItem = blurExistingDisplayItem;
  }
  v9 = [[SBUpdateLayoutSwitcherEventResponse alloc] initWithOptions:32 updateMode:2];
  id v10 = SBAppendSwitcherModifierResponse(v9, v5);

  return v10;
}

- (id)animationAttributesForLayoutElement:(id)a3
{
  id v4 = (SBAppLayout *)a3;
  v13.receiver = self;
  v13.super_class = (Class)SBFullScreenToSplitViewSwitcherModifier;
  v5 = [(SBTransitionSwitcherModifier *)&v13 animationAttributesForLayoutElement:v4];
  if (self->_existingAppLayout == v4)
  {
    id v11 = [(SBFullScreenToSplitViewSwitcherModifier *)self entityRemovalSettings];
    v7 = [v11 medusaDeleteIntentAnimationSettings];

    v8 = (void *)[v5 mutableCopy];
    id v10 = [v7 toBeMadeFullscreenFrameAnimationSettings];
    [v8 setLayoutSettings:v10];
  }
  else
  {
    if (self->_incomingAppLayout != v4) {
      goto LABEL_6;
    }
    objc_super v6 = [(SBFullScreenToSplitViewSwitcherModifier *)self entityRemovalSettings];
    v7 = [v6 medusaDeleteIntentAnimationSettings];

    v8 = (void *)[v5 mutableCopy];
    v9 = [v7 toBeRemovedScaleAnimationSettings];
    [v8 setScaleSettings:v9];

    id v10 = [v7 toBeRemovedAlphaAnimationSettings];
    [v8 setOpacitySettings:v10];
  }

  v5 = v8;
LABEL_6:

  return v5;
}

- (BOOL)isLayoutRoleMatchMovedToScene:(int64_t)a3 inAppLayout:(id)a4
{
  if (self->_existingAppLayout == a4) {
    return 1;
  }
  v5.receiver = self;
  v5.super_class = (Class)SBFullScreenToSplitViewSwitcherModifier;
  return -[SBFullScreenToSplitViewSwitcherModifier isLayoutRoleMatchMovedToScene:inAppLayout:](&v5, sel_isLayoutRoleMatchMovedToScene_inAppLayout_, a3);
}

- (BOOL)isLayoutRoleBlurred:(int64_t)a3 inAppLayout:(id)a4
{
  if (self->_existingAppLayout == a4) {
    return self->_blurExistingDisplayItem;
  }
  v5.receiver = self;
  v5.super_class = (Class)SBFullScreenToSplitViewSwitcherModifier;
  return -[SBFullScreenToSplitViewSwitcherModifier isLayoutRoleBlurred:inAppLayout:](&v5, sel_isLayoutRoleBlurred_inAppLayout_, a3);
}

- (double)shadowOpacityForLayoutRole:(int64_t)a3 atIndex:(unint64_t)a4
{
  v7 = [(SBFullScreenToSplitViewSwitcherModifier *)self appLayouts];
  v8 = [v7 objectAtIndex:a4];

  double v9 = 1.0;
  if (([v8 isEqual:self->_existingAppLayout] & 1) == 0)
  {
    v12.receiver = self;
    v12.super_class = (Class)SBFullScreenToSplitViewSwitcherModifier;
    [(SBFullScreenToSplitViewSwitcherModifier *)&v12 shadowOpacityForLayoutRole:a3 atIndex:a4];
    double v9 = v10;
  }

  return v9;
}

- (double)blurDelayForLayoutRole:(int64_t)a3 inAppLayout:(id)a4
{
  v14.receiver = self;
  v14.super_class = (Class)SBFullScreenToSplitViewSwitcherModifier;
  objc_super v6 = (SBAppLayout *)a4;
  [(SBFullScreenToSplitViewSwitcherModifier *)&v14 blurDelayForLayoutRole:a3 inAppLayout:v6];
  double v8 = v7;
  existingAppLayout = self->_existingAppLayout;

  if (existingAppLayout == v6)
  {
    double v10 = [(SBFullScreenToSplitViewSwitcherModifier *)self switcherSettings];
    id v11 = [v10 animationSettings];
    [v11 resizeBlurDelay];
    double v8 = v12;
  }
  return v8;
}

- (double)backgroundOpacityForIndex:(unint64_t)a3
{
  objc_super v5 = [(SBFullScreenToSplitViewSwitcherModifier *)self appLayouts];
  objc_super v6 = [v5 objectAtIndex:a3];

  if (v6 == self->_existingAppLayout)
  {
    double v8 = 0.0;
  }
  else
  {
    v10.receiver = self;
    v10.super_class = (Class)SBFullScreenToSplitViewSwitcherModifier;
    [(SBFullScreenToSplitViewSwitcherModifier *)&v10 backgroundOpacityForIndex:a3];
    double v8 = v7;
  }

  return v8;
}

- (double)opacityForLayoutRole:(int64_t)a3 inAppLayout:(id)a4 atIndex:(unint64_t)a5
{
  double v8 = (SBAppLayout *)a4;
  if (self->_incomingAppLayout == v8 && [(SBTransitionSwitcherModifier *)self transitionPhase] == 1)
  {
    double v9 = [(SBFullScreenToSplitViewSwitcherModifier *)self entityRemovalSettings];
    objc_super v10 = [v9 medusaDeleteIntentAnimationSettings];
    [v10 toBeRemovedFinalAlpha];
    double v12 = v11;
  }
  else
  {
    v15.receiver = self;
    v15.super_class = (Class)SBFullScreenToSplitViewSwitcherModifier;
    [(SBFullScreenToSplitViewSwitcherModifier *)&v15 opacityForLayoutRole:a3 inAppLayout:v8 atIndex:a5];
    double v12 = v13;
  }

  return v12;
}

- (double)scaleForLayoutRole:(int64_t)a3 inAppLayout:(id)a4
{
  objc_super v6 = (SBAppLayout *)a4;
  if (self->_incomingAppLayout == v6 && [(SBTransitionSwitcherModifier *)self transitionPhase] == 1)
  {
    double v7 = [(SBFullScreenToSplitViewSwitcherModifier *)self entityRemovalSettings];
    double v8 = [v7 medusaDeleteIntentAnimationSettings];
    [v8 toBeRemovedFinalScale];
    double v10 = v9;
  }
  else
  {
    v13.receiver = self;
    v13.super_class = (Class)SBFullScreenToSplitViewSwitcherModifier;
    [(SBFullScreenToSplitViewSwitcherModifier *)&v13 scaleForLayoutRole:a3 inAppLayout:v6];
    double v10 = v11;
  }

  return v10;
}

- (id)topMostLayoutElements
{
  v6.receiver = self;
  v6.super_class = (Class)SBFullScreenToSplitViewSwitcherModifier;
  v3 = [(SBFullScreenToSplitViewSwitcherModifier *)&v6 topMostLayoutElements];
  id v4 = objc_msgSend(v3, "sb_arrayByInsertingOrMovingObject:toIndex:", self->_existingAppLayout, 0);

  return v4;
}

- (id)visibleAppLayouts
{
  v6.receiver = self;
  v6.super_class = (Class)SBFullScreenToSplitViewSwitcherModifier;
  v3 = [(SBFullScreenToSplitViewSwitcherModifier *)&v6 visibleAppLayouts];
  id v4 = [v3 setByAddingObject:self->_incomingAppLayout];

  return v4;
}

- (BOOL)isWallpaperRequiredForSwitcher
{
  return 1;
}

- (int64_t)wallpaperStyle
{
  return 2;
}

- (double)homeScreenDimmingAlpha
{
  unint64_t v2 = [(SBTransitionSwitcherModifier *)self transitionPhase];
  double result = 1.0;
  if (v2 == 1) {
    return 0.0;
  }
  return result;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_incomingAppLayout, 0);
  objc_storeStrong((id *)&self->_existingAppLayout, 0);
}

@end