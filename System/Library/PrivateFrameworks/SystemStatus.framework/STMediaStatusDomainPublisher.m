@interface STMediaStatusDomainPublisher
+ (id)emptyData;
+ (unint64_t)statusDomainName;
@end

@implementation STMediaStatusDomainPublisher

+ (unint64_t)statusDomainName
{
  return 6;
}

+ (id)emptyData
{
  v2 = objc_alloc_init(STMediaStatusDomainData);

  return v2;
}

@end