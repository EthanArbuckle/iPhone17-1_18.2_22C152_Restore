@interface CRFeatureSequenceRecognitionInfo
- (CRDetectedLineRegion)lineRegion;
- (double)bounds;
- (double)featureImageSize;
- (double)rotatedROI;
- (void)setLineRegion:(id)a3;
@end

@implementation CRFeatureSequenceRecognitionInfo

- (CRDetectedLineRegion)lineRegion
{
  return (CRDetectedLineRegion *)objc_getProperty(self, a2, 16, 1);
}

- (void)setLineRegion:(id)a3
{
}

- (double)bounds
{
  if (!a1) {
    return 0.0;
  }
  objc_copyStruct(&v2, (const void *)(a1 + 104), 32, 1, 0);
  return v2;
}

- (double)featureImageSize
{
  if (!a1) {
    return 0.0;
  }
  objc_copyStruct(&v2, (const void *)(a1 + 88), 16, 1, 0);
  return v2;
}

- (double)rotatedROI
{
  if (!a1) {
    return 0.0;
  }
  objc_copyStruct(&v2, (const void *)(a1 + 136), 32, 1, 0);
  return v2;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_transientDecodingResult, 0);
  objc_storeStrong((id *)&self->_recognizedTextRegion, 0);
  objc_storeStrong((id *)&self->_sequenceScriptOutputResult, 0);
  objc_storeStrong((id *)&self->_sequenceScriptCategory, 0);
  objc_storeStrong((id *)&self->_orientationOutputResult, 0);
  objc_storeStrong((id *)&self->_lineRegion, 0);
}

@end