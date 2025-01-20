@interface SBHomeScreenContinuousExposeSwitcherModifier
- (BOOL)isContainerStatusBarVisible;
- (BOOL)isLayoutRoleSelectable:(int64_t)a3 inAppLayout:(id)a4;
- (BOOL)isResizeGrabberVisibleForAppLayout:(id)a3;
- (BOOL)isScrollEnabled;
- (BOOL)shouldAllowContentViewTouchesForLayoutRole:(int64_t)a3 inAppLayout:(id)a4;
- (CGRect)frameForIndex:(unint64_t)a3;
- (SBHomeScreenContinuousExposeSwitcherModifier)init;
- (double)continuousExposeStripProgress;
- (double)titleAndIconOpacityForIndex:(unint64_t)a3;
- (double)titleOpacityForIndex:(unint64_t)a3;
- (id)handleEvent:(id)a3;
- (id)responseForProposedChildResponse:(id)a3 childModifier:(id)a4 event:(id)a5;
- (int64_t)shadowStyleForLayoutRole:(int64_t)a3 inAppLayout:(id)a4;
- (int64_t)touchBehaviorForLayoutRole:(int64_t)a3 inAppLayout:(id)a4;
@end

@implementation SBHomeScreenContinuousExposeSwitcherModifier

- (SBHomeScreenContinuousExposeSwitcherModifier)init
{
  v6.receiver = self;
  v6.super_class = (Class)SBHomeScreenContinuousExposeSwitcherModifier;
  v2 = [(SBSwitcherModifier *)&v6 init];
  if (v2)
  {
    v3 = objc_alloc_init(SBHomeScreenSwitcherModifier);
    homeScreenModifier = v2->_homeScreenModifier;
    v2->_homeScreenModifier = v3;

    [(SBChainableModifier *)v2 addChildModifier:v2->_homeScreenModifier];
  }
  return v2;
}

- (id)handleEvent:(id)a3
{
  id v4 = a3;
  char v5 = [(SBHomeScreenContinuousExposeSwitcherModifier *)self prefersStripHiddenAndDisabled];
  stripModifier = self->_stripModifier;
  if (v5)
  {
    if (stripModifier)
    {
      [(SBChainableModifier *)stripModifier setState:1];
      v7 = self->_stripModifier;
      self->_stripModifier = 0;
    }
  }
  else if (!stripModifier)
  {
    v8 = objc_alloc_init(SBStripContinuousExposeSwitcherModifier);
    v9 = self->_stripModifier;
    self->_stripModifier = v8;

    [(SBChainableModifier *)self addChildModifier:self->_stripModifier];
  }
  v12.receiver = self;
  v12.super_class = (Class)SBHomeScreenContinuousExposeSwitcherModifier;
  v10 = [(SBChainableModifier *)&v12 handleEvent:v4];

  return v10;
}

- (id)responseForProposedChildResponse:(id)a3 childModifier:(id)a4 event:(id)a5
{
  id v8 = a5;
  v16.receiver = self;
  v16.super_class = (Class)SBHomeScreenContinuousExposeSwitcherModifier;
  v9 = [(SBChainableModifier *)&v16 responseForProposedChildResponse:a3 childModifier:a4 event:v8];
  if ([v8 type] == 1)
  {
    id v10 = v8;
    if (SBPeekConfigurationIsValid([v10 fromPeekConfiguration])
      && !SBPeekConfigurationIsValid([v10 toPeekConfiguration]))
    {
      v13[0] = MEMORY[0x1E4F143A8];
      v13[1] = 3221225472;
      v13[2] = __101__SBHomeScreenContinuousExposeSwitcherModifier_responseForProposedChildResponse_childModifier_event___block_invoke;
      v13[3] = &unk_1E6AFB4C8;
      id v14 = v10;
      v15 = self;
      uint64_t v11 = [v9 responseByTransformingResponseWithTransformer:v13];

      v9 = (void *)v11;
    }
  }
  return v9;
}

