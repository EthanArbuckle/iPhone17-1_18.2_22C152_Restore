@interface FMTSAnomalyCongestion
- (NSDictionary)detailsAsDict;
- (id)description;
- (signed)type;
@end

@implementation FMTSAnomalyCongestion

- (signed)type
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
  v5.super_class = (Class)FMTSAnomalyCongestion;
  v2 = [(FMTSAnomaly *)&v5 description];
  v3 = +[NSString stringWithFormat:@"FMTSAnomalyCongestion: %@", v2];

  return v3;
}

@end