@interface FMTSPredictionCongestion
- (NSDictionary)detailsAsDict;
- (id)description;
- (signed)predictedAnomalyType;
@end

@implementation FMTSPredictionCongestion

- (signed)predictedAnomalyType
{
  return 2;
}

- (NSDictionary)detailsAsDict
{
  return (NSDictionary *)&__NSDictionary0__struct;
}

- (id)description
{
  v5.receiver = self;
  v5.super_class = (Class)FMTSPredictionCongestion;
  v2 = [(FMTSPrediction *)&v5 description];
  v3 = +[NSString stringWithFormat:@"FMTSPredictionCongestion: %@", v2];

  return v3;
}

@end