@interface SBWindowDeclineSwitcherModifier
- (CGPoint)anchorPointForIndex:(unint64_t)a3;
- (CGRect)frameForIndex:(unint64_t)a3;
- (CGRect)frameForLayoutRole:(int64_t)a3 inAppLayout:(id)a4 withBounds:(CGRect)a5;
- (SBSwitcherAsyncRenderingAttributes)asyncRenderingAttributesForAppLayout:(id)a3;
- (SBSwitcherWallpaperGradientAttributes)wallpaperGradientAttributesForIndex:(unint64_t)a3;
- (SBWindowDeclineSwitcherModifier)initWithTransitionID:(id)a3 fromAppLayout:(id)a4 layoutRole:(int64_t)a5;
- (UIRectCornerRadii)cornerRadiiForIndex:(unint64_t)a3;
- (double)dimmingAlphaForLayoutRole:(int64_t)a3 inAppLayout:(id)a4;
- (double)opacityForLayoutRole:(int64_t)a3 inAppLayout:(id)a4 atIndex:(unint64_t)a5;
- (double)perspectiveAngleForAppLayout:(id)a3;
- (double)scaleForIndex:(unint64_t)a3;
- (double)titleAndIconOpacityForIndex:(unint64_t)a3;
- (id)adjustedContinuousExposeIdentifiersInStripFromPreviousIdentifiersInStrip:(id)a3;
- (id)animationAttributesForLayoutElement:(id)a3;
- (id)appLayoutContainingAppLayout:(id)a3;
- (id)appLayoutsToEnsureExistForMainTransitionEvent:(id)a3;
- (id)topMostLayoutElements;
- (id)transitionWillBegin;
- (id)visibleAppLayouts;
@end

@implementation SBWindowDeclineSwitcherModifier

- (SBWindowDeclineSwitcherModifier)initWithTransitionID:(id)a3 fromAppLayout:(id)a4 layoutRole:(int64_t)a5
{
  id v9 = a4;
  v20.receiver = self;
  v20.super_class = (Class)SBWindowDeclineSwitcherModifier;
  v10 = [(SBTransitionSwitcherModifier *)&v20 initWithTransitionID:a3];
  v11 = v10;
  if (v10)
  {
    objc_storeStrong((id *)&v10->_fromAppLayout, a4);
    v11->_layoutRole = a5;
    uint64_t v12 = [v9 leafAppLayoutForRole:a5];
    centerWindowAppLayout = v11->_centerWindowAppLayout;
    v11->_centerWindowAppLayout = (SBAppLayout *)v12;

    v18[0] = MEMORY[0x1E4F143A8];
    v18[1] = 3221225472;
    v18[2] = __81__SBWindowDeclineSwitcherModifier_initWithTransitionID_fromAppLayout_layoutRole___block_invoke;
    v18[3] = &unk_1E6AF4B38;
    v14 = v11;
    v19 = v14;
    uint64_t v15 = [v9 appLayoutWithItemsPassingTest:v18];
    fullScreenAppLayout = v14->_fullScreenAppLayout;
    v14->_fullScreenAppLayout = (SBAppLayout *)v15;
  }
  return v11;
}

uint64_t __81__SBWindowDeclineSwitcherModifier_initWithTransitionID_fromAppLayout_layoutRole___block_invoke(uint64_t a1, void *a2)
{
  v2 = *(void **)(*(void *)(a1 + 32) + 152);
  id v3 = a2;
  v4 = [v2 itemForLayoutRole:1];
  int v5 = [v3 isEqual:v4];

  return v5 ^ 1u;
}

