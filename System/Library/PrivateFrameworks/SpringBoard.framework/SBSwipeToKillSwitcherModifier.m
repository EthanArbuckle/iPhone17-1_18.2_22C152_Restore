@interface SBSwipeToKillSwitcherModifier
- (BOOL)_dragHasBeenReleasedTowardKill;
- (BOOL)clipsToUnobscuredMarginAtIndex:(unint64_t)a3;
- (BOOL)shouldUseAnchorPointToPinLayoutRolesToSpace:(unint64_t)a3;
- (CGPoint)contentViewOffsetForAccessoriesOfAppLayout:(id)a3;
- (CGPoint)contentViewOffsetForLayoutRole:(int64_t)a3 inAppLayout:(id)a4;
- (CGRect)frameForIndex:(unint64_t)a3;
- (SBSwipeToKillSwitcherModifier)initWithLayoutRole:(int64_t)a3 inAppLayout:(id)a4 fadeOutSwipedItems:(BOOL)a5;
- (UIRectCornerRadii)cornerRadiiForLayoutRole:(int64_t)a3 inAppLayout:(id)a4 withCornerRadii:(UIRectCornerRadii)a5;
- (double)dimmingAlphaForLayoutRole:(int64_t)a3 inAppLayout:(id)a4;
- (double)lighteningAlphaForIndex:(unint64_t)a3;
- (double)opacityForLayoutRole:(int64_t)a3 inAppLayout:(id)a4 atIndex:(unint64_t)a5;
- (double)scaleForIndex:(unint64_t)a3;
- (double)shadowOffsetForIndex:(unint64_t)a3;
- (double)shadowOpacityForLayoutRole:(int64_t)a3 atIndex:(unint64_t)a4;
- (double)titleAndIconOpacityForIndex:(unint64_t)a3;
- (double)titleOpacityForIndex:(unint64_t)a3;
- (double)wallpaperOverlayAlphaForIndex:(unint64_t)a3;
- (id)animationAttributesForLayoutElement:(id)a3;
- (id)handleRemovalEvent:(id)a3;
- (id)handleSwipeToKillEvent:(id)a3;
- (id)visibleAppLayouts;
- (unint64_t)_interpolatingAdjacentIndexForIndex:(unint64_t)a3;
- (void)_calculateInterpolationDirection;
- (void)_performBlockWhileSimulatingPostRemovalAppLayoutState:(id)a3;
@end

@implementation SBSwipeToKillSwitcherModifier

- (SBSwipeToKillSwitcherModifier)initWithLayoutRole:(int64_t)a3 inAppLayout:(id)a4 fadeOutSwipedItems:(BOOL)a5
{
  id v10 = a4;
  v18.receiver = self;
  v18.super_class = (Class)SBSwipeToKillSwitcherModifier;
  v11 = [(SBSwitcherModifier *)&v18 init];
  if (v11)
  {
    if (!v10)
    {
      v17 = [MEMORY[0x1E4F28B00] currentHandler];
      [v17 handleFailureInMethod:a2, v11, @"SBSwipeToKillSwitcherModifier.m", 81, @"Invalid parameter not satisfying: %@", @"appLayout" object file lineNumber description];
    }
    v11->_layoutRole = a3;
    objc_storeStrong((id *)&v11->_appLayout, a4);
    uint64_t v12 = [v10 leafAppLayoutForRole:a3];
    leafAppLayout = v11->_leafAppLayout;
    v11->_leafAppLayout = (SBAppLayout *)v12;

    v11->_fadeOutSwipedItems = a5;
    v11->_hasPrepared = 0;
    v14 = [[SBHighlightSwitcherModifier alloc] initWithLayoutRole:v11->_layoutRole inAppLayout:v11->_appLayout listensForHighlightEvents:0];
    highlightModifier = v11->_highlightModifier;
    v11->_highlightModifier = v14;

    [(SBHighlightSwitcherModifier *)v11->_highlightModifier setStylesCornerRadii:0];
    [(SBChainableModifier *)v11 addChildModifier:v11->_highlightModifier];
  }

  return v11;
}

