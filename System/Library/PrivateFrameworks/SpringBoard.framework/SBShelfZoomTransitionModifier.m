@interface SBShelfZoomTransitionModifier
- (BOOL)_isEffectivelyInShelf;
- (BOOL)_shouldDimLayoutRole:(int64_t)a3 inAppLayout:(id)a4 forZoomDirection:(unint64_t)a5;
- (CGRect)_frameForCenterWindowInShelf;
- (CGRect)frameForIndex:(unint64_t)a3;
- (SBShelfZoomTransitionModifier)initWithTransitionID:(id)a3 direction:(unint64_t)a4 fromAppLayout:(id)a5 toAppLayout:(id)a6 shelf:(id)a7;
- (SBSwitcherAsyncRenderingAttributes)asyncRenderingAttributesForAppLayout:(id)a3;
- (SBSwitcherShelfPresentationAttributes)presentationAttributesForShelf:(SEL)a3;
- (UIRectCornerRadii)cornerRadiiForIndex:(unint64_t)a3;
- (double)contentPageViewScaleForAppLayout:(id)a3 withScale:(double)a4;
- (double)dimmingAlphaForLayoutRole:(int64_t)a3 inAppLayout:(id)a4;
- (double)opacityForLayoutRole:(int64_t)a3 inAppLayout:(id)a4 atIndex:(unint64_t)a5;
- (double)perspectiveAngleForAppLayout:(id)a3;
- (double)scaleForIndex:(unint64_t)a3;
- (double)scaleForLayoutRole:(int64_t)a3 inAppLayout:(id)a4;
- (double)shadowOpacityForLayoutRole:(int64_t)a3 atIndex:(unint64_t)a4;
- (double)titleAndIconOpacityForIndex:(unint64_t)a3;
- (double)titleOpacityForIndex:(unint64_t)a3;
- (id)animationAttributesForLayoutElement:(id)a3;
- (id)appLayoutsToEnsureExistForMainTransitionEvent:(id)a3;
- (id)descriptionBuilderWithMultilinePrefix:(id)a3;
- (id)handleGestureEvent:(id)a3;
- (id)hiddenAppLayoutsInShelf:(id)a3;
- (id)topMostLayoutElements;
- (id)transitionDidEnd;
- (id)transitionWillBegin;
- (id)visibleAppLayouts;
- (int64_t)headerStyleForIndex:(unint64_t)a3;
- (int64_t)shadowStyleForLayoutRole:(int64_t)a3 inAppLayout:(id)a4;
@end

@implementation SBShelfZoomTransitionModifier

