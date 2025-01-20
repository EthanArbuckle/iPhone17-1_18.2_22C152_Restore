@interface FMTSAnomalyOutOfService
- (NSDictionary)detailsAsDict;
- (id)description;
- (signed)type;
@end

@implementation FMTSAnomalyOutOfService

- (signed)type
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
  v5.super_class = (Class)FMTSAnomalyOutOfService;
  v2 = [(FMTSAnomaly *)&v5 description];
  v3 = +[NSString stringWithFormat:@"FMTSAnomalyOutOfService: %@", v2];

  return v3;
}

@end