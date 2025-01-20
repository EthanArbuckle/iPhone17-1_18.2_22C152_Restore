@interface TAPrivateVehicleClassificationReason
- (BOOL)isEqual:(id)a3;
- (TAPrivateVehicleClassificationReason)initWithReason:(unint64_t)a3;
- (unint64_t)hash;
- (unint64_t)reason;
@end

@implementation TAPrivateVehicleClassificationReason

- (TAPrivateVehicleClassificationReason)initWithReason:(unint64_t)a3
{
  v5.receiver = self;
  v5.super_class = (Class)TAPrivateVehicleClassificationReason;
  result = [(TAPrivateVehicleClassificationReason *)&v5 init];
  result->_reason = a3;
  return result;
}

- (unint64_t)hash
{
  v2 = [NSNumber numberWithUnsignedInteger:self->_reason];
  unint64_t v3 = [v2 hash];

  return v3;
}

- (BOOL)isEqual:(id)a3
{
  v4 = (TAPrivateVehicleClassificationReason *)a3;
  if (self == v4)
  {
    BOOL v8 = 1;
  }
  else
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      objc_super v5 = v4;
      unint64_t v6 = [(TAPrivateVehicleClassificationReason *)self reason];
      uint64_t v7 = [(TAPrivateVehicleClassificationReason *)v5 reason];

      BOOL v8 = v6 == v7;
    }
    else
    {
      BOOL v8 = 0;
    }
  }

  return v8;
}

- (unint64_t)reason
{
  return self->_reason;
}

@end