- (SBShelfZoomTransitionModifier)initWithTransitionID:(id)a3 direction:(unint64_t)a4 fromAppLayout:(id)a5 toAppLayout:(id)a6 shelf:(id)a7
{
  id v13 = a5;
  id v14 = a6;
  id v15 = a7;
  v42.receiver = self;
  v42.super_class = (Class)SBShelfZoomTransitionModifier;
  v16 = [(SBTransitionSwitcherModifier *)&v42 initWithTransitionID:a3];
  v17 = v16;
  if (v16)
  {
    v16->_direction = a4;
    p_fromAppLayout = (id *)&v16->_fromAppLayout;
    objc_storeStrong((id *)&v16->_fromAppLayout, a5);
    p_toAppLayout = (id *)&v17->_toAppLayout;
    objc_storeStrong((id *)&v17->_toAppLayout, a6);
    objc_storeStrong((id *)&v17->_shelf, a7);
    if (v17->_direction)
    {
      uint64_t v20 = [*p_toAppLayout leafAppLayoutForRole:4];
      centerWindowAppLayout = v17->_centerWindowAppLayout;
      v17->_centerWindowAppLayout = (SBAppLayout *)v20;

      id v22 = *p_toAppLayout;
      uint64_t v35 = MEMORY[0x1E4F143A8];
      uint64_t v36 = 3221225472;
      v37 = __96__SBShelfZoomTransitionModifier_initWithTransitionID_direction_fromAppLayout_toAppLayout_shelf___block_invoke_2;
      v38 = &unk_1E6AF4B38;
      v23 = (id *)&v39;
      v24 = v17;
      v39 = v24;
      uint64_t v25 = [v22 appLayoutWithItemsPassingTest:&v35];
      fullScreenSpaceAppLayout = v24->_fullScreenSpaceAppLayout;
      v24->_fullScreenSpaceAppLayout = (SBAppLayout *)v25;

      uint64_t v27 = objc_msgSend(*p_fromAppLayout, "leafAppLayoutForRole:", 4, v35, v36, v37, v38);
      centerWindowBeingReplacedAppLayout = v24->_centerWindowBeingReplacedAppLayout;
      v24->_centerWindowBeingReplacedAppLayout = (SBAppLayout *)v27;
    }
    else
    {
      uint64_t v29 = [*p_fromAppLayout leafAppLayoutForRole:4];
      v30 = v17->_centerWindowAppLayout;
      v17->_centerWindowAppLayout = (SBAppLayout *)v29;

      id v31 = *p_fromAppLayout;
      v40[0] = MEMORY[0x1E4F143A8];
      v40[1] = 3221225472;
      v40[2] = __96__SBShelfZoomTransitionModifier_initWithTransitionID_direction_fromAppLayout_toAppLayout_shelf___block_invoke;
      v40[3] = &unk_1E6AF4B38;
      v23 = (id *)&v41;
      v32 = v17;
      v41 = v32;
      uint64_t v33 = [v31 appLayoutWithItemsPassingTest:v40];
      centerWindowBeingReplacedAppLayout = v32->_fullScreenSpaceAppLayout;
      v32->_fullScreenSpaceAppLayout = (SBAppLayout *)v33;
    }
  }
  return v17;
}

uint64_t __96__SBShelfZoomTransitionModifier_initWithTransitionID_direction_fromAppLayout_toAppLayout_shelf___block_invoke(uint64_t a1, void *a2)
{
  v2 = *(void **)(*(void *)(a1 + 32) + 168);
  id v3 = a2;
  v4 = [v2 itemForLayoutRole:1];
  int v5 = [v3 isEqual:v4];

  return v5 ^ 1u;
}

uint64_t __96__SBShelfZoomTransitionModifier_initWithTransitionID_direction_fromAppLayout_toAppLayout_shelf___block_invoke_2(uint64_t a1, void *a2)
{
  v2 = *(void **)(*(void *)(a1 + 32) + 168);
  id v3 = a2;
  v4 = [v2 itemForLayoutRole:1];
  int v5 = [v3 isEqual:v4];

  return v5 ^ 1u;
}

- (id)descriptionBuilderWithMultilinePrefix:(id)a3
{
  v4 = [(SBChainableModifier *)self succinctDescriptionBuilder];
  int v5 = v4;
  if (self->_direction) {
    v6 = @"ToSpace";
  }
  else {
    v6 = @"ToShelf";
  }
  id v7 = (id)[v4 appendObject:v6 withName:@"direction"];
  id v8 = (id)[v5 appendObject:self->_fromAppLayout withName:@"fromAppLayout"];
  id v9 = (id)[v5 appendObject:self->_toAppLayout withName:@"toAppLayout"];
  id v10 = (id)[v5 appendObject:self->_shelf withName:@"shelf"];
  id v11 = (id)[v5 appendObject:self->_centerWindowAppLayout withName:@"centerWindowAppLayout"];
  id v12 = (id)[v5 appendObject:self->_fullScreenSpaceAppLayout withName:@"fullScreenSpaceAppLayout"];
  id v13 = (id)[v5 appendObject:self->_centerWindowBeingReplacedAppLayout withName:@"centerWindowBeingReplacedAppLayout"];
  return v5;
}

