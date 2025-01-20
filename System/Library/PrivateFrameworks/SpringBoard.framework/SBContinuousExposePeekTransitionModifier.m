@interface SBContinuousExposePeekTransitionModifier
- (BOOL)isLayoutRoleMatchMovedToScene:(int64_t)a3 inAppLayout:(id)a4;
- (CGRect)frameForIndex:(unint64_t)a3;
- (CGRect)frameForLayoutRole:(int64_t)a3 inAppLayout:(id)a4 withBounds:(CGRect)a5;
- (SBAppLayout)fromAppLayout;
- (SBAppLayout)toAppLayout;
- (SBContinuousExposePeekTransitionModifier)initWithTransitionID:(id)a3 fromAppLayout:(id)a4 toAppLayout:(id)a5 direction:(unint64_t)a6;
- (double)blurDelayForLayoutRole:(int64_t)a3 inAppLayout:(id)a4;
- (double)scaleForIndex:(unint64_t)a3;
- (double)scaleForLayoutRole:(int64_t)a3 inAppLayout:(id)a4;
- (id)animationAttributesForLayoutElement:(id)a3;
- (id)topMostLayoutElements;
- (id)transitionWillBegin;
- (id)visibleAppLayouts;
- (unint64_t)direction;
@end

@implementation SBContinuousExposePeekTransitionModifier

- (SBContinuousExposePeekTransitionModifier)initWithTransitionID:(id)a3 fromAppLayout:(id)a4 toAppLayout:(id)a5 direction:(unint64_t)a6
{
  id v12 = a4;
  id v13 = a5;
  v22.receiver = self;
  v22.super_class = (Class)SBContinuousExposePeekTransitionModifier;
  v14 = [(SBTransitionSwitcherModifier *)&v22 initWithTransitionID:a3];
  if (v14)
  {
    if (!v12)
    {
      v21 = [MEMORY[0x1E4F28B00] currentHandler];
      [v21 handleFailureInMethod:a2, v14, @"SBContinuousExposePeekTransitionModifier.m", 25, @"Invalid parameter not satisfying: %@", @"fromAppLayout" object file lineNumber description];
    }
    objc_storeStrong((id *)&v14->_fromAppLayout, a4);
    p_toAppLayout = &v14->_toAppLayout;
    objc_storeStrong((id *)&v14->_toAppLayout, a5);
    v14->_direction = a6;
    v16 = [[SBFullScreenContinuousExposeSwitcherModifier alloc] initWithFullScreenAppLayout:v14->_fromAppLayout];
    fromFullScreenContinuousExposeModifier = v14->_fromFullScreenContinuousExposeModifier;
    v14->_fromFullScreenContinuousExposeModifier = v16;

    if (a6 == 1 && *p_toAppLayout)
    {
      v18 = [[SBFullScreenContinuousExposeSwitcherModifier alloc] initWithFullScreenAppLayout:*p_toAppLayout];
      toFullScreenContinuousExposeModifier = v14->_toFullScreenContinuousExposeModifier;
      v14->_toFullScreenContinuousExposeModifier = v18;
    }
  }

  return v14;
}

- (id)transitionWillBegin
{
  v6.receiver = self;
  v6.super_class = (Class)SBContinuousExposePeekTransitionModifier;
  v2 = [(SBTransitionSwitcherModifier *)&v6 transitionWillBegin];
  v3 = [[SBUpdateLayoutSwitcherEventResponse alloc] initWithOptions:4 updateMode:4];
  v4 = SBAppendSwitcherModifierResponse(v3, v2);

  return v4;
}

- (id)visibleAppLayouts
{
  v7.receiver = self;
  v7.super_class = (Class)SBContinuousExposePeekTransitionModifier;
  v3 = [(SBContinuousExposePeekTransitionModifier *)&v7 visibleAppLayouts];
  v4 = v3;
  if (self->_direction == 1)
  {
    uint64_t v5 = [v3 setByAddingObject:self->_fromAppLayout];

    v4 = (void *)v5;
  }
  return v4;
}

