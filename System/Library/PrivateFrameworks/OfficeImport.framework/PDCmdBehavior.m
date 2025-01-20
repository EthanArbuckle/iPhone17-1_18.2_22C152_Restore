@interface PDCmdBehavior
- (BOOL)hasBehaviorType;
- (int)behaviorType;
- (void)setBehaviorType:(int)a3;
@end

@implementation PDCmdBehavior

- (BOOL)hasBehaviorType
{
  return self->mHasBehaviorType;
}

- (int)behaviorType
{
  return self->mBehaviorType;
}

- (void)setBehaviorType:(int)a3
{
  self->mHasBehaviorType = 1;
  self->mBehaviorType = a3;
}

@end