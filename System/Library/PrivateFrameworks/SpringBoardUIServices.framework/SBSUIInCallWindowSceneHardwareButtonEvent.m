@interface SBSUIInCallWindowSceneHardwareButtonEvent
- (SBSUIInCallWindowSceneHardwareButtonEvent)initWithButtonEventType:(int64_t)a3;
- (int64_t)buttonEventType;
@end

@implementation SBSUIInCallWindowSceneHardwareButtonEvent

- (SBSUIInCallWindowSceneHardwareButtonEvent)initWithButtonEventType:(int64_t)a3
{
  v5.receiver = self;
  v5.super_class = (Class)SBSUIInCallWindowSceneHardwareButtonEvent;
  result = [(SBSUIInCallWindowSceneHardwareButtonEvent *)&v5 init];
  if (result) {
    result->_buttonEventType = a3;
  }
  return result;
}

- (int64_t)buttonEventType
{
  return self->_buttonEventType;
}

@end