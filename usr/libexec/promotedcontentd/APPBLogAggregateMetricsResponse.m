@interface APPBLogAggregateMetricsResponse
+ (id)options;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (unint64_t)hash;
@end

@implementation APPBLogAggregateMetricsResponse

+ (id)options
{
  if (qword_1002897A8 != -1) {
    dispatch_once(&qword_1002897A8, &stru_100234EB0);
  }
  v2 = (void *)qword_1002897A0;

  return v2;
}

- (id)description
{
  v7.receiver = self;
  v7.super_class = (Class)APPBLogAggregateMetricsResponse;
  v3 = [(APPBLogAggregateMetricsResponse *)&v7 description];
  v4 = [(APPBLogAggregateMetricsResponse *)self dictionaryRepresentation];
  v5 = +[NSString stringWithFormat:@"%@ %@", v3, v4];

  return v5;
}

- (id)dictionaryRepresentation
{
  return +[NSMutableDictionary dictionary];
}

- (BOOL)readFrom:(id)a3
{
  return APPBLogAggregateMetricsResponseReadFrom((uint64_t)self, (uint64_t)a3);
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v3 = [(id)objc_opt_class() allocWithZone:a3];

  return [v3 init];
}

- (BOOL)isEqual:(id)a3
{
  id v3 = a3;
  unsigned __int8 v4 = [v3 isMemberOfClass:objc_opt_class()];

  return v4;
}

- (unint64_t)hash
{
  return 0;
}

@end