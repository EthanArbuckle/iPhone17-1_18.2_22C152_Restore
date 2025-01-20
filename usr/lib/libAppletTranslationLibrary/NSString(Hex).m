@interface NSString(Hex)
+ (id)hexStringFromBytes:()Hex length:;
+ (uint64_t)hexStringFromDER:()Hex;
- (uint64_t)hexStringAsData;
@end

@implementation NSString(Hex)

+ (id)hexStringFromBytes:()Hex length:
{
  v4 = [MEMORY[0x1E4F1C9B8] dataWithBytesNoCopy:a3 length:a4 freeWhenDone:0];
  v5 = [v4 asHexString];

  return v5;
}

+ (uint64_t)hexStringFromDER:()Hex
{
  return [NSString hexStringFromBytes:*a3 length:a3[1]];
}

- (uint64_t)hexStringAsData
{
  return [MEMORY[0x1E4F1C9B8] dataWithHexString:a1];
}

@end