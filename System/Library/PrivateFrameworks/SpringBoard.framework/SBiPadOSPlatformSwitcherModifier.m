@interface SBiPadOSPlatformSwitcherModifier
- (char)activityModeForAppLayout:(id)a3;
- (char)jetsamModeForAppLayout:(id)a3;
- (id)foregroundAppLayouts;
- (id)handleGestureEvent:(id)a3;
- (id)handlePrepareForSceneUpdateEvent:(id)a3;
- (id)handleTransitionEvent:(id)a3;
- (id)handleUpdateWindowingModeEvent:(id)a3;
- (id)preferredAppLayoutToReuseAccessoryForAppLayout:(id)a3 fromAppLayouts:(id)a4;
- (void)setDelegate:(id)a3;
@end

@implementation SBiPadOSPlatformSwitcherModifier

- (void)setDelegate:(id)a3
{
  v9.receiver = self;
  v9.super_class = (Class)SBiPadOSPlatformSwitcherModifier;
  -[SBChainableModifier setDelegate:](&v9, sel_setDelegate_);
  if (a3)
  {
    v5 = [(SBChainableModifier *)self childModifierByKey:@"kiPadOSPlatformModifierChildKey"];

    if (!v5)
    {
      int v6 = [(SBiPadOSPlatformSwitcherModifier *)self isChamoisWindowingUIEnabled];
      v7 = off_1E6AED7F8;
      if (!v6) {
        v7 = off_1E6AEF260;
      }
      id v8 = objc_alloc_init(*v7);
      [(SBChainableModifier *)self addChildModifier:v8 atLevel:0 key:@"kiPadOSPlatformModifierChildKey"];
    }
  }
}

- (id)handlePrepareForSceneUpdateEvent:(id)a3
{
  v4 = (void *)MEMORY[0x1E4F1CAD0];
  id v5 = a3;
  int v6 = [v5 liveAppLayouts];
  v7 = [v4 setWithArray:v6];
  activatingLiveAppLayouts = self->_activatingLiveAppLayouts;
  self->_activatingLiveAppLayouts = v7;

  v11.receiver = self;
  v11.super_class = (Class)SBiPadOSPlatformSwitcherModifier;
  objc_super v9 = [(SBSwitcherModifier *)&v11 handlePrepareForSceneUpdateEvent:v5];

  return v9;
}

- (id)handleTransitionEvent:(id)a3
{
  id v4 = a3;
  v38.receiver = self;
  v38.super_class = (Class)SBiPadOSPlatformSwitcherModifier;
  id v5 = [(SBSwitcherModifier *)&v38 handleTransitionEvent:v4];
  if ([v4 isiPadOSWindowingModeChangeEvent]
    && [v4 phase] == 1
    && [v4 isAnimated])
  {
    int v6 = [v4 fromAppLayout];
    uint64_t v7 = [v4 toAppLayout];
    id v8 = (void *)v7;
    if (self->_currentUnlockedEnvironmentMode == 3 && v6 != 0 && v7 != 0)
    {
      objc_super v11 = [SBiPadOSWindowModeChangeTransitionModifier alloc];
      v12 = [v4 transitionID];
      v13 = [(SBiPadOSWindowModeChangeTransitionModifier *)v11 initWithTransitionID:v12 fromAppLayout:v6 toAppLayout:v8];

      [(SBChainableModifier *)self addChildModifier:v13 atLevel:0 key:0];
    }
  }
  v14 = (void *)MEMORY[0x1E4F1CAD0];
  v15 = [v4 fromAppLayout];
  v16 = [v15 allItems];
  v17 = [v4 fromFloatingAppLayout];
  v18 = [v17 allItems];
  v19 = [v16 arrayByAddingObjectsFromArray:v18];
  v20 = [v14 setWithArray:v19];
  previousDisplayItems = self->_previousDisplayItems;
  self->_previousDisplayItems = v20;

  v22 = (void *)MEMORY[0x1E4F1CAD0];
  v23 = [v4 toAppLayout];
  v24 = [v23 allItems];
  v25 = [v4 toFloatingAppLayout];
  v26 = [v25 allItems];
  v27 = [v24 arrayByAddingObjectsFromArray:v26];
  v28 = [v22 setWithArray:v27];
  displayItems = self->_displayItems;
  self->_displayItems = v28;

  if (([v4 isGestureInitiated] & 1) == 0)
  {
    lastGesturedDisplayItem = self->_lastGesturedDisplayItem;
    self->_lastGesturedDisplayItem = 0;
  }
  v31 = [v4 activatingAppLayout];
  if (v31
    && [v4 isMainPulseEvent]
    && ([v4 toAppLayout], v32 = objc_claimAutoreleasedReturnValue(),
                                         v32,
                                         v31 != v32))
  {
    v33 = [v31 itemForLayoutRole:1];
    lastPulsedDisplayItem = self->_lastPulsedDisplayItem;
    self->_lastPulsedDisplayItem = v33;
  }
  else
  {
    lastPulsedDisplayItem = self->_lastPulsedDisplayItem;
    self->_lastPulsedDisplayItem = 0;
  }

  v35 = [v4 unhandledCopy];
  lastTransitionEvent = self->_lastTransitionEvent;
  self->_lastTransitionEvent = v35;

  self->_currentUnlockedEnvironmentMode = [v4 toEnvironmentMode];
  return v5;
}

