@interface SBHighlightSwitcherModifier
- (BOOL)shouldAccessoryDrawShadowForAppLayout:(id)a3;
- (BOOL)stylesCornerRadii;
- (SBHighlightSwitcherModifier)initWithLayoutRole:(int64_t)a3 inAppLayout:(id)a4 listensForHighlightEvents:(BOOL)a5;
- (UIRectCornerRadii)cornerRadiiForLayoutRole:(int64_t)a3 inAppLayout:(id)a4 withCornerRadii:(UIRectCornerRadii)a5;
- (id)animationAttributesForLayoutElement:(id)a3;
- (id)handleHighlightEvent:(id)a3;
- (id)topMostLayoutElements;
- (id)topMostLayoutRolesForAppLayout:(id)a3;
- (void)setStylesCornerRadii:(BOOL)a3;
@end

@implementation SBHighlightSwitcherModifier

- (SBHighlightSwitcherModifier)initWithLayoutRole:(int64_t)a3 inAppLayout:(id)a4 listensForHighlightEvents:(BOOL)a5
{
  id v9 = a4;
  v15.receiver = self;
  v15.super_class = (Class)SBHighlightSwitcherModifier;
  v10 = [(SBSwitcherModifier *)&v15 init];
  v11 = v10;
  if (v10)
  {
    v10->_layoutRole = a3;
    objc_storeStrong((id *)&v10->_appLayout, a4);
    uint64_t v12 = [(SBAppLayout *)v11->_appLayout leafAppLayoutForRole:v11->_layoutRole];
    leafAppLayout = v11->_leafAppLayout;
    v11->_leafAppLayout = (SBAppLayout *)v12;

    v11->_listensForHighlightEvents = a5;
    v11->_stylesCornerRadii = 1;
  }

  return v11;
}

- (id)handleHighlightEvent:(id)a3
{
  id v4 = a3;
  v12.receiver = self;
  v12.super_class = (Class)SBHighlightSwitcherModifier;
  v5 = [(SBSwitcherModifier *)&v12 handleHighlightEvent:v4];
  if (self->_listensForHighlightEvents)
  {
    v6 = [v4 appLayout];
    objc_msgSend(v6, "leafAppLayoutForRole:", objc_msgSend(v4, "layoutRole"));
    v7 = (SBAppLayout *)objc_claimAutoreleasedReturnValue();

    if (v7 == self->_leafAppLayout)
    {
      uint64_t phase = [v4 phase];
      self->_uint64_t phase = phase;
      if (!phase)
      {
        id v9 = [[SBUpdateLayoutSwitcherEventResponse alloc] initWithOptions:32 updateMode:3];
        uint64_t v10 = SBAppendSwitcherModifierResponse(v9, v5);

        uint64_t phase = self->_phase;
        v5 = (void *)v10;
      }
      if ((unint64_t)(phase - 1) <= 1) {
        [(SBChainableModifier *)self setState:1];
      }
    }
  }
  return v5;
}

- (id)animationAttributesForLayoutElement:(id)a3
{
  id v4 = (SBAppLayout *)a3;
  v8.receiver = self;
  v8.super_class = (Class)SBHighlightSwitcherModifier;
  v5 = [(SBHighlightSwitcherModifier *)&v8 animationAttributesForLayoutElement:v4];
  v6 = (void *)[v5 mutableCopy];

  if (self->_appLayout == v4
    && ([(SBHighlightSwitcherModifier *)self shouldTetherItemsAndAccessoriesInAppLayout:v4] & 1) == 0)
  {
    [v6 setUpdateMode:3];
  }

  return v6;
}

- (BOOL)shouldAccessoryDrawShadowForAppLayout:(id)a3
{
  id v4 = a3;
  if ([v4 isOrContainsAppLayout:self->_appLayout]
    && ![(SBHighlightSwitcherModifier *)self shouldTetherItemsAndAccessoriesInAppLayout:self->_appLayout])
  {
    BOOL v5 = 0;
  }
  else
  {
    v7.receiver = self;
    v7.super_class = (Class)SBHighlightSwitcherModifier;
    BOOL v5 = [(SBHighlightSwitcherModifier *)&v7 shouldAccessoryDrawShadowForAppLayout:v4];
  }

  return v5;
}

