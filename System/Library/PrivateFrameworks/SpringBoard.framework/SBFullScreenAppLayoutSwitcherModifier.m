@interface SBFullScreenAppLayoutSwitcherModifier
- (BOOL)handlesAssistantPresentationEvents;
- (CGRect)fullScreenFrameForAppLayout:(id)a3;
- (NSUUID)homeAffordanceReuseIdentifier;
- (SBFullScreenAppLayoutSwitcherModifier)initWithActiveAppLayout:(id)a3;
- (SBFullScreenAppLayoutSwitcherModifier)initWithActiveAppLayout:(id)a3 homeAffordanceReuseIdentifier:(id)a4;
- (id)handleAssistantPresentationChangedEvent:(id)a3;
- (id)handleTransitionEvent:(id)a3;
- (void)_addAssistantModifierIfNeededForInterfaceOrientation:(int64_t)a3;
- (void)didMoveToParentModifier:(id)a3;
- (void)setHandlesAssistantPresentationEvents:(BOOL)a3;
- (void)setHomeAffordanceReuseIdentifier:(id)a3;
@end

@implementation SBFullScreenAppLayoutSwitcherModifier

- (void)didMoveToParentModifier:(id)a3
{
  v5.receiver = self;
  v5.super_class = (Class)SBFullScreenAppLayoutSwitcherModifier;
  -[SBChainableModifier didMoveToParentModifier:](&v5, sel_didMoveToParentModifier_);
  if (a3) {
    [(SBFullScreenAppLayoutSwitcherModifier *)self _addAssistantModifierIfNeededForInterfaceOrientation:[(SBFullScreenAppLayoutSwitcherModifier *)self switcherInterfaceOrientation]];
  }
}

- (SBFullScreenAppLayoutSwitcherModifier)initWithActiveAppLayout:(id)a3 homeAffordanceReuseIdentifier:(id)a4
{
  id v8 = a3;
  id v9 = a4;
  v19.receiver = self;
  v19.super_class = (Class)SBFullScreenAppLayoutSwitcherModifier;
  v10 = [(SBSwitcherModifier *)&v19 init];
  if (v10)
  {
    if (!v8)
    {
      v18 = [MEMORY[0x1E4F28B00] currentHandler];
      [v18 handleFailureInMethod:a2, v10, @"SBFullScreenAppLayoutSwitcherModifier.m", 68, @"Invalid parameter not satisfying: %@", @"appLayout" object file lineNumber description];
    }
    v11 = v9;
    if (!v9)
    {
      v11 = [MEMORY[0x1E4F29128] UUID];
    }
    objc_storeStrong((id *)&v10->_homeAffordanceReuseIdentifier, v11);
    if (!v9) {

    }
    v10->_handlesAssistantPresentationEvents = 1;
    objc_storeStrong((id *)&v10->_appLayout, a3);
    v12 = [[SBCoplanarSwitcherModifier alloc] initWithActiveAppLayout:v8];
    coplanarModifier = v10->_coplanarModifier;
    v10->_coplanarModifier = v12;

    [(SBChainableModifier *)v10 addChildModifier:v10->_coplanarModifier atLevel:0 key:0];
    v14 = [[_SBFullScreenAppFloorSwitcherModifier alloc] initWithActiveAppLayout:v8 homeAffordanceReuseIdentifier:v10->_homeAffordanceReuseIdentifier];
    floorModifier = v10->_floorModifier;
    v10->_floorModifier = v14;

    [(SBChainableModifier *)v10 addChildModifier:v10->_floorModifier atLevel:2 key:0];
    v16 = objc_alloc_init(SBDefaultImplementationsSwitcherModifier);
    [(SBChainableModifier *)v10 addChildModifier:v16 atLevel:3 key:0];
  }
  return v10;
}

- (SBFullScreenAppLayoutSwitcherModifier)initWithActiveAppLayout:(id)a3
{
  return [(SBFullScreenAppLayoutSwitcherModifier *)self initWithActiveAppLayout:a3 homeAffordanceReuseIdentifier:0];
}

