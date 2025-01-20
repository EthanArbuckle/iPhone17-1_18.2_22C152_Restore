@interface SBSplitViewToSlideOverSwitcherModifier
- (BOOL)isLayoutRoleBlurred:(int64_t)a3 inAppLayout:(id)a4;
- (BOOL)isLayoutRoleMatchMovedToScene:(int64_t)a3 inAppLayout:(id)a4;
- (CGRect)frameForIndex:(unint64_t)a3;
- (CGRect)frameForLayoutRole:(int64_t)a3 inAppLayout:(id)a4 withBounds:(CGRect)a5;
- (SBSplitViewToSlideOverSwitcherModifier)initWithTransitionID:(id)a3 transitioningLayoutRole:(int64_t)a4 splitViewAppLayout:(id)a5 slideOverAppLayout:(id)a6 direction:(unint64_t)a7;
- (SBSwitcherAsyncRenderingAttributes)asyncRenderingAttributesForAppLayout:(id)a3;
- (double)blurDelayForLayoutRole:(int64_t)a3 inAppLayout:(id)a4;
- (id)animationAttributesForLayoutElement:(id)a3;
- (id)handleSceneReadyEvent:(id)a3;
- (id)topMostLayoutRolesForAppLayout:(id)a3;
- (id)transitionWillBegin;
- (id)visibleAppLayouts;
@end

@implementation SBSplitViewToSlideOverSwitcherModifier

- (SBSplitViewToSlideOverSwitcherModifier)initWithTransitionID:(id)a3 transitioningLayoutRole:(int64_t)a4 splitViewAppLayout:(id)a5 slideOverAppLayout:(id)a6 direction:(unint64_t)a7
{
  id v14 = a5;
  id v15 = a6;
  v33.receiver = self;
  v33.super_class = (Class)SBSplitViewToSlideOverSwitcherModifier;
  v16 = [(SBTransitionSwitcherModifier *)&v33 initWithTransitionID:a3];
  if (!v16) {
    goto LABEL_11;
  }
  if (!v14)
  {
    v25 = [MEMORY[0x1E4F28B00] currentHandler];
    [v25 handleFailureInMethod:a2, v16, @"SBSplitViewToSlideOverSwitcherModifier.m", 41, @"Invalid parameter not satisfying: %@", @"splitViewAppLayout" object file lineNumber description];

    if (v15) {
      goto LABEL_4;
    }
LABEL_13:
    v26 = [MEMORY[0x1E4F28B00] currentHandler];
    [v26 handleFailureInMethod:a2, v16, @"SBSplitViewToSlideOverSwitcherModifier.m", 42, @"Invalid parameter not satisfying: %@", @"slideOverAppLayout" object file lineNumber description];

    goto LABEL_4;
  }
  if (!v15) {
    goto LABEL_13;
  }
LABEL_4:
  v16->_transitioningLayoutRole = a4;
  objc_storeStrong((id *)&v16->_splitViewAppLayout, a5);
  objc_storeStrong((id *)&v16->_slideOverAppLayout, a6);
  v16->_direction = a7;
  splitViewAppLayout = v16->_splitViewAppLayout;
  v31[0] = MEMORY[0x1E4F143A8];
  v31[1] = 3221225472;
  v31[2] = __135__SBSplitViewToSlideOverSwitcherModifier_initWithTransitionID_transitioningLayoutRole_splitViewAppLayout_slideOverAppLayout_direction___block_invoke;
  v31[3] = &unk_1E6AF4B38;
  id v18 = v15;
  id v32 = v18;
  uint64_t v19 = [(SBAppLayout *)splitViewAppLayout appLayoutWithItemsPassingTest:v31];
  fullScreenAppLayout = v16->_fullScreenAppLayout;
  v16->_fullScreenAppLayout = (SBAppLayout *)v19;

  if (!v16->_fullScreenAppLayout)
  {
    v27 = [MEMORY[0x1E4F28B00] currentHandler];
    [v27 handleFailureInMethod:a2 object:v16 file:@"SBSplitViewToSlideOverSwitcherModifier.m" lineNumber:52 description:@"We expect a _fullScreenAppLayout here"];
  }
  if (!v16->_direction)
  {
    v21 = v16->_splitViewAppLayout;
    v29[0] = MEMORY[0x1E4F143A8];
    v29[1] = 3221225472;
    v29[2] = __135__SBSplitViewToSlideOverSwitcherModifier_initWithTransitionID_transitioningLayoutRole_splitViewAppLayout_slideOverAppLayout_direction___block_invoke_2;
    v29[3] = &unk_1E6AF4B38;
    id v30 = v18;
    uint64_t v22 = [(SBAppLayout *)v21 appLayoutWithItemsPassingTest:v29];
    fromMainAppLayoutGoingIntoSlideOver = v16->_fromMainAppLayoutGoingIntoSlideOver;
    v16->_fromMainAppLayoutGoingIntoSlideOver = (SBAppLayout *)v22;

    if (!v16->_fromMainAppLayoutGoingIntoSlideOver)
    {
      v28 = [MEMORY[0x1E4F28B00] currentHandler];
      [v28 handleFailureInMethod:a2 object:v16 file:@"SBSplitViewToSlideOverSwitcherModifier.m" lineNumber:58 description:@"We expect a _fromMainAppLayoutGoingIntoSlideOver here"];
    }
  }

LABEL_11:
  return v16;
}

