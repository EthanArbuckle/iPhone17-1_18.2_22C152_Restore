@interface SBSlideOverEdgeProtectTongueSwitcherModifierEvent
- (BOOL)isTonguePresented;
- (SBSlideOverEdgeProtectTongueSwitcherModifierEvent)initWithTonguePresented:(BOOL)a3 edge:(unint64_t)a4;
- (id)copyWithZone:(_NSZone *)a3;
- (int64_t)type;
- (unint64_t)edge;
@end

@implementation SBSlideOverEdgeProtectTongueSwitcherModifierEvent

- (SBSlideOverEdgeProtectTongueSwitcherModifierEvent)initWithTonguePresented:(BOOL)a3 edge:(unint64_t)a4
{
  v7.receiver = self;
  v7.super_class = (Class)SBSlideOverEdgeProtectTongueSwitcherModifierEvent;
  result = [(SBSlideOverEdgeProtectTongueSwitcherModifierEvent *)&v7 init];
  if (result)
  {
    result->_tonguePresented = a3;
    result->_edge = a4;
  }
  return result;
}

- (int64_t)type
{
  return 26;
}

- (id)copyWithZone:(_NSZone *)a3
{
  v4 = [SBSlideOverEdgeProtectTongueSwitcherModifierEvent alloc];
  BOOL tonguePresented = self->_tonguePresented;
  unint64_t edge = self->_edge;
  return [(SBSlideOverEdgeProtectTongueSwitcherModifierEvent *)v4 initWithTonguePresented:tonguePresented edge:edge];
}

- (BOOL)isTonguePresented
{
  return self->_tonguePresented;
}

- (unint64_t)edge
{
  return self->_edge;
}

@end