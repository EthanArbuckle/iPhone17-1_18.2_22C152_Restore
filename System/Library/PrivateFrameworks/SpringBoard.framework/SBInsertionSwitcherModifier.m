@interface SBInsertionSwitcherModifier
- (BOOL)clipsToUnobscuredMarginAtIndex:(unint64_t)a3;
- (CGPoint)scrollViewContentOffset;
- (SBInsertionSwitcherModifier)initWithAppLayout:(id)a3;
- (double)opacityForLayoutRole:(int64_t)a3 inAppLayout:(id)a4 atIndex:(unint64_t)a5;
- (id)animationAttributesForLayoutElement:(id)a3;
- (id)handleInsertionEvent:(id)a3;
- (id)visibleAppLayouts;
- (unint64_t)phase;
- (void)_performBlockBySimulatingPreInsertionState:(id)a3;
@end

@implementation SBInsertionSwitcherModifier

- (SBInsertionSwitcherModifier)initWithAppLayout:(id)a3
{
  id v6 = a3;
  v10.receiver = self;
  v10.super_class = (Class)SBInsertionSwitcherModifier;
  v7 = [(SBSwitcherModifier *)&v10 init];
  if (v7)
  {
    if (!v6)
    {
      v9 = [MEMORY[0x1E4F28B00] currentHandler];
      [v9 handleFailureInMethod:a2, v7, @"SBInsertionSwitcherModifier.m", 31, @"Invalid parameter not satisfying: %@", @"appLayout" object file lineNumber description];
    }
    objc_storeStrong((id *)&v7->_appLayout, a3);
    v7->_phase = 0;
  }

  return v7;
}

- (id)handleInsertionEvent:(id)a3
{
  id v4 = a3;
  v25.receiver = self;
  v25.super_class = (Class)SBInsertionSwitcherModifier;
  v5 = [(SBSwitcherModifier *)&v25 handleInsertionEvent:v4];
  appLayout = self->_appLayout;
  v7 = [v4 appLayout];
  LODWORD(appLayout) = [(SBAppLayout *)appLayout isEqual:v7];

  if (appLayout)
  {
    unint64_t v8 = [v4 phase];
    self->_phase = v8;
    switch(v8)
    {
      case 4uLL:
        [(SBChainableModifier *)self setState:1];
        break;
      case 2uLL:
        v11 = [(SBInsertionSwitcherModifier *)self appLayouts];
        if ([v11 count])
        {
          uint64_t v21 = 0;
          v22 = &v21;
          uint64_t v23 = 0x2020000000;
          uint64_t v24 = 0x7FFFFFFFFFFFFFFFLL;
          v18[0] = MEMORY[0x1E4F143A8];
          v18[1] = 3221225472;
          v18[2] = __52__SBInsertionSwitcherModifier_handleInsertionEvent___block_invoke;
          v18[3] = &unk_1E6AF6380;
          v20 = &v21;
          v18[4] = self;
          id v19 = v4;
          [(SBInsertionSwitcherModifier *)self _performBlockBySimulatingPreInsertionState:v18];
          unint64_t v12 = [v11 count] - 1;
          if (v12 >= v22[3]) {
            unint64_t v12 = v22[3];
          }
          v22[3] = v12;
          if (v12 != 0x7FFFFFFFFFFFFFFFLL)
          {
            v13 = [(SBInsertionSwitcherModifier *)self appLayouts];
            v14 = [v13 objectAtIndex:v22[3]];

            v15 = [[SBScrollToAppLayoutSwitcherEventResponse alloc] initWithAppLayout:v14 alignment:0 animated:0];
            uint64_t v16 = +[SBChainableModifierEventResponse responseByAppendingResponse:v15 toResponse:v5];

            v5 = (void *)v16;
          }

          _Block_object_dispose(&v21, 8);
        }

        break;
      case 1uLL:
        [(SBInsertionSwitcherModifier *)self scrollViewContentOffset];
        self->_contentOffsetBeforeInsertion.x = v9;
        self->_contentOffsetBeforeInsertion.y = v10;
        break;
    }
  }

  return v5;
}

uint64_t __52__SBInsertionSwitcherModifier_handleInsertionEvent___block_invoke(uint64_t a1)
{
  uint64_t result = objc_msgSend(*(id *)(a1 + 32), "indexToScrollToAfterInsertingAtIndex:", objc_msgSend(*(id *)(a1 + 40), "index"));
  *(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) = result;
  return result;
}

- (CGPoint)scrollViewContentOffset
{
  if (self->_isSimulatingPreInsertionState)
  {
    double x = self->_contentOffsetBeforeInsertion.x;
    double y = self->_contentOffsetBeforeInsertion.y;
  }
  else
  {
    v4.receiver = self;
    v4.super_class = (Class)SBInsertionSwitcherModifier;
    [(SBInsertionSwitcherModifier *)&v4 scrollViewContentOffset];
  }
  result.double y = y;
  result.double x = x;
  return result;
}

