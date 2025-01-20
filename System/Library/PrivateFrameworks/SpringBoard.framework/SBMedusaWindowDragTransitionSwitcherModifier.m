@interface SBMedusaWindowDragTransitionSwitcherModifier
- (BOOL)_goingToHomeScreenPeekFromSplitView;
- (BOOL)_minimizingCenterWindow;
- (BOOL)isHomeScreenContentRequired;
- (BOOL)isLayoutRoleBlurred:(int64_t)a3 inAppLayout:(id)a4;
- (BOOL)isLayoutRoleMatchMovedToScene:(int64_t)a3 inAppLayout:(id)a4;
- (BOOL)isSwitcherWindowVisible;
- (BOOL)isWallpaperRequiredForSwitcher;
- (BOOL)shouldUseAnchorPointToPinLayoutRolesToSpace:(unint64_t)a3;
- (CGRect)frameForIndex:(unint64_t)a3;
- (SBMedusaWindowDragTransitionSwitcherModifier)initWithTransitionID:(id)a3 selectedAppLayout:(id)a4 fromAppLayout:(id)a5 toAppLayout:(id)a6 toFloatingAppLayout:(id)a7 toHomeScreenPeek:(BOOL)a8 toAppExposeBundleIdentifier:(id)a9 initiallyBlurredDisplayItems:(id)a10 windowDragDestination:(unint64_t)a11;
- (SBSwitcherAsyncRenderingAttributes)asyncRenderingAttributesForAppLayout:(id)a3;
- (double)backgroundOpacityForIndex:(unint64_t)a3;
- (double)homeScreenDimmingAlpha;
- (double)shadowOpacityForLayoutRole:(int64_t)a3 atIndex:(unint64_t)a4;
- (id)animationAttributesForLayoutElement:(id)a3;
- (id)appLayoutContainingAppLayout:(id)a3;
- (id)appLayoutToAttachSlideOverTongue;
- (id)handleSceneReadyEvent:(id)a3;
- (id)topMostLayoutElements;
- (id)transitionDidEnd;
- (int64_t)homeScreenBackdropBlurType;
- (int64_t)wallpaperStyle;
- (void)didMoveToParentModifier:(id)a3;
@end

@implementation SBMedusaWindowDragTransitionSwitcherModifier

- (SBMedusaWindowDragTransitionSwitcherModifier)initWithTransitionID:(id)a3 selectedAppLayout:(id)a4 fromAppLayout:(id)a5 toAppLayout:(id)a6 toFloatingAppLayout:(id)a7 toHomeScreenPeek:(BOOL)a8 toAppExposeBundleIdentifier:(id)a9 initiallyBlurredDisplayItems:(id)a10 windowDragDestination:(unint64_t)a11
{
  id v17 = a3;
  id v37 = a4;
  id v39 = a5;
  id v38 = a6;
  id v36 = a7;
  id v18 = a9;
  id v19 = a10;
  v42.receiver = self;
  v42.super_class = (Class)SBMedusaWindowDragTransitionSwitcherModifier;
  v20 = [(SBTransitionSwitcherModifier *)&v42 initWithTransitionID:v17];
  v21 = v20;
  if (v20)
  {
    objc_storeStrong((id *)&v20->_selectedAppLayout, a4);
    p_fromAppLayout = (id *)&v21->_fromAppLayout;
    objc_storeStrong((id *)&v21->_fromAppLayout, a5);
    objc_storeStrong((id *)&v21->_toAppLayout, a6);
    objc_storeStrong((id *)&v21->_toFloatingAppLayout, a7);
    v21->_isGoingToHomeScreenPeek = a8;
    v21->_finalWindowDragDestination = a11;
    if (v18)
    {
      v23 = [*p_fromAppLayout itemForLayoutRole:4];

      if (v23)
      {
        v24 = [[SBSwitcherShelf alloc] initWithBundleIdentifier:v18 layoutRole:0 displayMode:0];
        v25 = [[SBShelfZoomTransitionModifier alloc] initWithTransitionID:v17 direction:0 fromAppLayout:v39 toAppLayout:v38 shelf:v24];
        [(SBChainableModifier *)v21 addChildModifier:v25];
      }
    }
    objc_storeStrong((id *)&v21->_initiallyBlurredDisplayItems, a10);
    uint64_t v26 = [v19 mutableCopy];
    waitingForSceneUpdateForDisplayItems = v21->_waitingForSceneUpdateForDisplayItems;
    v21->_waitingForSceneUpdateForDisplayItems = (NSMutableSet *)v26;

    id v28 = *p_fromAppLayout;
    v40[0] = MEMORY[0x1E4F143A8];
    v40[1] = 3221225472;
    v40[2] = __229__SBMedusaWindowDragTransitionSwitcherModifier_initWithTransitionID_selectedAppLayout_fromAppLayout_toAppLayout_toFloatingAppLayout_toHomeScreenPeek_toAppExposeBundleIdentifier_initiallyBlurredDisplayItems_windowDragDestination___block_invoke;
    v40[3] = &unk_1E6AF4B38;
    v29 = v21;
    v41 = v29;
    uint64_t v30 = [v28 appLayoutWithItemsPassingTest:v40];
    discardedAppLayout = v29->_discardedAppLayout;
    v29->_discardedAppLayout = (SBAppLayout *)v30;

    v32 = v29->_discardedAppLayout;
    if (v32)
    {
      id v33 = *p_fromAppLayout;
      v34 = [(SBAppLayout *)v32 itemForLayoutRole:1];
      v29->_discardedLayoutRole = [v33 layoutRoleForItem:v34];
    }
    else
    {
      v29->_discardedLayoutRole = 0;
    }
  }
  return v21;
}