- (id)handleGestureEvent:(id)a3
{
  v8.receiver = self;
  v8.super_class = (Class)SBShelfZoomTransitionModifier;
  v4 = [(SBTransitionSwitcherModifier *)&v8 handleGestureEvent:a3];
  int v5 = [(SBTransitionSwitcherModifier *)self interruptAndEndTransition];
  v6 = SBAppendSwitcherModifierResponse(v4, v5);

  return v6;
}

- (id)transitionWillBegin
{
  v12.receiver = self;
  v12.super_class = (Class)SBShelfZoomTransitionModifier;
  id v3 = [(SBTransitionSwitcherModifier *)&v12 transitionWillBegin];
  unint64_t direction = self->_direction;
  int v5 = objc_alloc_init(SBInvalidateAdjustedAppLayoutsSwitcherEventResponse);
  v6 = SBAppendSwitcherModifierResponse(v5, v3);

  id v7 = [SBUpdateLayoutSwitcherEventResponse alloc];
  if (direction == 1) {
    uint64_t v8 = 3;
  }
  else {
    uint64_t v8 = 2;
  }
  id v9 = [(SBUpdateLayoutSwitcherEventResponse *)v7 initWithOptions:10 updateMode:v8];
  id v10 = SBAppendSwitcherModifierResponse(v9, v6);

  return v10;
}

- (id)transitionDidEnd
{
  v7.receiver = self;
  v7.super_class = (Class)SBShelfZoomTransitionModifier;
  id v3 = [(SBTransitionSwitcherModifier *)&v7 transitionDidEnd];
  if (self->_direction == 1)
  {
    v4 = objc_alloc_init(SBInvalidateAdjustedAppLayoutsSwitcherEventResponse);
    uint64_t v5 = SBAppendSwitcherModifierResponse(v4, v3);

    id v3 = (void *)v5;
  }
  return v3;
}

- (id)appLayoutsToEnsureExistForMainTransitionEvent:(id)a3
{
  v12.receiver = self;
  v12.super_class = (Class)SBShelfZoomTransitionModifier;
  uint64_t v4 = [(SBShelfZoomTransitionModifier *)&v12 appLayoutsToEnsureExistForMainTransitionEvent:a3];
  uint64_t v5 = (void *)v4;
  v6 = (void *)MEMORY[0x1E4F1CBF0];
  if (v4) {
    v6 = (void *)v4;
  }
  id v7 = v6;

  uint64_t v8 = objc_msgSend(v7, "sb_arrayByInsertingOrMovingObject:toIndex:", self->_centerWindowAppLayout, 0);

  centerWindowBeingReplacedAppLayout = self->_centerWindowBeingReplacedAppLayout;
  if (centerWindowBeingReplacedAppLayout)
  {
    uint64_t v10 = objc_msgSend(v8, "sb_arrayByInsertingOrMovingObject:toIndex:", centerWindowBeingReplacedAppLayout, 1);

    uint64_t v8 = (void *)v10;
  }
  return v8;
}

- (id)visibleAppLayouts
{
  v8.receiver = self;
  v8.super_class = (Class)SBShelfZoomTransitionModifier;
  id v3 = [(SBShelfZoomTransitionModifier *)&v8 visibleAppLayouts];
  uint64_t v4 = (void *)[v3 mutableCopy];

  [v4 addObject:self->_centerWindowAppLayout];
  if (self->_fullScreenSpaceAppLayout) {
    objc_msgSend(v4, "addObject:");
  }
  unint64_t direction = self->_direction;
  if (!direction)
  {
    [v4 removeObject:self->_fromAppLayout];
    unint64_t direction = self->_direction;
  }
  if (direction == 1)
  {
    [v4 removeObject:self->_toAppLayout];
    if (self->_centerWindowBeingReplacedAppLayout) {
      objc_msgSend(v4, "addObject:");
    }
  }
  v6 = (void *)[v4 copy];

  return v6;
}

