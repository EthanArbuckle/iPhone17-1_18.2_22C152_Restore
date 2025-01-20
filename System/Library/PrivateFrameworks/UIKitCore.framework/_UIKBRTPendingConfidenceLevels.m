@interface _UIKBRTPendingConfidenceLevels
- (float)confidenceCheckTimeout;
- (void)setConfidenceCheckTimeout:(float)a3;
@end

@implementation _UIKBRTPendingConfidenceLevels

- (float)confidenceCheckTimeout
{
  return self->_confidenceCheckTimeout;
}

- (void)setConfidenceCheckTimeout:(float)a3
{
  self->_confidenceCheckTimeout = a3;
}

@end