@interface TVL1_v3_SolverParameters
- (float)a_checkerboard;
- (float)b_checkerboard;
- (float)huber_eps;
- (float)sigma;
- (float)tau;
- (float)theta;
- (int)iterations;
- (int)warpings;
- (void)setA_checkerboard:(float)a3;
- (void)setB_checkerboard:(float)a3;
- (void)setHuber_eps:(float)a3;
- (void)setIterations:(int)a3;
- (void)setSigma:(float)a3;
- (void)setTau:(float)a3;
- (void)setTheta:(float)a3;
- (void)setWarpings:(int)a3;
@end

@implementation TVL1_v3_SolverParameters

- (float)tau
{
  return self->_tau;
}

- (void)setTau:(float)a3
{
  self->_tau = a3;
}

- (float)sigma
{
  return self->_sigma;
}

- (void)setSigma:(float)a3
{
  self->_sigma = a3;
}

- (float)theta
{
  return self->_theta;
}

- (void)setTheta:(float)a3
{
  self->_theta = a3;
}

- (float)huber_eps
{
  return self->_huber_eps;
}

- (void)setHuber_eps:(float)a3
{
  self->_huber_eps = a3;
}

- (int)warpings
{
  return self->_warpings;
}

- (void)setWarpings:(int)a3
{
  self->_warpings = a3;
}

- (int)iterations
{
  return self->_iterations;
}

- (void)setIterations:(int)a3
{
  self->_iterations = a3;
}

- (float)a_checkerboard
{
  return self->_a_checkerboard;
}

- (void)setA_checkerboard:(float)a3
{
  self->_a_checkerboard = a3;
}

- (float)b_checkerboard
{
  return self->_b_checkerboard;
}

- (void)setB_checkerboard:(float)a3
{
  self->_b_checkerboard = a3;
}

@end