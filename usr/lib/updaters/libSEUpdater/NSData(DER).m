@interface NSData(DER)
+ (uint64_t)dataWithDERItem:()DER;
- (uint64_t)DERItem;
@end

@implementation NSData(DER)

+ (uint64_t)dataWithDERItem:()DER
{
  return [MEMORY[0x263EFF8F8] dataWithBytes:*a3 length:a3[1]];
}

- (uint64_t)DERItem
{
  id v1 = a1;
  uint64_t v2 = [v1 bytes];
  [v1 length];
  return v2;
}

@end