- (CGRect)frameForIndex:(unint64_t)a3
{
  uint64_t v5 = [(SBShelfZoomTransitionModifier *)self appLayouts];
  v6 = [v5 objectAtIndex:a3];

  if (v6 == self->_centerWindowAppLayout
    && [(SBShelfZoomTransitionModifier *)self _isEffectivelyInShelf])
  {
    [(SBShelfZoomTransitionModifier *)self _frameForCenterWindowInShelf];
  }
  else if (v6 == self->_centerWindowBeingReplacedAppLayout)
  {
    fromAppLayout = self->_fromAppLayout;
    [(SBShelfZoomTransitionModifier *)self containerViewBounds];
    -[SBShelfZoomTransitionModifier preferredFrameForLayoutRole:inAppLayout:bounds:interfaceOrientation:](self, "preferredFrameForLayoutRole:inAppLayout:bounds:interfaceOrientation:", 4, fromAppLayout, [(SBShelfZoomTransitionModifier *)self switcherInterfaceOrientation], v12, v13, v14, v15);
  }
  else
  {
    v24.receiver = self;
    v24.super_class = (Class)SBShelfZoomTransitionModifier;
    [(SBShelfZoomTransitionModifier *)&v24 frameForIndex:a3];
  }
  double v16 = v7;
  double v17 = v8;
  double v18 = v9;
  double v19 = v10;

  double v20 = v16;
  double v21 = v17;
  double v22 = v18;
  double v23 = v19;
  result.size.height = v23;
  result.size.width = v22;
  result.origin.y = v21;
  result.origin.x = v20;
  return result;
}

- (CGRect)_frameForCenterWindowInShelf
{
  [(SBShelfZoomTransitionModifier *)self shelfItemFrameForAppLayout:self->_centerWindowAppLayout inShelf:self->_shelf];
  UIRectGetCenter();
  [(SBShelfZoomTransitionModifier *)self centerWindowFrameInInterfaceOrientation:[(SBShelfZoomTransitionModifier *)self switcherInterfaceOrientation] centerConfiguration:1];
  SBRectWithSize();
  UIRectCenteredAboutPoint();
  result.size.height = v6;
  result.size.width = v5;
  result.origin.y = v4;
  result.origin.x = v3;
  return result;
}

- (double)scaleForIndex:(unint64_t)a3
{
  double v5 = [(SBShelfZoomTransitionModifier *)self appLayouts];
  double v6 = [v5 objectAtIndex:a3];

  if (v6 == self->_centerWindowAppLayout
    && [(SBShelfZoomTransitionModifier *)self _isEffectivelyInShelf])
  {
    [(SBShelfZoomTransitionModifier *)self shelfItemScaleForAppLayout:self->_centerWindowAppLayout inShelf:self->_shelf];
    double v8 = v7;
    [(SBShelfZoomTransitionModifier *)self shelfItemFrameForAppLayout:self->_centerWindowAppLayout inShelf:self->_shelf];
    double v10 = v9;
    [(SBShelfZoomTransitionModifier *)self centerWindowFrameInInterfaceOrientation:[(SBShelfZoomTransitionModifier *)self switcherInterfaceOrientation] centerConfiguration:1];
    SBRectWithSize();
    double v12 = v8 * (v10 / v11);
  }
  else if (v6 == self->_centerWindowBeingReplacedAppLayout)
  {
    double v14 = [(SBShelfZoomTransitionModifier *)self medusaSettings];
    [v14 switcherCenterWindowContentPushInScale];
    double v12 = v15;
  }
  else
  {
    v17.receiver = self;
    v17.super_class = (Class)SBShelfZoomTransitionModifier;
    [(SBShelfZoomTransitionModifier *)&v17 scaleForIndex:a3];
    double v12 = v13;
  }

  return v12;
}

- (double)scaleForLayoutRole:(int64_t)a3 inAppLayout:(id)a4
{
  if (self->_fullScreenSpaceAppLayout == a4) {
    -[SBShelfZoomTransitionModifier scaleForLayoutRole:inAppLayout:](&v6, sel_scaleForLayoutRole_inAppLayout_, a3, self->_toAppLayout, v5.receiver, v5.super_class, self, SBShelfZoomTransitionModifier);
  }
  else {
    -[SBShelfZoomTransitionModifier scaleForLayoutRole:inAppLayout:](&v5, sel_scaleForLayoutRole_inAppLayout_, a3, a4, self, SBShelfZoomTransitionModifier, v6.receiver, v6.super_class);
  }
  return result;
}

