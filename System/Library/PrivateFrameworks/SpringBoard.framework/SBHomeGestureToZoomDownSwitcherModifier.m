@interface SBHomeGestureToZoomDownSwitcherModifier
- (BOOL)completesWhenChildrenComplete;
- (BOOL)isHomeScreenContentRequired;
- (BOOL)isSwitcherWindowUserInteractionEnabled;
- (BOOL)isSwitcherWindowVisible;
- (BOOL)isWallpaperRequiredForSwitcher;
- (SBHomeGestureToZoomDownSwitcherModifier)initWithTransitionID:(id)a3 appLayout:(id)a4 nonGestureInitiatedZoomModifier:(id)a5 effectiveStartingEnvironmentMode:(int64_t)a6 liftOffVelocity:(CGPoint)a7 adjustAnimationAttributes:(BOOL)a8;
- (id)appLayoutsToCacheFullsizeSnapshots;
- (id)appLayoutsToCacheSnapshots;
- (id)responseForProposedChildResponse:(id)a3 childModifier:(id)a4 event:(id)a5;
- (int64_t)homeScreenBackdropBlurType;
- (int64_t)wallpaperStyle;
@end

@implementation SBHomeGestureToZoomDownSwitcherModifier

- (SBHomeGestureToZoomDownSwitcherModifier)initWithTransitionID:(id)a3 appLayout:(id)a4 nonGestureInitiatedZoomModifier:(id)a5 effectiveStartingEnvironmentMode:(int64_t)a6 liftOffVelocity:(CGPoint)a7 adjustAnimationAttributes:(BOOL)a8
{
  BOOL v8 = a8;
  double y = a7.y;
  double x = a7.x;
  id v17 = a4;
  id v18 = a5;
  v24.receiver = self;
  v24.super_class = (Class)SBHomeGestureToZoomDownSwitcherModifier;
  v19 = [(SBTransitionSwitcherModifier *)&v24 initWithTransitionID:a3];
  if (v19)
  {
    if (!v17)
    {
      v23 = [MEMORY[0x1E4F28B00] currentHandler];
      [v23 handleFailureInMethod:a2, v19, @"SBHomeGestureToZoomDownSwitcherModifier.m", 38, @"Invalid parameter not satisfying: %@", @"appLayout" object file lineNumber description];
    }
    objc_storeStrong((id *)&v19->_appLayout, a4);
    objc_storeStrong((id *)&v19->_nonGestureInitiatedZoomModifier, a5);
    v19->_startingEnvironmentMode = a6;
    [(SBChainableModifier *)v19 addChildModifier:v19->_nonGestureInitiatedZoomModifier];
    if (v8)
    {
      v20 = -[SBGestureInitiatedIconZoomAnimationAttributesSwitcherModifier initWithAppLayout:gestureEdge:liftOffVelocity:]([SBGestureInitiatedIconZoomAnimationAttributesSwitcherModifier alloc], "initWithAppLayout:gestureEdge:liftOffVelocity:", v17, 4, x, y);
      animationAttributesModifier = v19->_animationAttributesModifier;
      v19->_animationAttributesModifier = v20;

      [(SBChainableModifier *)v19 addChildModifier:v19->_animationAttributesModifier];
    }
  }

  return v19;
}

- (BOOL)completesWhenChildrenComplete
{
  return 1;
}

- (id)responseForProposedChildResponse:(id)a3 childModifier:(id)a4 event:(id)a5
{
  BOOL v8 = (SBSwitcherModifier *)a4;
  id v9 = a5;
  v18.receiver = self;
  v18.super_class = (Class)SBHomeGestureToZoomDownSwitcherModifier;
  v10 = [(SBChainableModifier *)&v18 responseForProposedChildResponse:a3 childModifier:v8 event:v9];
  if (v10 && self->_nonGestureInitiatedZoomModifier == v8 && [v9 type] == 1)
  {
    id v11 = v9;
    v12 = [v11 transitionID];
    v13 = [(SBTransitionSwitcherModifier *)self transitionID];
    if ([v12 isEqual:v13])
    {
      uint64_t v14 = [v11 phase];

      if (v14 == 1)
      {
        v17[0] = MEMORY[0x1E4F143A8];
        v17[1] = 3221225472;
        v17[2] = __96__SBHomeGestureToZoomDownSwitcherModifier_responseForProposedChildResponse_childModifier_event___block_invoke;
        v17[3] = &unk_1E6B00028;
        v17[4] = self;
        uint64_t v15 = [v10 responseByTransformingResponseWithTransformer:v17];

        v10 = (void *)v15;
      }
    }
    else
    {
    }
  }

  return v10;
}

