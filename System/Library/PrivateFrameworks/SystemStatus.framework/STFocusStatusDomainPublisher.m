@interface STFocusStatusDomainPublisher
+ (id)emptyData;
+ (unint64_t)statusDomainName;
@end

@implementation STFocusStatusDomainPublisher

+ (unint64_t)statusDomainName
{
  return 4;
}

+ (id)emptyData
{
  v2 = objc_alloc_init(STFocusStatusDomainData);

  return v2;
}

@end