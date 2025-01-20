@interface ICContainersRequest
+ (id)requestWithDatabaseID:(unsigned int)a3;
- (ICContainersRequest)initWithDatabaseID:(unsigned int)a3;
- (double)timeoutInterval;
@end

@implementation ICContainersRequest

+ (id)requestWithDatabaseID:(unsigned int)a3
{
  id v3 = [objc_alloc((Class)objc_opt_class()) initWithDatabaseID:*(void *)&a3];

  return v3;
}

- (double)timeoutInterval
{
  return 180.0;
}

- (ICContainersRequest)initWithDatabaseID:(unsigned int)a3
{
  v4 = +[NSString stringWithFormat:@"databases/%u/containers", *(void *)&a3];
  v5 = [(ICDRequest *)self initWithAction:v4];

  return v5;
}

@end