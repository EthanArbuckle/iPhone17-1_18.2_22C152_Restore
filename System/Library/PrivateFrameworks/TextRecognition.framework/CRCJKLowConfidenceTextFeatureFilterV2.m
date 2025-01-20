@interface CRCJKLowConfidenceTextFeatureFilterV2
- (BOOL)shouldFilterRegion:(id)a3;
- (BOOL)shouldFilterRegionBasedOnGeometry:(id)a3 closestDistance:(double)a4;
- (CRCJKLowConfidenceTextFeatureFilterV2)initWithLowConfidenceThresholdFor1CharLines:(double)a3 for2PlusCharLines:(double)a4 forIsolated1CharLines:(double)a5;
- (double)lowConfidenceThreshold1CharLines;
- (double)lowConfidenceThreshold2PlusCharLines;
- (double)lowConfidenceThresholdIsolated1CharLines;
@end

@implementation CRCJKLowConfidenceTextFeatureFilterV2

- (CRCJKLowConfidenceTextFeatureFilterV2)initWithLowConfidenceThresholdFor1CharLines:(double)a3 for2PlusCharLines:(double)a4 forIsolated1CharLines:(double)a5
{
  v9.receiver = self;
  v9.super_class = (Class)CRCJKLowConfidenceTextFeatureFilterV2;
  result = [(CRCJKLowConfidenceTextFeatureFilterV2 *)&v9 init];
  if (result)
  {
    result->_lowConfidenceThreshold1CharLines = a3;
    result->_lowConfidenceThreshold2PlusCharLines = a4;
    result->_lowConfidenceThresholdIsolated1CharLines = a5;
  }
  return result;
}

- (BOOL)shouldFilterRegion:(id)a3
{
  id v4 = a3;
  [v4 activationProbability];
  double v6 = v5;
  v7 = [v4 text];

  if ([v7 length] == 1)
  {
    [(CRCJKLowConfidenceTextFeatureFilterV2 *)self lowConfidenceThreshold1CharLines];
    double v9 = v8;

    if (v6 < v9) {
      return 1;
    }
  }
  else
  {
  }
  [(CRCJKLowConfidenceTextFeatureFilterV2 *)self lowConfidenceThreshold2PlusCharLines];
  return v6 < v11;
}

- (BOOL)shouldFilterRegionBasedOnGeometry:(id)a3 closestDistance:(double)a4
{
  id v6 = a3;
  if ([v6 isIsolatedClosestRegionDistance:a4])
  {
    v7 = [v6 firstTextRegion];
    double v8 = [v7 text];

    double v9 = [v6 firstTextRegion];
    objc_opt_class();
    double v10 = 1.0;
    if (objc_opt_isKindOfClass())
    {
      double v11 = [v6 firstTextRegion];
      [v11 activationProbability];
      double v10 = v12;
    }
    BOOL v14 = 0;
    if ([v8 length] == 1)
    {
      [(CRCJKLowConfidenceTextFeatureFilterV2 *)self lowConfidenceThresholdIsolated1CharLines];
      if (v10 < v13) {
        BOOL v14 = 1;
      }
    }
  }
  else
  {
    BOOL v14 = 0;
  }

  return v14;
}

- (double)lowConfidenceThreshold1CharLines
{
  return self->_lowConfidenceThreshold1CharLines;
}

- (double)lowConfidenceThreshold2PlusCharLines
{
  return self->_lowConfidenceThreshold2PlusCharLines;
}

- (double)lowConfidenceThresholdIsolated1CharLines
{
  return self->_lowConfidenceThresholdIsolated1CharLines;
}

@end