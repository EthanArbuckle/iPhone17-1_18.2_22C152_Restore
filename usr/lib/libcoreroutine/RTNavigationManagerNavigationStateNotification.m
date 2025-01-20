@interface RTNavigationManagerNavigationStateNotification
- (RTNavigationManagerNavigationStateNotification)initWithNavigationState:(int)a3;
- (int)state;
@end

@implementation RTNavigationManagerNavigationStateNotification

- (RTNavigationManagerNavigationStateNotification)initWithNavigationState:(int)a3
{
  v5.receiver = self;
  v5.super_class = (Class)RTNavigationManagerNavigationStateNotification;
  result = [(RTNotification *)&v5 init];
  if (result) {
    result->_state = a3;
  }
  return result;
}

- (int)state
{
  return self->_state;
}

@end