- (double)contentPageViewScaleForAppLayout:(id)a3 withScale:(double)a4
{
  objc_super v6 = (SBAppLayout *)a3;
  if (self->_centerWindowAppLayout == v6
    && [(SBShelfZoomTransitionModifier *)self _isEffectivelyInShelf])
  {
    double v7 = [(SBShelfZoomTransitionModifier *)self appLayouts];
    uint64_t v8 = [v7 indexOfObject:v6];

    [(SBShelfZoomTransitionModifier *)self scaleForIndex:v8];
  }
  else
  {
    v12.receiver = self;
    v12.super_class = (Class)SBShelfZoomTransitionModifier;
    [(SBShelfZoomTransitionModifier *)&v12 contentPageViewScaleForAppLayout:v6 withScale:a4];
  }
  double v10 = v9;

  return v10;
}

- (int64_t)shadowStyleForLayoutRole:(int64_t)a3 inAppLayout:(id)a4
{
  if (self->_centerWindowAppLayout == a4)
  {
    if ([(SBShelfZoomTransitionModifier *)self _isEffectivelyInShelf]) {
      return 3;
    }
    else {
      return 2;
    }
  }
  else
  {
    v5.receiver = self;
    v5.super_class = (Class)SBShelfZoomTransitionModifier;
    return -[SBShelfZoomTransitionModifier shadowStyleForLayoutRole:inAppLayout:](&v5, sel_shadowStyleForLayoutRole_inAppLayout_, a3);
  }
}

