@interface SBPulseDisplayItemSwitcherModifier
- (SBDisplayItem)displayItem;
- (SBDisplayItem)displayItemToPulse;
- (SBPulseDisplayItemSwitcherModifier)initWithDisplayItem:(id)a3;
- (SBSwitcherAsyncRenderingAttributes)asyncRenderingAttributesForAppLayout:(id)a3;
- (double)scaleForLayoutRole:(int64_t)a3 inAppLayout:(id)a4;
- (id)animationAttributesForLayoutElement:(id)a3;
- (id)handleTapAppLayoutHeaderEvent:(id)a3;
- (id)handleTimerEvent:(id)a3;
- (id)topMostLayoutElements;
@end

@implementation SBPulseDisplayItemSwitcherModifier

- (SBPulseDisplayItemSwitcherModifier)initWithDisplayItem:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)SBPulseDisplayItemSwitcherModifier;
  v6 = [(SBSwitcherModifier *)&v9 init];
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_displayItem, a3);
    objc_storeStrong((id *)&v7->_displayItemToPulse, a3);
  }

  return v7;
}

- (id)handleTapAppLayoutHeaderEvent:(id)a3
{
  v14.receiver = self;
  v14.super_class = (Class)SBPulseDisplayItemSwitcherModifier;
  v4 = [(SBSwitcherModifier *)&v14 handleTapAppLayoutHeaderEvent:a3];
  id v5 = [[SBUpdateLayoutSwitcherEventResponse alloc] initWithOptions:4 updateMode:3];
  v6 = SBAppendSwitcherModifierResponse(v5, v4);

  v7 = [(SBPulseDisplayItemSwitcherModifier *)self switcherSettings];
  v8 = [v7 animationSettings];
  [v8 pulseSecondStageDelay];
  double v10 = v9;

  v11 = [[SBTimerEventSwitcherEventResponse alloc] initWithDelay:0 validator:@"SBPulseDisplayItemSwitcherModifierTimerReason" reason:v10];
  v12 = SBAppendSwitcherModifierResponse(v11, v6);

  return v12;
}

- (id)handleTimerEvent:(id)a3
{
  v11.receiver = self;
  v11.super_class = (Class)SBPulseDisplayItemSwitcherModifier;
  id v4 = a3;
  id v5 = [(SBSwitcherModifier *)&v11 handleTimerEvent:v4];
  v6 = objc_msgSend(v4, "reason", v11.receiver, v11.super_class);

  LODWORD(v4) = [v6 isEqualToString:@"SBPulseDisplayItemSwitcherModifierTimerReason"];
  if (v4)
  {
    displayItemToPulse = self->_displayItemToPulse;
    self->_displayItemToPulse = 0;

    v8 = [[SBUpdateLayoutSwitcherEventResponse alloc] initWithOptions:4 updateMode:3];
    uint64_t v9 = SBAppendSwitcherModifierResponse(v8, v5);

    [(SBChainableModifier *)self setState:1];
    id v5 = (void *)v9;
  }
  return v5;
}

- (double)scaleForLayoutRole:(int64_t)a3 inAppLayout:(id)a4
{
  v15.receiver = self;
  v15.super_class = (Class)SBPulseDisplayItemSwitcherModifier;
  id v6 = a4;
  [(SBPulseDisplayItemSwitcherModifier *)&v15 scaleForLayoutRole:a3 inAppLayout:v6];
  double v8 = v7;
  uint64_t v9 = objc_msgSend(v6, "itemForLayoutRole:", a3, v15.receiver, v15.super_class);

  int v10 = [v9 isEqual:self->_displayItemToPulse];
  if (v10)
  {
    objc_super v11 = [(SBPulseDisplayItemSwitcherModifier *)self switcherSettings];
    v12 = [v11 animationSettings];
    [v12 pulseScale];
    double v8 = v8 * v13;
  }
  return v8;
}

- (id)animationAttributesForLayoutElement:(id)a3
{
  id v4 = a3;
  v11.receiver = self;
  v11.super_class = (Class)SBPulseDisplayItemSwitcherModifier;
  id v5 = [(SBPulseDisplayItemSwitcherModifier *)&v11 animationAttributesForLayoutElement:v4];
  id v6 = (void *)[v5 mutableCopy];

  if (![v4 switcherLayoutElementType]
    && [v4 containsItem:self->_displayItemToPulse])
  {
    double v7 = [(SBPulseDisplayItemSwitcherModifier *)self switcherSettings];
    double v8 = [v7 animationSettings];
    uint64_t v9 = [v8 pulseScaleSettings];
    [v6 setLayoutSettings:v9];
  }
  return v6;
}

- (SBSwitcherAsyncRenderingAttributes)asyncRenderingAttributesForAppLayout:(id)a3
{
  id v4 = a3;
  if ([v4 containsItem:self->_displayItemToPulse])
  {
    unsigned __int16 v5 = SBSwitcherAsyncRenderingAttributesMake(0, 0);
  }
  else
  {
    v8.receiver = self;
    v8.super_class = (Class)SBPulseDisplayItemSwitcherModifier;
    unsigned __int16 v5 = (unsigned __int16)[(SBPulseDisplayItemSwitcherModifier *)&v8 asyncRenderingAttributesForAppLayout:v4];
  }
  SBSwitcherAsyncRenderingAttributes v6 = (SBSwitcherAsyncRenderingAttributes)v5;

  return v6;
}

- (id)topMostLayoutElements
{
  v3 = [(SBPulseDisplayItemSwitcherModifier *)self appLayouts];
  v12[0] = MEMORY[0x1E4F143A8];
  v12[1] = 3221225472;
  v12[2] = __59__SBPulseDisplayItemSwitcherModifier_topMostLayoutElements__block_invoke;
  v12[3] = &unk_1E6AF4B60;
  v12[4] = self;
  id v4 = objc_msgSend(v3, "bs_firstObjectPassingTest:", v12);

  unsigned __int16 v5 = [(SBPulseDisplayItemSwitcherModifier *)self appLayoutOnStage];
  int v6 = [v5 isOrContainsAppLayout:v4];

  if (v6)
  {
    v11.receiver = self;
    v11.super_class = (Class)SBPulseDisplayItemSwitcherModifier;
    double v7 = [(SBPulseDisplayItemSwitcherModifier *)&v11 topMostLayoutElements];
    objc_super v8 = objc_msgSend(v7, "sb_arrayByInsertingOrMovingObject:toIndex:", v4, 0);
  }
  else
  {
    v10.receiver = self;
    v10.super_class = (Class)SBPulseDisplayItemSwitcherModifier;
    objc_super v8 = [(SBPulseDisplayItemSwitcherModifier *)&v10 topMostLayoutElements];
  }

  return v8;
}

uint64_t __59__SBPulseDisplayItemSwitcherModifier_topMostLayoutElements__block_invoke(uint64_t a1, void *a2)
{
  return [a2 containsItem:*(void *)(*(void *)(a1 + 32) + 96)];
}

- (SBDisplayItem)displayItem
{
  return self->_displayItem;
}

- (SBDisplayItem)displayItemToPulse
{
  return self->_displayItemToPulse;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_displayItemToPulse, 0);
  objc_storeStrong((id *)&self->_displayItem, 0);
}

@end