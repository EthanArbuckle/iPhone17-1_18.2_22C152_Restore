@interface SBContinuousExposeDragAndDropToAppTransitionSwitcherModifier
- (BOOL)shouldPerformCrossfadeForReduceMotion;
- (SBSwitcherAsyncRenderingAttributes)asyncRenderingAttributesForAppLayout:(id)a3;
- (id)animationAttributesForLayoutElement:(id)a3;
- (id)appLayoutsToResignActive;
- (id)keyboardSuppressionMode;
@end

@implementation SBContinuousExposeDragAndDropToAppTransitionSwitcherModifier

- (id)animationAttributesForLayoutElement:(id)a3
{
  v9.receiver = self;
  v9.super_class = (Class)SBContinuousExposeDragAndDropToAppTransitionSwitcherModifier;
  v4 = [(SBTransitionSwitcherModifier *)&v9 animationAttributesForLayoutElement:a3];
  v5 = (void *)[v4 mutableCopy];

  v6 = [(SBContinuousExposeDragAndDropToAppTransitionSwitcherModifier *)self medusaSettings];
  v7 = [v6 resizeAnimationSettings];
  [v5 setLayoutSettings:v7];

  [v5 setUpdateMode:3];
  return v5;
}

- (id)appLayoutsToResignActive
{
  return (id)MEMORY[0x1E4F1CC08];
}

- (id)keyboardSuppressionMode
{
  return +[SBSwitcherKeyboardSuppressionMode suppressionModeNone];
}

- (SBSwitcherAsyncRenderingAttributes)asyncRenderingAttributesForAppLayout:(id)a3
{
  return (SBSwitcherAsyncRenderingAttributes)SBSwitcherAsyncRenderingAttributesMake(0, 0);
}

- (BOOL)shouldPerformCrossfadeForReduceMotion
{
  return 0;
}

@end