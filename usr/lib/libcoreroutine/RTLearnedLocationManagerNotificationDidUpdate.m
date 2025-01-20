@interface RTLearnedLocationManagerNotificationDidUpdate
- (RTLearnedLocationManagerNotificationDidUpdate)initWithIntervalSinceLastUpdate:(double)a3;
- (double)intervalSinceLastUpdate;
- (id)description;
- (void)setIntervalSinceLastUpdate:(double)a3;
@end

@implementation RTLearnedLocationManagerNotificationDidUpdate

- (RTLearnedLocationManagerNotificationDidUpdate)initWithIntervalSinceLastUpdate:(double)a3
{
  v5.receiver = self;
  v5.super_class = (Class)RTLearnedLocationManagerNotificationDidUpdate;
  result = [(RTNotification *)&v5 init];
  if (result) {
    result->_intervalSinceLastUpdate = a3;
  }
  return result;
}

- (id)description
{
  v2 = NSString;
  [(RTLearnedLocationManagerNotificationDidUpdate *)self intervalSinceLastUpdate];
  return (id)[v2 stringWithFormat:@"intervalSinceLastUpdate, %.2f", v3];
}

- (double)intervalSinceLastUpdate
{
  return self->_intervalSinceLastUpdate;
}

- (void)setIntervalSinceLastUpdate:(double)a3
{
  self->_intervalSinceLastUpdate = a3;
}

@end