@interface CLKalmanFilterEstimates
- (BOOL)isMeasurement;
- (CLKalmanFilterEstimates)init;
- (CMMatrix<float,)fCovariance;
- (CMVector<float,)fState;
- (double)timestamp;
- (float)F01;
- (void)setF01:(float)a3;
- (void)setFCovariance:()CMMatrix<float;
- (void)setFState:()CMVector<float;
- (void)setIsMeasurement:(BOOL)a3;
- (void)setTimestamp:(double)a3;
@end

@implementation CLKalmanFilterEstimates

- (CLKalmanFilterEstimates)init
{
  v3.receiver = self;
  v3.super_class = (Class)CLKalmanFilterEstimates;
  result = [(CLKalmanFilterEstimates *)&v3 init];
  if (result)
  {
    *(void *)result->_fCovariance.fData = 0;
    *(void *)&result->_fCovariance.fData[2] = 0;
    result->_fState = 0;
    result->_timestamp = 1.79769313e308;
    result->_isMeasurement = 0;
    result->_F01 = 3.4028e38;
  }
  return result;
}

- (CMVector<float,)fState
{
  float v2 = self->_fState.elements[0];
  float v3 = self->_fState.elements[1];
  result.elements[1] = v3;
  result.elements[0] = v2;
  return result;
}

- (void)setFState:()CMVector<float
{
  self->_fState = a3;
}

- (CMMatrix<float,)fCovariance
{
  float v2 = self->_fCovariance.fData[0];
  float v3 = self->_fCovariance.fData[1];
  float v4 = self->_fCovariance.fData[2];
  float v5 = self->_fCovariance.fData[3];
  result.fData[3] = v5;
  result.fData[2] = v4;
  result.fData[1] = v3;
  result.fData[0] = v2;
  return result;
}

- (void)setFCovariance:()CMMatrix<float
{
  self->_fCovariance = a3;
}

- (double)timestamp
{
  return self->_timestamp;
}

- (void)setTimestamp:(double)a3
{
  self->_timestamp = a3;
}

- (BOOL)isMeasurement
{
  return self->_isMeasurement;
}

- (void)setIsMeasurement:(BOOL)a3
{
  self->_isMeasurement = a3;
}

- (float)F01
{
  return self->_F01;
}

- (void)setF01:(float)a3
{
  self->_F01 = a3;
}

@end