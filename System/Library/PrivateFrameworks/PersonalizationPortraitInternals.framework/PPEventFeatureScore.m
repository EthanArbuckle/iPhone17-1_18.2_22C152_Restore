@interface PPEventFeatureScore
+ (id)eventFeatureScoreWithFeatureValues:(id)a3 weightedScore:(double)a4 prominentFeature:(unint64_t)a5;
- (BOOL)isEqual:(id)a3;
- (BOOL)isEqualToEventFeatureScore:(id)a3;
- (NSArray)featureValues;
- (PPEventFeatureScore)initWithFeatureValues:(id)a3 weightedScore:(double)a4 prominentFeature:(unint64_t)a5;
- (double)weightedScore;
- (id)copyWithReplacementFeatureValues:(id)a3;
- (id)copyWithReplacementProminentFeature:(unint64_t)a3;
- (id)copyWithReplacementWeightedScore:(double)a3;
- (id)description;
- (unint64_t)_hash;
- (unint64_t)hash;
- (unint64_t)prominentFeature;
@end

@implementation PPEventFeatureScore

- (void).cxx_destruct
{
}

- (unint64_t)prominentFeature
{
  return self->_prominentFeature;
}

- (double)weightedScore
{
  return self->_weightedScore;
}

- (NSArray)featureValues
{
  return self->_featureValues;
}

- (id)description
{
  id v3 = [NSString alloc];
  featureValues = self->_featureValues;
  v5 = [NSNumber numberWithDouble:self->_weightedScore];
  v6 = [NSNumber numberWithUnsignedInteger:self->_prominentFeature];
  v7 = (void *)[v3 initWithFormat:@"<PPEventFeatureScore | featureValues:%@ weightedScore:%@ prominentFeature:%@>", featureValues, v5, v6];

  return v7;
}

- (unint64_t)hash
{
  return self->_ocnt_precomputedHash;
}

- (unint64_t)_hash
{
  uint64_t v3 = [(NSArray *)self->_featureValues hash];
  double weightedScore = self->_weightedScore;
  double v5 = -weightedScore;
  if (weightedScore >= 0.0) {
    double v5 = self->_weightedScore;
  }
  long double v6 = floor(v5 + 0.5);
  double v7 = (v5 - v6) * 1.84467441e19;
  unint64_t v8 = 2654435761u * (unint64_t)fmod(v6, 1.84467441e19);
  if (v7 >= 0.0)
  {
    if (v7 > 0.0) {
      v8 += (unint64_t)v7;
    }
  }
  else
  {
    v8 -= (unint64_t)fabs(v7);
  }
  return self->_prominentFeature - (v8 - v3 + 32 * v3) + 32 * (v8 - v3 + 32 * v3);
}

- (BOOL)isEqual:(id)a3
{
  v4 = (PPEventFeatureScore *)a3;
  double v5 = v4;
  if (v4 == self) {
    BOOL v6 = 1;
  }
  else {
    BOOL v6 = v4
  }
      && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0)
      && [(PPEventFeatureScore *)self isEqualToEventFeatureScore:v5];

  return v6;
}

- (BOOL)isEqualToEventFeatureScore:(id)a3
{
  id v4 = a3;
  double v5 = v4;
  if (!v4) {
    goto LABEL_7;
  }
  int v6 = self->_featureValues != 0;
  double v7 = [v4 featureValues];
  int v8 = v7 == 0;

  if (v6 == v8) {
    goto LABEL_7;
  }
  featureValues = self->_featureValues;
  if (featureValues)
  {
    v10 = [v5 featureValues];
    int v11 = [(NSArray *)featureValues isEqual:v10];

    if (!v11) {
      goto LABEL_7;
    }
  }
  objc_msgSend(v5, "weightedScore", self->_weightedScore);
  double weightedScore = self->_weightedScore;
  [v5 weightedScore];
  if (weightedScore == v13)
  {
    unint64_t prominentFeature = self->_prominentFeature;
    BOOL v14 = prominentFeature == [v5 prominentFeature];
  }
  else
  {
LABEL_7:
    BOOL v14 = 0;
  }

  return v14;
}

- (id)copyWithReplacementProminentFeature:(unint64_t)a3
{
  id v5 = objc_alloc((Class)objc_opt_class());
  featureValues = self->_featureValues;
  double weightedScore = self->_weightedScore;
  return (id)[v5 initWithFeatureValues:featureValues weightedScore:a3 prominentFeature:weightedScore];
}

- (id)copyWithReplacementWeightedScore:(double)a3
{
  id v5 = objc_alloc((Class)objc_opt_class());
  featureValues = self->_featureValues;
  unint64_t prominentFeature = self->_prominentFeature;
  return (id)[v5 initWithFeatureValues:featureValues weightedScore:prominentFeature prominentFeature:a3];
}

- (id)copyWithReplacementFeatureValues:(id)a3
{
  id v4 = a3;
  id v5 = (void *)[objc_alloc((Class)objc_opt_class()) initWithFeatureValues:v4 weightedScore:self->_prominentFeature prominentFeature:self->_weightedScore];

  return v5;
}

- (PPEventFeatureScore)initWithFeatureValues:(id)a3 weightedScore:(double)a4 prominentFeature:(unint64_t)a5
{
  id v10 = a3;
  if (!v10)
  {
    BOOL v14 = [MEMORY[0x1E4F28B00] currentHandler];
    [v14 handleFailureInMethod:a2, self, @"PPEventTuples.m", 146, @"Invalid parameter not satisfying: %@", @"featureValues != nil" object file lineNumber description];
  }
  v15.receiver = self;
  v15.super_class = (Class)PPEventFeatureScore;
  int v11 = [(PPEventFeatureScore *)&v15 init];
  v12 = v11;
  if (v11)
  {
    objc_storeStrong((id *)&v11->_featureValues, a3);
    v12->_double weightedScore = a4;
    v12->_unint64_t prominentFeature = a5;
    v12->_ocnt_precomputedHash = [(PPEventFeatureScore *)v12 _hash];
  }

  return v12;
}

+ (id)eventFeatureScoreWithFeatureValues:(id)a3 weightedScore:(double)a4 prominentFeature:(unint64_t)a5
{
  id v8 = a3;
  v9 = (void *)[objc_alloc((Class)a1) initWithFeatureValues:v8 weightedScore:a5 prominentFeature:a4];

  return v9;
}

@end