- (void)_performBlockWhileSimulatingPostRemovalAppLayoutState:(id)a3
{
  id v4 = a3;
  BOOL simulatingPostRemovalState = self->_simulatingPostRemovalState;
  self->_BOOL simulatingPostRemovalState = 1;
  id v6 = objc_alloc(MEMORY[0x1E4F1CA48]);
  v7 = [(SBSwipeToKillSwitcherModifier *)self appLayouts];
  v8 = (void *)[v6 initWithArray:v7];

  [v8 removeObject:self->_appLayout];
  v9 = [[SBOverrideAppLayoutsSwitcherModifier alloc] initWithAppLayouts:v8];
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = __87__SBSwipeToKillSwitcherModifier__performBlockWhileSimulatingPostRemovalAppLayoutState___block_invoke;
  v11[3] = &unk_1E6AF5300;
  id v12 = v4;
  id v10 = v4;
  [(SBChainableModifier *)self performTransactionWithTemporaryChildModifier:v9 usingBlock:v11];
  self->_BOOL simulatingPostRemovalState = simulatingPostRemovalState;
}

uint64_t __87__SBSwipeToKillSwitcherModifier__performBlockWhileSimulatingPostRemovalAppLayoutState___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (id)handleSwipeToKillEvent:(id)a3
{
  id v4 = a3;
  v21.receiver = self;
  v21.super_class = (Class)SBSwipeToKillSwitcherModifier;
  v5 = [(SBSwitcherModifier *)&v21 handleSwipeToKillEvent:v4];
  id v6 = [v4 appLayout];
  if (v6
    && ([(SBSwipeToKillSwitcherModifier *)self appLayouts],
        v7 = objc_claimAutoreleasedReturnValue(),
        char v8 = [v7 containsObject:v6],
        v7,
        (v8 & 1) != 0))
  {
    if ([(SBAppLayout *)self->_appLayout isEqual:v6])
    {
      if (!self->_hasPrepared) {
        [(SBSwipeToKillSwitcherModifier *)self _calculateInterpolationDirection];
      }
      [v4 progress];
      self->_progress = v9;
      [v4 translation];
      self->_translation.x = v10;
      self->_translation.y = v11;
      self->_isDragging = [v4 isDragging];
      [v4 decelerationTargetProgress];
      self->_decelerationTargetProgress = v12;
      v13 = [[SBUpdateLayoutSwitcherEventResponse alloc] initWithOptions:32 updateMode:2];
      v14 = +[SBChainableModifierEventResponse responseByAppendingResponse:v13 toResponse:v5];

      if (((BSFloatIsZero() & 1) != 0 || BSFloatGreaterThanOrEqualToFloat()) && !self->_isDragging)
      {
        [(SBChainableModifier *)self setState:1];
        if (![(SBSwipeToKillSwitcherModifier *)self _dragHasBeenReleasedTowardKill])
        {
          v15 = [[SBUpdateLayoutSwitcherEventResponse alloc] initWithOptions:8 updateMode:3];
          uint64_t v16 = SBAppendSwitcherModifierResponse(v15, v14);

          v14 = (void *)v16;
        }
      }
      self->_hasPrepared = 1;

      v5 = v14;
    }
  }
  else
  {
    [(SBChainableModifier *)self setState:1];
  }
  if (self->_fadeOutSwipedItems && self->_appLayout == v6)
  {
    v17 = [(SBAppLayout *)v6 leafAppLayoutForRole:self->_layoutRole];
    objc_super v18 = [[SBBlurItemContainerSwitcherEventResponse alloc] initWithAppLayout:v17 shouldBlur:[(SBSwipeToKillSwitcherModifier *)self _dragHasBeenReleasedTowardKill] animationUpdateMode:3];
    uint64_t v19 = +[SBChainableModifierEventResponse responseByAppendingResponse:v18 toResponse:v5];

    v5 = (void *)v19;
  }

  return v5;
}

