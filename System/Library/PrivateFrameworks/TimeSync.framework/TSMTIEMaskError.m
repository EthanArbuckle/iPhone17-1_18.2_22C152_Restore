@interface TSMTIEMaskError
- (double)mask;
- (double)mtie;
- (double)observationInterval;
- (id)description;
- (void)setMask:(double)a3;
- (void)setMtie:(double)a3;
- (void)setObservationInterval:(double)a3;
@end

@implementation TSMTIEMaskError

- (id)description
{
  v3 = NSString;
  v4 = (objc_class *)objc_opt_class();
  v5 = NSStringFromClass(v4);
  [(TSMTIEMaskError *)self observationInterval];
  uint64_t v7 = v6;
  [(TSMTIEMaskError *)self mask];
  uint64_t v9 = v8;
  [(TSMTIEMaskError *)self mtie];
  v11 = [v3 stringWithFormat:@"<%@: %p: {%.9f,%.9f,%0.9f}>", v5, self, v7, v9, v10];

  return v11;
}

- (double)observationInterval
{
  return self->_observationInterval;
}

- (void)setObservationInterval:(double)a3
{
  self->_observationInterval = a3;
}

- (double)mask
{
  return self->_mask;
}

- (void)setMask:(double)a3
{
  self->_mask = a3;
}

- (double)mtie
{
  return self->_mtie;
}

- (void)setMtie:(double)a3
{
  self->_mtie = a3;
}

@end