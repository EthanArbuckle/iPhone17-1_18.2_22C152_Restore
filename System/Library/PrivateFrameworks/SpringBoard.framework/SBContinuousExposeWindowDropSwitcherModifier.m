@interface SBContinuousExposeWindowDropSwitcherModifier
- (BOOL)_isLayoutRolePartOfWindowDragInteraction:(int64_t)a3 inAppLayout:(id)a4;
- (BOOL)asyncRenderingDisabled;
- (BOOL)isLayoutRoleMatchMovedToScene:(int64_t)a3 inAppLayout:(id)a4;
- (BOOL)shouldUseAnchorPointToPinLayoutRolesToSpace:(unint64_t)a3;
- (SBAppLayout)toAppLayout;
- (SBContinuousExposeWindowDropSwitcherModifier)initWithTransitionID:(id)a3 selectedDisplayItem:(id)a4 toAppLayout:(id)a5 initialAppLayout:(id)a6;
- (SBDisplayItem)selectedDisplayItem;
- (id)_appLayoutContainingDisplayItem:(id)a3;
- (id)animationAttributesForLayoutElement:(id)a3;
- (id)handleSceneReadyEvent:(id)a3;
- (id)handleTransitionEvent:(id)a3;
- (id)transitionDidEnd;
@end

@implementation SBContinuousExposeWindowDropSwitcherModifier

- (SBContinuousExposeWindowDropSwitcherModifier)initWithTransitionID:(id)a3 selectedDisplayItem:(id)a4 toAppLayout:(id)a5 initialAppLayout:(id)a6
{
  id v12 = a4;
  id v13 = a5;
  id v14 = a6;
  v19.receiver = self;
  v19.super_class = (Class)SBContinuousExposeWindowDropSwitcherModifier;
  v15 = [(SBTransitionSwitcherModifier *)&v19 initWithTransitionID:a3];
  if (v15)
  {
    if (!v12)
    {
      v18 = [MEMORY[0x1E4F28B00] currentHandler];
      [v18 handleFailureInMethod:a2, v15, @"SBContinuousExposeWindowDropSwitcherModifier.m", 38, @"Invalid parameter not satisfying: %@", @"selectedDisplayItem" object file lineNumber description];
    }
    objc_storeStrong((id *)&v15->_selectedDisplayItem, a4);
    objc_storeStrong((id *)&v15->_toAppLayout, a5);
    if (([v14 containsItem:v12] & 1) != 0 || objc_msgSend(v13, "containsItem:", v12))
    {
      v16 = [[SBSplitDisplayItemSwitcherModifier alloc] initWithDisplayItem:v15->_selectedDisplayItem];
      [(SBChainableModifier *)v15 addChildModifier:v16 atLevel:0 key:@"SBContinuousExposeWindowDropSwitcherModifierKeySplitDisplayItem"];
    }
  }

  return v15;
}

- (BOOL)shouldUseAnchorPointToPinLayoutRolesToSpace:(unint64_t)a3
{
  v5 = [(SBContinuousExposeWindowDropSwitcherModifier *)self appLayouts];
  v6 = [v5 objectAtIndex:a3];

  if ([v6 containsItem:self->_selectedDisplayItem]
    && [(SBAppLayout *)self->_toAppLayout containsItem:self->_selectedDisplayItem])
  {
    BOOL v7 = 0;
  }
  else
  {
    v9.receiver = self;
    v9.super_class = (Class)SBContinuousExposeWindowDropSwitcherModifier;
    BOOL v7 = [(SBContinuousExposeWindowDropSwitcherModifier *)&v9 shouldUseAnchorPointToPinLayoutRolesToSpace:a3];
  }

  return v7;
}

- (id)animationAttributesForLayoutElement:(id)a3
{
  v10.receiver = self;
  v10.super_class = (Class)SBContinuousExposeWindowDropSwitcherModifier;
  v4 = [(SBTransitionSwitcherModifier *)&v10 animationAttributesForLayoutElement:a3];
  v5 = (void *)[v4 mutableCopy];

  v6 = [(SBContinuousExposeWindowDropSwitcherModifier *)self switcherSettings];
  BOOL v7 = [v6 chamoisSettings];
  v8 = [v7 windowDragAnimationSettings];
  [v5 setLayoutSettings:v8];

  return v5;
}

- (BOOL)isLayoutRoleMatchMovedToScene:(int64_t)a3 inAppLayout:(id)a4
{
  id v6 = a4;
  if ([(SBContinuousExposeWindowDropSwitcherModifier *)self _isLayoutRolePartOfWindowDragInteraction:a3 inAppLayout:v6])
  {
    BOOL v7 = 1;
  }
  else
  {
    v9.receiver = self;
    v9.super_class = (Class)SBContinuousExposeWindowDropSwitcherModifier;
    BOOL v7 = [(SBContinuousExposeWindowDropSwitcherModifier *)&v9 isLayoutRoleMatchMovedToScene:a3 inAppLayout:v6];
  }

  return v7;
}

