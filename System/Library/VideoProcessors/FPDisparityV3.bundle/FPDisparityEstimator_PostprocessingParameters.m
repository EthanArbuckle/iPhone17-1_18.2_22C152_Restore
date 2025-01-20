@interface FPDisparityEstimator_PostprocessingParameters
- (float)calibrationMaxResidual1;
- (float)calibrationMaxResidual2;
- (float)shiftToDisparityRatio;
- (void)setCalibrationMaxResidual1:(float)a3;
- (void)setCalibrationMaxResidual2:(float)a3;
- (void)setShiftToDisparityRatio:(float)a3;
@end

@implementation FPDisparityEstimator_PostprocessingParameters

- (float)shiftToDisparityRatio
{
  return self->_shiftToDisparityRatio;
}

- (void)setShiftToDisparityRatio:(float)a3
{
  self->_shiftToDisparityRatio = a3;
}

- (float)calibrationMaxResidual1
{
  return self->_calibrationMaxResidual1;
}

- (void)setCalibrationMaxResidual1:(float)a3
{
  self->_calibrationMaxResidual1 = a3;
}

- (float)calibrationMaxResidual2
{
  return self->_calibrationMaxResidual2;
}

- (void)setCalibrationMaxResidual2:(float)a3
{
  self->_calibrationMaxResidual2 = a3;
}

@end