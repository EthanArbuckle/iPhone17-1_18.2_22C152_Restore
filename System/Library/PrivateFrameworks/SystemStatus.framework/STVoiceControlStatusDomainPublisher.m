@interface STVoiceControlStatusDomainPublisher
+ (id)emptyData;
+ (unint64_t)statusDomainName;
@end

@implementation STVoiceControlStatusDomainPublisher

+ (unint64_t)statusDomainName
{
  return 10;
}

+ (id)emptyData
{
  v2 = objc_alloc_init(STVoiceControlStatusDomainData);

  return v2;
}

@end