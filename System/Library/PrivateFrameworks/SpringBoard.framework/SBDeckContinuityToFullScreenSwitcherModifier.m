@interface SBDeckContinuityToFullScreenSwitcherModifier
- (BOOL)_isInsertingIndex:(unint64_t)a3;
- (CGRect)_initialFrameForContinuityAppLayout;
- (CGRect)frameForIndex:(unint64_t)a3;
- (SBDeckContinuityToFullScreenSwitcherModifier)initWithTransitionID:(id)a3 appLayout:(id)a4 deckModifier:(id)a5 fullscreenModifier:(id)a6;
- (UIRectCornerRadii)cornerRadiiForIndex:(unint64_t)a3;
- (double)opacityForLayoutRole:(int64_t)a3 inAppLayout:(id)a4 atIndex:(unint64_t)a5;
- (double)scaleForIndex:(unint64_t)a3;
- (double)titleAndIconOpacityForIndex:(unint64_t)a3;
- (double)titleOpacityForIndex:(unint64_t)a3;
- (id)animationAttributesForLayoutElement:(id)a3;
- (id)transitionWillBegin;
- (id)visibleAppLayouts;
@end

@implementation SBDeckContinuityToFullScreenSwitcherModifier

- (SBDeckContinuityToFullScreenSwitcherModifier)initWithTransitionID:(id)a3 appLayout:(id)a4 deckModifier:(id)a5 fullscreenModifier:(id)a6
{
  id v12 = a4;
  id v13 = a5;
  id v14 = a6;
  v20.receiver = self;
  v20.super_class = (Class)SBDeckContinuityToFullScreenSwitcherModifier;
  v15 = [(SBTransitionSwitcherModifier *)&v20 initWithTransitionID:a3];
  if (v15)
  {
    if (v12)
    {
      if (v13) {
        goto LABEL_4;
      }
    }
    else
    {
      v17 = [MEMORY[0x1E4F28B00] currentHandler];
      [v17 handleFailureInMethod:a2, v15, @"SBDeckContinuityToFullScreenSwitcherModifier.m", 27, @"Invalid parameter not satisfying: %@", @"appLayout" object file lineNumber description];

      if (v13)
      {
LABEL_4:
        if (v14)
        {
LABEL_5:
          objc_storeStrong((id *)&v15->_appLayout, a4);
          objc_storeStrong((id *)&v15->_fullscreenModifier, a6);
          [(SBChainableModifier *)v15 addChildModifier:v13];
          goto LABEL_6;
        }
LABEL_9:
        v19 = [MEMORY[0x1E4F28B00] currentHandler];
        [v19 handleFailureInMethod:a2, v15, @"SBDeckContinuityToFullScreenSwitcherModifier.m", 29, @"Invalid parameter not satisfying: %@", @"fullscreenModifier" object file lineNumber description];

        goto LABEL_5;
      }
    }
    v18 = [MEMORY[0x1E4F28B00] currentHandler];
    [v18 handleFailureInMethod:a2, v15, @"SBDeckContinuityToFullScreenSwitcherModifier.m", 28, @"Invalid parameter not satisfying: %@", @"deckModifier" object file lineNumber description];

    if (v14) {
      goto LABEL_5;
    }
    goto LABEL_9;
  }
LABEL_6:

  return v15;
}

- (id)transitionWillBegin
{
  v6.receiver = self;
  v6.super_class = (Class)SBDeckContinuityToFullScreenSwitcherModifier;
  v2 = [(SBTransitionSwitcherModifier *)&v6 transitionWillBegin];
  v3 = [[SBUpdateLayoutSwitcherEventResponse alloc] initWithOptions:6 updateMode:2];
  v4 = +[SBChainableModifierEventResponse responseByAppendingResponse:v3 toResponse:v2];

  return v4;
}

- (id)visibleAppLayouts
{
  v6.receiver = self;
  v6.super_class = (Class)SBDeckContinuityToFullScreenSwitcherModifier;
  v3 = [(SBDeckContinuityToFullScreenSwitcherModifier *)&v6 visibleAppLayouts];
  v4 = [v3 setByAddingObject:self->_appLayout];

  return v4;
}

