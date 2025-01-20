@interface PREstimatorInput
- (PRRoseSolution)proximity;
- (__n128)rotation;
- (__n128)setRotation:(__n128 *)result;
- (__n128)translation;
- (double)priorTimestamp;
- (double)subsequentTimestamp;
- (double)timestamp;
- (void)setPriorTimestamp:(double)a3;
- (void)setProximity:(id)a3;
- (void)setSubsequentTimestamp:(double)a3;
- (void)setTimestamp:(double)a3;
- (void)setTranslation:(PREstimatorInput *)self;
@end

@implementation PREstimatorInput

- (double)timestamp
{
  return self->_timestamp;
}

- (void)setTimestamp:(double)a3
{
  self->_timestamp = a3;
}

- (double)priorTimestamp
{
  return self->_priorTimestamp;
}

- (void)setPriorTimestamp:(double)a3
{
  self->_priorTimestamp = a3;
}

- (double)subsequentTimestamp
{
  return self->_subsequentTimestamp;
}

- (void)setSubsequentTimestamp:(double)a3
{
  self->_subsequentTimestamp = a3;
}

- (__n128)rotation
{
  return a1[3];
}

- (__n128)setRotation:(__n128 *)result
{
  result[3] = a2;
  return result;
}

- (__n128)translation
{
  return a1[4];
}

- (void)setTranslation:(PREstimatorInput *)self
{
  *(_OWORD *)self->_translation = v2;
}

- (PRRoseSolution)proximity
{
  return self->_proximity;
}

- (void)setProximity:(id)a3
{
}

- (void).cxx_destruct
{
}

@end