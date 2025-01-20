@interface SBGridToFullScreenSwitcherModifier
- (SBGridToFullScreenSwitcherModifier)initWithTransitionID:(id)a3 direction:(int64_t)a4 fullScreenAppLayout:(id)a5 gridModifier:(id)a6;
- (id)appLayoutToScrollToBeforeTransitioning;
- (id)transitionWillBegin;
@end

@implementation SBGridToFullScreenSwitcherModifier

- (SBGridToFullScreenSwitcherModifier)initWithTransitionID:(id)a3 direction:(int64_t)a4 fullScreenAppLayout:(id)a5 gridModifier:(id)a6
{
  v22[1] = *MEMORY[0x1E4F143B8];
  id v11 = a3;
  id v12 = a5;
  id v13 = a6;
  v21.receiver = self;
  v21.super_class = (Class)SBGridToFullScreenSwitcherModifier;
  v14 = [(SBTransitionSwitcherModifier *)&v21 initWithTransitionID:v11];
  if (v14)
  {
    if (v12)
    {
      if (v13)
      {
LABEL_4:
        v14->_direction = a4;
        objc_storeStrong((id *)&v14->_fullScreenAppLayout, a5);
        v15 = [SBGridToActiveAppLayoutsSwitcherModifier alloc];
        v22[0] = v12;
        v16 = [MEMORY[0x1E4F1C978] arrayWithObjects:v22 count:1];
        v17 = [(SBGridToActiveAppLayoutsSwitcherModifier *)v15 initWithTransitionID:v11 direction:a4 activeAppLayouts:v16 gridModifier:v13];

        [(SBChainableModifier *)v14 addChildModifier:v17];
        goto LABEL_5;
      }
    }
    else
    {
      v19 = [MEMORY[0x1E4F28B00] currentHandler];
      [v19 handleFailureInMethod:a2, v14, @"SBGridToFullScreenSwitcherModifier.m", 26, @"Invalid parameter not satisfying: %@", @"fullScreenAppLayout" object file lineNumber description];

      if (v13) {
        goto LABEL_4;
      }
    }
    v20 = [MEMORY[0x1E4F28B00] currentHandler];
    [v20 handleFailureInMethod:a2, v14, @"SBGridToFullScreenSwitcherModifier.m", 27, @"Invalid parameter not satisfying: %@", @"gridModifier" object file lineNumber description];

    goto LABEL_4;
  }
LABEL_5:

  return v14;
}

- (id)transitionWillBegin
{
  v7.receiver = self;
  v7.super_class = (Class)SBGridToFullScreenSwitcherModifier;
  v3 = [(SBTransitionSwitcherModifier *)&v7 transitionWillBegin];
  if (self->_direction == 1)
  {
    v4 = [[SBScrollToAppLayoutSwitcherEventResponse alloc] initWithAppLayout:self->_fullScreenAppLayout alignment:0 animated:0];
    uint64_t v5 = +[SBChainableModifierEventResponse responseByAppendingResponse:v4 toResponse:v3];

    v3 = (void *)v5;
  }
  return v3;
}

- (id)appLayoutToScrollToBeforeTransitioning
{
  if (self->_direction) {
    v2 = 0;
  }
  else {
    v2 = self->_fullScreenAppLayout;
  }
  return v2;
}

- (void).cxx_destruct
{
}

@end