@interface APPBLogAdEventResponse
+ (id)options;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (unint64_t)hash;
@end

@implementation APPBLogAdEventResponse

+ (id)options
{
  if (qword_100289748 != -1) {
    dispatch_once(&qword_100289748, &stru_100234CC0);
  }
  v2 = (void *)qword_100289740;

  return v2;
}

- (id)description
{
  v7.receiver = self;
  v7.super_class = (Class)APPBLogAdEventResponse;
  v3 = [(APPBLogAdEventResponse *)&v7 description];
  v4 = [(APPBLogAdEventResponse *)self dictionaryRepresentation];
  v5 = +[NSString stringWithFormat:@"%@ %@", v3, v4];

  return v5;
}

- (id)dictionaryRepresentation
{
  return +[NSMutableDictionary dictionary];
}

- (BOOL)readFrom:(id)a3
{
  return APPBLogAdEventResponseReadFrom((uint64_t)self, (uint64_t)a3);
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