@interface SMCMNoMovementStateUpdateNotification
- (SMCMNoMovementStateUpdate)state;
- (void)setState:(id)a3;
@end

@implementation SMCMNoMovementStateUpdateNotification

- (SMCMNoMovementStateUpdate)state
{
  return self->_state;
}

- (void)setState:(id)a3
{
}

- (void).cxx_destruct
{
}

@end