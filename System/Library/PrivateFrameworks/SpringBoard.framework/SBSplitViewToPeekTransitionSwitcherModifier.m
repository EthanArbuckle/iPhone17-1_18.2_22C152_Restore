@interface SBSplitViewToPeekTransitionSwitcherModifier
- (SBSplitViewToPeekTransitionSwitcherModifier)initWithTransitionID:(id)a3 fromAppLayout:(id)a4;
- (void)didMoveToParentModifier:(id)a3;
@end

@implementation SBSplitViewToPeekTransitionSwitcherModifier

- (SBSplitViewToPeekTransitionSwitcherModifier)initWithTransitionID:(id)a3 fromAppLayout:(id)a4
{
  id v7 = a4;
  v11.receiver = self;
  v11.super_class = (Class)SBSplitViewToPeekTransitionSwitcherModifier;
  v8 = [(SBTransitionSwitcherModifier *)&v11 initWithTransitionID:a3];
  v9 = v8;
  if (v8) {
    objc_storeStrong((id *)&v8->_fromAppLayout, a4);
  }

  return v9;
}

- (void)didMoveToParentModifier:(id)a3
{
  v9.receiver = self;
  v9.super_class = (Class)SBSplitViewToPeekTransitionSwitcherModifier;
  -[SBChainableModifier didMoveToParentModifier:](&v9, sel_didMoveToParentModifier_);
  if (a3)
  {
    v5 = [SBSplitDisplayItemSwitcherModifier alloc];
    v6 = [(SBAppLayout *)self->_fromAppLayout zOrderedItems];
    id v7 = [v6 firstObject];
    v8 = [(SBSplitDisplayItemSwitcherModifier *)v5 initWithDisplayItem:v7];
    [(SBChainableModifier *)self addChildModifier:v8];
  }
}

- (void).cxx_destruct
{
}

@end