- (id)handleGestureEvent:(id)a3
{
  v12.receiver = self;
  v12.super_class = (Class)SBiPadOSPlatformSwitcherModifier;
  id v4 = a3;
  id v5 = [(SBSwitcherModifier *)&v12 handleGestureEvent:v4];
  int v6 = objc_msgSend(v4, "selectedAppLayout", v12.receiver, v12.super_class);

  uint64_t v7 = [v6 allItems];
  uint64_t v8 = [v7 count];

  if (v8 == 1)
  {
    objc_super v9 = [v6 itemForLayoutRole:1];
    lastGesturedDisplayItem = self->_lastGesturedDisplayItem;
    self->_lastGesturedDisplayItem = v9;
  }
  else
  {
    lastGesturedDisplayItem = self->_lastGesturedDisplayItem;
    self->_lastGesturedDisplayItem = 0;
  }

  return v5;
}

- (id)handleUpdateWindowingModeEvent:(id)a3
{
  v22.receiver = self;
  v22.super_class = (Class)SBiPadOSPlatformSwitcherModifier;
  id v4 = [(SBSwitcherModifier *)&v22 handleUpdateWindowingModeEvent:a3];
  id v5 = [(SBChainableModifier *)self childModifierByKey:@"kiPadOSPlatformModifierChildKey"];
  int v6 = [(SBiPadOSPlatformSwitcherModifier *)self isChamoisWindowingUIEnabled];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    uint64_t v7 = objc_alloc_init(SBInvalidateAdjustedAppLayoutsSwitcherEventResponse);
    uint64_t v8 = SBAppendSwitcherModifierResponse(v7, v4);

    if (self->_currentUnlockedEnvironmentMode != 3)
    {
      objc_super v9 = [[SBUpdateLayoutSwitcherEventResponse alloc] initWithOptions:30 updateMode:3];
      uint64_t v10 = SBAppendSwitcherModifierResponse(v9, v8);

      uint64_t v8 = (void *)v10;
    }
    objc_super v11 = [[SBInvalidateSnapshotCacheSwitcherEventResponse alloc] initWithDisplayItems:0];
    id v4 = SBAppendSwitcherModifierResponse(v11, v8);

    [(SBChainableModifier *)self removeChildModifier:v5];
    objc_super v12 = off_1E6AED7F8;
    if (!v6) {
      objc_super v12 = off_1E6AEF260;
    }
    id v13 = objc_alloc_init(*v12);

    [(SBChainableModifier *)self addChildModifier:v13 atLevel:0 key:@"kiPadOSPlatformModifierChildKey"];
    lastTransitionEvent = self->_lastTransitionEvent;
    if (lastTransitionEvent)
    {
      v15 = (void *)[(SBTransitionSwitcherModifierEvent *)lastTransitionEvent copy];
      v16 = [(SBTransitionSwitcherModifierEvent *)self->_lastTransitionEvent fromAppLayout];
      v17 = [v16 appLayoutByAdjustingCenterWindowItemsForChamois];
      [v15 setFromAppLayout:v17];

      v18 = [(SBTransitionSwitcherModifierEvent *)self->_lastTransitionEvent toAppLayout];
      v19 = [v18 appLayoutByAdjustingCenterWindowItemsForChamois];
      [v15 setToAppLayout:v19];

      id v20 = (id)[v13 handleEvent:v15];
    }
  }
  else
  {
    id v13 = v5;
  }

  return v4;
}

- (id)preferredAppLayoutToReuseAccessoryForAppLayout:(id)a3 fromAppLayouts:(id)a4
{
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = __98__SBiPadOSPlatformSwitcherModifier_preferredAppLayoutToReuseAccessoryForAppLayout_fromAppLayouts___block_invoke;
  v11[3] = &unk_1E6AFFF90;
  v11[4] = self;
  id v6 = a3;
  uint64_t v7 = [a4 sortedArrayUsingComparator:v11];
  v10.receiver = self;
  v10.super_class = (Class)SBiPadOSPlatformSwitcherModifier;
  uint64_t v8 = [(SBiPadOSPlatformSwitcherModifier *)&v10 preferredAppLayoutToReuseAccessoryForAppLayout:v6 fromAppLayouts:v7];

  return v8;
}

