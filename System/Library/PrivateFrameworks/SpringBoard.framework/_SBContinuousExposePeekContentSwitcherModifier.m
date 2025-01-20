@interface _SBContinuousExposePeekContentSwitcherModifier
- (BOOL)isItemResizingAllowedForLayoutRole:(int64_t)a3 inAppLayout:(id)a4;
- (BOOL)isLayoutRoleSelectable:(int64_t)a3 inAppLayout:(id)a4;
- (BOOL)shouldAllowContentViewTouchesForLayoutRole:(int64_t)a3 inAppLayout:(id)a4;
- (BOOL)switcherHitTestsAsOpaque;
- (CGRect)frameForLayoutRole:(int64_t)a3 inAppLayout:(id)a4 withBounds:(CGRect)a5;
- (SBAppLayout)appLayout;
- (_SBContinuousExposePeekContentSwitcherModifier)initWithAppLayout:(id)a3 configuration:(int64_t)a4;
- (double)scaleForLayoutRole:(int64_t)a3 inAppLayout:(id)a4;
- (id)adjustedAppLayoutsForAppLayouts:(id)a3;
- (id)handleTapAppLayoutEvent:(id)a3;
- (id)keyboardSuppressionMode;
- (id)responseForProposedChildResponse:(id)a3 childModifier:(id)a4 event:(id)a5;
- (int64_t)configuration;
- (unint64_t)activeCornersForTouchResizeForLayoutRole:(int64_t)a3 inAppLayout:(id)a4;
@end

@implementation _SBContinuousExposePeekContentSwitcherModifier

- (_SBContinuousExposePeekContentSwitcherModifier)initWithAppLayout:(id)a3 configuration:(int64_t)a4
{
  id v8 = a3;
  v16.receiver = self;
  v16.super_class = (Class)_SBContinuousExposePeekContentSwitcherModifier;
  v9 = [(SBSwitcherModifier *)&v16 init];
  if (v9)
  {
    if (!v8)
    {
      v15 = [MEMORY[0x1E4F28B00] currentHandler];
      [v15 handleFailureInMethod:a2, v9, @"SBContinuousExposePeekSwitcherModifier.m", 239, @"Invalid parameter not satisfying: %@", @"appLayout" object file lineNumber description];
    }
    objc_storeStrong((id *)&v9->_appLayout, a3);
    v9->_configuration = a4;
    v10 = [[SBFullScreenContinuousExposeSwitcherModifier alloc] initWithFullScreenAppLayout:v9->_appLayout];
    fullScreenContinuousExposeAppLayoutModifier = v9->_fullScreenContinuousExposeAppLayoutModifier;
    v9->_fullScreenContinuousExposeAppLayoutModifier = v10;

    [(SBFullScreenContinuousExposeSwitcherModifier *)v9->_fullScreenContinuousExposeAppLayoutModifier setHandlesTapAppLayoutEvents:0];
    [(SBFullScreenContinuousExposeSwitcherModifier *)v9->_fullScreenContinuousExposeAppLayoutModifier setHandlesTapAppLayoutHeaderEvents:0];
    [(SBChainableModifier *)v9 addChildModifier:v9->_fullScreenContinuousExposeAppLayoutModifier atLevel:0 key:0];
    v12 = objc_alloc_init(SBAppSwitcherContinuousExposeSwitcherModifier);
    appSwitcherModifier = v9->_appSwitcherModifier;
    v9->_appSwitcherModifier = v12;

    [(SBAppSwitcherContinuousExposeSwitcherModifier *)v9->_appSwitcherModifier setHandlesTapAppLayoutEvents:0];
    [(SBAppSwitcherContinuousExposeSwitcherModifier *)v9->_appSwitcherModifier setHandlesTapAppLayoutHeaderEvents:0];
    [(SBChainableModifier *)v9 addChildModifier:v9->_appSwitcherModifier atLevel:1 key:0];
  }

  return v9;
}

- (id)adjustedAppLayoutsForAppLayouts:(id)a3
{
  v11.receiver = self;
  v11.super_class = (Class)_SBContinuousExposePeekContentSwitcherModifier;
  v4 = [(_SBContinuousExposePeekContentSwitcherModifier *)&v11 adjustedAppLayoutsForAppLayouts:a3];
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __82___SBContinuousExposePeekContentSwitcherModifier_adjustedAppLayoutsForAppLayouts___block_invoke;
  v10[3] = &unk_1E6AF4B60;
  v10[4] = self;
  v5 = objc_msgSend(v4, "bs_filter:", v10);
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __82___SBContinuousExposePeekContentSwitcherModifier_adjustedAppLayoutsForAppLayouts___block_invoke_2;
  v9[3] = &unk_1E6AF4B60;
  v9[4] = self;
  v6 = objc_msgSend(v4, "bs_filter:", v9);
  v7 = [v5 arrayByAddingObjectsFromArray:v6];

  return v7;
}