- (id)handleRemovalEvent:(id)a3
{
  v8.receiver = self;
  v8.super_class = (Class)SBSwipeToKillSwitcherModifier;
  id v4 = a3;
  v5 = [(SBSwitcherModifier *)&v8 handleRemovalEvent:v4];
  id v6 = objc_msgSend(v4, "appLayout", v8.receiver, v8.super_class);

  if (v6 && [v6 isOrContainsAppLayout:self->_appLayout]) {
    [(SBChainableModifier *)self setState:1];
  }

  return v5;
}

- (CGRect)frameForIndex:(unint64_t)a3
{
  v23.receiver = self;
  v23.super_class = (Class)SBSwipeToKillSwitcherModifier;
  -[SBSwipeToKillSwitcherModifier frameForIndex:](&v23, sel_frameForIndex_);
  double v6 = v5;
  double v8 = v7;
  double v10 = v9;
  double v12 = v11;
  unint64_t v13 = [(SBSwipeToKillSwitcherModifier *)self _interpolatingAdjacentIndexForIndex:a3];
  if (v13 != 0x7FFFFFFFFFFFFFFFLL)
  {
    v22.receiver = self;
    v22.super_class = (Class)SBSwipeToKillSwitcherModifier;
    [(SBSwipeToKillSwitcherModifier *)&v22 frameForIndex:v13];
    BSRectByLinearlyInterpolatingRects();
    double v6 = v14;
    double v8 = v15;
    double v10 = v16;
    double v12 = v17;
  }
  double v18 = v6;
  double v19 = v8;
  double v20 = v10;
  double v21 = v12;
  result.size.height = v21;
  result.size.width = v20;
  result.origin.y = v19;
  result.origin.x = v18;
  return result;
}

- (double)scaleForIndex:(unint64_t)a3
{
  v11.receiver = self;
  v11.super_class = (Class)SBSwipeToKillSwitcherModifier;
  -[SBSwipeToKillSwitcherModifier scaleForIndex:](&v11, sel_scaleForIndex_);
  double v6 = v5;
  unint64_t v7 = [(SBSwipeToKillSwitcherModifier *)self _interpolatingAdjacentIndexForIndex:a3];
  if (v7 != 0x7FFFFFFFFFFFFFFFLL)
  {
    v10.receiver = self;
    v10.super_class = (Class)SBSwipeToKillSwitcherModifier;
    [(SBSwipeToKillSwitcherModifier *)&v10 scaleForIndex:v7];
    BSFloatByLinearlyInterpolatingFloats();
    return v8;
  }
  return v6;
}

- (double)dimmingAlphaForLayoutRole:(int64_t)a3 inAppLayout:(id)a4
{
  double v6 = (SBAppLayout *)a4;
  v10.receiver = self;
  v10.super_class = (Class)SBSwipeToKillSwitcherModifier;
  [(SBSwipeToKillSwitcherModifier *)&v10 dimmingAlphaForLayoutRole:a3 inAppLayout:v6];
  double v8 = v7;
  if (self->_appLayout == v6 && ![(SBAppLayout *)v6 isCenterOverFull]) {
    double v8 = v8 + (0.0 - v8) * self->_progress;
  }

  return fmin(fmax(v8, 0.0), 1.0);
}

- (double)titleAndIconOpacityForIndex:(unint64_t)a3
{
  double v5 = [(SBSwipeToKillSwitcherModifier *)self appLayouts];
  double v6 = [v5 objectAtIndex:a3];

  if (![(SBAppLayout *)self->_appLayout isEqual:v6]
    || (double v7 = 0.0, !self->_isDragging) && BSFloatIsZero())
  {
    v10.receiver = self;
    v10.super_class = (Class)SBSwipeToKillSwitcherModifier;
    [(SBSwipeToKillSwitcherModifier *)&v10 titleAndIconOpacityForIndex:a3];
    double v7 = v8;
  }

  return v7;
}

