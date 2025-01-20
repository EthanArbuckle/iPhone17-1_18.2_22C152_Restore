@interface STCallingStatusDomainPublisher
+ (id)emptyData;
+ (unint64_t)statusDomainName;
@end

@implementation STCallingStatusDomainPublisher

+ (unint64_t)statusDomainName
{
  return 3;
}

+ (id)emptyData
{
  v2 = objc_alloc_init(STCallingStatusDomainData);

  return v2;
}

@end