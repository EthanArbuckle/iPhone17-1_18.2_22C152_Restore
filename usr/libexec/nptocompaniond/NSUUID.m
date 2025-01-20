@interface NSUUID
+ (id)npto_photosMemoriesSyncCapability;
- (id)npto_data;
@end

@implementation NSUUID

+ (id)npto_photosMemoriesSyncCapability
{
  id v2 = [objc_alloc((Class)NSUUID) initWithUUIDString:@"AD784C80-650B-11EB-8572-0800200C9A66"];

  return v2;
}

- (id)npto_data
{
  v4[0] = 0;
  v4[1] = 0;
  [(NSUUID *)self getUUIDBytes:v4];
  id v2 = +[NSData dataWithBytes:v4 length:16];

  return v2;
}

@end