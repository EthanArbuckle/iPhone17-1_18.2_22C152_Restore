@interface SBFocusedAppLayoutSwitcherModifier
- (BOOL)shouldShowBackdropViewAtIndex:(unint64_t)a3;
- (SBFocusedAppLayoutSwitcherModifier)initWithFocusedAppLayout:(id)a3;
- (id)handleRemovalEvent:(id)a3;
- (id)handleUpdateFocusedAppLayoutEvent:(id)a3;
- (id)visibleAppLayouts;
@end

@implementation SBFocusedAppLayoutSwitcherModifier

- (SBFocusedAppLayoutSwitcherModifier)initWithFocusedAppLayout:(id)a3
{
  id v6 = a3;
  if (!v6)
  {
    v10 = [MEMORY[0x1E4F28B00] currentHandler];
    [v10 handleFailureInMethod:a2, self, @"SBFocusedAppLayoutSwitcherModifier.m", 22, @"Invalid parameter not satisfying: %@", @"focusedAppLayout" object file lineNumber description];
  }
  v11.receiver = self;
  v11.super_class = (Class)SBFocusedAppLayoutSwitcherModifier;
  v7 = [(SBSwitcherModifier *)&v11 init];
  v8 = v7;
  if (v7) {
    objc_storeStrong((id *)&v7->_focusedAppLayout, a3);
  }

  return v8;
}

- (id)visibleAppLayouts
{
  v8.receiver = self;
  v8.super_class = (Class)SBFocusedAppLayoutSwitcherModifier;
  v3 = [(SBFocusedAppLayoutSwitcherModifier *)&v8 visibleAppLayouts];
  v4 = [v3 setByAddingObject:self->_focusedAppLayout];

  v5 = [(SBFocusedAppLayoutSwitcherModifier *)self neighboringAppLayoutsForFocusedAppLayout:self->_focusedAppLayout];
  if (v5)
  {
    uint64_t v6 = [v4 setByAddingObjectsFromSet:v5];

    v4 = (void *)v6;
  }

  return v4;
}

- (id)handleUpdateFocusedAppLayoutEvent:(id)a3
{
  id v4 = a3;
  v52.receiver = self;
  v52.super_class = (Class)SBFocusedAppLayoutSwitcherModifier;
  v5 = [(SBSwitcherModifier *)&v52 handleUpdateFocusedAppLayoutEvent:v4];
  uint64_t v6 = [v4 appLayout];
  if ([v6 isOrContainsAppLayout:self->_focusedAppLayout])
  {
    if (([v4 isFocused] & 1) == 0)
    {
      [(SBChainableModifier *)self setState:1];
      v30 = [SBUpdateLayoutSwitcherEventResponse alloc];
      uint64_t v31 = 32;
      uint64_t v32 = 2;
LABEL_35:
      v37 = -[SBUpdateLayoutSwitcherEventResponse initWithOptions:updateMode:](v30, "initWithOptions:updateMode:", v31, v32, *(void *)&v40);
      uint64_t v38 = SBAppendSwitcherModifierResponse(v37, v5);

      v5 = (void *)v38;
      goto LABEL_36;
    }
    v7 = [(SBFocusedAppLayoutSwitcherModifier *)self appLayouts];
    unint64_t v8 = [v7 indexOfObject:self->_focusedAppLayout];

    if (v8 == 0x7FFFFFFFFFFFFFFFLL) {
      goto LABEL_36;
    }
    [(SBFocusedAppLayoutSwitcherModifier *)self switcherViewBounds];
    CGFloat v10 = v9;
    rect.origin.CGFloat x = v9;
    rect.origin.CGFloat y = v11;
    CGFloat v13 = v12;
    CGFloat v15 = v14;
    v51.receiver = self;
    v51.super_class = (Class)SBFocusedAppLayoutSwitcherModifier;
    [(SBFocusedAppLayoutSwitcherModifier *)&v51 frameForIndex:v8];
    v50.receiver = self;
    v50.super_class = (Class)SBFocusedAppLayoutSwitcherModifier;
    [(SBFocusedAppLayoutSwitcherModifier *)&v50 scaleForIndex:v8];
    SBTransformedRectWithScale();
    CGFloat x = v54.origin.x;
    CGFloat y = v54.origin.y;
    CGFloat width = v54.size.width;
    CGFloat height = v54.size.height;
    CGRectGetMinX(v54);
    v55.origin.CGFloat x = v10;
    v55.origin.CGFloat y = v13;
    v55.size.CGFloat width = v15;
    v55.size.CGFloat height = rect.origin.y;
    CGRectGetMinX(v55);
    int v20 = BSFloatLessThanFloat();
    CGFloat v40 = x;
    v56.origin.CGFloat x = x;
    v56.origin.CGFloat y = y;
    v56.size.CGFloat width = width;
    v56.size.CGFloat height = height;
    CGRectGetMaxX(v56);
    v57.origin.CGFloat x = rect.origin.x;
    v57.origin.CGFloat y = v13;
    v57.size.CGFloat width = v15;
    v57.size.CGFloat height = rect.origin.y;
    CGRectGetMaxX(v57);
    int v21 = BSFloatGreaterThanFloat();
    int v22 = [(SBFocusedAppLayoutSwitcherModifier *)self isRTLEnabled];
    LOBYTE(v23) = 0;
    if (v22) {
      char v24 = v21;
    }
    else {
      char v24 = v20;
    }
    if (!v22) {
      int v20 = v21;
    }
    if (v24 & 1) != 0 || (v20) {
      goto LABEL_27;
    }
    if ([(SBAppLayout *)self->_focusedAppLayout environment] == 2
      && [(SBFocusedAppLayoutSwitcherModifier *)self canFocusableAppLayoutBeEffectivelyObscured:self->_focusedAppLayout])
    {
      v25 = [(SBFocusedAppLayoutSwitcherModifier *)self appLayouts];
      *(void *)&rect.size.CGFloat width = MEMORY[0x1E4F143A8];
      *(void *)&rect.size.CGFloat height = 3221225472;
      v42 = __72__SBFocusedAppLayoutSwitcherModifier_handleUpdateFocusedAppLayoutEvent___block_invoke;
      v43 = &unk_1E6B08B90;
      id v26 = v25;
      id v44 = v26;
      v45 = self;
      CGFloat v46 = x;
      CGFloat v47 = y;
      CGFloat v48 = width;
      CGFloat v49 = height;
      v27 = (uint64_t (**)(void, void))MEMORY[0x1D948C7A0](&rect.size);
      *(void *)&rect.origin.CGFloat y = v26;
      if (v8 < [v26 count] - 1) {
        uint64_t v28 = v8 + 1;
      }
      else {
        uint64_t v28 = 0x7FFFFFFFFFFFFFFFLL;
      }
      int v29 = v27[2](v27, v28);
      if (v29 && v8)
      {
        int v23 = 1;
      }
      else
      {
        if (v8) {
          uint64_t v33 = v8 - 1;
        }
        else {
          uint64_t v33 = 0x7FFFFFFFFFFFFFFFLL;
        }
        int v23 = v27[2](v27, v33);
      }

      if (v29)
      {
LABEL_27:
        if ([(SBAppLayout *)self->_focusedAppLayout environment] == 2) {
          uint64_t v34 = 0;
        }
        else {
          uint64_t v34 = v20 ^ 1u;
        }
        v35 = [[SBScrollToAppLayoutSwitcherEventResponse alloc] initWithAppLayout:self->_focusedAppLayout alignment:v34 animated:1];
        uint64_t v36 = SBAppendSwitcherModifierResponse(v35, v5);

        v30 = [SBUpdateLayoutSwitcherEventResponse alloc];
        if ((v23 & 1) == 0)
        {
          uint64_t v32 = 2;
          v5 = (void *)v36;
          goto LABEL_34;
        }
        v5 = (void *)v36;
        goto LABEL_32;
      }
      v30 = [SBUpdateLayoutSwitcherEventResponse alloc];
      if (v23)
      {
LABEL_32:
        uint64_t v32 = 3;
        goto LABEL_34;
      }
    }
    else
    {
      v30 = [SBUpdateLayoutSwitcherEventResponse alloc];
    }
    uint64_t v32 = 2;
LABEL_34:
    uint64_t v31 = 30;
    goto LABEL_35;
  }
LABEL_36:

  return v5;
}