- (id)transitionWillBegin
{
  v15.receiver = self;
  v15.super_class = (Class)SBWindowDeclineSwitcherModifier;
  id v3 = [(SBTransitionSwitcherModifier *)&v15 transitionWillBegin];
  v4 = objc_alloc_init(SBInvalidateAdjustedAppLayoutsSwitcherEventResponse);
  int v5 = SBAppendSwitcherModifierResponse(v4, v3);

  v6 = [[SBUpdateLayoutSwitcherEventResponse alloc] initWithOptions:2 updateMode:2];
  v7 = SBAppendSwitcherModifierResponse(v6, v5);

  v8 = [(SBWindowDeclineSwitcherModifier *)self appLayouts];
  id v9 = (void *)[v8 mutableCopy];

  if (!self->_fullScreenAppLayout)
  {
    uint64_t v11 = [v9 indexOfObject:self->_centerWindowAppLayout];
    if (v11 == 0x7FFFFFFFFFFFFFFFLL)
    {
      [v9 insertObject:self->_centerWindowAppLayout atIndex:0];
      uint64_t v11 = 0;
    }
    goto LABEL_8;
  }
  uint64_t v10 = objc_msgSend(v9, "indexOfObject:");
  if (v10 != 0x7FFFFFFFFFFFFFFFLL)
  {
    uint64_t v11 = v10;
    [v9 replaceObjectAtIndex:v10 withObject:self->_fromAppLayout];
    goto LABEL_8;
  }
  uint64_t v11 = [v9 indexOfObject:self->_fromAppLayout];
  if (v11 != 0x7FFFFFFFFFFFFFFFLL)
  {
LABEL_8:
    uint64_t v12 = [[SBOverrideAppLayoutsSwitcherModifier alloc] initWithAppLayouts:v9];
    v14[0] = MEMORY[0x1E4F143A8];
    v14[1] = 3221225472;
    v14[2] = __54__SBWindowDeclineSwitcherModifier_transitionWillBegin__block_invoke;
    v14[3] = &unk_1E6AF4A70;
    v14[4] = self;
    v14[5] = v11;
    [(SBChainableModifier *)self performTransactionWithTemporaryChildModifier:v12 usingBlock:v14];
  }
  return v7;
}

id __54__SBWindowDeclineSwitcherModifier_transitionWillBegin__block_invoke(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 40);
  id v3 = (void *)(*(void *)(a1 + 32) + 168);
  v17.receiver = *(id *)(a1 + 32);
  v17.super_class = (Class)SBWindowDeclineSwitcherModifier;
  objc_msgSendSuper2(&v17, sel_frameForIndex_, v2);
  *id v3 = v4;
  v3[1] = v5;
  v3[2] = v6;
  v3[3] = v7;
  id v9 = *(void **)(a1 + 32);
  uint64_t v8 = *(void *)(a1 + 40);
  uint64_t v10 = v9 + 25;
  v16.receiver = v9;
  v16.super_class = (Class)SBWindowDeclineSwitcherModifier;
  id result = objc_msgSendSuper2(&v16, sel_cornerRadiiForIndex_, v8);
  void *v10 = v12;
  v10[1] = v13;
  v10[2] = v14;
  v10[3] = v15;
  return result;
}

- (id)appLayoutContainingAppLayout:(id)a3
{
  id v4 = a3;
  if ([(SBWindowDeclineSwitcherModifier *)self isChamoisWindowingUIEnabled]
    && [v4 isEqual:self->_centerWindowAppLayout])
  {
    if ([(SBTransitionSwitcherModifier *)self transitionPhase] < 2
      || (p_fromAppLayout = &self->_fullScreenAppLayout,
          ![(SBAppLayout *)self->_fullScreenAppLayout containsAnyItemFromAppLayout:self->_centerWindowAppLayout]))
    {
      p_fromAppLayout = &self->_fromAppLayout;
    }
    uint64_t v6 = *p_fromAppLayout;
  }
  else
  {
    v9.receiver = self;
    v9.super_class = (Class)SBWindowDeclineSwitcherModifier;
    uint64_t v6 = [(SBWindowDeclineSwitcherModifier *)&v9 appLayoutContainingAppLayout:v4];
  }
  uint64_t v7 = v6;

  return v7;
}

