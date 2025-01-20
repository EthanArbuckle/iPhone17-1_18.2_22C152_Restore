@interface NSUUID(Data)
+ (id)ses_withData:()Data;
+ (id)ses_withUUIDString:()Data;
- (id)ses_toData;
@end

@implementation NSUUID(Data)

+ (id)ses_withData:()Data
{
  v3 = (objc_class *)MEMORY[0x263F08C38];
  id v4 = a3;
  id v5 = [v3 alloc];
  id v6 = v4;
  uint64_t v7 = [v6 bytes];

  v8 = (void *)[v5 initWithUUIDBytes:v7];

  return v8;
}

+ (id)ses_withUUIDString:()Data
{
  v3 = (objc_class *)MEMORY[0x263F08C38];
  id v4 = a3;
  id v5 = (void *)[[v3 alloc] initWithUUIDString:v4];

  return v5;
}

- (id)ses_toData
{
  id v2 = [MEMORY[0x263EFF990] dataWithLength:16];
  [a1 getUUIDBytes:[v2 mutableBytes]];

  return v2;
}

@end