- (id)animationAttributesForLayoutElement:(id)a3
{
  v12.receiver = self;
  v12.super_class = (Class)SBDeckContinuityToFullScreenSwitcherModifier;
  id v4 = a3;
  v5 = [(SBTransitionSwitcherModifier *)&v12 animationAttributesForLayoutElement:v4];
  uint64_t v6 = objc_msgSend(v4, "switcherLayoutElementType", v12.receiver, v12.super_class);

  if (!v6)
  {
    v7 = (void *)[v5 mutableCopy];
    v8 = [(SBDeckContinuityToFullScreenSwitcherModifier *)self switcherSettings];
    v9 = [v8 animationSettings];
    v10 = [v9 continuityBannerSlideUpSettings];
    [v7 setLayoutSettings:v10];

    v5 = v7;
  }
  return v5;
}

- (UIRectCornerRadii)cornerRadiiForIndex:(unint64_t)a3
{
  if (-[SBDeckContinuityToFullScreenSwitcherModifier _isInsertingIndex:](self, "_isInsertingIndex:"))
  {
    SBScreenDisplayCornerRadius();
    SBRectCornerRadiiForRadius();
  }
  else
  {
    v9.receiver = self;
    v9.super_class = (Class)SBDeckContinuityToFullScreenSwitcherModifier;
    [(SBDeckContinuityToFullScreenSwitcherModifier *)&v9 cornerRadiiForIndex:a3];
  }
  result.topRight = v8;
  result.bottomRight = v7;
  result.bottomLeft = v6;
  result.topLeft = v5;
  return result;
}

- (CGRect)frameForIndex:(unint64_t)a3
{
  uint64_t v21 = 0;
  v22 = (double *)&v21;
  uint64_t v23 = 0x4010000000;
  v24 = &unk_1D90ED3C6;
  long long v25 = 0u;
  long long v26 = 0u;
  if (-[SBDeckContinuityToFullScreenSwitcherModifier _isInsertingIndex:](self, "_isInsertingIndex:"))
  {
    if ([(SBTransitionSwitcherModifier *)self transitionPhase] != 1)
    {
      fullscreenModifier = self->_fullscreenModifier;
      v20[0] = MEMORY[0x1E4F143A8];
      v20[1] = 3221225472;
      v20[2] = __62__SBDeckContinuityToFullScreenSwitcherModifier_frameForIndex___block_invoke;
      v20[3] = &unk_1E6AF6358;
      v20[4] = self;
      v20[5] = &v21;
      v20[6] = a3;
      [(SBChainableModifier *)self performTransactionWithTemporaryChildModifier:fullscreenModifier usingBlock:v20];
      double v9 = v22[4];
      double v10 = v22[5];
      double v11 = v22[6];
      double v12 = v22[7];
      goto LABEL_7;
    }
    [(SBDeckContinuityToFullScreenSwitcherModifier *)self _initialFrameForContinuityAppLayout];
  }
  else
  {
    v19.receiver = self;
    v19.super_class = (Class)SBDeckContinuityToFullScreenSwitcherModifier;
    [(SBDeckContinuityToFullScreenSwitcherModifier *)&v19 frameForIndex:a3];
  }
  double v9 = v5;
  double v10 = v6;
  double v11 = v7;
  double v12 = v8;
  id v13 = v22;
  v22[4] = v5;
  v13[5] = v6;
  v13[6] = v7;
  v13[7] = v8;
LABEL_7:
  _Block_object_dispose(&v21, 8);
  double v15 = v9;
  double v16 = v10;
  double v17 = v11;
  double v18 = v12;
  result.size.height = v18;
  result.size.width = v17;
  result.origin.y = v16;
  result.origin.x = v15;
  return result;
}