- (CGRect)frameForIndex:(unint64_t)a3
{
  uint64_t v5 = [(SBContinuousExposePeekTransitionModifier *)self appLayouts];
  objc_super v6 = [v5 objectAtIndex:a3];

  if (self->_direction == 1)
  {
    if ([(SBTransitionSwitcherModifier *)self transitionPhase] >= 2
      && [v6 isEqual:self->_fromAppLayout]
      && ![(SBAppLayout *)self->_toAppLayout containsAnyItemFromAppLayout:self->_fromAppLayout])
    {
      uint64_t v24 = 0;
      v25 = (double *)&v24;
      uint64_t v26 = 0x4010000000;
      v27 = &unk_1D90ED3C6;
      fromFullScreenContinuousExposeModifier = self->_fromFullScreenContinuousExposeModifier;
      long long v28 = 0u;
      long long v29 = 0u;
      v23[0] = MEMORY[0x1E4F143A8];
      v23[1] = 3221225472;
      v23[2] = __58__SBContinuousExposePeekTransitionModifier_frameForIndex___block_invoke;
      v23[3] = &unk_1E6AF6358;
      v23[4] = self;
      v23[5] = &v24;
      v23[6] = a3;
      [(SBChainableModifier *)self performTransactionWithTemporaryChildModifier:fromFullScreenContinuousExposeModifier usingBlock:v23];
      goto LABEL_14;
    }
    if (self->_direction == 1
      && [(SBTransitionSwitcherModifier *)self transitionPhase] >= 2
      && self->_toFullScreenContinuousExposeModifier
      && [(SBAppLayout *)self->_toAppLayout containsAnyItemFromAppLayout:v6]
      && [(SBAppLayout *)self->_fromAppLayout containsAnyItemFromAppLayout:v6])
    {
      uint64_t v24 = 0;
      v25 = (double *)&v24;
      uint64_t v26 = 0x4010000000;
      v27 = &unk_1D90ED3C6;
      toFullScreenContinuousExposeModifier = self->_toFullScreenContinuousExposeModifier;
      long long v28 = 0u;
      long long v29 = 0u;
      v22[0] = MEMORY[0x1E4F143A8];
      v22[1] = 3221225472;
      v22[2] = __58__SBContinuousExposePeekTransitionModifier_frameForIndex___block_invoke_2;
      v22[3] = &unk_1E6AF6358;
      v22[4] = self;
      v22[5] = &v24;
      v22[6] = a3;
      [(SBChainableModifier *)self performTransactionWithTemporaryChildModifier:toFullScreenContinuousExposeModifier usingBlock:v22];
LABEL_14:
      double v9 = v25[4];
      double v11 = v25[5];
      double v13 = v25[6];
      double v15 = v25[7];
      _Block_object_dispose(&v24, 8);
      goto LABEL_12;
    }
  }
  v21.receiver = self;
  v21.super_class = (Class)SBContinuousExposePeekTransitionModifier;
  [(SBContinuousExposePeekTransitionModifier *)&v21 frameForIndex:a3];
  double v9 = v8;
  double v11 = v10;
  double v13 = v12;
  double v15 = v14;
LABEL_12:

  double v16 = v9;
  double v17 = v11;
  double v18 = v13;
  double v19 = v15;
  result.size.height = v19;
  result.size.width = v18;
  result.origin.y = v17;
  result.origin.x = v16;
  return result;
}

uint64_t __58__SBContinuousExposePeekTransitionModifier_frameForIndex___block_invoke(void *a1)
{
  uint64_t result = [*(id *)(a1[4] + 136) frameForIndex:a1[6]];
  v3 = *(void **)(a1[5] + 8);
  v3[4] = v4;
  v3[5] = v5;
  v3[6] = v6;
  v3[7] = v7;
  return result;
}

uint64_t __58__SBContinuousExposePeekTransitionModifier_frameForIndex___block_invoke_2(void *a1)
{
  uint64_t result = [*(id *)(a1[4] + 144) frameForIndex:a1[6]];
  v3 = *(void **)(a1[5] + 8);
  v3[4] = v4;
  v3[5] = v5;
  v3[6] = v6;
  v3[7] = v7;
  return result;
}

