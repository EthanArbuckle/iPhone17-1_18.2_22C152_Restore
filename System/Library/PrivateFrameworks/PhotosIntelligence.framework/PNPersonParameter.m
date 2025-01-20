@interface PNPersonParameter
- (BOOL)isValid;
- (NSString)name;
- (PNPersonParameter)init;
- (double)endValue;
- (double)incrementValue;
- (double)startValue;
- (id)description;
- (void)setEndValue:(double)a3;
- (void)setIncrementValue:(double)a3;
- (void)setName:(id)a3;
- (void)setStartValue:(double)a3;
@end

@implementation PNPersonParameter

- (void).cxx_destruct
{
}

- (void)setIncrementValue:(double)a3
{
  self->_incrementValue = a3;
}

- (double)incrementValue
{
  return self->_incrementValue;
}

- (void)setEndValue:(double)a3
{
  self->_endValue = a3;
}

- (double)endValue
{
  return self->_endValue;
}

- (void)setStartValue:(double)a3
{
  self->_startValue = a3;
}

- (double)startValue
{
  return self->_startValue;
}

- (void)setName:(id)a3
{
}

- (NSString)name
{
  return self->_name;
}

- (id)description
{
  v3 = NSString;
  v4 = [(PNPersonParameter *)self name];
  [(PNPersonParameter *)self startValue];
  uint64_t v6 = v5;
  [(PNPersonParameter *)self endValue];
  uint64_t v8 = v7;
  [(PNPersonParameter *)self incrementValue];
  v10 = [v3 stringWithFormat:@"Parameter name: '%@', start: %lf, end: %lf, increment: %lf", v4, v6, v8, v9];

  return v10;
}

- (BOOL)isValid
{
  v3 = [(PNPersonParameter *)self name];
  if (!v3
    || ([(PNPersonParameter *)self startValue], v4 == 1.79769313e308)
    || ([(PNPersonParameter *)self endValue], v5 == 1.79769313e308))
  {
    BOOL v7 = 0;
  }
  else
  {
    [(PNPersonParameter *)self incrementValue];
    BOOL v7 = v6 != 1.79769313e308;
  }

  return v7;
}

- (PNPersonParameter)init
{
  v6.receiver = self;
  v6.super_class = (Class)PNPersonParameter;
  v2 = [(PNPersonParameter *)&v6 init];
  v3 = v2;
  if (v2)
  {
    name = v2->_name;
    v2->_name = 0;

    *(int64x2_t *)&v3->_startValue = vdupq_n_s64(0x7FEFFFFFFFFFFFFFuLL);
    v3->_incrementValue = 1.79769313e308;
  }
  return v3;
}

@end