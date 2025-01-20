@interface SBBlurProgressSwitcherModifierEvent
- (SBBlurProgressSwitcherModifierEvent)initWithProgress:(double)a3;
- (double)progress;
- (id)copyWithZone:(_NSZone *)a3;
- (int64_t)type;
@end

@implementation SBBlurProgressSwitcherModifierEvent

- (SBBlurProgressSwitcherModifierEvent)initWithProgress:(double)a3
{
  v5.receiver = self;
  v5.super_class = (Class)SBBlurProgressSwitcherModifierEvent;
  result = [(SBBlurProgressSwitcherModifierEvent *)&v5 init];
  if (result) {
    result->_progress = a3;
  }
  return result;
}

- (int64_t)type
{
  return 22;
}

- (id)copyWithZone:(_NSZone *)a3
{
  v4 = [SBBlurProgressSwitcherModifierEvent alloc];
  double progress = self->_progress;
  return [(SBBlurProgressSwitcherModifierEvent *)v4 initWithProgress:progress];
}

- (double)progress
{
  return self->_progress;
}

@end