uint64_t __229__SBMedusaWindowDragTransitionSwitcherModifier_initWithTransitionID_selectedAppLayout_fromAppLayout_toAppLayout_toFloatingAppLayout_toHomeScreenPeek_toAppExposeBundleIdentifier_initiallyBlurredDisplayItems_windowDragDestination___block_invoke(uint64_t a1, uint64_t a2)
{
  return [*(id *)(*(void *)(a1 + 32) + 152) containsItem:a2] ^ 1;
}

- (void)didMoveToParentModifier:(id)a3
{
  v7.receiver = self;
  v7.super_class = (Class)SBMedusaWindowDragTransitionSwitcherModifier;
  -[SBChainableModifier didMoveToParentModifier:](&v7, sel_didMoveToParentModifier_);
  if (a3)
  {
    if (!self->_hasAddedChildTransitionModifiers)
    {
      self->_hasAddedChildTransitionModifiers = 1;
      v5 = [(SBAppLayout *)self->_selectedAppLayout itemForLayoutRole:1];
      v6 = [[SBSplitDisplayItemSwitcherModifier alloc] initWithDisplayItem:v5];
      [(SBChainableModifier *)self addChildModifier:v6];
    }
  }
}

- (id)appLayoutContainingAppLayout:(id)a3
{
  id v4 = a3;
  v5 = v4;
  if (self->_isGoingToHomeScreenPeek && [v4 isEqual:self->_selectedAppLayout])
  {
    v6 = self->_fromAppLayout;
  }
  else
  {
    v9.receiver = self;
    v9.super_class = (Class)SBMedusaWindowDragTransitionSwitcherModifier;
    v6 = [(SBMedusaWindowDragTransitionSwitcherModifier *)&v9 appLayoutContainingAppLayout:v5];
  }
  objc_super v7 = v6;

  return v7;
}

