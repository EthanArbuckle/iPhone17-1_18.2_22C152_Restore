@interface SBSplitViewRootSwitcherModifier
- (SBSplitViewRootSwitcherModifier)init;
- (id)_handleEvent:(id)a3;
- (id)_routingModifierForEvent:(id)a3;
- (id)handleEvent:(id)a3;
- (id)handleTimerEvent:(id)a3;
- (id)responseForProposedChildResponse:(id)a3 childModifier:(id)a4 event:(id)a5;
- (id)visibleHomeAffordanceLayoutElements;
@end

@implementation SBSplitViewRootSwitcherModifier

- (SBSplitViewRootSwitcherModifier)init
{
  v6.receiver = self;
  v6.super_class = (Class)SBSplitViewRootSwitcherModifier;
  v2 = [(SBSwitcherModifier *)&v6 init];
  if (v2)
  {
    v3 = objc_alloc_init(SBFullScreenFluidSwitcherRootSwitcherModifier);
    fullScreenModifier = v2->_fullScreenModifier;
    v2->_fullScreenModifier = &v3->super.super;

    [(SBChainableModifier *)v2 addChildModifier:v2->_fullScreenModifier];
  }
  return v2;
}

- (id)responseForProposedChildResponse:(id)a3 childModifier:(id)a4 event:(id)a5
{
  id v8 = a5;
  v14.receiver = self;
  v14.super_class = (Class)SBSplitViewRootSwitcherModifier;
  v9 = (SBSwitcherModifier *)a4;
  v10 = [(SBChainableModifier *)&v14 responseForProposedChildResponse:a3 childModifier:v9 event:v8];
  fullScreenModifier = self->_fullScreenModifier;

  if (fullScreenModifier == v9)
  {
    v12 = -[SBSplitViewRootSwitcherModifier _routingModifierForEvent:](self, "_routingModifierForEvent:", v8, v14.receiver, v14.super_class);

    if (v12)
    {

      v10 = 0;
    }
  }

  return v10;
}

