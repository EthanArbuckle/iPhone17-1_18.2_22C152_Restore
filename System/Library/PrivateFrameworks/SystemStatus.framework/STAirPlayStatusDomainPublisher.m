@interface STAirPlayStatusDomainPublisher
+ (id)emptyData;
+ (unint64_t)statusDomainName;
@end

@implementation STAirPlayStatusDomainPublisher

+ (unint64_t)statusDomainName
{
  return 0;
}

+ (id)emptyData
{
  v2 = objc_alloc_init(STAirPlayStatusDomainData);

  return v2;
}

@end