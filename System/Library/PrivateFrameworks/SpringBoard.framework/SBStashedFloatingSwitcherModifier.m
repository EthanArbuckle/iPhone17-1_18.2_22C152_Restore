@interface SBStashedFloatingSwitcherModifier
- (BOOL)isSwitcherWindowUserInteractionEnabled;
- (BOOL)isSwitcherWindowVisible;
- (SBStashedFloatingSwitcherModifier)initWithFloatingConfiguration:(int64_t)a3 environmentMode:(int64_t)a4;
- (double)opacityForLayoutRole:(int64_t)a3 inAppLayout:(id)a4 atIndex:(unint64_t)a5;
- (double)shadowOpacityForLayoutRole:(int64_t)a3 atIndex:(unint64_t)a4;
- (id)handleTapSlideOverTongueEvent:(id)a3;
- (id)visibleAppLayouts;
@end

@implementation SBStashedFloatingSwitcherModifier

- (SBStashedFloatingSwitcherModifier)initWithFloatingConfiguration:(int64_t)a3 environmentMode:(int64_t)a4
{
  v10.receiver = self;
  v10.super_class = (Class)SBStashedFloatingSwitcherModifier;
  v6 = [(SBSwitcherModifier *)&v10 init];
  if (v6)
  {
    v7 = [[SBActiveAppLayoutFloatingSwitcherModifier alloc] initWithActiveAppLayout:0 floatingConfiguration:a3 environmentMode:a4];
    activeModifier = v6->_activeModifier;
    v6->_activeModifier = v7;

    [(SBChainableModifier *)v6 addChildModifier:v6->_activeModifier];
  }
  return v6;
}

- (id)handleTapSlideOverTongueEvent:(id)a3
{
  id v4 = a3;
  v5 = [(SBStashedFloatingSwitcherModifier *)self appLayouts];
  v6 = [v5 firstObject];
  v7 = +[SBSwitcherTransitionRequest requestForActivatingAppLayout:v6];
  v8 = (void *)[v7 mutableCopy];

  [v8 setSource:60];
  v9 = [[SBPerformTransitionSwitcherEventResponse alloc] initWithTransitionRequest:v8 gestureInitiated:0];
  v13.receiver = self;
  v13.super_class = (Class)SBStashedFloatingSwitcherModifier;
  objc_super v10 = [(SBSwitcherModifier *)&v13 handleTapSlideOverTongueEvent:v4];

  v11 = SBAppendSwitcherModifierResponse(v9, v10);

  return v11;
}

- (id)visibleAppLayouts
{
  return (id)[MEMORY[0x1E4F1CAD0] set];
}

- (double)opacityForLayoutRole:(int64_t)a3 inAppLayout:(id)a4 atIndex:(unint64_t)a5
{
  return 1.0;
}

- (double)shadowOpacityForLayoutRole:(int64_t)a3 atIndex:(unint64_t)a4
{
  return 0.0;
}

- (BOOL)isSwitcherWindowVisible
{
  return 0;
}

- (BOOL)isSwitcherWindowUserInteractionEnabled
{
  return 0;
}

- (void).cxx_destruct
{
}

@end