@interface FMTSPredictionOutOfService
- (NSDictionary)detailsAsDict;
- (id)description;
- (signed)predictedAnomalyType;
@end

@implementation FMTSPredictionOutOfService

- (signed)predictedAnomalyType
{
  return 1;
}

- (NSDictionary)detailsAsDict
{
  return (NSDictionary *)&__NSDictionary0__struct;
}

- (id)description
{
  v5.receiver = self;
  v5.super_class = (Class)FMTSPredictionOutOfService;
  v2 = [(FMTSPrediction *)&v5 description];
  v3 = +[NSString stringWithFormat:@"FMTSPredictionOutOfService: %@", v2];

  return v3;
}

@end