- (id)handleTransitionEvent:(id)a3
{
  id v4 = a3;
  v18.receiver = self;
  v18.super_class = (Class)SBContinuousExposeWindowDropSwitcherModifier;
  v5 = [(SBTransitionSwitcherModifier *)&v18 handleTransitionEvent:v4];
  if ([v4 toEnvironmentMode] == 1)
  {
    id v6 = [(SBChainableModifier *)self childModifierByKey:@"SBContinuousExposeWindowDropSwitcherModifierKeyFullScreenToHomeIcon"];

    if (!v6)
    {
      int v7 = [(SBContinuousExposeWindowDropSwitcherModifier *)self isReduceMotionEnabled];
      v8 = [v4 fromAppLayout];
      objc_super v9 = [(SBTransitionSwitcherModifier *)self transitionID];
      if ([v4 isIconZoomDisabled])
      {
        uint64_t v10 = *MEMORY[0x1E4F1DB20];
        uint64_t v11 = *(void *)(MEMORY[0x1E4F1DB20] + 8);
        uint64_t v12 = *(void *)(MEMORY[0x1E4F1DB20] + 16);
        uint64_t v13 = *(void *)(MEMORY[0x1E4F1DB20] + 24);
      }
      else
      {
        [(SBContinuousExposeWindowDropSwitcherModifier *)self homeScreenIconFrameForAppLayout:v8];
      }
      if ((CGRectIsNull(*(CGRect *)&v10) | v7))
      {
        if (!v8)
        {
LABEL_12:

          goto LABEL_13;
        }
        id v14 = [(SBContinuousExposeWindowDropSwitcherModifier *)self homeGestureSettings];
        [v14 homeGestureCenterZoomDownCenterYOffsetFactor];
        v16 = [[SBFullScreenToHomeCenterZoomDownSwitcherModifier alloc] initWithTransitionID:v9 appLayout:v8 offsetYPercentOfScreenHeight:v15];
        [(SBFullScreenToHomeCenterZoomDownSwitcherModifier *)v16 setShouldForceDefaultAnchorPointForTransition:1];
      }
      else
      {
        v16 = [[SBFullScreenToHomeIconZoomSwitcherModifier alloc] initWithTransitionID:v9 appLayout:v8 direction:1];
        [(SBFullScreenToHomeCenterZoomDownSwitcherModifier *)v16 setShouldForceDefaultAnchorPointForTransition:[(SBContinuousExposeWindowDropSwitcherModifier *)self isChamoisWindowingUIEnabled]];
        [(SBFullScreenToHomeCenterZoomDownSwitcherModifier *)v16 setShouldDockOrderFrontDuringTransition:[(SBContinuousExposeWindowDropSwitcherModifier *)self isChamoisWindowingUIEnabled]];
      }
      if (v16)
      {
        [(SBChainableModifier *)self addChildModifier:v16 atLevel:1 key:@"SBContinuousExposeWindowDropSwitcherModifierKeyFullScreenToHomeIcon"];
      }
      goto LABEL_12;
    }
  }
LABEL_13:

  return v5;
}

- (id)transitionDidEnd
{
  v6.receiver = self;
  v6.super_class = (Class)SBContinuousExposeWindowDropSwitcherModifier;
  v2 = [(SBTransitionSwitcherModifier *)&v6 transitionDidEnd];
  v3 = objc_alloc_init(SBInvalidateAdjustedAppLayoutsSwitcherEventResponse);
  id v4 = SBAppendSwitcherModifierResponse(v3, v2);

  return v4;
}

- (BOOL)asyncRenderingDisabled
{
  return 1;
}

- (id)handleSceneReadyEvent:(id)a3
{
  v7.receiver = self;
  v7.super_class = (Class)SBContinuousExposeWindowDropSwitcherModifier;
  v3 = [(SBSwitcherModifier *)&v7 handleSceneReadyEvent:a3];
  id v4 = [[SBUpdateLayoutSwitcherEventResponse alloc] initWithOptions:32 updateMode:2];
  v5 = SBAppendSwitcherModifierResponse(v4, v3);

  return v5;
}

- (id)_appLayoutContainingDisplayItem:(id)a3
{
  id v4 = a3;
  v5 = [(SBContinuousExposeWindowDropSwitcherModifier *)self appLayouts];
  uint64_t v11 = MEMORY[0x1E4F143A8];
  uint64_t v12 = 3221225472;
  uint64_t v13 = __80__SBContinuousExposeWindowDropSwitcherModifier__appLayoutContainingDisplayItem___block_invoke;
  id v14 = &unk_1E6AF4B60;
  id v6 = v4;
  id v15 = v6;
  objc_super v7 = objc_msgSend(v5, "bs_firstObjectPassingTest:", &v11);

  if (!v7)
  {
    v8 = SBLogCommon();
    BOOL v9 = os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG);

    if (v9) {
      NSLog(&cfstr_ExpectedAnAppL.isa, self->_selectedDisplayItem, v11, v12, v13, v14);
    }
  }

  return v7;
}

uint64_t __80__SBContinuousExposeWindowDropSwitcherModifier__appLayoutContainingDisplayItem___block_invoke(uint64_t a1, void *a2)
{
  return [a2 containsItem:*(void *)(a1 + 32)];
}

- (BOOL)_isLayoutRolePartOfWindowDragInteraction:(int64_t)a3 inAppLayout:(id)a4
{
  id v6 = a4;
  toAppLayout = self->_toAppLayout;
  v8 = [v6 itemForLayoutRole:a3];
  if ([(SBAppLayout *)toAppLayout containsItem:v8])
  {
    char v9 = 1;
  }
  else
  {
    selectedDisplayItem = self->_selectedDisplayItem;
    uint64_t v11 = [v6 itemForLayoutRole:a3];
    char v9 = [(SBDisplayItem *)selectedDisplayItem isEqual:v11];
  }
  return v9;
}

- (SBDisplayItem)selectedDisplayItem
{
  return self->_selectedDisplayItem;
}

- (SBAppLayout)toAppLayout
{
  return self->_toAppLayout;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_toAppLayout, 0);
  objc_storeStrong((id *)&self->_selectedDisplayItem, 0);
}

@end