@interface NSString(HexUtil)
- (id)numberFromHexDigits;
@end

@implementation NSString(HexUtil)

- (id)numberFromHexDigits
{
  v2 = (void *)[a1 length];
  if (v2)
  {
    uint64_t v6 = 0;
    v3 = [MEMORY[0x1E4F28FE8] scannerWithString:a1];
    int v4 = [v3 scanHexLongLong:&v6];

    v2 = 0;
    if (v4)
    {
      v2 = [NSNumber numberWithUnsignedLongLong:v6];
    }
  }
  return v2;
}

@end