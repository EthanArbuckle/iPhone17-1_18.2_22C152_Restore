@interface STWifiStatusDomainPublisher
+ (id)emptyData;
+ (unint64_t)statusDomainName;
@end

@implementation STWifiStatusDomainPublisher

+ (unint64_t)statusDomainName
{
  return 11;
}

+ (id)emptyData
{
  v2 = objc_alloc_init(STWifiStatusDomainData);

  return v2;
}

@end