- (id)adjustedContinuousExposeIdentifiersInStripFromPreviousIdentifiersInStrip:(id)a3
{
  id v4 = a3;
  if ([(SBWindowDeclineSwitcherModifier *)self isChamoisWindowingUIEnabled]
    && [(SBTransitionSwitcherModifier *)self transitionPhase] >= 2
    && !self->_fullScreenAppLayout
    && ([(SBWindowDeclineSwitcherModifier *)self appLayoutOnStage],
        uint64_t v7 = objc_claimAutoreleasedReturnValue(),
        v7,
        v7))
  {
    uint64_t v18 = 0;
    v19 = &v18;
    uint64_t v20 = 0x3032000000;
    v21 = __Block_byref_object_copy__27;
    v22 = __Block_byref_object_dispose__27;
    id v23 = 0;
    v17.receiver = self;
    v17.super_class = (Class)SBWindowDeclineSwitcherModifier;
    uint64_t v8 = [(SBWindowDeclineSwitcherModifier *)&v17 appLayouts];
    v16[0] = MEMORY[0x1E4F143A8];
    v16[1] = 3221225472;
    v16[2] = __108__SBWindowDeclineSwitcherModifier_adjustedContinuousExposeIdentifiersInStripFromPreviousIdentifiersInStrip___block_invoke;
    v16[3] = &unk_1E6AF4B60;
    v16[4] = self;
    objc_super v9 = objc_msgSend(v8, "bs_filter:", v16);

    uint64_t v10 = [[SBOverrideAppLayoutsSwitcherModifier alloc] initWithAppLayouts:v9];
    v12[0] = MEMORY[0x1E4F143A8];
    v12[1] = 3221225472;
    v12[2] = __108__SBWindowDeclineSwitcherModifier_adjustedContinuousExposeIdentifiersInStripFromPreviousIdentifiersInStrip___block_invoke_2;
    v12[3] = &unk_1E6AF6380;
    uint64_t v15 = &v18;
    id v13 = v4;
    uint64_t v14 = self;
    [(SBChainableModifier *)self performTransactionWithTemporaryChildModifier:v10 usingBlock:v12];
    id v5 = (id)v19[5];

    _Block_object_dispose(&v18, 8);
  }
  else
  {
    v11.receiver = self;
    v11.super_class = (Class)SBWindowDeclineSwitcherModifier;
    id v5 = [(SBWindowDeclineSwitcherModifier *)&v11 adjustedContinuousExposeIdentifiersInStripFromPreviousIdentifiersInStrip:v4];
  }

  return v5;
}

uint64_t __108__SBWindowDeclineSwitcherModifier_adjustedContinuousExposeIdentifiersInStripFromPreviousIdentifiersInStrip___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  if ([v3 isEqual:*(void *)(*(void *)(a1 + 32) + 152)])
  {
    uint64_t v4 = 0;
  }
  else
  {
    id v5 = [*(id *)(a1 + 32) appLayoutOnStage];
    uint64_t v4 = [v3 isEqual:v5] ^ 1;
  }
  return v4;
}

void __108__SBWindowDeclineSwitcherModifier_adjustedContinuousExposeIdentifiersInStripFromPreviousIdentifiersInStrip___block_invoke_2(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 32);
  v6.receiver = *(id *)(a1 + 40);
  v6.super_class = (Class)SBWindowDeclineSwitcherModifier;
  uint64_t v3 = objc_msgSendSuper2(&v6, sel_adjustedContinuousExposeIdentifiersInStripFromPreviousIdentifiersInStrip_, v2);
  uint64_t v4 = *(void *)(*(void *)(a1 + 48) + 8);
  id v5 = *(void **)(v4 + 40);
  *(void *)(v4 + 40) = v3;
}

- (id)appLayoutsToEnsureExistForMainTransitionEvent:(id)a3
{
  v7.receiver = self;
  v7.super_class = (Class)SBWindowDeclineSwitcherModifier;
  uint64_t v4 = [(SBWindowDeclineSwitcherModifier *)&v7 appLayoutsToEnsureExistForMainTransitionEvent:a3];
  id v5 = objc_msgSend(v4, "sb_arrayByAddingOrMovingObject:", self->_centerWindowAppLayout);

  return v5;
}

