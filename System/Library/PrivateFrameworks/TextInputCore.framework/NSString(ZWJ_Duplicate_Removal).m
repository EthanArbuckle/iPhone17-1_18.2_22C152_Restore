@interface NSString(ZWJ_Duplicate_Removal)
- (id)stringRemovingDoubleZWJ;
- (uint64_t)hasDoubleZWJ;
@end

@implementation NSString(ZWJ_Duplicate_Removal)

- (id)stringRemovingDoubleZWJ
{
  v2 = objc_msgSend(MEMORY[0x1E4F28E78], "stringWithCapacity:", objc_msgSend(a1, "length"));
  if ([a1 length])
  {
    unint64_t v3 = 0;
    unsigned int v4 = 0;
    do
    {
      unsigned int v5 = [a1 characterAtIndex:v3];
      unsigned int v6 = v5;
      if (v4 != 8205 || v5 != 8205) {
        objc_msgSend(v2, "appendFormat:", @"%C", v5);
      }
      ++v3;
      unsigned int v4 = v6;
    }
    while (v3 < [a1 length]);
  }
  v7 = [NSString stringWithString:v2];

  return v7;
}

- (uint64_t)hasDoubleZWJ
{
  uint64_t result = [a1 length];
  if (result)
  {
    unint64_t v3 = 0;
    int v4 = 0;
    while (1)
    {
      int v5 = [a1 characterAtIndex:v3];
      int v6 = v5;
      BOOL v7 = v4 == 8205 && v5 == 8205;
      uint64_t result = v7;
      if (v7) {
        break;
      }
      ++v3;
      int v4 = v6;
      if (v3 >= [a1 length]) {
        return 0;
      }
    }
  }
  return result;
}

@end