@interface NSData(DERItem)
+ (uint64_t)dataWithDERItem:()DERItem;
- (uint64_t)DERItem;
- (uint64_t)isEqualToDERItem:()DERItem;
@end

@implementation NSData(DERItem)

+ (uint64_t)dataWithDERItem:()DERItem
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

- (uint64_t)isEqualToDERItem:()DERItem
{
  return [a1 ses_isEqualToBytes:*a3 length:a3[1]];
}

@end