- (CGRect)frameForLayoutRole:(int64_t)a3 inAppLayout:(id)a4 withBounds:(CGRect)a5
{
  double height = a5.size.height;
  double width = a5.size.width;
  double y = a5.origin.y;
  double x = a5.origin.x;
  id v11 = a4;
  v29.receiver = self;
  v29.super_class = (Class)_SBContinuousExposePeekContentSwitcherModifier;
  -[_SBContinuousExposePeekContentSwitcherModifier frameForLayoutRole:inAppLayout:withBounds:](&v29, sel_frameForLayoutRole_inAppLayout_withBounds_, a3, v11, x, y, width, height);
  double v13 = v12;
  double v15 = v14;
  double v17 = v16;
  double v19 = v18;
  if ([v11 isEqual:self->_appLayout])
  {
    v20 = [v11 itemForLayoutRole:a3];
    -[SBSwitcherModifier frameForContinuousExposePeekingDisplayItem:inAppLayout:bounds:defaultFrameForLayoutRole:](self, "frameForContinuousExposePeekingDisplayItem:inAppLayout:bounds:defaultFrameForLayoutRole:", v20, v11, x, y, width, height, v13, v15, v17, v19);
    double v13 = v21;
    double v15 = v22;
    double v17 = v23;
    double v19 = v24;
  }
  double v25 = v13;
  double v26 = v15;
  double v27 = v17;
  double v28 = v19;
  result.size.double height = v28;
  result.size.double width = v27;
  result.origin.double y = v26;
  result.origin.double x = v25;
  return result;
}

- (double)scaleForLayoutRole:(int64_t)a3 inAppLayout:(id)a4
{
  id v6 = a4;
  double v7 = 1.0;
  if (([v6 isEqual:self->_appLayout] & 1) == 0)
  {
    v10.receiver = self;
    v10.super_class = (Class)_SBContinuousExposePeekContentSwitcherModifier;
    [(_SBContinuousExposePeekContentSwitcherModifier *)&v10 scaleForLayoutRole:a3 inAppLayout:v6];
    double v7 = v8;
  }

  return v7;
}

- (BOOL)shouldAllowContentViewTouchesForLayoutRole:(int64_t)a3 inAppLayout:(id)a4
{
  id v6 = a4;
  if ([v6 isEqual:self->_appLayout])
  {
    BOOL v7 = 0;
  }
  else
  {
    v9.receiver = self;
    v9.super_class = (Class)_SBContinuousExposePeekContentSwitcherModifier;
    BOOL v7 = [(_SBContinuousExposePeekContentSwitcherModifier *)&v9 shouldAllowContentViewTouchesForLayoutRole:a3 inAppLayout:v6];
  }

  return v7;
}

- (BOOL)isLayoutRoleSelectable:(int64_t)a3 inAppLayout:(id)a4
{
  return 1;
}

- (BOOL)switcherHitTestsAsOpaque
{
  return 0;
}

- (unint64_t)activeCornersForTouchResizeForLayoutRole:(int64_t)a3 inAppLayout:(id)a4
{
  return 0;
}

- (BOOL)isItemResizingAllowedForLayoutRole:(int64_t)a3 inAppLayout:(id)a4
{
  return 0;
}

- (id)handleTapAppLayoutEvent:(id)a3
{
  v10.receiver = self;
  v10.super_class = (Class)_SBContinuousExposePeekContentSwitcherModifier;
  id v4 = a3;
  v5 = [(SBSwitcherModifier *)&v10 handleTapAppLayoutEvent:v4];
  id v6 = +[SBSwitcherTransitionRequest requestForTapAppLayoutEvent:](SBMutableSwitcherTransitionRequest, "requestForTapAppLayoutEvent:", v4, v10.receiver, v10.super_class);
  [v6 setPeekConfiguration:1];
  objc_msgSend(v6, "setRetainsSiri:", -[_SBContinuousExposePeekContentSwitcherModifier isSystemAssistantExperiencePersistentSiriEnabled](self, "isSystemAssistantExperiencePersistentSiriEnabled"));
  BOOL v7 = [[SBPerformTransitionSwitcherEventResponse alloc] initWithTransitionRequest:v6 gestureInitiated:0];
  double v8 = SBAppendSwitcherModifierResponse(v7, v5);

  [v4 handleWithReason:@"Exiting out of peek"];
  return v8;
}

- (id)responseForProposedChildResponse:(id)a3 childModifier:(id)a4 event:(id)a5
{
  double v8 = (SBFullScreenContinuousExposeSwitcherModifier *)a4;
  id v9 = a5;
  v12.receiver = self;
  v12.super_class = (Class)_SBContinuousExposePeekContentSwitcherModifier;
  objc_super v10 = [(SBChainableModifier *)&v12 responseForProposedChildResponse:a3 childModifier:v8 event:v9];
  if (self->_fullScreenContinuousExposeAppLayoutModifier == v8 && [v9 type] == 17
    || (SBFullScreenContinuousExposeSwitcherModifier *)self->_appSwitcherModifier == v8)
  {

    objc_super v10 = 0;
  }

  return v10;
}

- (id)keyboardSuppressionMode
{
  return +[SBSwitcherKeyboardSuppressionMode suppressionModeForAllScenes];
}

- (SBAppLayout)appLayout
{
  return self->_appLayout;
}

- (int64_t)configuration
{
  return self->_configuration;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_appLayout, 0);
  objc_storeStrong((id *)&self->_appSwitcherModifier, 0);
  objc_storeStrong((id *)&self->_fullScreenContinuousExposeAppLayoutModifier, 0);
}

@end