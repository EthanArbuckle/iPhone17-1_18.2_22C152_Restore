@interface SBRepositionProgressSwitcherModifierEvent
- (SBRepositionProgressSwitcherModifierEvent)initWithProgress:(double)a3;
- (double)progress;
- (id)copyWithZone:(_NSZone *)a3;
- (int64_t)type;
@end

@implementation SBRepositionProgressSwitcherModifierEvent

- (SBRepositionProgressSwitcherModifierEvent)initWithProgress:(double)a3
{
  v5.receiver = self;
  v5.super_class = (Class)SBRepositionProgressSwitcherModifierEvent;
  result = [(SBRepositionProgressSwitcherModifierEvent *)&v5 init];
  if (result) {
    result->_progress = a3;
  }
  return result;
}

- (int64_t)type
{
  return 23;
}

- (id)copyWithZone:(_NSZone *)a3
{
  v4 = [SBRepositionProgressSwitcherModifierEvent alloc];
  double progress = self->_progress;
  return [(SBRepositionProgressSwitcherModifierEvent *)v4 initWithProgress:progress];
}

- (double)progress
{
  return self->_progress;
}

@end