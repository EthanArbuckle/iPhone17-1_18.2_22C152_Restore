@interface FPDisparityEstimator_CostLevelParameters
- (float)lambda;
- (float)lambda_background;
- (float)lambda_foreground;
- (float)step;
- (float)stepLowlight;
- (void)setLambda:(float)a3;
- (void)setLambda_background:(float)a3;
- (void)setLambda_foreground:(float)a3;
- (void)setStep:(float)a3;
- (void)setStepLowlight:(float)a3;
@end

@implementation FPDisparityEstimator_CostLevelParameters

- (float)step
{
  return self->_step;
}

- (void)setStep:(float)a3
{
  self->_step = a3;
}

- (float)stepLowlight
{
  return self->_stepLowlight;
}

- (void)setStepLowlight:(float)a3
{
  self->_stepLowlight = a3;
}

- (float)lambda
{
  return self->_lambda;
}

- (void)setLambda:(float)a3
{
  self->_lambda = a3;
}

- (float)lambda_foreground
{
  return self->_lambda_foreground;
}

- (void)setLambda_foreground:(float)a3
{
  self->_lambda_foreground = a3;
}

- (float)lambda_background
{
  return self->_lambda_background;
}

- (void)setLambda_background:(float)a3
{
  self->_lambda_background = a3;
}

@end