uint64_t __98__SBiPadOSPlatformSwitcherModifier_preferredAppLayoutToReuseAccessoryForAppLayout_fromAppLayouts___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  if ([v5 containsItem:*(void *)(*(void *)(a1 + 32) + 112)]) {
    goto LABEL_2;
  }
  if (([v6 containsItem:*(void *)(*(void *)(a1 + 32) + 112)] & 1) != 0
    || [v5 containsAnyItemFromSet:*(void *)(*(void *)(a1 + 32) + 96)]
    && ![v6 containsAnyItemFromSet:*(void *)(*(void *)(a1 + 32) + 96)])
  {
    goto LABEL_4;
  }
  if (([v5 containsAnyItemFromSet:*(void *)(*(void *)(a1 + 32) + 96)] & 1) == 0
    && ([v6 containsAnyItemFromSet:*(void *)(*(void *)(a1 + 32) + 96)] & 1) != 0
    || [v5 environment] == 2)
  {
    goto LABEL_2;
  }
  if ([v6 environment] == 2)
  {
LABEL_4:
    uint64_t v7 = -1;
    goto LABEL_5;
  }
  if ([v5 environment] != 3)
  {
    if ([v6 environment] == 3) {
      goto LABEL_4;
    }
    uint64_t v9 = *(void *)(a1 + 32);
    if (!*(void *)(v9 + 120)) {
      goto LABEL_19;
    }
    if ((objc_msgSend(v5, "containsItem:") & 1) == 0)
    {
      uint64_t v9 = *(void *)(a1 + 32);
      if (*(void *)(v9 + 120))
      {
        if (objc_msgSend(v6, "containsItem:")) {
          goto LABEL_4;
        }
        uint64_t v9 = *(void *)(a1 + 32);
      }
LABEL_19:
      if (![v5 containsAnyItemFromSet:*(void *)(v9 + 96)]
        || ([v5 containsAnyItemFromSet:*(void *)(*(void *)(a1 + 32) + 104)] & 1) == 0)
      {
        if (![v6 containsAnyItemFromSet:*(void *)(*(void *)(a1 + 32) + 96)]
          || ([v6 containsAnyItemFromSet:*(void *)(*(void *)(a1 + 32) + 104)] & 1) == 0)
        {
          uint64_t v7 = 0;
          goto LABEL_5;
        }
        goto LABEL_2;
      }
      goto LABEL_4;
    }
  }
LABEL_2:
  uint64_t v7 = 1;
LABEL_5:

  return v7;
}

- (id)foregroundAppLayouts
{
  v6.receiver = self;
  v6.super_class = (Class)SBiPadOSPlatformSwitcherModifier;
  v3 = [(SBiPadOSPlatformSwitcherModifier *)&v6 foregroundAppLayouts];
  if ([(NSSet *)self->_activatingLiveAppLayouts count])
  {
    uint64_t v4 = [v3 setByAddingObjectsFromSet:self->_activatingLiveAppLayouts];

    v3 = (void *)v4;
  }
  return v3;
}

- (char)jetsamModeForAppLayout:(id)a3
{
  id v4 = a3;
  if ([(NSSet *)self->_activatingLiveAppLayouts containsObject:v4])
  {
    char v5 = 0;
  }
  else
  {
    v7.receiver = self;
    v7.super_class = (Class)SBiPadOSPlatformSwitcherModifier;
    char v5 = [(SBiPadOSPlatformSwitcherModifier *)&v7 jetsamModeForAppLayout:v4];
  }

  return v5;
}

- (char)activityModeForAppLayout:(id)a3
{
  id v4 = a3;
  if ([(NSSet *)self->_activatingLiveAppLayouts containsObject:v4])
  {
    char v5 = 0;
  }
  else
  {
    v7.receiver = self;
    v7.super_class = (Class)SBiPadOSPlatformSwitcherModifier;
    char v5 = [(SBiPadOSPlatformSwitcherModifier *)&v7 activityModeForAppLayout:v4];
  }

  return v5;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_lastTransitionEvent, 0);
  objc_storeStrong((id *)&self->_activatingLiveAppLayouts, 0);
  objc_storeStrong((id *)&self->_lastPulsedDisplayItem, 0);
  objc_storeStrong((id *)&self->_lastGesturedDisplayItem, 0);
  objc_storeStrong((id *)&self->_displayItems, 0);
  objc_storeStrong((id *)&self->_previousDisplayItems, 0);
}

@end