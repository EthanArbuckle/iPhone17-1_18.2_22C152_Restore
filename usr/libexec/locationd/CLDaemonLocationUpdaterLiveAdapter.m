@interface CLDaemonLocationUpdaterLiveAdapter
- (BOOL)valid;
- (CLDaemonLocationUpdaterLiveAdapter)init;
- (void)dealloc;
- (void)invalidate;
- (void)setValid:(BOOL)a3;
@end

@implementation CLDaemonLocationUpdaterLiveAdapter

- (CLDaemonLocationUpdaterLiveAdapter)init
{
  v3.receiver = self;
  v3.super_class = (Class)CLDaemonLocationUpdaterLiveAdapter;
  result = [(CLDaemonLocationUpdaterLiveAdapter *)&v3 init];
  if (result) {
    result->_valid = 1;
  }
  return result;
}

- (void)invalidate
{
  self->_valid = 0;
}

- (void)dealloc
{
  self->_valid = 0;
  v2.receiver = self;
  v2.super_class = (Class)CLDaemonLocationUpdaterLiveAdapter;
  [(CLDaemonLocationUpdaterLiveAdapter *)&v2 dealloc];
}

- (BOOL)valid
{
  return self->_valid;
}

- (void)setValid:(BOOL)a3
{
  self->_valid = a3;
}

@end