- (UIRectCornerRadii)cornerRadiiForLayoutRole:(int64_t)a3 inAppLayout:(id)a4 withCornerRadii:(UIRectCornerRadii)a5
{
  double topRight = a5.topRight;
  double bottomRight = a5.bottomRight;
  double bottomLeft = a5.bottomLeft;
  double topLeft = a5.topLeft;
  id v11 = a4;
  if (![(SBAppLayout *)self->_appLayout isEqual:v11]
    || !self->_isDragging && (BSFloatIsZero() & 1) != 0
    || a3 == 4
    || ([(SBSwipeToKillSwitcherModifier *)self shouldTetherItemsAndAccessoriesInAppLayout:v11] & 1) != 0)
  {
    v26.receiver = self;
    v26.super_class = (Class)SBSwipeToKillSwitcherModifier;
    -[SBSwipeToKillSwitcherModifier cornerRadiiForLayoutRole:inAppLayout:withCornerRadii:](&v26, sel_cornerRadiiForLayoutRole_inAppLayout_withCornerRadii_, a3, v11, topLeft, bottomLeft, bottomRight, topRight);
  }
  else
  {
    v24 = [(SBSwipeToKillSwitcherModifier *)self appLayouts];
    uint64_t v25 = [v24 indexOfObject:v11];

    [(SBSwipeToKillSwitcherModifier *)self cornerRadiiForIndex:v25];
    SBRectCornerRadiiForRadius();
  }
  double v16 = v12;
  double v17 = v13;
  double v18 = v14;
  double v19 = v15;

  double v20 = v16;
  double v21 = v17;
  double v22 = v18;
  double v23 = v19;
  result.double topRight = v23;
  result.double bottomRight = v22;
  result.double bottomLeft = v21;
  result.double topLeft = v20;
  return result;
}

- (id)visibleAppLayouts
{
  v13.receiver = self;
  v13.super_class = (Class)SBSwipeToKillSwitcherModifier;
  v3 = [(SBSwipeToKillSwitcherModifier *)&v13 visibleAppLayouts];
  uint64_t v7 = 0;
  double v8 = &v7;
  uint64_t v9 = 0x3032000000;
  objc_super v10 = __Block_byref_object_copy__83;
  id v11 = __Block_byref_object_dispose__83;
  id v12 = 0;
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __50__SBSwipeToKillSwitcherModifier_visibleAppLayouts__block_invoke;
  v6[3] = &unk_1E6AF4B88;
  v6[4] = self;
  v6[5] = &v7;
  [(SBSwipeToKillSwitcherModifier *)self _performBlockWhileSimulatingPostRemovalAppLayoutState:v6];
  id v4 = [v3 setByAddingObjectsFromSet:v8[5]];
  _Block_object_dispose(&v7, 8);

  return v4;
}

void __50__SBSwipeToKillSwitcherModifier_visibleAppLayouts__block_invoke(uint64_t a1)
{
  v5.receiver = *(id *)(a1 + 32);
  v5.super_class = (Class)SBSwipeToKillSwitcherModifier;
  uint64_t v2 = objc_msgSendSuper2(&v5, sel_visibleAppLayouts);
  uint64_t v3 = *(void *)(*(void *)(a1 + 40) + 8);
  id v4 = *(void **)(v3 + 40);
  *(void *)(v3 + 40) = v2;
}

- (id)animationAttributesForLayoutElement:(id)a3
{
  id v4 = (SBAppLayout *)a3;
  v12.receiver = self;
  v12.super_class = (Class)SBSwipeToKillSwitcherModifier;
  objc_super v5 = [(SBSwipeToKillSwitcherModifier *)&v12 animationAttributesForLayoutElement:v4];
  double v6 = (void *)[v5 mutableCopy];

  if ([(SBAppLayout *)v4 switcherLayoutElementType]
    || ([(SBSwipeToKillSwitcherModifier *)self shouldTetherItemsAndAccessoriesInAppLayout:v4] & 1) == 0)
  {
    uint64_t v7 = 5;
  }
  else
  {
    uint64_t v7 = 1;
  }
  [v6 setUpdateMode:v7];
  [v6 setCornerRadiusUpdateMode:3];
  if (self->_fadeOutSwipedItems && self->_appLayout == v4)
  {
    double v8 = [(SBSwipeToKillSwitcherModifier *)self switcherSettings];
    uint64_t v9 = [v8 animationSettings];
    objc_super v10 = [v9 swipeToKillOpacitySettings];
    [v6 setOpacitySettings:v10];
  }
  return v6;
}

