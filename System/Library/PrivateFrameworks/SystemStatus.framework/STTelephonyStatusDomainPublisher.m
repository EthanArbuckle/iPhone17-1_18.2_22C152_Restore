@interface STTelephonyStatusDomainPublisher
+ (id)emptyData;
+ (unint64_t)statusDomainName;
@end

@implementation STTelephonyStatusDomainPublisher

+ (unint64_t)statusDomainName
{
  return 9;
}

+ (id)emptyData
{
  v2 = objc_alloc_init(STTelephonyStatusDomainData);

  return v2;
}

@end