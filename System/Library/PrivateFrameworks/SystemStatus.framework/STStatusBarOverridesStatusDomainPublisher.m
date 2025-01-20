@interface STStatusBarOverridesStatusDomainPublisher
+ (id)emptyData;
+ (unint64_t)statusDomainName;
@end

@implementation STStatusBarOverridesStatusDomainPublisher

+ (unint64_t)statusDomainName
{
  return 13;
}

+ (id)emptyData
{
  v2 = objc_alloc_init(STStatusBarOverridesStatusDomainData);

  return v2;
}

@end