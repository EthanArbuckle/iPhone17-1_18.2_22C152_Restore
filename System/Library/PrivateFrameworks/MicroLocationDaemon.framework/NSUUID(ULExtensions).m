@interface NSUUID(ULExtensions)
+ (id)nilUUID;
- (uint64_t)isNilUUID;
@end

@implementation NSUUID(ULExtensions)

+ (id)nilUUID
{
  v0 = (void *)[objc_alloc(MEMORY[0x263F08C38]) initWithUUIDString:@"00000000-0000-0000-0000-000000000000"];
  return v0;
}

- (uint64_t)isNilUUID
{
  v2 = [MEMORY[0x263F08C38] nilUUID];
  uint64_t v3 = [a1 isEqual:v2];

  return v3;
}

@end