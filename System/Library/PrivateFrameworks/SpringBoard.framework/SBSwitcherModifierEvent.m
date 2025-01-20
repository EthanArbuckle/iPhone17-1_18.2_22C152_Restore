@interface SBSwitcherModifierEvent
- (BOOL)isGestureEvent;
- (BOOL)isIndirectPanGestureEvent;
- (BOOL)isTransitionEvent;
- (BOOL)isWindowDragGestureEvent;
- (id)descriptionBuilderWithMultilinePrefix:(id)a3;
- (int64_t)type;
@end

@implementation SBSwitcherModifierEvent

- (BOOL)isGestureEvent
{
  return 0;
}

- (BOOL)isTransitionEvent
{
  return 0;
}

- (id)descriptionBuilderWithMultilinePrefix:(id)a3
{
  v7.receiver = self;
  v7.super_class = (Class)SBSwitcherModifierEvent;
  v4 = [(SBChainableModifierEvent *)&v7 descriptionBuilderWithMultilinePrefix:a3];
  v5 = NSStringFromSBSwitcherModifierEventType([(SBSwitcherModifierEvent *)self type]);
  [v4 appendString:v5 withName:@"type"];

  return v4;
}

- (BOOL)isWindowDragGestureEvent
{
  return 0;
}

- (BOOL)isIndirectPanGestureEvent
{
  return 0;
}

- (int64_t)type
{
  return 0;
}

@end