@interface CLBarometricAltimeterAdapter
- (BOOL)valid;
- (CLBarometricAltimeterAdapter)initWithBarometricAltimeter:(void *)a3;
- (void)onVisit:(id)a3;
- (void)setValid:(BOOL)a3;
@end

@implementation CLBarometricAltimeterAdapter

- (CLBarometricAltimeterAdapter)initWithBarometricAltimeter:(void *)a3
{
  v6.receiver = self;
  v6.super_class = (Class)CLBarometricAltimeterAdapter;
  result = [(CLBarometricAltimeterAdapter *)&v6 init];
  BOOL v5 = 0;
  if (a3 && result)
  {
    result->_barometricAltimeter = a3;
    BOOL v5 = 1;
  }
  result->_valid = v5;
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