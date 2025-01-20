@interface CRLatinLowConfidenceTextFeatureFilterV2
- (BOOL)shouldFilterRegion:(id)a3;
- (BOOL)shouldFilterRegionBasedOnGeometry:(id)a3 closestDistance:(double)a4;
@end

@implementation CRLatinLowConfidenceTextFeatureFilterV2

- (BOOL)shouldFilterRegion:(id)a3
{
  id v3 = a3;
  [v3 activationProbability];
  double v5 = v4;
  v6 = [v3 text];
  uint64_t v7 = [v6 length];

  if (v7 == 1 && v5 < 0.65) {
    goto LABEL_9;
  }
  v8 = [v3 text];
  uint64_t v9 = [v8 length];

  if (v9 == 2 && v5 < 0.5) {
    goto LABEL_9;
  }
  v10 = [v3 text];
  uint64_t v11 = [v10 length];

  if (v11 == 3 && v5 < 0.35) {
    goto LABEL_9;
  }
  v12 = [v3 text];
  uint64_t v13 = [v12 length];

  if (v13 == 4 && v5 < 0.2)
  {
LABEL_9:
    BOOL v14 = 1;
  }
  else
  {
    v16 = [v3 text];
    unint64_t v17 = [v16 length];
    BOOL v14 = v5 < 0.1 && v17 > 4;
  }
  return v14;
}

- (BOOL)shouldFilterRegionBasedOnGeometry:(id)a3 closestDistance:(double)a4
{
  id v5 = a3;
  if (![v5 isIsolatedClosestRegionDistance:a4]) {
    goto LABEL_10;
  }
  v6 = [v5 firstTextRegion];
  uint64_t v7 = [v6 text];
  objc_opt_class();
  double v8 = 1.0;
  if (objc_opt_isKindOfClass())
  {
    [v6 activationProbability];
    double v8 = v9;
  }
  if ([v7 length] != 1 || v8 >= 0.75)
  {
    uint64_t v10 = [v7 length];

    if (v10 == 2 && v8 < 0.5) {
      goto LABEL_9;
    }
LABEL_10:
    BOOL v11 = 0;
    goto LABEL_11;
  }

LABEL_9:
  BOOL v11 = 1;
LABEL_11:

  return v11;
}

@end