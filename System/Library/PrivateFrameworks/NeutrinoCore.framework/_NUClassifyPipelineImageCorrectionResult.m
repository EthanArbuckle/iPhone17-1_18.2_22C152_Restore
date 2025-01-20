@interface _NUClassifyPipelineImageCorrectionResult
- (float)confidence;
- (void)setConfidence:(float)a3;
@end

@implementation _NUClassifyPipelineImageCorrectionResult

- (void)setConfidence:(float)a3
{
  self->_confidence = a3;
}

- (float)confidence
{
  return self->_confidence;
}

@end