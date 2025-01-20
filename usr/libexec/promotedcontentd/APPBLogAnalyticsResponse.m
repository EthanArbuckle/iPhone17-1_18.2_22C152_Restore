@interface APPBLogAnalyticsResponse
+ (id)options;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (unint64_t)hash;
@end

@implementation APPBLogAnalyticsResponse

+ (id)options
{
  if (qword_1002898F0 != -1) {
    dispatch_once(&qword_1002898F0, &stru_1002355C0);
  }
  v2 = (void *)qword_1002898E8;

  return v2;
}

- (id)description
{
  v7.receiver = self;
  v7.super_class = (Class)APPBLogAnalyticsResponse;
  v3 = [(APPBLogAnalyticsResponse *)&v7 description];
  v4 = [(APPBLogAnalyticsResponse *)self dictionaryRepresentation];
  v5 = +[NSString stringWithFormat:@"%@ %@", v3, v4];

  return v5;
}

- (id)dictionaryRepresentation
{
  return +[NSMutableDictionary dictionary];
}

- (BOOL)readFrom:(id)a3
{
  return APPBLogAnalyticsResponseReadFrom((uint64_t)self, (uint64_t)a3);
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