- (BOOL)clipsToUnobscuredMarginAtIndex:(unint64_t)a3
{
  return 0;
}

- (double)opacityForLayoutRole:(int64_t)a3 inAppLayout:(id)a4 atIndex:(unint64_t)a5
{
  double v8 = (SBAppLayout *)a4;
  v14.receiver = self;
  v14.super_class = (Class)SBSwipeToKillSwitcherModifier;
  [(SBSwipeToKillSwitcherModifier *)&v14 opacityForLayoutRole:a3 inAppLayout:v8 atIndex:a5];
  double v10 = v9;
  if ([(SBSwipeToKillSwitcherModifier *)self _interpolatingAdjacentIndexForIndex:a5] != 0x7FFFFFFFFFFFFFFFLL)
  {
    v13.receiver = self;
    v13.super_class = (Class)SBSwipeToKillSwitcherModifier;
    [(SBSwipeToKillSwitcherModifier *)&v13 opacityForLayoutRole:a3 inAppLayout:v8 atIndex:a5];
    BSFloatByLinearlyInterpolatingFloats();
    double v10 = v11;
  }
  if (self->_fadeOutSwipedItems
    && self->_appLayout == v8
    && self->_layoutRole == a3
    && [(SBSwipeToKillSwitcherModifier *)self _dragHasBeenReleasedTowardKill])
  {
    double v10 = 0.0;
  }

  return v10;
}

- (double)wallpaperOverlayAlphaForIndex:(unint64_t)a3
{
  v11.receiver = self;
  v11.super_class = (Class)SBSwipeToKillSwitcherModifier;
  -[SBSwipeToKillSwitcherModifier wallpaperOverlayAlphaForIndex:](&v11, sel_wallpaperOverlayAlphaForIndex_);
  double v6 = v5;
  unint64_t v7 = [(SBSwipeToKillSwitcherModifier *)self _interpolatingAdjacentIndexForIndex:a3];
  if (v7 != 0x7FFFFFFFFFFFFFFFLL)
  {
    v10.receiver = self;
    v10.super_class = (Class)SBSwipeToKillSwitcherModifier;
    [(SBSwipeToKillSwitcherModifier *)&v10 wallpaperOverlayAlphaForIndex:v7];
    BSFloatByLinearlyInterpolatingFloats();
    return v8;
  }
  return v6;
}

- (double)lighteningAlphaForIndex:(unint64_t)a3
{
  v11.receiver = self;
  v11.super_class = (Class)SBSwipeToKillSwitcherModifier;
  -[SBSwipeToKillSwitcherModifier lighteningAlphaForIndex:](&v11, sel_lighteningAlphaForIndex_);
  double v6 = v5;
  unint64_t v7 = [(SBSwipeToKillSwitcherModifier *)self _interpolatingAdjacentIndexForIndex:a3];
  if (v7 != 0x7FFFFFFFFFFFFFFFLL)
  {
    v10.receiver = self;
    v10.super_class = (Class)SBSwipeToKillSwitcherModifier;
    [(SBSwipeToKillSwitcherModifier *)&v10 lighteningAlphaForIndex:v7];
    BSFloatByLinearlyInterpolatingFloats();
    return v8;
  }
  return v6;
}

- (double)titleOpacityForIndex:(unint64_t)a3
{
  v11.receiver = self;
  v11.super_class = (Class)SBSwipeToKillSwitcherModifier;
  -[SBSwipeToKillSwitcherModifier titleOpacityForIndex:](&v11, sel_titleOpacityForIndex_);
  double v6 = v5;
  unint64_t v7 = [(SBSwipeToKillSwitcherModifier *)self _interpolatingAdjacentIndexForIndex:a3];
  if (v7 != 0x7FFFFFFFFFFFFFFFLL)
  {
    v10.receiver = self;
    v10.super_class = (Class)SBSwipeToKillSwitcherModifier;
    [(SBSwipeToKillSwitcherModifier *)&v10 titleOpacityForIndex:v7];
    BSFloatByLinearlyInterpolatingFloats();
    return v8;
  }
  return v6;
}