SBAddModifierSwitcherEventResponse *__101__SBHomeScreenContinuousExposeSwitcherModifier_responseForProposedChildResponse_childModifier_event___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  uint64_t v4 = [v3 type];
  char v5 = (SBAddModifierSwitcherEventResponse *)v3;
  objc_super v6 = v5;
  v7 = v5;
  if (v4 == 31)
  {
    id v8 = [(SBAddModifierSwitcherEventResponse *)v5 modifier];
    objc_opt_class();
    char isKindOfClass = objc_opt_isKindOfClass();

    if (isKindOfClass)
    {
      id v10 = [(SBAddModifierSwitcherEventResponse *)v6 modifier];
      uint64_t v11 = [v10 appLayout];
      v37[0] = MEMORY[0x1E4F143A8];
      v37[1] = 3221225472;
      v37[2] = __101__SBHomeScreenContinuousExposeSwitcherModifier_responseForProposedChildResponse_childModifier_event___block_invoke_2;
      v37[3] = &unk_1E6AF4B38;
      id v38 = *(id *)(a1 + 32);
      objc_super v12 = [v11 appLayoutWithItemsPassingTest:v37];

      if (v12 && ![*(id *)(a1 + 32) isIconZoomDisabled])
      {
        [*(id *)(a1 + 40) homeScreenIconFrameForAppLayout:v12];
      }
      else
      {
        uint64_t v13 = *MEMORY[0x1E4F1DB20];
        uint64_t v14 = *(void *)(MEMORY[0x1E4F1DB20] + 8);
        uint64_t v15 = *(void *)(MEMORY[0x1E4F1DB20] + 16);
        uint64_t v16 = *(void *)(MEMORY[0x1E4F1DB20] + 24);
      }
      if (CGRectIsNull(*(CGRect *)&v13))
      {
        v36 = [SBContinuousExposeAppToAppModifier alloc];
        v26 = [v10 transitionID];
        v27 = [*(id *)(a1 + 32) fromAppLayout];
        uint64_t v28 = [*(id *)(a1 + 32) fromInterfaceOrientation];
        v29 = [*(id *)(a1 + 32) toAppLayout];
        uint64_t v30 = [*(id *)(a1 + 32) toInterfaceOrientation];
        v31 = [*(id *)(a1 + 32) fromDisplayItemLayoutAttributesMap];
        v32 = [*(id *)(a1 + 32) toDisplayItemLayoutAttributesMap];
        v25 = [(SBContinuousExposeAppToAppModifier *)v36 initWithTransitionID:v26 fromAppLayout:v27 fromInterfaceOrientation:v28 toAppLayout:v29 toInterfaceOrientation:v30 fromDisplayItemLayoutAttributesMap:v31 toDisplayItemLayoutAttributesMap:v32];
      }
      else
      {
        v33 = [SBFullScreenToHomeIconZoomSwitcherModifier alloc];
        v34 = [v10 transitionID];
        v25 = [(SBFullScreenToHomeIconZoomSwitcherModifier *)v33 initWithTransitionID:v34 appLayout:v12 direction:0];

        [(SBContinuousExposeAppToAppModifier *)v25 setShouldForceDefaultAnchorPointForTransition:1];
        [(SBContinuousExposeAppToAppModifier *)v25 setShouldDockOrderFrontDuringTransition:1];
        v26 = [*(id *)(a1 + 40) homeScreenIconLocationForAppLayout:v12];
        [(SBContinuousExposeAppToAppModifier *)v25 setShouldUpdateIconViewVisibility:SBIconLocationGroupContainsLocation() ^ 1];
      }
    }
    else
    {
      v17 = [SBContinuousExposeAppToAppModifier alloc];
      v18 = [*(id *)(a1 + 32) transitionID];
      v19 = [*(id *)(a1 + 32) fromAppLayout];
      uint64_t v20 = [*(id *)(a1 + 32) fromInterfaceOrientation];
      v21 = [*(id *)(a1 + 32) toAppLayout];
      uint64_t v22 = [*(id *)(a1 + 32) toInterfaceOrientation];
      v23 = [*(id *)(a1 + 32) fromDisplayItemLayoutAttributesMap];
      v24 = [*(id *)(a1 + 32) toDisplayItemLayoutAttributesMap];
      v25 = [(SBContinuousExposeAppToAppModifier *)v17 initWithTransitionID:v18 fromAppLayout:v19 fromInterfaceOrientation:v20 toAppLayout:v21 toInterfaceOrientation:v22 fromDisplayItemLayoutAttributesMap:v23 toDisplayItemLayoutAttributesMap:v24];
    }
    v7 = [[SBAddModifierSwitcherEventResponse alloc] initWithModifier:v25 level:3];
  }
  return v7;
}