uint64_t __135__SBSplitViewToSlideOverSwitcherModifier_initWithTransitionID_transitioningLayoutRole_splitViewAppLayout_slideOverAppLayout_direction___block_invoke(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 32) containsItem:a2] ^ 1;
}

uint64_t __135__SBSplitViewToSlideOverSwitcherModifier_initWithTransitionID_transitioningLayoutRole_splitViewAppLayout_slideOverAppLayout_direction___block_invoke_2(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 32) containsItem:a2];
}

- (id)handleSceneReadyEvent:(id)a3
{
  v7.receiver = self;
  v7.super_class = (Class)SBSplitViewToSlideOverSwitcherModifier;
  v3 = [(SBSwitcherModifier *)&v7 handleSceneReadyEvent:a3];
  v4 = [[SBUpdateLayoutSwitcherEventResponse alloc] initWithOptions:12 updateMode:3];
  v5 = SBAppendSwitcherModifierResponse(v4, v3);

  return v5;
}

- (id)transitionWillBegin
{
  v6.receiver = self;
  v6.super_class = (Class)SBSplitViewToSlideOverSwitcherModifier;
  v2 = [(SBTransitionSwitcherModifier *)&v6 transitionWillBegin];
  v3 = [[SBUpdateLayoutSwitcherEventResponse alloc] initWithOptions:2 updateMode:2];
  v4 = SBAppendSwitcherModifierResponse(v3, v2);

  return v4;
}

- (id)visibleAppLayouts
{
  v12.receiver = self;
  v12.super_class = (Class)SBSplitViewToSlideOverSwitcherModifier;
  v3 = [(SBSplitViewToSlideOverSwitcherModifier *)&v12 visibleAppLayouts];
  v4 = (void *)[v3 mutableCopy];

  if (self->_direction)
  {
    [v4 addObject:self->_splitViewAppLayout];
    v5 = &v9;
    uint64_t v9 = MEMORY[0x1E4F143A8];
    uint64_t v10 = 3221225472;
    objc_super v6 = __59__SBSplitViewToSlideOverSwitcherModifier_visibleAppLayouts__block_invoke_2;
  }
  else
  {
    [v4 addObject:self->_slideOverAppLayout];
    v5 = v11;
    v11[0] = MEMORY[0x1E4F143A8];
    v11[1] = 3221225472;
    objc_super v6 = __59__SBSplitViewToSlideOverSwitcherModifier_visibleAppLayouts__block_invoke;
  }
  v5[2] = (uint64_t)v6;
  v5[3] = (uint64_t)&unk_1E6AF4B60;
  v5[4] = (uint64_t)self;
  objc_super v7 = objc_msgSend(v4, "bs_firstObjectPassingTest:", v9, v10);
  if (v7) {
    [v4 removeObject:v7];
  }

  return v4;
}

