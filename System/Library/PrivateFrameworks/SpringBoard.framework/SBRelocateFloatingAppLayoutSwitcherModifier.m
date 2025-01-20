@interface SBRelocateFloatingAppLayoutSwitcherModifier
- (BOOL)_comingFromSwitcherWithLeadingFloatingApp;
- (BOOL)_goingToSwitcherWithLeadingFloatingApp;
- (CGRect)frameForIndex:(unint64_t)a3;
- (SBRelocateFloatingAppLayoutSwitcherModifier)initWithTransitionID:(id)a3 floatingAppLayout:(id)a4 floatingConfiguration:(int64_t)a5 direction:(int64_t)a6 mixedGridModifier:(id)a7;
- (double)opacityForLayoutRole:(int64_t)a3 inAppLayout:(id)a4 atIndex:(unint64_t)a5;
- (double)scaleForIndex:(unint64_t)a3;
- (id)handleTimerEvent:(id)a3;
- (id)transitionDidEnd;
- (id)transitionWillBegin;
- (id)transitionWillUpdate;
@end

@implementation SBRelocateFloatingAppLayoutSwitcherModifier

- (SBRelocateFloatingAppLayoutSwitcherModifier)initWithTransitionID:(id)a3 floatingAppLayout:(id)a4 floatingConfiguration:(int64_t)a5 direction:(int64_t)a6 mixedGridModifier:(id)a7
{
  id v13 = a4;
  id v14 = a7;
  v18.receiver = self;
  v18.super_class = (Class)SBRelocateFloatingAppLayoutSwitcherModifier;
  v15 = [(SBTransitionSwitcherModifier *)&v18 initWithTransitionID:a3];
  v16 = v15;
  if (v15)
  {
    objc_storeStrong((id *)&v15->_floatingAppLayout, a4);
    v16->_floatingConfiguration = a5;
    v16->_direction = a6;
    objc_storeStrong((id *)&v16->_mixedGridModifier, a7);
    v16->_moveFloatingAppToLeadingSide = 0;
  }

  return v16;
}

- (id)transitionWillBegin
{
  v7.receiver = self;
  v7.super_class = (Class)SBRelocateFloatingAppLayoutSwitcherModifier;
  v3 = [(SBTransitionSwitcherModifier *)&v7 transitionWillBegin];
  if ([(SBRelocateFloatingAppLayoutSwitcherModifier *)self _goingToSwitcherWithLeadingFloatingApp])
  {
    v4 = [[SBUpdateLayoutSwitcherEventResponse alloc] initWithOptions:4 updateMode:2];
    uint64_t v5 = SBAppendSwitcherModifierResponse(v4, v3);

    v3 = (void *)v5;
  }
  return v3;
}

- (id)transitionWillUpdate
{
  v10.receiver = self;
  v10.super_class = (Class)SBRelocateFloatingAppLayoutSwitcherModifier;
  v3 = [(SBTransitionSwitcherModifier *)&v10 transitionWillUpdate];
  if ([(SBRelocateFloatingAppLayoutSwitcherModifier *)self _comingFromSwitcherWithLeadingFloatingApp])
  {
    v4 = [(SBRelocateFloatingAppLayoutSwitcherModifier *)self medusaSettings];
    [v4 leadingSlideOverRelocationDelay];
    double v6 = v5;

    objc_super v7 = [[SBTimerEventSwitcherEventResponse alloc] initWithDelay:0 validator:@"SBRelocateFloatingAppLayoutSwitcherModifierTimerReason" reason:v6];
    uint64_t v8 = SBAppendSwitcherModifierResponse(v7, v3);

    v3 = (void *)v8;
  }
  return v3;
}

- (id)transitionDidEnd
{
  v7.receiver = self;
  v7.super_class = (Class)SBRelocateFloatingAppLayoutSwitcherModifier;
  v3 = [(SBTransitionSwitcherModifier *)&v7 transitionDidEnd];
  if ([(SBRelocateFloatingAppLayoutSwitcherModifier *)self _comingFromSwitcherWithLeadingFloatingApp])
  {
    v4 = [[SBUpdateLayoutSwitcherEventResponse alloc] initWithOptions:12 updateMode:3];
    uint64_t v5 = SBAppendSwitcherModifierResponse(v4, v3);

    v3 = (void *)v5;
  }
  return v3;
}