- (id)handleTransitionEvent:(id)a3
{
  v9.receiver = self;
  v9.super_class = (Class)SBFullScreenAppLayoutSwitcherModifier;
  id v4 = a3;
  objc_super v5 = [(SBSwitcherModifier *)&v9 handleTransitionEvent:v4];
  uint64_t v6 = objc_msgSend(v4, "fromInterfaceOrientation", v9.receiver, v9.super_class);
  uint64_t v7 = [v4 toInterfaceOrientation];

  if (v7 != v6 && (unint64_t)(v7 - 1) <= 1) {
    [(SBFullScreenAppLayoutSwitcherModifier *)self _addAssistantModifierIfNeededForInterfaceOrientation:v7];
  }
  return v5;
}

- (void)_addAssistantModifierIfNeededForInterfaceOrientation:(int64_t)a3
{
  if ([(SBFullScreenAppLayoutSwitcherModifier *)self handlesAssistantPresentationEvents])
  {
    if (([(SBFullScreenAppLayoutSwitcherModifier *)self isDevicePad] & 1) == 0)
    {
      BOOL v5 = [(SBSwitcherModifier *)self isAssistantEffectivelyPresentedForSAETypeToSiri];
      uint64_t v6 = [(SBChainableModifier *)self childModifierByKey:@"SBFullScreenAppLayoutSwitcherModifierAssistantModifierKey"];

      if ((unint64_t)(a3 - 1) <= 1 && v5 && !v6)
      {
        uint64_t v7 = [(SBFullScreenAppLayoutSwitcherModifier *)self switcherSettings];
        [v7 effectiveSwitcherStyle];

        [(SBFullScreenAppLayoutSwitcherModifier *)self isReduceMotionEnabled];
        id v9 = objc_alloc_init((Class)objc_opt_class());
        id v8 = [[SBFullScreenAppLayoutTextModalityAssistantSwitcherModifier alloc] initWithAppLayout:self->_appLayout interfaceOrientation:a3 multitaskingModifier:v9];
        [(SBChainableModifier *)self addChildModifier:v8 atLevel:1 key:@"SBFullScreenAppLayoutSwitcherModifierAssistantModifierKey"];
      }
    }
  }
}

- (BOOL)handlesAssistantPresentationEvents
{
  return self->_handlesAssistantPresentationEvents;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_homeAffordanceReuseIdentifier, 0);
  objc_storeStrong((id *)&self->_floorModifier, 0);
  objc_storeStrong((id *)&self->_coplanarModifier, 0);
  objc_storeStrong((id *)&self->_appLayout, 0);
}

- (CGRect)fullScreenFrameForAppLayout:(id)a3
{
  [(_SBFullScreenAppFloorSwitcherModifier *)self->_floorModifier frameForAppLayout:a3];
  result.size.height = v6;
  result.size.width = v5;
  result.origin.y = v4;
  result.origin.x = v3;
  return result;
}

- (id)handleAssistantPresentationChangedEvent:(id)a3
{
  v6.receiver = self;
  v6.super_class = (Class)SBFullScreenAppLayoutSwitcherModifier;
  double v4 = [(SBSwitcherModifier *)&v6 handleAssistantPresentationChangedEvent:a3];
  [(SBFullScreenAppLayoutSwitcherModifier *)self _addAssistantModifierIfNeededForInterfaceOrientation:[(SBFullScreenAppLayoutSwitcherModifier *)self switcherInterfaceOrientation]];
  return v4;
}

- (NSUUID)homeAffordanceReuseIdentifier
{
  return self->_homeAffordanceReuseIdentifier;
}

- (void)setHomeAffordanceReuseIdentifier:(id)a3
{
}

- (void)setHandlesAssistantPresentationEvents:(BOOL)a3
{
  self->_handlesAssistantPresentationEvents = a3;
}

@end