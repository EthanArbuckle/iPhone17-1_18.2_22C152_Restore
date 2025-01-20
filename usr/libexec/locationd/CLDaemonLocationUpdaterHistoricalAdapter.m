@interface CLDaemonLocationUpdaterHistoricalAdapter
- (BOOL)valid;
- (CLDaemonLocationUpdaterHistoricalAdapter)init;
- (void)invalidate;
- (void)setUpdater:(void *)a3;
- (void)setValid:(BOOL)a3;
- (void)updater;
@end

@implementation CLDaemonLocationUpdaterHistoricalAdapter

- (CLDaemonLocationUpdaterHistoricalAdapter)init
{
  v3.receiver = self;
  v3.super_class = (Class)CLDaemonLocationUpdaterHistoricalAdapter;
  result = [(CLDaemonLocationUpdaterHistoricalAdapter *)&v3 init];
  if (result) {
    result->_valid = 1;
  }
  return result;
}

- (void)invalidate
{
  self->_valid = 0;
}

- (BOOL)valid
{
  return self->_valid;
}

- (void)setValid:(BOOL)a3
{
  self->_valid = a3;
}

- (void)updater
{
  return self->_updater;
}

- (void)setUpdater:(void *)a3
{
  self->_updater = a3;
}

@end