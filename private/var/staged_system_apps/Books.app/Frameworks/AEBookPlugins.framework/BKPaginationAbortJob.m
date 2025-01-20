@interface BKPaginationAbortJob
+ (id)jobName;
- (BKPaginationAbortJob)init;
@end

@implementation BKPaginationAbortJob

+ (id)jobName
{
  return @"Abort-Previous";
}

- (BKPaginationAbortJob)init
{
  v6.receiver = self;
  v6.super_class = (Class)BKPaginationAbortJob;
  v2 = [(BKJob *)&v6 init];
  v3 = v2;
  if (v2)
  {
    [(BKJob *)v2 setSentinel:1];
    v4 = +[BKPaginationAbortJob jobName];
    [(BKJob *)v3 setName:v4];
  }
  return v3;
}

@end