- (UIRectCornerRadii)cornerRadiiForLayoutRole:(int64_t)a3 inAppLayout:(id)a4 withCornerRadii:(UIRectCornerRadii)a5
{
  double topRight = a5.topRight;
  double bottomRight = a5.bottomRight;
  double bottomLeft = a5.bottomLeft;
  double topLeft = a5.topLeft;
  v11 = (SBAppLayout *)a4;
  v31.receiver = self;
  v31.super_class = (Class)SBHighlightSwitcherModifier;
  -[SBHighlightSwitcherModifier cornerRadiiForLayoutRole:inAppLayout:withCornerRadii:](&v31, sel_cornerRadiiForLayoutRole_inAppLayout_withCornerRadii_, a3, v11, topLeft, bottomLeft, bottomRight, topRight);
  double v13 = v12;
  double v15 = v14;
  double v17 = v16;
  double v19 = v18;
  if (self->_stylesCornerRadii && self->_appLayout == v11 && [(SBAppLayout *)v11 environment] == 1)
  {
    if ([(SBAppLayout *)v11 isSplitConfiguration])
    {
      v20 = [(SBAppLayout *)v11 itemForLayoutRole:4];

      if (!v20)
      {
        v21 = [(SBHighlightSwitcherModifier *)self appLayouts];
        uint64_t v22 = [v21 indexOfObject:v11];

        [(SBHighlightSwitcherModifier *)self cornerRadiiForIndex:v22];
        SBRectCornerRadiiForRadius();
        double v13 = v23;
        double v15 = v24;
        double v17 = v25;
        double v19 = v26;
      }
    }
  }

  double v27 = v13;
  double v28 = v15;
  double v29 = v17;
  double v30 = v19;
  result.double topRight = v30;
  result.double bottomRight = v29;
  result.double bottomLeft = v28;
  result.double topLeft = v27;
  return result;
}

- (id)topMostLayoutElements
{
  v10[1] = *MEMORY[0x1E4F143B8];
  if ([(SBHighlightSwitcherModifier *)self shouldBringCardToFrontDuringInsertionOrRemoval]&& [(SBAppLayout *)self->_appLayout environment] == 1)
  {
    v9.receiver = self;
    v9.super_class = (Class)SBHighlightSwitcherModifier;
    v3 = [(SBHighlightSwitcherModifier *)&v9 topMostLayoutElements];
    id v4 = v3;
    if (v3)
    {
      BOOL v5 = (void *)[v3 mutableCopy];
      uint64_t v6 = [v5 indexOfObject:self->_appLayout];
      if (v6 != 0x7FFFFFFFFFFFFFFFLL) {
        [v5 removeObjectAtIndex:v6];
      }
      [v5 insertObject:self->_appLayout atIndex:0];
    }
    else
    {
      v10[0] = self->_appLayout;
      BOOL v5 = [MEMORY[0x1E4F1C978] arrayWithObjects:v10 count:1];
    }
  }
  else
  {
    v8.receiver = self;
    v8.super_class = (Class)SBHighlightSwitcherModifier;
    BOOL v5 = [(SBHighlightSwitcherModifier *)&v8 topMostLayoutElements];
  }
  return v5;
}

- (id)topMostLayoutRolesForAppLayout:(id)a3
{
  v12[1] = *MEMORY[0x1E4F143B8];
  id v4 = (SBAppLayout *)a3;
  v11.receiver = self;
  v11.super_class = (Class)SBHighlightSwitcherModifier;
  BOOL v5 = [(SBHighlightSwitcherModifier *)&v11 topMostLayoutRolesForAppLayout:v4];
  if (self->_appLayout == v4)
  {
    uint64_t v6 = [(SBAppLayout *)v4 itemForLayoutRole:4];

    if (!v6)
    {
      uint64_t v7 = [NSNumber numberWithInteger:self->_layoutRole];
      objc_super v8 = (void *)v7;
      if (v5)
      {
        objc_super v9 = (void *)[v5 mutableCopy];
        if ([v9 containsObject:v8]) {
          [v9 removeObject:v8];
        }
        [v9 insertObject:v8 atIndex:0];
      }
      else
      {
        v12[0] = v7;
        objc_super v9 = [MEMORY[0x1E4F1C978] arrayWithObjects:v12 count:1];
      }

      BOOL v5 = v9;
    }
  }

  return v5;
}

- (BOOL)stylesCornerRadii
{
  return self->_stylesCornerRadii;
}

- (void)setStylesCornerRadii:(BOOL)a3
{
  self->_stylesCornerRadii = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_leafAppLayout, 0);
  objc_storeStrong((id *)&self->_appLayout, 0);
}

@end