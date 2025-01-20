@interface STBatteryStatusDomainPublisher
+ (id)emptyData;
+ (unint64_t)statusDomainName;
@end

@implementation STBatteryStatusDomainPublisher

+ (unint64_t)statusDomainName
{
  return 2;
}

+ (id)emptyData
{
  v2 = objc_alloc_init(STBatteryStatusDomainData);

  return v2;
}

@end