uint64_t __101__SBHomeScreenContinuousExposeSwitcherModifier_responseForProposedChildResponse_childModifier_event___block_invoke_2(uint64_t a1, void *a2)
{
  v2 = *(void **)(a1 + 32);
  id v3 = a2;
  uint64_t v4 = [v2 fromAppLayout];
  int v5 = [v4 containsItem:v3];

  return v5 ^ 1u;
}

- (double)continuousExposeStripProgress
{
  return 0.0;
}

- (CGRect)frameForIndex:(unint64_t)a3
{
  int v5 = [(SBHomeScreenContinuousExposeSwitcherModifier *)self appLayouts];
  objc_super v6 = [v5 objectAtIndex:a3];

  v7 = [(SBHomeScreenContinuousExposeSwitcherModifier *)self displayItemLayoutAttributesCalculator];
  id v8 = [(SBHomeScreenContinuousExposeSwitcherModifier *)self appLayoutContainingAppLayout:v6];
  uint64_t v9 = [(SBHomeScreenContinuousExposeSwitcherModifier *)self switcherInterfaceOrientation];
  id v10 = [(SBHomeScreenContinuousExposeSwitcherModifier *)self chamoisLayoutAttributes];
  [(SBHomeScreenContinuousExposeSwitcherModifier *)self floatingDockHeight];
  double v12 = v11;
  [(SBHomeScreenContinuousExposeSwitcherModifier *)self screenScale];
  double v14 = v13;
  [(SBHomeScreenContinuousExposeSwitcherModifier *)self containerViewBounds];
  v19 = objc_msgSend(v7, "autoLayoutSpaceForAppLayout:containerOrientation:chamoisLayoutAttributes:floatingDockHeight:screenScale:bounds:prefersStripHidden:prefersDockHidden:", v8, v9, v10, -[SBHomeScreenContinuousExposeSwitcherModifier prefersStripHidden](self, "prefersStripHidden"), -[SBHomeScreenContinuousExposeSwitcherModifier prefersDockHidden](self, "prefersDockHidden"), v12, v14, v15, v16, v17, v18);

  [v19 boundingBox];
  double v21 = v20;
  double v23 = v22;
  v32.receiver = self;
  v32.super_class = (Class)SBHomeScreenContinuousExposeSwitcherModifier;
  [(SBHomeScreenContinuousExposeSwitcherModifier *)&v32 frameForIndex:a3];
  UIRectGetCenter();
  double v25 = v24 - v21 * 0.5;
  double v27 = v26 - v23 * 0.5;

  double v28 = v25;
  double v29 = v27;
  double v30 = v21;
  double v31 = v23;
  result.size.height = v31;
  result.size.width = v30;
  result.origin.y = v29;
  result.origin.x = v28;
  return result;
}

- (double)titleAndIconOpacityForIndex:(unint64_t)a3
{
  return 0.0;
}

- (double)titleOpacityForIndex:(unint64_t)a3
{
  return 0.0;
}

- (int64_t)shadowStyleForLayoutRole:(int64_t)a3 inAppLayout:(id)a4
{
  return 5;
}

- (int64_t)touchBehaviorForLayoutRole:(int64_t)a3 inAppLayout:(id)a4
{
  return 1;
}

- (BOOL)shouldAllowContentViewTouchesForLayoutRole:(int64_t)a3 inAppLayout:(id)a4
{
  return 0;
}

- (BOOL)isLayoutRoleSelectable:(int64_t)a3 inAppLayout:(id)a4
{
  return 1;
}

- (BOOL)isScrollEnabled
{
  return 1;
}

- (BOOL)isContainerStatusBarVisible
{
  return 1;
}

- (BOOL)isResizeGrabberVisibleForAppLayout:(id)a3
{
  return 0;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_homeScreenModifier, 0);
  objc_storeStrong((id *)&self->_stripModifier, 0);
}

@end