uint64_t __59__SBSplitViewToSlideOverSwitcherModifier_visibleAppLayouts__block_invoke(uint64_t a1, void *a2)
{
  return [a2 isOrContainsAppLayout:*(void *)(*(void *)(a1 + 32) + 176)];
}

uint64_t __59__SBSplitViewToSlideOverSwitcherModifier_visibleAppLayouts__block_invoke_2(uint64_t a1, void *a2)
{
  return [a2 isOrContainsAppLayout:*(void *)(*(void *)(a1 + 32) + 152)];
}

- (CGRect)frameForIndex:(unint64_t)a3
{
  v25.receiver = self;
  v25.super_class = (Class)SBSplitViewToSlideOverSwitcherModifier;
  -[SBSplitViewToSlideOverSwitcherModifier frameForIndex:](&v25, sel_frameForIndex_);
  double v6 = v5;
  double v8 = v7;
  double v10 = v9;
  double v12 = v11;
  if ([(SBTransitionSwitcherModifier *)self transitionPhase] == 1)
  {
    v13 = [(SBSplitViewToSlideOverSwitcherModifier *)self appLayouts];
    id v14 = [v13 objectAtIndex:a3];

    if (!self->_direction)
    {
      if ([v14 isEqual:self->_slideOverAppLayout])
      {
        int64_t transitioningLayoutRole = self->_transitioningLayoutRole;
LABEL_9:
        splitViewAppLayout = self->_splitViewAppLayout;
        [(SBSplitViewToSlideOverSwitcherModifier *)self containerViewBounds];
        -[SBSplitViewToSlideOverSwitcherModifier frameForLayoutRole:inAppLayout:withBounds:](self, "frameForLayoutRole:inAppLayout:withBounds:", transitioningLayoutRole, splitViewAppLayout);
        double v6 = v17;
        double v8 = v18;
        double v10 = v19;
        double v12 = v20;
        goto LABEL_10;
      }
      if ([v14 isEqual:self->_fullScreenAppLayout])
      {
        if (self->_transitioningLayoutRole == 1) {
          int64_t transitioningLayoutRole = 2;
        }
        else {
          int64_t transitioningLayoutRole = 1;
        }
        goto LABEL_9;
      }
    }
LABEL_10:
  }
  double v21 = v6;
  double v22 = v8;
  double v23 = v10;
  double v24 = v12;
  result.size.height = v24;
  result.size.width = v23;
  result.origin.y = v22;
  result.origin.x = v21;
  return result;
}