BOOL __72__SBFocusedAppLayoutSwitcherModifier_handleUpdateFocusedAppLayoutEvent___block_invoke(uint64_t a1, uint64_t a2)
{
  if (a2 == 0x7FFFFFFFFFFFFFFFLL) {
    return 0;
  }
  uint64_t v19 = v7;
  uint64_t v20 = v6;
  uint64_t v21 = v5;
  uint64_t v22 = v4;
  uint64_t v23 = v2;
  uint64_t v24 = v3;
  CGFloat v11 = [*(id *)(a1 + 32) objectAtIndex:a2];
  uint64_t v12 = [v11 environment];

  if (v12 != 2) {
    return 0;
  }
  v18.receiver = *(id *)(a1 + 40);
  v18.super_class = (Class)SBFocusedAppLayoutSwitcherModifier;
  objc_msgSendSuper2(&v18, sel_frameForIndex_, a2);
  v17.receiver = *(id *)(a1 + 40);
  v17.super_class = (Class)SBFocusedAppLayoutSwitcherModifier;
  objc_msgSendSuper2(&v17, sel_scaleForIndex_, a2);
  SBTransformedRectWithScale();
  v25.origin.CGFloat x = v13;
  v25.origin.CGFloat y = v14;
  v25.size.CGFloat width = v15;
  v25.size.CGFloat height = v16;
  return CGRectIntersectsRect(*(CGRect *)(a1 + 48), v25);
}

- (id)handleRemovalEvent:(id)a3
{
  v10.receiver = self;
  v10.super_class = (Class)SBFocusedAppLayoutSwitcherModifier;
  id v4 = a3;
  uint64_t v5 = [(SBSwitcherModifier *)&v10 handleRemovalEvent:v4];
  objc_msgSend(v4, "appLayout", v10.receiver, v10.super_class);
  uint64_t v6 = (SBAppLayout *)objc_claimAutoreleasedReturnValue();

  if (v6 == self->_focusedAppLayout)
  {
    [(SBChainableModifier *)self setState:1];
    uint64_t v7 = [[SBUpdateLayoutSwitcherEventResponse alloc] initWithOptions:30 updateMode:3];
    uint64_t v8 = SBAppendSwitcherModifierResponse(v7, v5);

    uint64_t v5 = (void *)v8;
  }

  return v5;
}

- (BOOL)shouldShowBackdropViewAtIndex:(unint64_t)a3
{
  id v4 = self;
  v9.receiver = self;
  v9.super_class = (Class)SBFocusedAppLayoutSwitcherModifier;
  unsigned int v5 = -[SBFocusedAppLayoutSwitcherModifier shouldShowBackdropViewAtIndex:](&v9, sel_shouldShowBackdropViewAtIndex_);
  uint64_t v6 = [(SBFocusedAppLayoutSwitcherModifier *)v4 appLayouts];
  uint64_t v7 = [v6 objectAtIndex:a3];

  LODWORD(v4) = [v7 isOrContainsAppLayout:v4->_focusedAppLayout] | v5;
  return (char)v4;
}

- (void).cxx_destruct
{
}

@end