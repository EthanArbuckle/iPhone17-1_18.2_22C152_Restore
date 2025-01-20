@interface NTPBPersonalizationAggregate(FCPersonalizationAggregate)
- (double)_personalizationValueWithBaselineClicks:()FCPersonalizationAggregate baselineImpressions:decayRate:baselineClicksMultiplier:;
- (double)personalizationValueWithBaseline:()FCPersonalizationAggregate decayRate:baselineClicksMultiplier:;
- (double)personalizationValueWithCorrelatedAggregate:()FCPersonalizationAggregate baseline:decayRate:baselineClicksMultiplier:;
- (double)powerWithDecayFactor:()FCPersonalizationAggregate;
- (double)relativePersonalizationValueWithCorrelatedAggregate:()FCPersonalizationAggregate baseline:decayFactor:baselineClicksMultiplier:;
- (id)dictionaryRepresentation;
- (uint64_t)ctr;
- (uint64_t)lastModified;
- (uint64_t)personalizationValueWithBaseline:()FCPersonalizationAggregate decayRate:;
@end

@implementation NTPBPersonalizationAggregate(FCPersonalizationAggregate)

- (id)dictionaryRepresentation
{
  v12[5] = *MEMORY[0x1E4F143B8];
  v11[0] = @"clicks";
  v2 = NSNumber;
  [a1 clicks];
  v3 = objc_msgSend(v2, "numberWithDouble:");
  v12[0] = v3;
  v11[1] = @"impressions";
  v4 = NSNumber;
  [a1 impressions];
  v5 = objc_msgSend(v4, "numberWithDouble:");
  v12[1] = v5;
  v11[2] = @"eventCount";
  v6 = objc_msgSend(NSNumber, "numberWithUnsignedLongLong:", objc_msgSend(a1, "eventCount"));
  v12[2] = v6;
  v11[3] = @"timestamp";
  v7 = objc_msgSend(NSNumber, "numberWithUnsignedLongLong:", objc_msgSend(a1, "timestamp"));
  v12[3] = v7;
  v11[4] = @"featureKey";
  v8 = [a1 featureKey];
  v12[4] = v8;
  v9 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v12 forKeys:v11 count:5];

  return v9;
}

- (uint64_t)lastModified
{
  v1 = (void *)MEMORY[0x1E4F1C9C8];
  uint64_t v2 = [a1 timestamp];
  return objc_msgSend(v1, "fc_dateWithMillisecondTimeIntervalSince1970:", v2);
}

- (uint64_t)ctr
{
  return [a1 personalizationValueWithBaseline:0 decayRate:0.0];
}

- (uint64_t)personalizationValueWithBaseline:()FCPersonalizationAggregate decayRate:
{
  return objc_msgSend(a1, "personalizationValueWithBaseline:decayRate:baselineClicksMultiplier:", a3, 1.0);
}

- (double)personalizationValueWithBaseline:()FCPersonalizationAggregate decayRate:baselineClicksMultiplier:
{
  id v8 = a5;
  v9 = v8;
  if (v8)
  {
    [v8 clicks];
    double v11 = v10;
    [v9 impressions];
    [a1 _personalizationValueWithBaselineClicks:v11 baselineImpressions:v12 decayRate:a2 baselineClicksMultiplier:a3];
LABEL_5:
    double v14 = v13;
    goto LABEL_6;
  }
  [a1 impressions];
  double v14 = 0.0;
  if (v15 > 0.0)
  {
    [a1 clicks];
    double v17 = v16;
    [a1 impressions];
    FCClamp(v17 / v18, 0.0, 1.0);
    goto LABEL_5;
  }
LABEL_6:

  return v14;
}

- (double)personalizationValueWithCorrelatedAggregate:()FCPersonalizationAggregate baseline:decayRate:baselineClicksMultiplier:
{
  id v10 = a5;
  id v11 = a6;
  double v12 = v11;
  if (!v10)
  {
    v29 = a1;
    id v30 = v12;
LABEL_10:
    [v29 personalizationValueWithBaseline:v30 decayRate:(double)a2 baselineClicksMultiplier:a3];
    goto LABEL_11;
  }
  if (!v11)
  {
    v29 = a1;
    id v30 = v10;
    goto LABEL_10;
  }
  [v11 clicks];
  double v14 = 1.0;
  if (a3 > 0.0) {
    double v14 = a3;
  }
  double v15 = v14 * v13;
  [v12 impressions];
  double v16 = v15;
  if (v15 <= v17)
  {
    [v12 impressions];
    double v16 = v18;
  }
  [v10 impressions];
  double v20 = v19;
  [v10 impressions];
  double v22 = FCPersonalizationLinearImpressionCount(v21, a2);
  long double v23 = v20 + pow(a2, v22) * v16;
  [v10 clicks];
  double v25 = v24;
  [v10 impressions];
  double v27 = FCPersonalizationLinearImpressionCount(v26, a2);
  objc_msgSend(a1, "_personalizationValueWithBaselineClicks:baselineImpressions:decayRate:baselineClicksMultiplier:", (double)(v25 + pow(a2, v27) * v15), (double)v23, (double)a2, 1.0);
LABEL_11:
  double v31 = v28;

  return v31;
}

- (double)powerWithDecayFactor:()FCPersonalizationAggregate
{
  [a1 impressions];
  return (1.0 - a2) * v3;
}

- (double)relativePersonalizationValueWithCorrelatedAggregate:()FCPersonalizationAggregate baseline:decayFactor:baselineClicksMultiplier:
{
  id v10 = a6;
  [a1 personalizationValueWithCorrelatedAggregate:a5 baseline:v10 decayRate:a2 baselineClicksMultiplier:a3];
  double v12 = v11;
  [v10 personalizationValueWithBaseline:0 decayRate:a2];
  double v14 = v13;

  [a1 powerWithDecayFactor:a2];
  return (v12 - v14) * v15;
}

- (double)_personalizationValueWithBaselineClicks:()FCPersonalizationAggregate baselineImpressions:decayRate:baselineClicksMultiplier:
{
  double v7 = 1.0;
  if (a5 > 0.0) {
    double v7 = a5;
  }
  double v8 = v7 * a2;
  if (v7 * a2 <= a3) {
    double v9 = a3;
  }
  else {
    double v9 = v7 * a2;
  }
  [a1 clicks];
  double v11 = v10;
  [a1 impressions];
  double v13 = FCPersonalizationLinearImpressionCount(v12, a4);
  [a1 impressions];
  double v15 = v14;
  [a1 impressions];
  double v17 = FCPersonalizationLinearImpressionCount(v16, a4);
  double v18 = v15 + pow(a4, v17) * v9;
  if (v18 <= 0.0) {
    return 0.0;
  }
  double v19 = (v11 + pow(a4, v13) * v8) / v18;
  FCClamp(v19, 0.0, 1.0);
  return result;
}

@end