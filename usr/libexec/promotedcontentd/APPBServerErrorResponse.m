@interface APPBServerErrorResponse
+ (id)options;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (unint64_t)hash;
@end

@implementation APPBServerErrorResponse

+ (id)options
{
  if (qword_100289B30 != -1) {
    dispatch_once(&qword_100289B30, &stru_100236198);
  }
  v2 = (void *)qword_100289B28;

  return v2;
}

- (id)description
{
  v7.receiver = self;
  v7.super_class = (Class)APPBServerErrorResponse;
  v3 = [(APPBServerErrorResponse *)&v7 description];
  v4 = [(APPBServerErrorResponse *)self dictionaryRepresentation];
  v5 = +[NSString stringWithFormat:@"%@ %@", v3, v4];

  return v5;
}

- (id)dictionaryRepresentation
{
  return +[NSMutableDictionary dictionary];
}

- (BOOL)readFrom:(id)a3
{
  return APPBServerErrorResponseReadFrom((uint64_t)self, (uint64_t)a3);
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