uint64_t __62__SBDeckContinuityToFullScreenSwitcherModifier_frameForIndex___block_invoke(void *a1)
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
  uint64_t v11 = 0;
  double v12 = (double *)&v11;
  uint64_t v13 = 0x2020000000;
  uint64_t v14 = 0;
  if (-[SBDeckContinuityToFullScreenSwitcherModifier _isInsertingIndex:](self, "_isInsertingIndex:"))
  {
    if ([(SBTransitionSwitcherModifier *)self transitionPhase] == 1)
    {
      v12[3] = 1.0;
      double v5 = 1.0;
    }
    else
    {
      fullscreenModifier = self->_fullscreenModifier;
      v10[0] = MEMORY[0x1E4F143A8];
      v10[1] = 3221225472;
      v10[2] = __62__SBDeckContinuityToFullScreenSwitcherModifier_scaleForIndex___block_invoke;
      v10[3] = &unk_1E6AF6358;
      v10[4] = self;
      v10[5] = &v11;
      v10[6] = a3;
      [(SBChainableModifier *)self performTransactionWithTemporaryChildModifier:fullscreenModifier usingBlock:v10];
      double v5 = v12[3];
    }
  }
  else
  {
    v9.receiver = self;
    v9.super_class = (Class)SBDeckContinuityToFullScreenSwitcherModifier;
    [(SBDeckContinuityToFullScreenSwitcherModifier *)&v9 scaleForIndex:a3];
    double v5 = v6;
    v12[3] = v6;
  }
  _Block_object_dispose(&v11, 8);
  return v5;
}

uint64_t __62__SBDeckContinuityToFullScreenSwitcherModifier_scaleForIndex___block_invoke(void *a1)
{
  uint64_t result = [*(id *)(a1[4] + 144) scaleForIndex:a1[6]];
  *(void *)(*(void *)(a1[5] + 8) + 24) = v3;
  return result;
}

- (double)titleOpacityForIndex:(unint64_t)a3
{
  uint64_t v11 = 0;
  double v12 = (double *)&v11;
  uint64_t v13 = 0x2020000000;
  uint64_t v14 = 0;
  if (-[SBDeckContinuityToFullScreenSwitcherModifier _isInsertingIndex:](self, "_isInsertingIndex:"))
  {
    if ([(SBTransitionSwitcherModifier *)self transitionPhase] == 1)
    {
      v12[3] = 0.0;
      double v5 = 0.0;
    }
    else
    {
      fullscreenModifier = self->_fullscreenModifier;
      v10[0] = MEMORY[0x1E4F143A8];
      v10[1] = 3221225472;
      v10[2] = __69__SBDeckContinuityToFullScreenSwitcherModifier_titleOpacityForIndex___block_invoke;
      v10[3] = &unk_1E6AF6358;
      v10[4] = self;
      v10[5] = &v11;
      v10[6] = a3;
      [(SBChainableModifier *)self performTransactionWithTemporaryChildModifier:fullscreenModifier usingBlock:v10];
      double v5 = v12[3];
    }
  }
  else
  {
    v9.receiver = self;
    v9.super_class = (Class)SBDeckContinuityToFullScreenSwitcherModifier;
    [(SBDeckContinuityToFullScreenSwitcherModifier *)&v9 titleOpacityForIndex:a3];
    double v5 = v6;
    v12[3] = v6;
  }
  _Block_object_dispose(&v11, 8);
  return v5;
}

uint64_t __69__SBDeckContinuityToFullScreenSwitcherModifier_titleOpacityForIndex___block_invoke(void *a1)
{
  uint64_t result = [*(id *)(a1[4] + 144) titleOpacityForIndex:a1[6]];
  *(void *)(*(void *)(a1[5] + 8) + 24) = v3;
  return result;
}