- (double)scaleForIndex:(unint64_t)a3
{
  uint64_t v5 = [(SBContinuousExposePeekTransitionModifier *)self appLayouts];
  uint64_t v6 = [v5 objectAtIndex:a3];

  if (self->_direction == 1)
  {
    if ([(SBTransitionSwitcherModifier *)self transitionPhase] >= 2
      && [v6 isEqual:self->_fromAppLayout]
      && ![(SBAppLayout *)self->_toAppLayout containsAnyItemFromAppLayout:self->_fromAppLayout])
    {
      uint64_t v15 = 0;
      double v16 = (double *)&v15;
      uint64_t v17 = 0x2020000000;
      fromFullScreenContinuousExposeModifier = self->_fromFullScreenContinuousExposeModifier;
      uint64_t v18 = 0;
      v14[0] = MEMORY[0x1E4F143A8];
      v14[1] = 3221225472;
      v14[2] = __58__SBContinuousExposePeekTransitionModifier_scaleForIndex___block_invoke;
      v14[3] = &unk_1E6AF6358;
      v14[4] = self;
      v14[5] = &v15;
      v14[6] = a3;
      [(SBChainableModifier *)self performTransactionWithTemporaryChildModifier:fromFullScreenContinuousExposeModifier usingBlock:v14];
      goto LABEL_14;
    }
    if (self->_direction == 1
      && [(SBTransitionSwitcherModifier *)self transitionPhase] >= 2
      && self->_toFullScreenContinuousExposeModifier
      && [(SBAppLayout *)self->_toAppLayout containsAnyItemFromAppLayout:v6]
      && [(SBAppLayout *)self->_fromAppLayout containsAnyItemFromAppLayout:v6])
    {
      uint64_t v15 = 0;
      double v16 = (double *)&v15;
      uint64_t v17 = 0x2020000000;
      toFullScreenContinuousExposeModifier = self->_toFullScreenContinuousExposeModifier;
      uint64_t v18 = 0;
      v13[0] = MEMORY[0x1E4F143A8];
      v13[1] = 3221225472;
      v13[2] = __58__SBContinuousExposePeekTransitionModifier_scaleForIndex___block_invoke_2;
      v13[3] = &unk_1E6AF6358;
      v13[4] = self;
      v13[5] = &v15;
      v13[6] = a3;
      [(SBChainableModifier *)self performTransactionWithTemporaryChildModifier:toFullScreenContinuousExposeModifier usingBlock:v13];
LABEL_14:
      double v9 = v16[3];
      _Block_object_dispose(&v15, 8);
      goto LABEL_12;
    }
  }
  v12.receiver = self;
  v12.super_class = (Class)SBContinuousExposePeekTransitionModifier;
  [(SBContinuousExposePeekTransitionModifier *)&v12 scaleForIndex:a3];
  double v9 = v8;
LABEL_12:

  return v9;
}

uint64_t __58__SBContinuousExposePeekTransitionModifier_scaleForIndex___block_invoke(void *a1)
{
  uint64_t result = [*(id *)(a1[4] + 136) scaleForIndex:a1[6]];
  *(void *)(*(void *)(a1[5] + 8) + 24) = v3;
  return result;
}

uint64_t __58__SBContinuousExposePeekTransitionModifier_scaleForIndex___block_invoke_2(void *a1)
{
  uint64_t result = [*(id *)(a1[4] + 144) scaleForIndex:a1[6]];
  *(void *)(*(void *)(a1[5] + 8) + 24) = v3;
  return result;
}

- (CGRect)frameForLayoutRole:(int64_t)a3 inAppLayout:(id)a4 withBounds:(CGRect)a5
{
  double height = a5.size.height;
  double width = a5.size.width;
  double y = a5.origin.y;
  double x = a5.origin.x;
  id v11 = a4;
  v53.receiver = self;
  v53.super_class = (Class)SBContinuousExposePeekTransitionModifier;
  -[SBContinuousExposePeekTransitionModifier frameForLayoutRole:inAppLayout:withBounds:](&v53, sel_frameForLayoutRole_inAppLayout_withBounds_, a3, v11, x, y, width, height);
  double v13 = v12;
  double v15 = v14;
  double v17 = v16;
  double v19 = v18;
  if (self->_direction == 1)
  {
    if ([(SBTransitionSwitcherModifier *)self transitionPhase] >= 2
      && [v11 isEqual:self->_fromAppLayout]
      && ![(SBAppLayout *)self->_toAppLayout containsAnyItemFromAppLayout:self->_fromAppLayout])
    {
      objc_super v21 = [v11 itemForLayoutRole:a3];
      -[SBSwitcherModifier frameForContinuousExposePeekingDisplayItem:inAppLayout:bounds:defaultFrameForLayoutRole:](self, "frameForContinuousExposePeekingDisplayItem:inAppLayout:bounds:defaultFrameForLayoutRole:", v21, self->_fromAppLayout, x, y, width, height, v13, v15, v17, v19);
      double v23 = v22;
      double v15 = v24;
      double v17 = v25;
      double v19 = v26;
      UIRectGetCenter();
      double v28 = v27;
      [(SBContinuousExposePeekTransitionModifier *)self containerViewBounds];
      UIRectGetCenter();
      double v30 = v29;
      v31 = [(SBContinuousExposePeekTransitionModifier *)self chamoisLayoutAttributes];
      [v31 screenEdgePadding];
      double v33 = v32;

      double v34 = -2.0;
      if (v28 >= v30) {
        double v34 = 2.0;
      }
      double v13 = v23 + v33 * v34 * 2.0;
    }
    else if (self->_direction == 1 {
           && [(SBTransitionSwitcherModifier *)self transitionPhase] >= 2
    }
           && self->_toFullScreenContinuousExposeModifier
           && [(SBAppLayout *)self->_toAppLayout containsAnyItemFromAppLayout:v11]
           && [(SBAppLayout *)self->_fromAppLayout containsAnyItemFromAppLayout:v11])
    {
      uint64_t v47 = 0;
      v48 = (double *)&v47;
      uint64_t v49 = 0x4010000000;
      v50 = &unk_1D90ED3C6;
      toFullScreenContinuousExposeModifier = self->_toFullScreenContinuousExposeModifier;
      long long v51 = 0u;
      long long v52 = 0u;
      v39[0] = MEMORY[0x1E4F143A8];
      v39[1] = 3221225472;
      v39[2] = __86__SBContinuousExposePeekTransitionModifier_frameForLayoutRole_inAppLayout_withBounds___block_invoke;
      v39[3] = &unk_1E6AF63A8;
      v41 = &v47;
      int64_t v42 = a3;
      v39[4] = self;
      id v40 = v11;
      double v43 = x;
      double v44 = y;
      double v45 = width;
      double v46 = height;
      [(SBChainableModifier *)self performTransactionWithTemporaryChildModifier:toFullScreenContinuousExposeModifier usingBlock:v39];
      double v13 = v48[4];
      double v15 = v48[5];
      double v17 = v48[6];
      double v19 = v48[7];

      _Block_object_dispose(&v47, 8);
    }
  }

  double v35 = v13;
  double v36 = v15;
  double v37 = v17;
  double v38 = v19;
  result.size.double height = v38;
  result.size.double width = v37;
  result.origin.double y = v36;
  result.origin.double x = v35;
  return result;
}

