@interface SBHoverSwitcherModifierEvent
- (CGPoint)position;
- (SBHoverSwitcherModifierEvent)initWithPhase:(unint64_t)a3 position:(CGPoint)a4;
- (id)copyWithZone:(_NSZone *)a3;
- (id)descriptionBuilderWithMultilinePrefix:(id)a3;
- (int64_t)type;
- (unint64_t)phase;
@end

@implementation SBHoverSwitcherModifierEvent

- (SBHoverSwitcherModifierEvent)initWithPhase:(unint64_t)a3 position:(CGPoint)a4
{
  CGFloat y = a4.y;
  CGFloat x = a4.x;
  v8.receiver = self;
  v8.super_class = (Class)SBHoverSwitcherModifierEvent;
  result = [(SBHoverSwitcherModifierEvent *)&v8 init];
  if (result)
  {
    result->_phase = a3;
    result->_position.CGFloat x = x;
    result->_position.CGFloat y = y;
  }
  return result;
}

- (int64_t)type
{
  return 32;
}

- (id)copyWithZone:(_NSZone *)a3
{
  v5.receiver = self;
  v5.super_class = (Class)SBHoverSwitcherModifierEvent;
  id result = [(SBChainableModifierEvent *)&v5 copyWithZone:a3];
  *((void *)result + 3) = self->_phase;
  *((_OWORD *)result + 2) = self->_position;
  return result;
}

- (id)descriptionBuilderWithMultilinePrefix:(id)a3
{
  v11.receiver = self;
  v11.super_class = (Class)SBHoverSwitcherModifierEvent;
  v4 = [(SBSwitcherModifierEvent *)&v11 descriptionBuilderWithMultilinePrefix:a3];
  objc_super v5 = v4;
  unint64_t phase = self->_phase;
  v7 = @"Hovering";
  if (phase == 1) {
    v7 = @"EndHovering";
  }
  if (phase == 2) {
    objc_super v8 = @"CancelHovering";
  }
  else {
    objc_super v8 = v7;
  }
  [v4 appendString:v8 withName:@"phase"];
  id v9 = (id)objc_msgSend(v5, "appendPoint:withName:", @"position", self->_position.x, self->_position.y);
  return v5;
}

- (unint64_t)phase
{
  return self->_phase;
}

- (CGPoint)position
{
  double x = self->_position.x;
  double y = self->_position.y;
  result.double y = y;
  result.double x = x;
  return result;
}

@end