- (id)handleEvent:(id)a3
{
  id v4 = a3;
  routingModifier = self->_routingModifier;
  if (routingModifier)
  {
    objc_super v6 = [(SBChainableModifier *)routingModifier parentModifier];
    BOOL v7 = v6 == self;
  }
  else
  {
    BOOL v7 = 0;
  }
  v45.receiver = self;
  v45.super_class = (Class)SBSplitViewRootSwitcherModifier;
  uint64_t v33 = [(SBChainableModifier *)&v45 handleEvent:v4];
  id v8 = self->_routingModifier;
  if (v8)
  {
    v9 = [(SBChainableModifier *)v8 parentModifier];
    BOOL v10 = v9 == self;
  }
  else
  {
    BOOL v10 = 0;
  }
  if (objc_msgSend(v4, "isGestureEvent", v33))
  {
    id v11 = v4;
    unint64_t v12 = [v11 type];
    if (v12 <= 5 && ((1 << v12) & 0x2C) != 0)
    {
      if (![v11 phase])
      {
        v13 = [SBGestureSwitcherModifier alloc];
        objc_super v14 = [v11 gestureID];
        v15 = [(SBGestureSwitcherModifier *)v13 initWithGestureID:v14];
        gestureTrackingModifier = self->_gestureTrackingModifier;
        self->_gestureTrackingModifier = v15;
      }
      if (v7 && !v10) {
        self->_stoppedRoutingDueToArcSwipe = 1;
      }
    }
    else
    {
      v17 = self->_gestureTrackingModifier;
      self->_gestureTrackingModifier = 0;
    }
  }
  if ([v4 isTransitionEvent])
  {
    id v18 = v4;
    if ([v18 phase] == 1)
    {
      v19 = [SBTransitionSwitcherModifier alloc];
      v20 = [v18 transitionID];
      v21 = [(SBTransitionSwitcherModifier *)v19 initWithTransitionID:v20];
      transitionTrackingModifier = self->_transitionTrackingModifier;
      self->_transitionTrackingModifier = v21;
    }
  }
  v23 = self->_gestureTrackingModifier;
  if (v23)
  {
    uint64_t v41 = 0;
    v42 = &v41;
    uint64_t v43 = 0x2020000000;
    uint64_t v44 = 0;
    v38[0] = MEMORY[0x1E4F143A8];
    v38[1] = 3221225472;
    v38[2] = __47__SBSplitViewRootSwitcherModifier_handleEvent___block_invoke;
    v38[3] = &unk_1E6AFA6F8;
    v38[4] = self;
    id v39 = v4;
    v40 = &v41;
    [(SBChainableModifier *)self performTransactionWithTemporaryChildModifier:v23 usingBlock:v38];
    [(SBChainableModifier *)self->_gestureTrackingModifier setState:v42[3]];

    _Block_object_dispose(&v41, 8);
  }
  v24 = self->_transitionTrackingModifier;
  if (v24)
  {
    uint64_t v41 = 0;
    v42 = &v41;
    uint64_t v43 = 0x2020000000;
    uint64_t v44 = 0;
    v35[0] = MEMORY[0x1E4F143A8];
    v35[1] = 3221225472;
    v35[2] = __47__SBSplitViewRootSwitcherModifier_handleEvent___block_invoke_2;
    v35[3] = &unk_1E6AFA6F8;
    v35[4] = self;
    id v36 = v4;
    v37 = &v41;
    [(SBChainableModifier *)self performTransactionWithTemporaryChildModifier:v24 usingBlock:v35];
    [(SBChainableModifier *)self->_transitionTrackingModifier setState:v42[3]];

    _Block_object_dispose(&v41, 8);
  }
  if ([(SBGestureSwitcherModifier *)self->_gestureTrackingModifier gesturePhase] == 3
    && [(SBChainableModifier *)self->_gestureTrackingModifier state] <= 0)
  {
    [(SBChainableModifier *)self->_gestureTrackingModifier setState:1];
    if (v10) {
      goto LABEL_34;
    }
  }
  else if (v10)
  {
LABEL_34:
    v26 = v34;
    goto LABEL_35;
  }
  if (!self->_stoppedRoutingDueToArcSwipe) {
    goto LABEL_34;
  }
  v25 = self->_gestureTrackingModifier;
  v26 = v34;
  if (!v25 || [(SBChainableModifier *)v25 state] == 1)
  {
    v27 = self->_transitionTrackingModifier;
    if (!v27 || [(SBChainableModifier *)v27 state] == 1)
    {
      v28 = [[SBTimerEventSwitcherEventResponse alloc] initWithDelay:0 validator:@"SBSplitViewRootSwitcherModifierTimerEventReason" reason:0.4];
      uint64_t v29 = SBAppendSwitcherModifierResponse(v28, v34);

      v26 = (void *)v29;
    }
  }
LABEL_35:
  if ([(SBChainableModifier *)self->_gestureTrackingModifier state] == 1)
  {
    v30 = self->_gestureTrackingModifier;
    self->_gestureTrackingModifier = 0;
  }
  if ([(SBChainableModifier *)self->_transitionTrackingModifier state] == 1)
  {
    v31 = self->_transitionTrackingModifier;
    self->_transitionTrackingModifier = 0;
  }
  return v26;
}

uint64_t __47__SBSplitViewRootSwitcherModifier_handleEvent___block_invoke(void *a1)
{
  id v2 = (id)[*(id *)(a1[4] + 112) handleEvent:a1[5]];
  uint64_t result = [*(id *)(a1[4] + 112) state];
  *(void *)(*(void *)(a1[6] + 8) + 24) = result;
  return result;
}

uint64_t __47__SBSplitViewRootSwitcherModifier_handleEvent___block_invoke_2(void *a1)
{
  id v2 = (id)[*(id *)(a1[4] + 120) handleEvent:a1[5]];
  uint64_t result = [*(id *)(a1[4] + 120) state];
  *(void *)(*(void *)(a1[6] + 8) + 24) = result;
  return result;
}

