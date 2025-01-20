@interface CRDetectedRecognizedRegionPair
- (CRDetectedLineRegion)detectedLineRegion;
- (CRDetectedRecognizedRegionPair)initWithDetectedRegion:(id)a3 recognizedRegions:(id)a4;
- (NSArray)recognizedTextRegions;
- (void)setDetectedLineRegion:(id)a3;
- (void)setRecognizedTextRegions:(id)a3;
@end

@implementation CRDetectedRecognizedRegionPair

- (CRDetectedRecognizedRegionPair)initWithDetectedRegion:(id)a3 recognizedRegions:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v11.receiver = self;
  v11.super_class = (Class)CRDetectedRecognizedRegionPair;
  v8 = [(CRDetectedRecognizedRegionPair *)&v11 init];
  v9 = v8;
  if (v8)
  {
    [(CRDetectedRecognizedRegionPair *)v8 setDetectedLineRegion:v6];
    [(CRDetectedRecognizedRegionPair *)v9 setRecognizedTextRegions:v7];
  }

  return v9;
}

- (CRDetectedLineRegion)detectedLineRegion
{
  return (CRDetectedLineRegion *)objc_getProperty(self, a2, 8, 1);
}

- (void)setDetectedLineRegion:(id)a3
{
}

- (NSArray)recognizedTextRegions
{
  return (NSArray *)objc_getProperty(self, a2, 16, 1);
}

- (void)setRecognizedTextRegions:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_recognizedTextRegions, 0);
  objc_storeStrong((id *)&self->_detectedLineRegion, 0);
}

@end