- (double)shadowOpacityForLayoutRole:(int64_t)a3 atIndex:(unint64_t)a4
{
  v12.receiver = self;
  v12.super_class = (Class)SBSwipeToKillSwitcherModifier;
  -[SBSwipeToKillSwitcherModifier shadowOpacityForLayoutRole:atIndex:](&v12, sel_shadowOpacityForLayoutRole_atIndex_);
  double v8 = v7;
  if ([(SBSwipeToKillSwitcherModifier *)self _interpolatingAdjacentIndexForIndex:a4] != 0x7FFFFFFFFFFFFFFFLL)
  {
    v11.receiver = self;
    v11.super_class = (Class)SBSwipeToKillSwitcherModifier;
    [(SBSwipeToKillSwitcherModifier *)&v11 shadowOpacityForLayoutRole:a3 atIndex:a4];
    BSFloatByLinearlyInterpolatingFloats();
    return v9;
  }
  return v8;
}

- (double)shadowOffsetForIndex:(unint64_t)a3
{
  v11.receiver = self;
  v11.super_class = (Class)SBSwipeToKillSwitcherModifier;
  -[SBSwipeToKillSwitcherModifier shadowOffsetForIndex:](&v11, sel_shadowOffsetForIndex_);
  double v6 = v5;
  unint64_t v7 = [(SBSwipeToKillSwitcherModifier *)self _interpolatingAdjacentIndexForIndex:a3];
  if (v7 != 0x7FFFFFFFFFFFFFFFLL)
  {
    v10.receiver = self;
    v10.super_class = (Class)SBSwipeToKillSwitcherModifier;
    [(SBSwipeToKillSwitcherModifier *)&v10 shadowOffsetForIndex:v7];
    BSFloatByLinearlyInterpolatingFloats();
    return v8;
  }
  return v6;
}

- (CGPoint)contentViewOffsetForLayoutRole:(int64_t)a3 inAppLayout:(id)a4
{
  double v6 = (SBAppLayout *)a4;
  v13.receiver = self;
  v13.super_class = (Class)SBSwipeToKillSwitcherModifier;
  [(SBSwipeToKillSwitcherModifier *)&v13 contentViewOffsetForLayoutRole:a3 inAppLayout:v6];
  double v8 = v7;
  double v10 = v9;
  if (self->_appLayout == v6
    && self->_layoutRole != a3
    && [(SBSwipeToKillSwitcherModifier *)self shouldTetherItemsAndAccessoriesInAppLayout:v6])
  {
    double v8 = v8 + 0.0;
    double v10 = v10 - self->_translation.y;
  }

  double v11 = v8;
  double v12 = v10;
  result.y = v12;
  result.x = v11;
  return result;
}

- (CGPoint)contentViewOffsetForAccessoriesOfAppLayout:(id)a3
{
  id v4 = (SBAppLayout *)a3;
  v11.receiver = self;
  v11.super_class = (Class)SBSwipeToKillSwitcherModifier;
  [(SBSwipeToKillSwitcherModifier *)&v11 contentViewOffsetForAccessoriesOfAppLayout:v4];
  double v6 = v5;
  double v8 = v7;
  if (self->_appLayout == v4
    && [(SBSwipeToKillSwitcherModifier *)self shouldTetherItemsAndAccessoriesInAppLayout:v4])
  {
    double v6 = v6 + 0.0;
    double v8 = v8 - self->_translation.y;
  }

  double v9 = v6;
  double v10 = v8;
  result.y = v10;
  result.x = v9;
  return result;
}

- (BOOL)shouldUseAnchorPointToPinLayoutRolesToSpace:(unint64_t)a3
{
  double v5 = [(SBSwipeToKillSwitcherModifier *)self appLayouts];
  double v6 = [v5 objectAtIndex:a3];

  if (v6 == self->_appLayout)
  {
    BOOL v7 = 0;
  }
  else
  {
    v9.receiver = self;
    v9.super_class = (Class)SBSwipeToKillSwitcherModifier;
    BOOL v7 = [(SBSwipeToKillSwitcherModifier *)&v9 shouldUseAnchorPointToPinLayoutRolesToSpace:a3];
  }

  return v7;
}

