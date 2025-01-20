@interface NSData(DERItem)
+ (uint64_t)dataWithDERItem:()DERItem;
@end

@implementation NSData(DERItem)

+ (uint64_t)dataWithDERItem:()DERItem
{
  return [MEMORY[0x1E4F1C9B8] dataWithBytes:*a3 length:a3[1]];
}

@end