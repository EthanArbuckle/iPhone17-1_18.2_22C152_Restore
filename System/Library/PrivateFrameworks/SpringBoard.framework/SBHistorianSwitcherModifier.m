@interface SBHistorianSwitcherModifier
- (SBHistorianSwitcherModifier)initWithRootModifier:(id)a3;
- (SBHistorianSwitcherModifierDelegate)historianDelegate;
- (SBSwitcherModifier)rootModifier;
- (id)handleEvent:(id)a3;
- (void)setDelegate:(id)a3;
- (void)setHistorianDelegate:(id)a3;
@end

@implementation SBHistorianSwitcherModifier

- (SBHistorianSwitcherModifier)initWithRootModifier:(id)a3
{
  id v6 = a3;
  if (!v6)
  {
    v10 = [MEMORY[0x1E4F28B00] currentHandler];
    [v10 handleFailureInMethod:a2, self, @"SBHistorianSwitcherModifier.m", 25, @"Invalid parameter not satisfying: %@", @"modifier" object file lineNumber description];
  }
  v11.receiver = self;
  v11.super_class = (Class)SBHistorianSwitcherModifier;
  v7 = [(SBSwitcherModifier *)&v11 init];
  v8 = v7;
  if (v7) {
    objc_storeStrong((id *)&v7->_rootModifier, a3);
  }

  return v8;
}

- (void)setDelegate:(id)a3
{
  v5.receiver = self;
  v5.super_class = (Class)SBHistorianSwitcherModifier;
  -[SBChainableModifier setDelegate:](&v5, sel_setDelegate_);
  if (a3)
  {
    if (![(SBChainableModifier *)self containsChildModifier:self->_rootModifier]) {
      [(SBChainableModifier *)self addChildModifier:self->_rootModifier];
    }
  }
}

- (id)handleEvent:(id)a3
{
  id v4 = a3;
  objc_super v5 = [(SBHistorianSwitcherModifier *)self historianDelegate];
  if ([v5 historianModifier:self shouldRecordEvent:v4])
  {
    id v6 = [[SBSwitcherModifierEventSnapshot alloc] initWithEvent:v4];
    v13.receiver = self;
    v13.super_class = (Class)SBHistorianSwitcherModifier;
    v7 = [(SBChainableModifier *)&v13 handleEvent:v4];
    v8 = [[SBSwitcherModifierEventResponseSnapshot alloc] initWithEventResponse:v7];
    v9 = [[SBSwitcherModifierStackSnapshot alloc] initWithRootModifier:self->_rootModifier];
    v10 = [[SBSwitcherModifierTimelineEntry alloc] initWithEventSnapshot:v6 responseSnapshot:v8 stackSnapshotAfterEvent:v9];
    [v5 historianModifier:self didRecordEntry:v10];
  }
  else
  {
    v12.receiver = self;
    v12.super_class = (Class)SBHistorianSwitcherModifier;
    v7 = [(SBChainableModifier *)&v12 handleEvent:v4];
  }

  return v7;
}

- (SBHistorianSwitcherModifierDelegate)historianDelegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_historianDelegate);
  return (SBHistorianSwitcherModifierDelegate *)WeakRetained;
}

- (void)setHistorianDelegate:(id)a3
{
}

- (SBSwitcherModifier)rootModifier
{
  return self->_rootModifier;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_rootModifier, 0);
  objc_destroyWeak((id *)&self->_historianDelegate);
}

@end