- (id)_handleEvent:(id)a3
{
  id v4 = a3;
  v5 = [(SBChainableModifier *)self->_fullScreenModifier parentModifier];
  v21.receiver = self;
  v21.super_class = (Class)SBSplitViewRootSwitcherModifier;
  objc_super v6 = [(SBSwitcherModifier *)&v21 _handleEvent:v4];
  p_routingModifier = &self->_routingModifier;
  routingModifier = self->_routingModifier;
  if (!routingModifier) {
    goto LABEL_5;
  }
  v9 = [(SBChainableModifier *)routingModifier parentModifier];

  if (!v9)
  {
    [(SBChainableModifier *)self->_fullScreenModifier setState:0];
    [(SBChainableModifier *)self addChildModifier:self->_fullScreenModifier];
    BOOL v10 = *p_routingModifier;
    *p_routingModifier = 0;
  }
  if (!*p_routingModifier)
  {
LABEL_5:
    id v11 = [(SBSplitViewRootSwitcherModifier *)self _routingModifierForEvent:v4];
    if (v11)
    {
      objc_storeStrong((id *)&self->_routingModifier, v11);
      [(SBChainableModifier *)self addChildModifier:*p_routingModifier];
      unint64_t v12 = [(SBChainableModifier *)self->_fullScreenModifier parentModifier];

      if (v12) {
        [(SBChainableModifier *)self removeChildModifier:self->_fullScreenModifier];
      }
      if ([v4 isTransitionEvent])
      {
        v13 = [v4 unhandledCopy];
        objc_super v14 = [v13 fromAppLayout];
        [v13 setToAppLayout:v14];

        objc_msgSend(v13, "setToEnvironmentMode:", objc_msgSend(v13, "fromEnvironmentMode"));
        [v13 setPhase:3];
        [v13 setAnimated:0];
        id v15 = [(SBChainableModifier *)*p_routingModifier handleEvent:v13];
      }
      [(SBChainableModifier *)*p_routingModifier setState:0];
    }
  }
  if (!v5)
  {
    v16 = [(SBChainableModifier *)self->_fullScreenModifier parentModifier];

    if (!v16)
    {
      fullScreenModifier = self->_fullScreenModifier;
      v19[0] = MEMORY[0x1E4F143A8];
      v19[1] = 3221225472;
      v19[2] = __48__SBSplitViewRootSwitcherModifier__handleEvent___block_invoke;
      v19[3] = &unk_1E6AF5290;
      v19[4] = self;
      id v20 = v4;
      [(SBChainableModifier *)self performTransactionWithTemporaryChildModifier:fullScreenModifier usingBlock:v19];
    }
  }

  return v6;
}

id __48__SBSplitViewRootSwitcherModifier__handleEvent___block_invoke(uint64_t a1)
{
  return (id)[*(id *)(*(void *)(a1 + 32) + 96) _handleEvent:*(void *)(a1 + 40)];
}

- (id)handleTimerEvent:(id)a3
{
  v10.receiver = self;
  v10.super_class = (Class)SBSplitViewRootSwitcherModifier;
  id v4 = a3;
  v5 = [(SBSwitcherModifier *)&v10 handleTimerEvent:v4];
  objc_super v6 = objc_msgSend(v4, "reason", v10.receiver, v10.super_class);

  LODWORD(v4) = [v6 isEqualToString:@"SBSplitViewRootSwitcherModifierTimerEventReason"];
  if (v4)
  {
    self->_stoppedRoutingDueToArcSwipe = 0;
    BOOL v7 = [[SBUpdateLayoutSwitcherEventResponse alloc] initWithOptions:16 updateMode:3];
    uint64_t v8 = SBAppendSwitcherModifierResponse(v7, v5);

    v5 = (void *)v8;
  }
  return v5;
}

- (id)visibleHomeAffordanceLayoutElements
{
  if (self->_stoppedRoutingDueToArcSwipe)
  {
    id v2 = [MEMORY[0x1E4F1CAD0] set];
  }
  else
  {
    v4.receiver = self;
    v4.super_class = (Class)SBSplitViewRootSwitcherModifier;
    id v2 = [(SBSplitViewRootSwitcherModifier *)&v4 visibleHomeAffordanceLayoutElements];
  }
  return v2;
}

- (id)_routingModifierForEvent:(id)a3
{
  return +[SBPeekSplitViewRoutingSwitcherModifier modifierForEvent:a3];
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_transitionTrackingModifier, 0);
  objc_storeStrong((id *)&self->_gestureTrackingModifier, 0);
  objc_storeStrong((id *)&self->_routingModifier, 0);
  objc_storeStrong((id *)&self->_fullScreenModifier, 0);
}

@end