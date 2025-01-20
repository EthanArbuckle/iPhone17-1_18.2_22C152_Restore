@interface STStatusBarDataAdditionsStatusDomainPublisher
+ (id)emptyData;
+ (unint64_t)statusDomainName;
@end

@implementation STStatusBarDataAdditionsStatusDomainPublisher

+ (unint64_t)statusDomainName
{
  return 12;
}

+ (id)emptyData
{
  v2 = objc_alloc_init(STStatusBarDataAdditionsStatusDomainData);

  return v2;
}

@end