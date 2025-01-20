@interface CLLoiLocationProviderRoutineAdapter
- (BOOL)valid;
- (CLLoiLocationProviderRoutineAdapter)initWithLoiLocationProvider:(void *)a3;
- (void)onVisit:(id)a3;
- (void)setValid:(BOOL)a3;
@end

@implementation CLLoiLocationProviderRoutineAdapter

- (CLLoiLocationProviderRoutineAdapter)initWithLoiLocationProvider:(void *)a3
{
  v5.receiver = self;
  v5.super_class = (Class)CLLoiLocationProviderRoutineAdapter;
  result = [(CLLoiLocationProviderRoutineAdapter *)&v5 init];
  if (result)
  {
    result->_loiLocationProvider = a3;
    result->_valid = a3 != 0;
  }
  return result;
}

- (void)onVisit:(id)a3
{
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