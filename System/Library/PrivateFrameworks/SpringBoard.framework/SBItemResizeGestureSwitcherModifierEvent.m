@interface SBItemResizeGestureSwitcherModifierEvent
- (id)copyWithZone:(_NSZone *)a3;
- (int64_t)selectedLayoutRole;
- (int64_t)type;
- (unint64_t)selectedEdge;
- (void)setSelectedEdge:(unint64_t)a3;
- (void)setSelectedLayoutRole:(int64_t)a3;
@end

@implementation SBItemResizeGestureSwitcherModifierEvent

- (int64_t)type
{
  return 31;
}

- (id)copyWithZone:(_NSZone *)a3
{
  v5.receiver = self;
  v5.super_class = (Class)SBItemResizeGestureSwitcherModifierEvent;
  id result = [(SBGestureSwitcherModifierEvent *)&v5 copyWithZone:a3];
  *((void *)result + 19) = self->_selectedLayoutRole;
  *((void *)result + 20) = self->_selectedEdge;
  return result;
}

- (int64_t)selectedLayoutRole
{
  return self->_selectedLayoutRole;
}

- (void)setSelectedLayoutRole:(int64_t)a3
{
  self->_selectedLayoutRole = a3;
}

- (unint64_t)selectedEdge
{
  return self->_selectedEdge;
}

- (void)setSelectedEdge:(unint64_t)a3
{
  self->_selectedEdge = a3;
}

@end