- (UIRectCornerRadii)cornerRadiiForIndex:(unint64_t)a3
{
  objc_super v5 = [(SBShelfZoomTransitionModifier *)self appLayouts];
  objc_super v6 = [v5 objectAtIndex:a3];

  if (v6 == self->_centerWindowAppLayout
    && [(SBShelfZoomTransitionModifier *)self _isEffectivelyInShelf])
  {
    [(SBShelfZoomTransitionModifier *)self shelfItemCornerRadiusForAppLayout:self->_centerWindowAppLayout inShelf:self->_shelf];
    SBRectCornerRadiiForRadius();
  }
  else
  {
    v19.receiver = self;
    v19.super_class = (Class)SBShelfZoomTransitionModifier;
    [(SBShelfZoomTransitionModifier *)&v19 cornerRadiiForIndex:a3];
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

- (double)opacityForLayoutRole:(int64_t)a3 inAppLayout:(id)a4 atIndex:(unint64_t)a5
{
  double v8 = (SBAppLayout *)a4;
  double v9 = v8;
  double v10 = 1.0;
  if (self->_centerWindowAppLayout != v8
    && self->_fullScreenSpaceAppLayout != v8
    && (self->_centerWindowBeingReplacedAppLayout != v8 || a3 != 4))
  {
    v14.receiver = self;
    v14.super_class = (Class)SBShelfZoomTransitionModifier;
    [(SBShelfZoomTransitionModifier *)&v14 opacityForLayoutRole:a3 inAppLayout:v8 atIndex:a5];
    double v10 = v12;
  }

  return v10;
}

- (double)shadowOpacityForLayoutRole:(int64_t)a3 atIndex:(unint64_t)a4
{
  double v7 = [(SBShelfZoomTransitionModifier *)self appLayouts];
  double v8 = [v7 objectAtIndex:a4];

  if (v8 == self->_centerWindowAppLayout)
  {
    double v10 = 1.0;
  }
  else
  {
    v12.receiver = self;
    v12.super_class = (Class)SBShelfZoomTransitionModifier;
    [(SBShelfZoomTransitionModifier *)&v12 shadowOpacityForLayoutRole:a3 atIndex:a4];
    double v10 = v9;
  }

  return v10;
}

- (id)hiddenAppLayoutsInShelf:(id)a3
{
  v7.receiver = self;
  v7.super_class = (Class)SBShelfZoomTransitionModifier;
  double v4 = [(SBShelfZoomTransitionModifier *)&v7 hiddenAppLayoutsInShelf:a3];
  objc_super v5 = [v4 setByAddingObject:self->_centerWindowAppLayout];

  return v5;
}

- (double)titleOpacityForIndex:(unint64_t)a3
{
  objc_super v5 = [(SBShelfZoomTransitionModifier *)self appLayouts];
  objc_super v6 = [v5 objectAtIndex:a3];

  if (v6 != self->_centerWindowAppLayout
    || (double v7 = 1.0, ![(SBShelfZoomTransitionModifier *)self _isEffectivelyInShelf]))
  {
    v10.receiver = self;
    v10.super_class = (Class)SBShelfZoomTransitionModifier;
    [(SBShelfZoomTransitionModifier *)&v10 titleOpacityForIndex:a3];
    double v7 = v8;
  }

  return v7;
}

- (double)titleAndIconOpacityForIndex:(unint64_t)a3
{
  objc_super v5 = [(SBShelfZoomTransitionModifier *)self appLayouts];
  objc_super v6 = [v5 objectAtIndex:a3];

  if (v6 != self->_centerWindowAppLayout
    || (double v7 = 1.0, ![(SBShelfZoomTransitionModifier *)self _isEffectivelyInShelf]))
  {
    v10.receiver = self;
    v10.super_class = (Class)SBShelfZoomTransitionModifier;
    [(SBShelfZoomTransitionModifier *)&v10 titleAndIconOpacityForIndex:a3];
    double v7 = v8;
  }

  return v7;
}

- (int64_t)headerStyleForIndex:(unint64_t)a3
{
  objc_super v5 = [(SBShelfZoomTransitionModifier *)self appLayouts];
  objc_super v6 = [v5 objectAtIndex:a3];

  if (v6 == self->_centerWindowAppLayout)
  {
    int64_t v7 = 1;
  }
  else
  {
    v9.receiver = self;
    v9.super_class = (Class)SBShelfZoomTransitionModifier;
    int64_t v7 = [(SBShelfZoomTransitionModifier *)&v9 headerStyleForIndex:a3];
  }

  return v7;
}

- (double)dimmingAlphaForLayoutRole:(int64_t)a3 inAppLayout:(id)a4
{
  objc_super v6 = (SBAppLayout *)a4;
  v12.receiver = self;
  v12.super_class = (Class)SBShelfZoomTransitionModifier;
  [(SBShelfZoomTransitionModifier *)&v12 dimmingAlphaForLayoutRole:a3 inAppLayout:v6];
  double v8 = v7;
  if ([(SBShelfZoomTransitionModifier *)self _shouldDimLayoutRole:a3 inAppLayout:v6 forZoomDirection:self->_direction]|| self->_centerWindowBeingReplacedAppLayout == v6)
  {
    objc_super v9 = [(SBShelfZoomTransitionModifier *)self medusaSettings];
    [v9 defaultDimmingOpacity];
    double v8 = v10;
  }
  return v8;
}

- (BOOL)_shouldDimLayoutRole:(int64_t)a3 inAppLayout:(id)a4 forZoomDirection:(unint64_t)a5
{
  if (self->_centerWindowAppLayout == a4) {
    return 0;
  }
  BOOL v6 = ![(SBShelfZoomTransitionModifier *)self _isEffectivelyInShelf];
  return a5 == 1 && v6;
}

- (id)topMostLayoutElements
{
  v8.receiver = self;
  v8.super_class = (Class)SBShelfZoomTransitionModifier;
  double v3 = [(SBShelfZoomTransitionModifier *)&v8 topMostLayoutElements];
  double v4 = objc_msgSend(v3, "sb_arrayByInsertingOrMovingObject:toIndex:", self->_centerWindowAppLayout, 0);

  centerWindowBeingReplacedAppLayout = self->_centerWindowBeingReplacedAppLayout;
  if (centerWindowBeingReplacedAppLayout)
  {
    uint64_t v6 = objc_msgSend(v4, "sb_arrayByInsertingOrMovingObject:toIndex:", centerWindowBeingReplacedAppLayout, 1);

    double v4 = (void *)v6;
  }
  return v4;
}

- (double)perspectiveAngleForAppLayout:(id)a3
{
  id v4 = a3;
  if (![v4 isEqual:self->_centerWindowAppLayout]
    || (double v5 = 0.0, ![(SBShelfZoomTransitionModifier *)self _isEffectivelyInShelf]))
  {
    v8.receiver = self;
    v8.super_class = (Class)SBShelfZoomTransitionModifier;
    [(SBShelfZoomTransitionModifier *)&v8 perspectiveAngleForAppLayout:v4];
    double v5 = v6;
  }

  return v5;
}

- (id)animationAttributesForLayoutElement:(id)a3
{
  v12.receiver = self;
  v12.super_class = (Class)SBShelfZoomTransitionModifier;
  id v4 = [(SBTransitionSwitcherModifier *)&v12 animationAttributesForLayoutElement:a3];
  double v5 = (void *)[v4 mutableCopy];

  double v6 = [(SBShelfZoomTransitionModifier *)self switcherSettings];
  double v7 = [v6 animationSettings];

  if (self->_direction == 1)
  {
    objc_super v8 = [v7 homeGestureEdgeRowZoomUpSettings];
    [v5 setLayoutSettings:v8];
  }
  else
  {
    objc_super v9 = [v7 homeGestureTopRowZoomDownLayoutSettings];
    [v5 setLayoutSettings:v9];

    double v10 = [v7 homeGestureTopRowZoomDownPositionSettings];
    [v5 setPositionSettings:v10];

    objc_super v8 = [v7 homeGestureTopRowZoomDownScaleSettings];
    [v5 setScaleSettings:v8];
  }

  return v5;
}

- (SBSwitcherShelfPresentationAttributes)presentationAttributesForShelf:(SEL)a3
{
  retstr->var3 = 0;
  *(_OWORD *)&retstr->var1.origin.y = 0u;
  *(_OWORD *)&retstr->var1.size.height = 0u;
  *(_OWORD *)&retstr->var0 = 0u;
  v6.receiver = self;
  v6.super_class = (Class)SBShelfZoomTransitionModifier;
  UIRectCornerRadii result = (SBSwitcherShelfPresentationAttributes *)[(SBSwitcherShelfPresentationAttributes *)&v6 presentationAttributesForShelf:a4];
  retstr->var2 = 0;
  return result;
}

- (SBSwitcherAsyncRenderingAttributes)asyncRenderingAttributesForAppLayout:(id)a3
{
  return (SBSwitcherAsyncRenderingAttributes)SBSwitcherAsyncRenderingAttributesMake(0, 0);
}

- (BOOL)_isEffectivelyInShelf
{
  unint64_t direction = self->_direction;
  if (direction != 1)
  {
    BOOL v4 = 0;
    if (direction) {
      goto LABEL_3;
    }
LABEL_5:
    BOOL v5 = [(SBTransitionSwitcherModifier *)self transitionPhase] > 1;
    return v4 || v5;
  }
  BOOL v4 = [(SBTransitionSwitcherModifier *)self transitionPhase] == 1;
  if (!self->_direction) {
    goto LABEL_5;
  }
LABEL_3:
  BOOL v5 = 0;
  return v4 || v5;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_centerWindowBeingReplacedAppLayout, 0);
  objc_storeStrong((id *)&self->_fullScreenSpaceAppLayout, 0);
  objc_storeStrong((id *)&self->_centerWindowAppLayout, 0);
  objc_storeStrong((id *)&self->_shelf, 0);
  objc_storeStrong((id *)&self->_toAppLayout, 0);
  objc_storeStrong((id *)&self->_fromAppLayout, 0);
}

@end