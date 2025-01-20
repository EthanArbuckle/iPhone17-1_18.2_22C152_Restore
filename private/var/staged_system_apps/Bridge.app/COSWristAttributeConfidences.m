@interface COSWristAttributeConfidences
- (COSWristAttributeConfidences)initWithObservationTime:(double)a3;
- (COSWristAttributeConfidences)initWithObservationTime:(double)a3 none:(double)a4 invalid:(double)a5 lr:(double)a6 ll:(double)a7 rr:(double)a8 rl:(double)a9 palm:(double)a10 dock:(double)a11;
- (double)dock;
- (double)invalid;
- (double)leftWristLeftCrown;
- (double)leftWristRightCrown;
- (double)none;
- (double)observationTime;
- (double)palm;
- (double)rightWristLeftCrown;
- (double)rightWristRightCrown;
- (id)description;
- (void)addConfidences:(id)a3;
- (void)divideConfidencesBy:(int64_t)a3;
@end

@implementation COSWristAttributeConfidences

- (COSWristAttributeConfidences)initWithObservationTime:(double)a3 none:(double)a4 invalid:(double)a5 lr:(double)a6 ll:(double)a7 rr:(double)a8 rl:(double)a9 palm:(double)a10 dock:(double)a11
{
  v20.receiver = self;
  v20.super_class = (Class)COSWristAttributeConfidences;
  result = [(COSWristAttributeConfidences *)&v20 init];
  if (result)
  {
    result->_observationTime = a3;
    result->_none = a4;
    result->_invalid = a5;
    result->_leftWristRightCrown = a6;
    result->_leftWristLeftCrown = a7;
    result->_rightWristRightCrown = a8;
    result->_rightWristLeftCrown = a9;
    result->_palm = a10;
    result->_dock = a11;
  }
  return result;
}

- (COSWristAttributeConfidences)initWithObservationTime:(double)a3
{
  v5.receiver = self;
  v5.super_class = (Class)COSWristAttributeConfidences;
  result = [(COSWristAttributeConfidences *)&v5 init];
  if (result) {
    result->_observationTime = a3;
  }
  return result;
}

- (void)addConfidences:(id)a3
{
  id v4 = a3;
  [v4 none];
  self->_none = v5 + self->_none;
  [v4 invalid];
  self->_invalid = v6 + self->_invalid;
  [v4 leftWristRightCrown];
  self->_leftWristRightCrown = v7 + self->_leftWristRightCrown;
  [v4 leftWristLeftCrown];
  self->_leftWristLeftCrown = v8 + self->_leftWristLeftCrown;
  [v4 rightWristRightCrown];
  self->_rightWristRightCrown = v9 + self->_rightWristRightCrown;
  [v4 rightWristLeftCrown];
  self->_rightWristLeftCrown = v10;
  [v4 palm];
  self->_palm = v11 + self->_palm;
  [v4 dock];
  double v13 = v12;

  self->_dock = v13 + self->_dock;
}

- (void)divideConfidencesBy:(int64_t)a3
{
  if (a3)
  {
    float64x2_t v3 = (float64x2_t)vdupq_lane_s64(COERCE__INT64((double)a3), 0);
    float64x2_t v4 = vdivq_f64(*(float64x2_t *)&self->_leftWristRightCrown, v3);
    *(float64x2_t *)&self->_none = vdivq_f64(*(float64x2_t *)&self->_none, v3);
    *(float64x2_t *)&self->_leftWristRightCrown = v4;
    float64x2_t v5 = vdivq_f64(*(float64x2_t *)&self->_rightWristRightCrown, v3);
    float64x2_t v6 = vdivq_f64(*(float64x2_t *)&self->_palm, v3);
    *(float64x2_t *)&self->_rightWristRightCrown = v5;
    *(float64x2_t *)&self->_palm = v6;
  }
}

- (id)description
{
  return +[NSString stringWithFormat:@"n:%.4f i:%.4f lr:%.4f ll:%.4f rr:%.4f rl:%.4f p:%.4f d:%.4f", *(void *)&self->_none, *(void *)&self->_invalid, *(void *)&self->_leftWristRightCrown, *(void *)&self->_leftWristLeftCrown, *(void *)&self->_rightWristRightCrown, *(void *)&self->_rightWristLeftCrown, *(void *)&self->_palm, *(void *)&self->_dock];
}

- (double)observationTime
{
  return self->_observationTime;
}

- (double)none
{
  return self->_none;
}

- (double)invalid
{
  return self->_invalid;
}

- (double)leftWristRightCrown
{
  return self->_leftWristRightCrown;
}

- (double)leftWristLeftCrown
{
  return self->_leftWristLeftCrown;
}

- (double)rightWristRightCrown
{
  return self->_rightWristRightCrown;
}

- (double)rightWristLeftCrown
{
  return self->_rightWristLeftCrown;
}

- (double)palm
{
  return self->_palm;
}

- (double)dock
{
  return self->_dock;
}

@end