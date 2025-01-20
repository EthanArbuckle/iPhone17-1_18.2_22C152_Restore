@interface CLSmootherMonitorRoutineAdapter
- (BOOL)valid;
- (CLSmootherMonitorRoutineAdapter)init;
- (void)invalidate;
- (void)setValid:(BOOL)a3;
@end

@implementation CLSmootherMonitorRoutineAdapter

- (CLSmootherMonitorRoutineAdapter)init
{
  v3.receiver = self;
  v3.super_class = (Class)CLSmootherMonitorRoutineAdapter;
  result = [(CLSmootherMonitorRoutineAdapter *)&v3 init];
  if (result) {
    result->_valid = 1;
  }
  else {
    MEMORY[8] = 0;
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

@end