@interface APPBLogSubscriptionEventResponse
+ (id)options;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (unint64_t)hash;
@end

@implementation APPBLogSubscriptionEventResponse

+ (id)options
{
  if (qword_100289940 != -1) {
    dispatch_once(&qword_100289940, &stru_100235660);
  }
  v2 = (void *)qword_100289938;

  return v2;
}

- (id)description
{
  v7.receiver = self;
  v7.super_class = (Class)APPBLogSubscriptionEventResponse;
  v3 = [(APPBLogSubscriptionEventResponse *)&v7 description];
  v4 = [(APPBLogSubscriptionEventResponse *)self dictionaryRepresentation];
  v5 = +[NSString stringWithFormat:@"%@ %@", v3, v4];

  return v5;
}

- (id)dictionaryRepresentation
{
  return +[NSMutableDictionary dictionary];
}

- (BOOL)readFrom:(id)a3
{
  return APPBLogSubscriptionEventResponseReadFrom((uint64_t)self, (uint64_t)a3);
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