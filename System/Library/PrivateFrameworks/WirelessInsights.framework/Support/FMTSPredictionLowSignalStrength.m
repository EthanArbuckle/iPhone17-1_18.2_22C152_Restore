@interface FMTSPredictionLowSignalStrength
- (NSDictionary)detailsAsDict;
- (id)description;
- (signed)predictedAnomalyType;
@end

@implementation FMTSPredictionLowSignalStrength

- (signed)predictedAnomalyType
{
  return 3;
}

- (NSDictionary)detailsAsDict
{
  return (NSDictionary *)&__NSDictionary0__struct;
}

- (id)description
{
  v5.receiver = self;
  v5.super_class = (Class)FMTSPredictionLowSignalStrength;
  v2 = [(FMTSPrediction *)&v5 description];
  v3 = +[NSString stringWithFormat:@"FMTSPredictionLowSignalStrength: %@", v2];

  return v3;
}

@end