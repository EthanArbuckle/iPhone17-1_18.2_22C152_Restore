@interface CLDaemonInUseAssertionAdapter
- (BOOL)valid;
- (CLDaemonInUseAssertionAdapter)init;
- (void)dealloc;
- (void)setValid:(BOOL)a3;
@end

@implementation CLDaemonInUseAssertionAdapter

- (BOOL)valid
{
  return self->_valid;
}

- (CLDaemonInUseAssertionAdapter)init
{
  v3.receiver = self;
  v3.super_class = (Class)CLDaemonInUseAssertionAdapter;
  result = [(CLDaemonInUseAssertionAdapter *)&v3 init];
  if (result) {
    result->_valid = 1;
  }
  return result;
}

- (void)dealloc
{
  if (self->_valid) {
    sub_101A94918();
  }
  v2.receiver = self;
  v2.super_class = (Class)CLDaemonInUseAssertionAdapter;
  [(CLDaemonInUseAssertionAdapter *)&v2 dealloc];
}

- (void)setValid:(BOOL)a3
{
  self->_valid = a3;
}

@end