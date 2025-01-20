@interface SBContinuousExposeWindowDragContentSwitcherModifier
- (SBContinuousExposeWindowDragContentSwitcherModifier)initWithGestureID:(id)a3 initialAppLayout:(id)a4 selectedDisplayItem:(id)a5;
- (SBContinuousExposeWindowDragSwitcherModifier)gestureModifier;
- (SBDisplayItem)selectedDisplayItem;
- (id)adjustedAppLayoutsForAppLayouts:(id)a3;
- (void)_createFloorAndMultitaskingModifiersWithAppLayout:(id)a3;
- (void)updateFloorModifiersWithAppLayout:(id)a3;
@end

@implementation SBContinuousExposeWindowDragContentSwitcherModifier

- (SBContinuousExposeWindowDragContentSwitcherModifier)initWithGestureID:(id)a3 initialAppLayout:(id)a4 selectedDisplayItem:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  v16.receiver = self;
  v16.super_class = (Class)SBContinuousExposeWindowDragContentSwitcherModifier;
  v11 = [(SBSwitcherModifier *)&v16 init];
  v12 = v11;
  if (v11)
  {
    objc_storeStrong((id *)&v11->_selectedDisplayItem, a5);
    v13 = [[SBContinuousExposeWindowDragSwitcherModifier alloc] initWithGestureID:v8 initialAppLayout:v9 selectedDisplayItem:v10];
    gestureModifier = v12->_gestureModifier;
    v12->_gestureModifier = v13;

    [(SBChainableModifier *)v12 addChildModifier:v12->_gestureModifier atLevel:0 key:0];
    [(SBContinuousExposeWindowDragContentSwitcherModifier *)v12 _createFloorAndMultitaskingModifiersWithAppLayout:v9];
  }

  return v12;
}

- (void)updateFloorModifiersWithAppLayout:(id)a3
{
  id v6 = a3;
  v4 = [(SBChainableModifier *)self childModifierByKey:@"SBContinuousExposeWindowDragContentSwitcherModifierFloorModifier"];
  if (v4) {
    [(SBChainableModifier *)self removeChildModifier:v4];
  }
  v5 = [(SBChainableModifier *)self childModifierByKey:@"SBContinuousExposeWindowDragContentSwitcherModifierMultitaskingModifier"];
  if (v5) {
    [(SBChainableModifier *)self removeChildModifier:v5];
  }
  [(SBContinuousExposeWindowDragContentSwitcherModifier *)self _createFloorAndMultitaskingModifiersWithAppLayout:v6];
}

- (void)_createFloorAndMultitaskingModifiersWithAppLayout:(id)a3
{
  id v4 = a3;
  id v6 = [[SBFullScreenContinuousExposeSwitcherModifier alloc] initWithFullScreenAppLayout:v4];

  [(SBFullScreenContinuousExposeSwitcherModifier *)v6 setHandlesTapAppLayoutEvents:0];
  [(SBFullScreenContinuousExposeSwitcherModifier *)v6 setHandlesTapAppLayoutHeaderEvents:0];
  [(SBChainableModifier *)self addChildModifier:v6 atLevel:1 key:@"SBContinuousExposeWindowDragContentSwitcherModifierFloorModifier"];
  v5 = objc_alloc_init(SBAppSwitcherContinuousExposeSwitcherModifier);
  [(SBAppSwitcherContinuousExposeSwitcherModifier *)v5 setHandlesTapAppLayoutEvents:0];
  [(SBAppSwitcherContinuousExposeSwitcherModifier *)v5 setHandlesTapAppLayoutHeaderEvents:0];
  [(SBChainableModifier *)self addChildModifier:v5 atLevel:2 key:@"SBContinuousExposeWindowDragContentSwitcherModifierMultitaskingModifier"];
}

- (id)adjustedAppLayoutsForAppLayouts:(id)a3
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v5 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  id v6 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  long long v17 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  v16.receiver = self;
  v16.super_class = (Class)SBContinuousExposeWindowDragContentSwitcherModifier;
  v7 = [(SBContinuousExposeWindowDragContentSwitcherModifier *)&v16 adjustedAppLayoutsForAppLayouts:v4];
  uint64_t v8 = [v7 countByEnumeratingWithState:&v17 objects:v21 count:16];
  if (v8)
  {
    uint64_t v9 = v8;
    uint64_t v10 = *(void *)v18;
    do
    {
      for (uint64_t i = 0; i != v9; ++i)
      {
        if (*(void *)v18 != v10) {
          objc_enumerationMutation(v7);
        }
        v12 = *(void **)(*((void *)&v17 + 1) + 8 * i);
        if ([v12 containsItem:self->_selectedDisplayItem]) {
          v13 = v5;
        }
        else {
          v13 = v6;
        }
        [v13 addObject:v12];
      }
      uint64_t v9 = [v7 countByEnumeratingWithState:&v17 objects:v21 count:16];
    }
    while (v9);
  }

  v14 = [v5 arrayByAddingObjectsFromArray:v6];

  return v14;
}

- (SBContinuousExposeWindowDragSwitcherModifier)gestureModifier
{
  return self->_gestureModifier;
}

- (SBDisplayItem)selectedDisplayItem
{
  return self->_selectedDisplayItem;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_selectedDisplayItem, 0);
  objc_storeStrong((id *)&self->_gestureModifier, 0);
}

@end