uint64_t __86__SBContinuousExposePeekTransitionModifier_frameForLayoutRole_inAppLayout_withBounds___block_invoke(uint64_t a1)
{
  uint64_t result = objc_msgSend(*(id *)(*(void *)(a1 + 32) + 144), "frameForLayoutRole:inAppLayout:withBounds:", *(void *)(a1 + 56), *(void *)(a1 + 40), *(double *)(a1 + 64), *(double *)(a1 + 72), *(double *)(a1 + 80), *(double *)(a1 + 88));
  uint64_t v3 = *(void **)(*(void *)(a1 + 48) + 8);
  v3[4] = v4;
  v3[5] = v5;
  v3[6] = v6;
  v3[7] = v7;
  return result;
}

- (double)scaleForLayoutRole:(int64_t)a3 inAppLayout:(id)a4
{
  id v6 = a4;
  if (self->_direction == 1
    && [(SBTransitionSwitcherModifier *)self transitionPhase] >= 2
    && self->_toFullScreenContinuousExposeModifier
    && [(SBAppLayout *)self->_toAppLayout containsAnyItemFromAppLayout:v6]
    && [(SBAppLayout *)self->_fromAppLayout containsAnyItemFromAppLayout:v6])
  {
    uint64_t v16 = 0;
    double v17 = (double *)&v16;
    uint64_t v18 = 0x2020000000;
    toFullScreenContinuousExposeModifier = self->_toFullScreenContinuousExposeModifier;
    uint64_t v19 = 0;
    v12[0] = MEMORY[0x1E4F143A8];
    v12[1] = 3221225472;
    v12[2] = __75__SBContinuousExposePeekTransitionModifier_scaleForLayoutRole_inAppLayout___block_invoke;
    v12[3] = &unk_1E6AF63D0;
    double v14 = &v16;
    int64_t v15 = a3;
    v12[4] = self;
    id v13 = v6;
    [(SBChainableModifier *)self performTransactionWithTemporaryChildModifier:toFullScreenContinuousExposeModifier usingBlock:v12];
    double v8 = v17[3];

    _Block_object_dispose(&v16, 8);
  }
  else
  {
    v11.receiver = self;
    v11.super_class = (Class)SBContinuousExposePeekTransitionModifier;
    [(SBContinuousExposePeekTransitionModifier *)&v11 scaleForLayoutRole:a3 inAppLayout:v6];
    double v8 = v9;
  }

  return v8;
}

uint64_t __75__SBContinuousExposePeekTransitionModifier_scaleForLayoutRole_inAppLayout___block_invoke(void *a1)
{
  uint64_t result = [*(id *)(a1[4] + 144) scaleForLayoutRole:a1[7] inAppLayout:a1[5]];
  *(void *)(*(void *)(a1[6] + 8) + 24) = v3;
  return result;
}