id __96__SBHomeGestureToZoomDownSwitcherModifier_responseForProposedChildResponse_childModifier_event___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  if ([v3 type] == 10)
  {
    v4 = 0;
LABEL_6:

    id v3 = v4;
    goto LABEL_7;
  }
  if ([v3 type] == 13)
  {
    v5 = *(void **)(a1 + 32);
    if (v5[19] == 2)
    {
      v6 = [v5 switcherSettings];
      v7 = [v6 animationSettings];
      uint64_t v8 = [v7 switcherZoomDownIconFadeOutSettings];

      v4 = [[SBIconViewVisibilitySwitcherEventResponse alloc] initWithAppLayout:*(void *)(*(void *)(a1 + 32) + 136) visible:0 animationSettings:v8 excludedIconLocations:0];
      id v3 = (id)v8;
      goto LABEL_6;
    }
  }
LABEL_7:
  return v3;
}

- (int64_t)homeScreenBackdropBlurType
{
  return 3;
}

- (BOOL)isWallpaperRequiredForSwitcher
{
  return 1;
}

- (int64_t)wallpaperStyle
{
  return 1;
}

- (BOOL)isHomeScreenContentRequired
{
  return 1;
}

- (BOOL)isSwitcherWindowVisible
{
  return 1;
}

- (BOOL)isSwitcherWindowUserInteractionEnabled
{
  return 0;
}

- (id)appLayoutsToCacheSnapshots
{
  id v3 = [(SBHomeGestureToZoomDownSwitcherModifier *)self appLayouts];
  if ([v3 count])
  {
    v4 = [(SBHomeGestureToZoomDownSwitcherModifier *)self appLayouts];
    uint64_t v5 = [v4 indexOfObject:self->_appLayout];

    v6 = [(SBHomeGestureToZoomDownSwitcherModifier *)self switcherSettings];
    uint64_t v7 = [v6 numberOfSnapshotsToAlwaysKeepAround];
    if (!v7) {
      uint64_t v7 = [v6 numberOfSnapshotsToCacheInSwitcher];
    }
    uint64_t v8 = -[SBSwitcherModifier appLayoutsToCacheSnapshotsWithVisibleRange:numberOfSnapshotsToCache:biasForward:](self, "appLayoutsToCacheSnapshotsWithVisibleRange:numberOfSnapshotsToCache:biasForward:", v5, 1, v7, 1);
  }
  else
  {
    uint64_t v8 = (void *)MEMORY[0x1E4F1CBF0];
  }

  return v8;
}

- (id)appLayoutsToCacheFullsizeSnapshots
{
  id v3 = self->_appLayout;
  if (v3)
  {
    v4 = [(SBHomeGestureToZoomDownSwitcherModifier *)self appLayouts];
    uint64_t v5 = [v4 indexOfObject:v3];

    if (v5) {
      NSUInteger v6 = v5 - 1;
    }
    else {
      NSUInteger v6 = 0;
    }
    if (v5) {
      NSUInteger v7 = 3;
    }
    else {
      NSUInteger v7 = 2;
    }
  }
  else
  {
    NSUInteger v6 = 0;
    NSUInteger v7 = 1;
  }
  uint64_t v8 = [(SBHomeGestureToZoomDownSwitcherModifier *)self appLayouts];
  v14.length = [v8 count];
  v13.location = v6;
  v13.length = v7;
  v14.location = 0;
  NSRange v9 = NSIntersectionRange(v13, v14);
  v10 = objc_msgSend(v8, "subarrayWithRange:", v9.location, v9.length);

  return v10;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_animationAttributesModifier, 0);
  objc_storeStrong((id *)&self->_nonGestureInitiatedZoomModifier, 0);
  objc_storeStrong((id *)&self->_appLayout, 0);
}

@end