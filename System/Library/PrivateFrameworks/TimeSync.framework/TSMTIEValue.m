@interface TSMTIEValue
- (TSMTIEValue)initWithObservationInterval:(double)a3 andMTIE:(double)a4;
- (double)mtie;
- (double)observationInterval;
- (id)description;
@end

@implementation TSMTIEValue

- (TSMTIEValue)initWithObservationInterval:(double)a3 andMTIE:(double)a4
{
  v7.receiver = self;
  v7.super_class = (Class)TSMTIEValue;
  result = [(TSMTIEValue *)&v7 init];
  if (result)
  {
    result->_observationInterval = a3;
    result->_mtie = a4;
  }
  return result;
}

- (id)description
{
  v3 = NSString;
  v4 = (objc_class *)objc_opt_class();
  v5 = NSStringFromClass(v4);
  [(TSMTIEValue *)self observationInterval];
  uint64_t v7 = v6;
  [(TSMTIEValue *)self mtie];
  v9 = [v3 stringWithFormat:@"<%@: %p: {%.9f,%.9f}>", v5, self, v7, v8];

  return v9;
}

- (double)observationInterval
{
  return self->_observationInterval;
}

- (double)mtie
{
  return self->_mtie;
}

@end