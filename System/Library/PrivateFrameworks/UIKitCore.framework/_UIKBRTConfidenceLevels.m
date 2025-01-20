@interface _UIKBRTConfidenceLevels
- (float)restConfidence;
- (float)touchConfidence;
- (void)setRestConfidence:(float)a3;
- (void)setTouchConfidence:(float)a3;
@end

@implementation _UIKBRTConfidenceLevels

- (float)touchConfidence
{
  return self->_touchConfidence;
}

- (void)setTouchConfidence:(float)a3
{
  self->_touchConfidence = a3;
}

- (float)restConfidence
{
  return self->_restConfidence;
}

- (void)setRestConfidence:(float)a3
{
  self->_restConfidence = a3;
}

@end