- (id)handleTimerEvent:(id)a3
{
  v10.receiver = self;
  v10.super_class = (Class)SBRelocateFloatingAppLayoutSwitcherModifier;
  id v4 = a3;
  uint64_t v5 = [(SBTransitionSwitcherModifier *)&v10 handleTimerEvent:v4];
  objc_msgSend(v4, "reason", v10.receiver, v10.super_class);
  double v6 = (SBUpdateLayoutSwitcherEventResponse *)objc_claimAutoreleasedReturnValue();

  if ([(SBUpdateLayoutSwitcherEventResponse *)v6 isEqualToString:@"SBRelocateFloatingAppLayoutSwitcherModifierTimerReason"])
  {
    BOOL v7 = [(SBRelocateFloatingAppLayoutSwitcherModifier *)self _comingFromSwitcherWithLeadingFloatingApp];

    if (!v7) {
      goto LABEL_5;
    }
    self->_moveFloatingAppToLeadingSide = 1;
    double v6 = [[SBUpdateLayoutSwitcherEventResponse alloc] initWithOptions:4 updateMode:2];
    uint64_t v8 = SBAppendSwitcherModifierResponse(v6, v5);

    uint64_t v5 = (void *)v8;
  }

LABEL_5:
  return v5;
}

- (CGRect)frameForIndex:(unint64_t)a3
{
  uint64_t v5 = [(SBRelocateFloatingAppLayoutSwitcherModifier *)self appLayouts];
  double v6 = [v5 objectAtIndex:a3];

  if (v6 != self->_floatingAppLayout) {
    goto LABEL_2;
  }
  if ([(SBRelocateFloatingAppLayoutSwitcherModifier *)self _goingToSwitcherWithLeadingFloatingApp]&& [(SBTransitionSwitcherModifier *)self isPreparingLayout])
  {
    v30.receiver = self;
    v30.super_class = (Class)SBRelocateFloatingAppLayoutSwitcherModifier;
    [(SBRelocateFloatingAppLayoutSwitcherModifier *)&v30 floatingApplicationFrameInInterfaceOrientation:[(SBRelocateFloatingAppLayoutSwitcherModifier *)self switcherInterfaceOrientation] floatingConfiguration:4];
    goto LABEL_3;
  }
  if ([(SBRelocateFloatingAppLayoutSwitcherModifier *)self _comingFromSwitcherWithLeadingFloatingApp])
  {
    uint64_t v19 = [(SBRelocateFloatingAppLayoutSwitcherModifier *)self switcherInterfaceOrientation];
    if (!self->_moveFloatingAppToLeadingSide)
    {
      uint64_t v24 = 0;
      v25 = (double *)&v24;
      uint64_t v26 = 0x4010000000;
      v27 = &unk_1D90ED3C6;
      mixedGridModifier = self->_mixedGridModifier;
      long long v28 = 0u;
      long long v29 = 0u;
      v23[0] = MEMORY[0x1E4F143A8];
      v23[1] = 3221225472;
      v23[2] = __61__SBRelocateFloatingAppLayoutSwitcherModifier_frameForIndex___block_invoke;
      v23[3] = &unk_1E6AF6358;
      v23[4] = self;
      v23[5] = &v24;
      v23[6] = a3;
      [(SBChainableModifier *)self performTransactionWithTemporaryChildModifier:mixedGridModifier usingBlock:v23];
      double v11 = v25[4];
      double v12 = v25[5];
      double v13 = v25[6];
      double v14 = v25[7];
      _Block_object_dispose(&v24, 8);
      goto LABEL_4;
    }
    v22.receiver = self;
    v22.super_class = (Class)SBRelocateFloatingAppLayoutSwitcherModifier;
    [(SBRelocateFloatingAppLayoutSwitcherModifier *)&v22 floatingApplicationFrameInInterfaceOrientation:v19 floatingConfiguration:3];
  }
  else
  {
LABEL_2:
    v21.receiver = self;
    v21.super_class = (Class)SBRelocateFloatingAppLayoutSwitcherModifier;
    [(SBRelocateFloatingAppLayoutSwitcherModifier *)&v21 frameForIndex:a3];
  }
LABEL_3:
  double v11 = v7;
  double v12 = v8;
  double v13 = v9;
  double v14 = v10;
LABEL_4:

  double v15 = v11;
  double v16 = v12;
  double v17 = v13;
  double v18 = v14;
  result.size.height = v18;
  result.size.width = v17;
  result.origin.y = v16;
  result.origin.x = v15;
  return result;
}