- (id)topMostLayoutElements
{
  v9.receiver = self;
  v9.super_class = (Class)SBContinuousExposePeekTransitionModifier;
  uint64_t v3 = [(SBContinuousExposePeekTransitionModifier *)&v9 topMostLayoutElements];
  if (self->_direction == 1
    && self->_toAppLayout
    && ![(SBAppLayout *)self->_fromAppLayout containsAllItemsFromAppLayout:"containsAllItemsFromAppLayout:"])
  {
    toAppLayout = self->_toAppLayout;
    v8[0] = MEMORY[0x1E4F143A8];
    v8[1] = 3221225472;
    v8[2] = __65__SBContinuousExposePeekTransitionModifier_topMostLayoutElements__block_invoke;
    v8[3] = &unk_1E6AF4B38;
    v8[4] = self;
    uint64_t v5 = [(SBAppLayout *)toAppLayout appLayoutWithItemsPassingTest:v8];
    if (v5)
    {
      uint64_t v6 = objc_msgSend(v3, "sb_arrayByInsertingOrMovingObject:toIndex:", v5, 0);

      uint64_t v3 = (void *)v6;
    }
  }
  return v3;
}

uint64_t __65__SBContinuousExposePeekTransitionModifier_topMostLayoutElements__block_invoke(uint64_t a1, uint64_t a2)
{
  return [*(id *)(*(void *)(a1 + 32) + 152) containsItem:a2] ^ 1;
}

- (BOOL)isLayoutRoleMatchMovedToScene:(int64_t)a3 inAppLayout:(id)a4
{
  id v6 = a4;
  if ([(SBAppLayout *)self->_toAppLayout containsAnyItemFromAppLayout:self->_fromAppLayout]&& ([(SBAppLayout *)self->_toAppLayout containsAnyItemFromAppLayout:v6]|| [(SBAppLayout *)self->_fromAppLayout containsAnyItemFromAppLayout:v6]))
  {
    BOOL v7 = 1;
  }
  else
  {
    v9.receiver = self;
    v9.super_class = (Class)SBContinuousExposePeekTransitionModifier;
    BOOL v7 = [(SBContinuousExposePeekTransitionModifier *)&v9 isLayoutRoleMatchMovedToScene:a3 inAppLayout:v6];
  }

  return v7;
}

- (double)blurDelayForLayoutRole:(int64_t)a3 inAppLayout:(id)a4
{
  id v6 = a4;
  if ([(SBAppLayout *)self->_toAppLayout containsAnyItemFromAppLayout:self->_fromAppLayout]&& ([(SBAppLayout *)self->_toAppLayout containsAnyItemFromAppLayout:v6]|| [(SBAppLayout *)self->_fromAppLayout containsAnyItemFromAppLayout:v6]))
  {
    BOOL v7 = [(SBContinuousExposePeekTransitionModifier *)self switcherSettings];
    double v8 = [v7 animationSettings];
    [v8 resizeBlurDelay];
    double v10 = v9;
  }
  else
  {
    v13.receiver = self;
    v13.super_class = (Class)SBContinuousExposePeekTransitionModifier;
    [(SBContinuousExposePeekTransitionModifier *)&v13 blurDelayForLayoutRole:a3 inAppLayout:v6];
    double v10 = v11;
  }

  return v10;
}

- (id)animationAttributesForLayoutElement:(id)a3
{
  uint64_t v4 = objc_alloc_init(SBMutableSwitcherAnimationAttributes);
  [(SBSwitcherAnimationAttributes *)v4 setUpdateMode:3];
  uint64_t v5 = [(SBContinuousExposePeekTransitionModifier *)self switcherSettings];
  id v6 = [v5 chamoisSettings];
  BOOL v7 = [v6 appToAppLayoutSettings];
  [(SBSwitcherAnimationAttributes *)v4 setLayoutSettings:v7];

  return v4;
}

- (SBAppLayout)fromAppLayout
{
  return self->_fromAppLayout;
}

- (SBAppLayout)toAppLayout
{
  return self->_toAppLayout;
}

- (unint64_t)direction
{
  return self->_direction;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_toAppLayout, 0);
  objc_storeStrong((id *)&self->_fromAppLayout, 0);
  objc_storeStrong((id *)&self->_toFullScreenContinuousExposeModifier, 0);
  objc_storeStrong((id *)&self->_fromFullScreenContinuousExposeModifier, 0);
}

@end