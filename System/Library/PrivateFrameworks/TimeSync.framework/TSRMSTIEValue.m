@interface TSRMSTIEValue
- (TSRMSTIEValue)initWithObservationInterval:(double)a3 andRMSTIE:(double)a4;
- (double)observationInterval;
- (double)rmstie;
- (id)description;
@end

@implementation TSRMSTIEValue

- (TSRMSTIEValue)initWithObservationInterval:(double)a3 andRMSTIE:(double)a4
{
  v7.receiver = self;
  v7.super_class = (Class)TSRMSTIEValue;
  result = [(TSRMSTIEValue *)&v7 init];
  if (result)
  {
    result->_observationInterval = a3;
    result->_rmstie = a4;
  }
  return result;
}

- (id)description
{
  v3 = NSString;
  v4 = (objc_class *)objc_opt_class();
  v5 = NSStringFromClass(v4);
  [(TSRMSTIEValue *)self observationInterval];
  uint64_t v7 = v6;
  [(TSRMSTIEValue *)self rmstie];
  v9 = [v3 stringWithFormat:@"<%@: %p: {%.3f,%.9f}>", v5, self, v7, v8];

  return v9;
}

- (double)observationInterval
{
  return self->_observationInterval;
}

- (double)rmstie
{
  return self->_rmstie;
}

@end