- (id)animationAttributesForLayoutElement:(id)a3
{
  v12.receiver = self;
  v12.super_class = (Class)SBWindowDeclineSwitcherModifier;
  uint64_t v4 = (SBAppLayout *)a3;
  id v5 = [(SBTransitionSwitcherModifier *)&v12 animationAttributesForLayoutElement:v4];
  objc_super v6 = objc_msgSend(v5, "mutableCopy", v12.receiver, v12.super_class);

  centerWindowAppLayout = self->_centerWindowAppLayout;
  if (centerWindowAppLayout == v4)
  {
    uint64_t v8 = [(SBWindowDeclineSwitcherModifier *)self entityRemovalSettings];
    objc_super v9 = [v8 dosidoDeclineIntentAnimationSettings];
    uint64_t v10 = [v9 fromViewSlideOutAnimationSettings];
    [v6 setLayoutSettings:v10];
  }
  return v6;
}

- (double)dimmingAlphaForLayoutRole:(int64_t)a3 inAppLayout:(id)a4
{
  objc_super v6 = (SBAppLayout *)a4;
  if (self->_fullScreenAppLayout == v6 && [(SBTransitionSwitcherModifier *)self isPreparingLayout])
  {
    objc_super v7 = [(SBWindowDeclineSwitcherModifier *)self medusaSettings];
    [v7 defaultDimmingOpacity];
    double v9 = v8;
  }
  else if (self->_centerWindowAppLayout == v6)
  {
    double v9 = 0.0;
  }
  else
  {
    v12.receiver = self;
    v12.super_class = (Class)SBWindowDeclineSwitcherModifier;
    [(SBWindowDeclineSwitcherModifier *)&v12 dimmingAlphaForLayoutRole:a3 inAppLayout:v6];
    double v9 = v10;
  }

  return v9;
}

- (CGRect)frameForIndex:(unint64_t)a3
{
  id v5 = [(SBWindowDeclineSwitcherModifier *)self appLayouts];
  objc_super v6 = [v5 objectAtIndex:a3];

  if (v6 == self->_centerWindowAppLayout)
  {
    CGFloat x = self->_initialFrame.origin.x;
    double y = self->_initialFrame.origin.y;
    CGFloat width = self->_initialFrame.size.width;
    CGFloat height = self->_initialFrame.size.height;
    if ([(SBTransitionSwitcherModifier *)self isUpdatingLayout])
    {
      v27.origin.CGFloat x = x;
      v27.origin.double y = y;
      v27.size.CGFloat width = width;
      v27.size.CGFloat height = height;
      double v15 = CGRectGetHeight(v27);
      [(SBWindowDeclineSwitcherModifier *)self scaleForIndex:a3];
      double v17 = v15 * v16;
      uint64_t v18 = [(SBWindowDeclineSwitcherModifier *)self entityRemovalSettings];
      v19 = [v18 dosidoDeclineIntentAnimationSettings];
      [v19 fromViewSlideOutHeightOffsetMultiplier];
      double v21 = v17 * v20;

      double y = y + v21;
    }
  }
  else
  {
    v26.receiver = self;
    v26.super_class = (Class)SBWindowDeclineSwitcherModifier;
    [(SBWindowDeclineSwitcherModifier *)&v26 frameForIndex:a3];
    CGFloat x = v7;
    double y = v9;
    CGFloat width = v11;
    CGFloat height = v13;
  }

  double v22 = x;
  double v23 = y;
  double v24 = width;
  double v25 = height;
  result.size.CGFloat height = v25;
  result.size.CGFloat width = v24;
  result.origin.double y = v23;
  result.origin.CGFloat x = v22;
  return result;
}

