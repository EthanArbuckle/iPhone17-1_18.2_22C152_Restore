@interface SBSUIInCallWindowSceneDeviceLockEvent
- (SBSUIInCallWindowSceneDeviceLockEvent)initWithSourceType:(int64_t)a3;
- (int64_t)sourceType;
@end

@implementation SBSUIInCallWindowSceneDeviceLockEvent

- (SBSUIInCallWindowSceneDeviceLockEvent)initWithSourceType:(int64_t)a3
{
  v5.receiver = self;
  v5.super_class = (Class)SBSUIInCallWindowSceneDeviceLockEvent;
  result = [(SBSUIInCallWindowSceneDeviceLockEvent *)&v5 init];
  if (result) {
    result->_sourceType = a3;
  }
  return result;
}

- (int64_t)sourceType
{
  return self->_sourceType;
}

@end