- (CGRect)frameForLayoutRole:(int64_t)a3 inAppLayout:(id)a4 withBounds:(CGRect)a5
{
  double height = a5.size.height;
  double width = a5.size.width;
  double y = a5.origin.y;
  double x = a5.origin.x;
  id v11 = a4;
  v44.receiver = self;
  v44.super_class = (Class)SBSplitViewToSlideOverSwitcherModifier;
  -[SBSplitViewToSlideOverSwitcherModifier frameForLayoutRole:inAppLayout:withBounds:](&v44, sel_frameForLayoutRole_inAppLayout_withBounds_, a3, v11, x, y, width, height);
  double v13 = v12;
  double v15 = v14;
  double v17 = v16;
  double v19 = v18;
  if ([(SBTransitionSwitcherModifier *)self transitionPhase] == 1)
  {
    if (!self->_direction)
    {
      if ([v11 isEqual:self->_slideOverAppLayout])
      {
        int64_t transitioningLayoutRole = self->_transitioningLayoutRole;
        splitViewAppLayout = self->_splitViewAppLayout;
        [(SBSplitViewToSlideOverSwitcherModifier *)self containerViewBounds];
        v43.receiver = self;
        v43.super_class = (Class)SBSplitViewToSlideOverSwitcherModifier;
        -[SBSplitViewToSlideOverSwitcherModifier frameForLayoutRole:inAppLayout:withBounds:](&v43, sel_frameForLayoutRole_inAppLayout_withBounds_, transitioningLayoutRole, splitViewAppLayout, v34.receiver, v34.super_class);
      }
      else
      {
        if (![v11 isEqual:self->_fullScreenAppLayout]) {
          goto LABEL_15;
        }
        if (self->_transitioningLayoutRole == 1) {
          uint64_t v27 = 2;
        }
        else {
          uint64_t v27 = 1;
        }
        v28 = self->_splitViewAppLayout;
        [(SBSplitViewToSlideOverSwitcherModifier *)self containerViewBounds];
        v42.receiver = self;
        v42.super_class = (Class)SBSplitViewToSlideOverSwitcherModifier;
        -[SBSplitViewToSlideOverSwitcherModifier frameForLayoutRole:inAppLayout:withBounds:](&v42, sel_frameForLayoutRole_inAppLayout_withBounds_, v27, v28, v34.receiver, v34.super_class);
      }
      goto LABEL_14;
    }
    if ([v11 isEqual:self->_splitViewAppLayout])
    {
      if (self->_transitioningLayoutRole == a3)
      {
        uint64_t v36 = 0;
        v37 = (double *)&v36;
        uint64_t v38 = 0x4010000000;
        v39 = &unk_1D90ED3C6;
        long long v40 = 0u;
        long long v41 = 0u;
        slideOverAppLayout = self->_slideOverAppLayout;
        v35[0] = MEMORY[0x1E4F143A8];
        v35[1] = 3221225472;
        v35[2] = __84__SBSplitViewToSlideOverSwitcherModifier_frameForLayoutRole_inAppLayout_withBounds___block_invoke;
        v35[3] = &unk_1E6AF4B88;
        v35[4] = self;
        v35[5] = &v36;
        [(SBSwitcherModifier *)self performWithTemporarilyInsertedAppLayout:slideOverAppLayout atIndex:0 block:v35];
        double v13 = v37[4];
        double v15 = v37[5];
        double v17 = v37[6];
        double v19 = v37[7];
        _Block_object_dispose(&v36, 8);
        goto LABEL_15;
      }
      fullScreenAppLayout = self->_fullScreenAppLayout;
      [(SBSplitViewToSlideOverSwitcherModifier *)self containerViewBounds];
      -[SBSplitViewToSlideOverSwitcherModifier frameForLayoutRole:inAppLayout:withBounds:](&v34, sel_frameForLayoutRole_inAppLayout_withBounds_, 1, fullScreenAppLayout, self, SBSplitViewToSlideOverSwitcherModifier);
LABEL_14:
      double v13 = v23;
      double v15 = v24;
      double v17 = v25;
      double v19 = v26;
    }
  }
LABEL_15:

  double v30 = v13;
  double v31 = v15;
  double v32 = v17;
  double v33 = v19;
  result.size.double height = v33;
  result.size.double width = v32;
  result.origin.double y = v31;
  result.origin.double x = v30;
  return result;
}

id __84__SBSplitViewToSlideOverSwitcherModifier_frameForLayoutRole_inAppLayout_withBounds___block_invoke(uint64_t a1)
{
  v8.receiver = *(id *)(a1 + 32);
  v8.super_class = (Class)SBSplitViewToSlideOverSwitcherModifier;
  id result = objc_msgSendSuper2(&v8, sel_frameForIndex_, 0);
  v3 = *(void **)(*(void *)(a1 + 40) + 8);
  v3[4] = v4;
  v3[5] = v5;
  v3[6] = v6;
  v3[7] = v7;
  return result;
}