void __61__SBRelocateFloatingAppLayoutSwitcherModifier_frameForIndex___block_invoke(uint64_t a1)
{
  [*(id *)(*(void *)(a1 + 32) + 160) frameForIndex:*(void *)(a1 + 48)];
  v2 = *(void **)(*(void *)(a1 + 40) + 8);
  v2[4] = v3;
  v2[5] = v4;
  v2[6] = v5;
  v2[7] = v6;
  if ([(id)*MEMORY[0x1E4F43630] userInterfaceLayoutDirection] == 1)
  {
    double Width = -CGRectGetWidth(*(CGRect *)(*(void *)(*(void *)(a1 + 40) + 8) + 32));
  }
  else
  {
    [*(id *)(a1 + 32) switcherViewBounds];
    double Width = CGRectGetWidth(v8);
  }
  *(double *)(*(void *)(*(void *)(a1 + 40) + 8) + 32) = Width;
}

- (double)opacityForLayoutRole:(int64_t)a3 inAppLayout:(id)a4 atIndex:(unint64_t)a5
{
  CGRect v8 = (SBAppLayout *)a4;
  if (self->_floatingAppLayout == v8
    && [(SBRelocateFloatingAppLayoutSwitcherModifier *)self _comingFromSwitcherWithLeadingFloatingApp]&& !self->_moveFloatingAppToLeadingSide)
  {
    if ([(SBTransitionSwitcherModifier *)self isPreparingLayout]) {
      double v10 = 1.0;
    }
    else {
      double v10 = 0.0;
    }
  }
  else
  {
    v12.receiver = self;
    v12.super_class = (Class)SBRelocateFloatingAppLayoutSwitcherModifier;
    [(SBRelocateFloatingAppLayoutSwitcherModifier *)&v12 opacityForLayoutRole:a3 inAppLayout:v8 atIndex:a5];
    double v10 = v9;
  }

  return v10;
}

- (double)scaleForIndex:(unint64_t)a3
{
  uint64_t v5 = [(SBRelocateFloatingAppLayoutSwitcherModifier *)self appLayouts];
  uint64_t v6 = [v5 objectAtIndex:a3];

  if (v6 == self->_floatingAppLayout
    && [(SBRelocateFloatingAppLayoutSwitcherModifier *)self _comingFromSwitcherWithLeadingFloatingApp]&& !self->_moveFloatingAppToLeadingSide)
  {
    uint64_t v13 = 0;
    double v14 = (double *)&v13;
    uint64_t v15 = 0x2020000000;
    mixedGridModifier = self->_mixedGridModifier;
    uint64_t v16 = 0;
    v12[0] = MEMORY[0x1E4F143A8];
    v12[1] = 3221225472;
    v12[2] = __61__SBRelocateFloatingAppLayoutSwitcherModifier_scaleForIndex___block_invoke;
    v12[3] = &unk_1E6AF6358;
    v12[4] = self;
    v12[5] = &v13;
    v12[6] = a3;
    [(SBChainableModifier *)self performTransactionWithTemporaryChildModifier:mixedGridModifier usingBlock:v12];
    double v8 = v14[3];
    _Block_object_dispose(&v13, 8);
  }
  else
  {
    v11.receiver = self;
    v11.super_class = (Class)SBRelocateFloatingAppLayoutSwitcherModifier;
    [(SBRelocateFloatingAppLayoutSwitcherModifier *)&v11 scaleForIndex:a3];
    double v8 = v7;
  }

  return v8;
}

uint64_t __61__SBRelocateFloatingAppLayoutSwitcherModifier_scaleForIndex___block_invoke(void *a1)
{
  uint64_t result = [*(id *)(a1[4] + 160) scaleForIndex:a1[6]];
  *(void *)(*(void *)(a1[5] + 8) + 24) = v3;
  return result;
}

- (BOOL)_goingToSwitcherWithLeadingFloatingApp
{
  return self->_direction == 1 && SBFloatingConfigurationIsLeft(self->_floatingConfiguration);
}

- (BOOL)_comingFromSwitcherWithLeadingFloatingApp
{
  return self->_direction == 2 && SBFloatingConfigurationIsLeft(self->_floatingConfiguration);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_mixedGridModifier, 0);
  objc_storeStrong((id *)&self->_floatingAppLayout, 0);
}

@end