@interface SBIndirectPanGestureSwitcherModifierEvent
- (BOOL)isIndirectPanGestureEvent;
- (id)copyWithZone:(_NSZone *)a3;
- (int64_t)type;
- (unint64_t)indirectPanEndReason;
- (void)setIndirectPanEndReason:(unint64_t)a3;
@end

@implementation SBIndirectPanGestureSwitcherModifierEvent

- (int64_t)type
{
  return 5;
}

- (id)copyWithZone:(_NSZone *)a3
{
  v5.receiver = self;
  v5.super_class = (Class)SBIndirectPanGestureSwitcherModifierEvent;
  id result = [(SBGestureSwitcherModifierEvent *)&v5 copyWithZone:a3];
  *((void *)result + 19) = self->_indirectPanEndReason;
  return result;
}

- (BOOL)isIndirectPanGestureEvent
{
  return 1;
}

- (unint64_t)indirectPanEndReason
{
  return self->_indirectPanEndReason;
}

- (void)setIndirectPanEndReason:(unint64_t)a3
{
  self->_indirectPanEndReason = a3;
}

@end