- (CGRect)frameForIndex:(unint64_t)a3
{
  v27.receiver = self;
  v27.super_class = (Class)SBMedusaWindowDragTransitionSwitcherModifier;
  -[SBMedusaWindowDragTransitionSwitcherModifier frameForIndex:](&v27, sel_frameForIndex_);
  double v6 = v5;
  double v8 = v7;
  double v10 = v9;
  double v12 = v11;
  if (self->_finalWindowDragDestination - 11 <= 1)
  {
    v13 = [(SBMedusaWindowDragTransitionSwitcherModifier *)self appLayouts];
    v14 = [v13 objectAtIndex:a3];

    if (![v14 isOrContainsAppLayout:self->_discardedAppLayout])
    {
      double v20 = v10;
LABEL_12:

      double v10 = v20;
      goto LABEL_13;
    }
    [(SBMedusaWindowDragTransitionSwitcherModifier *)self switcherViewBounds];
    double v16 = v15;
    [(SBMedusaWindowDragTransitionSwitcherModifier *)self separatorViewWidth];
    double v18 = v17 * 0.5;
    SBRectWithSize();
    double v20 = v19;
    double v12 = v21;
    int64_t discardedLayoutRole = self->_discardedLayoutRole;
    if (discardedLayoutRole == 1)
    {
      if ([(id)*MEMORY[0x1E4F43630] userInterfaceLayoutDirection] != 1) {
        goto LABEL_8;
      }
      int64_t discardedLayoutRole = self->_discardedLayoutRole;
    }
    if (discardedLayoutRole != 2 || [(id)*MEMORY[0x1E4F43630] userInterfaceLayoutDirection] != 1)
    {
      double v6 = v16 + v18;
      goto LABEL_11;
    }
LABEL_8:
    double v6 = -(v10 + v18);
LABEL_11:
    double v8 = 0.0;
    goto LABEL_12;
  }
LABEL_13:
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

- (id)topMostLayoutElements
{
  v6.receiver = self;
  v6.super_class = (Class)SBMedusaWindowDragTransitionSwitcherModifier;
  v3 = [(SBMedusaWindowDragTransitionSwitcherModifier *)&v6 topMostLayoutElements];
  if ([(SBAppLayout *)self->_fromAppLayout containsAnyItemFromAppLayout:self->_selectedAppLayout]&& ![(SBAppLayout *)self->_toAppLayout containsAnyItemFromAppLayout:self->_selectedAppLayout]&& !self->_isGoingToHomeScreenPeek)
  {
    uint64_t v4 = objc_msgSend(v3, "sb_arrayByInsertingOrMovingObject:toIndex:", self->_selectedAppLayout, 0);

    v3 = (void *)v4;
  }
  return v3;
}

- (id)transitionDidEnd
{
  v11.receiver = self;
  v11.super_class = (Class)SBMedusaWindowDragTransitionSwitcherModifier;
  v3 = [(SBTransitionSwitcherModifier *)&v11 transitionDidEnd];
  if (self->_isGoingToHomeScreenPeek && !self->_toFloatingAppLayout)
  {
    uint64_t v4 = [SBAddModifierSwitcherEventResponse alloc];
    double v5 = objc_alloc_init(SBSlideOverAppsInFullScreenSwitcherSwitcherModifier);
    objc_super v6 = [(SBAddModifierSwitcherEventResponse *)v4 initWithModifier:v5 level:3];

    uint64_t v7 = SBAppendSwitcherModifierResponse(v6, v3);

    v3 = (void *)v7;
  }
  double v8 = objc_alloc_init(SBInvalidateAdjustedAppLayoutsSwitcherEventResponse);
  double v9 = SBAppendSwitcherModifierResponse(v8, v3);

  return v9;
}

- (id)handleSceneReadyEvent:(id)a3
{
  v11.receiver = self;
  v11.super_class = (Class)SBMedusaWindowDragTransitionSwitcherModifier;
  id v4 = a3;
  double v5 = [(SBSwitcherModifier *)&v11 handleSceneReadyEvent:v4];
  objc_super v6 = objc_msgSend(v4, "appLayout", v11.receiver, v11.super_class);

  uint64_t v7 = [v6 itemForLayoutRole:1];
  if ([(NSMutableSet *)self->_waitingForSceneUpdateForDisplayItems containsObject:v7])
  {
    if ([(SBMedusaWindowDragTransitionSwitcherModifier *)self isLayoutRoleContentReady:1 inAppLayout:v6])
    {
      [(NSMutableSet *)self->_waitingForSceneUpdateForDisplayItems removeObject:v7];
      if (![(NSMutableSet *)self->_waitingForSceneUpdateForDisplayItems count])
      {
        double v8 = [[SBUpdateLayoutSwitcherEventResponse alloc] initWithOptions:32 updateMode:2];
        uint64_t v9 = SBAppendSwitcherModifierResponse(v8, v5);

        double v5 = (void *)v9;
      }
    }
  }

  return v5;
}

- (BOOL)shouldUseAnchorPointToPinLayoutRolesToSpace:(unint64_t)a3
{
  return 0;
}

- (double)backgroundOpacityForIndex:(unint64_t)a3
{
  return 0.0;
}

- (double)homeScreenDimmingAlpha
{
  if (self->_isGoingToHomeScreenPeek
    || ([(SBAppLayout *)self->_toAppLayout allItems],
        v3 = objc_claimAutoreleasedReturnValue(),
        uint64_t v4 = [v3 count],
        v3,
        double result = 1.0,
        !v4))
  {
    v6.receiver = self;
    v6.super_class = (Class)SBMedusaWindowDragTransitionSwitcherModifier;
    [(SBMedusaWindowDragTransitionSwitcherModifier *)&v6 homeScreenDimmingAlpha];
  }
  return result;
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

- (BOOL)isLayoutRoleBlurred:(int64_t)a3 inAppLayout:(id)a4
{
  double v5 = [a4 itemForLayoutRole:a3];
  BOOL v6 = [(NSMutableSet *)self->_waitingForSceneUpdateForDisplayItems count]
    && [(NSSet *)self->_initiallyBlurredDisplayItems containsObject:v5];

  return v6;
}

- (BOOL)isLayoutRoleMatchMovedToScene:(int64_t)a3 inAppLayout:(id)a4
{
  return 1;
}

- (double)shadowOpacityForLayoutRole:(int64_t)a3 atIndex:(unint64_t)a4
{
  uint64_t v7 = [(SBMedusaWindowDragTransitionSwitcherModifier *)self appLayouts];
  double v8 = [v7 objectAtIndex:a4];

  double v9 = 1.0;
  if (![(SBAppLayout *)self->_fromAppLayout isOrContainsAppLayout:v8]
    && ![(SBAppLayout *)self->_toAppLayout isOrContainsAppLayout:v8])
  {
    v12.receiver = self;
    v12.super_class = (Class)SBMedusaWindowDragTransitionSwitcherModifier;
    [(SBMedusaWindowDragTransitionSwitcherModifier *)&v12 shadowOpacityForLayoutRole:a3 atIndex:a4];
    double v9 = v10;
  }

  return v9;
}

- (id)appLayoutToAttachSlideOverTongue
{
  return 0;
}

- (id)animationAttributesForLayoutElement:(id)a3
{
  v9.receiver = self;
  v9.super_class = (Class)SBMedusaWindowDragTransitionSwitcherModifier;
  uint64_t v4 = [(SBTransitionSwitcherModifier *)&v9 animationAttributesForLayoutElement:a3];
  if (![(SBMedusaWindowDragTransitionSwitcherModifier *)self _goingToHomeScreenPeekFromSplitView]&& ![(SBMedusaWindowDragTransitionSwitcherModifier *)self _minimizingCenterWindow])
  {
    double v5 = (void *)[v4 mutableCopy];
    BOOL v6 = [(SBMedusaWindowDragTransitionSwitcherModifier *)self medusaSettings];
    uint64_t v7 = [v6 dropAnimationSettings];
    [v5 setLayoutSettings:v7];

    uint64_t v4 = v5;
  }
  return v4;
}

- (SBSwitcherAsyncRenderingAttributes)asyncRenderingAttributesForAppLayout:(id)a3
{
  id v4 = a3;
  if ([(SBMedusaWindowDragTransitionSwitcherModifier *)self _minimizingCenterWindow]
    && [v4 isEqual:self->_toAppLayout])
  {
    unsigned __int16 v5 = SBSwitcherAsyncRenderingAttributesMake(0, 0);
  }
  else
  {
    v8.receiver = self;
    v8.super_class = (Class)SBMedusaWindowDragTransitionSwitcherModifier;
    unsigned __int16 v5 = (unsigned __int16)[(SBTransitionSwitcherModifier *)&v8 asyncRenderingAttributesForAppLayout:v4];
  }
  SBSwitcherAsyncRenderingAttributes v6 = (SBSwitcherAsyncRenderingAttributes)v5;

  return v6;
}

- (BOOL)_goingToHomeScreenPeekFromSplitView
{
  return self->_isGoingToHomeScreenPeek
      && [(SBAppLayout *)self->_fromAppLayout isSplitConfiguration];
}

- (BOOL)_minimizingCenterWindow
{
  v3 = [(SBAppLayout *)self->_selectedAppLayout itemForLayoutRole:1];
  id v4 = [(SBAppLayout *)self->_fromAppLayout itemForLayoutRole:4];
  int v5 = [v3 isEqual:v4];

  if (v5 && ![(SBAppLayout *)self->_toAppLayout containsItem:v3]) {
    BOOL v6 = ![(SBAppLayout *)self->_toFloatingAppLayout containsItem:v3];
  }
  else {
    LOBYTE(v6) = 0;
  }

  return v6;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_waitingForSceneUpdateForDisplayItems, 0);
  objc_storeStrong((id *)&self->_initiallyBlurredDisplayItems, 0);
  objc_storeStrong((id *)&self->_discardedAppLayout, 0);
  objc_storeStrong((id *)&self->_toFloatingAppLayout, 0);
  objc_storeStrong((id *)&self->_toAppLayout, 0);
  objc_storeStrong((id *)&self->_fromAppLayout, 0);
  objc_storeStrong((id *)&self->_selectedAppLayout, 0);
}

@end