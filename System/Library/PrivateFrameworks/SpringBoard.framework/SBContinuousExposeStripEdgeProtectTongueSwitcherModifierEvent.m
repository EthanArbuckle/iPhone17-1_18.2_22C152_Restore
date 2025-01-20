@interface SBContinuousExposeStripEdgeProtectTongueSwitcherModifierEvent
- (BOOL)isTonguePresented;
- (SBContinuousExposeStripEdgeProtectTongueSwitcherModifierEvent)initWithTonguePresented:(BOOL)a3;
- (id)copyWithZone:(_NSZone *)a3;
- (int64_t)type;
@end

@implementation SBContinuousExposeStripEdgeProtectTongueSwitcherModifierEvent

- (SBContinuousExposeStripEdgeProtectTongueSwitcherModifierEvent)initWithTonguePresented:(BOOL)a3
{
  v5.receiver = self;
  v5.super_class = (Class)SBContinuousExposeStripEdgeProtectTongueSwitcherModifierEvent;
  result = [(SBContinuousExposeStripEdgeProtectTongueSwitcherModifierEvent *)&v5 init];
  if (result) {
    result->_tonguePresented = a3;
  }
  return result;
}

- (int64_t)type
{
  return 35;
}

- (id)copyWithZone:(_NSZone *)a3
{
  v4 = [SBContinuousExposeStripEdgeProtectTongueSwitcherModifierEvent alloc];
  BOOL tonguePresented = self->_tonguePresented;
  return [(SBContinuousExposeStripEdgeProtectTongueSwitcherModifierEvent *)v4 initWithTonguePresented:tonguePresented];
}

- (BOOL)isTonguePresented
{
  return self->_tonguePresented;
}

@end