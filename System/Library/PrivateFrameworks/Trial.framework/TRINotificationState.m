@interface TRINotificationState
- (TRINotificationState)initWithToken:(int)a3;
- (int)token;
@end

@implementation TRINotificationState

- (TRINotificationState)initWithToken:(int)a3
{
  v5.receiver = self;
  v5.super_class = (Class)TRINotificationState;
  result = [(TRINotificationState *)&v5 init];
  if (result) {
    result->_token = a3;
  }
  return result;
}

- (int)token
{
  return self->_token;
}

@end