- (BOOL)isLayoutRoleBlurred:(int64_t)a3 inAppLayout:(id)a4
{
  id v6 = a4;
  if (([v6 isEqual:self->_slideOverAppLayout] & 1) != 0
    || ([v6 isEqual:self->_fullScreenAppLayout] & 1) != 0
    || [v6 isEqual:self->_splitViewAppLayout])
  {
    int v7 = [(SBSplitViewToSlideOverSwitcherModifier *)self isLayoutRoleContentReady:a3 inAppLayout:v6] ^ 1;
  }
  else
  {
    LOBYTE(v7) = 0;
  }

  return v7;
}

- (BOOL)isLayoutRoleMatchMovedToScene:(int64_t)a3 inAppLayout:(id)a4
{
  id v5 = a4;
  if (([v5 isEqual:self->_slideOverAppLayout] & 1) != 0
    || ([v5 isEqual:self->_fullScreenAppLayout] & 1) != 0)
  {
    char v6 = 1;
  }
  else
  {
    char v6 = [v5 isEqual:self->_splitViewAppLayout];
  }

  return v6;
}

- (double)blurDelayForLayoutRole:(int64_t)a3 inAppLayout:(id)a4
{
  uint64_t v4 = [(SBSplitViewToSlideOverSwitcherModifier *)self switcherSettings];
  id v5 = [v4 animationSettings];
  [v5 resizeBlurDelay];
  double v7 = v6;

  return v7;
}

- (id)topMostLayoutRolesForAppLayout:(id)a3
{
  id v4 = a3;
  v17.receiver = self;
  v17.super_class = (Class)SBSplitViewToSlideOverSwitcherModifier;
  id v5 = [(SBSplitViewToSlideOverSwitcherModifier *)&v17 topMostLayoutRolesForAppLayout:v4];
  if (self->_splitViewAppLayout && objc_msgSend(v4, "isEqual:"))
  {
    double v6 = (void *)[v5 mutableCopy];
    double v7 = [NSNumber numberWithInteger:1];
    int v8 = [v6 containsObject:v7];

    if (v8)
    {
      double v9 = [NSNumber numberWithInteger:1];
      [v6 removeObject:v9];
    }
    double v10 = [NSNumber numberWithInteger:2];
    int v11 = [v6 containsObject:v10];

    if (v11)
    {
      double v12 = [NSNumber numberWithInteger:2];
      [v6 removeObject:v12];
    }
    if (self->_transitioningLayoutRole == 1) {
      uint64_t v13 = 2;
    }
    else {
      uint64_t v13 = 1;
    }
    double v14 = objc_msgSend(NSNumber, "numberWithInteger:");
    [v6 addObject:v14];

    double v15 = [NSNumber numberWithInteger:v13];
    [v6 addObject:v15];
  }
  else
  {
    double v6 = v5;
  }

  return v6;
}

- (SBSwitcherAsyncRenderingAttributes)asyncRenderingAttributesForAppLayout:(id)a3
{
  return (SBSwitcherAsyncRenderingAttributes)SBSwitcherAsyncRenderingAttributesMake(0, 0);
}

- (id)animationAttributesForLayoutElement:(id)a3
{
  v10.receiver = self;
  v10.super_class = (Class)SBSplitViewToSlideOverSwitcherModifier;
  id v4 = [(SBTransitionSwitcherModifier *)&v10 animationAttributesForLayoutElement:a3];
  id v5 = (void *)[v4 mutableCopy];

  double v6 = [(SBSplitViewToSlideOverSwitcherModifier *)self switcherSettings];
  double v7 = [v6 animationSettings];

  int v8 = [v7 splitViewToSlideOverSettings];
  [v5 setLayoutSettings:v8];

  return v5;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_fromMainAppLayoutGoingIntoSlideOver, 0);
  objc_storeStrong((id *)&self->_fullScreenAppLayout, 0);
  objc_storeStrong((id *)&self->_slideOverAppLayout, 0);
  objc_storeStrong((id *)&self->_splitViewAppLayout, 0);
}

@end