- (void)_calculateInterpolationDirection
{
  v21.receiver = self;
  v21.super_class = (Class)SBSwipeToKillSwitcherModifier;
  uint64_t v3 = [(SBSwipeToKillSwitcherModifier *)&v21 scrollViewAttributes];
  int v4 = [v3 interpolatesDuringSwipeToKill];

  if (v4)
  {
    [(SBSwipeToKillSwitcherModifier *)self scrollViewContentOffset];
    double v6 = v5;
    BOOL v7 = [(SBSwipeToKillSwitcherModifier *)self appLayouts];
    uint64_t v8 = [v7 indexOfObject:self->_appLayout];

    uint64_t v9 = [(SBSwipeToKillSwitcherModifier *)self indexToScrollToAfterRemovingIndex:v8];
    uint64_t v15 = 0;
    double v16 = (double *)&v15;
    uint64_t v17 = 0x3010000000;
    uint64_t v19 = 0;
    uint64_t v20 = 0;
    double v18 = &unk_1D90ED3C6;
    v14[0] = MEMORY[0x1E4F143A8];
    v14[1] = 3221225472;
    v14[2] = __65__SBSwipeToKillSwitcherModifier__calculateInterpolationDirection__block_invoke;
    v14[3] = &unk_1E6AF6358;
    v14[5] = &v15;
    v14[6] = v9;
    v14[4] = self;
    [(SBSwipeToKillSwitcherModifier *)self _performBlockWhileSimulatingPostRemovalAppLayoutState:v14];
    char v10 = [(SBSwipeToKillSwitcherModifier *)self isRTLEnabled];
    double v11 = v16[4];
    double v12 = 0.0;
    if (v11 < 0.0) {
      double v11 = 0.0;
    }
    if (v6 >= 0.0) {
      double v12 = v6;
    }
    if (v10)
    {
      if (v11 >= v12)
      {
LABEL_8:
        unint64_t v13 = 1;
LABEL_12:
        _Block_object_dispose(&v15, 8);
        goto LABEL_13;
      }
    }
    else if (v11 < v12)
    {
      goto LABEL_8;
    }
    unint64_t v13 = 2;
    goto LABEL_12;
  }
  unint64_t v13 = 0;
LABEL_13:
  self->_interpolationDirection = v13;
}

id __65__SBSwipeToKillSwitcherModifier__calculateInterpolationDirection__block_invoke(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 48);
  v7.receiver = *(id *)(a1 + 32);
  v7.super_class = (Class)SBSwipeToKillSwitcherModifier;
  id result = objc_msgSendSuper2(&v7, sel_contentOffsetForIndex_alignment_, v2, 0);
  uint64_t v4 = *(void *)(*(void *)(a1 + 40) + 8);
  *(void *)(v4 + 32) = v5;
  *(void *)(v4 + 40) = v6;
  return result;
}

- (unint64_t)_interpolatingAdjacentIndexForIndex:(unint64_t)a3
{
  if (!self->_interpolationDirection) {
    return 0x7FFFFFFFFFFFFFFFLL;
  }
  uint64_t v5 = [(SBSwipeToKillSwitcherModifier *)self appLayouts];
  unint64_t v6 = [v5 indexOfObject:self->_appLayout];
  unint64_t interpolationDirection = self->_interpolationDirection;
  if (interpolationDirection != 1 || v6 >= a3)
  {
    unint64_t v10 = 0x7FFFFFFFFFFFFFFFLL;
    BOOL v9 = interpolationDirection == 2 && v6 > a3;
    if (v9 && [v5 count] - 1 > a3) {
      unint64_t v10 = a3 + 1;
    }
  }
  else
  {
    unint64_t v10 = a3 - 1;
  }

  return v10;
}

- (BOOL)_dragHasBeenReleasedTowardKill
{
  return BSFloatIsZero() ^ 1;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_highlightModifier, 0);
  objc_storeStrong((id *)&self->_leafAppLayout, 0);
  objc_storeStrong((id *)&self->_appLayout, 0);
}

@end