- (double)opacityForLayoutRole:(int64_t)a3 inAppLayout:(id)a4 atIndex:(unint64_t)a5
{
  id v8 = a4;
  uint64_t v19 = 0;
  objc_super v20 = (double *)&v19;
  uint64_t v21 = 0x2020000000;
  uint64_t v22 = 0;
  if ([(SBDeckContinuityToFullScreenSwitcherModifier *)self _isInsertingIndex:a5])
  {
    if ([(SBTransitionSwitcherModifier *)self transitionPhase] == 1)
    {
      v20[3] = 1.0;
      double v9 = 1.0;
    }
    else
    {
      fullscreenModifier = self->_fullscreenModifier;
      v14[0] = MEMORY[0x1E4F143A8];
      v14[1] = 3221225472;
      v14[2] = __89__SBDeckContinuityToFullScreenSwitcherModifier_opacityForLayoutRole_inAppLayout_atIndex___block_invoke;
      v14[3] = &unk_1E6AF63F8;
      double v16 = &v19;
      int64_t v17 = a3;
      v14[4] = self;
      id v15 = v8;
      unint64_t v18 = a5;
      [(SBChainableModifier *)self performTransactionWithTemporaryChildModifier:fullscreenModifier usingBlock:v14];

      double v9 = v20[3];
    }
  }
  else
  {
    v13.receiver = self;
    v13.super_class = (Class)SBDeckContinuityToFullScreenSwitcherModifier;
    [(SBDeckContinuityToFullScreenSwitcherModifier *)&v13 opacityForLayoutRole:a3 inAppLayout:v8 atIndex:a5];
    double v9 = v10;
    v20[3] = v10;
  }
  _Block_object_dispose(&v19, 8);

  return v9;
}

uint64_t __89__SBDeckContinuityToFullScreenSwitcherModifier_opacityForLayoutRole_inAppLayout_atIndex___block_invoke(void *a1)
{
  uint64_t result = [*(id *)(a1[4] + 144) opacityForLayoutRole:a1[7] inAppLayout:a1[5] atIndex:a1[8]];
  *(void *)(*(void *)(a1[6] + 8) + 24) = v3;
  return result;
}

- (double)titleAndIconOpacityForIndex:(unint64_t)a3
{
  uint64_t v11 = 0;
  double v12 = (double *)&v11;
  uint64_t v13 = 0x2020000000;
  uint64_t v14 = 0;
  if (-[SBDeckContinuityToFullScreenSwitcherModifier _isInsertingIndex:](self, "_isInsertingIndex:"))
  {
    if ([(SBTransitionSwitcherModifier *)self transitionPhase] == 1)
    {
      v12[3] = 1.0;
      double v5 = 1.0;
    }
    else
    {
      fullscreenModifier = self->_fullscreenModifier;
      v10[0] = MEMORY[0x1E4F143A8];
      v10[1] = 3221225472;
      v10[2] = __76__SBDeckContinuityToFullScreenSwitcherModifier_titleAndIconOpacityForIndex___block_invoke;
      v10[3] = &unk_1E6AF6358;
      v10[4] = self;
      v10[5] = &v11;
      v10[6] = a3;
      [(SBChainableModifier *)self performTransactionWithTemporaryChildModifier:fullscreenModifier usingBlock:v10];
      double v5 = v12[3];
    }
  }
  else
  {
    v9.receiver = self;
    v9.super_class = (Class)SBDeckContinuityToFullScreenSwitcherModifier;
    [(SBDeckContinuityToFullScreenSwitcherModifier *)&v9 titleAndIconOpacityForIndex:a3];
    double v5 = v6;
    v12[3] = v6;
  }
  _Block_object_dispose(&v11, 8);
  return v5;
}

uint64_t __76__SBDeckContinuityToFullScreenSwitcherModifier_titleAndIconOpacityForIndex___block_invoke(void *a1)
{
  uint64_t result = [*(id *)(a1[4] + 144) titleAndIconOpacityForIndex:a1[6]];
  *(void *)(*(void *)(a1[5] + 8) + 24) = v3;
  return result;
}

- (BOOL)_isInsertingIndex:(unint64_t)a3
{
  uint64_t v4 = self;
  double v5 = [(SBDeckContinuityToFullScreenSwitcherModifier *)self appLayouts];
  double v6 = [v5 objectAtIndex:a3];

  LOBYTE(v4) = [(SBAppLayout *)v4->_appLayout isEqual:v6];
  return (char)v4;
}

- (CGRect)_initialFrameForContinuityAppLayout
{
  v6.receiver = self;
  v6.super_class = (Class)SBDeckContinuityToFullScreenSwitcherModifier;
  [(SBDeckContinuityToFullScreenSwitcherModifier *)&v6 containerViewBounds];
  double v5 = v4;
  result.size.height = v4;
  result.size.width = v3;
  result.origin.y = v5;
  result.origin.x = v2;
  return result;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_fullscreenModifier, 0);
  objc_storeStrong((id *)&self->_appLayout, 0);
}

@end