- (id)visibleAppLayouts
{
  v14.receiver = self;
  v14.super_class = (Class)SBInsertionSwitcherModifier;
  v3 = [(SBInsertionSwitcherModifier *)&v14 visibleAppLayouts];
  objc_super v4 = v3;
  if (self->_phase > 1)
  {
    uint64_t v8 = 0;
    CGFloat v9 = &v8;
    uint64_t v10 = 0x3032000000;
    v11 = __Block_byref_object_copy__107;
    unint64_t v12 = __Block_byref_object_dispose__107;
    id v13 = 0;
    v7[0] = MEMORY[0x1E4F143A8];
    v7[1] = 3221225472;
    v7[2] = __48__SBInsertionSwitcherModifier_visibleAppLayouts__block_invoke;
    v7[3] = &unk_1E6AF4B88;
    v7[4] = self;
    v7[5] = &v8;
    [(SBInsertionSwitcherModifier *)self _performBlockBySimulatingPreInsertionState:v7];
    id v5 = [v4 setByAddingObjectsFromSet:v9[5]];
    _Block_object_dispose(&v8, 8);
  }
  else
  {
    id v5 = v3;
  }

  return v5;
}

void __48__SBInsertionSwitcherModifier_visibleAppLayouts__block_invoke(uint64_t a1)
{
  v5.receiver = *(id *)(a1 + 32);
  v5.super_class = (Class)SBInsertionSwitcherModifier;
  uint64_t v2 = objc_msgSendSuper2(&v5, sel_visibleAppLayouts);
  uint64_t v3 = *(void *)(*(void *)(a1 + 40) + 8);
  objc_super v4 = *(void **)(v3 + 40);
  *(void *)(v3 + 40) = v2;
}

- (id)animationAttributesForLayoutElement:(id)a3
{
  v10.receiver = self;
  v10.super_class = (Class)SBInsertionSwitcherModifier;
  objc_super v4 = [(SBInsertionSwitcherModifier *)&v10 animationAttributesForLayoutElement:a3];
  objc_super v5 = (void *)[v4 mutableCopy];

  [v5 setUpdateMode:3];
  id v6 = [(SBInsertionSwitcherModifier *)self switcherSettings];
  v7 = [v6 animationSettings];
  uint64_t v8 = [v7 opacitySettings];
  [v5 setOpacitySettings:v8];

  return v5;
}

- (BOOL)clipsToUnobscuredMarginAtIndex:(unint64_t)a3
{
  return 0;
}

- (double)opacityForLayoutRole:(int64_t)a3 inAppLayout:(id)a4 atIndex:(unint64_t)a5
{
  id v8 = a4;
  if (self->_phase != 2
    || ([(SBInsertionSwitcherModifier *)self appLayouts],
        CGFloat v9 = objc_claimAutoreleasedReturnValue(),
        uint64_t v10 = [v9 indexOfObject:self->_appLayout],
        v9,
        double v11 = 0.0,
        v10 != a5))
  {
    v14.receiver = self;
    v14.super_class = (Class)SBInsertionSwitcherModifier;
    [(SBInsertionSwitcherModifier *)&v14 opacityForLayoutRole:a3 inAppLayout:v8 atIndex:a5];
    double v11 = v12;
  }

  return v11;
}

- (void)_performBlockBySimulatingPreInsertionState:(id)a3
{
  id v4 = a3;
  BOOL isSimulatingPreInsertionState = self->_isSimulatingPreInsertionState;
  self->_BOOL isSimulatingPreInsertionState = 1;
  id v6 = objc_alloc(MEMORY[0x1E4F1CA48]);
  v7 = [(SBInsertionSwitcherModifier *)self appLayouts];
  id v8 = (void *)[v6 initWithArray:v7];

  [v8 removeObject:self->_appLayout];
  CGFloat v9 = [[SBOverrideAppLayoutsSwitcherModifier alloc] initWithAppLayouts:v8];
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = __74__SBInsertionSwitcherModifier__performBlockBySimulatingPreInsertionState___block_invoke;
  v11[3] = &unk_1E6AF5300;
  id v12 = v4;
  id v10 = v4;
  [(SBChainableModifier *)self performTransactionWithTemporaryChildModifier:v9 usingBlock:v11];
  self->_BOOL isSimulatingPreInsertionState = isSimulatingPreInsertionState;
}

uint64_t __74__SBInsertionSwitcherModifier__performBlockBySimulatingPreInsertionState___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (unint64_t)phase
{
  return self->_phase;
}

- (void).cxx_destruct
{
}

@end