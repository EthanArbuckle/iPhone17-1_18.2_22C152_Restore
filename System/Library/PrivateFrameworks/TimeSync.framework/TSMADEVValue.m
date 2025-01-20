@interface TSMADEVValue
- (TSMADEVValue)initWithObservationInterval:(double)a3 andMADEV:(double)a4;
- (double)madev;
- (double)observationInterval;
- (id)description;
@end

@implementation TSMADEVValue

- (TSMADEVValue)initWithObservationInterval:(double)a3 andMADEV:(double)a4
{
  v7.receiver = self;
  v7.super_class = (Class)TSMADEVValue;
  result = [(TSMADEVValue *)&v7 init];
  if (result)
  {
    result->_observationInterval = a3;
    result->_madev = a4;
  }
  return result;
}

- (id)description
{
  v3 = NSString;
  v4 = (objc_class *)objc_opt_class();
  v5 = NSStringFromClass(v4);
  [(TSMADEVValue *)self observationInterval];
  uint64_t v7 = v6;
  [(TSMADEVValue *)self madev];
  v9 = [v3 stringWithFormat:@"<%@: %p: {%.3f,%.9f}>", v5, self, v7, v8];

  return v9;
}

- (double)observationInterval
{
  return self->_observationInterval;
}

- (double)madev
{
  return self->_madev;
}

@end