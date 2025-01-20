@interface STPlaygroundsStatusDomainPublisher
+ (id)emptyData;
+ (unint64_t)statusDomainName;
@end

@implementation STPlaygroundsStatusDomainPublisher

+ (unint64_t)statusDomainName
{
  return 7;
}

+ (id)emptyData
{
  v2 = objc_alloc_init(STPlaygroundsStatusDomainData);

  return v2;
}

@end