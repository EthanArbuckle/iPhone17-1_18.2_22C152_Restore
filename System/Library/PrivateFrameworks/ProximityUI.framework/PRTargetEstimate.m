@interface PRTargetEstimate
+ (PRTargetEstimate)targetEstimateWithTime:(double)a3 vector:(float)a4 uncertainty:(float)a5 weight:(BOOL)a6 isResolved:(unint64_t)a7 verticalState:;
- (BOOL)isVerticalResolved;
- (PRTargetEstimate)initWithTime:(double)a3 vector:(float)a4 uncertainty:(float)a5 weight:(BOOL)a6 isResolved:(unint64_t)a7 verticalState:;
- (__n128)vector;
- (double)timestamp;
- (float)uncertainty;
- (float)weight;
- (unint64_t)verticalState;
@end

@implementation PRTargetEstimate

+ (PRTargetEstimate)targetEstimateWithTime:(double)a3 vector:(float)a4 uncertainty:(float)a5 weight:(BOOL)a6 isResolved:(unint64_t)a7 verticalState:
{
  BOOL v9 = a6;
  int v10 = v7;
  double v18 = *(double *)&a4;
  v13 = [PRTargetEstimate alloc];
  *(float *)&double v14 = a5;
  LODWORD(v15) = v10;
  v16 = [(PRTargetEstimate *)v13 initWithTime:v9 vector:a7 uncertainty:a3 weight:v18 isResolved:v14 verticalState:v15];
  return v16;
}

- (PRTargetEstimate)initWithTime:(double)a3 vector:(float)a4 uncertainty:(float)a5 weight:(BOOL)a6 isResolved:(unint64_t)a7 verticalState:
{
  float v10 = v7;
  long long v14 = *(_OWORD *)&a4;
  v15.receiver = self;
  v15.super_class = (Class)PRTargetEstimate;
  result = [(PRTargetEstimate *)&v15 init];
  if (result)
  {
    result->_timestamp = a3;
    *(_OWORD *)result->_vector = v14;
    result->_uncertainty = a5;
    result->_weight = v10;
    result->_isVerticalResolved = a6;
    result->_verticalState = a7;
  }
  return result;
}

- (double)timestamp
{
  return self->_timestamp;
}

- (__n128)vector
{
  return a1[3];
}

- (float)uncertainty
{
  return self->_uncertainty;
}

- (float)weight
{
  return self->_weight;
}

- (BOOL)isVerticalResolved
{
  return self->_isVerticalResolved;
}

- (unint64_t)verticalState
{
  return self->_verticalState;
}

@end