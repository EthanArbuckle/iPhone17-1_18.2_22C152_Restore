@interface PDTimeCondition
- (BOOL)hasDelay;
- (BOOL)hasTriggerEvent;
- (PDTimeCondition)init;
- (id)description;
- (id)target;
- (int)delay;
- (int)triggerEvent;
- (int)writeDelay;
- (void)setDelay:(int)a3;
- (void)setTarget:(id)a3;
- (void)setTriggerEvent:(int)a3;
@end

@implementation PDTimeCondition

- (PDTimeCondition)init
{
  v3.receiver = self;
  v3.super_class = (Class)PDTimeCondition;
  return [(PDTimeCondition *)&v3 init];
}

- (void)setDelay:(int)a3
{
  self->mDelay = a3;
  self->mHasDelay = 1;
}

- (void)setTriggerEvent:(int)a3
{
  self->mHasTriggerEvent = 1;
  self->mTriggerEvent = a3;
}

- (void)setTarget:(id)a3
{
}

- (BOOL)hasDelay
{
  return self->mHasDelay;
}

- (int)delay
{
  if (self->mDelay == -1) {
    return 0;
  }
  else {
    return self->mDelay;
  }
}

- (BOOL)hasTriggerEvent
{
  return self->mHasTriggerEvent;
}

- (int)triggerEvent
{
  return self->mTriggerEvent;
}

- (id)target
{
  return self->mTarget;
}

- (id)description
{
  v4.receiver = self;
  v4.super_class = (Class)PDTimeCondition;
  v2 = [(PDTimeCondition *)&v4 description];
  return v2;
}

- (void).cxx_destruct
{
}

- (int)writeDelay
{
  return self->mDelay;
}

@end