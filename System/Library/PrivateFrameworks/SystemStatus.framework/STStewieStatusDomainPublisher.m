@interface STStewieStatusDomainPublisher
+ (id)emptyData;
+ (unint64_t)statusDomainName;
@end

@implementation STStewieStatusDomainPublisher

+ (unint64_t)statusDomainName
{
  return 8;
}

+ (id)emptyData
{
  v2 = objc_alloc_init(STStewieStatusDomainData);

  return v2;
}

@end