- (CGRect)frameForLayoutRole:(int64_t)a3 inAppLayout:(id)a4 withBounds:(CGRect)a5
{
  double height = a5.size.height;
  double width = a5.size.width;
  double y = a5.origin.y;
  double x = a5.origin.x;
  double v11 = (SBAppLayout *)a4;
  objc_super v12 = v11;
  if (self->_centerWindowAppLayout == v11
    && ([(SBAppLayout *)v11 itemForLayoutRole:a3],
        double v13 = objc_claimAutoreleasedReturnValue(),
        [(SBAppLayout *)self->_fromAppLayout itemForLayoutRole:self->_layoutRole],
        uint64_t v14 = objc_claimAutoreleasedReturnValue(),
        int v15 = [v13 isEqual:v14],
        v14,
        v13,
        v15))
  {
    int64_t layoutRole = self->_layoutRole;
    fromAppLayout = self->_fromAppLayout;
    SBRectWithSize();
    -[SBWindowDeclineSwitcherModifier frameForLayoutRole:inAppLayout:withBounds:](&v35, sel_frameForLayoutRole_inAppLayout_withBounds_, layoutRole, fromAppLayout, v18, v19, v20, v21, v34.receiver, v34.super_class, self, SBWindowDeclineSwitcherModifier);
  }
  else
  {
    -[SBWindowDeclineSwitcherModifier frameForLayoutRole:inAppLayout:withBounds:](&v34, sel_frameForLayoutRole_inAppLayout_withBounds_, a3, v12, x, y, width, height, self, SBWindowDeclineSwitcherModifier, v35.receiver, v35.super_class);
  }
  double v26 = v22;
  double v27 = v23;
  double v28 = v24;
  double v29 = v25;

  double v30 = v26;
  double v31 = v27;
  double v32 = v28;
  double v33 = v29;
  result.size.double height = v33;
  result.size.double width = v32;
  result.origin.double y = v31;
  result.origin.double x = v30;
  return result;
}

- (CGPoint)anchorPointForIndex:(unint64_t)a3
{
  id v5 = [(SBWindowDeclineSwitcherModifier *)self appLayouts];
  objc_super v6 = [v5 objectAtIndex:a3];

  if (v6 == self->_centerWindowAppLayout)
  {
    double v8 = 0.5;
    double v10 = 0.5;
  }
  else
  {
    v13.receiver = self;
    v13.super_class = (Class)SBWindowDeclineSwitcherModifier;
    [(SBWindowDeclineSwitcherModifier *)&v13 anchorPointForIndex:a3];
    double v8 = v7;
    double v10 = v9;
  }

  double v11 = v8;
  double v12 = v10;
  result.double y = v12;
  result.double x = v11;
  return result;
}

- (double)opacityForLayoutRole:(int64_t)a3 inAppLayout:(id)a4 atIndex:(unint64_t)a5
{
  double v8 = (SBAppLayout *)a4;
  if (self->_centerWindowAppLayout != v8
    || (double v9 = 1.0, ![(SBTransitionSwitcherModifier *)self isUpdatingLayout]))
  {
    if (self->_fullScreenAppLayout == v8)
    {
      double v9 = 1.0;
    }
    else
    {
      v12.receiver = self;
      v12.super_class = (Class)SBWindowDeclineSwitcherModifier;
      [(SBWindowDeclineSwitcherModifier *)&v12 opacityForLayoutRole:a3 inAppLayout:v8 atIndex:a5];
      double v9 = v10;
    }
  }

  return v9;
}

- (double)titleAndIconOpacityForIndex:(unint64_t)a3
{
  id v5 = [(SBWindowDeclineSwitcherModifier *)self appLayouts];
  objc_super v6 = [v5 objectAtIndex:a3];

  double v7 = 0.0;
  if (([v6 isEqual:self->_centerWindowAppLayout] & 1) == 0)
  {
    v10.receiver = self;
    v10.super_class = (Class)SBWindowDeclineSwitcherModifier;
    [(SBWindowDeclineSwitcherModifier *)&v10 titleAndIconOpacityForIndex:a3];
    double v7 = v8;
  }

  return v7;
}

- (UIRectCornerRadii)cornerRadiiForIndex:(unint64_t)a3
{
  id v5 = [(SBWindowDeclineSwitcherModifier *)self appLayouts];
  objc_super v6 = [v5 objectAtIndex:a3];

  if ([v6 isEqual:self->_centerWindowAppLayout])
  {
    double topLeft = self->_initialCornerRadii.topLeft;
    double bottomLeft = self->_initialCornerRadii.bottomLeft;
    double bottomRight = self->_initialCornerRadii.bottomRight;
    double topRight = self->_initialCornerRadii.topRight;
  }
  else
  {
    v19.receiver = self;
    v19.super_class = (Class)SBWindowDeclineSwitcherModifier;
    [(SBWindowDeclineSwitcherModifier *)&v19 cornerRadiiForIndex:a3];
    double topLeft = v11;
    double bottomLeft = v12;
    double bottomRight = v13;
    double topRight = v14;
  }

  double v15 = topLeft;
  double v16 = bottomLeft;
  double v17 = bottomRight;
  double v18 = topRight;
  result.double topRight = v18;
  result.double bottomRight = v17;
  result.double bottomLeft = v16;
  result.double topLeft = v15;
  return result;
}

