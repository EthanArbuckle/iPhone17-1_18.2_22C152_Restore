@interface SBResizeProgressSwitcherModifierEvent
- (SBResizeProgressSwitcherModifierEvent)initWithProgress:(double)a3;
- (double)progress;
- (id)copyWithZone:(_NSZone *)a3;
- (int64_t)type;
@end

@implementation SBResizeProgressSwitcherModifierEvent

- (SBResizeProgressSwitcherModifierEvent)initWithProgress:(double)a3
{
  v5.receiver = self;
  v5.super_class = (Class)SBResizeProgressSwitcherModifierEvent;
  result = [(SBResizeProgressSwitcherModifierEvent *)&v5 init];
  if (result) {
    result->_progress = a3;
  }
  return result;
}

- (int64_t)type
{
  return 21;
}

- (id)copyWithZone:(_NSZone *)a3
{
  v4 = [SBResizeProgressSwitcherModifierEvent alloc];
  double progress = self->_progress;
  return [(SBResizeProgressSwitcherModifierEvent *)v4 initWithProgress:progress];
}

- (double)progress
{
  return self->_progress;
}

@end