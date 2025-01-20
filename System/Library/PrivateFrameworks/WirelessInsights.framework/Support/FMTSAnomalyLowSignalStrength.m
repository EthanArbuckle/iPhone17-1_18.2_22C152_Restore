@interface FMTSAnomalyLowSignalStrength
- (NSDictionary)detailsAsDict;
- (id)description;
- (signed)type;
@end

@implementation FMTSAnomalyLowSignalStrength

- (signed)type
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
  v5.super_class = (Class)FMTSAnomalyLowSignalStrength;
  v2 = [(FMTSAnomaly *)&v5 description];
  v3 = +[NSString stringWithFormat:@"FMTSAnomalyLowSignalStrength: %@", v2];

  return v3;
}

@end