- (double)scaleForIndex:(unint64_t)a3
{
  id v5 = [(SBWindowDeclineSwitcherModifier *)self appLayouts];
  objc_super v6 = [v5 objectAtIndex:a3];

  if (v6 == self->_centerWindowAppLayout && [(SBTransitionSwitcherModifier *)self isUpdatingLayout])
  {
    double v7 = [(SBWindowDeclineSwitcherModifier *)self entityRemovalSettings];
    double v8 = [v7 dosidoDeleteIntentAnimationSettings];
    [v8 fromViewFinalScale];
    double v10 = v9;
  }
  else
  {
    v13.receiver = self;
    v13.super_class = (Class)SBWindowDeclineSwitcherModifier;
    [(SBWindowDeclineSwitcherModifier *)&v13 scaleForIndex:a3];
    double v10 = v11;
  }

  return v10;
}

- (id)topMostLayoutElements
{
  v9.receiver = self;
  v9.super_class = (Class)SBWindowDeclineSwitcherModifier;
  uint64_t v3 = [(SBWindowDeclineSwitcherModifier *)&v9 topMostLayoutElements];
  uint64_t v4 = (void *)[v3 mutableCopy];
  id v5 = v4;
  if (v4) {
    id v6 = v4;
  }
  else {
    id v6 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  }
  double v7 = v6;

  [v7 removeObject:self->_centerWindowAppLayout];
  [v7 insertObject:self->_centerWindowAppLayout atIndex:0];
  return v7;
}

- (id)visibleAppLayouts
{
  v6.receiver = self;
  v6.super_class = (Class)SBWindowDeclineSwitcherModifier;
  uint64_t v3 = [(SBWindowDeclineSwitcherModifier *)&v6 visibleAppLayouts];
  uint64_t v4 = (void *)[v3 mutableCopy];

  if (self->_centerWindowAppLayout) {
    objc_msgSend(v4, "addObject:");
  }
  if (self->_fullScreenAppLayout) {
    objc_msgSend(v4, "addObject:");
  }
  return v4;
}

- (SBSwitcherAsyncRenderingAttributes)asyncRenderingAttributesForAppLayout:(id)a3
{
  return (SBSwitcherAsyncRenderingAttributes)SBSwitcherAsyncRenderingAttributesMake(0, 0);
}

- (double)perspectiveAngleForAppLayout:(id)a3
{
  id v4 = a3;
  double v5 = 0.0;
  if (([v4 isEqual:self->_centerWindowAppLayout] & 1) == 0)
  {
    v8.receiver = self;
    v8.super_class = (Class)SBWindowDeclineSwitcherModifier;
    [(SBWindowDeclineSwitcherModifier *)&v8 perspectiveAngleForAppLayout:v4];
    double v5 = v6;
  }

  return v5;
}

- (SBSwitcherWallpaperGradientAttributes)wallpaperGradientAttributesForIndex:(unint64_t)a3
{
  double v5 = [(SBWindowDeclineSwitcherModifier *)self appLayouts];
  double v6 = [v5 objectAtIndex:a3];

  if ([v6 isEqual:self->_centerWindowAppLayout])
  {
    Emptdouble y = SBSwitcherWallpaperGradientAttributesMakeEmpty();
  }
  else
  {
    v13.receiver = self;
    v13.super_class = (Class)SBWindowDeclineSwitcherModifier;
    [(SBWindowDeclineSwitcherModifier *)&v13 wallpaperGradientAttributesForIndex:a3];
  }
  double v9 = Empty;
  double v10 = v8;

  double v11 = v9;
  double v12 = v10;
  result.trailingAlpha = v12;
  result.leadingAlpha = v11;
  return result;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_fullScreenAppLayout, 0);
  objc_storeStrong((id *)&self->_centerWindowAppLayout, 0);
  objc_storeStrong((id *)&self->_fromAppLayout, 0);
}

@end