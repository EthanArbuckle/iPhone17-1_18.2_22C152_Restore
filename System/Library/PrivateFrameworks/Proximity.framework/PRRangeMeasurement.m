@interface PRRangeMeasurement
+ (BOOL)supportsSecureCoding;
+ (PRRangeMeasurement)measurementWithRange:(double)a3 uncertainty:(double)a4;
- (BOOL)isEqual:(id)a3;
- (PRRangeMeasurement)initWithCoder:(id)a3;
- (PRRangeMeasurement)initWithRange:(double)a3 uncertainty:(double)a4;
- (double)measurement;
- (double)uncertainty;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (void)encodeWithCoder:(id)a3;
@end

@implementation PRRangeMeasurement

- (PRRangeMeasurement)initWithRange:(double)a3 uncertainty:(double)a4
{
  v7.receiver = self;
  v7.super_class = (Class)PRRangeMeasurement;
  result = [(PRRangeMeasurement *)&v7 init];
  if (result)
  {
    result->_measurement = a3;
    result->_uncertainty = a4;
  }
  return result;
}

+ (PRRangeMeasurement)measurementWithRange:(double)a3 uncertainty:(double)a4
{
  v4 = [[PRRangeMeasurement alloc] initWithRange:a3 uncertainty:a4];
  return v4;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (PRRangeMeasurement)initWithCoder:(id)a3
{
  id v4 = a3;
  [v4 decodeDoubleForKey:@"RangeMeasurement"];
  double v6 = v5;
  [v4 decodeDoubleForKey:@"RangeUncertainty"];
  double v8 = v7;

  return [(PRRangeMeasurement *)self initWithRange:v6 uncertainty:v8];
}

- (void)encodeWithCoder:(id)a3
{
  double measurement = self->_measurement;
  id v5 = a3;
  [v5 encodeDouble:@"RangeMeasurement" forKey:measurement];
  [v5 encodeDouble:@"RangeUncertainty" forKey:self->_uncertainty];
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v4 = [PRRangeMeasurement alloc];
  double measurement = self->_measurement;
  double uncertainty = self->_uncertainty;
  return [(PRRangeMeasurement *)v4 initWithRange:measurement uncertainty:uncertainty];
}

- (id)description
{
  return (id)[NSString stringWithFormat:@"measurement: %f m, uncertainty: %f m", *(void *)&self->_measurement, *(void *)&self->_uncertainty];
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v5 = v4;
    [(PRRangeMeasurement *)self measurement];
    double v7 = v6;
    [v5 measurement];
    if (v7 == v8)
    {
      [(PRRangeMeasurement *)self uncertainty];
      double v10 = v9;
      [v5 uncertainty];
      BOOL v12 = v10 == v11;
    }
    else
    {
      BOOL v12 = 0;
    }
  }
  else
  {
    BOOL v12 = 0;
  }

  return v12;
}

- (double)measurement
{
  return self->_measurement;
}

- (double)uncertainty
{
  return self->_uncertainty;
}

@end